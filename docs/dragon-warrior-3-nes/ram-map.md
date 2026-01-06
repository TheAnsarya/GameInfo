# Dragon Warrior III (NES) - RAM Map

## Overview

Dragon Warrior III uses the full NES RAM plus 8KB battery-backed SRAM at $6000-$7FFF for save data. The game supports up to 3 save slots.

## Zero Page ($00-$FF)

### System Variables ($00-$1F)

| Address | Size | Description |
|---------|------|-------------|
| $00-$01 | 2 | Temporary pointer |
| $02-$03 | 2 | Temporary counter |
| $04-$05 | 2 | Multiplication result |
| $06-$07 | 2 | Division result |
| $08 | 1 | Frame counter |
| $09 | 1 | RNG seed low |
| $0A | 1 | RNG seed high |
| $0B | 1 | Input this frame |
| $0C | 1 | Input previous frame |
| $0D | 1 | Input pressed (new) |
| $0E | 1 | Input held |
| $0F | 1 | Game mode |
| $10-$11 | 2 | Script pointer |
| $12-$13 | 2 | Event pointer |
| $14 | 1 | Current menu |
| $15 | 1 | Menu selection |
| $16-$1F | 10 | Stack for nested menus |

### Graphics Variables ($20-$3F)

| Address | Size | Description |
|---------|------|-------------|
| $20-$21 | 2 | Scroll X |
| $22-$23 | 2 | Scroll Y |
| $24 | 1 | PPU control mirror |
| $25 | 1 | PPU mask mirror |
| $26-$27 | 2 | Name table pointer |
| $28-$29 | 2 | CHR bank select |
| $2A | 1 | Animation frame |
| $2B | 1 | Animation timer |
| $2C | 1 | Fade level |
| $2D | 1 | Palette index |
| $2E-$2F | 2 | Sprite pointer |
| $30-$3F | 16 | DMA buffer |

### Sound Variables ($40-$5F)

| Address | Size | Description |
|---------|------|-------------|
| $40 | 1 | Music ID |
| $41 | 1 | Music position |
| $42 | 1 | Sound effect queue |
| $43 | 1 | Sound priority |
| $44-$47 | 4 | Channel volumes |
| $48-$4B | 4 | Channel notes |
| $4C-$4F | 4 | Channel durations |
| $50-$5F | 16 | Sound driver workspace |

### Field Variables ($60-$7F)

| Address | Size | Description |
|---------|------|-------------|
| $60-$61 | 2 | Party X position |
| $62-$63 | 2 | Party Y position |
| $64 | 1 | Party direction |
| $65 | 1 | Current map ID |
| $66 | 1 | Overworld/Dungeon flag |
| $67 | 1 | Steps until encounter |
| $68 | 1 | Current encounter rate |
| $69 | 1 | Treasure chest flags (local) |
| $6A-$6B | 2 | Ship X position |
| $6C-$6D | 2 | Ship Y position |
| $6E | 1 | Ship owned flag |
| $6F | 1 | Flight counter (Ramia) |
| $70-$7F | 16 | NPC state cache |

### Battle Variables ($80-$9F)

| Address | Size | Description |
|---------|------|-------------|
| $80 | 1 | Battle phase |
| $81 | 1 | Turn counter |
| $82 | 1 | Active battler |
| $83 | 1 | Target |
| $84 | 1 | Current action |
| $85 | 1 | Damage low |
| $86 | 1 | Damage high |
| $87 | 1 | Defense modifier |
| $88 | 1 | Attack modifier |
| $89 | 1 | Flee attempts |
| $8A | 1 | Monster count |
| $8B-$8E | 4 | Monster group IDs |
| $8F | 1 | Surprise attack flag |
| $90-$9F | 16 | Battle effect buffer |

## Work RAM ($0100-$07FF)

### Stack ($0100-$01FF)

| Address | Description |
|---------|-------------|
| $0100-$01FF | CPU stack |

### Sprite Buffer ($0200-$02FF)

| Address | Description |
|---------|-------------|
| $0200-$02FF | OAM DMA buffer (64 sprites × 4 bytes) |

### Party Data ($0300-$04FF)

The party can have up to 4 active members. Each member has 64 bytes.

#### Party Member Structure (64 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 8 | Name (null-terminated) |
| $08 | 1 | Class ID |
| $09 | 1 | Level |
| $0A | 1 | Personality ID |
| $0B | 1 | Gender (0=Male, 1=Female) |
| $0C-$0D | 2 | Current HP |
| $0E-$0F | 2 | Max HP |
| $10-$11 | 2 | Current MP |
| $12-$13 | 2 | Max MP |
| $14-$17 | 4 | Experience |
| $18 | 1 | Strength |
| $19 | 1 | Agility |
| $1A | 1 | Vitality |
| $1B | 1 | Intelligence |
| $1C | 1 | Luck |
| $1D | 1 | Attack |
| $1E | 1 | Defense |
| $1F | 1 | Status effects |
| $20 | 1 | Weapon ID |
| $21 | 1 | Armor ID |
| $22 | 1 | Shield ID |
| $23 | 1 | Helmet ID |
| $24-$2B | 8 | Inventory (8 items) |
| $2C-$33 | 8 | Spell flags (64 spells as bits) |
| $34 | 1 | Battles fought (for stat tracking) |
| $35 | 1 | Monsters killed |
| $36-$37 | 2 | Reserved |
| $38-$3F | 8 | Previous class stats (for multi-class) |

