using GameInfoTools.Analysis.Games.DQ3r;
using Xunit;

namespace GameInfoTools.Tests.Games.DQ3r;

/// <summary>
/// Tests for DQ3r address translation utilities.
/// </summary>
public class DQ3rAddressTranslatorTests {
	[Theory]
	[InlineData(0xc00000, 0x000000)]
	[InlineData(0xc10000, 0x010000)]
	[InlineData(0xff0000, 0x3f0000)]
	[InlineData(0xc01234, 0x001234)]
	public void SnesAddressToFile_ConvertsHiRomCorrectly(int snesAddress, int expectedFile) {
		int result = DQ3rAddressTranslator.SnesAddressToFile(snesAddress);
		Assert.Equal(expectedFile, result);
	}

	[Theory]
	[InlineData(0x000000, 0xc00000)]
	[InlineData(0x010000, 0xc10000)]
	[InlineData(0x3f0000, 0xff0000)]
	[InlineData(0x001234, 0xc01234)]
	public void FileToSnesAddress_ConvertsToHiRom(int fileOffset, int expectedSnes) {
		int result = DQ3rAddressTranslator.FileToSnesAddress(fileOffset);
		Assert.Equal(expectedSnes, result);
	}

	[Theory]
	[InlineData("$C0:1234", 0xc01234)]
	[InlineData("C01234", 0xc01234)]
	[InlineData("$ff:0000", 0xff0000)]
	public void ParseSnesAddress_HandlesVariousFormats(string input, int expected) {
		int result = DQ3rAddressTranslator.ParseSnesAddress(input);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0xc0abcd, "$c0:abcd")]
	[InlineData(0xff0000, "$ff:0000")]
	public void FormatSnesAddress_FormatsCorrectly(int address, string expected) {
		string result = DQ3rAddressTranslator.FormatSnesAddress(address);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x000000, 0xc0)]
	[InlineData(0x010000, 0xc1)]
	[InlineData(0x3f0000, 0xff)]
	[InlineData(0x00ffff, 0xc0)]
	public void GetBank_ReturnsCorrectBankNumber(int fileOffset, int expectedBank) {
		int result = DQ3rAddressTranslator.GetBank(fileOffset);
		Assert.Equal(expectedBank, result);
	}

	[Theory]
	[InlineData(0xc00000, true)]
	[InlineData(0xff0000, true)]
	[InlineData(0x800000, false)]
	[InlineData(0x400000, false)]
	public void IsValidSnesAddress_ValidatesCorrectly(int address, bool expected) {
		bool result = DQ3rAddressTranslator.IsValidSnesAddress(address);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x000000, true)]
	[InlineData(0x5fffff, true)]
	[InlineData(0x600000, false)]
	[InlineData(-1, false)]
	public void IsValidFileOffset_ValidatesCorrectly(int offset, bool expected) {
		bool result = DQ3rAddressTranslator.IsValidFileOffset(offset);
		Assert.Equal(expected, result);
	}
}

/// <summary>
/// Tests for DQ3r compression handler.
/// </summary>
public class DQ3rCompressionHandlerTests {
	[Fact]
	public void DecompressRing400_DecompressesSimpleLiteral() {
		// Command byte with all literals (0xFF)
		// Followed by 8 literal bytes
		byte[] compressed = [0xff, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		byte[] result = DQ3rCompressionHandler.DecompressRing400(compressed, 8);

		Assert.Equal(8, result.Length);
		Assert.Equal((byte)0x01, result[0]);
		Assert.Equal((byte)0x08, result[7]);
	}

	[Fact]
	public void CompressRing400_CompressesData() {
		// Simple data with no repeats
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] compressed = DQ3rCompressionHandler.CompressRing400(original);

		Assert.NotNull(compressed);
		Assert.True(compressed.Length > 0);
	}

	[Fact]
	public void DetectRing400Compression_DetectsCompressed() {
		// Create data that looks like Ring400 compression with valid command structure
		// Command byte 0xff means all 8 bits are literal, followed by 8 literal bytes
		// This is a valid Ring400 stream (all literals)
		byte[] compressed = [0xff, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48,
							  0xff, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50];

		bool result = DQ3rCompressionHandler.DetectRing400Compression(compressed);

		// All-literal commands should be detected as Ring400
		Assert.True(result);
	}

	[Fact]
	public void DetectCompressionType_DetectsForRandomData() {
		// Random high entropy data looks like it might be compressed
		byte[] data = new byte[100];
		new Random(42).NextBytes(data);
		var result = DQ3rCompressionHandler.DetectCompressionType(data);

		// Should detect some compression type or treat as already compressed
		Assert.NotEqual(DQ3rCompressionType.None, result);
	}
}

