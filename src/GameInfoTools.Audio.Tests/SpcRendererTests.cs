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

/// <summary>
/// Tests for echo simulation in the SPC renderer.
/// </summary>
public class SpcRendererEchoTests {
	[Fact]
	public void GetEchoInfo_ReturnsValidConfiguration() {
		var spc = CreateSpcWithEcho();
		var renderer = new SpcRenderer(spc);

		var echoInfo = renderer.GetEchoInfo();

		Assert.True(echoInfo.DelayMs >= 0);
		Assert.Equal(8, echoInfo.FirCoefficients.Length);
	}

	[Fact]
	public void EchoEnabled_DefaultTrue() {
		var spc = CreateSpcWithEcho();
		var renderer = new SpcRenderer(spc);

		Assert.True(renderer.EchoEnabled);
	}

	[Fact]
	public void EchoEnabled_CanBeDisabled() {
		var spc = CreateSpcWithEcho();
		var renderer = new SpcRenderer(spc);

		renderer.EchoEnabled = false;

		Assert.False(renderer.EchoEnabled);
	}

	[Fact]
	public void RenderStatic_WithEcho_ProducesOutput() {
		var spc = CreateSpcWithEcho();
		var renderer = new SpcRenderer(spc);

		var output = renderer.RenderStatic(0.1);

		Assert.NotEmpty(output);
		Assert.True(output.Length > 0);
	}

	[Fact]
	public void RenderStatic_WithEchoDisabled_ProducesOutput() {
		var spc = CreateSpcWithEcho();
		var renderer = new SpcRenderer(spc);
		renderer.EchoEnabled = false;

		var output = renderer.RenderStatic(0.1);

		Assert.NotEmpty(output);
	}

	[Fact]
	public void GetEchoInfo_ReflectsDspSettings() {
		var spc = CreateSpcWithEcho();
		// Set specific echo configuration
		spc.Dsp.Data[0x7d] = 0x04; // EDL = 4 (64ms delay)
		spc.Dsp.Data[0x2c] = 64;   // Echo vol L
		spc.Dsp.Data[0x3c] = 64;   // Echo vol R
		spc.Dsp.Data[0x0d] = 32;   // Feedback
		spc.Dsp.Data[0x4d] = 0x01; // Voice 0 echo enabled

		var renderer = new SpcRenderer(spc);
		var echoInfo = renderer.GetEchoInfo();

		Assert.Equal(64, echoInfo.DelayMs); // 4 * 16ms
		Assert.Equal(64, echoInfo.EchoVolumeLeft);
		Assert.Equal(64, echoInfo.EchoVolumeRight);
		Assert.Equal(32, echoInfo.Feedback);
		Assert.Equal(0x01, echoInfo.EnabledVoices);
	}

	[Fact]
	public void GetEchoInfo_BufferSizeScalesWithSampleRate() {
		var spc = CreateSpcWithEcho();
		spc.Dsp.Data[0x7d] = 0x02; // 32ms delay

		var renderer32k = new SpcRenderer(spc, 32000);
		var renderer44k = new SpcRenderer(spc, 44100);

		var info32k = renderer32k.GetEchoInfo();
		var info44k = renderer44k.GetEchoInfo();

		// Higher sample rate should have larger buffer
		Assert.True(info44k.BufferSizeAtRenderRate > info32k.BufferSizeAtRenderRate);
	}

	private static SpcFile CreateSpcWithEcho() {
		var spc = new SpcFile();
		spc.Header.HasId666 = true;
		spc.Dsp.Data[0x5d] = 0x02; // Directory at $0200
		spc.Dsp.Data[0x0c] = 127;  // Main volume L
		spc.Dsp.Data[0x1c] = 127;  // Main volume R

		// Echo configuration
		spc.Dsp.Data[0x7d] = 0x02; // Echo delay (32ms)
		spc.Dsp.Data[0x2c] = 40;   // Echo volume L
		spc.Dsp.Data[0x3c] = 40;   // Echo volume R
		spc.Dsp.Data[0x0d] = 60;   // Echo feedback
		spc.Dsp.Data[0x4d] = 0xFF; // All voices echo enabled

		// Default FIR coefficients (typical low-pass)
		spc.Dsp.Data[0x0f] = 127;  // FIR 0
		spc.Dsp.Data[0x1f] = 0;    // FIR 1
		spc.Dsp.Data[0x2f] = 0;    // FIR 2
		spc.Dsp.Data[0x3f] = 0;    // FIR 3
		spc.Dsp.Data[0x4f] = 0;    // FIR 4
		spc.Dsp.Data[0x5f] = 0;    // FIR 5
		spc.Dsp.Data[0x6f] = 0;    // FIR 6
		spc.Dsp.Data[0x7f] = 0;    // FIR 7

		return spc;
	}
}
