namespace GameInfoTools.Audio.Spc;

/// <summary>
/// DSP (Digital Signal Processor) register state from an SPC file.
/// Contains 128 bytes of DSP registers that control audio playback.
/// </summary>
public class DspRegisters {
	/// <summary>
	/// Total size of DSP registers.
	/// </summary>
	public const int Size = 128;

	/// <summary>
	/// Number of voices (channels) in the SNES sound chip.
	/// </summary>
	public const int VoiceCount = 8;

	/// <summary>
	/// Raw DSP register data.
	/// </summary>
	public byte[] Data { get; }

	public DspRegisters(byte[] data) {
		if (data.Length != Size) {
			throw new ArgumentException($"DSP registers must be exactly {Size} bytes", nameof(data));
		}
		Data = data;
	}

	// Per-voice registers (base + voice * 0x10)

	/// <summary>
	/// Get left volume for a voice (-128 to 127).
	/// </summary>
	public sbyte GetVolumeLeft(int voice) => (sbyte)Data[voice * 0x10];

	/// <summary>
	/// Get right volume for a voice (-128 to 127).
	/// </summary>
	public sbyte GetVolumeRight(int voice) => (sbyte)Data[voice * 0x10 + 0x01];

	/// <summary>
	/// Get pitch (14-bit) for a voice. Higher = faster playback.
	/// </summary>
	public ushort GetPitch(int voice) => (ushort)(Data[voice * 0x10 + 0x02] | ((Data[voice * 0x10 + 0x03] & 0x3f) << 8));

	/// <summary>
	/// Set pitch for a voice.
	/// </summary>
	public void SetPitch(int voice, ushort pitch) {
		Data[voice * 0x10 + 0x02] = (byte)(pitch & 0xff);
		Data[voice * 0x10 + 0x03] = (byte)((pitch >> 8) & 0x3f);
	}

	/// <summary>
	/// Get source number (sample index from directory) for a voice.
	/// </summary>
	public byte GetSourceNumber(int voice) => Data[voice * 0x10 + 0x04];

	/// <summary>
	/// Get ADSR settings for a voice.
	/// </summary>
	public ushort GetAdsr(int voice) => (ushort)(Data[voice * 0x10 + 0x05] | (Data[voice * 0x10 + 0x06] << 8));

	/// <summary>
	/// Get GAIN value for a voice.
	/// </summary>
	public byte GetGain(int voice) => Data[voice * 0x10 + 0x07];

	/// <summary>
	/// Get current envelope value for a voice (read-only in hardware).
	/// </summary>
	public byte GetEnvx(int voice) => Data[voice * 0x10 + 0x08];

	/// <summary>
	/// Get current waveform value for a voice (read-only in hardware).
	/// </summary>
	public byte GetOutx(int voice) => Data[voice * 0x10 + 0x09];

	// Global registers

	/// <summary>
	/// Main volume left (-128 to 127).
	/// </summary>
	public sbyte MainVolumeLeft {
		get => (sbyte)Data[0x0c];
		set => Data[0x0c] = (byte)value;
	}

	/// <summary>
	/// Main volume right (-128 to 127).
	/// </summary>
	public sbyte MainVolumeRight {
		get => (sbyte)Data[0x1c];
		set => Data[0x1c] = (byte)value;
	}

	/// <summary>
	/// Echo volume left (-128 to 127).
	/// </summary>
	public sbyte EchoVolumeLeft {
		get => (sbyte)Data[0x2c];
		set => Data[0x2c] = (byte)value;
	}

	/// <summary>
	/// Echo volume right (-128 to 127).
	/// </summary>
	public sbyte EchoVolumeRight {
		get => (sbyte)Data[0x3c];
		set => Data[0x3c] = (byte)value;
	}

	/// <summary>
	/// Key On - bits indicate which voices should start playing.
	/// </summary>
	public byte KeyOn {
		get => Data[0x4c];
		set => Data[0x4c] = value;
	}

	/// <summary>
	/// Key Off - bits indicate which voices should stop playing.
	/// </summary>
	public byte KeyOff {
		get => Data[0x5c];
		set => Data[0x5c] = value;
	}

	/// <summary>
	/// Flags register:
	/// Bit 5: Mute all
	/// Bit 6: Echo buffer write disable
	/// Bit 7: Reset
	/// Bits 0-4: Noise clock (frequency)
	/// </summary>
	public byte Flags {
		get => Data[0x6c];
		set => Data[0x6c] = value;
	}

	/// <summary>
	/// End flags - bits indicate which voices have reached end of sample.
	/// </summary>
	public byte EndFlags => Data[0x7c];

	/// <summary>
	/// Echo feedback (-128 to 127).
	/// </summary>
	public sbyte EchoFeedback {
		get => (sbyte)Data[0x0d];
		set => Data[0x0d] = (byte)value;
	}

	/// <summary>
	/// Pitch modulation enable (bit per voice).
	/// </summary>
	public byte PitchModulation {
		get => Data[0x2d];
		set => Data[0x2d] = value;
	}

	/// <summary>
	/// Noise enable (bit per voice).
	/// </summary>
	public byte NoiseEnable {
		get => Data[0x3d];
		set => Data[0x3d] = value;
	}

	/// <summary>
	/// Echo enable (bit per voice).
	/// </summary>
	public byte EchoEnable {
		get => Data[0x4d];
		set => Data[0x4d] = value;
	}

	/// <summary>
	/// Sample directory offset (× 256 for RAM address).
	/// </summary>
	public byte DirectoryOffset {
		get => Data[0x5d];
		set => Data[0x5d] = value;
	}

	/// <summary>
	/// Sample directory RAM address.
	/// </summary>
	public ushort DirectoryAddress => (ushort)(DirectoryOffset * 256);

	/// <summary>
	/// Echo buffer start address (× 256 for RAM address).
	/// </summary>
	public byte EchoBufferOffset {
		get => Data[0x6d];
		set => Data[0x6d] = value;
	}

	/// <summary>
	/// Echo delay (0-15, each unit = 16ms at 32kHz).
	/// </summary>
	public byte EchoDelay {
		get => Data[0x7d];
		set => Data[0x7d] = (byte)(value & 0x0f);
	}

	/// <summary>
	/// Get FIR filter coefficient (0-7).
	/// </summary>
	public sbyte GetFirCoefficient(int index) {
		if (index < 0 || index > 7) {
			throw new ArgumentOutOfRangeException(nameof(index), "FIR index must be 0-7");
		}
		return (sbyte)Data[index * 0x10 + 0x0f];
	}

	/// <summary>
	/// Set FIR filter coefficient (0-7).
	/// </summary>
	public void SetFirCoefficient(int index, sbyte value) {
		if (index < 0 || index > 7) {
			throw new ArgumentOutOfRangeException(nameof(index), "FIR index must be 0-7");
		}
		Data[index * 0x10 + 0x0f] = (byte)value;
	}

	/// <summary>
	/// Parse DSP registers from raw bytes.
	/// </summary>
	public static DspRegisters Parse(ReadOnlySpan<byte> data) {
		if (data.Length < Size) {
			throw new ArgumentException($"DSP registers require at least {Size} bytes", nameof(data));
		}
		return new DspRegisters(data[..Size].ToArray());
	}

	/// <summary>
	/// Create a copy of the DSP registers.
	/// </summary>
	public DspRegisters Clone() => new((byte[])Data.Clone());
}
