# Robotrek Build & Extraction Guide

This document describes how to extract assets from the Robotrek ROM and build a modified ROM.

## Prerequisites

- Python 3.10+
- Original Robotrek ROM (CRC32: `7ad4aadc`)
- Required Python packages (see `requirements.txt`)

## ROM Verification

Before working with the ROM, verify its integrity:

```powershell
python tools/rom_analyzer.py --verify "path/to/Robotrek (U) [!].sfc"
```

Expected output:
```
Robotrek (U) [!].sfc
  CRC32:  7ad4aadc ✓
  SHA1:   e315830e71cc6da91234813f70835d26802c0ea1 ✓
  Size:   1,572,864 bytes (1.5 MB) ✓
  Mapper: HiROM+FastROM ✓
```

## Asset Extraction

### Extract All Assets

```powershell
python tools/asset_extractor.py \
	--rom "path/to/Robotrek.sfc" \
	--output assets/ \
	--extract-all
```

### Extract Specific Asset Types

```powershell
# Graphics only
python tools/asset_extractor.py --rom "Robotrek.sfc" --output assets/graphics --graphics

# Text/Dialog only
python tools/text_extractor.py --rom "Robotrek.sfc" --output assets/text

# Audio only (SPC music)
python tools/audio_extractor.py --rom "Robotrek.sfc" --output assets/audio

# Items/Inventions data
python tools/data_extractor.py --rom "Robotrek.sfc" --output assets/data
```

## Data Editors

### Invention Editor

Edit robot parts and invention combinations:

```powershell
python tools/invention_editor.py --rom "Robotrek.sfc"
```

### Item Editor

Edit item properties, prices, and effects:

```powershell
python tools/item_editor.py --rom "Robotrek.sfc"
```

### Enemy Editor

Edit enemy statistics and behaviors:

```powershell
python tools/enemy_editor.py --rom "Robotrek.sfc"
```

## Build Pipeline

### Configuration

Create or edit `build.config.json`:

```json
{
	"rom": {
		"name": "Robotrek",
		"original": "roms/Robotrek (U) [!].sfc",
		"output": "build/Robotrek-modified.sfc"
	},
	"assets": {
		"graphics": "assets/graphics",
		"text": "assets/text",
		"data": "assets/data"
	},
	"options": {
		"verify_checksums": true,
		"update_internal_checksum": true
	}
}
```

### Build Modified ROM

```powershell
# Standard build
python tools/build_rom.py --config build.config.json

# Clean build (regenerate all assets)
python tools/build_rom.py --config build.config.json --clean

# Verify build
python tools/verify_rom.py --original "Robotrek.sfc" --built "build/Robotrek-modified.sfc"
```

## Disassembly

### Generate Disassembly

```powershell
# Full disassembly
python tools/disassembler.py --rom "Robotrek.sfc" --output disasm/

# With labels/symbols
python tools/disassembler.py --rom "Robotrek.sfc" --output disasm/ --labels data/labels.txt
```

### Reassemble

```powershell
# Using ca65 assembler
ca65 -o build/bank00.o disasm/bank00.asm
ld65 -C robotrek.cfg -o build/Robotrek.sfc build/*.o
```

## Directory Structure

```
assets/
├── graphics/
│   ├── sprites/          # Character/enemy sprites
│   │   ├── hero/         # Main character
│   │   ├── robots/       # Robot sprites
│   │   └── enemies/      # Enemy sprites
│   ├── tilesets/         # Map/dungeon tilesets
│   ├── backgrounds/      # Background graphics
│   └── ui/               # Menu/interface graphics
├── audio/
│   ├── music/            # SPC music files
│   └── sfx/              # Sound effects
├── text/
│   ├── dialog/           # NPC dialog
│   ├── menus/            # Menu text
│   └── items/            # Item descriptions
└── data/
	├── items.json        # Item definitions
	├── inventions.json   # Invention/parts data
	├── enemies.json      # Enemy statistics
	├── maps.json         # Map data
	└── events.json       # Event scripts
```

## Technical Notes

### Memory Map

Robotrek uses HiROM mapping:

| Bank | Address | Description |
|------|---------|-------------|
| $c0-$cf | $0000-$ffff | Program ROM (banks 0-15) |
| $d0-$df | $0000-$ffff | Program ROM (banks 16-31) |
| $70-$77 | $0000-$1fff | Save RAM |

### Compression

Robotrek uses several compression methods:
- **Graphics**: LZSS-based compression for sprites/tiles
- **Text**: Dictionary-based compression with DTE
- **Maps**: Run-length encoding (RLE)

### Known Pointers

| Address | Description |
|---------|-------------|
| $c08000+ | Main program code |
| TBD | Item table |
| TBD | Enemy table |
| TBD | Invention table |
| TBD | Text pointers |
| TBD | Map data |

## Troubleshooting

### ROM Checksum Mismatch

If the internal checksum doesn't match after modifications:

```powershell
python tools/fix_checksum.py --rom "build/Robotrek-modified.sfc"
```

### Graphics Corruption

If graphics appear corrupted after extraction:
1. Verify the correct palette is being used
2. Check tile format (4bpp for most graphics)
3. Ensure correct VRAM mapping

### Text Encoding Issues

Robotrek uses a custom text encoding. Use the provided TBL file:

```powershell
python tools/text_extractor.py --rom "Robotrek.sfc" --tbl data/robotrek.tbl
```
