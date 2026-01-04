namespace GameInfoTools.Audio.Spc;

using GameInfoTools.Audio.Brr;

/// <summary>
/// Builder for creating SPC files from components.
/// Supports adding samples, setting DSP registers, and memory layout optimization.
/// </summary>
public class SpcBuilder {
	/// <summary>
	/// Maximum number of samples in directory (limited by memory).
	/// </summary>
	public const int MaxSamples = 256;

	/// <summary>
	/// Default sample directory address.
	/// </summary>
	public const ushort DefaultDirectoryAddress = 0x0200;

	/// <summary>
	/// Reserved RAM for player code (start of RAM).
	/// </summary>
	public const int ReservedPlayerRam = 0x0200;

	/// <summary>
	/// Maximum usable RAM after directory and reserved areas.
	/// </summary>
	public const int MaxSampleRam = SpcFile.RamSize - ReservedPlayerRam;

	private readonly List<SampleEntry> _samples = [];
	private readonly byte[] _dspRegisters = new byte[SpcFile.DspSize];
	private ushort _directoryAddress = DefaultDirectoryAddress;
	private string _songTitle = "";
	private string _gameTitle = "";
	private string _artistName = "";
	private string _dumperName = "";
	private string _comments = "";
	private DateTime _dumpDate = DateTime.Now;
	private int _fadeOutLength = 0;
	private int _playLength = 0;

	/// <summary>
	/// Current number of samples added.
	/// </summary>
	public int SampleCount => _samples.Count;

	/// <summary>
	/// Calculate total RAM usage for samples and directory.
	/// </summary>
	public int TotalSampleRamUsage {
		get {
			int directorySize = _samples.Count * 4; // 4 bytes per entry
			int sampleData = _samples.Sum(s => s.Data.Length);
			return directorySize + sampleData;
		}
	}

	/// <summary>
	/// Calculate remaining RAM available for samples.
	/// </summary>
	public int RemainingRam => MaxSampleRam - TotalSampleRamUsage;

	/// <summary>
	/// Get detailed memory analysis.
	/// </summary>
	public MemoryAnalysis GetMemoryAnalysis() {
		var analysis = new MemoryAnalysis {
			TotalRam = SpcFile.RamSize,
			ReservedForPlayer = ReservedPlayerRam,
			DirectoryAddress = _directoryAddress,
			DirectorySize = _samples.Count * 4,
			SampleCount = _samples.Count,
			TotalSampleBytes = _samples.Sum(s => s.Data.Length),
			LargestSampleBytes = _samples.Count > 0 ? _samples.Max(s => s.Data.Length) : 0,
			SmallestSampleBytes = _samples.Count > 0 ? _samples.Min(s => s.Data.Length) : 0,
			AvailableForSamples = MaxSampleRam - _samples.Sum(s => s.Data.Length) - (_samples.Count * 4)
		};

		foreach (var sample in _samples) {
			analysis.SampleSizes.Add(new SampleSizeInfo {
				Index = sample.Index,
				Name = sample.Name,
				Size = sample.Data.Length,
				BlockCount = sample.Data.Length / 9,
				DecodedSamples = (sample.Data.Length / 9) * 16
			});
		}

		return analysis;
	}

	/// <summary>
	/// Set the sample directory base address.
	/// </summary>
	public SpcBuilder SetDirectoryAddress(ushort address) {
		_directoryAddress = address;
		return this;
	}

	/// <summary>
	/// Set song metadata.
	/// </summary>
	public SpcBuilder SetMetadata(
		string? songTitle = null,
		string? gameTitle = null,
		string? artistName = null,
		string? dumperName = null,
		string? comments = null
	) {
		if (songTitle != null) _songTitle = songTitle;
		if (gameTitle != null) _gameTitle = gameTitle;
		if (artistName != null) _artistName = artistName;
		if (dumperName != null) _dumperName = dumperName;
		if (comments != null) _comments = comments;
		return this;
	}

	/// <summary>
	/// Set playback timing.
	/// </summary>
	public SpcBuilder SetTiming(int playLengthSeconds = 0, int fadeOutMs = 0) {
		_playLength = playLengthSeconds;
		_fadeOutLength = fadeOutMs;
		return this;
	}

	/// <summary>
	/// Add a raw BRR sample.
	/// </summary>
	/// <param name="brrData">BRR encoded sample data</param>
	/// <param name="loopPoint">Loop point in BRR blocks (0 for no loop, -1 for end of sample)</param>
	/// <param name="name">Optional sample name for identification</param>
	/// <returns>Sample index</returns>
	public int AddSample(byte[] brrData, int loopPoint = 0, string? name = null) {
		if (_samples.Count >= MaxSamples) {
			throw new InvalidOperationException($"Maximum of {MaxSamples} samples supported");
		}

		if (brrData.Length % 9 != 0) {
			throw new ArgumentException("BRR data must be a multiple of 9 bytes", nameof(brrData));
		}

		int index = _samples.Count;
		_samples.Add(new SampleEntry {
			Index = index,
			Data = brrData,
			LoopBlockIndex = loopPoint >= 0 ? loopPoint : (brrData.Length / 9) - 1,
			Name = name ?? $"Sample_{index:D2}"
		});

		return index;
	}

