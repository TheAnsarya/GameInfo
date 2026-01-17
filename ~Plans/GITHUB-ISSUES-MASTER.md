# 📋 GitHub Issues Master List

> All planned issues across the GameInfo ecosystem
> **Created:** 2026-01-16

---

## 📊 Summary by Repository

| Repository | Epic Issues | Feature Issues | Bug Issues | Total |
|------------|-------------|----------------|------------|-------|
| GameInfo | 5 | 25 | 5 | 35 |
| Poppy | 2 | 10 | 3 | 15 |
| BPS-Patch | 1 | 5 | 2 | 8 |
| Peony (new) | 3 | 15 | 0 | 18 |
| dragon-warrior-4-info | 2 | 10 | 2 | 14 |
| ffmq-info | 2 | 8 | 2 | 12 |
| Other repos | 3 | 15 | 5 | 23 |
| **Total** | **18** | **88** | **19** | **125** |

---

## 🎯 GameInfo Repository Issues

### Epics

#### [EPIC] Atari 2600 Disassembly Initiative
```markdown
## Description
Disassemble 40+ classic Atari 2600 games using Peony and document them with Poppy-compatible source.

## Acceptance Criteria
- [ ] 40 games fully disassembled
- [ ] All games reassemble to identical ROMs
- [ ] Wiki pages for all games
- [ ] Documentation for TIA/RIOT usage

## Sub-Issues
- Batch 1: Games 1-10
- Batch 2: Games 11-20
- Batch 3: Games 21-30
- Batch 4: Games 31-40
```

#### [EPIC] Tool Extraction
```markdown
## Description
Extract large tools into standalone repositories:
- Peony (disassembler)
- GameInfo-Tools (CLI toolkit)
- DarkRepos-Editor (wiki editor)

## Acceptance Criteria
- [ ] All tools in separate repos
- [ ] NuGet packages published
- [ ] GameInfo references external tools
- [ ] Documentation updated
```

#### [EPIC] Build System Standardization
```markdown
## Description
Standardize all projects on Poppy assembler and BPS-Patch.

## Acceptance Criteria
- [ ] All projects use build.config.json
- [ ] All projects use Poppy
- [ ] All projects use BPS-Patch
- [ ] No legacy assembler dependencies
```

### Feature Issues

#### [Feature] Create Atari 2600 constants file
```markdown
**Labels:** enhancement, atari2600, documentation
**Priority:** High

Create a comprehensive TIA/RIOT constants file for Atari 2600 disassemblies.
```

#### [Feature] Create Atari 2600 project template
```markdown
**Labels:** enhancement, atari2600, template
**Priority:** High

Create a template structure for new Atari 2600 disassembly projects.
```

#### [Feature] Disassemble Adventure (Atari 2600)
```markdown
**Labels:** enhancement, atari2600, disassembly, tier-1
**Priority:** High

Disassemble the classic game Adventure (1979, Atari).
- ROM: Adventure (1979) (Atari) [!].a26
- Size: 4K
- Banked: No
```

#### [Feature] Disassemble Asteroids (Atari 2600)
```markdown
**Labels:** enhancement, atari2600, disassembly, tier-1
**Priority:** High

Disassemble Asteroids (1981, Atari).
- ROM: Asteroids (1981) (Atari) [!].a26
- Size: 8K (F8 bankswitched)
```

#### [Feature] Disassemble Pitfall! (Atari 2600)
```markdown
**Labels:** enhancement, atari2600, disassembly, tier-1
**Priority:** High

Disassemble Pitfall! (1982, Activision).
- ROM: Pitfall! (1982) (Activision) [!].a26
- Size: 4K
```

#### [Feature] Disassemble Space Invaders (Atari 2600)
```markdown
**Labels:** enhancement, atari2600, disassembly, tier-1
**Priority:** High

Disassemble Space Invaders (1978, Atari).
- ROM: Space Invaders (1978) (Atari) [!].a26
- Size: 4K
```

#### [Feature] Wiki pages for Atari 2600 games
```markdown
**Labels:** enhancement, wiki, documentation
**Priority:** Medium

Create DarkRepos wiki pages for all disassembled Atari 2600 games.
```

---

## 🌸 Poppy Repository Issues

### Epics

#### [EPIC] Atari 2600 Full Support
```markdown
## Description
Complete Atari 2600 support in Poppy assembler.

## Acceptance Criteria
- [ ] 6507 instruction set complete
- [ ] TIA register macros
- [ ] Bank switching support (F8, F6, F4, etc.)
- [ ] ROM header generation
- [ ] Test suite with real games
```

### Feature Issues

#### [Feature] Add TIA register defines
```markdown
**Labels:** enhancement, atari2600
**Priority:** High

Add built-in TIA register definitions for Atari 2600 target.
```

