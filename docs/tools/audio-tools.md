# Audio Tools Guide

Tools for extracting and editing game audio, music, and sound effects.

## Overview

Retro game audio varies significantly by platform. This guide covers tools for working with NES, SNES, and other console audio formats.

## Platform-Specific Formats

### NES Audio

The NES has 5 audio channels:
- 2 Pulse wave channels
- 1 Triangle wave channel
- 1 Noise channel
- 1 DPCM sample channel

### SNES Audio

The SNES uses the SPC700 sound processor:
- 8 channels of sample-based audio
- BRR (Bit Rate Reduction) sample compression
- DSP effects (echo, pitch modulation)

## Audio Extraction Tools

### music_extractor.py

Extract music sequences from ROMs.

```bash
# Extract NES music (NSF format)
python tools/audio/music_extractor.py game.nes --format nsf --output music.nsf

# Extract SNES music (SPC format)
python tools/audio/music_extractor.py game.sfc --format spc --output music/

# Extract with track listing
python tools/audio/music_extractor.py game.sfc --list --output tracks.txt
```

**Options:**
- `--format` - Output format (nsf, spc, vgm, midi)
- `--track N` - Extract specific track
- `--all` - Extract all tracks
- `--output` - Output file/directory

### spc_dumper.py

Dump SPC files from SNES save states.

```bash
# Dump SPC from SNES9x save state
python tools/audio/spc_dumper.py save.000 --output track.spc

# Batch dump from multiple states
python tools/audio/spc_dumper.py saves/*.000 --output spc/
```

### nsf_builder.py

Create NSF files from NES audio data.

```bash
# Build NSF from audio pointers
python tools/audio/nsf_builder.py game.nes --config audio.json --output game.nsf

# Specify play address
python tools/audio/nsf_builder.py game.nes --init $8000 --play $8003 --output game.nsf
```

## Sample Tools

### brr_converter.py

Convert BRR samples to/from WAV.

```bash
# Extract BRR sample to WAV
python tools/audio/brr_converter.py extract game.sfc --offset $10000 --output sample.wav

# Convert WAV to BRR
python tools/audio/brr_converter.py encode sample.wav --output sample.brr

# Extract all samples
python tools/audio/brr_converter.py extract-all game.sfc --config samples.json --output samples/
```

**BRR Format:**
- 9 bytes per 16 samples (4-bit compression)
- Loop point support
- Filter modes for better quality

### dpcm_converter.py

Work with NES DPCM samples.

```bash
# Extract DPCM sample
python tools/audio/dpcm_converter.py extract game.nes --offset $C000 --output sample.wav

# Encode WAV to DPCM
python tools/audio/dpcm_converter.py encode sample.wav --output sample.dmc

# Optimize DPCM quality
python tools/audio/dpcm_converter.py encode sample.wav --rate 15 --output sample.dmc
```

**DPCM Rates:**
| Rate | Hz | Quality |
|------|-----|---------|
| 0 | 4181 | Low |
| 5 | 7046 | Medium |
| 10 | 11186 | Good |
| 15 | 33143 | Best |

## Sequence Tools

### mml_compiler.py

Compile Music Macro Language to game format.

```bash
# Compile MML to NES format
python tools/audio/mml_compiler.py track.mml --target nes --output track.bin

# Compile to SNES format
python tools/audio/mml_compiler.py track.mml --target snes --output track.bin
```

**MML Example:**
```mml
; Title Theme
t120                ; Tempo 120
o4                  ; Octave 4
l4                  ; Default quarter notes
v15                 ; Volume 15

cdefgab>c           ; C scale ascending
```

### midi_converter.py

Convert between MIDI and game formats.

```bash
# Convert game music to MIDI
python tools/audio/midi_converter.py game.sfc --track 5 --output theme.mid

# Convert MIDI to game format
python tools/audio/midi_converter.py theme.mid --target snes --output theme.bin
```

**Limitations:**
- Not all MIDI features map to game formats
- Tempo changes may not convert perfectly
- Channel count limits apply

## Sound Effect Tools

### sfx_extractor.py

Extract sound effects from ROMs.

```bash
# Extract all SFX
python tools/audio/sfx_extractor.py game.nes --output sfx/

# Extract specific effect
python tools/audio/sfx_extractor.py game.nes --id 0x15 --output jump.bin
```

### sfx_editor.py

Edit sound effect data.

```bash
# View SFX data
python tools/audio/sfx_editor.py game.nes --id 0x15 --view

# Replace SFX
python tools/audio/sfx_editor.py game.nes --id 0x15 --replace new_sfx.bin
```

