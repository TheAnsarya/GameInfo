# Dragon Quest III (SNES) - ROM Map

Complete ROM memory mapping for Dragon Quest III: Soshite Densetsu he... (SNES).

## ROM Information

| Property | Value |
|----------|-------|
| **Platform** | Super Nintendo (SNES) |
| **Mapping** | HiROM |
| **ROM Size** | 4 MB (32 Mbit) |
| **SRAM** | 32 KB (battery backed) |
| **Region** | Japan (NTSC-J) |
| **Release** | 1996 |

## Memory Mapping (HiROM)

### HiROM Address Layout

In HiROM mode, ROM is mapped to banks $C0-$FF:

| Bank Range | ROM Offset | Size | Access |
|------------|------------|------|--------|
| $C0-$FF | $000000-$3FFFFF | 4 MB | $0000-$FFFF per bank |

### Mirror Regions

- Banks $00-$3F mirror ROM at $8000-$FFFF
- Banks $80-$BF mirror ROM at $8000-$FFFF (FastROM)

## Bank Organization

### Core Engine ($C0:0000-$C3:FFFF)

| Bank | Contents |
|------|----------|
| $C0 | Boot code, vectors, initialization |
| $C1 | Main game loop, mode management |
| $C2 | Battle engine core |
| $C3 | Menu system, UI framework |

### Game Systems ($C4:0000-$CB:FFFF)

| Bank | Contents |
|------|----------|
| $C4 | Field/map engine |
| $C5 | NPC scripting, events |
| $C6 | Dialog system |
| $C7 | Item/equipment system |
| $C8 | Character progression |
| $C9 | Spell/ability system |
| $CA | Monster AI |
| $CB | Audio driver |

### Data Tables ($CC:0000-$D7:FFFF)

| Bank | Contents |
|------|----------|
| $CC-$CD | Monster data tables |
| $CE-$CF | Item/equipment tables |
| $D0-$D1 | Spell/ability tables |
| $D2-$D3 | Character class data |
| $D4-$D5 | Shop/service data |
| $D6-$D7 | Encounter tables |

### Map Data ($D8:0000-$E3:FFFF)

| Bank | Contents |
|------|----------|
| $D8-$DB | Overworld map data |
| $DC-$DF | Town/village maps |
| $E0-$E3 | Dungeon/cave maps |

### Graphics ($E4:0000-$EF:FFFF)

| Bank | Contents |
|------|----------|
| $E4-$E7 | Character sprites |
| $E8-$EB | Monster sprites |
| $EC-$EE | Tilesets |
| $EF | UI graphics |

### Text Data ($F0:0000-$F7:FFFF)

| Bank | Contents |
|------|----------|
| $F0-$F3 | Dialog text (compressed) |
| $F4-$F5 | Item/spell names |
| $F6-$F7 | Monster/NPC names |

### Audio ($F8:0000-$FF:FFFF)

| Bank | Contents |
|------|----------|
| $F8-$FB | Music sequence data |
| $FC-$FE | Sample data (BRR) |
| $FF | ROM header, vectors |

## Key Data Tables

### Monster Table

Location: Banks $CC-$CD

| Offset | Size | Description |
|--------|------|-------------|
| $CC0000 | 32 × ~300 | Monster stat entries |
| $CD0000 | variable | Monster AI scripts |
| $CD8000 | variable | Monster graphics pointers |

### Character Class Table

Location: Banks $D2-$D3

| Offset | Size | Description |
|--------|------|-------------|
| $D20000 | 64 × 12 | Class base stats |
| $D20300 | 64 × 99 | Level-up stat tables |
| $D28000 | variable | Spell learning tables |

### Item Table

Location: Banks $CE-$CF

| Offset | Size | Description |
|--------|------|-------------|
| $CE0000 | 16 × ~250 | Item properties |
| $CE1000 | 16 × ~80 | Weapon stats |
| $CE2000 | 16 × ~60 | Armor stats |
| $CE3000 | 8 × ~40 | Accessory stats |

## ROM Header ($FF:FFB0-$FF:FFDF)

| Offset | Size | Description |
|--------|------|-------------|
| $FFFFB0 | 21 | Game title |
| $FFFFC5 | 1 | Map mode ($21 = HiROM + FastROM) |
| $FFFFC6 | 1 | ROM type ($02 = ROM + SRAM) |
| $FFFFC7 | 1 | ROM size ($0C = 4 MB) |
| $FFFFC8 | 1 | SRAM size ($05 = 32 KB) |
| $FFFFC9 | 1 | Region ($00 = Japan) |
| $FFFFCA | 1 | Developer ID ($C1 = Enix) |
| $FFFFCB | 1 | Version |
| $FFFFCC | 2 | Checksum complement |
| $FFFFCE | 2 | Checksum |

## Interrupt Vectors ($FF:FFE0-$FF:FFFF)

### Native Mode (65816)

| Vector | Address | Handler |
|--------|---------|---------|
| COP | $FFE4 | $C0:8200 |
| BRK | $FFE6 | $C0:8200 |
| ABORT | $FFE8 | $C0:8200 |
| NMI | $FFEA | $C0:8050 |
| IRQ | $FFEE | $C0:8100 |

### Emulation Mode (6502)

| Vector | Address | Handler |
|--------|---------|---------|
| RESET | $FFFC | $C0:8000 |
| IRQ/BRK | $FFFE | $C0:8100 |

## External References

- [DQ3R-Info Repository](https://github.com/TheAnsarya/dq3r-info)
- [Data Crystal - Dragon Quest III](https://datacrystal.tcrf.net/wiki/Dragon_Quest_III)
