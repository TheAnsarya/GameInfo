using System.IO.Compression;
using System.Security.Cryptography;
using System.Text.Json;

namespace GameInfoTools.Core.Project;

/// <summary>
/// Default implementation of IProjectService for managing .giproj project files.
/// </summary>
public class ProjectService : IProjectService {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	private readonly IAssetExtractorRegistry _extractorRegistry;
	private readonly IAssemblerRegistry _assemblerRegistry;
	private readonly IBuildVerifier _buildVerifier;

	private Project? _currentProject;

	/// <inheritdoc/>
	public event EventHandler<ProjectChangedEventArgs>? ProjectChanged;

	/// <inheritdoc/>
	public Project? CurrentProject => _currentProject;

	/// <inheritdoc/>
	public bool HasOpenProject => _currentProject is not null;

	/// <summary>
	/// Creates a new ProjectService.
	/// </summary>
	public ProjectService(
		IAssetExtractorRegistry extractorRegistry,
		IAssemblerRegistry assemblerRegistry,
		IBuildVerifier buildVerifier
	) {
		_extractorRegistry = extractorRegistry;
		_assemblerRegistry = assemblerRegistry;
		_buildVerifier = buildVerifier;
	}

	/// <inheritdoc/>
	public async Task<Project> CreateProjectAsync(
		GameDefinition game,
		string romPath,
		string projectPath,
		ProjectCreationOptions? options = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		options ??= new ProjectCreationOptions();

		// Validate inputs
		if (!File.Exists(romPath)) {
			throw new ProjectException(ProjectErrorCode.RomNotFound, $"ROM file not found: {romPath}");
		}

		// Get the appropriate extractor
		var extractor = _extractorRegistry.GetExtractor(game.Id)
			?? throw new ProjectException(ProjectErrorCode.UnsupportedGame, $"No extractor available for game: {game.Id}");

		// Read ROM data
		progress?.Report(new ExtractProgress("Loading ROM", 0, 1, 0));
		var romData = await File.ReadAllBytesAsync(romPath, cancellationToken);

		// Verify ROM
		progress?.Report(new ExtractProgress("Verifying ROM", 0, 1, 5));
		var verification = await extractor.VerifyRomAsync(romData);
		if (verification.Status == RomVerificationStatus.Invalid) {
			throw new ProjectException(ProjectErrorCode.InvalidRom, verification.Message);
		}

		// Create project
		var project = new Project {
			FilePath = projectPath,
			Metadata = new ProjectMetadata {
				Name = options.Name ?? game.Name,
				Description = options.Description,
				Authors = [.. options.Authors],
				Created = DateTime.UtcNow,
				Modified = DateTime.UtcNow,
				Game = new GameReference {
					Id = game.Id,
					Name = game.Name,
					Platform = game.Platform,
					Region = game.Region
				},
				ReferenceRom = new RomReference {
					Filename = Path.GetFileName(romPath),
					Size = romData.Length,
					Crc32 = verification.Crc32,
					Md5 = verification.Md5,
					Sha1 = verification.Sha1,
					Sha256 = verification.Sha256,
					HasHeader = verification.HasHeader,
					HeaderSize = verification.HasHeader ? GetHeaderSize(game.Platform) : 0
				},
				Build = new BuildConfiguration {
					Assembler = game.Assembler,
					MainSource = "source/main.asm",
					Output = $"build/{SanitizeFileName(game.Name)}.{GetRomExtension(game.Platform)}"
				}
			}
		};

		// Create working directory
		project.WorkingDirectory = CreateWorkingDirectory(projectPath);

		// Extract assets
		progress?.Report(new ExtractProgress("Extracting assets", 0, 1, 10));
		var assets = await extractor.ExtractAsync(
			romData,
			options.AssetTypes,
			new Progress<ExtractProgress>(p => {
				// Scale progress from 10% to 90%
				var scaled = 10 + (p.Percentage * 0.8);
				progress?.Report(new ExtractProgress(p.CurrentOperation, p.CurrentItem, p.TotalItems, scaled));
			}),
			cancellationToken
		);

		// Write assets to project
		await WriteAssetsToProjectAsync(project, assets, cancellationToken);

		// Build manifest
		project.Manifest = BuildManifest(assets);

		// Save project
		progress?.Report(new ExtractProgress("Saving project", 0, 1, 95));
		await SaveProjectInternalAsync(project, projectPath, cancellationToken);

		progress?.Report(new ExtractProgress("Complete", 1, 1, 100));

		// Set as current project
		_currentProject = project;
		OnProjectChanged(ProjectChangeType.Opened, project);

		return project;
	}

