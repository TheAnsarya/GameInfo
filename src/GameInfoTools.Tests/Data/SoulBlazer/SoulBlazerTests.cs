using GameInfoTools.Data.SoulBlazer;
using Xunit;

namespace GameInfoTools.Tests.Data.SoulBlazer;

public class SoulBlazerAddressTests {
	[Theory]
	[InlineData(0x008000, 0x000000)] // Bank $00, $8000
	[InlineData(0x00FFFF, 0x007FFF)] // Bank $00, $FFFF
	[InlineData(0x018000, 0x008000)] // Bank $01, $8000
	[InlineData(0x028000, 0x010000)] // Bank $02, $8000
	[InlineData(0x808000, 0x000000)] // Bank $80 mirror
	[InlineData(0x818000, 0x008000)] // Bank $81 mirror
	public void SnesAddressToFileOffset_WithLoRomAddress_ReturnsCorrectOffset(int snesAddress, int expectedOffset) {
		// Act
		var result = SoulBlazerAddresses.SnesAddressToFileOffset(snesAddress);

		// Assert
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x000000, 0x008000)] // File start -> $00:8000
	[InlineData(0x007FFF, 0x00FFFF)] // End of bank $00
	[InlineData(0x008000, 0x018000)] // Bank $01 start
	[InlineData(0x010000, 0x028000)] // Bank $02 start
	public void FileOffsetToSnesAddress_WithValidOffset_ReturnsLoRomAddress(int fileOffset, int expectedAddress) {
		// Act
		var result = SoulBlazerAddresses.FileOffsetToSnesAddress(fileOffset);

		// Assert
		Assert.Equal(expectedAddress, result);
	}

	[Fact]
	public void FormatAddress_WithValidOffset_FormatsCorrectly() {
		// Arrange
		int fileOffset = 0x008000;

		// Act
		var result = SoulBlazerAddresses.FormatAddress(fileOffset);

		// Assert
		Assert.Contains("$01:", result);
		Assert.Contains("0x008000", result);
	}

	[Fact]
	public void ReadPointer24_WithValidData_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x00, 0x80, 0x01];

		// Act
		var result = SoulBlazerAddresses.ReadPointer24(data, 0);

		// Assert
		Assert.Equal(0x018000, result);
	}

	[Fact]
	public void ReadPointer16_WithBank_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x00, 0x80];

		// Act
		var result = SoulBlazerAddresses.ReadPointer16(data, 0, 0x01);

		// Assert
		Assert.Equal(0x018000, result);
	}

	[Fact]
	public void WritePointer24_WritesCorrectly() {
		// Arrange
		var data = new byte[3];

		// Act
		SoulBlazerAddresses.WritePointer24(data, 0, 0x018000);

		// Assert
		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
		Assert.Equal(0x01, data[2]);
	}

	[Fact]
	public void WritePointer16_WritesCorrectly() {
		// Arrange
		var data = new byte[2];

		// Act
		SoulBlazerAddresses.WritePointer16(data, 0, 0x8000);

		// Assert
		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
	}
}

public class SoulBlazerRegionsTests {
	[Fact]
	public void HeaderOffset_IsCorrectValue() {
		Assert.Equal(0x7FC0, SoulBlazerRegions.HeaderOffset);
	}

	[Fact]
	public void ChecksumOffset_IsCorrectValue() {
		Assert.Equal(0x7FDE, SoulBlazerRegions.ChecksumOffset);
	}

	[Fact]
	public void RomSize_Is1MB() {
		Assert.Equal(0x100000, SoulBlazerRegions.RomSize);
	}
}

public class SoulBlazerDataTests {
	[Fact]
	public void ToFileOffset_WithHeaderAndLoRomBank_CalculatesCorrectly() {
		// Bank $01 = offset 0x8000, with header = 0x8000 + 0x200 = 0x8200
		var result = SoulBlazerData.ToFileOffset(0x01, 0x8000, hasHeader: true);
		Assert.Equal(0x8200, result);
	}

	[Fact]
	public void ToFileOffset_WithoutHeader_CalculatesCorrectly() {
		var result = SoulBlazerData.ToFileOffset(0x01, 0x8000, hasHeader: false);
		Assert.Equal(0x8000, result);
	}

	[Fact]
	public void EnemyDataConstants_AreValid() {
		Assert.Equal(16, SoulBlazerData.EnemyEntrySize);
		Assert.Equal(100, SoulBlazerData.EnemyCount);
	}

	[Fact]
	public void ItemDataConstants_AreValid() {
		Assert.Equal(8, SoulBlazerData.ItemEntrySize);
		Assert.Equal(50, SoulBlazerData.ItemCount);
	}

