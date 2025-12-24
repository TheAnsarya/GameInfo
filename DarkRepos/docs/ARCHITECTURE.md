# Dark Repos Website - Architecture

## System Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              DARK REPOS WEBSITE                              │
│                           https://darkrepos.com/                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐       │
│  │                  │    │                  │    │                  │       │
│  │   Blazor WASM    │◄──►│   Static Files   │    │    SQLite DB     │       │
│  │   (Client-Side)  │    │   (Pre-rendered) │    │  (Search Index)  │       │
│  │                  │    │                  │    │                  │       │
│  └────────┬─────────┘    └────────┬─────────┘    └────────┬─────────┘       │
│           │                       │                       │                  │
│           └───────────────────────┴───────────────────────┘                  │
│                                   │                                          │
│                      ┌────────────┴────────────┐                            │
│                      │                         │                            │
│                      │    Build Pipeline       │                            │
│                      │    (Content Ingest)     │                            │
│                      │                         │                            │
│                      └────────────┬────────────┘                            │
│                                   │                                          │
├───────────────────────────────────┼──────────────────────────────────────────┤
│                                   │                                          │
│  ┌────────────────────────────────┴────────────────────────────────────┐    │
│  │                         CONTENT SOURCES                              │    │
│  ├──────────────────┬──────────────────┬───────────────────────────────┤    │
│  │                  │                  │                               │    │
│  │  GameInfo/Wiki/  │  GameInfo/docs/  │  GameInfo/Games/             │    │
│  │  (Wiki Content)  │  (Documentation) │  (Game Data)                 │    │
│  │                  │                  │                               │    │
│  └──────────────────┴──────────────────┴───────────────────────────────┘    │
│                                                                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                           EXTERNAL RESOURCES                                 │
│                                                                              │
│  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐       │
│  │                  │    │                  │    │                  │       │
│  │  MediaWiki       │    │  GitHub Repos    │    │  Discord         │       │
│  │  games.dark...   │    │  (Downloads)     │    │  (Community)     │       │
│  │                  │    │                  │    │                  │       │
│  └──────────────────┘    └──────────────────┘    └──────────────────┘       │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Technology Stack

### Frontend

| Component | Technology | Version | Rationale |
|-----------|------------|---------|-----------|
| Framework | Blazor Interactive WebAssembly | .NET 9 | Modern SPA with C#, runs in browser |
| Rendering | Static SSG + Interactive | .NET 9 | Fast initial load, interactive features |
| Styling | Custom CSS | CSS3 | Lightweight, full control |
| Icons | SVG sprites | N/A | Accessible, scalable |
| Fonts | System fonts + Web fonts | Variable | Performance + readability |

### Backend (Build-Time)

| Component | Technology | Version | Rationale |
|-----------|------------|---------|-----------|
| Content Parser | Markdig | Latest | .NET Markdown parsing |
| Data Serialization | System.Text.Json | .NET 9 | Built-in, fast |
| Database | SQLite + EF Core | 9.x | Search indexing, lightweight |
| Build Tool | MSBuild | Latest | .NET native |

### Infrastructure

| Component | Technology | Rationale |
|-----------|------------|-----------|
| Hosting | TBD (Azure/GitHub/VPS) | Flexibility |
| CDN | TBD (Cloudflare) | Performance |
| SSL | Let's Encrypt | Free, automated |
| Domain | darkrepos.com | Existing |

---

## Application Architecture

### Blazor Project Structure

