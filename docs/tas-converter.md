# TAS Replay Converter

A comprehensive TAS (Tool-Assisted Speedrun) replay file converter supporting all major SNES emulator formats.

## Overview

The TAS Converter allows you to convert movie/replay files between different SNES emulators. This is useful for:

- **Playing TAS files in different emulators** - Convert between Snes9x, BizHawk, lsnes, and Mesen2 formats
- **CDL Generation** - Convert TAS files to Mesen2 MMO format for Code Data Logger analysis
- **Archival** - Convert legacy formats to modern formats
- **Testing** - Verify TAS files play correctly across emulators

## Supported Formats

| Format | Extension | Emulator | Read | Write |
|--------|-----------|----------|------|-------|
| SMV | `.smv` | Snes9x | ✅ | ✅ |
| BKM | `.bkm` | BizHawk (legacy) | ✅ | ❌ |
| BK2 | `.bk2` | BizHawk | ✅ | ✅ |
| LSMV | `.lsmv` | lsnes | ✅ | ❌ |
| MMO | `.mmo` | Mesen2 | ❌ | ✅ |

## Installation

### Requirements

- Python 3.8 or later
- No additional dependencies (uses only standard library)

### Location

The converter is located at:
```
GameInfo/tools/tas/convert_tas_to_mmo.py
```

## CLI Usage

### Basic Syntax

```bash
python tools/tas/convert_tas_to_mmo.py [options]
```

### Options

| Option | Short | Description |
|--------|-------|-------------|
| `--input` | `-i` | Input TAS file to convert |
| `--input-dir` | `-d` | Input directory containing TAS files |
| `--output` | `-o` | Output directory for converted files (required) |
| `--format` | `-f` | Output format: `mmo`, `bk2`, or `smv` (default: `mmo`) |
| `--recursive` | `-r` | Recursively process subdirectories |
| `--rom` | | Optional ROM file for SHA1 calculation |
| `--no-organize` | | Don't organize output into game-name subdirectories |
| `--verbose` | `-v` | Verbose output |
| `--help` | `-h` | Show help message |

### Examples

#### Convert a single file to Mesen2 format:
```bash
python tools/tas/convert_tas_to_mmo.py -i speedrun.smv -o mesen-mmo/
```

#### Convert SMV to BizHawk BK2 format:
```bash
python tools/tas/convert_tas_to_mmo.py -i movie.smv -o bizhawk/ --format bk2
```

#### Convert BK2 back to SMV (round-trip test):
```bash
python tools/tas/convert_tas_to_mmo.py -i movie.bk2 -o snes9x/ --format smv
```

#### Batch convert all SNES TAS files:
```bash
python tools/tas/convert_tas_to_mmo.py -d ~/tas-files/SNES/ -o mesen-mmo/ -r
```

#### Convert without game-name organization:
```bash
python tools/tas/convert_tas_to_mmo.py -i movie.smv -o output/ --no-organize
```

#### Include ROM for SHA1 hash:
```bash
python tools/tas/convert_tas_to_mmo.py -i movie.smv -o output/ --rom game.sfc
```

## GUI Usage (Planned)

A graphical interface is planned for future versions. For now, use the CLI or integrate with other tools.

### Integration with VS Code Tasks

You can add a VS Code task to run conversions:

```json
{
    "label": "Convert TAS to MMO",
    "type": "shell",
    "command": "python",
    "args": [
        "${workspaceFolder}/tools/tas/convert_tas_to_mmo.py",
        "--input", "${file}",
        "--output", "${workspaceFolder}/~tas-files/mesen-mmo",
        "--format", "mmo"
    ],
    "problemMatcher": []
}
```

## Format Specifications

### SMV (Snes9x)

- **Type**: Binary
- **Signature**: `SMV\x1a` (4 bytes)
- **Structure**: 32-64 byte header + frame data
- **Frame data**: 2 bytes per controller per frame (little-endian)
- **Button bits**:
  - Low byte: `BYsSUDLR` (B=0x80, Y=0x40, Select=0x20, Start=0x10, Up=0x08, Down=0x04, Left=0x02, Right=0x01)
  - High byte: `AXLR----` (A=0x80, X=0x40, L=0x20, R=0x10)

### BK2 (BizHawk)

- **Type**: ZIP archive
- **Contents**:
  - `Header.txt` - Key-value metadata (Author, Platform, GameName, SHA1, etc.)
  - `Input Log.txt` - Text-based input log with LogKey header
  - `SyncSettings.json` - Emulator sync settings
  - `Comments.txt` - Author comments (may be empty)
  - `Subtitles.txt` - Subtitles (may be empty)
