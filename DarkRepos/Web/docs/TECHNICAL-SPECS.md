# Dark Repos - Technical Specifications

## Platform Requirements

### Development Environment

| Requirement | Version | Notes |
|-------------|---------|-------|
| .NET SDK | 9.0+ | Latest LTS |
| Visual Studio 2022 | 17.8+ | Or VS Code with C# Dev Kit |
| Node.js | 20 LTS | For build tooling if needed |
| SQLite | 3.40+ | Search database |

### Runtime Requirements

| Environment | Requirements |
|-------------|-------------|
| Browser (WASM) | Chrome 88+, Firefox 78+, Safari 14+, Edge 88+ |
| Server (if used) | .NET 9 Runtime, 512MB RAM minimum |

### Accessibility Requirements

| Standard | Level | Description |
|----------|-------|-------------|
| WCAG 2.1 | AA | Minimum compliance |
| WCAG 2.1 | AAA | Target for text contrast |
| Section 508 | Full | US accessibility law |
| ARIA 1.2 | Full | Screen reader support |

---

## Project Configuration

### Solution Structure

```
DarkRepos/
├── DarkRepos.sln
├── src/
│   ├── DarkRepos.Web/           # Main Blazor application
│   │   ├── DarkRepos.Web.csproj
│   │   └── ...
│   ├── DarkRepos.Core/          # Shared models and services
│   │   ├── DarkRepos.Core.csproj
│   │   └── ...
│   └── DarkRepos.Build/         # Build-time content generation
│       ├── DarkRepos.Build.csproj
│       └── ...
├── tests/
│   ├── DarkRepos.Web.Tests/
│   └── DarkRepos.Core.Tests/
└── tools/
    └── content-sync/            # Scripts for syncing content
```

### NuGet Packages

```xml
<!-- DarkRepos.Web.csproj -->
<ItemGroup>
    <!-- Blazor Framework -->
    <PackageReference Include="Microsoft.AspNetCore.Components.WebAssembly" Version="9.0.*" />
    <PackageReference Include="Microsoft.AspNetCore.Components.WebAssembly.Server" Version="9.0.*" />
    
    <!-- Database -->
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="9.0.*" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="9.0.*" />
    
    <!-- Content Processing -->
    <PackageReference Include="Markdig" Version="0.34.*" />
    
    <!-- Logging -->
    <PackageReference Include="Serilog.AspNetCore" Version="8.0.*" />
</ItemGroup>

<!-- DarkRepos.Core.csproj -->
<ItemGroup>
    <PackageReference Include="System.Text.Json" Version="9.0.*" />
</ItemGroup>

<!-- DarkRepos.Build.csproj -->
<ItemGroup>
    <PackageReference Include="Markdig" Version="0.34.*" />
    <PackageReference Include="Microsoft.Data.Sqlite" Version="9.0.*" />
</ItemGroup>
```

---

## Data Models

### Game Model

```csharp
namespace DarkRepos.Core.Models;

public sealed record Game
{
    public required string Id { get; init; }
    public required string Title { get; init; }
    public string? AltTitle { get; init; }
    public required Platform Platform { get; init; }
    public required string Slug { get; init; }
    
    public string? Developer { get; init; }
    public string? Publisher { get; init; }
    public DateOnly? ReleaseDate { get; init; }
    public string? Region { get; init; }
    
    public string? Description { get; init; }
    public string? ImageUrl { get; init; }
    
    public string? WikiUrl { get; init; }
    public string? GitHubUrl { get; init; }
    public string? RomMapUrl { get; init; }
    public string? RamMapUrl { get; init; }
    
    public DocumentationStatus Status { get; init; } = DocumentationStatus.Stub;
    public IReadOnlyList<string> Tags { get; init; } = [];
    public IReadOnlyList<GameSubpage> Subpages { get; init; } = [];
}

public sealed record GameSubpage
{
    public required string Title { get; init; }
    public required string Slug { get; init; }
    public required string WikiUrl { get; init; }
    public SubpageType Type { get; init; }
}

public enum Platform
{
    NES,
    SNES,
    GB,
    GBC,
    GBA,
    Genesis,
    MasterSystem,
    GameGear
}

public enum DocumentationStatus
{
    Stub,
    InProgress,
    Complete
}

public enum SubpageType
{
    RomMap,
    RamMap,
    SramMap,
    Tbl,
    Values,
    Enemies,
    Items,
    Characters,
    Notes,
    Other
}
```

