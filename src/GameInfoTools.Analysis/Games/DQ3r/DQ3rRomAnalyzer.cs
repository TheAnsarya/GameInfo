using System.Security.Cryptography;
using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// Comprehensive ROM analyzer for Dragon Quest III SNES (DQ3r).
/// Provides systematic mapping of code, data, graphics, audio, and text.
/// </summary>
public class DQ3rRomAnalyzer {
	private readonly byte[] _romData;
	private readonly int _smcHeaderSize;
	private readonly int _effectiveRomSize;

	/// <summary>
	/// Gets the analyzed ROM regions.
	/// </summary>
	public List<DQ3rRomRegion> Regions { get; } = [];

	/// <summary>
	/// Gets the code regions.
	/// </summary>
	public List<DQ3rCodeRegion> CodeRegions { get; } = [];

	/// <summary>
	/// Gets extracted game data entries.
	/// </summary>
	public List<DQ3rGameDataEntry> GameData { get; } = [];

	/// <summary>
	/// Gets bank-by-bank analysis results.
	/// </summary>
	public Dictionary<int, BankAnalysis> BankAnalyses { get; } = [];

	/// <summary>
	/// Gets the SMC header size (0 or 512).
	/// </summary>
	public int SmcHeaderSize => _smcHeaderSize;

	/// <summary>
	/// Gets the effective ROM size (without header).
	/// </summary>
	public int EffectiveRomSize => _effectiveRomSize;

	/// <summary>
	/// Create analyzer from ROM file path.
	/// </summary>
	/// <param name="romPath">Path to ROM file.</param>
	public DQ3rRomAnalyzer(string romPath) : this(File.ReadAllBytes(romPath)) {
	}

	/// <summary>
	/// Create analyzer from ROM data.
	/// </summary>
	/// <param name="romData">Raw ROM bytes.</param>
	public DQ3rRomAnalyzer(byte[] romData) {
		_romData = romData;

		// Detect SMC header (512 bytes if size % 1024 == 512)
		_smcHeaderSize = romData.Length % 1024 == 512 ? 512 : 0;
		_effectiveRomSize = romData.Length - _smcHeaderSize;
	}

	/// <summary>
	/// Run comprehensive analysis on the ROM.
	/// </summary>
	/// <returns>Analysis results summary.</returns>
	public DQ3rAnalysisResult RunAnalysis() {
		var result = new DQ3rAnalysisResult {
			RomSize = _romData.Length,
			EffectiveSize = _effectiveRomSize,
			HasSmcHeader = _smcHeaderSize > 0,
			Md5Hash = ComputeMd5(),
			Sha1Hash = ComputeSha1()
		};

		// Phase 1: Analyze banks
		AnalyzeBanks(result);

		// Phase 2: Classify data types
		ClassifyDataTypes(result);

		// Phase 3: Detect code regions
		DetectCodeRegions(result);

		// Phase 4: Extract known data tables
		ExtractKnownTables(result);

		// Phase 5: Analyze text/dialog
		AnalyzeTextRegions(result);

		// Phase 6: Detect graphics
		DetectGraphicsRegions(result);

		return result;
	}

	/// <summary>
	/// Analyze all HiROM banks ($C0-$FF).
	/// </summary>
	private void AnalyzeBanks(DQ3rAnalysisResult result) {
		for (int bank = DQ3rTypes.RomSpec.FirstBank; bank <= DQ3rTypes.RomSpec.LastBank; bank++) {
			var analysis = AnalyzeBank(bank);
			BankAnalyses[bank] = analysis;
			result.BankStats.Add(bank, analysis.GetSummary());
		}
	}

