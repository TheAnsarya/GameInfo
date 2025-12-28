# Dark Repos Editor - System Architecture

## Overview

Dark Repos Editor follows a **local-first architecture** inspired by applications like Plex Media Server, Jellyfin, and Home Assistant. The application runs as a background service on the user's machine, serving a web-based UI through a local web server.

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           USER'S MACHINE                                 │
│                                                                          │
│  ┌────────────────────────────────────────────────────────────────────┐ │
│  │                     Web Browser (Any Modern Browser)                │ │
│  │  ┌──────────────────────────────────────────────────────────────┐  │ │
│  │  │              Blazor WebAssembly Application                   │  │ │
│  │  │                                                               │  │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐             │  │ │
│  │  │  │   Editor    │ │   Editor    │ │   Editor    │             │  │ │
│  │  │  │ Components  │ │    State    │ │  Services   │             │  │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘             │  │ │
│  │  │                                                               │  │ │
│  │  │  ┌─────────────────────────────────────────────────────────┐ │  │ │
│  │  │  │            JavaScript Interop Layer                      │ │  │ │
│  │  │  │  • Canvas Rendering (CHR/Map editors)                    │ │  │ │
│  │  │  │  • File System Access API                                │ │  │ │
│  │  │  │  • Keyboard Shortcuts                                    │ │  │ │
│  │  │  │  • Clipboard API                                         │ │  │ │
│  │  │  └─────────────────────────────────────────────────────────┘ │  │ │
│  │  └──────────────────────────────────────────────────────────────┘  │ │
│  └────────────────────────────────────────────────────────────────────┘ │
│                                    │                                     │
│                    HTTP/REST │ WebSocket/SignalR                         │
│                                    ▼                                     │
│  ┌────────────────────────────────────────────────────────────────────┐ │
│  │                Dark Repos Editor Service                            │ │
│  │                 (Background Worker Process)                         │ │
│  │                                                                     │ │
│  │  ┌───────────────────────────────────────────────────────────────┐ │ │
│  │  │                    ASP.NET Core Host                           │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │   Kestrel   │ │   SignalR   │ │   Static    │              │ │ │
│  │  │  │ Web Server  │ │    Hubs     │ │   Files     │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  └───────────────────────────────────────────────────────────────┘ │ │
│  │                                                                     │ │
│  │  ┌───────────────────────────────────────────────────────────────┐ │ │
│  │  │                      API Layer                                 │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │    ROM      │ │  Graphics   │ │   Project   │              │ │ │
│  │  │  │    API      │ │     API     │ │     API     │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │   Data      │ │    Text     │ │   Build     │              │ │ │
│  │  │  │   API       │ │    API      │ │    API      │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  └───────────────────────────────────────────────────────────────┘ │ │
│  │                                                                     │ │
│  │  ┌───────────────────────────────────────────────────────────────┐ │ │
│  │  │                   Service Layer                                │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │   ROM       │ │  Graphics   │ │   Build     │              │ │ │
│  │  │  │  Service    │ │  Service    │ │  Pipeline   │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │  Project    │ │   Config    │ │   Plugin    │              │ │ │
│  │  │  │  Manager    │ │  Manager    │ │  Manager    │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  └───────────────────────────────────────────────────────────────┘ │ │
│  │                                                                     │ │
│  │  ┌───────────────────────────────────────────────────────────────┐ │ │
│  │  │               GameInfoTools Libraries                          │ │ │
│  │  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐      │ │ │
│  │  │  │  Core  │ │Graphics│ │  Text  │ │  Data  │ │Analysis│      │ │ │
│  │  │  └────────┘ └────────┘ └────────┘ └────────┘ └────────┘      │ │ │
│  │  │  ┌────────┐ ┌────────┐ ┌────────┐                            │ │ │
│  │  │  │  Rom   │ │Disasm  │ │  Wiki  │                            │ │ │
│  │  │  └────────┘ └────────┘ └────────┘                            │ │ │
│  │  └───────────────────────────────────────────────────────────────┘ │ │
│  │                                                                     │ │
│  │  ┌───────────────────────────────────────────────────────────────┐ │ │
│  │  │                     Data Layer                                 │ │ │
│  │  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │ │ │
│  │  │  │   SQLite    │ │ File System │ │   Config    │              │ │ │
│  │  │  │  (EF Core)  │ │   Access    │ │   Store     │              │ │ │
│  │  │  └─────────────┘ └─────────────┘ └─────────────┘              │ │ │
│  │  └───────────────────────────────────────────────────────────────┘ │ │
│  └────────────────────────────────────────────────────────────────────┘ │
│                                                                          │
│  ┌────────────────────────────────────────────────────────────────────┐ │
│  │                        File System                                  │ │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │ │
│  │  │  ~/.darkrepos-editor/       │ │   ~/ROMs/   │ │  Projects/  │  │ │
│  │  │  ├── config.json            │ │  (User's    │ │  (Working   │  │ │
│  │  │  ├── projects.db            │ │   ROMs)     │ │   copies)   │  │ │
│  │  │  ├── cache/                 │ │             │ │             │  │ │
│  │  │  └── logs/                  │ │             │ │             │  │ │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │ │
│  └────────────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────────────┘
```

## Component Details

### 1. Blazor WebAssembly Client

The UI runs entirely in the browser using WebAssembly, providing a rich, responsive experience.

#### Key Components

| Component | Purpose |
|-----------|---------|
| `HexEditor` | Binary data editing with multiple views (hex, decimal, ASCII) |
| `ChrEditor` | Tile graphics editing with palette support |
| `MapEditor` | Tile-based map editing with layers |
| `PaletteEditor` | Color palette creation and editing |
| `ScriptEditor` | Game script editing with syntax highlighting |
| `TextExtractor` | String extraction with TBL file support |
| `DataTableEditor` | Tabular data editing (monsters, items, etc.) |
| `Disassembler` | Multi-architecture disassembly view |
| `CdlViewer` | Code/Data Logger visualization |
| `RomInfo` | ROM header and metadata display |
| `PointerScanner` | Pointer table detection and editing |
| `SaveEditor` | Save file and state editing |
| `SymbolManager` | Label and symbol management |
| `BuildPipeline` | ROM assembly and patch building |
| `WikiEditor` | DarkRepos wiki content editing |

#### State Management

```
┌─────────────────────────────────────────────────────────────┐
│                    State Architecture                        │
│                                                              │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐      │
│  │   Global    │    │   Editor    │    │   UI        │      │
│  │   State     │◄───│   State     │◄───│   State     │      │
│  │             │    │             │    │             │      │
│  │ • Projects  │    │ • Open docs │    │ • Theme     │      │
│  │ • Settings  │    │ • Undo/redo │    │ • Layout    │      │
│  │ • User      │    │ • Selection │    │ • Modals    │      │
│  └─────────────┘    └─────────────┘    └─────────────┘      │
│         │                  │                  │              │
│         └──────────────────┼──────────────────┘              │
│                            ▼                                 │
│                  ┌─────────────┐                             │
│                  │  Cascading  │                             │
│                  │  Parameters │                             │
│                  └─────────────┘                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. ASP.NET Core Service

