using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for AsmFormatter class.
/// </summary>
public class AsmFormatterTests
{
	[Fact]
	public void FormatLine_BlankLine_ReturnsEmpty()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions();

		// Act
		var result = AsmFormatter.FormatLine("", options);

		// Assert
		Assert.Equal("", result);
	}

	[Fact]
	public void FormatLine_CommentOnly_PreservesComment()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions();

		// Act
		var result = AsmFormatter.FormatLine("; This is a comment", options);

		// Assert
		Assert.Equal("; This is a comment", result);
	}

	[Fact]
	public void FormatLine_UppercaseOpcodes_ConvertsToUpper()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions
		{
			UseUppercaseOpcodes = true,
			UseTabs = false
		};

		// Act
		var result = AsmFormatter.FormatLine("    lda #$00", options);

		// Assert
		Assert.Contains("LDA", result);
	}

	[Fact]
	public void FormatLine_LowercaseOpcodes_ConvertsToLower()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions
		{
			UseUppercaseOpcodes = false,
			UseTabs = false
		};

		// Act
		var result = AsmFormatter.FormatLine("    LDA #$00", options);

		// Assert
		Assert.Contains("lda", result);
	}

	[Fact]
	public void FormatLine_LabelOnly_PreservesLabel()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions();

		// Act
		var result = AsmFormatter.FormatLine("MyLabel:", options);

		// Assert
		Assert.Equal("MyLabel:", result);
	}

	[Fact]
	public void FormatLine_WithComment_IncludesComment()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions
		{
			UseTabs = false
		};

		// Act
		var result = AsmFormatter.FormatLine("    lda #$00 ; Load zero", options);

		// Assert
		Assert.Contains("Load zero", result);
	}

	[Fact]
	public void FormatFile_MultipleLines_FormatsAll()
	{
		// Arrange
		var content = @"Label:
    lda #$00
    sta $10
    rts";
		var options = new AsmFormatter.FormatOptions
		{
			UseUppercaseOpcodes = true,
			UseTabs = false
		};

		// Act
		var result = AsmFormatter.FormatFile(content, options);

		// Assert
		Assert.Contains("LDA", result);
		Assert.Contains("STA", result);
		Assert.Contains("RTS", result);
	}

	[Fact]
	public void FormatFile_PreservesBlankLines()
	{
		// Arrange
		var content = "Label:\n\n    lda #$00";
		var options = new AsmFormatter.FormatOptions { PreserveBlankLines = true };

		// Act
		var result = AsmFormatter.FormatFile(content, options);
		var lines = result.Split('\n');

		// Assert - blank line should be present
		Assert.True(lines.Length >= 3);
	}

	[Fact]
	public void ValidateSyntax_ValidCode_NoErrors()
	{
		// Arrange
		var content = @"    lda #$00
    sta $10
    rts";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_UnclosedQuote_ReportsError()
	{
		// Arrange
		var content = "    .byte \"hello";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Contains(errors, e => e.Message.Contains("string literal"));
	}

	[Fact]
	public void ValidateSyntax_UnbalancedParens_ReportsError()
	{
		// Arrange
		var content = "    lda ($10";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Contains(errors, e => e.Message.Contains("parentheses"));
	}

	[Fact]
	public void ValidateSyntax_CommentLines_NoErrors()
	{
		// Arrange
		var content = @"; This is a comment
* Another comment style
; More comments";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Empty(errors);
	}

	[Fact]
	public void ValidateSyntax_BlankLines_NoErrors()
	{
		// Arrange
		var content = "\n\n\n";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Empty(errors);
	}

	[Fact]
	public void FormatOptions_DefaultValues_AreCorrect()
	{
		// Arrange & Act
		var options = new AsmFormatter.FormatOptions();

		// Assert
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

	[Fact]
	public void FormatLine_Directives_AreHandled()
	{
		// Arrange
		var options = new AsmFormatter.FormatOptions { UseTabs = false };

		// Act
		var result = AsmFormatter.FormatLine("    .byte $00, $01, $02", options);

		// Assert
		Assert.Contains(".byte", result);
	}

	[Fact]
	public void ValidateSyntax_AssemblerDirectives_NoErrors()
	{
		// Arrange
		var content = @"    .org $8000
    .byte $00
    .word Label
    .include ""file.asm""";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Empty(errors);
	}
}
