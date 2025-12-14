using GameInfoTools.Core.Build;
using System.Text.Json;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for BuildConfig and related types
/// </summary>
public class BuildConfigTests
{
	[Fact]
	public void BuildConfig_DefaultValues_AreCorrect()
	{
		var config = new BuildConfig();

		Assert.NotNull(config.Project);
		Assert.NotNull(config.Source);
		Assert.NotNull(config.Assets);
		Assert.NotNull(config.Build);
		Assert.Null(config.Extraction);
	}

	[Fact]
	public void ProjectConfig_DefaultValues_AreCorrect()
	{
		var project = new ProjectConfig();

		Assert.Equal("", project.Name);
		Assert.Equal(Platform.Unknown, project.Platform);
		Assert.Null(project.Version);
		Assert.Null(project.Description);
		Assert.Null(project.Authors);
	}

	[Fact]
	public void SourceConfig_DefaultValues_AreCorrect()
	{
		var source = new SourceConfig();

		Assert.Null(source.BaseRom);
		Assert.Equal(Assembler.Unknown, source.Assembler);
		Assert.Equal("", source.MainFile);
		Assert.Equal("", source.OutputRom);
		Assert.Null(source.Includes);
		Assert.Null(source.Defines);
		Assert.Null(source.LinkerConfig);
	}

	[Fact]
	public void AssetsConfig_DefaultValues_AreCorrect()
	{
		var assets = new AssetsConfig();

		Assert.Null(assets.ExtractDir);
		Assert.Null(assets.EditableDir);
		Assert.Null(assets.BuildDir);
		Assert.Null(assets.Graphics);
		Assert.Null(assets.Palettes);
		Assert.Null(assets.Text);
	}

	[Fact]
	public void GraphicsConfig_DefaultValues_AreCorrect()
	{
		var graphics = new GraphicsConfig();

		Assert.Equal("png", graphics.Format);
		Assert.Equal([8, 8], graphics.TileSize);
		Assert.Equal(4, graphics.DefaultBpp);
		Assert.Null(graphics.Palette);
	}

	[Fact]
	public void PalettesConfig_DefaultValues_AreCorrect()
	{
		var palettes = new PalettesConfig();

		Assert.Equal("json", palettes.Format);
		Assert.Equal(ColorFormat.Rgb24, palettes.ColorFormat);
	}

	[Fact]
	public void BuildOptions_DefaultValues_AreCorrect()
	{
		var build = new BuildOptions();

		Assert.Null(build.PreBuild);
		Assert.Null(build.PostBuild);
		Assert.Null(build.Clean);
		Assert.True(build.Verify);
		Assert.True(build.ChecksumFix);
	}

	[Fact]
	public void CompressionConfig_DefaultValues_AreCorrect()
	{
		var compression = new CompressionConfig();

		Assert.Equal(CompressionAlgorithm.None, compression.Algorithm);
		Assert.Null(compression.CustomScript);
	}

	[Fact]
	public void AssetSource_GetOffset_ParsesHexWithPrefix()
	{
		var source = new AssetSource { Offset = "0x10000" };
		Assert.Equal(0x10000, source.GetOffset());
	}

	[Fact]
	public void AssetSource_GetOffset_ParsesHexWithDollarSign()
	{
		var source = new AssetSource { Offset = "$8000" };
		Assert.Equal(0x8000, source.GetOffset());
	}

	[Fact]
	public void AssetSource_GetOffset_ParsesDecimal()
	{
		var source = new AssetSource { Offset = "1024" };
		Assert.Equal(1024, source.GetOffset());
	}

	[Fact]
	public void AssetSource_GetLength_ReturnsNullWhenNotSet()
	{
		var source = new AssetSource();
		Assert.Null(source.GetLength());
	}

