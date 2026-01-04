namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Validates SPC files for correctness and potential issues.
/// </summary>
public class SpcValidator {
	private readonly SpcFile _spc;
	private readonly List<ValidationIssue> _issues = [];

	public SpcValidator(SpcFile spc) {
		_spc = spc ?? throw new ArgumentNullException(nameof(spc));
	}

	/// <summary>
	/// Performs comprehensive validation of the SPC file.
	/// </summary>
	public SpcValidationReport Validate() {
		_issues.Clear();

		ValidateHeader();
		ValidateDspRegisters();
		ValidateSampleDirectory();
		ValidateSamples();
		ValidateVoiceConfiguration();
		ValidateEchoBuffer();

		return new SpcValidationReport {
			IsValid = !_issues.Any(i => i.Severity == IssueSeverity.Error),
			Issues = [.. _issues]
		};
	}

	private void ValidateHeader() {
		// Check for ID666 metadata
		if (!_spc.Header.HasId666) {
			AddWarning("HeaderNoId666", "SPC file does not have ID666 metadata");
		}

		// Check song length
		if (_spc.Header.HasId666 && _spc.Header.SongLengthSeconds == 0) {
			AddWarning("HeaderNoSongLength", "Song length is not set in ID666 metadata");
		}
	}

	private void ValidateDspRegisters() {
		var dsp = _spc.Dsp.Data;

		// Check master volume - if both are 0, there will be no sound
		if (dsp[0x0c] == 0 && dsp[0x1c] == 0) {
			AddWarning("DspZeroMainVolume", "Main volume is zero on both channels - no sound will play");
		}

		// Check for valid FLG register
		byte flg = dsp[0x6c];
		bool muted = (flg & 0x40) != 0;
		bool echoOff = (flg & 0x20) != 0;

		if (muted) {
			AddWarning("DspMuted", "DSP is muted (FLG bit 6 is set)");
		}

		// Check echo delay
		byte edl = dsp[0x7d];
		if (edl > 15) {
			AddError("DspInvalidEchoDelay", $"Echo delay value {edl} is invalid (must be 0-15)");
		}
	}

	private void ValidateSampleDirectory() {
		var dirPage = _spc.Dsp.Data[0x5d];
		int dirAddr = dirPage * 0x100;

		if (dirAddr + 4 > SpcFile.RamSize) {
			AddError("DirOutOfRange", $"Sample directory at ${dirAddr:X4} extends beyond RAM");
			return;
		}

		// Check if directory is in a sensible location
		if (dirAddr < 0x100) {
			AddWarning("DirInZeroPage", "Sample directory overlaps with zero page");
		}
	}

	private void ValidateSamples() {
		var dirPage = _spc.Dsp.Data[0x5d];
		int dirAddr = dirPage * 0x100;

		// Check each voice's sample source
		for (int voice = 0; voice < 8; voice++) {
			byte srcn = _spc.Dsp.Data[voice * 0x10 + 0x04];
			int entryAddr = dirAddr + srcn * 4;

			if (entryAddr + 4 > SpcFile.RamSize) {
				AddError($"Voice{voice}DirEntryOutOfRange",
					$"Voice {voice} sample {srcn} directory entry is out of RAM range");
				continue;
			}

			// Read sample start address
			int sampleStart = _spc.Ram[entryAddr] | (_spc.Ram[entryAddr + 1] << 8);
			int loopStart = _spc.Ram[entryAddr + 2] | (_spc.Ram[entryAddr + 3] << 8);

			if (sampleStart >= SpcFile.RamSize) {
				AddError($"Voice{voice}SampleOutOfRange",
					$"Voice {voice} sample start ${sampleStart:X4} is beyond RAM");
			}

			if (loopStart != 0 && loopStart < sampleStart) {
				AddWarning($"Voice{voice}LoopBeforeStart",
					$"Voice {voice} loop point ${loopStart:X4} is before sample start ${sampleStart:X4}");
			}

			// Check for valid BRR header at sample start
			if (sampleStart < SpcFile.RamSize && sampleStart >= 0) {
				byte header = _spc.Ram[sampleStart];
				int filter = (header >> 2) & 0x03;
				int range = (header >> 4) & 0x0f;

				if (range > 12) {
					AddWarning($"Voice{voice}InvalidRange",
						$"Voice {voice} sample has invalid range value {range} (max 12)");
				}
			}
		}
	}

