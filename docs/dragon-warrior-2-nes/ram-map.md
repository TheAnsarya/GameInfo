# Dragon Warrior II (NES) - RAM Map

## Overview

Dragon Warrior II uses the NES's 2KB internal RAM for runtime data. Like the first game, it uses a password system instead of battery-backed save.

## Memory Layout

| Range | Size | Description |
|-------|------|-------------|
| $0000-$00FF | 256 bytes | Zero Page |
| $0100-$01FF | 256 bytes | Stack |
| $0200-$02FF | 256 bytes | OAM buffer |
| $0300-$03FF | 256 bytes | Temporary buffers |
| $0400-$05FF | 512 bytes | Party data |
| $0600-$06FF | 256 bytes | Inventory/Items |
| $0700-$07FF | 256 bytes | Map/state |

## Zero Page ($00-$FF)

### System Variables ($00-$1F)
| Address | Size | Description |
|---------|------|-------------|
| $00-$01 | 2 bytes | General pointer |
| $02-$03 | 2 bytes | Text pointer |
| $04 | 1 byte | Frame counter |
| $05 | 1 byte | RNG seed |
| $06 | 1 byte | Current input |
| $07 | 1 byte | Previous input |
| $08 | 1 byte | New button presses |
| $09 | 1 byte | PPU control mirror |
| $0A | 1 byte | PPU mask mirror |
| $0B | 1 byte | Scroll X |
| $0C | 1 byte | Scroll Y |
| $0D | 1 byte | Current bank |

### Game State ($20-$3F)
| Address | Size | Description |
|---------|------|-------------|
| $20 | 1 byte | Game mode |
| $21 | 1 byte | Sub-mode |
| $22 | 1 byte | Menu state |
| $23 | 1 byte | Dialog state |
| $24 | 1 byte | Current map ID |
| $25 | 1 byte | Player X |
| $26 | 1 byte | Player Y |
| $27 | 1 byte | Facing direction |
| $28-$29 | 2 bytes | World X position |
| $2A-$2B | 2 bytes | World Y position |
| $2C | 1 byte | Encounter steps |
| $2D | 1 byte | Party in wagon (N/A in DW2) |
| $2E | 1 byte | Vehicle type (0=walk, 1=ship) |
| $2F | 1 byte | Time of day |

### Battle Variables ($40-$5F)
| Address | Size | Description |
|---------|------|-------------|
| $40 | 1 byte | Number of enemies |
| $41 | 1 byte | Enemy 1 ID |
| $42 | 1 byte | Enemy 2 ID |
| $43 | 1 byte | Enemy 3 ID |
| $44 | 1 byte | Enemy 4 ID |
| $45 | 1 byte | Enemy 1 HP (low) |
| $46 | 1 byte | Enemy 1 HP (high) |
| $47 | 1 byte | Enemy 2 HP (low) |
| $48 | 1 byte | Enemy 2 HP (high) |
| $49 | 1 byte | Enemy 3 HP (low) |
| $4A | 1 byte | Enemy 3 HP (high) |
| $4B | 1 byte | Enemy 4 HP (low) |
| $4C | 1 byte | Enemy 4 HP (high) |
| $4D | 1 byte | Current attacker |
| $4E | 1 byte | Current target |
| $4F | 1 byte | Battle phase |

## Party Data ($0400-$05FF)

### Prince of Midenhall ($0400-$043F)
| Address | Size | Description |
|---------|------|-------------|
| $0400-$0407 | 8 bytes | Name |
| $0408-$0409 | 2 bytes | Current HP |
| $040A-$040B | 2 bytes | Max HP |
| $040C | 1 byte | Current MP |
| $040D | 1 byte | Max MP |
| $040E | 1 byte | Strength |
| $040F | 1 byte | Agility |
| $0410 | 1 byte | Attack Power |
| $0411 | 1 byte | Defense Power |
| $0412 | 1 byte | Level |
| $0413-$0415 | 3 bytes | Experience |
| $0416 | 1 byte | Weapon ID |
| $0417 | 1 byte | Armor ID |
| $0418 | 1 byte | Shield ID |
| $0419 | 1 byte | Helmet ID |
| $041A | 1 byte | Status flags |
| $041B-$041F | 5 bytes | Reserved |

### Prince of Cannock ($0440-$047F)
| Address | Size | Description |
|---------|------|-------------|
| $0440-$0447 | 8 bytes | Name |
| $0448-$0449 | 2 bytes | Current HP |
| $044A-$044B | 2 bytes | Max HP |
| $044C | 1 byte | Current MP |
| $044D | 1 byte | Max MP |
| $044E | 1 byte | Strength |
| $044F | 1 byte | Agility |
| $0450 | 1 byte | Attack Power |
| $0451 | 1 byte | Defense Power |
| $0452 | 1 byte | Level |
| $0453-$0455 | 3 bytes | Experience |
| $0456 | 1 byte | Weapon ID |
| $0457 | 1 byte | Armor ID |
| $0458 | 1 byte | Shield ID |
| $0459 | 1 byte | Helmet ID |
| $045A | 1 byte | Status flags |
| $045B | 1 byte | Spells known |
| $045C-$045F | 4 bytes | Reserved |

