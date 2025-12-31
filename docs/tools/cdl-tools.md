# CDL Tools Guide

Tools for working with Code Data Logger (CDL) files from emulators like FCEUX and Mesen.

## Overview

CDL files track which ROM bytes have been executed as code, read as data, or rendered as graphics during emulation. These tools help analyze, edit, and convert CDL data.

## Tools

### cdl_analyzer.py

Analyze CDL files and generate coverage reports.

```bash
# Basic analysis
python tools/analyze_cdl.py analyze game.cdl

# Detailed report
python tools/analyze_cdl.py analyze game.cdl --verbose --output report.txt

# Find unlogged regions
python tools/analyze_cdl.py gaps game.cdl --min-size 16
```

**Options:**
- `--verbose` - Show detailed byte-by-byte breakdown
- `--output FILE` - Write report to file
- `--min-size N` - Minimum gap size to report

### cdl_visualizer.py

Generate visual coverage maps.

```bash
# PNG visualization
python tools/analyze_cdl.py visualize game.cdl --output coverage.png

# HTML report
python tools/analyze_cdl.py visualize game.cdl --format html --output coverage.html

# Bank-by-bank view
python tools/analyze_cdl.py visualize game.cdl --by-bank
```

**Color Legend:**
- 🔴 Red - Code (executed)
- 🔵 Blue - Data (read)
- 🟢 Green - Graphics (rendered)
- ⬛ Black - Unlogged

### cdl_converter.py

Convert between CDL formats.

```bash
# FCEUX to Mesen
python tools/converters/cdl_converter.py game.cdl --to mesen --output game.mesen.cdl

# Mesen to FCEUX
python tools/converters/cdl_converter.py game.cdl --to fceux --output game.fceux.cdl
```

### cdl_editor.py

Interactive CDL editor.

```bash
# Launch editor
python tools/analyze_cdl.py edit game.cdl

# Mark region as code
python tools/analyze_cdl.py mark game.cdl --start 0x8000 --end 0x80FF --type code

# Clear region
python tools/analyze_cdl.py clear game.cdl --start 0x8000 --end 0x80FF
```

### cdl_merge.py

Merge multiple CDL files.

```bash
# Merge CDL files
python tools/analyze_cdl.py merge session1.cdl session2.cdl --output merged.cdl

# Merge all CDL files in directory
python tools/analyze_cdl.py merge cdl_sessions/*.cdl --output combined.cdl
```

## CDL File Format

### FCEUX Format

Binary file with 1 byte per ROM byte:

| Bit | Meaning |
|-----|---------|
| 0 | Code |
| 1 | Data |
| 2 | Code (indirect) |
| 3 | Data (indirect) |
| 4 | PCM audio |
| 5 | Rendered |
| 6-7 | Reserved |

### Mesen Format

Similar structure with additional metadata header.

## Use Cases

### Finding Unused Code

```bash
# Generate gaps report
python tools/analyze_cdl.py gaps game.cdl --min-size 32 > unused.txt
```

### Coverage Percentage

```bash
# Quick coverage summary
python tools/analyze_cdl.py analyze game.cdl | grep "Coverage"
```

### Disassembly Prep

```bash
# Export code regions for disassembler
python tools/analyze_cdl.py export game.cdl --type code --output code_regions.txt
```

## See Also

- [Label Tools](label-tools.md) - Managing debug symbols
- [Analysis Tools](analysis-tools.md) - ROM analysis utilities
- [CDL Format Spec](../formats/cdl-format.md) - Detailed format documentation
