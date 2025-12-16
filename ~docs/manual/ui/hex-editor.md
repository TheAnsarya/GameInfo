# Hex Editor View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The Hex Editor View provides a traditional hexadecimal editor for viewing and modifying raw ROM data. It includes offset display, hex values, ASCII representation, and search/navigation features.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] ROM file loaded
- [ ] Understanding of hexadecimal notation

---

## 🧪 Test Cases

### TEST-HEX-001: Open Hex Editor View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a ROM file
3. Navigate to Hex Editor view

**Expected Results:**
- [ ] Hex Editor view opens without errors
- [ ] Three columns visible: Offset, Hex, ASCII
- [ ] ROM data displayed starting at offset 0
- [ ] Proper column alignment

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-002: Offset Column Display

**Steps:**
1. Open Hex Editor
2. Observe offset column on left side
3. Scroll through file

**Expected Results:**
- [ ] Offsets displayed in hexadecimal
- [ ] Offsets increment by 16 per row (standard)
- [ ] Leading zeros displayed (00000000, 00000010, etc.)
- [ ] Offset format consistent throughout

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-003: Hex Data Display

**Steps:**
1. Open Hex Editor
2. Observe hex data column
3. Verify grouping and spacing

**Expected Results:**
- [ ] 16 bytes displayed per row
- [ ] Bytes separated by spaces
- [ ] Optional grouping (e.g., 4-byte groups)
- [ ] All hex digits uppercase (convention)

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-004: ASCII Column Display

**Steps:**
1. Open Hex Editor
2. Observe ASCII column on right side
3. Verify character representation

**Expected Results:**
- [ ] ASCII column shows printable characters
- [ ] Non-printable chars shown as "." or similar
- [ ] 16 characters per row (matches hex)
- [ ] Alignment with hex column

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-005: Navigate to Address (Go To)

**Steps:**
1. Open Hex Editor
2. Use Go To feature (Ctrl+G)
3. Enter address: 0x1000
4. Press Enter/OK

**Expected Results:**
- [ ] Go To dialog opens
- [ ] Address field accepts hex input
- [ ] View jumps to specified address
- [ ] Cursor positioned at address
- [ ] Invalid addresses show error

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-006: Mouse Selection

**Steps:**
1. Open Hex Editor
2. Click on a hex byte
3. Drag to select multiple bytes
4. Click in ASCII column

**Expected Results:**
- [ ] Single click selects one byte
- [ ] Drag selects byte range
- [ ] Selection highlighted in both hex and ASCII
- [ ] ASCII click also selects corresponding hex

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-007: Keyboard Navigation

**Steps:**
1. Open Hex Editor
2. Use arrow keys to navigate
3. Use Page Up/Page Down
4. Use Home/End keys

**Expected Results:**
- [ ] Arrow keys move one byte/row
- [ ] Page Up/Down moves by visible page
- [ ] Home goes to start of row
- [ ] Ctrl+Home goes to file start
- [ ] End goes to end of row
- [ ] Ctrl+End goes to file end

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-008: Edit Byte (Overwrite Mode)

**Steps:**
1. Open Hex Editor
2. Navigate to a byte
3. Type hex digits (e.g., "FF")
4. Observe change

**Expected Results:**
- [ ] Typing overwrites selected byte
- [ ] Only valid hex digits accepted (0-9, A-F)
- [ ] Cursor advances after two digits
- [ ] Changes highlighted (modified indicator)

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-009: Edit in ASCII Column

**Steps:**
1. Open Hex Editor
2. Click in ASCII column
3. Type printable characters
4. Observe hex column update

**Expected Results:**
- [ ] Typing in ASCII modifies byte
- [ ] Hex column updates in real-time
- [ ] Character displayed in ASCII column
- [ ] Cursor advances

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-010: Search for Hex Pattern

**Steps:**
1. Open Hex Editor
2. Use Search (Ctrl+F)
3. Enter hex pattern: "4E 45 53" (NES header)
4. Click Find

**Expected Results:**
- [ ] Search dialog opens
- [ ] Hex search mode available
- [ ] First match found and highlighted
- [ ] "Not found" shown if no match
- [ ] F3 finds next occurrence

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-011: Search for Text

**Steps:**
1. Open Hex Editor
2. Use Search (Ctrl+F)
3. Select Text mode
4. Enter text to search
5. Click Find

**Expected Results:**
- [ ] Text search mode available
- [ ] ASCII text converted to bytes
- [ ] Match found and highlighted
- [ ] Case-sensitive option available

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-012: Replace Bytes

**Steps:**
1. Open Hex Editor
2. Use Replace (Ctrl+H)
3. Enter search pattern and replacement
4. Click Replace/Replace All

