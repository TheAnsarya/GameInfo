using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;

namespace GameInfoTools.Text;

/// <summary>
/// Dialogue editor for game text with control codes, formatting, and preview.
/// </summary>
/// <remarks>
/// C# equivalent of: tools/text/dialogue_editor.py
/// </remarks>
public partial class DialogueEditor {
	/// <summary>
	/// Type of dialogue entry.
	/// </summary>
	public enum DialogueType {
		Normal,
		NpcSpeech,
		SystemMessage,
		MenuOption,
		ItemDescription,
		BattleMessage,
		Title,
		Cutscene
	}

	/// <summary>
	/// A single dialogue entry.
	/// </summary>
	public class DialogueEntry {
		public int Id { get; set; }
		public string Key { get; set; } = "";
		public string RawText { get; set; } = "";
		public string DisplayText { get; set; } = "";
		public DialogueType Type { get; set; }
		public string Speaker { get; set; } = "";
		public string Notes { get; set; } = "";
		public int RomOffset { get; set; }
		public int Length { get; set; }
		public int MaxLength { get; set; }
		public bool IsModified { get; set; }
		public byte[] RawBytes { get; set; } = [];
	}

	/// <summary>
	/// Control code definition.
	/// </summary>
	public class ControlCode {
		public byte Code { get; set; }
		public string Name { get; set; } = "";
		public string DisplayAs { get; set; } = "";
		public int ParamBytes { get; set; }
		public string? Description { get; set; }
	}

	/// <summary>
	/// Text table entry (character code to character mapping).
	/// </summary>
	public class TextTableEntry {
		public byte Code { get; set; }
		public string Character { get; set; } = "";
	}

	/// <summary>
	/// Dialogue table schema.
	/// </summary>
	public class DialogueSchema {
		public string Name { get; set; } = "";
		public int PointerTableOffset { get; set; }
		public int PointerSize { get; set; } = 2;
		public int EntryCount { get; set; }
		public int TextBaseOffset { get; set; }
		public int BankOffset { get; set; }
		public byte EndMarker { get; set; } = 0x00;
		public bool IsPointerRelative { get; set; }
		public List<ControlCode> ControlCodes { get; } = [];
		public List<TextTableEntry> TextTable { get; } = [];
	}

	private readonly byte[] _data;
	private readonly List<DialogueEntry> _entries = [];
	private DialogueSchema? _schema;
	private readonly Dictionary<byte, ControlCode> _controlCodes = [];
	private readonly Dictionary<byte, string> _textTable = [];
	private readonly Dictionary<string, byte> _reverseTextTable = [];

	public DialogueEditor(byte[] romData) {
		_data = romData;
	}

	/// <summary>
	/// Gets all loaded dialogue entries.
	/// </summary>
	public IReadOnlyList<DialogueEntry> Entries => _entries;

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public DialogueSchema? Schema => _schema;

	/// <summary>
	/// Sets the dialogue schema.
	/// </summary>
	public void SetSchema(DialogueSchema schema) {
		_schema = schema;

		// Build lookup tables
		_controlCodes.Clear();
		foreach (var code in schema.ControlCodes) {
			_controlCodes[code.Code] = code;
		}

		_textTable.Clear();
		_reverseTextTable.Clear();
		foreach (var entry in schema.TextTable) {
			_textTable[entry.Code] = entry.Character;
			if (!_reverseTextTable.ContainsKey(entry.Character)) {
				_reverseTextTable[entry.Character] = entry.Code;
			}
		}
	}

	/// <summary>
	/// Loads a standard ASCII text table.
	/// </summary>
	public void LoadAsciiTable() {
		_textTable.Clear();
		_reverseTextTable.Clear();

		for (int i = 0x20; i < 0x7f; i++) {
			string ch = ((char)i).ToString();
			_textTable[(byte)i] = ch;
			_reverseTextTable[ch] = (byte)i;
		}
	}

	/// <summary>
	/// Loads a text table from .tbl file format.
	/// </summary>
	public void LoadTextTable(string tblContent) {
		_textTable.Clear();
		_reverseTextTable.Clear();

		var lines = tblContent.Split(['\r', '\n'], StringSplitOptions.RemoveEmptyEntries);
		foreach (var line in lines) {
			if (line.StartsWith(';') || line.StartsWith('#')) continue;

			var match = TblLineRegex().Match(line);
			if (match.Success) {
				byte code = Convert.ToByte(match.Groups[1].Value, 16);
				string character = match.Groups[2].Value;

				_textTable[code] = character;
				if (!_reverseTextTable.ContainsKey(character)) {
					_reverseTextTable[character] = code;
				}
			}
		}
	}

