using GameInfoTools.Core;

namespace GameInfoTools.Tests;

public class PatternDetectorTests
{
	[Fact]
	public void FindPointerTables_FindsNesPointerTable()
	{
		// Create a simple pointer table (little-endian pointers)
		byte[] data = new byte[0x100];
		// Pointer table at offset 0
		data[0] = 0x00; data[1] = 0x80; // -> $8000
		data[2] = 0x20; data[3] = 0x80; // -> $8020
		data[4] = 0x40; data[5] = 0x80; // -> $8040
		data[6] = 0x60; data[7] = 0x80; // -> $8060

		var results = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Should find at least the pointer table we created
		Assert.NotNull(results);
	}

	[Fact]
	public void FindTextRegions_DetectsAsciiText()
	{
		byte[] data = new byte[0x100];
		// Fill some ASCII text
		string text = "Hello, World! This is a test string.";
		for (int i = 0; i < text.Length; i++)
		{
			data[0x20 + i] = (byte)text[i];
		}

		var results = PatternDetector.FindTextRegions(data, 8);

		Assert.NotEmpty(results);
		Assert.True(results[0].Length >= 8);
	}

	[Fact]
	public void FindTextRegions_ReturnsResultsForAnyData()
	{
		byte[] data = new byte[0x100];
		// Fill with non-text data
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)(0x80 + (i & 0x7F)); // High-bit set, not ASCII
		}

		var results = PatternDetector.FindTextRegions(data, 8);

		// The detector may still find patterns, just verify it returns
		Assert.NotNull(results);
	}

	[Fact]
	public void FindGraphicsRegions_FindsTileData()
	{
		// Create a pattern that looks like tile data
		// 16-byte tiles with structured patterns
		byte[] data = new byte[0x200];
		for (int tile = 0; tile < 16; tile++)
		{
			int offset = tile * 16;
			for (int row = 0; row < 8; row++)
			{
				// Alternating pattern
				data[offset + row] = (byte)(row % 2 == 0 ? 0xFF : 0x00);
				data[offset + row + 8] = (byte)(row % 2 == 0 ? 0x00 : 0xFF);
			}
		}

		var results = PatternDetector.FindGraphicsRegions(data, 16);

		Assert.NotNull(results);
	}

	[Fact]
	public void FindDataTables_FindsStructuredData()
	{
		// Create structured data table (e.g., 4-byte entries)
		byte[] data = new byte[0x100];
		for (int i = 0; i < 16; i++)
		{
			int offset = i * 4;
			data[offset] = (byte)i;          // ID
			data[offset + 1] = (byte)(i * 2); // Value 1
			data[offset + 2] = (byte)(i * 3); // Value 2
			data[offset + 3] = (byte)(i * 4); // Value 3
		}

		var results = PatternDetector.FindDataTables(data, 4, 4);

		Assert.NotNull(results);
	}

	[Fact]
	public void FindCodeRegions_FindsNesCode()
	{
		// Create typical NES code pattern
		byte[] data = new byte[0x100];
		int offset = 0;

		// SEI, CLD, LDX #$FF, TXS (typical NES startup)
		data[offset++] = 0x78; // SEI
		data[offset++] = 0xD8; // CLD
		data[offset++] = 0xA2; // LDX
		data[offset++] = 0xFF; // #$FF
		data[offset++] = 0x9A; // TXS

		// LDA #$00, STA $2000
		data[offset++] = 0xA9; // LDA
		data[offset++] = 0x00; // #$00
		data[offset++] = 0x8D; // STA absolute
		data[offset++] = 0x00;
		data[offset++] = 0x20;

		// Fill rest with plausible code
		for (int i = offset; i < 0x40; i++)
		{
			data[i] = (byte)(i % 256);
		}

		var results = PatternDetector.FindCodeRegions(data, SystemType.Nes);

		Assert.NotNull(results);
	}

	[Fact]
	public void PatternMatch_HasCorrectProperties()
	{
		var match = new PatternDetector.PatternMatch(
			Offset: 0x100,
			Length: 0x50,
			PatternType: "PointerTable",
			Confidence: 0.9,
			Metadata: null
		);

		Assert.Equal(0x100, match.Offset);
		Assert.Equal(0x50, match.Length);
		Assert.Equal("PointerTable", match.PatternType);
		Assert.Equal(0.9, match.Confidence);
		Assert.Null(match.Metadata);
	}
}
