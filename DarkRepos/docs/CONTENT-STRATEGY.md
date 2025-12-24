# Dark Repos - Content Strategy

## Overview

This document defines how content is organized, sourced, and presented on the Dark Repos website.

---

## Content Sources

### Primary Sources

| Source | Location | Content Type |
|--------|----------|--------------|
| GameInfo Wiki | `/Wiki/` | Game documentation (wikitext) |
| GameInfo Docs | `/docs/` | Tool documentation (markdown) |
| GameInfo Games | `/Games/` | Game-specific assets and data |
| Game Metadata | `/Wiki/_meta/` | JSON metadata files |

### External Sources (Linked, Not Embedded)

| Source | URL | Usage |
|--------|-----|-------|
| MediaWiki | games.darkrepos.com | Full wiki pages |
| GitHub | github.com/TheAnsarya | Source code, downloads |
| Discord | discord.gg/... | Community (TBD) |

---

## Content Hierarchy

### Site Structure

```
darkrepos.com/
├── /                           # Home - overview, featured content
├── /games/                     # Games catalog
│   ├── /games/nes/            # NES games
│   ├── /games/snes/           # SNES games
│   ├── /games/gb/             # Game Boy games
│   ├── /games/gba/            # GBA games
│   └── /games/{platform}/{game}/  # Individual game pages
├── /tools/                     # Tools catalog
│   ├── /tools/graphics/       # Graphics tools
│   ├── /tools/text/           # Text tools
│   ├── /tools/rom/            # ROM tools
│   ├── /tools/analysis/       # Analysis tools
│   └── /tools/{category}/{tool}/  # Individual tool pages
├── /docs/                      # Documentation hub
│   ├── /docs/getting-started/
│   ├── /docs/formats/
│   └── /docs/{path}/
├── /search/                    # Search results
└── /about/                     # About the project
```

### Game Page Structure

Each game page includes:

1. **Header**
   - Game title and alternate title
   - Platform badge
   - Cover image (if available)
   - Quick stats (developer, publisher, release date)

2. **Overview**
   - Brief description
   - Documentation status indicator
   - Tags/categories

3. **Quick Links**
   - View on Wiki (games.darkrepos.com)
   - GitHub repository
   - Disassembly (if available)

4. **Subpages**
   - ROM Map
   - RAM Map
   - SRAM Map
   - TBL (Text Table)
   - Values
   - Other documentation

5. **Related Resources**
   - Related tools
   - External links

---

## Content Types

### Game Content

#### Index Page (`/games/`)

- Grid of game cards
- Platform filter tabs
- Search/filter capability
- Sort by name, status, platform

#### Platform Page (`/games/{platform}/`)

- Platform description
- All games for platform
- Platform-specific resources

#### Game Detail Page (`/games/{platform}/{slug}/`)

- Full game information
- All subpage links
- Documentation preview
- Tools relevant to this game

### Tool Content

#### Categories

| Category | Description | Examples |
|----------|-------------|----------|
| Graphics | CHR, sprite, palette tools | ChrEditor, PaletteAnalyzer |
| Text | Text extraction and editing | TextTable, StringExtractor |
| ROM | ROM manipulation tools | Checksum, RomExpander |
| Analysis | Code and data analysis | Disassembler, PatternDetector |
| Build | ROM building pipeline | AssetExtractor, Compression |
| Audio | Music and sound tools | SpcExtractor, AudioPlayer |
| Data | Data table editing | DataTableEditor, PointerTable |
| Utility | General utilities | AddressConverter, HexCalc |

#### Tool Page Structure

1. **Header**
   - Tool name
   - Category badge
   - Type indicator (CLI/GUI/Library)

2. **Description**
   - What it does
   - When to use it

3. **Usage**
   - Command-line examples
   - Configuration options
   - Input/output formats

4. **Download/Access**
   - GitHub link
   - Latest release
   - Requirements

5. **Related**
   - Similar tools
   - Supported games/platforms

### Documentation Content

#### Categories

- Getting Started
- Format Specifications
- Build Pipeline
- Tutorials
- API Reference

---

## Content Generation

### Build-Time Processing

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  Scan Wiki/     │────►│  Parse          │────►│  Generate       │
│  Directory      │     │  Index files    │     │  games.json     │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘

┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  Scan docs/     │────►│  Parse          │────►│  Generate       │
│  Directory      │     │  Markdown       │     │  docs.json      │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

### Game Metadata Schema

