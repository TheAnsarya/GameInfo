namespace GameInfoTools.Core.Analysis;

/// <summary>
/// Represents a region of memory with a specific purpose
/// </summary>
public class MemoryRegion {
	/// <summary>
	/// Name of the region
	/// </summary>
	public required string Name { get; set; }

	/// <summary>
	/// Start address of the region
	/// </summary>
	public int StartAddress { get; set; }

	/// <summary>
	/// End address of the region (inclusive)
	/// </summary>
	public int EndAddress { get; set; }

	/// <summary>
	/// Size of the region in bytes
	/// </summary>
	public int Size => EndAddress - StartAddress + 1;

	/// <summary>
	/// Type of memory region
	/// </summary>
	public MemoryRegionType Type { get; set; }

	/// <summary>
	/// Description of what this region contains
	/// </summary>
	public string? Description { get; set; }

	/// <summary>
	/// Bank number (for banked memory)
	/// </summary>
	public int? Bank { get; set; }

	/// <summary>
	/// Whether this region is writable
	/// </summary>
	public bool IsWritable { get; set; }

	/// <summary>
	/// Whether this region is executable
	/// </summary>
	public bool IsExecutable { get; set; }

	/// <summary>
	/// Child regions (for hierarchical layout)
	/// </summary>
	public List<MemoryRegion> Children { get; set; } = [];

	/// <summary>
	/// Check if an address is within this region
	/// </summary>
	public bool Contains(int address) => address >= StartAddress && address <= EndAddress;

	/// <summary>
	/// Format start address as hex
	/// </summary>
	public string FormattedStart => $"${StartAddress:x4}";

	/// <summary>
	/// Format end address as hex
	/// </summary>
	public string FormattedEnd => $"${EndAddress:x4}";

	/// <summary>
	/// Format size as hex
	/// </summary>
	public string FormattedSize => Size >= 1024 ? $"{Size / 1024} KB" : $"{Size} bytes";

	public override string ToString() => $"{Name}: {FormattedStart}-{FormattedEnd} ({FormattedSize})";
}

/// <summary>
/// Types of memory regions
/// </summary>
public enum MemoryRegionType {
	Unknown,
	Ram,
	Rom,
	Vram,
	Oam,
	Io,
	Sram,
	Wram,
	Hram,
	CartridgeRam,
	MirroredRam,
	OpenBus,
	Reserved
}

/// <summary>
/// Analyzes and visualizes memory layout for different platforms
/// </summary>
public class MemoryLayoutAnalyzer {
	private readonly List<MemoryRegion> _regions = [];

	/// <summary>
	/// All defined memory regions
	/// </summary>
	public IReadOnlyList<MemoryRegion> Regions => _regions;

	/// <summary>
	/// Add a memory region
	/// </summary>
	public void AddRegion(MemoryRegion region) {
		_regions.Add(region);
		_regions.Sort((a, b) => a.StartAddress.CompareTo(b.StartAddress));
	}

	/// <summary>
	/// Remove a memory region
	/// </summary>
	public bool RemoveRegion(MemoryRegion region) => _regions.Remove(region);

	/// <summary>
	/// Clear all regions
	/// </summary>
	public void Clear() => _regions.Clear();

	/// <summary>
	/// Find the region containing an address
	/// </summary>
	public MemoryRegion? FindRegion(int address) {
		return _regions.FirstOrDefault(r => r.Contains(address));
	}

	/// <summary>
	/// Find all regions overlapping with a range
	/// </summary>
	public IEnumerable<MemoryRegion> FindRegionsInRange(int start, int end) {
		return _regions.Where(r => r.EndAddress >= start && r.StartAddress <= end);
	}

	/// <summary>
	/// Get regions of a specific type
	/// </summary>
	public IEnumerable<MemoryRegion> GetRegionsByType(MemoryRegionType type) {
		return _regions.Where(r => r.Type == type);
	}

	/// <summary>
	/// Find gaps (unmapped regions) in the memory map
	/// </summary>
	public IEnumerable<(int Start, int End)> FindGaps(int totalSize) {
		var gaps = new List<(int, int)>();
		var lastEnd = -1;

		foreach (var region in _regions.OrderBy(r => r.StartAddress)) {
			if (region.StartAddress > lastEnd + 1) {
				gaps.Add((lastEnd + 1, region.StartAddress - 1));
			}

			lastEnd = Math.Max(lastEnd, region.EndAddress);
		}

		if (lastEnd < totalSize - 1) {
			gaps.Add((lastEnd + 1, totalSize - 1));
		}

		return gaps;
	}

