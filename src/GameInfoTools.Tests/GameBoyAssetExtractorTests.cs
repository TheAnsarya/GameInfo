using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for GameBoyAssetExtractor functionality.
/// </summary>
public class GameBoyAssetExtractorTests : IDisposable {
	private readonly string _tempDir;

	public GameBoyAssetExtractorTests() {
		_tempDir = Path.Combine(Path.GetTempPath(), "GameBoyAssetExtractorTests_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(_tempDir);
	}

	/// <summary>
	/// Creates a minimal valid Game Boy ROM for testing.
	/// </summary>
	private static byte[] CreateMinimalGameBoyRom() {
		var romData = new byte[0x8000]; // 32KB minimum

		// Entry point at $100
		romData[0x100] = 0x00;
		romData[0x101] = 0xc3;
		romData[0x102] = 0x50;
		romData[0x103] = 0x01;

		// Nintendo logo
		var nintendoLogo = new byte[] {
			0xce, 0xed, 0x66, 0x66, 0xcc, 0x0d, 0x00, 0x0b,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0c, 0x00, 0x0d,
			0x00, 0x08, 0x11, 0x1f, 0x88, 0x89, 0x00, 0x0e,
			0xdc, 0xcc, 0x6e, 0xe6, 0xdd, 0xdd, 0xd9, 0x99,
			0xbb, 0xbb, 0x67, 0x63, 0x6e, 0x0e, 0xec, 0xcc,
			0xdd, 0xdc, 0x99, 0x9f, 0xbb, 0xb9, 0x33, 0x3e
		};
		Array.Copy(nintendoLogo, 0, romData, 0x104, nintendoLogo.Length);

		// Title
		var title = System.Text.Encoding.ASCII.GetBytes("TESTGAME");
		Array.Copy(title, 0, romData, 0x134, title.Length);

		// Cartridge type (ROM only)
		romData[0x147] = 0x00;
		romData[0x148] = 0x00; // 32KB
		romData[0x149] = 0x00; // No RAM
		romData[0x14A] = 0x01; // Non-Japanese
		romData[0x14B] = 0x33; // New licensee

		// Calculate header checksum
		int checksum = 0;
		for (int i = 0x134; i <= 0x14C; i++) {
			checksum = checksum - romData[i] - 1;
		}

		romData[0x14D] = (byte)(checksum & 0xff);

		return romData;
	}

	[Fact]
	public async Task ExtractAsync_WithBankType_ExtractsSingleBank() {
		var romData = CreateMinimalGameBoyRom();
		// Add some recognizable data to bank 0
		romData[0x200] = 0xAB;
		romData[0x201] = 0xCD;

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "bank0",
			Type = AssetType.Data,
			Source = new AssetSource(),
			Options = new Dictionary<string, object?> {
				["extractType"] = "bank",
				["bank"] = 0
			}
		};
		var outputPath = Path.Combine(_tempDir, "bank0.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var extractedData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(0x4000, extractedData.Length);
		Assert.Equal(0xAB, extractedData[0x200]);
		Assert.Equal(0xCD, extractedData[0x201]);
	}

	[Fact]
	public async Task ExtractAsync_WithAllBanksType_ExtractsAllBanks() {
		var romData = CreateMinimalGameBoyRom();

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "allbanks",
			Type = AssetType.Data,
			Source = new AssetSource(),
			Options = new Dictionary<string, object?> {
				["extractType"] = "allbanks"
			}
		};
		var outputPath = Path.Combine(_tempDir, "banks", "bank.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(Path.Combine(_tempDir, "banks", "bank_bank_00.bin")));
		Assert.True(File.Exists(Path.Combine(_tempDir, "banks", "bank_bank_01.bin")));
		Assert.Equal(2, result.Metadata["bankCount"]);
	}

	[Fact]
	public async Task ExtractAsync_WithHeaderType_ExtractsHeaderAsJson() {
		var romData = CreateMinimalGameBoyRom();

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "header",
			Type = AssetType.Data,
			Source = new AssetSource(),
			Options = new Dictionary<string, object?> {
				["extractType"] = "header"
			}
		};
		var outputPath = Path.Combine(_tempDir, "header.json");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var json = await File.ReadAllTextAsync(outputPath);
		Assert.Contains("TESTGAME", json);
		Assert.Contains("mbc", json);
	}

