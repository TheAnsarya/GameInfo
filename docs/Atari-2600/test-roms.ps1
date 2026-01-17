# Atari 2600 ROM Testing Script
# Tests Peony disassembly on Good2600 ROM collection

param(
	[string]$RomPath = "C:\Users\me\source\repos\GameInfo\~roms\Good2600 v3.14",
	[string]$OutputDir = "C:\Users\me\source\repos\GameInfo\docs\Atari-2600\test-results",
	[int]$SampleCount = 50
)

$ErrorActionPreference = "Continue"

# Create output directory
if (-not (Test-Path $OutputDir)) {
	New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

Write-Host "🌺 Peony Atari 2600 ROM Test Suite" -ForegroundColor Cyan
Write-Host "ROM Path: $RomPath" -ForegroundColor Gray
Write-Host "Output: $OutputDir" -ForegroundColor Gray
Write-Host "Sample Count: $SampleCount" -ForegroundColor Gray
Write-Host ""

# Define ROM categories
$categories = @{
	"2K" = @()
	"4K" = @()
	"8K_F8" = @()
	"16K_F6" = @()
	"32K_F4" = @()
	"DPC" = @()
	"Other" = @()
}

# Sample ROMs from each size category
$testRoms = @(
	# 2K ROMs (no banking)
	@{ Name = "Air-Sea Battle*"; Category = "2K"; ExpectedSize = 2048 }
	
	# 4K ROMs (no banking)
	@{ Name = "Adventure*"; Category = "4K"; ExpectedSize = 4096 }
	@{ Name = "Asteroids*"; Category = "4K"; ExpectedSize = 4096 }
	
	# 8K F8 banking
	@{ Name = "Ms. Pac-Man*"; Category = "8K_F8"; ExpectedSize = 8192; ExpectedBanks = 2 }
	@{ Name = "Space Invaders*"; Category = "8K_F8"; ExpectedSize = 8192; ExpectedBanks = 2 }
	@{ Name = "Asteroids*"; Category = "8K_F8"; ExpectedSize = 8192; ExpectedBanks = 2 }
	@{ Name = "Centipede*"; Category = "8K_F8"; ExpectedSize = 8192; ExpectedBanks = 2 }
	
	# 16K F6 banking
	@{ Name = "Crystal Castles*"; Category = "16K_F6"; ExpectedSize = 16384; ExpectedBanks = 4 }
	@{ Name = "Jr. Pac-Man*"; Category = "16K_F6"; ExpectedSize = 16384; ExpectedBanks = 4 }
	
	# 32K F4 banking
	@{ Name = "Fatal Run*"; Category = "32K_F4"; ExpectedSize = 32768; ExpectedBanks = 8 }
	
	# DPC (Pitfall II)
	@{ Name = "Pitfall II*"; Category = "DPC"; ExpectedSize = 10495; ExpectedBanks = 2 }
)

# Results tracking
$results = @()
$passed = 0
$failed = 0
$skipped = 0

# Test each ROM
foreach ($romSpec in $testRoms) {
	$pattern = $romSpec.Name
	$category = $romSpec.Category
	
	Write-Host "`n[$category] Testing: $pattern" -ForegroundColor Yellow
	
	# Find matching ROM
	$rom = Get-ChildItem -Path $RomPath -Filter "$pattern.a26" -Recurse | Where-Object {
		$_.Name -notmatch "Hack" -and $_.Name -match "\[!\]"
	} | Select-Object -First 1
	
	if (-not $rom) {
		Write-Host "  ⚠️  Not found, skipping" -ForegroundColor DarkYellow
		$skipped++
		continue
	}
	
	Write-Host "  📁 Found: $($rom.Name)" -ForegroundColor Gray
	
	# Get ROM info
	$infoOutput = & dotnet run --project "C:\Users\me\source\repos\peony\src\Peony.Cli" -- info "$($rom.FullName)" 2>&1
	
	# Parse size and mapper from output
	$size = if ($infoOutput -match "Size\s+│\s+(\d+)\s+bytes") { [int]$Matches[1] } else { 0 }
	$mapper = if ($infoOutput -match "Mapper\s+│\s+(\w+)") { $Matches[1] } else { "Unknown" }
	$banks = if ($infoOutput -match "Banks\s+│\s+(\d+)") { [int]$Matches[1] } else { 1 }
	
	Write-Host "  📊 Size: $size bytes, Mapper: $mapper, Banks: $banks" -ForegroundColor Cyan
	
	# Validate expectations
	$valid = $true
	if ($romSpec.ExpectedSize -and $size -ne $romSpec.ExpectedSize) {
		Write-Host "  ❌ Size mismatch: expected $($romSpec.ExpectedSize), got $size" -ForegroundColor Red
		$valid = $false
	}
	if ($romSpec.ExpectedBanks -and $banks -ne $romSpec.ExpectedBanks) {
		Write-Host "  ❌ Bank count mismatch: expected $($romSpec.ExpectedBanks), got $banks" -ForegroundColor Red
		$valid = $false
	}
	
	# Disassemble
	$outputFile = Join-Path $OutputDir "$($rom.BaseName).asm"
	Write-Host "  🔧 Disassembling..." -ForegroundColor Gray
	
	$disasmOutput = & dotnet run --project "C:\Users\me\source\repos\peony\src\Peony.Cli" -- disasm "$($rom.FullName)" -o "$outputFile" 2>&1
	
	# Check result
	$blocksDisassembled = if ($disasmOutput -match "Disassembled (\d+) blocks") { [int]$Matches[1] } else { 0 }
	
	if ($blocksDisassembled -eq 0 -and $size -gt 0) {
		Write-Host "  ❌ Disassembly failed: 0 blocks" -ForegroundColor Red
		$valid = $false
	} else {
		Write-Host "  ✅ Disassembled $blocksDisassembled blocks" -ForegroundColor Green
	}
	
	# Verify output file
	if (Test-Path $outputFile) {
		$lines = (Get-Content $outputFile).Count
		Write-Host "  📄 Output: $lines lines" -ForegroundColor Gray
		
		if ($lines -lt 10) {
			Write-Host "  ⚠️  Output file too small" -ForegroundColor DarkYellow
			$valid = $false
		}
	} else {
		Write-Host "  ❌ Output file not created" -ForegroundColor Red
		$valid = $false
	}
	
	# Record result
	$result = [PSCustomObject]@{
		ROM = $rom.Name
		Category = $category
		Size = $size
		Mapper = $mapper
		Banks = $banks
		BlocksDisassembled = $blocksDisassembled
		OutputLines = if (Test-Path $outputFile) { (Get-Content $outputFile).Count } else { 0 }
		Status = if ($valid) { "PASS" } else { "FAIL" }
	}
	$results += $result
	
	if ($valid) {
		$passed++
	} else {
		$failed++
	}
}

# Summary
Write-Host "`n" -NoNewline
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "📊 Test Summary" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "Total Tests:  $($results.Count)" -ForegroundColor White
Write-Host "Passed:       " -NoNewline -ForegroundColor White
Write-Host "$passed" -ForegroundColor Green
Write-Host "Failed:       " -NoNewline -ForegroundColor White
Write-Host "$failed" -ForegroundColor Red
Write-Host "Skipped:      $skipped" -ForegroundColor DarkYellow
Write-Host "Pass Rate:    $([math]::Round($passed / $results.Count * 100, 1))%" -ForegroundColor Cyan
Write-Host ""

# Export results
$resultsFile = Join-Path $OutputDir "test-results.csv"
$results | Export-Csv -Path $resultsFile -NoTypeInformation
Write-Host "Results exported to: $resultsFile" -ForegroundColor Gray

# Display detailed results table
Write-Host "`n📋 Detailed Results:" -ForegroundColor Cyan
$results | Format-Table -Property ROM, Category, Mapper, Banks, BlocksDisassembled, Status -AutoSize

# Category breakdown
Write-Host "`n📈 Results by Category:" -ForegroundColor Cyan
$results | Group-Object -Property Category | ForEach-Object {
	$categoryPassed = ($_.Group | Where-Object { $_.Status -eq "PASS" }).Count
	$categoryTotal = $_.Count
	$categoryPercent = [math]::Round($categoryPassed / $categoryTotal * 100, 1)
	
	Write-Host "  $($_.Name): $categoryPassed/$categoryTotal ($categoryPercent%)" -ForegroundColor $(if ($categoryPassed -eq $categoryTotal) { "Green" } else { "Yellow" })
}

Write-Host "`n✅ Testing complete!" -ForegroundColor Green
