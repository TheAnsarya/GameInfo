using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class EchoConfigTests {
	[Fact]
	public void Constructor_Correct8Coefficients_Succeeds() {
		var fir = new sbyte[8] { 127, 0, 0, 0, 0, 0, 0, 0 };

		var echo = new EchoConfig(fir);

		Assert.Equal(8, echo.FirCoefficients.Length);
	}

	[Fact]
	public void Constructor_WrongCoefficientCount_ThrowsException() {
		var fir = new sbyte[4];

		Assert.Throws<ArgumentException>(() => new EchoConfig(fir));
	}

	[Fact]
	public void DelayMs_CalculatedCorrectly() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { Delay = 8 };

		Assert.Equal(128.0, echo.DelayMs);
	}

	[Fact]
	public void DelaySamples_CalculatedCorrectly() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { Delay = 4 };

		Assert.Equal(8192, echo.DelaySamples); // 4 × 2048
	}

	[Fact]
	public void BufferSize_CalculatedCorrectly() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { Delay = 3 };

		Assert.Equal(6144, echo.BufferSize); // 3 × 2048
	}

	[Fact]
	public void IsEnabledForVoice_ChecksCorrectBit() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { EnableMask = 0b00100101 };

		Assert.True(echo.IsEnabledForVoice(0));
		Assert.False(echo.IsEnabledForVoice(1));
		Assert.True(echo.IsEnabledForVoice(2));
		Assert.False(echo.IsEnabledForVoice(3));
		Assert.False(echo.IsEnabledForVoice(4));
		Assert.True(echo.IsEnabledForVoice(5));
	}

	[Fact]
	public void EnabledVoiceCount_CountsCorrectly() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { EnableMask = 0b00100101 };

		Assert.Equal(3, echo.EnabledVoiceCount);
	}

	[Fact]
	public void FirGain_SumsAbsoluteValues() {
		var fir = new sbyte[8] { 64, -32, 16, -8, 4, -2, 1, 0 };
		var echo = new EchoConfig(fir);

		Assert.Equal(127, echo.FirGain); // 64+32+16+8+4+2+1
	}

	[Fact]
	public void FilterType_AllZeros_ReturnsSilent() {
		var fir = new sbyte[8] { 0, 0, 0, 0, 0, 0, 0, 0 };
		var echo = new EchoConfig(fir);

		Assert.Equal("Silent (all zeros)", echo.FilterType);
	}

	[Fact]
	public void FilterType_PassThrough_ReturnsPassThrough() {
		var fir = new sbyte[8] { 127, 0, 0, 0, 0, 0, 0, 0 };
		var echo = new EchoConfig(fir);

		Assert.Equal("Pass-through", echo.FilterType);
	}

	[Fact]
	public void FilterType_AllPositive_ReturnsLowPass() {
		var fir = new sbyte[8] { 32, 32, 32, 32, 0, 0, 0, 0 };
		var echo = new EchoConfig(fir);

		Assert.Equal("Low-pass", echo.FilterType);
	}

	[Fact]
	public void FeedbackDescription_Zero_ReturnsSingleEcho() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { Feedback = 0 };

		Assert.Equal("No feedback (single echo)", echo.FeedbackDescription);
	}

	[Fact]
	public void FeedbackDescription_High_ReturnsStrongFeedback() {
		var fir = new sbyte[8];
		var echo = new EchoConfig(fir) { Feedback = 100 };

		Assert.Contains("Strong feedback", echo.FeedbackDescription);
	}

	[Fact]
	public void FromDspRegisters_ExtractsAllValues() {
		var dspData = new byte[128];
		// Set FIR coefficients (registers 0x0F, 0x1F, 0x2F, etc.)
		dspData[0x0F] = 64;  // FIR0
		dspData[0x1F] = 32;  // FIR1
		dspData[0x2F] = 16;  // FIR2
		// Set echo registers
		dspData[0x2C] = 50;  // Echo volume left
		dspData[0x3C] = 60;  // Echo volume right
		dspData[0x0D] = 40;  // Echo feedback
		dspData[0x7D] = 8;   // Echo delay
		dspData[0x6D] = 0x40; // Echo buffer offset
		dspData[0x4D] = 0x0F; // Echo enable (voices 0-3)

		var dsp = new DspRegisters(dspData);
		var echo = EchoConfig.FromDspRegisters(dsp);

		Assert.Equal(64, echo.FirCoefficients[0]);
		Assert.Equal(32, echo.FirCoefficients[1]);
		Assert.Equal(16, echo.FirCoefficients[2]);
		Assert.Equal(50, echo.VolumeLeft);
		Assert.Equal(60, echo.VolumeRight);
		Assert.Equal(40, echo.Feedback);
		Assert.Equal(8, echo.Delay);
		Assert.Equal(0x4000, echo.BufferAddress);
		Assert.Equal(0x0F, echo.EnableMask);
	}

	[Fact]
	public void ToString_ContainsRelevantInfo() {
		var fir = new sbyte[8] { 127, 0, 0, 0, 0, 0, 0, 0 };
		var echo = new EchoConfig(fir) {
			Delay = 4,
			Feedback = 30,
			EnableMask = 0x03
		};

		var str = echo.ToString();
		Assert.Contains("64ms", str);
		Assert.Contains("1,2", str); // voices enabled
	}
}
