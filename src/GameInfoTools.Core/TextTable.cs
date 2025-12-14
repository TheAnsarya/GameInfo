using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace GameInfoTools.Core;

/// <summary>
/// TBL file format types for import/export.
/// </summary>
public enum TblFormat {
	/// <summary>Standard TBL format (XX=char)</summary>
	Standard,
	/// <summary>Atlas format (XX=char with $ prefix optional)</summary>
	Atlas,
	/// <summary>Thingy format (XXXX=char for multi-byte)</summary>
	Thingy,
	/// <summary>JSON format for modern tools</summary>
	Json,
	/// <summary>XML format for modern tools</summary>
	Xml,
	/// <summary>CSV format (hex,char)</summary>
	Csv
}

/// <summary>
/// DTE/MTE entry for dictionary encoding.
/// </summary>
public record DteEntry(byte[] Bytes, string Text, int Frequency = 0) {
	/// <summary>Hex string representation of the bytes.</summary>
	public string HexString => BitConverter.ToString(Bytes).Replace("-", "").ToLowerInvariant();

	/// <summary>Compression ratio (text length vs byte length).</summary>
	public double Ratio => (double)Text.Length / Bytes.Length;
}

/// <summary>
/// Result of encoding pattern auto-detection.
/// </summary>
public record EncodingDetectionResult(
	string DetectedType,
	double Confidence,
	Dictionary<byte, char> SuggestedMappings,
	List<string> DetectedPatterns);

/// <summary>
/// Text table (.tbl) file parser and encoder.
/// Handles custom character encoding tables used in retro games.
/// </summary>
public class TextTable {
	private readonly Dictionary<byte, string> _decodeTable = new();
	private readonly Dictionary<string, byte> _encodeTable = new();
	private readonly Dictionary<string, string> _controlCodes = new();
	private readonly Dictionary<byte[], string> _dteTable = new(new ByteArrayComparer());
	private readonly Dictionary<string, byte[]> _dteEncodeTable = new();

	public string Name { get; set; } = "Unnamed";
	public int EntryCount => _decodeTable.Count;
	public int DteCount => _dteTable.Count;
	public IReadOnlyDictionary<byte, string> DecodeTable => _decodeTable;
	public IReadOnlyDictionary<string, byte> EncodeTable => _encodeTable;
	public IReadOnlyDictionary<string, string> ControlCodes => _controlCodes;

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
		// Trim line to handle Windows line endings
		line = line.TrimEnd('\r', '\n');

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

	#region DTE/MTE Management

	/// <summary>
	/// Add a DTE (Dual Tile Encoding) or MTE (Multi Tile Encoding) entry.
	/// Maps multiple bytes to a text string for compression.
	/// </summary>
	public void AddDteEntry(byte[] bytes, string text) {
		_dteTable[bytes] = text;
		_dteEncodeTable[text] = bytes;
	}

	/// <summary>
	/// Remove a DTE/MTE entry.
	/// </summary>
	public bool RemoveDteEntry(byte[] bytes) {
		if (_dteTable.TryGetValue(bytes, out var text)) {
			_dteTable.Remove(bytes);
			_dteEncodeTable.Remove(text);
			return true;
		}

		return false;
	}

	/// <summary>
	/// Get all DTE/MTE entries.
	/// </summary>
	public IEnumerable<DteEntry> GetDteEntries() {
		return _dteTable.Select(kvp => new DteEntry(kvp.Key, kvp.Value));
	}

	/// <summary>
	/// Analyze text to find optimal DTE/MTE candidates.
	/// Returns pairs/sequences that appear frequently and would benefit from compression.
	/// </summary>
	public List<DteEntry> AnalyzeDteCandidates(string text, int minLength = 2, int maxLength = 8, int minFrequency = 3) {
		var candidates = new Dictionary<string, int>();

		// Find all repeated substrings
		for (int len = minLength; len <= maxLength; len++) {
			for (int i = 0; i <= text.Length - len; i++) {
				var substr = text.Substring(i, len);
				// Skip if contains control codes or just whitespace
				if (substr.Contains('[') || string.IsNullOrWhiteSpace(substr))
					continue;

				candidates.TryGetValue(substr, out var count);
				candidates[substr] = count + 1;
			}
		}

		// Filter by frequency and calculate compression benefit
		var results = new List<DteEntry>();
		foreach (var kvp in candidates.Where(c => c.Value >= minFrequency)) {
			// Encode the string to see how many bytes it would take
			var encoded = Encode(kvp.Key);
			if (encoded.Length > 1) {
				// This would benefit from DTE/MTE (replacing N bytes with 1-2 bytes)
				var entry = new DteEntry(encoded, kvp.Key, kvp.Value);
				results.Add(entry);
			}
		}

		// Sort by compression benefit (frequency * savings)
		return results
			.OrderByDescending(e => e.Frequency * (e.Bytes.Length - 1))
			.ToList();
	}

