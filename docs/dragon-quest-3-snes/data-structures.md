# Dragon Quest III (SNES) - Data Structures

Detailed documentation of data structures used in Dragon Quest III (SNES).

## Character Data Structure

### Character Entry (256 bytes)

Located in RAM at $E100 + (character_index × $100).

```
struct Character {
    uint8   level;          // $00: Current level (1-99)
    uint8   exp[3];         // $01-$03: Experience (24-bit)
    uint16  hp_current;     // $04-$05: Current HP
    uint16  hp_max;         // $06-$07: Maximum HP
    uint16  mp_current;     // $08-$09: Current MP
    uint16  mp_max;         // $0A-$0B: Maximum MP
    uint8   strength;       // $0C: Strength stat
    uint8   agility;        // $0D: Agility stat
    uint8   wisdom;         // $0E: Wisdom/Intelligence
    uint8   vitality;       // $0F: Vitality stat
    uint8   equipment[16];  // $10-$1F: Equipment slots
    uint8   spells[32];     // $20-$3F: Spells learned
    uint8   status[32];     // $40-$5F: Status effects
    uint8   name[32];       // $60-$7F: Character name (Shift-JIS)
    uint8   class_id;       // $80: Character class
    uint8   gender;         // $81: Gender (0=Male, 1=Female)
    uint8   personality;    // $82: Personality type
    uint8   luck;           // $83: Luck stat
    uint8   attack;         // $84: Calculated attack
    uint8   defense;        // $85: Calculated defense
    uint8   class_data[10]; // $86-$8F: Class-specific
    uint8   reserved[112];  // $90-$FF: Reserved
}
```

### Character Classes

| ID | Class | Base Stats Focus |
|----|-------|------------------|
| $00 | Hero | Balanced |
| $01 | Warrior | Strength, HP |
| $02 | Fighter | Agility, Attack |
| $03 | Mage | Wisdom, MP |
| $04 | Priest | Wisdom, HP |
| $05 | Merchant | Luck, Gold bonus |
| $06 | Jester | Random stats |
| $07 | Sage | Wisdom, MP |
| $08 | Thief | Agility, Luck |
| $09 | Monster | Varies |

### Personality Types

DQ3 SNES has 46 personality types affecting stat growth:

| ID | Personality | Primary Bonus |
|----|-------------|---------------|
| $00 | Ordinary | None |
| $01 | Hotblooded | Attack |
| $02 | Bully | Strength |
| $03 | Tomboy | Agility |
| $04 | Lazy | MP Recovery |
| ... | ... | ... |

## Monster Data Structure

### Monster Entry (32 bytes)

Located in ROM banks $CC-$CD.

```
struct Monster {
    uint16  hp;             // $00-$01: Hit points
    uint8   mp;             // $02: Magic points
    uint8   attack;         // $03: Attack power
    uint8   defense;        // $04: Defense power
    uint8   agility;        // $05: Agility
    uint8   wisdom;         // $06: Wisdom/Magic def
    uint16  exp;            // $07-$08: Experience reward
    uint16  gold;           // $09-$0A: Gold reward
    uint8   drop_item;      // $0B: Item drop ID
    uint8   drop_rate;      // $0C: Drop rate (x/256)
    uint8   resistances;    // $0D: Element resistance
    uint8   immunities;     // $0E: Status immunity
    uint8   ai_pattern;     // $0F: AI behavior ID
    uint8   actions[8];     // $10-$17: Action list
    uint8   graphics_id;    // $18: Sprite graphics
    uint8   palette;        // $19: Color palette
    uint8   size;           // $1A: Sprite size
    uint8   flags;          // $1B: Monster flags
    uint8   reserved[4];    // $1C-$1F: Reserved
}
```

### Element Resistance Bitmask

```
Bit 0: Fire resistance
Bit 1: Ice resistance
Bit 2: Lightning resistance
Bit 3: Wind resistance
Bit 4: Instant death immunity
Bit 5: Magic immunity
Bit 6: Physical resistance
Bit 7: Boss flag
```

### Monster AI Patterns

| ID | Behavior |
|----|----------|
| $00 | Attack only |
| $01 | Attack + flee |
| $02 | Cast spells randomly |
| $03 | Heal when low HP |
| $04 | Use status attacks |
| $05 | Call for help |
| $06 | Defensive |
| $07 | Aggressive magic |
| $08+ | Boss-specific |

## Item Data Structures

### Item Entry (16 bytes)

```
struct Item {
    uint8   item_type;      // $00: Item category
    uint8   usable_flags;   // $01: Where usable
    uint8   effect_id;      // $02: Effect when used
    uint8   effect_power;   // $03: Effect strength
    uint16  buy_price;      // $04-$05: Shop price
    uint16  sell_price;     // $06-$07: Sell price
    uint8   who_equip;      // $08: Who can equip
    uint8   stat_type;      // $09: Which stat modified
    uint8   stat_value;     // $0A: Stat modifier
    uint8   element;        // $0B: Elemental property
    uint8   flags;          // $0C: Special flags
    uint8   reserved[3];    // $0D-$0F: Reserved
}
```

### Item Types

```
$00 = Consumable (healing)
$01 = Consumable (buff)
$02 = Consumable (damage)
$03 = Weapon
$04 = Armor (body)
$05 = Shield
$06 = Helmet
$07 = Accessory
$08 = Key item
$09 = Tool item
```

### Usable Flags

```
Bit 0: Usable in field
Bit 1: Usable in battle
Bit 2: Targets ally
Bit 3: Targets enemy
Bit 4: Targets all
Bit 5: Consumable
Bit 6: Can throw
Bit 7: Cannot discard
```

