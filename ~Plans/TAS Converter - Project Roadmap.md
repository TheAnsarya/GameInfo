# TAS Replay Converter - Project Roadmap

## Executive Summary

Build a comprehensive TAS (Tool-Assisted Speedrun) replay file converter that supports all major emulator formats for SNES, NES, Game Boy, and other retro gaming systems. The project will include a C# library, CLI tool, Avalonia UI application, and integration with the Universal Editor.

## Project Goals

1. **Universal TAS Format Support** - Read and write all major TAS movie file formats
2. **Lossless Conversion** - Convert between formats while preserving all input data
3. **Metadata Preservation** - Maintain author info, comments, ROM checksums where possible
4. **Cross-Platform** - Work on Windows, macOS, and Linux via .NET 10
5. **Multiple Interfaces** - Library, CLI, GUI, and Universal Editor integration

---

## Supported Formats

### SNES Formats

| Format | Extension | Emulator | Status |
|--------|-----------|----------|--------|
| SMV | `.smv` | Snes9x | Priority 1 |
| LSMV | `.lsmv` | lsnes/bsnes | Priority 1 |
| BK2 | `.bk2` | BizHawk | Priority 1 |
| MSM | `.msm` | Mesen-S | Priority 2 |
| BSV | `.bsv` | RetroArch | Priority 3 |

### NES Formats

| Format | Extension | Emulator | Status |
|--------|-----------|----------|--------|
| FM2 | `.fm2` | FCEUX | Priority 1 |
| FM3 | `.fm3` | FCEUX (binary) | Priority 2 |
| BK2 | `.bk2` | BizHawk | Priority 1 |
| MMO | `.mmo` | Mesen | Priority 2 |
| NES | `.nes` | Nestopia | Priority 3 |

### Game Boy/GBC/GBA Formats

| Format | Extension | Emulator | Status |
|--------|-----------|----------|--------|
| VBM | `.vbm` | VBA-RR | Priority 1 |
| BK2 | `.bk2` | BizHawk | Priority 1 |
| LTM | `.ltm` | libTAS | Priority 3 |

### Genesis/Mega Drive Formats

| Format | Extension | Emulator | Status |
|--------|-----------|----------|--------|
| GMV | `.gmv` | Gens-rr | Priority 2 |
| BK2 | `.bk2` | BizHawk | Priority 1 |

### Other Systems

| System | Format | Extension | Emulator |
|--------|--------|-----------|----------|
| PSX | BK2 | `.bk2` | BizHawk |
| N64 | M64 | `.m64` | Mupen64 |
| Saturn | YMV | `.ymv` | Yabause |
| GC/Wii | DTM | `.dtm` | Dolphin |

---

## Architecture Design

### Library Structure

```
TasConvertLib/
├── Core/
│   ├── ITasMovie.cs              # Core interface for all formats
│   ├── TasInput.cs               # Universal input representation
│   ├── TasMetadata.cs            # Universal metadata
│   ├── TasConverter.cs           # Main conversion engine
│   └── TasFormatRegistry.cs      # Format registration
├── Formats/
│   ├── Snes/
│   │   ├── SmvFormat.cs          # Snes9x SMV format
│   │   ├── LsmvFormat.cs         # lsnes LSMV format
│   │   └── SnesInputMapper.cs    # SNES button mapping
│   ├── Nes/
│   │   ├── Fm2Format.cs          # FCEUX FM2 format
│   │   └── NesInputMapper.cs     # NES button mapping
│   ├── GameBoy/
│   │   ├── VbmFormat.cs          # VBA VBM format
│   │   └── GbInputMapper.cs      # GB button mapping
│   └── Common/
│       └── Bk2Format.cs          # BizHawk BK2 (multi-system)
├── IO/
│   ├── BinaryReader.cs           # Binary format utilities
│   ├── ZipArchiveHandler.cs      # ZIP-based formats
│   └── TextFormatParser.cs       # Text-based formats
└── Validation/
    ├── InputValidator.cs
    └── MetadataValidator.cs
```

### CLI Tool Structure

```
TasConvertCli/
├── Program.cs
├── Commands/
│   ├── ConvertCommand.cs
│   ├── InfoCommand.cs
│   ├── ValidateCommand.cs
│   └── ListFormatsCommand.cs
└── Formatting/
    └── OutputFormatter.cs
```

### Avalonia UI Structure

