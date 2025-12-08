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
# Show statistics
python cdl_editor.py game.cdl --info

# Show per-bank statistics
python cdl_editor.py game.cdl --bank-stats

# Find unused regions
python cdl_editor.py game.cdl --find-unused

# Export to JSON
python cdl_editor.py game.cdl --export-json stats.json

# Launch GUI
python cdl_editor.py --gui
python cdl_editor.py game.cdl --gui
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
# Merge multiple CDL files
python cdl_build.py merge output.cdl session1.cdl session2.cdl

# Create diff between two CDL files
python cdl_build.py diff old.cdl new.cdl --output changes.cdl

# Validate CDL file
python cdl_build.py validate game.cdl --rom game.nes

# Generate HTML coverage report
python cdl_build.py report game.cdl --output report.html

# Build from config
python cdl_build.py build cdl_build_config.json
```

**Configuration File Format:**
```json
{
    "name": "ProjectName",
    "output_dir": "build/cdl",
    "sources": [
        "path/to/file1.cdl",
        {"path": "path/to/*.cdl", "description": "Multiple files"}
    ],
    "rom_file": "path/to/game.nes",
    "expected_size": 524288,
    "generate_report": true,
    "backup_existing": true
}
```

## File Format Documentation

See the Wiki documentation in `General/Wiki/`:
- [CDL File Format](../General/Wiki/CDL%20File%20Format.wikitext) - Complete CDL format specification

## Requirements

- Python 3.7+
- tkinter (optional, for GUI)

## Installation

No installation required. Run scripts directly with Python.

```bash
cd tools
python cdl_editor.py --help
python cdl_build.py --help
```
