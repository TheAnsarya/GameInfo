# FFMQ SNES - Item & Weapon Editor Testing

Manual test cases for verifying Final Fantasy Mystic Quest item and weapon editing.

## 📋 System Overview

### Inventory System
- **Consumables**: ~15 items (Cure Potions, Seeds, etc.)
- **Weapons**: 4 categories × 4 levels = 16 weapons
- **Armor**: 4 slots × 4 levels = 16 armor pieces
- **Accessories**: 4 special items

### Weapon Categories
| Category | Progression | Element |
|----------|-------------|---------|
| Swords | Steel → Knight → Excalibur → Dragon | None |
| Axes | Battleaxe → Great → Giant → Zeus | Earth |
| Claws | Cat → Charm → Dragon → Gemini | Fire |
| Bombs | Bombs → Mega → Jumbo → Super | Neutral |

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Item Data | $D28000+ | Consumable definitions |
| Weapon Stats | $D2A000+ | Attack power, elements |
| Armor Stats | $D2C000+ | Defense values |
| Item Names | $D40000+ | Text pointers |
| Item GFX | $C40000+ | Menu icons |

---

## 🧪 Test Cases

### TC-01: Weapon Stats Loading
**Purpose**: Verify weapon data loads correctly.

**Prerequisites**:
- FFMQ ROM loaded
- Item/Weapon Editor open

**Steps**:
1. Open Item Editor
2. Select "Weapons" tab
3. Select "Steel Sword" (first weapon)
4. Verify displayed stats:
   - Attack Power: 10
   - Element: None
   - Special: None

**Expected Results**:
- All 16 weapons listed
- Stats match original game
- Weapon icons display correctly
- Category grouping visible

---

### TC-02: Weapon Power Editing
**Purpose**: Test attack power modification.

**Prerequisites**:
- Steel Sword selected

**Steps**:
1. View Attack Power: 10
2. Change to 99
3. Click Apply
4. Reload weapon data
5. Verify change persisted

**Expected Results**:
- Attack value accepts 0-255
- In-game damage reflects change
- Other weapon stats unchanged
- Progression still works (upgrade path)

**Weapon Data Format**:
```
Weapon Entry (8 bytes):
Offset  Size  Field
$00     1     Attack Power
$01     1     Element flags
$02     1     Special effect ID
$03     1     Menu icon ID
$04     1     Equip slot (sword=0, axe=1, claw=2, bomb=3)
$05     1     Required level (0 = always available)
$06     2     Reserved
```

---

### TC-03: Elemental Assignment
**Purpose**: Verify weapon element editing.

**Prerequisites**:
- Zeus Axe selected (earth element weapon)

**Steps**:
1. View Element: Earth ✓
2. Add Fire element
3. Apply changes
4. Test in-game against fire-weak enemy

**Expected Results**:
- Multiple elements allowed
- Damage applies both element checks
- Visual effect may not change (graphics separate)
- Status shows combined elements

---

### TC-04: Armor Stats Editing
**Purpose**: Test defense value modification.

**Prerequisites**:
- Armor tab selected, Steel Armor visible

**Steps**:
1. Select Steel Armor (ID 0)
2. View Defense: 5
3. Change to 50
4. View element resistance: None
5. Add Ice resistance
6. Apply and test

**Expected Results**:
- Defense value affects damage taken
- Element resistance reduces elemental damage
- All 4 armor slots editable (helmet, armor, shield, accessory)
- Changes persist across save

**Armor Data Format**:
```
Armor Entry (6 bytes):
Offset  Size  Field
$00     1     Defense Power
$01     1     Magic Defense
$02     1     Element resistance flags
$03     1     Status resistance flags
$04     1     Equip slot (0-3)
$05     1     Reserved
```

---

### TC-05: Consumable Item Effects
**Purpose**: Test item effect modification.

**Prerequisites**:
- Consumables tab selected

**Steps**:
1. Select "Cure Potion"
2. View Heal Amount: 40
3. Change to 200 (full heal)
4. Apply and use in-game
5. Verify HP restored matches

**Expected Results**:
- Heal values 0-255
- Effect ID changes behavior type
- Item can be set to multi-target
- MP restoration items work similarly

**Consumable Data Format**:
```
Item Entry (8 bytes):
Offset  Size  Field
$00     1     Effect type (0=heal HP, 1=heal status, 2=buff)
$01     1     Effect power (heal amount / buff strength)
$02     1     Target type (0=single, 1=all)
$03     1     Usable in battle (0=no, 1=yes)
$04     1     Usable in field (0=no, 1=yes)
$05     1     Buy price (×10)
$06     1     Menu icon ID
$07     1     Reserved
```

---

### TC-06: Special Effect Assignment
**Purpose**: Test weapon special effects.

**Prerequisites**:
- Dragon Claw selected (has petrify chance)

**Steps**:
1. View Special Effect: Petrify
2. Change to "Poison"
3. View Effect Chance: 25%
4. Change to 100%
5. Apply and test in battle

**Expected Results**:
- Special effect dropdown shows all effects
- Chance slider 0-100%
- Effect triggers on attack
- Multiple effects not supported (one per weapon)

**Special Effect IDs**:
| ID | Effect |
|----|--------|
| 0 | None |
| 1 | Poison |
| 2 | Paralysis |
| 3 | Confusion |
| 4 | Petrify |
| 5 | Sleep |
| 6 | Instant Death |

---

### TC-07: Weapon Upgrade Path
**Purpose**: Verify weapon progression system.

**Prerequisites**:
- Understanding of FFMQ upgrade system

**Steps**:
1. View Sword progression (Steel → Knight → Excalibur → Dragon)
2. Edit Knight Sword required level: 0
3. Apply changes
4. Start new game, check sword available

