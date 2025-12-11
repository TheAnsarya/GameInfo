# CLI Tools - Manual Testing Guide

> **GitHub Issue:** [#33 - docs: Manual Testing - CLI Tools](https://github.com/TheAnsarya/GameInfo/issues/33)  
> **Parent Issue:** [#32 - Epic: Manual Testing Documentation](https://github.com/TheAnsarya/GameInfo/issues/32)

## 📋 Overview

This guide covers manual testing for all GameInfo CLI tools. The CLI is the primary interface for batch operations and scripting.

## 🎯 Prerequisites

Before running these tests:

- [ ] .NET 10.0 SDK installed (`dotnet --version` shows 10.x)

- [ ] Solution built successfully (`dotnet build` completes without errors)

- [ ] Sample ROM files available (see [Samples Guide](../samples/README.md))

- [ ] Terminal/PowerShell open in the GameInfo directory

## 🚀 Quick Start

### Running CLI Commands

```powershell
# Option 1: Using dotnet run (development)
dotnet run --project src/GameInfoTools.Cli -- <command>

# Option 2: Using built executable (faster)
.\src\GameInfoTools.Cli\bin\Debug\net10.0\git.exe <command>

# Option 3: Alias for convenience
$git = ".\src\GameInfoTools.Cli\bin\Debug\net10.0\git.exe"
& $git <command>

```

### Verify CLI Works

```powershell
# Should show the GameInfo Tools banner and help
dotnet run --project src/GameInfoTools.Cli

```

**Expected Output:**

```

____                      ___        __         _____            _     
/ ___| __ _ _ __ ___   ___|_ _|_ __  / _| ___   |_   _|__   ___  | |___ 
 | |  _ / _` | '_ ` _ \ / _ \| || '_ \| |_ / _ \    | |/ _ \ / _ \ | / __|
 | |_| | (_| | | | | | |  __/| || | | |  _| (_) |   | | (_) | (_) || \__ \
\____|\__,_|_| |_| |_|\___|___|_| |_|_|  \___/    |_|\___/ \___/ |_|___/

ROM Hacking & Documentation Toolkit
Version 1.0.0 | .NET 10.0.x

┌──────────────┬───────────────────────────────┬─────────────────────────┐
│ Category     │ Description                   │ Example                 │
├──────────────┼───────────────────────────────┼─────────────────────────┤
│ rom          │ ROM file operations           │ git rom info game.nes   │
│ text         │ Text extraction/insertion     │ git text extract ...    │
...

```

---

## 📚 Testing Guides by Category

| Tool Category | Guide | Tests |
|--------------|-------|-------|
| ROM Operations | [rom-tools.md](rom-tools.md) | 4 |
| Text Operations | [text-tools.md](text-tools.md) | 3 |
| Graphics Operations | [graphics-tools.md](graphics-tools.md) | 2 |
| Analysis Operations | [analysis-tools.md](analysis-tools.md) | 3 |
| CDL Operations | [cdl-tools.md](cdl-tools.md) | 10 |
| Data Operations | [data-tools.md](data-tools.md) | 2 |
| Disassembly Operations | [disasm-tools.md](disasm-tools.md) | 3 |

---

## ✅ Master Test Checklist

### Basic CLI Functionality

- [ ] CLI launches without errors

- [ ] Banner and help display correctly

- [ ] `git list` shows all available tools

- [ ] `git --help` shows usage

- [ ] `git <category> --help` shows category-specific help

### ROM Tools (`git rom`)

- [ ] `git rom info <file>` - Displays ROM information

- [ ] `git rom checksum <file>` - Calculates checksum

- [ ] `git rom checksum <file> --fix` - Fixes incorrect checksum

- [ ] `git rom expand <file> <size>` - Expands ROM size

- [ ] `git rom header <file>` - Shows/edits header

### Text Tools (`git text`)

- [ ] `git text extract <file>` - Extracts text

- [ ] `git text extract <file> --table <tbl>` - Extracts with table

- [ ] `git text insert <file> <script>` - Inserts text

- [ ] `git text dte <file>` - Analyzes DTE compression

### Graphics Tools (`git graphics`)

- [ ] `git graphics chr <file>` - Extracts CHR data

- [ ] `git graphics chr <file> --output <dir>` - Extracts to directory

- [ ] `git graphics palette <file>` - Extracts palettes

### Analysis Tools (`git analysis`)

- [ ] `git analysis opcodes <file>` - Analyzes opcodes

- [ ] `git analysis opcodes <file> --bank <n>` - Analyzes specific bank

- [ ] `git analysis compression <file>` - Detects compression

- [ ] `git analysis xref <file>` - Builds cross-reference

### CDL Tools (`git analysis cdl`)

- [ ] `git analysis cdl stats <file>` - Shows statistics

- [ ] `git analysis cdl banks <file>` - Shows bank statistics

- [ ] `git analysis cdl heatmap <file>` - ASCII heatmap

- [ ] `git analysis cdl export <file> --output <csv>` - Export to CSV

- [ ] `git analysis cdl regions <file>` - Shows regions

- [ ] `git analysis cdl merge <files> --output <file>` - Merges CDL files

- [ ] `git analysis cdl diff <file1> <file2>` - Compares CDL files

- [ ] `git analysis cdl export-mlb <file> --output <mlb>` - Export to MLB

- [ ] `git analysis cdl export-sym <file> --output <sym>` - Export to SYM

- [ ] `git analysis cdl convert <file> --target <fmt> --output <file>` - Convert format

### Data Tools (`git data`)

- [ ] `git data export <file> <type>` - Exports data to JSON

- [ ] `git data import <file> <json>` - Imports data from JSON

### Disassembly Tools (`git disasm`)

- [ ] `git disasm bank <file> <n>` - Disassembles bank

- [ ] `git disasm labels <file>` - Manages labels

- [ ] `git disasm labels <file> --format <fmt>` - Different label formats

- [ ] `git disasm cdl <file>` - Processes CDL file

---

## 🧪 Test Execution Template

For each test, follow this pattern:

### Test: [Test Name]

**Command:**

```powershell
<command to run>

```

**Expected Result:**

```

<what you expect to see>

```

**Actual Result:**
- [ ] ✅ Pass - Output matches expected

- [ ] ❌ Fail - Output differs (describe how)

- [ ] ⚠️ Warning - Works but with issues

**Notes:**

```

Any additional observations

```

---

## 🔧 Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| "Command not found" | Wrong directory or not built | Run `dotnet build` first |
| "File not found" | Incorrect path | Use absolute path or check file exists |
| "Access denied" | File in use | Close emulator/other tools |
| Missing dependencies | NuGet packages not restored | Run `dotnet restore` |

### Getting Help

```powershell
# General help
git --help

# Category-specific help
git rom --help
git analysis cdl --help

# Command-specific help
git rom info --help

```

---

**Next:** Start with [ROM Tools Testing](rom-tools.md)
