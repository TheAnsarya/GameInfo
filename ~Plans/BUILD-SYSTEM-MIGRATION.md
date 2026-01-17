# 🔄 Build System Migration Guide

> Migrating all projects to use Poppy + BPS-Patch
> **Version:** 1.0.0
> **Created:** 2026-01-16

---

## 📋 Overview

This document describes the migration process for converting existing disassembly projects from various assemblers (Ophis, ca65, ASAR, etc.) to use **Poppy** as the standard assembler and **BPS-Patch** for binary patching.

---

## 🎯 Goals

1. **Standardize** all projects on Poppy assembler
2. **Standardize** patching on BPS-Patch
3. **Convert** assembly syntax to `.pasm` (Poppy Assembly)
4. **Update** all build scripts to use new toolchain
5. **Remove** old assembler dependencies

---

## 🔧 Toolchain Comparison

### Previous Toolchain (To Remove)

| Tool | Purpose | Replacement |
|------|---------|-------------|
| **Ophis** | 6502 assembler | Poppy |
| **ca65/ld65** | 6502 assembler/linker | Poppy |
| **ASAR** | 65816 assembler | Poppy |
| **RGBDS** | Game Boy assembler | Poppy |
| **xdelta3** | Delta patching | BPS-Patch |
| **Lunar IPS** | IPS patching | BPS-Patch |
| **beat/byuu** | BPS patching | BPS-Patch |

### New Toolchain

| Tool | Purpose | Status |
|------|---------|--------|
| **Poppy** | Multi-system assembler | ✅ Ready |
| **BPS-Patch** | Binary patching | ✅ Ready |

---

## 📁 Standard Project Structure

### Before Migration
```
project/
├── build.ps1              # Custom build script
├── src/
│   ├── main.asm           # Various assembly syntax
│   └── ...
├── tools/
│   ├── ophis/             # Bundled assembler
│   └── xdelta3/           # Bundled patcher
└── roms/
    └── original.nes
```

### After Migration
```
project/
├── build.config.json      # Standard config
├── build.ps1              # Simplified script
├── src/
│   ├── main.pasm          # Poppy assembly
│   └── ...
└── roms/
    └── original.nes
```

---

## 📄 build.config.json Standard

```json
{
	"$schema": "https://gameinfo.darkrepos.com/schemas/build-config.json",
	"project": {
		"name": "Game Name",
		"version": "1.0.0",
		"platform": "nes",
		"description": "Disassembly/hack of Game Name"
	},
	"source": {
		"assembler": "poppy",
		"assemblerPath": null,
		"mainFile": "src/main.pasm",
		"includes": ["src/", "include/"],
		"outputRom": "build/output.nes"
	},
	"rom": {
		"baseRom": "roms/original.nes",
		"baseRomCrc32": "12345678",
		"outputCrc32": null
	},
	"patching": {
		"patcher": "bps-patch",
		"patcherPath": null,
		"patchFile": "patches/hack.bps",
		"createPatch": true
	},
	"build": {
		"clean": false,
		"verify": true,
		"parallel": false
	}
}
```

---

## 🔄 Syntax Conversion Guide

### Ophis to Poppy

| Ophis | Poppy |
|-------|-------|
| `.text` | `.code` or (none) |
| `.data` | `.data` |
| `.org $8000` | `.org $8000` |
| `.word label` | `.word label` |
| `.byte $ff` | `.byte $ff` |
| `.alias name $1234` | `name = $1234` |
| `.advance $8010` | `.org $8010` |
| `.incbin "file"` | `.incbin "file"` |
| `.include "file"` | `.include "file"` |
| `.macro name` | `.macro name` |
| `.invoke name` | `name` (call macro) |
| `* = $8000` | `.org $8000` |
| `.checkpc $ffff` | `.assert * <= $ffff` |

### ca65 to Poppy

| ca65 | Poppy |
|------|-------|
| `.segment "CODE"` | `.code` or `.bank n` |
| `.segment "DATA"` | `.data` |
| `.proc label` | `label:` |
| `.endproc` | (end of scope) |
| `.scope name` | `name:` or `.namespace` |
| `.endscope` | (end of scope) |
| `.res 10` | `.ds 10` or `.fill 10, $00` |
| `.import label` | `.extern label` |
| `.export label` | `.global label` |
| `.zeropage` | (auto-detected) |
| `.local label` | `@label` |
| `.repeat n` | `.rept n` |
| `.endrep` | `.endr` |
| `.if expr` | `.if expr` |
| `.endif` | `.endif` |

### ASAR to Poppy

| ASAR | Poppy |
|------|-------|
| `lorom` | `.lorom` |
| `hirom` | `.hirom` |
| `org $008000` | `.org $008000` |
| `db $ff` | `.byte $ff` |
| `dw $1234` | `.word $1234` |
| `dl $123456` | `.long $123456` |
| `incsrc "file"` | `.include "file"` |
| `incbin "file"` | `.incbin "file"` |
| `!define = $10` | `define = $10` |
| `%macro()` | `.macro macro` |
| `macro()` | `macro` |
| `if cond` | `.if cond` |
| `endif` | `.endif` |
| `rep n` | `.rept n` |
| `endrep` | `.endr` |

### RGBDS to Poppy

| RGBDS | Poppy |
|-------|-------|
| `SECTION "name", ROM0` | `.org $0000` |
| `SECTION "name", ROMX[$4000]` | `.bank n` + `.org $4000` |
| `SECTION "name", WRAM0` | `.org $c000` |
| `SECTION "name", HRAM` | `.org $ff80` |
| `db $ff` | `.byte $ff` |
| `dw $1234` | `.word $1234` |
| `ds 10` | `.ds 10` |
| `INCLUDE "file"` | `.include "file"` |
| `INCBIN "file"` | `.incbin "file"` |
| `DEF name EQU $10` | `name = $10` |
| `MACRO name` | `.macro name` |
| `ENDM` | `.endm` |
| `IF cond` | `.if cond` |
| `ENDC` | `.endif` |
| `REPT n` | `.rept n` |
| `ENDR` | `.endr` |

