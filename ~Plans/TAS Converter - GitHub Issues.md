# TAS Replay Converter - GitHub Issues

This document contains the GitHub issues to be created for the TAS Converter project.

## Epic Issue

### Epic: TAS Replay File Format Converter (#XXX)

**Title:** Epic: TAS Replay File Format Converter - Multi-Emulator Support

**Labels:** `epic`, `enhancement`, `tools`

**Body:**
```markdown
## Overview

Build a comprehensive TAS (Tool-Assisted Speedrun) replay file converter that supports all major emulator formats for SNES, NES, Game Boy, and other retro gaming systems.

## Deliverables

- [ ] **TasConvertLib** - C# library for reading/writing TAS formats
- [ ] **TasConvertCli** - Command-line interface tool
- [ ] **TasConvertUi** - Avalonia cross-platform GUI
- [ ] **Universal Editor Integration** - Plugin for GameInfo Universal Editor

## Supported Systems & Formats

### SNES
- SMV (Snes9x)
- LSMV (lsnes/bsnes)
- BK2 (BizHawk)
- MSM (Mesen-S)

### NES
- FM2/FM3 (FCEUX)
- BK2 (BizHawk)
- MMO (Mesen)

### Game Boy/GBC/GBA
- VBM (VBA-RR)
- BK2 (BizHawk)

### Other Systems
- GMV (Genesis)
- M64 (N64)
- DTM (GameCube/Wii)

## Technical Goals

1. Lossless conversion where possible
2. Preserve metadata (authors, comments, ROM info)
3. Cross-platform support (.NET 10)
4. High performance (stream processing)
5. Comprehensive test coverage

## Sub-Issues

- [ ] #XXX Core Library - Format Interfaces and Models
- [ ] #XXX SNES Format Support (SMV, LSMV, BK2)
- [ ] #XXX NES Format Support (FM2, BK2)
- [ ] #XXX Game Boy Format Support (VBM, BK2)
- [ ] #XXX CLI Tool Implementation
- [ ] #XXX Avalonia UI Implementation
- [ ] #XXX Universal Editor Integration
- [ ] #XXX Additional Formats (Genesis, N64, etc.)
- [ ] #XXX Documentation and Testing

## References

- [Project Roadmap](~Plans/TAS%20Converter%20-%20Project%20Roadmap.md)
- [TASVideos Format Documentation](https://tasvideos.org/EmulatorResources)
```

---

## Sub-Issues

### Issue 1: Core Library - Format Interfaces and Models

**Title:** TAS Converter: Core Library - Format Interfaces and Models

**Labels:** `enhancement`, `library`, `tas-converter`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Create the core library infrastructure including interfaces, data models, and format registry system.

## Tasks

- [ ] Create `TasConvertLib` project
- [ ] Define `ITasMovie` interface
- [ ] Define `ITasFormat` interface for format handlers
- [ ] Create `TasFrame` record for universal input representation
- [ ] Create `TasMetadata` record for movie metadata
- [ ] Create `TasConverter` main conversion engine
- [ ] Create `TasFormatRegistry` for format registration
- [ ] Define button enums for each system (SNES, NES, GB)
- [ ] Create input mapping utilities
- [ ] Add binary reader/writer utilities
- [ ] Add ZIP archive handler for BK2/LSMV formats

## Acceptance Criteria

- [ ] All interfaces documented with XML comments
- [ ] Unit tests for data models
- [ ] Format registry supports dynamic registration
- [ ] Round-trip serialization tests pass

## Files to Create

