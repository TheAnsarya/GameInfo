namespace GameInfoTools.Core.Analysis;

// C# equivalent of: tools/rom/pointer_scanner.py

/// <summary>
/// Represents a detected pointer in ROM
/// </summary>
public record PointerInfo {
	/// <summary>
	/// Address where the pointer is located
	/// </summary>
	public required int PointerAddress { get; init; }

	/// <summary>
	/// The target address the pointer points to
	/// </summary>
	public required int TargetAddress { get; init; }

	/// <summary>
	/// Size of the pointer in bytes (2 or 3 typically)
	/// </summary>
	public int PointerSize { get; init; } = 2;

	/// <summary>
	/// Bank number if applicable
	/// </summary>
	public int? Bank { get; init; }

	/// <summary>
	/// Type of pointer detected
	/// </summary>
	public PointerType Type { get; init; } = PointerType.Unknown;

	/// <summary>
	/// Confidence score (0-100)
	/// </summary>
	public int Confidence { get; init; } = 50;

	/// <summary>
	/// Optional label/name for this pointer
	/// </summary>
	public string? Label { get; init; }
}

/// <summary>
/// Types of pointers
/// </summary>
public enum PointerType {
	Unknown,
	CodeJump,
	DataTable,
	StringPointer,
	GraphicsPointer,
	MapPointer,
	SoundPointer
}

/// <summary>
/// Pointer format for different platforms
/// </summary>
public enum PointerFormat {
	/// <summary>Little-endian 16-bit (NES, SNES, GB)</summary>
	LittleEndian16,
	/// <summary>Big-endian 16-bit (Genesis)</summary>
	BigEndian16,
	/// <summary>Little-endian 24-bit (SNES long)</summary>
	LittleEndian24,
	/// <summary>Big-endian 24-bit</summary>
	BigEndian24,
	/// <summary>Split bank/address (NES mapped)</summary>
	BankSplit,
	/// <summary>Relative offset from pointer location</summary>
	Relative
}

/// <summary>
/// Configuration for pointer scanning
/// </summary>
public record PointerScanConfig {
	/// <summary>Pointer format to search for</summary>
	public PointerFormat Format { get; init; } = PointerFormat.LittleEndian16;

	/// <summary>Minimum valid target address</summary>
	public int MinTarget { get; init; } = 0x8000;

	/// <summary>Maximum valid target address</summary>
	public int MaxTarget { get; init; } = 0xFFFF;

	/// <summary>Bank size for mapped ROMs</summary>
	public int BankSize { get; init; } = 0x4000;

	/// <summary>ROM header size to skip</summary>
	public int HeaderSize { get; init; } = 16;

	/// <summary>Base address for CPU mapping</summary>
	public int BaseAddress { get; init; } = 0x8000;

	/// <summary>Whether to detect pointer tables</summary>
	public bool DetectTables { get; init; } = true;

	/// <summary>Minimum consecutive pointers to consider a table</summary>
	public int MinTableSize { get; init; } = 4;
}

/// <summary>
/// Represents a table of consecutive pointers
/// </summary>
public record PointerTable {
	/// <summary>Start address of the table</summary>
	public required int StartAddress { get; init; }

	/// <summary>Number of entries in the table</summary>
	public required int EntryCount { get; init; }

	/// <summary>Size of each pointer entry</summary>
	public int EntrySize { get; init; } = 2;

	/// <summary>All pointers in the table</summary>
	public required IReadOnlyList<PointerInfo> Pointers { get; init; }

	/// <summary>Confidence that this is actually a pointer table</summary>
	public int Confidence { get; init; } = 50;

	/// <summary>Optional label</summary>
	public string? Label { get; init; }
}

/// <summary>
/// Scans ROM data for pointers and pointer tables
/// </summary>
public class PointerScanner {
	private readonly byte[] _romData;
	private readonly PointerScanConfig _config;

