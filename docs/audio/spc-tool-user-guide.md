# SPC Tool User Guide

A command-line tool for working with SNES audio files. Extract samples, convert formats, edit music in Ableton Live, and create music mods.

## Installation

```powershell
# Clone the repository
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo

# Build the tool
dotnet build src/GameInfoTools.Audio.Cli

# Run the tool
dotnet run --project src/GameInfoTools.Audio.Cli -- <command>
```

Or publish as a standalone executable:

```powershell
dotnet publish src/GameInfoTools.Audio.Cli -c Release -o ./tools
./tools/spc-tool <command>
```

## Quick Start

### View SPC File Information

```powershell
spc-tool info "Super Mario RPG - Forest Maze.spc"
```

Output shows:
- Song title, game, artist
- Sample count and configuration
- Voice settings (volume, pitch, ADSR)
- Echo configuration

### Extract Samples to WAV

```powershell
spc-tool extract "game-music.spc" --output ./samples
```

Creates individual WAV files for each BRR sample in the SPC.

### Export to MIDI

```powershell
spc-tool midi "game-music.spc" --output music.mid
```

Exports the sequence data as a Standard MIDI File.

## Commands Reference

### info

Display detailed information about an SPC file.

```powershell
spc-tool info <spc-file>
```

**Example:**
```
SPC File: ff6-terra.spc
==================================================
Song:     Terra's Theme
Game:     Final Fantasy VI
Artist:   Nobuo Uematsu

Samples:  12
Dir Addr: $6C00

Voice Configuration:
  Ch  Vol L  Vol R  Pitch    Rate   Src  Echo  Noise  ADSR
  --  -----  -----  ------  ------  ---  ----  -----  ----------------
  1      64     64  $1000  16.0kHz    0  Yes   No     A:15 D:7 S:7 R:31
  ...
```

### extract

Extract BRR samples from an SPC file.

```powershell
spc-tool extract <spc-file> [options]

Options:
  -o, --output <dir>    Output directory (default: current)
  -f, --format <fmt>    Output format: wav, brr, both (default: wav)
  --no-normalize        Don't normalize audio levels
```

**Examples:**
```powershell
# Extract all samples as WAV
spc-tool extract game.spc -o ./samples

# Keep original BRR format
spc-tool extract game.spc -o ./samples -f brr

# Extract both formats
spc-tool extract game.spc -o ./samples -f both
```

### convert

Convert between WAV and BRR formats.

```powershell
spc-tool convert <input-file> [options]

Options:
  -o, --output <file>   Output file path
  -l, --loop <sample>   Loop point in samples
  -p, --pre-emphasis    Apply pre-emphasis filter (improves quality)
  -r, --rate <hz>       Target sample rate (default: 32000)
```

**Examples:**
```powershell
# WAV to BRR
spc-tool convert sample.wav -o sample.brr

# BRR to WAV
spc-tool convert sample.brr -o sample.wav

# With loop point and pre-emphasis
spc-tool convert drum.wav -o drum.brr -l 1024 -p
```

### midi

Export SPC sequence data to MIDI format.

```powershell
spc-tool midi <spc-file> [options]

Options:
  -o, --output <file>   Output MIDI file path
  --analyze             Show sequence analysis only
  --ticks <n>           Ticks per beat (default: 48)
```

**Examples:**
```powershell
# Export to MIDI
spc-tool midi game.spc -o music.mid

# Analyze sequence without exporting
spc-tool midi game.spc --analyze
```

### import-midi

Compile a MIDI file to N-SPC sequence format.

```powershell
spc-tool import-midi <midi-file> [options]

Options:
  -o, --output <file>      Output file path
  --base-address <hex>     Base address in SPC RAM (default: 1000)
  --analyze                Show MIDI structure only
```

**Examples:**
```powershell
# Compile MIDI to N-SPC
spc-tool import-midi music.mid -o sequence.nspc

# Analyze MIDI file
spc-tool import-midi music.mid --analyze

# Custom base address
spc-tool import-midi music.mid --base-address 2000
```

### ableton

Generate an Ableton Live project from an SPC file.

```powershell
spc-tool ableton <spc-file> [options]

Options:
  -o, --output <file>   Output .als file path
  --bpm <n>             Project BPM (default: auto-detect)
```

**Example:**
```powershell
spc-tool ableton game.spc -o "My Project.als"
```

### build

Build a new SPC file from samples.

```powershell
spc-tool build [options]

Options:
  -o, --output <file>   Output SPC file
  -s, --sample <file>   Add a sample (can specify multiple)
  -c, --config <file>   Configuration JSON file
```

**Example:**
```powershell
spc-tool build -o new-music.spc -s kick.brr -s snare.brr -c config.json
```

### bundle

Create and manage .spcmod music mod bundles.

```powershell
spc-tool bundle <action> [options]

Actions:
  create    Create a new bundle
  info      Show bundle information
  extract   Extract bundle contents
```