	[Fact]
	public void AssetSource_GetLength_ParsesValue()
	{
		var source = new AssetSource { Length = "0x2000" };
		Assert.Equal(0x2000, source.GetLength());
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsErrors_WhenNameMissing()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Platform = Platform.Nes },
			Source = new SourceConfig
			{
				MainFile = "main.asm",
				OutputRom = "game.nes",
				Assembler = Assembler.Ca65
			}
		};

		var errors = config.Validate().ToList();
		Assert.Contains(errors, e => e.Contains("name", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsErrors_WhenPlatformUnknown()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "Test", Platform = Platform.Unknown },
			Source = new SourceConfig
			{
				MainFile = "main.asm",
				OutputRom = "game.nes",
				Assembler = Assembler.Ca65
			}
		};

		var errors = config.Validate().ToList();
		Assert.Contains(errors, e => e.Contains("platform", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsErrors_WhenAssemblerUnknown()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "Test", Platform = Platform.Nes },
			Source = new SourceConfig
			{
				MainFile = "main.asm",
				OutputRom = "game.nes",
				Assembler = Assembler.Unknown
			}
		};

		var errors = config.Validate().ToList();
		Assert.Contains(errors, e => e.Contains("assembler", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsErrors_WhenMainFileMissing()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "Test", Platform = Platform.Nes },
			Source = new SourceConfig
			{
				OutputRom = "game.nes",
				Assembler = Assembler.Ca65
			}
		};

		var errors = config.Validate().ToList();
		Assert.Contains(errors, e => e.Contains("main file", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsErrors_WhenOutputRomMissing()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "Test", Platform = Platform.Nes },
			Source = new SourceConfig
			{
				MainFile = "main.asm",
				Assembler = Assembler.Ca65
			}
		};

		var errors = config.Validate().ToList();
		Assert.Contains(errors, e => e.Contains("output", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void BuildConfig_Validate_ReturnsNoErrors_WhenValid()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "Test", Platform = Platform.Nes },
			Source = new SourceConfig
			{
				MainFile = "main.asm",
				OutputRom = "game.nes",
				Assembler = Assembler.Ca65
			}
		};

		var errors = config.Validate().ToList();
		Assert.Empty(errors);
	}

	[Fact]
	public void BuildConfig_Serialization_RoundTrips()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig
			{
				Name = "Test Project",
				Platform = Platform.Snes,
				Version = "1.0.0",
				Description = "A test project",
				Authors = ["Author1", "Author2"]
			},
			Source = new SourceConfig
			{
				BaseRom = "roms/original.sfc",
				Assembler = Assembler.Asar,
				MainFile = "src/main.asm",
				Includes = ["src/", "include/"],
				Defines = new Dictionary<string, string> { ["DEBUG"] = "1" },
				OutputRom = "build/game.sfc"
			},
			Assets = new AssetsConfig
			{
				ExtractDir = "assets/binary",
				EditableDir = "assets/json",
				BuildDir = "build/assets",
				Graphics = new GraphicsConfig
				{
					Format = "png",
					TileSize = [8, 8],
					DefaultBpp = 4
				},
				Palettes = new PalettesConfig
				{
					Format = "json",
					ColorFormat = ColorFormat.Bgr15
				}
			},
			Build = new BuildOptions
			{
				PreBuild = ["echo Pre-build"],
				PostBuild = ["echo Post-build"],
				Verify = true,
				ChecksumFix = true
			}
		};

		var json = JsonSerializer.Serialize(config, new JsonSerializerOptions
		{
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
			WriteIndented = true
		});

		Assert.Contains("Test Project", json);
		Assert.Contains("snes", json, StringComparison.OrdinalIgnoreCase);
		Assert.Contains("asar", json, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void AssetDefinition_DefaultValues_AreCorrect()
	{
		var asset = new AssetDefinition();

		Assert.Equal("", asset.Name);
		Assert.Equal(AssetType.Data, asset.Type);
		Assert.NotNull(asset.Source);
		Assert.Equal("", asset.Output);
		Assert.Null(asset.Options);
	}

	[Fact]
	public void ExtractionConfig_DefaultValues_AreCorrect()
	{
		var extraction = new ExtractionConfig();

		Assert.NotNull(extraction.Assets);
		Assert.Empty(extraction.Assets);
	}

	[Theory]
	[InlineData(Platform.Nes)]
	[InlineData(Platform.Snes)]
	[InlineData(Platform.Genesis)]
	[InlineData(Platform.Gb)]
	[InlineData(Platform.Gbc)]
	[InlineData(Platform.Gba)]
	public void Platform_AllValues_AreValid(Platform platform)
	{
		Assert.NotEqual(Platform.Unknown, platform);
	}

	[Theory]
	[InlineData(Assembler.Ca65)]
	[InlineData(Assembler.Asar)]
	[InlineData(Assembler.Asm68k)]
	[InlineData(Assembler.Rgbds)]
	[InlineData(Assembler.DevkitArm)]
	public void Assembler_AllValues_AreValid(Assembler assembler)
	{
		Assert.NotEqual(Assembler.Unknown, assembler);
	}

	[Theory]
	[InlineData(AssetType.Graphics)]
	[InlineData(AssetType.Palette)]
	[InlineData(AssetType.Tilemap)]
	[InlineData(AssetType.Data)]
	[InlineData(AssetType.Text)]
	[InlineData(AssetType.Audio)]
	public void AssetType_AllValues_AreValid(AssetType assetType)
	{
		// All values should be valid
		Assert.True(Enum.IsDefined(assetType));
	}

	[Theory]
	[InlineData(ColorFormat.Rgb24)]
	[InlineData(ColorFormat.Bgr15)]
	[InlineData(ColorFormat.Bgr9)]
	[InlineData(ColorFormat.Indexed)]
	public void ColorFormat_AllValues_AreValid(ColorFormat colorFormat)
	{
		Assert.True(Enum.IsDefined(colorFormat));
	}

	[Theory]
	[InlineData(CompressionAlgorithm.None)]
	[InlineData(CompressionAlgorithm.Lzss)]
	[InlineData(CompressionAlgorithm.Rle)]
	[InlineData(CompressionAlgorithm.Huffman)]
	[InlineData(CompressionAlgorithm.Custom)]
	public void CompressionAlgorithm_AllValues_AreValid(CompressionAlgorithm algorithm)
	{
		Assert.True(Enum.IsDefined(algorithm));
	}
}

