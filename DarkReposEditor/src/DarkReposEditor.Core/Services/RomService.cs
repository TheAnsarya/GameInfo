using System.IO.Hashing;
using System.Security.Cryptography;
using DarkReposEditor.Core.Interfaces;
using DarkReposEditor.Core.Models;

namespace DarkReposEditor.Core.Services;

/// <summary>
/// Service for managing ROM files - loading, detection, and hashing.
/// </summary>
public class RomService : IRomService
{
	// NES header magic: "NES\x1A"
	private static readonly byte[] NesHeaderMagic = [0x4e, 0x45, 0x53, 0x1a];

	// SNES header locations (LoROM and HiROM)
	private const int SnesLoRomHeader = 0x7fc0;
	private const int SnesHiRomHeader = 0xffc0;

	// Game Boy header location
	private const int GameBoyLogoOffset = 0x104;
	private static readonly byte[] GameBoyLogoStart = [0xce, 0xed, 0x66, 0x66];

	// GBA header
	private const int GbaHeaderOffset = 0x04;
	private static readonly byte[] GbaLogoStart = [0x24, 0xff, 0xae, 0x51];

	// Genesis header
	private const int GenesisHeaderOffset = 0x100;
	private static readonly byte[] GenesisMagic = "SEGA"u8.ToArray();

	/// <inheritdoc />
	public async Task<Rom> LoadAsync(string filePath, CancellationToken cancellationToken = default)
	{
		if (string.IsNullOrWhiteSpace(filePath))
			throw new ArgumentException("File path cannot be empty", nameof(filePath));

		if (!File.Exists(filePath))
			throw new FileNotFoundException("ROM file not found", filePath);

		var data = await File.ReadAllBytesAsync(filePath, cancellationToken);
		var fileName = Path.GetFileName(filePath);

		return await LoadAsync(data, fileName, cancellationToken);
	}

	/// <inheritdoc />
	public Task<Rom> LoadAsync(byte[] data, string fileName, CancellationToken cancellationToken = default)
	{
		if (data == null || data.Length == 0)
			throw new ArgumentException("ROM data cannot be empty", nameof(data));

		var platform = DetectPlatform(data, fileName);
		var sha256 = CalculateSha256(data);
		var crc32 = CalculateCrc32(data);

		var rom = new Rom
		{
			Id = Guid.NewGuid(),
			Name = Path.GetFileNameWithoutExtension(fileName),
			FileName = fileName,
			Platform = platform,
			Size = data.Length,
			Sha256 = sha256,
			Crc32 = crc32,
			Data = data,
			AddedAt = DateTime.UtcNow
		};

		// Try to extract additional info based on platform
		ExtractPlatformInfo(rom, data);

		return Task.FromResult(rom);
	}

	/// <inheritdoc />
	public Task<Rom?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
	{
		// This would typically query the database
		// For now, return null - will be implemented with repository pattern
		return Task.FromResult<Rom?>(null);
	}

	/// <inheritdoc />
	public Task<IReadOnlyList<Rom>> GetAllAsync(CancellationToken cancellationToken = default)
	{
		// This would typically query the database
		return Task.FromResult<IReadOnlyList<Rom>>(Array.Empty<Rom>());
	}

	/// <inheritdoc />
	public Task<Rom> SaveAsync(Rom rom, CancellationToken cancellationToken = default)
	{
		// This would typically save to database
		return Task.FromResult(rom);
	}

	/// <inheritdoc />
	public Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
	{
		// This would typically delete from database
		return Task.FromResult(false);
	}

	/// <inheritdoc />
	public RomPlatform DetectPlatform(byte[] data, string fileName)
	{
		// Check by file extension first
		var extension = Path.GetExtension(fileName).ToLowerInvariant();
		var platformByExt = extension switch
		{
			".nes" => RomPlatform.Nes,
			".sfc" or ".smc" => RomPlatform.Snes,
			".gb" => RomPlatform.GameBoy,
			".gbc" => RomPlatform.GameBoyColor,
			".gba" => RomPlatform.GameBoyAdvance,
			".md" or ".gen" or ".bin" when data.Length > GenesisHeaderOffset + 4 => RomPlatform.Genesis,
			".sms" => RomPlatform.MasterSystem,
			".n64" or ".z64" or ".v64" => RomPlatform.Nintendo64,
			".nds" => RomPlatform.NintendoDs,
			".pce" => RomPlatform.PcEngine,
			_ => RomPlatform.Unknown
		};

		// If we got a match from extension, verify with header if possible
		if (platformByExt != RomPlatform.Unknown)
			return platformByExt;

		// Try to detect by header/magic bytes
		return DetectPlatformByHeader(data);
	}

