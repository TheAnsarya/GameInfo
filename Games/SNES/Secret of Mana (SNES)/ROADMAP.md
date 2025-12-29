# Secret of Mana (SNES) - Project Roadmap

## Project Overview

**Game:** Secret of Mana (Seiken Densetsu 2)  
**Platform:** Super Nintendo Entertainment System (SNES)  
**Developer:** Square  
**Publishers:** Square (JP), Squaresoft (US), Nintendo (EU)  
**Release Dates:**
- Japan: August 6, 1993
- USA: October 3, 1993
- Europe: November 24, 1994

**ROM Information:**
- **File:** `Secret of Mana (U) [!].sfc`
- **Size:** 2,097,152 bytes (2 MB)
- **Mapping:** HiROM
- **SRAM:** 8 KiB
- **ROM Speed:** 200ns (SlowROM)
- **Checksum:** 0x51fc
- **SHA256:** `4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f`

---

## Project Goals

1. **Complete ROM Disassembly** - Full annotated 65816 assembly code
2. **Comprehensive Documentation** - ROM map, RAM map, data structures
3. **Asset Extraction Tools** - Graphics, audio, text, maps
4. **Asset Editing Tools** - Sprite editors, map editors, text editors
5. **Build Pipeline** - Reassemble ROM from source with verification
6. **Wiki Content** - Dark Repos wiki pages
7. **Editor Integration** - Per-game editor and universal editor integration

---

## Phase 1: Foundation (Week 1-2)

### 1.1 Project Setup
- [x] Create folder structure
- [x] Create roadmap document
- [ ] Create GitHub Epic and sub-issues
- [ ] Initialize build configuration
- [ ] Set up reference documentation

### 1.2 ROM Analysis
- [ ] Verify ROM integrity and checksums
- [ ] Identify header structure
- [ ] Map ROM banking layout
- [ ] Document existing knowledge from Data Crystal

### 1.3 Initial Documentation
- [ ] Create README.md
- [ ] Create ROM map skeleton
- [ ] Create RAM map skeleton
- [ ] Document reference sources

---

## Phase 2: Disassembly (Week 3-6)

### 2.1 Bank-by-Bank Disassembly
- [ ] Bank $00-$0f: Core engine code
- [ ] Bank $10-$1f: Game logic
- [ ] Bank $20-$2f: Event/script system
- [ ] Bank $30-$3f: Data tables
- [ ] Bank $40-$ff: Graphics and audio

### 2.2 Code Documentation
- [ ] Label all subroutines
- [ ] Document function purposes
- [ ] Create cross-reference table
- [ ] Identify and document algorithms

### 2.3 Data Structure Analysis
- [ ] Character stats structure (16 bytes each at $7ee000-$7ee5ff)
- [ ] Enemy data structure (at $105116, $101dfa)
- [ ] Item data tables
- [ ] Magic/spell data
- [ ] Map/exit data ($83000)

---

## Phase 3: Asset Extraction (Week 7-10)

### 3.1 Graphics Extraction
- [ ] Character sprites (playable characters)
- [ ] NPC sprites
- [ ] Enemy sprites
- [ ] Boss sprites
- [ ] UI graphics
- [ ] Map tilesets
- [ ] Title screen and logos

### 3.2 Audio Extraction
- [ ] BRR sample extraction (from $c347xx onwards)
- [ ] SPC sequence extraction (from $c4d3xx onwards)
- [ ] Sound effect data
- [ ] Music track listings (60+ tracks)

### 3.3 Text Extraction
- [ ] Dialog text with control codes
- [ ] Item names
- [ ] Enemy names
- [ ] Spell names
- [ ] Menu text
- [ ] System messages

### 3.4 Map Data Extraction
- [ ] Map tile data
- [ ] Map collision data
- [ ] Map event triggers
- [ ] Map exit data
- [ ] NPC placement data

---

## Phase 4: Editor Development (Week 11-16)

### 4.1 C# Data Module
- [ ] Create `GameInfoTools.Data.SecretOfMana` namespace
- [ ] Implement address conversion utilities (HiROM)
- [ ] Implement data structure classes
- [ ] Create unit tests

### 4.2 Per-Game Editor
- [ ] Character stats editor
- [ ] Enemy stats editor
- [ ] Item editor
- [ ] Magic editor
- [ ] Sprite viewer/editor
- [ ] Map viewer
- [ ] Text editor
- [ ] Audio player

### 4.3 Universal Editor Integration
- [ ] Add Secret of Mana to DarkRepos Editor
- [ ] Implement game detection
- [ ] Create editor panels
- [ ] Add save/load functionality

---

## Phase 5: Build Pipeline (Week 17-18)

### 5.1 Assembly System
- [ ] Set up assembler configuration
- [ ] Create include file structure
- [ ] Implement bank organization
- [ ] Create build scripts

### 5.2 Asset Pipeline
- [ ] Binary ↔ JSON conversion for data
- [ ] PNG ↔ Binary conversion for graphics
- [ ] Text ↔ Binary conversion for scripts
- [ ] Audio asset management

