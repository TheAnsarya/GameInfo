namespace GameInfoTools.Core;

/// <summary>
/// Pattern detection utilities for finding data structures in ROMs.
/// </summary>
public static class PatternDetector {
	/// <summary>
	/// A detected pattern with location and confidence.
	/// </summary>
	public record PatternMatch(
		int Offset,
		int Length,
		string PatternType,
		double Confidence,
		Dictionary<string, object>? Metadata = null
	);

	/// <summary>
	/// A signature pattern that can include wildcards.
	/// </summary>
	public record SignaturePattern(
		string Name,
		byte?[] Bytes,
		string? Description = null,
		string? Category = null
	);

	/// <summary>
	/// Result of a signature scan.
	/// </summary>
	public record SignatureScanResult(
		SignaturePattern Pattern,
		int Offset,
		byte[] MatchedBytes
	);

	/// <summary>
	/// Parse a pattern string into bytes with wildcards.
	/// Supports formats: "AA BB ?? CC" or "AA ?? BB" where ?? is wildcard.
	/// </summary>
	public static byte?[] ParsePatternString(string pattern) {
		var parts = pattern.Split(' ', StringSplitOptions.RemoveEmptyEntries);
		var result = new byte?[parts.Length];

		for (int i = 0; i < parts.Length; i++) {
			var part = parts[i].Trim();
			if (part == "??" || part == "**" || part == "xx" || part == "XX") {
				result[i] = null; // Wildcard
			} else {
				try {
					result[i] = Convert.ToByte(part, 16);
				} catch {
					throw new ArgumentException($"Invalid pattern byte: {part}");
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Convert pattern bytes back to string format.
	/// </summary>
	public static string PatternToString(byte?[] pattern) {
		return string.Join(" ", pattern.Select(b => b.HasValue ? $"{b.Value:x2}" : "??"));
	}

	/// <summary>
	/// Search for a signature pattern in data.
	/// </summary>
	public static List<SignatureScanResult> ScanForSignature(byte[] data, SignaturePattern pattern) {
		var results = new List<SignatureScanResult>();
		var bytes = pattern.Bytes;

		for (int i = 0; i <= data.Length - bytes.Length; i++) {
			if (MatchesPattern(data, i, bytes)) {
				var matchedBytes = new byte[bytes.Length];
				Array.Copy(data, i, matchedBytes, 0, bytes.Length);
				results.Add(new SignatureScanResult(pattern, i, matchedBytes));
			}
		}

		return results;
	}

	/// <summary>
	/// Search for multiple signature patterns in data.
	/// </summary>
	public static List<SignatureScanResult> ScanForSignatures(byte[] data, IEnumerable<SignaturePattern> patterns) {
		var results = new List<SignatureScanResult>();

		foreach (var pattern in patterns) {
			results.AddRange(ScanForSignature(data, pattern));
		}

		return results.OrderBy(r => r.Offset).ToList();
	}

	/// <summary>
	/// Check if data at offset matches pattern with wildcards.
	/// </summary>
	public static bool MatchesPattern(byte[] data, int offset, byte?[] pattern) {
		if (offset + pattern.Length > data.Length)
			return false;

		for (int i = 0; i < pattern.Length; i++) {
			if (pattern[i].HasValue && data[offset + i] != pattern[i].Value)
				return false;
		}

		return true;
	}

	/// <summary>
	/// Generate a pattern from actual bytes, with optional wildcard positions.
	/// </summary>
	public static SignaturePattern GeneratePattern(
		string name,
		byte[] bytes,
		int[]? wildcardPositions = null,
		string? description = null,
		string? category = null
	) {
		var pattern = new byte?[bytes.Length];
		for (int i = 0; i < bytes.Length; i++) {
			if (wildcardPositions?.Contains(i) == true) {
				pattern[i] = null;
			} else {
				pattern[i] = bytes[i];
			}
		}

		return new SignaturePattern(name, pattern, description, category);
	}

	/// <summary>
	/// Create a pattern from code that detects specific byte sequences.
	/// </summary>
	public static SignaturePattern CreatePattern(string name, string patternString, string? description = null, string? category = null) {
		var bytes = ParsePatternString(patternString);
		return new SignaturePattern(name, bytes, description, category);
	}

	/// <summary>
	/// Get common patterns for a system type.
	/// </summary>
	public static List<SignaturePattern> GetCommonPatterns(SystemType system) {
		var patterns = new List<SignaturePattern>();

		switch (system) {
			case SystemType.Nes:
				patterns.AddRange(GetNesPatterns());
				break;
			case SystemType.Snes:
				patterns.AddRange(GetSnesPatterns());
				break;
			case SystemType.GameBoy:
			case SystemType.GameBoyColor:
				patterns.AddRange(GetGameBoyPatterns());
				break;
			case SystemType.GameBoyAdvance:
				patterns.AddRange(GetGbaPatterns());
				break;
		}

		return patterns;
	}

	private static List<SignaturePattern> GetNesPatterns() {
		return [
			CreatePattern("NES_JSR_RTS", "20 ?? ?? 60", "JSR followed by RTS", "Code"),
			CreatePattern("NES_LDA_STA", "a9 ?? 8d ?? ??", "LDA immediate, STA absolute", "Code"),
			CreatePattern("NES_NMI_Handler", "48 8a 48 98 48", "NMI handler prologue (PHA, TXA, PHA, TYA, PHA)", "Code"),
			CreatePattern("NES_Bank_Switch", "8d 00 80", "Bank switch write to $8000", "Code"),
			CreatePattern("NES_PPU_Write", "8d ?? 20", "Write to PPU registers", "Code"),
			CreatePattern("NES_APU_Write", "8d ?? 40", "Write to APU registers", "Code"),
			CreatePattern("NES_Pointer_Table", "?? ?? ?? ?? ?? ??", "Potential 16-bit pointer table", "Data"),
		];
	}

	private static List<SignaturePattern> GetSnesPatterns() {
		return [
			CreatePattern("SNES_Header", "?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??", "SNES ROM header area", "Header"),
			CreatePattern("SNES_JSL_RTL", "22 ?? ?? ?? 6b", "JSL followed by RTL", "Code"),
			CreatePattern("SNES_REP_SEP", "c2 ?? e2 ??", "REP/SEP register size change", "Code"),
			CreatePattern("SNES_DMA_Setup", "8d 00 43", "DMA register setup", "Code"),
			CreatePattern("SNES_HDMA_Setup", "8d 00 42", "HDMA register setup", "Code"),
			CreatePattern("SNES_Mode7_Setup", "8d 11 21", "Mode 7 register", "Code"),
		];
	}

	private static List<SignaturePattern> GetGameBoyPatterns() {
		return [
			CreatePattern("GB_Nintendo_Logo", "ce ed 66 66 cc 0d 00 0b 03 73 00 83", "Nintendo logo (partial)", "Header"),
			CreatePattern("GB_RST_00", "c7", "RST $00", "Code"),
			CreatePattern("GB_RST_08", "cf", "RST $08", "Code"),
			CreatePattern("GB_RST_38", "ff", "RST $38", "Code"),
			CreatePattern("GB_Bank_Switch", "ea ?? ??", "LD (nn), A - potential bank switch", "Code"),
			CreatePattern("GB_VRAM_Copy", "22", "LD (HL+), A - VRAM copy", "Code"),
		];
	}

	private static List<SignaturePattern> GetGbaPatterns() {
		return [
			CreatePattern("GBA_Nintendo_Logo", "24 ff ae 51 69 9a a2 21 3d 84 82 0a", "GBA Nintendo logo (partial)", "Header"),
			CreatePattern("GBA_Branch", "ea ?? ?? ??", "ARM branch instruction", "Code"),
			CreatePattern("GBA_BX_LR", "1e ff 2f e1", "BX LR (return)", "Code"),
			CreatePattern("GBA_SWI", "?? 00 00 ef", "Software interrupt", "Code"),
		];
	}

	/// <summary>
	/// Pattern library for storing and managing patterns.
	/// </summary>
	public class PatternLibrary {
		private readonly List<SignaturePattern> _patterns = [];

		public IReadOnlyList<SignaturePattern> Patterns => _patterns;

		public void Add(SignaturePattern pattern) => _patterns.Add(pattern);

		public void AddRange(IEnumerable<SignaturePattern> patterns) => _patterns.AddRange(patterns);

		public void Remove(string name) => _patterns.RemoveAll(p => p.Name == name);

		public void Clear() => _patterns.Clear();

		public List<SignaturePattern> GetByCategory(string category) =>
			_patterns.Where(p => p.Category == category).ToList();

		public SignaturePattern? GetByName(string name) =>
			_patterns.FirstOrDefault(p => p.Name == name);

		public List<SignatureScanResult> ScanAll(byte[] data) =>
			ScanForSignatures(data, _patterns);

		/// <summary>
		/// Export library to JSON format.
		/// </summary>
		public string ExportToJson() {
			var sb = new System.Text.StringBuilder();
			sb.AppendLine("[");

			for (int i = 0; i < _patterns.Count; i++) {
				var p = _patterns[i];
				sb.AppendLine("  {");
				sb.AppendLine($"    \"name\": \"{EscapeJson(p.Name)}\",");
				sb.AppendLine($"    \"pattern\": \"{PatternToString(p.Bytes)}\",");
				if (p.Description != null)
					sb.AppendLine($"    \"description\": \"{EscapeJson(p.Description)}\",");
				if (p.Category != null)
					sb.AppendLine($"    \"category\": \"{EscapeJson(p.Category)}\"");
				sb.Append("  }");
				if (i < _patterns.Count - 1)
					sb.Append(",");
				sb.AppendLine();
			}

			sb.AppendLine("]");
			return sb.ToString();
		}

		/// <summary>
		/// Import patterns from JSON format.
		/// </summary>
		public void ImportFromJson(string json) {
			// Simple JSON parser for pattern objects
			// This is a basic implementation - in production, use System.Text.Json
			var lines = json.Split('\n');
			string? name = null;
			string? pattern = null;
			string? description = null;
			string? category = null;

			foreach (var line in lines) {
				var trimmed = line.Trim();
				if (trimmed.Contains("\"name\":")) {
					name = ExtractJsonValue(trimmed);
				} else if (trimmed.Contains("\"pattern\":")) {
					pattern = ExtractJsonValue(trimmed);
				} else if (trimmed.Contains("\"description\":")) {
					description = ExtractJsonValue(trimmed);
				} else if (trimmed.Contains("\"category\":")) {
					category = ExtractJsonValue(trimmed);
				} else if (trimmed == "}" || trimmed == "},") {
					if (name != null && pattern != null) {
						_patterns.Add(CreatePattern(name, pattern, description, category));
					}

					name = pattern = description = category = null;
				}
			}
		}

		private static string ExtractJsonValue(string line) {
			int start = line.IndexOf(':') + 1;
			int valueStart = line.IndexOf('"', start) + 1;
			int valueEnd = line.LastIndexOf('"');
			if (valueStart > 0 && valueEnd > valueStart)
				return line[valueStart..valueEnd];
			return "";
		}

		private static string EscapeJson(string value) {
			return value.Replace("\\", "\\\\").Replace("\"", "\\\"");
		}
	}

	/// <summary>
	/// Find pointer tables in ROM data.
	/// </summary>
	public static List<PatternMatch> FindPointerTables(byte[] data, SystemType system) {
		var results = new List<PatternMatch>();
		int pointerSize = system == SystemType.Snes ? 3 : 2;
		int minEntries = 4;

		for (int i = 0; i < data.Length - (pointerSize * minEntries); i++) {
			int count = CountConsecutivePointers(data, i, pointerSize, system);
			if (count >= minEntries) {
				results.Add(new PatternMatch(
					i,
					count * pointerSize,
					"PointerTable",
					Math.Min(1.0, count / 20.0),
					new Dictionary<string, object> {
						["entries"] = count,
						["pointerSize"] = pointerSize
					}
				));

				// Skip past this table
				i += (count * pointerSize) - 1;
			}
		}

		return results;
	}

	private static int CountConsecutivePointers(byte[] data, int start, int pointerSize, SystemType system) {
		int count = 0;
		int pos = start;

		while (pos + pointerSize <= data.Length) {
			int pointer = 0;
			for (int j = 0; j < pointerSize; j++) {
				pointer |= data[pos + j] << (j * 8);
			}

			if (!IsValidPointer(pointer, data.Length, system))
				break;

			count++;
			pos += pointerSize;

			if (count > 256) // Reasonable limit
				break;
		}

		return count;
	}

	private static bool IsValidPointer(int pointer, int romSize, SystemType system) {
		return system switch {
			SystemType.Nes => pointer >= 0x8000 && pointer <= 0xffff,
			SystemType.Snes => (pointer & 0xffff) >= 0x8000 || (pointer >> 16) >= 0x40,
			SystemType.GameBoy or SystemType.GameBoyColor => pointer >= 0x0000 && pointer <= 0x7fff,
			SystemType.GameBoyAdvance => pointer >= 0x08000000 && pointer < 0x08000000 + romSize,
			_ => pointer > 0 && pointer < romSize
		};
	}

	/// <summary>
	/// Find text data in ROM.
	/// </summary>
	public static List<PatternMatch> FindTextRegions(byte[] data, int minLength = 8) {
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length; i++) {
			int textLen = MeasureTextLength(data, i);
			if (textLen >= minLength) {
				results.Add(new PatternMatch(
					i,
					textLen,
					"Text",
					Math.Min(1.0, textLen / 50.0),
					new Dictionary<string, object> {
						["encoding"] = DetectTextEncoding(data, i, textLen)
					}
				));

				i += textLen - 1;
			}
		}

		return results;
	}

	private static int MeasureTextLength(byte[] data, int start) {
		int length = 0;
		int textChars = 0;

		for (int i = start; i < data.Length; i++) {
			byte b = data[i];

			// Common text byte ranges
			bool isText = (b >= 0x20 && b <= 0x7e) ||  // ASCII printable
						  (b >= 0x80 && b <= 0xdf) ||  // Common Japanese/custom
						  (b >= 0xa0 && b <= 0xff);    // Extended

			if (isText) {
				textChars++;
				length++;
			} else if (b == 0x00 || b == 0xff) {
				// Potential end marker
				if (textChars > 0) {
					length++;
					break;
				}

				break;
			} else if (textChars > 0 && length - textChars < 5) {
				// Allow some control codes
				length++;
			} else {
				break;
			}
		}

		return textChars > length / 2 ? length : 0;
	}

	private static string DetectTextEncoding(byte[] data, int start, int length) {
		int asciiCount = 0;
		int jpCount = 0;
		int customCount = 0;

		for (int i = 0; i < length && start + i < data.Length; i++) {
			byte b = data[start + i];
			if (b >= 0x20 && b <= 0x7e)
				asciiCount++;
			else if (b >= 0x80 && b <= 0x9f)
				jpCount++;
			else if (b >= 0xa0 && b <= 0xdf)
				customCount++;
		}

		if (asciiCount > length * 0.8)
			return "ASCII";
		if (jpCount > length * 0.3)
			return "ShiftJIS";
		return "Custom";
	}

	/// <summary>
	/// Find graphics data (CHR/tiles).
	/// </summary>
	public static List<PatternMatch> FindGraphicsRegions(byte[] data, int tileSize = 16) {
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - (tileSize * 8); i += tileSize) {
			double graphicsScore = ScoreAsGraphics(data, i, tileSize * 16);
			if (graphicsScore > 0.6) {
				// Find extent of graphics region
				int length = tileSize;
				while (i + length + tileSize <= data.Length) {
					if (ScoreAsGraphics(data, i + length, tileSize * 4) < 0.5)
						break;
					length += tileSize;
				}

				if (length >= tileSize * 4) {
					results.Add(new PatternMatch(
						i,
						length,
						"Graphics",
						graphicsScore,
						new Dictionary<string, object> {
							["tileCount"] = length / tileSize,
							["format"] = tileSize == 16 ? "2bpp" : "unknown"
						}
					));

					i += length - tileSize;
				}
			}
		}

		return results;
	}

	private static double ScoreAsGraphics(byte[] data, int start, int length) {
		if (start + length > data.Length)
			return 0;

		// Graphics typically have:
		// - Bit patterns (not all 0x00 or 0xff)
		// - Some repetition within tiles
		// - Distinct patterns from code

		int empty = 0;
		int full = 0;
		int varied = 0;

		for (int i = 0; i < length; i++) {
			byte b = data[start + i];
			if (b == 0x00)
				empty++;
			else if (b == 0xff)
				full++;
			else
				varied++;
		}

		// Good graphics have a mix of values
		double emptyRatio = (double)empty / length;
		double fullRatio = (double)full / length;
		double variedRatio = (double)varied / length;

		// Penalize if too uniform
		if (emptyRatio > 0.9 || fullRatio > 0.9)
			return 0.1;

		// Good score if varied with some empty/full
		return Math.Min(1.0, (variedRatio * 0.5) + ((1 - Math.Abs(emptyRatio - 0.3)) * 0.5));
	}

	/// <summary>
	/// Find data tables with consistent structure.
	/// </summary>
	public static List<PatternMatch> FindDataTables(byte[] data, int entrySize, int minEntries = 4) {
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - (entrySize * minEntries); i++) {
			double score = ScoreAsDataTable(data, i, entrySize, minEntries);
			if (score > 0.6) {
				// Count entries
				int count = minEntries;
				while (i + ((count + 1) * entrySize) <= data.Length) {
					if (ScoreAsDataTable(data, i + (count * entrySize), entrySize, 1) < 0.4)
						break;
					count++;
					if (count > 256)
						break;
				}

				results.Add(new PatternMatch(
					i,
					count * entrySize,
					"DataTable",
					score,
					new Dictionary<string, object> {
						["entrySize"] = entrySize,
						["entryCount"] = count
					}
				));

				i += (count * entrySize) - 1;
			}
		}

		return results;
	}

	private static double ScoreAsDataTable(byte[] data, int start, int entrySize, int minEntries) {
		if (start + (entrySize * minEntries) > data.Length)
			return 0;

		// Data tables often have:
		// - Similar byte patterns at same offsets
		// - Values within expected ranges
		// - Some variation between entries

		double similarityScore = 0;

		for (int field = 0; field < entrySize; field++) {
			var values = new List<byte>();
			for (int entry = 0; entry < minEntries; entry++) {
				values.Add(data[start + (entry * entrySize) + field]);
			}

			// Check if field has reasonable variation
			int distinct = values.Distinct().Count();
			if (distinct == 1)
				similarityScore += 0.3; // All same (could be padding or type field)
			else if (distinct == minEntries)
				similarityScore += 0.8; // All different (ID or unique data)
			else
				similarityScore += 1.0; // Some variation (realistic data)
		}

		return similarityScore / entrySize;
	}

	/// <summary>
	/// Find code regions (6502/65816).
	/// </summary>
	public static List<PatternMatch> FindCodeRegions(byte[] data, SystemType system) {
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - 16; i++) {
			double codeScore = ScoreAsCode(data, i, 32, system);
			if (codeScore > 0.7) {
				// Find extent
				int length = 32;
				while (i + length + 16 <= data.Length) {
					if (ScoreAsCode(data, i + length, 16, system) < 0.5)
						break;
					length += 16;
				}

				if (length >= 32) {
					results.Add(new PatternMatch(
						i,
						length,
						"Code",
						codeScore,
						null
					));

					i += length - 1;
				}
			}
		}

		return results;
	}

