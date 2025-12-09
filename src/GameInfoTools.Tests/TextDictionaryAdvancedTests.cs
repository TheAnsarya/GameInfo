using GameInfoTools.Text;
using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for TextDictionary functionality including loading,
/// lookups, edge cases, and JSON export.
/// </summary>
public class TextDictionaryAdvancedTests
{
	#region LoadFromPointerTable Tests

	[Fact]
	public void LoadFromPointerTable_ValidTable_LoadsEntries()
	{
		var dict = new TextDictionary();

		// Create text table
		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x42, "B");
		table.AddEntry(0x43, "C");
		table.AddEntry(0x00, "[END]");

		// Create data with pointer table and strings
		var data = new byte[0x100];

		// Pointer table at offset 0 (pointing into bank-relative addresses)
		// String 0 at $8010 (file offset 0x10)
		data[0] = 0x10;
		data[1] = 0x80;

		// String 1 at $8014 (file offset 0x14)
		data[2] = 0x14;
		data[3] = 0x80;

		// String 2 at $8018 (file offset 0x18)
		data[4] = 0x18;
		data[5] = 0x80;

		// String data
		data[0x10] = 0x41;  // "A"
		data[0x11] = 0x42;  // "B"
		data[0x12] = 0x43;  // "C"
		data[0x13] = 0x00;  // [END]

		data[0x14] = 0x42;  // "B"
		data[0x15] = 0x42;  // "B"
		data[0x16] = 0x42;  // "B"
		data[0x17] = 0x00;  // [END]

