# Atari 2600 Roundtrip Project - Master Tracker

**Last Updated**: January 17, 2026  
**Status**: Planning Complete, Ready for Implementation

## 📊 Overview

This project implements complete Atari 2600 support across Peony (disassembler), Poppy (assembler), and GameInfo (documentation/organization) to enable roundtrip ROM testing and comprehensive game documentation.

## 🎯 Goals

1. **Roundtrip Workflow**: Disassemble → Edit → Reassemble → Verify
2. **Game Projects**: 10+ documented Atari 2600 games in GameInfo
3. **Build Pipeline**: Automated asset extraction and ROM building
4. **Documentation**: Comprehensive guides for 2600 development

## 📋 Issue Tracking

### Peony Repository

| # | Title | Priority | Status | Milestone | Assignee |
|---|-------|----------|--------|-----------|----------|
| 1 | Fix DPC mapper support | 🔴 High | 📝 Planned | M1: Basic Roundtrip | - |
| 2 | Improve multi-bank traversal | 🟡 Medium | 📝 Planned | M2: Multi-Game | - |
| 3 | Expand ROM test coverage | 🟢 Low | 📝 Planned | M4: Production | - |

### Poppy Repository

| # | Title | Priority | Status | Milestone | Assignee |
|---|-------|----------|--------|-----------|----------|
| 4 | Atari 2600 code generation | 🔴 High | 📝 Planned | M1: Basic Roundtrip | - |
| 5 | Bank switching directives | 🔴 High | 📝 Planned | M1: Basic Roundtrip | - |
| 6 | Atari 2600 pseudo-ops | 🟡 Medium | 📝 Planned | M3: Documentation | - |
| 7 | Atari 2600 assembly guide | 🟢 Low | 📝 Planned | M3: Documentation | - |

### GameInfo Repository

| # | Title | Priority | Status | Milestone | Assignee |
|---|-------|----------|--------|-----------|----------|
| 8 | Expand game project structure | 🔴 High | 📝 Planned | M2: Multi-Game | - |
| 9 | Game projects section docs | 🔴 High | 📝 Planned | M2: Multi-Game | - |
| 10 | Asset extraction guide | 🟡 Medium | 📝 Planned | M3: Documentation | - |
| 11 | Build pipeline examples | 🟡 Medium | 📝 Planned | M3: Documentation | - |
| 12 | Systematic ROM testing | 🟢 Low | 📝 Planned | M4: Production | - |

### Cross-Repository

| # | Title | Priority | Status | Milestone | Assignee |
|---|-------|----------|--------|-----------|----------|
| 13 | Roundtrip testing workflow | 🔴 High | 📝 Planned | M1: Basic Roundtrip | - |
| 14 | Roundtrip test suite (CI/CD) | 🟡 Medium | 📝 Planned | M4: Production | - |

## 🎢 Milestones

### Milestone 1: Basic Roundtrip (Target: Feb 2026)
**Goal**: Assemble/disassemble Adventure successfully

- [ ] Issue #4: Atari 2600 code generation (Poppy)
- [ ] Issue #5: Bank switching directives (Poppy)
- [ ] Issue #13: Roundtrip testing workflow (All)
- [ ] Adventure (PAL) roundtrip verification passes

**Success Criteria**: 100% byte match on Adventure ROM

### Milestone 2: Multi-Game Support (Target: Mar 2026)
**Goal**: 10+ games in GameInfo structure

- [ ] Issue #8: Expand game project structure (GameInfo)
- [ ] Issue #9: Game projects section (GameInfo)
- [ ] Issue #1: DPC mapper support (Peony)
- [ ] Issue #2: Multi-bank traversal (Peony)
- [ ] 10+ game projects created
- [ ] Ms. Pac-Man (F6) and Pitfall II (DPC) working

**Success Criteria**: 10 games with complete project structure

### Milestone 3: Documentation Complete (Target: Apr 2026)
**Goal**: Comprehensive docs for 2600 development

