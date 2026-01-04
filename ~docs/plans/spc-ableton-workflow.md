2# SPC-Ableton Live Music Editing Workflow

## Executive Summary

Enable ROM hackers and music modders to edit SNES game music using modern DAW tools (Ableton Live) with a complete round-trip workflow: extract → edit → reimport.

## Vision

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  SNES ROM   │───▶│  SPC File   │───▶│ Ableton Live│───▶│ Modified    │
│  (Original) │    │  + Samples  │    │  Project    │    │  SPC/ROM    │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
      │                  │                  │                  │
      │                  ▼                  ▼                  │
      │            ┌───────────┐     ┌───────────┐            │
      │            │ BRR → WAV │     │ WAV → BRR │            │
      │            │ SPC → MIDI│     │ MIDI → SPC│            │
      │            └───────────┘     └───────────┘            │
      │                                                       │
      └───────────────── Round Trip ─────────────────────────┘
```

## Core Components

### 1. Extraction Pipeline (ROM → Editable)

| Stage | Input | Output | Tool |
|-------|-------|--------|------|
| 1a | SNES ROM | SPC file(s) | SPC Extractor |
| 1b | SPC file | BRR samples | BRR Extractor |
| 1c | BRR samples | WAV files | BRR-to-WAV Converter |
| 1d | SPC file | MIDI file | SPC-to-MIDI Converter |
| 1e | All above | Ableton Project | Project Generator |

### 2. Ableton Live Integration

| Component | Description |
|-----------|-------------|
| Project Template | Pre-configured .als file with SNES-appropriate settings |
| Sample Library | Organized BRR-converted WAV samples |
| MIDI Tracks | Imported sequence data mapped to samples |
| Instrument Racks | SNES-style instruments with original samples |
| Export Presets | Settings for BRR-compatible WAV export |

### 3. Reimport Pipeline (Edited → ROM)

| Stage | Input | Output | Tool |
|-------|-------|--------|------|
| 3a | Edited WAV | BRR samples | WAV-to-BRR Converter |
| 3b | Edited MIDI | Sequence data | MIDI-to-SPC Converter |
| 3c | BRR + Sequence | SPC file | SPC Builder |
| 3d | SPC file | ROM patch | ROM Injector |

### 4. Bundle System

Create distributable packages containing all workflow stages:

```
song_bundle.zip
├── original/
│   ├── track_01.spc           # Original SPC
│   └── metadata.json          # Song info, game, composer
├── samples/
│   ├── brr/
│   │   ├── instrument_00.brr  # Original BRR
│   │   └── ...
│   └── wav/
│       ├── instrument_00.wav  # Converted WAV (44.1kHz)
│       └── ...
├── midi/
│   ├── track_01.mid           # Converted MIDI
│   └── track_01_channels.json # Channel mapping info
├── ableton/
│   ├── track_01.als           # Ableton Live project
│   └── Samples/               # Ableton sample folder
├── modified/
│   ├── samples/               # New/edited samples
│   ├── track_01_modified.mid  # Edited MIDI
│   └── track_01_modified.spc  # Rebuilt SPC
└── readme.md                  # Bundle documentation
```

---

## Technical Specifications

### BRR (Bit Rate Reduction) Format

SNES audio uses BRR compression:
- 4-bit ADPCM encoding
- 9 bytes encode 16 samples
- 32kHz max sample rate (typically 16kHz or lower)
- Loop points stored in sample header

**Conversion Considerations:**
- WAV export: 32kHz, 16-bit mono recommended
- Loop point preservation critical
- Some quality loss on round-trip is expected

### SPC File Format

| Offset | Size | Description |
|--------|------|-------------|
| 0x00 | 33 | Header "SNES-SPC700 Sound File Data" |
| 0x21 | 2 | Version |
| 0x25 | 32 | Song title |
| 0x45 | 32 | Game title |
| 0x65 | 16 | Dumper name |
| 0x100 | 65536 | SPC700 RAM (64KB) |
| 0x10100 | 128 | DSP registers |
| 0x10180 | 64 | Extra RAM |

### MIDI Mapping

SNES has 8 audio channels. MIDI mapping:

| SPC Channel | MIDI Channel | Typical Use |
|-------------|--------------|-------------|
| 0 | 1 | Lead melody |
| 1 | 2 | Harmony/Counter |
| 2 | 3 | Bass |
| 3 | 4 | Drums/Percussion |
| 4 | 5 | Pad/Strings |
| 5 | 6 | Effects/Arp |
| 6 | 7 | Additional |
| 7 | 8 | Additional |

---

## Implementation Phases

### Phase 1: Core Extraction (MVP)
- [ ] SPC file parser
- [ ] BRR sample extractor
- [ ] BRR → WAV converter
- [ ] Basic SPC → MIDI converter
- [ ] Bundle creator (extraction only)

### Phase 2: Ableton Integration
- [ ] Ableton project template generator
- [ ] Instrument rack builder
- [ ] Sample organization system
- [ ] MIDI channel mapping
- [ ] Project documentation generator

### Phase 3: Reimport Pipeline
- [ ] WAV → BRR converter (with loop support)
- [ ] MIDI → sequence converter
- [ ] SPC builder/patcher
- [ ] ROM injection tools

### Phase 4: Polish & UX
- [ ] GUI application
- [ ] Batch processing
- [ ] Preset library for common games
- [ ] Quality comparison tools
- [ ] Community bundle sharing

---

## Tool Architecture

### Proposed CLI Tools

```bash
# Extraction
spc-extract song.spc --output ./bundle/

