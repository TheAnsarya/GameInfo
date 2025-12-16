# Disassembler View - Manual Testing Guide

> **Parent Guide:** [UI Application Testing](README.md)  
> **GitHub Issue:** [#34 - docs: Manual Testing - UI Application](https://github.com/TheAnsarya/GameInfo/issues/34)

## 📋 Overview

The Disassembler View provides interactive disassembly of ROM code, displaying machine code as human-readable assembly instructions. It supports labels, cross-references, and integration with CDL data.

## 🎯 Prerequisites

- [ ] Application launched successfully
- [ ] ROM file loaded (NES, SNES, or other supported platform)
- [ ] Optional: Label file for the ROM
- [ ] Optional: CDL file for code/data hints

---

## 🧪 Test Cases

### TEST-DIS-001: Open Disassembler View

**Steps:**
1. Launch GameInfoTools.UI
2. Open a ROM file
3. Navigate to Disassembler view

**Expected Results:**
- [ ] Disassembler view opens without errors
- [ ] Disassembly displayed starting at reset vector or offset 0
- [ ] Address column visible
- [ ] Hex bytes column visible
- [ ] Instruction column visible

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-002: Instruction Display Format

**Steps:**
1. Open Disassembler
2. Examine instruction display
3. Verify format and alignment

**Expected Results:**
- [ ] Address displayed (6-digit hex: $00:8000 or $008000)
- [ ] Raw bytes shown (e.g., "A9 00" for LDA #$00)
- [ ] Mnemonic displayed (LDA, STA, JMP, etc.)
- [ ] Operands formatted correctly
- [ ] Proper column alignment

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-003: Navigate to Address (Go To)

**Steps:**
1. Open Disassembler
2. Use Go To feature (Ctrl+G)
3. Enter address: $C000
4. Press Enter

**Expected Results:**
- [ ] Go To dialog opens
- [ ] Address field accepts hex input
- [ ] View jumps to specified address
- [ ] Address highlighted/selected
- [ ] Invalid addresses show error

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-004: Scroll Navigation

**Steps:**
1. Open Disassembler
2. Scroll using mouse wheel
3. Use scroll bar
4. Use Page Up/Page Down

**Expected Results:**
- [ ] Smooth scrolling
- [ ] Instructions stay aligned
- [ ] No missing or duplicate lines
- [ ] Performance acceptable for large ROMs

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-005: Keyboard Navigation

**Steps:**
1. Open Disassembler
2. Use arrow keys
3. Use Home/End keys
4. Use Ctrl+Home/Ctrl+End

**Expected Results:**
- [ ] Up/Down arrows move by instruction
- [ ] Page Up/Down moves by page
- [ ] Home goes to first instruction
- [ ] Ctrl+Home goes to start of ROM
- [ ] Ctrl+End goes to end of ROM

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-006: Follow Branch/Jump

**Steps:**
1. Open Disassembler
2. Navigate to a JMP or JSR instruction
3. Double-click or press Enter to follow
4. Use Back navigation

**Expected Results:**
- [ ] Double-click follows jump target
- [ ] View updates to target address
- [ ] Back button/shortcut returns to origin
- [ ] Navigation history maintained

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-007: Cross-References (XRefs)

**Steps:**
1. Open Disassembler
2. Navigate to a labeled address
3. View cross-references panel (if available)
4. Click on a cross-reference

**Expected Results:**
- [ ] XRefs listed for current address
- [ ] Shows callers (for subroutine)
- [ ] Shows references (for data)
- [ ] Clicking navigates to reference

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-008: Load Label File

**Steps:**
1. Open Disassembler
2. Load a label file (File → Load Labels)
3. Observe disassembly changes

**Expected Results:**
- [ ] Label file loads successfully
- [ ] Labels appear in disassembly
- [ ] Jump targets show label names
- [ ] Data references show labels

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-009: Add/Edit Label

**Steps:**
1. Open Disassembler
2. Navigate to an unlabeled address
3. Add label (right-click or hotkey)
4. Enter label name

**Expected Results:**
- [ ] Add label option available
- [ ] Label dialog opens
- [ ] Label saved to current session
- [ ] Disassembly updates with new label

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-010: Add Comment

**Steps:**
1. Open Disassembler
2. Navigate to an instruction
3. Add comment (right-click or hotkey)
4. Enter comment text

**Expected Results:**
- [ ] Add comment option available
- [ ] Comment displayed after instruction
- [ ] Comment editable
- [ ] Comment saved with project

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-011: Search for Instruction

**Steps:**
1. Open Disassembler
2. Use Search (Ctrl+F)
3. Enter instruction mnemonic (e.g., "JSR")
4. Click Find

**Expected Results:**
- [ ] Search dialog opens
- [ ] Mnemonic search works
- [ ] First match highlighted
- [ ] F3 finds next match

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-012: Search for Pattern

**Steps:**
1. Open Disassembler
2. Use Search (Ctrl+F)
3. Enter hex pattern: "20 00 80" (JSR $8000)
4. Click Find

**Expected Results:**
- [ ] Hex pattern search works
- [ ] Match found and highlighted
- [ ] Navigation to match address
- [ ] Multiple matches navigable

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-013: CDL Integration

**Steps:**
1. Open Disassembler
2. Load CDL file (if available)
3. Observe code/data differentiation

**Expected Results:**
- [ ] CDL data applied to disassembly
- [ ] Code regions disassembled
- [ ] Data regions shown as bytes
- [ ] Color coding for code vs data

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-014: Mark as Code/Data

**Steps:**
1. Open Disassembler
2. Select a range of bytes
3. Mark as Code (C key)
4. Mark another range as Data (D key)

**Expected Results:**
- [ ] Mark as Code disassembles bytes
- [ ] Mark as Data shows as .db/.byte
- [ ] Changes persist in session
- [ ] Visual indicator of manual marks

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-015: Bank Selection

**Steps:**
1. Open a banked ROM (NES MMC1/3, etc.)
2. Use bank selector
3. Switch between banks

**Expected Results:**
- [ ] Bank selector visible
- [ ] Bank switching updates view
- [ ] Bank addresses calculated correctly
- [ ] Navigation between banks works

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-016: Export Disassembly

**Steps:**
1. Open Disassembler
2. Select export range (or entire ROM)
3. Export to ASM file

**Expected Results:**
- [ ] Export dialog opens
- [ ] Format options available (ASM, etc.)
- [ ] Labels included in export
- [ ] Comments included in export
- [ ] Output file valid assembly

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-017: Bookmarks

**Steps:**
1. Open Disassembler
2. Navigate to important address
3. Add bookmark (Ctrl+B)
4. Add more bookmarks
5. Navigate using bookmarks panel

**Expected Results:**
- [ ] Bookmark added successfully
- [ ] Bookmark list/panel shows entries
- [ ] Clicking bookmark navigates to address
- [ ] Bookmarks persist in session

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-018: Address Modes

**Steps:**
1. Open Disassembler (6502/65816 ROM)
2. Find examples of each addressing mode:
   - Immediate: LDA #$00
   - Zero Page: LDA $00
   - Absolute: LDA $1234
   - Indexed: LDA $1234,X
   - Indirect: JMP ($FFFC)

**Expected Results:**
- [ ] All addressing modes correctly decoded
- [ ] Operands formatted correctly
- [ ] Proper # for immediate
- [ ] Proper parentheses for indirect

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-019: Invalid Opcode Handling

**Steps:**
1. Open Disassembler
2. Navigate to data region (not code)
3. Observe how invalid opcodes displayed

**Expected Results:**
- [ ] Invalid opcodes shown as .db or ???
- [ ] No crashes on invalid sequences
- [ ] Disassembler continues after invalid
- [ ] Data bytes displayed as hex

**Result:** ☐ Pass ☐ Fail

---

### TEST-DIS-020: Copy Disassembly

**Steps:**
1. Open Disassembler
2. Select a range of instructions
3. Copy (Ctrl+C)
4. Paste into text editor

**Expected Results:**
- [ ] Copy option available
- [ ] Disassembly text copied
- [ ] Formatting preserved
- [ ] Addresses/bytes/instructions included

**Result:** ☐ Pass ☐ Fail

---

## 📊 Results Summary

| Test ID | Description | Result |
|---------|-------------|--------|
| TEST-DIS-001 | Open Disassembler View | ☐ |
| TEST-DIS-002 | Instruction Display Format | ☐ |
| TEST-DIS-003 | Navigate to Address | ☐ |
| TEST-DIS-004 | Scroll Navigation | ☐ |
| TEST-DIS-005 | Keyboard Navigation | ☐ |
| TEST-DIS-006 | Follow Branch/Jump | ☐ |
| TEST-DIS-007 | Cross-References | ☐ |
| TEST-DIS-008 | Load Label File | ☐ |
| TEST-DIS-009 | Add/Edit Label | ☐ |
| TEST-DIS-010 | Add Comment | ☐ |
| TEST-DIS-011 | Search for Instruction | ☐ |
| TEST-DIS-012 | Search for Pattern | ☐ |
| TEST-DIS-013 | CDL Integration | ☐ |
| TEST-DIS-014 | Mark as Code/Data | ☐ |
| TEST-DIS-015 | Bank Selection | ☐ |
| TEST-DIS-016 | Export Disassembly | ☐ |
| TEST-DIS-017 | Bookmarks | ☐ |
| TEST-DIS-018 | Address Modes | ☐ |
| TEST-DIS-019 | Invalid Opcode Handling | ☐ |
| TEST-DIS-020 | Copy Disassembly | ☐ |

**Total: 20 test cases**

---

## 🐛 Issues Found

| Issue # | Description | Severity | Status |
|---------|-------------|----------|--------|
| | | | |

---

## 📝 Notes

- Different CPU architectures require different testing (6502, 65816, Z80, 68000)
- Label file formats may vary (.mlb, .nl, .sym)
- CDL format compatibility important for FCEUX users
- Bank handling critical for large ROMs
