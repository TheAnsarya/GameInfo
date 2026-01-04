# SNES Audio Documentation

Tools and guides for working with SNES audio formats, including SPC files, BRR samples, and music editing workflows.

## Quick Links

| Guide | Description |
|-------|-------------|
| [Getting Started](getting-started-snes-music-editing.md) | Beginner tutorial for editing SNES music |
| [SPC Tool User Guide](spc-tool-user-guide.md) | Complete command reference for spc-tool |
| [BRR Encoding Guide](brr-encoding-guide.md) | Create high-quality BRR samples |

## Reference Documentation

| Document | Description |
|----------|-------------|
| [Technical Reference](snes-audio-technical-reference.md) | SPC700 hardware, DSP registers, memory maps |
| [SPC File Format](spc-file-format.md) | SPC file structure specification |

## Tool: spc-tool

The `spc-tool` CLI provides a complete workflow for SNES music editing:

```
spc-tool <command> [options]

Commands:
  info          Display SPC file information
  extract       Extract BRR samples to WAV
  convert       Convert between WAV and BRR
  midi          Export SPC sequence to MIDI
  import-midi   Compile MIDI to N-SPC format
  ableton       Generate Ableton Live project
  build         Build SPC from components
  bundle        Create/manage .spcmod bundles
  batch         Bulk processing operations
  analyze       Memory analysis and inspection
  validate      Validate SPC files
  render        Render SPC to audio
```

### Installation

```powershell
# Build from source
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo
dotnet build src/GameInfoTools.Audio.Cli
```

### Quick Examples

```powershell
# View SPC info
spc-tool info game-music.spc

# Extract samples
spc-tool extract game-music.spc -o ./samples

# Convert WAV to BRR
spc-tool convert sample.wav -o sample.brr

# Export to MIDI
spc-tool midi game-music.spc -o music.mid
```

## Workflow Overview

```
┌──────────────────────────────────────────────────────────────────┐
│                    SNES Music Editing Workflow                    │
└──────────────────────────────────────────────────────────────────┘

Original SPC File
       │
       ▼
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   extract    │────▶│  WAV Files   │────▶│   Ableton    │
│              │     │  (samples)   │     │   Project    │
│   midi       │────▶│  MIDI File   │     │              │
└──────────────┘     └──────────────┘     └──────┬───────┘
                                                  │
                                            [User Editing]
                                                  │
                                                  ▼
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│    build     │◀────│  BRR Files   │◀────│  Modified    │
│              │     │  (samples)   │     │  WAV/MIDI    │
│              │◀────│  N-SPC Data  │◀────│              │
└──────┬───────┘     └──────────────┘     └──────────────┘
       │                     ▲
       ▼                     │
┌──────────────┐     ┌──────────────┐
│  New SPC     │     │   convert    │
│   File       │     │ import-midi  │
└──────────────┘     └──────────────┘
       │
       ▼
┌──────────────┐
│    bundle    │────▶  .spcmod Distribution File
└──────────────┘
```

## SNES Audio Constraints

When working with SNES audio, keep these hardware limitations in mind:

| Constraint | Value | Notes |
|------------|-------|-------|
| Channels | 8 maximum | Simultaneous voices |
| Sample RAM | 64 KB | Shared with driver, echo buffer |
| Sample Rate | ≤32 kHz | Per voice |
| Compression | BRR (4:1) | ~3.5:1 actual ratio |
| Echo Delay | 0-240 ms | Consumes RAM |

## File Formats

### Input Formats
- `.spc` - SPC700 sound file
- `.wav` - Uncompressed audio
- `.mid` - Standard MIDI file

### Output Formats
- `.spc` - SPC700 sound file
- `.brr` - BRR compressed sample
- `.wav` - Uncompressed audio
- `.mid` - Standard MIDI file
- `.als` - Ableton Live Set
- `.nspc` - N-SPC sequence data
- `.spcmod` - Music mod bundle (ZIP)

## Community Resources

- [SNES Dev Wiki](https://wiki.superfamicom.org/spc700-reference)
- [SNESmusic.org](https://www.snesmusic.org/) - SPC archives
- [ROMhacking.net](https://www.romhacking.net/) - Tools and documentation
