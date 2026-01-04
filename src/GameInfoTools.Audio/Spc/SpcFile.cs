namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Complete SPC file containing header, RAM dump, and DSP registers.
/// </summary>
public class SpcFile {
	/// <summary>
	/// SPC header size in bytes.
	/// </summary>
	public const int HeaderSize = 256;

	/// <summary>
	/// SPC700 RAM size in bytes.
	/// </summary>
	public const int RamSize = 65536;

	/// <summary>
	/// DSP register size in bytes.
	/// </summary>
	public const int DspSize = 128;

	/// <summary>
	/// Total file size (minimum).
	/// </summary>
	public const int MinFileSize = HeaderSize + RamSize + DspSize;

	/// <summary>
	/// File header with metadata and register state.
	/// </summary>
	public SpcHeader Header { get; set; }

	/// <summary>
	/// 64KB SPC700 RAM dump.
	/// </summary>
	public byte[] Ram { get; set; }

	/// <summary>
	/// DSP register state.
	/// </summary>
	public DspRegisters Dsp { get; set; }

	/// <summary>
	/// Extra RAM (64 bytes, optional in some files).
	/// </summary>
	public byte[]? ExtraRam { get; set; }

	/// <summary>
	/// Sample directory (lazy-loaded from RAM).
	/// </summary>
	private SampleDirectory? _sampleDirectory;

	/// <summary>
	/// Get the sample directory from RAM.
	/// </summary>
	public SampleDirectory SampleDirectory {
		get {
			_sampleDirectory ??= SampleDirectory.Parse(Ram, Dsp.DirectoryAddress);
			return _sampleDirectory;
		}
	}

	/// <summary>
	/// Creates a new empty SPC file.
	/// </summary>
	public SpcFile() {
		Header = new SpcHeader();
		Ram = new byte[RamSize];
		Dsp = new DspRegisters(new byte[DspSize]);
	}

	/// <summary>
	/// Load an SPC file from a file path.
	/// </summary>
	public static SpcFile Load(string filePath) {
		var data = File.ReadAllBytes(filePath);
		return Parse(data);
	}

	/// <summary>
	/// Load an SPC file from a stream.
	/// </summary>
	public static SpcFile Load(Stream stream) {
		using var ms = new MemoryStream();
		stream.CopyTo(ms);
		return Parse(ms.ToArray());
	}

	/// <summary>
	/// Parse an SPC file from raw bytes.
	/// </summary>
	public static SpcFile Parse(ReadOnlySpan<byte> data) {
		if (data.Length < MinFileSize) {
			throw new ArgumentException($"SPC file must be at least {MinFileSize} bytes", nameof(data));
		}

		var spc = new SpcFile {
			Header = SpcHeader.Parse(data[..HeaderSize]),
			Ram = data.Slice(HeaderSize, RamSize).ToArray(),
			Dsp = DspRegisters.Parse(data.Slice(HeaderSize + RamSize, DspSize))
		};

		if (!spc.Header.IsValid) {
			throw new InvalidDataException("Invalid SPC file signature");
		}

		// Extra RAM (optional, 64 bytes after DSP)
		int extraRamOffset = HeaderSize + RamSize + DspSize;
		if (data.Length >= extraRamOffset + 64) {
			spc.ExtraRam = data.Slice(extraRamOffset, 64).ToArray();
		}

		return spc;
	}

	/// <summary>
	/// Save the SPC file to disk.
	/// </summary>
	public void Save(string filePath) {
		File.WriteAllBytes(filePath, ToBytes());
	}

	/// <summary>
	/// Serialize to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var data = new byte[HeaderSize + RamSize + DspSize + (ExtraRam?.Length ?? 0)];

		var headerBytes = Header.ToBytes();
		Array.Copy(headerBytes, 0, data, 0, HeaderSize);
		Array.Copy(Ram, 0, data, HeaderSize, RamSize);
		Array.Copy(Dsp.Data, 0, data, HeaderSize + RamSize, DspSize);

		if (ExtraRam != null) {
			Array.Copy(ExtraRam, 0, data, HeaderSize + RamSize + DspSize, ExtraRam.Length);
		}

