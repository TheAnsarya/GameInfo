# 🔄 Full Roundtrip Integration Test

> **Purpose:** Verify the complete Peony → Poppy → identical ROM workflow  
> **Last Updated:** 2026-01-19 20:00 UTC  
> **Estimated Time:** 2-3 hours  
> **Priority:** CRITICAL - This is the core promise of the toolchain

---

## Overview

The **roundtrip guarantee** is the fundamental promise of the Peony/Poppy toolchain:

```
Original ROM → Peony (disassemble) → .pasm source → Poppy (assemble) → Rebuilt ROM
                                                                           ↓
                                                            MUST BE IDENTICAL
```

If this test fails, the toolchain is not production-ready.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Test Setup](#2-test-setup)
3. [NES Roundtrip Tests](#3-nes-roundtrip-tests)
4. [SNES Roundtrip Tests](#4-snes-roundtrip-tests)
5. [Automated Test Script](#5-automated-test-script)
6. [Troubleshooting](#6-troubleshooting)
7. [Results Documentation](#7-results-documentation)

---

## 1. Prerequisites

### Required Repositories Built
- [ ] Peony built and working (`dotnet build Peony.sln`)
- [ ] Poppy built and working (`dotnet build Poppy.sln`)
- [ ] Pansy built and working (`dotnet build Pansy.sln`)

### Required Test ROMs
- [ ] Dragon Warrior IV (NES) - `dragon-warrior-4.nes`
- [ ] Dragon Warrior (NES) - `dragon-warrior.nes`
- [ ] Final Fantasy Mystic Quest (SNES) - `ffmq.sfc`
- [ ] At least one homebrew NES ROM
- [ ] At least one homebrew SNES ROM

### Directory Structure

```powershell
# Create test directories
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\snes" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\results" -Force
```

---

## 2. Test Setup

### 2.1 Create Comparison Script

Save as `C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\compare-roms.ps1`:

```powershell
# compare-roms.ps1
# Compares two ROM files byte-by-byte

param(
    [Parameter(Mandatory=$true)]
    [string]$Original,
    
    [Parameter(Mandatory=$true)]
    [string]$Rebuilt,
    
    [int]$MaxDiffs = 10,
    
    [switch]$Detailed
)

Write-Host "`n📊 ROM Comparison Tool" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

# Check files exist
if (-not (Test-Path $Original)) {
    Write-Host "❌ Original file not found: $Original" -ForegroundColor Red
    exit 1
}
if (-not (Test-Path $Rebuilt)) {
    Write-Host "❌ Rebuilt file not found: $Rebuilt" -ForegroundColor Red
    exit 1
}

# Read files
$origBytes = [System.IO.File]::ReadAllBytes($Original)
$rebBytes = [System.IO.File]::ReadAllBytes($Rebuilt)

Write-Host "`nOriginal: $Original"
Write-Host "  Size: $($origBytes.Length) bytes"
Write-Host "`nRebuilt: $Rebuilt"
Write-Host "  Size: $($rebBytes.Length) bytes"

# Size check
if ($origBytes.Length -ne $rebBytes.Length) {
    Write-Host "`n❌ SIZE MISMATCH!" -ForegroundColor Red
    Write-Host "  Original: $($origBytes.Length)"
    Write-Host "  Rebuilt:  $($rebBytes.Length)"
    Write-Host "  Difference: $($rebBytes.Length - $origBytes.Length) bytes"
    exit 1
}

# Byte-by-byte comparison
$differences = @()
for ($i = 0; $i -lt $origBytes.Length; $i++) {
    if ($origBytes[$i] -ne $rebBytes[$i]) {
        $differences += [PSCustomObject]@{
            Offset = $i
            Original = $origBytes[$i]
            Rebuilt = $rebBytes[$i]
        }
    }
}

if ($differences.Count -eq 0) {
    Write-Host "`n✅ PERFECT MATCH!" -ForegroundColor Green
    Write-Host "   Files are byte-identical" -ForegroundColor Green
    exit 0
} else {
    Write-Host "`n❌ DIFFERENCES FOUND: $($differences.Count)" -ForegroundColor Red
    
    if ($Detailed) {
        Write-Host "`nFirst $MaxDiffs differences:" -ForegroundColor Yellow
        $differences | Select-Object -First $MaxDiffs | ForEach-Object {
            Write-Host ("  Offset: 0x{0:X6}  Original: 0x{1:X2}  Rebuilt: 0x{2:X2}" -f $_.Offset, $_.Original, $_.Rebuilt)
        }
        
        if ($differences.Count -gt $MaxDiffs) {
            Write-Host "  ... and $($differences.Count - $MaxDiffs) more differences" -ForegroundColor Yellow
        }
    }
    
    # Analyze difference regions
    Write-Host "`nDifference regions:" -ForegroundColor Yellow
    $regionStart = $differences[0].Offset
    $regionEnd = $regionStart
    
    foreach ($diff in $differences[1..$differences.Count]) {
        if ($diff.Offset -eq $regionEnd + 1) {
            $regionEnd = $diff.Offset
        } else {
            Write-Host ("  0x{0:X6} - 0x{1:X6} ({2} bytes)" -f $regionStart, $regionEnd, ($regionEnd - $regionStart + 1))
            $regionStart = $diff.Offset
            $regionEnd = $diff.Offset
        }
    }
    Write-Host ("  0x{0:X6} - 0x{1:X6} ({2} bytes)" -f $regionStart, $regionEnd, ($regionEnd - $regionStart + 1))
    
    exit 1
}
```

### 2.2 Create CRC32 Helper

Save as `C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\get-crc32.ps1`:

```powershell
# get-crc32.ps1
param([string]$Path)

$crc32 = [System.IO.Hashing.Crc32]::new()
$bytes = [System.IO.File]::ReadAllBytes($Path)
$crc32.Append($bytes)
$hash = $crc32.GetCurrentHash()
[Array]::Reverse($hash)
[BitConverter]::ToString($hash).Replace("-", "").ToLower()
```

---

## 3. NES Roundtrip Tests

### 3.1 Dragon Warrior IV Complete Test

```powershell
Write-Host "🐉 Dragon Warrior IV Roundtrip Test" -ForegroundColor Cyan
Write-Host "====================================`n" -ForegroundColor Cyan

$testDir = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes"
$originalRom = "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes"
$disasmOutput = "$testDir\dw4-disasm.pasm"
$rebuiltRom = "$testDir\dw4-rebuilt.nes"
$pansyFile = "$testDir\dw4.pansy"

# Step 1: Record original CRC
Write-Host "📝 Step 1: Recording original CRC32..." -ForegroundColor Yellow
$originalCrc = & "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\get-crc32.ps1" $originalRom
Write-Host "   Original CRC: $originalCrc"

# Step 2: Disassemble with Peony
Write-Host "`n📝 Step 2: Disassembling with Peony..." -ForegroundColor Yellow
Push-Location "C:\Users\me\source\repos\peony"
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run --project src/Peony.Cli -- disasm `
    $originalRom `
    --platform nes `
    --output $disasmOutput `
    --pansy $pansyFile

$timer.Stop()
Write-Host "   Disassembly time: $($timer.Elapsed.TotalSeconds) seconds"
Pop-Location

if (-not (Test-Path $disasmOutput)) {
    Write-Host "❌ Disassembly failed - no output file" -ForegroundColor Red
    exit 1
}
Write-Host "   Output: $disasmOutput"
Write-Host "   Pansy: $pansyFile"

# Step 3: Assemble with Poppy
Write-Host "`n📝 Step 3: Assembling with Poppy..." -ForegroundColor Yellow
Push-Location "C:\Users\me\source\repos\poppy"
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run --project src/Poppy.Cli -- assemble `
    $disasmOutput `
    --output $rebuiltRom

$timer.Stop()
Write-Host "   Assembly time: $($timer.Elapsed.TotalSeconds) seconds"
Pop-Location

if (-not (Test-Path $rebuiltRom)) {
    Write-Host "❌ Assembly failed - no output file" -ForegroundColor Red
    exit 1
}

# Step 4: Compare
Write-Host "`n📝 Step 4: Comparing ROMs..." -ForegroundColor Yellow
$rebuiltCrc = & "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\get-crc32.ps1" $rebuiltRom
Write-Host "   Rebuilt CRC: $rebuiltCrc"

& "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\compare-roms.ps1" `
    -Original $originalRom `
    -Rebuilt $rebuiltRom `
    -Detailed
```

**Expected result:** ✅ PERFECT MATCH!

### 3.2 Dragon Warrior (Original) Test

```powershell
Write-Host "🐉 Dragon Warrior I Roundtrip Test" -ForegroundColor Cyan

$originalRom = "C:\Users\me\source\repos\roms\nes\dragon-warrior.nes"
$disasmOutput = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes\dw1-disasm.pasm"
$rebuiltRom = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes\dw1-rebuilt.nes"

# Disassemble
Push-Location "C:\Users\me\source\repos\peony"
dotnet run --project src/Peony.Cli -- disasm $originalRom --platform nes --output $disasmOutput
Pop-Location

# Assemble
Push-Location "C:\Users\me\source\repos\poppy"
dotnet run --project src/Poppy.Cli -- assemble $disasmOutput --output $rebuiltRom
Pop-Location

# Compare
& "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\compare-roms.ps1" `
    -Original $originalRom -Rebuilt $rebuiltRom -Detailed
```

### 3.3 NES Homebrew Test

Test with a simple homebrew ROM to verify basic functionality:

```powershell
# Use any homebrew NES ROM
$originalRom = "C:\Users\me\source\repos\roms\homebrew\test-homebrew.nes"
$disasmOutput = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes\homebrew-disasm.pasm"
$rebuiltRom = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\nes\homebrew-rebuilt.nes"

# Same process...
```

---

## 4. SNES Roundtrip Tests

### 4.1 Final Fantasy Mystic Quest Test

```powershell
Write-Host "⚔️ FFMQ Roundtrip Test" -ForegroundColor Cyan
Write-Host "======================`n" -ForegroundColor Cyan

$testDir = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\snes"
$originalRom = "C:\Users\me\source\repos\roms\snes\ffmq.sfc"
$disasmOutput = "$testDir\ffmq-disasm.pasm"
$rebuiltRom = "$testDir\ffmq-rebuilt.sfc"
$pansyFile = "$testDir\ffmq.pansy"

# Step 1: Disassemble
Write-Host "📝 Step 1: Disassembling FFMQ..." -ForegroundColor Yellow
Push-Location "C:\Users\me\source\repos\peony"
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run --project src/Peony.Cli -- disasm `
    $originalRom `
    --platform snes `
    --mapping lorom `
    --output $disasmOutput `
    --pansy $pansyFile

$timer.Stop()
Write-Host "   Time: $($timer.Elapsed.TotalSeconds) seconds"
Pop-Location

# Step 2: Assemble
Write-Host "`n📝 Step 2: Assembling with Poppy..." -ForegroundColor Yellow
Push-Location "C:\Users\me\source\repos\poppy"
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run --project src/Poppy.Cli -- assemble `
    $disasmOutput `
    --output $rebuiltRom

$timer.Stop()
Write-Host "   Time: $($timer.Elapsed.TotalSeconds) seconds"
Pop-Location

# Step 3: Compare
Write-Host "`n📝 Step 3: Comparing..." -ForegroundColor Yellow
& "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\compare-roms.ps1" `
    -Original $originalRom `
    -Rebuilt $rebuiltRom `
    -Detailed
```

---

## 5. Automated Test Script

Save as `C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\run-all-roundtrip-tests.ps1`:

```powershell
# run-all-roundtrip-tests.ps1
# Runs all roundtrip tests and generates report

param(
    [string]$ReportPath = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\results"
)

$ErrorActionPreference = "Continue"
$timestamp = Get-Date -Format "yyyy-MM-dd-HHmm"
$reportFile = "$ReportPath\roundtrip-report-$timestamp.md"

# Initialize report
@"
# Roundtrip Test Report
Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

## Test Environment
- Peony Version: $(dotnet run --project C:\Users\me\source\repos\peony\src\Peony.Cli -- --version 2>$null)
- Poppy Version: $(dotnet run --project C:\Users\me\source\repos\poppy\src\Poppy.Cli -- --version 2>$null)
- .NET Version: $(dotnet --version)

## Results

| ROM | Platform | Size | Result | Time |
|-----|----------|------|--------|------|
"@ | Out-File $reportFile

$tests = @(
    @{
        Name = "Dragon Warrior IV"
        Rom = "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes"
        Platform = "nes"
        Mapping = ""
    },
    @{
        Name = "Dragon Warrior I"
        Rom = "C:\Users\me\source\repos\roms\nes\dragon-warrior.nes"
        Platform = "nes"
        Mapping = ""
    },
    @{
        Name = "FFMQ"
        Rom = "C:\Users\me\source\repos\roms\snes\ffmq.sfc"
        Platform = "snes"
        Mapping = "--mapping lorom"
    }
)

$passed = 0
$failed = 0

foreach ($test in $tests) {
    if (-not (Test-Path $test.Rom)) {
        Write-Host "⏭️ Skipping $($test.Name) - ROM not found" -ForegroundColor Yellow
        "| $($test.Name) | $($test.Platform) | N/A | SKIPPED | N/A |" | Add-Content $reportFile
        continue
    }
    
    Write-Host "`n🧪 Testing: $($test.Name)" -ForegroundColor Cyan
    
    $romSize = (Get-Item $test.Rom).Length
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($test.Rom)
    $testDir = "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\$($test.Platform)"
    $disasm = "$testDir\$baseName-disasm.pasm"
    $rebuilt = "$testDir\$baseName-rebuilt.$([System.IO.Path]::GetExtension($test.Rom).TrimStart('.'))"
    
    $timer = [System.Diagnostics.Stopwatch]::StartNew()
    
    # Disassemble
    Push-Location "C:\Users\me\source\repos\peony"
    $mapping = if ($test.Mapping) { $test.Mapping } else { "" }
    $disasmArgs = @("disasm", $test.Rom, "--platform", $test.Platform, "--output", $disasm)
    if ($mapping) { $disasmArgs += $mapping.Split(" ") }
    & dotnet run --project src/Peony.Cli -- @disasmArgs 2>&1 | Out-Null
    Pop-Location
    
    # Assemble
    Push-Location "C:\Users\me\source\repos\poppy"
    & dotnet run --project src/Poppy.Cli -- assemble $disasm --output $rebuilt 2>&1 | Out-Null
    Pop-Location
    
    $timer.Stop()
    $elapsed = "{0:N1}s" -f $timer.Elapsed.TotalSeconds
    
    # Compare
    if (-not (Test-Path $rebuilt)) {
        Write-Host "❌ $($test.Name): Build failed" -ForegroundColor Red
        "| $($test.Name) | $($test.Platform) | $romSize | ❌ BUILD FAILED | $elapsed |" | Add-Content $reportFile
        $failed++
        continue
    }
    
    $origBytes = [System.IO.File]::ReadAllBytes($test.Rom)
    $rebBytes = [System.IO.File]::ReadAllBytes($rebuilt)
    
    if ($origBytes.Length -ne $rebBytes.Length) {
        Write-Host "❌ $($test.Name): Size mismatch" -ForegroundColor Red
        "| $($test.Name) | $($test.Platform) | $romSize | ❌ SIZE MISMATCH | $elapsed |" | Add-Content $reportFile
        $failed++
        continue
    }
    
    $match = $true
    for ($i = 0; $i -lt $origBytes.Length; $i++) {
        if ($origBytes[$i] -ne $rebBytes[$i]) {
            $match = $false
            break
        }
    }
    
    if ($match) {
        Write-Host "✅ $($test.Name): PASS" -ForegroundColor Green
        "| $($test.Name) | $($test.Platform) | $romSize | ✅ PASS | $elapsed |" | Add-Content $reportFile
        $passed++
    } else {
        Write-Host "❌ $($test.Name): Content mismatch" -ForegroundColor Red
        "| $($test.Name) | $($test.Platform) | $romSize | ❌ MISMATCH | $elapsed |" | Add-Content $reportFile
        $failed++
    }
}

# Summary
@"

## Summary

- **Passed:** $passed
- **Failed:** $failed
- **Total:** $($passed + $failed)

"@ | Add-Content $reportFile

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Results: $passed passed, $failed failed" -ForegroundColor $(if ($failed -eq 0) { "Green" } else { "Red" })
Write-Host "Report: $reportFile" -ForegroundColor Cyan
```

Run all tests:
```powershell
& "C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\run-all-roundtrip-tests.ps1"
```

---

## 6. Troubleshooting

### 6.1 Size Mismatch

**Symptom:** Rebuilt ROM has different size

**Common causes:**
- iNES header not handled correctly
- Bank boundaries wrong
- Missing padding at end of banks

**Debug steps:**
1. Check header handling in Peony
2. Compare file sizes byte by byte
3. Check for `.org` directives in output

### 6.2 Content Mismatch

**Symptom:** Same size but different content

**Common causes:**
- Undocumented opcodes
- Incorrect addressing mode
- Data vs code confusion
- Relative branch calculation

**Debug steps:**
1. Find first differing byte offset
2. Check disassembly at that offset
3. Compare hex dump of original vs rebuilt

### 6.3 Assembly Fails

**Symptom:** Poppy reports errors

**Common causes:**
- Invalid syntax in Peony output
- Undefined labels (forward ref issue)
- Macro problems

**Debug steps:**
1. Read Poppy error messages
2. Check the specific line in .pasm
3. Verify label definitions

### 6.4 Specific Offset Investigation

```powershell
# Compare specific region of two ROMs
param($Original, $Rebuilt, $Offset, $Length = 32)

$orig = [System.IO.File]::ReadAllBytes($Original)
$reb = [System.IO.File]::ReadAllBytes($Rebuilt)

Write-Host "Original bytes at 0x$($Offset.ToString('X')):"
($orig[$Offset..($Offset + $Length - 1)] | ForEach-Object { $_.ToString("x2") }) -join " "

Write-Host "`nRebuilt bytes at 0x$($Offset.ToString('X')):"
($reb[$Offset..($Offset + $Length - 1)] | ForEach-Object { $_.ToString("x2") }) -join " "
```

---

## 7. Results Documentation

### Test Results Template

Create `C:\Users\me\source\repos\GameInfo\~manual-testing\roundtrip\results\roundtrip-YYYY-MM-DD.md`:

```markdown
# Roundtrip Test Results - YYYY-MM-DD

**Tester:** [Name]
**Peony Version:** [version]
**Poppy Version:** [version]

## NES Tests

| ROM | CRC32 | Size | Disasm Time | Asm Time | Result |
|-----|-------|------|-------------|----------|--------|
| Dragon Warrior IV | 57c13f4d | 512KB | Xs | Ys | ✅/❌ |
| Dragon Warrior I | 2dcf893a | 64KB | Xs | Ys | ✅/❌ |

## SNES Tests

| ROM | CRC32 | Size | Disasm Time | Asm Time | Result |
|-----|-------|------|-------------|----------|--------|
| FFMQ | fce3f1f1 | 1MB | Xs | Ys | ✅/❌ |

## Summary

- **Total Tests:** X
- **Passed:** Y
- **Failed:** Z
- **Pass Rate:** YY%

## Issues Found

| Issue | ROM | Offset | Description |
|-------|-----|--------|-------------|
| 1 | DW4 | 0x1234 | Description |

## Notes

- [Any observations about the testing process]
```

---

**Previous Document:** [POPPY-TESTING.md](../repos/POPPY-TESTING.md)  
**Related:** [PANSY-TESTING.md](../repos/PANSY-TESTING.md)
