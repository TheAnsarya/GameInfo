<#
.SYNOPSIS
    Build script for Secret of Mana project.
.DESCRIPTION
    Extracts assets, converts data, builds ROM, and verifies against original.
.PARAMETER Clean
    Clean build outputs before building.
.PARAMETER ExtractOnly
    Only extract assets, don't build ROM.
.PARAMETER Verify
    Verify built ROM against original.
#>

param(
	[switch]$Clean,
	[switch]$ExtractOnly,
	[switch]$Verify
)

$ErrorActionPreference = "Stop"
$ProjectRoot = $PSScriptRoot
$GameInfoRoot = (Resolve-Path (Join-Path $ProjectRoot "..\..\..")).Path
# Note: Use -LiteralPath with this path since it has brackets
$RomPath = Join-Path $GameInfoRoot "~roms\SNES\GoodSNES\Secret of Mana (U) [!].sfc"
$BuildDir = Join-Path $ProjectRoot "build"
$AssetsDir = Join-Path $ProjectRoot "assets"
$ToolsDir = Join-Path $ProjectRoot "tools"

# Expected SHA256 of original ROM
$ExpectedSha256 = "4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f"

function Write-Header {
	param([string]$Text)
	Write-Host ""
	Write-Host "========================================" -ForegroundColor Cyan
	Write-Host " $Text" -ForegroundColor Cyan
	Write-Host "========================================" -ForegroundColor Cyan
}

function Write-Step {
	param([string]$Text)
	Write-Host "  -> $Text" -ForegroundColor Yellow
}

function Write-Success {
	param([string]$Text)
	Write-Host "  [OK] $Text" -ForegroundColor Green
}

function Write-Error {
	param([string]$Text)
	Write-Host "  [ERROR] $Text" -ForegroundColor Red
}

function Verify-Rom {
	param([string]$RomPath, [string]$ExpectedHash)
    
	if (-not (Test-Path -LiteralPath $RomPath)) {
		return $false
	}
    
	$hash = (Get-FileHash -LiteralPath $RomPath -Algorithm SHA256).Hash.ToLower()
	return $hash -eq $ExpectedHash.ToLower()
}

# Main execution
Write-Header "Secret of Mana Build System"
Write-Host "  Project: $ProjectRoot"
Write-Host "  ROM:     $RomPath"

# Verify original ROM exists
if (-not (Test-Path -LiteralPath $RomPath)) {
	Write-Error "Original ROM not found: $RomPath"
	Write-Host "  Please ensure the ROM file is in the expected location."
	exit 1
}

# Verify original ROM hash
Write-Step "Verifying original ROM..."
if (Verify-Rom -RomPath $RomPath -ExpectedHash $ExpectedSha256) {
	Write-Success "Original ROM verified (SHA256 matches)"
}
else {
	$actualHash = (Get-FileHash -LiteralPath $RomPath -Algorithm SHA256).Hash.ToLower()
	Write-Error "ROM hash mismatch!"
	Write-Host "    Expected: $ExpectedSha256"
	Write-Host "    Actual:   $actualHash"
	exit 1
}

# Clean if requested
if ($Clean) {
	Write-Header "Cleaning Build Outputs"
    
	if (Test-Path $BuildDir) {
		Write-Step "Removing build directory..."
		Remove-Item -Path $BuildDir -Recurse -Force
		Write-Success "Build directory cleaned"
	}
    
	$jsonDir = Join-Path $AssetsDir "json"
	if (Test-Path $jsonDir) {
		Write-Step "Removing extracted JSON..."
		Remove-Item -Path $jsonDir -Recurse -Force
		Write-Success "JSON assets cleaned"
	}
}

# Create directories
Write-Header "Creating Directories"
$dirs = @(
	$BuildDir,
	(Join-Path $AssetsDir "json"),
	(Join-Path $AssetsDir "graphics"),
	(Join-Path $AssetsDir "audio"),
	(Join-Path $AssetsDir "text")
)

foreach ($dir in $dirs) {
	if (-not (Test-Path $dir)) {
		Write-Step "Creating $dir"
		New-Item -ItemType Directory -Path $dir -Force | Out-Null
	}
}
Write-Success "Directories ready"

# Extract assets
Write-Header "Extracting Assets"

# Check for Python
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
	Write-Error "Python not found. Please install Python 3.x"
	exit 1
}

# Copy ROM to temp location (to avoid bracket issues with Python)
$TempRomPath = Join-Path $BuildDir "temp_rom.sfc"
Write-Step "Copying ROM for extraction..."
Copy-Item -LiteralPath $RomPath -Destination $TempRomPath -Force

# Extract data
$extractDataScript = Join-Path $ToolsDir "extract_data.py"
if (Test-Path $extractDataScript) {
	Write-Step "Extracting game data..."
	& python $extractDataScript "$TempRomPath" --output (Join-Path $AssetsDir "json") --all
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Game data extracted"
	}
 else {
		Write-Error "Data extraction failed"
	}
}

# Extract text
$extractTextScript = Join-Path $ToolsDir "extract_text.py"
if (Test-Path $extractTextScript) {
	Write-Step "Extracting text..."
	& python $extractTextScript --rom "$TempRomPath" --output (Join-Path $AssetsDir "text") --export-table
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Text data extracted"
	}
 else {
		Write-Error "Text extraction failed"
	}
}

# Extract graphics (if PIL available)
$extractGraphicsScript = Join-Path $ToolsDir "extract_graphics.py"
if (Test-Path $extractGraphicsScript) {
	Write-Step "Extracting graphics..."
	& python $extractGraphicsScript --rom "$TempRomPath" --output (Join-Path $AssetsDir "graphics")
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Graphics extracted"
	}
 else {
		Write-Host "    (Graphics extraction may require PIL/Pillow)" -ForegroundColor DarkYellow
	}
}

# Extract audio
$extractAudioScript = Join-Path $ToolsDir "extract_audio.py"
if (Test-Path $extractAudioScript) {
	Write-Step "Extracting audio data..."
	& python $extractAudioScript --rom "$TempRomPath" --output (Join-Path $AssetsDir "audio")
	if ($LASTEXITCODE -eq 0) {
		Write-Success "Audio data extracted"
	}
 else {
		Write-Error "Audio extraction failed"
	}
}

if ($ExtractOnly) {
	Write-Header "Extraction Complete"
	Write-Host "  Assets extracted to: $AssetsDir"
	exit 0
}

# Build ROM (placeholder - actual assembly would go here)
Write-Header "Building ROM"
Write-Step "ROM building not yet implemented"
Write-Host "    Future: Assemble source files and reinsert assets"

# Copy original as placeholder
$builtRom = Join-Path $BuildDir "secret_of_mana.sfc"
Write-Step "Copying original ROM as placeholder..."
Copy-Item -Path $RomPath -Destination $builtRom -Force
Write-Success "ROM copied to build directory"

# Verify if requested
if ($Verify) {
	Write-Header "Verification"
	Write-Step "Verifying built ROM..."
    
	if (Verify-Rom -RomPath $builtRom -ExpectedHash $ExpectedSha256) {
		Write-Success "Built ROM matches original!"
	}
 else {
		Write-Error "Built ROM differs from original"
		exit 1
	}
}

Write-Header "Build Complete"
Write-Host ""
Write-Host "  Output: $builtRom" -ForegroundColor Green
Write-Host ""