	/// <summary>
	/// Auto-generate DTE entries from a text corpus.
	/// </summary>
	public void GenerateDteFromText(string text, int maxEntries = 256, byte startByte = 0x00) {
		var candidates = AnalyzeDteCandidates(text);
		byte currentByte = startByte;

		foreach (var candidate in candidates.Take(maxEntries)) {
			// Skip bytes already in use
			while (_decodeTable.ContainsKey(currentByte) && currentByte < 0xff)
				currentByte++;

			if (currentByte >= 0xff)
				break;

			AddDteEntry([currentByte], candidate.Text);
			currentByte++;
		}
	}

	#endregion

	#region Format Import/Export

	/// <summary>
	/// Export the table to a specific format.
	/// </summary>
	public string Export(TblFormat format) {
		return format switch {
			TblFormat.Standard => ExportStandard(),
			TblFormat.Atlas => ExportAtlas(),
			TblFormat.Thingy => ExportThingy(),
			TblFormat.Json => ExportJson(),
			TblFormat.Xml => ExportXml(),
			TblFormat.Csv => ExportCsv(),
			_ => ExportStandard()
		};
	}

	/// <summary>
	/// Import a table from a specific format string.
	/// </summary>
	public static TextTable Import(string content, TblFormat format) {
		return format switch {
			TblFormat.Standard => FromString(content),
			TblFormat.Atlas => ImportAtlas(content),
			TblFormat.Thingy => ImportThingy(content),
			TblFormat.Json => ImportJson(content),
			TblFormat.Xml => ImportXml(content),
			TblFormat.Csv => ImportCsv(content),
			_ => FromString(content)
		};
	}

	/// <summary>
	/// Auto-detect format and import.
	/// </summary>
	public static (TextTable Table, TblFormat DetectedFormat) ImportAutoDetect(string content) {
		content = content.Trim();

		// JSON detection
		if (content.StartsWith("{") || content.StartsWith("[")) {
			return (ImportJson(content), TblFormat.Json);
		}

		// XML detection
		if (content.StartsWith("<?xml") || content.StartsWith("<TextTable")) {
			return (ImportXml(content), TblFormat.Xml);
		}

		// CSV detection (first line has comma but no =)
		var firstLine = content.Split('\n')[0];
		if (firstLine.Contains(',') && !firstLine.Contains('=')) {
			return (ImportCsv(content), TblFormat.Csv);
		}

		// Atlas detection (has $ prefix)
		if (content.Contains("$") && Regex.IsMatch(content, @"\$[0-9a-fA-F]+=")) {
			return (ImportAtlas(content), TblFormat.Atlas);
		}

		// Thingy detection (4+ hex digits common)
		if (Regex.IsMatch(content, @"^[0-9a-fA-F]{4,}=", RegexOptions.Multiline)) {
			return (ImportThingy(content), TblFormat.Thingy);
		}

		// Default to standard
		return (FromString(content), TblFormat.Standard);
	}

	private string ExportStandard() {
		var sb = new StringBuilder();
		sb.AppendLine($"; Text table for {Name}");
		sb.AppendLine($"; Generated by GameInfoTools");
		sb.AppendLine();

		foreach (var kvp in _decodeTable.OrderBy(k => k.Key)) {
			sb.AppendLine($"{kvp.Key:x2}={kvp.Value}");
		}

		// Export DTE entries
		if (_dteTable.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("; DTE/MTE Entries");
			foreach (var kvp in _dteTable) {
				var hex = BitConverter.ToString(kvp.Key).Replace("-", "").ToLowerInvariant();
				sb.AppendLine($"{hex}={kvp.Value}");
			}
		}

		return sb.ToString();
	}

	private string ExportAtlas() {
		var sb = new StringBuilder();
		sb.AppendLine($"// Atlas TBL for {Name}");

		foreach (var kvp in _decodeTable.OrderBy(k => k.Key)) {
			sb.AppendLine($"${kvp.Key:X2}={kvp.Value}");
		}

		return sb.ToString();
	}

