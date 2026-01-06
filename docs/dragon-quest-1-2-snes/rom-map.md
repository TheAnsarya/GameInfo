# Dragon Quest I & II (SNES) - ROM Map

## Overview

Dragon Quest I & II for SNES is a compilation remake of the first two Dragon Quest games. It uses HiROM mapping with 16 Mbit (2MB) ROM.

## ROM Header

| Offset | Size | Description |
|--------|------|-------------|
| $00FFC0 | 21 | Internal title: "DRAGON QUEST I.II   " |
| $00FFD5 | 1 | ROM makeup: $31 (HiROM, FastROM) |
| $00FFD6 | 1 | ROM type: $02 (ROM + SRAM + Battery) |
| $00FFD7 | 1 | ROM size: $0B (16 Mbit = 2MB) |
| $00FFD8 | 1 | SRAM size: $03 (64Kbit = 8KB) |
| $00FFD9 | 1 | Country: $00 (Japan) |
| $00FFDA | 1 | Developer ID: $33 (Extended header) |
| $00FFDB | 1 | Version: $00 |
| $00FFDC-$FFDD | 2 | Checksum complement |
| $00FFDE-$FFDF | 2 | Checksum |

## Bank Layout

### Dragon Quest I Data ($C0-$CF)

| Bank | Address Range | Contents |
|------|---------------|----------|
| $C0 | $C00000-$C0FFFF | Main program, interrupt handlers |
| $C1 | $C10000-$C1FFFF | DQ1 field engine |
| $C2 | $C20000-$C2FFFF | DQ1 battle engine |
| $C3 | $C30000-$C3FFFF | DQ1 menu system |
| $C4 | $C40000-$C4FFFF | DQ1 map data (Alefgard overworld) |
| $C5 | $C50000-$C5FFFF | DQ1 dungeon maps |
| $C6 | $C60000-$C6FFFF | DQ1 town maps |
| $C7 | $C70000-$C7FFFF | DQ1 monster data |
| $C8 | $C80000-$C8FFFF | DQ1 dialogue (part 1) |
| $C9 | $C90000-$C9FFFF | DQ1 dialogue (part 2) |

### Dragon Quest II Data ($CA-$D9)

| Bank | Address Range | Contents |
|------|---------------|----------|
| $CA | $CA0000-$CAFFFF | DQ2 field engine |
| $CB | $CB0000-$CBFFFF | DQ2 battle engine |
| $CC | $CC0000-$CCFFFF | DQ2 menu system |
| $CD | $CD0000-$CDFFFF | DQ2 overworld maps |
| $CE | $CE0000-$CEFFFF | DQ2 dungeon maps (part 1) |
| $CF | $CF0000-$CFFFFF | DQ2 dungeon maps (part 2) |
| $D0 | $D00000-$D0FFFF | DQ2 town maps |
| $D1 | $D10000-$D1FFFF | DQ2 monster data |
| $D2 | $D20000-$D2FFFF | DQ2 dialogue (part 1) |
| $D3 | $D30000-$D3FFFF | DQ2 dialogue (part 2) |
| $D4 | $D40000-$D4FFFF | DQ2 dialogue (part 3) |

### Shared Resources ($DA-$DF)

| Bank | Address Range | Contents |
|------|---------------|----------|
| $DA | $DA0000-$DAFFFF | Shared graphics routines |
| $DB | $DB0000-$DBFFFF | Character sprites |
| $DC | $DC0000-$DCFFFF | Monster sprites (part 1) |
| $DD | $DD0000-$DDFFFF | Monster sprites (part 2) |
| $DE | $DE0000-$DEFFFF | Tile graphics |
| $DF | $DF0000-$DFFFFF | Music/sound data |

## CPU Address Mapping (HiROM)

| CPU Address | ROM Offset | Description |
|-------------|------------|-------------|
| $C00000-$DFFFFF | $000000-$1FFFFF | ROM banks C0-DF |
| $400000-$5FFFFF | $000000-$1FFFFF | ROM mirror |
| $7E0000-$7FFFFF | — | WRAM (128KB) |
| $306000-$307FFF | — | SRAM (8KB) |

## Key Data Locations

### DQ1 Monster Data ($C7)

| Address | Size | Contents |
|---------|------|----------|
| $C70000 | 1200 | Monster stats (40 × 30 bytes) |
| $C704B0 | 800 | Monster names |
| $C707D0 | 400 | Monster graphics pointers |
| $C70960 | 160 | Encounter tables |

### DQ1 Item Data ($C3)

| Address | Size | Contents |
|---------|------|----------|
| $C38000 | 512 | Item definitions |
| $C38200 | 768 | Item names |
| $C38500 | 256 | Shop inventories |

### DQ2 Monster Data ($D1)

| Address | Size | Contents |
|---------|------|----------|
| $D10000 | 2580 | Monster stats (86 × 30 bytes) |
| $D10A14 | 1720 | Monster names |
| $D110BC | 688 | Monster graphics pointers |
| $D11364 | 344 | Encounter tables |

### DQ2 Party Data ($CC)

| Address | Size | Contents |
|---------|------|----------|
| $CC8000 | 240 | Base stats per character |
| $CC80F0 | 720 | Level-up stat tables |
| $CC83C0 | 384 | Spell learning tables |

## Graphics Format

### Tile Format
- 4BPP planar format
- 8×8 pixels per tile
- 32 bytes per tile

### Sprite Format
- Mode 1 sprites
- Variable size (16×16 to 64×64)
- Compressed with LZ variant

### Map Tiles
- 16×16 metatiles
- 2-layer backgrounds
- Mode 1 graphics mode

## Music System

### Sound Driver
Located at $DF0000, uses the SPC700 format.

| Offset | Size | Contents |
|--------|------|----------|
| $DF0000 | 8KB | SPC driver code |
| $DF2000 | 32KB | Instrument samples |
| $DFA000 | 24KB | Music sequence data |

### Music IDs

| ID | Track |
|----|-------|
| $01 | DQ1 Title Theme |
| $02 | DQ1 Castle |
| $03 | DQ1 Town |
| $04 | DQ1 Field |
| $05 | DQ1 Dungeon |
| $06 | DQ1 Battle |
| $07 | DQ1 Final Battle |
| $10 | DQ2 Title Theme |
| $11 | DQ2 Castle |
| $12 | DQ2 Town |
| $13 | DQ2 Field |
| $14 | DQ2 Dungeon |
| $15 | DQ2 Battle |
| $16 | DQ2 Final Battle |

## Interrupt Vectors

| Vector | Address | Handler |
|--------|---------|---------|
| NMI | $00FFEA | $C00100 |
| RESET | $00FFFC | $C00000 |
| IRQ | $00FFEE | $C00200 |
| COP | $00FFE4 | $C00300 |
| BRK | $00FFE6 | $C00300 |

## See Also

- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Data formats
- [Text System](text-system.md) - Text encoding
