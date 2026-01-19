# 🔧 Prerequisites - Required Software Installation

> **Last Updated:** 2026-01-19 19:25 UTC  
> **Time Required:** 1-2 hours for complete setup

This document provides step-by-step installation instructions for all required software.

---

## Table of Contents

1. [.NET SDK 10](#1-net-sdk-10)
2. [Visual Studio Code](#2-visual-studio-code)
3. [Git](#3-git)
4. [Python 3.11+](#4-python-311)
5. [Emulators](#5-emulators)
6. [Hex Editors](#6-hex-editors)
7. [Comparison Tools](#7-comparison-tools)
8. [Verification Checklist](#8-verification-checklist)

---

## 1. .NET SDK 10

### Download
1. Open browser
2. Navigate to: https://dotnet.microsoft.com/download/dotnet/10.0
3. Click **"Download .NET SDK x64"** (Windows)
4. Save `dotnet-sdk-10.0.xxx-win-x64.exe`

### Install
1. Double-click downloaded installer
2. Click **"Install"** on the welcome screen
3. Accept UAC prompt if shown
4. Wait for installation (2-3 minutes)
5. Click **"Close"** when complete

### Verify
1. Open PowerShell (Win+X → Windows Terminal)
2. Run:
   ```powershell
   dotnet --version
   ```
3. **Expected output:** `10.0.xxx` (e.g., `10.0.100`)

### Troubleshooting
- **"dotnet not recognized"**: Close and reopen terminal
- **Wrong version**: Uninstall old versions from Control Panel → Programs

---

## 2. Visual Studio Code

### Download
1. Open browser
2. Navigate to: https://code.visualstudio.com/
3. Click **"Download for Windows"**
4. Save `VSCodeUserSetup-x64-x.xx.x.exe`

### Install
1. Double-click downloaded installer
2. Accept license agreement → **Next**
3. Choose install location → **Next**
4. Select additional tasks:
   - ✅ Add "Open with Code" to context menu
   - ✅ Add to PATH
5. Click **Install**
6. Click **Finish**

### Required Extensions
1. Open VS Code
2. Press `Ctrl+Shift+X` to open Extensions
3. Search and install each:
   - **C# Dev Kit** (Microsoft)
   - **Python** (Microsoft)
   - **PowerShell** (Microsoft)
   - **Hex Editor** (Microsoft)
   - **GitLens** (GitKraken)

### Install Extension Steps (Each)
1. Type extension name in search box
2. Click extension in results
3. Click **Install** button
4. Wait for installation
5. Repeat for each extension

### Verify
1. Press `Ctrl+Shift+P`
2. Type "C#" - should see C# commands
3. Type "Python" - should see Python commands

---

## 3. Git

### Download
1. Open browser
2. Navigate to: https://git-scm.com/download/win
3. Download starts automatically
4. Save `Git-2.xx.x-64-bit.exe`

### Install
1. Double-click downloaded installer
2. Click **Next** through information screen
3. Select components (defaults are fine) → **Next**
4. Choose default editor:
   - Select **"Use Visual Studio Code as Git's default editor"**
5. Adjusting PATH:
   - Select **"Git from the command line and also from 3rd-party software"**
6. HTTPS transport:
   - Select **"Use the OpenSSL library"**
7. Line ending conversions:
   - Select **"Checkout Windows-style, commit Unix-style"**
8. Terminal emulator:
   - Select **"Use Windows' default console window"**
9. Default behavior of `git pull`:
   - Select **"Default (fast-forward or merge)"**
10. Credential helper:
    - Select **"Git Credential Manager"**
11. Extra options:
    - ✅ Enable file system caching
12. Click **Install**
13. Click **Finish**

### Configure
1. Open PowerShell
2. Set your name:
   ```powershell
   git config --global user.name "Your Name"
   ```
3. Set your email:
   ```powershell
   git config --global user.email "your.email@example.com"
   ```

### Verify
```powershell
git --version
```
**Expected:** `git version 2.xx.x.windows.x`

---

## 4. Python 3.11+

### Download
1. Open browser
2. Navigate to: https://www.python.org/downloads/
3. Click **"Download Python 3.11.x"** (or newer)
4. Save `python-3.11.x-amd64.exe`

### Install
1. Double-click downloaded installer
2. **IMPORTANT:** Check ✅ **"Add python.exe to PATH"**
3. Click **"Customize installation"**
4. Optional Features - ensure checked:
   - ✅ pip
   - ✅ py launcher
5. Click **Next**
6. Advanced Options:
   - ✅ Install for all users
   - ✅ Add Python to environment variables
7. Click **Install**
8. Click **Close**

### Verify
```powershell
python --version
```
**Expected:** `Python 3.11.x`

```powershell
pip --version
```
**Expected:** `pip 23.x.x from ...`

---

## 5. Emulators

### 5.1 Mesen2 (Multi-system)

#### Download
1. Navigate to: https://www.mesen.ca/
2. Click **"Windows"** under Downloads
3. Save `Mesen.zip`

#### Install
1. Create folder: `C:\Tools\Mesen2`
2. Extract `Mesen.zip` contents to that folder
3. Right-click `Mesen.exe` → **Create shortcut**
4. Move shortcut to Desktop (optional)

#### Verify
1. Double-click `Mesen.exe`
2. Mesen2 window should open
3. Close Mesen2

---

### 5.2 FCEUX (NES - Alternative)

#### Download
1. Navigate to: http://fceux.com/web/download.html
2. Click **"fceux-2.6.x-win64.zip"**
3. Save the zip file

#### Install
1. Create folder: `C:\Tools\FCEUX`
2. Extract zip contents to that folder

#### Verify
1. Double-click `fceux.exe`
2. FCEUX window should open
3. Close FCEUX

---

### 5.3 bsnes (SNES - Alternative)

#### Download
1. Navigate to: https://github.com/bsnes-emu/bsnes/releases
2. Download latest `bsnes-windows.zip`
3. Save the zip file

#### Install
1. Create folder: `C:\Tools\bsnes`
2. Extract zip contents to that folder

#### Verify
1. Double-click `bsnes.exe`
2. bsnes window should open
3. Close bsnes

---

## 6. Hex Editors

### 6.1 HxD (Recommended)

#### Download
1. Navigate to: https://mh-nexus.de/en/hxd/
2. Click **"HxD Hex Editor (2.5.0.0)"**
3. Click the download link
4. Save `HxDSetup.exe`

#### Install
1. Double-click `HxDSetup.exe`
2. Select language → **OK**
3. Accept license → **Next**
4. Choose install location → **Next**
5. Select Start Menu folder → **Next**
6. Additional tasks:
   - ✅ Create desktop icon
7. Click **Install**
8. Click **Finish**

#### Verify
1. Double-click HxD icon on Desktop
2. HxD opens
3. File → Open → select any file
4. Hex data displays correctly
5. Close HxD

---

## 7. Comparison Tools

### 7.1 Beyond Compare (Recommended)

#### Download
1. Navigate to: https://www.scootersoftware.com/download
2. Click **"Download"** for Windows
3. Save `BCompare-x.x.x.xxxxx.exe`

#### Install
1. Double-click downloaded installer
2. Accept license → **Next**
3. Choose install location → **Next**
4. Select components (defaults fine) → **Next**
5. Click **Install**
6. Click **Finish**

**Note:** Beyond Compare is paid software with a free trial. For free alternative, use WinMerge.

### 7.2 WinMerge (Free Alternative)

#### Download
1. Navigate to: https://winmerge.org/downloads/
2. Click **"WinMerge-2.16.xx-x64-Setup.exe"**
3. Save the installer

#### Install
1. Double-click downloaded installer
2. Accept license → **Next**
3. Choose install location → **Next**
4. Select components → **Next**
5. Additional tasks:
   - ✅ Add WinMerge to system PATH
6. Click **Install**
7. Click **Finish**

#### Verify
1. Open WinMerge from Start Menu
2. File → Open
3. Select two files to compare
4. Differences highlighted
5. Close WinMerge

---

## 8. Verification Checklist

Run these commands in PowerShell to verify all installations:

```powershell
# Check .NET SDK
dotnet --version
# Expected: 10.0.xxx

# Check Git
git --version
# Expected: git version 2.xx.x

# Check Python
python --version
# Expected: Python 3.11.x

# Check pip
pip --version
# Expected: pip 23.x.x

# Check VS Code
code --version
# Expected: 1.xx.x (version number)

# List all installed tools
Write-Host "`n✅ All tools verified!" -ForegroundColor Green
```

### Quick Verification Script

Create and run this script to verify everything:

```powershell
# Save as: C:\Tools\verify-tools.ps1

Write-Host "🔧 Verifying Manual Testing Prerequisites" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$errors = 0

# .NET SDK
Write-Host "`n[1/5] Checking .NET SDK..." -ForegroundColor Yellow
$dotnetVersion = dotnet --version 2>&1
if ($dotnetVersion -match "10\.") {
    Write-Host "  ✅ .NET SDK: $dotnetVersion" -ForegroundColor Green
} else {
    Write-Host "  ❌ .NET SDK 10 not found" -ForegroundColor Red
    $errors++
}

# Git
Write-Host "`n[2/5] Checking Git..." -ForegroundColor Yellow
$gitVersion = git --version 2>&1
if ($gitVersion -match "git version") {
    Write-Host "  ✅ $gitVersion" -ForegroundColor Green
} else {
    Write-Host "  ❌ Git not found" -ForegroundColor Red
    $errors++
}

# Python
Write-Host "`n[3/5] Checking Python..." -ForegroundColor Yellow
$pythonVersion = python --version 2>&1
if ($pythonVersion -match "Python 3\.1[1-9]") {
    Write-Host "  ✅ $pythonVersion" -ForegroundColor Green
} else {
    Write-Host "  ❌ Python 3.11+ not found" -ForegroundColor Red
    $errors++
}

# VS Code
Write-Host "`n[4/5] Checking VS Code..." -ForegroundColor Yellow
$codeVersion = code --version 2>&1 | Select-Object -First 1
if ($codeVersion) {
    Write-Host "  ✅ VS Code: $codeVersion" -ForegroundColor Green
} else {
    Write-Host "  ❌ VS Code not found" -ForegroundColor Red
    $errors++
}

# Emulators
Write-Host "`n[5/5] Checking Emulators..." -ForegroundColor Yellow
if (Test-Path "C:\Tools\Mesen2\Mesen.exe") {
    Write-Host "  ✅ Mesen2 found" -ForegroundColor Green
} else {
    Write-Host "  ⚠️ Mesen2 not found at C:\Tools\Mesen2" -ForegroundColor Yellow
}

# Summary
Write-Host "`n==========================================" -ForegroundColor Cyan
if ($errors -eq 0) {
    Write-Host "✅ All prerequisites verified!" -ForegroundColor Green
} else {
    Write-Host "❌ $errors prerequisite(s) missing" -ForegroundColor Red
}
```

---

**Next Document:** [ENVIRONMENT-SETUP.md](ENVIRONMENT-SETUP.md)
