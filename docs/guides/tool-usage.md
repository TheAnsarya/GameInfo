# Tool Usage Guide

Comprehensive guide to using the GameInfo ROM hacking tools.

## Installation

```bash
# Clone the repository
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo

# Install dependencies
pip install -r requirements.txt
```

## Quick Start

### Getting Help

Every tool supports `--help` for usage information:

```bash
python tools/<tool_name>.py --help
```

### Common Options

Most tools support these common options:

| Option | Description |
|--------|-------------|
| `--verbose` / `-v` | Enable verbose output |
| `--output` / `-o` | Specify output file/directory |
| `--format` / `-f` | Output format selection |

## Tool Categories

### Analysis Tools

Tools for examining ROM contents:

- `rom_info.py` - Get ROM header and metadata
- `rom_analyzer.py` - Deep ROM structure analysis
- `hex_finder.py` - Search for patterns and text
- `bank_analyzer.py` - Analyze ROM bank contents

### CDL Tools

Tools for Code Data Logger files:

- `cdl_editor.py` - Edit CDL coverage data
- `cdl_converter.py` - Convert between formats
- `cdl_coverage.py` - Generate coverage reports
- `cdl_visualizer.py` - Visual coverage maps

### Label Tools

Tools for debug label management:

- `mlb_editor.py` - Mesen label files
- `nl_editor.py` - FCEUX name list files
- `label_merge.py` - Combine label sources

### Extraction Tools

Tools for extracting game data:

- `text_extract.py` - Extract text with TBL
- `tile_viewer.py` - View/extract graphics
- `sprite_editor.py` - Sprite extraction
- `pointers.py` - Pointer table analysis

## Workflow Examples

### Starting a New Game Project

```bash
# 1. Create project structure
python tools/project_gen.py create "My-Game" --type nes

# 2. Get ROM information
python tools/rom_info.py analyze game.nes --verbose

# 3. Analyze ROM structure
python tools/rom_analyzer.py game.nes --output analysis/

# 4. Start documenting
python tools/memory_map.py generate game.nes --output docs/
```

### Working with CDL Files

```bash
# 1. Analyze coverage
python tools/cdl_coverage.py game.cdl --report coverage.html

# 2. Find unlogged regions
python tools/cdl_coverage.py game.cdl --find-gaps

# 3. Merge multiple sessions
python tools/batch_process.py merge --input cdl_files/ --output merged.cdl

# 4. Generate visualization
python tools/cdl_visualizer.py game.cdl --output heatmap.png
```

### Text Extraction

```bash
# 1. Find text patterns
python tools/hex_finder.py search game.nes --text "THE "

# 2. Analyze pointer table
python tools/pointers.py analyze game.nes --offset 0x8000 --count 50

# 3. Extract strings
python tools/text_extract.py game.nes --tbl table.tbl --output strings.txt

# 4. Create translation table
python tools/string_table.py extract game.nes --pointer-table 0x8000 --output strings.json
```

## Best Practices

### Hex Value Conventions

Always use lowercase for hex values:
- ✅ Correct: `0x8000`, `$9d`, `0xca6e`
- ❌ Wrong: `0x8000`, `$9D`, `0xCA6E`

### File Organization

```
my-game-project/
├── roms/           # Original ROM files
├── cdl/            # Code Data Logger files
├── labels/         # Debug label files
├── analysis/       # Analysis output
├── assets/         # Extracted assets
│   ├── graphics/
│   ├── text/
│   └── audio/
└── docs/           # Documentation
```

### Version Control

- Commit CDL files regularly to track progress
- Don't commit original ROM files (copyrighted)
- Include extracted data as JSON/text for diffing
