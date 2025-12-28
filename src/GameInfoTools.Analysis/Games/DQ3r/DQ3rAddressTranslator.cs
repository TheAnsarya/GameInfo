namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// SNES HiROM address translation utilities for DQ3r.
/// </summary>
public static class DQ3rAddressTranslator {
	private const int HiRomOffset = DQ3rTypes.RomSpec.HiRomOffset;
	private const int BankSize = DQ3rTypes.RomSpec.BankSize;

	/// <summary>
	/// Convert SNES address to file (PC) offset.
	/// HiROM: $C0:0000 maps to file offset $000000.
	/// </summary>
	/// <param name="snesAddress">SNES address (24-bit).</param>
	/// <returns>File offset.</returns>
	public static int SnesAddressToFile(int snesAddress) {
		// HiROM mapping: bank $C0+ maps directly with offset
		if (snesAddress >= HiRomOffset) {
			return snesAddress - HiRomOffset;
		}

		// LoROM-style access (banks $00-$3F mirror HiROM)
		int bank = (snesAddress >> 16) & 0xff;
		int offset = snesAddress & 0xffff;

		if (bank < 0x40 && offset >= 0x8000) {
			// Mirror of HiROM banks
			return (bank * BankSize) + (offset - 0x8000);
		}

		// Direct mapping fallback
		return snesAddress & 0x3fffff;
	}

	/// <summary>
	/// Convert file (PC) offset to SNES address.
	/// </summary>
	/// <param name="fileOffset">File offset.</param>
	/// <returns>SNES address (24-bit).</returns>
	public static int FileToSnesAddress(int fileOffset) {
		// HiROM: file offset maps to $C0:xxxx+
		return fileOffset + HiRomOffset;
	}

	/// <summary>
	/// Parse a SNES address string like "$C0:1234" to integer.
	/// </summary>
	/// <param name="addressString">Address string in various formats.</param>
	/// <returns>SNES address as integer, or -1 if invalid.</returns>
	public static int ParseSnesAddress(string addressString) {
		if (string.IsNullOrWhiteSpace(addressString))
			return -1;

		// Remove common prefixes and whitespace
		var clean = addressString.Trim().TrimStart('$').Replace(":", "");

		// Try parsing as hex
		if (int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)) {
			return result;
		}

		return -1;
	}

	/// <summary>
	/// Format SNES address as standard string.
	/// </summary>
	/// <param name="snesAddress">SNES address.</param>
	/// <returns>Formatted string like "$C0:1234".</returns>
	public static string FormatSnesAddress(int snesAddress) {
		int bank = (snesAddress >> 16) & 0xff;
		int offset = snesAddress & 0xffff;
		return $"${bank:x2}:{offset:x4}";
	}

	/// <summary>
	/// Format file offset as hex string.
	/// </summary>
	/// <param name="fileOffset">File offset.</param>
	/// <returns>Formatted string like "$00:1234".</returns>
	public static string FormatFileOffset(int fileOffset) => $"${fileOffset:x6}";

	/// <summary>
	/// Get bank number from file offset.
	/// </summary>
	/// <param name="fileOffset">File offset.</param>
	/// <returns>Bank number ($C0-$FF).</returns>
	public static int GetBank(int fileOffset) =>
		(fileOffset / BankSize) + DQ3rTypes.RomSpec.FirstBank;

	/// <summary>
	/// Get file offset for start of bank.
	/// </summary>
	/// <param name="bankNumber">Bank number ($C0-$FF).</param>
	/// <returns>File offset.</returns>
	public static int GetBankStartOffset(int bankNumber) =>
		(bankNumber - DQ3rTypes.RomSpec.FirstBank) * BankSize;

	/// <summary>
	/// Get file offset for end of bank.
	/// </summary>
	/// <param name="bankNumber">Bank number ($C0-$FF).</param>
	/// <returns>File offset (exclusive).</returns>
	public static int GetBankEndOffset(int bankNumber) =>
		GetBankStartOffset(bankNumber) + BankSize;

	/// <summary>
	/// Check if address is within valid HiROM range.
	/// </summary>
	/// <param name="snesAddress">SNES address.</param>
	/// <returns>True if valid.</returns>
	public static bool IsValidSnesAddress(int snesAddress) {
		int bank = (snesAddress >> 16) & 0xff;
		return bank >= DQ3rTypes.RomSpec.FirstBank && bank <= DQ3rTypes.RomSpec.LastBank;
	}

	/// <summary>
	/// Check if file offset is within ROM bounds.
	/// </summary>
	/// <param name="fileOffset">File offset.</param>
	/// <returns>True if valid.</returns>
	public static bool IsValidFileOffset(int fileOffset) =>
		fileOffset >= 0 && fileOffset < DQ3rTypes.RomSpec.RomSize;
}
