namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Echo and FIR filter configuration from SNES DSP.
/// The SNES has an 8-tap FIR filter for echo processing.
/// </summary>
public class EchoConfig {
	/// <summary>
	/// Number of FIR filter taps.
	/// </summary>
	public const int FirTaps = 8;

	/// <summary>
	/// FIR filter coefficients (-128 to 127 each).
	/// These coefficients define the echo's frequency response.
	/// </summary>
	public sbyte[] FirCoefficients { get; }

	/// <summary>
	/// Echo volume left (-128 to 127).
	/// </summary>
	public sbyte VolumeLeft { get; init; }

	/// <summary>
	/// Echo volume right (-128 to 127).
	/// </summary>
	public sbyte VolumeRight { get; init; }

	/// <summary>
	/// Echo feedback (-128 to 127).
	/// Higher values create more echo repeats.
	/// Values near 127 or -127 can cause feedback overflow.
	/// </summary>
	public sbyte Feedback { get; init; }

	/// <summary>
	/// Echo delay in units (0-15).
	/// Each unit = 16ms at 32kHz (2048 samples).
	/// </summary>
	public byte Delay { get; init; }

	/// <summary>
	/// Echo delay in milliseconds.
	/// </summary>
	public double DelayMs => Delay * 16.0;

	/// <summary>
	/// Echo delay in samples (at 32kHz).
	/// </summary>
	public int DelaySamples => Delay * 2048;

	/// <summary>
	/// Echo buffer size in bytes.
	/// Calculated as delay × 2KB.
	/// </summary>
	public int BufferSize => Delay * 2048;

	/// <summary>
	/// Echo buffer start address in SPC RAM.
	/// </summary>
	public ushort BufferAddress { get; init; }

	/// <summary>
	/// Which voices have echo enabled (bitmask).
	/// </summary>
	public byte EnableMask { get; init; }

	/// <summary>
	/// Check if echo is enabled for a specific voice.
	/// </summary>
	public bool IsEnabledForVoice(int voice) => (EnableMask & (1 << voice)) != 0;

	/// <summary>
	/// Number of voices with echo enabled.
	/// </summary>
	public int EnabledVoiceCount {
		get {
			int count = 0;
			for (int i = 0; i < 8; i++) {
				if (IsEnabledForVoice(i)) count++;
			}
			return count;
		}
	}

	public EchoConfig(sbyte[] firCoefficients) {
		if (firCoefficients.Length != FirTaps) {
			throw new ArgumentException($"FIR coefficients must be exactly {FirTaps} values", nameof(firCoefficients));
		}
		FirCoefficients = firCoefficients;
	}

	/// <summary>
	/// Calculate the FIR filter gain (sum of absolute coefficients).
	/// Values much greater than 128 may cause clipping.
	/// </summary>
	public int FirGain {
		get {
			int sum = 0;
			foreach (var coef in FirCoefficients) {
				sum += Math.Abs(coef);
			}
			return sum;
		}
	}

	/// <summary>
	/// Analyze the FIR filter type based on coefficients.
	/// </summary>
	public string FilterType {
		get {
			// Check for common filter patterns
			if (FirCoefficients.All(c => c == 0)) {
				return "Silent (all zeros)";
			}

			// Check for pass-through (first coef = 127, rest = 0)
			if (FirCoefficients[0] == 127 && FirCoefficients.Skip(1).All(c => c == 0)) {
				return "Pass-through";
			}

			// Check for simple delay (first coef = 0, one other high)
			if (FirCoefficients[0] == 0) {
				var nonZero = FirCoefficients.Count(c => c != 0);
				if (nonZero == 1) {
					return "Simple delay";
				}
			}

			// Check for low-pass (coefficients trend to smaller values)
			// Check for high-pass (alternating signs)
			var hasAlternating = true;
			for (int i = 1; i < FirTaps; i++) {
				if (FirCoefficients[i] != 0 && FirCoefficients[i - 1] != 0) {
					if (Math.Sign(FirCoefficients[i]) == Math.Sign(FirCoefficients[i - 1])) {
						hasAlternating = false;
						break;
					}
				}
			}

			if (hasAlternating && FirCoefficients.Any(c => c < 0) && FirCoefficients.Any(c => c > 0)) {
				return "High-pass";
			}

			if (FirCoefficients.All(c => c >= 0)) {
				return "Low-pass";
			}

			return "Custom";
		}
	}

	/// <summary>
	/// Get a description of the feedback behavior.
	/// </summary>
	public string FeedbackDescription {
		get {
			var absFeedback = Math.Abs(Feedback);
			return absFeedback switch {
				0 => "No feedback (single echo)",
				< 32 => "Light feedback",
				< 64 => "Moderate feedback",
				< 96 => "Heavy feedback",
				< 120 => "Strong feedback (may clip)",
				_ => "Extreme feedback (likely clipping)"
			};
		}
	}

	/// <summary>
	/// Create an EchoConfig from DSP registers.
	/// </summary>
	public static EchoConfig FromDspRegisters(DspRegisters dsp) {
		var fir = new sbyte[FirTaps];
		for (int i = 0; i < FirTaps; i++) {
			fir[i] = dsp.GetFirCoefficient(i);
		}

		return new EchoConfig(fir) {
			VolumeLeft = dsp.EchoVolumeLeft,
			VolumeRight = dsp.EchoVolumeRight,
			Feedback = dsp.EchoFeedback,
			Delay = dsp.EchoDelay,
			BufferAddress = (ushort)(dsp.EchoBufferOffset * 256),
			EnableMask = dsp.EchoEnable
		};
	}

	public override string ToString() {
		var voices = string.Join(",", Enumerable.Range(0, 8).Where(IsEnabledForVoice).Select(v => v + 1));
		return $"Echo: {DelayMs}ms delay, {FeedbackDescription}, {FilterType} filter, voices [{voices}]";
	}
}
