# Multi-language Sphinx build script
# Builds EN, PT, ES documentation and a root landing page
param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$rootDir = Split-Path -Parent $PSScriptRoot
$sourceDir = Join-Path $rootDir "source"
$buildDir = Join-Path $rootDir "_build"
$htmlDir = Join-Path $buildDir "html"
$notebooksDir = Join-Path (Split-Path -Parent $rootDir) ".." "notebooks"

# Resolve to absolute
$notebooksDir = Resolve-Path $notebooksDir

if ($Clean) {
    Write-Host "Cleaning build directory..." -ForegroundColor Yellow
    if (Test-Path $buildDir) {
        Remove-Item -Recurse -Force $buildDir
    }
    Write-Host "Done." -ForegroundColor Green
}

# Ensure build directory exists
New-Item -ItemType Directory -Force -Path $htmlDir | Out-Null

# ---------- Step 1: Copy notebooks to language source dirs ----------
Write-Host "`n=== Copying notebooks to source directories ===" -ForegroundColor Cyan
$langs = @("en", "pt", "es")
foreach ($lang in $langs) {
    $srcNotebooks = Join-Path $notebooksDir $lang
    $dstSource = Join-Path $sourceDir $lang
    
    Write-Host "  $lang`: $srcNotebooks -> $dstSource"
    
    # Remove old notebooks
    Get-ChildItem -Path $dstSource -Filter "*.ipynb" -ErrorAction SilentlyContinue | Remove-Item -Force
    
    # Copy notebooks
    Get-ChildItem -Path $srcNotebooks -Filter "*.ipynb" | ForEach-Object {
        Copy-Item $_.FullName (Join-Path $dstSource $_.Name)
    }
    Write-Host "    Copied $(@(Get-ChildItem $dstSource -Filter '*.ipynb').Count) notebooks" -ForegroundColor Green
}

# ---------- Step 2: Build root landing page ----------
Write-Host "`n=== Building root landing page ===" -ForegroundColor Cyan
$env:SPHINX_ROOT_BUILD = "1"
sphinx-build -b html $sourceDir (Join-Path $htmlDir "") @args
Write-Host "  Root landing page built." -ForegroundColor Green

# ---------- Step 3: Build each language ----------
foreach ($lang in $langs) {
    Write-Host "`n=== Building $lang documentation ===" -ForegroundColor Cyan
    $env:SPHINX_ROOT_BUILD = "0"
    $env:SPHINX_LANG = $lang
    
    # Use the language subdirectory as the source
    $langSource = Join-Path $sourceDir $lang
    $langOutput = Join-Path $htmlDir $lang
    
    # Use -c to point to the parent conf.py, source is the language subdir
    sphinx-build -b html -c $sourceDir $langSource $langOutput @args
    Write-Host "  $lang built to $langOutput" -ForegroundColor Green
}

# ---------- Step 4: Cleanup env vars ----------
Remove-Item Env:\SPHINX_LANG -ErrorAction SilentlyContinue
Remove-Item Env:\SPHINX_ROOT_BUILD -ErrorAction SilentlyContinue

Write-Host "`n=== Build complete ===" -ForegroundColor Green
Write-Host "Output: $htmlDir"
Write-Host "  /         -> Landing page (language selector)"
Write-Host "  /en/      -> English"
Write-Host "  /pt/      -> Português"
Write-Host "  /es/      -> Español"
