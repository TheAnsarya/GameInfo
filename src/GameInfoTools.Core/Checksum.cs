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
	/// Calculate SHA256 hash.
	/// </summary>
	public static string Sha256(byte[] data) {
		using var sha256 = SHA256.Create();
		byte[] hash = sha256.ComputeHash(data);
		return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
	}

	/// <summary>
	/// Calculate SHA384 hash.
	/// </summary>
	public static string Sha384(byte[] data) {
		using var sha384 = SHA384.Create();
		byte[] hash = sha384.ComputeHash(data);
		return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
	}

	/// <summary>
	/// Calculate SHA512 hash.
	/// </summary>
	public static string Sha512(byte[] data) {
		using var sha512 = SHA512.Create();
		byte[] hash = sha512.ComputeHash(data);
		return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
	}

	/// <summary>
	/// Calculate all common hashes for a file.
	/// </summary>
	public static HashResult CalculateAllHashes(byte[] data) {
		return new HashResult(
			Crc32: Crc32(data),
			Md5: Md5(data),
			Sha1: Sha1(data),
			Sha256: Sha256(data),
			Sha384: Sha384(data),
			Sha512: Sha512(data)
		);
	}

	/// <summary>
	/// Verify file against expected hash value.
	/// </summary>
	public static bool VerifyHash(byte[] data, string expectedHash, HashType hashType) {
		string actualHash = hashType switch {
			HashType.Crc32 => Crc32(data).ToString("x8"),
			HashType.Md5 => Md5(data),
			HashType.Sha1 => Sha1(data),
			HashType.Sha256 => Sha256(data),
			HashType.Sha384 => Sha384(data),
			HashType.Sha512 => Sha512(data),
			_ => throw new ArgumentException($"Unknown hash type: {hashType}")
		};

		return string.Equals(actualHash, expectedHash, StringComparison.OrdinalIgnoreCase);
	}

	/// <summary>
	/// Batch verify multiple files against a hash list.
	/// </summary>
	public static BatchVerificationResult BatchVerify(IEnumerable<BatchVerificationEntry> entries) {
		var results = new List<BatchVerificationEntryResult>();

		foreach (var entry in entries) {
			try {
				if (!File.Exists(entry.FilePath)) {
					results.Add(new BatchVerificationEntryResult(
						entry.FilePath, false, "File not found", entry.ExpectedHash, null));
					continue;
				}

				var data = File.ReadAllBytes(entry.FilePath);
				string actualHash = entry.HashType switch {
					HashType.Crc32 => Crc32(data).ToString("x8"),
					HashType.Md5 => Md5(data),
					HashType.Sha1 => Sha1(data),
					HashType.Sha256 => Sha256(data),
					HashType.Sha384 => Sha384(data),
					HashType.Sha512 => Sha512(data),
					_ => throw new ArgumentException($"Unknown hash type: {entry.HashType}")
				};

				bool matches = string.Equals(actualHash, entry.ExpectedHash, StringComparison.OrdinalIgnoreCase);
				results.Add(new BatchVerificationEntryResult(
					entry.FilePath, matches,
					matches ? "OK" : "Hash mismatch",
					entry.ExpectedHash, actualHash));
			} catch (Exception ex) {
				results.Add(new BatchVerificationEntryResult(
					entry.FilePath, false, $"Error: {ex.Message}", entry.ExpectedHash, null));
			}
		}

		int passed = results.Count(r => r.Passed);
		int failed = results.Count(r => !r.Passed);

		return new BatchVerificationResult(results, passed, failed);
	}

	/// <summary>
	/// Parse a hash file (MD5SUMS, SHA256SUMS format).
	/// </summary>
	public static List<BatchVerificationEntry> ParseHashFile(string content, HashType hashType) {
		var entries = new List<BatchVerificationEntry>();
		var lines = content.Split('\n', StringSplitOptions.RemoveEmptyEntries);

		foreach (var line in lines) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#'))
				continue;

			// Format: "hash  filename" or "hash *filename" (binary mode)
			var parts = trimmed.Split([' ', '\t'], 2, StringSplitOptions.RemoveEmptyEntries);
			if (parts.Length < 2)
				continue;

			var hash = parts[0];
			var filename = parts[1].TrimStart('*');

			entries.Add(new BatchVerificationEntry(filename, hash, hashType));
		}

		return entries;
	}

	/// <summary>
	/// Generate a hash file in standard format.
	/// </summary>
	public static string GenerateHashFile(IEnumerable<(string FilePath, string Hash)> files, bool binary = false) {
		var sb = new System.Text.StringBuilder();
		string mode = binary ? "*" : " ";

		foreach (var (filePath, hash) in files) {
			sb.AppendLine($"{hash} {mode}{Path.GetFileName(filePath)}");
		}

		return sb.ToString();
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

	public record HashResult(
		uint Crc32,
		string Md5,
		string Sha1,
		string Sha256,
		string Sha384,
		string Sha512
	);

	public record BatchVerificationEntry(string FilePath, string ExpectedHash, HashType HashType);

	public record BatchVerificationEntryResult(
		string FilePath,
		bool Passed,
		string Status,
		string ExpectedHash,
		string? ActualHash
	);

	public record BatchVerificationResult(
		List<BatchVerificationEntryResult> Results,
		int PassedCount,
		int FailedCount
	);

	#region Report Generation

	/// <summary>
	/// Generate checksum report in various formats.
	/// </summary>
	public static string GenerateReport(IEnumerable<FileHashReport> files, ReportFormat format) {
		return format switch {
			ReportFormat.Txt => GenerateTxtReport(files),
			ReportFormat.Json => GenerateJsonReport(files),
			ReportFormat.Xml => GenerateXmlReport(files),
			ReportFormat.Csv => GenerateCsvReport(files),
			_ => throw new ArgumentException($"Unknown report format: {format}")
		};
	}

	private static string GenerateTxtReport(IEnumerable<FileHashReport> files) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("=== Checksum Report ===");
		sb.AppendLine($"Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
		sb.AppendLine();

		foreach (var file in files) {
			sb.AppendLine($"File: {file.FileName}");
			sb.AppendLine($"  Size: {file.FileSize:N0} bytes");
			sb.AppendLine($"  CRC32:  {file.Hashes.Crc32:x8}");
			sb.AppendLine($"  MD5:    {file.Hashes.Md5}");
			sb.AppendLine($"  SHA1:   {file.Hashes.Sha1}");
			sb.AppendLine($"  SHA256: {file.Hashes.Sha256}");
			sb.AppendLine($"  SHA384: {file.Hashes.Sha384}");
			sb.AppendLine($"  SHA512: {file.Hashes.Sha512}");
			sb.AppendLine();
		}

		return sb.ToString();
	}

	private static string GenerateJsonReport(IEnumerable<FileHashReport> files) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine($"  \"generated\": \"{DateTime.Now:yyyy-MM-ddTHH:mm:ss}\",");
		sb.AppendLine("  \"files\": [");

		var fileList = files.ToList();
		for (int i = 0; i < fileList.Count; i++) {
			var file = fileList[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"name\": \"{EscapeJson(file.FileName)}\",");
			sb.AppendLine($"      \"size\": {file.FileSize},");
			sb.AppendLine($"      \"crc32\": \"{file.Hashes.Crc32:x8}\",");
			sb.AppendLine($"      \"md5\": \"{file.Hashes.Md5}\",");
			sb.AppendLine($"      \"sha1\": \"{file.Hashes.Sha1}\",");
			sb.AppendLine($"      \"sha256\": \"{file.Hashes.Sha256}\",");
			sb.AppendLine($"      \"sha384\": \"{file.Hashes.Sha384}\",");
			sb.AppendLine($"      \"sha512\": \"{file.Hashes.Sha512}\"");
			sb.Append("    }");
			if (i < fileList.Count - 1) sb.Append(",");
			sb.AppendLine();
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");
		return sb.ToString();
	}

	private static string GenerateXmlReport(IEnumerable<FileHashReport> files) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.AppendLine("<checksumReport>");
		sb.AppendLine($"  <generated>{DateTime.Now:yyyy-MM-ddTHH:mm:ss}</generated>");
		sb.AppendLine("  <files>");

		foreach (var file in files) {
			sb.AppendLine("    <file>");
			sb.AppendLine($"      <name>{EscapeXml(file.FileName)}</name>");
			sb.AppendLine($"      <size>{file.FileSize}</size>");
			sb.AppendLine($"      <crc32>{file.Hashes.Crc32:x8}</crc32>");
			sb.AppendLine($"      <md5>{file.Hashes.Md5}</md5>");
			sb.AppendLine($"      <sha1>{file.Hashes.Sha1}</sha1>");
			sb.AppendLine($"      <sha256>{file.Hashes.Sha256}</sha256>");
			sb.AppendLine($"      <sha384>{file.Hashes.Sha384}</sha384>");
			sb.AppendLine($"      <sha512>{file.Hashes.Sha512}</sha512>");
			sb.AppendLine("    </file>");
		}

		sb.AppendLine("  </files>");
		sb.AppendLine("</checksumReport>");
		return sb.ToString();
	}

	private static string GenerateCsvReport(IEnumerable<FileHashReport> files) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("\"FileName\",\"Size\",\"CRC32\",\"MD5\",\"SHA1\",\"SHA256\",\"SHA384\",\"SHA512\"");

		foreach (var file in files) {
			sb.AppendLine($"\"{EscapeCsv(file.FileName)}\",{file.FileSize},\"{file.Hashes.Crc32:x8}\",\"{file.Hashes.Md5}\",\"{file.Hashes.Sha1}\",\"{file.Hashes.Sha256}\",\"{file.Hashes.Sha384}\",\"{file.Hashes.Sha512}\"");
		}

		return sb.ToString();
	}

	private static string EscapeJson(string value) {
		return value.Replace("\\", "\\\\").Replace("\"", "\\\"");
	}

	private static string EscapeXml(string value) {
		return value.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace("\"", "&quot;");
	}

	private static string EscapeCsv(string value) {
		return value.Replace("\"", "\"\"");
	}

	#endregion

	#region Database Comparison

	/// <summary>
	/// Compare ROM checksums against a known-good database.
	/// </summary>
	public static DatabaseMatchResult CompareToDatabase(byte[] data, RomDatabase database) {
		var hashes = CalculateAllHashes(data);

		// Try to match by various hash types
		var crcMatch = database.FindByCrc32(hashes.Crc32);
		var md5Match = database.FindByMd5(hashes.Md5);
		var sha1Match = database.FindBySha1(hashes.Sha1);

		// Prefer most specific match
		var match = sha1Match ?? md5Match ?? crcMatch;

		if (match != null) {
			return new DatabaseMatchResult(
				Found: true,
				Entry: match,
				MatchedBy: sha1Match != null ? "SHA1" : (md5Match != null ? "MD5" : "CRC32"),
				CalculatedHashes: hashes
			);
		}

		return new DatabaseMatchResult(
			Found: false,
			Entry: null,
			MatchedBy: null,
			CalculatedHashes: hashes
		);
	}

	/// <summary>
	/// Load a ROM database from DAT file (No-Intro/Redump format).
	/// </summary>
	public static RomDatabase LoadDatFile(string content) {
		var entries = new List<RomDatabaseEntry>();
		var lines = content.Split('\n');

		bool inGameBlock = false;
		string? currentGame = null;
		string? currentDescription = null;
		uint? currentCrc = null;
		string? currentMd5 = null;
		string? currentSha1 = null;
		long? currentSize = null;

		foreach (var line in lines) {
			var trimmed = line.Trim();

			if (trimmed.StartsWith("game (")) {
				// Start of new game entry
				inGameBlock = true;
				currentGame = null;
				currentDescription = null;
				currentCrc = null;
				currentMd5 = null;
				currentSha1 = null;
				currentSize = null;
			} else if (!inGameBlock) {
				// Ignore lines outside game blocks
				continue;
			} else if (trimmed.StartsWith("name \"")) {
				int start = trimmed.IndexOf('"') + 1;
				int end = trimmed.LastIndexOf('"');
				if (end > start) {
					currentGame = trimmed[start..end];
				}
			} else if (trimmed.StartsWith("description \"")) {
				int start = trimmed.IndexOf('"') + 1;
				int end = trimmed.LastIndexOf('"');
				if (end > start) {
					currentDescription = trimmed[start..end];
				}
			} else if (trimmed.StartsWith("rom (")) {
				// Parse ROM details from same line or following lines
			} else if (trimmed.StartsWith("crc ")) {
				var value = trimmed[4..].Trim();
				if (uint.TryParse(value, System.Globalization.NumberStyles.HexNumber, null, out uint crc)) {
					currentCrc = crc;
				}
			} else if (trimmed.StartsWith("md5 ")) {
				currentMd5 = trimmed[4..].Trim().ToLowerInvariant();
			} else if (trimmed.StartsWith("sha1 ")) {
				currentSha1 = trimmed[5..].Trim().ToLowerInvariant();
			} else if (trimmed.StartsWith("size ")) {
				if (long.TryParse(trimmed[5..].Trim(), out long size)) {
					currentSize = size;
				}
			} else if (trimmed == ")") {
				// End of game block
				if (inGameBlock && currentGame != null) {
					entries.Add(new RomDatabaseEntry(
						Name: currentGame,
						Description: currentDescription,
						Crc32: currentCrc,
						Md5: currentMd5,
						Sha1: currentSha1,
						Size: currentSize
					));
				}

				inGameBlock = false;
			}
		}

		return new RomDatabase(entries);
	}

	#endregion

	#region Partial ROM Checksums

	/// <summary>
	/// Calculate checksum for a specific region of a ROM.
	/// </summary>
	public static HashResult CalculateRegionHashes(byte[] data, int offset, int length) {
		if (offset < 0 || length < 0 || offset + length > data.Length) {
			throw new ArgumentOutOfRangeException($"Invalid region: offset={offset}, length={length}, data.Length={data.Length}");
		}

		// Extract region
		var region = new byte[length];
		Array.Copy(data, offset, region, 0, length);

		return CalculateAllHashes(region);
	}

	/// <summary>
	/// Calculate checksums for all defined regions.
	/// </summary>
	public static List<RegionHashResult> CalculateRegionHashes(byte[] data, IEnumerable<RomRegion> regions) {
		var results = new List<RegionHashResult>();

		foreach (var region in regions) {
			try {
				int offset = region.Offset;
				int length = region.Length;

				// Handle -1 for "to end"
				if (length < 0) {
					length = data.Length - offset;
				}

				if (offset + length <= data.Length) {
					var hashes = CalculateRegionHashes(data, offset, length);
					results.Add(new RegionHashResult(region.Name, region.Offset, length, hashes, null));
				} else {
					results.Add(new RegionHashResult(region.Name, region.Offset, length, null, "Region exceeds data bounds"));
				}
			} catch (Exception ex) {
				results.Add(new RegionHashResult(region.Name, region.Offset, region.Length, null, ex.Message));
			}
		}

		return results;
	}

	/// <summary>
	/// Get standard ROM regions for a system type.
	/// </summary>
	public static List<RomRegion> GetStandardRegions(SystemType system, byte[]? data = null) {
		return system switch {
			SystemType.Nes => GetNesRegions(data),
			SystemType.Snes => GetSnesRegions(data),
			SystemType.GameBoy or SystemType.GameBoyColor => GetGameBoyRegions(data),
			SystemType.GameBoyAdvance => GetGbaRegions(data),
			_ => []
		};
	}

	private static List<RomRegion> GetNesRegions(byte[]? data) {
		var regions = new List<RomRegion>();

		if (data != null && data.Length >= 16) {
			// Parse iNES header
			int prgSize = data[4] * 16384;
			int chrSize = data[5] * 8192;
			int headerSize = (data[6] & 0x04) != 0 ? 528 : 16; // Trainer?

			regions.Add(new RomRegion("Header", 0, headerSize));

			if (prgSize > 0) {
				regions.Add(new RomRegion("PRG-ROM", headerSize, prgSize));
			}

			if (chrSize > 0) {
				regions.Add(new RomRegion("CHR-ROM", headerSize + prgSize, chrSize));
			}
		} else {
			// Default NES regions
			regions.Add(new RomRegion("Header", 0, 16));
			regions.Add(new RomRegion("PRG-ROM", 16, -1)); // -1 means to end
		}

		return regions;
	}

	private static List<RomRegion> GetSnesRegions(byte[]? data) {
		var regions = new List<RomRegion> {
			new("Full ROM", 0, data?.Length ?? -1)
		};

		// Add header regions
		if (data != null && data.Length >= 0x8000) {
			regions.Add(new RomRegion("LoROM Header", 0x7fb0, 0x50));
		}

		if (data != null && data.Length >= 0x10000) {
			regions.Add(new RomRegion("HiROM Header", 0xffb0, 0x50));
		}

		return regions;
	}

	private static List<RomRegion> GetGameBoyRegions(byte[]? data) {
		var regions = new List<RomRegion> {
			new("Header", 0x100, 0x50),
			new("Nintendo Logo", 0x104, 0x30),
			new("Title", 0x134, 0x10),
			new("ROM", 0, data?.Length ?? -1)
		};

		return regions;
	}

	private static List<RomRegion> GetGbaRegions(byte[]? data) {
		var regions = new List<RomRegion> {
			new("Header", 0, 0xc0),
			new("Nintendo Logo", 0x04, 0x9c),
			new("Title", 0xa0, 0x0c),
			new("ROM", 0, data?.Length ?? -1)
		};

		return regions;
	}

	#endregion

	#region Records

	public record FileHashReport(
		string FileName,
		long FileSize,
		HashResult Hashes
	);

	public record RomRegion(
		string Name,
		int Offset,
		int Length
	);

	public record RegionHashResult(
		string RegionName,
		int Offset,
		int Length,
		HashResult? Hashes,
		string? Error
	);

	public record RomDatabaseEntry(
		string Name,
		string? Description,
		uint? Crc32,
		string? Md5,
		string? Sha1,
		long? Size
	);

	public record DatabaseMatchResult(
		bool Found,
		RomDatabaseEntry? Entry,
		string? MatchedBy,
		HashResult CalculatedHashes
	);

	#endregion
}

