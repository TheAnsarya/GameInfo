# Technical Implementation Details

## SNES Architecture Support

### 65816 Processor
- Complete opcode set implementation (100+ instructions)
- Addressing mode parsing (immediate, absolute, relative, long, etc.)
- Processor status flag tracking
- Bank/address calculation and mapping

### SNES Hardware Registers
- PPU registers (graphics processing)
- APU registers (audio processing)
- DMA registers (data transfer)
- Controller input registers

## Data Format Support

### Graphics Formats
- 4bpp planar tile format
- 2bpp planar tile format
- BGR555 color palette format
- Tilemap/arrangement data

### Text Encodings
- ASCII text extraction
- Dragon Quest 3 Japanese text
- Item name encoding
- Menu text encoding

### Data Structures
- 16-bit and 24-bit pointer tables
- Character/monster stat tables
- Lookup tables and arrays
- Structured data blocks

## Analysis Algorithms

### Shannon Entropy Calculation
- Used for data type classification
- Identifies compressed vs uncompressed data
- Distinguishes code from graphics

### Pattern Matching
- Regular expression-based text detection
- Heuristic-based data structure identification
- Cross-reference graph building

### Code Flow Analysis
- Function entry point detection
- Call graph construction
- Control flow tracking

