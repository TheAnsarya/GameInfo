using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services;

public class ScriptEditorServiceTests
{
	private readonly ScriptEditorService _service = new();

	#region Script Definition Tests

	[Fact]
	public void LoadScriptDefinition_ValidJson_ReturnsDefinition()
	{
		// Arrange
		var json = """
		{
			"name": "Test Script",
			"platform": "NES",
			"endianness": "Little",
			"terminatorByte": 255,
			"opcodes": [
				{ "code": 0, "mnemonic": "END", "isTerminator": true },
				{ "code": 1, "mnemonic": "NOP" }
			]
		}
		""";

		// Act
		var definition = _service.LoadScriptDefinition(json);

		// Assert
		definition.Name.Should().Be("Test Script");
		definition.Platform.Should().Be(ScriptPlatform.NES);
		definition.Endianness.Should().Be(Endianness.Little);
		definition.TerminatorByte.Should().Be(0xff);
		definition.Opcodes.Should().HaveCount(2);
	}

	[Fact]
	public void LoadScriptDefinition_EmptyJson_ThrowsException()
	{
		// Arrange
		var json = "";

		// Act
		var act = () => _service.LoadScriptDefinition(json);

		// Assert
		act.Should().Throw<ArgumentException>();
	}

	[Fact]
	public void LoadScriptDefinition_NoOpcodes_ThrowsException()
	{
		// Arrange
		var json = """
		{
			"name": "Test",
			"opcodes": []
		}
		""";

		// Act
		var act = () => _service.LoadScriptDefinition(json);

		// Assert
		act.Should().Throw<InvalidOperationException>()
			.WithMessage("*at least one opcode*");
	}

	[Fact]
	public void LoadScriptDefinition_DuplicateOpcodes_ThrowsException()
	{
		// Arrange
		var json = """
		{
			"name": "Test",
			"opcodes": [
				{ "code": 0, "mnemonic": "END" },
				{ "code": 0, "mnemonic": "NOP" }
			]
		}
		""";

		// Act
		var act = () => _service.LoadScriptDefinition(json);

		// Assert
		act.Should().Throw<InvalidOperationException>()
			.WithMessage("*Duplicate*");
	}

	#endregion

	#region Parsing Tests

	[Fact]
	public void ParseScript_SimpleScript_ReturnsCorrectInstructions()
	{
		// Arrange
		var definition = CreateTestDefinition();
		// NOP, JUMP $0010, END (terminator 0xff)
		byte[] data = [0x01, 0x02, 0x10, 0x00, 0xff];

		// Act
		var script = _service.ParseScript(data, 0, definition);

		// Assert
		script.Instructions.Should().HaveCount(3);
		script.Instructions[0].Mnemonic.Should().Be("NOP");
		script.Instructions[1].Mnemonic.Should().Be("JUMP");
		script.Instructions[1].Parameters.Should().HaveCount(1);
		script.Instructions[1].Parameters[0].Value.Should().Be(0x10);
		script.Instructions[2].Mnemonic.Should().Be("END");
		script.Length.Should().Be(5);
	}

