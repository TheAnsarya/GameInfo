# SNES Music Editing Workflow - User Guide

## Overview

This guide explains how to extract SNES game music, edit it in Ableton Live, and reimport it into your game or ROM hack.

---

## Quick Start

### Prerequisites

- **Ableton Live 10+** (Standard or Suite recommended)
- **Python 3.10+** with dependencies
- **SNES ROM** with the music you want to edit
- Basic understanding of MIDI and audio sampling

### Installation

```powershell
# Install the GameInfo tools
cd c:\Users\me\source\repos\GameInfo
pip install -r requirements.txt

# Verify installation
python -m gameinfo.audio --version
```

---

## Part 1: Extraction (ROM → Ableton)

### Step 1: Extract SPC Files from ROM

```powershell
# Extract all music from a SNES ROM
python tools/spc_extractor.py "path/to/game.sfc" --output "./music/"

# Output:
# music/
# ├── 01_title_screen.spc
# ├── 02_overworld.spc
# ├── 03_battle.spc
# └── ...
```

### Step 2: Extract Samples and Convert to WAV

```powershell
# Extract BRR samples from an SPC file
python tools/brr_extractor.py music/03_battle.spc --output "./samples/"

# Convert BRR to WAV
python tools/brr_to_wav.py samples/*.brr --output "./wav/" --rate 32000
```

**Output Structure:**
```
samples/
├── brr/
│   ├── 00_bass.brr
│   ├── 01_snare.brr
│   ├── 02_lead.brr
│   └── ...
└── wav/
    ├── 00_bass.wav
    ├── 01_snare.wav
    ├── 02_lead.wav
    └── ...
```

### Step 3: Convert SPC to MIDI

```powershell
# Extract sequence data as MIDI
python tools/spc_to_midi.py music/03_battle.spc --output "./midi/03_battle.mid"
```

**MIDI Channel Mapping:**
| Channel | Typical Instrument |
|---------|-------------------|
| 1 | Lead/Melody |
| 2 | Harmony |
| 3 | Bass |
| 4 | Drums |
| 5-8 | Additional voices |

### Step 4: Generate Ableton Live Project

```powershell
# Create a complete Ableton project
python tools/spc_to_ableton.py music/03_battle.spc \
    --output "./ableton/03_battle/" \
    --include-samples \
    --include-midi
```

**Generated Project:**
```
ableton/03_battle/
├── 03_battle.als              # Ableton Live Set
├── Samples/
│   └── SNES/
│       ├── 00_bass.wav
│       ├── 01_snare.wav
│       └── ...
├── MIDI/
│   └── 03_battle_channels.mid
└── README.txt                  # Channel notes
```

---

## Part 2: Editing in Ableton Live

### Opening the Project

1. Launch Ableton Live
2. File → Open Live Set
3. Navigate to `03_battle.als`

### Project Layout

The generated project includes:

```
┌────────────────────────────────────────────────────────┐
│ Ableton Live - 03_battle.als                          │
├────────────────────────────────────────────────────────┤
│ Track 1: Ch1-Lead      [Simpler: 02_lead.wav]         │
│ Track 2: Ch2-Harmony   [Simpler: 03_pad.wav]          │
│ Track 3: Ch3-Bass      [Simpler: 00_bass.wav]         │
│ Track 4: Ch4-Drums     [Drum Rack: SNES Drums]        │
│ Track 5: Ch5-Pad       [Simpler: 04_strings.wav]      │
│ Track 6: Ch6-FX        [Simpler: 05_fx.wav]           │
│ Track 7: Ch7-Extra     [Empty]                        │
│ Track 8: Ch8-Extra     [Empty]                        │
├────────────────────────────────────────────────────────┤
│ Master: SNES Mix Bus                                   │
│   └── [Limiter] [EQ] [Reference: Original SPC]        │
└────────────────────────────────────────────────────────┘
```

### Editing Guidelines

#### Preserving Compatibility

1. **Keep to 8 channels** - SNES has exactly 8 audio channels
2. **Watch sample memory** - Total sample RAM is 64KB
3. **Use mono samples** - SNES samples are mono
4. **Match sample rates** - Export at 32kHz or lower

#### Recommended Edits

| Edit Type | Difficulty | Notes |
|-----------|------------|-------|
| Change notes/melody | Easy | Just edit MIDI |
| Adjust volumes | Easy | Will translate back |
| Replace samples | Medium | Must convert to BRR |
| Add new instruments | Medium | Watch sample budget |
| Change tempo | Easy | Update project tempo |
| Add complex effects | Hard | May not translate |

### Working with Samples

#### Replacing a Sample

1. Record or import new WAV sample
2. Drag to Simpler instrument
3. Set loop points if needed
4. Save project

#### Sample Requirements for Export

| Parameter | Requirement |
|-----------|-------------|
| Format | WAV, 16-bit |
| Sample Rate | ≤32kHz (16kHz typical) |
| Channels | Mono |
| Length | Keep short (memory limit) |
| Loops | Set loop points in Simpler |

---

## Part 3: Export (Ableton → ROM)

### Step 1: Export Modified Samples

In Ableton Live:
1. Right-click each Simpler device
2. "Show in Browser" → locate sample
3. Or export via File → Export Audio

