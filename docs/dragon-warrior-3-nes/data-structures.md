# Dragon Warrior III (NES) - Data Structures

## Monster Data Structure

Each monster entry is 16 bytes:

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Strength |
| $01 | 1 | Agility |
| $02-$03 | 2 | HP |
| $04 | 1 | Defense |
| $05 | 1 | Attack pattern |
| $06 | 1 | Spell pattern |
| $07 | 1 | Magic resistance |
| $08 | 1 | Sleep resistance |
| $09 | 1 | Stopspell resistance |
| $0A-$0B | 2 | Experience |
| $0C-$0D | 2 | Gold |
| $0E | 1 | Drop item ID |
| $0F | 1 | Drop rate (1/X) |

### Monster List (Selected)

| ID | Name | HP | STR | AGI | DEF | EXP | Gold |
|----|------|-----|-----|-----|-----|-----|------|
| $00 | Slime | 8 | 9 | 4 | 5 | 4 | 3 |
| $01 | Crow | 10 | 11 | 8 | 6 | 6 | 4 |
| $02 | Froggore | 15 | 14 | 10 | 8 | 8 | 6 |
| $10 | Babble | 35 | 32 | 25 | 20 | 40 | 28 |
| $20 | Goopi | 65 | 55 | 42 | 35 | 100 | 55 |
| $30 | Troll | 120 | 95 | 50 | 68 | 480 | 140 |
| $40 | Archmage | 150 | 80 | 85 | 55 | 750 | 210 |
| $50 | King Hydra | 350 | 180 | 110 | 150 | 4800 | 0 |
| $60 | Baramos | 1000 | 200 | 150 | 100 | 0 | 0 |
| $69 | Zoma | 1200 | 230 | 180 | 150 | 0 | 0 |

### Attack Patterns

| Value | Behavior |
|-------|----------|
| $00 | Attack only |
| $01 | Attack, can flee |
| $02 | Attack, call for help |
| $03 | Two attacks |
| $04 | Attack + special move |
| $05 | Boss pattern 1 |
| $06 | Boss pattern 2 |
| $07 | Final boss pattern |

### Spell Patterns

| Value | Spells Available |
|-------|-----------------|
| $00 | None |
| $01 | Heal/Healmore |
| $02 | Hurt/Hurtmore |
| $03 | Blaze/Blazemore |
| $04 | Sleep |
| $05 | Stopspell |
| $06 | Defeat |
| $07 | Firebane/Blazemost |
| $08 | Explodet |
| $09 | Fire breath |
| $0A | Ice breath |
| $0B | Sweet breath |
| $0C | Poison breath |
| $0D | Multiple spell sets |

## Class Data

### Base Stats per Class

| Class | STR | AGI | VIT | INT | LCK | HP | MP |
|-------|-----|-----|-----|-----|-----|-----|-----|
| Hero | 20 | 15 | 18 | 14 | 16 | 30 | 8 |
| Soldier | 22 | 10 | 20 | 6 | 12 | 35 | 0 |
| Pilgrim | 8 | 14 | 12 | 18 | 14 | 20 | 15 |
| Wizard | 6 | 16 | 8 | 22 | 10 | 16 | 20 |
| Fighter | 18 | 22 | 16 | 4 | 14 | 28 | 0 |
| Merchant | 14 | 12 | 16 | 10 | 18 | 26 | 5 |
| Goof-off | 8 | 10 | 10 | 6 | 30 | 18 | 4 |
| Sage | 12 | 16 | 14 | 20 | 14 | 22 | 25 |
| Thief | 12 | 24 | 12 | 8 | 20 | 24 | 0 |

### Stat Growth per Level (Average)

| Class | STR | AGI | VIT | INT | LCK |
|-------|-----|-----|-----|-----|-----|
| Hero | 3.2 | 2.5 | 3.0 | 2.2 | 2.0 |
| Soldier | 4.0 | 1.5 | 3.5 | 0.5 | 1.5 |
| Pilgrim | 1.5 | 2.5 | 2.0 | 3.5 | 2.0 |
| Wizard | 1.0 | 3.0 | 1.5 | 4.5 | 1.0 |
| Fighter | 3.5 | 4.0 | 2.5 | 0.5 | 2.0 |
| Merchant | 2.5 | 2.0 | 2.5 | 1.5 | 3.0 |
| Goof-off | 1.0 | 1.5 | 1.5 | 0.5 | 4.0 |
| Sage | 2.0 | 3.0 | 2.5 | 4.0 | 2.0 |
| Thief | 2.0 | 4.5 | 2.0 | 1.0 | 3.5 |

## Personality System

### Personality Structure (4 bytes)

| Offset | Description |
|--------|-------------|
| $00 | STR modifier (signed) |
| $01 | AGI modifier (signed) |
| $02 | VIT modifier (signed) |
| $03 | INT modifier (signed) |

### Personality List (Selected)

| ID | Name | STR | AGI | VIT | INT |
|----|------|-----|-----|-----|-----|
| $00 | Normal | 0 | 0 | 0 | 0 |
| $01 | Paragon | +10% | +10% | +10% | +10% |
| $02 | Tough | +20% | -5% | +15% | -10% |
| $03 | Quick | -5% | +25% | -5% | 0 |
| $04 | Smart | -10% | +5% | -5% | +20% |
| $05 | Lucky | 0 | 0 | 0 | 0 (LCK+30%) |
| $06 | Sexy | -5% | +15% | 0 | +10% |
| $07 | Timid | -10% | -5% | -10% | +5% |
| $08 | Lazy | -15% | -15% | -10% | -5% |
| $09 | Vain | +5% | +10% | -5% | +5% |
| $0A | Lone Wolf | +15% | -5% | +10% | -15% |
| ... | ... | ... | ... | ... | ... |

