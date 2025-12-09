using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for ScriptCompiler functionality.
/// </summary>
public class ScriptCompilerAdvancedTests {
	private TextTable CreateSimpleTable() {
		var table = new TextTable();
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0xa0 + i), ((char)('a' + i)).ToString());
		}
		table.AddEntry(0x00, "{END}");
		table.AddEntry(0x0a, "{NEWLINE}");
		table.AddEntry(0xff, " ");
		return table;
	}

	#region Label Tests

	[Fact]
	public void Compile_LabelDefinition_RegistersLabel() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile("TestLabel:\n.byte $00");

		Assert.Empty(result.Errors);
		Assert.True(result.Labels.ContainsKey("TestLabel"));
		Assert.Equal(0, result.Labels["TestLabel"]);
	}

	[Fact]
	public void Compile_MultipleLabels_AllRegistered() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
Label1:
.byte $01
Label2:
.byte $02
Label3:
.byte $03
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(3, result.Labels.Count);
		Assert.True(result.Labels.ContainsKey("Label1"));
		Assert.True(result.Labels.ContainsKey("Label2"));
		Assert.True(result.Labels.ContainsKey("Label3"));
	}

	[Fact]
	public void Compile_LabelAtDifferentPositions_CorrectAddresses() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
Start:
.byte $aa, $bb
Middle:
.byte $cc
End:
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(0, result.Labels["Start"]);
		Assert.Equal(2, result.Labels["Middle"]);
		Assert.Equal(3, result.Labels["End"]);
	}

	#endregion

	#region Forward Reference Tests

	[Fact]
	public void Compile_ForwardReference_ResolvesCorrectly() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
.ref EndLabel
.byte $aa
EndLabel:
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		// First two bytes should be address of EndLabel (0x0003)
		Assert.Equal(0x03, result.Data[0]);
		Assert.Equal(0x00, result.Data[1]);
	}

	[Fact]
	public void Compile_BackReference_ResolvesCorrectly() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
StartLabel:
.byte $aa
.ref StartLabel
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		// Reference should point to StartLabel (0x0000)
		Assert.Equal(0x00, result.Data[1]);
		Assert.Equal(0x00, result.Data[2]);
	}

	[Fact]
	public void Compile_UnresolvedLabel_ReportsError() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".ref NonExistentLabel");

		Assert.NotEmpty(result.Errors);
		Assert.Contains(result.Errors, e => e.Contains("Unresolved"));
	}

	#endregion

	#region Directive Tests

	[Fact]
	public void Compile_ByteDirective_MultipleValues() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte $01, $02, $03, $04");

		Assert.Empty(result.Errors);
		Assert.Equal(4, result.Data.Length);
		Assert.Equal(new byte[] { 0x01, 0x02, 0x03, 0x04 }, result.Data);
	}

	[Fact]
	public void Compile_DbAlias_WorksLikeByte() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".db $aa, $bb");

		Assert.Empty(result.Errors);
		Assert.Equal(new byte[] { 0xaa, 0xbb }, result.Data);
	}

	[Fact]
	public void Compile_WordDirective_LittleEndian() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".word $1234");

		Assert.Empty(result.Errors);
		Assert.Equal(2, result.Data.Length);
		Assert.Equal(0x34, result.Data[0]); // Low byte
		Assert.Equal(0x12, result.Data[1]); // High byte
	}

	[Fact]
	public void Compile_WordDirective_MultipleValues() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".word $1000, $2000");

		Assert.Empty(result.Errors);
		Assert.Equal(4, result.Data.Length);
		Assert.Equal(0x00, result.Data[0]);
		Assert.Equal(0x10, result.Data[1]);
		Assert.Equal(0x00, result.Data[2]);
		Assert.Equal(0x20, result.Data[3]);
	}

	[Fact]
	public void Compile_DwAlias_WorksLikeWord() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".dw $abcd");

		Assert.Empty(result.Errors);
		Assert.Equal(0xcd, result.Data[0]);
		Assert.Equal(0xab, result.Data[1]);
	}

	[Fact]
	public void Compile_EndDirective_AddsTerminator() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".end");

		Assert.Empty(result.Errors);
		Assert.Contains((byte)0x00, result.Data);
	}

	[Fact]
	public void Compile_NewlineDirective_AddsNewlineFromTable() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".newline");

		Assert.Empty(result.Errors);
		// The table defines 0x0a as {NEWLINE}, so it should be added
		Assert.True(result.Data.Length > 0);
	}

	[Fact]
	public void Compile_BrAlias_AddsNewlineFromTable() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".br");

		Assert.Empty(result.Errors);
		// Br should work the same as newline
		Assert.True(result.Data.Length > 0);
	}

	[Fact]
	public void Compile_TextDirective_EncodesString() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".text \"AB\"");

		Assert.Empty(result.Errors);
		Assert.Contains((byte)0x80, result.Data); // A
		Assert.Contains((byte)0x81, result.Data); // B
	}

	[Fact]
	public void Compile_PtrAlias_WorksLikeRef() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
.ptr Target
Target:
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(0x02, result.Data[0]); // Address of Target
		Assert.Equal(0x00, result.Data[1]);
	}

	[Fact]
	public void Compile_UnknownDirective_ReportsError() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".unknown");

		Assert.NotEmpty(result.Errors);
		Assert.Contains(result.Errors, e => e.Contains("Unknown directive"));
	}

	#endregion

	#region Comment Tests

	[Fact]
	public void Compile_SemicolonComment_Ignored() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
