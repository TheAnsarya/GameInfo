# Secret of Mana (SNES) - Disassembly Project

## Overview

This project contains a comprehensive disassembly and analysis of **Secret of Mana** (Seiken Densetsu 2) for the Super Nintendo Entertainment System.

| Property | Value |
|----------|-------|
| **Game** | Secret of Mana |
| **Original Title** | 聖剣伝説2 (Seiken Densetsu 2) |
| **Platform** | Super Nintendo Entertainment System (SNES) |
| **Developer** | Square |
| **Publisher** | Square (JP), Squaresoft (US), Nintendo (EU) |
| **Release** | August 6, 1993 (JP) / October 3, 1993 (US) |
| **Genre** | Action RPG |

## ROM Information

| Property | Value |
|----------|-------|
| **ROM File** | Secret of Mana (U) [!].sfc |
| **Size** | 2,097,152 bytes (2 MB) |
| **ROM Type** | HiROM |
| **ROM Speed** | 200ns (SlowROM) |
| **ROM Makeup** | Normal + Battery |
| **SRAM Size** | 8 KiB |
| **Internal Checksum** | 0x51fc |
| **SHA256** | `4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f` |

## Project Structure

```
Secret of Mana (SNES)/
├── ROADMAP.md          # Project roadmap and planning
├── README.md           # This file
├── BUILD.md            # Build instructions
├── ROM-MAP.md          # Complete ROM address map
├── RAM-MAP.md          # Complete RAM address map
├── assets/
│   ├── graphics/       # Extracted graphics (PNG)
│   ├── audio/          # Extracted audio (BRR samples, SPC)
│   ├── text/           # Extracted text and scripts
│   └── maps/           # Extracted map data
├── build/              # Build output directory
├── disasm/             # Disassembly source files
│   ├── bank00.asm      # Bank $00 disassembly
│   ├── bank01.asm      # Bank $01 disassembly
│   └── ...
├── Notes/              # Research notes
├── src/
│   └── data/           # Data tables as assembly includes
├── tools/              # Python/C# extraction and editing tools
└── Wiki/               # Dark Repos wiki content (wikitext)
```

## Quick Links

- [ROADMAP.md](ROADMAP.md) - Project roadmap and timeline
- [ROM-MAP.md](ROM-MAP.md) - ROM address reference
- [RAM-MAP.md](RAM-MAP.md) - RAM address reference
- [Wiki/](Wiki/) - Dark Repos wiki pages

## Building

See [BUILD.md](BUILD.md) for detailed build instructions.

### Quick Start

```powershell
# From the project directory
./build.ps1
```

### Verify Build

```powershell
# Compare built ROM against original
./build.ps1 -Verify
```

## Key Features

### Disassembly
- Complete 65816 assembly code disassembly
- Annotated with labels and comments
- Cross-referenced subroutines

### Data Documentation
- All enemy stats and AI patterns
- Character growth tables
- Item and equipment data
- Magic and spell systems
- Map and event data

### Asset Tools
- Graphics extraction and conversion
- Audio extraction (SPC/BRR format)
- Text extraction with control codes
- Map data extraction

### Editors
- Per-game editor for Secret of Mana
- Integration with DarkRepos universal editor
- Character/enemy/item editors

## Technical Notes

### HiROM Addressing

Secret of Mana uses HiROM mapping:

| CPU Address | ROM Offset | Description |
|-------------|------------|-------------|
| $c0:0000-$c0:ffff | $000000 | Bank $00 |
| $c1:0000-$c1:ffff | $010000 | Bank $01 |
| $40:0000-$7d:ffff | $000000 | Mirror |

### Key Data Locations

| ROM Address | CPU Address | Description |
|-------------|-------------|-------------|
| $101dfa | $d0:1dfa | Enemy stats table |
| $104213 | $d0:4213 | Character level stats |
| $105116 | $d0:5116 | Enemy AI/movement |
| $033d39 | $c3:3d39 | SPC music pointers |
| $083000 | $c8:3000 | Exit/warp data |

See [ROM-MAP.md](ROM-MAP.md) for complete address listings.

## Contributing

This project is part of the GameInfo collection. See the main repository's CONTRIBUTING.md for guidelines.

### Conventions
- All hexadecimal values must be **lowercase** (e.g., `$9d`, not `$9D`)
- Use tabs for indentation (not spaces)
- Commit messages follow conventional commits format
- Reference GitHub issues in commits

## References

- [Data Crystal - Secret of Mana](https://datacrystal.tcrf.net/wiki/Secret_of_Mana_(SNES))
- [TCRF - Secret of Mana](https://tcrf.net/Secret_of_Mana_(SNES))
- [ROMhacking.net](https://www.romhacking.net/games/799/)

## License

Documentation and tools are provided for educational and research purposes.

---

*Part of the [GameInfo](https://github.com/user/GameInfo) project*
