namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Renders SPC audio by emulating DSP sample playback.
/// This is a simplified renderer that decodes BRR samples and mixes voices.
/// </summary>
public class SpcRenderer {
	private readonly SpcFile _spc;
	private readonly int _sampleRate;
	private readonly VoiceState[] _voices;

	/// <summary>
	/// Sample rate for rendered output (default 32000 Hz).
	/// </summary>
	public int SampleRate => _sampleRate;

	/// <summary>
	/// Creates a renderer for the given SPC file.
	/// </summary>
	public SpcRenderer(SpcFile spc, int sampleRate = 32000) {
		_spc = spc ?? throw new ArgumentNullException(nameof(spc));
		_sampleRate = sampleRate;
		_voices = new VoiceState[8];
		for (int i = 0; i < 8; i++) {
			_voices[i] = new VoiceState(i);
		}
	}

	/// <summary>
	/// Renders audio from the SPC file by decoding all active samples.
	/// This is a static render (no sequence playback) that captures the current state.
	/// </summary>
	/// <param name="durationSeconds">Duration to render in seconds.</param>
	/// <returns>Stereo interleaved samples (left, right, left, right...).</returns>
	public short[] RenderStatic(double durationSeconds) {
		int totalSamples = (int)(_sampleRate * durationSeconds);
		var output = new short[totalSamples * 2];

		InitializeVoices();

		// Main volume
		sbyte mainVolL = (sbyte)_spc.Dsp.Data[0x0c];
		sbyte mainVolR = (sbyte)_spc.Dsp.Data[0x1c];

		for (int sample = 0; sample < totalSamples; sample++) {
			int mixL = 0;
			int mixR = 0;

			for (int v = 0; v < 8; v++) {
				if (!_voices[v].Active) continue;

				short voiceSample = GetNextSample(v);

				// Apply voice volume
				sbyte volL = (sbyte)_spc.Dsp.Data[v * 0x10];
				sbyte volR = (sbyte)_spc.Dsp.Data[v * 0x10 + 1];

				mixL += (voiceSample * volL) >> 7;
				mixR += (voiceSample * volR) >> 7;
			}

			// Apply main volume
			mixL = (mixL * mainVolL) >> 7;
			mixR = (mixR * mainVolR) >> 7;

			// Clamp and store
			output[sample * 2] = Clamp16(mixL);
			output[sample * 2 + 1] = Clamp16(mixR);
		}

		return output;
	}

	/// <summary>
	/// Renders a single sample/instrument.
	/// </summary>
	/// <param name="sampleNumber">The sample directory index.</param>
	/// <param name="pitch">Pitch value (4096 = native rate).</param>
	/// <param name="durationSeconds">Duration to render.</param>
	/// <returns>Mono samples.</returns>
	public short[] RenderSample(int sampleNumber, int pitch = 4096, double durationSeconds = 1.0) {
		int totalSamples = (int)(_sampleRate * durationSeconds);
		var output = new short[totalSamples];

		// Get sample location
		int dirPage = _spc.Dsp.Data[0x5d];
		int dirAddr = dirPage * 0x100 + sampleNumber * 4;
		int sampleAddr = _spc.Ram[dirAddr] | (_spc.Ram[dirAddr + 1] << 8);
		int loopAddr = _spc.Ram[dirAddr + 2] | (_spc.Ram[dirAddr + 3] << 8);

		// Decode BRR to raw samples
		var decoded = DecodeBrrFromRam(sampleAddr, loopAddr);
		if (decoded.Length == 0) return output;

		// Resample to output rate with pitch
		double step = (pitch / 4096.0) * (32000.0 / _sampleRate);
		double position = 0;

		for (int i = 0; i < totalSamples; i++) {
			int idx = (int)position;
			if (idx >= decoded.Length) {
				// Check for loop
				if (loopAddr >= sampleAddr && loopAddr < sampleAddr + decoded.Length * 9 / 16) {
					int loopOffset = (loopAddr - sampleAddr) * 16 / 9;
					position = loopOffset + (position - decoded.Length);
					idx = (int)position;
				}
				if (idx >= decoded.Length || idx < 0) break;
			}

			output[i] = decoded[idx];
			position += step;
		}

		return output;
	}

	/// <summary>
	/// Gets information about what would be rendered.
	/// </summary>
	public RenderInfo GetRenderInfo() {
		int activeVoices = 0;
		int totalSampleDataBytes = 0;

		int dirPage = _spc.Dsp.Data[0x5d];
		int dirAddr = dirPage * 0x100;

		for (int v = 0; v < 8; v++) {
			sbyte volL = (sbyte)_spc.Dsp.Data[v * 0x10];
			sbyte volR = (sbyte)_spc.Dsp.Data[v * 0x10 + 1];
			if (volL != 0 || volR != 0) {
				activeVoices++;

				int srcn = _spc.Dsp.Data[v * 0x10 + 4];
				int entryAddr = dirAddr + srcn * 4;
				int sampleStart = _spc.Ram[entryAddr] | (_spc.Ram[entryAddr + 1] << 8);
				int loopStart = _spc.Ram[entryAddr + 2] | (_spc.Ram[entryAddr + 3] << 8);

				// Estimate sample size
				int size = EstimateSampleSize(sampleStart);
				totalSampleDataBytes += size;
			}
		}

		return new RenderInfo {
			SampleRate = _sampleRate,
			ActiveVoices = activeVoices,
			TotalSampleDataBytes = totalSampleDataBytes
		};
	}

