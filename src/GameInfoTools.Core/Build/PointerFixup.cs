using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Service for fixing and managing pointers after ROM data modifications.
/// Handles pointer relocation when data is moved, inserted, or removed.
/// </summary>
public class PointerFixup {
	/// <summary>
	/// Analyze a ROM region to find potential pointers.
	/// </summary>
	public PointerAnalysisResult AnalyzePointers(byte[] data, PointerAnalysisConfig config) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(config);

		var pointers = new List<PointerInfo>();
		var format = config.Format;

		for (var i = 0; i <= data.Length - format.ByteSize; i++) {
			var rawValue = ReadPointer(data, i, format);
			var address = ConvertToAddress(rawValue, format, i);

			// Check if it's a valid pointer
			if (IsValidPointer(address, config)) {
				pointers.Add(new PointerInfo {
					Location = i,
					RawValue = rawValue,
					TargetAddress = address,
					Format = format.Type
				});
			}
		}

		return new PointerAnalysisResult {
			TotalBytesAnalyzed = data.Length,
			PointersFound = pointers,
			Config = config
		};
	}

	/// <summary>
	/// Fix pointers after a data region has been moved.
	/// </summary>
	public PointerFixResult FixPointersForMove(byte[] data, MoveOperation move, IEnumerable<PointerLocation> pointerLocations) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(move);
		ArgumentNullException.ThrowIfNull(pointerLocations);

		var result = new List<PointerFixInfo>();
		var modifiedData = (byte[])data.Clone();

		foreach (var location in pointerLocations) {
			var format = location.Format;
			var rawValue = ReadPointer(modifiedData, location.Offset, format);
			var address = ConvertToAddress(rawValue, format, location.Offset);

			// Check if this pointer points to the moved region
			if (address >= move.OldStart && address < move.OldStart + move.Size) {
				// Calculate new address
				var relativeOffset = address - move.OldStart;
				var newAddress = move.NewStart + relativeOffset;
				var newRawValue = ConvertFromAddress(newAddress, format, location.Offset);

				// Write the new pointer value
				WritePointer(modifiedData, location.Offset, newRawValue, format);

				result.Add(new PointerFixInfo {
					Location = location.Offset,
					OldAddress = address,
					NewAddress = newAddress,
					OldRawValue = rawValue,
					NewRawValue = newRawValue,
					Format = format.Type
				});
			}
		}

		return new PointerFixResult {
			ModifiedData = modifiedData,
			FixedPointers = result,
			TotalPointersChecked = pointerLocations.Count(),
			TotalPointersFixed = result.Count
		};
	}

	/// <summary>
	/// Fix pointers after data has been inserted (shifts all pointers past the insertion point).
	/// </summary>
	public PointerFixResult FixPointersForInsert(byte[] data, int insertOffset, int insertSize, IEnumerable<PointerLocation> pointerLocations) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(pointerLocations);

		var result = new List<PointerFixInfo>();
		var modifiedData = (byte[])data.Clone();

		foreach (var location in pointerLocations) {
			// Skip pointers that are themselves past the insertion point
			// (their locations have already shifted)
			var adjustedLocation = location.Offset >= insertOffset
				? location.Offset + insertSize
				: location.Offset;

			if (adjustedLocation > modifiedData.Length - location.Format.ByteSize)
				continue;

			var format = location.Format;
			var rawValue = ReadPointer(modifiedData, adjustedLocation, format);
			var address = ConvertToAddress(rawValue, format, adjustedLocation);

			// Shift pointers that point past the insertion point
			if (address >= insertOffset) {
				var newAddress = address + insertSize;
				var newRawValue = ConvertFromAddress(newAddress, format, adjustedLocation);

				WritePointer(modifiedData, adjustedLocation, newRawValue, format);

				result.Add(new PointerFixInfo {
					Location = adjustedLocation,
					OldAddress = address,
					NewAddress = newAddress,
					OldRawValue = rawValue,
					NewRawValue = newRawValue,
					Format = format.Type
				});
			}
		}

		return new PointerFixResult {
			ModifiedData = modifiedData,
			FixedPointers = result,
			TotalPointersChecked = pointerLocations.Count(),
			TotalPointersFixed = result.Count
		};
	}

	/// <summary>
	/// Fix pointers after data has been removed (shifts all pointers past the removal point).
	/// </summary>
	public PointerFixResult FixPointersForRemove(byte[] data, int removeOffset, int removeSize, IEnumerable<PointerLocation> pointerLocations) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(pointerLocations);

		var result = new List<PointerFixInfo>();
		var invalidPointers = new List<PointerFixInfo>();
		var modifiedData = (byte[])data.Clone();

		foreach (var location in pointerLocations) {
			var format = location.Format;
			var rawValue = ReadPointer(modifiedData, location.Offset, format);
			var address = ConvertToAddress(rawValue, format, location.Offset);

			if (address >= removeOffset + removeSize) {
				// Pointer points past removed region - shift down
				var newAddress = address - removeSize;
				var newRawValue = ConvertFromAddress(newAddress, format, location.Offset);

				WritePointer(modifiedData, location.Offset, newRawValue, format);

				result.Add(new PointerFixInfo {
					Location = location.Offset,
					OldAddress = address,
					NewAddress = newAddress,
					OldRawValue = rawValue,
					NewRawValue = newRawValue,
					Format = format.Type
				});
			} else if (address >= removeOffset) {
				// Pointer points into removed region - mark as invalid
				invalidPointers.Add(new PointerFixInfo {
					Location = location.Offset,
					OldAddress = address,
					NewAddress = -1, // Invalid
					OldRawValue = rawValue,
					NewRawValue = 0,
					Format = format.Type,
					IsInvalid = true
				});
			}
		}

		return new PointerFixResult {
			ModifiedData = modifiedData,
			FixedPointers = result,
			InvalidPointers = invalidPointers,
			TotalPointersChecked = pointerLocations.Count(),
			TotalPointersFixed = result.Count
		};
	}

	/// <summary>
	/// Create a pointer table from a list of addresses.
	/// </summary>
	public byte[] CreatePointerTable(IEnumerable<int> addresses, PointerFormat format) {
		ArgumentNullException.ThrowIfNull(addresses);
		ArgumentNullException.ThrowIfNull(format);

		var addressList = addresses.ToList();
		var result = new byte[addressList.Count * format.ByteSize];

		for (var i = 0; i < addressList.Count; i++) {
			var rawValue = ConvertFromAddress(addressList[i], format, i * format.ByteSize);
			WritePointer(result, i * format.ByteSize, rawValue, format);
		}

		return result;
	}

	/// <summary>
	/// Read a pointer table and return the addresses.
	/// </summary>
	public List<int> ReadPointerTable(byte[] data, int offset, int count, PointerFormat format) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(format);

		var addresses = new List<int>();

		for (var i = 0; i < count; i++) {
			var location = offset + i * format.ByteSize;
			if (location + format.ByteSize > data.Length)
				break;

			var rawValue = ReadPointer(data, location, format);
			var address = ConvertToAddress(rawValue, format, location);
			addresses.Add(address);
		}

		return addresses;
	}

	/// <summary>
	/// Apply a fixup script to ROM data.
	/// </summary>
	public async Task<FixupScriptResult> ApplyFixupScriptAsync(byte[] data, string scriptPath) {
		ArgumentNullException.ThrowIfNull(data);

		var json = await File.ReadAllTextAsync(scriptPath);
		var script = JsonSerializer.Deserialize<FixupScript>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse fixup script");

		return ApplyFixupScript(data, script);
	}

	/// <summary>
	/// Apply a fixup script to ROM data.
	/// </summary>
	public FixupScriptResult ApplyFixupScript(byte[] data, FixupScript script) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(script);

		var modifiedData = (byte[])data.Clone();
		var allFixes = new List<PointerFixInfo>();
		var errors = new List<string>();

		foreach (var operation in script.Operations) {
			try {
				var format = new PointerFormat {
					Type = operation.PointerType,
					ByteSize = GetPointerSize(operation.PointerType),
					Endianness = operation.Endianness ?? Endianness.Little
				};

				var locations = operation.Pointers.Select(p => new PointerLocation {
					Offset = p.Location,
					Format = format
				});

				PointerFixResult? result = null;

				switch (operation.Type) {
					case FixupOperationType.Move:
						if (operation.Move == null)
							throw new InvalidOperationException("Move operation requires move parameters");
						result = FixPointersForMove(modifiedData, operation.Move, locations);
						break;

					case FixupOperationType.Insert:
						if (operation.InsertOffset == null || operation.InsertSize == null)
							throw new InvalidOperationException("Insert operation requires offset and size");
						result = FixPointersForInsert(modifiedData, operation.InsertOffset.Value, operation.InsertSize.Value, locations);
						break;

					case FixupOperationType.Remove:
						if (operation.RemoveOffset == null || operation.RemoveSize == null)
							throw new InvalidOperationException("Remove operation requires offset and size");
						result = FixPointersForRemove(modifiedData, operation.RemoveOffset.Value, operation.RemoveSize.Value, locations);
						break;

					case FixupOperationType.SetAbsolute:
						foreach (var ptr in operation.Pointers) {
							if (ptr.NewValue == null) continue;
							var newRawValue = ConvertFromAddress(ptr.NewValue.Value, format, ptr.Location);
							var oldRawValue = ReadPointer(modifiedData, ptr.Location, format);
							WritePointer(modifiedData, ptr.Location, newRawValue, format);
							allFixes.Add(new PointerFixInfo {
								Location = ptr.Location,
								OldAddress = ConvertToAddress(oldRawValue, format, ptr.Location),
								NewAddress = ptr.NewValue.Value,
								OldRawValue = oldRawValue,
								NewRawValue = newRawValue,
								Format = format.Type
							});
						}
						break;
				}

				if (result != null) {
					modifiedData = result.ModifiedData;
					allFixes.AddRange(result.FixedPointers);
				}
			} catch (Exception ex) {
				errors.Add($"Operation '{operation.Name ?? "unnamed"}': {ex.Message}");
			}
		}

		return new FixupScriptResult {
			ModifiedData = modifiedData,
			AllFixes = allFixes,
			Errors = errors,
			Success = errors.Count == 0
		};
	}

	/// <summary>
	/// Save a fixup script to a file.
	/// </summary>
	public async Task SaveFixupScriptAsync(FixupScript script, string path) {
		var json = JsonSerializer.Serialize(script, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Create a fixup script from a pointer analysis result.
	/// </summary>
	public FixupScript CreateFixupScriptFromAnalysis(PointerAnalysisResult analysis, MoveOperation move) {
		return new FixupScript {
			Version = 1,
			Description = $"Fixup script for moving data from 0x{move.OldStart:x} to 0x{move.NewStart:x}",
			Operations = [
				new FixupOperation {
					Name = "Move data",
					Type = FixupOperationType.Move,
					Move = move,
					PointerType = analysis.Config.Format.Type,
					Pointers = analysis.PointersFound.Select(p => new PointerEntry {
						Location = p.Location,
						Comment = $"Points to 0x{p.TargetAddress:x}"
					}).ToList()
				}
			]
		};
	}

	/// <summary>
	/// Validate that all pointers in a list point to valid addresses.
	/// </summary>
	public ValidationResult ValidatePointers(byte[] data, IEnumerable<PointerLocation> pointerLocations, int minAddress, int maxAddress) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(pointerLocations);

		var validPointers = new List<PointerInfo>();
		var invalidPointers = new List<PointerInfo>();

		foreach (var location in pointerLocations) {
			if (location.Offset + location.Format.ByteSize > data.Length) {
				invalidPointers.Add(new PointerInfo {
					Location = location.Offset,
					RawValue = 0,
					TargetAddress = -1,
					Format = location.Format.Type,
					ValidationError = "Pointer location out of bounds"
				});
				continue;
			}

			var format = location.Format;
			var rawValue = ReadPointer(data, location.Offset, format);
			var address = ConvertToAddress(rawValue, format, location.Offset);

			if (address >= minAddress && address <= maxAddress) {
				validPointers.Add(new PointerInfo {
					Location = location.Offset,
					RawValue = rawValue,
					TargetAddress = address,
					Format = format.Type
				});
			} else {
				invalidPointers.Add(new PointerInfo {
					Location = location.Offset,
					RawValue = rawValue,
					TargetAddress = address,
					Format = format.Type,
					ValidationError = $"Address 0x{address:x} out of valid range [0x{minAddress:x}, 0x{maxAddress:x}]"
				});
			}
		}

		return new ValidationResult {
			ValidPointers = validPointers,
			InvalidPointers = invalidPointers,
			IsValid = invalidPointers.Count == 0
		};
	}

	#region Private Methods

	private static int ReadPointer(byte[] data, int offset, PointerFormat format) {
		var value = 0;

		if (format.Endianness == Endianness.Little) {
			for (var i = 0; i < format.ByteSize; i++) {
				value |= data[offset + i] << (i * 8);
			}
		} else {
			for (var i = 0; i < format.ByteSize; i++) {
				value |= data[offset + i] << ((format.ByteSize - 1 - i) * 8);
			}
		}

		return value;
	}

	private static void WritePointer(byte[] data, int offset, int value, PointerFormat format) {
		if (format.Endianness == Endianness.Little) {
			for (var i = 0; i < format.ByteSize; i++) {
				data[offset + i] = (byte)(value >> (i * 8));
			}
		} else {
			for (var i = 0; i < format.ByteSize; i++) {
				data[offset + i] = (byte)(value >> ((format.ByteSize - 1 - i) * 8));
			}
		}
	}

	private static int ConvertToAddress(int rawValue, PointerFormat format, int pointerLocation) {
		return format.Type switch {
			PointerType.Absolute16 => rawValue,
			PointerType.Absolute24 => rawValue,
			PointerType.Absolute32 => rawValue,
			PointerType.Relative8 => pointerLocation + 1 + (sbyte)rawValue,
			PointerType.Relative16 => pointerLocation + 2 + (short)rawValue,
			PointerType.BankOffset => ((rawValue >> 16) * format.BankSize) + (rawValue & 0xffff),
			PointerType.HighLow => ((rawValue & 0xff) << 8) | ((rawValue >> 8) & 0xff),
			_ => rawValue
		};
	}

	private static int ConvertFromAddress(int address, PointerFormat format, int pointerLocation) {
		return format.Type switch {
			PointerType.Absolute16 => address & 0xffff,
			PointerType.Absolute24 => address & 0xffffff,
			PointerType.Absolute32 => address,
			PointerType.Relative8 => (byte)(address - pointerLocation - 1),
			PointerType.Relative16 => (short)(address - pointerLocation - 2),
			PointerType.BankOffset => ((address / format.BankSize) << 16) | (address % format.BankSize),
			PointerType.HighLow => ((address & 0xff) << 8) | ((address >> 8) & 0xff),
			_ => address
		};
	}

	private static bool IsValidPointer(int address, PointerAnalysisConfig config) {
		if (address < config.MinValidAddress || address > config.MaxValidAddress)
			return false;

		if (config.MustBeAligned && address % config.Alignment != 0)
			return false;

		if (config.ValidRanges.Count > 0) {
			return config.ValidRanges.Any(r => address >= r.Start && address < r.Start + r.Size);
		}

		return true;
	}

	private static int GetPointerSize(PointerType type) {
		return type switch {
			PointerType.Relative8 => 1,
			PointerType.Absolute16 or PointerType.Relative16 or PointerType.HighLow => 2,
			PointerType.Absolute24 or PointerType.BankOffset => 3,
			PointerType.Absolute32 => 4,
			_ => 2
		};
	}

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};

	#endregion
}

