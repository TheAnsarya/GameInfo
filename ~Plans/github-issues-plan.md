# GitHub Issues Plan - Atari 2600 Roundtrip Testing

**Created**: January 17, 2026  
**Purpose**: Organize work for Peony/Poppy/GameInfo Atari 2600 support and roundtrip testing

## Issue Organization

### Peony Repository (Disassembler)

**Epic: Atari 2600 Disassembly Improvements**

1. **Bug: DPC Mapper Support Broken** (High Priority)
   - Labels: `bug`, `atari2600`, `mapper`
   - Description: Pitfall II (DPC chip) produces 0 blocks
   - Acceptance: Pitfall II disassembles successfully with DPC-specific analysis

2. **Enhancement: Multi-Bank Traversal Incomplete** (Medium Priority)
   - Labels: `enhancement`, `bank-switching`
   - Description: `--all-banks` flag doesn't fully traverse all banks
   - Acceptance: All banks in MMC1/F8/F6/F4 ROMs are analyzed

3. **Testing: Expand ROM Test Coverage** (Low Priority)
   - Labels: `testing`, `atari2600`
   - Description: Test 50+ representative ROMs across all mappers
   - Acceptance: 90%+ success rate, documented results

---

### Poppy Repository (Assembler)

**Epic: Atari 2600 Platform Support**

4. **Feature: Atari 2600 Code Generation** (High Priority)
   - Labels: `feature`, `atari2600`, `platform`
   - Description: Implement 6502 code generation for Atari 2600 target
   - Output format: `.a26` files (not `.bin`)
   - Acceptance: Hello World assembles to valid .a26 ROM

5. **Feature: Bank Switching Directives** (High Priority)
   - Labels: `feature`, `atari2600`, `bank-switching`
   - Description: Add `.f8`, `.f6`, `.f4`, `.fe`, `.e0` directives
   - Acceptance: Multi-bank ROMs assemble correctly

6. **Feature: Atari 2600 Pseudo-Ops** (Medium Priority)
   - Labels: `feature`, `atari2600`
   - Description: Add `.a2600_vectors`, `.a2600_header` directives
   - Acceptance: ROM headers generate correctly

7. **Documentation: Atari 2600 Assembly Guide** (Low Priority)
   - Labels: `documentation`, `atari2600`
   - Description: Create comprehensive 2600 assembly guide
   - Acceptance: Examples for all mappers, hardware registers documented

---

### GameInfo Repository (Documentation & Organization)

**Epic: Atari 2600 Game Projects**

8. **Feature: Expand Game Project Structure** (High Priority)
   - Labels: `feature`, `atari2600`, `organization`
   - Description: Create project folders for 10+ tested ROMs
   - Games: Ms. Pac-Man, Combat, Donkey Kong, E.T., Pac-Man, Space Invaders, Pitfall, Yars' Revenge, Asteroids, Missile Command
   - Acceptance: Each has source/, assets/, builds/, wiki/, docs/

9. **Documentation: Game Projects Section** (High Priority)
   - Labels: `documentation`, `atari2600`
   - Description: Add game projects index to Atari-2600/README.md
   - Acceptance: Table with status, ROM info, links to projects

10. **Documentation: Asset Extraction Guide** (Medium Priority)
    - Labels: `documentation`, `atari2600`, `tutorial`
    - Description: Document how to extract graphics, audio, data
    - Acceptance: Step-by-step guide with examples

11. **Documentation: Build Pipeline Examples** (Medium Priority)
    - Labels: `documentation`, `build-system`
    - Description: Create working build.config.json examples
    - Acceptance: Adventure builds successfully from source

12. **Testing: Systematic ROM Testing** (Low Priority)
    - Labels: `testing`, `atari2600`
    - Description: Test 50+ ROMs systematically with Peony/Poppy
    - Acceptance: Results documented, issues filed for failures

---

### Cross-Repository Issues

**Epic: Roundtrip Verification**

13. **Feature: Roundtrip Testing Workflow** (High Priority)
    - Labels: `feature`, `testing`, `roundtrip`
    - Repos: Peony, Poppy, GameInfo
    - Description: Automate Peony → Poppy → Verify CRC32 workflow
    - Acceptance: Script runs, reports match percentage

14. **Feature: Roundtrip Test Suite** (Medium Priority)
    - Labels: `testing`, `ci-cd`
    - Description: Create CI/CD pipeline for roundtrip tests
    - Acceptance: GitHub Actions runs on PR, reports results

---

## Milestones

### Milestone 1: Basic Roundtrip (Target: Feb 2026)
- Issue #4: Atari 2600 Code Generation
- Issue #5: Bank Switching Directives
- Issue #13: Roundtrip Testing Workflow
- **Goal**: Assemble/disassemble Adventure successfully

### Milestone 2: Multi-Game Support (Target: Mar 2026)
- Issue #8: Expand Game Project Structure
- Issue #9: Game Projects Section
- Issue #1: DPC Mapper Support
- Issue #2: Multi-Bank Traversal
- **Goal**: 10+ games in GameInfo structure

### Milestone 3: Documentation Complete (Target: Apr 2026)
- Issue #10: Asset Extraction Guide
- Issue #11: Build Pipeline Examples
- Issue #7: Atari 2600 Assembly Guide
- **Goal**: Comprehensive docs for 2600 development

### Milestone 4: Production Ready (Target: May 2026)
- Issue #3: Expand ROM Test Coverage
- Issue #12: Systematic ROM Testing
- Issue #14: Roundtrip Test Suite
- **Goal**: 90%+ roundtrip success rate

---

## Priority Matrix

| Priority | Peony | Poppy | GameInfo |
|----------|-------|-------|----------|
| **High** | #1 DPC Bug | #4 Code Gen<br>#5 Bank Switch | #8 Game Projects<br>#9 Docs |
| **Medium** | #2 Multi-Bank | #6 Pseudo-Ops | #10 Asset Guide<br>#11 Build Examples |
| **Low** | #3 Testing | #7 Docs | #12 ROM Testing |

---

## Implementation Order

1. **Week 1**: Poppy Atari 2600 basic support (#4)
2. **Week 2**: Roundtrip workflow script (#13)
3. **Week 3**: Bank switching (#5) + DPC fix (#1)
4. **Week 4**: Game projects expansion (#8, #9)
5. **Week 5-8**: Documentation (#10, #11, #7)
6. **Week 9-12**: Testing & polish (#3, #12, #14)

---

## Notes

- **File Extensions**: Always use `.a26` for Atari 2600 ROMs (not `.bin`)
- **Directory Structure**: `GameInfo/<System>/<Game (Year) (Publisher) [Region]>/`
- **Branch Strategy**: Create feature branches for each issue
- **Commit Format**: `type(scope): description (#issue-number)`

