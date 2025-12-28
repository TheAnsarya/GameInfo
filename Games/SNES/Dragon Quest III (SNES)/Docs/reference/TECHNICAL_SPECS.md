# Dragon Quest III ROM Analysis - Technical Specifications

This document provides detailed technical information about the Dragon Quest III ROM structure, SNES hardware specifications, and analysis methodologies used in the toolkit.

## ROM File Specifications

### File Information

| Property | Value |
|----------|--------|
| Platform | Super Nintendo Entertainment System (SNES) |
| Region | Japan (original), Various (translations) |
| ROM Size | 6,291,456 bytes (48 Mbit / 6MB) |
| Map Mode | HiROM (Mode $21) |
| Header Location | $FFC0-$FFDF |
| Checksum Location | $FFDC-$FFDF |

### Memory Map (HiROM)

#### CPU Memory Map (65816)
```
$000000-$3FFFFF: System Area
  $000000-$1FFFFF: RAM/Registers (mirrored)
  $200000-$3FFFFF: Unused

$400000-$7FFFFF: ROM Slow (2.68 MHz)
  Maps to PC file offset $000000-$3FFFFF

$800000-$FFFFFF: ROM Fast (3.58 MHz)
  Maps to PC file offset $000000-$7FFFFF
```

#### HiROM Address Translation
```python
def hirom_to_pc(address):
    """Convert HiROM SNES address to PC file offset"""
    if 0x800000 <= address <= 0xFFFFFF:
        # Fast ROM area
        return address - 0x800000
    elif 0x400000 <= address <= 0x7FFFFF:
        # Slow ROM area
        return address - 0x400000
    else:
        return None  # Not ROM area

def pc_to_hirom(offset):
    """Convert PC file offset to HiROM address (fast area)"""
    if 0 <= offset < 0x800000:
        return offset + 0x800000
    else:
        return None
```

### ROM Header Structure

Located at offset $FFC0 in the ROM file:

| Offset | Size | Field | Description |
|--------|------|--------|-------------|
| $FFC0 | 21 | ROM Title | Game title (ASCII, space padded) |
| $FFD5 | 1 | Map Mode | Memory map mode ($21 = HiROM) |
| $FFD6 | 1 | Cartridge Type | ROM + RAM configuration |
| $FFD7 | 1 | ROM Size | log₂(ROM size / 1024) |
| $FFD8 | 1 | RAM Size | log₂(RAM size / 1024) |
| $FFD9 | 1 | Country Code | Region code (0 = Japan, 1 = US, etc.) |
| $FFDA | 1 | License Code | Publisher code |
| $FFDB | 1 | Version | ROM version number |
| $FFDC | 2 | Checksum Complement | ~checksum |
| $FFDE | 2 | Checksum | Sum of all ROM bytes |

#### Dragon Quest III Header Values
```
Title: "DRAGONQUEST3       " (Japanese version)
Map Mode: $21 (HiROM, FastROM)
Cartridge Type: $00 (ROM only)
ROM Size: $0C (4096KB = 4MB)
RAM Size: $03 (8KB)
Country: $00 (Japan)
License: $01 (Nintendo)
Version: $00
```

## SNES Hardware Specifications

### CPU: 65816 Processor

#### Processor Features
- 16-bit processor (65816 variant)
- Variable-length instructions (1-4 bytes)
- 24-bit address space (16MB)
- Multiple addressing modes
- 8/16-bit register modes

#### Registers
- **A**: Accumulator (8/16-bit)
- **X, Y**: Index registers (8/16-bit)
- **D**: Direct page register (16-bit)
- **S**: Stack pointer (16-bit)
- **PC**: Program counter (16-bit)
- **PB**: Program bank (8-bit)
- **DB**: Data bank (8-bit)
- **P**: Processor status (8-bit)

#### Status Flags (P register)
```
Bit 7: N - Negative
Bit 6: V - Overflow
Bit 5: M - Memory/Accumulator (0=16-bit, 1=8-bit)
Bit 4: X - Index register (0=16-bit, 1=8-bit)
Bit 3: D - Decimal mode
Bit 2: I - IRQ disable
Bit 1: Z - Zero
Bit 0: C - Carry
```

### Addressing Modes

The 65816 supports 23 addressing modes:

