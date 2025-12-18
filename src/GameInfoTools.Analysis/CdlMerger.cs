using System.Text;
using System.Text.Json;

namespace GameInfoTools.Analysis;

/// <summary>
/// CDL (Code/Data Log) file merging and validation utilities.
/// Merge multiple CDL files from different play sessions, validate coverage,
/// and detect conflicts.
/// </summary>
/// <remarks>
/// C# equivalent of:
/// - tools/debug/cdl_coverage.py (coverage analysis)
/// - tools/debug/cdl_editor.py (CDL editing)
/// - tools/debug/cdl_build.py (CDL build/merge)
/// </remarks>
public class CdlMerger {
	/// <summary>
	/// CDL format types supported by different emulators.
	/// </summary>
	public enum CdlFormat {
		/// <summary>FCEUX CDL format (NES).</summary>
		Fceux,
		/// <summary>Mesen CDL format (NES/SNES/GB/GBA).</summary>
		Mesen,
		/// <summary>bsnes CDL format (SNES).</summary>
		Bsnes,
		/// <summary>Auto-detect format.</summary>
		Auto
	}

	/// <summary>
	/// Merge priority when conflicts occur.
	/// </summary>
	public enum MergePriority {
		/// <summary>Union of all flags from both files.</summary>
		Union,
		/// <summary>Code classification takes priority over data.</summary>
		CodeOverData,
		/// <summary>Data classification takes priority over code.</summary>
		DataOverCode,
		/// <summary>Newer file wins (by modification time).</summary>
		NewerWins,
		/// <summary>First file wins.</summary>
		FirstWins,
		/// <summary>Second file wins.</summary>
		SecondWins
	}

	/// <summary>
	/// CDL byte classification flags (FCEUX format).
	/// </summary>
	[Flags]
	public enum CdlFlags : byte {
		/// <summary>Not logged.</summary>
		None = 0x00,
		/// <summary>Executed as code.</summary>
		Code = 0x01,
		/// <summary>Read as data.</summary>
		Data = 0x02,
		/// <summary>PCM audio data.</summary>
		PcmData = 0x04,
		/// <summary>Subroutine entry point.</summary>
		SubEntryPoint = 0x08,
		/// <summary>Used as external operand.</summary>
		ExternalOperand = 0x10,
		/// <summary>Indirect code access.</summary>
		IndirectCode = 0x20,
		/// <summary>Indirect data access.</summary>
		IndirectData = 0x40,
		/// <summary>CHR data drawn to screen.</summary>
		DrawnToScreen = 0x80
	}

	/// <summary>
	/// Merge conflict information.
	/// </summary>
	public record MergeConflict(
		int Offset,
		CdlFlags File1Flags,
		CdlFlags File2Flags,
		CdlFlags ResolvedFlags,
		string Description
	);

	/// <summary>
	/// Merge operation result.
	/// </summary>
	public record MergeResult {
		/// <summary>Whether merge succeeded.</summary>
		public bool Success { get; init; }

		/// <summary>Merged CDL data.</summary>
		public byte[] MergedData { get; init; } = [];

		/// <summary>Number of bytes modified.</summary>
		public int BytesModified { get; init; }

		/// <summary>Number of conflicts detected.</summary>
		public int ConflictCount { get; init; }

		/// <summary>List of conflicts (if tracking enabled).</summary>
		public List<MergeConflict> Conflicts { get; init; } = [];

		/// <summary>Error messages.</summary>
		public List<string> Errors { get; init; } = [];

		/// <summary>Pre-merge coverage percentage.</summary>
		public (double File1, double File2) PreMergeCoverage { get; init; }

		/// <summary>Post-merge coverage percentage.</summary>
		public double PostMergeCoverage { get; init; }
	}

	/// <summary>
	/// Validation issue types.
	/// </summary>
	public enum ValidationIssueType {
		/// <summary>Same address marked as both code and data.</summary>
		CodeDataConflict,
		/// <summary>Gap in coverage (unlogged region).</summary>
		CoverageGap,
		/// <summary>Suspicious pattern detected.</summary>
		SuspiciousPattern,
		/// <summary>Entry point without code flag.</summary>
		OrphanEntryPoint,
		/// <summary>Invalid file format.</summary>
		InvalidFormat,
		/// <summary>Size mismatch with expected ROM size.</summary>
		SizeMismatch
	}

