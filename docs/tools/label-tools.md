# Label Tools Guide

Tools for managing debug labels and symbol files for emulators.

## Overview

Debug labels provide human-readable names for ROM addresses, making disassembly and debugging easier. These tools support multiple label formats.

## Supported Formats

| Format | Extension | Emulator | Description |
|--------|-----------|----------|-------------|
| MLB | `.mlb` | Mesen | Mesen label format |
| NL | `.nl` | FCEUX | FCEUX name list |
| SYM | `.sym` | Various | Generic symbol file |
| DBG | `.dbg` | ca65 | cc65/ca65 debug info |

## Tools

### mlb_editor.py

Create and edit Mesen label files.

```bash
# Create new label file
python tools/editors/mlb_editor.py create game.mlb

# Add label
python tools/editors/mlb_editor.py add game.mlb --address 0x8000 --name "Reset" --type code

# List labels
python tools/editors/mlb_editor.py list game.mlb

# Export to text
python tools/editors/mlb_editor.py export game.mlb --output labels.txt
```

**Label Types:**
- `code` - Function/subroutine entry
- `data` - Data table
- `ram` - RAM variable
- `comment` - Code comment

### nl_editor.py

Create and edit FCEUX name list files.

```bash
# Create NL file
python tools/editors/nl_editor.py create game.nes.0.nl

# Add label
python tools/editors/nl_editor.py add game.nes.0.nl --address 0x8000 --name "Reset"

# Import from text
python tools/editors/nl_editor.py import game.nes.0.nl --input labels.txt
```

### label_converter.py

Convert between label formats.

```bash
# MLB to NL
python tools/converters/label_converter.py labels.mlb --to nl --output labels.nl

# NL to MLB
python tools/converters/label_converter.py labels.nl --to mlb --output labels.mlb

# MLB to SYM
python tools/converters/label_converter.py labels.mlb --to sym --output labels.sym
```

### label_merge.py

Merge labels from multiple sources.

```bash
# Merge MLB files
python tools/editors/label_merge.py labels1.mlb labels2.mlb --output merged.mlb

# Merge with conflict resolution
python tools/editors/label_merge.py *.mlb --output merged.mlb --on-conflict keep-first
```

**Conflict Options:**
- `keep-first` - Keep first occurrence
- `keep-last` - Keep last occurrence
- `rename` - Rename duplicates with suffix
- `error` - Stop on conflict

## MLB File Format

Mesen label files are JSON:

```json
{
  "Labels": [
    {
      "Address": 32768,
      "AddressType": "PrgRom",
      "Label": "Reset",
      "Comment": "Entry point"
    }
  ]
}
```

**AddressType Values:**
- `PrgRom` - PRG ROM address
- `WorkRam` - Work RAM
- `SaveRam` - Save RAM
- `Register` - Hardware register

## NL File Format

FCEUX name lists are text-based:

```
$8000#Reset#Entry point
$8003#NMI#VBlank handler
$C000#Data_Monsters#Monster stat table
```

Format: `$ADDRESS#LABEL#COMMENT`

## Workflow Example

### Starting a New Project

```bash
# 1. Create label file
python tools/editors/mlb_editor.py create game.mlb

# 2. Add known addresses
python tools/editors/mlb_editor.py add game.mlb --address 0x8000 --name "Reset"
python tools/editors/mlb_editor.py add game.mlb --address 0xFFFC --name "ResetVector"

# 3. Import from disassembly notes
python tools/editors/mlb_editor.py import game.mlb --input notes.txt
```

### Sharing Labels

```bash
# Export for others using FCEUX
python tools/converters/label_converter.py game.mlb --to nl --output game.nes.0.nl

# Import their additions
python tools/converters/label_converter.py their_labels.nl --to mlb --output their.mlb
python tools/editors/label_merge.py game.mlb their.mlb --output merged.mlb
```

## See Also

- [CDL Tools](cdl-tools.md) - Code Data Logger tools
- [Analysis Tools](analysis-tools.md) - ROM analysis utilities
- [MLB Format Spec](../formats/mlb-format.md) - Detailed format documentation
- [NL Format Spec](../formats/nl-format.md) - FCEUX format documentation
