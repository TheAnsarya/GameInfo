# 🌺 Peony Testing Guide - Complete Manual Test Suite

> **Repository:** 🌺 Peony - Multi-System Disassembler  
> **Last Updated:** 2026-01-19 19:40 UTC  
> **Estimated Time:** 3-4 hours (across 2 days)

This document provides comprehensive step-by-step instructions for manually testing all Peony disassembler functionality.

---

## Table of Contents

1. [Test Environment Setup](#1-test-environment-setup)
2. [CLI - Basic Disassembly](#2-cli---basic-disassembly)
3. [CLI - NES 6502 Disassembly](#3-cli---nes-6502-disassembly)
4. [CLI - SNES 65816 Disassembly](#4-cli---snes-65816-disassembly)
5. [Output Format Testing](#5-output-format-testing)
6. [Pansy Export Testing](#6-pansy-export-testing)
7. [Symbol Import Testing](#7-symbol-import-testing)
8. [Error Handling](#8-error-handling)
9. [Performance Testing](#9-performance-testing)

---

## 1. Test Environment Setup

### Prerequisites
- [ ] Completed [PREREQUISITES.md](../prerequisites/PREREQUISITES.md)
- [ ] Completed [ENVIRONMENT-SETUP.md](../prerequisites/ENVIRONMENT-SETUP.md)
- [ ] Have test ROMs ready (see [TEST-ROMS.md](../prerequisites/TEST-ROMS.md))

### Navigate to Repository

```powershell
cd "C:\Users\me\source\repos\peony"
```

### Build Project (Fresh)

```powershell
dotnet clean Peony.sln
dotnet build Peony.sln
```

**Expected output:**
```
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

### Run Unit Tests

```powershell
dotnet test Peony.sln --verbosity normal
```

**Record:** Total tests: ___, Passed: ___, Failed: ___

### Create Test Output Directory

```powershell
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\peony\~manual-testing\output" -Force
```

---

## 2. CLI - Basic Disassembly

### 2.1 Display Help

```powershell
dotnet run --project src/Peony.Cli -- --help
```

**Verify output includes:**
- [ ] Program description ("🌺 Peony Disassembler")
- [ ] Available commands
- [ ] Options list
- [ ] Usage examples

### 2.2 Display Version

```powershell
dotnet run --project src/Peony.Cli -- --version
```

**Verify:** Shows version number

### 2.3 Disassemble with Auto-Detection

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --output "~manual-testing/output/dw4-auto.pasm"
```

**Verify:**
- [ ] Completes without error
- [ ] Output file created
- [ ] Platform auto-detected as NES

### 2.4 Specify Platform Explicitly

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --output "~manual-testing/output/dw4-explicit.pasm"
```

**Verify:**
- [ ] Same result as auto-detection

---

## 3. CLI - NES 6502 Disassembly

### 3.1 Basic NES Disassembly

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --output "~manual-testing/output/dw4-nes.pasm"
```

**Verify output file structure:**
1. **Open** `dw4-nes.pasm` in VS Code
2. **Check:**
   - [ ] File header with ROM information
   - [ ] Bank headers/markers
   - [ ] Assembly instructions
   - [ ] Data bytes

### 3.2 Verify Instruction Decoding

Open the output and check for these 6502 instructions:

| Instruction | Present? | Example Line |
|-------------|----------|--------------|
| `lda` | [ ] | `lda #$00` |
| `sta` | [ ] | `sta $2000` |
| `jsr` | [ ] | `jsr $8000` |
| `rts` | [ ] | `rts` |
| `jmp` | [ ] | `jmp $c000` |
| `beq/bne` | [ ] | `beq $8050` |
| `ldx/ldy` | [ ] | `ldx #$ff` |
| `stx/sty` | [ ] | `stx $0010` |
| `inc/dec` | [ ] | `inc $00` |
| `pha/pla` | [ ] | `pha` |

### 3.3 Check Addressing Modes

Verify these addressing modes are disassembled correctly:

| Mode | Example | Present? |
|------|---------|----------|
| Immediate | `lda #$00` | [ ] |
| Zero Page | `lda $10` | [ ] |
| Zero Page,X | `lda $10,x` | [ ] |
| Absolute | `lda $c000` | [ ] |
| Absolute,X | `lda $c000,x` | [ ] |
| Absolute,Y | `lda $c000,y` | [ ] |
| Indirect | `jmp ($fffc)` | [ ] |
| (Indirect,X) | `lda ($10,x)` | [ ] |
| (Indirect),Y | `lda ($10),y` | [ ] |

### 3.4 Check Vector Table

NES ROMs have interrupt vectors at the end:

```powershell
# Search output for vectors
Select-String -Path "~manual-testing/output/dw4-nes.pasm" -Pattern "fffa|fffc|fffe"
```

**Verify:**
- [ ] $FFFA - NMI vector reference
- [ ] $FFFC - Reset vector reference
- [ ] $FFFE - IRQ/BRK vector reference

### 3.5 Disassemble Specific Range

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --start 0x8000 `
    --end 0x8100 `
    --output "~manual-testing/output/dw4-partial.pasm"
```

**Verify:**
- [ ] Output contains only $8000-$8100 range
- [ ] Approximately 256 bytes worth of code

### 3.6 Disassemble with iNES Header Handling

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --skip-header 16 `
    --output "~manual-testing/output/dw4-skip-header.pasm"
```

**Verify:**
- [ ] Header bytes not treated as code
- [ ] PRG ROM starts at correct offset

---

## 4. CLI - SNES 65816 Disassembly

### 4.1 Basic SNES Disassembly

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\snes\ffmq.sfc" `
    --platform snes `
    --output "~manual-testing/output/ffmq-snes.pasm"
```

**Verify:**
- [ ] Completes without error
- [ ] Output file created

### 4.2 Verify 65816 Instructions

Check for 65816-specific instructions:

| Instruction | Present? | Example |
|-------------|----------|---------|
| `sep` | [ ] | `sep #$20` |
| `rep` | [ ] | `rep #$30` |
| `phb/plb` | [ ] | `phb` |
| `phk` | [ ] | `phk` |
| `mvn/mvp` | [ ] | `mvn $00,$01` |
| `per/pea/pei` | [ ] | `pea $1234` |
| `xba` | [ ] | `xba` |
| `wai/stp` | [ ] | `wai` |
| Long addressing | [ ] | `jsl $c08000` |

### 4.3 Check Accumulator/Index Size Tracking

65816 instructions change size based on processor flags.

1. **Search for SEP/REP:**
   ```powershell
   Select-String -Path "~manual-testing/output/ffmq-snes.pasm" -Pattern "sep|rep"
   ```

2. **Verify:**
   - [ ] After `sep #$20`, `lda` uses 8-bit immediate
   - [ ] After `rep #$20`, `lda` uses 16-bit immediate
   - [ ] After `sep #$10`, `ldx/ldy` uses 8-bit immediate
   - [ ] After `rep #$10`, `ldx/ldy` uses 16-bit immediate

### 4.4 Check LoROM/HiROM Detection

```powershell
# For LoROM (most common)
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\snes\ffmq.sfc" `
    --platform snes `
    --mapping lorom `
    --output "~manual-testing/output/ffmq-lorom.pasm"

# For HiROM
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\snes\ffmq.sfc" `
    --platform snes `
    --mapping hirom `
    --output "~manual-testing/output/ffmq-hirom.pasm"
```

**Verify:**
- [ ] LoROM addresses mapped correctly ($8000-$FFFF per bank)
- [ ] HiROM addresses mapped correctly (if applicable)

---

## 5. Output Format Testing

### 5.1 Default .pasm Format

1. **Open** `dw4-nes.pasm`
2. **Verify** format elements:
   - [ ] Comments start with `;`
   - [ ] Labels on separate lines
   - [ ] Hexadecimal with `$` prefix
   - [ ] Lowercase opcodes
   - [ ] Tabs for indentation

### 5.2 Export as ca65 Compatible

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --format ca65 `
    --output "~manual-testing/output/dw4-ca65.asm"
```

**Verify:**
- [ ] Uses ca65 syntax (`.segment`, `.byte`, etc.)
- [ ] Can be assembled with ca65 (see roundtrip test)

### 5.3 Export with Data/Code Hints

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --data-hints "0xc000-0xcfff" `
    --output "~manual-testing/output/dw4-with-data.pasm"
```

**Verify:**
- [ ] $C000-$CFFF marked as `.byte` data
- [ ] Not disassembled as code

---

## 6. Pansy Export Testing

### 6.1 Generate Pansy File During Disassembly

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --output "~manual-testing/output/dw4.pasm" `
    --pansy "~manual-testing/output/dw4.pansy"
```

**Verify:**
- [ ] Pansy file created
- [ ] Contains auto-detected symbols

### 6.2 Verify Pansy Contents

```powershell
# Use Pansy CLI to inspect
cd "C:\Users\me\source\repos\pansy"
dotnet run --project src/Pansy.Cli -- info `
    "C:\Users\me\source\repos\peony\~manual-testing\output\dw4.pansy"
```

**Verify:**
- [ ] Platform shows as NES
- [ ] Symbol count > 0
- [ ] Cross-reference count > 0

### 6.3 Open in Pansy UI

1. **Launch** Pansy UI
2. **Open** `dw4.pansy`
3. **Verify:**
   - [ ] All symbols visible
   - [ ] Cross-references visible
   - [ ] Call graph renders (if functions detected)

---

## 7. Symbol Import Testing

### 7.1 Import Existing Labels

Create a label file `~manual-testing/input/dw4-labels.txt`:
```
$8000 Reset
$8010 NMI
$8020 IRQ
$0000 PlayerX
$0001 PlayerY
$c000 MonsterTable
```

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --labels "~manual-testing/input/dw4-labels.txt" `
    --output "~manual-testing/output/dw4-with-labels.pasm"
```

**Verify in output:**
- [ ] `Reset:` label at $8000
- [ ] `NMI:` label at $8010
- [ ] `jsr Reset` instead of `jsr $8000`
- [ ] `lda PlayerX` instead of `lda $00`

### 7.2 Import from Pansy File

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --pansy-import "C:\Users\me\source\repos\pansy\~manual-testing\test-files\sample.pansy" `
    --output "~manual-testing/output/dw4-from-pansy.pasm"
```

**Verify:**
- [ ] Labels from Pansy file appear in output
- [ ] Comments from Pansy file appear (if supported)

### 7.3 Import from Mesen Labels

Create `~manual-testing/input/dw4-mesen.mlb`:
```
P:8000:Reset
P:8010:NMI
G:0000:PlayerX
```

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform nes `
    --mesen-labels "~manual-testing/input/dw4-mesen.mlb" `
    --output "~manual-testing/output/dw4-from-mesen.pasm"
```

**Verify:**
- [ ] Mesen labels imported
- [ ] Type information preserved (P=code, G=RAM)

---

## 8. Error Handling

### 8.1 Non-Existent ROM File

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "nonexistent.nes" `
    --output "~manual-testing/output/error.pasm"
```

**Verify:**
- [ ] Error message: "File not found"
- [ ] Non-zero exit code
- [ ] No output file created

### 8.2 Invalid ROM File

```powershell
"Not a ROM file" | Out-File "~manual-testing/input/invalid.nes"
dotnet run --project src/Peony.Cli -- disasm `
    "~manual-testing/input/invalid.nes" `
    --output "~manual-testing/output/error.pasm"
```

**Verify:**
- [ ] Error message about invalid ROM format
- [ ] Non-zero exit code

### 8.3 Invalid Range

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --start 0xFFFFFF `
    --end 0xFFFFFFFF `
    --output "~manual-testing/output/error.pasm"
```

**Verify:**
- [ ] Error message about range exceeding file size
- [ ] Non-zero exit code

### 8.4 Invalid Platform

```powershell
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --platform "xbox360" `
    --output "~manual-testing/output/error.pasm"
```

**Verify:**
- [ ] Error message about unknown platform
- [ ] Lists valid platforms

### 8.5 Write Permission Error

```powershell
# Try to write to protected location
dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\nes\dragon-warrior-4.nes" `
    --output "C:\Windows\System32\test.pasm"
```

**Verify:**
- [ ] Error message about write permissions
- [ ] Non-zero exit code

---

## 9. Performance Testing

### 9.1 Time Large ROM Disassembly

```powershell
$timer = [System.Diagnostics.Stopwatch]::StartNew()

dotnet run --project src/Peony.Cli -- disasm `
    "C:\Users\me\source\repos\roms\snes\ffmq.sfc" `
    --platform snes `
    --output "~manual-testing/output/ffmq-perf.pasm"

$timer.Stop()
Write-Host "Time: $($timer.Elapsed.TotalSeconds) seconds"
```

**Record:** ___ seconds

**Acceptable:** < 30 seconds for 1MB ROM

### 9.2 Memory Usage

1. **Open** Task Manager
2. **Run** disassembly of large ROM
3. **Watch** Peony process memory
4. **Record:** Peak memory: ___ MB
5. **Acceptable:** < 500MB for 4MB ROM

### 9.3 Incremental Disassembly

If supported, test resuming partial disassembly:

```powershell
# Start and cancel
dotnet run --project src/Peony.Cli -- disasm ... &
Start-Sleep 5
Stop-Process -Name "dotnet" -Force

# Resume
dotnet run --project src/Peony.Cli -- disasm --resume ...
```

---

## Roundtrip Verification

### Verify Disassembly Can Reassemble

This is the critical roundtrip test:

1. **Disassemble** original ROM
2. **Assemble** the output with Poppy
3. **Compare** resulting ROM to original
4. **Must be byte-identical**

See [INTEGRATION-FULL-ROUNDTRIP.md](../integration/INTEGRATION-FULL-ROUNDTRIP.md)

---

## Test Results Template

Copy to `~manual-testing/peony-results-YYYY-MM-DD.md`:

```markdown
# Peony Test Results - YYYY-MM-DD

**Tester:** [Name]
**Version:** [Peony version]
**Date:** [Date]

## Summary
- Total Tests: X
- Passed: X
- Failed: X

## Results
- [ ] 2.1 Display Help
- [ ] 2.2 Display Version
...

## Performance
- 1MB ROM disassembly: ___ seconds
- Peak memory: ___ MB

## Issues Found
| ID | Section | Description | Severity |
|----|---------|-------------|----------|
```

---

**Previous Document:** [PANSY-TESTING.md](PANSY-TESTING.md)  
**Next Document:** [POPPY-TESTING.md](POPPY-TESTING.md)  
**Integration Tests:** [INTEGRATION-PANSY-PEONY.md](../integration/INTEGRATION-PANSY-PEONY.md)