**Expected Results:**
- [ ] Replace dialog opens
- [ ] Single replace works
- [ ] Replace All replaces all occurrences
- [ ] Count of replacements shown
- [ ] Changes tracked for undo

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-013: Copy/Paste Bytes

**Steps:**
1. Open Hex Editor
2. Select a range of bytes
3. Copy (Ctrl+C)
4. Navigate to new location
5. Paste (Ctrl+V)

**Expected Results:**
- [ ] Copy places bytes in clipboard
- [ ] Paste inserts at cursor (overwrite mode)
- [ ] Hex format preserved
- [ ] Cross-application paste works (as hex string)

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-014: Undo/Redo Changes

**Steps:**
1. Make several edits in Hex Editor
2. Undo (Ctrl+Z) multiple times
3. Redo (Ctrl+Y) multiple times

**Expected Results:**
- [ ] Each undo reverts one change
- [ ] Multiple undos work sequentially
- [ ] Redo restores undone changes
- [ ] Undo stack preserved during session

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-015: Save Changes

**Steps:**
1. Make edits in Hex Editor
2. Save (Ctrl+S)
3. Verify file is updated

**Expected Results:**
- [ ] Save dialog if new file
- [ ] Overwrites existing file
- [ ] Modified indicator clears
- [ ] Backup created (if configured)

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-016: Scroll Performance

**Steps:**
1. Open a large ROM (1MB+) in Hex Editor
2. Scroll rapidly using scroll bar
3. Scroll using mouse wheel
4. Use Page Down repeatedly

**Expected Results:**
- [ ] Scrolling is smooth
- [ ] No visible lag or stuttering
- [ ] Data displays correctly at all positions
- [ ] No memory issues

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-017: Bytes Per Row Configuration

**Steps:**
1. Open Hex Editor
2. Look for bytes-per-row setting
3. Change from 16 to 32 bytes (if available)
4. Observe display change

**Expected Results:**
- [ ] Setting available (View menu or options)
- [ ] Display adjusts to new value
- [ ] Offset increments update accordingly
- [ ] ASCII column width adjusts

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-018: Bookmark Address

**Steps:**
1. Open Hex Editor
2. Navigate to an address
3. Add bookmark (Ctrl+B or menu)
4. Navigate away
5. Jump to bookmark

**Expected Results:**
- [ ] Bookmark added successfully
- [ ] Bookmark appears in list/menu
- [ ] Jumping to bookmark works
- [ ] Bookmark name customizable

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-019: Data Inspector Panel

**Steps:**
1. Open Hex Editor
2. Select a byte or range
3. View Data Inspector panel (if available)

**Expected Results:**
- [ ] Data Inspector shows interpretations
- [ ] Int8, Int16, Int32 values shown
- [ ] Signed/Unsigned options
- [ ] Little/Big endian options
- [ ] String interpretation shown

**Result:** ☐ Pass ☐ Fail

---

### TEST-HEX-020: Highlight Modified Bytes

**Steps:**
1. Open Hex Editor
2. Make several edits
3. Observe modified byte highlighting

**Expected Results:**
- [ ] Modified bytes highlighted (color)
- [ ] Highlighting visible until saved
- [ ] Clear highlight option available
- [ ] Scroll maintains highlighting

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-HEX-001 | Open Hex Editor View | ☐ |
| TEST-HEX-002 | Offset Column Display | ☐ |
| TEST-HEX-003 | Hex Data Display | ☐ |
| TEST-HEX-004 | ASCII Column Display | ☐ |
| TEST-HEX-005 | Navigate to Address | ☐ |
| TEST-HEX-006 | Mouse Selection | ☐ |
| TEST-HEX-007 | Keyboard Navigation | ☐ |
| TEST-HEX-008 | Edit Byte (Overwrite) | ☐ |
| TEST-HEX-009 | Edit in ASCII Column | ☐ |
| TEST-HEX-010 | Search for Hex Pattern | ☐ |
| TEST-HEX-011 | Search for Text | ☐ |
| TEST-HEX-012 | Replace Bytes | ☐ |
| TEST-HEX-013 | Copy/Paste Bytes | ☐ |
| TEST-HEX-014 | Undo/Redo Changes | ☐ |
| TEST-HEX-015 | Save Changes | ☐ |
| TEST-HEX-016 | Scroll Performance | ☐ |
| TEST-HEX-017 | Bytes Per Row Config | ☐ |
| TEST-HEX-018 | Bookmark Address | ☐ |
| TEST-HEX-019 | Data Inspector Panel | ☐ |
| TEST-HEX-020 | Highlight Modified Bytes | ☐ |

**Total: 20 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Standard hex editor conventions should be followed
- Large file handling is important for ROM editing
- Clipboard format should be compatible with other hex editors
- Endianness settings critical for multi-byte values
