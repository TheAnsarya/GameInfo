namespace DarkReposEditor.Core.Interfaces;

/// <summary>
/// Service for editing game scripts, event data, and scripted sequences.
/// Supports bytecode parsing, decompilation, and recompilation.
/// </summary>
public interface IScriptEditorService
{
	/// <summary>
	/// Loads a script definition (opcode table) from JSON.
	/// </summary>
	ScriptDefinition LoadScriptDefinition(string json);

	/// <summary>
	/// Parses raw script bytecode into a GameScript object.
	/// </summary>
	GameScript ParseScript(byte[] data, int offset, ScriptDefinition definition, int? maxLength = null);

	/// <summary>
	/// Parses multiple scripts from a script table.
	/// </summary>
	List<GameScript> ParseScriptTable(byte[] data, int tableOffset, int count, ScriptDefinition definition, PointerFormat pointerFormat);

	/// <summary>
	/// Decompiles a script to human-readable text format.
	/// </summary>
	string DecompileScript(GameScript script, DecompileOptions? options = null);

	/// <summary>
	/// Compiles human-readable script text to a GameScript object.
	/// </summary>
	GameScript CompileScript(string source, ScriptDefinition definition);

	/// <summary>
	/// Exports a script to bytecode.
	/// </summary>
	byte[] ExportScript(GameScript script);

	/// <summary>
	/// Validates a script for errors.
	/// </summary>
	ScriptValidationResult ValidateScript(GameScript script, ScriptDefinition definition);

	/// <summary>
	/// Gets all cross-references (jumps, calls) within a script.
	/// </summary>
	List<ScriptCrossReference> GetCrossReferences(GameScript script);

	/// <summary>
	/// Gets all text references in a script.
	/// </summary>
	List<ScriptTextReference> GetTextReferences(GameScript script, ScriptDefinition definition);

	/// <summary>
	/// Attempts to detect scripts in ROM data.
	/// </summary>
	List<DetectedScript> DetectScripts(byte[] data, ScriptDefinition definition, ScriptDetectionOptions options);

	/// <summary>
	/// Gets predefined script definitions for common game engines.
	/// </summary>
	List<ScriptDefinitionTemplate> GetTemplates();

	/// <summary>
	/// Resolves a label name to an offset.
	/// </summary>
	int? ResolveLabel(GameScript script, string label);

	/// <summary>
	/// Generates labels for all jump targets in a script.
	/// </summary>
	Dictionary<int, string> GenerateLabels(GameScript script, string prefix = "loc_");
}

#region Script Definition

/// <summary>
/// Defines the script language/bytecode format for a game.
/// </summary>
public class ScriptDefinition
{
	public string Name { get; set; } = "";
	public string Description { get; set; } = "";
	public string GameTitle { get; set; } = "";
	public ScriptPlatform Platform { get; set; } = ScriptPlatform.NES;
	public Endianness Endianness { get; set; } = Endianness.Little;
	public List<ScriptOpcode> Opcodes { get; set; } = [];
	public byte? TerminatorByte { get; set; }
	public int DefaultPointerSize { get; set; } = 2;
	public bool HasVariableLengthOpcodes { get; set; }
	public Dictionary<string, int> Constants { get; set; } = [];
	public Dictionary<int, string> TextBankMap { get; set; } = [];
}

/// <summary>
/// Defines a single opcode in the script language.
/// </summary>
public class ScriptOpcode
{
	public byte Code { get; set; }
	public string Mnemonic { get; set; } = "";
	public string Description { get; set; } = "";
	public OpcodeCategory Category { get; set; } = OpcodeCategory.Misc;
	public List<OpcodeParameter> Parameters { get; set; } = [];
	public int? FixedLength { get; set; }
	public bool IsTerminator { get; set; }
	public bool IsConditional { get; set; }
	public bool IsJump { get; set; }
	public bool IsCall { get; set; }
	public bool IsReturn { get; set; }
	public bool HasTextReference { get; set; }
	public string? TextParameterName { get; set; }
}

