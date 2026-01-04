namespace GameInfoTools.Audio.Spc;

/// <summary>
/// ADSR envelope configuration for SNES DSP voice.
/// The SNES uses a unique envelope format with Attack, Decay, Sustain Level, and Release.
/// </summary>
public record AdsrEnvelope {
	/// <summary>
	/// Raw 16-bit ADSR value from DSP registers.
	/// Format: ADSR1 (low byte), ADSR2 (high byte).
	/// ADSR1: E DDD AAAA (Enable, Decay rate, Attack rate)
	/// ADSR2: SSS RRRRR (Sustain level, Release rate)
	/// </summary>
	public ushort RawValue { get; init; }

	/// <summary>
	/// Whether ADSR mode is enabled (vs GAIN mode).
	/// </summary>
	public bool Enabled => (RawValue & 0x80) != 0;

	/// <summary>
	/// Attack rate (0-15). Higher = faster attack.
	/// Time = 4.1s × 2^(15-n) / 64 for n=0-14, instant for n=15.
	/// </summary>
	public int AttackRate => RawValue & 0x0F;

	/// <summary>
	/// Decay rate (0-7). Higher = faster decay.
	/// Time = 4.1s × 2^(7-n) / 8 for n=0-7.
	/// </summary>
	public int DecayRate => (RawValue >> 4) & 0x07;

	/// <summary>
	/// Sustain level (0-7). Level = (n+1) / 8.
	/// 0 = 12.5%, 7 = 100% (no decay to sustain).
	/// </summary>
	public int SustainLevel => (RawValue >> 8) & 0x07;

	/// <summary>
	/// Release rate (0-31). Higher = faster release.
	/// Exponential release, time varies with level.
	/// </summary>
	public int ReleaseRate => (RawValue >> 11) & 0x1F;

	/// <summary>
	/// Sustain level as a percentage (12.5% to 100%).
	/// </summary>
	public double SustainPercent => (SustainLevel + 1) * 12.5;

	/// <summary>
	/// Approximate attack time in milliseconds.
	/// </summary>
	public double AttackTimeMs {
		get {
			if (AttackRate == 15) return 0; // Instant
			// Formula: 4.1s × 2^(15-n) / 64
			return 4100.0 * Math.Pow(2, 15 - AttackRate) / 64;
		}
	}

	/// <summary>
	/// Approximate decay time in milliseconds (time to reach sustain level).
	/// </summary>
	public double DecayTimeMs {
		get {
			// Formula: 4.1s × 2^(7-n) / 8
			return 4100.0 * Math.Pow(2, 7 - DecayRate) / 8;
		}
	}

	/// <summary>
	/// Create an ADSR envelope from raw 16-bit value.
	/// </summary>
	public static AdsrEnvelope FromRaw(ushort value) => new() { RawValue = value };

	/// <summary>
	/// Create an ADSR envelope from individual parameters.
	/// </summary>
	/// <param name="attack">Attack rate 0-15.</param>
	/// <param name="decay">Decay rate 0-7.</param>
	/// <param name="sustain">Sustain level 0-7.</param>
	/// <param name="release">Release rate 0-31.</param>
	/// <param name="enabled">Whether ADSR is enabled.</param>
	public static AdsrEnvelope Create(int attack, int decay, int sustain, int release, bool enabled = true) {
		int raw = (attack & 0x0F)
				| ((decay & 0x07) << 4)
				| (enabled ? 0x80 : 0)
				| ((sustain & 0x07) << 8)
				| ((release & 0x1F) << 11);
		return new AdsrEnvelope { RawValue = (ushort)raw };
	}

	/// <summary>
	/// Get a human-readable description of the envelope.
	/// </summary>
	public override string ToString() {
		if (!Enabled) {
			return "GAIN mode (ADSR disabled)";
		}
		return $"A:{AttackRate} D:{DecayRate} S:{SustainLevel} ({SustainPercent:F1}%) R:{ReleaseRate}";
	}
}
