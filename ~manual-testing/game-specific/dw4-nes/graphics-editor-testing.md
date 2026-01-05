# Dragon Warrior IV (NES) - Graphics Editor Manual Testing

## Overview

DW4 uses the NES 2bpp (2 bits per pixel) tile format for all graphics. This document covers testing procedures for sprite editing, tileset modification, and palette management.

## Graphics Architecture

### Tile Format
- **Format:** NES 2bpp planar
- **Tile Size:** 8×8 pixels
- **Bytes per Tile:** 16 (8 bytes plane 0, 8 bytes plane 1)
- **Colors per Tile:** 4 (including transparent)

### ROM Banks
| Bank | Content | Address Range |
|------|---------|---------------|
| $00-$01 | Common CHR | Various |
| $08 | Map Tilesets | $8000-$BFFF |
| $0A-$0B | Monster Sprites | $8000-$BFFF |
| $0C | Character Sprites | $8000-$BFFF |
| $0D | Battle UI | $8000-$9FFF |
| $0E | Field Sprites | $8000-$BFFF |

### Palette System
- 4 background palettes (16 colors total, 4 per palette)
- 4 sprite palettes (16 colors total, 4 per palette)
- Color 0 is always transparent for sprites

## Test Cases

### TC-001: Load Tileset Graphics
**Objective:** Verify tileset loading and display

**Steps:**
1. Open graphics editor
2. Select Bank $08 (Map Tilesets)
3. Load tileset at offset $8000
4. Verify tile grid displays 256 tiles (16×16 grid)
5. Check for visual correctness

**Expected Results:**
- Tiles display without corruption
- Grid alignment correct
- Palette preview functional

### TC-002: Edit Single Tile
**Objective:** Test pixel editing

**Steps:**
1. Load castle tileset (Bank $08)
2. Select tile 0x20 (floor tile)
3. Change pixel at (4, 4) from color 1 to color 2
4. Save changes
5. View in map editor to confirm change

**Pixel Color Values:**
- 0: Transparent/Background
- 1: Color 1 (typically outline)
- 2: Color 2 (typically midtone)
- 3: Color 3 (typically highlight)

### TC-003: Monster Sprite Editing
**Objective:** Test monster sprite graphics

**Steps:**
1. Load Bank $0A (Monster Sprites)
2. Locate Slime sprite (offset $8000)
3. Verify 2×2 tile composition (16×16 pixels total)
4. Edit top-left tile
5. Export sprite sheet for comparison

**Monster Sprite Layout:**
```
Most monsters: 2×2 tiles = 16×16 pixels
Large monsters: 2×4 tiles = 16×32 pixels
Boss sprites: 4×4 tiles = 32×32 pixels
```

### TC-004: Character Sprite Editing
**Objective:** Test playable character sprites

**Steps:**
1. Load Bank $0C (Character Sprites)
2. Locate Ragnar walking sprites
3. Verify 4 directions × 2 frames = 8 sprite sets
4. Edit south-facing frame 1
5. Test in emulator by walking south

**Character Sprite Offsets:**
| Character | Offset | Notes |
|-----------|--------|-------|
| Ragnar | $8000 | Chapter 1 |
| Alena | $8200 | Chapter 2 |
| Cristo | $8400 | Chapter 2 |
| Brey | $8600 | Chapter 2 |
| Taloon | $8800 | Chapter 3 |
| Nara | $8A00 | Chapter 4 |
| Mara | $8C00 | Chapter 4 |
| Hero | $8E00 | Chapter 5 |

### TC-005: Palette Editing
**Objective:** Test palette modification

**Steps:**
1. Load palette data from Bank $00
2. View background palette 0 (castle interior)
3. Change color 2 from blue to green
4. Apply to tileset preview
5. Verify color change in map editor

**NES Palette Values (0x00-0x3F):**
```
0x00-0x0C: Grays
0x10-0x1C: Blues
0x20-0x2C: Greens
0x30-0x3C: Reds
0x0D, 0x1D, 0x2D, 0x3D: Dark tones
0x0E, 0x1E, 0x2E, 0x3E: Very dark
0x0F, 0x1F, 0x2F, 0x3F: Black
```

### TC-006: Export/Import PNG
**Objective:** Test PNG conversion pipeline

**Steps:**
1. Load castle tileset
2. Export to PNG (256 tiles in 16×16 grid)
3. Edit PNG in external editor (GIMP, etc.)
4. Import modified PNG
5. Verify tiles updated correctly

