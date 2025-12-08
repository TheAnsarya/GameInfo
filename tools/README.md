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

## Symbol and Label Management

### symbol_table.py

Advanced symbol table manager for disassembly projects.

**Features:**
- Cross-reference analysis
- Symbol import/export
- Multiple format support
- Automatic label generation

**Usage:**
```bash
python symbol_table.py add labels.json --name "read_joy" --address 0x8000 --type code
python symbol_table.py export labels.json --format mlb --output labels.mlb
python symbol_table.py import labels.mlb labels.json
python symbol_table.py analyze labels.json --rom game.nes
```

### label_converter.py

Convert between different label file formats.

**Usage:**
```bash
python label_converter.py input.mlb -o output.nl -t nl
python label_converter.py input.nl -o output.sym -t sym
python label_converter.py input.json -o output.asm -t asm
```

## Disassembly Tools

### disasm_export.py

Export disassembly data in various formats.

**Usage:**
```bash
python disasm_export.py game.nes --cdl game.cdl --mlb labels.mlb --output disasm/
python disasm_export.py game.nes --format ca65 --output game.s
```

### asm_helper.py

6502/65816 assembly quick reference and utilities.

**Usage:**
```bash
python asm_helper.py info LDA            # Show opcode info
python asm_helper.py modes LDA           # Show addressing modes
python asm_helper.py list --group branch # List branch instructions
python asm_helper.py disasm A9 00 8D 00 20  # Disassemble bytes
python asm_helper.py analyze code.bin    # Analyze code for patterns
```

### script_disasm.py

Disassemble game scripting bytecode systems.

**Usage:**
```bash
python script_disasm.py disasm script.bin -d script_def.json -o script.txt
python script_disasm.py analyze script.bin -d script_def.json
python script_disasm.py create -o script_def.json  # Create template
```

## Text and String Tools

### text_extract.py

Extract text from ROMs with custom encoding tables.

**Usage:**
```bash
python text_extract.py game.nes --tbl game.tbl --output text/
python text_extract.py game.nes --tbl game.tbl --pointers 0x8000 --count 100
```

### string_table.py

Manage game text string tables.

**Usage:**
```bash
python string_table.py extract game.nes --tbl game.tbl --output strings.json
python string_table.py import strings.json --tbl game.tbl --output patched.nes
python string_table.py analyze strings.json --report
```

### dte_compress.py

DTE/MTE text compression for ROM hacking.

**Usage:**
```bash
python dte_compress.py generate text.txt -o dte_table.tbl --start 80 --end FE
python dte_compress.py compress text.txt -o text.bin --dte dte_table.tbl --tbl game.tbl
python dte_compress.py decompress text.bin -o text.txt --dte dte_table.tbl
python dte_compress.py analyze text.txt --top 50
```

### control_codes.py

Parse and document text control codes.

**Usage:**
```bash
python control_codes.py analyze text.bin --suggest
python control_codes.py parse text.bin -o text.txt --codes codes.json --tbl game.tbl
python control_codes.py document --codes codes.json -o docs.md
python control_codes.py create -o codes_template.json
```

## Graphics Tools

### tile_viewer.py

View and export tile graphics from ROMs.

**Usage:**
```bash
python tile_viewer.py game.nes --bank 0 --output tiles.png
python tile_viewer.py game.chr --bpp 2 --palette "0F,00,10,30"
```

### chr_extractor.py

Extract CHR graphics data from NES/SNES ROMs.

**Usage:**
```bash
python chr_extractor.py game.nes --output chr/        # Extract all CHR banks
python chr_extractor.py game.nes --bank 0 -o bank0.png
python chr_extractor.py game.nes --info              # Show CHR info
python chr_extractor.py game.nes --raw -o chr.bin    # Export raw CHR data
```

### sprite_editor.py

Extract and import sprites from ROMs.

**Usage:**
```bash
python sprite_editor.py extract game.nes --chr-offset 0x10000 -o sprites/
python sprite_editor.py sheet game.nes --tiles 0,1,2,3 --size 16x16 -o sheet.png
python sprite_editor.py import sprites/ --rom game.nes -o patched.nes
```

### animation_viewer.py

View and export sprite animations.

**Usage:**
```bash
python animation_viewer.py --chr game.nes --def anim.json --gif -o walk.gif
python animation_viewer.py --chr game.nes --def anim.json --sheet -o spritesheet.png
python animation_viewer.py --sample -o anim_template.json
```

### palette.py

NES/SNES palette editor and converter.

**Usage:**
```bash
python palette.py extract game.nes --offset 0x1C000 -o palettes.json
python palette.py view palettes.json --output preview.png
python palette.py convert palettes.json --format gpl -o palettes.gpl
python palette.py edit palettes.json --index 0 --color 1 --value 15
```

### metatile_editor.py

Edit metatiles and tilemaps.

**Usage:**
```bash
python metatile_editor.py view nametable.bin --chr game.nes -o tilemap.png
python metatile_editor.py metatiles meta.bin --chr game.nes -o metatiles.png
python metatile_editor.py export nametable.bin -o tilemap.json
python metatile_editor.py create -o empty_tilemap.json
```

## ROM Analysis and Patching

