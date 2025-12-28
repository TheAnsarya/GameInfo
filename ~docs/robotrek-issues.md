# Robotrek Documentation Project Issues

This document tracks the issues to be created for the Robotrek (SNES) project.

## Epic: Robotrek Full Documentation and Disassembly

**Parent Issue:** Robotrek Documentation Project (Epic)

### Documentation Issues

1. **[DOCS] Create complete ROM map documentation**
   - Labels: `documentation`, `game:robotrek`, `priority:high`
   - Description: Document all ROM regions, banks, and data structures
   - Acceptance: Complete ROM_Map.wikitext with verified addresses

2. **[DOCS] Create complete RAM map documentation**
   - Labels: `documentation`, `game:robotrek`, `priority:high`
   - Description: Document all RAM variables, player data, enemy state
   - Acceptance: Complete RAM_Map.wikitext with verified addresses

3. **[DOCS] Document all items and equipment**
   - Labels: `documentation`, `game:robotrek`, `priority:medium`
   - Description: Extract and document all 256 items with stats
   - Acceptance: Items.wikitext with complete item table

4. **[DOCS] Document all enemies and bosses**
   - Labels: `documentation`, `game:robotrek`, `priority:medium`
   - Description: Extract and document all 256 enemies with AI patterns
   - Acceptance: Enemies.wikitext with complete enemy table

5. **[DOCS] Document invention/crafting system**
   - Labels: `documentation`, `game:robotrek`, `priority:medium`
   - Description: Document all invention recipes and combinations
   - Acceptance: Inventions.wikitext with recipe table

6. **[DOCS] Document game formulas and mechanics**
   - Labels: `documentation`, `game:robotrek`, `priority:low`
   - Description: Reverse engineer damage, EXP, and other formulas
   - Acceptance: Formulas.wikitext with verified calculations

### Tool Issues

7. **[TOOL] Verify Python ROM analyzer accuracy**
   - Labels: `tools`, `game:robotrek`, `priority:high`
   - Description: Test robotrek_analyzer.py against actual ROM
   - Acceptance: All data regions verified

8. **[TOOL] Verify Python text extractor**
   - Labels: `tools`, `game:robotrek`, `priority:high`
   - Description: Test text extraction and TBL accuracy
   - Acceptance: All dialog extracted correctly

9. **[TOOL] Verify sprite extractor output**
   - Labels: `tools`, `game:robotrek`, `priority:medium`
   - Description: Test 4bpp sprite extraction to PNG
   - Acceptance: Character sprites export correctly

10. **[TOOL] Test asset extraction pipeline**
    - Labels: `tools`, `game:robotrek`, `priority:high`
    - Description: Run full asset extraction and verify outputs
    - Acceptance: All assets extracted to correct formats

11. **[TOOL] Test ROM build pipeline**
    - Labels: `tools`, `game:robotrek`, `priority:high`
    - Description: Build ROM from extracted assets and verify match
    - Acceptance: Built ROM matches original (or expected differences documented)

### Disassembly Issues

12. **[DISASM] Disassemble main game loop**
    - Labels: `disassembly`, `game:robotrek`, `priority:high`
    - Description: Identify and document main game loop and state machine
    - Acceptance: Annotated assembly with labels

13. **[DISASM] Disassemble battle system**
    - Labels: `disassembly`, `game:robotrek`, `priority:high`
    - Description: Document battle engine, turn order, damage calculation
    - Acceptance: Annotated battle code

14. **[DISASM] Disassemble invention system**
    - Labels: `disassembly`, `game:robotrek`, `priority:medium`
    - Description: Document invention creation and robot building code
    - Acceptance: Annotated invention code

15. **[DISASM] Disassemble text engine**
    - Labels: `disassembly`, `game:robotrek`, `priority:medium`
    - Description: Document text decompression and display routines
    - Acceptance: Annotated text engine

16. **[DISASM] Disassemble map/event engine**
    - Labels: `disassembly`, `game:robotrek`, `priority:medium`
    - Description: Document map loading, tile rendering, event triggers
    - Acceptance: Annotated map engine

### Research Issues

17. **[RESEARCH] Locate all data tables in ROM**
    - Labels: `research`, `game:robotrek`, `priority:high`
    - Description: Find exact addresses for items, enemies, inventions, text
    - Acceptance: Verified address list

18. **[RESEARCH] Document compression methods**
    - Labels: `research`, `game:robotrek`, `priority:medium`
    - Description: Identify and document any data compression used
    - Acceptance: Compression algorithm documented

19. **[RESEARCH] Compare US/JP versions**
    - Labels: `research`, `game:robotrek`, `priority:low`
    - Description: Document differences between Robotrek (US) and Slapstick (JP)
    - Acceptance: Comparison document

## Labels to Create

- `game:robotrek` - Robotrek-specific issues
- `documentation` - Wiki/docs work
- `tools` - Python/C# tool development
- `disassembly` - ASM reverse engineering
- `research` - Data location and analysis
- `priority:high` - Critical path items
- `priority:medium` - Important but not blocking
- `priority:low` - Nice to have

## Milestones

1. **Milestone: Robotrek Data Extraction** (Target: Tool verification complete)
2. **Milestone: Robotrek Documentation v1** (Target: All wiki pages with basic data)
3. **Milestone: Robotrek Disassembly v1** (Target: Core systems documented)
