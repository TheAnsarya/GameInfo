# Dark Repos Editor - Project Structure

This document describes the folder structure and organization of the Dark Repos Editor project.

## Solution Layout

```
DarkRepos Editor/
├── .editorconfig                    # Code style configuration
├── .gitignore                       # Git ignore patterns
├── DarkRepos Editor.sln              # Visual Studio solution file
├── global.json                      # .NET SDK version pinning
├── README.md                        # Project overview
├── docker-compose.yml               # Docker orchestration
├── Dockerfile                       # Container definition
│
├── docs/                            # Documentation
│   ├── api-reference.md             # REST API documentation
│   ├── architecture.md              # System architecture
│   ├── design-system.md             # UI/UX design system
│   ├── development-guide.md         # Developer guide
│   ├── github-issues.md             # Issue templates
│   ├── project-structure.md         # This file
│   ├── ROADMAP.md                   # Development roadmap
│   └── user-guide.md                # End-user documentation
│
├── src/                             # Source code
│   ├── DarkRepos.Editor.Core/        # Core business logic
│   ├── DarkRepos.Editor.Data/        # Database layer
│   ├── DarkRepos.Editor.Web/         # Blazor web application
│   ├── DarkRepos.Editor.Desktop/     # MAUI Blazor Hybrid
│   └── DarkRepos.Editor.Shared/      # Shared components
│
└── tests/                           # Test projects
    ├── DarkRepos.Editor.Core.Tests/  # Core unit tests
    ├── DarkRepos.Editor.Data.Tests/  # Data layer tests
    ├── DarkRepos.Editor.Web.Tests/   # Web component tests
    └── DarkRepos Editor.Integration.Tests/ # Integration tests
```

## Project Descriptions

### DarkRepos.Editor.Core

Core business logic and domain models. No UI dependencies.

```
DarkRepos.Editor.Core/
├── DarkRepos.Editor.Core.csproj
├── Interfaces/
│   ├── IHexEditorService.cs
│   ├── IDisassemblerService.cs
│   ├── IChrEditorService.cs
│   ├── ITextEditorService.cs
│   ├── IMapEditorService.cs
│   ├── IPaletteService.cs
│   ├── ICdlService.cs
│   ├── IRomService.cs
│   ├── IProjectService.cs
│   └── ILabelService.cs
│
├── Models/
│   ├── Rom/
│   │   ├── Rom.cs
│   │   ├── RomInfo.cs
│   │   ├── RomPlatform.cs
│   │   └── RomMapper.cs
│   ├── Hex/
│   │   ├── ByteRange.cs
│   │   ├── HexSelection.cs
│   │   └── Bookmark.cs
│   ├── Disassembly/
│   │   ├── Instruction.cs
│   │   ├── Opcode.cs
│   │   ├── InstructionSet.cs
│   │   └── DisassemblyLine.cs
│   ├── Graphics/
│   │   ├── Tile.cs
│   │   ├── Tileset.cs
│   │   ├── Palette.cs
│   │   ├── PaletteColor.cs
│   │   └── TileFormat.cs
│   ├── Text/
│   │   ├── TableFile.cs
│   │   ├── TableEntry.cs
│   │   ├── TextPointer.cs
│   │   └── ExtractedText.cs
│   ├── Map/
│   │   ├── Tilemap.cs
│   │   ├── MapLayer.cs
│   │   └── MapEvent.cs
│   ├── Analysis/
│   │   ├── CdlData.cs
│   │   ├── CdlRegion.cs
│   │   ├── CdlFormat.cs
│   │   └── CoverageStats.cs
│   ├── Labels/
│   │   ├── Label.cs
│   │   ├── LabelType.cs
│   │   └── SymbolTable.cs
│   └── Project/
│       ├── Project.cs
│       ├── ProjectSettings.cs
│       └── Edit.cs
│
├── Services/
│   ├── HexEditorService.cs
│   ├── DisassemblerService.cs
│   ├── ChrEditorService.cs
│   ├── TextEditorService.cs
│   ├── MapEditorService.cs
│   ├── PaletteService.cs
│   ├── CdlService.cs
│   ├── RomService.cs
│   ├── ProjectService.cs
│   └── LabelService.cs
│
├── Decoders/
│   ├── Cpu6502Decoder.cs
│   ├── Cpu65816Decoder.cs
│   ├── CpuZ80Decoder.cs
│   └── IInstructionDecoder.cs
│
├── Formats/
│   ├── TileFormats/
│   │   ├── Nes2BppFormat.cs
│   │   ├── Snes4BppFormat.cs
│   │   ├── GameBoy2BppFormat.cs
│   │   └── ITileFormat.cs
│   ├── CdlFormats/
│   │   ├── FceuxCdlFormat.cs
│   │   ├── MesenCdlFormat.cs
│   │   └── ICdlFormat.cs
│   └── TextFormats/
│       ├── TblParser.cs
│       ├── AtlasParser.cs
│       └── ITableFormat.cs
│
└── Extensions/
    ├── ByteExtensions.cs
    ├── StringExtensions.cs
    └── SpanExtensions.cs
```