	private static double ScoreAsCode(byte[] data, int start, int length, SystemType system) {
		if (start + length > data.Length)
			return 0;

		// Common 6502 opcodes
		var commonOpcodes = new HashSet<byte>
		{
			0xa9, 0xa5, 0xad, // LDA
			0x85, 0x8d,       // STA
			0xa2, 0xa6, 0xae, // LDX
			0xa0, 0xa4, 0xac, // LDY
			0x86, 0x8e,       // STX
			0x84, 0x8c,       // STY
			0x20, 0x4c, 0x6c, // JSR, JMP
			0x60, 0x40,       // RTS, RTI
			0xd0, 0xf0, 0x90, 0xb0, 0x10, 0x30, // Branches
			0xe8, 0xca, 0xc8, 0x88, // INX, DEX, INY, DEY
			0x18, 0x38, 0xd8, 0xf8, // CLC, SEC, CLD, SED
			0x48, 0x68, 0x08, 0x28, // PHA, PLA, PHP, PLP
			0xc9, 0xc5, 0xcd, // CMP
			0xe0, 0xe4, 0xec, // CPX
			0xc0, 0xc4, 0xcc, // CPY
			0x29, 0x25, 0x2d, // AND
			0x09, 0x05, 0x0d, // ORA
			0x49, 0x45, 0x4d, // EOR
			0x69, 0x65, 0x6d, // ADC
			0xe9, 0xe5, 0xed, // SBC
			0xea,             // NOP
		};

		int opcodeHits = 0;
		for (int i = 0; i < length; i++) {
			if (commonOpcodes.Contains(data[start + i]))
				opcodeHits++;
		}

		return (double)opcodeHits / length;
	}

