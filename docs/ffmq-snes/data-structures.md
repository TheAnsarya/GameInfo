# Final Fantasy Mystic Quest (SNES) - Data Structures

Detailed documentation of data structures used in Final Fantasy Mystic Quest.

## Character Data Structure

### Player Character (256 bytes)

Used for Benjamin and partner characters at $7E:2000 and $7E:2100.

```
struct Character {
    uint16  hp_current;     // $00-$01: Current HP
    uint16  hp_max;         // $02-$03: Maximum HP
    uint8   attack;         // $04: Attack power
    uint8   defense;        // $05: Defense power
    uint8   speed;          // $06: Speed stat
    uint8   magic;          // $07: Magic power
    uint8   accuracy;       // $08: Hit accuracy %
    uint8   evade;          // $09: Evasion %
    uint8   level;          // $0A: Current level
    uint8   reserved;       // $0B: Reserved
    uint32  exp;            // $0C-$0F: Experience points
    uint8   status;         // $10: Status effects
    uint8   reserved2[7];   // $11-$17: Reserved
    uint8   white_magic[8]; // $18-$1F: White magic learned
    uint8   black_magic[8]; // $20-$27: Black magic learned
    uint8   wizard_magic[8];// $28-$2F: Wizard magic learned
    uint8   weapon;         // $30: Equipped weapon ID
    uint8   armor;          // $31: Equipped armor ID
    uint8   shield;         // $32: Equipped shield ID
    uint8   helmet;         // $33: Equipped helmet ID
    uint8   accessory;      // $34: Equipped accessory
    uint8   reserved3[203]; // $35-$FF: Reserved for expansion
}
```

### Status Effect Bitmask

```
Bit 0: Dead/KO
Bit 1: Poisoned
Bit 2: Paralyzed
Bit 3: Blinded
Bit 4: Confused
Bit 5: Silenced
Bit 6: Petrified
Bit 7: Reserved
```

### Partner IDs

| ID | Partner | Chapter |
|----|---------|---------|
| $00 | None | N/A |
| $01 | Kaeli | Ch. 1, 4 |
| $02 | Tristam | Ch. 1, 3 |
| $03 | Phoebe | Ch. 2 |
| $04 | Reuben | Ch. 3, 4 |

## Monster Data Structure

### Monster Entry (16 bytes)

Located in ROM starting at $10:8000.

```
struct Monster {
    uint16  hp;             // $00-$01: Hit points
    uint8   attack;         // $02: Attack power
    uint8   defense;        // $03: Defense power
    uint8   speed;          // $04: Speed stat
    uint8   magic;          // $05: Magic power
    uint8   exp;            // $06: Experience reward
    uint8   gold;           // $07: Gold reward
    uint8   resistance;     // $08: Elemental resistance
    uint8   weakness;       // $09: Elemental weakness
    uint8   status_immune;  // $0A: Status immunity
    uint8   ai_pattern;     // $0B: AI behavior ID
    uint8   graphics_id;    // $0C: Sprite graphics index
    uint8   palette;        // $0D: Color palette
    uint8   formation_size; // $0E: Size in formation
    uint8   flags;          // $0F: Monster flags
}
```

### Elemental Bitmask (for resistance/weakness)

```
Bit 0: Fire
Bit 1: Water/Ice
Bit 2: Wind/Air
Bit 3: Earth
Bit 4: Holy/Cure
Bit 5: Dark/Doom
Bit 6: Physical
Bit 7: Magic
```

### Monster AI Patterns

| ID | Behavior |
|----|----------|
| $00 | Basic attack only |
| $01 | Attack + weak spell |
| $02 | Offensive magic focus |
| $03 | Healing support |
| $04 | Status effects focus |
| $05 | Defensive + counter |
| $06 | Berserker (strong attacks) |
| $07 | Balanced mixed |
| $08+ | Boss-specific AI |

## Item Data Structures

### Weapon Entry (8 bytes)

```
struct Weapon {
    uint8   attack;         // $00: Attack bonus
    uint8   accuracy;       // $01: Accuracy bonus
    uint8   crit_rate;      // $02: Critical hit rate
    uint8   element;        // $03: Elemental attribute
    uint8   status_inflict; // $04: Status to inflict
    uint8   target_type;    // $05: Single/Multi/All
    uint8   special_id;     // $06: Special effect ID
    uint8   flags;          // $07: Weapon flags
}
```

### Weapon Target Types

```
$00 = Single enemy
$01 = All enemies (sweep)
$02 = All enemies (pierce)
$03 = Self only (throw item)
```

### Weapon Flags

```
Bit 0: Two-handed
Bit 1: Can throw
Bit 2: Damages undead extra
Bit 3: Drains HP
Bit 4: Ignores defense
Bit 5: Reserved
Bit 6: Quest item
Bit 7: Cannot sell
```

### Armor Entry (8 bytes)

```
struct Armor {
    uint8   defense;        // $00: Defense bonus
    uint8   magic_def;      // $01: Magic defense bonus
    uint8   evade;          // $02: Evasion bonus
    uint8   resistance;     // $03: Element resistance
    uint8   status_immune;  // $04: Status immunity
    uint8   stat_bonus;     // $05: Stat modifier
    uint8   stat_type;      // $06: Which stat
    uint8   flags;          // $07: Armor flags
}
```