#region Types

/// <summary>
/// Type of pointer encoding.
/// </summary>
public enum PointerType {
	/// <summary>16-bit absolute address.</summary>
	Absolute16,

	/// <summary>24-bit absolute address (SNES, etc.).</summary>
	Absolute24,

	/// <summary>32-bit absolute address.</summary>
	Absolute32,

	/// <summary>8-bit signed relative offset.</summary>
	Relative8,

	/// <summary>16-bit signed relative offset.</summary>
	Relative16,

	/// <summary>Bank + offset format (bank in high byte(s)).</summary>
	BankOffset,

	/// <summary>High/low byte swapped format.</summary>
	HighLow
}

/// <summary>
/// Byte order for pointer values.
/// </summary>
public enum Endianness {
	/// <summary>Little-endian (LSB first).</summary>
	Little,

	/// <summary>Big-endian (MSB first).</summary>
	Big
}

/// <summary>
/// Format specification for pointers.
/// </summary>
public record PointerFormat {
	/// <summary>Type of pointer.</summary>
	public PointerType Type { get; init; } = PointerType.Absolute16;

	/// <summary>Number of bytes in the pointer.</summary>
	public int ByteSize { get; init; } = 2;

	/// <summary>Byte order.</summary>
	public Endianness Endianness { get; init; } = Endianness.Little;

