# TAS Converter Manual Testing Guide

This guide covers manual testing procedures for features that cannot be fully automated or require human verification.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Test Files](#getting-test-files)
- [GUI Testing](#gui-testing)
- [CLI Testing](#cli-testing)
- [Emulator Verification](#emulator-verification)
- [Visual Verification Checklist](#visual-verification-checklist)

---

## Prerequisites

### Required Software

1. **.NET 10 SDK** - For building and running the tools
2. **Python 3.8+** - For running the TAS file downloader script
3. **Emulators** (for verification testing):
   - [Snes9x](https://www.snes9x.com/) - For SMV files
   - [lsnes](https://tasvideos.org/EmulatorResources/Lsnes) - For LSMV files
   - [BizHawk](https://tasvideos.org/BizHawk) - For BK2 files
   - [FCEUX](https://fceux.com/) - For FM2 files
   - [VBA-RR](https://code.google.com/archive/p/vba-rerecording/) - For VBM files

### Required ROMs

The TAS files require matching ROMs to play back correctly. You must legally own the games to obtain these ROMs. Common games used in testing:

| Game | System | Format |
|------|--------|--------|
| Chrono Trigger | SNES | SMV, LSMV, BK2 |
| EarthBound | SNES | BK2, LSMV |
| Donkey Kong Country | SNES | BK2 |
| Secret of Mana | SNES | SMV, BK2 |
| Dragon Warrior III | NES | FM2 |
| Darkwing Duck | NES | FM2 |
| Zelda: Link's Awakening | GB | VBM |
| Mega Man Zero | GBA | VBM |

---

## Getting Test Files

### Method 1: Python Script (Recommended)

```bash
# From the repository root
python tools/tas/download_tas_files.py

# Options:
python tools/tas/download_tas_files.py --dry-run     # Preview what will be downloaded
python tools/tas/download_tas_files.py --format smv  # Download only SMV files
python tools/tas/download_tas_files.py --game chrono # Download only Chrono Trigger files
```

### Method 2: CLI Tool

```bash
# Build and run the CLI
dotnet run --project src/GameInfoTools.TasConvert.Cli -- download

# Options:
dotnet run --project src/GameInfoTools.TasConvert.Cli -- download --dry-run
dotnet run --project src/GameInfoTools.TasConvert.Cli -- download --format smv
```

### Method 3: Manual Download

1. Visit [TASVideos.org](https://tasvideos.org/)
2. Find a published movie
3. Download the movie file
4. Place in `~tas-files/uncompressed/`

---

## GUI Testing

### Starting the GUI

```bash
dotnet run --project src/GameInfoTools.TasConvert.WinForms
```

### Test Cases

#### TC-GUI-001: Basic File Loading

1. **Open** the TAS Converter GUI
2. **Click** "Browse" next to Input File
3. **Navigate** to `~tas-files/uncompressed/`
4. **Select** a test file (e.g., `bubsy2-acmlm.smv`)
5. **Verify**:
   - [ ] File info panel shows format, system, frame count
   - [ ] Frame count matches expected value
   - [ ] Controller count is displayed
   - [ ] No error messages appear

#### TC-GUI-002: Format Conversion

1. **Load** a test file
2. **Select** output format from dropdown
3. **Click** "Convert"
4. **Verify**:
   - [ ] Progress bar shows conversion progress
   - [ ] Success message appears
   - [ ] Output file is created
   - [ ] Output file can be loaded back

#### TC-GUI-003: Drag and Drop

1. **Open** the TAS Converter GUI
2. **Drag** a TAS file from File Explorer
3. **Drop** onto the input file area
4. **Verify**:
   - [ ] File is loaded correctly
   - [ ] All file info displays

#### TC-GUI-004: Error Handling

1. **Try** to load a non-TAS file (e.g., `.txt` file)
2. **Verify**:
   - [ ] Appropriate error message shown
   - [ ] Application doesn't crash
   - [ ] GUI remains responsive

#### TC-GUI-005: Multiple Conversions

1. **Load** and **convert** 5 different files sequentially
2. **Verify**:
   - [ ] Each conversion completes successfully
   - [ ] Memory usage remains stable
   - [ ] No accumulated errors

---

## CLI Testing

### Basic Commands

```bash
# Build the CLI
dotnet build src/GameInfoTools.TasConvert.Cli

# Test help output
dotnet run --project src/GameInfoTools.TasConvert.Cli -- --help
dotnet run --project src/GameInfoTools.TasConvert.Cli -- convert --help
dotnet run --project src/GameInfoTools.TasConvert.Cli -- info --help
dotnet run --project src/GameInfoTools.TasConvert.Cli -- batch --help
dotnet run --project src/GameInfoTools.TasConvert.Cli -- download --help
```

### Test Cases

#### TC-CLI-001: Convert Command

```bash
# Convert SMV to BK2
dotnet run --project src/GameInfoTools.TasConvert.Cli -- convert \
  "~tas-files/uncompressed/bubsy2-acmlm.smv" \
  "test-output.bk2" \
  --format bk2
```

**Verify**:
- [ ] Output file created
- [ ] Exit code is 0
- [ ] Frame count shown in output

#### TC-CLI-002: Info Command

```bash
dotnet run --project src/GameInfoTools.TasConvert.Cli -- info \
  "~tas-files/uncompressed/bubsy2-acmlm.smv"
```

**Verify**:
- [ ] Format correctly identified
- [ ] System correctly identified
- [ ] Frame count shown
- [ ] Controller info shown

#### TC-CLI-003: Batch Convert

```bash
dotnet run --project src/GameInfoTools.TasConvert.Cli -- batch \
  "~tas-files/uncompressed" \
  "test-batch-output" \
  --format bk2 \
  --pattern "*.smv"
```

**Verify**:
- [ ] All SMV files converted
- [ ] Summary shows converted/skipped/failed counts
- [ ] Each output file is valid

#### TC-CLI-004: Validate Command

```bash
dotnet run --project src/GameInfoTools.TasConvert.Cli -- validate \
  "~tas-files/uncompressed/bubsy2-acmlm.smv"
```

**Verify**:
- [ ] Validation passes for known-good files
- [ ] Validation fails for corrupted files

---

## Emulator Verification

The ultimate test is playing back converted files in the target emulator.

### Test Matrix

| Source Format | Target Format | Emulator | Test File |
|--------------|---------------|----------|-----------|
| SMV | BK2 | BizHawk | bubsy2-acmlm.smv |
| BK2 | SMV | Snes9x | tompa-donkeykongcountry-101p.bk2 |
| LSMV | BK2 | BizHawk | xy2_-earthbound.lsmv |
| FM2 | BK2 | BizHawk | feos-darkwingduck-pacifist.fm2 |
| VBM | BK2 | BizHawk | mugg-bubbleghost.vbm |

### Verification Steps

1. **Convert** the source file to target format
2. **Open** the target emulator
3. **Load** the converted movie file
4. **Start** playback from the beginning
5. **Verify**:
   - [ ] Playback starts correctly
   - [ ] Input desync does not occur (game follows expected path)
   - [ ] Movie reaches end successfully
   - [ ] Final frame count matches original

### Expected Desyncs

Some conversions may desync due to:

- **Different emulator timing** - Frame rates may differ slightly
- **SRAM handling** - Save data initialization differs
- **Reset vs Power-on** - Different starting states
- **Controller configuration** - Multitap vs standard controllers

Document any desyncs found and their causes.

---

## Visual Verification Checklist

### GUI Appearance

- [ ] Window renders correctly at default size
- [ ] Window is resizable
- [ ] All text is readable
- [ ] Icons and images display correctly
- [ ] Dark/Light mode respects system theme (if applicable)

### Performance

- [ ] Large files (500k+ frames) load within 30 seconds
- [ ] Conversion progress updates smoothly
- [ ] UI remains responsive during conversion
- [ ] Memory usage is reasonable (<500MB for typical files)

### Accessibility

- [ ] Tab order is logical
- [ ] All controls accessible via keyboard
- [ ] High contrast mode works
- [ ] Screen reader compatibility (if applicable)

---

## Reporting Issues

When reporting issues found during manual testing:

1. **Title**: Clear description of the issue
2. **Steps to Reproduce**: Exact steps taken
3. **Expected Result**: What should happen
4. **Actual Result**: What actually happened
5. **Test File**: Which TAS file was used
6. **Screenshots/Logs**: Attach any relevant artifacts
7. **Environment**: OS, .NET version, emulator version

Create issues at: [GitHub Issues](https://github.com/TheAnsarya/GameInfo/issues)

---

## Test Coverage Notes

### Automated vs Manual

| Area | Automated | Manual |
|------|-----------|--------|
| Format parsing | ✅ Unit tests | Verify large files |
| Roundtrip conversion | ✅ Integration tests | Verify in emulators |
| CLI commands | ✅ Basic tests | Edge cases, error paths |
| GUI functionality | ❌ Limited | Full visual testing |
| Emulator playback | ❌ Not possible | Required for validation |

### Formats Needing Manual Testing

Current priority for manual verification:

1. **SMV ↔ BK2** - Most common conversion
2. **LSMV ↔ BK2** - lsnes to BizHawk
3. **FM2 ↔ BK2** - NES cross-emulator
4. **VBM ↔ BK2** - Game Boy cross-emulator

### Future Formats (Not Yet Implemented)

These formats are planned but not yet available:

- **DTM** - Dolphin movie format (GameCube/Wii)
- **BSV** - RetroArch movie format
- **MCM** - Mednafen movie format

---

## Appendix: Test File Reference

See `~tas-files/tas-info.json` for the complete list of test files with their expected properties (frame counts, systems, authors).
