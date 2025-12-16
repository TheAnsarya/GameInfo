# CHR Editor View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The CHR Editor View provides a graphical tile editor for viewing and modifying graphics data in ROMs. It supports multiple tile formats (2bpp, 4bpp, 8bpp) and palette management.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] ROM file with known graphics locations loaded
- [ ] Understanding of tile formats for the platform

---

## 🧪 Test Cases

### TEST-CHR-001: Open CHR Editor View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a NES ROM file
3. Navigate to CHR Editor view (View menu or sidebar)

**Expected Results:**
- [ ] CHR Editor view opens without errors
- [ ] Tile grid displays
- [ ] Palette selector visible
- [ ] Tile format selector visible

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-002: Navigate to Address

**Steps:**
1. Open CHR Editor
2. Enter a specific address in the address field (e.g., 0x8000)
3. Press Enter or click "Go"

**Expected Results:**
- [ ] View jumps to specified address
- [ ] Tiles update to show data at new offset
- [ ] Address field shows current position
- [ ] Invalid addresses show error message

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-003: Tile Format Selection - 2bpp

**Steps:**
1. Open a NES or Game Boy ROM
2. Navigate to known graphics area
3. Select "2bpp" tile format

**Expected Results:**
- [ ] Tiles render in 2bpp format (4 colors)
- [ ] Grid shows 8x8 pixel tiles
- [ ] Colors from current palette applied

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-004: Tile Format Selection - 4bpp

**Steps:**
1. Open a SNES or Genesis ROM
2. Navigate to known graphics area
3. Select "4bpp" tile format

**Expected Results:**
- [ ] Tiles render in 4bpp format (16 colors)
- [ ] Grid shows 8x8 pixel tiles
- [ ] Correct interleaving applied

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-005: Palette Selection

**Steps:**
1. Open CHR Editor with tiles displayed
2. Click different palette entries
3. Observe tile colors change

**Expected Results:**
- [ ] Palette selector shows available palettes
- [ ] Clicking palette updates tile display
- [ ] All tiles re-render with new palette
- [ ] No lag during palette switch

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-006: Tile Selection

**Steps:**
1. Open CHR Editor
2. Click on a single tile
3. Shift+Click on another tile (range select)
4. Ctrl+Click on multiple tiles (multi-select)

**Expected Results:**
- [ ] Single click selects one tile (highlighted)
- [ ] Shift+Click selects range of tiles
- [ ] Ctrl+Click toggles individual tiles
- [ ] Selected tiles clearly indicated

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-007: Zoom Controls

**Steps:**
1. Open CHR Editor
2. Use zoom in button/shortcut
3. Use zoom out button/shortcut
4. Try mouse wheel zoom

**Expected Results:**
- [ ] Zoom in increases tile size
- [ ] Zoom out decreases tile size
- [ ] Mouse wheel zooms (if implemented)
- [ ] Zoom level indicator updates

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-008: Grid Display Toggle

**Steps:**
1. Open CHR Editor with tiles visible
2. Toggle grid display (G key or menu)
3. Observe tile boundaries

**Expected Results:**
- [ ] Grid toggle available
- [ ] Grid shows tile boundaries when on
- [ ] Grid hidden when off
- [ ] Tiles still visible without grid

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-009: Export Selected Tiles

**Steps:**
1. Open CHR Editor
2. Select multiple tiles
3. Click Export or use menu (File → Export)
4. Choose PNG format

**Expected Results:**
- [ ] Export dialog opens
- [ ] PNG format available
- [ ] Exported image contains selected tiles
- [ ] Palette correctly applied to export

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-010: Export All Tiles

**Steps:**
1. Open CHR Editor
2. Use "Export All" option
3. Choose output file

**Expected Results:**
- [ ] All visible tiles exported
- [ ] Tileset arranged in readable grid
- [ ] File saves successfully
- [ ] Image viewable in external viewer

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-011: Import Tiles from Image

