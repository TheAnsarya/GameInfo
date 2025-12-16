using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

/// <summary>
/// Tests for the equipment system service.
/// </summary>
public class EquipmentSystemTests {
	private static byte[] CreateTestRomData() {
		// Create test ROM with weapon, armor, and item tables
		var data = new byte[0x1000];

		// Weapon table at 0x100 (8 bytes per record, 4 weapons)
		// Format: Attack, Accuracy, CritRate, Element, Status, EquipBy, PriceLo, PriceHi
		int offset = 0x100;

		// Weapon 0: Wooden Sword
		data[offset + 0] = 5;    // Attack
		data[offset + 1] = 90;   // Accuracy
		data[offset + 2] = 5;    // Crit rate
		data[offset + 3] = 0;    // Element (none)
		data[offset + 4] = 0;    // Status (none)
		data[offset + 5] = 0xff; // Equip by (all)
		data[offset + 6] = 10;   // Price low
		data[offset + 7] = 0;    // Price high (10 gold)

		// Weapon 1: Iron Sword
		offset += 8;
		data[offset + 0] = 15;   // Attack
		data[offset + 1] = 85;   // Accuracy
		data[offset + 2] = 8;    // Crit rate
		data[offset + 3] = 0;    // Element
		data[offset + 4] = 0;    // Status
		data[offset + 5] = 0x07; // Equip by (classes 1-3)
		data[offset + 6] = 100;  // Price low
		data[offset + 7] = 0;    // Price high (100 gold)

		// Weapon 2: Flame Sword
		offset += 8;
		data[offset + 0] = 25;   // Attack
		data[offset + 1] = 80;   // Accuracy
		data[offset + 2] = 10;   // Crit rate
		data[offset + 3] = 0x01; // Element (fire)
		data[offset + 4] = 0;    // Status
		data[offset + 5] = 0x05; // Equip by (classes 1 and 3)
		data[offset + 6] = 0xf4; // Price low
		data[offset + 7] = 0x01; // Price high (500 gold)

		// Weapon 3: Poison Dagger
		offset += 8;
		data[offset + 0] = 10;   // Attack
		data[offset + 1] = 95;   // Accuracy
		data[offset + 2] = 15;   // Crit rate
		data[offset + 3] = 0;    // Element
		data[offset + 4] = 0x01; // Status (poison)
		data[offset + 5] = 0x0a; // Equip by (classes 2 and 4)
		data[offset + 6] = 200;  // Price low
		data[offset + 7] = 0;    // Price high (200 gold)

		// Armor table at 0x200 (8 bytes per record, 3 armors)
		offset = 0x200;

		// Armor 0: Cloth Armor
		data[offset + 0] = 3;    // Defense
		data[offset + 1] = 0;    // Magic defense
		data[offset + 2] = 0;    // Evasion
		data[offset + 3] = 0;    // Element resist
		data[offset + 4] = 0;    // Status resist
		data[offset + 5] = 0xff; // Equip by
		data[offset + 6] = 20;   // Price low
		data[offset + 7] = 0;    // Price high

		// Armor 1: Chain Mail
		offset += 8;
		data[offset + 0] = 12;   // Defense
		data[offset + 1] = 2;    // Magic defense
		data[offset + 2] = 0;    // Evasion
		data[offset + 3] = 0x02; // Element resist (ice)
		data[offset + 4] = 0;    // Status resist
		data[offset + 5] = 0x0f; // Equip by
		data[offset + 6] = 0x2c; // Price low
		data[offset + 7] = 0x01; // Price high (300 gold)

		// Armor 2: Fire Robe
		offset += 8;
		data[offset + 0] = 8;    // Defense
		data[offset + 1] = 15;   // Magic defense
		data[offset + 2] = 5;    // Evasion
		data[offset + 3] = 0x01; // Element resist (fire)
		data[offset + 4] = 0x02; // Status resist (sleep)
		data[offset + 5] = 0xf0; // Equip by (classes 5-8)
		data[offset + 6] = 0xe8; // Price low
		data[offset + 7] = 0x03; // Price high (1000 gold)

		// Item table at 0x300 (6 bytes per record, 3 items)
		offset = 0x300;

		// Item 0: Herb
		data[offset + 0] = 30;   // HP restore
		data[offset + 1] = 0;    // MP restore
		data[offset + 2] = 0;    // Spell cast
		data[offset + 3] = 0x03; // Flags (battle + field)
		data[offset + 4] = 8;    // Price low
		data[offset + 5] = 0;    // Price high

		// Item 1: Magic Water
		offset += 6;
		data[offset + 0] = 0;    // HP restore
		data[offset + 1] = 20;   // MP restore
		data[offset + 2] = 0;    // Spell cast
		data[offset + 3] = 0x03; // Flags
		data[offset + 4] = 30;   // Price low
		data[offset + 5] = 0;    // Price high

		// Item 2: Warp Wing
		offset += 6;
		data[offset + 0] = 0;    // HP restore
		data[offset + 1] = 0;    // MP restore
		data[offset + 2] = 5;    // Spell cast (warp spell)
		data[offset + 3] = 0x02; // Flags (field only)
		data[offset + 4] = 25;   // Price low
		data[offset + 5] = 0;    // Price high

		return data;
	}

