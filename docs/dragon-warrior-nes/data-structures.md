# Dragon Warrior (NES) - Data Structures

## Monster Data Structure

Each monster entry is 8 bytes:

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Strength |
| $01 | 1 byte | Agility |
| $02 | 1 byte | HP (low byte) |
| $03 | 1 byte | HP (high byte, usually 0) |
| $04 | 1 byte | Spell pattern |
| $05 | 1 byte | Sleep resistance |
| $06 | 1 byte | Stopspell resistance |
| $07 | 1 byte | Hurt resistance |

### Monster List

| ID | Name | STR | AGI | HP | EXP | Gold |
|----|------|-----|-----|-----|-----|------|
| $00 | Slime | 5 | 3 | 3 | 1 | 2 |
| $01 | Red Slime | 7 | 3 | 4 | 1 | 2 |
| $02 | Drakee | 9 | 6 | 6 | 2 | 3 |
| $03 | Ghost | 11 | 8 | 7 | 3 | 4 |
| $04 | Magician | 11 | 12 | 13 | 4 | 12 |
| $05 | Magidrakee | 14 | 14 | 15 | 5 | 12 |
| $06 | Scorpion | 18 | 16 | 20 | 6 | 16 |
| $07 | Druin | 20 | 18 | 22 | 7 | 18 |
| $08 | Poltergeist | 18 | 20 | 23 | 8 | 19 |
| $09 | Droll | 24 | 24 | 25 | 10 | 25 |
| $0A | Drakeema | 22 | 26 | 20 | 11 | 20 |
| $0B | Skeleton | 28 | 22 | 30 | 11 | 30 |
| $0C | Warlock | 28 | 22 | 30 | 13 | 35 |
| $0D | Metal Scorpion | 36 | 42 | 22 | 14 | 40 |
| $0E | Wolf | 40 | 30 | 34 | 16 | 50 |
| $0F | Wraith | 44 | 34 | 36 | 17 | 60 |
| $10 | Metal Slime | 10 | 255 | 4 | 115 | 6 |
| $11 | Specter | 40 | 38 | 36 | 18 | 70 |
| $12 | Wolflord | 50 | 36 | 38 | 20 | 80 |
| $13 | Druinlord | 47 | 40 | 35 | 20 | 85 |
| $14 | Drollmagi | 52 | 40 | 38 | 22 | 90 |
| $15 | Wyvern | 56 | 48 | 42 | 24 | 100 |
| $16 | Rogue Scorpion | 60 | 90 | 35 | 26 | 110 |
| $17 | Wraith Knight | 68 | 56 | 46 | 28 | 120 |
| $18 | Golem | 120 | 63 | 70 | 5 | 10 |
| $19 | Goldman | 48 | 40 | 50 | 6 | 200 |
| $1A | Knight | 76 | 78 | 55 | 33 | 150 |
| $1B | Magiwyvern | 68 | 72 | 58 | 34 | 160 |
| $1C | Demon Knight | 79 | 64 | 50 | 37 | 150 |
| $1D | Werewolf | 86 | 70 | 60 | 40 | 155 |
| $1E | Green Dragon | 88 | 74 | 65 | 45 | 160 |
| $1F | Starwyvern | 86 | 80 | 65 | 43 | 160 |
| $20 | Wizard | 80 | 70 | 65 | 50 | 165 |
| $21 | Axe Knight | 94 | 82 | 70 | 54 | 165 |
| $22 | Blue Dragon | 98 | 84 | 70 | 60 | 150 |
| $23 | Stoneman | 100 | 40 | 160 | 65 | 140 |
| $24 | Armored Knight | 105 | 86 | 90 | 70 | 140 |
| $25 | Red Dragon | 120 | 90 | 100 | 100 | 140 |
| $26 | Dragonlord (form 1) | 90 | 75 | 100 | 0 | 0 |
| $27 | Dragonlord (form 2) | 140 | 200 | 130 | 0 | 0 |

### Spell Patterns

| Value | Spells Used |
|-------|-------------|
| $00 | None |
| $01 | Hurt |
| $02 | Sleep |
| $03 | Hurt + Sleep |
| $04 | Stopspell |
| $05 | Hurt + Stopspell |
| $06 | Healmore |
| $07 | Hurtmore |
| $08 | Hurt + Hurtmore |
| $09 | Fire Breath (weak) |
| $0A | Fire Breath (strong) |
| $0B | All patterns (boss) |

## Item Data Structure

Each item entry is 4 bytes:

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Item type flags |
| $01 | 1 byte | Attack/Defense bonus |
| $02 | 1 byte | Effect flags |
| $03 | 1 byte | Reserved |

### Weapon List

| ID | Name | Attack | Price | Notes |
|----|------|--------|-------|-------|
| $00 | (None) | 0 | — | No weapon |
| $01 | Bamboo Pole | 2 | 10 | Starting option |
| $02 | Club | 4 | 60 | Early upgrade |
| $03 | Copper Sword | 10 | 180 | First real sword |
| $04 | Hand Axe | 15 | 560 | |
| $05 | Broad Sword | 20 | 1500 | |
| $06 | Flame Sword | 28 | 9800 | |
| $07 | Erdrick's Sword | 40 | — | Quest item |

### Armor List

