using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SpcBuilderTests {
	[Fact]
	public void Build_WithOneSample_CreatesSpcFile() {
		// Arrange
		var builder = new SpcBuilder();
		var brrData = CreateValidBrrBlock(); // 9 bytes = 1 block

		// Act
		builder.AddSample(brrData, 0, "TestSample");
		var spc = builder.Build();

		// Assert
		Assert.NotNull(spc);
		Assert.NotNull(spc.Ram);
		Assert.Equal(SpcFile.RamSize, spc.Ram.Length);
	}

	[Fact]
	public void Build_WithMetadata_SetsHeaderFields() {
		// Arrange
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.SetMetadata(
			songTitle: "Test Song",
			gameTitle: "Test Game",
			artistName: "Test Artist"
		);

		// Act
		var spc = builder.Build();

		// Assert
		Assert.Equal("Test Song", spc.Header.SongTitle);
		Assert.Equal("Test Game", spc.Header.GameTitle);
	}

	[Fact]
	public void AddSample_InvalidBrrLength_ThrowsArgumentException() {
		var builder = new SpcBuilder();
		var invalidBrr = new byte[10]; // Not a multiple of 9

		Assert.Throws<ArgumentException>(() => builder.AddSample(invalidBrr));
	}

	[Fact]
	public void AddSample_ReturnsSequentialIndices() {
		var builder = new SpcBuilder();

		var index0 = builder.AddSample(CreateValidBrrBlock(), name: "Sample0");
		var index1 = builder.AddSample(CreateValidBrrBlock(), name: "Sample1");
		var index2 = builder.AddSample(CreateValidBrrBlock(), name: "Sample2");

		Assert.Equal(0, index0);
		Assert.Equal(1, index1);
		Assert.Equal(2, index2);
		Assert.Equal(3, builder.SampleCount);
	}

	[Fact]
	public void GetMemoryAnalysis_CalculatesCorrectUsage() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock()); // 9 bytes
		builder.AddSample(CreateValidBrrBlock()); // 9 bytes

		var analysis = builder.GetMemoryAnalysis();

		Assert.Equal(2, analysis.SampleCount);
		Assert.Equal(18, analysis.TotalSampleBytes); // 2 × 9 bytes
		Assert.Equal(8, analysis.DirectorySize); // 2 × 4 bytes
		Assert.Equal(SpcFile.RamSize, analysis.TotalRam);
	}

	[Fact]
	public void TotalSampleRamUsage_IncludesDirectoryAndData() {
		var builder = new SpcBuilder();
		builder.AddSample(new byte[9 * 10]); // 90 bytes (10 blocks)

		// Should include: directory (4 bytes) + sample data (90 bytes)
		Assert.Equal(94, builder.TotalSampleRamUsage);
	}

	[Fact]
	public void Validate_NoSamples_ReturnsInvalid() {
		var builder = new SpcBuilder();

		var result = builder.Validate();

		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Contains("No samples"));
	}

	[Fact]
	public void Validate_ValidConfiguration_ReturnsValid() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.ConfigureVoice(0, sourceNumber: 0);

		var result = builder.Validate();

		Assert.True(result.IsValid);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Validate_VoiceReferencesNonexistentSample_AddsWarning() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock()); // Only sample 0 exists
		builder.ConfigureVoice(0, sourceNumber: 5); // References sample 5

		var result = builder.Validate();

		// This is a warning, not an error
		Assert.Contains(result.Warnings, w => w.Contains("sample 5"));
	}

	[Fact]
	public void ConfigureVoice_SetsCorrectDspRegisters() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.ConfigureVoice(
			voiceIndex: 0,
			sourceNumber: 0,
			volumeLeft: 100,
			volumeRight: 80,
			pitch: 0x1000
		);

		var spc = builder.Build();

		// Voice 0 registers start at $00
		Assert.Equal(100, spc.Dsp.GetVolumeLeft(0));
		Assert.Equal(80, spc.Dsp.GetVolumeRight(0));
		Assert.Equal(0x1000, spc.Dsp.GetPitch(0));
		Assert.Equal(0, spc.Dsp.GetSourceNumber(0));
	}

	[Fact]
	public void ConfigureVoice_InvalidIndex_ThrowsArgumentOutOfRangeException() {
		var builder = new SpcBuilder();

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			builder.ConfigureVoice(8, sourceNumber: 0));
	}

	[Fact]
	public void SetMainVolume_SetsCorrectRegisters() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.SetMainVolume(100, 80);

		var spc = builder.Build();

		Assert.Equal(100, (sbyte)spc.Dsp.Data[0x0c]); // MVOL L
		Assert.Equal(80, (sbyte)spc.Dsp.Data[0x1c]); // MVOL R
	}

	[Fact]
	public void SetEcho_ConfiguresEchoParameters() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		var fir = new sbyte[] { 127, 0, 0, 0, 0, 0, 0, 0 };
		builder.SetEcho(delay: 8, volumeLeft: 50, volumeRight: 50, feedback: 40, fir);

		var spc = builder.Build();

		Assert.Equal(50, (sbyte)spc.Dsp.Data[0x2c]); // EVOL L
		Assert.Equal(50, (sbyte)spc.Dsp.Data[0x3c]); // EVOL R
		Assert.Equal(40, (sbyte)spc.Dsp.Data[0x0d]); // EFB
		Assert.Equal(8, spc.Dsp.Data[0x7d]); // EDL
	}

	[Fact]
	public void SetEcho_InvalidDelay_ThrowsArgumentOutOfRangeException() {
		var builder = new SpcBuilder();
		var fir = new sbyte[8];

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			builder.SetEcho(16, 0, 0, 0, fir)); // Delay must be 0-15
	}

	[Fact]
	public void SetEcho_InvalidFirLength_ThrowsArgumentException() {
		var builder = new SpcBuilder();
		var fir = new sbyte[7]; // Must be exactly 8

		Assert.Throws<ArgumentException>(() =>
			builder.SetEcho(8, 0, 0, 0, fir));
	}

	[Fact]
	public void SetNoiseClock_SetsClockBits() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.SetNoiseClock(15);

		var spc = builder.Build();

		Assert.Equal(15, spc.Dsp.Data[0x6c] & 0x1f);
	}

	[Fact]
	public void SetNoiseClock_InvalidValue_ThrowsArgumentOutOfRangeException() {
		var builder = new SpcBuilder();

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			builder.SetNoiseClock(32)); // Must be 0-31
	}

	[Fact]
	public void Build_WritesSampleDirectory() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock(), name: "Sample0");

		var spc = builder.Build();

		// Default directory address is 0x0200
		// First entry should have valid start/loop addresses
		int dirAddr = SpcBuilder.DefaultDirectoryAddress;
		ushort startAddr = (ushort)(spc.Ram[dirAddr] | (spc.Ram[dirAddr + 1] << 8));
		ushort loopAddr = (ushort)(spc.Ram[dirAddr + 2] | (spc.Ram[dirAddr + 3] << 8));

		Assert.True(startAddr > dirAddr); // Sample data comes after directory
		Assert.True(loopAddr >= startAddr); // Loop at or after start
	}

	[Fact]
	public void Build_WritesSampleData() {
		var builder = new SpcBuilder();
		var brrData = new byte[] { 0x03, 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde, 0xf0 };
		builder.AddSample(brrData);

		var spc = builder.Build();

		// Find sample data location from directory
		int dirAddr = SpcBuilder.DefaultDirectoryAddress;
		ushort startAddr = (ushort)(spc.Ram[dirAddr] | (spc.Ram[dirAddr + 1] << 8));

		// Verify sample data was written
		Assert.Equal(brrData, spc.Ram.AsSpan(startAddr, 9).ToArray());
	}

	[Fact]
	public void SetDirectoryAddress_ChangesDirectoryLocation() {
		var builder = new SpcBuilder();
		builder.SetDirectoryAddress(0x0300);
		builder.AddSample(CreateValidBrrBlock());

		var spc = builder.Build();

		// Directory register should point to new address
		Assert.Equal(0x03, spc.Dsp.Data[0x5d]); // DIR register = high byte of directory
	}

	[Fact]
	public void SetTiming_SetsPlaybackLength() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.SetTiming(playLengthSeconds: 120, fadeOutMs: 5000);

		var spc = builder.Build();

		Assert.Equal(120, spc.Header.SongLengthSeconds);
		Assert.Equal(5000, spc.Header.FadeLengthMs);
	}

	[Fact]
	public void Build_NoSamples_ThrowsInvalidOperationException() {
		var builder = new SpcBuilder();

		Assert.Throws<InvalidOperationException>(() => builder.Build());
	}

	[Fact]
	public void MemoryAnalysis_ToString_FormatsCorrectly() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock(), name: "Kick");
		builder.AddSample(CreateValidBrrBlock(), name: "Snare");

		var analysis = builder.GetMemoryAnalysis();
		var output = analysis.ToString();

		Assert.Contains("SPC Memory Analysis", output);
		Assert.Contains("Kick", output);
		Assert.Contains("Snare", output);
	}

	[Fact]
	public void ValidationResult_ToString_IncludesErrorsAndWarnings() {
		var builder = new SpcBuilder();
		builder.AddSample(CreateValidBrrBlock());
		builder.ConfigureVoice(0, sourceNumber: 99); // Invalid source

		var result = builder.Validate();
		var output = result.ToString();

		Assert.Contains("WARNING", output);
	}

	private static byte[] CreateValidBrrBlock() {
		// Create a simple valid BRR block (9 bytes)
		// Header byte: End=0, Loop=0, Filter=0, Range=0
		return [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
	}
}

public class MemoryAnalysisTests {
	[Fact]
	public void UsagePercent_CalculatesCorrectly() {
		var analysis = new MemoryAnalysis {
			TotalRam = 65536,
			DirectorySize = 4,
			TotalSampleBytes = 6550 // ~10% usage
		};

		Assert.True(analysis.UsagePercent > 9.9 && analysis.UsagePercent < 10.1);
	}
}
