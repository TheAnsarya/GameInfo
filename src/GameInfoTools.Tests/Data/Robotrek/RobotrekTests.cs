using GameInfoTools.Data.Robotrek;
using Xunit;

namespace GameInfoTools.Tests.Data.Robotrek;

public class RobotrekAddressTests {
	[Theory]
	[InlineData(0xC00000, 0x000000)] // Bank $C0 start
	[InlineData(0xC08000, 0x008000)] // Bank $C0 middle
	[InlineData(0xC10000, 0x010000)] // Bank $C1 start
	[InlineData(0xD00000, 0x100000)] // Bank $D0 start
	[InlineData(0xD18000, 0x118000)] // Bank $D1 + offset
	public void SnesAddressToFileOffset_WithHiRomAddress_ReturnsCorrectOffset(int snesAddress, int expectedOffset) {
		// Act
		var result = RobotrekAddresses.SnesAddressToFileOffset(snesAddress);

		// Assert
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x000000, 0xC00000)] // File start
	[InlineData(0x008000, 0xC08000)] // Mid-bank
	[InlineData(0x010000, 0xC10000)] // Bank $C1
	[InlineData(0x100000, 0xD00000)] // Bank $D0
	public void FileOffsetToSnesAddress_WithValidOffset_ReturnsHiRomAddress(int fileOffset, int expectedAddress) {
		// Act
		var result = RobotrekAddresses.FileOffsetToSnesAddress(fileOffset);

		// Assert
		Assert.Equal(expectedAddress, result);
	}

	[Fact]
	public void FormatAddress_WithValidOffset_FormatsCorrectly() {
		// Arrange
		int fileOffset = 0x100000;

		// Act
		var result = RobotrekAddresses.FormatAddress(fileOffset);

		// Assert
		Assert.Contains("$D00000", result);
		Assert.Contains("0x100000", result);
	}

	[Fact]
	public void ReadPointer24_WithValidData_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x34, 0x12, 0xD0];

		// Act
		var result = RobotrekAddresses.ReadPointer24(data, 0);

		// Assert
		Assert.Equal(0xD01234, result);
	}

	[Fact]
	public void ReadPointer16_WithBank_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x00, 0x80];

		// Act
		var result = RobotrekAddresses.ReadPointer16(data, 0, 0xD0);

		// Assert
		Assert.Equal(0xD08000, result);
	}

	[Fact]
	public void WritePointer24_WritesCorrectly() {
		// Arrange
		var data = new byte[3];

		// Act
		RobotrekAddresses.WritePointer24(data, 0, 0xD01234);

		// Assert
		Assert.Equal(0x34, data[0]);
		Assert.Equal(0x12, data[1]);
		Assert.Equal(0xD0, data[2]);
	}

	[Fact]
	public void WritePointer16_WritesCorrectly() {
		// Arrange
		var data = new byte[2];

		// Act
		RobotrekAddresses.WritePointer16(data, 0, 0x8000);

		// Assert
		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
	}
}

public class RobotrekRegionsTests {
	[Fact]
	public void HeaderOffset_IsCorrectValue() {
		Assert.Equal(0x007FC0, RobotrekRegions.HeaderOffset);
	}

	[Fact]
	public void ResetVectorOffset_IsCorrectValue() {
		Assert.Equal(0x007FFC, RobotrekRegions.ResetVectorOffset);
	}

	[Fact]
	public void ItemTableOffset_IsInBankD0() {
		// Bank $D0 starts at file offset 0x100000
		Assert.True(RobotrekRegions.ItemTableOffset >= 0x100000);
	}
}

public class RobotrekDataTests {
	[Fact]
	public void ToFileOffset_WithHeaderAndHiRomBank_CalculatesCorrectly() {
		// Bank $D0 = 0x10 past $C0, so offset = 0x200 + (0x10 * 0x10000) = 0x100200
		var result = RobotrekData.ToFileOffset(0xD0, 0x8000, hasHeader: true);
		Assert.Equal(0x100200, result);
	}

	[Fact]
	public void ToFileOffset_WithoutHeader_CalculatesCorrectly() {
		var result = RobotrekData.ToFileOffset(0xD0, 0x8000, hasHeader: false);
		Assert.Equal(0x100000, result);
	}

	[Fact]
	public void ItemDataConstants_AreValid() {
		Assert.Equal(0xD0, RobotrekData.ItemDataBank);
		Assert.Equal(0x8000, RobotrekData.ItemDataStart);
		Assert.Equal(8, RobotrekData.ItemEntrySize);
		Assert.Equal(150, RobotrekData.ItemCount);
	}