		return data;
	}

	/// <summary>
	/// Extract all BRR samples from the SPC file.
	/// </summary>
	public List<BrrSample> ExtractSamples() {
		var samples = new List<BrrSample>();

		for (int i = 0; i < SampleDirectory.Count; i++) {
			var entry = SampleDirectory.Entries[i];
			var data = SampleDirectory.GetSampleData(i, Ram);

			samples.Add(new BrrSample {
				Index = i,
				StartAddress = entry.StartAddress,
				LoopAddress = entry.LoopAddress,
				Data = data.ToArray(),
				HasLoop = (data[0] & 0x02) != 0 // Loop flag in first block
			});
		}

		return samples;
	}

	/// <summary>
	/// Get information about voice/channel configuration.
	/// </summary>
	public VoiceInfo[] GetVoiceInfo() {
		var voices = new VoiceInfo[DspRegisters.VoiceCount];

		for (int i = 0; i < DspRegisters.VoiceCount; i++) {
			voices[i] = new VoiceInfo {
				Index = i,
				VolumeLeft = Dsp.GetVolumeLeft(i),
				VolumeRight = Dsp.GetVolumeRight(i),
				Pitch = Dsp.GetPitch(i),
				SourceNumber = Dsp.GetSourceNumber(i),
				Adsr = Dsp.GetAdsr(i),
				AdsrEnvelope = Dsp.GetAdsrEnvelope(i),
				Gain = Dsp.GetGain(i),
				EchoEnabled = (Dsp.EchoEnable & (1 << i)) != 0,
				NoiseEnabled = (Dsp.NoiseEnable & (1 << i)) != 0,
				PitchModEnabled = (Dsp.PitchModulation & (1 << i)) != 0
			};
		}

		return voices;
	}

	/// <summary>
	/// Invalidate cached sample directory (call after modifying RAM).
	/// </summary>
	public void InvalidateSampleDirectory() {
		_sampleDirectory = null;
	}
}

/// <summary>
/// Extracted BRR sample.
/// </summary>
public class BrrSample {
	/// <summary>
	/// Sample index in the directory.
	/// </summary>
	public int Index { get; set; }

	/// <summary>
	/// Start address in SPC RAM.
	/// </summary>
	public ushort StartAddress { get; set; }

	/// <summary>
	/// Loop point address in SPC RAM.
	/// </summary>
	public ushort LoopAddress { get; set; }

	/// <summary>
	/// Raw BRR data.
	/// </summary>
	public byte[] Data { get; set; } = [];

	/// <summary>
	/// Whether the sample loops.
	/// </summary>
	public bool HasLoop { get; set; }

	/// <summary>
	/// Size in bytes.
	/// </summary>
	public int Size => Data.Length;

	/// <summary>
	/// Number of BRR blocks.
	/// </summary>
	public int BlockCount => Data.Length / 9;

	/// <summary>
	/// Number of decoded samples (16 per block).
	/// </summary>
	public int SampleCount => BlockCount * 16;

	/// <summary>
	/// Loop point as sample offset (if looping).
	/// </summary>
	public int LoopSampleOffset {
		get {
			if (!HasLoop || LoopAddress < StartAddress) return 0;
			int loopBlockIndex = (LoopAddress - StartAddress) / 9;
			return loopBlockIndex * 16;
		}
	}
}

/// <summary>
/// Voice/channel configuration information.
/// </summary>
public record VoiceInfo {
	public int Index { get; init; }
	public sbyte VolumeLeft { get; init; }
	public sbyte VolumeRight { get; init; }
	public ushort Pitch { get; init; }
	public byte SourceNumber { get; init; }
	public ushort Adsr { get; init; }
	public AdsrEnvelope AdsrEnvelope { get; init; } = AdsrEnvelope.FromRaw(0);
	public byte Gain { get; init; }
	public bool EchoEnabled { get; init; }
	public bool NoiseEnabled { get; init; }
	public bool PitchModEnabled { get; init; }

	/// <summary>
	/// Calculate sample rate in Hz from pitch value.
	/// SNES formula: rate = (pitch × 32000) / 4096.
	/// </summary>
	public int SampleRate => (int)((long)Pitch * 32000 / 4096);

	/// <summary>
	/// Calculate pan position (-1.0 = left, 0.0 = center, 1.0 = right).
	/// </summary>
	public double Pan {
		get {
			if (VolumeLeft == 0 && VolumeRight == 0) return 0;
			double left = Math.Abs(VolumeLeft);
			double right = Math.Abs(VolumeRight);
			double total = left + right;
			if (total == 0) return 0;
			return (right - left) / total;
		}
	}

	/// <summary>
	/// Calculate average volume (0-127).
	/// </summary>
	public int Volume => (Math.Abs(VolumeLeft) + Math.Abs(VolumeRight)) / 2;
}
