# Soul Blazer (SNES) - ROM Map

## Overview

Soul Blazer uses **LoROM** mapping with a 1MB ROM (32 banks of 32KB each).

## Memory Mapping

### LoROM Address Conversion

```
File Offset = (Bank * $8000) + (Address & $7FFF)
CPU Address = (Bank << 16) | $8000 | (File Offset & $7FFF)
```

## Bank Layout

| Bank | File Offset | Size | Description |
|------|-------------|------|-------------|
| $00 | $000000-$007fff | 32KB | Main program code, interrupt vectors |
| $01 | $008000-$00ffff | 32KB | Game logic subroutines |
| $02 | $010000-$017fff | 32KB | Text/dialogue data |
| $03 | $018000-$01ffff | 32KB | Text/dialogue data (continued) |
| $04 | $020000-$027fff | 32KB | Text/dialogue data (continued) |
| $05 | $028000-$02ffff | 32KB | Game data, maps |
| $06 | $030000-$037fff | 32KB | Enemy/NPC data |
| $07 | $038000-$03ffff | 32KB | Item/equipment data |
| $08 | $040000-$047fff | 32KB | Map data |
| $09 | $048000-$04ffff | 32KB | Map data (continued) |
| $0a | $050000-$057fff | 32KB | Map data (continued) |
| $0b | $058000-$05ffff | 32KB | Level data |
| $0c | $060000-$067fff | 32KB | Level data (continued) |
| $0d | $068000-$06ffff | 32KB | Graphics data |
| $0e | $070000-$077fff | 32KB | Graphics data (continued) |
| $0f | $078000-$07ffff | 32KB | Audio/SPC data |
| $10-$1f | $080000-$0fffff | 512KB | Compressed graphics, sprites |

## Key Addresses

### Bank $00 - Main Code

| Address | File | Description |
|---------|------|-------------|
| $00:8000 | $000000 | Reset vector entry |
| $00:8342 | $000342 | NMI handler |
| $00:85a5 | $0005a5 | IRQ handler |
| $00:830b | $00030b | Debug string table |

### Interrupt Vectors (Native Mode) - $7fe0

| Offset | Vector | Address |
|--------|--------|---------|
| $7fe4 | COP | $d61e |
| $7fe6 | BRK | $d5fc |
| $7fea | NMI | $8342 |
| $7fee | IRQ | $85a5 |

### Interrupt Vectors (Emulation Mode) - $7ff0

| Offset | Vector | Address |
|--------|--------|---------|
| $7ffc | RESET | $8000 |
| $7ffa | NMI | $0015 |
| $7ffe | IRQ | $d011 |

## Text Locations

| File Offset | Bank:Address | Description |
|-------------|--------------|-------------|
| $004efa | $00:cefa | Opening dialogue |
| $0053c7 | $00:d3c7 | Ending dialogue |
| $010000+ | $02:8000+ | Main text bank |

## Pointer Tables

| File Offset | Bank:Address | Entry Count | Description |
|-------------|--------------|-------------|-------------|
| $0008bc | $00:88bc | 11 | Unknown table |
| $000fae | $00:8fae | 12 | Subroutine table |

## Data Sections (Preliminary)

### Graphics

| File Offset | Size | Description |
|-------------|------|-------------|
| $080000 | ~512KB | Main graphics data |

### Audio

| File Offset | Size | Description |
|-------------|------|-------------|
| $078000 | ~32KB | Sound/music data |

## Notes

- ROM is headerless (no SMC header)
- Uses battery-backed SRAM for saves
- Checksum validates correctly (0x6059 ^ 0x9fa6 = 0xffff)
