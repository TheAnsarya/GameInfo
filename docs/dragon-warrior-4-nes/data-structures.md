# Dragon Warrior IV (NES) - Data Structures

Detailed documentation of data structures used in Dragon Warrior IV.

## Monster Data Structure

### Monster Entry (27 bytes)

Located in ROM banks $18-$1B, starting at $60000.

```
struct Monster {
    uint16  hp;             // $00-$01: Base HP
    uint8   mp;             // $02: MP (for spell-casting monsters)
    uint8   attack;         // $03: Attack power
    uint8   defense;        // $04: Defense power
    uint8   agility;        // $05: Agility (turn order)
    uint16  exp;            // $06-$07: Experience reward
    uint16  gold;           // $08-$09: Gold reward
    uint8   spell_resist;   // $0A: Spell resistance (bitmask)
    uint8   breath_resist;  // $0B: Breath resistance (bitmask)
    uint8   status_immune;  // $0C: Status immunity (bitmask)
    uint16  ai_pattern;     // $0D-$0E: AI behavior pointer
    uint8   graphics_id;    // $0F: Sprite graphics index
    uint8   palette;        // $10: Color palette index
    uint8   actions[10];    // $11-$1A: Action pattern table
}
```

### Resistance Bitmask

```
Bit 0: Fire resistance
Bit 1: Ice resistance
Bit 2: Electric resistance
Bit 3: Wind resistance
Bit 4: Heal/Holy weakness
Bit 5: Instant death immunity
Bit 6: Status effect immunity
Bit 7: Critical hit immunity
```

### AI Pattern Actions

```
$00 = Attack
$01 = Strong Attack
$02-$0F = Spell ID
$10-$1F = Breath Attack ID
$20-$2F = Special ability
$FF = Do nothing
```

## Character Data Structure

### Party Member (64 bytes)

Located in PRG-RAM at $6000 + (character_index × $40).

```
struct PartyMember {
    uint16  current_hp;     // $00-$01: Current HP
    uint16  current_mp;     // $02-$03: Current MP
    uint16  max_hp;         // $04-$05: Maximum HP
    uint16  max_mp;         // $06-$07: Maximum MP
    uint8   level;          // $08: Current level
    uint8   char_id;        // $09: Character identifier
    uint8   strength;       // $0A: Strength stat
    uint8   agility;        // $0B: Agility stat
    uint8   vitality;       // $0C: Vitality stat
    uint8   intelligence;   // $0D: Intelligence stat
    uint8   luck;           // $0E: Luck stat
    uint8   attack;         // $0F: Calculated attack power
    uint8   defense;        // $10: Calculated defense
    uint8   status;         // $11: Status effects bitmask
    uint8   exp[3];         // $12-$14: Experience points (24-bit)
    uint8   weapon;         // $15: Equipped weapon ID
    uint8   armor;          // $16: Equipped armor ID
    uint8   shield;         // $17: Equipped shield ID
    uint8   helmet;         // $18: Equipped helmet ID
    uint8   accessories[7]; // $19-$1F: Accessory slots
    uint8   spells[16];     // $20-$2F: Learned spells (bitmask)
    uint8   reserved[16];   // $30-$3F: Reserved space
}
```

### Character IDs

| ID | Character | Chapter |
|----|-----------|---------|
| $00 | Hero | Ch. 5 |
| $01 | Ragnar | Ch. 1, 5 |
| $02 | Alena | Ch. 2, 5 |
| $03 | Kiryl | Ch. 2, 5 |
| $04 | Borya | Ch. 2, 5 |
| $05 | Torneko | Ch. 3, 5 |
| $06 | Meena | Ch. 4, 5 |
| $07 | Maya | Ch. 4, 5 |
| $08-$0F | NPCs/Guests | Various |

### Status Effect Bitmask

```
Bit 0: Dead
Bit 1: Poisoned
Bit 2: Paralyzed
Bit 3: Asleep
Bit 4: Confused
Bit 5: Silenced
Bit 6: Cursed
Bit 7: Defense Up
```

## Item Data Structure

### Item Entry (8 bytes)

Located in ROM at $70000.

