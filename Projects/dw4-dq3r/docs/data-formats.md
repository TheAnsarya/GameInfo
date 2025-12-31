# Data Format Comparison: DW4 NES vs DQ3r SNES

This document compares data formats between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES) to facilitate porting.

## Monster Data

### DW4 NES Monster Format (16 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0x00 | 2 | HP |
| 0x02 | 1 | Attack |
| 0x03 | 1 | Defense |
| 0x04 | 1 | Agility |
| 0x05 | 1 | XP (low) |
| 0x06 | 1 | XP (high) |
| 0x07 | 1 | Gold (low) |
| 0x08 | 1 | Gold (high) |
| 0x09 | 1 | Action Pattern |
| 0x0A | 1 | Spell/Skill 1 |
| 0x0B | 1 | Spell/Skill 2 |
| 0x0C | 1 | Resistances |
| 0x0D | 1 | Item Drop |
| 0x0E | 1 | Drop Rate |
| 0x0F | 1 | Flags |

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

- 1 byte per tile
- RLE compressed
- Separate tile property table
- Max size: 64x64 tiles

### DQ3r SNES Map Format

- 2 bytes per tile (tile + attributes)
- LZSS compressed
- Properties embedded in tile data
- Max size: 128x128 tiles

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
| `monster_converter.py` | Convert monster data | Planned |
| `item_converter.py` | Convert item data | Planned |
| `spell_converter.py` | Convert spell data | Planned |
| `map_converter.py` | Convert map format | Planned |
| `text_converter.py` | Convert text/dialog | Planned |
| `gfx_converter.py` | Convert graphics | Planned |
