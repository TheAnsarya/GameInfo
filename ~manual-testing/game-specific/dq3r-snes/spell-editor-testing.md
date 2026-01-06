# Dragon Quest III Remake (SNES) - Spell Editor Manual Testing

## Overview

DQ3r SNES has a comprehensive spell system with ~70 spells shared between character classes and monsters. Spells are learned at specific levels and have MP costs, power values, and effect types.

## Spell Data Structure

### Character Spell Learning
Located at $c4179e - $c424a8 (3,339 bytes) within Character Class data:
- 9 character classes, 371 bytes each
- Each class has spell progression tables

### RAM Spell Storage
Per character at $7e3925 + offsets:
```
$24-$2d: Spell list (10 bytes)
Each byte = spell ID learned
$00 = no spell in slot
```

### Proposed Spell Record Format (~8 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 1 | SpellID | Unique spell identifier |
| 1 | 1 | MPCost | MP required to cast |
| 2 | 1 | BasePower | Damage/healing base |
| 3 | 1 | Target | Single/group/all/self |
| 4 | 1 | Type | Damage/heal/buff/debuff/status |
| 5 | 1 | Element | Fire/ice/wind/electric/none |
| 6 | 1 | SuccessRate | For status spells (0-255) |
| 7 | 1 | Flags | Battle only, field only, etc. |

### Target Types
| ID | Target |
|----|--------|
| 0 | Single enemy |
| 1 | Enemy group |
| 2 | All enemies |
| 3 | Single ally |
| 4 | All allies |
| 5 | Self |
| 6 | Field (travel spells) |

### Spell Types
| ID | Type | Examples |
|----|------|----------|
| 0 | Damage | Frizz, Sizz, Zap |
| 1 | Heal | Heal, Midheal, Fullheal |
| 2 | Buff | Buff, Acceleratle, Oomph |
| 3 | Debuff | Sap, Deceleratle |
| 4 | Status | Snooze, Fizzle, Whack |
| 5 | Utility | Zoom, Evac, Safe Passage |
| 6 | Resurrection | Zing, Kazing |
| 7 | Special | Hocus Pocus |

### Elements
| ID | Element | Resistance Check |
|----|---------|------------------|
| 0 | None | No resistance check |
| 1 | Fire (Frizz) | Fire resistance |
| 2 | Ice (Crack) | Ice resistance |
| 3 | Wind (Woosh) | Wind resistance |
| 4 | Electric (Zap) | Electric resistance |
| 5 | Holy | Undead check |
| 6 | Dark | Holy resistance |

## Test Cases

### TC-001: Load Spell Database
**Objective:** Verify all spells load correctly

**Steps:**
1. Open spell editor
2. Load DQ3 SFC ROM
3. Verify spell count (~70 spells)
4. Scroll through list

**Expected Results:**
- All spells display Japanese names
- MP costs reasonable (1-30 range)
- Types parsed correctly

### TC-002: Edit Damage Spell
**Objective:** Test damage spell modification

**Steps:**
1. Select Frizz (basic fire)
2. Note original stats:
   - MP Cost: 2
   - Base Power: 10-17
   - Element: Fire
3. Change Power to 50
4. Test in battle

**Damage Spell Reference (Fire series):**

| Spell | MP | Power | Target | Element |
|-------|-----|-------|--------|---------|
| Frizz | 2 | 10-17 | One | Fire |
| Frizzle | 4 | 38-52 | One | Fire |
| Kafrizz | 10 | 115-135 | One | Fire |
| Sizz | 4 | 17-24 | Group | Fire |
| Sizzle | 6 | 38-52 | Group | Fire |
| Kasizz | 10 | 95-115 | Group | Fire |

**Ice Spell Reference:**

| Spell | MP | Power | Target | Element |
|-------|-----|-------|--------|---------|
| Crack | 3 | 20-30 | One | Ice |
| Crackle | 5 | 40-55 | Group | Ice |
| Kacrack | 12 | 100-120 | All | Ice |

**Wind Spell Reference:**

| Spell | MP | Power | Target | Element |
|-------|-----|-------|--------|---------|
| Woosh | 2 | 8-16 | Group | Wind |
| Swoosh | 4 | 25-35 | Group | Wind |
| Kaswoosh | 8 | 70-90 | Group | Wind |

### TC-003: Edit Healing Spell
**Objective:** Test healing spell modification

**Steps:**
1. Select Heal
2. Note original stats:
   - MP Cost: 3
   - Healing: 30-40
3. Change MP Cost to 1
4. Test in battle/menu

**Healing Spell Reference:**

| Spell | MP | Healing | Target |
|-------|-----|---------|--------|
| Heal | 3 | 30-40 | One |
| Midheal | 5 | 75-95 | One |
| Fullheal | 7 | Max HP | One |
| Multiheal | 10 | 75-95 | All |
| Omniheal | 36 | Max HP | All |

### TC-004: Edit Buff Spell
**Objective:** Test stat modifier spells

**Steps:**
1. Select Buff (defense up)
2. Verify type = Buff
3. Check target = Single ally
4. Modify to All allies
5. Test in battle

**Buff Spell Reference:**

| Spell | MP | Effect | Target |
|-------|-----|--------|--------|
| Buff | 2 | +25% DEF | One |
| Kabuff | 3 | +25% DEF | All |
| Acceleratle | 3 | +50% AGI | All |
| Oomph | 6 | +100% ATK | One |
| Insulate | 4 | Fire/Ice resist | All |

### TC-005: Edit Status Spell
**Objective:** Test status effect spells

**Steps:**
1. Select Snooze
2. Check SuccessRate (~75%)
3. Modify success rate to 100%
4. Test against non-immune enemies

