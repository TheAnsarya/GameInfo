# Dragon Warrior IV (NES) - Spell Editor Manual Testing

## Overview

DW4 contains ~40 spells shared between player characters and monsters. Each spell record is 6 bytes containing MP cost, power, targeting, and effect data.

## Spell Data Structure

### Record Format (6 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 1 | NameIndex | Index into spell name table |
| 1 | 1 | MPCost | MP required to cast |
| 2 | 1 | BasePower | Damage/healing base value |
| 3 | 1 | TypeFlags | Target + Type + Element (see below) |
| 4 | 1 | SecondaryEffect | Additional effect ID (0=none) |
| 5 | 1 | SuccessRate | For status spells (0-255) |

### TypeFlags Breakdown
```
Bits 0-2: Target Type
  0 = Single enemy
  1 = All enemies
  2 = Single ally
  3 = All allies
  4 = Self
  5 = Field (travel spells)

Bits 3-5: Spell Type
  0 = Damage
  1 = Heal
  2 = Buff
  3 = Debuff
  4 = Status
  5 = Utility
  6 = Transport
  7 = Special

Bits 6-7: Element
  0 = None
  1 = Fire
  2 = Ice
  3 = Electric
```

## Test Cases

### TC-001: Load Spell Database
**Objective:** Verify all spells load correctly

**Steps:**
1. Open spell editor
2. Load DW4 ROM
3. Verify spell count (~40 spells)
4. Scroll through list, check names and stats

**Expected Results:**
- All spells display names
- MP costs are reasonable (0-30 range)
- Type flags decode correctly

### TC-002: Edit Damage Spell
**Objective:** Test damage spell modification

**Steps:**
1. Select Blaze spell
2. Note original stats:
   - MP Cost: 2
   - Base Power: 15-20 (random variance)
   - Target: All enemies
   - Element: Fire
3. Change Base Power from 15 to 25
4. Test in emulator combat

**Damage Spell Reference:**

| Spell | MP | Power | Target | Element |
|-------|-----|-------|--------|---------|
| Blaze | 2 | 15-20 | All | Fire |
| Firebal | 4 | 25-35 | All | Fire |
| Firebane | 6 | 55-75 | All | Fire |
| Icebolt | 3 | 15-25 | Group | Ice |
| Snowstorm | 8 | 50-70 | All | Ice |
| Zap | 4 | 30-45 | One | Electric |
| Lightning | 15 | 80-110 | All | Electric |

### TC-003: Edit Healing Spell
**Objective:** Test healing spell modification

**Steps:**
1. Select Heal spell
2. Note original stats:
   - MP Cost: 3
   - Base Power: 30-40 (healing amount)
   - Target: Single ally
3. Change MP Cost from 3 to 2
4. Verify balance impact in game

**Healing Spell Reference:**

| Spell | MP | Healing | Target |
|-------|-----|---------|--------|
| Heal | 3 | 30-40 | One |
| HealMore | 5 | 75-90 | One |
| HealAll | 7 | 100-120 | One |
| HealUs | 10 | 60-80 | All |
| HealUsAll | 18 | 100+ | All |

### TC-004: Edit Buff/Debuff Spell
**Objective:** Test stat modifier spells

**Steps:**
1. Select Increase spell
2. Verify type = Buff
3. Verify target = All allies
4. Check effect duration (turns)
5. Modify to single ally target

**Buff/Debuff Reference:**

| Spell | MP | Type | Effect |
|-------|-----|------|--------|
| Increase | 3 | Buff | +Defense all allies |
| SpeedUp | 3 | Buff | +Agility one ally |
| Bikill | 5 | Buff | +Attack one ally |
| Sap | 2 | Debuff | -Defense one enemy |
| Slow | 3 | Debuff | -Agility all enemies |
| Defeat | 4 | Debuff | Instant death (low %) |

### TC-005: Edit Status Spell
**Objective:** Test status effect spells

**Steps:**
1. Select Sleep spell
2. Check SuccessRate byte (affect hit chance)
3. Modify success rate from 75% to 90%
4. Test against regular enemies

**Status Spell Reference:**

