using System.IO.Compression;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Project;

/// <summary>
/// Represents a .giproj project file containing all assets and metadata
/// for a ROM hacking project.
/// </summary>
public class Project : IDisposable {
	private bool _disposed;
	private bool _modified;

	/// <summary>
	/// Project metadata from project.json.
	/// </summary>
	public ProjectMetadata Metadata { get; set; } = new();

	/// <summary>
	/// Asset manifest from manifest.json.
	/// </summary>
	public AssetManifest Manifest { get; set; } = new();

	/// <summary>
	/// Path to the .giproj file on disk.
	/// </summary>
	public string? FilePath { get; set; }

	/// <summary>
	/// Whether the project has been modified since last save.
	/// </summary>
	public bool IsModified {
		get => _modified;
		set {
			if (_modified != value) {
				_modified = value;
				ModifiedChanged?.Invoke(this, EventArgs.Empty);
			}
		}
	}

	/// <summary>
	/// Project name (from metadata or file name).
	/// </summary>
	public string Name => Metadata.Name ?? Path.GetFileNameWithoutExtension(FilePath) ?? "Untitled";

	/// <summary>
	/// Event raised when modified state changes.
	/// </summary>
	public event EventHandler? ModifiedChanged;

	/// <summary>
	/// In-memory asset storage for unsaved projects.
	/// </summary>
	public Dictionary<string, byte[]> Assets { get; } = [];

	/// <summary>
	/// Temporary extraction directory for working with project contents.
	/// </summary>
	public string? WorkingDirectory { get; set; }

	/// <summary>
	/// Creates a new empty project.
	/// </summary>
	public Project() { }

	/// <summary>
	/// Creates a project with the specified metadata.
	/// </summary>
	public Project(ProjectMetadata metadata) {
		Metadata = metadata;
	}

	/// <summary>
	/// Gets the path to an asset file within the project.
	/// </summary>
	/// <param name="relativePath">Relative path within the project archive.</param>
	/// <returns>Full path to the asset in the working directory.</returns>
	public string GetAssetPath(string relativePath) {
		if (WorkingDirectory is null) {
			throw new InvalidOperationException("Project working directory not set.");
		}

		return Path.Combine(WorkingDirectory, relativePath);
	}

	/// <summary>
	/// Reads an asset file from the project.
	/// </summary>
	/// <param name="relativePath">Relative path within the project archive.</param>
	/// <returns>Asset data as bytes.</returns>
	public async Task<byte[]> ReadAssetAsync(string relativePath) {
		// First check in-memory assets
		if (Assets.TryGetValue(relativePath, out var data)) {
			return data;
		}

		// Then check working directory
		var path = GetAssetPath(relativePath);
		if (File.Exists(path)) {
			return await File.ReadAllBytesAsync(path);
		}

		throw new FileNotFoundException($"Asset not found: {relativePath}");
	}

	/// <summary>
	/// Writes an asset file to the project.
	/// </summary>
	/// <param name="relativePath">Relative path within the project archive.</param>
	/// <param name="data">Asset data to write.</param>
	public async Task WriteAssetAsync(string relativePath, byte[] data) {
		// Store in memory
		Assets[relativePath] = data;

		// Also write to working directory if available
		if (WorkingDirectory is not null) {
			var path = GetAssetPath(relativePath);
			var dir = Path.GetDirectoryName(path);
			if (dir is not null) {
				Directory.CreateDirectory(dir);
			}

			await File.WriteAllBytesAsync(path, data);
		}

		IsModified = true;
	}

	/// <summary>
	/// Checks if an asset exists in the project.
	/// </summary>
	/// <param name="relativePath">Relative path within the project archive.</param>
	/// <returns>True if the asset exists.</returns>
	public bool AssetExists(string relativePath) {
		if (Assets.ContainsKey(relativePath)) {
			return true;
		}

		if (WorkingDirectory is not null) {
			return File.Exists(GetAssetPath(relativePath));
		}

		return false;
	}

