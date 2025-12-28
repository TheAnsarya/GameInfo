# Soul Blazer Data Structures

Comprehensive documentation of game data structures used in Soul Blazer (SNES).

## Entity System

### Entity Table Entry (32 bytes)

The game maintains an entity table for all active objects.

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Type | Entity type ID |
| $01 | 1 | State | Current state/animation |
| $02-$03 | 2 | X Position | Fixed-point (8.8) |
| $04-$05 | 2 | Y Position | Fixed-point (8.8) |
| $06 | 1 | Direction | 0-7 (8 directions) |
| $07 | 1 | Frame | Current animation frame |
| $08-$09 | 2 | HP | Current hit points |
| $0A-$0B | 2 | Max HP | Maximum hit points |
| $0C | 1 | Attack | Attack power |
| $0D | 1 | Defense | Defense power |
| $0E | 1 | Flags | Status flags |
| $0F | 1 | Timer | General timer |
| $10-$11 | 2 | Target X | Movement target X |
| $12-$13 | 2 | Target Y | Movement target Y |
| $14 | 1 | Speed | Movement speed |
| $15 | 1 | AI State | AI behavior state |
| $16-$17 | 2 | Sprite | Sprite index |
| $18-$19 | 2 | Palette | Palette index |
| $1A | 1 | Priority | Draw priority |
| $1B | 1 | Collision | Collision flags |
| $1C-$1D | 2 | Parent | Parent entity index |
| $1E-$1F | 2 | Reserved | Unused |

### Entity Flags ($0E)

```
  Bit 0: Active
  Bit 1: Visible
  Bit 2: Solid
  Bit 3: Invincible
  Bit 4: Floating
  Bit 5: No gravity
  Bit 6: Player owned
  Bit 7: Boss
```

### Direction Values

```
  0 = Up
  1 = Up-Right
  2 = Right
  3 = Down-Right
  4 = Down
  5 = Down-Left
  6 = Left
  7 = Up-Left
```

---

## Player Data Structure (52 bytes)

Located at $7E0100.

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00-$01 | 2 | Current HP | Player health |
| $02-$03 | 2 | Max HP | Maximum health |
| $04-$05 | 2 | Level | Current level |
| $06-$09 | 4 | Experience | Total EXP |
| $0A-$0D | 4 | EXP to Next | EXP needed |
| $0E | 1 | Strength | STR stat |
| $0F | 1 | Defense | DEF stat |
| $10 | 1 | Luck | LCK stat |
| $11 | 1 | Magic Power | Magic strength |
| $12-$13 | 2 | GEMs | Currency |
| $14 | 1 | Sword | Equipped sword ID |
| $15 | 1 | Armor | Equipped armor ID |
| $16 | 1 | Magic | Equipped magic ID |
| $17 | 1 | Emblem | Active emblem ID |
| $18-$1B | 4 | Sword Flags | Owned swords bitmask |
| $1C-$1F | 4 | Armor Flags | Owned armors bitmask |
| $20-$23 | 4 | Magic Flags | Owned magics bitmask |
| $24 | 1 | Emblem Flags | Owned emblems |
| $25-$2C | 8 | Item Flags | Owned key items |
| $2D | 1 | Current Area | Area ID |
| $2E-$2F | 2 | Souls Released | Count |
| $30-$31 | 2 | Lairs Cleared | Count |
| $32-$33 | 2 | Play Time | Minutes |

---

## Enemy Data Structure (16 bytes)

Enemy definition table entries.

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00-$01 | 2 | HP | Hit points |
| $02 | 1 | Attack | Attack power |
| $03 | 1 | Defense | Defense power |
| $04-$05 | 2 | Experience | EXP reward |
| $06-$07 | 2 | GEMs | Currency drop |
| $08 | 1 | Element | Elemental type |
| $09 | 1 | AI Type | Behavior pattern |
| $0A | 1 | Movement | Movement type |
| $0B | 1 | Speed | Movement speed |
| $0C-$0D | 2 | Sprite | Sprite index |
| $0E | 1 | Flags | Special flags |
| $0F | 1 | Drop ID | Item drop ID |

