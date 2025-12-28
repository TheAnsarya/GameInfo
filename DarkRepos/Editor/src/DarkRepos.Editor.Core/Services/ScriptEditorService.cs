using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace DarkRepos.Editor.Core.Services;

using DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for editing game scripts, event data, and scripted sequences.
/// </summary>
public class ScriptEditorService : IScriptEditorService
{
	private static readonly JsonSerializerOptions JsonOptions = new()
	{
		PropertyNameCaseInsensitive = true,
		WriteIndented = true,
		Converters = { new JsonStringEnumConverter() }
	};

	#region GameScript Definition

	public ScriptDefinition LoadScriptDefinition(string json)
	{
		if (string.IsNullOrWhiteSpace(json))
			throw new ArgumentException("JSON cannot be empty", nameof(json));

		var definition = JsonSerializer.Deserialize<ScriptDefinition>(json, JsonOptions)
			?? throw new InvalidOperationException("Failed to deserialize GameScript definition");

		ValidateDefinition(definition);
		return definition;
	}

	private static void ValidateDefinition(ScriptDefinition definition)
	{
		if (string.IsNullOrWhiteSpace(definition.Name))
			throw new InvalidOperationException("GameScript definition must have a name");

		if (definition.Opcodes.Count == 0)
			throw new InvalidOperationException("GameScript definition must have at least one opcode");

		// Check for duplicate opcodes
		var duplicates = definition.Opcodes.GroupBy(o => o.Code).Where(g => g.Count() > 1).ToList();
		if (duplicates.Count > 0)
		{
			var codes = string.Join(", ", duplicates.Select(g => $"0x{g.Key:x2}"));
			throw new InvalidOperationException($"Duplicate opcode codes: {codes}");
		}
	}

	#endregion

	#region Parsing

	public GameScript ParseScript(byte[] data, int offset, ScriptDefinition definition, int? maxLength = null)
	{
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(definition);

		if (offset < 0 || offset >= data.Length)
			throw new ArgumentOutOfRangeException(nameof(offset));

		var script = new GameScript
		{
			Name = $"Script_{offset:x6}",
			Offset = offset
		};

		var opcodeMap = definition.Opcodes.ToDictionary(o => o.Code);
		var position = offset;
		var endPosition = maxLength.HasValue ? Math.Min(offset + maxLength.Value, data.Length) : data.Length;
		var instructionIndex = 0;

		while (position < endPosition)
		{
			var opcode = data[position];

			// Check for terminator
			if (definition.TerminatorByte.HasValue && opcode == definition.TerminatorByte.Value)
			{
				// Add terminator instruction
				var termInst = new ScriptInstruction
				{
					Offset = position,
					Length = 1,
					Opcode = opcode,
					Mnemonic = "END",
					RawBytes = [opcode]
				};
				script.Instructions.Add(termInst);
				position++;
				break;
			}

			if (!opcodeMap.TryGetValue(opcode, out var opcodeDef))
			{
				// Unknown opcode - treat as data byte or stop
				var unknownInst = new ScriptInstruction
				{
					Offset = position,
					Length = 1,
					Opcode = opcode,
					Mnemonic = ".byte",
					Comment = "Unknown opcode",
					RawBytes = [opcode]
				};
				unknownInst.Parameters.Add(new ScriptParameterValue
				{
					Name = "value",
					Type = ParameterType.Byte,
					Value = opcode,
					RawBytes = [opcode]
				});
				script.Instructions.Add(unknownInst);
				position++;
				instructionIndex++;
				continue;
			}

			var instruction = ParseInstruction(data, position, opcodeDef, definition);
			script.Instructions.Add(instruction);
			position += instruction.Length;
			instructionIndex++;

			// Check for terminating instruction
			if (opcodeDef.IsTerminator && !opcodeDef.IsConditional)
				break;

			// Safety limit
			if (instructionIndex > 10000)
				break;
		}

		script.Length = position - offset;
		script.OriginalBytes = new byte[script.Length];
		Array.Copy(data, offset, script.OriginalBytes, 0, script.Length);

		// Generate labels for jump targets
		var labels = GenerateLabels(script);
		foreach (var kvp in labels)
		{
			script.Labels[kvp.Key] = kvp.Value;
			var targetInst = script.Instructions.FirstOrDefault(i => i.Offset == kvp.Key);
			if (targetInst != null)
				targetInst.Label = kvp.Value;
		}

		return script;
	}

	private ScriptInstruction ParseInstruction(byte[] data, int offset, ScriptOpcode opcodeDef, ScriptDefinition definition)
	{
		var instruction = new ScriptInstruction
		{
			Offset = offset,
			Opcode = opcodeDef.Code,
			Mnemonic = opcodeDef.Mnemonic
		};

		var position = offset + 1; // Skip opcode byte

		foreach (var paramDef in opcodeDef.Parameters)
		{
			var paramSize = GetParameterSize(paramDef);
			if (position + paramSize > data.Length)
				break;

			var paramValue = new ScriptParameterValue
			{
				Name = paramDef.Name,
				Type = paramDef.Type,
				RawBytes = new byte[paramSize]
			};

			Array.Copy(data, position, paramValue.RawBytes, 0, paramSize);
			paramValue.Value = ReadValue(data, position, paramSize, definition.Endianness, IsSignedType(paramDef.Type));

			// Resolve enum name if applicable
			if (paramDef.EnumValues?.TryGetValue((int)paramValue.Value, out var enumName) == true)
				paramValue.EnumName = enumName;

			instruction.Parameters.Add(paramValue);
			position += paramSize;
		}

		instruction.Length = position - offset;
		instruction.RawBytes = new byte[instruction.Length];
		Array.Copy(data, offset, instruction.RawBytes, 0, instruction.Length);

		return instruction;
	}

