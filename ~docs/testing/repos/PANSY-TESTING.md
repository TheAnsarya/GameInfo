# 🌼 Pansy Testing Guide - Complete Manual Test Suite

> **Repository:** 🌼 Pansy - Program ANalysis SYstem  
> **Last Updated:** 2026-01-19 19:35 UTC  
> **Estimated Time:** 4-5 hours (across 2-3 days)

This document provides comprehensive step-by-step instructions for manually testing all Pansy functionality.

---

## Table of Contents

1. [Test Environment Setup](#1-test-environment-setup)
2. [UI Testing - Main Window](#2-ui-testing---main-window)
3. [UI Testing - File Operations](#3-ui-testing---file-operations)
4. [UI Testing - Symbol Management](#4-ui-testing---symbol-management)
5. [UI Testing - Cross-References](#5-ui-testing---cross-references)
6. [UI Testing - Call Graph](#6-ui-testing---call-graph)
7. [CLI Testing](#7-cli-testing)
8. [Core Library Testing](#8-core-library-testing)
9. [Integration Testing](#9-integration-testing)
10. [Performance Testing](#10-performance-testing)

---

## 1. Test Environment Setup

### Prerequisites
- [ ] Completed [PREREQUISITES.md](../prerequisites/PREREQUISITES.md)
- [ ] Completed [ENVIRONMENT-SETUP.md](../prerequisites/ENVIRONMENT-SETUP.md)
- [ ] Have at least one test Pansy file

### Navigate to Repository

```powershell
cd "C:\Users\me\source\repos\pansy"
```

### Build Project (Fresh)

```powershell
# Clean and rebuild
dotnet clean Pansy.sln
dotnet build Pansy.sln
```

**Expected output:**
```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

### Run Unit Tests

```powershell
dotnet test Pansy.sln --verbosity normal
```

**Expected:** All tests pass. Note test count for later comparison.

### Create Test Data Directory

```powershell
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\pansy\~manual-testing\test-files" -Force
```

### Create Sample Pansy File for Testing

```powershell
# Run the CLI to create a sample file
dotnet run --project src/Pansy.Cli -- create-sample --output "~manual-testing/test-files/sample.pansy" --platform nes
```

**If CLI doesn't have create-sample command, create programmatically:**

Create `~manual-testing/create-test-file.ps1`:
```powershell
# Create test Pansy file using the library
@"
using Pansy.Core;
using Pansy.Core.Models;

var file = new PansyFile {
    Platform = Platform.NES,
    Symbols = new List<Symbol> {
        new Symbol { Address = 0x8000u, Name = "Reset", Type = SymbolType.Function },
        new Symbol { Address = 0x8010u, Name = "NMI", Type = SymbolType.Function },
        new Symbol { Address = 0x8020u, Name = "IRQ", Type = SymbolType.Function },
        new Symbol { Address = 0x0000u, Name = "PlayerX", Type = SymbolType.Variable },
        new Symbol { Address = 0x0001u, Name = "PlayerY", Type = SymbolType.Variable },
        new Symbol { Address = 0xc000u, Name = "DataTable", Type = SymbolType.Data },
    },
    CrossReferences = new List<CrossReference> {
        new CrossReference { From = 0x8000u, To = 0x8010u, Type = CrossRefType.Call },
        new CrossReference { From = 0x8000u, To = 0x0000u, Type = CrossRefType.Read },
        new CrossReference { From = 0x8010u, To = 0x0001u, Type = CrossRefType.Write },
        new CrossReference { From = 0x8020u, To = 0xc000u, Type = CrossRefType.Read },
    },
    Comments = new List<Comment> {
        new Comment { Address = 0x8000u, Text = "Entry point - Reset vector handler" },
        new Comment { Address = 0x8010u, Text = "NMI handler - Called during VBlank" },
    }
};

file.Save("~manual-testing/test-files/sample.pansy");
Console.WriteLine("Test file created!");
"@ | Out-File "~manual-testing/test-script.cs" -Encoding UTF8
```

---

## 2. UI Testing - Main Window

### 2.1 Launch Application

1. **Open terminal** in Pansy directory
2. **Run:**
   ```powershell
   dotnet run --project src/Pansy.UI
   ```
3. **Verify:** Window appears with title "🌼 Pansy"
4. **Check window components:**
   - [ ] Menu bar visible (File, Edit, View, Tools, Help)
   - [ ] Toolbar visible
   - [ ] Main content area visible
   - [ ] Status bar at bottom

### 2.2 Test Window Resize

1. **Drag window corner** to resize
2. **Verify:** Content scales appropriately
3. **Minimize window** (click - button)
4. **Restore window** (click taskbar)
5. **Maximize window** (click □ button)
6. **Restore to normal** (click ⧉ button)
7. **Check:** No visual glitches during transitions

### 2.3 Test Menu Bar

#### File Menu
1. **Click** File menu
2. **Verify** these options exist:
   - [ ] New (Ctrl+N)
   - [ ] Open (Ctrl+O)
   - [ ] Save (Ctrl+S)
   - [ ] Save As (Ctrl+Shift+S)
   - [ ] Recent Files submenu
   - [ ] Exit (Alt+F4)

#### Edit Menu
1. **Click** Edit menu
2. **Verify** these options exist:
   - [ ] Undo (Ctrl+Z)
   - [ ] Redo (Ctrl+Y)
   - [ ] Cut (Ctrl+X)
   - [ ] Copy (Ctrl+C)
   - [ ] Paste (Ctrl+V)
   - [ ] Delete (Del)
   - [ ] Select All (Ctrl+A)
   - [ ] Find (Ctrl+F)

#### View Menu
1. **Click** View menu
2. **Verify** these options exist:
   - [ ] Symbols Panel
   - [ ] Cross-References Panel
   - [ ] Call Graph Panel
   - [ ] Comments Panel
   - [ ] Hex View
   - [ ] Toggle Full Screen (F11)

#### Tools Menu
1. **Click** Tools menu
2. **Verify** these options exist:
   - [ ] Import from Mesen...
   - [ ] Import from FCEUX...
   - [ ] Import from DiztinGUIsh...
   - [ ] Export to Mesen...
   - [ ] Export to FCEUX...
   - [ ] Options/Settings

### 2.4 Test Keyboard Shortcuts (No File Open)

| Shortcut | Expected Result | Pass? |
|----------|-----------------|-------|
| Ctrl+N | New file dialog or empty workspace | [ ] |
| Ctrl+O | Open file dialog | [ ] |
| Ctrl+S | Save dialog (no file open) | [ ] |
| F1 | Help/About dialog | [ ] |
| Alt+F4 | Close application | [ ] |

### 2.5 Test Dark/Light Theme (If Implemented)

1. **Go to** Tools → Options (or Settings)
2. **Find** Theme setting
3. **Select** Dark theme
4. **Verify:** UI colors change appropriately
5. **Select** Light theme
6. **Verify:** UI colors revert

---

## 3. UI Testing - File Operations

### 3.1 Open Existing File

1. **Press** Ctrl+O (or File → Open)
2. **Navigate to:** `~manual-testing/test-files/`
3. **Select:** `sample.pansy`
4. **Click:** Open
5. **Verify:**
   - [ ] File loads without error
   - [ ] Symbols appear in Symbols panel
   - [ ] Cross-references appear in Cross-References panel
   - [ ] Status bar shows file path
   - [ ] Window title shows filename

### 3.2 Open Invalid File

1. **Create** a text file: `~manual-testing/test-files/invalid.txt`
   ```powershell
   "This is not a Pansy file" | Out-File "~manual-testing/test-files/invalid.txt"
   ```
2. **Press** Ctrl+O
3. **Select:** `invalid.txt`
4. **Click:** Open
5. **Verify:**
   - [ ] Error dialog appears
   - [ ] Error message is descriptive
   - [ ] Application doesn't crash

### 3.3 Open Corrupted Pansy File

1. **Create corrupted file:**
   ```powershell
   # Copy first 100 bytes of valid file
   $bytes = [System.IO.File]::ReadAllBytes("~manual-testing/test-files/sample.pansy")
   [System.IO.File]::WriteAllBytes("~manual-testing/test-files/corrupted.pansy", $bytes[0..100])
   ```
2. **Try to open** `corrupted.pansy`
3. **Verify:**
   - [ ] Error dialog appears
   - [ ] Error message mentions "corrupted" or "invalid format"
   - [ ] Application doesn't crash

### 3.4 Create New File

1. **Press** Ctrl+N (or File → New)
2. **Verify:** New file dialog or empty workspace
3. **If dialog appears:**
   - [ ] Select platform (NES, SNES, GB, etc.)
   - [ ] Enter optional metadata
   - [ ] Click Create
4. **Verify:**
   - [ ] Empty workspace created
   - [ ] Title bar shows "Untitled" or similar
   - [ ] Can add symbols to empty file

### 3.5 Save File

1. **Open** `sample.pansy`
2. **Add a symbol** (see Symbol Management section)
3. **Press** Ctrl+S
4. **Verify:**
   - [ ] File saves without error
   - [ ] Title bar removes asterisk (*) if present
   - [ ] Status bar shows "Saved" message

### 3.6 Save As New File

1. **Open** `sample.pansy`
2. **Press** Ctrl+Shift+S (or File → Save As)
3. **Navigate to:** `~manual-testing/test-files/`
4. **Enter filename:** `sample-copy.pansy`
5. **Click:** Save
6. **Verify:**
   - [ ] New file created
   - [ ] Title bar shows new filename
   - [ ] Original file unchanged (verify with file compare)

### 3.7 Test Unsaved Changes Warning

1. **Open** `sample.pansy`
2. **Add a symbol** (to create unsaved changes)
3. **Try to close** application (Alt+F4)
4. **Verify:**
   - [ ] Warning dialog appears
   - [ ] Shows "Do you want to save changes?"
   - [ ] Has Save, Don't Save, Cancel buttons
5. **Click** Cancel
6. **Verify:** Application stays open
7. **Click** Don't Save
8. **Verify:** Application closes without saving

---

## 4. UI Testing - Symbol Management

### 4.1 View Symbols Panel

1. **Open** `sample.pansy`
2. **Locate** Symbols panel (View → Symbols Panel if not visible)
3. **Verify:**
   - [ ] All symbols from file are listed
   - [ ] Columns show: Address, Name, Type
   - [ ] Addresses displayed in hex ($XXXX format)

### 4.2 Sort Symbols

1. **Click** Address column header
2. **Verify:** Symbols sorted by address ascending
3. **Click** Address again
4. **Verify:** Sorted descending
5. **Click** Name column header
6. **Verify:** Sorted alphabetically by name
7. **Click** Type column header
8. **Verify:** Grouped by type

### 4.3 Add New Symbol

1. **Right-click** in Symbols panel
2. **Select** "Add Symbol" (or use toolbar button)
3. **In dialog:**
   - Address: `$8100`
   - Name: `TestFunction`
   - Type: Function
4. **Click** OK/Add
5. **Verify:**
   - [ ] Symbol appears in list
   - [ ] Address is correct
   - [ ] Name is correct
   - [ ] Type is correct
   - [ ] File marked as modified (*in title)

### 4.4 Edit Existing Symbol

1. **Double-click** the "Reset" symbol
2. **Change** name to "ResetVector"
3. **Click** OK/Save
4. **Verify:**
   - [ ] Name updated in list
   - [ ] File marked as modified

### 4.5 Delete Symbol

1. **Select** "TestFunction" symbol
2. **Press** Delete key (or right-click → Delete)
3. **Verify:** Confirmation dialog appears
4. **Click** Yes/Confirm
5. **Verify:**
   - [ ] Symbol removed from list
   - [ ] File marked as modified

### 4.6 Bulk Select Symbols

1. **Click** first symbol
2. **Hold Shift**, click last symbol
3. **Verify:** All symbols between are selected
4. **Hold Ctrl**, click individual symbols
5. **Verify:** Can select/deselect individual items

### 4.7 Copy/Paste Symbols

1. **Select** multiple symbols
2. **Press** Ctrl+C
3. **Open** a new file (Ctrl+N)
4. **Press** Ctrl+V
5. **Verify:** Symbols pasted into new file

### 4.8 Search/Filter Symbols

1. **Find** search box in Symbols panel (or press Ctrl+F)
2. **Type:** "Player"
3. **Verify:** Only symbols containing "Player" shown
4. **Clear** search
5. **Verify:** All symbols shown again

### 4.9 Test Invalid Symbol Input

1. **Add new symbol** dialog
2. **Enter invalid address:** `GGGG` (not hex)
3. **Verify:**
   - [ ] Validation error shown
   - [ ] Cannot submit form
4. **Enter empty name:** (blank)
5. **Verify:**
   - [ ] Validation error shown
6. **Enter duplicate address:** `$8000` (already exists)
7. **Verify:**
   - [ ] Warning about duplicate shown

---

## 5. UI Testing - Cross-References

### 5.1 View Cross-References Panel

1. **Open** `sample.pansy`
2. **Locate** Cross-References panel
3. **Verify:**
   - [ ] Cross-references listed
   - [ ] Shows From, To, Type columns
   - [ ] Addresses in hex format

### 5.2 Navigate From Cross-Reference

1. **Double-click** a cross-reference
2. **Verify:** 
   - [ ] Source symbol (From address) selected/highlighted
   - [ ] Or navigation to related view

### 5.3 Show References To Symbol

1. **Select** "Reset" symbol in Symbols panel
2. **Right-click** → "Show References To"
3. **Verify:**
   - [ ] Cross-References panel filters
   - [ ] Only shows references TO Reset

### 5.4 Show References From Symbol

1. **Select** "Reset" symbol
2. **Right-click** → "Show References From"
3. **Verify:**
   - [ ] Shows what Reset references

### 5.5 Add Cross-Reference

1. **Right-click** in Cross-References panel
2. **Select** "Add Cross-Reference"
3. **Enter:**
   - From: `$8100`
   - To: `$8000`
   - Type: Call
4. **Click** OK
5. **Verify:**
   - [ ] New cross-reference appears
   - [ ] File marked as modified

### 5.6 Delete Cross-Reference

1. **Select** a cross-reference
2. **Press** Delete
3. **Confirm** deletion
4. **Verify:** Removed from list

---

## 6. UI Testing - Call Graph

### 6.1 Open Call Graph Panel

1. **Open** `sample.pansy`
2. **Go to** View → Call Graph Panel
3. **Verify:**
   - [ ] Call graph visualization appears
   - [ ] Nodes represent functions
   - [ ] Edges represent calls

### 6.2 Navigate Call Graph

1. **Click** on a node
2. **Verify:** Node is selected/highlighted
3. **Double-click** node
4. **Verify:** Navigates to symbol in Symbols panel

### 6.3 Zoom Call Graph

1. **Scroll mouse wheel** in call graph area
2. **Verify:** Graph zooms in/out
3. **Or use** zoom slider/buttons
4. **Verify:** Graph scale changes

### 6.4 Pan Call Graph

1. **Click and drag** in empty area
2. **Verify:** Graph pans/moves
3. **Use scrollbars** if present

### 6.5 Fit to Window

1. **Find** "Fit" or "Reset View" button
2. **Click** it
3. **Verify:** Graph fits within viewport

### 6.6 Export Call Graph

1. **Right-click** on call graph
2. **Select** "Export as Image" (if available)
3. **Save** to `~manual-testing/test-files/callgraph.png`
4. **Verify:**
   - [ ] Image file created
   - [ ] Graph rendered correctly in image

---

## 7. CLI Testing

### 7.1 Display Help

```powershell
cd "C:\Users\me\source\repos\pansy"
dotnet run --project src/Pansy.Cli -- --help
```

**Verify output includes:**
- [ ] Program description
- [ ] Available commands list
- [ ] Version information

### 7.2 Display Version

```powershell
dotnet run --project src/Pansy.Cli -- --version
```

**Verify:** Shows version number (e.g., "1.0.0")

### 7.3 List File Contents

```powershell
dotnet run --project src/Pansy.Cli -- info "~manual-testing/test-files/sample.pansy"
```

**Verify output includes:**
- [ ] Platform (NES)
- [ ] Symbol count
- [ ] Cross-reference count
- [ ] File size

### 7.4 List Symbols

```powershell
dotnet run --project src/Pansy.Cli -- symbols "~manual-testing/test-files/sample.pansy"
```

**Verify:**
- [ ] All symbols listed
- [ ] Addresses in hex
- [ ] Types shown

### 7.5 Search Symbols

```powershell
dotnet run --project src/Pansy.Cli -- find "~manual-testing/test-files/sample.pansy" "Reset"
```

**Verify:**
- [ ] Finds Reset symbol
- [ ] Shows address and type

### 7.6 Show Cross-References

```powershell
dotnet run --project src/Pansy.Cli -- xrefs "~manual-testing/test-files/sample.pansy" '$8000'
```

**Verify:**
- [ ] Shows references to/from $8000

### 7.7 Export to Mesen Format

```powershell
dotnet run --project src/Pansy.Cli -- convert "~manual-testing/test-files/sample.pansy" --to mesen --output "~manual-testing/test-files/sample.mlb"
```

**Verify:**
- [ ] Output file created
- [ ] File contains Mesen label format
- [ ] Open in text editor to verify content

### 7.8 Export to FCEUX Format

```powershell
dotnet run --project src/Pansy.Cli -- convert "~manual-testing/test-files/sample.pansy" --to fceux --output "~manual-testing/test-files/sample.nl"
```

**Verify:**
- [ ] Output file created
- [ ] File contains FCEUX label format

### 7.9 Test Invalid Arguments

```powershell
dotnet run --project src/Pansy.Cli -- info "nonexistent.pansy"
```

**Verify:**
- [ ] Error message displayed
- [ ] Exit code is non-zero (check `$LASTEXITCODE`)

### 7.10 Test Pipe/Redirect

```powershell
dotnet run --project src/Pansy.Cli -- symbols "~manual-testing/test-files/sample.pansy" | Out-File "~manual-testing/test-files/symbols.txt"
```

**Verify:**
- [ ] Output captured to file
- [ ] Content is complete

---

## 8. Core Library Testing

### 8.1 Run Unit Tests

```powershell
dotnet test tests/Pansy.Core.Tests --verbosity detailed
```

**Record results:**
- Total tests: ___
- Passed: ___
- Failed: ___
- Skipped: ___

### 8.2 Run Code Coverage

```powershell
dotnet test tests/Pansy.Core.Tests --collect:"XPlat Code Coverage"
```

**Check coverage:**
- Open coverage report in browser
- Verify critical code paths covered

### 8.3 Test File Round-Trip

```powershell
# Create test script
@"
using Pansy.Core;

// Load file
var file = PansyFile.Load("~manual-testing/test-files/sample.pansy");

// Save to new location
file.Save("~manual-testing/test-files/roundtrip.pansy");

// Load again
var file2 = PansyFile.Load("~manual-testing/test-files/roundtrip.pansy");

// Compare
Console.WriteLine($"Original symbols: {file.Symbols.Count}");
Console.WriteLine($"Roundtrip symbols: {file2.Symbols.Count}");
Console.WriteLine($"Match: {file.Symbols.Count == file2.Symbols.Count}");
"@ | Out-File "~manual-testing/roundtrip-test.cs"
```

---

## 9. Integration Testing

### 9.1 Import from Mesen2 Labels

1. **Create Mesen label file** `~manual-testing/test-files/mesen-labels.mlb`:
   ```
   P:8000:Reset
   P:8010:NMI
   P:8020:IRQ
   G:0000:PlayerX
   G:0001:PlayerY
   ```

2. **Import via UI:**
   - File → Import → From Mesen...
   - Select `mesen-labels.mlb`
   - Click Import

3. **Verify:**
   - [ ] Symbols imported correctly
   - [ ] Addresses correct
   - [ ] Types mapped correctly (P→Function, G→Variable)

### 9.2 Export and Re-Import Cycle

1. **Open** `sample.pansy`
2. **Export** to Mesen format
3. **Create** new Pansy file
4. **Import** the Mesen export
5. **Compare:** Should have same symbols

### 9.3 Test with Peony Output

See [INTEGRATION-PANSY-PEONY.md](../integration/INTEGRATION-PANSY-PEONY.md)

---

## 10. Performance Testing

### 10.1 Large File Test

```powershell
# Create large test file with 10,000 symbols
$symbols = 0..9999 | ForEach-Object { 
    [PSCustomObject]@{
        Address = [uint32]($_ * 16)
        Name = "Symbol_$_"
        Type = if ($_ % 3 -eq 0) { "Function" } elseif ($_ % 3 -eq 1) { "Variable" } else { "Data" }
    }
}
```

1. **Create** large Pansy file with 10,000 symbols
2. **Open** in UI
3. **Measure:** Time to open (< 5 seconds acceptable)
4. **Scroll** through symbol list
5. **Verify:** No lag or freezing
6. **Search** for symbol
7. **Measure:** Search response time (< 1 second)

### 10.2 Memory Usage

1. **Open** Task Manager (Ctrl+Shift+Esc)
2. **Launch** Pansy UI
3. **Note** memory usage (baseline)
4. **Open** large file
5. **Note** memory increase
6. **Verify:** Memory usage reasonable (< 500MB for 10k symbols)

### 10.3 Repeated Operations

1. **Repeat** open/close 10 times
2. **Verify:** No memory leak (memory returns to baseline)
3. **Repeat** add/delete symbol 100 times
4. **Verify:** Application remains responsive

---

## Test Results Template

Copy this to `~manual-testing/pansy-results-YYYY-MM-DD.md`:

```markdown
# Pansy Test Results - YYYY-MM-DD

**Tester:** [Your Name]
**Version:** [Pansy version]
**Date:** [Test date]

## Summary
- **Total Tests:** X
- **Passed:** X
- **Failed:** X
- **Blocked:** X

## UI Tests
- [ ] 2.1 Launch Application
- [ ] 2.2 Window Resize
- [ ] 2.3 Menu Bar
...

## Issues Found
| ID | Section | Description | Severity |
|----|---------|-------------|----------|
| 1 | 3.2 | Error when opening invalid file | Medium |
...
```

---

**Previous Document:** [PREREQUISITES.md](../prerequisites/PREREQUISITES.md)  
**Next Document:** [PEONY-TESTING.md](PEONY-TESTING.md)  
**Integration Tests:** [INTEGRATION-PANSY-PEONY.md](../integration/INTEGRATION-PANSY-PEONY.md)
