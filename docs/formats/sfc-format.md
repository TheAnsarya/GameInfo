# SFC/SMC ROM Format

Documentation for SNES ROM formats (SFC and SMC).

## File Types

| Extension | Header | Description |
|-----------|--------|-------------|
| `.sfc` | None | Raw ROM, no header |
| `.smc` | 512 bytes | ROM with copier header |
| `.fig` | 512 bytes | Super Wild Card format |
| `.swc` | 512 bytes | Super Wild Card format |

## Internal Header

SNES ROMs contain an internal header at either:
- **LoROM**: $00:7FC0 (file offset $7FC0 or $81C0 with copier header)
- **HiROM**: $00:FFC0 (file offset $FFC0 or $101C0 with copier header)

### Header Structure (32 bytes at $xxC0)

| Offset | Size | Description |
|--------|------|-------------|
| $00-$14 | 21 bytes | Internal ROM name (ASCII, space-padded) |
| $15 | 1 byte | Map mode |
| $16 | 1 byte | Cartridge type |
| $17 | 1 byte | ROM size (log2) |
| $18 | 1 byte | RAM size (log2) |
| $19 | 1 byte | Country/Region code |
| $1A | 1 byte | Developer ID (usually $33) |
| $1B | 1 byte | ROM version |
| $1C-$1D | 2 bytes | Checksum complement |
| $1E-$1F | 2 bytes | Checksum |

### Interrupt Vectors (at $xxE0-$xxFF)

| Offset | Vector | Mode |
|--------|--------|------|
| $E0-$E1 | UNUSED | Native |
| $E2-$E3 | UNUSED | Native |
| $E4-$E5 | COP | Native |
| $E6-$E7 | BRK | Native |
| $E8-$E9 | ABORT | Native |
| $EA-$EB | NMI | Native |
| $EC-$ED | UNUSED | Native |
| $EE-$EF | IRQ | Native |
| $F0-$F3 | UNUSED | — |
| $F4-$F5 | COP | Emulation |
| $F6-$F7 | UNUSED | Emulation |
| $F8-$F9 | ABORT | Emulation |
| $FA-$FB | NMI | Emulation |
| $FC-$FD | RESET | Emulation |
| $FE-$FF | IRQ/BRK | Emulation |

## Map Modes

| Value | Mode | Description |
|-------|------|-------------|
| $20 | LoROM | 32KB banks, $8000-$FFFF |
| $21 | HiROM | 64KB banks, full range |
| $22 | LoROM + S-DD1 | Compression chip |
| $23 | SA-1 | Co-processor |
| $25 | ExHiROM | Extended HiROM (>4MB) |
| $30 | LoROM + FastROM | 3.58MHz |
| $31 | HiROM + FastROM | 3.58MHz |
| $35 | ExHiROM + FastROM | Extended HiROM + Fast |

## LoROM Memory Map

```
Banks $00-$3F:
  $0000-$1FFF: WRAM (mirror)
  $2000-$20FF: PPU Ports
  $2100-$21FF: CPU Ports
  $4000-$41FF: Joypad Ports
  $4200-$43FF: CPU Ports
  $6000-$7FFF: Expansion (SRAM)
  $8000-$FFFF: ROM (32KB per bank)

Banks $40-$6F: ROM only
Banks $70-$7D: SRAM at $0000-$7FFF
Banks $80-$FF: Mirror of $00-$7F
Bank $7E: WRAM low (64KB)
Bank $7F: WRAM high (64KB)
```

### LoROM Address Conversion

```
ROM Address to CPU Address:
  Bank = (ROM_Addr / $8000) | $80
  Offset = (ROM_Addr % $8000) + $8000
  CPU_Addr = (Bank << 16) | Offset

Example: ROM $01234 → Bank $82, Offset $9234 → $82:9234
```

## HiROM Memory Map

```
Banks $00-$3F:
  $0000-$1FFF: WRAM (mirror)
  $2000-$5FFF: Hardware registers
  $6000-$7FFF: Expansion
  $8000-$FFFF: ROM (mirror of $C0-$FF)

Banks $40-$7D: ROM (full bank)
Bank $7E: WRAM low (64KB)
Bank $7F: WRAM high (64KB)
Banks $C0-$FF: ROM (64KB per bank)
```

### HiROM Address Conversion

```
ROM Address to CPU Address:
  Bank = (ROM_Addr >> 16) + $C0
  Offset = ROM_Addr & $FFFF
  CPU_Addr = (Bank << 16) | Offset

Example: ROM $012345 → Bank $C1, Offset $2345 → $C1:2345
```

## ROM Size Values

