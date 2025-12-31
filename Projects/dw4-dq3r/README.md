# DW4 NES → DQ3r SNES Port Project

**Goal:** Port Dragon Warrior IV (NES) to the Dragon Quest III Remake (SNES) engine.

## Project Overview

This project aims to recreate Dragon Warrior IV using the enhanced Dragon Quest III SNES engine, bringing modern graphics, music, and quality-of-life features to DW4.

### Why This Project?

1. **DW4 never got an official SNES release** (unlike DQ4 on PS1/DS)
2. **DQ3r SNES engine is well-documented** and suitable for DQ-style games
3. **Similar game structure** - both are chapter-based DQ games
4. **Learning opportunity** - deep understanding of both engines

## Project Phases

### Phase 1: Research & Documentation
- [ ] Complete DW4 NES disassembly ([dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info))
- [ ] Complete DQ3r SNES analysis ([dq3r-info](https://github.com/TheAnsarya/dq3r-info))
- [ ] Document data format differences
- [ ] Create mapping tables

### Phase 2: Data Conversion Tools
- [ ] Monster stats converter
- [ ] Item data converter
- [ ] Spell data converter
- [ ] Map format converter
- [ ] Text/dialog converter
- [ ] Graphics converter

### Phase 3: Engine Modifications
- [ ] Chapter system implementation
- [ ] AI party member system (Chapters 1-4)
- [ ] Wagon/party switching system
- [ ] DW4-specific mechanics

### Phase 4: Content Porting
- [ ] All maps and dungeons
- [ ] All NPCs and events
- [ ] All monsters and encounters
- [ ] All items and equipment
- [ ] All spells and abilities
- [ ] Music adaptation

### Phase 5: Polish & Testing
- [ ] Full playthrough testing
- [ ] Balance adjustments
- [ ] Bug fixing
- [ ] Documentation

## Documentation

### Project Documentation (This Repo)

| Document | Description |
|----------|-------------|
| [Data Formats](docs/data-formats.md) | Format comparison between DW4 NES and DQ3r SNES |
| [Technical Specs](docs/technical-specs.md) | Detailed technical specifications |
| [AI Behavior Comparison](docs/ai-behavior-comparison.md) | AI and tactics system comparison |
| [Battle System Comparison](docs/battle-system-comparison.md) | Combat mechanics comparison |
| [Chapter System Comparison](docs/chapter-system-comparison.md) | DW4's unique chapter structure |
| [Wagon System Deep Dive](docs/wagon-system-deep-dive.md) | Detailed wagon implementation guide |
| [Text System Comparison](docs/text-system-comparison.md) | Text encoding and dialog systems |
| [Graphics System Comparison](docs/graphics-system-comparison.md) | Tile, sprite, and palette conversion |
| [Converter Tools](docs/converter-tools.md) | C# tool specifications |
| [GitHub Issues](docs/github-issues.md) | Issue templates and structure |
| [Roadmap](docs/roadmap.md) | Project timeline and milestones |
| [Progress](docs/progress.md) | Current progress tracking |

### DW4 NES Technical Documentation (dragon-warrior-4-info)

| Document | Description |
|----------|-------------|
| [Index](../../../dragon-warrior-4-info/docs/INDEX.md) | Master documentation index |
| [Quick Reference](../../../dragon-warrior-4-info/docs/QUICK_REFERENCE.md) | One-page technical cheat sheet |
| [Monster Format](../../../dragon-warrior-4-info/docs/formats/MONSTER_FORMAT.md) | 16-byte monster structure |
| [Item Format](../../../dragon-warrior-4-info/docs/formats/ITEM_FORMAT.md) | Equipment and consumables |
| [Spell Format](../../../dragon-warrior-4-info/docs/formats/SPELL_FORMAT.md) | Magic system |
| [Party System](../../../dragon-warrior-4-info/docs/formats/PARTY_SYSTEM.md) | 5-chapter party mechanics |
| [AI Behavior](../../../dragon-warrior-4-info/docs/formats/AI_BEHAVIOR.md) | Character AI profiles |
| [Tactics System](../../../dragon-warrior-4-info/docs/formats/TACTICS_SYSTEM.md) | 8 tactics modes |
| [Wagon System](../../../dragon-warrior-4-info/docs/formats/WAGON_SYSTEM.md) | Party management |
| [Battle System](../../../dragon-warrior-4-info/docs/formats/BATTLE_SYSTEM.md) | Battle mechanics |
| [RAM Map](../../../dragon-warrior-4-info/docs/formats/RAM_MAP.md) | Memory layout |
| [ROM Map](../../../dragon-warrior-4-info/docs/formats/ROM_MAP.md) | Bank structure |
| [Text System](../../../dragon-warrior-4-info/docs/formats/TEXT_SYSTEM.md) | Text encoding |
| [Save Data](../../../dragon-warrior-4-info/docs/formats/SAVE_FORMAT.md) | Save format |

## Repository Structure

```
Projects/dw4-dq3r/
├── README.md           # This file
├── docs/
│   ├── data-formats.md   # Format comparison
│   ├── technical-specs.md # Technical specifications
│   ├── converter-tools.md # Tool specifications
│   ├── github-issues.md   # Issue templates
│   ├── roadmap.md         # Project roadmap
│   └── progress.md        # Progress tracking
├── tools/
│   ├── converters/     # Data conversion tools
│   └── analysis/       # Analysis scripts
├── data/
│   ├── dw4/           # Extracted DW4 data
│   └── dq3r/          # Target DQ3r format
└── patches/
    └── engine/        # Engine modification patches
```

## Technical Challenges

### 1. Chapter System
DW4's unique chapter structure doesn't exist in DQ3r. Need to:
- Implement chapter transitions
- Handle separate inventories
- Manage party composition per chapter

### 2. AI Battle System
Chapters 1-4 have AI-controlled allies:
- Port or recreate AI decision logic
- Handle DW4-specific AI behaviors (Taloon's merchant actions, etc.)

### 3. Wagon System
DW4's wagon allows large party management:
- 8 potential party members
- In-battle character switching
- Needs engine modifications

### 4. Graphics Adaptation
- DW4 NES graphics → SNES 4bpp
- New sprite animations needed
- Monster sprite scaling

### 5. Map Format Differences
- NES 1-byte tiles → SNES 2-byte tiles
- Different compression schemes
- Tile property handling

## Data Format Comparison

| Data Type | DW4 NES | DQ3r SNES |
|-----------|---------|-----------|
| Monster Stats | 16 bytes | 24 bytes |
| Item Data | 8 bytes | 12 bytes |
| Spell Data | 6 bytes | 10 bytes |
| Map Tiles | 1 byte | 2 bytes |
| Text | Custom TBL | Shift-JIS |

## Related Resources

### Repositories
- [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) - DW4 disassembly
- [dq3r-info](https://github.com/TheAnsarya/dq3r-info) - DQ3r analysis
- [logsmall](https://github.com/TheAnsarya/logsmall) - DQ3 C# libraries

### Documentation
- [DW4 ROM Map](../../docs/dragon-warrior-4-nes/)
- [DQ3r ROM Map](../../docs/dragon-quest-3-snes/)
- [DQ3r Comprehensive Plan](../../~Plans/DQ3r%20SNES%20-%20Comprehensive%20Plan.md)

### Tools
- [GameInfoTools](../../src/) - .NET ROM tools
- [Python Tools](../../tools/) - Analysis scripts

## Getting Started

1. **Set up repositories:**
   ```bash
   git clone https://github.com/TheAnsarya/dragon-warrior-4-info
   git clone https://github.com/TheAnsarya/dq3r-info
   git clone https://github.com/TheAnsarya/GameInfo
   ```

2. **Extract DW4 data:**
   ```bash
   cd dragon-warrior-4-info
   python tools/extract_all.py
   ```

3. **Begin documentation:**
   - Document undocumented DW4 systems
   - Map DQ3r engine capabilities

## Issue Tracking

All work items tracked in [GameInfo Issues](https://github.com/TheAnsarya/GameInfo/issues):
- Epic: TBD (see [GitHub Issues Plan](docs/github-issues.md))
- Label: `project:dw4-dq3r`

## Timeline

See [Roadmap](docs/roadmap.md) for detailed timeline.

| Phase | Duration | Status |
|-------|----------|--------|
| Research & Documentation | 6 months | � In Progress (65%) |
| Conversion Tools | 6 months | Not started |
| Engine Modifications | 3 months | Not started |
| Content Porting | 3 months | Not started |
| Polish & Testing | 3 months | Not started |

**Total Estimated:** 18-21 months

## Contributing

This is an ambitious project. Contributions welcome in:
- DW4 disassembly and documentation
- DQ3r engine analysis
- Conversion tool development
- Testing and feedback

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.
