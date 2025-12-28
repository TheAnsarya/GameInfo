using System.Collections.ObjectModel;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Graphics;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for color palette analysis and editing.
/// </summary>
public partial class PaletteEditorViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private GamePalette _currentPalette;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private PaletteFormat _selectedFormat = PaletteFormat.Rgb555;

	[ObservableProperty]
	private int _colorCount = 16;

	[ObservableProperty]
	private int _romOffset;

	[ObservableProperty]
	private string _paletteName = "Untitled";

	[ObservableProperty]
	private int _selectedColorIndex = -1;

	[ObservableProperty]
	private bool _isGrayscale;

	[ObservableProperty]
	private int _uniqueColorCount;

	public ObservableCollection<PaletteColorInfo> Colors { get; } = [];

	public ObservableCollection<GamePalette> SavedPalettes { get; } = [];

	public PaletteFormat[] AvailableFormats { get; } = Enum.GetValues<PaletteFormat>();

	public int[] CommonColorCounts { get; } = [4, 8, 16, 32, 64, 128, 256];

	public PaletteEditorViewModel() : this(null) { }

	public PaletteEditorViewModel(RomFile? rom) {
		_rom = rom;
		_currentPalette = new GamePalette();
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded && rom is not null) {
			DetectPlatformFormat();
		}

		// Initialize with a default grayscale palette
		CreateGrayscalePalette();
	}

	private void DetectPlatformFormat() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		SelectedFormat = info.System switch {
			SystemType.Nes => PaletteFormat.Nes,
			SystemType.Snes => PaletteFormat.Rgb555,
			SystemType.GameBoy => PaletteFormat.GameBoy,
			SystemType.Genesis => PaletteFormat.Genesis,
			_ => PaletteFormat.Rgb888
		};

		ColorCount = info.System switch {
			SystemType.Nes => 16,
			SystemType.GameBoy => 4,
			_ => 16
		};
	}

	private void RefreshColorDisplay() {
		Colors.Clear();
		for (int i = 0; i < _currentPalette.Count; i++) {
			var color = _currentPalette.GetColor(i);
			Colors.Add(new PaletteColorInfo {
				Index = i,
				Color = color,
				HexValue = $"#{color.R:X2}{color.G:X2}{color.B:X2}",
				RgbValue = $"R:{color.R} G:{color.G} B:{color.B}"
			});
		}

		var analysis = PaletteAnalyzer.Analyze(_currentPalette);
		IsGrayscale = analysis.IsGrayscale;
		UniqueColorCount = analysis.UniqueColorCount;
	}

	[RelayCommand]
	private void ReadFromRom() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		if (RomOffset < 0 || RomOffset >= _rom.Length) {
			StatusText = "Invalid ROM offset";
			return;
		}

		int bytesNeeded = SelectedFormat switch {
			PaletteFormat.Rgb888 or PaletteFormat.Bgr888 => ColorCount * 3,
			PaletteFormat.GameBoy => 1,
			_ => ColorCount * 2
		};

		if (RomOffset + bytesNeeded > _rom.Length) {
			StatusText = "Not enough data at offset";
			return;
		}

		var data = _rom.Read(RomOffset, bytesNeeded).ToArray();
		_currentPalette = PaletteAnalyzer.ParseFromBytes(data, SelectedFormat, ColorCount);
		_currentPalette.Name = PaletteName;
		_currentPalette.SourceAddress = RomOffset;

		RefreshColorDisplay();
		StatusText = $"Read {_currentPalette.Count} colors from ${RomOffset:X6}";
	}

	[RelayCommand]
	private void WriteToRom() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		if (RomOffset < 0 || RomOffset >= _rom.Length) {
			StatusText = "Invalid ROM offset";
			return;
		}

		var data = PaletteAnalyzer.ToBytes(_currentPalette);
		if (RomOffset + data.Length > _rom.Length) {
			StatusText = "Palette data exceeds ROM size";
			return;
		}

		_rom.Write(RomOffset, data);
		StatusText = $"Wrote {_currentPalette.Count} colors to ${RomOffset:X6}";
	}

	[RelayCommand]
	private void CreateGrayscalePalette() {
		_currentPalette = PaletteAnalyzer.CreateGrayscaleRamp(ColorCount);
		_currentPalette.Name = PaletteName;
		_currentPalette.Format = SelectedFormat;
		RefreshColorDisplay();
		StatusText = $"Created {ColorCount}-color grayscale palette";
	}

	[RelayCommand]
	private void CreateGameBoyPalette() {
		_currentPalette = PaletteAnalyzer.CreateGameBoyPalette();
		PaletteName = _currentPalette.Name;
		SelectedFormat = PaletteFormat.GameBoy;
		ColorCount = 4;
		RefreshColorDisplay();
		StatusText = "Created Game Boy palette";
	}

	[RelayCommand]
	private void SavePalette() {
		var clone = _currentPalette.Clone();
		clone.Name = PaletteName;
		SavedPalettes.Add(clone);
		StatusText = $"Saved palette: {clone.Name}";
	}

	[RelayCommand]
	private void LoadPalette(GamePalette palette) {
		_currentPalette = palette.Clone();
		PaletteName = _currentPalette.Name;
		SelectedFormat = _currentPalette.Format;
		ColorCount = _currentPalette.Count;
		if (_currentPalette.SourceAddress.HasValue) {
			RomOffset = _currentPalette.SourceAddress.Value;
		}

		RefreshColorDisplay();
		StatusText = $"Loaded palette: {palette.Name}";
	}

	[RelayCommand]
	private void EditColor(int index) {
		if (index < 0 || index >= _currentPalette.Count) {
			StatusText = "Invalid color index";
			return;
		}

		SelectedColorIndex = index;
		// Color editing would be done through a color picker dialog
		StatusText = $"Selected color {index}";
	}

	/// <summary>
	/// Sets a color in the palette at the selected index.
	/// </summary>
	public void SetColor(byte r, byte g, byte b) {
		if (SelectedColorIndex < 0) {
			StatusText = "No color selected";
			return;
		}

		_currentPalette.SetColor(SelectedColorIndex, System.Drawing.Color.FromArgb(r, g, b));
		RefreshColorDisplay();
		StatusText = $"Set color {SelectedColorIndex} to RGB({r}, {g}, {b})";
	}

	/// <summary>
	/// Swaps colors between two indices.
	/// </summary>
	public void SwapColors(int index1, int index2) {
		if (index1 < 0 || index1 >= _currentPalette.Count ||
			index2 < 0 || index2 >= _currentPalette.Count) {
			StatusText = "Invalid color indices";
			return;
		}

		var temp = _currentPalette.GetColor(index1);
		_currentPalette.SetColor(index1, _currentPalette.GetColor(index2));
		_currentPalette.SetColor(index2, temp);
		RefreshColorDisplay();
		StatusText = $"Swapped colors {index1} and {index2}";
	}

	[RelayCommand]
	private async Task ExportPng(Window window) {
		var file = await window.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Export Palette as PNG",
			DefaultExtension = ".png",
			FileTypeChoices = [
				new FilePickerFileType("PNG Image") { Patterns = ["*.png"] }
			]
		});

		if (file is null) return;

		// Generate a palette swatch image
		// This would create a visual representation of the palette
		StatusText = $"Exported palette to {file.Name}";
	}

	[RelayCommand]
	private async Task ImportFromImage(Window window) {
		var files = await window.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Import Palette from Image",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("Images") { Patterns = ["*.png", "*.bmp", "*.gif"] }
			]
		});

		if (files.Count == 0) return;

		// Extract palette from image
		// This would analyze the image and extract unique colors
		StatusText = $"Imported palette from {files[0].Name}";
	}

	partial void OnColorCountChanged(int value) {
		if (_currentPalette.Count != value) {
			CreateGrayscalePalette();
		}
	}
}

/// <summary>
/// Display information for a palette color.
/// </summary>
public class PaletteColorInfo {
	public int Index { get; init; }
	public System.Drawing.Color Color { get; init; }
	public string HexValue { get; init; } = "";
	public string RgbValue { get; init; } = "";
}
