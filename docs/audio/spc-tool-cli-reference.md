# SPC-Tool CLI Reference

## Overview

`spc-tool` is the command-line interface for SNES audio manipulation. It provides commands for extraction, conversion, analysis, and building of SPC files.

## Installation

```powershell
# Build from source
cd C:\Users\me\source\repos\GameInfo
dotnet build src/GameInfoTools.Audio.Cli

# Or install globally
dotnet tool install --global spc-tool
```

## Commands

### `info` - Display SPC Information

Display detailed information about an SPC file including metadata, samples, voice configuration, and DSP settings.

```powershell
spc-tool info <spc-file>
```

**Example:**
```powershell
spc-tool info battle.spc
```

**Output includes:**
- Song title, game, artist, dumper
- Song length and fade time
- Sample count and directory address
- Voice configuration (volume, pitch, ADSR, echo/noise enable)
- Echo configuration (delay, feedback, FIR coefficients)

---

### `extract` - Extract BRR Samples

Extract BRR samples from an SPC file to individual files.

```powershell
spc-tool extract <spc-file> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <dir>` | Output directory (default: current) |
| `-f, --format <fmt>` | Output format: `brr` or `wav` (default: brr) |

**Examples:**
```powershell
# Extract as BRR
spc-tool extract battle.spc --output ./samples/

# Extract as WAV
spc-tool extract battle.spc --output ./wav/ --format wav
```

---

### `convert` - Convert Between Formats

Convert between audio formats (BRR ↔ WAV).

```powershell
spc-tool convert <input> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <file>` | Output file |
| `-r, --rate <hz>` | Sample rate (default: 32000) |
| `-p, --pre-emphasis` | Apply pre-emphasis filter |

**Examples:**
```powershell
# BRR to WAV
spc-tool convert sample.brr --output sample.wav

# WAV to BRR
spc-tool convert sample.wav --output sample.brr --rate 16000 --pre-emphasis
```

---

### `ableton` - Generate Ableton Project

Create an Ableton Live project from an SPC file with samples and track configuration.

```powershell
spc-tool ableton <spc-file> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <dir>` | Output directory |
| `--name <name>` | Project name (default: from SPC) |

**Example:**
```powershell
spc-tool ableton battle.spc --output ./ableton/battle/ --name "Battle Theme"
```

**Generated Structure:**
```
battle/
├── Battle Theme.als    # Ableton Live Set
└── Samples/
    └── Processed/
        └── [sample files]
```

---

### `batch` - Batch Processing

Process multiple SPC files at once.

#### `batch extract`

```powershell
spc-tool batch extract <directory> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <dir>` | Output directory |
| `-f, --format <fmt>` | Output format: `brr` or `wav` |
| `-r, --recursive` | Process subdirectories |
| `--per-file` | Organize by source file |

#### `batch info`

```powershell
spc-tool batch info <directory> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <file>` | Output CSV file |
| `-r, --recursive` | Process subdirectories |

---

### `bundle` - Music Mod Bundles

Create, inspect, and extract music mod bundles (.spcmod format).

#### `bundle create`

```powershell
spc-tool bundle create <output-path> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `--name <name>` | Bundle name (required) |
| `--version <ver>` | Version string (default: 1.0.0) |
| `--author <author>` | Author name (required) |
| `--description <desc>` | Bundle description |
| `--samples <dir>` | Directory of BRR/WAV samples to include |
| `--readme <file>` | Readme file to include |

**Example:**
```powershell
spc-tool bundle create my-mod.spcmod `
    --name "Epic Battle Theme" `
    --author "ModAuthor" `
    --version "2.0.0" `
    --samples ./samples/ `
    --readme ./README.md
```

#### `bundle info`

```powershell
spc-tool bundle info <bundle-path>
```

#### `bundle extract`

```powershell
spc-tool bundle extract <bundle-path> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `-o, --output <dir>` | Extraction directory |

---

### `build` - Build SPC Files

Build a complete SPC file from BRR/WAV samples.

```powershell
spc-tool build <output-spc> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `--sample <n:path>` | Add sample (e.g., `0:bass.brr`) |
| `--wav-sample <n:path>` | Add WAV sample (auto-converts to BRR) |
| `--voice <n:sample:pitch:vol>` | Configure voice |
| `--title <title>` | Song title |
| `--game <game>` | Game title |
| `--artist <artist>` | Artist name |

**Example:**
```powershell
spc-tool build output.spc `
    --sample 0:bass.brr `
    --sample 1:snare.brr `
    --wav-sample 2:lead.wav `
    --voice 0:0:4096:127 `
    --voice 1:1:4096:100 `
    --title "My Song" `
    --game "My Game"
```

---

### `analyze` - Memory Analysis

Perform detailed analysis of SPC RAM and DSP state.

```powershell
spc-tool analyze <spc-file>
```

**Output includes:**
- Memory map with region identification
- Sample directory listing
- DSP register summary
- Voice state details
- Echo configuration

---

### `validate` - Validate SPC Files

Check an SPC file for potential issues.

```powershell
spc-tool validate <spc-file> [options]
```

**Options:**
| Option | Description |
|--------|-------------|
| `--strict` | Treat warnings as errors |
| `--json` | Output results as JSON |

**Example:**
```powershell
# Basic validation
spc-tool validate battle.spc

# Strict mode for CI
spc-tool validate battle.spc --strict

# JSON output for automation
spc-tool validate battle.spc --json > validation.json
```

**Validation Checks:**
- Header (ID666 metadata, song length)
- DSP registers (volume, mute, echo delay)
- Sample directory (valid entries, in-bounds pointers)
- BRR samples (valid headers, range values)
- Voice configuration (PMON, volume)
- Echo buffer (overflow, overlaps)

---

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | Error (file not found, validation failed, etc.) |

---

## Examples

### Complete Workflow

```powershell
# 1. Analyze original SPC
spc-tool info original.spc

# 2. Extract samples
spc-tool extract original.spc --output ./samples/ --format wav

# 3. Generate Ableton project
spc-tool ableton original.spc --output ./ableton/

# 4. (Edit in Ableton Live)

# 5. Convert edited samples back to BRR
spc-tool convert edited_bass.wav --output bass.brr --rate 16000

# 6. Build new SPC
spc-tool build modified.spc `
    --sample 0:bass.brr `
    --sample 1:snare.brr `
    --voice 0:0:4096:127

# 7. Validate result
spc-tool validate modified.spc

# 8. Create distribution bundle
spc-tool bundle create my-mod.spcmod `
    --name "Modified Battle Theme" `
    --author "Me" `
    --samples ./brr/
```

### Batch Processing

```powershell
# Export all samples from a game's SPC collection
spc-tool batch extract "./spc_collection/" `
    --output "./all_samples/" `
    --format wav `
    --recursive `
    --per-file

# Generate metadata CSV
spc-tool batch info "./spc_collection/" `
    --output metadata.csv `
    --recursive
```

---

## See Also

- [SNES Music Editing Guide](snes-music-editing-guide.md)
- [SNES Audio Technical Reference](snes-audio-technical-reference.md)
