# Secret of Mana - RAM Map

This document contains a comprehensive map of Secret of Mana's RAM usage during gameplay.

## RAM Overview

| Region | Address Range | Size | Description |
|--------|---------------|------|-------------|
| Low RAM | $7e0000-$7e1fff | 8 KB | System variables, stack |
| Work RAM | $7e2000-$7effff | ~56 KB | Game state, entities |
| High RAM | $7f0000-$7fffff | 64 KB | Extended work area |

---

## System Variables

### Hardware Registers Shadow

| Address | Size | Description |
|---------|------|-------------|
| $7e0000-$7e001f | 32 | PPU register shadows |

### Game State

| Address | Size | Description |
|---------|------|-------------|
| $7e0030 | 1 | Layer 2 transparency mode |
| $7e00dc | 1 | Exit destination low byte |
| $7e00dd | 1 | Exit destination high byte |
| $7e00de | 1 | Exit X coordinate |
| $7e00df | 1 | Exit Y coordinate |

---

## Character Data

### Base Addresses

| Address | Description |
|---------|-------------|
| $7ee000 | Character 1 (Hero) data block |
| $7ee200 | Character 2 (Girl) data block |
| $7ee400 | Character 3 (Sprite) data block |

### Character Structure (512 bytes each)

```
Base + Offset  Size  Description
---------------------------------
$000           2     Current HP
$002           2     Max HP
$004           2     Current MP
$006           2     Max MP
$008           1     Level
$009           1     Experience (low)
$00a           1     Experience (mid)
$00b           1     Experience (high)
$00c           1     Strength
$00d           1     Agility
$00e           1     Constitution
$00f           1     Intelligence
$010           1     Wisdom
$011           1     Luck
$012           1     Attack power
$013           1     Defense
$014           1     Hit rate
$015           1     Evade rate
$016           1     Magic defense
$017           1     Status flags
$018-$01f      8     Equipment slots
$020-$0ff      224   Additional data (TBD)
$100-$1ff      256   Sprite animation state
```

---

## Party Data

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document party management RAM* |

---

## Enemy Data

### Base Addresses

| Address | Description |
|---------|-------------|
| $7ee600 | Enemy 1 data block |
| $7ee800 | Enemy 2 data block |
| $7eea00 | Enemy 3 data block |

### Enemy Structure

```
Base + Offset  Size  Description
---------------------------------
$000           2     Current HP
$002           2     Max HP
$004           1     Enemy type ID
$005           1     AI state
$006           1     X position
$007           1     Y position
$008           1     Direction facing
$009           1     Animation frame
$00a           1     Status flags
$00b           1     Target character
$00c-          var   Additional AI data
```

---

## NPC/Entity Data

### Location NPC Table

| Address | Entry Size | Count | Description |
|---------|------------|-------|-------------|
| $7ec800 | 16 | var | Location NPCs and enemies |

**NPC Entry Structure (16 bytes):**
```
Offset  Size  Description
-------------------------
$00     1     Entity type
$01     1     Entity ID
$02     1     X position
$03     1     Y position
$04     1     Direction
$05     1     Animation state
$06     1     Movement pattern
$07     1     Collision flags
$08     1     Dialog/script ID
$09-$0f 7     Additional data
```

---

## Inventory

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document inventory RAM* |

### Item Slots

| Address | Description |
|---------|-------------|
| | Consumable items |
| | Equipment |
| | Key items |

---

## Magic/Spells

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document magic RAM* |

### Mana Power Levels

| Address | Description |
|---------|-------------|
| | Undine level |
| | Gnome level |
| | Sylphid level |
| | Salamando level |
| | Shade level |
| | Lumina level |
| | Luna level |
| | Dryad level |

---

## Map State

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document map RAM* |

### Current Location

| Address | Description |
|---------|-------------|
| | Current map ID |
| | Map flags |
| | Scroll position X |
| | Scroll position Y |

---

## Battle System

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document battle RAM* |

### Weapon Charge

| Address | Description |
|---------|-------------|
| | Charge level (0-8) |
| | Charge timer |

---

## Event/Script System

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document event RAM* |

---

## Save Data Structure

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document SRAM structure* |

**Note:** Game uses 8 KB SRAM for save data.

---

## Sound/Music State

| Address | Size | Description |
|---------|------|-------------|
| | | *TODO: Document audio RAM* |

---

## References

- [Data Crystal RAM Map](https://datacrystal.tcrf.net/wiki/Secret_of_Mana_(SNES):RAM_map)
- Existing Secret of Mana Editor documentation

---

*Note: All addresses are lowercase per project conventions.*
