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
| `data_table.py` | Detect and analyze data tables |
| `memory_map.py` | Generate memory map documentation |

### Text and Graphics

Tools for game text and graphics.

| Tool | Description |
|------|-------------|
| `text_extract.py` | Extract game text with TBL support |
| `tile_viewer.py` | View/extract graphics tiles (NES/SNES/GB) |
| `pointers.py` | Scan, analyze, and extract via pointer tables |

### Patching and Compression

Tools for ROM patches and compression.

| Tool | Description |
|------|-------------|
| `rom_patch.py` | Create/apply IPS and BPS patches |
| `compression.py` | Detect/decompress RLE, LZSS compression |
| `checksum.py` | Calculate and fix ROM checksums |

### Debugging and Tracing

Tools for execution analysis and debugging.

| Tool | Description |
|------|-------------|
| `trace_analyzer.py` | Analyze CPU execution traces (Mesen/FCEUX) |
| `savestate.py` | Analyze and compare emulator save states |
| `bank_analyzer.py` | Analyze ROM bank content types |

### Project Management

Tools for managing ROM hacking projects.

| Tool | Description |
|------|-------------|
| `config_manager.py` | Manage project configurations |
| `batch_process.py` | Batch processing for multiple files |
| `project_gen.py` | Generate project scaffolding |
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

#### Analyze pointer table:
```bash
python tools/pointers.py analyze game.nes --offset 0x8000 --count 20
```

#### Detect compression:
```bash
python tools/compression.py detect game.nes --offset 0x10000
```

#### Calculate ROM checksums:
```bash
python tools/checksum.py calculate game.nes
```

#### Analyze save states:
```bash
python tools/savestate.py compare state1.mss state2.mss --section RAM
```

#### Analyze ROM banks:
```bash
python tools/bank_analyzer.py map game.nes --output bank_map.txt
```

#### Create new project:
```bash
python tools/project_gen.py create "My-Game-Hack" --type nes
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
