# GameInfo

**ROM hacking tools, documentation, and wiki content for retro games.**

[![.NET](https://img.shields.io/badge/.NET-10.0-512BD4)](https://dotnet.microsoft.com/)
[![Python](https://img.shields.io/badge/Python-3.11+-3776AB)](https://python.org/)
[![License](https://img.shields.io/badge/License-Educational-green)](LICENSE)

## Quick Links

| Section | Description |
|---------|-------------|
| [🛠️ Tools](#-tools) | .NET CLI and Python utilities |
| [📚 Documentation](#-documentation) | Game docs, ROM/RAM maps |
| [🎮 Game Projects](#-game-projects) | Per-game disassembly and tools |
| [📺 TAS Converter](#-tas-converter) | Multi-format TAS replay converter |
| [🤝 Contributing](#-contributing) | Code style and workflow |

---

## 🛠️ Tools

### .NET Tools (GameInfoTools)

A comprehensive CLI toolkit for ROM hacking built on .NET 10.

```bash
# Build
dotnet build

# Run CLI
dotnet run --project src/GameInfoTools.Cli -- <command>

# Run tests (993 tests)
dotnet test
```

#### Commands

| Command | Description |
|---------|-------------|
| `rom info <file>` | ROM header, checksums, system detection |
| `rom checksum <file>` | Calculate/verify checksums |
| `rom expand <file> <size>` | Expand ROM size |
| `text extract <file>` | Extract text with TBL tables |
| `graphics chr <file>` | Extract CHR/tile data |
| `analysis map <file>` | Generate ROM content map |
| `disasm bank <file> <n>` | Disassemble ROM bank |

📖 **[Full CLI Documentation](docs/tools/cli-reference.md)**

### Python Tools

Specialized tools for analysis, debugging, and conversion.

| Category | Tools | Documentation |
|----------|-------|---------------|
| **CDL** | `cdl_editor.py`, `cdl_visualizer.py`, `cdl_converter.py` | [CDL Tools Guide](docs/tools/cdl-tools.md) |
| **Labels** | `mlb_editor.py`, `nl_editor.py`, `label_merge.py` | [Label Tools Guide](docs/tools/label-tools.md) |
| **Analysis** | `rom_analyzer.py`, `hex_finder.py`, `trace_analyzer.py` | [Analysis Tools Guide](docs/tools/analysis-tools.md) |
| **Graphics** | `tile_viewer.py`, `sprite_editor.py` | [Graphics Tools Guide](docs/tools/graphics-tools.md) |
| **Text** | `text_extract.py`, `pointers.py`, `string_table.py` | [Text Tools Guide](docs/tools/text-tools.md) |
| **TAS** | `convert_tas_to_mmo.py`, `tas_converter.py` | [TAS Converter](docs/tas-converter.md) |

📖 **[Python Tools Index](docs/tools/README.md)**

---

## 📚 Documentation

### Game Documentation

| Game | Platform | Links |
|------|----------|-------|
| Dragon Warrior | NES | [ROM Map](docs/dragon-warrior-nes/) • [Wiki](Games/NES/Dragon%20Warrior/Wiki/) |
| Dragon Warrior II | NES | [ROM Map](docs/dragon-warrior-2-nes/) • [Wiki](Games/NES/Dragon%20Warrior%202/Wiki/) |
| Dragon Warrior III | NES | [ROM Map](docs/dragon-warrior-3-nes/) • [Wiki](Games/NES/Dragon%20Warrior%203/Wiki/) |
| Dragon Warrior IV | NES | [ROM Map](docs/dragon-warrior-4-nes/) • [Disasm](https://github.com/TheAnsarya/dragon-warrior-4-info) |
| Dragon Quest I & II | SNES | [ROM Map](docs/dragon-quest-1-2-snes/) • [Wiki](Games/SNES/Dragon%20Quest%20I%20&%20II/Wiki/) |
| Dragon Quest III | SNES | [ROM Map](docs/dragon-quest-3-snes/) • [Wiki](Games/SNES/Dragon%20Quest%20III/Wiki/) |
| Final Fantasy Mystic Quest | SNES | [ROM Map](docs/ffmq-snes/) • [Disasm](https://github.com/TheAnsarya/ffmq-info) |
| Robotrek | SNES | [Full Docs](Games/SNES/Robotrek%20(SNES)/) |
| Soul Blazer | SNES | [Full Docs](Games/SNES/Soul%20Blazer%20(SNES)/) |
| Secret of Mana | SNES | [Project](Games/SNES/Secret%20of%20Mana%20(SNES)/) |

### Format References

| Format | Description | Documentation |
|--------|-------------|---------------|
| `.tbl` | Text encoding tables | [TBL Format](docs/formats/tbl-format.md) |
| `.cdl` | Code Data Logger files | [CDL Format](docs/formats/cdl-format.md) |
| `.mlb` | Mesen label files | [MLB Format](docs/formats/mlb-format.md) |
| `.nl` | FCEUX name lists | [NL Format](docs/formats/nl-format.md) |
| TAS | Movie replay formats | [TAS Formats](docs/tas-formats.md) |

### Wiki Content

MediaWiki wikitext for [Dark Repos Games Wiki](https://games.darkrepos.com):

- ROM Maps - Complete memory mapping
- RAM Maps - Variable and state tracking  
- Data Structures - Table formats and layouts

📖 **[Dark Repos Setup Guide](docs/darkrepos-wiki.md)**

---

## 🎮 Game Projects

### Active Projects

| Project | Status | Repository |
|---------|--------|------------|
| Dragon Warrior IV (NES) | 🔄 Active | [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) |
| Final Fantasy Mystic Quest | 🔄 Active | [ffmq-info](https://github.com/TheAnsarya/ffmq-info) |
| Dragon Quest III (SNES) | 📋 Planned | [dq3r-info](https://github.com/TheAnsarya/dq3r-info) |
| Robotrek | 📋 Planned | [Issue #94](https://github.com/TheAnsarya/GameInfo/issues/94) |
| Secret of Mana | 📋 Planned | [Issue #146](https://github.com/TheAnsarya/GameInfo/issues/146) |

### Project Plans

| Plan | Description |
|------|-------------|
| [DQ3r SNES Plan](~Plans/DQ3r%20SNES%20-%20Comprehensive%20Plan.md) | Dragon Quest III remake disassembly |
| [DW4→DQ3r](Projects/dw4-dq3r/) | Port DW4 NES to DQ3r SNES engine |

---

## 📺 TAS Converter

Convert TAS movie files between emulator formats.

### Supported Formats (All Read/Write)

| Format | Emulator | System |
|--------|----------|--------|
| SMV | Snes9x | SNES |
| BK2/BKM | BizHawk | Multi |
| LSMV | lsnes | SNES |
| MMO | Mesen2 | Multi |
| FM2/FCM/FMV | FCEUX/Famtasia | NES |
| VBM | VisualBoyAdvance | GB/GBA |
| GMV | Gens | Genesis |
| MMV | Dega | SMS/GG |
| PXM/PJM | PCSX/PSXjin | PSX |
| YMV | Yabause | Saturn |
| MC2 | PCEjin | PCE |
| DSM | DeSmuME | NDS |
| LMP | Doom | DOS |

### Quick Start

```bash
# Convert SMV to Mesen2 MMO
python tools/tas/convert_tas_to_mmo.py -i movie.smv -o output/ --format mmo

# Batch convert directory
python tools/tas/convert_tas_to_mmo.py -d tas-files/ -o output/ -r

# List all formats
python tools/tas/tas_converter.py --list-formats
```

📖 **[TAS Converter Documentation](docs/tas-converter.md)** • **[Format Specs](docs/tas-formats.md)**

---

## 🤝 Contributing

### Code Style

- **Indentation:** Tabs only (enforced by `.editorconfig`)
- **Hex Values:** Lowercase (`$9d`, `0xca6e`)
- **C#:** K&R braces, .NET 10 features, pattern matching
- **Commits:** Conventional format (`feat:`, `fix:`, `docs:`, `chore:`)

### Getting Started

```bash
# Clone
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo

# .NET tools
dotnet build
dotnet test

# Python tools
pip install -r requirements.txt
python tools/<tool>.py --help
```

### Project Structure

```
GameInfo/
├── src/                # .NET source code
├── tools/              # Python tools
├── docs/               # Documentation
├── Games/              # Per-game folders (Wiki/, Docs/)
├── Templates/          # Blank templates
├── ~docs/              # Development docs (session logs)
└── ~Plans/             # Project plans
```

📖 **[Contributing Guide](CONTRIBUTING.md)**

---

## 📋 Related Repositories

| Repository | Description |
|------------|-------------|
| [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) | DW4 NES disassembly |
| [ffmq-info](https://github.com/TheAnsarya/ffmq-info) | FFMQ SNES disassembly |
| [dq3r-info](https://github.com/TheAnsarya/dq3r-info) | DQ3 SNES analysis |
| [logsmall](https://github.com/TheAnsarya/logsmall) | DQ3/FFMQ C# libraries |

---

## 📜 License

Educational and preservation purposes. See individual game folders for specific notes.
