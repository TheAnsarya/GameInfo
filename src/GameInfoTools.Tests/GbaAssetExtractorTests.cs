using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for GbaAssetExtractor functionality.
/// </summary>
public class GbaAssetExtractorTests : IDisposable {
	private readonly string _tempDir;

	public GbaAssetExtractorTests() {
		_tempDir = Path.Combine(Path.GetTempPath(), "GbaAssetExtractorTests_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(_tempDir);
	}

	/// <summary>
	/// Creates a minimal valid GBA ROM for testing.
	/// </summary>
	private static byte[] CreateMinimalGbaRom() {
		var romData = new byte[0x200];

		// Entry point (ARM branch)
		romData[0x00] = 0x3E;
		romData[0x01] = 0x00;
		romData[0x02] = 0x00;
		romData[0x03] = 0xEA;

		// Nintendo logo
		var nintendoLogo = new byte[] {
			0x24, 0xff, 0xae, 0x51, 0x69, 0x9a, 0xa2, 0x21,
			0x3d, 0x84, 0x82, 0x0a, 0x84, 0xe4, 0x09, 0xad,
			0x11, 0x24, 0x8b, 0x98, 0xc0, 0x81, 0x7f, 0x21,
			0xa3, 0x52, 0xbe, 0x19, 0x93, 0x09, 0xce, 0x20,
			0x10, 0x46, 0x4a, 0x4a, 0xf8, 0x27, 0x31, 0xec,
			0x58, 0xc7, 0xe8, 0x33, 0x82, 0xe3, 0xce, 0xbf,
			0x85, 0xf4, 0xdf, 0x94, 0xce, 0x4b, 0x09, 0xc1,
			0x94, 0x56, 0x8a, 0xc0, 0x13, 0x72, 0xa7, 0xfc,
			0x9f, 0x84, 0x4d, 0x73, 0xa3, 0xca, 0x9a, 0x61,
			0x58, 0x97, 0xa3, 0x27, 0xfc, 0x03, 0x98, 0x76,
			0x23, 0x1d, 0xc7, 0x61, 0x03, 0x04, 0xae, 0x56,
			0xbf, 0x38, 0x84, 0x00, 0x40, 0xa7, 0x0e, 0xfd,
			0xff, 0x52, 0xfe, 0x03, 0x6f, 0x95, 0x30, 0xf1,
			0x97, 0xfb, 0xc0, 0x85, 0x60, 0xd6, 0x80, 0x25,
			0xa9, 0x63, 0xbe, 0x03, 0x01, 0x4e, 0x38, 0xe2,
			0xf9, 0xa2, 0x34, 0xff, 0xbb, 0x3e, 0x03, 0x44,
			0x78, 0x00, 0x90, 0xcb, 0x88, 0x11, 0x3a, 0x94,
			0x65, 0xc0, 0x7c, 0x63, 0x87, 0xf0, 0x3c, 0xaf,
			0xd6, 0x25, 0xe4, 0x8b, 0x38, 0x0a, 0xac, 0x72,
			0x21, 0xd4, 0xf8, 0x07
		};
		Array.Copy(nintendoLogo, 0, romData, 0x04, nintendoLogo.Length);

		// Title
		var title = System.Text.Encoding.ASCII.GetBytes("TESTGAME");
		Array.Copy(title, 0, romData, 0xA0, title.Length);

		// Game code
		var gameCode = System.Text.Encoding.ASCII.GetBytes("TEST");
		Array.Copy(gameCode, 0, romData, 0xAC, gameCode.Length);

		// Maker code
		romData[0xB0] = (byte)'0';
		romData[0xB1] = (byte)'1';

		// Fixed value
		romData[0xB2] = 0x96;

		// Calculate header checksum
		int sum = 0;
		for (int i = 0xA0; i <= 0xBC; i++) {
			sum += romData[i];
		}

		romData[0xBD] = (byte)-(sum + 0x19);

		return romData;
	}

	[Fact]
	public async Task ExtractAsync_WithHeaderType_ExtractsHeaderAsJson() {
		var romData = CreateMinimalGbaRom();

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "header",
			Type = AssetType.Data,
			Source = new AssetSource(),
			Options = new Dictionary<string, object> {
				["extractType"] = "header"
			}
		};
		var outputPath = Path.Combine(_tempDir, "header.json");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var json = await File.ReadAllTextAsync(outputPath);
		Assert.Contains("TESTGAME", json);
		Assert.Contains("gameCode", json);
	}

