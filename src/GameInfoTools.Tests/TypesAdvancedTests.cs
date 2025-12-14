using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for Core Types including edge cases, equality,
/// hashing, and string formatting.
/// </summary>
public class TypesAdvancedTests {
	#region SystemType Advanced Tests

	[Fact]
	public void SystemType_EnumValuesAreSequential() {
		var values = Enum.GetValues<SystemType>().Cast<int>().ToList();

		Assert.Equal(0, values[0]);  // Unknown starts at 0
		for (int i = 1; i < values.Count; i++) {
			Assert.Equal(i, values[i]);  // Sequential
		}
	}

	[Fact]
	public void SystemType_CanParseFromString() {
		Assert.True(Enum.TryParse<SystemType>("Nes", out var nes));
		Assert.Equal(SystemType.Nes, nes);

		Assert.True(Enum.TryParse<SystemType>("Snes", out var snes));
		Assert.Equal(SystemType.Snes, snes);
	}

	[Fact]
	public void SystemType_CaseInsensitiveParse() {
		Assert.True(Enum.TryParse<SystemType>("NES", true, out var nes));
		Assert.Equal(SystemType.Nes, nes);

		Assert.True(Enum.TryParse<SystemType>("snes", true, out var snes));
		Assert.Equal(SystemType.Snes, snes);
	}

	[Fact]
	public void SystemType_ToString_ReturnsName() {
		Assert.Equal("Nes", SystemType.Nes.ToString());
		Assert.Equal("GameBoy", SystemType.GameBoy.ToString());
		Assert.Equal("TurboGrafx16", SystemType.TurboGrafx16.ToString());
	}

	[Theory]
	[InlineData(SystemType.Unknown)]
	[InlineData(SystemType.Nes)]
	[InlineData(SystemType.Snes)]
	[InlineData(SystemType.GameBoy)]
	[InlineData(SystemType.GameBoyColor)]
	[InlineData(SystemType.GameBoyAdvance)]
	[InlineData(SystemType.Genesis)]
	[InlineData(SystemType.MasterSystem)]
	[InlineData(SystemType.GameGear)]
	[InlineData(SystemType.TurboGrafx16)]
	[InlineData(SystemType.NeoGeo)]
	public void SystemType_AllValuesAreDefined(SystemType type) {
		Assert.True(Enum.IsDefined(type));
	}

	#endregion

	#region AddressSpace Advanced Tests

	[Fact]
	public void AddressSpace_FileIsDefault() {
		Assert.Equal(0, (int)AddressSpace.File);
	}

	[Theory]
	[InlineData(AddressSpace.File)]
	[InlineData(AddressSpace.Cpu)]
	[InlineData(AddressSpace.Ppu)]
	[InlineData(AddressSpace.Sram)]
	public void AddressSpace_AllValuesAreDefined(AddressSpace space) {
		Assert.True(Enum.IsDefined(space));
	}

	#endregion

	#region GameAddress Advanced Tests

	[Fact]
	public void GameAddress_ZeroAddress_WorksCorrectly() {
		var addr = new GameAddress(0);

		Assert.Equal(0, addr.Value);
		Assert.Equal(AddressSpace.File, addr.Space);
		Assert.Equal(-1, addr.Bank);
	}

	[Fact]
	public void GameAddress_MaxValue_WorksCorrectly() {
		var addr = new GameAddress(int.MaxValue);

		Assert.Equal(int.MaxValue, addr.Value);
	}

