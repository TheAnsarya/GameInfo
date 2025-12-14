using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for NesAssetExtractor
/// </summary>
public class NesAssetExtractorTests {
	/// <summary>
	/// Creates a minimal valid iNES ROM for testing
	/// </summary>
	private static byte[] CreateTestRom(int prgBanks = 2, int chrBanks = 1, int mapper = 0) {
		var prgSize = prgBanks * 0x4000;
		var chrSize = chrBanks * 0x2000;
		var totalSize = 16 + prgSize + chrSize;

		var rom = new byte[totalSize];

		// iNES magic
		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;

		// PRG and CHR counts
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		// Flags 6: lower mapper nibble
		rom[6] = (byte)((mapper & 0x0f) << 4);

		// Flags 7: upper mapper nibble
		rom[7] = (byte)(mapper & 0xf0);

		// Fill PRG with pattern
		var prgStart = 16;
		for (int i = 0; i < prgSize; i++) {
			rom[prgStart + i] = (byte)(i & 0xff);
		}

		// Fill CHR with pattern
		var chrStart = prgStart + prgSize;
		for (int i = 0; i < chrSize; i++) {
			rom[chrStart + i] = (byte)((i + 0x80) & 0xff);
		}

		return rom;
	}

	private static AssetDefinition CreateAssetDefinition(
		string name = "test",
		AssetType type = AssetType.Data,
		int offset = 0,
		int? length = null,
		Dictionary<string, object>? options = null) {
		return new AssetDefinition {
			Name = name,
			Type = type,
			Source = new AssetSource {
				Offset = $"0x{offset:x}",
				Length = length.HasValue ? $"0x{length.Value:x}" : null
			},
			Output = name,
			Options = options ?? []
		};
	}

	private static AssetsConfig CreateAssetsConfig() {
		return new AssetsConfig {
			ExtractDir = "assets",
			Graphics = new GraphicsConfig { Format = "png" }
		};
	}

	[Fact]
	public async Task ExtractAsync_PrgBank_ExtractsCorrectData() {
		var rom = CreateTestRom(prgBanks: 4);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "prg",
			["bank"] = 0
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "prg_bank_0.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.NotNull(result.OutputPath);
			Assert.True(File.Exists(result.OutputPath));
			Assert.Equal(0x4000, result.BytesExtracted);
			Assert.Equal(0, result.Metadata["bankNumber"]);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_PrgBank_RequiresBankOption() {
		var rom = CreateTestRom();
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "prg"
			// Missing bank option
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "prg_bank.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.False(result.Success);
			Assert.Contains("bank", result.Error);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_ChrBank_ExtractsCorrectData() {
		var rom = CreateTestRom(chrBanks: 2);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "chr",
			["bank"] = 0
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "chr_bank_0.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.NotNull(result.OutputPath);
			Assert.True(File.Exists(result.OutputPath));
			Assert.Equal(0x2000, result.BytesExtracted);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_ChrBank_FailsForChrRam() {
		var rom = CreateTestRom(chrBanks: 0); // CHR-RAM
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "chr",
			["bank"] = 0
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "chr_bank.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.False(result.Success);
			Assert.Contains("CHR-RAM", result.Error);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_AllPrgBanks_ExtractsAllBanks() {
		var rom = CreateTestRom(prgBanks: 4);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "allprg"
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "banks.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.Equal(4, result.Metadata["bankCount"]);
			Assert.Equal(0x10000, result.BytesExtracted); // 4 * 16KB

			// Verify individual files exist
			for (int i = 0; i < 4; i++) {
				var bankPath = Path.Combine(tempDir, $"banks_prg_{i:d2}.bin");
				Assert.True(File.Exists(bankPath), $"Expected file: {bankPath}");
			}
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_AllChrBanks_ExtractsAllBanks() {
		var rom = CreateTestRom(chrBanks: 4);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "allchr"
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "banks.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.Equal(4, result.Metadata["bankCount"]);
			Assert.Equal(0x8000, result.BytesExtracted); // 4 * 8KB

			// Verify individual files exist
			for (int i = 0; i < 4; i++) {
				var bankPath = Path.Combine(tempDir, $"banks_chr_{i:d2}.bin");
				Assert.True(File.Exists(bankPath), $"Expected file: {bankPath}");
			}
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_NsfAudio_CreatesNsfFile() {
		var rom = CreateTestRom(prgBanks: 2);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(
			type: AssetType.Audio,
			options: new Dictionary<string, object> {
				["extractType"] = "nsf",
				["name"] = "Test Music",
				["artist"] = "Test Artist"
			});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "music.nsf");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.NotNull(result.OutputPath);
			Assert.True(File.Exists(result.OutputPath));
			Assert.EndsWith(".nsf", result.OutputPath);

			// Verify NSF header magic
			var nsfData = await File.ReadAllBytesAsync(result.OutputPath);
			Assert.Equal((byte)'N', nsfData[0]);
			Assert.Equal((byte)'E', nsfData[1]);
			Assert.Equal((byte)'S', nsfData[2]);
			Assert.Equal((byte)'M', nsfData[3]);
			Assert.Equal(0x1a, nsfData[4]);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_RawData_ExtractsAtOffset() {
		var rom = CreateTestRom();
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(offset: 0x10, length: 0x100);
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "data.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.Equal(0x100, result.BytesExtracted);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_MetadataIncludesMapperInfo() {
		var rom = CreateTestRom(mapper: 4); // MMC3
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(offset: 0x10, length: 0x10);
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "data.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.Equal(4, result.Metadata["mapper"]);
			Assert.Equal("MMC3", result.Metadata["mapperName"]);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_InvalidBankIndex_ReturnsError() {
		var rom = CreateTestRom(prgBanks: 2);
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(options: new Dictionary<string, object> {
			["extractType"] = "prg",
			["bank"] = 10 // Invalid - only 2 banks
		});
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "prg_bank.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.False(result.Success);
			Assert.Contains("out of range", result.Error);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_InvalidOffset_ReturnsError() {
		var rom = CreateTestRom();
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(offset: 0x100000, length: 0x10); // Way past end of ROM
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "data.bin");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.False(result.Success);
			Assert.Contains("Invalid offset", result.Error);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ExtractAsync_AudioType_InfersNsfExtraction() {
		var rom = CreateTestRom();
		var extractor = new NesAssetExtractor();
		var asset = CreateAssetDefinition(type: AssetType.Audio);
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		Directory.CreateDirectory(tempDir);

		try {
			var outputPath = Path.Combine(tempDir, "audio.nsf");
			var result = await extractor.ExtractAsync(rom, asset, outputPath, CreateAssetsConfig());

			Assert.True(result.Success);
			Assert.EndsWith(".nsf", result.OutputPath);
		} finally {
			if (Directory.Exists(tempDir))
				Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public void AssetExtractorFactory_GetPlatformExtractor_ReturnsNesExtractor() {
		var extractor = AssetExtractorFactory.GetPlatformExtractor(Platform.Nes);

		Assert.NotNull(extractor);
		Assert.IsType<NesAssetExtractor>(extractor);
	}

	[Fact]
	public void AssetExtractorFactory_GetPlatformExtractor_ReturnsNullForOtherPlatforms() {
		var snesExtractor = AssetExtractorFactory.GetPlatformExtractor(Platform.Snes);
		var genesisExtractor = AssetExtractorFactory.GetPlatformExtractor(Platform.Genesis);

		Assert.Null(snesExtractor);
		Assert.Null(genesisExtractor);
	}
}