### Equipment Entry (16 bytes)

```
struct Equipment {
    uint8   equip_type;     // $00: Weapon/Armor/etc
    uint8   equip_slot;     // $01: Which slot
    uint8   attack_bonus;   // $02: Attack modifier
    uint8   defense_bonus;  // $03: Defense modifier
    uint8   agility_mod;    // $04: Agility modifier
    uint8   wisdom_mod;     // $05: Wisdom modifier
    uint16  buy_price;      // $06-$07: Buy price
    uint8   class_mask;     // $08: Which classes
    uint8   element;        // $09: Element imbued
    uint8   status_resist;  // $0A: Status resistance
    uint8   special;        // $0B: Special effect ID
    uint8   cursed;         // $0C: Cursed flag
    uint8   reserved[3];    // $0D-$0F: Reserved
}
```

### Class Equip Mask

```
Bit 0: Hero
Bit 1: Warrior
Bit 2: Fighter
Bit 3: Mage
Bit 4: Priest
Bit 5: Merchant
Bit 6: Jester/Sage
Bit 7: Thief
```

## Spell Data Structure

### Spell Entry (12 bytes)

```
struct Spell {
    uint8   mp_cost;        // $00: MP cost
    uint8   target_type;    // $01: Targeting mode
    uint8   effect_type;    // $02: Effect category
    uint8   power;          // $03: Base power
    uint8   accuracy;       // $04: Base accuracy
    uint8   element;        // $05: Element type
    uint8   level_req;      // $06: Required level to learn
    uint8   class_mask;     // $07: Which classes learn
    uint8   priority;       // $08: Turn priority
    uint8   flags;          // $09: Special flags
    uint8   reserved[2];    // $0A-$0B: Reserved
}
```

### Target Types

```
$00 = Self only
$01 = Single ally
$02 = All allies
$03 = Single enemy
$04 = Enemy group
$05 = All enemies
$06 = Random enemy
$07 = All combatants
```

### Effect Types

```
$00 = HP Damage
$01 = HP Healing
$02 = MP Damage
$03 = Status Inflict
$04 = Status Cure
$05 = Stat Buff
$06 = Stat Debuff
$07 = Instant Death
$08 = Revive
$09 = Escape
$0A = Field effect (Zoom/Return)
$0B = Exploration (Radiant/X-Ray)
```

## Map Data Structures

### Map Header (24 bytes)

```
struct MapHeader {
    uint8   width;          // $00: Width in tiles
    uint8   height;         // $01: Height in tiles
    uint8   tileset;        // $02: Tileset ID
    uint8   palette;        // $03: Palette ID
    uint8   music;          // $04: Background music
    uint8   ambient;        // $05: Ambient sound
    uint8   encounter_rate; // $06: Encounter rate
    uint8   encounter_tbl;  // $07: Encounter table ID
    uint8   flags;          // $08: Map flags
    uint8   time_of_day;    // $09: Time restrictions
    uint16  tile_ptr;       // $0A-$0B: Tile data pointer
    uint16  collision_ptr;  // $0C-$0D: Collision pointer
    uint16  event_ptr;      // $0E-$0F: Event pointer
    uint16  npc_ptr;        // $10-$11: NPC list pointer
    uint16  exit_ptr;       // $12-$13: Exit list pointer
    uint16  layer2_ptr;     // $14-$15: BG2 pointer
    uint8   reserved[2];    // $16-$17: Reserved
}
```

### Map Flags

```
Bit 0: Outdoor map
Bit 1: Day/Night cycle
Bit 2: Weather effects
Bit 3: Zoom allowed
Bit 4: Return allowed
Bit 5: Encounters enabled
Bit 6: Darkness (torch needed)
Bit 7: No saving
```

### NPC Entry (16 bytes)

```
struct NPC {
    uint8   x;              // $00: X position
    uint8   y;              // $01: Y position
    uint8   sprite_id;      // $02: Sprite graphics
    uint8   direction;      // $03: Initial facing
    uint8   movement;       // $04: Movement pattern
    uint8   speed;          // $05: Movement speed
    uint8   flags;          // $06: Behavior flags
    uint8   schedule;       // $07: Time-based schedule
    uint16  dialog_day;     // $08-$09: Day dialog ID
    uint16  dialog_night;   // $0A-$0B: Night dialog ID
    uint16  event_id;       // $0C-$0D: Event trigger
    uint8   reserved[2];    // $0E-$0F: Reserved
}
```

### Movement Patterns

```
$00 = Stationary
$01 = Random walk
$02 = Pace horizontal
$03 = Pace vertical
$04 = Follow path
$05 = Follow player
$06 = Run away
$07 = Circle
```

## Save Data Structure

### Save Slot (2 KB)

```
struct SaveSlot {
    uint8   signature[4];   // $000: "DQ3\0"
    uint16  checksum;       // $004: Data checksum
    uint16  play_hours;     // $006: Play time hours
    uint8   play_minutes;   // $008: Play time minutes
    uint8   chapter;        // $009: Story progress
    Character party[4];     // $00A: Party data (1024 bytes)
    uint8   inventory[512]; // $40A: Inventory
    uint8   world[256];     // $60A: World state
    uint8   reserved[246];  // $70A: Reserved
}
```

## External References

- [DQ3R-Info Repository](https://github.com/TheAnsarya/dq3r-info)
- [Technical Specs](https://github.com/TheAnsarya/dq3r-info/blob/main/docs/TECHNICAL_SPECS.md)
