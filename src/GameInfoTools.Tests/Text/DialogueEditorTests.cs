using GameInfoTools.Text;

namespace GameInfoTools.Tests.Text;

/// <summary>
/// Tests for the DialogueEditor service.
/// </summary>
public class DialogueEditorTests {
	private static byte[] CreateTestRomData() {
		var data = new byte[0x2000];

		// Set up a simple pointer table at 0x100 (4 entries, 2 bytes each)
		// Pointers are relative to TextBaseOffset of 0x200
		int ptrOffset = 0x100;
		data[ptrOffset + 0] = 0x00; // -> 0x200
		data[ptrOffset + 1] = 0x00;
		data[ptrOffset + 2] = 0x10; // -> 0x210
		data[ptrOffset + 3] = 0x00;
		data[ptrOffset + 4] = 0x20; // -> 0x220
		data[ptrOffset + 5] = 0x00;
		data[ptrOffset + 6] = 0x40; // -> 0x240
		data[ptrOffset + 7] = 0x00;

		// Text data at 0x200
		// Entry 0: "Hello" (using ASCII)
		int textOffset = 0x200;
		data[textOffset + 0] = 0x48; // H
		data[textOffset + 1] = 0x65; // e
		data[textOffset + 2] = 0x6c; // l
		data[textOffset + 3] = 0x6c; // l
		data[textOffset + 4] = 0x6f; // o
		data[textOffset + 5] = 0x00; // End marker

		// Entry 1: "World"
		textOffset = 0x210;
		data[textOffset + 0] = 0x57; // W
		data[textOffset + 1] = 0x6f; // o
		data[textOffset + 2] = 0x72; // r
		data[textOffset + 3] = 0x6c; // l
		data[textOffset + 4] = 0x64; // d
		data[textOffset + 5] = 0x00; // End marker

		// Entry 2: "Line1[LINE]Line2"
		textOffset = 0x220;
		data[textOffset + 0] = 0x4c; // L
		data[textOffset + 1] = 0x69; // i
		data[textOffset + 2] = 0x6e; // n
		data[textOffset + 3] = 0x65; // e
		data[textOffset + 4] = 0x31; // 1
		data[textOffset + 5] = 0xfc; // LINE control code
		data[textOffset + 6] = 0x4c; // L
		data[textOffset + 7] = 0x69; // i
		data[textOffset + 8] = 0x6e; // n
		data[textOffset + 9] = 0x65; // e
		data[textOffset + 10] = 0x32; // 2
		data[textOffset + 11] = 0x00; // End marker

		// Entry 3: "Wait[WAIT:10]Done"
		textOffset = 0x240;
		data[textOffset + 0] = 0x57; // W
		data[textOffset + 1] = 0x61; // a
		data[textOffset + 2] = 0x69; // i
		data[textOffset + 3] = 0x74; // t
		data[textOffset + 4] = 0xfe; // WAIT control code
		data[textOffset + 5] = 0x10; // Parameter (16 frames)
		data[textOffset + 6] = 0x44; // D
		data[textOffset + 7] = 0x6f; // o
		data[textOffset + 8] = 0x6e; // n
		data[textOffset + 9] = 0x65; // e
		data[textOffset + 10] = 0x00; // End marker

		return data;
	}

	private static DialogueEditor.DialogueSchema CreateTestSchema() {
		return new DialogueEditor.DialogueSchema {
			Name = "Test Schema",
			PointerTableOffset = 0x100,
			PointerSize = 2,
			EntryCount = 4,
			TextBaseOffset = 0x200,
			BankOffset = 0,
			EndMarker = 0x00,
			IsPointerRelative = true,
			ControlCodes = {
				new DialogueEditor.ControlCode { Code = 0xfc, Name = "LINE", DisplayAs = "\n", Description = "New line" },
				new DialogueEditor.ControlCode { Code = 0xfd, Name = "PAGE", DisplayAs = "\n\n", Description = "New page" },
				new DialogueEditor.ControlCode { Code = 0xfe, Name = "WAIT", DisplayAs = "...", ParamBytes = 1, Description = "Wait frames" },
				new DialogueEditor.ControlCode { Code = 0xff, Name = "END", DisplayAs = "", Description = "End of text" }
			}
		};
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var data = new byte[100];
		var editor = new DialogueEditor(data);
		Assert.NotNull(editor);
		Assert.Empty(editor.Entries);
	}

