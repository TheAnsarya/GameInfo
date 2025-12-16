# ROM Info View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The ROM Info View displays detailed metadata about loaded ROM files, including header information, checksums, mapper details, and region information.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] Sample ROM files available (NES, SNES, Genesis)
- [ ] ROM files with known good headers

---

## 🧪 Test Cases

### TEST-ROM-001: Open ROM Info View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a NES ROM file (File → Open or Ctrl+O)
3. Navigate to ROM Info view

**Expected Results:**
- [ ] ROM Info view opens without errors
- [ ] ROM filename displayed in title bar
- [ ] View switches to ROM Info automatically after loading

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-002: NES Header Display

**Steps:**
1. Open a NES ROM file (iNES format)
2. Verify header information displayed

**Expected Results:**
- [ ] PRG ROM size shown (e.g., "128 KB")
- [ ] CHR ROM size shown (e.g., "64 KB")
- [ ] Mapper number displayed (e.g., "1 (MMC1)")
- [ ] Mirroring type shown (Horizontal/Vertical/4-Screen)
- [ ] Battery flag shown if present
- [ ] Trainer flag shown if present

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-003: SNES Header Display

**Steps:**
1. Open a SNES ROM file
2. Verify header information displayed

**Expected Results:**
- [ ] ROM title shown (21 characters)
- [ ] ROM makeup byte decoded (LoROM/HiROM/ExHiROM)
- [ ] ROM size displayed
- [ ] SRAM size displayed
- [ ] Country/region code shown
- [ ] Developer code displayed
- [ ] Version number shown
- [ ] Checksum and complement shown

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-004: Genesis Header Display

**Steps:**
1. Open a Genesis/Mega Drive ROM file
2. Verify header information displayed

**Expected Results:**
- [ ] Console name shown ("SEGA MEGA DRIVE" or "SEGA GENESIS")
- [ ] Copyright/release info displayed
- [ ] Domestic title shown
- [ ] Overseas title shown
- [ ] Serial number displayed
- [ ] ROM checksum shown
- [ ] I/O support flags decoded
- [ ] ROM start/end addresses shown
- [ ] RAM start/end addresses shown

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-005: Checksum Verification

**Steps:**
1. Open any ROM file
2. Locate checksum section
3. Click "Verify" or equivalent

**Expected Results:**
- [ ] Stored checksum displayed
- [ ] Calculated checksum displayed
- [ ] Match/mismatch indicator shown
- [ ] Visual indicator (green=match, red=mismatch)

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-006: Fix Checksum

**Steps:**
1. Open a ROM with incorrect checksum
2. Click "Fix Checksum" button
3. Save the ROM

**Expected Results:**
- [ ] Confirmation dialog shown
- [ ] Checksum recalculated
- [ ] Status updates to "Match"
- [ ] File saved successfully (if saved)

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-007: ROM Size Display

**Steps:**
1. Open various sized ROMs
2. Verify size information

**Expected Results:**
- [ ] File size displayed (bytes and KB/MB)
- [ ] Header size shown (if applicable)
- [ ] Data size (minus header) shown
- [ ] Bank count calculated correctly

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-008: Copy Information

**Steps:**
1. Open a ROM file
2. Select ROM info text
3. Right-click → Copy (or use keyboard shortcut)

**Expected Results:**
- [ ] Copy option available in context menu
- [ ] Selected text copies to clipboard
- [ ] Paste shows correct text

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-009: Export ROM Info

**Steps:**
1. Open a ROM file
2. Click "Export Info" or equivalent
3. Choose export format (TXT/JSON)

**Expected Results:**
- [ ] Export dialog opens
- [ ] TXT format outputs readable text
- [ ] JSON format outputs valid JSON
- [ ] All displayed fields included in export

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-010: Invalid/Corrupted ROM

**Steps:**
1. Open a non-ROM file or corrupted ROM
2. Observe behavior

**Expected Results:**
- [ ] Error message displayed (not crash)
- [ ] Partial info shown if parseable
- [ ] Application remains stable
- [ ] User can close error and continue

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-011: Headered vs Headerless ROMs

**Steps:**
1. Open a headered ROM (e.g., NES with iNES header)
2. Note header info displayed
3. Open an equivalent headerless ROM

**Expected Results:**
- [ ] Headered ROM shows full header info
- [ ] Headerless ROM indicates "No header detected"
- [ ] File offset calculations adjust accordingly

**Result:** ☐ Pass ☐ Fail

---

### TEST-ROM-012: Refresh ROM Info

**Steps:**
1. Open a ROM file
2. Modify the ROM externally (hex editor)
3. Click "Refresh" in ROM Info view

**Expected Results:**
- [ ] Info updates to reflect changes
- [ ] Checksum recalculated
- [ ] No stale data displayed

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-ROM-001 | Open ROM Info View | ☐ |
| TEST-ROM-002 | NES Header Display | ☐ |
| TEST-ROM-003 | SNES Header Display | ☐ |
| TEST-ROM-004 | Genesis Header Display | ☐ |
| TEST-ROM-005 | Checksum Verification | ☐ |
| TEST-ROM-006 | Fix Checksum | ☐ |
| TEST-ROM-007 | ROM Size Display | ☐ |
| TEST-ROM-008 | Copy Information | ☐ |
| TEST-ROM-009 | Export ROM Info | ☐ |
| TEST-ROM-010 | Invalid/Corrupted ROM | ☐ |
| TEST-ROM-011 | Headered vs Headerless | ☐ |
| TEST-ROM-012 | Refresh ROM Info | ☐ |

**Total: 12 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Test with multiple ROM types (NES, SNES, Genesis, GB, GBA)
- Verify address offsets account for headers correctly
- Check that mapper/chip information is accurate