```
struct Item {
    uint8   type_flags;     // $00: Item type and flags
    uint8   effect_id;      // $01: Effect when used
    uint8   stat_mod;       // $02: Stat modifier value
    uint8   equip_mask;     // $03: Who can equip (bitmask)
    uint16  buy_price;      // $04-$05: Shop buy price
    uint16  sell_price;     // $06-$07: Shop sell price
}
```

### Item Type Flags

```
Bits 0-2: Item category
    0 = Consumable
    1 = Weapon
    2 = Armor
    3 = Shield
    4 = Helmet
    5 = Accessory
    6 = Key Item
    7 = Special

Bit 3: Cursed item
Bit 4: Can use in battle
Bit 5: Can use in field
Bit 6: Breakable
Bit 7: Unique (one per party)
```

### Equip Mask

```
Bit 0: Hero can equip
Bit 1: Ragnar can equip
Bit 2: Alena can equip
Bit 3: Kiryl can equip
Bit 4: Borya can equip
Bit 5: Torneko can equip
Bit 6: Meena can equip
Bit 7: Maya can equip
```

## Spell Data Structure

### Spell Entry (6 bytes)

Located in ROM at spell table area.

```
struct Spell {
    uint8   mp_cost;        // $00: MP cost to cast
    uint8   target_type;    // $01: Targeting mode
    uint8   effect_type;    // $02: Effect category
    uint8   power;          // $03: Base power/healing
    uint8   accuracy;       // $04: Base accuracy %
    uint8   element;        // $05: Elemental type
}
```

### Target Types

```
$00 = Self
$01 = One ally
$02 = All allies
$03 = One enemy
$04 = All enemies
$05 = One enemy group
$06 = Random enemy
```

### Effect Types

```
$00 = Damage
$01 = Healing
$02 = Buff
$03 = Debuff
$04 = Status inflict
$05 = Status cure
$06 = Instant death
$07 = Revive
$08 = Escape
$09 = Utility (Zoom, etc.)
```

## Map Data Structure

### Map Header (16 bytes)

```
struct MapHeader {
    uint8   width;          // $00: Map width in tiles
    uint8   height;         // $01: Map height in tiles
    uint8   tileset_id;     // $02: Tileset to use
    uint8   music_id;       // $03: Background music
    uint8   encounter_rate; // $04: Random encounter rate
    uint8   encounter_table;// $05: Which encounter table
    uint8   flags;          // $06: Map flags
    uint8   palette;        // $07: Color palette
    uint16  tile_data;      // $08-$09: Pointer to tile data
    uint16  event_data;     // $0A-$0B: Pointer to events
    uint16  npc_data;       // $0C-$0D: Pointer to NPCs
    uint16  warp_data;      // $0E-$0F: Pointer to warps
}
```

### Map Flags

```
Bit 0: Indoor map
Bit 1: Can use Zoom
Bit 2: Can use Outside
Bit 3: Encounters enabled
Bit 4: Dark (requires torch)
Bit 5: Wagon accessible
Bit 6: Day/Night cycle active
Bit 7: Reserved
```

### NPC Entry (8 bytes)

```
struct NPC {
    uint8   x;              // $00: X position
    uint8   y;              // $01: Y position
    uint8   sprite_id;      // $02: Sprite graphics
    uint8   direction;      // $03: Facing direction
    uint8   movement;       // $04: Movement pattern
    uint8   flags;          // $05: Behavior flags
    uint16  dialog_ptr;     // $06-$07: Dialog text pointer
}
```

## Save Data Structure

### Save Header (16 bytes)

Located at start of each save slot in PRG-RAM.

```
struct SaveHeader {
    uint8   magic[4];       // $00-$03: "DW4\0" identifier
    uint8   chapter;        // $04: Current chapter
    uint8   slot;           // $05: Save slot number
    uint8   party_size;     // $06: Active party members
    uint8   wagon_size;     // $07: Characters in wagon
    uint16  checksum;       // $08-$09: Data checksum
    uint8   hours;          // $0A: Play time hours
    uint8   minutes;        // $0B: Play time minutes
    uint8   seconds;        // $0C: Play time seconds
    uint8   reserved[3];    // $0D-$0F: Reserved
}
```

## External References

- [Full Disassembly](https://github.com/TheAnsarya/dragon-warrior-4-info)
- [Monster Byte Structure](https://github.com/TheAnsarya/dragon-warrior-4-info/blob/main/docs/monster_byte_structure.md)
