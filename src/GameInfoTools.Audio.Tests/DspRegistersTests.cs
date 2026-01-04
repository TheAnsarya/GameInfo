using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class DspRegistersTests {
	[Fact]
	public void Constructor_CorrectSize_Succeeds() {
		var data = new byte[128];

		var dsp = new DspRegisters(data);

		Assert.Equal(128, dsp.Data.Length);
	}

	[Fact]
	public void Constructor_WrongSize_ThrowsArgumentException() {
		var data = new byte[100];

		Assert.Throws<ArgumentException>(() => new DspRegisters(data));
	}

	[Fact]
	public void GetVolumeLeft_ReturnsCorrectValue() {
		var data = new byte[128];
		data[0x00] = 0x7F; // Voice 0, max positive
		data[0x10] = 0x80; // Voice 1, max negative

		var dsp = new DspRegisters(data);

		Assert.Equal(127, dsp.GetVolumeLeft(0));
		Assert.Equal(-128, dsp.GetVolumeLeft(1));
	}

	[Fact]
	public void GetPitch_Returns14BitValue() {
		var data = new byte[128];
		data[0x02] = 0xFF;
		data[0x03] = 0x3F; // 14-bit max = 0x3FFF

		var dsp = new DspRegisters(data);

		Assert.Equal(0x3FFF, dsp.GetPitch(0));
	}

	[Fact]
	public void SetPitch_StoresCorrectly() {
		var data = new byte[128];
		var dsp = new DspRegisters(data);

		dsp.SetPitch(0, 0x1234);

		Assert.Equal(0x34, data[0x02]);
		Assert.Equal(0x12, data[0x03]);
	}

	[Fact]
	public void GetSourceNumber_ReturnsCorrectValue() {
		var data = new byte[128];
		data[0x04] = 5; // Voice 0, source 5
		data[0x14] = 10; // Voice 1, source 10

		var dsp = new DspRegisters(data);

		Assert.Equal(5, dsp.GetSourceNumber(0));
		Assert.Equal(10, dsp.GetSourceNumber(1));
	}

	[Fact]
	public void DirectoryAddress_CalculatedCorrectly() {
		var data = new byte[128];
		data[0x5D] = 0x02; // DIR = 2, address = 0x200

		var dsp = new DspRegisters(data);

		Assert.Equal(0x0200, dsp.DirectoryAddress);
	}

	[Fact]
	public void MainVolume_GetSet_Works() {
		var data = new byte[128];
		var dsp = new DspRegisters(data);

		dsp.MainVolumeLeft = 100;
		dsp.MainVolumeRight = -50;

		Assert.Equal(100, dsp.MainVolumeLeft);
		Assert.Equal(-50, dsp.MainVolumeRight);
	}

	[Fact]
	public void EchoDelay_ClampsTo4Bits() {
		var data = new byte[128];
		var dsp = new DspRegisters(data);

		dsp.EchoDelay = 0xFF; // Should be masked to 0x0F

		Assert.Equal(0x0F, dsp.EchoDelay);
	}

	[Fact]
	public void GetFirCoefficient_ValidIndex_Works() {
		var data = new byte[128];
		data[0x0F] = 0x7F;
		data[0x1F] = 0x80;

		var dsp = new DspRegisters(data);

		Assert.Equal(127, dsp.GetFirCoefficient(0));
		Assert.Equal(-128, dsp.GetFirCoefficient(1));
	}

	[Fact]
	public void GetFirCoefficient_InvalidIndex_ThrowsException() {
		var data = new byte[128];
		var dsp = new DspRegisters(data);

		Assert.Throws<ArgumentOutOfRangeException>(() => dsp.GetFirCoefficient(-1));
		Assert.Throws<ArgumentOutOfRangeException>(() => dsp.GetFirCoefficient(8));
	}

	[Fact]
	public void Clone_CreatesCopy() {
		var data = new byte[128];
		data[0x00] = 0x7F;
		var dsp = new DspRegisters(data);

		var clone = dsp.Clone();
		clone.Data[0x00] = 0x00;

		Assert.Equal(0x7F, dsp.Data[0x00]); // Original unchanged
		Assert.Equal(0x00, clone.Data[0x00]); // Clone modified
	}

	[Fact]
	public void Parse_CreatesFromSpan() {
		var data = new byte[256];
		data[0x5D] = 0x03; // DIR = 3

		var dsp = DspRegisters.Parse(data);

		Assert.Equal(0x03, dsp.DirectoryOffset);
	}
}