	private void InitializeVoices() {
		int dirPage = _spc.Dsp.Data[0x5d];
		int dirAddr = dirPage * 0x100;

		for (int v = 0; v < 8; v++) {
			var voice = _voices[v];
			sbyte volL = (sbyte)_spc.Dsp.Data[v * 0x10];
			sbyte volR = (sbyte)_spc.Dsp.Data[v * 0x10 + 1];

			if (volL == 0 && volR == 0) {
				voice.Active = false;
				continue;
			}

			int srcn = _spc.Dsp.Data[v * 0x10 + 4];
			int entryAddr = dirAddr + srcn * 4;

			voice.SampleAddr = _spc.Ram[entryAddr] | (_spc.Ram[entryAddr + 1] << 8);
			voice.LoopAddr = _spc.Ram[entryAddr + 2] | (_spc.Ram[entryAddr + 3] << 8);
			voice.Pitch = _spc.Dsp.Data[v * 0x10 + 2] | (_spc.Dsp.Data[v * 0x10 + 3] << 8);

			// Decode BRR to buffer
			voice.DecodedSamples = DecodeBrrFromRam(voice.SampleAddr, voice.LoopAddr);
			voice.Position = 0;
			voice.Active = voice.DecodedSamples.Length > 0;
		}
	}

	private short GetNextSample(int voiceIndex) {
		var voice = _voices[voiceIndex];
		if (!voice.Active || voice.DecodedSamples.Length == 0) return 0;

		int idx = (int)voice.Position;
		if (idx >= voice.DecodedSamples.Length) {
			// Loop or end
			if (voice.LoopAddr >= voice.SampleAddr) {
				int loopOffset = Math.Max(0, (voice.LoopAddr - voice.SampleAddr) * 16 / 9);
				voice.Position = loopOffset;
				idx = loopOffset;
			} else {
				voice.Active = false;
				return 0;
			}
		}

		short sample = idx < voice.DecodedSamples.Length ? voice.DecodedSamples[idx] : (short)0;

		// Advance position based on pitch
		double step = (voice.Pitch / 4096.0) * (32000.0 / _sampleRate);
		voice.Position += step;

		return sample;
	}

	private short[] DecodeBrrFromRam(int startAddr, int loopAddr) {
		var samples = new List<short>();
		int addr = startAddr;
		int prev1 = 0, prev2 = 0;

		// Limit to prevent infinite loops
		int maxBlocks = 1000;
		int blocks = 0;

		while (addr < 0xffc0 && blocks < maxBlocks) {
			if (addr + 9 > _spc.Ram.Length) break;

			byte header = _spc.Ram[addr];
			int range = header >> 4;
			int filter = (header >> 2) & 0x03;
			bool loop = (header & 0x02) != 0;
			bool end = (header & 0x01) != 0;

			// Decode 16 samples from 8 data bytes
			for (int i = 0; i < 8; i++) {
				byte dataByte = _spc.Ram[addr + 1 + i];
				int nibbleHigh = (dataByte >> 4) & 0x0F;
				int nibbleLow = dataByte & 0x0F;

				// Sign extend nibbles
				if (nibbleHigh >= 8) nibbleHigh -= 16;
				if (nibbleLow >= 8) nibbleLow -= 16;

				int sample1 = DecodeBrrSample(nibbleHigh, range, filter, prev1, prev2);
				int sample2 = DecodeBrrSample(nibbleLow, range, filter, sample1, prev1);

				samples.Add(Clamp16(sample1));
				samples.Add(Clamp16(sample2));

				prev2 = sample1;
				prev1 = sample2;
			}

			addr += 9;
			blocks++;

			if (end) break;
		}

		return [.. samples];
	}

	private static int DecodeBrrSample(int nibble, int range, int filter, int prev1, int prev2) {
		int shifted = nibble << range;
		if (range > 12) shifted = (nibble < 0) ? -2048 : 0;

		int filtered = filter switch {
			0 => shifted,
			1 => shifted + prev1 + ((-prev1) >> 4),
			2 => shifted + (prev1 << 1) + ((-3 * prev1) >> 5) - prev2 + ((prev2) >> 4),
			3 => shifted + (prev1 << 1) + ((-13 * prev1) >> 6) - prev2 + ((3 * prev2) >> 4),
			_ => shifted
		};

		// Clamp to 16-bit then to 15-bit
		if (filtered > 32767) filtered = 32767;
		if (filtered < -32768) filtered = -32768;

		return filtered;
	}

	private int EstimateSampleSize(int startAddr) {
		int addr = startAddr;
		int size = 0;
		int maxBlocks = 500;

		while (addr < 0xffc0 && size < maxBlocks * 9) {
			if (addr >= _spc.Ram.Length) break;
			byte header = _spc.Ram[addr];
			size += 9;
			addr += 9;
			if ((header & 0x01) != 0) break; // End flag
		}

		return size;
	}

	private static short Clamp16(int value) {
		if (value > 32767) return 32767;
		if (value < -32768) return -32768;
		return (short)value;
	}

	private class VoiceState(int index) {
		public int Index { get; } = index;
		public bool Active { get; set; }
		public int SampleAddr { get; set; }
		public int LoopAddr { get; set; }
		public int Pitch { get; set; }
		public short[] DecodedSamples { get; set; } = [];
		public double Position { get; set; }
	}
}

/// <summary>
/// Information about what will be rendered.
/// </summary>
public class RenderInfo {
	public int SampleRate { get; init; }
	public int ActiveVoices { get; init; }
	public int TotalSampleDataBytes { get; init; }
}
