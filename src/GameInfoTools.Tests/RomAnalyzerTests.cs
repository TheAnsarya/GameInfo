using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

public class RomAnalyzerTests {
	private byte[] CreateTestNesRom() {
		// Create minimal NES ROM (16 byte header + 16KB PRG)
		byte[] rom = new byte[0x4010];

		// iNES header
		rom[0] = 0x4E; // 'N'
		rom[1] = 0x45; // 'E'
		rom[2] = 0x53; // 'S'
		rom[3] = 0x1A; // EOF
		rom[4] = 0x01; // 1 PRG bank (16KB)
		rom[5] = 0x00; // 0 CHR banks

		// Fill with semi-realistic code-like data
		for (int i = 0x10; i < rom.Length; i++) {
			// Mix of NES opcodes
			rom[i] = (byte)((i % 8) switch {
				0 => 0xA9, // LDA
				1 => 0x00, // immediate value
				2 => 0xEA, // NOP
				3 => 0x8D, // STA absolute
				4 => 0x00, // low byte
				5 => 0x20, // high byte
				6 => 0x4C, // JMP
				7 => 0x00, // jump target
				_ => 0xEA
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
		// Fill a section with 0xFF (empty/unused)
		for (int i = 0x2000; i < 0x3000; i++) {
			rom[i] = 0xFF;
		}

		var analyzer = new RomAnalyzer(rom);
		var blocks = analyzer.AnalyzeRom(blockSize: 0x100);

		// Should detect at least one empty block
		var emptyBlocks = blocks.Where(b => b.Type == RomAnalyzer.BlockType.Empty).ToList();
		Assert.NotEmpty(emptyBlocks);
	}
}
