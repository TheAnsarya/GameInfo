# Dragon Warrior III (NES) - ROM Map

## Overview

Dragon Warrior III uses the MMC5 mapper with 512KB PRG ROM and 256KB CHR ROM, making it one of the largest NES games. The MMC5 mapper provides advanced features including extended CHR banking and EXRAM.

## ROM Header (iNES)

| Offset | Value | Description |
|--------|-------|-------------|
| $00-$03 | `NES\x1a` | iNES signature |
| $04 | $20 | 32 × 16KB PRG banks = 512KB |
| $05 | $20 | 32 × 8KB CHR banks = 256KB |
| $06 | $50 | Flags 6: MMC5, vertical mirroring |
| $07 | $00 | Flags 7: mapper bits 4-7 |
| $08-$0F | $00 | Reserved |

Mapper: 5 (MMC5)

## Bank Layout

| Bank | Address (ROM) | Size | Contents |
|------|---------------|------|----------|
| 0 | $00010-$03FFF | 16KB | Main program, reset vectors |
| 1 | $04000-$07FFF | 16KB | Field engine, NPCs |
| 2 | $08000-$0BFFF | 16KB | Battle engine |
| 3 | $0C000-$0FFFF | 16KB | Menu system, inventory |
| 4 | $10000-$13FFF | 16KB | Map data (Aliahan continent) |
| 5 | $14000-$17FFF | 16KB | Map data (Romaly region) |
| 6 | $18000-$1BFFF | 16KB | Map data (Isis region) |
| 7 | $1C000-$1FFFF | 16KB | Map data (Portoga region) |
| 8 | $20000-$23FFF | 16KB | Map data (Samanao region) |
| 9 | $24000-$27FFF | 16KB | Map data (World of Darkness) |
| 10 | $28000-$2BFFF | 16KB | Dungeon maps (part 1) |
| 11 | $2C000-$2FFFF | 16KB | Dungeon maps (part 2) |
| 12 | $30000-$33FFF | 16KB | Dungeon maps (part 3) |
| 13 | $34000-$37FFF | 16KB | Town interiors (part 1) |
| 14 | $38000-$3BFFF | 16KB | Town interiors (part 2) |
| 15 | $3C000-$3FFFF | 16KB | Monster data, encounter tables |
| 16 | $40000-$43FFF | 16KB | Item/equipment data |
| 17 | $44000-$47FFF | 16KB | Spell data, skill system |
| 18 | $48000-$4BFFF | 16KB | Class/vocation data |
| 19 | $4C000-$4FFFF | 16KB | Experience tables, stat growth |
| 20 | $50000-$53FFF | 16KB | NPC dialogue (part 1) |
| 21 | $54000-$57FFF | 16KB | NPC dialogue (part 2) |
| 22 | $58000-$5BFFF | 16KB | NPC dialogue (part 3) |
| 23 | $5C000-$5FFFF | 16KB | Story dialogue |
| 24 | $60000-$63FFF | 16KB | Event scripts (part 1) |
| 25 | $64000-$67FFF | 16KB | Event scripts (part 2) |
| 26 | $68000-$6BFFF | 16KB | Music data (part 1) |
| 27 | $6C000-$6FFFF | 16KB | Music data (part 2) |
| 28 | $70000-$73FFF | 16KB | Sound effects |
| 29 | $74000-$77FFF | 16KB | Monster AI routines |
| 30 | $78000-$7BFFF | 16KB | Graphics routines, DMA |
| 31 | $7C000-$7FFFF | 16KB | Fixed bank (always mapped) |

## CPU Address Mapping

| CPU Address | Contents | Bank Type |
|-------------|----------|-----------|
| $6000-$7FFF | SRAM (8KB battery backup) | Fixed |
| $8000-$9FFF | Switchable 8KB bank | PRG0 |
| $A000-$BFFF | Switchable 8KB bank | PRG1 |
| $C000-$DFFF | Switchable 8KB bank | PRG2 |
| $E000-$FFFF | Fixed bank 31 | PRG3 (fixed) |

## MMC5 Features Used

### PRG Mode
- Mode 3: Four 8KB banks (most common)
- Mode 2: Two 16KB banks (used for some routines)

### CHR Mode
- Mode 3: Eight 1KB banks (battle sprites)
- Mode 0: Single 8KB bank (field graphics)

### EXRAM Usage
- $5C00-$5FFF: Extended attribute data for backgrounds
- Allows 4 palettes per 8×8 tile (vs standard 2×2 tile palette)

## Key Data Locations

### Monster Data (Bank 15)

| Address | Size | Contents |
|---------|------|----------|
| $3C000 | 1696 bytes | Monster stats (106 monsters × 16 bytes) |
| $3C6A0 | 424 bytes | Monster names |
| $3C848 | 212 bytes | Monster spells |
| $3C91C | 106 bytes | Monster drop items |

### Class Data (Bank 18)

| Address | Size | Contents |
|---------|------|----------|
| $48000 | 72 bytes | Base stats per class (9 classes × 8 bytes) |
| $48048 | 450 bytes | Stat growth tables |
| $481DA | 180 bytes | Spell learning tables |
| $4828E | 90 bytes | Class change requirements |

### Item Data (Bank 16)

| Address | Size | Contents |
|---------|------|----------|
| $40000 | 512 bytes | Item definitions (128 items × 4 bytes) |
| $40200 | 640 bytes | Item names |
| $40480 | 256 bytes | Equipment stats |
| $40580 | 180 bytes | Shop inventories |

### Experience Tables (Bank 19)

| Address | Size | Contents |
|---------|------|----------|
| $4C000 | 396 bytes | Experience per level (99 levels × 4 bytes) |
| $4C18C | 792 bytes | Stat bonuses per class/level |

## Map Data Format

Maps use tile-based compression:

```
Header (8 bytes):
  $00: Map width
  $01: Map height
  $02-$03: Tileset ID
  $04-$05: Music ID
  $06-$07: Encounter rate

Tile Data:
  RLE compressed tiles
```

### RLE Format
- $00-$7F: Single tile
- $80-$FF: Repeat next tile (count - $80) times

## Event System

Events are stored as bytecode scripts:

| Opcode | Function |
|--------|----------|
| $00 | End script |
| $01 | Show message |
| $02 | Give item |
| $03 | Take item |
| $04 | Check item |
| $05 | Set flag |
| $06 | Check flag |
| $07 | Branch if true |
| $08 | Heal party |
| $09 | Save game |
| $0A | Inn stay |
| $0B | Shop |
| $0C | Bank |
| $0D | Vault (item storage) |
| $0E | Class change |
| $0F | Personality test |

## Interrupt Vectors (Bank 31)

| Vector | Address | Handler |
|--------|---------|---------|
| NMI | $FFFA | $E000 |
| RESET | $FFFC | $E100 |
| IRQ | $FFFE | $E200 |

## See Also

- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Detailed data formats
- [Text System](text-system.md) - Text encoding
