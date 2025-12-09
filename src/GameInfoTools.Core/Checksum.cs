using System.Security.Cryptography;

namespace GameInfoTools.Core;

/// <summary>
/// ROM checksum calculation and verification.
/// </summary>
public static class Checksum {
	/// <summary>
	/// Calculate CRC32 checksum.
	/// </summary>
	public static uint Crc32(byte[] data) {
		return Crc32(data, 0, data.Length);
	}

	/// <summary>
	/// Calculate CRC32 checksum for a portion of data.
	/// </summary>
	public static uint Crc32(byte[] data, int offset, int length) {
		uint[] table = GenerateCrc32Table();
		uint crc = 0xffffffff;

		for (int i = 0; i < length; i++) {
			crc = table[(crc ^ data[offset + i]) & 0xff] ^ (crc >> 8);
		}

		return crc ^ 0xffffffff;
	}

	private static uint[] GenerateCrc32Table() {
		var table = new uint[256];
		for (uint i = 0; i < 256; i++) {
			uint crc = i;
			for (int j = 0; j < 8; j++) {
				crc = (crc & 1) != 0 ? (crc >> 1) ^ 0xedb88320 : crc >> 1;
			}

			table[i] = crc;
		}

		return table;
	}

	/// <summary>
	/// Calculate MD5 hash.
	/// </summary>
	public static string Md5(byte[] data) {
		using var md5 = MD5.Create();
		byte[] hash = md5.ComputeHash(data);
		return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
	}

	/// <summary>
	/// Calculate SHA1 hash.
	/// </summary>
	public static string Sha1(byte[] data) {
		using var sha1 = SHA1.Create();
		byte[] hash = sha1.ComputeHash(data);
		return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
	}

