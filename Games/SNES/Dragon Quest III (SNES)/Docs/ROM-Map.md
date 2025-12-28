# Dragon Quest III (SNES) - ROM Map

> **Status:** � In Progress (96.48% coverage)

Complete ROM map for Dragon Quest III (SNES) - HiROM mapping.

## ROM Information

| Property | Value |
|----------|-------|
| Type | HiROM (Mode $21) |
| Size | 6,291,456 bytes (6 MB / 48 Mbit) |
| Banks | 192 ($00-$BF) |
| ROM Header | $FFC0-$FFDF |

## Memory Mapping (HiROM)

### Address Translation

```
SNES Address        PC File Offset      Description
$c00000-$c0ffff  →  $000000-$00ffff    Bank $00
$c10000-$c1ffff  →  $010000-$01ffff    Bank $01
...
$ff0000-$ffffff  →  $3f0000-$3fffff    Bank $3F (mirrors to $BF)

For HiROM: PC = (SNES_Address & 0x3FFFFF)
```

## Bank Overview

| Bank | SNES Address | File Offset | Description |
|------|--------------|-------------|-------------|
| $00 | $c00000 | $000000 | Boot code, reset vectors, system init |
| $01 | $c10000 | $010000 | Main game engine |
| $02 | $c20000 | $020000 | Battle system core |
| $03 | $c30000 | $030000 | Menu/UI system |
| $04 | $c40000 | $040000 | Field/map engine |
| $05 | $c50000 | $050000 | Audio/music driver |
| $06 | $c60000 | $060000 | Graphics routines |
| $07 | $c70000 | $070000 | Text/dialog engine |
| $08 | $c80000 | $080000 | NPC/event scripts |
| $09-$3F | ... | ... | Data banks (graphics, maps, text) |

## ROM Header ($FFC0)

| Offset | Field | Value |
|--------|-------|-------|
| $FFC0 | Title | "DRAGONQUEST3       " |
| $FFD5 | Map Mode | $21 (HiROM, FastROM) |
| $FFD6 | Type | $00 (ROM only) |
| $FFD7 | ROM Size | $0C (4MB) |
| $FFD8 | RAM Size | $03 (8KB) |
| $FFD9 | Country | $00 (Japan) |

## Key ROM Regions

For detailed documentation, see:
- [reference/memory_map.md](reference/memory_map.md) - Detailed memory map
- [reference/TECHNICAL_SPECS.md](reference/TECHNICAL_SPECS.md) - Hardware specifications

---

*Data sourced from dq3r-info analysis (192 bank disassembly)*
