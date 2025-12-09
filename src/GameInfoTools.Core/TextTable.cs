using System.Text;

namespace GameInfoTools.Core;

/// <summary>
/// Text table (.tbl) file parser and encoder.
/// Handles custom character encoding tables used in retro games.
/// </summary>
public class TextTable {
	private readonly Dictionary<byte, string> _decodeTable = new();
	private readonly Dictionary<string, byte> _encodeTable = new();
	private readonly Dictionary<string, string> _controlCodes = new();

	public string Name { get; set; } = "Unnamed";
	public int EntryCount => _decodeTable.Count;

	public static TextTable Load(string path) {
		var table = new TextTable {
			Name = Path.GetFileNameWithoutExtension(path)
		};

		var lines = File.ReadAllLines(path);
		foreach (var line in lines) {
			table.ParseLine(line);
		}

		return table;
	}

	public static TextTable FromString(string content) {
		var table = new TextTable();
		var lines = content.Split('\n');
		foreach (var line in lines) {
			table.ParseLine(line);
		}

		return table;
	}

	private void ParseLine(string line) {
		// Skip empty lines and comments
		if (string.IsNullOrWhiteSpace(line))
			return;
		if (line.StartsWith(";") || line.StartsWith("#") || line.StartsWith("//"))
			return;

		var equalPos = line.IndexOf('=');
		if (equalPos < 1)
			return;

		var hex = line[..equalPos].Trim();
		var value = line[(equalPos + 1)..];

		// Check for control codes (bracketed values)
		if (value.StartsWith("[") && value.EndsWith("]")) {
			// Multi-byte or special control code
			if (TryParseHex(hex, out var bytes)) {
				if (bytes.Length == 1) {
					_decodeTable[bytes[0]] = value;
					_encodeTable[value] = bytes[0];
				} else {
					// Multi-byte sequence - store as string key
					var hexKey = BitConverter.ToString(bytes).Replace("-", "");
					_controlCodes[hexKey] = value;
				}
			}
		} else {
			// Single byte character mapping
			if (byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
				_decodeTable[b] = value;
				if (!_encodeTable.ContainsKey(value)) {
					_encodeTable[value] = b;
				}
			}
		}
	}

	private bool TryParseHex(string hex, out byte[] bytes) {
		try {
			// Handle both "XX" and "XXXX" formats
			hex = hex.Replace(" ", "").Replace("-", "");
			bytes = new byte[hex.Length / 2];
			for (int i = 0; i < bytes.Length; i++) {
				bytes[i] = byte.Parse(hex.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber);
			}

			return true;
		} catch {
			bytes = Array.Empty<byte>();
			return false;
		}
	}

	/// <summary>
	/// Decode bytes to string using this table.
	/// </summary>
	public string Decode(byte[] data, int start = 0, int length = -1) {
		var sb = new StringBuilder();
		int end = length < 0 ? data.Length : Math.Min(start + length, data.Length);

		for (int i = start; i < end; i++) {
			if (_decodeTable.TryGetValue(data[i], out var str)) {
				sb.Append(str);
			} else {
				// Unknown byte - output as hex
				sb.Append($"[{data[i]:x2}]");
			}
		}

		return sb.ToString();
	}

	/// <summary>
	/// Decode bytes until an end marker is found.
	/// </summary>
	public string DecodeUntil(byte[] data, int start, byte endMarker, out int bytesRead) {
		var sb = new StringBuilder();
		bytesRead = 0;

		for (int i = start; i < data.Length; i++) {
			bytesRead++;

			if (data[i] == endMarker) {
				break;
			}

			if (_decodeTable.TryGetValue(data[i], out var str)) {
				sb.Append(str);
			} else {
				sb.Append($"[{data[i]:x2}]");
			}
		}

		return sb.ToString();
	}

	/// <summary>
	/// Decode a block of bytes, stopping at common end markers or after maxLength.
	/// Returns the decoded text and number of bytes consumed.
	/// </summary>
	public (string Text, int BytesConsumed) DecodeBlock(byte[] data, int offset, int maxLength) {
		var sb = new StringBuilder();
		int bytesConsumed = 0;

		// Common end markers in retro games
		byte[] endMarkers = { 0x00, 0xff, 0xfe, 0xfd };

		int end = Math.Min(offset + maxLength, data.Length);

		for (int i = offset; i < end; i++) {
			byte b = data[i];
			bytesConsumed++;

			// Check for end markers
			if (Array.IndexOf(endMarkers, b) >= 0) {
				// Include known control codes in output
				if (_decodeTable.TryGetValue(b, out var endStr) &&
					(endStr.Contains("[END]") || endStr.Contains("[WAIT]") || endStr.Contains("[CLEAR]"))) {
					sb.Append(endStr);
				}

				break;
			}

			if (_decodeTable.TryGetValue(b, out var str)) {
				sb.Append(str);
			} else {
				// Unknown byte - check if we've found valid text so far
				// If first byte is unknown, return empty
				if (bytesConsumed == 1) {
					return (string.Empty, 0);
				}
				// If we had valid text, stop here (don't consume this byte)
				bytesConsumed--;
				break;
			}
		}

		return (sb.ToString(), bytesConsumed);
	}

