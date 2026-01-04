namespace GameInfoTools.Audio.Brr;

/// <summary>
/// BRR (Bit Rate Reduction) decoder and encoder for SNES audio.
/// BRR is a 4-bit ADPCM compression format that achieves ~3.5:1 compression.
/// </summary>
public static class BrrCodec {
	/// <summary>
	/// Size of a single BRR block in bytes.
	/// </summary>
	public const int BlockSize = 9;

	/// <summary>
	/// Number of samples decoded per block.
	/// </summary>
	public const int SamplesPerBlock = 16;

	/// <summary>
	/// Standard SNES sample rate in Hz.
	/// </summary>
	public const int StandardSampleRate = 32000;

	/// <summary>
	/// Decode a complete BRR sample to 16-bit PCM.
	/// </summary>
	/// <param name="brrData">BRR encoded data (must be multiple of 9 bytes).</param>
	/// <returns>Decoded 16-bit signed PCM samples.</returns>
	public static short[] Decode(ReadOnlySpan<byte> brrData) {
		if (brrData.Length % BlockSize != 0) {
			throw new ArgumentException($"BRR data length must be a multiple of {BlockSize}", nameof(brrData));
		}

		int blockCount = brrData.Length / BlockSize;
		var samples = new short[blockCount * SamplesPerBlock];

		int old1 = 0;
		int old2 = 0;

		for (int block = 0; block < blockCount; block++) {
			DecodeBlock(brrData.Slice(block * BlockSize, BlockSize), samples.AsSpan(block * SamplesPerBlock, SamplesPerBlock), ref old1, ref old2);
		}

		return samples;
	}

	/// <summary>
	/// Decode a single BRR block to 16 samples.
	/// </summary>
	/// <param name="block">9-byte BRR block.</param>
	/// <param name="output">Output buffer for 16 samples.</param>
	/// <param name="old1">Previous sample (for filter).</param>
	/// <param name="old2">Sample before previous (for filter).</param>
	public static void DecodeBlock(ReadOnlySpan<byte> block, Span<short> output, ref int old1, ref int old2) {
		if (block.Length < BlockSize) {
			throw new ArgumentException($"Block must be at least {BlockSize} bytes", nameof(block));
		}
		if (output.Length < SamplesPerBlock) {
			throw new ArgumentException($"Output must be at least {SamplesPerBlock} samples", nameof(output));
		}

		byte header = block[0];
		int range = (header >> 4) & 0x0f;
		int filter = (header >> 2) & 0x03;
		// bool loopFlag = (header & 0x02) != 0;
		// bool endFlag = (header & 0x01) != 0;

		// Clamp range to valid values (0-12)
		if (range > 12) {
			range = 12;
		}

		int sampleIndex = 0;
		for (int byteIndex = 1; byteIndex < BlockSize; byteIndex++) {
			byte dataByte = block[byteIndex];

			// Process high nybble first, then low nybble
			for (int nybbleIndex = 0; nybbleIndex < 2; nybbleIndex++) {
				int nybble = nybbleIndex == 0
					? (dataByte >> 4) & 0x0f
					: dataByte & 0x0f;

				// Sign extend 4-bit to signed value
				if (nybble >= 8) {
					nybble -= 16;
				}

				// Apply range (shift)
				int sample = nybble << range;

				// Apply filter
				sample = ApplyFilter(sample, filter, old1, old2);

				// Clamp to 16-bit signed range
				sample = Math.Clamp(sample, short.MinValue, short.MaxValue);

				output[sampleIndex++] = (short)sample;

				old2 = old1;
				old1 = sample;
			}
		}
	}

	/// <summary>
	/// Apply IIR filter based on filter mode.
	/// </summary>
	private static int ApplyFilter(int sample, int filter, int old1, int old2) {
		return filter switch {
			0 => sample,
			1 => sample + old1 + ((-old1) >> 4),
			2 => sample + (old1 << 1) + ((-((old1 << 1) + old1)) >> 5) - old2 + (old2 >> 4),
			3 => sample + (old1 << 1) + ((-(old1 + (old1 << 2) + (old1 << 3))) >> 6) - old2 + (((old2 << 1) + old2) >> 4),
			_ => sample
		};
	}