	[Fact]
	public void GameAddress_NegativeBank_IndicatesNoBank() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, -1);

		Assert.Equal(-1, addr.Bank);
		Assert.DoesNotContain("Bank", addr.ToString());
	}

	[Fact]
	public void GameAddress_ZeroBank_ShowsBank() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, 0);

		Assert.Contains("Bank 0", addr.ToString());
	}

	[Fact]
	public void GameAddress_ToHexString_FixedWidth() {
		Assert.Equal("$000001", new GameAddress(1).ToHexString());
		Assert.Equal("$0000ff", new GameAddress(0xff).ToHexString());
		Assert.Equal("$001000", new GameAddress(0x1000).ToHexString());
		Assert.Equal("$ffffff", new GameAddress(0xffffff).ToHexString());
	}

	[Fact]
	public void GameAddress_ToShortHex_FourDigits() {
		Assert.Equal("$0001", new GameAddress(1).ToShortHex());
		Assert.Equal("$00ff", new GameAddress(0xff).ToShortHex());
		Assert.Equal("$1000", new GameAddress(0x1000).ToShortHex());
	}

	[Fact]
	public void GameAddress_Equality_AllFieldsMustMatch() {
		var addr1 = new GameAddress(0x8000, AddressSpace.Cpu, 5);
		var addr2 = new GameAddress(0x8000, AddressSpace.Cpu, 5);
		var addr3 = new GameAddress(0x8001, AddressSpace.Cpu, 5);  // Different value
		var addr4 = new GameAddress(0x8000, AddressSpace.File, 5);  // Different space
		var addr5 = new GameAddress(0x8000, AddressSpace.Cpu, 6);   // Different bank

		Assert.True(addr1 == addr2);
		Assert.False(addr1 == addr3);
		Assert.False(addr1 == addr4);
		Assert.False(addr1 == addr5);
	}

	[Fact]
	public void GameAddress_HashCode_ConsistentWithEquality() {
		var addr1 = new GameAddress(0x8000, AddressSpace.Cpu, 5);
		var addr2 = new GameAddress(0x8000, AddressSpace.Cpu, 5);

		Assert.Equal(addr1.GetHashCode(), addr2.GetHashCode());

		// Different addresses should (usually) have different hash codes
		var addr3 = new GameAddress(0x9000, AddressSpace.Cpu, 5);
		Assert.NotEqual(addr1.GetHashCode(), addr3.GetHashCode());
	}

	[Fact]
	public void GameAddress_HashCode_UsableInHashSet() {
		var set = new HashSet<GameAddress>
		{
			new GameAddress(0x8000, AddressSpace.Cpu, 0),
			new GameAddress(0x8000, AddressSpace.Cpu, 0),  // Duplicate
			new GameAddress(0x8000, AddressSpace.Cpu, 1),  // Different bank
			new GameAddress(0x8000, AddressSpace.File, 0), // Different space
		};

		Assert.Equal(3, set.Count);  // Duplicate should be ignored
	}

	[Fact]
	public void GameAddress_UsableAsDictionaryKey() {
		var dict = new Dictionary<GameAddress, string>
		{
			{ new GameAddress(0x8000, AddressSpace.Cpu, 0), "Reset" },
			{ new GameAddress(0xfffa, AddressSpace.Cpu, -1), "NMI Vector" },
		};

		Assert.True(dict.ContainsKey(new GameAddress(0x8000, AddressSpace.Cpu, 0)));
		Assert.Equal("Reset", dict[new GameAddress(0x8000, AddressSpace.Cpu, 0)]);
	}

	[Fact]
	public void GameAddress_Equals_BoxedComparison() {
		var addr1 = new GameAddress(0x8000);
		object boxed = new GameAddress(0x8000);

		Assert.True(addr1.Equals(boxed));
	}

	[Fact]
	public void GameAddress_Equals_NullReturnsFalse() {
		var addr = new GameAddress(0x8000);

		Assert.False(addr.Equals(null));
	}

	[Fact]
	public void GameAddress_Equals_WrongTypeReturnsFalse() {
		var addr = new GameAddress(0x8000);

		Assert.False(addr.Equals(0x8000));
		Assert.False(addr.Equals("$8000"));
	}

	[Fact]
	public void GameAddress_InequalityOperator_Works() {
		var addr1 = new GameAddress(0x8000);
		var addr2 = new GameAddress(0x9000);

		Assert.True(addr1 != addr2);
		Assert.False(addr1 != new GameAddress(0x8000));
	}

	#endregion

	#region Label Advanced Tests

	[Fact]
	public void Label_RecordEquality_Works() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu);
		var label1 = new Label { Name = "Reset", Address = addr };
		var label2 = new Label { Name = "Reset", Address = addr };

		// Records have value-based equality
		Assert.Equal(label1, label2);
	}

	[Fact]
	public void Label_RecordInequality_DifferentName() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu);
		var label1 = new Label { Name = "Reset", Address = addr };
		var label2 = new Label { Name = "Start", Address = addr };

		Assert.NotEqual(label1, label2);
	}

	[Fact]
	public void Label_RecordInequality_DifferentAddress() {
		var label1 = new Label { Name = "Test", Address = new GameAddress(0x8000) };
		var label2 = new Label { Name = "Test", Address = new GameAddress(0x9000) };

		Assert.NotEqual(label1, label2);
	}

	[Fact]
	public void Label_WithOperator_CreatesCopy() {
		var original = new Label {
			Name = "Original",
			Address = new GameAddress(0x8000),
			Comment = "Test comment",
			Type = LabelType.Code
		};

		var modified = original with { Comment = "New comment" };

		Assert.Equal("Original", modified.Name);
		Assert.Equal(original.Address, modified.Address);
		Assert.Equal("New comment", modified.Comment);
		Assert.Equal(LabelType.Code, modified.Type);

		// Original unchanged
		Assert.Equal("Test comment", original.Comment);
	}

	[Fact]
	public void Label_AllLabelTypesCanBeAssigned() {
		var addr = new GameAddress(0x8000);

		foreach (var type in Enum.GetValues<LabelType>()) {
			var label = new Label { Name = "Test", Address = addr, Type = type };
			Assert.Equal(type, label.Type);
		}
	}

	#endregion

	#region LabelType Advanced Tests

	[Theory]
	[InlineData(LabelType.Unknown)]
	[InlineData(LabelType.Code)]
	[InlineData(LabelType.Data)]
	[InlineData(LabelType.Pointer)]
	[InlineData(LabelType.Text)]
	[InlineData(LabelType.Graphics)]
	[InlineData(LabelType.Audio)]
	public void LabelType_AllValuesAreDefined(LabelType type) {
		Assert.True(Enum.IsDefined(type));
	}

	[Fact]
	public void LabelType_UnknownIsDefault() {
		Assert.Equal(0, (int)LabelType.Unknown);
	}

	#endregion

	#region RomHeader Advanced Tests

	[Fact]
	public void RomHeader_RecordEquality_Works() {
		var header1 = new RomHeader { System = SystemType.Nes, Title = "Test" };
		var header2 = new RomHeader { System = SystemType.Nes, Title = "Test" };

		Assert.Equal(header1, header2);
	}

	[Fact]
	public void RomHeader_WithOperator_CreatesCopy() {
		var original = new RomHeader {
			System = SystemType.Nes,
			Title = "Original",
			HeaderSize = 16,
			PrgRomSize = 0x8000,
			ChrRomSize = 0x2000,
			Mapper = 1,
			HasBattery = true,
			HasTrainer = false,
			RawHeader = new byte[] { 0x4e, 0x45, 0x53, 0x1a }
		};

		var modified = original with { Mapper = 4 };

		Assert.Equal(1, original.Mapper);
		Assert.Equal(4, modified.Mapper);
		Assert.Equal(original.Title, modified.Title);
	}

	[Fact]
	public void RomHeader_RawHeaderDefault_IsEmptyArray() {
		var header = new RomHeader();
		Assert.NotNull(header.RawHeader);
		Assert.Empty(header.RawHeader);
	}

	[Fact]
	public void RomHeader_RawHeader_MutationDoesNotAffectOriginal() {
		var data = new byte[] { 1, 2, 3, 4 };
		var header = new RomHeader { RawHeader = data };

		// Mutate original array
		data[0] = 99;

		// Header's array is now the same instance (records don't deep copy)
		Assert.Equal(99, header.RawHeader[0]);
	}

	#endregion

	#region RomInfo Advanced Tests

	[Fact]
	public void RomInfo_RecordEquality_Works() {
		var info1 = new RomInfo { System = SystemType.Snes, Size = 0x100000 };
		var info2 = new RomInfo { System = SystemType.Snes, Size = 0x100000 };

		Assert.Equal(info1, info2);
	}

	[Fact]
	public void RomInfo_WithOperator_CreatesCopy() {
		var original = new RomInfo {
			System = SystemType.Nes,
			HeaderSize = 16,
			Size = 0x8000,
			Title = "Test",
			Mapper = 0
		};

		var modified = original with { Size = 0x10000 };

		Assert.Equal(0x8000, original.Size);
		Assert.Equal(0x10000, modified.Size);
	}

	[Fact]
	public void RomInfo_TitleDefault_IsNull() {
		var info = new RomInfo();
		Assert.Null(info.Title);
	}

	[Fact]
	public void RomInfo_ToString_ContainsUsefulInfo() {
		var info = new RomInfo {
			System = SystemType.Nes,
			Title = "Super Game"
		};

		var str = info.ToString();
		// Record ToString shows all properties
		Assert.Contains("Nes", str);
		Assert.Contains("Super Game", str);
	}

	#endregion

	#region Cross-Type Integration Tests

	[Fact]
	public void Label_CanStoreAllSystemTypes() {
		var labels = new List<Label>();

		foreach (var system in Enum.GetValues<SystemType>()) {
			var addr = new GameAddress(0x8000, AddressSpace.Cpu);
			labels.Add(new Label {
				Name = $"Label_{system}",
				Address = addr,
				Comment = $"For {system} system"
			});
		}

		Assert.Equal(Enum.GetValues<SystemType>().Length, labels.Count);
	}

	[Fact]
	public void GameAddress_AllSpacesWorkInLabel() {
		foreach (var space in Enum.GetValues<AddressSpace>()) {
			var label = new Label {
				Name = $"Label_{space}",
				Address = new GameAddress(0x1000, space, 0)
			};

			Assert.Equal(space, label.Address.Space);
		}
	}

	#endregion
}
