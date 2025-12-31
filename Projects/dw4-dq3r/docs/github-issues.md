# DW4→DQ3r GitHub Issues Plan

This document outlines all GitHub issues to be created for the DW4 NES → DQ3r SNES port project.

## Epic Structure

```
Epic: DW4→DQ3r Port Project
├── Phase 1: Research & Documentation
│   ├── DW4 Monster Data Extraction
│   ├── DW4 Item Data Extraction
│   ├── DW4 Spell Data Extraction
│   ├── DW4 Map Format Documentation
│   ├── DW4 Text System Documentation
│   ├── DW4 Chapter System Analysis
│   ├── DW4 AI Battle System Analysis
│   └── DW4 Wagon System Analysis
├── Phase 2: Conversion Tools
│   ├── Monster Stats Converter
│   ├── Item Data Converter
│   ├── Spell Data Converter
│   ├── Map Format Converter
│   ├── Text/Dialog Converter
│   └── Graphics Converter (2bpp→4bpp)
├── Phase 3: Engine Modifications
│   ├── Chapter System Implementation
│   ├── AI Party Member System
│   ├── Wagon/Party Switching System
│   └── DW4-Specific Battle Mechanics
├── Phase 4: Content Porting
│   ├── Port All Maps
│   ├── Port All Monsters
│   ├── Port All Items
│   ├── Port All Spells
│   ├── Port All NPCs/Events
│   └── Adapt Music
└── Phase 5: Polish & Testing
    ├── Full Playthrough Testing
    ├── Balance Adjustments
    └── Bug Fixing
```

---

## Epic Issue

### Title: Epic: DW4 NES → DQ3r SNES Port Project

**Labels:** `epic`, `enhancement`, `dw4`, `dq3r`

**Body:**

```markdown
## Overview

Port Dragon Warrior IV (NES) to run on the Dragon Quest III Remake (SNES) engine.

## Goal

Create a fully playable DW4 experience on the SNES using the enhanced DQ3r engine, with improved graphics, music, and quality-of-life features.

## Why This Project?

1. **DW4 never got an official SNES release** (unlike DQ4 on PS1/DS)
2. **DQ3r SNES engine is well-documented** (Issue #127 complete)
3. **Similar game structure** - both are DQ-style RPGs
4. **Technical challenge** - deep understanding of both engines

## Prerequisites

- [x] DQ3r SNES engine documentation (#127)
- [ ] DW4 NES complete disassembly
- [ ] All DW4 data extracted to JSON

## Phases

### Phase 1: Research & Documentation
Extract and document all DW4 NES data structures and game mechanics.

### Phase 2: Conversion Tools
Create C# tools to convert DW4 data formats to DQ3r formats.

### Phase 3: Engine Modifications
Modify DQ3r engine to support DW4-specific mechanics (chapters, wagon, AI).

### Phase 4: Content Porting
Convert all game content: maps, monsters, items, spells, text, graphics.

### Phase 5: Polish & Testing
Full testing, balancing, and bug fixing.

## Technical Challenges

1. **Chapter System** - DW4's unique 5-chapter structure
2. **AI Battle System** - Chapters 1-4 have AI-controlled allies
3. **Wagon System** - 8-member party with in-battle switching
4. **Graphics** - NES 2bpp → SNES 4bpp conversion
5. **Map Formats** - Different compression and tile systems

## Related Repositories

- [dragon-warrior-4-info](https://github.com/TheAnsarya/dragon-warrior-4-info) - DW4 disassembly
- [dq3r-info](https://github.com/TheAnsarya/dq3r-info) - DQ3r analysis
- [logsmall](https://github.com/TheAnsarya/logsmall) - C# tools and editors

## Related Issues

- #127 - Epic: DQ3r Disassembly (Complete)
- TBD - Sub-issues for each phase

## Acceptance Criteria

- [ ] All DW4 content playable on SNES
- [ ] Chapter system functioning correctly
- [ ] AI battle system working
- [ ] Wagon system implemented
- [ ] Full game completable from start to finish
```

---

## Phase 1: Research & Documentation Issues

### Issue 1.1: DW4 Monster Data Extraction

**Title:** Extract and document all DW4 NES monster data

**Labels:** `documentation`, `dw4`, `data-extraction`

**Body:**

