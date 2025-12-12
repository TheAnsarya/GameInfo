using GameInfoTools.Core;

namespace GameInfoTools.Analysis;

/// <summary>
/// Provides side-by-side comparison functionality for two CDL files.
/// </summary>
public class CdlComparison {
	private readonly CdlHeatmap _left;
	private readonly CdlHeatmap _right;

	/// <summary>
	/// Type of difference between two CDL entries.
	/// </summary>
	public enum DiffType {
		/// <summary>No difference - both have same flags.</summary>
		Same,
		/// <summary>Left has coverage, right does not.</summary>
		LeftOnly,
		/// <summary>Right has coverage, left does not.</summary>
		RightOnly,
		/// <summary>Both have coverage but with different flags.</summary>
		FlagsDiffer,
		/// <summary>Both are uncovered.</summary>
		BothUncovered
	}

	/// <summary>
	/// Information about a single byte difference.
	/// </summary>
	public record DiffEntry(
		int Offset,
		CdlHeatmap.CdlFlags LeftFlags,
		CdlHeatmap.CdlFlags RightFlags,
		DiffType Type
	) {
		public string OffsetHex => $"${Offset:X6}";
		public string LeftFlagsString => LeftFlags == CdlHeatmap.CdlFlags.None ? "(none)" : LeftFlags.ToString();
		public string RightFlagsString => RightFlags == CdlHeatmap.CdlFlags.None ? "(none)" : RightFlags.ToString();
	}

	/// <summary>
	/// A contiguous region of differences.
	/// </summary>
	public record DiffRegion(
		int StartOffset,
		int EndOffset,
		DiffType PrimaryType,
		int Count
	) {
		public string StartHex => $"${StartOffset:X6}";
		public string EndHex => $"${EndOffset:X6}";
		public int Length => EndOffset - StartOffset;
	}

	/// <summary>
	/// Summary statistics for a CDL comparison.
	/// </summary>
	public record ComparisonSummary(
		int TotalBytes,
		int SameBytes,
		int LeftOnlyBytes,
		int RightOnlyBytes,
		int FlagsDifferBytes,
		int BothUncoveredBytes,
		double SimilarityPercentage
	);

	/// <summary>
	/// Creates a comparison between two CDL heatmaps.
	/// </summary>
	public CdlComparison(CdlHeatmap left, CdlHeatmap right) {
		_left = left ?? throw new ArgumentNullException(nameof(left));
		_right = right ?? throw new ArgumentNullException(nameof(right));
	}

	/// <summary>
	/// Gets the left (baseline) CDL.
	/// </summary>
	public CdlHeatmap Left => _left;

	/// <summary>
	/// Gets the right (comparison) CDL.
	/// </summary>
	public CdlHeatmap Right => _right;

	/// <summary>
	/// Gets the minimum size of both CDL files.
	/// </summary>
	public int CommonSize => Math.Min(_left.Size, _right.Size);

	/// <summary>
	/// Gets the maximum size of both CDL files.
	/// </summary>
	public int MaxSize => Math.Max(_left.Size, _right.Size);

	/// <summary>
	/// Gets the difference type for a specific offset.
	/// </summary>
	public DiffType GetDiffType(int offset) {
		var leftFlags = offset < _left.Size ? _left.GetFlags(offset) : CdlHeatmap.CdlFlags.None;
		var rightFlags = offset < _right.Size ? _right.GetFlags(offset) : CdlHeatmap.CdlFlags.None;

		if (leftFlags == rightFlags) {
			return leftFlags == CdlHeatmap.CdlFlags.None ? DiffType.BothUncovered : DiffType.Same;
		}

		if (leftFlags == CdlHeatmap.CdlFlags.None) {
			return DiffType.RightOnly;
		}

		if (rightFlags == CdlHeatmap.CdlFlags.None) {
			return DiffType.LeftOnly;
		}

		return DiffType.FlagsDiffer;
	}

	/// <summary>
	/// Gets all differences between the two CDL files.
	/// </summary>
	public List<DiffEntry> GetAllDifferences() {
		var diffs = new List<DiffEntry>();
		int size = MaxSize;

		for (int i = 0; i < size; i++) {
			var leftFlags = i < _left.Size ? _left.GetFlags(i) : CdlHeatmap.CdlFlags.None;
			var rightFlags = i < _right.Size ? _right.GetFlags(i) : CdlHeatmap.CdlFlags.None;

			if (leftFlags != rightFlags) {
				var diffType = GetDiffType(i);
				diffs.Add(new DiffEntry(i, leftFlags, rightFlags, diffType));
			}
		}

		return diffs;
	}