	/// <summary>
	/// Gets all asset paths in the project.
	/// </summary>
	/// <param name="folder">Optional folder to filter by (e.g., "assets/graphics").</param>
	/// <returns>List of relative asset paths.</returns>
	public IEnumerable<string> GetAssetPaths(string? folder = null) {
		var paths = new HashSet<string>();

		// Add in-memory assets
		foreach (var key in Assets.Keys) {
			if (folder is null || key.StartsWith(folder, StringComparison.OrdinalIgnoreCase)) {
				paths.Add(key);
			}
		}

		// Add working directory files
		if (WorkingDirectory is not null) {
			var searchPath = folder is not null
				? Path.Combine(WorkingDirectory, folder)
				: WorkingDirectory;

			if (Directory.Exists(searchPath)) {
				foreach (var file in Directory.EnumerateFiles(searchPath, "*", SearchOption.AllDirectories)) {
					var relativePath = Path.GetRelativePath(WorkingDirectory, file);
					if (folder is null || relativePath.StartsWith(folder, StringComparison.OrdinalIgnoreCase)) {
						paths.Add(relativePath.Replace('\\', '/'));
					}
				}
			}
		}

		return paths.Order();
	}

	/// <summary>
	/// Releases resources used by the project.
	/// </summary>
	public void Dispose() {
		Dispose(true);
		GC.SuppressFinalize(this);
	}

	/// <summary>
	/// Releases resources used by the project.
	/// </summary>
	protected virtual void Dispose(bool disposing) {
		if (_disposed) {
			return;
		}

		if (disposing) {
			// Clean up working directory if it's a temp directory
			if (WorkingDirectory is not null &&
				WorkingDirectory.Contains(Path.GetTempPath(), StringComparison.OrdinalIgnoreCase)) {
				try {
					Directory.Delete(WorkingDirectory, true);
				} catch {
					// Ignore cleanup errors
				}
			}

			Assets.Clear();
		}

		_disposed = true;
	}
}

/// <summary>
/// Project metadata stored in project.json.
/// </summary>
public class ProjectMetadata {
	/// <summary>Schema version for the project format.</summary>
	[JsonPropertyName("version")]
	public string Version { get; set; } = "1.0";

	/// <summary>Project name.</summary>
	[JsonPropertyName("name")]
	public string? Name { get; set; }

	/// <summary>Project description.</summary>
	[JsonPropertyName("description")]
	public string? Description { get; set; }

	/// <summary>Project author(s).</summary>
	[JsonPropertyName("authors")]
	public List<string> Authors { get; set; } = [];

	/// <summary>Date the project was created.</summary>
	[JsonPropertyName("created")]
	public DateTime Created { get; set; } = DateTime.UtcNow;

	/// <summary>Date the project was last modified.</summary>
	[JsonPropertyName("modified")]
	public DateTime Modified { get; set; } = DateTime.UtcNow;

	/// <summary>Game definition for this project.</summary>
	[JsonPropertyName("game")]
	public GameReference Game { get; set; } = new();

	/// <summary>Reference ROM information.</summary>
	[JsonPropertyName("referenceRom")]
	public RomReference ReferenceRom { get; set; } = new();

	/// <summary>Build configuration.</summary>
	[JsonPropertyName("build")]
	public BuildConfiguration Build { get; set; } = new();

	/// <summary>Additional project settings.</summary>
	[JsonPropertyName("settings")]
	public Dictionary<string, JsonElement> Settings { get; set; } = [];
}

/// <summary>
/// Reference to a game definition.
/// </summary>
public class GameReference {
	/// <summary>Unique game identifier (e.g., "dw4-nes-us").</summary>
	[JsonPropertyName("id")]
	public string Id { get; set; } = "";

	/// <summary>Display name of the game.</summary>
	[JsonPropertyName("name")]
	public string Name { get; set; } = "";

	/// <summary>Platform/system (e.g., "NES", "SNES").</summary>
	[JsonPropertyName("platform")]
	public string Platform { get; set; } = "";

	/// <summary>Region (e.g., "US", "JP", "EU").</summary>
	[JsonPropertyName("region")]
	public string Region { get; set; } = "";
}

/// <summary>
/// Reference to the original ROM used to create the project.
/// </summary>
public class RomReference {
	/// <summary>Original filename of the ROM.</summary>
	[JsonPropertyName("filename")]
	public string? Filename { get; set; }

