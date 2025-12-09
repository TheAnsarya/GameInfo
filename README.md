# GameInfo

ROM hacking tools, game documentation, and Data Crystal wiki content for retro games.

## 📚 Documentation

### Game Documentation (`docs/`)

| Game | Platform | Documentation |
|------|----------|---------------|
| [Dragon Warrior](docs/dragon-warrior-nes/) | NES | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior II](docs/dragon-warrior-2-nes/) | NES | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior III](docs/dragon-warrior-3-nes/) | NES | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior IV](docs/dragon-warrior-4-nes/) | NES | ROM Map, RAM Map, Data Structures |
| [Dragon Quest I & II](docs/dragon-quest-1-2-snes/) | SNES | ROM Map, RAM Map, Data Structures |
| [Dragon Quest III](docs/dragon-quest-3-snes/) | SNES | ROM Map, RAM Map, Data Structures |
| [Final Fantasy Mystic Quest](docs/ffmq-snes/) | SNES | ROM Map, RAM Map, Data Structures |

### Wiki Content (`*/Wiki/`)

Data Crystal-style wikitext documentation:
- ROM Maps - Complete memory mapping
- RAM Maps - Variable and state tracking
- Data Structures - Table formats and layouts
- TBL Files - Text encoding tables

### Related Repositories

