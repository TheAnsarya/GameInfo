# Dragon Warrior (NES) - RAM Map

## Overview

Dragon Warrior uses the NES's 2KB internal RAM ($0000-$07FF) for all runtime data. The game does not use battery-backed SRAM - instead it uses a password system.

## Memory Layout

| Range | Size | Description |
|-------|------|-------------|
| $0000-$00FF | 256 bytes | Zero Page (fast access) |
| $0100-$01FF | 256 bytes | Stack |
| $0200-$02FF | 256 bytes | OAM shadow buffer |
| $0300-$03FF | 256 bytes | Temporary buffers |
| $0400-$05FF | 512 bytes | Game state / Player data |
| $0600-$07FF | 512 bytes | Map/NPC data buffer |

## Zero Page ($00-$FF)

### System Variables ($00-$1F)
| Address | Size | Description |
|---------|------|-------------|
| $00-$01 | 2 bytes | General purpose pointer |
| $02-$03 | 2 bytes | Temporary pointer |
| $04-$05 | 2 bytes | Text pointer |
| $06 | 1 byte | Frame counter |
| $07 | 1 byte | Random number seed |
| $08 | 1 byte | Controller input (current) |
| $09 | 1 byte | Controller input (previous) |
| $0A | 1 byte | Controller input (new presses) |
| $0B | 1 byte | PPU control mirror |
| $0C | 1 byte | PPU mask mirror |
| $0D | 1 byte | Scroll X |
| $0E | 1 byte | Scroll Y |
| $0F | 1 byte | Current PRG bank |

### Game State ($20-$3F)
| Address | Size | Description |
|---------|------|-------------|
| $20 | 1 byte | Game mode (0=title, 1=overworld, 2=town, 3=battle) |
| $21 | 1 byte | Sub-mode |
| $22 | 1 byte | Menu state |
| $23 | 1 byte | Dialog state |
| $24 | 1 byte | Current map ID |
| $25 | 1 byte | Player X on map |
| $26 | 1 byte | Player Y on map |
| $27 | 1 byte | Player facing direction (0=S, 1=N, 2=W, 3=E) |
| $28 | 1 byte | Steps until encounter |
| $29 | 1 byte | Current floor (dungeons) |
| $2A-$2B | 2 bytes | World position X |
| $2C-$2D | 2 bytes | World position Y |

### Battle Variables ($40-$5F)
| Address | Size | Description |
|---------|------|-------------|
| $40 | 1 byte | Current monster ID |
| $41 | 1 byte | Monster current HP (low) |
| $42 | 1 byte | Monster current HP (high) |
| $43 | 1 byte | Monster attack |
| $44 | 1 byte | Monster defense |
| $45 | 1 byte | Monster agility |
| $46 | 1 byte | Monster sleep counter |
| $47 | 1 byte | Monster stopspell flag |
| $48 | 1 byte | Battle phase |
| $49 | 1 byte | Player action selected |
| $4A | 1 byte | Damage dealt (low) |
| $4B | 1 byte | Damage dealt (high) |
| $4C | 1 byte | Is critical hit |
| $4D | 1 byte | Is miss |
| $4E | 1 byte | Player can run |
| $4F | 1 byte | Monster spell this turn |

### Temporary Math ($60-$7F)
| Address | Size | Description |
|---------|------|-------------|
| $60-$61 | 2 bytes | Multiplicand |
| $62-$63 | 2 bytes | Multiplier |
| $64-$67 | 4 bytes | Product |
| $68-$69 | 2 bytes | Dividend |
| $6A-$6B | 2 bytes | Divisor |
| $6C-$6D | 2 bytes | Quotient |
| $6E-$6F | 2 bytes | Remainder |

## Player Data ($0400-$047F)

### Core Stats ($0400-$041F)
| Address | Size | Description |
|---------|------|-------------|
| $0400-$0407 | 8 bytes | Player name (padded) |
| $0408-$0409 | 2 bytes | Current HP |
| $040A-$040B | 2 bytes | Maximum HP |
| $040C | 1 byte | Current MP |
| $040D | 1 byte | Maximum MP |
| $040E-$040F | 2 bytes | Strength |
| $0410-$0411 | 2 bytes | Agility |
| $0412 | 1 byte | Level |
| $0413-$0415 | 3 bytes | Experience |
| $0416-$0418 | 3 bytes | Gold |