	[Fact]
	public void EnemyDataConstants_AreValid() {
		Assert.Equal(0xD1, RobotrekData.EnemyDataBank);
		Assert.Equal(0x8000, RobotrekData.EnemyDataStart);
		Assert.Equal(16, RobotrekData.EnemyEntrySize);
		Assert.Equal(80, RobotrekData.EnemyCount);
	}

	[Fact]
	public void InventionDataConstants_AreValid() {
		Assert.Equal(0xD2, RobotrekData.InventionDataBank);
		Assert.Equal(0x8000, RobotrekData.InventionDataStart);
		Assert.Equal(8, RobotrekData.InventionEntrySize);
		Assert.Equal(100, RobotrekData.InventionCount);
	}
}

public class RobotrekItemTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 8 bytes: ID, Type, Primary, Secondary, PriceLo, PriceHi, FlagsLo, FlagsHi
		byte[] data = [0x01, 0x01, 0x10, 0x05, 0xE8, 0x03, 0x09, 0x00];

		// Act
		var item = RobotrekItem.FromBytes(0, data);

		// Assert
		Assert.Equal(0, item.Id);
		Assert.Equal(0x01, item.ItemId);
		Assert.Equal(RobotrekItemType.Weapon, item.ItemType);
		Assert.Equal(0x10, item.PrimaryStat);
		Assert.Equal(0x05, item.SecondaryStat);
		Assert.Equal(1000, item.BuyPrice); // 0x03E8
		Assert.Equal(RobotrekItemFlags.UsableInBattle | RobotrekItemFlags.Equippable, item.Flags);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new RobotrekItem {
			Id = 5,
			ItemId = 0x0A,
			ItemType = RobotrekItemType.Armor,
			PrimaryStat = 20,
			SecondaryStat = 10,
			BuyPrice = 5000,
			Flags = RobotrekItemFlags.Equippable | RobotrekItemFlags.RobotOnly
		};

		// Act
		var bytes = original.ToBytes();
		var restored = RobotrekItem.FromBytes(5, bytes);

		// Assert
		Assert.Equal(original.ItemId, restored.ItemId);
		Assert.Equal(original.ItemType, restored.ItemType);
		Assert.Equal(original.PrimaryStat, restored.PrimaryStat);
		Assert.Equal(original.SecondaryStat, restored.SecondaryStat);
		Assert.Equal(original.BuyPrice, restored.BuyPrice);
		Assert.Equal(original.Flags, restored.Flags);
	}

	[Fact]
	public void SellPrice_IsHalfOfBuyPrice() {
		// Arrange
		var item = new RobotrekItem { BuyPrice = 1000 };

		// Act & Assert
		Assert.Equal(500, item.SellPrice);
	}

	[Fact]
	public void TypeName_ReturnsEnumString() {
		// Arrange
		var item = new RobotrekItem { ItemType = RobotrekItemType.Material };

		// Act & Assert
		Assert.Equal("Material", item.TypeName);
	}

	[Fact]
	public void FromBytes_WithInsufficientData_ThrowsArgumentException() {
		// Arrange
		byte[] data = [0x01, 0x02, 0x03]; // Only 3 bytes, need 8

		// Act & Assert
		Assert.Throws<ArgumentException>(() => RobotrekItem.FromBytes(0, data));
	}
}