### Element Types ($08)

| Value | Element | Color |
|-------|---------|-------|
| $00 | Normal | - |
| $01 | Fire | Red |
| $02 | Ice | Blue |
| $03 | Thunder | Yellow |
| $04 | Light | White |
| $05 | Dark | Purple |
| $06 | Earth | Brown |
| $07 | Holy | Gold |

### AI Types ($09)

| Value | Behavior |
|-------|----------|
| $00 | Stationary |
| $01 | Patrol horizontal |
| $02 | Patrol vertical |
| $03 | Chase player |
| $04 | Random movement |
| $05 | Circle pattern |
| $06 | Flee from player |
| $07 | Boss AI |

### Enemy Flags ($0E)

```
  Bit 0: Flying
  Bit 1: Can split
  Bit 2: Respawns
  Bit 3: Invulnerable front
  Bit 4: Invulnerable back
  Bit 5: Shoots projectiles
  Bit 6: Boss minion
  Bit 7: Mini-boss
```

---

## Soul Lair Data Structure (8 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Type | Lair type |
| $01 | 1 | Monster ID | Enemy type to spawn |
| $02 | 1 | Count | Number to spawn |
| $03 | 1 | Release | What gets released |
| $04-$05 | 2 | X Position | Map X coordinate |
| $06-$07 | 2 | Y Position | Map Y coordinate |

### Lair Types ($00)

| Value | Type | Appearance |
|-------|------|------------|
| $00 | Ground | Stone pillar |
| $01 | Flying | Floating orb |
| $02 | Water | Bubble |
| $03 | Metal | Iron crate |
| $04 | Wood | Tree stump |
| $05 | Magic | Crystal |

### Release Types ($03)

| Value | Release |
|-------|---------|
| $00 | Nothing |
| $01 | NPC (villager) |
| $02 | NPC (special) |
| $03 | Item |
| $04 | Bridge/platform |
| $05 | Passage |
| $06 | Boss trigger |

---

## Equipment Data Structure (8 bytes)

### Sword Entry

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Attack | Base attack power |
| $01 | 1 | Element | Element type |
| $02 | 1 | Range | Attack range |
| $03 | 1 | Speed | Swing speed |
| $04 | 1 | Effect | Special effect |
| $05 | 1 | Magic Cost | MP for special |
| $06-$07 | 2 | Price | Shop price |

### Armor Entry

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Defense | Base defense |
| $01 | 1 | Element | Resistance |
| $02 | 1 | Weight | Movement penalty |
| $03 | 1 | Magic Def | Magic defense |
| $04 | 1 | Effect | Special effect |
| $05 | 1 | Reserved | - |
| $06-$07 | 2 | Price | Shop price |

### Magic Entry

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Power | Magic power |
| $01 | 1 | Element | Element type |
| $02 | 1 | Range | Effect range |
| $03 | 1 | Cost | GEM cost |
| $04 | 1 | Effect | Effect type |
| $05 | 1 | Targets | Max targets |
| $06-$07 | 2 | Animation | Animation ID |

---

## Map Data Structures

### Map Header (16 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00 | 1 | Width | Map width in screens |
| $01 | 1 | Height | Map height in screens |
| $02 | 1 | Tileset | Tileset ID |
| $03 | 1 | Palette | Palette ID |
| $04-$05 | 2 | Music | BGM track ID |
| $06-$07 | 2 | Tilemap Ptr | Pointer to tilemap |
| $08-$09 | 2 | Collision Ptr | Pointer to collision |
| $0A-$0B | 2 | Entity Ptr | Pointer to entities |
| $0C-$0D | 2 | Lair Ptr | Pointer to lairs |
| $0E-$0F | 2 | Exit Ptr | Pointer to exits |

### Exit Entry (8 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00-$01 | 2 | X Range | Exit X bounds |
| $02-$03 | 2 | Y Range | Exit Y bounds |
| $04 | 1 | Dest Map | Destination map ID |
| $05 | 1 | Dest X | Destination X |
| $06 | 1 | Dest Y | Destination Y |
| $07 | 1 | Flags | Transition flags |

