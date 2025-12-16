# Map Editor View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The Map Editor View provides a visual interface for editing game maps and tilemaps. It supports multiple layers, tile selection, collision editing, and export functionality.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] ROM file loaded with known map data
- [ ] Map configuration/definition available
- [ ] Understanding of tilemap structure for the game

---

## 🧪 Test Cases

### TEST-MAP-001: Open Map Editor View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a ROM file
3. Navigate to Map Editor view

**Expected Results:**
- [ ] Map Editor view opens without errors
- [ ] Map canvas area visible
- [ ] Tile palette visible
- [ ] Tool palette visible

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-002: Load Map Data

**Steps:**
1. Open Map Editor
2. Load map data (specify offset or select from list)
3. Observe map rendering

**Expected Results:**
- [ ] Map loads without errors
- [ ] Tiles rendered correctly
- [ ] Map dimensions displayed
- [ ] Correct tileset used

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-003: Pan/Scroll Map

**Steps:**
1. Open a large map in Map Editor
2. Drag to pan (middle mouse or Space+drag)
3. Use scroll bars
4. Use arrow keys

**Expected Results:**
- [ ] Panning works smoothly
- [ ] Scroll bars update position
- [ ] Arrow keys scroll map
- [ ] No rendering artifacts

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-004: Zoom Map

**Steps:**
1. Open Map Editor
2. Zoom in (+ key or Ctrl+wheel)
3. Zoom out (- key or Ctrl+wheel)
4. Reset zoom (Z key or View → Reset Zoom)

**Expected Results:**
- [ ] Zoom in increases tile size
- [ ] Zoom out decreases tile size
- [ ] Zoom level indicator shows percentage
- [ ] Reset returns to 100%

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-005: Select Tile from Palette

**Steps:**
1. Open Map Editor
2. View tile palette panel
3. Click on a tile to select it
4. Observe selection indicator

**Expected Results:**
- [ ] Tile palette shows available tiles
- [ ] Clicking selects tile
- [ ] Selected tile highlighted
- [ ] Cursor shows selected tile

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-006: Place Single Tile

**Steps:**
1. Select a tile from palette
2. Click on map canvas
3. Observe tile placement

**Expected Results:**
- [ ] Tile placed at clicked position
- [ ] Map updates immediately
- [ ] Correct tile ID recorded
- [ ] Undo available

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-007: Paint Tool (Brush)

**Steps:**
1. Select paint/brush tool
2. Select a tile
3. Click and drag on map

**Expected Results:**
- [ ] Brush tool selected
- [ ] Dragging paints tiles
- [ ] Continuous stroke recorded
- [ ] No gaps in painted area

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-008: Fill Tool (Bucket)

**Steps:**
1. Select fill/bucket tool
2. Select a tile
3. Click on a region of same tiles

**Expected Results:**
- [ ] Fill tool selected
- [ ] Contiguous area filled
- [ ] Respects boundaries
- [ ] Large fills don't freeze app

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-009: Rectangle Select Tool

**Steps:**
1. Select rectangle tool
2. Draw rectangle on map
3. Observe selection

**Expected Results:**
- [ ] Rectangle tool selected
- [ ] Drag creates selection box
- [ ] Selection marquee visible
- [ ] Selected area highlighted

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-010: Copy/Paste Selection

**Steps:**
1. Make a rectangular selection
2. Copy (Ctrl+C)
3. Navigate to new location
4. Paste (Ctrl+V)

**Expected Results:**
- [ ] Selection copied to clipboard
- [ ] Paste preview visible
- [ ] Click to place pasted tiles
- [ ] Multiple pastes allowed

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-011: Undo/Redo Operations

**Steps:**
1. Make several map edits
2. Undo (Ctrl+Z) multiple times
3. Redo (Ctrl+Y) multiple times

**Expected Results:**
- [ ] Each undo reverts one operation
- [ ] Multiple undos work
- [ ] Redo restores undone changes
- [ ] Undo history preserved

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-012: Grid Toggle

**Steps:**
1. Open Map Editor
2. Toggle grid (G key or View → Grid)
3. Observe grid display

**Expected Results:**
- [ ] Grid toggle available
- [ ] Grid shows tile boundaries
- [ ] Grid visible at all zoom levels
- [ ] Grid color configurable (optional)

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-013: Layer Selection

