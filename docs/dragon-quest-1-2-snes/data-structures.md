# Dragon Quest I & II (SNES) - Data Structures

## Dragon Quest I Monster Data

Each monster entry is 30 bytes:

| Offset | Size | Description |
|--------|------|-------------|
| $00-$01 | 2 | HP |
| $02 | 1 | Strength |
| $03 | 1 | Agility |
| $04 | 1 | Defense |
| $05 | 1 | Attack pattern |
| $06 | 1 | Spell pattern |
| $07 | 1 | Sleep resistance |
| $08 | 1 | Stopspell resistance |
| $09 | 1 | Hurt resistance |
| $0A-$0B | 2 | Experience |
| $0C-$0D | 2 | Gold |
| $0E | 1 | Drop item ID |
| $0F | 1 | Drop rate (1/X) |
| $10-$1D | 14 | Reserved/graphics data |

### DQ1 Monster List

| ID | Name | HP | STR | AGI | DEF | EXP | Gold |
|----|------|-----|-----|-----|-----|-----|------|
| $00 | Slime | 3 | 5 | 3 | 2 | 1 | 2 |
| $01 | Red Slime | 4 | 7 | 3 | 3 | 1 | 3 |
| $02 | Drakee | 6 | 9 | 6 | 5 | 2 | 3 |
| $03 | Ghost | 7 | 11 | 8 | 6 | 3 | 5 |
| $04 | Magician | 13 | 11 | 12 | 10 | 4 | 12 |
| $05 | Magidrakee | 15 | 14 | 14 | 12 | 5 | 20 |
| ... | ... | ... | ... | ... | ... | ... | ... |
| $24 | Golem | 70 | 120 | 10 | 60 | 5 | 10 |
| $25 | Axe Knight | 70 | 94 | 45 | 82 | 54 | 165 |
| $26 | Blue Dragon | 70 | 98 | 60 | 84 | 60 | 150 |
| $27 | Dragonlord 1 | 100 | 90 | 75 | 75 | 0 | 0 |
| $28 | Dragonlord 2 | 165 | 140 | 200 | 200 | 0 | 0 |

## Dragon Quest II Monster Data

Each monster entry is 30 bytes (same format as DQ1):

### DQ2 Monster List (Selected)

| ID | Name | HP | STR | AGI | DEF | EXP | Gold |
|----|------|-----|-----|-----|-----|-----|------|
| $00 | Slime | 8 | 10 | 5 | 5 | 3 | 4 |
| $01 | Big Slug | 10 | 12 | 4 | 4 | 3 | 5 |
| $02 | Drakee | 12 | 15 | 8 | 8 | 5 | 6 |
| $10 | Baboon | 42 | 45 | 25 | 28 | 32 | 45 |
| $20 | Saber Lion | 85 | 82 | 55 | 65 | 135 | 95 |
| $30 | Blizzard | 140 | 115 | 95 | 85 | 410 | 180 |
| $50 | Atlas | 250 | 180 | 72 | 135 | 0 | 0 |
| $51 | Bazuzu | 250 | 170 | 110 | 120 | 0 | 0 |
| $52 | Zarlox | 250 | 190 | 88 | 145 | 0 | 0 |
| $54 | Hargon | 200 | 150 | 100 | 80 | 0 | 0 |
| $55 | Malroth | 255 | 180 | 120 | 100 | 0 | 0 |

## DQ1 Weapon Data

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Attack bonus |
| $01 | 1 | Special effect |
| $02-$03 | 2 | Price |

### DQ1 Weapon List

| ID | Name | ATK | Price | Special |
|----|------|-----|-------|---------|
| $00 | (None) | 0 | 0 | — |
| $01 | Bamboo Pole | 2 | 10 | — |
| $02 | Club | 4 | 60 | — |
| $03 | Copper Sword | 10 | 180 | — |
| $04 | Hand Axe | 15 | 560 | — |
| $05 | Broad Sword | 20 | 1500 | — |
| $06 | Flame Sword | 28 | 9800 | Cast Firebal |
| $07 | Erdrick's Sword | 40 | — | — |

### DQ1 Armor List

