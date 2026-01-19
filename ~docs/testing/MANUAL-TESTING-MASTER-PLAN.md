# 🧪 Manual Testing Master Plan - Multi-Repository Test Suite

> **Created:** 2026-01-19 19:20 UTC  
> **Last Updated:** 2026-01-19 20:15 UTC  
> **Total Estimated Time:** 40-60 hours over 4 weeks  
> **Status:** 🟢 Ready to Execute

## 📋 Overview

This document provides comprehensive manual testing procedures for the entire ROM hacking toolkit ecosystem. Each test includes exact step-by-step instructions with screenshots, expected results, and troubleshooting guidance.

## 🗂️ Repository Coverage

| Repository | Type | Priority | Est. Time | Status |
|------------|------|----------|-----------|--------|
| 🌼 Pansy | Metadata Format | P1 | 8 hours | ⏳ |
| 🌺 Peony | Disassembler | P1 | 6 hours | ⏳ |
| 🌷 Poppy | Assembler | P1 | 6 hours | ⏳ |
| 🎮 Mesen2 | Emulator Fork | P1 | 8 hours | ⏳ |
| 🔧 GameInfo | Toolkit | P2 | 10 hours | ⏳ |
| 📦 bps-patch | Patching | P2 | 3 hours | ⏳ |
| 🐉 dragon-warrior-4-info | NES Disasm | P2 | 4 hours | ⏳ |
| 🐉 dragon-warrior-info | NES Disasm | P3 | 3 hours | ⏳ |
| ⚔️ ffmq-info | SNES Disasm | P2 | 4 hours | ⏳ |
| 🏰 dq3r-info | SNES Analysis | P3 | 3 hours | ⏳ |
| 🏰 dq4r-info | SNES Remix | P2 | 4 hours | ⏳ |
| 📊 logsmall | Libraries | P3 | 2 hours | ⏳ |
| 🔬 DiztinGUIsh | SNES Disasm | P3 | 3 hours | ⏳ |

## 📅 Testing Calendar

See [TESTING-CALENDAR.md](TESTING-CALENDAR.md) for detailed daily schedule.

### Week 1: Core Tools (Jan 20-26)
- **Mon-Tue:** 🌼 Pansy UI & CLI testing
- **Wed:** 🌼 Pansy format roundtrip testing
- **Thu-Fri:** 🌺 Peony disassembly testing
- **Sat-Sun:** 🌷 Poppy assembly testing

### Week 2: Integration (Jan 27 - Feb 2)
- **Mon-Tue:** 🎮 Mesen2 Pansy export testing
- **Wed-Thu:** Pansy ↔ Peony ↔ Poppy roundtrip
- **Fri-Sun:** 📦 bps-patch testing

### Week 3: Game Projects (Feb 3-9)
- **Mon-Tue:** 🐉 Dragon Warrior IV testing
- **Wed:** 🐉 Dragon Warrior I testing
- **Thu-Fri:** ⚔️ FFMQ testing
- **Sat-Sun:** 🏰 DQ3r/DQ4r testing

### Week 4: Polish & Documentation (Feb 10-16)
- **Mon-Wed:** 🔧 GameInfo toolkit testing
- **Thu:** 📊 logsmall testing
- **Fri:** 🔬 DiztinGUIsh testing
- **Sat-Sun:** Final verification & documentation

## 📚 Test Document Index

### Setup & Prerequisites
1. [PREREQUISITES.md](prerequisites/PREREQUISITES.md) - Required software installation
2. [ENVIRONMENT-SETUP.md](prerequisites/ENVIRONMENT-SETUP.md) - Development environment
3. [TEST-ROMS.md](prerequisites/TEST-ROMS.md) - Test ROM acquisition guide
4. [TOOL-INSTALLATION.md](prerequisites/TOOL-INSTALLATION.md) - External tool installation

### Per-Repository Test Guides
1. [PANSY-TESTING.md](repos/PANSY-TESTING.md) - 🌼 Pansy complete test suite
2. [PEONY-TESTING.md](repos/PEONY-TESTING.md) - 🌺 Peony complete test suite
3. [POPPY-TESTING.md](repos/POPPY-TESTING.md) - 🌷 Poppy complete test suite
4. [MESEN2-TESTING.md](repos/MESEN2-TESTING.md) - 🎮 Mesen2 fork test suite
5. [BPS-PATCH-TESTING.md](repos/BPS-PATCH-TESTING.md) - 📦 bps-patch test suite
6. [DW4-TESTING.md](repos/DW4-TESTING.md) - 🐉 Dragon Warrior IV test suite
7. [FFMQ-TESTING.md](repos/FFMQ-TESTING.md) - ⚔️ FFMQ test suite
8. [GAMEINFO-TESTING.md](repos/GAMEINFO-TESTING.md) - 🔧 GameInfo test suite

### Integration Test Guides
1. [INTEGRATION-PANSY-PEONY.md](integration/INTEGRATION-PANSY-PEONY.md)
2. [INTEGRATION-PANSY-POPPY.md](integration/INTEGRATION-PANSY-POPPY.md)
3. [INTEGRATION-MESEN2-PANSY.md](integration/INTEGRATION-MESEN2-PANSY.md)
4. [INTEGRATION-FULL-ROUNDTRIP.md](integration/INTEGRATION-FULL-ROUNDTRIP.md)

### Checklists
1. [CHECKLIST-DAILY.md](checklists/CHECKLIST-DAILY.md) - Daily test checklist
2. [CHECKLIST-WEEKLY.md](checklists/CHECKLIST-WEEKLY.md) - Weekly milestone checklist
3. [CHECKLIST-RELEASE.md](checklists/CHECKLIST-RELEASE.md) - Pre-release checklist

