# Secret of Mana - ROM Map

This document contains a comprehensive map of the Secret of Mana ROM, documenting all known data locations, code segments, and their purposes.

## ROM Information

| Property | Value |
|----------|-------|
| **ROM Type** | HiROM |
| **ROM Size** | 2 MB (0x200000 bytes) |
| **Bank Count** | 64 banks (32 KB each) |
| **Header** | None (headerless ROM) |

## Address Conversion

### HiROM Addressing

```
CPU Address → ROM Offset:
  $c0:0000-$ff:ffff → ROM offset = (bank - $c0) * $10000 + address
  $40:0000-$7d:ffff → ROM offset = (bank - $40) * $10000 + address (mirror)

ROM Offset → CPU Address:
  For HiROM: CPU = $c0 + (offset / $10000) : (offset % $10000)
```

### Quick Reference

| ROM Offset | CPU Address (HiROM) | CPU Address (Mirror) |
|------------|---------------------|----------------------|
| $000000 | $c0:0000 | $40:0000 |
| $010000 | $c1:0000 | $41:0000 |
| $100000 | $d0:0000 | $50:0000 |
| $1f0000 | $df:0000 | $5f:0000 |

---

## Bank Overview

| Bank | ROM Offset | Size | Contents |
|------|------------|------|----------|
| $00-$0f | $000000-$0fffff | 1 MB | Code and data |
| $10-$1f | $100000-$1fffff | 1 MB | Additional code/data |

---

## Code Segments

### Bank $00 ($000000-$00ffff)

| Offset | Size | CPU Address | Description |
|--------|------|-------------|-------------|
| $000000 | | $c0:0000 | Reset vector jump |
| | | | *TODO: Map bank $00* |

### Bank $01 ($010000-$01ffff)

| Offset | Size | CPU Address | Description |
|--------|------|-------------|-------------|
| | | | *TODO: Map bank $01* |

### Bank $02 ($020000-$02ffff)

| Offset | Size | CPU Address | Description |
|--------|------|-------------|-------------|
| | | | *TODO: Map bank $02* |

### Bank $03 ($030000-$03ffff)

| Offset | Size | CPU Address | Description |
|--------|------|-------------|-------------|
| $033d39 | | $c3:3d39 | SPC music pointers |
| $033f22 | | $c3:3f22 | Sample indexes |

---

## Data Tables

### Character Data

| ROM Offset | CPU Address | Size | Description |
|------------|-------------|------|-------------|
| $104213 | $d0:4213 | 40 | Main character level 1 stats |
| $10423b | $d0:423b | 40 | Main character level 2 stats |
| $104263 | $d0:4263 | 40 | Main character level 3 stats |
| $104217 | $d0:4217 | 40 | Girl level 1 stats |
| $10423f | $d0:423f | 40 | Girl level 2 stats |
| $104219 | $d0:4219 | 40 | Sprite level 1 stats |
| $104241 | $d0:4241 | 40 | Sprite level 2 stats |

**Character Stats Structure (40 bytes per level):**
```
Offset  Size  Description
$00     1     HP low byte
$01     1     HP high byte
$02     1     MP low byte
$03     1     MP high byte
$04     1     Strength
$05     1     Agility
$06     1     Constitution
$07     1     Intelligence
$08     1     Wisdom
$09-$27       (Additional stats TBD)
```

### Enemy Data

| ROM Offset | CPU Address | Size | Description |
|------------|-------------|------|-------------|
| $101dfa | $d0:1dfa | var | Enemy stats table (Rabite first) |
| $105116 | $d0:5116 | var | Enemy movement and AI data |

**Enemy Stats Structure:**
```
Offset  Size  Description
$00     2     HP
$02     2     MP
$04     2     Experience reward
$06     2     Gold reward
$08     1     Level
$09     1     Weapon power
$0a     1     Defense
$0b     1     Evade
$0c     1     Magic defense
$0d     1     Element weakness flags
$0e-    var   (Additional data TBD)
```

### Item Data

| ROM Offset | CPU Address | Size | Description |
|------------|-------------|------|-------------|
| $d8fb9c | $d8:fb9c | var | Item prices in stores |

### Drop Tables

| ROM Offset | CPU Address | Size | Description |
|------------|-------------|------|-------------|
| $d03a50 | $d0:3a50 | var | Drop percentage tables (Rabite first) |

---

## Map Data

### Exit/Warp Data

| ROM Offset | CPU Address | Entry Size | Description |
|------------|-------------|------------|-------------|
| $083000 | $c8:3000 | 4 | Exit data table |

**Exit Entry Structure (4 bytes):**
```
Offset  Size  Description
$00     1     Destination map ID
$01     1     Destination X coordinate
$02     1     Destination Y coordinate
$03     1     Flags/direction
```

---

## Audio Data

### SPC/Music Data

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| $033d39 | $c3:3d39 | SPC music pointers |
| $033f22 | $c3:3f22 | Sample indexes |
| $0a933f | $ca:933f | Potos Village music sequence |
| $c347c3 | | BRR sample data start |
| $c4d33d | | SPC sequence data start |

**SPC Sequence Commands:**
| Command | Description |
|---------|-------------|
| $00 | End track |
| $01-$df | Note data |
| $e0-$ff | Control commands |

---

## Graphics Data

### Sprite Data

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| | | *TODO: Map sprite locations* |

### Tileset Data

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| | | *TODO: Map tileset locations* |

---

## Text Data

### Dialog

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| | | *TODO: Map text locations* |

### Text Table

See `data/som.tbl` for character encoding.

---

## Unused Content Locations

See [TCRF - Secret of Mana](https://tcrf.net/Secret_of_Mana_(SNES)) for details.

| ROM Offset | CPU Address | Description |
|------------|-------------|-------------|
| | | Unused debug room |
| | | Unused items |
| | | Unused enemy sprites |

---

## Regional Differences

| Region | ROM Size | Notes |
|--------|----------|-------|
| Japan (J) | 2 MB | Original release |
| USA (U) | 2 MB | English translation |
| Europe (E) | 2 MB | Multiple languages |

---

## References

- [Data Crystal ROM Map](https://datacrystal.tcrf.net/wiki/Secret_of_Mana_(SNES):ROM_map)
- Existing Secret of Mana Editor tools

---

*Note: All addresses are lowercase per project conventions.*