#### [Feature] Add F8 bankswitching support
```markdown
**Labels:** enhancement, atari2600, mapper
**Priority:** High

Support F8 (8K) bankswitching for Atari 2600.
```

#### [Feature] Add F6 bankswitching support
```markdown
**Labels:** enhancement, atari2600, mapper
**Priority:** Medium

Support F6 (16K) bankswitching for Atari 2600.
```

#### [Feature] Add F4 bankswitching support
```markdown
**Labels:** enhancement, atari2600, mapper
**Priority:** Medium

Support F4 (32K) bankswitching for Atari 2600.
```

#### [Feature] Atari 2600 ROM verification
```markdown
**Labels:** enhancement, atari2600, verification
**Priority:** Medium

Add verification that assembled Atari 2600 ROMs are valid.
```

---

## 🔧 BPS-Patch Repository Issues

### Feature Issues

#### [Feature] CLI batch mode
```markdown
**Labels:** enhancement, cli
**Priority:** Medium

Add batch mode to process multiple files at once.
```

#### [Feature] Integration with GameInfo
```markdown
**Labels:** enhancement, integration
**Priority:** Medium

Create integration package for use in GameInfo build pipelines.
```

---

## 🌼 Peony Repository Issues (New)

### Epics

#### [EPIC] Core Framework
```markdown
## Description
Build the core disassembly framework for Peony.

## Acceptance Criteria
- [ ] CPU abstraction layer
- [ ] Platform abstraction layer
- [ ] Output formatter abstraction
- [ ] CLI framework
- [ ] Test infrastructure
```

#### [EPIC] 6502 Family Support
```markdown
## Description
Implement 6502/6507/65C02 disassembly support.

## Acceptance Criteria
- [ ] Full 6502 instruction decoder
- [ ] 6507 (Atari 2600) support
- [ ] 65C02 (Lynx) support
- [ ] All addressing modes
- [ ] Illegal opcode support (optional)
```

#### [EPIC] Atari 2600 Platform
```markdown
## Description
Implement Atari 2600 platform-specific analysis.

## Acceptance Criteria
- [ ] TIA register recognition
- [ ] RIOT register recognition
- [ ] Bank switching detection
- [ ] Kernel pattern analysis
- [ ] 40 games disassembled
```

### Feature Issues

#### [Feature] Create repository and basic structure
```markdown
**Labels:** enhancement, infrastructure
**Priority:** Critical

Create the Peony repository with initial structure.
```

#### [Feature] Implement 6502 instruction decoder
```markdown
**Labels:** enhancement, cpu, 6502
**Priority:** Critical

Implement complete 6502 instruction decoding.
```

#### [Feature] Implement linear sweep disassembler
```markdown
**Labels:** enhancement, core
**Priority:** High

Implement basic linear sweep disassembly algorithm.
```

#### [Feature] Implement recursive descent disassembler
```markdown
**Labels:** enhancement, core
**Priority:** High

Implement recursive descent disassembly algorithm.
```

#### [Feature] TIA register auto-labeling
```markdown
**Labels:** enhancement, atari2600
**Priority:** High

Automatically label TIA register accesses.
```

#### [Feature] RIOT register auto-labeling
```markdown
**Labels:** enhancement, atari2600
**Priority:** High

Automatically label RIOT register accesses.
```

#### [Feature] Bank switching detection
```markdown
**Labels:** enhancement, atari2600, mapper
**Priority:** High

Detect and handle Atari 2600 bank switching schemes.
```

#### [Feature] Poppy output format
```markdown
**Labels:** enhancement, output
**Priority:** Critical

Output .pasm files compatible with Poppy assembler.
```

#### [Feature] Roundtrip verification
```markdown
**Labels:** enhancement, verification
**Priority:** Critical

Verify disassembled code reassembles to identical ROM.
```

#### [Feature] Mesen2 CDL import
```markdown
**Labels:** enhancement, integration
**Priority:** Medium

Import Code/Data Logger files from Mesen2.
```

#### [Feature] DiztinGUIsh import
```markdown
**Labels:** enhancement, integration
**Priority:** Medium

Import project files from DiztinGUIsh.
```

#### [Feature] Symbol file export
```markdown
**Labels:** enhancement, output
**Priority:** Medium

Export symbol files in various formats.
```

---

## 🐉 dragon-warrior-4-info Issues

### Epics

#### [EPIC] Convert to Poppy
```markdown
## Description
Convert entire project from Ophis to Poppy assembler.

## Acceptance Criteria
- [ ] All .asm files converted to .pasm
- [ ] build.config.json created
- [ ] build.ps1 updated
- [ ] Ophis removed
- [ ] ROM builds identically
```

### Feature Issues

#### [Feature] Create build.config.json
```markdown
**Labels:** enhancement, build
**Priority:** High

Create standardized build.config.json for the project.
```

#### [Feature] Convert assembly syntax
```markdown
**Labels:** enhancement, migration
**Priority:** High

Convert all Ophis syntax to Poppy syntax.
```