**Expected Results**:
- Required level controls availability
- Lower level = earlier access
- Progression order maintained
- Stats should increase with level

**Note**: FFMQ weapons are tied to story progression, not character level. "Required level" here refers to story flags.

---

### TC-08: Item Name Editing
**Purpose**: Test item name text modification.

**Prerequisites**:
- Item with editable name

**Steps**:
1. Select Steel Sword
2. Click "Edit Name..."
3. Change "Steel Sword" to "Iron Blade"
4. Apply changes
5. View in-game menu

**Expected Results**:
- Name displays in text field
- 12 character limit respected
- Special characters available (♣♦♥♠)
- In-game text updates

---

## 🔄 Regression Tests

### RT-01: Equipment Menu Integrity
**Purpose**: Ensure item changes don't corrupt menus.

**Steps**:
1. Edit multiple weapons and armor pieces
2. Build ROM
3. Open equipment menu in-game
4. Scroll through all categories
5. Equip/unequip items

**Expected Results**:
- All items display correctly
- No menu glitches
- Stats calculate properly
- Save/load preserves equipment

---

### RT-02: Shop Price Consistency
**Purpose**: Verify edited prices appear in shops.

**Steps**:
1. Edit Cure Potion price to 9999
2. Build ROM
3. Visit shop in-game
4. Check Cure Potion price

**Expected Results**:
- Shop displays edited price
- Transaction works correctly
- Gold deducted matches price
- No overflow issues

---

### RT-03: Battle Integration
**Purpose**: Test edited items work in combat.

**Steps**:
1. Edit Dragon Claw:
   - Attack: 200
   - Element: All
   - Special: Death, 100%
2. Build ROM
3. Equip and use in battle

**Expected Results**:
- Damage reflects new attack value
- All elements apply
- Death effect triggers every hit
- Game doesn't crash

---

## 📊 Item Reference Data

### Complete Item Table
| ID | Name | Type | Base Value |
|----|------|------|------------|
| 00 | Cure Potion | Consumable | Heal 40 HP |
| 01 | Heal Potion | Consumable | Heal 100 HP |
| 02 | Seed | Consumable | Cure Poison |
| 03 | Refresh | Consumable | Cure Paralysis |
| 04 | Refresher | Consumable | Heal Status |
| 05 | Exit Feather | Consumable | Escape Dungeon |
| 06 | Elixir | Consumable | Full Heal |
| 10 | Steel Sword | Weapon | ATK 10 |
| 11 | Knight Sword | Weapon | ATK 20 |
| 12 | Excalibur | Weapon | ATK 40 |
| 13 | Dragon Claw | Weapon | ATK 60 |
| ... | ... | ... | ... |

---

## 🔧 Test Harness Code

### Item Data Reader
```csharp
public class FfmqItemReader {
	private const int ConsumableTableBase = 0x128000; // LoROM $D28000
	private const int WeaponTableBase = 0x12A000;     // LoROM $D2A000
	private const int ArmorTableBase = 0x12C000;      // LoROM $D2C000
	
	public static FfmqWeapon[] LoadWeapons(RomFile rom) {
		var weapons = new FfmqWeapon[16];
		
		for (int i = 0; i < 16; i++) {
			int offset = WeaponTableBase + (i * 8);
			weapons[i] = new FfmqWeapon {
				Id = i,
				Name = GetWeaponName(i),
				AttackPower = rom.ReadByte(offset),
				Elements = (ElementFlags)rom.ReadByte(offset + 1),
				SpecialEffect = rom.ReadByte(offset + 2),
				IconId = rom.ReadByte(offset + 3),
				Category = (WeaponCategory)rom.ReadByte(offset + 4),
				RequiredStoryFlag = rom.ReadByte(offset + 5)
			};
		}
		
		return weapons;
	}
	
	public static FfmqArmor[] LoadArmor(RomFile rom) {
		var armor = new FfmqArmor[16];
		
		for (int i = 0; i < 16; i++) {
			int offset = ArmorTableBase + (i * 6);
			armor[i] = new FfmqArmor {
				Id = i,
				Defense = rom.ReadByte(offset),
				MagicDefense = rom.ReadByte(offset + 1),
				ElementResist = (ElementFlags)rom.ReadByte(offset + 2),
				StatusResist = (StatusFlags)rom.ReadByte(offset + 3),
				Slot = (ArmorSlot)rom.ReadByte(offset + 4)
			};
		}
		
		return armor;
	}
}

public record FfmqWeapon {
	public int Id { get; init; }
	public string Name { get; init; } = "";
	public int AttackPower { get; init; }
	public ElementFlags Elements { get; init; }
	public int SpecialEffect { get; init; }
	public int IconId { get; init; }
	public WeaponCategory Category { get; init; }
	public int RequiredStoryFlag { get; init; }
}

public record FfmqArmor {
	public int Id { get; init; }
	public int Defense { get; init; }
	public int MagicDefense { get; init; }
	public ElementFlags ElementResist { get; init; }
	public StatusFlags StatusResist { get; init; }
	public ArmorSlot Slot { get; init; }
}

public enum WeaponCategory { Sword, Axe, Claw, Bomb }
public enum ArmorSlot { Helmet, Armor, Shield, Accessory }
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Weapons | 3 | 1 |
| Armor | 1 | 0 |
| Consumables | 1 | 1 |
| Special Effects | 1 | 0 |
| Progression | 1 | 0 |
| Names | 1 | 1 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- FFMQ uses fixed inventory (no item management)
- Weapons automatically upgrade through story
- No selling items - only buying
- Bombs use unique ammo system (regenerating)
- Spells are not items - learned through story