### DarkRepos.Editor.Data

Database layer using Entity Framework Core with SQLite.

```
DarkRepos.Editor.Data/
├── DarkRepos.Editor.Data.csproj
├── EditorDbContext.cs
├── Entities/
│   ├── RomEntity.cs
│   ├── ProjectEntity.cs
│   ├── EditEntity.cs
│   ├── LabelEntity.cs
│   ├── BookmarkEntity.cs
│   └── SettingsEntity.cs
│
├── Configurations/
│   ├── RomConfiguration.cs
│   ├── ProjectConfiguration.cs
│   ├── EditConfiguration.cs
│   └── LabelConfiguration.cs
│
├── Repositories/
│   ├── IRomRepository.cs
│   ├── RomRepository.cs
│   ├── IProjectRepository.cs
│   ├── ProjectRepository.cs
│   ├── ILabelRepository.cs
│   └── LabelRepository.cs
│
├── Migrations/
│   └── (EF Core migrations)
│
└── Extensions/
    └── ServiceCollectionExtensions.cs
```

### DarkRepos.Editor.Shared

Shared Blazor components used by both web and desktop apps.

```
DarkRepos.Editor.Shared/
├── DarkRepos.Editor.Shared.csproj
├── _Imports.razor
│
├── Components/
│   ├── Common/
│   │   ├── Button.razor
│   │   ├── Button.razor.cs
│   │   ├── Input.razor
│   │   ├── Card.razor
│   │   ├── Modal.razor
│   │   ├── Tabs.razor
│   │   ├── Toolbar.razor
│   │   ├── StatusBar.razor
│   │   ├── FileTree.razor
│   │   ├── Dropdown.razor
│   │   └── Tooltip.razor
│   │
│   ├── Editors/
│   │   ├── HexEditor/
│   │   │   ├── HexEditor.razor
│   │   │   ├── HexEditor.razor.cs
│   │   │   ├── HexGrid.razor
│   │   │   ├── HexRow.razor
│   │   │   ├── HexCell.razor
│   │   │   ├── HexSearch.razor
│   │   │   └── HexBookmarks.razor
│   │   │
│   │   ├── Disassembler/
│   │   │   ├── Disassembler.razor
│   │   │   ├── Disassembler.razor.cs
│   │   │   ├── InstructionLine.razor
│   │   │   ├── LabelEditor.razor
│   │   │   └── DisassemblyOutput.razor
│   │   │
│   │   ├── ChrEditor/
│   │   │   ├── ChrEditor.razor
│   │   │   ├── ChrEditor.razor.cs
│   │   │   ├── TileCanvas.razor
│   │   │   ├── TilesetGrid.razor
│   │   │   ├── PaletteSelector.razor
│   │   │   └── DrawingTools.razor
│   │   │
│   │   ├── TextEditor/
│   │   │   ├── TextEditor.razor
│   │   │   ├── TextEditor.razor.cs
│   │   │   ├── TableFileEditor.razor
│   │   │   ├── PointerTable.razor
│   │   │   └── TextSearch.razor
│   │   │
│   │   ├── MapEditor/
│   │   │   ├── MapEditor.razor
│   │   │   ├── MapEditor.razor.cs
│   │   │   ├── TilemapCanvas.razor
│   │   │   ├── TilesetPanel.razor
│   │   │   ├── LayerPanel.razor
│   │   │   └── EventMarkers.razor
│   │   │
│   │   ├── PaletteEditor/
│   │   │   ├── PaletteEditor.razor
│   │   │   ├── PaletteEditor.razor.cs
│   │   │   ├── ColorPicker.razor
│   │   │   └── PaletteGrid.razor
│   │   │
│   │   ├── ScriptEditor/
│   │   │   ├── ScriptEditor.razor
│   │   │   ├── ScriptEditor.razor.cs
│   │   │   └── CommandEditor.razor
│   │   │
│   │   └── DataTableEditor/
│   │       ├── DataTableEditor.razor
│   │       ├── DataTableEditor.razor.cs
│   │       ├── SchemaEditor.razor
│   │       └── DataGrid.razor
│   │
│   ├── Analysis/
│   │   ├── CdlViewer/
│   │   │   ├── CdlViewer.razor
│   │   │   ├── CdlViewer.razor.cs
│   │   │   ├── CoverageHeatmap.razor
│   │   │   └── CoverageStats.razor
│   │   │
│   │   ├── BankView/
│   │   │   ├── BankView.razor
│   │   │   ├── BankView.razor.cs
│   │   │   └── BankGrid.razor
│   │   │
│   │   └── SymbolManager/
│   │       ├── SymbolManager.razor
│   │       ├── SymbolManager.razor.cs
│   │       └── SymbolTable.razor
│   │
│   └── Layout/
│       ├── MainLayout.razor
│       ├── MainLayout.razor.css
│       ├── Sidebar.razor
│       ├── Header.razor
│       └── Footer.razor
│
├── wwwroot/
│   ├── css/
│   │   ├── app.css
│   │   ├── variables.css
│   │   └── components.css
│   ├── js/
│   │   ├── canvas.js
│   │   └── keyboard.js
│   └── icons/
│       └── (SVG icons)
│
└── Services/
    ├── ThemeService.cs
    ├── KeyboardService.cs
    └── NotificationService.cs
```