	private string ExportThingy() {
		var sb = new StringBuilder();

		foreach (var kvp in _decodeTable.OrderBy(k => k.Key)) {
			sb.AppendLine($"{kvp.Key:X2}={kvp.Value}");
		}

		// Thingy supports multi-byte
		foreach (var kvp in _dteTable) {
			var hex = BitConverter.ToString(kvp.Key).Replace("-", "");
			sb.AppendLine($"{hex}={kvp.Value}");
		}

		return sb.ToString();
	}

	private string ExportJson() {
		var data = new {
			name = Name,
			entries = _decodeTable.OrderBy(k => k.Key)
				.Select(k => new { hex = k.Key.ToString("x2"), value = k.Value }),
			dte = _dteTable
				.Select(k => new {
					hex = BitConverter.ToString(k.Key).Replace("-", "").ToLowerInvariant(),
					value = k.Value
				})
		};

		return JsonSerializer.Serialize(data, new JsonSerializerOptions { WriteIndented = true });
	}

	private string ExportXml() {
		var sb = new StringBuilder();
		sb.AppendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		sb.AppendLine($"<TextTable name=\"{Name}\">");

		foreach (var kvp in _decodeTable.OrderBy(k => k.Key)) {
			var escaped = System.Security.SecurityElement.Escape(kvp.Value);
			sb.AppendLine($"  <Entry hex=\"{kvp.Key:x2}\" value=\"{escaped}\" />");
		}

		if (_dteTable.Count > 0) {
			sb.AppendLine("  <DTE>");
			foreach (var kvp in _dteTable) {
				var hex = BitConverter.ToString(kvp.Key).Replace("-", "").ToLowerInvariant();
				var escaped = System.Security.SecurityElement.Escape(kvp.Value);
				sb.AppendLine($"    <Entry hex=\"{hex}\" value=\"{escaped}\" />");
			}

			sb.AppendLine("  </DTE>");
		}

		sb.AppendLine("</TextTable>");
		return sb.ToString();
	}

	private string ExportCsv() {
		var sb = new StringBuilder();
		sb.AppendLine("hex,value");

		foreach (var kvp in _decodeTable.OrderBy(k => k.Key)) {
			var escaped = kvp.Value.Replace("\"", "\"\"");
			sb.AppendLine($"{kvp.Key:x2},\"{escaped}\"");
		}

		return sb.ToString();
	}

	private static TextTable ImportAtlas(string content) {
		var table = new TextTable();
		var lines = content.Split('\n');

		foreach (var line in lines) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith("//"))
				continue;

			// Remove $ prefix if present
			if (trimmed.StartsWith("$"))
				trimmed = trimmed[1..];

			var equalPos = trimmed.IndexOf('=');
			if (equalPos < 1)
				continue;

			var hex = trimmed[..equalPos].Trim();
			var value = trimmed[(equalPos + 1)..];