**Export Settings:**
- Output: Indexed 4-color PNG
- Grid: 16 tiles wide × 16 tiles tall
- Pixel scale: 1:1 (8×8 per tile)

### TC-007: Sprite Sheet Export
**Objective:** Test sprite sheet generation

**Steps:**
1. Load all monster sprites (Bank $0A-$0B)
2. Export sprite sheet with all 209 monsters
3. Verify layout (monsters arranged by ID)
4. Check for missing/corrupt sprites
5. Import modified sheet

**Sprite Sheet Layout:**
```
Row 0: Monsters 0x00-0x0F
Row 1: Monsters 0x10-0x1F
...
Row 12: Monsters 0xC0-0xD0 (bosses)
```

### TC-008: Animation Frame Testing
**Objective:** Verify animation support

**Steps:**
1. Load character sprites
2. View Ragnar walk cycle (2 frames)
3. Preview animation at 8 FPS
4. Edit frame 2
5. Verify animation plays smoothly

**Animation Patterns:**
- Walk: 2 frames per direction
- Attack: 2 frames
- Cast spell: 2 frames
- Hurt: 1 frame

## Tileset Test Reference

### Castle Tileset (0x01)
| Range | Content |
|-------|---------|
| 0x00-0x0F | Wall tiles |
| 0x10-0x1F | Floor tiles |
| 0x20-0x2F | Door/window tiles |
| 0x30-0x3F | Furniture |
| 0x40-0x4F | Stairs/columns |
| 0x50+ | Decorations |

### Town Tileset (0x02)
| Range | Content |
|-------|---------|
| 0x00-0x0F | Building exteriors |
| 0x10-0x1F | Ground/paths |
| 0x20-0x2F | Shop signs |
| 0x30-0x3F | Trees/plants |
| 0x40+ | NPCs/objects |

## Regression Tests

### RT-001: Round-Trip Graphics
1. Export entire CHR bank to raw binary
2. Import binary back
3. Binary compare: bytes must match exactly

### RT-002: Palette Integrity
1. Edit palette color
2. Verify only affected tiles change
3. Undo edit
4. Verify original colors restored

### RT-003: Multi-Tile Sprites
1. Edit one tile of 2×2 sprite
2. Verify other tiles unchanged
3. Verify sprite renders correctly in-game

## Known Issues

1. **Bank switching** - Some sprites span multiple banks; editor must handle seamlessly
2. **Mirroring** - NES supports hardware sprite mirroring; editor should indicate mirrored tiles
3. **Palette conflicts** - Background and sprite palettes share indices; editing one may affect perception of other

## Tools Required

- **YY-CHR** - Alternative NES tile editor for comparison
- **Tile Molester** - Tile viewer for verification
- **FCEUX PPU Viewer** - Runtime verification of changes

## Test Harness

```csharp
using DW4Lib.Graphics;

// Load tile from ROM
var tile = TileLoader.Load2bpp(romData, 0x28000, 16);

// Verify tile dimensions
Assert.AreEqual(8, tile.Width);
Assert.AreEqual(8, tile.Height);
Assert.AreEqual(16, tile.RawBytes.Length);

// Edit pixel
tile.SetPixel(4, 4, 2);
Assert.AreEqual(2, tile.GetPixel(4, 4));

// Convert to PNG
var png = tile.ToPng(palette);
Assert.IsNotNull(png);
```

## DQ3r Conversion Notes

Converting DW4 2bpp graphics to DQ4r 4bpp:
1. Map 2bpp colors (0-3) to 4bpp (0, 5, 10, 15)
2. Expand 8×8 tiles to match SNES tile format
3. Double resolution where appropriate (16×16 → 32×32)
4. Convert palettes to 15-bit SNES color format

```csharp
// 2bpp to 4bpp conversion
var nesColor = tile.GetPixel(x, y); // 0-3
var snesColor = nesColor * 5;       // 0, 5, 10, 15
```

## Sign-Off

| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-001 | | | ☐ |
| TC-002 | | | ☐ |
| TC-003 | | | ☐ |
| TC-004 | | | ☐ |
| TC-005 | | | ☐ |
| TC-006 | | | ☐ |
| TC-007 | | | ☐ |
| TC-008 | | | ☐ |
| RT-001 | | | ☐ |
| RT-002 | | | ☐ |
| RT-003 | | | ☐ |
