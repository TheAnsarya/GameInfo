# FFMQ SNES - Spell & Magic Editor Testing

Manual test cases for verifying Final Fantasy Mystic Quest spell and magic editing.

## 📋 System Overview

### Magic System
- **Total Spells**: 16 spells (4 categories × 4 levels)
- **MP Cost**: None (unlimited magic use)
- **Learning**: Story-based progression
- **Elements**: Fire, Ice, Thunder, Earth, Cure, Support

### Spell Categories
| Category | Spells | Element |
|----------|--------|---------|
| White Magic | Cure, Life, Heal, Exit | Cure/Support |
| Black Magic | Fire, Blizzard, Thunder, Quake | Elemental |
| Wizard Magic | Aero, Flare, Meteor, White | Mixed |
| Special | Sleep, Confuse, Silence, Death | Status |

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Spell Data | $D50000+ | Spell definitions |
| Spell Names | $D52000+ | Text pointers |
| Spell GFX | $C60000+ | Animation graphics |
| Spell Scripts | $D54000+ | Effect routines |

---

## 🧪 Test Cases

### TC-01: Spell List Loading
**Purpose**: Verify all spells load correctly.

**Prerequisites**:
- FFMQ ROM loaded
- Spell Editor open

**Steps**:
1. Open Spell Editor
2. Verify spell list populates (16 entries)
3. Check categories display correctly
4. Verify spell names match original

**Expected Results**:
- All 16 spells listed
- Category tabs functional
- Icons/animations preview
- Names match original game

---

### TC-02: Spell Power Editing
**Purpose**: Test spell base power modification.

**Prerequisites**:
- Fire spell selected

**Steps**:
1. Select "Fire" spell (ID 0)
2. View Base Power: 20
3. Change to 99
4. Apply changes
5. Cast Fire in-game, check damage

**Expected Results**:
- Power value accepts 0-255
- Damage formula applies power
- Multi-hit spells multiply correctly
- Boss damage scaling works

**Spell Data Format**:
```
Spell Entry (12 bytes):
Offset  Size  Field
$00     1     Base Power
$01     1     Element flags
$02     1     Effect type (damage/heal/status)
$03     1     Target type (single/all/self)
$04     1     Animation ID
$05     1     Sound effect ID
$06     1     Status effect ID (for status spells)
$07     1     Status chance (%)
$08     1     Required story flag
$09     3     Reserved
```

---

### TC-03: Elemental Assignment
**Purpose**: Verify spell element editing.

**Prerequisites**:
- Blizzard spell selected (ice element)

**Steps**:
1. View Element: Ice ✓
2. Add Fire element
3. Apply changes
4. Cast on ice-resistant enemy
5. Verify damage still applies (fire portion)

**Expected Results**:
- Multiple elements possible
- Weaknesses/resistances stack
- Element affects damage formula
- Animation may not reflect change

---

### TC-04: Target Type Modification
**Purpose**: Test spell targeting changes.

**Prerequisites**:
- Cure spell selected (single target)

**Steps**:
1. View Target Type: Single Ally
2. Change to All Allies
3. Apply changes
4. Cast Cure in battle
5. Verify entire party healed

**Expected Results**:
- Target dropdown: Single, All, Self
- Enemy target types: Single Enemy, All Enemies
- Power may split for multi-target
- Animation adjusts appropriately

**Target Types**:
| ID | Target |
|----|--------|
| 0 | Single Ally |
| 1 | All Allies |
| 2 | Self |
| 3 | Single Enemy |
| 4 | All Enemies |

---

### TC-05: Status Spell Effects
**Purpose**: Verify status effect spell editing.

**Prerequisites**:
- Sleep spell selected

**Steps**:
1. View Effect: Sleep
2. View Success Rate: 50%
3. Change Success Rate to 100%
4. Change Effect to Petrify
5. Apply and test

**Expected Results**:
- Status effect dropdown lists all statuses
- Success rate 0-100%
- Effect applies on successful hit
- Immune enemies still resist

---

### TC-06: Healing Spell Values
**Purpose**: Test cure spell power modification.

**Prerequisites**:
- Cure spell selected

**Steps**:
1. View Heal Power: 40
2. Change to 255 (max heal)
3. Apply changes
4. Cast Cure at low HP
5. Verify full restoration

**Expected Results**:
- Heal power determines HP restored
- Life spell restores from KO
- Exit spell has no power (fixed effect)
- Heal spell cures status (no HP value)

---

### TC-07: Animation Assignment
**Purpose**: Test spell animation changes.

**Prerequisites**:
- Thunder spell selected

**Steps**:
1. View Animation ID: 5 (lightning bolt)
2. Change to Animation ID: 2 (fire burst)
3. Apply changes
4. Cast Thunder in battle
5. Verify fire animation plays

**Expected Results**:
- Animation dropdown shows previews
- Animation doesn't affect damage
- Sound may not match animation
- No crash from invalid IDs

---

### TC-08: Spell Learning Progression
**Purpose**: Verify spell availability flags.

**Prerequisites**:
- Understanding of FFMQ story progression

**Steps**:
1. View Fire spell Required Flag: 0 (always available)
2. View Flare spell Required Flag: 5
3. Change Flare to flag 0
4. Start new game
5. Check if Flare available from start

**Expected Results**:
- Story flag determines availability
- Flag 0 = available from start
- Higher flags = later in game
- Changing flag grants early access

---

## 🔄 Regression Tests

### RT-01: Battle System Stability
**Purpose**: Ensure edited spells don't crash battles.