```
TasConvertUi/
├── App.axaml
├── ViewModels/
│   ├── MainWindowViewModel.cs
│   ├── ConversionViewModel.cs
│   └── FormatInfoViewModel.cs
├── Views/
│   ├── MainWindow.axaml
│   ├── ConversionView.axaml
│   └── InputPreviewView.axaml
└── Services/
    └── ConversionService.cs
```

---

## Format Specifications Summary

### SMV (Snes9x) - Binary Format
- **Header**: 32 bytes (v1.43) or 64 bytes (v1.51+)
- **Signature**: `SMV\x1A` (53 4D 56 1A)
- **Input**: 2 bytes per controller per frame
- **Button mapping**: R,L,X,A,Right,Left,Down,Up,Start,Select,Y,B

### FM2 (FCEUX) - Text Format
- **Structure**: Key-value header + pipe-delimited input
- **Input per frame**: `|commands|port0|port1|port2|`
- **Button format**: `RLDUTSBA` (Right,Left,Down,Up,sTart,Select,B,A)
- **Commands**: bit 0=Soft Reset, bit 1=Hard Reset

### LSMV (lsnes) - ZIP Archive
- **Container**: ZIP with deflate compression
- **Key files**: `gametype`, `input`, `authors`, `systemid`
- **Input format**: `F.|BYsSudlrAXLR` per frame
- **Supports**: SNES, SGB, GB, GBC

### BK2 (BizHawk) - ZIP Archive
- **Container**: ZIP archive
- **Key files**: `Header.txt`, `Input Log.txt`, `SyncSettings.json`
- **Text-based input log** with mnemonics
- **Multi-system support**: NES, SNES, GB, Genesis, etc.

### VBM (VBA) - Binary Format
- **Header**: 64 bytes + 192 bytes info
- **Signature**: `VBM\x1A` (56 42 4D 1A)
- **Supports**: GB, GBC, GBA, SGB
- **Input**: 2 bytes per controller per frame

---

## Implementation Phases

### Phase 1: Core Library (Weeks 1-2)
- [ ] Define `ITasMovie` interface
- [ ] Implement `TasInput` universal input model
- [ ] Implement `TasMetadata` model
- [ ] Create format registry system
- [ ] Implement SMV reader/writer
- [ ] Implement FM2 reader/writer
- [ ] Add unit tests for core functionality

### Phase 2: Additional SNES/NES Formats (Weeks 3-4)
- [ ] Implement LSMV reader/writer
- [ ] Implement BK2 reader/writer (SNES/NES)
- [ ] Implement format conversion logic
- [ ] Add integration tests
- [ ] Add input validation

### Phase 3: CLI Tool (Week 5)
- [ ] Create CLI project with System.CommandLine
- [ ] Implement `convert` command
- [ ] Implement `info` command
- [ ] Implement `validate` command
- [ ] Implement `list-formats` command
- [ ] Add progress reporting
- [ ] Add batch conversion support

### Phase 4: Avalonia UI (Weeks 6-7)
- [ ] Create Avalonia project
- [ ] Design main window layout
- [ ] Implement file selection
- [ ] Implement format detection
- [ ] Implement conversion UI
- [ ] Add input preview/visualization
- [ ] Add drag-and-drop support
- [ ] Add settings/preferences

### Phase 5: Game Boy & Other Formats (Weeks 8-9)
- [ ] Implement VBM reader/writer
- [ ] Implement GMV reader/writer (Genesis)
- [ ] Implement M64 reader/writer (N64)
- [ ] Extend BK2 for additional systems
- [ ] Add MSM/MMO (Mesen) support

### Phase 6: Universal Editor Integration (Week 10)
- [ ] Create TAS tool plugin for Universal Editor
- [ ] Add format inspection
- [ ] Add input editing capabilities
- [ ] Add metadata editing
- [ ] Add conversion toolbar

### Phase 7: Polish & Documentation (Week 11-12)
- [ ] Complete API documentation
- [ ] Write user guide
- [ ] Create sample files
- [ ] Performance optimization
- [ ] Edge case handling
- [ ] Release preparation

---

## Data Models

### Universal Input Model

