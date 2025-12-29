using GameInfoTools.Data.SecretOfMana;
using Xunit;

namespace GameInfoTools.Tests.Data.SecretOfMana;

public class SecretOfManaAddressTests {
	[Theory]
	[InlineData(0xc00000, 0x000000)] // Bank $c0, $0000
	[InlineData(0xc10000, 0x010000)] // Bank $c1, $0000
	[InlineData(0xc0ffff, 0x00ffff)] // Bank $c0, $ffff
	[InlineData(0xd00000, 0x100000)] // Bank $d0, $0000
	[InlineData(0xdf0000, 0x1f0000)] // Bank $df, $0000
	public void SnesAddressToFileOffset_WithHiRomDirectAddress_ReturnsCorrectOffset(int snesAddress, int expectedOffset) {
		// Act
		var result = SecretOfManaAddresses.SnesAddressToFileOffset(snesAddress);

		// Assert
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x400000, 0x000000)] // Bank $40 mirror, $0000
	[InlineData(0x410000, 0x010000)] // Bank $41 mirror, $0000
	[InlineData(0x500000, 0x100000)] // Bank $50 mirror, $0000
	[InlineData(0x5f0000, 0x1f0000)] // Bank $5f mirror, $0000 (end of 2MB ROM)
	public void SnesAddressToFileOffset_WithMirrorAddress_ReturnsCorrectOffset(int snesAddress, int expectedOffset) {
		// Act
		var result = SecretOfManaAddresses.SnesAddressToFileOffset(snesAddress);

		// Assert
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x000000, 0xc00000)] // File start -> $c0:0000
	[InlineData(0x010000, 0xc10000)] // -> $c1:0000
	[InlineData(0x100000, 0xd00000)] // -> $d0:0000
	[InlineData(0x1fffff, 0xdfffff)] // End of ROM
	public void FileOffsetToSnesAddress_WithValidOffset_ReturnsHiRomAddress(int fileOffset, int expectedAddress) {
		// Act
		var result = SecretOfManaAddresses.FileOffsetToSnesAddress(fileOffset);

		// Assert
		Assert.Equal(expectedAddress, result);
	}

	[Fact]
	public void FileOffsetToSnesAddress_WithInvalidOffset_ThrowsException() {
		// Arrange
		int invalidOffset = 0x300000; // Beyond 2MB

		// Act & Assert
		Assert.Throws<ArgumentOutOfRangeException>(() =>
			SecretOfManaAddresses.FileOffsetToSnesAddress(invalidOffset));
	}

	[Fact]
	public void FormatAddress_WithValidOffset_FormatsCorrectly() {
		// Arrange
		int fileOffset = 0x101dfa; // Enemy stats offset

		// Act
		var result = SecretOfManaAddresses.FormatAddress(fileOffset);

		// Assert
		Assert.Contains("$d0:", result);
		Assert.Contains("1dfa", result);
		Assert.Contains("0x101dfa", result);
	}

	[Fact]
	public void FormatCpuAddress_WithValidAddress_FormatsCorrectly() {
		// Arrange
		int cpuAddress = 0xd01dfa;

		// Act
		var result = SecretOfManaAddresses.FormatCpuAddress(cpuAddress);

		// Assert
		Assert.Equal("$d0:1dfa", result);
	}

	[Fact]
	public void ReadPointer24_WithValidData_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x00, 0x00, 0xc0]; // $c0:0000

		// Act
		var result = SecretOfManaAddresses.ReadPointer24(data, 0);

		// Assert
		Assert.Equal(0xc00000, result);
	}

	[Fact]
	public void ReadPointer16_WithBank_ReadsCorrectly() {
		// Arrange
		byte[] data = [0x00, 0x80]; // $8000

		// Act
		var result = SecretOfManaAddresses.ReadPointer16(data, 0, 0xc0);

		// Assert
		Assert.Equal(0xc08000, result);
	}

	[Fact]
	public void WritePointer24_WritesCorrectly() {
		// Arrange
		var data = new byte[3];

		// Act
		SecretOfManaAddresses.WritePointer24(data, 0, 0xc08000);

		// Assert
		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
		Assert.Equal(0xc0, data[2]);
	}

	[Fact]
	public void WritePointer16_WritesCorrectly() {
		// Arrange
		var data = new byte[2];

		// Act
		SecretOfManaAddresses.WritePointer16(data, 0, 0x8000);

		// Assert
		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
	}

	[Fact]
	public void ReadWord_ReadsLittleEndian() {
		// Arrange
		byte[] data = [0xcd, 0xab]; // $abcd in little-endian

		// Act
		var result = SecretOfManaAddresses.ReadWord(data, 0);

		// Assert
		Assert.Equal(0xabcd, result);
	}

	[Fact]
	public void WriteWord_WritesLittleEndian() {
		// Arrange
		var data = new byte[2];

		// Act
		SecretOfManaAddresses.WriteWord(data, 0, 0xabcd);

		// Assert
		Assert.Equal(0xcd, data[0]);
		Assert.Equal(0xab, data[1]);
	}

	[Theory]
	[InlineData(0x101dfa, 0xd01dfa)] // Enemy stats
	[InlineData(0x104213, 0xd04213)] // Character stats
	[InlineData(0x083000, 0xc83000)] // Exit data
	public void KnownAddresses_RoundTrip_Correctly(int fileOffset, int expectedCpuAddress) {
		// Act
		int cpuAddress = SecretOfManaAddresses.FileOffsetToSnesAddress(fileOffset);
		int roundTripped = SecretOfManaAddresses.SnesAddressToFileOffset(cpuAddress);

		// Assert
		Assert.Equal(expectedCpuAddress, cpuAddress);
		Assert.Equal(fileOffset, roundTripped);
	}
}

