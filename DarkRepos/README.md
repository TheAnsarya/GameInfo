# Dark Repos Website

**Website**: [https://darkrepos.com/](https://darkrepos.com/)
**Wiki**: [https://games.darkrepos.com/](https://games.darkrepos.com/)
**Repository**: [https://github.com/TheAnsarya/GameInfo](https://github.com/TheAnsarya/GameInfo)

## Overview

Dark Repos is a comprehensive resource hub for retro game research, ROM hacking, and disassembly projects. This website serves as the central access point for all GameInfo project resources, tools, and documentation.

## Project Structure

```
DarkRepos/
├── docs/                    # Project documentation
│   ├── ROADMAP.md          # Development roadmap and milestones
│   ├── ARCHITECTURE.md     # Technical architecture
│   ├── DESIGN-SYSTEM.md    # Colors, typography, components
│   ├── CONTENT-STRATEGY.md # Content organization
│   ├── TECHNICAL-SPECS.md  # Technical specifications
│   └── ACCESSIBILITY.md    # WCAG compliance guide
├── src/                     # Blazor application source
│   └── DarkRepos.Web/      # Main web application
└── README.md               # This file
```

## Technology Stack

- **Framework**: .NET 10 / Blazor Interactive WebAssembly + Server prerendering
- **Styling**: Custom CSS design system (no Bootstrap/Tailwind)
- **Database**: SQLite with EF Core 9.0 and FTS5 full-text search
- **Logging**: Serilog with structured logging
- **Build**: Static content generation from GameInfo repo files
- **CI/CD**: GitHub Actions workflow
- **Hosting**: TBD (Azure Static Web Apps, GitHub Pages, or VPS)

## Target Audience

- ROM hackers and reverse engineers
- Retro game researchers and documenters
- Game preservation enthusiasts
- Speedrunners and glitch hunters

## Key Features

1. **Games Catalog** - Browse documented games by platform, with links to wiki pages
2. **Tools Documentation** - Comprehensive guides for GameInfo tools
3. **Resource Downloads** - Links to tools, assets, and disassemblies
4. **Search** - Full-text search across all content
5. **Wiki Integration** - Links to MediaWiki at games.darkrepos.com

## Related Resources

- [GameInfo Repository](https://github.com/TheAnsarya/GameInfo)
- [Games Wiki](https://games.darkrepos.com/)
- [Discord Community](#) (Coming Soon)

## Development

### Prerequisites

- [.NET 10 SDK](https://dotnet.microsoft.com/download)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or [VS Code](https://code.visualstudio.com/)
- [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit) (for VS Code)

### Getting Started

```powershell
# Clone the repository
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo/DarkRepos

# Restore dependencies
dotnet restore

# Run the web application
cd src/DarkRepos.Web/DarkRepos.Web
dotnet run

# Or use hot reload
dotnet watch run
```

The application will be available at:
- **HTTPS**: https://localhost:7044
- **HTTP**: http://localhost:5081

### Project Structure

```
src/
├── DarkRepos.Core/         # Shared models, services, interfaces
├── DarkRepos.Web/          # Blazor web application
│   ├── DarkRepos.Web/      # Server project (entry point)
│   └── DarkRepos.Web.Client/ # WebAssembly client components
└── DarkRepos.Build/        # Content pipeline tools
```

### Running Tests

```powershell
dotnet test DarkRepos.sln
```

### Code Quality

```powershell
# Format code
dotnet format DarkRepos.sln

# Check for issues
dotnet build --configuration Release /p:EnforceCodeStyleInBuild=true
```

See [docs/](docs/) for comprehensive development documentation.

## License

MIT License - See LICENSE file for details.
