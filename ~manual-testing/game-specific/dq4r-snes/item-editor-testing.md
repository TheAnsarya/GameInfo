# DQ4r SNES - Item Editor Testing

Manual test cases for Dragon Quest IV Remake (SNES) item data editing.

## 📋 System Overview

### Item System
- **Total Items**: ~250 items
- **Data Size**: ~16 bytes per entry
- **Categories**: Weapons, Armor, Accessories, Consumables, Key Items
- **Platform**: Super Famicom (Japan-only)

### DQ4r Item Features
| Feature | Description |
|---------|-------------|
| Weapon Types | Sword, Axe, Hammer, Whip, Staff, Claw, Boomerang, Bow |
| Armor Types | Body, Shield, Helmet, Accessory |
| Chapter Items | Some items only available in certain chapters |
| Casino Items | Special equipment from casinos |
| Alchemy Preview | Some items have crafting recipes |

### ROM Layout
| Region | Address | Contents |
|--------|---------|----------|
| Item Data | $E40000+ | Stats, flags, prices |
| Item Names | $E50000+ | Text (Shift-JIS) |
| Item Descriptions | $E58000+ | Help text |
| Equip Restrictions | $E42000+ | Who can equip |
| Shop Inventories | $E44000+ | Shop item lists |

---

## 🧪 Test Cases

### TC-01: Item List Loading
**Purpose**: Verify complete item catalog loads correctly.

**Prerequisites**:
- DQ4r SFC ROM loaded
- Item Editor open

**Steps**:
1. Open Item Editor
2. Verify item list populates (~250 entries)
3. Check category tabs function
4. Verify Japanese names display correctly
5. Scroll through all items

**Expected Results**:
- All items listed with proper IDs
- Categories sort correctly
- Japanese text renders (Shift-JIS)
- Icons display for each category
- No duplicate or missing entries

---

### TC-02: Weapon Stats Editing
**Purpose**: Test weapon attack power modification.

**Prerequisites**:
- Sword category selected

**Steps**:
1. Select ひのきのぼう (Cypress Stick)
2. View stats:
   - Attack: +2
   - Price: 5G
3. Change Attack to +99
4. Change Price to 1G
5. Apply and verify in-game

**Expected Results**:
- Attack value accepts 0-255
- Price up to 65535G
- Equipment screen shows new stats
- Combat damage reflects change

**Weapon Data Format (16 bytes)**:
```
Offset  Size  Field
$00     1     Item type (weapon subtype)
$01     1     Attack power
$02     1     Defense bonus (usually 0)
$03     1     Agility bonus
$04     1     Wisdom bonus
$05     1     Luck bonus
$06     2     Price (buy)
$08     2     Price (sell, usually buy/2)
$0A     1     Equip flags (low byte)
$0B     1     Equip flags (high byte)
$0C     1     Special effect ID
$0D     1     Element/damage type
$0E     1     Cursed flag + misc
$0F     1     Reserved
```

---

### TC-03: Equipment Restrictions
**Purpose**: Test 8-character equip flags.

**Prerequisites**:
- Weapon or armor selected

**Steps**:
1. Select てつのつるぎ (Iron Sword)
2. View equip restrictions:
   - Hero: ✓
   - Ragnar: ✓
   - Alena: ✗
   - Kiryl: ✗
   - Borya: ✗
   - Torneko: ✗
   - Meena: ✗
   - Maya: ✗
3. Enable Alena equip
4. Apply and test equip menu

**Expected Results**:
- 8 character checkboxes
- Multiple characters selectable
- Equip menu reflects changes
- Combat uses correct stats

**Character Equip Bits**:
```
Bit 0: Hero (勇者)
Bit 1: Ragnar (ライアン)
Bit 2: Alena (アリーナ)
Bit 3: Kiryl (クリフト)
Bit 4: Borya (ブライ)
Bit 5: Torneko (トルネコ)
Bit 6: Meena (ミネア)
Bit 7: Maya (マーニャ)

Additional flags (high byte):
Bit 8-9: Chapter restriction
Bit 10: Female only
Bit 11: Male only
Bit 12-15: Reserved
```

---

### TC-04: Armor Defense Editing
**Purpose**: Test armor defense value modification.

**Prerequisites**:
- Armor category selected

**Steps**:
1. Select ぬののふく (Plain Clothes)
2. View Defense: +4
3. Change to +50
4. Apply and verify
5. Check character defense stat

**Expected Results**:
- Defense value accepts 0-255
- Equipment screen shows new value
- Total defense calculates correctly
- No overflow issues