	[Fact]
	public void Constructor_WithEmptyData_CreatesInstance() {
		var data = Array.Empty<byte>();
		var editor = new DialogueEditor(data);
		Assert.NotNull(editor);
	}

	#endregion

	#region Schema Tests

	[Fact]
	public void SetSchema_ConfiguresEditor() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);
		var schema = CreateTestSchema();

		editor.SetSchema(schema);

		Assert.Equal(schema, editor.Schema);
	}

	[Fact]
	public void SetSchema_WithControlCodes_BuildsLookup() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);
		var schema = CreateTestSchema();

		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Verify control codes work by checking entry with LINE code
		var entry = editor.GetEntry(2);
		Assert.NotNull(entry);
		Assert.Contains("[LINE]", entry.RawText);
	}

	[Fact]
	public void CreateNesSchema_ReturnsValidSchema() {
		var schema = DialogueEditor.CreateNesSchema(0x8000, 100, 0xa000);

		Assert.Equal("NES Dialogue", schema.Name);
		Assert.Equal(0x8000, schema.PointerTableOffset);
		Assert.Equal(2, schema.PointerSize);
		Assert.Equal(100, schema.EntryCount);
		Assert.Equal(0xa000, schema.TextBaseOffset);
		Assert.Equal(0x8000, schema.BankOffset);
		Assert.False(schema.IsPointerRelative);
		Assert.NotEmpty(schema.ControlCodes);
	}

	[Fact]
	public void CreateSnesSchema_ReturnsValidSchema() {
		var schema = DialogueEditor.CreateSnesSchema(0x10000, 200, 0x20000);

		Assert.Equal("SNES Dialogue", schema.Name);
		Assert.Equal(0x10000, schema.PointerTableOffset);
		Assert.Equal(2, schema.PointerSize);
		Assert.Equal(200, schema.EntryCount);
		Assert.Equal(0x20000, schema.TextBaseOffset);
		Assert.Equal(0, schema.BankOffset);
		Assert.True(schema.IsPointerRelative);
		Assert.NotEmpty(schema.ControlCodes);
	}

	#endregion

	#region Text Table Tests

	[Fact]
	public void LoadAsciiTable_LoadsStandardCharacters() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		// SetSchema first, then load ASCII table (schema clears text tables)
		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Equal("Hello", entry.DisplayText);
	}

	[Fact]
	public void LoadTextTable_ParsesTblFormat() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		string tbl = @"