### Collision Tile Types

| Value | Type | Effect |
|-------|------|--------|
| $00 | Floor | Walkable |
| $01 | Wall | Solid |
| $02 | Water | Damage (no swim) |
| $03 | Pit | Fall/damage |
| $04 | Lava | Fire damage |
| $05 | Ice | Slippery |
| $06 | Spikes | Contact damage |
| $07 | Conveyor N | Push north |
| $08 | Conveyor E | Push east |
| $09 | Conveyor S | Push south |
| $0A | Conveyor W | Push west |
| $0B | Stairs up | Level change |
| $0C | Stairs down | Level change |
| $0D | Door | Transition |
| $0E | Chest | Interactable |
| $0F | Switch | Trigger |

---

## Save Data Structure (512 bytes per slot)

SRAM layout for each save slot.

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $000-$033 | 52 | Player Data | Player stats |
| $034-$0B3 | 128 | Lair Flags | Cleared lairs |
| $0B4-$133 | 128 | Soul Flags | Released souls |
| $134-$153 | 32 | Event Flags | Story progress |
| $154-$173 | 32 | Item Flags | Items obtained |
| $174-$177 | 4 | Checksum | Data integrity |
| $178-$1BF | 72 | Reserved | Unused |
| $1C0-$1FF | 64 | Name | Player name (8×8) |

### Checksum Algorithm

```python
def calculate_checksum(data: bytes) -> int:
    """Calculate save file checksum"""
    checksum = 0x1234  # Initial value
    
    for i in range(0, 0x174, 2):
        word = data[i] | (data[i + 1] << 8)
        checksum = (checksum + word) & 0xFFFF
    
    return checksum ^ 0x5555
```

---

## Text Data Structures

### Dialog Block Header

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00-$01 | 2 | Entry Count | Number of entries |
| $02-$03 | 2 | Block Size | Total byte size |

### Dialog Entry

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| $00-$01 | 2 | Pointer | Text data offset |
| $02 | 1 | Speaker | Speaker ID |
| $03 | 1 | Flags | Display flags |

### Text Control Codes

| Code | Name | Function |
|------|------|----------|
| $00 | END | End of string |
| $01 | NEWLINE | New line |
| $02 | PAUSE | Wait for input |
| $03 | CLEAR | Clear text box |
| $04 | PLAYER | Insert player name |
| $05 | ITEM | Insert item name |
| $06 | NUMBER | Insert number |
| $07 | WAIT | Timed pause |
| $08-$0F | COLOR | Text color change |
| $10-$1F | SPEED | Text speed |

### Character Encoding

Soul Blazer uses a custom encoding table:

| Range | Content |
|-------|---------|
| $00-$09 | Control codes |
| $0A-$23 | Numbers 0-9, punctuation |
| $24-$3D | Uppercase A-Z |
| $3E-$57 | Lowercase a-z |
| $58-$FF | Extended/special |

---

## Pointer Table Formats

### 16-bit Pointer Table

```
  Entry 0: $LLHH (bank-relative offset)
  Entry 1: $LLHH
  ...
```

Actual address = Bank base + offset

### 24-bit Pointer Table

```
  Entry 0: $LLHHBB (absolute LoROM address)
  Entry 1: $LLHHBB
  ...
```

### LoROM Address Conversion

```python
def lorom_to_file(addr: int) -> int:
    """Convert LoROM address to file offset"""
    bank = (addr >> 16) & 0x7F
    offset = addr & 0xFFFF
    
    if offset >= 0x8000:
        return (bank * 0x8000) + (offset - 0x8000)
    else:
        return None  # Not ROM space

def file_to_lorom(offset: int) -> int:
    """Convert file offset to LoROM address"""
    bank = offset // 0x8000
    addr = 0x8000 + (offset % 0x8000)
    return (bank << 16) | addr
```

---

## See Also

- [Graphics Formats](graphics-formats.md)
- [Audio Formats](audio-formats.md)
- [ROM Map](rom-map.md)
- [RAM Map](ram-map.md)
