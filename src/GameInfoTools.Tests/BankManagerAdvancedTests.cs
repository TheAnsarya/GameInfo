using GameInfoTools.Core;
using GameInfoTools.Rom;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for BankManager ROM bank handling.
/// </summary>
public class BankManagerAdvancedTests {
	#region Helper Methods

	private static byte[] CreateNesRom(int prgBanks, int chrBanks) {
		// iNES header + PRG + CHR
		int prgSize = prgBanks * 0x4000;
		int chrSize = chrBanks * 0x2000;
		var rom = new byte[16 + prgSize + chrSize];

		// iNES header
		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		return rom;
	}

	private static byte[] CreateSnesRom(int sizeKb, bool isHiRom = false) {
		var rom = new byte[sizeKb * 1024];

		// SNES header at appropriate location
		int headerOffset = isHiRom ? 0xffc0 : 0x7fc0;
		if (headerOffset < rom.Length - 32) {
			rom[headerOffset + 0x15] = (byte)(isHiRom ? 0x21 : 0x20); // Map mode
		}

		return rom;
	}

	private static byte[] CreateGameBoyRom(int romBanks) {
		// GB ROM with header at $100-$14F
		var rom = new byte[romBanks * 0x4000];

		if (rom.Length > 0x14f) {
			// Nintendo logo (simplified)
			rom[0x104] = 0xce;
			rom[0x105] = 0xed;

			// ROM size code
			int sizeCode = romBanks switch {
				2 => 0,
				4 => 1,
				8 => 2,
				16 => 3,
				32 => 4,
				_ => 0
			};
			rom[0x148] = (byte)sizeCode;
		}

		return rom;
	}

	#endregion

	#region NES Bank Tests

	[Fact]
	public void GetBanks_SinglePrgBank_ReturnsOneBank() {
		var rom = CreateNesRom(1, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var prgBanks = banks.Where(b => b.IsPrgRom).ToList();
		Assert.Single(prgBanks);
	}

	[Fact]
	public void GetBanks_TwoPrgBanks_ReturnsTwoBanks() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var prgBanks = banks.Where(b => b.IsPrgRom).ToList();
		Assert.Equal(2, prgBanks.Count);
	}

