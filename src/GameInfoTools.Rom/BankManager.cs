using System.Text;

namespace GameInfoTools.Rom;

/// <summary>
/// Bank management for banked ROM systems.
/// </summary>
public class BankManager
{
	private readonly byte[] _data;
	private readonly Core.RomInfo _romInfo;

	public BankManager(byte[] data)
	{
		_data = data;
		_romInfo = Core.RomFile.GetRomInfo(data);
	}

	/// <summary>
	/// Bank information.
	/// </summary>
	public record BankInfo(int Number, int FileOffset, int Size, int CpuStart, int CpuEnd, bool IsPrgRom);

	/// <summary>
	/// Get information about all banks.
	/// </summary>
	public List<BankInfo> GetBanks()
	{
		var banks = new List<BankInfo>();

		switch (_romInfo.System)
		{
			case Core.RomSystem.Nes:
				return GetNesBanks();

			case Core.RomSystem.Snes:
				return GetSnesBanks();

			case Core.RomSystem.GameBoy:
				return GetGameBoyBanks();

			default:
				// Treat as flat ROM with 16KB banks
				int bankSize = 0x4000;
				int bankCount = (_data.Length - _romInfo.HeaderSize) / bankSize;
				for (int i = 0; i < bankCount; i++)
				{
					banks.Add(new BankInfo(
						i,
						_romInfo.HeaderSize + i * bankSize,
						bankSize,
						0x8000,
						0xbfff,
						true
					));
				}
				break;
		}

		return banks;
	}

	private List<BankInfo> GetNesBanks()
	{
		var banks = new List<BankInfo>();

		// iNES header: PRG ROM size at byte 4 (in 16KB units)
		int prgSize = _data[4] * 0x4000;
		int chrSize = _data[5] * 0x2000;
		int prgBanks = _data[4];
		int chrBanks = _data[5];

		int offset = _romInfo.HeaderSize;

		// PRG banks
		for (int i = 0; i < prgBanks; i++)
		{
			// Determine CPU mapping based on mapper and bank position
			int cpuStart, cpuEnd;
			if (prgBanks == 1)
			{
				// Single 16KB bank mirrors or maps to $C000
				cpuStart = 0xc000;
				cpuEnd = 0xffff;
			}
			else if (i == prgBanks - 1)
			{
				// Last bank typically fixed at $C000
				cpuStart = 0xc000;
				cpuEnd = 0xffff;
			}
			else
			{
				// Switchable bank at $8000
				cpuStart = 0x8000;
				cpuEnd = 0xbfff;
			}

			banks.Add(new BankInfo(i, offset, 0x4000, cpuStart, cpuEnd, true));
			offset += 0x4000;
		}

		// CHR banks (not CPU addressable directly)
		for (int i = 0; i < chrBanks; i++)
		{
			banks.Add(new BankInfo(prgBanks + i, offset, 0x2000, 0x0000, 0x1fff, false));
			offset += 0x2000;
		}

		return banks;
	}

	private List<BankInfo> GetSnesBanks()
	{
		var banks = new List<BankInfo>();
		int romStart = _romInfo.HeaderSize;
		int romSize = _data.Length - romStart;

		// Determine mapping mode from header
		// LoROM: 32KB banks mapped to $8000-$FFFF
		// HiROM: 64KB banks mapped to $0000-$FFFF

		bool isLoRom = true;
		if (romStart + 0x7fd5 < _data.Length)
		{
			byte mapMode = _data[romStart + 0x7fd5];
			isLoRom = (mapMode & 0x01) == 0;
		}

		int bankSize = isLoRom ? 0x8000 : 0x10000;
		int bankCount = romSize / bankSize;

		for (int i = 0; i < bankCount; i++)
		{
			int cpuBank = isLoRom ? 0x80 + i * 2 : 0xc0 + i;
			int cpuStart = isLoRom ? (cpuBank << 16) | 0x8000 : cpuBank << 16;
			int cpuEnd = cpuStart + bankSize - 1;

			banks.Add(new BankInfo(i, romStart + i * bankSize, bankSize, cpuStart, cpuEnd, true));
		}

		return banks;
	}