**Steps:**
1. Open Map Editor with multi-layer map
2. View layer panel
3. Select different layers
4. Toggle layer visibility

**Expected Results:**
- [ ] Layer panel shows all layers
- [ ] Clicking selects layer for editing
- [ ] Eye icon toggles visibility
- [ ] Only selected layer editable

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-014: Collision Layer

**Steps:**
1. Open Map Editor
2. Switch to collision layer
3. Edit collision tiles
4. Test collision visibility toggle

**Expected Results:**
- [ ] Collision layer accessible
- [ ] Collision types selectable
- [ ] Collision overlay visible
- [ ] Collision data saveable

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-015: Tile Properties

**Steps:**
1. Click on a placed tile
2. View tile properties panel
3. Modify properties (flip, palette, etc.)

**Expected Results:**
- [ ] Tile info displayed
- [ ] Tile ID shown
- [ ] Flip H/V options (if supported)
- [ ] Palette assignment (if supported)

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-016: Export Map as Image

**Steps:**
1. Open Map Editor with map loaded
2. Export map (File → Export Image)
3. Choose PNG format

**Expected Results:**
- [ ] Export dialog opens
- [ ] Format options available
- [ ] Exported image correct
- [ ] All visible layers included

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-017: Export Map Data

**Steps:**
1. Open Map Editor
2. Export map data (File → Export Data)
3. Choose format (JSON/Binary)

**Expected Results:**
- [ ] Export data dialog opens
- [ ] JSON format available
- [ ] Binary format available
- [ ] Exported data accurate

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-018: Import Map Data

**Steps:**
1. Open Map Editor
2. Import map (File → Import)
3. Select map data file
4. Observe import

**Expected Results:**
- [ ] Import dialog opens
- [ ] Format auto-detected
- [ ] Map loads correctly
- [ ] Dimensions handled

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-019: Keyboard Shortcuts

**Steps:**
1. Open Map Editor
2. Test shortcuts:
   - 1-6: Tool selection
   - G: Toggle grid
   - Z: Zoom fit
   - +/-: Zoom in/out
   - Ctrl+Z/Y: Undo/Redo

**Expected Results:**
- [ ] Number keys select tools
- [ ] G toggles grid
- [ ] Z fits map to view
- [ ] All shortcuts functional

**Result:** ☐ Pass ☐ Fail

---

### TEST-MAP-020: Large Map Performance

**Steps:**
1. Load a large map (256x256 or bigger)
2. Pan across map
3. Zoom in and out
4. Make edits

**Expected Results:**
- [ ] Map loads in reasonable time
- [ ] Scrolling remains smooth
- [ ] No visible lag on edits
- [ ] Memory usage reasonable

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-MAP-001 | Open Map Editor View | ☐ |
| TEST-MAP-002 | Load Map Data | ☐ |
| TEST-MAP-003 | Pan/Scroll Map | ☐ |
| TEST-MAP-004 | Zoom Map | ☐ |
| TEST-MAP-005 | Select Tile from Palette | ☐ |
| TEST-MAP-006 | Place Single Tile | ☐ |
| TEST-MAP-007 | Paint Tool (Brush) | ☐ |
| TEST-MAP-008 | Fill Tool (Bucket) | ☐ |
| TEST-MAP-009 | Rectangle Select Tool | ☐ |
| TEST-MAP-010 | Copy/Paste Selection | ☐ |
| TEST-MAP-011 | Undo/Redo Operations | ☐ |
| TEST-MAP-012 | Grid Toggle | ☐ |
| TEST-MAP-013 | Layer Selection | ☐ |
| TEST-MAP-014 | Collision Layer | ☐ |
| TEST-MAP-015 | Tile Properties | ☐ |
| TEST-MAP-016 | Export Map as Image | ☐ |
| TEST-MAP-017 | Export Map Data | ☐ |
| TEST-MAP-018 | Import Map Data | ☐ |
| TEST-MAP-019 | Keyboard Shortcuts | ☐ |
| TEST-MAP-020 | Large Map Performance | ☐ |

**Total: 20 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Map format varies significantly between games
- Some maps use compression (RLE, LZSS, etc.)
- Layer support depends on game/platform
- Tileset/palette association is game-specific
