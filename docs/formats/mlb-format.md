# MLB File Format Specification

Mesen Label (.mlb) file format documentation.

## Overview

MLB (Mesen Label) files store debug labels for the Mesen emulator. These files associate human-readable names with memory addresses.

## File Format

MLB files are plain text with one label per line.

### Line Format

```
TYPE:AAAAA:LABEL:COMMENT
```

| Field | Description |
|-------|-------------|
| TYPE | Single character type code |
| AAAAA | Hexadecimal address (variable length) |
| LABEL | Label name (no spaces) |
| COMMENT | Optional comment (can contain spaces) |

### Type Codes

| Code | Type | Address Range | Description |
|------|------|---------------|-------------|
| `G` | Global | Any | Global/general label |
| `R` | Register | `$0000-$001F` | CPU registers |
| `W` | Work RAM | `$0000-$07FF` | Internal RAM |
| `S` | Save RAM | `$6000-$7FFF` | Battery-backed SRAM |
| `P` | PRG ROM | `$8000-$FFFF` | Program ROM |
| `C` | CHR ROM | `$0000-$1FFF` | Character ROM |

## Examples

### Basic Labels

```
W:00A5:player_hp
W:00A6:player_mp
P:8000:reset_vector
P:8234:update_player:Main player update routine
```

### With Comments

```
W:00A5:player_hp:Current HP (0-255)
W:00A6:player_mp:Current MP (0-255)
P:8234:update_player:Called every frame
P:FFFA:nmi_vector:Non-maskable interrupt
P:FFFC:reset_vector:Reset vector
P:FFFE:irq_vector:IRQ/BRK vector
```

### Banked ROM Labels

For mappers with bank switching:

```
P:8000:bank0_start
P:C000:fixed_bank_start
```

## SNES MLB Format (Mesen-S)

SNES labels use 24-bit addresses:

```
P:C08000:reset_vector
W:7E0100:player_data
S:700000:save_data
```

### SNES Address Format

| Bank | Address | Full Address |
|------|---------|--------------|
| `$C0` | `$8000` | `C08000` |
| `$7E` | `$0100` | `7E0100` |
| `$70` | `$0000` | `700000` |

## Parsing MLB Files

### Python Parser

```python
def parse_mlb_line(line):
    """Parse a single MLB line."""
    line = line.strip()
    if not line or line.startswith('#'):
        return None
    
    parts = line.split(':')
    if len(parts) < 3:
        return None
    
    return {
        'type': parts[0],
        'address': int(parts[1], 16),
        'label': parts[2],
        'comment': parts[3] if len(parts) > 3 else ''
    }

def load_mlb_file(filename):
    """Load all labels from MLB file."""
    labels = []
    with open(filename, 'r') as f:
        for line in f:
            label = parse_mlb_line(line)
            if label:
                labels.append(label)
    return labels
```

### Writing MLB Files

```python
def format_mlb_line(label_dict):
    """Format label dictionary as MLB line."""
    line = f"{label_dict['type']}:{label_dict['address']:04X}:{label_dict['label']}"
    if label_dict.get('comment'):
        line += f":{label_dict['comment']}"
    return line

def save_mlb_file(filename, labels):
    """Save labels to MLB file."""
    with open(filename, 'w') as f:
        for label in labels:
            f.write(format_mlb_line(label) + '\n')
```

## Sorting and Organization

Labels are typically sorted by:
1. Type (W, S, P, C, etc.)
2. Address (ascending)

```python
def sort_labels(labels):
    type_order = {'R': 0, 'W': 1, 'S': 2, 'P': 3, 'C': 4, 'G': 5}
    return sorted(labels, key=lambda l: (type_order.get(l['type'], 99), l['address']))
```

## Best Practices

### Label Naming

- Use lowercase with underscores: `player_hp`
- Be descriptive: `current_level` not `lvl`
- Use prefixes for grouping: `enemy_`, `player_`
- No spaces in labels (use underscores)

### Comments

- Explain non-obvious labels
- Include data types: `(1 byte)`, `(2 bytes, little-endian)`
- Note relationships: `Used by update_player`

### File Organization

```
# Player Variables
W:00A5:player_hp:Current HP (1 byte)
W:00A6:player_mp:Current MP (1 byte)
W:00A7:player_x:X position (2 bytes)
W:00A9:player_y:Y position (2 bytes)

# Enemy Variables
W:0100:enemy_count:Number of active enemies
W:0101:enemy_data:Enemy data array (64 bytes)

# ROM Labels
P:8000:reset_handler:Main reset routine
P:8100:nmi_handler:VBlank handler
```

## References

- [Mesen Documentation](https://www.mesen.ca/)
- [Mesen GitHub](https://github.com/SourMesen/Mesen)