```
src/TasConvertLib/
├── TasConvertLib.csproj
├── Core/
│   ├── ITasMovie.cs
│   ├── ITasFormat.cs
│   ├── TasFrame.cs
│   ├── TasMetadata.cs
│   ├── TasConverter.cs
│   └── TasFormatRegistry.cs
├── Models/
│   ├── ControllerInput.cs
│   ├── ControllerType.cs
│   ├── SnesButtons.cs
│   ├── NesButtons.cs
│   └── GbButtons.cs
└── IO/
    ├── BinaryReaderExtensions.cs
    └── ZipArchiveHandler.cs
```
```

---

### Issue 2: SNES Format Support

**Title:** TAS Converter: SNES Format Support (SMV, LSMV, BK2)

**Labels:** `enhancement`, `library`, `tas-converter`, `snes`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Implement read/write support for SNES TAS movie formats.

## Formats

### SMV (Snes9x)
- Binary format with 32/64 byte header
- Signature: `SMV\x1A`
- Versions: 1.43 (v1), 1.51 (v4), 1.52 (v5)
- 2 bytes per controller per frame

### LSMV (lsnes/bsnes)
- ZIP archive format
- Text-based input in `input` file
- Format: `F.|BYsSudlrAXLR`

### BK2 (BizHawk SNES)
- ZIP archive format
- Text-based input log
- System-specific mnemonics

## Tasks

- [ ] Implement `SmvFormat` class
  - [ ] Header parsing (v1.43, v1.51, v1.52)
  - [ ] Input data parsing
  - [ ] Metadata extraction
  - [ ] Write support
- [ ] Implement `LsmvFormat` class
  - [ ] ZIP structure handling
  - [ ] Text input parsing
  - [ ] Multiple file handling
  - [ ] Write support
- [ ] Implement `Bk2SnesFormat` class
  - [ ] Header parsing
  - [ ] Input log parsing
  - [ ] SyncSettings handling
  - [ ] Write support
- [ ] Create `SnesInputMapper` for button translation
- [ ] Add conversion tests between formats

## Acceptance Criteria

- [ ] Parse official TASVideos SMV files correctly
- [ ] Round-trip conversion maintains frame accuracy
- [ ] All metadata preserved where formats support it
- [ ] Integration tests with real TAS files

## References
- https://tasvideos.org/EmulatorResources/Snes9x/SMV
- https://tasvideos.org/EmulatorResources/Lsnes/Lsmv
```

---

### Issue 3: NES Format Support

**Title:** TAS Converter: NES Format Support (FM2, BK2)

**Labels:** `enhancement`, `library`, `tas-converter`, `nes`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Implement read/write support for NES TAS movie formats.

## Formats

### FM2 (FCEUX)
- Text-based format
- Key-value header
- Input: `|commands|port0|port1|port2|`
- Button mnemonics: `RLDUTSBA`

### FM3 (FCEUX Binary)
- Binary variant of FM2
- Same structure, compact representation

### BK2 (BizHawk NES)
- ZIP archive format
- NES-specific input mnemonics

## Tasks

- [ ] Implement `Fm2Format` class
  - [ ] Header key-value parsing
  - [ ] Input line parsing
  - [ ] Command handling (reset, FDS)
  - [ ] Fourscore support
  - [ ] Zapper support
  - [ ] Write support
- [ ] Implement `Fm3Format` class (binary variant)
- [ ] Implement `Bk2NesFormat` class
- [ ] Create `NesInputMapper` for button translation
- [ ] Add conversion tests

## Acceptance Criteria

- [ ] Parse official FCEUX FM2 files correctly
- [ ] Handle all command types (soft/hard reset)
- [ ] Support peripheral devices (Zapper)
- [ ] Round-trip conversion accurate

## References
- https://fceux.com/web/help/fm2.html
```

---

### Issue 4: Game Boy Format Support

**Title:** TAS Converter: Game Boy Format Support (VBM, BK2)

**Labels:** `enhancement`, `library`, `tas-converter`, `gameboy`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Implement read/write support for Game Boy/GBC/GBA TAS movie formats.

## Formats

### VBM (VBA-RR)
- Binary format with 64-byte header
- 192-byte info section (author, description)
- Signature: `VBM\x1A`
- Supports: GB, GBC, GBA, SGB
- 2 bytes per controller per frame

### BK2 (BizHawk GB/GBC/GBA)
- ZIP archive format
- System-specific input mnemonics

## Tasks

- [ ] Implement `VbmFormat` class
  - [ ] Header parsing
  - [ ] Info section parsing
  - [ ] System type detection (GB/GBC/GBA/SGB)
  - [ ] Input parsing
  - [ ] Write support
- [ ] Implement `Bk2GbFormat` class
- [ ] Implement `Bk2GbaFormat` class
- [ ] Create `GbInputMapper` for button translation
- [ ] Create `GbaInputMapper` for GBA buttons
- [ ] Add conversion tests

## Acceptance Criteria

- [ ] Parse official VBA VBM files correctly
- [ ] Detect system type (GB/GBC/GBA) automatically
- [ ] Handle SGB multiplayer
- [ ] Handle GBA-specific options (BIOS, RTC)

## References
- https://tasvideos.org/EmulatorResources/VBA/VBM
```

