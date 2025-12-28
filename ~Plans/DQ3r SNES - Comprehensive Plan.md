# Dragon Quest III Remix (SNES) - Comprehensive Project Plan

**Project Codename:** DQ3r
**Full Name:** Dragon Quest III Remix (SNES) / Dragon Quest III - Soshite Densetsu he...
**Target ROM:** Dragon Quest III - Soshite Densetsu he... (J) [!].sfc
**Platform:** Super Nintendo Entertainment System (SNES)
**ROM Type:** HiROM, 4MB (4,194,304 bytes)

> **Naming Convention:**
> - **DQ3** = Dragon Quest III (NES) - Original 1988 Famicom game
> - **DQ3r** = Dragon Quest III Remix (SNES) - 1996 Super Famicom remake
> - Use "Dragon Quest III (SNES)" for folder names and documentation titles
> - Use "DQ3r" as shorthand in issues, labels, and casual references

---

## 📋 Executive Summary

This document outlines the complete plan for integrating Dragon Quest III (SNES) into the GameInfo project ecosystem. The goal is to create a comprehensive disassembly, documentation suite, asset pipeline, and editor tools that match or exceed the quality of the existing Dragon Warrior IV (NES) and FFMQ (SNES) projects.

---

## 🎯 Project Goals

### Short Term (1-2 weeks)
- [ ] Merge `dq3r-info` repository content into `GameInfo/Games/SNES/Dragon Quest III (SNES)/`
- [ ] Set up proper folder structure following GameInfo conventions
- [ ] Convert existing Python tools to C# (.NET 10)
- [ ] Create GitHub issues/epics for tracking
- [ ] Integrate logsmall trace analysis tools

### Medium Term (1-2 months)
- [ ] Complete ROM map documentation (all banks, regions)
- [ ] Extract all graphics assets (sprites, tiles, backgrounds)
- [ ] Document text encoding and dialog system
- [ ] Create basic DQ3r editors in DarkRepos/Editor
- [ ] Generate DarkRepos wiki content

### Long Term (3-6 months)
- [ ] Full annotated disassembly with symbols
- [ ] Complete game mechanics documentation
- [ ] Advanced editor tools (map editor, battle editor)
- [ ] Translation support tools
- [ ] Buildable ROM from source

---

## 📁 Folder Structure

```
GameInfo/
└── Games/
    └── SNES/
        └── Dragon Quest III (SNES)/
            ├── README.md                    # Project overview
            ├── disasm/                      # Disassembly output
            │   ├── bank00.asm              # Individual bank files
            │   ├── bank01.asm
            │   └── ...
            ├── src/                         # Source for rebuild
            │   ├── asm/                    # Assembly source
            │   ├── include/                # Headers/constants
            │   └── data/                   # Data tables
            ├── assets/                      # Extracted assets
            │   ├── graphics/               # PNG graphics
            │   │   ├── sprites/
            │   │   ├── tiles/
            │   │   └── ui/
            │   ├── audio/                  # Music/SFX
            │   ├── text/                   # Dialog/strings
            │   │   ├── dialog.json
            │   │   └── menus.json
            │   └── data/                   # Game data JSON
            │       ├── monsters.json
            │       ├── items.json
            │       ├── spells.json
            │       └── classes.json
            ├── docs/                        # Documentation
            │   ├── ROM-Map.md              # Complete ROM map
            │   ├── RAM-Map.md              # RAM documentation
            │   ├── Data-Structures.md      # Data format specs
            │   ├── Systems/                # System documentation
            │   │   ├── Battle-System.md
            │   │   ├── Menu-System.md
            │   │   └── Graphics-System.md
            │   └── research/               # Research notes
            ├── tools/                       # Analysis tools (Python)
            │   ├── extractors/
            │   └── analysis/
            ├── Debugging/                   # Existing debug files
            │   └── ROM values/
            └── build/                       # Build output
                └── dq3r-rebuilt.sfc
```

---

## 🔧 Technical Details

### ROM Information
- **Title:** Dragon Quest III - Soshite Densetsu he...
- **Region:** Japan
- **Type:** HiROM
- **Size:** 4,194,304 bytes (4MB)
- **Banks:** 64 banks (128 including mirrors)
- **Checksum:** (to be documented)

### Known Data Regions (from dq3r-info analysis)
| Region | Description | Status |
|--------|-------------|--------|
| Bank $00-$07 | Main game code | Partially analyzed |
| Bank $08-$0F | Battle system | Documented |
| Bank $10-$17 | Graphics data | Identified |
| Bank $18-$1F | Audio/music | Identified |
| Bank $20-$3F | Data/compressed | To analyze |

### Text Encoding
- Custom Japanese text encoding
- Dialog compression identified
- 1,395+ text segments found
- Font stored at: (to document)

---

## 🗂️ Existing Resources