	[Fact]
	public async Task ExtractAsync_WithPaletteType_ExtractsGbcPalette() {
		var romData = CreateMinimalGameBoyRom();
		// Add a GBC palette at a known offset (15-bit RGB: 0bbbbbgggggrrrrr)
		// White: R=31, G=31, B=31 = 0x7FFF
		// Red: R=31, G=0, B=0 = 0x001F
		// Green: R=0, G=31, B=0 = 0x03E0
		// Blue: R=0, G=0, B=31 = 0x7C00
		romData[0x1000] = 0xFF; romData[0x1001] = 0x7F; // White
		romData[0x1002] = 0x1F; romData[0x1003] = 0x00; // Red
		romData[0x1004] = 0xE0; romData[0x1005] = 0x03; // Green
		romData[0x1006] = 0x00; romData[0x1007] = 0x7C; // Blue

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "palette",
			Type = AssetType.Palette,
			Source = new AssetSource {
				Offset = "0x1000"
			},
			Options = new Dictionary<string, object?> {
				["extractType"] = "palette",
				["colors"] = 4
			}
		};
		var outputPath = Path.Combine(_tempDir, "palette.json");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var json = await File.ReadAllTextAsync(outputPath);
		Assert.Contains("#ffffff", json); // White
		Assert.Contains("colorCount", json);
	}

	[Fact]
	public async Task ExtractAsync_WithRawType_ExtractsRawBytes() {
		var romData = CreateMinimalGameBoyRom();
		// Add some test data
		for (int i = 0; i < 256; i++) {
			romData[0x1000 + i] = (byte)i;
		}

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "raw_data",
			Type = AssetType.Data,
			Source = new AssetSource {
				Offset = "0x1000",
				Length = "0x100"
			}
		};
		var outputPath = Path.Combine(_tempDir, "raw.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var extractedData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(256, extractedData.Length);
		for (int i = 0; i < 256; i++) {
			Assert.Equal((byte)i, extractedData[i]);
		}
	}

	[Fact]
	public async Task ExtractAsync_WithInvalidBank_ReturnsError() {
		var romData = CreateMinimalGameBoyRom();

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "bank99",
			Type = AssetType.Data,
			Source = new AssetSource(),
			Options = new Dictionary<string, object?> {
				["extractType"] = "bank",
				["bank"] = 99
			}
		};
		var outputPath = Path.Combine(_tempDir, "bank99.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.False(result.Success);
		Assert.Contains("out of range", result.Error);
	}

	[Fact]
	public async Task ExtractAsync_IncludesRomMetadata() {
		var romData = CreateMinimalGameBoyRom();

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "data",
			Type = AssetType.Data,
			Source = new AssetSource {
				Offset = "0x100",
				Length = "0x10"
			}
		};
		var outputPath = Path.Combine(_tempDir, "data.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal("TESTGAME", result.Metadata["title"]);
		Assert.Equal(2, result.Metadata["romBankCount"]);
	}

	[Fact]
	public async Task ExtractAsync_WithVramType_ExtractsVramTiles() {
		var romData = CreateMinimalGameBoyRom();
		// Add some tile data at offset $200
		for (int i = 0; i < 0x800; i++) {
			romData[0x200 + i] = (byte)(i & 0xff);
		}

		var extractor = new GameBoyAssetExtractor();
		var asset = new AssetDefinition {
			Name = "vram_tiles",
			Type = AssetType.Graphics,
			Source = new AssetSource {
				Offset = "0x200"
			},
			Options = new Dictionary<string, object?> {
				["extractType"] = "vram",
				["blocks"] = 1
			}
		};
		var outputPath = Path.Combine(_tempDir, "vram.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var extractedData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(0x800, extractedData.Length); // 1 block = 2KB
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			try {
				Directory.Delete(_tempDir, true);
			} catch {
				// Ignore cleanup errors
			}
		}
	}
}