	/// <summary>
	/// Analyze a single bank.
	/// </summary>
	/// <param name="bankNumber">Bank number ($C0-$FF).</param>
	/// <returns>Bank analysis.</returns>
	public BankAnalysis AnalyzeBank(int bankNumber) {
		int startOffset = DQ3rAddressTranslator.GetBankStartOffset(bankNumber) + _smcHeaderSize;
		int endOffset = Math.Min(startOffset + DQ3rTypes.RomSpec.BankSize, _romData.Length);

		if (startOffset >= _romData.Length) {
			return new BankAnalysis {
				BankNumber = bankNumber,
				IsValid = false
			};
		}

		var bankData = _romData.AsSpan(startOffset, endOffset - startOffset);
		var analysis = new BankAnalysis {
			BankNumber = bankNumber,
			StartOffset = startOffset - _smcHeaderSize,
			EndOffset = endOffset - _smcHeaderSize,
			IsValid = true
		};

		// Calculate entropy for data type hints
		analysis.Entropy = CalculateEntropy(bankData);

		// Count byte frequencies
		var frequencies = new int[256];
		foreach (byte b in bankData) {
			frequencies[b]++;
		}

		// Detect patterns
		analysis.ZeroBytePercentage = (double)frequencies[0] / bankData.Length;
		analysis.FfBytePercentage = (double)frequencies[0xff] / bankData.Length;

		// Estimate data type based on patterns
		analysis.PredominantDataType = EstimateDataType(bankData, analysis.Entropy);

		// Detect potential code
		analysis.HasCode = DetectCodePatterns(bankData);

		// Detect potential graphics
		analysis.HasGraphics = DetectGraphicsPatterns(bankData);

		// Detect potential text
		analysis.HasText = DetectTextPatterns(bankData);

		return analysis;
	}

	/// <summary>
	/// Calculate Shannon entropy of data.
	/// </summary>
	private static double CalculateEntropy(ReadOnlySpan<byte> data) {
		if (data.Length == 0) return 0;

		var frequencies = new int[256];
		foreach (byte b in data) {
			frequencies[b]++;
		}

		double entropy = 0;
		foreach (int count in frequencies) {
			if (count > 0) {
				double probability = (double)count / data.Length;
				entropy -= probability * Math.Log2(probability);
			}
		}

		return entropy;
	}

	/// <summary>
	/// Estimate data type based on byte patterns.
	/// </summary>
	private static DQ3rDataType EstimateDataType(ReadOnlySpan<byte> data, double entropy) {
		// High entropy often indicates compressed or encrypted data
		if (entropy > 7.5) return DQ3rDataType.Compressed;

		// Very low entropy often indicates padding or empty space
		if (entropy < 1.0) return DQ3rDataType.Unknown;

		// Medium-high entropy typical of code
		if (entropy > 5.0 && entropy < 7.0) return DQ3rDataType.Code;

		// Lower entropy typical of graphics (repetitive tile data)
		if (entropy < 4.0) return DQ3rDataType.Graphics;

		return DQ3rDataType.DataTables;
	}

	/// <summary>
	/// Detect 65816 code patterns.
	/// </summary>
	private static bool DetectCodePatterns(ReadOnlySpan<byte> data) {
		if (data.Length < 10) return false;

		// Look for common 65816 instruction patterns
		int codeScore = 0;

		// Common opcodes: JSR ($20), JSL ($22), RTS ($60), RTL ($6B), 
		// JMP ($4C), BRA ($80), BRL ($82), SEP ($E2), REP ($C2)
		ReadOnlySpan<byte> codeOpcodes = [0x20, 0x22, 0x60, 0x6b, 0x4c, 0x80, 0x82, 0xe2, 0xc2];

		for (int i = 0; i < Math.Min(1000, data.Length); i++) {
			if (codeOpcodes.Contains(data[i])) {
				codeScore++;
			}
		}

		// If >5% of bytes are common code opcodes, likely code
		return codeScore > Math.Min(1000, data.Length) * 0.05;
	}

	/// <summary>
	/// Detect graphics patterns (SNES tile data).
	/// </summary>
	private static bool DetectGraphicsPatterns(ReadOnlySpan<byte> data) {
		if (data.Length < 32) return false;

		// SNES 4bpp tiles are 32 bytes each with specific bit patterns
		// Look for repetitive 8-byte patterns (tile rows)
		int patternCount = 0;

		for (int i = 0; i < Math.Min(256, data.Length - 8); i += 8) {
			// Check if 8-byte pattern repeats nearby
			for (int j = i + 8; j < Math.Min(i + 64, data.Length - 8); j += 8) {
				bool match = true;
				for (int k = 0; k < 8 && match; k++) {
					if (data[i + k] != data[j + k]) match = false;
				}
				if (match) patternCount++;
			}
		}

		return patternCount > 3;
	}

