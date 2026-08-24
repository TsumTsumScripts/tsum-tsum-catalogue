<#
.SYNOPSIS
Regenerates official.json by scanning every metadata.json under this
repo and copying its contents into the "Scripts" array. Each entry's
"File" field is rewritten from a path relative to its own metadata.json
into a path relative to official.json.

All metadata.json files are read once into memory, the array is built
up there, and official.json is (re)written once at the end.
#>

$ErrorActionPreference = 'Stop'

$RepoRoot = $PSScriptRoot
$OfficialJsonPath = Join-Path $RepoRoot 'official.json'

$metadataFiles = Get-ChildItem -LiteralPath $RepoRoot -Recurse -File -Filter 'metadata.json' |
    Where-Object { $_.FullName -notmatch '(?:^|[\\/])\.git(?:[\\/]|$)' } |
    Sort-Object FullName

$scripts = @()

foreach ($metaFile in $metadataFiles) {
    $data = Get-Content -LiteralPath $metaFile.FullName -Raw | ConvertFrom-Json

    $metaDir = $metaFile.DirectoryName
    $fullTargetPath = [System.IO.Path]::GetFullPath((Join-Path $metaDir $data.File))
    $relativePath = [System.IO.Path]::GetRelativePath($RepoRoot, $fullTargetPath) -replace '\\', '/'

    $data.File = $relativePath
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
