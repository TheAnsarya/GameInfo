# DW4→DQ3r Project Roadmap

## Timeline Overview

```
2025 Q1-Q2: Phase 1 - Research & Documentation
2025 Q3-Q4: Phase 2 - Conversion Tools
2026 Q1   : Phase 3 - Engine Modifications
2026 Q2   : Phase 4 - Content Porting
2026 Q3   : Phase 5 - Polish & Testing
```

---

## Detailed Roadmap

### Phase 1: Research & Documentation (6 months)

#### Month 1-2: DW4 NES Analysis
- [ ] Complete ROM bank mapping
- [ ] Document all data tables
- [ ] Extract monster data (204 monsters)
- [ ] Extract item data (~150 items)
- [ ] Extract spell data (~70 spells)

#### Month 3-4: System Analysis
- [ ] Chapter system code analysis
- [ ] AI battle system analysis
- [ ] Wagon system analysis
- [ ] Event/scripting system analysis

#### Month 5-6: Documentation
- [ ] Complete disassembly annotations
- [ ] Format specification documents
- [ ] Create mapping tables
- [ ] Tool requirement specifications

### Phase 2: Conversion Tools (6 months)

#### Month 7-8: Core Converters
- [ ] Monster stats converter
- [ ] Item data converter
- [ ] Spell data converter
- [ ] Text/encoding converter

#### Month 9-10: Content Converters
- [ ] Map format converter
- [ ] Graphics converter (2bpp→4bpp)
- [ ] Encounter data converter

#### Month 11-12: Integration
- [ ] CLI tool integration
- [ ] Batch conversion pipeline
- [ ] Validation tools
- [ ] Test coverage

### Phase 3: Engine Modifications (3 months)

#### Month 13: Chapter System
- [ ] Chapter state machine
- [ ] Separate inventories
- [ ] Chapter transitions
- [ ] Save data modifications

#### Month 14: AI & Party Systems
- [ ] AI decision engine
- [ ] Character AI profiles
- [ ] Wagon system
- [ ] Party switching

#### Month 15: Integration
- [ ] Battle system modifications
- [ ] Menu system updates
- [ ] Event system hooks
- [ ] Testing & debugging

### Phase 4: Content Porting (3 months)

#### Month 16: Core Content
- [ ] All overworld maps
- [ ] All town maps
- [ ] All dungeon maps
- [ ] NPC dialog

#### Month 17: Game Data
- [ ] All monsters integrated
- [ ] All items integrated
- [ ] All spells integrated
- [ ] Encounter tables

#### Month 18: Polish Content
- [ ] Story events
- [ ] Boss battles
- [ ] Cutscenes
- [ ] Optional content

### Phase 5: Polish & Testing (3 months)

#### Month 19: Testing
- [ ] Chapter 1 playthrough
- [ ] Chapter 2 playthrough
- [ ] Chapter 3 playthrough
- [ ] Chapter 4 playthrough
- [ ] Chapter 5 playthrough

#### Month 20: Bug Fixing
- [ ] Critical bug fixes
- [ ] Balance adjustments
- [ ] Performance optimization
- [ ] Edge case handling

#### Month 21: Release
- [ ] Final testing
- [ ] Documentation
- [ ] Patch creation
- [ ] Release preparation

---

## Milestones

### M1: Data Extraction Complete
**Target:** End of Month 2
**Criteria:**
- All monster data extracted to JSON
- All item data extracted to JSON
- All spell data extracted to JSON
- ROM bank map complete

### M2: System Analysis Complete
**Target:** End of Month 4
**Criteria:**
- Chapter system documented
- AI system documented
- Wagon system documented
- Event system documented

### M3: Core Converters Ready
**Target:** End of Month 8
**Criteria:**
- Monster converter working
- Item converter working
- Spell converter working
- All unit tests passing

### M4: Content Converters Ready
**Target:** End of Month 12
**Criteria:**
- Map converter working
- Graphics converter working
- Full conversion pipeline working
- Integration tests passing

### M5: Engine Modifications Complete
**Target:** End of Month 15
**Criteria:**
- Chapter system implemented
- AI system implemented
- Wagon system implemented
- All systems tested

### M6: Playable Build
**Target:** End of Month 18
**Criteria:**
- All chapters playable
- All content converted
- No progression blockers
- Basic polish complete

### M7: Release Candidate
**Target:** End of Month 21
**Criteria:**
- Full game completable
- All known bugs fixed
- Performance acceptable
- Documentation complete

---

## Resource Requirements

### Time Investment
- Estimated total: 500-800 hours
- Can be done part-time over 18-21 months

### Dependencies
- DQ3r SNES engine documentation (✅ Complete - Issue #127)
- DW4 NES disassembly (🔄 In Progress)
- logsmall C# libraries (✅ Available)

### Skills Required
- 65816 Assembly (SNES)
- 6502 Assembly (NES)
- C# .NET development
- ROM hacking experience
- Understanding of both games

---

## Risk Assessment

### High Risk
1. **Chapter system complexity** - Novel implementation required
2. **AI battle system** - Complex decision trees
3. **Scope creep** - Many features to implement

### Medium Risk
1. **Graphics conversion quality** - 2bpp to 4bpp limitations
2. **Text space limitations** - DQ3r text format differences
3. **Bug introduction** - Engine modifications risky

### Low Risk
1. **Data conversion** - Well-defined formats
2. **Tool development** - Existing C# infrastructure
3. **Testing** - Clear acceptance criteria

### Mitigation Strategies
- Start with simpler components (data conversion)
- Create extensive unit tests
- Regular integration testing
- Incremental releases (per-chapter)

---

## Success Criteria

### Minimum Viable Product (MVP)
- [ ] Chapter 5 playable (Hero's journey only)
- [ ] Core mechanics working
- [ ] All towns accessible
- [ ] Game completable

### Full Release
- [ ] All 5 chapters playable
- [ ] AI party system working
- [ ] Wagon system working
- [ ] Full story intact
- [ ] Balance tested

### Stretch Goals
- [ ] Enhanced graphics
- [ ] Enhanced music
- [ ] Quality-of-life improvements
- [ ] Optional chapter sequence

---

*Last Updated: 2025-12-30*
