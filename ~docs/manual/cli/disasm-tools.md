# Disassembly Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

Disassembly tools help with reverse engineering:
- **bank** - Disassemble a ROM bank
- **labels** - Manage debug labels
- **cdl** - Process CDL for disassembly hints

## 🎯 Prerequisites

- [ ] GameInfo CLI built
- [ ] Sample NES ROM (6502)
- [ ] Sample SNES ROM (65816, optional)
- [ ] CDL file (optional, enhances disassembly)

## ✅ Test Checklist

### `git disasm bank` - Disassemble Bank
- [ ] TEST-DASM-001: Disassemble bank 0
- [ ] TEST-DASM-002: Disassemble with labels
- [ ] TEST-DASM-003: Output to file

### `git disasm labels` - Label Management
- [ ] TEST-DASM-004: Generate MLB labels
- [ ] TEST-DASM-005: Generate NL labels
- [ ] TEST-DASM-006: Generate SYM labels

### `git disasm cdl` - CDL Processing
- [ ] TEST-DASM-007: Process CDL for hints
- [ ] TEST-DASM-008: Generate code/data separation

---

## 🧪 Detailed Test Instructions

### TEST-DASM-001: Disassemble Bank 0

**Purpose:** Verify basic disassembly works.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm bank "game.nes" 0
   ```

**Expected Result:**
```asm
; Bank 0 Disassembly
; ROM: game.nes
; Offset: $00000-$03FFF
; CPU: 6502

.org $8000

Reset:
$8000: 78        SEI              ; Disable interrupts
$8001: D8        CLD              ; Clear decimal mode
$8002: A9 00     LDA #$00         ; Load 0
$8004: 8D 00 20  STA $2000        ; PPU control = 0
$8007: 8D 01 20  STA $2001        ; PPU mask = 0
...

; Subroutine at $8100
Sub_8100:
$8100: A5 10     LDA $10          ; Load from ZP $10
$8102: 29 0F     AND #$0F         ; Mask low nibble
$8104: 60        RTS              ; Return
```

**Verification:**
- [ ] Assembly output shown
- [ ] Correct opcodes
- [ ] Addresses accurate
- [ ] Comments helpful

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-002: Disassemble with Labels

**Purpose:** Verify label file integration.

**Prerequisites:**
- Label file (.mlb or .nl format)

**Steps:**
1. Run with labels:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm bank "game.nes" 0 --labels "game.mlb"
   ```

**Expected Result:**
```asm
Reset:
$8000: 78        SEI              
$8001: D8        CLD              
$8002: A9 00     LDA #$00         
$8004: 8D 00 20  STA PPU_CTRL     ; Uses label
$8007: 8D 01 20  STA PPU_MASK     ; Uses label

$8100: 20 00 82  JSR UpdateSprites ; Subroutine label used
```

**Verification:**
- [ ] Labels applied
- [ ] References use label names
- [ ] Unknown addresses still shown

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-003: Output to File

**Purpose:** Verify file output option.

**Steps:**
1. Run with output:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm bank "game.nes" 0 --output "bank0.asm"
   ```

**Expected Result:**
- File created at specified path
- Complete disassembly in file
- Proper .asm formatting

**Verification:**
- [ ] File created
- [ ] Content complete
- [ ] Assembler-compatible format

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-004: Generate MLB Labels

**Purpose:** Verify Mesen label generation.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm labels "game.nes" --format mlb
   ```

**Expected Result:**
```
P:8000:Reset
P:8100:Sub_8100
P:8200:NmiHandler
P:8300:IrqHandler
R:0000:ZP_Temp
R:0010:PlayerX
R:0011:PlayerY
G:2000:PPU_CTRL
G:2001:PPU_MASK
...
```

**Verification:**
- [ ] MLB format correct
- [ ] P: for PRG labels
- [ ] R: for RAM labels
- [ ] G: for register labels

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-005: Generate NL Labels

**Purpose:** Verify FCEUX name list generation.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm labels "game.nes" --format nl
   ```

**Expected Result:**
```
$8000#Reset#
$8100#Sub_8100#
$0000#ZP_Temp#
```

**Verification:**
- [ ] NL format correct
- [ ] Can load in FCEUX

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-006: Generate SYM Labels

**Purpose:** Verify SYM format generation.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm labels "game.nes" --format sym
   ```

**Expected Result:**
```
[labels]
00:8000 Reset
00:8100 Sub_8100
00:0000 ZP_Temp
```

**Verification:**
- [ ] SYM format correct
- [ ] Bank:address notation
- [ ] Compatible with tools

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-007: Process CDL for Hints

**Purpose:** Verify CDL enhances disassembly.

**Steps:**
1. Run:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm cdl "game.cdl"
   ```

**Expected Result:**
```
CDL Analysis for Disassembly
────────────────────────────────────────
CDL file:     game.cdl
Coverage:     67.2%

Code regions identified:
  $8000-$81FF  (512 bytes)
  $8400-$8BFF  (2048 bytes)
  ...

Data regions identified:
  $8200-$83FF  (512 bytes)
  ...

Suggested entry points:
  $8000  (NMI vector target)
  $8003  (Reset vector target)
  $8006  (IRQ vector target)
────────────────────────────────────────
```

**Verification:**
- [ ] Code regions identified
- [ ] Data regions identified
- [ ] Entry points suggested
- [ ] Matches CDL content

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DASM-008: Generate Code/Data Separation

**Purpose:** Verify CDL-guided disassembly separates code and data.

**Steps:**
1. Disassemble with CDL guidance:
   ```powershell
   dotnet run --project src/GameInfoTools.Cli -- disasm bank "game.nes" 0 --cdl "game.cdl"
   ```

**Expected Result:**
```asm
; Code region (from CDL)
$8000: 78        SEI
$8001: D8        CLD
...

; Data region (from CDL) - not disassembled as code
.org $8200
DataTable:
.byte $00, $10, $20, $30    ; Data bytes
.byte $40, $50, $60, $70
...

; Code resumes
.org $8400
$8400: A5 00     LDA $00
```

**Verification:**
- [ ] Code properly disassembled
- [ ] Data shown as bytes, not opcodes
- [ ] Clear separation
- [ ] CDL info used correctly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📖 Label Format Reference

### MLB (Mesen Label)
```
P:XXXX:LabelName     ; PRG ROM label
R:XXXX:LabelName     ; RAM label
G:XXXX:LabelName     ; Register/hardware label
```

### NL (FCEUX Name List)
```
$XXXX#LabelName#OptionalComment
```

### SYM (Symbol File)
```
[labels]
BB:XXXX LabelName
```

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-DASM-001 | Disasm bank 0 | ☐ | | |
| TEST-DASM-002 | Disasm with labels | ☐ | | |
| TEST-DASM-003 | Output to file | ☐ | | |
| TEST-DASM-004 | MLB labels | ☐ | | |
| TEST-DASM-005 | NL labels | ☐ | | |
| TEST-DASM-006 | SYM labels | ☐ | | |
| TEST-DASM-007 | CDL processing | ☐ | | |
| TEST-DASM-008 | Code/data separation | ☐ | | |

**Total:** 0/8 tests completed

---

**Previous:** [Data Tools Testing](data-tools.md)  
**Back to:** [CLI Overview](README.md)
