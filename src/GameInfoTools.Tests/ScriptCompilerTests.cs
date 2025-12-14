using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for ScriptCompiler class.
/// </summary>
public class ScriptCompilerTests {
	private TextTable CreateSimpleTable() {
		var table = new TextTable();
		// Simple ASCII-ish mapping
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

	[Fact]
	public void Compile_EmptyScript_ReturnsEmptyData() {
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
	public void Compile_CommentOnly_IgnoresComment() {
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
	public void Compile_DoubleSlashComment_IgnoresComment() {
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
	public void Compile_ByteDirective_HexValue() {
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
	public void Compile_ByteDirective_HexPrefix0x() {
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
	public void Compile_ByteDirective_DecimalValue() {
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
	public void Compile_ByteDirective_MultipleValues() {
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
	public void Compile_WordDirective_LittleEndian() {
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
	public void Compile_DbDirective_SameAsByte() {
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
	public void Compile_DwDirective_SameAsWord() {
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
	public void Compile_EndDirective_AddsTerminator() {
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
	public void Compile_Labels_AreTracked() {
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
	public void Compile_InvalidDirective_ReportsError() {
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
	public void Compile_InvalidByteValue_ReportsError() {
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
	public void Compile_MultipleLines_CompileAll() {
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
	public void Compile_WordDirective_DecimalValue() {
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
	public void Compile_BlankLines_AreSkipped() {
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

/// <summary>
/// Tests for advanced script compilation features.
/// </summary>
public class AdvancedScriptCompilerTests {
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

	#region MacroProcessor Tests

	[Fact]
	public void MacroProcessor_Define_ReplacesSymbols() {
		// Arrange
		var processor = new MacroProcessor();
		processor.Define("MAX_HP", "999");

		// Act
		var result = processor.Expand("Set MAX_HP to player");

		// Assert
		Assert.Equal("Set 999 to player", result);
	}

	[Fact]
	public void MacroProcessor_IsDefined_ReturnsTrueForDefinedSymbol() {
		// Arrange
		var processor = new MacroProcessor();
		processor.Define("DEBUG", "1");

		// Assert
		Assert.True(processor.IsDefined("DEBUG"));
		Assert.False(processor.IsDefined("RELEASE"));
	}

	[Fact]
	public void MacroProcessor_Undefine_RemovesSymbol() {
		// Arrange
		var processor = new MacroProcessor();
		processor.Define("TEST", "1");
		Assert.True(processor.IsDefined("TEST"));

		// Act
		processor.Undefine("TEST");

		// Assert
		Assert.False(processor.IsDefined("TEST"));
	}

	[Fact]
	public void MacroProcessor_ParameterizedMacro_Expands() {
		// Arrange
		var processor = new MacroProcessor();
		processor.DefineMacro("ADD", ["a", "b"], "a + b");

		// Act
		var result = processor.Expand("result = ADD(5, 10)");

		// Assert
		Assert.Equal("result = 5 + 10", result);
	}

	[Fact]
	public void MacroProcessor_ProcessDirectives_ifdef() {
		// Arrange
		var processor = new MacroProcessor();
		processor.Define("DEBUG", "1");

		var lines = new[] {
			"always included",
			"#ifdef DEBUG",
			"debug only",
			"#endif",
			"also always"
		};

		// Act
		var result = processor.ProcessDirectives(lines);

		// Assert
		Assert.Equal(3, result.Count);
		Assert.Equal("always included", result[0]);
		Assert.Equal("debug only", result[1]);
		Assert.Equal("also always", result[2]);
	}

	[Fact]
	public void MacroProcessor_ProcessDirectives_ifndef() {
		// Arrange
		var processor = new MacroProcessor();

		var lines = new[] {
			"#ifndef RELEASE",
			"debug code",
			"#endif"
		};

		// Act
		var result = processor.ProcessDirectives(lines);

		// Assert
		Assert.Single(result);
		Assert.Equal("debug code", result[0]);
	}

	[Fact]
	public void MacroProcessor_ProcessDirectives_else() {
		// Arrange
		var processor = new MacroProcessor();

		var lines = new[] {
			"#ifdef DEBUG",
			"debug",
			"#else",
			"release",
			"#endif"
		};

		// Act
		var result = processor.ProcessDirectives(lines);

		// Assert
		Assert.Single(result);
		Assert.Equal("release", result[0]);
	}

	[Fact]
	public void MacroProcessor_ProcessDirectives_NestedConditionals() {
		// Arrange
		var processor = new MacroProcessor();
		processor.Define("OUTER", "1");

		var lines = new[] {
			"#ifdef OUTER",
			"outer",
			"#ifdef INNER",
			"inner",
			"#endif",
			"outer end",
			"#endif"
		};

		// Act
		var result = processor.ProcessDirectives(lines);

		// Assert
		Assert.Equal(2, result.Count);
		Assert.Equal("outer", result[0]);
		Assert.Equal("outer end", result[1]);
	}

	[Fact]
	public void MacroProcessor_ProcessDirectives_DefineInDirective() {
		// Arrange
		var processor = new MacroProcessor();

		var lines = new[] {
			"#define VALUE 42",
			"result = VALUE"
		};

		// Act
		var result = processor.ProcessDirectives(lines);

		// Assert
		Assert.Single(result);
		Assert.Equal("result = 42", result[0]);
	}

	#endregion

	#region ScriptLanguageDefinition Tests

	[Fact]
	public void ScriptLanguageDefinition_AddControlCode_AddsToCollection() {
		// Arrange
		var def = new ScriptLanguageDefinition();

		// Act
		def.AddControlCode("END", [0x00]);
		def.AddControlCode("WAIT", [0xfd], new ScriptLanguageDefinition.ControlCodeParam("frames", ScriptLanguageDefinition.ControlCodeParamType.Byte));

		// Assert
		Assert.Equal(2, def.ControlCodes.Count);
		Assert.True(def.ControlCodes.ContainsKey("END"));
		Assert.True(def.ControlCodes.ContainsKey("WAIT"));
	}

	[Fact]
	public void ScriptLanguageDefinition_CreateNesRpgLanguage_HasStandardCodes() {
		// Act
		var def = ScriptLanguageDefinition.CreateNesRpgLanguage();

		// Assert
		Assert.True(def.ControlCodes.ContainsKey("END"));
		Assert.True(def.ControlCodes.ContainsKey("NEWLINE"));
		Assert.True(def.ControlCodes.ContainsKey("WAIT"));
		Assert.Equal("NES RPG Script", def.Name);
	}

	[Fact]
	public void ScriptLanguageDefinition_ExportToJson_ProducesValidJson() {
		// Arrange
		var def = new ScriptLanguageDefinition { Name = "Test" };
		def.AddControlCode("END", [0x00]);

		// Act
		var json = def.ExportToJson();

		// Assert
		Assert.Contains("\"name\": \"Test\"", json);
		Assert.Contains("\"controlCodes\"", json);
		Assert.Contains("\"END\"", json);
	}

	[Fact]
	public void ScriptLanguageDefinition_LoadFromJson_ParsesName() {
		// Arrange
		var json = "{ \"name\": \"Custom Script\" }";

		// Act
		var def = ScriptLanguageDefinition.LoadFromJson(json);

		// Assert
		Assert.Equal("Custom Script", def.Name);
	}

	#endregion

	#region IncludeResolver Tests

	[Fact]
	public void IncludeResolver_ProcessContent_HandlesSimpleContent() {
		// Arrange
		var resolver = new IncludeResolver();
		var content = "line 1\nline 2\nline 3";

		// Act
		var result = resolver.ProcessContent(content);

		// Assert
		Assert.Empty(result.Errors);
		Assert.Equal(3, result.Lines.Count);
		Assert.Equal("line 1", result.Lines[0].Content);
		Assert.Equal(1, result.Lines[0].LineNumber);
	}

	[Fact]
	public void IncludeResolver_AddSearchPath_AddsPath() {
		// Arrange
		var resolver = new IncludeResolver();

		// Act - Should not throw
		resolver.AddSearchPath(@"C:\Scripts");
		resolver.AddSearchPath(@"C:\Scripts\Common");

		// Assert - Can't directly verify, but method completes without error
		Assert.True(true);
	}

	#endregion

	#region AdvancedScriptCompiler Tests

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_BasicDirectives() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		// Act
		var result = compiler.CompileContent(".byte $ff, $00");

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Equal(2, result.Length);
		Assert.Equal(0xff, result[0]);
		Assert.Equal(0x00, result[1]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_WithMacros() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);
		compiler.Define("TERM", "$00");

		var content = @"#define END_BYTE $ff
.byte END_BYTE";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Single(result);
		Assert.Equal(0xff, result[0]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_Labels() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		var content = @"start:
.byte $01
middle:
.byte $02
end:
.byte $03";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Equal(3, result.Length);
		Assert.Equal(0, compiler.Symbols["start"]);
		Assert.Equal(1, compiler.Symbols["middle"]);
		Assert.Equal(2, compiler.Symbols["end"]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_AlignDirective() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		var content = @".byte $01
.align 4
.byte $02";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Equal(5, result.Length); // 1 byte + 3 padding + 1 byte
		Assert.Equal(0x01, result[0]);
		Assert.Equal(0x00, result[1]);
		Assert.Equal(0x00, result[2]);
		Assert.Equal(0x00, result[3]);
		Assert.Equal(0x02, result[4]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_ConditionalCompilation() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);
		compiler.Define("DEBUG");

		var content = @"#ifdef DEBUG
.byte $db
#else
.byte $00
#endif";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Single(result);
		Assert.Equal(0xdb, result[0]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_SourceMap() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		var content = @".byte $01
.byte $02
.byte $03";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.NotEmpty(compiler.SourceMap);
		Assert.Equal(3, compiler.SourceMap.Count);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_WithLanguageDefinition() {
		// Arrange
		var table = CreateSimpleTable();
		var language = ScriptLanguageDefinition.CreateNesRpgLanguage();
		var compiler = new AdvancedScriptCompiler(table, language);

		var content = ".end";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Single(result);
		Assert.Equal(0x00, result[0]); // Default terminator
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_WordWithLabelReference() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		var content = @".word target
.byte $ff
target:
.byte $00";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Equal(4, result.Length);
		// target is at offset 3, stored little-endian
		Assert.Equal(0x03, result[0]);
		Assert.Equal(0x00, result[1]);
	}

	[Fact]
	public void AdvancedScriptCompiler_CompileContent_ForwardReference() {
		// Arrange
		var table = CreateSimpleTable();
		var compiler = new AdvancedScriptCompiler(table);

		var content = @".word end_label
.byte $01, $02, $03
end_label:";

		// Act
		var result = compiler.CompileContent(content);

		// Assert
		Assert.Empty(compiler.Errors);
		Assert.Equal(5, result.Length);
		Assert.Equal(0x05, result[0]); // end_label is at offset 5
		Assert.Equal(0x00, result[1]);
	}

	#endregion

	#region SyntaxHighlighting Tests

	[Fact]
	public void GetSyntaxTokens_DetectsComments() {
		// Arrange
		var content = "; This is a comment";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		Assert.Contains(tokens, t => t.Type == SyntaxTokenType.Comment);
	}

	[Fact]
	public void GetSyntaxTokens_DetectsLabels() {
		// Arrange
		var content = "label_name:";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		Assert.Contains(tokens, t => t.Type == SyntaxTokenType.Label);
	}

	[Fact]
	public void GetSyntaxTokens_DetectsDirectives() {
		// Arrange
		var content = ".byte $ff";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		Assert.Contains(tokens, t => t.Type == SyntaxTokenType.Directive);
	}

	[Fact]
	public void GetSyntaxTokens_DetectsNumbers() {
		// Arrange
		var content = ".byte $ff, 0x10, 255";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		var numberTokens = tokens.Where(t => t.Type == SyntaxTokenType.Number).ToList();
		Assert.Equal(3, numberTokens.Count);
	}

	[Fact]
	public void GetSyntaxTokens_DetectsControlCodes() {
		// Arrange
		var content = "{END}{NEWLINE}";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		var controlTokens = tokens.Where(t => t.Type == SyntaxTokenType.ControlCode).ToList();
		Assert.Equal(2, controlTokens.Count);
	}

	[Fact]
	public void GetSyntaxTokens_DetectsPreprocessor() {
		// Arrange
		var content = "#ifdef DEBUG";

		// Act
		var tokens = AdvancedScriptCompiler.GetSyntaxTokens(content);

		// Assert
		Assert.Contains(tokens, t => t.Type == SyntaxTokenType.Preprocessor);
	}

	#endregion
}
