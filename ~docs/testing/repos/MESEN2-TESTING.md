# 🎮 Mesen2 Testing Guide - Pansy Export Feature

> **Repository:** Mesen2 (Fork with Pansy Export)  
> **Branch:** pansy-export  
> **Last Updated:** 2026-01-19 19:50 UTC  
> **Estimated Time:** 2-3 hours

This document provides step-by-step instructions for testing the Pansy export feature in the Mesen2 fork.

---

## Table of Contents

1. [Test Environment Setup](#1-test-environment-setup)
2. [Build Verification](#2-build-verification)
3. [Basic Emulator Testing](#3-basic-emulator-testing)
4. [Pansy Export Testing](#4-pansy-export-testing)
5. [Label Import Testing](#5-label-import-testing)
6. [Integration with Pansy UI](#6-integration-with-pansy-ui)
7. [Regression Testing](#7-regression-testing)

---

## 1. Test Environment Setup

### Prerequisites
- [ ] Completed [PREREQUISITES.md](../prerequisites/PREREQUISITES.md)
- [ ] Completed [ENVIRONMENT-SETUP.md](../prerequisites/ENVIRONMENT-SETUP.md)
- [ ] Have test ROMs ready
- [ ] Pansy tools built and working

### Navigate to Repository

```powershell
cd "C:\Users\me\source\repos\Mesen2"
```

### Verify Branch

```powershell
git branch
```

**Expected output:**
```
* pansy-export
  main
```

If not on pansy-export:
```powershell
git checkout pansy-export
```

### Create Test Directories

```powershell
New-Item -ItemType Directory -Path "~manual-testing\output" -Force
New-Item -ItemType Directory -Path "~manual-testing\saves" -Force
```

---

## 2. Build Verification

### 2.1 Build Solution

```powershell
dotnet build Mesen.sln
```

**Expected:**
```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

### 2.2 Verify Build Output

```powershell
Test-Path "bin\x64\Debug\Mesen.exe"
```

**Expected:** `True`

### 2.3 Check PansyExporter.cs Exists

```powershell
Test-Path "UI\Debugger\Labels\PansyExporter.cs"
```

**Expected:** `True`

### 2.4 Verify Assembly Contains Pansy Classes

```powershell
$asm = [System.Reflection.Assembly]::LoadFrom("bin\x64\Debug\MesenDebugger.dll")
$types = $asm.GetTypes() | Where-Object { $_.Name -like "*Pansy*" }
$types | Select-Object Name
```

**Expected:** Shows `PansyExporter` and/or related types

---

## 3. Basic Emulator Testing

### 3.1 Launch Mesen2

```powershell
Start-Process "bin\x64\Debug\Mesen.exe"
```

**Verify:**
- [ ] Application launches
- [ ] Main window appears
- [ ] Menu bar visible

### 3.2 Load NES ROM

1. **File** → **Open**
2. **Navigate to:** `C:\Users\me\source\repos\roms\nes\`
3. **Select:** `dragon-warrior-4.nes`
4. **Click:** Open

**Verify:**
- [ ] ROM loads without error
- [ ] Game title visible (if it has a title screen)
- [ ] Audio plays
- [ ] Can control game

### 3.3 Load SNES ROM

1. **File** → **Open**
2. **Navigate to:** `C:\Users\me\source\repos\roms\snes\`
3. **Select:** `ffmq.sfc`
4. **Click:** Open

**Verify:**
- [ ] ROM loads
- [ ] Game runs

### 3.4 Open Debugger

1. **Debug** → **Debugger** (or press F12)
2. **Verify:**
   - [ ] Debugger window opens
   - [ ] Disassembly visible
   - [ ] Registers panel visible
   - [ ] Can set breakpoints

---

## 4. Pansy Export Testing

### 4.1 Access Pansy Export Menu

1. **Load** a NES ROM (Dragon Warrior IV)
2. **Open** Debugger (F12)
3. **Look for** menu option:
   - **File** → **Export** → **Pansy Format...** OR
   - **Labels** → **Export to Pansy...** OR
   - **Debug** → **Export Labels** → **Pansy...** OR
   - Right-click context menu in label list

**Document location:** Menu path is: _______________

### 4.2 Export Empty Session (No Labels)

1. **Clear** any existing labels (Label Manager → Clear All)
2. **Export** to Pansy
3. **Save as:** `~manual-testing/output/mesen-empty.pansy`

**Verify:**
- [ ] File created
- [ ] No error during export

### 4.3 Verify Empty Export with Pansy CLI

```powershell
cd "C:\Users\me\source\repos\pansy"
dotnet run --project src/Pansy.Cli -- info `
    "C:\Users\me\source\repos\Mesen2\~manual-testing\output\mesen-empty.pansy"
```

**Verify:**
- [ ] Platform: NES
- [ ] Symbols: 0
- [ ] Cross-references: 0

### 4.4 Add Labels in Mesen2

1. **Debug** → **Label Manager** (or similar)
2. **Add** these labels:
   | Address | Label | Type |
   |---------|-------|------|
   | $8000 | Reset | Code |
   | $8010 | NMI | Code |
   | $0000 | PlayerX | RAM |
   | $0001 | PlayerY | RAM |
   | $C000 | DataTable | Data |

3. **Also add** a comment to $8000: "Entry point"

### 4.5 Export Session with Labels

1. **Export** to Pansy
2. **Save as:** `~manual-testing/output/mesen-labels.pansy`

### 4.6 Verify Export Contents

```powershell
cd "C:\Users\me\source\repos\pansy"
dotnet run --project src/Pansy.Cli -- info `
    "C:\Users\me\source\repos\Mesen2\~manual-testing\output\mesen-labels.pansy"
```

**Verify:**
- [ ] Symbol count: 5
- [ ] Comment count: 1

### 4.7 List Exported Symbols

```powershell
dotnet run --project src/Pansy.Cli -- symbols `
    "C:\Users\me\source\repos\Mesen2\~manual-testing\output\mesen-labels.pansy"
```

**Verify all 5 symbols present with correct:**
- [ ] Addresses
- [ ] Names
- [ ] Types (Function, Variable, Data)

### 4.8 Export with Breakpoints/Watches

1. **Set** breakpoints at $8000, $8010
2. **Add** watch for $0000
3. **Export** to Pansy
4. **Verify:** Breakpoints/watches exported (if supported)

### 4.9 Test Large Export

1. **Load** a ROM with extensive debugging done
2. **Or** add 100+ labels programmatically
3. **Export** to Pansy
4. **Verify:**
   - [ ] Export completes in reasonable time
   - [ ] File size reasonable
   - [ ] All labels present

---

## 5. Label Import Testing

### 5.1 Create Test Pansy File

Use the Pansy CLI or UI to create a test file:

```powershell
# Or use existing test file from Pansy testing
Copy-Item "C:\Users\me\source\repos\pansy\~manual-testing\test-files\sample.pansy" `
    "C:\Users\me\source\repos\Mesen2\~manual-testing\input\import-test.pansy"
```

### 5.2 Import Pansy File into Mesen2

1. **Load** Dragon Warrior IV ROM
2. **Clear** existing labels
3. **Find** Import menu:
   - **File** → **Import** → **Pansy Format...** OR
   - **Labels** → **Import from Pansy...** OR
   - Similar path

4. **Select:** `~manual-testing/input/import-test.pansy`
5. **Click:** Import

**Verify:**
- [ ] Import completes without error
- [ ] Labels appear in Label Manager

### 5.3 Verify Imported Labels

1. **Open** Label Manager
2. **Check** each expected symbol is present
3. **Verify:**
   - [ ] Addresses correct
   - [ ] Names correct
   - [ ] Types correct
   - [ ] Comments present (if exported)

### 5.4 Verify Labels in Disassembly

1. **Go to** $8000 in debugger
2. **Verify:** Shows "Reset:" label
3. **Go to** $8010
4. **Verify:** Shows "NMI:" label

### 5.5 Test Overwrite vs Merge

1. **Import** one Pansy file
2. **Import** another with different labels
3. **Check** behavior:
   - [ ] New labels added?
   - [ ] Conflicting labels handled how?
   - [ ] Option for merge vs replace?

---

## 6. Integration with Pansy UI

### 6.1 Export → Open in Pansy UI

1. **In Mesen2:** Export to `test-integration.pansy`
2. **Launch** Pansy UI
3. **Open** `test-integration.pansy`
4. **Verify:**
   - [ ] All symbols visible
   - [ ] All comments visible
   - [ ] Cross-references visible

### 6.2 Edit in Pansy UI → Import to Mesen2

1. **Open** exported file in Pansy UI
2. **Add** new symbol: $9000 "NewFunction"
3. **Add** comment: "Added in Pansy"
4. **Save** file
5. **In Mesen2:** Re-import the file
6. **Verify:**
   - [ ] New symbol appears
   - [ ] New comment appears

### 6.3 Full Workflow Test

1. **Start** fresh Mesen2 session
2. **Load** Dragon Warrior IV
3. **Debug** and add some labels
4. **Export** to Pansy
5. **Open** in Pansy UI
6. **Add** more symbols/comments
7. **Save** in Pansy
8. **Open** in Peony (if supported)
9. **Use** symbols in disassembly
10. **Verify:** Complete workflow functions

---

## 7. Regression Testing

### 7.1 Verify Original Mesen2 Features Still Work

Run through basic emulator functionality:

| Feature | Works? |
|---------|--------|
| Load NES ROM | [ ] |
| Load SNES ROM | [ ] |
| Save state | [ ] |
| Load state | [ ] |
| Debugger breakpoints | [ ] |
| Memory viewer | [ ] |
| PPU viewer | [ ] |
| Audio works | [ ] |
| Input works | [ ] |
| Cheats | [ ] |
| Screenshots | [ ] |

### 7.2 Performance Check

1. **Load** SNES ROM
2. **Open** FPS counter (if available)
3. **Run** for 1 minute
4. **Check:**
   - [ ] Stable 60 FPS (or target framerate)
   - [ ] No stuttering
   - [ ] No memory leaks (Task Manager)

### 7.3 Test Other Export Formats Still Work

1. **Export** labels to .mlb (Mesen format)
2. **Verify:** File created correctly
3. **Export** to other supported formats
4. **Verify:** All still functional

---

## Error Scenarios

### 8.1 Export to Read-Only Location

```powershell
# Make folder read-only
$folder = "C:\Users\me\source\repos\Mesen2\~manual-testing\readonly"
New-Item -ItemType Directory -Path $folder -Force
$acl = Get-Acl $folder
$acl.SetAccessRuleProtection($true, $false)
Set-Acl $folder $acl
```

1. **Try** to export to read-only folder
2. **Verify:**
   - [ ] Error message displayed
   - [ ] No crash

### 8.2 Import Corrupted File

1. **Create** corrupted Pansy file:
   ```powershell
   "Not a Pansy file" | Out-File "~manual-testing/input/corrupted.pansy"
   ```
2. **Try** to import
3. **Verify:**
   - [ ] Error message displayed
   - [ ] No crash
   - [ ] Existing labels unchanged

### 8.3 Import Wrong Platform

1. **Create** Pansy file with SNES platform
2. **Load** NES ROM
3. **Try** to import SNES Pansy file
4. **Verify:**
   - [ ] Warning about platform mismatch
   - [ ] Or graceful handling

---

## Test Results Template

Copy to `~manual-testing/mesen2-results-YYYY-MM-DD.md`:

```markdown
# Mesen2 Pansy Export Test Results - YYYY-MM-DD

**Tester:** [Name]
**Branch:** pansy-export
**Commit:** [hash]
**Date:** [Date]

## Summary
- Total Tests: X
- Passed: X
- Failed: X

## Export Tests
- [ ] 4.1 Access menu
- [ ] 4.2 Empty export
- [ ] 4.3 Verify with CLI
...

## Import Tests
- [ ] 5.2 Import Pansy file
- [ ] 5.3 Verify imported labels
...

## Integration Tests
- [ ] 6.1 Export → Pansy UI
- [ ] 6.2 Edit → Re-import
- [ ] 6.3 Full workflow

## Regression Tests
- [ ] All original features work
- [ ] Performance acceptable

## Issues Found
| ID | Section | Description | Severity |
|----|---------|-------------|----------|
```

---

**Previous Document:** [POPPY-TESTING.md](POPPY-TESTING.md)  
**Next Document:** [BPS-PATCH-TESTING.md](BPS-PATCH-TESTING.md)  
**Integration Tests:** [INTEGRATION-MESEN2-PANSY.md](../integration/INTEGRATION-MESEN2-PANSY.md)