```
src/DarkRepos.Web/
├── DarkRepos.Web.csproj
├── Program.cs                    # Application entry point
├── App.razor                     # Root component
├── Routes.razor                  # Routing configuration
│
├── Components/                   # Razor components
│   ├── Layout/                   # Layout components
│   │   ├── MainLayout.razor      # Primary layout
│   │   ├── NavMenu.razor         # Navigation
│   │   ├── Header.razor          # Site header
│   │   └── Footer.razor          # Site footer
│   │
│   ├── Shared/                   # Reusable components
│   │   ├── GameCard.razor        # Game display card
│   │   ├── ToolCard.razor        # Tool display card
│   │   ├── SearchBox.razor       # Search input
│   │   ├── Breadcrumbs.razor     # Navigation breadcrumbs
│   │   ├── PlatformBadge.razor   # Platform indicator
│   │   └── ExternalLink.razor    # Accessible external link
│   │
│   └── Pages/                    # Page components
│       ├── Home.razor            # Landing page
│       ├── Games/
│       │   ├── Index.razor       # Games catalog
│       │   └── Detail.razor      # Game detail page
│       ├── Tools/
│       │   ├── Index.razor       # Tools catalog
│       │   └── Detail.razor      # Tool detail page
│       ├── Docs/
│       │   ├── Index.razor       # Documentation hub
│       │   └── Page.razor        # Documentation page
│       ├── Search.razor          # Search results
│       └── About.razor           # About page
│
├── Models/                       # Data models
│   ├── Game.cs                   # Game metadata
│   ├── Platform.cs               # Platform definition
│   ├── Tool.cs                   # Tool metadata
│   ├── Documentation.cs          # Doc page model
│   └── SearchResult.cs           # Search result model
│
├── Services/                     # Application services
│   ├── IContentService.cs        # Content retrieval interface
│   ├── ContentService.cs         # Content retrieval implementation
│   ├── ISearchService.cs         # Search interface
│   ├── SearchService.cs          # Search implementation
│   └── NavigationService.cs      # Navigation helpers
│
├── Data/                         # Data access
│   ├── AppDbContext.cs           # EF Core context
│   ├── SearchIndex.cs            # Search index entity
│   └── Migrations/               # EF Core migrations
│
├── wwwroot/                      # Static assets
│   ├── css/
│   │   ├── app.css               # Main stylesheet
│   │   ├── variables.css         # CSS custom properties
│   │   ├── typography.css        # Typography styles
│   │   ├── components.css        # Component styles
│   │   └── utilities.css         # Utility classes
│   ├── images/
│   │   ├── logo.svg              # Site logo
│   │   └── platforms/            # Platform icons
│   ├── fonts/                    # Web fonts
│   └── data/                     # Generated JSON data
│
└── Build/                        # Build-time tools
    ├── ContentGenerator.cs       # Generate static content
    ├── SearchIndexer.cs          # Build search index
    └── GameDataParser.cs         # Parse game metadata
```

---

## Data Flow

### Build-Time Content Generation

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  GameInfo/Wiki  │────►│  Content        │────►│  wwwroot/data/  │
│  (Wikitext)     │     │  Generator      │     │  (JSON)         │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                              │
                              │
                              ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  GameInfo/docs  │────►│  Markdown       │────►│  wwwroot/data/  │
│  (Markdown)     │     │  Parser         │     │  docs.json      │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                              │
                              │
                              ▼
                        ┌─────────────────┐     ┌─────────────────┐
                        │                 │     │                 │
                        │  Search         │────►│  search.db      │
                        │  Indexer        │     │  (SQLite)       │
                        │                 │     │                 │
                        └─────────────────┘     └─────────────────┘
```

### Runtime Data Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  User Request   │────►│  Blazor Router  │────►│  Page Component │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                       │
                                                       │
                              ┌─────────────────────────┤
                              │                         │
                              ▼                         ▼
                        ┌─────────────────┐     ┌─────────────────┐
                        │                 │     │                 │
                        │  ContentService │     │  SearchService  │
                        │  (HTTP + JSON)  │     │  (SQLite)       │
                        │                 │     │                 │
                        └─────────────────┘     └─────────────────┘
                              │                         │
                              ▼                         ▼
                        ┌─────────────────┐     ┌─────────────────┐
                        │                 │     │                 │
                        │  wwwroot/data/  │     │  search.db      │
                        │  (Static JSON)  │     │  (SQLite FTS5)  │
                        │                 │     │                 │
                        └─────────────────┘     └─────────────────┘
```

---

## URL Structure

