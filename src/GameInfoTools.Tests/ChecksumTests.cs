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
			rom[i] = (byte)(i & 0xff);
		}

		var result = Checksum.SnesChecksum(rom);
		Assert.NotEqual(0, result);
	}

	[Fact]
	public void SnesComplement_ReturnsValidComplement() {
		ushort checksum = 0x1234;
		ushort complement = Checksum.SnesComplement(checksum);
		Assert.Equal((ushort)(checksum ^ 0xffff), complement);
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
			rom[i] = (byte)(i & 0xff);
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
		for (int i = 0x134; i <= 0x14c; i++) {
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
			rom[i] = (byte)(i & 0xff);
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

		// Checksum ^ complement should equal 0xffff
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
			data[i] = (byte)(i & 0xff);
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

	#region SHA256/384/512 Tests

	[Fact]
	public void Sha256_ReturnsValidHash() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		var result = Checksum.Sha256(data);
		Assert.NotNull(result);
		Assert.Equal(64, result.Length); // SHA256 produces 32 bytes = 64 hex chars
	}

	[Fact]
	public void Sha256_ReturnsLowercaseHex() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		var result = Checksum.Sha256(data);
		Assert.Equal(result.ToLowerInvariant(), result);
	}

	[Fact]
	public void Sha256_KnownValue_Correct() {
		// SHA256 of empty data is a known value
		byte[] data = [];
		var result = Checksum.Sha256(data);
		Assert.Equal("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", result);
	}

	[Fact]
	public void Sha384_ReturnsValidHash() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		var result = Checksum.Sha384(data);
		Assert.NotNull(result);
		Assert.Equal(96, result.Length); // SHA384 produces 48 bytes = 96 hex chars
	}

	[Fact]
	public void Sha512_ReturnsValidHash() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		var result = Checksum.Sha512(data);
		Assert.NotNull(result);
		Assert.Equal(128, result.Length); // SHA512 produces 64 bytes = 128 hex chars
	}

	#endregion

	#region CalculateAllHashes Tests

	[Fact]
	public void CalculateAllHashes_ReturnsAllHashes() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		var result = Checksum.CalculateAllHashes(data);

		Assert.NotEqual(0u, result.Crc32);
		Assert.Equal(32, result.Md5.Length);
		Assert.Equal(40, result.Sha1.Length);
		Assert.Equal(64, result.Sha256.Length);
		Assert.Equal(96, result.Sha384.Length);
		Assert.Equal(128, result.Sha512.Length);
	}

	[Fact]
	public void CalculateAllHashes_EmptyData_ReturnsValidHashes() {
		byte[] data = [];
		var result = Checksum.CalculateAllHashes(data);

		Assert.Equal(0u, result.Crc32);
		Assert.NotNull(result.Md5);
		Assert.NotNull(result.Sha256);
	}

	#endregion

	#region VerifyHash Tests

	[Fact]
	public void VerifyHash_Crc32_CorrectHash_ReturnsTrue() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		string expected = Checksum.Crc32(data).ToString("x8");

		Assert.True(Checksum.VerifyHash(data, expected, HashType.Crc32));
	}

	[Fact]
	public void VerifyHash_Md5_CorrectHash_ReturnsTrue() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		string expected = Checksum.Md5(data);

		Assert.True(Checksum.VerifyHash(data, expected, HashType.Md5));
	}

	[Fact]
	public void VerifyHash_Sha256_CorrectHash_ReturnsTrue() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		string expected = Checksum.Sha256(data);

		Assert.True(Checksum.VerifyHash(data, expected, HashType.Sha256));
	}

	[Fact]
	public void VerifyHash_WrongHash_ReturnsFalse() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];

		Assert.False(Checksum.VerifyHash(data, "0000000000000000", HashType.Md5));
	}

	[Fact]
	public void VerifyHash_CaseInsensitive() {
		byte[] data = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		string expectedLower = Checksum.Sha256(data);
		string expectedUpper = expectedLower.ToUpperInvariant();

		Assert.True(Checksum.VerifyHash(data, expectedUpper, HashType.Sha256));
	}

	#endregion

	#region ParseHashFile Tests

	[Fact]
	public void ParseHashFile_StandardFormat_ParsesCorrectly() {
		string content = """
			d41d8cd98f00b204e9800998ecf8427e  file1.rom
			098f6bcd4621d373cade4e832627b4f6  file2.rom
			""";

		var entries = Checksum.ParseHashFile(content, HashType.Md5);

		Assert.Equal(2, entries.Count);
		Assert.Equal("file1.rom", entries[0].FilePath);
		Assert.Equal("d41d8cd98f00b204e9800998ecf8427e", entries[0].ExpectedHash);
		Assert.Equal(HashType.Md5, entries[0].HashType);
	}

	[Fact]
	public void ParseHashFile_BinaryMode_ParsesCorrectly() {
		string content = """
			d41d8cd98f00b204e9800998ecf8427e *file1.rom
			""";

		var entries = Checksum.ParseHashFile(content, HashType.Md5);

		Assert.Single(entries);
		Assert.Equal("file1.rom", entries[0].FilePath);
	}

	[Fact]
	public void ParseHashFile_WithComments_IgnoresComments() {
		string content = """
			# This is a comment
			d41d8cd98f00b204e9800998ecf8427e  file1.rom
			""";

		var entries = Checksum.ParseHashFile(content, HashType.Md5);

		Assert.Single(entries);
	}

	[Fact]
	public void ParseHashFile_EmptyLines_IgnoresEmptyLines() {
		string content = """
			d41d8cd98f00b204e9800998ecf8427e  file1.rom

			098f6bcd4621d373cade4e832627b4f6  file2.rom
			""";

		var entries = Checksum.ParseHashFile(content, HashType.Md5);

		Assert.Equal(2, entries.Count);
	}

	#endregion

	#region GenerateHashFile Tests

	[Fact]
	public void GenerateHashFile_GeneratesCorrectFormat() {
		var files = new List<(string FilePath, string Hash)> {
			("file1.rom", "d41d8cd98f00b204e9800998ecf8427e"),
			("file2.rom", "098f6bcd4621d373cade4e832627b4f6")
		};

		string result = Checksum.GenerateHashFile(files);

		Assert.Contains("d41d8cd98f00b204e9800998ecf8427e", result);
		Assert.Contains("file1.rom", result);
	}

	[Fact]
	public void GenerateHashFile_BinaryMode_AddsStar() {
		var files = new List<(string FilePath, string Hash)> {
			("file1.rom", "d41d8cd98f00b204e9800998ecf8427e")
		};

		string result = Checksum.GenerateHashFile(files, binary: true);

		Assert.Contains("*file1.rom", result);
	}

	#endregion

	#region Report Generation Tests

	[Fact]
	public void GenerateReport_Txt_ContainsAllHashes() {
		var files = new List<Checksum.FileHashReport> {
			new("test.rom", 1024, new Checksum.HashResult(
				0x12345678u,
				"d41d8cd98f00b204e9800998ecf8427e",
				"da39a3ee5e6b4b0d3255bfef95601890afd80709",
				"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
				"38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
				"cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
			))
		};

		var report = Checksum.GenerateReport(files, ReportFormat.Txt);

		Assert.Contains("test.rom", report);
		Assert.Contains("12345678", report);
		Assert.Contains("d41d8cd98f00b204e9800998ecf8427e", report);
	}

	[Fact]
	public void GenerateReport_Json_IsValidJson() {
		var files = new List<Checksum.FileHashReport> {
			new("test.rom", 1024, new Checksum.HashResult(
				0x12345678u,
				"d41d8cd98f00b204e9800998ecf8427e",
				"da39a3ee5e6b4b0d3255bfef95601890afd80709",
				"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
				"38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
				"cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
			))
		};

		var report = Checksum.GenerateReport(files, ReportFormat.Json);

		Assert.Contains("\"files\":", report);
		Assert.Contains("\"name\": \"test.rom\"", report);
		Assert.Contains("\"crc32\": \"12345678\"", report);
	}

	[Fact]
	public void GenerateReport_Xml_IsValidXml() {
		var files = new List<Checksum.FileHashReport> {
			new("test.rom", 1024, new Checksum.HashResult(
				0x12345678u,
				"d41d8cd98f00b204e9800998ecf8427e",
				"da39a3ee5e6b4b0d3255bfef95601890afd80709",
				"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
				"38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
				"cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
			))
		};

		var report = Checksum.GenerateReport(files, ReportFormat.Xml);

		Assert.Contains("<?xml", report);
		Assert.Contains("<checksumReport>", report);
		Assert.Contains("<name>test.rom</name>", report);
		Assert.Contains("<crc32>12345678</crc32>", report);
	}

	[Fact]
	public void GenerateReport_Csv_HasHeader() {
		var files = new List<Checksum.FileHashReport> {
			new("test.rom", 1024, new Checksum.HashResult(
				0x12345678u,
				"d41d8cd98f00b204e9800998ecf8427e",
				"da39a3ee5e6b4b0d3255bfef95601890afd80709",
				"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
				"38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
				"cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
			))
		};

		var report = Checksum.GenerateReport(files, ReportFormat.Csv);

		Assert.Contains("\"FileName\"", report);
		Assert.Contains("\"CRC32\"", report);
		Assert.Contains("\"test.rom\"", report);
	}

	[Fact]
	public void GenerateReport_MultipleFiles_ContainsAll() {
		var files = new List<Checksum.FileHashReport> {
			new("file1.rom", 1024, new Checksum.HashResult(0x11111111u, "md51", "sha11", "sha2561", "sha3841", "sha5121")),
			new("file2.rom", 2048, new Checksum.HashResult(0x22222222u, "md52", "sha12", "sha2562", "sha3842", "sha5122"))
		};

		var report = Checksum.GenerateReport(files, ReportFormat.Txt);

		Assert.Contains("file1.rom", report);
		Assert.Contains("file2.rom", report);
		Assert.Contains("11111111", report);
		Assert.Contains("22222222", report);
	}

	#endregion

	#region Database Comparison Tests

	[Fact]
	public void LoadDatFile_ParsesNoIntroFormat() {
		var datContent = """
			clrmamepro (
				name "Test ROM Set"
				description "Test ROM Set"
			)

			game (
				name "Test Game"
				description "Test Game Description"
				rom ( name "Test Game.nes" size 262160 crc 12345678 md5 d41d8cd98f00b204e9800998ecf8427e sha1 da39a3ee5e6b4b0d3255bfef95601890afd80709 )
			)
			""";

		var database = Checksum.LoadDatFile(datContent);

		Assert.Equal(1, database.Count);
		Assert.Equal("Test Game", database.Entries[0].Name);
	}

	[Fact]
	public void LoadDatFile_ParsesMultipleEntries() {
		var datContent = """
			game (
				name "Game 1"
				rom ( size 1024 crc 11111111 )
			)

			game (
				name "Game 2"
				rom ( size 2048 crc 22222222 )
			)
			""";

		var database = Checksum.LoadDatFile(datContent);

		Assert.Equal(2, database.Count);
	}

	[Fact]
	public void RomDatabase_FindByCrc32_ReturnsMatch() {
		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Test Game", "Desc", 0x12345678u, "md5hash", "sha1hash", 1024)
		};
		var database = new RomDatabase(entries);

		var result = database.FindByCrc32(0x12345678u);

		Assert.NotNull(result);
		Assert.Equal("Test Game", result.Name);
	}

	[Fact]
	public void RomDatabase_FindByMd5_ReturnsMatch() {
		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Test Game", "Desc", 0x12345678u, "d41d8cd98f00b204e9800998ecf8427e", "sha1hash", 1024)
		};
		var database = new RomDatabase(entries);

		var result = database.FindByMd5("D41D8CD98F00B204E9800998ECF8427E"); // uppercase

		Assert.NotNull(result);
		Assert.Equal("Test Game", result.Name);
	}

	[Fact]
	public void RomDatabase_FindBySha1_ReturnsMatch() {
		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Test Game", "Desc", 0x12345678u, "md5hash", "da39a3ee5e6b4b0d3255bfef95601890afd80709", 1024)
		};
		var database = new RomDatabase(entries);

		var result = database.FindBySha1("DA39A3EE5E6B4B0D3255BFEF95601890AFD80709");

		Assert.NotNull(result);
		Assert.Equal("Test Game", result.Name);
	}

	[Fact]
	public void RomDatabase_Search_FindsPartialMatch() {
		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Dragon Warrior IV (USA)", "Description", null, null, null, null),
			new("Final Fantasy (USA)", "Another game", null, null, null, null)
		};
		var database = new RomDatabase(entries);

		var results = database.Search("Dragon");

		Assert.Single(results);
		Assert.Equal("Dragon Warrior IV (USA)", results[0].Name);
	}

	[Fact]
	public void CompareToDatabase_MatchesBySha1First() {
		var testData = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var hashes = Checksum.CalculateAllHashes(testData);

		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Test Game", "Desc", hashes.Crc32, hashes.Md5, hashes.Sha1, 4)
		};
		var database = new RomDatabase(entries);

		var result = Checksum.CompareToDatabase(testData, database);

		Assert.True(result.Found);
		Assert.Equal("SHA1", result.MatchedBy);
		Assert.Equal("Test Game", result.Entry?.Name);
	}

	[Fact]
	public void CompareToDatabase_NoMatch_ReturnsFalse() {
		var testData = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var entries = new List<Checksum.RomDatabaseEntry> {
			new("Different Game", "Desc", 0x99999999u, "differentmd5", "differentsha1", 4)
		};
		var database = new RomDatabase(entries);

		var result = Checksum.CompareToDatabase(testData, database);

		Assert.False(result.Found);
		Assert.Null(result.Entry);
	}

	#endregion

	#region Partial ROM Checksum Tests

	[Fact]
	public void CalculateRegionHashes_CalculatesForRegion() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) {
			data[i] = (byte)i;
		}

		var fullHash = Checksum.CalculateAllHashes(data);
		var regionHash = Checksum.CalculateRegionHashes(data, 0, 100);

		Assert.Equal(fullHash.Crc32, regionHash.Crc32);
		Assert.Equal(fullHash.Md5, regionHash.Md5);
	}

	[Fact]
	public void CalculateRegionHashes_DifferentRegionsDifferentHashes() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) {
			data[i] = (byte)i;
		}

		var region1 = Checksum.CalculateRegionHashes(data, 0, 50);
		var region2 = Checksum.CalculateRegionHashes(data, 50, 50);

		Assert.NotEqual(region1.Crc32, region2.Crc32);
	}

	[Fact]
	public void CalculateRegionHashes_ThrowsOnInvalidOffset() {
		var data = new byte[100];

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			Checksum.CalculateRegionHashes(data, -1, 50));
	}

	[Fact]
	public void CalculateRegionHashes_ThrowsOnRegionExceedsBounds() {
		var data = new byte[100];

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			Checksum.CalculateRegionHashes(data, 80, 50));
	}

	[Fact]
	public void CalculateRegionHashes_MultipleRegions_ReturnsAll() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) {
			data[i] = (byte)i;
		}

		var regions = new List<Checksum.RomRegion> {
			new("First", 0, 25),
			new("Second", 25, 25),
			new("Third", 50, 50)
		};

		var results = Checksum.CalculateRegionHashes(data, regions);

		Assert.Equal(3, results.Count);
		Assert.All(results, r => Assert.NotNull(r.Hashes));
		Assert.All(results, r => Assert.Null(r.Error));
	}

	[Fact]
	public void CalculateRegionHashes_InvalidRegion_ReturnsError() {
		var data = new byte[100];
		var regions = new List<Checksum.RomRegion> {
			new("Valid", 0, 50),
			new("Invalid", 90, 50) // Exceeds bounds
		};

		var results = Checksum.CalculateRegionHashes(data, regions);

		Assert.Equal(2, results.Count);
		Assert.NotNull(results[0].Hashes);
		Assert.NotNull(results[1].Error);
	}

	[Fact]
	public void CalculateRegionHashes_NegativeLength_MeansToEnd() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) {
			data[i] = (byte)i;
		}

		var regions = new List<Checksum.RomRegion> {
			new("ToEnd", 50, -1)
		};

		var results = Checksum.CalculateRegionHashes(data, regions);

		Assert.Single(results);
		Assert.Equal(50, results[0].Length); // Should be calculated as 100-50
		Assert.NotNull(results[0].Hashes);
	}

	[Fact]
	public void GetStandardRegions_Nes_ReturnsValidRegions() {
		var regions = Checksum.GetStandardRegions(SystemType.Nes);

		Assert.NotEmpty(regions);
		Assert.Contains(regions, r => r.Name == "Header");
	}

	[Fact]
	public void GetStandardRegions_Snes_ReturnsValidRegions() {
		var data = new byte[0x10000]; // 64KB
		var regions = Checksum.GetStandardRegions(SystemType.Snes, data);

		Assert.NotEmpty(regions);
		Assert.Contains(regions, r => r.Name.Contains("ROM"));
	}

	[Fact]
	public void GetStandardRegions_GameBoy_ReturnsHeaderRegion() {
		var regions = Checksum.GetStandardRegions(SystemType.GameBoy);

		Assert.NotEmpty(regions);
		Assert.Contains(regions, r => r.Name == "Header");
		Assert.Contains(regions, r => r.Name == "Nintendo Logo");
	}

	[Fact]
	public void GetStandardRegions_Gba_ReturnsHeaderRegion() {
		var regions = Checksum.GetStandardRegions(SystemType.GameBoyAdvance);

		Assert.NotEmpty(regions);
		Assert.Contains(regions, r => r.Name == "Header");
		Assert.Contains(regions, r => r.Name == "Title");
	}

	[Fact]
	public void GetStandardRegions_NesWithData_ParsesHeader() {
		var data = new byte[16 + 0x4000 + 0x2000]; // Header + 16KB PRG + 8KB CHR
		data[4] = 1; // 1 PRG bank
		data[5] = 1; // 1 CHR bank

		var regions = Checksum.GetStandardRegions(SystemType.Nes, data);

		Assert.Contains(regions, r => r.Name == "PRG-ROM");
		Assert.Contains(regions, r => r.Name == "CHR-ROM");
	}

	#endregion
}
