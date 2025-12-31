# Data Format Comparison: DW4 NES vs DQ3r SNES

This document compares data formats between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES) to facilitate porting.

**See Also:** [DW4 Format Documentation](../../../../dragon-warrior-4-info/docs/INDEX.md)

## System Comparison

| Feature | DW4 (NES) | DQ3r (SNES) |
|---------|-----------|-------------|
| CPU | 6502 (8-bit) | 65816 (16-bit) |
| ROM Size | 512KB | 6MB |
| RAM | 2KB + 8KB SRAM | 128KB + 8KB SRAM |
| Graphics | 2bpp (4 colors) | 4bpp (16 colors) |
| Max Party | 4 active + 4 wagon | 4 active |
| Chapters | 5 | None |
| AI Battle | Yes (Ch1-4) | No |

## Monster Data

### DW4 NES Monster Format (16 bytes)

*Source: [MONSTER_FORMAT.md](../../../../dragon-warrior-4-info/docs/formats/MONSTER_FORMAT.md)*

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 2 | HP (0-999) |
| 0x02 | 1 | MP (usually 0) |
| 0x03 | 2 | Attack |
| 0x05 | 1 | Defense |
| 0x06 | 1 | Agility |
| 0x07 | 2 | EXP reward |
| 0x09 | 2 | Gold reward |
| 0x0B | 1 | Drop item ID |
| 0x0C | 1 | Drop rate (X/256) |
| 0x0D | 1 | Action pattern |
| 0x0E | 1 | Resistances |
| 0x0F | 1 | Sprite info |

### DQ3r SNES Monster Format (24 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 2 | HP |
| 0x02 | 2 | MP |
| 0x04 | 2 | Attack |
| 0x06 | 2 | Defense |
| 0x08 | 2 | Agility |
| 0x0A | 2 | XP |
| 0x0C | 2 | Gold |
| 0x0E | 2 | Action Pattern Pointer |
| 0x10 | 2 | Resistances |
| 0x12 | 1 | Item Drop 1 |
| 0x13 | 1 | Drop Rate 1 |
| 0x14 | 1 | Item Drop 2 |
| 0x15 | 1 | Drop Rate 2 |
| 0x16 | 2 | Flags |

### Conversion Notes

