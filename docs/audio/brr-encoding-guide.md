# BRR Encoding Guide

A practical guide to creating high-quality BRR samples for SNES audio.

## What is BRR?

BRR (Bit Rate Reduction) is the SNES's audio compression format. It compresses 16-bit PCM audio to approximately 4:1 ratio using ADPCM-style encoding.

### Key Specifications

| Property | Value |
|----------|-------|
| Compression | ~3.5:1 (9 bytes → 16 samples) |
| Block size | 9 bytes = 16 samples |
| Sample depth | 16-bit signed output |
| Filter modes | 4 (for prediction optimization) |
| Max sample rate | 32,000 Hz |

## Preparing Audio for BRR

### Source Requirements

Before converting to BRR, prepare your source audio:

1. **Format**: WAV, 16-bit, mono
2. **Sample Rate**: Match target rate (8kHz - 32kHz)
3. **Normalization**: Peak at -1dB or below
4. **Clean silence**: Trim start/end silence

### Sample Rate Guidelines

| Use Case | Recommended Rate | Notes |
|----------|------------------|-------|
| Bass/drums | 8-12 kHz | Low frequencies don't need high rates |
| Orchestral | 16 kHz | Good balance of quality and size |
| Lead/vocal | 22-32 kHz | Higher rates for important sounds |
| Sound FX | 8-16 kHz | Depends on content |

### File Size Estimation

```
BRR size = ceil(sample_count / 16) × 9 bytes

Example:
32000 samples ÷ 16 × 9 = 18,000 bytes per second at 32kHz
```

**Memory budget examples:**
- 1 second @ 32kHz: 18,000 bytes
- 1 second @ 16kHz: 9,000 bytes
- 1 second @ 8kHz: 4,500 bytes

## Using SPC Tool to Encode

### Basic Conversion

```powershell
spc-tool convert sample.wav -o sample.brr
```

### With Loop Point

```powershell
spc-tool convert sample.wav -o sample.brr --loop 2048
```

The loop point is in samples. It will be aligned to the nearest 16-sample boundary.

### With Pre-Emphasis

Pre-emphasis boosts high frequencies before encoding, compensating for the low-pass effect of BRR:

```powershell
spc-tool convert sample.wav -o sample.brr --pre-emphasis
```

Use pre-emphasis for:
- Bright instruments (piano, bells)
- Percussive sounds (snare, hi-hat)
- Vocals/speech

Avoid for:
- Already bright sources
- Bass-heavy sounds
- Samples with noise

### Specifying Sample Rate

```powershell
spc-tool convert sample.wav -o sample.brr --rate 16000
```

This resamples the source to 16kHz before encoding.

## Loop Point Techniques

### Finding Good Loop Points

1. **Zero crossings**: Loop where waveform crosses zero
2. **Phase matching**: Ensure wave continues smoothly
3. **Natural sustain**: Loop during sustained portion, not attack

### Using a DAW to Find Loop Points

1. Import sample into Ableton/FL Studio/etc.
2. Find sustain portion with consistent waveform
3. Set loop markers
4. Preview the loop
5. Note the sample positions
6. Convert sample position to 16-sample boundary

### Calculating 16-Sample Boundaries

```
aligned_loop = (desired_loop // 16) * 16

Example:
Desired loop at sample 1234
1234 / 16 = 77.125
Nearest: 77 × 16 = 1232 or 78 × 16 = 1248
```

Try both and pick the cleaner loop.

## Optimizing Quality

### Filter Mode Selection

BRR has 4 filter modes for prediction. The encoder automatically tests all modes per block, but understanding them helps:

| Mode | Best For |
|------|----------|
| 0 | Transients, noise, complex waveforms |
| 1 | Smooth sustained sounds |
| 2 | Complex but predictable waves |
| 3 | Very smooth, low-frequency content |

### Reducing Encoding Artifacts

**Clicking/popping:**
- Ensure loop points are at zero crossings
- Fade out end of non-looping samples
- Check for DC offset in source

**Metallic/tinny sound:**
- Use pre-emphasis
- Try higher sample rate source
- Consider different filter modes

