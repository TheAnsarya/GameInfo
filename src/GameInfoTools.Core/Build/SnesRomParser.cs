namespace GameInfoTools.Core.Build;

/// <summary>
/// SNES-specific ROM parsing and bank extraction utilities.
/// Supports LoROM, HiROM, ExHiROM, and enhancement chips.
/// </summary>
public class SnesRomParser {
	private readonly byte[] _romData;

	/// <summary>
	/// Standard SNES bank size (32KB for LoROM, 64KB for HiROM)
	/// </summary>
	public const int LoRomBankSize = 0x8000;
	public const int HiRomBankSize = 0x10000;

	/// <summary>
	/// SMC copier header size
	/// </summary>
	public const int CopierHeaderSize = 512;

	/// <summary>
	/// SNES tile size (8x8 pixels)
	/// </summary>
	public const int TileSize = 8;

	public SnesRomParser(byte[] romData) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		Header = ParseHeader();
	}

	/// <summary>
	/// Gets the parsed SNES header.
	/// </summary>
	public SnesHeader Header { get; }

	/// <summary>
	/// Gets the ROM mapping mode.
	/// </summary>
	public SnesMapping Mapping => Header.Mapping;

	/// <summary>
	/// Gets whether ROM has a 512-byte copier header.
	/// </summary>
	public bool HasCopierHeader => Header.HasCopierHeader;

	/// <summary>
	/// Gets the ROM size in bytes (excluding copier header).
	/// </summary>
	public int RomSize => Header.RomSize;

	/// <summary>
	/// Gets the number of banks.
	/// </summary>
	public int BankCount => Header.Mapping == SnesMapping.HiRom || Header.Mapping == SnesMapping.ExHiRom
		? RomSize / HiRomBankSize
		: RomSize / LoRomBankSize;

	/// <summary>
	/// Parse the SNES internal header.
	/// </summary>
	private SnesHeader ParseHeader() {
		// Check for copier header (512 bytes)
		var hasCopier = (_romData.Length % 0x8000) == 512;
		var baseOffset = hasCopier ? CopierHeaderSize : 0;

		// Try to find valid header at LoROM or HiROM location
		var loRomHeaderOffset = baseOffset + 0x7fb0;
		var hiRomHeaderOffset = baseOffset + 0xffb0;

		var header = new SnesHeader {
			HasCopierHeader = hasCopier,
			RomSize = _romData.Length - (hasCopier ? CopierHeaderSize : 0)
		};

		// Check HiROM first (more distinctive)
		if (hiRomHeaderOffset + 0x30 <= _romData.Length && IsValidHeader(hiRomHeaderOffset)) {
			ParseHeaderAt(hiRomHeaderOffset, header);
			header.Mapping = header.RomSize > 0x400000 ? SnesMapping.ExHiRom : SnesMapping.HiRom;
			header.HeaderOffset = hiRomHeaderOffset;
		}
		// Check LoROM
		else if (loRomHeaderOffset + 0x30 <= _romData.Length && IsValidHeader(loRomHeaderOffset)) {
			ParseHeaderAt(loRomHeaderOffset, header);
			header.Mapping = SnesMapping.LoRom;
			header.HeaderOffset = loRomHeaderOffset;
		}
		// Fallback: guess based on ROM size
		else {
			header.Mapping = header.RomSize > 0x200000 ? SnesMapping.HiRom : SnesMapping.LoRom;
			header.HeaderOffset = header.Mapping == SnesMapping.HiRom ? hiRomHeaderOffset : loRomHeaderOffset;
			if (header.HeaderOffset + 0x30 <= _romData.Length) {
				ParseHeaderAt(header.HeaderOffset, header);
			}
		}

		return header;
	}

	/// <summary>
	/// Check if a potential header location is valid.
	/// </summary>
	private bool IsValidHeader(int offset) {
		if (offset + 0x30 > _romData.Length) return false;

		// Check map mode byte
		var mapMode = _romData[offset + 0x15];
		if ((mapMode & 0x0f) > 5) return false;

		// Check ROM type byte (should be reasonable)
		var romType = _romData[offset + 0x16];
		if (romType > 0x15) return false;

		// Verify checksum complement
		var checksum = _romData[offset + 0x1e] | (_romData[offset + 0x1f] << 8);
		var complement = _romData[offset + 0x1c] | (_romData[offset + 0x1d] << 8);

		return (checksum ^ complement) == 0xffff;
	}

	/// <summary>
	/// Parse header data at a specific offset.
	/// </summary>
	private void ParseHeaderAt(int offset, SnesHeader header) {
		// Game title (21 bytes at offset 0x00)
		var titleBytes = new byte[21];
		Array.Copy(_romData, offset, titleBytes, 0, Math.Min(21, _romData.Length - offset));
		header.Title = System.Text.Encoding.ASCII.GetString(titleBytes).TrimEnd();

		// Map mode (offset 0x15)
		var mapMode = _romData[offset + 0x15];
		header.MapMode = mapMode;
		header.FastRom = (mapMode & 0x10) != 0;

		// ROM type (offset 0x16) - indicates enhancement chips
		header.RomType = _romData[offset + 0x16];
		header.EnhancementChip = GetEnhancementChip(header.RomType);

		// ROM size (offset 0x17) - 1KB << value
		var sizeCode = _romData[offset + 0x17];
		header.RomSizeCode = sizeCode;

		// SRAM size (offset 0x18) - 1KB << value, 0 = no SRAM
		var sramCode = _romData[offset + 0x18];
		header.SramSizeCode = sramCode;
		header.SramSize = sramCode > 0 ? (1024 << sramCode) : 0;

		// Country/Region (offset 0x19)
		header.Country = _romData[offset + 0x19];
		header.Region = GetRegion(header.Country);

		// Developer ID (offset 0x1a)
		header.DeveloperId = _romData[offset + 0x1a];

		// Version (offset 0x1b)
		header.Version = _romData[offset + 0x1b];

		// Checksum complement and checksum (offsets 0x1c-0x1f)
		header.ChecksumComplement = (ushort)(_romData[offset + 0x1c] | (_romData[offset + 0x1d] << 8));
		header.Checksum = (ushort)(_romData[offset + 0x1e] | (_romData[offset + 0x1f] << 8));
	}

	/// <summary>
	/// Get enhancement chip type from ROM type byte.
	/// </summary>
	private static SnesEnhancementChip GetEnhancementChip(byte romType) {
		return romType switch {
			0x13 or 0x14 or 0x15 => SnesEnhancementChip.SuperFx,
			0x34 or 0x35 => SnesEnhancementChip.Sa1,
			0x43 or 0x45 => SnesEnhancementChip.Sdd1,
			0x55 => SnesEnhancementChip.Srtc,
			0xe3 => SnesEnhancementChip.Cx4,
			0xf3 or 0xf5 or 0xf6 => SnesEnhancementChip.Spc7110,
			_ when (romType & 0x0f) == 3 => SnesEnhancementChip.Dsp,
			_ when (romType & 0x0f) == 4 => SnesEnhancementChip.Obc1,
			_ when (romType & 0x0f) == 5 => SnesEnhancementChip.Dsp,
			_ => SnesEnhancementChip.None
		};
	}

	/// <summary>
	/// Get region from country code.
	/// </summary>
	private static SnesRegion GetRegion(byte country) {
		return country switch {
			0x00 => SnesRegion.Japan,
			0x01 => SnesRegion.Usa,
			0x02 => SnesRegion.Europe,
			0x03 => SnesRegion.Sweden,
			0x04 => SnesRegion.Finland,
			0x05 => SnesRegion.Denmark,
			0x06 => SnesRegion.France,
			0x07 => SnesRegion.Netherlands,
			0x08 => SnesRegion.Spain,
			0x09 => SnesRegion.Germany,
			0x0a => SnesRegion.Italy,
			0x0b => SnesRegion.China,
			0x0c => SnesRegion.Indonesia,
			0x0d => SnesRegion.Korea,
			_ => SnesRegion.Unknown
		};
	}

	/// <summary>
	/// Get a specific bank of ROM data.
	/// </summary>
	public byte[] GetBank(int bankIndex) {
		var bankSize = Mapping == SnesMapping.HiRom || Mapping == SnesMapping.ExHiRom
			? HiRomBankSize
			: LoRomBankSize;

		if (bankIndex < 0 || bankIndex >= BankCount) {
			throw new ArgumentOutOfRangeException(nameof(bankIndex),
				$"Bank index {bankIndex} out of range (0-{BankCount - 1})");
		}

		var baseOffset = HasCopierHeader ? CopierHeaderSize : 0;
		var bank = new byte[bankSize];
		var offset = baseOffset + (bankIndex * bankSize);
		Array.Copy(_romData, offset, bank, 0, bankSize);
		return bank;
	}

	/// <summary>
	/// Get all ROM data (without copier header).
	/// </summary>
	public byte[] GetRomData() {
		var baseOffset = HasCopierHeader ? CopierHeaderSize : 0;
		var data = new byte[RomSize];
		Array.Copy(_romData, baseOffset, data, 0, RomSize);
		return data;
	}

	/// <summary>
	/// Convert SNES address to file offset.
	/// </summary>
	public int SnesAddressToOffset(int snesAddress) {
		var baseOffset = HasCopierHeader ? CopierHeaderSize : 0;

		return Mapping switch {
			SnesMapping.LoRom => LoRomToOffset(snesAddress) + baseOffset,
			SnesMapping.HiRom => HiRomToOffset(snesAddress) + baseOffset,
			SnesMapping.ExHiRom => ExHiRomToOffset(snesAddress) + baseOffset,
			_ => snesAddress + baseOffset
		};
	}

	/// <summary>
	/// Convert file offset to SNES address.
	/// </summary>
	public int OffsetToSnesAddress(int offset) {
		var baseOffset = HasCopierHeader ? CopierHeaderSize : 0;
		var romOffset = offset - baseOffset;

		return Mapping switch {
			SnesMapping.LoRom => OffsetToLoRom(romOffset),
			SnesMapping.HiRom => OffsetToHiRom(romOffset),
			SnesMapping.ExHiRom => OffsetToExHiRom(romOffset),
			_ => romOffset
		};
	}

	private static int LoRomToOffset(int snesAddress) {
		var bank = (snesAddress >> 16) & 0x7f;
		var offset = snesAddress & 0x7fff;
		return (bank * LoRomBankSize) + offset;
	}

	private static int OffsetToLoRom(int offset) {
		var bank = offset / LoRomBankSize;
		var addr = offset % LoRomBankSize;
		return ((bank | 0x80) << 16) | (addr + 0x8000);
	}

	private static int HiRomToOffset(int snesAddress) {
		var bank = (snesAddress >> 16) & 0x3f;
		var offset = snesAddress & 0xffff;
		return (bank * HiRomBankSize) + offset;
	}

	private static int OffsetToHiRom(int offset) {
		var bank = offset / HiRomBankSize;
		var addr = offset % HiRomBankSize;
		return ((bank | 0xc0) << 16) | addr;
	}

	private static int ExHiRomToOffset(int snesAddress) {
		var bank = (snesAddress >> 16) & 0x7f;
		var offset = snesAddress & 0xffff;
		if (bank >= 0x40) {
			bank -= 0x40;
		}

		return (bank * HiRomBankSize) + offset;
	}

	private static int OffsetToExHiRom(int offset) {
		var bank = offset / HiRomBankSize;
		var addr = offset % HiRomBankSize;
		if (bank >= 0x40) {
			return ((bank) << 16) | addr;
		}

		return ((bank | 0xc0) << 16) | addr;
	}

	/// <summary>
	/// Calculate the SNES checksum for ROM data.
	/// </summary>
	public ushort CalculateChecksum() {
		var data = GetRomData();
		uint sum = 0;

		// Pad to power of 2 if needed
		var size = data.Length;
		var paddedSize = 1;
		while (paddedSize < size) paddedSize <<= 1;

		// Calculate checksum
		for (int i = 0; i < size; i++) {
			sum += data[i];
		}

		// Handle mirroring for non-power-of-2 sizes
		if (size < paddedSize) {
			var mirror = paddedSize - size;
			for (int i = 0; i < mirror; i++) {
				sum += data[i % size];
			}
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Build a new SNES ROM with updated checksum.
	/// </summary>
	public static byte[] FixChecksum(byte[] romData) {
		var parser = new SnesRomParser(romData);
		var checksum = parser.CalculateChecksum();
		var complement = (ushort)(checksum ^ 0xffff);

		var result = new byte[romData.Length];
		Array.Copy(romData, result, romData.Length);

		var headerOffset = parser.Header.HeaderOffset;
		result[headerOffset + 0x1c] = (byte)(complement & 0xff);
		result[headerOffset + 0x1d] = (byte)((complement >> 8) & 0xff);
		result[headerOffset + 0x1e] = (byte)(checksum & 0xff);
		result[headerOffset + 0x1f] = (byte)((checksum >> 8) & 0xff);

		return result;
	}

	/// <summary>
	/// Remove copier header from ROM.
	/// </summary>
	public static byte[] RemoveCopierHeader(byte[] romData) {
		if ((romData.Length % 0x8000) != CopierHeaderSize) {
			return romData; // No copier header
		}

		var result = new byte[romData.Length - CopierHeaderSize];
		Array.Copy(romData, CopierHeaderSize, result, 0, result.Length);
		return result;
	}

	/// <summary>
	/// Get mapping layout information.
	/// </summary>
	public SnesMappingLayout GetMappingLayout() {
		return Mapping switch {
			SnesMapping.LoRom => new SnesMappingLayout {
				Name = "LoROM",
				BankSize = LoRomBankSize,
				RomBanks = "$80-$FF:$8000-$FFFF",
				RamBanks = "$70-$7D:$0000-$7FFF",
				Description = "32KB banks, ROM at $8000-$FFFF"
			},
			SnesMapping.HiRom => new SnesMappingLayout {
				Name = "HiROM",
				BankSize = HiRomBankSize,
				RomBanks = "$C0-$FF:$0000-$FFFF",
				RamBanks = "$20-$3F:$6000-$7FFF",
				Description = "64KB banks, full address space"
			},
			SnesMapping.ExHiRom => new SnesMappingLayout {
				Name = "ExHiROM",
				BankSize = HiRomBankSize,
				RomBanks = "$40-$7D:$0000-$FFFF, $C0-$FF:$0000-$FFFF",
				RamBanks = "$20-$3F:$6000-$7FFF",
				Description = "Extended HiROM for ROMs >4MB"
			},
			_ => new SnesMappingLayout {
				Name = "Unknown",
				BankSize = LoRomBankSize,
				RomBanks = "Unknown",
				RamBanks = "Unknown",
				Description = "Unknown mapping mode"
			}
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
		var info = new {
			title = Header.Title,
			mapping = Mapping.ToString(),
			romSize = RomSize,
			bankCount = BankCount,
			sramSize = Header.SramSize,
			region = Header.Region.ToString(),
			enhancementChip = Header.EnhancementChip.ToString(),
			fastRom = Header.FastRom,
			checksum = $"0x{Header.Checksum:x4}",
			version = Header.Version,
			hasCopierHeader = HasCopierHeader
		};
		var json = System.Text.Json.JsonSerializer.Serialize(info, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
		await File.WriteAllTextAsync(infoPath, json, cancellationToken);
	}
}

/// <summary>
/// Parsed SNES ROM header.
/// </summary>
public class SnesHeader {
	public string Title { get; set; } = "";
	public SnesMapping Mapping { get; set; } = SnesMapping.LoRom;
	public byte MapMode { get; set; }
	public byte RomType { get; set; }
	public byte RomSizeCode { get; set; }
	public byte SramSizeCode { get; set; }
	public int RomSize { get; set; }
	public int SramSize { get; set; }
	public byte Country { get; set; }
	public SnesRegion Region { get; set; }
	public byte DeveloperId { get; set; }
	public byte Version { get; set; }
	public ushort ChecksumComplement { get; set; }
	public ushort Checksum { get; set; }
	public bool FastRom { get; set; }
	public SnesEnhancementChip EnhancementChip { get; set; }
	public bool HasCopierHeader { get; set; }
	public int HeaderOffset { get; set; }
}

/// <summary>
/// SNES ROM mapping modes.
/// </summary>
public enum SnesMapping {
	Unknown,
	LoRom,
	HiRom,
	ExHiRom,
	Sa1,
	SuperFx
}

/// <summary>
/// SNES enhancement chips.
/// </summary>
public enum SnesEnhancementChip {
	None,
	Dsp,
	SuperFx,
	Sa1,
	Sdd1,
	Srtc,
	Obc1,
	Cx4,
	Spc7110
}

/// <summary>
/// SNES region codes.
/// </summary>
public enum SnesRegion {
	Unknown,
	Japan,
	Usa,
	Europe,
	Sweden,
	Finland,
	Denmark,
	France,
	Netherlands,
	Spain,
	Germany,
	Italy,
	China,
	Indonesia,
	Korea
}

/// <summary>
/// SNES mapping layout information.
/// </summary>
public class SnesMappingLayout {
	public required string Name { get; init; }
	public int BankSize { get; init; }
	public required string RomBanks { get; init; }
	public required string RamBanks { get; init; }
	public required string Description { get; init; }
}
