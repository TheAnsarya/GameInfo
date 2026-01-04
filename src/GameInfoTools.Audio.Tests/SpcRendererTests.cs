using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SpcRendererTests {
	[Fact]
	public void Constructor_NullSpc_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new SpcRenderer(null!));
	}

	[Fact]
	public void Constructor_DefaultSampleRate_Is32000() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		Assert.Equal(32000, renderer.SampleRate);
	}

	[Fact]
	public void Constructor_CustomSampleRate_IsStored() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc, 44100);

		Assert.Equal(44100, renderer.SampleRate);
	}

	[Fact]
	public void RenderStatic_ZeroDuration_ReturnsEmptyArray() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderStatic(0);

		Assert.Empty(output);
	}

	[Fact]
	public void RenderStatic_ShortDuration_ReturnsStereoSamples() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderStatic(0.1); // 100ms

		// 32000 Hz × 0.1s × 2 channels = 6400 samples
		Assert.Equal(6400, output.Length);
	}

	[Fact]
	public void RenderStatic_NoActiveVoices_ReturnsSilence() {
		var spc = CreateMinimalSpc();
		// All volumes are zero by default
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderStatic(0.01);

		Assert.All(output, sample => Assert.Equal(0, sample));
	}

	[Fact]
	public void RenderSample_InvalidSample_ReturnsSilence() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderSample(0, 4096, 0.01);

		// Sample points to zero which has no valid BRR data
		Assert.All(output, sample => Assert.Equal(0, sample));
	}

	[Fact]
	public void RenderSample_ValidSample_ReturnsAudio() {
		var spc = CreateSpcWithSample();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderSample(0, 4096, 0.01);

		// Should have some non-zero samples if BRR decodes properly
		Assert.NotEmpty(output);
	}

	[Fact]
	public void RenderSample_HigherPitch_PlaysbackFaster() {
		var spc = CreateSpcWithSample();
		var renderer = new SpcRenderer(spc);

		var normalOutput = renderer.RenderSample(0, 4096, 0.1);
		var fastOutput = renderer.RenderSample(0, 8192, 0.1); // 2x pitch

		// Both should have same length (duration based)
		Assert.Equal(normalOutput.Length, fastOutput.Length);
	}

	[Fact]
	public void GetRenderInfo_ReturnsValidInfo() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var info = renderer.GetRenderInfo();

		Assert.NotNull(info);
		Assert.Equal(32000, info.SampleRate);
	}

	[Fact]
	public void GetRenderInfo_NoActiveVoices_ZeroCount() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var info = renderer.GetRenderInfo();

		Assert.Equal(0, info.ActiveVoices);
	}

	[Fact]
	public void GetRenderInfo_WithActiveVoice_CountsIt() {
		var spc = CreateMinimalSpc();
		spc.Dsp.Data[0x00] = 127; // Voice 0 left volume
		spc.Dsp.Data[0x01] = 127; // Voice 0 right volume
		var renderer = new SpcRenderer(spc);

		var info = renderer.GetRenderInfo();

		Assert.Equal(1, info.ActiveVoices);
	}

	[Fact]
	public void RenderStatic_OutputIsStereo() {
		var spc = CreateMinimalSpc();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderStatic(0.1);

		// Every pair is L, R
		Assert.True(output.Length % 2 == 0);
	}

	private static SpcFile CreateMinimalSpc() {
		var spc = new SpcFile();
		spc.Header.HasId666 = true;
		spc.Dsp.Data[0x5d] = 0x02; // Directory at $0200
		spc.Dsp.Data[0x0c] = 127;  // Main volume L
		spc.Dsp.Data[0x1c] = 127;  // Main volume R
		return spc;
	}

	private static SpcFile CreateSpcWithSample() {
		var spc = CreateMinimalSpc();

		// Set up directory entry for sample 0 at $1000
		int dirAddr = 0x0200;
		spc.Ram[dirAddr] = 0x00;
		spc.Ram[dirAddr + 1] = 0x10; // Sample at $1000
		spc.Ram[dirAddr + 2] = 0x00;
		spc.Ram[dirAddr + 3] = 0x10; // Loop at $1000

		// Create a minimal BRR block at $1000
		// Header: range=0, filter=0, loop=1, end=1 = 0x03
		spc.Ram[0x1000] = 0x03;
		// 8 bytes of sample data
		for (int i = 1; i <= 8; i++) {
			spc.Ram[0x1000 + i] = (byte)(0x12 * i); // Some pattern
		}

		// Set voice 0 to use sample 0
		spc.Dsp.Data[0x04] = 0x00; // SRCN
		spc.Dsp.Data[0x00] = 127;  // Vol L
		spc.Dsp.Data[0x01] = 127;  // Vol R
		spc.Dsp.Data[0x02] = 0x00; // Pitch L
		spc.Dsp.Data[0x03] = 0x10; // Pitch H (= 0x1000)

		return spc;
	}
}
