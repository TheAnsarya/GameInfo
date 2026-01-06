# Dragon Warrior IV (NES) - RAM Map

Complete RAM memory mapping for Dragon Warrior IV (NES).

## Memory Overview

| Region | Address Range | Size | Description |
|--------|---------------|------|-------------|
| Zero Page | $0000-$00FF | 256 B | Fast access variables |
| Stack | $0100-$01FF | 256 B | CPU stack |
| OAM Buffer | $0200-$02FF | 256 B | Sprite data |
| Work RAM | $0300-$07FF | 1.25 KB | General variables |
| PRG-RAM | $6000-$7FFF | 8 KB | Save data, party data |

## Zero Page ($0000-$00FF)

### System Variables ($00-$1F)

| Address | Label | Description |
|---------|-------|-------------|
| $00-$01 | `ptr_lo/hi` | General purpose pointer |
| $02-$03 | `ptr2_lo/hi` | Secondary pointer |
| $04-$05 | `temp_16` | 16-bit temporary |
| $06 | `frame_counter` | Frame counter (60 Hz) |
| $07 | `nmi_flag` | NMI occurred flag |
| $08 | `controller_1` | Controller 1 state |
| $09 | `controller_2` | Controller 2 state |
| $0A | `controller_1_new` | Controller 1 new presses |
| $0B | `controller_2_new` | Controller 2 new presses |
| $0C | `game_mode` | Current game mode |
| $0D | `sub_mode` | Sub-mode |
| $0E-$0F | `rng_state` | Random number state |

### Battle Variables ($20-$4F)

| Address | Label | Description |
|---------|-------|-------------|
| $20 | `battle_phase` | Current battle phase |
| $21 | `current_actor` | Active actor index |
| $22 | `action_type` | Selected action |
| $23 | `target_index` | Target enemy/ally |
| $24-$25 | `damage_calc` | Damage calculation temp |
| $26 | `hit_chance` | To-hit percentage |
| $27 | `critical_flag` | Critical hit flag |
| $28-$2F | `actor_order[8]` | Turn order array |
| $30-$37 | `enemy_alive[8]` | Enemy alive flags |
| $38-$3F | `party_alive[8]` | Party alive flags |
| $40-$47 | `status_turns[8]` | Status effect timers |

### Map Variables ($50-$7F)

| Address | Label | Description |
|---------|-------|-------------|
| $50-$51 | `player_x` | Player X position |
| $52-$53 | `player_y` | Player Y position |
| $54 | `player_dir` | Facing direction |
| $55 | `map_id` | Current map ID |
| $56 | `tileset_id` | Current tileset |
| $57 | `encounter_steps` | Steps until encounter |
| $58-$59 | `scroll_x` | Screen scroll X |
| $5A-$5B | `scroll_y` | Screen scroll Y |
| $5C | `transition_type` | Map transition type |
| $5D | `warp_dest` | Warp destination |

## Work RAM ($0300-$07FF)

### Menu System ($0300-$03FF)

| Address | Label | Description |
|---------|-------|-------------|
| $0300 | `menu_state` | Current menu state |
| $0301 | `menu_cursor` | Cursor position |
| $0302 | `menu_page` | Current page |
| $0303 | `selected_char` | Selected character |
| $0304 | `selected_item` | Selected item slot |
| $0310-$031F | `menu_text_buf` | Menu text buffer |

### Sound System ($0400-$04FF)

| Address | Label | Description |
|---------|-------|-------------|
| $0400 | `music_id` | Current music track |
| $0401 | `sfx_id` | Current sound effect |
| $0402-$0403 | `music_ptr` | Music data pointer |
| $0404 | `music_tempo` | Music tempo |
| $0410-$041F | `channel_vol[4]` | Channel volumes |
| $0420-$042F | `channel_freq[4]` | Channel frequencies |

### Chapter System ($0500-$05FF)

| Address | Label | Description |
|---------|-------|-------------|
| $0500 | `current_chapter` | Active chapter (1-5) |
| $0501 | `chapter_flags` | Chapter progress flags |
| $0502-$050F | `event_flags[14]` | Event completion flags |
| $0510 | `wagon_enabled` | Wagon available flag |
| $0511 | `wagon_location` | Wagon map ID |

## PRG-RAM / Party Data ($6000-$7FFF)

### Party Member Data ($6000-$61FF)

Each party member uses $40 (64) bytes starting at $6000 + (index × $40):

| Offset | Size | Description |
|--------|------|-------------|
| $00-$01 | 2 | Current HP |
| $02-$03 | 2 | Current MP |
| $04-$05 | 2 | Max HP |
| $06-$07 | 2 | Max MP |
| $08 | 1 | Level |
| $09 | 1 | Class/Character ID |
| $0A | 1 | Strength |
| $0B | 1 | Agility |
| $0C | 1 | Vitality |
| $0D | 1 | Intelligence |
| $0E | 1 | Luck |
| $0F | 1 | Attack power |
| $10 | 1 | Defense power |
| $11 | 1 | Status effects |
| $12-$14 | 3 | Experience points |
| $15 | 1 | Weapon equipped |
| $16 | 1 | Armor equipped |
| $17 | 1 | Shield equipped |
| $18 | 1 | Helmet equipped |
| $19-$1F | 7 | Accessory slots |
| $20-$2F | 16 | Spells learned (bitmask) |
| $30-$3F | 16 | Reserved |

### Battle Data ($6150-$61FF)

| Address | Label | Description |
|---------|-------|-------------|
| $615A | `battle_actor_idx` | Current battle actor index |
| $615B | `tactics_setting` | AI tactics for party |
| $615C-$6167 | `action_queue[12]` | Pending actions |
| $6168-$6173 | `target_queue[12]` | Action targets |
| $618E | `battle_state_flags` | Battle state bitfield |
| $6191-$6192 | `damage_output` | Calculated damage |
| $6195-$6196 | `battle_counters` | Turn/round counters |
| $6197-$6198 | `battle_limits` | Battle area bounds |

### Inventory ($6200-$62FF)

| Address | Label | Description |
|---------|-------|-------------|
| $6200-$623F | `bag_items[64]` | Bag inventory |
| $6240-$627F | `bag_quantities[64]` | Item quantities |
| $6280-$629F | `key_items[32]` | Key items (flags) |
| $62A0-$62BF | `wagon_items[32]` | Wagon storage |

### Game State ($6300-$63FF)

| Address | Label | Description |
|---------|-------|-------------|
| $6300-$6303 | `gold` | Party gold (32-bit) |
| $6304 | `play_hours` | Play time hours |
| $6305 | `play_minutes` | Play time minutes |
| $6306 | `casino_coins_lo` | Casino coins (low) |
| $6307 | `casino_coins_hi` | Casino coins (high) |
| $6310-$631F | `world_flags[16]` | World state flags |
| $6320-$632F | `chest_flags[16]` | Opened chests |
| $6330-$633F | `npc_flags[16]` | NPC interaction flags |

### Save Checksum ($7F00-$7FFF)

| Address | Label | Description |
|---------|-------|-------------|
| $7F00-$7F01 | `save_checksum` | Save data checksum |
| $7F02 | `save_slot` | Current save slot |
| $7F03 | `save_valid` | Save validity flag |

## External References

- [Full Disassembly](https://github.com/TheAnsarya/dragon-warrior-4-info)
- [Detailed Memory Analysis](https://github.com/TheAnsarya/dragon-warrior-4-info/blob/main/docs/memory_map.md)
