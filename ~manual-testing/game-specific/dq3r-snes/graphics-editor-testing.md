# Dragon Quest III Remake (SNES) - Graphics Editor Manual Testing

## Overview

DQ3r SNES uses 4bpp (4 bits per pixel, 16 colors) graphics for tiles, sprites, and backgrounds. The SNES PPU supports multiple graphics modes with DQ3 primarily using Mode 1.

## Graphics Format

### SNES 4bpp Tile Format (32 bytes per 8x8 tile)
```
Bytes 0-15:  Bitplanes 0 and 1 (interleaved)
Bytes 16-31: Bitplanes 2 and 3 (interleaved)

Row structure (4 bytes per row):
  Byte 0: Bitplane 0 for row
  Byte 1: Bitplane 1 for row
  Byte 16+0: Bitplane 2 for row
  Byte 16+1: Bitplane 3 for row
```

### Key Graphics Locations
| Data | SNES Address | Size | Description |
|------|--------------|------|-------------|
| Map Tiles | $e54f38 | ~8KB | Overworld metatile definitions |
| Character Sprites | $c80000+ | ~128KB | Party member graphics |
| Monster Sprites | $d00000+ | ~256KB | Battle monster graphics |
| UI Graphics | $c10000+ | ~32KB | Menu windows, fonts |
| Battle BG | $d80000+ | ~64KB | Battle backgrounds |

### Palette Structure (15 colors + transparent)
```
Each palette entry: 2 bytes (BGR555 format)
  Bits 0-4:   Red (0-31)
  Bits 5-9:   Green (0-31)
  Bits 10-14: Blue (0-31)
  Bit 15:     Unused

16 colors × 2 bytes = 32 bytes per palette
8 palettes per set = 256 bytes total
```

## Test Cases

### TC-001: Load 4bpp Tileset
**Objective:** Verify 4bpp tile loading from ROM

**Steps:**
1. Open graphics editor
2. Load DQ3 SFC ROM
3. Set format to "SNES 4bpp"
4. Navigate to metatile graphics ($e54f38)
5. Verify 237 metatile definitions display

**Expected Results:**
- Tiles render with correct colors
- 32 bytes per tile consumed
- Recognizable terrain graphics (grass, water, trees)

```csharp
// 4bpp decode test
var tileData = new byte[32];
Array.Copy(romData, offset, tileData, 0, 32);

var tile = new byte[8, 8];
for (int y = 0; y < 8; y++) {
    byte bp0 = tileData[y * 2];
    byte bp1 = tileData[y * 2 + 1];
    byte bp2 = tileData[16 + y * 2];
    byte bp3 = tileData[16 + y * 2 + 1];
    
    for (int x = 0; x < 8; x++) {
        int bit = 7 - x;
        int color = ((bp0 >> bit) & 1) |
                   (((bp1 >> bit) & 1) << 1) |
                   (((bp2 >> bit) & 1) << 2) |
                   (((bp3 >> bit) & 1) << 3);
        tile[y, x] = (byte)color;
    }
}
```

### TC-002: Edit Tile Pixels
**Objective:** Test pixel editing in 4bpp mode

