# Dragon Quest III (SNES) - RAM Map

Complete RAM memory mapping for Dragon Quest III: Soshite Densetsu he... (SNES).

## Memory Overview

| Region | Address Range | Size | Description |
|--------|---------------|------|-------------|
| Direct Page | $00:0000-$00:00FF | 256 B | Zero page variables |
| Stack | $00:0100-$00:01FF | 256 B | CPU stack |
| Low RAM | $00:0200-$00:1FFF | 7.5 KB | Work RAM |
| WRAM | $7E:0000-$7F:FFFF | 128 KB | Main work RAM |
| SRAM | $30:6000-$30:7FFF | 32 KB | Save data |

## Direct Page ($00:0000-$00:00FF)

### System Variables ($00-$1F)

| Address | Label | Description |
|---------|-------|-------------|
| $00-$02 | `dp_ptr24` | 24-bit pointer |
| $03-$05 | `dp_ptr2_24` | Secondary 24-bit pointer |
| $06-$07 | `temp_16` | 16-bit temporary |
| $08-$0B | `math_result` | Math operation result |
| $0C | `nmi_flag` | NMI occurred flag |
| $0D | `frame_counter` | Frame counter |
| $0E-$0F | `rng_state` | Random number state |

### Controller State ($10-$1F)

| Address | Label | Description |
|---------|-------|-------------|
| $10 | `joy1_state` | Controller 1 current |
| $11 | `joy1_prev` | Controller 1 previous |
| $12 | `joy1_new` | Controller 1 new presses |
| $13 | `joy2_state` | Controller 2 current |
| $14 | `joy2_prev` | Controller 2 previous |
| $15 | `joy2_new` | Controller 2 new presses |

### DMA/HDMA ($20-$3F)

| Address | Label | Description |
|---------|-------|-------------|
| $20-$22 | `dma_src` | DMA source address |
| $23-$24 | `dma_dst` | DMA destination |
| $25-$26 | `dma_len` | DMA length |
| $27 | `dma_mode` | DMA transfer mode |

## Game State RAM ($00:E000-$00:E0FF)

### Core Game State ($E000-$E04F)

| Address | Label | Description |
|---------|-------|-------------|
| $E000 | `game_mode` | Current game mode |
| $E001 | `game_flags` | Game state flags |
| $E002 | `rng_seed` | Random seed |
| $E003-$E004 | `frame_ctr` | Frame counter (16-bit) |
| $E005-$E00F | `sys_vars` | System variables |

### Input and Control ($E010-$E04F)

| Address | Label | Description |
|---------|-------|-------------|
| $E010 | `ctrl1_state` | Controller 1 state |
| $E011 | `ctrl1_prev` | Previous state |
| $E012 | `ctrl1_new` | New presses |
| $E020-$E04F | `menu_cursor` | Menu navigation state |

### Graphics Control ($E050-$E0AF)

| Address | Label | Description |
|---------|-------|-------------|
| $E050 | `screen_fade` | Fade level |
| $E051-$E052 | `camera_x` | Camera X position |
| $E053-$E054 | `camera_y` | Camera Y position |
| $E060-$E07F | `sprite_anim` | Sprite animation |
| $E080-$E09F | `bg_update` | BG tile update queue |

### Audio Control ($E0D0-$E0FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E0D0 | `music_id` | Current music track |
| $E0D1-$E0D8 | `sfx_queue` | Sound effect queue |
| $E0D9 | `master_vol` | Master volume |
| $E0DA-$E0EF | `music_state` | Music playback state |

## Party Data ($00:E100-$00:E4FF)

### Character Data Structure

Each character uses $100 (256) bytes:

| Member | Address Range |
|--------|---------------|
| Hero | $E100-$E1FF |
| Member 2 | $E200-$E2FF |
| Member 3 | $E300-$E3FF |
| Member 4 | $E400-$E4FF |

### Character Entry Layout

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 1 | Character level |
| $01-$03 | 3 | Experience points |
| $04-$05 | 2 | Current HP |
| $06-$07 | 2 | Maximum HP |
| $08-$09 | 2 | Current MP |
| $0A-$0B | 2 | Maximum MP |
| $0C | 1 | Strength |
| $0D | 1 | Agility |
| $0E | 1 | Wisdom (Intelligence) |
| $0F | 1 | Vitality |
| $10-$1F | 16 | Equipment slots |
| $20-$3F | 32 | Spells learned (bitmask) |
| $40-$5F | 32 | Status effects |
| $60-$7F | 32 | Character name (Japanese) |
| $80 | 1 | Character class |
| $81 | 1 | Gender |
| $82-$8F | 14 | Class-specific data |
| $90-$FF | 112 | Reserved |

### Status Effect Bitmask

```
Bit 0: Dead
Bit 1: Poisoned
Bit 2: Paralyzed
Bit 3: Asleep
Bit 4: Confused
Bit 5: Silenced
Bit 6: Cursed
Bit 7: Defense boosted
```

## Inventory ($00:E500-$00:E7FF)

