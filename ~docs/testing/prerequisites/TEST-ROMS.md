# 🎮 Test ROMs - Acquiring Legal Test Files

> **Last Updated:** 2026-01-19 19:30 UTC  
> **Time Required:** 20-30 minutes

This document explains how to legally obtain test ROMs for the testing suite.

---

## ⚖️ Legal Disclaimer

**IMPORTANT:** This project does NOT distribute copyrighted ROM files. You must:
1. Own original cartridges for any ROMs you dump
2. Dump ROMs from your own cartridges using legal dumping hardware
3. Or use homebrew/freely available ROMs for testing

---

## Table of Contents

1. [Required Test ROMs](#1-required-test-roms)
2. [ROM Dumping Hardware](#2-rom-dumping-hardware)
3. [Homebrew Alternatives](#3-homebrew-alternatives)
4. [ROM Verification](#4-rom-verification)
5. [Directory Setup](#5-directory-setup)

---

## 1. Required Test ROMs

### NES ROMs (Priority 1 - Essential)

| Game | CRC32 | Size | Purpose |
|------|-------|------|---------|
| Dragon Warrior IV (US) | `57c13f4d` | 512KB | DW4 disassembly testing |
| Dragon Warrior (US) | `2dcf893a` | 64KB | DW1 disassembly testing |

### SNES ROMs (Priority 1 - Essential)

| Game | CRC32 | Size | Purpose |
|------|-------|------|---------|
| Final Fantasy Mystic Quest (US) | `fce3f1f1` | 1MB | FFMQ disassembly testing |

### SNES ROMs (Priority 2 - Optional)

| Game | CRC32 | Size | Purpose |
|------|-------|------|---------|
| Dragon Quest III (JP) | `varies` | 4MB | DQ3r testing |
| Dragon Quest IV (JP) | `varies` | 4MB | DQ4r testing |

### Game Boy ROMs (Priority 3 - Future)

| Game | CRC32 | Size | Purpose |
|------|-------|------|---------|
| (To be determined) | - | - | GB disassembler testing |

---

## 2. ROM Dumping Hardware

### For NES Cartridges

#### Option A: INLretro Programmer-Dumper

1. **Purchase:** https://www.infiniteneslives.com/inlretro.php
   - Price: ~$90 USD
   - Supports: NES, SNES, GB, N64, Sega

2. **Install INLretro CLI:**
   ```powershell
   # Download from GitHub releases
   Invoke-WebRequest -Uri "https://github.com/INLretro/INL-retro-progdump/releases/latest" -OutFile "inlretro.zip"
   Expand-Archive inlretro.zip -DestinationPath "C:\Tools\INLretro"
   ```

3. **Connect hardware:**
   - Insert NES cartridge into INLretro adapter
   - Connect INLretro to PC via USB

4. **Dump ROM:**
   ```powershell
   cd "C:\Tools\INLretro"
   .\inlretro.exe --dump nes "C:\Users\me\source\repos\roms\dragon-warrior-4.nes"
   ```

#### Option B: Retrode 2 (Discontinued - Check eBay)

1. **Purchase:** Search eBay for "Retrode 2"
2. **Install drivers:** Download from https://www.retrode.org/
3. **Plug-and-play:** Cartridge shows as USB drive

#### Option C: Open Source Cartridge Reader

1. **Build or purchase:** https://github.com/sanni/cartreader
2. **Materials:** Arduino Mega + Custom PCB (~$50)
3. **Benefits:** Supports many consoles, open source

### For SNES Cartridges

All of the above options support SNES. INLretro requires SNES adapter ($30 additional).

**Dump SNES ROM:**
```powershell
.\inlretro.exe --dump snes "C:\Users\me\source\repos\roms\ffmq.sfc"
```

---

## 3. Homebrew Alternatives

If you don't have original cartridges, use freely available homebrew for testing.

### NES Homebrew

#### Nebs 'n Debs (Commercial-free Homebrew)
1. **Download:** https://nebsn.itch.io/nebs-n-debs
2. **Save to:** `C:\Users\me\source\repos\roms\nebs-n-debs.nes`
3. **Use for:** NES disassembler testing without copyrighted content

#### Battle Kid (Free Demo)
1. **Download:** https://sivak.itch.io/battle-kid
2. **Save to:** `C:\Users\me\source\repos\roms\battle-kid-demo.nes`

### SNES Homebrew

#### Pong (Free SNES Homebrew)
1. **Download:** https://github.com/Optiroc/SuperFamicom-Homebrew
2. **Build:** `make`
3. **Save to:** `C:\Users\me\source\repos\roms\pong.sfc`

#### Skipp and Friends (Public Domain)
1. **Download:** https://pdroms.de/files/supernintendo-snes-superfamicom-sfc/skipp-and-friends
2. **Save to:** `C:\Users\me\source\repos\roms\skipp-and-friends.sfc`

### Test ROM Collections

#### FCEUX Test ROMs
1. **Download:** Built into FCEUX
2. **Location:** FCEUX installation → `fceux\ROMs\`
3. **Contains:** CPU test ROMs, PPU test ROMs, mapper tests

#### blargg's Test ROMs
1. **Download:** https://github.com/christopherpow/nes-test-roms
2. **Contains:**
   - `cpu_timing_test.nes`
   - `ppu_vbl_nmi.nes`
   - `sprite_hit_tests.nes`
3. **Use for:** Emulator accuracy testing

---

## 4. ROM Verification

### Verify CRC32

Use PowerShell to verify ROM integrity:

```powershell
function Get-CRC32 {
    param([string]$Path)
    
    $crc32 = [System.IO.Hashing.Crc32]::new()
    $bytes = [System.IO.File]::ReadAllBytes($Path)
    $crc32.Append($bytes)
    $hash = $crc32.GetCurrentHash()
    [Array]::Reverse($hash)
    return [BitConverter]::ToString($hash).Replace("-", "").ToLower()
}

# Verify your ROMs
Get-CRC32 "C:\Users\me\source\repos\roms\dragon-warrior-4.nes"
# Expected: 57c13f4d
```

### Verify File Sizes

```powershell
$roms = @{
    "dragon-warrior-4.nes" = 524304  # 512KB + 16 byte header
    "dragon-warrior.nes" = 65552     # 64KB + 16 byte header
    "ffmq.sfc" = 1048576             # 1MB
}

foreach ($rom in $roms.GetEnumerator()) {
    $path = "C:\Users\me\source\repos\roms\$($rom.Key)"
    if (Test-Path $path) {
        $size = (Get-Item $path).Length
        if ($size -eq $rom.Value) {
            Write-Host "✅ $($rom.Key) - Correct size" -ForegroundColor Green
        } else {
            Write-Host "⚠️ $($rom.Key) - Size mismatch: $size (expected $($rom.Value))" -ForegroundColor Yellow
        }
    } else {
        Write-Host "❌ $($rom.Key) - Not found" -ForegroundColor Red
    }
}
```

### Check for Headers

NES ROMs should have iNES headers. Verify:

```powershell
$romPath = "C:\Users\me\source\repos\roms\dragon-warrior-4.nes"
$header = [System.IO.File]::ReadAllBytes($romPath)[0..3]
$signature = [System.Text.Encoding]::ASCII.GetString($header)

if ($signature -eq "NES" + [char]0x1A) {
    Write-Host "✅ Valid iNES header detected" -ForegroundColor Green
} else {
    Write-Host "❌ Missing or invalid iNES header" -ForegroundColor Red
}
```

---

## 5. Directory Setup

### Create ROM Directory

```powershell
# Create centralized ROM directory
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\roms" -Force

# Create subdirectories
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\roms\nes" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\roms\snes" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\roms\gb" -Force
New-Item -ItemType Directory -Path "C:\Users\me\source\repos\roms\homebrew" -Force
```

### Directory Structure

```
C:\Users\me\source\repos\roms\
├── nes/
│   ├── dragon-warrior-4.nes     # Your dumped ROM
│   └── dragon-warrior.nes       # Your dumped ROM
├── snes/
│   ├── ffmq.sfc                 # Your dumped ROM
│   ├── dq3.sfc                  # Your dumped ROM
│   └── dq4.sfc                  # Your dumped ROM
├── gb/
│   └── (future test ROMs)
└── homebrew/
    ├── nebs-n-debs.nes          # Free homebrew
    ├── skipp-and-friends.sfc    # Free homebrew
    └── blargg-tests/            # Test ROMs
        ├── cpu_timing_test.nes
        ├── ppu_vbl_nmi.nes
        └── sprite_hit_tests.nes
```

### Symlinks for Project Directories

Create symlinks so each project can access ROMs:

```powershell
# Dragon Warrior 4
New-Item -ItemType Junction -Path "C:\Users\me\source\repos\dragon-warrior-4-info\roms" `
         -Target "C:\Users\me\source\repos\roms"

# FFMQ
New-Item -ItemType Junction -Path "C:\Users\me\source\repos\ffmq-info\roms" `
         -Target "C:\Users\me\source\repos\roms"

# GameInfo
New-Item -ItemType Junction -Path "C:\Users\me\source\repos\GameInfo\roms" `
         -Target "C:\Users\me\source\repos\roms"
```

### .gitignore

Each project should already ignore ROMs. Verify:

```gitignore
# ROMs - Never commit copyrighted ROMs
*.nes
*.sfc
*.smc
*.gb
*.gbc
*.gba
roms/
```

---

## Verification Checklist

- [ ] Created `C:\Users\me\source\repos\roms\` directory
- [ ] Obtained at least one test ROM (homebrew or dumped)
- [ ] Verified ROM with CRC32 check
- [ ] Verified file size
- [ ] Verified iNES header (for NES ROMs)
- [ ] Created symlinks to project directories
- [ ] Confirmed ROMs are in .gitignore

---

**Previous Document:** [ENVIRONMENT-SETUP.md](ENVIRONMENT-SETUP.md)  
**Next Document:** [TOOL-INSTALLATION.md](TOOL-INSTALLATION.md)
