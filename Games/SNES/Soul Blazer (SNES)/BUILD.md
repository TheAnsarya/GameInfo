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

### Animation Analyzer
```bash
python animation_analyzer.py --report       # Print analysis report
python animation_analyzer.py --output DIR   # Export to JSON files
```
Features:
- Scans ROM for animation sequence patterns
- Maps player animation states (24 animations)
- Exports animation frame data to JSON
- Reports animation patterns by bank

### Entity Extractor
```bash
python entity_extractor.py --summary        # Print summary only
python entity_extractor.py --wikitext       # Generate wiki output
python entity_extractor.py --output DIR     # Export to JSON files
```
Features:
- Extracts enemy definitions (stats, behavior, sprites)
- Boss data extraction (8 bosses)
- NPC type definitions
- Movement pattern analysis
- JSON export for each entity type

### Compression Analyzer
```bash
python compression_analyzer.py --known      # Analyze known blocks
python compression_analyzer.py --scan       # Scan ROM for compressed data
python compression_analyzer.py --test OFFSET # Test decompression at offset
```
Features:
- RLE decompression support
- LZ77 decompression support
- Compression type detection
- Ratio analysis and statistics
- Exports decompressed blocks to binary

### Save Editor
```bash
python save_editor.py save.srm              # Display save info
python save_editor.py save.srm --export data.json  # Export to JSON
python save_editor.py save.srm --slot 1 --max-stats --output new.srm
```
Features:
- Read/write SRAM save files
- Edit character stats (level, HP, EXP, GEMs)
- Modify equipment (sword, armor, magic)
- Track progress (area, souls, lairs)
- Unlock items and emblems
- JSON import/export

### Collision Viewer
```bash
python collision_viewer.py                 # Launch GUI viewer
python collision_viewer.py --export        # Export all collision maps
python collision_viewer.py --map 00        # Analyze specific map (hex ID)
```
Features:
- Visualize map collision data
- 16 collision types (walkable, solid, water, pit, etc.)
- Color-coded overlay display
- Export collision maps to PNG
- Tile-by-tile inspection
- Collision statistics per map

### Dialog Editor
```bash
python dialog_editor.py                    # Launch GUI editor
python dialog_editor.py --rom PATH         # Open specific ROM
```
Features:
- GUI text/dialogue editor
- Custom text codec for Soul Blazer encoding
- Control code toolbar (newline, pause, clear, player name, etc.)
- Dialog block navigation by category
- Find/search functionality
- Entry validation
- JSON import/export for translations
- Raw hex view for debugging

### Event Flags Analyzer
```bash
python event_flags_analyzer.py             # Print summary
python event_flags_analyzer.py --wikitext  # Generate wiki output
python event_flags_analyzer.py --area "GreenWood"  # Show area flags
python event_flags_analyzer.py --output DIR  # Export to JSON
```
Features:
- Documents all game progression flags
- Flag categories (lairs, souls, items, events, bosses, emblems)
- Dependencies and prerequisites tracking
- Progression order documentation
- 49 known flags across 7 areas
- 17 progression steps mapped

### Audio Player
```bash
python audio_player.py                     # Launch GUI player
python audio_player.py --list              # List all sounds
python audio_player.py --rom PATH          # Open specific ROM
python audio_player.py --export-all DIR    # Export all audio to WAV
```
Features:
- GUI audio player with waveform display
- 22 background music tracks
- 16 sound effects
- BRR sample decoding
- WAV export functionality
- Volume control
- Audio catalog export to JSON

### Memory Scanner
```bash
python memory_scanner.py                   # Scan all banks, print summary
python memory_scanner.py --wikitext        # Generate wiki output
python memory_scanner.py --bank 00         # Scan specific bank (hex)
python memory_scanner.py --output DIR      # Export scan results to JSON
```
Features:
- Scans ROM for memory access patterns
- 50+ known RAM address definitions
- Hot address detection (frequently accessed)
- 65816 opcode analysis
- Read/write tracking
- Memory region classification (WRAM, SRAM, Hardware, ROM)
- JSON export of scan results
- Wikitext documentation generation

### Pointer Scanner
```bash
python pointer_scanner.py                  # Scan all banks for pointer tables
python pointer_scanner.py --known          # Scan known tables only
python pointer_scanner.py --bank 5         # Scan specific bank (decimal)
python pointer_scanner.py --wikitext       # Generate wiki output
python pointer_scanner.py --output DIR     # Export to JSON
```
Features:
- Scans ROM for pointer tables
- 15 known pointer table locations
- 16-bit and 24-bit pointer support
- LoROM address conversion
- Data block size analysis
- Table validation (minimum 4 consecutive valid pointers)
- Per-bank scanning
- JSON and wikitext export

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
