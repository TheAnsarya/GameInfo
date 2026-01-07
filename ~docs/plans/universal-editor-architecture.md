# GameInfo Universal Editor Architecture

## Overview

GameInfo maintains **two separate UI frontends** that share common core libraries:

| Project | Technology | Target | Use Case |
|---------|------------|--------|----------|
| **GameInfoTools.UI** | Avalonia 11 | Desktop (Win/Mac/Linux) | Full-featured desktop editor with native performance |
| **DarkRepos.Editor** | Blazor WASM | Web Browser | Accessible web-based editor, Dark Repos wiki integration |

Both editors share the same core logic through **GameInfoTools.Core** and related libraries.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          USER INTERFACES                                     │
├─────────────────────────────────┬───────────────────────────────────────────┤
│     GameInfoTools.UI            │        DarkRepos.Editor.Web               │
│     (Avalonia Desktop)          │        (Blazor WebAssembly)               │
│                                 │                                           │
│  ┌─────────────────────────┐    │    ┌─────────────────────────┐            │
│  │ Views/*.axaml           │    │    │ Components/*.razor      │            │
│  │ ViewModels/*.cs         │    │    │ Pages/*.razor           │            │
│  │ Controls/*.axaml        │    │    │ Services/*.cs           │            │
│  └─────────────────────────┘    │    └─────────────────────────┘            │
│            │                    │              │                            │
│            │ MVVM               │              │ Dependency Injection       │
│            ▼                    │              ▼                            │
│  ┌─────────────────────────┐    │    ┌─────────────────────────┐            │
│  │ GameInfoTools.UI        │    │    │ DarkRepos.Editor.Core   │            │
│  │ Services/               │    │    │ Services/               │            │
│  └─────────────────────────┘    │    └─────────────────────────┘            │
└─────────────────────────────────┴───────────────────────────────────────────┘
                    │                              │
                    └──────────────┬───────────────┘
                                   │
                                   ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                        SHARED CORE LIBRARIES                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│  GameInfoTools.Core       │ ROM parsing, address conversion, checksums      │
│  GameInfoTools.Graphics   │ CHR/tile editing, palette management            │
│  GameInfoTools.Text       │ Text extraction, TBL handling                   │
│  GameInfoTools.Rom        │ ROM format detection, header parsing            │
│  GameInfoTools.Data       │ Data table extraction, JSON conversion          │
│  GameInfoTools.Disassembly│ 6502/65816 disassembly engine                   │
│  GameInfoTools.Analysis   │ CDL analysis, pattern detection                 │
│  GameInfoTools.Wiki       │ Wikitext generation for Dark Repos              │
└─────────────────────────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                         GAME-SPECIFIC LIBRARIES                              │
├─────────────────────────────────────────────────────────────────────────────┤
│  DW4Lib          │ Dragon Warrior IV NES data structures and parsing        │
│  DQ3Lib          │ Dragon Quest III SNES data structures                    │
│  DQ4rLib         │ Dragon Quest IV DS/Mobile remake structures              │
│  FFMQLib         │ Final Fantasy Mystic Quest structures                    │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Why Two UI Projects?

### Avalonia (Desktop) Advantages
- **Native performance** - Direct GPU rendering, no browser overhead
- **File system access** - Full read/write to local files without permission dialogs
- **Large file handling** - Can load multi-megabyte ROMs without browser memory limits
- **Offline use** - No server required, works completely offline
- **Professional workflow** - Keyboard shortcuts, multi-window, drag-drop from Explorer
- **Heavy computation** - Disassembly, pattern detection, large searches

### Blazor (Web) Advantages
- **Zero install** - Works in any browser instantly
- **Cross-device** - Same UI on phone, tablet, desktop
- **Always updated** - No version management, always latest
- **Collaboration** - Easy sharing via URL
- **Dark Repos integration** - Direct wiki editing and preview
- **Lightweight editing** - Quick data edits without launching desktop app

## Component Mapping

Both UIs implement the same editor types with platform-specific implementations:

| Editor Type | Avalonia View | Blazor Component | Shared Service |
|-------------|---------------|------------------|----------------|
| Hex Editor | HexEditorView.axaml | HexEditor.razor | HexEditorService.cs |
| CHR Editor | ChrEditorView.axaml | ChrEditor.razor | ChrEditorService.cs |
| Map Editor | MapEditorView.axaml | MapEditor.razor | MapEditorService.cs |
| Text Editor | TextExtractorView.axaml | TextEditor.razor | TextEditorService.cs |
| Disassembler | DisassemblerView.axaml | DisassemblyViewer.razor | DisassemblerService.cs |
| Script Editor | ScriptEditorView.axaml | ScriptEditor.razor | ScriptEditorService.cs |
| Data Tables | DataTableView.axaml | DataEditor.razor | DataEditorService.cs |
| Palette Editor | PaletteEditorView.axaml | (todo) | PaletteService.cs |
| ROM Info | RomInfoView.axaml | (todo) | RomService.cs |
| Save Editor | SaveEditorView.axaml | (todo) | SaveEditorService.cs |
| CDL Viewer | CdlViewerView.axaml | (todo) | TraceAnalyzerService.cs |
| Bank View | BankViewView.axaml | (todo) | RomService.cs |
| Build Pipeline | BuildPipelineView.axaml | (todo) | BuildService.cs |

## Service Layer Pattern

Both UIs use the same service interfaces, allowing logic sharing:

```csharp
// Shared interface in GameInfoTools.Core
public interface IHexEditorService
{
    byte[] GetBytes(int offset, int length);
    void SetBytes(int offset, byte[] data);
    IEnumerable<SearchResult> Search(byte[] pattern);
    void Undo();
    void Redo();
}

// Avalonia implementation (full file access)
public class AvaloniaHexEditorService : IHexEditorService
{
    private readonly FileStream _romStream;
    // Direct file manipulation
}

// Blazor implementation (in-memory or API)
public class BlazorHexEditorService : IHexEditorService
{
    private byte[] _romData; // Loaded via File API
    // Or calls backend API for large ROMs
}
```

## Game-Specific Editors

Game-specific editors (Dragon Warrior, FFMQ, etc.) live in game libraries and are consumed by both UIs:

```
logsmall/
├── DW4Lib/           ← Dragon Warrior IV NES core logic
├── DQ3Lib/           ← Dragon Quest III SNES core logic  
├── DQ4rLib/          ← Dragon Quest IV remake logic
├── FFMQLib/          ← Final Fantasy Mystic Quest logic
└── ...

GameInfo/
├── src/
│   └── GameInfoTools.UI/
│       └── Views/Games/
│           ├── DragonWarrior4View.axaml    ← Avalonia UI
│           └── DragonQuest3View.axaml
└── DarkRepos/Editor/
    └── src/DarkRepos.Editor.Web/
        └── Components/Pages/Games/
            ├── DW4Editor.razor              ← Blazor UI
            └── DQ3rEditor.razor
```

## Development Workflow

### Adding a New Editor

1. **Create service interface** in `GameInfoTools.Core/Interfaces/`
2. **Implement core logic** in appropriate library
3. **Create Avalonia View** in `GameInfoTools.UI/Views/`
4. **Create Blazor Component** in `DarkRepos.Editor.Shared/Components/`
5. **Add to navigation** in both UIs

### Adding Game Support

1. **Create game library** in `logsmall/` (e.g., `NewGameLib/`)
2. **Define data models** as C# records
3. **Implement ROM parser** with verified offsets
4. **Add Avalonia views** for desktop editing
5. **Add Blazor components** for web editing
6. **Create documentation** with ROM maps

## File Structure

```
GameInfo/
├── src/
│   ├── GameInfoTools.Core/          ← Shared core logic (KEEP)
│   ├── GameInfoTools.Graphics/      ← Graphics processing (KEEP)
│   ├── GameInfoTools.Text/          ← Text handling (KEEP)
│   ├── GameInfoTools.Rom/           ← ROM parsing (KEEP)
│   ├── GameInfoTools.Data/          ← Data extraction (KEEP)
│   ├── GameInfoTools.Disassembly/   ← Disassembly engine (KEEP)
│   ├── GameInfoTools.Analysis/      ← CDL/trace analysis (KEEP)
│   ├── GameInfoTools.Wiki/          ← Wikitext generation (KEEP)
│   └── GameInfoTools.UI/            ← AVALONIA DESKTOP APP
│       ├── Views/                   ← AXAML views
│       ├── ViewModels/              ← MVVM view models
│       ├── Controls/                ← Custom controls
│       └── Services/                ← Avalonia-specific services
│
└── DarkRepos/
    └── Editor/
        └── src/
            ├── DarkRepos.Editor.Core/    ← Blazor services
            ├── DarkRepos.Editor.Data/    ← EF Core database
            ├── DarkRepos.Editor.Shared/  ← BLAZOR COMPONENTS
            │   └── Components/
            │       ├── Editors/          ← Reusable editor components
            │       └── Layout/           ← Layout components
            └── DarkRepos.Editor.Web/     ← BLAZOR WEB HOST
                └── Components/Pages/     ← Page-level components

logsmall/
├── DW4Lib/              ← Dragon Warrior IV (shared)
├── DQ3Lib/              ← Dragon Quest III (shared)
├── DQ4rLib/             ← DQ4 remake (shared)
├── FFMQLib/             ← FFMQ (shared)
└── ...
```

## Migration Path

### Phase 1: Consolidate Core Libraries (Current)
- [x] GameInfoTools.Core established
- [x] Game libraries in logsmall
- [ ] Ensure all game libs reference GameInfoTools.Core

### Phase 2: Complete Avalonia Editor
- [ ] Add missing views (Monster Editor, Item Editor, etc.)
- [ ] Integrate game-specific views
- [ ] Polish UI/UX with Fluent theme

### Phase 3: Complete Blazor Editor  
- [ ] Add missing components (Palette, Save, CDL, etc.)
- [ ] Add game-specific pages
- [ ] Dark Repos wiki integration

### Phase 4: Feature Parity
- [ ] Ensure both UIs have equivalent functionality
- [ ] Shared project files (can open in either)
- [ ] Sync settings between desktop and web

## Benefits of Dual-UI Approach

1. **Best of both worlds** - Native performance when needed, web accessibility when convenient
2. **Shared logic** - Fix bugs once, both UIs benefit
3. **User choice** - Power users prefer desktop, casual users prefer web
4. **Development flexibility** - Can focus on one UI without blocking the other
5. **Future-proof** - If one technology becomes dominant, easy to migrate

## Anti-Patterns to Avoid

❌ **Don't** duplicate business logic in UI layers
❌ **Don't** create UI-specific data models (use shared)
❌ **Don't** hardcode file paths (use abstractions)
❌ **Don't** mix Avalonia and Blazor in same project

✅ **Do** keep all ROM parsing in core libraries
✅ **Do** use interfaces for platform-specific operations
✅ **Do** share data models via records
✅ **Do** document which features are desktop-only vs web-only

## Project File System (.giproj)

Both UIs support the `.giproj` project file format for managing ROM hacking projects.

### Project Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          PROJECT LIFECYCLE                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐  │
│   │ Select Game │ -> │ Select ROM  │ -> │ Verify ROM  │ -> │  Extract    │  │
│   └─────────────┘    └─────────────┘    └─────────────┘    │  Assets     │  │
│                                                            └──────┬──────┘  │
│                                                                   │         │
│                                                                   ▼         │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐  │
│   │ Verify Match│ <- │ Build ROM   │ <- │ Edit Assets │ <- │ Create      │  │
│   └─────────────┘    └─────────────┘    └─────────────┘    │ .giproj     │  │
│                                                            └─────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```

### .giproj File Structure (ZIP Archive)

```
MyProject.giproj (ZIP)
├── project.json          # Project metadata
├── manifest.json         # Asset manifest with checksums
├── assets/
│   ├── graphics/         # PNG tiles, sprites, backgrounds
│   ├── text/             # JSON dialog, menus
│   ├── data/             # JSON tables (monsters, items, spells)
│   ├── maps/             # JSON tilemaps + preview PNGs
│   └── audio/            # Binary music/SFX + metadata
├── source/
│   ├── main.asm          # Assembly source files
│   └── includes/         # Include files
├── symbols/
│   ├── labels.sym        # Symbol definitions
│   └── addresses.json    # Address mappings
├── patches/              # BPS/IPS patches for modifications
└── build/
    └── profiles/         # Build configuration profiles
```

### Key Services

| Service | Purpose |
|---------|---------|
| `IProjectService` | Project lifecycle (create, open, save, close) |
| `IAssetExtractor` | Game-specific asset extraction |
| `IAssembler` | Build ROM from source (ca65, Ophis, bass) |
| `IBuildVerifier` | Verify built ROM matches original |

### Security Model

- **No ROM distribution** - Projects store only extracted assets
- **Reference checksums** - Original ROM verified by checksum
- **Patch-based mods** - Modifications stored as patches, not full ROMs

See [giproj-project-file-format.md](giproj-project-file-format.md) for full specification.

## Next Steps

1. ~~Create GitHub issues for missing components~~ ✅
2. ~~Add project references from GameInfoTools.UI to game libraries~~ ✅
3. Implement Dragon Warrior editors in both UIs
4. ~~Create shared IEditorService interfaces~~ ✅
5. Document feature matrix (what's in which UI)
6. Implement .giproj project system (#191-197)
