# Dragon Quest III Remake (SNES) - Item Editor Manual Testing

## Overview

DQ3r SNES contains 228 items ($01-$e4) including weapons, armor, shields, accessories, consumables, and key items. Items have stats, equip restrictions, and special effects.

## Item Data Structure

### ROM Location
Based on research, item data stored in ROM banks with cross-references.

### Item Categories
| Range | Category | Count |
|-------|----------|-------|
| $01-$40 | Weapons | 64 |
| $41-$70 | Armor | 48 |
| $71-$90 | Shields | 32 |
| $91-$A0 | Helmets | 16 |
| $A1-$B0 | Accessories | 16 |
| $B1-$D0 | Consumables | 32 |
| $D1-$E4 | Key Items | 20 |

### RAM Structure ($7e Bank)
```
$7e3725-$7e3824: Item Bag (256 bytes - item IDs)
$7e3825-$7e3924: Item Quantities (256 bytes)
```

### Proposed Item Record Format (~10 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 1 | Type | Category (weapon/armor/etc.) |
| 1 | 1 | StatBonus | Attack/Defense value |
| 2 | 1 | SecondaryBonus | Agility/Wisdom bonus |
| 3 | 2 | BuyPrice | Shop price (16-bit) |
| 4 | 2 | SellPrice | Sell price (typically 75%) |
| 6 | 2 | EquipFlags | Who can equip (9 classes) |
| 8 | 1 | SpecialFlags | Cursed, use effect, etc. |
| 9 | 1 | EffectID | Use/battle effect |

### Equip Flags (9 classes)
```
Bit 0: Hero
Bit 1: Warrior
Bit 2: Fighter
Bit 3: Mage
Bit 4: Cleric
Bit 5: Dealer
Bit 6: Jester
Bit 7: Thief
Bit 8: Sage
```

## Test Cases

### TC-001: Load Item Database
**Objective:** Verify all 228 items load correctly

**Steps:**
1. Open item editor
2. Load DQ3 SFC ROM
3. Verify item count = 228
4. Scroll through categories

**Expected Results:**
- All items display Japanese names
- Stats within expected ranges
- Equipment restrictions parsed correctly

### TC-002: Edit Weapon Stats
**Objective:** Test weapon attack modification

**Steps:**
1. Select Copper Sword
2. Note original attack: +15
3. Change attack to +30
4. Verify in equipment menu

**Weapon Reference (early-mid game):**

| ID | Weapon | Attack | Classes | Price |
|----|--------|--------|---------|-------|
| $01 | Cypress Stick | +2 | All | 5 |
| $02 | Club | +7 | W/F/D/J | 30 |
| $05 | Copper Sword | +12 | H/W | 100 |
| $08 | Iron Spear | +28 | H/W/F | 650 |
| $10 | Steel Sword | +33 | H/W | 1500 |
| $20 | Sword of Gaia | +75 | H | - |
| $30 | Sword of Kings | +120 | H | - |

### TC-003: Edit Armor Defense
**Objective:** Test armor defense modification

**Steps:**
1. Select Chain Mail
2. Note original defense: +20
3. Modify defense to +40
4. Verify in equipment menu

**Armor Reference:**

| ID | Armor | Defense | Classes | Price |
|----|-------|---------|---------|-------|
| $41 | Plain Clothes | +4 | All | 10 |
| $45 | Leather Armor | +12 | W/F/D | 150 |
| $48 | Chain Mail | +20 | H/W | 480 |
| $50 | Iron Armor | +25 | H/W | 1100 |
| $60 | Swordedge Armor | +55 | W | 9800 |
| $65 | Sacred Armor | +75 | H | - |

### TC-004: Edit Class Restrictions
**Objective:** Test equip flag modification

**Steps:**
1. Select Mage-only Staff
2. Original equip: Mage only (0x08)
3. Add Hero to equip flags (0x09)
4. Test in game - Hero can now equip

**Class Combinations:**

| Restriction | Flags | Example |
|-------------|-------|---------|
| Hero only | 0x001 | Erdrick's Sword |
| Warrior only | 0x002 | Giant Hammer |
| Mage/Sage | 0x088 | Staff of Thunder |
| Cleric/Sage | 0x090 | Sage's Staff |
| All classes | 0x1FF | Cypress Stick |

### TC-005: Edit Item Prices
**Objective:** Test price modification

**Steps:**
1. Select Medical Herb
2. Original: Buy=8, Sell=6
3. Change Buy to 1, Sell to 0
4. Verify in shop

**Price Notes:**
- Sell price typically 75% of buy price
- Key items have price 0 (cannot sell)
- Cursed items sell for minimal gold

### TC-006: Edit Consumable Effects
**Objective:** Test use effect modification

