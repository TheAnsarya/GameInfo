# Soul Blazer Audio Formats

Comprehensive documentation of audio formats used in Soul Blazer (SNES).

## Overview

Soul Blazer uses the SNES APU (Audio Processing Unit) consisting of:
- SPC700 CPU (Sony custom 8-bit processor)
- S-DSP (Digital Signal Processor)
- 64 KB Audio RAM

## BRR Sample Format

BRR (Bit Rate Reduction) is the SNES native compressed audio sample format.

### Block Structure (9 bytes)

Each BRR block decodes to 16 samples:

| Byte | Content |
|------|---------|
| 0 | Header |
| 1-8 | 16 sample nibbles |

### Header Byte

```
  Bit 7-4: Range (shift amount, 0-12)
  Bit 3-2: Filter (0-3)
  Bit 1:   Loop flag (1=loop point)
  Bit 0:   End flag (1=end of sample)
```

### Filter Types

| Filter | Formula |
|--------|---------|
| 0 | `out = sample` |
| 1 | `out = sample + old*15/16` |
| 2 | `out = sample + old*61/32 - older*15/16` |
| 3 | `out = sample + old*115/64 - older*13/16` |

### Decoding Algorithm

```python
def decode_brr_block(data: bytes, old1: int = 0, old2: int = 0) -> list[int]:
    """Decode a 9-byte BRR block to 16 samples"""
    header = data[0]
    range_val = (header >> 4) & 0x0F
    filter_type = (header >> 2) & 0x03
    
    samples = []
    for i in range(8):
        byte = data[1 + i]
        
        for nibble_idx in range(2):
            if nibble_idx == 0:
                sample = (byte >> 4) & 0x0F
            else:
                sample = byte & 0x0F
            
            # Sign extend
            if sample >= 8:
                sample -= 16
            
            # Apply range (shift)
            if range_val <= 12:
                sample <<= range_val
            else:
                sample = 0  # Invalid range
            
            # Apply filter
            if filter_type == 1:
                sample += (old1 * 15) >> 4
            elif filter_type == 2:
                sample += ((old1 * 61) >> 5) - ((old2 * 15) >> 4)
            elif filter_type == 3:
                sample += ((old1 * 115) >> 6) - ((old2 * 13) >> 4)
            
            # Clamp to 16-bit signed
            sample = max(-32768, min(32767, sample))
            
            samples.append(sample)
            old2 = old1
            old1 = sample
    
    return samples
```

### Compression Ratio

BRR achieves approximately 32:9 compression (3.56:1):
- 16 samples × 16 bits = 32 bytes uncompressed
- 9 bytes compressed

---

## Sample Directory Format

Located at a fixed address in SPC RAM, pointed to by DSP register `DIR` ($5D).

### Entry Format (4 bytes)

| Offset | Size | Content |
|--------|------|---------|
| $00-$01 | 2 | Sample start address |
| $02-$03 | 2 | Sample loop address |

### Directory Layout

```
Entry 0: $DIR*$100 + $00
Entry 1: $DIR*$100 + $04
Entry 2: $DIR*$100 + $08
...
Entry 63: $DIR*$100 + $FC
```

### Soul Blazer Samples

Approximately 32 samples used:

| ID | Type | Notes |
|----|------|-------|
| $00-$07 | Melodic | Piano, strings |
| $08-$0F | Melodic | Brass, woodwind |
| $10-$17 | Percussion | Drums, cymbals |
| $18-$1F | Sound FX | Sword, magic |

---

## Music Sequence Format

### Track Header

| Offset | Size | Content |
|--------|------|---------|
| $00-$01 | 2 | Track length |
| $02 | 1 | Tempo |
| $03 | 1 | Number of channels (1-8) |
| $04+ | 2×N | Channel pointers |

### Channel Pointer Table

Each active channel has a 16-bit pointer to its sequence data:

```
Channel 0: word at header + $04
Channel 1: word at header + $06
...
Channel 7: word at header + $12
```

---

## Sequence Commands

### Note Commands ($00-$7F)

```
  $00-$5F: Note (C-0 to B-7)
  $60-$7F: Rest/tie
```

Note value encoding:
```
  Octave = value / 12
  Semitone = value % 12
  
  0=C, 1=C#, 2=D, 3=D#, 4=E, 5=F,
  6=F#, 7=G, 8=G#, 9=A, 10=A#, 11=B
```

### Duration Commands ($80-$8F)

| Command | Duration |
|---------|----------|
| $80 | Whole note |
| $81 | Half note |
| $82 | Quarter note |
| $83 | 8th note |
| $84 | 16th note |
| $85 | 32nd note |
| $86 | Dotted half |
| $87 | Dotted quarter |
| $88 | Dotted 8th |
| $89 | Triplet quarter |
| $8A | Triplet 8th |

### Control Commands ($90-$FF)

| Command | Params | Function |
|---------|--------|----------|
| $90 nn | 1 | Set instrument |
| $91 nn | 1 | Set volume (0-127) |
| $92 nn | 1 | Set pan (0=L, 64=C, 127=R) |
| $93 nn | 1 | Set tempo |
| $94 nn mm | 2 | Pitch bend |
| $95 nn | 1 | Vibrato depth |
| $96 nn | 1 | Vibrato speed |
| $97 | 0 | Vibrato off |
| $98 nn mm | 2 | Loop start (count, address) |
| $99 | 0 | Loop end |
| $9A nn mm | 2 | Jump to address |
| $9B | 0 | End of track |
| $9C nn | 1 | Transpose |
| $9D nn | 1 | Detune |
| $9E nn | 1 | ADSR attack |
| $9F nn | 1 | ADSR decay |
| $A0 nn | 1 | ADSR sustain |
| $A1 nn | 1 | ADSR release |
| $A2 nn | 1 | Echo enable |
| $A3 nn | 1 | Echo volume |

