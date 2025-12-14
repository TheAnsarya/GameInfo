# NES Build Pipeline Implementation

Parent: #56 (Build Pipeline Epic)

## Overview

Implement build pipeline support for NES/Famicom ROMs using ca65/ld65 assembler from the cc65 suite.

## Scope

### Supported ROM Formats
- iNES (.nes) - Standard format with header
- NES 2.0 (.nes) - Extended header format
- Raw PRG/CHR split files

### Assembler Integration
- **Primary**: ca65/ld65 (cc65 suite)
- **Config**: Custom linker configs for various mappers

### Asset Pipeline
- **Graphics**: CHR ROM extraction/injection (8x8 tiles, 2bpp)
- **Palettes**: NES palette format (54 colors)
- **Maps**: Nametable/attribute data
- **Music**: NSF/raw sound data
- **Text**: Custom table files (.tbl)

### Mappers to Support (Initial)
- NROM (0)
- MMC1 (1)
- MMC3 (4)
- CNROM (3)

## Tasks

- [ ] Create NES pipeline configuration schema
- [ ] Implement CHR tile extractor/injector
- [ ] Implement nametable parser
- [ ] Implement palette handler
- [ ] Create ca65 project template generator
- [ ] Add mapper-specific build configurations
- [ ] Write unit tests for NES pipeline

## Acceptance Criteria

- [ ] Can extract all graphical assets from NES ROM to PNG
- [ ] Can extract palette data to JSON
- [ ] Can convert edited assets back to binary
- [ ] Can assemble complete NES ROM from source
- [ ] Built ROM matches original byte-for-byte (when no modifications)

## Related Projects
- dragon-warrior-4-info (Dragon Warrior IV NES)
- dragon-warrior-info (Dragon Warrior series)
