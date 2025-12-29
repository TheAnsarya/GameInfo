using System.Collections.ObjectModel;
using System.Text.Json;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for TAS file converter tool.
/// </summary>
public partial class TasConverterViewModel : ViewModelBase {
	private readonly TasConverter _converter = new();
	private ITasMovie? _currentMovie;
	private string _inputFilePath = "";

	[ObservableProperty]
	private bool _hasFileLoaded;

	[ObservableProperty]
	private string _fileName = "";

	[ObservableProperty]
	private string _formatName = "";

	[ObservableProperty]
	private string _emulatorName = "";

	[ObservableProperty]
	private string _systemName = "";

	[ObservableProperty]
	private int _frameCount;

	[ObservableProperty]
	private int _controllerCount;

	[ObservableProperty]
	private string _duration = "";

	[ObservableProperty]
	private int _rerecordCount;

	[ObservableProperty]
	private string _author = "";

	[ObservableProperty]
	private string _romName = "";

	[ObservableProperty]
	private string _region = "";

	[ObservableProperty]
	private string _startType = "";

	[ObservableProperty]
	private bool _hasSavestate;

	[ObservableProperty]
	private bool _hasSram;

	[ObservableProperty]
	private string _statusText = "Ready - Open a TAS file to begin";

	[ObservableProperty]
	private bool _isConverting;

	[ObservableProperty]
	private int _conversionProgress;

	[ObservableProperty]
	private string _selectedTargetFormat = "";

	[ObservableProperty]
	private bool _stripSavestate;

	[ObservableProperty]
	private bool _stripSram;

	[ObservableProperty]
	private string _metadataJson = "";

	public ObservableCollection<FormatInfo> AvailableFormats { get; } = [];
	public ObservableCollection<TasFrameDisplay> DisplayedFrames { get; } = [];
	public ObservableCollection<ControllerDisplay> Controllers { get; } = [];

	public TasConverterViewModel() {
		// Register default formats
		DefaultFormats.Register();

		// Populate available formats
		foreach (var format in TasFormatRegistry.Instance.Formats.OrderBy(f => f.Name)) {
			if (format.CanWrite) {
				AvailableFormats.Add(new FormatInfo(
					format.Name,
					format.Description,
					format.EmulatorName,
					string.Join(", ", format.Extensions.Select(e => $".{e}")),
					string.Join(", ", format.SupportedSystems.Select(s => s.GetDisplayName()))));
			}
		}
	}

