# GameInfo Tools

Collection of tools for analyzing and editing game data files.

## CDL Tools

### cdl_editor.py

A comprehensive CDL (Code/Data Logger) file editor and analyzer.

**Features:**
- View and edit CDL files from FCEUX, Mesen, and other emulators
- Statistics and coverage analysis
- GUI and command-line interfaces
- Export to CSV/JSON formats
- Merge multiple CDL files

**Usage:**
```bash
python cdl_editor.py game.cdl --info                    # Show statistics
python cdl_editor.py game.cdl --bank-stats              # Per-bank statistics
python cdl_editor.py game.cdl --find-unused             # Find unused regions
python cdl_editor.py game.cdl --export-json stats.json  # Export to JSON
python cdl_editor.py --gui                              # Launch GUI
```

### cdl_build.py

Build system for managing CDL files across projects.

**Features:**
- Merge multiple CDL files from different sessions
- Create differential CDL files
- Validate CDL files against ROM sizes
- Generate HTML coverage reports
- Build from JSON configuration files

**Usage:**
```bash
python cdl_build.py merge output.cdl file1.cdl file2.cdl
python cdl_build.py diff old.cdl new.cdl --output changes.cdl
python cdl_build.py validate game.cdl --rom game.nes
python cdl_build.py report game.cdl --output report.html
python cdl_build.py build cdl_build_config.json
```

### cdl_visualizer.py

Generate heatmap visualizations of CDL coverage.

**Usage:**
```bash
python cdl_visualizer.py game.cdl --output heatmap.html --format html
python cdl_visualizer.py game.cdl --output heatmap.png --format png
python cdl_visualizer.py game.cdl --output heatmap.svg --format svg
```

### cdl_converter.py

Convert CDL files between emulator formats.

**Usage:**
```bash
python cdl_converter.py input.cdl --to mesen --output output.cdl
python cdl_converter.py input.cdl --to fceux --output output.cdl
python cdl_converter.py input.cdl --to bizhawk --output output.cdl
```

### cdl_coverage.py

Track CDL coverage over time for CI/CD integration.

**Usage:**
```bash
python cdl_coverage.py init --project "MyGame"
python cdl_coverage.py add game.cdl --name "v1.0"
python cdl_coverage.py report --format html --output report.html
python cdl_coverage.py ci game.cdl --fail-on-regression
```

## Label Tools

### mlb_editor.py

Editor for Mesen MLB label files.

**Features:**
- View and edit labels with GUI or CLI
- Import from NL (FCEUX) format
- Export to NL format
- Label validation and statistics

**Usage:**
```bash
python mlb_editor.py --gui                              # Launch GUI
python mlb_editor.py labels.mlb --stats                 # Show statistics
python mlb_editor.py --import-nl file.nl --output labels.mlb
```

### nl_editor.py

Editor for FCEUX NL (Name List) files.

**Features:**
- View and edit labels with GUI or CLI
- Manage multiple bank files for a ROM
- Import/export MLB format
- Project-wide label management

**Usage:**
```bash
python nl_editor.py --gui                               # Launch GUI
python nl_editor.py --rom game.nes                      # Load all NL files for ROM
python nl_editor.py file.nl --stats                     # Show statistics
```

### label_merge.py

Merge, compare, and synchronize label files across formats.

**Features:**
- Merge multiple label files with conflict resolution
- Compare label sets and generate reports
- Convert between MLB, NL, JSON, ASM formats

**Usage:**
```bash
python label_merge.py merge file1.mlb file2.nl --output merged.mlb
python label_merge.py compare file1.mlb file2.mlb --report diff.md
python label_merge.py sync labels.mlb --to-nl ./nl_dir --to-json labels.json
python label_merge.py convert input.nl --format mlb --output output.mlb
```

## ROM Analysis

### rom_analyzer.py

Analyze NES ROMs using CDL data.

**Features:**
- iNES header parsing
- Code/data region identification
- 6502 opcode analysis
- Label generation for MLB/NL formats

**Usage:**
```bash
python rom_analyzer.py game.nes
python rom_analyzer.py game.nes --cdl game.cdl --output-mlb labels.mlb
```

## File Format Documentation

See the Wiki documentation in `General/Wiki/`:
- [CDL File Format](../General/Wiki/CDL%20File%20Format.wikitext)
- [MLB File Format](../General/Wiki/MLB%20File%20Format.wikitext)
- [NL File Format](../General/Wiki/NL%20File%20Format.wikitext)

## Requirements

- Python 3.8+
- tkinter (optional, for GUI)
- PIL/Pillow (optional, for image export)

## CI/CD Integration

The `.github/workflows/cdl-tools.yml` workflow provides:
- Automated testing across Python 3.9-3.12
- Code linting with flake8/pylint
- Coverage reporting with codecov
- Integration tests
- Release packaging