For CLI batch export:
```powershell
# Collect samples from Ableton project
python tools/ableton_sample_collector.py "ableton/03_battle.als" \
    --output "./export/wav/"
```

### Step 2: Convert WAV to BRR

```powershell
# Convert all WAV samples to BRR format
python tools/wav_to_brr.py export/wav/*.wav \
    --output "./export/brr/" \
    --rate 16000 \
    --detect-loops
```

**Loop Point Handling:**
```powershell
# Manually specify loop points
python tools/wav_to_brr.py sample.wav \
    --loop-start 4532 \
    --loop-end 8127 \
    --output sample.brr
```

### Step 3: Export MIDI from Ableton

1. File → Export MIDI Clip...
2. Select each track or "All Tracks"
3. Save as `03_battle_modified.mid`

### Step 4: Build New SPC File

```powershell
# Combine samples and MIDI into new SPC
python tools/spc_builder.py \
    --midi "./export/03_battle_modified.mid" \
    --samples "./export/brr/" \
    --template "music/03_battle.spc" \
    --output "music/03_battle_modified.spc"
```

### Step 5: Test the Modified SPC

```powershell
# Play in SPC player
spc_player music/03_battle_modified.spc

# Or use web-based player
# https://spcplayer.com
```

### Step 6: Inject into ROM

```powershell
# Patch the ROM with new music
python tools/spc_injector.py "game.sfc" \
    --track 3 \
    --spc "music/03_battle_modified.spc" \
    --output "game_modified.sfc"
```

---

## Part 4: Bundle Creation

### Create a Distributable Bundle

```powershell
# Create a complete music mod bundle
python tools/music_bundle.py create \
    --name "Epic Battle Theme v2" \
    --author "YourName" \
    --game "Final Fantasy VI" \
    --original "music/03_battle.spc" \
    --modified "music/03_battle_modified.spc" \
    --ableton "ableton/03_battle/" \
    --output "bundles/epic_battle_v2.zip"
```

### Bundle Contents

```
epic_battle_v2.zip
├── README.md                    # Usage instructions
├── metadata.json                # Bundle info
├── original/
│   ├── 03_battle.spc           # Original for reference
│   └── samples/                # Original BRR + WAV
├── modified/
│   ├── 03_battle_modified.spc  # Ready to use
│   ├── samples/                # Modified BRR + WAV
│   └── 03_battle_modified.mid  # Modified MIDI
├── ableton/
│   ├── 03_battle.als           # Full Ableton project
│   └── Samples/                # All project samples
├── patches/
│   └── battle_music.ips        # IPS patch for ROM
└── preview/
    └── preview.mp3             # Audio preview
```

### Apply a Bundle

```powershell
# Apply someone else's music bundle
python tools/music_bundle.py apply \
    --bundle "bundles/epic_battle_v2.zip" \
    --rom "game.sfc" \
    --output "game_modded.sfc"
```

---

## Troubleshooting

### Common Issues

| Problem | Solution |
|---------|----------|
| SPC won't play | Check sample memory didn't exceed 64KB |
| Notes are wrong pitch | Verify sample rate in BRR conversion |
| Loops click/pop | Adjust loop points to zero-crossings |
| Song is silent | Check channel mapping in MIDI |
| Song too fast/slow | Adjust tempo in SPC builder |

### Memory Calculator

```powershell
# Check if samples fit in SNES RAM
python tools/brr_memory_check.py export/brr/

# Output:
# Sample Memory Usage:
#   00_bass.brr      - 2,340 bytes
#   01_snare.brr     - 1,120 bytes
#   02_lead.brr      - 4,560 bytes
#   ...
#   Total: 32,450 / 65,536 bytes (49.5%)
#   Status: OK ✓
```

### Quality Comparison

```powershell
# Generate comparison report
python tools/spc_compare.py \
    --original "music/03_battle.spc" \
    --modified "music/03_battle_modified.spc" \
    --output "comparison_report.html"
```

---

## Best Practices

1. **Always keep originals** - Never overwrite original SPC files
2. **Test frequently** - Play SPC after each major edit
3. **Watch memory** - SNES has strict sample memory limits
4. **Use 16kHz samples** - Higher isn't always better
5. **Document changes** - Note what you modified in the bundle
6. **Version your work** - Use git or zip backups

---

## Reference

### Keyboard Shortcuts (Ableton Live)

| Action | Shortcut |
|--------|----------|
| Play/Stop | Space |
| Loop selection | Ctrl+L |
| Duplicate | Ctrl+D |
| Export audio | Ctrl+Shift+R |
| Export MIDI | Ctrl+Shift+E |

### File Format Reference

| Extension | Description |
|-----------|-------------|
| .spc | SNES audio snapshot |
| .brr | SNES sample format |
| .wav | Standard audio |
| .mid | MIDI sequence |
| .als | Ableton Live Set |

### SNES Audio Specs

| Specification | Value |
|---------------|-------|
| Channels | 8 |
| Sample RAM | 64KB |
| Max sample rate | 32kHz |
| Bit depth | 16-bit (4-bit compressed) |
| Echo buffer | Up to 15KB |
