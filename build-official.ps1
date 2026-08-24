<#
.SYNOPSIS
Regenerates official.json by scanning every metadata.json under this
repo and copying its contents into the "Scripts" array. Each entry's
"File" field is rewritten into the raw GitHub download URL for that
file, derived from the repo's own "origin" remote and current branch.

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

$metadataFiles = Get-ChildItem -LiteralPath $RepoRoot -Recurse -File -Filter 'metadata.json' |
    Where-Object { $_.FullName -notmatch '(?:^|[\\/])\.git(?:[\\/]|$)' } |
    Sort-Object FullName

$scripts = @()

foreach ($metaFile in $metadataFiles) {
    $data = Get-Content -LiteralPath $metaFile.FullName -Raw | ConvertFrom-Json

    $metaDir = $metaFile.DirectoryName
    $fullTargetPath = [System.IO.Path]::GetFullPath((Join-Path $metaDir $data.File))
    $relativePath = [System.IO.Path]::GetRelativePath($RepoRoot, $fullTargetPath) -replace '\\', '/'

    $data.File = "https://github.com/$ownerRepo/raw/$branch/$(ConvertTo-UrlPath $relativePath)"
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
