<#
.SYNOPSIS
Regenerates official.json by scanning every metadata.json under this
repo and copying its contents into the "Scripts" array. Each entry's
"File" field -- and every "File" inside its optional "Versions" list of
still-installable older builds -- is rewritten into the raw GitHub
download URL for that file, derived from the repo's own "origin" remote
and current branch.

All metadata.json files are read once into memory, the array is built
up there, and official.json is (re)written once at the end.
#>

$ErrorActionPreference = 'Stop'

$RepoRoot = $PSScriptRoot
$OfficialJsonPath = Join-Path $RepoRoot 'official.json'

try {
    $remoteUrl = (git -C $RepoRoot config --get remote.origin.url 2>$null | Out-String).Trim()
} catch {
    $remoteUrl = $null
}
if (-not $remoteUrl) {
    throw "Could not read the 'origin' remote URL from git."
}

# Normalizes any of the common remote URL shapes down to "owner/repo":
#   git@github.com:owner/repo.git
#   ssh://git@github.com/owner/repo.git
#   https://github.com/owner/repo.git
$ownerRepo = $remoteUrl.Trim()
$ownerRepo = $ownerRepo -replace '^git@([^:]+):', 'https://$1/'
$ownerRepo = $ownerRepo -replace '^ssh://git@', 'https://'
$ownerRepo = $ownerRepo -replace '\.git/?$', ''
$ownerRepo = $ownerRepo -replace '^https?://[^/]+/', ''

try {
    $branch = (git -C $RepoRoot branch --show-current 2>$null | Out-String).Trim()
} catch {
    $branch = $null
}
if (-not $branch) { $branch = $env:GITHUB_REF_NAME }
if (-not $branch) {
    throw "Could not determine the current git branch (detached HEAD?). Check out a branch, or set GITHUB_REF_NAME."
}

function ConvertTo-UrlPath {
    param([string]$Path)
    ($Path -split '/' | ForEach-Object { [Uri]::EscapeDataString($_) }) -join '/'
}

# The download URL for a path a metadata.json names, resolved relative to the
# directory that metadata.json sits in. Used for the entry's own "File" and for
# every older build listed in "Versions".
function Get-RawUrl {
    param([string]$MetaDir, [string]$File)
    $full = [System.IO.Path]::GetFullPath((Join-Path $MetaDir $File))
    $relative = [System.IO.Path]::GetRelativePath($RepoRoot, $full) -replace '\\', '/'
    "https://github.com/$ownerRepo/raw/$branch/$(ConvertTo-UrlPath $relative)"
}

$metadataFiles = Get-ChildItem -LiteralPath $RepoRoot -Recurse -File -Filter 'metadata.json' |
    Where-Object { $_.FullName -notmatch '(?:^|[\\/])\.git(?:[\\/]|$)' } |
    Sort-Object FullName

$scripts = @()

foreach ($metaFile in $metadataFiles) {
    $data = Get-Content -LiteralPath $metaFile.FullName -Raw | ConvertFrom-Json

    $metaDir = $metaFile.DirectoryName
    $data.File = Get-RawUrl $metaDir $data.File

    # "Versions" lists the builds still installable, newest first. Each gets the
    # same rewrite as the entry's own File, so the app can download an older
    # version by URL exactly as it does the newest. Re-wrapped in @() because a
    # one-element array would otherwise serialize as a bare object.
    if ($data.PSObject.Properties['Versions']) {
        foreach ($version in $data.Versions) { $version.File = Get-RawUrl $metaDir $version.File }
        $data.Versions = @($data.Versions)
    }

    $scripts += $data
}

$name = 'Official GAP'
if (Test-Path -LiteralPath $OfficialJsonPath) {
    try {
        $existing = Get-Content -LiteralPath $OfficialJsonPath -Raw | ConvertFrom-Json
        if ($existing.Name) { $name = $existing.Name }
    } catch {}
}

$updated = [DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ')

$result = [ordered]@{
    Name    = $name
    Updated = $updated
    Scripts = @($scripts)
}

$jsonText = $result | ConvertTo-Json -Depth 20
[System.IO.File]::WriteAllText($OfficialJsonPath, $jsonText, (New-Object System.Text.UTF8Encoding($false)))

Write-Host "Wrote $($scripts.Count) script(s) to $OfficialJsonPath"