public class SecretOfManaDataTests {
	[Fact]
	public void Constants_HaveCorrectValues() {
		// Assert ROM info
		Assert.Equal(0x200000, SecretOfManaData.RomSize);
		Assert.Equal(0x51fc, SecretOfManaData.InternalChecksum);

		// Assert key addresses are lowercase (verify format)
		var sha256 = SecretOfManaData.ExpectedSha256;
		Assert.Equal(sha256.ToLowerInvariant(), sha256);
	}

	[Fact]
	public void EnemyConstants_AreValid() {
		Assert.Equal(83, SecretOfManaData.EnemyCount);
		Assert.Equal(29, SecretOfManaData.EnemyStatsEntrySize);
		Assert.True(SecretOfManaData.EnemyStatsOffset > 0);
	}

	[Fact]
	public void CharacterConstants_AreValid() {
		Assert.Equal(3, SecretOfManaData.CharacterCount);
		Assert.Equal(40, SecretOfManaData.CharacterLevelEntrySize);
		Assert.Equal(99, SecretOfManaData.MaxLevel);
	}
}

public class SecretOfManaStatsTests {
	[Fact]
	public void ManaSpirit_HasAllSpirits() {
		var spirits = Enum.GetValues<ManaSpirit>();
		Assert.Equal(8, spirits.Length);
	}

	[Fact]
	public void WeaponType_HasAllWeapons() {
		var weapons = Enum.GetValues<WeaponType>();
		Assert.Equal(8, weapons.Length);
	}

	[Fact]
	public void Elements_MatchSpirits() {
		// Each spirit corresponds to an element
		Assert.Equal((byte)Elements.Undine, 1 << (int)ManaSpirit.Undine);
		Assert.Equal((byte)Elements.Salamando, 1 << (int)ManaSpirit.Salamando);
	}