	/// <inheritdoc/>
	public async Task<Project> OpenProjectAsync(
		string projectPath,
		CancellationToken cancellationToken = default
	) {
		if (!File.Exists(projectPath)) {
			throw new ProjectException(ProjectErrorCode.ProjectNotFound, $"Project file not found: {projectPath}");
		}

		// Close existing project if open
		if (_currentProject is not null) {
			await CloseProjectAsync(false);
		}

		// Extract to working directory
		var workingDir = CreateWorkingDirectory(projectPath);

		try {
			ZipFile.ExtractToDirectory(projectPath, workingDir, overwriteFiles: true);
		} catch (Exception ex) {
			throw new ProjectException(ProjectErrorCode.InvalidProject, $"Failed to extract project: {ex.Message}", ex);
		}

		// Read project.json
		var projectJsonPath = Path.Combine(workingDir, "project.json");
		if (!File.Exists(projectJsonPath)) {
			throw new ProjectException(ProjectErrorCode.InvalidProject, "project.json not found in archive");
		}

		ProjectMetadata metadata;
		try {
			var json = await File.ReadAllTextAsync(projectJsonPath, cancellationToken);
			metadata = JsonSerializer.Deserialize<ProjectMetadata>(json, JsonOptions)
				?? throw new ProjectException(ProjectErrorCode.InvalidProject, "Failed to parse project.json");
		} catch (JsonException ex) {
			throw new ProjectException(ProjectErrorCode.InvalidProject, $"Invalid project.json: {ex.Message}", ex);
		}

		// Read manifest.json if it exists
		AssetManifest manifest = new();
		var manifestPath = Path.Combine(workingDir, "manifest.json");
		if (File.Exists(manifestPath)) {
			try {
				var json = await File.ReadAllTextAsync(manifestPath, cancellationToken);
				manifest = JsonSerializer.Deserialize<AssetManifest>(json, JsonOptions) ?? new();
			} catch {
				// Manifest is optional, continue with empty one
			}
		}

		var project = new Project {
			FilePath = projectPath,
			WorkingDirectory = workingDir,
			Metadata = metadata,
			Manifest = manifest
		};

		_currentProject = project;
		OnProjectChanged(ProjectChangeType.Opened, project);

		return project;
	}

	/// <inheritdoc/>
	public async Task SaveProjectAsync(
		string? path = null,
		CancellationToken cancellationToken = default
	) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		var savePath = path ?? _currentProject.FilePath
			?? throw new ProjectException(ProjectErrorCode.FileSystemError, "No save path specified");

		await SaveProjectInternalAsync(_currentProject, savePath, cancellationToken);

		_currentProject.FilePath = savePath;
		_currentProject.IsModified = false;
		_currentProject.Metadata.Modified = DateTime.UtcNow;