	/// <summary>Bank size for bank+offset format.</summary>
	public int BankSize { get; init; } = 0x4000;

	/// <summary>Predefined NES 16-bit little-endian format.</summary>
	public static PointerFormat Nes16 => new() {
		Type = PointerType.Absolute16,
		ByteSize = 2,
		Endianness = Endianness.Little
	};

	/// <summary>Predefined SNES 24-bit little-endian format.</summary>
	public static PointerFormat Snes24 => new() {
		Type = PointerType.Absolute24,
		ByteSize = 3,
		Endianness = Endianness.Little
	};

	/// <summary>Predefined Genesis 32-bit big-endian format.</summary>
	public static PointerFormat Genesis32 => new() {
		Type = PointerType.Absolute32,
		ByteSize = 4,
		Endianness = Endianness.Big
	};
}

/// <summary>
/// Configuration for pointer analysis.
/// </summary>
public record PointerAnalysisConfig {
	/// <summary>Pointer format to search for.</summary>
	public PointerFormat Format { get; init; } = PointerFormat.Nes16;

	/// <summary>Minimum valid address for pointers.</summary>
	public int MinValidAddress { get; init; }

	/// <summary>Maximum valid address for pointers.</summary>
	public int MaxValidAddress { get; init; } = 0xffff;

