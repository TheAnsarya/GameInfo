using System.Security.Cryptography;

namespace GameInfoTools.Dats;

/// <summary>
/// Hashes ROM files with multiple algorithms and validates SNES-specific checksums.
/// </summary>
public static class RomHasher {
	/// <summary>
	/// Known SNES header sizes.
	/// </summary>
	public static readonly int[] SnesHeaderSizes = [0, 512, 0x200]; // No header, SMC/SWC header

	/// <summary>
	/// Hashes a ROM file with all algorithms.
	/// </summary>
	public static RomHashes HashFile(string filePath, bool detectSnesHeader = true) {
		var data = File.ReadAllBytes(filePath);
		return HashData(data, Path.GetFileName(filePath), detectSnesHeader);
	}

	/// <summary>
	/// Hashes ROM data with all algorithms.
	/// </summary>
	public static RomHashes HashData(byte[] data, string? name = null, bool detectSnesHeader = true) {
		// Detect header for SNES ROMs
		var headerSize = detectSnesHeader ? DetectSnesHeader(data) : 0;
		var romData = headerSize > 0 ? data[headerSize..] : data;

		// Compute all hashes
		var crc32 = ComputeCrc32(romData);
		var md5 = ComputeHash(MD5.Create(), romData);
		var sha1 = ComputeHash(SHA1.Create(), romData);
		var sha256 = ComputeHash(SHA256.Create(), romData);

		// Get SNES internal checksum if applicable
		SnesChecksumInfo? snesInfo = null;
		if (IsPotentiallySnesRom(romData)) {
			snesInfo = ValidateSnesChecksum(romData);
		}

		return new RomHashes {
			Name = name,
			FileSize = data.Length,
			RomSize = romData.Length,
			HeaderSize = headerSize,
			Crc32 = crc32,
			Md5 = md5,
			Sha1 = sha1,
			Sha256 = sha256,
			SnesChecksum = snesInfo
		};
	}

	/// <summary>
	/// Detects if an SNES ROM has a copier header (512 bytes).
	/// </summary>
	public static int DetectSnesHeader(byte[] data) {
		// Check if file size modulo 0x8000 (32KB) equals 512
		if (data.Length % 0x8000 == 512 && data.Length > 512) {
			// Check for SMC/SWC header signatures
			// SMC header typically has file size info in first 3 bytes
			var lowByte = data[0];
			var highByte = data[1];
			var expectedSize = ((highByte << 8) | lowByte) * 0x2000; // 8KB units

			// Common copier header patterns
			// Super Magicom: first byte is size low, second is size high, third is usually 0
			if (data[2] == 0 || data[2] == 0x30 || data[2] == 0x80) {
				return 512;
			}

			// Check for common non-zero header area
			// Real ROM data at offset 0 would typically be code (not ASCII or nulls)
			var asciiCount = 0;
			var nullCount = 0;
			for (var i = 0; i < Math.Min(512, data.Length); i++) {
				if (data[i] == 0) nullCount++;
				else if (data[i] is >= 0x20 and <= 0x7e) asciiCount++;
			}

			// Headers often have many nulls or ASCII text
			if (nullCount > 400 || asciiCount > 200) {
				return 512;
			}
		}

		return 0;
	}

	/// <summary>
	/// Checks if data could be an SNES ROM (correct size, valid header location).
	/// </summary>
	public static bool IsPotentiallySnesRom(byte[] data) {
		// SNES ROMs are typically 256KB to 6MB, in power-of-2 sizes or close
		if (data.Length < 0x8000 || data.Length > 0x800000) return false;

		// Try to find internal header at LoROM or HiROM location
		return GetSnesHeaderOffset(data) >= 0;
	}

