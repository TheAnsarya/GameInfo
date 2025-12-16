using GameInfoTools.Rom;

namespace GameInfoTools.Tests.Rom;

/// <summary>
/// Tests for the ROM expansion service.
/// </summary>
public class RomExpanderTests {
	private static byte[] CreateNesRom(int prgBanks = 2, int chrBanks = 1) {
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

		// PRG data (fill with sequential bytes)
		for (int i = 0; i < prgSize; i++) {
			rom[16 + i] = (byte)(i & 0xff);
		}

		// CHR data
		for (int i = 0; i < chrSize; i++) {
			rom[16 + prgSize + i] = (byte)((i + 0x80) & 0xff);
		}

		// Add reset vector at end of last PRG bank
		rom[16 + prgSize - 4] = 0x00; // NMI vector low
		rom[16 + prgSize - 3] = 0x80; // NMI vector high
		rom[16 + prgSize - 2] = 0x00; // Reset vector low
		rom[16 + prgSize - 1] = 0xc0; // Reset vector high

		return rom;
	}

	private static byte[] CreateSnesRom(int sizeKb = 256) {
		var rom = new byte[sizeKb * 1024];
		// Fill with pattern
		for (int i = 0; i < rom.Length; i++) {
			rom[i] = (byte)(i & 0xff);
		}
		// Add LoROM header signature
		if (rom.Length >= 0x8000) {
			rom[0x7fc0] = (byte)'T';
			rom[0x7fc1] = (byte)'E';
			rom[0x7fc2] = (byte)'S';
			rom[0x7fc3] = (byte)'T';
		}
		return rom;
	}

	private static byte[] CreateGameBoyRom(int sizeKb = 32) {
		var rom = new byte[sizeKb * 1024];
		// Nintendo logo at 0x104-0x133
		rom[0x104] = 0xce;
		rom[0x105] = 0xed;

		// Title at 0x134-0x143
		var title = "TEST"u8;
		title.CopyTo(rom.AsSpan(0x134));

		// MBC type at 0x147 (0x00 = ROM only for 32KB)
		rom[0x147] = sizeKb > 32 ? (byte)0x01 : (byte)0x00; // MBC1 for larger ROMs

		// ROM size at 0x148 (0x00 = 32KB, 0x01 = 64KB, etc.)
		int sizeByte = 0;
		int size = 32;
		while (size < sizeKb && sizeByte < 8) {
			sizeByte++;
			size *= 2;
		}
		rom[0x148] = (byte)sizeByte;

		return rom;
	}

	[Fact]
	public void ValidateExpansion_NesRom_ValidTarget_ReturnsTrue() {
		var rom = CreateNesRom(2, 0); // 32KB PRG, no CHR
		int targetSize = 16 + (4 * 0x4000); // 4 PRG banks

		var (isValid, error) = RomExpander.ValidateExpansion(rom, targetSize);

		Assert.True(isValid);
		Assert.Null(error);
	}

	[Fact]
	public void ValidateExpansion_TargetSmallerThanCurrent_ReturnsFalse() {
		var rom = CreateNesRom(4, 0);
		int targetSize = 16 + (2 * 0x4000); // Smaller

		var (isValid, error) = RomExpander.ValidateExpansion(rom, targetSize);

		Assert.False(isValid);
		Assert.Contains("larger", error, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void ValidateExpansion_TargetNotBankAligned_ReturnsFalse() {
		var rom = CreateNesRom(2, 0);
		int targetSize = 16 + (3 * 0x4000) + 0x1000; // Not bank aligned

		var (isValid, error) = RomExpander.ValidateExpansion(rom, targetSize);

		Assert.False(isValid);
		Assert.Contains("bank size", error, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void Expand_NesRom_AddBanks_Success() {
		var rom = CreateNesRom(2, 0); // No CHR for simpler testing
		int originalSize = rom.Length;
		int targetSize = 16 + (4 * 0x4000); // Double PRG banks

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			FillByte: 0xff,
			UpdateHeader: true
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.Equal(originalSize, result.OldSize);
		Assert.Equal(targetSize, result.NewSize);
		Assert.Equal(2, result.BanksAdded);
		Assert.NotNull(result.ExpandedRom);
		Assert.Equal(targetSize, result.ExpandedRom!.Length);

		// Verify header was updated
		Assert.Equal(4, result.ExpandedRom[4]); // PRG banks should now be 4

		// Verify original ROM data preserved (after header)
		for (int i = 16; i < originalSize; i++) { // Skip 16-byte header
			Assert.Equal(rom[i], result.ExpandedRom[i]);
		}
	}

	[Fact]
	public void Expand_NesRom_PreservesVectors() {
		var rom = CreateNesRom(2, 0); // No CHR, vectors at end of PRG
		int targetSize = 16 + (4 * 0x4000);

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			FillByte: 0xff,
			UpdateHeader: true,
			PreserveVectors: true
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);

		// Verify vectors at new end location match original
		Assert.Equal(rom[^4], result.ExpandedRom![^4]); // NMI low
		Assert.Equal(rom[^3], result.ExpandedRom[^3]); // NMI high
		Assert.Equal(rom[^2], result.ExpandedRom[^2]); // Reset low
		Assert.Equal(rom[^1], result.ExpandedRom[^1]); // Reset high
	}

	[Fact]
	public void Expand_NesRom_CustomFillByte() {
		var rom = CreateNesRom(2, 0);
		int targetSize = 16 + (4 * 0x4000);
		byte fillByte = 0x00;

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			FillByte: fillByte,
			UpdateHeader: true,
			PreserveVectors: false
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);

		// Check that new space is filled with 0x00
		for (int i = rom.Length; i < targetSize - 6; i++) { // Skip last 6 bytes (vectors)
			Assert.Equal(fillByte, result.ExpandedRom![i]);
		}
	}

	[Fact]
	public void Expand_Mirror_DoublesRom() {
		var rom = CreateNesRom(2, 0);
		int dataSize = rom.Length - 16; // Data without header
		int targetSize = 16 + (dataSize * 2); // Double the data, keep header once

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			Mode: RomExpander.ExpansionMode.Mirror
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);

		// Verify data is mirrored
		int headerSize = 16;
		for (int i = 0; i < dataSize; i++) {
			Assert.Equal(rom[headerSize + i], result.ExpandedRom![headerSize + i]);
			Assert.Equal(rom[headerSize + i], result.ExpandedRom[headerSize + dataSize + i]);
		}
	}

	[Fact]
	public void InsertSpace_InsertsAtCorrectLocation() {
		var rom = CreateNesRom(2, 0);
		int insertOffset = 16 + 0x4000; // After first PRG bank
		int insertSize = 0x4000; // One bank

		var result = RomExpander.InsertSpace(rom, insertOffset, insertSize, 0xaa);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);
		Assert.Equal(rom.Length + insertSize, result.ExpandedRom!.Length);

		// Data before insert (after header) should be unchanged
		for (int i = 16; i < insertOffset; i++) { // Skip header since it may be updated
			Assert.Equal(rom[i], result.ExpandedRom[i]);
		}

		// Inserted area should be filled
		for (int i = insertOffset; i < insertOffset + insertSize; i++) {
			Assert.Equal(0xaa, result.ExpandedRom[i]);
		}

		// Data after insert should be preserved but shifted
		for (int i = insertOffset; i < rom.Length; i++) {
			Assert.Equal(rom[i], result.ExpandedRom[i + insertSize]);
		}
	}