### Tool Model

```csharp
namespace DarkRepos.Core.Models;

public sealed record Tool
{
    public required string Id { get; init; }
    public required string Name { get; init; }
    public required string Slug { get; init; }
    public required ToolCategory Category { get; init; }
    
    public string? Description { get; init; }
    public string? Documentation { get; init; }  // Markdown content
    public string? GitHubUrl { get; init; }
    public string? DownloadUrl { get; init; }
    
    public ToolType Type { get; init; } = ToolType.CLI;
    public IReadOnlyList<string> Languages { get; init; } = [];
    public IReadOnlyList<Platform> SupportedPlatforms { get; init; } = [];
    public IReadOnlyList<string> Tags { get; init; } = [];
}

public enum ToolCategory
{
    Graphics,
    Text,
    Rom,
    Analysis,
    Disassembly,
    Build,
    Audio,
    Data,
    Utility
}

public enum ToolType
{
    CLI,
    GUI,
    Library,
    Script
}
```

### Search Index Model

```csharp
namespace DarkRepos.Core.Models;

public sealed record SearchDocument
{
    public required string Id { get; init; }
    public required string Title { get; init; }
    public required string Content { get; init; }
    public required SearchDocumentType Type { get; init; }
    public required string Url { get; init; }
    
    public string? Platform { get; init; }
    public string? Category { get; init; }
    public string? Excerpt { get; init; }
}

public enum SearchDocumentType
{
    Game,
    Tool,
    Documentation,
    WikiPage
}
```

---

## API Contracts

### Content Service

```csharp
namespace DarkRepos.Core.Services;

public interface IContentService
{
    // Games
    Task<IReadOnlyList<Game>> GetAllGamesAsync(CancellationToken ct = default);
    Task<IReadOnlyList<Game>> GetGamesByPlatformAsync(Platform platform, CancellationToken ct = default);
    Task<Game?> GetGameBySlugAsync(Platform platform, string slug, CancellationToken ct = default);
    
    // Tools
    Task<IReadOnlyList<Tool>> GetAllToolsAsync(CancellationToken ct = default);
    Task<IReadOnlyList<Tool>> GetToolsByCategoryAsync(ToolCategory category, CancellationToken ct = default);
    Task<Tool?> GetToolBySlugAsync(ToolCategory category, string slug, CancellationToken ct = default);
    
    // Documentation
    Task<DocumentationPage?> GetDocumentationAsync(string path, CancellationToken ct = default);
    Task<IReadOnlyList<DocumentationNode>> GetDocumentationTreeAsync(CancellationToken ct = default);
}
```

### Search Service

```csharp
namespace DarkRepos.Core.Services;

public interface ISearchService
{
    Task<SearchResults> SearchAsync(
        string query, 
        SearchFilters? filters = null,
        int page = 1,
        int pageSize = 20,
        CancellationToken ct = default);
    
    Task<IReadOnlyList<string>> GetSuggestionsAsync(
        string prefix,
        int limit = 10,
        CancellationToken ct = default);
}

public sealed record SearchResults
{
    public required IReadOnlyList<SearchResult> Items { get; init; }
    public required int TotalCount { get; init; }
    public required int Page { get; init; }
    public required int PageSize { get; init; }
    public required TimeSpan QueryTime { get; init; }
}

public sealed record SearchResult
{
    public required string Id { get; init; }
    public required string Title { get; init; }
    public required string Excerpt { get; init; }
    public required string Url { get; init; }
    public required SearchDocumentType Type { get; init; }
    public required double Score { get; init; }
    public IReadOnlyList<string> Highlights { get; init; } = [];
}

public sealed record SearchFilters
{
    public SearchDocumentType? Type { get; init; }
    public Platform? Platform { get; init; }
    public ToolCategory? ToolCategory { get; init; }
}
```

---

## Database Schema

### SQLite FTS5 for Search

```sql
-- Search index using FTS5 for full-text search
CREATE VIRTUAL TABLE IF NOT EXISTS search_index USING fts5(
    id UNINDEXED,
    title,
    content,
    type UNINDEXED,
    platform UNINDEXED,
    category UNINDEXED,
    url UNINDEXED,
    tokenize='porter unicode61'
);

-- Standard table for metadata queries
CREATE TABLE IF NOT EXISTS documents (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    type TEXT NOT NULL,
    platform TEXT,
    category TEXT,
    url TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_documents_type ON documents(type);
CREATE INDEX IF NOT EXISTS idx_documents_platform ON documents(platform);
CREATE INDEX IF NOT EXISTS idx_documents_category ON documents(category);
```