/// <summary>
/// Defines a parameter for an opcode.
/// </summary>
public class OpcodeParameter
{
	public string Name { get; set; } = "";
	public ParameterType Type { get; set; } = ParameterType.Byte;
	public int Size { get; set; } = 1;
	public bool IsOptional { get; set; }
	public Dictionary<int, string>? EnumValues { get; set; }
	public int? MinValue { get; set; }
	public int? MaxValue { get; set; }
	public string? Description { get; set; }
}

public enum ScriptPlatform
{
	NES,
	SNES,
	GB,
	GBC,
	GBA,
	Genesis,
	Custom
}

public enum OpcodeCategory
{
	Flow,       // Jumps, branches, calls, returns
	Dialog,     // Text display, choices
	Event,      // Triggers, flags, variables
	Character,  // NPC movement, behavior
	Battle,     // Combat actions, AI
	Sound,      // Music, SFX
	Graphics,   // Screen effects, animations
	Memory,     // RAM manipulation
	Math,       // Arithmetic operations
	Misc        // Other
}

public enum ParameterType
{
	Byte,
	SByte,
	Word,
	SWord,
	DWord,
	Pointer,
	TextId,
	MapId,
	ItemId,
	NpcId,
	FlagId,
	VariableId,
	SoundId,
	SpriteId,
	Enum,
	Offset       // Relative offset for jumps
}

#endregion

#region Script Model

/// <summary>
/// Represents a parsed game script/event bytecode.
/// </summary>
public class GameScript
{
	public string Name { get; set; } = "";
	public int Offset { get; set; }
	public int Length { get; set; }
	public List<ScriptInstruction> Instructions { get; set; } = [];
	public Dictionary<int, string> Labels { get; set; } = [];
	public List<string> Comments { get; set; } = [];
	public bool IsModified { get; set; }
	public byte[] OriginalBytes { get; set; } = [];
}

/// <summary>
/// Represents a single instruction in a script.
/// </summary>
public class ScriptInstruction
{
	public int Offset { get; set; }
	public int Length { get; set; }
	public byte Opcode { get; set; }
	public string Mnemonic { get; set; } = "";
	public List<ScriptParameterValue> Parameters { get; set; } = [];
	public string? Comment { get; set; }
	public string? Label { get; set; }
	public byte[] RawBytes { get; set; } = [];
	public bool IsModified { get; set; }

	/// <summary>
	/// Gets the formatted display string for the instruction.
	/// </summary>
	public string DisplayText
	{
		get
		{
			if (Parameters.Count == 0)
				return Mnemonic;

			var paramStr = string.Join(", ", Parameters.Select(p => p.DisplayValue));
			return $"{Mnemonic} {paramStr}";
		}
	}
}

/// <summary>
/// Represents a parameter value in an instruction.
/// </summary>
public class ScriptParameterValue
{
	public string Name { get; set; } = "";
	public ParameterType Type { get; set; }
	public long Value { get; set; }
	public string? EnumName { get; set; }
	public byte[] RawBytes { get; set; } = [];

	/// <summary>
	/// Gets the formatted display value.
	/// </summary>
	public string DisplayValue
	{
		get
		{
			if (!string.IsNullOrEmpty(EnumName))
				return EnumName;

			return Type switch
			{
				ParameterType.Byte or ParameterType.SByte => $"${Value:x2}",
				ParameterType.Word or ParameterType.SWord => $"${Value:x4}",
				ParameterType.DWord => $"${Value:x8}",
				ParameterType.Pointer or ParameterType.Offset => $"${Value:x4}",
				ParameterType.TextId => $"TEXT_{Value:x4}",
				ParameterType.MapId => $"MAP_{Value:x2}",
				ParameterType.ItemId => $"ITEM_{Value:x2}",
				ParameterType.NpcId => $"NPC_{Value:x2}",
				ParameterType.FlagId => $"FLAG_{Value:x3}",
				ParameterType.VariableId => $"VAR_{Value:x2}",
				ParameterType.SoundId => $"SND_{Value:x2}",
				ParameterType.SpriteId => $"SPR_{Value:x2}",
				_ => $"${Value:x}"
			};
		}
	}
}