#### Party Slot Addresses

| Slot | Address Range |
|------|---------------|
| Member 1 (Hero) | $0300-$033F |
| Member 2 | $0340-$037F |
| Member 3 | $0380-$03BF |
| Member 4 | $0400-$043F |

### Reserve Party ($0440-$05FF)

Luisa's Place stores up to 7 additional party members:

| Slot | Address Range |
|------|---------------|
| Reserve 1 | $0440-$047F |
| Reserve 2 | $0480-$04BF |
| Reserve 3 | $04C0-$04FF |
| Reserve 4 | $0500-$053F |
| Reserve 5 | $0540-$057F |
| Reserve 6 | $0580-$05BF |
| Reserve 7 | $05C0-$05FF |

### Shared Resources ($0600-$06FF)

| Address | Size | Description |
|---------|------|-------------|
| $0600-$0603 | 4 | Gold (32-bit) |
| $0604-$0623 | 32 | Vault items |
| $0624-$0627 | 4 | Bank gold |
| $0628-$065F | 56 | Key items (as flags) |
| $0660 | 1 | Orb count |
| $0661 | 1 | Orb flags (6 orbs) |
| $0662-$067F | 30 | Reserved |

### Event Flags ($0680-$06FF)

| Address | Range | Description |
|---------|-------|-------------|
| $0680-$068F | $00-$7F | Story progress flags |
| $0690-$069F | $80-$FF | Town/NPC flags |
| $06A0-$06AF | $100-$17F | Dungeon flags |
| $06B0-$06BF | $180-$1FF | Boss defeated flags |
| $06C0-$06CF | $200-$27F | Mini medal collection |
| $06D0-$06FF | | Reserved |

### Game State ($0700-$07FF)

| Address | Size | Description |
|---------|------|-------------|
| $0700-$070F | 16 | Current map state |
| $0710-$071F | 16 | Return position stack |
| $0720 | 1 | Day/Night cycle |
| $0721 | 1 | Weather |
| $0722-$0723 | 2 | Play time (hours) |
| $0724-$0725 | 2 | Play time (minutes) |
| $0726-$0727 | 2 | Total battles |
| $0728-$0729 | 2 | Total monsters killed |
| $072A-$072B | 2 | Total steps |
| $072C-$072F | 4 | Total gold earned |
| $0730-$07FF | | Work buffer |

## SRAM ($6000-$7FFF)

### Save Slot Format

Each save slot is approximately 2KB.

| Address | Slot |
|---------|------|
| $6000-$67FF | Save 1 |
| $6800-$6FFF | Save 2 |
| $7000-$77FF | Save 3 |
| $7800-$7FFF | Checksum/Validation |

### Save Slot Structure

| Offset | Size | Description |
|--------|------|-------------|
| $000 | 2 | Checksum |
| $002 | 1 | Save valid flag |
| $003 | 1 | Hero level |
| $004-$203 | 512 | Active party (4 × 64 + padding) |
| $204-$403 | 512 | Reserve party (7 × 64 + padding) |
| $404-$443 | 64 | Shared resources |
| $444-$4C3 | 128 | Event flags |
| $4C4-$543 | 128 | Game state |
| $544-$7FF | | Reserved/padding |

## Monster Data (Battle RAM)

During battle, monster data is stored at $0500-$05FF:

### Monster Entry (16 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Monster ID |
| $01-$02 | 2 | Current HP |
| $03-$04 | 2 | Max HP |
| $05 | 1 | Strength |
| $06 | 1 | Agility |
| $07 | 1 | Defense |
| $08 | 1 | Status |
| $09 | 1 | Attack pattern |
| $0A | 1 | Spell pattern |
| $0B | 1 | AI state |
| $0C-$0F | 4 | Reserved |

Maximum 8 monsters in battle (8 × 16 = 128 bytes).

## Class IDs

| ID | Class | Japanese |
|----|-------|----------|
| $00 | Hero | 勇者 |
| $01 | Soldier | 戦士 |
| $02 | Pilgrim | 僧侶 |
| $03 | Wizard | 魔法使い |
| $04 | Fighter | 武闘家 |
| $05 | Merchant | 商人 |
| $06 | Goof-off | 遊び人 |
| $07 | Sage | 賢者 |
| $08 | Thief | 盗賊 |

## Status Effect Flags

| Bit | Status |
|-----|--------|
| 0 | Poison |
| 1 | Sleep |
| 2 | Confused |
| 3 | Paralyzed |
| 4 | Dead |
| 5 | Cursed |
| 6 | Silenced |
| 7 | Reserved |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [Data Structures](data-structures.md) - Data formats
- [Text System](text-system.md) - Text encoding
