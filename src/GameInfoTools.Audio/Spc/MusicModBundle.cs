using System.IO.Compression;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Music mod bundle for distributing SPC modifications.
/// Packages original SPC, modified SPC, metadata, and optional project files.
/// </summary>
public class MusicModBundle {
	/// <summary>
	/// Bundle file extension.
	/// </summary>
	public const string Extension = ".spcmod";

	/// <summary>
	/// Manifest file name inside the bundle.
	/// </summary>
	public const string ManifestFileName = "manifest.json";

	/// <summary>
	/// Bundle manifest with metadata and contents.
	/// </summary>
	public BundleManifest Manifest { get; set; } = new();

	/// <summary>
	/// Original SPC file (reference).
	/// </summary>
	public byte[]? OriginalSpc { get; set; }

	/// <summary>
	/// Modified SPC file.
	/// </summary>
	public byte[]? ModifiedSpc { get; set; }

	/// <summary>
	/// Ableton project file (.als) if available.
	/// </summary>
	public byte[]? AbletonProject { get; set; }

	/// <summary>
	/// Additional files included in the bundle.
	/// </summary>
	public Dictionary<string, byte[]> AdditionalFiles { get; } = [];

	/// <summary>
	/// Create a new empty bundle.
	/// </summary>
	public static MusicModBundle Create(string title, string author) {
		return new MusicModBundle {
			Manifest = new BundleManifest {
				Title = title,
				Author = author,
				CreatedDate = DateTime.UtcNow,
				BundleVersion = "1.0.0"
			}
		};
	}

	/// <summary>
	/// Load a bundle from a file.
	/// </summary>
	public static MusicModBundle Load(string filePath) {
		using var stream = File.OpenRead(filePath);
		return Load(stream);
	}

	/// <summary>
	/// Load a bundle from a stream.
	/// </summary>
	public static MusicModBundle Load(Stream stream) {
		var bundle = new MusicModBundle();

		using var archive = new ZipArchive(stream, ZipArchiveMode.Read);

		// Load manifest
		var manifestEntry = archive.GetEntry(ManifestFileName)
			?? throw new InvalidDataException("Bundle missing manifest.json");

		using (var manifestStream = manifestEntry.Open()) {
			bundle.Manifest = JsonSerializer.Deserialize<BundleManifest>(manifestStream)
				?? throw new InvalidDataException("Invalid manifest.json");
		}

		// Load SPC files
		if (bundle.Manifest.OriginalSpcPath != null) {
			var entry = archive.GetEntry(bundle.Manifest.OriginalSpcPath);
			if (entry != null) {
				bundle.OriginalSpc = ReadEntry(entry);
			}
		}

		if (bundle.Manifest.ModifiedSpcPath != null) {
			var entry = archive.GetEntry(bundle.Manifest.ModifiedSpcPath);
			if (entry != null) {
				bundle.ModifiedSpc = ReadEntry(entry);
			}
		}

		// Load Ableton project
		if (bundle.Manifest.AbletonProjectPath != null) {
			var entry = archive.GetEntry(bundle.Manifest.AbletonProjectPath);
			if (entry != null) {
				bundle.AbletonProject = ReadEntry(entry);
			}
		}

		// Load additional files
		foreach (var additional in bundle.Manifest.AdditionalFiles) {
			var entry = archive.GetEntry(additional.Path);
			if (entry != null) {
				bundle.AdditionalFiles[additional.Path] = ReadEntry(entry);
			}
		}

		return bundle;
	}

	/// <summary>
	/// Save the bundle to a file.
	/// </summary>
	public void Save(string filePath) {
		using var stream = File.Create(filePath);
		Save(stream);
	}

	/// <summary>
	/// Save the bundle to a stream.
	/// </summary>
	public void Save(Stream stream) {
		using var archive = new ZipArchive(stream, ZipArchiveMode.Create, leaveOpen: true);

		// Update paths in manifest
		if (OriginalSpc != null) {
			Manifest.OriginalSpcPath = "original.spc";
		}
		if (ModifiedSpc != null) {
			Manifest.ModifiedSpcPath = "modified.spc";
		}
		if (AbletonProject != null) {
			Manifest.AbletonProjectPath = "project.als";
		}

		// Write manifest
		var manifestEntry = archive.CreateEntry(ManifestFileName);
		using (var manifestStream = manifestEntry.Open()) {
			var options = new JsonSerializerOptions {
				WriteIndented = true,
				DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
			};
			JsonSerializer.Serialize(manifestStream, Manifest, options);
		}

		// Write SPC files
		if (OriginalSpc != null) {
			WriteEntry(archive, Manifest.OriginalSpcPath!, OriginalSpc);
		}
		if (ModifiedSpc != null) {
			WriteEntry(archive, Manifest.ModifiedSpcPath!, ModifiedSpc);
		}

		// Write Ableton project
		if (AbletonProject != null) {
			WriteEntry(archive, Manifest.AbletonProjectPath!, AbletonProject);
		}

		// Write README if present
		if (!string.IsNullOrEmpty(Manifest.Readme)) {
			WriteEntry(archive, "README.md",
				System.Text.Encoding.UTF8.GetBytes(Manifest.Readme));
		}

		// Write additional files
		foreach (var (path, data) in AdditionalFiles) {
			WriteEntry(archive, path, data);
		}
	}

