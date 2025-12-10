$ErrorActionPreference = "Stop"

# This script generates README.md from all section Markdown files.
# Usage:
#   powershell -ExecutionPolicy Bypass -File .\generate_readme.ps1

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

# Target only files like 00_*.md, 01_*.md, ...
$sectionFiles = Get-ChildItem -Path . -File |
    Where-Object { $_.Name -match '^\d{2}_.*\.md$' } |
    Sort-Object Name

if (-not $sectionFiles) {
    Write-Error "No section markdown files (like 00_*.md) were found."
    exit 1
}

$readmePath = Join-Path $root "README.md"

$headerLines = @(
    "# 4bit Town Rulebook",
    "",
    "> This README.md is generated from section markdown files (00_*.md – 11_*.md).",
    "> Do not edit README.md directly. Edit the section files and rerun `generate_readme.ps1`.",
    ""
)

$headerLines | Set-Content -Path $readmePath -Encoding utf8

foreach ($file in $sectionFiles) {
    @(
        "",
        "---",
        "",
        "<!-- " + $file.Name + " -->"
    ) | Add-Content -Path $readmePath -Encoding utf8

    # Read section files explicitly as UTF-8 to avoid mojibake
    Get-Content -Path $file.FullName -Encoding utf8 |
        Add-Content -Path $readmePath -Encoding utf8
}

Write-Output "README.md has been updated."