	/// <summary>
	/// Loads dialogue entries from ROM using the configured schema.
	/// </summary>
	public void LoadDialogue() {
		if (_schema == null) {
			throw new InvalidOperationException("Schema must be set before loading dialogue");
		}

		_entries.Clear();

		for (int i = 0; i < _schema.EntryCount; i++) {
			// Read pointer
			int pointerOffset = _schema.PointerTableOffset + (i * _schema.PointerSize);
			int textPointer = ReadPointer(pointerOffset, _schema.PointerSize);

			// Calculate actual text offset
			int textOffset;
			if (_schema.IsPointerRelative) {
				textOffset = _schema.TextBaseOffset + textPointer;
			} else {
				textOffset = textPointer - _schema.BankOffset;
			}

			if (textOffset < 0 || textOffset >= _data.Length) continue;

			// Read text
			var entry = ReadDialogueEntry(textOffset, i);
			_entries.Add(entry);
		}
	}

	/// <summary>
	/// Loads dialogue from a raw text block (no pointer table).
	/// </summary>
	public void LoadFromBlock(int startOffset, int maxLength) {
		if (_schema == null) {
			throw new InvalidOperationException("Schema must be set before loading dialogue");
		}

		_entries.Clear();

		int offset = startOffset;
		int id = 0;

		while (offset < startOffset + maxLength && offset < _data.Length) {
			var entry = ReadDialogueEntry(offset, id);
			if (entry.Length == 0) break;

			_entries.Add(entry);
			offset += entry.Length;
			id++;
		}
	}

	private int ReadPointer(int offset, int size) {
		if (offset + size > _data.Length) return 0;

		return size switch {
			1 => _data[offset],
			2 => _data[offset] | (_data[offset + 1] << 8),
			3 => _data[offset] | (_data[offset + 1] << 8) | (_data[offset + 2] << 16),
			_ => _data[offset] | (_data[offset + 1] << 8)
		};
	}

	private DialogueEntry ReadDialogueEntry(int offset, int id) {
		var entry = new DialogueEntry {
			Id = id,
			Key = $"MSG_{id:D4}",
			RomOffset = offset
		};

		var rawBytes = new List<byte>();
		var rawText = new StringBuilder();
		var displayText = new StringBuilder();

		int pos = offset;
		byte endMarker = _schema?.EndMarker ?? 0x00;

		while (pos < _data.Length) {
			byte b = _data[pos];
			rawBytes.Add(b);

			if (b == endMarker) {
				pos++;
				break;
			}

			// Check for control code
			if (_controlCodes.TryGetValue(b, out var controlCode)) {
				rawText.Append($"[{controlCode.Name}");

				// Read parameters
				for (int p = 0; p < controlCode.ParamBytes && pos + 1 < _data.Length; p++) {
					pos++;
					rawBytes.Add(_data[pos]);
					rawText.Append($":{_data[pos]:X2}");
				}

				rawText.Append(']');
				displayText.Append(controlCode.DisplayAs);
			}
			// Regular text character
			else if (_textTable.TryGetValue(b, out var character)) {
				rawText.Append(character);
				displayText.Append(character);
			}
			// Unknown byte
			else {
				rawText.Append($"[{b:X2}]");
				displayText.Append('?');
			}

			pos++;
		}

		entry.RawText = rawText.ToString();
		entry.DisplayText = displayText.ToString();
		entry.RawBytes = rawBytes.ToArray();
		entry.Length = pos - offset;
		entry.MaxLength = entry.Length; // Default to current length

		return entry;
	}

	/// <summary>
	/// Gets a dialogue entry by ID.
	/// </summary>
	public DialogueEntry? GetEntry(int id) {
		return _entries.FirstOrDefault(e => e.Id == id);
	}

	/// <summary>
	/// Gets entries by type.
	/// </summary>
	public List<DialogueEntry> GetEntriesByType(DialogueType type) {
		return _entries.Where(e => e.Type == type).ToList();
	}

