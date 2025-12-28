# Soul Blazer Disassembly Symbol Reference

## Overview

This document describes the symbol labels used in the Soul Blazer (SNES) disassembly.

## Symbol File Format

The main symbol file is `soul_blazer.sym`. Format:
```
$bank:address Label  ; optional comment
```

## Label Categories

### System Routines
Core SNES hardware and system functions.

| Label | Address | Description |
|-------|---------|-------------|
| `Reset` | $00:8000 | Main reset entry point |
| `NMI_Handler` | $00:8342 | VBlank interrupt handler |
| `IRQ_Handler` | $00:85a5 | IRQ handler (minimal) |
| `InitHardware` | $02:b9ac | Initialize SNES hardware registers |
| `InitRAM` | $02:bada | Clear and initialize RAM |
| `WaitVBlank` | $02:b1a2 | Wait for vertical blank |
| `EnableNMI` | $02:b1ae | Enable NMI interrupts |
| `DisableNMI` | $02:b1b7 | Disable NMI interrupts |
| `DelayFrames` | $02:b140 | Delay for N frames (A = count) |

### Game Loop
Main game logic routines.

| Label | Address | Description |
|-------|---------|-------------|
| `GameLoop_Main` | $02:8000 | Main game loop handler |
| `GameLoop_Update` | $02:8069 | Update game state |
| `GameLoop_Render` | $02:810b | Render current frame |

### Player Handling
Player character routines.

| Label | Address | Description |
|-------|---------|-------------|
| `UpdatePlayer` | $00:8a34 | Update player state each frame |
| `ReadJoypad` | $00:85a6 | Read controller input |
| `ProcessInput` | $00:85c4 | Process controller state |

### Graphics & Sprites

| Label | Address | Description |
|-------|---------|-------------|
| `UpdateSprites` | $00:86ee | Update OAM sprite data |
| `InitSprites` | $04:f912 | Initialize sprite system |
| `InitGraphics` | $04:f6ee | Initialize graphics mode |
| `LoadGraphics` | $04:f572 | Load graphics data |
| `UpdatePalette` | $04:f781 | Update color palette |

### Map & World

| Label | Address | Description |
|-------|---------|-------------|
| `LoadMap` | $02:89d6 | Load map data |
| `UpdateMap` | $02:98fc | Update map state |
| `UpdateCamera` | $02:a659 | Update camera/scroll position |

### Entities & NPCs

| Label | Address | Description |
|-------|---------|-------------|
| `UpdateEntities` | $00:8df4 | Update all entity states |
| `UpdateNPCs` | $02:9695 | Update NPC behaviors |
| `UpdateCollision` | $00:b005 | Collision detection |

### Events & Audio

| Label | Address | Description |
|-------|---------|-------------|
| `ProcessEvents` | $02:985e | Process game events |
| `UpdateAudio` | $04:f223 | Update music/sound |

## RAM Map

Key RAM locations from `soul_blazer_ram.map`:

| Address | Name | Description |
|---------|------|-------------|
| $0318 | game_state | Current game state ID |
| $0319 | sub_state | Sub-state within game state |
| $037c | scroll_x | Horizontal scroll position |
| $037e | scroll_y | Vertical scroll position |
| $03a6 | frame_counter | Frame counter for timing |
| $03e3 | fade_value | Screen fade level |
| $03fb | game_mode | Current game mode |
| $03ff | state_param | State transition parameter |
| $0401 | position_x | Entity X position |
| $0403 | position_y | Entity Y position |
| $1b8a | player_hp | Player HP value |
| $1c6a | current_area | Current area/map ID |

## Auto-Generated Labels

Labels prefixed with `Sub_` are auto-generated based on call frequency:
- `Sub_XX_YYYY` - Subroutine at bank $XX address $YYYY
- Called 5+ times but not yet identified

## Contributing

When identifying new routines:
1. Add to `soul_blazer.sym` with appropriate category
2. Run `symbol_generator.py` to update auto-labels
3. Run `label_applier.py` to update disassembly files

## Tools

- `symbol_generator.py` - Analyzes disassembly, generates symbol file
- `label_applier.py` - Applies symbols to disassembly as comments