The backend runs as a Windows Service, macOS LaunchAgent, or Linux systemd service.

#### Service Lifecycle

```
┌─────────────────────────────────────────────────────────────┐
│                   Service Lifecycle                          │
│                                                              │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐  │
│  │  Start  │───▶│  Init   │───▶│  Ready  │───▶│  Stop   │  │
│  └─────────┘    └─────────┘    └─────────┘    └─────────┘  │
│       │              │              │              │        │
│       ▼              ▼              ▼              ▼        │
│  Load config    Init DB       Serve HTTP      Cleanup      │
│  Check port     Init cache    Handle API      Save state   │
│  Start Kestrel  Load plugins  SignalR         Close DB     │
└─────────────────────────────────────────────────────────────┘
```

#### API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/projects` | GET, POST | List/create projects |
| `/api/projects/{id}` | GET, PUT, DELETE | Project CRUD |
| `/api/rom/info` | GET | Get ROM information |
| `/api/rom/read` | GET | Read ROM bytes |
| `/api/rom/write` | POST | Write ROM bytes |
| `/api/graphics/chr` | GET, POST | CHR data operations |
| `/api/graphics/palette` | GET, POST | Palette operations |
| `/api/text/extract` | POST | Extract text strings |
| `/api/text/insert` | POST | Insert translated text |
| `/api/data/tables` | GET, POST | Data table operations |
| `/api/disasm/bank` | GET | Disassemble ROM bank |
| `/api/build/assemble` | POST | Assemble ROM |
| `/api/build/patch` | POST | Create/apply patches |

