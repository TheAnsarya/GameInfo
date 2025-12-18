# DarkRepos Wiki Content

This directory contains wikitext files for the **games.darkrepos.com** wiki.

## Directory Structure

All files are in MediaWiki wikitext format (`.wikitext` extension).

### File Naming Convention

- **Main pages**: `Game_Name_(Platform).wikitext`
- **Sub-pages**: `Game_Name_(Platform)_-_Sub_Page.wikitext`
- **Categories**: `Category_Category_Name.wikitext`
- **Templates**: `Template_Template_Name.wikitext`

## Content Overview

### NES Games

| Game | Main Page | ROM Map | RAM Map | TBL | Values |
|------|-----------|---------|---------|-----|--------|
| Dragon Warrior | ✅ | ✅ | ❌ | ❌ | ❌ |
| Dragon Warrior II | ✅ | ❌ | ❌ | ❌ | ❌ |
| Dragon Warrior III | ✅ | ❌ | ❌ | ❌ | ❌ |
| Dragon Warrior IV | ✅ | ✅ | ✅ | ✅ | ✅ |
| Kirby's Adventure | ✅ | ❌ | ❌ | ❌ | ❌ |
| Mappy-Land | ✅ | ❌ | ❌ | ❌ | ❌ |
| Yoshi's Cookie | ✅ | ❌ | ❌ | ❌ | ❌ |

### SNES Games

| Game | Main Page | ROM Map | RAM Map | TBL | Values |
|------|-----------|---------|---------|-----|--------|
| Chrono Trigger | ✅ | ❌ | ❌ | ❌ | ❌ |
| Dragon Quest I & II | ✅ | ❌ | ❌ | ❌ | ❌ |
| Dragon Quest III | ✅ | ❌ | ❌ | ❌ | ❌ |
| Final Fantasy IV | ✅ | ❌ | ❌ | ❌ | ❌ |
| Final Fantasy Mystic Quest | ✅ | ❌ | ❌ | ❌ | ❌ |
| The 7th Saga | ✅ | ❌ | ❌ | ❌ | ❌ |

### GBA Games

| Game | Main Page | ROM Map | RAM Map | TBL | Values |
|------|-----------|---------|---------|-----|--------|
| Yu-Gi-Oh! EDS | ✅ | ❌ | ❌ | ❌ | ❌ |

### Templates

- `Template_Infobox_game.wikitext` - Game information box
- `Template_rommap.wikitext` - ROM map header
- `Template_rammap.wikitext` - RAM map header
- `Template_TBL.wikitext` - Text table header
- `Template_subpage.wikitext` - Sub-page linking

### Categories

- `Category_NES_Games.wikitext` - NES platform overview
- `Category_SNES_Games.wikitext` - SNES platform overview
- `Category_GBA_Games.wikitext` - GBA platform overview

## Upload Process

These files are designed to be uploaded to a MediaWiki installation using the GameInfoTools Wiki library.

### Manual Upload

1. Navigate to the wiki
2. Create each page with the corresponding filename (without `.wikitext` extension)
3. Copy the content from the wikitext file

### Automated Upload

Use the GameInfoTools Wiki sync functionality:

```csharp
var manager = new WikiSyncManager(wikiUrl, username, password);
await manager.SyncDirectoryAsync("Wiki/games.darkrepos.com");
```

## Contributing

When adding new content:

1. Follow the naming conventions above
2. Use the appropriate templates
3. Include category tags at the bottom of each page
4. Update this README with the new content status

## License

All content is available under CC BY-SA 4.0 unless otherwise noted.