	[Fact]
	public void StatusEffects_AreFlagsEnum() {
		// Test that status effects can be combined
		var combined = StatusEffects.Poison | StatusEffects.Sleep;
		Assert.True(combined.HasFlag(StatusEffects.Poison));
		Assert.True(combined.HasFlag(StatusEffects.Sleep));
		Assert.False(combined.HasFlag(StatusEffects.Petrify));
	}

	[Fact]
	public void SecretOfManaEnemy_FromBytes_ParsesCorrectly() {
		// Arrange - create mock enemy data (29-byte format)
		// HP is byte at offset 0, not a word
		var data = new byte[29];
		data[0] = 20; // HP = 20 (Rabite)
		data[1] = 20; // Unknown1 (often duplicates HP)
		data[8] = 0x08; // Attribute8
		data[9] = 0x08; // Attribute9
		data[10] = 210; // AttackMod
		data[11] = 0; // DefenseMod
		data[20] = 0x02; data[21] = 0x20; // ExpRaw = 0x2002

		// Act
		var enemy = SecretOfManaEnemy.FromBytes(0, data);

		// Assert
		Assert.Equal(20, enemy.Hp);
		Assert.Equal(20, enemy.Unknown1);
		Assert.Equal(0x08, enemy.Attribute8);
		Assert.Equal(210, enemy.AttackMod);
		Assert.Equal(0x2002, enemy.ExpRaw);
	}

	[Fact]
	public void SecretOfManaEnemy_ToBytes_SerializesCorrectly() {
		// Arrange - 29-byte format
		var rawData = new byte[29];
		rawData[0] = 55;  // HP
		rawData[1] = 55;  // Unknown1

		var enemy = new SecretOfManaEnemy {
			Id = 15,
			Hp = 55,
			Unknown1 = 55,
			Attribute8 = 0x10,
			Attribute9 = 0x04,
			AttackMod = 64,
			DefenseMod = 31,
			ExpRaw = 0x0b25,
			RawData = rawData
		};

		// Act
		var bytes = enemy.ToBytes();

		// Assert
		Assert.Equal(55, bytes[0]); // HP
		Assert.Equal(55, bytes[1]); // Unknown1
		Assert.Equal(64, bytes[10]); // AttackMod
		Assert.Equal(0x25, bytes[20]); // ExpRaw low byte
		Assert.Equal(0x0b, bytes[21]); // ExpRaw high byte
	}

	[Fact]
	public void SecretOfManaEnemy_RoundTrip_PreservesData() {
		// Arrange - 29-byte format
		var rawData = new byte[29];
		for (int i = 0; i < 29; i++) rawData[i] = (byte)i;
		rawData[0] = 128; // HP
		rawData[1] = 128; // Unknown1

		var original = new SecretOfManaEnemy {
			Id = 0,
			Hp = 128,
			Unknown1 = 128,
			Attribute8 = 8,
			Attribute9 = 9,
			AttackMod = 50,
			DefenseMod = 25,
			ExpRaw = 1000,
			RawData = rawData
		};

		// Act
		var bytes = original.ToBytes();
		var restored = SecretOfManaEnemy.FromBytes(0, bytes);

		// Assert
		Assert.Equal(original.Hp, restored.Hp);
		Assert.Equal(original.Unknown1, restored.Unknown1);
		Assert.Equal(original.Attribute8, restored.Attribute8);
		Assert.Equal(original.Attribute9, restored.Attribute9);
		Assert.Equal(original.AttackMod, restored.AttackMod);
		Assert.Equal(original.DefenseMod, restored.DefenseMod);
		Assert.Equal(original.ExpRaw, restored.ExpRaw);
	}

	[Fact]
	public void SecretOfManaExit_FromBytes_ParsesCorrectly() {
		// Arrange
		byte[] data = [0x10, 0x20, 0x30, 0x00]; // Map 16, X=32, Y=48, Flags=0

		// Act
		var exit = SecretOfManaExit.FromBytes(0, data);

		// Assert
		Assert.Equal(0x10, exit.DestinationMap);
		Assert.Equal(0x20, exit.DestinationX);
		Assert.Equal(0x30, exit.DestinationY);
		Assert.Equal(0x00, exit.Flags);
	}