**Examples:**
```powershell
# Create a bundle
spc-tool bundle create -o my-mod.spcmod -d ./mod-files

# View bundle info
spc-tool bundle info my-mod.spcmod

# Extract bundle
spc-tool bundle extract my-mod.spcmod -o ./extracted
```

### batch

Process multiple SPC files at once.

```powershell
spc-tool batch <action> <directory> [options]

Actions:
  extract   Extract samples from all SPCs
  info      Generate CSV of all SPC metadata

Options:
  -o, --output <dir>    Output directory
  -r, --recursive       Search subdirectories
  --csv                 Output info as CSV
```

**Examples:**
```powershell
# Extract all samples from a directory
spc-tool batch extract ./spc-files -o ./all-samples -r

# Generate metadata CSV
spc-tool batch info ./spc-files -o info.csv --csv
```

### analyze

Perform detailed memory analysis on an SPC file.

```powershell
spc-tool analyze <spc-file> [options]

Options:
  --hex <start> <len>   Hex dump a memory region
  --find <pattern>      Search for byte pattern
  --map                 Show memory map
```

**Examples:**
```powershell
# Show memory map
spc-tool analyze game.spc --map

# Hex dump specific region
spc-tool analyze game.spc --hex 0x1000 256
```

### validate

Validate an SPC file for correctness.

```powershell
spc-tool validate <spc-file> [options]

Options:
  --strict              Treat warnings as errors
  --json                Output as JSON
```

**Examples:**
```powershell
# Validate file
spc-tool validate game.spc

# Strict validation for CI
spc-tool validate game.spc --strict
```

### render

Render SPC audio to a WAV file.

```powershell
spc-tool render <spc-file> [options]

Options:
  -o, --output <file>   Output WAV file
  -d, --duration <sec>  Duration in seconds (default: 60)
  -r, --rate <hz>       Sample rate (default: 32000)
  --no-echo             Disable echo simulation
```

**Examples:**
```powershell
# Render 2 minutes of audio
spc-tool render game.spc -o output.wav -d 120

# High quality render
spc-tool render game.spc -o output.wav -r 44100
```

## Workflows

### Complete Music Editing Workflow

1. **Extract the original music:**
   ```powershell
   spc-tool extract original.spc -o ./project/samples -f both
   spc-tool midi original.spc -o ./project/original.mid
   ```

2. **Create Ableton project:**
   ```powershell
   spc-tool ableton original.spc -o "./project/Music Edit.als"
   ```

3. **Edit in Ableton Live:**
   - Open the .als file
   - Edit MIDI, adjust samples
   - Export modified MIDI

4. **Convert modified assets:**
   ```powershell
   # Convert any new/modified samples
   spc-tool convert new-sample.wav -o new-sample.brr -p

   # Compile modified MIDI
   spc-tool import-midi modified.mid -o sequence.nspc
   ```

5. **Build new SPC:**
   ```powershell
   spc-tool build -o modified.spc -c project-config.json
   ```

6. **Create distributable mod:**
   ```powershell
   spc-tool bundle create -o "My Music Mod.spcmod" -d ./project
   ```

### Batch Sample Library Creation

Extract samples from your entire SPC collection:

```powershell
# Extract all samples organized by game
spc-tool batch extract "C:\SPCs" -o "C:\Sample Library" -r

# Generate a catalog
spc-tool batch info "C:\SPCs" -o catalog.csv --csv -r
```

### Quality Comparison

Compare original and modified audio:

```powershell
# Render both versions
spc-tool render original.spc -o original.wav -d 30
spc-tool render modified.spc -o modified.wav -d 30

# Validate the modified file
spc-tool validate modified.spc
```

## Technical Reference

### BRR Format

BRR (Bit Rate Reduction) is the SNES sample format:
- 9 bytes encode 16 samples
- 4:1 compression ratio
- 4 filter modes for quality
- Loop points must align to 16-sample boundaries

### SPC Limitations

- **8 channels maximum** - Hardware limit
- **64KB RAM** - Total for samples + sequence + code
- **32kHz max sample rate** - SPC700 limitation
- **BRR alignment** - Loops must be 16-sample aligned

### Supported Sound Drivers

The tool can detect and parse these SNES sound drivers:
- **N-SPC** - Nintendo's standard driver (most first-party games)
- **Akao** - Square games (Final Fantasy, Chrono Trigger)
- **Konami SCC** - Konami games
- **Capcom** - Capcom games
- **HAL** - HAL Laboratory games

## Troubleshooting

### "Could not parse sequence data"

The SPC uses an unsupported sound driver. Try:
- Use `spc-tool analyze --map` to inspect the format
- Extract samples still works even if sequence parsing fails

### Poor sample quality after conversion

Try these options:
- Add `--pre-emphasis` for better high frequencies
- Use a higher sample rate source file
- Check loop point alignment

### Echo sounds wrong

Echo simulation is approximate. The real SPC700 echo has hardware-specific behavior that may differ slightly from the software simulation.

## See Also

- [SNES Audio Technical Reference](snes-audio-technical-reference.md)
- [SPC File Format Specification](spc-file-format.md)
- [BRR Encoding Guide](brr-encoding-guide.md)
