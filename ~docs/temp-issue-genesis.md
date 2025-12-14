# Genesis/Mega Drive Build Pipeline Implementation

Parent: #56 (Build Pipeline Epic)

## Overview

Implement build pipeline support for Sega Genesis/Mega Drive ROMs using the asm68k assembler.

## Scope

### Supported ROM Formats
- BIN (.bin) - Raw binary format
- MD (.md) - Standard ROM format
- SMD (.smd) - Interleaved format (with deinterleave support)
- 32X extension support

### Assembler Integration
- **Primary**: asm68k (Motorola 68000 assembler)
- **Secondary**: AS (portable assembler)
- **Config**: Genesis memory mapping

### Asset Pipeline
- **Graphics**: 4bpp planar tiles (8x8)
- **Palettes**: 9-bit BGR format (512 colors, 4 palettes of 16)
- **Maps**: VDP plane tilemaps
- **Music**: FM synthesis (YM2612) + PSG
- **DMA**: Transfer tables for VRAM
- **Text**: Shift-JIS and custom encodings

### Special Features
- VDP register configuration
- Z80 sound driver support
- Sega CD extension handling
- Sprite attribute tables

## Tasks

- [ ] Create Genesis pipeline configuration schema
- [ ] Implement Genesis tile extractor/injector (4bpp planar)
- [ ] Implement Genesis palette converter (9-bit BGR)
- [ ] Implement VDP tilemap parser
- [ ] Implement SMD deinterleaver
- [ ] Create asm68k project template generator
- [ ] Add FM sound data extraction (VGM format)
- [ ] Write unit tests for Genesis pipeline

## Acceptance Criteria

- [ ] Can extract all graphical assets from Genesis ROM to PNG
- [ ] Can extract palette data to JSON
- [ ] Can convert SMD to BIN and vice versa
- [ ] Can convert edited assets back to binary
- [ ] Can assemble complete Genesis ROM from source
- [ ] Built ROM matches original byte-for-byte (when no modifications)

## Technical Notes

### Genesis Memory Map
```
$000000-$3FFFFF - ROM (up to 4MB)
$E00000-$E0FFFF - RAM (64KB)
$FF0000-$FFFFFF - RAM mirror
$C00000-$C0001F - VDP ports
$A00000-$A0FFFF - Z80 address space
```

### Tile Format
- 4 bits per pixel, planar format
- 8x8 pixels = 32 bytes per tile
- Big-endian byte order
