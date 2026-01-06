# Dragon Quest III Remake (SNES) - Monster Editor Manual Testing

## Overview

DQ3r SNES contains 155 monsters with comprehensive battle data. Monster records include stats, resistances, behavior flags, and name data.

## Monster Data Structure

### ROM Location
- **Address:** $3ed964 - $3ee0db (SNES)
- **Size:** 1,896 bytes total
- **Monsters:** 155

### Record Format (~12 bytes per monster)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 2 | HP | Maximum hit points (16-bit) |
| 2 | 1 | MP | Maximum magic points |
| 3 | 1 | Attack | Physical attack power |
| 4 | 1 | Defense | Physical defense |
| 5 | 1 | Agility | Turn order / evasion |
| 6 | 1 | Wisdom | Magic effectiveness |
| 7 | 1 | Luck | Critical / status resist |
| 8 | 2 | EXP | Experience reward |
| 10 | 2 | Gold | Gold reward |
| 12 | 4 | Resistances | 14 types × 2 bits each |
| 16 | 1 | Flags | Metal monster, flee, etc. |
| 17+ | var | Name | Japanese name + $ac terminator |

### Resistance Types (2 bits each)
| ID | Resistance | Values |
|----|------------|--------|
| 0 | Fire | 0=weak, 1=normal, 2=resist, 3=immune |
| 1 | Ice | Same scale |
| 2 | Wind | Same scale |
| 3 | Electric | Same scale |
| 4 | Physical | Same scale |
| 5 | Sap/Lower | Same scale |
| 6 | Sleep | Same scale |
| 7 | Confuse | Same scale |
| 8 | Stop | Same scale |
| 9 | Poison | Same scale |
| 10 | Instant Death | Same scale |
| 11 | Silence | Same scale |
| 12 | Dazzle | Same scale |
| 13 | Snooze | Same scale |

### Monster Flags
```
Bit 0: Metal monster (metal slime family)
Bit 1: Boss monster (can't run)
Bit 2: Undead (weak to holy)
Bit 3: Dragon type
Bit 4: Machine type
Bit 5: Demon type
Bit 6: Flying type
Bit 7: Reserved
```

## Test Cases

### TC-001: Load Monster Database
**Objective:** Verify all 155 monsters load correctly

**Steps:**
1. Open monster editor
2. Load DQ3 SFC ROM
3. Navigate to $3ed964
4. Verify monster count = 155

**Expected Results:**
- All monsters display names (Japanese)
- Stats are within expected ranges
- No parsing errors

```csharp
// Expected monster list start
// Slime = monster 0, HP ~8, Attack ~10
// Metal Slime = monster ~X, HP 4, Defense 255
```

### TC-002: Edit Basic Stats
**Objective:** Test stat modification

**Steps:**
1. Select Slime (monster 0)
2. Note original stats:
   - HP: ~8
   - Attack: ~10
   - Defense: ~4
3. Change HP from 8 to 50
4. Test in emulator

**Monster Reference (early game):**

| ID | Monster | HP | ATK | DEF | AGI | EXP | Gold |
|----|---------|-----|-----|-----|-----|-----|------|
| 0 | Slime | 8 | 10 | 4 | 3 | 1 | 2 |
| 1 | She-Slime | 12 | 14 | 8 | 5 | 2 | 4 |
| 2 | Dracky | 10 | 12 | 6 | 8 | 2 | 3 |
| 3 | Caterpillar | 12 | 9 | 3 | 2 | 2 | 3 |
| 4 | Healer | 15 | 11 | 10 | 6 | 3 | 5 |

### TC-003: Edit Metal Monster
**Objective:** Test metal slime handling

**Steps:**
1. Locate Metal Slime
2. Verify Metal flag set
3. Check Defense = 255
4. Verify EXP reward high (~1350)
5. Toggle Metal flag off
6. Verify behavior changes

**Metal Monster Reference:**

| Monster | HP | DEF | EXP | Notes |
|---------|-----|-----|------|-------|
| Metal Slime | 4 | 255 | 1350 | Runs often |
| Metal Babble | 5 | 255 | 10050 | Runs very often |
| Liquid Metal Slime | 8 | 512 | 40200 | Final metal type |

### TC-004: Edit Resistances
**Objective:** Test resistance modification

**Steps:**
1. Select monster with mixed resistances
2. View resistance grid (14 types × 4 values)
3. Change Fire resistance from "normal" to "immune"
4. Verify Fire spells now deal 0 damage

**Resistance Encoding Test:**
```
Resistances stored in 4 bytes (32 bits)
Each type uses 2 bits: 00=weak, 01=normal, 10=resist, 11=immune

Example: Fire weak, Ice immune = 00 11 ...
Byte 0: [Type3][Type2][Type1][Type0]
```

