# Dark Repos Documentation Index

Welcome to the Dark Repos project documentation. This index provides links to all project documentation files.

---

## Quick Links

| Document | Description |
|----------|-------------|
| [README](../README.md) | Project overview and introduction |
| [ROADMAP](ROADMAP.md) | Development phases and timeline |
| [ARCHITECTURE](ARCHITECTURE.md) | System design and technical structure |
| [DESIGN-SYSTEM](DESIGN-SYSTEM.md) | Visual design language and CSS |
| [TECHNICAL-SPECS](TECHNICAL-SPECS.md) | Code specifications and data models |
| [CONTENT-STRATEGY](CONTENT-STRATEGY.md) | Content organization and generation |
| [ACCESSIBILITY](ACCESSIBILITY.md) | WCAG compliance and implementation |

---

## Documentation Overview

### Project Foundation

#### [README.md](../README.md)
The project entry point containing:
- Project overview and purpose
- Technology stack summary
- Key features list
- Folder structure
- Getting started information

#### [ROADMAP.md](ROADMAP.md)
Development timeline with:
- 5 development phases over 20 weeks
- Milestones and deliverables per phase
- Success metrics
- Risk assessment and mitigation

---

### Technical Documentation

#### [ARCHITECTURE.md](ARCHITECTURE.md)
System architecture covering:
- High-level system overview diagrams
- Technology stack decisions
- Blazor project structure
- Data flow between components
- URL structure and routing
- Component hierarchy
- Search architecture
- Deployment options

#### [TECHNICAL-SPECS.md](TECHNICAL-SPECS.md)
Implementation specifications including:
- Platform requirements (.NET 9, browsers)
- Solution and project structure
- NuGet package dependencies
- C# data models (Game, Tool, SearchDocument)
- Service interfaces (IContentService, ISearchService)
- Database schema (SQLite FTS5)
- Build pipeline configuration
- Performance budgets
- Error handling patterns
- Testing strategy

---

### Design Documentation

#### [DESIGN-SYSTEM.md](DESIGN-SYSTEM.md)
Complete visual design language:
- Color palette with CSS custom properties
- Typography scale and font families
- Spacing system
- Component styles (cards, buttons, badges)
- Responsive breakpoints
- Motion and animation guidelines
- Dark theme implementation

#### [ACCESSIBILITY.md](ACCESSIBILITY.md)
Accessibility compliance guide:
- WCAG 2.1 AA/AAA targets
- Semantic HTML patterns
- Keyboard navigation requirements
- Focus management
- Color contrast requirements
- ARIA patterns and examples
- Screen reader considerations
- Testing checklist

---

### Content Documentation

#### [CONTENT-STRATEGY.md](CONTENT-STRATEGY.md)
Content organization strategy:
- Content sources (Wiki, docs, Games folders)
- Site structure and URL hierarchy
- Game and tool page structures
- Content generation workflow
- Metadata JSON schema
- URL conventions and slugification
- Platform code mappings
- Wiki integration patterns
- Search field weighting

---

## Document Relationships

```
README.md
    │
    ├── ROADMAP.md          (What we're building, when)
    │
    ├── ARCHITECTURE.md     (How it's structured)
    │       │
    │       └── TECHNICAL-SPECS.md  (Implementation details)
    │
    ├── DESIGN-SYSTEM.md    (How it looks)
    │       │
    │       └── ACCESSIBILITY.md    (Inclusive design)
    │
    └── CONTENT-STRATEGY.md (What content, how organized)
```

---

## Contributing to Documentation

When updating documentation:

1. **Keep documents focused** - Each document has a specific purpose
2. **Cross-reference** - Link to related documents when appropriate
3. **Update the index** - Add new documents to this index
4. **Use consistent formatting** - Follow existing Markdown conventions
5. **Date changes** - Update "Last Updated" at bottom of files

---

## GitHub Issues

Project tracking is done through GitHub Issues:

- **Epic Issue**: Main project tracking issue
- **Phase Issues**: One issue per development phase
- **Task Issues**: Individual tasks within phases

See the [GitHub Projects board](https://github.com/xprism1/GameInfo/projects) for current status.

---

*Last Updated: December 24, 2025*
