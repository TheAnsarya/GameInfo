# Robotrek (SNES) - ROM Data Summary

Generated: 2025-12-23 17:39:03

## ROM Information

| Property | Value |
|----------|-------|
| ROM Size | 1,572,864 bytes (1.5 MB) |
| Mapper | HiROM + FastROM |
| Internal Name | ROBOTREK 1 USA |
| CRC32 | 7AD4AADC |
| Compression | Quintet LZSS |

## Items

**Total Items:** 83

| Address | Name |
|---------|------|
| $01e413 | Nothing |
| $01e41b | Sword 1 |
| $01e423 | Sword 2 |
| $01e42b | Sword 3 |
| $01e433 | Sword 4 |
| $01e43b | Axe 1 |
| $01e441 | Axe 2 |
| $01e447 | Axe 3 |
| $01e44d | Blade 1 |
| $01e455 | Blade 2 |
| $01e45d | Blade 3 |
| $01e465 | Blade 4 |
| $01e46d | Hammer 1 |
| $01e476 | Hammer 2 |
| $01e47f | Hammer 3 |
| $01e488 | Celtis 1 |
| $01e491 | Celtis 2 |
| $01e49a | Celtis 3 |
| $01e4a3 | Punch 1 |
| $01e4ab | Punch 2 |
| ... | (63 more) |

## Enemies

**Total Enemies:** 56

| Address | Name |
|---------|------|
| $01fdbe | Mine |
| $01fdc3 | Turbo |
| $01fdc9 | Mushroom |
| $01fdd2 | Poison |
| $01fdd9 | Spider |
| $01fde0 | Spider |
| $01fde7 | Gel |
| $01fdeb | Gelgel |
| $01fdf2 | Bosstoad |
| $01fdfb | Rushbird |
| $01fe04 | Quickbird |
| $01fe0e | Mole |
| $01fe13 | Powermole |
| $01fe1d | Tackler |
| $01fe25 | Plasmoke |
| $01fe2e | Elesmoke |
| $01fe37 | Monk |
| $01fe3c | Mummy |
| $01fe42 | Franken |
| $01fe4a | Ho Ho |
| ... | (36 more) |

## Map Data

### Tileset Regions

| Offset | Size | Description | Decomp Size |
|--------|------|-------------|-------------|
| $000000 | 1570 | Map tileset 1 | 2048 |
| $000623 | 1563 | Map tileset 2 | 2048 |
| $000c3f | 1550 | Map tileset 3 | 2048 |
| $00124e | 1526 | Map tileset 4 | 2048 |
| $001845 | 1513 | Map tileset 5 | 2048 |
| $001e2f | 1464 | Map tileset 6 | 2048 |
| $0023e8 | 1410 | Map arrangement 1 | 771 |

## Palettes

### Known Palette Regions

| Region | Palettes | Description |
|--------|----------|-------------|
| $018845-$018c05 | 30 | Palettes 1 |
| $05de10-$05e7ff | 79 | Palettes 2 (Robot colors?) |
| $08fe00-$08ffff | 15 | Palettes 3 |

### Discovered Palette Groups

| Start | End | Count |
|-------|-----|-------|
| $10b9a0 | $10ba40 | 6 |
| $139020 | $139080 | 4 |
| $14a0e0 | $14a1a0 | 7 |
| $14b020 | $14b0e0 | 7 |

## Graphics

### Extracted Graphics

- **Font:** $080000-$082000 - 512 tiles (2BPP)
- **Menu:** $0d9310-$0db310 - 256 tiles (4BPP)

## Actor/Entity Data

**Pointer Table:** $038000

Actor format: 22-byte entries with 3 animation frames

- Unique graphics pointers: 22
- Unique animation pointers: 29

## Key Data Addresses

| Address | Description |
|---------|-------------|
| $01c200 | Recipe/combination table |
| $01e413 | Item names (CC-separated) |
| $01f748 | Item name pointer table |
| $01fd00 | Enemy name pointer table |
| $01fdbe | Enemy names (null-terminated) |
| $038000 | Actor/entity pointer table |
| $080000 | Font graphics (2BPP) |
| $0d8000 | Map metadata |
| $0d9310 | Menu graphics (4BPP) |

## Extracted Files

- `actor_data_analysis.json` (37,204 bytes)
- `compressed_00000.bin` (2,048 bytes)
- `enemies.json` (8,331 bytes)
- `enemies_extracted.json` (7,592 bytes)
- `enemy_names.json` (6,337 bytes)
- `font_2bpp.png` (4,150 bytes)
- `font_80000.png` (2,180 bytes)
- `font_81000.png` (2,017 bytes)
- `graphics` (8,192 bytes)
- `images` (8,192 bytes)
- `inventory_d9310.png` (3,548 bytes)
- `item_names.json` (8,701 bytes)
- `items.json` (14,871 bytes)
- `items_extracted.json` (8,741 bytes)
- `map_data_analysis.json` (3,802 bytes)
- `menu_graphics_4bpp.png` (6,707 bytes)
- `palette_analysis.json` (61,748 bytes)
- `palettes_palettes_1.png` (3,345 bytes)
- `palettes_palettes_2_robot_colors.png` (3,605 bytes)
- `palettes_palettes_3.png` (717 bytes)
- `recipes.json` (1,369 bytes)
- `recipes_full.json` (17,656 bytes)
- `robotrek_complete_data.json` (22,874 bytes)
- `robotrek_data.json` (11,564 bytes)
- `robotrek_enemies.wikitext` (2,425 bytes)
- `robotrek_items.wikitext` (3,896 bytes)
- `sprite_analysis.json` (4,407 bytes)