	[RelayCommand]
	private async Task OpenFile() {
		var window = GetWindow();
		if (window is null) return;

		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open TAS File",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("TAS Files") {
					Patterns = ["*.smv", "*.bk2", "*.lsmv", "*.fm2", "*.fm3", "*.vbm", "*.dtm", "*.bsv", "*.mcm"]
				},
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			]
		});

		if (files.Count > 0) {
			await LoadFile(files[0].Path.LocalPath);
		}
	}

	private async Task LoadFile(string path) {
		try {
			StatusText = $"Loading {Path.GetFileName(path)}...";
			IsConverting = true;

			var info = await _converter.GetInfoAsync(path);
			_inputFilePath = path;

			// Read full movie
			using var stream = File.OpenRead(path);
			var format = TasFormatRegistry.Instance.DetectFormat(path);
			if (format is not null) {
				_currentMovie = await format.ReadAsync(stream);
			}

			// Update UI properties
			FileName = info.FileName;
			FormatName = info.FormatName ?? "Unknown";
			EmulatorName = info.EmulatorName ?? "Unknown";
			SystemName = info.System.GetDisplayName();
			FrameCount = info.FrameCount;
			ControllerCount = info.ControllerCount;
			Duration = info.Duration?.ToString(@"hh\:mm\:ss\.fff") ?? "Unknown";
			HasSavestate = info.HasSavestate;
			HasSram = info.HasSram;

			if (info.Metadata is not null) {
				RerecordCount = info.Metadata.RerecordCount;
				Author = info.Metadata.Author ?? "";
				RomName = info.Metadata.RomName ?? info.Metadata.RomFilename ?? "";
				Region = info.Metadata.Region.ToString();
				StartType = info.Metadata.StartType.ToString();

				// Generate JSON for metadata display
				var options = new JsonSerializerOptions {
					WriteIndented = true,
					PropertyNamingPolicy = JsonNamingPolicy.CamelCase
				};
				MetadataJson = JsonSerializer.Serialize(info.Metadata, options);
			}

			// Populate controllers
			Controllers.Clear();
			if (_currentMovie is not null) {
				foreach (var ctrl in _currentMovie.Controllers) {
					Controllers.Add(new ControllerDisplay(
						ctrl.Port,
						ctrl.Type.ToString()));
				}
			}

			// Show first 1000 frames in preview
			DisplayedFrames.Clear();
			if (_currentMovie is not null) {
				foreach (var frame in _currentMovie.Frames.Take(1000)) {
					var buttons = frame.Inputs.Count > 0 ? frame.Inputs[0].RawButtons : 0;
					DisplayedFrames.Add(new TasFrameDisplay(
						frame.FrameNumber,
						FormatButtons(buttons, _currentMovie.System),
						frame.Commands.ToString()));
				}
			}

			HasFileLoaded = true;
			StatusText = $"Loaded: {FileName} ({FrameCount:N0} frames)";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
			HasFileLoaded = false;
		} finally {
			IsConverting = false;
		}
	}

	[RelayCommand]
	private async Task Convert() {
		if (_currentMovie is null || string.IsNullOrEmpty(SelectedTargetFormat)) {
			StatusText = "Please load a file and select a target format";
			return;
		}

		var window = GetWindow();
		if (window is null) return;

		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		// Get target format
		var targetFormat = TasFormatRegistry.Instance.GetByName(SelectedTargetFormat);
		if (targetFormat is null) {
			StatusText = $"Unknown format: {SelectedTargetFormat}";
			return;
		}

		// Get default extension
		var defaultExt = targetFormat.Extensions.FirstOrDefault() ?? "tas";

		var file = await topLevel.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save Converted TAS File",
			DefaultExtension = defaultExt,
			SuggestedFileName = Path.GetFileNameWithoutExtension(FileName) + "." + defaultExt,
			FileTypeChoices = [
				new FilePickerFileType($"{targetFormat.Name} Files") {
					Patterns = targetFormat.Extensions.Select(e => $"*.{e}").ToList()
				}
			]
		});

		if (file is null) return;

		try {
			IsConverting = true;
			ConversionProgress = 0;

			var options = new ConversionOptions {
				IncludeSavestate = !StripSavestate,
				IncludeSram = !StripSram
			};

			var progress = new Progress<ConversionProgress>(p => {
				ConversionProgress = p.Percent;
				StatusText = $"{p.Stage}: {p.Percent}%";
			});

			var result = await _converter.ConvertAsync(
				_inputFilePath,
				file.Path.LocalPath,
				targetFormat,
				options,
				progress);

			if (result.Success) {
				StatusText = $"Converted to {targetFormat.Name}: {result.FrameCount:N0} frames ({result.OutputSize:N0} bytes)";
			} else {
				StatusText = $"Conversion failed: {result.Error}";
			}
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsConverting = false;
			ConversionProgress = 0;
		}
	}

	[RelayCommand]
	private void ListFormats() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("Supported TAS Formats:");
		sb.AppendLine("═══════════════════════════════════════════════════════════════");
		sb.AppendLine();

		foreach (var format in TasFormatRegistry.Instance.Formats.OrderBy(f => f.Name)) {
			sb.AppendLine($"{format.Name,-8} ({format.EmulatorName})");
			sb.AppendLine($"         {format.Description}");
			sb.AppendLine($"         Extensions: {string.Join(", ", format.Extensions.Select(e => $".{e}"))}");
			sb.AppendLine($"         Systems: {string.Join(", ", format.SupportedSystems.Select(s => s.GetDisplayName()))}");
			sb.AppendLine($"         Read: {(format.CanRead ? "✓" : "✗")}  Write: {(format.CanWrite ? "✓" : "✗")}");
			sb.AppendLine();
		}

		MetadataJson = sb.ToString();
	}

	[RelayCommand]
	private async Task CopyMetadata() {
		if (string.IsNullOrEmpty(MetadataJson)) return;

		var window = GetWindow();
		if (window is null) return;

		var clipboard = TopLevel.GetTopLevel(window)?.Clipboard;
		if (clipboard is not null) {
			await clipboard.SetTextAsync(MetadataJson);
			StatusText = "Metadata copied to clipboard";
		}
	}

	[RelayCommand]
	private async Task ValidateFile() {
		if (_currentMovie is null || string.IsNullOrEmpty(_inputFilePath)) {
			StatusText = "No file loaded";
			return;
		}

		var issues = new List<string>();

		if (_currentMovie.Frames.Count == 0) {
			issues.Add("Movie has no frames");
		}

		if (_currentMovie.Controllers.Count == 0) {
			issues.Add("No controllers defined");
		}

		if (_currentMovie.Metadata.StartType == MovieStartType.Savestate && _currentMovie.SavestateData is null) {
			issues.Add("Movie starts from savestate but no savestate data found");
		}

		// Check for unusual button combinations
		var suspiciousFrames = 0;
		foreach (var frame in _currentMovie.Frames) {
			if (frame.Inputs.Count > 0) {
				var buttons = frame.Inputs[0].RawButtons;
				// Check for physically impossible inputs (e.g., Up+Down, Left+Right on NES/SNES)
				if ((_currentMovie.System is GameSystem.Nes or GameSystem.Snes) &&
					((buttons & 0x30) == 0x30 || (buttons & 0xC0) == 0xC0)) {
					suspiciousFrames++;
				}
			}
		}

		if (suspiciousFrames > 0) {
			issues.Add($"{suspiciousFrames} frames with potentially invalid inputs (Up+Down or Left+Right)");
		}

		if (issues.Count == 0) {
			StatusText = "✓ File appears valid";
		} else {
			StatusText = $"⚠ {issues.Count} issue(s) found";
			MetadataJson = "Validation Issues:\n" + string.Join("\n", issues.Select(i => $"- {i}"));
		}
	}

	private static string FormatButtons(uint buttons, GameSystem system) {
		return system switch {
			GameSystem.Snes => FormatSnesButtons(buttons),
			GameSystem.Nes => FormatNesButtons(buttons),
			GameSystem.GameBoy or GameSystem.GameBoyColor => FormatGbButtons(buttons),
			GameSystem.GameBoyAdvance => FormatGbaButtons(buttons),
			_ => buttons.ToString("X8")
		};
	}

	private static string FormatSnesButtons(uint buttons) {
		var parts = new List<string>();
		if ((buttons & 0x8000) != 0) parts.Add("B");
		if ((buttons & 0x4000) != 0) parts.Add("Y");
		if ((buttons & 0x2000) != 0) parts.Add("Se");
		if ((buttons & 0x1000) != 0) parts.Add("St");
		if ((buttons & 0x0800) != 0) parts.Add("U");
		if ((buttons & 0x0400) != 0) parts.Add("D");
		if ((buttons & 0x0200) != 0) parts.Add("L");
		if ((buttons & 0x0100) != 0) parts.Add("R");
		if ((buttons & 0x0080) != 0) parts.Add("A");
		if ((buttons & 0x0040) != 0) parts.Add("X");
		if ((buttons & 0x0020) != 0) parts.Add("l");
		if ((buttons & 0x0010) != 0) parts.Add("r");
		return parts.Count > 0 ? string.Join(" ", parts) : "-";
	}

	private static string FormatNesButtons(uint buttons) {
		var parts = new List<string>();
		if ((buttons & 0x80) != 0) parts.Add("A");
		if ((buttons & 0x40) != 0) parts.Add("B");
		if ((buttons & 0x20) != 0) parts.Add("Se");
		if ((buttons & 0x10) != 0) parts.Add("St");
		if ((buttons & 0x08) != 0) parts.Add("U");
		if ((buttons & 0x04) != 0) parts.Add("D");
		if ((buttons & 0x02) != 0) parts.Add("L");
		if ((buttons & 0x01) != 0) parts.Add("R");
		return parts.Count > 0 ? string.Join(" ", parts) : "-";
	}

	private static string FormatGbButtons(uint buttons) {
		var parts = new List<string>();
		if ((buttons & 0x01) != 0) parts.Add("A");
		if ((buttons & 0x02) != 0) parts.Add("B");
		if ((buttons & 0x04) != 0) parts.Add("Se");
		if ((buttons & 0x08) != 0) parts.Add("St");
		if ((buttons & 0x10) != 0) parts.Add("R");
		if ((buttons & 0x20) != 0) parts.Add("L");
		if ((buttons & 0x40) != 0) parts.Add("U");
		if ((buttons & 0x80) != 0) parts.Add("D");
		return parts.Count > 0 ? string.Join(" ", parts) : "-";
	}

	private static string FormatGbaButtons(uint buttons) {
		var parts = new List<string>();
		if ((buttons & 0x0001) != 0) parts.Add("A");
		if ((buttons & 0x0002) != 0) parts.Add("B");
		if ((buttons & 0x0004) != 0) parts.Add("Se");
		if ((buttons & 0x0008) != 0) parts.Add("St");
		if ((buttons & 0x0010) != 0) parts.Add("R");
		if ((buttons & 0x0020) != 0) parts.Add("L");
		if ((buttons & 0x0040) != 0) parts.Add("U");
		if ((buttons & 0x0080) != 0) parts.Add("D");
		if ((buttons & 0x0100) != 0) parts.Add("r");
		if ((buttons & 0x0200) != 0) parts.Add("l");
		return parts.Count > 0 ? string.Join(" ", parts) : "-";
	}

	private static Window? GetWindow() {
		return Application.Current?.ApplicationLifetime is Avalonia.Controls.ApplicationLifetimes.IClassicDesktopStyleApplicationLifetime desktop
			? desktop.MainWindow
			: null;
	}
}

/// <summary>
/// Display model for TAS format information.
/// </summary>
public record FormatInfo(string Name, string Description, string Emulator, string Extensions, string Systems);

/// <summary>
/// Display model for a TAS frame.
/// </summary>
public record TasFrameDisplay(int Frame, string Buttons, string Commands);

/// <summary>
/// Display model for controller information.
/// </summary>
public record ControllerDisplay(int Port, string Type);
