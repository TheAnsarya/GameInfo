# DQ4r SNES - Spell Editor Testing

Manual test cases for Dragon Quest IV Remake (SNES) spell/magic data editing.

## 📋 System Overview

### Magic System
- **Total Spells**: ~80 spells
- **Data Size**: ~12 bytes per entry
- **Categories**: Attack, Heal, Support, Field, Enemy-only
- **MP System**: Traditional MP costs (DQ style)

### DQ4r Magic Features
| Feature | Description |
|---------|-------------|
| Spell Levels | Some spells have multiple tiers (Heal → Midheal → Fullheal) |
| Character Learning | Preset spell lists per character level |
| Enemy Spells | Monsters use same spell data but different targeting |
| Breath Attacks | Separate from spells, element-based |

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Spell Data | $E30000+ | Power, cost, element |
| Spell Names | $E38000+ | Text (Shift-JIS) |
| Learning Tables | $E3C000+ | Who learns what at which level |
| Animation Data | $E3E000+ | Battle animation IDs |
| AI Spell Usage | $E80000+ | Monster spell selection |

---

## 🧪 Test Cases

### TC-01: Spell List Loading
**Purpose**: Verify complete spell roster loads correctly.

**Prerequisites**:
- DQ4r SFC ROM loaded
- Spell Editor open

**Steps**:
1. Open Spell Editor
2. Verify spell list populates (~80 entries)
3. Check category tabs (Attack, Heal, Support)
4. Verify Japanese names display correctly
5. Check MP costs visible

**Expected Results**:
- All spells listed with proper IDs
- Categories organize correctly
- Japanese text renders (Shift-JIS)
- MP costs shown for each spell
- Enemy-only spells identified

---

### TC-02: Spell Power Editing
**Purpose**: Test spell damage/healing power modification.

**Prerequisites**:
- Attack spell selected

**Steps**:
1. Select メラ (Frizz/Blaze)
2. View stats:
   - Base Power: ~15
   - MP Cost: 2
   - Element: Fire
3. Change Base Power to 100
4. Apply and test in battle
5. Verify damage increase

**Expected Results**:
- Power accepts 0-255
- Damage formula applies power
- Element affects weak enemies
- No overflow on high power

**Spell Data Format (12 bytes)**:
```
Offset  Size  Field
$00     1     Spell type (attack/heal/support)
$01     1     Base power
$02     1     MP cost
$03     1     Target type
$04     1     Element flags
$05     1     Status effect ID
$06     1     Status chance
$07     1     Animation ID
$08     1     Sound effect ID
$09     1     Range (for area spells)
$0A     2     Reserved/flags
```

---

### TC-03: MP Cost Modification
**Purpose**: Test spell MP cost changes.

**Prerequisites**:
- Powerful spell selected

**Steps**:
1. Select ギガデイン (Kazap/Thordain)
2. View MP Cost: 30
3. Change to 1 MP
4. Apply and test in battle
5. Verify can cast multiple times

**Expected Results**:
- MP cost accepts 0-255
- 0 cost = free casting
- Menu shows new cost
- Character MP deducted correctly

---

### TC-04: Healing Spell Values
**Purpose**: Test cure spell modification.

**Prerequisites**:
- Healing spell selected

**Steps**:
1. Select ホイミ (Heal)
2. View Heal Amount: ~30 HP
3. Change to 255 HP
4. Apply and test in battle
5. Verify full heal on any character

**Expected Results**:
- Heal value accepts 0-255
- Healing applies to target
- Menu shows correct cost
- Overhealing caps at max HP

---

### TC-05: Element Assignment
**Purpose**: Verify spell element editing.

**Prerequisites**:
- Single-element spell selected

**Steps**:
1. Select ヒャド (Crack/Icebolt)
2. View Element: Ice ✓
3. Add Fire element
4. Apply and test on ice monster
5. Verify damage not resisted

**Expected Results**:
- Multiple elements assignable
- Damage checks all elements
- Weakness/resistance applies
- Animation may not match element

**Element Flags**:
```
Bit 0: Fire (メラ系)
Bit 1: Ice (ヒャド系)
Bit 2: Lightning (デイン系)
Bit 3: Wind (バギ系)
Bit 4: Explosion (イオ系)
Bit 5: Earth (ジバリア系)
Bit 6: Holy (none resist)
Bit 7: Dark/Death (即死)
```

---

### TC-06: Target Type Modification
**Purpose**: Test spell targeting changes.

**Prerequisites**:
- Single-target spell selected