	[Fact]
	public void GetBanks_Nes_LastBankAtC000() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var lastPrg = banks.Where(b => b.IsPrgRom).Last();
		Assert.Equal(0xc000, lastPrg.CpuStart);
	}

	[Fact]
	public void GetBanks_Nes_BankSizeIs16K() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		foreach (var bank in banks.Where(b => b.IsPrgRom)) {
			Assert.Equal(0x4000, bank.Size);
		}
	}

	[Fact]
	public void GetBanks_Nes_BankNumbersSequential() {
		var rom = CreateNesRom(4, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var prgBanks = banks.Where(b => b.IsPrgRom).ToList();
		for (int i = 0; i < prgBanks.Count; i++) {
			Assert.Equal(i, prgBanks[i].Number);
		}
	}

	[Fact]
	public void GetBanks_Nes_FileOffsetsCorrect() {
		var rom = CreateNesRom(4, 1);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var prgBanks = banks.Where(b => b.IsPrgRom).ToList();
		for (int i = 0; i < prgBanks.Count; i++) {
			int expectedOffset = 16 + (i * 0x4000); // Header + bank index * bank size
			Assert.Equal(expectedOffset, prgBanks[i].FileOffset);
		}
	}

	[Fact]
	public void GetBanks_Nes_IncludesChrBanks() {
		var rom = CreateNesRom(2, 2);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		var chrBanks = banks.Where(b => !b.IsPrgRom).ToList();
		Assert.Equal(2, chrBanks.Count);
	}

	#endregion

	#region BankInfo Record Tests

	[Fact]
	public void BankInfo_AllPropertiesAccessible() {
		var info = new BankManager.BankInfo(5, 0x8010, 0x4000, 0x8000, 0xbfff, true);

		Assert.Equal(5, info.Number);
		Assert.Equal(0x8010, info.FileOffset);
		Assert.Equal(0x4000, info.Size);
		Assert.Equal(0x8000, info.CpuStart);
		Assert.Equal(0xbfff, info.CpuEnd);
		Assert.True(info.IsPrgRom);
	}

	[Fact]
	public void BankInfo_ChrBankFlagWorks() {
		var prgBank = new BankManager.BankInfo(0, 0, 0x4000, 0x8000, 0xbfff, true);
		var chrBank = new BankManager.BankInfo(0, 0, 0x2000, 0, 0x1fff, false);

		Assert.True(prgBank.IsPrgRom);
		Assert.False(chrBank.IsPrgRom);
	}

	[Fact]
	public void BankInfo_EqualityWorks() {
		var info1 = new BankManager.BankInfo(0, 16, 0x4000, 0x8000, 0xbfff, true);
		var info2 = new BankManager.BankInfo(0, 16, 0x4000, 0x8000, 0xbfff, true);

		Assert.Equal(info1, info2);
	}

	[Fact]
	public void BankInfo_InequalityWorks() {
		var info1 = new BankManager.BankInfo(0, 16, 0x4000, 0x8000, 0xbfff, true);
		var info2 = new BankManager.BankInfo(1, 16, 0x4000, 0x8000, 0xbfff, true);

		Assert.NotEqual(info1, info2);
	}

	#endregion

	#region Generic/Unknown ROM Tests

	[Fact]
	public void GetBanks_UnknownSystem_Returns16KBanks() {
		// Create a ROM that doesn't match any known header
		var rom = new byte[0x10000]; // 64KB

		var manager = new BankManager(rom);
		var banks = manager.GetBanks();

		// Should create 4 banks of 16KB each
		Assert.Equal(4, banks.Count);
		foreach (var bank in banks) {
			Assert.Equal(0x4000, bank.Size);
		}
	}

	#endregion

	#region ExtractBank and ReplaceBank Tests

	[Fact]
	public void ExtractBank_ReturnsCorrectData() {
		var rom = CreateNesRom(2, 0);
		// Fill bank 0 with pattern
		for (int i = 16; i < 16 + 0x4000; i++) {
			rom[i] = 0xaa;
		}
		// Fill bank 1 with different pattern
		for (int i = 16 + 0x4000; i < 16 + 0x8000; i++) {
			rom[i] = 0x55;
		}

		var manager = new BankManager(rom);
		var banks = manager.GetBanks();
		var prgBanks = banks.Where(b => b.IsPrgRom).ToList();

		var bank0Data = manager.ExtractBank(prgBanks[0].Number);
		var bank1Data = manager.ExtractBank(prgBanks[1].Number);

		Assert.Equal(0xaa, bank0Data[0]);
		Assert.Equal(0x55, bank1Data[0]);
	}

	[Fact]
	public void ExtractBank_CorrectSize() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();
		var prg = banks.First(b => b.IsPrgRom);
		var data = manager.ExtractBank(prg.Number);

		Assert.Equal(0x4000, data.Length);
	}

	#endregion

	#region FindFreeSpace Tests

	[Fact]
	public void FindFreeSpace_EmptyBank_FindsLargeSpace() {
		var rom = CreateNesRom(2, 0);
		// Fill with $FF (free space)
		for (int i = 16; i < rom.Length; i++) {
			rom[i] = 0xff;
		}

		var manager = new BankManager(rom);

		var (start, length) = manager.FindFreeSpace(0, 0xff, 16);

		Assert.True(length >= 16);
	}

	[Fact]
	public void FindFreeSpace_NoFreeSpace_ReturnsZeroLength() {
		var rom = CreateNesRom(2, 0);
		// Fill with code (no free space)
		for (int i = 16; i < rom.Length; i++) {
			rom[i] = 0xea; // NOP opcodes
		}

		var manager = new BankManager(rom);

		var (start, length) = manager.FindFreeSpace(0, 0xff, 16);

		Assert.Equal(0, length);
	}

	#endregion

	#region GetBankUsage Tests

	[Fact]
	public void GetBankUsage_EmptyBank_ZeroUsage() {
		var rom = CreateNesRom(2, 0);
		// Fill with $FF (free)
		for (int i = 16; i < 16 + 0x4000; i++) {
			rom[i] = 0xff;
		}

		var manager = new BankManager(rom);

		var (used, free, percent) = manager.GetBankUsage(0, 0xff);

		Assert.Equal(0, used);
		Assert.Equal(0x4000, free);
		Assert.Equal(0.0f, percent);
	}

	[Fact]
	public void GetBankUsage_FullBank_FullUsage() {
		var rom = CreateNesRom(2, 0);
		// Fill with code
		for (int i = 16; i < 16 + 0x4000; i++) {
			rom[i] = 0xea;
		}

		var manager = new BankManager(rom);

		var (used, free, percent) = manager.GetBankUsage(0, 0xff);

		Assert.Equal(0x4000, used);
		Assert.Equal(0, free);
		Assert.Equal(100.0f, percent);
	}

	#endregion

	#region GenerateBankMap Tests

	[Fact]
	public void GenerateBankMap_ReturnsNonEmpty() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var map = manager.GenerateBankMap();

		Assert.NotEmpty(map);
	}

	[Fact]
	public void GenerateBankMap_ContainsBankInfo() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var map = manager.GenerateBankMap();

		// Should contain bank information
		Assert.Contains("0", map);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void GetBanks_MinimalNesRom_Works() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		Assert.NotEmpty(banks);
	}

	[Fact]
	public void GetBanks_EmptyRom_ReturnsEmptyOrHandles() {
		var rom = new byte[16]; // Just header, no data
		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;

		var manager = new BankManager(rom);

		// Should not throw
		var banks = manager.GetBanks();

		Assert.NotNull(banks);
	}

	#endregion
}

