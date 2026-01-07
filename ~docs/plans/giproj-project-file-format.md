# GameInfo Project File System (.giproj)

## Overview

The `.giproj` file format is a self-contained project archive that enables complete ROM hacking workflows:
- **Create** → Extract assets from a reference ROM
- **Edit** → Modify assets using Universal Editor
- **Build** → Reassemble into a working ROM
- **Share** → Distribute project without sharing copyrighted ROMs

## Project File Structure

A `.giproj` file is a **ZIP archive** with the following structure:

```
MyProject.giproj (ZIP)
├── project.json              ← Project metadata and configuration
├── manifest.json             ← File inventory with checksums
├── assets/
│   ├── graphics/
│   │   ├── chr/             ← CHR tile data (.png, .chr)
│   │   ├── sprites/         ← Sprite sheets
│   │   └── palettes/        ← Color palettes (.pal, .json)
│   ├── text/
│   │   ├── dialog/          ← Dialog scripts (.json, .txt)
│   │   ├── menus/           ← Menu text
│   │   └── tables/          ← Text encoding tables (.tbl)
│   ├── data/
│   │   ├── monsters.json    ← Monster stats
│   │   ├── items.json       ← Item data
│   │   ├── spells.json      ← Spell data
│   │   ├── shops.json       ← Shop inventories
│   │   ├── maps/            ← Map data
│   │   └── formulas/        ← Game formula parameters
│   └── audio/
│       ├── music/           ← Music sequences
│       └── sfx/             ← Sound effects
├── source/
│   ├── asm/                 ← Assembly source files
│   │   ├── main.asm
│   │   ├── bank00.asm
│   │   └── ...
│   ├── inc/                 ← Include files
│   │   ├── constants.inc
│   │   ├── macros.inc
│   │   └── ram.inc
│   └── generated/           ← Auto-generated from assets
│       ├── MonsterTables.asm
│       ├── ItemTables.asm
│       └── ...
├── symbols/
│   ├── labels.sym           ← Address labels
│   ├── comments.json        ← Code comments
│   └── xrefs.json           ← Cross-references
├── analysis/
│   ├── cdl/                 ← Code/Data Log files
│   ├── traces/              ← Execution traces
│   └── notes.md             ← Research notes
├── patches/
│   ├── base.ips             ← Base patch from reference
│   └── custom/              ← User patches
└── build/
    ├── build.json           ← Build configuration
    ├── checksums.json       ← Expected output checksums
    └── logs/                ← Build logs
```

## project.json Schema

```json
{
  "$schema": "https://gameinfo.dev/schemas/giproj/1.0.json",
  "version": "1.0",
  "name": "My Dragon Warrior Hack",
  "description": "A complete overhaul of Dragon Warrior",
  "author": "RomHacker",
  "created": "2026-01-07T18:00:00Z",
  "modified": "2026-01-07T18:00:00Z",
  
  "game": {
    "id": "dragon-warrior-nes",
    "title": "Dragon Warrior",
    "platform": "NES",
    "region": "US",
    "version": "PRG1"
  },
  
  "reference": {
    "filename": "Dragon Warrior (U) (PRG1).nes",
    "size": 81936,
    "crc32": "4F7F6F2E",
    "md5": "a0a5f8c7bbc11b3e36edcaa8e8b36e59",
    "sha1": "e1c6b1d8f8e9f0a1b2c3d4e5f6a7b8c9d0e1f2a3",
    "headerFormat": "iNES",
    "mapper": 1,
    "prgSize": 65536,
    "chrSize": 16384
  },
  
  "extraction": {
    "timestamp": "2026-01-07T18:00:00Z",
    "toolVersion": "1.0.0",
    "assetTypes": [
      "graphics", "text", "monsters", "items", 
      "spells", "shops", "maps", "music"
    ]
  },
  
  "build": {
    "assembler": "ca65",
    "linker": "ld65",
    "scripts": ["build.ps1", "build.sh"],
    "outputFormat": "iNES",
    "expectedCrc32": "4F7F6F2E"
  },
  
  "editors": {
    "lastOpened": "2026-01-07T18:00:00Z",
    "windowState": {},
    "recentFiles": []
  }
}
```

## Create New Project Workflow

### Step 1: Game Selection

User selects from supported games:

| Game | Platform | Library | Status |
|------|----------|---------|--------|
| Dragon Warrior | NES | DW1Lib | ✅ Supported |
| Dragon Warrior IV | NES | DW4Lib | ✅ Supported |
| Dragon Quest III | SNES | DQ3Lib | 🔄 In Progress |
| Final Fantasy Mystic Quest | SNES | FFMQLib | ✅ Supported |

### Step 2: ROM Selection & Verification

```
1. User selects ROM file
2. System reads header and calculates checksums
3. Verify against known good ROM database:
   - CRC32 match → Exact known version
   - Header match → Compatible version (warn)
   - No match → Unknown ROM (advanced users only)
4. Display ROM info for confirmation
```

### Step 3: Asset Extraction

```
For each asset type in game definition:
  1. Read ROM data at defined offset
  2. Decompress if needed
  3. Parse into structured format
  4. Export to appropriate file format:
     - Graphics → PNG + metadata
     - Text → JSON with encoding info
     - Data tables → JSON
     - Music → JSON/MIDI
  5. Generate assembly include files
```

### Step 4: Source Collection