| Header Value | Size | Notes |
|--------------|------|-------|
| $08 | 256 KB (2 Mbit) | |
| $09 | 512 KB (4 Mbit) | |
| $0A | 1 MB (8 Mbit) | |
| $0B | 2 MB (16 Mbit) | |
| $0C | 4 MB (32 Mbit) | |
| $0D | 8 MB (64 Mbit) | ExHiROM |

Calculation: `Size = 1024 << HeaderValue` bytes

## SRAM Size Values

| Header Value | Size | Notes |
|--------------|------|-------|
| $00 | None | No save |
| $01 | 2 KB | |
| $02 | 4 KB | |
| $03 | 8 KB | Common |
| $04 | 16 KB | |
| $05 | 32 KB | |
| $06 | 64 KB | |
| $07 | 128 KB | |

## Cartridge Types

| Value | Type | Description |
|-------|------|-------------|
| $00 | ROM only | No coprocessor |
| $01 | ROM + RAM | With save |
| $02 | ROM + RAM + Battery | Battery backup |
| $03-$0F | DSP1 variants | DSP chip |
| $13 | SuperFX | Star Fox, etc. |
| $14 | SuperFX + RAM | |
| $15 | SuperFX + RAM + Battery | |
| $1A | SuperFX2 | Doom, etc. |
| $25 | OBC1 | Metal Combat |
| $32 | SA-1 + RAM | |
| $34 | SA-1 + RAM | Kirby Super Star |
| $35 | SA-1 + RAM + Battery | |
| $43-$45 | S-DD1 | Star Ocean, SF Alpha 2 |
| $55 | SPC7110 + RTC | |
| $E3 | Game Boy | Super Game Boy |
| $F5-$F9 | ST010/ST011/ST018 | AI coprocessors |

## Region Codes

| Value | Region |
|-------|--------|
| $00 | Japan |
| $01 | USA/Canada |
| $02 | Europe (PAL) |
| $03 | Sweden/Scandinavia |
| $04 | Finland |
| $05 | Denmark |
| $06 | France |
| $07 | Netherlands |
| $08 | Spain |
| $09 | Germany |
| $0A | Italy |
| $0B | China |
| $0C | Indonesia |
| $0D | Korea |
| $0F | Canada |
| $10 | Brazil |
| $11 | Australia |

## Checksum Calculation

```python
def calculate_checksum(rom_data):
    """Calculate SNES ROM checksum."""
    rom_size = len(rom_data)
    
    # Find nearest power of 2
    power = 1
    while power < rom_size:
        power *= 2
    
    # Pad ROM to power of 2
    if rom_size < power:
        padding_size = power - rom_size
        rom_data = rom_data + bytes([0] * padding_size)
    
    # Sum all bytes
    checksum = sum(rom_data) & 0xFFFF
    complement = checksum ^ 0xFFFF
    
    return checksum, complement
```

## SMC Header Format (512 bytes)

Optional copier header at start of file:

| Offset | Size | Description |
|--------|------|-------------|
| $000-$001 | 2 bytes | File size / 8192 |
| $002 | 1 byte | File type |
| $003-$1FF | 509 bytes | Reserved |

## Example: Detecting ROM Type

```python
def detect_snes_rom_type(data):
    """Detect SNES ROM mapping type."""
    # Check for SMC header (file size mod 1024 = 512)
    has_header = (len(data) % 1024) == 512
    
    if has_header:
        data = data[512:]  # Skip header
    
    # Check LoROM location ($7FC0)
    lorom_name = data[0x7FC0:0x7FD5]
    lorom_valid = all(32 <= b < 127 or b == 0 for b in lorom_name)
    
    # Check HiROM location ($FFC0)
    hirom_name = data[0xFFC0:0xFFD5]
    hirom_valid = all(32 <= b < 127 or b == 0 for b in hirom_name)
    
    # Check checksums
    if lorom_valid:
        checksum = data[0x7FDE] | (data[0x7FDF] << 8)
        complement = data[0x7FDC] | (data[0x7FDD] << 8)
        if checksum ^ complement == 0xFFFF:
            return 'LoROM', has_header
    
    if hirom_valid:
        checksum = data[0xFFDE] | (data[0xFFDF] << 8)
        complement = data[0xFFDC] | (data[0xFFDD] << 8)
        if checksum ^ complement == 0xFFFF:
            return 'HiROM', has_header
    
    return 'Unknown', has_header
```

## See Also

- [iNES Format](ines-format.md) - NES ROM format
- [SPC Format](../audio/spc-file-format.md) - SNES audio format
- [CDL Format](cdl-format.md) - Code Data Logger format
