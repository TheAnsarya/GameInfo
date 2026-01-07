# GameInfo Project - Master Completion Roadmap

**Multi-Game Documentation & Disassembly Project Status**

This document provides an overview of all game projects under the GameInfo umbrella, their completion status, and prioritization.

## 📊 Project Overview

The GameInfo project documents retro games for the Dark Repos wiki, creating:
- Wikitext documentation (ROM maps, RAM maps, data structures)
- Disassemblies with full commenting
- Asset extraction pipelines
- Editing tools

---

## 🎮 Game Project Status Summary

| Game | Platform | Repo | Status | Priority |
|------|----------|------|--------|----------|
| **Dragon Warrior I** | NES | dragon-warrior-info | 75% | P1 |
| **Dragon Warrior II** | NES | GameInfo/Wiki | 30% | P2 |
| **Dragon Warrior III** | NES | GameInfo/Wiki | 25% | P2 |
| **Dragon Warrior IV** | NES | dragon-warrior-4-info | 35% | P1 |
| **Dragon Quest III** | SNES | dq3r-info | 40% | P1 |
| **Dragon Quest I+II** | SNES | GameInfo/Wiki | 15% | P3 |
| **Final Fantasy: Mystic Quest** | SNES | ffmq-info | 30% | P1 |
| **Chrono Trigger** | SNES | GameInfo/Wiki | 20% | P2 |
| **Final Fantasy IV** | SNES | GameInfo/Wiki | 15% | P3 |
| **Robotrek** | SNES | GameInfo/Wiki | 10% | P3 |
| **7th Saga** | SNES | GameInfo/Wiki | 10% | P3 |
| **Soul Blazer** | SNES | GameInfo/Wiki | 10% | P3 |
| **Kirby's Adventure** | NES | GameInfo/Wiki | 20% | P3 |
| **Mappy-Land** | NES | GameInfo/Wiki | 40% | P4 |
| **Yoshi's Cookie** | NES | GameInfo/Wiki | 35% | P4 |

---

## 🏆 Priority 1 Projects (Active Development)

### Dragon Warrior I (NES)
**Repository:** `dragon-warrior-info`  
**Completion:** 75%  
**Roadmap:** [HOW_TO_FINISH.md](../dragon-warrior-info/docs/project/HOW_TO_FINISH.md)

**Remaining Work:**
- [ ] Label remaining ~500 Lxxxx labels
- [ ] Complete ROM Map wiki
- [ ] Complete RAM Map wiki
- [ ] Clean build verification
- [ ] Map editor tool

**Why Priority 1:** Most complete, close to finish line, foundation for DW series.

---

### Dragon Warrior IV (NES)
**Repository:** `dragon-warrior-4-info`  
**Completion:** 35%  
**Roadmap:** [HOW_TO_FINISH.md](../dragon-warrior-4-info/docs/project/HOW_TO_FINISH.md)

**Remaining Work:**
- [ ] Disassemble all 16 PRG banks
- [ ] Extract 144 monster stats
- [ ] Extract 10 character growth tables
- [ ] Complete wiki documentation
- [ ] Universal editor tool

**Why Priority 1:** Most complex NES Dragon Quest, valuable technical research.

---

### Dragon Quest III SNES
**Repository:** `dq3r-info`  
**Completion:** 40%  
**Roadmap:** [HOW_TO_FINISH.md](../dq3r-info/docs/project/HOW_TO_FINISH.md)

**Remaining Work:**
- [ ] Complete 64-bank disassembly
- [ ] Extract all 180+ monsters
- [ ] Extract all class/personality data
- [ ] Build 65c816 tool suite
- [ ] Complete wiki documentation

**Why Priority 1:** Foundation for DQ3: Remix project, SNES research.

---

### Final Fantasy: Mystic Quest (SNES)
**Repository:** `ffmq-info`  
**Completion:** 30%  
**Roadmap:** [HOW_TO_FINISH.md](../ffmq-info/docs/project/HOW_TO_FINISH.md)

**Remaining Work:**
- [ ] Clean build (no ROM copying)
- [ ] Label all CODE_XXXXXX
- [ ] Extract map data
- [ ] Extract audio data
- [ ] Complete wiki documentation

**Why Priority 1:** Good reference implementation, well-structured repo.

---

## 🥈 Priority 2 Projects (Secondary Focus)

### Dragon Warrior II (NES)
**Location:** `GameInfo/DarkRepos/Wiki/NES/Dragon_Warrior_II/`  
**Completion:** 30%

**Remaining Work:**
- [ ] Complete ROM Map
- [ ] Complete RAM Map
- [ ] Monster data table
- [ ] Equipment tables
- [ ] Spell documentation

---

### Dragon Warrior III NES
**Location:** `GameInfo/DarkRepos/Wiki/NES/Dragon_Warrior_III/`  
**Completion:** 25%

**Remaining Work:**
- [ ] Complete ROM Map
- [ ] Complete RAM Map
- [ ] Class system documentation
- [ ] Personality system (if any)
- [ ] Monster/item tables

---

### Chrono Trigger (SNES)
**Location:** `GameInfo/DarkRepos/Wiki/SNES/Chrono_Trigger/`  
**Completion:** 20%

