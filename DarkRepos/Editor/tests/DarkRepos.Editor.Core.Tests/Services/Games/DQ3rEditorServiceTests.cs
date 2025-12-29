using DarkRepos.Editor.Core.Services;
using DarkRepos.Editor.Core.Services.Games;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services.Games;

public class DQ3rEditorServiceTests {
	[Fact]
	public void Tables_HasCorrectMonsterAddress() {
		// Assert
		Assert.Equal(0x510000, DQ3rEditorService.Tables.Monsters.FileOffset);
		Assert.Equal(384, DQ3rEditorService.Tables.Monsters.Count);
		Assert.Equal(32, DQ3rEditorService.Tables.Monsters.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectItemAddress() {
		// Assert
		Assert.Equal(0x500000, DQ3rEditorService.Tables.Items.FileOffset);
		Assert.Equal(512, DQ3rEditorService.Tables.Items.Count);
		Assert.Equal(16, DQ3rEditorService.Tables.Items.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectExpTableAddress() {
		// Assert
		Assert.Equal(0x522000, DQ3rEditorService.Tables.ExpTable.FileOffset);
		Assert.Equal(99, DQ3rEditorService.Tables.ExpTable.Count);
		Assert.Equal(4, DQ3rEditorService.Tables.ExpTable.EntrySize);
	}

	[Fact]
	public void Tables_ExpTable_HasCorrectSnesAddress() {
		// Assert - HiROM: FileOffset + 0xc00000
		Assert.Equal(0x1122000, DQ3rEditorService.Tables.ExpTable.SnesAddress);
		Assert.Equal("$1122000", DQ3rEditorService.Tables.ExpTable.SnesAddressHex);
	}

	[Fact]
	public void Tables_ExpTable_HasCorrectTotalSize() {
		// Assert - 99 entries × 4 bytes = 396 bytes
		Assert.Equal(396, DQ3rEditorService.Tables.ExpTable.TotalSize);
	}

	[Fact]
	public void Tables_HasCorrectSpellAddress() {
		// Assert
		Assert.Equal(0x520000, DQ3rEditorService.Tables.Spells.FileOffset);
		Assert.Equal(341, DQ3rEditorService.Tables.Spells.Count);
		Assert.Equal(12, DQ3rEditorService.Tables.Spells.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectWeaponAddress() {
		// Assert
		Assert.Equal(0x502000, DQ3rEditorService.Tables.Weapons.FileOffset);
		Assert.Equal(128, DQ3rEditorService.Tables.Weapons.Count);
		Assert.Equal(16, DQ3rEditorService.Tables.Weapons.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectArmorAddress() {
		// Assert
		Assert.Equal(0x504000, DQ3rEditorService.Tables.Armor.FileOffset);
		Assert.Equal(128, DQ3rEditorService.Tables.Armor.Count);
		Assert.Equal(16, DQ3rEditorService.Tables.Armor.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectClassAddress() {
		// Assert
		Assert.Equal(0x521000, DQ3rEditorService.Tables.Classes.FileOffset);
		Assert.Equal(128, DQ3rEditorService.Tables.Classes.Count);
		Assert.Equal(16, DQ3rEditorService.Tables.Classes.EntrySize);
	}

	[Fact]
	public void Tables_HasCorrectMonsterAiAddress() {
		// Assert
		Assert.Equal(0x513000, DQ3rEditorService.Tables.MonsterAi.FileOffset);
		Assert.Equal(256, DQ3rEditorService.Tables.MonsterAi.Count);
		Assert.Equal(32, DQ3rEditorService.Tables.MonsterAi.EntrySize);
	}

	[Fact]
	public void SnesAddressToFile_WithHiRomAddress_ReturnsFileOffset() {
		// Arrange
		int snesAddress = 0xd10000; // HiROM address

		// Act
		int fileOffset = DQ3rEditorService.SnesAddressToFile(snesAddress);

		// Assert - Subtracts 0xc00000
		Assert.Equal(0x110000, fileOffset);
	}

	[Fact]
	public void SnesAddressToFile_WithLowAddress_ReturnsUnchanged() {
		// Arrange
		int address = 0x100000;

		// Act
		int result = DQ3rEditorService.SnesAddressToFile(address);

		// Assert
		Assert.Equal(0x100000, result);
	}

	[Theory]
	[InlineData(0xc00000, 0x000000)] // Base HiROM
	[InlineData(0xc10000, 0x010000)] // Bank $c1
	[InlineData(0xd00000, 0x100000)] // Bank $d0
	[InlineData(0xd10000, 0x110000)] // Bank $d1
	[InlineData(0x500000, 0x500000)] // Low address unchanged
	public void SnesAddressToFile_WithVariousAddresses_ReturnsCorrectOffset(int snes, int expected) {
		// Act
		int result = DQ3rEditorService.SnesAddressToFile(snes);

		// Assert
		Assert.Equal(expected, result);
	}

	[Fact]
	public void TableLocation_TotalSize_CalculatesCorrectly() {
		// Arrange
		var location = new TableLocation(0x100000, 100, 16, "Test Table");

		// Assert
		Assert.Equal(1600, location.TotalSize);
	}

	[Fact]
	public void TableLocation_SnesAddress_AddsHiRomOffset() {
		// Arrange
		var location = new TableLocation(0x100000, 512, 16, "Test Table");

		// Assert - 0x100000 + 0xc00000 = 0xd00000
		Assert.Equal(0xd00000, location.SnesAddress);
	}

	[Fact]
	public void TableLocation_SnesAddressHex_FormatsCorrectly() {
		// Arrange
		var location = new TableLocation(0x100000, 512, 16, "Test Table");

		// Assert - formatted as $d00000
		Assert.Equal("$d00000", location.SnesAddressHex);
	}

	[Fact]
	public void DQ3rStructures_MonsterJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("hp", DQ3rStructures.MonsterJson);
		Assert.Contains("mp", DQ3rStructures.MonsterJson);
		Assert.Contains("attack", DQ3rStructures.MonsterJson);
		Assert.Contains("defense", DQ3rStructures.MonsterJson);
		Assert.Contains("agility", DQ3rStructures.MonsterJson);
		Assert.Contains("exp", DQ3rStructures.MonsterJson);
		Assert.Contains("gold", DQ3rStructures.MonsterJson);
	}

	[Fact]
	public void DQ3rStructures_ExpTableJson_ContainsExpField() {
		// Assert
		Assert.Contains("exp_required", DQ3rStructures.ExpTableJson);
		Assert.Contains("uint32", DQ3rStructures.ExpTableJson);
		Assert.Contains("\"recordSize\": 4", DQ3rStructures.ExpTableJson);
	}

	[Fact]
	public void DQ3rStructures_ItemJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("effect", DQ3rStructures.ItemJson);
		Assert.Contains("buy_price", DQ3rStructures.ItemJson);
		Assert.Contains("equip_class", DQ3rStructures.ItemJson);
	}

	[Fact]
	public void DQ3rStructures_SpellJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("mp_cost", DQ3rStructures.SpellJson);
		Assert.Contains("power", DQ3rStructures.SpellJson);
		Assert.Contains("target", DQ3rStructures.SpellJson);
	}

	[Fact]
	public void DQ3rStructures_WeaponJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("attack", DQ3rStructures.WeaponJson);
		Assert.Contains("equip_class", DQ3rStructures.WeaponJson);
		Assert.Contains("buy_price", DQ3rStructures.WeaponJson);
	}

	[Fact]
	public void DQ3rStructures_ArmorJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("defense", DQ3rStructures.ArmorJson);
		Assert.Contains("equip_class", DQ3rStructures.ArmorJson);
		Assert.Contains("slot", DQ3rStructures.ArmorJson);
	}

	[Fact]
	public void DQ3rStructures_ClassJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("base_hp", DQ3rStructures.ClassJson);
		Assert.Contains("base_mp", DQ3rStructures.ClassJson);
		Assert.Contains("hp_growth", DQ3rStructures.ClassJson);
	}

	[Fact]
	public void DQ3rStructures_MonsterAiJson_ContainsRequiredFields() {
		// Assert
		Assert.Contains("ai_type", DQ3rStructures.MonsterAiJson);
		Assert.Contains("action_1", DQ3rStructures.MonsterAiJson);
		Assert.Contains("flee_rate", DQ3rStructures.MonsterAiJson);
	}
}