---

## 📝 build.ps1 Template

```powershell
#!/usr/bin/env pwsh
<#
.SYNOPSIS
	Build script for [Project Name]
.DESCRIPTION
	Assembles the project using Poppy and optionally creates a BPS patch.
#>

param(
	[switch]$Clean,
	[switch]$Verbose,
	[switch]$NoPatch
)

$ErrorActionPreference = "Stop"

# Load configuration
$config = Get-Content "build.config.json" | ConvertFrom-Json

# Paths
$projectRoot = $PSScriptRoot
$buildDir = Join-Path $projectRoot "build"
$srcDir = Join-Path $projectRoot "src"

# Create build directory
if ($Clean -and (Test-Path $buildDir)) {
	Remove-Item $buildDir -Recurse -Force
}
New-Item -ItemType Directory -Path $buildDir -Force | Out-Null

# Find Poppy
$poppy = $config.source.assemblerPath
if (-not $poppy) {
	$poppy = Get-Command "poppy" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path
}
if (-not $poppy) {
	$poppy = Join-Path $env:USERPROFILE ".dotnet\tools\poppy.exe"
}
if (-not (Test-Path $poppy)) {
	Write-Error "Poppy assembler not found. Install with: dotnet tool install -g poppy"
}

# Assemble
$mainFile = Join-Path $projectRoot $config.source.mainFile
$outputRom = Join-Path $projectRoot $config.source.outputRom

Write-Host "🌸 Assembling with Poppy..." -ForegroundColor Cyan
& $poppy assemble $mainFile --output $outputRom --platform $config.project.platform

if ($LASTEXITCODE -ne 0) {
	Write-Error "Assembly failed!"
}

Write-Host "✅ Assembly successful: $outputRom" -ForegroundColor Green

# Verify
if ($config.build.verify -and $config.rom.outputCrc32) {
	$hash = (Get-FileHash $outputRom -Algorithm SHA256).Hash.Substring(0, 8)
	if ($hash -ne $config.rom.outputCrc32) {
		Write-Warning "CRC32 mismatch! Expected: $($config.rom.outputCrc32), Got: $hash"
	}
}

# Create patch
if (-not $NoPatch -and $config.patching.createPatch) {
	$baseRom = Join-Path $projectRoot $config.rom.baseRom
	$patchFile = Join-Path $projectRoot $config.patching.patchFile
	
	# Find BPS-Patch
	$bpsPatch = $config.patching.patcherPath
	if (-not $bpsPatch) {
		$bpsPatch = Get-Command "bps-patch" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path
	}
	if (-not $bpsPatch) {
		$bpsPatch = Join-Path $env:USERPROFILE ".dotnet\tools\bps-patch.exe"
	}
	
	if (Test-Path $bpsPatch) {
		Write-Host "📦 Creating BPS patch..." -ForegroundColor Cyan
		& $bpsPatch encode $baseRom $outputRom $patchFile
		Write-Host "✅ Patch created: $patchFile" -ForegroundColor Green
	}
}

Write-Host "`n🎉 Build complete!" -ForegroundColor Green
```

---

## 🚀 Migration Steps

### Step 1: Update build.config.json
1. Create/update `build.config.json` with new schema
2. Set `assembler: "poppy"`
3. Set `patcher: "bps-patch"`

### Step 2: Convert Assembly Files
1. Rename `.asm` to `.pasm`
2. Apply syntax conversion rules
3. Update include paths

### Step 3: Update Build Script
1. Replace with standard `build.ps1` template
2. Remove old assembler calls
3. Add Poppy and BPS-Patch calls

### Step 4: Remove Old Dependencies
1. Delete bundled assemblers
2. Remove old tool folders
3. Update `.gitignore`

### Step 5: Verify Build
1. Run `build.ps1`
2. Compare output ROM to original
3. Run verification tools

---

## 📊 Project-Specific Migration Notes

### dragon-warrior-4-info
- **Current:** Ophis
- **Files:** 50+ .asm files
- **Complexity:** High (multiple banks, complex macros)
- **Estimated Time:** 2 weeks

### dragon-warrior-info
- **Current:** Ophis
- **Files:** 30+ .asm files
- **Complexity:** Medium
- **Estimated Time:** 1 week

### ffmq-info
- **Current:** ASAR
- **Files:** 100+ .asm files
- **Complexity:** High (65816, LoROM)
- **Estimated Time:** 3 weeks

### dq3r-info
- **Current:** ASAR
- **Files:** 80+ .asm files
- **Complexity:** High (65816, HiROM)
- **Estimated Time:** 2 weeks

### dq4r-info
- **Current:** ASAR
- **Files:** 60+ .asm files
- **Complexity:** High (65816, HiROM)
- **Estimated Time:** 2 weeks

---

## ✅ Migration Checklist

- [ ] Create/update `build.config.json`
- [ ] Convert all `.asm` files to `.pasm`
- [ ] Update all include statements
- [ ] Convert macros to Poppy syntax
- [ ] Convert constants/equates
- [ ] Update build script
- [ ] Remove old assembler dependencies
- [ ] Test assembly produces correct ROM
- [ ] Test BPS patch creation
- [ ] Update documentation
- [ ] Commit and push changes

---

*Last Updated: 2026-01-16*