#### SignalR Hubs

| Hub | Purpose |
|-----|---------|
| `EditorHub` | Real-time editor collaboration |
| `BuildHub` | Build progress notifications |
| `NotificationHub` | System notifications |

### 3. Data Layer

#### Database Schema (EF Core + SQLite)

```sql
-- Projects table
CREATE TABLE Projects (
    Id TEXT PRIMARY KEY,
    Name TEXT NOT NULL,
    Description TEXT,
    RomPath TEXT NOT NULL,
    Platform TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    Settings TEXT -- JSON blob
);

-- Project Files (working copies)
CREATE TABLE ProjectFiles (
    Id TEXT PRIMARY KEY,
    ProjectId TEXT NOT NULL REFERENCES Projects(Id),
    FileName TEXT NOT NULL,
    FileType TEXT NOT NULL,
    FilePath TEXT NOT NULL,
    Checksum TEXT,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL
);

-- Labels/Symbols
CREATE TABLE Symbols (
    Id TEXT PRIMARY KEY,
    ProjectId TEXT NOT NULL REFERENCES Projects(Id),
    Address INTEGER NOT NULL,
    Bank INTEGER,
    Name TEXT NOT NULL,
    Type TEXT NOT NULL,
    Comment TEXT,
    CreatedAt TEXT NOT NULL
);

-- Bookmarks
CREATE TABLE Bookmarks (
    Id TEXT PRIMARY KEY,
    ProjectId TEXT NOT NULL REFERENCES Projects(Id),
    Address INTEGER NOT NULL,
    Name TEXT NOT NULL,
    Color TEXT,
    CreatedAt TEXT NOT NULL
);

-- Edit History (for undo/redo persistence)
CREATE TABLE EditHistory (
    Id TEXT PRIMARY KEY,
    ProjectId TEXT NOT NULL REFERENCES Projects(Id),
    EditorType TEXT NOT NULL,
    ChangeType TEXT NOT NULL,
    OldValue BLOB,
    NewValue BLOB,
    Timestamp TEXT NOT NULL
);
```

#### Database Migration Strategy

The system is designed to support multiple database providers:

```csharp
public static class DatabaseFactory
{
    public static DbContextOptions<EditorDbContext> GetOptions(DatabaseConfig config)
    {
        return config.Provider switch
        {
            DatabaseProvider.SQLite => new DbContextOptionsBuilder<EditorDbContext>()
                .UseSqlite(config.ConnectionString)
                .Options,
            
            DatabaseProvider.PostgreSQL => new DbContextOptionsBuilder<EditorDbContext>()
                .UseNpgsql(config.ConnectionString)
                .Options,
            
            DatabaseProvider.SqlServer => new DbContextOptionsBuilder<EditorDbContext>()
                .UseSqlServer(config.ConnectionString)
                .Options,
            
            _ => throw new NotSupportedException($"Provider {config.Provider} not supported")
        };
    }
}
```

### 4. Platform Integration

#### Windows

- **Installation:** MSI installer via WiX Toolset
- **Service:** Windows Service with system tray icon
- **Auto-start:** Registry entry for startup
- **File associations:** `.drp` (Dark Repos Project) files

#### macOS

- **Installation:** DMG with drag-to-Applications
- **Service:** LaunchAgent for user-level service
- **Menu bar:** Status menu icon with controls
- **File associations:** UTI registration

#### Linux

- **Installation:** DEB, RPM, and AppImage packages
- **Service:** systemd user service
- **Desktop integration:** .desktop file with icon
- **File associations:** MIME type registration