	/// <summary>
	/// Encode 16-bit PCM samples to BRR format with optional pre-emphasis.
	/// </summary>
	/// <param name="samples">16-bit signed PCM samples.</param>
	/// <param name="loopStart">Loop start sample index (-1 for no loop).</param>
	/// <param name="usePreEmphasis">Apply pre-emphasis filter to improve quality.</param>
	/// <returns>BRR encoded data.</returns>
	public static byte[] Encode(ReadOnlySpan<short> samples, int loopStart = -1, bool usePreEmphasis = false) {
		// Optionally apply pre-emphasis to improve encoding quality
		short[] processedSamples;
		if (usePreEmphasis && samples.Length > 0) {
			processedSamples = ApplyPreEmphasis(samples);
		} else {
			processedSamples = samples.ToArray();
		}

		// Pad samples to multiple of 16
		int paddedLength = ((processedSamples.Length + SamplesPerBlock - 1) / SamplesPerBlock) * SamplesPerBlock;
		var paddedSamples = new short[paddedLength];
		processedSamples.CopyTo(paddedSamples.AsSpan());

		int blockCount = paddedLength / SamplesPerBlock;
		var brrData = new byte[blockCount * BlockSize];

		int loopBlock = loopStart >= 0 ? loopStart / SamplesPerBlock : -1;

		int old1 = 0;
		int old2 = 0;

		for (int block = 0; block < blockCount; block++) {
			bool isLoopPoint = block == loopBlock;
			bool isLastBlock = block == blockCount - 1;

			EncodeBlock(
				paddedSamples.AsSpan(block * SamplesPerBlock, SamplesPerBlock),
				brrData.AsSpan(block * BlockSize, BlockSize),
				ref old1,
				ref old2,
				isLoopPoint,
				isLastBlock
			);
		}

		return brrData;
	}

	/// <summary>
	/// Encode a single block of 16 samples to BRR.
	/// </summary>
	public static void EncodeBlock(ReadOnlySpan<short> samples, Span<byte> output, ref int old1, ref int old2, bool loopFlag, bool endFlag) {
		if (samples.Length < SamplesPerBlock) {
			throw new ArgumentException($"Need at least {SamplesPerBlock} samples", nameof(samples));
		}
		if (output.Length < BlockSize) {
			throw new ArgumentException($"Output must be at least {BlockSize} bytes", nameof(output));
		}

		// Find optimal filter and range
		var (bestFilter, bestRange, bestError) = FindOptimalEncoding(samples, old1, old2);

		// Build header byte
		output[0] = (byte)((bestRange << 4) | (bestFilter << 2) | (loopFlag ? 0x02 : 0) | (endFlag ? 0x01 : 0));

		// Encode samples
		int tempOld1 = old1;
		int tempOld2 = old2;

		for (int i = 0; i < 8; i++) {
			int nybble1 = EncodeNybble(samples[i * 2], bestFilter, bestRange, ref tempOld1, ref tempOld2);
			int nybble2 = EncodeNybble(samples[i * 2 + 1], bestFilter, bestRange, ref tempOld1, ref tempOld2);

			output[i + 1] = (byte)((nybble1 << 4) | (nybble2 & 0x0f));
		}

		// Update state
		old1 = tempOld1;
		old2 = tempOld2;
	}

	/// <summary>
	/// Find the optimal filter and range for encoding a block.
	/// </summary>
	private static (int filter, int range, long error) FindOptimalEncoding(ReadOnlySpan<short> samples, int old1, int old2) {
		int bestFilter = 0;
		int bestRange = 0;
		long bestError = long.MaxValue;

		for (int filter = 0; filter < 4; filter++) {
			for (int range = 0; range <= 12; range++) {
				long error = CalculateEncodingError(samples, filter, range, old1, old2);

				if (error < bestError) {
					bestError = error;
					bestFilter = filter;
					bestRange = range;
				}
			}
		}

		return (bestFilter, bestRange, bestError);
	}