### Item Storage ($E500-$E5FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E500-$E53F | `bag_items[64]` | Item IDs (64 slots) |
| $E540-$E57F | `bag_qty[64]` | Item quantities |
| $E580-$E583 | `gold` | Current gold (32-bit) |
| $E584-$E59F | `item_flags` | Special item flags |
| $E5A0-$E5FF | `key_items` | Key items (bitmask) |

### Equipment Cache ($E600-$E6FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E600-$E63F | `weapon_cache` | Weapon data cache |
| $E640-$E67F | `armor_cache` | Armor data cache |
| $E680-$E6BF | `accessory_cache` | Accessory cache |
| $E6C0-$E6FF | `equip_stats` | Equipment stat lookup |

### Shop Data ($E700-$E7FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E700-$E73F | `shop_inv` | Current shop inventory |
| $E740-$E77F | `shop_prices` | Shop prices |
| $E780-$E7BF | `transaction` | Transaction buffer |
| $E7C0-$E7FF | `service_costs` | Inn/service costs |

## World State ($00:E800-$00:EAFF)

### Current Map ($E800-$E8FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E800 | `map_id` | Current map ID |
| $E801 | `map_type` | Map type (overworld/town/dungeon) |
| $E802 | `hero_x` | Hero X position |
| $E803 | `hero_y` | Hero Y position |
| $E804 | `hero_dir` | Facing direction |
| $E805-$E80F | `scroll_state` | Map scroll data |
| $E810-$E83F | `npc_data[48]` | Active NPC data |
| $E840-$E87F | `map_events` | Map event states |
| $E880-$E8BF | `door_states` | Door/entrance states |
| $E8C0-$E8FF | `map_vars` | Map-specific variables |

### Story Progress ($E900-$E9FF)

| Address | Label | Description |
|---------|-------|-------------|
| $E900-$E93F | `story_flags` | Story progression |
| $E940-$E97F | `dialog_flags` | NPC dialog states |
| $E980-$E9BF | `dungeon_flags` | Dungeon completion |
| $E9C0-$E9FF | `event_triggers` | Special events |

### Battle State ($EA00-$EAFF)

| Address | Label | Description |
|---------|-------|-------------|
| $EA00 | `encounter_rate` | Current encounter rate |
| $EA01 | `battle_bg` | Battle background ID |
| $EA02-$EA0F | `formation` | Enemy formation |
| $EA10-$EA4F | `enemy_data[4]` | Enemy battle data |
| $EA50-$EA8F | `battle_ai` | AI state |
| $EA90-$EAFF | `combat_calc` | Combat calculations |

## Menu System ($00:EB00-$00:ECFF)

### Menu State ($EB00-$EBFF)

| Address | Label | Description |
|---------|-------|-------------|
| $EB00 | `menu_type` | Active menu type |
| $EB01 | `cursor_x` | Cursor X position |
| $EB02 | `cursor_y` | Cursor Y position |
| $EB03 | `scroll_offset` | Menu scroll |
| $EB04-$EB0F | `menu_stack` | Menu navigation stack |
| $EB10-$EB3F | `text_state` | Text rendering |
| $EB40-$EB7F | `window_state` | Window/dialog box |

### Text System ($EC00-$ECFF)

| Address | Label | Description |
|---------|-------|-------------|
| $EC00 | `text_speed` | Text display speed |
| $EC01-$EC0F | `dialog_state` | Dialog box state |
| $EC10-$EC4F | `text_buffer` | Current text buffer |
| $EC50-$EC8F | `name_entry` | Name input state |

## WRAM Banks ($7E:0000-$7F:FFFF)

### Bank 1 ($7E:0000-$7E:FFFF)

| Address | Size | Description |
|---------|------|-------------|
| $7E:0000 | 8 KB | Low RAM mirror |
| $7E:2000 | 8 KB | Decompression buffer |
| $7E:4000 | 16 KB | Map tile buffer |
| $7E:8000 | 16 KB | BG tilemap buffer |
| $7E:C000 | 16 KB | Sprite cache |

### Bank 2 ($7F:0000-$7F:FFFF)

| Address | Size | Description |
|---------|------|-------------|
| $7F:0000 | 32 KB | Map data buffer |
| $7F:8000 | 32 KB | Graphics decompression |

## SRAM ($30:6000-$30:7FFF)

### Save Structure

| Offset | Size | Description |
|--------|------|-------------|
| $0000 | 4 | Save signature |
| $0004 | 2 | Checksum |
| $0006 | 2 | Play time (hours) |
| $0008 | 1 | Play time (minutes) |
| $0009 | 1 | Chapter/progress |
| $000A | 1024 | Party data |
| $040A | 512 | Inventory |
| $060A | 256 | World state |
| $070A | 246 | Reserved |

### Save Slots

| Slot | Address Range |
|------|---------------|
| Slot 1 | $30:6000-$30:67FF |
| Slot 2 | $30:6800-$30:6FFF |
| Slot 3 | $30:7000-$30:77FF |
| Config | $30:7800-$30:7FFF |

## External References

- [DQ3R-Info Repository](https://github.com/TheAnsarya/dq3r-info)
- [Detailed Memory Map](https://github.com/TheAnsarya/dq3r-info/blob/main/docs/memory_map.md)