---

### TC-05: Consumable Item Effects
**Purpose**: Test healing item modification.

**Prerequisites**:
- Consumables tab selected

**Steps**:
1. Select やくそう (Medicinal Herb)
2. View Heal Amount: ~30 HP
3. Change to 255 HP
4. Apply changes
5. Use item in-game

**Expected Results**:
- Heal value accepts 0-255
- Item use restores correct HP
- Battle use works same as field
- No side effects on other items

**Consumable Effect IDs**:
| ID | Effect |
|----|--------|
| 00 | No effect |
| 01 | Heal HP (power = amount) |
| 02 | Heal MP |
| 03 | Cure Poison |
| 04 | Cure Paralysis |
| 05 | Cure Sleep |
| 06 | Revive (power = HP%) |
| 07 | Full Heal |
| 08 | Warp |
| 09 | Return |

---

### TC-06: Special Weapon Effects
**Purpose**: Test weapon special ability assignment.

**Prerequisites**:
- Weapon with special effect

**Steps**:
1. Select はがねのつるぎ (Steel Sword)
2. View Special Effect: None
3. Change to "Cast Heal on hit"
4. Apply and test in battle
5. Verify effect triggers

**Expected Results**:
- Effect dropdown shows all effects
- Assigned effect works in combat
- Effect rate applies (if applicable)
- Visual feedback shows effect

**Weapon Effects**:
| ID | Effect |
|----|--------|
| 00 | None |
| 01 | Double attack |
| 02 | Triple attack |
| 03 | Cast spell on hit |
| 04 | Drain HP |
| 05 | Drain MP |
| 06 | Critical hit bonus |
| 07 | Metal slime killer |

---

### TC-07: Cursed Equipment
**Purpose**: Test cursed item flags.

**Prerequisites**:
- Known cursed item

**Steps**:
1. Select Sword of Decimation (cursed weapon)
2. View Cursed: ✓
3. Remove curse flag
4. Apply and equip
5. Verify no curse effect

**Expected Results**:
- Curse checkbox toggles
- Uncursed item equips normally
- No "stuck" equipment bug
- Can re-add curse flag

---

### TC-08: Chapter-Restricted Items
**Purpose**: Test chapter availability flags.

**Prerequisites**:
- Understanding of DQ4 chapter system

**Steps**:
1. View Taloon's Shop items (Chapter 3 only)
2. Check chapter restriction flags
3. Remove Chapter 3 restriction
4. Apply and check Chapter 5 availability
5. Verify item appears in shops

**Expected Results**:
- Chapter flags visible
- Restriction can be removed
- Item appears in later chapters
- Shop inventory updates

---

## 🔄 Regression Tests

### RT-01: Shop Inventory Integrity
**Purpose**: Ensure item edits don't break shops.

**Steps**:
1. Edit weapon stats significantly
2. Edit prices
3. Build ROM
4. Visit weapon shop
5. Buy and sell edited items

**Expected Results**:
- Shop displays correct prices
- Purchase works correctly
- Sale price calculates from buy price
- Inventory management works

---

### RT-02: Equipment Menu Stability
**Purpose**: Verify equip changes don't corrupt menus.

**Steps**:
1. Edit equip restrictions
2. Edit item stats
3. Build ROM
4. Open equipment menu
5. Equip/unequip multiple items
6. Save and reload game

**Expected Results**:
- Menu displays all equipment
- Restrictions enforce correctly
- No visual glitches
- Save preserves equipment state

---

### RT-03: Battle Item Usage
**Purpose**: Test edited consumables in combat.

**Steps**:
1. Edit healing item to max value
2. Edit battle-only item effects
3. Build ROM
4. Enter combat
5. Use edited items

**Expected Results**:
- Items appear in battle menu
- Effects apply correctly
- No crashes or freezes
- Combat continues normally

---

## 📊 Item Reference Data

### Weapon Categories
| Type | ID Range | Examples |
|------|----------|----------|
| Swords | 01-30 | ひのきのぼう, てつのつるぎ, はぐれメタルのけん |
| Axes | 31-40 | てつのおの, まさかりのオノ |
| Hammers | 41-50 | おおきづち, ウォーハンマー |
| Whips | 51-60 | かわのムチ, グリンガムのムチ |
| Staves | 61-75 | ひかりのつえ, マグマのつえ |
| Claws | 76-85 | てつのツメ, きせきのつるぎ |
| Boomerangs | 86-95 | ブーメラン, メタルウィング |
| Bows | 96-100 | ゆみ, ゆうわくのゆみ |