Total personalities: 50 (0x32)

## Weapon Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Attack bonus |
| $01 | 1 | Equip flags |
| $02 | 1 | Special effect |
| $03-$04 | 2 | Price |

### Equip Flags

| Bit | Class |
|-----|-------|
| 0 | Hero |
| 1 | Soldier |
| 2 | Pilgrim |
| 3 | Wizard |
| 4 | Fighter |
| 5 | Merchant |
| 6 | Goof-off/Sage |
| 7 | Thief |

### Weapon List (Selected)

| ID | Name | ATK | Price | Classes |
|----|------|-----|-------|---------|
| $00 | Cypress Stick | 2 | 5 | All |
| $01 | Club | 7 | 30 | Most |
| $02 | Copper Sword | 12 | 100 | H,S,T |
| $05 | Chain Sickle | 24 | 550 | H,S,M |
| $0A | Sword of Gaia | 33 | — | H,S |
| $0F | Dragon Killer | 77 | — | H,S |
| $13 | Thunder Sword | 82 | — | H,S |
| $17 | Sword of Kings | 120 | — | H only |

### Weapon Special Effects

| Value | Effect |
|-------|--------|
| $00 | None |
| $01 | Cast Heal when used |
| $02 | Cast Blaze when used |
| $03 | Cast Sleep when used |
| $04 | +50% vs Dragons |
| $05 | +50% vs Machines |
| $06 | Cursed (halves stats) |
| $07 | Vorpal (instant kill chance) |

## Armor Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Defense bonus |
| $01 | 1 | Equip flags |
| $02 | 1 | Special effect |
| $03-$04 | 2 | Price |

### Armor Special Effects

| Value | Effect |
|-------|--------|
| $00 | None |
| $01 | HP regen per step |
| $02 | Fire resistance |
| $03 | Ice resistance |
| $04 | All magic resistance |
| $05 | Floor damage immunity |
| $06 | Cursed |

## Shield Data

Similar structure to armor, 5 bytes each.

## Helmet Data

| ID | Name | DEF | Price | Special |
|----|------|-----|-------|---------|
| $00 | Leather Hat | 2 | 80 | — |
| $03 | Iron Helmet | 16 | 1100 | — |
| $06 | Mythril Helm | 32 | 18000 | — |
| $08 | Great Helm | 45 | — | Fire resist |

## Spell Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | MP cost |
| $01 | 1 | Target type |
| $02 | 1 | Effect type |
| $03 | 1 | Base power |

### Target Types

| Value | Target |
|-------|--------|
| $00 | Self |
| $01 | One ally |
| $02 | All allies |
| $03 | One enemy |
| $04 | One enemy group |
| $05 | All enemies |
| $06 | Field only |

### Spell List (Selected)

| ID | Name | MP | Target | Effect |
|----|------|-----|--------|--------|
| $00 | Heal | 3 | 1 ally | ~30 HP |
| $01 | Hurt | 2 | 1 group | ~10 damage |
| $02 | Sleep | 2 | 1 group | Sleep |
| $03 | Radiant | 2 | Party | Light |
| $04 | Antidote | 2 | 1 ally | Cure poison |
| $08 | Healmore | 5 | 1 ally | ~85 HP |
| $0C | Hurtmore | 5 | 1 group | ~50 damage |
| $10 | Bikill | 6 | 1 ally | Double attack |
| $14 | Healall | 7 | 1 ally | Full HP |
| $18 | Explodet | 15 | All | ~100 damage |
| $1C | Revive | 20 | 1 ally | Resurrect |

## Experience Table

| Level | Total EXP | To Next |
|-------|-----------|---------|
| 1 | 0 | 11 |
| 2 | 11 | 24 |
| 5 | 115 | 95 |
| 10 | 565 | 350 |
| 15 | 2415 | 1050 |
| 20 | 7540 | 2800 |
| 25 | 19640 | 6500 |
| 30 | 42690 | 13000 |
| 40 | 135000 | 35000 |
| 50 | 310000 | 80000 |
| 60 | 630000 | 150000 |
| 70 | 1180000 | 250000 |
| 80 | 2030000 | 400000 |
| 90 | 3430000 | 600000 |
| 99 | 5430000 | — |

## Key Item Flags

| Flag | Item |
|------|------|
| $00 | Magic Ball |
| $01 | Thief's Key |
| $02 | Magic Key |
| $03 | Final Key |
| $04 | Dream Ruby |
| $05 | Wake-up Powder |
| $06 | Ra's Mirror |
| $07 | Echoing Flute |
| $08 | Sailor's Bone |
| $09 | Locket of Love |
| $0A | Ship |
| $0B | Black Pepper |
| $0C | King's Letter |
| $0D | Red Orb |
| $0E | Blue Orb |
| $0F | Green Orb |
| $10 | Yellow Orb |
| $11 | Purple Orb |
| $12 | Silver Orb |
| $13 | Sphere of Light |
| $14 | Baramos defeated |
| $15 | Zoma defeated |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Text System](text-system.md) - Text encoding
