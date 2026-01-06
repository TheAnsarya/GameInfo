# Dragon Quest I & II (SNES) - RAM Map

## Overview

Dragon Quest I & II uses the SNES's 128KB WRAM plus 8KB battery-backed SRAM. Both games share common memory structures with game-specific extensions.

## Work RAM Overview ($7E0000-$7FFFFF)

| Address Range | Size | Description |
|---------------|------|-------------|
| $7E0000-$7E00FF | 256 bytes | Direct page (fast access) |
| $7E0100-$7E01FF | 256 bytes | CPU stack |
| $7E0200-$7E0FFF | 3.5KB | System variables |
| $7E1000-$7E1FFF | 4KB | Game state |
| $7E2000-$7E3FFF | 8KB | Player/party data |
| $7E4000-$7E7FFF | 16KB | Map/NPC data |
| $7E8000-$7EFFFF | 32KB | Graphics buffers |
| $7F0000-$7FFFFF | 64KB | Extended work RAM |

## Direct Page ($7E0000-$7E00FF)

### System Variables ($00-$1F)

| Address | Size | Description |
|---------|------|-------------|
| $00-$01 | 2 | Temporary pointer low |
| $02-$03 | 2 | Temporary pointer high |
| $04-$07 | 4 | Math accumulator |
| $08-$09 | 2 | Frame counter |
| $0A | 1 | VBlank flag |
| $0B | 1 | NMI counter |
| $0C-$0D | 2 | Random seed |
| $0E | 1 | Current game (0=DQ1, 1=DQ2) |
| $0F | 1 | Game state |
| $10-$11 | 2 | Current screen/mode |
| $12-$13 | 2 | Fade level |
| $14-$1F | 12 | DMA queue |

### Input ($20-$2F)

| Address | Size | Description |
|---------|------|-------------|
| $20-$21 | 2 | Controller 1 current |
| $22-$23 | 2 | Controller 1 previous |
| $24-$25 | 2 | Controller 1 pressed |
| $26-$27 | 2 | Controller 1 held |
| $28-$2B | 4 | Controller 2 (same layout) |
| $2C-$2F | 4 | Autofire counters |

### Graphics Registers ($30-$4F)

| Address | Size | Description |
|---------|------|-------------|
| $30 | 1 | INIDISP mirror |
| $31 | 1 | BGMODE mirror |
| $32-$33 | 2 | BG1 scroll X |
| $34-$35 | 2 | BG1 scroll Y |
| $36-$37 | 2 | BG2 scroll X |
| $38-$39 | 2 | BG2 scroll Y |
| $3A-$3D | 4 | BG3/4 scroll |
| $3E-$3F | 2 | HDMA channels active |
| $40-$4F | 16 | Palette update buffer |

### Sound Control ($50-$5F)

| Address | Size | Description |
|---------|------|-------------|
| $50 | 1 | Current music ID |
| $51 | 1 | Music volume |
| $52 | 1 | Sound effect ID |
| $53 | 1 | SE priority |
| $54-$5F | 12 | APU communication |

### Field Engine ($60-$7F)

| Address | Size | Description |
|---------|------|-------------|
| $60-$61 | 2 | Player X (subpixel) |
| $62-$63 | 2 | Player Y (subpixel) |
| $64-$65 | 2 | Player X (tile) |
| $66-$67 | 2 | Player Y (tile) |
| $68 | 1 | Player direction |
| $69 | 1 | Movement state |
| $6A-$6B | 2 | Steps until encounter |
| $6C | 1 | Current map ID |
| $6D | 1 | Map type (world/town/dungeon) |
| $6E-$6F | 2 | Party formation |
| $70-$7F | 16 | Animation timers |

### Battle Engine ($80-$9F)