### Equipment ($0420-$042F)
| Address | Size | Description |
|---------|------|-------------|
| $0420 | 1 byte | Weapon ID |
| $0421 | 1 byte | Armor ID |
| $0422 | 1 byte | Shield ID |
| $0423 | 1 byte | Equipped accessory |
| $0424-$042F | 12 bytes | Reserved |

### Inventory ($0430-$043F)
| Address | Size | Description |
|---------|------|-------------|
| $0430-$0437 | 8 bytes | Item slots (8 items max) |
| $0438-$043F | 8 bytes | Item quantities (unused in DW1) |

### Spell Flags ($0440-$044F)
| Address | Size | Description |
|---------|------|-------------|
| $0440 | 1 byte | Spells known (bitfield) |
| $0441 | 1 byte | Reserved |

Spell bitfield:
```
Bit 0: HEAL
Bit 1: HURT
Bit 2: SLEEP
Bit 3: RADIANT
Bit 4: STOPSPELL
Bit 5: OUTSIDE
Bit 6: RETURN
Bit 7: REPEL
(Additional spells in $0441)
```

### Status Flags ($0450-$045F)
| Address | Size | Description |
|---------|------|-------------|
| $0450 | 1 byte | Status effects |
| $0451 | 1 byte | Herb count |
| $0452 | 1 byte | Key count |
| $0453 | 1 byte | Torch count |
| $0454 | 1 byte | Has Silver Harp |
| $0455 | 1 byte | Has Staff of Rain |
| $0456 | 1 byte | Has Stones of Sunlight |
| $0457 | 1 byte | Has Token of Erdrick |
| $0458 | 1 byte | Has Gwaelin's Love |
| $0459 | 1 byte | Has Sword of Erdrick |
| $045A | 1 byte | Has Armor of Erdrick |
| $045B | 1 byte | Has Rainbow Drop |
| $045C | 1 byte | Has Dragonlord's Castle key |

Status bitfield ($0450):
```
Bit 0: Poisoned
Bit 1: Cursed
Bit 2: Asleep (in battle)
Bit 3: Stopped (Stopspell effect)
Bit 4-7: Reserved
```

### Progress Flags ($0460-$046F)
| Address | Size | Description |
|---------|------|-------------|
| $0460 | 1 byte | Defeated Dragonlord flag |
| $0461 | 1 byte | Princess rescued flag |
| $0462 | 1 byte | Green Dragon defeated |
| $0463 | 1 byte | Golem defeated |
| $0464 | 1 byte | Axe Knight defeated |
| $0465-$046F | 11 bytes | Treasure chest flags |

## Map Buffer ($0600-$07FF)

| Address | Size | Description |
|---------|------|-------------|
| $0600-$067F | 128 bytes | Visible map tiles (16×8) |
| $0680-$06FF | 128 bytes | NPC position data |
| $0700-$077F | 128 bytes | NPC movement scripts |
| $0780-$07FF | 128 bytes | Decompression buffer |

## Password System

Dragon Warrior uses a password system instead of battery save. The password encodes:
- Player name (4 letters)
- Experience points
- Gold
- Items and equipment
- Progress flags
- Checksum

Password is 20 characters from set: `あいうえおかきくけこさしすせそたちつてと` (Japanese) or custom for US version.

## Common RAM Addresses

| Address | Description | Notes |
|---------|-------------|-------|
| $0408 | Current HP | Check for death |
| $040C | Current MP | Check for spell use |
| $0412 | Level | Max 30 |
| $0420 | Weapon | Affects attack power |
| $0440 | Spells | Bitfield of known spells |
| $0450 | Status | Poison/curse checking |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [Data Structures](data-structures.md) - Table formats
- [Text System](text-system.md) - Text encoding
