# Python Tools Index

This directory contains documentation for all Python tools in the GameInfo toolkit.

## Tool Categories

| Category | Description | Guide |
|----------|-------------|-------|
| [CDL Tools](cdl-tools.md) | Code Data Logger file management | Analysis, conversion, visualization |
| [Label Tools](label-tools.md) | Debug label and symbol management | MLB, NL, merging |
| [Analysis Tools](analysis-tools.md) | ROM analysis and reverse engineering | Hex search, tracing, bank analysis |
| [Graphics Tools](graphics-tools.md) | Tile and sprite extraction | CHR, tiles, sprites |
| [Text Tools](text-tools.md) | Text extraction and translation | TBL, pointers, strings |
| [TAS Tools](../tas-converter.md) | TAS replay file conversion | Multi-format support |

## Quick Reference

### CDL Tools

```bash
# Edit CDL interactively
python tools/analyze_cdl.py edit game.cdl

# Visualize coverage
python tools/analyze_cdl.py visualize game.cdl --output coverage.png

# Convert FCEUX to Mesen format
python tools/converters/cdl_converter.py game.cdl --to mesen
```

### Label Tools

```bash
# Edit Mesen labels
python tools/editors/mlb_editor.py labels.mlb

# Convert MLB to NL
python tools/converters/label_converter.py labels.mlb --to nl

# Merge label files
python tools/editors/label_merge.py *.mlb --output merged.mlb
```

### Analysis Tools

```bash
# ROM information
python tools/rom/rom_info.py game.nes --verbose

# Search hex patterns
python tools/analysis/hex_finder.py game.nes --hex "4C ?? 80"

# Analyze ROM banks
python tools/analysis/bank_analyzer.py game.nes --output bank_map.txt
```

### Graphics Tools

```bash
# View tiles
python tools/graphics/tile_viewer.py game.nes --offset 0x10010

# Extract sprites
python tools/graphics/sprite_editor.py game.nes --output sprites.png
```

### Text Tools

```bash
# Extract text with TBL
python tools/text/text_extract.py game.nes --tbl table.tbl --output strings.txt

# Analyze pointer table
python tools/text/pointers.py game.nes --offset 0x8000 --count 20
```

## Tool Locations

All Python tools are located in `tools/` with subdirectories:

```
tools/
├── analysis/       # ROM analysis tools
├── assembly/       # Assembly-related tools
├── audio/          # Audio extraction
├── converters/     # Format converters
├── data/           # Data table tools
├── debug/          # Debugging utilities
├── editors/        # Interactive editors
├── graphics/       # Graphics tools
├── maps/           # Map-related tools
├── rom/            # ROM manipulation
├── tas/            # TAS converter
└── text/           # Text tools
```

## See Also

- [CLI Reference](cli-reference.md) - .NET CLI tool documentation
- [TAS Converter](../tas-converter.md) - TAS file conversion
- [Format Specifications](../formats/) - File format documentation
