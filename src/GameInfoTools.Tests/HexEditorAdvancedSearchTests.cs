using GameInfoTools.UI.ViewModels;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for advanced hex search features.
/// </summary>
public class AdvancedHexSearchTests {
	#region Wildcard Pattern Tests

	[Fact]
	public void ParseWildcardPattern_ExactBytes_ParsesCorrectly() {
		var pattern = AdvancedHexSearch.ParseWildcardPattern("A9 00 B9");

		Assert.NotNull(pattern);
		Assert.Equal(3, pattern.Count);
		Assert.Equal((byte)0xa9, pattern[0].Value);
		Assert.Equal((byte)0x00, pattern[1].Value);
		Assert.Equal((byte)0xb9, pattern[2].Value);
	}

	[Fact]
	public void ParseWildcardPattern_FullWildcard_ParsesCorrectly() {
		var pattern = AdvancedHexSearch.ParseWildcardPattern("A9 ?? B9");

		Assert.NotNull(pattern);
		Assert.Equal(3, pattern.Count);
		Assert.Equal((byte)0xa9, pattern[0].Value);
		Assert.Null(pattern[1].Value); // Wildcard
		Assert.Equal((byte)0xb9, pattern[2].Value);
	}

	[Fact]
	public void ParseWildcardPattern_AsteriskWildcard_ParsesCorrectly() {
		var pattern = AdvancedHexSearch.ParseWildcardPattern("FF ** 00");

		Assert.NotNull(pattern);
		Assert.Equal(3, pattern.Count);
		Assert.Null(pattern[1].Value); // ** wildcard
	}

	[Fact]
	public void ParseWildcardPattern_EmptyString_ReturnsNull() {
		var pattern = AdvancedHexSearch.ParseWildcardPattern("");
		Assert.Null(pattern);
	}

	[Fact]
	public void ParseWildcardPattern_WhitespaceOnly_ReturnsNull() {
		var pattern = AdvancedHexSearch.ParseWildcardPattern("   ");
		Assert.Null(pattern);
	}

	[Fact]
	public void PatternElement_ExactMatch_MatchesCorrectly() {
		var element = new AdvancedHexSearch.PatternElement(0xa9);

		Assert.True(element.Matches(0xa9));
		Assert.False(element.Matches(0xa8));
		Assert.False(element.Matches(0x00));
	}

	[Fact]
	public void PatternElement_Wildcard_MatchesAnyByte() {
		var element = new AdvancedHexSearch.PatternElement(null);

		Assert.True(element.Matches(0x00));
		Assert.True(element.Matches(0xff));
		Assert.True(element.Matches(0xa9));
	}

	[Fact]
	public void PatternElement_Masked_MatchesPartial() {
		// Match A0-AF (mask high nibble only)
		var element = new AdvancedHexSearch.PatternElement(0xa0, 0xf0);

		Assert.True(element.Matches(0xa0));
		Assert.True(element.Matches(0xa5));
		Assert.True(element.Matches(0xaf));
		Assert.False(element.Matches(0xb0));
		Assert.False(element.Matches(0x90));
	}

	[Fact]
	public void SearchWildcard_FindsExactMatch() {
		var data = new byte[] { 0x00, 0xa9, 0x00, 0xb9, 0xff };
		var pattern = AdvancedHexSearch.ParseWildcardPattern("A9 00 B9")!;

		var results = AdvancedHexSearch.SearchWildcard(data, pattern);

		Assert.Single(results);
		Assert.Equal(1, results[0]);
	}

	[Fact]
	public void SearchWildcard_FindsWithWildcard() {
		var data = new byte[] { 0xa9, 0x42, 0xb9, 0xa9, 0x99, 0xb9 };
		var pattern = AdvancedHexSearch.ParseWildcardPattern("A9 ?? B9")!;

		var results = AdvancedHexSearch.SearchWildcard(data, pattern);

		Assert.Equal(2, results.Count);
		Assert.Equal(0, results[0]);
		Assert.Equal(3, results[1]);
	}

	[Fact]
	public void SearchWildcard_RespectsMaxResults() {
		var data = new byte[] { 0xff, 0xff, 0xff, 0xff };
		var pattern = AdvancedHexSearch.ParseWildcardPattern("FF")!;

		var results = AdvancedHexSearch.SearchWildcard(data, pattern, maxResults: 2);

		Assert.Equal(2, results.Count);
	}

