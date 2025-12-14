using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for TextTable visual editor features including DTE/MTE, format import/export, and pattern detection.
/// Issue #39: Text Table Editor - Visual TBL editor with preview
/// </summary>
public class TextTableEditorTests {
	#region DTE/MTE Management Tests

	[Fact]
	public void AddDteEntry_AddsSingleByteMapping() {
		var table = TextTable.FromString("");

		table.AddDteEntry([0x80], "the");

		Assert.Equal(1, table.DteCount);
		var entries = table.GetDteEntries().ToList();
		Assert.Single(entries);
		Assert.Equal("the", entries[0].Text);
		Assert.Equal("80", entries[0].HexString);
	}

	[Fact]
	public void AddDteEntry_AddsMultiByteMapping() {
		var table = TextTable.FromString("");

		table.AddDteEntry([0x80, 0x81], "ing");

		Assert.Equal(1, table.DteCount);
		var entries = table.GetDteEntries().ToList();
		Assert.Equal("8081", entries[0].HexString);
	}

	[Fact]
	public void RemoveDteEntry_RemovesExistingEntry() {
		var table = TextTable.FromString("");
		table.AddDteEntry([0x80], "the");

		var result = table.RemoveDteEntry([0x80]);

		Assert.True(result);
		Assert.Equal(0, table.DteCount);
	}

	[Fact]
	public void RemoveDteEntry_ReturnsFalseForNonexistent() {
		var table = TextTable.FromString("");

		var result = table.RemoveDteEntry([0xff]);

		Assert.False(result);
	}

	[Fact]
	public void DteEntry_Ratio_CalculatesCorrectly() {
		var entry = new DteEntry([0x80], "the", 10);

		Assert.Equal(3.0, entry.Ratio); // 3 chars / 1 byte
	}

	[Fact]
	public void AnalyzeDteCandidates_FindsRepeatedPairs() {
		var table = TextTable.CreateAscii();
		var text = "the the the cat sat on the mat the dog";

		var candidates = table.AnalyzeDteCandidates(text, minLength: 2, minFrequency: 2);

		Assert.True(candidates.Count > 0);
		Assert.Contains(candidates, c => c.Text == "the");
	}

	[Fact]
	public void AnalyzeDteCandidates_SkipsControlCodes() {
		var table = TextTable.CreateAscii();
		var text = "test[END]test[END]test";

		var candidates = table.AnalyzeDteCandidates(text, minLength: 2, minFrequency: 2);

		Assert.DoesNotContain(candidates, c => c.Text.Contains('['));
	}

	[Fact]
	public void GenerateDteFromText_CreatesEntries() {
		var table = TextTable.CreateAscii(); // Use ASCII table so it can encode
		var text = "the the the and and and";

		table.GenerateDteFromText(text, maxEntries: 5, startByte: 0x80);

		// Should find repeated patterns
		Assert.True(table.DteCount > 0);
	}

	#endregion

	#region Format Export Tests

	[Fact]
	public void Export_Standard_ProducesValidFormat() {
		var table = TextTable.FromString("41=A\n42=B");

		var exported = table.Export(TblFormat.Standard);

		Assert.Contains("41=A", exported);
		Assert.Contains("42=B", exported);
	}

