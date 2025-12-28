# Soul Blazer (SNES) Documentation

## Overview

- **Platform:** Super Nintendo Entertainment System (SNES)
- **Developer:** Quintet
- **Publisher:** Enix
- **Year:** 1992
- **Region:** North America (USA)
- **Genre:** Action RPG

## ROM Information

| Property | Value |
|----------|-------|
| Internal Title | `SOULBLAZER - 1 USA` |
| ROM Size | 1024 KB (1 MB) |
| SRAM Size | 8 KB |
| Map Mode | LoROM (0x20) |
| ROM Type | 0x02 (ROM + RAM + Battery) |
| Region | North America (0x01) |
| Developer ID | 0xb4 (Enix) |
| Version | 1.0 |

## File Hashes

| Algorithm | Hash |
|-----------|------|
| SHA256 | `8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2` |
| SHA1 | `f2832eb02547c39cae3bdaab5c2a53e4f8b31810` |
| MD5 | `83cf41d53a1b94aeea1a645037a24004` |
| CRC32 | `31b965db` |

## Interrupt Vectors

### Native Mode (16-bit)

| Vector | Address |
|--------|---------|
| NMI | `$8342` |
| IRQ | `$85a5` |
| BRK | `$d5fc` |
| COP | `$d61e` |

### Emulation Mode (8-bit)

| Vector | Address |
|--------|---------|
| RESET | `$8000` |
| NMI | `$0015` |
| IRQ | `$d011` |

## Memory Map

Soul Blazer uses LoROM mapping with 32 banks of 32KB each.

| Bank | File Offset | Content |
|------|-------------|---------|
| $00 | $000000 | Main code, vectors |
| $01 | $008000 | Code, subroutines |
| $02-$04 | $010000-$01ffff | Text and dialogue |
| $05-$0f | $028000-$07ffff | Game data, maps |
| $10-$1f | $080000-$0fffff | Graphics, compressed data |

## Documentation

### Core Maps

| Document | Description |
|----------|-------------|
| [ROM Map](rom-map.md) | Complete ROM memory mapping |
| [RAM Map](ram-map.md) | RAM addresses and variables |

### Format Specifications

| Document | Description |
|----------|-------------|
| [Graphics Formats](graphics-formats.md) | 4BPP tiles, palettes, sprites, tilemaps |
| [Audio Formats](audio-formats.md) | BRR samples, SPC700, music sequences |
| [Data Structures](data-structures.md) | Entity tables, save data, pointers |

## Related Files

- Wiki content: [`Soul Blazer (SNES)/Wiki/`](../../Games/SNES/Soul%20Blazer%20(SNES)/Wiki/)
- Notes: [`Soul Blazer (SNES)/Notes/`](../../Games/SNES/Soul%20Blazer%20(SNES)/Notes/)
- Tools: [`Soul Blazer (SNES)/tools/`](../../Games/SNES/Soul%20Blazer%20(SNES)/tools/)
- Disassembly: [`Soul Blazer (SNES)/disasm/`](../../Games/SNES/Soul%20Blazer%20(SNES)/disasm/)

## Game Overview

Soul Blazer is an action RPG where players control a hero sent by "The Master" to restore life to a world destroyed by Deathtoll. The game features a unique "soul release" mechanic where defeating monster lairs restores NPCs and objects to the world.

### Key Features

- Real-time action combat
- Soul release system restoring towns and NPCs
- Equipment and magic system
- Multiple interconnected worlds
- Story-driven progression

## External Resources

- [Data Crystal - Soul Blazer](https://datacrystal.tcrf.net/wiki/Soul_Blazer)
- [Soul Blazer Shrine](http://shrines.rpgclassics.com/snes/soulblazer/)
