# 🗺️ GameInfo Ecosystem Master Roadmap

> **Version:** 1.0.0
> **Created:** 2026-01-16
> **Status:** Active

---

## 📋 Table of Contents

1. [Vision & Goals](#-vision--goals)
2. [Repository Architecture](#-repository-architecture)
3. [Tool Ecosystem](#-tool-ecosystem)
4. [Game Projects](#-game-projects)
5. [Atari 2600 Initiative](#-atari-2600-initiative)
6. [Migration Plan](#-migration-plan)
7. [Timeline](#-timeline)

---

## 🎯 Vision & Goals

### Core Philosophy
Transform the GameInfo ecosystem from a monolithic toolkit into a focused collection of:
- **Games:** Disassembly, documentation, and wiki content for retro games
- **External Tools:** Standalone, reusable tools in separate repositories
- **Integration:** Seamless toolchain with `poppy` (assembler) and `bps-patch` (patching)

### Key Objectives
1. **Standardize on Poppy** - All assembly projects use `poppy` compiler
2. **Standardize on BPS-Patch** - All patching uses `bps-patch`
3. **Separate Tools** - Move large tools outside GameInfo
4. **Focus GameInfo** - Make it a game documentation hub
5. **Create Peony** - Build a disassembler framework (anti-poppy)
6. **Atari 2600 Initiative** - Disassemble 40+ classic games

---

## 🏗️ Repository Architecture

### Current State
```
GameInfo/          - Monolithic: tools + games + wiki + docs
├── src/           - GameInfoTools.* (.NET tools)
├── tools/         - Python tools (148+)
├── Games/         - Game-specific content
├── DarkRepos/     - Wiki content
└── ~roms/         - Reference ROMs (7,204 Atari 2600!)
```

### Target State
```
EXTERNAL TOOLS (Standalone Repos)
├── poppy/              - Multi-system assembler ✅ EXISTS
├── bps-patch/          - Binary patch system ✅ EXISTS
├── peony/              - Disassembler framework 🆕 CREATE
├── gameinfo-tools/     - CLI toolkit (move from GameInfo) 🆕 CREATE
└── darkrepos-editor/   - Wiki/data editor (Blazor) 🆕 CREATE

GAME PROJECTS (Per-Game or Per-Series Repos)
├── GameInfo/           - Hub + Atari 2600 + smaller games
├── dragon-warrior-4-info/   ✅ EXISTS
├── dragon-warrior-info/     ✅ EXISTS
├── ffmq-info/              ✅ EXISTS
├── dq3r-info/              ✅ EXISTS
└── dq4r-info/              ✅ EXISTS

SUPPORTING REPOS
├── logsmall/           - Game libraries ✅ EXISTS
├── DiztinGUIsh/        - SNES disassembly GUI ✅ EXISTS
└── Mesen2/             - Emulator (fork) ✅ EXISTS
```

---

## 🔧 Tool Ecosystem

### Tier 1: Core Compilation Tools

| Tool | Purpose | Status | Language |
|------|---------|--------|----------|
| **Poppy** | Multi-system assembler | ✅ v1.0.0 Released | C# (.NET 10) |
| **BPS-Patch** | Binary patching | ✅ Production Ready | C# (.NET 10) |
| **Peony** | Disassembler framework | 🆕 Planned | C# (.NET 10) |

### Tier 2: GameInfo Tools (To Extract)

| Tool | Purpose | Status | Action |
|------|---------|--------|--------|
| GameInfoTools.Core | ROM utilities | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Analysis | ROM analysis | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Graphics | CHR/tile editing | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Text | Script extraction | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Rom | ROM manipulation | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Disassembly | 6502/65816 disasm | ✅ Exists | → `peony` |
| GameInfoTools.Audio | NSF/SPC extraction | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.TasConvert | TAS converter | ✅ Exists | → `gameinfo-tools` |
| GameInfoTools.Wiki | Wikitext generation | ✅ Exists | → `darkrepos-editor` |

### Tier 3: Python Tools (148 to Migrate)

Most Python tools should be migrated to C# equivalents in:
- `gameinfo-tools` - General utilities
- `peony` - Disassembly-related
- Keep Python for rapid prototyping only

---

## 🎮 Game Projects

### Priority Matrix

| Game/Series | Platform | Repo | Assembler | Status |
|-------------|----------|------|-----------|--------|
| **Dragon Warrior IV** | NES | `dragon-warrior-4-info` | → Poppy | 🔄 Migration |
| **Dragon Warrior I-III** | NES | `dragon-warrior-info` | → Poppy | 🔄 Migration |
| **Final Fantasy MQ** | SNES | `ffmq-info` | → Poppy | 🔄 Migration |
| **Dragon Quest III R** | SNES | `dq3r-info` | → Poppy | 🔄 Migration |
| **Dragon Quest IV R** | SNES | `dq4r-info` | → Poppy | 🔄 Migration |
| **Atari 2600 Games** | Atari 2600 | `GameInfo/Games/Atari2600/` | → Poppy | 🆕 New |

### Build Pipeline Standard

All game projects will use:
```
build.config.json          - Project configuration
├── assembler: "poppy"     - Use Poppy compiler
├── patcher: "bps-patch"   - Use BPS patches
├── sourceFormat: "pasm"   - Poppy assembly format
└── outputFormat: "rom"    - ROM output
```

---

## 🕹️ Atari 2600 Initiative

### Overview
Leverage the **7,204 ROMs** in `~roms/Good2600 v3.14/` to create the largest Atari 2600 disassembly collection.

### Target: 40 Classic Games

| # | Game | ROM File | Priority |
|---|------|----------|----------|
| 1 | Adventure | `Adventure (1979) (Atari)` | 🔴 High |
| 2 | Asteroids | `Asteroids (1981) (Atari)` | 🔴 High |
| 3 | Berzerk | `Berzerk (1982) (Atari)` | 🔴 High |
| 4 | Breakout | `Breakout (1978) (Atari)` | 🔴 High |
| 5 | Centipede | `Centipede (1982) (Atari)` | 🔴 High |
| 6 | Combat | `Combat (1977) (Atari)` | 🔴 High |
| 7 | Defender | `Defender (1982) (Atari)` | 🔴 High |
| 8 | Demon Attack | `Demon Attack (1982) (Imagic)` | 🟡 Medium |
| 9 | Dig Dug | `Dig Dug (1983) (Atari)` | 🟡 Medium |
| 10 | Donkey Kong | `Donkey Kong (1982) (Coleco)` | 🔴 High |
| 11 | E.T. | `E.T. - The Extra-Terrestrial (1982) (Atari)` | 🔴 High |
| 12 | Frogger | `Frogger (1982) (Parker Bros)` | 🔴 High |
| 13 | Galaxian | `Galaxian (1983) (Atari)` | 🟡 Medium |
| 14 | Haunted House | `Haunted House (1981) (Atari)` | 🟡 Medium |
| 15 | Joust | `Joust (1983) (Atari)` | 🟡 Medium |
| 16 | Jr. Pac-Man | `Jr. Pac-Man (1984) (Atari)` | 🟡 Medium |
| 17 | Kaboom! | `Kaboom! (1981) (Activision)` | 🟡 Medium |
| 18 | Keystone Kapers | `Keystone Kapers (1983) (Activision)` | 🟡 Medium |
| 19 | Megamania | `Megamania (1982) (Activision)` | 🟡 Medium |
| 20 | Missile Command | `Missile Command (1981) (Atari)` | 🔴 High |
| 21 | Moon Patrol | `Moon Patrol (1983) (Atari)` | 🟡 Medium |
| 22 | Ms. Pac-Man | `Ms. Pac-Man (1982) (Atari)` | 🔴 High |
| 23 | Pac-Man | `Pac-Man (1981) (Atari)` | 🔴 High |
| 24 | Phoenix | `Phoenix (1982) (Atari)` | 🟡 Medium |
| 25 | Pitfall! | `Pitfall! (1982) (Activision)` | 🔴 High |
| 26 | Pitfall II | `Pitfall II (1984) (Activision)` | 🔴 High |
| 27 | Pole Position | `Pole Position (1983) (Atari)` | 🟡 Medium |
| 28 | Q*bert | `Q-bert (1983) (Parker Bros)` | 🔴 High |
| 29 | River Raid | `River Raid (1982) (Activision)` | 🔴 High |
| 30 | Robot Tank | `Robot Tank (1983) (Activision)` | 🟡 Medium |
| 31 | Seaquest | `Seaquest (1983) (Activision)` | 🟡 Medium |
| 32 | Solaris | `Solaris (1986) (Atari)` | 🟡 Medium |
| 33 | Space Invaders | `Space Invaders (1978) (Atari)` | 🔴 High |
| 34 | Spider Fighter | `Spider Fighter (1983) (Activision)` | 🟢 Low |
| 35 | Star Raiders | `Star Raiders (1982) (Atari)` | 🟡 Medium |
| 36 | Stargate | `Stargate (1984) (Atari)` | 🟡 Medium |
| 37 | Super Breakout | `Super Breakout (1978) (Atari)` | 🟡 Medium |
| 38 | Vanguard | `Vanguard (1982) (Atari)` | 🟡 Medium |
| 39 | Warlords | `Warlords (1981) (Atari)` | 🟡 Medium |
| 40 | Yars' Revenge | `Yars' Revenge (1981) (Atari)` | 🔴 High |

### Disassembly Structure (Per Game)
```
GameInfo/Games/Atari2600/{GameName}/
├── README.md              - Game overview
├── build.config.json      - Poppy build config
├── src/
│   ├── main.pasm          - Main source (Poppy assembly)
│   ├── data/              - Data tables
│   └── gfx/               - Graphics data
├── docs/
│   ├── memory-map.md      - Memory map documentation
│   └── routines.md        - Subroutine documentation
├── assets/
│   ├── binary/            - Extracted binary data
│   └── json/              - Editable JSON data
└── wiki/
    └── ROM_Map.wikitext   - DarkRepos wiki page
```

---

## 🔄 Migration Plan

### Phase 1: Tool Infrastructure (Q1 2026)

| Task | Target | Dependencies |
|------|--------|--------------|
| Create `peony` repository | 2026-01-31 | None |
| Extract tools to `gameinfo-tools` | 2026-02-28 | None |
| Create `darkrepos-editor` repository | 2026-02-28 | None |
| Add Atari 2600 support to `peony` | 2026-03-15 | `peony` exists |

### Phase 2: Build System Migration (Q1-Q2 2026)

| Task | Target | Dependencies |
|------|--------|--------------|
| Convert `dragon-warrior-4-info` to Poppy | 2026-02-15 | Poppy ready |
| Convert `dragon-warrior-info` to Poppy | 2026-02-28 | Poppy ready |
| Convert `ffmq-info` to Poppy | 2026-03-15 | Poppy ready |
| Convert `dq3r-info` to Poppy | 2026-03-31 | Poppy ready |
| Convert `dq4r-info` to Poppy | 2026-04-15 | Poppy ready |
| Update all build.ps1 scripts | 2026-04-30 | All conversions |

### Phase 3: Atari 2600 Disassembly (Q2-Q3 2026)

| Task | Target | Dependencies |
|------|--------|--------------|
| Disassemble first 10 games | 2026-05-31 | Peony + Poppy |
| Disassemble games 11-20 | 2026-06-30 | Ongoing |
| Disassemble games 21-30 | 2026-07-31 | Ongoing |
| Disassemble games 31-40 | 2026-08-31 | Ongoing |
| Wiki pages for all 40 games | 2026-09-30 | All disassemblies |

### Phase 4: Polish & Release (Q4 2026)

| Task | Target | Dependencies |
|------|--------|--------------|
| Complete documentation | 2026-10-31 | All phases |
| Release peony v1.0.0 | 2026-11-15 | Complete |
| Release gameinfo-tools v1.0.0 | 2026-11-30 | Complete |
| GameInfo 2.0.0 release | 2026-12-31 | All complete |

---

## 📊 Timeline

```
2026
├── Jan ████████░░ Infrastructure & Planning
├── Feb ████████░░ Tool Migration (gameinfo-tools, peony start)
├── Mar ████████░░ Build System Migration (DW4, DW, FFMQ)
├── Apr ████████░░ Build System Migration (DQ3r, DQ4r)
├── May ████████░░ Atari 2600 Batch 1 (Games 1-10)
├── Jun ████████░░ Atari 2600 Batch 2 (Games 11-20)
├── Jul ████████░░ Atari 2600 Batch 3 (Games 21-30)
├── Aug ████████░░ Atari 2600 Batch 4 (Games 31-40)
├── Sep ████████░░ Wiki & Documentation
├── Oct ████████░░ Testing & Polish
├── Nov ████████░░ Release peony, gameinfo-tools
└── Dec ████████░░ GameInfo 2.0.0 Release
```

---

## 📈 Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Games converted to Poppy | 5 major projects | Count of repos |
| Atari 2600 games disassembled | 40 games | Count in GameInfo |
| Tools extracted | 3 new repos | peony, gameinfo-tools, darkrepos-editor |
| Wiki pages created | 100+ | DarkRepos page count |
| Build system standardization | 100% | All use build.config.json |

---

## 🔗 Related Documents

- [Peony Disassembler Plan](PEONY-DISASSEMBLER-PLAN.md)
- [Build System Migration Guide](BUILD-SYSTEM-MIGRATION.md)
- [Atari 2600 Disassembly Guide](ATARI-2600-DISASSEMBLY.md)
- [Tool Extraction Plan](TOOL-EXTRACTION-PLAN.md)

---

*Last Updated: 2026-01-16*