	/// <summary>
	/// Add a WAV file as a sample (encodes to BRR).
	/// </summary>
	/// <param name="wavData">WAV file bytes</param>
	/// <param name="loopStart">Loop start in source samples (-1 for no loop)</param>
	/// <param name="usePreEmphasis">Apply pre-emphasis filter for better quality</param>
	/// <param name="name">Optional sample name</param>
	/// <returns>Sample index and encoding quality SNR</returns>
	public (int Index, double SnrDb) AddWavSample(
		byte[] wavData,
		int loopStart = -1,
		bool usePreEmphasis = false,
		string? name = null
	) {
		var wav = WavFile.Parse(wavData);
		var samples = wav.GetMonoSamples16();

		var (brrData, snr) = BrrCodec.EncodeWithQuality(samples, loopStart, usePreEmphasis);
		int loopBlock = loopStart >= 0 ? loopStart / 16 : 0;

		int index = AddSample(brrData, loopBlock, name);
		return (index, snr);
	}

	/// <summary>
	/// Configure a voice channel.
	/// </summary>
	public SpcBuilder ConfigureVoice(
		int voiceIndex,
		int sourceNumber,
		int volumeLeft = 127,
		int volumeRight = 127,
		ushort pitch = 0x1000, // 32kHz base pitch
		ushort adsr = 0xff00,  // Default ADSR (instant attack, no decay)
		byte gain = 0,
		bool echoEnabled = false,
		bool noiseEnabled = false,
		bool pitchModEnabled = false
	) {
		if (voiceIndex is < 0 or >= DspRegisters.VoiceCount) {
			throw new ArgumentOutOfRangeException(nameof(voiceIndex), "Voice must be 0-7");
		}

		int baseReg = voiceIndex * 0x10;

		// Volume
		_dspRegisters[baseReg + 0x00] = (byte)volumeLeft;
		_dspRegisters[baseReg + 0x01] = (byte)volumeRight;

		// Pitch
		_dspRegisters[baseReg + 0x02] = (byte)(pitch & 0xff);
		_dspRegisters[baseReg + 0x03] = (byte)(pitch >> 8);

		// Source number
		_dspRegisters[baseReg + 0x04] = (byte)sourceNumber;

		// ADSR
		_dspRegisters[baseReg + 0x05] = (byte)(adsr & 0xff);
		_dspRegisters[baseReg + 0x06] = (byte)(adsr >> 8);

		// GAIN
		_dspRegisters[baseReg + 0x07] = gain;

		// Enable flags
		if (echoEnabled) _dspRegisters[0x4d] |= (byte)(1 << voiceIndex);
		if (noiseEnabled) _dspRegisters[0x3d] |= (byte)(1 << voiceIndex);
		if (pitchModEnabled) _dspRegisters[0x2d] |= (byte)(1 << voiceIndex);

		return this;
	}

	/// <summary>
	/// Set main volume.
	/// </summary>
	public SpcBuilder SetMainVolume(sbyte left, sbyte right) {
		_dspRegisters[0x0c] = (byte)left;
		_dspRegisters[0x1c] = (byte)right;
		return this;
	}

	/// <summary>
	/// Set echo parameters.
	/// </summary>
	public SpcBuilder SetEcho(
		int delay,
		sbyte volumeLeft,
		sbyte volumeRight,
		sbyte feedback,
		ReadOnlySpan<sbyte> firCoefficients
	) {
		if (delay is < 0 or > 15) {
			throw new ArgumentOutOfRangeException(nameof(delay), "Echo delay must be 0-15");
		}

		if (firCoefficients.Length != 8) {
			throw new ArgumentException("FIR must have exactly 8 coefficients", nameof(firCoefficients));
		}

		_dspRegisters[0x2c] = (byte)volumeLeft;
		_dspRegisters[0x3c] = (byte)volumeRight;
		_dspRegisters[0x0d] = (byte)feedback;
		_dspRegisters[0x7d] = (byte)delay;

		// FIR filter coefficients
		for (int i = 0; i < 8; i++) {
			_dspRegisters[0x0f + (i * 0x10)] = (byte)firCoefficients[i];
		}

		return this;
	}