	/// <summary>
	/// Validation issue details.
	/// </summary>
	public record ValidationIssue(
		ValidationIssueType Type,
		int StartOffset,
		int EndOffset,
		string Description,
		string Suggestion
	);

	/// <summary>
	/// Validation result.
	/// </summary>
	public record ValidationResult {
		/// <summary>Whether CDL is valid.</summary>
		public bool IsValid { get; init; }

		/// <summary>Total bytes in CDL.</summary>
		public int TotalBytes { get; init; }

		/// <summary>Bytes logged as code.</summary>
		public int CodeBytes { get; init; }

		/// <summary>Bytes logged as data.</summary>
		public int DataBytes { get; init; }

		/// <summary>Bytes not logged.</summary>
		public int UnloggedBytes { get; init; }

		/// <summary>Coverage percentage (logged/total).</summary>
		public double CoveragePercent { get; init; }

		/// <summary>List of validation issues.</summary>
		public List<ValidationIssue> Issues { get; init; } = [];

		/// <summary>Coverage gaps.</summary>
		public List<(int Start, int End)> CoverageGaps { get; init; } = [];
	}

	/// <summary>
	/// Merge configuration.
	/// </summary>
	public record MergeConfig {
		/// <summary>Priority for resolving conflicts.</summary>
		public MergePriority Priority { get; init; } = MergePriority.Union;

		/// <summary>Track individual conflicts.</summary>
		public bool TrackConflicts { get; init; } = true;

		/// <summary>Maximum conflicts to track (0 = unlimited).</summary>
		public int MaxConflictsToTrack { get; init; } = 1000;

		/// <summary>Treat code+data as conflict.</summary>
		public bool CodeDataIsConflict { get; init; } = false;
	}

	private readonly MergeConfig _config;

	/// <summary>
	/// Create a new CDL merger with default configuration.
	/// </summary>
	public CdlMerger() : this(new MergeConfig()) { }

	/// <summary>
	/// Create a new CDL merger with specified configuration.
	/// </summary>
	/// <param name="config">Merge configuration.</param>
	public CdlMerger(MergeConfig config) {
		_config = config;
	}

	/// <summary>
	/// Merge two CDL files.
	/// </summary>
	/// <param name="cdl1">First CDL data.</param>
	/// <param name="cdl2">Second CDL data.</param>
	/// <returns>Merge result with combined CDL data.</returns>
	public MergeResult Merge(byte[] cdl1, byte[] cdl2) {
		if (cdl1.Length != cdl2.Length) {
			return new MergeResult {
				Success = false,
				Errors = [$"CDL size mismatch: {cdl1.Length} vs {cdl2.Length}"]
			};
		}

		var merged = new byte[cdl1.Length];
		var conflicts = new List<MergeConflict>();
		int bytesModified = 0;

		for (int i = 0; i < cdl1.Length; i++) {
			var flags1 = (CdlFlags)cdl1[i];
			var flags2 = (CdlFlags)cdl2[i];

			if (flags1 == flags2) {
				merged[i] = cdl1[i];
				continue;
			}

			bytesModified++;
			var resolved = ResolveConflict(flags1, flags2, out bool isConflict);
			merged[i] = (byte)resolved;

			if (isConflict && _config.TrackConflicts &&
				(_config.MaxConflictsToTrack == 0 || conflicts.Count < _config.MaxConflictsToTrack)) {
				conflicts.Add(new MergeConflict(
					i,
					flags1,
					flags2,
					resolved,
					DescribeConflict(flags1, flags2)
				));
			}
		}

		return new MergeResult {
			Success = true,
			MergedData = merged,
			BytesModified = bytesModified,
			ConflictCount = conflicts.Count,
			Conflicts = conflicts,
			PreMergeCoverage = (CalculateCoverage(cdl1), CalculateCoverage(cdl2)),
			PostMergeCoverage = CalculateCoverage(merged)
		};
	}

