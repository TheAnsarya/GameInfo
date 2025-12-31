# Graphics System Comparison: DW4 NES vs DQ3r SNES

## Overview

This document compares the graphics systems between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES), providing specifications for graphics conversion tools.

## Hardware Capabilities

### NES PPU (Picture Processing Unit)

| Feature | Specification |
|---------|---------------|
| Resolution | 256 × 240 pixels |
| Colors | 54 colors available |
| On-screen | 25 colors (4 palettes × 4 + 1 bg) |
| Sprites | 64 sprites, 8 per scanline |
| Sprite Size | 8×8 or 8×16 pixels |
| BG Layers | 1 layer |
| Tile Format | 2bpp (2 bits per pixel) |
| Pattern Tables | 256 tiles × 2 (BG + sprites) |
| Nametables | 2KB (32×30 tiles) |

### SNES PPU

| Feature | Specification |
|---------|---------------|
| Resolution | 256 × 224 pixels (typical) |
| Colors | 32,768 colors available |
| On-screen | 256 colors (8 palettes × 16 × 2) |
| Sprites | 128 sprites, 32 per scanline |
| Sprite Size | 8×8 to 64×64 pixels |
| BG Layers | 4 layers (Mode 1) |
| Tile Format | 2bpp, 4bpp, or 8bpp |
| VRAM | 64KB |
| OAM | 544 bytes |

## Tile Format Conversion

### NES 2bpp Format

```
NES Tile (8×8 pixels, 16 bytes):
  Bytes 0-7:   Bit plane 0 (low bit of each pixel)
  Bytes 8-15:  Bit plane 1 (high bit of each pixel)

Example tile row:
  Row 0, Plane 0: $7C = 01111100
  Row 0, Plane 1: $00 = 00000000
  Pixel values:    01110000 (0,1,1,1,0,0,0,0)
```

### SNES 4bpp Format

```
SNES Tile (8×8 pixels, 32 bytes):
  Bytes 0-15:  Bit planes 0-1 (interleaved)
  Bytes 16-31: Bit planes 2-3 (interleaved)

Interleaved format per row:
  Row 0: Plane0, Plane1
  Row 1: Plane0, Plane1
  ... (8 rows)
  Row 0: Plane2, Plane3
  Row 1: Plane2, Plane3
  ... (8 rows)
```

### Conversion Algorithm

```csharp
public class TileConverter
{
    /// <summary>
    /// Convert NES 2bpp tile to SNES 4bpp tile.
    /// New planes (2-3) are set to 0, preserving colors 0-3.
    /// </summary>
    public byte[] Convert2bppTo4bpp(byte[] nesTile)
    {
        if (nesTile.Length != 16)
            throw new ArgumentException("NES tile must be 16 bytes");
        
        var snesTile = new byte[32];
        
        for (int row = 0; row < 8; row++)
        {
            // Copy existing bit planes (interleaved)
            snesTile[row * 2] = nesTile[row];        // Plane 0
            snesTile[row * 2 + 1] = nesTile[row + 8]; // Plane 1
            
            // New bit planes are 0 (colors stay 0-3)
            snesTile[16 + row * 2] = 0;     // Plane 2
            snesTile[16 + row * 2 + 1] = 0; // Plane 3
        }
        
        return snesTile;
    }
}
```

## Palette Conversion

### NES Palette System

```
NES has fixed 54-color palette:
  $00-$0F: Grays and darks
  $10-$1F: Unsaturated colors
  $20-$2F: Saturated colors
  $30-$3F: Light/bright colors

Background palettes (4):
  $3F00: Universal background color
  $3F01-$3F03: Palette 0 colors 1-3
  $3F05-$3F07: Palette 1 colors 1-3
  $3F09-$3F0B: Palette 2 colors 1-3
  $3F0D-$3F0F: Palette 3 colors 1-3

Sprite palettes (4):
  $3F10: (mirrors $3F00)
  $3F11-$3F13: Palette 4 colors 1-3
  ... etc
```

### SNES Palette System

```
SNES uses 15-bit RGB (5 bits per channel):
  Word format: 0BBBBBGG GGGRRRRR
  
CGRAM (512 bytes = 256 colors):
  Palettes 0-7: Background
  Palettes 8-15: Sprites
  Each palette: 16 colors × 2 bytes = 32 bytes
```

### Color Conversion

