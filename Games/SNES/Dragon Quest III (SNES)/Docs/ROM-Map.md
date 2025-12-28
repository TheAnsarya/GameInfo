# Dragon Quest III (SNES) - ROM Map

> **Status:** 🔴 Not Started

This document will contain the complete ROM map for Dragon Quest III (SNES).

## ROM Information

| Property | Value |
|----------|-------|
| Type | HiROM |
| Size | 4,194,304 bytes (4 MB) |
| Banks | 64 |
| Checksum | TBD |

## Bank Overview

| Bank | SNES Address | File Offset | Size | Description |
|------|--------------|-------------|------|-------------|
| $00 | $c00000-$c0ffff | $000000 | 64KB | Boot code, vectors |
| $01 | $c10000-$c1ffff | $010000 | 64KB | Main engine |
| $02 | $c20000-$c2ffff | $020000 | 64KB | Battle system |
| ... | ... | ... | ... | ... |
| $3f | $ff0000-$ffffff | $3f0000 | 64KB | TBD |

## Known Addresses

### System
| Address | Description |
|---------|-------------|
| $c00000 | Reset vector handler |
| TBD | NMI handler |
| TBD | IRQ handler |

### Battle System
| Address | Description |
|---------|-------------|
| TBD | Battle initialization |
| TBD | Damage calculation |

### Menu System
| Address | Description |
|---------|-------------|
| TBD | Menu rendering |
| TBD | Text rendering |

### Data Tables
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Monster data table |
| TBD | TBD | Item data table |
| TBD | TBD | Spell data table |

## Graphics
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Character sprites |
| TBD | TBD | Monster graphics |
| TBD | TBD | Map tiles |

## Text
| Address | Size | Description |
|---------|------|-------------|
| TBD | TBD | Dialog text |
| TBD | TBD | Menu text |

---

*To be populated from dq3r-info analysis data*