	/// <summary>
	/// Gets differences of a specific type.
	/// </summary>
	public List<DiffEntry> GetDifferencesByType(DiffType type) {
		return GetAllDifferences().Where(d => d.Type == type).ToList();
	}

	/// <summary>
	/// Gets differences within a specific offset range.
	/// </summary>
	public List<DiffEntry> GetDifferencesInRange(int startOffset, int endOffset) {
		return GetAllDifferences()
			.Where(d => d.Offset >= startOffset && d.Offset < endOffset)
			.ToList();
	}

	/// <summary>
	/// Groups differences into contiguous regions.
	/// </summary>
	public List<DiffRegion> GetDiffRegions(int mergeGap = 1) {
		var diffs = GetAllDifferences();
		if (diffs.Count == 0) {
			return new List<DiffRegion>();
		}

		var regions = new List<DiffRegion>();
		int regionStart = diffs[0].Offset;
		int regionEnd = diffs[0].Offset;
		DiffType regionType = diffs[0].Type;
		int count = 1;

		for (int i = 1; i < diffs.Count; i++) {
			var diff = diffs[i];

			// If close enough and same type, extend region
			if (diff.Offset <= regionEnd + mergeGap && diff.Type == regionType) {
				regionEnd = diff.Offset;
				count++;
			} else {
				// Save current region and start new one
				regions.Add(new DiffRegion(regionStart, regionEnd + 1, regionType, count));
				regionStart = diff.Offset;
				regionEnd = diff.Offset;
				regionType = diff.Type;
				count = 1;
			}
		}

		// Add final region
		regions.Add(new DiffRegion(regionStart, regionEnd + 1, regionType, count));

		return regions;
	}

	/// <summary>
	/// Gets a summary of the comparison.
	/// </summary>
	public ComparisonSummary GetSummary() {
		int total = MaxSize;
		int same = 0;
		int leftOnly = 0;
		int rightOnly = 0;
		int flagsDiffer = 0;
		int bothUncovered = 0;

		for (int i = 0; i < total; i++) {
			var diffType = GetDiffType(i);
			switch (diffType) {
				case DiffType.Same: same++; break;
				case DiffType.LeftOnly: leftOnly++; break;
				case DiffType.RightOnly: rightOnly++; break;
				case DiffType.FlagsDiffer: flagsDiffer++; break;
				case DiffType.BothUncovered: bothUncovered++; break;
			}
		}

		double similarity = total > 0 ? (same * 100.0 / total) : 100.0;

		return new ComparisonSummary(total, same, leftOnly, rightOnly, flagsDiffer, bothUncovered, similarity);
	}

	/// <summary>
	/// Gets bytes that are only covered in the left CDL.
	/// </summary>
	public List<int> GetLeftOnlyOffsets() {
		return GetDifferencesByType(DiffType.LeftOnly).Select(d => d.Offset).ToList();
	}

	/// <summary>
	/// Gets bytes that are only covered in the right CDL.
	/// </summary>
	public List<int> GetRightOnlyOffsets() {
		return GetDifferencesByType(DiffType.RightOnly).Select(d => d.Offset).ToList();
	}

	/// <summary>
	/// Creates a merged CDL with coverage from both files.
	/// </summary>
	public CdlHeatmap CreateMerged() {
		int size = MaxSize;
		var data = new byte[size];

		for (int i = 0; i < size; i++) {
			var leftFlags = i < _left.Size ? (byte)_left.GetFlags(i) : (byte)0;
			var rightFlags = i < _right.Size ? (byte)_right.GetFlags(i) : (byte)0;
			data[i] = (byte)(leftFlags | rightFlags);
		}

		return new CdlHeatmap(data);
	}

	/// <summary>
	/// Creates a CDL with only the differences (where they differ, keep left).
	/// </summary>
	public CdlHeatmap CreateDifferencesOnly() {
		int size = MaxSize;
		var data = new byte[size];

		for (int i = 0; i < size; i++) {
			var leftFlags = i < _left.Size ? (byte)_left.GetFlags(i) : (byte)0;
			var rightFlags = i < _right.Size ? (byte)_right.GetFlags(i) : (byte)0;

			if (leftFlags != rightFlags) {
				data[i] = leftFlags;
			}
		}

		return new CdlHeatmap(data);
	}

