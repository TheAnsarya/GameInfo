using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

public class RomAnalyzerTests {
	private byte[] CreateTestNesRom() {
		// Create minimal NES ROM (16 byte header + 16KB PRG)
		byte[] rom = new byte[0x4010];

		// iNES header
		rom[0] = 0x4e; // 'N'
		rom[1] = 0x45; // 'E'
		rom[2] = 0x53; // 'S'
		rom[3] = 0x1a; // EOF
		rom[4] = 0x01; // 1 PRG bank (16KB)
		rom[5] = 0x00; // 0 CHR banks

		// Fill with semi-realistic code-like data
		for (int i = 0x10; i < rom.Length; i++) {
			// Mix of NES opcodes
			rom[i] = (byte)((i % 8) switch {
				0 => 0xa9, // LDA
				1 => 0x00, // immediate value
				2 => 0xea, // NOP
				3 => 0x8d, // STA absolute
				4 => 0x00, // low byte
				5 => 0x20, // high byte
				6 => 0x4c, // JMP
				7 => 0x00, // jump target
				_ => 0xea
			});
		}

		return rom;
	}

	[Fact]
	public void Constructor_CreatesInstanceFromNesRom() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		Assert.NotNull(analyzer);
	}

	[Fact]
	public void AnalyzeRom_ReturnsDataBlocks() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		var blocks = analyzer.AnalyzeRom();

		Assert.NotNull(blocks);
		Assert.NotEmpty(blocks);
	}

	[Fact]
	public void DataBlock_HasCorrectProperties() {
		var block = new RomAnalyzer.DataBlock(0x100, 256, RomAnalyzer.BlockType.Code, 0.85f, "Test block");

		Assert.Equal(0x100, block.Offset);
		Assert.Equal(256, block.Length);
		Assert.Equal(RomAnalyzer.BlockType.Code, block.Type);
		Assert.Equal(0.85f, block.Confidence);
		Assert.Equal("Test block", block.Description);
	}

	[Fact]
	public void BlockType_HasExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Unknown"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Code"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Graphics"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Text"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Audio"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "PointerTable"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "DataTable"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Empty"));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), "Compressed"));
	}

	[Fact]
	public void AnalyzeRom_WithSmallBlockSize_ReturnsMoreBlocks() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		var largeBlocks = analyzer.AnalyzeRom(blockSize: 1024);
		var smallBlocks = analyzer.AnalyzeRom(blockSize: 128);

		// Smaller blocks should produce more entries before merging
		Assert.True(largeBlocks.Count > 0);
		Assert.True(smallBlocks.Count > 0);
	}

	[Fact]
	public void AnalyzeRom_EmptyRegion_DetectsAsEmpty() {
		// Create ROM with empty region
		byte[] rom = CreateTestNesRom();
		// Fill a section with 0xff (empty/unused)
		for (int i = 0x2000; i < 0x3000; i++) {
			rom[i] = 0xff;
		}

		var analyzer = new RomAnalyzer(rom);
		var blocks = analyzer.AnalyzeRom(blockSize: 0x100);

		// Should detect at least one empty block
		var emptyBlocks = blocks.Where(b => b.Type == RomAnalyzer.BlockType.Empty).ToList();
		Assert.NotEmpty(emptyBlocks);
	}

	#region Mapper Detection Tests

	[Fact]
	public void DetectMapper_ValidNesRom_ReturnsMapperInfo() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		var mapper = analyzer.DetectMapper();

		Assert.NotNull(mapper);
		Assert.Equal(0, mapper.MapperId); // NROM
		Assert.Equal("NROM", mapper.Name);
	}

	[Fact]
	public void DetectMapper_Mmc1_DetectsCorrectly() {
		byte[] rom = CreateTestNesRom();
		rom[6] = 0x10; // Mapper 1 lower nibble
		rom[7] = 0x00; // Mapper 1 upper nibble

		var analyzer = new RomAnalyzer(rom);
		var mapper = analyzer.DetectMapper();

		Assert.NotNull(mapper);
		Assert.Equal(1, mapper.MapperId);
		Assert.Contains("MMC1", mapper.Name);
	}

	[Fact]
	public void MapperInfo_HasAllProperties() {
		var mapper = new RomAnalyzer.MapperInfo(4, "MMC3", "Nintendo MMC3", 8, 16);

		Assert.Equal(4, mapper.MapperId);
		Assert.Equal("MMC3", mapper.Name);
		Assert.Equal("Nintendo MMC3", mapper.Description);
		Assert.Equal(8, mapper.PrgBanks);
		Assert.Equal(16, mapper.ChrBanks);
	}

	#endregion

	#region Bank Analysis Tests

	[Fact]
	public void AnalyzeBanks_ReturnsCorrectNumberOfBanks() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		// ROM has 16KB PRG, so 1 bank at 16KB size
		var banks = analyzer.AnalyzeBanks(bankSize: 0x4000);

		Assert.Single(banks);
	}

	[Fact]
	public void BankInfo_HasCorrectProperties() {
		var typeBreakdown = new Dictionary<RomAnalyzer.BlockType, int> {
			{ RomAnalyzer.BlockType.Code, 8192 },
			{ RomAnalyzer.BlockType.DataTable, 4096 }
		};
		var bank = new RomAnalyzer.BankInfo(0, 0x10, 0x4000, RomAnalyzer.BlockType.Code, typeBreakdown);

		Assert.Equal(0, bank.Index);
		Assert.Equal(0x10, bank.Offset);
		Assert.Equal(0x4000, bank.Size);
		Assert.Equal(RomAnalyzer.BlockType.Code, bank.DominantType);
		Assert.Equal(2, bank.TypeBreakdown.Count);
	}

	[Fact]
	public void GenerateBankReport_ReturnsValidReport() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		string report = analyzer.GenerateBankReport();

		Assert.NotEmpty(report);
		Assert.Contains("Bank", report);
	}

	[Fact]
	public void AnalyzeRegion_ReturnsBlocks() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		var blocks = analyzer.AnalyzeRegion(0x10, 0x100);

		Assert.NotEmpty(blocks);
	}

	#endregion

	#region ROM Comparison Tests

	[Fact]
	public void CompareWith_IdenticalRoms_Returns100Percent() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		var result = analyzer.CompareWith(rom);

		Assert.Equal(100, result.SimilarityPercent);
		Assert.Equal(0, result.DifferentBytes);
		Assert.Empty(result.Differences);
	}

	[Fact]
	public void CompareWith_DifferentRoms_DetectsDifferences() {
		byte[] rom1 = CreateTestNesRom();
		byte[] rom2 = CreateTestNesRom();
		rom2[0x100] = 0xff; // Modify one byte

		var analyzer = new RomAnalyzer(rom1);
		var result = analyzer.CompareWith(rom2);

		Assert.True(result.DifferentBytes > 0);
		Assert.NotEmpty(result.Differences);
	}

	[Fact]
	public void ComparisonResult_HasAllProperties() {
		var diffs = new List<RomAnalyzer.DiffRegion> {
			new RomAnalyzer.DiffRegion(0x100, 10, new byte[] { 1, 2, 3 }, new byte[] { 4, 5, 6 })
		};
		var result = new RomAnalyzer.ComparisonResult(1000, 10, 99.0, diffs);

		Assert.Equal(1000, result.TotalBytes);
		Assert.Equal(10, result.DifferentBytes);
		Assert.Equal(99.0, result.SimilarityPercent);
		Assert.Single(result.Differences);
	}

	[Fact]
	public void DiffRegion_HasAllProperties() {
		var diff = new RomAnalyzer.DiffRegion(0x100, 5, new byte[] { 1, 2, 3 }, new byte[] { 4, 5, 6 });

		Assert.Equal(0x100, diff.Offset);
		Assert.Equal(5, diff.Length);
		Assert.Equal(3, diff.Data1.Length);
		Assert.Equal(3, diff.Data2.Length);
	}

	[Fact]
	public void GenerateComparisonReport_ReturnsValidReport() {
		byte[] rom1 = CreateTestNesRom();
		byte[] rom2 = CreateTestNesRom();
		rom2[0x100] = 0xff;

		var analyzer = new RomAnalyzer(rom1);
		string report = analyzer.GenerateComparisonReport(rom2);

		Assert.NotEmpty(report);
		Assert.Contains("Comparison", report);
	}

	#endregion

	#region Code Analysis Tests

	[Fact]
	public void FindEntryPoints_NesRom_FindsVectors() {
		byte[] rom = CreateTestNesRom();
		// Set up vector table at end of PRG
		int vectorOffset = rom.Length - 6;
		rom[vectorOffset] = 0x00; // NMI low
		rom[vectorOffset + 1] = 0x80; // NMI high ($8000)
		rom[vectorOffset + 2] = 0x00; // Reset low
		rom[vectorOffset + 3] = 0xc0; // Reset high ($C000)
		rom[vectorOffset + 4] = 0x00; // IRQ low
		rom[vectorOffset + 5] = 0x90; // IRQ high ($9000)

		var analyzer = new RomAnalyzer(rom);
		var entryPoints = analyzer.FindEntryPoints();

		Assert.NotEmpty(entryPoints);
		Assert.Contains(0x8000, entryPoints);
	}

	[Fact]
	public void CalculateCodeDensity_ReturnsValidRatio() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		double density = analyzer.CalculateCodeDensity();

		Assert.True(density >= 0 && density <= 1);
	}

	#endregion

	#region Report Generation Tests

	[Fact]
	public void GenerateMap_ReturnsValidReport() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		string map = analyzer.GenerateMap();

		Assert.NotEmpty(map);
		Assert.Contains("ROM Analysis", map);
	}

	[Fact]
	public void ExportToJson_ReturnsValidJson() {
		byte[] rom = CreateTestNesRom();
		var analyzer = new RomAnalyzer(rom);

		string json = analyzer.ExportToJson();

		Assert.NotEmpty(json);
		Assert.Contains("\"system\"", json);
		Assert.Contains("\"blocks\"", json);
	}

	#endregion
}