| Mode | Syntax | Example | Description |
|------|--------|---------|-------------|
| Absolute | `$1234` | `LDA $2000` | 16-bit address |
| Absolute,X | `$1234,X` | `LDA $2000,X` | Absolute + X register |
| Absolute,Y | `$1234,Y` | `LDA $2000,Y` | Absolute + Y register |
| Absolute Long | `$123456` | `LDA $C08000` | 24-bit address |
| Absolute Long,X | `$123456,X` | `LDA $C08000,X` | 24-bit + X register |
| Accumulator | `A` | `ROL A` | Operate on accumulator |
| Block Move | `$12,$34` | `MVN $80,$81` | Block move operations |
| Direct Page | `$12` | `LDA $80` | Zero page equivalent |
| Direct Page,X | `$12,X` | `LDA $80,X` | Direct page + X |
| Direct Page,Y | `$12,Y` | `LDA $80,Y` | Direct page + Y |
| Direct Page Indirect | `($12)` | `LDA ($80)` | Indirect through DP |
| Direct Page Indirect Long | `[$12]` | `LDA [$80]` | 24-bit indirect |
| DP Indirect,X | `($12,X)` | `LDA ($80,X)` | Pre-indexed indirect |
| DP Indirect,Y | `($12),Y` | `LDA ($80),Y` | Post-indexed indirect |
| DP Indirect Long,Y | `[$12],Y` | `LDA [$80],Y` | Long post-indexed |
| Immediate | `#$12` | `LDA #$00` | Immediate value |
| Implied | - | `NOP` | No operand |
| PC Relative | `$1234` | `BRA $8010` | Relative to PC |
| PC Relative Long | `$1234` | `BRL $8010` | 16-bit relative |
| Stack Relative | `$12,S` | `LDA $01,S` | Relative to stack |
| SR Indirect,Y | `($12,S),Y` | `LDA ($01,S),Y` | Stack indirect indexed |

### Audio System (SPC700)

#### SPC700 Processor
- 8-bit processor running at 1.024 MHz
- 64KB audio RAM
- Independent of main CPU
- Handles all audio processing

#### Audio Formats

##### BRR (Bit Rate Reduction)
BRR is the SNES native audio sample format:

```
Block Structure (9 bytes):
  Byte 0: Header
    Bits 7-4: Shift amount (0-12)
    Bits 3-2: Filter type (0-3)
    Bit 1: Loop flag
    Bit 0: End flag
  Bytes 1-8: 16 packed 4-bit samples
```

BRR Filters:
- **Filter 0**: Direct sample
- **Filter 1**: `sample += last * 15/16`
- **Filter 2**: `sample += last * 61/32 - prev * 15/16`
- **Filter 3**: `sample += last * 115/64 - prev * 13/16`

##### Audio Driver Detection
Common SNES audio drivers:
- **N-SPC**: Nintendo's standard driver
- **Kankichi-kun**: Alternative driver system
- **Custom**: Game-specific implementations

### Graphics System (PPU)

#### Video Modes
The SNES supports 8 video modes (0-7) with different capabilities:

| Mode | BG1 | BG2 | BG3 | BG4 | Colors | Sprites |
|------|-----|-----|-----|-----|--------|---------|
| 0 | 2bpp | 2bpp | 2bpp | 2bpp | 4+4+4+4 | 4 |
| 1 | 4bpp | 4bpp | 2bpp | - | 16+16+4 | 4 |
| 2 | 4bpp | 4bpp | - | - | 16+16 | 4 |
| 3 | 8bpp | 4bpp | - | - | 256+16 | 4 |
| 4 | 8bpp | 2bpp | - | - | 256+4 | 4 |
| 5 | 4bpp | 2bpp | - | - | 16+4 | 4 |
| 6 | 4bpp | - | - | - | 16 | 4 |
| 7 | 8bpp | - | - | - | 256 | 4 |

#### Tile Formats

##### 2BPP (4 colors)
```
8x8 tile = 16 bytes
Plane 0: 8 bytes (bits 0 of each pixel)
Plane 1: 8 bytes (bits 1 of each pixel)

Pixel value = (plane1_bit << 1) | plane0_bit
```

##### 4BPP (16 colors)
```
8x8 tile = 32 bytes
Plane 0: 8 bytes (bits 0)
Plane 1: 8 bytes (bits 1)
Plane 2: 8 bytes (bits 2)
Plane 3: 8 bytes (bits 3)

Pixel value = (p3 << 3) | (p2 << 2) | (p1 << 1) | p0
```

##### 8BPP (256 colors)
```
8x8 tile = 64 bytes
8 planes of 8 bytes each
Pixel value = 8-bit combination of all planes
```

#### Palette Format (RGB555)
```
16-bit color format:
Bit 15: Unused (0)
Bits 14-10: Red (0-31)
Bits 9-5: Green (0-31)
Bits 4-0: Blue (0-31)
```

