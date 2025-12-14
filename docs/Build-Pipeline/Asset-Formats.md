# Asset Formats

This document describes the file formats used for extracted and editable assets in the build pipeline.

## Overview

Assets flow through three stages:
1. **ROM Binary** - Original format in ROM
2. **Extracted Binary** - Raw binary data extracted from ROM
3. **Editable Format** - Human-editable format (JSON, PNG, etc.)

## Graphics

### PNG Format (Editable)

Graphics are exported to PNG files with specific conventions:

**Tile Sheets**
- Tiles arranged in rows
- Configurable tiles per row (default: 16)
- Indexed color mode for accurate palette
- Alpha channel for transparency (color 0)

**Naming Convention**
```
{name}_{width}x{height}_{bpp}bpp.png
Example: player_sprites_8x8_4bpp.png
```

**Metadata Sidecar (JSON)**
```json
{
	"name": "player_sprites",
	"tileSize": [8, 8],
	"bpp": 4,
	"tileCount": 128,
	"tilesPerRow": 16,
	"originalOffset": "0x10000",
	"originalLength": "0x1000",
	"palette": "main.json"
}
```

### Binary Tile Formats

**NES 2bpp (CHR)**
```
16 bytes per 8×8 tile
Bytes 0-7:  Plane 0 (low bits)
Bytes 8-15: Plane 1 (high bits)
```

**SNES 4bpp (Interleaved)**
```
32 bytes per 8×8 tile
Bytes 0-15:  Planes 0+1 interleaved
Bytes 16-31: Planes 2+3 interleaved
```

**Genesis 4bpp (Planar)**
```
32 bytes per 8×8 tile
4 bytes per row (8 pixels × 4 bits)
Big-endian nibble order
```

**Game Boy 2bpp**
```
16 bytes per 8×8 tile
2 bytes per row: [plane0] [plane1]
```

**GBA 4bpp (Packed)**
```
32 bytes per 8×8 tile
Each byte = 2 pixels (nibbles)
Little-endian nibble order
```

## Palettes

### JSON Format (Editable)

```json
{
	"name": "main_palette",
	"format": "bgr15",
	"colors": [
		{ "r": 0, "g": 0, "b": 0, "hex": "#000000" },
		{ "r": 255, "g": 255, "b": 255, "hex": "#ffffff" },
		{ "r": 255, "g": 0, "b": 0, "hex": "#ff0000" }
	],
	"subpalettes": [
		{
			"name": "player",
			"startIndex": 0,
			"count": 16
		},
		{
			"name": "enemies",
			"startIndex": 16,
			"count": 16
		}
	],
	"originalOffset": "0x8000",
	"originalLength": "0x200"
}
```

### Binary Palette Formats

**NES (Indexed)**
```
1 byte per color
Values 0x00-0x3F index into NES master palette
4 palettes × 4 colors = 16 bytes (BG)
4 palettes × 4 colors = 16 bytes (sprites)
```

**SNES (15-bit BGR)**
```
2 bytes per color (little-endian)
Bit 15:    Unused
Bits 14-10: Blue (0-31)
Bits 9-5:   Green (0-31)
Bits 4-0:   Red (0-31)
```

**Genesis (9-bit BGR)**
```
2 bytes per color (big-endian)
Bits 11-9: Blue (0, 2, 4, 6, 8, A, C, E)
Bits 7-5:  Green (0, 2, 4, 6, 8, A, C, E)
Bits 3-1:  Red (0, 2, 4, 6, 8, A, C, E)
```

**Game Boy Color (15-bit BGR)**
```
2 bytes per color (little-endian)
Same format as SNES
```

**GBA (15-bit BGR)**
```
2 bytes per color (little-endian)
Same format as SNES
```

## Tilemaps

### JSON Format (Editable)

```json
{
	"name": "level1_map",
	"width": 32,
	"height": 32,
	"tileSize": [8, 8],
	"layers": [
		{
			"name": "background",
			"tiles": [
				[0, 1, 2, 3],
				[4, 5, 6, 7]
			],
			"attributes": [
				[0, 0, 0, 0],
				[0, 0, 1, 1]
			]
		}
	],
	"tileset": "level1_tiles.png",
	"palette": "level1_palette.json",
	"originalOffset": "0x20000"
}
```

### TMX Format (Tiled Compatible)

The pipeline supports Tiled Map Editor's TMX format:
- XML-based map format
- Multiple layer support
- Tileset references
- Object layers for game data

### Binary Tilemap Formats

**NES Nametable**
```
960 bytes: 32×30 tile indices
64 bytes:  Attribute table (2×2 tile palette)
Total: 1024 bytes per nametable
```

