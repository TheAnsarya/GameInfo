# Dragon Quest III (SNES) - Analysis Tools

This folder contains analysis tools for ROM analysis and asset extraction.

## Folder Structure

```
tools/
├── README.md               # This file
├── python/                 # Python analysis tools
│   ├── analysis/          # ROM analyzers
│   ├── graphics/          # Graphics decoders
│   ├── reconstruction/    # Source reconstruction
│   ├── documentation/     # Doc generators
│   ├── editing/           # ROM editing tools
│   ├── formatting/        # Hex formatter
│   └── utils/             # Shared utilities
└── csharp/                 # C# libraries (from logsmall)
    ├── DQ3SFC/            # SNES-specific DQ3 library
    │   ├── datamap.json   # ROM address map
    │   ├── Compression/   # Decompression routines
    │   └── Text/          # Text handling
    └── DQ3Lib/            # Common DQ3 library
        ├── Compression/   # Compression utilities
        └── Text/          # Text encoding
```

## Python Tools Usage

```bash
# Analyze ROM structure
python tools/python/analysis/comprehensive_rom_analyzer.py --rom "path/to/dq3.sfc"

# Extract graphics
python tools/python/graphics/snes_graphics_decoder.py --rom "path/to/dq3.sfc"

# Format hex values to lowercase
python tools/python/formatting/hex_formatter.py --input "file.asm"
```

## C# Libraries

The C# libraries from logsmall provide:
- ROM data structure definitions
- Compression/decompression algorithms
- Text encoding/decoding
- Data map with ROM addresses

See [csharp/README.md](csharp/README.md) for details.

## Status

✅ **Python Tools** - Complete (migrated from dq3r-info)
✅ **C# Libraries** - Complete (copied from logsmall)
🔄 **C# Migration** - In progress (see issue #141)
