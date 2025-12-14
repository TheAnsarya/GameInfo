# Build Configuration Schema

This document describes the JSON schema for build pipeline configuration files.

## Overview

Each project uses a `build.config.json` file in the project root to configure the build pipeline.

## Full Schema

```json
{
	"$schema": "https://gameinfo.example.com/schemas/build-config.json",
	"project": {
		"name": "string",
		"platform": "nes|snes|genesis|gb|gbc|gba",
		"version": "string",
		"description": "string",
		"authors": ["string"]
	},
	"source": {
		"baseRom": "string (path)",
		"assembler": "ca65|asar|asm68k|rgbds|devkitarm",
		"mainFile": "string (path)",
		"includes": ["string (path)"],
		"defines": {
			"key": "value"
		},
		"outputRom": "string (path)",
		"linkerConfig": "string (path)",
		"assemblerOptions": ["string"]
	},
	"assets": {
		"extractDir": "string (path)",
		"editableDir": "string (path)",
		"buildDir": "string (path)",
		"graphics": {
			"format": "png|bmp",
			"tileSize": [8, 8],
			"defaultBpp": 2|4|8,
			"palette": "string (path)"
		},
		"palettes": {
			"format": "json|pal|act",
			"colorFormat": "bgr15|bgr9|rgb24|indexed"
		},
		"text": {
			"tableFile": "string (path)",
			"encoding": "ascii|shiftjis|custom"
		},
		"compression": {
			"algorithm": "none|lzss|rle|custom",
			"customScript": "string (path)"
		}
	},
	"build": {
		"preBuild": ["string (command)"],
		"postBuild": ["string (command)"],
		"clean": ["string (path pattern)"],
		"verify": true|false,
		"checksumFix": true|false
	},
	"extraction": {
		"assets": [
			{
				"name": "string",
				"type": "graphics|palette|tilemap|data|text",
				"source": {
					"offset": "hex string",
					"length": "hex string",
					"bank": number
				},
				"output": "string (path)",
				"options": {}
			}
		]
	}
}
```

## Section Reference

### project

Project metadata.

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| name | string | Yes | Project display name |
| platform | string | Yes | Target platform |
| version | string | No | Version string (semver) |
| description | string | No | Project description |
| authors | string[] | No | Author names |

**Example:**
```json
{
	"project": {
		"name": "Dragon Warrior IV Disassembly",
		"platform": "nes",
		"version": "1.0.0",
		"description": "Complete NES disassembly",
		"authors": ["TheAnsarya"]
	}
}
```

### source

Assembly source configuration.

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| baseRom | string | No | Path to original ROM (for extraction/verification) |
| assembler | string | Yes | Assembler to use |
| mainFile | string | Yes | Main source file |
| includes | string[] | No | Include directories |
| defines | object | No | Preprocessor defines |
| outputRom | string | Yes | Output ROM path |
| linkerConfig | string | No | Linker configuration file |
| assemblerOptions | string[] | No | Additional assembler flags |

**Assembler Values:**
- `ca65` - cc65 suite for 6502/65816
- `asar` - Multi-architecture (SNES focus)
- `asm68k` - Motorola 68000 (Genesis)
- `rgbds` - Game Boy suite
- `devkitarm` - ARM (GBA)

**Example:**
```json
{
	"source": {
		"baseRom": "roms/original.nes",
		"assembler": "ca65",
		"mainFile": "src/main.asm",
		"includes": ["src/", "include/"],
		"defines": {
			"DEBUG": "1",
			"REGION": "US"
		},
		"outputRom": "build/game.nes",
		"linkerConfig": "cfg/nes.cfg"
	}
}
```

### assets

Asset extraction and conversion settings.

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| extractDir | string | No | Binary asset extraction directory |
| editableDir | string | No | Editable format directory |
| buildDir | string | No | Build output directory |
| graphics | object | No | Graphics conversion settings |
| palettes | object | No | Palette conversion settings |
| text | object | No | Text conversion settings |
| compression | object | No | Compression settings |

#### assets.graphics

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| format | string | "png" | Output image format |
| tileSize | number[] | [8, 8] | Tile dimensions |
| defaultBpp | number | 4 | Bits per pixel |
| palette | string | null | Default palette file |

#### assets.palettes

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| format | string | "json" | Output format |
| colorFormat | string | "rgb24" | Color value format |

**Color Formats:**
- `bgr15` - 15-bit BGR (SNES, GBA, GBC)
- `bgr9` - 9-bit BGR (Genesis)
- `rgb24` - 24-bit RGB (JSON/PNG)
- `indexed` - NES palette indices

#### assets.text

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| tableFile | string | null | Table file path |
| encoding | string | "custom" | Text encoding |

**Example:**
```json
{
	"assets": {
		"extractDir": "assets/binary",
		"editableDir": "assets/json",
		"buildDir": "build/assets",
		"graphics": {
			"format": "png",
			"tileSize": [8, 8],
			"defaultBpp": 4
		},
		"palettes": {
			"format": "json",
			"colorFormat": "bgr15"
		},
		"text": {
			"tableFile": "data/game.tbl",
			"encoding": "custom"
		}
	}
}
```

