using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Analysis;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for memory layout visualization and region management.
/// </summary>
public partial class MemoryLayoutViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private MemoryLayoutAnalyzer _analyzer;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _selectedPlatform = "NES";

	[ObservableProperty]
	private int _totalSize = 0x10000;

	[ObservableProperty]
	private MemoryRegion? _selectedRegion;

	[ObservableProperty]
	private string _asciiMap = "";

	[ObservableProperty]
	private int _regionCount;

	[ObservableProperty]
	private int _mappedBytes;

	[ObservableProperty]
	private int _unmappedBytes;

	[ObservableProperty]
	private int _overlapCount;

	// New region entry fields
	[ObservableProperty]
	private string _newRegionName = "";

	[ObservableProperty]
	private int _newRegionStart;

	[ObservableProperty]
	private int _newRegionEnd;

	[ObservableProperty]
	private MemoryRegionType _newRegionType = MemoryRegionType.Rom;

	[ObservableProperty]
	private string _newRegionDescription = "";

	public ObservableCollection<MemoryRegion> Regions { get; } = [];

	public ObservableCollection<MemoryRegion> Gaps { get; } = [];

	public ObservableCollection<(MemoryRegion, MemoryRegion)> Overlaps { get; } = [];

	public string[] AvailablePlatforms { get; } = ["NES", "SNES LoROM", "SNES HiROM", "Game Boy", "Custom"];

	public MemoryRegionType[] AvailableTypes { get; } = Enum.GetValues<MemoryRegionType>();

	public MemoryLayoutViewModel() : this(null) { }

	public MemoryLayoutViewModel(RomFile? rom) {
		_rom = rom;
		_analyzer = new MemoryLayoutAnalyzer();
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded && rom is not null) {
			DetectPlatform();
		}
	}

	private void DetectPlatform() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		switch (info.System) {
			case SystemType.Nes:
				SelectedPlatform = "NES";
				TotalSize = 0x10000;
				break;
			case SystemType.Snes:
				SelectedPlatform = "SNES LoROM";
				TotalSize = 0x1000000;
				break;
			case SystemType.GameBoy:
				SelectedPlatform = "Game Boy";
				TotalSize = 0x10000;
				break;
			default:
				SelectedPlatform = "Custom";
				TotalSize = 0x10000;
				break;
		}

		LoadPlatformTemplate();
	}

	partial void OnSelectedPlatformChanged(string value) {
		LoadPlatformTemplate();
	}

	[RelayCommand]
	private void LoadPlatformTemplate() {
		_analyzer = SelectedPlatform switch {
			"NES" => MemoryLayoutAnalyzer.CreateNesLayout(),
			"SNES LoROM" => MemoryLayoutAnalyzer.CreateSnesLoRomLayout(),
			"Game Boy" => MemoryLayoutAnalyzer.CreateGameBoyLayout(),
			_ => new MemoryLayoutAnalyzer()
		};

		TotalSize = SelectedPlatform switch {
			"NES" => 0x10000,
			"SNES LoROM" or "SNES HiROM" => 0x1000000,
			"Game Boy" => 0x10000,
			_ => TotalSize
		};

		RefreshAll();
		StatusText = $"Loaded {SelectedPlatform} memory layout";
	}

	private void RefreshAll() {
		RefreshRegions();
		RefreshGaps();
		RefreshOverlaps();
		UpdateStatistics();
		GenerateMap();
	}

	private void RefreshRegions() {
		Regions.Clear();
		foreach (var region in _analyzer.Regions.OrderBy(r => r.StartAddress)) {
			Regions.Add(region);
		}
	}

	private void RefreshGaps() {
		Gaps.Clear();
		foreach (var gap in _analyzer.FindGaps(TotalSize)) {
			Gaps.Add(new MemoryRegion {
				Name = "Gap",
				StartAddress = gap.Start,
				EndAddress = gap.End,
				Type = MemoryRegionType.Unknown
			});
		}
	}

	private void RefreshOverlaps() {
		Overlaps.Clear();
		foreach (var overlap in _analyzer.FindOverlaps()) {
			Overlaps.Add(overlap);
		}
	}

	private void UpdateStatistics() {
		var stats = _analyzer.GetStatistics(TotalSize);
		RegionCount = stats.RegionCount;
		MappedBytes = stats.MappedSize;
		UnmappedBytes = stats.UnmappedSize;
		OverlapCount = Overlaps.Count;
	}

	private void GenerateMap() {
		AsciiMap = _analyzer.GenerateAsciiMap(TotalSize);
	}

	[RelayCommand]
	private void AddRegion() {
		if (string.IsNullOrWhiteSpace(NewRegionName)) {
			StatusText = "Region name is required";
			return;
		}

		if (NewRegionEnd <= NewRegionStart) {
			StatusText = "End address must be greater than start address";
			return;
		}

		var region = new MemoryRegion {
			Name = NewRegionName.Trim(),
			StartAddress = NewRegionStart,
			EndAddress = NewRegionEnd,
			Type = NewRegionType,
			Description = string.IsNullOrWhiteSpace(NewRegionDescription) ? null : NewRegionDescription.Trim()
		};

		_analyzer.AddRegion(region);
		RefreshAll();

		// Clear fields
		NewRegionName = "";
		NewRegionDescription = "";
		StatusText = $"Added region: {region.Name} (${region.StartAddress:x6}-${region.EndAddress:x6})";
	}

	[RelayCommand]
	private void RemoveRegion() {
		if (SelectedRegion is null) {
			StatusText = "No region selected";
			return;
		}

		var name = SelectedRegion.Name;
		_analyzer.RemoveRegion(SelectedRegion);
		RefreshAll();
		SelectedRegion = null;
		StatusText = $"Removed region: {name}";
	}

	[RelayCommand]
	private void FindRegionAtAddress(int address) {
		var region = _analyzer.FindRegion(address);
		if (region is not null) {
			SelectedRegion = region;
			StatusText = $"Found region: {region.Name} at ${address:x6}";
		} else {
			StatusText = $"No region found at ${address:x6}";
		}
	}

	[RelayCommand]
	private void ClearAllRegions() {
		_analyzer = new MemoryLayoutAnalyzer();
		RefreshAll();
		StatusText = "Cleared all regions";
	}

	[RelayCommand]
	private void AutoDetectRegions() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded for analysis";
			return;
		}

		// This would use heuristics to detect code/data regions
		StatusText = "Auto-detection not yet implemented";
	}
}