; This is a comment
.byte $01
; Another comment
.byte $02
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(new byte[] { 0x01, 0x02 }, result.Data);
	}

	[Fact]
	public void Compile_DoubleSlashComment_Ignored() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
// C-style comment
.byte $ff
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(new byte[] { 0xff }, result.Data);
	}

	[Fact]
	public void Compile_EmptyLines_Ignored() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"

.byte $01

.byte $02

";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.Equal(2, result.Data.Length);
	}

	#endregion

	#region Hex Format Tests

	[Fact]
	public void Compile_DollarSignHex_Parses() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte $ab");

		Assert.Empty(result.Errors);
		Assert.Equal(0xab, result.Data[0]);
	}

	[Fact]
	public void Compile_0xPrefixHex_Parses() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte 0xcd");

		Assert.Empty(result.Errors);
		Assert.Equal(0xcd, result.Data[0]);
	}

	[Fact]
	public void Compile_DecimalValue_Parses() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte 100");

		Assert.Empty(result.Errors);
		Assert.Equal(100, result.Data[0]);
	}

	[Fact]
	public void Compile_MixedFormats_AllParse() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte $10, 0x20, 48");

		Assert.Empty(result.Errors);
		Assert.Equal(3, result.Data.Length);
		Assert.Equal(0x10, result.Data[0]);
		Assert.Equal(0x20, result.Data[1]);
		Assert.Equal(48, result.Data[2]);
	}

	#endregion

	#region Error Handling Tests

	[Fact]
	public void Compile_InvalidByteValue_ReportsError() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".byte invalid");

		Assert.NotEmpty(result.Errors);
		Assert.Contains(result.Errors, e => e.Contains("Invalid byte"));
	}

	[Fact]
	public void Compile_InvalidWordValue_ReportsError() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".word invalid");

		Assert.NotEmpty(result.Errors);
		Assert.Contains(result.Errors, e => e.Contains("Invalid word"));
	}

	[Fact]
	public void Compile_InvalidDirectiveSyntax_ReportsError() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile(".");

		Assert.NotEmpty(result.Errors);
	}

	#endregion

	#region Complex Script Tests

	[Fact]
	public void Compile_CompleteScript_ProducesCorrectOutput() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
; Header comment
Header:
.byte $01, $02
.word TextStart

TextStart:
.text ""AB""
.newline
.end
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);
		Assert.True(result.Data.Length > 0);
		Assert.True(result.Labels.ContainsKey("Header"));
		Assert.True(result.Labels.ContainsKey("TextStart"));
	}

	[Fact]
	public void Compile_WordReferenceToLabel_ResolvesCorrectly() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var script = @"
PointerTable:
.word DataStart
.word DataEnd

DataStart:
.byte $aa
DataEnd:
";
		var result = compiler.Compile(script);

		Assert.Empty(result.Errors);

		// First word should point to DataStart (offset 4)
		int dataStartAddr = result.Data[0] | (result.Data[1] << 8);
		Assert.Equal(result.Labels["DataStart"], dataStartAddr);

		// Second word should point to DataEnd (offset 5)
		int dataEndAddr = result.Data[2] | (result.Data[3] << 8);
		Assert.Equal(result.Labels["DataEnd"], dataEndAddr);
	}

	#endregion

	#region Decompile Tests

	[Fact]
	public void Decompile_SimpleData_ReturnsText() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// A B END
		var data = new byte[] { 0x80, 0x81, 0x00 };

		var result = compiler.Decompile(data);

		Assert.NotEmpty(result);
		Assert.Contains("A", result);
		Assert.Contains("B", result);
	}

	[Fact]
	public void Decompile_WithOffset_StartsAtOffset() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Garbage, A, B, END
		var data = new byte[] { 0xff, 0xff, 0x80, 0x81, 0x00 };

		var result = compiler.Decompile(data, 2);

		Assert.Contains("A", result);
		Assert.Contains("B", result);
	}

	[Fact]
	public void Decompile_WithLength_LimitsOutput() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// A B C D E END
		var data = new byte[] { 0x80, 0x81, 0x82, 0x83, 0x84, 0x00 };

		var result = compiler.Decompile(data, 0, 2);

		Assert.Contains("A", result);
		Assert.Contains("B", result);
	}

	#endregion

	#region CompileResult Tests

	[Fact]
	public void CompileResult_EmptyScript_HasEmptyData() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile("");

		Assert.Empty(result.Data);
		Assert.Empty(result.Errors);
		Assert.Empty(result.Labels);
	}

	[Fact]
	public void CompileResult_OnlyComments_HasEmptyData() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile("; Just a comment\n// Another comment");

		Assert.Empty(result.Data);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void CompileResult_LabelsAreDictionaryCopy() {
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		var result = compiler.Compile("Test:\n.byte $00");

		// Modifying returned dictionary shouldn't affect compiler state
		result.Labels["NewLabel"] = 999;

		var result2 = compiler.Compile("Test2:\n.byte $00");
		Assert.False(result2.Labels.ContainsKey("NewLabel"));
	}

	#endregion
}
