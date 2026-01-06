# Dragon Warrior II (NES) - Data Structures

## Monster Data Structure

Each monster entry is 10 bytes:

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Strength |
| $01 | 1 byte | Agility |
| $02-$03 | 2 bytes | HP |
| $04 | 1 byte | Attack pattern |
| $05 | 1 byte | Defense |
| $06 | 1 byte | Spell pattern |
| $07 | 1 byte | Magic resistance |
| $08-$09 | 2 bytes | Experience |
| $0A-$0B | 2 bytes | Gold |

### Monster List (Partial)

| ID | Name | HP | STR | AGI | DEF | EXP | Gold |
|----|------|-----|-----|-----|-----|-----|------|
| $00 | Slime | 8 | 10 | 5 | 5 | 3 | 4 |
| $01 | Drakee | 12 | 15 | 8 | 8 | 5 | 6 |
| $02 | Army Ant | 16 | 18 | 12 | 10 | 6 | 8 |
| $03 | Big Cobra | 20 | 22 | 15 | 12 | 8 | 12 |
| $04 | Magician | 24 | 25 | 20 | 14 | 10 | 15 |
| $05 | Big Rat | 30 | 28 | 18 | 16 | 12 | 20 |
| ... | ... | ... | ... | ... | ... | ... | ... |
| $54 | Hargon | 200 | 150 | 100 | 80 | 0 | 0 |
| $55 | Malroth | 255 | 180 | 120 | 100 | 0 | 0 |

### Attack Patterns

| Value | Pattern |
|-------|---------|
| $00 | Attack only |
| $01 | Attack + Flee |
| $02 | Attack + Call help |
| $03 | Attack + Special |
| $04 | Two attacks per turn |

### Spell Patterns

| Value | Spells |
|-------|--------|
| $00 | None |
| $01 | Heal only |
| $02 | Hurt only |
| $03 | Heal + Hurt |
| $04 | Sleep |
| $05 | Stopspell |
| $06 | Fire breath |
| $07 | Explodet |
| $08 | Defeat |
| $09 | Multiple spells (boss) |

## Weapon Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Attack bonus |
| $01 | 1 byte | Equip flags (who can use) |
| $02-$03 | 2 bytes | Price |

### Weapon List

| ID | Name | Attack | Price | Users |
|----|------|--------|-------|-------|
| $00 | (None) | 0 | — | All |
| $01 | Copper Sword | 10 | 100 | P1, P2 |
| $02 | Chain Sickle | 15 | 390 | P1, P2 |
| $03 | Iron Spear | 20 | 770 | P1 |
| $04 | Steel Sword | 30 | 1500 | P1, P2 |
| $05 | Giant Hammer | 35 | 4000 | P1 |
| $06 | Wizard Wand | 8 | 2500 | P2, P3 |
| $07 | Falcon Sword | 5 | 25000 | P1 |
| $08 | Thunder Sword | 95 | — | P1, P2 |
| $09 | Dragon Killer | 50 | 8000 | P1 |
| $0A | Light Sword | 65 | 16000 | P1 |
| $0B | Sword of Destruction | 99 | — | P1 |
| $0C | Staff of Thunder | 0 | — | Quest |

Users: P1 = Midenhall, P2 = Cannock, P3 = Moonbrooke

## Armor Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Defense bonus |
| $01 | 1 byte | Equip flags |
| $02-$03 | 2 bytes | Price |

### Armor List

| ID | Name | Defense | Price | Users |
|----|------|---------|-------|-------|
| $00 | (None) | 0 | — | All |
| $01 | Clothes | 4 | 65 | All |
| $02 | Leather Armor | 8 | 350 | P1, P2 |
| $03 | Chain Mail | 15 | 480 | P1, P2 |
| $04 | Steel Armor | 25 | 1000 | P1 |
| $05 | Magic Armor | 35 | 4300 | P1, P2 |
| $06 | Cloak of Wind | 20 | 1250 | P3 |
| $07 | Water Flying Cloth | 35 | 2500 | P3 |
| $08 | Armor of Gaia | 55 | — | P1, P2 |
| $09 | Armor of Erdrick | 40 | — | P1 |

## Shield Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Defense bonus |
| $01 | 1 byte | Equip flags |
| $02-$03 | 2 bytes | Price |

### Shield List

| ID | Name | Defense | Price | Users |
|----|------|---------|-------|-------|
| $00 | (None) | 0 | — | All |
| $01 | Leather Shield | 4 | 90 | P1, P2 |
| $02 | Iron Shield | 10 | 800 | P1, P2 |
| $03 | Steel Shield | 20 | 2000 | P1 |
| $04 | Shield of Strength | 35 | — | P1, P2 |

Note: Princess cannot equip shields.

## Item Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Effect type |
| $01 | 1 byte | Effect power |
| $02-$03 | 2 bytes | Price |