```markdown
## Task

Extract all monster statistics from Dragon Warrior IV (NES) and document the data format.

## Deliverables

- [ ] Monster data structure documentation
- [ ] All 204 monsters extracted to JSON
- [ ] Monster sprite references
- [ ] Action pattern documentation

## Data Fields

- HP, Attack, Defense, Agility
- XP and Gold rewards
- Action patterns/AI
- Spell/skill lists
- Resistances
- Item drops

## Location in ROM

Bank 6 contains monster table (per existing analysis).

## Related Files

- `dragon-warrior-4-info/data/bank6_monster_table.txt`
- `dragon-warrior-4-info/assets/json/monsters.json` (output)
```

### Issue 1.2: DW4 Item Data Extraction

**Title:** Extract and document all DW4 NES item data

**Labels:** `documentation`, `dw4`, `data-extraction`

**Body:**

```markdown
## Task

Extract all item data from Dragon Warrior IV (NES).

## Deliverables

- [ ] Item data structure documentation
- [ ] All items extracted to JSON
- [ ] Equipment compatibility mappings
- [ ] Special effect documentation

## Item Categories

- Weapons
- Armor
- Shields
- Helmets
- Accessories
- Consumables
- Key items (per chapter)
```

### Issue 1.3: DW4 Spell Data Extraction

**Title:** Extract and document all DW4 NES spell/ability data

**Labels:** `documentation`, `dw4`, `data-extraction`

**Body:**

```markdown
## Task

Extract all spell and ability data from Dragon Warrior IV (NES).

## Deliverables

- [ ] Spell data structure documentation
- [ ] All spells extracted to JSON
- [ ] MP costs and effects
- [ ] Learning tables per character

## Spell Categories

- Attack spells
- Healing spells
- Support spells
- Character-specific abilities (Taloon's merchant skills, etc.)
```

### Issue 1.4: DW4 Chapter System Analysis

**Title:** Document DW4 chapter system implementation

**Labels:** `documentation`, `dw4`, `engine-research`

**Body:**

```markdown
## Task

Fully document how DW4's chapter system works internally.

## Chapter Structure

1. **Chapter 1:** Ragnar (solo)
2. **Chapter 2:** Alena, Clift, Brey
3. **Chapter 3:** Taloon (solo → merchants)
4. **Chapter 4:** Nara, Mara
5. **Chapter 5:** Hero (all characters unite)

## Deliverables

- [ ] Chapter transition code analysis
- [ ] Inventory handling per chapter
- [ ] Save data structure per chapter
- [ ] Flag/event system for chapter progression
- [ ] Party composition rules per chapter

## Engine Implications

This system doesn't exist in DQ3r - will need custom implementation.
```

### Issue 1.5: DW4 AI Battle System Analysis

**Title:** Document DW4 AI party member system

**Labels:** `documentation`, `dw4`, `engine-research`

**Body:**

```markdown
## Task

Analyze and document the AI system that controls party members in Chapters 1-4.

## AI Behaviors

- **Ragnar:** Aggressive fighter
- **Alena:** Attack-focused
- **Clift:** Healer/support (infamous Defeat spam)
- **Brey:** Magic user
- **Taloon:** Unique merchant actions
- **Nara/Mara:** Magic users

## Deliverables

- [ ] AI decision tree analysis
- [ ] Priority system documentation
- [ ] Character-specific behavior code
- [ ] Battle state evaluation logic

## Chapter 5 Note

In Chapter 5, player can choose "Tactics" to influence AI or take direct control.
```

### Issue 1.6: DW4 Wagon System Analysis

**Title:** Document DW4 wagon and party management system

**Labels:** `documentation`, `dw4`, `engine-research`

**Body:**

```markdown
## Task

Document the wagon system that allows managing 8+ party members.

## Features

- Store up to 8 party members
- Switch party members in/out of battle (when wagon accessible)
- Wagon accessibility rules per dungeon
- Party member status when in wagon

## Deliverables

- [ ] Wagon state machine documentation
- [ ] Party switching code analysis
- [ ] Dungeon wagon-access flags
- [ ] In-battle switching mechanics
```

---

## Phase 2: Conversion Tools Issues

### Issue 2.1: Monster Stats Converter

**Title:** Create DW4→DQ3r monster stats converter

**Labels:** `enhancement`, `tools`, `converter`

**Body:**

```markdown
## Task

Create a C# tool to convert DW4 NES monster data to DQ3r SNES format.

## Input

- DW4 monster JSON (from extraction)

## Output

- DQ3r-compatible monster JSON/binary

## Conversion Logic

- Scale 8-bit stats to 16-bit ranges
- Map action patterns to DQ3r format
- Convert resistances
- Handle item drops (DW4: 1 drop, DQ3r: 2 drops)

## Location

`logsmall/DW4Lib/Converters/MonsterConverter.cs`
```

