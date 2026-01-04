# SPC File Format Reference

## Overview

SPC files are SNES audio snapshots containing a complete state of the SPC700 sound CPU, allowing music to be played outside of the original game.

## File Structure

An SPC file is exactly **66,048 bytes** (or 66,176 bytes with extended ID666).

### Header Layout (256 bytes)

| Offset | Size | Description |
|--------|------|-------------|
| $00 | 33 | Magic string: "SNES-SPC700 Sound File Data v0.30" |
| $21 | 2 | $26 $26 (format identifiers) |
| $23 | 1 | Has ID666 tag: $1A = yes, $1B = no |
| $24 | 1 | Minor version |
| $25 | 2 | PC (Program Counter) |
| $27 | 1 | A (Accumulator) |
| $28 | 1 | X (Index register) |
| $29 | 1 | Y (Index register) |
| $2A | 1 | PSW (Processor Status Word) |
| $2B | 1 | SP (Stack Pointer) |
| $2C | 2 | Reserved |
| $2E | 32 | Song title |
| $4E | 32 | Game title |
| $6E | 16 | Dumper name |
| $7E | 32 | Comments |
| $9E | 11 | Dump date (MM/DD/YYYY) |
| $A9 | 3 | Song length in seconds (string, null-terminated) |
| $AC | 5 | Fade length in milliseconds (string) |
| $B1 | 32 | Artist name |
| $D1 | 1 | Default channel enables |
| $D2 | 1 | Emulator used for dump |
| $D3 | 45 | Reserved |

### RAM (65,536 bytes at offset $100)

Complete 64KB SPC700 RAM image starting at file offset $100.

**Important Memory Regions:**
| Address | Size | Description |
|---------|------|-------------|
| $0000-$00FF | 256 | Zero Page (direct page) |
| $0100-$01FF | 256 | Stack (grows downward from $01FF) |
| $0200+ | varies | Sample directory (location from DSP $5D) |
| varies | varies | BRR sample data |
| varies | varies | Sequence/music data |
| $FFC0-$FFFF | 64 | IPL ROM (boot code, usually overwritten) |

### DSP Registers (128 bytes at offset $10100)

| Offset | Register | Description |
|--------|----------|-------------|
| $00 | MVOLL | Main volume left |
| $01 | MVOLR | Main volume right (writable alias at $1C) |
| $02 | EVOLL | Echo volume left |
| $03 | EVOLR | Echo volume right |
| $04 | KON | Key on flags |
| $05 | KOFF | Key off flags |
| $06 | FLG | Flags (mute, echo off, reset, noise clock) |
| $07 | ENDX | End flag for each voice |
| $08-$7F | Voice regs | 8 voices × 16 bytes each |

### Extra RAM (64 bytes at offset $10180)

Additional 64 bytes of SPC700 internal RAM.

---

## DSP Voice Registers

Each voice has 16 bytes of registers at `$x0-$xF` where `x` is the voice number (0-7).

| Offset | Register | Description |
|--------|----------|-------------|
| $x0 | VOL(L) | Left volume (-128 to 127) |
| $x1 | VOL(R) | Right volume (-128 to 127) |
| $x2 | P(L) | Pitch low byte |
| $x3 | P(H) | Pitch high byte (bits 5-0) |
| $x4 | SRCN | Sample source number |
| $x5 | ADSR(1) | ADSR settings 1 |
| $x6 | ADSR(2) | ADSR settings 2 |
| $x7 | GAIN | Gain value (when ADSR disabled) |
| $x8 | ENVX | Current envelope value (read-only) |
| $x9 | OUTX | Current sample output (read-only) |

### Global DSP Registers

| Offset | Register | Description |
|--------|----------|-------------|
| $0C | MVOL(L) | Main volume left |
| $1C | MVOL(R) | Main volume right |
| $2C | EVOL(L) | Echo volume left |
| $3C | EVOL(R) | Echo volume right |
| $4C | KON | Key on (write triggers notes) |
| $5C | KOFF | Key off (write releases notes) |
| $6C | FLG | Flags register |
| $7C | ENDX | Voice end flags |
| $0D | EFB | Echo feedback |
| $2D | PMON | Pitch modulation enable |
| $3D | NON | Noise enable |
| $4D | EON | Echo enable |
| $5D | DIR | Sample directory page ($xx00) |
| $6D | ESA | Echo buffer start page ($xx00) |
| $7D | EDL | Echo delay (0-15, each = 16ms) |
| $0F-$7F | FIR | FIR filter coefficients (8 taps) |