```csharp
public record TasFrame
{
    public int FrameNumber { get; init; }
    public bool IsLagFrame { get; init; }
    public IReadOnlyList<ControllerInput> Inputs { get; init; }
    public FrameCommands Commands { get; init; }
}

public record ControllerInput
{
    public int Port { get; init; }
    public ControllerType Type { get; init; }
    public ButtonState Buttons { get; init; }
    public AnalogInput? Analog { get; init; }
}

[Flags]
public enum SnesButtons : ushort
{
    None    = 0,
    B       = 0x0080,
    Y       = 0x0040,
    Select  = 0x0020,
    Start   = 0x0010,
    Up      = 0x0008,
    Down    = 0x0004,
    Left    = 0x0002,
    Right   = 0x0001,
    A       = 0x8000,
    X       = 0x4000,
    L       = 0x2000,
    R       = 0x1000
}

[Flags]
public enum NesButtons : byte
{
    None    = 0,
    A       = 0x01,
    B       = 0x02,
    Select  = 0x04,
    Start   = 0x08,
    Up      = 0x10,
    Down    = 0x20,
    Left    = 0x40,
    Right   = 0x80
}
```

### Universal Metadata Model

```csharp
public record TasMetadata
{
    public string? Title { get; init; }
    public IReadOnlyList<Author> Authors { get; init; }
    public string? Description { get; init; }
    public string? RomName { get; init; }
    public string? RomChecksum { get; init; }
    public int FrameCount { get; init; }
    public int RerecordCount { get; init; }
    public DateTime? RecordingDate { get; init; }
    public Region Region { get; init; }
    public string? EmulatorVersion { get; init; }
    public bool StartsFromSavestate { get; init; }
    public bool StartsFromSram { get; init; }
}
```

---

## Conversion Matrix

Shows which conversions are lossless vs lossy:

| From → To | SMV | FM2 | LSMV | BK2 | VBM |
|-----------|-----|-----|------|-----|-----|
| **SMV**   | -   | N/A | ✅   | ✅  | N/A |
| **FM2**   | N/A | -   | N/A  | ✅  | N/A |
| **LSMV**  | ✅  | N/A | -    | ✅  | N/A |
| **BK2**   | ✅  | ✅  | ✅   | -   | ✅  |
| **VBM**   | N/A | N/A | N/A  | ✅  | -   |

- ✅ = Lossless conversion possible
- ⚠️ = Lossy conversion (some metadata lost)
- N/A = Different systems, not applicable

---

## CLI Usage Examples

```bash
# Convert SMV to BK2
tasconvert convert movie.smv -o movie.bk2

# Convert with explicit format
tasconvert convert movie.smv --output movie.bk2 --format bk2

# Show file info
tasconvert info movie.smv

# Validate file
tasconvert validate movie.fm2

# List supported formats
tasconvert list-formats

# Batch convert
tasconvert convert *.smv --output-dir converted/ --format lsmv

# Extract input to text
tasconvert extract movie.smv --output inputs.txt
```

---

## Testing Strategy

### Unit Tests
- Format parsing accuracy
- Button mapping correctness
- Metadata extraction
- Round-trip conversion fidelity

### Integration Tests
- Real TAS file conversion
- Large file handling
- Cross-format verification

### Test Data
- Sample files from TASVideos
- Hand-crafted edge cases
- Corrupted file handling

---

## Dependencies

- **System.IO.Compression** - ZIP archive handling
- **System.CommandLine** - CLI argument parsing
- **Avalonia** - Cross-platform UI
- **xUnit** - Testing framework
- **FluentAssertions** - Test assertions

---

## Success Metrics

1. **Format Coverage**: Support 10+ TAS formats
2. **Accuracy**: 100% button fidelity in conversions
3. **Performance**: Convert 1 million frames in < 5 seconds
4. **Test Coverage**: > 90% code coverage
5. **Cross-Platform**: Works on Windows, macOS, Linux

---

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Undocumented format quirks | Use emulator source code as reference |
| Savestate compatibility | Focus on input conversion, document limitations |
| Performance with large files | Stream processing, memory-mapped files |
| Peripheral device support | Start with standard controllers, expand later |

---

## References

- [TASVideos Emulator Resources](https://tasvideos.org/EmulatorResources)
- [SMV Format Specification](https://tasvideos.org/EmulatorResources/Snes9x/SMV)
- [FM2 Format Specification](https://fceux.com/web/help/fm2.html)
- [LSMV Format Specification](https://tasvideos.org/EmulatorResources/Lsnes/Lsmv)
- [VBM Format Specification](https://tasvideos.org/EmulatorResources/VBA/VBM)
- [BizHawk Source Code](https://github.com/TASEmulators/BizHawk)

---

## Changelog

| Date | Version | Changes |
|------|---------|---------|
| 2025-12-29 | 0.1.0 | Initial roadmap created |