| ID | Name | DEF | Price | Special |
|----|------|-----|-------|---------|
| $00 | (None) | 0 | 0 | — |
| $01 | Clothes | 2 | 20 | — |
| $02 | Leather Armor | 4 | 70 | — |
| $03 | Chain Mail | 10 | 300 | — |
| $04 | Half Plate | 16 | 1000 | — |
| $05 | Full Plate | 24 | 3000 | — |
| $06 | Magic Armor | 24 | 7700 | HP regen |
| $07 | Erdrick's Armor | 28 | — | Regen/resist |

### DQ1 Shield List

| ID | Name | DEF | Price |
|----|------|-----|-------|
| $00 | (None) | 0 | 0 |
| $01 | Small Shield | 4 | 90 |
| $02 | Large Shield | 10 | 800 |
| $03 | Silver Shield | 20 | 14800 |

## DQ2 Equipment Data

### DQ2 Weapon List

| ID | Name | ATK | Price | Users |
|----|------|-----|-------|-------|
| $00 | (None) | 0 | 0 | All |
| $01 | Cypress Stick | 2 | 5 | All |
| $02 | Copper Sword | 10 | 100 | P1, P2 |
| $03 | Chain Sickle | 15 | 390 | P1, P2 |
| $04 | Iron Spear | 20 | 770 | P1 |
| $05 | Steel Sword | 30 | 1500 | P1, P2 |
| $06 | Wizard Wand | 8 | 2500 | P2, P3 |
| $07 | Thunder Sword | 95 | — | P1, P2 |
| $08 | Falcon Sword | 5×2 | 25000 | P1 |
| $09 | Dragon Killer | 50 | 8000 | P1 |
| $0A | Light Sword | 65 | 16000 | P1 |
| $0B | Sword of Destruction | 99 | — | P1 (cursed) |

P1 = Midenhall, P2 = Cannock, P3 = Moonbrooke

### DQ2 Armor List

| ID | Name | DEF | Price | Users |
|----|------|-----|-------|-------|
| $00 | (None) | 0 | 0 | All |
| $01 | Clothes | 4 | 65 | All |
| $02 | Leather Armor | 8 | 350 | P1, P2 |
| $03 | Chain Mail | 15 | 480 | P1, P2 |
| $04 | Steel Armor | 25 | 1000 | P1 |
| $05 | Magic Armor | 35 | 4300 | P1, P2 |
| $06 | Cloak of Wind | 20 | 1250 | P3 |
| $07 | Water Flying Cloth | 35 | 2500 | P3 |
| $08 | Armor of Gaia | 55 | — | P1, P2 |
| $09 | Erdrick's Armor | 40 | — | P1 |

## DQ1 Spell Data

| ID | Name | MP | Effect |
|----|------|-----|--------|
| $00 | Heal | 3 | Restore ~30 HP |
| $01 | Hurt | 2 | ~10 damage |
| $02 | Sleep | 2 | Put to sleep |
| $03 | Radiant | 2 | Light dungeon |
| $04 | Stopspell | 2 | Block magic |
| $05 | Outside | 6 | Exit dungeon |
| $06 | Return | 8 | Warp to castle |
| $07 | Repel | 2 | Avoid enemies |
| $08 | Healmore | 10 | Restore ~85 HP |
| $09 | Hurtmore | 5 | ~65 damage |

### DQ1 Spell Learning

| Level | Spell |
|-------|-------|
| 3 | Heal |
| 4 | Hurt |
| 7 | Sleep |
| 9 | Radiant |
| 10 | Stopspell |
| 12 | Outside |
| 13 | Return |
| 15 | Repel |
| 17 | Healmore |
| 19 | Hurtmore |

## DQ2 Spell Data

### Prince of Cannock Spells

| Level | Spell | MP | Effect |
|-------|-------|-----|--------|
| 1 | Heal | 3 | ~30 HP |
| 3 | Firebal | 4 | Fire damage |
| 6 | Surround | 4 | Lower accuracy |
| 10 | Outside | 6 | Exit dungeon |
| 12 | Healmore | 5 | ~80 HP |
| 15 | Return | 8 | Warp to town |
| 18 | Stepguard | 2 | No floor damage |
| 22 | Sacrifice | 1 | Kill self, damage all |

### Princess of Moonbrooke Spells

