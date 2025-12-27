namespace GameInfoTools.Core.Build;

/// <summary>
/// Sega Genesis/Mega Drive ROM parsing and bank extraction utilities.
/// Supports standard ROM format and interleaved (SMD) format.
/// </summary>
public class GenesisRomParser {
	private readonly byte[] _romData;

	/// <summary>
	/// Standard Genesis bank size (512KB chunks for SMD)
	/// </summary>
	public const int SmdBlockSize = 16384;

	/// <summary>
	/// SMD header size (512 bytes)
	/// </summary>
	public const int SmdHeaderSize = 512;

	/// <summary>
	/// Genesis/MD tile size (8x8 pixels)
	/// </summary>
	public const int TileSize = 8;

	public GenesisRomParser(byte[] romData) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));

		// Detect and deinterleave SMD format if needed
		if (IsSmdFormat()) {
			_romData = DeinterleaveSmd(romData);
		}

		Header = ParseHeader();
	}

	/// <summary>
	/// Gets the parsed Genesis header.
	/// </summary>
	public GenesisHeader Header { get; }

	/// <summary>
	/// Gets the ROM size in bytes (after deinterleaving if applicable).
	/// </summary>
	public int RomSize => _romData.Length;

	/// <summary>
	/// Gets whether the original ROM was in SMD (interleaved) format.
	/// </summary>
	public bool WasSmdFormat { get; private set; }

	/// <summary>
	/// Gets the number of 64KB banks.
	/// </summary>
	public int BankCount => (RomSize + 0xffff) / 0x10000;

	/// <summary>
	/// Check if ROM is in SMD (Super Magic Drive) interleaved format.
	/// </summary>
	private bool IsSmdFormat() {
		if (_romData.Length < SmdHeaderSize + SmdBlockSize) return false;

		// Check for SMD header markers
		// SMD files have header at start, then interleaved data
		// Header byte 0: number of 16KB blocks
		// Header byte 1: 0x03 for split file, 0x00 otherwise
		// Header bytes 2-7: typically contain "SEGA" or zero
		// Header bytes 8-9: 0xaa, 0xbb for SMD format

		var blocks = _romData[0];
		var splitFlag = _romData[1];

		// Check for SMD signature
		if (_romData.Length > 0x280 && _romData[8] == 0xaa && _romData[9] == 0xbb) {
			WasSmdFormat = true;
			return true;
		}

		// Check if header says it has blocks and file size matches
		if (blocks > 0 && ((blocks * SmdBlockSize) + SmdHeaderSize) == _romData.Length) {
			// Also verify it's NOT a valid Genesis header at $100
			if (_romData.Length > 0x150) {
				var hasSegaHeader = _romData[0x100] == 'S' && _romData[0x101] == 'E' &&
									_romData[0x102] == 'G' && _romData[0x103] == 'A';
				if (!hasSegaHeader) {
					WasSmdFormat = true;
					return true;
				}
			}
		}

		return false;
	}

	/// <summary>
	/// Deinterleave SMD format ROM to standard Genesis format.
	/// </summary>
	private byte[] DeinterleaveSmd(byte[] smdData) {
		// Skip 512-byte header
		var dataSize = smdData.Length - SmdHeaderSize;
		var result = new byte[dataSize];

		// Each 16KB block has odd bytes first, then even bytes
		var numBlocks = dataSize / SmdBlockSize;

		for (int block = 0; block < numBlocks; block++) {
			var srcOffset = SmdHeaderSize + (block * SmdBlockSize);
			var dstOffset = block * SmdBlockSize;

			// First 8KB are odd bytes, second 8KB are even bytes
			for (int i = 0; i < SmdBlockSize / 2; i++) {
				result[dstOffset + (i * 2) + 1] = smdData[srcOffset + i]; // Odd byte
				result[dstOffset + (i * 2)] = smdData[srcOffset + (SmdBlockSize / 2) + i]; // Even byte
			}
		}

		return result;
	}

	/// <summary>
	/// Parse the Genesis ROM header.
	/// </summary>
	private GenesisHeader ParseHeader() {
		var header = new GenesisHeader();

		// Genesis header is at $100-$1FF
		if (_romData.Length < 0x200) {
			return header;
		}

		// Console name at $100 (16 bytes)
		header.ConsoleName = ReadString(0x100, 16);
		header.IsValid = header.ConsoleName.Contains("SEGA") ||
						 header.ConsoleName.Contains("MEGA DRIVE");

		// Copyright/date at $110 (16 bytes)
		header.Copyright = ReadString(0x110, 16);

		// Domestic name at $120 (48 bytes)
		header.DomesticName = ReadString(0x120, 48);

		// Overseas name at $150 (48 bytes)
		header.OverseasName = ReadString(0x150, 48);

		// Product code at $180 (14 bytes) - GM XXXXXXXX-XX format
		header.ProductCode = ReadString(0x180, 14);

		// Checksum at $18e (2 bytes, big-endian)
		header.Checksum = (ushort)((_romData[0x18e] << 8) | _romData[0x18f]);

		// I/O support at $190 (16 bytes)
		header.IoSupport = ReadString(0x190, 16);

		// ROM start address at $1a0 (4 bytes, big-endian)
		header.RomStart = ReadUInt32BE(0x1a0);

		// ROM end address at $1a4 (4 bytes, big-endian)
		header.RomEnd = ReadUInt32BE(0x1a4);

		// RAM start at $1a8 (4 bytes)
		header.RamStart = ReadUInt32BE(0x1a8);

		// RAM end at $1ac (4 bytes)
		header.RamEnd = ReadUInt32BE(0x1ac);

		// SRAM info at $1b0 (12 bytes)
		header.SramInfo = ReadString(0x1b0, 12);
		header.HasSram = header.SramInfo.StartsWith("RA");

		if (header.HasSram && _romData.Length >= 0x1bc) {
			header.SramStart = ReadUInt32BE(0x1b4);
			header.SramEnd = ReadUInt32BE(0x1b8);
		}

		// Modem support at $1bc (12 bytes)
		header.ModemSupport = ReadString(0x1bc, 12);

		// Notes/memo at $1c8 (40 bytes)
		header.Memo = ReadString(0x1c8, 40);

		// Region codes at $1f0 (3 bytes)
		header.RegionCodes = ReadString(0x1f0, 16);
		header.Region = ParseRegion(header.RegionCodes);

		return header;
	}

	/// <summary>
	/// Parse region from region code string.
	/// </summary>
	private static GenesisRegion ParseRegion(string codes) {
		var region = GenesisRegion.Unknown;

		if (codes.Contains('J') || codes.Contains('1')) {
			region |= GenesisRegion.Japan;
		}

		if (codes.Contains('U') || codes.Contains('4')) {
			region |= GenesisRegion.Usa;
		}

		if (codes.Contains('E') || codes.Contains('8')) {
			region |= GenesisRegion.Europe;
		}

		return region == GenesisRegion.Unknown ? GenesisRegion.World : region;
	}

	/// <summary>
	/// Read a string from ROM.
	/// </summary>
	private string ReadString(int offset, int length) {
		if (offset + length > _romData.Length) {
			length = Math.Max(0, _romData.Length - offset);
		}

		if (length <= 0) return "";

		var bytes = new byte[length];
		Array.Copy(_romData, offset, bytes, 0, length);
		return System.Text.Encoding.ASCII.GetString(bytes).Trim('\0', ' ');
	}

	/// <summary>
	/// Read a big-endian 32-bit value.
	/// </summary>
	private uint ReadUInt32BE(int offset) {
		if (offset + 4 > _romData.Length) return 0;
		return (uint)((_romData[offset] << 24) |
					  (_romData[offset + 1] << 16) |
					  (_romData[offset + 2] << 8) |
					  _romData[offset + 3]);
	}

	/// <summary>
	/// Get a specific 64KB bank of ROM data.
	/// </summary>
	public byte[] GetBank(int bankIndex) {
		var bankSize = 0x10000;

		if (bankIndex < 0 || bankIndex >= BankCount) {
			throw new ArgumentOutOfRangeException(nameof(bankIndex),
				$"Bank index {bankIndex} out of range (0-{BankCount - 1})");
		}

		var offset = bankIndex * bankSize;
		var length = Math.Min(bankSize, _romData.Length - offset);
		var bank = new byte[length];
		Array.Copy(_romData, offset, bank, 0, length);
		return bank;
	}

	/// <summary>
	/// Get all ROM data (deinterleaved if was SMD format).
	/// </summary>
	public byte[] GetRomData() {
		var data = new byte[_romData.Length];
		Array.Copy(_romData, data, _romData.Length);
		return data;
	}

	/// <summary>
	/// Calculate the Genesis ROM checksum.
	/// </summary>
	public ushort CalculateChecksum() {
		// Checksum is sum of all 16-bit words from $200 to end
		uint sum = 0;

		for (int i = 0x200; i < _romData.Length - 1; i += 2) {
			sum += (uint)((_romData[i] << 8) | _romData[i + 1]);
		}

		// Handle odd byte
		if ((_romData.Length - 0x200) % 2 == 1) {
			sum += (uint)(_romData[_romData.Length - 1] << 8);
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Verify the ROM checksum.
	/// </summary>
	public bool VerifyChecksum() {
		return Header.Checksum == CalculateChecksum();
	}

	/// <summary>
	/// Build a new ROM with corrected checksum.
	/// </summary>
	public static byte[] FixChecksum(byte[] romData) {
		var parser = new GenesisRomParser(romData);
		var checksum = parser.CalculateChecksum();

		var result = new byte[romData.Length];
		Array.Copy(romData, result, romData.Length);

		// Write checksum at $18e (big-endian)
		result[0x18e] = (byte)(checksum >> 8);
		result[0x18f] = (byte)(checksum & 0xff);

		return result;
	}

	/// <summary>
	/// Convert to SMD (interleaved) format.
	/// </summary>
	public byte[] ToSmdFormat() {
		var numBlocks = (_romData.Length + SmdBlockSize - 1) / SmdBlockSize;
		var result = new byte[SmdHeaderSize + (numBlocks * SmdBlockSize)];

		// Write SMD header
		result[0] = (byte)numBlocks;
		result[1] = 0x00; // Not split
		result[8] = 0xaa;
		result[9] = 0xbb;

		// Interleave data
		for (int block = 0; block < numBlocks; block++) {
			var srcOffset = block * SmdBlockSize;
			var dstOffset = SmdHeaderSize + (block * SmdBlockSize);

			for (int i = 0; i < SmdBlockSize / 2; i++) {
				var srcPos = srcOffset + (i * 2);
				if (srcPos + 1 < _romData.Length) {
					// Even byte goes to second half
					result[dstOffset + (SmdBlockSize / 2) + i] = _romData[srcPos];
					// Odd byte goes to first half
					result[dstOffset + i] = _romData[srcPos + 1];
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Get information about the ROM.
	/// </summary>
	public GenesisRomInfo GetRomInfo() {
		return new GenesisRomInfo {
			DomesticName = Header.DomesticName,
			OverseasName = Header.OverseasName,
			ProductCode = Header.ProductCode,
			Region = Header.Region,
			RomSize = RomSize,
			BankCount = BankCount,
			HasSram = Header.HasSram,
			SramSize = Header.HasSram ? (int)(Header.SramEnd - Header.SramStart + 1) : 0,
			ChecksumValid = VerifyChecksum(),
			WasSmdFormat = WasSmdFormat
		};
	}

	/// <summary>
	/// Extract all banks as separate files.
	/// </summary>
	public async Task ExtractBanksAsync(string outputDir, CancellationToken cancellationToken = default) {
		Directory.CreateDirectory(outputDir);

		for (int i = 0; i < BankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();
			var bank = GetBank(i);
			var path = Path.Combine(outputDir, $"bank_{i:d2}.bin");
			await File.WriteAllBytesAsync(path, bank, cancellationToken);
		}

		// Extract header info
		var infoPath = Path.Combine(outputDir, "rom_info.json");
		var info = GetRomInfo();
		var json = System.Text.Json.JsonSerializer.Serialize(info, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
		await File.WriteAllTextAsync(infoPath, json, cancellationToken);
	}
}

/// <summary>
/// Parsed Genesis/Mega Drive ROM header.
/// </summary>
public class GenesisHeader {
	public bool IsValid { get; set; }
	public string ConsoleName { get; set; } = "";
	public string Copyright { get; set; } = "";
	public string DomesticName { get; set; } = "";
	public string OverseasName { get; set; } = "";
	public string ProductCode { get; set; } = "";
	public ushort Checksum { get; set; }
	public string IoSupport { get; set; } = "";
	public uint RomStart { get; set; }
	public uint RomEnd { get; set; }
	public uint RamStart { get; set; }
	public uint RamEnd { get; set; }
	public string SramInfo { get; set; } = "";
	public bool HasSram { get; set; }
	public uint SramStart { get; set; }
	public uint SramEnd { get; set; }
	public string ModemSupport { get; set; } = "";
	public string Memo { get; set; } = "";
	public string RegionCodes { get; set; } = "";
	public GenesisRegion Region { get; set; }
}

/// <summary>
/// Genesis region flags.
/// </summary>
[Flags]
public enum GenesisRegion {
	Unknown = 0,
	Japan = 1,
	Usa = 2,
	Europe = 4,
	World = Japan | Usa | Europe
}

/// <summary>
/// Summary information about a Genesis ROM.
/// </summary>
public class GenesisRomInfo {
	public string DomesticName { get; init; } = "";
	public string OverseasName { get; init; } = "";
	public string ProductCode { get; init; } = "";
	public GenesisRegion Region { get; init; }
	public int RomSize { get; init; }
	public int BankCount { get; init; }
	public bool HasSram { get; init; }
	public int SramSize { get; init; }
	public bool ChecksumValid { get; init; }
	public bool WasSmdFormat { get; init; }
}