			if (byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
				table._decodeTable[b] = value;
				if (!table._encodeTable.ContainsKey(value)) {
					table._encodeTable[value] = b;
				}
			}
		}

		return table;
	}

	private static TextTable ImportThingy(string content) {
		var table = new TextTable();
		var lines = content.Split('\n');

		foreach (var line in lines) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed))
				continue;

			var equalPos = trimmed.IndexOf('=');
			if (equalPos < 1)
				continue;

			var hex = trimmed[..equalPos].Trim();
			var value = trimmed[(equalPos + 1)..];

			// Thingy supports multi-byte sequences
			if (hex.Length == 2) {
				if (byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
					table._decodeTable[b] = value;
					if (!table._encodeTable.ContainsKey(value)) {
						table._encodeTable[value] = b;
					}
				}
			} else if (hex.Length > 2) {
				// Multi-byte DTE/MTE
				var bytes = new byte[hex.Length / 2];
				bool valid = true;
				for (int i = 0; i < bytes.Length && valid; i++) {
					if (!byte.TryParse(hex.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber, null, out bytes[i]))
						valid = false;
				}

				if (valid) {
					table._dteTable[bytes] = value;
					table._dteEncodeTable[value] = bytes;
				}
			}
		}

		return table;
	}

	private static TextTable ImportJson(string content) {
		var table = new TextTable();

		using var doc = JsonDocument.Parse(content);
		var root = doc.RootElement;

		if (root.TryGetProperty("name", out var nameProp)) {
			table.Name = nameProp.GetString() ?? "Unnamed";
		}

		if (root.TryGetProperty("entries", out var entries)) {
			foreach (var entry in entries.EnumerateArray()) {
				var hex = entry.GetProperty("hex").GetString();
				var value = entry.GetProperty("value").GetString();
				if (hex != null && value != null &&
					byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
					table._decodeTable[b] = value;
					if (!table._encodeTable.ContainsKey(value)) {
						table._encodeTable[value] = b;
					}
				}
			}
		}

		if (root.TryGetProperty("dte", out var dte)) {
			foreach (var entry in dte.EnumerateArray()) {
				var hex = entry.GetProperty("hex").GetString();
				var value = entry.GetProperty("value").GetString();
				if (hex != null && value != null) {
					var bytes = new byte[hex.Length / 2];
					bool valid = true;
					for (int i = 0; i < bytes.Length && valid; i++) {
						if (!byte.TryParse(hex.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber, null, out bytes[i]))
							valid = false;
					}

					if (valid) {
						table._dteTable[bytes] = value;
						table._dteEncodeTable[value] = bytes;
					}
				}
			}
		}

		return table;
	}

	private static TextTable ImportXml(string content) {
		var table = new TextTable();

		// Simple XML parsing
		var nameMatch = Regex.Match(content, @"<TextTable[^>]*name=""([^""]+)""");
		if (nameMatch.Success) {
			table.Name = nameMatch.Groups[1].Value;
		}

		// Parse entries
		var entryMatches = Regex.Matches(content, @"<Entry[^>]*hex=""([^""]+)""[^>]*value=""([^""]+)""");
		foreach (Match match in entryMatches) {
			var hex = match.Groups[1].Value;
			var value = System.Net.WebUtility.HtmlDecode(match.Groups[2].Value);

			if (hex.Length == 2) {
				if (byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
					table._decodeTable[b] = value;
					if (!table._encodeTable.ContainsKey(value)) {
						table._encodeTable[value] = b;
					}
				}
			} else {
				var bytes = new byte[hex.Length / 2];
				bool valid = true;
				for (int i = 0; i < bytes.Length && valid; i++) {
					if (!byte.TryParse(hex.Substring(i * 2, 2), System.Globalization.NumberStyles.HexNumber, null, out bytes[i]))
						valid = false;
				}

				if (valid) {
					table._dteTable[bytes] = value;
					table._dteEncodeTable[value] = bytes;
				}
			}
		}

		return table;
	}

	private static TextTable ImportCsv(string content) {
		var table = new TextTable();
		var lines = content.Split('\n');
		bool isHeader = true;

		foreach (var line in lines) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed))
				continue;

			// Skip header
			if (isHeader) {
				isHeader = false;
				if (trimmed.StartsWith("hex,") || trimmed.StartsWith("Hex,"))
					continue;
			}

			// Parse CSV (handle quoted values)
			var match = Regex.Match(trimmed, @"^([0-9a-fA-F]+),""?([^""]*)?""?$");
			if (match.Success) {
				var hex = match.Groups[1].Value;
				var value = match.Groups[2].Value.Replace("\"\"", "\"");

				if (byte.TryParse(hex, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
					table._decodeTable[b] = value;
					if (!table._encodeTable.ContainsKey(value)) {
						table._encodeTable[value] = b;
					}
				}
			}
		}

		return table;
	}

	#endregion

	#region Encoding Pattern Detection

	/// <summary>
	/// Analyze binary data to auto-detect text encoding patterns.
	/// </summary>
	public static EncodingDetectionResult DetectEncodingPatterns(byte[] data, string knownText = "") {
		var result = new EncodingDetectionResult(
			"Unknown",
			0.0,
			new Dictionary<byte, char>(),
			new List<string>());

		// Common encoding patterns
		var patterns = new List<(string Name, Func<byte[], double> Detector, Func<byte[], Dictionary<byte, char>> Mapper)> {
			("ASCII-based", DetectAsciiPattern, MapAsciiPattern),
			("ShiftJIS-based", DetectShiftJisPattern, MapShiftJisPattern),
			("Dragon Quest", DetectDragonQuestPattern, MapDragonQuestPattern),
			("Sequential", DetectSequentialPattern, MapSequentialPattern)
		};

		string bestPattern = "Unknown";
		double bestConfidence = 0.0;
		Dictionary<byte, char> bestMappings = new();

		foreach (var (name, detector, mapper) in patterns) {
			var confidence = detector(data);
			if (confidence > bestConfidence) {
				bestConfidence = confidence;
				bestPattern = name;
				bestMappings = mapper(data);
			}
		}

		// If we have known text, try to correlate
		if (!string.IsNullOrEmpty(knownText)) {
			var correlationMappings = CorrelateKnownText(data, knownText);
			if (correlationMappings.Count > bestMappings.Count) {
				bestMappings = correlationMappings;
				bestPattern = "Correlated";
				bestConfidence = correlationMappings.Count / 256.0;
			}
		}

		return new EncodingDetectionResult(
			bestPattern,
			bestConfidence,
			bestMappings,
			DetectPatternFeatures(data));
	}

	private static double DetectAsciiPattern(byte[] data) {
		int asciiCount = 0;
		foreach (var b in data) {
			if (b >= 0x20 && b < 0x7f)
				asciiCount++;
		}

		return (double)asciiCount / data.Length;
	}

	private static Dictionary<byte, char> MapAsciiPattern(byte[] data) {
		var mappings = new Dictionary<byte, char>();
		for (int i = 0x20; i < 0x7f; i++) {
			mappings[(byte)i] = (char)i;
		}

		return mappings;
	}

	private static double DetectShiftJisPattern(byte[] data) {
		// ShiftJIS uses 0x81-0x9F and 0xE0-0xFC as first bytes
		int shiftJisCount = 0;
		for (int i = 0; i < data.Length - 1; i++) {
			byte b = data[i];
			if ((b >= 0x81 && b <= 0x9f) || (b >= 0xe0 && b <= 0xfc)) {
				shiftJisCount++;
				i++; // Skip second byte
			}
		}

		return (double)shiftJisCount / (data.Length / 2.0);
	}

	private static Dictionary<byte, char> MapShiftJisPattern(byte[] data) {
		// Return basic hiragana range mapping
		var mappings = new Dictionary<byte, char>();
		// Half-width katakana
		for (int i = 0; i < 63; i++) {
			mappings[(byte)(0xa1 + i)] = (char)(0xff61 + i);
		}

		return mappings;
	}

	private static double DetectDragonQuestPattern(byte[] data) {
		// DQ typically uses 0x80+ for letters with specific patterns
		int dqCount = 0;
		foreach (var b in data) {
			if (b >= 0x80 && b < 0xc0)
				dqCount++;
		}

		return (double)dqCount / data.Length * 0.8;
	}

	private static Dictionary<byte, char> MapDragonQuestPattern(byte[] data) {
		var mappings = new Dictionary<byte, char>();
		// Common DQ pattern: A-Z at 0x80-0x99, a-z at 0x9A-0xB3
		for (int i = 0; i < 26; i++) {
			mappings[(byte)(0x80 + i)] = (char)('A' + i);
		}

		for (int i = 0; i < 26; i++) {
			mappings[(byte)(0x9a + i)] = (char)('a' + i);
		}

		return mappings;
	}

	private static double DetectSequentialPattern(byte[] data) {
		// Look for sequential runs that might indicate text
		int sequentialRuns = 0;
		for (int i = 0; i < data.Length - 2; i++) {
			if (Math.Abs(data[i + 1] - data[i]) <= 1 && Math.Abs(data[i + 2] - data[i + 1]) <= 1)
				sequentialRuns++;
		}

		return (double)sequentialRuns / data.Length * 0.5;
	}

	private static Dictionary<byte, char> MapSequentialPattern(byte[] data) {
		// Find the most common starting byte and assume A-Z sequence
		var histogram = new int[256];
		foreach (var b in data)
			histogram[b]++;

		byte mostCommon = 0;
		int maxCount = 0;
		for (int i = 0; i < 256; i++) {
			if (histogram[i] > maxCount) {
				maxCount = histogram[i];
				mostCommon = (byte)i;
			}
		}

		// Assume this is around 'e' or ' ' (common chars) and map from there
		var mappings = new Dictionary<byte, char>();
		int offset = mostCommon - 'e';
		for (int i = 0; i < 26; i++) {
			var b = (byte)((offset + 'a' + i) & 0xff);
			mappings[b] = (char)('a' + i);
		}

		return mappings;
	}

	private static Dictionary<byte, char> CorrelateKnownText(byte[] data, string knownText) {
		var mappings = new Dictionary<byte, char>();

		// Simple correlation: find positions where known text might start
		// and try to map bytes to characters
		if (data.Length < knownText.Length)
			return mappings;

		// Try to find correlation by frequency analysis
		var dataFreq = new int[256];
		foreach (var b in data)
			dataFreq[b]++;

		var textFreq = new Dictionary<char, int>();
		foreach (var c in knownText) {
			textFreq.TryGetValue(c, out var count);
			textFreq[c] = count + 1;
		}

		// Match by frequency
		var sortedData = Enumerable.Range(0, 256)
			.Where(i => dataFreq[i] > 0)
			.OrderByDescending(i => dataFreq[i])
			.ToList();
		var sortedText = textFreq.OrderByDescending(k => k.Value).ToList();

		for (int i = 0; i < Math.Min(sortedData.Count, sortedText.Count); i++) {
			mappings[(byte)sortedData[i]] = sortedText[i].Key;
		}

		return mappings;
	}

	private static List<string> DetectPatternFeatures(byte[] data) {
		var features = new List<string>();

		// Check for null terminators
		if (data.Contains((byte)0x00))
			features.Add("Contains null terminators");

		// Check for high-bit text
		int highBit = data.Count(b => b >= 0x80);
		if (highBit > data.Length * 0.3)
			features.Add("High-bit encoding (>30%)");

		// Check for control codes
		if (data.Contains((byte)0xff) || data.Contains((byte)0xfe))
			features.Add("Contains FF/FE control codes");

		// Check for repeating patterns
		var histogram = new int[256];
		foreach (var b in data)
			histogram[b]++;
		int distinctBytes = histogram.Count(h => h > 0);
		if (distinctBytes < 64)
			features.Add($"Limited byte range ({distinctBytes} distinct values)");

		return features;
	}

	#endregion

	#region Preview Helpers

	/// <summary>
	/// Preview decode with highlighting of unknown bytes.
	/// </summary>
	public (string Text, List<int> UnknownPositions) DecodeWithHighlights(byte[] data, int start = 0, int length = -1) {
		var sb = new StringBuilder();
		var unknownPos = new List<int>();
		int end = length < 0 ? data.Length : Math.Min(start + length, data.Length);

		for (int i = start; i < end; i++) {
			if (_decodeTable.TryGetValue(data[i], out var str)) {
				sb.Append(str);
			} else {
				unknownPos.Add(sb.Length);
				sb.Append($"[{data[i]:x2}]");
			}
		}

		return (sb.ToString(), unknownPos);
	}

	/// <summary>
	/// Get statistics about table coverage on data.
	/// </summary>
	public (int Mapped, int Unmapped, double Coverage) GetCoverageStats(byte[] data) {
		int mapped = 0;
		int unmapped = 0;

		foreach (var b in data) {
			if (_decodeTable.ContainsKey(b))
				mapped++;
			else
				unmapped++;
		}

		double coverage = data.Length > 0 ? (double)mapped / data.Length : 0;
		return (mapped, unmapped, coverage);
	}

	/// <summary>
	/// Remove an entry from the table.
	/// </summary>
	public bool RemoveEntry(byte value) {
		if (_decodeTable.TryGetValue(value, out var str)) {
			_decodeTable.Remove(value);
			_encodeTable.Remove(str);
			return true;
		}

		return false;
	}

	/// <summary>
	/// Clear all entries from the table.
	/// </summary>
	public void Clear() {
		_decodeTable.Clear();
		_encodeTable.Clear();
		_controlCodes.Clear();
		_dteTable.Clear();
		_dteEncodeTable.Clear();
	}

	/// <summary>
	/// Merge another table into this one.
	/// </summary>
	public void Merge(TextTable other, bool overwrite = false) {
		foreach (var kvp in other._decodeTable) {
			if (overwrite || !_decodeTable.ContainsKey(kvp.Key)) {
				AddEntry(kvp.Key, kvp.Value);
			}
		}

		foreach (var kvp in other._dteTable) {
			if (overwrite || !_dteTable.ContainsKey(kvp.Key)) {
				AddDteEntry(kvp.Key, kvp.Value);
			}
		}
	}

	#endregion
}

/// <summary>
/// Comparer for byte arrays in dictionaries.
/// </summary>
internal class ByteArrayComparer : IEqualityComparer<byte[]> {
	public bool Equals(byte[]? x, byte[]? y) {
		if (x == null || y == null)
			return x == y;
		if (x.Length != y.Length)
			return false;
		for (int i = 0; i < x.Length; i++) {
			if (x[i] != y[i])
				return false;
		}

		return true;
	}

	public int GetHashCode(byte[] obj) {
		if (obj == null)
			return 0;
		int hash = 17;
		foreach (var b in obj)
			hash = (hash * 31) + b;
		return hash;
	}
}