| Level | Spell | MP | Effect |
|-------|-------|-----|--------|
| 1 | Heal | 3 | ~30 HP |
| 2 | Sleep | 3 | Put to sleep |
| 4 | Antidote | 3 | Cure poison |
| 6 | Firebal | 4 | Fire damage |
| 8 | Infernos | 6 | Fire to group |
| 10 | Surround | 4 | Lower accuracy |
| 12 | Healmore | 5 | ~80 HP |
| 14 | Stopspell | 3 | Block magic |
| 16 | Defense | 2 | Lower defense |
| 18 | Firebane | 6 | Strong fire |
| 20 | Defeat | 4 | Instant death |
| 22 | Explodet | 8 | Explosion all |
| 24 | Increase | 4 | Raise defense |
| 26 | Healall | 8 | Full HP |
| 28 | Revive | 15 | 50% resurrect |
| 30 | Chance | 15 | Random effect |

## Experience Tables

### DQ1 Experience Table

| Level | Total EXP | HP | MP | STR | AGI |
|-------|-----------|-----|-----|-----|-----|
| 1 | 0 | 15 | 0 | 4 | 4 |
| 5 | 220 | 34 | 12 | 13 | 10 |
| 10 | 1300 | 67 | 45 | 30 | 22 |
| 15 | 4200 | 103 | 78 | 50 | 35 |
| 20 | 10000 | 142 | 108 | 72 | 48 |
| 25 | 20000 | 178 | 138 | 95 | 60 |
| 30 | 65535 | 218 | 180 | 130 | 80 |

### DQ2 Experience Tables

#### Prince of Midenhall
| Level | Total EXP | HP | STR | AGI |
|-------|-----------|-----|-----|-----|
| 1 | 0 | 30 | 8 | 5 |
| 10 | 2500 | 90 | 55 | 35 |
| 20 | 20000 | 170 | 120 | 80 |
| 30 | 75000 | 230 | 165 | 110 |

#### Prince of Cannock
| Level | Total EXP | HP | MP | STR | AGI |
|-------|-----------|-----|-----|-----|-----|
| 1 | 0 | 22 | 6 | 6 | 5 |
| 10 | 2000 | 70 | 35 | 40 | 32 |
| 20 | 18000 | 130 | 75 | 88 | 70 |
| 30 | 68000 | 175 | 108 | 125 | 100 |

#### Princess of Moonbrooke
| Level | Total EXP | HP | MP | STR | AGI |
|-------|-----------|-----|-----|-----|-----|
| 1 | 0 | 18 | 10 | 4 | 7 |
| 10 | 1500 | 55 | 65 | 28 | 45 |
| 20 | 15000 | 105 | 140 | 62 | 92 |
| 30 | 58000 | 140 | 201 | 90 | 125 |

## Item Data

### DQ1 Items

| ID | Name | Price | Effect |
|----|------|-------|--------|
| $00 | Herb | 24 | Heal ~30 HP |
| $01 | Torch | 8 | Light dungeon |
| $02 | Magic Key | 53 | Open doors |
| $03 | Wings | 70 | Return to castle |
| $04 | Dragon's Scale | 20 | Defense +5 |
| $05 | Fairy Water | 38 | Repel enemies |
| $06 | Fighter's Ring | 15 | Attack +2 |
| $07 | Cursed Belt | 180 | Cursed |

### DQ2 Items

| ID | Name | Price | Effect |
|----|------|-------|--------|
| $00 | Herb | 15 | ~35 HP |
| $01 | Antidote | 8 | Cure poison |
| $02 | Fairy Water | 40 | Repel weak |
| $03 | Wings | 80 | Warp to town |
| $04 | Medical Herb | 30 | ~70 HP |
| $05 | Lottery Ticket | 20 | Use in Lotto |

### DQ2 Key Items

| ID | Name | Purpose |
|----|------|---------|
| $10 | Golden Key | Gold doors |
| $11 | Silver Key | Silver doors |
| $12 | Jail Key | Jail doors |
| $13 | Moon Fragment | Part of crest |
| $14 | Eye of Malroth | Opens path |
| $15 | Sunstone | Rubiss Charm |
| $16 | Staff of Thunder | Sea cave |
| $17 | Rain Staff | Rubiss Charm |
| $18 | Rubiss Charm | Beat Malroth |
| $19 | Water Crest | Sea cave |
| $1A | Mirror of Ra | Cure princess |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Text System](text-system.md) - Text encoding