**Noise/hiss:**
- Clean source material first
- Use noise reduction before encoding
- Lower sample rate can hide noise

**Pumping/breathing:**
- Avoid over-compression in source
- Normalize without limiting
- Keep dynamics intact

## Quality Comparison Workflow

Test encoding quality before committing:

```powershell
# Encode the sample
spc-tool convert original.wav -o test.brr

# Decode back to WAV
spc-tool convert test.brr -o decoded.wav

# Compare visually in a DAW or audio editor
# Look for:
# - Waveform similarity
# - Frequency response (spectral analysis)
# - Loop point smoothness
```

## Common Issues and Solutions

### Problem: Loop clicks

**Cause**: Loop point not at zero crossing
**Solution**: 
1. Find the sample value at loop point
2. Shift loop to nearest zero crossing
3. Re-encode

### Problem: High-frequency loss

**Cause**: BRR naturally rolls off highs
**Solution**:
1. Use pre-emphasis (`--pre-emphasis`)
2. EQ boost 8-16kHz before encoding
3. Use higher sample rate

### Problem: Sample too large

**Cause**: Long sample or high sample rate
**Solutions**:
1. Reduce sample rate
2. Trim silence
3. Shorten sustain, extend with loop
4. Use simpler sounds

### Problem: Noisy output

**Cause**: Low-level quantization noise
**Solutions**:
1. Normalize source louder
2. Apply noise gate before encoding
3. Use dithering before rate conversion

## Professional Tips

### 1. Create a Sample Library

Build a collection of tested, optimized BRR samples:
- Label with sample rate, loop point, size
- Note which games/contexts work well
- Include both BRR and source WAV

### 2. Master at Target Rate

Instead of encoding 44.1kHz and letting the encoder downsample:
1. Downsample yourself with quality algorithm
2. Apply EQ and effects at target rate
3. Then encode to BRR

### 3. A/B Test Encoding Settings

```powershell
# Test without pre-emphasis
spc-tool convert sample.wav -o no-pre.brr
spc-tool convert no-pre.brr -o no-pre-decoded.wav

# Test with pre-emphasis
spc-tool convert sample.wav -o with-pre.brr --pre-emphasis
spc-tool convert with-pre.brr -o with-pre-decoded.wav

# Compare both in your DAW
```

### 4. Batch Process Your Samples

```powershell
# Convert all WAV files in a directory
Get-ChildItem *.wav | ForEach-Object {
    spc-tool convert $_.Name -o ($_.BaseName + ".brr") --pre-emphasis
}
```

### 5. Document Your Samples

Create a `samples.json` for your project:

```json
{
  "samples": [
    {
      "name": "bass",
      "file": "bass.brr",
      "rate": 16000,
      "loop": 1024,
      "size": 4500,
      "notes": "Works well for low notes, C2-C4"
    },
    {
      "name": "strings",
      "file": "strings.brr", 
      "rate": 22050,
      "loop": 8192,
      "size": 12600,
      "notes": "Lush pad sound, use for sustained chords"
    }
  ]
}
```

## Size Budget Template

Use this template to plan your sample set:

```
Total Available:     65,536 bytes
- Sound driver:       3,000 bytes
- Sequence data:      4,000 bytes  
- Echo buffer:        4,096 bytes (EDL=2)
- Sample directory:     256 bytes
========================
Available for samples: 54,184 bytes

Sample Budget:
  Lead 1:      8,000 bytes (1 sec @ 16kHz)
  Lead 2:      8,000 bytes
  Bass:        4,000 bytes (1 sec @ 8kHz)
  Pad:        12,000 bytes (1.5 sec @ 16kHz)
  Drums (4):  16,000 bytes (4 × 0.5 sec @ 16kHz)
  FX:          4,000 bytes
========================
Total planned: 52,000 bytes
Remaining:      2,184 bytes (safety margin)
```

## See Also

- [SPC Tool User Guide](spc-tool-user-guide.md)
- [SNES Audio Technical Reference](snes-audio-technical-reference.md)
- [Getting Started with SNES Music Editing](getting-started-snes-music-editing.md)