	/// <summary>
	/// Searches entries containing text.
	/// </summary>
	public List<DialogueEntry> Search(string query, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _entries.Where(e =>
			e.RawText.Contains(query, comparison) ||
			e.DisplayText.Contains(query, comparison)
		).ToList();
	}

	/// <summary>
	/// Updates a dialogue entry's text.
	/// </summary>
	public bool UpdateEntry(int id, string newText) {
		var entry = GetEntry(id);
		if (entry == null) return false;

		// Encode the new text
		var encoded = EncodeText(newText);
		if (encoded == null) return false;

		// Check length constraints
		if (encoded.Length > entry.MaxLength) {
			return false; // Would overflow
		}

		// Pad to original length if needed
		var padded = new byte[entry.MaxLength];
		Array.Copy(encoded, padded, encoded.Length);
		// Fill remainder with end marker or space
		byte fillByte = _schema?.EndMarker ?? 0x00;
		for (int i = encoded.Length; i < padded.Length; i++) {
			padded[i] = fillByte;
		}

		// Write to ROM data
		Array.Copy(padded, 0, _data, entry.RomOffset, padded.Length);

		// Update entry
		entry.RawText = newText;
		entry.RawBytes = encoded;
		entry.IsModified = true;

		// Re-decode for display
		var reDecoded = ReadDialogueEntry(entry.RomOffset, entry.Id);
		entry.DisplayText = reDecoded.DisplayText;

		return true;
	}

	/// <summary>
	/// Encodes text string to ROM bytes.
	/// </summary>
	public byte[]? EncodeText(string text) {
		var result = new List<byte>();
		int i = 0;

		while (i < text.Length) {
			// Check for control code [NAME] or [NAME:XX]
			if (text[i] == '[') {
				int closePos = text.IndexOf(']', i);
				if (closePos > i) {
					string content = text[(i + 1)..closePos];
					var parts = content.Split(':');
					string codeName = parts[0];

					// Find control code by name
					var controlCode = _controlCodes.Values.FirstOrDefault(c =>
						c.Name.Equals(codeName, StringComparison.OrdinalIgnoreCase));

					if (controlCode != null) {
						result.Add(controlCode.Code);

						// Add parameters
						for (int p = 1; p < parts.Length && p <= controlCode.ParamBytes; p++) {
							if (byte.TryParse(parts[p], System.Globalization.NumberStyles.HexNumber, null, out byte param)) {
								result.Add(param);
							}
						}
					} else if (parts[0].Length == 2 && byte.TryParse(parts[0], System.Globalization.NumberStyles.HexNumber, null, out byte rawByte)) {
						// Raw hex byte [XX]
						result.Add(rawByte);
					}

					i = closePos + 1;
					continue;
				}
			}

			// Regular character - try multi-char matches first (for DTE)
			bool found = false;

			// Try longer matches first (up to 4 characters for DTE/MTE)
			for (int len = Math.Min(4, text.Length - i); len > 0; len--) {
				string substr = text.Substring(i, len);
				if (_reverseTextTable.TryGetValue(substr, out byte code)) {
					result.Add(code);
					i += len;
					found = true;
					break;
				}
			}

			if (!found) {
				// Unknown character - skip or fail
				i++;
			}
		}

		// Add end marker
		result.Add(_schema?.EndMarker ?? 0x00);

		return result.ToArray();
	}

	/// <summary>
	/// Validates text can be encoded and fits in space.
	/// </summary>
	public (bool IsValid, string? Error) ValidateText(int id, string newText) {
		var entry = GetEntry(id);
		if (entry == null) {
			return (false, "Entry not found");
		}

		var encoded = EncodeText(newText);
		if (encoded == null) {
			return (false, "Text contains characters not in text table");
		}

		if (encoded.Length > entry.MaxLength) {
			return (false, $"Text too long: {encoded.Length} bytes, max {entry.MaxLength}");
		}

		return (true, null);
	}

