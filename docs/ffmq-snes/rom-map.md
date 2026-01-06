# Final Fantasy Mystic Quest (SNES) - ROM Map

Complete ROM memory mapping for Final Fantasy Mystic Quest (SNES).

## ROM Information

| Property | Value |
|----------|-------|
| **Platform** | Super Nintendo (SNES) |
| **Mapping** | LoROM |
| **ROM Size** | 1 MB (8 Mbit) |
| **SRAM** | 8 KB (battery backed) |
| **Region** | USA/NTSC |
| **Checksum** | $B800 |

## Memory Mapping (LoROM)

### Bank Layout

| Bank | ROM Offset | CPU Address | Contents |
|------|------------|-------------|----------|
| $00-$0F | $000000-$07FFFF | $8000-$FFFF | Program code + data |
| $10-$1F | $080000-$0FFFFF | $8000-$FFFF | Extended data |

### Mirror Regions

- Banks $80-$9F mirror $00-$1F (FastROM access)
- Banks $40-$5F mirror $00-$1F (alternate access)

## Key ROM Regions

### Game Code ($00:8000-$0F:FFFF)

| Bank | Address | Contents |
|------|---------|----------|
| $00 | $8000-$FFFF | Reset vectors, init code |
| $01 | $8000-$FFFF | Battle engine core |
| $02 | $8000-$FFFF | Map engine, collision |
| $03 | $8000-$FFFF | Menu system, inventory |
| $04 | $8000-$FFFF | Event scripting |
| $05 | $8000-$FFFF | Dialog system |
| $06 | $8000-$FFFF | Audio driver |
| $07 | $8000-$FFFF | Additional routines |

### Map Data ($08:0000-$0B:FFFF)

| Offset | Contents |
|--------|----------|
| $080000 | Overworld map data |
| $090000 | Dungeon map data |
| $0A0000 | Town/building maps |
| $0B0000 | Map metadata/scripts |

### Graphics ($0C:0000-$0F:FFFF)

| Offset | Contents |
|--------|----------|
| $0C0000 | Character sprites |
| $0D0000 | Monster sprites |
| $0E0000 | Tilesets |
| $0F0000 | UI graphics |

### Extended Data ($10:0000-$1F:FFFF)

| Bank | Contents |
|------|----------|
| $10-$13 | Monster data tables |
| $14-$17 | Item/equipment data |
| $18-$1B | Dialog text (compressed) |
| $1C-$1F | Audio data |

## Data Tables

### Monster Table ($10:8000)

| Offset | Size | Description |
|--------|------|-------------|
| $108000 | 16 × 77 | Monster stats (77 entries) |
| $1084CD | variable | Monster AI patterns |
| $108800 | 77 × 2 | Monster name pointers |
| $1088A0 | variable | Monster name strings |

### Item Table ($14:8000)

| Offset | Size | Description |
|--------|------|-------------|
| $148000 | 8 × 82 | Weapon stats (82 weapons) |
| $1482A0 | 8 × 44 | Armor stats (44 armors) |
| $148400 | 6 × 24 | Accessory stats (24 accessories) |
| $1484A0 | 8 × 32 | Item stats (32 consumables) |
| $148600 | variable | Item name pointers |
| $148700 | variable | Item name strings |

### Spell Table ($15:8000)

| Offset | Size | Description |
|--------|------|-------------|
| $158000 | 16 × 32 | White magic (32 spells) |
| $158200 | 16 × 32 | Black magic (32 spells) |
| $158400 | 16 × 32 | Wizard magic (32 spells) |
| $158600 | variable | Spell effect data |

### Dialog Data ($18:0000-$1B:FFFF)

| Offset | Contents |
|--------|----------|
| $180000 | Dialog pointer table |
| $181000 | Dialog text (compressed) |
| $190000 | Battlefield dialog |
| $1A0000 | Menu text strings |
| $1B0000 | System messages |

## Audio Data ($1C:0000-$1F:FFFF)

### SPC700 Data

| Offset | Size | Description |
|--------|------|-------------|
| $1C0000 | 64 KB | SPC program + driver |
| $1D0000 | 64 KB | Music sequence data |
| $1E0000 | 64 KB | Sample data (BRR) |
| $1F0000 | 64 KB | Sound effects |

### Music Tracks

| ID | Track Name |
|----|------------|
| $00 | Title Screen |
| $01 | World Map |
| $02 | Battle Theme |
| $03 | Boss Battle |
| $04 | Victory Fanfare |
| $05 | Inn/Rest |
| $06 | Town Theme |
| $07 | Dungeon Theme |
| ... | ... |

## ROM Header ($00:FFB0-$00:FFDF)

| Offset | Size | Description |
|--------|------|-------------|
| $FFB0 | 21 | Game title ("MYSTIC QUEST USA") |
| $FFC5 | 1 | Map mode ($20 = LoROM) |
| $FFC6 | 1 | ROM type ($02 = ROM + SRAM) |
| $FFC7 | 1 | ROM size ($0A = 1 MB) |
| $FFC8 | 1 | SRAM size ($03 = 8 KB) |
| $FFC9 | 1 | Region ($01 = USA) |
| $FFCA | 1 | Developer ID ($C3 = Square) |
| $FFCB | 1 | Version ($00) |
| $FFCC | 2 | Checksum complement |
| $FFCE | 2 | Checksum |

## Interrupt Vectors ($00:FFE0-$00:FFFF)

| Vector | Address | Handler |
|--------|---------|---------|
| COP | $FFE4 | $00:8200 |
| BRK | $FFE6 | $00:8200 |
| ABORT | $FFE8 | $00:8200 |
| NMI | $FFEA | $00:8050 |
| RESET | $FFFC | $00:8000 |
| IRQ | $FFEE | $00:8100 |

## External References

- [Full Disassembly](https://github.com/TheAnsarya/ffmq-info)
- [FFMQ Memory Map](https://github.com/TheAnsarya/ffmq-info/blob/master/docs/MEMORY_MAP.md)