**Steps:**
1. Select Medical Herb
2. Note effect: Heal ~30 HP
3. Modify effect ID to stronger heal
4. Test in menu - should heal more

**Consumable Reference:**

| ID | Item | Effect | Price |
|----|------|--------|-------|
| $B1 | Medicinal Herb | Heal 30-40 HP | 8 |
| $B2 | Antidote Herb | Cure Poison | 10 |
| $B3 | Full Moon Herb | Cure Curse | 30 |
| $B5 | Wing of Wyvern | Return to town | 25 |
| $B8 | Sage's Stone | Heal all (infinite) | - |
| $BC | Yggdrasil Leaf | Revive (single use) | - |

### TC-007: Edit Cursed Item
**Objective:** Test cursed item handling

**Steps:**
1. Locate Sword of Destruction (cursed)
2. Verify Cursed flag set
3. Check for negative effects
4. Remove curse flag
5. Test - should no longer curse

**Cursed Items:**

| Item | Stats | Curse Effect |
|------|-------|--------------|
| Sword of Destruction | +95 ATK | May cause confusion |
| Demon Armor | +65 DEF | Reduces MP |
| Zombie Mail | +38 DEF | Cannot unequip |
| Noh Mask | +255 DEF | Very hard to remove |

### TC-008: Edit Key Items
**Objective:** Test key item handling

**Steps:**
1. Locate Dream Ruby (key item)
2. Verify price = 0 (cannot sell)
3. Verify cannot be dropped
4. Verify event flag tied to possession

**Key Item Reference:**

| ID | Item | Purpose |
|----|------|---------|
| $D1 | Thief's Key | Open locked doors |
| $D2 | Magic Key | Open magic doors |
| $D5 | Dream Ruby | Access dream world |
| $D8 | Orb of Wind | Ramia egg |
| $DC | Six Orbs | Revive Ramia |
| $E0 | Staff of Thunder | Necrogond access |

## Character Equipment Slots

Each character has equipment slots in RAM:

```
$7e3925 + $10-$1F: Hero equipment
  +$10: Weapon
  +$11: Armor
  +$12: Shield
  +$13: Helmet
  +$14: Accessory 1
  +$15: Accessory 2
```

## Class System Integration

### Class Change Considerations
When class changes, equipment may be unequipped if new class cannot use:

```
Warrior → Mage: Loses sword, heavy armor
Mage → Sage: Keeps robes, staves
Thief → Sage: Loses thief items, gains sage items
```

## Regression Tests

### RT-001: Full Item Round-Trip
1. Export all 228 items to JSON
2. Clear item table
3. Import from export
4. Binary compare with original

### RT-002: Price Consistency
1. Set item buy price to 100
2. Verify sell price updates (75 default)
3. Override sell price to 200
4. Verify both values stored

### RT-003: Equip Flag Encoding
1. Set equip flags to Hero+Sage only
2. Save and reload
3. Verify only Hero and Sage can equip
4. Test with other classes - should fail

## Known Issues

1. **Japanese Names** - Item names in Japanese require translation table
2. **Effect Tables** - Use effects stored in separate table
3. **Graphics** - Item icons linked separately
4. **Bag Limits** - Game has 64-item bag limit

## Test Harness

```csharp
// DQ3 Item structure (proposed)
public class DQ3Item {
    public byte Id { get; set; }
    public ItemCategory Category { get; set; }
    public byte StatBonus { get; set; }
    public byte SecondaryBonus { get; set; }
    public ushort BuyPrice { get; set; }
    public ushort SellPrice { get; set; }
    public ushort EquipFlags { get; set; }
    public byte SpecialFlags { get; set; }
    public byte EffectId { get; set; }
    public string Name { get; set; } = "";
    
    public bool IsCursed => (SpecialFlags & 0x01) != 0;
    public bool IsKeyItem => (SpecialFlags & 0x02) != 0;
    public bool IsUsable => (SpecialFlags & 0x04) != 0;
    
    public bool CanEquip(CharacterClass cls) {
        return (EquipFlags & (1 << (int)cls)) != 0;
    }
}

public enum ItemCategory : byte {
    Weapon = 0,
    Armor = 1,
    Shield = 2,
    Helmet = 3,
    Accessory = 4,
    Consumable = 5,
    KeyItem = 6
}

public enum CharacterClass : byte {
    Hero = 0,
    Warrior = 1,
    Fighter = 2,
    Mage = 3,
    Cleric = 4,
    Dealer = 5,
    Jester = 6,
    Thief = 7,
    Sage = 8
}
```

## Shop System Integration

Shops reference items by ID with availability flags:

```
Shop 1 (Aliahan): [Cypress Stick, Club, Leather Armor, Herb]
Shop 2 (Romaly): [Iron Spear, Chain Mail, Shield, Antidote]
...
```

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
