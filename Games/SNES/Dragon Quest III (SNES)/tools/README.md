# Dragon Quest III (SNES) - Analysis Tools

This folder contains Python tools for ROM analysis and asset extraction.

## Tools

### From dq3r-info repository:
- `analyze_rom.py` - Initial ROM structure analysis
- `compression_engine.py` - Compression/decompression
- `graphics_analyzer.py` - Graphics data detection
- `text_extractor.py` - Text string extraction
- `maximum_rom_analyzer.py` - Comprehensive ROM analysis

### Usage

```bash
# Analyze ROM structure
python tools/analyze_rom.py --rom "path/to/dq3.sfc"

# Extract graphics
python tools/extract_graphics.py --rom "path/to/dq3.sfc" --output assets/graphics/

# Extract text
python tools/extract_text.py --rom "path/to/dq3.sfc" --output assets/text/
```

## Status

🔴 **Not Started** - Tools will be migrated from dq3r-info repository.

## C# Migration

These Python tools will eventually be converted to C# (.NET 10) for integration with DarkRepos/Editor.
See issue #141 for progress.