/// <summary>
/// Tests for DQ3r ROM analyzer.
/// </summary>
public class DQ3rRomAnalyzerTests {
	[Fact]
	public void AnalyzeBank_ReturnsValidAnalysis() {
		// Create minimal ROM data (one bank)
		byte[] romData = new byte[0x10000];
		new Random(42).NextBytes(romData);

		var analyzer = new DQ3rRomAnalyzer(romData);
		var result = analyzer.AnalyzeBank(0xc0);

		Assert.True(result.IsValid);
		Assert.Equal(0xc0, result.BankNumber);
		Assert.True(result.Entropy > 0);
	}

	[Fact]
	public void DetectSmcHeader_DetectsNoHeader() {
		// ROM without SMC header (multiple of 1024)
		byte[] romData = new byte[0x10000];

		var analyzer = new DQ3rRomAnalyzer(romData);

		Assert.Equal(0, analyzer.SmcHeaderSize);
		Assert.Equal(0x10000, analyzer.EffectiveRomSize);
	}

	[Fact]
	public void DetectSmcHeader_DetectsHeader() {
		// ROM with SMC header (multiple of 1024 + 512)
		byte[] romData = new byte[0x10000 + 512];

		var analyzer = new DQ3rRomAnalyzer(romData);

		Assert.Equal(512, analyzer.SmcHeaderSize);
		Assert.Equal(0x10000, analyzer.EffectiveRomSize);
	}
}

/// <summary>
/// Tests for DQ3r text extractor.
/// </summary>
public class DQ3rTextExtractorTests {
	[Fact]
	public void ExtractDialogPointers_ReturnsPointers() {
		// Create ROM with pointer table
		byte[] romData = new byte[0x20000];

		// Place some test pointers at the expected location
		int pointerOffset = DQ3rTextExtractor.TextLocations.DialogPointers;
		romData[pointerOffset] = 0x00;
		romData[pointerOffset + 1] = 0x10;
		romData[pointerOffset + 2] = 0xc0;

		var extractor = new DQ3rTextExtractor(romData);
		var pointers = extractor.ExtractDialogPointers();

		Assert.True(pointers.Length > 0);
		Assert.Equal(0xc01000, pointers[0]);
	}

	[Fact]
	public void AnalyzeRegion_DetectsTextPatterns() {
		// Create ROM with text-like data
		byte[] romData = new byte[0x1000];
		for (int i = 0; i < 0x500; i++) {
			romData[i] = (byte)(i % 0x80); // Printable-range bytes
		}

		var extractor = new DQ3rTextExtractor(romData);
		var result = extractor.AnalyzeRegion(0, 0x500);

		Assert.True(result.IsValid);
		Assert.True(result.PrintableByteCount > 0);
	}
}

/// <summary>
/// Tests for DQ3r graphics analyzer.
/// </summary>
public class DQ3rGraphicsAnalyzerTests {
	[Fact]
	public void Extract4bppTiles_ReturnsDecodedTiles() {
		// Create ROM with 4bpp tile data (32 bytes per tile)
		byte[] romData = new byte[0x1000];
		new Random(42).NextBytes(romData);

		var analyzer = new DQ3rGraphicsAnalyzer(romData);
		var tiles = analyzer.Extract4bppTiles(0, 0x100);

		// Should extract 8 tiles (256 bytes / 32 bytes per tile)
		Assert.Equal(8, tiles.Count);
		Assert.All(tiles, t => Assert.Equal(64, t.Pixels.Length));
		Assert.All(tiles, t => Assert.Equal(4, t.BitsPerPixel));
	}

	[Fact]
	public void DetectGraphicsRegions_DetectsPatterns() {
		// Create ROM with graphics-like patterns
		byte[] romData = new byte[0x10000];

		// Fill with tile-like data (low values in nibbles)
		for (int i = 0; i < romData.Length; i++) {
			romData[i] = (byte)(i % 16);
		}

		var analyzer = new DQ3rGraphicsAnalyzer(romData);
		var regions = analyzer.DetectGraphicsRegions();

		Assert.NotNull(regions);
	}
}

/// <summary>
/// Tests for DQ3r data types.
/// </summary>
public class DQ3rTypesTests {
	[Fact]
	public void RomSpec_HasCorrectValues() {
		Assert.Equal(6_291_456, DQ3rTypes.RomSpec.RomSize);
		Assert.Equal(512, DQ3rTypes.RomSpec.SmcHeaderSize);
		Assert.Equal(0xc00000, DQ3rTypes.RomSpec.HiRomOffset);
		Assert.Equal(0x10000, DQ3rTypes.RomSpec.BankSize);
		Assert.Equal(64, DQ3rTypes.RomSpec.TotalBanks);
		Assert.Equal(0xc0, DQ3rTypes.RomSpec.FirstBank);
		Assert.Equal(0xff, DQ3rTypes.RomSpec.LastBank);
	}

	[Fact]
	public void DQ3rRomRegion_CalculatesPropertiesCorrectly() {
		var region = new DQ3rRomRegion {
			FileOffset = 0x010000,
			EndOffset = 0x020000,
			SnesAddress = "$c1:0000"
		};

		Assert.Equal(0x10000, region.Size);
		Assert.Equal(0xc1, region.Bank);
	}
}