	[Fact]
	public void SecretOfManaExit_RoundTrip_PreservesData() {
		// Arrange
		var original = new SecretOfManaExit {
			Id = 5,
			DestinationMap = 0x42,
			DestinationX = 0x80,
			DestinationY = 0x40,
			Flags = 0x01
		};

		// Act
		var bytes = original.ToBytes();
		var restored = SecretOfManaExit.FromBytes(5, bytes);

		// Assert
		Assert.Equal(original.DestinationMap, restored.DestinationMap);
		Assert.Equal(original.DestinationX, restored.DestinationX);
		Assert.Equal(original.DestinationY, restored.DestinationY);
		Assert.Equal(original.Flags, restored.Flags);
	}

	[Fact]
	public void SecretOfManaCharacterStats_CharacterName_ReturnsCorrectName() {
		// Arrange & Act & Assert
		var hero = new SecretOfManaCharacterStats { CharacterIndex = 0 };
		Assert.Equal("Hero", hero.CharacterName);

		var girl = new SecretOfManaCharacterStats { CharacterIndex = 1 };
		Assert.Equal("Girl", girl.CharacterName);

		var sprite = new SecretOfManaCharacterStats { CharacterIndex = 2 };
		Assert.Equal("Sprite", sprite.CharacterName);

		var unknown = new SecretOfManaCharacterStats { CharacterIndex = 99 };
		Assert.Equal("Character 99", unknown.CharacterName);
	}

	[Fact]
	public void SecretOfManaItem_SellPrice_IsHalfOfBuyPrice() {
		// Arrange
		var item = new SecretOfManaItem { Price = 100 };

		// Assert
		Assert.Equal(50, item.SellPrice);
	}
}

public class SecretOfManaEditorTests {
	[Fact]
	public void Constructor_WithInvalidSize_ThrowsException() {
		// Arrange
		var invalidData = new byte[1000];

		// Act & Assert
		Assert.Throws<ArgumentException>(() => new SecretOfManaEditor(invalidData));
	}

	[Fact]
	public void Constructor_WithValidSize_CreatesInstance() {
		// Arrange
		var validData = new byte[SecretOfManaData.RomSize];

		// Act
		var editor = new SecretOfManaEditor(validData);

		// Assert
		Assert.NotNull(editor);
		Assert.Equal(SecretOfManaData.RomSize, editor.RomData.Length);
	}

	[Fact]
	public void ComputeSha256_ReturnsLowercaseHash() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act
		var hash = editor.ComputeSha256();

