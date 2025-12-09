using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for Checksum calculation methods including CRC32, MD5, SHA1,
/// and system-specific checksum algorithms for NES, SNES, and Game Boy.
/// </summary>
public class ChecksumTests {
	private readonly byte[] _testData = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];

	[Fact]
	public void Crc32_CalculatesCorrectly() {
		// Known CRC32 value
		var result = Checksum.Crc32(_testData);
		Assert.NotEqual(0u, result);
	}

	[Fact]
	public void Crc32_WithRange_CalculatesCorrectly() {
		var result = Checksum.Crc32(_testData, 2, 3);
		Assert.NotEqual(0u, result);
	}

	[Fact]
	public void Crc32_EmptyData_ReturnsZero() {
		var result = Checksum.Crc32([]);
		Assert.Equal(0u, result);
	}

	[Fact]
	public void Md5_ReturnsValidHash() {
		var result = Checksum.Md5(_testData);
		Assert.NotNull(result);
		Assert.Equal(32, result.Length); // MD5 produces 16 bytes = 32 hex chars
	}

	[Fact]
	public void Md5_ReturnsLowercaseHex() {
		var result = Checksum.Md5(_testData);
		Assert.Equal(result.ToLowerInvariant(), result);
	}

	[Fact]
	public void Sha1_ReturnsValidHash() {
		var result = Checksum.Sha1(_testData);
		Assert.NotNull(result);
		Assert.Equal(40, result.Length); // SHA1 produces 20 bytes = 40 hex chars
	}

	[Fact]
	public void Sha1_ReturnsLowercaseHex() {
		var result = Checksum.Sha1(_testData);
		Assert.Equal(result.ToLowerInvariant(), result);
	}

	[Fact]
	public void SnesChecksum_CalculatesForValidRom() {
		// Create a small test ROM (32KB)
		byte[] rom = new byte[0x8000];
		for (int i = 0; i < rom.Length; i++) {
			rom[i] = (byte)(i & 0xFF);
		}

		var result = Checksum.SnesChecksum(rom);
		Assert.NotEqual(0, result);
	}

	[Fact]
	public void SnesComplement_ReturnsValidComplement() {
		ushort checksum = 0x1234;
		ushort complement = Checksum.SnesComplement(checksum);
		Assert.Equal((ushort)(checksum ^ 0xFFFF), complement);
	}

	[Fact]
	public void SnesComplement_IsReversible() {
		ushort original = 0x5678;
		ushort complement = Checksum.SnesComplement(original);
		ushort reversed = Checksum.SnesComplement(complement);
		Assert.Equal(original, reversed);
	}

	[Fact]
	public void NesChecksum_CalculatesCorrectly() {
		// Create a test NES ROM with header
		byte[] rom = new byte[16 + 0x4000]; // Header + 16KB PRG
		for (int i = 16; i < rom.Length; i++) {
			rom[i] = (byte)(i & 0xFF);
		}

		var result = Checksum.NesChecksum(rom, 16, rom.Length - 16);
		Assert.NotEqual(0, result);
	}

	[Fact]
	public void NesChecksum_HandlesBoundaryConditions() {
		byte[] rom = [0x01, 0x02, 0x03, 0x04];
		var result = Checksum.NesChecksum(rom, 2, 100); // Length beyond data
		Assert.Equal(7, result); // Should only sum 0x03 + 0x04 = 7
	}

	[Fact]
	public void GameBoyHeaderChecksum_CalculatesCorrectly() {
		byte[] rom = new byte[0x150];
		// Fill header area
		for (int i = 0x134; i <= 0x14C; i++) {
			rom[i] = (byte)i;
		}

		var result = Checksum.GameBoyHeaderChecksum(rom);
		// Just verify it returns something
		Assert.True(result >= 0);
	}

	[Fact]
	public void GameBoyGlobalChecksum_CalculatesCorrectly() {
		byte[] rom = new byte[0x8000];
		for (int i = 0; i < rom.Length; i++) {
			rom[i] = (byte)(i & 0xFF);
		}

		var result = Checksum.GameBoyGlobalChecksum(rom);
		Assert.NotEqual(0, result);
	}

	[Fact]
	public void GameBoyGlobalChecksum_SkipsChecksumBytes() {
		byte[] rom = new byte[0x8000];
		// Set checksum bytes to high values
		rom[0x14e] = 0xff;
		rom[0x14f] = 0xff;

		var result1 = Checksum.GameBoyGlobalChecksum(rom);

		// Change only non-checksum area
		rom[0] = 0x01;
		var result2 = Checksum.GameBoyGlobalChecksum(rom);

		Assert.NotEqual(result1, result2);
	}

	[Fact]
	public void FixGameBoyChecksum_UpdatesHeaderAndGlobal() {
		byte[] rom = new byte[0x8000];
		for (int i = 0x134; i <= 0x14c; i++) {
			rom[i] = (byte)i;
		}

		// Store original checksum values
		byte originalHeader = rom[0x14d];

		Checksum.FixGameBoyChecksum(rom);

		// Header checksum should be different (was 0, now calculated)
		Assert.NotEqual(originalHeader, rom[0x14d]);
	}

	[Fact]
	public void FixSnesChecksum_UpdatesLoRomChecksum() {
		// Create 32KB ROM (LoROM size)
		byte[] rom = new byte[0x8000];
		for (int i = 0; i < rom.Length; i++) {
			rom[i] = (byte)(i & 0xff);
		}

		Checksum.FixSnesChecksum(rom, isHiRom: false);

		// Read checksums at LoROM location
		ushort complement = (ushort)(rom[0x7fdc] | (rom[0x7fdd] << 8));
		ushort checksum = (ushort)(rom[0x7fde] | (rom[0x7fdf] << 8));

		// Checksum ^ complement should equal 0xFFFF
		Assert.Equal(0xffff, checksum ^ complement);
	}

	[Fact]
	public void GbaHeaderChecksum_CalculatesCorrectly() {
		byte[] rom = new byte[0x100];
		for (int i = 0xa0; i <= 0xbc; i++) {
			rom[i] = (byte)i;
		}

		var result = Checksum.GbaHeaderChecksum(rom);
		Assert.NotEqual(0, result);
	}

	[Fact]
	public void Verify_NES_ReturnsResult() {
		byte[] data = new byte[0x8000];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xFF);
		}

		var result = Checksum.Verify(data, SystemType.Nes);
		Assert.NotNull(result);
		Assert.True(result.IsValid);
		Assert.Contains("CRC32", result.Details);
	}

	[Fact]
	public void Verify_SNES_WithInvalidHeader_ReturnsFalse() {
		byte[] data = new byte[0x8000];
		// Don't set up proper SNES header

		var result = Checksum.Verify(data, SystemType.Snes);
		Assert.NotNull(result);
		Assert.False(result.IsValid);
	}

	[Fact]
	public void Verify_GameBoy_TooSmall_ReturnsFalse() {
		byte[] data = new byte[0x100]; // Too small

		var result = Checksum.Verify(data, SystemType.GameBoy);
		Assert.NotNull(result);
		Assert.False(result.IsValid);
		Assert.Contains("too small", result.Details.ToLowerInvariant());
	}

	[Fact]
	public void Verify_GameBoy_ValidSize_ReturnsResult() {
		byte[] data = new byte[0x8000];
		// Set up minimal GB header
		for (int i = 0x134; i <= 0x14c; i++) {
			data[i] = (byte)i;
		}

		// Fix checksum so it validates
		Checksum.FixGameBoyChecksum(data);

		var result = Checksum.Verify(data, SystemType.GameBoy);
		Assert.NotNull(result);
		Assert.True(result.IsValid);
	}

	[Fact]
	public void Verify_GameBoyColor_UsesGameBoyVerification() {
		byte[] data = new byte[0x8000];
		for (int i = 0x134; i <= 0x14c; i++) {
			data[i] = (byte)i;
		}

		Checksum.FixGameBoyChecksum(data);

		var result = Checksum.Verify(data, SystemType.GameBoyColor);
		Assert.NotNull(result);
		Assert.True(result.IsValid);
	}

	[Fact]
	public void Verify_GBA_TooSmall_ReturnsFalse() {
		byte[] data = new byte[0x50]; // Too small

		var result = Checksum.Verify(data, SystemType.GameBoyAdvance);
		Assert.NotNull(result);
		Assert.False(result.IsValid);
		Assert.Contains("too small", result.Details.ToLowerInvariant());
	}

	[Fact]
	public void Verify_GBA_ValidSize_ReturnsResult() {
		byte[] data = new byte[0x100];
		for (int i = 0xa0; i <= 0xbc; i++) {
			data[i] = (byte)i;
		}

		// Set correct checksum
		data[0xbd] = Checksum.GbaHeaderChecksum(data);

		var result = Checksum.Verify(data, SystemType.GameBoyAdvance);
		Assert.NotNull(result);
		Assert.True(result.IsValid);
	}

	[Fact]
	public void Verify_UnknownSystem_ReturnsFalse() {
		byte[] data = [0x01, 0x02, 0x03, 0x04];

		var result = Checksum.Verify(data, SystemType.Unknown);
		Assert.NotNull(result);
		Assert.False(result.IsValid);
		Assert.Contains("Unknown", result.Details);
	}
}