### From dq3r-info Repository
- **analysis/** - ROM analysis results, entropy data
- **assets/dq3_extracted/** - Initial asset extractions
- **converted_graphics/** - Graphics conversions
- **disassembly/** - Partial disassembly
- **docs/** - Documentation and research
- **tools/** - Python analysis tools
  - `advanced_rom_utilities.py`
  - `analysis/comprehensive_disassembler.py`
  - `analysis/maximum_rom_analyzer.py`
  - `compression/compression_engine.py`
  - `asset_pipeline/snes_extractor.py`

### From logsmall Repository
- **debuglogs/dq3/** - Execution trace logs
- **Common/SNES.cs** - SNES utilities (C#)
- Code-labeled disassembly fragments
- Address usage analysis

### From GameInfo/Games/SNES/Dragon Quest III (SNES)/
- **Debugging/** - Debug labels, temp notes
- **Docs/** - Data spreadsheet, monster info, item list
- **ROM values/** - Dialog font lookup table

---

## 🛠️ Tool Migration Plan

### Python Tools → C# Conversion

| Python Tool | C# Location | Priority |
|-------------|-------------|----------|
| `analyze_rom.py` | `DarkRepos.SNES.DQ3/` | High |
| `compression_engine.py` | `DarkRepos.Core/Compression/` | High |
| `snes_extractor.py` | `DarkRepos.SNES/Extractors/` | High |
| `graphics_analyzer.py` | `DarkRepos.SNES/Graphics/` | Medium |
| `comprehensive_disassembler.py` | `DarkRepos.SNES/Disassembly/` | Medium |
| `maximum_rom_analyzer.py` | `DarkRepos.SNES.DQ3/Analysis/` | Medium |

### Editor Integration

DQ3 editors will be integrated into `DarkReposEditor`:

1. **DQ3 Monster Editor** - Edit monster stats, behaviors
2. **DQ3 Item Editor** - Edit items, equipment
3. **DQ3 Class Editor** - Edit character classes
4. **DQ3 Spell Editor** - Edit spells and abilities
5. **DQ3 Text Editor** - Edit dialog, menus
6. **DQ3 Graphics Viewer** - View/export sprites, tiles

---

## 📊 GitHub Issues Structure

### Epic: Dragon Quest III (SNES) Complete Disassembly
```
epic/dq3-snes-disassembly
├── phase/setup
│   ├── issue: Set up folder structure
│   ├── issue: Migrate dq3r-info content
│   └── issue: Configure build system
├── phase/analysis
│   ├── issue: Document ROM header and mapping
│   ├── issue: Analyze all 64 banks
│   └── issue: Create memory map
├── phase/disassembly
│   ├── issue: Disassemble boot code (Bank 00)
│   ├── issue: Disassemble game engine (Bank 01-07)
│   ├── issue: Disassemble battle system
│   └── issue: Document all functions
├── phase/assets
│   ├── issue: Extract graphics
│   ├── issue: Extract audio
│   └── issue: Extract text/dialog
├── phase/documentation
│   ├── issue: Create ROM map
│   ├── issue: Create RAM map
│   ├── issue: Document data structures
│   └── issue: Create DarkRepos wiki pages
└── phase/tools
    ├── issue: Convert Python tools to C#
    ├── issue: Create DQ3 editors
    └── issue: Integrate into DarkReposEditor
```

---

## 🔄 Workflow

### Daily Tasks
1. Pick next unassigned issue from project board
2. Create feature branch: `feature/dq3-[issue-number]-description`
3. Implement changes with proper testing
4. Commit with conventional commits: `feat:`, `fix:`, `docs:`
5. Create PR and merge to main

### Build Verification
```powershell
# Build ROM from disassembly
.\build.ps1 -Game DQ3

# Verify against original
python tools/verify_rom.py --original "~roms/DQ3.sfc" --built "build/dq3r.sfc"
```

---

## 📝 Documentation Standards

### Wikitext Files (for DarkRepos)
- ROM Map: `DQ3-SNES-ROM-Map.wikitext`
- RAM Map: `DQ3-SNES-RAM-Map.wikitext`
- Data Structures: `DQ3-SNES-Data-Structures.wikitext`

### Assembly Annotations
```asm
; ============================================
; Function: battle_calculate_damage
; Purpose: Calculate damage for physical attacks
; Input:  A = attacker index
;         X = defender index
; Output: Y = damage amount
; ============================================
battle_calculate_damage:
    pha                 ; Save attacker index
    ; ... implementation
```

---

## ⏱️ Timeline

| Week | Milestone |
|------|-----------|
| Week 1 | Setup complete, content merged |
| Week 2 | ROM/RAM maps documented |
| Week 3 | Boot code disassembled |
| Week 4 | Graphics extraction complete |
| Week 5-6 | Battle system documented |
| Week 7-8 | Text system documented |
| Week 9-12 | Editor tools complete |

---

## 🔗 Related Resources

### External References
- [Data Crystal - Dragon Quest III](https://datacrystal.tcrf.net/wiki/Dragon_Quest_III)
- [SNES Development Wiki](https://wiki.superfamicom.org/)
- [65816 Reference](https://www.westerndesigncenter.com/wdc/documentation/w65c816s.pdf)

### Internal Resources
- ROM: `GameInfo/~roms/SNES/GoodSNES/Dragon Quest III - Soshite Densetsu he... (J) [!].sfc`
- dq3r-info: `C:\Users\me\source\repos\dq3r-info`
- logsmall: `C:\Users\me\source\repos\logsmall`

---

## ✅ Next Actions

1. [ ] Create GitHub epic issue
2. [ ] Create phase/setup sub-issues
3. [ ] Copy dq3r-info content to GameInfo
4. [ ] Set up folder structure
5. [ ] Begin ROM map documentation

---

*Document created: $(Get-Date)*
*Last updated: $(Get-Date)*
*Author: AI Assistant (GitHub Copilot)*
