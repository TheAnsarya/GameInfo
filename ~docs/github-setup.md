# GitHub Project Setup Guide

This document provides the steps to set up the GitHub Project board, labels, and epic issues for the GameInfo repository.

## 1. Create GitHub Labels

Run these commands in the repository root (requires GitHub CLI `gh`):

```powershell
# Type labels
gh label create "type:epic" --color "7B1FA2" --description "Major work area tracking multiple issues"
gh label create "type:feature" --color "1976D2" --description "New feature or enhancement"
gh label create "type:bug" --color "D32F2F" --description "Bug fix"
gh label create "type:docs" --color "0097A7" --description "Documentation improvements"
gh label create "type:refactor" --color "7B1FA2" --description "Code refactoring"

# Priority labels
gh label create "priority:high" --color "D32F2F" --description "High priority - address soon"
gh label create "priority:medium" --color "F57C00" --description "Medium priority - planned work"
gh label create "priority:low" --color "388E3C" --description "Low priority - nice to have"

# Component labels
gh label create "component:tools" --color "1565C0" --description "Python ROM hacking tools"
gh label create "component:wiki" --color "6A1B9A" --description "Data Crystal wikitext content"
gh label create "component:disasm" --color "00695C" --description "Disassembly and analysis"
gh label create "component:assets" --color "E65100" --description "Asset extraction and conversion"
gh label create "component:docs" --color "455A64" --description "Project documentation"

# Status labels
gh label create "status:blocked" --color "B71C1C" --description "Blocked by dependency"
gh label create "status:needs-review" --color "FF8F00" --description "Ready for review"
gh label create "status:in-progress" --color "1976D2" --description "Currently being worked on"
```

## 2. Create Epic Issues

### Epic 1: Data Crystal Wiki Documentation

```powershell
gh issue create --title "Epic: Data Crystal Wiki Documentation" --label "type:epic,component:wiki,priority:high" --body @"
# Data Crystal Wiki Documentation Epic

Create comprehensive Data Crystal-style wikitext documentation for all supported games.

## Goals
- ROM maps for all games
- RAM maps with variable documentation
- SRAM maps for save data
- TBL files with complete character encoding
- Data structure documentation

## Games Covered
- [ ] Dragon Warrior (NES)
- [ ] Dragon Warrior II (NES)
- [ ] Dragon Warrior III (NES)
- [ ] Dragon Warrior IV (NES)
- [ ] Dragon Quest I & II (SNES)
- [ ] Dragon Quest III (SNES)
- [ ] Final Fantasy Mystic Quest (SNES)

## Sub-Issues
Create sub-issues for each game's documentation.

## Acceptance Criteria
- All games have complete ROM maps
- All games have complete RAM maps
- All games have TBL files
- Documentation follows Data Crystal format standards
"@
```

### Epic 2: ROM Hacking Tools Suite

```powershell
gh issue create --title "Epic: ROM Hacking Tools Suite" --label "type:epic,component:tools,priority:high" --body @"
# ROM Hacking Tools Suite Epic

Maintain and enhance the comprehensive Python ROM hacking tools collection.

## Tool Categories
- [ ] CDL Tools (editor, converter, visualizer, coverage)
- [ ] Label Management (MLB, NL, symbol table)
- [ ] ROM Analysis (info, analyzer, hex finder)
- [ ] Text/Graphics (extract, viewer, editor)
- [ ] Patching (IPS, BPS, diff, checksum)
- [ ] Debugging (trace analyzer, savestate, bank analyzer)

## Goals
- All tools have --help documentation
- Consistent command-line interface
- Support for NES, SNES, GB platforms
- Integration between related tools

## Related Issues
- #1 CDL Editor - Add advanced editing features
- #2 CDL Build System - Add CI/CD integration
- #4 Create CDL visualization/heatmap tool
- #5 Add CDL format conversion between emulators
- #6 Integrate CDL tools with ROM analysis

## Acceptance Criteria
- Tools are documented in docs/guides/
- Tools follow project code style (tabs, lowercase hex)
- Tools have error handling and validation
"@
```

### Epic 3: Game-Specific Disassemblies