	/// <summary>
	/// Find overlapping regions
	/// </summary>
	public IEnumerable<(MemoryRegion A, MemoryRegion B)> FindOverlaps() {
		var overlaps = new List<(MemoryRegion, MemoryRegion)>();

		for (var i = 0; i < _regions.Count; i++) {
			for (var j = i + 1; j < _regions.Count; j++) {
				var a = _regions[i];
				var b = _regions[j];

				if (a.EndAddress >= b.StartAddress && a.StartAddress <= b.EndAddress) {
					overlaps.Add((a, b));
				}
			}
		}

		return overlaps;
	}

	/// <summary>
	/// Calculate memory usage statistics
	/// </summary>
	public MemoryStatistics GetStatistics(int totalSize) {
		var mapped = _regions.Sum(r => r.Size);
		var gaps = FindGaps(totalSize);
		var unmapped = gaps.Sum(g => g.End - g.Start + 1);

		return new MemoryStatistics {
			TotalSize = totalSize,
			MappedSize = mapped,
			UnmappedSize = unmapped,
			RegionCount = _regions.Count,
			RamSize = _regions.Where(r => r.Type == MemoryRegionType.Ram).Sum(r => r.Size),
			RomSize = _regions.Where(r => r.Type == MemoryRegionType.Rom).Sum(r => r.Size),
			VramSize = _regions.Where(r => r.Type == MemoryRegionType.Vram).Sum(r => r.Size),
			IoSize = _regions.Where(r => r.Type == MemoryRegionType.Io).Sum(r => r.Size),
			OverlapCount = FindOverlaps().Count()
		};
	}

	/// <summary>
	/// Generate ASCII visualization of memory layout
	/// </summary>
	public string GenerateAsciiMap(int totalSize, int width = 64) {
		var sb = new System.Text.StringBuilder();
		var bytesPerChar = totalSize / width;

		sb.AppendLine($"Memory Map (0x{0:x4} - 0x{totalSize - 1:x4})");
		sb.AppendLine(new string('─', width + 2));

		var map = new char[width];
		for (var i = 0; i < width; i++) {
			var startAddr = i * bytesPerChar;
			var endAddr = ((i + 1) * bytesPerChar) - 1;
			var region = _regions.FirstOrDefault(r => r.Contains(startAddr) || r.Contains(endAddr));

			map[i] = region?.Type switch {
				MemoryRegionType.Ram => 'R',
				MemoryRegionType.Rom => 'P',
				MemoryRegionType.Vram => 'V',
				MemoryRegionType.Io => 'I',
				MemoryRegionType.Sram => 'S',
				MemoryRegionType.Wram => 'W',
				MemoryRegionType.Hram => 'H',
				MemoryRegionType.MirroredRam => 'M',
				MemoryRegionType.OpenBus => 'O',
				_ => '.'
			};
		}

		sb.AppendLine($"|{new string(map)}|");
		sb.AppendLine(new string('─', width + 2));

		// Legend
		sb.AppendLine("Legend: R=RAM P=ROM V=VRAM I=I/O S=SRAM W=WRAM H=HRAM M=Mirror O=OpenBus .=Unmapped");

		return sb.ToString();
	}