#endregion

#region Decompilation

/// <summary>
/// Options for script decompilation.
/// </summary>
public class DecompileOptions
{
	public bool IncludeComments { get; set; } = true;
	public bool IncludeOffsets { get; set; } = true;
	public bool IncludeRawBytes { get; set; } = false;
	public bool UseSymbolicNames { get; set; } = true;
	public string LabelPrefix { get; set; } = "loc_";
	public string IndentString { get; set; } = "\t";
	public bool IndentAfterConditional { get; set; } = true;
	public bool GroupByBlock { get; set; } = true;
	public bool IncludeHeader { get; set; } = true;
}

#endregion

#region Validation

/// <summary>
/// Result of script validation.
/// </summary>
public class ScriptValidationResult
{
	public bool IsValid => Errors.Count == 0;
	public List<ScriptValidationError> Errors { get; set; } = [];
	public List<ScriptValidationError> Warnings { get; set; } = [];
}

/// <summary>
/// Represents a validation error or warning.
/// </summary>
public class ScriptValidationError
{
	public int InstructionIndex { get; set; }
	public int Offset { get; set; }
	public string Message { get; set; } = "";
	public ScriptValidationSeverity Severity { get; set; } = ScriptValidationSeverity.Error;
	public string? SuggestedFix { get; set; }
}

public enum ScriptValidationSeverity
{
	Info,
	Warning,
	Error
}

#endregion

#region Cross-References

/// <summary>
/// Represents a cross-reference (jump/call target) in a script.
/// </summary>
public class ScriptCrossReference
{
	public int SourceOffset { get; set; }
	public int TargetOffset { get; set; }
	public CrossReferenceType Type { get; set; }
	public string SourceLabel { get; set; } = "";
	public string TargetLabel { get; set; } = "";
}

public enum CrossReferenceType
{
	Jump,
	ConditionalJump,
	Call,
	TableEntry
}

/// <summary>
/// Represents a text reference in a script.
/// </summary>
public class ScriptTextReference
{
	public int InstructionOffset { get; set; }
	public int TextId { get; set; }
	public int? TextBank { get; set; }
	public string? PreviewText { get; set; }
	public string InstructionMnemonic { get; set; } = "";
}

#endregion

#region Detection

/// <summary>
/// Options for script detection.
/// </summary>
public class ScriptDetectionOptions
{
	public int StartOffset { get; set; }
	public int EndOffset { get; set; }
	public int MinInstructions { get; set; } = 5;
	public int MaxInstructions { get; set; } = 1000;
	public int MinConfidence { get; set; } = 60;
	public bool RequireTerminator { get; set; } = true;
	public bool AllowOverlap { get; set; } = false;
}

/// <summary>
/// Represents a detected script candidate.
/// </summary>
public class DetectedScript
{
	public int Offset { get; set; }
	public int Length { get; set; }
	public int InstructionCount { get; set; }
	public int Confidence { get; set; }
	public bool HasTerminator { get; set; }
	public List<string> UniqueMnemonics { get; set; } = [];
	public string? DetectionNotes { get; set; }
}

#endregion

#region Templates

/// <summary>
/// Predefined script definition template.
/// </summary>
public class ScriptDefinitionTemplate
{
	public string Name { get; set; } = "";
	public string Description { get; set; } = "";
	public string Category { get; set; } = "";
	public ScriptDefinition Definition { get; set; } = new();
}

#endregion

#region Pointer Format

/// <summary>
/// Defines how script pointers are stored.
/// </summary>
public class PointerFormat
{
	public int Size { get; set; } = 2;
	public Endianness Endianness { get; set; } = Endianness.Little;
	public int BaseAddress { get; set; }
	public int BankSize { get; set; }
	public bool IsRelative { get; set; }
	public int HeaderSize { get; set; }
}

#endregion