| Address | Size | Description |
|---------|------|-------------|
| $80 | 1 | Battle phase |
| $81 | 1 | Turn counter |
| $82 | 1 | Active character |
| $83 | 1 | Target index |
| $84 | 1 | Current action |
| $85 | 1 | Action parameter |
| $86-$87 | 2 | Damage value |
| $88-$89 | 2 | Defense modifier |
| $8A-$8B | 2 | Attack modifier |
| $8C | 1 | Critical hit flag |
| $8D | 1 | Miss flag |
| $8E | 1 | Monster count |
| $8F | 1 | Surprise attack |
| $90-$9F | 16 | Battle effect states |

## Dragon Quest I - Player Data ($7E2000-$7E20FF)

### Hero Structure (64 bytes at $7E2000)

| Offset | Size | Description |
|--------|------|-------------|
| $00-$07 | 8 | Name |
| $08 | 1 | Level |
| $09 | 1 | Unused |
| $0A-$0B | 2 | Current HP |
| $0C-$0D | 2 | Max HP |
| $0E-$0F | 2 | Current MP |
| $10-$11 | 2 | Max MP |
| $12-$15 | 4 | Experience |
| $16 | 1 | Strength |
| $17 | 1 | Agility |
| $18 | 1 | Attack power |
| $19 | 1 | Defense |
| $1A | 1 | Weapon ID |
| $1B | 1 | Armor ID |
| $1C | 1 | Shield ID |
| $1D | 1 | Accessory ID |
| $1E-$1F | 2 | Status effects |
| $20-$2F | 16 | Inventory (8 items × 2 bytes) |
| $30-$31 | 2 | Spell flags |
| $32-$33 | 2 | Herbs in inventory |
| $34-$35 | 2 | Keys in inventory |
| $36-$3F | 10 | Reserved |

### DQ1 Game State ($7E2100-$7E21FF)

| Address | Size | Description |
|---------|------|-------------|
| $7E2100-$7E2103 | 4 | Gold |
| $7E2104-$7E210F | 12 | Key items (flags) |
| $7E2110-$7E213F | 48 | Treasure chest flags |
| $7E2140-$7E214F | 16 | Door flags |
| $7E2150-$7E215F | 16 | Story progress flags |
| $7E2160-$7E217F | 32 | NPC flags |
| $7E2180-$7E219F | 32 | Reserved |
| $7E21A0-$7E21FF | 96 | Map return stack |

## Dragon Quest II - Party Data ($7E2200-$7E27FF)

### Party Member Structure (96 bytes each)

| Offset | Size | Description |
|--------|------|-------------|
| $00-$07 | 8 | Name |
| $08 | 1 | Character ID |
| $09 | 1 | Level |
| $0A-$0B | 2 | Current HP |
| $0C-$0D | 2 | Max HP |
| $0E-$0F | 2 | Current MP |
| $10-$11 | 2 | Max MP |
| $12-$15 | 4 | Experience |
| $16 | 1 | Strength |
| $17 | 1 | Agility |
| $18 | 1 | Vitality |
| $19 | 1 | Intelligence |
| $1A | 1 | Luck |
| $1B | 1 | Attack power |
| $1C | 1 | Defense |
| $1D | 1 | Status effects |
| $1E | 1 | Weapon ID |
| $1F | 1 | Armor ID |
| $20 | 1 | Shield ID |
| $21 | 1 | Helmet ID |
| $22 | 1 | Accessory ID |
| $23 | 1 | Reserved |
| $24-$3F | 28 | Inventory (14 items × 2 bytes) |
| $40-$47 | 8 | Spell flags |
| $48-$5F | 24 | Reserved |

### Party Member Addresses

| Character | Address |
|-----------|---------|
| Prince of Midenhall | $7E2200-$7E225F |
| Prince of Cannock | $7E2260-$7E22BF |
| Princess of Moonbrooke | $7E22C0-$7E231F |

### DQ2 Game State ($7E2400-$7E27FF)