	private void ValidateVoiceConfiguration() {
		byte non = _spc.Dsp.Data[0x3d]; // Noise enable
		byte eon = _spc.Dsp.Data[0x4d]; // Echo enable
		byte pmon = _spc.Dsp.Data[0x2d]; // Pitch modulation

		// Log which voices have special effects (for info purposes)
		_ = non; // Reserved for future noise analysis
		_ = eon; // Reserved for future echo analysis

		// PMON bit 0 should never be set (no source for voice 0)
		if ((pmon & 0x01) != 0) {
			AddWarning("PmonBit0Set", "PMON bit 0 is set but voice 0 has no pitch modulation source");
		}

		// Check voice volumes
		for (int voice = 0; voice < 8; voice++) {
			sbyte volL = (sbyte)_spc.Dsp.Data[voice * 0x10 + 0x00];
			sbyte volR = (sbyte)_spc.Dsp.Data[voice * 0x10 + 0x01];

			if (volL == 0 && volR == 0) {
				AddInfo($"Voice{voice}Muted", $"Voice {voice} volume is zero");
			}
		}
	}

	private void ValidateEchoBuffer() {
		byte esa = _spc.Dsp.Data[0x6d]; // Echo buffer start page
		byte edl = _spc.Dsp.Data[0x7d]; // Echo delay
		byte flg = _spc.Dsp.Data[0x6c];
		bool echoEnabled = (flg & 0x20) == 0;

		int echoStart = esa * 0x100;
		int echoSize = edl * 2048; // Each delay unit = 2048 bytes

		if (echoEnabled && echoSize > 0) {
			int echoEnd = echoStart + echoSize;

			if (echoEnd > SpcFile.RamSize) {
				AddError("EchoBufferOverflow",
					$"Echo buffer ${echoStart:X4}-${echoEnd:X4} exceeds RAM size");
			}

			// Check if echo buffer overlaps with IPL ROM area
			if (echoStart < 0xffc0 && echoEnd > 0xffc0) {
				AddWarning("EchoOverlapsIpl",
					"Echo buffer overlaps with IPL ROM region");
			}

			// Check for overlap with sample directory
			int dirAddr = _spc.Dsp.Data[0x5d] * 0x100;
			if (echoStart < dirAddr + 0x100 && echoEnd > dirAddr) {
				AddWarning("EchoOverlapsDir",
					"Echo buffer may overlap with sample directory");
			}
		}
	}

	private void AddError(string code, string message) {
		_issues.Add(new ValidationIssue {
			Severity = IssueSeverity.Error,
			Code = code,
			Message = message
		});
	}

	private void AddWarning(string code, string message) {
		_issues.Add(new ValidationIssue {
			Severity = IssueSeverity.Warning,
			Code = code,
			Message = message
		});
	}

	private void AddInfo(string code, string message) {
		_issues.Add(new ValidationIssue {
			Severity = IssueSeverity.Info,
			Code = code,
			Message = message
		});
	}
}

/// <summary>
/// Result of SPC file validation.
/// </summary>
public class SpcValidationReport {
	public bool IsValid { get; init; }
	public IReadOnlyList<ValidationIssue> Issues { get; init; } = [];

	public int ErrorCount => Issues.Count(i => i.Severity == IssueSeverity.Error);
	public int WarningCount => Issues.Count(i => i.Severity == IssueSeverity.Warning);
	public int InfoCount => Issues.Count(i => i.Severity == IssueSeverity.Info);

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"SPC Validation: {(IsValid ? "PASSED" : "FAILED")}");
		sb.AppendLine($"  Errors: {ErrorCount}, Warnings: {WarningCount}, Info: {InfoCount}");

		if (Issues.Count > 0) {
			sb.AppendLine();
			foreach (var issue in Issues.OrderBy(i => i.Severity)) {
				var prefix = issue.Severity switch {
					IssueSeverity.Error => "❌",
					IssueSeverity.Warning => "⚠️",
					IssueSeverity.Info => "ℹ️",
					_ => "?"
				};
				sb.AppendLine($"  {prefix} [{issue.Code}] {issue.Message}");
			}
		}

		return sb.ToString();
	}
}

/// <summary>
/// A validation issue found in an SPC file.
/// </summary>
public class ValidationIssue {
	public IssueSeverity Severity { get; init; }
	public required string Code { get; init; }
	public required string Message { get; init; }
}

/// <summary>
/// Severity level for validation issues.
/// </summary>
public enum IssueSeverity {
	Info,
	Warning,
	Error
}
