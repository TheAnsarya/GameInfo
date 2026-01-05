# Dragon Warrior IV (NES) - Monster Editor Manual Testing

## Overview

DW4 contains 209 monsters stored in Bank 6 at address $A2A2. Each monster record is 27 bytes containing stats, abilities, drop data, and AI behavior flags.

## Monster Data Structure

### Record Format (27 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0-1 | 2 | Experience | XP awarded (little-endian) |
| 2-3 | 2 | Gold | Gold dropped (little-endian) |
| 4-5 | 2 | HP | Hit Points (little-endian) |
| 6 | 1 | Attack | Attack power |
| 7 | 1 | Defense | Defense power |
| 8 | 1 | Agility | Speed stat |
| 9-14 | 6 | SkillData | Abilities and action patterns |
| 15-18 | 4 | BehaviorData | AI patterns |
| 19 | 1 | ItemDropId | Item drop reference |
| 20-21 | 2 | Unknown | Under research |
| 22 | 1 | MetalFlags | Metal monster flags (bits 0-1) |
| 23 | 1 | DropRate | Drop rate (bits 0-2) |
| 24 | 1 | StatusVuln | Status vulnerability flags |
| 25-26 | 2 | Unknown | Under research |

### ROM Location
- **Bank:** 0x06
- **CPU Address:** $A2A2
- **File Offset:** 0x1A2B2 (with header)
- **Total Records:** 209 monsters × 27 bytes = 5,643 bytes

## Test Cases

### TC-001: Load Monster Database
**Objective:** Verify all 209 monsters load correctly

**Steps:**
1. Open monster editor
2. Load DW4 ROM
3. Verify monster count shows 209
4. Scroll through list, verify no empty/corrupted entries

**Expected Results:**
- All monsters display names
- Stats appear reasonable
- No parsing errors

### TC-002: Edit Basic Stats
**Objective:** Test stat editing and validation

**Steps:**
1. Select Slime (Monster ID 0x00)
2. Note original stats:
   - HP: 8, Attack: 8, Defense: 5, Agility: 4
   - XP: 1, Gold: 2
3. Modify Attack to 10
4. Save changes
5. Verify in emulator (fight Slime, check damage dealt)

**Test Monsters:**

| ID | Name | HP | ATK | DEF | AGI | XP | Gold |
|----|------|-----|-----|-----|-----|----|------|
| 0x00 | Slime | 8 | 8 | 5 | 4 | 1 | 2 |
| 0x01 | Drakee | 10 | 12 | 8 | 6 | 3 | 4 |
| 0x0C | Metal Slime | 4 | 20 | 255 | 255 | 1350 | 10 |
| 0x5C | King Metal | 7 | 150 | 255 | 255 | 30010 | 10 |
| 0xD0 | Necrosaro | 2000 | 180 | 150 | 90 | 0 | 0 |

### TC-003: Metal Monster Flag
**Objective:** Verify metal monster identification

**Steps:**
1. Select Metal Slime (0x0C)
2. Check IsMetal property displays true
3. Verify MetalFlags byte = 0x03
4. Create new "metal" monster by setting flag
5. Test in emulator - damage should cap at 0-1

**Metal Monster List:**
- 0x0C: Metal Slime
- 0x5C: King Metal
- 0xD8: Metal King

### TC-004: Item Drop System
**Objective:** Test item drop editing

**Steps:**
1. Select Slime (0x00)
2. View ItemDropId (should be Medical Herb = 0x00)
3. View DropRate (bits 0-2 of byte 23)
4. Change drop to Leather Shield (0x20)
5. Test drop rate interpretation:

**Drop Rate Values:**
| Value | Rate | Chance |
|-------|------|--------|
| 0 | None | 0% |
| 1 | 1/2 | 50% |
| 2 | 1/4 | 25% |
| 3 | 1/8 | 12.5% |
| 4 | 1/16 | 6.25% |
| 5 | 1/32 | 3.125% |
| 6 | 1/256 | 0.39% |
| 7 | Always | 100% |

### TC-005: Skill/Ability Data
**Objective:** Test monster ability editing

**Steps:**
1. Select Healslime (0x03)
2. View SkillData bytes (6 bytes)
3. Verify Heal ability present
4. Modify to add HealMore
5. Test in emulator combat