**Steps:**
1. Load tile graphics
2. Select a tile (e.g., grass tile #$10)
3. Note original colors
4. Change pixel at (4, 4) from color 5 to color 10
5. Export and verify change

**Expected Results:**
- Pixel update visible in editor
- Export produces valid 4bpp data
- Other pixels unchanged

### TC-003: Load/Edit Palette
**Objective:** Test BGR555 palette handling

**Steps:**
1. Load palette from ROM
2. Verify 16 colors display
3. Select color index 5
4. Change from green to red
5. Verify tile preview updates

**Palette Conversion:**
```csharp
// BGR555 to RGB
ushort bgr555 = (ushort)(romData[offset] | (romData[offset + 1] << 8));
int r = (bgr555 & 0x1F) << 3;
int g = ((bgr555 >> 5) & 0x1F) << 3;
int b = ((bgr555 >> 10) & 0x1F) << 3;

// RGB to BGR555
ushort newBgr = (ushort)((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10));
```

### TC-004: Character Sprite Editing
**Objective:** Test party member sprite editing

**Steps:**
1. Navigate to character sprites ($c80000)
2. Load Hero walking sprites
3. Verify 4 directions × 2 frames = 8 sprites
4. Each sprite is 16×24 pixels (6 tiles)
5. Edit one frame, verify animation

**Character Sprite Layout:**
| Direction | Frame 1 | Frame 2 |
|-----------|---------|---------|
| Down | Tiles 0-5 | Tiles 6-11 |
| Left | Tiles 12-17 | Tiles 18-23 |
| Right | Tiles 24-29 | Tiles 30-35 |
| Up | Tiles 36-41 | Tiles 42-47 |

### TC-005: Monster Sprite Editing
**Objective:** Test battle monster graphics

**Steps:**
1. Navigate to monster sprites
2. Load Slime sprite (first monster)
3. Verify dimensions (variable per monster)
4. Edit colors
5. Test in battle

**Monster Sprite Notes:**
- Variable size (16×16 to 64×64)
- Some monsters use compression
- Palette index in monster data

### TC-006: Metatile Assembly
**Objective:** Test 16×16 metatile editing

**Steps:**
1. Load metatile definitions
2. Select metatile #$01 (grass)
3. View 4 component 8×8 tiles
4. Change one component tile
5. Verify overworld updates

**Metatile Structure (8 bytes):**
```
Offset 0: Top-left tile index
Offset 1: Top-right tile index
Offset 2: Bottom-left tile index
Offset 3: Bottom-right tile index
Offset 4: Palette + flags
Offset 5: Collision/priority
Offset 6-7: Reserved
```

### TC-007: Export Graphics to PNG
**Objective:** Test PNG export functionality

**Steps:**
1. Load tileset
2. Select export range (all 256 tiles)
3. Export to PNG (16 tiles wide)
4. Verify PNG opens in external viewer
5. Verify colors match editor

**Export Settings:**
- Width: 16 tiles = 128 pixels
- Height: 16 tiles = 128 pixels
- Color depth: 8-bit indexed or 24-bit RGB

### TC-008: Import Graphics from PNG
**Objective:** Test PNG import functionality

**Steps:**
1. Create modified PNG in Aseprite
2. Import back to editor
3. Verify tiles update
4. Export to ROM
5. Test in emulator

**Import Requirements:**
- Must match tile dimensions (8×8 per tile)
- Must use valid palette colors
- Indexed PNG preferred

## SNES Graphics Mode Reference

### Mode 1 (Used by DQ3)
| Layer | Depth | Tile Size | Colors |
|-------|-------|-----------|--------|
| BG1 | 4bpp | 8×8 or 16×16 | 16 per palette |
| BG2 | 4bpp | 8×8 or 16×16 | 16 per palette |
| BG3 | 2bpp | 8×8 or 16×16 | 4 per palette |
| Sprites | 4bpp | 8×8 to 64×64 | 16 per palette |

### VRAM Layout (typical DQ3)
| Address | Contents |
|---------|----------|
| $0000-$3FFF | BG1 tiles |
| $4000-$7FFF | BG2 tiles |
| $8000-$9FFF | BG3 tiles |
| $A000-$BFFF | Sprite tiles |
| $C000-$FFFF | Tilemaps |

## Compression

DQ3 uses compression for some graphics:

### BasicRing400 (DQ3Lib)
```csharp
// Decompress for viewing
var decompressed = BasicRing400.Decompress(source, expectedSize);

// Recompress for saving
var compressed = BasicRing400.Compress(decompressed);
```

## Regression Tests

### RT-001: 4bpp Round-Trip
1. Load tiles from ROM
2. Export to PNG
3. Import PNG back
4. Export to 4bpp binary
5. Compare with original

### RT-002: Palette Preservation
1. Load palette
2. Edit one color
3. Save and reload
4. Verify other colors unchanged

### RT-003: Metatile Assembly
1. Edit metatile component
2. Save and reload
3. Verify metatile structure intact
4. Test in game

## Known Issues

1. **Compression** - Some graphics compressed; need decompress before edit
2. **Shared Palettes** - Multiple sprites may share palette; changes affect all
3. **VRAM Limits** - SNES has 64KB VRAM; tile counts limited
4. **Animation** - Animated tiles (water, lava) cycle through palette

## Test Harness

```csharp
public class Snes4bppTile {
    public const int BytesPerTile = 32;
    
    public byte[,] Pixels { get; } = new byte[8, 8];
    
    public static Snes4bppTile FromBytes(byte[] data, int offset = 0) {
        var tile = new Snes4bppTile();
        
        for (int y = 0; y < 8; y++) {
            byte bp0 = data[offset + y * 2];
            byte bp1 = data[offset + y * 2 + 1];
            byte bp2 = data[offset + 16 + y * 2];
            byte bp3 = data[offset + 16 + y * 2 + 1];
            
            for (int x = 0; x < 8; x++) {
                int bit = 7 - x;
                tile.Pixels[y, x] = (byte)(
                    ((bp0 >> bit) & 1) |
                    (((bp1 >> bit) & 1) << 1) |
                    (((bp2 >> bit) & 1) << 2) |
                    (((bp3 >> bit) & 1) << 3)
                );
            }
        }
        
        return tile;
    }
    
    public byte[] ToBytes() {
        var data = new byte[32];
        
        for (int y = 0; y < 8; y++) {
            for (int x = 0; x < 8; x++) {
                int bit = 7 - x;
                byte color = Pixels[y, x];
                
                if ((color & 1) != 0) data[y * 2] |= (byte)(1 << bit);
                if ((color & 2) != 0) data[y * 2 + 1] |= (byte)(1 << bit);
                if ((color & 4) != 0) data[16 + y * 2] |= (byte)(1 << bit);
                if ((color & 8) != 0) data[16 + y * 2 + 1] |= (byte)(1 << bit);
            }
        }
        
        return data;
    }
}

public class SnesPalette {
    public Color[] Colors { get; } = new Color[16];
    
    public static SnesPalette FromBytes(byte[] data, int offset = 0) {
        var palette = new SnesPalette();
        
        for (int i = 0; i < 16; i++) {
            ushort bgr = (ushort)(data[offset + i * 2] | 
                                  (data[offset + i * 2 + 1] << 8));
            int r = (bgr & 0x1F) << 3;
            int g = ((bgr >> 5) & 0x1F) << 3;
            int b = ((bgr >> 10) & 0x1F) << 3;
            palette.Colors[i] = Color.FromRgb((byte)r, (byte)g, (byte)b);
        }
        
        return palette;
    }
}
```

## DQ4r Conversion Notes

Converting DQ3r graphics to DQ4r:
- Same 4bpp format (engine compatible)
- Add chapter-specific palettes
- Scale monster sprites for DQ4 dimensions
- Create new character sprites for DQ4 party

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
