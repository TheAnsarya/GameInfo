using DarkReposEditor.Core.Interfaces;
using DarkReposEditor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkReposEditor.Core.Tests.Services;

public class TextEditorServiceTests
{
	private readonly ITextEditorService _service;

	public TextEditorServiceTests()
	{
		_service = new TextEditorService();
	}

	#region Table File Parsing Tests

	[Fact]
	public void LoadTableFile_SimpleAscii_ParsesCorrectly()
	{
		var content = @"
20= 
41=A
42=B
43=C
00=<end>
";
		var table = _service.LoadTableFile(content);

		table.SingleByteMappings.Should().ContainKey(0x20);
		table.SingleByteMappings[0x20].Should().Be(" ");
		table.SingleByteMappings[0x41].Should().Be("A");
		table.SingleByteMappings[0x42].Should().Be("B");
		table.SingleByteMappings[0x43].Should().Be("C");
		table.EndOfStringMarker.Should().BeEquivalentTo(new byte[] { 0x00 });
	}

	[Fact]
	public void LoadTableFile_WithControlCodes_ParsesCorrectly()
	{
		var content = @"
41=A
FE=<wait>
FF=<end>
";
		var table = _service.LoadTableFile(content);

		table.ControlCodes.Should().ContainKey(new byte[] { 0xfe });
		table.ControlCodes[new byte[] { 0xfe }].Should().Be("<wait>");
	}

	[Fact]
	public void LoadTableFile_WithMultiByteSequence_ParsesCorrectly()
	{
		var content = @"
41=A
FE01=Player
FE02=Monster
";
		var table = _service.LoadTableFile(content);

		table.MultiByteMappings.Should().ContainKey(new byte[] { 0xfe, 0x01 });
		table.MultiByteMappings[new byte[] { 0xfe, 0x01 }].Should().Be("Player");
		table.MaxSequenceLength.Should().Be(2);
	}

	[Fact]
	public void LoadTableFile_IgnoresComments()
	{
		var content = @"
// This is a comment
# This is also a comment
41=A
";
		var table = _service.LoadTableFile(content);

		table.SingleByteMappings.Should().ContainKey(0x41);
		table.SingleByteMappings.Should().HaveCount(1);
	}

	[Fact]
	public void LoadTableFile_LineBreakMarker_ParsesCorrectly()
	{
		var content = @"
41=A
0A=<line>
";
		var table = _service.LoadTableFile(content);

		table.EndOfLineMarker.Should().BeEquivalentTo(new byte[] { 0x0a });
		table.SingleByteMappings[0x0a].Should().Be("\n");
	}

	#endregion

	#region Table File Generation Tests

	[Fact]
	public void GenerateTableFile_RoundTrips()
	{
		var original = @"
20= 
41=A
42=B
00=<end>
";
		var table = _service.LoadTableFile(original);
		var generated = _service.GenerateTableFile(table);
		var reparsed = _service.LoadTableFile(generated);

		reparsed.SingleByteMappings.Should().BeEquivalentTo(table.SingleByteMappings);
	}

	#endregion

	#region Decode Tests

