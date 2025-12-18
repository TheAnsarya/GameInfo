using GameInfoTools.Analysis;

namespace GameInfoTools.Tests.Analysis;

/// <summary>
/// Tests for CdlMerger.
/// </summary>
public class CdlMergerTests {
	[Fact]
	public void Constructor_Default_CreatesInstance() {
		var merger = new CdlMerger();
		Assert.NotNull(merger);
	}

	[Fact]
	public void Constructor_WithConfig_AppliesSettings() {
		var config = new CdlMerger.MergeConfig {
			Priority = CdlMerger.MergePriority.CodeOverData,
			TrackConflicts = true
		};
		var merger = new CdlMerger(config);
		Assert.NotNull(merger);
	}

	[Fact]
	public void Merge_IdenticalFiles_NoChanges() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var cdl2 = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var result = merger.Merge(cdl1, cdl2);

		Assert.True(result.Success);
		Assert.Equal(0, result.BytesModified);
		Assert.Equal(cdl1, result.MergedData);
	}

	[Fact]
	public void Merge_DifferentSizes_Fails() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x02, 0x03 };
		var cdl2 = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var result = merger.Merge(cdl1, cdl2);

		Assert.False(result.Success);
		Assert.Contains("mismatch", result.Errors[0].ToLower());
	}

	[Fact]
	public void Merge_UnionPriority_CombinesFlags() {
		var config = new CdlMerger.MergeConfig { Priority = CdlMerger.MergePriority.Union };
		var merger = new CdlMerger(config);
		var cdl1 = new byte[] { 0x01, 0x00, 0x01 }; // Code, None, Code
		var cdl2 = new byte[] { 0x00, 0x02, 0x02 }; // None, Data, Data

		var result = merger.Merge(cdl1, cdl2);

		Assert.True(result.Success);
		Assert.Equal(0x01, result.MergedData[0]); // Code
		Assert.Equal(0x02, result.MergedData[1]); // Data
		Assert.Equal(0x03, result.MergedData[2]); // Code | Data
	}

	[Fact]
	public void Merge_FirstWinsPriority_KeepsFirstNonZero() {
		var config = new CdlMerger.MergeConfig { Priority = CdlMerger.MergePriority.FirstWins };
		var merger = new CdlMerger(config);
		var cdl1 = new byte[] { 0x01, 0x00, 0x01 };
		var cdl2 = new byte[] { 0x02, 0x02, 0x02 };

		var result = merger.Merge(cdl1, cdl2);

		Assert.True(result.Success);
		Assert.Equal(0x01, result.MergedData[0]); // First wins
		Assert.Equal(0x02, result.MergedData[1]); // First was 0, use second
		Assert.Equal(0x01, result.MergedData[2]); // First wins
	}

	[Fact]
	public void Merge_SecondWinsPriority_KeepsSecondNonZero() {
		var config = new CdlMerger.MergeConfig { Priority = CdlMerger.MergePriority.SecondWins };
		var merger = new CdlMerger(config);
		var cdl1 = new byte[] { 0x01, 0x01, 0x00 };
		var cdl2 = new byte[] { 0x02, 0x00, 0x02 };

		var result = merger.Merge(cdl1, cdl2);

		Assert.True(result.Success);
		Assert.Equal(0x02, result.MergedData[0]); // Second wins
		Assert.Equal(0x01, result.MergedData[1]); // Second was 0, use first
		Assert.Equal(0x02, result.MergedData[2]); // Second wins
	}

	[Fact]
	public void Merge_TracksConflicts() {
		var config = new CdlMerger.MergeConfig {
			Priority = CdlMerger.MergePriority.Union,
			TrackConflicts = true,
			CodeDataIsConflict = true
		};
		var merger = new CdlMerger(config);
		var cdl1 = new byte[] { 0x01, 0x01 }; // Code
		var cdl2 = new byte[] { 0x02, 0x01 }; // Data, Code

		var result = merger.Merge(cdl1, cdl2);

		Assert.True(result.Success);
		Assert.Equal(1, result.ConflictCount);
	}

	[Fact]
	public void Merge_ReportsCoverage() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x00, 0x00, 0x00 }; // 25% coverage
		var cdl2 = new byte[] { 0x00, 0x02, 0x00, 0x00 }; // 25% coverage

		var result = merger.Merge(cdl1, cdl2);

		Assert.Equal(25.0, result.PreMergeCoverage.File1);
		Assert.Equal(25.0, result.PreMergeCoverage.File2);
		Assert.Equal(50.0, result.PostMergeCoverage);
	}

	[Fact]
	public void MergeMultiple_EmptyList_Fails() {
		var merger = new CdlMerger();
		var result = merger.MergeMultiple([]);

		Assert.False(result.Success);
	}

	[Fact]
	public void MergeMultiple_SingleFile_ReturnsSameData() {
		var merger = new CdlMerger();
		var cdl = new byte[] { 0x01, 0x02, 0x03 };

		var result = merger.MergeMultiple([cdl]);

		Assert.True(result.Success);
		Assert.Equal(cdl, result.MergedData);
	}

	[Fact]
	public void MergeMultiple_ThreeFiles_CombinesAll() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x00, 0x00 };
		var cdl2 = new byte[] { 0x00, 0x02, 0x00 };
		var cdl3 = new byte[] { 0x00, 0x00, 0x04 };

		var result = merger.MergeMultiple([cdl1, cdl2, cdl3]);

		Assert.True(result.Success);
		Assert.Equal(0x01, result.MergedData[0]);
		Assert.Equal(0x02, result.MergedData[1]);
		Assert.Equal(0x04, result.MergedData[2]);
	}

	[Fact]
	public void Validate_EmptyData_ReturnsZeroCoverage() {
		var merger = new CdlMerger();
		var result = merger.Validate([]);

		Assert.True(result.IsValid);
		Assert.Equal(0, result.TotalBytes);
		Assert.Equal(0.0, result.CoveragePercent);
	}

	[Fact]
	public void Validate_AllCode_Returns100Coverage() {
		var merger = new CdlMerger();
		var cdl = new byte[] { 0x01, 0x01, 0x01, 0x01 };

		var result = merger.Validate(cdl);

		Assert.True(result.IsValid);
		Assert.Equal(4, result.CodeBytes);
		Assert.Equal(0, result.DataBytes);
		Assert.Equal(100.0, result.CoveragePercent);
	}

	[Fact]
	public void Validate_MixedData_CalculatesCorrectly() {
		var merger = new CdlMerger();
		var cdl = new byte[] { 0x01, 0x02, 0x00, 0x00 }; // Code, Data, None, None

		var result = merger.Validate(cdl);

		Assert.Equal(1, result.CodeBytes);
		Assert.Equal(1, result.DataBytes);
		Assert.Equal(2, result.UnloggedBytes);
		Assert.Equal(50.0, result.CoveragePercent);
	}

	[Fact]
	public void Validate_DetectsCodeDataConflict() {
		var merger = new CdlMerger();
		var cdl = new byte[] { 0x03 }; // Code | Data = conflict

		var result = merger.Validate(cdl);

		Assert.Contains(result.Issues, i =>
			i.Type == CdlMerger.ValidationIssueType.CodeDataConflict);
	}

	[Fact]
	public void Validate_DetectsCoverageGaps() {
		var merger = new CdlMerger();
		var cdl = new byte[32];
		cdl[0] = 0x01; // Code at start
		// Bytes 1-31 are all 0 (unlogged)

		var result = merger.Validate(cdl, minGapSize: 16);

		Assert.NotEmpty(result.CoverageGaps);
	}

	[Fact]
	public void Validate_SizeMismatch_ReportsIssue() {
		var merger = new CdlMerger();
		var cdl = new byte[100];

		var result = merger.Validate(cdl, expectedSize: 200);

		Assert.Contains(result.Issues, i =>
			i.Type == CdlMerger.ValidationIssueType.SizeMismatch);
	}

	[Fact]
	public void Compare_IdenticalFiles_NoDifferences() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x02, 0x03 };
		var cdl2 = new byte[] { 0x01, 0x02, 0x03 };

		var diffs = merger.Compare(cdl1, cdl2);

		Assert.Empty(diffs);
	}

	[Fact]
	public void Compare_DifferentFiles_FindsDifferences() {
		var merger = new CdlMerger();
		var cdl1 = new byte[] { 0x01, 0x02, 0x03 };
		var cdl2 = new byte[] { 0x01, 0xFF, 0x03 };

		var diffs = merger.Compare(cdl1, cdl2);

		Assert.Single(diffs);
		Assert.Equal(1, diffs[0].Offset);
		Assert.Equal(CdlMerger.CdlFlags.Data, diffs[0].Flags1);
	}

	[Fact]
	public void ExportCoverageReport_ReturnsValidJson() {
		var merger = new CdlMerger();
		var cdl = new byte[] { 0x01, 0x02, 0x00, 0x01 };

		var json = merger.ExportCoverageReport(cdl, bankSize: 4);

		Assert.Contains("summary", json);
		Assert.Contains("banks", json);
		Assert.Contains("coveragePercent", json);
	}

	[Fact]
	public void DetectFormat_MesenHeader_ReturnsMesen() {
		var data = new byte[] { (byte)'C', (byte)'D', (byte)'L', 0x01, 0x00, 0x00 };

		var format = CdlMerger.DetectFormat(data);

		Assert.Equal(CdlMerger.CdlFormat.Mesen, format);
	}

	[Fact]
	public void DetectFormat_RawNesSize_ReturnsFceux() {
		var data = new byte[0x8000]; // 32KB = common NES size

		var format = CdlMerger.DetectFormat(data);

		Assert.Equal(CdlMerger.CdlFormat.Fceux, format);
	}

	[Fact]
	public void ConvertFormat_FceuxToMesen_AddsHeader() {
		var fceux = new byte[] { 0x01, 0x02, 0x03 };

		var mesen = CdlMerger.ConvertFormat(fceux, CdlMerger.CdlFormat.Fceux, CdlMerger.CdlFormat.Mesen);

		Assert.Equal((byte)'C', mesen[0]);
		Assert.Equal((byte)'D', mesen[1]);
		Assert.Equal((byte)'L', mesen[2]);
		Assert.Equal(0x01, mesen[3]);
		Assert.Equal(0x01, mesen[4]); // Original data
	}

	[Fact]
	public void ConvertFormat_MesenToFceux_RemovesHeader() {
		var mesen = new byte[] { (byte)'C', (byte)'D', (byte)'L', 0x01, 0x01, 0x02, 0x03 };

		var fceux = CdlMerger.ConvertFormat(mesen, CdlMerger.CdlFormat.Mesen, CdlMerger.CdlFormat.Fceux);

		Assert.Equal(3, fceux.Length);
		Assert.Equal(0x01, fceux[0]);
	}

	[Fact]
	public void ConvertFormat_SameFormat_ReturnsSameData() {
		var data = new byte[] { 0x01, 0x02, 0x03 };

		var result = CdlMerger.ConvertFormat(data, CdlMerger.CdlFormat.Fceux, CdlMerger.CdlFormat.Fceux);

		Assert.Equal(data, result);
	}
}