	#region YARA-Style Rules

	/// <summary>
	/// A YARA-style detection rule.
	/// </summary>
	public class YaraRule {
		/// <summary>Rule name.</summary>
		public string Name { get; set; } = "";

		/// <summary>Optional rule description.</summary>
		public string? Description { get; set; }

		/// <summary>Rule tags.</summary>
		public List<string> Tags { get; set; } = [];

		/// <summary>String/pattern definitions.</summary>
		public Dictionary<string, PatternDefinition> Strings { get; set; } = [];

		/// <summary>Condition expression.</summary>
		public string Condition { get; set; } = "any of them";

		/// <summary>Metadata key-value pairs.</summary>
		public Dictionary<string, string> Meta { get; set; } = [];
	}

	/// <summary>
	/// A pattern definition within a YARA rule.
	/// </summary>
	public class PatternDefinition {
		/// <summary>The pattern type.</summary>
		public PatternType Type { get; set; }

		/// <summary>Raw pattern value.</summary>
		public string Value { get; set; } = "";

		/// <summary>Pattern modifiers.</summary>
		public PatternModifiers Modifiers { get; set; }
	}

	/// <summary>
	/// Pattern types supported in YARA rules.
	/// </summary>
	public enum PatternType {
		/// <summary>Hex bytes pattern.</summary>
		Hex,
		/// <summary>ASCII string.</summary>
		String,
		/// <summary>Regular expression.</summary>
		Regex
	}