/// <summary>
/// Tests for new BankManager features.
/// </summary>
public class BankManagerEnhancedTests {
	private static byte[] CreateNesRom(int prgBanks, int chrBanks) {
		int prgSize = prgBanks * 0x4000;
		int chrSize = chrBanks * 0x2000;
		var rom = new byte[16 + prgSize + chrSize];

		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		return rom;
	}

	[Fact]
	public void FindAllFreeSpace_MultipleFreeRegions_FindsAll() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		// Create gaps in the bank (bank starts at offset 16)
		rom[16] = 0x00;  // Used
		// 17-31 are 0x00 (not free with fillByte=0xFF)
		// Fill with 0xFF to create free space
		for (int i = 20; i < 40; i++) {
			rom[i] = 0xff;
		}

		rom[40] = 0x00;  // Used

		for (int i = 50; i < 80; i++) {
			rom[i] = 0xff;
		}

		var regions = manager.FindAllFreeSpace(0, 0xff, 5);

		Assert.NotEmpty(regions);
	}

	[Fact]
	public void FindAllFreeSpaceGlobal_AcrossBanks_FindsAll() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);

		// Fill some free space in each bank
		for (int i = 0; i < 100; i++) {
			rom[16 + i] = 0xff;  // Bank 0
			rom[16 + 0x4000 + i] = 0xff;  // Bank 1
		}

		var regions = manager.FindAllFreeSpaceGlobal(0xff, 10);

		Assert.NotEmpty(regions);
	}

	[Fact]
	public void GetBankStatistics_ReturnsValidStats() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		// Add some used bytes
		for (int i = 16; i < 116; i++) {
			rom[i] = 0x00;
		}

		// Add free bytes
		for (int i = 116; i < 216; i++) {
			rom[i] = 0xff;
		}

		var stats = manager.GetBankStatistics(0, 0xff);

		Assert.Equal(0, stats.BankNumber);
		Assert.True(stats.TotalSize > 0);
		Assert.True(stats.UsedBytes > 0);
		Assert.True(stats.Entropy > 0);
	}

	[Fact]
	public void GetRomStatistics_ReturnsValidStats() {
		var rom = CreateNesRom(2, 1);
		var manager = new BankManager(rom);

		var stats = manager.GetRomStatistics();

		Assert.Equal(SystemType.Nes, stats.System);
		Assert.Equal(3, stats.TotalBanks);
		Assert.Equal(2, stats.PrgBankCount);
		Assert.Equal(1, stats.ChrBankCount);
	}

	[Fact]
	public void GenerateVisualLayout_ProducesOutput() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		var layout = manager.GenerateVisualLayout(32);

		Assert.Contains("Bank", layout);
		Assert.Contains("PRG", layout);
	}

	[Fact]
	public void SwapBanks_SwapsContent() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);

		// Fill banks with distinct data
		for (int i = 0; i < 0x4000; i++) {
			rom[16 + i] = 0x11;  // Bank 0
			rom[16 + 0x4000 + i] = 0x22;  // Bank 1
		}

		manager.SwapBanks(0, 1);

		var bank0 = manager.ExtractBank(0);
		var bank1 = manager.ExtractBank(1);

		Assert.Equal(0x22, bank0[0]);
		Assert.Equal(0x11, bank1[0]);
	}

	[Fact]
	public void CopyBank_CopiesContent() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);

		for (int i = 0; i < 0x4000; i++) {
			rom[16 + i] = 0xAB;
		}

		manager.CopyBank(0, 1);

		var bank1 = manager.ExtractBank(1);
		Assert.Equal(0xAB, bank1[0]);
	}

	[Fact]
	public void FillRegion_FillsCorrectly() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		manager.FillRegion(0, 0, 100, 0xAA);

		var bank = manager.ExtractBank(0);
		for (int i = 0; i < 100; i++) {
			Assert.Equal(0xAA, bank[i]);
		}
	}

	[Fact]
	public void WriteToBank_WritesCorrectly() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		manager.WriteToBank(0, 10, data);

		var readBack = manager.ReadFromBank(0, 10, 4);
		Assert.Equal(data, readBack);
	}

	[Fact]
	public void ReadFromBank_ReadsCorrectly() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		rom[16 + 5] = 0x99;
		rom[16 + 6] = 0x88;

		var data = manager.ReadFromBank(0, 5, 2);

		Assert.Equal(new byte[] { 0x99, 0x88 }, data);
	}

	[Fact]
	public void FindFreeSpaceForData_FindsSuitable() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		// Create free space
		for (int i = 100; i < 200; i++) {
			rom[16 + i] = 0xff;
		}

		var region = manager.FindFreeSpaceForData(50);

		Assert.NotNull(region);
		Assert.True(region.Length >= 50);
	}

	[Fact]
	public void ExportBankMapToJson_ProducesValidJson() {
		var rom = CreateNesRom(1, 0);
		var manager = new BankManager(rom);

		var json = manager.ExportBankMapToJson();

		Assert.Contains("\"system\"", json);
		Assert.Contains("\"banks\"", json);
		Assert.Contains("Nes", json);
	}
}

