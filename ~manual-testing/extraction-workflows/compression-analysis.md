# Compression Analysis Workflow

How to identify and decode compressed data in ROMs.

## 🎯 Overview

Many SNES games compress:
- Graphics (tiles, sprites)
- Maps and tilemaps
- Text strings
- Music sequences

Common compression types:
- **LZ variants** (LZSS, LZ77)
- **RLE** (Run-Length Encoding)
- **Huffman**
- **Custom/proprietary**

## 🔬 Identification Steps

### Step 1: Find Decompression Routine

1. Set write breakpoint on RAM destination
2. Trigger data load (enter area, open menu, etc.)
3. Break catches decompression routine
4. Trace backwards to find compressed source

### Step 2: Analyze Routine

Look for these patterns:

**LZ/LZSS indicators:**
```asm
; Flag byte read
LDA (src),Y
STA flags
; Shift/rotate operations
LSR flags / ROL flags
; Copy from earlier output
LDA (dest-offset)
STA (dest)
```

**RLE indicators:**
```asm
; Count byte followed by data byte
LDA count
loop: STA (dest)
DEX
BNE loop
```

### Step 3: Document Format

Record:
- Header structure (if any)
- Flag byte encoding
- Match length encoding
- Match offset encoding
- Termination condition

## 📐 Common Compression Formats

### LZSS (Very Common)

```
Header: [uncompressed_size: 2 bytes]

Data stream:
- Flag byte (8 operations)
  - Bit 1: Literal byte follows
  - Bit 0: Reference follows
    - [offset: 12 bits][length: 4 bits]
```

### RLE

```
Data stream:
- [count byte][data byte]
  - count < 128: repeat data count times
  - count >= 128: copy (count - 128) literal bytes
```

### DQ3-specific (estimated)

DQ3 SNES may use modified LZSS:
- 16-bit flags
- Variable offset sizes
- Look-back window of 4KB

## 🔧 Analysis Tools

### Entropy Check

High entropy (random-looking) = likely compressed
```python
def check_entropy(data):
    from collections import Counter
    counts = Counter(data)
    entropy = -sum(p * log2(p) for p in 
                   [c/len(data) for c in counts.values()])
    return entropy  # Max ~8 for random data
```

### Pattern Search

```python
# Find repeated magic bytes that might indicate compression header
def find_compression_headers(rom_data):
    candidates = []
    for i in range(len(rom_data) - 4):
        # Common patterns: size word followed by 
        # flag-like structure
        if rom_data[i:i+2] < b'\x00\x80':  # Reasonable size
            if rom_data[i+2] in [0xFF, 0x00, 0x80]:  # Flag-like
                candidates.append(i)
    return candidates
```

## 📝 Documentation Template

```markdown
## Compression Format: [Game/Type]

### Overview
- Algorithm: [LZ/RLE/Huffman/Custom]
- Used For: [Graphics/Text/Maps]

### Header Format
| Offset | Size | Description |
|--------|------|-------------|
| $00 | 2 | Decompressed size |
| $02 | ... | Compressed data |

### Flag Byte Encoding
- Bit 1: [meaning]
- Bit 0: [meaning]

### Reference Format
- Offset: [bits] - [encoding]
- Length: [bits] - [encoding]

### Decompression Routine
- ROM Address: $______
- RAM Destination: $______

### Python Implementation
```python
def decompress(data):
    # Implementation here
    pass
```
```

## 🔗 Related

- [Graphics Extraction](graphics-extraction.md) - Extract after decompression
- [DMA Tracing](../breakpoint-guides/dma-tracing.md) - Find compressed data sources