	public List<GameScript> ParseScriptTable(byte[] data, int tableOffset, int count, ScriptDefinition definition, PointerFormat pointerFormat)
	{
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(definition);
		ArgumentNullException.ThrowIfNull(pointerFormat);

		var scripts = new List<GameScript>();
		var position = tableOffset;

		for (int i = 0; i < count; i++)
		{
			if (position + pointerFormat.Size > data.Length)
				break;

			var pointer = ReadValue(data, position, pointerFormat.Size, pointerFormat.Endianness, false);

			// Calculate actual offset
			var scriptOffset = (int)pointer;
			if (pointerFormat.IsRelative)
				scriptOffset += position;
			else
				scriptOffset = scriptOffset - pointerFormat.BaseAddress + pointerFormat.HeaderSize;

			if (scriptOffset >= 0 && scriptOffset < data.Length)
			{
				try
				{
					var script = ParseScript(data, scriptOffset, definition);
					script.Name = $"Script_{i:d3}";
					scripts.Add(script);
				}
				catch
				{
					// Skip invalid scripts
				}
			}

			position += pointerFormat.Size;
		}

		return scripts;
	}

	#endregion

	#region Decompilation

	public string DecompileScript(GameScript script, DecompileOptions? options = null)
	{
		ArgumentNullException.ThrowIfNull(script);

		options ??= new DecompileOptions();
		var sb = new StringBuilder();

		if (options.IncludeHeader)
		{
			sb.AppendLine($"; Script: {script.Name}");
			sb.AppendLine($"; Offset: ${script.Offset:x6}");
			sb.AppendLine($"; Length: {script.Length} bytes");
			sb.AppendLine($"; Instructions: {script.Instructions.Count}");
			sb.AppendLine();
		}

		var indentLevel = 0;

		foreach (var instruction in script.Instructions)
		{
			var line = new StringBuilder();

			// Label
			if (!string.IsNullOrEmpty(instruction.Label))
			{
				sb.AppendLine($"{instruction.Label}:");
				indentLevel = 0; // Reset indent at labels
			}

			// Indent
			for (int i = 0; i < indentLevel; i++)
				line.Append(options.IndentString);

			// Offset
			if (options.IncludeOffsets)
				line.Append($"${instruction.Offset:x6}: ");

			// Raw bytes
			if (options.IncludeRawBytes)
			{
				var bytes = string.Join(" ", instruction.RawBytes.Select(b => $"{b:x2}"));
				line.Append($"[{bytes}] ");
			}

			// Mnemonic and parameters
			line.Append(instruction.Mnemonic);

			if (instruction.Parameters.Count > 0)
			{
				line.Append(' ');
				var paramStrings = instruction.Parameters.Select(p =>
				{
					if (options.UseSymbolicNames && !string.IsNullOrEmpty(p.EnumName))
						return p.EnumName;

					// Check if this is a jump target
					if ((p.Type == ParameterType.Pointer || p.Type == ParameterType.Offset) &&
						script.Labels.TryGetValue((int)p.Value, out var label))
						return label;

					return p.DisplayValue;
				});
				line.Append(string.Join(", ", paramStrings));
			}

			// Comment
			if (options.IncludeComments && !string.IsNullOrEmpty(instruction.Comment))
				line.Append($" ; {instruction.Comment}");

			sb.AppendLine(line.ToString());

			// Adjust indent after conditional
			if (options.IndentAfterConditional)
			{
				// This is simplified - real implementation would track block structure
			}
		}

		return sb.ToString();
	}

	#endregion

	#region Compilation

