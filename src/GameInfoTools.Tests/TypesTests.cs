using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for Type definitions in Core library.
/// </summary>
public class TypesTests {
	// SystemType enum tests

	[Fact]
	public void SystemType_HasUnknownValue() {
		Assert.Equal(0, (int)SystemType.Unknown);
	}

	[Fact]
	public void SystemType_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.Nes));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.Snes));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.GameBoy));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.GameBoyColor));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.GameBoyAdvance));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.Genesis));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.MasterSystem));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.GameGear));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.TurboGrafx16));
		Assert.True(Enum.IsDefined(typeof(SystemType), SystemType.NeoGeo));
	}

	// AddressSpace enum tests

	[Fact]
	public void AddressSpace_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(AddressSpace), AddressSpace.File));
		Assert.True(Enum.IsDefined(typeof(AddressSpace), AddressSpace.Cpu));
		Assert.True(Enum.IsDefined(typeof(AddressSpace), AddressSpace.Ppu));
		Assert.True(Enum.IsDefined(typeof(AddressSpace), AddressSpace.Sram));
	}

	// GameAddress struct tests

	[Fact]
	public void GameAddress_Constructor_SetsValue() {
		var addr = new GameAddress(0x1234);
		Assert.Equal(0x1234, addr.Value);
	}

	[Fact]
	public void GameAddress_Constructor_DefaultsToFileSpace() {
		var addr = new GameAddress(0x1000);
		Assert.Equal(AddressSpace.File, addr.Space);
	}

	[Fact]
	public void GameAddress_Constructor_DefaultsBankToNegativeOne() {
		var addr = new GameAddress(0x1000);
		Assert.Equal(-1, addr.Bank);
	}

	[Fact]
	public void GameAddress_Constructor_AcceptsAllParameters() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, 5);

		Assert.Equal(0x8000, addr.Value);
		Assert.Equal(AddressSpace.Cpu, addr.Space);
		Assert.Equal(5, addr.Bank);
	}

	[Fact]
	public void GameAddress_ToHexString_Formats6Digits() {
		var addr = new GameAddress(0x1234);
		Assert.Equal("$001234", addr.ToHexString());
	}

	[Fact]
	public void GameAddress_ToShortHex_Formats4Digits() {
		var addr = new GameAddress(0x1234);
		Assert.Equal("$1234", addr.ToShortHex());
	}

	[Fact]
	public void GameAddress_ToString_FileSpace() {
		var addr = new GameAddress(0x1000, AddressSpace.File);
		Assert.Contains("File:", addr.ToString());
		Assert.Contains("$001000", addr.ToString());
	}

	[Fact]
	public void GameAddress_ToString_CpuSpace_WithBank() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, 5);
		var str = addr.ToString();

		Assert.Contains("CPU:", str);
		Assert.Contains("$8000", str);
		Assert.Contains("Bank 5", str);
	}

	[Fact]
	public void GameAddress_ToString_CpuSpace_WithoutBank() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, -1);
		var str = addr.ToString();

		Assert.Contains("CPU:", str);
		Assert.Contains("$8000", str);
		Assert.DoesNotContain("Bank", str);
	}

	[Fact]
	public void GameAddress_ToString_PpuSpace() {
		var addr = new GameAddress(0x2000, AddressSpace.Ppu);
		Assert.Contains("PPU:", addr.ToString());
	}

	[Fact]
	public void GameAddress_ToString_SramSpace() {
		var addr = new GameAddress(0x6000, AddressSpace.Sram);
		Assert.Contains("SRAM:", addr.ToString());
	}

	[Fact]
	public void GameAddress_Equals_SameValues() {
		var addr1 = new GameAddress(0x1000, AddressSpace.Cpu, 5);
		var addr2 = new GameAddress(0x1000, AddressSpace.Cpu, 5);

		Assert.True(addr1.Equals(addr2));
		Assert.True(addr1 == addr2);
	}

	[Fact]
	public void GameAddress_NotEquals_DifferentValue() {
		var addr1 = new GameAddress(0x1000);
		var addr2 = new GameAddress(0x2000);

		Assert.False(addr1.Equals(addr2));
		Assert.True(addr1 != addr2);
	}

	[Fact]
	public void GameAddress_NotEquals_DifferentSpace() {
		var addr1 = new GameAddress(0x1000, AddressSpace.File);
		var addr2 = new GameAddress(0x1000, AddressSpace.Cpu);

		Assert.False(addr1.Equals(addr2));
	}

	[Fact]
	public void GameAddress_NotEquals_DifferentBank() {
		var addr1 = new GameAddress(0x8000, AddressSpace.Cpu, 0);
		var addr2 = new GameAddress(0x8000, AddressSpace.Cpu, 1);

		Assert.False(addr1.Equals(addr2));
	}

	[Fact]
	public void GameAddress_GetHashCode_SameForEqualAddresses() {
		var addr1 = new GameAddress(0x1000, AddressSpace.Cpu, 5);
		var addr2 = new GameAddress(0x1000, AddressSpace.Cpu, 5);

		Assert.Equal(addr1.GetHashCode(), addr2.GetHashCode());
	}

	[Fact]
	public void GameAddress_Equals_Object_ReturnsFalseForNonGameAddress() {
		var addr = new GameAddress(0x1000);
		Assert.False(addr.Equals("not an address"));
		Assert.False(addr.Equals(null));
	}

	// LabelType enum tests

	[Fact]
	public void LabelType_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Unknown));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Code));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Data));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Pointer));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Text));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Graphics));
		Assert.True(Enum.IsDefined(typeof(LabelType), LabelType.Audio));
	}

	// Label record tests

	[Fact]
	public void Label_RequiredProperties_MustBeSet() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu);
		var label = new Label {
			Name = "TestLabel",
			Address = addr
		};

		Assert.Equal("TestLabel", label.Name);
		Assert.Equal(addr, label.Address);
	}

	[Fact]
	public void Label_OptionalProperties_HaveDefaults() {
		var label = new Label {
			Name = "Test",
			Address = new GameAddress(0)
		};

		Assert.Null(label.Comment);
		Assert.Equal(LabelType.Unknown, label.Type);
	}

	[Fact]
	public void Label_AllProperties_CanBeSet() {
		var addr = new GameAddress(0x8000, AddressSpace.Cpu, 0);
		var label = new Label {
			Name = "MainLoop",
			Address = addr,
			Comment = "Main game loop entry",
			Type = LabelType.Code
		};

		Assert.Equal("MainLoop", label.Name);
		Assert.Equal(addr, label.Address);
		Assert.Equal("Main game loop entry", label.Comment);
		Assert.Equal(LabelType.Code, label.Type);
	}

	// RomHeader record tests

	[Fact]
	public void RomHeader_DefaultValues() {
		var header = new RomHeader();

		Assert.Equal(SystemType.Unknown, header.System);
		Assert.Null(header.Title);
		Assert.Equal(0, header.HeaderSize);
		Assert.Equal(0, header.PrgRomSize);
		Assert.Equal(0, header.ChrRomSize);
		Assert.Equal(0, header.Mapper);
		Assert.False(header.HasBattery);
		Assert.False(header.HasTrainer);
		Assert.Empty(header.RawHeader);
	}

	[Fact]
	public void RomHeader_CanSetAllProperties() {
		var rawData = new byte[] { 0x4e, 0x45, 0x53, 0x1a };
		var header = new RomHeader {
			System = SystemType.Nes,
			Title = "Test Game",
			HeaderSize = 16,
			PrgRomSize = 0x8000,
			ChrRomSize = 0x2000,
			Mapper = 1,
			HasBattery = true,
			HasTrainer = false,
			RawHeader = rawData
		};

		Assert.Equal(SystemType.Nes, header.System);
		Assert.Equal("Test Game", header.Title);
		Assert.Equal(16, header.HeaderSize);
		Assert.Equal(0x8000, header.PrgRomSize);
		Assert.Equal(0x2000, header.ChrRomSize);
		Assert.Equal(1, header.Mapper);
		Assert.True(header.HasBattery);
		Assert.False(header.HasTrainer);
		Assert.Equal(rawData, header.RawHeader);
	}

	// RomInfo record tests

	[Fact]
	public void RomInfo_DefaultValues() {
		var info = new RomInfo();

		Assert.Equal(SystemType.Unknown, info.System);
		Assert.Equal(0, info.HeaderSize);
		Assert.Equal(0, info.Size);
		Assert.Null(info.Title);
		Assert.Equal(0, info.Mapper);
	}

	[Fact]
	public void RomInfo_CanSetAllProperties() {
		var info = new RomInfo {
			System = SystemType.Snes,
			HeaderSize = 512,
			Size = 0x100000,
			Title = "SNES Game",
			Mapper = 0
		};

		Assert.Equal(SystemType.Snes, info.System);
		Assert.Equal(512, info.HeaderSize);
		Assert.Equal(0x100000, info.Size);
		Assert.Equal("SNES Game", info.Title);
		Assert.Equal(0, info.Mapper);
	}
}