```powershell
gh issue create --title "Epic: Game-Specific Disassemblies" --label "type:epic,component:disasm,priority:medium" --body @"
# Game-Specific Disassemblies Epic

Maintain and expand annotated disassemblies for supported games.

## Active Disassembly Projects
- [ ] Dragon Warrior IV (NES) - dragon-warrior-4-info repo
- [ ] Final Fantasy Mystic Quest (SNES) - ffmq-info repo

## Goals
- Complete code coverage via CDL analysis
- Annotated assembly with meaningful labels
- Cross-reference documentation
- Build systems for reassembly

## Deliverables per Game
- Annotated ASM source files
- Symbol/label files (MLB, NL)
- CDL coverage files
- Build scripts

## Related Repositories
- https://github.com/TheAnsarya/dragon-warrior-4-info
- https://github.com/TheAnsarya/ffmq-info

## Acceptance Criteria
- Disassemblies build identical ROMs
- All code regions documented
- Labels follow naming conventions
"@
```

### Epic 4: Asset Extraction Pipeline

```powershell
gh issue create --title "Epic: Asset Extraction Pipeline" --label "type:epic,component:assets,priority:medium" --body @"
# Asset Extraction Pipeline Epic

Create tools and workflows for extracting and converting game assets.

## Asset Types
- [ ] Graphics (tiles, sprites, backgrounds)
- [ ] Text (dialog, menus, item names)
- [ ] Audio (music, sound effects)
- [ ] Data tables (stats, items, monsters)
- [ ] Maps (world maps, dungeon layouts)

## Pipeline Goals
- Extract assets to editable formats (PNG, JSON, etc.)
- Convert back to binary for ROM insertion
- Support .include directives in assembly
- Batch processing for multiple files

## Tools Involved
- tile_viewer.py, sprite_editor.py
- text_extract.py, string_table.py
- music_extractor.py, music_editor.py
- data_table.py, pointers.py
- compression.py, dte_compress.py

## Acceptance Criteria
- Bidirectional conversion (extract ↔ insert)
- Documented file formats
- Integration with build systems
"@
```

## 3. Create GitHub Project Board

### Via GitHub Web Interface:
1. Go to https://github.com/TheAnsarya/GameInfo
2. Click "Projects" tab
3. Click "New project"
4. Select "Board" template
5. Name it "GameInfo Development"
6. Create columns:
   - **Backlog** - Issues not yet started
   - **In Progress** - Currently being worked on
   - **Review** - Ready for review/testing
   - **Done** - Completed work

### Via GitHub CLI:
```powershell
# Create the project
gh project create --title "GameInfo Development" --owner TheAnsarya

# Note: Column creation and issue linking requires the web interface
# or GitHub GraphQL API
```

## 4. Link Existing Issues to Project

After creating the project, add existing issues (#1-6) to the Backlog column.

## 5. Quick Setup Script

Save and run this PowerShell script to create all labels and issues:

```powershell
# Set repository
$repo = "TheAnsarya/GameInfo"

# Create labels
$labels = @(
    @{name="type:epic"; color="7B1FA2"; desc="Major work area tracking multiple issues"},
    @{name="type:feature"; color="1976D2"; desc="New feature or enhancement"},
    @{name="type:bug"; color="D32F2F"; desc="Bug fix"},
    @{name="type:docs"; color="0097A7"; desc="Documentation improvements"},
    @{name="priority:high"; color="D32F2F"; desc="High priority - address soon"},
    @{name="priority:medium"; color="F57C00"; desc="Medium priority - planned work"},
    @{name="priority:low"; color="388E3C"; desc="Low priority - nice to have"},
    @{name="component:tools"; color="1565C0"; desc="Python ROM hacking tools"},
    @{name="component:wiki"; color="6A1B9A"; desc="Data Crystal wikitext content"},
    @{name="component:disasm"; color="00695C"; desc="Disassembly and analysis"},
    @{name="component:assets"; color="E65100"; desc="Asset extraction and conversion"}
)

foreach ($label in $labels) {
    gh label create $label.name --color $label.color --description $label.desc --repo $repo
}

Write-Host "Labels created! Now create epic issues manually or run the issue creation commands above."
```