	/// <summary>
	/// Calculate NES internal checksum (sum of PRG bytes).
	/// </summary>
	public static ushort NesChecksum(byte[] data, int prgStart, int prgSize) {
		uint sum = 0;
		for (int i = 0; i < prgSize && prgStart + i < data.Length; i++) {
			sum += data[prgStart + i];
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Calculate SNES checksum.
	/// </summary>
	public static ushort SnesChecksum(byte[] data) {
		// SNES checksum is sum of all bytes
		uint sum = 0;
		for (int i = 0; i < data.Length; i++) {
			sum += data[i];
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Calculate SNES complement checksum.
	/// </summary>
	public static ushort SnesComplement(ushort checksum) {
		return (ushort)(checksum ^ 0xffff);
	}

	/// <summary>
	/// Fix SNES header checksums.
	/// </summary>
	public static void FixSnesChecksum(byte[] data, bool isHiRom) {
		// Determine header location
		int headerOffset = isHiRom ? 0xffdc : 0x7fdc;

		// Clear existing checksum bytes
		data[headerOffset] = 0xff;
		data[headerOffset + 1] = 0xff;
		data[headerOffset + 2] = 0x00;
		data[headerOffset + 3] = 0x00;

		// Calculate checksum
		ushort checksum = SnesChecksum(data);
		ushort complement = SnesComplement(checksum);

		// Write checksums
		data[headerOffset] = (byte)(complement & 0xff);
		data[headerOffset + 1] = (byte)((complement >> 8) & 0xff);
		data[headerOffset + 2] = (byte)(checksum & 0xff);
		data[headerOffset + 3] = (byte)((checksum >> 8) & 0xff);
	}

	/// <summary>
	/// Calculate Game Boy checksum.
	/// </summary>
	public static byte GameBoyHeaderChecksum(byte[] data) {
		// Header checksum: bytes $0134-$014C
		byte checksum = 0;
		for (int i = 0x134; i <= 0x14c && i < data.Length; i++) {
			checksum = (byte)(checksum - data[i] - 1);
		}

		return checksum;
	}

	/// <summary>
	/// Calculate Game Boy global checksum.
	/// </summary>
	public static ushort GameBoyGlobalChecksum(byte[] data) {
		uint sum = 0;
		for (int i = 0; i < data.Length; i++) {
			// Skip the checksum bytes themselves
			if (i == 0x14e || i == 0x14f)
				continue;
			sum += data[i];
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Fix Game Boy header checksum.
	/// </summary>
	public static void FixGameBoyChecksum(byte[] data) {
		// Fix header checksum at $014D
		if (data.Length > 0x14d) {
			data[0x14d] = GameBoyHeaderChecksum(data);
		}

		// Fix global checksum at $014E-$014F
		if (data.Length > 0x14f) {
			ushort globalChecksum = GameBoyGlobalChecksum(data);
			data[0x14e] = (byte)((globalChecksum >> 8) & 0xff);
			data[0x14f] = (byte)(globalChecksum & 0xff);
		}
	}

	/// <summary>
	/// Calculate GBA checksum (logo complement).
	/// </summary>
	public static byte GbaHeaderChecksum(byte[] data) {
		byte checksum = 0;
		for (int i = 0xa0; i <= 0xbc && i < data.Length; i++) {
			checksum = (byte)(checksum + data[i]);
		}

		return (byte)-(0x19 + checksum);
	}

	/// <summary>
	/// Verify if ROM checksums are correct.
	/// </summary>
	public static ChecksumResult Verify(byte[] data, SystemType system) {
		return system switch {
			SystemType.Nes => VerifyNes(data),
			SystemType.Snes => VerifySnes(data),
			SystemType.GameBoy or SystemType.GameBoyColor => VerifyGameBoy(data),
			SystemType.GameBoyAdvance => VerifyGba(data),
			_ => new ChecksumResult(false, "Unknown system")
		};
	}

	private static ChecksumResult VerifyNes(byte[] data) {
		// NES doesn't have a standard checksum, just return CRC
		uint crc = Crc32(data);
		return new ChecksumResult(true, $"CRC32: {crc:x8}");
	}

	private static ChecksumResult VerifySnes(byte[] data) {
		// Try both LoROM and HiROM header locations
		int[] headerOffsets = { 0x7fdc, 0xffdc };

		foreach (var offset in headerOffsets) {
			if (offset + 4 > data.Length)
				continue;

			ushort storedComplement = (ushort)(data[offset] | (data[offset + 1] << 8));
			ushort storedChecksum = (ushort)(data[offset + 2] | (data[offset + 3] << 8));

			if ((storedChecksum ^ storedComplement) == 0xffff) {
				// Calculate actual checksum
				ushort actual = SnesChecksum(data);

				bool valid = actual == storedChecksum;
				string mapping = offset == 0xffdc ? "HiROM" : "LoROM";
				return new ChecksumResult(valid, $"{mapping}: Stored={storedChecksum:x4}, Calculated={actual:x4}");
			}
		}

		return new ChecksumResult(false, "Could not find valid SNES header");
	}

	private static ChecksumResult VerifyGameBoy(byte[] data) {
		if (data.Length < 0x150)
			return new ChecksumResult(false, "ROM too small for Game Boy");

		byte storedHeader = data[0x14d];
		byte calculatedHeader = GameBoyHeaderChecksum(data);

		ushort storedGlobal = (ushort)((data[0x14e] << 8) | data[0x14f]);
		ushort calculatedGlobal = GameBoyGlobalChecksum(data);

		bool headerValid = storedHeader == calculatedHeader;
		bool globalValid = storedGlobal == calculatedGlobal;

		return new ChecksumResult(
			headerValid && globalValid,
			$"Header: {(headerValid ? "OK" : "BAD")} ({storedHeader:x2}/{calculatedHeader:x2}), " +
			$"Global: {(globalValid ? "OK" : "BAD")} ({storedGlobal:x4}/{calculatedGlobal:x4})"
		);
	}

	private static ChecksumResult VerifyGba(byte[] data) {
		if (data.Length < 0xbe)
			return new ChecksumResult(false, "ROM too small for GBA");

		byte stored = data[0xbd];
		byte calculated = GbaHeaderChecksum(data);

		bool valid = stored == calculated;
		return new ChecksumResult(valid, $"Header checksum: {(valid ? "OK" : "BAD")} ({stored:x2}/{calculated:x2})");
	}

	public record ChecksumResult(bool IsValid, string Details);
}
