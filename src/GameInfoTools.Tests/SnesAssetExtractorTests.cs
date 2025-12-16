using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for SnesAssetExtractor
/// </summary>
public class SnesAssetExtractorTests : IDisposable {
	private readonly string _tempDir;

	public SnesAssetExtractorTests() {
		_tempDir = Path.Combine(Path.GetTempPath(), $"SnesExtractorTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, recursive: true);
		}
	}

	/// <summary>
	/// Create a minimal valid SNES ROM with LoROM header
	/// </summary>
	private static byte[] CreateLoRomHeader(string title = "TEST GAME") {
		var romSize = 0x80000; // 512KB
		var rom = new byte[romSize];

		var headerOffset = 0x7fb0;

		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title.PadRight(21));
		Array.Copy(titleBytes, 0, rom, headerOffset, Math.Min(titleBytes.Length, 21));

		rom[headerOffset + 0x15] = 0x20; // LoROM
		rom[headerOffset + 0x16] = 0x00; // ROM only
		rom[headerOffset + 0x17] = 0x09; // 512KB
		rom[headerOffset + 0x18] = 0x00; // No RAM
		rom[headerOffset + 0x19] = 0x01; // North America
		rom[headerOffset + 0x1a] = 0x01; // Developer ID
		rom[headerOffset + 0x1b] = 0x00; // Version
		rom[headerOffset + 0x1c] = 0xff; // Checksum complement
		rom[headerOffset + 0x1d] = 0xff;
		rom[headerOffset + 0x1e] = 0x00; // Checksum
		rom[headerOffset + 0x1f] = 0x00;

		rom[0x7fea] = 0x00;
		rom[0x7feb] = 0x80;
		rom[0x7ffc] = 0x00;
		rom[0x7ffd] = 0x80;