---

## Build Pipeline

### Content Generation Flow

```yaml
# .github/workflows/build.yml (conceptual)
name: Build and Deploy

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup .NET
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '9.0.x'
      
      - name: Generate Content
        run: dotnet run --project tools/DarkRepos.Build -- generate
        
      - name: Build Search Index
        run: dotnet run --project tools/DarkRepos.Build -- index
        
      - name: Build Website
        run: dotnet publish src/DarkRepos.Web -c Release -o dist
        
      - name: Deploy
        # Deploy to hosting provider
```

### Content Generation Tool

```csharp
// DarkRepos.Build/Program.cs
using DarkRepos.Build;

var app = ConsoleApp.Create(args);

app.AddCommand("generate", async () =>
{
    var generator = new ContentGenerator();
    await generator.GenerateGamesAsync("../../Wiki");
    await generator.GenerateToolsAsync("../../docs");
    Console.WriteLine("Content generated successfully.");
});

app.AddCommand("index", async () =>
{
    var indexer = new SearchIndexer();
    await indexer.BuildIndexAsync("../DarkRepos.Web/wwwroot/data");
    Console.WriteLine("Search index built successfully.");
});

await app.RunAsync();
```

---

## Performance Budgets

| Metric | Budget | Measurement |
|--------|--------|-------------|
| First Contentful Paint | < 1.5s | Lighthouse |
| Largest Contentful Paint | < 2.5s | Lighthouse |
| Time to Interactive | < 3.5s | Lighthouse |
| Total Blocking Time | < 300ms | Lighthouse |
| Cumulative Layout Shift | < 0.1 | Lighthouse |
| JavaScript Bundle Size | < 500KB | Build output |
| CSS Bundle Size | < 50KB | Build output |
| HTML Document Size | < 100KB | Build output |

---

## Error Handling

### Error Types

```csharp
namespace DarkRepos.Core.Exceptions;

public abstract class DarkReposException : Exception
{
    protected DarkReposException(string message) : base(message) { }
    protected DarkReposException(string message, Exception inner) : base(message, inner) { }
}

public sealed class ContentNotFoundException : DarkReposException
{
    public ContentNotFoundException(string contentType, string identifier)
        : base($"{contentType} not found: {identifier}") { }
}

public sealed class SearchException : DarkReposException
{
    public SearchException(string message, Exception inner)
        : base($"Search error: {message}", inner) { }
}
```

### Error Handling Strategy

1. **404 Pages**: Custom not-found page with helpful navigation
2. **Search Errors**: Graceful degradation, show partial results
3. **Load Failures**: Retry with exponential backoff
4. **Build Errors**: Fail fast, detailed logging

---

## Testing Strategy

### Unit Tests

```csharp
// Example test structure
namespace DarkRepos.Core.Tests;

public class ContentServiceTests
{
    [Fact]
    public async Task GetGameBySlug_ExistingGame_ReturnsGame()
    {
        // Arrange
        var service = CreateService();
        
        // Act
        var result = await service.GetGameBySlugAsync(Platform.NES, "dragon-warrior");
        
        // Assert
        Assert.NotNull(result);
        Assert.Equal("Dragon Warrior", result.Title);
    }
}
```

### Test Coverage Targets

| Area | Target | Priority |
|------|--------|----------|
| Core Services | 90% | High |
| Data Models | 100% | High |
| Components | 80% | Medium |
| Build Tools | 85% | High |

---

## Security Considerations

### Content Security Policy

```html
<meta http-equiv="Content-Security-Policy" content="
    default-src 'self';
    script-src 'self' 'wasm-unsafe-eval';
    style-src 'self' 'unsafe-inline';
    img-src 'self' data: https:;
    font-src 'self';
    connect-src 'self' https://api.github.com;
">
```

### External Link Handling

All external links must:
- Use `rel="noopener noreferrer"`
- Open in new tab with `target="_blank"`
- Display external link indicator
- Be validated at build time

---

## Logging and Monitoring

### Logging Levels

| Level | Usage |
|-------|-------|
| Debug | Development only, verbose |
| Information | Normal operations |
| Warning | Potential issues |
| Error | Operation failures |
| Critical | Application failures |

### Metrics to Track

- Page load times
- Search query performance
- Error rates
- Popular content
- Browser/device distribution

---

*Last Updated: December 24, 2025*
