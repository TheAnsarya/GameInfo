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
}