### Armor Categories
| Type | ID Range | Examples |
|------|----------|----------|
| Body Armor | 101-140 | ぬののふく, はがねのよろい |
| Shields | 141-160 | かわのたて, オーガシールド |
| Helmets | 161-180 | かわのぼうし, グレートヘルム |
| Accessories | 181-200 | いのりのゆびわ, ほしふるうでわ |

### Consumables
| Type | ID Range | Examples |
|------|----------|----------|
| Healing | 201-215 | やくそう, せかいじゅのは |
| MP Recovery | 216-220 | まほうのせいすい, エルフののみぐすり |
| Status Cure | 221-230 | どくけしそう, てんしのすず |
| Field Items | 231-240 | キメラのつばさ, せいじゃくのたま |
| Key Items | 241-250 | ふねのきっぷ, ようせいのけん |

---

## 🔧 Test Harness Code

### DQ4r Item Reader
```csharp
public class Dq4rItemReader {
	private const int ItemTableBase = 0x240000; // Approximate
	private const int ItemEntrySize = 0x10;
	private const int ItemCount = 250;

	public static Dq4rItem[] LoadAllItems(RomFile rom) {
		var items = new Dq4rItem[ItemCount];

		for (int i = 0; i < ItemCount; i++) {
			int offset = ItemTableBase + (i * ItemEntrySize);
			items[i] = ReadItem(rom, offset, i);
		}

		return items;
	}

	private static Dq4rItem ReadItem(RomFile rom, int offset, int id) {
		return new Dq4rItem {
			Id = id,
			Type = (ItemType)rom.ReadByte(offset),
			Attack = rom.ReadByte(offset + 1),
			Defense = rom.ReadByte(offset + 2),
			Agility = rom.ReadByte(offset + 3),
			Wisdom = rom.ReadByte(offset + 4),
			Luck = rom.ReadByte(offset + 5),
			BuyPrice = rom.ReadUInt16(offset + 6),
			SellPrice = rom.ReadUInt16(offset + 8),
			EquipFlags = rom.ReadUInt16(offset + 10),
			SpecialEffect = rom.ReadByte(offset + 12),
			Element = rom.ReadByte(offset + 13),
			Flags = rom.ReadByte(offset + 14)
		};
	}
}

public record Dq4rItem {
	public int Id { get; init; }
	public ItemType Type { get; init; }
	public int Attack { get; init; }
	public int Defense { get; init; }
	public int Agility { get; init; }
	public int Wisdom { get; init; }
	public int Luck { get; init; }
	public int BuyPrice { get; init; }
	public int SellPrice { get; init; }
	public int EquipFlags { get; init; }
	public int SpecialEffect { get; init; }
	public int Element { get; init; }
	public int Flags { get; init; }

	public bool IsCursed => (Flags & 0x80) != 0;
	public bool CanEquipHero => (EquipFlags & 0x01) != 0;
	public bool CanEquipRagnar => (EquipFlags & 0x02) != 0;
	public bool CanEquipAlena => (EquipFlags & 0x04) != 0;
	public bool CanEquipKiryl => (EquipFlags & 0x08) != 0;
	public bool CanEquipBorya => (EquipFlags & 0x10) != 0;
	public bool CanEquipTorneko => (EquipFlags & 0x20) != 0;
	public bool CanEquipMeena => (EquipFlags & 0x40) != 0;
	public bool CanEquipMaya => (EquipFlags & 0x80) != 0;
}

public enum ItemType : byte {
	None = 0,
	Sword = 1,
	Axe = 2,
	Hammer = 3,
	Whip = 4,
	Staff = 5,
	Claw = 6,
	Boomerang = 7,
	Bow = 8,
	BodyArmor = 10,
	Shield = 11,
	Helmet = 12,
	Accessory = 13,
	Consumable = 20,
	KeyItem = 30
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Loading | 1 | 0 |
| Weapons | 2 | 0 |
| Armor | 2 | 1 |
| Consumables | 1 | 1 |
| Effects | 1 | 0 |
| Cursed | 1 | 0 |
| **Total** | **8** | **2** |

---

## 📝 Notes

- DQ4r is Japan-only (Super Famicom)
- Many items from NES version have different stats
- Casino equipment is powerful but rare
- Chapter 3 (Torneko) has unique shop mechanics
- Some equipment can be found AND bought
- Translation patches may shift data addresses
