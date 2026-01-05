# Game-Specific Testing & Debugging Documentation

Per-game documentation including manual testing, debugging findings, and extraction notes.

## 📁 Games

| Game | Platform | Folder | Testing Docs |
|------|----------|--------|--------------|
| Dragon Quest III | SNES | [dq3r-snes/](dq3r-snes/) | Map Editor |
| Dragon Warrior IV | NES | [dw4-nes/](dw4-nes/) | Map, Monster, Graphics, Spell, Item |
| Dragon Quest IV Remake | SNES | [dq4r-snes/](dq4r-snes/) | Save, Cutscene, Event, Battle, Chapter |
| Final Fantasy Mystic Quest | SNES | [ffmq-snes/](ffmq-snes/) | - |

## 📋 Manual Testing Documentation

### Dragon Warrior IV (NES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [map-editor-testing.md](dw4-nes/map-editor-testing.md) | 73 maps, tilesets, warps, NPCs | 8 TC + 3 RT |
| [monster-editor-testing.md](dw4-nes/monster-editor-testing.md) | 209 monsters, 27-byte records | 8 TC + 3 RT |
| [graphics-editor-testing.md](dw4-nes/graphics-editor-testing.md) | 2bpp tiles, sprites, palettes | 8 TC + 3 RT |
| [spell-editor-testing.md](dw4-nes/spell-editor-testing.md) | ~40 spells, 6-byte records | 8 TC + 3 RT |
| [item-editor-testing.md](dw4-nes/item-editor-testing.md) | 220 items, 8-byte records | 8 TC + 3 RT |

### Dragon Quest III Remake (SNES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [map-editor-testing.md](dq3r-snes/map-editor-testing.md) | Chunk-based overworld, metatiles | 9 TC + 3 RT |

### Dragon Quest IV Remake (SNES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [dq4r-system-testing.md](dq4r-snes/dq4r-system-testing.md) | Save, Cutscene, Event, Battle, Chapter | 17 TC + 4 RT |

## 📋 What Else Goes Here

- Discovered RAM/ROM addresses
- Documented data structures
- Breakpoint logs from debugging sessions
- Notes on game-specific quirks
- Extraction parameters and settings

## 📝 Template for New Games

Create a folder with:
```
game-name/
├── README.md              # Overview and quick reference
├── addresses.md           # Known addresses
├── structures.md          # Data structure documentation
├── breakpoint-log.md      # Session findings
├── extraction-notes.md    # What's been extracted and how
└── *-editor-testing.md    # Manual testing documentation
```

## 🔗 Related Libraries

| Library | Location | Games |
|---------|----------|-------|
| DW4Lib | `logsmall/DW4Lib/` | Dragon Warrior IV (NES) |
| DQ3Lib | `logsmall/DQ3Lib/` | Dragon Quest III (SNES) |
| DQ4rLib | `logsmall/DQ4rLib/` | Dragon Quest IV Remake (SNES) |
| FFMQLib | `logsmall/FFMQLib/` | Final Fantasy Mystic Quest (SNES) |