### Issue 2.2: Map Format Converter

**Title:** Create DW4→DQ3r map format converter

**Labels:** `enhancement`, `tools`, `converter`

**Body:**

```markdown
## Task

Convert DW4 NES maps to DQ3r SNES format.

## Challenges

- NES: 1 byte/tile, RLE compression
- SNES: 2 bytes/tile, LZSS compression
- Tile property mapping
- Size differences (64x64 → 128x128 max)

## Deliverables

- [ ] Map decompressor (DW4 RLE)
- [ ] Tile mapping table
- [ ] Map recompressor (DQ3r LZSS)
- [ ] Tile property converter
```

### Issue 2.3: Graphics Converter (2bpp→4bpp)

**Title:** Create NES 2bpp to SNES 4bpp graphics converter

**Labels:** `enhancement`, `tools`, `converter`

**Body:**

```markdown
## Task

Convert DW4 NES graphics (2bpp) to DQ3r SNES format (4bpp).

## Process

1. Extract NES CHR tiles
2. Convert 2bpp → 4bpp format
3. Expand 4-color palette to 16-color
4. Optionally enhance with additional colors

## Output

- SNES-compatible tile data
- Updated palette files
- Sprite sheet mappings
```

---

## Phase 3: Engine Modification Issues

### Issue 3.1: Implement Chapter System in DQ3r

**Title:** Implement DW4 chapter system in DQ3r engine

**Labels:** `enhancement`, `engine-mod`, `major`

**Body:**

```markdown
## Task

Add chapter system support to DQ3r engine.

## Requirements

- [ ] Chapter state variable
- [ ] Chapter-specific party compositions
- [ ] Separate inventories per chapter (1-4)
- [ ] Chapter transition events
- [ ] Chapter 5 party unification

## Technical Approach

Extend save data structure to handle multiple chapter states.
```

### Issue 3.2: Implement AI Battle System

**Title:** Implement AI party member control for DW4

**Labels:** `enhancement`, `engine-mod`, `major`

**Body:**

```markdown
## Task

Add AI-controlled party member system to DQ3r engine.

## Requirements

- [ ] AI decision engine
- [ ] Character-specific AI profiles
- [ ] Tactics menu for Chapter 5
- [ ] AI state evaluation

## Reference

Original DW4 AI code from disassembly analysis.
```

### Issue 3.3: Implement Wagon System

**Title:** Implement wagon and party switching system

**Labels:** `enhancement`, `engine-mod`, `major`

**Body:**

```markdown
## Task

Add wagon system to DQ3r engine.

## Requirements

- [ ] Expand party limit from 4 to 8+
- [ ] Wagon accessibility flags
- [ ] In-battle party switching
- [ ] Menu integration

## Technical Approach

Modify party data structure and battle system to support dynamic party changes.
```

---

## Phase 4: Content Porting Issues

### Issue 4.1: Port All DW4 Maps

**Title:** Convert and port all DW4 maps to DQ3r

**Labels:** `content`, `maps`

**Body:**

```markdown
## Task

Convert all DW4 NES maps to DQ3r SNES format.

## Map Count

- Overworld maps
- Town maps
- Dungeon maps
- Chapter-specific areas

## Process

1. Extract with converter tool
2. Verify tile mappings
3. Test in-game
4. Fix any issues
```

### Issue 4.2: Port All DW4 Text/Dialog

**Title:** Convert all DW4 text to DQ3r format

**Labels:** `content`, `text`

**Body:**

```markdown
## Task

Convert all DW4 text and dialog to DQ3r text system.

## Content

- NPC dialog
- Battle messages
- Menu text
- Item/spell names
- Monster names
- Story sequences

## Technical

- Convert DW4 encoding to DQ3r format
- Handle text control codes
- Manage line breaks for different screen width
```

---

## Issue Creation Order

1. Create Epic issue first
2. Create Phase 1 issues (documentation prerequisites)
3. Create Phase 2-5 issues as Phase 1 completes
4. Link all issues to Epic

## Labels to Create

- `dw4` - Dragon Warrior IV related
- `dq3r` - Dragon Quest III Remake related
- `converter` - Data conversion tools
- `engine-mod` - Engine modifications
- `content` - Game content porting
- `data-extraction` - Data extraction tasks

---

*This document serves as a template for creating GitHub issues. Issues should be created in the GameInfo repository and linked to the project board.*