---

## DSP Registers

### Voice Registers (per voice, 8 voices)

Base address = `voice * $10`

| Offset | Register | Function |
|--------|----------|----------|
| $x0 | VxVOLL | Volume left |
| $x1 | VxVOLR | Volume right |
| $x2 | VxPITCHL | Pitch low |
| $x3 | VxPITCHH | Pitch high |
| $x4 | VxSRCN | Source number |
| $x5 | VxADSR1 | Attack/Decay |
| $x6 | VxADSR2 | Sustain/Release |
| $x7 | VxGAIN | Gain |
| $x8 | VxENVX | Current envelope (read) |
| $x9 | VxOUTX | Current sample (read) |

### Global Registers

| Address | Register | Function |
|---------|----------|----------|
| $0C | MVOLL | Main volume left |
| $1C | MVOLR | Main volume right |
| $2C | EVOLL | Echo volume left |
| $3C | EVOLR | Echo volume right |
| $4C | KON | Key on (write) |
| $5C | KOFF | Key off (write) |
| $6C | FLG | Flags |
| $7C | ENDX | End of sample (read) |
| $0D | EFB | Echo feedback |
| $2D | PMON | Pitch modulation enable |
| $3D | NON | Noise enable |
| $4D | EON | Echo enable |
| $5D | DIR | Sample directory page |
| $6D | ESA | Echo buffer start |
| $7D | EDL | Echo delay |

### FIR Filter Coefficients

| Address | Register |
|---------|----------|
| $0F | FIR0 |
| $1F | FIR1 |
| $2F | FIR2 |
| $3F | FIR3 |
| $4F | FIR4 |
| $5F | FIR5 |
| $6F | FIR6 |
| $7F | FIR7 |

---

## ADSR Envelope

### ADSR1 Register

```
  Bit 7:   ADSR enable (0=GAIN mode, 1=ADSR mode)
  Bit 6-4: Decay rate (0-7)
  Bit 3-0: Attack rate (0-15)
```

### ADSR2 Register

```
  Bit 7-5: Sustain level (0-7)
  Bit 4-0: Sustain rate (0-31)
```

### Rate Values

Attack times (at $4000 pitch):

| Value | Time (ms) |
|-------|-----------|
| $0F | 0 (instant) |
| $0E | 1 |
| $0C | 5 |
| $0A | 10 |
| $08 | 40 |
| $06 | 160 |
| $04 | 640 |
| $02 | 2560 |
| $00 | 4100 |

---

## SPC File Format

For exporting standalone audio.

### Structure

| Offset | Size | Content |
|--------|------|---------|
| $0000 | 256 | Header |
| $0100 | 65536 | SPC RAM |
| $10100 | 128 | DSP registers |
| $10180 | 64 | Extra RAM |

### Header Fields

| Offset | Size | Content |
|--------|------|---------|
| $00 | 33 | Signature |
| $21 | 2 | Tag bytes (26 1A) |
| $23 | 1 | Has ID666 tag |
| $24 | 1 | Version minor |
| $25 | 2 | PC |
| $27 | 1 | A |
| $28 | 1 | X |
| $29 | 1 | Y |
| $2A | 1 | PSW |
| $2B | 1 | SP |
| $2E | 32 | Song title |
| $4E | 32 | Game title |
| $6E | 16 | Dumper |
| $7E | 32 | Comments |
| $A9 | 3 | Play time (seconds) |
| $AC | 5 | Fade length (ms) |
| $B1 | 32 | Artist |

---

## Soul Blazer Audio Data Locations

### ROM Layout

| Address | Size | Content |
|---------|------|---------|
| $078000 | 4 KB | SPC700 driver code |
| $079000 | 1 KB | Sample directory |
| $07A000 | 24 KB | BRR sample data |
| $0D8000 | 32 KB | Music sequences |
| $0E0000 | 8 KB | Sound effects |

### Track Pointers ($0D8000)

```
$0D8000: Pointer to track $00 (Title Screen)
$0D8002: Pointer to track $01 (Grass Valley)
$0D8004: Pointer to track $02 (GreenWood)
...
```

---

## Sound Effects

### SFX Structure

| Offset | Size | Content |
|--------|------|---------|
| $00 | 1 | Sample index |
| $01 | 1 | Pitch |
| $02 | 1 | Volume |
| $03 | 1 | Pan |
| $04 | 1 | Duration |

### Known Sound Effects

| ID | Description |
|----|-------------|
| $00 | Menu select |
| $01 | Menu move |
| $02 | Sword swing |
| $03 | Sword hit |
| $04 | Enemy hit |
| $05 | Enemy death |
| $06 | Player damage |
| $07 | Magic cast |
| $08 | Magic hit |
| $09 | Soul release |
| $0A | Lair clear |
| $0B | Level up |
| $0C | Item get |
| $0D | Door open |
| $0E | Treasure |
| $0F | Teleport |

---

## See Also

- [Graphics Formats](graphics-formats.md)
- [Data Structures](data-structures.md)
- [ROM Map](rom-map.md)
