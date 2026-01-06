# File Format Specifications

Documentation for file formats used in ROM hacking and emulator debugging.

## Supported Formats

### ROM Formats
| Format | Extension | Description |
|--------|-----------|-------------|
| [iNES](ines-format.md) | `.nes` | NES ROM format (iNES and NES 2.0) |
| [SFC/SMC](sfc-format.md) | `.sfc`, `.smc` | SNES ROM format |

### Debug/Editor Formats
| Format | Extension | Description |
|--------|-----------|-------------|
| [TBL](tbl-format.md) | `.tbl` | Text encoding tables for text extraction |
| [CDL](cdl-format.md) | `.cdl` | Code Data Logger files for tracking executed code |
| [MLB](mlb-format.md) | `.mlb` | Mesen label files for debugging |
| [NL](nl-format.md) | `.nl` | FCEUX name list files |

## Format Categories

### ROM Formats
- **iNES** - Standard NES ROM format with mapper support
- **SFC/SMC** - SNES ROM format (raw and with copier headers)

### Text Formats
- **TBL** - Maps byte values to text characters for game text extraction

### Debug Formats
- **CDL** - Tracks which ROM bytes are code vs data
- **MLB** - Defines symbolic labels for Mesen debugger
- **NL** - Defines symbolic labels for FCEUX debugger

## Related Documentation

- [TAS Formats](../tas-formats.md) - TAS movie file formats
- [SPC Format](../audio/spc-file-format.md) - SNES audio format
- [User Guides](../guides/) - Tool usage guides
- [Main Documentation Index](../README.md)
