# Graphics Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

Graphics tools handle tile and palette operations:
- **chr** - Extract CHR/tile data
- **palette** - Extract and convert color palettes

## 🎯 Prerequisites

- [ ] GameInfo CLI built

- [ ] Sample NES ROM (for 2bpp tiles)

- [ ] Sample SNES ROM (for 4bpp tiles)

- [ ] Image viewer to verify output

## ✅ Test Checklist

### `git graphics chr` - Extract CHR Data

- [ ] TEST-GFX-001: Extract CHR from NES ROM

- [ ] TEST-GFX-002: Extract CHR to specific directory

- [ ] TEST-GFX-003: Handle ROM without CHR data

- [ ] TEST-GFX-004: Extract as PNG images

### `git graphics palette` - Extract Palettes

- [ ] TEST-GFX-005: Extract palette from ROM

- [ ] TEST-GFX-006: Display palette colors

- [ ] TEST-GFX-007: Export palette to common formats

---

## 🧪 Detailed Test Instructions

### TEST-GFX-001: Extract CHR from NES ROM

**Purpose:** Verify CHR tile extraction works.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- graphics chr "game.nes"
```

**Expected Result:**

```

CHR Extraction
────────────────────────────────────────
File:         game.nes
CHR Banks:    X
Total tiles:  XXX
Format:       2bpp planar (NES)
Output:       ./chr/
────────────────────────────────────────
Extracting bank 0... Done (XXX tiles)
Extracting bank 1... Done (XXX tiles)
...
Complete! XX files created.

```

**Verification:**

- [ ] Output files created

- [ ] Correct number of tiles

- [ ] Files viewable in image editor

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-002: Extract to Specific Directory

**Purpose:** Verify output directory option.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- graphics chr "game.nes" --output "my-tiles"
```

2. Check `my-tiles` directory

**Expected Result:**
- Directory created if it doesn't exist

- Files saved to specified location

**Verification:**

- [ ] Custom directory used

- [ ] Files in correct location

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-003: Handle ROM Without CHR

**Purpose:** Verify graceful handling of ROMs without embedded CHR (CHR-RAM games).

**Steps:**
1. Find a CHR-RAM game (uses mapper RAM, not ROM for tiles)
2. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- graphics chr "chr-ram-game.nes"
```

**Expected Result:**
- Message explaining CHR is in RAM

- Or extracts empty/placeholder tiles

- No crash

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-004: Extract as PNG Images

**Purpose:** Verify PNG output format.

**Steps:**
1. Run extraction
2. Check output file format

**Expected Result:**
- Output files are valid PNG images

- Correct dimensions (8x8 per tile, arranged in sheet)

- Transparency/palette handled correctly

**Verification:**

- [ ] Files are valid PNGs

- [ ] Open correctly in image editor

- [ ] Dimensions are correct

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-005: Extract Palette from ROM

**Purpose:** Verify palette extraction.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- graphics palette "game.nes"
```

**Expected Result:**

```

Palette Extraction
────────────────────────────────────────
System:       NES
Palettes:     X found

Palette 0 (Background):
██ #0F0F0F (Black)
██ #FF0000 (Red)
██ #00FF00 (Green)
██ #0000FF (Blue)

Palette 1 (Sprite):
...
────────────────────────────────────────

```

**Verification:**

- [ ] Palettes displayed

- [ ] Colors shown with values

- [ ] Visual preview (if terminal supports)

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-006: Display Palette Colors

**Purpose:** Verify color display and hex values.

**Steps:**
1. Run palette extraction
2. Verify color values are correct

**Expected Result:**
- Each color shows:

- Visual swatch (if terminal supports ANSI colors)

- Hex RGB value

- Color name (if recognized)

- NES/SNES palette index

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-GFX-007: Export Palette to Common Formats

**Purpose:** Verify palette export options.

**Steps:**
Test various export formats:

```powershell
# Export as JASC PAL
git graphics palette game.nes --format jasc --output game.pal

# Export as Adobe ACO
git graphics palette game.nes --format aco --output game.aco

# Export as GIMP GPL
git graphics palette game.nes --format gpl --output game.gpl

```

**Expected Result:**
- Files created in correct format

- Can be imported into respective programs

**Verification:**

- [ ] JASC PAL works in Paint Shop Pro

- [ ] ACO works in Photoshop

- [ ] GPL works in GIMP

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-GFX-001 | Extract CHR | ☐ | | |
| TEST-GFX-002 | Custom output dir | ☐ | | |
| TEST-GFX-003 | CHR-RAM handling | ☐ | | |
| TEST-GFX-004 | PNG output | ☐ | | |
| TEST-GFX-005 | Extract palette | ☐ | | |
| TEST-GFX-006 | Color display | ☐ | | |
| TEST-GFX-007 | Export formats | ☐ | | |

**Total:** 0/7 tests completed

---

**Next:** [Analysis Tools Testing](analysis-tools.md)