	public PointerScanner(byte[] romData, PointerScanConfig? config = null) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		_config = config ?? new PointerScanConfig();
	}

	/// <summary>
	/// Scan the entire ROM for valid pointers
	/// </summary>
	public List<PointerInfo> ScanAll() {
		return ScanRange(_config.HeaderSize, _romData.Length - _config.HeaderSize);
	}

	/// <summary>
	/// Scan a specific range for pointers
	/// </summary>
	public List<PointerInfo> ScanRange(int start, int length) {
		var pointers = new List<PointerInfo>();
		var pointerSize = GetPointerSize(_config.Format);

		for (var offset = start; offset < start + length - pointerSize + 1; offset++) {
			var pointer = TryReadPointer(offset);
			if (pointer != null) {
				pointers.Add(pointer);
			}
		}

		return pointers;
	}

	/// <summary>
	/// Find all references to a specific address
	/// </summary>
	public List<PointerInfo> FindReferencesTo(int targetAddress) {
		var pointers = new List<PointerInfo>();
		var pointerSize = GetPointerSize(_config.Format);

		for (var offset = _config.HeaderSize; offset < _romData.Length - pointerSize + 1; offset++) {
			var pointer = TryReadPointer(offset);
			if (pointer != null && pointer.TargetAddress == targetAddress) {
				pointers.Add(pointer);
			}
		}

		return pointers;
	}

	/// <summary>
	/// Detect pointer tables in a range
	/// </summary>
	public List<PointerTable> DetectTables(int start, int length) {
		var tables = new List<PointerTable>();
		var pointerSize = GetPointerSize(_config.Format);
		var currentTable = new List<PointerInfo>();
		var tableStart = -1;

		for (var offset = start; offset < start + length - pointerSize + 1; offset += pointerSize) {
			var pointer = TryReadPointer(offset);

			if (pointer != null) {
				if (currentTable.Count == 0) {
					tableStart = offset;
				}
				currentTable.Add(pointer);
			} else {
				// End of potential table
				if (currentTable.Count >= _config.MinTableSize) {
					var confidence = CalculateTableConfidence(currentTable);
					tables.Add(new PointerTable {
						StartAddress = tableStart,
						EntryCount = currentTable.Count,
						EntrySize = pointerSize,
						Pointers = currentTable.ToList(),
						Confidence = confidence
					});
				}
				currentTable.Clear();
			}
		}

		// Check remaining entries
		if (currentTable.Count >= _config.MinTableSize) {
			var confidence = CalculateTableConfidence(currentTable);
			tables.Add(new PointerTable {
				StartAddress = tableStart,
				EntryCount = currentTable.Count,
				EntrySize = pointerSize,
				Pointers = currentTable.ToList(),
				Confidence = confidence
			});
		}

		return tables;
	}

	/// <summary>
	/// Try to read a pointer at a specific offset
	/// </summary>
	public PointerInfo? TryReadPointer(int offset) {
		if (offset < 0 || offset >= _romData.Length) {
			return null;
		}

		int targetAddress;
		int pointerSize;
		int? bank = null;

		switch (_config.Format) {
			case PointerFormat.LittleEndian16:
				if (offset + 1 >= _romData.Length) return null;
				targetAddress = _romData[offset] | (_romData[offset + 1] << 8);
				pointerSize = 2;
				break;

			case PointerFormat.BigEndian16:
				if (offset + 1 >= _romData.Length) return null;
				targetAddress = (_romData[offset] << 8) | _romData[offset + 1];
				pointerSize = 2;
				break;

			case PointerFormat.LittleEndian24:
				if (offset + 2 >= _romData.Length) return null;
				targetAddress = _romData[offset] | (_romData[offset + 1] << 8) | (_romData[offset + 2] << 16);
				pointerSize = 3;
				bank = (targetAddress >> 16) & 0xFF;
				break;

			case PointerFormat.BigEndian24:
				if (offset + 2 >= _romData.Length) return null;
				targetAddress = (_romData[offset] << 16) | (_romData[offset + 1] << 8) | _romData[offset + 2];
				pointerSize = 3;
				bank = (targetAddress >> 16) & 0xFF;
				break;

			case PointerFormat.Relative:
				if (offset + 1 >= _romData.Length) return null;
				var relOffset = (short)(_romData[offset] | (_romData[offset + 1] << 8));
				targetAddress = offset + 2 + relOffset;
				pointerSize = 2;
				break;

			default:
				return null;
		}

		// Validate target is within expected range
		if (targetAddress < _config.MinTarget || targetAddress > _config.MaxTarget) {
			return null;
		}

		return new PointerInfo {
			PointerAddress = offset,
			TargetAddress = targetAddress,
			PointerSize = pointerSize,
			Bank = bank,
			Confidence = CalculateConfidence(offset, targetAddress)
		};
	}

	/// <summary>
	/// Write a pointer value at a specific offset
	/// </summary>
	public void WritePointer(int offset, int targetAddress) {
		switch (_config.Format) {
			case PointerFormat.LittleEndian16:
				_romData[offset] = (byte)(targetAddress & 0xFF);
				_romData[offset + 1] = (byte)((targetAddress >> 8) & 0xFF);
				break;

			case PointerFormat.BigEndian16:
				_romData[offset] = (byte)((targetAddress >> 8) & 0xFF);
				_romData[offset + 1] = (byte)(targetAddress & 0xFF);
				break;

			case PointerFormat.LittleEndian24:
				_romData[offset] = (byte)(targetAddress & 0xFF);
				_romData[offset + 1] = (byte)((targetAddress >> 8) & 0xFF);
				_romData[offset + 2] = (byte)((targetAddress >> 16) & 0xFF);
				break;

			case PointerFormat.BigEndian24:
				_romData[offset] = (byte)((targetAddress >> 16) & 0xFF);
				_romData[offset + 1] = (byte)((targetAddress >> 8) & 0xFF);
				_romData[offset + 2] = (byte)(targetAddress & 0xFF);
				break;
		}
	}

	/// <summary>
	/// Convert file offset to CPU address
	/// </summary>
	public int FileOffsetToCpuAddress(int fileOffset) {
		var dataOffset = fileOffset - _config.HeaderSize;
		var bank = dataOffset / _config.BankSize;
		var localOffset = dataOffset % _config.BankSize;
		return _config.BaseAddress + localOffset;
	}

	/// <summary>
	/// Convert CPU address to file offset
	/// </summary>
	public int CpuAddressToFileOffset(int cpuAddress, int bank = 0) {
		var localOffset = cpuAddress - _config.BaseAddress;
		return _config.HeaderSize + (bank * _config.BankSize) + localOffset;
	}

	private int GetPointerSize(PointerFormat format) {
		return format switch {
			PointerFormat.LittleEndian24 or PointerFormat.BigEndian24 => 3,
			_ => 2
		};
	}

	private int CalculateConfidence(int pointerOffset, int targetAddress) {
		var confidence = 50;

		// Check if target looks like a valid code/data address
		if (targetAddress >= 0x8000 && targetAddress <= 0xFFFF) {
			confidence += 20;
		}

		// Check if pointer is word-aligned
		if (pointerOffset % 2 == 0) {
			confidence += 10;
		}

		// Check if target would be in valid ROM area
		var targetFileOffset = CpuAddressToFileOffset(targetAddress);
		if (targetFileOffset >= _config.HeaderSize && targetFileOffset < _romData.Length) {
			confidence += 15;
		}

		return Math.Min(100, confidence);
	}

	private int CalculateTableConfidence(List<PointerInfo> entries) {
		if (entries.Count < 2) return 30;

		var confidence = 40;

		// More entries = higher confidence
		confidence += Math.Min(30, entries.Count * 3);

		// Check if targets are consecutive or close together
		var targets = entries.Select(p => p.TargetAddress).OrderBy(a => a).ToList();
		var avgGap = 0.0;
		for (var i = 1; i < targets.Count; i++) {
			avgGap += targets[i] - targets[i - 1];
		}
		avgGap /= (targets.Count - 1);

		// Reasonable gap between entries suggests real table
		if (avgGap > 0 && avgGap < 0x1000) {
			confidence += 20;
		}

		// Check if all targets are in same bank
		if (entries.All(p => p.Bank == entries[0].Bank)) {
			confidence += 10;
		}

		return Math.Min(100, confidence);
	}
}

