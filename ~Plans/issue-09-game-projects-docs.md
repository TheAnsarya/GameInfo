---
name: Documentation - Game Projects Section
about: Add game projects index to Atari-2600/README.md
title: 'Document game projects in Atari 2600 README'
labels: documentation, atari2600, high-priority
assignees: ''
milestone: 'Milestone 2: Multi-Game Support'
---

## Overview

Add a comprehensive "Game Projects" section to `docs/Atari-2600/README.md` that indexes all game projects in the `Atari2600/` directory.

## Content to Add

### 1. Game Projects Section

Add to table of contents:
```markdown
- [Game Projects](#game-projects)
```

### 2. Game Projects Table

```markdown
## 🎮 Game Projects

Individual game projects with disassembled source code, extracted assets, and build configurations.

| Game | Year | Publisher | Region | Size | Mapper | Status | Source | Builds |
|------|------|-----------|--------|------|--------|--------|--------|--------|
| [Adventure](../../Atari2600/Adventure%20(1978)%20(Atari)%20[PAL]/) | 1978 | Atari | PAL | 4KB | None | ✅ Disassembled | [adventure.pasm](../../Atari2600/Adventure%20(1978)%20(Atari)%20[PAL]/source/adventure.pasm) | 88 blocks |
| [Combat](../../Atari2600/Combat%20(1977)%20(Atari)%20[NTSC]/) | 1977 | Atari | NTSC | 2KB | None | ⏸️ Planned | - | - |
| [Space Invaders](../../Atari2600/Space%20Invaders%20(1980)%20(Atari)%20[NTSC]/) | 1980 | Atari | NTSC | 4KB | None | ⏸️ Planned | - | - |
| [Ms. Pac-Man](../../Atari2600/Ms.%20Pac-Man%20(1983)%20(Atari)%20[NTSC]/) | 1983 | Atari | NTSC | 16KB | F6 | ⏸️ Planned | - | - |
| [Pitfall II](../../Atari2600/Pitfall%20II%20(1984)%20(Activision)%20[NTSC]/) | 1984 | Activision | NTSC | 10KB | DPC | ❌ DPC Bug | - | - |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

### Status Legend

- ✅ **Disassembled**: Source code extracted and verified
- ⏸️ **Planned**: Scheduled for disassembly
- 🔨 **In Progress**: Currently being analyzed
- ❌ **Blocked**: Technical issues preventing analysis
- 🎯 **Roundtrip**: Successfully reassembles to original ROM
```

### 3. Quick Links

```markdown
### Quick Start

```bash
# Browse game projects
cd Atari2600/

# Disassemble a new game
peony disasm "path/to/rom.a26" -o "Atari2600/<Game>/source/<game>.pasm"

# Build from source (when Poppy support is complete)
poppy build "Atari2600/<Game>/source/<game>.pasm" -o "Atari2600/<Game>/builds/<game>.a26"

# Verify roundtrip
peony verify "original.a26" --reassembled "Atari2600/<Game>/builds/<game>.a26"
```

### Directory Structure

Each game project follows this structure:

```
<Game Title> (<Year>) (<Publisher>) [<Region>]/
├── README.md          # ROM information, build instructions, status
├── source/            # Disassembled .pasm source code
│   └── <game>.pasm    # Main disassembly file
├── assets/            # Extracted graphics, audio, data
│   ├── graphics/      # Sprites, playfields, colors
│   ├── audio/         # Sound effects, music data
│   └── data/          # Levels, patterns, tables
├── builds/            # Assembled .a26 ROM files
│   └── <game>.a26     # Built ROM (matches original)
├── wiki/              # DarkRepos wikitext for games.darkrepos.com
│   ├── ROM-Map.wikitext
│   ├── RAM-Map.wikitext
│   └── Data-Structures.wikitext
└── docs/              # Game-specific technical documentation
    ├── mechanics.md   # Gameplay mechanics analysis
    ├── graphics.md    # Graphics system documentation
    └── audio.md       # Audio engine documentation
```

### Contributing

To add a new game project:

1. Create directory structure (see template above)
2. Disassemble ROM using Peony
3. Document ROM info in README.md
4. Extract assets (optional)
5. Submit pull request with updates to this table
```

## Implementation

### 1. Update README.md

Insert the new section after "Bank Switching Schemes" section.

### 2. Generate Table Rows

For each game in `Atari2600/` directory:
- Parse README.md for metadata
- Count source file lines/blocks
- Determine status from checklist
- Format table row

### 3. Automation Script (Optional)

Create `scripts/update-game-projects-table.ps1`:

```powershell
# Scan Atari2600/ directory
$games = Get-ChildItem "Atari2600" -Directory

$rows = @()
foreach ($game in $games) {
	$readme = Get-Content "$($game.FullName)/README.md" -Raw
	
	# Parse metadata
	$title = $game.Name
	$year = [regex]::Match($title, '\((\d{4})\)').Groups[1].Value
	# ... parse other fields
	
	# Generate row
	$row = "| [$title](../../Atari2600/$([uri]::EscapeDataString($title))/) | $year | ... |"
	$rows += $row
}

# Update README.md with generated table
```

## Acceptance Criteria

- [ ] "Game Projects" section added to README.md
- [ ] Table includes all games in `Atari2600/` directory
- [ ] Links work correctly (URL-encoded for spaces/special chars)
- [ ] Status icons accurate (✅ ⏸️ 🔨 ❌ 🎯)
- [ ] Directory structure diagram is clear
- [ ] Quick start examples are correct
- [ ] Contributing guidelines are helpful

## Example Table Row

```markdown
| [Adventure](../../Atari2600/Adventure%20(1978)%20(Atari)%20[PAL]/) | 1978 | Atari | PAL | 4KB | None | ✅ Disassembled | [adventure.pasm](../../Atari2600/Adventure%20(1978)%20(Atari)%20[PAL]/source/adventure.pasm) | 88 blocks |
```

Renders as:
| Game | Year | Publisher | Region | Size | Mapper | Status | Source | Blocks |
|------|------|-----------|--------|------|--------|--------|--------|--------|
| Adventure | 1978 | Atari | PAL | 4KB | None | ✅ Disassembled | adventure.pasm | 88 blocks |

## Related

- Issue #8: Expand Game Project Structure (content source)
- `docs/Atari-2600/README.md` (file to edit)
- Adventure README (example format)

## Priority

**High** - Makes game projects discoverable and demonstrates organization

## Timeline

- Update after Issue #8 creates first 4-5 games
- Maintain as new games are added
- Consider automating table generation