	/// <summary>
	/// Calculate encoding error for a given filter and range.
	/// </summary>
	private static long CalculateEncodingError(ReadOnlySpan<short> samples, int filter, int range, int old1, int old2) {
		long totalError = 0;
		int tempOld1 = old1;
		int tempOld2 = old2;

		for (int i = 0; i < samples.Length; i++) {
			int target = samples[i];

			// Predict based on filter
			int predicted = ApplyFilter(0, filter, tempOld1, tempOld2);

			// Calculate residual
			int residual = target - predicted;

			// Quantize to 4-bit
			int nybble = residual >> range;
			nybble = Math.Clamp(nybble, -8, 7);

			// Decode back to see actual value
			int decoded = ApplyFilter(nybble << range, filter, tempOld1, tempOld2);
			decoded = Math.Clamp(decoded, short.MinValue, short.MaxValue);

			// Calculate error
			long error = target - decoded;
			totalError += error * error;

			tempOld2 = tempOld1;
			tempOld1 = decoded;
		}

		return totalError;
	}

	/// <summary>
	/// Encode a single sample to a 4-bit nybble.
	/// </summary>
	private static int EncodeNybble(short sample, int filter, int range, ref int old1, ref int old2) {
		// Predict based on filter
		int predicted = ApplyFilter(0, filter, old1, old2);

		// Calculate residual
		int residual = sample - predicted;

		// Quantize to 4-bit
		int nybble = residual >> range;
		nybble = Math.Clamp(nybble, -8, 7);

		// Decode to update state
		int decoded = ApplyFilter(nybble << range, filter, old1, old2);
		decoded = Math.Clamp(decoded, short.MinValue, short.MaxValue);

		old2 = old1;
		old1 = decoded;

		return nybble & 0x0f;
	}

	/// <summary>
	/// Apply pre-emphasis filter to improve encoding quality.
	/// Pre-emphasis boosts high frequencies which are often lost during compression.
	/// </summary>
	private static short[] ApplyPreEmphasis(ReadOnlySpan<short> samples, double coefficient = 0.95) {
		var result = new short[samples.Length];
		if (samples.Length == 0) return result;

		result[0] = samples[0];
		for (int i = 1; i < samples.Length; i++) {
			double emphasized = samples[i] - coefficient * samples[i - 1];
			result[i] = (short)Math.Clamp((int)emphasized, short.MinValue, short.MaxValue);
		}
		return result;
	}

	/// <summary>
	/// Calculate Signal-to-Noise Ratio (SNR) in decibels for encoded BRR.
	/// </summary>
	/// <param name="original">Original PCM samples.</param>
	/// <param name="decoded">Decoded samples from BRR.</param>
	/// <returns>SNR in dB. Higher is better.</returns>
	public static double CalculateSnr(ReadOnlySpan<short> original, ReadOnlySpan<short> decoded) {
		if (original.Length == 0 || decoded.Length == 0) return 0;

		int length = Math.Min(original.Length, decoded.Length);
		double signalPower = 0;
		double noisePower = 0;

		for (int i = 0; i < length; i++) {
			signalPower += (double)original[i] * original[i];
			double error = original[i] - decoded[i];
			noisePower += error * error;
		}

		if (noisePower < 0.001) return 100; // Essentially perfect
		return 10 * Math.Log10(signalPower / noisePower);
	}

	/// <summary>
	/// Encode with quality measurement. Returns BRR data and SNR in dB.
	/// </summary>
	public static (byte[] BrrData, double SnrDb) EncodeWithQuality(ReadOnlySpan<short> samples, int loopStart = -1, bool usePreEmphasis = true) {
		var brrData = Encode(samples, loopStart, usePreEmphasis);
		var decoded = Decode(brrData);

		int compareLength = Math.Min(samples.Length, decoded.Length);
		double snr = CalculateSnr(samples[..compareLength], decoded.AsSpan(0, compareLength));

		return (brrData, snr);
	}

	/// <summary>
	/// Check if the end flag is set in a BRR block header.
	/// </summary>
	public static bool IsEndBlock(byte header) => (header & 0x01) != 0;

	/// <summary>
	/// Check if the loop flag is set in a BRR block header.
	/// </summary>
	public static bool IsLoopBlock(byte header) => (header & 0x02) != 0;

	/// <summary>
	/// Get the filter mode from a BRR block header.
	/// </summary>
	public static int GetFilter(byte header) => (header >> 2) & 0x03;

	/// <summary>
	/// Get the range value from a BRR block header.
	/// </summary>
	public static int GetRange(byte header) => (header >> 4) & 0x0f;
}