#### [Feature] Update build.ps1
```markdown
**Labels:** enhancement, build
**Priority:** High

Update build script to use Poppy and BPS-Patch.
```

#### [Feature] Remove Ophis dependency
```markdown
**Labels:** enhancement, cleanup
**Priority:** Medium

Remove bundled Ophis assembler and references.
```

---

## 🌟 ffmq-info Issues

### Epics

#### [EPIC] Convert to Poppy
```markdown
## Description
Convert entire project from ASAR to Poppy assembler.

## Acceptance Criteria
- [ ] All .asm files converted to .pasm
- [ ] build.config.json created
- [ ] 65816 features working
- [ ] LoROM mapping correct
- [ ] ROM builds identically
```

### Feature Issues

#### [Feature] Create build.config.json
```markdown
**Labels:** enhancement, build
**Priority:** High

Create standardized build.config.json for the project.
```

#### [Feature] Convert ASAR syntax to Poppy
```markdown
**Labels:** enhancement, migration
**Priority:** High

Convert all ASAR-specific syntax to Poppy.
```

#### [Feature] Verify 65816 instruction support
```markdown
**Labels:** enhancement, verification
**Priority:** High

Verify all 65816 instructions used are supported by Poppy.
```

---

## 📝 Issue Templates

### Feature Request Template
```markdown
---
name: Feature Request
about: Suggest a new feature
title: '[Feature] '
labels: enhancement
---

## Description
A clear description of the feature.

## Use Case
Why is this feature needed?

## Proposed Solution
How should this work?

## Alternatives Considered
Any alternative approaches?

## Additional Context
Any other relevant information.
```

### Bug Report Template
```markdown
---
name: Bug Report
about: Report a bug
title: '[Bug] '
labels: bug
---

## Description
What went wrong?

## Steps to Reproduce
1. Step one
2. Step two
3. ...

## Expected Behavior
What should happen?

## Actual Behavior
What actually happens?

## Environment
- OS: 
- Version:
- .NET Version:

## Additional Context
Any other relevant information.
```

### Disassembly Task Template
```markdown
---
name: Disassembly Task
about: Disassemble a game
title: '[Disassembly] '
labels: enhancement, disassembly
---

## Game Information
- **Name:** 
- **Platform:** 
- **Publisher:** 
- **Year:** 
- **ROM File:** 
- **Size:** 
- **Banked:** Yes/No
- **Mapper:** (if applicable)

## Tasks
- [ ] Initial disassembly with Peony
- [ ] Label all subroutines
- [ ] Document RAM variables
- [ ] Document graphics format
- [ ] Verify roundtrip
- [ ] Write documentation
- [ ] Create wiki page

## Notes
Any special considerations.
```

---

## 🏷️ Label Definitions

| Label | Description | Color |
|-------|-------------|-------|
| `enhancement` | New feature | #a2eeef |
| `bug` | Something isn't working | #d73a4a |
| `documentation` | Documentation improvements | #0075ca |
| `atari2600` | Atari 2600 related | #7c3aed |
| `nes` | NES related | #dc2626 |
| `snes` | SNES related | #9333ea |
| `disassembly` | Disassembly task | #10b981 |
| `build` | Build system | #f59e0b |
| `migration` | Migration task | #6366f1 |
| `tier-1` | Priority classic game | #ef4444 |
| `tier-2` | Important game | #f97316 |
| `tier-3` | Additional game | #22c55e |
| `epic` | Epic/parent issue | #8b5cf6 |
| `blocked` | Blocked by dependency | #64748b |

---

## 🔄 Issue Creation Script

```powershell
# Create issues programmatically using GitHub CLI

# GameInfo Atari 2600 disassembly issues
$games = @(
    @{Name="Adventure"; Year=1979; Publisher="Atari"; Size="4K"; Banked=$false},
    @{Name="Asteroids"; Year=1981; Publisher="Atari"; Size="8K"; Banked=$true},
    @{Name="Combat"; Year=1977; Publisher="Atari"; Size="2K"; Banked=$false},
    # ... add all 40 games
)

foreach ($game in $games) {
    $title = "[Disassembly] $($game.Name) (Atari 2600)"
    $body = @"
## Game Information
- **Name:** $($game.Name)
- **Platform:** Atari 2600
- **Publisher:** $($game.Publisher)
- **Year:** $($game.Year)
- **Size:** $($game.Size)
- **Banked:** $($game.Banked)

## Tasks
- [ ] Initial disassembly with Peony
- [ ] Label all subroutines
- [ ] Document RAM variables
- [ ] Verify roundtrip
- [ ] Create wiki page
"@
    
    gh issue create --repo "TheAnsarya/GameInfo" --title $title --body $body --label "enhancement,disassembly,atari2600"
}
```

---

*Last Updated: 2026-01-16*