	/// <summary>
	/// Set noise clock frequency.
	/// </summary>
	public SpcBuilder SetNoiseClock(int clockIndex) {
		if (clockIndex is < 0 or > 31) {
			throw new ArgumentOutOfRangeException(nameof(clockIndex), "Noise clock must be 0-31");
		}

		_dspRegisters[0x6c] = (byte)((_dspRegisters[0x6c] & 0xe0) | clockIndex);
		return this;
	}

	/// <summary>
	/// Set a raw DSP register value.
	/// </summary>
	public SpcBuilder SetDspRegister(int register, byte value) {
		if (register is < 0 or >= SpcFile.DspSize) {
			throw new ArgumentOutOfRangeException(nameof(register));
		}

		_dspRegisters[register] = value;
		return this;
	}

	/// <summary>
	/// Build the SPC file.
	/// </summary>
	public SpcFile Build() {
		if (_samples.Count == 0) {
			throw new InvalidOperationException("At least one sample is required");
		}

		var spc = new SpcFile();

		// Build header
		spc.Header = BuildHeader();

		// Layout samples in RAM and build directory
		LayoutSamples(spc);

		// Set DSP registers
		Array.Copy(_dspRegisters, spc.Dsp.Data, SpcFile.DspSize);

		// Set directory address in DSP
		spc.Dsp.Data[0x5d] = (byte)(_directoryAddress >> 8);

		return spc;
	}

	/// <summary>
	/// Validate the current configuration.
	/// </summary>
	public ValidationResult Validate() {
		var result = new ValidationResult();

		if (_samples.Count == 0) {
			result.Errors.Add("No samples added");
		}

		if (TotalSampleRamUsage > MaxSampleRam) {
			result.Errors.Add($"Total RAM usage ({TotalSampleRamUsage} bytes) exceeds limit ({MaxSampleRam} bytes)");
		}

		foreach (var sample in _samples) {
			if (sample.Data.Length % 9 != 0) {
				result.Errors.Add($"Sample {sample.Index} ({sample.Name}): BRR data not aligned to 9 bytes");
			}

			if (sample.LoopBlockIndex * 9 > sample.Data.Length) {
				result.Warnings.Add($"Sample {sample.Index} ({sample.Name}): Loop point beyond sample end");
			}
		}

		// Check voice configurations
		for (int v = 0; v < DspRegisters.VoiceCount; v++) {
			int sourceNum = _dspRegisters[v * 0x10 + 0x04];
			if (sourceNum >= _samples.Count && sourceNum > 0) {
				result.Warnings.Add($"Voice {v}: References sample {sourceNum} which doesn't exist");
			}
		}

		result.IsValid = result.Errors.Count == 0;
		return result;
	}

	private SpcHeader BuildHeader() {
		var header = new SpcHeader {
			HasId666 = true,
			SongTitle = _songTitle,
			GameTitle = _gameTitle,
			DumperName = _dumperName,
			Comments = _comments,
			DumpDate = _dumpDate.ToString("MM/dd/yyyy"),
			Artist = _artistName
		};

		if (_playLength > 0) {
			header.SongLengthSeconds = _playLength;
		}

		if (_fadeOutLength > 0) {
			header.FadeLengthMs = _fadeOutLength;
		}

		return header;
	}

	private void LayoutSamples(SpcFile spc) {
		// Directory starts at configured address
		int directorySize = _samples.Count * 4;
		int sampleDataStart = _directoryAddress + directorySize;

		// Align sample data to word boundary
		if (sampleDataStart % 2 != 0) sampleDataStart++;

		int currentAddress = sampleDataStart;

		// Write sample directory and data
		for (int i = 0; i < _samples.Count; i++) {
			var sample = _samples[i];

			// Directory entry (4 bytes each)
			int dirOffset = _directoryAddress + (i * 4);
			ushort startAddr = (ushort)currentAddress;
			ushort loopAddr = (ushort)(currentAddress + (sample.LoopBlockIndex * 9));

			spc.Ram[dirOffset + 0] = (byte)(startAddr & 0xff);
			spc.Ram[dirOffset + 1] = (byte)(startAddr >> 8);
			spc.Ram[dirOffset + 2] = (byte)(loopAddr & 0xff);
			spc.Ram[dirOffset + 3] = (byte)(loopAddr >> 8);

			// Sample data
			Array.Copy(sample.Data, 0, spc.Ram, currentAddress, sample.Data.Length);
			currentAddress += sample.Data.Length;
		}
	}

	private class SampleEntry {
		public int Index { get; init; }
		public byte[] Data { get; init; } = [];
		public int LoopBlockIndex { get; init; }
		public string Name { get; init; } = "";
	}
}

