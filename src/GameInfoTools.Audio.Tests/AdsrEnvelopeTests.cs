using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class AdsrEnvelopeTests {
	[Fact]
	public void FromRaw_AllZero_ReturnsDisabled() {
		var adsr = AdsrEnvelope.FromRaw(0x0000);

		Assert.False(adsr.Enabled);
		Assert.Equal(0, adsr.AttackRate);
		Assert.Equal(0, adsr.DecayRate);
		Assert.Equal(0, adsr.SustainLevel);
		Assert.Equal(0, adsr.ReleaseRate);
	}

	[Fact]
	public void FromRaw_EnableBitSet_ReturnsEnabled() {
		var adsr = AdsrEnvelope.FromRaw(0x0080);

		Assert.True(adsr.Enabled);
	}

	[Fact]
	public void AttackRate_ExtractedCorrectly() {
		// Attack rate is bits 0-3
		var adsr = AdsrEnvelope.FromRaw(0x000F);

		Assert.Equal(15, adsr.AttackRate);
	}

	[Fact]
	public void DecayRate_ExtractedCorrectly() {
		// Decay rate is bits 4-6
		var adsr = AdsrEnvelope.FromRaw(0x0070);

		Assert.Equal(7, adsr.DecayRate);
	}

	[Fact]
	public void SustainLevel_ExtractedCorrectly() {
		// Sustain level is bits 8-10
		var adsr = AdsrEnvelope.FromRaw(0x0700);

		Assert.Equal(7, adsr.SustainLevel);
	}

	[Fact]
	public void ReleaseRate_ExtractedCorrectly() {
		// Release rate is bits 11-15
		var adsr = AdsrEnvelope.FromRaw(0xF800);

		Assert.Equal(31, adsr.ReleaseRate);
	}

	[Fact]
	public void SustainPercent_Level0_Returns12Point5() {
		var adsr = AdsrEnvelope.FromRaw(0x0000);

		Assert.Equal(12.5, adsr.SustainPercent);
	}

	[Fact]
	public void SustainPercent_Level7_Returns100() {
		var adsr = AdsrEnvelope.FromRaw(0x0700);

		Assert.Equal(100.0, adsr.SustainPercent);
	}

	[Fact]
	public void AttackTimeMs_Rate15_ReturnsZero() {
		var adsr = AdsrEnvelope.FromRaw(0x000F);

		Assert.Equal(0, adsr.AttackTimeMs);
	}

	[Fact]
	public void AttackTimeMs_Rate0_ReturnsLargeValue() {
		var adsr = AdsrEnvelope.FromRaw(0x0000);

		// Rate 0 should be the slowest attack
		Assert.True(adsr.AttackTimeMs > 1000); // More than 1 second
	}

	[Fact]
	public void Create_RoundTrips_AllParameters() {
		var adsr = AdsrEnvelope.Create(
			attack: 10,
			decay: 5,
			sustain: 6,
			release: 20,
			enabled: true
		);

		Assert.True(adsr.Enabled);
		Assert.Equal(10, adsr.AttackRate);
		Assert.Equal(5, adsr.DecayRate);
		Assert.Equal(6, adsr.SustainLevel);
		Assert.Equal(20, adsr.ReleaseRate);
	}

	[Fact]
	public void ToString_WhenDisabled_ReturnsGainMode() {
		var adsr = AdsrEnvelope.FromRaw(0x0000);

		Assert.Contains("GAIN mode", adsr.ToString());
	}

	[Fact]
	public void ToString_WhenEnabled_ReturnsAdsrValues() {
		var adsr = AdsrEnvelope.Create(5, 3, 4, 15, enabled: true);

		var str = adsr.ToString();
		Assert.Contains("A:5", str);
		Assert.Contains("D:3", str);
		Assert.Contains("S:4", str);
		Assert.Contains("R:15", str);
	}

	[Fact]
	public void RawValue_PreservedExactly() {
		ushort expected = 0xABCD;
		var adsr = AdsrEnvelope.FromRaw(expected);

		Assert.Equal(expected, adsr.RawValue);
	}
}
