# Dragon Warrior IV (NES) - Character Editor Manual Testing

## Overview

DW4 features a unique chapter-based story with 10 playable characters, each with distinct stats, equipment restrictions, and spell lists. Character data is stored in save RAM at $6000-$7FFF and temporarily in work RAM during gameplay.

## Character List

| ID | Name | Chapter | Class Type | Spells | Notes |
|----|------|---------|------------|--------|-------|
| 0 | Hero | 5 | Hero | Yes | Player-named, learns Zenithian spells |
| 1 | Ragnar | 1, 5 | Soldier | No | High HP/STR, no magic |
| 2 | Alena | 2, 5 | Princess | No | Critical hit specialist |
| 3 | Cristo | 2, 5 | Priest | Yes | Healing/support magic |
| 4 | Brey | 2, 5 | Wizard | Yes | Offensive magic specialist |
| 5 | Taloon | 3, 5 | Merchant | No | Random battle actions |
| 6 | Nara | 4, 5 | Fortune Teller | Yes | Healing/status magic |
| 7 | Mara | 4, 5 | Dancer | Yes | Offensive magic |
| 8 | Panon | 5 | Entertainer | No | Temporary party member |
| 9 | Orin | 5 | Warrior | No | Temporary party member |

## Character Data Structure (32 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 8 | Name | Character name (DW4 text encoding) |
| 0x08 | 1 | Level | Current level (1-99) |
| 0x09 | 1 | ClassID | Character class identifier |
| 0x0A | 2 | CurrentHP | Current hit points (little-endian) |
| 0x0C | 2 | MaxHP | Maximum hit points |
| 0x0E | 2 | CurrentMP | Current magic points |
| 0x10 | 2 | MaxMP | Maximum magic points |
| 0x12 | 1 | Strength | STR stat (affects physical damage) |
| 0x13 | 1 | Agility | AGI stat (affects turn order, dodge) |
| 0x14 | 1 | Vitality | VIT stat (affects HP gain) |
| 0x15 | 1 | Intelligence | INT stat (affects spell power) |
| 0x16 | 1 | Luck | LCK stat (affects criticals, drops) |
| 0x17 | 4 | Experience | Total EXP (little-endian 32-bit) |
| 0x1B | 1 | Weapon | Equipped weapon ID |
| 0x1C | 1 | Armor | Equipped body armor ID |
| 0x1D | 1 | Shield | Equipped shield ID |
| 0x1E | 1 | Helmet | Equipped helmet ID |
| 0x1F | 1 | StatusFlags | Status effects (poison, curse, etc.) |

### Status Flag Bits
| Bit | Effect |
|-----|--------|
| 0 | Poisoned |
| 1 | Paralyzed |
| 2 | Asleep |
| 3 | Confused |
| 4 | Cursed (equipment) |
| 5 | Dead |
| 6-7 | Reserved |

## RAM Locations

### Save RAM ($6000-$7FFF)
| Address | Size | Contents |
|---------|------|----------|
| $6010 | 320 | Save 1 party data (10 × 32 bytes) |
| $6150 | Varies | Save 1 inventory/gold |
| $6400 | 320 | Save 2 party data |
| $6800 | 320 | Save 3 party data |

### Work RAM (Battle/Menu)
| Address | Size | Contents |
|---------|------|----------|
| $0300 | 320 | Active party data |
| $0500 | 32 | Current character buffer |

---

## Test Cases

### TC-001: Load Character List
**Objective:** Verify all 10 characters load with correct initial data

**Prerequisites:**
- DW4 ROM loaded
- Character editor open

**Steps:**
1. Open Character Editor
2. Load save file (or start from Chapter 5 for full roster)
3. Verify all 10 characters appear in list
4. Check names match expected values

**Expected Results:**
- Character list shows all party members
- Names display correctly (8 chars max)
- No garbled or missing entries

---

### TC-002: Edit Hero Name
**Objective:** Test name editing with DW4 text encoding

**Prerequisites:**
- Chapter 5 save loaded
- Hero character selected

**Steps:**
1. Select Hero (ID 0)
2. View current name (player-defined)
3. Change name to "MAXNAME1" (8 chars)
4. Save changes
5. Verify name persists in save
6. Try name > 8 chars, verify truncation

