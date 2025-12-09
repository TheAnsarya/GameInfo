# Label Management Guide

Guide to managing debug labels and symbol files for ROM hacking.

## Overview

Debug labels map memory addresses to human-readable names, making disassembly and debugging much easier:

```
; Without labels
LDA $C0A5
JSR $8234

; With labels
LDA player_hp
JSR update_status_display
```

## Supported Formats

| Format | Extension | Emulator |
|--------|-----------|----------|
| Mesen Label | `.mlb` | Mesen, Mesen-S |
| FCEUX Name List | `.nl` | FCEUX |
| Symbol File | `.sym` | Various |
| ca65 Debug | `.dbg` | ca65/ld65 |

## MLB Editor (`mlb_editor.py`)

Create and edit Mesen label files.

### Basic Operations

```bash
# Create new label file
python tools/mlb_editor.py create game.mlb

# Add label
python tools/mlb_editor.py add game.mlb --address 0xc0a5 --label "player_hp"

# Remove label
python tools/mlb_editor.py remove game.mlb --address 0xc0a5

# List all labels
python tools/mlb_editor.py list game.mlb
```

### Label Types

MLB files support different label types:

| Type | Description |
|------|-------------|
| `G` | Global label (default) |
| `R` | Register label |
| `W` | Work RAM label |
| `S` | Save RAM label |
| `P` | PRG ROM label |
| `C` | CHR ROM label |

```bash
# Add with type
python tools/mlb_editor.py add game.mlb --address 0xc0a5 --label "player_hp" --type W
```

### Import/Export

```bash
# Export to text
python tools/mlb_editor.py export game.mlb --output labels.txt

# Import from text
python tools/mlb_editor.py import labels.txt --output game.mlb

# Convert from NL
python tools/mlb_editor.py convert game.nl --output game.mlb
```

## NL Editor (`nl_editor.py`)

Create and edit FCEUX name list files.

### FCEUX NL Format

FCEUX uses multiple `.nl` files, one per bank:
- `game.0.nl` - Bank 0
- `game.1.nl` - Bank 1
- `game.ram.nl` - RAM labels

### Basic Operations

```bash
# Create RAM labels
python tools/nl_editor.py create game.ram.nl

# Add label
python tools/nl_editor.py add game.ram.nl --address 0x00a5 --label "player_hp"

# Add with comment
python tools/nl_editor.py add game.ram.nl --address 0x00a5 --label "player_hp" --comment "Current HP (1 byte)"

# List labels
python tools/nl_editor.py list game.ram.nl
```

### Multi-Bank Management

```bash
# Create bank labels
python tools/nl_editor.py create-banks game --banks 8

# Add to specific bank
python tools/nl_editor.py add game.2.nl --address 0x8234 --label "update_status"
```

## Label Merge (`label_merge.py`)

Combine labels from multiple sources.

### Merge Operations

```bash
# Merge two files
python tools/label_merge.py merge file1.mlb file2.mlb --output merged.mlb

# Merge directory
python tools/label_merge.py merge-dir labels/ --output merged.mlb

# Merge with conflict resolution
python tools/label_merge.py merge file1.mlb file2.mlb --on-conflict keep-first
```

### Conflict Resolution

| Strategy | Description |
|----------|-------------|
| `keep-first` | Keep label from first file |
| `keep-last` | Keep label from last file |
| `keep-longer` | Keep longer label name |
| `error` | Fail on conflict |

## Symbol Table (`symbol_table.py`)

Comprehensive symbol table manager.

### Creating Symbol Tables

```bash
# Create empty table
python tools/symbol_table.py create symbols.json

# Import from disassembly
python tools/symbol_table.py import disasm.asm --output symbols.json

# Import from CDL + analysis
python tools/symbol_table.py analyze rom.nes --cdl game.cdl --output symbols.json
```

### Symbol Categories

Organize symbols by category:

```bash
# Add with category
python tools/symbol_table.py add symbols.json --address 0xc0a5 --label "player_hp" --category "player"

# List by category
python tools/symbol_table.py list symbols.json --category "player"

# Export category
python tools/symbol_table.py export symbols.json --category "enemies" --output enemies.mlb
```

### Cross-Reference

```bash
# Find references to address
python tools/symbol_table.py xref symbols.json --address 0xc0a5

# Find all calls to function
python tools/symbol_table.py xref symbols.json --label "update_status"

# Generate cross-reference report
python tools/symbol_table.py xref-report symbols.json --output xref.html
```

## Naming Conventions

### RAM Variables

```
player_hp           ; Player health points
player_mp           ; Player magic points
player_x            ; Player X position
player_y            ; Player Y position
enemy_count         ; Number of active enemies
battle_state        ; Current battle state
```

### Subroutines

```
init_game           ; Game initialization
update_player       ; Player update routine
draw_sprites        ; Sprite rendering
handle_input        ; Controller input handler
play_sound          ; Sound effect player
load_map            ; Map loading routine
```

### Data Tables

```
enemy_stats_table   ; Enemy statistics
item_data_table     ; Item definitions
map_pointers        ; Map data pointers
text_pointers       ; Text string pointers
sprite_data         ; Sprite definitions
```

### Naming Guidelines

1. **Use lowercase with underscores** - `player_hp` not `PlayerHP`
2. **Be descriptive** - `current_level` not `lvl`
3. **Include units if relevant** - `timer_frames` or `speed_pixels`
4. **Use prefixes for grouping** - `enemy_`, `player_`, `battle_`
5. **Document unknowns** - `unknown_$c0a5` for unidentified addresses

## Workflow

### Starting a New Game

1. Create base label files
2. Import any existing documentation
3. Add known system labels (NMI, Reset, IRQ)
4. Add obvious labels during initial analysis
5. Refine as understanding grows

### Maintaining Labels

```bash
# Regular backup
python tools/label_merge.py backup game.mlb

# Validate consistency
python tools/symbol_table.py validate symbols.json

# Generate documentation
python tools/symbol_table.py doc symbols.json --output labels.md
```

### Sharing Labels

```bash
# Export portable format
python tools/symbol_table.py export symbols.json --format ca65 --output game.inc

# Import contributed labels
python tools/label_merge.py merge my_labels.mlb contributed.mlb --output merged.mlb
```

## Best Practices

### Organization

```
project/
├── labels/
│   ├── game.mlb          # Main Mesen labels
│   ├── symbols.json      # Master symbol table
│   ├── exported/         # Exported formats
│   │   ├── game.nl
│   │   └── game.inc
│   └── contributions/    # Community contributions
```

### Version Control

- Commit label files with meaningful messages
- Document major label additions
- Keep backup of working labels before major changes
- Use JSON format for better diff visibility

### Collaboration

- Use consistent naming conventions
- Document ambiguous labels
- Include comments explaining purpose
- Separate confirmed vs speculative labels