	/// <inheritdoc />
	public string CalculateSha256(byte[] data)
	{
		var hash = SHA256.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	/// <inheritdoc />
	public string CalculateCrc32(byte[] data)
	{
		var crc = new Crc32();
		crc.Append(data);
		var hash = crc.GetCurrentHash();
		// CRC32 is returned in little-endian, reverse for standard representation
		Array.Reverse(hash);
		return Convert.ToHexStringLower(hash);
	}

	/// <summary>
	/// Detect platform by analyzing ROM header/magic bytes.
	/// </summary>
	private static RomPlatform DetectPlatformByHeader(byte[] data)
	{
		if (data.Length < 4)
			return RomPlatform.Unknown;

		// Check NES header
		if (data.Length >= 16 && data.AsSpan(0, 4).SequenceEqual(NesHeaderMagic))
			return RomPlatform.Nes;

		// Check Game Boy logo
		if (data.Length > GameBoyLogoOffset + 4 &&
			data.AsSpan(GameBoyLogoOffset, 4).SequenceEqual(GameBoyLogoStart))
		{
			// Check GBC flag at 0x143
			if (data.Length > 0x143)
			{
				return data[0x143] switch
				{
					0x80 => RomPlatform.GameBoyColor, // GBC compatible
					0xc0 => RomPlatform.GameBoyColor, // GBC only
					_ => RomPlatform.GameBoy
				};
			}
			return RomPlatform.GameBoy;
		}

		// Check GBA header
		if (data.Length > GbaHeaderOffset + 4 &&
			data.AsSpan(GbaHeaderOffset, 4).SequenceEqual(GbaLogoStart))
			return RomPlatform.GameBoyAdvance;

		// Check Genesis header
		if (data.Length > GenesisHeaderOffset + 4 &&
			data.AsSpan(GenesisHeaderOffset, 4).SequenceEqual(GenesisMagic))
			return RomPlatform.Genesis;

		// Check for SNES by examining potential header locations
		if (data.Length >= 0x8000 && IsSnesRom(data))
			return RomPlatform.Snes;

		return RomPlatform.Unknown;
	}

	/// <summary>
	/// Check if data appears to be a SNES ROM by examining header checksums.
	/// </summary>
	private static bool IsSnesRom(byte[] data)
	{
		// Check for SMC header (512 byte copier header)
		var hasSmcHeader = data.Length % 0x8000 == 512;
		var offset = hasSmcHeader ? 512 : 0;

		// Try LoROM location
		if (data.Length > offset + SnesLoRomHeader + 0x20)
		{
			if (ValidateSnesHeader(data, offset + SnesLoRomHeader))
				return true;
		}

		// Try HiROM location
		if (data.Length > offset + SnesHiRomHeader + 0x20)
		{
			if (ValidateSnesHeader(data, offset + SnesHiRomHeader))
				return true;
		}

		return false;
	}

	/// <summary>
	/// Validate SNES header by checking checksum complement.
	/// </summary>
	private static bool ValidateSnesHeader(byte[] data, int headerOffset)
	{
		// SNES header has checksum at offset 0x1e-0x1f and complement at 0x1c-0x1d
		var checksum = (ushort)(data[headerOffset + 0x1e] | (data[headerOffset + 0x1f] << 8));
		var complement = (ushort)(data[headerOffset + 0x1c] | (data[headerOffset + 0x1d] << 8));

		// Checksum + complement should equal 0xFFFF
		return (ushort)(checksum + complement) == 0xffff;
	}

	/// <summary>
	/// Extract platform-specific information from the ROM.
	/// </summary>
	private static void ExtractPlatformInfo(Rom rom, byte[] data)
	{
		switch (rom.Platform)
		{
			case RomPlatform.Nes:
				ExtractNesInfo(rom, data);
				break;
			case RomPlatform.Snes:
				ExtractSnesInfo(rom, data);
				break;
			case RomPlatform.GameBoy:
			case RomPlatform.GameBoyColor:
				ExtractGameBoyInfo(rom, data);
				break;
		}
	}

	/// <summary>
	/// Extract NES-specific information (mapper, etc.).
	/// </summary>
	private static void ExtractNesInfo(Rom rom, byte[] data)
	{
		if (data.Length < 16)
			return;

		// iNES header format
		// Byte 6: Flags 6 (lower nibble of mapper)
		// Byte 7: Flags 7 (upper nibble of mapper)
		var mapperLow = (data[6] >> 4) & 0x0f;
		var mapperHigh = data[7] & 0xf0;
		rom.Mapper = mapperLow | mapperHigh;

		// Check for NES 2.0 format
		if ((data[7] & 0x0c) == 0x08)
		{
			// NES 2.0: mapper extends to byte 8
			rom.Mapper |= (data[8] & 0x0f) << 8;
		}
	}

	/// <summary>
	/// Extract SNES-specific information.
	/// </summary>
	private static void ExtractSnesInfo(Rom rom, byte[] data)
	{
		var hasSmcHeader = data.Length % 0x8000 == 512;
		var offset = hasSmcHeader ? 512 : 0;

		// Try to find valid header and extract title
		int headerOffset;
		if (data.Length > offset + SnesHiRomHeader + 0x20 &&
			ValidateSnesHeader(data, offset + SnesHiRomHeader))
		{
			headerOffset = offset + SnesHiRomHeader;
		}
		else if (data.Length > offset + SnesLoRomHeader + 0x20 &&
				 ValidateSnesHeader(data, offset + SnesLoRomHeader))
		{
			headerOffset = offset + SnesLoRomHeader;
		}
		else
		{
			return;
		}

		// Title is at offset 0x00-0x14 (21 bytes)
		var titleBytes = data.AsSpan(headerOffset, 21);
		rom.InternalTitle = System.Text.Encoding.ASCII.GetString(titleBytes).TrimEnd();
	}

	/// <summary>
	/// Extract Game Boy-specific information.
	/// </summary>
	private static void ExtractGameBoyInfo(Rom rom, byte[] data)
	{
		if (data.Length < 0x150)
			return;

		// Title is at 0x134-0x143 (16 bytes, but may be shorter)
		var titleLength = 16;
		if (data[0x143] == 0x80 || data[0x143] == 0xc0)
		{
			// GBC flag uses last byte of title area
			titleLength = 15;
		}

		var titleBytes = data.AsSpan(0x134, titleLength);
		// Title ends at first null byte
		var nullIndex = titleBytes.IndexOf((byte)0);
		if (nullIndex >= 0)
			titleBytes = titleBytes[..nullIndex];

		rom.InternalTitle = System.Text.Encoding.ASCII.GetString(titleBytes).TrimEnd();
	}
}