	/// <summary>
	/// Merge multiple CDL files.
	/// </summary>
	/// <param name="cdlFiles">Collection of CDL data arrays.</param>
	/// <returns>Merge result with combined CDL data.</returns>
	public MergeResult MergeMultiple(IEnumerable<byte[]> cdlFiles) {
		var files = cdlFiles.ToList();
		if (files.Count == 0) {
			return new MergeResult {
				Success = false,
				Errors = ["No CDL files provided"]
			};
		}

		if (files.Count == 1) {
			return new MergeResult {
				Success = true,
				MergedData = files[0],
				BytesModified = 0,
				PostMergeCoverage = CalculateCoverage(files[0])
			};
		}

		var result = Merge(files[0], files[1]);
		if (!result.Success) return result;

		for (int i = 2; i < files.Count; i++) {
			result = Merge(result.MergedData, files[i]);
			if (!result.Success) return result;
		}

		return result;
	}

	/// <summary>
	/// Merge CDL files from file paths.
	/// </summary>
	/// <param name="filePaths">Paths to CDL files.</param>
	/// <param name="outputPath">Output path for merged CDL.</param>
	/// <returns>Merge result.</returns>
	public MergeResult MergeFiles(IEnumerable<string> filePaths, string outputPath) {
		try {
			var cdlFiles = filePaths.Select(File.ReadAllBytes).ToList();
			var result = MergeMultiple(cdlFiles);

			if (result.Success) {
				File.WriteAllBytes(outputPath, result.MergedData);
			}

			return result;
		} catch (Exception ex) {
			return new MergeResult {
				Success = false,
				Errors = [$"Error merging files: {ex.Message}"]
			};
		}
	}

	/// <summary>
	/// Validate a CDL file for consistency and coverage.
	/// </summary>
	/// <param name="cdlData">CDL data to validate.</param>
	/// <param name="expectedSize">Expected ROM size (0 to skip check).</param>
	/// <param name="minGapSize">Minimum gap size to report.</param>
	/// <returns>Validation result.</returns>
	public ValidationResult Validate(byte[] cdlData, int expectedSize = 0, int minGapSize = 16) {
		var issues = new List<ValidationIssue>();
		var gaps = new List<(int Start, int End)>();

		int codeBytes = 0;
		int dataBytes = 0;
		int unloggedBytes = 0;

		// Check size
		if (expectedSize > 0 && cdlData.Length != expectedSize) {
			issues.Add(new ValidationIssue(
				ValidationIssueType.SizeMismatch,
				0, cdlData.Length,
				$"CDL size {cdlData.Length} does not match expected ROM size {expectedSize}",
				"Verify ROM and CDL are for the same game version"
			));
		}

		// Analyze each byte
		int gapStart = -1;
		for (int i = 0; i < cdlData.Length; i++) {
			var flags = (CdlFlags)cdlData[i];

			// Count classifications
			bool hasCode = flags.HasFlag(CdlFlags.Code);
			bool hasData = flags.HasFlag(CdlFlags.Data);

			if (hasCode) codeBytes++;
			if (hasData) dataBytes++;
			if (flags == CdlFlags.None) unloggedBytes++;

			// Check for code+data conflicts
			if (hasCode && hasData) {
				issues.Add(new ValidationIssue(
					ValidationIssueType.CodeDataConflict,
					i, i,
					$"Address ${i:x6} marked as both code and data",
					"Review this address in debugger to determine actual usage"
				));
			}

			// Track coverage gaps
			if (flags == CdlFlags.None) {
				if (gapStart < 0) gapStart = i;
			} else {
				if (gapStart >= 0) {
					int gapSize = i - gapStart;
					if (gapSize >= minGapSize) {
						gaps.Add((gapStart, i - 1));
					}
					gapStart = -1;
				}
			}

			// Check for orphan entry points
			if (flags.HasFlag(CdlFlags.SubEntryPoint) && !flags.HasFlag(CdlFlags.Code)) {
				issues.Add(new ValidationIssue(
					ValidationIssueType.OrphanEntryPoint,
					i, i,
					$"Address ${i:x6} marked as entry point but not as code",
					"Entry points should typically be marked as code"
				));
			}
		}

		// Final gap at end
		if (gapStart >= 0 && cdlData.Length - gapStart >= minGapSize) {
			gaps.Add((gapStart, cdlData.Length - 1));
		}

		// Add gap issues
		foreach (var (start, end) in gaps.Take(10)) {
			issues.Add(new ValidationIssue(
				ValidationIssueType.CoverageGap,
				start, end,
				$"Unlogged region ${start:x6}-${end:x6} ({end - start + 1} bytes)",
				"Play through more of the game or use trace logging"
			));
		}

		double coverage = cdlData.Length > 0
			? (double)(codeBytes + dataBytes) / cdlData.Length * 100
			: 0;

		return new ValidationResult {
			IsValid = issues.All(i => i.Type != ValidationIssueType.InvalidFormat),
			TotalBytes = cdlData.Length,
			CodeBytes = codeBytes,
			DataBytes = dataBytes,
			UnloggedBytes = unloggedBytes,
			CoveragePercent = coverage,
			Issues = issues,
			CoverageGaps = gaps
		};
	}

