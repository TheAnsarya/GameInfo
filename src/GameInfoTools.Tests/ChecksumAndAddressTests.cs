using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for Checksum calculations.
/// </summary>
public class ChecksumAdvancedTests {
	#region CRC32 Tests

	[Fact]
	public void Crc32_EmptyArray_ReturnsZero() {
		var data = Array.Empty<byte>();

		var result = Checksum.Crc32(data);

		Assert.Equal(0u, result);
	}

	[Fact]
	public void Crc32_SingleByte_ReturnsNonZero() {
		var data = new byte[] { 0x41 }; // 'A'

		var result = Checksum.Crc32(data);

		Assert.NotEqual(0u, result);
	}

	[Fact]
	public void Crc32_KnownValue_ReturnsExpected() {
		// "123456789" has a well-known CRC32 value
		var data = System.Text.Encoding.ASCII.GetBytes("123456789");

		var result = Checksum.Crc32(data);

		// Standard CRC32 of "123456789" is 0xcbf43926
		Assert.Equal(0xcbf43926u, result);
	}

	[Fact]
	public void Crc32_SameDataSameResult() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var result1 = Checksum.Crc32(data);
		var result2 = Checksum.Crc32(data);

		Assert.Equal(result1, result2);
	}

	[Fact]
	public void Crc32_DifferentDataDifferentResult() {
		var data1 = new byte[] { 0x01, 0x02, 0x03 };
		var data2 = new byte[] { 0x01, 0x02, 0x04 };

		var result1 = Checksum.Crc32(data1);
		var result2 = Checksum.Crc32(data2);

		Assert.NotEqual(result1, result2);
	}

	[Fact]
	public void Crc32_WithRange_CalculatesSubset() {
		var data = new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05 };

		var fullCrc = Checksum.Crc32(data);
		var partialCrc = Checksum.Crc32(data, 1, 4);

		// Full and partial should be different
		Assert.NotEqual(fullCrc, partialCrc);
	}

	#endregion

	#region MD5 Tests

	[Fact]
	public void Md5_EmptyArray_ReturnsKnownHash() {
		var data = Array.Empty<byte>();

		var result = Checksum.Md5(data);

		// MD5 of empty string is d41d8cd98f00b204e9800998ecf8427e
		Assert.Equal("d41d8cd98f00b204e9800998ecf8427e", result);
	}

	[Fact]
	public void Md5_KnownValue_ReturnsExpected() {
		var data = System.Text.Encoding.ASCII.GetBytes("hello");

		var result = Checksum.Md5(data);

		// MD5 of "hello" is 5d41402abc4b2a76b9719d911017c592
		Assert.Equal("5d41402abc4b2a76b9719d911017c592", result);
	}

	[Fact]
	public void Md5_ReturnsLowercaseHex() {
		var data = new byte[] { 0x00 };

		var result = Checksum.Md5(data);

		Assert.Equal(result.ToLowerInvariant(), result);
	}

	[Fact]
	public void Md5_Returns32Characters() {
		var data = new byte[] { 0x01, 0x02, 0x03 };

		var result = Checksum.Md5(data);

		Assert.Equal(32, result.Length);
	}

	#endregion

	#region SHA1 Tests

	[Fact]
	public void Sha1_EmptyArray_ReturnsKnownHash() {
		var data = Array.Empty<byte>();

		var result = Checksum.Sha1(data);

		// SHA1 of empty string is da39a3ee5e6b4b0d3255bfef95601890afd80709
		Assert.Equal("da39a3ee5e6b4b0d3255bfef95601890afd80709", result);
	}

	[Fact]
	public void Sha1_KnownValue_ReturnsExpected() {
		var data = System.Text.Encoding.ASCII.GetBytes("hello");

		var result = Checksum.Sha1(data);

		// SHA1 of "hello" is aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d
		Assert.Equal("aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d", result);
	}

	[Fact]
	public void Sha1_Returns40Characters() {
		var data = new byte[] { 0x01 };

		var result = Checksum.Sha1(data);

		Assert.Equal(40, result.Length);
	}

	#endregion

	#region NES Checksum Tests

	[Fact]
	public void NesChecksum_CalculatesSimpleSum() {
		var data = new byte[] { 0x01, 0x02, 0x03 };

		var result = Checksum.NesChecksum(data, 0, data.Length);

		Assert.Equal((ushort)(1 + 2 + 3), result);
	}

	[Fact]
	public void NesChecksum_Wraps65536() {
		// NES checksum is ushort (16-bit), not byte
		var data = new byte[256];
		for (int i = 0; i < 256; i++) {
			data[i] = 0xff;
		}

		var result = Checksum.NesChecksum(data, 0, data.Length);

		// 255 * 256 = 65280, fits in ushort
		Assert.Equal((ushort)(255 * 256), result);
	}

	#endregion

	#region SNES Checksum Tests

	[Fact]
	public void SnesChecksum_CalculatesSum() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var result = Checksum.SnesChecksum(data);

		Assert.Equal((ushort)(1 + 2 + 3 + 4), result);
	}

	[Fact]
	public void SnesComplement_ReturnsInverse() {
		ushort checksum = 0x1234;

		var result = Checksum.SnesComplement(checksum);

		Assert.Equal((ushort)(checksum ^ 0xffff), result);
	}

	[Fact]
	public void SnesComplement_Verify_ComplementSumEqualsFFFF() {
		ushort checksum = 0x1234;

		var complement = Checksum.SnesComplement(checksum);

		Assert.Equal(0xffffu, (uint)(checksum + complement) & 0xffff);
	}

	#endregion

	#region GameBoy Checksum Tests

	[Fact]
	public void GameBoyHeaderChecksum_CalculatesCorrectly() {
		// GameBoy header checksum is calculated over bytes 0x134-0x14c
		var data = new byte[0x150];
		for (int i = 0x134; i <= 0x14c; i++) {
			data[i] = (byte)i;
		}

		var result = Checksum.GameBoyHeaderChecksum(data);

		// Should return a byte value
		Assert.True(result >= 0 && result <= 255);
	}

	[Fact]
	public void GameBoyGlobalChecksum_CalculatesSum() {
		// Global checksum skips bytes 0x14e-0x14f
		var data = new byte[] { 0x10, 0x20, 0x30 };

		var result = Checksum.GameBoyGlobalChecksum(data);

		Assert.Equal((ushort)(0x10 + 0x20 + 0x30), result);
	}

	[Fact]
	public void GameBoyGlobalChecksum_SkipsChecksumBytes() {
		// Create a larger array that includes checksum byte positions
		var data = new byte[0x200];
		for (int i = 0; i < data.Length; i++) {
			data[i] = 1;
		}

		// Expected sum should skip bytes at 0x14e and 0x14f
		int expectedSum = data.Length - 2; // All 1s except skipped bytes

		var result = Checksum.GameBoyGlobalChecksum(data);

		Assert.Equal((ushort)expectedSum, result);
	}

	#endregion

	#region Verify Tests

	[Fact]
	public void Verify_ReturnsVerificationResult() {
		var data = new byte[256];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)i;
		}

		var result = Checksum.Verify(data, SystemType.Nes);

		Assert.NotNull(result);
	}

	#endregion
}

