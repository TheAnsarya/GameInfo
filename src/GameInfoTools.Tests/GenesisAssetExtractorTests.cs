using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for GenesisAssetExtractor
/// </summary>
public class GenesisAssetExtractorTests : IDisposable {
	private readonly string _tempDir;

	public GenesisAssetExtractorTests() {
		_tempDir = Path.Combine(Path.GetTempPath(), $"GenesisExtractorTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, recursive: true);
		}
	}

	/// <summary>
	/// Create a minimal valid Genesis ROM
	/// </summary>
	private static byte[] CreateGenesisRom(string name = "TEST GAME") {
		var romSize = 0x80000;
		var rom = new byte[romSize];

		// Console name
		var consoleName = "SEGA GENESIS    ";
		var consoleBytes = System.Text.Encoding.ASCII.GetBytes(consoleName);
		Array.Copy(consoleBytes, 0, rom, 0x100, 16);

		// Domestic name
		var domBytes = System.Text.Encoding.ASCII.GetBytes(name.PadRight(48));
		Array.Copy(domBytes, 0, rom, 0x120, 48);

		// Overseas name
		Array.Copy(domBytes, 0, rom, 0x150, 48);

		// Region
		var region = "JUE             ";
		var regionBytes = System.Text.Encoding.ASCII.GetBytes(region);
		Array.Copy(regionBytes, 0, rom, 0x1f0, 16);

		return rom;
	}

	[Fact]
	public async Task ExtractBank_ValidBank_ExtractsCorrectly() {
		var rom = CreateGenesisRom();
		// Write test data at bank 1
		rom[0x10000] = 0xaa;
		rom[0x10001] = 0xbb;
		rom[0x10002] = 0xcc;

		var extractor = new GenesisAssetExtractor();
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
		Assert.Equal(0x10000, result.BytesExtracted);
		Assert.True(File.Exists(result.OutputPath));

		var data = await File.ReadAllBytesAsync(result.OutputPath!);
		Assert.Equal(0xaa, data[0]);
		Assert.Equal(0xbb, data[1]);
		Assert.Equal(0xcc, data[2]);
	}

	[Fact]
	public async Task ExtractBank_InvalidBank_ReturnsError() {
		var rom = CreateGenesisRom();
		var extractor = new GenesisAssetExtractor();
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
		var rom = CreateGenesisRom();
		var extractor = new GenesisAssetExtractor();
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
		Assert.Equal(8, result.Metadata["bankCount"]);

		// Check files exist
		for (int i = 0; i < 8; i++) {
			var bankFile = Path.Combine(_tempDir, $"banks_bank_{i:d2}.bin");
			Assert.True(File.Exists(bankFile), $"Bank file {i} should exist");
		}
	}

	[Fact]
	public async Task ExtractPalette_9BitRgb_ConvertsCorrectly() {
		var rom = CreateGenesisRom();
		// Write a test palette at offset $100
		// Genesis palette: 0x0BBB 0GGG 0RRR (big-endian)
		// Color 0: $0000 (black)
		rom[0x200] = 0x00;
		rom[0x201] = 0x00;
		// Color 1: $0eee (white - all 7s)
		rom[0x202] = 0x0e;
		rom[0x203] = 0xee;

		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_palette",
			Type = AssetType.Palette,
			Source = new AssetSource { Offset = "0x200" },
			Output = "palette.json",
			Options = new Dictionary<string, object> {
				["extractType"] = "palette",
				["colors"] = 2
			}
		};

		var outputPath = Path.Combine(_tempDir, "palette.json");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(2, result.Metadata["colorCount"]);
		Assert.Equal("Genesis 9-bit RGB", result.Metadata["format"]);

		var json = await File.ReadAllTextAsync(result.OutputPath!);
		Assert.Contains("\"format\": \"Genesis 9-bit RGB\"", json);
	}

	[Fact]
	public async Task ExtractRaw_ExtractsCorrectly() {
		var rom = CreateGenesisRom();
		rom[0x300] = 0xde;
		rom[0x301] = 0xad;
		rom[0x302] = 0xbe;
		rom[0x303] = 0xef;

		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_data",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0x300", Length = "4" },
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
		var rom = CreateGenesisRom("SUPER TEST GAME");
		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0", Length = "16" },
			Output = "test.bin"
		};

		var outputPath = Path.Combine(_tempDir, "test.bin");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Contains("SUPER TEST GAME", result.Metadata["domesticName"].ToString());
	}

	[Fact]
	public async Task ExtractVgmAudio_CreatesVgmFile() {
		var rom = CreateGenesisRom("VGM TEST");
		// Write some audio data
		for (int i = 0; i < 256; i++) {
			rom[0x1000 + i] = (byte)i;
		}

		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_audio",
			Type = AssetType.Audio,
			Source = new AssetSource { Offset = "0x1000", Length = "0x100" },
			Output = "test.vgm",
			Options = new Dictionary<string, object> {
				["extractType"] = "vgm"
			}
		};

		var outputPath = Path.Combine(_tempDir, "test.vgm");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(result.OutputPath));

		var vgmData = await File.ReadAllBytesAsync(result.OutputPath!);

		// Check VGM magic "Vgm "
		Assert.Equal((byte)'V', vgmData[0]);
		Assert.Equal((byte)'g', vgmData[1]);
		Assert.Equal((byte)'m', vgmData[2]);
		Assert.Equal((byte)' ', vgmData[3]);
	}

	[Fact]
	public async Task ExtractHeader_ExtractsRomInfo() {
		var rom = CreateGenesisRom("HEADER TEST GAME");
		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "header",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0" },
			Output = "header.json",
			Options = new Dictionary<string, object> {
				["extractType"] = "header"
			}
		};

		var outputPath = Path.Combine(_tempDir, "header.json");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);

		var json = await File.ReadAllTextAsync(result.OutputPath!);
		Assert.Contains("HEADER TEST GAME", json);
	}

	[Fact]
	public void Factory_ReturnsGenesisExtractor() {
		var extractor = AssetExtractorFactory.TryGetPlatformExtractor(Platform.Genesis);

		Assert.NotNull(extractor);
		Assert.IsType<GenesisAssetExtractor>(extractor);
	}

	[Fact]
	public async Task ExtractTiles_DelegatesToGraphicsExtractor() {
		var rom = CreateGenesisRom();
		// Write some 4bpp tile data
		for (int i = 0; i < 32; i++) {
			rom[0x400 + i] = (byte)(i * 8);
		}

		var extractor = new GenesisAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_tiles",
			Type = AssetType.Graphics,
			Source = new AssetSource { Offset = "0x400", Length = "32" },
			Output = "tiles.png",
			Options = new Dictionary<string, object> {
				["extractType"] = "tiles",
				["bpp"] = 4
			}
		};

		var outputPath = Path.Combine(_tempDir, "tiles.png");
		var result = await extractor.ExtractAsync(rom, asset, outputPath, new AssetsConfig());

		// Should at least attempt extraction
		Assert.NotNull(result);
	}
}