	private List<BankInfo> GetGameBoyBanks()
	{
		var banks = new List<BankInfo>();
		int bankSize = 0x4000;
		int romSize = _data.Length;
		int bankCount = romSize / bankSize;

		// Bank 0 always at $0000-$3FFF
		banks.Add(new BankInfo(0, 0, bankSize, 0x0000, 0x3fff, true));

		// Remaining banks switchable at $4000-$7FFF
		for (int i = 1; i < bankCount; i++)
		{
			banks.Add(new BankInfo(i, i * bankSize, bankSize, 0x4000, 0x7fff, true));
		}

		return banks;
	}

	/// <summary>
	/// Extract a single bank.
	/// </summary>
	public byte[] ExtractBank(int bankNumber)
	{
		var banks = GetBanks();
		var bank = banks.FirstOrDefault(b => b.Number == bankNumber);

		if (bank == null)
		{
			throw new ArgumentException($"Bank {bankNumber} not found");
		}

		var data = new byte[bank.Size];
		Array.Copy(_data, bank.FileOffset, data, 0, bank.Size);
		return data;
	}

	/// <summary>
	/// Replace a bank's contents.
	/// </summary>
	public void ReplaceBank(int bankNumber, byte[] newData)
	{
		var banks = GetBanks();
		var bank = banks.FirstOrDefault(b => b.Number == bankNumber);

		if (bank == null)
		{
			throw new ArgumentException($"Bank {bankNumber} not found");
		}

		if (newData.Length != bank.Size)
		{
			throw new ArgumentException($"Data size {newData.Length} doesn't match bank size {bank.Size}");
		}

		Array.Copy(newData, 0, _data, bank.FileOffset, bank.Size);
	}

	/// <summary>
	/// Get free space in a bank.
	/// </summary>
	public (int Start, int Length) FindFreeSpace(int bankNumber, byte fillByte = 0xff, int minSize = 16)
	{
		var bankData = ExtractBank(bankNumber);
		int bestStart = -1;
		int bestLength = 0;

		int currentStart = -1;
		int currentLength = 0;

		for (int i = 0; i < bankData.Length; i++)
		{
			if (bankData[i] == fillByte)
			{
				if (currentStart < 0)
				{
					currentStart = i;
				}
				currentLength++;
			}
			else
			{
				if (currentLength > bestLength && currentLength >= minSize)
				{
					bestStart = currentStart;
					bestLength = currentLength;
				}
				currentStart = -1;
				currentLength = 0;
			}
		}

		// Check final run
		if (currentLength > bestLength && currentLength >= minSize)
		{
			bestStart = currentStart;
			bestLength = currentLength;
		}

		return (bestStart, bestLength);
	}

	/// <summary>
	/// Calculate bank usage statistics.
	/// </summary>
	public (int Used, int Free, float UsagePercent) GetBankUsage(int bankNumber, byte fillByte = 0xff)
	{
		var bankData = ExtractBank(bankNumber);
		int freeBytes = 0;

		foreach (byte b in bankData)
		{
			if (b == fillByte)
			{
				freeBytes++;
			}
		}

		int usedBytes = bankData.Length - freeBytes;
		float usagePercent = 100f * usedBytes / bankData.Length;

		return (usedBytes, freeBytes, usagePercent);
	}

	/// <summary>
	/// Generate a bank map report.
	/// </summary>
	public string GenerateBankMap()
	{
		var sb = new StringBuilder();
		var banks = GetBanks();

		sb.AppendLine($"ROM Bank Map - {_romInfo.System}");
		sb.AppendLine($"Total banks: {banks.Count}");
		sb.AppendLine();

		sb.AppendLine("Bank  | File Offset | CPU Address    | Size   | Type | Usage");
		sb.AppendLine("------|-------------|----------------|--------|------|-------");

		foreach (var bank in banks)
		{
			var usage = GetBankUsage(bank.Number);
			string typeStr = bank.IsPrgRom ? "PRG" : "CHR";

			sb.AppendLine($"{bank.Number,5} | ${bank.FileOffset:x6}     | ${bank.CpuStart:x4}-${bank.CpuEnd:x4} | {bank.Size,6} | {typeStr}  | {usage.UsagePercent:F1}%");
		}

		return sb.ToString();
	}
}
