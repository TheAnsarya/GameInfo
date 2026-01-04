using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SpcMemoryInspectorTests {
	[Fact]
	public void GetMemoryMap_ReturnsValidMap() {
		var spc = CreateMinimalSpc();
		var inspector = new SpcMemoryInspector(spc);

		var map = inspector.GetMemoryMap();

		Assert.NotNull(map);
		Assert.True(map.Regions.Count > 0);
		Assert.Equal(SpcFile.RamSize, map.TotalRam);
	}

	[Fact]
	public void GetMemoryMap_IncludesSampleDirectory() {
		var spc = CreateMinimalSpc();
		var inspector = new SpcMemoryInspector(spc);

		var map = inspector.GetMemoryMap();

		Assert.Contains(map.Regions, r => r.Type == RegionType.SampleDirectory);
	}

	[Fact]
	public void GetMemoryMap_IncludesReservedRegion() {
		var spc = CreateMinimalSpc();
		var inspector = new SpcMemoryInspector(spc);

		var map = inspector.GetMemoryMap();

		Assert.Contains(map.Regions, r => r.Type == RegionType.Reserved);
	}

	[Fact]
	public void HexDump_FormatsCorrectly() {
		var spc = CreateMinimalSpc();
		spc.Ram[0x100] = 0x41; // 'A'
		spc.Ram[0x101] = 0x42; // 'B'
		spc.Ram[0x102] = 0x43; // 'C'
		var inspector = new SpcMemoryInspector(spc);

		var dump = inspector.HexDump(0x100, 16);

		Assert.Contains("0100:", dump);
		Assert.Contains("41 42 43", dump);
		Assert.Contains("ABC", dump);
	}

	[Fact]
	public void HexDump_NonPrintableCharsShowAsDot() {
		var spc = CreateMinimalSpc();
		spc.Ram[0x100] = 0x00; // Non-printable
		spc.Ram[0x101] = 0x1f; // Non-printable
		var inspector = new SpcMemoryInspector(spc);

		var dump = inspector.HexDump(0x100, 16);

		Assert.Contains("..", dump);
	}

	[Fact]
	public void FindPattern_FindsExactMatch() {
		var spc = CreateMinimalSpc();
		spc.Ram[0x1000] = 0xDE;
		spc.Ram[0x1001] = 0xAD;
		spc.Ram[0x1002] = 0xBE;
		spc.Ram[0x1003] = 0xEF;
		var inspector = new SpcMemoryInspector(spc);

		var results = inspector.FindPattern([0xDE, 0xAD, 0xBE, 0xEF]);

		Assert.Contains(0x1000, results);
	}

	[Fact]
	public void FindPattern_ReturnsEmptyForNoMatch() {
		var spc = CreateMinimalSpc();
		var inspector = new SpcMemoryInspector(spc);

		var results = inspector.FindPattern([0xDE, 0xAD, 0xBE, 0xEF]);

		Assert.DoesNotContain(0x1000, results);
	}

	[Fact]
	public void FindPattern_FindsMultipleMatches() {
		var spc = CreateMinimalSpc();
		spc.Ram[0x1000] = 0xAB;
		spc.Ram[0x1001] = 0xCD;
		spc.Ram[0x2000] = 0xAB;
		spc.Ram[0x2001] = 0xCD;
		var inspector = new SpcMemoryInspector(spc);

		var results = inspector.FindPattern([0xAB, 0xCD]);

		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void FindPointersTo_FindsPointer() {
		var spc = CreateMinimalSpc();
		// Store pointer to $3456 at address $1000
		spc.Ram[0x1000] = 0x56; // Low byte
		spc.Ram[0x1001] = 0x34; // High byte
		var inspector = new SpcMemoryInspector(spc);

		var results = inspector.FindPointersTo(0x3456);

		Assert.Contains(0x1000, results);
	}

	[Fact]
	public void ReadWord_ReadsLittleEndian() {
		var spc = CreateMinimalSpc();
		spc.Ram[0x1000] = 0xCD; // Low
		spc.Ram[0x1001] = 0xAB; // High
		var inspector = new SpcMemoryInspector(spc);

		var value = inspector.ReadWord(0x1000);

		Assert.Equal(0xABCD, value);
	}

	[Fact]
	public void AnalyzeRange_CalculatesEntropy() {
		var spc = CreateMinimalSpc();
		// Fill with uniform data (should have entropy ~8)
		for (int i = 0; i < 256; i++) {
			spc.Ram[0x1000 + i] = (byte)i;
		}
		var inspector = new SpcMemoryInspector(spc);

		var analysis = inspector.AnalyzeRange(0x1000, 256);

		Assert.True(analysis.Entropy > 7.0); // High entropy for uniform distribution
	}

	[Fact]
	public void AnalyzeRange_DetectsSparseData() {
		var spc = CreateMinimalSpc();
		// Already zero-filled = sparse
		var inspector = new SpcMemoryInspector(spc);

		var analysis = inspector.AnalyzeRange(0x5000, 256);

		Assert.Equal(DataType.Sparse, analysis.ProbableType);
	}

	[Fact]
	public void AnalyzeRange_FindsMostCommonBytes() {
		var spc = CreateMinimalSpc();
		// Fill with mostly 0x00 and some 0xFF
		for (int i = 0; i < 100; i++) {
			spc.Ram[0x1000 + i] = 0x00;
		}
		for (int i = 100; i < 150; i++) {
			spc.Ram[0x1000 + i] = 0xFF;
		}
		var inspector = new SpcMemoryInspector(spc);

		var analysis = inspector.AnalyzeRange(0x1000, 150);

		Assert.True(analysis.MostCommonBytes.Count > 0);
		Assert.Equal(0x00, analysis.MostCommonBytes[0].Byte);
	}

	[Fact]
	public void GetDspSummary_FormatsCorrectly() {
		var spc = CreateMinimalSpc();
		spc.Dsp.Data[0x0c] = 127; // Main volume L
		spc.Dsp.Data[0x1c] = 127; // Main volume R
		var inspector = new SpcMemoryInspector(spc);

		var summary = inspector.GetDspSummary();

		Assert.Contains("Main Volume", summary);
		Assert.Contains("127", summary);
	}

	[Fact]
	public void MemoryMap_ToString_IncludesAllSections() {
		var spc = CreateMinimalSpc();
		var inspector = new SpcMemoryInspector(spc);

		var map = inspector.GetMemoryMap();
		var output = map.ToString();

		Assert.Contains("Memory Map", output);
		Assert.Contains("Summary", output);
	}

	[Fact]
	public void MemoryRegion_Size_CalculatesCorrectly() {
		var region = new MemoryRegion {
			Start = 0x1000,
			End = 0x2000,
			Type = RegionType.SampleData,
			Name = "Test"
		};

		Assert.Equal(0x1000, region.Size);
	}

	[Fact]
	public void DataPatternAnalysis_ToString_FormatsCorrectly() {
		var analysis = new DataPatternAnalysis {
			Start = 0x1000,
			Length = 0x100,
			Entropy = 5.5,
			ProbableType = DataType.SequenceData
		};

		var output = analysis.ToString();

		Assert.Contains("1000", output);
		Assert.Contains("5.5", output);
		Assert.Contains("SequenceData", output);
	}

	private static SpcFile CreateMinimalSpc() {
		var spc = new SpcFile();
		spc.Header.HasId666 = true;
		spc.Dsp.Data[0x5d] = 0x02; // Directory at $0200
		return spc;
	}
}