	[Fact]
	public void Export_Atlas_HasDollarPrefix() {
		var table = TextTable.FromString("41=A");

		var exported = table.Export(TblFormat.Atlas);

		Assert.Contains("$41=A", exported, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void Export_Json_ProducesValidJson() {
		var table = TextTable.FromString("41=A\n42=B");
		table.Name = "Test";

		var exported = table.Export(TblFormat.Json);

		Assert.Contains("\"name\"", exported);
		Assert.Contains("\"Test\"", exported);
		Assert.Contains("\"entries\"", exported);
	}

	[Fact]
	public void Export_Xml_ProducesValidXml() {
		var table = TextTable.FromString("41=A");
		table.Name = "Test";

		var exported = table.Export(TblFormat.Xml);

		Assert.Contains("<?xml", exported);
		Assert.Contains("<TextTable", exported);
		Assert.Contains("<Entry", exported);
	}

	[Fact]
	public void Export_Csv_ProducesValidCsv() {
		var table = TextTable.FromString("41=A\n42=B");

		var exported = table.Export(TblFormat.Csv);

		Assert.Contains("hex,value", exported);
		Assert.Contains("41,", exported);
	}

	[Fact]
	public void Export_IncludesDteEntries() {
		var table = TextTable.FromString("41=A");
		table.AddDteEntry([0x80, 0x81], "the");

		var exported = table.Export(TblFormat.Standard);

		Assert.Contains("8081=the", exported);
	}

	#endregion

	#region Format Import Tests

	[Fact]
	public void Import_Atlas_ParsesDollarPrefix() {
		var content = "$41=A\n$42=B";

		var table = TextTable.Import(content, TblFormat.Atlas);

		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
	}

	[Fact]
	public void Import_Thingy_ParsesMultiByte() {
		var content = "41=A\n4142=AB";

		var table = TextTable.Import(content, TblFormat.Thingy);

		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
		Assert.Equal(1, table.DteCount);
	}

	[Fact]
	public void Import_Json_ParsesCorrectly() {
		var content = """
		{
			"name": "Test",
			"entries": [
				{ "hex": "41", "value": "A" },
				{ "hex": "42", "value": "B" }
			],
			"dte": []
		}
		""";

		var table = TextTable.Import(content, TblFormat.Json);

		Assert.Equal("Test", table.Name);
		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
	}

	[Fact]
	public void Import_Xml_ParsesCorrectly() {
		var content = """
		<?xml version="1.0" encoding="utf-8"?>
		<TextTable name="Test">
			<Entry hex="41" value="A" />
			<Entry hex="42" value="B" />
		</TextTable>
		""";

		var table = TextTable.Import(content, TblFormat.Xml);

		Assert.Equal("Test", table.Name);
		Assert.Equal("AB", table.Decode(new byte[] { 0x41, 0x42 }));
	}

	[Fact]
	public void Import_Csv_ParsesCorrectly() {
		var content = "hex,value\n41,\"A\"\n42,\"B\"";

		var table = TextTable.Import(content, TblFormat.Csv);

		Assert.Equal("AB", table.Decode(new byte[] { 0x41, 0x42 }));
	}

	#endregion

	#region Auto-Detect Import Tests

	[Fact]
	public void ImportAutoDetect_DetectsJson() {
		var content = """{"name":"Test","entries":[]}""";

		var (table, format) = TextTable.ImportAutoDetect(content);

		Assert.Equal(TblFormat.Json, format);
	}

	[Fact]
	public void ImportAutoDetect_DetectsXml() {
		var content = "<?xml version=\"1.0\"?><TextTable></TextTable>";

		var (table, format) = TextTable.ImportAutoDetect(content);

		Assert.Equal(TblFormat.Xml, format);
	}

	[Fact]
	public void ImportAutoDetect_DetectsCsv() {
		var content = "hex,value\n41,A\n42,B";

		var (table, format) = TextTable.ImportAutoDetect(content);

		Assert.Equal(TblFormat.Csv, format);
	}

	[Fact]
	public void ImportAutoDetect_DetectsAtlas() {
		var content = "$41=A\n$42=B";

		var (table, format) = TextTable.ImportAutoDetect(content);

		Assert.Equal(TblFormat.Atlas, format);
	}

	[Fact]
	public void ImportAutoDetect_DefaultsToStandard() {
		var content = "41=A\n42=B";

		var (table, format) = TextTable.ImportAutoDetect(content);

		Assert.Equal(TblFormat.Standard, format);
	}

	#endregion

	#region Encoding Pattern Detection Tests

	[Fact]
	public void DetectEncodingPatterns_DetectsAscii() {
		var data = System.Text.Encoding.ASCII.GetBytes("Hello World");

		var result = TextTable.DetectEncodingPatterns(data);

		Assert.Equal("ASCII-based", result.DetectedType);
		Assert.True(result.Confidence > 0.5);
	}

	[Fact]
	public void DetectEncodingPatterns_ReturnsSuggestedMappings() {
		var data = System.Text.Encoding.ASCII.GetBytes("Test");

		var result = TextTable.DetectEncodingPatterns(data);

		Assert.True(result.SuggestedMappings.Count > 0);
	}

	[Fact]
	public void DetectEncodingPatterns_DetectsPatternFeatures() {
		var data = new byte[] { 0x00, 0x41, 0x42, 0xff, 0x00 };

		var result = TextTable.DetectEncodingPatterns(data);

		Assert.Contains(result.DetectedPatterns, p => p.Contains("null"));
	}

	[Fact]
	public void DetectEncodingPatterns_WithKnownText_CorrelatesPatterns() {
		var data = new byte[] { 0x80, 0x81, 0x82, 0x83, 0x84 };
		var knownText = "Hello";

		var result = TextTable.DetectEncodingPatterns(data, knownText);

		Assert.True(result.SuggestedMappings.Count > 0);
	}

	#endregion

	#region Preview Helper Tests

	[Fact]
	public void DecodeWithHighlights_MarksUnknownBytes() {
		var table = TextTable.FromString("41=A\n42=B");
		var data = new byte[] { 0x41, 0xff, 0x42 };

		var (text, unknownPos) = table.DecodeWithHighlights(data);

		Assert.Contains("[ff]", text);
		Assert.Single(unknownPos);
	}

	[Fact]
	public void DecodeWithHighlights_NoUnknown_EmptyList() {
		var table = TextTable.FromString("41=A\n42=B");
		var data = new byte[] { 0x41, 0x42 };

		var (text, unknownPos) = table.DecodeWithHighlights(data);

		Assert.Equal("AB", text);
		Assert.Empty(unknownPos);
	}

	[Fact]
	public void GetCoverageStats_CalculatesCorrectly() {
		var table = TextTable.FromString("41=A\n42=B");
		var data = new byte[] { 0x41, 0x42, 0xff, 0xfe };

		var (mapped, unmapped, coverage) = table.GetCoverageStats(data);

		Assert.Equal(2, mapped);
		Assert.Equal(2, unmapped);
		Assert.Equal(0.5, coverage);
	}

	[Fact]
	public void GetCoverageStats_EmptyData_ReturnsZero() {
		var table = TextTable.FromString("41=A");
		var data = Array.Empty<byte>();

		var (mapped, unmapped, coverage) = table.GetCoverageStats(data);

		Assert.Equal(0, mapped);
		Assert.Equal(0, unmapped);
		Assert.Equal(0, coverage);
	}

	#endregion

	#region Table Management Tests

	[Fact]
	public void RemoveEntry_RemovesExisting() {
		var table = TextTable.FromString("41=A\n42=B");

		var result = table.RemoveEntry(0x41);

		Assert.True(result);
		Assert.Null(table.GetCharacter(0x41));
	}

	[Fact]
	public void RemoveEntry_ReturnsFalseForNonexistent() {
		var table = TextTable.FromString("41=A");

		var result = table.RemoveEntry(0xff);

		Assert.False(result);
	}

	[Fact]
	public void Clear_RemovesAllEntries() {
		var table = TextTable.FromString("41=A\n42=B");
		table.AddDteEntry([0x80], "the");

		table.Clear();

		Assert.Equal(0, table.EntryCount);
		Assert.Equal(0, table.DteCount);
	}

	[Fact]
	public void Merge_CombinesTables() {
		var table1 = TextTable.FromString("41=A\n42=B");
		var table2 = TextTable.FromString("43=C\n44=D");

		table1.Merge(table2);

		Assert.Equal(4, table1.EntryCount);
		Assert.Equal("C", table1.GetCharacter(0x43));
	}

	[Fact]
	public void Merge_WithOverwrite_ReplacesEntries() {
		var table1 = TextTable.FromString("41=A");
		var table2 = TextTable.FromString("41=X");

		table1.Merge(table2, overwrite: true);

		Assert.Equal("X", table1.GetCharacter(0x41));
	}

	[Fact]
	public void Merge_WithoutOverwrite_KeepsOriginal() {
		var table1 = TextTable.FromString("41=A");
		var table2 = TextTable.FromString("41=X");

		table1.Merge(table2, overwrite: false);

		Assert.Equal("A", table1.GetCharacter(0x41));
	}

	#endregion

	#region Round-Trip Export/Import Tests

	[Fact]
	public void RoundTrip_Standard_PreservesData() {
		var original = TextTable.FromString("41=A\n42=B");
		original.Name = "Test";
		original.AddDteEntry([0x80], "the");

		var exported = original.Export(TblFormat.Standard);
		var imported = TextTable.Import(exported, TblFormat.Standard);

		Assert.Equal("A", imported.GetCharacter(0x41));
		Assert.Equal("B", imported.GetCharacter(0x42));
	}

	[Fact]
	public void RoundTrip_Json_PreservesData() {
		var original = TextTable.FromString("41=A\n42=B");
		original.Name = "TestTable";

		var exported = original.Export(TblFormat.Json);
		var imported = TextTable.Import(exported, TblFormat.Json);

		Assert.Equal("TestTable", imported.Name);
		Assert.Equal("AB", imported.Decode(new byte[] { 0x41, 0x42 }));
	}

	[Fact]
	public void RoundTrip_Xml_PreservesData() {
		var original = TextTable.FromString("41=A\n42=B");
		original.Name = "TestTable";

		var exported = original.Export(TblFormat.Xml);
		var imported = TextTable.Import(exported, TblFormat.Xml);

		Assert.Equal("TestTable", imported.Name);
		Assert.Equal(2, imported.EntryCount);
	}

	#endregion

	#region Property Accessors Tests

	[Fact]
	public void DecodeTable_ReturnsReadOnlyDictionary() {
		var table = TextTable.FromString("41=A\n42=B");

		var decodeTable = table.DecodeTable;

		Assert.Equal(2, decodeTable.Count);
		Assert.Equal("A", decodeTable[0x41]);
	}

	[Fact]
	public void EncodeTable_ReturnsReadOnlyDictionary() {
		var table = TextTable.FromString("41=A\n42=B");

		var encodeTable = table.EncodeTable;

		Assert.Equal(2, encodeTable.Count);
		Assert.Equal((byte)0x41, encodeTable["A"]);
	}

	[Fact]
	public void ControlCodes_ReturnsReadOnlyDictionary() {
		var table = TextTable.FromString("0001=[CTRL]");

		var controlCodes = table.ControlCodes;

		Assert.NotNull(controlCodes);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void Export_EmptyTable_ProducesValidOutput() {
		var table = TextTable.FromString("");

		var exported = table.Export(TblFormat.Json);

		Assert.Contains("entries", exported);
	}

	[Fact]
	public void Import_EmptyJson_CreatesEmptyTable() {
		var content = """{"name":"Empty","entries":[],"dte":[]}""";

		var table = TextTable.Import(content, TblFormat.Json);

		Assert.Equal(0, table.EntryCount);
	}

	[Fact]
	public void DetectEncodingPatterns_EmptyData_ReturnsUnknown() {
		var data = Array.Empty<byte>();

		var result = TextTable.DetectEncodingPatterns(data);

		Assert.Equal("Unknown", result.DetectedType);
	}

	[Fact]
	public void AnalyzeDteCandidates_EmptyText_ReturnsEmpty() {
		var table = TextTable.CreateAscii();

		var candidates = table.AnalyzeDteCandidates("");

		Assert.Empty(candidates);
	}

	#endregion
}