| URL Pattern | Component | Description |
|-------------|-----------|-------------|
| `/` | Home.razor | Landing page |
| `/games` | Games/Index.razor | Games catalog |
| `/games/{platform}` | Games/Index.razor | Games by platform |
| `/games/{platform}/{slug}` | Games/Detail.razor | Game detail |
| `/tools` | Tools/Index.razor | Tools catalog |
| `/tools/{category}` | Tools/Index.razor | Tools by category |
| `/tools/{category}/{slug}` | Tools/Detail.razor | Tool detail |
| `/docs` | Docs/Index.razor | Documentation hub |
| `/docs/{path}` | Docs/Page.razor | Documentation page |
| `/search` | Search.razor | Search results |
| `/about` | About.razor | About page |

---

## Component Hierarchy

```
App.razor
└── Routes.razor
    └── MainLayout.razor
        ├── Header.razor
        │   ├── Logo
        │   ├── NavMenu.razor
        │   └── SearchBox.razor
        │
        ├── [Page Content]
        │   ├── Home.razor
        │   │   ├── HeroSection
        │   │   ├── FeaturedGames
        │   │   │   └── GameCard.razor[]
        │   │   └── QuickLinks
        │   │
        │   ├── Games/Index.razor
        │   │   ├── PlatformFilter
        │   │   │   └── PlatformBadge.razor[]
        │   │   └── GameGrid
        │   │       └── GameCard.razor[]
        │   │
        │   └── [Other Pages...]
        │
        └── Footer.razor
            ├── SiteLinks
            ├── ExternalLinks
            └── Copyright
```

---

## Accessibility Architecture

### ARIA Landmarks

```html
<body>
    <a class="skip-link" href="#main-content">Skip to main content</a>
    
    <header role="banner">
        <nav role="navigation" aria-label="Main navigation">
            <!-- Navigation items -->
        </nav>
    </header>
    
    <main id="main-content" role="main" tabindex="-1">
        <!-- Page content -->
    </main>
    
    <aside role="complementary" aria-label="Related resources">
        <!-- Sidebar if present -->
    </aside>
    
    <footer role="contentinfo">
        <!-- Footer content -->
    </footer>
</body>
```

### Focus Management

- Skip link to main content
- Focus trap in modal dialogs
- Focus restoration after navigation
- Visible focus indicators
- Logical tab order

### Keyboard Support

| Key | Action |
|-----|--------|
| Tab | Move to next focusable element |
| Shift+Tab | Move to previous focusable element |
| Enter/Space | Activate buttons and links |
| Escape | Close modals and dropdowns |
| Arrow keys | Navigate within components |
| Home/End | Jump to first/last item |

---

## Search Architecture

### SQLite FTS5 Index Schema

```sql
CREATE VIRTUAL TABLE search_index USING fts5(
    id,
    title,
    content,
    type,           -- 'game', 'tool', 'doc'
    platform,       -- 'nes', 'snes', etc.
    category,       -- tool category
    url,
    tokenize='porter'
);
```

### Search Query Flow

1. User enters search query
2. Query tokenized and sanitized
3. FTS5 MATCH query executed
4. Results ranked by relevance
5. Results grouped by type
6. Rendered with highlighted excerpts

---

## Caching Strategy

### Static Content

- Build-time generated JSON cached indefinitely
- Content-hash in filenames for cache busting
- Service worker for offline access (optional)

### Search Index

- SQLite database bundled with app
- Loaded into memory for fast queries
- Refreshed on each build

---

## Security Considerations

- No user authentication required
- All content is public
- No server-side state
- CSP headers for XSS prevention
- External links marked with `rel="noopener noreferrer"`

---

## Deployment Architecture

### Static Hosting Option (Recommended)

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  GitHub Actions │────►│  Build & Deploy │────►│  Static Host    │
│  (CI/CD)        │     │                 │     │  (Azure/GH/CF)  │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                       │
                                                       ▼
                                                ┌─────────────────┐
                                                │                 │
                                                │  CDN            │
                                                │  (Cloudflare)   │
                                                │                 │
                                                └─────────────────┘
```

### Container Option

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  GitHub Actions │────►│  Docker Build   │────►│  Container      │
│  (CI/CD)        │     │                 │     │  Registry       │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                       │
                                                       ▼
                                                ┌─────────────────┐
                                                │                 │
                                                │  VPS / Azure    │
                                                │  Container Apps │
                                                │                 │
                                                └─────────────────┘
```

---

*Last Updated: December 24, 2025*
