# CDL Tools Guide

Complete guide to working with Code Data Logger (CDL) files.

## What is CDL?

Code Data Logger (CDL) files track which bytes in a ROM have been:
- **Executed as code** - CPU ran these bytes as instructions
- **Read as data** - Program read these bytes as data values
- **Logged by PCM** - Audio-related data access

CDL files are created by emulators during gameplay to help identify:
- Active code regions
- Data tables and assets
- Unused/unreferenced areas

## Supported Formats

| Emulator | Format | Extension |
|----------|--------|-----------|
| FCEUX | FCEUX CDL | `.cdl` |
| Mesen | Mesen CDL | `.cdl` |
| Mesen-S | SNES CDL | `.cdl` |
| bsnes/higan | bsnes CDL | `.cdl` |

## CDL Editor (`cdl_editor.py`)

Interactive editor for CDL files.

### Basic Usage

```bash
# Open CDL file
python tools/cdl_editor.py game.cdl

# View specific region
python tools/cdl_editor.py game.cdl --offset 0x8000 --length 0x100

# Set region type
python tools/cdl_editor.py game.cdl --set-code 0x8000 0x8100
python tools/cdl_editor.py game.cdl --set-data 0x8100 0x8200
```

### Region Management

```bash
# Mark region as code
python tools/cdl_editor.py game.cdl --mark code --start 0x8000 --end 0x8fff

# Mark region as data
python tools/cdl_editor.py game.cdl --mark data --start 0x9000 --end 0x9fff

# Clear region
python tools/cdl_editor.py game.cdl --clear --start 0xa000 --end 0xafff
```

## CDL Coverage (`cdl_coverage.py`)

Analyze CDL coverage and find unlogged regions.

### Generate Reports

```bash
# Text summary
python tools/cdl_coverage.py game.cdl

# HTML report with details
python tools/cdl_coverage.py game.cdl --report coverage.html

# JSON for processing
python tools/cdl_coverage.py game.cdl --format json --output coverage.json
```

### Find Gaps

```bash
# List unlogged regions
python tools/cdl_coverage.py game.cdl --find-gaps

# Filter by minimum size
python tools/cdl_coverage.py game.cdl --find-gaps --min-size 16

# Focus on specific bank
python tools/cdl_coverage.py game.cdl --find-gaps --bank 0x02
```

### Coverage Statistics

```bash
# Overall statistics
python tools/cdl_coverage.py game.cdl --stats

# Per-bank breakdown
python tools/cdl_coverage.py game.cdl --stats --per-bank

# Compare with ROM map
python tools/cdl_coverage.py game.cdl --compare rom_map.txt
```

## CDL Converter (`cdl_converter.py`)

Convert between different CDL formats.

### Format Conversion

```bash
# FCEUX to Mesen
python tools/cdl_converter.py game.cdl --from fceux --to mesen --output game_mesen.cdl

# Mesen to FCEUX
python tools/cdl_converter.py game.cdl --from mesen --to fceux --output game_fceux.cdl
```

### Batch Conversion

```bash
# Convert all CDL files in directory
python tools/batch_process.py convert --input cdl_files/ --output converted/ --to mesen
```

## CDL Visualizer (`cdl_visualizer.py`)

Generate visual coverage maps and heatmaps.

### Basic Visualization

```bash
# Generate PNG heatmap
python tools/cdl_visualizer.py game.cdl --output heatmap.png

# Specify dimensions
python tools/cdl_visualizer.py game.cdl --width 256 --height 512 --output heatmap.png
```

### Color Schemes

```bash
# Default (code=blue, data=green, both=yellow)
python tools/cdl_visualizer.py game.cdl --output heatmap.png

# Custom colors
python tools/cdl_visualizer.py game.cdl --code-color "#ff0000" --data-color "#00ff00"
```

### Overlay Options

```bash
# Add bank boundaries
python tools/cdl_visualizer.py game.cdl --show-banks --output heatmap.png

# Add address labels
python tools/cdl_visualizer.py game.cdl --show-addresses --output heatmap.png

# Add legend
python tools/cdl_visualizer.py game.cdl --legend --output heatmap.png
```

## CDL Build System (`cdl_build.py`)

Build system for managing CDL projects.

### Project Setup

```bash
# Initialize CDL project
python tools/cdl_build.py init --name "My Game CDL"

# Configure sources
python tools/cdl_build.py config --add-source session1.cdl
python tools/cdl_build.py config --add-source session2.cdl
```

### Building

```bash
# Merge all sources
python tools/cdl_build.py merge --output merged.cdl

# Build with verification
python tools/cdl_build.py build --verify

# Clean and rebuild
python tools/cdl_build.py clean
python tools/cdl_build.py build
```

## CDL File Format

### FCEUX CDL Format

| Byte Value | Meaning |
|------------|---------|
| `0x00` | Unlogged |
| `0x01` | Code |
| `0x02` | Data |
| `0x03` | Code + Data |
| `0x10` | Indirect code |
| `0x20` | Indirect data |

### Mesen CDL Format

Similar to FCEUX but includes additional flags for:
- PCM audio access
- DMA transfers
- Bank switching context

## Best Practices

### CDL Workflow

1. **Start fresh** - Begin with empty CDL for each game
2. **Play systematically** - Cover all game paths and menus
3. **Save regularly** - Export CDL periodically during sessions
4. **Merge sessions** - Combine multiple play sessions
5. **Analyze gaps** - Focus on unlogged regions for research

### Improving Coverage

- Visit all areas and trigger all events
- Open all menus and use all options
- Get all items and use all abilities
- Die in various ways (death handling code)
- Test all endings if multiple exist

### Organizing CDL Files

```
project/
├── cdl/
│   ├── sessions/         # Individual session CDLs
│   │   ├── 2024-01-15.cdl
│   │   └── 2024-01-16.cdl
│   ├── merged/           # Combined CDLs
│   │   └── complete.cdl
│   └── analysis/         # Analysis output
│       ├── coverage.html
│       └── heatmap.png
```