	/// <summary>
	/// Set the original SPC from a file.
	/// </summary>
	public MusicModBundle SetOriginalSpc(string filePath) {
		OriginalSpc = File.ReadAllBytes(filePath);
		return this;
	}

	/// <summary>
	/// Set the modified SPC from a file.
	/// </summary>
	public MusicModBundle SetModifiedSpc(string filePath) {
		ModifiedSpc = File.ReadAllBytes(filePath);
		return this;
	}

	/// <summary>
	/// Set the original SPC from an SpcFile object.
	/// </summary>
	public MusicModBundle SetOriginalSpc(SpcFile spc) {
		OriginalSpc = spc.ToBytes();
		return this;
	}

	/// <summary>
	/// Set the modified SPC from an SpcFile object.
	/// </summary>
	public MusicModBundle SetModifiedSpc(SpcFile spc) {
		ModifiedSpc = spc.ToBytes();
		return this;
	}

	/// <summary>
	/// Set the Ableton project from a file.
	/// </summary>
	public MusicModBundle SetAbletonProject(string filePath) {
		AbletonProject = File.ReadAllBytes(filePath);
		return this;
	}

	/// <summary>
	/// Add an additional file to the bundle.
	/// </summary>
	public MusicModBundle AddFile(string path, byte[] data, string? description = null) {
		AdditionalFiles[path] = data;
		Manifest.AdditionalFiles.Add(new FileEntry {
			Path = path,
			Description = description
		});
		return this;
	}

	/// <summary>
	/// Add an additional file from disk.
	/// </summary>
	public MusicModBundle AddFile(string bundlePath, string filePath, string? description = null) {
		return AddFile(bundlePath, File.ReadAllBytes(filePath), description);
	}

	/// <summary>
	/// Set the README content.
	/// </summary>
	public MusicModBundle SetReadme(string markdown) {
		Manifest.Readme = markdown;
		return this;
	}

	/// <summary>
	/// Validate the bundle contents.
	/// </summary>
	public BundleValidationResult Validate() {
		var result = new BundleValidationResult();

		// Required fields
		if (string.IsNullOrEmpty(Manifest.Title)) {
			result.Errors.Add("Missing bundle title");
		}
		if (string.IsNullOrEmpty(Manifest.Author)) {
			result.Errors.Add("Missing bundle author");
		}
		if (ModifiedSpc == null) {
			result.Errors.Add("Missing modified SPC file");
		}

		// Recommended fields
		if (OriginalSpc == null) {
			result.Warnings.Add("Original SPC not included (recommended for reference)");
		}
		if (string.IsNullOrEmpty(Manifest.Readme)) {
			result.Warnings.Add("No README included");
		}
		if (string.IsNullOrEmpty(Manifest.Description)) {
			result.Warnings.Add("No description provided");
		}

		// Validate SPC files if present
		if (ModifiedSpc != null) {
			try {
				SpcFile.Parse(ModifiedSpc);
			} catch (Exception ex) {
				result.Errors.Add($"Invalid modified SPC: {ex.Message}");
			}
		}

		if (OriginalSpc != null) {
			try {
				SpcFile.Parse(OriginalSpc);
			} catch (Exception ex) {
				result.Warnings.Add($"Invalid original SPC: {ex.Message}");
			}
		}

		result.IsValid = result.Errors.Count == 0;
		return result;
	}

	/// <summary>
	/// Get a summary of the bundle contents.
	/// </summary>
	public string GetSummary() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"=== Music Mod Bundle: {Manifest.Title} ===");
		sb.AppendLine($"Author: {Manifest.Author}");
		sb.AppendLine($"Version: {Manifest.BundleVersion}");

		if (!string.IsNullOrEmpty(Manifest.Description)) {
			sb.AppendLine($"Description: {Manifest.Description}");
		}

		if (!string.IsNullOrEmpty(Manifest.GameTitle)) {
			sb.AppendLine($"Game: {Manifest.GameTitle}");
		}

		if (!string.IsNullOrEmpty(Manifest.OriginalTrack)) {
			sb.AppendLine($"Original Track: {Manifest.OriginalTrack}");
		}

		sb.AppendLine();
		sb.AppendLine("Contents:");
		sb.AppendLine($"  Original SPC: {(OriginalSpc != null ? $"{OriginalSpc.Length:N0} bytes" : "Not included")}");
		sb.AppendLine($"  Modified SPC: {(ModifiedSpc != null ? $"{ModifiedSpc.Length:N0} bytes" : "Not included")}");
		sb.AppendLine($"  Ableton Project: {(AbletonProject != null ? $"{AbletonProject.Length:N0} bytes" : "Not included")}");

		if (AdditionalFiles.Count > 0) {
			sb.AppendLine($"  Additional Files: {AdditionalFiles.Count}");
			foreach (var (path, data) in AdditionalFiles) {
				sb.AppendLine($"    - {path} ({data.Length:N0} bytes)");
			}
		}

		return sb.ToString();
	}

	private static byte[] ReadEntry(ZipArchiveEntry entry) {
		using var stream = entry.Open();
		using var ms = new MemoryStream();
		stream.CopyTo(ms);
		return ms.ToArray();
	}

	private static void WriteEntry(ZipArchive archive, string path, byte[] data) {
		var entry = archive.CreateEntry(path, CompressionLevel.Optimal);
		using var stream = entry.Open();
		stream.Write(data);
	}
}