	/// <summary>
	/// Gets the internal SNES header offset (not copier header).
	/// </summary>
	public static int GetSnesHeaderOffset(byte[] data) {
		// LoROM header at $7FC0 (byte 0x7FC0 in ROM)
		// HiROM header at $FFC0 (byte 0xFFC0 in ROM)
		// ExLoROM at $407FC0
		// ExHiROM at $40FFC0

		var candidates = new[] { 0x7fc0, 0xffc0, 0x407fc0, 0x40ffc0 };

		foreach (var offset in candidates) {
			if (offset + 0x40 > data.Length) continue;

			// Check for valid checksum complement
			var checksumCompOffset = offset + 0x1c;
			var checksumOffset = offset + 0x1e;

			if (checksumOffset + 2 > data.Length) continue;

			var checksumComp = (ushort)(data[checksumCompOffset] | (data[checksumCompOffset + 1] << 8));
			var checksum = (ushort)(data[checksumOffset] | (data[checksumOffset + 1] << 8));

			// Checksum + complement should equal 0xFFFF
			if ((checksumComp ^ checksum) == 0xffff) {
				// Additional validation: check map mode byte
				var mapMode = data[offset + 0x15];
				var validModes = new byte[] { 0x20, 0x21, 0x23, 0x25, 0x30, 0x31, 0x32, 0x33, 0x35 };
				if (Array.IndexOf(validModes, (byte)(mapMode & 0x2f)) >= 0 || mapMode == 0x20 || mapMode == 0x21) {
					return offset;
				}

				// Even without valid map mode, checksum match is strong indicator
				return offset;
			}
		}

		return -1;
	}

	/// <summary>
	/// Validates the SNES internal checksum.
	/// </summary>
	public static SnesChecksumInfo ValidateSnesChecksum(byte[] data) {
		var headerOffset = GetSnesHeaderOffset(data);

		if (headerOffset < 0) {
			return new SnesChecksumInfo {
				IsValid = false,
				CalculatedChecksum = 0,
				StoredChecksum = 0,
				StoredComplement = 0,
				HeaderOffset = -1,
				MapMode = SnesMapMode.Unknown
			};
		}

		var checksumCompOffset = headerOffset + 0x1c;
		var checksumOffset = headerOffset + 0x1e;
		var mapModeOffset = headerOffset + 0x15;

		var storedComp = (ushort)(data[checksumCompOffset] | (data[checksumCompOffset + 1] << 8));
		var storedChecksum = (ushort)(data[checksumOffset] | (data[checksumOffset + 1] << 8));
		var mapModeByte = data[mapModeOffset];

		// Determine map mode
		var mapMode = (mapModeByte & 0x01) != 0 ? SnesMapMode.HiROM : SnesMapMode.LoROM;
		if ((mapModeByte & 0x04) != 0) {
			mapMode = mapMode == SnesMapMode.HiROM ? SnesMapMode.ExHiROM : SnesMapMode.ExLoROM;
		}

		// Calculate actual checksum (sum of all bytes mod 0x10000)
		var calculated = CalculateSnesChecksum(data, headerOffset);

		return new SnesChecksumInfo {
			IsValid = calculated == storedChecksum,
			CalculatedChecksum = calculated,
			StoredChecksum = storedChecksum,
			StoredComplement = storedComp,
			HeaderOffset = headerOffset,
			MapMode = mapMode,
			InternalName = GetSnesInternalName(data, headerOffset)
		};
	}

	/// <summary>
	/// Calculates the SNES ROM checksum.
	/// </summary>
	public static ushort CalculateSnesChecksum(byte[] data, int headerOffset = -1) {
		if (headerOffset < 0) {
			headerOffset = GetSnesHeaderOffset(data);
		}

		// Mirror smaller ROMs to power-of-2 size for checksum
		var romSize = data.Length;
		var mirrorSize = GetMirroredSize(romSize);

		uint sum = 0;
		for (var i = 0; i < mirrorSize; i++) {
			// Handle mirroring for non-power-of-2 sizes
			var idx = i < romSize ? i : (i % romSize);
			sum += data[idx];
		}

		return (ushort)(sum & 0xffff);
	}

	private static int GetMirroredSize(int size) {
		// Find next power of 2
		var power = 1;
		while (power < size) {
			power <<= 1;
		}
		return power;
	}