/// <summary>
/// ROM database for checksum comparison.
/// </summary>
public class RomDatabase {
	private readonly List<Checksum.RomDatabaseEntry> _entries;
	private readonly Dictionary<uint, Checksum.RomDatabaseEntry> _crcIndex = [];
	private readonly Dictionary<string, Checksum.RomDatabaseEntry> _md5Index = [];
	private readonly Dictionary<string, Checksum.RomDatabaseEntry> _sha1Index = [];

	public RomDatabase(IEnumerable<Checksum.RomDatabaseEntry> entries) {
		_entries = entries.ToList();

		// Build indexes
		foreach (var entry in _entries) {
			if (entry.Crc32.HasValue && !_crcIndex.ContainsKey(entry.Crc32.Value)) {
				_crcIndex[entry.Crc32.Value] = entry;
			}

			if (entry.Md5 != null && !_md5Index.ContainsKey(entry.Md5)) {
				_md5Index[entry.Md5] = entry;
			}

			if (entry.Sha1 != null && !_sha1Index.ContainsKey(entry.Sha1)) {
				_sha1Index[entry.Sha1] = entry;
			}
		}
	}

	public IReadOnlyList<Checksum.RomDatabaseEntry> Entries => _entries;

	public int Count => _entries.Count;

	public Checksum.RomDatabaseEntry? FindByCrc32(uint crc) =>
		_crcIndex.TryGetValue(crc, out var entry) ? entry : null;

	public Checksum.RomDatabaseEntry? FindByMd5(string md5) =>
		_md5Index.TryGetValue(md5.ToLowerInvariant(), out var entry) ? entry : null;

	public Checksum.RomDatabaseEntry? FindBySha1(string sha1) =>
		_sha1Index.TryGetValue(sha1.ToLowerInvariant(), out var entry) ? entry : null;

	public List<Checksum.RomDatabaseEntry> Search(string query) =>
		_entries.Where(e =>
			(e.Name?.Contains(query, StringComparison.OrdinalIgnoreCase) ?? false) ||
			(e.Description?.Contains(query, StringComparison.OrdinalIgnoreCase) ?? false)
		).ToList();
}

/// <summary>
/// Report format types.
/// </summary>
public enum ReportFormat {
	/// <summary>Plain text format.</summary>
	Txt,
	/// <summary>JSON format.</summary>
	Json,
	/// <summary>XML format.</summary>
	Xml,
	/// <summary>CSV format.</summary>
	Csv
}

/// <summary>
/// Hash algorithm types.
/// </summary>
public enum HashType {
	Crc32,
	Md5,
	Sha1,
	Sha256,
	Sha384,
	Sha512
}
