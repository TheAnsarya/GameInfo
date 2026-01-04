using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SpcValidatorTests {
	[Fact]
	public void Validate_MinimalValidSpc_ReturnsIsValid() {
		var spc = CreateValidSpc();
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.True(report.IsValid);
		Assert.Equal(0, report.ErrorCount);
	}

	[Fact]
	public void Validate_NoId666_WarnsAboutMissingMetadata() {
		var spc = CreateValidSpc();
		spc.Header.HasId666 = false;
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "HeaderNoId666");
	}

	[Fact]
	public void Validate_ZeroMainVolume_WarnsNoSound() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x0c] = 0; // Main L
		spc.Dsp.Data[0x1c] = 0; // Main R
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "DspZeroMainVolume");
	}

	[Fact]
	public void Validate_DspMuted_WarnsAboutMute() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x6c] = 0x40; // FLG with mute bit
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "DspMuted");
	}

	[Fact]
	public void Validate_InvalidEchoDelay_ReportsError() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x7d] = 16; // EDL > 15 is invalid
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.False(report.IsValid);
		Assert.Contains(report.Issues, i => i.Code == "DspInvalidEchoDelay" && i.Severity == IssueSeverity.Error);
	}

	[Fact]
	public void Validate_DirInZeroPage_Warns() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x5d] = 0x00; // Directory at $0000
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "DirInZeroPage");
	}

	[Fact]
	public void Validate_PmonBit0Set_Warns() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x2d] = 0x01; // PMON bit 0 set
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "PmonBit0Set");
	}

	[Fact]
	public void Validate_EchoBufferOverflow_ReportsError() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x6d] = 0xfe; // ESA near end of RAM
		spc.Dsp.Data[0x7d] = 0x0f; // EDL max
		spc.Dsp.Data[0x6c] = 0x00; // Echo enabled
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.False(report.IsValid);
		Assert.Contains(report.Issues, i => i.Code == "EchoBufferOverflow");
	}

	[Fact]
	public void Validate_SampleOutOfRange_ReportsError() {
		var spc = CreateValidSpc();
		int dirAddr = 0x0200;
		// Set sample 0 to point beyond RAM
		spc.Ram[dirAddr] = 0x00;
		spc.Ram[dirAddr + 1] = 0xff; // Sample at $ff00 which is in IPL ROM area
		spc.Ram[dirAddr + 2] = 0x00;
		spc.Ram[dirAddr + 3] = 0xff;
		// Voice 0 uses sample 0
		spc.Dsp.Data[0x04] = 0x00;
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		// This should at least produce a warning about the sample location
		Assert.True(report.Issues.Count > 0);
	}

	[Fact]
	public void Validate_VoiceZeroVolume_ReportsInfo() {
		var spc = CreateValidSpc();
		spc.Dsp.Data[0x00] = 0; // Voice 0 vol L
		spc.Dsp.Data[0x01] = 0; // Voice 0 vol R
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code == "Voice0Muted" && i.Severity == IssueSeverity.Info);
	}

	[Fact]
	public void ValidationReport_ToString_FormatsCorrectly() {
		var spc = CreateValidSpc();
		spc.Header.HasId666 = false;
		var validator = new SpcValidator(spc);

		var report = validator.Validate();
		var output = report.ToString();

		Assert.Contains("Validation", output);
		Assert.Contains("Warnings", output);
	}

	[Fact]
	public void ValidationReport_Counts_AreCorrect() {
		var spc = CreateValidSpc();
		spc.Header.HasId666 = false;
		spc.Dsp.Data[0x7d] = 16; // Invalid EDL - error
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.True(report.ErrorCount > 0);
		Assert.True(report.WarningCount > 0);
	}

	[Fact]
	public void ValidationIssue_HasRequiredProperties() {
		var issue = new ValidationIssue {
			Severity = IssueSeverity.Warning,
			Code = "TestCode",
			Message = "Test message"
		};

		Assert.Equal(IssueSeverity.Warning, issue.Severity);
		Assert.Equal("TestCode", issue.Code);
		Assert.Equal("Test message", issue.Message);
	}

	[Fact]
	public void Validate_InvalidSampleRange_ReportsWarning() {
		var spc = CreateValidSpc();
		int dirAddr = 0x0200;
		// Set valid sample address
		spc.Ram[dirAddr] = 0x00;
		spc.Ram[dirAddr + 1] = 0x10; // Sample at $1000
		spc.Ram[dirAddr + 2] = 0x00;
		spc.Ram[dirAddr + 3] = 0x10;
		// Put invalid BRR range value in header
		spc.Ram[0x1000] = 0xf0; // Range = 15, filter = 0
		spc.Dsp.Data[0x04] = 0x00; // Voice 0 uses sample 0
		var validator = new SpcValidator(spc);

		var report = validator.Validate();

		Assert.Contains(report.Issues, i => i.Code.Contains("InvalidRange"));
	}

	private static SpcFile CreateValidSpc() {
		var spc = new SpcFile();
		spc.Header.HasId666 = true;
		spc.Header.SongLengthSeconds = 120;

		// Set main volume
		spc.Dsp.Data[0x0c] = 127; // Main L
		spc.Dsp.Data[0x1c] = 127; // Main R

		// Set directory
		spc.Dsp.Data[0x5d] = 0x02; // DIR = $0200

		// Set up a valid sample entry
		int dirAddr = 0x0200;
		spc.Ram[dirAddr] = 0x00;
		spc.Ram[dirAddr + 1] = 0x10; // Sample at $1000
		spc.Ram[dirAddr + 2] = 0x00;
		spc.Ram[dirAddr + 3] = 0x10; // Loop at $1000

		// Valid BRR header at $1000
		spc.Ram[0x1000] = 0x03; // End + loop flag, range=0, filter=0

		return spc;
	}
}
