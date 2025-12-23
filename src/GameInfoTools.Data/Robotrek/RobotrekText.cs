using System.Text;

namespace GameInfoTools.Data.Robotrek;

/// <summary>
/// Text encoding and decoding for Robotrek.
/// </summary>
public static class RobotrekText {
	// Standard character table
	private static readonly Dictionary<byte, char> CharTable = new() {
		{ 0x00, '\n' },  // End of string
		{ 0x01, 'A' }, { 0x02, 'B' }, { 0x03, 'C' }, { 0x04, 'D' }, { 0x05, 'E' },
		{ 0x06, 'F' }, { 0x07, 'G' }, { 0x08, 'H' }, { 0x09, 'I' }, { 0x0A, 'J' },
		{ 0x0B, 'K' }, { 0x0C, 'L' }, { 0x0D, 'M' }, { 0x0E, 'N' }, { 0x0F, 'O' },
		{ 0x10, 'P' }, { 0x11, 'Q' }, { 0x12, 'R' }, { 0x13, 'S' }, { 0x14, 'T' },
		{ 0x15, 'U' }, { 0x16, 'V' }, { 0x17, 'W' }, { 0x18, 'X' }, { 0x19, 'Y' },
		{ 0x1A, 'Z' },
		{ 0x1B, 'a' }, { 0x1C, 'b' }, { 0x1D, 'c' }, { 0x1E, 'd' }, { 0x1F, 'e' },
		{ 0x20, 'f' }, { 0x21, 'g' }, { 0x22, 'h' }, { 0x23, 'i' }, { 0x24, 'j' },
		{ 0x25, 'k' }, { 0x26, 'l' }, { 0x27, 'm' }, { 0x28, 'n' }, { 0x29, 'o' },
		{ 0x2A, 'p' }, { 0x2B, 'q' }, { 0x2C, 'r' }, { 0x2D, 's' }, { 0x2E, 't' },
		{ 0x2F, 'u' }, { 0x30, 'v' }, { 0x31, 'w' }, { 0x32, 'x' }, { 0x33, 'y' },
		{ 0x34, 'z' },
		{ 0x35, '0' }, { 0x36, '1' }, { 0x37, '2' }, { 0x38, '3' }, { 0x39, '4' },
		{ 0x3A, '5' }, { 0x3B, '6' }, { 0x3C, '7' }, { 0x3D, '8' }, { 0x3E, '9' },
		{ 0x3F, ' ' },
		{ 0x40, '.' }, { 0x41, ',' }, { 0x42, '-' }, { 0x43, '!' }, { 0x44, '?' },
		{ 0x45, '\'' }, { 0x46, '"' }, { 0x47, '…' },
		{ 0x48, '(' }, { 0x49, ')' }, { 0x4A, '[' }, { 0x4B, ']' },
		{ 0x4C, '/' }, { 0x4D, ':' }, { 0x4E, ';' }, { 0x4F, '+' }
	};

	// Reverse lookup for encoding
	private static readonly Dictionary<char, byte> ReverseCharTable;

	// Dictionary compression words
	private static readonly Dictionary<byte, string> DictionaryWords = new() {
		{ 0x80, "the " }, { 0x81, "you " }, { 0x82, "and " }, { 0x83, "for " },
		{ 0x84, "can " }, { 0x85, "this " }, { 0x86, "with " }, { 0x87, "have " },
		{ 0x88, "will " }, { 0x89, "from " }, { 0x8A, "your " }, { 0x8B, "that " },
		{ 0x8C, "what " }, { 0x8D, "there " }, { 0x8E, "here " }, { 0x8F, "it's " },
		{ 0x90, "Robot" }, { 0x91, "Invent" }, { 0x92, "Doctor" }, { 0x93, "Father" },
		{ 0x94, "Hacker" }, { 0x95, "Rococo" }, { 0x96, "Battle" }, { 0x97, "Attack" },
		{ 0x98, "Item" }, { 0x99, "weapon" }, { 0x9A, "armor" }, { 0x9B, "Program" },
		{ 0x9C, "Friend" }, { 0x9D, "Enemy" }, { 0x9E, "World" }, { 0x9F, "Time" }
	};

	// Control codes
	private static readonly Dictionary<byte, string> ControlCodes = new() {
		{ 0xF0, "[LINE]" },
		{ 0xF1, "[WAIT]" },
		{ 0xF2, "[CLEAR]" },
		{ 0xFE, "[END]" },
		{ 0xFF, "[SCRIPT_END]" }
	};

	static RobotrekText() {
		ReverseCharTable = CharTable
			.Where(kvp => kvp.Key != 0x00)  // Don't include end marker
			.ToDictionary(kvp => kvp.Value, kvp => kvp.Key);
	}

