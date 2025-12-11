# Text Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

Text tools handle game text extraction, insertion, and compression:
- **extract** - Extract text from ROM using table files
- **insert** - Insert translated text back into ROM
- **dte** - Analyze Dual Tile Encoding compression

## 🎯 Prerequisites

- [ ] GameInfo CLI built

- [ ] Sample ROM file with text

- [ ] Sample table file (.tbl)

- [ ] Sample script file for insertion tests

## ✅ Test Checklist

### `git text extract` - Extract Text

- [ ] TEST-TEXT-001: Extract text with default settings

- [ ] TEST-TEXT-002: Extract with custom table file

- [ ] TEST-TEXT-003: Extract to specific output file

- [ ] TEST-TEXT-004: Handle ROM without table file

### `git text insert` - Insert Text

- [ ] TEST-TEXT-005: Insert script into ROM

- [ ] TEST-TEXT-006: Handle script too large for space

- [ ] TEST-TEXT-007: Handle invalid script format

### `git text dte` - DTE Analysis

- [ ] TEST-TEXT-008: Analyze DTE compression

- [ ] TEST-TEXT-009: Show compression candidates

---

## 🧪 Detailed Test Instructions

### TEST-TEXT-001: Extract Text with Default Settings

**Purpose:** Verify basic text extraction works.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text extract "path/to/game.nes"
```

**Expected Result:**
- Text extracted and displayed to console

- Or saved to default output file

- Shows extraction statistics

**Verification:**

- [ ] Text is readable

- [ ] Control codes shown appropriately

- [ ] No unhandled exceptions

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-002: Extract with Custom Table File

**Purpose:** Verify custom .tbl file support.

**Prerequisites:**

- A .tbl file matching the ROM's text encoding

**Sample .tbl Format:**

```

00=A
01=B
02=C
...
FF=<END>

```

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text extract "game.nes" --table "game.tbl"
```

**Expected Result:**
- Text extracted using custom encoding

- Characters mapped correctly per table

**Verification:**

- [ ] Custom table loaded

- [ ] Text decoded correctly

- [ ] Unknown bytes handled gracefully

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-003: Extract to Output File

**Purpose:** Verify output file specification.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text extract "game.nes" --output "extracted.txt"
```

2. Check extracted.txt exists

**Expected Result:**
- File created at specified path

- Contains extracted text

- Uses proper encoding (UTF-8)

**Verification:**

- [ ] Output file created

- [ ] Content is correct

- [ ] File encoding is correct

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-004: Handle Missing Table File

**Purpose:** Verify graceful handling when table file doesn't exist.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text extract "game.nes" --table "nonexistent.tbl"
```

**Expected Result:**
- Clear error about missing table file

- No crash

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-005: Insert Script into ROM

**Purpose:** Verify text insertion works.

**Prerequisites:**

- Script file in compatible format

- Working copy of ROM

**Sample Script Format:**

```

#POINTER:$8000
This is line one.<LINE>
This is line two.<END>

#POINTER:$8100
Another text block.<END>

```

**Steps:**
1. Make a copy of the ROM
2. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text insert "copy.nes" "script.txt" --table "game.tbl"
```

3. Test ROM in emulator (optional)

**Expected Result:**
- Script inserted at specified locations

- Pointers updated if applicable

- ROM still functional

**Verification:**

- [ ] Text inserted correctly

- [ ] Pointers updated

- [ ] ROM runs in emulator

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-006: Handle Script Too Large

**Purpose:** Verify error handling when text exceeds available space.

**Steps:**
1. Create a script with text larger than available space
2. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text insert "copy.nes" "large-script.txt"
```

**Expected Result:**
- Error message about insufficient space

- ROM not modified (or partial with warning)

- Shows how much space was needed vs available

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-007: Handle Invalid Script Format

**Purpose:** Verify graceful handling of malformed scripts.

**Steps:**
1. Run with invalid script:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text insert "copy.nes" "bad-script.txt"
```

**Expected Result:**
- Parse error with line number

- Helpful error message

- No partial modification

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-008: Analyze DTE Compression

**Purpose:** Verify DTE analysis functionality.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- text dte "game.nes"
```

**Expected Result:**

```

DTE Compression Analysis
────────────────────────────────────────
Total text bytes:     X
Unique pairs found:   X
Top compression candidates:
"th" - XX occurrences - XX% savings
"he" - XX occurrences - XX% savings
"in" - XX occurrences - XX% savings
...
Potential savings:    XX bytes (XX%)
────────────────────────────────────────

```

**Verification:**

- [ ] Pair frequencies calculated

- [ ] Savings estimates shown

- [ ] Candidates ranked by benefit

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-TEXT-009: DTE Compression Candidates

**Purpose:** Verify DTE shows useful compression options.

**Steps:**
1. Run DTE analysis on ROM with known text
2. Verify top candidates make sense

**Expected Result:**
- Common English digraphs appear (th, he, in, er, an)

- Savings estimates are reasonable

- Can export candidate list

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-TEXT-001 | Extract default | ☐ | | |
| TEST-TEXT-002 | Extract with table | ☐ | | |
| TEST-TEXT-003 | Extract to file | ☐ | | |
| TEST-TEXT-004 | Missing table | ☐ | | |
| TEST-TEXT-005 | Insert script | ☐ | | |
| TEST-TEXT-006 | Script too large | ☐ | | |
| TEST-TEXT-007 | Invalid script | ☐ | | |
| TEST-TEXT-008 | DTE analysis | ☐ | | |
| TEST-TEXT-009 | DTE candidates | ☐ | | |

**Total:** 0/9 tests completed

---

**Next:** [Graphics Tools Testing](graphics-tools.md)