```
┌─────────────────────────────────────────────────────────────┐
│                Platform-Specific Components                  │
│                                                              │
│  Windows:                                                    │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐            │
│  │  MSI/WiX    │ │  Win Svc    │ │  Tray Icon  │            │
│  └─────────────┘ └─────────────┘ └─────────────┘            │
│                                                              │
│  macOS:                                                      │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐            │
│  │    DMG      │ │ LaunchAgent │ │  Menu Bar   │            │
│  └─────────────┘ └─────────────┘ └─────────────┘            │
│                                                              │
│  Linux:                                                      │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐            │
│  │  DEB/RPM/   │ │   systemd   │ │  .desktop   │            │
│  │  AppImage   │ │   service   │ │    file     │            │
│  └─────────────┘ └─────────────┘ └─────────────┘            │
└─────────────────────────────────────────────────────────────┘
```

## Security Considerations

### Local-Only by Default

- Service binds to `127.0.0.1` only (not `0.0.0.0`)
- No external network access required
- All data stored locally

### Optional Remote Access

For advanced users who want remote access:

```json
{
  "server": {
    "bindAddress": "0.0.0.0",
    "enableAuthentication": true,
    "enableHttps": true,
    "certificatePath": "/path/to/cert.pfx"
  }
}
```

### File System Access

- Sandboxed file access through API
- No direct file system access from browser
- Path validation to prevent directory traversal

## Performance Considerations

### Lazy Loading

- Editors loaded on-demand
- ROM data streamed in chunks
- Virtual scrolling for large data views

### Caching Strategy

```
┌─────────────────────────────────────────────────────────────┐
│                    Cache Layers                              │
│                                                              │
│  Browser:     ┌─────────────────────────────────────┐       │
│               │  IndexedDB (recent edits, UI state)  │       │
│               └─────────────────────────────────────┘       │
│                              │                               │
│  Service:     ┌─────────────────────────────────────┐       │
│               │  Memory Cache (hot ROM data)         │       │
│               └─────────────────────────────────────┘       │
│                              │                               │
│  Disk:        ┌─────────────────────────────────────┐       │
│               │  File Cache (extracted assets)       │       │
│               └─────────────────────────────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

### Background Processing

Long-running operations (disassembly, analysis) run in background with progress reporting via SignalR.

## Extensibility

### Plugin Architecture

```csharp
public interface IEditorPlugin
{
    string Id { get; }
    string Name { get; }
    string Description { get; }
    Version Version { get; }
    
    Task InitializeAsync(IServiceProvider services);
    Task<RenderFragment> GetEditorComponentAsync();
    Task ShutdownAsync();
}
```

### Custom Platform Support

New platforms can be added by implementing:

```csharp
public interface IPlatformHandler
{
    string PlatformId { get; }
    string PlatformName { get; }
    
    Task<RomInfo> GetRomInfoAsync(Stream romData);
    Task<byte[]> ReadRomDataAsync(Stream romData, int offset, int length);
    Task<AddressMapping> GetAddressMappingAsync(Stream romData);
}
```

## Deployment Options

### Standalone Installation

Default mode - full installer with service and auto-start.

### Portable Mode

Run from USB drive without installation:

```bash
./DarkRepos Editor --portable --data-dir ./data
```

### Docker (for headless/server use)

```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:10.0
COPY publish/ /app/
WORKDIR /app
EXPOSE 5280
ENTRYPOINT ["dotnet", "DarkRepos.Editor.Service.dll"]
```

## Monitoring and Logging

### Log Levels

| Level | Description |
|-------|-------------|
| `Trace` | Detailed debugging info |
| `Debug` | Development diagnostics |
| `Information` | General operational info |
| `Warning` | Unexpected but handled situations |
| `Error` | Errors that need attention |
| `Critical` | System failures |

### Health Checks

```
GET /health          - Basic health check
GET /health/ready    - Readiness probe
GET /health/live     - Liveness probe
```

## References

- [ASP.NET Core Documentation](https://docs.microsoft.com/aspnet/core)
- [Blazor WebAssembly](https://docs.microsoft.com/aspnet/core/blazor)
- [EF Core](https://docs.microsoft.com/ef/core)
- [SignalR](https://docs.microsoft.com/aspnet/core/signalr)
- [.NET Worker Services](https://docs.microsoft.com/dotnet/core/extensions/workers)