	#endregion

	#region Range Search Tests

	[Fact]
	public void SearchRange_FindsBytesInRange() {
		var data = new byte[] { 0x00, 0x80, 0x90, 0xa0, 0xff };

		var results = AdvancedHexSearch.SearchRange(data, 0x80, 0xa0);

		Assert.Equal(3, results.Count);
		Assert.Equal(1, results[0]); // 0x80
		Assert.Equal(2, results[1]); // 0x90
		Assert.Equal(3, results[2]); // 0xa0
	}

	[Fact]
	public void SearchRange_EmptyWhenNoMatch() {
		var data = new byte[] { 0x00, 0x10, 0x20 };

		var results = AdvancedHexSearch.SearchRange(data, 0x80, 0xff);

		Assert.Empty(results);
	}

	#endregion

	#region Relative Pointer Search Tests

	[Fact]
	public void SearchRelativePointer_FindsLittleEndianPointer() {
		// Target offset 0x8100, stored as little-endian
		var data = new byte[] { 0x00, 0x81, 0xff, 0x00, 0x81, 0x00 };

		var results = AdvancedHexSearch.SearchRelativePointer(data, 0x8100, baseAddress: 0, littleEndian: true);

		Assert.Equal(2, results.Count);
		Assert.Equal(0, results[0]); // First occurrence at offset 0
		Assert.Equal(3, results[1]); // Second occurrence at offset 3
	}

	[Fact]
	public void SearchRelativePointer_FindsBigEndianPointer() {
		// Target offset 0x8100, stored as big-endian
		var data = new byte[] { 0x81, 0x00, 0xff, 0x81, 0x00, 0xff };

		var results = AdvancedHexSearch.SearchRelativePointer(data, 0x8100, baseAddress: 0, littleEndian: false);

		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void SearchRelativePointer_WithBaseAddress_AdjustsSearch() {
		// Looking for file offset 0x0100 when base address is 0x8000
		// So we're searching for 0x8100 stored in ROM
		var data = new byte[] { 0x00, 0x81, 0xff };

		var results = AdvancedHexSearch.SearchRelativePointer(data, 0x100, baseAddress: 0x8000, littleEndian: true);

		Assert.Single(results);
		Assert.Equal(0, results[0]);
	}

	#endregion

	#region Aligned Search Tests

	[Fact]
	public void SearchAligned_FindsAtAlignedOffsets() {
		var data = new byte[] { 0xa9, 0xff, 0xa9, 0xff, 0xa9, 0xff, 0xa9, 0xff };
		var pattern = new byte[] { 0xa9 };

		var results = AdvancedHexSearch.SearchAligned(data, pattern, alignment: 2);

		Assert.Equal(4, results.Count);
		Assert.Equal(0, results[0]);
		Assert.Equal(2, results[1]);
		Assert.Equal(4, results[2]);
		Assert.Equal(6, results[3]);
	}

	[Fact]
	public void SearchAligned_SkipsUnaligned() {
		// Pattern at offset 1 should be skipped with alignment 4
		var data = new byte[] { 0x00, 0xa9, 0x00, 0x00, 0xa9, 0x00, 0x00, 0x00 };
		var pattern = new byte[] { 0xa9 };

		var results = AdvancedHexSearch.SearchAligned(data, pattern, alignment: 4);

		Assert.Single(results);
		Assert.Equal(4, results[0]);
	}

	#endregion

	#region Find Absence Tests

	[Fact]
	public void FindAbsenceOf_FindsGaps() {
		// Pattern: FF FF appears at 0-1 and 4-5, gap at 2-3
		var data = new byte[] { 0xff, 0xff, 0x00, 0x00, 0xff, 0xff };
		var pattern = new byte[] { 0xff, 0xff };

		var results = AdvancedHexSearch.FindAbsenceOf(data, pattern, minGapSize: 1);

		Assert.Single(results);
		Assert.Equal(2, results[0].Start);
		Assert.Equal(2, results[0].Length);
	}

	#endregion
}

/// <summary>
/// Tests for search history.
/// </summary>
public class SearchHistoryTests {
	[Fact]
	public void SearchHistory_Add_StoresEntry() {
		var history = new SearchHistory();

		history.Add("A9 00", SearchType.Hex, 5);

		Assert.Single(history.Entries);
		Assert.Equal("A9 00", history.Entries[0].Pattern);
		Assert.Equal(SearchType.Hex, history.Entries[0].Type);
		Assert.Equal(5, history.Entries[0].ResultCount);
	}