# Convert BRR to WAV
brr-to-wav samples/*.brr --output ./wav/ --samplerate 32000

# Convert SPC to MIDI
spc-to-midi song.spc --output song.mid --mapping auto

# Generate Ableton project
spc-to-ableton song.spc --output ./ableton/ --template snes-default

# Reimport - WAV to BRR
wav-to-brr edited/*.wav --output ./brr/ --loop-detect

# Reimport - Build new SPC
spc-build --samples ./brr/ --midi song.mid --output song_new.spc

# Create bundle
spc-bundle create --spc song.spc --name "Battle Theme" --output bundle.zip

# Full round-trip
spc-workflow extract game.spc --to-ableton
spc-workflow import edited_project.als --to-spc
```

### Library Architecture (C#)

```
GameInfoTools.Audio/
├── Spc/
│   ├── SpcFile.cs           # SPC file parser/writer
│   ├── SpcExtractor.cs      # Extract from ROM
│   └── SpcBuilder.cs        # Build new SPC files
├── Brr/
│   ├── BrrDecoder.cs        # BRR → PCM
│   ├── BrrEncoder.cs        # PCM → BRR
│   └── BrrSample.cs         # Sample with loop info
├── Converters/
│   ├── SpcToMidi.cs         # Sequence extraction
│   ├── MidiToSpc.cs         # Sequence import
│   ├── BrrToWav.cs          # Sample conversion
│   └── WavToBrr.cs          # Sample conversion
├── Ableton/
│   ├── AbletonProjectGenerator.cs
│   ├── InstrumentRackBuilder.cs
│   └── ProjectTemplate.als  # Template file
└── Bundle/
    ├── MusicBundle.cs       # Bundle format
    └── BundleCreator.cs     # Zip packaging
```

---

## Dependencies & Tools

### Existing Tools to Leverage

| Tool | Purpose | License |
|------|---------|---------|
| [spc_tool](https://github.com/wiki/spc_tool) | SPC manipulation | Various |
| [BRRtools](https://github.com/wiki/brrtools) | BRR encoding/decoding | GPL |
| [spc2midi](https://github.com/wiki/spc2midi) | SPC to MIDI | Various |
| [SPC700 Player](https://wiki) | Reference player | - |

### Required Libraries (C#)

- NAudio - WAV file handling
- DryWetMidi - MIDI file handling
- System.IO.Compression - ZIP bundles

### Ableton Live Requirements

- Ableton Live 10+ (Standard or Suite)
- Simpler/Sampler for sample playback
- External Instrument (optional, for hardware)

---

## Quality Considerations

### Known Limitations

1. **BRR Quality Loss**: Round-trip conversion has some quality loss
2. **Tempo Detection**: SPC tempo must be estimated or manually set
3. **Effects**: SNES echo/reverb may not translate perfectly
4. **Pitch Bends**: Complex pitch envelopes may need manual adjustment

### Mitigation Strategies

1. Keep original samples when only changing arrangement
2. Provide A/B comparison tools
3. Document known game-specific quirks
4. Support manual override for all auto-detected values

---

## Success Metrics

| Metric | Target |
|--------|--------|
| Round-trip fidelity | 95%+ for unchanged content |
| Extraction success rate | 99%+ for standard SPC files |
| Time to first edit | < 5 minutes from ROM to Ableton |
| Bundle size efficiency | < 2x original SPC size |
| Supported games | All games with standard SNES audio |

---

## Future Enhancements

1. **Web-based editor** - Browser-based SPC editor without DAW
2. **AI-assisted transcription** - Better MIDI extraction
3. **Sample library** - Shared BRR instrument library
4. **Real-time preview** - Play modified SPC before export
5. **Multi-track comparison** - Compare original vs modified
6. **Integration with other DAWs** - FL Studio, Logic Pro templates

---

## References

- [SNES Dev Wiki - Audio](https://snes.nesdev.org/wiki/Audio)
- [SPC File Format](https://wiki.superfamicom.org/spc-and-rsn-file-format)
- [BRR Format](https://wiki.superfamicom.org/bit-rate-reduction)
- [Ableton Live Manual](https://www.ableton.com/en/manual/)
