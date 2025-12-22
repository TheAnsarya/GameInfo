# Soul Blazer (SNES) Build Pipeline

This document describes how to extract, modify, and rebuild the Soul Blazer ROM.

## Overview

The build pipeline supports:
- Asset extraction (graphics, text, audio, data)
- Asset modification (edit JSON/PNG files)
- ROM rebuild (reassemble from modified assets)
- Verification (compare against original ROM)

## Requirements

- Python 3.10+
- PIL/Pillow (for graphics)
- Original ROM: `Soul Blazer (U) [!].sfc`

## Directory Structure

```
Soul Blazer (SNES)/
├── assets/
│   ├── audio/        # Audio extraction results
│   ├── banks/        # Raw ROM bank binaries
│   ├── data/         # Game data (enemies, items)
│   ├── graphics/     # Extracted sprites/tiles
│   ├── maps/         # Map scan results
│   └── text/         # Extracted text strings
├── build/
│   └── soul_blazer_rebuilt.sfc
├── disasm/
│   ├── bank00.asm - bank1f.asm  # Disassembly
│   ├── soul_blazer.sym          # Symbol labels
│   └── soul_blazer_ram.map      # RAM map
├── tools/
│   ├── build.py           # Main build script
│   ├── text_extractor.py  # Text extraction
│   ├── graphics_extractor.py
│   ├── sprite_extractor.py
│   ├── audio_extractor.py
│   ├── map_extractor.py
│   ├── map_viewer.py      # GUI viewer
│   └── ...
└── Wiki/
    └── *.wikitext         # Documentation
```

## Quick Start

### 1. Extract All Assets

```bash
cd "Soul Blazer (SNES)/tools"
python build.py extract --rom "../../../~roms/SNES/GoodSNES/Soul Blazer (U) [!].sfc" --output ../assets
```

### 2. Rebuild ROM

```bash
python build.py rebuild --assets ../assets --output ../build/soul_blazer_rebuilt.sfc
```

### 3. Verify Build

```bash
python build.py verify --original "../../../~roms/SNES/GoodSNES/Soul Blazer (U) [!].sfc" --rebuilt ../build/soul_blazer_rebuilt.sfc
```

## Individual Tools

### Text Extraction
```bash
python text_extractor.py
```
Extracts all text strings to JSON files:
- `text_blocks.json` - All dialogue blocks
- `menu_strings.json` - Menu/system text

### Graphics Extraction
```bash
python graphics_extractor.py
```
Extracts:
- 4BPP tilesets from each bank
- Player sprites
- Enemy sprites

### Sprite Extraction
```bash
python sprite_extractor.py
```
Extracts:
- 96 player animation frames
- 2,048 enemy sprite frames
- Output as PNG with transparency

### Audio Analysis
```bash
python audio_extractor.py
```
Analyzes:
- SPC700 audio driver location
- Music track pointers
- BRR sample locations

### Map Viewer
```bash
python map_viewer.py
```
GUI application for:
- Viewing extracted tilesets
- Browsing game areas
- Examining pointer tables

### Palette Extractor
```bash
python palette_extractor.py
```
Extracts:
- 170 SNES color palettes
- PNG preview images for each palette
- JSON export with RGB values

### Palette Manager
```bash
python palette_manager.py
```
Library for:
- Loading extracted palettes
- Mapping areas to palettes
- SNES format conversion

### NPC Analyzer
```bash
python npc_analyzer.py
```
Analyzes:
- NPC patterns (3,036 candidates)
- Dialogue pointer tables (1,465 tables)
- Complete script dump (694 blocks, 3,529 lines)

### Event Analyzer
```bash
python event_analyzer.py
```
Analyzes:
- Soul Lair patterns (1,980 entries)
- Boss data (8 bosses)
- Progression guide generation

### Tilemap Renderer
```bash
python tilemap_renderer.py --list           # List known maps
python tilemap_renderer.py --all            # Render all maps
python tilemap_renderer.py --map "GreenWood" # Render specific map
```
Features:
- Render full game maps to PNG images
- 4BPP tile decoding with palette support
- Tilemap parsing (flip, priority, palette attributes)
- Database of known map locations
- Batch export all maps

### Sprite Viewer
```bash
python sprite_viewer.py
```
GUI application for:
- Viewing character, enemy, and boss sprites
- Bank-based sprite browsing (banks $15-$19)
- Palette selection from 170 extracted palettes
- Zoom controls (1x-8x)
- Batch export all known sprites

## ROM Structure

### Banks
| Bank | Content |
|------|---------|
| $00-$01 | Main program code |
| $02-$04 | Text and dialogue |
| $05 | Game data |
| $06 | Enemy data |
| $07 | Item/equipment |
| $08-$0C | Maps and levels |
| $0D-$0E | Graphics |
| $0F | Audio driver |
| $10-$1F | Sprite graphics |

### Key Addresses
| Address | Purpose |
|---------|---------|
| $00:8000 | Reset vector |
| $00:8342 | NMI handler |
| $07A7F6 | Audio driver |

## Modifying Assets

### Text Editing
1. Edit `assets/text/text_blocks.json`
2. Run rebuild to insert modified text
3. Text uses custom encoding (see wiki)

### Graphics Editing
1. Edit PNGs in `assets/graphics/`
2. Maintain 4BPP palette (16 colors)
3. Rebuild to inject modified graphics

### Data Editing
1. Edit JSON files in `assets/data/`
2. Validate structure matches schema
3. Rebuild to apply changes

## Build Verification

The rebuild process verifies:
1. File size matches original (1MB)
2. Header information preserved
3. Checksum recalculated and fixed
4. Critical code regions unchanged

### Expected Hashes
- **SHA256**: `8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2`
- **SHA1**: `f2832eb02547c39cae3bdaab5c2a53e4f8b31810`
- **MD5**: `83cf41d53a1b94aeea1a645037a24004`
- **CRC32**: `31b965db`

## Troubleshooting

### ROM verification fails
- Ensure using unmodified, headerless ROM
- Check file size is exactly 1,048,576 bytes
- Verify ROM matches expected hashes

### Graphics display incorrectly
- Ensure palette is 16 colors (4BPP)
- Check tile dimensions (8x8 pixels)
- Verify graphics bank alignment

### Text appears garbled
- Check encoding table matches game
- Verify control codes are preserved
- Ensure text fits in original space

## See Also

- [ROM Map](Wiki/Soul%20Blazer%20-%20ROM%20map.wikitext)
- [RAM Map](Wiki/Soul%20Blazer%20-%20RAM%20map.wikitext)
- [Data Tables](Wiki/Soul%20Blazer%20-%20Data%20tables.wikitext)
