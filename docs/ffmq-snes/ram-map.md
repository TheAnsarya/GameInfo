# Final Fantasy Mystic Quest (SNES) - RAM Map

Complete RAM memory mapping for Final Fantasy Mystic Quest (SNES).

## Memory Overview

| Region | Address Range | Size | Description |
|--------|---------------|------|-------------|
| Zero Page | $00:0000-$00:00FF | 256 B | Direct page variables |
| Low WRAM | $00:0100-$00:1FFF | 7.75 KB | Stack and work RAM |
| WRAM | $7E:0000-$7F:FFFF | 128 KB | Main work RAM |
| SRAM | $70:0000-$70:1FFF | 8 KB | Save data (battery backed) |

## Zero Page ($00:0000-$00:00FF)

### Core System ($00-$2F)

| Address | Label | Description |
|---------|-------|-------------|
| $00-$01 | `dp_ptr` | Direct page pointer |
| $02-$03 | `dp_ptr2` | Secondary pointer |
| $04-$05 | `temp_16` | 16-bit temporary |
| $06-$08 | `temp_24` | 24-bit temporary |
| $09 | `nmi_flag` | NMI occurred flag |
| $0A | `frame_ctr` | Frame counter |
| $0B | `mode_flags` | Game mode flags |
| $0C-$0D | `rng_seed` | Random number seed |
| $0E | `controller_1` | Controller 1 state |
| $0F | `controller_1_new` | New button presses |
| $10 | `controller_2` | Controller 2 state |
| $11 | `controller_2_new` | Player 2 new presses |
| $12-$13 | `vram_ptr` | VRAM write pointer |
| $14-$15 | `oam_ptr` | OAM buffer pointer |

### DMA Variables ($30-$4F)

| Address | Label | Description |
|---------|-------|-------------|
| $30-$32 | `dma_src` | DMA source address |
| $33-$34 | `dma_dst` | DMA destination |
| $35-$36 | `dma_len` | DMA length |
| $37 | `dma_mode` | DMA transfer mode |
| $38-$3F | `hdma_table` | HDMA parameters |

### Math Registers ($50-$5F)

| Address | Label | Description |
|---------|-------|-------------|
| $50-$51 | `math_a` | Multiplication A |
| $52-$53 | `math_b` | Multiplication B |
| $54-$57 | `math_result` | 32-bit result |
| $58-$59 | `dividend` | Division dividend |
| $5A-$5B | `divisor` | Division divisor |

## Low WRAM ($00:0100-$00:1FFF)

### Stack ($00:0100-$00:01FF)

Standard 65816 stack area (256 bytes).

### OAM Buffer ($00:0200-$00:02FF)

| Offset | Size | Description |
|--------|------|-------------|
| $0200 | 128 × 4 | Primary OAM (128 sprites) |
| $0280 | 128 × 2 | Extended OAM bits |

### Audio Buffer ($00:0300-$00:03FF)

| Address | Label | Description |
|---------|-------|-------------|
| $0300 | `music_id` | Current music track |
| $0301 | `sfx_queue` | Sound effect queue |
| $0302-$030F | `spc_cmd_buf` | SPC command buffer |
| $0310-$031F | `channel_state[4]` | Channel states |
| $0320 | `music_tempo` | Current tempo |
| $0321 | `fade_timer` | Music fade timer |

## Main WRAM ($7E:0000-$7F:FFFF)

### System Area ($7E:0000-$7E:0FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:0000 | (mirror) | Zero page mirror |
| $7E:0100 | (mirror) | Stack mirror |
| $7E:0200 | (mirror) | OAM mirror |
| $7E:0400-$7E:0FFF | `sys_vars` | System variables |

### Game State ($7E:1000-$7E:1FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:1000 | `game_mode` | Current game mode |
| $7E:1001 | `sub_mode` | Sub-mode state |
| $7E:1002 | `chapter_id` | Current chapter (0-4) |
| $7E:1003 | `area_id` | Current area |
| $7E:1004-$7E:1005 | `player_x` | Player X position |
| $7E:1006-$7E:1007 | `player_y` | Player Y position |
| $7E:1008 | `player_dir` | Facing direction |
| $7E:1009 | `encounter_steps` | Steps until encounter |
| $7E:100A-$7E:100B | `play_time_lo` | Play time (low) |
| $7E:100C-$7E:100D | `play_time_hi` | Play time (high) |

### Party Data ($7E:2000-$7E:2FFF)

#### Benjamin (Main Character) ($7E:2000-$7E:20FF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:2000-$7E:2001 | `ben_hp_cur` | Current HP |
| $7E:2002-$7E:2003 | `ben_hp_max` | Maximum HP |
| $7E:2004 | `ben_attack` | Attack power |
| $7E:2005 | `ben_defense` | Defense power |
| $7E:2006 | `ben_speed` | Speed stat |
| $7E:2007 | `ben_magic` | Magic power |
| $7E:2008 | `ben_accuracy` | Hit accuracy |
| $7E:2009 | `ben_evade` | Evasion rate |
| $7E:200A | `ben_level` | Current level |
| $7E:200B-$7E:200E | `ben_exp` | Experience points |
| $7E:200F | `ben_status` | Status effects |
| $7E:2010-$7E:2017 | `ben_white_magic` | White magic known |
| $7E:2018-$7E:201F | `ben_black_magic` | Black magic known |
| $7E:2020-$7E:2027 | `ben_wizard_magic` | Wizard magic known |
| $7E:2028 | `ben_weapon` | Equipped weapon ID |
| $7E:2029 | `ben_armor` | Equipped armor ID |
| $7E:202A | `ben_shield` | Equipped shield ID |
| $7E:202B | `ben_helmet` | Equipped helmet ID |
| $7E:202C | `ben_accessory` | Equipped accessory |

