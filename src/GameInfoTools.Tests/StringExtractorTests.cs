using GameInfoTools.Core;
using GameInfoTools.Text;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for StringExtractor including text extraction from ROM data,
/// pointer table parsing, and text search functionality.
/// </summary>
public class StringExtractorTests {
	private TextTable CreateTestTable() {
		var table = new TextTable { Name = "Test" };
		// Standard ASCII-like mapping for Dragon Quest style
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
			table.AddEntry((byte)(0x9A + i), ((char)('a' + i)).ToString());
		}
		// Space and punctuation
		table.AddEntry(0xBE, " ");
		table.AddEntry(0xBF, "!");
		table.AddEntry(0xC0, "?");
		table.AddEntry(0xC1, ".");
		// End marker
		table.AddEntry(0xFF, "[END]");
		return table;
	}

	[Fact]
	public void StringExtractor_CanBeCreated() {
		var table = CreateTestTable();
		var extractor = new StringExtractor(table);
		Assert.NotNull(extractor);
	}

	[Fact]
	public void ExtractedString_HasCorrectProperties() {
		var str = new StringExtractor.ExtractedString(0x100, "Hello", 5, 0.9f);
		Assert.Equal(0x100, str.Offset);
		Assert.Equal("Hello", str.Text);
		Assert.Equal(5, str.Length);
		Assert.Equal(0.9f, str.Confidence);
	}

	[Fact]
	public void ExtractAllStrings_FindsStringsInData() {
		var table = CreateTestTable();
		var extractor = new StringExtractor(table);

		// Create test data with "HELLO" encoded
		byte[] data = new byte[0x20];
		data[0x10] = 0x87; // H
		data[0x11] = 0x84; // E
		data[0x12] = 0x8B; // L
		data[0x13] = 0x8B; // L
		data[0x14] = 0x8E; // O
		data[0x15] = 0xFF; // [END]

		var results = extractor.ExtractAllStrings(data, minLength: 3, minConfidence: 0.0f);

		Assert.NotEmpty(results);
	}
}