**Steps:**
1. Open CHR Editor
2. Use Import option
3. Select a PNG tileset image
4. Confirm import location

**Expected Results:**
- [ ] Import dialog opens
- [ ] Image preview shown
- [ ] Tiles converted to ROM format
- [ ] ROM data updated (in memory)

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-012: Edit Individual Pixel

**Steps:**
1. Open CHR Editor
2. Double-click a tile (or use pixel edit mode)
3. Click on individual pixels to change color

**Expected Results:**
- [ ] Pixel editor opens for selected tile
- [ ] Click changes pixel to current palette color
- [ ] Changes visible in real-time
- [ ] Save/Cancel options available

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-013: Undo/Redo Operations

**Steps:**
1. Make several tile edits
2. Press Ctrl+Z to undo
3. Press Ctrl+Y to redo

**Expected Results:**
- [ ] Undo reverts last change
- [ ] Multiple undos work in sequence
- [ ] Redo restores undone changes
- [ ] Undo history persists during session

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-014: Tile Arrangement Options

**Steps:**
1. Open CHR Editor
2. Change tiles per row setting
3. Observe tile grid rearrangement

**Expected Results:**
- [ ] Tiles per row setting available
- [ ] Grid rearranges based on setting
- [ ] Common values: 16, 32 tiles per row
- [ ] No data corruption on rearrange

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-015: Bank Navigation

**Steps:**
1. Open CHR Editor for a banked ROM (NES with CHR banks)
2. Use bank navigation controls
3. Switch between banks

**Expected Results:**
- [ ] Bank selector visible (if applicable)
- [ ] Changing bank loads new tile data
- [ ] Bank number indicator updates
- [ ] Navigation between banks works

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-016: Scroll Through Tiles

**Steps:**
1. Open CHR Editor
2. Use scroll bar or arrow keys
3. Navigate through tile data

**Expected Results:**
- [ ] Vertical scrolling works
- [ ] Arrow keys navigate (if implemented)
- [ ] Page Up/Down moves by larger amounts
- [ ] Scroll position indicator accurate

**Result:** ☐ Pass ☐ Fail

---

### TEST-CHR-017: Keyboard Shortcuts

**Steps:**
1. Open CHR Editor
2. Test various keyboard shortcuts:
   - Arrow keys: Navigate
   - G: Toggle grid
   - +/-: Zoom in/out
   - Ctrl+Z/Y: Undo/Redo

**Expected Results:**
- [ ] All documented shortcuts work
- [ ] No conflicts with system shortcuts
- [ ] Shortcuts work when view is focused

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-CHR-001 | Open CHR Editor View | ☐ |
| TEST-CHR-002 | Navigate to Address | ☐ |
| TEST-CHR-003 | Tile Format - 2bpp | ☐ |
| TEST-CHR-004 | Tile Format - 4bpp | ☐ |
| TEST-CHR-005 | Palette Selection | ☐ |
| TEST-CHR-006 | Tile Selection | ☐ |
| TEST-CHR-007 | Zoom Controls | ☐ |
| TEST-CHR-008 | Grid Display Toggle | ☐ |
| TEST-CHR-009 | Export Selected Tiles | ☐ |
| TEST-CHR-010 | Export All Tiles | ☐ |
| TEST-CHR-011 | Import Tiles from Image | ☐ |
| TEST-CHR-012 | Edit Individual Pixel | ☐ |
| TEST-CHR-013 | Undo/Redo Operations | ☐ |
| TEST-CHR-014 | Tile Arrangement Options | ☐ |
| TEST-CHR-015 | Bank Navigation | ☐ |
| TEST-CHR-016 | Scroll Through Tiles | ☐ |
| TEST-CHR-017 | Keyboard Shortcuts | ☐ |

**Total: 17 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Test with different ROM types to verify format support
- Large ROMs may have performance considerations
- Palette import/export may need additional testing
- Some features may be platform-specific
