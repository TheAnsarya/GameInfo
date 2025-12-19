# DarkRepos Wiki Content

This directory contains wikitext files for the **games.darkrepos.com** wiki.

## Directory Structure

```text
Wiki/games.darkrepos.com/
├── _meta/                              # Wiki infrastructure
│   ├── Main_Page.wikitext              # Wiki home page
│   ├── Categories/                     # Category pages
│   │   ├── NES_Games.wikitext
│   │   ├── SNES_Games.wikitext
│   │   └── GBA_Games.wikitext
│   └── Templates/                      # Reusable templates
│       ├── Infobox_game.wikitext       # Game info box
│       ├── navbox.wikitext             # Navigation bar
│       ├── platform.wikitext           # Platform tech specs
│       ├── rommap.wikitext             # ROM map header
│       ├── rammap.wikitext             # RAM map header
│       ├── srammap.wikitext            # SRAM map header
│       ├── TBL.wikitext                # Text table header
│       └── subpage.wikitext            # Subpage links
├── NES/                                # NES games
│   ├── Dragon_Warrior/
│   │   ├── index.wikitext              # Main page
│   │   ├── ROM_Map.wikitext
│   │   ├── RAM_Map.wikitext
│   │   ├── SRAM_Map.wikitext
│   │   ├── TBL.wikitext
│   │   ├── Values.wikitext
│   │   ├── Battle_System.wikitext
│   │   ├── Experience_System.wikitext
│   │   └── Monster_Data.wikitext
│   ├── Dragon_Warrior_II/
│   ├── Dragon_Warrior_III/
│   ├── Dragon_Warrior_IV/
│   │   ├── index.wikitext
│   │   ├── ROM_Map.wikitext
│   │   ├── RAM_Map.wikitext
│   │   ├── SRAM_Map.wikitext
│   │   ├── TBL.wikitext
│   │   ├── Values/
│   │   │   ├── index.wikitext
│   │   │   └── Extra_Companions.wikitext
│   │   ├── Known_Dumps.wikitext
│   │   ├── Map_List.wikitext
│   │   └── Sub-pages.wikitext
│   ├── Kirbys_Adventure/
│   ├── Mappy-Land/
│   └── Yoshis_Cookie/
├── SNES/                               # SNES games
│   ├── Chrono_Trigger/
│   ├── Dragon_Quest_I_II/
│   ├── Dragon_Quest_III/
│   │   ├── index.wikitext
│   │   ├── ROM_Map.wikitext
│   │   ├── ROM_Map/
│   │   │   ├── Character_Classes.wikitext
│   │   │   ├── Monsters.wikitext
│   │   │   └── Personality.wikitext
│   │   ├── RAM_Map.wikitext
│   │   ├── RAM_Map/
│   │   │   ├── Events.wikitext
│   │   │   ├── Party_Members.wikitext
│   │   │   └── Treasures.wikitext
│   │   ├── TBL.wikitext
│   │   ├── Values.wikitext
│   │   └── Values/
│   │       └── Spells.wikitext
│   ├── Final_Fantasy_IV/
│   ├── Final_Fantasy_Mystic_Quest/
│   │   ├── index.wikitext
│   │   ├── ROM_Map.wikitext
│   │   ├── RAM_Map.wikitext
│   │   ├── SRAM_Map.wikitext
│   │   ├── TBL/
│   │   │   ├── index.wikitext
│   │   │   ├── English.wikitext
│   │   │   ├── French.wikitext
│   │   │   ├── German.wikitext
│   │   │   └── Japanese.wikitext
│   │   └── Values/
│   │       ├── index.wikitext
│   │       └── Window_Colors.wikitext
│   └── The_7th_Saga/
└── GBA/                                # GBA games
    └── Yu-Gi-Oh_Eternal_Duelist_Soul/
```

## URL/Path Convention

Pages are organized by platform, then game name (without platform suffix):

- **Main pages**: `{Platform}/{Game}/index.wikitext`
- **Sub-pages**: `{Platform}/{Game}/{SubPage}.wikitext`
- **Nested sub-pages**: `{Platform}/{Game}/{Category}/{SubPage}.wikitext`

### Examples

| Wiki URL | File Path |
|----------|-----------|
| `NES/Dragon_Warrior` | `NES/Dragon_Warrior/index.wikitext` |
| `NES/Dragon_Warrior/ROM_Map` | `NES/Dragon_Warrior/ROM_Map.wikitext` |
| `SNES/Dragon_Quest_III/Values/Spells` | `SNES/Dragon_Quest_III/Values/Spells.wikitext` |

## Content Status

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