	[Fact]
	public void SearchHistory_Add_PutsNewestFirst() {
		var history = new SearchHistory();

		history.Add("First", SearchType.Hex, 1);
		history.Add("Second", SearchType.Hex, 2);

		Assert.Equal("Second", history.Entries[0].Pattern);
		Assert.Equal("First", history.Entries[1].Pattern);
	}

	[Fact]
	public void SearchHistory_Add_RemovesDuplicates() {
		var history = new SearchHistory();

		history.Add("Pattern", SearchType.Hex, 1);
		history.Add("Other", SearchType.Hex, 2);
		history.Add("Pattern", SearchType.Hex, 3);

		Assert.Equal(2, history.Entries.Count);
		Assert.Equal("Pattern", history.Entries[0].Pattern);
		Assert.Equal(3, history.Entries[0].ResultCount); // Updated count
	}

	[Fact]
	public void SearchHistory_Add_RespectsMaxEntries() {
		var history = new SearchHistory { MaxEntries = 3 };

		history.Add("A", SearchType.Hex, 1);
		history.Add("B", SearchType.Hex, 1);
		history.Add("C", SearchType.Hex, 1);
		history.Add("D", SearchType.Hex, 1);

		Assert.Equal(3, history.Entries.Count);
		Assert.Equal("D", history.Entries[0].Pattern);
		Assert.DoesNotContain(history.Entries, e => e.Pattern == "A");
	}

	[Fact]
	public void SearchHistory_Clear_RemovesAll() {
		var history = new SearchHistory();
		history.Add("Pattern", SearchType.Hex, 1);

		history.Clear();

		Assert.Empty(history.Entries);
	}

	[Fact]
	public void SearchHistory_GetRecent_ReturnsLimited() {
		var history = new SearchHistory();
		history.Add("A", SearchType.Hex, 1);
		history.Add("B", SearchType.Hex, 1);
		history.Add("C", SearchType.Hex, 1);

		var recent = history.GetRecent(2);

		Assert.Equal(2, recent.Count);
		Assert.Equal("C", recent[0].Pattern);
		Assert.Equal("B", recent[1].Pattern);
	}
}

/// <summary>
/// Tests for data structure templates.
/// </summary>
public class DataStructureTemplateTests {
	[Fact]
	public void DataStructureTemplate_TotalSize_SumsFields() {
		var template = new DataStructureTemplate {
			Fields = {
				new StructureField("Byte1", FieldType.Byte, 1),
				new StructureField("Word1", FieldType.Word, 2),
				new StructureField("DWord1", FieldType.DWord, 4)
			}
		};

		Assert.Equal(7, template.TotalSize);
	}

	[Fact]
	public void DataStructureTemplate_ExtractValues_ByteField() {
		var template = new DataStructureTemplate {
			Fields = { new StructureField("Value", FieldType.Byte, 1) }
		};
		var data = new byte[] { 0x42 };

		var values = template.ExtractValues(data, 0);

		Assert.Equal((byte)0x42, values["Value"]);
	}

	[Fact]
	public void DataStructureTemplate_ExtractValues_WordField() {
		var template = new DataStructureTemplate {
			Fields = { new StructureField("Value", FieldType.Word, 2) }
		};
		var data = new byte[] { 0x34, 0x12 }; // Little-endian 0x1234

		var values = template.ExtractValues(data, 0);

		Assert.Equal((ushort)0x1234, values["Value"]);
	}

	[Fact]
	public void DataStructureTemplate_ExtractValues_WordBEField() {
		var template = new DataStructureTemplate {
			Fields = { new StructureField("Value", FieldType.WordBE, 2) }
		};
		var data = new byte[] { 0x12, 0x34 }; // Big-endian 0x1234

		var values = template.ExtractValues(data, 0);

		Assert.Equal((ushort)0x1234, values["Value"]);
	}

