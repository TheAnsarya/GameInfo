# Dragon Warrior IV (NES) - Item Editor Manual Testing

## Overview

DW4 contains 220 items including weapons, armor, shields, helmets, accessories, consumables, and key items. Each item record is 8 bytes containing type, stats, prices, and equip permissions.

## Item Data Structure

### Record Format (8 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 1 | TypeFlags | Equipment slot + special flags |
| 1 | 1 | StatModifier | Attack/Defense bonus (signed) |
| 2 | 1 | SpecialFlags | Element/status effects |
| 3-4 | 2 | BuyPrice | Gold (big-endian) |
| 5-6 | 2 | SellPrice | Gold (big-endian) |
| 7 | 1 | EquipFlags | Character bitmask |

### ROM Location
- **Bank:** 7
- **CPU Address:** $8000
- **File Offset:** $1C010
- **Total Items:** 220

### TypeFlags Breakdown (Byte 0)
```
Bits 0-3: Equipment Slot
  0 = Consumable
  1 = Weapon
  2 = Armor
  3 = Shield
  4 = Helmet
  5 = Accessory
  6 = Key Item
  7 = Special

Bits 4-7: Special Flags
  Bit 4 = Usable in battle
  Bit 5 = Usable in field
  Bit 6 = Cursed
  Bit 7 = Reserved
```

### EquipFlags Bitmask (Byte 7)
| Bit | Character |
|-----|-----------|
| 0 | Hero |
| 1 | Ragnar |
| 2 | Alena |
| 3 | Cristo |
| 4 | Brey |
| 5 | Taloon |
| 6 | Mara |
| 7 | Nara |

## Test Cases

### TC-001: Load Item Database
**Objective:** Verify all 220 items load correctly

**Steps:**
1. Open item editor
2. Load DW4 ROM
3. Verify item count = 220
4. Scroll through list, check names

**Expected Results:**
- All items display names
- Equipment slots parsed correctly
- No parsing errors

### TC-002: Edit Weapon Stats
**Objective:** Test weapon attack modification

**Steps:**
1. Select Sword of Malice
2. Note original attack: +45
3. Change attack to +55
4. Save and verify in emulator

**Weapon Reference:**

| Item | Attack | Equip By | Price |
|------|--------|----------|-------|
| Copper Sword | +12 | Hero, Ragnar | 100 |
| Broad Sword | +20 | Hero, Ragnar | 350 |
| Iron Lance | +28 | Hero, Ragnar, Alena | 880 |
| Sword of Malice | +45 | Hero | 4500 |
| Zenithian Sword | +65 | Hero | - |
| Metal Babble Sword | +130 | Hero | - |

### TC-003: Edit Armor Defense
**Objective:** Test armor defense modification

**Steps:**
1. Select Chain Mail
2. Note original defense: +18
3. Modify defense to +25
4. Verify equip flags unchanged

**Armor Reference:**

| Item | Defense | Equip By | Price |
|------|---------|----------|-------|
| Leather Armor | +12 | Everyone | 180 |
| Chain Mail | +18 | Hero, Ragnar | 350 |
| Iron Armor | +30 | Hero, Ragnar | 1200 |
| Full Plate | +50 | Hero, Ragnar | 5800 |
| Zenithian Armor | +75 | Hero | - |

### TC-004: Edit Cursed Item
**Objective:** Test cursed item handling

**Steps:**
1. Select Sword of Lethargy (cursed)
2. Verify StatModifier is negative
3. Verify IsCursed flag set
4. Change to positive value
5. Test in game - should no longer curse

**Cursed Items:**

| Item | Stat | Effect |
|------|------|--------|
| Sword of Lethargy | -5 ATK | Causes Sleep |
| Staff of Antimagic | -10 ATK | Silence self |
| Armor of Radiance | -20 DEF | Curse on equip |

### TC-005: Edit Equip Permissions
**Objective:** Test character equip flags

**Steps:**
1. Select Iron Claw (Alena only)
2. Original EquipFlags: 0x04 (Alena)
3. Change to 0x05 (Hero + Alena)
4. Test in game - Hero can now equip

**Equipment Permissions Example:**
```
Hero only:       0x01 (00000001)
Alena only:      0x04 (00000100)
Males only:      0x33 (00110011) Hero+Ragnar+Cristo+Brey+Taloon
Females only:    0xCC (11001100) Alena+Mara+Nara+Maya
Everyone:        0xFF (11111111)
```

### TC-006: Edit Item Prices
**Objective:** Test price modification

**Steps:**
1. Select Herb
2. Original: Buy=8, Sell=4
3. Change Buy to 1, Sell to 0
4. Verify in shop

**Price Verification:**
- Prices are big-endian
- Max price: 65535 gold
- Sell price typically half of buy price
- Price 0 = cannot buy/sell

