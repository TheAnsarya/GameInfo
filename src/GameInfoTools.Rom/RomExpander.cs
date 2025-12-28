using System.Security.Cryptography;
using GameInfoTools.Core;

namespace GameInfoTools.Rom;

/// <summary>
/// ROM expansion service for increasing ROM size while preserving data integrity.
/// Supports NES, SNES, Game Boy, and other platforms with bank-based expansion.
/// </summary>
public class RomExpander {
	/// <summary>
	/// Result of a ROM expansion operation.
	/// </summary>
	public record ExpansionResult(
		bool Success,
		int OldSize,
		int NewSize,
		int BanksAdded,
		string? ErrorMessage,
		byte[]? ExpandedRom
	);

	/// <summary>
	/// Options for ROM expansion.
	/// </summary>
	public record ExpansionOptions(
		int TargetSize,
		byte FillByte = 0xff,
		bool UpdateHeader = true,
		bool PreserveVectors = true,
		ExpansionMode Mode = ExpansionMode.AddBanks
	);

	/// <summary>
	/// How to perform the expansion.
	/// </summary>
	public enum ExpansionMode {
		/// <summary>Add new banks at the end of the ROM.</summary>
		AddBanks,
		/// <summary>Double ROM size by mirroring existing data.</summary>
		Mirror,
		/// <summary>Insert space at a specific location (requires pointer fixup).</summary>
		InsertSpace
	}

	/// <summary>
	/// Platform-specific expansion configuration.
	/// </summary>
	public record PlatformConfig(
		int HeaderSize,
		int BankSize,
		int MaxSize,
		int MinSize,
		int[] ValidSizes,
		Func<byte[], int, byte[]> HeaderUpdater
	);

	private static readonly Dictionary<SystemType, PlatformConfig> PlatformConfigs = new() {
		[SystemType.Nes] = new PlatformConfig(
			HeaderSize: 16,
			BankSize: 0x4000, // 16KB PRG banks
			MaxSize: 0x80000 + 16, // 512KB + header (MMC5 max)
			MinSize: 0x4000 + 16, // 16KB + header
			ValidSizes: [0x4000, 0x8000, 0x10000, 0x20000, 0x40000, 0x80000],
			HeaderUpdater: UpdateNesHeader
		),
		[SystemType.Snes] = new PlatformConfig(
			HeaderSize: 0, // Or 512 for copier header
			BankSize: 0x8000, // 32KB banks
			MaxSize: 0x600000, // 6MB (ExHiROM max)
			MinSize: 0x8000, // 32KB minimum
			ValidSizes: [0x8000, 0x10000, 0x20000, 0x40000, 0x80000, 0x100000, 0x200000, 0x400000],
			HeaderUpdater: UpdateSnesHeader
		),
		[SystemType.GameBoy] = new PlatformConfig(
			HeaderSize: 0,
			BankSize: 0x4000, // 16KB banks
			MaxSize: 0x800000, // 8MB (MBC5 max)
			MinSize: 0x8000, // 32KB minimum (2 banks)
			ValidSizes: [0x8000, 0x10000, 0x20000, 0x40000, 0x80000, 0x100000, 0x200000],
			HeaderUpdater: UpdateGameBoyHeader
		),
		[SystemType.GameBoyAdvance] = new PlatformConfig(
			HeaderSize: 0,
			BankSize: 0x4000, // 16KB logical chunks
			MaxSize: 0x2000000, // 32MB max
			MinSize: 0x80000, // 512KB minimum
			ValidSizes: [0x80000, 0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000],
			HeaderUpdater: UpdateGbaHeader
		)
	};

	/// <summary>
	/// Validates if expansion to the target size is possible.
	/// </summary>
	public static (bool IsValid, string? Error) ValidateExpansion(byte[] romData, int targetSize) {
		var info = Core.RomFile.GetRomInfo(romData);
		if (!PlatformConfigs.TryGetValue(info.System, out var config)) {
			return (false, $"Unsupported platform: {info.System}");
		}

		int dataSize = romData.Length - config.HeaderSize;
		int targetDataSize = targetSize - config.HeaderSize;

		if (targetDataSize <= dataSize) {
			return (false, $"Target size ({targetSize:N0} bytes) must be larger than current size ({romData.Length:N0} bytes)");
		}

		if (targetDataSize > config.MaxSize) {
			return (false, $"Target size exceeds platform maximum ({config.MaxSize:N0} bytes)");
		}

		if (targetDataSize % config.BankSize != 0) {
			return (false, $"Target size must be a multiple of bank size ({config.BankSize:N0} bytes)");
		}

		return (true, null);
	}

