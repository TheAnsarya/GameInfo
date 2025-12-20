# Referenced Files

This document catalogs all files stored in `Files/` subdirectories within game folders.
These files are typically text tables (`.tbl`), debug labels (`.mlb`), and other supplementary data files.

## Summary

| Platform | Game | File Count |
|----------|------|------------|
| NES | Dragon Warrior | 1 |
| NES | Mappy-Land | 1 |
| NES | Yoshi's Cookie | 1 |
| SNES | Chrono Trigger | 1 |
| SNES | Dragon Quest I & II | 1 |
| SNES | Dragon Quest III | 4 |
| SNES | Final Fantasy IV | 3 |
| SNES | Final Fantasy Mystic Quest | 9 (+1067 in Diz) |

---

## NES

### Dragon Warrior

**Location:** `Wiki/NES/Dragon_Warrior/Files/`

| File | Description |
|------|-------------|
| Dragon Warrior (NES).tbl | Text table for Dragon Warrior |

### Mappy-Land

**Location:** `Wiki/NES/Mappy-Land/Files/`

| File | Description |
|------|-------------|
| Mappy-Land (NES).tbl | Text table for Mappy-Land |

### Yoshi's Cookie

**Location:** `Wiki/NES/Yoshis_Cookie/Files/`

| File | Description |
|------|-------------|
| Yoshi's Cookie (NES) (EN).tbl | English text table for Yoshi's Cookie |

---

## SNES

### Chrono Trigger

**Location:** `Wiki/SNES/Chrono_Trigger/Files/`

| File | Description |
|------|-------------|
| Chrono Trigger (SNES).tbl | Text table for Chrono Trigger |

### Dragon Quest I & II

**Location:** `Wiki/SNES/Dragon_Quest_I_II/Files/`

| File | Description |
|------|-------------|
| Dragon Quest I & II (SNES) (JP, DQ1).tbl | Japanese text table for Dragon Quest I |

### Dragon Quest III

**Location:** `Wiki/SNES/Dragon_Quest_III/Files/`

| File | Description |
|------|-------------|
| Dragon Quest III (SNES) (EN) - simple.tbl | Simple English text table |
| Dragon Quest III (SNES) (JP) - dialog.tbl | Japanese dialog text table |
| Dragon Quest III (SNES) (JP) - simple.tbl | Simple Japanese text table |
| DQIII_starting_personality.png | Starting personality reference image |

### Final Fantasy IV

**Location:** `Wiki/SNES/Final_Fantasy_IV/Files/`

| File | Description |
|------|-------------|
| Final Fantasy IV (SNES) (EN) - dte.tbl | English DTE (Dual Tile Encoding) text table |
| Final Fantasy IV (SNES) (EN) - simple.tbl | Simple English text table |
| Final Fantasy IV (SNES) (JP) - simple.tbl | Simple Japanese text table |

### Final Fantasy Mystic Quest

**Location:** `Wiki/SNES/Final_Fantasy_Mystic_Quest/Files/`

| File | Description |
|------|-------------|
| Final Fantasy - Mystic Quest (U) (V1.1).csv | Debug data CSV |
| Final Fantasy - Mystic Quest (U) (V1.1).mlb | MESEN debug labels |
| Final Fantasy Mystic Quest (SNES) - Complex.tbl | Complex text table (US) |
| Final Fantasy Mystic Quest (SNES) - Simple.tbl | Simple text table (US) |
| Final Fantasy USA - Mystic Quest (J) (SNES) - Text Table - Simple.tbl | Simple text table (JP) |
| Mystic Quest Legend (F) (SNES) - Text Table - Complex.tbl | Complex text table (French) |
| Mystic Quest Legend (F) (SNES) - Text Table - Simple.tbl | Simple text table (French) |
| Mystic Quest Legend (G) (SNES) - Text Table - Complex.tbl | Complex text table (German) |
| Mystic Quest Legend (G) (SNES) - Text Table - Simple.tbl | Simple text table (German) |

#### Diz Disassembly Files

**Location:** `Wiki/SNES/Final_Fantasy_Mystic_Quest/Files/Diz/`

The `Diz/` subdirectory contains disassembly save states and exports from DiztinGUIsh:

- **ffmq/** - Individual save states from various game progression points (1000+ files)
  - Organized by date and location (e.g., "2025-06-23 02 before bone dungeon")
  - Each contains `.diz` project files, `.Finished#` files, and export directories
- **ffmq - combined/** - Merged/combined disassembly exports
  - Bank assembly files (`bank_00.asm` through `bank_0F.asm`)
  - Symbol files (`bsnes.sym`, `labels.asm`, `defines.asm`)
  - Label exports (`all-labels.csv`, `all-labels.txt`)

---

## File Types

| Extension | Description |
|-----------|-------------|
| `.tbl` | Text table file - maps hex values to characters |
| `.mlb` | MESEN debug label file |
| `.csv` | Comma-separated values export |
| `.diz` | DiztinGUIsh project file |
| `.asm` | Assembly source file |
| `.sym` | Symbol file for debuggers |
