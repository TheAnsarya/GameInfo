# Script Editor View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The Script Editor View provides an interface for viewing and editing game scripts and dialog text. It supports text encoding tables, pointer management, and script compilation.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] ROM file loaded with text/script data
- [ ] Text table (.tbl) file for the game
- [ ] Knowledge of script/text structure

---

## 🧪 Test Cases

### TEST-SCR-001: Open Script Editor View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a ROM file
3. Navigate to Script Editor view

**Expected Results:**
- [ ] Script Editor view opens without errors
- [ ] Text area visible
- [ ] Toolbar/menu visible
- [ ] Status bar showing position

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-002: Load Text Table

**Steps:**
1. Open Script Editor
2. Load text table (File → Load TBL)
3. Select .tbl file

**Expected Results:**
- [ ] TBL file loads successfully
- [ ] Character mappings applied
- [ ] Text displays decoded
- [ ] Status shows TBL loaded

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-003: Navigate to Script Offset

**Steps:**
1. Open Script Editor
2. Go to offset (Ctrl+G)
3. Enter hex address
4. Press OK

**Expected Results:**
- [ ] Go To dialog opens
- [ ] Hex address accepted
- [ ] View jumps to offset
- [ ] Script text decoded from offset

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-004: Display Script Text

**Steps:**
1. Navigate to known script location
2. Observe text display
3. Verify character decoding

**Expected Results:**
- [ ] Text displayed using TBL mappings
- [ ] Control codes shown as tags (e.g., [END], [LINE])
- [ ] Line breaks rendered
- [ ] Unknown bytes shown as hex

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-005: Edit Script Text

**Steps:**
1. Navigate to script
2. Edit text in editor
3. Observe changes

**Expected Results:**
- [ ] Text editable
- [ ] Changes highlighted
- [ ] Length indicator updates
- [ ] Modified flag set

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-006: Control Code Insertion

**Steps:**
1. Open Script Editor
2. Position cursor in text
3. Insert control code (via menu or shortcut)

**Expected Results:**
- [ ] Control code menu/palette available
- [ ] Codes insert as tags: [END], [WAIT], etc.
- [ ] Codes highlighted differently
- [ ] Cursor advances past code

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-007: Script Compilation

**Steps:**
1. Edit a script
2. Compile/Apply changes
3. Verify ROM updated

**Expected Results:**
- [ ] Compile option available
- [ ] Script converted to bytes
- [ ] ROM data updated in memory
- [ ] Errors reported if any

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-008: Length Validation

**Steps:**
1. Edit script to be longer than original
2. Attempt to compile
3. Observe warning/error

**Expected Results:**
- [ ] Length tracking visible
- [ ] Warning when exceeding space
- [ ] Error prevents overflow
- [ ] Suggestions for shortening

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-009: Pointer Table Integration

**Steps:**
1. Load script with pointer table
2. View pointer information
3. Navigate using pointers

**Expected Results:**
- [ ] Pointer table detected/loaded
- [ ] Script entries listed
- [ ] Clicking entry jumps to text
- [ ] Pointer values shown

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-010: Search Text

**Steps:**
1. Open Script Editor
2. Search (Ctrl+F)
3. Enter search text
4. Find next

**Expected Results:**
- [ ] Search dialog opens
- [ ] Text search works
- [ ] Matches highlighted
- [ ] F3 finds next occurrence

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-011: Search and Replace

**Steps:**
1. Open Script Editor
2. Replace (Ctrl+H)
3. Enter find and replace text
4. Replace/Replace All

**Expected Results:**
- [ ] Replace dialog opens
- [ ] Single replace works
- [ ] Replace All works
- [ ] Replacement count shown

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-012: Export Script

**Steps:**
1. Open Script Editor with script
2. Export (File → Export Script)
3. Choose format (TXT/JSON)

**Expected Results:**
- [ ] Export dialog opens
- [ ] TXT format readable
- [ ] JSON includes metadata
- [ ] Control codes preserved

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-013: Import Script

**Steps:**
1. Open Script Editor
2. Import (File → Import Script)
3. Select exported script file

**Expected Results:**
- [ ] Import dialog opens
- [ ] Script text loaded
- [ ] Control codes parsed
- [ ] Changes ready to compile

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-014: Undo/Redo

**Steps:**
1. Make several text edits
2. Undo (Ctrl+Z)
3. Redo (Ctrl+Y)

**Expected Results:**
- [ ] Undo reverts changes
- [ ] Multiple undos work
- [ ] Redo restores changes
- [ ] History preserved

**Result:** ☐ Pass ☐ Fail

---

### TEST-SCR-015: Copy/Paste Text

**Steps:**
1. Select text in Script Editor
2. Copy (Ctrl+C)
3. Paste (Ctrl+V) elsewhere

**Expected Results:**
- [ ] Text selection works
- [ ] Copy includes control codes
- [ ] Paste inserts text
- [ ] Cross-application paste works

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-SCR-001 | Open Script Editor View | ☐ |
| TEST-SCR-002 | Load Text Table | ☐ |
| TEST-SCR-003 | Navigate to Offset | ☐ |
| TEST-SCR-004 | Display Script Text | ☐ |
| TEST-SCR-005 | Edit Script Text | ☐ |
| TEST-SCR-006 | Control Code Insertion | ☐ |
| TEST-SCR-007 | Script Compilation | ☐ |
| TEST-SCR-008 | Length Validation | ☐ |
| TEST-SCR-009 | Pointer Table Integration | ☐ |
| TEST-SCR-010 | Search Text | ☐ |
| TEST-SCR-011 | Search and Replace | ☐ |
| TEST-SCR-012 | Export Script | ☐ |
| TEST-SCR-013 | Import Script | ☐ |
| TEST-SCR-014 | Undo/Redo | ☐ |
| TEST-SCR-015 | Copy/Paste Text | ☐ |

**Total: 15 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Text encoding varies greatly between games
- TBL format support is critical
- Pointer handling is game-specific
- DTE/MTE compression support may be needed