### TC-007: Edit Consumable Item
**Objective:** Test consumable items

**Steps:**
1. Select Medical Herb
2. Verify TypeFlags bit 5 = Usable in field
3. Verify TypeFlags bit 4 = Usable in battle
4. Toggle field-only (bit 5 only)
5. Test in battle - should fail

**Consumable Reference:**

| Item | Battle | Field | Effect |
|------|--------|-------|--------|
| Herb | Yes | Yes | Heal 30-40 HP |
| Antidote | Yes | Yes | Cure Poison |
| Wing of Wyvern | No | Yes | Return to town |
| Sage's Stone | Yes | No | Heal all party |

### TC-008: Key Item Handling
**Objective:** Test key items

**Steps:**
1. Locate key items (TypeFlags & 0x0F == 6)
2. Verify price = 0 (cannot sell)
3. Verify EquipFlags = 0x00 (cannot equip)
4. Add to inventory via save editor

**Key Items:**

| Item | Purpose |
|------|---------|
| Final Key | Open any door |
| Thief's Key | Open locked chests |
| Magic Key | Open magic doors |
| Ship | Sea travel |
| Balloon | Air travel |
| Zenithian Equipment | Endgame |

## Item Category Reference

### Weapons (ItemType = 1)
| ID | Name | Attack | Characters |
|----|------|--------|------------|
| 0x01 | Cypress Stick | +2 | All |
| 0x02 | Club | +7 | All |
| 0x10 | Copper Sword | +12 | Hero, Ragnar |
| ... | ... | ... | ... |

### Armor (ItemType = 2)
| ID | Name | Defense | Characters |
|----|------|---------|------------|
| 0x40 | Clothes | +4 | All |
| 0x41 | Leather Armor | +12 | All |
| 0x50 | Chain Mail | +18 | Hero, Ragnar |
| ... | ... | ... | ... |

### Consumables (ItemType = 0)
| ID | Name | Effect |
|----|------|--------|
| 0xC0 | Herb | Heal ~35 HP |
| 0xC1 | Antidote | Cure Poison |
| 0xC2 | Wing of Wyvern | Town Return |
| 0xC3 | Chimaera Wing | Dungeon Exit |
| ... | ... | ... |

## Regression Tests

### RT-001: Round-Trip Export
1. Export all 220 items to JSON
2. Clear item table
3. Import JSON
4. Binary compare with original

### RT-002: Price Consistency
1. Set BuyPrice = 100
2. Verify SellPrice stays independent
3. Set SellPrice = 200 (> BuyPrice)
4. Verify game handles correctly

### RT-003: Equipment Slot Integrity
1. Change Sword to Armor type
2. Verify StatModifier now shows as Defense
3. Change back to Weapon
4. Verify no corruption

## Known Issues

1. **Name Table Separate** - Item names stored in text bank, not with item data
2. **Shop Inventory** - Shop contents stored separately, not modified here
3. **Special Effects** - SpecialFlags byte not fully documented
4. **AI Equipment** - AI chooses equipment based on raw stats; special effects ignored

## Test Harness

```csharp
using DW4Lib.DataStructures;

// Load Copper Sword
var sword = Item.FromBytes(romData, Item.FileOffset);

// Verify properties
Assert.AreEqual(ItemType.Weapon, sword.EquipmentSlot);
Assert.AreEqual(12, sword.StatModifier);
Assert.AreEqual(100, sword.BuyPrice);
Assert.AreEqual(50, sword.SellPrice);
Assert.IsTrue(sword.CanEquip(CharacterID.Hero));
Assert.IsTrue(sword.CanEquip(CharacterID.Ragnar));
Assert.IsFalse(sword.CanEquip(CharacterID.Alena));

// Modify and export
sword.StatModifier = 20;
var bytes = sword.ToBytes();
Assert.AreEqual(8, bytes.Length);

// Test cursed item
var cursedSword = new Item { StatModifier = -5 };
Assert.IsTrue(cursedSword.IsCursed);
```

## DQ4r Conversion Notes

Converting DW4 items to DQ4r (SNES):
- Stat values scale differently (SNES has higher numbers)
- Add visual equipment changes (SNES shows equipped items)
- Map item IDs to DQ4r item system
- Convert price scaling for SNES economy
- Add new equipment slots (SNES has separate accessory slots)

## Taloon's Shop Special Items

Taloon (Chapter 3) has special shop mechanics:
- Can purchase any item at half price
- Haggling system for prices
- Special items only available through Taloon's chapter

**Taloon-Only Items:**
| Item | How to Obtain |
|------|---------------|
| Prince's Clothes | Cave drop |
| Steel Strongbox | Cave event |
| Half Plate | Special purchase |

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