	[Fact]
	public void SoulLairDataConstants_AreValid() {
		Assert.Equal(12, SoulBlazerData.SoulLairEntrySize);
		Assert.Equal(200, SoulBlazerData.SoulLairCount);
	}
}

public class SoulBlazerItemTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 8 bytes: ID, Type, Power, Defense, PriceLo, PriceHi, Flags, Reserved
		byte[] data = [0x01, 0x00, 0x10, 0x05, 0xE8, 0x03, 0x01, 0x00];

		// Act
		var item = SoulBlazerItem.FromBytes(0, data);

		// Assert
		Assert.Equal(0, item.Id);
		Assert.Equal(0x01, item.ItemId);
		Assert.Equal(SoulBlazerItemType.Weapon, item.ItemType);
		Assert.Equal(0x10, item.Power);
		Assert.Equal(0x05, item.Defense);
		Assert.Equal(1000, item.Price); // 0x03E8
		Assert.Equal(SoulBlazerItemFlags.Equippable, item.Flags);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new SoulBlazerItem {
			Id = 5,
			ItemId = 0x0A,
			ItemType = SoulBlazerItemType.Armor,
			Power = 0,
			Defense = 20,
			Price = 5000,
			Flags = SoulBlazerItemFlags.Equippable
		};

		// Act
		var bytes = original.ToBytes();
		var restored = SoulBlazerItem.FromBytes(5, bytes);

		// Assert
		Assert.Equal(original.ItemId, restored.ItemId);
		Assert.Equal(original.ItemType, restored.ItemType);
		Assert.Equal(original.Power, restored.Power);
		Assert.Equal(original.Defense, restored.Defense);
		Assert.Equal(original.Price, restored.Price);
		Assert.Equal(original.Flags, restored.Flags);
	}

	[Fact]
	public void SellPrice_IsHalfOfPrice() {
		// Arrange
		var item = new SoulBlazerItem { Price = 1000 };

		// Act & Assert
		Assert.Equal(500, item.SellPrice);
	}

	[Fact]
	public void TypeName_ReturnsEnumString() {
		// Arrange
		var item = new SoulBlazerItem { ItemType = SoulBlazerItemType.Accessory };

		// Act & Assert
		Assert.Equal("Accessory", item.TypeName);
	}

	[Fact]
	public void FromBytes_WithInsufficientData_ThrowsArgumentException() {
		// Arrange
		byte[] data = [0x01, 0x02, 0x03]; // Only 3 bytes, need 8

		// Act & Assert
		Assert.Throws<ArgumentException>(() => SoulBlazerItem.FromBytes(0, data));
	}
}

public class SoulBlazerEnemyTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 16 bytes of enemy data
		byte[] data = [
			0x01,             // EnemyId
			0xE8, 0x03,       // HP = 1000
			0x20,             // Attack
			0x15,             // Defense
			0x64, 0x00,       // Exp = 100
			0x32,             // Gems = 50
			0x01,             // SoulType = Villager
			0x05,             // SpriteId
			0x02,             // Behavior = ChasePlayer
			0x00, 0x00, 0x00, 0x00, 0x00 // Reserved
		];

		// Act
		var enemy = SoulBlazerEnemy.FromBytes(0, data);

		// Assert
		Assert.Equal(0x01, enemy.EnemyId);
		Assert.Equal(1000, enemy.HP);
		Assert.Equal(0x20, enemy.Attack);
		Assert.Equal(0x15, enemy.Defense);
		Assert.Equal(100, enemy.Exp);
		Assert.Equal(50, enemy.Gems);
		Assert.Equal(SoulBlazerSoulType.Villager, enemy.SoulType);
		Assert.Equal(SoulBlazerEnemyBehavior.ChasePlayer, enemy.Behavior);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new SoulBlazerEnemy {
			Id = 1,
			EnemyId = 0x05,
			HP = 2500,
			Attack = 50,
			Defense = 40,
			Exp = 500,
			Gems = 20,
			SoulType = SoulBlazerSoulType.Animal,
			SpriteId = 10,
			Behavior = SoulBlazerEnemyBehavior.Boss
		};

		// Act
		var bytes = original.ToBytes();
		var restored = SoulBlazerEnemy.FromBytes(1, bytes);

		// Assert
		Assert.Equal(original.EnemyId, restored.EnemyId);
		Assert.Equal(original.HP, restored.HP);
		Assert.Equal(original.Attack, restored.Attack);
		Assert.Equal(original.Defense, restored.Defense);
		Assert.Equal(original.Exp, restored.Exp);
		Assert.Equal(original.Gems, restored.Gems);
		Assert.Equal(original.SoulType, restored.SoulType);
		Assert.Equal(original.Behavior, restored.Behavior);
	}

	[Fact]
	public void IsBoss_WithBossBehavior_ReturnsTrue() {
		// Arrange
		var enemy = new SoulBlazerEnemy { Behavior = SoulBlazerEnemyBehavior.Boss };

		// Act & Assert
		Assert.True(enemy.IsBoss);
	}

	[Fact]
	public void IsBoss_WithMiniBossBehavior_ReturnsTrue() {
		// Arrange
		var enemy = new SoulBlazerEnemy { Behavior = SoulBlazerEnemyBehavior.MiniBoss };

		// Act & Assert
		Assert.True(enemy.IsBoss);
	}

	[Fact]
	public void IsBoss_WithRegularBehavior_ReturnsFalse() {
		// Arrange
		var enemy = new SoulBlazerEnemy { Behavior = SoulBlazerEnemyBehavior.ChasePlayer };

		// Act & Assert
		Assert.False(enemy.IsBoss);
	}

	[Fact]
	public void FromBytes_WithInsufficientData_ThrowsArgumentException() {
		// Arrange
		byte[] data = [0x01, 0x02]; // Only 2 bytes, need 16

		// Act & Assert
		Assert.Throws<ArgumentException>(() => SoulBlazerEnemy.FromBytes(0, data));
	}
}