| Repository | Description |
|------------|-------------|
| [ffmq-info](https://github.com/TheAnsarya/ffmq-info) | Final Fantasy Mystic Quest disassembly |
| [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) | Dragon Warrior IV NES disassembly |

---

## 🛠️ GameInfo Tools Suite (.NET)

A comprehensive suite of .NET-based tools for ROM hacking, analysis, and documentation.

### Building the Tools

```bash
dotnet build
```

### Running the CLI

```bash
dotnet run --project src/GameInfoTools.Cli -- <command>
# Or after building:
./src/GameInfoTools.Cli/bin/Debug/net9.0/git <command>
```

### Available Commands

| Command | Description |
|---------|-------------|
| `rom info <file>` | Display ROM information (header, checksums, system type) |
| `rom checksum <file>` | Calculate/verify ROM checksums |
| `rom expand <file> <size>` | Expand ROM to specified size |
| `text extract <file>` | Extract text using text tables |
| `text insert <file>` | Insert translated text |
| `graphics chr <file>` | Extract CHR graphics data |
| `graphics tiles <file>` | Export/import tile graphics |
| `analysis opcodes <file>` | Find code by opcode patterns |
| `analysis map <file>` | Generate ROM content map |
| `data monsters <file>` | Edit monster statistics |
| `data items <file>` | Edit item data |
| `disasm bank <file> <n>` | Disassemble ROM bank |
| `list` | List available tools |

### Library Architecture

| Library | Purpose |
|---------|---------|
| `GameInfoTools.Core` | Core ROM operations, checksums, text tables, patterns |
| `GameInfoTools.Text` | String extraction, script compilation |
| `GameInfoTools.Graphics` | CHR editing, sprite extraction, palette management |
| `GameInfoTools.Data` | Data table editing (monsters, items, etc.) |
| `GameInfoTools.Analysis` | ROM analysis, cross-referencing |
| `GameInfoTools.Disassembly` | 6502/65816 disassembler |
| `GameInfoTools.Rom` | Bank management, IPS/BPS patching |
| `GameInfoTools.Cli` | Command-line interface |

### Test Suite

993 tests covering all libraries:

```bash
dotnet test
```

---

## 🐍 Python Tools

A collection of Python tools for ROM hacking, game analysis, and reverse engineering.

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
| `sprite_editor.py` | Extract/import sprites and sprite sheets |
| `pointers.py` | Scan, analyze, and extract via pointer tables |
| `string_table.py` | Manage string tables for translation |

### Patching and Comparison

Tools for ROM patches and comparison.

| Tool | Description |
|------|-------------|
| `rom_patch.py` | Create/apply IPS and BPS patches |
| `rom_diff.py` | Compare ROMs and generate diff reports |
| `compression.py` | Detect/decompress RLE, LZSS compression |
| `checksum.py` | Calculate and fix ROM checksums |

### Debugging and Tracing

Tools for execution analysis and debugging.

| Tool | Description |
|------|-------------|
| `trace_analyzer.py` | Analyze CPU execution traces (Mesen/FCEUX) |
| `savestate.py` | Analyze and compare emulator save states |
| `bank_analyzer.py` | Analyze ROM bank content types |
| `mapper_info.py` | NES mapper documentation and analysis |

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

#### Look up mapper info:
```bash
python tools/mapper_info.py lookup 4
```

#### Compare ROM versions:
```bash
python tools/rom_diff.py report original.nes modified.nes --output diff.html
```

#### Extract strings with TBL:
```bash
python tools/string_table.py extract game.nes --tbl table.tbl --pointer-table 0x8000 --count 100 --output strings.json
```

#### Create sprite sheet:
```bash
python tools/sprite_editor.py sheet game.nes --offset 0x10010 --count 256 --output sprites.png
```

#### Initialize a new project:
```bash
python tools/config_manager.py init "My Game Hack" --type nes
```

---

## 📖 Wiki Documentation

Each game folder contains Data Crystal-style wikitext documentation:

### Available Game Documentation

| Game | Wiki Folder | Content |
|------|-------------|---------|
| Dragon Warrior (NES) | [`Dragon Warrior (NES)/Wiki/`](Dragon%20Warrior%20(NES)/Wiki/) | TBL, Notes |
| Dragon Warrior 2 (NES) | [`Dragon Warrior 2 (NES)/Wiki/`](Dragon%20Warrior%202%20(NES)/Wiki/) | TBL, Notes |
| Dragon Warrior 3 (NES) | [`Dragon Warrior 3 (NES)/Wiki/`](Dragon%20Warrior%203%20(NES)/Wiki/) | TBL, Notes |
| Dragon Warrior 4 (NES) | [`Dragon Warrior 4 (NES)/Wiki/`](Dragon%20Warrior%204%20(NES)/Wiki/) | TBL, Debugging |
| Dragon Quest I & II (SNES) | [`Dragon Quest I & II (SNES)/Wiki/`](Dragon%20Quest%20I%20&%20II%20(SNES)/Wiki/) | TBL, Images |
| Dragon Quest III (SNES) | [`Dragon Quest III (SNES)/Wiki/`](Dragon%20Quest%20III%20(SNES)/Wiki/) | TBL, Docs, Debugging |
| Final Fantasy Mystic Quest | [`Final Fantasy Mystic Quest (SNES)/Wiki/`](Final%20Fantasy%20Mystic%20Quest%20(SNES)/Wiki/) | Notes |
| Chrono Trigger (SNES) | [`Chrono Trigger (SNES)/Wiki/`](Chrono%20Trigger%20(SNES)/Wiki/) | TBL |
| Final Fantasy IV (SNES) | [`Final Fantasy IV (SNES)/Wiki/`](Final%20Fantasy%20IV%20(SNES)/Wiki/) | Notes |

### Wiki File Types

| Extension | Description |
|-----------|-------------|
| `.wikitext` | Data Crystal wiki markup format |
| `.tbl` | Text encoding table (hex → character mapping) |
| `.mlb` | Mesen debug label files |
| `.nl` | FCEUX name list files |

### Template Files

Ready-to-use templates in [`Templates/`](Templates/):
- `Blank TBL file.wikitext` - Empty text table template
- `Blank TBL grid.wikitext` - Grid-format TBL template  
- `Blank Values table.wikitext` - Memory values template

---

## 📁 Project Structure

```
GameInfo/
├── ~docs/              # Development documentation (AI session logs, plans)
├── docs/               # Project documentation (guides, references)
├── tools/              # Python ROM hacking tools
├── Templates/          # Blank templates for new games
└── [Game Name]/        # Game-specific folders
    ├── Wiki/           # Data Crystal wikitext files
    ├── Debugging/      # Debug labels and notes
    └── Docs/           # Game documentation
```

---

## 🤝 Contributing

### Code Style
- **Indentation:** Tabs only (see `.editorconfig`)
- **Hex Values:** Always lowercase (`$9d`, `0xca6e`)
- **Commits:** Use conventional commit messages (`feat:`, `fix:`, `docs:`)
- **C# Style:** K&R braces, pattern matching, XML documentation

### Getting Started

#### .NET Tools (Recommended)
1. Clone the repository
2. Build: `dotnet build`
3. Run tests: `dotnet test`
4. Run CLI: `dotnet run --project src/GameInfoTools.Cli -- --help`

#### Python Tools
1. Clone the repository
2. Install Python requirements: `pip install -r requirements.txt`
3. Run any tool: `python tools/<tool_name>.py --help`

### Related Work
See also the game-specific disassembly repositories:
- [ffmq-info](https://github.com/TheAnsarya/ffmq-info) - Final Fantasy Mystic Quest
- [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) - Dragon Warrior IV NES

---

## 📋 License

This project is for educational and preservation purposes.