	/// <summary>
	/// Creates a CDL with only the intersection (coverage in both).
	/// </summary>
	public CdlHeatmap CreateIntersection() {
		int size = CommonSize;
		var data = new byte[size];

		for (int i = 0; i < size; i++) {
			var leftFlags = (byte)_left.GetFlags(i);
			var rightFlags = (byte)_right.GetFlags(i);
			data[i] = (byte)(leftFlags & rightFlags);
		}

		return new CdlHeatmap(data);
	}

	/// <summary>
	/// Gets the comparison entry for a specific offset.
	/// </summary>
	public DiffEntry GetEntryAt(int offset) {
		var leftFlags = offset < _left.Size ? _left.GetFlags(offset) : CdlHeatmap.CdlFlags.None;
		var rightFlags = offset < _right.Size ? _right.GetFlags(offset) : CdlHeatmap.CdlFlags.None;
		var diffType = GetDiffType(offset);
		return new DiffEntry(offset, leftFlags, rightFlags, diffType);
	}

	/// <summary>
	/// Gets entries for a range, including same entries.
	/// </summary>
	public List<DiffEntry> GetRangeEntries(int startOffset, int endOffset) {
		var entries = new List<DiffEntry>();
		int start = Math.Max(0, startOffset);
		int end = Math.Min(MaxSize, endOffset);

		for (int i = start; i < end; i++) {
			entries.Add(GetEntryAt(i));
		}

		return entries;
	}

	/// <summary>
	/// Finds the next difference starting from a given offset.
	/// </summary>
	public int? FindNextDifference(int fromOffset, bool wrap = true) {
		// Search forward from offset
		for (int i = fromOffset + 1; i < MaxSize; i++) {
			var leftFlags = i < _left.Size ? _left.GetFlags(i) : CdlHeatmap.CdlFlags.None;
			var rightFlags = i < _right.Size ? _right.GetFlags(i) : CdlHeatmap.CdlFlags.None;
			if (leftFlags != rightFlags) {
				return i;
			}
		}

		// Wrap around if enabled
		if (wrap) {
			for (int i = 0; i <= fromOffset; i++) {
				var leftFlags = i < _left.Size ? _left.GetFlags(i) : CdlHeatmap.CdlFlags.None;
				var rightFlags = i < _right.Size ? _right.GetFlags(i) : CdlHeatmap.CdlFlags.None;
				if (leftFlags != rightFlags) {
					return i;
				}
			}
		}

		return null;
	}

	/// <summary>
	/// Finds the previous difference starting from a given offset.
	/// </summary>
	public int? FindPreviousDifference(int fromOffset, bool wrap = true) {
		// Search backward from offset
		for (int i = fromOffset - 1; i >= 0; i--) {
			var leftFlags = i < _left.Size ? _left.GetFlags(i) : CdlHeatmap.CdlFlags.None;
			var rightFlags = i < _right.Size ? _right.GetFlags(i) : CdlHeatmap.CdlFlags.None;
			if (leftFlags != rightFlags) {
				return i;
			}
		}

		// Wrap around if enabled
		if (wrap) {
			for (int i = MaxSize - 1; i >= fromOffset; i--) {
				var leftFlags = i < _left.Size ? _left.GetFlags(i) : CdlHeatmap.CdlFlags.None;
				var rightFlags = i < _right.Size ? _right.GetFlags(i) : CdlHeatmap.CdlFlags.None;
				if (leftFlags != rightFlags) {
					return i;
				}
			}
		}

		return null;
	}

	/// <summary>
	/// Gets statistics about code/data coverage differences.
	/// </summary>
	public (int leftCodeOnly, int rightCodeOnly, int leftDataOnly, int rightDataOnly) GetCoverageTypeDiffs() {
		int leftCodeOnly = 0;
		int rightCodeOnly = 0;
		int leftDataOnly = 0;
		int rightDataOnly = 0;

		for (int i = 0; i < CommonSize; i++) {
			var leftFlags = _left.GetFlags(i);
			var rightFlags = _right.GetFlags(i);

			bool leftCode = (leftFlags & CdlHeatmap.CdlFlags.Code) != 0;
			bool rightCode = (rightFlags & CdlHeatmap.CdlFlags.Code) != 0;
			bool leftData = (leftFlags & CdlHeatmap.CdlFlags.Data) != 0;
			bool rightData = (rightFlags & CdlHeatmap.CdlFlags.Data) != 0;

			if (leftCode && !rightCode) leftCodeOnly++;
			if (rightCode && !leftCode) rightCodeOnly++;
			if (leftData && !rightData) leftDataOnly++;
			if (rightData && !leftData) rightDataOnly++;
		}

		return (leftCodeOnly, rightCodeOnly, leftDataOnly, rightDataOnly);
	}
}