- Stats need scaling (NES 8-bit → SNES 16-bit ranges)
- DQ3r has MP field (DW4 monsters don't use MP visibly)
- DQ3r supports two item drops
- Action patterns are structured differently

## Item Data

### DW4 NES Item Format (8 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 1 | Type |
| 0x01 | 1 | Equip Flags |
| 0x02 | 1 | Attack/Defense Mod |
| 0x03 | 1 | Special Effect |
| 0x04 | 2 | Price |
| 0x06 | 1 | Sort Order |
| 0x07 | 1 | Flags |

### DQ3r SNES Item Format (12 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 1 | Type |
| 0x01 | 1 | Subtype |
| 0x02 | 2 | Equip Flags |
| 0x04 | 2 | Attack/Defense Mod |
| 0x06 | 2 | Special Effect |
| 0x08 | 2 | Price |
| 0x0A | 1 | Sort Order |
| 0x0B | 1 | Flags |

## Spell Data

### DW4 NES Spell Format (6 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 1 | MP Cost |
| 0x01 | 1 | Effect Type |
| 0x02 | 1 | Power |
| 0x03 | 1 | Target Type |
| 0x04 | 1 | Animation |
| 0x05 | 1 | Flags |

### DQ3r SNES Spell Format (10 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 1 | MP Cost |
| 0x01 | 1 | Effect Type |
| 0x02 | 2 | Power |
| 0x04 | 1 | Target Type |
| 0x05 | 1 | Element |
| 0x06 | 2 | Animation Pointer |
| 0x08 | 2 | Flags |

## Map Data

### DW4 NES Map Format

**ROM Layout:**
- Banks $09-$0B: Map tile data
- Bank $17, $B08D: Map pointer table (73 maps × 2 bytes)
- Bank $17, $B121: Map info data (3 bytes per submap)
- Bank $08, $8ADB: Tileset data (51 tilesets × 64 bytes)
- Bank $0B, $8CEE: Main overworld data (RLE compressed)

**Map Info (3 bytes per submap):**

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 1 | Tileset number |
| 0x01 | 2 | Map data pointer (little-endian) |

**Tileset Entry (2 bytes per tile, 32 tiles per set):**

| Bits | Field |
|------|-------|
| Byte 0 bits 5-7 | Smoothing flags |
| Byte 0 bits 3-4 | Attribute/palette |
| Byte 0 bits 0-2 | Tile number high |
| Byte 1 | Tile number low |

**Overworld RLE Compression:**
- Bits 0-4: Length + 1 (1-32 tiles)
- Bits 5-7: Tile type (0-7)
- Special: If byte ≥ $E8, subtract $E0 for tile number

**Total: 73 maps, 256+ submaps**

### DQ3r SNES Map Format

**ROM Layout (HiROM 6MB):**
- $e54f38: Metatile definitions (237 entries)
- $ed8a00: World map layout (Ring400 compressed)
- $eda49c-$ee3e2f: 16 tilemap chunk streams
- $180000: World map tile graphics (32KB)

**World Map Structure:**
- 64×64 layout grid (4096 chunk indices)
- Each chunk = 4×4 tiles (16 streams of data)
- Full map = 256×256 tiles

**Layout Entry (2 bytes):**

| Byte | Field |
|------|-------|
| Low | Chunk index |
| High | Flags/extended index |

**Ring400/LZSS Compression:**
- Command byte: 8 bits, processed right-to-left
- Bit 1: Read literal byte to output
- Bit 0: Read 2-byte reference (10-bit offset, 6-bit length+3)
- Ring buffer: $400 bytes

**Metatile (variable size):**
- 4×4 8x8 tiles = 16x16 pixel metatile
- Includes palette, flip, priority flags

### Conversion Implementation

Conversion code: `DW4Lib/Converters/`
- `MapToDQ3r.cs` - Main conversion, 80-entry tile translation table
- `WorldMapToDQ3r.cs` - Chunk generation, Ring400 compression
- `EntranceToDQ3r.cs` - Entrance location database

**Tile Translation (80 entries):**
```csharp
// DW4 tile → DQ3r tile mapping
0x4b, 0x4b, 0x4b, 0x4b, 0x02, 0x4b, 0x4b, 0x4b, // $00-$07
0x4b, 0x4b, 0x4b, 0x4a, 0x4b, 0xc9, 0x64, 0x4b, // $08-$0f
// ... see MapToDQ3r.cs for complete table
```

## Text Encoding

### DW4 NES

Custom encoding table:
- 0x00-0x7F: Control codes
- 0x80-0xDF: Standard characters
- 0xE0-0xFF: DTE pairs

### DQ3r SNES

Modified Shift-JIS:
- Full Japanese character support
- Built-in DTE/MTE compression
- Variable-width font support

## Graphics

### NES (2bpp)

- 8x8 tiles, 16 bytes each
- 4-color palettes
- CHR-ROM banking

### SNES (4bpp)

- 8x8 tiles, 32 bytes each
- 16-color palettes
- Direct tile mapping

## Conversion Priority

1. **Critical:** Monster stats, item stats, spell data
2. **High:** Map layouts, NPC placement, events
3. **Medium:** Graphics, animations
4. **Low:** Music (complete rework needed)

## Tools Needed

| Tool | Purpose | Status |
|------|---------|--------|
| `MonsterToDQ3r.cs` | Convert monster data | ✅ Implemented |
| `ItemToDQ3r.cs` | Convert item data | ✅ Implemented |
| `SpellToDQ3r.cs` | Convert spell data | ✅ Implemented |
| `MapToDQ3r.cs` | Convert map format | ✅ Implemented |
| `WorldMapToDQ3r.cs` | Convert world map | ✅ Implemented |
| `EntranceToDQ3r.cs` | Convert entrance locations | ✅ Implemented |
| `text_converter` | Convert text/dialog | 🔲 Planned |
| `gfx_converter` | Convert graphics | 🔲 Planned |
| `script_converter` | Convert NPC scripts | 🔲 Planned |

## Implementation Location

All conversion tools are in `logsmall/DW4Lib/`:

```
DW4Lib/
├── DataStructures/
│   ├── Character.cs
│   ├── ExperienceTable.cs
│   ├── Item.cs
│   ├── Monster.cs
│   ├── Spell.cs
│   └── Maps/
│       ├── EncounterData.cs
│       ├── MapEvents.cs
│       ├── MapInfo.cs
│       ├── OverworldMap.cs
│       └── TileData.cs
├── DQ3r/
│   ├── DQ3rItem.cs
│   ├── DQ3rMonster.cs
│   ├── DQ3rSpell.cs
│   ├── DQ3rAnimationMappings.cs
│   └── Maps/
│       ├── DQ3rMapData.cs
│       └── DQ3rMapEvents.cs
├── Converters/
│   ├── ItemToDQ3r.cs
│   ├── MonsterToDQ3r.cs
│   ├── SpellToDQ3r.cs
│   ├── MapToDQ3r.cs
│   ├── WorldMapToDQ3r.cs
│   ├── EntranceToDQ3r.cs
│   └── README.md
├── ROM/
│   └── DW4Rom.cs
└── Text/
    └── ...
```