	[Fact]
	public void ParseScript_WithTerminator_StopsAtTerminator()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff, 0x01, 0x01]; // NOP, END, more data that should be ignored

		// Act
		var script = _service.ParseScript(data, 0, definition);

		// Assert
		script.Instructions.Should().HaveCount(2);
		script.Length.Should().Be(2);
	}

	[Fact]
	public void ParseScript_UnknownOpcode_TreatsAsDataByte()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0xaa, 0xff]; // Unknown opcode, END

		// Act
		var script = _service.ParseScript(data, 0, definition);

		// Assert
		script.Instructions.Should().HaveCount(2);
		script.Instructions[0].Mnemonic.Should().Be(".byte");
		script.Instructions[0].Comment.Should().Contain("Unknown");
	}

	[Fact]
	public void ParseScript_WithOffset_StartsFromCorrectPosition()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0xaa, 0xbb, 0x01, 0xff]; // junk, junk, NOP, END

		// Act
		var script = _service.ParseScript(data, 2, definition);

		// Assert
		script.Offset.Should().Be(2);
		script.Instructions[0].Mnemonic.Should().Be("NOP");
		script.Instructions[0].Offset.Should().Be(2);
	}

	[Fact]
	public void ParseScript_GeneratesLabelsForJumpTargets()
	{
		// Arrange
		var definition = CreateTestDefinition();
		// NOP at 0, JUMP to offset 4 (little-endian: 04 00), NOP at 4, END at 5
		byte[] data = [0x01, 0x02, 0x04, 0x00, 0x01, 0xff];

		// Act
		var script = _service.ParseScript(data, 0, definition);

		// Assert
		script.Labels.Should().ContainKey(4);
	}

	#endregion

	#region Decompilation Tests

	[Fact]
	public void DecompileScript_BasicScript_ReturnsFormattedText()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff]; // NOP, END
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var text = _service.DecompileScript(script);

		// Assert
		text.Should().Contain("NOP");
		text.Should().Contain("END");
	}

	[Fact]
	public void DecompileScript_WithHeader_IncludesScriptInfo()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var text = _service.DecompileScript(script, new DecompileOptions { IncludeHeader = true });

		// Assert
		text.Should().Contain("; Script:");
		text.Should().Contain("; Offset:");
		text.Should().Contain("; Length:");
	}

	[Fact]
	public void DecompileScript_WithOffsets_IncludesOffsetComments()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var text = _service.DecompileScript(script, new DecompileOptions { IncludeOffsets = true });

		// Assert
		text.Should().Contain("$000000:");
	}

	[Fact]
	public void DecompileScript_NoHeader_OmitsScriptInfo()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var text = _service.DecompileScript(script, new DecompileOptions { IncludeHeader = false, IncludeOffsets = false });

		// Assert
		text.Should().NotContain("; Script:");
	}

	#endregion

	#region Compilation Tests

	[Fact]
	public void CompileScript_BasicSource_ReturnsScript()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		NOP
		END
		""";

		// Act
		var script = _service.CompileScript(source, definition);

		// Assert
		script.Instructions.Should().HaveCount(2);
		script.Instructions[0].Mnemonic.Should().Be("NOP");
		script.Instructions[1].Mnemonic.Should().Be("END");
	}

	[Fact]
	public void CompileScript_WithLabels_ResolvesReferences()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		start:
		NOP
		JUMP start
		END
		""";

		// Act
		var script = _service.CompileScript(source, definition);

		// Assert
		script.Instructions.Should().HaveCount(3);
		script.Instructions[1].Parameters[0].Value.Should().Be(0); // start label is at offset 0
	}

	[Fact]
	public void CompileScript_WithHexValues_ParsesCorrectly()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		JUMP $0010
		END
		""";

		// Act
		var script = _service.CompileScript(source, definition);

		// Assert
		script.Instructions[0].Parameters[0].Value.Should().Be(0x10);
	}

	[Fact]
	public void CompileScript_WithComments_IgnoresComments()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		; This is a comment
		NOP ; inline comment
		END
		""";

		// Act
		var script = _service.CompileScript(source, definition);

		// Assert
		script.Instructions.Should().HaveCount(2);
	}

	[Fact]
	public void CompileScript_UndefinedLabel_ThrowsException()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		JUMP undefined_label
		END
		""";

		// Act
		var act = () => _service.CompileScript(source, definition);

		// Assert
		act.Should().Throw<InvalidOperationException>()
			.WithMessage("*Undefined label*");
	}

	[Fact]
	public void CompileScript_UnknownMnemonic_ThrowsException()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		UNKNOWN_INSTRUCTION
		END
		""";

		// Act
		var act = () => _service.CompileScript(source, definition);

		// Assert
		act.Should().Throw<InvalidOperationException>()
			.WithMessage("*Unknown mnemonic*");
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportScript_ReturnsRawBytes()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] originalData = [0x01, 0x02, 0x10, 0x00, 0xff];
		var script = _service.ParseScript(originalData, 0, definition);

		// Act
		var exported = _service.ExportScript(script);

		// Assert
		exported.Should().BeEquivalentTo(originalData);
	}

	[Fact]
	public void CompileAndExport_RoundTrip_PreservesBytes()
	{
		// Arrange
		var definition = CreateTestDefinition();
		var source = """
		NOP
		JUMP $0010
		END
		""";

		// Act
		var script = _service.CompileScript(source, definition);
		var exported = _service.ExportScript(script);

		// Assert
		exported.Should().BeEquivalentTo(new byte[] { 0x01, 0x02, 0x10, 0x00, 0xff });
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void ValidateScript_ValidScript_ReturnsNoErrors()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var result = _service.ValidateScript(script, definition);

		// Assert
		result.IsValid.Should().BeTrue();
		result.Errors.Should().BeEmpty();
	}

	[Fact]
	public void ValidateScript_MissingTerminator_ReturnsWarning()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0x01, 0x01]; // NOPs with no terminator
		var script = _service.ParseScript(data, 0, definition, maxLength: 3);

		// Act
		var result = _service.ValidateScript(script, definition);

		// Assert
		result.Warnings.Should().NotBeEmpty();
		result.Warnings.Should().Contain(w => w.Message.Contains("terminator"));
	}

	#endregion

	#region Cross-Reference Tests

	[Fact]
	public void GetCrossReferences_WithJumps_ReturnsCrossRefs()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x02, 0x04, 0x00, 0x01, 0xff]; // JUMP $0004, NOP, END
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var refs = _service.GetCrossReferences(script);

		// Assert
		refs.Should().NotBeEmpty();
		refs[0].TargetOffset.Should().Be(4);
	}

	#endregion

	#region Template Tests

	[Fact]
	public void GetTemplates_ReturnsNonEmptyList()
	{
		// Act
		var templates = _service.GetTemplates();

		// Assert
		templates.Should().NotBeEmpty();
	}

	[Fact]
	public void GetTemplates_AllTemplatesHaveValidDefinitions()
	{
		// Act
		var templates = _service.GetTemplates();

		// Assert
		foreach (var template in templates)
		{
			template.Name.Should().NotBeNullOrEmpty();
			template.Definition.Should().NotBeNull();
			template.Definition.Opcodes.Should().NotBeEmpty();
		}
	}

	[Fact]
	public void GetTemplates_ContainsDragonQuestTemplate()
	{
		// Act
		var templates = _service.GetTemplates();

		// Assert
		templates.Should().Contain(t => t.Name.Contains("Dragon Quest"));
	}

	#endregion

	#region Label Tests

	[Fact]
	public void GenerateLabels_ForJumpTargets_CreatesLabels()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x02, 0x03, 0x00, 0xff]; // JUMP to offset 3, END at 3
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var labels = _service.GenerateLabels(script);

		// Assert
		labels.Should().ContainKey(3);
	}

	[Fact]
	public void ResolveLabel_ExistingLabel_ReturnsOffset()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x02, 0x03, 0x00, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Get the label name for offset 3
		var labelName = script.Labels[3];

		// Act
		var offset = _service.ResolveLabel(script, labelName);

		// Assert
		offset.Should().Be(3);
	}

	[Fact]
	public void ResolveLabel_NonExistingLabel_ReturnsNull()
	{
		// Arrange
		var definition = CreateTestDefinition();
		byte[] data = [0x01, 0xff];
		var script = _service.ParseScript(data, 0, definition);

		// Act
		var offset = _service.ResolveLabel(script, "nonexistent");

		// Assert
		offset.Should().BeNull();
	}

	#endregion

	#region Detection Tests

	[Fact]
	public void DetectScripts_WithValidScripts_ReturnsDetectedScripts()
	{
		// Arrange
		var definition = CreateTestDefinition();
		// Two scripts: NOP NOP END at 0, NOP END at 5
		byte[] data = [0x01, 0x01, 0xff, 0xaa, 0xaa, 0x01, 0xff];
		var options = new ScriptDetectionOptions
		{
			StartOffset = 0,
			EndOffset = data.Length,
			MinInstructions = 2,
			MinConfidence = 30,
			RequireTerminator = true
		};

		// Act
		var detected = _service.DetectScripts(data, definition, options);

		// Assert
		detected.Should().NotBeEmpty();
	}

	#endregion

	#region Helper Methods

	private static ScriptDefinition CreateTestDefinition()
	{
		return new ScriptDefinition
		{
			Name = "Test Script",
			Platform = ScriptPlatform.NES,
			Endianness = Endianness.Little,
			TerminatorByte = 0xff,
			Opcodes =
			[
				new ScriptOpcode { Code = 0x01, Mnemonic = "NOP", Description = "No operation" },
				new ScriptOpcode { Code = 0x02, Mnemonic = "JUMP", Description = "Jump", IsJump = true,
					Parameters = [new OpcodeParameter { Name = "target", Type = ParameterType.Pointer, Size = 2 }] },
				new ScriptOpcode { Code = 0x03, Mnemonic = "CALL", Description = "Call subroutine", IsCall = true,
					Parameters = [new OpcodeParameter { Name = "target", Type = ParameterType.Pointer, Size = 2 }] },
				new ScriptOpcode { Code = 0xff, Mnemonic = "END", Description = "End", IsTerminator = true }
			]
		};
	}

	#endregion
}
