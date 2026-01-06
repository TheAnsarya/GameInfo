# DQ4r SNES - Monster Editor Testing

Manual test cases for Dragon Quest IV Remake (SNES) monster data editing.

## 📋 System Overview

### Monster Data
- **Total Monsters**: ~200 enemies
- **Data Size**: ~32 bytes per entry
- **Graphics**: 4bpp compressed sprites
- **Platform**: Super Famicom (Japan-only)

### DQ4r vs DQ3r Differences
| Feature | DQ3r | DQ4r |
|---------|------|------|
| Monster Count | 155 | ~200 |
| AI System | Simple | Chapter-based |
| Resistances | 8 elements | 8 elements + chapter flags |
| Drop System | Single item | Double drop |

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Monster Stats | $E60000+ | Base stats, elements |
| Monster Names | $E70000+ | Text table (Shift-JIS) |
| Monster GFX | $D00000+ | Compressed sprites |
| AI Scripts | $E80000+ | Battle behaviors |
| Chapter Data | $E90000+ | Chapter-specific overrides |

---

## 🧪 Test Cases

### TC-01: Monster List Loading
**Purpose**: Verify complete monster roster loads correctly.

**Prerequisites**:
- DQ4r SFC ROM loaded
- Monster Editor open

**Steps**:
1. Open Monster Editor
2. Verify monster list populates (~200 entries)
3. Check for Chapter 1-5 monster variants
4. Verify Japanese names display (Shift-JIS)
5. Scroll through to verify no gaps

**Expected Results**:
- All monsters listed with proper IDs
- Japanese text renders correctly
- Chapter variants identified (e.g., "スライム [Ch1]")
- No "????" or garbled entries

---

### TC-02: Base Stats Editing
**Purpose**: Test modification of monster base stats.

**Prerequisites**:
- Slime monster selected (ID 0)

**Steps**:
1. Select スライム (Slime) from list
2. View base stats:
   - HP: ~8
   - Attack: ~5
   - Defense: ~2
   - Agility: ~3
   - MP: 0
3. Modify HP to 255
4. Apply and verify persistence

**Expected Results**:
- Stats display correctly
- Hex toggle available
- Edit applies without corruption
- Other monsters unchanged

**Stat Layout (32 bytes)**:
```
Offset  Size  Field
$00     2     HP (little-endian)
$02     2     MP
$04     2     Attack
$06     2     Defense
$08     2     Agility
$0A     2     Wisdom (magic power)
$0C     1     EXP multiplier
$0D     1     Gold multiplier
$0E     1     Drop 1 ID
$0F     1     Drop 1 Rate
$10     1     Drop 2 ID
$11     1     Drop 2 Rate
$12     2     Element weakness
$14     2     Element resistance
$16     1     Status immunities
$17     1     AI script ID
$18     2     Sprite pointer (low)
$1A     1     Sprite pointer (high)
$1B     1     Palette ID
$1C     4     Reserved/Chapter flags
```

---

### TC-03: Element Resistance System
**Purpose**: Verify 8-element weakness/resistance editing.

**Prerequisites**:
- Monster with known elemental properties

**Steps**:
1. Select Ice monster (e.g., ブリザードマン)
2. View element flags:
   - Weakness: Fire, Zap ✓
   - Resistance: Ice, Blizzard ✓
3. Toggle Fire resistance ON
4. Apply and test in-game

**Expected Results**:
- 8 element types available
- Multiple weaknesses/resistances allowed
- Breath attacks separate from spell elements
- Changes persist after save

**Element Flags (16-bit)**:
```
Bit 0:  Fire (spell)
Bit 1:  Ice (spell)
Bit 2:  Zap (lightning)
Bit 3:  Woosh (wind)
Bit 4:  Bang (explosion)
Bit 5:  Sizz (fire breath)
Bit 6:  Crack (ice breath)
Bit 7:  Frizz (single fire)
Bit 8:  Snooze
Bit 9:  Whack (instant death)
Bit 10: Kaclang
Bit 11: Drain
Bit 12: Dazzle
Bit 13: Sap
Bit 14: Fizzle
Bit 15: Reserved
```

---

### TC-04: Chapter-Specific Stats
**Purpose**: Test chapter-based stat overrides.

**Prerequisites**:
- Understanding of DQ4's chapter system