	/// <summary>
	/// Expands a ROM to the specified size.
	/// </summary>
	public static ExpansionResult Expand(byte[] romData, ExpansionOptions options) {
		var info = Core.RomFile.GetRomInfo(romData);
		if (!PlatformConfigs.TryGetValue(info.System, out var config)) {
			return new ExpansionResult(false, romData.Length, 0, 0, $"Unsupported platform: {info.System}", null);
		}

		var (IsValid, Error) = ValidateExpansion(romData, options.TargetSize);
		if (!IsValid) {
			return new ExpansionResult(false, romData.Length, 0, 0, Error, null);
		}

		return options.Mode switch {
			ExpansionMode.AddBanks => ExpandByAddingBanks(romData, options, config),
			ExpansionMode.Mirror => ExpandByMirroring(romData, options, config),
			ExpansionMode.InsertSpace => new ExpansionResult(false, romData.Length, 0, 0, "InsertSpace mode requires a location parameter - use InsertSpace() method instead", null),
			_ => new ExpansionResult(false, romData.Length, 0, 0, $"Unknown expansion mode: {options.Mode}", null)
		};
	}

	private static ExpansionResult ExpandByAddingBanks(byte[] romData, ExpansionOptions options, PlatformConfig config) {
		int oldDataSize = romData.Length - config.HeaderSize;
		int newDataSize = options.TargetSize - config.HeaderSize;
		int banksToAdd = (newDataSize - oldDataSize) / config.BankSize;

		// Create new ROM
		var newRom = new byte[options.TargetSize];

		// Copy header
		Array.Copy(romData, 0, newRom, 0, config.HeaderSize);

		// Copy existing data
		Array.Copy(romData, config.HeaderSize, newRom, config.HeaderSize, oldDataSize);

		// Fill new space
		Array.Fill(newRom, options.FillByte, config.HeaderSize + oldDataSize, newDataSize - oldDataSize);

		// Preserve interrupt vectors if requested (for NES)
		if (options.PreserveVectors && config.HeaderSize == 16) {
			// NES vectors are at the end of the last PRG bank
			// Copy from old location to new end
			int oldVectorOffset = romData.Length - 6;
			int newVectorOffset = newRom.Length - 6;
			if (options.TargetSize > romData.Length && oldVectorOffset >= config.HeaderSize) {
				Array.Copy(romData, oldVectorOffset, newRom, newVectorOffset, 6);
			}
		}

		// Update header if requested
		if (options.UpdateHeader) {
			newRom = config.HeaderUpdater(newRom, newDataSize);
		}

		return new ExpansionResult(
			Success: true,
			OldSize: romData.Length,
			NewSize: newRom.Length,
			BanksAdded: banksToAdd,
			ErrorMessage: null,
			ExpandedRom: newRom
		);
	}

	private static ExpansionResult ExpandByMirroring(byte[] romData, ExpansionOptions options, PlatformConfig config) {
		int oldDataSize = romData.Length - config.HeaderSize;
		int newDataSize = options.TargetSize - config.HeaderSize;

		// Mirroring doubles the ROM, so target should be double current
		if (newDataSize != oldDataSize * 2) {
			// Round up to next power of 2 if not exact double
			int targetPow2 = 1;
			while (targetPow2 < newDataSize) targetPow2 <<= 1;
			newDataSize = targetPow2;
		}

		var newRom = new byte[config.HeaderSize + newDataSize];

		// Copy header
		Array.Copy(romData, 0, newRom, 0, config.HeaderSize);

		// Mirror data until full
		int offset = config.HeaderSize;
		while (offset < newRom.Length) {
			int copySize = Math.Min(oldDataSize, newRom.Length - offset);
			Array.Copy(romData, config.HeaderSize, newRom, offset, copySize);
			offset += copySize;
		}

		// Update header
		if (options.UpdateHeader) {
			newRom = config.HeaderUpdater(newRom, newDataSize);
		}

		return new ExpansionResult(
			Success: true,
			OldSize: romData.Length,
			NewSize: newRom.Length,
			BanksAdded: (newDataSize / config.BankSize) - (oldDataSize / config.BankSize),
			ErrorMessage: null,
			ExpandedRom: newRom
		);
	}

	/// <summary>
	/// Inserts space at a specific location (advanced operation requiring pointer fixup).
	/// </summary>
	public static ExpansionResult InsertSpace(byte[] romData, int insertOffset, int insertSize, byte fillByte = 0xff) {
		var info = Core.RomFile.GetRomInfo(romData);
		if (!PlatformConfigs.TryGetValue(info.System, out var config)) {
			return new ExpansionResult(false, romData.Length, 0, 0, $"Unsupported platform: {info.System}", null);
		}

		if (insertOffset < config.HeaderSize || insertOffset >= romData.Length) {
			return new ExpansionResult(false, romData.Length, 0, 0, "Insert offset must be within ROM data area", null);
		}

		if (insertSize % config.BankSize != 0) {
			return new ExpansionResult(false, romData.Length, 0, 0, $"Insert size should be a multiple of bank size ({config.BankSize:N0} bytes)", null);
		}

		var newRom = new byte[romData.Length + insertSize];

		// Copy header and data before insert point
		Array.Copy(romData, 0, newRom, 0, insertOffset);

		// Fill inserted space
		Array.Fill(newRom, fillByte, insertOffset, insertSize);

		// Copy data after insert point
		Array.Copy(romData, insertOffset, newRom, insertOffset + insertSize, romData.Length - insertOffset);

		// Update header
		newRom = config.HeaderUpdater(newRom, newRom.Length - config.HeaderSize);

		return new ExpansionResult(
			Success: true,
			OldSize: romData.Length,
			NewSize: newRom.Length,
			BanksAdded: insertSize / config.BankSize,
			ErrorMessage: "WARNING: Pointers may need to be fixed for data after the insert point",
			ExpandedRom: newRom
		);
	}

