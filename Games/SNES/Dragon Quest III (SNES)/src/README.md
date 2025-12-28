# Dragon Quest III (SNES) - Source

This folder contains the buildable assembly source for Dragon Quest III (SNES).

## Subfolders

- `asm/` - Main assembly source files
- `include/` - Header files, constants, macros
- `data/` - Data tables (included via .include directives)

## Build System

```powershell
# Build ROM from source
.\build.ps1 -Game DQ3r

# Verify against original
python tools/verify_rom.py
```

## Status

🔴 **Not Started** - Source files will be created from disassembly.