**SNES Tilemap**
```
2 bytes per tile:
Bits 15:    Priority
Bits 14-13: Palette
Bit 12:     V flip
Bit 11:     H flip
Bits 10-0:  Tile index
```

**Genesis Tilemap**
```
2 bytes per tile (big-endian):
Bit 15:     Priority
Bits 14-13: Palette
Bit 12:     V flip
Bit 11:     H flip
Bits 10-0:  Tile index
```

## Data Tables

### JSON Format (Editable)

```json
{
	"name": "monster_stats",
	"schema": "monster_stats.schema.json",
	"entries": [
		{
			"id": 0,
			"name": "Slime",
			"hp": 10,
			"attack": 5,
			"defense": 2,
			"exp": 1,
			"gold": 2
		},
		{
			"id": 1,
			"name": "Drakee",
			"hp": 15,
			"attack": 8,
			"defense": 3,
			"exp": 2,
			"gold": 3
		}
	],
	"originalOffset": "0x30000",
	"entrySize": 16
}
```

### Schema Definition

```json
{
	"$schema": "http://json-schema.org/draft-07/schema#",
	"title": "MonsterStats",
	"type": "object",
	"properties": {
		"id": { "type": "integer", "bytes": 1 },
		"name": { "type": "string", "bytes": 8, "encoding": "table" },
		"hp": { "type": "integer", "bytes": 2 },
		"attack": { "type": "integer", "bytes": 1 },
		"defense": { "type": "integer", "bytes": 1 },
		"exp": { "type": "integer", "bytes": 2 },
		"gold": { "type": "integer", "bytes": 2 }
	},
	"byteOrder": "little-endian"
}
```

## Text

### Text File Format (Editable)

```
# Dialog Text Export
# Table: dragon-warrior.tbl
# Original: 0x40000-0x45000

[0000] KING LORIK:
Welcome, {HERO}.

[0001] GUARD:
The princess has been
kidnapped!

[0002] MERCHANT:
Would you like to buy
something?
```

### Table File Format (.tbl)

```
# Dragon Warrior Text Table
# Format: HEX=Character

00=[END]
01=[LINE]
02={HERO}
03={ITEM}
10= 
11=A
12=B
13=C
...
1A=J
1B=K
...
FF=[PAUSE]
```

### Binary Text Formats

Text is stored as raw bytes that map through the table file. Common patterns:

- **Fixed-length strings**: Padded with spaces or terminators
- **Null-terminated**: Ends with 0x00 or custom terminator
- **Pointer tables**: Array of 2-3 byte pointers to strings
- **Compression**: DTE (dual-tile encoding), Huffman, etc.

## Audio

### JSON Metadata

```json
{
	"name": "overworld_music",
	"format": "nsf",
	"tracks": [
		{
			"index": 0,
			"name": "Title Screen",
			"duration": 120
		},
		{
			"index": 1,
			"name": "Overworld",
			"duration": 180
		}
	],
	"originalOffset": "0x50000",
	"originalLength": "0x8000"
}
```

### Audio Formats by Platform

| Platform | Native | Export |
|----------|--------|--------|
| NES | NSF | WAV, VGM |
| SNES | SPC | WAV, VGM |
| Genesis | VGM | WAV |
| GB/GBC | GBS | WAV, VGM |
| GBA | Raw PCM | WAV |

## Compression

### Supported Algorithms

**LZSS**
- Common on SNES, GBA
- Sliding window compression
- Decompressor included in pipeline

**RLE (Run-Length Encoding)**
- Simple compression
- Good for tilemaps with repeated tiles

**Huffman**
- Variable-length codes
- Good for text compression

**Custom**
- Game-specific compression
- Requires custom script

### Compressed Asset Handling

```json
{
	"name": "compressed_graphics",
	"type": "graphics",
	"compression": {
		"algorithm": "lzss",
		"headerSize": 4,
		"windowSize": 4096,
		"matchLength": [3, 18]
	},
	"source": {
		"offset": "0x100000",
		"compressedLength": "0x5000"
	},
	"output": "assets/sprites/compressed.bin"
}
```

## Metadata Files

Each extracted asset can have an accompanying `.meta.json` file:

```json
{
	"asset": "player_sprites.png",
	"type": "graphics",
	"originalFormat": "nes_2bpp",
	"romOffset": "0x10000",
	"romLength": "0x2000",
	"extractedAt": "2024-01-15T10:30:00Z",
	"checksum": "a1b2c3d4",
	"dependencies": [
		"palettes/player.json"
	],
	"notes": "Player character sprites, 4 directions × 2 frames"
}
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