	/// <summary>
	/// Detect text patterns (Japanese text encoding).
	/// </summary>
	private static bool DetectTextPatterns(ReadOnlySpan<byte> data) {
		if (data.Length < 10) return false;

		// Look for Japanese text encoding patterns
		// DQ3 uses custom encoding, but common control codes exist
		int textScore = 0;

		// Look for repeating patterns typical of dialog:
		// - Line breaks, page breaks
		// - Sequences of printable characters
		for (int i = 0; i < Math.Min(500, data.Length - 1); i++) {
			// Control codes typically in $F0-$FF range
			if (data[i] >= 0xf0 && data[i] <= 0xff) {
				textScore++;
			}

			// Text characters often in $00-$7F range with patterns
			if (data[i] < 0x80 && data[i + 1] < 0x80) {
				textScore++;
			}
		}

		return textScore > Math.Min(500, data.Length) * 0.1;
	}

	/// <summary>
	/// Classify data types across the ROM.
	/// </summary>
	private void ClassifyDataTypes(DQ3rAnalysisResult result) {
		// Use bank analysis to build region map
		foreach (var (bankNum, analysis) in BankAnalyses) {
			if (!analysis.IsValid) continue;

			var region = new DQ3rRomRegion {
				FileOffset = analysis.StartOffset,
				EndOffset = analysis.EndOffset,
				SnesAddress = DQ3rAddressTranslator.FormatSnesAddress(
					DQ3rAddressTranslator.FileToSnesAddress(analysis.StartOffset)),
				DataType = analysis.PredominantDataType,
				Confidence = 0.5 + (analysis.Entropy / 16.0), // Scale confidence by entropy certainty
				Description = $"Bank ${bankNum:x2} - {analysis.PredominantDataType}",
				Metadata = new Dictionary<string, object> {
					["entropy"] = analysis.Entropy,
					["hasCode"] = analysis.HasCode,
					["hasGraphics"] = analysis.HasGraphics,
					["hasText"] = analysis.HasText
				}
			};

			Regions.Add(region);
		}

		result.RegionCount = Regions.Count;
	}

	/// <summary>
	/// Detect code regions.
	/// </summary>
	private void DetectCodeRegions(DQ3rAnalysisResult result) {
		foreach (var analysis in BankAnalyses.Values.Where(a => a.HasCode)) {
			var codeRegion = new DQ3rCodeRegion {
				StartOffset = analysis.StartOffset,
				EndOffset = analysis.EndOffset,
				SnesStart = DQ3rAddressTranslator.FormatSnesAddress(
					DQ3rAddressTranslator.FileToSnesAddress(analysis.StartOffset)),
				SnesEnd = DQ3rAddressTranslator.FormatSnesAddress(
					DQ3rAddressTranslator.FileToSnesAddress(analysis.EndOffset)),
				AnalysisComplete = false
			};

			CodeRegions.Add(codeRegion);
		}

		result.CodeRegionCount = CodeRegions.Count;
	}

	/// <summary>
	/// Extract known data tables.
	/// </summary>
	private void ExtractKnownTables(DQ3rAnalysisResult result) {
		// Known table locations from previous analysis
		var knownTables = new List<(int offset, DQ3rTableType type, string name, int entrySize, int entryCount)> {
			// These would be filled from datamap.json or research
			// Example: (0x1a0000, DQ3rTableType.Monsters, "Monster Stats", 32, 256)
		};

		foreach (var (offset, tableType, name, entrySize, entryCount) in knownTables) {
			for (int i = 0; i < entryCount; i++) {
				int entryOffset = offset + (i * entrySize);
				if (entryOffset + entrySize > _effectiveRomSize) break;

				var entry = new DQ3rGameDataEntry {
					Id = i,
					Name = $"{name} #{i}",
					TableType = tableType,
					FileOffset = entryOffset,
					SnesAddress = DQ3rAddressTranslator.FormatSnesAddress(
						DQ3rAddressTranslator.FileToSnesAddress(entryOffset)),
					Size = entrySize
				};

				GameData.Add(entry);
			}
		}

		result.GameDataCount = GameData.Count;
	}

	/// <summary>
	/// Analyze text regions.
	/// </summary>
	private void AnalyzeTextRegions(DQ3rAnalysisResult result) {
		result.TextRegionCount = BankAnalyses.Values.Count(a => a.HasText);
	}