	/// <summary>
	/// Gets the internal SNES game name from the header.
	/// </summary>
	public static string GetSnesInternalName(byte[] data, int headerOffset) {
		if (headerOffset < 0 || headerOffset + 21 > data.Length) return "";

		var nameBytes = data[headerOffset..(headerOffset + 21)];
		var name = System.Text.Encoding.ASCII.GetString(nameBytes).TrimEnd();

		// Clean up non-printable characters
		return new string(name.Where(c => c >= 32 && c < 127).ToArray()).Trim();
	}

	private static string ComputeHash(HashAlgorithm algorithm, byte[] data) {
		using (algorithm) {
			var hash = algorithm.ComputeHash(data);
			return Convert.ToHexStringLower(hash);
		}
	}

	/// <summary>
	/// Computes CRC32 checksum.
	/// </summary>
	public static string ComputeCrc32(byte[] data) {
		var crc = Crc32Algorithm.Compute(data);
		return crc.ToString("x8");
	}
}

/// <summary>
/// Result of hashing a ROM file.
/// </summary>
public sealed record RomHashes {
	public string? Name { get; init; }
	public long FileSize { get; init; }
	public long RomSize { get; init; }
	public int HeaderSize { get; init; }
	public required string Crc32 { get; init; }
	public required string Md5 { get; init; }
	public required string Sha1 { get; init; }
	public required string Sha256 { get; init; }
	public SnesChecksumInfo? SnesChecksum { get; init; }

	public override string ToString() {
		return $"""
			Name:     {Name ?? "(unknown)"}
			Size:     {RomSize:N0} bytes (file: {FileSize:N0}, header: {HeaderSize})
			CRC32:    {Crc32}
			MD5:      {Md5}
			SHA1:     {Sha1}
			SHA256:   {Sha256}
			SNES:     {(SnesChecksum is null ? "N/A" : SnesChecksum.IsValid ? "Valid" : "Invalid")}
			""";
	}
}

/// <summary>
/// SNES-specific checksum validation info.
/// </summary>
public sealed record SnesChecksumInfo {
	public bool IsValid { get; init; }
	public ushort CalculatedChecksum { get; init; }
	public ushort StoredChecksum { get; init; }
	public ushort StoredComplement { get; init; }
	public int HeaderOffset { get; init; }
	public SnesMapMode MapMode { get; init; }
	public string? InternalName { get; init; }

	public override string ToString() {
		return $"""
			Internal Name: {InternalName ?? "(none)"}
			Map Mode:      {MapMode}
			Header Offset: 0x{HeaderOffset:X6}
			Stored:        0x{StoredChecksum:X4} (complement: 0x{StoredComplement:X4})
			Calculated:    0x{CalculatedChecksum:X4}
			Valid:         {IsValid}
			""";
	}
}

/// <summary>
/// SNES ROM mapping modes.
/// </summary>
public enum SnesMapMode {
	Unknown,
	LoROM,
	HiROM,
	ExLoROM,
	ExHiROM,
	SA1,
	SDD1,
	SuperFX
}

/// <summary>
/// CRC32 implementation (IEEE 802.3 polynomial).
/// </summary>
public static class Crc32Algorithm {
	private static readonly uint[] Table = CreateTable();

	private static uint[] CreateTable() {
		const uint polynomial = 0xedb88320u;
		var table = new uint[256];

		for (uint i = 0; i < 256; i++) {
			var crc = i;
			for (var j = 0; j < 8; j++) {
				crc = (crc & 1) != 0 ? (crc >> 1) ^ polynomial : crc >> 1;
			}
			table[i] = crc;
		}

		return table;
	}

	public static uint Compute(byte[] data) {
		var crc = 0xffffffffu;
		foreach (var b in data) {
			crc = Table[(crc ^ b) & 0xff] ^ (crc >> 8);
		}
		return ~crc;
	}

	public static uint Compute(ReadOnlySpan<byte> data) {
		var crc = 0xffffffffu;
		foreach (var b in data) {
			crc = Table[(crc ^ b) & 0xff] ^ (crc >> 8);
		}
		return ~crc;
	}
}
