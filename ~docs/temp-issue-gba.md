# GBA Build Pipeline Implementation

Parent: #56 (Build Pipeline Epic)

## Overview

Implement build pipeline support for Game Boy Advance ROMs using devkitARM/devkitPro toolchain.

## Scope

### Supported ROM Formats
- GBA (.gba) - Standard ROM format
- AGB (.agb) - Alternative extension
- Multiboot (.mb) - Small bootable ROMs

### Assembler/Compiler Integration
- **Primary**: devkitARM (arm-none-eabi-gcc, arm-none-eabi-as)
- **Secondary**: Thumb assembler mode
- **Config**: Linker scripts for GBA memory layout

### Asset Pipeline
- **Graphics**: 4bpp and 8bpp tiles, bitmap modes
- **Palettes**: 15-bit BGR (256 BG colors, 256 sprite colors)
- **Maps**: Text modes (0-2), affine modes (1-2), bitmap modes (3-5)
- **Music**: GBA sound (GB channels + 2 DMA channels)
- **Sprites**: OAM with affine transformation support
- **Text**: Custom encoding, Shift-JIS common

### Special Features
- ARM/Thumb code modes
- Affine (rotation/scaling) sprites and backgrounds
- Bitmap video modes
- Sound mixing engines (various)
- Flash/EEPROM/SRAM save types
- RTC support

## Tasks

- [ ] Create GBA pipeline configuration schema
- [ ] Implement 4bpp/8bpp tile extractor/injector
- [ ] Implement GBA palette converter (15-bit BGR)
- [ ] Implement tilemap parser (all text modes)
- [ ] Implement bitmap mode extractor
- [ ] Implement OAM attribute parser
- [ ] Create devkitARM project template generator
- [ ] Add Makefile template generation
- [ ] Implement audio extraction (various engines)
- [ ] Write unit tests for GBA pipeline

## Acceptance Criteria

- [ ] Can extract all graphical assets from GBA ROM to PNG
- [ ] Can extract palette data to JSON
- [ ] Can handle affine transformation parameters
- [ ] Can extract bitmap mode images
- [ ] Can convert edited assets back to binary
- [ ] Can build complete GBA ROM from source
- [ ] Built ROM matches original byte-for-byte (when no modifications)

## Technical Notes

### Memory Map
```
$00000000-$00003FFF - BIOS (16KB)
$02000000-$0203FFFF - EWRAM (256KB)
$03000000-$03007FFF - IWRAM (32KB)
$04000000-$040003FF - I/O registers
$05000000-$050003FF - Palette RAM (1KB)
$06000000-$06017FFF - VRAM (96KB)
$07000000-$070003FF - OAM (1KB)
$08000000-$09FFFFFF - ROM (32MB max)
$0E000000-$0E00FFFF - SRAM (64KB)
```

### Tile Format
- 4bpp: 32 bytes per 8x8 tile (packed nibbles)
- 8bpp: 64 bytes per 8x8 tile
- Little-endian byte order

### Affine Parameters
- 16-bit fixed-point (8.8 format)
- PA, PB, PC, PD matrix elements
- Reference point: 20.8 fixed-point