	/// <summary>
	/// Export layout to JSON
	/// </summary>
	public string ExportToJson() {
		return System.Text.Json.JsonSerializer.Serialize(_regions, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
	}

	/// <summary>
	/// Import layout from JSON
	/// </summary>
	public void ImportFromJson(string json) {
		var regions = System.Text.Json.JsonSerializer.Deserialize<List<MemoryRegion>>(json);
		if (regions != null) {
			_regions.Clear();
			foreach (var region in regions) {
				AddRegion(region);
			}
		}
	}

	/// <summary>
	/// Create a standard NES memory layout
	/// </summary>
	public static MemoryLayoutAnalyzer CreateNesLayout() {
		var analyzer = new MemoryLayoutAnalyzer();

		analyzer.AddRegion(new MemoryRegion {
			Name = "Zero Page",
			StartAddress = 0x0000,
			EndAddress = 0x00FF,
			Type = MemoryRegionType.Ram,
			IsWritable = true,
			Description = "Fast RAM for variables"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "Stack",
			StartAddress = 0x0100,
			EndAddress = 0x01FF,
			Type = MemoryRegionType.Ram,
			IsWritable = true,
			Description = "6502 stack"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "RAM",
			StartAddress = 0x0200,
			EndAddress = 0x07FF,
			Type = MemoryRegionType.Ram,
			IsWritable = true,
			Description = "General purpose RAM"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "RAM Mirrors",
			StartAddress = 0x0800,
			EndAddress = 0x1FFF,
			Type = MemoryRegionType.MirroredRam,
			IsWritable = true,
			Description = "Mirrors of $0000-$07FF"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "PPU Registers",
			StartAddress = 0x2000,
			EndAddress = 0x2007,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "PPU control registers"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "PPU Mirrors",
			StartAddress = 0x2008,
			EndAddress = 0x3FFF,
			Type = MemoryRegionType.MirroredRam,
			IsWritable = true,
			Description = "Mirrors of $2000-$2007"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "APU/IO Registers",
			StartAddress = 0x4000,
			EndAddress = 0x401F,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "APU and I/O registers"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "Cartridge Space",
			StartAddress = 0x4020,
			EndAddress = 0x5FFF,
			Type = MemoryRegionType.CartridgeRam,
			IsWritable = true,
			Description = "Expansion ROM/RAM"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "SRAM",
			StartAddress = 0x6000,
			EndAddress = 0x7FFF,
			Type = MemoryRegionType.Sram,
			IsWritable = true,
			Description = "Battery-backed save RAM"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "PRG ROM",
			StartAddress = 0x8000,
			EndAddress = 0xFFFF,
			Type = MemoryRegionType.Rom,
			IsWritable = false,
			IsExecutable = true,
			Description = "Program ROM"
		});

		return analyzer;
	}

	/// <summary>
	/// Create a standard SNES memory layout (LoROM)
	/// </summary>
	public static MemoryLayoutAnalyzer CreateSnesLoRomLayout() {
		var analyzer = new MemoryLayoutAnalyzer();

		analyzer.AddRegion(new MemoryRegion {
			Name = "WRAM",
			StartAddress = 0x7E0000,
			EndAddress = 0x7FFFFF,
			Type = MemoryRegionType.Wram,
			IsWritable = true,
			Description = "128KB Work RAM"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "PPU/APU Registers",
			StartAddress = 0x002100,
			EndAddress = 0x0021FF,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "Video and audio registers"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "CPU Registers",
			StartAddress = 0x004200,
			EndAddress = 0x0043FF,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "CPU I/O registers"
		});

		return analyzer;
	}

	/// <summary>
	/// Create a standard Game Boy memory layout
	/// </summary>
	public static MemoryLayoutAnalyzer CreateGameBoyLayout() {
		var analyzer = new MemoryLayoutAnalyzer();

		analyzer.AddRegion(new MemoryRegion {
			Name = "ROM Bank 0",
			StartAddress = 0x0000,
			EndAddress = 0x3FFF,
			Type = MemoryRegionType.Rom,
			IsExecutable = true,
			Description = "Fixed ROM bank"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "ROM Bank N",
			StartAddress = 0x4000,
			EndAddress = 0x7FFF,
			Type = MemoryRegionType.Rom,
			IsExecutable = true,
			Description = "Switchable ROM bank"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "VRAM",
			StartAddress = 0x8000,
			EndAddress = 0x9FFF,
			Type = MemoryRegionType.Vram,
			IsWritable = true,
			Description = "Video RAM (tiles)"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "External RAM",
			StartAddress = 0xA000,
			EndAddress = 0xBFFF,
			Type = MemoryRegionType.CartridgeRam,
			IsWritable = true,
			Description = "Cartridge RAM/Save"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "WRAM Bank 0",
			StartAddress = 0xC000,
			EndAddress = 0xCFFF,
			Type = MemoryRegionType.Wram,
			IsWritable = true,
			Description = "Work RAM"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "WRAM Bank 1-7",
			StartAddress = 0xD000,
			EndAddress = 0xDFFF,
			Type = MemoryRegionType.Wram,
			IsWritable = true,
			Description = "Switchable Work RAM (CGB)"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "Echo RAM",
			StartAddress = 0xE000,
			EndAddress = 0xFDFF,
			Type = MemoryRegionType.MirroredRam,
			IsWritable = true,
			Description = "Mirror of C000-DDFF"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "OAM",
			StartAddress = 0xFE00,
			EndAddress = 0xFE9F,
			Type = MemoryRegionType.Oam,
			IsWritable = true,
			Description = "Sprite attributes"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "I/O Registers",
			StartAddress = 0xFF00,
			EndAddress = 0xFF7F,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "Hardware registers"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "HRAM",
			StartAddress = 0xFF80,
			EndAddress = 0xFFFE,
			Type = MemoryRegionType.Hram,
			IsWritable = true,
			Description = "High RAM (fast access)"
		});

		analyzer.AddRegion(new MemoryRegion {
			Name = "IE Register",
			StartAddress = 0xFFFF,
			EndAddress = 0xFFFF,
			Type = MemoryRegionType.Io,
			IsWritable = true,
			Description = "Interrupt Enable"
		});

		return analyzer;
	}
}

/// <summary>
/// Statistics about memory usage
/// </summary>
public record MemoryStatistics {
	public int TotalSize { get; init; }
	public int MappedSize { get; init; }
	public int UnmappedSize { get; init; }
	public int RegionCount { get; init; }
	public int RamSize { get; init; }
	public int RomSize { get; init; }
	public int VramSize { get; init; }
	public int IoSize { get; init; }
	public int OverlapCount { get; init; }

	public double MappedPercent => TotalSize > 0 ? (double)MappedSize / TotalSize * 100 : 0;
}
