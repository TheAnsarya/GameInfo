# Data Tools - Manual Testing Guide

> **Parent Guide:** [CLI Tools](README.md)  
> **GitHub Issue:** [#33](https://github.com/TheAnsarya/GameInfo/issues/33)

## 📋 Overview

Data tools handle game data import/export:
- **export** - Export game data to JSON for editing
- **import** - Import modified JSON back into ROM

## 🎯 Prerequisites

- [ ] GameInfo CLI built

- [ ] Sample ROM with known data structures

- [ ] JSON editor (VS Code recommended)

## ✅ Test Checklist

### `git data export` - Export to JSON

- [ ] TEST-DATA-001: Export monster data

- [ ] TEST-DATA-002: Export item data

- [ ] TEST-DATA-003: Export spell data

- [ ] TEST-DATA-004: Handle unknown data type

### `git data import` - Import from JSON

- [ ] TEST-DATA-005: Import modified monster data

- [ ] TEST-DATA-006: Import modified item data

- [ ] TEST-DATA-007: Validate JSON on import

- [ ] TEST-DATA-008: Handle invalid JSON

---

## 🧪 Detailed Test Instructions

### TEST-DATA-001: Export Monster Data

**Purpose:** Verify monster table export.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- data export "game.nes" monsters
```

**Expected Result:**

```

Data Export
────────────────────────────────────────
File:         game.nes
Data type:    monsters
Records:      XX

Exporting... Done!
Output:       monsters.json

Sample record:
{
"id": 0,
"name": "Slime",
"hp": 3,
"attack": 2,
"defense": 1,
"agility": 2,
"experience": 1,
"gold": 2
}
────────────────────────────────────────

```

**Verification:**

- [ ] JSON file created

- [ ] All monsters exported

- [ ] Values match known data

- [ ] JSON is valid and readable

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-002: Export Item Data

**Purpose:** Verify item table export.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- data export "game.nes" items
```

**Expected Result:**
- JSON file with item data

- Includes name, price, effects, equip flags

- Matches known item table

**Verification:**

- [ ] All items exported

- [ ] Prices correct

- [ ] Effects encoded properly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-003: Export Spell Data

**Purpose:** Verify spell/magic table export.

**Steps:**
1. Run:
```powershell
dotnet run --project src/GameInfoTools.Cli -- data export "game.nes" spells
```

**Expected Result:**
- JSON with spell data

- MP cost, power, target type

- Effect flags

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-004: Handle Unknown Data Type

**Purpose:** Verify error handling for unsupported types.

**Steps:**
1. Run with invalid type:
```powershell
dotnet run --project src/GameInfoTools.Cli -- data export "game.nes" invalid_type
```

**Expected Result:**
- Clear error message

- Lists supported data types

- No crash

**Verification:**

- [ ] Error message helpful

- [ ] Shows valid types

- [ ] Suggests closest match

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-005: Import Modified Monster Data

**Purpose:** Verify monster data can be modified and reimported.

**Prerequisites:**

- Working copy of ROM

- Exported monsters.json

**Steps:**
1. Export monster data
2. Edit monsters.json - change Slime HP from 3 to 99
3. Import modified data:
```powershell
dotnet run --project src/GameInfoTools.Cli -- data import "copy.nes" "monsters.json"
```

4. Test in emulator (optional)

**Expected Result:**

```

Data Import
────────────────────────────────────────
File:         copy.nes
Data file:    monsters.json
Records:      XX

Validating JSON... OK
Importing records... Done!

Modified: XX records
ROM updated successfully.
────────────────────────────────────────

```

**Verification:**

- [ ] Import completes without error

- [ ] Changes reflected in ROM

- [ ] ROM still works in emulator

- [ ] Modified values visible in game

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-006: Import Modified Item Data

**Purpose:** Verify item data import.

**Steps:**
1. Export item data
2. Modify item price or effect
3. Import changes

**Expected Result:**
- Changes applied to ROM

- Item data updated correctly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-007: Validate JSON on Import

**Purpose:** Verify JSON validation before writing.

**Steps:**
1. Create JSON with valid structure but invalid values:
```json
{
"monsters": [{
"id": 0,
"name": "Test",
"hp": 999999  // Too large for 1-byte value
}]
}
```

2. Try to import

**Expected Result:**
- Validation error shown

- ROM not modified

- Shows which value is invalid

- Shows valid range

**Verification:**

- [ ] Detects out-of-range values

- [ ] Shows helpful error

- [ ] Does not corrupt ROM

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-DATA-008: Handle Invalid JSON

**Purpose:** Verify handling of malformed JSON.

**Steps:**
1. Create invalid JSON (syntax error):
```json
{
"monsters": [
{ "id": 0, "name": "Test" // missing closing brace
}
```

2. Try to import

**Expected Result:**
- Parse error shown

- Line/column of error indicated

- ROM not modified

**Verification:**

- [ ] JSON parse error caught

- [ ] Error location shown

- [ ] Helpful message

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📖 Supported Data Types

| Type | Description | Games |
|------|-------------|-------|
| `monsters` | Enemy stats | Dragon Warrior, FF |
| `items` | Item properties | Most RPGs |
| `spells` | Magic/skills | RPGs |
| `weapons` | Weapon stats | RPGs |
| `armor` | Armor stats | RPGs |
| `characters` | Party members | RPGs |
| `shops` | Shop inventories | Most games |
| `encounters` | Battle formations | RPGs |
| `maps` | Map metadata | Various |

---

## 📊 Test Results Summary

| Test ID | Description | Status | Date | Tester |
|---------|-------------|--------|------|--------|
| TEST-DATA-001 | Export monsters | ☐ | | |
| TEST-DATA-002 | Export items | ☐ | | |
| TEST-DATA-003 | Export spells | ☐ | | |
| TEST-DATA-004 | Unknown type | ☐ | | |
| TEST-DATA-005 | Import monsters | ☐ | | |
| TEST-DATA-006 | Import items | ☐ | | |
| TEST-DATA-007 | JSON validation | ☐ | | |
| TEST-DATA-008 | Invalid JSON | ☐ | | |

**Total:** 0/8 tests completed

---

**Next:** [Disasm Tools Testing](disasm-tools.md)
