# 📦 Tool Extraction Plan

> Moving large tools out of GameInfo into standalone repositories
> **Version:** 1.0.0
> **Created:** 2026-01-16

---

## 📋 Overview

GameInfo has grown to include significant tooling that should be extracted into standalone, reusable repositories. This plan details the extraction process.

---

## 🎯 Extraction Targets

### 1. Peony (New Repository)

**Purpose:** Multi-system disassembler framework

**Source:** GameInfoTools.Disassembly + new development

**Target Repository:** `github.com/TheAnsarya/peony`

| Component | Source | Action |
|-----------|--------|--------|
| 6502 Decoder | GameInfoTools.Disassembly | Extract + Enhance |
| 65816 Decoder | GameInfoTools.Disassembly | Extract + Enhance |
| Analysis Engine | New | Create |
| Platform Support | New | Create |

### 2. GameInfo-Tools (New Repository)

**Purpose:** CLI toolkit for ROM hacking

**Source:** GameInfoTools.* (multiple projects)

**Target Repository:** `github.com/TheAnsarya/gameinfo-tools`

| Component | Source Project | Action |
|-----------|----------------|--------|
| Core Library | GameInfoTools.Core | Move |
| ROM Analysis | GameInfoTools.Analysis | Move |
| Graphics Tools | GameInfoTools.Graphics | Move |
| Text Tools | GameInfoTools.Text | Move |
| ROM Manipulation | GameInfoTools.Rom | Move |
| Data Tools | GameInfoTools.Data | Move |
| Audio Tools | GameInfoTools.Audio | Move |
| TAS Converter | GameInfoTools.TasConvert | Move |
| CLI Interface | GameInfoTools.Cli | Move |

### 3. DarkRepos-Editor (New Repository)

**Purpose:** Blazor-based wiki and data editor

**Source:** GameInfoTools.Wiki + DarkRepos/Editor

**Target Repository:** `github.com/TheAnsarya/darkrepos-editor`

| Component | Source | Action |
|-----------|--------|--------|
| Wiki Generator | GameInfoTools.Wiki | Move |
| Blazor UI | DarkRepos/Editor | Move |
| Data Editors | DarkRepos/Editor | Move |
| Template Engine | DarkRepos/_meta | Move |

---

## 📁 New Repository Structures

### peony

```
peony/
├── .github/
│   ├── copilot-instructions.md
│   ├── workflows/
│   └── ISSUE_TEMPLATE/
├── docs/
│   ├── architecture.md
│   ├── cpu-support.md
│   └── platforms.md
├── src/
│   └── Peony.sln
│       ├── Peony.Core/
│       ├── Peony.Cpu.6502/
│       ├── Peony.Cpu.65816/
│       ├── Peony.Platform.Atari2600/
│       ├── Peony.Platform.NES/
│       ├── Peony.Cli/
│       └── Peony.Tests/
├── examples/
├── vscode-extension/
├── README.md
├── LICENSE
└── ~docs/
```

### gameinfo-tools

```
gameinfo-tools/
├── .github/
│   ├── copilot-instructions.md
│   └── workflows/
├── docs/
│   ├── commands.md
│   └── api-reference.md
├── src/
│   └── GameInfoTools.sln
│       ├── GameInfoTools.Core/
│       ├── GameInfoTools.Analysis/
│       ├── GameInfoTools.Graphics/
│       ├── GameInfoTools.Text/
│       ├── GameInfoTools.Rom/
│       ├── GameInfoTools.Data/
│       ├── GameInfoTools.Audio/
│       ├── GameInfoTools.TasConvert/
│       ├── GameInfoTools.Cli/
│       └── GameInfoTools.Tests/
├── README.md
├── LICENSE
└── ~docs/
```

### darkrepos-editor

```
darkrepos-editor/
├── .github/
├── docs/
├── src/
│   ├── DarkRepos.Editor.sln
│   │   ├── DarkRepos.Wiki/
│   │   ├── DarkRepos.Editor.Server/
│   │   ├── DarkRepos.Editor.Client/
│   │   └── DarkRepos.Editor.Shared/
│   └── templates/
├── README.md
├── LICENSE
└── ~docs/
```

---

## 🔄 Migration Steps

### Phase 1: Repository Setup

1. **Create repositories**
   ```powershell
   gh repo create TheAnsarya/peony --public --description "Multi-system disassembler framework"
   gh repo create TheAnsarya/gameinfo-tools --public --description "ROM hacking CLI toolkit"
   gh repo create TheAnsarya/darkrepos-editor --public --description "Wiki and data editor for DarkRepos"
   ```