## Dragon Quest III Data Structures

### Character Data

Based on analysis patterns, character data likely follows this structure:

```c
struct Character {
    uint16_t character_id;      // +0x00: Character identifier
    uint16_t current_hp;        // +0x02: Current hit points
    uint16_t maximum_hp;        // +0x04: Maximum hit points
    uint16_t current_mp;        // +0x06: Current magic points
    uint16_t maximum_mp;        // +0x08: Maximum magic points
    uint8_t  level;             // +0x0A: Character level
    uint8_t  experience[3];     // +0x0B: Experience points (24-bit)
    uint8_t  strength;          // +0x0E: Strength stat
    uint8_t  agility;           // +0x0F: Agility stat
    uint8_t  resilience;        // +0x10: Resilience stat
    uint8_t  wisdom;            // +0x11: Wisdom stat
    uint8_t  luck;              // +0x12: Luck stat
    uint8_t  job_class;         // +0x13: Current job class
    // ... additional fields
};
```

### Item Data

```c
struct Item {
    uint16_t item_id;           // +0x00: Item identifier
    uint8_t  item_type;         // +0x02: Type (weapon/armor/item/etc)
    uint8_t  rarity;            // +0x03: Item rarity/category
    uint16_t buy_price;         // +0x04: Purchase price
    uint16_t sell_price;        // +0x06: Sale price
    uint8_t  attack_power;      // +0x08: Attack bonus
    uint8_t  defense_power;     // +0x09: Defense bonus
    uint8_t  usability_flags;   // +0x0A: Who can use item
    uint8_t  special_effects;   // +0x0B: Special properties
    // ... additional fields
};
```

### Monster Data

```c
struct Monster {
    uint16_t monster_id;        // +0x00: Monster identifier
    uint16_t hit_points;        // +0x02: Monster HP
    uint16_t magic_points;      // +0x04: Monster MP (if applicable)
    uint8_t  attack_power;      // +0x06: Attack strength
    uint8_t  defense_power;     // +0x07: Defense strength
    uint8_t  agility;           // +0x08: Speed/agility
    uint8_t  wisdom;            // +0x09: Magic defense
    uint16_t exp_reward;        // +0x0A: Experience points given
    uint16_t gold_reward;       // +0x0C: Gold given
    uint8_t  resistance_flags;  // +0x0E: Status resistances
    uint8_t  special_abilities; // +0x0F: Special attacks/abilities
    // ... additional fields
};
```

## Analysis Algorithms

### Entropy Analysis

Shannon entropy calculation for data classification:

```python
def calculate_entropy(data):
    """Calculate Shannon entropy of byte data"""
    if not data:
        return 0.0

    # Count byte frequencies
    byte_counts = {}
    for byte in data:
        byte_counts[byte] = byte_counts.get(byte, 0) + 1

    # Calculate entropy
    entropy = 0.0
    data_len = len(data)

    for count in byte_counts.values():
        if count > 0:
            probability = count / data_len
            entropy -= probability * math.log2(probability)

    return entropy

# Entropy ranges for classification:
# 0.0 - 2.0: Highly repetitive (empty space, patterns)
# 2.0 - 4.0: Low entropy (simple data, text)
# 4.0 - 6.0: Medium entropy (code, structured data)
# 6.0 - 8.0: High entropy (graphics, audio, compressed)
```

### Graphics Detection

Multi-factor analysis for graphics data detection:

```python
def detect_graphics_data(data, offset):
    """Detect if data contains graphics"""
    factors = {}

    # Factor 1: Entropy (graphics usually high entropy)
    entropy = calculate_entropy(data)
    factors['entropy'] = min(entropy / 8.0, 1.0)

    # Factor 2: Byte distribution (graphics have even distribution)
    unique_bytes = len(set(data))
    factors['distribution'] = unique_bytes / 256.0

    # Factor 3: Pattern repetition (tiles create patterns)
    pattern_score = detect_tile_patterns(data)
    factors['patterns'] = pattern_score

    # Factor 4: Alignment (graphics often aligned to boundaries)
    alignment_score = 1.0 if (offset % 32) == 0 else 0.5
    factors['alignment'] = alignment_score

    # Weighted average
    weights = {'entropy': 0.4, 'distribution': 0.3, 'patterns': 0.2, 'alignment': 0.1}
    confidence = sum(factors[k] * weights[k] for k in weights)

    return confidence
```

### BRR Sample Detection

Algorithm for detecting BRR audio samples:

