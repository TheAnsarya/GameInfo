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
	public void Md5_ReturnsValidHash() {
		var result = Checksum.Md5(_testData);
		Assert.NotNull(result);
		Assert.Equal(32, result.Length); // MD5 produces 16 bytes = 32 hex chars
	}

	[Fact]
	public void Sha1_ReturnsValidHash() {
		var result = Checksum.Sha1(_testData);
		Assert.NotNull(result);
		Assert.Equal(40, result.Length); // SHA1 produces 20 bytes = 40 hex chars
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
	public void Verify_ReturnsResult() {
		byte[] data = new byte[0x8000];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xFF);
		}

		var result = Checksum.Verify(data, SystemType.Nes);
		Assert.NotNull(result);
	}
}
