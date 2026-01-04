# SNES Audio Technical Reference

## BRR (Bit Rate Reduction) Format

### Overview

BRR is the SNES's native audio compression format. It provides approximately 3.5:1 compression.

### Block Structure

Each BRR block is 9 bytes and encodes 16 samples:

```
Byte 0: Header
  Bits 7-4: Range (0-12, shift amount)
  Bits 3-2: Filter (0-3, prediction mode)
  Bit 1:    Loop flag (1 = this is loop point)
  Bit 0:    End flag (1 = last block)

Bytes 1-8: Sample data (16 nybbles, 2 per byte)
```

### Filter Modes

| Filter | Formula |
|--------|---------|
| 0 | output = sample |
| 1 | output = sample + old * 15/16 |
| 2 | output = sample + old * 61/32 - older * 15/16 |
| 3 | output = sample + old * 115/64 - older * 13/16 |

### Decoding Algorithm (Python)

```python
def decode_brr_block(data: bytes, old: int = 0, older: int = 0) -> list[int]:
    """Decode a single 9-byte BRR block to 16 samples."""
    header = data[0]
    range_val = (header >> 4) & 0x0F
    filter_val = (header >> 2) & 0x03
    
    samples = []
    
    for i in range(8):
        byte = data[1 + i]
        for nybble in [(byte >> 4) & 0x0F, byte & 0x0F]:
            # Sign extend 4-bit to signed
            if nybble >= 8:
                nybble -= 16
            
            # Apply range
            sample = nybble << range_val
            
            # Apply filter
            if filter_val == 1:
                sample += old + (-old >> 4)
            elif filter_val == 2:
                sample += (old << 1) + (-((old << 1) + old) >> 5) - older + (older >> 4)
            elif filter_val == 3:
                sample += (old << 1) + (-(old + (old << 2) + (old << 3)) >> 6) - older + (((older << 1) + older) >> 4)
            
            # Clamp to 16-bit signed
            sample = max(-32768, min(32767, sample))
            
            samples.append(sample)
            older = old
            old = sample
    
    return samples, old, older
```

### Encoding Considerations

When converting WAV → BRR:

1. **Sample Rate**: Reduce to 32kHz or lower
2. **Bit Depth**: Convert to 16-bit
3. **Channels**: Convert to mono
4. **Loop Points**: Must align to 16-sample boundaries
5. **Optimal Filter**: Test all 4 filters, pick lowest error

---

## SPC File Format

### Header (256 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| 0x00 | 33 | Signature: "SNES-SPC700 Sound File Data v0.30" |
| 0x21 | 2 | Version (0x1A, 0x1A) |
| 0x23 | 1 | PC low byte |
| 0x24 | 1 | PC high byte |
| 0x25 | 1 | A register |
| 0x26 | 1 | X register |
| 0x27 | 1 | Y register |
| 0x28 | 1 | PSW (flags) |
| 0x29 | 1 | SP (stack pointer) |
| 0x2E | 32 | Song title |
| 0x4E | 32 | Game title |
| 0x6E | 16 | Dumper name |
| 0x7E | 32 | Comments |
| 0x9E | 11 | Dump date |
| 0xA9 | 3 | Fade length (ms, in ASCII) |
| 0xAC | 5 | Fade length (ms, binary) |
| 0xB0 | 32 | Song artist |
| 0xD0 | 1 | Default channel disables |
| 0xD1 | 1 | Emulator used |
| 0xD2 | 46 | Reserved |

### RAM Dump (65536 bytes at 0x100)

Complete 64KB SPC700 RAM snapshot.

### DSP Registers (128 bytes at 0x10100)

| Register | Description |
|----------|-------------|
| 0x00-0x7F | Voice 0-7 registers (16 bytes each) |

#### Per-Voice Registers (8 voices × 16 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| 0x00 | 1 | VOL(L) - Left volume |
| 0x01 | 1 | VOL(R) - Right volume |
| 0x02 | 2 | PITCH - Sample pitch (14-bit) |
| 0x04 | 1 | SRCN - Source number |
| 0x05 | 2 | ADSR - Envelope settings |
| 0x07 | 1 | GAIN - Gain/envelope override |
| 0x08 | 1 | ENVX - Current envelope (read-only) |
| 0x09 | 1 | OUTX - Current waveform (read-only) |

#### Global DSP Registers

| Address | Description |
|---------|-------------|
| 0x0C | MVOL(L) - Main volume left |
| 0x1C | MVOL(R) - Main volume right |
| 0x2C | EVOL(L) - Echo volume left |
| 0x3C | EVOL(R) - Echo volume right |
| 0x4C | KON - Key on |
| 0x5C | KOFF - Key off |
| 0x6C | FLG - Noise/echo/reset flags |
| 0x7C | ENDX - Voice end flags |
| 0x0D | EFB - Echo feedback |
| 0x2D | PMON - Pitch modulation |
| 0x3D | NON - Noise enable |
| 0x4D | EON - Echo enable |
| 0x5D | DIR - Sample directory offset |
| 0x6D | ESA - Echo buffer start |
| 0x7D | EDL - Echo delay |
| 0xXF | FIR - Echo FIR filter coefficients |