/// <summary>
/// Tests for BuildPipelineService
/// </summary>
public class BuildPipelineServiceTests : IDisposable
{
	private readonly string _testDir;

	public BuildPipelineServiceTests()
	{
		_testDir = Path.Combine(Path.GetTempPath(), $"BuildPipelineTests_{Guid.NewGuid()}");
		Directory.CreateDirectory(_testDir);
	}

	[Fact]
	public async Task BuildAsync_ReturnsErrors_WhenConfigInvalid()
	{
		var config = new BuildConfig
		{
			Project = new ProjectConfig { Name = "", Platform = Platform.Unknown }
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());
		var result = await service.BuildAsync();

		Assert.False(result.Success);
		Assert.NotEmpty(result.Errors);
	}

	[Fact]
	public async Task CleanAsync_DoesNotThrow_WhenDirectoryNotExists()
	{
		var config = new BuildConfig
		{
			Build = new BuildOptions { Clean = ["nonexistent/**/*"] }
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());

		// Should not throw
		await service.CleanAsync();
	}

	[Fact]
	public async Task ExtractAssetsAsync_ReturnsError_WhenNoBaseRom()
	{
		var config = new BuildConfig
		{
			Source = new SourceConfig { BaseRom = null }
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());
		var result = await service.ExtractAssetsAsync();

		Assert.Contains(result.Errors, e => e.Contains("No base ROM"));
	}

	[Fact]
	public async Task ExtractAssetsAsync_ReturnsError_WhenRomNotFound()
	{
		var config = new BuildConfig
		{
			Source = new SourceConfig { BaseRom = "nonexistent.nes" }
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());
		var result = await service.ExtractAssetsAsync();

		Assert.Contains(result.Errors, e => e.Contains("not found"));
	}

	[Fact]
	public async Task ExtractAssetsAsync_ExtractsData_WhenRomExists()
	{
		// Create a test ROM file
		var romPath = Path.Combine(_testDir, "test.nes");
		var romData = new byte[0x10000];
		new Random(42).NextBytes(romData);
		await File.WriteAllBytesAsync(romPath, romData);

		var outputDir = Path.Combine(_testDir, "assets");
		Directory.CreateDirectory(outputDir);

		var config = new BuildConfig
		{
			Source = new SourceConfig { BaseRom = "test.nes" },
			Extraction = new ExtractionConfig
			{
				Assets =
				[
					new AssetDefinition
					{
						Name = "test_data",
						Type = AssetType.Data,
						Source = new AssetSource { Offset = "0x1000", Length = "0x100" },
						Output = "assets/test.bin"
					}
				]
			}
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());
		var result = await service.ExtractAssetsAsync();

		Assert.Empty(result.Errors);
		Assert.Contains("test_data", result.ExtractedAssets);

		var extractedPath = Path.Combine(_testDir, "assets", "test.bin");
		Assert.True(File.Exists(extractedPath));

		var extractedData = await File.ReadAllBytesAsync(extractedPath);
		Assert.Equal(0x100, extractedData.Length);
	}

	[Fact]
	public async Task ExtractAssetsAsync_HandlesInvalidOffset()
	{
		var romPath = Path.Combine(_testDir, "test.nes");
		await File.WriteAllBytesAsync(romPath, new byte[0x1000]);

		var config = new BuildConfig
		{
			Source = new SourceConfig { BaseRom = "test.nes" },
			Extraction = new ExtractionConfig
			{
				Assets =
				[
					new AssetDefinition
					{
						Name = "invalid_offset",
						Type = AssetType.Data,
						Source = new AssetSource { Offset = "0x10000" },
						Output = "assets/test.bin"
					}
				]
			}
		};

		var service = new BuildPipelineService(_testDir, config, new TestBuildLogger());
		var result = await service.ExtractAssetsAsync();

		Assert.Contains(result.Errors, e => e.Contains("Invalid offset"));
	}