	/// <summary>
	/// Decode text from ROM bytes.
	/// </summary>
	public static (string Text, int BytesConsumed) Decode(ReadOnlySpan<byte> data) {
		var sb = new StringBuilder();
		int i = 0;

		while (i < data.Length) {
			byte b = data[i];

			// End markers
			if (b == 0x00 || b == 0xFE || b == 0xFF) {
				if (ControlCodes.TryGetValue(b, out var code)) {
					sb.Append(code);
				}
				i++;
				break;
			}

			// Control codes with parameters
			if (b >= 0xF0 && b <= 0xFD) {
				sb.Append(HandleControlCode(data, ref i));
				continue;
			}

			// Dictionary words
			if (DictionaryWords.TryGetValue(b, out var word)) {
				sb.Append(word);
				i++;
				continue;
			}

			// Standard characters
			if (CharTable.TryGetValue(b, out var c)) {
				sb.Append(c);
				i++;
				continue;
			}

			// Unknown byte
			sb.Append($"[${b:X2}]");
			i++;
		}

		return (sb.ToString(), i);
	}

	private static string HandleControlCode(ReadOnlySpan<byte> data, ref int i) {
		byte code = data[i];
		i++;

		return code switch {
			0xF0 => "[LINE]",
			0xF1 => "[WAIT]",
			0xF2 => "[CLEAR]",
			0xF3 when i < data.Length => $"[PAUSE:{data[i++]}]",
			0xF4 when i < data.Length => $"[SPEED:{data[i++]}]",
			0xF5 when i + 1 < data.Length => $"[POS:{data[i++]},{data[i++]}]",
			0xF6 when i < data.Length => $"[COLOR:{data[i++]}]",
			0xF7 when i < data.Length => $"[NAME:{data[i++]}]",
			0xF8 when i + 1 < data.Length => $"[NUM:${data[i++]:X2}{data[i++]:X2}]",
			0xF9 when i < data.Length => $"[ITEM:{data[i++]}]",
			0xFA when i < data.Length => $"[SOUND:{data[i++]}]",
			0xFB when i < data.Length => $"[FACE:{data[i++]}]",
			0xFC when i + 2 < data.Length => $"[CHOICE:{data[i++]},${data[i++]:X2}{data[i++]:X2}]",
			0xFD when i + 1 < data.Length => $"[JUMP:${data[i++]:X2}{data[i++]:X2}]",
			_ => $"[${code:X2}]"
		};
	}

	/// <summary>
	/// Encode text to ROM bytes.
	/// </summary>
	public static byte[] Encode(string text) {
		var result = new List<byte>();
		int i = 0;

		while (i < text.Length) {
			// Check for control code markers
			if (text[i] == '[') {
				int end = text.IndexOf(']', i);
				if (end > i) {
					string code = text[(i + 1)..end];
					result.AddRange(EncodeControlCode(code));
					i = end + 1;
					continue;
				}
			}

			// Try to match dictionary words
			bool matched = false;
			foreach (var (b, word) in DictionaryWords) {
				if (text.AsSpan(i).StartsWith(word)) {
					result.Add(b);
					i += word.Length;
					matched = true;
					break;
				}
			}
			if (matched) continue;

			// Standard character
			if (ReverseCharTable.TryGetValue(text[i], out var charByte)) {
				result.Add(charByte);
			} else {
				// Unknown character, encode as space
				result.Add(0x3F);
			}
			i++;
		}

		return result.ToArray();
	}

	private static byte[] EncodeControlCode(string code) {
		// Handle simple codes
		return code switch {
			"LINE" => new byte[] { 0xF0 },
			"WAIT" => new byte[] { 0xF1 },
			"CLEAR" => new byte[] { 0xF2 },
			"END" => new byte[] { 0xFE },
			"SCRIPT_END" => new byte[] { 0xFF },
			_ => ParseParameterizedCode(code)
		};
	}

	private static byte[] ParseParameterizedCode(string code) {
		if (code.StartsWith("PAUSE:") && byte.TryParse(code[6..], out var pause)) {
			return new byte[] { 0xF3, pause };
		}
		if (code.StartsWith("SPEED:") && byte.TryParse(code[6..], out var speed)) {
			return new byte[] { 0xF4, speed };
		}
		if (code.StartsWith("FACE:") && byte.TryParse(code[5..], out var face)) {
			return new byte[] { 0xFB, face };
		}
		if (code.StartsWith("ITEM:") && byte.TryParse(code[5..], out var item)) {
			return new byte[] { 0xF9, item };
		}
		if (code.StartsWith("NAME:") && byte.TryParse(code[5..], out var name)) {
			return new byte[] { 0xF7, name };
		}

		// Unknown code, return empty
		return Array.Empty<byte>();
	}

	/// <summary>
	/// Generate TBL file content.
	/// </summary>
	public static string GenerateTblFile() {
		var sb = new StringBuilder();
		sb.AppendLine("# Robotrek Text Table (US)");
		sb.AppendLine("# Generated by GameInfoTools");
		sb.AppendLine();

		foreach (var (b, c) in CharTable.OrderBy(x => x.Key)) {
			if (c == '\n') {
				sb.AppendLine($"{b:X2}=\\n");
			} else {
				sb.AppendLine($"{b:X2}={c}");
			}
		}

		sb.AppendLine();
		sb.AppendLine("# Control codes");
		foreach (var (b, code) in ControlCodes.OrderBy(x => x.Key)) {
			sb.AppendLine($"{b:X2}={code}");
		}

		return sb.ToString();
	}
}