	/// <summary>
	/// Pattern modifiers for YARA strings.
	/// </summary>
	[Flags]
	public enum PatternModifiers {
		/// <summary>No modifiers.</summary>
		None = 0,
		/// <summary>Case insensitive.</summary>
		NoCase = 1,
		/// <summary>ASCII string.</summary>
		Ascii = 2,
		/// <summary>Wide (UTF-16) string.</summary>
		Wide = 4,
		/// <summary>Full word match.</summary>
		Fullword = 8
	}

	/// <summary>
	/// Result of a YARA rule match.
	/// </summary>
	public record YaraMatchResult(
		YaraRule Rule,
		List<(string StringId, int Offset, byte[] MatchedBytes)> Matches
	);

	/// <summary>
	/// Parse a YARA-style rule from text.
	/// </summary>
	public static YaraRule ParseYaraRule(string ruleText) {
		var rule = new YaraRule();
		var lines = ruleText.Split('\n').Select(l => l.Trim()).ToList();

		int i = 0;

		// Parse rule header: rule name { ... } or rule name : tag1 tag2 { ... }
		while (i < lines.Count && !lines[i].StartsWith("rule ")) {
			i++;
		}

		if (i < lines.Count) {
			var headerLine = lines[i];
			int nameStart = "rule ".Length;

			// Find end of name - could be space, colon, or brace
			int spaceIdx = headerLine.IndexOf(' ', nameStart);
			int colonIdx = headerLine.IndexOf(':');
			int braceIdx = headerLine.IndexOf('{');

			// Determine where name ends
			int nameEnd = headerLine.Length;
			if (spaceIdx > nameStart) nameEnd = Math.Min(nameEnd, spaceIdx);
			if (colonIdx > nameStart) nameEnd = Math.Min(nameEnd, colonIdx);
			if (braceIdx > nameStart) nameEnd = Math.Min(nameEnd, braceIdx);

			if (nameEnd > nameStart) {
				rule.Name = headerLine[nameStart..nameEnd].Trim();
			}

			// Parse tags if present (between : and { or end of line if { is on next line)
			if (colonIdx > 0) {
				int tagEnd = braceIdx > colonIdx ? braceIdx : headerLine.Length;
				var tagSection = headerLine[(colonIdx + 1)..tagEnd].Trim();
				rule.Tags.AddRange(tagSection.Split(' ', StringSplitOptions.RemoveEmptyEntries));
			}
		}

		i++;

		// Parse sections
		string currentSection = "";
		while (i < lines.Count) {
			var line = lines[i];

			if (line == "}" || line.StartsWith("}")) {
				break;
			}

			if (line.EndsWith(":")) {
				currentSection = line.TrimEnd(':').ToLower();
			} else if (!string.IsNullOrEmpty(line)) {
				switch (currentSection) {
					case "meta":
						ParseMetaLine(line, rule);
						break;
					case "strings":
						ParseStringLine(line, rule);
						break;
					case "condition":
						if (!string.IsNullOrEmpty(rule.Condition) && rule.Condition != "any of them") {
							rule.Condition += " " + line;
						} else {
							rule.Condition = line;
						}

						break;
				}
			}

			i++;
		}

		return rule;
	}

	private static void ParseMetaLine(string line, YaraRule rule) {
		int eqIdx = line.IndexOf('=');
		if (eqIdx > 0) {
			string key = line[..eqIdx].Trim();
			string value = line[(eqIdx + 1)..].Trim().Trim('"');
			rule.Meta[key] = value;

			if (key.Equals("description", StringComparison.OrdinalIgnoreCase)) {
				rule.Description = value;
			}
		}
	}

