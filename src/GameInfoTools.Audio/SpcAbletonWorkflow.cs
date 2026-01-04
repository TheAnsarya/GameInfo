using GameInfoTools.Audio.Ableton;
using GameInfoTools.Audio.Brr;
using GameInfoTools.Audio.Spc;
using GameInfoTools.Audio.Wav;

namespace GameInfoTools.Audio;

/// <summary>
/// High-level workflow for converting between SPC files and Ableton Live projects.
/// </summary>
public class SpcAbletonWorkflow {
	/// <summary>
	/// Extract an SPC file to an Ableton Live project with WAV samples.
	/// </summary>
	/// <param name="spcPath">Path to the SPC file.</param>
	/// <param name="outputDir">Output directory for the Ableton project.</param>
	/// <param name="projectName">Name for the project (optional).</param>
	/// <returns>Path to the generated .als file.</returns>
	public static string SpcToAbleton(string spcPath, string outputDir, string? projectName = null) {
		// Load SPC
		var spc = SpcFile.Load(spcPath);

		projectName ??= Path.GetFileNameWithoutExtension(spcPath);
		var alsPath = Path.Combine(outputDir, $"{projectName}.als");

		// Create project generator
		var generator = AbletonProjectGenerator.CreateSnesProject(
			projectName,
			EstimateTempo(spc)
		);

		// Extract and convert samples
		var brrSamples = spc.ExtractSamples();
		for (int i = 0; i < brrSamples.Count; i++) {
			var brr = brrSamples[i];
			var pcm = BrrCodec.Decode(brr.Data);
			var wav = WavFile.FromSamples(pcm, BrrCodec.StandardSampleRate);

			generator.Samples.Add(new AbletonSample {
				FileName = $"sample_{i:D2}.wav",
				WavData = wav,
				LoopEnabled = brr.HasLoop,
				LoopStart = brr.LoopSampleOffset,
				LoopEnd = brr.SampleCount,
				RootNote = 60 // Default to C4
			});
		}

		// Get voice info and configure tracks
		var voices = spc.GetVoiceInfo();
		for (int i = 0; i < Math.Min(voices.Length, generator.MidiTracks.Count); i++) {
			var track = generator.MidiTracks[i];
			track.SampleIndex = voices[i].SourceNumber;

			// Could add initial MIDI clips here based on sequence data
			// (requires sequence parsing which is driver-specific)
		}

		// Generate the project
		generator.Generate(alsPath);

		return alsPath;
	}

	/// <summary>
	/// Extract just the BRR samples from an SPC file to WAV files.
	/// </summary>
	public static List<string> ExtractSamplesToWav(string spcPath, string outputDir) {
		var spc = SpcFile.Load(spcPath);
		var wavFiles = new List<string>();

		Directory.CreateDirectory(outputDir);

		var samples = spc.ExtractSamples();
		for (int i = 0; i < samples.Count; i++) {
			var brr = samples[i];
			var pcm = BrrCodec.Decode(brr.Data);
			var wav = WavFile.FromSamples(pcm, BrrCodec.StandardSampleRate);

			var wavPath = Path.Combine(outputDir, $"sample_{i:D2}.wav");
			wav.Save(wavPath);
			wavFiles.Add(wavPath);
		}

		return wavFiles;
	}

	/// <summary>
	/// Extract BRR samples as raw .brr files.
	/// </summary>
	public static List<string> ExtractSamplesToBrr(string spcPath, string outputDir) {
		var spc = SpcFile.Load(spcPath);
		var brrFiles = new List<string>();

		Directory.CreateDirectory(outputDir);

		var samples = spc.ExtractSamples();
		for (int i = 0; i < samples.Count; i++) {
			var brr = samples[i];
			var brrPath = Path.Combine(outputDir, $"sample_{i:D2}.brr");
			File.WriteAllBytes(brrPath, brr.Data);
			brrFiles.Add(brrPath);
		}

		return brrFiles;
	}

	/// <summary>
	/// Convert a WAV file to BRR format.
	/// </summary>
	/// <param name="wavPath">Path to the WAV file.</param>
	/// <param name="outputPath">Path for the output BRR file.</param>
	/// <param name="targetSampleRate">Target sample rate (default: 16000).</param>
	/// <param name="loopStart">Loop start sample (-1 for no loop).</param>
	/// <param name="usePreEmphasis">Apply pre-emphasis filter for better quality (default: true).</param>
	public static void WavToBrr(string wavPath, string outputPath, int targetSampleRate = 16000, int loopStart = -1, bool usePreEmphasis = true) {
		var wav = WavFile.Load(wavPath);

		// Convert to mono if stereo
		if (wav.Channels > 1) {
			wav = wav.ToMono();
		}

		// Resample if needed
		if (wav.SampleRate != targetSampleRate) {
			wav = wav.Resample(targetSampleRate);
		}

		// Align loop to 16-sample boundary if looping
		int alignedLoopStart = loopStart;
		if (loopStart >= 0) {
			alignedLoopStart = (loopStart / BrrCodec.SamplesPerBlock) * BrrCodec.SamplesPerBlock;
		}

		// Encode to BRR with optional pre-emphasis
		var brrData = BrrCodec.Encode(wav.Samples, alignedLoopStart, usePreEmphasis);
		File.WriteAllBytes(outputPath, brrData);
	}

	/// <summary>
	/// Convert a BRR file to WAV format.
	/// </summary>
	public static void BrrToWav(string brrPath, string outputPath, int sampleRate = 32000) {
		var brrData = File.ReadAllBytes(brrPath);
		var pcm = BrrCodec.Decode(brrData);
		var wav = WavFile.FromSamples(pcm, sampleRate);
		wav.Save(outputPath);
	}

	/// <summary>
	/// Get information about an SPC file.
	/// </summary>
	public static SpcInfo GetSpcInfo(string spcPath) {
		var spc = SpcFile.Load(spcPath);

		return new SpcInfo {
			SongTitle = spc.Header.SongTitle,
			GameTitle = spc.Header.GameTitle,
			Artist = spc.Header.Artist,
			DumperName = spc.Header.DumperName,
			Comments = spc.Header.Comments,
			DumpDate = spc.Header.DumpDate,
			SongLengthSeconds = spc.Header.SongLengthSeconds,
			FadeLengthMs = spc.Header.FadeLengthMs,
			SampleCount = spc.SampleDirectory.Count,
			DirectoryAddress = spc.Dsp.DirectoryAddress,
			Voices = spc.GetVoiceInfo()
		};
	}

	/// <summary>
	/// Estimate the tempo of an SPC file (placeholder - requires sequence analysis).
	/// </summary>
	private static double EstimateTempo(SpcFile spc) {
		// TODO: Implement proper tempo detection by analyzing sequence data
		// For now, return a reasonable default
		return 120.0;
	}
}

/// <summary>
/// Information about an SPC file.
/// </summary>
public record SpcInfo {
	public string SongTitle { get; init; } = "";
	public string GameTitle { get; init; } = "";
	public string Artist { get; init; } = "";
	public string DumperName { get; init; } = "";
	public string Comments { get; init; } = "";
	public string DumpDate { get; init; } = "";
	public int SongLengthSeconds { get; init; }
	public int FadeLengthMs { get; init; }
	public int SampleCount { get; init; }
	public ushort DirectoryAddress { get; init; }
	public VoiceInfo[] Voices { get; init; } = [];
}