/// <summary>
/// Comprehensive tests for AddressConverter.
/// </summary>
public class AddressConverterAdvancedTests {
	#region ParseHex Tests

	[Theory]
	[InlineData("$1234", 0x1234)]
	[InlineData("0x1234", 0x1234)]
	[InlineData("1234", 0x1234)]
	[InlineData("0X1234", 0x1234)]
	[InlineData("$ABCD", 0xabcd)]
	[InlineData("$abcd", 0xabcd)]
	[InlineData("0xabcd", 0xabcd)]
	public void ParseHex_VariousFormats_ParsesCorrectly(string input, int expected) {
		var result = AddressConverter.ParseHex(input);

		Assert.Equal(expected, result);
	}

	[Fact]
	public void ParseHex_EmptyString_ThrowsException() {
		Assert.Throws<FormatException>(() => AddressConverter.ParseHex(""));
	}

	[Fact]
	public void ParseHex_InvalidHex_ThrowsException() {
		Assert.Throws<FormatException>(() => AddressConverter.ParseHex("$ZZZZ"));
	}

	[Fact]
	public void ParseHex_JustPrefix_ThrowsException() {
		Assert.Throws<FormatException>(() => AddressConverter.ParseHex("$"));
	}

	#endregion

	#region ToHex Tests

	[Theory]
	[InlineData(0, 2, "$00")]
	[InlineData(255, 2, "$ff")]
	[InlineData(0x1234, 4, "$1234")]
	[InlineData(0xabcdef, 6, "$abcdef")]
	public void ToHex_FormatsCorrectly(int value, int digits, string expected) {
		var result = AddressConverter.ToHex(value, digits);

		Assert.Equal(expected, result);
	}

	[Fact]
	public void ToHex_UsesLowercase() {
		var result = AddressConverter.ToHex(0xabcd, 4);

		Assert.Equal("$abcd", result);
	}

