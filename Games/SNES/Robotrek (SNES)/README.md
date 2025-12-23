# Robotrek (SNES) Documentation Project

**Also known as:** Slapstick (スラップスティック) in Japan

## Game Information

| Field | Value |
|-------|-------|
| **Platform** | Super Nintendo / Super Famicom |
| **Developer** | Quintet |
| **Publisher** | Enix (JP/US) |
| **Release Date** | 1994-07-08 (JP), 1994-10 (US) |
| **Genre** | Action RPG |
| **Players** | 1 |

## ROM Information

### Robotrek (USA)

| Hash | Value |
|------|-------|
| CRC32 | `7ad4aadc` |
| MD5 | `e85702f5d32e03a7cbae1154ee5083ce` |
| SHA1 | `e315830e71cc6da91234813f70835d26802c0ea1` |
| SHA256 | `1e2ded7b1e350449b7a99b7ec414525e4b9b086c416deeee5eb3e48e032c46bd` |

### Technical Details

| Field | Value |
|-------|-------|
| ROM Size | 1.5 MB (1,572,864 bytes) |
| SRAM Size | 8 KB |
| Mapper | HiROM + FastROM |
| ROM Type | ROM + RAM + Battery |
| Internal Title | `ROBOTREK 1 USA` |

## Project Structure

```
Robotrek (SNES)/
├── README.md           # This file
├── BUILD.md            # Build and extraction instructions
├── assets/             # Extracted game assets
│   ├── graphics/       # Sprites, tilesets, backgrounds
│   ├── audio/          # Music, sound effects
│   ├── text/           # Dialog, menus
│   └── data/           # Tables, formulas, items
├── disasm/             # Disassembly source files
│   ├── bank00.asm      # Bank 00 disassembly
│   └── ...
├── docs/               # Additional documentation
├── src/                # Reassembly source files
└── tools/              # Project-specific tools
```

## Documentation

### Wiki Pages

- [Main Page](../../../Wiki/SNES/Robotrek/Main.wikitext) - Overview and introduction
- [ROM Map](../../../Wiki/SNES/Robotrek/ROM_Map.wikitext) - ROM memory layout
- [RAM Map](../../../Wiki/SNES/Robotrek/RAM_Map.wikitext) - RAM memory layout
- [Data Structures](../../../Wiki/SNES/Robotrek/Data_Structures.wikitext) - Internal data formats
- [Items](../../../Wiki/SNES/Robotrek/Items.wikitext) - Item database
- [Enemies](../../../Wiki/SNES/Robotrek/Enemies.wikitext) - Enemy statistics
- [Inventions](../../../Wiki/SNES/Robotrek/Inventions.wikitext) - Robot inventions/parts
- [Formulas](../../../Wiki/SNES/Robotrek/Formulas.wikitext) - Game mechanics formulas
- [Text Tables](../../../Wiki/SNES/Robotrek/TBL.wikitext) - Character encoding tables

### Guides

- [docs/disassembly-guide.md](docs/disassembly-guide.md) - How to work with disassembly
- [docs/data-format.md](docs/data-format.md) - Data structure documentation

## Tools

### Python Tools

| Tool | Description |
|------|-------------|
| `tools/rom_analyzer.py` | Comprehensive ROM analysis |
| `tools/asset_extractor.py` | Extract all game assets |
| `tools/text_extractor.py` | Extract and decode text |
| `tools/sprite_extractor.py` | Extract sprite graphics |
| `tools/invention_editor.py` | Edit robot parts/inventions |
| `tools/item_editor.py` | Edit item properties |
| `tools/enemy_editor.py` | Edit enemy statistics |

### Build Pipeline

```powershell
# Extract assets from ROM
python tools/asset_extractor.py --rom "path/to/Robotrek.sfc" --output assets/

# Build modified ROM
python tools/build_rom.py --config build.config.json --output build/
```

## Game Overview

Robotrek is an action RPG developed by Quintet (creators of Soul Blazer, Illusion of Gaia, and Terranigma). The player controls a young inventor who builds robots to fight battles. Key features:

- **Invention System**: Build and customize up to 3 robots
- **Parts/Items**: Extensive crafting and item combination system
- **Turn-based Combat**: Robots fight in strategic battles
- **Exploration**: Multiple towns and dungeons to explore
- **Story**: Sci-fi adventure with time travel elements

## Related Games (Quintet Series)

- Soul Blazer (1992)
- Illusion of Gaia (1993)
- **Robotrek (1994)**
- Terranigma (1995)

## Contributing

See [CONTRIBUTING.md](../../../CONTRIBUTING.md) for guidelines on contributing to this project.

## License

This documentation is for educational and preservation purposes. ROM files are not included due to copyright.