### build

Build process configuration.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| preBuild | string[] | [] | Commands before build |
| postBuild | string[] | [] | Commands after build |
| clean | string[] | [] | Patterns to clean |
| verify | boolean | true | Verify against original |
| checksumFix | boolean | true | Fix ROM checksum |

**Example:**
```json
{
	"build": {
		"preBuild": [
			"python tools/convert_assets.py"
		],
		"postBuild": [
			"python tools/verify_rom.py"
		],
		"clean": [
			"build/**/*",
			"*.o"
		],
		"verify": true,
		"checksumFix": true
	}
}
```

### extraction

Defines assets to extract from the original ROM.

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| assets | array | Yes | List of asset definitions |

#### Asset Definition

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| name | string | Yes | Asset identifier |
| type | string | Yes | Asset type |
| source | object | Yes | ROM location |
| output | string | Yes | Output path |
| options | object | No | Type-specific options |

**Asset Types:**
- `graphics` - Tile/sprite graphics
- `palette` - Color palettes
- `tilemap` - Background maps
- `data` - Structured data tables
- `text` - Text strings

**Example:**
```json
{
	"extraction": {
		"assets": [
			{
				"name": "player_sprites",
				"type": "graphics",
				"source": {
					"offset": "0x10000",
					"length": "0x2000",
					"bank": 1
				},
				"output": "assets/sprites/player.bin",
				"options": {
					"bpp": 4,
					"tileCount": 256
				}
			},
			{
				"name": "main_palette",
				"type": "palette",
				"source": {
					"offset": "0x8000",
					"length": "0x200"
				},
				"output": "assets/palettes/main.json",
				"options": {
					"colorCount": 256,
					"format": "bgr15"
				}
			},
			{
				"name": "dialog_text",
				"type": "text",
				"source": {
					"offset": "0x20000",
					"length": "0x5000"
				},
				"output": "assets/text/dialog.txt",
				"options": {
					"tableFile": "data/game.tbl",
					"pointerTable": "0x1F000"
				}
			}
		]
	}
}
```

## Complete Example

```json
{
	"$schema": "https://gameinfo.example.com/schemas/build-config.json",
	"project": {
		"name": "Final Fantasy Mystic Quest Disassembly",
		"platform": "snes",
		"version": "1.0.0",
		"description": "Complete SNES disassembly of FFMQ",
		"authors": ["TheAnsarya"]
	},
	"source": {
		"baseRom": "roms/Final Fantasy - Mystic Quest (USA).sfc",
		"assembler": "asar",
		"mainFile": "src/main.asm",
		"includes": ["src/", "include/", "data/"],
		"defines": {
			"REGION_US": "1"
		},
		"outputRom": "build/ffmq.sfc"
	},
	"assets": {
		"extractDir": "assets/binary",
		"editableDir": "assets/json",
		"buildDir": "build/assets",
		"graphics": {
			"format": "png",
			"tileSize": [8, 8],
			"defaultBpp": 4
		},
		"palettes": {
			"format": "json",
			"colorFormat": "bgr15"
		},
		"text": {
			"tableFile": "data/ffmq.tbl",
			"encoding": "custom"
		},
		"compression": {
			"algorithm": "lzss"
		}
	},
	"build": {
		"preBuild": [
			"python tools/convert_all.py"
		],
		"postBuild": [
			"python tools/verify.py"
		],
		"clean": [
			"build/**/*"
		],
		"verify": true,
		"checksumFix": true
	},
	"extraction": {
		"assets": [
			{
				"name": "character_sprites",
				"type": "graphics",
				"source": {
					"offset": "0x100000",
					"length": "0x8000"
				},
				"output": "assets/sprites/characters/",
				"options": {
					"bpp": 4,
					"tilesPerRow": 16
				}
			},
			{
				"name": "monster_sprites",
				"type": "graphics",
				"source": {
					"offset": "0x180000",
					"length": "0x20000"
				},
				"output": "assets/sprites/monsters/",
				"options": {
					"bpp": 4,
					"compressed": true
				}
			},
			{
				"name": "palettes",
				"type": "palette",
				"source": {
					"offset": "0x0F0000",
					"length": "0x1000"
				},
				"output": "assets/palettes/all.json"
			},
			{
				"name": "dialog",
				"type": "text",
				"source": {
					"offset": "0x200000",
					"length": "0x10000"
				},
				"output": "assets/text/dialog.txt",
				"options": {
					"pointerTable": "0x1F8000",
					"pointerSize": 3
				}
			}
		]
	}
}
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [NES Pipeline](NES-Pipeline.md)
- [SNES Pipeline](SNES-Pipeline.md)
- [Genesis Pipeline](Genesis-Pipeline.md)
- [Game Boy Pipeline](GB-Pipeline.md)
- [GBA Pipeline](GBA-Pipeline.md)
