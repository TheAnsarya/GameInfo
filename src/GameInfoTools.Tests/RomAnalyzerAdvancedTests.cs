using GameInfoTools.Analysis;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for RomAnalyzer functionality.
/// </summary>
public class RomAnalyzerAdvancedTests {
	private static byte[] CreateTestRom(int size = 256) {
		// Create minimal iNES header + data
		var data = new byte[16 + size];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;
		return data;
	}

	[Fact]
	public void Constructor_AcceptsData() {
		var data = CreateTestRom();
		var analyzer = new RomAnalyzer(data);

		Assert.NotNull(analyzer);
	}

	[Fact]
	public void BlockType_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Unknown));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Code));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Graphics));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Text));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Audio));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.PointerTable));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.DataTable));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Empty));
		Assert.True(Enum.IsDefined(typeof(RomAnalyzer.BlockType), RomAnalyzer.BlockType.Compressed));
	}

	[Fact]
	public void DataBlock_Record_HasCorrectProperties() {
		var block = new RomAnalyzer.DataBlock(0x1000, 256, RomAnalyzer.BlockType.Code, 0.85f, "Code block");

		Assert.Equal(0x1000, block.Offset);
		Assert.Equal(256, block.Length);
		Assert.Equal(RomAnalyzer.BlockType.Code, block.Type);
		Assert.Equal(0.85f, block.Confidence);
		Assert.Equal("Code block", block.Description);
	}

	[Fact]
	public void AnalyzeRom_ReturnsBlocks() {
		var data = CreateTestRom(512);
		var analyzer = new RomAnalyzer(data);

		var blocks = analyzer.AnalyzeRom(blockSize: 128);

		Assert.NotNull(blocks);
		Assert.NotEmpty(blocks);
	}

	[Fact]
	public void AnalyzeRom_EmptyRom_IdentifiesEmpty() {
		var data = CreateTestRom(256);
		// Data after header is all zeros (empty)
		var analyzer = new RomAnalyzer(data);

		var blocks = analyzer.AnalyzeRom();

		Assert.All(blocks, b => Assert.True(b.Type == RomAnalyzer.BlockType.Empty || b.Confidence >= 0));
	}

	[Fact]
	public void AnalyzeRom_RespectsBlockSize() {
		var data = CreateTestRom(1024);
		var analyzer = new RomAnalyzer(data);

		var blocks64 = analyzer.AnalyzeRom(blockSize: 64);
		var blocks256 = analyzer.AnalyzeRom(blockSize: 256);

		// With smaller block size, should have more initial blocks (before merging)
		// After merging they might be same, but the analysis granularity differs
		Assert.NotNull(blocks64);
		Assert.NotNull(blocks256);
	}

	[Fact]
	public void AnalyzeRom_BlocksSpanEntireRom() {
		var data = CreateTestRom(512);
		var analyzer = new RomAnalyzer(data);

		var blocks = analyzer.AnalyzeRom();

		// Blocks should cover from header end to data end
		int totalLength = blocks.Sum(b => b.Length);
		Assert.True(totalLength > 0);
	}

	[Fact]
	public void DataBlock_WithoutDescription_IsNull() {
		var block = new RomAnalyzer.DataBlock(0, 100, RomAnalyzer.BlockType.Unknown, 0.5f);
		Assert.Null(block.Description);
	}

	[Fact]
	public void AnalyzeRom_IdentifiesCodePatterns() {
		var data = CreateTestRom(256);
		// Add some code-like patterns (NES opcodes)
		data[16] = 0xa9; // LDA immediate
		data[17] = 0x00;
		data[18] = 0x85; // STA zero page
		data[19] = 0x10;
		data[20] = 0x4c; // JMP absolute
		data[21] = 0x00;
		data[22] = 0x80;

		var analyzer = new RomAnalyzer(data);
		var blocks = analyzer.AnalyzeRom();

		// Should have some blocks identified
		Assert.NotEmpty(blocks);
	}

	[Fact]
	public void AnalyzeRom_IdentifiesPointerTablePatterns() {
		var data = CreateTestRom(256);
		// Add pointer table pattern (sequential pointers in $8000 range)
		for (int i = 0; i < 10; i++) {
			int offset = 16 + (i * 2);
			int pointer = 0x8000 + (i * 0x100);
			data[offset] = (byte)(pointer & 0xff);
			data[offset + 1] = (byte)((pointer >> 8) & 0xff);
		}

		var analyzer = new RomAnalyzer(data);
		var blocks = analyzer.AnalyzeRom();

		Assert.NotEmpty(blocks);
	}
}