**Text Encoding Reference:**
| Byte | Character | Byte | Character |
|------|-----------|------|-----------|
| 0x00 | (space) | 0x25 | A |
| 0x01 | 0 | 0x26 | B |
| 0x0A | 9 | ... | ... |
| 0x0B | a | 0x3E | Z |
| 0x24 | z | | |

**Expected Results:**
- Name updates in both editor and game
- 8-character limit enforced
- DW4 text encoding preserved

---

### TC-003: Edit Base Stats
**Objective:** Test stat modification and validation

**Prerequisites:**
- Alena character selected

**Reference Stats (Alena Level 1):**
| Stat | Value |
|------|-------|
| HP | 32 |
| MP | 0 |
| STR | 15 |
| AGI | 18 |
| VIT | 12 |
| INT | 2 |
| LCK | 15 |

**Steps:**
1. Select Alena from character list
2. Verify displayed stats match reference
3. Modify Strength to 255 (max)
4. Modify Intelligence to 50
5. Save changes
6. Load game, verify stat changes
7. Enter battle, verify damage increased

**Expected Results:**
- Stats edit within 0-255 range
- Out-of-range values rejected or clamped
- Changes persist after save/reload
- Battle calculations reflect new stats

---

### TC-004: Equipment Restrictions
**Objective:** Verify equipment compatibility checks

**Equipment Rules:**
| Character | Weapon Types | Armor | Shields | Helmets |
|-----------|-------------|-------|---------|---------|
| Hero | Swords, Staffs | Heavy | Yes | Yes |
| Ragnar | Swords, Axes | Heavy | Yes | Yes |
| Alena | Claws | Light | No | Yes |
| Cristo | Staffs, Flails | Medium | Yes | Yes |
| Brey | Staffs | Light | No | Hats |
| Taloon | Swords, Axes | Heavy | Yes | Yes |
| Nara | Staffs | Medium | Yes | Yes |
| Mara | Whips, Staffs | Light | No | Hats |

**Steps:**
1. Select Alena
2. Attempt to equip Iron Shield (forbidden)
3. Verify editor shows warning or blocks
4. Equip Claw weapon (allowed)
5. Verify equipment saves correctly

**Test Equipment IDs:**
| ID | Item | Equippable By |
|----|------|--------------|
| 0x01 | Copper Sword | Hero, Ragnar, Taloon |
| 0x20 | Iron Claw | Alena only |
| 0x30 | Iron Shield | Hero, Ragnar, Cristo, Taloon, Nara |
| 0x40 | Leather Hat | All characters |

**Expected Results:**
- Invalid equipment shows warning
- Valid equipment equips successfully
- Equipment IDs match game data

---

### TC-005: Experience and Leveling
**Objective:** Test EXP editing and level consistency

**Prerequisites:**
- Low-level character selected

**Steps:**
1. Select Ragnar at Level 1
2. Note current EXP: 0
3. Set EXP to 1000
4. Save and check level (should auto-adjust?)
5. Set EXP to max (0xFFFFFF / 16,777,215)
6. Verify level displays 99

**EXP-to-Level Reference (Hero):**
| Level | Total EXP |
|-------|-----------|
| 1 | 0 |
| 5 | 180 |
| 10 | 750 |
| 20 | 4,500 |
| 30 | 12,000 |
| 50 | 65,000 |
| 99 | ~1,000,000 |

**Expected Results:**
- EXP stores as 4-byte little-endian
- Level updates based on EXP tables
- Max EXP cap enforced

---

### TC-006: HP/MP Boundaries
**Objective:** Test health point edge cases

**Steps:**
1. Select Cristo
2. Set MaxHP to 999 (practical max)
3. Set CurrentHP to 1000 (exceeds max)
4. Verify editor clamps to MaxHP
5. Set CurrentHP to 0 (dead state)
6. Verify StatusFlags.Dead bit set
7. Set MaxMP to 255, CurrentMP to 256
8. Verify MP clamping

**HP/MP Limits:**
- HP: 0-999 (displayed), 0-65535 (stored)
- MP: 0-255 typical, 0-65535 stored

**Expected Results:**
- Current <= Max enforced
- Dead status syncs with HP=0
- Overflow values handled gracefully

---

### TC-007: Status Effects
**Objective:** Test status flag editing

