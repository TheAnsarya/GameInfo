// C# equivalent of Python tools: dte_compress.py, dte_analyzer.py
// See: tools/text/dte_compress.py, tools/analysis/dte_analyzer.py

using System.Collections.Frozen;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Text;

/// <summary>
/// Represents a DTE (Dual Tile Encoding) pair mapping.
/// </summary>
/// <param name="ByteValue">The byte value used to represent this pair.</param>
/// <param name="Text">The character sequence this byte expands to.</param>
/// <param name="Occurrences">Number of times this pair occurs in the corpus.</param>
/// <param name="Savings">Total bytes saved by using this pair.</param>
public sealed record DtePair(
	int ByteValue,
	string Text,
	int Occurrences = 0,
	int Savings = 0
) {
	/// <summary>
	/// Length of the text this pair represents.
	/// </summary>
	public int Length => Text.Length;

	/// <summary>
	/// Format as TBL file line.
	/// </summary>
	public string ToTblLine() =>
		$"{ByteValue:X2}={Text}";

	/// <summary>
	/// Format as TBL file line with comment.
	/// </summary>
	public string ToTblLineWithComment() =>
		$"{ByteValue:X2}={Text}\t; used {Occurrences}x, saves {Savings} bytes";
}

/// <summary>
/// Result of DTE analysis on a text corpus.
/// </summary>
/// <param name="Pairs">The DTE pairs found/generated.</param>
/// <param name="OriginalSize">Original text size in bytes.</param>
/// <param name="CompressedSize">Size after DTE compression.</param>
/// <param name="TotalSavings">Total bytes saved.</param>
/// <param name="CompressionRatio">Ratio of compressed to original size.</param>
public sealed record DteAnalysisResult(
	IReadOnlyList<DtePair> Pairs,
	int OriginalSize,
	int CompressedSize,
	int TotalSavings,
	double CompressionRatio
) {
	/// <summary>
	/// Percentage of space saved.
	/// </summary>
	public double PercentSaved =>
		OriginalSize > 0 ? (1.0 - CompressionRatio) * 100 : 0;
}

/// <summary>
/// Configuration for DTE optimization.
/// </summary>
/// <param name="StartByte">First byte value available for DTE entries.</param>
/// <param name="EndByte">Last byte value available for DTE entries.</param>
/// <param name="MinLength">Minimum length of sequences to consider.</param>
/// <param name="MaxLength">Maximum length of sequences to consider.</param>
/// <param name="MinOccurrences">Minimum occurrences required to be considered.</param>
/// <param name="PreserveControlCodes">Whether to skip control code markers in analysis.</param>
public sealed record DteConfig(
	int StartByte = 0x80,
	int EndByte = 0xFE,
	int MinLength = 2,
	int MaxLength = 2,
	int MinOccurrences = 3,
	bool PreserveControlCodes = true
) {
	/// <summary>
	/// Maximum number of DTE entries available.
	/// </summary>
	public int MaxEntries => EndByte - StartByte + 1;

	/// <summary>
	/// Standard NES DTE configuration (bytes 0x80-0xFE).
	/// </summary>
	public static DteConfig NesStandard => new(0x80, 0xFE);

	/// <summary>
	/// SNES DTE configuration with more available bytes.
	/// </summary>
	public static DteConfig SnesStandard => new(0x80, 0xFF);

	/// <summary>
	/// MTE (Multi-Tile Encoding) configuration for longer sequences.
	/// </summary>
	public static DteConfig MteStandard => new(0x80, 0xFE, 2, 8);

	/// <summary>
	/// Aggressive MTE configuration.
	/// </summary>
	public static DteConfig MteAggressive => new(0x80, 0xFF, 2, 16, 2);
}

/// <summary>
/// Result of DTE compression operation.
/// </summary>
/// <param name="CompressedData">The compressed byte data.</param>
/// <param name="OriginalText">The original text.</param>
/// <param name="Stats">Compression statistics.</param>
public sealed record DteCompressionResult(
	byte[] CompressedData,
	string OriginalText,
	DteAnalysisResult Stats
);