	/// <summary>Whether pointers must be aligned.</summary>
	public bool MustBeAligned { get; init; }

	/// <summary>Alignment requirement (if MustBeAligned is true).</summary>
	public int Alignment { get; init; } = 2;

	/// <summary>Specific valid address ranges.</summary>
	public List<AddressRange> ValidRanges { get; init; } = [];
}

/// <summary>
/// An address range.
/// </summary>
public record AddressRange {
	/// <summary>Start address.</summary>
	public int Start { get; init; }

	/// <summary>Size of the range.</summary>
	public int Size { get; init; }
}

/// <summary>
/// Location of a known pointer in the ROM.
/// </summary>
public record PointerLocation {
	/// <summary>Offset in the ROM data.</summary>
	public int Offset { get; init; }

	/// <summary>Format of this pointer.</summary>
	public PointerFormat Format { get; init; } = PointerFormat.Nes16;

	/// <summary>Optional name/comment.</summary>
	public string? Name { get; init; }
}

/// <summary>
/// Operation describing a data move.
/// </summary>
public record MoveOperation {
	/// <summary>Original start address of the data.</summary>
	public int OldStart { get; init; }

	/// <summary>New start address of the data.</summary>
	public int NewStart { get; init; }

	/// <summary>Size of the data being moved.</summary>
	public int Size { get; init; }
}