public class SoulBlazerSoulLairTests {
	[Fact]
	public void FromBytes_WithValidData_ParsesCorrectly() {
		// Arrange - 12 bytes
		byte[] data = [
			0x40, 0x01,       // X = 0x0140 = 320
			0x80, 0x00,       // Y = 0x0080 = 128
			0x05,             // EnemyType
			0x03,             // EnemyCount
			0x02,             // SoulsRequired
			0x00,             // ReleaseType = Villager
			0x0A,             // ReleaseId
			0x01,             // MapId
			0x00, 0x00        // Reserved
		];

		// Act
		var lair = SoulBlazerSoulLair.FromBytes(0, data);

		// Assert
		Assert.Equal(320, lair.X);
		Assert.Equal(128, lair.Y);
		Assert.Equal(5, lair.EnemyType);
		Assert.Equal(3, lair.EnemyCount);
		Assert.Equal(2, lair.SoulsRequired);
		Assert.Equal(SoulBlazerReleaseType.Villager, lair.ReleaseType);
		Assert.Equal(0x0A, lair.ReleaseId);
		Assert.Equal(1, lair.MapId);
	}

	[Fact]
	public void ToBytes_RoundTrip_PreservesData() {
		// Arrange
		var original = new SoulBlazerSoulLair {
			Id = 1,
			X = 500,
			Y = 300,
			EnemyType = 10,
			EnemyCount = 5,
			SoulsRequired = 3,
			ReleaseType = SoulBlazerReleaseType.Animal,
			ReleaseId = 15,
			MapId = 5
		};

		// Act
		var bytes = original.ToBytes();
		var restored = SoulBlazerSoulLair.FromBytes(1, bytes);

		// Assert
		Assert.Equal(original.X, restored.X);
		Assert.Equal(original.Y, restored.Y);
		Assert.Equal(original.EnemyType, restored.EnemyType);
		Assert.Equal(original.EnemyCount, restored.EnemyCount);
		Assert.Equal(original.SoulsRequired, restored.SoulsRequired);
		Assert.Equal(original.ReleaseType, restored.ReleaseType);
		Assert.Equal(original.ReleaseId, restored.ReleaseId);
		Assert.Equal(original.MapId, restored.MapId);
	}

	[Fact]
	public void FromBytes_WithInsufficientData_ThrowsArgumentException() {
		// Arrange
		byte[] data = [0x01, 0x02, 0x03]; // Only 3 bytes, need 12

		// Act & Assert
		Assert.Throws<ArgumentException>(() => SoulBlazerSoulLair.FromBytes(0, data));
	}
}

public class SoulBlazerEditorTests {
	[Fact]
	public void Constructor_WithValidRomData_InitializesCorrectly() {
		// Arrange - Create minimal ROM data (1MB)
		var romData = new byte[SoulBlazerRegions.RomSize];

		// Act
		var editor = new SoulBlazerEditor(romData);

		// Assert
		Assert.NotNull(editor);
		Assert.Equal(SoulBlazerRegions.RomSize, editor.RomSize);
	}

	[Fact]
	public void Constructor_WithHeader_DetectsHeader() {
		// Arrange - Create ROM with 512-byte header
		var romData = new byte[SoulBlazerRegions.RomSize + SoulBlazerRegions.HeaderSize];

		// Act
		var editor = new SoulBlazerEditor(romData);

		// Assert
		Assert.True(editor.HasHeader);
	}

