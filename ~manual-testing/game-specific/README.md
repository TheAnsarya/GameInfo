# Game-Specific Testing & Debugging Documentation

Per-game documentation including manual testing, debugging findings, and extraction notes.

## 📁 Games

| Game | Platform | Folder | Testing Docs |
|------|----------|--------|--------------|
| Dragon Quest III | SNES | [dq3r-snes/](dq3r-snes/) | Map, Monster, Item, Spell, Graphics |
| Dragon Warrior IV | NES | [dw4-nes/](dw4-nes/) | Map, Monster, Graphics, Spell, Item |
| Dragon Quest IV Remake | SNES | [dq4r-snes/](dq4r-snes/) | Save, Cutscene, Event, Battle, Chapter |
| Final Fantasy Mystic Quest | SNES | [ffmq-snes/](ffmq-snes/) | Map, Monster, Item, Spell |
| The Legend of Zelda | NES | [zelda-nes/](zelda-nes/) | Graphics, Palettes, Maps, Enemies, Items |

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
| [monster-editor-testing.md](dq3r-snes/monster-editor-testing.md) | 155 monsters, resistances, types | 8 TC + 3 RT |
| [item-editor-testing.md](dq3r-snes/item-editor-testing.md) | 228 items, 9 class equip flags | 8 TC + 3 RT |
| [spell-editor-testing.md](dq3r-snes/spell-editor-testing.md) | ~70 spells, class learning tables | 8 TC + 3 RT |
| [graphics-editor-testing.md](dq3r-snes/graphics-editor-testing.md) | 4bpp tiles, palettes, Mode 1 | 8 TC + 3 RT |

### Dragon Quest IV Remake (SNES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [dq4r-system-testing.md](dq4r-snes/dq4r-system-testing.md) | Save, Cutscene, Event, Battle, Chapter | 17 TC + 4 RT |

### Final Fantasy Mystic Quest (SNES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [map-editor-testing.md](ffmq-snes/map-editor-testing.md) | Dungeons, towns, collision, layers | 8 TC + 3 RT |
| [monster-editor-testing.md](ffmq-snes/monster-editor-testing.md) | 60 monsters, elements, AI | 8 TC + 3 RT |
| [item-editor-testing.md](ffmq-snes/item-editor-testing.md) | Weapons, armor, consumables | 8 TC + 3 RT |
| [spell-editor-testing.md](ffmq-snes/spell-editor-testing.md) | 16 spells, animations, effects | 8 TC + 3 RT |

### The Legend of Zelda (NES)
| Document | Description | Test Cases |
|----------|-------------|------------|
| [README.md](zelda-nes/README.md) | Full testing documentation | 7 TC + 3 RT |

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