### Princess of Moonbrooke ($0480-$04BF)
| Address | Size | Description |
|---------|------|-------------|
| $0480-$0487 | 8 bytes | Name |
| $0488-$0489 | 2 bytes | Current HP |
| $048A-$048B | 2 bytes | Max HP |
| $048C | 1 byte | Current MP |
| $048D | 1 byte | Max MP |
| $048E | 1 byte | Strength |
| $048F | 1 byte | Agility |
| $0490 | 1 byte | Attack Power |
| $0491 | 1 byte | Defense Power |
| $0492 | 1 byte | Level |
| $0493-$0495 | 3 bytes | Experience |
| $0496 | 1 byte | Weapon ID |
| $0497 | 1 byte | Armor ID |
| $0498 | 1 byte | Shield ID (always 0) |
| $0499 | 1 byte | Helmet ID |
| $049A | 1 byte | Status flags |
| $049B-$049C | 2 bytes | Spells known |
| $049D-$049F | 3 bytes | Reserved |

## Gold and Party Info ($04C0-$04FF)
| Address | Size | Description |
|---------|------|-------------|
| $04C0-$04C2 | 3 bytes | Party gold |
| $04C3 | 1 byte | Party members recruited |
| $04C4 | 1 byte | Ship obtained flag |
| $04C5-$04C6 | 2 bytes | Ship X position |
| $04C7-$04C8 | 2 bytes | Ship Y position |

## Inventory ($0600-$067F)

### Common Items ($0600-$060F)
| Address | Size | Description |
|---------|------|-------------|
| $0600 | 1 byte | Herb count |
| $0601 | 1 byte | Antidote count |
| $0602 | 1 byte | Wings count |
| $0603 | 1 byte | Fairy Water count |
| $0604 | 1 byte | Medical Herb count |
| $0605 | 1 byte | Key count |
| $0606-$060F | 10 bytes | Reserved |

### Key Items ($0610-$061F)
| Address | Size | Description |
|---------|------|-------------|
| $0610 | 1 byte | Has Golden Key |
| $0611 | 1 byte | Has Silver Key |
| $0612 | 1 byte | Has Jail Key |
| $0613 | 1 byte | Has Moon Fragment |
| $0614 | 1 byte | Has Eye of Malroth |
| $0615 | 1 byte | Has Sunstone |
| $0616 | 1 byte | Has Staff of Thunder |
| $0617 | 1 byte | Has Rain Staff |
| $0618 | 1 byte | Has Rubiss Charm |
| $0619 | 1 byte | Has Water Crest |
| $061A | 1 byte | Has Mirror of Ra |
| $061B | 1 byte | Has Princess rescued |

### Character Inventories ($0620-$067F)
| Address | Size | Description |
|---------|------|-------------|
| $0620-$0627 | 8 bytes | Prince of Midenhall items |
| $0628-$062F | 8 bytes | Prince of Cannock items |
| $0630-$0637 | 8 bytes | Princess of Moonbrooke items |

## Progress Flags ($0680-$06FF)

| Address | Size | Description |
|---------|------|-------------|
| $0680 | 1 byte | Prince of Cannock recruited |
| $0681 | 1 byte | Princess rescued from curse |
| $0682 | 1 byte | Ship obtained |
| $0683 | 1 byte | Dragon Horn obtained |
| $0684-$068F | 12 bytes | Boss defeat flags |
| $0690-$06FF | 112 bytes | Treasure chest flags |

## Map Buffer ($0700-$07FF)

| Address | Size | Description |
|---------|------|-------------|
| $0700-$073F | 64 bytes | Visible map buffer |
| $0740-$077F | 64 bytes | NPC data buffer |
| $0780-$07BF | 64 bytes | Tile attribute buffer |
| $07C0-$07FF | 64 bytes | Decompression buffer |

## Status Flag Bits

Character status at $041A, $045A, $049A:
```
Bit 0: Poisoned
Bit 1: Cursed
Bit 2: Dead
Bit 3: In wagon (N/A)
Bit 4: Asleep (battle only)
Bit 5: Stopspell (battle only)
Bit 6-7: Reserved
```

## Party Member Flags

$04C3 bits:
```
Bit 0: Prince of Midenhall (always 1)
Bit 1: Prince of Cannock joined
Bit 2: Princess of Moonbrooke joined
Bit 3-7: Reserved
```

## Password Data

The password encodes:
- Party member levels and experience
- Equipment for all characters
- Gold
- Key items obtained
- Progress flags
- Character names

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [Data Structures](data-structures.md) - Table formats
- [Text System](text-system.md) - Text encoding
