# Text Tools Guide

Tools for extracting, editing, and translating game text.

## Overview

These tools work with game text data, supporting various encoding tables (TBL), pointer tables, and text compression.

## Tools

### text_extract.py

Extract text using TBL encoding tables.

```bash
# Extract with TBL
python tools/text/text_extract.py game.nes --tbl table.tbl --output strings.txt

# Extract from specific offset
python tools/text/text_extract.py game.nes --tbl table.tbl --offset 0x8000 --length 0x1000

# Extract to JSON
python tools/text/text_extract.py game.nes --tbl table.tbl --format json --output strings.json
```

**Options:**
- `--tbl FILE` - Text encoding table
- `--offset HEX` - Start offset
- `--length HEX` - Bytes to scan
- `--end-byte HEX` - String terminator (default: 0x00)

### pointers.py

Work with pointer tables.

```bash
# Analyze pointer table
python tools/text/pointers.py game.nes --offset 0x8000 --count 20

# Extract text via pointers
python tools/text/pointers.py game.nes --offset 0x8000 --count 20 --tbl table.tbl --extract

# Scan for pointer tables
python tools/text/pointers.py game.nes --scan --min-entries 10
```

**Pointer Formats:**
- `absolute` - Full address (16-bit)
- `relative` - Offset from base
- `banked` - Bank:offset format

### string_table.py

Manage string tables for translation.

```bash
# Create string table from pointers
python tools/text/string_table.py create game.nes --pointers 0x8000 --count 100 --tbl table.tbl

# Export for translation
python tools/text/string_table.py export strings.json --format csv --output translate.csv

# Import translations
python tools/text/string_table.py import strings.json --input translated.csv

# Insert back to ROM
python tools/text/string_table.py insert game.nes --strings strings.json --output game_translated.nes
```

### tbl_editor.py

Create and edit text encoding tables.

```bash
# Create new TBL
python tools/text/tbl_editor.py create table.tbl

# Add mapping
python tools/text/tbl_editor.py add table.tbl --hex 80 --char "A"

# Import from range
python tools/text/tbl_editor.py import table.tbl --start 0x80 --chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Generate from font
python tools/text/tbl_editor.py from-font font.png --output table.tbl
```

## TBL File Format

Text encoding tables map hex bytes to characters:

```
80=A
81=B
82=C
...
9A=Z
9B= 
FF=[END]
```

**Special Entries:**
- `[END]` - String terminator
- `[LINE]` - Line break
- `[WAIT]` - Wait for input
- `[NAME]` - Player name placeholder

## Workflow Examples

### Initial Text Extraction

```bash
# 1. Create TBL from known text
python tools/text/tbl_editor.py create dragon.tbl
python tools/text/tbl_editor.py import dragon.tbl --start 0x80 --chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# 2. Find text in ROM
python tools/analysis/hex_finder.py game.nes --text "DRAGON" --tbl dragon.tbl

# 3. Extract surrounding text
python tools/text/text_extract.py game.nes --tbl dragon.tbl --offset 0x8000 --length 0x2000
```

### Full Text Dump via Pointers

```bash
# 1. Find pointer table
python tools/text/pointers.py game.nes --scan --min-entries 20

# 2. Extract all strings
python tools/text/pointers.py game.nes --offset 0x14000 --count 500 --tbl table.tbl --extract --output all_text.json

# 3. Export for translation
python tools/text/string_table.py export all_text.json --format csv --output translate.csv
```

### Translation Insertion

```bash
# 1. Import translated CSV
python tools/text/string_table.py import strings.json --input translated.csv

# 2. Calculate space requirements
python tools/text/string_table.py analyze strings.json --original game.nes

# 3. Insert (with relocation if needed)
python tools/text/string_table.py insert game.nes --strings strings.json --output game_en.nes
```

## Common Text Formats

### DTE (Dual Tile Encoding)

Common compression where single bytes represent two-character pairs:

```
FE=th
FD=he
FC=in
```

### MTE (Multiple Tile Encoding)

Extended to represent longer strings:

```
F0=[The ]
F1=[and ]
```

### Dictionary Compression

References to common words/phrases stored in a dictionary table.

## Pointer Table Types

### Simple 16-bit Pointers

```
8000: 00 90  ; -> $9000
8002: 50 90  ; -> $9050
8004: A0 90  ; -> $90A0
```

### Banked Pointers

```
8000: 00 80 05  ; Bank 5, offset $8000
8003: 00 A0 05  ; Bank 5, offset $A000
```

### Relative Pointers

Offset from table start or bank start:

```
8000: 00 10  ; +$1000 from base
8002: 50 10  ; +$1050 from base
```

## See Also

- [Analysis Tools](analysis-tools.md) - Finding text in ROMs
- [Graphics Tools](graphics-tools.md) - Font extraction
- [TBL Format Spec](../formats/tbl-format.md) - TBL file documentation
