using GameInfoTools.Text;
using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for StringExtractor export formats and search functionality.
/// </summary>
public class StringExtractorAdvancedTests
{
	private static TextTable CreateBasicTable()
	{
		var table = new TextTable();
		// Basic ASCII mapping
		for (byte i = 0x20; i <= 0x7e; i++)
		{
			table.AddEntry(i, ((char)i).ToString());
		}
		table.AddEntry(0x00, "{END}"); // String terminator
		return table;
	}

	[Fact]
	public void ExportToCsv_FormatsCorrectly()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var strings = new List<StringExtractor.ExtractedString>
		{
			new(0x1000, "Hello", 5, 0.9f),
			new(0x2000, "World", 5, 0.85f),
		};

		var csv = extractor.ExportToCsv(strings);

		Assert.Contains("Offset,Length,Confidence,Text", csv);
		Assert.Contains("0x001000,5,0.90,\"Hello\"", csv);
		Assert.Contains("0x002000,5,0.85,\"World\"", csv);
	}

	[Fact]
	public void ExportToCsv_EscapesQuotesInText()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var strings = new List<StringExtractor.ExtractedString>
		{
			new(0x1000, "Say \"Hello\"", 11, 0.9f),
		};

		var csv = extractor.ExportToCsv(strings);

		// Quotes should be doubled in CSV
		Assert.Contains("\"\"Hello\"\"", csv);
	}

	[Fact]
	public void ExportToJson_FormatsCorrectly()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var strings = new List<StringExtractor.ExtractedString>
		{
			new(0x1000, "Test", 4, 0.95f),
		};

		var json = extractor.ExportToJson(strings);

		Assert.Contains("\"offset\": \"0x001000\"", json);
		Assert.Contains("\"length\": 4", json);
		Assert.Contains("\"confidence\": 0.95", json);
		Assert.Contains("\"text\": \"Test\"", json);
	}

	[Fact]
	public void ExportToJson_EscapesSpecialCharacters()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var strings = new List<StringExtractor.ExtractedString>
		{
			new(0x1000, "Line1\nLine2", 11, 0.9f),
		};

		var json = extractor.ExportToJson(strings);

		// Newline should be escaped
		Assert.Contains("\\n", json);
	}

	[Fact]
	public void ExportToScript_FormatsCorrectly()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var strings = new List<StringExtractor.ExtractedString>
		{
			new(0x1234, "Script text", 11, 0.9f),
		};

		var script = extractor.ExportToScript(strings);

		Assert.Contains("; @001234", script);
		Assert.Contains("11 bytes", script);
		Assert.Contains("Script text", script);
	}

	[Fact]
	public void SearchString_FindsExactMatches()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		// Create data with "HELLO" at offset 10
		var data = new byte[100];
		data[10] = (byte)'H';
		data[11] = (byte)'E';
		data[12] = (byte)'L';
		data[13] = (byte)'L';
		data[14] = (byte)'O';

		var results = extractor.SearchString(data, "HELLO");

		Assert.Single(results);
		Assert.Equal(10, results[0]);
	}

	[Fact]
	public void SearchString_FindsMultipleOccurrences()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		// Create data with "HI" at offsets 10 and 30
		var data = new byte[100];
		data[10] = (byte)'H';
		data[11] = (byte)'I';
		data[30] = (byte)'H';
		data[31] = (byte)'I';

		var results = extractor.SearchString(data, "HI");

		Assert.Equal(2, results.Count);
		Assert.Contains(10, results);
		Assert.Contains(30, results);
	}

	[Fact]
	public void SearchString_ReturnsEmptyForNoMatch()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		var data = new byte[100];

		var results = extractor.SearchString(data, "NOTFOUND");

		Assert.Empty(results);
	}

	[Fact]
	public void ExtractedString_RecordHasCorrectProperties()
	{
		var str = new StringExtractor.ExtractedString(0x1000, "Test", 4, 0.95f);

		Assert.Equal(0x1000, str.Offset);
		Assert.Equal("Test", str.Text);
		Assert.Equal(4, str.Length);
		Assert.Equal(0.95f, str.Confidence);
	}

	[Fact]
	public void ExtractAllStrings_RespectsMinLength()
	{
		var table = CreateBasicTable();
		var extractor = new StringExtractor(table);

		// Create data with short and long strings
		var data = new byte[50];
		// "AB" at 0
		data[0] = (byte)'A';
		data[1] = (byte)'B';
		data[2] = 0;
		// "HELLO" at 10
		data[10] = (byte)'H';
		data[11] = (byte)'E';
		data[12] = (byte)'L';
		data[13] = (byte)'L';
		data[14] = (byte)'O';
		data[15] = 0;

		var results = extractor.ExtractAllStrings(data, minLength: 4, minConfidence: 0.0f);

		// Should only find strings with length >= 4
		Assert.All(results, r => Assert.True(r.Text.Length >= 4 || r.Text.Contains("{END}")));
	}
}
