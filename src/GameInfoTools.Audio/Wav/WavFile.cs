namespace GameInfoTools.Audio.Wav;

/// <summary>
/// Simple WAV file reader and writer for 16-bit PCM audio.
/// </summary>
public class WavFile {
	/// <summary>
	/// Sample rate in Hz.
	/// </summary>
	public int SampleRate { get; set; } = 32000;

	/// <summary>
	/// Number of channels (1 = mono, 2 = stereo).
	/// </summary>
	public int Channels { get; set; } = 1;

	/// <summary>
	/// Bits per sample (typically 16).
	/// </summary>
	public int BitsPerSample { get; set; } = 16;

	/// <summary>
	/// Sample data (16-bit signed PCM, interleaved if stereo).
	/// </summary>
	public short[] Samples { get; set; } = [];

	/// <summary>
	/// Load a WAV file from disk.
	/// </summary>
	public static WavFile Load(string filePath) {
		using var stream = File.OpenRead(filePath);
		return Load(stream);
	}

	/// <summary>
	/// Load a WAV file from a stream.
	/// </summary>
	public static WavFile Load(Stream stream) {
		using var reader = new BinaryReader(stream);

		// RIFF header
		var riffId = new string(reader.ReadChars(4));
		if (riffId != "RIFF") {
			throw new InvalidDataException("Not a valid WAV file (missing RIFF header)");
		}

		var fileSize = reader.ReadInt32();
		var waveId = new string(reader.ReadChars(4));
		if (waveId != "WAVE") {
			throw new InvalidDataException("Not a valid WAV file (missing WAVE header)");
		}

		var wav = new WavFile();

		// Read chunks
		while (stream.Position < stream.Length) {
			var chunkId = new string(reader.ReadChars(4));
			var chunkSize = reader.ReadInt32();

			switch (chunkId) {
				case "fmt ":
					ReadFmtChunk(reader, wav, chunkSize);
					break;
				case "data":
					ReadDataChunk(reader, wav, chunkSize);
					break;
				default:
					// Skip unknown chunks
					reader.BaseStream.Position += chunkSize;
					break;
			}
		}

		return wav;
	}

	private static void ReadFmtChunk(BinaryReader reader, WavFile wav, int chunkSize) {
		var audioFormat = reader.ReadInt16();
		if (audioFormat != 1) {
			throw new InvalidDataException($"Only PCM format is supported (got {audioFormat})");
		}

		wav.Channels = reader.ReadInt16();
		wav.SampleRate = reader.ReadInt32();
		var byteRate = reader.ReadInt32();
		var blockAlign = reader.ReadInt16();
		wav.BitsPerSample = reader.ReadInt16();

		if (wav.BitsPerSample != 16) {
			throw new InvalidDataException($"Only 16-bit audio is supported (got {wav.BitsPerSample})");
		}

		// Skip any extra format bytes
		if (chunkSize > 16) {
			reader.BaseStream.Position += chunkSize - 16;
		}
	}

	private static void ReadDataChunk(BinaryReader reader, WavFile wav, int chunkSize) {
		int sampleCount = chunkSize / 2; // 2 bytes per sample for 16-bit
		wav.Samples = new short[sampleCount];

		for (int i = 0; i < sampleCount; i++) {
			wav.Samples[i] = reader.ReadInt16();
		}
	}

	/// <summary>
	/// Save as a WAV file.
	/// </summary>
	public void Save(string filePath) {
		using var stream = File.Create(filePath);
		Save(stream);
	}

	/// <summary>
	/// Save to a stream.
	/// </summary>
	public void Save(Stream stream) {
		using var writer = new BinaryWriter(stream);

		int dataSize = Samples.Length * 2;
		int fileSize = 36 + dataSize;

		// RIFF header
		writer.Write("RIFF".ToCharArray());
		writer.Write(fileSize);
		writer.Write("WAVE".ToCharArray());

		// fmt chunk
		writer.Write("fmt ".ToCharArray());
		writer.Write(16); // chunk size
		writer.Write((short)1); // PCM format
		writer.Write((short)Channels);
		writer.Write(SampleRate);
		writer.Write(SampleRate * Channels * 2); // byte rate
		writer.Write((short)(Channels * 2)); // block align
		writer.Write((short)BitsPerSample);

		// data chunk
		writer.Write("data".ToCharArray());
		writer.Write(dataSize);

		foreach (var sample in Samples) {
			writer.Write(sample);
		}
	}

	/// <summary>
	/// Convert stereo to mono by averaging channels.
	/// </summary>
	public WavFile ToMono() {
		if (Channels == 1) {
			return this;
		}

		var monoSamples = new short[Samples.Length / 2];
		for (int i = 0; i < monoSamples.Length; i++) {
			int left = Samples[i * 2];
			int right = Samples[i * 2 + 1];
			monoSamples[i] = (short)((left + right) / 2);
		}

		return new WavFile {
			SampleRate = SampleRate,
			Channels = 1,
			BitsPerSample = 16,
			Samples = monoSamples
		};
	}

	/// <summary>
	/// Resample to a different sample rate using linear interpolation.
	/// </summary>
	public WavFile Resample(int targetSampleRate) {
		if (SampleRate == targetSampleRate) {
			return this;
		}

		double ratio = (double)SampleRate / targetSampleRate;
		int newLength = (int)(Samples.Length / ratio);
		var newSamples = new short[newLength];

		for (int i = 0; i < newLength; i++) {
			double srcIndex = i * ratio;
			int srcIndexInt = (int)srcIndex;
			double frac = srcIndex - srcIndexInt;

			if (srcIndexInt + 1 < Samples.Length) {
				// Linear interpolation
				double sample = Samples[srcIndexInt] * (1 - frac) + Samples[srcIndexInt + 1] * frac;
				newSamples[i] = (short)Math.Clamp(sample, short.MinValue, short.MaxValue);
			} else {
				newSamples[i] = Samples[srcIndexInt];
			}
		}

		return new WavFile {
			SampleRate = targetSampleRate,
			Channels = Channels,
			BitsPerSample = 16,
			Samples = newSamples
		};
	}

	/// <summary>
	/// Get duration in seconds.
	/// </summary>
	public double Duration => (double)Samples.Length / Channels / SampleRate;

	/// <summary>
	/// Create a WAV file from raw 16-bit samples.
	/// </summary>
	public static WavFile FromSamples(short[] samples, int sampleRate = 32000, int channels = 1) {
		return new WavFile {
			SampleRate = sampleRate,
			Channels = channels,
			BitsPerSample = 16,
			Samples = samples
		};
	}
}