/// <summary>
/// Bundle manifest containing metadata and file references.
/// </summary>
public class BundleManifest {
	/// <summary>
	/// Mod title/name.
	/// </summary>
	[JsonPropertyName("title")]
	public string Title { get; set; } = "";

	/// <summary>
	/// Mod author/creator.
	/// </summary>
	[JsonPropertyName("author")]
	public string Author { get; set; } = "";

	/// <summary>
	/// Mod description.
	/// </summary>
	[JsonPropertyName("description")]
	public string? Description { get; set; }

	/// <summary>
	/// Bundle format version.
	/// </summary>
	[JsonPropertyName("bundleVersion")]
	public string BundleVersion { get; set; } = "1.0.0";

	/// <summary>
	/// Mod version.
	/// </summary>
	[JsonPropertyName("modVersion")]
	public string? ModVersion { get; set; }

	/// <summary>
	/// Creation date.
	/// </summary>
	[JsonPropertyName("createdDate")]
	public DateTime CreatedDate { get; set; }

	/// <summary>
	/// Game this mod is for.
	/// </summary>
	[JsonPropertyName("gameTitle")]
	public string? GameTitle { get; set; }

	/// <summary>
	/// Original track name being replaced.
	/// </summary>
	[JsonPropertyName("originalTrack")]
	public string? OriginalTrack { get; set; }

	/// <summary>
	/// Path to original SPC in bundle.
	/// </summary>
	[JsonPropertyName("originalSpcPath")]
	public string? OriginalSpcPath { get; set; }

	/// <summary>
	/// Path to modified SPC in bundle.
	/// </summary>
	[JsonPropertyName("modifiedSpcPath")]
	public string? ModifiedSpcPath { get; set; }

	/// <summary>
	/// Path to Ableton project in bundle.
	/// </summary>
	[JsonPropertyName("abletonProjectPath")]
	public string? AbletonProjectPath { get; set; }

	/// <summary>
	/// README content (markdown).
	/// </summary>
	[JsonPropertyName("readme")]
	public string? Readme { get; set; }

	/// <summary>
	/// Tags for categorization.
	/// </summary>
	[JsonPropertyName("tags")]
	public List<string> Tags { get; set; } = [];

	/// <summary>
	/// Credits for samples, tools, etc.
	/// </summary>
	[JsonPropertyName("credits")]
	public List<Credit> Credits { get; set; } = [];

	/// <summary>
	/// Additional files included.
	/// </summary>
	[JsonPropertyName("additionalFiles")]
	public List<FileEntry> AdditionalFiles { get; set; } = [];

	/// <summary>
	/// Compatibility information.
	/// </summary>
	[JsonPropertyName("compatibility")]
	public CompatibilityInfo? Compatibility { get; set; }
}

/// <summary>
/// Credit entry for attribution.
/// </summary>
public class Credit {
	[JsonPropertyName("name")]
	public string Name { get; set; } = "";

	[JsonPropertyName("role")]
	public string? Role { get; set; }

	[JsonPropertyName("url")]
	public string? Url { get; set; }
}

/// <summary>
/// File entry for additional files.
/// </summary>
public class FileEntry {
	[JsonPropertyName("path")]
	public string Path { get; set; } = "";

	[JsonPropertyName("description")]
	public string? Description { get; set; }
}

/// <summary>
/// Compatibility information.
/// </summary>
public class CompatibilityInfo {
	/// <summary>
	/// Required ROM hash (SHA-1 or CRC32).
	/// </summary>
	[JsonPropertyName("romHash")]
	public string? RomHash { get; set; }

	/// <summary>
	/// Required ROM title.
	/// </summary>
	[JsonPropertyName("romTitle")]
	public string? RomTitle { get; set; }

	/// <summary>
	/// ROM offset where SPC data should be injected.
	/// </summary>
	[JsonPropertyName("injectionOffset")]
	public int? InjectionOffset { get; set; }

	/// <summary>
	/// Track/song ID in the game.
	/// </summary>
	[JsonPropertyName("trackId")]
	public int? TrackId { get; set; }
}

/// <summary>
/// Bundle validation result.
/// </summary>
public class BundleValidationResult {
	public bool IsValid { get; set; } = true;
	public List<string> Errors { get; } = [];
	public List<string> Warnings { get; } = [];

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine(IsValid ? "✓ Bundle Valid" : "✗ Bundle Invalid");

		foreach (var error in Errors) {
			sb.AppendLine($"  ERROR: {error}");
		}

		foreach (var warning in Warnings) {
			sb.AppendLine($"  WARNING: {warning}");
		}

		return sb.ToString();
	}
}