**Steps**:
1. Select ホイミ (Heal)
2. View Target: Single Ally
3. Change to All Allies
4. Apply and cast in battle
5. Verify whole party healed

**Expected Results**:
- Target dropdown works
- Changed targeting in battle
- Healing splits or full amount
- No crash on invalid target

**Target Types**:
| ID | Target |
|----|--------|
| 00 | Single Ally |
| 01 | All Allies |
| 02 | Self |
| 03 | Single Enemy |
| 04 | All Enemies |
| 05 | Enemy Group |
| 06 | Random Enemy |

---

### TC-07: Character Learning Tables
**Purpose**: Test spell learning level changes.

**Prerequisites**:
- Spell editor with learning view

**Steps**:
1. View Alena's spell list (she learns no spells)
2. Add ホイミ at level 5
3. Apply changes
4. Start new game, level Alena to 5
5. Check if she learned Heal

**Expected Results**:
- Learning table editable
- Level can be 1-99
- Character gains spell at level up
- No duplicate entries

**Learning Table Format**:
```
Per character entry:
  Byte 0: Spell ID
  Byte 1: Learn level
  Byte 2: Spell ID
  Byte 3: Learn level
  ... (up to 20 spells per character)
  FF FF: End marker
```

---

### TC-08: Status Effect Spells
**Purpose**: Test status-inflicting spell editing.

**Prerequisites**:
- Status spell selected

**Steps**:
1. Select ラリホー (Snooze/Sleep)
2. View Status: Sleep
3. View Success Rate: 50%
4. Change to 100%
5. Change status to Paralysis
6. Apply and test

**Expected Results**:
- Status dropdown lists all types
- Success rate slider 0-100%
- New status applies on cast
- Immune targets still resist

---

## 🔄 Regression Tests

### RT-01: Party Spell Menu Integrity
**Purpose**: Ensure spell changes display correctly.

**Steps**:
1. Edit multiple spell properties
2. Edit learning tables
3. Build ROM
4. Open spell menu for each character
5. Cast various spells

**Expected Results**:
- Spell lists accurate
- MP costs correct
- Effects work as edited
- No menu corruption

---

### RT-02: Boss Battle Spells
**Purpose**: Verify boss spell usage works.

**Steps**:
1. Edit enemy-only spell (boss attack)
2. Build ROM
3. Fight boss using that spell
4. Verify spell animates and damages

**Expected Results**:
- Boss uses spell correctly
- Animation plays
- Damage applies
- No crash or freeze

---

### RT-03: Spell Learning Progression
**Purpose**: Test full character spell progression.

**Steps**:
1. Edit Kiryl (クリフト) spell list:
   - Add powerful spell at low level
   - Remove existing spell
2. Build ROM
3. Level Kiryl through edited range
4. Verify correct spells learned

**Expected Results**:
- Original spell removed
- New spell added at correct level
- No missing spells
- Menu updates correctly

---

## 📊 Spell Reference Data

### Spell Categories
| Category | ID Range | Examples |
|----------|----------|----------|
| Attack (Fire) | 01-10 | メラ, メラミ, メラゾーマ |
| Attack (Ice) | 11-20 | ヒャド, ヒャダルコ, マヒャド |
| Attack (Lightning) | 21-25 | ライデイン, ギガデイン |
| Attack (Wind) | 26-30 | バギ, バギマ, バギクロス |
| Attack (Explosion) | 31-35 | イオ, イオラ, イオナズン |
| Healing | 36-45 | ホイミ, ベホイミ, ベホマ, ザオラル |
| Support | 46-60 | スカラ, バイキルト, ルカニ |
| Field | 61-70 | ルーラ, リレミト, トヘロス |
| Status | 71-80 | ラリホー, メダパニ, ニフラム |

### Character Spell Lists
| Character | Learning? | Spell Types |
|-----------|-----------|-------------|
| Hero (勇者) | Yes | All types, ultimate spells |
| Ragnar (ライアン) | No | - |
| Alena (アリーナ) | No | - |
| Kiryl (クリフト) | Yes | Healing, Support |
| Borya (ブライ) | Yes | Attack (Ice, Wind) |
| Torneko (トルネコ) | No | - |
| Meena (ミネア) | Yes | Healing, Support, Fortune |
| Maya (マーニャ) | Yes | Attack (Fire, Explosion) |