| ID | Name | Defense | Price | Notes |
|----|------|---------|-------|-------|
| $00 | (None) | 0 | — | No armor |
| $01 | Clothes | 2 | 20 | Starting option |
| $02 | Leather Armor | 4 | 70 | |
| $03 | Chain Mail | 10 | 300 | |
| $04 | Half Plate | 16 | 1000 | |
| $05 | Full Plate | 24 | 3000 | |
| $06 | Magic Armor | 24 | 7700 | Reduces spell damage |
| $07 | Erdrick's Armor | 28 | — | Quest item, heals while walking |

### Shield List

| ID | Name | Defense | Price | Notes |
|----|------|---------|-------|-------|
| $00 | (None) | 0 | — | No shield |
| $01 | Small Shield | 4 | 90 | |
| $02 | Large Shield | 10 | 800 | |
| $03 | Silver Shield | 20 | 14800 | |

### Consumable Items

| ID | Name | Price | Effect |
|----|------|-------|--------|
| $08 | Herb | 24 | Heals ~25 HP |
| $09 | Torch | 8 | Light in dungeons |
| $0A | Dragon Scale | 20 | +2 defense in battle |
| $0B | Wings | 70 | Return to Tantegel |
| $0C | Fairy Water | 38 | Repel weak enemies |
| $0D | Magic Key | — | Opens locked doors |

## Spell Data Structure

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | MP cost |
| $01 | 1 byte | Base power |
| $02 | 1 byte | Target type |
| $03 | 1 byte | Effect type |

### Spell List

| ID | Name | MP | Learn Lv | Effect |
|----|------|-----|----------|--------|
| $00 | Heal | 4 | 3 | Restore 10-17 HP |
| $01 | Hurt | 2 | 4 | 5-12 damage |
| $02 | Sleep | 2 | 7 | Put enemy to sleep |
| $03 | Radiant | 2 | 9 | Light in dungeons |
| $04 | Stopspell | 2 | 10 | Block enemy spells |
| $05 | Outside | 6 | 12 | Exit dungeon |
| $06 | Return | 8 | 13 | Warp to Tantegel |
| $07 | Repel | 2 | 15 | Avoid weak enemies |
| $08 | Healmore | 10 | 17 | Restore 85-100 HP |
| $09 | Hurtmore | 5 | 19 | 58-65 damage |

## Experience Table

| Level | EXP Required | HP | MP | STR | AGI |
|-------|--------------|-----|-----|-----|-----|
| 1 | 0 | 15 | 0 | 4 | 4 |
| 2 | 7 | 22 | 0 | 5 | 4 |
| 3 | 23 | 24 | 5 | 7 | 6 |
| 4 | 47 | 31 | 16 | 7 | 8 |
| 5 | 110 | 35 | 20 | 12 | 10 |
| 6 | 220 | 38 | 24 | 16 | 10 |
| 7 | 450 | 40 | 26 | 18 | 17 |
| 8 | 800 | 46 | 29 | 22 | 20 |
| 9 | 1300 | 50 | 36 | 30 | 22 |
| 10 | 2000 | 54 | 40 | 35 | 31 |
| 11 | 2900 | 62 | 50 | 40 | 35 |
| 12 | 4000 | 63 | 58 | 48 | 40 |
| 13 | 5500 | 70 | 64 | 52 | 48 |
| 14 | 7500 | 78 | 70 | 60 | 55 |
| 15 | 10000 | 86 | 72 | 68 | 64 |
| 16 | 13000 | 92 | 95 | 72 | 70 |
| 17 | 16000 | 100 | 100 | 72 | 78 |
| 18 | 19000 | 115 | 108 | 85 | 84 |
| 19 | 22000 | 130 | 115 | 87 | 86 |
| 20 | 26000 | 138 | 128 | 92 | 88 |
| 21 | 30000 | 149 | 135 | 95 | 90 |
| 22 | 34000 | 158 | 146 | 97 | 90 |
| 23 | 38000 | 165 | 153 | 99 | 94 |
| 24 | 42000 | 170 | 161 | 103 | 98 |
| 25 | 46000 | 174 | 161 | 113 | 100 |
| 26 | 50000 | 180 | 168 | 117 | 105 |
| 27 | 54000 | 189 | 175 | 125 | 107 |
| 28 | 58000 | 195 | 180 | 130 | 115 |
| 29 | 62000 | 200 | 190 | 135 | 120 |
| 30 | 65535 | 255 | 255 | 140 | 140 |

## Map Format

Maps are stored as compressed tile data:

### Map Header (4 bytes)
| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 byte | Width |
| $01 | 1 byte | Height |
| $02-$03 | 2 bytes | Compressed data pointer |

### Tile Types
| ID | Tile | Walk | Description |
|----|------|------|-------------|
| $00 | Grass | Yes | Normal terrain |
| $01 | Sand | Yes | Desert |
| $02 | Water | No | Ocean/lake |
| $03 | Mountain | No | Impassable |
| $04 | Forest | Yes | Trees |
| $05 | Hill | Yes | Slower movement |
| $06 | Swamp | Yes | Damage on walking |
| $07 | Town | Yes | Town entrance |
| $08 | Castle | Yes | Castle entrance |
| $09 | Cave | Yes | Dungeon entrance |
| $0A | Bridge | Yes | Over water |
| $0B | Stairs | Yes | Dungeon stairs |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Text System](text-system.md) - Text encoding