	/// <summary>
	/// Detect graphics regions.
	/// </summary>
	private void DetectGraphicsRegions(DQ3rAnalysisResult result) {
		result.GraphicsRegionCount = BankAnalyses.Values.Count(a => a.HasGraphics);
	}

	/// <summary>
	/// Compute MD5 hash of ROM.
	/// </summary>
	private string ComputeMd5() {
		var data = _smcHeaderSize > 0
			? _romData.AsSpan(_smcHeaderSize).ToArray()
			: _romData;
		return Convert.ToHexStringLower(MD5.HashData(data));
	}

	/// <summary>
	/// Compute SHA1 hash of ROM.
	/// </summary>
	private string ComputeSha1() {
		var data = _smcHeaderSize > 0
			? _romData.AsSpan(_smcHeaderSize).ToArray()
			: _romData;
		return Convert.ToHexStringLower(SHA1.HashData(data));
	}

	/// <summary>
	/// Read bytes from ROM at file offset.
	/// </summary>
	/// <param name="offset">File offset.</param>
	/// <param name="length">Number of bytes.</param>
	/// <returns>Byte span.</returns>
	public ReadOnlySpan<byte> ReadBytes(int offset, int length) {
		int actualOffset = offset + _smcHeaderSize;
		if (actualOffset + length > _romData.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset));
		}
		return _romData.AsSpan(actualOffset, length);
	}

	/// <summary>
	/// Read a 16-bit little-endian value.
	/// </summary>
	public ushort ReadUInt16(int offset) {
		var bytes = ReadBytes(offset, 2);
		return (ushort)(bytes[0] | (bytes[1] << 8));
	}

	/// <summary>
	/// Read a 24-bit little-endian value.
	/// </summary>
	public uint ReadUInt24(int offset) {
		var bytes = ReadBytes(offset, 3);
		return (uint)(bytes[0] | (bytes[1] << 8) | (bytes[2] << 16));
	}
}

/// <summary>
/// Bank analysis results.
/// </summary>
public class BankAnalysis {
	public int BankNumber { get; init; }
	public int StartOffset { get; init; }
	public int EndOffset { get; init; }
	public bool IsValid { get; init; }
	public double Entropy { get; set; }
	public double ZeroBytePercentage { get; set; }
	public double FfBytePercentage { get; set; }
	public DQ3rDataType PredominantDataType { get; set; } = DQ3rDataType.Unknown;
	public bool HasCode { get; set; }
	public bool HasGraphics { get; set; }
	public bool HasText { get; set; }

	public string GetSummary() =>
		$"Bank ${BankNumber:x2}: {PredominantDataType}, Entropy={Entropy:F2}, " +
		$"Code={HasCode}, Graphics={HasGraphics}, Text={HasText}";
}

/// <summary>
/// Analysis result summary.
/// </summary>
public class DQ3rAnalysisResult {
	public int RomSize { get; init; }
	public int EffectiveSize { get; init; }
	public bool HasSmcHeader { get; init; }
	public string Md5Hash { get; init; } = string.Empty;
	public string Sha1Hash { get; init; } = string.Empty;
	public int RegionCount { get; set; }
	public int CodeRegionCount { get; set; }
	public int GameDataCount { get; set; }
	public int TextRegionCount { get; set; }
	public int GraphicsRegionCount { get; set; }
	public Dictionary<int, string> BankStats { get; } = [];

	public override string ToString() {
		var sb = new StringBuilder();
		sb.AppendLine("=== DQ3r ROM Analysis Results ===");
		sb.AppendLine($"ROM Size: {RomSize:N0} bytes");
		sb.AppendLine($"Effective Size: {EffectiveSize:N0} bytes");
		sb.AppendLine($"SMC Header: {(HasSmcHeader ? "Yes (512 bytes)" : "No")}");
		sb.AppendLine($"MD5: {Md5Hash}");
		sb.AppendLine($"SHA1: {Sha1Hash}");
		sb.AppendLine($"Regions: {RegionCount}");
		sb.AppendLine($"Code Regions: {CodeRegionCount}");
		sb.AppendLine($"Graphics Regions: {GraphicsRegionCount}");
		sb.AppendLine($"Text Regions: {TextRegionCount}");
		sb.AppendLine($"Game Data Entries: {GameDataCount}");
		return sb.ToString();
	}
}
