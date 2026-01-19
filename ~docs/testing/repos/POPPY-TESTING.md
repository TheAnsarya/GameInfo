# 🌷 Poppy Testing Guide - Complete Manual Test Suite

> **Repository:** 🌷 Poppy - Multi-System Assembler  
> **Last Updated:** 2026-01-19 19:45 UTC  
> **Estimated Time:** 3-4 hours (across 2 days)

This document provides comprehensive step-by-step instructions for manually testing all Poppy assembler functionality.

---

## Table of Contents

1. [Test Environment Setup](#1-test-environment-setup)
2. [CLI - Basic Assembly](#2-cli---basic-assembly)
3. [CLI - NES 6502 Assembly](#3-cli---nes-6502-assembly)
4. [CLI - SNES 65816 Assembly](#4-cli---snes-65816-assembly)
5. [Directive Testing](#5-directive-testing)
6. [Macro Testing](#6-macro-testing)
7. [Label and Symbol Testing](#7-label-and-symbol-testing)
8. [Include/Incbin Testing](#8-includeincbin-testing)
9. [Error Handling](#9-error-handling)
10. [Roundtrip Testing](#10-roundtrip-testing)

---

## 1. Test Environment Setup

### Prerequisites
- [ ] Completed [PREREQUISITES.md](../prerequisites/PREREQUISITES.md)
- [ ] Completed [ENVIRONMENT-SETUP.md](../prerequisites/ENVIRONMENT-SETUP.md)

### Navigate to Repository

```powershell
cd "C:\Users\me\source\repos\poppy"
```

### Build Project (Fresh)

```powershell
dotnet clean Poppy.sln
dotnet build Poppy.sln
```

**Expected:**
```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

### Run Unit Tests

```powershell
dotnet test Poppy.sln --verbosity normal
```

**Record:** Total: ___, Passed: ___, Failed: ___

### Create Test Directories

```powershell
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\poppy\~manual-testing\input" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\poppy\~manual-testing\output" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\poppy\~manual-testing\expected" -Force
```

---

## 2. CLI - Basic Assembly

### 2.1 Display Help

```powershell
dotnet run --project src/Poppy.Cli -- --help
```

**Verify:**
- [ ] Program description ("🌷 Poppy Assembler")
- [ ] Available commands
- [ ] Options list

### 2.2 Display Version

```powershell
dotnet run --project src/Poppy.Cli -- --version
```

**Verify:** Shows version number

### 2.3 Assemble Simple File

Create `~manual-testing/input/simple.pasm`:
```asm
; Simple test file
.org $8000

Reset:
	lda #$00
	sta $2000
	jmp Reset
```

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/simple.pasm" `
    --output "~manual-testing/output/simple.bin"
```

**Verify:**
- [ ] No errors
- [ ] Output file created

### 2.4 Verify Binary Output

```powershell
# Display first 16 bytes in hex
$bytes = [System.IO.File]::ReadAllBytes("~manual-testing/output/simple.bin")
($bytes[0..15] | ForEach-Object { $_.ToString("x2") }) -join " "
```

**Expected:** `a9 00 8d 00 20 4c 00 80`

| Bytes | Instruction |
|-------|-------------|
| `a9 00` | `lda #$00` |
| `8d 00 20` | `sta $2000` |
| `4c 00 80` | `jmp $8000` |

---

## 3. CLI - NES 6502 Assembly

### 3.1 Create Complete NES Test

Create `~manual-testing/input/nes-test.pasm`:
```asm
; NES Test ROM
; Tests all common 6502 instructions

.target nes
.inesprg 1      ; 1x 16KB PRG ROM
.ineschr 0      ; 0x 8KB CHR ROM
.inesmap 0      ; Mapper 0 (NROM)
.inesmir 1      ; Vertical mirroring

.org $c000

; === Interrupt Vectors ===
Reset:
    sei                 ; Disable interrupts
    cld                 ; Clear decimal mode
    ldx #$ff
    txs                 ; Set up stack

    ; Wait for PPU
    bit $2002
WaitVBlank1:
    bit $2002
    bpl WaitVBlank1

    ; Clear RAM
    lda #$00
    ldx #$00
ClearRAM:
    sta $0000,x
    sta $0100,x
    sta $0200,x
    sta $0300,x
    sta $0400,x
    sta $0500,x
    sta $0600,x
    sta $0700,x
    inx
    bne ClearRAM

    ; Enable NMI
    lda #%10000000
    sta $2000

Forever:
    jmp Forever

NMI:
    pha
    txa
    pha
    tya
    pha

    ; NMI code here

    pla
    tay
    pla
    tax
    pla
    rti

IRQ:
    rti

; === Vectors ===
.org $fffa
    .word NMI
    .word Reset
    .word IRQ
```

### 3.2 Assemble NES ROM

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/nes-test.pasm" `
    --output "~manual-testing/output/nes-test.nes"
```

**Verify:**
- [ ] No errors
- [ ] Output file ~16KB (16,400 bytes with header)

### 3.3 Verify iNES Header

```powershell
$bytes = [System.IO.File]::ReadAllBytes("~manual-testing/output/nes-test.nes")
$header = $bytes[0..15]

Write-Host "Bytes 0-3: $([System.Text.Encoding]::ASCII.GetString($header[0..2]))"
Write-Host "PRG ROM banks: $($header[4])"
Write-Host "CHR ROM banks: $($header[5])"
Write-Host "Flags 6: $($header[6])"
Write-Host "Flags 7: $($header[7])"
```

**Expected:**
- Bytes 0-3: NES (+ $1A)
- PRG ROM banks: 1
- CHR ROM banks: 0
- Flags 6: 1 (vertical mirroring)

### 3.4 Verify Vectors

```powershell
$bytes = [System.IO.File]::ReadAllBytes("~manual-testing/output/nes-test.nes")
$vecStart = $bytes.Length - 6  # Last 6 bytes

$nmi = [BitConverter]::ToUInt16($bytes, $vecStart)
$reset = [BitConverter]::ToUInt16($bytes, $vecStart + 2)
$irq = [BitConverter]::ToUInt16($bytes, $vecStart + 4)

Write-Host "NMI: $('$' + $nmi.ToString('x4'))"
Write-Host "Reset: $('$' + $reset.ToString('x4'))"
Write-Host "IRQ: $('$' + $irq.ToString('x4'))"
```

**Verify:** Addresses match labels in source

### 3.5 Test in FCEUX Emulator

1. **Open** FCEUX
2. **File** → **Open ROM**
3. **Navigate to** `~manual-testing/output/nes-test.nes`
4. **Select** file and **Open**
5. **Verify:**
   - [ ] ROM loads without error
   - [ ] No immediate crash
   - [ ] Debug → Name Table Viewer shows PPU running

### 3.6 Test All 6502 Instructions

Create `~manual-testing/input/6502-all.pasm`:
```asm
; Test all 6502 instructions
.target nes
.org $8000

; === Load/Store ===
    lda #$12        ; Immediate
    ldx #$34
    ldy #$56
    sta $00         ; Zero page
    stx $01
    sty $02
    lda $00         ; Zero page
    ldx $01
    ldy $02
    sta $0300       ; Absolute
    stx $0301
    sty $0302
    lda $0300       ; Absolute
    ldx $0301
    ldy $0302

; === Zero Page Indexed ===
    ldx #$10
    lda $00,x       ; ZP,X
    sta $00,x
    ldy #$20
    ldx $00,y       ; ZP,Y

; === Absolute Indexed ===
    ldx #$05
    lda $0300,x
    sta $0300,x
    ldy #$03
    lda $0300,y
    sta $0300,y

; === Indirect ===
    ldx #$00
    lda ($80,x)     ; (Indirect,X)
    sta ($80,x)
    ldy #$00
    lda ($82),y     ; (Indirect),Y
    sta ($82),y

; === Arithmetic ===
    lda #$10
    adc #$05
    sbc #$02
    and #$0f
    ora #$f0
    eor #$55
    cmp #$10
    cpx #$05
    cpy #$03

; === Increment/Decrement ===
    inc $00
    dec $00
    inc $0300
    dec $0300
    inx
    dex
    iny
    dey

; === Shifts ===
    asl a
    lsr a
    rol a
    ror a
    asl $00
    lsr $00
    rol $00
    ror $00

; === Branches ===
    clc
    bcc .branch1
.branch1:
    sec
    bcs .branch2
.branch2:
    lda #$00
    beq .branch3
.branch3:
    lda #$01
    bne .branch4
.branch4:
    bpl .branch5
.branch5:
    lda #$80
    bmi .branch6
.branch6:
    clv
    bvc .branch7
.branch7:

; === Jump/Call ===
    jsr Subroutine
    jmp End

Subroutine:
    nop
    rts

; === Indirect Jump ===
IndirectJump:
    jmp (JumpVector)
JumpVector:
    .word End

; === Stack ===
    pha
    php
    pla
    plp
    tsx
    txs

; === Flags ===
    sec
    clc
    sed
    cld
    sei
    cli
    clv

; === Register Transfers ===
    tax
    tay
    txa
    tya

; === NOP/BRK ===
    nop
    ; brk  ; Don't actually execute BRK

End:
    jmp End
```

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/6502-all.pasm" `
    --output "~manual-testing/output/6502-all.bin"
```

**Verify:** All instructions assemble without error

---

## 4. CLI - SNES 65816 Assembly

### 4.1 Create SNES Test

Create `~manual-testing/input/snes-test.pasm`:
```asm
; SNES Test ROM
; Tests 65816 instructions

.target snes
.mapping lorom

.org $008000

Reset:
    sei
    clc
    xce             ; Switch to native mode
    
    rep #$30        ; 16-bit A/X/Y
    
    lda #$0000
    tcd             ; Direct page = 0
    
    lda #$01ff
    tcs             ; Stack = $01FF
    
    sep #$20        ; 8-bit A
    
    lda #$80
    sta $2100       ; Force blank
    
Forever:
    jmp Forever

NMI:
    rti

; Long addressing
    jsl LongSub
    rtl

LongSub:
    nop
    rtl

; Block move
    rep #$30
    lda #$0100      ; Length - 1
    ldx #$0000      ; Source
    ldy #$1000      ; Dest
    mvn $00,$7e     ; Move block

; === Vectors ===
.org $00ffe0
    .word 0         ; unused
    .word 0         ; unused
    .word 0         ; COP
    .word 0         ; BRK
    .word 0         ; ABORT
    .word NMI       ; NMI
    .word 0         ; unused
    .word 0         ; IRQ

.org $00fff0
    .word 0         ; unused
    .word 0         ; unused
    .word 0         ; COP
    .word 0         ; unused
    .word 0         ; ABORT
    .word 0         ; NMI
    .word Reset     ; RESET
    .word 0         ; IRQ/BRK
```

### 4.2 Assemble SNES ROM

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/snes-test.pasm" `
    --output "~manual-testing/output/snes-test.sfc"
```

**Verify:**
- [ ] No errors
- [ ] Output file created

### 4.3 Verify 65816-Specific Instructions

Check binary for these opcodes:

| Instruction | Opcode | Present? |
|-------------|--------|----------|
| `xce` | $FB | [ ] |
| `sep #$xx` | $E2 | [ ] |
| `rep #$xx` | $C2 | [ ] |
| `tcd` | $5B | [ ] |
| `tcs` | $1B | [ ] |
| `jsl` | $22 | [ ] |
| `rtl` | $6B | [ ] |
| `mvn` | $54 | [ ] |

### 4.4 Test in bsnes/Mesen2

1. **Open** Mesen2 (or bsnes)
2. **File** → **Open**
3. **Select** `snes-test.sfc`
4. **Verify:**
   - [ ] ROM loads
   - [ ] Debugger shows code running

---

## 5. Directive Testing

### 5.1 Test .org Directive

Create `~manual-testing/input/test-org.pasm`:
```asm
.org $1000
    nop
.org $2000
    nop
.org $3000
    nop
```

**Verify:** NOP at offsets $1000, $2000, $3000

### 5.2 Test .byte/.word/.long

Create `~manual-testing/input/test-data.pasm`:
```asm
.org $0000

ByteData:
    .byte $12, $34, $56, $78
    .byte "Hello", 0

WordData:
    .word $1234, $5678
    .word Label1

LongData:
    .long $123456

Label1:
    nop
```

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/test-data.pasm" `
    --output "~manual-testing/output/test-data.bin"
```

**Verify binary contains:**
- `12 34 56 78` (bytes)
- `48 65 6c 6c 6f 00` ("Hello" + null)
- `34 12 78 56` (words, little-endian)
- `56 34 12` (long, little-endian)

### 5.3 Test .fill/.align

Create `~manual-testing/input/test-fill.pasm`:
```asm
.org $0000
    .byte $aa
    .fill 16, $00
    .byte $bb
    .align 256
    .byte $cc
```

**Verify:**
- `$aa` at offset 0
- 16 `$00` bytes
- `$bb` at offset 17
- `$cc` at offset 256

### 5.4 Test .define

Create `~manual-testing/input/test-define.pasm`:
```asm
.define CONSTANT $1234
.define PPUADDR $2006

.org $8000
    lda #<CONSTANT
    ldx #>CONSTANT
    sta PPUADDR
```

**Verify:**
- `lda #$34`
- `ldx #$12`
- `sta $2006`

---

## 6. Macro Testing

### 6.1 Simple Macro

Create `~manual-testing/input/test-macro.pasm`:
```asm
.macro SetPPUAddr addr
    lda #>addr
    sta $2006
    lda #<addr
    sta $2006
.endmacro

.org $8000
    SetPPUAddr $2100
```

**Verify:** Expands to 4 instructions

### 6.2 Macro with Multiple Parameters

```asm
.macro MemCpy src, dst, len
    ldx #len
.loop:
    lda src-1,x
    sta dst-1,x
    dex
    bne .loop
.endmacro
```

### 6.3 Nested Macros

```asm
.macro Outer
    Inner
    nop
.endmacro

.macro Inner
    lda #$00
.endmacro

.org $8000
    Outer
```

**Verify:** Both macros expand correctly

---

## 7. Label and Symbol Testing

### 7.1 Local Labels

Create `~manual-testing/input/test-labels.pasm`:
```asm
.org $8000

GlobalLabel1:
    nop
.localA:
    jmp .localA

GlobalLabel2:
    nop
.localA:            ; Same name, different scope
    jmp .localA     ; Jumps to THIS .localA
```

**Verify:** Local labels resolve to correct addresses

### 7.2 Anonymous Labels

```asm
.org $8000
    ldx #$10
-   dex
    bne -           ; Jump back to -
    
    ldy #$05
--  dey
    bne --          ; Jump to --
```

### 7.3 Forward References

```asm
.org $8000
    jmp Forward     ; Forward reference
    nop
    nop
Forward:
    rts
```

**Verify:** Forward reference resolves correctly

### 7.4 Export Symbol File

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/nes-test.pasm" `
    --output "~manual-testing/output/nes-test.nes" `
    --symbols "~manual-testing/output/nes-test.sym"
```

**Verify symbol file contains:**
- All global labels
- Addresses in hex

---

## 8. Include/Incbin Testing

### 8.1 Test .include

Create `~manual-testing/input/include-main.pasm`:
```asm
.target nes
.org $8000

.include "include-sub.pasm"

Start:
    jsr IncludedSub
    jmp Start
```

Create `~manual-testing/input/include-sub.pasm`:
```asm
IncludedSub:
    lda #$00
    rts
```

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/include-main.pasm" `
    --output "~manual-testing/output/include-test.bin"
```

**Verify:** Subroutine included and callable

### 8.2 Test .incbin

Create a binary file to include:
```powershell
[byte[]]$data = 0x00,0x11,0x22,0x33,0x44,0x55,0x66,0x77
[System.IO.File]::WriteAllBytes("~manual-testing/input/data.bin", $data)
```

Create `~manual-testing/input/incbin-test.pasm`:
```asm
.org $8000

BinaryData:
    .incbin "data.bin"

BinaryPartial:
    .incbin "data.bin", 2, 4  ; Skip 2, include 4 bytes

Code:
    lda BinaryData
    rts
```

**Verify:** Binary data included at correct offsets

---

## 9. Error Handling

### 9.1 Syntax Error

Create `~manual-testing/input/error-syntax.pasm`:
```asm
.org $8000
    lda #$        ; Missing value
```

```powershell
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/error-syntax.pasm" `
    --output "~manual-testing/output/error.bin"
```

**Verify:**
- [ ] Error message with line number
- [ ] Describes syntax error
- [ ] Non-zero exit code

### 9.2 Unknown Instruction

```asm
.org $8000
    xyz #$00      ; Invalid opcode
```

**Verify:** "Unknown instruction" error

### 9.3 Label Redefinition

```asm
.org $8000
MyLabel:
    nop
MyLabel:          ; Duplicate!
    nop
```

**Verify:** "Label already defined" error

### 9.4 Undefined Reference

```asm
.org $8000
    jmp UndefinedLabel
```

**Verify:** "Undefined symbol" error

### 9.5 Missing Include File

```asm
.include "nonexistent.pasm"
```

**Verify:** "File not found" error

### 9.6 Branch Out of Range

```asm
.org $8000
    nop
.fill 200
    beq Target      ; Too far!
.fill 200
Target:
    rts
```

**Verify:** "Branch out of range" error

---

## 10. Roundtrip Testing

### 10.1 Disassemble → Assemble → Compare

This is the CRITICAL test for Poppy/Peony integration.

```powershell
# Step 1: Disassemble original ROM with Peony
cd "C:\Users\me\source\repos\peony"
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --output "C:\Users\me\source\repos\poppy\~manual-testing\input\dw4-disasm.pasm"

# Step 2: Assemble with Poppy
cd "C:\Users\me\source\repos\poppy"
dotnet run --project src/Poppy.Cli -- assemble `
    "~manual-testing/input/dw4-disasm.pasm" `
    --output "~manual-testing/output/dw4-rebuilt.nes"

# Step 3: Compare
$original = [System.IO.File]::ReadAllBytes("C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes")
$rebuilt = [System.IO.File]::ReadAllBytes("~manual-testing/output/dw4-rebuilt.nes")

if ($original.Length -ne $rebuilt.Length) {
    Write-Host "❌ Size mismatch: Original=$($original.Length), Rebuilt=$($rebuilt.Length)" -ForegroundColor Red
} else {
    $differences = 0
    for ($i = 0; $i -lt $original.Length; $i++) {
        if ($original[$i] -ne $rebuilt[$i]) {
            $differences++
            if ($differences -le 10) {
                Write-Host "  Diff at offset $('0x{0:x}' -f $i): Original=$('0x{0:x2}' -f $original[$i]), Rebuilt=$('0x{0:x2}' -f $rebuilt[$i])"
            }
        }
    }
    
    if ($differences -eq 0) {
        Write-Host "✅ PERFECT MATCH! Files are byte-identical" -ForegroundColor Green
    } else {
        Write-Host "❌ $differences byte(s) different" -ForegroundColor Red
    }
}
```

**CRITICAL:** Must be byte-identical for roundtrip guarantee!

### 10.2 Test with Multiple ROMs

Repeat roundtrip test with:
- [ ] Dragon Warrior IV (NES)
- [ ] Dragon Warrior (NES)
- [ ] FFMQ (SNES)
- [ ] Homebrew ROMs

---

## Test Results Template

Copy to `~manual-testing/poppy-results-YYYY-MM-DD.md`:

```markdown
# Poppy Test Results - YYYY-MM-DD

**Tester:** [Name]
**Version:** [Version]
**Date:** [Date]

## Summary
- Total: X
- Passed: X
- Failed: X

## Roundtrip Results
| ROM | Size | Match? | Differences |
|-----|------|--------|-------------|
| DW4 | 512KB | ✅/❌ | N/A or count |
| FFMQ | 1MB | ✅/❌ | N/A or count |

## Issues Found
| ID | Section | Description | Severity |
|----|---------|-------------|----------|
```

---

**Previous Document:** [PEONY-TESTING.md](PEONY-TESTING.md)  
**Next Document:** [MESEN2-TESTING.md](MESEN2-TESTING.md)  
**Integration Tests:** [INTEGRATION-FULL-ROUNDTRIP.md](../integration/INTEGRATION-FULL-ROUNDTRIP.md)
