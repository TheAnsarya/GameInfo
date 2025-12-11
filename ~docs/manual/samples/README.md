# Sample Test Data Guide

> **GitHub Issue:** [#35 - docs: Manual Testing - Sample Test Data](https://github.com/TheAnsarya/GameInfo/issues/35)  
> **Parent Issue:** [#32 - Epic: Manual Testing Documentation](https://github.com/TheAnsarya/GameInfo/issues/32)

## 📋 Overview

This guide explains how to obtain and prepare sample files for testing the GameInfo Tools.

⚠️ **Important:** Only use legally obtained ROMs that you own. This guide provides information about public domain test ROMs and sample files.

---

## 🎮 Test ROM Sources

### Public Domain NES Test ROMs

These test ROMs are freely available and legal to use:

| ROM | Purpose | Download |
|-----|---------|----------|
| **nestest.nes** | CPU testing | [nesdev.org](https://www.nesdev.org/wiki/Emulator_tests) |
| **blargg's tests** | Various | [GitHub](https://github.com/christopherpow/nes-test-roms) |
| **Holy Diver Batman** | Demo | [NESdev forums](https://forums.nesdev.org) |
| **Lan Master** | Homebrew | Public domain |

### How to Get Test ROMs

1. **nestest.nes** (Recommended for basic testing):
   ```powershell
   # Download from nesdev wiki
   Invoke-WebRequest -Uri "https://www.nesdev.org/wiki/Emulator_tests" -OutFile "tests-page.html"
   # Then manually download nestest.nes from the page
   ```

2. **Use your own games:**
   - If you own physical cartridges, you can dump them
   - Purchased digital copies may work

---

## 📁 Sample CDL Files

### Creating CDL Files

You can create CDL files using emulators:

#### FCEUX (Windows)
1. Open a ROM in FCEUX
2. Debug → Code/Data Logger → Start
3. Play the game for a while
4. Debug → Code/Data Logger → Save As
5. Save as `game.cdl`

#### Mesen (Windows/Linux/Mac)
1. Open a ROM in Mesen
2. Debug → Code/Data Logger → Start Logging
3. Play the game
4. Debug → Code/Data Logger → Save CDL

### Sample CDL for Testing

A minimal test CDL file structure:

**test.cdl** (create with hex editor):
```
Offset  | Content | Meaning
--------|---------|----------
$00000  | 01      | Code executed
$00001  | 02      | Data read
$00002  | 03      | Both code+data
$00003  | 00      | Unlogged
...
```

To create programmatically:
```powershell
# Create a 32KB test CDL file
$bytes = [byte[]]::new(32768)
# Set some code flags
for ($i = 0; $i -lt 1024; $i++) {
    $bytes[$i] = 0x01  # Code
}
# Set some data flags
for ($i = 1024; $i -lt 2048; $i++) {
    $bytes[$i] = 0x02  # Data
}
[System.IO.File]::WriteAllBytes("test.cdl", $bytes)
```

---

## 📝 Sample Table Files

### Creating .tbl Files

Table files map byte values to text characters.

**sample.tbl**:
```
00= 
01=A
02=B
03=C
04=D
05=E
06=F
07=G
08=H
09=I
0A=J
0B=K
0C=L
0D=M
0E=N
0F=O
10=P
11=Q
12=R
13=S
14=T
15=U
16=V
17=W
18=X
19=Y
1A=Z
1B=a
1C=b
1D=c
1E=d
1F=e
20=f
21=g
22=h
23=i
24=j
25=k
26=l
27=m
28=n
29=o
2A=p
2B=q
2C=r
2D=s
2E=t
2F=u
30=v
31=w
32=x
33=y
34=z
35=0
36=1
37=2
38=3
39=4
3A=5
3B=6
3C=7
3D=8
3E=9
3F=!
40=?
41=.
42=,
43='
FF=<END>
FE=<LINE>
```

---

## 🏷️ Sample Label Files

### MLB Format (Mesen)

**sample.mlb**:
```
P:8000:Reset
P:8003:NmiHandler
P:8006:IrqHandler
P:8100:MainLoop
P:8200:ReadController
P:8300:UpdateGraphics
P:8400:ProcessInput
R:0000:CurrentFrame
R:0001:PlayerX
R:0002:PlayerY
R:0010:ButtonState
R:0020:GameState
G:2000:PPU_CTRL
G:2001:PPU_MASK
G:2002:PPU_STATUS
G:2003:OAM_ADDR
G:2004:OAM_DATA
G:2005:PPU_SCROLL
G:2006:PPU_ADDR
G:2007:PPU_DATA
G:4014:OAM_DMA
G:4016:JOY1
G:4017:JOY2
```

### NL Format (FCEUX)

**sample.nl**:
```
$8000#Reset#
$8003#NmiHandler#
$8006#IrqHandler#
$8100#MainLoop#
$0000#CurrentFrame#
$0001#PlayerX#
$2000#PPU_CTRL#
```

### SYM Format

**sample.sym**:
```
[labels]
00:8000 Reset
00:8003 NmiHandler
00:8006 IrqHandler
00:8100 MainLoop
00:0000 CurrentFrame
```

---

## 📜 Sample Script Files

### Text Insertion Script

**sample-script.txt**:
```
;; Sample script file for text insertion testing
;; Format: #POINTER:address followed by text

#POINTER:$A000
Hello, world!<LINE>
This is a test.<END>

#POINTER:$A100
Welcome to the game!<LINE>
Press START to begin.<END>

#POINTER:$A200
Item obtained!<END>

#POINTER:$A300
Game Over<LINE>
Continue?<LINE>
> Yes   No<END>
```

---

## 📂 Recommended Test Directory Structure

Set up your test files like this:

```
~docs/manual/samples/
├── README.md           (this file)
├── cdl/
│   ├── test-fceux.cdl
│   ├── test-mesen.mcdl
│   └── test-bsnes.cdl
├── tables/
│   ├── sample.tbl
│   ├── nes-standard.tbl
│   └── snes-standard.tbl
├── labels/
│   ├── sample.mlb
│   ├── sample.nl
│   └── sample.sym
├── scripts/
│   └── sample-script.txt
└── roms/
    └── (put your legal ROMs here)
```

---

## ✅ Sample File Checklist

Ensure you have these files before testing:

### Required
- [ ] At least one NES ROM (legally obtained)
- [ ] A basic .tbl file
- [ ] A basic CDL file

### Recommended
- [ ] NES ROM with known structure
- [ ] SNES ROM (for 65816 testing)
- [ ] Multiple CDL files (for merge testing)
- [ ] CDL files from different emulators
- [ ] Label files in each format (MLB, NL, SYM)
- [ ] Sample script file

### Optional
- [ ] Games you're familiar with (easier to verify results)
- [ ] Games with known data structures
- [ ] Multiple ROMs from same series

---

## 🔧 Creating Test Files

### Quick Test CDL Generator (PowerShell)

```powershell
# Create a test CDL file with various coverage patterns
function New-TestCdl {
    param(
        [string]$OutputPath = "test.cdl",
        [int]$Size = 32768
    )
    
    $bytes = [byte[]]::new($Size)
    
    # First quarter: Code (0x01)
    for ($i = 0; $i -lt $Size/4; $i++) {
        $bytes[$i] = 0x01
    }
    
    # Second quarter: Data (0x02)
    for ($i = $Size/4; $i -lt $Size/2; $i++) {
        $bytes[$i] = 0x02
    }
    
    # Third quarter: Both (0x03)
    for ($i = $Size/2; $i -lt 3*$Size/4; $i++) {
        $bytes[$i] = 0x03
    }
    
    # Fourth quarter: Unknown (0x00) - no change needed
    
    [System.IO.File]::WriteAllBytes($OutputPath, $bytes)
    Write-Host "Created $OutputPath ($Size bytes)"
}

# Usage:
New-TestCdl -OutputPath "test.cdl" -Size 32768
```

### Quick TBL Generator (PowerShell)

```powershell
# Create a standard ASCII-ish TBL file
function New-TestTbl {
    param([string]$OutputPath = "test.tbl")
    
    $content = @"
00= 
01=A
02=B
03=C
04=D
05=E
06=F
07=G
08=H
09=I
0A=J
0B=K
0C=L
0D=M
0E=N
0F=O
10=P
11=Q
12=R
13=S
14=T
15=U
16=V
17=W
18=X
19=Y
1A=Z
FF=<END>
FE=<LINE>
"@
    
    Set-Content -Path $OutputPath -Value $content
    Write-Host "Created $OutputPath"
}

New-TestTbl -OutputPath "test.tbl"
```

---

## 📊 Test Data Verification

After creating test files, verify them:

### CDL Verification
```powershell
# Check CDL file statistics
dotnet run --project src/GameInfoTools.Cli -- analysis cdl stats test.cdl
```

Expected: Should show ~25% code, ~25% data, ~25% both, ~25% unknown

### TBL Verification
```powershell
# Check TBL loads without errors
dotnet run --project src/GameInfoTools.Cli -- text extract test.nes --table test.tbl
```

---

## 🔗 External Resources

- [NESdev Wiki](https://www.nesdev.org/wiki/) - NES technical documentation
- [SNESdev Wiki](https://snes.nesdev.org/) - SNES technical documentation  
- [Romhacking.net](https://www.romhacking.net/) - ROM hacking community
- [FCEUX](https://fceux.com/) - NES emulator with debugger
- [Mesen](https://www.mesen.ca/) - Multi-system emulator

---

**Back to:** [Manual Testing Overview](../README.md)