## 🎯 Testing Priorities

### P1 - Critical (Must Test)
- [ ] Pansy file read/write roundtrip
- [ ] Pansy UI CRUD operations
- [ ] Peony disassembly output validity
- [ ] Poppy assembly output validity
- [ ] Mesen2 Pansy export functionality
- [ ] bps-patch encode/decode roundtrip

### P2 - Important (Should Test)
- [ ] Cross-tool integration workflows
- [ ] Performance with large files
- [ ] Error handling and edge cases
- [ ] UI responsiveness and usability

### P3 - Nice to Have (Could Test)
- [ ] Cross-platform compatibility
- [ ] Accessibility features
- [ ] Documentation accuracy
- [ ] Community workflow scenarios

## 🔧 Required Tools

See [TOOL-INSTALLATION.md](prerequisites/TOOL-INSTALLATION.md) for complete installation instructions.

| Tool | Version | Purpose | Download |
|------|---------|---------|----------|
| .NET SDK | 10.0+ | Build/run .NET projects | [dotnet.microsoft.com](https://dotnet.microsoft.com/download) |
| Visual Studio Code | Latest | Code editing | [code.visualstudio.com](https://code.visualstudio.com) |
| Git | 2.40+ | Version control | [git-scm.com](https://git-scm.com) |
| Python | 3.11+ | Python tools | [python.org](https://python.org) |
| Mesen2 | Latest | Emulator testing | [mesen.ca](https://mesen.ca) |
| FCEUX | 2.6+ | NES emulator | [fceux.com](http://fceux.com) |
| bsnes | 115+ | SNES emulator | [bsnes.org](https://bsnes.org) |
| HxD | 2.5+ | Hex editor | [mh-nexus.de](https://mh-nexus.de/en/hxd/) |
| Beyond Compare | 4.4+ | File comparison | [scootersoftware.com](https://scootersoftware.com) |

## 📊 Test Results Tracking

### Summary Dashboard

| Week | Tests Planned | Tests Passed | Tests Failed | Pass Rate |
|------|---------------|--------------|--------------|-----------|
| Week 1 | 0 | 0 | 0 | - |
| Week 2 | 0 | 0 | 0 | - |
| Week 3 | 0 | 0 | 0 | - |
| Week 4 | 0 | 0 | 0 | - |
| **Total** | **0** | **0** | **0** | **-** |

### Issue Tracking

| ID | Repository | Severity | Description | Status |
|----|------------|----------|-------------|--------|
| - | - | - | No issues yet | - |

## 🚀 Getting Started

### Day 0: Setup (Today)

1. **Read this entire document** (15 min)
2. **Complete prerequisites** - See [PREREQUISITES.md](prerequisites/PREREQUISITES.md)
3. **Set up environment** - See [ENVIRONMENT-SETUP.md](prerequisites/ENVIRONMENT-SETUP.md)
4. **Acquire test ROMs** - See [TEST-ROMS.md](prerequisites/TEST-ROMS.md)
5. **Install tools** - See [TOOL-INSTALLATION.md](prerequisites/TOOL-INSTALLATION.md)
6. **Review calendar** - See [TESTING-CALENDAR.md](TESTING-CALENDAR.md)

### Day 1: Begin Testing

1. Open [TESTING-CALENDAR.md](TESTING-CALENDAR.md)
2. Find today's date
3. Follow the linked test document
4. Record results in [TEST-RESULTS.md](TEST-RESULTS.md)
5. Report issues in [ISSUES-LOG.md](ISSUES-LOG.md)

---

## 📁 Document Status

### ✅ Created Documents
- [x] MANUAL-TESTING-MASTER-PLAN.md (this file)
- [x] [TESTING-CALENDAR.md](TESTING-CALENDAR.md)
- [x] [TEST-RESULTS.md](TEST-RESULTS.md)
- [x] [ISSUES-LOG.md](ISSUES-LOG.md)
- [x] [prerequisites/PREREQUISITES.md](prerequisites/PREREQUISITES.md)
- [x] [prerequisites/ENVIRONMENT-SETUP.md](prerequisites/ENVIRONMENT-SETUP.md)
- [x] [prerequisites/TEST-ROMS.md](prerequisites/TEST-ROMS.md)
- [x] [repos/PANSY-TESTING.md](repos/PANSY-TESTING.md)
- [x] [repos/PEONY-TESTING.md](repos/PEONY-TESTING.md)
- [x] [repos/POPPY-TESTING.md](repos/POPPY-TESTING.md)
- [x] [repos/MESEN2-TESTING.md](repos/MESEN2-TESTING.md)
- [x] [repos/BPS-PATCH-TESTING.md](repos/BPS-PATCH-TESTING.md)
- [x] [integration/INTEGRATION-FULL-ROUNDTRIP.md](integration/INTEGRATION-FULL-ROUNDTRIP.md)
- [x] [checklists/CHECKLIST-DAILY.md](checklists/CHECKLIST-DAILY.md)

### ⏳ Pending Documents (Create as needed)
- [ ] prerequisites/TOOL-INSTALLATION.md
- [ ] repos/DW4-TESTING.md
- [ ] repos/FFMQ-TESTING.md
- [ ] repos/GAMEINFO-TESTING.md
- [ ] integration/INTEGRATION-PANSY-PEONY.md
- [ ] integration/INTEGRATION-PANSY-POPPY.md
- [ ] integration/INTEGRATION-MESEN2-PANSY.md
- [ ] checklists/CHECKLIST-WEEKLY.md
- [ ] checklists/CHECKLIST-RELEASE.md

---

**Next Document:** [PREREQUISITES.md](prerequisites/PREREQUISITES.md)