	[Fact]
	public void Constructor_WithoutHeader_DetectsNoHeader() {
		// Arrange
		var romData = new byte[SoulBlazerRegions.RomSize];

		// Act
		var editor = new SoulBlazerEditor(romData);

		// Assert
		Assert.False(editor.HasHeader);
	}

	[Fact]
	public void LoadItems_WithValidRom_ReturnsItems() {
		// Arrange
		var romData = new byte[SoulBlazerRegions.RomSize];
		var editor = new SoulBlazerEditor(romData);

		// Act & Assert
		Assert.NotNull(editor.Items);
	}

	[Fact]
	public void LoadEnemies_WithValidRom_ReturnsEnemies() {
		// Arrange
		var romData = new byte[SoulBlazerRegions.RomSize];
		var editor = new SoulBlazerEditor(romData);

		// Act & Assert
		Assert.NotNull(editor.Enemies);
	}

	[Fact]
	public void LoadSoulLairs_WithValidRom_ReturnsSoulLairs() {
		// Arrange
		var romData = new byte[SoulBlazerRegions.RomSize];
		var editor = new SoulBlazerEditor(romData);

		// Act & Assert
		Assert.NotNull(editor.SoulLairs);
	}

	[Fact]
	public void VerifyChecksum_WithValidChecksum_ReturnsTrue() {
		// Arrange - Create ROM with valid checksum
		var romData = new byte[SoulBlazerRegions.RomSize];
		var editor = new SoulBlazerEditor(romData);

		// Set a valid checksum (0xFFFF XOR complement)
		editor.UpdateChecksum();

		// Act & Assert
		Assert.True(editor.VerifyChecksum());
	}
}

public class SoulBlazerStatsTests {
	[Fact]
	public void FromEditor_WithValidEditor_GeneratesStats() {
		// Arrange
		var romData = new byte[SoulBlazerRegions.RomSize];
		var editor = new SoulBlazerEditor(romData);

		// Act
		var stats = SoulBlazerStats.FromEditor(editor);

		// Assert
		Assert.NotNull(stats);
		Assert.True(stats.TotalItems >= 0);
		Assert.True(stats.TotalEnemies >= 0);
		Assert.True(stats.TotalSoulLairs >= 0);
	}

	[Fact]
	public void ToReport_GeneratesFormattedReport() {
		// Arrange
		var stats = new SoulBlazerStats {
			TotalItems = 50,
			WeaponCount = 10,
			ArmorCount = 10,
			TotalEnemies = 100,
			BossCount = 8,
			RegularEnemyCount = 92
		};

		// Act
		var report = stats.ToReport();

		// Assert
		Assert.Contains("Soul Blazer", report);
		Assert.Contains("50", report);
		Assert.Contains("100", report);
	}

	[Fact]
	public void ToJson_GeneratesValidJson() {
		// Arrange
		var stats = new SoulBlazerStats {
			TotalItems = 50,
			TotalEnemies = 100
		};

		// Act
		var json = stats.ToJson();

		// Assert
		Assert.Contains("totalItems", json); // camelCase
		Assert.Contains("50", json);
	}
}

public class SoulBlazerBalanceTests {
	[Fact]
	public void AnalyzeItems_WithZeroPowerWeapon_ReportsIssue() {
		// Arrange
		var balance = new SoulBlazerBalance();
		var items = new List<SoulBlazerItem> {
			new() { ItemType = SoulBlazerItemType.Weapon, Power = 0 }
		};

		// Act
		balance.AnalyzeItems(items);

		// Assert
		Assert.Contains(balance.Issues, i => i.Contains("0 power"));
	}

	[Fact]
	public void AnalyzeEnemies_WithZeroHpEnemy_ReportsIssue() {
		// Arrange
		var balance = new SoulBlazerBalance();
		var enemies = new List<SoulBlazerEnemy> {
			new() { HP = 0 }
		};

		// Act
		balance.AnalyzeEnemies(enemies);

		// Assert
		Assert.Contains(balance.Issues, i => i.Contains("0 HP"));
	}

	[Fact]
	public void AnalyzeSoulLairs_WithEmptyLair_ReportsWarning() {
		// Arrange
		var balance = new SoulBlazerBalance();
		var lairs = new List<SoulBlazerSoulLair> {
			new() { EnemyCount = 0 }
		};

		// Act
		balance.AnalyzeSoulLairs(lairs);

		// Assert
		Assert.Contains(balance.Warnings, w => w.Contains("0 enemies"));
	}

	[Fact]
	public void ToReport_WithNoIssues_ReportsClean() {
		// Arrange
		var balance = new SoulBlazerBalance();

		// Act
		var report = balance.ToReport();

		// Assert
		Assert.Contains("No balance issues", report);
	}
}