---

## Sample Directory

The sample directory is a table of 4-byte entries at address `DIR × $100`.

Each entry:
| Offset | Size | Description |
|--------|------|-------------|
| 0 | 2 | Sample start address (little-endian) |
| 2 | 2 | Loop point address (little-endian) |

**Maximum samples:** 256 (entries 0-255)

---

## BRR Sample Format

BRR (Bit Rate Reduction) is the SNES audio compression format.

### Block Structure (9 bytes each)

| Byte | Bits | Description |
|------|------|-------------|
| 0 | 7-4 | Range (shift amount, 0-12) |
| 0 | 3-2 | Filter (0-3) |
| 0 | 1 | Loop flag |
| 0 | 0 | End flag |
| 1-8 | | 16 samples, 4 bits each (2 per byte) |

### Filter Algorithms

| Filter | Formula |
|--------|---------|
| 0 | sample = nibble × 2^(range-1) |
| 1 | sample = prev × 15/16 + nibble × 2^(range-1) |
| 2 | sample = prev × 61/32 - prev2 × 15/16 + nibble × 2^(range-1) |
| 3 | sample = prev × 115/64 - prev2 × 13/16 + nibble × 2^(range-1) |

### Flags

- **End flag (bit 0):** Last block of sample
- **Loop flag (bit 1):** If end flag set, loop to loop point; otherwise stop

---

## ADSR Envelope

The ADSR envelope controls amplitude over time.

### ADSR(1) Register ($x5)

| Bits | Description |
|------|-------------|
| 7 | ADSR enable (0 = GAIN mode) |
| 6-4 | Decay rate (0-7) |
| 3-0 | Attack rate (0-15) |

### ADSR(2) Register ($x6)

| Bits | Description |
|------|-------------|
| 7-5 | Sustain level (0-7) |
| 4-0 | Sustain rate (0-31) |

### Timing

| Attack Rate | Time |
|-------------|------|
| 0 | 4100ms |
| 15 | 0 (instant) |

| Decay Rate | Time to Sustain |
|------------|-----------------|
| 0 | 1200ms |
| 7 | 18.6ms |

| Sustain Level | Envelope Value |
|---------------|----------------|
| 0 | 1/8 (12.5%) |
| 7 | 8/8 (100%) |

---

## Echo System

The SNES has a built-in echo/reverb effect with 8-tap FIR filter.

### Echo Parameters

| Register | Description |
|----------|-------------|
| EDL ($7D) | Delay (0-15, each = 16ms = 2KB buffer) |
| EFB ($0D) | Feedback (-128 to 127) |
| ESA ($6D) | Buffer start page |
| EVOL L/R ($2C/$3C) | Echo output volume |
| EON ($4D) | Per-voice echo enable |

### FIR Filter

8 coefficients at registers $0F, $1F, $2F, $3F, $4F, $5F, $6F, $7F.

Common presets:
| Type | Coefficients |
|------|-------------|
| Bypass | [127, 0, 0, 0, 0, 0, 0, 0] |
| Low-pass | [64, 32, 16, 8, 4, 2, 1, 0] |
| High-pass | [127, -64, 0, 0, 0, 0, 0, 0] |

---

## Common Sound Drivers

Different games use different music engines (sound drivers):

| Driver | Games | Signature |
|--------|-------|-----------|
| N-SPC | Nintendo games | "ARAM" in high memory |
| Akao | Square games (FF, CT) | Specific opcodes at $0400 |
| Konami SCC | Castlevania, Contra | - |
| Capcom | Mega Man X, Street Fighter | - |
| HAL | Kirby, EarthBound | - |

---

## Tools for SPC Files

- **spc-tool** - GameInfoTools CLI for extraction/conversion
- **SPC Player** - Standalone playback
- **SNESAmp** - Winamp plugin
- **BRRtools** - Sample manipulation

---

## References

- [SPC File Format](https://wiki.superfamicom.org/spc-and-rsn-file-format)
- [SPC700 Reference](https://wiki.superfamicom.org/spc700-reference)
- [BRR Format](https://wiki.superfamicom.org/bit-rate-reduction-(brr))
