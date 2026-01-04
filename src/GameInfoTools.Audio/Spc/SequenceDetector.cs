namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Detects and identifies SNES sound driver/sequence formats.
/// Different games use different sequence formats (N-SPC, Akao, Konami, etc.)
/// </summary>
public static class SequenceDetector {
	/// <summary>
	/// Common SNES sound driver signatures.
	/// </summary>
	public static readonly DriverSignature[] KnownDrivers = [
		new DriverSignature {
			Name = "N-SPC",
			Description = "Nintendo standard music driver (Super Mario World, Zelda, etc.)",
			Patterns = [
				[0xed, 0x00, 0x00, 0xba], // Common N-SPC initialization
				[0xcd, 0xef, 0xbd],       // Stack setup pattern
			]
		},
		new DriverSignature {
			Name = "Akao",
			Description = "Square's music driver (Final Fantasy IV-VI, Chrono Trigger)",
			Patterns = [
				[0x8f, 0x00, 0xf4, 0x8f], // Akao port initialization
			]
		},
		new DriverSignature {
			Name = "Konami SCC",
			Description = "Konami's sound driver (Castlevania, Contra III)",
			Patterns = [
				[0xe8, 0xff, 0xcd],       // Konami timing pattern
			]
		},
		new DriverSignature {
			Name = "Capcom",
			Description = "Capcom's sound driver (Mega Man X, Street Fighter II)",
			Patterns = [
				[0xc4, 0x00, 0x8f],       // Capcom init sequence
			]
		},
		new DriverSignature {
			Name = "Enix/Tri-Ace",
			Description = "Enix driver (Star Ocean, Tales of Phantasia)",
			Patterns = []
		},
		new DriverSignature {
			Name = "HAL Laboratory",
			Description = "HAL driver (Kirby Super Star)",
			Patterns = []
		}
	];

	/// <summary>
	/// Attempt to detect the sound driver used in an SPC file.
	/// </summary>
	public static DriverDetectionResult DetectDriver(SpcFile spc) {
		var result = new DriverDetectionResult {
			SpcFile = spc
		};

		// Check each known driver
		foreach (var driver in KnownDrivers) {
			var confidence = CalculateDriverConfidence(spc, driver);
			if (confidence > 0) {
				result.Candidates.Add(new DriverCandidate {
					Driver = driver,
					Confidence = confidence
				});
			}
		}

		// Sort by confidence
		result.Candidates = result.Candidates
			.OrderByDescending(c => c.Confidence)
			.ToList();

		if (result.Candidates.Count > 0 && result.Candidates[0].Confidence >= 0.8) {
			result.DetectedDriver = result.Candidates[0].Driver;
		}

		// Analyze sequence region
		result.SequenceAnalysis = AnalyzeSequenceRegion(spc);

		return result;
	}

	/// <summary>
	/// Analyze RAM for sequence data patterns.
	/// </summary>
	public static SequenceAnalysis AnalyzeSequenceRegion(SpcFile spc) {
		var analysis = new SequenceAnalysis();

		// Get sample data region (from directory)
		var sampleEnd = GetSampleDataEnd(spc);
		analysis.SampleDataEnd = sampleEnd;

		// Code typically starts at beginning of RAM
		// Sequence data is often after samples or in high RAM
		analysis.ProbableCodeRegion = (0x0000, Math.Min(spc.Dsp.DirectoryAddress, (ushort)0x0400));

		// Look for sequence-like patterns
		var sequencePatterns = FindSequencePatterns(spc.Ram, sampleEnd);
		analysis.SequencePatterns = sequencePatterns;

		// Estimate sequence region
		if (sequencePatterns.Count > 0) {
			analysis.ProbableSequenceStart = sequencePatterns.Min(p => p.Address);
			analysis.ProbableSequenceEnd = sequencePatterns.Max(p => p.Address + p.Length);
		}

		return analysis;
	}

	private static double CalculateDriverConfidence(SpcFile spc, DriverSignature driver) {
		if (driver.Patterns.Count == 0) return 0;

		int matches = 0;

		foreach (var pattern in driver.Patterns) {
			if (FindPattern(spc.Ram, pattern) >= 0) {
				matches++;
			}
		}

		return (double)matches / driver.Patterns.Count;
	}

