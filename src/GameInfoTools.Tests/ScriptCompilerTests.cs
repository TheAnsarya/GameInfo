using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for ScriptCompiler class.
/// </summary>
public class ScriptCompilerTests
{
	private TextTable CreateSimpleTable()
	{
		var table = new TextTable();
		// Simple ASCII-ish mapping
		for (int i = 0; i < 26; i++)
		{
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}
		for (int i = 0; i < 26; i++)
		{
			table.AddEntry((byte)(0xa0 + i), ((char)('a' + i)).ToString());
		}
		table.AddEntry(0x00, "{END}");
		table.AddEntry(0x0a, "{NEWLINE}");
		table.AddEntry(0xff, " ");
		return table;
	}

	[Fact]
	public void Compile_EmptyScript_ReturnsEmptyData()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile("");

		// Assert
		Assert.Empty(result.Data);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Compile_CommentOnly_IgnoresComment()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile("; This is a comment");

		// Assert
		Assert.Empty(result.Data);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Compile_DoubleSlashComment_IgnoresComment()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile("// This is a comment");

		// Assert
		Assert.Empty(result.Data);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Compile_ByteDirective_HexValue()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".byte $ff");

		// Assert
		Assert.Single(result.Data);
		Assert.Equal(0xff, result.Data[0]);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Compile_ByteDirective_HexPrefix0x()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".byte 0xab");

		// Assert
		Assert.Single(result.Data);
		Assert.Equal(0xab, result.Data[0]);
	}

	[Fact]
	public void Compile_ByteDirective_DecimalValue()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".byte 123");

		// Assert
		Assert.Single(result.Data);
		Assert.Equal(123, result.Data[0]);
	}

	[Fact]
	public void Compile_ByteDirective_MultipleValues()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".byte $01, $02, $03");

		// Assert
		Assert.Equal(3, result.Data.Length);
		Assert.Equal(0x01, result.Data[0]);
		Assert.Equal(0x02, result.Data[1]);
		Assert.Equal(0x03, result.Data[2]);
	}

	[Fact]
	public void Compile_WordDirective_LittleEndian()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".word $1234");

		// Assert
		Assert.Equal(2, result.Data.Length);
		Assert.Equal(0x34, result.Data[0]); // Low byte first
		Assert.Equal(0x12, result.Data[1]); // High byte second
	}

	[Fact]
	public void Compile_DbDirective_SameAsByte()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".db $aa");

		// Assert
		Assert.Single(result.Data);
		Assert.Equal(0xaa, result.Data[0]);
	}

	[Fact]
	public void Compile_DwDirective_SameAsWord()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".dw $5678");

		// Assert
		Assert.Equal(2, result.Data.Length);
		Assert.Equal(0x78, result.Data[0]);
		Assert.Equal(0x56, result.Data[1]);
	}

	[Fact]
	public void Compile_EndDirective_AddsTerminator()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".end");

		// Assert
		Assert.Single(result.Data);
		Assert.Equal(0x00, result.Data[0]); // {END} maps to 0x00
	}

	[Fact]
	public void Compile_Labels_AreTracked()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);
		var script = @"Start:
.byte $01
Middle:
.byte $02
End:
.byte $03";

		// Act
		var result = compiler.Compile(script);

		// Assert
		Assert.Equal(3, result.Labels.Count);
		Assert.Equal(0, result.Labels["Start"]);
		Assert.Equal(1, result.Labels["Middle"]);
		Assert.Equal(2, result.Labels["End"]);
	}

	[Fact]
	public void Compile_InvalidDirective_ReportsError()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".unknown");

		// Assert
		Assert.Single(result.Errors);
		Assert.Contains("unknown", result.Errors[0].ToLower());
	}

	[Fact]
	public void Compile_InvalidByteValue_ReportsError()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".byte xyz");

		// Assert
		Assert.Single(result.Errors);
		Assert.Contains("xyz", result.Errors[0]);
	}

	[Fact]
	public void Compile_MultipleLines_CompileAll()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);
		var script = @".byte $01
.byte $02
.byte $03";

		// Act
		var result = compiler.Compile(script);

		// Assert
		Assert.Equal(3, result.Data.Length);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Compile_WordDirective_DecimalValue()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);

		// Act
		var result = compiler.Compile(".word 1000");

		// Assert
		Assert.Equal(2, result.Data.Length);
		Assert.Equal(0xe8, result.Data[0]); // 1000 & 0xff = 0xe8
		Assert.Equal(0x03, result.Data[1]); // 1000 >> 8 = 0x03
	}

	[Fact]
	public void Compile_BlankLines_AreSkipped()
	{
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new ScriptCompiler(table);
		var script = @"

.byte $01

.byte $02

";

		// Act
		var result = compiler.Compile(script);

		// Assert
		Assert.Equal(2, result.Data.Length);
		Assert.Empty(result.Errors);
	}
}