### TC-005: Edit EXP/Gold Rewards
**Objective:** Test reward modification

**Steps:**
1. Select mid-game monster
2. Note original EXP: ~50
3. Change EXP to 500
4. Test in battle - verify levelup faster

**Reward Scaling Reference:**

| Area | Typical EXP | Typical Gold |
|------|-------------|--------------|
| Aliahan (early) | 1-10 | 2-15 |
| Romaly (mid-early) | 10-30 | 10-40 |
| Isis (mid) | 30-80 | 30-100 |
| Necrogond (late) | 100-300 | 100-400 |
| Alefgard (endgame) | 300-1000 | 300-800 |

### TC-006: Edit Monster Type Flags
**Objective:** Test type flag modification

**Steps:**
1. Select Dragon type monster
2. Verify Dragon flag set
3. Verify Dragon Slash deals bonus damage
4. Clear Dragon flag
5. Verify Dragon Slash now normal damage

**Type Flag Effects:**

| Flag | Effect |
|------|--------|
| Undead | Weak to Heal spells, Zombie status |
| Dragon | Weak to Dragon Slash |
| Machine | Immune to poison/sleep |
| Demon | Weak to holy weapons |
| Flying | Weak to wind, avoids earth |

### TC-007: Edit Boss Monster
**Objective:** Test boss flag handling

**Steps:**
1. Locate Baramos (major boss)
2. Verify Boss flag set
3. Verify party cannot flee
4. Test HP scaling (bosses have 16-bit HP)

**Boss Reference:**

| Boss | HP | Attack | Defense | Location |
|------|-----|--------|---------|----------|
| Kandar | 250 | 85 | 40 | Romaly |
| Boss Troll | 450 | 110 | 60 | Pyramid |
| Baramos | 2500 | 180 | 120 | Baramos Castle |
| Zoma | 4700 | 250 | 200 | Final Dungeon |

### TC-008: Export/Import Monster Data
**Objective:** Test round-trip data integrity

**Steps:**
1. Export all 155 monsters to JSON
2. Modify a few values in JSON
3. Import modified JSON
4. Verify changes applied
5. Export again and compare

## Monster Name System

Names are stored as Japanese text with $ac terminator:

```
スライム = Slime (5 characters + terminator)
メタルスライム = Metal Slime (7 characters + terminator)
```

### Name Encoding
- Variable length (typically 4-10 characters)
- Custom DQ3 character encoding
- $ac marks end of name

## Regression Tests

### RT-001: Full Monster Round-Trip
1. Export all 155 monsters
2. Clear monster table
3. Import from export
4. Binary compare with original

### RT-002: Resistance Encoding
1. Set all 14 resistances to "immune" (11)
2. Save and reload
3. Verify all still "immune"
4. Reset to original values

### RT-003: Metal Slime Behavior
1. Modify Metal Slime HP from 4 to 100
2. Test in battle - should be harder to kill
3. Verify still runs away frequently
4. Restore original HP

## Known Issues

1. **Variable Name Length** - Monster names have variable lengths; care needed with offsets
2. **Compression** - Some monster data may be compressed in certain ROM versions
3. **AI Tables** - Monster AI patterns stored separately from stats
4. **Graphics** - Monster sprites linked by separate pointer table

## Test Harness

```csharp
// DQ3 Monster structure (proposed)
public class DQ3Monster {
    public ushort HP { get; set; }
    public byte MP { get; set; }
    public byte Attack { get; set; }
    public byte Defense { get; set; }
    public byte Agility { get; set; }
    public byte Wisdom { get; set; }
    public byte Luck { get; set; }
    public ushort Experience { get; set; }
    public ushort Gold { get; set; }
    public uint Resistances { get; set; } // 14 types × 2 bits
    public byte Flags { get; set; }
    public string Name { get; set; } = "";
    
    public bool IsMetal => (Flags & 0x01) != 0;
    public bool IsBoss => (Flags & 0x02) != 0;
    public bool IsUndead => (Flags & 0x04) != 0;
    public bool IsDragon => (Flags & 0x08) != 0;
    
    public int GetResistance(ResistanceType type) {
        int shift = (int)type * 2;
        return (int)((Resistances >> shift) & 0x03);
    }
}
```

## DQ4r Conversion Notes

Converting DQ3r monsters to DQ4r:
- Add chapter restrictions (which monsters appear when)
- Scale stats for DQ4 balance
- Map resistances to DQ4 resistance system
- Preserve monster AI patterns

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
