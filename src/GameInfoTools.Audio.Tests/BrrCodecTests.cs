using GameInfoTools.Audio.Brr;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class BrrCodecTests {
	[Fact]
	public void Decode_EmptyData_ReturnsEmptyArray() {
		// Empty data (0 bytes) is technically valid - 0 is a multiple of 9
		var result = BrrCodec.Decode([]);
		Assert.Empty(result);
	}

	[Fact]
	public void Decode_InvalidLength_ThrowsArgumentException() {
		// BRR data must be multiple of 9 bytes
		Assert.Throws<ArgumentException>(() => BrrCodec.Decode(new byte[10]));
	}

	[Fact]
	public void Decode_SingleBlock_Returns16Samples() {
		// Create a simple BRR block: header + 8 data bytes
		var brrBlock = new byte[9];
		brrBlock[0] = 0x00; // Range=0, Filter=0, no loop, not end

		var samples = BrrCodec.Decode(brrBlock);

		Assert.Equal(16, samples.Length);
	}

	[Fact]
	public void Decode_MultipleBlocks_ReturnsCorrectSampleCount() {
		var brrData = new byte[27]; // 3 blocks * 9 bytes

		var samples = BrrCodec.Decode(brrData);

		Assert.Equal(48, samples.Length); // 3 blocks * 16 samples
	}

	[Fact]
	public void Decode_SilentBlock_AllZeros() {
		var brrBlock = new byte[9];
		brrBlock[0] = 0x00; // Range=0, Filter=0

		var samples = BrrCodec.Decode(brrBlock);

		Assert.All(samples, s => Assert.Equal(0, s));
	}

	[Fact]
	public void Decode_Filter0_NoFiltering() {
		// Create block with filter 0 (no prediction)
		var brrBlock = new byte[9];
		brrBlock[0] = 0x40; // Range=4, Filter=0
		brrBlock[1] = 0x12; // Two nybbles: 1 and 2

		var samples = BrrCodec.Decode(brrBlock);

		// With range=4 and filter=0, sample = nybble << 4
		Assert.Equal(16, samples[0]); // 1 << 4
		Assert.Equal(32, samples[1]); // 2 << 4
	}

	[Fact]
	public void Encode_EmptySamples_ReturnsEmptyArray() {
		var brr = BrrCodec.Encode([]);

		Assert.Empty(brr);
	}

	[Fact]
	public void Encode_16Samples_Returns9Bytes() {
		var samples = new short[16];

		var brr = BrrCodec.Encode(samples);

		Assert.Equal(9, brr.Length);
	}

	[Fact]
	public void Encode_32Samples_Returns18Bytes() {
		var samples = new short[32];

		var brr = BrrCodec.Encode(samples);

		Assert.Equal(18, brr.Length);
	}

	[Fact]
	public void Encode_WithLoop_SetsLoopFlag() {
		var samples = new short[32];

		var brr = BrrCodec.Encode(samples, loopStart: 0);

		// First block should have loop flag set (bit 1)
		Assert.True((brr[0] & 0x02) != 0, "Loop flag should be set on first block");
	}

	[Fact]
	public void Encode_LastBlock_SetsEndFlag() {
		var samples = new short[16];

		var brr = BrrCodec.Encode(samples);

		// End flag is bit 0
		Assert.True((brr[0] & 0x01) != 0, "End flag should be set on last block");
	}

	[Fact]
	public void RoundTrip_SilentAudio_PreservesZeros() {
		var original = new short[32];

		var encoded = BrrCodec.Encode(original);
		var decoded = BrrCodec.Decode(encoded);

		Assert.Equal(original.Length, decoded.Length);
		Assert.All(decoded, s => Assert.Equal(0, s));
	}

	[Fact]
	public void RoundTrip_SimpleWaveform_ApproximatesOriginal() {
		// Create a simple sine-like pattern
		var original = new short[16];
		for (int i = 0; i < 16; i++) {
			original[i] = (short)(Math.Sin(i * Math.PI / 8) * 16000);
		}

		var encoded = BrrCodec.Encode(original);
		var decoded = BrrCodec.Decode(encoded);

		// BRR is lossy, so we check for approximate match
		// Allow up to 20% error for each sample
		for (int i = 0; i < 16; i++) {
			var maxError = Math.Max(Math.Abs(original[i]) * 0.2, 1000);
			Assert.InRange(decoded[i], original[i] - maxError, original[i] + maxError);
		}
	}

	[Theory]
	[InlineData(0)]
	[InlineData(1)]
	[InlineData(2)]
	[InlineData(3)]
	public void GetFilter_ReturnsCorrectValue(int expectedFilter) {
		byte header = (byte)(expectedFilter << 2);

		int actualFilter = BrrCodec.GetFilter(header);

		Assert.Equal(expectedFilter, actualFilter);
	}

	[Theory]
	[InlineData(0)]
	[InlineData(5)]
	[InlineData(12)]
	public void GetRange_ReturnsCorrectValue(int expectedRange) {
		byte header = (byte)(expectedRange << 4);

		int actualRange = BrrCodec.GetRange(header);

		Assert.Equal(expectedRange, actualRange);
	}

	[Fact]
	public void IsEndBlock_EndFlagSet_ReturnsTrue() {
		byte header = 0x01;

		Assert.True(BrrCodec.IsEndBlock(header));
	}

	[Fact]
	public void IsEndBlock_EndFlagNotSet_ReturnsFalse() {
		byte header = 0x00;

		Assert.False(BrrCodec.IsEndBlock(header));
	}

	[Fact]
	public void IsLoopBlock_LoopFlagSet_ReturnsTrue() {
		byte header = 0x02;

		Assert.True(BrrCodec.IsLoopBlock(header));
	}

	[Fact]
	public void IsLoopBlock_LoopFlagNotSet_ReturnsFalse() {
		byte header = 0x00;

		Assert.False(BrrCodec.IsLoopBlock(header));
	}
}
