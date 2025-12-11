# ROM Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

The ROM tools provide basic operations for working with ROM files:
- **info** - Display ROM information
- **checksum** - Calculate/verify ROM checksums
- **expand** - Expand ROM size
- **header** - View/edit ROM header

## 🎯 Prerequisites

- [ ] GameInfo CLI built (`dotnet build`)
- [ ] Sample NES ROM file available
- [ ] Sample SNES ROM file available (optional)

## ✅ Test Checklist

### `git rom info` - Display ROM Information
- [ ] TEST-ROM-001: Display info for NES ROM
- [ ] TEST-ROM-002: Display info for SNES ROM
- [ ] TEST-ROM-003: Handle non-existent file gracefully
- [ ] TEST-ROM-004: Handle invalid/corrupted file gracefully

### `git rom checksum` - Calculate Checksum
- [ ] TEST-ROM-005: Calculate checksum for valid ROM
- [ ] TEST-ROM-006: Detect bad checksum
- [ ] TEST-ROM-007: Fix checksum with --fix flag

### `git rom expand` - Expand ROM Size
- [ ] TEST-ROM-008: Expand ROM to larger size
- [ ] TEST-ROM-009: Reject expansion to smaller size
- [ ] TEST-ROM-010: Handle various size formats (KB, MB)

### `git rom header` - View/Edit Header
- [ ] TEST-ROM-011: Display header information
- [ ] TEST-ROM-012: Detect header type (iNES, NES 2.0, etc.)

---

## 🧪 Detailed Test Instructions

### TEST-ROM-001: Display Info for NES ROM

**Purpose:** Verify `rom info` correctly parses and displays NES ROM metadata.

**Prerequisites:**
- A valid NES ROM file (e.g., `test.nes`)

**Steps:**
1. Open terminal in GameInfo directory
2. Run the command:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom info "path/to/test.nes"
   ```

**Expected Result:**
```
ROM Information
──────────────────────────────────────
File:        test.nes
Size:        X bytes (X KB)
System:      NES
Format:      iNES / NES 2.0
PRG ROM:     X × 16KB
CHR ROM:     X × 8KB
Mapper:      X
Mirroring:   Horizontal/Vertical
Battery:     Yes/No
Trainer:     Yes/No
──────────────────────────────────────
```

**Verification:**
- [ ] File name displays correctly
- [ ] File size is accurate
- [ ] System detected as NES
- [ ] PRG/CHR sizes are correct
- [ ] Mapper number identified
- [ ] No errors or exceptions

**Result:** ☐ Pass ☐ Fail ☐ Blocked

**Notes:**
```
(Record any observations here)
```

---

### TEST-ROM-002: Display Info for SNES ROM

**Purpose:** Verify `rom info` correctly parses SNES ROM metadata.

**Prerequisites:**
- A valid SNES ROM file (e.g., `test.sfc`)

**Steps:**
1. Run the command:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom info "path/to/test.sfc"
   ```

**Expected Result:**
```
ROM Information
──────────────────────────────────────
File:        test.sfc
Size:        X bytes (X KB)
System:      SNES
Format:      LoROM/HiROM/ExHiROM
ROM Name:    <internal name>
Checksum:    $XXXX
──────────────────────────────────────
```

**Verification:**
- [ ] System detected as SNES
- [ ] ROM mapping type identified
- [ ] Internal name extracted
- [ ] Checksum displayed

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-003: Handle Non-existent File

**Purpose:** Verify graceful error handling for missing files.

**Steps:**
1. Run with a non-existent file:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom info "nonexistent.nes"
   ```

**Expected Result:**
- Clear error message indicating file not found
- No unhandled exception or crash
- Non-zero exit code

**Verification:**
- [ ] Error message is user-friendly
- [ ] No stack trace shown to user
- [ ] Exit code indicates failure

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-004: Handle Invalid File

**Purpose:** Verify graceful handling of non-ROM files.

**Steps:**
1. Run with a text file or image:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom info "README.md"
   ```

**Expected Result:**
- Error message indicating invalid/unrecognized format
- No crash or unhandled exception

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-005: Calculate Checksum