/// <summary>
/// Result of pointer analysis.
/// </summary>
public record PointerAnalysisResult {
	/// <summary>Total bytes analyzed.</summary>
	public int TotalBytesAnalyzed { get; init; }

	/// <summary>Pointers found.</summary>
	public List<PointerInfo> PointersFound { get; init; } = [];

	/// <summary>Analysis configuration used.</summary>
	public PointerAnalysisConfig Config { get; init; } = new();
}

/// <summary>
/// Information about a pointer.
/// </summary>
public record PointerInfo {
	/// <summary>Location of the pointer in the ROM.</summary>
	public int Location { get; init; }

	/// <summary>Raw value of the pointer bytes.</summary>
	public int RawValue { get; init; }

	/// <summary>Target address the pointer points to.</summary>
	public int TargetAddress { get; init; }

	/// <summary>Format of this pointer.</summary>
	public PointerType Format { get; init; }

	/// <summary>Validation error message (if any).</summary>
	public string? ValidationError { get; init; }
}

/// <summary>
/// Result of fixing pointers.
/// </summary>
public record PointerFixResult {
	/// <summary>Modified ROM data.</summary>
	public byte[] ModifiedData { get; init; } = [];

	/// <summary>List of fixed pointers.</summary>
	public List<PointerFixInfo> FixedPointers { get; init; } = [];