/// <summary>
/// Extensions for pointer operations
/// </summary>
public static class PointerExtensions {
	/// <summary>
	/// Create an NES-configured pointer scanner
	/// </summary>
	public static PointerScanner CreateNesScanner(byte[] romData) {
		return new PointerScanner(romData, new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xFFFF,
			BankSize = 0x4000,
			HeaderSize = 16,
			BaseAddress = 0x8000
		});
	}

	/// <summary>
	/// Create an SNES-configured pointer scanner
	/// </summary>
	public static PointerScanner CreateSnesScanner(byte[] romData, bool lorom = true) {
		return new PointerScanner(romData, new PointerScanConfig {
			Format = PointerFormat.LittleEndian24,
			MinTarget = lorom ? 0x008000 : 0x000000,
			MaxTarget = 0xFFFFFF,
			BankSize = lorom ? 0x8000 : 0x10000,
			HeaderSize = romData.Length % 0x8000 == 0 ? 0 : 512,
			BaseAddress = lorom ? 0x8000 : 0x0000
		});
	}

	/// <summary>
	/// Create a Genesis-configured pointer scanner
	/// </summary>
	public static PointerScanner CreateGenesisScanner(byte[] romData) {
		return new PointerScanner(romData, new PointerScanConfig {
			Format = PointerFormat.BigEndian24,
			MinTarget = 0x000000,
			MaxTarget = 0xFFFFFF,
			BankSize = 0x80000,
			HeaderSize = 0,
			BaseAddress = 0x000000
		});
	}
}
