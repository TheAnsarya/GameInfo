using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

public class GameDataEditorsTests {
	#region ShopEditor Tests

	[Fact]
	public void ShopEditor_Extract_ReadsShopData() {
		// Create test data with 2 shops, 4 items each
		var data = new byte[16];
		data[0] = 0x01; data[1] = 0x02; data[2] = 0x03; data[3] = 0x04; // Shop 1
		data[8] = 0x05; data[9] = 0x06; data[10] = 0x07; data[11] = 0x08; // Shop 2

		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"Name": "Test",
				"TableOffset": 0,
				"ShopCount": 2,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");

		editor.Extract();

		Assert.Equal(2, editor.Count);
		Assert.Equal(4, editor.Records[0].Items.Count);
		Assert.Equal(0x01, editor.Records[0].Items[0].ItemId);
	}

	[Fact]
	public void ShopEditor_Apply_WritesShopData() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");

		editor.Extract();
		editor.Records[0].Items.Add(new ShopItem { ItemId = 0x42 });
		editor.Apply();

		Assert.Equal(0x42, data[0]);
	}

	[Fact]
	public void ShopEditor_AddItem_AddsToShop() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();

		bool result = editor.AddItem(0, 0x10);

		Assert.True(result);
		Assert.Single(editor.Records[0].Items);
		Assert.Equal(0x10, editor.Records[0].Items[0].ItemId);
	}

	[Fact]
	public void ShopEditor_RemoveItem_RemovesFromShop() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00 };
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();

		bool result = editor.RemoveItem(0, 0x02);

		Assert.True(result);
		Assert.Equal(2, editor.Records[0].Items.Count);
	}

	[Fact]
	public void ShopEditor_Validate_DetectsTooManyItems() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 2,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();
		editor.Records[0].Items.Add(new ShopItem { ItemId = 1 });
		editor.Records[0].Items.Add(new ShopItem { ItemId = 2 });
		editor.Records[0].Items.Add(new ShopItem { ItemId = 3 });

		var errors = editor.Validate();

		Assert.Single(errors);
		Assert.Contains("too many items", errors[0]);
	}

	#endregion

	#region ChestEditor Tests

	[Fact]
	public void ChestEditor_Extract_ReadsChestData() {
		// Chest: ItemId=0x05, Qty=3, MapId=2, X=10, Y=20
		var data = new byte[] { 0x05, 0x03, 0x02, 0x0A, 0x14, 0x00, 0x00, 0x00 };

		var editor = new ChestEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ChestCount": 1,
				"RecordSize": 5,
				"ItemIdOffset": 0,
				"QuantityOffset": 1,
				"MapIdOffset": 2,
				"XOffset": 3,
				"YOffset": 4
			}
			""");

		editor.Extract();

		Assert.Single(editor.Records);
		Assert.Equal(0x05, editor.Records[0].ItemId);
		Assert.Equal(3, editor.Records[0].Quantity);
		Assert.Equal(2, editor.Records[0].MapId);
		Assert.Equal(10, editor.Records[0].X);
		Assert.Equal(20, editor.Records[0].Y);
	}

	[Fact]
	public void ChestEditor_Apply_WritesChestData() {
		var data = new byte[8];
		var editor = new ChestEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ChestCount": 1,
				"RecordSize": 5,
				"ItemIdOffset": 0,
				"QuantityOffset": 1,
				"MapIdOffset": 2
			}
			""");

		editor.Extract();
		editor.Records[0].ItemId = 0x42;
		editor.Records[0].Quantity = 5;
		editor.Records[0].MapId = 3;
		editor.Apply();

		Assert.Equal(0x42, data[0]);
		Assert.Equal(5, data[1]);
		Assert.Equal(3, data[2]);
	}

	[Fact]
	public void ChestEditor_GetChestsByMap_FiltersCorrectly() {
		var data = new byte[12];
		data[2] = 1; // Chest 0 on map 1
		data[6] = 2; // Chest 1 on map 2
		data[10] = 1; // Chest 2 on map 1

		var editor = new ChestEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ChestCount": 3,
				"RecordSize": 4,
				"ItemIdOffset": 0,
				"MapIdOffset": 2
			}
			""");
		editor.Extract();

		var map1Chests = editor.GetChestsByMap(1).ToList();

		Assert.Equal(2, map1Chests.Count);
	}

	[Fact]
	public void ChestEditor_GoldChest_ConvertsCorrectly() {
		var data = new byte[] { 0xF5, 0x00, 0x00, 0x00 }; // Gold chest 0xF5

		var editor = new ChestEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ChestCount": 1,
				"RecordSize": 4,
				"ItemIdOffset": 0,
				"HasGoldChests": true,
				"GoldMultiplier": 10
			}
			""");
		editor.Extract();

		Assert.Equal(ChestContentType.Gold, editor.Records[0].ContentType);
		Assert.Equal(50, editor.Records[0].GoldAmount); // (0xF5 - 0xF0) * 10 = 50
	}

	#endregion

	#region PartyEditor Tests

	[Fact]
	public void PartyEditor_Extract_ReadsCharacterStats() {
		// Character with HP=100, MP=50, STR=20, DEF=15
		var data = new byte[] { 100, 50, 20, 15, 0, 0, 0, 0 };

		var editor = new PartyEditor(data);
		editor.LoadSchema("""
			{
				"CharacterTableOffset": 0,
				"CharacterCount": 1,
				"CharacterRecordSize": 8,
				"Stats": [
					{ "Name": "HP", "Offset": 0 },
					{ "Name": "MP", "Offset": 1 },
					{ "Name": "STR", "Offset": 2 },
					{ "Name": "DEF", "Offset": 3 }
				]
			}
			""");

		editor.Extract();

		Assert.Single(editor.Records);
		Assert.Equal(100, editor.Records[0].BaseStats["HP"]);
		Assert.Equal(50, editor.Records[0].BaseStats["MP"]);
		Assert.Equal(20, editor.Records[0].BaseStats["STR"]);
		Assert.Equal(15, editor.Records[0].BaseStats["DEF"]);
	}

	[Fact]
	public void PartyEditor_Apply_WritesCharacterStats() {
		var data = new byte[8];
		var editor = new PartyEditor(data);
		editor.LoadSchema("""
			{
				"CharacterTableOffset": 0,
				"CharacterCount": 1,
				"CharacterRecordSize": 8,
				"Stats": [
					{ "Name": "HP", "Offset": 0 },
					{ "Name": "STR", "Offset": 2 }
				]
			}
			""");

		editor.Extract();
		editor.Records[0].BaseStats["HP"] = 150;
		editor.Records[0].BaseStats["STR"] = 30;
		editor.Apply();

		Assert.Equal(150, data[0]);
		Assert.Equal(30, data[2]);
	}

	[Fact]
	public void PartyEditor_CalculateStatsAtLevel_AppliesGrowth() {
		var data = new byte[16];
		data[0] = 50; // Base HP
		data[8] = 4;  // HP growth per 4 levels

		var editor = new PartyEditor(data);
		editor.LoadSchema("""
			{
				"CharacterTableOffset": 0,
				"CharacterCount": 1,
				"CharacterRecordSize": 8,
				"GrowthTableOffset": 8,
				"GrowthRecordSize": 8,
				"Stats": [
					{ "Name": "HP", "Offset": 0, "MaxValue": 999 }
				]
			}
			""");
		editor.Extract();

		var statsAtLevel10 = editor.CalculateStatsAtLevel(0, 10);

		// 50 + (4 * 9 / 4) = 50 + 9 = 59
		Assert.Equal(59, statsAtLevel10["HP"]);
	}

	[Fact]
	public void PartyEditor_Validate_DetectsOutOfRange() {
		var data = new byte[8];
		var editor = new PartyEditor(data);
		editor.LoadSchema("""
			{
				"CharacterTableOffset": 0,
				"CharacterCount": 1,
				"CharacterRecordSize": 8,
				"Stats": [
					{ "Name": "HP", "Offset": 0, "MinValue": 1, "MaxValue": 100 }
				]
			}
			""");
		editor.Extract();
		editor.Records[0].BaseStats["HP"] = 200;

		var errors = editor.Validate();

		Assert.Single(errors);
		Assert.Contains("out of range", errors[0]);
	}

	#endregion

	#region ClassEditor Tests

	[Fact]
	public void ClassEditor_Extract_ReadsClassData() {
		// Class with stat bonuses and equipment flags
		var data = new byte[] { 10, 5, 0x0F, 0x00, 0, 0, 0, 0 };

		var editor = new ClassEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ClassCount": 1,
				"RecordSize": 8,
				"EquipmentFlagsOffset": 2,
				"StatBonuses": [
					{ "Name": "ATK", "Offset": 0 },
					{ "Name": "DEF", "Offset": 1 }
				]
			}
			""");

		editor.Extract();

		Assert.Single(editor.Records);
		Assert.Equal(10, editor.Records[0].StatBonuses["ATK"]);
		Assert.Equal(5, editor.Records[0].StatBonuses["DEF"]);
		Assert.Equal(0x0F, editor.Records[0].EquipmentFlags);
	}

	[Fact]
	public void ClassEditor_CanEquip_ChecksFlags() {
		var data = new byte[] { 0, 0, 0x05, 0x00, 0, 0, 0, 0 }; // Flags = 0x05 (bits 0 and 2)

		var editor = new ClassEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ClassCount": 1,
				"RecordSize": 8,
				"EquipmentFlagsOffset": 2
			}
			""");
		editor.Extract();

		Assert.True(editor.CanEquip(0, 0x01));  // Bit 0
		Assert.False(editor.CanEquip(0, 0x02)); // Bit 1
		Assert.True(editor.CanEquip(0, 0x04));  // Bit 2
	}

	[Fact]
	public void ClassEditor_GetSkillsAtLevel_ReturnsLearnedSkills() {
		var data = new byte[32];
		var editor = new ClassEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ClassCount": 1,
				"RecordSize": 8
			}
			""");
		editor.Extract();

		// Manually add skills with levels
		editor.Records[0].LearnableSkills.Add(1);
		editor.Records[0].LearnableSkills.Add(2);
		editor.Records[0].LearnableSkills.Add(3);
		editor.Records[0].SkillLevels[1] = 1;
		editor.Records[0].SkillLevels[2] = 5;
		editor.Records[0].SkillLevels[3] = 10;

		var skillsAtLevel5 = editor.GetSkillsAtLevel(0, 5).ToList();

		Assert.Equal(2, skillsAtLevel5.Count);
		Assert.Contains(1, skillsAtLevel5);
		Assert.Contains(2, skillsAtLevel5);
		Assert.DoesNotContain(3, skillsAtLevel5);
	}

	#endregion

	#region BattleFormulaEditor Tests

	[Fact]
	public void BattleFormulaEditor_Extract_ReadsFormulaData() {
		var data = new byte[] {
			10,   // BaseValue
			150,  // Multiplier
			100,  // AttackStatWeight
			50,   // DefenseStatWeight
			90,   // RandomMin
			110,  // RandomMax
			0,    // ElementId
			0     // Padding
		};

		var editor = new BattleFormulaEditor(data);
		editor.LoadSchema("""
			{
				"DamageFormulaOffset": 0,
				"DamageFormulaCount": 1,
				"DamageFormulaSize": 8
			}
			""");

		editor.Extract();

		Assert.Single(editor.Records);
		Assert.Equal(10, editor.Records[0].BaseValue);
		Assert.Equal(150, editor.Records[0].Multiplier);
		Assert.Equal(100, editor.Records[0].AttackStatWeight);
		Assert.Equal(50, editor.Records[0].DefenseStatWeight);
	}

	[Fact]
	public void BattleFormulaEditor_Simulate_CalculatesDamage() {
		var data = new byte[] { 10, 100, 100, 50, 100, 100, 0, 0 };
		var editor = new BattleFormulaEditor(data);
		editor.LoadSchema("""
			{
				"DamageFormulaOffset": 0,
				"DamageFormulaCount": 1,
				"DamageFormulaSize": 8
			}
			""");
		editor.Extract();

		var result = editor.Simulate(0, attackStat: 50, defenseStat: 20);

		// Expected: (10 + 50*100/100 - 20*50/100) * 100/100 = (10 + 50 - 10) * 1 = 50
		Assert.True(result.AvgDamage > 0);
	}

	[Fact]
	public void BattleFormulaEditor_GetFormulaExpression_ReturnsString() {
		var data = new byte[] { 10, 100, 100, 50, 90, 110, 0, 0 };
		var editor = new BattleFormulaEditor(data);
		editor.LoadSchema("""
			{
				"DamageFormulaOffset": 0,
				"DamageFormulaCount": 1,
				"DamageFormulaSize": 8
			}
			""");
		editor.Extract();

		var expression = editor.GetFormulaExpression(0);

		Assert.Contains("ATK", expression);
		Assert.Contains("DEF", expression);
		Assert.Contains("rand", expression);
	}

	[Fact]
	public void BattleFormulaEditor_Validate_DetectsInvalidRange() {
		var data = new byte[] { 10, 100, 100, 50, 110, 90, 0, 0 }; // Min > Max
		var editor = new BattleFormulaEditor(data);
		editor.LoadSchema("""
			{
				"DamageFormulaOffset": 0,
				"DamageFormulaCount": 1,
				"DamageFormulaSize": 8
			}
			""");
		editor.Extract();

		var errors = editor.Validate();

		Assert.Single(errors);
		Assert.Contains("invalid random range", errors[0]);
	}

	#endregion

	#region Base Class Tests

	[Fact]
	public void GameDataEditor_ExportJson_SerializesRecords() {
		var data = new byte[] { 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();

		var json = editor.ExportJson();

		Assert.Contains("\"Items\"", json);
		Assert.Contains("\"ItemId\": 1", json);
	}

	[Fact]
	public void GameDataEditor_ImportJson_DeserializesRecords() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 1,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");

		var json = """
			[
				{
					"Id": 0,
					"Name": "Test Shop",
					"Items": [
						{ "ItemId": 10 },
						{ "ItemId": 20 }
					]
				}
			]
			""";

		editor.ImportJson(json);

		Assert.Single(editor.Records);
		Assert.Equal("Test Shop", editor.Records[0].Name);
		Assert.Equal(2, editor.Records[0].Items.Count);
	}

	[Fact]
	public void GameDataEditor_Get_ReturnsRecord() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 2,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();

		var shop = editor.Get(1);

		Assert.NotNull(shop);
		Assert.Equal(1, shop.Id);
	}

	[Fact]
	public void GameDataEditor_Clear_RemovesAllRecords() {
		var data = new byte[16];
		var editor = new ShopEditor(data);
		editor.LoadSchema("""
			{
				"TableOffset": 0,
				"ShopCount": 2,
				"RecordSize": 8,
				"MaxItemsPerShop": 4,
				"ItemIdSize": 1
			}
			""");
		editor.Extract();

		editor.Clear();

		Assert.Empty(editor.Records);
	}

	#endregion
}