	/// <summary>Pointers that became invalid.</summary>
	public List<PointerFixInfo> InvalidPointers { get; init; } = [];

	/// <summary>Total pointers checked.</summary>
	public int TotalPointersChecked { get; init; }

	/// <summary>Total pointers fixed.</summary>
	public int TotalPointersFixed { get; init; }
}

/// <summary>
/// Information about a pointer fix.
/// </summary>
public record PointerFixInfo {
	/// <summary>Location of the pointer.</summary>
	public int Location { get; init; }

	/// <summary>Old target address.</summary>
	public int OldAddress { get; init; }

	/// <summary>New target address.</summary>
	public int NewAddress { get; init; }

	/// <summary>Old raw value.</summary>
	public int OldRawValue { get; init; }

	/// <summary>New raw value.</summary>
	public int NewRawValue { get; init; }

	/// <summary>Pointer format.</summary>
	public PointerType Format { get; init; }

	/// <summary>Whether pointer is now invalid.</summary>
	public bool IsInvalid { get; init; }
}

/// <summary>
/// Result of pointer validation.
/// </summary>
public record ValidationResult {
	/// <summary>Valid pointers.</summary>
	public List<PointerInfo> ValidPointers { get; init; } = [];

	/// <summary>Invalid pointers.</summary>
	public List<PointerInfo> InvalidPointers { get; init; } = [];

	/// <summary>Whether all pointers are valid.</summary>
	public bool IsValid { get; init; }
}

#endregion

#region Fixup Script Types

/// <summary>
/// Type of fixup operation.
/// </summary>
public enum FixupOperationType {
	/// <summary>Move data from one location to another.</summary>
	Move,

	/// <summary>Data inserted (shifts pointers).</summary>
	Insert,

	/// <summary>Data removed (shifts pointers).</summary>
	Remove,

	/// <summary>Set pointer to absolute value.</summary>
	SetAbsolute
}

/// <summary>
/// A fixup script containing operations to apply.
/// </summary>
public record FixupScript {
	/// <summary>Script version.</summary>
	public int Version { get; init; } = 1;

	/// <summary>Description of this script.</summary>
	public string? Description { get; init; }

	/// <summary>Operations to apply.</summary>
	public List<FixupOperation> Operations { get; init; } = [];
}

/// <summary>
/// A single fixup operation.
/// </summary>
public record FixupOperation {
	/// <summary>Name of this operation.</summary>
	public string? Name { get; init; }

	/// <summary>Type of operation.</summary>
	public FixupOperationType Type { get; init; }

	/// <summary>Pointer type for this operation.</summary>
	public PointerType PointerType { get; init; } = PointerType.Absolute16;

	/// <summary>Endianness for this operation.</summary>
	public Endianness? Endianness { get; init; }

	/// <summary>Move parameters (for Move type).</summary>
	public MoveOperation? Move { get; init; }

	/// <summary>Insert offset (for Insert type).</summary>
	public int? InsertOffset { get; init; }

	/// <summary>Insert size (for Insert type).</summary>
	public int? InsertSize { get; init; }

	/// <summary>Remove offset (for Remove type).</summary>
	public int? RemoveOffset { get; init; }

	/// <summary>Remove size (for Remove type).</summary>
	public int? RemoveSize { get; init; }

	/// <summary>Pointers to fix.</summary>
	public List<PointerEntry> Pointers { get; init; } = [];
}

/// <summary>
/// A pointer entry in a fixup script.
/// </summary>
public record PointerEntry {
	/// <summary>Location of the pointer.</summary>
	public int Location { get; init; }

	/// <summary>New value (for SetAbsolute type).</summary>
	public int? NewValue { get; init; }

	/// <summary>Optional comment.</summary>
	public string? Comment { get; init; }
}

/// <summary>
/// Result of applying a fixup script.
/// </summary>
public record FixupScriptResult {
	/// <summary>Modified ROM data.</summary>
	public byte[] ModifiedData { get; init; } = [];

	/// <summary>All fixes applied.</summary>
	public List<PointerFixInfo> AllFixes { get; init; } = [];

	/// <summary>Errors encountered.</summary>
	public List<string> Errors { get; init; } = [];

	/// <summary>Whether script applied successfully.</summary>
	public bool Success { get; init; }
}

#endregion
