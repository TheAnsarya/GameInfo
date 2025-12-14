# SNES Build Pipeline Implementation

Parent: #56 (Build Pipeline Epic)

## Overview

Implement build pipeline support for SNES/Super Famicom ROMs using the asar assembler.

## Scope

### Supported ROM Formats
- SMC (.smc) - With 512-byte copier header
- SFC (.sfc) - Headerless format
- LoROM and HiROM mapping modes
- ExHiROM for larger ROMs

### Assembler Integration
- **Primary**: asar (multi-architecture assembler)
- **Secondary**: bass (for specific projects)
- **Config**: Custom mapping definitions

### Asset Pipeline
- **Graphics**: 2bpp, 4bpp, 8bpp tile extraction
- **Palettes**: 15-bit BGR format (32768 colors)
- **Maps**: Mode 7 and standard tilemaps
- **Music**: SPC700 audio extraction
- **Text**: DTE/custom encoding tables
- **Compression**: LZSS, RLE, custom algorithms

### Special Features
- Mode 7 graphics support
- Enhancement chip handling (SA-1, SuperFX, DSP)
- HDMA table parsing

## Tasks

- [ ] Create SNES pipeline configuration schema
- [ ] Implement multi-bpp tile extractor/injector
- [ ] Implement SNES palette converter (15-bit BGR ↔ 24-bit RGB)
- [ ] Implement SPC audio extractor
- [ ] Create asar project template generator
- [ ] Add LoROM/HiROM build configurations
- [ ] Implement common compression algorithms
- [ ] Write unit tests for SNES pipeline

## Acceptance Criteria

- [ ] Can extract all graphical assets from SNES ROM to PNG
- [ ] Can extract palette data to JSON
- [ ] Can extract and reinsert SPC audio
- [ ] Can convert edited assets back to binary
- [ ] Can assemble complete SNES ROM from source
- [ ] Built ROM matches original byte-for-byte (when no modifications)

## Related Projects
- Dragon Quest I & II (SNES)
- Dragon Quest III (SNES)
- Final Fantasy IV (SNES)
- Final Fantasy Mystic Quest (SNES)
- Chrono Trigger (SNES)