---

### Issue 5: CLI Tool Implementation

**Title:** TAS Converter: CLI Tool Implementation

**Labels:** `enhancement`, `tools`, `tas-converter`, `cli`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Create a command-line interface for TAS file conversion.

## Commands

### convert
```bash
tasconvert convert <input> [options]
  -o, --output <file>       Output file path
  -f, --format <format>     Output format (smv, lsmv, bk2, fm2, etc.)
  -d, --output-dir <dir>    Output directory for batch conversion
  --force                   Overwrite existing files
```

### info
```bash
tasconvert info <file>
  --json                    Output as JSON
  --detailed                Show all metadata
```

### validate
```bash
tasconvert validate <file>
  --strict                  Fail on warnings
```

### list-formats
```bash
tasconvert list-formats
  --system <system>         Filter by system (snes, nes, gb)
```

### extract
```bash
tasconvert extract <file> [options]
  -o, --output <file>       Output text file
  --start <frame>           Starting frame
  --end <frame>             Ending frame
```

## Tasks

- [ ] Create `TasConvertCli` project
- [ ] Set up System.CommandLine
- [ ] Implement `ConvertCommand`
- [ ] Implement `InfoCommand`
- [ ] Implement `ValidateCommand`
- [ ] Implement `ListFormatsCommand`
- [ ] Implement `ExtractCommand`
- [ ] Add progress reporting for large files
- [ ] Add batch conversion support
- [ ] Add colored output
- [ ] Create installation scripts

## Acceptance Criteria

- [ ] All commands documented with --help
- [ ] Exit codes follow conventions (0=success, 1=error)
- [ ] Progress bar for large conversions
- [ ] JSON output option for scripting
```

---

### Issue 6: Avalonia UI Implementation

**Title:** TAS Converter: Avalonia UI Implementation

**Labels:** `enhancement`, `tools`, `tas-converter`, `ui`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Create a cross-platform GUI application using Avalonia for TAS file conversion.

## Features

### Main Window
- File list with drag-and-drop support
- Format detection and display
- Conversion target selection
- Batch processing

### File Info Panel
- Metadata display (title, author, ROM)
- Frame count and duration
- System and region
- Rerecord count

### Input Preview
- Frame-by-frame input display
- Visual button representation
- Search/filter functionality
- Comparison view (two files)

### Settings
- Default output format
- Output directory preferences
- Metadata handling options

## Tasks

- [ ] Create `TasConvertUi` Avalonia project
- [ ] Design main window layout
- [ ] Implement file list view
- [ ] Implement drag-and-drop
- [ ] Implement format auto-detection
- [ ] Implement conversion workflow
- [ ] Implement info panel
- [ ] Implement input preview view
- [ ] Implement button visualization
- [ ] Implement settings dialog
- [ ] Add keyboard shortcuts
- [ ] Create application icons

## Mockup

```
┌─────────────────────────────────────────────────────────────┐
│ TAS Converter                                     [─][□][×] │
├─────────────────────────────────────────────────────────────┤
│ File │ Edit │ View │ Tools │ Help                           │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────────────────┐ ┌─────────────────────────────┐ │
│ │ Files                   │ │ Info                        │ │
│ │ ├ movie1.smv (SNES)     │ │ Title: Super Metroid TAS    │ │
│ │ ├ movie2.fm2 (NES)      │ │ Author: TASer1              │ │
│ │ └ movie3.lsmv (SNES)    │ │ Frames: 123456              │ │
│ │                         │ │ Duration: 34:12.45          │ │
│ │ [+ Add] [- Remove]      │ │ Rerecords: 98765            │ │
│ └─────────────────────────┘ └─────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Input Preview                                           │ │
│ │ Frame 1234: ....S...AXLR | [▶][◀][▲][▼][St][Sl][A][B]  │ │
│ │ Frame 1235: ....S...A.LR | [▶][◀][▲][▼][St][Sl][A][B]  │ │
│ │ Frame 1236: .......X..L. | [▶][◀][▲][▼][St][Sl][A][B]  │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Output Format: [BK2 ▼]  Output Dir: [Browse...]         │ │
│ │                                        [Convert All]    │ │
│ └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Acceptance Criteria

