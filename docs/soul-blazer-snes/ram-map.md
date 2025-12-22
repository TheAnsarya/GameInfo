# Soul Blazer (SNES) - RAM Map

## Overview

Soul Blazer uses SNES Work RAM ($7e0000-$7fffff) for game state, with battery-backed SRAM for save data.

## Memory Layout

### Work RAM ($7e0000-$7e1fff) - Direct Page / Stack

| Address | Size | Description |
|---------|------|-------------|
| $7e0000 | 256 | Direct Page variables |
| $7e0100 | 256 | Stack area |

### Player Data

| Address | Size | Description |
|---------|------|-------------|
| $7e0200 | 2 | Player X position (subpixel) |
| $7e0202 | 2 | Player Y position (subpixel) |
| $7e0204 | 2 | Player HP (current) |
| $7e0206 | 2 | Player HP (max) |
| $7e0208 | 2 | Player strength |
| $7e020a | 2 | Player defense |
| $7e020c | 4 | Player EXP |
| $7e0210 | 4 | Player GEMs |
| $7e0214 | 1 | Player level |
| $7e0215 | 1 | Equipped sword ID |
| $7e0216 | 1 | Equipped armor ID |
| $7e0217 | 1 | Equipped magic ID |

### Game State

| Address | Size | Description |
|---------|------|-------------|
| $7e0300 | 1 | Current area ID |
| $7e0301 | 1 | Current map ID |
| $7e0302 | 2 | Screen X scroll |
| $7e0304 | 2 | Screen Y scroll |
| $7e0306 | 1 | Game mode (0=title, 1=game, 2=menu) |
| $7e0307 | 1 | Frame counter |

### Controller Input

| Address | Size | Description |
|---------|------|-------------|
| $7e0400 | 2 | Controller 1 current |
| $7e0402 | 2 | Controller 1 pressed (new) |
| $7e0404 | 2 | Controller 1 held |

### OAM / Sprite Buffer

| Address | Size | Description |
|---------|------|-------------|
| $7e0500 | 512 | OAM buffer (128 sprites × 4 bytes) |
| $7e0700 | 32 | OAM high table buffer |

### Entity Data

| Address | Size | Description |
|---------|------|-------------|
| $7e0800 | 2048 | Entity table (enemies, NPCs) |

### Soul Lair Status

| Address | Size | Description |
|---------|------|-------------|
| $7e1000 | 256 | Lair cleared flags (bitfield) |

### Text/Dialogue

| Address | Size | Description |
|---------|------|-------------|
| $7e1800 | 512 | Text buffer |
| $7e1a00 | 64 | Current dialogue pointer |

### Temporary Variables

| Address | Size | Description |
|---------|------|-------------|
| $7e1c00 | 256 | Scratch RAM |

## SRAM ($700000-$707fff) - Save Data

Each save slot is 2KB.

### Save Slot Structure (2KB each)

| Offset | Size | Description |
|--------|------|-------------|
| $0000 | 16 | Player name |
| $0010 | 2 | Current HP |
| $0012 | 2 | Max HP |
| $0014 | 2 | Strength |
| $0016 | 2 | Defense |
| $0018 | 4 | Experience |
| $001c | 4 | GEMs |
| $0020 | 1 | Level |
| $0021 | 1 | Current area |
| $0022 | 1 | Current map |
| $0023 | 32 | Inventory |
| $0043 | 1 | Equipped sword |
| $0044 | 1 | Equipped armor |
| $0045 | 1 | Equipped magic |
| $0100 | 256 | Soul lair flags |
| $0200 | 256 | Event flags |
| $07fc | 2 | Checksum |
| $07fe | 2 | Checksum complement |

## Notes

- Addresses are preliminary and need verification through debugging
- SRAM checksum algorithm to be determined
- Entity table format needs further analysis