/// <summary>
/// Tests for BankReorganizer.
/// </summary>
public class BankReorganizerTests {
	private static byte[] CreateNesRom(int prgBanks, int chrBanks) {
		int prgSize = prgBanks * 0x4000;
		int chrSize = chrBanks * 0x2000;
		var rom = new byte[16 + prgSize + chrSize];

		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		return rom;
	}

	[Fact]
	public void PlanSwap_AddsOperation() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);
		var reorg = new BankReorganizer(manager);

		reorg.PlanSwap(0, 1);

		var ops = reorg.GetPlannedOperations().ToList();
		Assert.Single(ops);
		Assert.Equal(BankReorganizer.ReorgType.Swap, ops[0].Type);
	}

	[Fact]
	public void PlanCopy_AddsOperation() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);
		var reorg = new BankReorganizer(manager);

		reorg.PlanCopy(0, 1);

		var ops = reorg.GetPlannedOperations().ToList();
		Assert.Single(ops);
		Assert.Equal(BankReorganizer.ReorgType.Copy, ops[0].Type);
	}

	[Fact]
	public void Execute_PerformsOperations() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);
		var reorg = new BankReorganizer(manager);

		// Set distinct data
		for (int i = 0; i < 0x4000; i++) {
			rom[16 + i] = 0xAA;
		}

		reorg.PlanSwap(0, 1);
		reorg.Execute();

		var bank1 = manager.ExtractBank(1);
		Assert.Equal(0xAA, bank1[0]);
	}

	[Fact]
	public void ClearPlan_RemovesAllOperations() {
		var rom = CreateNesRom(2, 0);
		var manager = new BankManager(rom);
		var reorg = new BankReorganizer(manager);

		reorg.PlanSwap(0, 1);
		reorg.PlanCopy(0, 1);
		reorg.ClearPlan();

		Assert.Empty(reorg.GetPlannedOperations());
	}
}

