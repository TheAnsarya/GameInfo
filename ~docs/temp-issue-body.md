# Build Pipeline System

## Overview

Create a comprehensive build pipeline system that allows building ROMs from source code and assets, with full asset extraction and conversion capabilities.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     BUILD PIPELINE FLOW                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Original ROM                                                   │
│       │                                                         │
│       ▼                                                         │
│  ┌─────────────┐    Extract Assets    ┌──────────────────┐     │
│  │ ROM Parser  │ ─────────────────────▶│ Binary Assets    │     │
│  └─────────────┘                       │ (Graphics, Music, │     │
│                                        │  Text, Data)      │     │
│                                        └──────────────────┘     │
│                                                 │               │
│                                                 ▼               │
│                                        ┌──────────────────┐     │
│                                        │ Asset Converter  │     │
│                                        │ (bin → editable) │     │
│                                        └──────────────────┘     │
│                                                 │               │
│                                                 ▼               │
│                                        ┌──────────────────┐     │
│                                        │ Editable Assets  │     │
│                                        │ (PNG, JSON, etc) │     │
│                                        └──────────────────┘     │
│                                                 │               │
│                                                 ▼ (User edits)  │
│                                        ┌──────────────────┐     │
│                                        │ Modified Assets  │     │
│                                        └──────────────────┘     │
│                                                 │               │
│                                                 ▼               │
│                                        ┌──────────────────┐     │
│                                        │ Asset Converter  │     │
│                                        │ (editable → bin) │     │
│                                        └──────────────────┘     │
│                                                 │               │
│       ┌─────────────┐                          │               │
│       │ Source ASM  │◀─────── .include ────────┘               │
│       │   Files     │                                          │
│       └─────────────┘                                          │
│              │                                                  │
│              ▼                                                  │
│       ┌─────────────┐                                          │
│       │  Assembler  │ (ca65, asar, asm68k, rgbds)              │
│       └─────────────┘                                          │
│              │                                                  │
│              ▼                                                  │
│       ┌─────────────┐                                          │
│       │  New ROM    │                                          │
│       └─────────────┘                                          │
└─────────────────────────────────────────────────────────────────┘
```

## Supported Platforms

### NES

- **Assemblers:** ca65, asm6, nesasm
- **Graphics:** 2bpp CHR, palettes
- **Audio:** NSF drivers
- **Mappers:** NROM, MMC1, MMC3, MMC5, etc.

### SNES

- **Assemblers:** asar, bass, ca65
- **Graphics:** 2bpp, 4bpp, 8bpp, Mode 7
- **Audio:** SPC700/BRR
- **Enhancement chips:** SA-1, SuperFX, etc.

### Genesis/Mega Drive

- **Assemblers:** asm68k, as (GNU)
- **Graphics:** 4bpp tiles
- **Audio:** YM2612/PSG
- **CPU:** 68000 + Z80

### Game Boy / Game Boy Color

- **Assemblers:** rgbds (rgbasm)
- **Graphics:** 2bpp tiles
- **Audio:** GB sound registers

### GBA

- **Toolchain:** devkitARM
- **Graphics:** 4bpp/8bpp, affine
- **Audio:** MP2K, various engines

## Configuration Schema

See `docs/build-pipeline/configuration.md` for full schema.

## Asset Types

| Type | Binary Format | Editable Format | Notes |
|------|--------------|-----------------|-------|
| Graphics | CHR/Tiles | PNG | With palette metadata |
| Palettes | Binary | JSON | RGB values |
| Text | Encoded bytes | JSON/TXT | With TBL support |
| Maps | Binary tiles | JSON | With layer support |
| Music | Platform-specific | MML/JSON | NSF, SPC, VGM |
| Data | Struct bytes | JSON | Schema-defined |
| Scripts | Bytecode | JSON/Script | Game-specific |

## Sub-Issues

- [ ] NES Build Pipeline
- [ ] SNES Build Pipeline
- [ ] Genesis Build Pipeline
- [ ] Game Boy Build Pipeline
- [ ] GBA Build Pipeline
- [ ] Asset Extraction Tools
- [ ] Asset Conversion Framework
- [ ] Build Configuration Schema
- [ ] CLI Build Commands
- [ ] Build Verification System

## Related

- Epic #10: Asset Extraction Pipeline
- Epic #9: Game-Specific Disassemblies