/// <summary>
/// DTE (Dual Tile Encoding) optimizer for text compression.
/// Analyzes text to find optimal character pairs/sequences for compression.
/// </summary>
public sealed class DteOptimizer {
	private readonly Dictionary<int, string> _dteTable = [];
	private readonly Dictionary<string, int> _reverseDteTable = [];
	private readonly Dictionary<int, char> _charTable = [];
	private readonly Dictionary<char, int> _reverseCharTable = [];

	/// <summary>
	/// Gets the current DTE table (byte -> text mappings).
	/// </summary>
	public IReadOnlyDictionary<int, string> DteTable => _dteTable;

	/// <summary>
	/// Gets the current character encoding table.
	/// </summary>
	public IReadOnlyDictionary<int, char> CharTable => _charTable;

	/// <summary>
	/// Gets or sets the configuration.
	/// </summary>
	public DteConfig Config {
		get;
		set => field = value ?? DteConfig.NesStandard;
	} = DteConfig.NesStandard;

	/// <summary>
	/// Loads a TBL file for character encoding.
	/// </summary>
	/// <param name="tblContent">Content of the TBL file.</param>
	public void LoadTbl(string tblContent) {
		_charTable.Clear();
		_reverseCharTable.Clear();

		foreach (var line in tblContent.Split('\n', StringSplitOptions.RemoveEmptyEntries)) {
			var trimmed = line.TrimStart();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#') || trimmed.StartsWith(';')) {
				continue;
			}

			var eqIndex = trimmed.IndexOf('=');
			if (eqIndex <= 0) continue;

			var hexPart = trimmed[..eqIndex].Trim();
			var charPart = trimmed[(eqIndex + 1)..]; // Don't trim - preserve trailing spaces!

			// Handle escape sequences and empty (which means space)
			char actualChar;
			if (charPart == "\\n") {
				actualChar = '\n';
			} else if (charPart == "\\r") {
				actualChar = '\r';
			} else if (charPart == "\\t") {
				actualChar = '\t';
			} else if (charPart.Length >= 1) {
				actualChar = charPart[0];
			} else {
				continue; // Empty value
			}

			if (int.TryParse(hexPart, System.Globalization.NumberStyles.HexNumber, null, out var byteVal)) {
				_charTable[byteVal] = actualChar;
				if (!_reverseCharTable.ContainsKey(actualChar)) {
					_reverseCharTable[actualChar] = byteVal;
				}
			}
		}
	}

	/// <summary>
	/// Loads a TBL file from a file path.
	/// </summary>
	/// <param name="path">Path to the TBL file.</param>
	public void LoadTblFromFile(string path) {
		LoadTbl(File.ReadAllText(path, Encoding.UTF8));
	}

	/// <summary>
	/// Loads a DTE table from TBL format.
	/// </summary>
	/// <param name="dteContent">Content of the DTE table file.</param>
	public void LoadDteTable(string dteContent) {
		_dteTable.Clear();
		_reverseDteTable.Clear();

		foreach (var line in dteContent.Split('\n', StringSplitOptions.RemoveEmptyEntries)) {
			var trimmed = line.Trim();

			// Remove comments
			var commentIndex = trimmed.IndexOf(';');
			if (commentIndex >= 0) {
				trimmed = trimmed[..commentIndex].Trim();
			}

			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#')) {
				continue;
			}

			var eqIndex = trimmed.IndexOf('=');
			if (eqIndex <= 0) continue;

			var hexPart = trimmed[..eqIndex].Trim();
			var textPart = trimmed[(eqIndex + 1)..];

			if (int.TryParse(hexPart, System.Globalization.NumberStyles.HexNumber, null, out var byteVal)) {
				_dteTable[byteVal] = textPart;
				_reverseDteTable[textPart] = byteVal;
			}
		}
	}

	/// <summary>
	/// Loads a DTE table from a file path.
	/// </summary>
	/// <param name="path">Path to the DTE table file.</param>
	public void LoadDteTableFromFile(string path) {
		LoadDteTable(File.ReadAllText(path, Encoding.UTF8));
	}

	/// <summary>
	/// Sets a DTE entry.
	/// </summary>
	/// <param name="byteValue">The byte value for this entry.</param>
	/// <param name="text">The text this byte expands to.</param>
	public void SetDteEntry(int byteValue, string text) {
		// Remove old reverse mapping if exists
		if (_dteTable.TryGetValue(byteValue, out var oldText)) {
			_reverseDteTable.Remove(oldText);
		}

		_dteTable[byteValue] = text;
		_reverseDteTable[text] = byteValue;
	}

	/// <summary>
	/// Clears all DTE entries.
	/// </summary>
	public void ClearDteTable() {
		_dteTable.Clear();
		_reverseDteTable.Clear();
	}

	/// <summary>
	/// Analyzes text to count sequence occurrences.
	/// </summary>
	/// <param name="text">Text to analyze.</param>
	/// <returns>Dictionary of sequence to occurrence count.</returns>
	public Dictionary<string, int> AnalyzeSequences(string text) {
		var sequences = new Dictionary<string, int>();

		for (int length = Config.MinLength; length <= Config.MaxLength; length++) {
			for (int i = 0; i <= text.Length - length; i++) {
				var seq = text.Substring(i, length);

				// Skip if contains control codes
				if (Config.PreserveControlCodes && (seq.Contains('[') || seq.Contains(']'))) {
					continue;
				}

				// Skip if contains non-printable characters (except common whitespace)
				if (!seq.All(c => !char.IsControl(c) || c == '\n' || c == '\r' || c == '\t')) {
					continue;
				}

				sequences.TryGetValue(seq, out var count);
				sequences[seq] = count + 1;
			}
		}

		return sequences;
	}

	/// <summary>
	/// Generates an optimal DTE table from a text corpus.
	/// </summary>
	/// <param name="text">Text corpus to analyze.</param>
	/// <returns>Analysis result with generated DTE pairs.</returns>
	public DteAnalysisResult GenerateOptimalTable(string text) {
		// Analyze sequences
		var sequences = AnalyzeSequences(text);

		// Filter by minimum occurrences and calculate savings
		var candidates = sequences
			.Where(kvp => kvp.Value >= Config.MinOccurrences)
			.Select(kvp => new {
				Text = kvp.Key,
				Count = kvp.Value,
				Savings = (kvp.Key.Length - 1) * kvp.Value
			})
			.OrderByDescending(x => x.Savings)
			.ToList();

		// Greedily select non-overlapping pairs
		var selectedPairs = new List<DtePair>();
		var usedSequences = new HashSet<string>();
		var currentByte = Config.StartByte;

		foreach (var candidate in candidates) {
			if (currentByte > Config.EndByte) break;

			// Skip if this sequence is a substring of an already selected longer sequence
			var isSubstring = usedSequences.Any(used =>
				used.Contains(candidate.Text) && used != candidate.Text);

			if (isSubstring) continue;

			var pair = new DtePair(
				currentByte,
				candidate.Text,
				candidate.Count,
				candidate.Savings
			);

			selectedPairs.Add(pair);
			usedSequences.Add(candidate.Text);
			currentByte++;
		}

		// Update internal table
		_dteTable.Clear();
		_reverseDteTable.Clear();
		foreach (var pair in selectedPairs) {
			_dteTable[pair.ByteValue] = pair.Text;
			_reverseDteTable[pair.Text] = pair.ByteValue;
		}

		// Calculate compression stats
		var (compressedSize, totalSavings) = CalculateCompressionStats(text, selectedPairs);
		var ratio = text.Length > 0 ? (double)compressedSize / text.Length : 1.0;

		return new DteAnalysisResult(
			selectedPairs,
			text.Length,
			compressedSize,
			totalSavings,
			ratio
		);
	}

	/// <summary>
	/// Generates an optimal DTE table using iterative refinement for MTE.
	/// This handles longer sequences better by avoiding overlapping selections.
	/// </summary>
	/// <param name="text">Text corpus to analyze.</param>
	/// <returns>Analysis result with generated DTE pairs.</returns>
	public DteAnalysisResult GenerateOptimalTableIterative(string text) {
		var workingText = text;
		var selectedPairs = new List<DtePair>();
		var currentByte = Config.StartByte;

		while (currentByte <= Config.EndByte) {
			// Analyze current text
			var sequences = AnalyzeSequences(workingText);

			// Find best candidate
			var bestCandidate = sequences
				.Where(kvp => kvp.Value >= Config.MinOccurrences)
				.Select(kvp => new {
					Text = kvp.Key,
					Count = kvp.Value,
					Savings = (kvp.Key.Length - 1) * kvp.Value
				})
				.OrderByDescending(x => x.Savings)
				.FirstOrDefault();

			if (bestCandidate == null || bestCandidate.Savings <= 0) break;

			var pair = new DtePair(
				currentByte,
				bestCandidate.Text,
				bestCandidate.Count,
				bestCandidate.Savings
			);

			selectedPairs.Add(pair);

			// Replace in working text to avoid double-counting
			workingText = workingText.Replace(bestCandidate.Text, ((char)currentByte).ToString());
			currentByte++;
		}

		// Update internal table
		_dteTable.Clear();
		_reverseDteTable.Clear();
		foreach (var pair in selectedPairs) {
			_dteTable[pair.ByteValue] = pair.Text;
			_reverseDteTable[pair.Text] = pair.ByteValue;
		}

		// Calculate compression stats
		var (compressedSize, totalSavings) = CalculateCompressionStats(text, selectedPairs);
		var ratio = text.Length > 0 ? (double)compressedSize / text.Length : 1.0;

		return new DteAnalysisResult(
			selectedPairs,
			text.Length,
			compressedSize,
			totalSavings,
			ratio
		);
	}

	/// <summary>
	/// Compresses text using the current DTE table.
	/// Uses greedy matching (longest match first).
	/// </summary>
	/// <param name="text">Text to compress.</param>
	/// <returns>Compressed byte array.</returns>
	public byte[] Compress(string text) {
		var result = new List<byte>();

		// Sort DTE entries by length (longest first) for greedy matching
		var sortedDte = _reverseDteTable
			.OrderByDescending(kvp => kvp.Key.Length)
			.ToList();

		int i = 0;
		while (i < text.Length) {
			bool matched = false;

			// Try DTE sequences first (longest first)
			foreach (var (seq, byteVal) in sortedDte) {
				if (i + seq.Length <= text.Length &&
					text.AsSpan(i, seq.Length).SequenceEqual(seq)) {
					result.Add((byte)byteVal);
					i += seq.Length;
					matched = true;
					break;
				}
			}

			if (!matched) {
				// Use standard character encoding
				var c = text[i];
				if (_reverseCharTable.TryGetValue(c, out var charByte)) {
					result.Add((byte)charByte);
				} else if (c < 256) {
					// Use raw byte value
					result.Add((byte)c);
				}
				// Skip unrepresentable characters
				i++;
			}
		}

		return [.. result];
	}

	/// <summary>
	/// Compresses text using optimal dynamic programming approach.
	/// Finds the minimum-length encoding considering all possibilities.
	/// </summary>
	/// <param name="text">Text to compress.</param>
	/// <returns>Optimally compressed byte array.</returns>
	public byte[] CompressOptimal(string text) {
		if (string.IsNullOrEmpty(text)) return [];

		int n = text.Length;

		// dp[i] = (minBytes, backtrackInfo) to encode text[i:]
		var dp = new (int Cost, (string Type, int Value, int Next)? Info)[n + 1];
		for (int i = 0; i <= n; i++) {
			dp[i] = (int.MaxValue / 2, null);
		}

		dp[n] = (0, null);

		// Sort DTE entries by length (longest first)
		var sortedDte = _reverseDteTable
			.OrderByDescending(kvp => kvp.Key.Length)
			.ToList();

		// Fill DP table backwards
		for (int i = n - 1; i >= 0; i--) {
			// Option 1: Use single character
			var c = text[i];
			if (_reverseCharTable.TryGetValue(c, out var charByte)) {
				int cost = 1 + dp[i + 1].Cost;
				if (cost < dp[i].Cost) {
					dp[i] = (cost, ("char", charByte, i + 1));
				}
			} else if (c < 256) {
				int cost = 1 + dp[i + 1].Cost;
				if (cost < dp[i].Cost) {
					dp[i] = (cost, ("raw", c, i + 1));
				}
			}

			// Option 2: Use DTE entries
			foreach (var (seq, byteVal) in sortedDte) {
				if (i + seq.Length <= n &&
					text.AsSpan(i, seq.Length).SequenceEqual(seq)) {
					int cost = 1 + dp[i + seq.Length].Cost;
					if (cost < dp[i].Cost) {
						dp[i] = (cost, ("dte", byteVal, i + seq.Length));
					}
				}
			}
		}

		// Reconstruct solution
		var result = new List<byte>();
		int pos = 0;
		while (pos < n && dp[pos].Info != null) {
			var (type, value, next) = dp[pos].Info.Value;
			result.Add((byte)value);
			pos = next;
		}

		return [.. result];
	}

	/// <summary>
	/// Decompresses DTE-encoded data.
	/// </summary>
	/// <param name="data">Compressed data.</param>
	/// <returns>Decompressed text.</returns>
	public string Decompress(byte[] data) {
		var result = new StringBuilder();

		foreach (var b in data) {
			if (_dteTable.TryGetValue(b, out var dteText)) {
				result.Append(dteText);
			} else if (_charTable.TryGetValue(b, out var c)) {
				result.Append(c);
			} else if (b >= 0x20 && b < 0x7F) {
				// ASCII printable
				result.Append((char)b);
			} else {
				// Unknown byte - use placeholder
				result.Append($"[{b:X2}]");
			}
		}

		return result.ToString();
	}

	/// <summary>
	/// Exports the DTE table in TBL format.
	/// </summary>
	/// <param name="includeComments">Whether to include usage comments.</param>
	/// <returns>TBL format string.</returns>
	public string ExportTbl(bool includeComments = true) {
		var lines = new List<string> {
			"; DTE (Dual Tile Encoding) Table",
			"; Generated by GameInfoTools DteOptimizer",
			";"
		};

		foreach (var byteVal in _dteTable.Keys.OrderBy(k => k)) {
			var text = _dteTable[byteVal];
			if (includeComments) {
				lines.Add($"{byteVal:X2}={text}");
			} else {
				lines.Add($"{byteVal:X2}={text}");
			}
		}

		return string.Join(Environment.NewLine, lines);
	}

	/// <summary>
	/// Exports the DTE table in assembly format.
	/// </summary>
	/// <param name="tableName">Name for the assembly label.</param>
	/// <returns>Assembly format string.</returns>
	public string ExportAsm(string tableName = "DTETable") {
		var lines = new List<string> {
			"; DTE (Dual Tile Encoding) Expansion Table",
			"; Generated by GameInfoTools DteOptimizer",
			";",
			"; Format: Each entry is 2 bytes (the character pair)",
			"",
			$"{tableName}:"
		};

		if (_dteTable.Count == 0) {
			lines.Add("\t; (empty table)");
			return string.Join(Environment.NewLine, lines);
		}

		var sortedKeys = _dteTable.Keys.OrderBy(k => k).ToList();
		int start = sortedKeys.First();
		int end = sortedKeys.Last();

		for (int byteVal = start; byteVal <= end; byteVal++) {
			if (_dteTable.TryGetValue(byteVal, out var text)) {
				var bytes = text.Select(c => (int)c).ToList();
				var bytesStr = string.Join(", ", bytes.Select(b => $"${b:X2}"));
				var escapedText = text.Replace("\"", "\\\"");
				lines.Add($"\t.byte {bytesStr}\t; ${byteVal:X2} = \"{escapedText}\"");
			} else {
				lines.Add($"\t.byte $00, $00\t; ${byteVal:X2} (unused)");
			}
		}

		return string.Join(Environment.NewLine, lines);
	}

	/// <summary>
	/// Exports the DTE analysis as JSON.
	/// </summary>
	/// <param name="result">Analysis result to export.</param>
	/// <returns>JSON string.</returns>
	public static string ExportJson(DteAnalysisResult result) {
		var data = new {
			stats = new {
				original_size = result.OriginalSize,
				compressed_size = result.CompressedSize,
				total_savings = result.TotalSavings,
				compression_ratio = result.CompressionRatio,
				percent_saved = result.PercentSaved
			},
			pairs = result.Pairs.Select(p => new {
				byte_value = $"${p.ByteValue:X2}",
				text = p.Text,
				occurrences = p.Occurrences,
				savings = p.Savings
			})
		};

		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true
		});
	}

	/// <summary>
	/// Analyzes multiple text files for optimal DTE table.
	/// </summary>
	/// <param name="texts">Collection of texts to analyze.</param>
	/// <returns>Combined analysis result.</returns>
	public DteAnalysisResult AnalyzeMultiple(IEnumerable<string> texts) {
		var combined = string.Join("\n", texts);
		return GenerateOptimalTable(combined);
	}

	/// <summary>
	/// Calculates compression statistics for given text and pairs.
	/// </summary>
	private (int CompressedSize, int TotalSavings) CalculateCompressionStats(
		string text,
		IReadOnlyList<DtePair> pairs) {

		var workingText = text;
		int totalSavings = 0;

		// Sort by length (longest first) for accurate calculation
		foreach (var pair in pairs.OrderByDescending(p => p.Length)) {
			int count = 0;
			int index = 0;

			while ((index = workingText.IndexOf(pair.Text, index, StringComparison.Ordinal)) >= 0) {
				count++;
				index += pair.Length;
			}

			totalSavings += count * (pair.Length - 1);

			// Replace to avoid double-counting
			workingText = workingText.Replace(pair.Text, "X");
		}

		int compressedSize = text.Length - totalSavings;
		return (compressedSize, totalSavings);
	}

	/// <summary>
	/// Gets a preset configuration by name.
	/// </summary>
	/// <param name="preset">Preset name: "nes", "snes", "mte", "aggressive".</param>
	/// <returns>The preset configuration.</returns>
	public static DteConfig GetPreset(string preset) => preset.ToLowerInvariant() switch {
		"nes" => DteConfig.NesStandard,
		"snes" => DteConfig.SnesStandard,
		"mte" => DteConfig.MteStandard,
		"aggressive" => DteConfig.MteAggressive,
		_ => DteConfig.NesStandard
	};

	/// <summary>
	/// Validates that text can be encoded with current tables.
	/// </summary>
	/// <param name="text">Text to validate.</param>
	/// <returns>List of characters that cannot be encoded.</returns>
	public List<char> ValidateEncodable(string text) {
		var unrepresentable = new HashSet<char>();

		foreach (var c in text) {
			// Check if in char table
			if (_reverseCharTable.ContainsKey(c)) continue;

			// Check if in DTE sequences (as part of a sequence)
			if (_reverseDteTable.Keys.Any(seq => seq.Contains(c))) continue;

			// Check if ASCII printable
			if (c >= 0x20 && c < 0x7F) continue;

			unrepresentable.Add(c);
		}

		return [.. unrepresentable.OrderBy(c => c)];
	}
}