**Status Spell Reference:**

| Spell | MP | Effect | Success | Target |
|-------|-----|--------|---------|--------|
| Snooze | 3 | Sleep | ~75% | Group |
| Fizzle | 3 | Silence | ~50% | Group |
| Dazzle | 5 | Blind | ~75% | Group |
| Whack | 7 | Death | ~25% | One |
| Thwack | 7 | Death | ~15% | Group |
| Kasap | 4 | -25% DEF | ~85% | All enemies |

### TC-006: Edit Travel Spell
**Objective:** Test field/travel spells

**Steps:**
1. Select Zoom
2. Verify Target = Field
3. Verify Battle = false
4. Check MP cost
5. Test on field

**Travel Spell Reference:**

| Spell | MP | Effect | Location |
|-------|-----|--------|----------|
| Zoom | 1 | Town warp | Field |
| Evac | 4 | Dungeon exit | Field |
| Tingle | 0 | Cure paralysis | Both |
| Safe Passage | 2 | No damage tiles | Field |
| Holy Protection | 4 | Reduce encounters | Field |

### TC-007: Class Spell Learning
**Objective:** Test spell learning tables

**Steps:**
1. Load class data for Mage
2. Verify spell learning levels:
   - Level 3: Frizz
   - Level 5: Sizz
   - etc.
3. Modify Frizz to learn at level 1
4. Test new Mage character

**Class Spell Learning (Mage):**

| Level | Spell |
|-------|-------|
| 3 | Frizz |
| 5 | Sizz |
| 7 | Bang |
| 11 | Crack |
| 13 | Boom |
| 17 | Sizzle |
| 21 | Kasizz |
| 27 | Kaboom |
| 33 | Kafrizzle |

**Class Spell Learning (Cleric):**

| Level | Spell |
|-------|-------|
| 1 | Heal |
| 4 | Buff |
| 8 | Squelch |
| 11 | Kabuff |
| 14 | Midheal |
| 18 | Zing |
| 23 | Fullheal |
| 30 | Multiheal |

### TC-008: Monster Spell Usage
**Objective:** Verify monster spell casting

**Steps:**
1. Identify spell-casting monster (Mage Slime)
2. Check monster AI table for spell list
3. Modify to cast different spell
4. Test in battle

**Spell-Casting Monsters:**

| Monster | Spells |
|---------|--------|
| Healer | Heal |
| Mage Slime | Frizz, Sizz |
| Dracky | Sizz |
| Bodkin | Sizz |
| Archmage | Kaboom, Thwack |
| Baramos | Explodet, Blazemost |

## Spell ID Reference

| ID | Japanese | English | Type |
|----|----------|---------|------|
| $01 | メラ | Frizz | Damage |
| $02 | メラミ | Frizzle | Damage |
| $03 | メラゾーマ | Kafrizz | Damage |
| $04 | ギラ | Sizz | Damage |
| $05 | ベギラマ | Sizzle | Damage |
| $06 | ベギラゴン | Kasizz | Damage |
| $10 | ホイミ | Heal | Heal |
| $11 | ベホイミ | Midheal | Heal |
| $12 | ベホマ | Fullheal | Heal |
| $20 | スカラ | Buff | Buff |
| $21 | スクルト | Kabuff | Buff |
| $30 | ラリホー | Snooze | Status |
| $40 | ルーラ | Zoom | Travel |
| ... | ... | ... | ... |

## Sage Class Special

Sage learns spells from both Mage and Cleric:

```
Sage Spell List = Mage Spells ∪ Cleric Spells
Omit: Hocus Pocus (Jester only)
Add: Kathwack, Omniheal (Sage exclusive)
```

## Regression Tests

### RT-001: Full Spell Round-Trip
1. Export all spells to JSON
2. Clear spell table
3. Import from export
4. Binary compare with original

### RT-002: Class Learning Consistency
1. Modify Mage spell at level 5
2. Verify Sage also learns at same level
3. Modify Cleric spell
4. Verify Sage updated

### RT-003: MP Cost Balance
1. Set Kafrizz MP to 0 (free)
2. Test in battle
3. Restore to 10 MP
4. Verify balance restored

## Known Issues

1. **Dual Learning** - Sage inherits from both Mage and Cleric
2. **Hero Exclusive** - Some spells only learnable by Hero
3. **Monster Variants** - Monster spell power may differ from player
4. **Resistance Piercing** - Some spells ignore resistances

## Test Harness

```csharp
// DQ3 Spell structure (proposed)
public class DQ3Spell {
    public byte Id { get; set; }
    public byte MPCost { get; set; }
    public byte BasePower { get; set; }
    public SpellTarget Target { get; set; }
    public SpellType Type { get; set; }
    public SpellElement Element { get; set; }
    public byte SuccessRate { get; set; }
    public byte Flags { get; set; }
    public string JapaneseName { get; set; } = "";
    public string EnglishName { get; set; } = "";
    
    public bool IsBattleOnly => (Flags & 0x01) != 0;
    public bool IsFieldOnly => (Flags & 0x02) != 0;
    public bool IgnoresResistance => (Flags & 0x04) != 0;
}

public class ClassSpellLearning {
    public CharacterClass Class { get; set; }
    public List<(int Level, byte SpellId)> Spells { get; set; } = [];
    
    public byte? GetSpellAtLevel(int level) {
        return Spells.FirstOrDefault(s => s.Level == level).SpellId;
    }
}
```

## DQ4r Conversion Notes

Converting DQ3r spells to DQ4r:
- Map spell IDs between games
- Adjust MP costs for DQ4 balance
- Handle chapter-specific availability
- Cristo/Brey learn different subsets

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