### rom_info.py

Display ROM header information and statistics.

**Usage:**
```bash
python rom_info.py game.nes
python rom_info.py game.sfc --json
python rom_info.py game.gb --format detailed
```

### rom_patch.py

Apply and create IPS/BPS patches.

**Usage:**
```bash
python rom_patch.py apply patch.ips game.nes --output patched.nes
python rom_patch.py create original.nes modified.nes --output patch.ips
python rom_patch.py info patch.ips
```

### rom_diff.py

Compare ROM versions and generate diff reports.

**Usage:**
```bash
python rom_diff.py original.nes modified.nes -o diff_report.html
python rom_diff.py v1.nes v2.nes --json -o changes.json
python rom_diff.py game_us.nes game_jp.nes --bank-by-bank
```

### checksum.py

Calculate and verify ROM checksums.

**Usage:**
```bash
python checksum.py game.nes                    # Calculate all checksums
python checksum.py game.nes --verify --db checksums.json
python checksum.py game.sfc --fix              # Fix internal checksum
```

### bank_analyzer.py

Analyze ROM bank contents.

**Usage:**
```bash
python bank_analyzer.py game.nes --cdl game.cdl -o bank_report.md
python bank_analyzer.py game.nes --bank 5 --detailed
python bank_analyzer.py game.nes --free-space
```

### mapper_info.py

NES mapper documentation lookup.

**Usage:**
```bash
python mapper_info.py 4                        # Show MMC3 info
python mapper_info.py --rom game.nes           # Detect and show mapper
python mapper_info.py --list                   # List all mappers
python mapper_info.py 1 --registers            # Show MMC1 registers
```

## Memory and Analysis Tools

### memory_map.py

Generate memory map documentation.

**Usage:**
```bash
python memory_map.py generate --labels labels.mlb --output memory_map.md
python memory_map.py --platform nes --output nes_memory.md
python memory_map.py --json labels.json --format html -o memory_map.html
```

### pointers.py

Analyze pointer tables in ROMs.

**Usage:**
```bash
python pointers.py find game.nes --start 0x8000 --count 50
python pointers.py analyze game.nes --offset 0x8100 --type word
python pointers.py extract game.nes --table 0x8200 -o pointers.json
```

### hex_finder.py

Search for hex patterns and text in ROMs.

**Usage:**
```bash
python hex_finder.py game.nes --pattern "AD 00 20"    # Find pattern
python hex_finder.py game.nes --text "DRAGON" --tbl game.tbl
python hex_finder.py game.nes --relative "HELLO"     # Relative search
```

### data_table.py

Analyze and extract data tables.

**Usage:**
```bash
python data_table.py analyze game.nes --offset 0xC000 --entry-size 8 --count 16
python data_table.py extract game.nes --offset 0xC000 --schema table_def.json
python data_table.py document game.nes --offset 0xC000 -o table_docs.md
```

## Audio Tools

### nsf_info.py

Analyze NSF (NES Sound Format) music files.

**Usage:**
```bash
python nsf_info.py game.nsf                    # Show NSF info
python nsf_info.py game.nsf --tracks           # List all tracks
python nsf_info.py game.nsf --m3u -o game.m3u  # Export M3U playlist
python nsf_info.py game.nsf --json -v          # Detailed JSON output
```

### spc_info.py

Analyze SPC (SNES Sound Format) music files.

**Usage:**
```bash
python spc_info.py game.spc                    # Show SPC info
python spc_info.py game.spc -v                 # Show DSP analysis
python spc_info.py game.spc --samples          # List BRR samples
python spc_info.py game.spc --json             # JSON output
```

## Compression Tools

### compression.py

RLE and LZ compression utilities.

**Usage:**
```bash
python compression.py compress data.bin --method rle -o compressed.bin
python compression.py decompress compressed.bin --method lzss -o data.bin
python compression.py analyze data.bin         # Detect compression type
```

## Debug and Trace Tools

### trace_analyzer.py

Analyze emulator execution traces.

**Usage:**
```bash
python trace_analyzer.py trace.log --find-loops
python trace_analyzer.py trace.log --call-graph -o calls.dot
python trace_analyzer.py trace.log --hot-spots --top 20
```

### savestate.py

Analyze and compare emulator save states.

**Usage:**
```bash
python savestate.py info save.state
python savestate.py compare save1.state save2.state -o diff.json
python savestate.py extract save.state --ram -o ram_dump.bin
```

## Project Tools

### project_gen.py

Generate ROM hacking project scaffolds.

**Usage:**
```bash
python project_gen.py create "My Project" --rom game.nes --type disasm
python project_gen.py create "My Hack" --rom game.nes --type hack
python project_gen.py init --template translation
```

### batch_process.py

Batch process multiple files.

**Usage:**
```bash
python batch_process.py *.cdl --merge --output combined.cdl
python batch_process.py *.nes --command "rom_info.py {}"
python batch_process.py roms/ --ext nes --checksum
```

### config_manager.py

Manage tool configuration across projects.

**Usage:**
```bash
python config_manager.py init                  # Create default config
python config_manager.py set paths.roms ./roms
python config_manager.py get paths.output
python config_manager.py list
```

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
