namespace GameInfoTools.Audio.Spc;

/// <summary>
/// SPC file header (256 bytes) - Contains metadata and initial register state.
/// </summary>
public class SpcHeader {
	/// <summary>
	/// File signature - should be "SNES-SPC700 Sound File Data v0.30"
	/// </summary>
	public const string ExpectedSignature = "SNES-SPC700 Sound File Data v0.30";

	/// <summary>
	/// Signature bytes (33 bytes at offset 0x00)
	/// </summary>
	public string Signature { get; set; } = string.Empty;

	/// <summary>
	/// Version bytes (2 bytes at offset 0x21) - typically 0x1A, 0x1A
	/// </summary>
	public byte[] Version { get; set; } = [0x1a, 0x1a];

	/// <summary>
	/// Has ID666 tag (1 byte at offset 0x23)
	/// 0x1A = has ID666, 0x1B = no ID666
	/// </summary>
	public bool HasId666 { get; set; } = true;

	/// <summary>
	/// Program Counter - Initial PC register (2 bytes at offset 0x25)
	/// </summary>
	public ushort PC { get; set; }

	/// <summary>
	/// A register (1 byte at offset 0x27)
	/// </summary>
	public byte A { get; set; }

	/// <summary>
	/// X register (1 byte at offset 0x28)
	/// </summary>
	public byte X { get; set; }

	/// <summary>
	/// Y register (1 byte at offset 0x29)
	/// </summary>
	public byte Y { get; set; }

	/// <summary>
	/// Program Status Word (1 byte at offset 0x2A)
	/// </summary>
	public byte PSW { get; set; }

	/// <summary>
	/// Stack Pointer (1 byte at offset 0x2B)
	/// </summary>
	public byte SP { get; set; }

	/// <summary>
	/// Reserved (2 bytes at offset 0x2C)
	/// </summary>
	public byte[] Reserved { get; set; } = new byte[2];

	// ID666 Tag fields (if HasId666)

	/// <summary>
	/// Song title (32 bytes at offset 0x2E)
	/// </summary>
	public string SongTitle { get; set; } = string.Empty;

	/// <summary>
	/// Game title (32 bytes at offset 0x4E)
	/// </summary>
	public string GameTitle { get; set; } = string.Empty;

	/// <summary>
	/// Dumper name (16 bytes at offset 0x6E)
	/// </summary>
	public string DumperName { get; set; } = string.Empty;

	/// <summary>
	/// Comments (32 bytes at offset 0x7E)
	/// </summary>
	public string Comments { get; set; } = string.Empty;

	/// <summary>
	/// Dump date (11 bytes at offset 0x9E) - format: MM/DD/YYYY
	/// </summary>
	public string DumpDate { get; set; } = string.Empty;

	/// <summary>
	/// Song length in seconds before fade (3 bytes at offset 0xA9)
	/// </summary>
	public int SongLengthSeconds { get; set; }

	/// <summary>
	/// Fade length in milliseconds (5 bytes at offset 0xAC)
	/// </summary>
	public int FadeLengthMs { get; set; }

	/// <summary>
	/// Song artist (32 bytes at offset 0xB1)
	/// </summary>
	public string Artist { get; set; } = string.Empty;

	/// <summary>
	/// Default channel disables (1 byte at offset 0xD0)
	/// </summary>
	public byte DefaultChannelDisables { get; set; }

	/// <summary>
	/// Emulator used to dump (1 byte at offset 0xD1)
	/// 0=Unknown, 1=ZSNES, 2=Snes9x
	/// </summary>
	public byte EmulatorUsed { get; set; }

	/// <summary>
	/// Reserved bytes (22 bytes at offset 0xD2)
	/// </summary>
	public byte[] Reserved2 { get; set; } = new byte[22];