	/// <summary>File size in bytes.</summary>
	[JsonPropertyName("size")]
	public long Size { get; set; }

	/// <summary>CRC32 checksum.</summary>
	[JsonPropertyName("crc32")]
	public string? Crc32 { get; set; }

	/// <summary>MD5 hash.</summary>
	[JsonPropertyName("md5")]
	public string? Md5 { get; set; }

	/// <summary>SHA1 hash.</summary>
	[JsonPropertyName("sha1")]
	public string? Sha1 { get; set; }

	/// <summary>SHA256 hash.</summary>
	[JsonPropertyName("sha256")]
	public string? Sha256 { get; set; }

	/// <summary>Whether the ROM has a header that should be skipped.</summary>
	[JsonPropertyName("hasHeader")]
	public bool HasHeader { get; set; }

	/// <summary>Size of the header to skip (typically 16 for iNES, 512 for SNES copier).</summary>
	[JsonPropertyName("headerSize")]
	public int HeaderSize { get; set; }
}

/// <summary>
/// Build configuration for the project.
/// </summary>
public class BuildConfiguration {
	/// <summary>Assembler to use (e.g., "ca65", "ophis", "bass", "asar").</summary>
	[JsonPropertyName("assembler")]
	public string Assembler { get; set; } = "ca65";

	/// <summary>Main source file to assemble.</summary>
	[JsonPropertyName("mainSource")]
	public string MainSource { get; set; } = "source/main.asm";

	/// <summary>Output ROM filename.</summary>
	[JsonPropertyName("output")]
	public string Output { get; set; } = "build/output.nes";

	/// <summary>Build profiles with custom settings.</summary>
	[JsonPropertyName("profiles")]
	public Dictionary<string, BuildProfile> Profiles { get; set; } = new() {
		["default"] = new BuildProfile { Name = "Default", Description = "Standard build matching original ROM" }
	};
}

/// <summary>
/// A build profile with custom settings.
/// </summary>
public class BuildProfile {
	/// <summary>Display name of the profile.</summary>
	[JsonPropertyName("name")]
	public string Name { get; set; } = "";

	/// <summary>Description of the profile.</summary>
	[JsonPropertyName("description")]
	public string? Description { get; set; }

	/// <summary>Symbol definitions for this profile.</summary>
	[JsonPropertyName("defines")]
	public Dictionary<string, string> Defines { get; set; } = [];

	/// <summary>Additional assembler arguments.</summary>
	[JsonPropertyName("args")]
	public List<string> Args { get; set; } = [];
}

/// <summary>
/// Asset manifest stored in manifest.json.
/// </summary>
public class AssetManifest {
	/// <summary>Version of the manifest format.</summary>
	[JsonPropertyName("version")]
	public string Version { get; set; } = "1.0";

	/// <summary>When the manifest was last updated.</summary>
	[JsonPropertyName("updated")]
	public DateTime Updated { get; set; } = DateTime.UtcNow;

	/// <summary>List of all assets in the project.</summary>
	[JsonPropertyName("assets")]
	public List<AssetEntry> Assets { get; set; } = [];
}

/// <summary>
/// Entry for a single asset in the manifest.
/// </summary>
public class AssetEntry {
	/// <summary>Relative path within the project archive.</summary>
	[JsonPropertyName("path")]
	public string Path { get; set; } = "";

	/// <summary>Asset type (e.g., "graphics", "text", "data", "map", "audio").</summary>
	[JsonPropertyName("type")]
	public string Type { get; set; } = "";

	/// <summary>Original ROM offset this asset was extracted from.</summary>
	[JsonPropertyName("romOffset")]
	public int? RomOffset { get; set; }

	/// <summary>Original length in the ROM.</summary>
	[JsonPropertyName("romLength")]
	public int? RomLength { get; set; }

	/// <summary>SHA256 hash of the asset content.</summary>
	[JsonPropertyName("sha256")]
	public string? Sha256 { get; set; }

	/// <summary>Whether the asset has been modified from the original.</summary>
	[JsonPropertyName("modified")]
	public bool Modified { get; set; }

	/// <summary>Additional metadata for the asset.</summary>
	[JsonPropertyName("metadata")]
	public Dictionary<string, JsonElement> Metadata { get; set; } = [];
}
