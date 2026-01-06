# FFMQ SNES - Monster Editor Testing

Manual test cases for verifying Final Fantasy Mystic Quest monster data editing.

## 📋 System Overview

### Monster Data
- **Total Monsters**: ~60 unique enemies
- **Data Size**: Variable (stats + graphics pointers)
- **Graphics**: 4bpp SNES format, variable size
- **Palettes**: BGR555, unique per monster

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Monster Stats | $D18000+ | Base stats, elements |
| Monster Names | $D20000+ | Text table |
| Monster GFX | $C00000+ | Compressed sprites |
| Monster AI | $D30000+ | Battle scripts |

### Monster Categories
| Type | Count | Examples |
|------|-------|----------|
| Normal | ~40 | Brownie, Mint Mint, Sand Worm |
| Boss | ~15 | Dark King, Pazuzu, Dullahan |
| Final | 4 | Dark King phases |

---

## 🧪 Test Cases

### TC-01: Monster List Loading
**Purpose**: Verify complete monster roster loads correctly.

**Prerequisites**:
- FFMQ USA ROM loaded
- Monster Editor open

**Steps**:
1. Open Monster Editor
2. Verify monster list populates
3. Check monster count matches expected (~60)
4. Scroll through list to verify no gaps
5. Verify names display correctly

**Expected Results**:
- All monsters listed in order
- Names match original game
- No "????" or garbled entries
- List is scrollable and responsive

---

### TC-02: Base Stats Editing
**Purpose**: Test modification of monster base stats.

**Prerequisites**:
- Monster "Brownie" selected (ID 0)

**Steps**:
1. Select Brownie from list
2. View base stats:
   - HP: 20
   - Attack: 3
   - Defense: 1
   - Speed: 5
   - Magic: 1
3. Modify HP to 99
4. Click Apply/Save
5. Reload and verify persistence

**Expected Results**:
- Stats display in decimal by default
- Hex toggle shows 0x14 for HP 20
- Edit applies without corruption
- Other stats remain unchanged

**Stat Byte Layout**:
```
Offset  Size  Field
$00     2     HP (little-endian)
$02     1     Attack
$03     1     Defense
$04     1     Speed
$05     1     Magic Attack
$06     1     Magic Defense
$07     1     EXP reward (×10)
$08     2     GP reward
$0A     1     Drop item ID
$0B     1     Drop rate (1-255)
```

---

### TC-03: Elemental Properties
**Purpose**: Verify elemental weakness/resistance editing.

**Prerequisites**:
- Monster with known elemental properties selected

**Steps**:
1. Select "Freezer Crab" (ice element)
2. View element flags:
   - Weakness: Fire ✓
   - Resistance: Water ✓, Ice ✓
3. Toggle Fire resistance ON
4. Toggle Ice weakness ON
5. Apply and verify in-game

**Expected Results**:
- Element checkboxes match game data
- Multiple weaknesses/resistances allowed
- Changes persist after save
- In-game damage reflects changes

**Element Flags**:
```
Byte $0C: Weakness flags
  Bit 0: Fire
  Bit 1: Ice
  Bit 2: Thunder
  Bit 3: Earth
  Bit 4: Water
  Bit 5: Wind
  Bit 6: Cure (healed by cure spells)
  Bit 7: Fatal (vulnerable to instant death)

Byte $0D: Resistance flags (same bit layout)
```

---

### TC-04: Status Immunities
**Purpose**: Test status effect immunity flags.

**Prerequisites**:
- Boss monster selected (bosses typically immune to status)

**Steps**:
1. Select "Pazuzu" boss
2. View status immunities:
   - Poison: Immune ✓
   - Paralysis: Immune ✓
   - Confusion: Immune ✓
   - Sleep: Immune ✓
   - Petrify: Immune ✓
3. Remove Poison immunity
4. Apply and test in-game

**Expected Results**:
- All 8 status types editable
- Boss defaults show full immunity
- Toggle off allows status effects
- Changes persist correctly

**Status Flags**:
```
Byte $0E: Status immunity
  Bit 0: Poison
  Bit 1: Paralysis
  Bit 2: Confusion
  Bit 3: Sleep
  Bit 4: Silence
  Bit 5: Blind
  Bit 6: Petrify
  Bit 7: Death
```