**Remaining Work:**
- [ ] Complete ROM Map (24 Mbit)
- [ ] Tech/combo system
- [ ] Time period mechanics
- [ ] Enemy data tables
- [ ] Character progression

---

## 🥉 Priority 3 Projects (Documentation Focus)

These projects focus primarily on wiki documentation rather than full disassembly:

### Dragon Quest I+II SNES
- Basic ROM/RAM maps
- Item/spell tables
- Monster data
- Shop inventories

### Final Fantasy IV (SNES)
- ROM/RAM maps
- Character data
- Battle system
- Equipment tables

### Robotrek (SNES)
- ROM/RAM maps
- Robot customization
- Invention system
- Combat mechanics

### 7th Saga (SNES)
- ROM/RAM maps
- Character selection
- Apprentice battles
- Equipment/rune system

### Soul Blazer (SNES)
- ROM/RAM maps
- Soul restoration
- Weapon/armor data
- Monster data

### Kirby's Adventure (NES)
- ROM/RAM maps
- Copy abilities
- Stage data
- Boss patterns

---

## 📋 Priority 4 Projects (Basic Wiki Only)

### Mappy-Land (NES)
- Character page ✅
- Worlds page ✅
- Items page ✅
- Basic game info

### Yoshi's Cookie (NES)
- Puzzle types ✅
- Characters ✅
- Basic mechanics

---

## 📁 Repository Structure

```
source/repos/
├── GameInfo/                    # Main hub, wiki content
│   ├── DarkRepos/Wiki/
│   │   ├── NES/
│   │   │   ├── Dragon_Warrior/
│   │   │   ├── Dragon_Warrior_II/
│   │   │   ├── Dragon_Warrior_III/
│   │   │   ├── Dragon_Warrior_IV/
│   │   │   ├── Kirbys_Adventure/
│   │   │   ├── Mappy-Land/
│   │   │   └── Yoshis_Cookie/
│   │   └── SNES/
│   │       ├── Chrono_Trigger/
│   │       ├── Dragon_Quest_III/
│   │       ├── Dragon_Quest_I_II/
│   │       ├── Final_Fantasy_IV/
│   │       ├── Final_Fantasy_Mystic_Quest/
│   │       ├── Robotrek/
│   │       ├── Seventh_Saga/
│   │       └── Soul_Blazer/
│   └── tools/                   # Shared tools
│
├── dragon-warrior-info/         # DW1 NES disassembly
├── dragon-warrior-4-info/       # DW4 NES disassembly
├── dq3r-info/                   # DQ3 SNES disassembly
├── ffmq-info/                   # FFMQ SNES disassembly
└── logsmall/                    # C# tools & libraries
    ├── DW4Lib/                  # DW4 NES library
    ├── DQ3Lib/                  # DQ3 SNES library
    └── FFMQLib/                 # FFMQ library
```

---

## 🎯 Global Definition of "Complete"

A game project is "complete" when:

### Wiki Documentation
- [ ] Complete ROM Map (every bank documented)
- [ ] Complete RAM Map (all addresses documented)
- [ ] Complete SRAM Map (save format documented)
- [ ] All monsters documented
- [ ] All items documented
- [ ] All spells/abilities documented
- [ ] Battle system formulas documented
- [ ] Glitches/secrets documented

### Disassembly (for major projects)
- [ ] 100% labeled (no Lxxxx/CODE_XXXXXX)
- [ ] 100% commented (all routines explained)
- [ ] Clean build (no binary blobs)
- [ ] Byte-perfect verification

### Tools
- [ ] Asset extraction pipeline
- [ ] Universal editor GUI
- [ ] Build system

---

## 🗓️ Suggested Overall Timeline

### Q1 2025: Foundation
- Complete DW1 to 95%+
- DW4 core extraction
- DQ3 bank analysis
- FFMQ clean build

### Q2 2025: Core Completion
- DW1 to 100%
- DW4 to 60%
- DQ3 to 60%
- FFMQ to 60%

### Q3 2025: Secondary Projects
- DW2/DW3 NES wiki completion
- CT wiki expansion
- DW4 to 80%

### Q4 2025: Polish
- All P1 projects to 90%+
- P2 projects to 70%+
- Documentation review

---

## 📈 Progress Tracking

Use GitHub Projects for each repo:
- Kanban board: Backlog → In Progress → Done
- Milestones for major phases
- Issues linked to epics

Weekly check-ins:
- Review completed work
- Update progress percentages
- Adjust priorities

---

## 🔗 Quick Links

### How to Finish Docs
- [DW1 - HOW_TO_FINISH.md](../dragon-warrior-info/docs/project/HOW_TO_FINISH.md)
- [DW4 - HOW_TO_FINISH.md](../dragon-warrior-4-info/docs/project/HOW_TO_FINISH.md)
- [DQ3 SNES - HOW_TO_FINISH.md](../dq3r-info/docs/project/HOW_TO_FINISH.md)
- [FFMQ - HOW_TO_FINISH.md](../ffmq-info/docs/project/HOW_TO_FINISH.md)

### Wiki Directories
- [NES Wiki](DarkRepos/Wiki/NES/)
- [SNES Wiki](DarkRepos/Wiki/SNES/)

### Project Guidelines
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [copilot-instructions.md](.github/copilot-instructions.md)

---

*Last updated: 2025*
