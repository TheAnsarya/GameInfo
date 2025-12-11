# Getting Started - UI Manual Testing

> **Parent Guide:** [UI Overview](README.md)  
> **GitHub Issue:** [#34](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

This guide covers the basic startup and navigation testing for the GameInfo Tools UI application.

## 🎯 Prerequisites

- [ ] .NET 10.0 SDK installed

- [ ] Solution built successfully

- [ ] Sample ROM files available

---

## ✅ Test Checklist

### Application Launch

- [ ] TEST-START-001: Launch from command line

- [ ] TEST-START-002: Launch from executable

- [ ] TEST-START-003: Welcome screen displays

- [ ] TEST-START-004: No startup errors

### Window Behavior

- [ ] TEST-START-005: Window resizable

- [ ] TEST-START-006: Window minimizes

- [ ] TEST-START-007: Window maximizes

- [ ] TEST-START-008: Window restores position

### Menu System

- [ ] TEST-START-009: File menu functional

- [ ] TEST-START-010: Edit menu functional

- [ ] TEST-START-011: View menu functional

- [ ] TEST-START-012: Tools menu functional

- [ ] TEST-START-013: Help menu functional

### Navigation

- [ ] TEST-START-014: Sidebar navigation

- [ ] TEST-START-015: Tab-based views

- [ ] TEST-START-016: Keyboard shortcuts

---

## 🧪 Detailed Test Instructions

### TEST-START-001: Launch from Command Line

**Purpose:** Verify the application launches correctly via dotnet CLI.

**Steps:**
1. Open PowerShell
2. Navigate to GameInfo directory:
```powershell
cd c:\Users\me\source\repos\GameInfo
```

3. Run:
```powershell
dotnet run --project src/GameInfoTools.UI
```

**Expected Result:**
- Application window appears

- No error messages in console

- Welcome screen or main interface shown

**Verification:**

- [ ] Window appears within 10 seconds

- [ ] No exceptions in console

- [ ] UI is responsive

**Result:** ☐ Pass ☐ Fail ☐ Blocked

**Notes:**

```

Record startup time: ___ seconds
Any console warnings:

```

---

### TEST-START-002: Launch from Executable

**Purpose:** Verify the built executable runs standalone.

**Steps:**
1. Navigate to build output:
```powershell
cd src\GameInfoTools.UI\bin\Debug\net10.0
```

2. Double-click `GameInfoTools.UI.exe` or run:
```powershell
.\GameInfoTools.UI.exe
```

**Expected Result:**
- Application launches without needing `dotnet run`
- Same behavior as command-line launch

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-003: Welcome Screen Displays

**Purpose:** Verify the welcome/start screen appears correctly.

**Steps:**
1. Launch the application
2. Observe the initial view

**Expected Result:**
The welcome screen should show:

- Application title/logo

- Quick action buttons (Open ROM, Recent Files, etc.)

- Version information

- Links to documentation (optional)

**Screenshot of Expected Welcome Screen:**

```

┌─────────────────────────────────────────────────────────┐
│  🎮 GameInfo Tools                                      │
│                                                         │
│  [Open ROM]  [Recent Files ▼]  [New Project]           │
│                                                         │
│  Recent Files:                                          │
│  • game1.nes (Yesterday)                               │
│  • game2.sfc (2 days ago)                              │
│                                                         │
│  Quick Start:                                           │
│  📖 Documentation  🔧 Settings  ❓ Help                 │
│                                                         │
│  Version 1.0.0 | .NET 10.0                             │
└─────────────────────────────────────────────────────────┘

```

**Verification:**

- [ ] Title/branding displayed

- [ ] Open ROM button visible

- [ ] Layout is clean and readable

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-004: No Startup Errors

**Purpose:** Verify clean startup with no errors or warnings.

**Steps:**
1. Launch with verbose output:
```powershell
dotnet run --project src/GameInfoTools.UI --verbosity detailed 2>&1 | Tee-Object startup.log
```

2. Check console output
3. Check Event Viewer (optional)

**Expected Result:**
- No exceptions thrown

- No error dialogs

- Application fully functional

**Verification:**

- [ ] No "Unhandled Exception" dialogs

- [ ] No crash reporters

- [ ] Console has no ERROR lines

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-005: Window Resizable

**Purpose:** Verify window can be resized properly.

**Steps:**
1. Launch application
2. Drag window edges to resize
3. Try various sizes

**Test Cases:**
| Size | Result |
|------|--------|
| Make narrower | ☐ |
| Make wider | ☐ |
| Make shorter | ☐ |
| Make taller | ☐ |
| Resize from corner | ☐ |

**Expected Result:**
- Window resizes smoothly

- Content reflows appropriately

- Minimum size enforced (no truncation of critical UI)

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-006: Window Minimizes

**Purpose:** Verify minimize functionality.

**Steps:**
1. Click minimize button (─)
2. Click taskbar icon to restore

**Expected Result:**
- Window minimizes to taskbar

- Restores to previous size/position

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-007: Window Maximizes

**Purpose:** Verify maximize functionality.

**Steps:**
1. Click maximize button (□)
2. Click again to restore

**Expected Result:**
- Window fills screen

- Content scales appropriately

- Double-click title bar also maximizes

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-008: Window Restores Position

**Purpose:** Verify window remembers position on restart.

**Steps:**
1. Move window to specific location
2. Resize to specific size
3. Close application
4. Reopen application

**Expected Result:**
- Window appears at saved position

- Window has saved size

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-009: File Menu Functional

**Purpose:** Verify File menu items work.

**Steps:**
1. Click "File" menu
2. Test each menu item

**Menu Items to Test:**
| Item | Shortcut | Works? |
|------|----------|--------|
| New | Ctrl+N | ☐ |
| Open | Ctrl+O | ☐ |
| Open Recent | | ☐ |
| Save | Ctrl+S | ☐ |
| Save As | Ctrl+Shift+S | ☐ |
| Close | Ctrl+W | ☐ |
| Exit | Alt+F4 | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-010: Edit Menu Functional

**Purpose:** Verify Edit menu items work.

**Menu Items to Test:**
| Item | Shortcut | Works? |
|------|----------|--------|
| Undo | Ctrl+Z | ☐ |
| Redo | Ctrl+Y | ☐ |
| Cut | Ctrl+X | ☐ |
| Copy | Ctrl+C | ☐ |
| Paste | Ctrl+V | ☐ |
| Select All | Ctrl+A | ☐ |
| Find | Ctrl+F | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-011: View Menu Functional

**Purpose:** Verify View menu navigation.

**Menu Items to Test:**
| Item | Works? |
|------|--------|
| ROM Info | ☐ |
| Hex Editor | ☐ |
| CHR Editor | ☐ |
| Disassembler | ☐ |
| CDL Viewer | ☐ |
| Toggle Sidebar | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-012: Tools Menu Functional

**Purpose:** Verify Tools menu items.

**Menu Items to Test:**
| Item | Works? |
|------|--------|
| Checksum Calculator | ☐ |
| Pointer Scanner | ☐ |
| Text Extractor | ☐ |
| Options/Settings | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-013: Help Menu Functional

**Purpose:** Verify Help menu items.

**Menu Items to Test:**
| Item | Works? |
|------|--------|
| Documentation | ☐ |
| Keyboard Shortcuts | ☐ |
| About | ☐ |
| Check for Updates | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-014: Sidebar Navigation

**Purpose:** Verify sidebar navigation works.

**Steps:**
1. Locate sidebar (usually left side)
2. Click each navigation item

**Expected Result:**
- Clicking item switches view

- Active item is highlighted

- Smooth transition

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-015: Tab-Based Views

**Purpose:** Verify tab switching works.

**Steps:**
1. Open multiple views
2. Verify tabs appear
3. Click between tabs

**Expected Result:**
- Each view has a tab

- Tabs can be closed (X button)

- Content preserved when switching

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-START-016: Keyboard Shortcuts

**Purpose:** Verify keyboard navigation.

**Shortcuts to Test:**
| Shortcut | Action | Works? |
|----------|--------|--------|
| Ctrl+Tab | Next tab | ☐ |
| Ctrl+Shift+Tab | Previous tab | ☐ |
| Alt+F | File menu | ☐ |
| Alt+E | Edit menu | ☐ |
| Alt+V | View menu | ☐ |
| Esc | Close dialog | ☐ |

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status |
|---------|-------------|--------|
| TEST-START-001 | Command line launch | ☐ |
| TEST-START-002 | Executable launch | ☐ |
| TEST-START-003 | Welcome screen | ☐ |
| TEST-START-004 | No startup errors | ☐ |
| TEST-START-005 | Window resizable | ☐ |
| TEST-START-006 | Window minimizes | ☐ |
| TEST-START-007 | Window maximizes | ☐ |
| TEST-START-008 | Position saved | ☐ |
| TEST-START-009 | File menu | ☐ |
| TEST-START-010 | Edit menu | ☐ |
| TEST-START-011 | View menu | ☐ |
| TEST-START-012 | Tools menu | ☐ |
| TEST-START-013 | Help menu | ☐ |
| TEST-START-014 | Sidebar nav | ☐ |
| TEST-START-015 | Tab views | ☐ |
| TEST-START-016 | Shortcuts | ☐ |

**Total:** 0/16 tests completed

---

**Next:** [ROM Info Testing](rom-info.md)