---

### TC-05: AI Script Selection
**Purpose**: Verify AI behavior assignment.

**Prerequisites**:
- Monster editor with AI dropdown

**Steps**:
1. Select "Mint Mint" (simple AI)
2. View AI script ID
3. Change to "aggressive" script ID
4. Apply and test in-game behavior
5. Verify original AI can be restored

**Expected Results**:
- AI script dropdown lists all scripts
- Default AI matches original
- Changed AI affects battle behavior
- No crash from invalid AI ID

---

### TC-06: Monster Graphics Preview
**Purpose**: Test sprite rendering and editing.

**Prerequisites**:
- Monster with visible sprite data

**Steps**:
1. Select "Dark King" (large boss sprite)
2. View sprite preview panel
3. Verify sprite renders correctly
4. Check palette display (should be boss colors)
5. Test "Export Sprite..." function

**Expected Results**:
- Sprite displays at correct size
- Colors match in-game appearance
- Animation frames show (if applicable)
- Export produces valid PNG

**Sprite Data Format**:
```
FFMQ monsters use variable-size compressed 4bpp:
- Small enemies: 32×32 pixels (64 tiles)
- Medium enemies: 48×48 pixels (144 tiles)
- Large bosses: 64×64+ pixels (256+ tiles)

Header:
  Byte 0-2: Pointer to compressed graphics
  Byte 3-4: Width, Height (in 8×8 tiles)
  Byte 5-6: Palette pointer
```

---

### TC-07: Drop Table Editing
**Purpose**: Test item drop configuration.

**Prerequisites**:
- Monster with known drop (e.g., Brownie drops Cure potion rarely)

**Steps**:
1. Select Brownie
2. View drop fields:
   - Item ID: Cure Potion
   - Drop Rate: 8 (3.1%)
3. Change Item ID to Elixir
4. Change Drop Rate to 128 (50%)
5. Apply and farm monster in-game

**Expected Results**:
- Item dropdown shows all items
- Drop rate slider/input 0-255
- Higher rate = more frequent drops
- Item ID 0 = no drop

**Drop Rate Formula**:
```
Probability = DropRate / 256
Rate 1   = 0.4%
Rate 64  = 25%
Rate 128 = 50%
Rate 255 = 99.6%
```

---

### TC-08: Bulk Monster Operations
**Purpose**: Test batch editing functionality.

**Prerequisites**:
- Monster Editor with multi-select

**Steps**:
1. Select multiple monsters (Shift+Click)
2. Click "Bulk Edit..."
3. Set "HP ×2" modifier
4. Apply to selection
5. Verify all selected monsters updated

**Expected Results**:
- Multi-select highlights all
- Bulk dialog shows applicable fields
- Multiplier applies correctly
- Undo reverts all changes

---

## 🔄 Regression Tests

### RT-01: Boss Battle Stability
**Purpose**: Ensure edited bosses don't crash game.

**Steps**:
1. Edit Dark King:
   - Set HP to 65535
   - Set all immunities
   - Change AI script
2. Build ROM
3. Fight Dark King in-game
4. Complete battle

**Expected Results**:
- Boss loads correctly
- HP displays/decreases properly
- AI script executes
- Victory doesn't crash

---

### RT-02: Encounter Table Integration
**Purpose**: Verify edited monsters appear in encounters.

**Steps**:
1. Edit Brownie stats significantly
2. Build ROM
3. Load game at Foresta region
4. Trigger random encounter
5. Verify Brownie uses new stats

**Expected Results**:
- Encounter loads without error
- Monster displays new stats
- Battle proceeds normally
- EXP/GP rewards reflect changes

---

### RT-03: Graphics Pointer Integrity
**Purpose**: Test that graphics pointers remain valid.

**Steps**:
1. View 5+ monsters sequentially
2. Export each monster's sprite
3. Re-import sprites
4. Build ROM
5. View monsters in-game

**Expected Results**:
- All sprites export correctly
- Re-import matches original
- In-game graphics unchanged
- No glitched sprites

---

## 📊 Monster Data Reference

