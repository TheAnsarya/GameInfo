# Dragon Warrior II (NES) - ROM Map

## Overview

- **ROM Size:** 128 KB PRG + 128 KB CHR
- **Mapper:** MMC1 (Mapper 1)
- **PRG Banks:** 8 × 16KB
- **CHR Banks:** 16 × 8KB
- **Header:** 16 bytes (iNES)

## PRG-ROM Layout

| Bank | File Offset | Size | Contents |
|------|-------------|------|----------|
| 0 | $0010-$400F | 16KB | Main code, game loop |
| 1 | $4010-$800F | 16KB | Map rendering, movement |
| 2 | $8010-$C00F | 16KB | Battle system |
| 3 | $C010-$1000F | 16KB | NPC scripts, dialog |
| 4 | $10010-$1400F | 16KB | Monster/spell data |
| 5 | $14010-$1800F | 16KB | Map data |
| 6 | $18010-$1C00F | 16KB | Text data |
| 7 | $1C010-$1FFFF | 16KB | Fixed bank, vectors |

## Bank 0 - Main Code

| Address | Size | Description |
|---------|------|-------------|
| $8000-$83FF | $400 | Game initialization |
| $8400-$87FF | $400 | Main game loop |
| $8800-$8FFF | $800 | Menu system |
| $9000-$97FF | $800 | Password encode/decode |
| $9800-$9FFF | $800 | Sound engine |
| $A000-$AFFF | $1000 | Status calculation |
| $B000-$BFFF | $1000 | Equipment system |

## Bank 1 - Map System

| Address | Size | Description |
|---------|------|-------------|
| $8000-$8FFF | $1000 | World map rendering |
| $9000-$9FFF | $1000 | Town/cave rendering |
| $A000-$AFFF | $1000 | Tile collision |
| $B000-$BFFF | $1000 | Warp/door handling |

## Bank 2 - Battle System

| Address | Size | Description |
|---------|------|-------------|
| $8000-$87FF | $800 | Battle initialization |
| $8800-$8FFF | $800 | Turn order calculation |
| $9000-$97FF | $800 | Physical attack routine |
| $9800-$9FFF | $800 | Magic attack routine |
| $A000-$A7FF | $800 | Defense/evasion |
| $A800-$AFFF | $800 | Flee routine |
| $B000-$B7FF | $800 | Experience/gold award |
| $B800-$BFFF | $800 | Level up routine |

## Bank 3 - NPC System

| Address | Size | Description |
|---------|------|-------------|
| $8000-$8FFF | $1000 | NPC dialog scripts |
| $9000-$9FFF | $1000 | NPC movement |
| $A000-$AFFF | $1000 | Shop system |
| $B000-$BFFF | $1000 | Inn/church system |

## Bank 4 - Game Data

| Address | Size | Description |
|---------|------|-------------|
| $8000-$83FF | $400 | Monster base stats |
| $8400-$87FF | $400 | Monster spell patterns |
| $8800-$8BFF | $400 | Monster experience |
| $8C00-$8FFF | $400 | Monster gold |
| $9000-$93FF | $400 | Player spell data |
| $9400-$97FF | $400 | Weapon data |
| $9800-$9BFF | $400 | Armor data |
| $9C00-$9FFF | $400 | Item data |
| $A000-$BFFF | $2000 | Experience tables |

### Monster Stats (Bank 4)

| ROM Offset | Size | Description |
|------------|------|-------------|
| $10010 | 86 × 8 | Monster base stats |
| $102C6 | 86 × 2 | Monster experience values |
| $10376 | 86 × 2 | Monster gold values |

### Equipment Data (Bank 4)

| ROM Offset | Size | Description |
|------------|------|-------------|
| $19410 | 29 × 4 | Weapon properties |
| $19484 | 26 × 4 | Armor properties |
| $194E8 | 8 × 4 | Shield properties |

## Bank 5 - Map Data

| Address | Size | Description |
|---------|------|-------------|
| $8000-$9FFF | $2000 | World map tiles |
| $A000-$AFFF | $1000 | Town maps |
| $B000-$BFFF | $1000 | Dungeon maps |

### Map IDs

| ID | Location |
|----|----------|
| $00 | World Map |
| $01 | Midenhall Castle |
| $02 | Leftwyne |
| $03 | Cannock Castle |
| $04 | Hamlin |
| $05 | Moonbrooke Castle |
| $06 | Lianport |
| $07 | Zahan |
| $08 | Wellgarth |
| $09 | Beran |
| $0A | Tuhn |
| $0B | Osterfair |
| $0C | Tantegel |
| $0D | Charlock Castle |
| $0E | Cave to Charlock |
| $0F | Lake Cave |
| $10 | Shrine (various) |

## Bank 6 - Text Data

| Address | Size | Description |
|---------|------|-------------|
| $8000-$8FFF | $1000 | Dialog text |
| $9000-$9FFF | $1000 | Menu text |
| $A000-$AFFF | $1000 | Item/monster names |
| $B000-$BFFF | $1000 | Location names |

## Bank 7 - Fixed Bank

| Address | Size | Description |
|---------|------|-------------|
| $C000-$C7FF | $800 | NMI handler |
| $C800-$CFFF | $800 | Input handling |
| $D000-$D7FF | $800 | PPU updates |
| $D800-$DFFF | $800 | Bank switching |
| $E000-$EFFF | $1000 | Common routines |
| $F000-$F7FF | $800 | Character loading |
| $F800-$FFFF | $800 | Reset, vectors |

## CHR-ROM Layout

| Bank | File Offset | Size | Contents |
|------|-------------|------|----------|
| 0-3 | $20010-$2800F | 32KB | Character sprites |
| 4-7 | $28010-$3000F | 32KB | Monster sprites |
| 8-11 | $30010-$3800F | 32KB | Background tiles |
| 12-15 | $38010-$3FFFF | 32KB | UI elements |

## Key Addresses

### Data Tables
| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| $10010 | Bank 4 $8000 | Monster stats |
| $19410 | Bank 4 $9400 | Weapon data |
| $18010 | Bank 6 $8000 | Dialog text |
| $1A000 | Bank 6 $A000 | Item names |

### Interrupt Vectors
| Address | Vector |
|---------|--------|
| $FFFA | NMI |
| $FFFC | RESET |
| $FFFE | IRQ |

## MMC1 Configuration

| Address | Register | Description |
|---------|----------|-------------|
| $8000-$9FFF | Control | Mirroring, PRG mode |
| $A000-$BFFF | CHR0 | CHR bank 0 |
| $C000-$DFFF | CHR1 | CHR bank 1 |
| $E000-$FFFF | PRG | PRG bank select |

## Address Conversion

```
File Offset to Bank:
  Bank = (file_offset - $10) / $4000
  Offset = (file_offset - $10) % $4000

Banked CPU Address:
  If offset < $4000: CPU = $8000 + offset
  Else: CPU = $C000 + (offset - $4000)
```

## See Also

- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Table formats
- [Text System](text-system.md) - Text encoding