```
1. If disassembly exists (e.g., from GitHub):
   - Clone/copy assembly source files
   - Import labels and symbols
   - Link source to ROM offsets

2. If no disassembly:
   - Auto-generate minimal disassembly
   - Create placeholder labels
   - Mark code/data regions from CDL if available
```

### Step 5: Project Creation

```
1. Create project.json with metadata
2. Generate manifest.json with file inventory
3. Package into .giproj ZIP archive
4. Verify: Build project → Compare to reference ROM
5. If match: Project ready for editing
6. If mismatch: Report discrepancies for review
```

## Build Workflow

### Build Process

```
1. Load project.json
2. Generate assembly from JSON assets:
   - monsters.json → MonsterTables.asm
   - items.json → ItemTables.asm
   - etc.
3. Assemble all source files
4. Link into ROM image
5. Apply any IPS patches
6. Verify checksums
7. Output final ROM
```

### Build Configuration (build.json)

```json
{
  "profiles": {
    "default": {
      "assembler": "ca65",
      "linkerConfig": "nes.cfg",
      "defines": {},
      "outputName": "output.nes"
    },
    "debug": {
      "assembler": "ca65",
      "defines": { "DEBUG": 1 },
      "outputName": "output-debug.nes"
    }
  },
  "activeProfile": "default",
  "preBuild": ["scripts/generate_assets.py"],
  "postBuild": ["scripts/verify_rom.py"]
}
```

## Editor Integration

### Universal Editor Features

1. **Project Explorer** - Tree view of project contents
2. **Asset Editors** - Specialized editors for each asset type
3. **Source Editor** - Assembly syntax highlighting
4. **Build Panel** - One-click build with error reporting
5. **Diff View** - Compare changes against reference

### Workflow

```
Open Project → Edit Assets → Build → Test → Iterate
     ↑                                         |
     └─────────────────────────────────────────┘
```

## File Format Details

### Compression

- ZIP compression (DEFLATE)
- Large binary assets may use additional compression
- Graphics stored as PNG (lossless)

### Versioning

- `project.json` contains format version
- Backward compatibility maintained
- Migration scripts for old formats

### Checksums

Every file in manifest.json includes:
```json
{
  "path": "assets/data/monsters.json",
  "size": 4521,
  "crc32": "A1B2C3D4",
  "modified": "2026-01-07T18:00:00Z"
}
```

## Supported Games (Initial)

### Tier 1 - Full Support
- Dragon Warrior (NES) - Complete extraction/build
- Dragon Warrior IV (NES) - Complete extraction/build
- Final Fantasy Mystic Quest (SNES) - Complete extraction/build

### Tier 2 - Partial Support
- Dragon Quest III (SNES) - Assets only, no build
- Dragon Quest IV (DS) - Research/documentation

### Tier 3 - Planned
- Dragon Warrior II (NES)
- Dragon Warrior III (NES)
- Other NES/SNES RPGs

## API Design

### IProjectService Interface

```csharp
public interface IProjectService
{
    // Project lifecycle
    Task<Project> CreateProjectAsync(GameDefinition game, string romPath);
    Task<Project> OpenProjectAsync(string projectPath);
    Task SaveProjectAsync(Project project, string? path = null);
    Task CloseProjectAsync(Project project);
    
    // Asset operations
    Task ExtractAssetsAsync(Project project, IProgress<ExtractProgress>? progress);
    Task<byte[]> BuildRomAsync(Project project, string profile = "default");
    Task<bool> VerifyBuildAsync(Project project, byte[] romData);
    
    // Import/Export
    Task ExportAssetsAsync(Project project, string outputPath);
    Task ImportAssetsAsync(Project project, string inputPath);
}
```

### Project Class

```csharp
public class Project
{
    public string Name { get; set; }
    public string Path { get; set; }
    public GameDefinition Game { get; set; }
    public RomReference Reference { get; set; }
    public ProjectManifest Manifest { get; set; }
    
    public bool IsModified { get; }
    public bool CanBuild { get; }
    
    // Asset access
    public T GetAsset<T>(string path) where T : IAsset;
    public void SetAsset<T>(string path, T asset) where T : IAsset;
    
    // Events
    public event EventHandler<AssetChangedEventArgs>? AssetChanged;
    public event EventHandler? ProjectModified;
}
```

## Security Considerations

1. **No ROM Distribution** - Projects don't contain copyrighted ROM data
2. **Patch-Based** - Changes stored as differences from reference
3. **Verification** - Build output compared to expected checksums
4. **Sandboxing** - Build scripts run in isolated environment

## Implementation Phases

### Phase 1: Core Infrastructure
- [ ] Project file format specification
- [ ] IProjectService interface
- [ ] Basic create/open/save operations
- [ ] ZIP archive handling

### Phase 2: Asset Extraction
- [ ] Integrate existing extractors
- [ ] Standardize asset formats
- [ ] Generate assembly from assets

### Phase 3: Build System
- [ ] Assembler integration (ca65, Ophis)
- [ ] Build profiles
- [ ] Verification system

### Phase 4: Editor Integration
- [ ] Project Explorer view
- [ ] Build panel
- [ ] Change tracking

### Phase 5: Advanced Features
- [ ] Version control integration
- [ ] Collaborative editing
- [ ] Plugin system for new games

## References

- [Tiled Map Editor Project Format](https://doc.mapeditor.org/en/stable/reference/tmx-map-format/)
- [Unity Package Format](https://docs.unity3d.com/Manual/AssetPackages.html)
- [VS Code Workspace Files](https://code.visualstudio.com/docs/editor/workspaces)
