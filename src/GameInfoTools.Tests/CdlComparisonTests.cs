using GameInfoTools.Analysis;
using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CDL comparison functionality.
/// </summary>
public class CdlComparisonTests {

	private static byte[] CreateTestCdlData(int size, bool hasCode = true, bool hasData = true) {
		var data = new byte[size];

		// Quarter layout:
		// 0-25%: code only
		// 25-50%: data only
		// 50-75%: mixed code+data
		// 75-100%: uncovered
		int quarter = size / 4;

		if (hasCode) {
			for (int i = 0; i < quarter; i++) {
				data[i] = 0x01; // Code flag
			}
		}

		if (hasData) {
			for (int i = quarter; i < quarter * 2; i++) {
				data[i] = 0x02; // Data flag
			}
		}

		// Mixed region
		if (hasCode || hasData) {
			for (int i = quarter * 2; i < quarter * 3; i++) {
				if (hasCode && hasData) {
					data[i] = (byte)(i % 2 == 0 ? 0x01 : 0x02);
				} else if (hasCode) {
					data[i] = 0x01;
				} else if (hasData) {
					data[i] = 0x02;
				}
			}
		}

		return data;
	}

	private static byte[] CreateCdlWithPattern(int size, byte pattern) {
		var data = new byte[size];
		for (int i = 0; i < size; i++) {
			data[i] = pattern;
		}

		return data;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidHeatmaps_CreatesInstance() {
		var leftData = CreateTestCdlData(0x4000);
		var rightData = CreateTestCdlData(0x4000);
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		Assert.NotNull(comparison);
		Assert.Equal(left, comparison.Left);
		Assert.Equal(right, comparison.Right);
	}

	[Fact]
	public void Constructor_WithNullLeft_ThrowsArgumentNullException() {
		var rightData = CreateTestCdlData(0x4000);
		var right = new CdlHeatmap(rightData);

		Assert.Throws<ArgumentNullException>(() => new CdlComparison(null!, right));
	}

	[Fact]
	public void Constructor_WithNullRight_ThrowsArgumentNullException() {
		var leftData = CreateTestCdlData(0x4000);
		var left = new CdlHeatmap(leftData);

		Assert.Throws<ArgumentNullException>(() => new CdlComparison(left, null!));
	}

	#endregion

	#region Size Tests

	[Fact]
	public void CommonSize_ReturnsSmallerSize() {
		var left = new CdlHeatmap(new byte[0x4000]);
		var right = new CdlHeatmap(new byte[0x2000]);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(0x2000, comparison.CommonSize);
	}

	[Fact]
	public void MaxSize_ReturnsLargerSize() {
		var left = new CdlHeatmap(new byte[0x4000]);
		var right = new CdlHeatmap(new byte[0x2000]);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(0x4000, comparison.MaxSize);
	}

	#endregion

	#region GetDiffType Tests

	[Fact]
	public void GetDiffType_SameFlags_ReturnsSame() {
		var data = CreateCdlWithPattern(0x1000, 0x01);
		var left = new CdlHeatmap(data);
		var right = new CdlHeatmap((byte[])data.Clone());

		var comparison = new CdlComparison(left, right);

		Assert.Equal(CdlComparison.DiffType.Same, comparison.GetDiffType(0));
	}

	[Fact]
	public void GetDiffType_BothUncovered_ReturnsBothUncovered() {
		var left = new CdlHeatmap(new byte[0x1000]);
		var right = new CdlHeatmap(new byte[0x1000]);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(CdlComparison.DiffType.BothUncovered, comparison.GetDiffType(0));
	}

	[Fact]
	public void GetDiffType_LeftHasCoverage_ReturnsLeftOnly() {
		var leftData = CreateCdlWithPattern(0x1000, 0x01);
		var rightData = new byte[0x1000];
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(CdlComparison.DiffType.LeftOnly, comparison.GetDiffType(0));
	}

	[Fact]
	public void GetDiffType_RightHasCoverage_ReturnsRightOnly() {
		var leftData = new byte[0x1000];
		var rightData = CreateCdlWithPattern(0x1000, 0x01);
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(CdlComparison.DiffType.RightOnly, comparison.GetDiffType(0));
	}

	[Fact]
	public void GetDiffType_DifferentFlags_ReturnsFlagsDiffer() {
		var leftData = CreateCdlWithPattern(0x1000, 0x01); // Code
		var rightData = CreateCdlWithPattern(0x1000, 0x02); // Data
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		Assert.Equal(CdlComparison.DiffType.FlagsDiffer, comparison.GetDiffType(0));
	}

	#endregion

	#region GetAllDifferences Tests

	[Fact]
	public void GetAllDifferences_IdenticalFiles_ReturnsEmpty() {
		var data = CreateTestCdlData(0x1000);
		var left = new CdlHeatmap(data);
		var right = new CdlHeatmap((byte[])data.Clone());

		var comparison = new CdlComparison(left, right);

		var diffs = comparison.GetAllDifferences();

		Assert.Empty(diffs);
	}

	[Fact]
	public void GetAllDifferences_AllDifferent_ReturnsAllOffsets() {
		var leftData = CreateCdlWithPattern(0x100, 0x01);
		var rightData = CreateCdlWithPattern(0x100, 0x02);
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		var diffs = comparison.GetAllDifferences();

		Assert.Equal(0x100, diffs.Count);
	}

	#endregion

	#region GetDifferencesByType Tests

	[Fact]
	public void GetDifferencesByType_LeftOnly_ReturnsOnlyLeftOnlyDiffs() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// First half: left has coverage
		for (int i = 0; i < 0x80; i++) {
			leftData[i] = 0x01;
		}

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var diffs = comparison.GetDifferencesByType(CdlComparison.DiffType.LeftOnly);

		Assert.Equal(0x80, diffs.Count);
		Assert.All(diffs, d => Assert.Equal(CdlComparison.DiffType.LeftOnly, d.Type));
	}

