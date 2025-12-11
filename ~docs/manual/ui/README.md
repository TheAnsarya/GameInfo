# UI Application - Manual Testing Guide

> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)  
> **Parent Issue:** [#32 - Epic: Manual Testing Documentation](https://github.com/TheAnsarya/GameInfo/issues/32)

## 📋 Overview

The GameInfo Tools UI is an Avalonia-based desktop application providing graphical interfaces for ROM hacking tasks.

## 🎯 Prerequisites

Before testing:

- [ ] .NET 10.0 SDK installed

- [ ] Solution built (`dotnet build`)

- [ ] Sample ROM files available

- [ ] Display resolution at least 1280x720

## 🚀 Launching the Application

```powershell
# From the GameInfo directory
dotnet run --project src/GameInfoTools.UI

```

Or run the built executable:

```powershell
.\src\GameInfoTools.UI\bin\Debug\net10.0\GameInfoTools.UI.exe

```

---

## 🗂️ Testing Guides by View

| Guide | Description | Status |
|-------|-------------|--------|
| [Getting Started](getting-started.md) | Launch and navigation | 🔴 |
| [ROM Info](rom-info.md) | ROM information viewer | 🔴 |
| [CHR Editor](chr-editor.md) | Tile graphics editor | 🔴 |
| [Hex Editor](hex-editor.md) | Raw hex editing | 🔴 |
| [Text Extractor](text-extractor.md) | Text extraction UI | 🔴 |
| [Script Editor](script-editor.md) | Script editing | 🔴 |
| [Disassembler](disassembler.md) | Code disassembly | 🔴 |
| [CDL Viewer](cdl-viewer.md) | CDL heatmap display | 🔴 |
| [Bank View](bank-view.md) | Bank browser | 🔴 |
| [Data Table](data-table.md) | Data table editor | 🔴 |
| [Map Editor](map-editor.md) | Map editing | 🔴 |
| [Pointer Scanner](pointer-scanner.md) | Pointer analysis | 🔴 |
| [Checksum](checksum.md) | Checksum calculator | 🔴 |

---

## ✅ Master Test Checklist

### Application Startup

- [ ] TEST-UI-001: Application launches without errors

- [ ] TEST-UI-002: Welcome screen displayed

- [ ] TEST-UI-003: Menu bar visible and functional

- [ ] TEST-UI-004: Window can be resized

### File Operations

- [ ] TEST-UI-005: Open ROM file dialog works

- [ ] TEST-UI-006: Recent files list maintained

- [ ] TEST-UI-007: Save/export dialogs work

- [ ] TEST-UI-008: Drag-and-drop file opening

### View Navigation

- [ ] TEST-UI-009: Navigate between views

- [ ] TEST-UI-010: View tabs work correctly

- [ ] TEST-UI-011: Multiple views open simultaneously

- [ ] TEST-UI-012: Close views properly

### ROM Info View

- [ ] TEST-UI-013: Displays ROM metadata correctly

- [ ] TEST-UI-014: Header parsing accurate

- [ ] TEST-UI-015: Checksum displayed

### CHR Editor View

- [ ] TEST-UI-016: Tile grid displays correctly

- [ ] TEST-UI-017: Tile selection works

- [ ] TEST-UI-018: Palette switching works

- [ ] TEST-UI-019: Export tiles to image

### Hex Editor View

- [ ] TEST-UI-020: Hex display correct

- [ ] TEST-UI-021: ASCII column accurate

- [ ] TEST-UI-022: Navigation (goto address)

- [ ] TEST-UI-023: Edit bytes

- [ ] TEST-UI-024: Search functionality

### CDL Viewer

- [ ] TEST-UI-025: Load CDL file

- [ ] TEST-UI-026: ASCII heatmap displays

- [ ] TEST-UI-027: Graphical heatmap displays

- [ ] TEST-UI-028: Statistics shown

- [ ] TEST-UI-029: Tab switching works

### Disassembler View

- [ ] TEST-UI-030: Disassembly displays

- [ ] TEST-UI-031: Navigation works

- [ ] TEST-UI-032: Labels shown (if loaded)

- [ ] TEST-UI-033: Export functionality

### Performance

- [ ] TEST-UI-034: Large ROM loads in <5 seconds

- [ ] TEST-UI-035: Scrolling smooth

- [ ] TEST-UI-036: No memory leaks (check task manager)

---

## 🧪 Quick Smoke Test

Run this quick test to verify basic functionality:

### 1. Launch Application

```powershell
dotnet run --project src/GameInfoTools.UI

```

✓ Window appears without errors

### 2. Open a ROM

- File → Open or Ctrl+O

- Select a NES ROM
- ✓ ROM loads, info displayed

### 3. Navigate Views

- Click "CHR Editor" in sidebar or menu
- ✓ Tiles displayed

- Click "Hex Editor"
- ✓ Hex view shown

### 4. Open CDL Viewer

- Tools → CDL Viewer

- Open a .cdl file
- ✓ Heatmap displays

### 5. Close Application

- File → Exit or Alt+F4
- ✓ Closes cleanly

**Smoke Test Result:** ☐ Pass ☐ Fail

---

## 🎨 Theme Testing

Test with different themes/appearances:

- [ ] Light theme renders correctly

- [ ] Dark theme renders correctly

- [ ] High contrast accessible

- [ ] System theme follows OS setting

---

## 🖥️ Resolution Testing

Test at various resolutions:

| Resolution | Status | Notes |
|------------|--------|-------|
| 1920x1080 | ☐ | Standard HD |
| 1280x720 | ☐ | Minimum supported |
| 2560x1440 | ☐ | QHD |
| 3840x2160 | ☐ | 4K |
| 1024x768 | ☐ | Legacy (may have issues) |

---

## ⌨️ Keyboard Shortcuts

Verify these shortcuts work:

| Shortcut | Action | Works? |
|----------|--------|--------|
| Ctrl+O | Open file | ☐ |
| Ctrl+S | Save | ☐ |
| Ctrl+Shift+S | Save As | ☐ |
| Ctrl+W | Close tab | ☐ |
| Ctrl+Q | Quit | ☐ |
| Ctrl+F | Find | ☐ |
| Ctrl+G | Go to address | ☐ |
| F5 | Refresh | ☐ |

---

## 🐛 Bug Reporting Template

When you find a bug during testing, use this template:

```markdown
## Bug Report

**Test ID:** TEST-UI-XXX
**Date:** YYYY-MM-DD
**Tester:** Name

### Description
Brief description of the issue

### Steps to Reproduce

1. Step one
2. Step two
3. Step three

### Expected Result
What should happen

### Actual Result
What actually happens

### Screenshots
(if applicable)

### Environment

- OS: Windows 11
- .NET Version: 10.0.x

- Resolution: 1920x1080

```

---

## 📊 Overall Test Progress

| Category | Tested | Total | Coverage |
|----------|--------|-------|----------|
| Startup | 0 | 4 | 0% |
| File Operations | 0 | 4 | 0% |
| Navigation | 0 | 4 | 0% |
| ROM Info | 0 | 3 | 0% |
| CHR Editor | 0 | 4 | 0% |
| Hex Editor | 0 | 5 | 0% |
| CDL Viewer | 0 | 5 | 0% |
| Disassembler | 0 | 4 | 0% |
| Performance | 0 | 3 | 0% |
| **Total** | **0** | **36** | **0%** |

---

**Start Testing:** [Getting Started](getting-started.md)