		OnProjectChanged(ProjectChangeType.Saved, _currentProject);
	}

	/// <inheritdoc/>
	public Task CloseProjectAsync(bool save = false) {
		if (_currentProject is null) {
			return Task.CompletedTask;
		}

		if (save) {
			// Note: Not awaiting intentionally for sync close
			SaveProjectAsync().GetAwaiter().GetResult();
		}

		var project = _currentProject;
		_currentProject.Dispose();
		_currentProject = null;

		OnProjectChanged(ProjectChangeType.Closed, project);

		return Task.CompletedTask;
	}

	/// <inheritdoc/>
	public async Task ExtractAssetsAsync(
		string romPath,
		IEnumerable<string>? assetTypes = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		// Get extractor
		var extractor = _extractorRegistry.GetExtractor(_currentProject.Metadata.Game.Id)
			?? throw new ProjectException(ProjectErrorCode.UnsupportedGame,
				$"No extractor for game: {_currentProject.Metadata.Game.Id}");

		// Read ROM
		var romData = await File.ReadAllBytesAsync(romPath, cancellationToken);

		// Extract
		var assets = await extractor.ExtractAsync(romData, assetTypes, progress, cancellationToken);

		// Write to project
		await WriteAssetsToProjectAsync(_currentProject, assets, cancellationToken);

		// Update manifest
		_currentProject.Manifest = BuildManifest(assets);
		_currentProject.IsModified = true;

		OnProjectChanged(ProjectChangeType.Modified, _currentProject);
	}

	/// <inheritdoc/>
	public async Task<BuildResult> BuildAsync(
		string profile = "default",
		IProgress<BuildProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		var buildConfig = _currentProject.Metadata.Build;
		if (!buildConfig.Profiles.TryGetValue(profile, out var buildProfile)) {
			throw new ProjectException(ProjectErrorCode.BuildFailed, $"Build profile not found: {profile}");
		}

		// Get assembler
		var assembler = _assemblerRegistry.GetAssembler(buildConfig.Assembler)
			?? throw new ProjectException(ProjectErrorCode.AssemblerNotFound,
				$"Assembler not found: {buildConfig.Assembler}");

		if (!await assembler.IsAvailableAsync()) {
			throw new ProjectException(ProjectErrorCode.AssemblerNotFound,
				$"Assembler not installed: {buildConfig.Assembler}");
		}

		// Create build context
		var workDir = _currentProject.WorkingDirectory
			?? throw new ProjectException(ProjectErrorCode.BuildFailed, "Project working directory not set");

		var context = new BuildContext {
			Project = _currentProject,
			Profile = profile,
			WorkingDirectory = workDir,
			MainSourceFile = Path.Combine(workDir, buildConfig.MainSource),
			OutputPath = Path.Combine(workDir, buildConfig.Output),
			Defines = new Dictionary<string, string>(buildProfile.Defines),
			AdditionalArgs = [.. buildProfile.Args]
		};

		// Build
		var result = await assembler.BuildAsync(context, progress, cancellationToken);

		if (result.Success) {
			OnProjectChanged(ProjectChangeType.Built, _currentProject);
		}

		return result;
	}

	/// <inheritdoc/>
	public async Task<VerifyResult> VerifyAsync(byte[] romData) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		return await _buildVerifier.VerifyAsync(romData, _currentProject);
	}

	/// <inheritdoc/>
	public IReadOnlyList<string> GetBuildProfiles() {
		if (_currentProject is null) {
			return [];
		}

		return [.. _currentProject.Metadata.Build.Profiles.Keys];
	}

	/// <inheritdoc/>
	public async Task ExportAssetsAsync(
		string outputPath,
		IEnumerable<string>? assetTypes = null,
		CancellationToken cancellationToken = default
	) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		Directory.CreateDirectory(outputPath);

		var typesSet = assetTypes?.ToHashSet(StringComparer.OrdinalIgnoreCase);

		foreach (var assetPath in _currentProject.GetAssetPaths()) {
			// Filter by type if specified
			if (typesSet is not null) {
				var type = GetAssetTypeFromPath(assetPath);
				if (!typesSet.Contains(type)) {
					continue;
				}
			}

			var data = await _currentProject.ReadAssetAsync(assetPath);
			var destPath = Path.Combine(outputPath, assetPath);
			var destDir = Path.GetDirectoryName(destPath);
			if (destDir is not null) {
				Directory.CreateDirectory(destDir);
			}

			await File.WriteAllBytesAsync(destPath, data, cancellationToken);
		}
	}

	/// <inheritdoc/>
	public async Task ImportAssetsAsync(
		string inputPath,
		CancellationToken cancellationToken = default
	) {
		if (_currentProject is null) {
			throw new ProjectException(ProjectErrorCode.NoProjectOpen, "No project is currently open");
		}

		if (!Directory.Exists(inputPath)) {
			throw new ProjectException(ProjectErrorCode.FileSystemError, $"Directory not found: {inputPath}");
		}

		foreach (var file in Directory.EnumerateFiles(inputPath, "*", SearchOption.AllDirectories)) {
			var relativePath = Path.GetRelativePath(inputPath, file).Replace('\\', '/');
			var data = await File.ReadAllBytesAsync(file, cancellationToken);
			await _currentProject.WriteAssetAsync(relativePath, data);
		}

		_currentProject.IsModified = true;
		OnProjectChanged(ProjectChangeType.Modified, _currentProject);
	}

	// Helper methods

	private async Task SaveProjectInternalAsync(Project project, string path, CancellationToken cancellationToken) {
		var workDir = project.WorkingDirectory
			?? throw new ProjectException(ProjectErrorCode.FileSystemError, "Working directory not set");

		// Write project.json
		var projectJson = JsonSerializer.Serialize(project.Metadata, JsonOptions);
		await File.WriteAllTextAsync(Path.Combine(workDir, "project.json"), projectJson, cancellationToken);

		// Write manifest.json
		var manifestJson = JsonSerializer.Serialize(project.Manifest, JsonOptions);
		await File.WriteAllTextAsync(Path.Combine(workDir, "manifest.json"), manifestJson, cancellationToken);

		// Create ZIP archive
		var tempPath = path + ".tmp";
		try {
			if (File.Exists(tempPath)) {
				File.Delete(tempPath);
			}

			ZipFile.CreateFromDirectory(workDir, tempPath, CompressionLevel.Optimal, false);

			// Move temp file to final location
			if (File.Exists(path)) {
				File.Delete(path);
			}

			File.Move(tempPath, path);
		} finally {
			if (File.Exists(tempPath)) {
				File.Delete(tempPath);
			}
		}
	}

	private async Task WriteAssetsToProjectAsync(Project project, AssetCollection assets, CancellationToken cancellationToken) {
		foreach (var asset in assets.All) {
			await project.WriteAssetAsync(asset.Path, asset.Data);
		}
	}

	private static AssetManifest BuildManifest(AssetCollection assets) {
		var manifest = new AssetManifest {
			Updated = DateTime.UtcNow,
			Assets = []
		};

		foreach (var asset in assets.All) {
			manifest.Assets.Add(new AssetEntry {
				Path = asset.Path,
				Type = asset.Type,
				RomOffset = asset.RomOffset,
				RomLength = asset.RomLength,
				Sha256 = ComputeSha256(asset.Data),
				Modified = false
			});
		}

		return manifest;
	}

	private static string ComputeSha256(byte[] data) {
		var hash = SHA256.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	private static string CreateWorkingDirectory(string projectPath) {
		var projectName = Path.GetFileNameWithoutExtension(projectPath);
		var workDir = Path.Combine(Path.GetTempPath(), "giproj", projectName, Guid.NewGuid().ToString("N")[..8]);
		Directory.CreateDirectory(workDir);
		return workDir;
	}

	private static string SanitizeFileName(string name) {
		var invalid = Path.GetInvalidFileNameChars();
		return string.Join("", name.Split(invalid)).Replace(' ', '-').ToLowerInvariant();
	}

	private static int GetHeaderSize(string platform) => platform.ToUpperInvariant() switch {
		"NES" => 16,    // iNES header
		"SNES" => 512,  // Copier header (optional)
		"GB" or "GBC" => 0,
		"GBA" => 0,
		"N64" => 0,
		"GENESIS" or "MD" => 512, // Copier header (optional)
		_ => 0
	};

	private static string GetRomExtension(string platform) => platform.ToUpperInvariant() switch {
		"NES" => "nes",
		"SNES" => "sfc",
		"GB" => "gb",
		"GBC" => "gbc",
		"GBA" => "gba",
		"N64" => "z64",
		"GENESIS" or "MD" => "md",
		_ => "rom"
	};

	private static string GetAssetTypeFromPath(string path) {
		var parts = path.Split('/');
		return parts.Length > 1 ? parts[1] : "unknown";
	}

	private void OnProjectChanged(ProjectChangeType changeType, Project? project) {
		ProjectChanged?.Invoke(this, new ProjectChangedEventArgs {
			ChangeType = changeType,
			Project = project
		});
	}
}