- [ ] Issue #10: Asset extraction guide (GameInfo)
- [ ] Issue #11: Build pipeline examples (GameInfo)
- [ ] Issue #7: Atari 2600 assembly guide (Poppy)
- [ ] Issue #6: Atari 2600 pseudo-ops (Poppy)
- [ ] Complete documentation for all mappers
- [ ] Working examples for asset extraction

**Success Criteria**: Newcomer can build ROM hack from docs alone

### Milestone 4: Production Ready (Target: May 2026)
**Goal**: 90%+ roundtrip success rate

- [ ] Issue #3: Expand ROM test coverage (Peony)
- [ ] Issue #12: Systematic ROM testing (GameInfo)
- [ ] Issue #14: Roundtrip test suite (All)
- [ ] 50+ ROMs tested
- [ ] CI/CD pipeline running
- [ ] All major mappers supported

**Success Criteria**: 90% of Good2600 collection roundtrips successfully

## 📈 Progress Tracking

### Overall Progress: 0% (0/14 issues complete)

**By Repository:**
- Peony: 0/3 issues (0%)
- Poppy: 0/4 issues (0%)
- GameInfo: 0/5 issues (0%)
- Cross-Repo: 0/2 issues (0%)

**By Priority:**
- High: 0/7 issues (0%)
- Medium: 0/5 issues (0%)
- Low: 0/2 issues (0%)

**By Milestone:**
- M1 Basic Roundtrip: 0/3 issues (0%)
- M2 Multi-Game: 0/4 issues (0%)
- M3 Documentation: 0/4 issues (0%)
- M4 Production: 0/3 issues (0%)

## 📅 Timeline

### Week 1-2: Foundation (Issues #4, #13)
- Implement Poppy Atari 2600 basic support
- Create roundtrip workflow script
- Test with Adventure ROM

### Week 3-4: Bank Switching (Issues #5, #1)
- Add F8/F6/F4 bank switching to Poppy
- Fix DPC mapper in Peony
- Test with multi-bank ROMs

### Week 5-6: Game Projects (Issues #8, #9)
- Create 10+ game project directories
- Disassemble all ROMs
- Document game projects section

### Week 7-8: Multi-Bank (Issue #2)
- Improve Peony multi-bank traversal
- Test with complex ROMs
- Verify cross-bank references

### Week 9-12: Documentation (Issues #10, #11, #7, #6)
- Write asset extraction guide
- Create build pipeline examples
- Document Atari 2600 assembly
- Add pseudo-ops and helpers

### Week 13-16: Testing & Polish (Issues #3, #12, #14)
- Systematic ROM testing (50+ games)
- CI/CD pipeline setup
- Bug fixes and refinements

## 🔗 Related Resources

### Documentation
- [GitHub Issues Plan](github-issues-plan.md) - Detailed issue descriptions
- [Atari 2600 README](../docs/Atari-2600/README.md) - Platform documentation
- [Bank Switching Guide](../docs/Atari-2600/Bank-Switching.md) - Mapper reference

### Repositories
- **Peony**: https://github.com/TheAnsarya/peony
- **Poppy**: https://github.com/TheAnsarya/poppy
- **GameInfo**: https://github.com/TheAnsarya/GameInfo

### Game Projects
- [Adventure (1978) (Atari) [PAL]](../Atari2600/Adventure%20(1978)%20(Atari)%20[PAL]/) - Completed example

## 📝 Notes

- **File Extensions**: Always use `.a26` for Atari 2600 ROMs
- **Directory Naming**: `<Game> (<Year>) (<Publisher>) [<Region>]`
- **Branch Strategy**: Create feature branches like `feature/issue-04-atari2600`
- **Commit Format**: `type(scope): description (#issue-number)`

## 🚀 Next Actions

1. **Create GitHub Issues** - Post issue templates to repositories
2. **Create Project Boards** - Set up Kanban boards for tracking
3. **Start Issue #4** - Begin Poppy Atari 2600 implementation
4. **Set Milestones** - Configure milestone due dates in GitHub

---

**Status Key:**
- 📝 Planned - Issue documented, not started
- 🔨 In Progress - Actively being worked on
- ✅ Complete - Issue closed, merged
- ⏸️ Blocked - Waiting on dependency
- ❌ Cancelled - Issue deprecated/rejected
