# 📦 BPS-Patch Testing Guide - Complete Manual Test Suite

> **Repository:** bps-patch - BPS Patching Library  
> **Last Updated:** 2026-01-19 19:55 UTC  
> **Estimated Time:** 1.5-2 hours

This document provides comprehensive step-by-step instructions for manually testing the BPS patching library.

---

## Table of Contents

1. [Test Environment Setup](#1-test-environment-setup)
2. [CLI - Patch Application (Decode)](#2-cli---patch-application-decode)
3. [CLI - Patch Creation (Encode)](#3-cli---patch-creation-encode)
4. [Round-Trip Testing](#4-round-trip-testing)
5. [CRC32 Validation Testing](#5-crc32-validation-testing)
6. [Error Handling](#6-error-handling)
7. [Performance Testing](#7-performance-testing)

---

## 1. Test Environment Setup

### Prerequisites
- [ ] .NET SDK 10 installed
- [ ] Test ROMs available

### Navigate to Repository

```powershell
cd "C:\Users\me\source\repos\bps-patch"
```

### Build Project

```powershell
dotnet build bps-patch.sln
```

**Expected:**
```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

### Run Unit Tests

```powershell
dotnet test bps-patch.sln --verbosity normal
```

**Record:** Total: ___, Passed: ___, Failed: ___

### Create Test Directories

```powershell
New-Item -ItemType Directory -Path "~manual-testing\source" -Force
New-Item -ItemType Directory -Path "~manual-testing\target" -Force
New-Item -ItemType Directory -Path "~manual-testing\patches" -Force
New-Item -ItemType Directory -Path "~manual-testing\output" -Force
```

### Create Test Files

```powershell
# Create simple source file
[byte[]]$source = @(0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09) * 100
[System.IO.File]::WriteAllBytes("~manual-testing/source/simple.bin", $source)

# Create modified target file
[byte[]]$target = $source.Clone()
$target[0] = 0xFF
$target[100] = 0xAA
$target[500] = 0xBB
[System.IO.File]::WriteAllBytes("~manual-testing/target/simple-modified.bin", $target)

# Create identical copy (for no-change test)
[System.IO.File]::WriteAllBytes("~manual-testing/target/simple-identical.bin", $source)

Write-Host "Test files created!" -ForegroundColor Green
```

---

## 2. CLI - Patch Application (Decode)

### 2.1 Display Help

```powershell
dotnet run -- --help
```

**Verify:**
- [ ] Shows usage information
- [ ] Lists decode/encode commands
- [ ] Shows options

### 2.2 Display Version

```powershell
dotnet run -- --version
```

**Verify:** Shows version number

### 2.3 Apply Known Good Patch

If you have a known good BPS patch:

```powershell
dotnet run -- decode `
    "path/to/original.rom" `
    "path/to/patch.bps" `
    "~manual-testing/output/patched.rom"
```

**Verify:**
- [ ] Completes without error
- [ ] Output file created
- [ ] CRC32 validation passes (or warns)

### 2.4 Test with Real ROM Hack Patch

1. **Find** a BPS patch for a ROM you own
2. **Apply** to original ROM:
   ```powershell
   dotnet run -- decode `
       "C:\Users\me\source\repos\roms\nes\dragon-warrior.nes" `
       "path/to/romhack.bps" `
       "~manual-testing/output/hacked.nes"
   ```
3. **Test** in emulator
4. **Verify:** Hack works correctly

---

## 3. CLI - Patch Creation (Encode)

### 3.1 Create Patch from Test Files

```powershell
dotnet run -- encode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/target/simple-modified.bin" `
    "~manual-testing/patches/simple.bps"
```

**Verify:**
- [ ] Completes without error
- [ ] Patch file created
- [ ] Patch file has "BPS1" header

### 3.2 Verify Patch File Header

```powershell
$bytes = [System.IO.File]::ReadAllBytes("~manual-testing/patches/simple.bps")
$header = [System.Text.Encoding]::ASCII.GetString($bytes[0..3])
Write-Host "Header: $header"
```

**Expected:** "BPS1"

### 3.3 Create Patch with Metadata

```powershell
dotnet run -- encode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/target/simple-modified.bin" `
    "~manual-testing/patches/with-metadata.bps" `
    "Test patch created by bps-patch"
```

**Verify:**
- [ ] Patch includes metadata
- [ ] Metadata can be read back

### 3.4 Create Patch from Identical Files

```powershell
dotnet run -- encode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/target/simple-identical.bin" `
    "~manual-testing/patches/identical.bps"
```

**Verify:**
- [ ] Patch created (even if tiny)
- [ ] Patch size is minimal

---

## 4. Round-Trip Testing

### 4.1 Create → Apply → Compare

This is the CRITICAL test:

```powershell
# Step 1: Create patch
dotnet run -- encode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/target/simple-modified.bin" `
    "~manual-testing/patches/roundtrip.bps"

# Step 2: Apply patch
dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/roundtrip.bps" `
    "~manual-testing/output/roundtrip-result.bin"

# Step 3: Compare
$original = [System.IO.File]::ReadAllBytes("~manual-testing/target/simple-modified.bin")
$result = [System.IO.File]::ReadAllBytes("~manual-testing/output/roundtrip-result.bin")

if ($original.Length -ne $result.Length) {
    Write-Host "❌ Size mismatch!" -ForegroundColor Red
} else {
    $match = $true
    for ($i = 0; $i -lt $original.Length; $i++) {
        if ($original[$i] -ne $result[$i]) {
            $match = $false
            break
        }
    }
    if ($match) {
        Write-Host "✅ PERFECT MATCH!" -ForegroundColor Green
    } else {
        Write-Host "❌ Content mismatch at byte $i" -ForegroundColor Red
    }
}
```

### 4.2 Round-Trip with Real ROM

```powershell
# Create modified ROM (change 1 byte)
$rom = [System.IO.File]::ReadAllBytes("C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes")
$modified = $rom.Clone()
$modified[0x100] = 0xFF  # Change one byte
[System.IO.File]::WriteAllBytes("~manual-testing/target/dw4-modified.nes", $modified)

# Create patch
dotnet run -- encode `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    "~manual-testing/target/dw4-modified.nes" `
    "~manual-testing/patches/dw4-test.bps"

# Apply patch
dotnet run -- decode `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    "~manual-testing/patches/dw4-test.bps" `
    "~manual-testing/output/dw4-patched.nes"

# Compare
$patched = [System.IO.File]::ReadAllBytes("~manual-testing/output/dw4-patched.nes")
Compare-Object $modified $patched | Measure-Object
```

**Expected:** 0 differences

### 4.3 Multiple Byte Changes

```powershell
# Create file with many changes
$rom = [System.IO.File]::ReadAllBytes("C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes")
$modified = $rom.Clone()

# Change 1000 random bytes
$random = [System.Random]::new(12345)
for ($i = 0; $i -lt 1000; $i++) {
    $offset = $random.Next(0, $modified.Length)
    $modified[$offset] = [byte]$random.Next(0, 256)
}
[System.IO.File]::WriteAllBytes("~manual-testing/target/dw4-many-changes.nes", $modified)

# Create and apply patch
dotnet run -- encode `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    "~manual-testing/target/dw4-many-changes.nes" `
    "~manual-testing/patches/dw4-many.bps"

dotnet run -- decode `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    "~manual-testing/patches/dw4-many.bps" `
    "~manual-testing/output/dw4-many-result.nes"

# Verify
$result = [System.IO.File]::ReadAllBytes("~manual-testing/output/dw4-many-result.nes")
$diff = Compare-Object $modified $result
Write-Host "Differences: $($diff.Count)"
```

**Expected:** 0 differences

---

## 5. CRC32 Validation Testing

### 5.1 Correct Source CRC

```powershell
dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/simple.bps" `
    "~manual-testing/output/crc-test.bin"
```

**Verify:**
- [ ] No CRC warnings
- [ ] Output correct

### 5.2 Wrong Source File

```powershell
# Create different source
[byte[]]$wrongSource = @(0xFF,0xFF,0xFF,0xFF,0xFF) * 200
[System.IO.File]::WriteAllBytes("~manual-testing/source/wrong.bin", $wrongSource)

dotnet run -- decode `
    "~manual-testing/source/wrong.bin" `
    "~manual-testing/patches/simple.bps" `
    "~manual-testing/output/wrong-source.bin"
```

**Verify:**
- [ ] Warning about source CRC mismatch
- [ ] Output may still be created (with warning)

### 5.3 Corrupted Patch File

```powershell
# Create corrupted patch
$patch = [System.IO.File]::ReadAllBytes("~manual-testing/patches/simple.bps")
$patch[$patch.Length - 1] = 0xFF  # Corrupt last byte (checksum)
[System.IO.File]::WriteAllBytes("~manual-testing/patches/corrupted.bps", $patch)

dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/corrupted.bps" `
    "~manual-testing/output/corrupted-result.bin"
```

**Verify:**
- [ ] Warning about patch CRC mismatch
- [ ] Appropriate error handling

---

## 6. Error Handling

### 6.1 Non-Existent Source File

```powershell
dotnet run -- decode `
    "nonexistent.bin" `
    "~manual-testing/patches/simple.bps" `
    "~manual-testing/output/error.bin"
```

**Verify:**
- [ ] Error: "File not found"
- [ ] Non-zero exit code

### 6.2 Non-Existent Patch File

```powershell
dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "nonexistent.bps" `
    "~manual-testing/output/error.bin"
```

**Verify:**
- [ ] Error: "File not found"

### 6.3 Invalid Patch Format

```powershell
"This is not a BPS file" | Out-File "~manual-testing/patches/invalid.bps"

dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/invalid.bps" `
    "~manual-testing/output/error.bin"
```

**Verify:**
- [ ] Error: "Invalid BPS format" or similar
- [ ] Describes that header is wrong

### 6.4 Truncated Patch File

```powershell
$patch = [System.IO.File]::ReadAllBytes("~manual-testing/patches/simple.bps")
$truncated = $patch[0..($patch.Length / 2)]
[System.IO.File]::WriteAllBytes("~manual-testing/patches/truncated.bps", $truncated)

dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/truncated.bps" `
    "~manual-testing/output/error.bin"
```

**Verify:**
- [ ] Error about truncated/incomplete patch
- [ ] No crash

### 6.5 Output Path Not Writable

```powershell
dotnet run -- decode `
    "~manual-testing/source/simple.bin" `
    "~manual-testing/patches/simple.bps" `
    "C:\Windows\System32\test.bin"
```

**Verify:**
- [ ] Permission error
- [ ] No crash

### 6.6 Empty Source File

```powershell
[System.IO.File]::WriteAllBytes("~manual-testing/source/empty.bin", @())

dotnet run -- encode `
    "~manual-testing/source/empty.bin" `
    "~manual-testing/target/simple-modified.bin" `
    "~manual-testing/patches/empty-source.bps"
```

**Verify:**
- [ ] Handles gracefully (error or creates patch)

---

## 7. Performance Testing

### 7.1 Large File Patch Creation

```powershell
# Create 4MB test files
$largeSource = New-Object byte[] (4 * 1024 * 1024)
$random = [System.Random]::new()
$random.NextBytes($largeSource)
[System.IO.File]::WriteAllBytes("~manual-testing/source/large.bin", $largeSource)

$largeTarget = $largeSource.Clone()
# Modify 10% of bytes
for ($i = 0; $i -lt $largeTarget.Length; $i += 10) {
    $largeTarget[$i] = [byte]($largeTarget[$i] + 1)
}
[System.IO.File]::WriteAllBytes("~manual-testing/target/large-modified.bin", $largeTarget)

# Time patch creation
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run -- encode `
    "~manual-testing/source/large.bin" `
    "~manual-testing/target/large-modified.bin" `
    "~manual-testing/patches/large.bps"

$timer.Stop()
Write-Host "Encode time: $($timer.Elapsed.TotalSeconds) seconds"
```

**Record:** ___ seconds

**Acceptable:** < 30 seconds for 4MB file

### 7.2 Large File Patch Application

```powershell
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run -- decode `
    "~manual-testing/source/large.bin" `
    "~manual-testing/patches/large.bps" `
    "~manual-testing/output/large-result.bin"

$timer.Stop()
Write-Host "Decode time: $($timer.Elapsed.TotalSeconds) seconds"
```

**Record:** ___ seconds

**Acceptable:** < 5 seconds

### 7.3 Memory Usage

1. **Open** Task Manager
2. **Run** large file encode
3. **Watch** memory usage
4. **Record:** Peak: ___ MB
5. **Verify:** < 500MB for 4MB files

### 7.4 Patch Size Efficiency

```powershell
$sourceSize = (Get-Item "~manual-testing/source/large.bin").Length
$targetSize = (Get-Item "~manual-testing/target/large-modified.bin").Length
$patchSize = (Get-Item "~manual-testing/patches/large.bps").Length

Write-Host "Source: $sourceSize bytes"
Write-Host "Target: $targetSize bytes"
Write-Host "Patch: $patchSize bytes"
Write-Host "Ratio: $([math]::Round($patchSize / $sourceSize * 100, 2))%"
```

**Verify:** Patch size is reasonable (should be much smaller than source)

---

## Benchmark Testing (Optional)

If benchmarks are set up:

```powershell
cd bps-patch.Benchmarks
dotnet run -c Release
```

**Record benchmark results:**
- Encode small: ___ ms
- Encode large: ___ ms
- Decode small: ___ ms
- Decode large: ___ ms

---

## Test Results Template

Copy to `~manual-testing/bps-patch-results-YYYY-MM-DD.md`:

```markdown
# BPS-Patch Test Results - YYYY-MM-DD

**Tester:** [Name]
**Version:** [Version]
**Date:** [Date]

## Summary
- Total Tests: X
- Passed: X
- Failed: X

## Round-Trip Tests
| Test | Pass? |
|------|-------|
| Simple file | [ ] |
| Real ROM | [ ] |
| Many changes | [ ] |

## Performance
| Operation | Time | Memory |
|-----------|------|--------|
| Encode 4MB | ___s | ___MB |
| Decode 4MB | ___s | ___MB |

## Issues Found
| ID | Section | Description | Severity |
|----|---------|-------------|----------|
```

---

**Previous Document:** [MESEN2-TESTING.md](MESEN2-TESTING.md)  
**Next Document:** [GAMEINFO-TESTING.md](GAMEINFO-TESTING.md)
