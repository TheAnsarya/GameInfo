# Dark Repos Editor

**Local-first ROM hacking editor suite** - A native application with a web-based interface for editing retro game ROMs, graphics, and data.

🌐 **URL:** `http://localhost:5280` (local) | `https://editor.darkrepos.com` (documentation)

## Overview

Dark Repos Editor is a comprehensive ROM hacking toolkit that runs as a local service on your machine, similar to how Plex Media Server works. You install the application, it runs in the background, and you interact with it through your web browser.

### Key Features

- 🖥️ **Local-First Architecture** - Your ROMs and data stay on your machine
- 🌐 **Web-Based Interface** - Modern, accessible UI via Blazor WebAssembly
- 🔧 **Comprehensive Tools** - Hex editor, graphics editor, map editor, and more
- 💾 **Project Management** - Organize ROM hacking projects with version control
- 🎨 **Modern Design** - Dark theme with earth tones, fully accessible
- 📦 **Cross-Platform** - Windows, macOS, and Linux support

## Installation

### Windows

```powershell
# Download and run installer
winget install DarkRepos.Editor
# Or download from releases page
```

### macOS

```bash
# Homebrew
brew install --cask darkrepos-editor
# Or download DMG from releases
```

### Linux

```bash
# Debian/Ubuntu
sudo apt install darkrepos-editor

# Arch Linux
yay -S darkrepos-editor

# Or use AppImage from releases
```

## Quick Start

1. **Install** Dark Repos Editor for your platform
2. **Launch** the application (runs as a background service)
3. **Open** `http://localhost:5280` in your browser
4. **Create** a new project or open an existing ROM

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Web Browser (UI)                          │
│  ┌─────────────────────────────────────────────────────────┐│
│  │           Blazor WebAssembly Application                ││
│  │  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐       ││
│  │  │   Hex   │ │   CHR   │ │   Map   │ │  Script │       ││
│  │  │ Editor  │ │ Editor  │ │ Editor  │ │ Editor  │ ...   ││
│  │  └─────────┘ └─────────┘ └─────────┘ └─────────┘       ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
                              │ HTTP/WebSocket
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              Dark Repos Editor Service                       │
│  ┌─────────────────────────────────────────────────────────┐│
│  │                   ASP.NET Core Host                      ││
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐        ││
│  │  │   REST API  │ │  SignalR    │ │  Static     │        ││
│  │  │  Endpoints  │ │  Real-time  │ │  Files      │        ││
│  │  └─────────────┘ └─────────────┘ └─────────────┘        ││
│  └─────────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────────┐│
│  │              GameInfoTools Libraries                     ││
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐││
│  │  │  Core  │ │Graphics│ │  Text  │ │  Data  │ │Analysis│││
│  │  └────────┘ └────────┘ └────────┘ └────────┘ └────────┘││
│  └─────────────────────────────────────────────────────────┘│
│  ┌─────────────────────────────────────────────────────────┐│
│  │                   Data Layer                             ││
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐        ││
│  │  │   SQLite    │ │ File System │ │   Config    │        ││
│  │  │  Projects   │ │    ROMs     │ │  Settings   │        ││
│  │  └─────────────┘ └─────────────┘ └─────────────┘        ││
│  └─────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

## Editor Tools

| Tool | Description | Status |
|------|-------------|--------|
| **Hex Editor** | Binary data editing with multiple views | 🔲 Planned |
| **CHR Editor** | NES/SNES tile graphics editing | 🔲 Planned |
| **Map Editor** | Tile-based map editing | 🔲 Planned |
| **Palette Editor** | Color palette management | 🔲 Planned |
| **Script Editor** | Game script editing with opcodes | 🔲 Planned |
| **Text Extractor** | String extraction with TBL support | 🔲 Planned |
| **Data Table Editor** | Monster/item/spell data editing | 🔲 Planned |
| **Disassembler** | 6502/65816/Z80 disassembly | 🔲 Planned |
| **CDL Viewer** | Code/Data Logger visualization | 🔲 Planned |
| **ROM Info** | Header and checksum analysis | 🔲 Planned |
| **Pointer Scanner** | Pointer table detection | 🔲 Planned |
| **Save Editor** | Save file/state editing | 🔲 Planned |
| **Symbol Manager** | Label and symbol management | 🔲 Planned |
| **Build Pipeline** | ROM assembly and patching | 🔲 Planned |
| **Wiki Editor** | DarkRepos wiki integration | 🔲 Planned |

## Technology Stack

- **Runtime:** .NET 10 (Latest)
- **UI Framework:** Blazor WebAssembly (Interactive)
- **Backend:** ASP.NET Core with Kestrel
- **Database:** SQLite with EF Core (swappable to PostgreSQL/SQL Server)
- **Real-time:** SignalR for live updates
- **Desktop Integration:** .NET Worker Service with system tray
- **Installers:** WiX (Windows), DMG (macOS), DEB/RPM/AppImage (Linux)

## Development

### Prerequisites

- .NET 10 SDK
- Node.js 20+ (for build tools)
- Visual Studio 2022 or VS Code

### Building from Source

```bash
# Clone the repository
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo/DarkReposEditor

# Restore dependencies
dotnet restore

# Build
dotnet build

# Run in development mode
dotnet run --project src/DarkReposEditor.Service
```

### Project Structure

```
DarkReposEditor/
├── docs/                    # Documentation
│   ├── architecture.md      # System architecture
│   ├── api-reference.md     # API documentation
│   ├── design-system.md     # UI/UX guidelines
│   └── deployment.md        # Deployment guide
├── src/
│   ├── DarkReposEditor.Core/        # Core business logic
│   ├── DarkReposEditor.Web/         # Blazor WebAssembly UI
│   ├── DarkReposEditor.Api/         # REST API
│   ├── DarkReposEditor.Service/     # Background service host
│   ├── DarkReposEditor.Data/        # EF Core data layer
│   └── DarkReposEditor.Shared/      # Shared DTOs and models
├── tests/
│   ├── DarkReposEditor.Tests/       # Unit tests
│   └── DarkReposEditor.E2E/         # End-to-end tests
├── installers/
│   ├── windows/             # WiX installer
│   ├── macos/               # DMG packaging
│   └── linux/               # DEB/RPM/AppImage
└── README.md
```

## Configuration

Configuration is stored in `~/.darkrepos-editor/config.json`:

```json
{
  "port": 5280,
  "openBrowserOnStart": true,
  "theme": "dark",
  "recentProjects": [],
  "defaultRomPath": "~/ROMs",
  "autoSaveInterval": 60
}
```

## API

The service exposes a REST API for programmatic access:

```bash
# Get ROM info
curl http://localhost:5280/api/rom/info?path=/path/to/rom.nes

# Export CHR data
curl http://localhost:5280/api/graphics/chr/export?path=/path/to/rom.nes&offset=0x8000
```

See [API Reference](docs/api-reference.md) for complete documentation.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - See [LICENSE](LICENSE) for details.

## Related Projects

- [GameInfo](https://github.com/TheAnsarya/GameInfo) - Main ROM hacking documentation and tools
- [DarkRepos Games Wiki](https://games.darkrepos.com) - ROM hacking wiki
- [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) - DW4 disassembly
- [ffmq-info](https://github.com/TheAnsarya/ffmq-info) - FFMQ disassembly