	private static void ParseStringLine(string line, YaraRule rule) {
		// Format: $name = { hex } or $name = "string" or $name = /regex/
		int eqIdx = line.IndexOf('=');
		if (eqIdx <= 0) return;

		string id = line[..eqIdx].Trim();
		string rest = line[(eqIdx + 1)..].Trim();

		var def = new PatternDefinition();

		// Detect pattern type
		if (rest.StartsWith('{') && rest.Contains('}')) {
			def.Type = PatternType.Hex;
			int start = rest.IndexOf('{') + 1;
			int end = rest.IndexOf('}');
			def.Value = rest[start..end].Trim();
		} else if (rest.StartsWith('"')) {
			def.Type = PatternType.String;
			int end = rest.LastIndexOf('"');
			if (end > 0) {
				def.Value = rest[1..end];
			}

			// Check modifiers
			if (rest.Contains("nocase"))
				def.Modifiers |= PatternModifiers.NoCase;
			if (rest.Contains("wide"))
				def.Modifiers |= PatternModifiers.Wide;
			if (rest.Contains("ascii"))
				def.Modifiers |= PatternModifiers.Ascii;
			if (rest.Contains("fullword"))
				def.Modifiers |= PatternModifiers.Fullword;
		} else if (rest.StartsWith('/')) {
			def.Type = PatternType.Regex;
			int end = rest.LastIndexOf('/');
			if (end > 0) {
				def.Value = rest[1..end];
			}
		}

		if (!string.IsNullOrEmpty(def.Value)) {
			rule.Strings[id] = def;
		}
	}

	/// <summary>
	/// Evaluate a YARA rule against data.
	/// </summary>
	public static YaraMatchResult? EvaluateYaraRule(byte[] data, YaraRule rule) {
		var matches = new List<(string StringId, int Offset, byte[] MatchedBytes)>();

		// Find all string matches
		foreach (var (id, def) in rule.Strings) {
			var stringMatches = FindPatternMatches(data, def);
			foreach (var (offset, matchedBytes) in stringMatches) {
				matches.Add((id, offset, matchedBytes));
			}
		}

		// Evaluate condition
		bool conditionMet = EvaluateCondition(rule.Condition, rule.Strings.Keys.ToList(), matches);

		if (conditionMet && matches.Count > 0) {
			return new YaraMatchResult(rule, matches);
		}

		return null;
	}

	private static List<(int Offset, byte[] MatchedBytes)> FindPatternMatches(byte[] data, PatternDefinition def) {
		var results = new List<(int, byte[])>();

		switch (def.Type) {
			case PatternType.Hex:
				var pattern = ParsePatternString(def.Value.Replace(" ", " "));
				for (int i = 0; i <= data.Length - pattern.Length; i++) {
					if (MatchesPattern(data, i, pattern)) {
						var matched = new byte[pattern.Length];
						Array.Copy(data, i, matched, 0, pattern.Length);
						results.Add((i, matched));
					}
				}

				break;

			case PatternType.String:
				var searchBytes = System.Text.Encoding.ASCII.GetBytes(def.Value);
				bool noCase = def.Modifiers.HasFlag(PatternModifiers.NoCase);

				for (int i = 0; i <= data.Length - searchBytes.Length; i++) {
					bool match = true;
					for (int j = 0; j < searchBytes.Length; j++) {
						byte dataByte = data[i + j];
						byte searchByte = searchBytes[j];

						if (noCase) {
							dataByte = (byte)char.ToLower((char)dataByte);
							searchByte = (byte)char.ToLower((char)searchByte);
						}

						if (dataByte != searchByte) {
							match = false;
							break;
						}
					}

					if (match) {
						var matched = new byte[searchBytes.Length];
						Array.Copy(data, i, matched, 0, searchBytes.Length);
						results.Add((i, matched));
					}
				}

				// Wide string support
				if (def.Modifiers.HasFlag(PatternModifiers.Wide)) {
					var wideBytes = System.Text.Encoding.Unicode.GetBytes(def.Value);
					for (int i = 0; i <= data.Length - wideBytes.Length; i++) {
						bool match = true;
						for (int j = 0; j < wideBytes.Length; j++) {
							if (data[i + j] != wideBytes[j]) {
								match = false;
								break;
							}
						}

						if (match) {
							var matched = new byte[wideBytes.Length];
							Array.Copy(data, i, matched, 0, wideBytes.Length);
							results.Add((i, matched));
						}
					}
				}

				break;

			case PatternType.Regex:
				try {
					var regex = new System.Text.RegularExpressions.Regex(def.Value);
					var text = System.Text.Encoding.ASCII.GetString(data);
					var regexMatches = regex.Matches(text);
					foreach (System.Text.RegularExpressions.Match m in regexMatches) {
						var matched = System.Text.Encoding.ASCII.GetBytes(m.Value);
						results.Add((m.Index, matched));
					}
				} catch {
					// Invalid regex
				}

				break;
		}

		return results;
	}

	private static bool EvaluateCondition(string condition, List<string> stringIds, List<(string StringId, int Offset, byte[] MatchedBytes)> matches) {
		var matchedIds = matches.Select(m => m.StringId).ToHashSet();
		var normalized = condition.ToLower().Trim();

		// Simple condition evaluation
		if (normalized == "any of them" || normalized == "any of ($*)") {
			return matchedIds.Count > 0;
		}

		if (normalized == "all of them" || normalized == "all of ($*)") {
			return stringIds.All(id => matchedIds.Contains(id));
		}

		// Count-based: "2 of them", "3 of ($a*, $b*)"
		var countMatch = System.Text.RegularExpressions.Regex.Match(normalized, @"^(\d+)\s+of\s+");
		if (countMatch.Success) {
			int required = int.Parse(countMatch.Groups[1].Value);
			return matchedIds.Count >= required;
		}

		// Individual string checks: $a and $b
		foreach (var id in stringIds) {
			if (normalized.Contains(id.ToLower())) {
				if (!matchedIds.Contains(id)) {
					// If condition references this string but it's not matched
					if (normalized.Contains($"{id.ToLower()} and") ||
						normalized.Contains($"and {id.ToLower()}") ||
						normalized == id.ToLower()) {
						return false;
					}
				}
			}
		}

		// Default to true if at least one match
		return matchedIds.Count > 0;
	}

	/// <summary>
	/// Scan multiple YARA rules against data.
	/// </summary>
	public static List<YaraMatchResult> ScanYaraRules(byte[] data, IEnumerable<YaraRule> rules) {
		var results = new List<YaraMatchResult>();

		foreach (var rule in rules) {
			var match = EvaluateYaraRule(data, rule);
			if (match != null) {
				results.Add(match);
			}
		}

		return results;
	}

