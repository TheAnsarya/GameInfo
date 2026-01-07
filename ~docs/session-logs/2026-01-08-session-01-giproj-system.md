# Session Log: .giproj Project File System Design

**Date:** 2026-01-08
**Session:** 01
**Focus:** Designing the .giproj project file system for GameInfo Universal Editor

## Summary

Designed and documented the `.giproj` project file format - a comprehensive ZIP-based archive format for managing ROM hacking projects with full asset extraction, editing, and build-back capabilities.

## Completed Work

### 1. Project File Format Specification

Created comprehensive design document: [giproj-project-file-format.md](../plans/giproj-project-file-format.md)

Key features:
- **ZIP archive format** containing all project assets and metadata
- **project.json** - Core project metadata including game info, ROM checksums, build configuration
- **manifest.json** - Asset inventory with checksums for integrity verification
- **Asset folders** - graphics/, text/, data/, maps/, audio/
- **Source files** - Assembly source and includes
- **Symbols** - Labels and address mappings
- **Patches** - BPS/IPS patches for modifications
- **Build profiles** - Multiple build configurations

### 2. Create New Project Workflow

Designed 5-step wizard:
1. **Select Game** - Choose from supported games list
2. **Select ROM** - Pick ROM file, validate format
3. **Verify ROM** - Checksum verification against known good dumps
4. **Configure** - Select assets to extract, project location
5. **Extract & Create** - Extract all assets, generate .giproj file

### 3. Build Workflow

- Build ROM from extracted source using assembler (ca65, Ophis, bass, asar)
- Verify built ROM matches original byte-for-byte
- Support multiple build profiles (default, debug, hack)

### 4. Service Interface Design

```csharp
public interface IProjectService
{
    Task<Project> CreateProjectAsync(GameDefinition game, string romPath);
    Task<Project> OpenProjectAsync(string projectPath);
    Task SaveProjectAsync(Project project, string? path = null);
    Task ExtractAssetsAsync(Project project, IProgress<ExtractProgress>? progress);
    Task<byte[]> BuildRomAsync(Project project, string profile = "default");
    Task<bool> VerifyBuildAsync(Project project, byte[] romData);
}

public interface IAssetExtractor
{
    string GameId { get; }
    Task<bool> CanExtractAsync(byte[] romData);
    Task<AssetCollection> ExtractAsync(byte[] romData, IProgress<ExtractProgress>? progress);
    Task<byte[]> PackAsync(AssetCollection assets, IProgress<PackProgress>? progress);
}

public interface IAssembler
{
    string Name { get; }
    Task<bool> IsAvailableAsync();
    Task<BuildResult> BuildAsync(BuildContext context);
}
```

### 5. GitHub Issues Created

| Issue | Title |
|-------|-------|
| #191 | [EPIC] Implement .giproj Project File System |
| #192 | Define project.json and manifest.json schemas |
| #193 | Implement IProjectService interface |
| #194 | Asset extraction pipeline integration |
| #195 | Build system integration (ca65, Ophis) |
| #196 | Create New Project wizard UI |
| #197 | Project Explorer and Build Panel UI |

### 6. Architecture Documentation Update

Updated [universal-editor-architecture.md](../plans/universal-editor-architecture.md) with:
- Project lifecycle diagram
- .giproj file structure overview
- Key services table
- Security model notes

## Implementation Phases

### Phase 1: Core Infrastructure
- Project class and data models
- IProjectService interface and implementation
- ZIP archive handling

### Phase 2: Asset Extraction
- IAssetExtractor interface
- Game-specific extractors (DW4Lib, FFMQLib, etc.)
- Asset format converters (binary ↔ JSON/PNG)

### Phase 3: Build System
- IAssembler interface
- ca65/Ophis integration
- Build verification

### Phase 4: Editor Integration
- Project Explorer view
- Build Panel
- Create New Project wizard

### Phase 5: Advanced Features
- Patch generation
- Version control integration
- Collaborative editing

## Security Considerations

- **No ROM distribution** - Projects store only extracted assets
- **Checksum verification** - Original ROM verified, not stored
- **Patch-based distribution** - Share patches, not ROMs

## Files Created/Modified

### Created
- `~docs/plans/giproj-project-file-format.md` - Full specification

### Modified
- `~docs/plans/universal-editor-architecture.md` - Added project system section

## Git Status

Commits made:
- (pending) feat: Add .giproj project file system design

## What's Next

1. **Implement IProjectService** - Core project management
2. **Create Project class** - In-memory project representation
3. **Add DW4 asset extractor** - First game implementation
4. **Build wizard UI** - Create New Project flow
5. **Test round-trip** - Extract → Edit → Build → Verify

## Related Issues

- #191 - Epic tracking all project system work
- #192-197 - Individual implementation tasks

## Notes

The .giproj format is designed to be:
- **Self-contained** - All project data in one file
- **Portable** - Works across Windows/Mac/Linux
- **Verifiable** - Checksums ensure data integrity
- **Legal** - No copyrighted ROM data distributed
