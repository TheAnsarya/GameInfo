using System.Collections.ObjectModel;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Build;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for the build pipeline management UI.
/// </summary>
public partial class BuildPipelineViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private BuildConfig? _config;
	private string? _configPath;
	private string? _projectPath;

	[ObservableProperty]
	private bool _hasConfigLoaded;

	[ObservableProperty]
	private bool _isBuilding;

	[ObservableProperty]
	private bool _isExtracting;

	[ObservableProperty]
	private string _statusText = "No build configuration loaded";

	[ObservableProperty]
	private string _projectName = "";

	[ObservableProperty]
	private Platform _selectedPlatform = Platform.Nes;

	[ObservableProperty]
	private Assembler _selectedAssembler = Assembler.Ca65;

	[ObservableProperty]
	private string _mainSourceFile = "";

	[ObservableProperty]
	private string _outputRom = "";

	[ObservableProperty]
	private string _baseRom = "";

	[ObservableProperty]
	private string _extractDir = "assets/binary";

	[ObservableProperty]
	private string _editableDir = "assets/editable";

	[ObservableProperty]
	private string _buildDir = "build";

	[ObservableProperty]
	private int _graphicsBpp = 4;

	[ObservableProperty]
	private string _graphicsFormat = "png";

	[ObservableProperty]
	private CompressionAlgorithm _compressionAlgorithm = CompressionAlgorithm.None;

	[ObservableProperty]
	private bool _verifyBuild = true;

	[ObservableProperty]
	private bool _fixChecksum = true;

	[ObservableProperty]
	private string _buildOutput = "";

	public ObservableCollection<Platform> Platforms { get; } = [
		Platform.Nes,
		Platform.Snes,
		Platform.Genesis,
		Platform.Gb,
		Platform.Gbc,
		Platform.Gba
	];

	public ObservableCollection<Assembler> Assemblers { get; } = [
		Assembler.Ca65,
		Assembler.Asar,
		Assembler.Asm68k,
		Assembler.Rgbds,
		Assembler.DevkitArm
	];

	public ObservableCollection<CompressionAlgorithm> CompressionAlgorithms { get; } = [
		CompressionAlgorithm.None,
		CompressionAlgorithm.Lzss,
		CompressionAlgorithm.Rle,
		CompressionAlgorithm.Huffman,
		CompressionAlgorithm.Custom
	];

	public ObservableCollection<string> GraphicsFormats { get; } = ["png", "json", "binary"];

	public ObservableCollection<AssetDefinitionViewModel> Assets { get; } = [];

	public BuildPipelineViewModel(RomFile? rom) {
		_rom = rom;
	}

	[RelayCommand]
	private async Task NewConfig(Window window) {
		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var folder = await topLevel.StorageProvider.OpenFolderPickerAsync(new FolderPickerOpenOptions {
			Title = "Select Project Folder",
			AllowMultiple = false
		});

		if (folder.Count > 0) {
			_projectPath = folder[0].Path.LocalPath;
			_configPath = Path.Combine(_projectPath, "build.config.json");

			_config = new BuildConfig {
				Schema = "./build.config.schema.json",
				Project = new ProjectConfig {
					Name = Path.GetFileName(_projectPath),
					Platform = SelectedPlatform
				},
				Source = new SourceConfig {
					Assembler = SelectedAssembler,
					MainFile = "src/main.asm",
					OutputRom = $"build/{Path.GetFileName(_projectPath)}.nes"
				},
				Assets = new AssetsConfig {
					ExtractDir = ExtractDir,
					EditableDir = EditableDir,
					BuildDir = BuildDir
				},
				Build = new BuildOptions {
					Verify = true,
					ChecksumFix = true
				}
			};

			ApplyConfigToViewModel(_config);
			HasConfigLoaded = true;
			StatusText = $"New configuration created for {_projectPath}";
		}
	}

	[RelayCommand]
	private async Task OpenConfig(Window window) {
		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open Build Configuration",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("Build Config") { Patterns = ["build.config.json", "*.config.json"] },
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] }
			]
		});

		if (files.Count > 0) {
			_configPath = files[0].Path.LocalPath;
			_projectPath = Path.GetDirectoryName(_configPath);
			await LoadConfigAsync(_configPath);
		}
	}

	[RelayCommand]
	private async Task SaveConfig() {
		if (_config is null || string.IsNullOrEmpty(_configPath)) return;

		try {
			UpdateConfigFromViewModel();
			await _config.SaveAsync(_configPath);
			StatusText = "Configuration saved";
		} catch (Exception ex) {
			StatusText = $"Save error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task SaveConfigAs(Window window) {
		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var file = await topLevel.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save Build Configuration",
			DefaultExtension = ".json",
			SuggestedFileName = "build.config.json",
			FileTypeChoices = [
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] }
			]
		});

		if (file is not null) {
			_configPath = file.Path.LocalPath;
			_projectPath = Path.GetDirectoryName(_configPath);
			await SaveConfig();
		}
	}

	[RelayCommand]
	private async Task ExtractAssets(Window window) {
		if (_config is null || string.IsNullOrEmpty(_projectPath)) return;

		// Check for base ROM
		var romPath = !string.IsNullOrEmpty(BaseRom)
			? Path.IsPathRooted(BaseRom)
				? BaseRom
				: Path.Combine(_projectPath, BaseRom)
			: _rom?.FilePath;

		if (string.IsNullOrEmpty(romPath) || !File.Exists(romPath)) {
			var topLevel = TopLevel.GetTopLevel(window);
			if (topLevel is null) return;

			var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
				Title = "Select Base ROM for Extraction",
				AllowMultiple = false,
				FileTypeFilter = [
					new FilePickerFileType("ROM Files") { Patterns = ["*.nes", "*.sfc", "*.smc", "*.gb", "*.gbc", "*.gba"] }
				]
			});

			if (files.Count == 0) return;
			romPath = files[0].Path.LocalPath;

			// Update config with selected ROM
			BaseRom = romPath;
		}

		try {
			IsExtracting = true;
			StatusText = "Extracting assets...";
			BuildOutput = $"[{DateTime.Now:HH:mm:ss}] Starting asset extraction\n";
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Base ROM: {romPath}\n";

			UpdateConfigFromViewModel();
			var service = new BuildPipelineService(_projectPath!, _config!);
			var result = await service.ExtractAssetsAsync();

			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Extraction complete\n";
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Extracted {result.ExtractedAssets.Count} assets\n";

			if (result.ExtractedAssets.Count > 0) {
				BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Assets:\n";
				foreach (var asset in result.ExtractedAssets) {
					BuildOutput += $"  - {asset}\n";
				}
			}

			if (result.Errors.Count > 0) {
				BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Errors:\n";
				foreach (var error in result.Errors) {
					BuildOutput += $"  - {error}\n";
				}
			}

			StatusText = $"Extracted {result.ExtractedAssets.Count} assets";
		} catch (Exception ex) {
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] ERROR: {ex.Message}\n";
			StatusText = $"Extraction failed: {ex.Message}";
		} finally {
			IsExtracting = false;
		}
	}

	[RelayCommand]
	private async Task ConvertToEditable() {
		// Note: The current BuildPipelineService doesn't expose ConvertToEditableAsync publicly.
		// This functionality would convert binary assets to editable formats (PNG, JSON, etc.)
		// For now, we'll note this as a feature to implement.
		await Task.CompletedTask;
		StatusText = "Convert to editable: Use the Extract Assets feature with appropriate output format settings.";
		BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Note: Extraction automatically converts to editable formats based on asset type\n";
	}

	[RelayCommand]
	private async Task ConvertToBinary() {
		// Note: The current BuildPipelineService handles this internally during build.
		// ConvertAssetsToBinaryAsync is called automatically before assembly.
		await Task.CompletedTask;
		StatusText = "Convert to binary: This happens automatically during the Build process.";
		BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Note: Assets are converted to binary automatically during build\n";
	}

	[RelayCommand]
	private async Task BuildRom() {
		if (_config is null || string.IsNullOrEmpty(_projectPath)) return;

		try {
			IsBuilding = true;
			StatusText = "Building ROM...";
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Starting build\n";

			UpdateConfigFromViewModel();
			var service = new BuildPipelineService(_projectPath!, _config!);
			var result = await service.BuildAsync();

			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Build {(result.Success ? "succeeded" : "failed")}\n";
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Output: {result.OutputPath}\n";

			if (result.Errors.Count > 0) {
				BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Errors:\n";
				foreach (var error in result.Errors) {
					BuildOutput += $"  - {error}\n";
				}
			}

			if (result.Warnings.Count > 0) {
				BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Warnings:\n";
				foreach (var warning in result.Warnings) {
					BuildOutput += $"  - {warning}\n";
				}
			}

			StatusText = result.Success ? "Build completed successfully" : "Build failed";
		} catch (Exception ex) {
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] ERROR: {ex.Message}\n";
			StatusText = $"Build failed: {ex.Message}";
		} finally {
			IsBuilding = false;
		}
	}

	[RelayCommand]
	private async Task CleanBuild() {
		if (_config is null || string.IsNullOrEmpty(_projectPath)) return;

		try {
			StatusText = "Cleaning build artifacts...";
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Starting clean\n";

			UpdateConfigFromViewModel();
			var service = new BuildPipelineService(_projectPath!, _config!);
			await service.CleanAsync();

			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] Clean complete\n";
			StatusText = "Clean completed";
		} catch (Exception ex) {
			BuildOutput += $"[{DateTime.Now:HH:mm:ss}] ERROR: {ex.Message}\n";
			StatusText = $"Clean failed: {ex.Message}";
		}
	}

	[RelayCommand]
	private void AddAsset() {
		Assets.Add(new AssetDefinitionViewModel {
			Name = $"asset_{Assets.Count + 1}",
			Type = AssetType.Graphics,
			Offset = "0x0",
			Length = "0x100",
			Output = $"asset_{Assets.Count + 1}.bin"
		});
	}

	[RelayCommand]
	private void RemoveAsset(AssetDefinitionViewModel? asset) {
		if (asset is not null) {
			Assets.Remove(asset);
		}
	}

	[RelayCommand]
	private void ClearOutput() {
		BuildOutput = "";
	}

	private async Task LoadConfigAsync(string path) {
		try {
			_config = await BuildConfig.LoadAsync(path);
			ApplyConfigToViewModel(_config);
			HasConfigLoaded = true;
			StatusText = $"Loaded: {path}";
		} catch (Exception ex) {
			StatusText = $"Load error: {ex.Message}";
			HasConfigLoaded = false;
		}
	}

	private void ApplyConfigToViewModel(BuildConfig config) {
		ProjectName = config.Project.Name;
		SelectedPlatform = config.Project.Platform;
		SelectedAssembler = config.Source.Assembler;
		MainSourceFile = config.Source.MainFile;
		OutputRom = config.Source.OutputRom;
		BaseRom = config.Source.BaseRom ?? "";
		ExtractDir = config.Assets.ExtractDir ?? "assets/binary";
		EditableDir = config.Assets.EditableDir ?? "assets/editable";
		BuildDir = config.Assets.BuildDir ?? "build";
		GraphicsBpp = config.Assets.Graphics?.DefaultBpp ?? 4;
		GraphicsFormat = config.Assets.Graphics?.Format ?? "png";
		CompressionAlgorithm = config.Assets.Compression?.Algorithm ?? CompressionAlgorithm.None;
		VerifyBuild = config.Build.Verify;
		FixChecksum = config.Build.ChecksumFix;

		// Load assets
		Assets.Clear();
		if (config.Extraction?.Assets is not null) {
			foreach (var asset in config.Extraction.Assets) {
				Assets.Add(new AssetDefinitionViewModel {
					Name = asset.Name,
					Type = asset.Type,
					Offset = asset.Source.Offset,
					Length = asset.Source.Length ?? "",
					Bank = asset.Source.Bank,
					Output = asset.Output
				});
			}
		}
	}

	private void UpdateConfigFromViewModel() {
		var assetDefs = Assets.Select(a => new AssetDefinition {
			Name = a.Name,
			Type = a.Type,
			Source = new AssetSource {
				Offset = a.Offset,
				Length = string.IsNullOrEmpty(a.Length) ? null : a.Length,
				Bank = a.Bank
			},
			Output = a.Output
		}).ToList();

		_config = new BuildConfig {
			Schema = _config?.Schema,
			Project = new ProjectConfig {
				Name = ProjectName,
				Platform = SelectedPlatform,
				Version = _config?.Project.Version,
				Description = _config?.Project.Description,
				Authors = _config?.Project.Authors
			},
			Source = new SourceConfig {
				Assembler = SelectedAssembler,
				MainFile = MainSourceFile,
				OutputRom = OutputRom,
				BaseRom = string.IsNullOrEmpty(BaseRom) ? null : BaseRom,
				Includes = _config?.Source.Includes,
				Defines = _config?.Source.Defines,
				LinkerConfig = _config?.Source.LinkerConfig,
				AssemblerOptions = _config?.Source.AssemblerOptions
			},
			Assets = new AssetsConfig {
				ExtractDir = ExtractDir,
				EditableDir = EditableDir,
				BuildDir = BuildDir,
				Graphics = new GraphicsConfig {
					Format = GraphicsFormat,
					DefaultBpp = GraphicsBpp,
					Palette = _config?.Assets.Graphics?.Palette
				},
				Palettes = _config?.Assets.Palettes,
				Text = _config?.Assets.Text,
				Compression = new CompressionConfig {
					Algorithm = CompressionAlgorithm,
					CustomScript = _config?.Assets.Compression?.CustomScript
				}
			},
			Build = new BuildOptions {
				Verify = VerifyBuild,
				ChecksumFix = FixChecksum,
				PreBuild = _config?.Build.PreBuild,
				PostBuild = _config?.Build.PostBuild,
				Clean = _config?.Build.Clean
			},
			Extraction = assetDefs.Count > 0 ? new ExtractionConfig { Assets = assetDefs } : null
		};
	}
}

/// <summary>
/// View model for a single asset definition.
/// </summary>
public partial class AssetDefinitionViewModel : ViewModelBase {
	[ObservableProperty]
	private string _name = "";

	[ObservableProperty]
	private AssetType _type = AssetType.Data;

	[ObservableProperty]
	private string _offset = "0x0";

	[ObservableProperty]
	private string _length = "";

	[ObservableProperty]
	private int? _bank;

	[ObservableProperty]
	private string _output = "";

	public ObservableCollection<AssetType> AssetTypes { get; } = [
		AssetType.Graphics,
		AssetType.Palette,
		AssetType.Tilemap,
		AssetType.Data,
		AssetType.Text,
		AssetType.Audio
	];
}
