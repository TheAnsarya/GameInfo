# Dragon Warrior (NES) - ROM Map

## Overview

- **ROM Size:** 64 KB PRG + 16 KB CHR
- **Mapper:** MMC1 (Mapper 1)
- **Banks:** 4 PRG banks × 16KB
- **Header:** 16 bytes (iNES)

## PRG-ROM Layout

| Bank | File Offset | Size | Contents |
|------|-------------|------|----------|
| 0 | $0010-$400F | 16KB | Game code, subroutines |
| 1 | $4010-$800F | 16KB | Map data, NPC scripts |
| 2 | $8010-$C00F | 16KB | Monster data, spell code |
| 3 | $C010-$FFFF | 16KB | Main code, reset vector |

## Bank 0 ($8000-$BFFF when banked)

| Address | Size | Description |
|---------|------|-------------|
| $8000-$83FF | $400 | Tilemap decompression routines |
| $8400-$87FF | $400 | Menu drawing code |
| $8800-$8FFF | $800 | Battle calculation routines |
| $9000-$9FFF | $1000 | Save/Load routines |
| $A000-$AFFF | $1000 | Overworld movement code |
| $B000-$BFFF | $1000 | Town/dungeon movement |

## Bank 1 ($8000-$BFFF when banked)

| Address | Size | Description |
|---------|------|-------------|
| $8000-$8FFF | $1000 | Map tile data (compressed) |
| $9000-$9FFF | $1000 | NPC data and scripts |
| $A000-$AFFF | $1000 | Town layouts |
| $B000-$BFFF | $1000 | Dungeon layouts |

## Bank 2 ($8000-$BFFF when banked)

| Address | Size | Description |
|---------|------|-------------|
| $8000-$83FF | $400 | Monster base stats table |
| $8400-$87FF | $400 | Monster sprite indices |
| $8800-$8BFF | $400 | Spell data |
| $8C00-$8FFF | $400 | Item data |
| $9000-$9FFF | $1000 | Battle AI routines |
| $A000-$AFFF | $1000 | Spell effect code |
| $B000-$BFFF | $1000 | Experience tables |

## Bank 3 (Fixed at $C000-$FFFF)

| Address | Size | Description |
|---------|------|-------------|
| $C000-$C7FF | $800 | Main game loop |
| $C800-$CFFF | $800 | Input handling |
| $D000-$D7FF | $800 | Sound engine |
| $D800-$DFFF | $800 | Text display routines |
| $E000-$EFFF | $1000 | Dialog text (compressed) |
| $F000-$F7FF | $800 | Graphics loading |
| $F800-$FFFF | $800 | NMI handler, reset vector |

## Key Data Tables

### Monster Stats (Bank 2)

| ROM Offset | Address | Size | Description |
|------------|---------|------|-------------|
| $8010 | $8000 | 40 × 8 | Monster base stats |
| $8150 | $8140 | 40 × 2 | Monster experience values |
| $81C8 | $81B8 | 40 × 2 | Monster gold values |
| $8240 | $8230 | 40 × 1 | Monster agility |
| $8268 | $8258 | 40 × 1 | Monster spell patterns |

### Item Data (Bank 2)

| ROM Offset | Address | Size | Description |
|------------|---------|------|-------------|
| $8C10 | $8C00 | 31 × 4 | Item properties |
| $8C7C | $8C6C | 31 × 2 | Item prices |

### Spell Data (Bank 2)

| ROM Offset | Address | Size | Description |
|------------|---------|------|-------------|
| $8810 | $8800 | 10 × 4 | Spell properties |
| $8838 | $8828 | 10 × 1 | Spell MP costs |

## Text Data

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| $E010 | $E000 | Dialog text (compressed) |
| $E800 | $E7F0 | Menu text |
| $EC00 | $EBF0 | Item names |
| $ED00 | $ECF0 | Monster names |
| $EE00 | $EDF0 | Spell names |
| $EF00 | $EEF0 | Location names |

## CHR-ROM Layout

| File Offset | Size | Description |
|-------------|------|-------------|
| $10010-$1100F | $1000 | Character sprites |
| $11010-$1200F | $1000 | Monster sprites (set 1) |
| $12010-$1300F | $1000 | Monster sprites (set 2) |
| $13010-$1400F | $1000 | Background tiles |

## Interrupt Vectors

| Address | Vector | Description |
|---------|--------|-------------|
| $FFFA | NMI | Vertical blank handler |
| $FFFC | RESET | Game initialization |
| $FFFE | IRQ | Not used |

## Memory-Mapped Registers (MMC1)

| Address | Description |
|---------|-------------|
| $8000-$9FFF | Control register |
| $A000-$BFFF | CHR bank 0 |
| $C000-$DFFF | CHR bank 1 |
| $E000-$FFFF | PRG bank select |

## Address Conversion

### File to CPU
```
If file_addr < $4010:
    Bank 0: CPU = $8000 + (file_addr - $0010)
Else if file_addr < $8010:
    Bank 1: CPU = $8000 + (file_addr - $4010)
Else if file_addr < $C010:
    Bank 2: CPU = $8000 + (file_addr - $8010)
Else:
    Bank 3: CPU = $C000 + (file_addr - $C010)
```

## See Also

- [RAM Map](ram-map.md) - Runtime memory layout
- [Data Structures](data-structures.md) - Table formats
- [Text System](text-system.md) - Text encoding