	/// <summary>
	/// Encode string to bytes using this table.
	/// </summary>
	public byte[] Encode(string text) {
		var result = new List<byte>();
		int i = 0;

		while (i < text.Length) {
			// Check for control codes first
			if (text[i] == '[') {
				int endBracket = text.IndexOf(']', i);
				if (endBracket > i) {
					string code = text.Substring(i, endBracket - i + 1);

					// Check if it's a hex literal [xx]
					if (code.Length == 4 && byte.TryParse(code[1..3], System.Globalization.NumberStyles.HexNumber, null, out var hexByte)) {
						result.Add(hexByte);
						i = endBracket + 1;
						continue;
					}

					// Check if it's a named control code
					if (_encodeTable.TryGetValue(code, out var codeByte)) {
						result.Add(codeByte);
						i = endBracket + 1;
						continue;
					}
				}
			}

			// Try to match longest string first
			bool found = false;
			for (int len = Math.Min(8, text.Length - i); len >= 1; len--) {
				string substr = text.Substring(i, len);
				if (_encodeTable.TryGetValue(substr, out var b)) {
					result.Add(b);
					i += len;
					found = true;
					break;
				}
			}

			if (!found) {
				// Unknown character - skip or add placeholder
				i++;
			}
		}

		return result.ToArray();
	}

	/// <summary>
	/// Add an entry to the table.
	/// </summary>
	public void AddEntry(byte value, string character) {
		_decodeTable[value] = character;
		if (!_encodeTable.ContainsKey(character)) {
			_encodeTable[character] = value;
		}
	}

	/// <summary>
	/// Get the character for a byte value.
	/// </summary>
	public string? GetCharacter(byte value) {
		return _decodeTable.TryGetValue(value, out var str) ? str : null;
	}

	/// <summary>
	/// Get the byte value for a character.
	/// </summary>
	public byte? GetByte(string character) {
		return _encodeTable.TryGetValue(character, out var b) ? b : null;
	}

	/// <summary>
	/// Save the table to a file.
	/// </summary>
	public void Save(string path) {
		using var writer = new StreamWriter(path);
		writer.WriteLine($"; Text table for {Name}");
		writer.WriteLine($"; Generated by GameInfoTools");
		writer.WriteLine();

		// Sort by byte value
		var sorted = _decodeTable.OrderBy(kvp => kvp.Key);
		foreach (var kvp in sorted) {
			writer.WriteLine($"{kvp.Key:x2}={kvp.Value}");
		}
	}

	/// <summary>
	/// Generate a standard ASCII table.
	/// </summary>
	public static TextTable CreateAscii() {
		var table = new TextTable { Name = "ASCII" };

		// Standard printable ASCII
		for (int i = 0x20; i < 0x7f; i++) {
			table.AddEntry((byte)i, ((char)i).ToString());
		}

		// Common control codes
		table.AddEntry(0x00, "[END]");
		table.AddEntry(0x0a, "[NL]");
		table.AddEntry(0x0d, "[CR]");

		return table;
	}

	/// <summary>
	/// Generate a basic Dragon Quest/Warrior style table.
	/// </summary>
	public static TextTable CreateDragonQuest() {
		var table = new TextTable { Name = "Dragon Quest" };

		// Uppercase A-Z
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}

		// Lowercase a-z
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x9a + i), ((char)('a' + i)).ToString());
		}

		// Numbers 0-9
		for (int i = 0; i < 10; i++) {
			table.AddEntry((byte)(0xb4 + i), i.ToString());
		}

		// Common symbols
		table.AddEntry(0xbe, " ");
		table.AddEntry(0xbf, "!");
		table.AddEntry(0xc0, "?");
		table.AddEntry(0xc1, ".");
		table.AddEntry(0xc2, ",");
		table.AddEntry(0xc3, "'");
		table.AddEntry(0xc4, "-");

		// Control codes
		table.AddEntry(0xfc, "[NL]");
		table.AddEntry(0xfd, "[WAIT]");
		table.AddEntry(0xfe, "[CLEAR]");
		table.AddEntry(0xff, "[END]");

		return table;
	}
}
