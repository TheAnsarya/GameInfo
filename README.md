# GameInfo

All the information I have on the following games:

* Dragon Warrior/Dragon Quest:
	* NES:
		* Dragon Warrior (NES)
		* Dragon Warrior II (NES)
		* Dragon Warrior III (NES)
		* Dragon Warrior IV (NES)
	* SNES:
		* Dragon Quest I & II (SNES)
		* Dragon Quest III (SNES)
* Final Fantasy:
	* SNES:
		* Final Fantasy: Mystic Quest (SNES)

---

## Tools

A collection of tools for ROM hacking, game analysis, and reverse engineering.

### CDL Tools

Tools for working with Code Data Logger (CDL) files from emulators like FCEUX and Mesen.

| Tool | Description |
|------|-------------|
| `cdl_editor.py` | Interactive CDL editor with region management |
| `cdl_build.py` | Build system for CDL and label file projects |
| `cdl_visualizer.py` | Generate visual coverage maps and reports |
| `cdl_converter.py` | Convert between CDL formats (FCEUX ↔ Mesen) |
| `cdl_coverage.py` | Analyze coverage and find unlogged regions |

### Label Management

Tools for managing debug labels and symbol files.

| Tool | Description |
|------|-------------|
| `mlb_editor.py` | Create and edit Mesen label (.mlb) files |
| `nl_editor.py` | Create and edit FCEUX name list (.nl) files |
| `label_merge.py` | Merge labels from multiple sources |
| `symbol_table.py` | Comprehensive symbol table manager |

### ROM Analysis

Tools for analyzing ROM files and binary data.

| Tool | Description |
|------|-------------|
| `rom_analyzer.py` | Analyze ROM structure and header info |
| `rom_info.py` | Extract detailed ROM info (NES/SNES/GB) |
| `hex_finder.py` | Search for hex patterns and text strings |
| `disasm_export.py` | Export to IDA, Ghidra, ca65, etc. |

### Project Management

Tools for managing ROM hacking projects.

| Tool | Description |
|------|-------------|
| `config_manager.py` | Manage project configurations |
| `batch_process.py` | Batch processing for multiple files |
| `spaces_to_tabs.py` | Convert indentation to tabs |

### Usage Examples

#### Search for hex pattern in ROM:
```bash
python tools/hex_finder.py search game.nes --hex "4C ?? 80"
```

#### Convert MLB labels to NL format:
```bash
python tools/batch_process.py convert --input labels/ --output nl/ --to nl
```

#### Analyze CDL coverage:
```bash
python tools/cdl_coverage.py game.cdl --report coverage.html
```

#### Merge CDL files:
```bash
python tools/batch_process.py merge --input cdl_files/ --output merged.cdl
```

#### Get ROM information:
```bash
python tools/rom_info.py analyze game.nes --verbose
```

#### Initialize a new project:
```bash
python tools/config_manager.py init "My Game Hack" --type nes
```

---

## Wiki Documentation

Each game folder contains wiki-style documentation:

- **TBL files** - Text table definitions for encoding
- **Values** - Memory addresses and data structures
- **Notes** - Game-specific research and findings

---

## Contributing

This project uses tabs for indentation. See `.editorconfig` for details.
