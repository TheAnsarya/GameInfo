# CDL File Format Specification

Code Data Logger (CDL) file format documentation.

## Overview

CDL files track which bytes in a ROM have been accessed during emulation. Each byte in the ROM has a corresponding byte in the CDL file indicating how it was accessed.

## File Structure

```
[CDL Header (optional)]
[Coverage Data - 1 byte per ROM byte]
```

## FCEUX CDL Format

### Coverage Byte Flags

| Bit | Mask | Meaning |
|-----|------|---------|
| 0 | `0x01` | Executed as code (opcode byte) |
| 1 | `0x02` | Read as data |
| 2 | `0x04` | Rendered as PCM audio |
| 3 | `0x08` | Reserved |
| 4 | `0x10` | Executed as code (indirect) |
| 5 | `0x20` | Read as data (indirect) |
| 6 | `0x40` | Reserved |
| 7 | `0x80` | Reserved |

### Common Values

| Value | Hex | Meaning |
|-------|-----|---------|
| `0` | `$00` | Unlogged |
| `1` | `$01` | Code only |
| `2` | `$02` | Data only |
| `3` | `$03` | Both code and data |
| `17` | `$11` | Code (indirect) |
| `34` | `$22` | Data (indirect) |

### File Size

For NES ROMs:
- CDL size = PRG ROM size + CHR ROM size
- No header in CDL file

## Mesen CDL Format

### NES CDL Format

Mesen NES CDL files contain:
1. PRG ROM coverage
2. CHR ROM coverage (if present)

### SNES CDL Format (Mesen-S)

SNES CDL files are larger due to 24-bit addressing:

| Offset | Size | Content |
|--------|------|---------|
| 0 | ROM size | ROM coverage data |

### Coverage Byte Flags (Mesen)

| Bit | Mask | Meaning |
|-----|------|---------|
| 0 | `0x01` | Executed as code |
| 1 | `0x02` | Read as data |
| 2 | `0x04` | Indirect code |
| 3 | `0x08` | Indirect data |
| 4 | `0x10` | ROM mapped |
| 5 | `0x20` | Sub entry point |
| 6 | `0x40` | Jump target |
| 7 | `0x80` | Reserved |

## bsnes CDL Format

bsnes uses a similar single-byte-per-byte format:

| Bit | Mask | Meaning |
|-----|------|---------|
| 0 | `0x01` | Code |
| 1 | `0x02` | Data |

## Practical Usage

### Identifying Code vs Data

```python
def is_code(cdl_byte):
    return (cdl_byte & 0x01) != 0

def is_data(cdl_byte):
    return (cdl_byte & 0x02) != 0

def is_unlogged(cdl_byte):
    return cdl_byte == 0
```

### Coverage Percentage

```python
def calculate_coverage(cdl_data):
    logged = sum(1 for b in cdl_data if b != 0)
    return (logged / len(cdl_data)) * 100
```

### Finding Unlogged Regions

```python
def find_gaps(cdl_data, min_size=16):
    gaps = []
    gap_start = None
    
    for i, byte in enumerate(cdl_data):
        if byte == 0:
            if gap_start is None:
                gap_start = i
        else:
            if gap_start is not None:
                if i - gap_start >= min_size:
                    gaps.append((gap_start, i - 1))
                gap_start = None
    
    return gaps
```

## Format Conversion

### FCEUX to Mesen

```python
def fceux_to_mesen(fceux_byte):
    mesen_byte = 0
    if fceux_byte & 0x01:  # Code
        mesen_byte |= 0x01
    if fceux_byte & 0x02:  # Data
        mesen_byte |= 0x02
    if fceux_byte & 0x10:  # Indirect code
        mesen_byte |= 0x04
    if fceux_byte & 0x20:  # Indirect data
        mesen_byte |= 0x08
    return mesen_byte
```

### Mesen to FCEUX

```python
def mesen_to_fceux(mesen_byte):
    fceux_byte = 0
    if mesen_byte & 0x01:  # Code
        fceux_byte |= 0x01
    if mesen_byte & 0x02:  # Data
        fceux_byte |= 0x02
    if mesen_byte & 0x04:  # Indirect code
        fceux_byte |= 0x10
    if mesen_byte & 0x08:  # Indirect data
        fceux_byte |= 0x20
    return fceux_byte
```

## References

- [FCEUX CDL Documentation](https://fceux.com/web/help/CodeDataLogger.html)
- [Mesen Documentation](https://www.mesen.ca/)