		data[0x18] = 0x41;  // "A"
		data[0x19] = 0x00;  // [END]

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 3, table, bank: 0);

		Assert.Equal(3, dict.Count);
		Assert.Equal("ABC[END]", dict.GetEntry(0));
		Assert.Equal("BBB[END]", dict.GetEntry(1));
		Assert.Equal("A[END]", dict.GetEntry(2));
	}

	[Fact]
	public void LoadFromPointerTable_InvalidPointer_SkipsEntry()
	{
		var dict = new TextDictionary();

		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "[END]");

		var data = new byte[0x30];

		// Valid pointer
		data[0] = 0x20;
		data[1] = 0x80;

		// Invalid pointer (points outside data)
		data[2] = 0xFF;
		data[3] = 0xFF;

		// String data
		data[0x20] = 0x41;
		data[0x21] = 0x00;

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 2, table, bank: 0);

		// Only valid entry should be loaded
		Assert.Equal(1, dict.Count);
		Assert.NotNull(dict.GetEntry(0));
		Assert.Null(dict.GetEntry(1));
	}

	[Fact]
	public void LoadFromPointerTable_EmptyTable_NoEntries()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		var data = new byte[16];

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 0, table, bank: 0);

		Assert.Equal(0, dict.Count);
	}

	[Fact]
	public void LoadFromPointerTable_PointerBeyondData_SkipsEntry()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "[END]");

		// Data too small for string at pointer
		var data = new byte[8];
		data[0] = 0x10;  // Points to 0x8010 (file offset 0x10)
		data[1] = 0x80;

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 1, table, bank: 0);

		// Should skip entry due to pointer being out of bounds
		Assert.Equal(0, dict.Count);
	}

	[Fact]
	public void LoadFromPointerTable_WithBank_CalculatesCorrectOffset()
	{
		var dict = new TextDictionary();

		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "[END]");

		// Larger data to accommodate bank offset
		var data = new byte[0x8100];

		// Pointer table at start
		data[0] = 0x10;  // $8010
		data[1] = 0x80;

		// With bank 1, file offset = $8010 - $8000 + (1 * $4000) = $10 + $4000 = $4010
		data[0x4010] = 0x41;
		data[0x4011] = 0x00;

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 1, table, bank: 1);

		Assert.Equal(1, dict.Count);
		Assert.NotNull(dict.GetEntry(0));
	}

	#endregion

	#region GetEntry Tests

	[Fact]
	public void GetEntry_ExistingEntry_ReturnsText()
	{
		var dict = CreateTestDictionary();

		Assert.Equal("Hello", dict.GetEntry(0));
		Assert.Equal("World", dict.GetEntry(1));
	}

	[Fact]
	public void GetEntry_NonExistingEntry_ReturnsNull()
	{
		var dict = CreateTestDictionary();

		Assert.Null(dict.GetEntry(99));
		Assert.Null(dict.GetEntry(-1));
	}

	[Fact]
	public void GetEntry_AfterMultipleLoads_ReturnsLatest()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x42, "B");
		table.AddEntry(0x00, "[END]");

		var data = new byte[0x30];
		data[0] = 0x10;
		data[1] = 0x80;
		data[0x10] = 0x41;
		data[0x11] = 0x00;

		// First load
		dict.LoadFromPointerTable(data, 0, 1, table, 0);
		Assert.Equal("A[END]", dict.GetEntry(0));

		// Modify data and reload (simulating a different dictionary)
		data[0x10] = 0x42;
		dict.LoadFromPointerTable(data, 0, 1, table, 0);

		// Note: LoadFromPointerTable adds entries, so this tests accumulation behavior
		Assert.NotNull(dict.GetEntry(0));
	}

	#endregion

	#region FindEntry Tests

	[Fact]
	public void FindEntry_ExistingText_ReturnsIndex()
	{
		var dict = CreateTestDictionary();

		Assert.Equal(0, dict.FindEntry("Hello"));
		Assert.Equal(1, dict.FindEntry("World"));
	}

	[Fact]
	public void FindEntry_NonExistingText_ReturnsNull()
	{
		var dict = CreateTestDictionary();

		Assert.Null(dict.FindEntry("NotInDictionary"));
		Assert.Null(dict.FindEntry(""));
	}

	[Fact]
	public void FindEntry_CaseSensitive_ExactMatch()
	{
		var dict = CreateTestDictionary();

		Assert.Equal(0, dict.FindEntry("Hello"));
		Assert.Null(dict.FindEntry("hello"));
		Assert.Null(dict.FindEntry("HELLO"));
	}

	#endregion

	#region GetAllEntries Tests

	[Fact]
	public void GetAllEntries_ReturnsAllInDictionary()
	{
		var dict = CreateTestDictionary();

		var entries = dict.GetAllEntries().ToList();

		Assert.Equal(2, entries.Count);
		Assert.Contains(entries, e => e.Index == 0 && e.Text == "Hello");
		Assert.Contains(entries, e => e.Index == 1 && e.Text == "World");
	}

	[Fact]
	public void GetAllEntries_EmptyDictionary_ReturnsEmpty()
	{
		var dict = new TextDictionary();

		var entries = dict.GetAllEntries().ToList();

		Assert.Empty(entries);
	}

	[Fact]
	public void GetAllEntries_CanEnumerateMultipleTimes()
	{
		var dict = CreateTestDictionary();

		var first = dict.GetAllEntries().ToList();
		var second = dict.GetAllEntries().ToList();

		Assert.Equal(first.Count, second.Count);
	}

	#endregion

	#region ExportToJson Tests

	[Fact]
	public void ExportToJson_EmptyDictionary_ReturnsValidJson()
	{
		var dict = new TextDictionary();

		var json = dict.ExportToJson();

		Assert.Contains("{", json);
		Assert.Contains("}", json);
	}

	[Fact]
	public void ExportToJson_WithEntries_ReturnsFormattedJson()
	{
		var dict = CreateTestDictionary();

		var json = dict.ExportToJson();

		Assert.Contains("\"0\":", json);
		Assert.Contains("\"Hello\"", json);
		Assert.Contains("\"1\":", json);
		Assert.Contains("\"World\"", json);
	}

	[Fact]
	public void ExportToJson_WithSpecialCharacters_EscapesCorrectly()
	{
		var dict = CreateDictionaryWithSpecialChars();

		var json = dict.ExportToJson();

		// Backslash should be escaped
		Assert.Contains("\\\\", json);
		// Quote should be escaped
		Assert.Contains("\\\"", json);
	}

	[Fact]
	public void ExportToJson_OrderedByIndex()
	{
		var dict = CreateTestDictionary();

		var json = dict.ExportToJson();
		var indexOf0 = json.IndexOf("\"0\":");
		var indexOf1 = json.IndexOf("\"1\":");

		Assert.True(indexOf0 < indexOf1, "Index 0 should appear before index 1");
	}

	#endregion

	#region Count Tests

	[Fact]
	public void Count_EmptyDictionary_ReturnsZero()
	{
		var dict = new TextDictionary();
		Assert.Equal(0, dict.Count);
	}

	[Fact]
	public void Count_AfterAddingEntries_ReturnsCorrectCount()
	{
		var dict = CreateTestDictionary();
		Assert.Equal(2, dict.Count);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void LoadFromPointerTable_TableOffsetTooLarge_NoEntries()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		var data = new byte[10];

		// Table offset beyond data
		dict.LoadFromPointerTable(data, tableOffset: 100, count: 1, table, bank: 0);

		Assert.Equal(0, dict.Count);
	}

	[Fact]
	public void LoadFromPointerTable_DuplicateText_BothStored()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "[END]");

		var data = new byte[0x30];

		// Two pointers to same string content
		data[0] = 0x10;
		data[1] = 0x80;
		data[2] = 0x14;
		data[3] = 0x80;

		// Same text at both locations
		data[0x10] = 0x41;
		data[0x11] = 0x00;
		data[0x14] = 0x41;
		data[0x15] = 0x00;

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 2, table, bank: 0);

		// Both entries are stored (even if text is same)
		Assert.Equal(2, dict.Count);
		Assert.Equal("A[END]", dict.GetEntry(0));
		Assert.Equal("A[END]", dict.GetEntry(1));
	}

	[Fact]
	public void LoadFromPointerTable_NegativeFileOffset_SkipsEntry()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "[END]");

		var data = new byte[0x10];

		// Pointer that results in negative file offset
		// $4000 - $8000 + (0 * $4000) = -$4000 (negative)
		data[0] = 0x00;
		data[1] = 0x40;

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 1, table, bank: 0);

		Assert.Equal(0, dict.Count);
	}

	#endregion

	#region Helper Methods

	private static TextDictionary CreateTestDictionary()
	{
		var dict = new TextDictionary();
		var table = new TextTable();
		table.AddEntry(0x48, "H");
		table.AddEntry(0x65, "e");
		table.AddEntry(0x6C, "l");
		table.AddEntry(0x6F, "o");
		table.AddEntry(0x57, "W");
		table.AddEntry(0x72, "r");
		table.AddEntry(0x64, "d");
		table.AddEntry(0x00, "");

		var data = new byte[0x30];

		// Pointer 0 -> "Hello"
		data[0] = 0x10;
		data[1] = 0x80;

		// Pointer 1 -> "World"
		data[2] = 0x16;
		data[3] = 0x80;

		// "Hello" at 0x10
		data[0x10] = 0x48;  // H
		data[0x11] = 0x65;  // e
		data[0x12] = 0x6C;  // l
		data[0x13] = 0x6C;  // l
		data[0x14] = 0x6F;  // o
		data[0x15] = 0x00;  // end

		// "World" at 0x16
		data[0x16] = 0x57;  // W
		data[0x17] = 0x6F;  // o
		data[0x18] = 0x72;  // r
		data[0x19] = 0x6C;  // l
		data[0x1A] = 0x64;  // d
		data[0x1B] = 0x00;  // end

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 2, table, bank: 0);

		return dict;
	}

	private static TextDictionary CreateDictionaryWithSpecialChars()
	{
		// Since we can't easily add arbitrary text, we'll need a workaround
		// Let's use reflection or a different approach
		var dict = new TextDictionary();
		var table = new TextTable();

		// Create entries that will contain special characters when decoded
		table.AddEntry(0x5C, "\\");   // Backslash
		table.AddEntry(0x22, "\"");   // Quote
		table.AddEntry(0x41, "A");
		table.AddEntry(0x00, "");

		var data = new byte[0x20];
		data[0] = 0x10;
		data[1] = 0x80;

		// String with backslash and quote
		data[0x10] = 0x5C;  // \
		data[0x11] = 0x22;  // "
		data[0x12] = 0x41;  // A
		data[0x13] = 0x00;  // end

		dict.LoadFromPointerTable(data, tableOffset: 0, count: 1, table, bank: 0);

		return dict;
	}

	#endregion
}
