# Analysis Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

Analysis tools help understand ROM structure and code:
- **opcodes** - Analyze CPU instruction usage
- **compression** - Detect compression algorithms
- **xref** - Build cross-reference database

For CDL-specific analysis, see [CDL Tools](cdl-tools.md).

## 🎯 Prerequisites

- [ ] GameInfo CLI built
- [ ] Sample NES ROM (6502 CPU)
- [ ] Sample SNES ROM (65816 CPU)

## ✅ Test Checklist

### `git analysis opcodes` - Opcode Analysis
- [ ] TEST-ANAL-001: Analyze all opcodes in ROM
- [ ] TEST-ANAL-002: Analyze specific bank
- [ ] TEST-ANAL-003: Show opcode frequency
- [ ] TEST-ANAL-004: Identify code patterns

### `git analysis compression` - Compression Detection
- [ ] TEST-ANAL-005: Detect LZ77 compression
- [ ] TEST-ANAL-006: Detect RLE compression
- [ ] TEST-ANAL-007: Detect Huffman compression
- [ ] TEST-ANAL-008: Report no compression found

### `git analysis xref` - Cross-Reference
- [ ] TEST-ANAL-009: Build xref database
- [ ] TEST-ANAL-010: Export to file
- [ ] TEST-ANAL-011: Query xref database

---

## 🧪 Detailed Test Instructions

### TEST-ANAL-001: Analyze All Opcodes in ROM

**Purpose:** Verify opcode frequency analysis.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- analysis opcodes "game.nes"
   ```

**Expected Result:**
```
Opcode Analysis
────────────────────────────────────────
File:         game.nes
CPU:          6502/2A03
Total bytes:  XXXXX
Code bytes:   XXXXX (estimated)

Top 20 Opcodes:
  LDA    XXXX  (XX.X%)  - Load Accumulator
  STA    XXXX  (XX.X%)  - Store Accumulator
  JSR    XXXX  (XX.X%)  - Jump to Subroutine
  RTS    XXXX  (XX.X%)  - Return from Subroutine
  BNE    XXXX  (XX.X%)  - Branch if Not Equal
  ...

Code Patterns Found:
  Subroutines: XXX
  Branches:    XXX
  Loops:       XXX (estimated)
────────────────────────────────────────
```

**Verification:**
- [ ] Opcodes listed by frequency
- [ ] Percentages calculated correctly
- [ ] CPU type detected correctly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-002: Analyze Specific Bank

**Purpose:** Verify bank-specific analysis.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- analysis opcodes "game.nes" --bank 0
   ```

**Expected Result:**
- Analysis limited to specified bank
- Bank offset and size shown
- Results specific to that bank

**Verification:**
- [ ] Only analyzes specified bank
- [ ] Bank info displayed
- [ ] Results differ from full ROM analysis

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-003: Show Opcode Frequency

**Purpose:** Verify detailed frequency statistics.

**Steps:**
1. Run full analysis
2. Review frequency statistics

**Expected Result:**
- All used opcodes listed
- Count and percentage for each
- Sorted by frequency (descending)
- Unused opcodes optionally shown

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-004: Identify Code Patterns

**Purpose:** Verify pattern detection capabilities.

**Patterns to Detect:**
- [ ] Function prologues (e.g., PHA/PHP sequences)
- [ ] Function epilogues (e.g., PLP/PLA/RTS)
- [ ] Loop structures
- [ ] Table lookups
- [ ] Switch/case patterns

**Steps:**
1. Run analysis on ROM with known code structure
2. Verify patterns match expected

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-005: Detect LZ77 Compression

**Purpose:** Verify LZ77 detection.

**Prerequisites:**
- ROM known to use LZ77 (many SNES games)

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- analysis compression "game.sfc"
   ```

**Expected Result:**
```
Compression Detection
────────────────────────────────────────
File:         game.sfc
Size:         XXXXX bytes

Potential compressed regions:
  $010000-$01FFFF  LZ77 (confidence: 95%)
    Compressed:   XXXX bytes
    Decompressed: XXXX bytes
    Ratio:        XX%
  
  $020000-$023FFF  LZ77 (confidence: 87%)
    ...
────────────────────────────────────────
```

**Verification:**
- [ ] LZ77 regions identified
- [ ] Confidence level shown
- [ ] Size estimates reasonable

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-006: Detect RLE Compression

**Purpose:** Verify Run-Length Encoding detection.

**Prerequisites:**
- ROM known to use RLE (NES title screens often do)

**Steps:**
1. Run compression analysis

**Expected Result:**
- RLE regions identified
- Shows repeating byte patterns
- Estimates compression ratio

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-007: Detect Huffman Compression

**Purpose:** Verify Huffman/entropy coding detection.

**Steps:**
1. Run compression analysis on ROM with Huffman data

**Expected Result:**
- Huffman regions identified
- Shows bit-level patterns
- High confidence when tree structure found

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-008: Report No Compression Found

**Purpose:** Verify handling of uncompressed ROMs.

**Steps:**
1. Run compression analysis on ROM without compression

**Expected Result:**
- Clear message: "No compression detected"
- Or: "Low confidence matches only"
- Shows why (no patterns found)

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-009: Build Cross-Reference Database

**Purpose:** Verify xref database creation.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- analysis xref "game.nes"
   ```

**Expected Result:**
```
Cross-Reference Analysis
────────────────────────────────────────
File:         game.nes
Analysis:     Building...

Results:
  Subroutines found:  XXX
  Jump targets:       XXX
  Data references:    XXX
  External calls:     XXX

Database saved to: game.xref
────────────────────────────────────────
```

**Verification:**
- [ ] Database file created
- [ ] Subroutines identified
- [ ] References counted correctly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-010: Export Xref to File

**Purpose:** Verify xref export with custom output.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- analysis xref "game.nes" --output "my-xref.db"
   ```

**Expected Result:**
- File created at specified path
- Contains all xref data
- Can be reloaded later

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-ANAL-011: Query Xref Database

**Purpose:** Verify xref query functionality.

**Steps:**
1. Build xref database
2. Query for a known address:
   ```powershell
   # Example query command (if implemented)
   git analysis xref-query my-xref.db --address $8000
   ```

**Expected Result:**
- Shows all references to/from address
- Lists callers and callees
- Shows data access locations

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-ANAL-001 | All opcodes | ☐ | | |
| TEST-ANAL-002 | Specific bank | ☐ | | |
| TEST-ANAL-003 | Frequency stats | ☐ | | |
| TEST-ANAL-004 | Code patterns | ☐ | | |
| TEST-ANAL-005 | LZ77 detection | ☐ | | |
| TEST-ANAL-006 | RLE detection | ☐ | | |
| TEST-ANAL-007 | Huffman detection | ☐ | | |
| TEST-ANAL-008 | No compression | ☐ | | |
| TEST-ANAL-009 | Build xref | ☐ | | |
| TEST-ANAL-010 | Export xref | ☐ | | |
| TEST-ANAL-011 | Query xref | ☐ | | |

**Total:** 0/11 tests completed

---

**Next:** [CDL Tools Testing](cdl-tools.md)