/// <summary>
/// Memory analysis results.
/// </summary>
public class MemoryAnalysis {
	public int TotalRam { get; init; }
	public int ReservedForPlayer { get; init; }
	public ushort DirectoryAddress { get; init; }
	public int DirectorySize { get; init; }
	public int SampleCount { get; init; }
	public int TotalSampleBytes { get; init; }
	public int LargestSampleBytes { get; init; }
	public int SmallestSampleBytes { get; init; }
	public int AvailableForSamples { get; init; }
	public List<SampleSizeInfo> SampleSizes { get; } = [];

	public double UsagePercent => (double)(DirectorySize + TotalSampleBytes) / TotalRam * 100;

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"=== SPC Memory Analysis ===");
		sb.AppendLine($"Total RAM:           {TotalRam:N0} bytes (64 KB)");
		sb.AppendLine($"Reserved for player: {ReservedForPlayer:N0} bytes");
		sb.AppendLine($"Directory at:        ${DirectoryAddress:x4}");
		sb.AppendLine($"Directory size:      {DirectorySize:N0} bytes ({SampleCount} samples × 4)");
		sb.AppendLine($"Sample data:         {TotalSampleBytes:N0} bytes");
		sb.AppendLine($"Available:           {AvailableForSamples:N0} bytes");
		sb.AppendLine($"Usage:               {UsagePercent:F1}%");

		if (SampleSizes.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("Sample Breakdown:");
			foreach (var s in SampleSizes) {
				sb.AppendLine($"  [{s.Index:D2}] {s.Name,-20} {s.Size,6:N0} bytes ({s.BlockCount} blocks, {s.DecodedSamples} samples)");
			}
		}

		return sb.ToString();
	}
}

/// <summary>
/// Sample size information.
/// </summary>
public record SampleSizeInfo {
	public int Index { get; init; }
	public string Name { get; init; } = "";
	public int Size { get; init; }
	public int BlockCount { get; init; }
	public int DecodedSamples { get; init; }
}

/// <summary>
/// Validation result for SPC builder.
/// </summary>
public class ValidationResult {
	public bool IsValid { get; set; } = true;
	public List<string> Errors { get; } = [];
	public List<string> Warnings { get; } = [];

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine(IsValid ? "✓ Valid" : "✗ Invalid");

		foreach (var error in Errors) {
			sb.AppendLine($"  ERROR: {error}");
		}

		foreach (var warning in Warnings) {
			sb.AppendLine($"  WARNING: {warning}");
		}

		return sb.ToString();
	}
}

/// <summary>
/// WAV file helper for SpcBuilder.
/// </summary>
file static class WavFile {
	public static WavData Parse(byte[] data) {
		if (data.Length < 44) {
			throw new ArgumentException("Invalid WAV file - too short");
		}

		// Parse RIFF header
		if (data[0] != 'R' || data[1] != 'I' || data[2] != 'F' || data[3] != 'F') {
			throw new ArgumentException("Invalid WAV file - not RIFF format");
		}

		// Parse format chunk
		int channels = data[22] | (data[23] << 8);
		int sampleRate = data[24] | (data[25] << 8) | (data[26] << 16) | (data[27] << 24);
		int bitsPerSample = data[34] | (data[35] << 8);

		// Find data chunk
		int dataOffset = 44;
		int dataSize = data.Length - 44;

		for (int i = 36; i < data.Length - 8; i++) {
			if (data[i] == 'd' && data[i + 1] == 'a' && data[i + 2] == 't' && data[i + 3] == 'a') {
				dataSize = data[i + 4] | (data[i + 5] << 8) | (data[i + 6] << 16) | (data[i + 7] << 24);
				dataOffset = i + 8;
				break;
			}
		}

		return new WavData {
			Channels = channels,
			SampleRate = sampleRate,
			BitsPerSample = bitsPerSample,
			Data = new ArraySegment<byte>(data, dataOffset, Math.Min(dataSize, data.Length - dataOffset))
		};
	}
}

file class WavData {
	public int Channels { get; init; }
	public int SampleRate { get; init; }
	public int BitsPerSample { get; init; }
	public ArraySegment<byte> Data { get; init; }

	public short[] GetMonoSamples16() {
		int bytesPerSample = BitsPerSample / 8;
		int sampleCount = Data.Count / bytesPerSample / Channels;
		var samples = new short[sampleCount];

		for (int i = 0; i < sampleCount; i++) {
			int offset = i * bytesPerSample * Channels;

			short value = BitsPerSample switch {
				8 => (short)((Data[offset] - 128) * 256),
				16 => (short)(Data[offset] | (Data[offset + 1] << 8)),
				24 => (short)((Data[offset + 1] | (Data[offset + 2] << 8))),
				_ => 0
			};

			// If stereo, average channels
			if (Channels == 2 && BitsPerSample == 16) {
				short right = (short)(Data[offset + 2] | (Data[offset + 3] << 8));
				value = (short)((value + right) / 2);
			}

			samples[i] = value;
		}

		return samples;
	}
}