; Comment line
48=H
65=e
6c=l
6f=o
57=W
72=r
64=d
# Another comment
31=1
32=2
";

		// SetSchema first, then load text table (schema clears text tables)
		editor.SetSchema(CreateTestSchema());
		editor.LoadTextTable(tbl);
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Equal("Hello", entry.DisplayText);
	}

	[Fact]
	public void LoadTextTable_HandlesMultiCharacterEntries() {
		var data = new byte[0x100];
		data[0] = 0x10; // DTE for "th"
		data[1] = 0x65; // 'e'
		data[2] = 0x00; // End

		var editor = new DialogueEditor(data);

		var schema = new DialogueEditor.DialogueSchema {
			Name = "DTE Test",
			PointerTableOffset = 0,
			PointerSize = 0,
			EntryCount = 0,
			TextBaseOffset = 0,
			EndMarker = 0x00
		};

		// SetSchema first, then load text table
		editor.SetSchema(schema);

		string tbl = @"
10=th
65=e
";
		editor.LoadTextTable(tbl);
		editor.LoadFromBlock(0, 10);

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Equal("the", entry.DisplayText);
	}

	#endregion

	#region Load Dialogue Tests

	[Fact]
	public void LoadDialogue_LoadsAllEntries() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		Assert.Equal(4, editor.Entries.Count);
	}

	[Fact]
	public void LoadDialogue_DecodesSimpleText() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		Assert.Equal("Hello", editor.Entries[0].DisplayText);
		Assert.Equal("World", editor.Entries[1].DisplayText);
	}

	[Fact]
	public void LoadDialogue_DecodesControlCodes() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Entry 2 has LINE control code
		var entry = editor.GetEntry(2);
		Assert.NotNull(entry);
		Assert.Contains("[LINE]", entry.RawText);
		Assert.Contains("\n", entry.DisplayText);
	}

	[Fact]
	public void LoadDialogue_DecodesControlCodesWithParameters() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Entry 3 has WAIT control code with parameter
		var entry = editor.GetEntry(3);
		Assert.NotNull(entry);
		Assert.Contains("[WAIT:10]", entry.RawText);
	}

	[Fact]
	public void LoadDialogue_SetsRomOffset() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		Assert.Equal(0x200, editor.Entries[0].RomOffset);
		Assert.Equal(0x210, editor.Entries[1].RomOffset);
	}

	[Fact]
	public void LoadDialogue_SetsLength() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// "Hello" + end marker = 6 bytes
		Assert.Equal(6, editor.Entries[0].Length);
	}

	[Fact]
	public void LoadDialogue_WithoutSchema_ThrowsException() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		Assert.Throws<InvalidOperationException>(() => editor.LoadDialogue());
	}

	[Fact]
	public void LoadFromBlock_LoadsSequentialEntries() {
		var data = new byte[100];
		// Two entries back to back: "AB" and "CD"
		data[0] = 0x41; // A
		data[1] = 0x42; // B
		data[2] = 0x00; // End
		data[3] = 0x43; // C
		data[4] = 0x44; // D
		data[5] = 0x00; // End
						// Fill remaining with non-zero to avoid phantom entries
		for (int i = 6; i < 100; i++) data[i] = 0xff;

		var editor = new DialogueEditor(data);
		var schema = new DialogueEditor.DialogueSchema {
			Name = "Block Test",
			EndMarker = 0x00
		};
		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadFromBlock(0, 6); // Only read the 6 bytes with data

		Assert.Equal(2, editor.Entries.Count);
		Assert.Equal("AB", editor.Entries[0].DisplayText);
		Assert.Equal("CD", editor.Entries[1].DisplayText);
	}

	#endregion

	#region Entry Access Tests

	[Fact]
	public void GetEntry_ReturnsCorrectEntry() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(1);

		Assert.NotNull(entry);
		Assert.Equal("World", entry.DisplayText);
	}

	[Fact]
	public void GetEntry_WithInvalidId_ReturnsNull() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(999);

		Assert.Null(entry);
	}

	[Fact]
	public void GetEntriesByType_ReturnsMatchingEntries() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Set some types
		editor.Entries[0].Type = DialogueEditor.DialogueType.NpcSpeech;
		editor.Entries[1].Type = DialogueEditor.DialogueType.NpcSpeech;
		editor.Entries[2].Type = DialogueEditor.DialogueType.SystemMessage;

		var npcEntries = editor.GetEntriesByType(DialogueEditor.DialogueType.NpcSpeech);

		Assert.Equal(2, npcEntries.Count);
	}

	#endregion

	#region Search Tests

	[Fact]
	public void Search_FindsMatchingText() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("World");

		Assert.Single(results);
		Assert.Equal(1, results[0].Id);
	}

	[Fact]
	public void Search_IsCaseInsensitiveByDefault() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("hello");

		Assert.Single(results);
	}

	[Fact]
	public void Search_CaseSensitiveOption() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("hello", caseSensitive: true);

		Assert.Empty(results); // "Hello" doesn't match "hello"
	}

	[Fact]
	public void Search_FindsPartialMatches() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("ell"); // Matches "Hello"

		Assert.Single(results);
	}

	[Fact]
	public void Search_ReturnsMultipleMatches() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("l"); // Matches "Hello", "World", "Line1", "Line2"

		Assert.True(results.Count >= 3);
	}

	#endregion

	#region Encode/Decode Tests

	[Fact]
	public void EncodeText_EncodesSimpleText() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();

		var encoded = editor.EncodeText("Hi");

		Assert.NotNull(encoded);
		Assert.Equal(0x48, encoded[0]); // H
		Assert.Equal(0x69, encoded[1]); // i
		Assert.Equal(0x00, encoded[2]); // End marker
	}

	[Fact]
	public void EncodeText_EncodesControlCodes() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();

		var encoded = editor.EncodeText("A[LINE]B");

		Assert.NotNull(encoded);
		Assert.Equal(0x41, encoded[0]); // A
		Assert.Equal(0xfc, encoded[1]); // LINE code
		Assert.Equal(0x42, encoded[2]); // B
		Assert.Equal(0x00, encoded[3]); // End marker
	}

	[Fact]
	public void EncodeText_EncodesControlCodesWithParameters() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();

		var encoded = editor.EncodeText("A[WAIT:20]B");

		Assert.NotNull(encoded);
		Assert.Equal(0x41, encoded[0]); // A
		Assert.Equal(0xfe, encoded[1]); // WAIT code
		Assert.Equal(0x20, encoded[2]); // Parameter (32 decimal)
		Assert.Equal(0x42, encoded[3]); // B
		Assert.Equal(0x00, encoded[4]); // End marker
	}

	[Fact]
	public void EncodeText_HandlesRawHexBytes() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();

		var encoded = editor.EncodeText("A[AB]B");

		Assert.NotNull(encoded);
		Assert.Equal(0x41, encoded[0]); // A
		Assert.Equal(0xab, encoded[1]); // Raw byte
		Assert.Equal(0x42, encoded[2]); // B
	}

	#endregion

	#region Update Entry Tests

	[Fact]
	public void UpdateEntry_UpdatesText() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 20; // Allow expansion

		bool result = editor.UpdateEntry(0, "Hi");

		Assert.True(result);
		Assert.Equal("Hi", entry.RawText);
		Assert.True(entry.IsModified);
	}

	[Fact]
	public void UpdateEntry_WritesToRomData() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 20;

		editor.UpdateEntry(0, "Test");

		// Verify data was written to ROM
		Assert.Equal(0x54, data[0x200]); // T
		Assert.Equal(0x65, data[0x201]); // e
		Assert.Equal(0x73, data[0x202]); // s
		Assert.Equal(0x74, data[0x203]); // t
	}

	[Fact]
	public void UpdateEntry_RejectsTextTooLong() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 3; // Very short

		bool result = editor.UpdateEntry(0, "This is way too long");

		Assert.False(result);
	}

	[Fact]
	public void UpdateEntry_WithInvalidId_ReturnsFalse() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		bool result = editor.UpdateEntry(999, "Test");

		Assert.False(result);
	}

	[Fact]
	public void UpdateEntry_PadsToMaxLength() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 10;

		editor.UpdateEntry(0, "Hi");

		// Bytes after "Hi" + end marker should be fill bytes (end marker 0x00)
		Assert.Equal(0x48, data[0x200]); // H
		Assert.Equal(0x69, data[0x201]); // i
		Assert.Equal(0x00, data[0x202]); // End marker
		Assert.Equal(0x00, data[0x203]); // Fill
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void ValidateText_ValidText_ReturnsTrue() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 20;

		var (isValid, error) = editor.ValidateText(0, "Valid");

		Assert.True(isValid);
		Assert.Null(error);
	}

	[Fact]
	public void ValidateText_TextTooLong_ReturnsFalse() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		entry.MaxLength = 5;

		var (isValid, error) = editor.ValidateText(0, "This text is definitely too long");

		Assert.False(isValid);
		Assert.Contains("too long", error);
	}

	[Fact]
	public void ValidateText_InvalidId_ReturnsFalse() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var (isValid, error) = editor.ValidateText(999, "Test");

		Assert.False(isValid);
		Assert.Contains("not found", error);
	}

	#endregion

	#region Export/Import JSON Tests

	[Fact]
	public void ExportToJson_CreatesValidJson() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		string json = editor.ExportToJson();

		Assert.NotEmpty(json);
		Assert.Contains("Hello", json);
		Assert.Contains("World", json);
	}

	[Fact]
	public void ImportFromJson_UpdatesEntries() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Set max lengths to allow updates
		foreach (var entry in editor.Entries) {
			entry.MaxLength = 50;
		}

		string json = @"[
			{""Id"": 0, ""RawText"": ""Modified""},
			{""Id"": 1, ""RawText"": ""Changed""}
		]";

		var (updated, errors) = editor.ImportFromJson(json);

		Assert.Equal(2, updated);
		Assert.Equal(0, errors);
		Assert.Equal("Modified", editor.GetEntry(0)?.RawText);
		Assert.Equal("Changed", editor.GetEntry(1)?.RawText);
	}

	[Fact]
	public void ImportFromJson_ReportsErrors() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Max length is very short
		editor.GetEntry(0)!.MaxLength = 3;
		editor.GetEntry(1)!.MaxLength = 3;

		string json = @"[
			{""Id"": 0, ""RawText"": ""This is too long""},
			{""Id"": 1, ""RawText"": ""OK""}
		]";

		var (updated, errors) = editor.ImportFromJson(json);

		Assert.Equal(1, updated); // Only "OK" fits
		Assert.Equal(1, errors);  // "This is too long" fails
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var stats = editor.GetStatistics();

		Assert.Equal(4, stats.EntryCount);
		Assert.True(stats.TotalCharacters > 0);
		Assert.Equal(0, stats.ModifiedCount);
	}

	[Fact]
	public void GetStatistics_TracksModifiedEntries() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Modify some entries
		editor.GetEntry(0)!.MaxLength = 50;
		editor.GetEntry(1)!.MaxLength = 50;
		editor.UpdateEntry(0, "Modified");
		editor.UpdateEntry(1, "Also Modified");

		var stats = editor.GetStatistics();

		Assert.Equal(2, stats.ModifiedCount);
	}

	[Fact]
	public void GetStatistics_CalculatesSpaceUsage() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Set max lengths
		foreach (var entry in editor.Entries) {
			entry.MaxLength = 100;
		}

		var stats = editor.GetStatistics();

		Assert.True(stats.UsedSpace > 0);
		Assert.Equal(400, stats.MaxSpace); // 4 entries x 100 bytes
		Assert.Equal(stats.MaxSpace - stats.UsedSpace, stats.SpaceRemaining);
	}

	#endregion

	#region DialogueType Tests

	[Fact]
	public void DialogueType_AllValuesExist() {
		var values = Enum.GetValues<DialogueEditor.DialogueType>();

		Assert.Contains(DialogueEditor.DialogueType.Normal, values);
		Assert.Contains(DialogueEditor.DialogueType.NpcSpeech, values);
		Assert.Contains(DialogueEditor.DialogueType.SystemMessage, values);
		Assert.Contains(DialogueEditor.DialogueType.MenuOption, values);
		Assert.Contains(DialogueEditor.DialogueType.ItemDescription, values);
		Assert.Contains(DialogueEditor.DialogueType.BattleMessage, values);
		Assert.Contains(DialogueEditor.DialogueType.Title, values);
		Assert.Contains(DialogueEditor.DialogueType.Cutscene, values);
	}

	#endregion

	#region Entry Properties Tests

	[Fact]
	public void DialogueEntry_DefaultValues() {
		var entry = new DialogueEditor.DialogueEntry();

		Assert.Equal(0, entry.Id);
		Assert.Equal("", entry.Key);
		Assert.Equal("", entry.RawText);
		Assert.Equal("", entry.DisplayText);
		Assert.Equal(DialogueEditor.DialogueType.Normal, entry.Type);
		Assert.Equal("", entry.Speaker);
		Assert.Equal("", entry.Notes);
		Assert.Equal(0, entry.RomOffset);
		Assert.Equal(0, entry.Length);
		Assert.Equal(0, entry.MaxLength);
		Assert.False(entry.IsModified);
		Assert.Empty(entry.RawBytes);
	}

	[Fact]
	public void DialogueEntry_GeneratesKey() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		Assert.Equal("MSG_0000", editor.GetEntry(0)?.Key);
		Assert.Equal("MSG_0001", editor.GetEntry(1)?.Key);
		Assert.Equal("MSG_0002", editor.GetEntry(2)?.Key);
	}

	#endregion

	#region ControlCode Tests

	[Fact]
	public void ControlCode_DefaultValues() {
		var code = new DialogueEditor.ControlCode();

		Assert.Equal(0, code.Code);
		Assert.Equal("", code.Name);
		Assert.Equal("", code.DisplayAs);
		Assert.Equal(0, code.ParamBytes);
		Assert.Null(code.Description);
	}

	[Fact]
	public void ControlCode_WithParameters_DecodesCorrectly() {
		var data = new byte[20];
		data[0] = 0xfe; // WAIT
		data[1] = 0xff; // 255 frames
		data[2] = 0x41; // A
		data[3] = 0x00; // End

		var editor = new DialogueEditor(data);
		var schema = new DialogueEditor.DialogueSchema {
			Name = "Test",
			EndMarker = 0x00,
			ControlCodes = {
				new DialogueEditor.ControlCode { Code = 0xfe, Name = "WAIT", DisplayAs = "...", ParamBytes = 1 }
			}
		};
		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadFromBlock(0, 10);

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Contains("[WAIT:FF]", entry.RawText);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void LoadDialogue_HandlesEmptyText() {
		var data = new byte[0x300];
		// Pointer to empty string
		data[0x100] = 0x00;
		data[0x101] = 0x00;
		// Empty string (just end marker)
		data[0x200] = 0x00;

		var editor = new DialogueEditor(data);
		var schema = new DialogueEditor.DialogueSchema {
			Name = "Test",
			PointerTableOffset = 0x100,
			PointerSize = 2,
			EntryCount = 1,
			TextBaseOffset = 0x200,
			EndMarker = 0x00,
			IsPointerRelative = true
		};
		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Equal("", entry.DisplayText);
		Assert.Equal(1, entry.Length); // Just the end marker
	}

	[Fact]
	public void LoadDialogue_HandlesUnknownBytes() {
		var data = new byte[0x300];
		data[0x100] = 0x00;
		data[0x101] = 0x00;
		data[0x200] = 0x41; // A
		data[0x201] = 0x99; // Unknown byte (not in ASCII table)
		data[0x202] = 0x42; // B
		data[0x203] = 0x00; // End

		var editor = new DialogueEditor(data);
		var schema = new DialogueEditor.DialogueSchema {
			Name = "Test",
			PointerTableOffset = 0x100,
			PointerSize = 2,
			EntryCount = 1,
			TextBaseOffset = 0x200,
			EndMarker = 0x00,
			IsPointerRelative = true
		};
		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var entry = editor.GetEntry(0);
		Assert.NotNull(entry);
		Assert.Contains("[99]", entry.RawText); // Unknown shows as hex
		Assert.Contains("?", entry.DisplayText); // Unknown shows as ?
	}

	[Fact]
	public void LoadDialogue_HandlesInvalidPointers() {
		var data = new byte[0x100];
		// Pointer points way outside data
		data[0] = 0xff;
		data[1] = 0xff;

		var editor = new DialogueEditor(data);
		var schema = new DialogueEditor.DialogueSchema {
			Name = "Test",
			PointerTableOffset = 0,
			PointerSize = 2,
			EntryCount = 1,
			TextBaseOffset = 0,
			EndMarker = 0x00,
			IsPointerRelative = true
		};
		editor.SetSchema(schema);
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		// Should handle gracefully (skip invalid pointer)
		Assert.Empty(editor.Entries);
	}

	[Fact]
	public void Search_WithEmptyQuery_ReturnsAllEntries() {
		var data = CreateTestRomData();
		var editor = new DialogueEditor(data);

		editor.SetSchema(CreateTestSchema());
		editor.LoadAsciiTable();
		editor.LoadDialogue();

		var results = editor.Search("");

		Assert.Equal(4, results.Count);
	}

	#endregion
}