**Steps**:
1. Select monster that appears in multiple chapters
2. View Chapter 1 stats
3. View Chapter 5 stats (should be scaled)
4. Edit Chapter 2 override
5. Verify only Chapter 2 affected

**Expected Results**:
- Base stats × chapter multiplier shown
- Per-chapter overrides editable
- Chapter 5 (main game) uses base stats
- Prologue uses different scaling

**Chapter Multipliers**:
```
Chapter 1 (Ragnar): 0.5x
Chapter 2 (Alena): 0.6x
Chapter 3 (Torneko): 0.7x
Chapter 4 (Meena/Maya): 0.8x
Chapter 5 (Hero): 1.0x
Bonus Dungeon: 1.5x
```

---

### TC-05: AI Script Selection
**Purpose**: Verify battle AI behavior assignment.

**Prerequisites**:
- Monster editor with AI dropdown

**Steps**:
1. Select Healslime (uses healing AI)
2. View AI script ID: Healer
3. Change to Aggressive script
4. Apply and test in battle
5. Verify healing removed, attacks used

**Expected Results**:
- AI dropdown lists all scripts
- Script preview shows behavior
- Changed AI affects battle
- No crash from invalid AI

**Common AI Scripts**:
| ID | Behavior |
|----|----------|
| 00 | Attack only |
| 01 | Attack + defend |
| 02 | Spell caster |
| 03 | Healer |
| 04 | Buffer (sap/defense) |
| 05 | Mixed offensive |
| 06 | Boss pattern |

---

### TC-06: Double Drop System
**Purpose**: Test DQ4r's two-item drop system.

**Prerequisites**:
- Monster with known drops

**Steps**:
1. Select Metal Slime (rare drops)
2. View Drop 1: メタルのかけら (Metal Shard) @ 1/256
3. View Drop 2: ちいさなメダル (Mini Medal) @ 1/4096
4. Swap drop items
5. Change Drop 2 rate to 128/256
6. Test in-game farming

**Expected Results**:
- Two drop slots visible
- Item dropdowns show all items
- Rate sliders 0-255
- Both drops can trigger simultaneously

---

### TC-07: Monster Graphics Preview
**Purpose**: Test sprite rendering and palette.

**Prerequisites**:
- Monster with visible sprite data

**Steps**:
1. Select Demon (large sprite)
2. View sprite preview
3. Verify palette matches (dark colors)
4. Export sprite as PNG
5. Check animation frames (if available)

**Expected Results**:
- Sprite decompresses correctly
- Palette applied properly
- Multiple poses visible (idle, attack)
- Export preserves quality

---

### TC-08: Status Immunity Editing
**Purpose**: Test status effect immunity flags.

**Prerequisites**:
- Boss monster selected (high immunities)

**Steps**:
1. Select Psaro the Manslayer (final boss)
2. View immunities:
   - Sleep: Immune ✓
   - Confusion: Immune ✓
   - All status: Immune ✓
3. Remove Sleep immunity
4. Test Sleep spell on boss

**Expected Results**:
- All status types editable
- Bosses default to full immunity
- Removal enables status effects
- Works in all battle phases

---

## 🔄 Regression Tests

### RT-01: Chapter Transition Stability
**Purpose**: Ensure edited monsters don't break chapter changes.

**Steps**:
1. Edit monster appearing in Chapters 1 and 5
2. Build ROM
3. Play through Chapter 1
4. Complete chapter and transition
5. Re-encounter monster in Chapter 5

**Expected Results**:
- No crash at chapter transition
- Stats scale appropriately
- Graphics load correctly
- Battle proceeds normally

---

### RT-02: Boss Battle Integrity
**Purpose**: Verify edited bosses function in story battles.

**Steps**:
1. Edit Balzack (Chapter 4 boss):
   - Reduce HP by 50%
   - Change AI to aggressive
2. Build ROM
3. Fight Balzack in story
4. Complete battle

**Expected Results**:
- Boss spawns correctly
- HP change reflected
- AI change affects behavior
- Victory triggers story event

---

### RT-03: Recruit Monster Compatibility
**Purpose**: Test wagon/party monster systems (DQ4 monster recruitment).

**Steps**:
1. Edit recruitable monster stats
2. Build ROM
3. Recruit monster to wagon
4. Use in battle
5. Verify stats match edits