**Steps**:
1. Edit Meteor:
   - Power: 255
   - Element: All elements
   - Target: All Enemies
2. Build ROM
3. Cast Meteor in battle

**Expected Results**:
- Spell casts without crash
- Damage calculates correctly
- Animation completes
- Turn proceeds normally

---

### RT-02: Menu Display Integrity
**Purpose**: Verify spell menu displays correctly.

**Steps**:
1. Edit multiple spell properties
2. Build ROM
3. Open magic menu in-game
4. Scroll through all spells
5. Cast several spells

**Expected Results**:
- All spells display
- Names render correctly
- Categories sort properly
- No memory corruption

---

### RT-03: Partner Spell Compatibility
**Purpose**: Test spells work with partner characters.

**Steps**:
1. Edit White spell (partner-shared)
2. Build ROM
3. Enter battle with partner
4. Have partner cast edited spell

**Expected Results**:
- Partners use same spell data
- Edited stats apply to partner casts
- No different behavior for partners
- Partner AI handles new properties

---

## 📊 Spell Reference Data

### Complete Spell Table
| ID | Name | Category | Power | Element | Target |
|----|------|----------|-------|---------|--------|
| 00 | Fire | Black | 20 | Fire | Single Enemy |
| 01 | Blizzard | Black | 25 | Ice | Single Enemy |
| 02 | Thunder | Black | 30 | Thunder | Single Enemy |
| 03 | Quake | Black | 40 | Earth | All Enemies |
| 04 | Cure | White | 40 | Cure | Single Ally |
| 05 | Life | White | 100 | Cure | Single Ally (KO) |
| 06 | Heal | White | - | Support | Single Ally (Status) |
| 07 | Exit | White | - | Support | Party (Escape) |
| 08 | Aero | Wizard | 35 | Wind | All Enemies |
| 09 | Flare | Wizard | 50 | Fire | Single Enemy |
| 10 | Meteor | Wizard | 60 | None | All Enemies |
| 11 | White | Wizard | 200 | Holy | All Enemies |
| 12 | Sleep | Special | - | None | Single Enemy |
| 13 | Confuse | Special | - | None | Single Enemy |
| 14 | Silence | Special | - | None | Single Enemy |
| 15 | Death | Special | - | Fatal | Single Enemy |

---

## 🔧 Test Harness Code

### Spell Data Reader
```csharp
public class FfmqSpellReader {
	private const int SpellTableBase = 0x150000; // LoROM $D50000
	private const int SpellEntrySize = 12;
	private const int SpellCount = 16;
	
	public static FfmqSpell[] LoadSpells(RomFile rom) {
		var spells = new FfmqSpell[SpellCount];
		
		for (int i = 0; i < SpellCount; i++) {
			int offset = SpellTableBase + (i * SpellEntrySize);
			spells[i] = ReadSpell(rom, offset, i);
		}
		
		return spells;
	}
	
	private static FfmqSpell ReadSpell(RomFile rom, int offset, int id) {
		return new FfmqSpell {
			Id = id,
			Name = GetSpellName(id),
			BasePower = rom.ReadByte(offset),
			Elements = (ElementFlags)rom.ReadByte(offset + 1),
			EffectType = (SpellEffectType)rom.ReadByte(offset + 2),
			TargetType = (SpellTargetType)rom.ReadByte(offset + 3),
			AnimationId = rom.ReadByte(offset + 4),
			SoundId = rom.ReadByte(offset + 5),
			StatusEffectId = rom.ReadByte(offset + 6),
			StatusChance = rom.ReadByte(offset + 7),
			RequiredFlag = rom.ReadByte(offset + 8)
		};
	}
	
	private static string GetSpellName(int id) => id switch {
		0 => "Fire",
		1 => "Blizzard",
		2 => "Thunder",
		3 => "Quake",
		4 => "Cure",
		5 => "Life",
		6 => "Heal",
		7 => "Exit",
		8 => "Aero",
		9 => "Flare",
		10 => "Meteor",
		11 => "White",
		12 => "Sleep",
		13 => "Confuse",
		14 => "Silence",
		15 => "Death",
		_ => "???"
	};
}

public record FfmqSpell {
	public int Id { get; init; }
	public string Name { get; init; } = "";
	public int BasePower { get; init; }
	public ElementFlags Elements { get; init; }
	public SpellEffectType EffectType { get; init; }
	public SpellTargetType TargetType { get; init; }
	public int AnimationId { get; init; }
	public int SoundId { get; init; }
	public int StatusEffectId { get; init; }
	public int StatusChance { get; init; }
	public int RequiredFlag { get; init; }
}

public enum SpellEffectType : byte {
	Damage = 0,
	Heal = 1,
	HealStatus = 2,
	Revive = 3,
	Escape = 4,
	Status = 5,
	Buff = 6
}

public enum SpellTargetType : byte {
	SingleAlly = 0,
	AllAllies = 1,
	Self = 2,
	SingleEnemy = 3,
	AllEnemies = 4
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Loading | 1 | 0 |
| Power | 1 | 1 |
| Elements | 1 | 0 |
| Targeting | 1 | 0 |
| Status | 1 | 0 |
| Healing | 1 | 0 |
| Animations | 1 | 1 |
| Progression | 1 | 1 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- FFMQ magic has no MP cost - unlimited casting
- Spell damage scales with Magic Attack stat
- Partners share the same spell data
- White spell is strongest magic in game
- Some enemies completely immune to magic
- Status spells don't work on bosses