	private static EquipmentSystem CreateSystemWithSchemas() {
		var data = CreateTestRomData();
		var system = new EquipmentSystem(data);

		system.AddSchema(EquipmentSystem.CreateWeaponSchema(0x100, 8, 4));
		system.AddSchema(EquipmentSystem.CreateArmorSchema(0x200, 8, 3));
		system.AddSchema(EquipmentSystem.CreateItemSchema(0x300, 6, 3));

		return system;
	}

	[Fact]
	public void AddSchema_AddsToSchemaList() {
		var data = new byte[0x100];
		var system = new EquipmentSystem(data);
		var schema = EquipmentSystem.CreateWeaponSchema(0x10, 8, 5);

		system.AddSchema(schema);

		Assert.Single(system.Schemas);
		Assert.Equal("Weapons", system.Schemas[0].Name);
	}

	[Fact]
	public void LoadEquipment_LoadsAllItems() {
		var system = CreateSystemWithSchemas();

		var equipment = system.LoadEquipment();

		Assert.Equal(10, equipment.Count); // 4 weapons + 3 armor + 3 items
	}

	[Fact]
	public void LoadEquipment_ReadsWeaponStats() {
		var system = CreateSystemWithSchemas();

		var equipment = system.LoadEquipment();
		var flameSword = equipment[2]; // Third weapon

		Assert.Equal(25, flameSword.Attack);
		Assert.Equal(80, flameSword.Accuracy);
		Assert.Equal(10, flameSword.CriticalRate);
		Assert.Equal(EquipmentSystem.ElementType.Fire, flameSword.ElementAffinity);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Weapon, flameSword.Category);
	}

	[Fact]
	public void LoadEquipment_ReadsArmorStats() {
		var system = CreateSystemWithSchemas();

		var equipment = system.LoadEquipment();
		var chainMail = equipment[5]; // Second armor (after 4 weapons)

		Assert.Equal(12, chainMail.Defense);
		Assert.Equal(2, chainMail.MagicDefense);
		Assert.Equal(EquipmentSystem.ElementType.Ice, chainMail.ElementResistance);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Armor, chainMail.Category);
	}

	[Fact]
	public void LoadEquipment_ReadsItemStats() {
		var system = CreateSystemWithSchemas();

		var equipment = system.LoadEquipment();
		var herb = equipment[7]; // First item (after 4 weapons + 3 armor)

		Assert.Equal(30, herb.HpRestore);
		Assert.Equal(0, herb.MpRestore);
		Assert.True(herb.UsableInBattle);
		Assert.True(herb.UsableInField);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Consumable, herb.Category);
	}

	[Fact]
	public void LoadEquipment_ReadsPriceCorrectly() {
		var system = CreateSystemWithSchemas();

		var equipment = system.LoadEquipment();

		Assert.Equal(10, equipment[0].BuyPrice);  // Wooden Sword (byte value 10)
		Assert.Equal(100, equipment[1].BuyPrice); // Iron Sword (byte value 100)
		// Flame Sword price is 0xf4 + (0x01 << 8) = 244 + 256 = 500
		// But if only low byte is read, it's 244

		// First verify schema has correct field type
		var weaponSchema = system.Schemas.First(s => s.Name == "Weapons");
		var priceField = weaponSchema.Fields.First(f => f.PropertyName == "BuyPrice");
		Assert.Equal(DataTableEditor.FieldType.Word, priceField.Type);

		Assert.Equal(500, equipment[2].BuyPrice); // Flame Sword (0x01f4)
	}

	[Fact]
	public void GetEquipment_ReturnsCachedItem() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var item = system.GetEquipment(0);

		Assert.NotNull(item);
		Assert.Equal(0, item!.Id);
	}

	[Fact]
	public void GetEquipment_ReturnsNullForInvalidId() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var item = system.GetEquipment(999);

		Assert.Null(item);
	}

	[Fact]
	public void GetByCategory_FiltersCorrectly() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var weapons = system.GetByCategory(EquipmentSystem.EquipmentCategory.Weapon);

		Assert.Equal(4, weapons.Count);
		Assert.All(weapons, w => Assert.Equal(EquipmentSystem.EquipmentCategory.Weapon, w.Category));
	}

	[Fact]
	public void GetBySlot_FiltersCorrectly() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var rightHandItems = system.GetBySlot(EquipmentSystem.EquipSlot.RightHand);

		Assert.Equal(4, rightHandItems.Count); // All weapons
	}

	[Fact]
	public void GetEquipableBy_FiltersCorrectly() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var class1Items = system.GetEquipableBy(EquipmentSystem.CharacterClass.Class1);

		// Should include items with AllClasses (0xff) or Class1 flag set
		Assert.True(class1Items.Count >= 1);
	}

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var stats = system.GetStatistics();

		Assert.Equal(10, stats.TotalItems);
		Assert.Equal(4, stats.WeaponCount);
		Assert.Equal(3, stats.ArmorCount);
		Assert.Equal(3, stats.ConsumableCount);
	}

	[Fact]
	public void ExportToJson_CreatesValidJson() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		var json = system.ExportToJson();

		Assert.NotEmpty(json);
		Assert.Contains("Attack", json);
		Assert.Contains("Defense", json);
	}

	[Fact]
	public void ImportFromJson_UpdatesEquipment() {
		var system = CreateSystemWithSchemas();
		system.LoadEquipment();

		// Modify export and reimport
		var json = system.ExportToJson();
		json = json.Replace("\"Attack\": 5", "\"Attack\": 50");

		system.ImportFromJson(json);

		var item = system.GetEquipment(0);
		Assert.NotNull(item);
		Assert.Equal(50, item!.Attack);
	}

	[Fact]
	public void CreateWeaponSchema_HasCorrectDefaults() {
		var schema = EquipmentSystem.CreateWeaponSchema(0x1000, 8, 10);

		Assert.Equal("Weapons", schema.Name);
		Assert.Equal(0x1000, schema.BaseOffset);
		Assert.Equal(8, schema.RecordSize);
		Assert.Equal(10, schema.RecordCount);
		Assert.Equal(80, schema.TotalSize);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Weapon, schema.Category);
	}

	[Fact]
	public void CreateArmorSchema_HasCorrectDefaults() {
		var schema = EquipmentSystem.CreateArmorSchema(0x2000, 8, 20);

		Assert.Equal("Armor", schema.Name);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Armor, schema.Category);
	}

	[Fact]
	public void CreateItemSchema_HasCorrectDefaults() {
		var schema = EquipmentSystem.CreateItemSchema(0x3000, 6, 30);

		Assert.Equal("Items", schema.Name);
		Assert.Equal(EquipmentSystem.EquipmentCategory.Consumable, schema.Category);
	}

	[Fact]
	public void Equipment_DefaultSlot_SetByCategory() {
		var system = CreateSystemWithSchemas();
		var equipment = system.LoadEquipment();

		var weapon = equipment.First(e => e.Category == EquipmentSystem.EquipmentCategory.Weapon);
		var armor = equipment.First(e => e.Category == EquipmentSystem.EquipmentCategory.Armor);
		var item = equipment.First(e => e.Category == EquipmentSystem.EquipmentCategory.Consumable);

		Assert.Equal(EquipmentSystem.EquipSlot.RightHand, weapon.Slot);
		Assert.Equal(EquipmentSystem.EquipSlot.Body, armor.Slot);
		Assert.Equal(EquipmentSystem.EquipSlot.None, item.Slot);
	}

	[Fact]
	public void Equipment_RawData_Preserved() {
		var system = CreateSystemWithSchemas();
		var equipment = system.LoadEquipment();

		var weapon = equipment[0];

		Assert.NotNull(weapon.RawData);
		Assert.Equal(8, weapon.RawData.Length); // Record size
		Assert.Equal(5, weapon.RawData[0]); // Attack byte
	}

	[Fact]
	public void Equipment_RomOffset_Correct() {
		var system = CreateSystemWithSchemas();
		var equipment = system.LoadEquipment();

		Assert.Equal(0x100, equipment[0].RomOffset); // First weapon
		Assert.Equal(0x108, equipment[1].RomOffset); // Second weapon
		Assert.Equal(0x200, equipment[4].RomOffset); // First armor
		Assert.Equal(0x300, equipment[7].RomOffset); // First item
	}

	[Fact]
	public void ElementType_FlagsWork() {
		var combined = EquipmentSystem.ElementType.Fire | EquipmentSystem.ElementType.Ice;

		Assert.True(combined.HasFlag(EquipmentSystem.ElementType.Fire));
		Assert.True(combined.HasFlag(EquipmentSystem.ElementType.Ice));
		Assert.False(combined.HasFlag(EquipmentSystem.ElementType.Lightning));
	}

	[Fact]
	public void CharacterClass_FlagsWork() {
		var classes = EquipmentSystem.CharacterClass.Class1 | EquipmentSystem.CharacterClass.Class3;

		Assert.True(classes.HasFlag(EquipmentSystem.CharacterClass.Class1));
		Assert.True(classes.HasFlag(EquipmentSystem.CharacterClass.Class3));
		Assert.False(classes.HasFlag(EquipmentSystem.CharacterClass.Class2));
	}
}