- [ ] Works on Windows, macOS, Linux
- [ ] Responsive UI during conversion
- [ ] Drag-and-drop file import
- [ ] Preview updates in real-time
- [ ] Keyboard navigation
```

---

### Issue 7: Universal Editor Integration

**Title:** TAS Converter: Universal Editor Integration

**Labels:** `enhancement`, `tools`, `tas-converter`, `editor`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Integrate TAS conversion capabilities into the GameInfo Universal Editor.

## Features

### TAS Tool Panel
- Open TAS files directly in editor
- View metadata in inspector
- Convert to other formats
- Edit basic metadata

### Input Viewer
- Frame-by-frame input display
- Visual timeline
- Search functionality

### Format Conversion
- Right-click conversion menu
- Batch conversion from file tree
- Format comparison view

## Tasks

- [ ] Create TAS tool plugin structure
- [ ] Add TAS file type detection
- [ ] Add metadata inspector
- [ ] Add input viewer component
- [ ] Add conversion toolbar
- [ ] Add format comparison view
- [ ] Add batch conversion from context menu
- [ ] Update Universal Editor documentation

## Acceptance Criteria

- [ ] TAS files open in editor
- [ ] Conversion available from context menu
- [ ] Input viewer shows frame data
- [ ] Integrates with existing editor UI
```

---

### Issue 8: Additional Formats

**Title:** TAS Converter: Additional System Formats (Genesis, N64, etc.)

**Labels:** `enhancement`, `library`, `tas-converter`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Add support for additional system formats beyond SNES/NES/GB.

## Formats to Add

### Genesis/Mega Drive
- GMV (Gens-rr)
- BK2 (BizHawk Genesis)

### Nintendo 64
- M64 (Mupen64)
- BK2 (BizHawk N64)

### PlayStation
- BK2 (BizHawk PSX)

### GameCube/Wii
- DTM (Dolphin)

### Saturn
- YMV (Yabause)

### MSX
- MCM (openMSX)

## Tasks

- [ ] Implement `GmvFormat` class
- [ ] Implement `M64Format` class
- [ ] Implement `DtmFormat` class
- [ ] Extend BK2 format for additional systems
- [ ] Create input mappers for each system
- [ ] Add conversion tests

## Priority
Lower priority - implement after core SNES/NES/GB support is stable.

## References
- https://tasvideos.org/EmulatorResources/Gens
- https://tasvideos.org/EmulatorResources/Mupen
- https://tasvideos.org/EmulatorResources/Dolphin
```

---

### Issue 9: Documentation and Testing

**Title:** TAS Converter: Documentation and Testing

**Labels:** `documentation`, `testing`, `tas-converter`

**Body:**
```markdown
## Parent Issue
Part of Epic: TAS Replay File Format Converter #XXX

## Description
Complete documentation and testing for the TAS Converter project.

## Documentation Tasks

- [ ] API documentation (XML comments)
- [ ] User guide (CLI and GUI)
- [ ] Format specification reference
- [ ] Conversion matrix documentation
- [ ] Sample code examples
- [ ] Troubleshooting guide

## Testing Tasks

- [ ] Unit tests for all format parsers
- [ ] Round-trip conversion tests
- [ ] Integration tests with real TAS files
- [ ] Performance benchmarks
- [ ] Edge case testing (corrupted files, empty files)
- [ ] Cross-platform testing

## Test Data

Collect sample TAS files from:
- TASVideos public archive
- Hand-crafted test cases
- Edge cases (empty, corrupted, maximum size)

## Acceptance Criteria

- [ ] > 90% code coverage
- [ ] All public APIs documented
- [ ] User guide covers all features
- [ ] Performance meets targets (1M frames < 5 seconds)
```

---

## Issue Creation Order

1. Create Epic issue first
2. Create sub-issues in order:
   - Core Library (#1)
   - SNES Formats (#2)
   - NES Formats (#3)
   - Game Boy Formats (#4)
   - CLI Tool (#5)
   - Avalonia UI (#6)
   - Universal Editor (#7)
   - Additional Formats (#8)
   - Documentation (#9)
3. Update Epic with sub-issue links
4. Add to Project Board
