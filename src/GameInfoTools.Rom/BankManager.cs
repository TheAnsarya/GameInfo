using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Rom;

/// <summary>
/// Bank management for banked ROM systems.
/// </summary>
public class BankManager {
	private readonly byte[] _data;
	private readonly RomInfo _romInfo;

	public BankManager(byte[] data) {
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
	public List<BankInfo> GetBanks() {
		var banks = new List<BankInfo>();

		switch (_romInfo.System) {
			case SystemType.Nes:
				return GetNesBanks();

			case SystemType.Snes:
				return GetSnesBanks();

			case SystemType.GameBoy:
				return GetGameBoyBanks();

			default:
				// Treat as flat ROM with 16KB banks
				int bankSize = 0x4000;
				int bankCount = (_data.Length - _romInfo.HeaderSize) / bankSize;
				for (int i = 0; i < bankCount; i++) {
					banks.Add(new BankInfo(
						i,
						_romInfo.HeaderSize + (i * bankSize),
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

	private List<BankInfo> GetNesBanks() {
		var banks = new List<BankInfo>();

		// iNES header: PRG ROM size at byte 4 (in 16KB units)
		int prgSize = _data[4] * 0x4000;
		int chrSize = _data[5] * 0x2000;
		int prgBanks = _data[4];
		int chrBanks = _data[5];

		int offset = _romInfo.HeaderSize;

		// PRG banks
		for (int i = 0; i < prgBanks; i++) {
			// Determine CPU mapping based on mapper and bank position
			int cpuStart, cpuEnd;
			if (prgBanks == 1) {
				// Single 16KB bank mirrors or maps to $C000
				cpuStart = 0xc000;
				cpuEnd = 0xffff;
			} else if (i == prgBanks - 1) {
				// Last bank typically fixed at $C000
				cpuStart = 0xc000;
				cpuEnd = 0xffff;
			} else {
				// Switchable bank at $8000
				cpuStart = 0x8000;
				cpuEnd = 0xbfff;
			}

			banks.Add(new BankInfo(i, offset, 0x4000, cpuStart, cpuEnd, true));
			offset += 0x4000;
		}

		// CHR banks (not CPU addressable directly)
		for (int i = 0; i < chrBanks; i++) {
			banks.Add(new BankInfo(prgBanks + i, offset, 0x2000, 0x0000, 0x1fff, false));
			offset += 0x2000;
		}

		return banks;
	}

	private List<BankInfo> GetSnesBanks() {
		var banks = new List<BankInfo>();
		int romStart = _romInfo.HeaderSize;
		int romSize = _data.Length - romStart;

		// Determine mapping mode from header
		// LoROM: 32KB banks mapped to $8000-$FFFF
		// HiROM: 64KB banks mapped to $0000-$FFFF

		bool isLoRom = true;
		if (romStart + 0x7fd5 < _data.Length) {
			byte mapMode = _data[romStart + 0x7fd5];
			isLoRom = (mapMode & 0x01) == 0;
		}

		int bankSize = isLoRom ? 0x8000 : 0x10000;
		int bankCount = romSize / bankSize;

		for (int i = 0; i < bankCount; i++) {
			int cpuBank = isLoRom ? 0x80 + (i * 2) : 0xc0 + i;
			int cpuStart = isLoRom ? (cpuBank << 16) | 0x8000 : cpuBank << 16;
			int cpuEnd = cpuStart + bankSize - 1;

			banks.Add(new BankInfo(i, romStart + (i * bankSize), bankSize, cpuStart, cpuEnd, true));
		}

		return banks;
	}

	private List<BankInfo> GetGameBoyBanks() {
		var banks = new List<BankInfo>();
		int bankSize = 0x4000;
		int romSize = _data.Length;
		int bankCount = romSize / bankSize;

		// Bank 0 always at $0000-$3FFF
		banks.Add(new BankInfo(0, 0, bankSize, 0x0000, 0x3fff, true));

		// Remaining banks switchable at $4000-$7FFF
		for (int i = 1; i < bankCount; i++) {
			banks.Add(new BankInfo(i, i * bankSize, bankSize, 0x4000, 0x7fff, true));
		}

		return banks;
	}

	/// <summary>
	/// Extract a single bank.
	/// </summary>
	public byte[] ExtractBank(int bankNumber) {
		var banks = GetBanks();
		var bank = banks.FirstOrDefault(b => b.Number == bankNumber);

		if (bank == null) {
			throw new ArgumentException($"Bank {bankNumber} not found");
		}

		var data = new byte[bank.Size];
		Array.Copy(_data, bank.FileOffset, data, 0, bank.Size);
		return data;
	}

	/// <summary>
	/// Replace a bank's contents.
	/// </summary>
	public void ReplaceBank(int bankNumber, byte[] newData) {
		var banks = GetBanks();
		var bank = banks.FirstOrDefault(b => b.Number == bankNumber);

		if (bank == null) {
			throw new ArgumentException($"Bank {bankNumber} not found");
		}

		if (newData.Length != bank.Size) {
			throw new ArgumentException($"Data size {newData.Length} doesn't match bank size {bank.Size}");
		}

		Array.Copy(newData, 0, _data, bank.FileOffset, bank.Size);
	}

	/// <summary>
	/// Get free space in a bank.
	/// </summary>
	public (int Start, int Length) FindFreeSpace(int bankNumber, byte fillByte = 0xff, int minSize = 16) {
		var bankData = ExtractBank(bankNumber);
		int bestStart = -1;
		int bestLength = 0;

		int currentStart = -1;
		int currentLength = 0;

		for (int i = 0; i < bankData.Length; i++) {
			if (bankData[i] == fillByte) {
				if (currentStart < 0) {
					currentStart = i;
				}

				currentLength++;
			} else {
				if (currentLength > bestLength && currentLength >= minSize) {
					bestStart = currentStart;
					bestLength = currentLength;
				}

				currentStart = -1;
				currentLength = 0;
			}
		}

		// Check final run
		if (currentLength > bestLength && currentLength >= minSize) {
			bestStart = currentStart;
			bestLength = currentLength;
		}

		return (bestStart, bestLength);
	}

	/// <summary>
	/// Calculate bank usage statistics.
	/// </summary>
	public (int Used, int Free, float UsagePercent) GetBankUsage(int bankNumber, byte fillByte = 0xff) {
		var bankData = ExtractBank(bankNumber);
		int freeBytes = 0;

		foreach (byte b in bankData) {
			if (b == fillByte) {
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
	public string GenerateBankMap() {
		var sb = new StringBuilder();
		var banks = GetBanks();

		sb.AppendLine($"ROM Bank Map - {_romInfo.System}");
		sb.AppendLine($"Total banks: {banks.Count}");
		sb.AppendLine();

		sb.AppendLine("Bank  | File Offset | CPU Address    | Size   | Type | Usage");
		sb.AppendLine("------|-------------|----------------|--------|------|-------");

		foreach (var bank in banks) {
			var (Used, Free, UsagePercent) = GetBankUsage(bank.Number);
			string typeStr = bank.IsPrgRom ? "PRG" : "CHR";

			sb.AppendLine($"{bank.Number,5} | ${bank.FileOffset:x6}     | ${bank.CpuStart:x4}-${bank.CpuEnd:x4} | {bank.Size,6} | {typeStr}  | {UsagePercent:F1}%");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Get all free space regions in a bank.
	/// </summary>
	public List<FreeSpaceRegion> FindAllFreeSpace(int bankNumber, byte fillByte = 0xff, int minSize = 8) {
		var bankData = ExtractBank(bankNumber);
		var regions = new List<FreeSpaceRegion>();

		int currentStart = -1;
		int currentLength = 0;

		for (int i = 0; i < bankData.Length; i++) {
			if (bankData[i] == fillByte) {
				if (currentStart < 0) {
					currentStart = i;
				}

				currentLength++;
			} else {
				if (currentLength >= minSize) {
					var bank = GetBanks().First(b => b.Number == bankNumber);
					regions.Add(new FreeSpaceRegion(bankNumber, currentStart, currentLength, bank.CpuStart + currentStart));
				}

				currentStart = -1;
				currentLength = 0;
			}
		}

		// Check final run
		if (currentLength >= minSize) {
			var bank = GetBanks().First(b => b.Number == bankNumber);
			regions.Add(new FreeSpaceRegion(bankNumber, currentStart, currentLength, bank.CpuStart + currentStart));
		}

		return regions;
	}

	/// <summary>
	/// Free space region.
	/// </summary>
	public record FreeSpaceRegion(int BankNumber, int BankOffset, int Length, int CpuAddress);

	/// <summary>
	/// Find all free space across all banks.
	/// </summary>
	public List<FreeSpaceRegion> FindAllFreeSpaceGlobal(byte fillByte = 0xff, int minSize = 8) {
		var allRegions = new List<FreeSpaceRegion>();

		foreach (var bank in GetBanks()) {
			allRegions.AddRange(FindAllFreeSpace(bank.Number, fillByte, minSize));
		}

		return allRegions.OrderByDescending(r => r.Length).ToList();
	}

	/// <summary>
	/// Get comprehensive bank statistics.
	/// </summary>
	public BankStatistics GetBankStatistics(int bankNumber, byte fillByte = 0xff) {
		var bankData = ExtractBank(bankNumber);
		var bank = GetBanks().First(b => b.Number == bankNumber);

		int freeBytes = 0;
		var byteHistogram = new int[256];
		int runs = 0;
		bool inRun = false;

		foreach (byte b in bankData) {
			byteHistogram[b]++;
			if (b == fillByte) {
				freeBytes++;
				if (!inRun) {
					runs++;
					inRun = true;
				}
			} else {
				inRun = false;
			}
		}

		int usedBytes = bankData.Length - freeBytes;

		// Calculate entropy
		double entropy = 0;
		foreach (int count in byteHistogram) {
			if (count > 0) {
				double p = (double)count / bankData.Length;
				entropy -= p * Math.Log2(p);
			}
		}

		// Find most common bytes
		var commonBytes = byteHistogram
			.Select((count, value) => (Value: (byte)value, Count: count))
			.OrderByDescending(x => x.Count)
			.Take(5)
			.ToList();

		return new BankStatistics(
			bankNumber,
			bank.Size,
			usedBytes,
			freeBytes,
			(float)usedBytes / bank.Size * 100f,
			entropy,
			runs,
			commonBytes
		);
	}

	/// <summary>
	/// Comprehensive bank statistics.
	/// </summary>
	public record BankStatistics(
		int BankNumber,
		int TotalSize,
		int UsedBytes,
		int FreeBytes,
		float UsagePercent,
		double Entropy,
		int FreeSpaceRegions,
		List<(byte Value, int Count)> MostCommonBytes
	);

	/// <summary>
	/// Get total ROM statistics.
	/// </summary>
	public RomStatistics GetRomStatistics(byte fillByte = 0xff) {
		var banks = GetBanks();
		int totalPrgSize = 0;
		int totalChrSize = 0;
		int totalPrgFree = 0;
		int totalChrFree = 0;
		int prgBankCount = 0;
		int chrBankCount = 0;

		foreach (var bank in banks) {
			var (used, free, _) = GetBankUsage(bank.Number, fillByte);
			if (bank.IsPrgRom) {
				totalPrgSize += bank.Size;
				totalPrgFree += free;
				prgBankCount++;
			} else {
				totalChrSize += bank.Size;
				totalChrFree += free;
				chrBankCount++;
			}
		}

		return new RomStatistics(
			_romInfo.System,
			banks.Count,
			prgBankCount,
			chrBankCount,
			totalPrgSize,
			totalChrSize,
			totalPrgFree,
			totalChrFree,
			totalPrgSize > 0 ? (float)(totalPrgSize - totalPrgFree) / totalPrgSize * 100f : 0f,
			totalChrSize > 0 ? (float)(totalChrSize - totalChrFree) / totalChrSize * 100f : 0f
		);
	}

	/// <summary>
	/// ROM-wide statistics.
	/// </summary>
	public record RomStatistics(
		SystemType System,
		int TotalBanks,
		int PrgBankCount,
		int ChrBankCount,
		int TotalPrgSize,
		int TotalChrSize,
		int TotalPrgFree,
		int TotalChrFree,
		float PrgUsagePercent,
		float ChrUsagePercent
	);

	/// <summary>
	/// Generate visual bank layout (ASCII art).
	/// </summary>
	public string GenerateVisualLayout(int width = 64, byte fillByte = 0xff) {
		var sb = new StringBuilder();
		var banks = GetBanks();

		sb.AppendLine("Visual Bank Layout");
		sb.AppendLine($"Legend: # = used, . = free ({fillByte:X2})");
		sb.AppendLine();

		foreach (var bank in banks) {
			var bankData = ExtractBank(bank.Number);
			int bytesPerChar = Math.Max(1, bankData.Length / width);

			sb.Append($"Bank {bank.Number,2} [{(bank.IsPrgRom ? "PRG" : "CHR")}] ");

			for (int i = 0; i < width; i++) {
				int start = i * bytesPerChar;
				int end = Math.Min((i + 1) * bytesPerChar, bankData.Length);

				// Check if this region is free
				bool isFree = true;
				for (int j = start; j < end && isFree; j++) {
					if (bankData[j] != fillByte) {
						isFree = false;
					}
				}

				sb.Append(isFree ? '.' : '#');
			}

			var (used, free, percent) = GetBankUsage(bank.Number, fillByte);
			sb.AppendLine($" {percent:F0}%");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Swap two banks.
	/// </summary>
	public void SwapBanks(int bank1Number, int bank2Number) {
		var bank1Data = ExtractBank(bank1Number);
		var bank2Data = ExtractBank(bank2Number);

		if (bank1Data.Length != bank2Data.Length) {
			throw new InvalidOperationException("Cannot swap banks of different sizes");
		}

		ReplaceBank(bank1Number, bank2Data);
		ReplaceBank(bank2Number, bank1Data);
	}

	/// <summary>
	/// Copy a bank to another location.
	/// </summary>
	public void CopyBank(int sourceBank, int targetBank) {
		var sourceData = ExtractBank(sourceBank);
		var targetBankInfo = GetBanks().FirstOrDefault(b => b.Number == targetBank)
			?? throw new ArgumentException($"Target bank {targetBank} not found");

		if (sourceData.Length != targetBankInfo.Size) {
			throw new InvalidOperationException("Cannot copy to bank of different size");
		}

		ReplaceBank(targetBank, sourceData);
	}

	/// <summary>
	/// Fill a region with a byte value.
	/// </summary>
	public void FillRegion(int bankNumber, int offset, int length, byte value) {
		var bank = GetBanks().FirstOrDefault(b => b.Number == bankNumber)
			?? throw new ArgumentException($"Bank {bankNumber} not found");

		if (offset < 0 || offset + length > bank.Size) {
			throw new ArgumentOutOfRangeException(nameof(offset), "Region out of bank bounds");
		}

		int fileOffset = bank.FileOffset + offset;
		for (int i = 0; i < length; i++) {
			_data[fileOffset + i] = value;
		}
	}

	/// <summary>
	/// Write data to a bank at a specific offset.
	/// </summary>
	public void WriteToBank(int bankNumber, int offset, byte[] data) {
		var bank = GetBanks().FirstOrDefault(b => b.Number == bankNumber)
			?? throw new ArgumentException($"Bank {bankNumber} not found");

		if (offset < 0 || offset + data.Length > bank.Size) {
			throw new ArgumentOutOfRangeException(nameof(offset), "Data would exceed bank bounds");
		}

		Array.Copy(data, 0, _data, bank.FileOffset + offset, data.Length);
	}

	/// <summary>
	/// Read data from a bank at a specific offset.
	/// </summary>
	public byte[] ReadFromBank(int bankNumber, int offset, int length) {
		var bank = GetBanks().FirstOrDefault(b => b.Number == bankNumber)
			?? throw new ArgumentException($"Bank {bankNumber} not found");

		if (offset < 0 || offset + length > bank.Size) {
			throw new ArgumentOutOfRangeException(nameof(offset), "Would read beyond bank bounds");
		}

		var result = new byte[length];
		Array.Copy(_data, bank.FileOffset + offset, result, 0, length);
		return result;
	}

	/// <summary>
	/// Detect bank relationships (pointers between banks).
	/// </summary>
	public List<BankRelationship> DetectBankRelationships() {
		var relationships = new List<BankRelationship>();
		var banks = GetBanks().Where(b => b.IsPrgRom).ToList();

		foreach (var sourceBank in banks) {
			var bankData = ExtractBank(sourceBank.Number);

			// Scan for potential pointer targets
			for (int i = 0; i < bankData.Length - 1; i++) {
				int potentialAddr = bankData[i] | (bankData[i + 1] << 8);

				// Check if this looks like a pointer to another bank
				foreach (var targetBank in banks.Where(b => b.Number != sourceBank.Number)) {
					if (potentialAddr >= targetBank.CpuStart && potentialAddr <= targetBank.CpuEnd) {
						relationships.Add(new BankRelationship(
							sourceBank.Number,
							targetBank.Number,
							i,
							potentialAddr,
							RelationshipType.Pointer
						));
					}
				}
			}
		}

		// Deduplicate and count
		return relationships
			.GroupBy(r => (r.SourceBank, r.TargetBank))
			.Select(g => g.First() with { Count = g.Count() })
			.OrderByDescending(r => r.Count)
			.ToList();
	}

	/// <summary>
	/// Bank relationship.
	/// </summary>
	public record BankRelationship(
		int SourceBank,
		int TargetBank,
		int SourceOffset,
		int TargetAddress,
		RelationshipType Type,
		int Count = 1
	);

	/// <summary>
	/// Type of relationship between banks.
	/// </summary>
	public enum RelationshipType {
		Pointer,        // Direct pointer
		Jump,           // JMP/JSR target
		Data,           // Data reference
	}

	/// <summary>
	/// Find a suitable free space region for data of given size.
	/// </summary>
	public FreeSpaceRegion? FindFreeSpaceForData(int size, byte fillByte = 0xff, int? preferredBank = null) {
		var allFree = FindAllFreeSpaceGlobal(fillByte, size);

		if (preferredBank.HasValue) {
			var inPreferred = allFree.FirstOrDefault(r => r.BankNumber == preferredBank.Value);
			if (inPreferred != null) {
				return inPreferred;
			}
		}

		return allFree.FirstOrDefault();
	}

	/// <summary>
	/// Export bank map to JSON.
	/// </summary>
	public string ExportBankMapToJson() {
		var banks = GetBanks();
		var stats = GetRomStatistics();

		var sb = new StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine($"  \"system\": \"{stats.System}\",");
		sb.AppendLine($"  \"totalBanks\": {stats.TotalBanks},");
		sb.AppendLine($"  \"prgBanks\": {stats.PrgBankCount},");
		sb.AppendLine($"  \"chrBanks\": {stats.ChrBankCount},");
		sb.AppendLine("  \"banks\": [");

		for (int i = 0; i < banks.Count; i++) {
			var bank = banks[i];
			var (used, free, percent) = GetBankUsage(bank.Number);

			sb.AppendLine("    {");
			sb.AppendLine($"      \"number\": {bank.Number},");
			sb.AppendLine($"      \"fileOffset\": \"0x{bank.FileOffset:x6}\",");
			sb.AppendLine($"      \"cpuStart\": \"0x{bank.CpuStart:x4}\",");
			sb.AppendLine($"      \"cpuEnd\": \"0x{bank.CpuEnd:x4}\",");
			sb.AppendLine($"      \"size\": {bank.Size},");
			sb.AppendLine($"      \"type\": \"{(bank.IsPrgRom ? "PRG" : "CHR")}\",");
			sb.AppendLine($"      \"usedBytes\": {used},");
			sb.AppendLine($"      \"freeBytes\": {free},");
			sb.AppendLine($"      \"usagePercent\": {percent:F1}");
			sb.Append("    }");
			sb.AppendLine(i < banks.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");
		return sb.ToString();
	}
}

/// <summary>
/// Bank reorganization planner.
/// </summary>
public class BankReorganizer {
	private readonly BankManager _manager;
	private readonly List<ReorganizeOperation> _operations = [];

	public BankReorganizer(BankManager manager) {
		_manager = manager;
	}

	/// <summary>
	/// Reorganization operation.
	/// </summary>
	public record ReorganizeOperation(ReorgType Type, int SourceBank, int? TargetBank, string Description);

	/// <summary>
	/// Type of reorganization.
	/// </summary>
	public enum ReorgType {
		Swap,
		Copy,
		Move,
		Clear,
	}

	/// <summary>
	/// Plan a swap operation.
	/// </summary>
	public void PlanSwap(int bank1, int bank2) {
		_operations.Add(new ReorganizeOperation(ReorgType.Swap, bank1, bank2, $"Swap bank {bank1} with bank {bank2}"));
	}

	/// <summary>
	/// Plan a copy operation.
	/// </summary>
	public void PlanCopy(int source, int target) {
		_operations.Add(new ReorganizeOperation(ReorgType.Copy, source, target, $"Copy bank {source} to bank {target}"));
	}

	/// <summary>
	/// Plan a clear operation.
	/// </summary>
	public void PlanClear(int bank, byte fillByte = 0xff) {
		_operations.Add(new ReorganizeOperation(ReorgType.Clear, bank, null, $"Clear bank {bank} with ${fillByte:x2}"));
	}

	/// <summary>
	/// Get planned operations.
	/// </summary>
	public IEnumerable<ReorganizeOperation> GetPlannedOperations() => _operations;

	/// <summary>
	/// Execute all planned operations.
	/// </summary>
	public void Execute() {
		foreach (var op in _operations) {
			switch (op.Type) {
				case ReorgType.Swap:
					_manager.SwapBanks(op.SourceBank, op.TargetBank!.Value);
					break;
				case ReorgType.Copy:
					_manager.CopyBank(op.SourceBank, op.TargetBank!.Value);
					break;
				case ReorgType.Clear:
					var bank = _manager.GetBanks().First(b => b.Number == op.SourceBank);
					_manager.FillRegion(op.SourceBank, 0, bank.Size, 0xff);
					break;
			}
		}

		_operations.Clear();
	}

	/// <summary>
	/// Clear all planned operations.
	/// </summary>
	public void ClearPlan() {
		_operations.Clear();
	}
}

/// <summary>
/// Bank expansion utilities for growing ROMs.
/// </summary>
public class BankExpander {
	/// <summary>
	/// Expansion plan.
	/// </summary>
	public record ExpansionPlan(int CurrentPrgBanks, int NewPrgBanks, int CurrentChrBanks, int NewChrBanks, int NewRomSize);

	/// <summary>
	/// Calculate expansion plan for NES ROM.
	/// </summary>
	public static ExpansionPlan CalculateNesPlan(byte[] romData, int additionalPrgBanks, int additionalChrBanks) {
		int currentPrg = romData[4];
		int currentChr = romData[5];

		int newPrg = currentPrg + additionalPrgBanks;
		int newChr = currentChr + additionalChrBanks;

		// Cap at max
		newPrg = Math.Min(newPrg, 255);
		newChr = Math.Min(newChr, 255);

		int headerSize = 16;
		int newSize = headerSize + (newPrg * 0x4000) + (newChr * 0x2000);

		return new ExpansionPlan(currentPrg, newPrg, currentChr, newChr, newSize);
	}

	/// <summary>
	/// Expand an NES ROM.
	/// </summary>
	public static byte[] ExpandNesRom(byte[] romData, int additionalPrgBanks, int additionalChrBanks, byte fillByte = 0xff) {
		var plan = CalculateNesPlan(romData, additionalPrgBanks, additionalChrBanks);

		var newRom = new byte[plan.NewRomSize];
		Array.Fill(newRom, fillByte);

		// Copy header
		Array.Copy(romData, 0, newRom, 0, 16);

		// Update header with new sizes
		newRom[4] = (byte)plan.NewPrgBanks;
		newRom[5] = (byte)plan.NewChrBanks;

		// Copy original PRG data
		int originalPrgSize = romData[4] * 0x4000;
		Array.Copy(romData, 16, newRom, 16, originalPrgSize);

		// Copy original CHR data to new location
		int originalChrSize = romData[5] * 0x2000;
		int newChrOffset = 16 + (plan.NewPrgBanks * 0x4000);
		Array.Copy(romData, 16 + originalPrgSize, newRom, newChrOffset, originalChrSize);

		return newRom;
	}
}
