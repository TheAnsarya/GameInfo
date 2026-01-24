# Using Mesen2 to Document ROMs While Playing

This guide explains how to use the Mesen2 emulator with Pansy export to document ROM structure while playing games.

## Overview

The 🌷 Flower Toolchain includes Mesen2 integration that exports debugging data to 🌼 Pansy metadata files. This enables a **play-to-document** workflow where you can:

1. Play a game in Mesen2
2. The Code/Data Logger (CDL) tracks executed code and accessed data
3. Add labels and comments in the debugger
4. Export everything to a `.pansy` file
5. Use the metadata with 🌺 Peony (disassembler) or 🌸 Poppy (assembler)

## Requirements

- Mesen2 (pansy-export branch or later)
- A ROM file to analyze
- Optional: existing CDL file for the game

## Quick Start

### 1. Load a ROM

Open Mesen2 and load your ROM file:
- File → Open ROM
- Select your game (e.g., `Dragon Warrior IV (1992-10)(Enix)(US).nes`)

### 2. Enable Code/Data Logger

The CDL automatically tracks:
- **Code** - Executed instructions
- **Data** - Accessed data bytes
- **Jump Targets** - Branch/jump destinations
- **Subroutines** - JSR/CALL entry points

To view CDL statistics:
- Debug → Code/Data Logger → View Statistics

### 3. Play the Game!

Simply play the game to gather CDL data:
- Start a new game and play through areas you want to document
- The more you play, the more code paths are discovered
- Save states help revisit specific areas

### 4. Add Labels and Comments

Open the debugger (Debug → Debugger or F12):

**Adding Labels:**
- Right-click any address → Add Label
- Enter a meaningful name (e.g., `UpdatePlayerPosition`)
- Labels are used by disassemblers and assemblers

**Adding Comments:**
- Right-click any address → Add Comment
- Add notes about what the code does
- Comments help future analysis

### 5. Export to Pansy Format

**Automatic Export (Recommended):**
- Enable in Debug → Debugger Settings → Integration
- Check "Automatically export .PANSY files"
- Pansy file is updated when you close the debugger

**Manual Export:**
- Debug → Export Pansy metadata
- Choose location and filename
- Click Save

## Exported Data

The Pansy file contains:

| Data Type | Description |
|-----------|-------------|
| **Symbols** | All labels with addresses |
| **Comments** | Per-address comments |
| **Code Map** | Which bytes are executed code |
| **Data Map** | Which bytes are accessed data |
| **Jump Targets** | Branch/jump destinations |
| **Subroutines** | Function entry points |

## Using Exported Data

### With Peony Disassembler

```bash
# Disassemble with Pansy metadata
peony disasm game.nes --metadata game.pansy --output src/
```

### With Poppy Assembler

```bash
# Import symbols during assembly
poppy build src/main.pasm --symbols game.pansy
```

### View in Pansy Viewer

```bash
# View file summary
pansy info game.pansy

# List all symbols
pansy symbols game.pansy

# Find symbol by name
pansy find game.pansy "Player"
```

## Workflow Examples

### Example 1: Document a New Game

1. Load ROM in Mesen2
2. Play through the intro
3. Open debugger, add labels for:
   - Reset vector handler
   - NMI (VBlank) handler
   - Main game loop
4. Continue playing, documenting as you go
5. Export when done

### Example 2: Enhance Existing Documentation

1. Load ROM with existing Pansy file
2. Import Pansy into Mesen2 (File → Import Labels)
3. Play to discover new code paths
4. Add more labels and comments
5. Export updated Pansy file

### Example 3: Battle System Analysis

1. Load RPG game in Mesen2
2. Set breakpoint on known battle trigger
3. Play until battle starts
4. Step through battle code, labeling:
   - Damage calculation
   - AI routines
   - Menu handling
5. Export focused analysis

## Tips for Effective Documentation

### Label Naming Conventions

```
; Functions
Update_PlayerPosition
Calculate_Damage
Draw_TileMap

; Variables
wPlayerHP
wEnemyCount
wCurrentLevel

; Constants
PLAYER_MAX_HP
TILE_WIDTH
```

### Strategic Play

- **Title screen** - Usually runs initialization code
- **New game** - Sets up initial game state
- **Menus** - Input handling, text rendering
- **Walking around** - Movement, collision, NPC interaction
- **Battles** - Combat systems, RNG
- **Saving/Loading** - SRAM access

### Using Save States

- Create saves at key points
- Reload to trace different code paths
- Compare CDL coverage before/after

## Reference CDL Files

Pre-generated CDL files are available in `C:\~reference-roms\cdls\`:

| File | Game |
|------|------|
| `Final Fantasy - Mystic Quest (U) (V1.1).cdl` | FFMQ (SNES) |
| `Dragon Warrior IV (1992-10)(Enix)(US).cdl` | DW4 (NES) |
| `Dragon Warrior (U) (PRG1) [!].cdl` | DW1 (NES) |

Load these to jumpstart your analysis:
- Debug → Code/Data Logger → Load CDL File

## Troubleshooting

### No Pansy File Created
- Check write permissions in ROM folder
- Try manual export instead
- Look in debugger output for errors

### Labels Not Appearing
- Ensure labels are saved (not just in memory)
- Check Label Manager (Debug → Label Manager)

### Missing Code Coverage
- Play more areas of the game
- Use save states to explore branches
- Trigger different game events

## Related Documentation

- [Pansy File Format Specification](../../pansy/docs/FILE-FORMAT.md)
- [Mesen2 Debugger Guide](https://www.mesen.ca/docs/debugging/)
- [Peony Disassembler Usage](../../peony/docs/USAGE.md)
- [Poppy Assembler Usage](../../poppy/docs/USAGE.md)