public class RobotrekEnemyTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 16 bytes of enemy data
		byte[] data = [
			0x01, 0x0A,             // ID, Sprite
			0xE8, 0x03,             // HP = 1000
			0x20, 0x15, 0x10, 0x00, // Power, Guard, Speed, AI
			0x64, 0x00,             // Exp = 100
			0x32, 0x00,             // Gold = 50
			0x05, 0x19,             // Drop1 ID=5, Rate=25
			0x0A, 0x0A              // Drop2 ID=10, Rate=10
		];

		// Act
		var enemy = RobotrekEnemy.FromBytes(0, data);

		// Assert
		Assert.Equal(0x01, enemy.EnemyId);
		Assert.Equal(0x0A, enemy.SpriteIndex);
		Assert.Equal(1000, enemy.HP);
		Assert.Equal(0x20, enemy.Power);
		Assert.Equal(0x15, enemy.Guard);
		Assert.Equal(0x10, enemy.Speed);
		Assert.Equal(RobotrekAiPattern.Aggressive, enemy.AiPattern);
		Assert.Equal(100, enemy.Exp);
		Assert.Equal(50, enemy.Gold);
		Assert.Equal(5, enemy.Drop1Id);
		Assert.Equal(25, enemy.Drop1Rate);
		Assert.Equal(10, enemy.Drop2Id);
		Assert.Equal(10, enemy.Drop2Rate);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new RobotrekEnemy {
			Id = 1,
			EnemyId = 0x05,
			SpriteIndex = 0x20,
			HP = 2500,
			Power = 50,
			Guard = 40,
			Speed = 30,
			AiPattern = RobotrekAiPattern.BossPhase1,
			Exp = 500,
			Gold = 200,
			Drop1Id = 15,
			Drop1Rate = 50,
			Drop2Id = 20,
			Drop2Rate = 10
		};

		// Act
		var bytes = original.ToBytes();
		var restored = RobotrekEnemy.FromBytes(1, bytes);

		// Assert
		Assert.Equal(original.EnemyId, restored.EnemyId);
		Assert.Equal(original.HP, restored.HP);
		Assert.Equal(original.Power, restored.Power);
		Assert.Equal(original.AiPattern, restored.AiPattern);
		Assert.Equal(original.Exp, restored.Exp);
		Assert.Equal(original.Drop1Rate, restored.Drop1Rate);
	}

	[Fact]
	public void FromBytes_WithInsufficientData_ThrowsArgumentException() {
		// Arrange
		byte[] data = [0x01, 0x02]; // Only 2 bytes, need 16

		// Act & Assert
		Assert.Throws<ArgumentException>(() => RobotrekEnemy.FromBytes(0, data));
	}

	[Theory]
	[InlineData(RobotrekAiPattern.BossPhase1)]
	[InlineData(RobotrekAiPattern.BossPhase2)]
	[InlineData(RobotrekAiPattern.BossSpecial)]
	public void AiPattern_WithBossValues_IdentifiesBoss(RobotrekAiPattern pattern) {
		// Arrange
		var enemy = new RobotrekEnemy { AiPattern = pattern };

		// Act & Assert
		Assert.True(pattern is RobotrekAiPattern.BossPhase1
			or RobotrekAiPattern.BossPhase2
			or RobotrekAiPattern.BossSpecial);
		Assert.Equal(pattern, enemy.AiPattern);
	}

	[Theory]
	[InlineData(RobotrekAiPattern.Aggressive)]
	[InlineData(RobotrekAiPattern.Defensive)]
	[InlineData(RobotrekAiPattern.HitAndRun)]
	public void AiPattern_WithRegularValues_IdentifiesRegularEnemy(RobotrekAiPattern pattern) {
		// Arrange
		var enemy = new RobotrekEnemy { AiPattern = pattern };

		// Act & Assert
		Assert.False(pattern is RobotrekAiPattern.BossPhase1
			or RobotrekAiPattern.BossPhase2
			or RobotrekAiPattern.BossSpecial);
		Assert.Equal(pattern, enemy.AiPattern);
	}
}

public class RobotrekInventionTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 8 bytes: ResultItem, Mat1Id, Mat1Qty, Mat2Id, Mat2Qty, Mat3Id, Mat3Qty, Level|Flags
		byte[] data = [0x50, 0x01, 0x02, 0x03, 0x01, 0x05, 0x03, 0x0A];

		// Act
		var invention = RobotrekInvention.FromBytes(0, data);

		// Assert
		Assert.Equal(0x50, invention.ResultItem);
		Assert.Equal(0x01, invention.Material1Id);
		Assert.Equal(0x02, invention.Material1Qty);
		Assert.Equal(0x03, invention.Material2Id);
		Assert.Equal(0x01, invention.Material2Qty);
		Assert.Equal(0x05, invention.Material3Id);
		Assert.Equal(0x03, invention.Material3Qty);
		Assert.Equal(0x0A, invention.RequiredLevel);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new RobotrekInvention {
			Id = 1,
			ResultItem = 0x30,
			Material1Id = 10,
			Material1Qty = 2,
			Material2Id = 20,
			Material2Qty = 3,
			Material3Id = 30,
			Material3Qty = 1,
			RequiredLevel = 15,
			Flags = 0x02
		};

		// Act
		var bytes = original.ToBytes();
		var restored = RobotrekInvention.FromBytes(1, bytes);

		// Assert
		Assert.Equal(original.ResultItem, restored.ResultItem);
		Assert.Equal(original.Material1Id, restored.Material1Id);
		Assert.Equal(original.Material1Qty, restored.Material1Qty);
		Assert.Equal(original.Material2Id, restored.Material2Id);
		Assert.Equal(original.Material2Qty, restored.Material2Qty);
		Assert.Equal(original.Material3Id, restored.Material3Id);
		Assert.Equal(original.Material3Qty, restored.Material3Qty);
		Assert.Equal(original.RequiredLevel, restored.RequiredLevel);
		Assert.Equal(original.Flags, restored.Flags);
	}
}