### 5.3 Verification
- [ ] Byte-for-byte ROM comparison
- [ ] Checksum verification
- [ ] Automated testing

---

## Phase 6: Documentation & Wiki (Week 19-20)

### 6.1 Technical Documentation
- [ ] Complete ROM map
- [ ] Complete RAM map
- [ ] Data structure documentation
- [ ] Compression format documentation

### 6.2 Dark Repos Wiki
- [ ] Main game page
- [ ] ROM map page
- [ ] RAM map page
- [ ] Data structures page
- [ ] Unused content page
- [ ] Regional differences page

### 6.3 User Documentation
- [ ] Editor usage guide
- [ ] Build instructions
- [ ] Asset extraction guide
- [ ] Modding tutorials

---

## Known Data Locations (from Data Crystal)

### ROM Addresses
| Address | Description |
|---------|-------------|
| $101dfa | Enemy stats (Rabite first) |
| $104213 | Main character level 1 stats |
| $105116 | Enemy movement/AI data |
| $33d39 | SPC pointers |
| $33f22 | Sample indexes |
| $83000 | Exit data (4-byte entries) |
| $a933f | Potos Village music data |
| $c347c3+ | BRR sample data |
| $c4d33d+ | SPC sequence data |
| $d03a50 | Rabite drop percentage |
| $d8fb9c | Item prices in stores |

### RAM Addresses
| Address | Description |
|---------|-------------|
| $7e0030 | Layer 2 transparency |
| $7e00dc | Exit destination |
| $7e00de | Exit X coordinate |
| $7e00df | Exit Y coordinate |
| $7ec800 | NPC/Enemy data (16 bytes each) |
| $7ee000 | Character 1 data |
| $7ee200 | Character 2 data |
| $7ee400 | Character 3 data |
| $7ee600 | Enemy 1 data |
| $7ee800 | Enemy 2 data |
| $7eea00 | Enemy 3 data |

---

## Reference Sources

1. **Data Crystal** - https://datacrystal.tcrf.net/wiki/Secret_of_Mana_(SNES)
   - ROM map, RAM map, text table
   - Existing bank disassemblies
   - External links to tools

2. **TCRF** - https://tcrf.net/Secret_of_Mana_(SNES)
   - Unused content documentation
   - Regional differences
   - Debug features

3. **ROMhacking.net** - https://www.romhacking.net/games/799/
   - Existing editors and tools
   - Hacks and translations
   - Community resources

4. **GameFAQs** - https://gamefaqs.gamespot.com/snes/588646-secret-of-mana/faqs
   - Game mechanics documentation
   - Item/enemy lists
   - Walkthroughs with technical details

---

## Existing Tools (Reference)

- **Secret of Mana Editor** - somedit.blogspot.com
- **SPC Editor** - JCE3000GT
- **SoM VWF Edition** - FuSoYa
- **SoM Drop Edit** - Item drop editing

---

## GitHub Issues Structure

```
Epic: Secret of Mana Full Documentation and Disassembly (#xxx)
├── [SETUP] Project structure and configuration
├── [DISASM] Bank disassemblies (multiple sub-issues)
│   ├── Disassemble Banks $00-$0f (Core Engine)
│   ├── Disassemble Banks $10-$1f (Game Logic)
│   ├── Disassemble Banks $20-$2f (Events/Scripts)
│   ├── Disassemble Banks $30-$3f (Data Tables)
│   └── Disassemble Banks $40-$ff (Graphics/Audio)
├── [DOCS] ROM map documentation
├── [DOCS] RAM map documentation
├── [DOCS] Data structures documentation
├── [TOOL] Asset extraction tools
│   ├── Graphics extractor
│   ├── Audio extractor
│   ├── Text extractor
│   └── Map extractor
├── [TOOL] Editor development
│   ├── C# data module
│   ├── Per-game editor
│   └── Universal editor integration
├── [BUILD] Build pipeline
│   ├── Assembly configuration
│   ├── Asset pipeline
│   └── Verification system
└── [WIKI] Dark Repos wiki content
```

---

## Success Criteria

1. ✅ Complete disassembly that reassembles to identical ROM
2. ✅ All major data structures documented
3. ✅ Asset extraction tools for all asset types
4. ✅ Functional editors for game modification
5. ✅ Comprehensive wiki documentation
6. ✅ All hexadecimal values in lowercase
7. ✅ Integration with DarkRepos universal editor

---

## Timeline Summary

| Phase | Duration | Status |
|-------|----------|--------|
| Phase 1: Foundation | Week 1-2 | 🔄 In Progress |
| Phase 2: Disassembly | Week 3-6 | ⏳ Pending |
| Phase 3: Asset Extraction | Week 7-10 | ⏳ Pending |
| Phase 4: Editor Development | Week 11-16 | ⏳ Pending |
| Phase 5: Build Pipeline | Week 17-18 | ⏳ Pending |
| Phase 6: Documentation | Week 19-20 | ⏳ Pending |

**Estimated Total Duration:** 20 weeks

---

*Last Updated: 2025-12-28*