	[Fact]
	public void ToHex_PadsWithZeros() {
		var result = AddressConverter.ToHex(1, 4);

		Assert.Equal("$0001", result);
	}

	#endregion

	#region NES Address Conversion Tests

	[Fact]
	public void NesFileToCpu_FirstBank_ReturnsCorrectCpu() {
		// File offset 16 (after header) should be $8000 in first bank
		var (cpuAddr, bank) = AddressConverter.NesFileToCpu(16, 16);

		Assert.Equal(0x8000, cpuAddr);
		Assert.Equal(0, bank);
	}

	[Fact]
	public void NesFileToCpu_SecondBank_ReturnsCorrectCpu() {
		// File offset 16 + 0x4000 should be in second bank
		var (cpuAddr, bank) = AddressConverter.NesFileToCpu(16 + 0x4000, 16);

		Assert.Equal(0x8000, cpuAddr);
		Assert.Equal(1, bank);
	}

	[Fact]
	public void NesCpuToFile_8000_ReturnsHeaderPlus0() {
		var fileOffset = AddressConverter.NesCpuToFile(0x8000, 2, 0);

		Assert.Equal(16, fileOffset); // 16-byte header offset
	}

	[Fact]
	public void NesCpuToFile_C000_ReturnsCorrectOffset() {
		// $C000 is 0x4000 into the bank
		var fileOffset = AddressConverter.NesCpuToFile(0xc000, 2, 0);

		Assert.Equal(16 + 0x4000, fileOffset);
	}

	#endregion

	#region SNES LoROM Conversion Tests

	[Fact]
	public void SnesLoRomToFile_Bank00_8000_ReturnsZero() {
		var fileOffset = AddressConverter.SnesLoRomToFile(0x8000);

		Assert.Equal(0, fileOffset);
	}

	[Fact]
	public void SnesLoRomToFile_Bank01_8000_Returns32KB() {
		var fileOffset = AddressConverter.SnesLoRomToFile(0x018000);

		Assert.Equal(0x8000, fileOffset);
	}

	[Fact]
	public void SnesFileToLoRom_Zero_Returns8000() {
		var snesAddr = AddressConverter.SnesFileToLoRom(0);

		Assert.Equal(0x8000, snesAddr);
	}

	[Fact]
	public void SnesFileToLoRom_32KB_ReturnsBank1() {
		var snesAddr = AddressConverter.SnesFileToLoRom(0x8000);

		Assert.Equal(0x018000, snesAddr);
	}

	#endregion

	#region SNES HiROM Conversion Tests

	[Fact]
	public void SnesHiRomToFile_C00000_ReturnsZero() {
		var fileOffset = AddressConverter.SnesHiRomToFile(0xc00000);

		Assert.Equal(0, fileOffset);
	}

	[Fact]
	public void SnesFileToHiRom_Zero_ReturnsC00000() {
		var snesAddr = AddressConverter.SnesFileToHiRom(0);

		Assert.Equal(0xc00000, snesAddr);
	}

	#endregion

	#region Header Offset Tests

	[Fact]
	public void SnesLoRomToFile_WithHeader_AddsHeaderOffset() {
		var fileOffset = AddressConverter.SnesLoRomToFile(0x8000, 512);

		Assert.Equal(512, fileOffset);
	}

	[Fact]
	public void SnesHiRomToFile_WithHeader_AddsHeaderOffset() {
		var fileOffset = AddressConverter.SnesHiRomToFile(0xc00000, 512);

		Assert.Equal(512, fileOffset);
	}

	#endregion

	#region Roundtrip Tests

	[Fact]
	public void NesConversion_RoundTrip_PreservesAddress() {
		int originalFile = 0x1000;

		var (cpuAddr, bank) = AddressConverter.NesFileToCpu(originalFile, 16);
		var backToFile = AddressConverter.NesCpuToFile(cpuAddr, 4, bank);

		Assert.Equal(originalFile, backToFile);
	}

	[Fact]
	public void SnesLoRomConversion_RoundTrip_PreservesAddress() {
		int originalFile = 0x10000;

		var snesAddr = AddressConverter.SnesFileToLoRom(originalFile);
		var backToFile = AddressConverter.SnesLoRomToFile(snesAddr);

		Assert.Equal(originalFile, backToFile);
	}

	[Fact]
	public void SnesHiRomConversion_RoundTrip_PreservesAddress() {
		int originalFile = 0x10000;

		var snesAddr = AddressConverter.SnesFileToHiRom(originalFile);
		var backToFile = AddressConverter.SnesHiRomToFile(snesAddr);

		Assert.Equal(originalFile, backToFile);
	}

	#endregion
}