```csharp
public class PaletteConverter
{
    // NES color to RGB lookup (approximate)
    private static readonly int[] NesColors = new int[64]
    {
        0x666666, 0x002A88, 0x1412A7, 0x3B00A4, // $00-$03
        0x5C007E, 0x6E0040, 0x6C0600, 0x561D00, // $04-$07
        // ... full 64-color table
    };
    
    /// <summary>
    /// Convert NES color index to SNES 15-bit RGB.
    /// </summary>
    public ushort NesToSnes(byte nesColor)
    {
        int rgb = NesColors[nesColor & 0x3F];
        
        int r = (rgb >> 16) & 0xFF;
        int g = (rgb >> 8) & 0xFF;
        int b = rgb & 0xFF;
        
        // Convert 8-bit to 5-bit per channel
        int r5 = r >> 3;
        int g5 = g >> 3;
        int b5 = b >> 3;
        
        // SNES format: 0BBBBBGG GGGRRRRR
        return (ushort)((b5 << 10) | (g5 << 5) | r5);
    }
    
    /// <summary>
    /// Expand 4-color NES palette to 16-color SNES palette.
    /// </summary>
    public ushort[] ExpandPalette(byte[] nesPalette)
    {
        var snesPalette = new ushort[16];
        
        // Copy original 4 colors
        for (int i = 0; i < 4; i++)
        {
            snesPalette[i] = NesToSnes(nesPalette[i]);
        }
        
        // Fill remaining 12 with gradients/variations
        // (or leave as 0 for simple conversion)
        
        return snesPalette;
    }
}
```

## Sprite Systems

### NES Sprites (OAM)

```
OAM Entry (4 bytes):
  +0: Y position (0-239, 0 = top)
  +1: Tile index
  +2: Attributes
      Bit 0-1: Palette (4-7)
      Bit 5: Priority (0=front, 1=behind BG)
      Bit 6: Horizontal flip
      Bit 7: Vertical flip
  +3: X position (0-255, 0 = left)

Max sprites: 64 total, 8 per scanline
8×16 mode: consecutive tile pairs
```

### SNES OAM

```
OAM Entry (4 bytes + 2 bits):
  +0: X position (low 8 bits)
  +1: Y position
  +2: Tile index (low 8 bits)
  +3: Attributes
      Bit 0: Tile high bit (9th bit)
      Bit 1-3: Palette (0-7)
      Bit 4-5: Priority (0-3)
      Bit 6: Horizontal flip
      Bit 7: Vertical flip
  
Extra bits (high table):
  Bit 0: X position high bit (sign)
  Bit 1: Size bit (small/large)

Max sprites: 128 total, 32 per scanline
Sizes configurable: 8×8, 16×16, 32×32, 64×64
```

### Sprite Conversion

```csharp
public class SpriteConverter
{
    public SnesOamEntry ConvertOamEntry(NesOamEntry nes)
    {
        return new SnesOamEntry
        {
            X = nes.X,
            Y = nes.Y,
            TileIndex = nes.TileIndex,  // May need offset adjustment
            Palette = nes.Palette,       // Palette index (needs mapping)
            Priority = nes.Priority ? 0 : 2,  // Map to SNES priority
            FlipH = nes.FlipH,
            FlipV = nes.FlipV,
            Size = false  // Use small sprite size
        };
    }
}
```

## Background/Map Data

### NES Nametable

```
Nametable (1KB each, 2 total):
  $2000-$23FF: Nametable 0
  $2400-$27FF: Nametable 1
  
Layout (32×30 tiles = 960 bytes):
  Each byte = tile index (0-255)
  
Attribute table (64 bytes at end):
  Each byte = palettes for 4×4 tile area
  Bits 0-1: Top-left 2×2 tiles
  Bits 2-3: Top-right 2×2 tiles
  Bits 4-5: Bottom-left 2×2 tiles
  Bits 6-7: Bottom-right 2×2 tiles
```

### SNES Tilemap

```
Tilemap (2KB per layer):
  32×32 or 64×64 tiles
  
Entry (2 bytes per tile):
  Bits 0-9: Tile number (0-1023)
  Bit 10: Horizontal flip
  Bit 11: Vertical flip
  Bits 12-14: Palette
  Bit 15: Priority
```

### Map Conversion