## Audio Analysis

### audio_analyzer.py

Analyze audio data in ROMs.

```bash
# Find music engine
python tools/audio/audio_analyzer.py game.sfc --find-engine

# Map audio data
python tools/audio/audio_analyzer.py game.nes --map --output audio_map.txt

# Identify samples
python tools/audio/audio_analyzer.py game.sfc --find-samples --output samples.txt
```

**Common Engines Detected:**
- Konami SCC
- Capcom sound driver
- Square MML
- Enix sound format
- Nintendo EAD format

## Instrument Tools

### instrument_editor.py

Edit instrument definitions.

```bash
# View instrument data
python tools/audio/instrument_editor.py game.sfc --list

# Export instrument
python tools/audio/instrument_editor.py game.sfc --id 5 --output inst5.json

# Import modified instrument
python tools/audio/instrument_editor.py game.sfc --import inst5.json --id 5
```

**SNES Instrument Data:**
- Sample pointer
- ADSR envelope (Attack, Decay, Sustain, Release)
- Pitch/tuning adjustments
- Loop points

## Audio Pointers

### Music Data Structure (NES)

Typical NES music pointer table:

```
Address   Value    Description
$8000     $8100    Track 0 pointer
$8002     $8150    Track 1 pointer
$8004     $81A0    Track 2 pointer
...
```

### Music Data Structure (SNES)

Typical SNES SPC music structure:

```
$0000-$00FF    Direct page (variables)
$0100-$01FF    Stack
$0200-$1FFF    Driver code
$2000-$3FFF    Sequence data
$4000-$FFFF    Sample data (BRR)
```

## Playback Testing

### audio_player.py

Test extracted audio in emulators.

```bash
# Play NSF track
python tools/audio/audio_player.py music.nsf --track 0

# Play SPC file
python tools/audio/audio_player.py track.spc

# Export to WAV
python tools/audio/audio_player.py track.spc --export track.wav --length 180
```

## Workflow Examples

### Extracting a Complete Soundtrack

```bash
# 1. Identify audio location
python tools/audio/audio_analyzer.py game.sfc --find-engine

# 2. Extract sequence data
python tools/audio/music_extractor.py game.sfc --all --output sequences/

# 3. Extract samples
python tools/audio/brr_converter.py extract-all game.sfc --output samples/

# 4. Build SPC files
python tools/audio/spc_builder.py sequences/ --samples samples/ --output spc/
```

### Creating Music Modification

```bash
# 1. Extract original track
python tools/audio/music_extractor.py game.sfc --track 5 --format mml --output original.mml

# 2. Edit MML file
# (manually edit original.mml)

# 3. Compile new track
python tools/audio/mml_compiler.py modified.mml --target snes --output new_track.bin

# 4. Insert into ROM
python tools/patch/inserter.py game.sfc --data new_track.bin --at $music_offset
```

## Common Issues

### Sample Quality

- BRR compression is lossy
- Higher sample rates = better quality but more space
- Loop points must align to BRR block boundaries (16 samples)

### Timing Issues

- NES: 60Hz NTSC, 50Hz PAL
- SNES: Driver-dependent timing
- MIDI conversion may need tempo adjustment

### Space Constraints

- NES: Limited to ~32KB total audio
- SNES: SPC RAM is 64KB total
- Samples take most space

## File Format References

### NSF Header

```
Offset  Size  Description
$000    5     "NESM" + $1A
$005    1     Version
$006    1     Total songs
$007    1     Starting song
$008    2     Load address
$00A    2     Init address
$00C    2     Play address
$00E    32    Song name
$02E    32    Artist
$04E    32    Copyright
$06E    2     NTSC speed
$070    8     Bankswitch values
$078    2     PAL speed
$07A    1     NTSC/PAL flags
$07B    1     Extra chip flags
$07C    4     Expansion audio
```

### SPC Header

```
Offset  Size  Description
$000    33    "SNES-SPC700..."
$021    1     ID666 tag present
$022    1     Version minor
$023    2     PC (program counter)
$025    1     A register
$026    1     X register
$027    1     Y register
$028    1     PSW
$029    1     SP
$02A    2     Reserved
$100    65536 SPC RAM
$10100  128   DSP registers
```

## See Also

- [Graphics Tools](graphics-tools.md) - For visual assets
- [Text Tools](text-tools.md) - For text/dialogue
- [Workflow Guide](workflow-guide.md) - Complete project workflows