		// Assert
		Assert.Equal(hash.ToLowerInvariant(), hash);
		Assert.Equal(64, hash.Length); // SHA256 = 64 hex chars
	}

	[Fact]
	public void ReadByte_ReturnsCorrectValue() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		data[0x1000] = 0xab;
		var editor = new SecretOfManaEditor(data);

		// Act
		var result = editor.ReadByte(0x1000);

		// Assert
		Assert.Equal(0xab, result);
	}

	[Fact]
	public void WriteByte_SetsCorrectValue() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act
		editor.WriteByte(0x1000, 0xcd);

		// Assert
		Assert.Equal(0xcd, data[0x1000]);
	}

	[Fact]
	public void ReadWord_ReadsLittleEndian() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		data[0x1000] = 0xcd;
		data[0x1001] = 0xab;
		var editor = new SecretOfManaEditor(data);

		// Act
		var result = editor.ReadWord(0x1000);

		// Assert
		Assert.Equal(0xabcd, result);
	}

	[Fact]
	public void WriteWord_WritesLittleEndian() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act
		editor.WriteWord(0x1000, 0x1234);

		// Assert
		Assert.Equal(0x34, data[0x1000]);
		Assert.Equal(0x12, data[0x1001]);
	}

	[Fact]
	public void ReadBytes_ReturnsCorrectData() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		data[0x100] = 0x01;
		data[0x101] = 0x02;
		data[0x102] = 0x03;
		var editor = new SecretOfManaEditor(data);

		// Act
		var result = editor.ReadBytes(0x100, 3);

		// Assert
		Assert.Equal(new byte[] { 0x01, 0x02, 0x03 }, result);
	}

	[Fact]
	public void WriteBytes_SetsCorrectData() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act
		editor.WriteBytes(0x100, [0xaa, 0xbb, 0xcc]);

		// Assert
		Assert.Equal(0xaa, data[0x100]);
		Assert.Equal(0xbb, data[0x101]);
		Assert.Equal(0xcc, data[0x102]);
	}

	[Fact]
	public void ReadEnemy_WithValidIndex_ReturnsEnemy() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		// Set up enemy data at expected offset
		int offset = SecretOfManaData.EnemyStatsOffset;
		data[offset] = 100; // HP = 100 (byte)
		data[offset + 1] = 100; // Unknown1 (often duplicates HP)
		data[offset + 10] = 50; // AttackMod

		var editor = new SecretOfManaEditor(data);

		// Act
		var enemy = editor.ReadEnemy(0);

		// Assert
		Assert.Equal(100, enemy.Hp);
		Assert.Equal(50, enemy.AttackMod);
	}

	[Fact]
	public void ReadEnemy_WithInvalidIndex_ThrowsException() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act & Assert
		Assert.Throws<ArgumentOutOfRangeException>(() => editor.ReadEnemy(-1));
		Assert.Throws<ArgumentOutOfRangeException>(() => editor.ReadEnemy(SecretOfManaData.EnemyCount));
	}

	[Fact]
	public void WriteEnemy_UpdatesRomData() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);
		var rawData = new byte[SecretOfManaData.EnemyStatsEntrySize];
		var enemy = new SecretOfManaEnemy {
			Id = 0,
			Hp = 200,
			Unknown1 = 200,
			AttackMod = 75,
			RawData = rawData
		};

		// Act
		editor.WriteEnemy(enemy);

		// Assert
		int offset = SecretOfManaData.EnemyStatsOffset;
		Assert.Equal(200, data[offset]);
		Assert.Equal(75, data[offset + 10]);
	}

	[Fact]
	public void ReadAllEnemies_ReturnsCorrectCount() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);

		// Act
		var enemies = editor.ReadAllEnemies().ToList();

		// Assert
		Assert.Equal(SecretOfManaData.EnemyCount, enemies.Count);
	}

	[Fact]
	public void ReadExit_ReturnsCorrectData() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		int offset = SecretOfManaData.ExitDataOffset;
		data[offset] = 0x10; // Map
		data[offset + 1] = 0x20; // X
		data[offset + 2] = 0x30; // Y
		data[offset + 3] = 0x01; // Flags

		var editor = new SecretOfManaEditor(data);

		// Act
		var exit = editor.ReadExit(0);

		// Assert
		Assert.Equal(0x10, exit.DestinationMap);
		Assert.Equal(0x20, exit.DestinationX);
		Assert.Equal(0x30, exit.DestinationY);
		Assert.Equal(0x01, exit.Flags);
	}

	[Fact]
	public void WriteExit_UpdatesRomData() {
		// Arrange
		var data = new byte[SecretOfManaData.RomSize];
		var editor = new SecretOfManaEditor(data);
		var exit = new SecretOfManaExit {
			Id = 1,
			DestinationMap = 0x42,
			DestinationX = 0x80,
			DestinationY = 0x40,
			Flags = 0x02
		};

		// Act
		editor.WriteExit(exit);

		// Assert
		int offset = SecretOfManaData.ExitDataOffset + SecretOfManaData.ExitEntrySize;
		Assert.Equal(0x42, data[offset]);
		Assert.Equal(0x80, data[offset + 1]);
		Assert.Equal(0x40, data[offset + 2]);
		Assert.Equal(0x02, data[offset + 3]);
	}
}