### Accessory Entry (6 bytes)

```
struct Accessory {
    uint8   effect_type;    // $00: Effect category
    uint8   effect_value;   // $01: Effect magnitude
    uint8   secondary_type; // $02: Secondary effect
    uint8   secondary_val;  // $03: Secondary magnitude
    uint8   restriction;    // $04: Who can equip
    uint8   flags;          // $05: Accessory flags
}
```

## Spell Data Structures

### Spell Entry (16 bytes)

```
struct Spell {
    uint8   mp_cost;        // $00: MP cost
    uint8   power;          // $01: Base power
    uint8   accuracy;       // $02: Hit rate
    uint8   element;        // $03: Element type
    uint8   target_type;    // $04: Target mode
    uint8   effect_type;    // $05: Effect category
    uint8   status_effect;  // $06: Status to apply
    uint8   animation;      // $07: Animation ID
    uint8   school;         // $08: White/Black/Wizard
    uint8   level_req;      // $09: Required spell level
    uint8   reserved[6];    // $0A-$0F: Reserved
}
```

### Spell Schools

| ID | School | Description |
|----|--------|-------------|
| $00 | White | Healing, buffs, holy damage |
| $01 | Black | Offensive elemental magic |
| $02 | Wizard | Mixed, special effects |

### Target Types

```
$00 = Self
$01 = Single ally
$02 = All allies
$03 = Single enemy
$04 = All enemies
$05 = All combatants
```

### Effect Types

```
$00 = HP Damage
$01 = HP Healing
$02 = MP Damage
$03 = MP Healing
$04 = Status Inflict
$05 = Status Cure
$06 = Stat Buff
$07 = Stat Debuff
$08 = Instant Death
$09 = Revive
$0A = Escape
$0B = Reflect
$0C = Absorb
```

## Map Data Structures

### Map Header (32 bytes)

```
struct MapHeader {
    uint8   width;          // $00: Width in 16x16 tiles
    uint8   height;         // $01: Height in 16x16 tiles
    uint8   tileset;        // $02: Tileset ID
    uint8   palette;        // $03: Palette ID
    uint8   music;          // $04: Music track ID
    uint8   flags;          // $05: Map flags
    uint8   encounter_rate; // $06: Encounter rate
    uint8   encounter_table;// $07: Encounter table ID
    uint16  tile_data_ptr;  // $08-$09: Tile data pointer
    uint16  collision_ptr;  // $0A-$0B: Collision pointer
    uint16  event_ptr;      // $0C-$0D: Event pointer
    uint16  npc_ptr;        // $0E-$0F: NPC data pointer
    uint16  exit_ptr;       // $10-$11: Exit list pointer
    uint8   bg_layer;       // $12: Background layer config
    uint8   layer_priority; // $13: Layer priorities
    uint16  layer2_ptr;     // $14-$15: BG2 data pointer
    uint8   scroll_type;    // $16: Scroll behavior
    uint8   reserved[9];    // $17-$1F: Reserved
}
```

### Map Flags

```
Bit 0: Allow jumping
Bit 1: Allow tools (axe, etc.)
Bit 2: Encounters enabled
Bit 3: Save point available
Bit 4: Shows on world map
Bit 5: Indoor area
Bit 6: Dungeon lighting
Bit 7: Boss area
```

### NPC Entry (12 bytes)

```
struct NPC {
    uint8   x;              // $00: X position
    uint8   y;              // $01: Y position
    uint8   sprite_id;      // $02: Sprite graphics
    uint8   direction;      // $03: Initial facing
    uint8   movement;       // $04: Movement pattern
    uint8   flags;          // $05: NPC flags
    uint16  dialog_id;      // $06-$07: Dialog pointer
    uint16  event_id;       // $08-$09: Event trigger
    uint8   reserved[2];    // $0A-$0B: Reserved
}
```

### Event Entry (8 bytes)

```
struct MapEvent {
    uint8   x;              // $00: Trigger X
    uint8   y;              // $01: Trigger Y
    uint8   width;          // $02: Trigger width
    uint8   height;         // $03: Trigger height
    uint8   type;           // $04: Event type
    uint8   condition;      // $05: Trigger condition
    uint16  script_ptr;     // $06-$07: Script pointer
}
```

## Save Data Structure

### Save Slot (2048 bytes)

```
struct SaveSlot {
    uint8   signature[4];   // $000: "FFMQ"
    uint16  checksum;       // $004: Data checksum
    uint8   chapter;        // $006: Current chapter
    uint8   slot_id;        // $007: Slot number
    Character benjamin;     // $008: Benjamin data (256 bytes)
    Character partner;      // $108: Partner data (256 bytes)
    uint8   inventory[256]; // $208: Inventory data
    uint8   events[256];    // $308: Event flags
    uint8   map_state[256]; // $408: Map state
    uint8   reserved[512];  // $508: Reserved
    uint8   padding[248];   // $708: Padding
}
```

## External References

- [Full Disassembly](https://github.com/TheAnsarya/ffmq-info)
- [Battle System Docs](https://github.com/TheAnsarya/ffmq-info/blob/master/docs/BATTLE_SYSTEM.md)