- **LogKey**: `#Reset|Power|#P1 Up|P1 Down|P1 Left|P1 Right|P1 Select|P1 Start|P1 Y|P1 B|P1 X|P1 A|P1 L|P1 R|`
- **Input format**: `|..|UDLRsSYBXAlr|` (12 characters per controller)
  - Positions 0-3: `U`, `D`, `L`, `R` (directions - uppercase)
  - Position 4: `s` (Select - lowercase)
  - Position 5: `S` (Start - uppercase)
  - Positions 6-9: `Y`, `B`, `X`, `A` (face buttons - uppercase)
  - Position 10: `l` (L shoulder - lowercase)
  - Position 11: `r` (R shoulder - lowercase)

### LSMV (lsnes)

- **Type**: ZIP archive
- **Contents**:
  - `input` - Frame input data
  - `gametype` - System type (e.g., `snes_ntsc`)
  - `gamename` - ROM name
  - `authors` - Author information
  - `rerecords` - Rerecord count
- **Input format**: `F. 0 0|BYsSudlrAXLR....|...` (16 characters per controller)

### MMO (Mesen2)

- **Type**: ZIP archive
- **Contents**:
  - `GameSettings.txt` - Emulator settings and ROM info
  - `Input.txt` - Frame input data
  - `MovieInfo.txt` - Optional metadata (Author, RerecordCount)
- **Input format**: `|ABXYLRSTUDLR|...` (12 characters per controller using GetKeyNames())

## Conversion Notes

### Data Preservation

- **Frame count**: Preserved exactly
- **Button presses**: Mapped between formats (functionally equivalent)
- **Rerecord count**: Preserved where supported
- **Author info**: Preserved where supported
- **ROM SHA1**: Included if ROM is provided or available in source

### Known Limitations

- **Savestate-anchored movies**: Currently not supported (power-on start only)
- **Controller types**: Only standard SNES controllers supported
- **Movie timing**: Assumes 60fps NTSC; PAL flag preserved where possible
- **Undefined bits**: Some formats have undefined bits that may not round-trip exactly

### Round-Trip Testing

When converting between formats and back, the button data is functionally identical. However:

- Undefined/padding bits in some formats may differ
- Header metadata may differ (timestamps, version strings)
- File size may differ due to compression and header differences

To verify a round-trip conversion:
```bash
# Original -> BK2 -> SMV
python tools/tas/convert_tas_to_mmo.py -i original.smv -o temp/ -f bk2 --no-organize
python tools/tas/convert_tas_to_mmo.py -i temp/original.bk2 -o temp/ -f smv --no-organize
# Compare frame counts and test playback
```

## Python API

The converter can also be used as a Python module:

```python
from pathlib import Path
import sys
sys.path.insert(0, 'tools/tas')
from convert_tas_to_mmo import (
    parse_smv, parse_bk2, parse_lsmv, parse_bkm,
    create_mmo_file, create_bk2_file, create_smv_file,
    detect_format
)

# Load a TAS file
input_path = Path("speedrun.smv")
fmt = detect_format(input_path)

if fmt == 'smv':
    movie = parse_smv(input_path)
elif fmt == 'bk2':
    movie = parse_bk2(input_path)
# ... etc

# Access movie data
print(f"Frames: {len(movie.frames)}")
print(f"Author: {movie.author}")
print(f"Rerecords: {movie.rerecord_count}")

# Convert to different format
create_bk2_file(movie, Path("output.bk2"))
```

## Related Tools

- **CDL Analyzer** (`tools/analyze_cdl.py`) - Analyze Code Data Logger coverage
- **ROM Analyzer** (`tools/rom_analyzer.py`) - Analyze ROM structure

## Resources

- [TASVideos SMV Format](https://tasvideos.org/EmulatorResources/Snes9x/SampleMovieFile)
- [TASVideos BK2 Format](https://tasvideos.org/Bizhawk/BK2Format)
- [TASVideos LSMV Format](https://tasvideos.org/Lsnes/Movieformat)
- [Mesen2 GitHub](https://github.com/SourMesen/Mesen2)

## Changelog

### v1.0.0 (2024-12-30)
- Initial release
- Support for SMV, BKM, BK2, LSMV input formats
- Support for MMO, BK2, SMV output formats
- Batch conversion with game-name organization
- Round-trip conversion verification