public class SecretOfManaMagicTests {
	[Fact]
	public void Magic_CasterName_ReturnsCorrectName() {
		// Arrange
		var girlSpell = new SecretOfManaMagic { IsGirlSpell = true };
		var spriteSpell = new SecretOfManaMagic { IsGirlSpell = false };

		// Assert
		Assert.Equal("Girl", girlSpell.CasterName);
		Assert.Equal("Sprite", spriteSpell.CasterName);
	}

	[Theory]
	[InlineData(ManaSpirit.Undine, "Undine")]
	[InlineData(ManaSpirit.Gnome, "Gnome")]
	[InlineData(ManaSpirit.Sylphid, "Sylphid")]
	[InlineData(ManaSpirit.Salamando, "Salamando")]
	public void Magic_SpiritAssignment_Works(ManaSpirit spirit, string expectedName) {
		// Arrange
		var magic = new SecretOfManaMagic { Spirit = spirit };

		// Assert
		Assert.Equal(expectedName, magic.Spirit.ToString());
	}
}

public class SecretOfManaWeaponTests {
	[Fact]
	public void Weapon_TypeName_ReturnsCorrectName() {
		// Arrange & Act & Assert
		Assert.Equal("Sword", new SecretOfManaWeapon { Type = WeaponType.Sword }.TypeName);
		Assert.Equal("Spear", new SecretOfManaWeapon { Type = WeaponType.Spear }.TypeName);
		Assert.Equal("Bow", new SecretOfManaWeapon { Type = WeaponType.Bow }.TypeName);
		Assert.Equal("Axe", new SecretOfManaWeapon { Type = WeaponType.Axe }.TypeName);
		Assert.Equal("Boomerang", new SecretOfManaWeapon { Type = WeaponType.Boomerang }.TypeName);
		Assert.Equal("Glove", new SecretOfManaWeapon { Type = WeaponType.Glove }.TypeName);
		Assert.Equal("Whip", new SecretOfManaWeapon { Type = WeaponType.Whip }.TypeName);
		Assert.Equal("Javelin", new SecretOfManaWeapon { Type = WeaponType.Javelin }.TypeName);
	}

	[Fact]
	public void Weapon_LevelProgression_IsValid() {
		// Test weapon level from 0 to 8
		for (byte level = 0; level <= 8; level++) {
			var weapon = new SecretOfManaWeapon {
				Level = level,
				OrbsRequired = level
			};

			Assert.Equal(level, weapon.Level);
			Assert.Equal(level, weapon.OrbsRequired);
		}
	}
}

public class SecretOfManaArmorTests {
	[Fact]
	public void Armor_ArmorTypeName_ReturnsCorrectName() {
		// Arrange & Act & Assert
		Assert.Equal("Helmet", new SecretOfManaArmor { ArmorType = 0 }.ArmorTypeName);
		Assert.Equal("Armor", new SecretOfManaArmor { ArmorType = 1 }.ArmorTypeName);
		Assert.Equal("Accessory", new SecretOfManaArmor { ArmorType = 2 }.ArmorTypeName);
		Assert.Equal("Unknown", new SecretOfManaArmor { ArmorType = 99 }.ArmorTypeName);
	}

	[Fact]
	public void Armor_ElementalResistance_CanBeCombined() {
		// Arrange
		var armor = new SecretOfManaArmor {
			Resistance = Elements.Salamando | Elements.Undine
		};

		// Assert
		Assert.True(armor.Resistance.HasFlag(Elements.Salamando));
		Assert.True(armor.Resistance.HasFlag(Elements.Undine));
		Assert.False(armor.Resistance.HasFlag(Elements.Gnome));
	}
}

