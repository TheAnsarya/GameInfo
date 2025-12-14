# Game Boy/GBC Build Pipeline Implementation

Parent: #56 (Build Pipeline Epic)

## Overview

Implement build pipeline support for Game Boy and Game Boy Color ROMs using the RGBDS assembler suite.

## Scope

### Supported ROM Formats
- GB (.gb) - Original Game Boy
- GBC (.gbc) - Game Boy Color
- Dual-mode ROMs (GB with GBC enhancements)

### Assembler Integration
- **Primary**: RGBDS (rgbasm, rgblink, rgbfix)
- **Config**: ROM banking and header configuration

### Asset Pipeline
- **Graphics (GB)**: 2bpp tiles (8x8), 4 shades
- **Graphics (GBC)**: 2bpp tiles with palette banks, 56 colors (32 BG + 8 sprites × 3)
- **Palettes**: GB 2-bit shades, GBC 15-bit BGR
- **Maps**: Background tilemaps, window layer
- **Music**: Game Boy sound chip (4 channels)
- **Text**: Custom encoding tables

### Special Features
- MBC support (MBC1, MBC3, MBC5, etc.)
- SRAM save data handling
- GBC double-speed mode
- VRAM banking (GBC)
- Palette animation (GBC)

## Tasks

- [ ] Create GB/GBC pipeline configuration schema
- [ ] Implement 2bpp tile extractor/injector
- [ ] Implement GB palette converter
- [ ] Implement GBC palette converter (15-bit BGR)
- [ ] Implement tilemap parser with attribute support
- [ ] Create RGBDS project template generator
- [ ] Add MBC configuration support
- [ ] Implement GBS music extraction
- [ ] Write unit tests for GB/GBC pipeline

## Acceptance Criteria

- [ ] Can extract all graphical assets from GB/GBC ROM to PNG
- [ ] Can extract palette data to JSON
- [ ] Can handle VRAM bank attributes (GBC)
- [ ] Can convert edited assets back to binary
- [ ] Can assemble complete ROM from source with rgbfix
- [ ] Built ROM matches original byte-for-byte (when no modifications)

## Technical Notes

### Memory Map
```
$0000-$3FFF - ROM Bank 0 (fixed)
$4000-$7FFF - ROM Bank N (switchable)
$8000-$9FFF - VRAM (8KB, 2 banks on GBC)
$A000-$BFFF - External RAM (SRAM)
$C000-$DFFF - WRAM (8KB, 8 banks on GBC)
$FE00-$FE9F - OAM (sprite attributes)
$FF00-$FF7F - I/O registers
$FF80-$FFFE - HRAM
```

### Tile Format
- 2 bits per pixel, planar format
- 8x8 pixels = 16 bytes per tile
- Each row: 2 bytes (low bits, high bits)