### DarkRepos.Editor.Web

Blazor Server/WebAssembly hybrid web application.

```
DarkRepos.Editor.Web/
├── DarkRepos.Editor.Web.csproj
├── Program.cs
├── appsettings.json
├── appsettings.Development.json
├── _Imports.razor
│
├── Components/
│   ├── App.razor
│   ├── Routes.razor
│   ├── _Imports.razor
│   │
│   └── Pages/
│       ├── Home.razor
│       ├── ProjectList.razor
│       ├── Editor.razor
│       ├── Settings.razor
│       └── Error.razor
│
├── Controllers/
│   ├── RomController.cs
│   ├── ProjectController.cs
│   ├── HexController.cs
│   ├── DisassemblyController.cs
│   ├── ChrController.cs
│   ├── TextController.cs
│   ├── MapController.cs
│   ├── CdlController.cs
│   ├── LabelController.cs
│   └── PatchController.cs
│
├── Hubs/
│   └── EditorHub.cs
│
├── wwwroot/
│   ├── favicon.ico
│   └── index.html
│
└── Properties/
    └── launchSettings.json
```

### DarkRepos.Editor.Desktop

MAUI Blazor Hybrid desktop application.

```
DarkRepos.Editor.Desktop/
├── DarkRepos.Editor.Desktop.csproj
├── MauiProgram.cs
├── App.xaml
├── App.xaml.cs
├── MainPage.xaml
├── MainPage.xaml.cs
│
├── Platforms/
│   ├── Windows/
│   │   ├── App.xaml
│   │   └── App.xaml.cs
│   ├── MacCatalyst/
│   │   ├── AppDelegate.cs
│   │   └── Info.plist
│   └── Tizen/
│       └── (Tizen files)
│
├── Resources/
│   ├── AppIcon/
│   ├── Images/
│   └── Splash/
│
└── Services/
    ├── NativeFileService.cs
    ├── SystemTrayService.cs
    └── UpdateService.cs
```

