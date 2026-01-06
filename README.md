# GameInfo

**ROM hacking tools, documentation, and wiki content for retro games.**

[![.NET](https://img.shields.io/badge/.NET-10.0-512BD4)](https://dotnet.microsoft.com/)
[![Python](https://img.shields.io/badge/Python-3.11+-3776AB)](https://python.org/)
[![License](https://img.shields.io/badge/License-Educational-green)](LICENSE)

## Quick Links

| Section | Description |
|---------|-------------|
| [🧪 Manual Testing](#-manual-testing) | Editor testing, emulator setup, debugging |
| [🛠️ Tools](#-tools) | .NET CLI and Python utilities |
| [📚 Documentation](#-documentation) | Game docs, ROM/RAM maps, formats |
| [🎮 Game Projects](#-game-projects) | Per-game disassembly and tools |
| [📺 TAS Converter](#-tas-converter) | Multi-format TAS replay converter |
| [📝 Development Docs](#-development-docs) | Session logs, plans, chat logs |
| [🤝 Contributing](#-contributing) | Code style and workflow |

---

## 🧪 Manual Testing

Guides for testing ROM hack editors, emulator debugging, and asset extraction.

### Quick Start

📖 **[Manual Testing Guide](~manual-testing/README.md)** - Complete testing documentation index

### Testing Categories

| Category | Description | Link |
|----------|-------------|------|
| **Emulator Setup** | Mesen-S configuration, debugger setup | [Setup Guide](~manual-testing/emulator-setup/) |
| **Breakpoint Guides** | DMA tracing, VRAM analysis, debugging | [Breakpoints](~manual-testing/breakpoint-guides/) |
| **Extraction Workflows** | Graphics, audio, compression analysis | [Extraction](~manual-testing/extraction-workflows/) |
| **Game-Specific Testing** | Per-game editor testing docs | [Game Tests](~manual-testing/game-specific/) |

### Per-Game Testing Documentation

| Game | Platform | Testing Docs |
|------|----------|--------------|
| Dragon Quest III | SNES | [Monster](~manual-testing/game-specific/dq3r-snes/monster-editor-testing.md) • [Item](~manual-testing/game-specific/dq3r-snes/item-editor-testing.md) • [Spell](~manual-testing/game-specific/dq3r-snes/spell-editor-testing.md) • [Map](~manual-testing/game-specific/dq3r-snes/map-editor-testing.md) • [Graphics](~manual-testing/game-specific/dq3r-snes/graphics-editor-testing.md) |
| Dragon Quest IV Remake | SNES | [System Testing](~manual-testing/game-specific/dq4r-snes/dq4r-system-testing.md) • [Monster](~manual-testing/game-specific/dq4r-snes/monster-editor-testing.md) • [Item](~manual-testing/game-specific/dq4r-snes/item-editor-testing.md) • [Spell](~manual-testing/game-specific/dq4r-snes/spell-editor-testing.md) |
| Dragon Warrior IV | NES | [Monster](~manual-testing/game-specific/dw4-nes/monster-editor-testing.md) • [Item](~manual-testing/game-specific/dw4-nes/item-editor-testing.md) • [Spell](~manual-testing/game-specific/dw4-nes/spell-editor-testing.md) • [Map](~manual-testing/game-specific/dw4-nes/map-editor-testing.md) • [Graphics](~manual-testing/game-specific/dw4-nes/graphics-editor-testing.md) • [Character](~manual-testing/game-specific/dw4-nes/character-editor-testing.md) |
| Final Fantasy Mystic Quest | SNES | [Monster](~manual-testing/game-specific/ffmq-snes/monster-editor-testing.md) • [Item](~manual-testing/game-specific/ffmq-snes/item-editor-testing.md) • [Spell](~manual-testing/game-specific/ffmq-snes/spell-editor-testing.md) • [Map](~manual-testing/game-specific/ffmq-snes/map-editor-testing.md) • [Graphics](~manual-testing/game-specific/ffmq-snes/graphics-editor-testing.md) |

### Testing in Other Repos

| Repository | Testing Docs |
|------------|--------------|
| [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) | [CDL Verification](https://github.com/TheAnsarya/dragon-warrior-4-info/blob/main/~manual-testing/cdl-verification-quickstart.md) |
| [ffmq-info](https://github.com/TheAnsarya/ffmq-info) | [ROM Verification](https://github.com/TheAnsarya/ffmq-info/blob/master/~manual-testing/rom-verification.md) • [Dialog](https://github.com/TheAnsarya/ffmq-info/blob/master/~manual-testing/dialog-testing.md) • [Editors](https://github.com/TheAnsarya/ffmq-info/blob/master/~manual-testing/editor-testing.md) |
| [dq3r-info](https://github.com/TheAnsarya/dq3r-info) | [ROM Analysis](https://github.com/TheAnsarya/dq3r-info/blob/main/~manual-testing/rom-analysis.md) • [Graphics](https://github.com/TheAnsarya/dq3r-info/blob/main/~manual-testing/graphics-testing.md) • [Text](https://github.com/TheAnsarya/dq3r-info/blob/main/~manual-testing/text-testing.md) |

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

📖 **[Python Tools Index](docs/tools/README.md)** • **[Python-C# Mapping](docs/python-csharp-mapping.md)**

---

## 📚 Documentation

📖 **[Documentation Index](docs/README.md)**

### Game Documentation

| Game | Platform | Links |
|------|----------|-------|
| Dragon Warrior | NES | [ROM Map](docs/dragon-warrior-nes/) |
| Dragon Warrior II | NES | [ROM Map](docs/dragon-warrior-2-nes/) |
| Dragon Warrior III | NES | [ROM Map](docs/dragon-warrior-3-nes/) |
| Dragon Warrior IV | NES | [ROM Map](docs/dragon-warrior-4-nes/) • [Disasm](https://github.com/TheAnsarya/dragon-warrior-4-info) |
| Dragon Quest I & II | SNES | [ROM Map](docs/dragon-quest-1-2-snes/) |
| Dragon Quest III | SNES | [ROM Map](docs/dragon-quest-3-snes/) • [Full Analysis](Games/SNES/Dragon%20Quest%20III%20(SNES)/) |
| Final Fantasy Mystic Quest | SNES | [ROM Map](docs/ffmq-snes/) • [Disasm](https://github.com/TheAnsarya/ffmq-info) |
| Robotrek | SNES | [Full Docs](Games/SNES/Robotrek%20(SNES)/) |
| Soul Blazer | SNES | [Full Docs](docs/soul-blazer-snes/) • [Disasm](Games/SNES/Soul%20Blazer%20(SNES)/) |
| Secret of Mana | SNES | [Project](Games/SNES/Secret%20of%20Mana%20(SNES)/) |

### Tool Guides

| Category | Documentation |
|----------|---------------|
| **Getting Started** | [Getting Started Guide](docs/guides/getting-started.md) |
| **CLI Reference** | [Full CLI Reference](docs/guides/cli-reference.md) • [API Reference](docs/guides/api-reference.md) |
| **CDL Tools** | [CDL Guide](docs/guides/cdl-tools.md) • [Format Spec](docs/formats/cdl-format.md) |
| **Label Management** | [Label Guide](docs/guides/label-management.md) |
| **ROM Catalog** | [ROM Catalog](docs/guides/rom-catalog.md) |
| **Tool Usage** | [Tool Usage Guide](docs/guides/tool-usage.md) |

### Format References

| Format | Description | Documentation |
|--------|-------------|---------------|
| `.tbl` | Text encoding tables | [TBL Format](docs/formats/tbl-format.md) |
| `.cdl` | Code Data Logger files | [CDL Format](docs/formats/cdl-format.md) |
| `.mlb` | Mesen label files | [MLB Format](docs/formats/mlb-format.md) |
| `.nl` | FCEUX name lists | [NL Format](docs/formats/nl-format.md) |
| TAS | Movie replay formats | [TAS Formats](docs/tas-formats.md) |

### SNES Audio Documentation

| Topic | Documentation |
|-------|---------------|
| **Getting Started** | [SNES Music Editing Intro](docs/audio/getting-started-snes-music-editing.md) |
| **Technical Reference** | [SNES Audio Reference](docs/audio/snes-audio-technical-reference.md) |
| **Editing Guide** | [Music Editing Guide](docs/audio/snes-music-editing-guide.md) |
| **BRR Encoding** | [BRR Encoding Guide](docs/audio/brr-encoding-guide.md) |
| **SPC Format** | [SPC File Format](docs/audio/spc-file-format.md) |
| **SPC Tool** | [CLI Reference](docs/audio/spc-tool-cli-reference.md) • [User Guide](docs/audio/spc-tool-user-guide.md) |

📖 **[Audio Documentation Index](docs/audio/README.md)**

### Build Pipeline Documentation

| Platform | Documentation |
|----------|---------------|
| **Overview** | [Build Pipeline Index](docs/Build-Pipeline/README.md) |
| **NES** | [NES Pipeline](docs/Build-Pipeline/NES-Pipeline.md) |
| **SNES** | [SNES Pipeline](docs/Build-Pipeline/SNES-Pipeline.md) |
| **GB** | [GB Pipeline](docs/Build-Pipeline/GB-Pipeline.md) |
| **GBA** | [GBA Pipeline](docs/Build-Pipeline/GBA-Pipeline.md) |
| **Genesis** | [Genesis Pipeline](docs/Build-Pipeline/Genesis-Pipeline.md) |
| **Asset Formats** | [Asset Formats](docs/Build-Pipeline/Asset-Formats.md) |
| **Configuration** | [Config Schema](docs/Build-Pipeline/Configuration-Schema.md) |

### Wiki Content

MediaWiki wikitext for [Dark Repos Games Wiki](https://games.darkrepos.com):

- ROM Maps - Complete memory mapping
- RAM Maps - Variable and state tracking  
- Data Structures - Table formats and layouts

📖 **[Dark Repos Setup Guide](docs/darkrepos-wiki.md)** • **[Wiki Setup](docs/darkrepos-wiki-setup.md)**

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

📖 **[TAS Converter Documentation](docs/tas-converter.md)** • **[Format Specs](docs/tas-formats.md)** • **[Manual Testing Guide](docs/TasConverter/Manual-Testing-Guide.md)**

---

## 📝 Development Docs

Internal development documentation, session logs, and project planning.

### Session Logs

Development session documentation with notes, findings, and progress.

📖 **[Session Logs](~docs/session-logs/)** - AI-assisted development session records

### Chat Logs

Conversation history for context preservation.

📖 **[Chat Logs](~docs/chat-logs/)** - Session chat records

### Project Plans

| Plan | Description |
|------|-------------|
| [DQ3r SNES Comprehensive Plan](~Plans/DQ3r%20SNES%20-%20Comprehensive%20Plan.md) | Dragon Quest III remake disassembly |
| [CDL Tools - GitHub Issues](~Plans/CDL%20Tools%20-%20GitHub%20Issues.md) | CDL tool development issues |
| [TAS Converter - GitHub Issues](~Plans/TAS%20Converter%20-%20GitHub%20Issues.md) | TAS tool development issues |
| [TAS Converter - Project Roadmap](~Plans/TAS%20Converter%20-%20Project%20Roadmap.md) | TAS tool roadmap |
| [SPC-Ableton Workflow](~docs/plans/spc-ableton-workflow.md) | SNES audio Ableton integration |

### Development Resources

| Resource | Description |
|----------|-------------|
| [GitHub Setup](~docs/github-setup.md) | GitHub configuration notes |
| [Robotrek Issues](~docs/robotrek-issues.md) | Robotrek project tracking |

### User Manual Documentation

| Category | Documentation |
|----------|---------------|
| **Manual Index** | [User Manual](~docs/manual/README.md) |
| **CLI Tools** | [CLI Manual Index](~docs/manual/cli/README.md) |
| **UI Tools** | [UI Manual Index](~docs/manual/ui/README.md) |
| **Samples** | [Sample Files](~docs/manual/samples/README.md) |

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
├── Projects/           # Cross-game projects (DW4→DQ3r)
├── DarkRepos/          # Wiki editor and web tools
├── Templates/          # Blank templates
├── dats/               # ROM checksums and DAT files
├── ~docs/              # Development docs (session/chat logs)
├── ~Plans/             # Project plans
└── ~manual-testing/    # Manual testing documentation
```

📖 **[Contributing Guide](CONTRIBUTING.md)**

---

## 📋 Related Repositories

| Repository | Description |
|------------|-------------|
| [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) | DW4 NES disassembly |
| [ffmq-info](https://github.com/TheAnsarya/ffmq-info) | FFMQ SNES disassembly |
| [dq3r-info](https://github.com/TheAnsarya/dq3r-info) | DQ3 SNES analysis |
| [logsmall](https://github.com/TheAnsarya/logsmall) | DQ3/FFMQ/DW4 C# libraries |
| [ableton-snes-spc](https://github.com/TheAnsarya/ableton-snes-spc) | SNES audio VST plugin |

---

## 📂 Additional Resources

### DarkRepos Projects

| Project | Description |
|---------|-------------|
| [Wiki Editor](DarkRepos/Editor/) | MediaWiki content editor |
| [Wiki Web](DarkRepos/Web/) | Dark Repos website |
| [Wiki Content](DarkRepos/Wiki/) | Wiki content files |

### Cross-Game Projects

| Project | Description |
|---------|-------------|
| [DW4→DQ3r Port](Projects/dw4-dq3r/) | Port Dragon Warrior IV to DQ3r SNES engine |

### DAT Files

📖 **[DAT Files](dats/README.md)** - ROM checksums and verification

---

## 📜 License

Educational and preservation purposes. See individual game folders for specific notes.
