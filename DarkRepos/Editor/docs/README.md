# Dark Repos Editor Documentation

Welcome to the Dark Repos Editor documentation. This comprehensive guide covers everything from getting started to advanced editor features.

## Quick Links

| Document | Description |
|----------|-------------|
| [README](../README.md) | Project overview and quick start |
| [Architecture](architecture.md) | System design and technical architecture |
| [Design System](design-system.md) | Colors, typography, and component design |
| [ROADMAP](ROADMAP.md) | Development phases and timeline |
| [API Reference](api-reference.md) | REST API endpoints and WebSocket events |
| [Development Guide](development-guide.md) | Developer setup and coding patterns |
| [User Guide](user-guide.md) | End-user documentation |
| [Project Structure](project-structure.md) | Folder organization and naming conventions |
| [GitHub Issues](github-issues.md) | Issue templates and project board setup |

## Overview

Dark Repos Editor is a web-based ROM editing suite for retro game systems (NES, SNES, Game Boy, etc.). It provides comprehensive tools for ROM hacking, disassembly, and data extraction.

### Key Features

- **Hex Editor** - Full-featured hex editing with search, bookmarks, and undo/redo
- **Disassembler** - 6502/65816 disassembly with label management
- **CHR Editor** - Visual tile and sprite editing with palette support
- **Text Editor** - Game text extraction and editing with TBL support
- **Map Editor** - Tilemap editing with layer and event support
- **Palette Editor** - Visual color palette management
- **Script Editor** - Event script editing with syntax highlighting
- **Data Table Editor** - Structured data editing with schemas
- **CDL Viewer** - Code/data coverage visualization
- **Symbol Manager** - Label and symbol management

### Deployment Options

1. **Web Application** - Access at editor.darkrepos.com
2. **Desktop Application** - Native Windows/macOS/Linux apps
3. **Local Server** - Self-hosted with Docker

## Getting Started

### For Users

1. Visit [editor.darkrepos.com](https://editor.darkrepos.com)
2. Create an account or continue as guest
3. Upload a ROM file
4. Start editing!

See the [User Guide](user-guide.md) for detailed instructions.

### For Developers

1. Clone the repository
2. Install .NET 10 SDK
3. Run `dotnet build`
4. Run `dotnet run --project src/DarkRepos.Editor.Web`

See the [Development Guide](development-guide.md) for detailed setup.

## Documentation Map

```
docs/
├── README.md            ← You are here
├── architecture.md      → System design, project structure, data flow
├── design-system.md     → Colors, typography, components, accessibility
├── ROADMAP.md           → Development phases, milestones, timeline
├── api-reference.md     → REST endpoints, WebSocket events, examples
├── development-guide.md → Setup, patterns, testing, deployment
├── user-guide.md        → Editor tutorials, keyboard shortcuts, FAQ
├── project-structure.md → Folder organization, naming conventions
└── github-issues.md     → Issue templates, labels, milestones
```

## Project Status

| Phase | Status | Progress |
|-------|--------|----------|
| Foundation | 🟡 Planning | 10% |
| Core Editors | ⬜ Not Started | 0% |
| Advanced Editors | ⬜ Not Started | 0% |
| Desktop & Polish | ⬜ Not Started | 0% |

## Support

- **Issues**: [GitHub Issues](https://github.com/TheAnsarya/GameInfo/issues)
- **Discussions**: [GitHub Discussions](https://github.com/TheAnsarya/GameInfo/discussions)
- **Wiki**: [Dark Repos Wiki](https://games.darkrepos.com)

## License

This project is licensed under the MIT License. See [LICENSE](../LICENSE) for details.
