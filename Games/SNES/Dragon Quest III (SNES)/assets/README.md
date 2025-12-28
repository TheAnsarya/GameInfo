# Dragon Quest III (SNES) - Extracted Assets

This folder contains all extracted assets from the ROM.

## Extracted Content

### dq3_extracted/
Complete extraction from the ROM (migrated from dq3r-info):

#### graphics/ (29 files)
| File | Format | Description |
|------|--------|-------------|
| character_sprites | 4bpp + json | Player character sprites |
| character_tiles_01-05 | 4bpp + json | Character tile sets |
| monster_graphics | 4bpp + json | Battle monster sprites |
| sprite_data_01-05 | bin + json | Sprite data |
| ui_graphics | bin + json | Menu/UI graphics |
| world_tiles | bin + json | Overworld map tiles |
| font_data | bin + json | Dialog font data |

#### text/ (3 files)
| File | Format | Description |
|------|--------|-------------|
| main_dialog | bin/json/txt | All game dialog text |

#### data/ (24 files)
| File | Format | Description |
|------|--------|-------------|
| monster_stats | bin/json/txt | Monster base stats |
| monster_ai | bin/json/txt | Monster AI patterns |
| spell_data | bin/json/txt | Spell definitions |
| item_data | bin/json/txt | Item properties |
| weapon_data | bin/json/txt | Weapon stats |
| armor_data | bin/json/txt | Armor stats |
| class_data | bin/json/txt | Character class data |
| exp_tables | bin/json/txt | Experience tables |

#### audio/ (8 files)
| File | Format | Description |
|------|--------|-------------|
| music_bank_1-2 | bin + json | Music sequences |
| sound_effects | brr + json | Sound effect samples |
| instrument_samples | brr + json | SPC instrument data |

## Status

✅ **Complete** - Assets extracted and migrated from dq3r-info repository.

See [extraction_report.md](dq3_extracted/extraction_report.md) for details.

From dq3r-info analysis:
- 64,367 text strings identified
- 107,094 data structures found
- 33,392 graphics regions located