	#endregion

	#region GetDifferencesInRange Tests

	[Fact]
	public void GetDifferencesInRange_ReturnsOnlyDiffsInRange() {
		var leftData = CreateCdlWithPattern(0x1000, 0x01);
		var rightData = CreateCdlWithPattern(0x1000, 0x02);
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		var diffs = comparison.GetDifferencesInRange(0x100, 0x200);

		Assert.Equal(0x100, diffs.Count);
		Assert.All(diffs, d => {
			Assert.True(d.Offset >= 0x100);
			Assert.True(d.Offset < 0x200);
		});
	}

	#endregion

	#region GetDiffRegions Tests

	[Fact]
	public void GetDiffRegions_ContiguousDiffs_ReturnsSingleRegion() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// Contiguous difference region
		for (int i = 0x20; i < 0x40; i++) {
			leftData[i] = 0x01;
		}

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var regions = comparison.GetDiffRegions();

		Assert.Single(regions);
		Assert.Equal(0x20, regions[0].StartOffset);
		Assert.Equal(0x40, regions[0].EndOffset);
	}

	[Fact]
	public void GetDiffRegions_SeparateRegions_ReturnsMultipleRegions() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// Two separate regions
		for (int i = 0x10; i < 0x20; i++) leftData[i] = 0x01;
		for (int i = 0x40; i < 0x50; i++) leftData[i] = 0x01;

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var regions = comparison.GetDiffRegions();

		Assert.Equal(2, regions.Count);
	}

	#endregion

	#region GetSummary Tests

	[Fact]
	public void GetSummary_FullyCoveredIdenticalFiles_Returns100PercentSimilarity() {
		// Create fully covered CDL data (no uncovered section)
		var data = CreateCdlWithPattern(0x1000, 0x01);
		var left = new CdlHeatmap(data);
		var right = new CdlHeatmap((byte[])data.Clone());

		var comparison = new CdlComparison(left, right);

		var summary = comparison.GetSummary();

		Assert.Equal(100.0, summary.SimilarityPercentage);
		Assert.Equal(0, summary.LeftOnlyBytes);
		Assert.Equal(0, summary.RightOnlyBytes);
	}

	[Fact]
	public void GetSummary_PartiallyUncovered_SimilarityExcludesUncovered() {
		// Data with 75% covered, 25% uncovered
		var data = CreateTestCdlData(0x1000);
		var left = new CdlHeatmap(data);
		var right = new CdlHeatmap((byte[])data.Clone());

		var comparison = new CdlComparison(left, right);

		var summary = comparison.GetSummary();

		// Similarity only counts covered+same, not bothUncovered
		Assert.Equal(75.0, summary.SimilarityPercentage);
		Assert.Equal(0, summary.LeftOnlyBytes);
		Assert.Equal(0, summary.RightOnlyBytes);
	}

	[Fact]
	public void GetSummary_CompletelyDifferent_ReturnsCorrectCounts() {
		var leftData = CreateCdlWithPattern(0x100, 0x01);
		var rightData = new byte[0x100];
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		var summary = comparison.GetSummary();

		Assert.Equal(0x100, summary.LeftOnlyBytes);
		Assert.Equal(0, summary.RightOnlyBytes);
		Assert.Equal(0, summary.SameBytes);
	}

	#endregion

	#region CreateMerged Tests

	[Fact]
	public void CreateMerged_CombinesCoverage() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// Left covers first half
		for (int i = 0; i < 0x80; i++) leftData[i] = 0x01;
		// Right covers second half
		for (int i = 0x80; i < 0x100; i++) rightData[i] = 0x02;

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var merged = comparison.CreateMerged();

		// Should have coverage in both halves
		Assert.NotEqual(CdlHeatmap.CdlFlags.None, merged.GetFlags(0x00));
		Assert.NotEqual(CdlHeatmap.CdlFlags.None, merged.GetFlags(0x80));
	}

	[Fact]
	public void CreateMerged_CombinesFlags_OR() {
		var leftData = CreateCdlWithPattern(0x100, 0x01); // Code
		var rightData = CreateCdlWithPattern(0x100, 0x02); // Data
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		var merged = comparison.CreateMerged();

		// Should have both code and data flags
		var flags = merged.GetFlags(0);
		Assert.True((flags & CdlHeatmap.CdlFlags.Code) != 0);
		Assert.True((flags & CdlHeatmap.CdlFlags.Data) != 0);
	}

	#endregion

	#region CreateIntersection Tests

	[Fact]
	public void CreateIntersection_KeepsOnlyCommon() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// Only middle section common
		for (int i = 0; i < 0x80; i++) leftData[i] = 0x01;
		for (int i = 0x40; i < 0xc0; i++) rightData[i] = 0x01;

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var intersection = comparison.CreateIntersection();

		// Only 0x40-0x80 should have coverage
		Assert.Equal(CdlHeatmap.CdlFlags.None, intersection.GetFlags(0x20));
		Assert.NotEqual(CdlHeatmap.CdlFlags.None, intersection.GetFlags(0x50));
		Assert.Equal(CdlHeatmap.CdlFlags.None, intersection.GetFlags(0x90));
	}

	#endregion

	#region CreateDifferencesOnly Tests

	[Fact]
	public void CreateDifferencesOnly_KeepsOnlyDiffs() {
		var leftData = CreateCdlWithPattern(0x100, 0x01);
		var rightData = (byte[])leftData.Clone();

		// Make some differences
		for (int i = 0x20; i < 0x40; i++) {
			leftData[i] = 0x02; // Different from right
		}

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var diffsOnly = comparison.CreateDifferencesOnly();

		// Should only have coverage where different
		Assert.Equal(CdlHeatmap.CdlFlags.None, diffsOnly.GetFlags(0x00)); // Same
		Assert.NotEqual(CdlHeatmap.CdlFlags.None, diffsOnly.GetFlags(0x30)); // Different
	}

	#endregion

	#region FindNextDifference Tests

	[Fact]
	public void FindNextDifference_WithDiffs_ReturnsNextOffset() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		leftData[0x50] = 0x01; // Difference at 0x50

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var next = comparison.FindNextDifference(0x00);

		Assert.Equal(0x50, next);
	}

	[Fact]
	public void FindNextDifference_NoMoreDiffs_ReturnsNull() {
		var data = CreateTestCdlData(0x100);
		var left = new CdlHeatmap(data);
		var right = new CdlHeatmap((byte[])data.Clone());

		var comparison = new CdlComparison(left, right);

		var next = comparison.FindNextDifference(0, wrap: false);

		Assert.Null(next);
	}

	[Fact]
	public void FindNextDifference_Wrap_WrapsToBeginning() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		leftData[0x10] = 0x01; // Difference near start

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var next = comparison.FindNextDifference(0x80, wrap: true);

		Assert.Equal(0x10, next);
	}

	#endregion

	#region FindPreviousDifference Tests

	[Fact]
	public void FindPreviousDifference_WithDiffs_ReturnsPreviousOffset() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		leftData[0x30] = 0x01; // Difference at 0x30

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var prev = comparison.FindPreviousDifference(0x80);

		Assert.Equal(0x30, prev);
	}

	#endregion

	#region GetRangeEntries Tests

	[Fact]
	public void GetRangeEntries_ReturnsEntriesForAllOffsetsInRange() {
		var leftData = CreateTestCdlData(0x100);
		var rightData = CreateTestCdlData(0x100);
		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);

		var comparison = new CdlComparison(left, right);

		var entries = comparison.GetRangeEntries(0x10, 0x20);

		Assert.Equal(0x10, entries.Count);
	}

	#endregion

	#region GetCoverageTypeDiffs Tests

	[Fact]
	public void GetCoverageTypeDiffs_ReturnsCorrectCounts() {
		var leftData = new byte[0x100];
		var rightData = new byte[0x100];

		// Left has code at 0x00-0x20, right doesn't
		for (int i = 0; i < 0x20; i++) leftData[i] = 0x01;

		// Right has data at 0x80-0xa0, left doesn't
		for (int i = 0x80; i < 0xa0; i++) rightData[i] = 0x02;

		var left = new CdlHeatmap(leftData);
		var right = new CdlHeatmap(rightData);
		var comparison = new CdlComparison(left, right);

		var (leftCodeOnly, rightCodeOnly, leftDataOnly, rightDataOnly) = comparison.GetCoverageTypeDiffs();

		Assert.Equal(0x20, leftCodeOnly);
		Assert.Equal(0, rightCodeOnly);
		Assert.Equal(0, leftDataOnly);
		Assert.Equal(0x20, rightDataOnly);
	}

	#endregion

	#region DiffEntry Record Tests

	[Fact]
	public void DiffEntry_OffsetHex_FormatsCorrectly() {
		var entry = new CdlComparison.DiffEntry(
			0x1234,
			CdlHeatmap.CdlFlags.Code,
			CdlHeatmap.CdlFlags.None,
			CdlComparison.DiffType.LeftOnly
		);

		Assert.Equal("$001234", entry.OffsetHex);
	}

	#endregion

	#region DiffRegion Record Tests

	[Fact]
	public void DiffRegion_Length_CalculatesCorrectly() {
		var region = new CdlComparison.DiffRegion(
			0x100,
			0x200,
			CdlComparison.DiffType.LeftOnly,
			256
		);

		Assert.Equal(0x100, region.Length);
	}

	#endregion
}