| Address | Size | Description |
|---------|------|-------------|
| $7E2400-$7E2403 | 4 | Gold |
| $7E2404-$7E243F | 60 | Key items |
| $7E2440-$7E24FF | 192 | Treasure chest flags |
| $7E2500-$7E253F | 64 | Door flags |
| $7E2540-$7E257F | 64 | Story progress flags |
| $7E2580-$7E25FF | 128 | NPC flags |
| $7E2600-$7E26FF | 256 | Map state |
| $7E2700-$7E277F | 128 | Ship/travel data |
| $7E2780-$7E27FF | 128 | Reserved |

## Shared Game State ($7E2800-$7E2FFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E2800 | 1 | Current game (0=DQ1, 1=DQ2) |
| $7E2801 | 1 | Game started flag |
| $7E2802-$7E2803 | 2 | Play time (hours) |
| $7E2804-$7E2805 | 2 | Play time (minutes) |
| $7E2806-$7E2809 | 4 | Total steps |
| $7E280A-$7E280D | 4 | Battles won |
| $7E280E-$7E2811 | 4 | Monsters killed |
| $7E2812-$7E2815 | 4 | Gold earned total |
| $7E2816-$7E281F | 10 | Reserved |

## Map/NPC RAM ($7E4000-$7E7FFF)

### Current Map Data ($7E4000-$7E5FFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E4000-$7E40FF | 256 | Map header/properties |
| $7E4100-$7E4FFF | 3.8KB | Decompressed map tiles |
| $7E5000-$7E5FFF | 4KB | Map collision data |

### NPC Data ($7E6000-$7E6FFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E6000-$7E60FF | 256 | NPC count and IDs |
| $7E6100-$7E6FFF | 3.8KB | NPC state (32 NPCs × 32 bytes) |

### NPC Entry Structure (32 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | NPC ID |
| $01 | 1 | Sprite ID |
| $02-$03 | 2 | X position |
| $04-$05 | 2 | Y position |
| $06 | 1 | Direction |
| $07 | 1 | Movement pattern |
| $08-$09 | 2 | Dialogue ID |
| $0A | 1 | Flags |
| $0B-$1F | 21 | Reserved |

## Battle RAM ($7E7000-$7E7FFF)

### Monster Slots ($7E7000-$7E77FF)

8 monster slots × 64 bytes each:

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Monster ID |
| $01 | 1 | Active flag |
| $02-$03 | 2 | Current HP |
| $04-$05 | 2 | Max HP |
| $06 | 1 | Attack |
| $07 | 1 | Defense |
| $08 | 1 | Agility |
| $09 | 1 | Status |
| $0A | 1 | AI state |
| $0B-$3F | 53 | Reserved |

### Battle State ($7E7800-$7E7FFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E7800-$7E781F | 32 | Turn order queue |
| $7E7820-$7E783F | 32 | Action queue |
| $7E7840-$7E78FF | 192 | Battle messages |
| $7E7900-$7E79FF | 256 | Damage/effect buffer |
| $7E7A00-$7E7FFF | 1.5KB | Animation data |

## SRAM ($306000-$307FFF)

### Save Slot Format

3 save slots at 2KB each:

| Address | Save Slot |
|---------|-----------|
| $306000-$3067FF | Slot 1 |
| $306800-$306FFF | Slot 2 |
| $307000-$3077FF | Slot 3 |
| $307800-$307FFF | System/Config |

### Save Slot Structure

| Offset | Size | Description |
|--------|------|-------------|
| $000-$001 | 2 | Checksum |
| $002 | 1 | Save valid flag |
| $003 | 1 | Game ID (DQ1/DQ2) |
| $004-$1FF | 508 | Player data |
| $200-$5FF | 1024 | Game state flags |
| $600-$7FF | 512 | Map/misc state |

## Status Effect Flags

| Bit | Status |
|-----|--------|
| 0 | Poison |
| 1 | Sleep |
| 2 | Confused |
| 3 | Silenced |
| 4 | Paralyzed |
| 5 | Dead |
| 6 | Cursed |
| 7 | Reflected |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [Data Structures](data-structures.md) - Data formats
- [Text System](text-system.md) - Text encoding
