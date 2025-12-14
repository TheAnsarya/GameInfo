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