| Spell | MP | Effect | Success Rate |
|-------|-----|--------|--------------|
| Sleep | 3 | Sleep | ~75% |
| Stopspell | 3 | Silence | ~60% |
| Surround | 5 | Blind | ~70% |
| Chaos | 5 | Confuse | ~50% |
| Beat | 7 | Death | ~30% |

### TC-006: Edit Transport Spell
**Objective:** Test travel/utility spells

**Steps:**
1. Select Return spell
2. Verify type = Transport
3. Verify target = Field
4. Check MP cost (0 = free travel)
5. Test in field (not battle)

**Transport Spell Reference:**

| Spell | MP | Effect |
|-------|-----|--------|
| Return | 1 | Warp to town |
| Outside | 2 | Exit dungeon |
| Repel | 2 | Reduce encounters |
| Stepguard | 2 | No damage tiles |
| Chance | 20 | Random effect |

### TC-007: Spell Learning Table
**Objective:** Test spell learning by level

**Steps:**
1. Load spell learning table
2. Verify Cristo learns Heal at level 3
3. Change Heal learning to level 2
4. Test with new game (Cristo joins at level 3)

**Spell Learning Reference (Cristo):**

| Level | Spell |
|-------|-------|
| 3 | Heal |
| 5 | Upper |
| 7 | Antidote |
| 10 | HealMore |
| 14 | Revive |
| 17 | HealAll |

### TC-008: Monster Spell Usage
**Objective:** Verify monster spell casting

**Steps:**
1. Identify spell-casting monster (Healslime = 0x03)
2. Verify monster ability table references Heal spell
3. Modify monster to cast Firebal
4. Test in combat

**Spell-Casting Monsters:**

| Monster | Spells |
|---------|--------|
| Healslime | Heal |
| Magidrakee | Blaze |
| Wyvern | Firebal |
| Blizzard | Snowstorm |
| Demon | Defeat |

## Spell Index Reference

| ID | Name | Type |
|----|------|------|
| 0x00 | Heal | Heal |
| 0x01 | HealMore | Heal |
| 0x02 | HealAll | Heal |
| 0x03 | HealUs | Heal |
| 0x04 | Blaze | Damage |
| 0x05 | Firebal | Damage |
| 0x06 | Firebane | Damage |
| 0x07 | Icebolt | Damage |
| 0x08 | Snowstorm | Damage |
| 0x09 | Zap | Damage |
| 0x0A | Lightning | Damage |
| 0x0B | Increase | Buff |
| 0x0C | SpeedUp | Buff |
| 0x0D | Bikill | Buff |
| 0x0E | Sleep | Status |
| 0x0F | Stopspell | Status |
| 0x10+ | ... | ... |

## Regression Tests

### RT-001: Round-Trip Export
1. Export all spells to JSON
2. Clear spell table
3. Import JSON
4. Binary compare with original

### RT-002: Learning Table Integrity
1. Edit spell ID in learning table
2. Verify character still learns at correct level
3. Verify spell name displays correctly

### RT-003: Battle System Integration
1. Modify Heal power to 1
2. Test in battle
3. Modify back to original
4. Verify no side effects

## Known Issues

1. **Variance** - Damage/healing has random variance; editor shows base only
2. **AI Use** - Some spells have AI priority weights not visible in main data
3. **Element Resistance** - Monster resistance to elements stored separately

## Test Harness

```csharp
using DW4Lib.DataStructures;

// Load Heal spell
var heal = Spell.FromBytes(romData, spellTableOffset);

// Verify stats
Assert.AreEqual(3, heal.MPCost);
Assert.AreEqual(SpellType.Heal, heal.Type);
Assert.AreEqual(SpellTarget.SingleAlly, heal.Target);
Assert.AreEqual(SpellElement.None, heal.Element);

// Export to bytes
var bytes = heal.ToBytes();
Assert.AreEqual(6, bytes.Length);
```

## DQ3r Conversion Notes

Converting DW4 spells to DQ4r (SNES):
- Scale MP costs (SNES has higher MP pools)
- Convert damage formulas (SNES uses different calculation)
- Map spell IDs to DQ3r spell system
- Add visual effects references

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