	/// <summary>
	/// Exports all dialogue to JSON.
	/// </summary>
	public string ExportToJson() {
		return JsonSerializer.Serialize(_entries, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Imports dialogue from JSON.
	/// </summary>
	public (int Updated, int Errors) ImportFromJson(string json) {
		var imported = JsonSerializer.Deserialize<List<DialogueEntry>>(json, new JsonSerializerOptions {
			Converters = { new JsonStringEnumConverter() }
		});

		if (imported == null) return (0, 1);

		int updated = 0;
		int errors = 0;

		foreach (var entry in imported) {
			if (UpdateEntry(entry.Id, entry.RawText)) {
				updated++;
			} else {
				errors++;
			}
		}

		return (updated, errors);
	}

	/// <summary>
	/// Gets statistics about the dialogue database.
	/// </summary>
	public DialogueStatistics GetStatistics() {
		int totalChars = _entries.Sum(e => e.DisplayText.Length);
		int modifiedCount = _entries.Count(e => e.IsModified);
		int usedSpace = _entries.Sum(e => e.Length);
		int maxSpace = _entries.Sum(e => e.MaxLength);

		return new DialogueStatistics(
			EntryCount: _entries.Count,
			TotalCharacters: totalChars,
			ModifiedCount: modifiedCount,
			UsedSpace: usedSpace,
			MaxSpace: maxSpace,
			SpaceRemaining: maxSpace - usedSpace,
			AverageLength: _entries.Count > 0 ? usedSpace / _entries.Count : 0
		);
	}

	/// <summary>
	/// Statistics about the dialogue database.
	/// </summary>
	public record DialogueStatistics(
		int EntryCount,
		int TotalCharacters,
		int ModifiedCount,
		int UsedSpace,
		int MaxSpace,
		int SpaceRemaining,
		int AverageLength
	);

	/// <summary>
	/// Creates a schema with common NES control codes.
	/// </summary>
	public static DialogueSchema CreateNesSchema(int pointerTableOffset, int entryCount, int textBaseOffset, byte endMarker = 0x00) {
		return new DialogueSchema {
			Name = "NES Dialogue",
			PointerTableOffset = pointerTableOffset,
			PointerSize = 2,
			EntryCount = entryCount,
			TextBaseOffset = textBaseOffset,
			BankOffset = 0x8000, // Standard NES CPU mapping
			EndMarker = endMarker,
			IsPointerRelative = false,
			ControlCodes = {
				new ControlCode { Code = 0xfc, Name = "LINE", DisplayAs = "\n", Description = "New line" },
				new ControlCode { Code = 0xfd, Name = "PAGE", DisplayAs = "\n\n", Description = "New page" },
				new ControlCode { Code = 0xfe, Name = "WAIT", DisplayAs = "...", ParamBytes = 1, Description = "Wait frames" },
				new ControlCode { Code = 0xff, Name = "END", DisplayAs = "", Description = "End of text" }
			}
		};
	}

	/// <summary>
	/// Creates a schema with common SNES control codes.
	/// </summary>
	public static DialogueSchema CreateSnesSchema(int pointerTableOffset, int entryCount, int textBaseOffset, byte endMarker = 0x00) {
		return new DialogueSchema {
			Name = "SNES Dialogue",
			PointerTableOffset = pointerTableOffset,
			PointerSize = 2,
			EntryCount = entryCount,
			TextBaseOffset = textBaseOffset,
			BankOffset = 0,
			EndMarker = endMarker,
			IsPointerRelative = true,
			ControlCodes = {
				new ControlCode { Code = 0x01, Name = "LINE", DisplayAs = "\n", Description = "New line" },
				new ControlCode { Code = 0x02, Name = "PAGE", DisplayAs = "\n\n", Description = "New page/wait" },
				new ControlCode { Code = 0x03, Name = "ITEM", DisplayAs = "[ITEM]", ParamBytes = 1, Description = "Item name" },
				new ControlCode { Code = 0x04, Name = "NAME", DisplayAs = "[NAME]", ParamBytes = 1, Description = "Character name" },
				new ControlCode { Code = 0x05, Name = "NUM", DisplayAs = "[NUM]", ParamBytes = 1, Description = "Number" },
				new ControlCode { Code = 0x06, Name = "COLOR", DisplayAs = "", ParamBytes = 1, Description = "Text color" },
				new ControlCode { Code = 0x07, Name = "SPEED", DisplayAs = "", ParamBytes = 1, Description = "Text speed" },
				new ControlCode { Code = 0x08, Name = "PAUSE", DisplayAs = "...", ParamBytes = 1, Description = "Pause frames" }
			}
		};
	}

	[GeneratedRegex(@"^([0-9A-Fa-f]{2})=(.+)$")]
	private static partial Regex TblLineRegex();
}