	/// <summary>
	/// Gets the suggested expansion sizes for a ROM.
	/// </summary>
	public static List<(int Size, string Description)> GetSuggestedSizes(byte[] romData) {
		var info = Core.RomFile.GetRomInfo(romData);
		if (!PlatformConfigs.TryGetValue(info.System, out var config)) {
			return [];
		}

		var suggestions = new List<(int Size, string Description)>();
		int currentDataSize = romData.Length - config.HeaderSize;

		foreach (int validSize in config.ValidSizes) {
			if (validSize > currentDataSize && validSize <= config.MaxSize) {
				int banks = validSize / config.BankSize;
				int addedBanks = banks - (currentDataSize / config.BankSize);
				suggestions.Add((
					config.HeaderSize + validSize,
					$"{validSize / 1024}KB ({banks} banks, +{addedBanks} new)"
				));
			}
		}

		// Also suggest double size if not in list
		int doubleSize = currentDataSize * 2;
		if (!config.ValidSizes.Contains(doubleSize) && doubleSize <= config.MaxSize) {
			suggestions.Add((
				config.HeaderSize + doubleSize,
				$"{doubleSize / 1024}KB (doubled)"
			));
		}

		return suggestions.OrderBy(s => s.Size).ToList();
	}

	/// <summary>
	/// Calculates the checksum of ROM data (useful for verification).
	/// </summary>
	public static string CalculateChecksum(byte[] romData) {
		return Convert.ToHexStringLower(MD5.HashData(romData));
	}

	// Platform-specific header updaters
	private static byte[] UpdateNesHeader(byte[] rom, int dataSize) {
		// NES/iNES header: byte 4 = PRG ROM size in 16KB units
		int prgSize = dataSize; // Assume all PRG for simplicity
		rom[4] = (byte)(prgSize / 0x4000);
		return rom;
	}

	private static byte[] UpdateSnesHeader(byte[] rom, int dataSize) {
		// SNES internal header at $00FFD5-$00FFDC (LoROM) or $40FFD5-$40FFDC (HiROM)
		// ROM makeup byte at FFD5, size byte at FFD7
		// Size byte: $08 = 256KB, $09 = 512KB, $0A = 1MB, $0B = 2MB, $0C = 4MB

		// Determine header location (simple check)
		int headerOffset = 0xffc0;
		if (rom.Length > 0x8000 && rom.Length <= 0x10000) {
			headerOffset = 0x7fc0;
		}

		if (headerOffset + 0x17 < rom.Length) {
			// Calculate size byte
			int sizeByte = 8; // Start at 256KB
			int size = 0x40000;
			while (size < dataSize && sizeByte < 0x0d) {
				sizeByte++;
				size *= 2;
			}

			rom[headerOffset + 0x17] = (byte)sizeByte;

			// Update checksum complement and checksum at FFD4-FFD5 and FFDE-FFDF
			// For now, just zero them (proper checksum requires full calculation)
			rom[headerOffset + 0x1c] = 0xff;
			rom[headerOffset + 0x1d] = 0xff;
			rom[headerOffset + 0x1e] = 0x00;
			rom[headerOffset + 0x1f] = 0x00;
		}

		return rom;
	}

	private static byte[] UpdateGameBoyHeader(byte[] rom, int dataSize) {
		// Game Boy header at $0147 = MBC type, $0148 = ROM size
		// ROM size: $00 = 32KB, $01 = 64KB, $02 = 128KB, etc.
		if (rom.Length > 0x148) {
			int sizeByte = 0;
			int size = 0x8000; // 32KB
			while (size < dataSize && sizeByte < 8) {
				sizeByte++;
				size *= 2;
			}

			rom[0x148] = (byte)sizeByte;

			// Recalculate header checksum at $014D
			int checksum = 0;
			for (int i = 0x134; i <= 0x14c; i++) {
				checksum = checksum - rom[i] - 1;
			}

			rom[0x14d] = (byte)checksum;
		}

		return rom;
	}

	private static byte[] UpdateGbaHeader(byte[] rom, int dataSize) {
		// GBA doesn't have a size field in header - size is determined by file size
		// Just recalculate header complement check at 0xBD
		if (rom.Length > 0xbd) {
			int check = 0;
			for (int i = 0xa0; i < 0xbd; i++) {
				check -= rom[i];
			}

			rom[0xbd] = (byte)((check - 0x19) & 0xff);
		}

		return rom;
	}
}