	/// <summary>
	/// Parse header from raw bytes.
	/// </summary>
	public static SpcHeader Parse(ReadOnlySpan<byte> data) {
		if (data.Length < 256) {
			throw new ArgumentException("SPC header requires at least 256 bytes", nameof(data));
		}

		var header = new SpcHeader {
			Signature = System.Text.Encoding.ASCII.GetString(data[..33]).TrimEnd('\0'),
			Version = [data[0x21], data[0x22]],
			HasId666 = data[0x23] == 0x1a,
			PC = (ushort)(data[0x25] | (data[0x26] << 8)),
			A = data[0x27],
			X = data[0x28],
			Y = data[0x29],
			PSW = data[0x2a],
			SP = data[0x2b],
			Reserved = data.Slice(0x2c, 2).ToArray()
		};

		// Parse ID666 tag if present
		if (header.HasId666) {
			header.SongTitle = ReadString(data, 0x2e, 32);
			header.GameTitle = ReadString(data, 0x4e, 32);
			header.DumperName = ReadString(data, 0x6e, 16);
			header.Comments = ReadString(data, 0x7e, 32);
			header.DumpDate = ReadString(data, 0x9e, 11);

			// Song length - 3 ASCII digits
			var lengthStr = ReadString(data, 0xa9, 3);
			if (int.TryParse(lengthStr, out int length)) {
				header.SongLengthSeconds = length;
			}

			// Fade length - 5 ASCII digits
			var fadeStr = ReadString(data, 0xac, 5);
			if (int.TryParse(fadeStr, out int fade)) {
				header.FadeLengthMs = fade;
			}

			header.Artist = ReadString(data, 0xb1, 32);
			header.DefaultChannelDisables = data[0xd0];
			header.EmulatorUsed = data[0xd1];
			header.Reserved2 = data.Slice(0xd2, 22).ToArray();
		}

		return header;
	}

	/// <summary>
	/// Serialize header to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var data = new byte[256];

		// Signature
		var sigBytes = System.Text.Encoding.ASCII.GetBytes(ExpectedSignature);
		Array.Copy(sigBytes, data, Math.Min(sigBytes.Length, 33));

		// Version
		data[0x21] = Version[0];
		data[0x22] = Version[1];

		// Has ID666
		data[0x23] = HasId666 ? (byte)0x1a : (byte)0x1b;

		// Registers
		data[0x25] = (byte)(PC & 0xff);
		data[0x26] = (byte)((PC >> 8) & 0xff);
		data[0x27] = A;
		data[0x28] = X;
		data[0x29] = Y;
		data[0x2a] = PSW;
		data[0x2b] = SP;

		// ID666 tag
		if (HasId666) {
			WriteString(data, 0x2e, SongTitle, 32);
			WriteString(data, 0x4e, GameTitle, 32);
			WriteString(data, 0x6e, DumperName, 16);
			WriteString(data, 0x7e, Comments, 32);
			WriteString(data, 0x9e, DumpDate, 11);
			WriteString(data, 0xa9, SongLengthSeconds.ToString().PadLeft(3, '0'), 3);
			WriteString(data, 0xac, FadeLengthMs.ToString().PadLeft(5, '0'), 5);
			WriteString(data, 0xb1, Artist, 32);
			data[0xd0] = DefaultChannelDisables;
			data[0xd1] = EmulatorUsed;
		}

		return data;
	}

	/// <summary>
	/// Validates the signature is correct.
	/// </summary>
	public bool IsValid => Signature.StartsWith("SNES-SPC700 Sound File Data");

	private static string ReadString(ReadOnlySpan<byte> data, int offset, int length) {
		var span = data.Slice(offset, length);
		int nullIndex = span.IndexOf((byte)0);
		if (nullIndex >= 0) {
			span = span[..nullIndex];
		}
		return System.Text.Encoding.ASCII.GetString(span).Trim();
	}

	private static void WriteString(byte[] data, int offset, string value, int maxLength) {
		var bytes = System.Text.Encoding.ASCII.GetBytes(value ?? "");
		var copyLength = Math.Min(bytes.Length, maxLength);
		Array.Copy(bytes, 0, data, offset, copyLength);
	}
}
