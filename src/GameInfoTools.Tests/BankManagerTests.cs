using GameInfoTools.Core;
using GameInfoTools.Rom;

namespace GameInfoTools.Tests;

public class BankManagerTests {
	private static byte[] CreateNesRom(int prgBanks = 2, int chrBanks = 1) {
		// Create iNES header + PRG ROM + CHR ROM
		// iNES header: 16 bytes
		// PRG ROM: 16KB * prgBanks
		// CHR ROM: 8KB * chrBanks
		int prgSize = 0x4000 * prgBanks;
		int chrSize = 0x2000 * chrBanks;
		byte[] rom = new byte[16 + prgSize + chrSize];

		// iNES header
		rom[0] = 0x4E; // 'N'
		rom[1] = 0x45; // 'E'
		rom[2] = 0x53; // 'S'
		rom[3] = 0x1A; // EOF
		rom[4] = (byte)prgBanks; // PRG ROM banks (16KB each)
		rom[5] = (byte)chrBanks; // CHR ROM banks (8KB each)
		rom[6] = 0x00; // Mapper low nibble, mirroring, etc.
		rom[7] = 0x00; // Mapper high nibble

		// Fill PRG ROM with pattern for testing
		for (int i = 0; i < prgSize; i++) {
			rom[16 + i] = (byte)(i % 256);
		}

		return rom;
	}

	[Fact]
	public void Constructor_CreatesInstanceFromNesRom() {
		byte[] rom = CreateNesRom();
		var manager = new BankManager(rom);

		Assert.NotNull(manager);
	}

	[Fact]
	public void GetBanks_ReturnsCorrectCountForNes() {
		byte[] rom = CreateNesRom(prgBanks: 2);
		var manager = new BankManager(rom);

		var banks = manager.GetBanks();

		// Should have 2 PRG banks
		Assert.True(banks.Count >= 2);
	}

	[Fact]
	public void ExtractBank_ReturnsCorrectSize() {
		byte[] rom = CreateNesRom(prgBanks: 2);
		var manager = new BankManager(rom);

		byte[] bank = manager.ExtractBank(0);

		// NES PRG banks are 16KB
		Assert.Equal(0x4000, bank.Length);
	}

	[Fact]
	public void ExtractBank_ReturnsCorrectData() {
		byte[] rom = CreateNesRom(prgBanks: 2);
		var manager = new BankManager(rom);

		byte[] bank0 = manager.ExtractBank(0);

		// First byte of bank 0 should be 0 (from our pattern)
		Assert.Equal(0x00, bank0[0]);
		// 256th byte should be 0 (pattern wraps)
		Assert.Equal(0x00, bank0[256]);
	}

	[Fact]
	public void GenerateBankMap_ReturnsNonEmptyString() {
		byte[] rom = CreateNesRom(prgBanks: 2);
		var manager = new BankManager(rom);

		string map = manager.GenerateBankMap();

		Assert.False(string.IsNullOrEmpty(map));
	}

	[Fact]
	public void BankInfo_HasCorrectProperties() {
		var info = new BankManager.BankInfo(0, 0x10, 0x4000, 0x8000, 0xBFFF, true);

		Assert.Equal(0, info.Number);
		Assert.Equal(0x10, info.FileOffset);
		Assert.Equal(0x4000, info.Size);
		Assert.Equal(0x8000, info.CpuStart);
		Assert.Equal(0xBFFF, info.CpuEnd);
		Assert.True(info.IsPrgRom);
	}

	[Fact]
	public void GetBankUsage_ReturnsValidPercentage() {
		byte[] rom = CreateNesRom(prgBanks: 2);
		var manager = new BankManager(rom);

		var (used, free, percent) = manager.GetBankUsage(0);

		Assert.True(used >= 0);
		Assert.True(free >= 0);
		Assert.True(percent >= 0.0f && percent <= 100.0f);
	}
}

