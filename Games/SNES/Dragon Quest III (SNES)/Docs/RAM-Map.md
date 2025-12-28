# Dragon Quest III (SNES) - RAM Map

> **Status:** � In Progress

Complete RAM address map for Dragon Quest III (SNES).

For full technical details, see [reference/memory_map.md](reference/memory_map.md).

## SNES Memory Overview

| Region | Address Range | Size | Description |
|--------|--------------|------|-------------|
| WRAM | $7e0000-$7fffff | 128KB | Work RAM |
| WRAM Mirror | $0000-$1fff | 8KB | First 8KB mirrored |
| Direct Page | $0000-$00ff | 256 bytes | Zero page (fast access) |
| Stack | $0100-$01ff | 256 bytes | CPU stack |

## Game RAM Allocation ($e000-$efff)

### System State ($e000-$e0ff)
| Address | Size | Description |
|---------|------|-------------|
| $e000 | 1 | Game mode (field/battle/menu) |
| $e001 | 1 | Game flags and status |
| $e002 | 1 | Random number seed |
| $e003-$e004 | 2 | Frame counter |
| $e010 | 1 | Controller 1 current state |
| $e011 | 1 | Controller 1 previous state |
| $e012 | 1 | Controller 1 new buttons |
| $e050 | 1 | Screen fade level |
| $e051-$e054 | 4 | Camera X/Y position |
| $e0d0 | 1 | Music track number |
| $e0d1-$e0d8 | 8 | Sound effect queue |
| $e0d9 | 1 | Master volume |

### Party Data ($e100-$e4ff)
| Address | Size | Description |
|---------|------|-------------|
| $e100-$e1ff | 256 | Hero/Main Character |
| $e200-$e2ff | 256 | Party Member 2 |
| $e300-$e3ff | 256 | Party Member 3 |
| $e400-$e4ff | 256 | Party Member 4 |

#### Character Structure (256 bytes each)
| Offset | Size | Description |
|--------|------|-------------|
| +$00 | 1 | Character level |
| +$01 | 3 | Experience points |
| +$04 | 2 | Current HP |
| +$06 | 2 | Maximum HP |
| +$08 | 2 | Current MP |
| +$0a | 2 | Maximum MP |
| +$0c | 1 | Strength |
| +$0d | 1 | Agility |
| +$0e | 1 | Wisdom |
| +$0f | 1 | Vitality |
| +$10-$1f | 16 | Equipment slots |
| +$20-$3f | 32 | Spell list |
| +$40-$5f | 32 | Status effects |
| +$60-$ff | 160 | Name, personality, etc. |

### Inventory ($e500-$e7ff)
| Address | Size | Description |
|---------|------|-------------|
| $e500-$e53f | 64 | Item types |
| $e540-$e57f | 64 | Item quantities |
| $e580-$e583 | 4 | Gold |
| $e5a0-$e5ff | 96 | Key items |

### World State ($e800-$eaff)
| Address | Size | Description |
|---------|------|-------------|
| $e800 | 1 | Current map ID |
| $e801 | 1 | Map type |
| $e802 | 1 | Hero X position |
| $e803 | 1 | Hero Y position |
| $e804 | 1 | Facing direction |
| $e900-$e93f | 64 | Story progress flags |
| $ea00 | 1 | Random encounter rate |
| $ea01 | 1 | Battle background |

### Menu/UI State ($eb00-$ecff)
| Address | Size | Description |
|---------|------|-------------|
| $eb00 | 1 | Current menu type |
| $eb01-$eb02 | 2 | Cursor X/Y |
| $eb03 | 1 | Scroll offset |
| $ec00 | 1 | Text speed |
| $ec10-$ec4f | 64 | Text buffer |

### Save/Config ($ed00-$efff)
| Address | Size | Description |
|---------|------|-------------|
| $ed00-$ed7f | 128 | Save buffer (party) |
| $ed80-$edff | 128 | Save buffer (world) |
| $ee00-$ee03 | 4 | Save checksum |
| $ef00 | 1 | Music on/off |
| $ef01 | 1 | SFX on/off |
| $ef02 | 1 | Text speed setting |
| $ef03 | 1 | Battle animation |

## Hardware Registers Used

### PPU ($2100-$213f)
| Register | Description |
|----------|-------------|
| $2100 | Screen brightness (INIDISP) |
| $2101 | Sprite settings (OBSEL) |
| $2105 | BG mode (typically mode 1) |
| $2115-$2119 | VRAM access |
| $2121-$2122 | Palette access |

### APU ($2140-$2143)
| Register | Description |
|----------|-------------|
| $2140 | Music command |
| $2141 | Music parameter |
| $2142 | Sound effect trigger |
| $2143 | Audio status |

---

*Based on boot code analysis and memory_map.md documentation*
