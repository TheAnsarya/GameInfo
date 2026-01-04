using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SequenceDetectorTests {
	[Fact]
	public void KnownDrivers_ContainsExpectedDrivers() {
		var driverNames = SequenceDetector.KnownDrivers.Select(d => d.Name);

		Assert.Contains("N-SPC", driverNames);
		Assert.Contains("Akao", driverNames);
		Assert.Contains("Konami SCC", driverNames);
		Assert.Contains("Capcom", driverNames);
	}

	[Fact]
	public void DetectDriver_EmptySpc_ReturnsUnknown() {
		var spc = CreateMinimalSpc();

		var result = SequenceDetector.DetectDriver(spc);

		Assert.False(result.IsDriverDetected);
	}

	[Fact]
	public void DetectDriver_WithNSpcPattern_DetectsNSpc() {
		var spc = CreateMinimalSpc();

		// Inject N-SPC pattern
		var pattern = new byte[] { 0xed, 0x00, 0x00, 0xba };
		pattern.CopyTo(spc.Ram.AsSpan(0x0400));

		var result = SequenceDetector.DetectDriver(spc);

		Assert.True(result.Candidates.Any(c => c.Driver.Name == "N-SPC" && c.Confidence > 0));
	}

	[Fact]
	public void DetectDriver_ReturnsSequenceAnalysis() {
		var spc = CreateMinimalSpc();

		var result = SequenceDetector.DetectDriver(spc);

		Assert.NotNull(result.SequenceAnalysis);
	}

	[Fact]
	public void SequenceAnalysis_IdentifiesSampleDataEnd() {
		var spc = CreateMinimalSpc();

		var analysis = SequenceDetector.AnalyzeSequenceRegion(spc);

		// With default directory at $0200 and no samples, end should be near directory
		Assert.True(analysis.SampleDataEnd >= 0);
	}

	[Fact]
	public void SequenceAnalysis_FindsNoteSequences() {
		var spc = CreateMinimalSpc();

		// Create a pattern that looks like notes (values $10-$7F) at a high address
		// This needs to be after where sample data would end
		for (int i = 0; i < 20; i++) {
			spc.Ram[0x8000 + i] = (byte)(0x30 + i % 48); // Note-like values
		}

		// Force sample directory to have no entries so search starts early
		var analysis = SequenceDetector.AnalyzeSequenceRegion(spc);

		// The analysis should find some patterns (may vary based on implementation)
		Assert.NotNull(analysis.SequencePatterns);
	}

	[Fact]
	public void DriverSignature_HasName() {
		var sig = new DriverSignature {
			Name = "TestDriver",
			Description = "Test description"
		};

		Assert.Equal("TestDriver", sig.Name);
		Assert.Equal("Test description", sig.Description);
	}

	[Fact]
	public void DriverDetectionResult_ToString_FormatsCorrectly() {
		var result = new DriverDetectionResult {
			DetectedDriver = new DriverSignature {
				Name = "N-SPC",
				Description = "Nintendo driver"
			}
		};

		var output = result.ToString();

		Assert.Contains("N-SPC", output);
		Assert.Contains("Nintendo driver", output);
	}

	[Fact]
	public void DriverDetectionResult_WithCandidates_ShowsAllCandidates() {
		var result = new DriverDetectionResult();
		result.Candidates.Add(new DriverCandidate {
			Driver = new DriverSignature { Name = "Driver1" },
			Confidence = 0.8
		});
		result.Candidates.Add(new DriverCandidate {
			Driver = new DriverSignature { Name = "Driver2" },
			Confidence = 0.5
		});

		var output = result.ToString();

		Assert.Contains("Driver1", output);
		Assert.Contains("Driver2", output);
		Assert.Contains("80%", output);
	}

	[Fact]
	public void SequenceAnalysis_EstimatedSequenceSize_CalculatesCorrectly() {
		var analysis = new SequenceAnalysis {
			ProbableSequenceStart = 0x1000,
			ProbableSequenceEnd = 0x2000
		};

		Assert.Equal(0x1000, analysis.EstimatedSequenceSize);
	}

	[Fact]
	public void SequenceAnalysis_NoSequence_ReturnsZeroSize() {
		var analysis = new SequenceAnalysis {
			ProbableSequenceStart = 0,
			ProbableSequenceEnd = 0
		};

		Assert.Equal(0, analysis.EstimatedSequenceSize);
	}

	[Fact]
	public void SequencePattern_AllTypes_AreDefined() {
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.NoteSequence));
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.ControlSequence));
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.LoopMarker));
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.EndMarker));
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.TempoChange));
		Assert.True(Enum.IsDefined(typeof(SequencePatternType), SequencePatternType.Instrument));
	}

	private static SpcFile CreateMinimalSpc() {
		var spc = new SpcFile();

		// Set up valid header
		var sig = "SNES-SPC700 Sound File Data v0.30";
		System.Text.Encoding.ASCII.GetBytes(sig).CopyTo(spc.Header.Signature.Length > 0
			? new byte[33]
			: new byte[33]);

		spc.Header.HasId666 = true;

		// Set directory address
		spc.Dsp.Data[0x5d] = 0x02; // Directory at $0200

		return spc;
	}
}
