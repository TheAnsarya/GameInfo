# GitHub Setup Script for GameInfo
# Run this script from the repository root with GitHub CLI (gh) installed and authenticated

param(
    [switch]$LabelsOnly,
    [switch]$IssuesOnly,
    [switch]$DryRun
)

$repo = "TheAnsarya/GameInfo"

function Write-Step($message) {
    Write-Host "`n=== $message ===" -ForegroundColor Cyan
}

function Run-Command($cmd) {
    if ($DryRun) {
        Write-Host "[DRY RUN] $cmd" -ForegroundColor Yellow
    } else {
        Write-Host "> $cmd" -ForegroundColor Gray
        Invoke-Expression $cmd
    }
}

# ============================================
# LABELS
# ============================================
if (-not $IssuesOnly) {
    Write-Step "Creating Labels"

    $labels = @(
        # Type labels
        @{name="type:epic"; color="7B1FA2"; desc="Major work area tracking multiple issues"},
        @{name="type:feature"; color="1976D2"; desc="New feature or enhancement"},
        @{name="type:bug"; color="D32F2F"; desc="Bug fix"},
        @{name="type:docs"; color="0097A7"; desc="Documentation improvements"},
        @{name="type:refactor"; color="7B1FA2"; desc="Code refactoring"},

        # Priority labels
        @{name="priority:high"; color="D32F2F"; desc="High priority - address soon"},
        @{name="priority:medium"; color="F57C00"; desc="Medium priority - planned work"},
        @{name="priority:low"; color="388E3C"; desc="Low priority - nice to have"},

        # Component labels
        @{name="component:tools"; color="1565C0"; desc="Python ROM hacking tools"},
        @{name="component:wiki"; color="6A1B9A"; desc="Data Crystal wikitext content"},
        @{name="component:disasm"; color="00695C"; desc="Disassembly and analysis"},
        @{name="component:assets"; color="E65100"; desc="Asset extraction and conversion"},
        @{name="component:docs"; color="455A64"; desc="Project documentation"},

        # Status labels
        @{name="status:blocked"; color="B71C1C"; desc="Blocked by dependency"},
        @{name="status:needs-review"; color="FF8F00"; desc="Ready for review"},
        @{name="status:in-progress"; color="1976D2"; desc="Currently being worked on"}
    )

    foreach ($label in $labels) {
        $cmd = "gh label create `"$($label.name)`" --color `"$($label.color)`" --description `"$($label.desc)`" --repo $repo --force"
        Run-Command $cmd
    }

    Write-Host "`nLabels created successfully!" -ForegroundColor Green
}

# ============================================
# EPIC ISSUES
# ============================================
if (-not $LabelsOnly) {
    Write-Step "Creating Epic Issues"

    # Epic 1: Data Crystal Wiki Documentation
    $epic1Body = @"
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

## Acceptance Criteria
- All games have complete ROM maps
- All games have complete RAM maps
- All games have TBL files
- Documentation follows Data Crystal format standards
"@

    # Epic 2: ROM Hacking Tools Suite
    $epic2Body = @"
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

    # Epic 3: Game-Specific Disassemblies
    $epic3Body = @"
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

## Related Repositories
- https://github.com/TheAnsarya/dragon-warrior-4-info
- https://github.com/TheAnsarya/ffmq-info

## Acceptance Criteria
- Disassemblies build identical ROMs
- All code regions documented
- Labels follow naming conventions
"@

    # Epic 4: Asset Extraction Pipeline
    $epic4Body = @"
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
- Bidirectional conversion (extract <-> insert)
- Documented file formats
- Integration with build systems
"@

    # Create the issues
    $epics = @(
        @{title="Epic: Data Crystal Wiki Documentation"; labels="type:epic,component:wiki,priority:high"; body=$epic1Body},
        @{title="Epic: ROM Hacking Tools Suite"; labels="type:epic,component:tools,priority:high"; body=$epic2Body},
        @{title="Epic: Game-Specific Disassemblies"; labels="type:epic,component:disasm,priority:medium"; body=$epic3Body},
        @{title="Epic: Asset Extraction Pipeline"; labels="type:epic,component:assets,priority:medium"; body=$epic4Body}
    )

    foreach ($epic in $epics) {
        Write-Host "`nCreating: $($epic.title)" -ForegroundColor Yellow

        # Write body to temp file to avoid escaping issues
        $tempFile = [System.IO.Path]::GetTempFileName()
        $epic.body | Out-File -FilePath $tempFile -Encoding utf8

        $cmd = "gh issue create --title `"$($epic.title)`" --label `"$($epic.labels)`" --body-file `"$tempFile`" --repo $repo"
        Run-Command $cmd

        Remove-Item $tempFile -ErrorAction SilentlyContinue
    }

    Write-Host "`nEpic issues created successfully!" -ForegroundColor Green
}

# ============================================
# PROJECT BOARD INSTRUCTIONS
# ============================================
Write-Step "Project Board Setup"
Write-Host @"
GitHub Projects must be created via the web interface:

1. Go to: https://github.com/TheAnsarya/GameInfo/projects
2. Click 'New project'
3. Select 'Board' template
4. Name: 'GameInfo Development'
5. Add columns:
   - Backlog
   - In Progress
   - Review
   - Done
6. Add existing issues to the project

"@ -ForegroundColor White

Write-Host "Setup complete!" -ForegroundColor Green
