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
├── src/                     # Application source
│   ├── DarkRepos.Core/     # Shared models, services, interfaces
│   ├── DarkRepos.Tests/    # Unit and component tests
│   └── DarkRepos.Web/      # Blazor web application
│       ├── DarkRepos.Web/      # Server project (entry point)
│       └── DarkRepos.Web.Client/ # WebAssembly client components
└── README.md               # This file
```

## Technology Stack

- **Framework**: .NET 10 / Blazor Interactive WebAssembly + Server prerendering
- **Styling**: Custom CSS design system (no Bootstrap/Tailwind)
- **Database**: SQLite with EF Core 9.0 and FTS5 full-text search
- **Testing**: xUnit 2.9.2, FluentAssertions 8.0.1, Moq 4.20.72, bUnit 1.33.3
- **Logging**: Serilog with structured logging
- **Build**: Static content generation from GameInfo repo files
- **CI/CD**: GitHub Actions workflow
- **Hosting**: TBD (Azure Static Web Apps, GitHub Pages, or VPS)

## Features

### Pages
- **Home** - Landing page with featured games and tools
- **Games** - Browse games by platform with filtering and search
- **Game Detail** - Individual game pages with wiki resource links
- **Tools** - Documentation for ROM hacking and analysis tools
- **Tool Detail** - Individual tool pages with downloads and documentation
- **Search** - Full-text search across games, tools, and documentation
- **Docs** - Comprehensive documentation and guides

### Shared Components
- `GameCard` - Reusable game display card with platform badge
- `ToolCard` - Reusable tool display card with category
- `PlatformBadge` - Color-coded badges (NES, SNES, GB, GBA, Genesis)
- `ToolCategoryBadge` - Color-coded tool category badges
- `LoadingSpinner` - Consistent loading state indicator
- `EmptyState` - Friendly empty/error state display
- `SectionHeader` - Section titles with optional links
- `WikiResourceStatus` - Status indicators for wiki resources

### CSS Design System
- Custom design tokens for colors, spacing, typography
- Platform-specific color palette
- Responsive grid system
- Utility classes for common patterns
- Dark mode first design

## Target Audience

- ROM hackers and reverse engineers
- Retro game researchers and documenters
- Game preservation enthusiasts
- Speedrunners and glitch hunters

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

# Or use hot reload for development
dotnet watch run
```

The application will be available at:
- **HTTPS**: https://localhost:7044
- **HTTP**: http://localhost:5081

### Running Tests

```powershell
# Run all tests
dotnet test src/DarkRepos.Tests/DarkRepos.Tests.csproj

# Run with verbose output
dotnet test src/DarkRepos.Tests/DarkRepos.Tests.csproj --verbosity normal
```

**Current Test Coverage:**
- ✅ Core Models (Game, Tool, WikiResource, Platform)
- ✅ Database Services (DarkReposDbContext, FTS5 search)
- ✅ Content Services (IContentService implementation)
- ✅ Blazor Components (bUnit component tests)
- ✅ Search functionality (keyword, platform, category filtering)

### Code Quality

The project uses EditorConfig for consistent code formatting:
- **Tabs** for indentation (C#, Razor, CSS, JSON)
- **Spaces** for YAML and XML files
- **LF** line endings
- **UTF-8** encoding

```powershell
# Format code
dotnet format

# Build with style enforcement
dotnet build --configuration Release /p:EnforceCodeStyleInBuild=true
```

### CI/CD Pipeline

GitHub Actions workflow runs on push to main/develop and pull requests:
1. Restore dependencies
2. Build all projects
3. Run test suite
4. Report results

See [docs/](docs/) for comprehensive development documentation.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please follow the existing code style and include tests for new features.

## License

MIT License - See LICENSE file for details.