```python
def detect_brr_sample(data, offset):
    """Detect BRR audio sample at offset"""
    if len(data) < 9:
        return False

    score = 0
    block_count = 0

    pos = 0
    while pos + 9 <= len(data):
        header = data[pos]

        # Check header validity
        shift = (header >> 4) & 0x0F
        filter_type = (header >> 2) & 0x03
        loop_flag = (header >> 1) & 0x01
        end_flag = header & 0x01

        # Valid shift range
        if shift <= 12:
            score += 1

        # Valid filter type
        if filter_type <= 3:
            score += 1

        # Check sample data (should not be all zeros/all same)
        samples = data[pos + 1:pos + 9]
        if len(set(samples)) > 1:
            score += 1

        block_count += 1
        pos += 9

        # End flag terminates sample
        if end_flag:
            break

        # Prevent infinite loops
        if block_count > 1000:
            break

    # Confidence based on valid blocks
    confidence = (score / (block_count * 3)) if block_count > 0 else 0
    return confidence > 0.7
```

### Code Detection

65816 code detection algorithm:

```python
def detect_code_region(data, offset):
    """Detect if region contains 65816 code"""
    if len(data) < 16:
        return 0.0

    valid_instructions = 0
    total_bytes = 0
    pos = 0

    while pos < len(data) - 1:
        opcode = data[pos]

        # Check if opcode is valid
        if opcode in VALID_OPCODES:
            instruction_size = OPCODE_SIZES[opcode]

            # Check if we have enough bytes for instruction
            if pos + instruction_size <= len(data):
                valid_instructions += 1
                total_bytes += instruction_size
                pos += instruction_size
            else:
                pos += 1
        else:
            pos += 1

    # Calculate confidence
    if total_bytes > 0:
        confidence = (valid_instructions * 3) / len(data)  # 3 bytes average instruction
        return min(confidence, 1.0)
    else:
        return 0.0
```

## Data Type Classification

### Classification Rules

Based on entropy and content analysis:

| Data Type | Entropy Range | Characteristics |
|-----------|---------------|-----------------|
| **Empty** | 0.0 - 1.0 | All zeros or single repeated byte |
| **Text** | 1.0 - 3.0 | ASCII characters, low entropy |
| **Code** | 3.0 - 5.5 | Valid opcodes, medium entropy |
| **Data** | 2.0 - 6.0 | Structured data, variable entropy |
| **Graphics** | 5.0 - 8.0 | High entropy, pattern repetition |
| **Audio** | 6.0 - 8.0 | Very high entropy, BRR blocks |
| **Compressed** | 7.0 - 8.0 | Maximum entropy, no patterns |

### Bank Classification Algorithm

```python
def classify_bank(bank_data):
    """Classify 64KB bank by content type"""
    entropy = calculate_entropy(bank_data)

    # Quick checks first
    if entropy < 1.0:
        return 'empty'

    # Check for specific formats
    if detect_brr_sample(bank_data, 0):
        return 'audio'

    if detect_code_region(bank_data, 0) > 0.8:
        return 'code'

    graphics_confidence = detect_graphics_data(bank_data, 0)
    if graphics_confidence > 0.8:
        return 'graphics'

    # Text detection (ASCII patterns)
    ascii_ratio = sum(1 for b in bank_data if 32 <= b <= 126) / len(bank_data)
    if ascii_ratio > 0.3:
        return 'text'

    # Fallback based on entropy
    if entropy > 6.5:
        return 'mixed'  # Could be graphics/audio mix
    elif entropy > 4.0:
        return 'data'
    else:
        return 'unknown'
```

## Performance Optimization

### Memory Management

For large ROM analysis, several optimization techniques are employed:

#### Memory-Mapped Files
```python
import mmap

def create_memory_mapped_rom(filepath):
    """Create memory-mapped access to ROM file"""
    with open(filepath, 'rb') as f:
        return mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
```

#### Caching Strategy
```python
# Multi-level cache:
# Level 1: Memory cache (LRU, 256MB limit)
# Level 2: Disk cache (SQLite database)
# Level 3: Compressed archive cache

cache_hierarchy = {
    'memory': {'size_limit': 256 * 1024 * 1024, 'ttl': 1800},
    'disk': {'size_limit': 1024 * 1024 * 1024, 'ttl': 86400},
    'archive': {'compression': 'zlib', 'ttl': 604800}
}
```

### Analysis Optimization

#### Batch Processing
Process multiple regions in parallel:

```python
from concurrent.futures import ThreadPoolExecutor

def batch_analyze_regions(regions, analysis_func):
    """Analyze multiple regions in parallel"""
    with ThreadPoolExecutor(max_workers=4) as executor:
        futures = []
        for region in regions:
            future = executor.submit(analysis_func, *region)
            futures.append(future)

        results = []
        for future in futures:
            results.append(future.result())

        return results
```