	[Fact]
	public void DataStructureTemplate_ExtractValues_MultipleFields() {
		var template = new DataStructureTemplate {
			Fields = {
				new StructureField("HP", FieldType.Byte, 1),
				new StructureField("Attack", FieldType.Byte, 1),
				new StructureField("Gold", FieldType.Word, 2)
			}
		};
		var data = new byte[] { 0x64, 0x0a, 0xe8, 0x03 }; // HP=100, Atk=10, Gold=1000

		var values = template.ExtractValues(data, 0);

		Assert.Equal((byte)100, values["HP"]);
		Assert.Equal((byte)10, values["Attack"]);
		Assert.Equal((ushort)1000, values["Gold"]);
	}

	[Fact]
	public void DataStructureTemplate_ExtractValues_WithOffset() {
		var template = new DataStructureTemplate {
			Fields = { new StructureField("Value", FieldType.Byte, 1) }
		};
		var data = new byte[] { 0x00, 0x00, 0x42, 0x00 };

		var values = template.ExtractValues(data, 2);

		Assert.Equal((byte)0x42, values["Value"]);
	}

	[Fact]
	public void DataStructureTemplate_FormatValues_ProducesReadableOutput() {
		var template = new DataStructureTemplate {
			Name = "Test",
			Fields = { new StructureField("Value", FieldType.Byte, 1) }
		};
		var values = new Dictionary<string, object> { ["Value"] = (byte)0x42 };

		var formatted = template.FormatValues(values);

		Assert.Contains("Test", formatted);
		Assert.Contains("Value", formatted);
		Assert.Contains("0x42", formatted);
	}

	[Fact]
	public void CreateNesEnemy_HasExpectedFields() {
		var template = DataStructureTemplate.CreateNesEnemy();

		Assert.Equal("NES Enemy", template.Name);
		Assert.Contains(template.Fields, f => f.Name == "HP");
		Assert.Contains(template.Fields, f => f.Name == "Attack");
		Assert.Contains(template.Fields, f => f.Name == "Defense");
		Assert.Contains(template.Fields, f => f.Name == "EXP");
		Assert.Contains(template.Fields, f => f.Name == "Gold");
	}

	[Fact]
	public void CreateNesPointerTable_HasCorrectEntryCount() {
		var template = DataStructureTemplate.CreateNesPointerTable(8);

		Assert.Equal(8, template.Fields.Count);
		Assert.All(template.Fields, f => Assert.Equal(FieldType.Pointer16, f.Type));
	}

	[Fact]
	public void CreateSnesHeader_HasRequiredFields() {
		var template = DataStructureTemplate.CreateSnesHeader();

		Assert.Equal("SNES Header", template.Name);
		Assert.Contains(template.Fields, f => f.Name == "Title");
		Assert.Contains(template.Fields, f => f.Name == "MapMode");
		Assert.Contains(template.Fields, f => f.Name == "Checksum");
	}
}

/// <summary>
/// Tests for multi-file search.
/// </summary>
public class MultiFileSearchTests {
	[Fact]
	public void MultiSearchResult_Record_StoresAllProperties() {
		var result = new MultiFileSearch.MultiSearchResult(
			@"C:\roms\test.nes",
			0x1234,
			3,
			"[A9] 00 B9"
		);

		Assert.Equal(@"C:\roms\test.nes", result.FilePath);
		Assert.Equal(0x1234, result.Offset);
		Assert.Equal(3, result.Length);
		Assert.Equal("[A9] 00 B9", result.ContextPreview);
	}
}

/// <summary>
/// Tests for SearchType enum.
/// </summary>
public class SearchTypeTests {
	[Fact]
	public void SearchType_HasExpectedValues() {
		Assert.Equal(0, (int)SearchType.Hex);
		Assert.Equal(1, (int)SearchType.Text);
		Assert.Equal(2, (int)SearchType.Wildcard);
		Assert.Equal(3, (int)SearchType.Relative);
		Assert.Equal(4, (int)SearchType.Structure);
	}
}

/// <summary>
/// Tests for FieldType enum.
/// </summary>
public class FieldTypeTests {
	[Fact]
	public void FieldType_HasExpectedValues() {
		Assert.Equal(0, (int)FieldType.Byte);
		Assert.Equal(1, (int)FieldType.SignedByte);
		Assert.Equal(2, (int)FieldType.Word);
		Assert.Equal(3, (int)FieldType.WordBE);
		Assert.Equal(4, (int)FieldType.DWord);
	}
}
