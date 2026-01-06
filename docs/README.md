# GameInfo Documentation

Comprehensive documentation for ROM hacking tools, game analysis, and wiki content.

## Quick Links

| Category | Link |
|----------|------|
| **Tools** | [Python Tools Index](tools/README.md) |
| **Guides** | [Getting Started](guides/getting-started.md) |
| **TAS Converter** | [TAS Documentation](tas-converter.md) |
| **Audio** | [SNES Audio Documentation](audio/README.md) |
| **Build Pipeline** | [Build Pipeline](Build-Pipeline/README.md) |
| **Formats** | [Format Specifications](#format-specifications) |
| **Games** | [Game Documentation](#game-documentation) |

---

## Tool Documentation

### Python Tools

| Guide | Description |
|-------|-------------|
| [Tools Index](tools/README.md) | Complete tool listing and quick reference |
| [CDL Tools](tools/cdl-tools.md) | Code Data Logger analysis and editing |
| [Label Tools](tools/label-tools.md) | MLB/NL label management |
| [Analysis Tools](tools/analysis-tools.md) | ROM analysis and reverse engineering |
| [Graphics Tools](tools/graphics-tools.md) | Tile and sprite extraction |
| [Text Tools](tools/text-tools.md) | Text extraction and TBL tools |
| [CLI Reference](tools/cli-reference.md) | Command line interface reference |

### User Guides

| Guide | Description |
|-------|-------------|
| [Getting Started](guides/getting-started.md) | Introduction and setup |
| [CLI Reference](guides/cli-reference.md) | Full CLI command reference |
| [API Reference](guides/api-reference.md) | Programmatic API documentation |
| [CDL Tools Guide](guides/cdl-tools.md) | CDL analysis workflows |
| [Label Management](guides/label-management.md) | Working with label files |
| [ROM Catalog](guides/rom-catalog.md) | ROM database management |
| [Tool Usage](guides/tool-usage.md) | General tool usage patterns |

### TAS Converter

| Document | Description |
|----------|-------------|
| [TAS Converter](tas-converter.md) | Main TAS converter documentation |
| [TAS Format Specs](tas-formats.md) | All 17 supported format specifications |
| [Format Reference](TasConverter/TAS-Format-Reference.md) | Detailed technical reference |
| [Manual Testing Guide](TasConverter/Manual-Testing-Guide.md) | TAS converter testing procedures |

---

## Audio Documentation

SNES audio and SPC file documentation.

| Guide | Description |
|-------|-------------|
| [Audio Index](audio/README.md) | Complete audio documentation index |
| [Getting Started](audio/getting-started-snes-music-editing.md) | Introduction to SNES audio editing |
| [Technical Reference](audio/snes-audio-technical-reference.md) | SNES DSP and audio system |
| [Music Editing](audio/snes-music-editing-guide.md) | Comprehensive editing guide |
| [BRR Encoding](audio/brr-encoding-guide.md) | Sample encoding format |
| [SPC Format](audio/spc-file-format.md) | SPC file format specification |
| [SPC Tool CLI](audio/spc-tool-cli-reference.md) | SPC tool command reference |
| [SPC Tool Guide](audio/spc-tool-user-guide.md) | SPC tool user guide |

---

## Build Pipeline Documentation

Multi-platform ROM build pipeline documentation.

| Guide | Description |
|-------|-------------|
| [Pipeline Index](Build-Pipeline/README.md) | Build pipeline overview |
| [NES Pipeline](Build-Pipeline/NES-Pipeline.md) | NES ROM building |
| [SNES Pipeline](Build-Pipeline/SNES-Pipeline.md) | SNES ROM building |
| [GB Pipeline](Build-Pipeline/GB-Pipeline.md) | Game Boy ROM building |
| [GBA Pipeline](Build-Pipeline/GBA-Pipeline.md) | Game Boy Advance ROM building |
| [Genesis Pipeline](Build-Pipeline/Genesis-Pipeline.md) | Genesis/Mega Drive ROM building |
| [Asset Formats](Build-Pipeline/Asset-Formats.md) | Supported asset formats |
| [Configuration](Build-Pipeline/Configuration-Schema.md) | Build configuration schema |

---

## Game Documentation

### NES Games

| Game | Documentation |
|------|---------------|
| [Dragon Warrior](dragon-warrior-nes/) | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior II](dragon-warrior-2-nes/) | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior III](dragon-warrior-3-nes/) | ROM Map, RAM Map, Data Structures |
| [Dragon Warrior IV](dragon-warrior-4-nes/) | ROM Map, RAM Map, Data Structures |

### SNES Games

| Game | Documentation |
|------|---------------|
| [Dragon Quest I & II](dragon-quest-1-2-snes/) | ROM Map, RAM Map, Data Structures |
| [Dragon Quest III](dragon-quest-3-snes/) | ROM Map, RAM Map, Data Structures |
| [Final Fantasy Mystic Quest](ffmq-snes/) | ROM Map, RAM Map, Data Structures |
| [Soul Blazer](soul-blazer-snes/) | ROM Map, RAM Map, Text System |

---

## Format Specifications

| Format | Description |
|--------|-------------|
| [TBL Format](formats/tbl-format.md) | Text encoding table format |
| [CDL Format](formats/cdl-format.md) | Code Data Logger file format |
| [MLB Format](formats/mlb-format.md) | Mesen label file format |
| [NL Format](formats/nl-format.md) | FCEUX name list format |

---

## Project Plans

| Project | Description |
|---------|-------------|
| [DW4→DQ3r Port](../Projects/dw4-dq3r/) | Port DW4 NES to DQ3r SNES engine |
| [DQ3r Analysis](../~Plans/DQ3r%20SNES%20-%20Comprehensive%20Plan.md) | Dragon Quest III SNES analysis plan |

---

## Wiki Integration

Documentation for [Dark Repos Games Wiki](https://games.darkrepos.com):

| Guide | Description |
|-------|-------------|
| [Dark Repos Setup](darkrepos-wiki.md) | Wiki setup and configuration |
| [Wiki Content Guide](darkrepos-wiki-setup.md) | Creating wiki content |

---

## Additional Resources

| Resource | Description |
|----------|-------------|
| [Games Folder](../Games/) | Per-game folders with Wiki, Docs, assets |
| [Manual Testing](../~manual-testing/) | Manual testing guides |
| [Python/C# Mapping](python-csharp-mapping.md) | Python to C# tool mapping |

---

## Python/C# Mapping

| Document | Description |
|----------|-------------|
| [Python-C# Mapping](python-csharp-mapping.md) | Mapping between Python tools and C# implementations |