**Purpose:** Verify checksum calculation.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom checksum "path/to/test.nes"
   ```

**Expected Result:**
```
ROM Checksum
──────────────────────────────────────
File:           test.nes
CRC32:          $XXXXXXXX
MD5:            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SHA1:           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Internal:       $XXXX (if applicable)
Status:         ✓ Valid / ✗ Invalid
──────────────────────────────────────
```

**Verification:**
- [ ] CRC32 calculated correctly
- [ ] MD5 hash calculated
- [ ] SHA1 hash calculated
- [ ] Validity status shown

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-006: Detect Bad Checksum

**Purpose:** Verify detection of incorrect internal checksum.

**Prerequisites:**
- A ROM with intentionally bad internal checksum (or modify a copy)

**Steps:**
1. Run checksum on modified ROM:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom checksum "path/to/bad-checksum.nes"
   ```

**Expected Result:**
- Status shows "Invalid" or similar
- Indicates expected vs actual checksum

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-007: Fix Checksum

**Purpose:** Verify --fix flag corrects bad checksum.

**Prerequisites:**
- A copy of a ROM with bad checksum

**Steps:**
1. Run with --fix:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom checksum "path/to/bad-checksum.nes" --fix
   ```
2. Run checksum again without --fix to verify

**Expected Result:**
- First run: Shows fix was applied
- Second run: Status shows "Valid"

**Verification:**
- [ ] Checksum was corrected
- [ ] File was modified
- [ ] New checksum is valid

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-008: Expand ROM Size

**Purpose:** Verify ROM expansion works correctly.

**Prerequisites:**
- A ROM smaller than target size
- Working copy (don't modify original)

**Steps:**
1. Make a copy of the test ROM
2. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom expand "path/to/copy.nes" "512KB"
   ```
3. Check file size after

**Expected Result:**
- ROM expanded to specified size
- New space filled with $FF or $00
- ROM still functional (if tested in emulator)

**Verification:**
- [ ] File size increased correctly
- [ ] Header updated (if applicable)
- [ ] No data corruption

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-009: Reject Smaller Expansion

**Purpose:** Verify ROM cannot be "expanded" to smaller size.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom expand "path/to/test.nes" "16KB"
   ```

**Expected Result:**
- Error message explaining size must be larger
- File not modified

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-010: Various Size Formats

**Purpose:** Verify different size specifications work.

**Steps:**
Test each format:
```powershell
# Kilobytes
git rom expand test.nes 256KB
git rom expand test.nes 256K
git rom expand test.nes 256kb

# Megabytes
git rom expand test.nes 1MB
git rom expand test.nes 1M
git rom expand test.nes 1mb

# Bytes (if supported)
git rom expand test.nes 262144
```

**Expected Result:**
- All common formats recognized
- Case-insensitive

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-011: Display Header

**Purpose:** Verify header information display.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- rom header "path/to/test.nes"
   ```

**Expected Result:**
- Full header hex dump
- Parsed header fields
- Header type identification

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ROM-012: Detect Header Type

**Purpose:** Verify correct identification of header formats.

**Test Cases:**
- [ ] iNES header (`4E 45 53 1A` magic)
- [ ] NES 2.0 header (iNES with flag set)
- [ ] SNES header (internal header)
- [ ] Headerless ROM

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-ROM-001 | NES ROM info | ☐ | | |
| TEST-ROM-002 | SNES ROM info | ☐ | | |
| TEST-ROM-003 | Non-existent file | ☐ | | |
| TEST-ROM-004 | Invalid file | ☐ | | |
| TEST-ROM-005 | Calculate checksum | ☐ | | |
| TEST-ROM-006 | Detect bad checksum | ☐ | | |
| TEST-ROM-007 | Fix checksum | ☐ | | |
| TEST-ROM-008 | Expand ROM | ☐ | | |
| TEST-ROM-009 | Reject smaller expansion | ☐ | | |
| TEST-ROM-010 | Size formats | ☐ | | |
| TEST-ROM-011 | Display header | ☐ | | |
| TEST-ROM-012 | Header type detection | ☐ | | |

**Total:** 0/12 tests completed

---

**Next:** [Text Tools Testing](text-tools.md)
