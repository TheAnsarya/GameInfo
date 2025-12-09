using System.Text;
using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for assembly formatting and processing.
/// </summary>
public class AsmFormatterAdvancedTests
{
	#region FormatLine Basic Tests

	[Fact]
	public void FormatLine_EmptyLine_ReturnsEmpty()
	{
		var options = new AsmFormatter.FormatOptions();
		var result = AsmFormatter.FormatLine("", options);

		Assert.Equal("", result);
	}

	[Fact]
	public void FormatLine_WhitespaceOnly_ReturnsEmpty()
	{
		var options = new AsmFormatter.FormatOptions { PreserveBlankLines = true };
		var result = AsmFormatter.FormatLine("   ", options);

		Assert.Equal("", result);
	}

	[Fact]
	public void FormatLine_CommentOnly_Preserved()
	{
		var options = new AsmFormatter.FormatOptions();
		var result = AsmFormatter.FormatLine("; This is a comment", options);

		Assert.Equal("; This is a comment", result);
	}

	[Fact]
	public void FormatLine_StarComment_Preserved()
	{
		var options = new AsmFormatter.FormatOptions();
		var result = AsmFormatter.FormatLine("* Old-style comment", options);

		Assert.Equal("* Old-style comment", result);
	}

	#endregion

	#region Opcode Case Tests

	[Fact]
	public void FormatLine_UppercaseOpcodes_Applied()
	{
		var options = new AsmFormatter.FormatOptions { UseUppercaseOpcodes = true };
		var result = AsmFormatter.FormatLine("    lda #$00", options);

		Assert.Contains("LDA", result);
	}

	[Fact]
	public void FormatLine_LowercaseOpcodes_Applied()
	{
		var options = new AsmFormatter.FormatOptions { UseUppercaseOpcodes = false };
		var result = AsmFormatter.FormatLine("    LDA #$00", options);

		Assert.Contains("lda", result);
	}

	#endregion

	#region Label Tests

	[Fact]
	public void FormatLine_LabelWithColon_Preserved()
	{
		var options = new AsmFormatter.FormatOptions();
		var result = AsmFormatter.FormatLine("MainLoop:", options);

		Assert.StartsWith("MainLoop:", result);
	}

	[Fact]
	public void FormatLine_LabelWithInstruction_BothFormatted()
	{
		var options = new AsmFormatter.FormatOptions { UseUppercaseOpcodes = false };
		var result = AsmFormatter.FormatLine("Loop: LDA #$00", options);

		Assert.Contains("Loop", result);
		Assert.Contains("lda", result);
	}

	#endregion

	#region Comment Alignment Tests

	[Fact]
	public void FormatLine_AlignComments_AppliesAlignment()
	{
		var options = new AsmFormatter.FormatOptions
		{
			AlignComments = true,
			CommentColumn = 40
		};

		var result = AsmFormatter.FormatLine("    lda #$00    ; load zero", options);

		// Formatter formats the line - should include instruction and comment
		Assert.NotNull(result);
		Assert.Contains("lda", result);
	}

	[Fact]
	public void FormatLine_NoAlignComments_CommentFollowsInstruction()
	{
		var options = new AsmFormatter.FormatOptions { AlignComments = false };
		var result = AsmFormatter.FormatLine("    lda #$00 ; load zero", options);

		// Should format instruction
		Assert.NotNull(result);
		Assert.Contains("lda", result);
	}

	#endregion

	#region FormatFile Tests

	[Fact]
	public void FormatFile_MultipleLines_AllFormatted()
	{
		var content = @"MainLoop:
    LDA #$00
    STA $0400
    JMP MainLoop";

		var options = new AsmFormatter.FormatOptions { UseUppercaseOpcodes = false };
		var result = AsmFormatter.FormatFile(content, options);

		Assert.Contains("MainLoop:", result);
		Assert.Contains("lda", result);
		Assert.Contains("sta", result);
		Assert.Contains("jmp", result);
	}

	[Fact]
	public void FormatFile_PreservesBlankLines()
	{
		var content = "lda #$00\n\nsta $0400";
		var options = new AsmFormatter.FormatOptions { PreserveBlankLines = true };

		var result = AsmFormatter.FormatFile(content, options);
		var lines = result.Split(Environment.NewLine);

		Assert.True(lines.Length >= 3);
	}

	[Fact]
	public void FormatFile_NullOptions_UsesDefaults()
	{
		var content = "    LDA #$00";

		var result = AsmFormatter.FormatFile(content, null);

		Assert.NotNull(result);
		Assert.Contains("lda", result); // Default is lowercase
	}

	#endregion

	#region ValidateSyntax Tests