	/// <summary>
	/// Compare two CDL files and return differences.
	/// </summary>
	/// <param name="cdl1">First CDL data.</param>
	/// <param name="cdl2">Second CDL data.</param>
	/// <returns>List of differences.</returns>
	public List<(int Offset, CdlFlags Flags1, CdlFlags Flags2)> Compare(byte[] cdl1, byte[] cdl2) {
		var differences = new List<(int Offset, CdlFlags Flags1, CdlFlags Flags2)>();
		int length = Math.Min(cdl1.Length, cdl2.Length);

		for (int i = 0; i < length; i++) {
			if (cdl1[i] != cdl2[i]) {
				differences.Add((i, (CdlFlags)cdl1[i], (CdlFlags)cdl2[i]));
			}
		}

		return differences;
	}

	/// <summary>
	/// Export CDL coverage report as JSON.
	/// </summary>
	/// <param name="cdlData">CDL data.</param>
	/// <param name="bankSize">Bank size for breakdown (default 16KB).</param>
	/// <returns>JSON coverage report.</returns>
	public string ExportCoverageReport(byte[] cdlData, int bankSize = 0x4000) {
		var validation = Validate(cdlData);
		var bankCount = (cdlData.Length + bankSize - 1) / bankSize;
		var banks = new List<object>();

		for (int b = 0; b < bankCount; b++) {
			int start = b * bankSize;
			int end = Math.Min(start + bankSize, cdlData.Length);
			int bankCode = 0, bankData = 0, bankUnlogged = 0;

			for (int i = start; i < end; i++) {
				var flags = (CdlFlags)cdlData[i];
				if (flags.HasFlag(CdlFlags.Code)) bankCode++;
				if (flags.HasFlag(CdlFlags.Data)) bankData++;
				if (flags == CdlFlags.None) bankUnlogged++;
			}

			banks.Add(new {
				bank = b,
				startOffset = start,
				endOffset = end - 1,
				codeBytes = bankCode,
				dataBytes = bankData,
				unloggedBytes = bankUnlogged,
				coveragePercent = (double)(bankCode + bankData) / (end - start) * 100
			});
		}

		var report = new {
			summary = new {
				totalBytes = validation.TotalBytes,
				codeBytes = validation.CodeBytes,
				dataBytes = validation.DataBytes,
				unloggedBytes = validation.UnloggedBytes,
				coveragePercent = validation.CoveragePercent,
				issueCount = validation.Issues.Count,
				gapCount = validation.CoverageGaps.Count
			},
			banks,
			issues = validation.Issues.Select(i => new {
				type = i.Type.ToString(),
				start = i.StartOffset,
				end = i.EndOffset,
				description = i.Description
			}),
			gaps = validation.CoverageGaps.Select(g => new {
				start = g.Start,
				end = g.End,
				size = g.End - g.Start + 1
			})
		};

		return JsonSerializer.Serialize(report, new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		});
	}

	/// <summary>
	/// Detect CDL format from file data.
	/// </summary>
	/// <param name="data">CDL file data.</param>
	/// <returns>Detected format.</returns>
	public static CdlFormat DetectFormat(byte[] data) {
		// Check for Mesen format header
		if (data.Length >= 4) {
			string header = Encoding.ASCII.GetString(data, 0, 4);
			if (header == "CDL\x01") return CdlFormat.Mesen;
		}

		// FCEUX CDL files are just raw bytes, no header
		// Check if size matches common NES ROM sizes
		if (data.Length == 0x8000 || data.Length == 0x10000 ||
			data.Length == 0x20000 || data.Length == 0x40000) {
			return CdlFormat.Fceux;
		}

		return CdlFormat.Auto;
	}

	/// <summary>
	/// Convert CDL between formats.
	/// </summary>
	/// <param name="data">Source CDL data.</param>
	/// <param name="sourceFormat">Source format.</param>
	/// <param name="targetFormat">Target format.</param>
	/// <returns>Converted CDL data.</returns>
	public static byte[] ConvertFormat(byte[] data, CdlFormat sourceFormat, CdlFormat targetFormat) {
		if (sourceFormat == targetFormat) return data;

		// Extract raw CDL bytes
		byte[] rawCdl = sourceFormat switch {
			CdlFormat.Mesen when data.Length > 4 && Encoding.ASCII.GetString(data, 0, 4) == "CDL\x01"
				=> data[4..],
			_ => data
		};

		// Convert to target format
		return targetFormat switch {
			CdlFormat.Mesen => [.. Encoding.ASCII.GetBytes("CDL\x01"), .. rawCdl],
			CdlFormat.Fceux => rawCdl,
			_ => rawCdl
		};
	}

	private CdlFlags ResolveConflict(CdlFlags flags1, CdlFlags flags2, out bool isConflict) {
		isConflict = false;

		// Check for code vs data conflict
		bool code1 = flags1.HasFlag(CdlFlags.Code);
		bool data1 = flags1.HasFlag(CdlFlags.Data);
		bool code2 = flags2.HasFlag(CdlFlags.Code);
		bool data2 = flags2.HasFlag(CdlFlags.Data);

		if (_config.CodeDataIsConflict && ((code1 && data2) || (data1 && code2))) {
			isConflict = true;
		}

		return _config.Priority switch {
			MergePriority.Union => flags1 | flags2,
			MergePriority.CodeOverData => (code1 || code2)
				? (flags1 | flags2) & ~CdlFlags.Data | (code1 ? CdlFlags.Code : CdlFlags.None)
				: flags1 | flags2,
			MergePriority.DataOverCode => (data1 || data2)
				? (flags1 | flags2) & ~CdlFlags.Code | (data1 ? CdlFlags.Data : CdlFlags.None)
				: flags1 | flags2,
			MergePriority.FirstWins => flags1 != CdlFlags.None ? flags1 : flags2,
			MergePriority.SecondWins => flags2 != CdlFlags.None ? flags2 : flags1,
			_ => flags1 | flags2
		};
	}

	private static string DescribeConflict(CdlFlags flags1, CdlFlags flags2) {
		var parts = new List<string>();

		if (flags1.HasFlag(CdlFlags.Code) && flags2.HasFlag(CdlFlags.Data)) {
			parts.Add("File1=Code, File2=Data");
		} else if (flags1.HasFlag(CdlFlags.Data) && flags2.HasFlag(CdlFlags.Code)) {
			parts.Add("File1=Data, File2=Code");
		} else {
			parts.Add($"File1={flags1}, File2={flags2}");
		}

		return string.Join("; ", parts);
	}

	private static double CalculateCoverage(byte[] cdlData) {
		if (cdlData.Length == 0) return 0;

		int logged = 0;
		foreach (byte b in cdlData) {
			if (b != 0) logged++;
		}

		return (double)logged / cdlData.Length * 100;
	}
}
