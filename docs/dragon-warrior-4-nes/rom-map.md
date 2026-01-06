# Dragon Warrior IV (NES) - ROM Map

Complete ROM memory mapping for Dragon Warrior IV (NES).

## ROM Information

| Property | Value |
|----------|-------|
| **Platform** | Nintendo Entertainment System (NES) |
| **Mapper** | MMC5 (iNES Mapper 5) |
| **PRG-ROM** | 512 KB (32 banks × 16 KB) |
| **CHR-ROM** | 256 KB (RAM, bank switched) |
| **PRG-RAM** | 8 KB (battery backed for saves) |
| **Mirroring** | MMC5 controlled |

## Bank Organization

### PRG-ROM Banks ($00-$1F)

| Bank | Address Range | Size | Contents |
|------|---------------|------|----------|
| $00-$01 | $00000-$07FFF | 32 KB | Main game code, initialization |
| $02-$03 | $08000-$0FFFF | 32 KB | Additional code |
| $04-$05 | $10000-$17FFF | 32 KB | Event/script handling |
| $06-$07 | $18000-$1FFFF | 32 KB | Chapter-specific code |
| $08-$0B | $20000-$2FFFF | 64 KB | Map data |
| $0C-$0F | $30000-$3FFFF | 64 KB | Graphics/tileset data |
| $10-$13 | $40000-$4FFFF | 64 KB | NPC/event data |
| $14-$17 | $50000-$5FFFF | 64 KB | Battle system |
| $18-$1B | $60000-$6FFFF | 64 KB | Monster/enemy data |
| $1C-$1D | $70000-$77FFF | 32 KB | Item/equipment data |
| $1E-$1F | $78000-$7FFFF | 32 KB | Text/dialog data |

## Key ROM Regions

### Game Code ($00000-$1FFFF)

| Offset | Size | Description |
|--------|------|-------------|
| $00000 | 16 KB | Reset vector, NMI handler, core routines |
| $04000 | 16 KB | Menu system, inventory management |
| $08000 | 16 KB | Battle engine core |
| $0C000 | 16 KB | Map engine, collision, scrolling |
| $10000 | 16 KB | Event scripting engine |
| $14000 | 16 KB | Chapter transition logic |
| $18000 | 16 KB | AI systems for party members |
| $1C000 | 16 KB | Sound/music driver |

### Map Data ($20000-$2FFFF)

| Offset | Size | Description |
|--------|------|-------------|
| $20000 | 32 KB | Overworld map chunks |
| $28000 | 16 KB | Town/village maps |
| $2C000 | 16 KB | Dungeon/cave maps |

### Monster Data ($60000-$6FFFF)

| Offset | Size | Description |
|--------|------|-------------|
| $60000 | 8 KB | Monster stats table (209 entries) |
| $62000 | 8 KB | Monster AI patterns |
| $64000 | 16 KB | Monster graphics pointers |
| $68000 | 16 KB | Battle formations |
| $6C000 | 16 KB | Encounter tables per zone |

### Item Data ($70000-$77FFF)

| Offset | Size | Description |
|--------|------|-------------|
| $70000 | 4 KB | Item properties (220 items × 8 bytes) |
| $71000 | 4 KB | Equipment stats |
| $72000 | 4 KB | Shop inventories |
| $73000 | 4 KB | Drop tables |
| $74000 | 16 KB | Item names/descriptions |

### Text Data ($78000-$7FFFF)

| Offset | Size | Description |
|--------|------|-------------|
| $78000 | 16 KB | Dialog text (compressed) |
| $7C000 | 8 KB | Menu text, system messages |
| $7E000 | 4 KB | Character names |
| $7F000 | 4 KB | Spell/ability names |

## Data Structures Summary

### Monster Entry (27 bytes)

```
Offset  Size  Description
------  ----  -----------
$00     2     HP (base)
$02     1     MP
$03     1     Attack
$04     1     Defense
$05     1     Agility
$06     1     Experience (low)
$07     1     Experience (high)
$08     1     Gold (low)
$09     1     Gold (high)
$0A     1     Spell resistance
$0B     1     Breath resistance
$0C     1     Status immunity
$0D     2     AI pattern pointer
$0F     1     Graphics ID
$10     1     Palette
$11-$1A 10    Action scripts
```

### Item Entry (8 bytes)

```
Offset  Size  Description
------  ----  -----------
$00     1     Item type/flags
$01     1     Effect ID
$02     1     Equip stat modifier
$03     1     Who can equip (bitmask)
$04     2     Buy price
$06     2     Sell price
```

## External References

- [Full Disassembly](https://github.com/TheAnsarya/dragon-warrior-4-info)
- [Data Crystal](https://datacrystal.tcrf.net/wiki/Dragon_Warrior_IV)