	[Fact]
	public void InsertSpace_InvalidOffset_ReturnsError() {
		var rom = CreateNesRom(2, 0);

		var result = RomExpander.InsertSpace(rom, 0, 0x4000); // Header area

		Assert.False(result.Success);
		Assert.Contains("offset", result.ErrorMessage, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void GetSuggestedSizes_NesRom_ReturnsSizes() {
		var rom = CreateNesRom(2, 0); // 32KB PRG

		var suggestions = RomExpander.GetSuggestedSizes(rom);

		Assert.NotEmpty(suggestions);
		Assert.All(suggestions, s => Assert.True(s.Size > rom.Length));
		Assert.All(suggestions, s => Assert.NotEmpty(s.Description));
	}

	[Fact]
	public void GetSuggestedSizes_ReturnsInOrder() {
		var rom = CreateNesRom(1, 0); // 16KB PRG

		var suggestions = RomExpander.GetSuggestedSizes(rom);

		Assert.NotEmpty(suggestions);
		for (int i = 1; i < suggestions.Count; i++) {
			Assert.True(suggestions[i].Size > suggestions[i - 1].Size);
		}
	}

	[Fact]
	public void CalculateChecksum_ReturnsMd5() {
		var rom = CreateNesRom(2, 1);

		var checksum = RomExpander.CalculateChecksum(rom);

		Assert.NotNull(checksum);
		Assert.Equal(32, checksum.Length); // MD5 = 16 bytes = 32 hex chars
		Assert.Matches("^[0-9a-f]+$", checksum);
	}

	[Fact]
	public void CalculateChecksum_SameData_SameResult() {
		var rom1 = CreateNesRom(2, 1);
		var rom2 = CreateNesRom(2, 1);

		var checksum1 = RomExpander.CalculateChecksum(rom1);
		var checksum2 = RomExpander.CalculateChecksum(rom2);

		Assert.Equal(checksum1, checksum2);
	}

	[Fact]
	public void CalculateChecksum_DifferentData_DifferentResult() {
		var rom1 = CreateNesRom(2, 1);
		var rom2 = CreateNesRom(4, 1);

		var checksum1 = RomExpander.CalculateChecksum(rom1);
		var checksum2 = RomExpander.CalculateChecksum(rom2);

		Assert.NotEqual(checksum1, checksum2);
	}

	[Fact]
	public void Expand_GameBoyRom_UpdatesHeader() {
		var rom = CreateGameBoyRom(32);
		int targetSize = 64 * 1024;

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			UpdateHeader: true
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);

		// ROM size byte should be updated
		Assert.Equal(0x01, result.ExpandedRom![0x148]); // 64KB = $01
	}

	[Fact]
	public void Expand_NoHeaderUpdate_PreservesOriginalHeader() {
		var rom = CreateNesRom(2, 0);
		int targetSize = 16 + (4 * 0x4000);

		var options = new RomExpander.ExpansionOptions(
			TargetSize: targetSize,
			UpdateHeader: false
		);

		var result = RomExpander.Expand(rom, options);

		Assert.True(result.Success);
		Assert.NotNull(result.ExpandedRom);

		// PRG bank count should still be 2 (not updated)
		Assert.Equal(2, result.ExpandedRom![4]);
	}
}
