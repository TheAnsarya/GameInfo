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

- **Framework**: .NET 9 / Blazor (Interactive WebAssembly with Server prerendering)
- **Styling**: CSS with custom design system (no heavy frameworks)
- **Build**: Static content generation from GameInfo repo files
- **Database**: SQLite with EF Core (for search indexing)
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

See [docs/](docs/) for comprehensive development documentation.

## License

MIT License - See LICENSE file for details.
