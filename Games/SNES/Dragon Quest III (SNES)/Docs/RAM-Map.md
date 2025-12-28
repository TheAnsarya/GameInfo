# Dragon Quest III (SNES) - RAM Map

> **Status:** 🔴 Not Started

This document will contain the complete RAM map for Dragon Quest III (SNES).

## SNES Memory Overview

| Region | Address Range | Size | Description |
|--------|--------------|------|-------------|
| WRAM | $7e0000-$7fffff | 128KB | Work RAM |
| WRAM Mirror | $0000-$1fff | 8KB | First 8KB mirrored |

## Known RAM Addresses

### System State
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Game mode flag |
| TBD | TBD | Frame counter |

### Player Data
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Party data start |
| TBD | TBD | Hero HP/MP |
| TBD | TBD | Gold |
| TBD | TBD | Inventory |

### Battle State
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Battle flags |
| TBD | TBD | Turn order |
| TBD | TBD | Enemy HP array |

### Menu State
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Menu cursor position |
| TBD | TBD | Selected character |

### Graphics Buffers
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | OAM buffer |
| TBD | TBD | Tilemap buffer |
| TBD | TBD | Palette buffer |

### Sound State
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Current BGM |
| TBD | TBD | SFX queue |

---

*To be populated from gameplay analysis and trace logs*