	public GameScript CompileScript(string source, ScriptDefinition definition)
	{
		ArgumentNullException.ThrowIfNull(source);
		ArgumentNullException.ThrowIfNull(definition);

		var script = new GameScript();
		var opcodeMap = definition.Opcodes.ToDictionary(o => o.Mnemonic.ToUpperInvariant());
		var labels = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
		var labelReferences = new List<(int instructionIndex, int paramIndex, string label)>();
		var currentOffset = 0;

		// First pass: parse instructions and collect labels
		var lines = source.Split('\n', StringSplitOptions.TrimEntries);

		foreach (var line in lines)
		{
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith(';'))
				continue;

			var workLine = line;

			// Check for label
			if (workLine.EndsWith(':'))
			{
				var labelName = workLine[..^1].Trim();
				labels[labelName] = currentOffset;
				continue;
			}

			// Remove comments
			var commentIndex = workLine.IndexOf(';');
			if (commentIndex >= 0)
				workLine = workLine[..commentIndex].Trim();

			if (string.IsNullOrWhiteSpace(workLine))
				continue;

			// Parse instruction
			var parts = workLine.Split([' ', '\t', ','], StringSplitOptions.RemoveEmptyEntries);
			if (parts.Length == 0)
				continue;

			var mnemonic = parts[0].ToUpperInvariant();

			// Handle .byte directive
			if (mnemonic == ".BYTE")
			{
				foreach (var valuePart in parts.Skip(1))
				{
					var byteValue = ParseNumericValue(valuePart);
					var byteInst = new ScriptInstruction
					{
						Offset = currentOffset,
						Opcode = (byte)byteValue,
						Mnemonic = ".byte",
						Length = 1,
						RawBytes = [(byte)byteValue]
					};
					byteInst.Parameters.Add(new ScriptParameterValue
					{
						Name = "value",
						Type = ParameterType.Byte,
						Value = byteValue,
						RawBytes = [(byte)byteValue]
					});
					script.Instructions.Add(byteInst);
					currentOffset++;
				}
				continue;
			}

			if (!opcodeMap.TryGetValue(mnemonic, out var opcodeDef))
				throw new InvalidOperationException($"Unknown mnemonic: {mnemonic}");

			var instruction = new ScriptInstruction
			{
				Offset = currentOffset,
				Opcode = opcodeDef.Code,
				Mnemonic = opcodeDef.Mnemonic
			};

			// Parse parameters
			var paramIndex = 0;
			foreach (var paramDef in opcodeDef.Parameters)
			{
				if (paramIndex + 1 >= parts.Length)
				{
					if (!paramDef.IsOptional)
						throw new InvalidOperationException($"Missing parameter {paramDef.Name} for {mnemonic}");
					break;
				}

				var paramStr = parts[paramIndex + 1];
				var paramValue = new ScriptParameterValue
				{
					Name = paramDef.Name,
					Type = paramDef.Type
				};

				// Check if it's a label reference
				if (!paramStr.StartsWith('$') && !paramStr.StartsWith("0x", StringComparison.OrdinalIgnoreCase) &&
					!char.IsDigit(paramStr[0]) && !paramStr.StartsWith('-'))
				{
					// It's a label reference
					labelReferences.Add((script.Instructions.Count, paramIndex, paramStr));
					paramValue.Value = 0; // Will be resolved later
				}
				else
				{
					paramValue.Value = ParseNumericValue(paramStr);
				}

				// Check enum values (reverse lookup)
				if (paramDef.EnumValues != null)
				{
					var enumEntry = paramDef.EnumValues.FirstOrDefault(e =>
						string.Equals(e.Value, paramStr, StringComparison.OrdinalIgnoreCase));
					if (enumEntry.Value != null)
					{
						paramValue.Value = enumEntry.Key;
						paramValue.EnumName = enumEntry.Value;
					}
				}

				instruction.Parameters.Add(paramValue);
				paramIndex++;
			}

			// Calculate instruction length
			instruction.Length = 1; // opcode byte
			foreach (var param in instruction.Parameters)
			{
				var paramDef = opcodeDef.Parameters[instruction.Parameters.IndexOf(param)];
				instruction.Length += GetParameterSize(paramDef);
			}

			script.Instructions.Add(instruction);
			currentOffset += instruction.Length;
		}

		// Second pass: resolve label references
		foreach (var (instIdx, paramIdx, label) in labelReferences)
		{
			if (!labels.TryGetValue(label, out var targetOffset))
				throw new InvalidOperationException($"Undefined label: {label}");

			script.Instructions[instIdx].Parameters[paramIdx].Value = targetOffset;
		}

		// Generate raw bytes
		foreach (var instruction in script.Instructions)
		{
			var bytes = new List<byte> { instruction.Opcode };
			var paramIndex = 0;

			foreach (var param in instruction.Parameters)
			{
				var opcodeDef = opcodeMap.Values.FirstOrDefault(o => o.Code == instruction.Opcode);
				var paramDef = opcodeDef?.Parameters.ElementAtOrDefault(paramIndex);
				var size = paramDef != null ? GetParameterSize(paramDef) : 1;
				var paramBytes = WriteValue(param.Value, size, definition.Endianness);
				bytes.AddRange(paramBytes);
				param.RawBytes = paramBytes;
				paramIndex++;
			}

			instruction.RawBytes = [.. bytes];
		}

		script.Length = currentOffset;
		// Convert labels from string->int to int->string
		script.Labels = labels.ToDictionary(kvp => kvp.Value, kvp => kvp.Key);

