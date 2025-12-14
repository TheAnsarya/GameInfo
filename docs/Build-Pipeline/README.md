# Build Pipeline System

The GameInfo Build Pipeline provides a unified system for assembling retro game ROMs from source code and assets. It supports multiple platforms and provides bidirectional asset conversion.

## Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     Build Pipeline Flow                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ROM File ──────► Asset Extractor ──────► Binary Assets         │
│                                               │                 │
│                                               ▼                 │
│                                          Converters             │
│                                               │                 │
│                                               ▼                 │
│                                      Editable Formats           │
│                                      (JSON, PNG, etc.)          │
│                                               │                 │
│                              ◄──── Edit ─────┘                  │
│                              │                                  │
│                              ▼                                  │
│                          Converters                             │
│                              │                                  │
│                              ▼                                  │
│                       Binary Assets                             │
│                              │                                  │
│                              ▼                                  │
│  New ROM ◄──────── Assembler/Linker ◄──────── Source Code       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Supported Platforms

| Platform | Assembler | Graphics | Status |
|----------|-----------|----------|--------|
| [NES](NES-Pipeline.md) | ca65/ld65 | 2bpp, 8x8 tiles | Planned |
| [SNES](SNES-Pipeline.md) | asar | 2/4/8bpp tiles | Planned |
| [Genesis](Genesis-Pipeline.md) | asm68k | 4bpp planar | Planned |
| [Game Boy](GB-Pipeline.md) | RGBDS | 2bpp tiles | Planned |
| [GBA](GBA-Pipeline.md) | devkitARM | 4/8bpp tiles | Planned |

## Quick Start

### 1. Create a Project Configuration

Create a `build.config.json` in your project root:

```json
{
	"$schema": "https://gameinfo.example.com/schemas/build-config.json",
	"project": {
		"name": "My Game Hack",
		"platform": "nes",
		"version": "1.0.0"
	},
	"source": {
		"baseRom": "roms/original.nes",
		"assembler": "ca65",
		"mainFile": "src/main.asm",
		"includes": ["src/", "include/"],
		"outputRom": "build/modified.nes"
	},
	"assets": {
		"extractDir": "assets/binary",
		"editableDir": "assets/json",
		"graphics": {
			"format": "png",
			"tileSize": [8, 8]
		}
	}
}
```

### 2. Extract Assets from Original ROM

```bash
# Using GameInfo CLI
gameinfo extract --config build.config.json

# Or using the GUI
# Tools → Asset Extractor → Select ROM
```

### 3. Convert to Editable Formats

```bash
gameinfo convert --to-editable --config build.config.json
```

### 4. Edit Your Assets

- Graphics: Edit PNG files with any image editor
- Data: Edit JSON files with text editor or GameInfo tools
- Text: Edit text files using table files (.tbl)

### 5. Build the ROM

```bash
gameinfo build --config build.config.json
```

## Configuration Reference

See [Configuration Schema](Configuration-Schema.md) for full documentation.

### Key Sections

- `project` - Project metadata
- `source` - Assembly source configuration
- `assets` - Asset extraction and conversion settings
- `build` - Build process options

## Asset Types

### Graphics
- **Tiles**: 8x8 pixel tiles in platform-specific bit depths
- **Sprites**: Metasprite definitions with animation data
- **Tilemaps**: Background layer tile arrangements
- **Palettes**: Color data in platform-specific formats

### Data
- **Tables**: Structured data (stats, items, monsters)
- **Pointers**: Address tables and references
- **Text**: Dialog, menus, item names

### Audio
- **Music**: Platform-specific music data
- **Sound Effects**: SFX banks

## File Formats

| Asset Type | Binary | Editable |
|------------|--------|----------|
| Graphics | .chr, .bin | .png |
| Palettes | .pal, .bin | .json, .pal |
| Tilemaps | .bin | .json, .tmx |
| Data Tables | .bin | .json |
| Text | .bin | .txt (with .tbl) |
| Music | .nsf, .spc | Platform-specific |

## Related Documentation

- [NES Pipeline](NES-Pipeline.md)
- [SNES Pipeline](SNES-Pipeline.md)
- [Genesis Pipeline](Genesis-Pipeline.md)
- [Game Boy Pipeline](GB-Pipeline.md)
- [GBA Pipeline](GBA-Pipeline.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