### Full Monster Entry Structure
```
FFMQ Monster Entry (~32 bytes):

Offset  Size  Description
$00     2     Max HP
$02     1     Attack Power
$03     1     Defense
$04     1     Speed (turn order)
$05     1     Magic Attack
$06     1     Magic Defense
$07     1     EXP reward (÷10 stored)
$08     2     GP reward
$0A     1     Item drop ID
$0B     1     Drop rate (0-255)
$0C     1     Elemental weakness flags
$0D     1     Elemental resistance flags
$0E     1     Status immunity flags
$0F     1     AI script ID
$10     3     Graphics data pointer
$13     3     Palette pointer
$16     2     Sprite dimensions
$18+    var   Reserved/padding
```

### Boss Flag
```
Bosses are flagged separately in encounter data:
- Byte $1F bit 7: Is Boss (no flee, special music)
```

---

## 🔧 Test Harness Code

### Monster Data Reader
```csharp
public class FfmqMonsterReader {
	private const int MonsterTableBase = 0x118000; // LoROM $D18000
	private const int MonsterEntrySize = 0x20;
	private const int MonsterCount = 60;
	
	public static FfmqMonster[] LoadAllMonsters(RomFile rom) {
		var monsters = new FfmqMonster[MonsterCount];
		
		for (int i = 0; i < MonsterCount; i++) {
			int offset = MonsterTableBase + (i * MonsterEntrySize);
			monsters[i] = ReadMonster(rom, offset, i);
		}
		
		return monsters;
	}
	
	private static FfmqMonster ReadMonster(RomFile rom, int offset, int id) {
		return new FfmqMonster {
			Id = id,
			MaxHP = rom.ReadUInt16(offset),
			Attack = rom.ReadByte(offset + 2),
			Defense = rom.ReadByte(offset + 3),
			Speed = rom.ReadByte(offset + 4),
			MagicAttack = rom.ReadByte(offset + 5),
			MagicDefense = rom.ReadByte(offset + 6),
			ExpReward = rom.ReadByte(offset + 7) * 10,
			GoldReward = rom.ReadUInt16(offset + 8),
			DropItemId = rom.ReadByte(offset + 10),
			DropRate = rom.ReadByte(offset + 11),
			Weaknesses = (ElementFlags)rom.ReadByte(offset + 12),
			Resistances = (ElementFlags)rom.ReadByte(offset + 13),
			StatusImmunities = (StatusFlags)rom.ReadByte(offset + 14),
			AiScriptId = rom.ReadByte(offset + 15),
			GraphicsPointer = rom.ReadUInt24(offset + 16),
			PalettePointer = rom.ReadUInt24(offset + 19)
		};
	}
}

public record FfmqMonster {
	public int Id { get; init; }
	public int MaxHP { get; init; }
	public int Attack { get; init; }
	public int Defense { get; init; }
	public int Speed { get; init; }
	public int MagicAttack { get; init; }
	public int MagicDefense { get; init; }
	public int ExpReward { get; init; }
	public int GoldReward { get; init; }
	public int DropItemId { get; init; }
	public int DropRate { get; init; }
	public ElementFlags Weaknesses { get; init; }
	public ElementFlags Resistances { get; init; }
	public StatusFlags StatusImmunities { get; init; }
	public int AiScriptId { get; init; }
	public int GraphicsPointer { get; init; }
	public int PalettePointer { get; init; }
}

[Flags]
public enum ElementFlags : byte {
	None = 0,
	Fire = 0x01,
	Ice = 0x02,
	Thunder = 0x04,
	Earth = 0x08,
	Water = 0x10,
	Wind = 0x20,
	Cure = 0x40,
	Fatal = 0x80
}

[Flags]
public enum StatusFlags : byte {
	None = 0,
	Poison = 0x01,
	Paralysis = 0x02,
	Confusion = 0x04,
	Sleep = 0x08,
	Silence = 0x10,
	Blind = 0x20,
	Petrify = 0x40,
	Death = 0x80
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Stats | 2 | 1 |
| Elements | 1 | 0 |
| Status | 1 | 0 |
| AI | 1 | 0 |
| Graphics | 1 | 1 |
| Drops | 1 | 0 |
| Bulk | 1 | 1 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- FFMQ monster system is simpler than FF series
- No MP costs - magic is unlimited
- Weapon-based element system (axes = earth, etc.)
- Bosses have multi-phase battles (4 Dark King forms)
- Some monsters share graphics but different palettes
