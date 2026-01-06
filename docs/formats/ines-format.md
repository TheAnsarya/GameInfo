# iNES ROM Format

The iNES format is the standard format for NES ROMs.

## File Structure

```
+------------------+
| Header (16 bytes)|
+------------------+
| Trainer (0/512)  | (optional)
+------------------+
| PRG ROM          |
+------------------+
| CHR ROM          |
+------------------+
| Title (optional) |
+------------------+
```

## Header Format

| Offset | Size | Description |
|--------|------|-------------|
| $00-$03 | 4 bytes | Magic number: "NES\x1a" |
| $04 | 1 byte | PRG ROM size in 16KB units |
| $05 | 1 byte | CHR ROM size in 8KB units (0 = CHR RAM) |
| $06 | 1 byte | Flags 6 |
| $07 | 1 byte | Flags 7 |
| $08 | 1 byte | Flags 8 (PRG RAM size) |
| $09 | 1 byte | Flags 9 (TV system) |
| $0A | 1 byte | Flags 10 (unofficial) |
| $0B-$0F | 5 bytes | Padding (should be zero) |

## Flags 6

```
76543210
||||||||
|||||||+- Mirroring: 0=horizontal, 1=vertical
||||||+-- Battery-backed PRG RAM present
|||||+--- Trainer present (512 bytes at $7000-$71FF)
||||+---- Four-screen VRAM
++++----- Lower nibble of mapper number
```

## Flags 7

```
76543210
||||||||
|||||||+- VS Unisystem
||||||+-- PlayChoice-10
||||++--- If equal to 2, NES 2.0 format
++++----- Upper nibble of mapper number
```

## Common Mappers

| Mapper | Name | Examples |
|--------|------|----------|
| 0 | NROM | Donkey Kong, Super Mario Bros. |
| 1 | MMC1/SxROM | Mega Man 2, Final Fantasy |
| 2 | UxROM | Castlevania, Contra |
| 3 | CNROM | Paperboy |
| 4 | MMC3/TxROM | Super Mario Bros. 3, Kirby's Adventure |
| 5 | MMC5/ExROM | Castlevania III, Dragon Warrior IV |
| 7 | AxROM | Battletoads |

## Calculating ROM Size

```
PRG ROM Size = Header[4] × 16384 bytes
CHR ROM Size = Header[5] × 8192 bytes

Total File Size = 16 + (Trainer ? 512 : 0) + PRG_Size + CHR_Size
```

## NES 2.0 Extended Header

When Flags 7 bits 2-3 equal 2, the ROM uses NES 2.0 format:

| Offset | Description |
|--------|-------------|
| $08 | Mapper (bits 8-11), Submapper |
| $09 | PRG/CHR ROM size upper bits |
| $0A | PRG RAM and PRG NVRAM sizes |
| $0B | CHR RAM and CHR NVRAM sizes |
| $0C | CPU/PPU timing mode |
| $0D | VS System info |
| $0E | Miscellaneous ROMs |
| $0F | Default expansion device |

## Example: Parsing Header

```python
def parse_ines_header(data):
    """Parse iNES header from ROM data."""
    if data[0:4] != b'NES\x1a':
        raise ValueError("Not a valid iNES ROM")
    
    header = {
        'prg_size': data[4] * 16384,
        'chr_size': data[5] * 8192,
        'mapper': (data[6] >> 4) | (data[7] & 0xF0),
        'mirroring': 'vertical' if data[6] & 1 else 'horizontal',
        'battery': bool(data[6] & 2),
        'trainer': bool(data[6] & 4),
        'four_screen': bool(data[6] & 8),
    }
    
    # Check for NES 2.0
    if (data[7] & 0x0C) == 0x08:
        header['nes2'] = True
        header['submapper'] = (data[8] >> 4) & 0x0F
    
    return header
```

## File Address vs CPU Address

For mappers with bankswitching, file addresses differ from CPU addresses:

```
File Address = Header Size + (Bank × Bank Size) + Offset
CPU Address = $8000 + (Offset within current bank)
```

For mapper 0 (no bankswitching):
```
File $0010-$400F → CPU $8000-$BFFF (first 16KB)
File $4010-$800F → CPU $C000-$FFFF (second 16KB)
```

## See Also

- [SMC/SFC Format](sfc-format.md) - SNES ROM format
- [MLB Format](mlb-format.md) - Mesen label format
- [CDL Format](cdl-format.md) - Code Data Logger format