2. **Initialize with templates**
   - Copy `.github/copilot-instructions.md` from GameInfo
   - Set up CI/CD workflows
   - Add LICENSE files
   - Create initial README.md

### Phase 2: Code Migration

1. **Peony**
   - Copy GameInfoTools.Disassembly core
   - Refactor into CPU-specific modules
   - Add platform support
   - Create new CLI

2. **GameInfo-Tools**
   - Move entire src/GameInfoTools.* tree
   - Update namespaces (optional)
   - Update solution file
   - Preserve tests

3. **DarkRepos-Editor**
   - Move DarkRepos/Editor content
   - Move GameInfoTools.Wiki
   - Consolidate templates
   - Update project references

### Phase 3: Update GameInfo

1. **Remove extracted code**
   - Delete moved projects from solution
   - Update .gitignore
   - Clean up references

2. **Add dependencies**
   - Reference extracted tools as NuGet packages
   - Or: reference as git submodules
   - Or: use as external tools

3. **Update documentation**
   - Update README.md
   - Update ~Plans documents
   - Create migration notes

### Phase 4: Publishing

1. **NuGet packages**
   ```powershell
   # For gameinfo-tools
   dotnet pack -c Release
   dotnet nuget push *.nupkg --source https://api.nuget.org/v3/index.json

   # For peony
   dotnet pack -c Release
   dotnet nuget push *.nupkg --source https://api.nuget.org/v3/index.json
   ```

2. **dotnet tools**
   ```powershell
   # Global tool installation
   dotnet tool install -g gameinfo-tools
   dotnet tool install -g peony
   ```

---

## 📦 Package Strategy

### NuGet Packages

| Package | Description |
|---------|-------------|
| `Peony.Core` | Core disassembly interfaces |
| `Peony.Cpu.6502` | 6502 family support |
| `Peony.Cpu.65816` | 65816 support |
| `GameInfoTools.Core` | Core ROM utilities |
| `GameInfoTools.Graphics` | Graphics processing |
| `GameInfoTools.Text` | Text/script tools |
| `DarkRepos.Wiki` | Wiki generation |

### dotnet Tools

| Tool | Command | Description |
|------|---------|-------------|
| gameinfo-tools | `gameinfo` | ROM analysis CLI |
| peony | `peony` | Disassembler CLI |
| darkrepos | `darkrepos` | Wiki editor CLI |

---

## ✅ Extraction Checklist

### Peony
- [ ] Create GitHub repository
- [ ] Set up CI/CD
- [ ] Extract disassembly code
- [ ] Create CPU modules
- [ ] Create platform modules
- [ ] Build CLI
- [ ] Write documentation
- [ ] Create NuGet packages
- [ ] Publish to NuGet

### GameInfo-Tools
- [ ] Create GitHub repository
- [ ] Set up CI/CD
- [ ] Move all GameInfoTools projects
- [ ] Update solution and references
- [ ] Verify all tests pass
- [ ] Write documentation
- [ ] Create NuGet packages
- [ ] Publish to NuGet

### DarkRepos-Editor
- [ ] Create GitHub repository
- [ ] Set up CI/CD
- [ ] Move Editor code
- [ ] Move Wiki code
- [ ] Consolidate templates
- [ ] Write documentation
- [ ] Deploy demo instance

### GameInfo Cleanup
- [ ] Remove extracted projects
- [ ] Add package references
- [ ] Update documentation
- [ ] Verify build still works
- [ ] Update CI/CD

---

## 📊 Dependency Graph (After Extraction)

```
                    ┌─────────────────┐
                    │     Poppy       │
                    │  (Assembler)    │
                    └────────┬────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
              ▼              ▼              ▼
    ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
    │   Peony     │  │  BPS-Patch  │  │ GameInfo-   │
    │(Disassembler)│  │  (Patcher)  │  │   Tools     │
    └──────┬──────┘  └──────┬──────┘  └──────┬──────┘
           │                │                │
           └────────────────┼────────────────┘
                            │
                            ▼
                    ┌─────────────────┐
                    │    GameInfo     │
                    │ (Game Projects) │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ DarkRepos-Editor│
                    │   (Wiki/Editor) │
                    └─────────────────┘
```

---

*Last Updated: 2026-01-16*
