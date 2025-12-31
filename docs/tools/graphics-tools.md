# Graphics Tools Guide

Tools for extracting and editing game graphics.

## Overview

These tools work with tile-based graphics from retro consoles, supporting extraction, viewing, and re-insertion.

## Tools

### tile_viewer.py

View and extract graphics tiles.

```bash
# View NES CHR
python tools/graphics/tile_viewer.py game.nes --offset 0x10010

# View SNES tiles (4bpp)
python tools/graphics/tile_viewer.py game.sfc --offset 0x10000 --bpp 4

# Export to PNG
python tools/graphics/tile_viewer.py game.nes --offset 0x10010 --output tiles.png

# Specify palette
python tools/graphics/tile_viewer.py game.nes --offset 0x10010 --palette "0F,16,27,38"
```

**Options:**
- `--bpp N` - Bits per pixel (1, 2, 4, 8)
- `--width N` - Tiles per row (default: 16)
- `--count N` - Number of tiles to extract
- `--palette` - Palette colors (hex)

### sprite_editor.py

Extract and create sprite sheets.

```bash
# Extract sprite sheet
python tools/graphics/sprite_editor.py game.nes --offset 0x10010 --count 256 --output sprites.png

# Extract with layout info
python tools/graphics/sprite_editor.py game.nes --config sprites.json --output sheet.png

# Import modified sprites
python tools/graphics/sprite_editor.py import game.nes --input modified.png --offset 0x10010
```

### chr_dump.py

Dump all CHR data from NES ROMs.

```bash
# Dump CHR ROM
python tools/graphics/chr_dump.py game.nes --output chr/

# Dump with bank separation
python tools/graphics/chr_dump.py game.nes --output chr/ --by-bank

# Include CHR-RAM patterns (from save state)
python tools/graphics/chr_dump.py game.nes --state save.mss --output chr/
```

### palette_editor.py

Work with color palettes.

```bash
# Extract palette
python tools/graphics/palette_editor.py extract game.sfc --offset 0x1000 --output palette.pal

# View palette
python tools/graphics/palette_editor.py view palette.pal --output palette.png

# Convert formats
python tools/graphics/palette_editor.py convert palette.pal --to jasc --output palette.jasc
```

**Palette Formats:**
- `.pal` - Raw binary
- `.jasc` - JASC-PAL (Paint Shop Pro)
- `.act` - Adobe Color Table
- `.gpl` - GIMP Palette

## Tile Formats

### NES (2bpp planar)

```
8x8 pixels, 16 bytes per tile
Plane 0: 8 bytes (low bits)
Plane 1: 8 bytes (high bits)
```

### SNES 4bpp

```
8x8 pixels, 32 bytes per tile
Planar format: 2 bytes per row, interleaved planes
```

### Game Boy (2bpp)

```
8x8 pixels, 16 bytes per tile
Similar to NES format
```

## Workflow Examples

### Extracting All Graphics

```bash
# 1. Find CHR data
python tools/rom/rom_info.py game.nes --verbose | grep CHR

# 2. Dump all CHR
python tools/graphics/chr_dump.py game.nes --output chr/ --by-bank

# 3. Create reference sheet
python tools/graphics/tile_viewer.py game.nes --offset 0x10010 --count 512 --output all_tiles.png
```

### Editing Sprites

```bash
# 1. Extract current sprites
python tools/graphics/sprite_editor.py game.nes --offset 0x10010 --count 64 --output hero.png

# 2. Edit in graphics editor (GIMP, Aseprite, etc.)

# 3. Re-import
python tools/graphics/sprite_editor.py import game.nes --input hero_modified.png --offset 0x10010
```

### SNES Graphics

```bash
# 1. Find graphics in ROM (look for tile patterns)
python tools/analysis/hex_finder.py game.sfc --pattern-type tiles --bpp 4

# 2. Extract with correct settings
python tools/graphics/tile_viewer.py game.sfc --offset 0x80000 --bpp 4 --output tiles.png

# 3. Extract palette
python tools/graphics/palette_editor.py extract game.sfc --offset 0x1000 --format snes
```

## Color Formats

### NES Palette

64 fixed colors, referenced by index (0x00-0x3F).

### SNES Palette

15-bit RGB (5 bits per channel):
```
%0BBBBBGGGGGRRRRR
```

### Genesis Palette

9-bit RGB (3 bits per channel):
```
%0000BBB0GGG0RRR0
```

## See Also

- [Analysis Tools](analysis-tools.md) - Finding graphics in ROMs
- [Text Tools](text-tools.md) - Font extraction
- [CDL Tools](cdl-tools.md) - Finding rendered graphics regions
