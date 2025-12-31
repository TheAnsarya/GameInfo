# Analysis Tools Guide

Tools for ROM analysis and reverse engineering.

## Overview

These tools help analyze ROM structure, find patterns, trace execution, and understand ROM organization.

## Tools

### rom_info.py

Extract detailed ROM information.

```bash
# Basic info
python tools/rom/rom_info.py game.nes

# Verbose with all headers
python tools/rom/rom_info.py game.nes --verbose

# JSON output
python tools/rom/rom_info.py game.nes --format json --output info.json
```

**Supported Systems:**
- NES (iNES, NES 2.0)
- SNES (LoROM, HiROM, ExHiROM)
- Game Boy / GBC
- Genesis / Mega Drive
- GBA

### hex_finder.py

Search for hex patterns and text strings.

```bash
# Search hex pattern
python tools/analysis/hex_finder.py game.nes --hex "4C ?? 80"

# Search text
python tools/analysis/hex_finder.py game.nes --text "DRAGON"

# Search with TBL encoding
python tools/analysis/hex_finder.py game.nes --text "DRAGON" --tbl table.tbl

# Find all JMP instructions
python tools/analysis/hex_finder.py game.nes --hex "4C" --context 2
```

**Pattern Syntax:**
- `??` - Any byte
- `4C` - Exact byte
- `[40-4F]` - Byte range

### bank_analyzer.py

Analyze ROM bank contents.

```bash
# Generate bank map
python tools/analysis/bank_analyzer.py game.nes --output bank_map.txt

# Analyze specific bank
python tools/analysis/bank_analyzer.py game.nes --bank 5

# Detect content types
python tools/analysis/bank_analyzer.py game.nes --detect-types
```

**Detected Types:**
- Code (opcodes pattern)
- Text (ASCII/TBL)
- Graphics (CHR patterns)
- Compressed data
- Pointer tables

### trace_analyzer.py

Analyze CPU execution traces.

```bash
# Load Mesen trace
python tools/debug/trace_analyzer.py trace.txt --format mesen

# Find most executed addresses
python tools/debug/trace_analyzer.py trace.txt --top 20

# Find calls to address
python tools/debug/trace_analyzer.py trace.txt --calls-to 0x8000

# Generate call graph
python tools/debug/trace_analyzer.py trace.txt --call-graph --output graph.dot
```

### savestate.py

Analyze emulator save states.

```bash
# Compare two states
python tools/debug/savestate.py compare state1.mss state2.mss

# Extract RAM
python tools/debug/savestate.py extract state.mss --section RAM --output ram.bin

# Diff specific section
python tools/debug/savestate.py diff state1.mss state2.mss --section VRAM
```

### pointer_scanner.py

Find and analyze pointer tables.

```bash
# Scan for pointers
python tools/text/pointers.py game.nes --scan --bank 0

# Analyze known pointer table
python tools/text/pointers.py game.nes --offset 0x8000 --count 20

# Follow pointers and extract
python tools/text/pointers.py game.nes --offset 0x8000 --count 20 --extract
```

### compression.py

Detect and decompress data.

```bash
# Detect compression
python tools/rom/compression.py detect game.nes --offset 0x10000

# Decompress RLE
python tools/rom/compression.py decompress game.nes --offset 0x10000 --type rle

# Decompress LZSS
python tools/rom/compression.py decompress game.nes --offset 0x10000 --type lzss
```

**Supported Compression:**
- RLE (Run-Length Encoding)
- LZSS variants
- Huffman
- Game-specific formats

### mapper_info.py

NES mapper documentation and analysis.

```bash
# Lookup mapper
python tools/rom/mapper_info.py lookup 4

# List all mappers
python tools/rom/mapper_info.py list

# Detect mapper features
python tools/rom/mapper_info.py analyze game.nes
```

## Workflow Examples

### Initial ROM Analysis

```bash
# 1. Get ROM info
python tools/rom/rom_info.py game.nes --verbose

# 2. Analyze banks
python tools/analysis/bank_analyzer.py game.nes --detect-types > bank_analysis.txt

# 3. Find reset vector
python tools/analysis/hex_finder.py game.nes --hex "4C" --offset 0xFFFC
```

### Finding Game Text

```bash
# 1. Search for known text
python tools/analysis/hex_finder.py game.nes --text "START"

# 2. Scan for pointer tables near text
python tools/text/pointers.py game.nes --scan --near 0x8000

# 3. Extract via pointers
python tools/text/pointers.py game.nes --offset 0x8100 --count 50 --extract
```

### Comparing ROM Versions

```bash
# 1. Get info on both
python tools/rom/rom_info.py original.nes > orig.txt
python tools/rom/rom_info.py modified.nes > mod.txt

# 2. Binary diff
python tools/rom/rom_diff.py original.nes modified.nes --output diff.txt
```

## See Also

- [CDL Tools](cdl-tools.md) - Code coverage analysis
- [Label Tools](label-tools.md) - Debug symbols
- [Text Tools](text-tools.md) - Text extraction
- [Graphics Tools](graphics-tools.md) - Graphics extraction