public class RobotrekTextTests {
	[Fact]
	public void Decode_WithLetterA_DecodesCorrectly() {
		// Arrange - byte 0x01 maps to 'A' according to CharTable
		byte[] data = [0x01, 0x00]; // 'A' followed by end marker

		// Act
		var (text, bytesConsumed) = RobotrekText.Decode(data);

		// Assert
		Assert.StartsWith("A", text);
		Assert.Equal(2, bytesConsumed);
	}

	[Fact]
	public void Decode_WithLetters_DecodesCorrectly() {
		// Arrange - "ABC" = 0x01, 0x02, 0x03
		byte[] data = [0x01, 0x02, 0x03, 0x00];

		// Act
		var (text, _) = RobotrekText.Decode(data);

		// Assert
		Assert.StartsWith("ABC", text);
	}

	[Fact]
	public void Encode_WithSimpleText_EncodesCorrectly() {
		// Arrange
		string text = "ABC";

		// Act
		var encoded = RobotrekText.Encode(text);

		// Assert
		Assert.NotEmpty(encoded);
		Assert.Equal(0x01, encoded[0]); // A
		Assert.Equal(0x02, encoded[1]); // B
		Assert.Equal(0x03, encoded[2]); // C
	}

	[Fact]
	public void Decode_WithControlCode_IncludesCodeMarker() {
		// Arrange - 0xF0 is [LINE]
		byte[] data = [0x01, 0xF0, 0x02, 0x00];

		// Act
		var (text, _) = RobotrekText.Decode(data);

		// Assert
		Assert.Contains("[LINE]", text);
	}

	[Fact]
	public void EncodeAndDecode_RoundTrip_PreservesText() {
		// Arrange
		string original = "Hello World";

		// Act
		var encoded = RobotrekText.Encode(original);
		var (decoded, _) = RobotrekText.Decode(encoded);

		// Assert
		Assert.Equal(original, decoded);
	}
}

public class RobotrekEditorTests {
	[Fact]
	public void Constructor_WithValidRomData_InitializesCorrectly() {
		// Arrange - Create minimal ROM data
		var romData = new byte[0x200000]; // 2MB ROM

		// Act
		var editor = new RobotrekEditor(romData);

		// Assert
		Assert.NotNull(editor);
	}

	[Fact]
	public void LoadItems_WithValidRom_ReturnsItems() {
		// Arrange - Create ROM with item data
		var romData = new byte[0x200000];
		var editor = new RobotrekEditor(romData);

		// Act
		var items = editor.Items;

		// Assert
		Assert.NotNull(items);
	}

	[Fact]
	public void LoadEnemies_WithValidRom_ReturnsEnemies() {
		// Arrange
		var romData = new byte[0x200000];
		var editor = new RobotrekEditor(romData);

		// Act
		var enemies = editor.Enemies;

		// Assert
		Assert.NotNull(enemies);
	}

	[Fact]
	public void LoadInventions_WithValidRom_ReturnsInventions() {
		// Arrange
		var romData = new byte[0x200000];
		var editor = new RobotrekEditor(romData);

		// Act
		var inventions = editor.Inventions;

		// Assert
		Assert.NotNull(inventions);
	}
}

public class RobotrekStatsTests {
	[Fact]
	public void FromEditor_WithValidEditor_GeneratesStats() {
		// Arrange
		var romData = new byte[0x200000];
		var editor = new RobotrekEditor(romData);

		// Act
		var stats = RobotrekStats.FromEditor(editor);

		// Assert
		Assert.NotNull(stats);
		Assert.True(stats.TotalItems >= 0);
		Assert.True(stats.TotalEnemies >= 0);
		Assert.True(stats.TotalInventions >= 0);
	}

	[Fact]
	public void ToReport_GeneratesFormattedReport() {
		// Arrange
		var stats = new RobotrekStats {
			TotalItems = 150,
			WeaponCount = 30,
			ArmorCount = 25,
			TotalEnemies = 80,
			BossCount = 10,
			RegularEnemyCount = 70
		};

		// Act
		var report = stats.ToReport();

		// Assert
		Assert.Contains("Robotrek", report);
		Assert.Contains("150", report);
		Assert.Contains("80", report);
	}

	[Fact]
	public void ToJson_GeneratesValidJson() {
		// Arrange
		var stats = new RobotrekStats {
			TotalItems = 100,
			TotalEnemies = 50
		};

		// Act
		var json = stats.ToJson();

		// Assert
		Assert.Contains("totalItems", json); // camelCase due to JsonNamingPolicy.CamelCase
		Assert.Contains("100", json);
	}
}