**Steps:**
1. Select any character
2. Clear all status flags (0x00)
3. Set Poisoned (bit 0) - value 0x01
4. Save and verify poison icon in game
5. Set Cursed (bit 4) - value 0x10
6. Verify cursed equipment indicator
7. Set Dead (bit 5) - value 0x20
8. Verify character unusable in battle

**Expected Results:**
- Individual status bits toggleable
- Multiple statuses can coexist
- Dead status prevents battle participation

---

### TC-008: Spell List (Magic Users)
**Objective:** Test spell learning/forgetting

**Prerequisites:**
- Cristo selected (healing spells)

**Spell Bitmask (Cristo):**
| Bit | Spell | Effect |
|-----|-------|--------|
| 0 | Heal | Restore HP |
| 1 | Hurt | Fire damage |
| 2 | Antidote | Cure poison |
| 3 | Repel | Reduce encounters |
| 4 | Healmore | More HP |
| ... | ... | ... |

**Steps:**
1. Select Cristo
2. View SpellsLow/SpellsHigh bytes
3. Add spell Cristo shouldn't have (Blazemost)
4. Save and verify spell appears in menu
5. Remove Heal spell, verify unavailable
6. Reset to default spell list

**Expected Results:**
- Spells can be granted/removed
- Invalid spell combinations work (ROM hack)
- Spell order matches game menu

---

### TC-009: Multi-Character Batch Edit
**Objective:** Test editing multiple characters

**Steps:**
1. Select all characters
2. Set all to Level 50
3. Max all stats (255 across the board)
4. Equip best equipment per character
5. Save changes
6. Load game and verify "god mode" party

**Expected Results:**
- Batch operations apply correctly
- No data corruption between characters
- Individual character boundaries preserved

---

### TC-010: Chapter Transition
**Objective:** Verify character data persists across chapters

**Steps:**
1. Create Chapter 1 save (Ragnar only)
2. Edit Ragnar's stats
3. Progress to Chapter 5 (or import)
4. Verify Ragnar's edited stats persist
5. Check other characters have default values

**Expected Results:**
- Chapter-specific saves handled
- Stats carry over to Chapter 5
- New characters initialize correctly

---

## Regression Tests

### RT-001: Save File Integrity
After any character edit:
1. Verify save file checksum (if applicable)
2. Load save in emulator
3. Confirm no "corrupted save" errors
4. Verify all characters accessible

### RT-002: Equipment Reference Integrity
After equipment changes:
1. Check item IDs match inventory
2. Verify equipped items removed from inventory
3. Test equip/unequip in game

### RT-003: Party Order Preservation
After character edits:
1. Verify party order unchanged
2. Check wagon members accessible
3. Confirm battle party correct

---

## Known Edge Cases

### Temporary Characters
- Panon and Orin can only be in party temporarily
- Editor may show slots for them even when not recruited
- Editing their data before recruitment may cause issues

### Equipment Overflow
- Setting equipment ID > valid items shows "????"
- May cause crashes if used in battle
- Some IDs reserved for enemy-only equipment

### Name Buffer Overrun
- Name field is exactly 8 bytes
- Null terminator not required
- Full 8-char names display correctly

---

## Debug Utilities

### Hex Dump Character
```
Offset: +0 +1 +2 +3 +4 +5 +6 +7 +8 +9 +A +B +C +D +E +F
$6010:  48 45 52 4F 00 00 00 00 01 00 20 00 20 00 00 00  HERO....  . ...
$6020:  00 00 0F 0C 0A 08 0A 00 00 00 00 01 02 03 04 00  ................
```

### Quick Reference Commands (FCEUX)
```
; Read Hero's HP
> hex $6010+0A 2

; Set Hero's STR to max
> poke $6010+12 255

; View party in RAM
> hexdump $0300 320
```

## Related Files

- [DW4Lib/DataStructures/Character.cs](../../../logsmall/DW4Lib/DataStructures/Character.cs) - C# character class
- [DW4Lib/ROM/DW4Rom.cs](../../../logsmall/DW4Lib/ROM/DW4Rom.cs) - ROM reading utilities
- [monster-editor-testing.md](monster-editor-testing.md) - Monster editing tests
- [item-editor-testing.md](item-editor-testing.md) - Equipment item tests