	[Fact]
	public void BuildResult_DefaultValues_AreCorrect()
	{
		var result = new BuildResult();

		Assert.False(result.Success);
		Assert.Null(result.OutputPath);
		Assert.NotNull(result.Errors);
		Assert.NotNull(result.Warnings);
		Assert.Empty(result.Errors);
		Assert.Empty(result.Warnings);
	}

	[Fact]
	public void ExtractionResult_DefaultValues_AreCorrect()
	{
		var result = new ExtractionResult();

		Assert.NotNull(result.ExtractedAssets);
		Assert.NotNull(result.Errors);
		Assert.Empty(result.ExtractedAssets);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void VerificationResult_DefaultValues_AreCorrect()
	{
		var result = new VerificationResult();

		Assert.False(result.Success);
		Assert.NotNull(result.Warnings);
		Assert.Empty(result.Warnings);
	}

	[Fact]
	public void ConsoleBuildLogger_DoesNotThrow()
	{
		var logger = new ConsoleBuildLogger();

		// Should not throw
		logger.Debug("Debug message");
		logger.Info("Info message");
		logger.Warning("Warning message");
		logger.Error("Error message");
	}

	#region Asset Extractor Tests

	[Theory]
	[InlineData(AssetType.Graphics, Platform.Nes)]
	[InlineData(AssetType.Graphics, Platform.Snes)]
	[InlineData(AssetType.Graphics, Platform.Genesis)]
	[InlineData(AssetType.Graphics, Platform.Gb)]
	[InlineData(AssetType.Graphics, Platform.Gba)]
	[InlineData(AssetType.Palette, Platform.Nes)]
	[InlineData(AssetType.Palette, Platform.Snes)]
	[InlineData(AssetType.Tilemap, Platform.Snes)]
	[InlineData(AssetType.Text, Platform.Nes)]
	[InlineData(AssetType.Data, Platform.Nes)]
	[InlineData(AssetType.Audio, Platform.Snes)]
	public void AssetExtractorFactory_ReturnsCorrectExtractor(AssetType type, Platform platform)
	{
		var extractor = AssetExtractorFactory.GetExtractor(type, platform);

		Assert.NotNull(extractor);

		var expectedType = type switch
		{
			AssetType.Graphics => typeof(GraphicsExtractor),
			AssetType.Palette => typeof(PaletteExtractor),
			AssetType.Tilemap => typeof(TilemapExtractor),
			AssetType.Text => typeof(TextExtractor),
			AssetType.Data => typeof(DataExtractor),
			AssetType.Audio => typeof(AudioExtractor),
			_ => typeof(DataExtractor)
		};

		Assert.IsType(expectedType, extractor);
	}

	[Fact]
	public async Task GraphicsExtractor_ExtractsNesTiles_ToJson()
	{
		// Create NES-style 2bpp tile data (16 bytes per tile)
		// Simple checkerboard pattern
		var tileData = new byte[32]; // 2 tiles
		// Tile 0: all zeros
		// Tile 1: simple pattern
		for (int i = 0; i < 8; i++)
		{
			tileData[16 + i] = (byte)(0xaa >> (i % 2)); // Bit plane 0
			tileData[24 + i] = (byte)(0x55 >> (i % 2)); // Bit plane 1
		}

		var romData = new byte[256];
		Array.Copy(tileData, 0, romData, 0x10, tileData.Length);

		var asset = new AssetDefinition
		{
			Name = "test_tiles",
			Type = AssetType.Graphics,
			Source = new AssetSource { Offset = "0x10", Length = "0x20" },
			Output = "tiles.bin"
		};

		var assetsConfig = new AssetsConfig
		{
			Graphics = new GraphicsConfig { Format = "json" }
		};

		var outputPath = Path.Combine(_testDir, "tiles.bin");
		var extractor = new GraphicsExtractor(Platform.Nes);

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));
		Assert.Equal(32, result.BytesExtracted);
		Assert.Equal(2, result.Metadata["tileCount"]);
	}

	[Fact]
	public async Task GraphicsExtractor_ExtractsTiles_ToPng()
	{
		// Create simple tile data
		var tileData = new byte[16]; // 1 NES tile
		var romData = new byte[256];
		Array.Copy(tileData, 0, romData, 0x00, tileData.Length);

		var asset = new AssetDefinition
		{
			Name = "test_tiles",
			Type = AssetType.Graphics,
			Source = new AssetSource { Offset = "0x0", Length = "0x10" },
			Output = "tiles.bin"
		};

		var assetsConfig = new AssetsConfig
		{
			Graphics = new GraphicsConfig { Format = "png" }
		};

		var outputPath = Path.Combine(_testDir, "tiles.bin");
		var extractor = new GraphicsExtractor(Platform.Nes);

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.EndsWith(".png", result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		// Verify PNG signature
		var pngData = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(0x89, pngData[0]);
		Assert.Equal((byte)'P', pngData[1]);
		Assert.Equal((byte)'N', pngData[2]);
		Assert.Equal((byte)'G', pngData[3]);
	}

	[Fact]
	public async Task PaletteExtractor_ExtractsSnesPalette_ToJson()
	{
		// Create SNES palette data (2 bytes per color, BGR15)
		var paletteData = new byte[32]; // 16 colors
		// Set first color to red (0x001F in BGR15)
		paletteData[0] = 0x1f;
		paletteData[1] = 0x00;
		// Set second color to green
		paletteData[2] = 0xe0;
		paletteData[3] = 0x03;

		var romData = new byte[256];
		Array.Copy(paletteData, 0, romData, 0x20, paletteData.Length);

		var asset = new AssetDefinition
		{
			Name = "test_palette",
			Type = AssetType.Palette,
			Source = new AssetSource { Offset = "0x20", Length = "0x20" },
			Output = "palette.bin"
		};

		var assetsConfig = new AssetsConfig
		{
			Palettes = new PalettesConfig { Format = "json" }
		};

		var outputPath = Path.Combine(_testDir, "palette.bin");
		var extractor = new PaletteExtractor(Platform.Snes);

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.EndsWith(".json", result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		// Verify JSON content
		var json = await File.ReadAllTextAsync(result.OutputPath);
		Assert.Contains("\"colorCount\"", json);
		Assert.Contains("\"colors\"", json);
	}

	[Fact]
	public async Task PaletteExtractor_ExtractsPalette_ToPal()
	{
		var paletteData = new byte[8]; // 4 SNES colors
		var romData = new byte[256];
		Array.Copy(paletteData, 0, romData, 0x00, paletteData.Length);

		var asset = new AssetDefinition
		{
			Name = "test_palette",
			Type = AssetType.Palette,
			Source = new AssetSource { Offset = "0x0", Length = "0x8" },
			Output = "palette.bin"
		};

		var assetsConfig = new AssetsConfig
		{
			Palettes = new PalettesConfig { Format = "pal" }
		};

		var outputPath = Path.Combine(_testDir, "palette.bin");
		var extractor = new PaletteExtractor(Platform.Snes);

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.EndsWith(".pal", result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		// Verify JASC-PAL format
		var lines = await File.ReadAllLinesAsync(result.OutputPath);
		Assert.Equal("JASC-PAL", lines[0]);
		Assert.Equal("0100", lines[1]);
	}

	[Fact]
	public async Task TilemapExtractor_ExtractsSnesTilemap_ToJson()
	{
		// Create SNES tilemap data (2 bytes per entry)
		var tilemapData = new byte[128]; // 32x2 tilemap
		// Set some entries
		tilemapData[0] = 0x01; tilemapData[1] = 0x00; // Tile 1
		tilemapData[2] = 0x02; tilemapData[3] = 0x04; // Tile 2, palette 1
		tilemapData[4] = 0x03; tilemapData[5] = 0x40; // Tile 3, flip H

		var romData = new byte[256];
		Array.Copy(tilemapData, 0, romData, 0x00, tilemapData.Length);

		var asset = new AssetDefinition
		{
			Name = "test_tilemap",
			Type = AssetType.Tilemap,
			Source = new AssetSource { Offset = "0x0", Length = "0x80" },
			Output = "tilemap.bin",
			Options = new Dictionary<string, object> { { "width", 32 }, { "height", 2 } }
		};

		var assetsConfig = new AssetsConfig();

		var outputPath = Path.Combine(_testDir, "tilemap.bin");
		var extractor = new TilemapExtractor(Platform.Snes);

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.EndsWith(".json", result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		// Verify JSON content
		var json = await File.ReadAllTextAsync(result.OutputPath);
		Assert.Contains("\"width\"", json);
		Assert.Contains("\"height\"", json);
		Assert.Contains("\"entries\"", json);
	}

	[Fact]
	public async Task DataExtractor_ExtractsRawData_ToJson()
	{
		var romData = new byte[256];
		for (int i = 0; i < 32; i++)
			romData[i] = (byte)i;

		var asset = new AssetDefinition
		{
			Name = "test_data",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0x0", Length = "0x20" },
			Output = "data.json",
			Options = new Dictionary<string, object> { { "format", "json" } }
		};

		var assetsConfig = new AssetsConfig();

		var outputPath = Path.Combine(_testDir, "data.json");
		var extractor = new DataExtractor();

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		// Verify JSON content
		var json = await File.ReadAllTextAsync(result.OutputPath);
		Assert.Contains("\"offset\"", json);
		Assert.Contains("\"length\"", json);
		Assert.Contains("\"data\"", json);
	}

	[Fact]
	public async Task DataExtractor_ExtractsRawData_ToBinary()
	{
		var romData = new byte[256];
		for (int i = 0; i < 32; i++)
			romData[i] = (byte)(i * 2);

		var asset = new AssetDefinition
		{
			Name = "test_data",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0x0", Length = "0x20" },
			Output = "data.bin"
		};

		var assetsConfig = new AssetsConfig();

		var outputPath = Path.Combine(_testDir, "data.bin");
		var extractor = new DataExtractor();

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var extracted = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(32, extracted.Length);
		Assert.Equal(0, extracted[0]);
		Assert.Equal(2, extracted[1]);
	}

	[Fact]
	public async Task Extractor_ReturnsError_WhenOffsetInvalid()
	{
		var romData = new byte[256];

		var asset = new AssetDefinition
		{
			Name = "test",
			Type = AssetType.Data,
			Source = new AssetSource { Offset = "0x1000" }, // Beyond ROM
			Output = "test.bin"
		};

		var assetsConfig = new AssetsConfig();
		var outputPath = Path.Combine(_testDir, "test.bin");
		var extractor = new DataExtractor();

		var result = await extractor.ExtractAsync(romData, asset, outputPath, assetsConfig);

		Assert.False(result.Success);
		Assert.NotNull(result.Error);
		Assert.Contains("Invalid offset", result.Error);
	}

	#endregion

	#region Asset Converter Tests

	[Theory]
	[InlineData(".png", typeof(PngToTilesConverter))]
	[InlineData(".json", typeof(JsonToAssetConverter))]
	[InlineData(".pal", typeof(PalToAssetConverter))]
	[InlineData(".bin", typeof(RawAssetConverter))]
	[InlineData(".dat", typeof(RawAssetConverter))]
	public void AssetConverterFactory_ReturnsCorrectConverter(string extension, Type expectedType)
	{
		var inputPath = $"test{extension}";
		var converter = AssetConverterFactory.GetConverter(inputPath);

		Assert.NotNull(converter);
		Assert.IsType(expectedType, converter);
	}

	[Fact]
	public async Task JsonToAssetConverter_ConvertsPalette_ToBinary()
	{
		var paletteJson = """
		{
			"colorCount": 4,
			"colors": [
				{ "r": 0, "g": 0, "b": 0, "hex": "#000000" },
				{ "r": 248, "g": 0, "b": 0, "hex": "#f80000" },
				{ "r": 0, "g": 248, "b": 0, "hex": "#00f800" },
				{ "r": 0, "g": 0, "b": 248, "hex": "#0000f8" }
			]
		}
		""";

		var inputPath = Path.Combine(_testDir, "palette.json");
		var outputPath = Path.Combine(_testDir, "palette.bin");

		await File.WriteAllTextAsync(inputPath, paletteJson);

		var converter = new JsonToAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Snes);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var binary = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(8, binary.Length); // 4 colors * 2 bytes
	}

	[Fact]
	public async Task JsonToAssetConverter_ConvertsTilemap_ToBinary()
	{
		var tilemapJson = """
		{
			"width": 2,
			"height": 2,
			"platform": "Snes",
			"entries": [
				{ "tile": 1, "palette": 0, "flipH": false, "flipV": false },
				{ "tile": 2, "palette": 1, "flipH": true, "flipV": false },
				{ "tile": 3, "palette": 0, "flipH": false, "flipV": true },
				{ "tile": 4, "palette": 2, "flipH": true, "flipV": true }
			]
		}
		""";

		var inputPath = Path.Combine(_testDir, "tilemap.json");
		var outputPath = Path.Combine(_testDir, "tilemap.bin");

		await File.WriteAllTextAsync(inputPath, tilemapJson);

		var converter = new JsonToAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Snes);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var binary = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(8, binary.Length); // 4 entries * 2 bytes
	}

	[Fact]
	public async Task JsonToAssetConverter_ConvertsGraphics_ToBinary()
	{
		var graphicsJson = """
		{
			"tileCount": 1,
			"format": "Nes2Bpp",
			"tileSize": [8, 8],
			"tiles": [
				[
					[0, 1, 0, 1, 0, 1, 0, 1],
					[1, 0, 1, 0, 1, 0, 1, 0],
					[0, 1, 0, 1, 0, 1, 0, 1],
					[1, 0, 1, 0, 1, 0, 1, 0],
					[0, 1, 0, 1, 0, 1, 0, 1],
					[1, 0, 1, 0, 1, 0, 1, 0],
					[0, 1, 0, 1, 0, 1, 0, 1],
					[1, 0, 1, 0, 1, 0, 1, 0]
				]
			]
		}
		""";

		var inputPath = Path.Combine(_testDir, "tiles.json");
		var outputPath = Path.Combine(_testDir, "tiles.bin");

		await File.WriteAllTextAsync(inputPath, graphicsJson);

		var converter = new JsonToAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Nes);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var binary = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(16, binary.Length); // 1 NES tile = 16 bytes
	}

	[Fact]
	public async Task PalToAssetConverter_ConvertsPalFile_ToBinary()
	{
		var palContent = """
		JASC-PAL
		0100
		4
		0 0 0
		255 0 0
		0 255 0
		0 0 255
		""";

		var inputPath = Path.Combine(_testDir, "palette.pal");
		var outputPath = Path.Combine(_testDir, "palette.bin");

		await File.WriteAllTextAsync(inputPath, palContent);

		var converter = new PalToAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Snes);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var binary = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(8, binary.Length); // 4 colors * 2 bytes
	}

	[Fact]
	public async Task RawAssetConverter_CopiesFile()
	{
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var inputPath = Path.Combine(_testDir, "raw.bin");
		var outputPath = Path.Combine(_testDir, "output.bin");

		await File.WriteAllBytesAsync(inputPath, data);

		var converter = new RawAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Nes);

		Assert.True(result.Success);
		Assert.NotNull(result.OutputPath);
		Assert.True(File.Exists(result.OutputPath));

		var output = await File.ReadAllBytesAsync(result.OutputPath);
		Assert.Equal(data, output);
	}

	[Fact]
	public async Task Converter_ReturnsError_WhenFileNotFound()
	{
		var inputPath = Path.Combine(_testDir, "nonexistent.json");
		var outputPath = Path.Combine(_testDir, "output.bin");

		var converter = new JsonToAssetConverter();
		var result = await converter.ConvertAsync(inputPath, outputPath, Platform.Nes);

		Assert.False(result.Success);
		Assert.NotNull(result.Error);
		Assert.Contains("not found", result.Error);
	}

	#endregion

	#region AssetExtractionResult Tests

	[Fact]
	public void AssetExtractionResult_DefaultValues_AreCorrect()
	{
		var result = new AssetExtractionResult();

		Assert.False(result.Success);
		Assert.Null(result.OutputPath);
		Assert.Null(result.Error);
		Assert.Equal(0, result.BytesExtracted);
		Assert.NotNull(result.Metadata);
		Assert.Empty(result.Metadata);
	}

	[Fact]
	public void AssetConversionResult_DefaultValues_AreCorrect()
	{
		var result = new AssetConversionResult();

		Assert.False(result.Success);
		Assert.Null(result.OutputPath);
		Assert.Null(result.Error);
		Assert.Equal(0, result.BytesGenerated);
	}

	#endregion

	#region Compression Tests

	[Fact]
	public void CompressionUtils_RleRoundTrip_PreservesData()
	{
		// Create data with runs
		var original = new byte[100];
		for (int i = 0; i < 20; i++) original[i] = 0x00;      // Run of zeros
		for (int i = 20; i < 40; i++) original[i] = 0xff;     // Run of 0xff
		for (int i = 40; i < 60; i++) original[i] = (byte)i;  // Non-repeating
		for (int i = 60; i < 100; i++) original[i] = 0xaa;    // Run of 0xaa

		var compressed = CompressionUtils.Compress(original, CompressionAlgorithm.Rle);
		var decompressed = CompressionUtils.Decompress(compressed, CompressionAlgorithm.Rle);

		Assert.Equal(original, decompressed);
	}

	[Fact]
	public void CompressionUtils_RleCompression_ReducesSize()
	{
		// Data with lots of repetition should compress well
		var original = new byte[100];
		for (int i = 0; i < 100; i++) original[i] = 0xaa;

		var compressed = CompressionUtils.Compress(original, CompressionAlgorithm.Rle);

		Assert.True(compressed.Length < original.Length);
	}

	[Fact]
	public void CompressionUtils_LzssRoundTrip_PreservesData()
	{
		// Create data with repeating patterns
		var original = new byte[200];
		var pattern = new byte[] { 0x01, 0x02, 0x03, 0x04, 0x05 };
		for (int i = 0; i < original.Length; i++)
		{
			original[i] = pattern[i % pattern.Length];
		}

		var options = new CompressionOptions { HasHeader = true };
		var compressed = CompressionUtils.Compress(original, CompressionAlgorithm.Lzss, options);
		var decompressed = CompressionUtils.Decompress(compressed, CompressionAlgorithm.Lzss, options);

		Assert.Equal(original.Length, decompressed.Length);
	}

	[Fact]
	public void CompressionUtils_HuffmanCompress_ProducesValidOutput()
	{
		// Create data with varying byte frequencies
		var original = new byte[100];
		for (int i = 0; i < 50; i++) original[i] = 0x00;  // 50% zeros
		for (int i = 50; i < 75; i++) original[i] = 0x01; // 25% ones
		for (int i = 75; i < 88; i++) original[i] = 0x02; // 13% twos
		for (int i = 88; i < 100; i++) original[i] = (byte)(i - 88); // misc

		var compressed = CompressionUtils.Compress(original, CompressionAlgorithm.Huffman);

		// Verify Huffman header marker
		Assert.True(compressed.Length > 4);
		Assert.Equal(0x28, compressed[0]); // Huffman 8-bit marker

		// Verify size is encoded in header
		var encodedSize = compressed[1] | (compressed[2] << 8) | (compressed[3] << 16);
		Assert.Equal(100, encodedSize);
	}

	[Fact]
	public void CompressionUtils_None_ReturnsUnchangedData()
	{
		var original = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var compressed = CompressionUtils.Compress(original, CompressionAlgorithm.None);
		var decompressed = CompressionUtils.Decompress(compressed, CompressionAlgorithm.None);

		Assert.Equal(original, compressed);
		Assert.Equal(original, decompressed);
	}

	[Fact]
	public void CompressionUtils_DetectCompression_IdentifiesLzss()
	{
		var lzssData = new byte[] { 0x10, 0x64, 0x00, 0x00 }; // LZSS header with size 100

		var detected = CompressionUtils.DetectCompression(lzssData);

		Assert.Equal(CompressionAlgorithm.Lzss, detected);
	}

	[Fact]
	public void CompressionUtils_DetectCompression_IdentifiesRle()
	{
		var rleData = new byte[] { 0x30, 0x64, 0x00, 0x00 }; // RLE header with size 100

		var detected = CompressionUtils.DetectCompression(rleData);

		Assert.Equal(CompressionAlgorithm.Rle, detected);
	}

	[Fact]
	public void CompressionUtils_DetectCompression_IdentifiesHuffman()
	{
		var huffmanData = new byte[] { 0x20, 0x64, 0x00, 0x00 }; // Huffman header with size 100

		var detected = CompressionUtils.DetectCompression(huffmanData);

		Assert.Equal(CompressionAlgorithm.Huffman, detected);
	}

	[Fact]
	public void CompressionUtils_GetDecompressedSize_ReadsFromHeader()
	{
		var data = new byte[] { 0x10, 0x00, 0x01, 0x00 }; // LZSS header with size 256

		var size = CompressionUtils.GetDecompressedSize(data);

		Assert.Equal(256, size);
	}

	[Fact]
	public void CompressionUtils_DecompressDte_ExpandsDictionary()
	{
		var dictionary = new byte[][]
		{
			[0x61], // 'a'
			[0x62], // 'b'
			[0x74, 0x68], // 'th'
			[0x65, 0x72], // 'er'
		};

		// "the" using DTE: 0x02 (th) + 'e'
		var compressed = new byte[] { 0x02, 0x65 };

		var decompressed = CompressionUtils.DecompressDte(compressed, dictionary);

		Assert.Equal(new byte[] { 0x74, 0x68, 0x65 }, decompressed); // "the"
	}

	[Fact]
	public void CompressionOptions_DefaultValues_AreCorrect()
	{
		var options = new CompressionOptions();

		Assert.False(options.HasHeader);
		Assert.Equal(0, options.ExpectedSize);
		Assert.Equal(4096, options.LzssWindowSize);
		Assert.Equal(0, options.LzssWindowStart);
		Assert.Equal(3, options.LzssMinMatchLength);
		Assert.Equal(18, options.LzssMaxMatchLength);
		Assert.True(options.LzssFlagBitOrder);
		Assert.True(options.LzssOffsetBytesFirst);
		Assert.Equal(0x80, options.RleRunMask);
		Assert.Equal(3, options.RleMinRunLength);
		Assert.Equal(130, options.RleMaxRunLength);
		Assert.Equal(128, options.RleMaxLiteralLength);
	}

	#endregion

	public void Dispose()
	{
		try
		{
			if (Directory.Exists(_testDir))
				Directory.Delete(_testDir, recursive: true);
		}
		catch
		{
			// Ignore cleanup errors
		}
	}

	private class TestBuildLogger : IBuildLogger
	{
		public List<string> Messages { get; } = [];

		public void Debug(string message) => Messages.Add($"[DEBUG] {message}");
		public void Info(string message) => Messages.Add($"[INFO] {message}");
		public void Warning(string message) => Messages.Add($"[WARN] {message}");
		public void Error(string message) => Messages.Add($"[ERROR] {message}");
	}
}