**Ability Encoding (bytes 9-14):**
```
Byte 9: Primary action
  Bits 0-3: Action ID
  Bits 4-7: Action chance (0-15)
Byte 10: Secondary action (same format)
Byte 11: Tertiary action
Byte 12: Action count per turn
Byte 13: HP regeneration rate
Byte 14: Reserved/AI flags
```

### TC-006: Status Vulnerability
**Objective:** Verify status effect resistance

**Steps:**
1. Select Slime (0x00)
2. Check StatusVulnerability byte (24)
3. Verify Paralysis vulnerability (bit 6)
4. Verify Confusion vulnerability (bit 7)
5. Test status spells in emulator

**Status Flags (byte 24):**
```
Bit 0-5: Reserved
Bit 6: Vulnerable to Paralysis
Bit 7: Vulnerable to Confusion (or Bounce flag)
```

### TC-007: Boss Monster Data
**Objective:** Test boss-specific editing

**Steps:**
1. Load boss monsters:
   - Saro (0xD0) - Final boss form 1
   - Necrosaro (0xD1-0xD4) - Transformation stages
2. Verify high stats load correctly
3. Verify 16-bit HP values (Necrosaro > 2000 HP)
4. Edit phase 2 HP, verify change in combat

**Boss Reference:**
| ID | Name | HP | Notes |
|----|------|-----|-------|
| 0xC0 | Pisaro's Knight | 400 | Chapter 2 boss |
| 0xC8 | Baffle | 600 | Chapter 3 boss |
| 0xCE | Balzack | 500 | Chapter 4 boss |
| 0xD0 | Saro Phase 1 | 1200 | Final dungeon |
| 0xD4 | Necrosaro Final | 2000+ | Final boss |

### TC-008: Experience/Gold Validation
**Objective:** Test XP/Gold boundary cases

**Steps:**
1. Select Metal Slime (0x0C)
2. Verify XP = 1,350 (0x546)
3. Edit to maximum 65,535 (0xFFFF)
4. Save and verify no overflow
5. Test King Metal XP = 30,010 (0x753A)

**Boundary Tests:**
- Minimum XP: 0
- Maximum XP: 65,535 (16-bit limit)
- Typical boss XP: 500-5000

## Regression Tests

### RT-001: Round-Trip Export
1. Export all 209 monsters to JSON
2. Clear monster table in editor
3. Import JSON
4. Binary compare: exported bytes match original ROM section

### RT-002: Stat Overflow Protection
1. Try setting HP > 65,535
2. Verify editor clamps or warns
3. Try setting Attack > 255
4. Verify byte-level validation

### RT-003: Cross-Reference Integrity
1. Edit monster 0x00 (Slime)
2. Verify encounter tables still reference correctly
3. Verify no palette/sprite index corruption

## Known Issues

1. **16-bit Stats** - HP, XP, Gold are little-endian; ensure correct byte order
2. **Ability IDs** - Action IDs not fully documented; some cause crashes
3. **AI Behavior** - Bytes 15-18 affect targeting; changes may break AI

## Test Harness

```csharp
using DW4Lib.DataStructures;

// Load monster from ROM
var slime = Monster.FromBytes(romData, 0x1A2B2);

// Verify basic stats
Assert.AreEqual(8, slime.HitPoints);
Assert.AreEqual(8, slime.Attack);
Assert.AreEqual(5, slime.Defense);
Assert.AreEqual(4, slime.Agility);
Assert.AreEqual(1, slime.Experience);
Assert.AreEqual(2, slime.Gold);

// Verify metal flag
var metalSlime = Monster.FromBytes(romData, 0x1A2B2 + (0x0C * 27));
Assert.IsTrue(metalSlime.IsMetal);
```

## DQ3r Conversion Notes

When converting DW4 monsters to DQ4r (SNES):
- Scale HP by 1.5× (SNES has higher values)
- Convert 2bpp sprites to 4bpp
- Map ability IDs to DQ3r equivalent system
- Adjust drop rates for SNES drop system

## Sign-Off

| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-001 | | | ☐ |
| TC-002 | | | ☐ |
| TC-003 | | | ☐ |
| TC-004 | | | ☐ |
| TC-005 | | | ☐ |
| TC-006 | | | ☐ |
| TC-007 | | | ☐ |
| TC-008 | | | ☐ |
| RT-001 | | | ☐ |
| RT-002 | | | ☐ |
| RT-003 | | | ☐ |