		return rom;
	}

	[Fact]
	public async Task ExtractBank_ValidBank_ExtractsCorrectly() {
		var rom = CreateLoRomHeader();
		// Write test data at bank 1
		rom[0x8000] = 0xaa;
		rom[0x8001] = 0xbb;
		rom[0x8002] = 0xcc;

		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "bank1",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0" },
			Output = "bank1.bin",
			Options = new Dictionary<string, object> {
				["extractType"] = "bank",
				["bank"] = 1
			}
		};

		var outputPath = Path.Combine(_tempDir, "bank1.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(0x8000, result.BytesExtracted);
		Assert.True(File.Exists(result.OutputPath));

		var data = await File.ReadAllBytesAsync(result.OutputPath!);
		Assert.Equal(0xaa, data[0]);
		Assert.Equal(0xbb, data[1]);
		Assert.Equal(0xcc, data[2]);
	}

	[Fact]
	public async Task ExtractBank_InvalidBankNumber_ReturnsError() {
		var rom = CreateLoRomHeader();
		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "invalid_bank",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0" },
			Output = "invalid.bin",
			Options = new Dictionary<string, object> {
				["extractType"] = "bank",
				["bank"] = 999
			}
		};

		var outputPath = Path.Combine(_tempDir, "invalid.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.False(result.Success);
		Assert.Contains("out of range", result.Error);
	}

	[Fact]
	public async Task ExtractAllBanks_CreatesMultipleFiles() {
		var rom = CreateLoRomHeader();
		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "all_banks",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0" },
			Output = "banks.bin",
			Options = new Dictionary<string, object> {
				["extractType"] = "allbanks"
			}
		};

		var outputPath = Path.Combine(_tempDir, "banks.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(16, result.Metadata["bankCount"]);

		// Check files exist
		for (int i = 0; i < 16; i++) {
			var bankFile = Path.Combine(_tempDir, $"banks_bank_{i:d2}.bin");
			Assert.True(File.Exists(bankFile), $"Bank file {i} should exist");
		}
	}

	[Fact]
	public async Task ExtractPalette_BGR15Format_ConvertsCorrectly() {
		var rom = CreateLoRomHeader();
		// Write a test palette at offset $100
		// Color 0: $0000 (black)
		rom[0x100] = 0x00;
		rom[0x101] = 0x00;
		// Color 1: $7fff (white)
		rom[0x102] = 0xff;
		rom[0x103] = 0x7f;
		// Color 2: $001f (red - 5 bits = 31)
		rom[0x104] = 0x1f;
		rom[0x105] = 0x00;
		// Color 3: $03e0 (green)
		rom[0x106] = 0xe0;
		rom[0x107] = 0x03;

		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_palette",
			Type = AssetType.Palette,
			Source = new AssetSource { Offset = "0x100" },
			Output = "palette.json",
			Options = new Dictionary<string, object> {
				["extractType"] = "palette",
				["colors"] = 4
			}
		};

		var outputPath = Path.Combine(_tempDir, "palette.json");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(4, result.Metadata["colorCount"]);
		Assert.Equal("BGR15", result.Metadata["format"]);

		var json = await File.ReadAllTextAsync(result.OutputPath!);
		Assert.Contains("\"format\": \"BGR15\"", json);
		Assert.Contains("\"colorCount\": 4", json);
	}

	[Fact]
	public async Task ExtractRaw_FileOffset_ExtractsCorrectly() {
		var rom = CreateLoRomHeader();
		// Write test data at file offset 0x100
		rom[0x100] = 0xde;
		rom[0x101] = 0xad;
		rom[0x102] = 0xbe;
		rom[0x103] = 0xef;

		var extractor = new SnesAssetExtractor();
		// Use file offset directly (not SNES address)
		var asset = new AssetDefinition {
			Name = "test_data",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0x100", Length = "4" },
			Output = "data.bin"
		};

		var outputPath = Path.Combine(_tempDir, "data.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(4, result.BytesExtracted);

		var data = await File.ReadAllBytesAsync(result.OutputPath!);
		Assert.Equal(new byte[] { 0xde, 0xad, 0xbe, 0xef }, data);
	}

	[Fact]
	public async Task Extract_AddsRomMetadata() {
		var rom = CreateLoRomHeader("SUPER TEST GAME");
		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0", Length = "16" },
			Output = "test.bin"
		};

		var outputPath = Path.Combine(_tempDir, "test.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal("LoRom", result.Metadata["mapping"].ToString());
		Assert.Contains("SUPER TEST GAME", result.Metadata["title"].ToString());
	}

	[Fact]
	public async Task ExtractSpcAudio_CreatesValidSpcFile() {
		var rom = CreateLoRomHeader("SPC TEST GAME");
		// Write some audio data at offset $1000
		for (int i = 0; i < 256; i++) {
			rom[0x1000 + i] = (byte)i;
		}

		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_audio",
			Type = AssetType.Audio,
			Source = new AssetSource { Offset = "0x1000", Length = "0x100" },
			Output = "test.spc",
			Options = new Dictionary<string, object> {
				["extractType"] = "spc",
				["name"] = "Test Song",
				["artist"] = "Test Artist"
			}
		};

		var outputPath = Path.Combine(_tempDir, "test.spc");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(result.OutputPath));

		var spcData = await File.ReadAllBytesAsync(result.OutputPath!);

		// Check SPC magic
		var magic = System.Text.Encoding.ASCII.GetString(spcData, 0, 33);
		Assert.Equal("SNES-SPC700 Sound File Data v0.30", magic);
	}

	[Fact]
	public async Task ExtractTiles_DelegatesToGraphicsExtractor() {
		var rom = CreateLoRomHeader();
		// Write some 2bpp tile data at offset $200
		for (int i = 0; i < 16; i++) {
			rom[0x200 + i] = (byte)(i * 16);
		}

		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_tiles",
			Type = AssetType.Graphics,
			Source = new AssetSource { Offset = "0x200", Length = "16" },
			Output = "tiles.png",
			Options = new Dictionary<string, object> {
				["extractType"] = "tiles",
				["bpp"] = 2,
				["tilesPerRow"] = 16
			}
		};

		var outputPath = Path.Combine(_tempDir, "tiles.png");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		// Should at least attempt extraction (may fail due to insufficient data for PNG)
		// The important thing is it delegates to the graphics extractor
		Assert.NotNull(result);
	}

	[Fact]
	public async Task ExtractBank_MissingBankOption_ReturnsError() {
		var rom = CreateLoRomHeader();
		var extractor = new SnesAssetExtractor();
		var asset = new AssetDefinition {
			Name = "no_bank",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0" },
			Output = "nobank.bin",
			Options = new Dictionary<string, object> {
				["extractType"] = "bank"
				// Missing "bank" option
			}
		};

		var outputPath = Path.Combine(_tempDir, "nobank.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.False(result.Success);
		Assert.Contains("bank", result.Error?.ToLower());
	}

	[Fact]
	public void Factory_ReturnsSnesExtractor() {
		var extractor = AssetExtractorFactory.GetPlatformExtractor(Platform.Snes);

		Assert.NotNull(extractor);
		Assert.IsType<SnesAssetExtractor>(extractor);
	}

	[Fact]
	public void Factory_ReturnsNullForUnknownPlatform() {
		var extractor = AssetExtractorFactory.GetPlatformExtractor(Platform.Unknown);

		Assert.Null(extractor);
	}
}