	/// <summary>
	/// Generate a YARA rule from detected patterns.
	/// </summary>
	public static string GenerateYaraRule(string name, List<SignaturePattern> patterns, string? description = null) {
		var sb = new System.Text.StringBuilder();

		sb.AppendLine($"rule {name}");
		sb.AppendLine("{");

		// Meta section
		sb.AppendLine("    meta:");
		sb.AppendLine($"        description = \"{description ?? "Auto-generated rule"}\"");
		sb.AppendLine($"        generated = \"{DateTime.Now:yyyy-MM-dd}\"");

		// Strings section
		sb.AppendLine("    strings:");
		for (int i = 0; i < patterns.Count; i++) {
			var pattern = patterns[i];
			string id = $"$s{i}";
			string hex = PatternToString(pattern.Bytes).ToUpper();
			sb.AppendLine($"        {id} = {{ {hex} }}");
		}

		// Condition section
		sb.AppendLine("    condition:");
		sb.AppendLine("        any of them");

		sb.AppendLine("}");

		return sb.ToString();
	}

	#endregion

	#region Batch Scanning

	/// <summary>
	/// Result of scanning a single file.
	/// </summary>
	public record BatchScanFileResult(
		string FilePath,
		List<SignatureScanResult> SignatureMatches,
		List<YaraMatchResult> YaraMatches,
		List<PatternMatch> DetectedPatterns,
		Exception? Error
	);

	/// <summary>
	/// Result of batch scanning multiple files.
	/// </summary>
	public record BatchScanResult(
		List<BatchScanFileResult> FileResults,
		int TotalFiles,
		int SuccessfulScans,
		int FailedScans,
		TimeSpan ElapsedTime
	);

	/// <summary>
	/// Options for batch scanning.
	/// </summary>
	public class BatchScanOptions {
		/// <summary>Signature patterns to scan for.</summary>
		public List<SignaturePattern> Signatures { get; set; } = [];

		/// <summary>YARA rules to evaluate.</summary>
		public List<YaraRule> YaraRules { get; set; } = [];

		/// <summary>System type for built-in patterns.</summary>
		public SystemType? SystemType { get; set; }

		/// <summary>Detect pointer tables.</summary>
		public bool DetectPointers { get; set; }

		/// <summary>Detect text regions.</summary>
		public bool DetectText { get; set; }

		/// <summary>Detect graphics regions.</summary>
		public bool DetectGraphics { get; set; }

		/// <summary>Detect code regions.</summary>
		public bool DetectCode { get; set; }

		/// <summary>Progress callback.</summary>
		public Action<int, int, string>? OnProgress { get; set; }
	}

	/// <summary>
	/// Scan multiple files with pattern detection.
	/// </summary>
	public static BatchScanResult BatchScan(IEnumerable<string> filePaths, BatchScanOptions options) {
		var sw = System.Diagnostics.Stopwatch.StartNew();
		var results = new List<BatchScanFileResult>();
		var files = filePaths.ToList();
		int successful = 0;
		int failed = 0;

		for (int i = 0; i < files.Count; i++) {
			var filePath = files[i];
			options.OnProgress?.Invoke(i + 1, files.Count, filePath);

			try {
				var data = File.ReadAllBytes(filePath);
				var result = ScanFile(data, filePath, options);
				results.Add(result);
				successful++;
			} catch (Exception ex) {
				results.Add(new BatchScanFileResult(filePath, [], [], [], ex));
				failed++;
			}
		}

		sw.Stop();
		return new BatchScanResult(results, files.Count, successful, failed, sw.Elapsed);
	}

	/// <summary>
	/// Scan multiple files in parallel.
	/// </summary>
	public static async Task<BatchScanResult> BatchScanAsync(IEnumerable<string> filePaths, BatchScanOptions options, int maxParallelism = 4) {
		var sw = System.Diagnostics.Stopwatch.StartNew();
		var files = filePaths.ToList();
		var results = new System.Collections.Concurrent.ConcurrentBag<BatchScanFileResult>();
		int successful = 0;
		int failed = 0;
		int processed = 0;

		var semaphore = new System.Threading.SemaphoreSlim(maxParallelism);
		var tasks = files.Select(async filePath => {
			await semaphore.WaitAsync();
			try {
				var data = await File.ReadAllBytesAsync(filePath);
				var result = ScanFile(data, filePath, options);
				results.Add(result);
				System.Threading.Interlocked.Increment(ref successful);
				int current = System.Threading.Interlocked.Increment(ref processed);
				options.OnProgress?.Invoke(current, files.Count, filePath);
			} catch (Exception ex) {
				results.Add(new BatchScanFileResult(filePath, [], [], [], ex));
				System.Threading.Interlocked.Increment(ref failed);
			} finally {
				semaphore.Release();
			}
		});

		await Task.WhenAll(tasks);

		sw.Stop();
		return new BatchScanResult([.. results], files.Count, successful, failed, sw.Elapsed);
	}

	private static BatchScanFileResult ScanFile(byte[] data, string filePath, BatchScanOptions options) {
		var sigMatches = new List<SignatureScanResult>();
		var yaraMatches = new List<YaraMatchResult>();
		var patterns = new List<PatternMatch>();

		// Signature scanning
		if (options.Signatures.Count > 0) {
			sigMatches.AddRange(ScanForSignatures(data, options.Signatures));
		}

		// Add system-specific patterns
		if (options.SystemType.HasValue) {
			var systemPatterns = GetCommonPatterns(options.SystemType.Value);
			sigMatches.AddRange(ScanForSignatures(data, systemPatterns));
		}

		// YARA rule scanning
		if (options.YaraRules.Count > 0) {
			yaraMatches.AddRange(ScanYaraRules(data, options.YaraRules));
		}

		// Pattern detection
		SystemType system = options.SystemType ?? Core.SystemType.Nes;

		if (options.DetectPointers) {
			patterns.AddRange(FindPointerTables(data, system));
		}

		if (options.DetectText) {
			patterns.AddRange(FindTextRegions(data));
		}

		if (options.DetectGraphics) {
			patterns.AddRange(FindGraphicsRegions(data));
		}

		if (options.DetectCode) {
			patterns.AddRange(FindCodeRegions(data, system));
		}

		return new BatchScanFileResult(filePath, sigMatches, yaraMatches, patterns, null);
	}