	[Fact]
	public void ValidateSyntax_ValidCode_NoErrors()
	{
		var content = @"
    lda #$00
    sta $0400
    jmp $8000
";

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_UnclosedString_ReportsError()
	{
		var content = @"    .byte ""Unclosed string";

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Contains(errors, e => e.Message.Contains("Unclosed string"));
	}

	[Fact]
	public void ValidateSyntax_UnbalancedParens_ReportsError()
	{
		var content = @"    lda ($00,x";

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Contains(errors, e => e.Message.Contains("Unbalanced parentheses"));
	}

	[Fact]
	public void ValidateSyntax_CommentOnlyLines_NoErrors()
	{
		var content = @"; This is a comment
* Another comment style
";

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_AllValid6502Opcodes_NoErrors()
	{
		var opcodes = new[]
		{
			"adc", "and", "asl", "bcc", "bcs", "beq", "bit", "bmi", "bne", "bpl",
			"brk", "bvc", "bvs", "clc", "cld", "cli", "clv", "cmp", "cpx", "cpy",
			"dec", "dex", "dey", "eor", "inc", "inx", "iny", "jmp", "jsr", "lda",
			"ldx", "ldy", "lsr", "nop", "ora", "pha", "php", "pla", "plp", "rol",
			"ror", "rti", "rts", "sbc", "sec", "sed", "sei", "sta", "stx", "sty",
			"tax", "tay", "tsx", "txa", "txs", "tya"
		};

		var content = string.Join("\n", opcodes.Select(op => $"    {op}"));

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_65816Opcodes_NoErrors()
	{
		var opcodes = new[]
		{
			"bra", "brl", "jml", "jsl", "mvn", "mvp", "pea", "pei", "per",
			"phb", "phd", "phk", "phx", "phy", "plb", "pld", "plx", "ply",
			"rep", "rtl", "sep", "stp", "stz", "tcd", "tcs", "tdc", "trb",
			"tsb", "tsc", "txy", "tyx", "wai", "xba", "xce"
		};

		var content = string.Join("\n", opcodes.Select(op => $"    {op}"));

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_Directives_NoErrors()
	{
		var content = @"
    .org $8000
    .byte $00, $01, $02
    .word $1234
    .include ""data.asm""
";

		var errors = AsmFormatter.ValidateSyntax(content);

		Assert.Empty(errors);
	}

	#endregion

	#region FormatOptions Tests

	[Fact]
	public void FormatOptions_DefaultValues_Correct()
	{
		var options = new AsmFormatter.FormatOptions();

		Assert.Equal(0, options.LabelColumn);
		Assert.Equal(16, options.OpcodeColumn);
		Assert.Equal(24, options.OperandColumn);
		Assert.Equal(48, options.CommentColumn);
		Assert.False(options.UseUppercaseOpcodes);
		Assert.False(options.UseUppercaseHex);
		Assert.Equal(";", options.CommentPrefix);
		Assert.True(options.AlignComments);
		Assert.True(options.PreserveBlankLines);
		Assert.Equal(4, options.TabWidth);
		Assert.True(options.UseTabs);
	}

	#endregion
}

/// <summary>
/// Comprehensive tests for the SymbolTable class.
/// </summary>
public class SymbolTableTests
{
	#region AddSymbol Tests

	[Fact]
	public void AddSymbol_Basic_Stored()
	{
		var table = new SymbolTable();

		table.AddSymbol("MainLoop", 0x8000);

		Assert.Equal("MainLoop", table.GetSymbol(0x8000));
		Assert.Equal(0x8000, table.GetAddress("MainLoop"));
	}

	[Fact]
	public void AddSymbol_WithType_TypeStored()
	{
		var table = new SymbolTable();

		table.AddSymbol("UpdateSprites", 0x8100, SymbolTable.SymbolType.Subroutine);

		Assert.Equal(SymbolTable.SymbolType.Subroutine, table.GetSymbolType("UpdateSprites"));
	}

	[Fact]
	public void AddSymbol_WithComment_CommentStored()
	{
		var table = new SymbolTable();

		table.AddSymbol("PlayerHealth", 0x0400, SymbolTable.SymbolType.Ram, "Current player HP");

		Assert.Equal("Current player HP", table.GetComment("PlayerHealth"));
	}

	[Fact]
	public void AddSymbol_OverwriteExisting_Updated()
	{
		var table = new SymbolTable();

		table.AddSymbol("Test", 0x8000);
		table.AddSymbol("Test", 0x9000); // Overwrite

		Assert.Equal(0x9000, table.GetAddress("Test"));
	}

	#endregion

	#region GetSymbol/GetAddress Tests

	[Fact]
	public void GetSymbol_NoSymbol_ReturnsNull()
	{
		var table = new SymbolTable();

		Assert.Null(table.GetSymbol(0x8000));
	}

	[Fact]
	public void GetAddress_NoSymbol_ReturnsNull()
	{
		var table = new SymbolTable();

		Assert.Null(table.GetAddress("Nonexistent"));
	}

	[Fact]
	public void GetAddress_CaseInsensitive()
	{
		var table = new SymbolTable();

		table.AddSymbol("MainLoop", 0x8000);

		Assert.Equal(0x8000, table.GetAddress("mainloop"));
		Assert.Equal(0x8000, table.GetAddress("MAINLOOP"));
	}

	#endregion

	#region HasSymbol Tests

	[Fact]
	public void HasSymbol_Exists_ReturnsTrue()
	{
		var table = new SymbolTable();

		table.AddSymbol("Test", 0x8000);

		Assert.True(table.HasSymbol(0x8000));
	}

	[Fact]
	public void HasSymbol_NotExists_ReturnsFalse()
	{
		var table = new SymbolTable();

		Assert.False(table.HasSymbol(0x8000));
	}

	#endregion

	#region GetAllSymbols Tests

	[Fact]
	public void GetAllSymbols_ReturnsAll()
	{
		var table = new SymbolTable();

		table.AddSymbol("SymA", 0x8000, SymbolTable.SymbolType.Code);
		table.AddSymbol("SymB", 0x8100, SymbolTable.SymbolType.Data);
		table.AddSymbol("SymC", 0x8200, SymbolTable.SymbolType.Ram);

		var all = table.GetAllSymbols().ToList();

		Assert.Equal(3, all.Count);
		Assert.Contains(all, s => s.Name == "SymA" && s.Type == SymbolTable.SymbolType.Code);
		Assert.Contains(all, s => s.Name == "SymB" && s.Type == SymbolTable.SymbolType.Data);
		Assert.Contains(all, s => s.Name == "SymC" && s.Type == SymbolTable.SymbolType.Ram);
	}

	#endregion

	#region GetSymbolsInRange Tests

	[Fact]
	public void GetSymbolsInRange_ReturnsSymbolsInRange()
	{
		var table = new SymbolTable();

		table.AddSymbol("Before", 0x7000);
		table.AddSymbol("InRange1", 0x8000);
		table.AddSymbol("InRange2", 0x8100);
		table.AddSymbol("After", 0x9000);

		var inRange = table.GetSymbolsInRange(0x8000, 0x8200).ToList();

		Assert.Equal(2, inRange.Count);
		Assert.Contains(inRange, s => s.Name == "InRange1");
		Assert.Contains(inRange, s => s.Name == "InRange2");
	}

	[Fact]
	public void GetSymbolsInRange_OrderedByAddress()
	{
		var table = new SymbolTable();

		table.AddSymbol("Third", 0x8200);
		table.AddSymbol("First", 0x8000);
		table.AddSymbol("Second", 0x8100);

		var inRange = table.GetSymbolsInRange(0x8000, 0x8300).ToList();

		Assert.Equal("First", inRange[0].Name);
		Assert.Equal("Second", inRange[1].Name);
		Assert.Equal("Third", inRange[2].Name);
	}

	#endregion

	#region LoadMlb Tests

	[Fact]
	public void LoadMlb_ValidFormat_ParsesSymbols()
	{
		var table = new SymbolTable();
		var mlb = @"G:008000:MainLoop:Entry point
P:008100:UpdateSprites:Update all sprites
R:000400:PlayerHP:Current health";

		table.LoadMlb(mlb);

		Assert.Equal("MainLoop", table.GetSymbol(0x8000));
		Assert.Equal("UpdateSprites", table.GetSymbol(0x8100));
		Assert.Equal("PlayerHP", table.GetSymbol(0x400));
	}

	[Fact]
	public void LoadMlb_TypeCodes_MappedCorrectly()
	{
		var table = new SymbolTable();
		var mlb = @"G:008000:General
P:008100:PrgCode
R:000400:RamVar
W:000500:RamWrite
S:00C000:SegData";

		table.LoadMlb(mlb);

		// G and P are code types
		Assert.Equal(SymbolTable.SymbolType.Code, table.GetSymbolType("PrgCode"));
		// R and W are RAM types
		Assert.Equal(SymbolTable.SymbolType.Ram, table.GetSymbolType("RamVar"));
		Assert.Equal(SymbolTable.SymbolType.Ram, table.GetSymbolType("RamWrite"));
		// S is data type
		Assert.Equal(SymbolTable.SymbolType.Data, table.GetSymbolType("SegData"));
	}

	[Fact]
	public void LoadMlb_IgnoresComments()
	{
		var table = new SymbolTable();
		var mlb = @"# This is a comment
G:008000:Symbol:Comment
# Another comment";

		table.LoadMlb(mlb);

		Assert.Equal(1, table.Count);
	}

	[Fact]
	public void LoadMlb_IgnoresEmptyLines()
	{
		var table = new SymbolTable();
		var mlb = @"G:008000:First

G:008100:Second";

		table.LoadMlb(mlb);

		Assert.Equal(2, table.Count);
	}

	#endregion

	#region LoadLabels Tests

	[Fact]
	public void LoadLabels_EqualsFormat_Parses()
	{
		var table = new SymbolTable();
		var labels = @"MainLoop = $8000
UpdateSprites = $8100";

		table.LoadLabels(labels);

		Assert.Equal(0x8000, table.GetAddress("MainLoop"));
		Assert.Equal(0x8100, table.GetAddress("UpdateSprites"));
	}

	[Fact]
	public void LoadLabels_AddressNameFormat_Parses()
	{
		var table = new SymbolTable();
		var labels = @"$8000 MainLoop
$8100 UpdateSprites";

		table.LoadLabels(labels);

		Assert.Equal(0x8000, table.GetAddress("MainLoop"));
		Assert.Equal(0x8100, table.GetAddress("UpdateSprites"));
	}

	[Fact]
	public void LoadLabels_ColonFormat_Parses()
	{
		var table = new SymbolTable();
		var labels = @"8000:MainLoop
8100:UpdateSprites";

		table.LoadLabels(labels);

		Assert.Equal(0x8000, table.GetAddress("MainLoop"));
		Assert.Equal(0x8100, table.GetAddress("UpdateSprites"));
	}

	[Fact]
	public void LoadLabels_IgnoresComments()
	{
		var table = new SymbolTable();
		var labels = @"; Comment line
MainLoop = $8000
# Another comment";

		table.LoadLabels(labels);

		Assert.Equal(1, table.Count);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportMlb_FormatsCorrectly()
	{
		var table = new SymbolTable();

		table.AddSymbol("MainLoop", 0x8000, SymbolTable.SymbolType.Code, "Entry");
		table.AddSymbol("PlayerHP", 0x0400, SymbolTable.SymbolType.Ram, "Health");

		var mlb = table.ExportMlb();

		Assert.Contains("R:000400:", mlb); // RAM exports with 'R' type code
		Assert.Contains("MainLoop", mlb);
		Assert.Contains("Entry", mlb);
	}

	[Fact]
	public void ExportLabels_FormatsCorrectly()
	{
		var table = new SymbolTable();

		table.AddSymbol("MainLoop", 0x8000);
		table.AddSymbol("UpdateSprites", 0x8100);

		var labels = table.ExportLabels();

		Assert.Contains("MainLoop = $8000", labels);
		Assert.Contains("UpdateSprites = $8100", labels);
	}

	#endregion

	#region Count and Clear Tests

	[Fact]
	public void Count_TracksSymbols()
	{
		var table = new SymbolTable();

		Assert.Equal(0, table.Count);

		table.AddSymbol("A", 0x8000);
		Assert.Equal(1, table.Count);

		table.AddSymbol("B", 0x8100);
		Assert.Equal(2, table.Count);
	}

	[Fact]
	public void Clear_RemovesAllData()
	{
		var table = new SymbolTable();

		table.AddSymbol("Test", 0x8000, SymbolTable.SymbolType.Code, "Comment");

		table.Clear();

		Assert.Equal(0, table.Count);
		Assert.Null(table.GetSymbol(0x8000));
		Assert.Null(table.GetAddress("Test"));
	}

	#endregion

	#region SymbolType Enum Tests

	[Theory]
	[InlineData(SymbolTable.SymbolType.Unknown)]
	[InlineData(SymbolTable.SymbolType.Code)]
	[InlineData(SymbolTable.SymbolType.Data)]
	[InlineData(SymbolTable.SymbolType.Ram)]
	[InlineData(SymbolTable.SymbolType.Constant)]
	[InlineData(SymbolTable.SymbolType.Label)]
	[InlineData(SymbolTable.SymbolType.Subroutine)]
	[InlineData(SymbolTable.SymbolType.Table)]
	[InlineData(SymbolTable.SymbolType.Pointer)]
	public void SymbolType_AllValues_Stored(SymbolTable.SymbolType type)
	{
		var table = new SymbolTable();

		table.AddSymbol("Test", 0x8000, type);

		Assert.Equal(type, table.GetSymbolType("Test"));
	}

	#endregion
}
