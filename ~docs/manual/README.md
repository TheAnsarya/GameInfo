# GameInfo Tools - Manual Testing Guide

> **GitHub Issue:** [#32 - Epic: Manual Testing Documentation](https://github.com/TheAnsarya/GameInfo/issues/32)

Welcome to the manual testing documentation for GameInfo Tools! This guide provides step-by-step instructions for testing every feature of the toolkit.

## 📋 Quick Start Checklist

Before you begin testing, make sure you have:

- [ ] .NET 10.0 SDK installed

- [ ] Built the solution (`dotnet build`)

- [ ] Sample ROM files (see [Samples Guide](samples/README.md))

- [ ] Terminal/command prompt ready

- [ ] UI application launches successfully

## 🗂️ Testing Guides

### Command-Line Tools (CLI)

| Guide | Description | Issue |
|-------|-------------|-------|
| [CLI Overview](cli/README.md) | Getting started with CLI tools | [#33](https://github.com/TheAnsarya/GameInfo/issues/33) |
| [ROM Tools](cli/rom-tools.md) | `rom info`, `checksum`, `expand`, `header` | |
| [Text Tools](cli/text-tools.md) | `text extract`, `insert`, `dte` | |
| [Graphics Tools](cli/graphics-tools.md) | `graphics chr`, `palette` | |
| [Analysis Tools](cli/analysis-tools.md) | `analysis opcodes`, `compression`, `xref` | |
| [CDL Tools](cli/cdl-tools.md) | `analysis cdl` commands | |
| [Data Tools](cli/data-tools.md) | `data export`, `import` | |
| [Disasm Tools](cli/disasm-tools.md) | `disasm bank`, `labels`, `cdl` | |

### User Interface (UI) Application

| Guide | Description | Issue |
|-------|-------------|-------|
| [UI Overview](ui/README.md) | Getting started with the UI | [#34](https://github.com/TheAnsarya/GameInfo/issues/34) |
| [Getting Started](ui/getting-started.md) | First launch and navigation | |
| [ROM Info](ui/rom-info.md) | ROM information viewer | |
| [CHR Editor](ui/chr-editor.md) | Graphics tile editor | |
| [Hex Editor](ui/hex-editor.md) | Raw hex editing | |
| [CDL Viewer](ui/cdl-viewer.md) | CDL heatmap visualization | |
| [Disassembler](ui/disassembler.md) | Code disassembly view | |

### Sample Test Data

| Guide | Description | Issue |
|-------|-------------|-------|
| [Samples Guide](samples/README.md) | Test data and ROMs | [#35](https://github.com/TheAnsarya/GameInfo/issues/35) |

---

## 🎯 How to Use These Guides

Each testing guide follows a consistent format:

### 1. Prerequisites

What you need before starting the tests

### 2. Test Checklist

A todo-list style checklist of all test cases:

```markdown

- [ ] Test case 1: Description

- [ ] Test case 2: Description

```

### 3. Step-by-Step Instructions

Detailed instructions for each test with:

- **Command/Action:** What to do
- **Expected Result:** What you should see
- **Troubleshooting:** Common issues and fixes

### 4. Verification

How to confirm the test passed

---

## 🚀 Building and Running

### Build the Solution

```powershell
cd c:\Users\me\source\repos\GameInfo
dotnet build

```

### Run CLI Commands

```powershell
# From the GameInfo directory
dotnet run --project src/GameInfoTools.Cli -- <command>

# Or use the built executable
.\src\GameInfoTools.Cli\bin\Debug\net10.0\git.exe <command>

```

### Launch the UI Application

```powershell
dotnet run --project src/GameInfoTools.UI

```

---

## 📊 Test Status Dashboard

Track your testing progress here:

| Category | Status | Tested | Total |
|----------|--------|--------|-------|
| ROM Tools | 🔴 Not Started | 0 | 4 |
| Text Tools | 🔴 Not Started | 0 | 3 |
| Graphics Tools | 🔴 Not Started | 0 | 2 |
| Analysis Tools | 🔴 Not Started | 0 | 3 |
| CDL Tools | 🔴 Not Started | 0 | 10 |
| Data Tools | 🔴 Not Started | 0 | 2 |
| Disasm Tools | 🔴 Not Started | 0 | 3 |
| UI Views | 🔴 Not Started | 0 | 13 |

**Status Legend:**

- 🔴 Not Started
- 🟡 In Progress
- 🟢 Complete
- ⚠️ Issues Found

---

## 🐛 Reporting Issues

If you find a bug during manual testing:

1. Note the exact steps to reproduce
2. Record the expected vs actual result
3. Create a GitHub issue with the `bug` label
4. Reference the test case that failed

---

## 📝 Updating This Documentation

When features change, update the corresponding test guides:

1. Add new test cases for new features
2. Update expected results if behavior changes
3. Mark deprecated features
4. Update the status dashboard

**Last Updated:** December 11, 2025