	/// <summary>
	/// Generate a summary report from batch scan results.
	/// </summary>
	public static string GenerateBatchReport(BatchScanResult result) {
		var sb = new System.Text.StringBuilder();

		sb.AppendLine("=== Batch Scan Report ===");
		sb.AppendLine($"Files scanned: {result.TotalFiles}");
		sb.AppendLine($"Successful: {result.SuccessfulScans}");
		sb.AppendLine($"Failed: {result.FailedScans}");
		sb.AppendLine($"Time: {result.ElapsedTime.TotalSeconds:F2}s");
		sb.AppendLine();

		// Summary statistics
		var allSigMatches = result.FileResults.SelectMany(f => f.SignatureMatches).ToList();
		var allYaraMatches = result.FileResults.SelectMany(f => f.YaraMatches).ToList();
		var allPatterns = result.FileResults.SelectMany(f => f.DetectedPatterns).ToList();

		sb.AppendLine("=== Summary ===");
		sb.AppendLine($"Signature matches: {allSigMatches.Count}");
		sb.AppendLine($"YARA rule matches: {allYaraMatches.Count}");
		sb.AppendLine($"Pattern detections: {allPatterns.Count}");
		sb.AppendLine();

		// Group signature matches by pattern name
		var sigByName = allSigMatches.GroupBy(m => m.Pattern.Name);
		if (sigByName.Any()) {
			sb.AppendLine("=== Signature Match Distribution ===");
			foreach (var group in sigByName.OrderByDescending(g => g.Count())) {
				sb.AppendLine($"  {group.Key}: {group.Count()} matches");
			}

			sb.AppendLine();
		}

		// Group patterns by type
		var patternsByType = allPatterns.GroupBy(p => p.PatternType);
		if (patternsByType.Any()) {
			sb.AppendLine("=== Pattern Type Distribution ===");
			foreach (var group in patternsByType.OrderByDescending(g => g.Count())) {
				sb.AppendLine($"  {group.Key}: {group.Count()} detections");
			}

			sb.AppendLine();
		}

		// Files with most matches
		var topFiles = result.FileResults
			.OrderByDescending(f => f.SignatureMatches.Count + f.YaraMatches.Count + f.DetectedPatterns.Count)
			.Take(10)
			.ToList();

		if (topFiles.Count > 0) {
			sb.AppendLine("=== Top Files by Matches ===");
			foreach (var file in topFiles) {
				int total = file.SignatureMatches.Count + file.YaraMatches.Count + file.DetectedPatterns.Count;
				sb.AppendLine($"  {Path.GetFileName(file.FilePath)}: {total} total");
			}
		}

		// Errors
		var errors = result.FileResults.Where(f => f.Error != null).ToList();
		if (errors.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("=== Errors ===");
			foreach (var err in errors) {
				sb.AppendLine($"  {Path.GetFileName(err.FilePath)}: {err.Error!.Message}");
			}
		}

		return sb.ToString();
	}

	#endregion

	#region Multi-Architecture Support

	/// <summary>
	/// Architecture type for code detection.
	/// </summary>
	public enum ArchitectureType {
		/// <summary>MOS 6502 (NES, C64, etc).</summary>
		Mos6502,
		/// <summary>WDC 65C816 (SNES).</summary>
		Wdc65816,
		/// <summary>Sharp LR35902 (Game Boy).</summary>
		GameBoyZ80,
		/// <summary>Zilog Z80.</summary>
		Z80,
		/// <summary>Motorola 68000.</summary>
		M68000,
		/// <summary>ARM (GBA, DS).</summary>
		Arm7,
		/// <summary>Sony SPC700 (SNES audio).</summary>
		Spc700
	}

	/// <summary>
	/// Get common code patterns for a specific architecture.
	/// </summary>
	public static List<SignaturePattern> GetArchitecturePatterns(ArchitectureType arch) {
		return arch switch {
			ArchitectureType.Mos6502 => Get6502Patterns(),
			ArchitectureType.Wdc65816 => Get65816Patterns(),
			ArchitectureType.GameBoyZ80 => GetGameBoyZ80Patterns(),
			ArchitectureType.Z80 => GetZ80Patterns(),
			ArchitectureType.M68000 => GetM68000Patterns(),
			ArchitectureType.Arm7 => GetArm7Patterns(),
			ArchitectureType.Spc700 => GetSpc700Patterns(),
			_ => []
		};
	}

	private static List<SignaturePattern> Get6502Patterns() {
		return [
			CreatePattern("6502_JSR", "20 ?? ??", "JSR addr", "Code"),
			CreatePattern("6502_JMP", "4c ?? ??", "JMP addr", "Code"),
			CreatePattern("6502_JMP_IND", "6c ?? ??", "JMP (addr)", "Code"),
			CreatePattern("6502_RTS", "60", "RTS", "Code"),
			CreatePattern("6502_RTI", "40", "RTI", "Code"),
			CreatePattern("6502_BRK", "00", "BRK", "Code"),
			CreatePattern("6502_NOP", "ea", "NOP", "Code"),
			CreatePattern("6502_LDA_IMM", "a9 ??", "LDA #imm", "Code"),
			CreatePattern("6502_LDA_ZP", "a5 ??", "LDA zp", "Code"),
			CreatePattern("6502_LDA_ABS", "ad ?? ??", "LDA abs", "Code"),
			CreatePattern("6502_STA_ZP", "85 ??", "STA zp", "Code"),
			CreatePattern("6502_STA_ABS", "8d ?? ??", "STA abs", "Code"),
			CreatePattern("6502_STACK_FRAME", "48 8a 48 98 48", "Standard stack frame push", "Code"),
		];
	}

	private static List<SignaturePattern> Get65816Patterns() {
		return [
			CreatePattern("65816_JSL", "22 ?? ?? ??", "JSL long", "Code"),
			CreatePattern("65816_JML", "5c ?? ?? ??", "JML long", "Code"),
			CreatePattern("65816_RTL", "6b", "RTL", "Code"),
			CreatePattern("65816_REP", "c2 ??", "REP #imm", "Code"),
			CreatePattern("65816_SEP", "e2 ??", "SEP #imm", "Code"),
			CreatePattern("65816_PHB_PHK", "8b 4b", "PHB PHK (common prologue)", "Code"),
			CreatePattern("65816_PLB_RTL", "ab 6b", "PLB RTL (common epilogue)", "Code"),
			CreatePattern("65816_XBA", "eb", "XBA", "Code"),
			CreatePattern("65816_TCD", "5b", "TCD", "Code"),
			CreatePattern("65816_TDC", "7b", "TDC", "Code"),
			CreatePattern("65816_MVN", "54 ?? ??", "MVN", "Code"),
			CreatePattern("65816_MVP", "44 ?? ??", "MVP", "Code"),
		];
	}

	private static List<SignaturePattern> GetGameBoyZ80Patterns() {
		return [
			CreatePattern("GB_NOP", "00", "NOP", "Code"),
			CreatePattern("GB_RET", "c9", "RET", "Code"),
			CreatePattern("GB_RETI", "d9", "RETI", "Code"),
			CreatePattern("GB_JP", "c3 ?? ??", "JP nn", "Code"),
			CreatePattern("GB_JP_HL", "e9", "JP (HL)", "Code"),
			CreatePattern("GB_CALL", "cd ?? ??", "CALL nn", "Code"),
			CreatePattern("GB_RST_00", "c7", "RST $00", "Code"),
			CreatePattern("GB_RST_38", "ff", "RST $38", "Code"),
			CreatePattern("GB_LD_HL_INC", "22", "LD (HL+),A", "Code"),
			CreatePattern("GB_LD_HL_DEC", "32", "LD (HL-),A", "Code"),
			CreatePattern("GB_LDH", "e0 ??", "LDH (n),A", "Code"),
			CreatePattern("GB_DI", "f3", "DI", "Code"),
			CreatePattern("GB_EI", "fb", "EI", "Code"),
			CreatePattern("GB_HALT", "76", "HALT", "Code"),
		];
	}