### Item List

| ID | Name | Price | Effect |
|----|------|-------|--------|
| $00 | Herb | 15 | Heal ~35 HP |
| $01 | Antidote | 8 | Cure poison |
| $02 | Fairy Water | 40 | Repel weak enemies |
| $03 | Wings | 80 | Warp to last town |
| $04 | Medical Herb | 30 | Heal ~70 HP |
| $05 | Poison Needle | 10 | 1 damage + instant death chance |
| $06 | Dragon's Bane | 640 | Use in battle for damage |
| $07 | Love Water | 120 | Cure curse |

### Key Items

| ID | Name | Effect |
|----|------|--------|
| $10 | Golden Key | Opens gold doors |
| $11 | Silver Key | Opens silver doors |
| $12 | Jail Key | Opens jail doors |
| $13 | Moon Fragment | Part of sigil |
| $14 | Eye of Malroth | Opens way to Hargon |
| $15 | Sunstone | Part of Rubiss Charm |
| $16 | Staff of Thunder | Opens sea cave |
| $17 | Rain Staff | Part of Rubiss Charm |
| $18 | Rubiss Charm | Defeats Malroth illusion |
| $19 | Water Crest | Opens sea cave |
| $1A | Mirror of Ra | Breaks Princess curse |
| $1B | Prince's Token | Proof of lineage |

## Experience Tables

### Prince of Midenhall
| Level | EXP | HP | MP | STR | AGI |
|-------|-----|-----|-----|-----|-----|
| 1 | 0 | 30 | 0 | 8 | 5 |
| 5 | 350 | 50 | 0 | 25 | 15 |
| 10 | 2500 | 90 | 0 | 55 | 35 |
| 15 | 8000 | 130 | 0 | 90 | 60 |
| 20 | 20000 | 170 | 0 | 120 | 80 |
| 25 | 42000 | 200 | 0 | 145 | 95 |
| 30 | 75000 | 230 | 0 | 165 | 110 |
| 50 | 500000 | 255 | 0 | 200 | 150 |

### Prince of Cannock
| Level | EXP | HP | MP | STR | AGI |
|-------|-----|-----|-----|-----|-----|
| 1 | 0 | 22 | 6 | 6 | 5 |
| 5 | 250 | 40 | 15 | 18 | 14 |
| 10 | 2000 | 70 | 35 | 40 | 32 |
| 15 | 7000 | 100 | 55 | 65 | 50 |
| 20 | 18000 | 130 | 75 | 88 | 70 |
| 25 | 38000 | 155 | 95 | 108 | 88 |
| 30 | 68000 | 175 | 108 | 125 | 100 |

### Princess of Moonbrooke
| Level | EXP | HP | MP | STR | AGI |
|-------|-----|-----|-----|-----|-----|
| 1 | 0 | 18 | 10 | 4 | 7 |
| 5 | 200 | 30 | 30 | 12 | 20 |
| 10 | 1500 | 55 | 65 | 28 | 45 |
| 15 | 5500 | 80 | 100 | 45 | 70 |
| 20 | 15000 | 105 | 140 | 62 | 92 |
| 25 | 32000 | 125 | 175 | 78 | 112 |
| 30 | 58000 | 140 | 201 | 90 | 125 |

## Spell Learning

### Prince of Cannock Spells
| Level | Spell | MP Cost | Effect |
|-------|-------|---------|--------|
| 1 | Heal | 3 | Restore ~30 HP |
| 3 | Firebal | 4 | Fire damage |
| 6 | Surround | 4 | Lower accuracy |
| 10 | Outside | 6 | Exit dungeon |
| 12 | Healmore | 5 | Restore ~80 HP |
| 15 | Return | 8 | Warp to town |
| 18 | Stepguard | 2 | No floor damage |
| 22 | Sacrifice | 1 | Kill self, kill enemies |

### Princess of Moonbrooke Spells
| Level | Spell | MP Cost | Effect |
|-------|-------|---------|--------|
| 1 | Heal | 3 | Restore ~30 HP |
| 2 | Sleep | 3 | Put to sleep |
| 4 | Antidote | 3 | Cure poison |
| 6 | Firebal | 4 | Fire damage |
| 8 | Infernos | 6 | Fire to group |
| 10 | Surround | 4 | Lower accuracy |
| 12 | Healmore | 5 | Restore ~80 HP |
| 14 | Stopspell | 3 | Block magic |
| 16 | Defense | 2 | Lower defense |
| 18 | Firebane | 6 | Strong fire |
| 20 | Defeat | 4 | Instant death |
| 22 | Explodet | 8 | Explosion all |
| 24 | Increase | 4 | Raise defense |
| 26 | Healall | 8 | Full HP heal |
| 28 | Revive | 15 | 50% revive |
| 30 | Chance | 15 | Random effect |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Text System](text-system.md) - Text encoding