	[Fact]
	public async Task ExtractAsync_WithPaletteType_ExtractsGbaPalette() {
		var romData = CreateMinimalGbaRom();
		// Add a GBA palette at a known offset (15-bit RGB)
		// White: R=31, G=31, B=31 = 0x7FFF
		romData[0x100] = 0xFF; romData[0x101] = 0x7F;
		// Red: R=31, G=0, B=0 = 0x001F
		romData[0x102] = 0x1F; romData[0x103] = 0x00;

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "palette",
			Type = AssetType.Palette,
			Source = new AssetSource {
				Offset = "0x100"
			},
			Options = new Dictionary<string, object> {
				["extractType"] = "palette",
				["colors"] = 2
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
		var romData = CreateMinimalGbaRom();
		// Add some test data
		for (int i = 0; i < 64; i++) {
			romData[0x100 + i] = (byte)i;
		}

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "raw_data",
			Type = AssetType.Data,
			Source = new AssetSource {
				Offset = "0x100",
				Length = "0x40"
			}
		};
		var outputPath = Path.Combine(_tempDir, "raw.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.True(File.Exists(outputPath));
		var extractedData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(64, extractedData.Length);
		for (int i = 0; i < 64; i++) {
			Assert.Equal((byte)i, extractedData[i]);
		}
	}

	[Fact]
	public async Task ExtractAsync_WithRegionType_ExtractsRegion() {
		var romData = CreateMinimalGbaRom();
		romData[0x150] = 0xDE;
		romData[0x151] = 0xAD;
		romData[0x152] = 0xBE;
		romData[0x153] = 0xEF;

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "test_region",
			Type = AssetType.Data,
			Source = new AssetSource {
				Offset = "0x150",
				Length = "0x4"
			},
			Options = new Dictionary<string, object> {
				["extractType"] = "region"
			}
		};
		var outputPath = Path.Combine(_tempDir, "region.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		var data = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(4, data.Length);
		Assert.Equal(0xDE, data[0]);
		Assert.Equal(0xAD, data[1]);
		Assert.Equal(0xBE, data[2]);
		Assert.Equal(0xEF, data[3]);
	}

	[Fact]
	public async Task ExtractAsync_IncludesRomMetadata() {
		var romData = CreateMinimalGbaRom();

		var extractor = new GbaAssetExtractor();
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
		Assert.Equal("TEST", result.Metadata["gameCode"]);
	}

	[Fact]
	public async Task ExtractAsync_WithTilemapType_ExtractsTilemap() {
		var romData = CreateMinimalGbaRom();
		// Add tilemap data
		for (int i = 0; i < 32; i++) {
			romData[0x100 + (i * 2)] = (byte)i;
			romData[0x100 + (i * 2) + 1] = 0x00;
		}

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "tilemap",
			Type = AssetType.Tilemap,
			Source = new AssetSource {
				Offset = "0x100",
				Length = "0x40"
			},
			Options = new Dictionary<string, object> {
				["extractType"] = "tilemap"
			}
		};
		var outputPath = Path.Combine(_tempDir, "tilemap.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Equal(32, result.Metadata["entries"]);
	}

	[Fact]
	public async Task ExtractAsync_WithSpriteType_ExtractsSpriteData() {
		var romData = CreateMinimalGbaRom();

		var extractor = new GbaAssetExtractor();
		var asset = new AssetDefinition {
			Name = "sprites",
			Type = AssetType.Graphics,
			Source = new AssetSource {
				Offset = "0x100",
				Length = "0x40"
			},
			Options = new Dictionary<string, object> {
				["extractType"] = "sprite"
			}
		};
		var outputPath = Path.Combine(_tempDir, "sprites.bin");

		var result = await extractor.ExtractAsync(romData, asset, outputPath, new AssetsConfig());

		Assert.True(result.Success);
		Assert.Contains("sprite data", result.Metadata["format"].ToString()!);
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