/// <summary>
/// Tests for BankExpander.
/// </summary>
public class BankExpanderTests {
	private static byte[] CreateNesRom(int prgBanks, int chrBanks) {
		int prgSize = prgBanks * 0x4000;
		int chrSize = chrBanks * 0x2000;
		var rom = new byte[16 + prgSize + chrSize];

		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		return rom;
	}

	[Fact]
	public void CalculateNesPlan_CalculatesCorrectly() {
		var rom = CreateNesRom(2, 1);

		var plan = BankExpander.CalculateNesPlan(rom, 2, 1);

		Assert.Equal(2, plan.CurrentPrgBanks);
		Assert.Equal(4, plan.NewPrgBanks);
		Assert.Equal(1, plan.CurrentChrBanks);
		Assert.Equal(2, plan.NewChrBanks);
	}

	[Fact]
	public void ExpandNesRom_ExpandsPrg() {
		var rom = CreateNesRom(2, 1);

		// Fill original PRG with data
		for (int i = 0; i < 2 * 0x4000; i++) {
			rom[16 + i] = 0xAB;
		}

		var expanded = BankExpander.ExpandNesRom(rom, 2, 0);

		// Check header updated
		Assert.Equal(4, expanded[4]);  // 4 PRG banks
		Assert.Equal(1, expanded[5]);  // Still 1 CHR bank

		// Check original data preserved
		Assert.Equal(0xAB, expanded[16]);

		// Check new banks are filled
		Assert.Equal(0xff, expanded[16 + 2 * 0x4000]);
	}

	[Fact]
	public void ExpandNesRom_ExpandsChr() {
		var rom = CreateNesRom(2, 1);

		// Fill CHR with data
		for (int i = 0; i < 0x2000; i++) {
			rom[16 + 2 * 0x4000 + i] = 0xCD;
		}

		var expanded = BankExpander.ExpandNesRom(rom, 0, 1);

		Assert.Equal(2, expanded[4]);  // Still 2 PRG
		Assert.Equal(2, expanded[5]);  // 2 CHR banks

		// Original CHR preserved
		int newChrOffset = 16 + 2 * 0x4000;
		Assert.Equal(0xCD, expanded[newChrOffset]);
	}

	[Fact]
	public void ExpandNesRom_PreservesHeader() {
		var rom = CreateNesRom(2, 1);
		rom[6] = 0x12;  // Some mapper flags
		rom[7] = 0x34;

		var expanded = BankExpander.ExpandNesRom(rom, 1, 1);

		Assert.Equal(0x12, expanded[6]);
		Assert.Equal(0x34, expanded[7]);
	}
}