### Test Projects

```
tests/
├── DarkRepos.Editor.Core.Tests/
│   ├── DarkRepos.Editor.Core.Tests.csproj
│   ├── Services/
│   │   ├── HexEditorServiceTests.cs
│   │   ├── DisassemblerServiceTests.cs
│   │   ├── ChrEditorServiceTests.cs
│   │   └── TextEditorServiceTests.cs
│   ├── Decoders/
│   │   ├── Cpu6502DecoderTests.cs
│   │   └── Cpu65816DecoderTests.cs
│   └── Formats/
│       ├── TblParserTests.cs
│       └── CdlFormatTests.cs
│
├── DarkRepos.Editor.Data.Tests/
│   ├── DarkRepos.Editor.Data.Tests.csproj
│   └── Repositories/
│       ├── RomRepositoryTests.cs
│       └── ProjectRepositoryTests.cs
│
├── DarkRepos.Editor.Web.Tests/
│   ├── DarkRepos.Editor.Web.Tests.csproj
│   ├── Controllers/
│   │   └── RomControllerTests.cs
│   └── Components/
│       ├── HexEditorTests.cs
│       └── DisassemblerTests.cs
│
└── DarkRepos Editor.Integration.Tests/
    ├── DarkRepos Editor.Integration.Tests.csproj
    └── ApiTests/
        ├── RomApiTests.cs
        └── ProjectApiTests.cs
```

## Configuration Files

### .editorconfig
```ini
root = true

[*]
indent_style = tab
indent_size = 4
end_of_line = crlf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.{cs,razor}]
dotnet_style_qualification_for_field = false:suggestion
dotnet_style_qualification_for_property = false:suggestion
dotnet_style_qualification_for_method = false:suggestion
dotnet_style_qualification_for_event = false:suggestion
csharp_style_var_for_built_in_types = true:suggestion
csharp_style_var_when_type_is_apparent = true:suggestion
csharp_style_var_elsewhere = true:suggestion
```

### global.json
```json
{
	"sdk": {
		"version": "10.0.100",
		"rollForward": "latestFeature"
	}
}
```

### docker-compose.yml
```yaml
version: '3.8'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5000:5000"
      - "5001:5001"
    volumes:
      - ./data:/app/data
    environment:
      - ASPNETCORE_ENVIRONMENT=Production
      - ConnectionStrings__Default=Data Source=/app/data/editor.db
```

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Classes | PascalCase | `HexEditorService` |
| Interfaces | IPascalCase | `IHexEditorService` |
| Methods | PascalCase | `GetBytesAsync` |
| Properties | PascalCase | `ByteData` |
| Private fields | _camelCase | `_romService` |
| Local variables | camelCase | `byteBuffer` |
| Constants | PascalCase | `MaxFileSize` |
| Razor components | PascalCase | `HexEditor.razor` |
| CSS classes | kebab-case | `hex-editor-grid` |

## File Organization Rules

1. **One class per file** (except nested classes)
2. **Razor component code-behind** uses `.razor.cs` extension
3. **Component-scoped CSS** uses `.razor.css` extension
4. **Test files** mirror source structure with `Tests` suffix
5. **Interfaces** in separate `Interfaces/` folder or same folder as implementation
