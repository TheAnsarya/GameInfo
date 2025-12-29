# GitHub Issue: Epic: Secret of Mana Full Documentation and Disassembly

Use this content to create a new GitHub issue for the GameInfo repository.

---

## Issue Title
Epic: Secret of Mana Full Documentation and Disassembly

## Issue Labels
- `type:epic`
- `game:secret-of-mana` (create new label)
- `priority:high`

## Issue Body

### Overview

Comprehensive disassembly, documentation, and tool development for **Secret of Mana** (Seiken Densetsu 2) on the Super Nintendo Entertainment System.

### ROM Information

| Property | Value |
|----------|-------|
| **Game** | Secret of Mana (Seiken Densetsu 2) |
| **Platform** | SNES |
| **Region** | USA |
| **ROM File** | Secret of Mana (U) [!].sfc |
| **Size** | 2 MB (2,097,152 bytes) |
| **Mapping** | HiROM |
| **SHA256** | `4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f` |

### Project Goals

1. **Complete ROM Disassembly** - Full annotated 65816 assembly
2. **Comprehensive Documentation** - ROM map, RAM map, data structures
3. **Asset Extraction Tools** - Graphics, audio, text, maps
4. **Asset Editing Tools** - Per-game editor + universal editor integration
5. **Build Pipeline** - Reassemble ROM with verification
6. **Wiki Content** - Dark Repos wiki pages

### Phase Structure

#### Phase 1: Foundation (Week 1-2) ✅ Partially Complete
- [x] Create folder structure
- [x] Create roadmap and documentation
- [x] Create C# data module with tests (54 tests passing)
- [ ] Complete ROM header analysis
- [ ] Initialize build configuration

#### Phase 2: Disassembly (Week 3-6)
- [ ] Bank-by-bank disassembly
- [ ] Code documentation and labeling
- [ ] Data structure analysis

#### Phase 3: Asset Extraction (Week 7-10)
- [ ] Graphics extraction (sprites, tilesets, UI)
- [ ] Audio extraction (BRR samples, SPC sequences)
- [ ] Text extraction with control codes
- [ ] Map data extraction

#### Phase 4: Editor Development (Week 11-16)
- [ ] Per-game Secret of Mana editor
- [ ] Universal editor integration
- [ ] Character/enemy/item editors
- [ ] Map viewer

#### Phase 5: Build Pipeline (Week 17-18)
- [ ] Assembly configuration
- [ ] Asset pipeline (bidirectional conversion)
- [ ] ROM verification system

#### Phase 6: Documentation & Wiki (Week 19-20)
- [ ] Complete ROM/RAM maps
- [ ] Dark Repos wiki pages
- [ ] User documentation and tutorials

### Known Data Locations (from Data Crystal)

#### ROM Addresses
| Offset | Description |
|--------|-------------|
| `$101dfa` | Enemy stats table |
| `$104213` | Character level stats |
| `$105116` | Enemy AI/movement |
| `$033d39` | SPC music pointers |
| `$083000` | Exit/warp data |

#### RAM Addresses
| Address | Description |
|---------|-------------|
| `$7ee000` | Character 1 (Hero) data |
| `$7ee200` | Character 2 (Girl) data |
| `$7ee400` | Character 3 (Sprite) data |
| `$7ee600-$7eea00` | Enemy data blocks |
| `$7ec800` | NPC/Entity table |

### Reference Sources

- [Data Crystal ROM/RAM Map](https://datacrystal.tcrf.net/wiki/Secret_of_Mana_(SNES))
- [TCRF Unused Content](https://tcrf.net/Secret_of_Mana_(SNES))
- [RomHacking.net](https://www.romhacking.net/games/799/)

### Sub-Issues to Create

1. `[SETUP] Project structure and configuration` ✅ Complete
2. `[DISASM] Disassemble Banks $00-$0f (Core Engine)`
3. `[DISASM] Disassemble Banks $10-$1f (Game Logic)`
4. `[DISASM] Disassemble Banks $20-$2f (Events/Scripts)`
5. `[DISASM] Disassemble Banks $30-$3f (Data Tables)`
6. `[DISASM] Disassemble Banks $40-$ff (Graphics/Audio)`
7. `[DOCS] Complete ROM map documentation`
8. `[DOCS] Complete RAM map documentation`
9. `[DOCS] Data structures documentation`
10. `[TOOL] Graphics extraction tools`
11. `[TOOL] Audio extraction tools (SPC/BRR)`
12. `[TOOL] Text extraction and editing`
13. `[TOOL] Map data extraction`
14. `[EDITOR] Per-game Secret of Mana editor`
15. `[EDITOR] Universal editor integration`
16. `[BUILD] Assembly and build pipeline`
17. `[WIKI] Dark Repos wiki content`

### Initial Commit

- Commit: `d02bace`
- Files added: 11 files, 2526 insertions
- Tests: 54 passing

### Success Criteria

- [ ] Complete disassembly reassembles to identical ROM
- [ ] All major data structures documented
- [ ] Asset extraction tools for all asset types
- [ ] Functional editors for game modification
- [ ] Comprehensive wiki documentation
- [ ] All hexadecimal values in lowercase
- [ ] Integration with DarkRepos universal editor

---

## Related Issues

Link to:
- #9 Epic: Game-Specific Disassemblies
- #10 Epic: Asset Extraction Pipeline
