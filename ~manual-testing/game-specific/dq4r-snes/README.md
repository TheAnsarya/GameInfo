# DQ4r SNES - Testing Documentation

Dragon Quest IV Remake (SNES) testing and debugging documentation.

## 📋 Testing Documents

| Document | Purpose | Test Cases |
|----------|---------|------------|
| [System Testing](dq4r-system-testing.md) | Save, Cutscene, Event, Battle, Chapter | 17 TC + 4 RT |
| [Monster Editor](monster-editor-testing.md) | ~200 monsters, chapter scaling, AI | 8 TC + 3 RT |
| [Item Editor](item-editor-testing.md) | ~250 items, 8-char equip flags | 8 TC + 2 RT |
| [Spell Editor](spell-editor-testing.md) | ~80 spells, learning tables | 8 TC + 3 RT |

## 📋 Quick Reference

### ROM Info
- **Platform**: Super Famicom (SNES)
- **Region**: Japan-only
- **Size**: 2MB (16Mbit)
- **Mapper**: HiROM
- **Engine**: DQ3r SNES engine modified

### Key ROM Regions

| Address (PC) | Address (SNES) | Contents |
|--------------|----------------|----------|
| $000000 | $C00000 | Code/Data Bank 0 |
| $100000 | $D00000 | Monster Graphics (compressed) |
| $180000 | $E00000 | Map Data |
| $1C0000 | $E40000 | Item Data |
| $1E0000 | $E60000 | Monster Stats |
| $200000 | $E80000 | AI/Event Scripts |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $7E0000-$7E1FFF | 8KB | Work RAM |
| $7E2000 | $100 | Battle state |
| $7E2100 | $500 | Party data (8 chars) |
| $7E2600 | $200 | Inventory |
| $7E2800 | $100 | Wagon data |

## 🎮 DQ4r-Specific Features

### Chapter System
| Chapter | Playable Characters | Focus |
|---------|---------------------|-------|
| 1 | Ragnar | Prologue |
| 2 | Alena, Kiryl, Borya | Combat |
| 3 | Torneko | Merchant |
| 4 | Meena, Maya | Story |
| 5 | Hero + All | Main game |

### Wagon System
- Party holds 4 active + 4 reserve characters
- Reserve characters gain partial EXP
- Items can be stored in wagon

### Monster Scaling
- Monsters have per-chapter stat multipliers
- Same monster ID, different stats per chapter
- Chapter 5 uses base (1.0x) stats

## 📊 Data Structures

### Monster Data
- ~200 monsters total
- 32 bytes per entry
- Chapter scaling flags

### Item Data
- ~250 items total
- 16 bytes per entry
- 8-character equip flags

### Spell Data
- ~80 spells total
- 12 bytes per entry
- Character learning tables

## 🔧 Tools

- **DQ4rLib** (C#): DQ4r data tools (in development)
- **DQ3Lib**: Shared engine components
- **Mesen-S**: SNES debugging
- **bsnes-plus**: Advanced debugging