		return script;
	}

	private static long ParseNumericValue(string value)
	{
		value = value.Trim();

		if (value.StartsWith("$"))
			return Convert.ToInt64(value[1..], 16);
		if (value.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
			return Convert.ToInt64(value[2..], 16);
		if (value.StartsWith("%"))
			return Convert.ToInt64(value[1..], 2);

		return long.Parse(value);
	}

	#endregion

	#region Export

	public byte[] ExportScript(GameScript GameScript)
	{
		ArgumentNullException.ThrowIfNull(GameScript);

		var bytes = new List<byte>();

		foreach (var instruction in GameScript.Instructions)
		{
			bytes.AddRange(instruction.RawBytes);
		}

		return [.. bytes];
	}

	#endregion

	#region Validation

	public ScriptValidationResult ValidateScript(GameScript GameScript, ScriptDefinition definition)
	{
		ArgumentNullException.ThrowIfNull(GameScript);
		ArgumentNullException.ThrowIfNull(definition);

		var result = new ScriptValidationResult();
		var opcodeMap = definition.Opcodes.ToDictionary(o => o.Code);
		var validOffsets = new HashSet<int>(GameScript.Instructions.Select(i => i.Offset));

		for (int i = 0; i < GameScript.Instructions.Count; i++)
		{
			var instruction = GameScript.Instructions[i];

			// Check for unknown opcodes
			if (!opcodeMap.TryGetValue(instruction.Opcode, out var opcodeDef))
			{
				if (instruction.Mnemonic != ".byte")
				{
					result.Warnings.Add(new ScriptValidationError
					{
						InstructionIndex = i,
						Offset = instruction.Offset,
						Message = $"Unknown opcode 0x{instruction.Opcode:x2}",
						Severity = ScriptValidationSeverity.Warning
					});
				}
				continue;
			}

			// Check parameter count
			var requiredParams = opcodeDef.Parameters.Count(p => !p.IsOptional);
			if (instruction.Parameters.Count < requiredParams)
			{
				result.Errors.Add(new ScriptValidationError
				{
					InstructionIndex = i,
					Offset = instruction.Offset,
					Message = $"{instruction.Mnemonic} requires {requiredParams} parameters, got {instruction.Parameters.Count}",
					Severity = ScriptValidationSeverity.Error
				});
			}

			// Check parameter values
			for (int p = 0; p < instruction.Parameters.Count && p < opcodeDef.Parameters.Count; p++)
			{
				var paramDef = opcodeDef.Parameters[p];
				var paramValue = instruction.Parameters[p];

				// Check min/max
				if (paramDef.MinValue.HasValue && paramValue.Value < paramDef.MinValue.Value)
				{
					result.Errors.Add(new ScriptValidationError
					{
						InstructionIndex = i,
						Offset = instruction.Offset,
						Message = $"Parameter {paramDef.Name} value {paramValue.Value} is below minimum {paramDef.MinValue}",
						Severity = ScriptValidationSeverity.Error
					});
				}

				if (paramDef.MaxValue.HasValue && paramValue.Value > paramDef.MaxValue.Value)
				{
					result.Errors.Add(new ScriptValidationError
					{
						InstructionIndex = i,
						Offset = instruction.Offset,
						Message = $"Parameter {paramDef.Name} value {paramValue.Value} is above maximum {paramDef.MaxValue}",
						Severity = ScriptValidationSeverity.Error
					});
				}

				// Check enum values
				if (paramDef.EnumValues != null && !paramDef.EnumValues.ContainsKey((int)paramValue.Value))
				{
					result.Warnings.Add(new ScriptValidationError
					{
						InstructionIndex = i,
						Offset = instruction.Offset,
						Message = $"Parameter {paramDef.Name} value 0x{paramValue.Value:x} is not a known enum value",
						Severity = ScriptValidationSeverity.Warning
					});
				}

				// Check jump targets
				if ((paramDef.Type == ParameterType.Pointer || paramDef.Type == ParameterType.Offset) &&
					opcodeDef.IsJump)
				{
					var targetOffset = (int)paramValue.Value;
					if (!validOffsets.Contains(targetOffset))
					{
						result.Warnings.Add(new ScriptValidationError
						{
							InstructionIndex = i,
							Offset = instruction.Offset,
							Message = $"Jump target 0x{targetOffset:x} is not a valid instruction offset",
							Severity = ScriptValidationSeverity.Warning
						});
					}
				}
			}
		}

		// Check for missing terminator
		if (definition.TerminatorByte.HasValue && GameScript.Instructions.Count > 0)
		{
			var lastInstruction = GameScript.Instructions[^1];
			if (lastInstruction.Opcode != definition.TerminatorByte.Value)
			{
				var terminatingOpcode = opcodeMap.Values.FirstOrDefault(o => o.IsTerminator && !o.IsConditional);
				if (terminatingOpcode == null || lastInstruction.Opcode != terminatingOpcode.Code)
				{
					result.Warnings.Add(new ScriptValidationError
					{
						InstructionIndex = GameScript.Instructions.Count - 1,
						Offset = lastInstruction.Offset,
						Message = "GameScript does not end with a terminator instruction",
						Severity = ScriptValidationSeverity.Warning
					});
				}
			}
		}

		return result;
	}

	#endregion

	#region Cross-References

	public List<ScriptCrossReference> GetCrossReferences(GameScript GameScript)
	{
		ArgumentNullException.ThrowIfNull(GameScript);

		var refs = new List<ScriptCrossReference>();

		foreach (var instruction in GameScript.Instructions)
		{
			// Check if this instruction has jump/call parameters
			foreach (var param in instruction.Parameters)
			{
				if (param.Type == ParameterType.Pointer || param.Type == ParameterType.Offset)
				{
					var targetOffset = (int)param.Value;
					var targetInst = GameScript.Instructions.FirstOrDefault(i => i.Offset == targetOffset);

					refs.Add(new ScriptCrossReference
					{
						SourceOffset = instruction.Offset,
						TargetOffset = targetOffset,
						Type = GetCrossRefType(instruction),
						SourceLabel = instruction.Label ?? $"loc_{instruction.Offset:x4}",
						TargetLabel = targetInst?.Label ?? $"loc_{targetOffset:x4}"
					});
				}
			}
		}

		return refs;
	}

	private static CrossReferenceType GetCrossRefType(ScriptInstruction instruction)
	{
		var mnemonic = instruction.Mnemonic.ToUpperInvariant();

		if (mnemonic.Contains("CALL") || mnemonic == "JSR" || mnemonic == "JSL")
			return CrossReferenceType.Call;

		if (mnemonic.StartsWith('B') || mnemonic.Contains("IF") || mnemonic.Contains("CMP"))
			return CrossReferenceType.ConditionalJump;

		return CrossReferenceType.Jump;
	}

	public List<ScriptTextReference> GetTextReferences(GameScript GameScript, ScriptDefinition definition)
	{
		ArgumentNullException.ThrowIfNull(GameScript);
		ArgumentNullException.ThrowIfNull(definition);

		var refs = new List<ScriptTextReference>();
		var opcodeMap = definition.Opcodes.ToDictionary(o => o.Code);

		foreach (var instruction in GameScript.Instructions)
		{
			if (!opcodeMap.TryGetValue(instruction.Opcode, out var opcodeDef))
				continue;

			if (!opcodeDef.HasTextReference)
				continue;

			// Find the text parameter
			for (int i = 0; i < instruction.Parameters.Count && i < opcodeDef.Parameters.Count; i++)
			{
				var paramDef = opcodeDef.Parameters[i];
				if (paramDef.Type == ParameterType.TextId ||
					paramDef.Name.Equals(opcodeDef.TextParameterName, StringComparison.OrdinalIgnoreCase))
				{
					var param = instruction.Parameters[i];
					refs.Add(new ScriptTextReference
					{
						InstructionOffset = instruction.Offset,
						TextId = (int)param.Value,
						InstructionMnemonic = instruction.Mnemonic
					});
				}
			}
		}

		return refs;
	}

	#endregion

	#region Detection

	public List<DetectedScript> DetectScripts(byte[] data, ScriptDefinition definition, ScriptDetectionOptions options)
	{
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(definition);
		ArgumentNullException.ThrowIfNull(options);

		var detected = new List<DetectedScript>();
		var opcodeSet = new HashSet<byte>(definition.Opcodes.Select(o => o.Code));
		var processedRanges = new List<(int start, int end)>();

		var endOffset = Math.Min(options.EndOffset > 0 ? options.EndOffset : data.Length, data.Length);

		for (int offset = options.StartOffset; offset < endOffset; offset++)
		{
			// Skip if already processed
			if (!options.AllowOverlap && processedRanges.Any(r => offset >= r.start && offset < r.end))
				continue;

			var opcode = data[offset];
			if (!opcodeSet.Contains(opcode) && opcode != definition.TerminatorByte)
				continue;

			// Try to parse as GameScript
			try
			{
				var GameScript = ParseScript(data, offset, definition, 4096); // Max 4KB per GameScript

				if (GameScript.Instructions.Count < options.MinInstructions ||
					GameScript.Instructions.Count > options.MaxInstructions)
					continue;

				// Check for terminator if required
				var hasTerminator = definition.TerminatorByte.HasValue &&
					GameScript.Instructions.Any(i => i.Opcode == definition.TerminatorByte.Value);

				if (options.RequireTerminator && !hasTerminator)
					continue;

				// Calculate confidence
				var confidence = CalculateConfidence(GameScript, definition);

				if (confidence < options.MinConfidence)
					continue;

				var uniqueMnemonics = GameScript.Instructions
					.Where(i => i.Mnemonic != ".byte")
					.Select(i => i.Mnemonic)
					.Distinct()
					.ToList();

				detected.Add(new DetectedScript
				{
					Offset = offset,
					Length = GameScript.Length,
					InstructionCount = GameScript.Instructions.Count,
					Confidence = confidence,
					HasTerminator = hasTerminator,
					UniqueMnemonics = uniqueMnemonics
				});

				// Mark range as processed
				processedRanges.Add((offset, offset + GameScript.Length));
			}
			catch
			{
				// Not a valid GameScript at this offset
			}
		}

		return detected.OrderByDescending(d => d.Confidence).ThenBy(d => d.Offset).ToList();
	}

	private static int CalculateConfidence(GameScript GameScript, ScriptDefinition definition)
	{
		if (GameScript.Instructions.Count == 0)
			return 0;

		var score = 50; // Base score

		// Known opcodes vs unknown
		var knownCount = GameScript.Instructions.Count(i => i.Mnemonic != ".byte");
		var unknownCount = GameScript.Instructions.Count - knownCount;
		var knownRatio = (double)knownCount / GameScript.Instructions.Count;
		score += (int)(knownRatio * 30);

		// Penalty for too many unknown opcodes
		if (unknownCount > knownCount)
			score -= 20;

		// Bonus for having terminator
		if (definition.TerminatorByte.HasValue &&
			GameScript.Instructions.Any(i => i.Opcode == definition.TerminatorByte.Value))
			score += 10;

		// Bonus for variety of opcodes
		var uniqueOpcodes = GameScript.Instructions.Select(i => i.Opcode).Distinct().Count();
		if (uniqueOpcodes >= 3)
			score += 5;
		if (uniqueOpcodes >= 5)
			score += 5;

		// Bonus for having flow control
		var hasFlowControl = GameScript.Instructions.Any(i =>
		{
			var upper = i.Mnemonic.ToUpperInvariant();
			return upper.Contains("JUMP") || upper.Contains("GOTO") ||
				   upper.Contains("CALL") || upper.Contains("RET") ||
				   upper.StartsWith('B') || upper.StartsWith('J');
		});
		if (hasFlowControl)
			score += 10;

		return Math.Clamp(score, 0, 100);
	}

	#endregion

	#region Templates

	public List<ScriptDefinitionTemplate> GetTemplates()
	{
		return
		[
			CreateDragonQuestTemplate(),
			CreateFinalFantasyTemplate(),
			CreateGenericNESTemplate(),
			CreateGenericSNESTemplate()
		];
	}

	private static ScriptDefinitionTemplate CreateDragonQuestTemplate()
	{
		return new ScriptDefinitionTemplate
		{
			Name = "Dragon Quest (NES)",
			Description = "GameScript format for Dragon Quest/Dragon Warrior NES games",
			Category = "RPG",
			Definition = new ScriptDefinition
			{
				Name = "Dragon Quest GameScript",
				Platform = ScriptPlatform.NES,
				Endianness = Endianness.Little,
				TerminatorByte = 0xff,
				Opcodes =
				[
					new ScriptOpcode { Code = 0x00, Mnemonic = "END", Description = "End GameScript", IsTerminator = true },
					new ScriptOpcode { Code = 0x01, Mnemonic = "TEXT", Description = "Display text", HasTextReference = true, TextParameterName = "textId",
						Parameters = [new OpcodeParameter { Name = "textId", Type = ParameterType.TextId, Size = 1 }] },
					new ScriptOpcode { Code = 0x02, Mnemonic = "CHOICE", Description = "Yes/No choice", Category = OpcodeCategory.Dialog },
					new ScriptOpcode { Code = 0x03, Mnemonic = "JUMP", Description = "Jump to address", IsJump = true,
						Parameters = [new OpcodeParameter { Name = "target", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x04, Mnemonic = "JUMP_IF", Description = "Conditional jump", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 1 }, new OpcodeParameter { Name = "target", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x05, Mnemonic = "SET_FLAG", Description = "Set event flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 1 }] },
					new ScriptOpcode { Code = 0x06, Mnemonic = "CLEAR_FLAG", Description = "Clear event flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 1 }] },
					new ScriptOpcode { Code = 0x07, Mnemonic = "GIVE_ITEM", Description = "Give item to player", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "item", Type = ParameterType.ItemId, Size = 1 }] },
					new ScriptOpcode { Code = 0x08, Mnemonic = "TAKE_ITEM", Description = "Take item from player", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "item", Type = ParameterType.ItemId, Size = 1 }] },
					new ScriptOpcode { Code = 0x09, Mnemonic = "CHECK_ITEM", Description = "Check if player has item", Category = OpcodeCategory.Event, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "item", Type = ParameterType.ItemId, Size = 1 }, new OpcodeParameter { Name = "target", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x0a, Mnemonic = "HEAL", Description = "Heal party", Category = OpcodeCategory.Event },
					new ScriptOpcode { Code = 0x0b, Mnemonic = "INN", Description = "Inn sequence", Category = OpcodeCategory.Event },
					new ScriptOpcode { Code = 0x0c, Mnemonic = "SHOP", Description = "Open shop", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "shopId", Type = ParameterType.Byte, Size = 1 }] },
					new ScriptOpcode { Code = 0x0d, Mnemonic = "BATTLE", Description = "Start battle", Category = OpcodeCategory.Battle,
						Parameters = [new OpcodeParameter { Name = "encounterId", Type = ParameterType.Byte, Size = 1 }] },
					new ScriptOpcode { Code = 0x0e, Mnemonic = "WARP", Description = "Warp to location", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "map", Type = ParameterType.MapId, Size = 1 }, new OpcodeParameter { Name = "x", Type = ParameterType.Byte, Size = 1 }, new OpcodeParameter { Name = "y", Type = ParameterType.Byte, Size = 1 }] },
					new ScriptOpcode { Code = 0x0f, Mnemonic = "SOUND", Description = "Play sound", Category = OpcodeCategory.Sound,
						Parameters = [new OpcodeParameter { Name = "sound", Type = ParameterType.SoundId, Size = 1 }] },
					new ScriptOpcode { Code = 0xff, Mnemonic = "END", Description = "End GameScript (terminator)", IsTerminator = true }
				]
			}
		};
	}

	private static ScriptDefinitionTemplate CreateFinalFantasyTemplate()
	{
		return new ScriptDefinitionTemplate
		{
			Name = "Final Fantasy (NES)",
			Description = "GameScript format for Final Fantasy NES",
			Category = "RPG",
			Definition = new ScriptDefinition
			{
				Name = "Final Fantasy GameScript",
				Platform = ScriptPlatform.NES,
				Endianness = Endianness.Little,
				TerminatorByte = 0x00,
				Opcodes =
				[
					new ScriptOpcode { Code = 0x00, Mnemonic = "END", Description = "End GameScript", IsTerminator = true },
					new ScriptOpcode { Code = 0x01, Mnemonic = "MSG", Description = "Display message", HasTextReference = true,
						Parameters = [new OpcodeParameter { Name = "msgId", Type = ParameterType.TextId, Size = 1 }] },
					new ScriptOpcode { Code = 0x02, Mnemonic = "PROMPT", Description = "Yes/No prompt", Category = OpcodeCategory.Dialog },
					new ScriptOpcode { Code = 0x03, Mnemonic = "GOTO", Description = "Unconditional jump", IsJump = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x04, Mnemonic = "BNE", Description = "Branch if not equal", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x05, Mnemonic = "BEQ", Description = "Branch if equal", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x06, Mnemonic = "ADD_GOLD", Description = "Add gold", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "amount", Type = ParameterType.Word, Size = 2 }] },
					new ScriptOpcode { Code = 0x07, Mnemonic = "SUB_GOLD", Description = "Subtract gold", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "amount", Type = ParameterType.Word, Size = 2 }] },
					new ScriptOpcode { Code = 0x08, Mnemonic = "GIVE", Description = "Give item", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "itemId", Type = ParameterType.ItemId, Size = 1 }] },
					new ScriptOpcode { Code = 0x09, Mnemonic = "TAKE", Description = "Take item", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "itemId", Type = ParameterType.ItemId, Size = 1 }] },
					new ScriptOpcode { Code = 0x0a, Mnemonic = "FLAG_SET", Description = "Set flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 1 }] },
					new ScriptOpcode { Code = 0x0b, Mnemonic = "FLAG_CLR", Description = "Clear flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 1 }] }
				]
			}
		};
	}

	private static ScriptDefinitionTemplate CreateGenericNESTemplate()
	{
		return new ScriptDefinitionTemplate
		{
			Name = "Generic NES GameScript",
			Description = "Basic GameScript format template for NES games",
			Category = "Generic",
			Definition = new ScriptDefinition
			{
				Name = "Generic NES GameScript",
				Platform = ScriptPlatform.NES,
				Endianness = Endianness.Little,
				TerminatorByte = 0xff,
				Opcodes =
				[
					new ScriptOpcode { Code = 0x00, Mnemonic = "NOP", Description = "No operation" },
					new ScriptOpcode { Code = 0x01, Mnemonic = "RTS", Description = "Return", IsTerminator = true, IsReturn = true },
					new ScriptOpcode { Code = 0x02, Mnemonic = "JSR", Description = "Jump to subroutine", IsCall = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x03, Mnemonic = "JMP", Description = "Jump", IsJump = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 2 }] },
					new ScriptOpcode { Code = 0x04, Mnemonic = "BCC", Description = "Branch if carry clear", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "offset", Type = ParameterType.SByte, Size = 1 }] },
					new ScriptOpcode { Code = 0x05, Mnemonic = "BCS", Description = "Branch if carry set", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "offset", Type = ParameterType.SByte, Size = 1 }] },
					new ScriptOpcode { Code = 0x06, Mnemonic = "BEQ", Description = "Branch if equal", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "offset", Type = ParameterType.SByte, Size = 1 }] },
					new ScriptOpcode { Code = 0x07, Mnemonic = "BNE", Description = "Branch if not equal", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "offset", Type = ParameterType.SByte, Size = 1 }] },
					new ScriptOpcode { Code = 0x08, Mnemonic = "LDA", Description = "Load accumulator",
						Parameters = [new OpcodeParameter { Name = "value", Type = ParameterType.Byte, Size = 1 }] },
					new ScriptOpcode { Code = 0x09, Mnemonic = "STA", Description = "Store accumulator",
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Word, Size = 2 }] },
					new ScriptOpcode { Code = 0xff, Mnemonic = "END", Description = "End of GameScript", IsTerminator = true }
				]
			}
		};
	}

	private static ScriptDefinitionTemplate CreateGenericSNESTemplate()
	{
		return new ScriptDefinitionTemplate
		{
			Name = "Generic SNES GameScript",
			Description = "Basic GameScript format template for SNES games",
			Category = "Generic",
			Definition = new ScriptDefinition
			{
				Name = "Generic SNES GameScript",
				Platform = ScriptPlatform.SNES,
				Endianness = Endianness.Little,
				TerminatorByte = 0x00,
				DefaultPointerSize = 3,
				Opcodes =
				[
					new ScriptOpcode { Code = 0x00, Mnemonic = "END", Description = "End GameScript", IsTerminator = true },
					new ScriptOpcode { Code = 0x01, Mnemonic = "TEXT", Description = "Display text", HasTextReference = true,
						Parameters = [new OpcodeParameter { Name = "textId", Type = ParameterType.TextId, Size = 2 }] },
					new ScriptOpcode { Code = 0x02, Mnemonic = "WAIT", Description = "Wait for input", Category = OpcodeCategory.Dialog },
					new ScriptOpcode { Code = 0x03, Mnemonic = "JUMP", Description = "Jump", IsJump = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 3 }] },
					new ScriptOpcode { Code = 0x04, Mnemonic = "CALL", Description = "Call subroutine", IsCall = true,
						Parameters = [new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 3 }] },
					new ScriptOpcode { Code = 0x05, Mnemonic = "RET", Description = "Return", IsReturn = true },
					new ScriptOpcode { Code = 0x06, Mnemonic = "IF_FLAG", Description = "Branch if flag set", IsJump = true, IsConditional = true,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 2 }, new OpcodeParameter { Name = "addr", Type = ParameterType.Pointer, Size = 3 }] },
					new ScriptOpcode { Code = 0x07, Mnemonic = "SET_FLAG", Description = "Set flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 2 }] },
					new ScriptOpcode { Code = 0x08, Mnemonic = "CLR_FLAG", Description = "Clear flag", Category = OpcodeCategory.Event,
						Parameters = [new OpcodeParameter { Name = "flag", Type = ParameterType.FlagId, Size = 2 }] },
					new ScriptOpcode { Code = 0x09, Mnemonic = "FADE_OUT", Description = "Fade screen out", Category = OpcodeCategory.Graphics },
					new ScriptOpcode { Code = 0x0a, Mnemonic = "FADE_IN", Description = "Fade screen in", Category = OpcodeCategory.Graphics },
					new ScriptOpcode { Code = 0x0b, Mnemonic = "MUSIC", Description = "Play music", Category = OpcodeCategory.Sound,
						Parameters = [new OpcodeParameter { Name = "trackId", Type = ParameterType.SoundId, Size = 1 }] },
					new ScriptOpcode { Code = 0x0c, Mnemonic = "SFX", Description = "Play sound effect", Category = OpcodeCategory.Sound,
						Parameters = [new OpcodeParameter { Name = "sfxId", Type = ParameterType.SoundId, Size = 1 }] }
				]
			}
		};
	}

	#endregion

	#region Labels

	public int? ResolveLabel(GameScript script, string label)
	{
		ArgumentNullException.ThrowIfNull(script);
		ArgumentNullException.ThrowIfNull(label);

		// Labels are stored as offset -> label name, so we need to search by value
		var match = script.Labels.FirstOrDefault(l => l.Value.Equals(label, StringComparison.Ordinal));
		if (match.Value != null)
			return match.Key;

		// Try case-insensitive
		match = script.Labels.FirstOrDefault(l => l.Value.Equals(label, StringComparison.OrdinalIgnoreCase));
		return match.Value != null ? match.Key : null;
	}

	public Dictionary<int, string> GenerateLabels(GameScript script, string prefix = "loc_")
	{
		ArgumentNullException.ThrowIfNull(script);

		var labels = new Dictionary<int, string>();
		var targetOffsets = new HashSet<int>();

		// Find all jump targets
		foreach (var instruction in script.Instructions)
		{
			foreach (var param in instruction.Parameters)
			{
				if (param.Type == ParameterType.Pointer || param.Type == ParameterType.Offset)
				{
					targetOffsets.Add((int)param.Value);
				}
			}
		}

		// Create labels for valid targets
		var labelIndex = 0;
		foreach (var offset in targetOffsets.OrderBy(o => o))
		{
			// Only create label if it points to an actual instruction
			if (script.Instructions.Any(i => i.Offset == offset))
			{
				labels[offset] = $"{prefix}{offset:x4}";
				labelIndex++;
			}
		}

		return labels;
	}

	#endregion

	#region Helper Methods

	private static int GetParameterSize(OpcodeParameter param)
	{
		if (param.Size > 0)
			return param.Size;

		return param.Type switch
		{
			ParameterType.Byte or ParameterType.SByte => 1,
			ParameterType.Word or ParameterType.SWord => 2,
			ParameterType.DWord => 4,
			ParameterType.Pointer => 2,
			ParameterType.Offset => 2,
			_ => 1
		};
	}

	private static bool IsSignedType(ParameterType type)
	{
		return type is ParameterType.SByte or ParameterType.SWord;
	}

	private static long ReadValue(byte[] data, int offset, int size, Endianness endianness, bool signed)
	{
		if (offset + size > data.Length)
			return 0;

		long value = 0;

		if (endianness == Endianness.Little)
		{
			for (int i = 0; i < size; i++)
				value |= (long)data[offset + i] << (i * 8);
		}
		else
		{
			for (int i = 0; i < size; i++)
				value |= (long)data[offset + i] << ((size - 1 - i) * 8);
		}

		// Sign extend if needed
		if (signed)
		{
			var signBit = 1L << (size * 8 - 1);
			if ((value & signBit) != 0)
			{
				// Extend sign bits
				for (int i = size * 8; i < 64; i++)
					value |= 1L << i;
			}
		}

		return value;
	}

	private static byte[] WriteValue(long value, int size, Endianness endianness)
	{
		var bytes = new byte[size];

		if (endianness == Endianness.Little)
		{
			for (int i = 0; i < size; i++)
				bytes[i] = (byte)(value >> (i * 8));
		}
		else
		{
			for (int i = 0; i < size; i++)
				bytes[i] = (byte)(value >> ((size - 1 - i) * 8));
		}

		return bytes;
	}

	#endregion
}
