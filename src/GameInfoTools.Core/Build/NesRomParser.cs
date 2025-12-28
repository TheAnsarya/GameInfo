namespace GameInfoTools.Core.Build;

/// <summary>
/// NES-specific ROM parsing and bank extraction utilities.
/// Supports iNES, NES 2.0, and various mappers.
/// </summary>
public class NesRomParser {
	private readonly byte[] _romData;

	/// <summary>
	/// Standard NES PRG bank size (16KB)
	/// </summary>
	public const int PrgBankSize = 0x4000;

	/// <summary>
	/// Standard NES CHR bank size (8KB)
	/// </summary>
	public const int ChrBankSize = 0x2000;

	/// <summary>
	/// Standard NES tile size (8x8, 2bpp = 16 bytes)
	/// </summary>
	public const int TileSize = 16;

	/// <summary>
	/// Tiles per CHR bank (512)
	/// </summary>
	public const int TilesPerChrBank = ChrBankSize / TileSize;

	public NesRomParser(byte[] romData) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		Header = ParseHeader();
	}

	/// <summary>
	/// Gets the parsed iNES header.
	/// </summary>
	public InesHeader Header { get; }

	/// <summary>
	/// Gets the mapper number.
	/// </summary>
	public int Mapper => Header.Mapper;

	/// <summary>
	/// Gets the number of PRG banks.
	/// </summary>
	public int PrgBankCount => Header.PrgRomSize / PrgBankSize;

	/// <summary>
	/// Gets the number of CHR banks.
	/// </summary>
	public int ChrBankCount => Header.ChrRomSize / ChrBankSize;

	/// <summary>
	/// Whether this ROM uses CHR-RAM instead of CHR-ROM.
	/// </summary>
	public bool UsesChrRam => Header.ChrRomSize == 0;

	/// <summary>
	/// Parse the iNES/NES 2.0 header.
	/// </summary>
	private InesHeader ParseHeader() {
		if (_romData.Length < 16) {
			throw new InvalidDataException("ROM too small for iNES header");
		}

		// Check magic number
		if (_romData[0] != 'N' || _romData[1] != 'E' || _romData[2] != 'S' || _romData[3] != 0x1a) {
			throw new InvalidDataException("Not a valid iNES ROM (missing NES\\x1a magic)");
		}

		var header = new InesHeader {
			PrgRomSize = _romData[4] * PrgBankSize,
			ChrRomSize = _romData[5] * ChrBankSize,
			Flags6 = _romData[6],
			Flags7 = _romData[7],
			Flags8 = _romData[8],
			Flags9 = _romData[9],
			Flags10 = _romData[10]
		};

		// Parse mapper number
		header.Mapper = (header.Flags6 >> 4) | (header.Flags7 & 0xf0);

		// Check for NES 2.0 format
		header.IsNes20 = (header.Flags7 & 0x0c) == 0x08;
		if (header.IsNes20) {
			// NES 2.0 extended mapper number
			header.Mapper |= (_romData[8] & 0x0f) << 8;

			// Extended PRG/CHR ROM sizes
			var prgHi = _romData[9] & 0x0f;
			var chrHi = _romData[9] >> 4;
			if (prgHi < 0x0f) {
				header.PrgRomSize = (_romData[4] | (prgHi << 8)) * PrgBankSize;
			}

			if (chrHi < 0x0f) {
				header.ChrRomSize = (_romData[5] | (chrHi << 8)) * ChrBankSize;
			}
		}

		// Parse flags
		header.VerticalMirroring = (header.Flags6 & 0x01) != 0;
		header.HasBattery = (header.Flags6 & 0x02) != 0;
		header.HasTrainer = (header.Flags6 & 0x04) != 0;
		header.FourScreenVram = (header.Flags6 & 0x08) != 0;
		header.VsUnisystem = (header.Flags7 & 0x01) != 0;
		header.PlayChoice10 = (header.Flags7 & 0x02) != 0;

		// Calculate data offsets
		header.HeaderSize = 16;
		header.TrainerOffset = header.HasTrainer ? 16 : 0;
		header.TrainerSize = header.HasTrainer ? 512 : 0;
		header.PrgRomOffset = header.HeaderSize + header.TrainerSize;
		header.ChrRomOffset = header.PrgRomOffset + header.PrgRomSize;

		return header;
	}

	/// <summary>
	/// Get PRG ROM data (all banks).
	/// </summary>
	public byte[] GetPrgRom() {
		var prg = new byte[Header.PrgRomSize];
		Array.Copy(_romData, Header.PrgRomOffset, prg, 0, Header.PrgRomSize);
		return prg;
	}

	/// <summary>
	/// Get a specific PRG bank.
	/// </summary>
	public byte[] GetPrgBank(int bankIndex) {
		if (bankIndex < 0 || bankIndex >= PrgBankCount) {
			throw new ArgumentOutOfRangeException(nameof(bankIndex),
				$"Bank index {bankIndex} out of range (0-{PrgBankCount - 1})");
		}

		var bank = new byte[PrgBankSize];
		var offset = Header.PrgRomOffset + (bankIndex * PrgBankSize);
		Array.Copy(_romData, offset, bank, 0, PrgBankSize);
		return bank;
	}

	/// <summary>
	/// Get CHR ROM data (all banks). Returns empty if CHR-RAM.
	/// </summary>
	public byte[] GetChrRom() {
		if (UsesChrRam) {
			return [];
		}

		var chr = new byte[Header.ChrRomSize];
		Array.Copy(_romData, Header.ChrRomOffset, chr, 0, Header.ChrRomSize);
		return chr;
	}

	/// <summary>
	/// Get a specific CHR bank.
	/// </summary>
	public byte[] GetChrBank(int bankIndex) {
		if (UsesChrRam) {
			throw new InvalidOperationException("ROM uses CHR-RAM, no CHR banks to extract");
		}

		if (bankIndex < 0 || bankIndex >= ChrBankCount) {
			throw new ArgumentOutOfRangeException(nameof(bankIndex),
				$"Bank index {bankIndex} out of range (0-{ChrBankCount - 1})");
		}

		var bank = new byte[ChrBankSize];
		var offset = Header.ChrRomOffset + (bankIndex * ChrBankSize);
		Array.Copy(_romData, offset, bank, 0, ChrBankSize);
		return bank;
	}

	/// <summary>
	/// Get trainer data if present.
	/// </summary>
	public byte[]? GetTrainer() {
		if (!Header.HasTrainer) {
			return null;
		}

		var trainer = new byte[512];
		Array.Copy(_romData, 16, trainer, 0, 512);
		return trainer;
	}

	/// <summary>
	/// Get mapper-specific bank layout information.
	/// </summary>
	public MapperBankLayout GetMapperLayout() {
		return Mapper switch {
			0 => new MapperBankLayout { // NROM
				Name = "NROM",
				PrgBankSize = Header.PrgRomSize <= 0x4000 ? 0x4000 : 0x8000,
				ChrBankSize = 0x2000,
				MaxPrgBanks = 2,
				MaxChrBanks = 1,
				Description = "No mapper (32KB PRG, 8KB CHR)"
			},
			1 => new MapperBankLayout { // MMC1
				Name = "MMC1",
				PrgBankSize = 0x4000, // Switchable 16KB
				ChrBankSize = 0x1000, // Switchable 4KB
				MaxPrgBanks = 16,
				MaxChrBanks = 32,
				Description = "Nintendo MMC1 (up to 256KB PRG, 128KB CHR)"
			},
			2 => new MapperBankLayout { // UxROM
				Name = "UxROM",
				PrgBankSize = 0x4000, // Switchable 16KB
				ChrBankSize = 0x2000, // CHR-RAM
				MaxPrgBanks = 16,
				MaxChrBanks = 0,
				Description = "UxROM (up to 256KB PRG, CHR-RAM)"
			},
			3 => new MapperBankLayout { // CNROM
				Name = "CNROM",
				PrgBankSize = 0x8000, // Fixed 32KB
				ChrBankSize = 0x2000, // Switchable 8KB
				MaxPrgBanks = 1,
				MaxChrBanks = 4,
				Description = "CNROM (32KB PRG, up to 32KB CHR)"
			},
			4 => new MapperBankLayout { // MMC3
				Name = "MMC3",
				PrgBankSize = 0x2000, // Switchable 8KB
				ChrBankSize = 0x0400, // Switchable 1KB/2KB
				MaxPrgBanks = 64,
				MaxChrBanks = 256,
				Description = "Nintendo MMC3 (up to 512KB PRG, 256KB CHR)"
			},
			5 => new MapperBankLayout { // MMC5
				Name = "MMC5",
				PrgBankSize = 0x2000, // Switchable 8KB
				ChrBankSize = 0x0400, // Switchable 1KB
				MaxPrgBanks = 128,
				MaxChrBanks = 256,
				Description = "Nintendo MMC5 (up to 1MB PRG, 1MB CHR)"
			},
			7 => new MapperBankLayout { // AxROM
				Name = "AxROM",
				PrgBankSize = 0x8000, // Switchable 32KB
				ChrBankSize = 0x2000, // CHR-RAM
				MaxPrgBanks = 8,
				MaxChrBanks = 0,
				Description = "AxROM (up to 256KB PRG, CHR-RAM)"
			},
			_ => new MapperBankLayout {
				Name = $"Mapper {Mapper}",
				PrgBankSize = 0x4000,
				ChrBankSize = 0x2000,
				MaxPrgBanks = PrgBankCount,
				MaxChrBanks = ChrBankCount,
				Description = $"Unknown mapper {Mapper}"
			}
		};
	}

	/// <summary>
	/// Extract all banks as separate files.
	/// </summary>
	public async Task ExtractBanksAsync(string outputDir, CancellationToken cancellationToken = default) {
		Directory.CreateDirectory(outputDir);

		// Extract PRG banks
		var prgDir = Path.Combine(outputDir, "prg");
		Directory.CreateDirectory(prgDir);

		for (int i = 0; i < PrgBankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();
			var bank = GetPrgBank(i);
			var path = Path.Combine(prgDir, $"prg_bank_{i:d2}.bin");
			await File.WriteAllBytesAsync(path, bank, cancellationToken);
		}

		// Extract CHR banks
		if (!UsesChrRam) {
			var chrDir = Path.Combine(outputDir, "chr");
			Directory.CreateDirectory(chrDir);

			for (int i = 0; i < ChrBankCount; i++) {
				cancellationToken.ThrowIfCancellationRequested();
				var bank = GetChrBank(i);
				var path = Path.Combine(chrDir, $"chr_bank_{i:d2}.bin");
				await File.WriteAllBytesAsync(path, bank, cancellationToken);
			}
		}

		// Extract header info
		var infoPath = Path.Combine(outputDir, "rom_info.json");
		var info = new {
			mapper = Mapper,
			mapperName = GetMapperLayout().Name,
			prgBanks = PrgBankCount,
			chrBanks = ChrBankCount,
			usesChrRam = UsesChrRam,
			prgRomSize = Header.PrgRomSize,
			chrRomSize = Header.ChrRomSize,
			mirroring = Header.VerticalMirroring ? "vertical" : "horizontal",
			hasBattery = Header.HasBattery,
			hasTrainer = Header.HasTrainer,
			isNes20 = Header.IsNes20
		};
		var json = System.Text.Json.JsonSerializer.Serialize(info, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
		await File.WriteAllTextAsync(infoPath, json, cancellationToken);

		// Extract trainer if present
		if (Header.HasTrainer) {
			var trainer = GetTrainer();
			if (trainer != null) {
				var trainerPath = Path.Combine(outputDir, "trainer.bin");
				await File.WriteAllBytesAsync(trainerPath, trainer, cancellationToken);
			}
		}
	}

	/// <summary>
	/// Build a complete iNES ROM from components.
	/// </summary>
	public static byte[] BuildRom(
		InesHeader header,
		byte[] prgRom,
		byte[]? chrRom = null,
		byte[]? trainer = null) {

		var headerBytes = BuildInesHeader(header);
		var totalSize = 16 + (trainer?.Length ?? 0) + prgRom.Length + (chrRom?.Length ?? 0);
		var rom = new byte[totalSize];

		var offset = 0;

		// Copy header
		Array.Copy(headerBytes, 0, rom, offset, 16);
		offset += 16;

		// Copy trainer if present
		if (trainer != null) {
			Array.Copy(trainer, 0, rom, offset, trainer.Length);
			offset += trainer.Length;
		}

		// Copy PRG ROM
		Array.Copy(prgRom, 0, rom, offset, prgRom.Length);
		offset += prgRom.Length;

		// Copy CHR ROM if present
		if (chrRom != null) {
			Array.Copy(chrRom, 0, rom, offset, chrRom.Length);
		}

		return rom;
	}

	/// <summary>
	/// Build iNES header bytes.
	/// </summary>
	public static byte[] BuildInesHeader(InesHeader header) {
		var bytes = new byte[16];

		// Magic number
		bytes[0] = (byte)'N';
		bytes[1] = (byte)'E';
		bytes[2] = (byte)'S';
		bytes[3] = 0x1a;

		// PRG/CHR size
		bytes[4] = (byte)(header.PrgRomSize / PrgBankSize);
		bytes[5] = (byte)(header.ChrRomSize / ChrBankSize);

		// Flags 6
		bytes[6] = (byte)(
			(header.VerticalMirroring ? 0x01 : 0) |
			(header.HasBattery ? 0x02 : 0) |
			(header.HasTrainer ? 0x04 : 0) |
			(header.FourScreenVram ? 0x08 : 0) |
			((header.Mapper & 0x0f) << 4));

		// Flags 7
		bytes[7] = (byte)(
			(header.VsUnisystem ? 0x01 : 0) |
			(header.PlayChoice10 ? 0x02 : 0) |
			(header.IsNes20 ? 0x08 : 0) |
			(header.Mapper & 0xf0));

		return bytes;
	}
}