	[Fact]
	public void DecodeText_SimpleString_DecodesCorrectly()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 0x48, 0x65, 0x6c, 0x6c, 0x6f }; // "Hello"

		var result = _service.DecodeText(data, 0, data.Length, table);

		result.Should().Be("Hello");
	}

	[Fact]
	public void DecodeText_WithTerminator_StopsAtTerminator()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 0x48, 0x69, 0x00, 0x42, 0x79, 0x65 }; // "Hi\0Bye"

		var result = _service.DecodeText(data, 0, data.Length, table);

		result.Should().Be("Hi");
	}

	[Fact]
	public void DecodeText_WithOffset_StartsAtCorrectPosition()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 0x41, 0x42, 0x43, 0x44 }; // "ABCD"

		var result = _service.DecodeText(data, 2, 2, table);

		result.Should().Be("CD");
	}

	[Fact]
	public void DecodeText_UnknownBytes_ShowsHex()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 0x41, 0xff, 0x42 }; // "A" + unknown + "B"

		var result = _service.DecodeText(data, 0, data.Length, table);

		result.Should().Be("A[$ff]B");
	}

	[Fact]
	public void DecodeText_WithControlCodes_IncludesControlCodes()
	{
		var table = CreateSimpleAsciiTable();
		table.ControlCodes[new byte[] { 0xfe }] = "<wait>";
		var data = new byte[] { 0x48, 0x69, 0xfe }; // "Hi<wait>"

		var result = _service.DecodeText(data, 0, data.Length, table);

		result.Should().Be("Hi<wait>");
	}

	[Fact]
	public void DecodeText_WithDte_ExpansionCorrectly()
	{
		var table = CreateSimpleAsciiTable();
		table.DteMappings[0x80] = "th";
		var data = new byte[] { 0x80, 0x65 }; // "the"

		var result = _service.DecodeText(data, 0, data.Length, table);

		result.Should().Be("the");
	}

	#endregion

	#region Encode Tests

	[Fact]
	public void EncodeText_SimpleString_EncodesCorrectly()
	{
		var table = CreateSimpleAsciiTable();
		var text = "Hello";

		var result = _service.EncodeText(text, table);

		result.Should().BeEquivalentTo(new byte[] { 0x48, 0x65, 0x6c, 0x6c, 0x6f });
	}

	[Fact]
	public void EncodeText_WithHexEscape_InsertsByte()
	{
		var table = CreateSimpleAsciiTable();
		var text = "A[$ff]B";

		var result = _service.EncodeText(text, table);

		result.Should().BeEquivalentTo(new byte[] { 0x41, 0xff, 0x42 });
	}

	[Fact]
	public void EncodeText_RoundTrip()
	{
		var table = CreateSimpleAsciiTable();
		var original = "Hello World";

		var encoded = _service.EncodeText(original, table);
		var decoded = _service.DecodeText(encoded, 0, encoded.Length, table);

		decoded.Should().Be(original);
	}

	#endregion

	#region Find Text Blocks Tests

	[Fact]
	public void FindTextBlocks_FindsTerminatedBlocks()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 
			0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x00,  // "Hello\0"
			0x57, 0x6f, 0x72, 0x6c, 0x64, 0x00   // "World\0"
		};

		var blocks = _service.FindTextBlocks(data, table).ToList();

		blocks.Should().HaveCount(2);
		blocks[0].Text.Should().Be("Hello");
		blocks[1].Text.Should().Be("World");
	}

	[Fact]
	public void FindTextBlocks_RespectsMinLength()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 
			0x41, 0x00,  // "A\0" (too short)
			0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x00  // "Hello\0"
		};
		var options = new TextSearchOptions { MinLength = 3 };

		var blocks = _service.FindTextBlocks(data, table, options).ToList();

		blocks.Should().HaveCount(1);
		blocks[0].Text.Should().Be("Hello");
	}

	[Fact]
	public void FindTextBlocks_RespectsOffsetRange()
	{
		var table = CreateSimpleAsciiTable();
		var data = new byte[] { 
			0x41, 0x41, 0x41, 0x00,  // "AAA\0" at 0
			0x42, 0x42, 0x42, 0x00   // "BBB\0" at 4
		};
		var options = new TextSearchOptions { StartOffset = 4, MinLength = 2 };

		var blocks = _service.FindTextBlocks(data, table, options).ToList();

		blocks.Should().HaveCount(1);
		blocks[0].Text.Should().Be("BBB");
	}

	#endregion

	#region Pointer Table Tests

	[Fact]
	public void ReadPointerTable_16Bit_ReadsCorrectly()
	{
		var data = new byte[] { 
			0x00, 0x80,  // $8000
			0x10, 0x80,  // $8010
			0x20, 0x80   // $8020
		};

		var pointers = _service.ReadPointerTable(data, 0, 3).ToList();

		pointers.Should().HaveCount(3);
		pointers[0].Should().Be(0x8000);
		pointers[1].Should().Be(0x8010);
		pointers[2].Should().Be(0x8020);
	}

	[Fact]
	public void ReadPointerTable_24Bit_ReadsCorrectly()
	{
		var data = new byte[] { 
			0x00, 0x80, 0x01,  // $018000
			0x10, 0x80, 0x01   // $018010
		};

		var pointers = _service.ReadPointerTable(data, 0, 2, pointerSize: 3).ToList();

		pointers.Should().HaveCount(2);
		pointers[0].Should().Be(0x018000);
		pointers[1].Should().Be(0x018010);
	}

	[Fact]
	public void ReadPointerTable_WithBaseAddress_AddsCorrectly()
	{
		var data = new byte[] { 
			0x00, 0x00,  // $0000 + base
			0x10, 0x00   // $0010 + base
		};

		var pointers = _service.ReadPointerTable(data, 0, 2, baseAddress: 0x8000).ToList();

		pointers.Should().HaveCount(2);
		pointers[0].Should().Be(0x8000);
		pointers[1].Should().Be(0x8010);
	}

	[Fact]
	public void WritePointerTable_16Bit_WritesCorrectly()
	{
		var pointers = new[] { 0x8000, 0x8010, 0x8020 };

		var result = _service.WritePointerTable(pointers);

		result.Should().BeEquivalentTo(new byte[] {
			0x00, 0x80,
			0x10, 0x80,
			0x20, 0x80
		});
	}

	[Fact]
	public void WritePointerTable_RoundTrips()
	{
		var original = new[] { 0x8000, 0x8010, 0x8020 };

		var bytes = _service.WritePointerTable(original);
		var read = _service.ReadPointerTable(bytes, 0, 3).ToList();

		read.Should().BeEquivalentTo(original);
	}

	#endregion

	#region Script Export/Import Tests

	[Fact]
	public void ExportScript_PlainText_FormatsCorrectly()
	{
		var script = CreateSampleScript();

		var result = _service.ExportScript(script, ScriptExportFormat.PlainText);

		result.Should().Contain("Test Game");
		result.Should().Contain("$8000");
		result.Should().Contain("Hello World");
	}

	[Fact]
	public void ExportScript_Csv_FormatsCorrectly()
	{
		var script = CreateSampleScript();

		var result = _service.ExportScript(script, ScriptExportFormat.Csv);

		result.Should().Contain("Offset,Length,Label,Text,Comment");
		result.Should().Contain("$8000");
		result.Should().Contain("Hello World");
	}

	[Fact]
	public void ExportScript_Json_RoundTrips()
	{
		var script = CreateSampleScript();

		var json = _service.ExportScript(script, ScriptExportFormat.Json);
		var imported = _service.ImportScript(json, ScriptExportFormat.Json);

		imported.GameName.Should().Be(script.GameName);
		imported.Blocks.Should().HaveCount(script.Blocks.Count);
		imported.Blocks[0].Text.Should().Be(script.Blocks[0].Text);
	}

	[Fact]
	public void ExportScript_Markdown_FormatsAsTable()
	{
		var script = CreateSampleScript();

		var result = _service.ExportScript(script, ScriptExportFormat.Markdown);

		result.Should().Contain("# Test Game Script");
		result.Should().Contain("| Offset | Length | Label | Text |");
		result.Should().Contain("| `$8000` |");
	}

	[Fact]
	public void ExportScript_Atlas_FormatsCorrectly()
	{
		var script = CreateSampleScript();

		var result = _service.ExportScript(script, ScriptExportFormat.Atlas);

		result.Should().Contain("#JMP($8000)");
		result.Should().Contain("Hello World");
		result.Should().Contain("#END()");
	}

	#endregion

	#region Helper Methods

	private static TableFile CreateSimpleAsciiTable()
	{
		var table = new TableFile();

		// Add printable ASCII
		for (byte b = 0x20; b < 0x7f; b++)
		{
			table.SingleByteMappings[b] = ((char)b).ToString();
		}

		table.EndOfStringMarker = new byte[] { 0x00 };
		table.BuildReverseMappings();

		return table;
	}

	private static Script CreateSampleScript()
	{
		return new Script
		{
			GameName = "Test Game",
			TableName = "test.tbl",
			Blocks = new List<TextBlock>
			{
				new TextBlock
				{
					Offset = 0x8000,
					Length = 11,
					Text = "Hello World",
					Label = "greeting"
				},
				new TextBlock
				{
					Offset = 0x8020,
					Length = 7,
					Text = "Goodbye",
					Label = "farewell"
				}
			}
		};
	}

	#endregion
}
