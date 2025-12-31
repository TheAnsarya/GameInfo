# Graphics Extraction Workflow

How to extract tile graphics from SNES ROMs.

## 🎯 Overview

SNES graphics are stored as:
- **Tiles**: 8x8 pixel blocks in 2bpp or 4bpp format
- **Tilemaps**: References to tiles for building screens
- **Palettes**: Color lookup tables

## 📋 Prerequisites

- Emulator with VRAM viewer (Mesen-S/bsnes-plus)
- Tile editor (Tile Molester, YY-CHR)
- ROM hex editor
- Python (for custom scripts)

## 🔬 Extraction Steps

### Step 1: Locate Graphics in VRAM

1. Load save state at desired graphics
2. Open PPU/VRAM viewer
3. Identify tile addresses
4. Note tilemap location

### Step 2: Find ROM Source

See [DMA Tracing](../breakpoint-guides/dma-tracing.md)

1. Set DMA breakpoints
2. Trigger graphics load
3. Record source addresses

### Step 3: Determine Format

| Indicator | Likely Format |
|-----------|---------------|
| High entropy | Compressed |
| Regular patterns | Raw tiles |
| Small size | 2bpp |
| Larger size | 4bpp |

### Step 4: Extract Raw Data

**Mesen-S:**
1. Memory Viewer → CPU Memory
2. Navigate to ROM address
3. Select range
4. File → Save Selection

**Hex Editor:**
1. Open ROM
2. Go to offset
3. Select bytes
4. Save as `.bin`

### Step 5: Decode Tiles

**If compressed:**
```python
# Use GameInfo decompression tools
from compression import decompress_lz
raw_data = decompress_lz(compressed_data)
```

**If raw:**
Use directly with tile viewer.

### Step 6: Convert to Image

**Tile Molester:**
1. Open binary file
2. Set format: 4bpp planar SNES
3. Set dimensions
4. Apply palette
5. Export as PNG

**Python:**
```python
from snes_extractor import decode_4bpp_tiles
tiles = decode_4bpp_tiles(raw_data)
save_png(tiles, palette, "output.png")
```

## 📐 SNES Tile Formats

### 4bpp Planar (Most Common)

```
32 bytes per 8x8 tile

Layout:
Bytes 0-15: Bitplanes 0,1 (interleaved by row)
Bytes 16-31: Bitplanes 2,3 (interleaved by row)

Row 0: [bp0_r0, bp1_r0]
Row 1: [bp0_r1, bp1_r1]
...
Row 0: [bp2_r0, bp3_r0]
...
```

### 2bpp Planar

```
16 bytes per 8x8 tile

Layout:
Bytes 0-15: Bitplanes 0,1 (interleaved by row)
```

## 🎨 Palette Extraction

1. Open CGRAM viewer in emulator
2. Identify palette index used by tiles
3. Export 16 or 256 color palette
4. Save as `.pal` or include in PNG

## 📝 Documentation Template

```markdown
## Graphics Asset: [Name]

### Location
- ROM Address: $______
- Size: $____
- Format: [4bpp/2bpp/compressed]
- Compression: [None/LZ/RLE/etc.]

### Dimensions
- Tile Count: ___
- Arrangement: [width x height tiles]

### Palette
- Palette Index: ___
- CGRAM Address: $___

### Extraction Command
```
python snes_extractor.py --rom dq3.sfc --offset 0x______ --size 0x____ --format 4bpp -o output.png
```

### Notes
[Any special handling required]
```

## 🔗 Related

- [VRAM Analysis](../breakpoint-guides/vram-analysis.md)
- [Compression Analysis](compression-analysis.md)