	private static List<SignaturePattern> GetZ80Patterns() {
		return [
			CreatePattern("Z80_NOP", "00", "NOP", "Code"),
			CreatePattern("Z80_RET", "c9", "RET", "Code"),
			CreatePattern("Z80_RETI", "ed 4d", "RETI", "Code"),
			CreatePattern("Z80_RETN", "ed 45", "RETN", "Code"),
			CreatePattern("Z80_JP", "c3 ?? ??", "JP nn", "Code"),
			CreatePattern("Z80_CALL", "cd ?? ??", "CALL nn", "Code"),
			CreatePattern("Z80_LD_HL_NN", "21 ?? ??", "LD HL,nn", "Code"),
			CreatePattern("Z80_LD_SP_NN", "31 ?? ??", "LD SP,nn", "Code"),
			CreatePattern("Z80_PUSH_AF", "f5", "PUSH AF", "Code"),
			CreatePattern("Z80_POP_AF", "f1", "POP AF", "Code"),
			CreatePattern("Z80_EI", "fb", "EI", "Code"),
			CreatePattern("Z80_DI", "f3", "DI", "Code"),
			CreatePattern("Z80_HALT", "76", "HALT", "Code"),
			CreatePattern("Z80_LDIR", "ed b0", "LDIR", "Code"),
			CreatePattern("Z80_LDDR", "ed b8", "LDDR", "Code"),
		];
	}

	private static List<SignaturePattern> GetM68000Patterns() {
		return [
			CreatePattern("M68K_NOP", "4e 71", "NOP", "Code"),
			CreatePattern("M68K_RTS", "4e 75", "RTS", "Code"),
			CreatePattern("M68K_RTE", "4e 73", "RTE", "Code"),
			CreatePattern("M68K_JSR", "4e b9 ?? ?? ?? ??", "JSR (abs).L", "Code"),
			CreatePattern("M68K_JMP", "4e f9 ?? ?? ?? ??", "JMP (abs).L", "Code"),
			CreatePattern("M68K_BSR", "61 ??", "BSR.S", "Code"),
			CreatePattern("M68K_BRA", "60 ??", "BRA.S", "Code"),
			CreatePattern("M68K_MOVEM_PUSH", "48 e7 ?? ??", "MOVEM.L regs,-(SP)", "Code"),
			CreatePattern("M68K_MOVEM_POP", "4c df ?? ??", "MOVEM.L (SP)+,regs", "Code"),
			CreatePattern("M68K_LINK", "4e 50 ?? ??", "LINK A0", "Code"),
			CreatePattern("M68K_UNLK", "4e 58", "UNLK A0", "Code"),
		];
	}

	private static List<SignaturePattern> GetArm7Patterns() {
		return [
			CreatePattern("ARM_NOP", "00 00 a0 e1", "MOV R0,R0 (NOP)", "Code"),
			CreatePattern("ARM_BX_LR", "1e ff 2f e1", "BX LR", "Code"),
			CreatePattern("ARM_SWI", "?? ?? ?? ef", "SWI", "Code"),
			CreatePattern("ARM_PUSH", "?? ?? 2d e9", "PUSH", "Code"),
			CreatePattern("ARM_POP", "?? ?? bd e8", "POP", "Code"),
			CreatePattern("ARM_MOV_PC_LR", "0e f0 a0 e1", "MOV PC,LR", "Code"),
			CreatePattern("THUMB_NOP", "c0 46", "MOV R8,R8 (NOP)", "Code"),
			CreatePattern("THUMB_BX_LR", "70 47", "BX LR", "Code"),
			CreatePattern("THUMB_PUSH", "?? b5", "PUSH", "Code"),
			CreatePattern("THUMB_POP", "?? bd", "POP {PC}", "Code"),
		];
	}

	private static List<SignaturePattern> GetSpc700Patterns() {
		return [
			CreatePattern("SPC_NOP", "00", "NOP", "Code"),
			CreatePattern("SPC_RET", "6f", "RET", "Code"),
			CreatePattern("SPC_RETI", "7f", "RETI", "Code"),
			CreatePattern("SPC_BRA", "2f ??", "BRA", "Code"),
			CreatePattern("SPC_CALL", "3f ?? ??", "CALL", "Code"),
			CreatePattern("SPC_TCALL_0", "01", "TCALL 0", "Code"),
			CreatePattern("SPC_TCALL_1", "11", "TCALL 1", "Code"),
			CreatePattern("SPC_PCALL", "4f ??", "PCALL", "Code"),
			CreatePattern("SPC_MOV_A_IMM", "e8 ??", "MOV A,#imm", "Code"),
			CreatePattern("SPC_MOV_A_X", "7d", "MOV A,X", "Code"),
			CreatePattern("SPC_MOV_X_A", "5d", "MOV X,A", "Code"),
			CreatePattern("SPC_SLEEP", "ef", "SLEEP", "Code"),
			CreatePattern("SPC_STOP", "ff", "STOP", "Code"),
		];
	}

	/// <summary>
	/// Score data as code for a specific architecture.
	/// </summary>
	public static double ScoreAsArchitectureCode(byte[] data, int start, int length, ArchitectureType arch) {
		if (start + length > data.Length)
			return 0;

		var patterns = GetArchitecturePatterns(arch);
		int hits = 0;
		int checks = 0;

		// Check for pattern matches in the region
		for (int i = start; i < start + length - 4; i++) {
			foreach (var pattern in patterns) {
				if (i + pattern.Bytes.Length <= start + length &&
					MatchesPattern(data, i, pattern.Bytes)) {
					hits++;
					break;
				}
			}

			checks++;
		}

		return checks > 0 ? (double)hits / checks : 0;
	}

	/// <summary>
	/// Detect the most likely architecture of code data.
	/// </summary>
	public static (ArchitectureType Architecture, double Confidence) DetectArchitecture(byte[] data, int start, int length) {
		var architectures = Enum.GetValues<ArchitectureType>();
		var scores = new Dictionary<ArchitectureType, double>();

		foreach (var arch in architectures) {
			scores[arch] = ScoreAsArchitectureCode(data, start, length, arch);
		}

		var best = scores.OrderByDescending(kv => kv.Value).First();
		return (best.Key, best.Value);
	}

	#endregion
}