	private static int FindPattern(byte[] data, byte[] pattern) {
		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			bool match = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					match = false;
					break;
				}
			}
			if (match) return i;
		}
		return -1;
	}

	private static int GetSampleDataEnd(SpcFile spc) {
		var samples = spc.ExtractSamples();
		if (samples.Count == 0) return spc.Dsp.DirectoryAddress;

		int maxEnd = 0;
		foreach (var sample in samples) {
			int end = sample.StartAddress + sample.Data.Length;
			if (end > maxEnd) maxEnd = end;
		}

		return maxEnd;
	}

	private static List<SequencePattern> FindSequencePatterns(byte[] ram, int searchStart) {
		var patterns = new List<SequencePattern>();

		// Look for common sequence command patterns
		// Most sequence formats use:
		// - Note commands: $00-$7F (note with duration)
		// - Rest commands: specific byte
		// - Control commands: $80-$FF (often with parameters)

		int consecutiveNotes = 0;
		int patternStart = searchStart;

		for (int i = searchStart; i < ram.Length - 1; i++) {
			byte b = ram[i];

			// Note-like value (musical range)
			if (b >= 0x10 && b <= 0x7f) {
				if (consecutiveNotes == 0) patternStart = i;
				consecutiveNotes++;
			} else {
				if (consecutiveNotes >= 8) {
					// Found a run of note-like bytes
					patterns.Add(new SequencePattern {
						Address = patternStart,
						Length = consecutiveNotes,
						Type = SequencePatternType.NoteSequence,
						Description = $"Possible note sequence ({consecutiveNotes} bytes)"
					});
				}
				consecutiveNotes = 0;
			}

			// Look for control sequence patterns (tempo, loop, etc.)
			if (b == 0x00 && i > searchStart) {
				// Possible end marker or rest
				patterns.Add(new SequencePattern {
					Address = i,
					Length = 1,
					Type = SequencePatternType.EndMarker,
					Description = "Possible end/rest marker"
				});
			}
		}

		// Deduplicate and filter by quality
		return patterns
			.Where(p => p.Type == SequencePatternType.NoteSequence || p.Length > 0)
			.OrderBy(p => p.Address)
			.Take(20) // Limit results
			.ToList();
	}
}

/// <summary>
/// Sound driver signature for detection.
/// </summary>
public class DriverSignature {
	public string Name { get; init; } = "";
	public string Description { get; init; } = "";
	public List<byte[]> Patterns { get; init; } = [];
}

/// <summary>
/// Result of driver detection.
/// </summary>
public class DriverDetectionResult {
	public SpcFile? SpcFile { get; set; }
	public DriverSignature? DetectedDriver { get; set; }
	public List<DriverCandidate> Candidates { get; set; } = [];
	public SequenceAnalysis? SequenceAnalysis { get; set; }

	public bool IsDriverDetected => DetectedDriver != null;

	public override string ToString() {
		var sb = new System.Text.StringBuilder();

		if (DetectedDriver != null) {
			sb.AppendLine($"Detected Driver: {DetectedDriver.Name}");
			sb.AppendLine($"  {DetectedDriver.Description}");
		} else {
			sb.AppendLine("Driver: Unknown");
		}

		if (Candidates.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("Candidates:");
			foreach (var c in Candidates) {
				sb.AppendLine($"  {c.Driver.Name}: {c.Confidence * 100:F0}% confidence");
			}
		}

		if (SequenceAnalysis != null) {
			sb.AppendLine();
			sb.AppendLine(SequenceAnalysis.ToString());
		}

		return sb.ToString();
	}
}

/// <summary>
/// Driver candidate with confidence score.
/// </summary>
public class DriverCandidate {
	public DriverSignature Driver { get; init; } = new();
	public double Confidence { get; init; }
}

/// <summary>
/// Analysis of sequence data region.
/// </summary>
public class SequenceAnalysis {
	public int SampleDataEnd { get; set; }
	public (int Start, int End) ProbableCodeRegion { get; set; }
	public int ProbableSequenceStart { get; set; }
	public int ProbableSequenceEnd { get; set; }
	public List<SequencePattern> SequencePatterns { get; set; } = [];

	public int EstimatedSequenceSize => ProbableSequenceEnd > ProbableSequenceStart
		? ProbableSequenceEnd - ProbableSequenceStart
		: 0;

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("Sequence Analysis:");
		sb.AppendLine($"  Sample data ends at: ${SampleDataEnd:X4}");
		sb.AppendLine($"  Probable code region: ${ProbableCodeRegion.Start:X4}-${ProbableCodeRegion.End:X4}");

		if (EstimatedSequenceSize > 0) {
			sb.AppendLine($"  Probable sequence: ${ProbableSequenceStart:X4}-${ProbableSequenceEnd:X4} ({EstimatedSequenceSize} bytes)");
		}

		if (SequencePatterns.Count > 0) {
			sb.AppendLine($"  Found {SequencePatterns.Count} patterns:");
			foreach (var p in SequencePatterns.Take(10)) {
				sb.AppendLine($"    ${p.Address:X4}: {p.Description}");
			}
		}

		return sb.ToString();
	}
}

/// <summary>
/// Detected sequence pattern.
/// </summary>
public class SequencePattern {
	public int Address { get; init; }
	public int Length { get; init; }
	public SequencePatternType Type { get; init; }
	public string Description { get; init; } = "";
}

/// <summary>
/// Types of sequence patterns.
/// </summary>
public enum SequencePatternType {
	Unknown,
	NoteSequence,
	ControlSequence,
	LoopMarker,
	EndMarker,
	TempoChange,
	Instrument
}