### Sample Directory

Located in RAM at (DIR × 256):

```
Entry N (4 bytes):
  Bytes 0-1: Sample start address
  Bytes 2-3: Loop start address
```

---

## MIDI Mapping for SNES

### Standard Channel Assignment

| MIDI Ch | SNES Voice | Suggested Use |
|---------|------------|---------------|
| 1 | 0 | Lead melody |
| 2 | 1 | Counter-melody |
| 3 | 2 | Bass |
| 4 | 3 | Drums (Drum Rack) |
| 5 | 4 | Strings/Pads |
| 6 | 5 | Arpeggios |
| 7 | 6 | FX/Accents |
| 8 | 7 | Additional |
| 10 | - | GM Drums (convert to Ch4) |

### Controller Mappings

| MIDI CC | SNES Equivalent |
|---------|-----------------|
| CC1 (Mod) | Pitch modulation |
| CC7 (Vol) | Voice volume |
| CC10 (Pan) | L/R balance |
| CC64 (Sustain) | Note length |
| CC91 (Reverb) | Echo enable |

### Pitch Bend

SNES pitch register is 14-bit:
- Range: 0x0000 - 0x3FFF
- 0x1000 = normal pitch (1.0x)

```python
def midi_pitch_to_snes(midi_pitch: int, base_pitch: int = 0x1000) -> int:
    """Convert MIDI pitch bend (-8192 to 8191) to SNES pitch."""
    # MIDI range maps to ±2 semitones typically
    ratio = 2 ** (midi_pitch / 8192 / 6)  # ±2 semitones
    return int(base_pitch * ratio)
```

---

## Memory Map

### SPC700 RAM Layout (Typical)

| Address | Size | Description |
|---------|------|-------------|
| 0x0000 | varies | Sound driver code |
| 0x0200 | 0x100 | Sample directory |
| 0x0300 | varies | Sequence data |
| 0x2000 | varies | BRR sample data |
| 0xFFC0 | 0x40 | IPL ROM (boot code) |

### Memory Budget

```
Total RAM:        65,536 bytes
Typical usage:
  - Driver code:   2,000 - 4,000 bytes
  - Directory:       256 - 512 bytes
  - Sequences:     2,000 - 8,000 bytes
  - Echo buffer:   2,048 - 15,360 bytes
  - Samples:      40,000 - 55,000 bytes (remainder)
```

---

## Common Sound Drivers

### Nintendo N-SPC

Used by most Nintendo first-party games.

| Feature | Support |
|---------|---------|
| Channels | 8 |
| Echo | Yes |
| Sample count | ~20-30 |
| Sequence format | Proprietary |

### Akao (Square)

Used by Final Fantasy IV, V, VI, Chrono Trigger.

| Feature | Support |
|---------|---------|
| Channels | 8 |
| Echo | Yes |
| Sample count | ~30-50 |
| Sequence format | Custom, well-documented |

### Konami SPC

Used by Castlevania, Contra III, etc.

### Hudson HuSPC

Used by Bomberman, various sports games.

---

## Quality Guidelines

### Sample Quality vs Size Tradeoffs

| Quality Level | Sample Rate | Typical Size | Use Case |
|---------------|-------------|--------------|----------|
| Low | 8kHz | Small | Sound effects |
| Medium | 16kHz | Medium | Most instruments |
| High | 32kHz | Large | Lead instruments |

### Loop Point Guidelines

1. Find zero-crossing near desired loop point
2. Align to 16-sample boundary (BRR requirement)
3. Match waveform phase at loop boundaries
4. Use crossfade if needed before BRR encode

### Reducing Artifacts

1. **Pre-emphasis**: Boost highs before encoding
2. **Dithering**: Add noise before bit reduction
3. **Filter selection**: Test all 4 BRR filters
4. **Manual loop tuning**: Adjust until clean

---

## Tool Reference

### brr_encoder

```bash
brr_encoder input.wav output.brr [options]

Options:
  --rate RATE       Target sample rate (default: 16000)
  --loop START:END  Loop points in samples
  --no-loop         Disable loop
  --filter N        Force filter 0-3 (default: auto)
  --quality Q       Quality 0-100 (default: 80)
```

### spc_builder

```bash
spc_builder [options]

Options:
  --template FILE   Use existing SPC as template
  --samples DIR     BRR sample directory
  --midi FILE       MIDI sequence file
  --driver TYPE     Sound driver type
  --output FILE     Output SPC file
```

### bundle_creator

```bash
bundle_creator create [options]

Options:
  --name NAME       Bundle display name
  --author AUTHOR   Creator name
  --game GAME       Original game name
  --spc FILE        Original SPC file
  --modified FILE   Modified SPC file
  --ableton DIR     Ableton project directory
  --output FILE     Output ZIP file
```