```csharp
public class MapConverter
{
    public ushort[] ConvertNametable(byte[] nametable, byte[] attributes)
    {
        var tilemap = new ushort[32 * 30];
        
        for (int y = 0; y < 30; y++)
        {
            for (int x = 0; x < 32; x++)
            {
                int idx = y * 32 + x;
                byte tileIdx = nametable[idx];
                byte palette = GetPalette(attributes, x, y);
                
                // Build SNES tilemap entry
                tilemap[idx] = (ushort)(
                    tileIdx |           // Tile number
                    (palette << 10)     // Palette
                );
            }
        }
        
        return tilemap;
    }
    
    private byte GetPalette(byte[] attr, int x, int y)
    {
        int attrIdx = (y / 4) * 8 + (x / 4);
        byte attrByte = attr[attrIdx];
        
        int quadrant = ((y % 4) / 2) * 2 + ((x % 4) / 2);
        return (byte)((attrByte >> (quadrant * 2)) & 0x03);
    }
}
```

## Graphics Data Locations

### DW4 NES Graphics

| Type | Bank | Address | Size |
|------|------|---------|------|
| Title screen | $00 | $8000-$8FFF | 4KB |
| Overworld tiles | $0A | $8000-$9FFF | 8KB |
| Town tiles | $0B | $8000-$9FFF | 8KB |
| Dungeon tiles | $0B | $A000-$BFFF | 8KB |
| Battle backgrounds | $18 | $8000-$9FFF | 8KB |
| Monster sprites | $18-$1F | Various | ~64KB |
| Character sprites | $08 | $8000-$9FFF | 8KB |
| Menu/font | $1F | $E000-$EFFF | 4KB |

### DQ3r SNES Graphics

| Type | Address | Size |
|------|---------|------|
| Overworld tiles | $20:0000 | 32KB |
| Battle BG | $24:0000 | 64KB |
| Monster sprites | $28:0000 | 256KB |
| Character sprites | $30:0000 | 128KB |
| Menu/font | $38:0000 | 16KB |

## Monster Sprite Conversion

### NES Monster Sprites

- 8×8 tiles assembled into larger sprites
- Max ~4-6 tiles per small monster
- Large monsters: multiple sprites composited
- 2-3 colors per sprite (+ transparent)

### SNES Monster Sprites

- Larger sprites (16×16 base)
- More colors (15 per palette)
- Animation frames stored
- Compression used

### Conversion Strategy

```csharp
public class MonsterSpriteConverter
{
    public SnesSprite Convert(NesMonsterSprite nes)
    {
        // 1. Extract tile data
        var tiles = ExtractTiles(nes.TileData);
        
        // 2. Convert to 4bpp
        var convertedTiles = tiles.Select(t => 
            TileConverter.Convert2bppTo4bpp(t)).ToArray();
        
        // 3. Expand palette
        var palette = PaletteConverter.ExpandPalette(nes.Palette);
        
        // 4. Create metasprite definition
        var metasprite = BuildMetasprite(nes.Layout, convertedTiles);
        
        // 5. Optionally upscale for SNES
        if (Options.UpscaleSprites)
        {
            metasprite = Upscale2x(metasprite);
        }
        
        return new SnesSprite
        {
            Tiles = convertedTiles,
            Palette = palette,
            Metasprite = metasprite
        };
    }
}
```

## Animation Systems

### DW4 NES Animation

- Simple 2-frame animation
- Palette cycling for effects
- CHR bank switching for major changes

### DQ3r SNES Animation

- Multi-frame sequences
- DMA-based tile updates
- Hardware rotation/scaling (Mode 7)

## Compression

### NES (DW4)

- RLE for map data
- No tile compression
- Pattern reuse

### SNES (DQ3r)

- LZ77 for tile data
- RLE for maps
- Huffman for some data

## Implementation Checklist

### Phase 1: Tile Conversion
- [ ] 2bpp → 4bpp converter
- [ ] Batch tile processing
- [ ] Palette expansion

### Phase 2: Sprite Conversion
- [ ] OAM format converter
- [ ] Metasprite assembler
- [ ] Animation frame handler

### Phase 3: Map Conversion
- [ ] Nametable → tilemap
- [ ] Attribute → palette mapping
- [ ] Layer assignment

### Phase 4: Integration
- [ ] Insert converted graphics
- [ ] Update pointers
- [ ] Test in emulator

## References

- [DW4 Sprite Format](../../dragon-warrior-4-info/docs/formats/SPRITE_FORMAT.md)
- [Technical Specifications](technical-specs.md)
- [Data Formats Comparison](data-formats.md)