#### Incremental Analysis
For very large ROMs, use incremental processing:

```python
def incremental_analysis(rom_data, chunk_size=64*1024):
    """Analyze ROM in chunks to reduce memory usage"""
    results = {}

    for offset in range(0, len(rom_data), chunk_size):
        chunk = rom_data[offset:offset + chunk_size]
        chunk_result = analyze_chunk(chunk, offset)
        results[offset] = chunk_result

        # Yield control to prevent blocking
        yield chunk_result
```

## Error Handling and Validation

### ROM Integrity Checks

#### Checksum Validation
```python
def validate_rom_checksum(rom_data):
    """Validate SNES ROM checksum"""
    if len(rom_data) < 0x10000:
        return False

    # Find header location
    header_offset = 0xFFC0 if len(rom_data) <= 0x400000 else 0x7FC0

    # Read stored checksum
    checksum_addr = header_offset + 0x1C
    stored_checksum = struct.unpack('<H', rom_data[checksum_addr:checksum_addr + 2])[0]
    stored_complement = struct.unpack('<H', rom_data[checksum_addr + 2:checksum_addr + 4])[0]

    # Calculate actual checksum
    calculated = 0
    for i, byte in enumerate(rom_data):
        # Skip checksum fields
        if not (checksum_addr <= i < checksum_addr + 4):
            calculated += byte

    calculated &= 0xFFFF
    calculated_complement = (calculated ^ 0xFFFF) & 0xFFFF

    return (stored_checksum == calculated and
            stored_complement == calculated_complement)
```

#### Header Validation
```python
def validate_snes_header(rom_data):
    """Validate SNES ROM header structure"""
    header_offset = 0xFFC0 if len(rom_data) > 0x400000 else 0x7FC0

    if header_offset + 32 > len(rom_data):
        return False

    # Check title (should be printable ASCII)
    title = rom_data[header_offset:header_offset + 21]
    printable_chars = sum(1 for c in title if 32 <= c <= 126)

    if printable_chars < 10:  # At least 10 printable characters
        return False

    # Check map mode
    map_mode = rom_data[header_offset + 21]
    if map_mode not in [0x20, 0x21, 0x30, 0x31]:  # Valid map modes
        return False

    # Check ROM size
    rom_size_field = rom_data[header_offset + 23]
    expected_size = 1024 * (1 << rom_size_field)
    actual_size = len(rom_data)

    # Allow some variance for headers
    if abs(actual_size - expected_size) > 1024:
        return False

    return True
```

### Data Structure Validation

#### Character Data Validation
```python
def validate_character_data(char_data, offset):
    """Validate character data structure"""
    checks = []

    # HP should be reasonable
    if 0 < char_data.hp <= 9999:
        checks.append(True)
    else:
        checks.append(False)

    # MP should be reasonable
    if 0 <= char_data.mp <= 9999:
        checks.append(True)
    else:
        checks.append(False)

    # Level should be 1-99
    if 1 <= char_data.level <= 99:
        checks.append(True)
    else:
        checks.append(False)

    # Stats should be reasonable
    stats = [char_data.strength, char_data.agility, char_data.resilience, char_data.wisdom]
    if all(0 <= stat <= 255 for stat in stats):
        checks.append(True)
    else:
        checks.append(False)

    # At least 75% of checks should pass
    confidence = sum(checks) / len(checks)
    return confidence >= 0.75
```

## Future Extensions

### Planned Features

1. **Advanced Graphics Analysis**
   - Sprite animation detection
   - Tilemap reconstruction
   - Palette optimization

2. **Audio Enhancement**
   - Music sequence reconstruction
   - Sample rate detection
   - Audio driver reverse engineering

3. **Code Analysis**
   - Control flow graphing
   - Function signature detection
   - Cross-reference analysis

4. **Game Logic**
   - Battle system analysis
   - Map data extraction
   - Event script detection

### Extensibility Framework

The toolkit is designed for extension:

```python
# Custom analyzer example
class CustomAnalyzer(ComprehensiveROMAnalyzer):
    def find_custom_data(self, search_pattern):
        """Implement custom data detection"""
        matches = []
        rom_data = self.load_rom_data()

        for offset in range(len(rom_data) - len(search_pattern)):
            if rom_data[offset:offset + len(search_pattern)] == search_pattern:
                matches.append(offset)

        return matches
```

---

*Dragon Quest III ROM Analysis Toolkit - Technical Specifications v1.0*