**Expected Results**:
- Recruited monsters use edited stats
- Party system handles changes
- No memory corruption
- Save/load preserves edits

---

## 📊 Monster Reference Data

### Boss Monster IDs
| ID | Name (JP) | Name (EN) | Chapter |
|----|-----------|-----------|---------|
| 180 | ピサロナイト | Psaro's Pawn | 4 |
| 185 | バルザック | Balzack | 4 |
| 190 | キングレオ | Keeleon | 4 |
| 195 | エスターク | Estark | 5 |
| 198 | デスピサロ | Psaro | 5 |

### Monster Families
| Family | Count | ID Range |
|--------|-------|----------|
| Slimes | 15 | 0-14 |
| Beasts | 25 | 15-39 |
| Demons | 30 | 40-69 |
| Undead | 25 | 70-94 |
| Dragons | 20 | 95-114 |
| Elements | 20 | 115-134 |
| Machines | 15 | 135-149 |
| Humanoids | 25 | 150-174 |
| Bosses | 25 | 175-199 |

---

## 🔧 Test Harness Code

### DQ4r Monster Reader
```csharp
public class Dq4rMonsterReader {
	private const int MonsterTableBase = 0x260000; // Approximate
	private const int MonsterEntrySize = 0x20;
	private const int MonsterCount = 200;

	public static Dq4rMonster[] LoadAllMonsters(RomFile rom) {
		var monsters = new Dq4rMonster[MonsterCount];

		for (int i = 0; i < MonsterCount; i++) {
			int offset = MonsterTableBase + (i * MonsterEntrySize);
			monsters[i] = ReadMonster(rom, offset, i);
		}

		return monsters;
	}

	private static Dq4rMonster ReadMonster(RomFile rom, int offset, int id) {
		return new Dq4rMonster {
			Id = id,
			MaxHP = rom.ReadUInt16(offset),
			MaxMP = rom.ReadUInt16(offset + 2),
			Attack = rom.ReadUInt16(offset + 4),
			Defense = rom.ReadUInt16(offset + 6),
			Agility = rom.ReadUInt16(offset + 8),
			Wisdom = rom.ReadUInt16(offset + 10),
			ExpMultiplier = rom.ReadByte(offset + 12),
			GoldMultiplier = rom.ReadByte(offset + 13),
			Drop1Id = rom.ReadByte(offset + 14),
			Drop1Rate = rom.ReadByte(offset + 15),
			Drop2Id = rom.ReadByte(offset + 16),
			Drop2Rate = rom.ReadByte(offset + 17),
			Weaknesses = rom.ReadUInt16(offset + 18),
			Resistances = rom.ReadUInt16(offset + 20),
			StatusImmunities = rom.ReadByte(offset + 22),
			AiScriptId = rom.ReadByte(offset + 23),
			SpritePointer = rom.ReadUInt24(offset + 24),
			PaletteId = rom.ReadByte(offset + 27),
			ChapterFlags = rom.ReadUInt32(offset + 28)
		};
	}
}

public record Dq4rMonster {
	public int Id { get; init; }
	public int MaxHP { get; init; }
	public int MaxMP { get; init; }
	public int Attack { get; init; }
	public int Defense { get; init; }
	public int Agility { get; init; }
	public int Wisdom { get; init; }
	public int ExpMultiplier { get; init; }
	public int GoldMultiplier { get; init; }
	public int Drop1Id { get; init; }
	public int Drop1Rate { get; init; }
	public int Drop2Id { get; init; }
	public int Drop2Rate { get; init; }
	public int Weaknesses { get; init; }
	public int Resistances { get; init; }
	public int StatusImmunities { get; init; }
	public int AiScriptId { get; init; }
	public int SpritePointer { get; init; }
	public int PaletteId { get; init; }
	public uint ChapterFlags { get; init; }
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Loading | 1 | 0 |
| Stats | 1 | 0 |
| Elements | 1 | 0 |
| Chapters | 1 | 1 |
| AI | 1 | 0 |
| Drops | 1 | 0 |
| Graphics | 1 | 1 |
| Status | 1 | 1 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- DQ4r is Japan-only (Super Famicom)
- Uses DQ3 SNES engine with modifications
- Chapter system affects monster scaling
- Some monsters exclusive to specific chapters
- Wagon system allows large party management
- Translation patches exist but may shift addresses