/// <summary>
/// Parsed iNES/NES 2.0 header.
/// </summary>
public class InesHeader {
	public int PrgRomSize { get; set; }
	public int ChrRomSize { get; set; }
	public int Mapper { get; set; }
	public byte Flags6 { get; set; }
	public byte Flags7 { get; set; }
	public byte Flags8 { get; set; }
	public byte Flags9 { get; set; }
	public byte Flags10 { get; set; }

	public bool IsNes20 { get; set; }
	public bool VerticalMirroring { get; set; }
	public bool HasBattery { get; set; }
	public bool HasTrainer { get; set; }
	public bool FourScreenVram { get; set; }
	public bool VsUnisystem { get; set; }
	public bool PlayChoice10 { get; set; }

	public int HeaderSize { get; set; }
	public int TrainerOffset { get; set; }
	public int TrainerSize { get; set; }
	public int PrgRomOffset { get; set; }
	public int ChrRomOffset { get; set; }
}

/// <summary>
/// Mapper-specific bank layout information.
/// </summary>
public class MapperBankLayout {
	public required string Name { get; init; }
	public int PrgBankSize { get; init; }
	public int ChrBankSize { get; init; }
	public int MaxPrgBanks { get; init; }
	public int MaxChrBanks { get; init; }
	public required string Description { get; init; }
}