### Spell Tier Progression
| Tier | Fire | Ice | Lightning | Heal |
|------|------|-----|-----------|------|
| 1 | メラ (8) | ヒャド (6) | - | ホイミ (~30) |
| 2 | メラミ (40) | ヒャダルコ (30) | ライデイン (80) | ベホイミ (~80) |
| 3 | メラゾーマ (180) | マヒャド (100) | ギガデイン (200) | ベホマ (Full) |

---

## 🔧 Test Harness Code

### DQ4r Spell Reader
```csharp
public class Dq4rSpellReader {
	private const int SpellTableBase = 0x230000; // Approximate
	private const int SpellEntrySize = 0x0C;
	private const int SpellCount = 80;

	public static Dq4rSpell[] LoadAllSpells(RomFile rom) {
		var spells = new Dq4rSpell[SpellCount];

		for (int i = 0; i < SpellCount; i++) {
			int offset = SpellTableBase + (i * SpellEntrySize);
			spells[i] = ReadSpell(rom, offset, i);
		}

		return spells;
	}

	private static Dq4rSpell ReadSpell(RomFile rom, int offset, int id) {
		return new Dq4rSpell {
			Id = id,
			Type = (SpellType)rom.ReadByte(offset),
			BasePower = rom.ReadByte(offset + 1),
			MpCost = rom.ReadByte(offset + 2),
			TargetType = (TargetType)rom.ReadByte(offset + 3),
			Elements = (ElementFlags)rom.ReadByte(offset + 4),
			StatusEffectId = rom.ReadByte(offset + 5),
			StatusChance = rom.ReadByte(offset + 6),
			AnimationId = rom.ReadByte(offset + 7),
			SoundId = rom.ReadByte(offset + 8),
			Range = rom.ReadByte(offset + 9)
		};
	}
}

public record Dq4rSpell {
	public int Id { get; init; }
	public SpellType Type { get; init; }
	public int BasePower { get; init; }
	public int MpCost { get; init; }
	public TargetType TargetType { get; init; }
	public ElementFlags Elements { get; init; }
	public int StatusEffectId { get; init; }
	public int StatusChance { get; init; }
	public int AnimationId { get; init; }
	public int SoundId { get; init; }
	public int Range { get; init; }
}

public enum SpellType : byte {
	Attack = 0,
	Heal = 1,
	Support = 2,
	Field = 3,
	Status = 4,
	Special = 5
}

public enum TargetType : byte {
	SingleAlly = 0,
	AllAllies = 1,
	Self = 2,
	SingleEnemy = 3,
	AllEnemies = 4,
	EnemyGroup = 5,
	RandomEnemy = 6
}

[Flags]
public enum ElementFlags : byte {
	None = 0,
	Fire = 0x01,
	Ice = 0x02,
	Lightning = 0x04,
	Wind = 0x08,
	Explosion = 0x10,
	Earth = 0x20,
	Holy = 0x40,
	Dark = 0x80
}
```

### Character Learning Table Reader
```csharp
public class Dq4rLearningTableReader {
	private const int LearningTableBase = 0x23C000; // Approximate
	private const int MaxSpellsPerChar = 20;

	public static Dictionary<int, List<SpellLearning>> LoadLearningTables(RomFile rom) {
		var tables = new Dictionary<int, List<SpellLearning>>();

		// 8 playable characters
		for (int charId = 0; charId < 8; charId++) {
			int offset = LearningTableBase + (charId * MaxSpellsPerChar * 2);
			tables[charId] = ReadCharacterSpells(rom, offset);
		}

		return tables;
	}

	private static List<SpellLearning> ReadCharacterSpells(RomFile rom, int offset) {
		var spells = new List<SpellLearning>();

		for (int i = 0; i < MaxSpellsPerChar; i++) {
			var spellId = rom.ReadByte(offset + (i * 2));
			var level = rom.ReadByte(offset + (i * 2) + 1);

			if (spellId == 0xFF) break; // End marker

			spells.Add(new SpellLearning {
				SpellId = spellId,
				LearnLevel = level
			});
		}

		return spells;
	}
}

public record SpellLearning {
	public int SpellId { get; init; }
	public int LearnLevel { get; init; }
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Loading | 1 | 0 |
| Power | 1 | 0 |
| MP Cost | 1 | 0 |
| Healing | 1 | 0 |
| Elements | 1 | 0 |
| Targeting | 1 | 0 |
| Learning | 1 | 1 |
| Status | 1 | 2 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- DQ4r uses DQ3 spell system as base
- Some spells are chapter-restricted
- Breath attacks are separate from spells
- Monster spells use same data but different AI
- Spell animations tied to IDs (changing may desync)
- Level 99 cap for learning tables
