# Robotrek Tools

Python tools for analyzing and modifying Robotrek (SNES) ROM data.

## Tools

### robotrek_analyzer.py

Analyzes ROM structure and extracts game data locations.

```bash
# Show ROM info
python robotrek_analyzer.py "Robotrek (U) [!].sfc"

# Export analysis to JSON
python robotrek_analyzer.py "Robotrek (U) [!].sfc" --json > analysis.json

# Export data to directory
python robotrek_analyzer.py "Robotrek (U) [!].sfc" --output ./output
```

### robotrek_text_extractor.py

Extracts and decodes text data.

```bash
# Extract all text banks
python robotrek_text_extractor.py "Robotrek (U) [!].sfc" --output text.json

# Extract specific bank
python robotrek_text_extractor.py "Robotrek (U) [!].sfc" --bank dialog1

# Export TBL file
python robotrek_text_extractor.py "Robotrek (U) [!].sfc" --tbl robotrek.tbl
```

### robotrek_sprite_extractor.py

Extracts sprite graphics to PNG files.

```bash
# Extract all sprites
python robotrek_sprite_extractor.py "Robotrek (U) [!].sfc" --output ./sprites

# Extract specific sprite sheet
python robotrek_sprite_extractor.py "Robotrek (U) [!].sfc" --output ./sprites --sprite player

# List available sprites
python robotrek_sprite_extractor.py "Robotrek (U) [!].sfc" --output ./sprites --list

# Export raw tile data
python robotrek_sprite_extractor.py "Robotrek (U) [!].sfc" --output ./sprites --sprite enemies1 --raw
```

### robotrek_item_editor.py

Edit item definitions.

```bash
# Export items to JSON
python robotrek_item_editor.py "Robotrek (U) [!].sfc" --export items.json

# Import modified items
python robotrek_item_editor.py "Robotrek (U) [!].sfc" --import items.json --output modified.sfc

# List all items
python robotrek_item_editor.py "Robotrek (U) [!].sfc" --list

# Show specific item
python robotrek_item_editor.py "Robotrek (U) [!].sfc" --item 5
```

### robotrek_enemy_editor.py

Edit enemy statistics.

```bash
# Export enemies to JSON
python robotrek_enemy_editor.py "Robotrek (U) [!].sfc" --export enemies.json

# Import modified enemies
python robotrek_enemy_editor.py "Robotrek (U) [!].sfc" --import enemies.json --output modified.sfc

# List all enemies
python robotrek_enemy_editor.py "Robotrek (U) [!].sfc" --list

# Show specific enemy
python robotrek_enemy_editor.py "Robotrek (U) [!].sfc" --enemy 10
```

### robotrek_invention_editor.py

Edit invention recipes.

```bash
# Export inventions to JSON
python robotrek_invention_editor.py "Robotrek (U) [!].sfc" --export inventions.json

# Import modified recipes
python robotrek_invention_editor.py "Robotrek (U) [!].sfc" --import inventions.json --output modified.sfc

# List all inventions
python robotrek_invention_editor.py "Robotrek (U) [!].sfc" --list

# Find recipes using a material
python robotrek_invention_editor.py "Robotrek (U) [!].sfc" --material 0x49
```

## Requirements

- Python 3.10+
- Pillow (for sprite extraction): `pip install pillow`

## ROM Information

- **Title**: Robotrek (US) / Slapstick (JP)
- **System**: SNES
- **Mapper**: HiROM + FastROM
- **ROM Size**: 1.5 MB
- **SRAM**: 8 KB

## Data Locations

| Data Type | Bank | Start | Entry Size |
|-----------|------|-------|------------|
| Items | $D0 | $8000 | 8 bytes |
| Enemies | $D1 | $8000 | 16 bytes |
| Inventions | $D2 | $8000 | 8 bytes |
| Menu Text | $CF | $8000 | Variable |
| Dialog | $E0-$E3 | $8000 | Variable |
| Sprites | $C0-$C7 | $8000 | 4bpp tiles |

## JSON Format

All editors export/import JSON with the following structure:

```json
{
    "game": "Robotrek",
    "data_type": "items|enemies|inventions",
    "rom_location": {
        "bank": "$D0",
        "start": "$8000",
        "entry_size": 8,
        "count": 150
    },
    "items|enemies|inventions": [
        { "id": 0, ... },
        { "id": 1, ... }
    ]
}
```

## Text Encoding

Robotrek uses a custom text encoding. The TBL file maps hex values to characters:

- `$01-$1A`: A-Z
- `$1B-$34`: a-z
- `$35-$3E`: 0-9
- `$3F`: Space
- `$40-$4F`: Punctuation
- `$80-$9F`: Dictionary compression
- `$F0-$FF`: Control codes

## License

MIT License - See project root for details.
