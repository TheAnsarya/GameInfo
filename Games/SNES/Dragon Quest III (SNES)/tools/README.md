# Dragon Quest III (SNES) - Analysis Tools

This folder contains Python tools for ROM analysis and asset extraction.

## Folder Structure

```
tools/
├── README.md               # This file
└── python/                 # Python analysis tools
    ├── analysis/          # ROM analyzers
    │   ├── comprehensive_rom_analyzer.py
    │   ├── cross_reference_engine.py
    │   ├── disassembly_engine.py
    │   ├── graphics_format_analyzer.py
    │   ├── memory_banking_analyzer.py
    │   └── snes_disassembler.py
    ├── graphics/          # Graphics decoders
    │   ├── graphics_visualizer.py
    │   └── snes_graphics_decoder.py
    ├── reconstruction/    # Source reconstruction
    │   └── advanced_source_reconstructor.py
    ├── documentation/     # Doc generators
    ├── editing/           # ROM editing tools
    ├── formatting/        # Hex formatter
    ├── utils/             # Shared utilities
    └── ...
```

## Usage

```bash
# Analyze ROM structure
python tools/python/analysis/comprehensive_rom_analyzer.py --rom "path/to/dq3.sfc"

# Extract graphics
python tools/python/graphics/snes_graphics_decoder.py --rom "path/to/dq3.sfc"

# Format hex values to lowercase
python tools/python/formatting/hex_formatter.py --input "file.asm"
```

## Status

✅ **Complete** - Tools migrated from dq3r-info repository.

## C# Migration

These Python tools will eventually be converted to C# (.NET 10) for integration with DarkRepos/Editor.
See issue #141 for progress.