#### Partner Character ($7E:2100-$7E:21FF)

Same structure as Benjamin, used for Kaeli/Tristam/Phoebe/Reuben.

| Address | Label | Description |
|---------|-------|-------------|
| $7E:2100 | `partner_id` | Partner character ID |
| $7E:2101-$7E:21FF | | Same layout as Benjamin |

### Inventory ($7E:3000-$7E:3FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:3000-$7E:301F | `weapons[32]` | Weapon inventory |
| $7E:3020-$7E:303F | `armors[32]` | Armor inventory |
| $7E:3040-$7E:305F | `shields[32]` | Shield inventory |
| $7E:3060-$7E:307F | `helmets[32]` | Helmet inventory |
| $7E:3080-$7E:309F | `accessories[32]` | Accessory inventory |
| $7E:30A0-$7E:30BF | `consumables[32]` | Consumable items |
| $7E:30C0-$7E:30DF | `key_items[32]` | Key item flags |
| $7E:30E0-$7E:30FF | `item_counts[32]` | Consumable counts |
| $7E:3100-$7E:3103 | `gold` | Current gold (32-bit) |

### Battle System ($7E:4000-$7E:4FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:4000 | `battle_state` | Battle phase |
| $7E:4001 | `battle_flags` | Battle flags |
| $7E:4002 | `turn_counter` | Turn number |
| $7E:4003 | `enemy_count` | Number of enemies |
| $7E:4004-$7E:400B | `turn_order[8]` | Turn order array |
| $7E:4010-$7E:40FF | `enemy_1` | Enemy 1 data |
| $7E:4100-$7E:41FF | `enemy_2` | Enemy 2 data |
| $7E:4200-$7E:42FF | `enemy_3` | Enemy 3 data |
| $7E:4300-$7E:43FF | `action_queue` | Pending actions |
| $7E:4400-$7E:44FF | `damage_buffer` | Damage calculations |

### Map Engine ($7E:5000-$7E:5FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:5000 | `map_id` | Current map |
| $7E:5001 | `tileset_id` | Current tileset |
| $7E:5002-$7E:5003 | `scroll_x` | Map scroll X |
| $7E:5004-$7E:5005 | `scroll_y` | Map scroll Y |
| $7E:5010-$7E:50FF | `npc_data[16]` | Active NPC data |
| $7E:5100-$7E:51FF | `event_flags` | Map event flags |
| $7E:5200-$7E:53FF | `tile_buffer` | Tile decompression |

### Event Flags ($7E:6000-$7E:6FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7E:6000-$7E:60FF | `story_flags` | Story progress flags |
| $7E:6100-$7E:61FF | `chest_flags` | Chest opened flags |
| $7E:6200-$7E:62FF | `boss_flags` | Boss defeated flags |
| $7E:6300-$7E:63FF | `item_flags` | Item obtained flags |
| $7E:6400-$7E:64FF | `companion_flags` | Companion join flags |

### Graphics Buffers ($7E:8000-$7E:FFFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E:8000 | 8 KB | BG1 tilemap buffer |
| $7E:A000 | 8 KB | BG2 tilemap buffer |
| $7E:C000 | 8 KB | Sprite tile cache |
| $7E:E000 | 8 KB | Decompression buffer |

### WRAM Bank 2 ($7F:0000-$7F:FFFF)

| Address | Size | Description |
|---------|------|-------------|
| $7F:0000 | 32 KB | Map tile data |
| $7F:8000 | 32 KB | Graphics decompression |

## SRAM ($70:0000-$70:1FFF)

### Save Slot Structure

Each save slot uses $800 (2 KB) bytes.

| Offset | Size | Description |
|--------|------|-------------|
| $000 | 4 | Save signature "FFMQ" |
| $004 | 2 | Checksum |
| $006 | 1 | Chapter number |
| $007 | 1 | Save slot ID |
| $008 | 256 | Benjamin data |
| $108 | 256 | Partner data |
| $208 | 256 | Inventory |
| $308 | 256 | Event flags |
| $408 | 256 | Map state |
| $508 | 512 | Reserved |
| $708 | 248 | Padding |

### Save Slots

| Slot | Address Range |
|------|---------------|
| Slot 1 | $70:0000-$70:07FF |
| Slot 2 | $70:0800-$70:0FFF |
| Slot 3 | $70:1000-$70:17FF |
| Config | $70:1800-$70:1FFF |

## External References

- [Full Disassembly](https://github.com/TheAnsarya/ffmq-info)
- [Detailed Memory Map](https://github.com/TheAnsarya/ffmq-info/blob/master/docs/MEMORY_MAP.md)
