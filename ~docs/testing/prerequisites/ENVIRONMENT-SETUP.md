# 🖥️ Environment Setup - Repository Configuration

> **Last Updated:** 2026-01-19 19:28 UTC  
> **Time Required:** 30-45 minutes

This document provides step-by-step instructions to clone, build, and configure all repositories.

---

## Table of Contents

1. [Directory Structure](#1-directory-structure)
2. [Clone All Repositories](#2-clone-all-repositories)
3. [Build Each Project](#3-build-each-project)
4. [Configure Python Environments](#4-configure-python-environments)
5. [Verification](#5-verification)

---

## 1. Directory Structure

### Create Base Folder

1. Open PowerShell as Administrator
2. Create the source directory:
   ```powershell
   New-Item -ItemType Directory -Path "C:\Users\$env:USERNAME\source\repos" -Force
   cd "C:\Users\$env:USERNAME\source\repos"
   ```

### Expected Final Structure
```
C:\Users\me\source\repos\
├── GameInfo/           # Main toolkit hub
├── pansy/              # 🌼 Metadata format
├── peony/              # 🌺 Disassembler
├── poppy/              # 🌷 Assembler
├── Mesen2/             # 🎮 Emulator fork
├── bps-patch/          # 📦 Patching library
├── dragon-warrior-4-info/  # 🐉 DW4 NES
├── dragon-warrior-info/    # 🐉 DW1 NES
├── ffmq-info/          # ⚔️ FFMQ SNES
├── dq3r-info/          # 🏰 DQ3 SNES
├── dq4r-info/          # 🏰 DQ4 SNES
├── logsmall/           # 📊 Libraries
└── DiztinGUIsh/        # 🔬 SNES Disassembler
```

---

## 2. Clone All Repositories

### Step-by-Step Clone Instructions

Open PowerShell and run each command:

#### 2.1 Clone GameInfo
```powershell
cd "C:\Users\$env:USERNAME\source\repos"
git clone https://github.com/TheAnsarya/GameInfo.git
```

**Expected output:**
```
Cloning into 'GameInfo'...
remote: Enumerating objects: xxx, done.
...
```

#### 2.2 Clone Pansy
```powershell
git clone https://github.com/TheAnsarya/pansy.git
```

#### 2.3 Clone Peony
```powershell
git clone https://github.com/TheAnsarya/peony.git
```

#### 2.4 Clone Poppy
```powershell
git clone https://github.com/TheAnsarya/poppy.git
```

#### 2.5 Clone Mesen2 Fork
```powershell
git clone https://github.com/TheAnsarya/Mesen2.git
```

**After cloning, checkout pansy-export branch:**
```powershell
cd Mesen2
git checkout pansy-export
cd ..
```

#### 2.6 Clone bps-patch
```powershell
git clone https://github.com/TheAnsarya/bps-patch.git
```

#### 2.7 Clone dragon-warrior-4-info
```powershell
git clone https://github.com/TheAnsarya/dragon-warrior-4-info.git
```

#### 2.8 Clone dragon-warrior-info
```powershell
git clone https://github.com/nmikstas/dragon-warrior-disassembly.git dragon-warrior-info
```

#### 2.9 Clone ffmq-info
```powershell
git clone https://github.com/TheAnsarya/ffmq-info.git
```

#### 2.10 Clone dq3r-info
```powershell
git clone https://github.com/TheAnsarya/dq3r-info.git
```

#### 2.11 Clone dq4r-info
```powershell
git clone https://github.com/TheAnsarya/dq4r-info.git
```

#### 2.12 Clone logsmall
```powershell
git clone https://github.com/TheAnsarya/logsmall.git
```

#### 2.13 Clone DiztinGUIsh
```powershell
git clone https://github.com/DizTools/DiztinGUIsh.git
```

### Bulk Clone Script

Save this as `clone-all.ps1` and run it:

```powershell
# clone-all.ps1 - Clone all repositories

$repos = @(
    @{ Name = "GameInfo"; Url = "https://github.com/TheAnsarya/GameInfo.git" },
    @{ Name = "pansy"; Url = "https://github.com/TheAnsarya/pansy.git" },
    @{ Name = "peony"; Url = "https://github.com/TheAnsarya/peony.git" },
    @{ Name = "poppy"; Url = "https://github.com/TheAnsarya/poppy.git" },
    @{ Name = "Mesen2"; Url = "https://github.com/TheAnsarya/Mesen2.git"; Branch = "pansy-export" },
    @{ Name = "bps-patch"; Url = "https://github.com/TheAnsarya/bps-patch.git" },
    @{ Name = "dragon-warrior-4-info"; Url = "https://github.com/TheAnsarya/dragon-warrior-4-info.git" },
    @{ Name = "dragon-warrior-info"; Url = "https://github.com/nmikstas/dragon-warrior-disassembly.git" },
    @{ Name = "ffmq-info"; Url = "https://github.com/TheAnsarya/ffmq-info.git" },
    @{ Name = "dq3r-info"; Url = "https://github.com/TheAnsarya/dq3r-info.git" },
    @{ Name = "dq4r-info"; Url = "https://github.com/TheAnsarya/dq4r-info.git" },
    @{ Name = "logsmall"; Url = "https://github.com/TheAnsarya/logsmall.git" },
    @{ Name = "DiztinGUIsh"; Url = "https://github.com/DizTools/DiztinGUIsh.git" }
)

$baseDir = "C:\Users\$env:USERNAME\source\repos"
Set-Location $baseDir

foreach ($repo in $repos) {
    Write-Host "`n📦 Cloning $($repo.Name)..." -ForegroundColor Cyan
    
    if (Test-Path $repo.Name) {
        Write-Host "  ⏭️ Already exists, skipping" -ForegroundColor Yellow
        continue
    }
    
    git clone $repo.Url $repo.Name
    
    if ($repo.Branch) {
        Set-Location $repo.Name
        git checkout $repo.Branch
        Set-Location ..
    }
    
    Write-Host "  ✅ Done" -ForegroundColor Green
}

Write-Host "`n✅ All repositories cloned!" -ForegroundColor Green
```

---

## 3. Build Each Project

### 3.1 Build Pansy

```powershell
cd "C:\Users\$env:USERNAME\source\repos\pansy"
dotnet build Pansy.sln
```

**Expected output:**
```
  Pansy.Core -> ...\bin\Debug\net10.0\Pansy.Core.dll
  Pansy.Cli -> ...\bin\Debug\net10.0\Pansy.Cli.dll
  Pansy.UI -> ...\bin\Debug\net10.0\Pansy.UI.dll
  
Build succeeded.
    0 Warning(s)
    0 Error(s)
```

**Verify:**
```powershell
dotnet run --project src/Pansy.Cli -- --help
```

### 3.2 Build Peony

```powershell
cd "C:\Users\$env:USERNAME\source\repos\peony"
dotnet build Peony.sln
```

**Verify:**
```powershell
dotnet run --project src/Peony.Cli -- --help
```

### 3.3 Build Poppy

```powershell
cd "C:\Users\$env:USERNAME\source\repos\poppy"
dotnet build Poppy.sln
```

**Verify:**
```powershell
dotnet run --project src/Poppy.Cli -- --help
```

### 3.4 Build Mesen2

```powershell
cd "C:\Users\$env:USERNAME\source\repos\Mesen2"
dotnet build Mesen.sln
```

**Expected:** Build may take 2-5 minutes

**Verify:**
```powershell
# Check if executable exists
Test-Path ".\bin\x64\Debug\Mesen.exe"
# Expected: True
```

### 3.5 Build bps-patch

```powershell
cd "C:\Users\$env:USERNAME\source\repos\bps-patch"
dotnet build bps-patch.sln
```

**Verify:**
```powershell
dotnet run -- --help
```

### 3.6 Build GameInfo Tools

```powershell
cd "C:\Users\$env:USERNAME\source\repos\GameInfo"
dotnet build GameInfoTools.sln
```

**Verify:**
```powershell
dotnet run --project src/GameInfoTools.Cli -- --help
```

### 3.7 Build logsmall

```powershell
cd "C:\Users\$env:USERNAME\source\repos\logsmall"
dotnet build logsmall.sln
```

### Bulk Build Script

Save as `build-all.ps1`:

```powershell
# build-all.ps1 - Build all .NET projects

$projects = @(
    @{ Name = "Pansy"; Path = "pansy"; Sln = "Pansy.sln" },
    @{ Name = "Peony"; Path = "peony"; Sln = "Peony.sln" },
    @{ Name = "Poppy"; Path = "poppy"; Sln = "Poppy.sln" },
    @{ Name = "Mesen2"; Path = "Mesen2"; Sln = "Mesen.sln" },
    @{ Name = "bps-patch"; Path = "bps-patch"; Sln = "bps-patch.sln" },
    @{ Name = "GameInfo"; Path = "GameInfo"; Sln = "GameInfoTools.sln" },
    @{ Name = "logsmall"; Path = "logsmall"; Sln = "logsmall.sln" }
)

$baseDir = "C:\Users\$env:USERNAME\source\repos"
$errors = 0

foreach ($proj in $projects) {
    Write-Host "`n🔨 Building $($proj.Name)..." -ForegroundColor Cyan
    
    $fullPath = Join-Path $baseDir $proj.Path
    if (-not (Test-Path $fullPath)) {
        Write-Host "  ❌ Directory not found: $fullPath" -ForegroundColor Red
        $errors++
        continue
    }
    
    Set-Location $fullPath
    $result = dotnet build $proj.Sln --nologo -v:q 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ Build succeeded" -ForegroundColor Green
    } else {
        Write-Host "  ❌ Build failed" -ForegroundColor Red
        Write-Host $result
        $errors++
    }
}

Set-Location $baseDir
Write-Host "`n==========================================" -ForegroundColor Cyan
if ($errors -eq 0) {
    Write-Host "✅ All projects built successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ $errors project(s) failed to build" -ForegroundColor Red
}
```

---

## 4. Configure Python Environments

### 4.1 Dragon Warrior IV Tools

```powershell
cd "C:\Users\$env:USERNAME\source\repos\dragon-warrior-4-info"
python -m venv .venv
.\.venv\Scripts\Activate
pip install -r requirements.txt
deactivate
```

### 4.2 FFMQ Tools

```powershell
cd "C:\Users\$env:USERNAME\source\repos\ffmq-info"
python -m venv .venv
.\.venv\Scripts\Activate
pip install -r requirements.txt
deactivate
```

### 4.3 GameInfo Python Tools

```powershell
cd "C:\Users\$env:USERNAME\source\repos\GameInfo"
python -m venv .venv
.\.venv\Scripts\Activate
pip install -r requirements.txt
deactivate
```

---

## 5. Verification

### Run Verification Script

Save as `verify-environment.ps1`:

```powershell
# verify-environment.ps1 - Verify all repositories

$baseDir = "C:\Users\$env:USERNAME\source\repos"

$checks = @(
    @{ Name = "Pansy"; Path = "pansy"; Check = "Pansy.sln" },
    @{ Name = "Peony"; Path = "peony"; Check = "Peony.sln" },
    @{ Name = "Poppy"; Path = "poppy"; Check = "Poppy.sln" },
    @{ Name = "Mesen2"; Path = "Mesen2"; Check = "Mesen.sln" },
    @{ Name = "bps-patch"; Path = "bps-patch"; Check = "bps-patch.sln" },
    @{ Name = "GameInfo"; Path = "GameInfo"; Check = "GameInfoTools.sln" },
    @{ Name = "dragon-warrior-4-info"; Path = "dragon-warrior-4-info"; Check = "README.md" },
    @{ Name = "dragon-warrior-info"; Path = "dragon-warrior-info"; Check = "README.md" },
    @{ Name = "ffmq-info"; Path = "ffmq-info"; Check = "README.md" },
    @{ Name = "dq3r-info"; Path = "dq3r-info"; Check = "README.md" },
    @{ Name = "dq4r-info"; Path = "dq4r-info"; Check = "README.md" },
    @{ Name = "logsmall"; Path = "logsmall"; Check = "logsmall.sln" },
    @{ Name = "DiztinGUIsh"; Path = "DiztinGUIsh"; Check = "DiztinGUIsh.sln" }
)

Write-Host "🔍 Verifying Environment Setup" -ForegroundColor Cyan
Write-Host "===============================" -ForegroundColor Cyan

$success = 0
$failed = 0

foreach ($check in $checks) {
    $fullPath = Join-Path $baseDir $check.Path
    $checkFile = Join-Path $fullPath $check.Check
    
    if (Test-Path $checkFile) {
        Write-Host "  ✅ $($check.Name)" -ForegroundColor Green
        $success++
    } else {
        Write-Host "  ❌ $($check.Name) - Missing $($check.Check)" -ForegroundColor Red
        $failed++
    }
}

Write-Host "`n===============================" -ForegroundColor Cyan
Write-Host "Results: $success passed, $failed failed" -ForegroundColor $(if ($failed -eq 0) { "Green" } else { "Yellow" })
```

### Expected Output
```
🔍 Verifying Environment Setup
===============================
  ✅ Pansy
  ✅ Peony
  ✅ Poppy
  ✅ Mesen2
  ✅ bps-patch
  ✅ GameInfo
  ✅ dragon-warrior-4-info
  ✅ dragon-warrior-info
  ✅ ffmq-info
  ✅ dq3r-info
  ✅ dq4r-info
  ✅ logsmall
  ✅ DiztinGUIsh

===============================
Results: 13 passed, 0 failed
```

---

**Next Document:** [TEST-ROMS.md](TEST-ROMS.md)