```json
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "required": ["id", "title", "platform", "slug"],
    "properties": {
        "id": { "type": "string" },
        "title": { "type": "string" },
        "altTitle": { "type": "string" },
        "platform": { 
            "type": "string",
            "enum": ["NES", "SNES", "GB", "GBC", "GBA", "Genesis"]
        },
        "slug": { "type": "string", "pattern": "^[a-z0-9-]+$" },
        "developer": { "type": "string" },
        "publisher": { "type": "string" },
        "releaseDate": { "type": "string", "format": "date" },
        "region": { "type": "string" },
        "status": {
            "type": "string",
            "enum": ["stub", "in-progress", "complete"]
        },
        "wikiUrl": { "type": "string", "format": "uri" },
        "githubUrl": { "type": "string", "format": "uri" },
        "tags": {
            "type": "array",
            "items": { "type": "string" }
        },
        "subpages": {
            "type": "array",
            "items": {
                "type": "object",
                "required": ["title", "slug", "wikiUrl"],
                "properties": {
                    "title": { "type": "string" },
                    "slug": { "type": "string" },
                    "wikiUrl": { "type": "string", "format": "uri" },
                    "type": { "type": "string" }
                }
            }
        }
    }
}
```

### Automatic Metadata Extraction

From wiki index files, extract:
- Title from `{{Infobox game|title=...}}`
- Platform from folder structure
- Developer/Publisher from infobox
- Subpages from file list

---

## URL Conventions

### Slugification Rules

1. Lowercase all characters
2. Replace spaces with hyphens
3. Remove special characters except hyphens
4. Collapse multiple hyphens
5. Trim leading/trailing hyphens

**Examples:**
- "Dragon Warrior IV (NES)" → `dragon-warrior-iv`
- "Final Fantasy: Mystic Quest" → `final-fantasy-mystic-quest`
- "7th Saga, The" → `7th-saga`

### Platform Codes

| Platform | Code | URL Segment |
|----------|------|-------------|
| NES | nes | `/games/nes/` |
| SNES | snes | `/games/snes/` |
| Game Boy | gb | `/games/gb/` |
| Game Boy Color | gbc | `/games/gbc/` |
| Game Boy Advance | gba | `/games/gba/` |
| Sega Genesis | genesis | `/games/genesis/` |

---

## Content Status Indicators

### Documentation Status

| Status | Badge Color | Criteria |
|--------|-------------|----------|
| Complete | Green | All major sections documented |
| In Progress | Yellow | Partial documentation exists |
| Stub | Red | Minimal or no content |

### Page Status

- **Has ROM Map**: ROM structure documented
- **Has RAM Map**: Runtime memory documented
- **Has TBL**: Text table available
- **Has Disassembly**: Source code available

---

## Wiki Integration

### Link Patterns

```
Wiki URL Pattern: https://games.darkrepos.com/wiki/{Game_Name}_{Platform}/{Subpage}

Examples:
- https://games.darkrepos.com/wiki/Dragon_Warrior_IV_(NES)
- https://games.darkrepos.com/wiki/Dragon_Warrior_IV_(NES)/ROM_Map
- https://games.darkrepos.com/wiki/Soul_Blazer_(SNES)/RAM_Map
```

### Link Generation

```csharp
public static string GenerateWikiUrl(string gameTitle, Platform platform, string? subpage = null)
{
    var baseName = $"{gameTitle.Replace(" ", "_")}_({platform})";
    var url = $"https://games.darkrepos.com/wiki/{baseName}";
    
    return subpage is not null 
        ? $"{url}/{subpage.Replace(" ", "_")}" 
        : url;
}
```

---

## Search Content

### Indexed Fields

| Field | Weight | Source |
|-------|--------|--------|
| Title | 10x | Game/tool name |
| Alt Title | 8x | Alternate names |
| Description | 5x | Overview text |
| Content | 1x | Full page content |
| Tags | 3x | Category tags |

### Search Result Display

Each search result shows:
1. Title with type badge
2. Excerpt with highlighted matches
3. URL breadcrumb
4. Relevance indicator

---

## Content Updates

### Sync Workflow

1. GameInfo Wiki content updated
2. Build pipeline triggered
3. Content generator runs
4. Search index rebuilt
5. Website deployed

### Update Frequency

- **Manual trigger**: On significant content changes
- **Scheduled**: Daily or weekly builds
- **On push**: When Wiki folder changes

---

## Accessibility Content Requirements

### Images

- All images must have `alt` text
- Decorative images use `alt=""`
- Complex images have extended descriptions

### Links

- Link text must be descriptive
- No "click here" or "read more" alone
- External links marked as such

### Structure

- Proper heading hierarchy (h1 → h2 → h3)
- Skip links at page start
- Landmark regions defined

---

*Last Updated: December 24, 2025*
