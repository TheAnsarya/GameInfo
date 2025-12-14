using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Root configuration for a build pipeline project
/// </summary>
public record BuildConfig
{
	[JsonPropertyName("$schema")]
	public string? Schema { get; init; }

	[JsonPropertyName("project")]
	public ProjectConfig Project { get; init; } = new();

	[JsonPropertyName("source")]
	public SourceConfig Source { get; init; } = new();

	[JsonPropertyName("assets")]
	public AssetsConfig Assets { get; init; } = new();

	[JsonPropertyName("build")]
	public BuildOptions Build { get; init; } = new();

	[JsonPropertyName("extraction")]
	public ExtractionConfig? Extraction { get; init; }

	/// <summary>
	/// Load configuration from a JSON file
	/// </summary>
	public static async Task<BuildConfig> LoadAsync(string path)
	{
		var json = await File.ReadAllTextAsync(path);
		return JsonSerializer.Deserialize<BuildConfig>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse build configuration");
	}

	/// <summary>
	/// Save configuration to a JSON file
	/// </summary>
	public async Task SaveAsync(string path)
	{
		var json = JsonSerializer.Serialize(this, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Validate the configuration
	/// </summary>
	public IEnumerable<string> Validate()
	{
		var errors = new List<string>();

		if (string.IsNullOrWhiteSpace(Project.Name))
			errors.Add("Project name is required");

		if (Project.Platform == Platform.Unknown)
			errors.Add("Valid platform is required");

		if (string.IsNullOrWhiteSpace(Source.MainFile))
			errors.Add("Source main file is required");

		if (string.IsNullOrWhiteSpace(Source.OutputRom))
			errors.Add("Output ROM path is required");

		if (Source.Assembler == Assembler.Unknown)
			errors.Add("Valid assembler is required");

		return errors;
	}

	private static JsonSerializerOptions GetJsonOptions() => new()
	{
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};
}

/// <summary>
/// Project metadata configuration
/// </summary>
public record ProjectConfig
{
	[JsonPropertyName("name")]
	public string Name { get; init; } = "";

	[JsonPropertyName("platform")]
	public Platform Platform { get; init; } = Platform.Unknown;

	[JsonPropertyName("version")]
	public string? Version { get; init; }

	[JsonPropertyName("description")]
	public string? Description { get; init; }

	[JsonPropertyName("authors")]
	public List<string>? Authors { get; init; }
}

/// <summary>
/// Source assembly configuration
/// </summary>
public record SourceConfig
{
	[JsonPropertyName("baseRom")]
	public string? BaseRom { get; init; }

	[JsonPropertyName("assembler")]
	public Assembler Assembler { get; init; } = Assembler.Unknown;

	[JsonPropertyName("mainFile")]
	public string MainFile { get; init; } = "";

	[JsonPropertyName("includes")]
	public List<string>? Includes { get; init; }

	[JsonPropertyName("defines")]
	public Dictionary<string, string>? Defines { get; init; }

	[JsonPropertyName("outputRom")]
	public string OutputRom { get; init; } = "";

	[JsonPropertyName("linkerConfig")]
	public string? LinkerConfig { get; init; }

	[JsonPropertyName("assemblerOptions")]
	public List<string>? AssemblerOptions { get; init; }
}

/// <summary>
/// Asset pipeline configuration
/// </summary>
public record AssetsConfig
{
	[JsonPropertyName("extractDir")]
	public string? ExtractDir { get; init; }

	[JsonPropertyName("editableDir")]
	public string? EditableDir { get; init; }

	[JsonPropertyName("buildDir")]
	public string? BuildDir { get; init; }

	[JsonPropertyName("graphics")]
	public GraphicsConfig? Graphics { get; init; }

	[JsonPropertyName("palettes")]
	public PalettesConfig? Palettes { get; init; }

	[JsonPropertyName("text")]
	public TextConfig? Text { get; init; }

	[JsonPropertyName("compression")]
	public CompressionConfig? Compression { get; init; }
}

/// <summary>
/// Graphics conversion configuration
/// </summary>
public record GraphicsConfig
{
	[JsonPropertyName("format")]
	public string Format { get; init; } = "png";

	[JsonPropertyName("tileSize")]
	public int[] TileSize { get; init; } = [8, 8];

	[JsonPropertyName("defaultBpp")]
	public int DefaultBpp { get; init; } = 4;

	[JsonPropertyName("palette")]
	public string? Palette { get; init; }
}

/// <summary>
/// Palette conversion configuration
/// </summary>
public record PalettesConfig
{
	[JsonPropertyName("format")]
	public string Format { get; init; } = "json";

	[JsonPropertyName("colorFormat")]
	public ColorFormat ColorFormat { get; init; } = ColorFormat.Rgb24;
}

/// <summary>
/// Text conversion configuration
/// </summary>
public record TextConfig
{
	[JsonPropertyName("tableFile")]
	public string? TableFile { get; init; }

	[JsonPropertyName("encoding")]
	public string Encoding { get; init; } = "custom";
}

/// <summary>
/// Compression configuration
/// </summary>
public record CompressionConfig
{
	[JsonPropertyName("algorithm")]
	public CompressionAlgorithm Algorithm { get; init; } = CompressionAlgorithm.None;

	[JsonPropertyName("customScript")]
	public string? CustomScript { get; init; }
}

/// <summary>
/// Build process options
/// </summary>
public record BuildOptions
{
	[JsonPropertyName("preBuild")]
	public List<string>? PreBuild { get; init; }

	[JsonPropertyName("postBuild")]
	public List<string>? PostBuild { get; init; }

	[JsonPropertyName("clean")]
	public List<string>? Clean { get; init; }

	[JsonPropertyName("verify")]
	public bool Verify { get; init; } = true;

	[JsonPropertyName("checksumFix")]
	public bool ChecksumFix { get; init; } = true;
}

/// <summary>
/// Asset extraction configuration
/// </summary>
public record ExtractionConfig
{
	[JsonPropertyName("assets")]
	public List<AssetDefinition> Assets { get; init; } = [];
}

/// <summary>
/// Individual asset extraction definition
/// </summary>
public record AssetDefinition
{
	[JsonPropertyName("name")]
	public string Name { get; init; } = "";

	[JsonPropertyName("type")]
	public AssetType Type { get; init; } = AssetType.Data;

	[JsonPropertyName("source")]
	public AssetSource Source { get; init; } = new();

	[JsonPropertyName("output")]
	public string Output { get; init; } = "";

	[JsonPropertyName("options")]
	public Dictionary<string, object>? Options { get; init; }
}

/// <summary>
/// Asset source location in ROM
/// </summary>
public record AssetSource
{
	[JsonPropertyName("offset")]
	public string Offset { get; init; } = "0x0";

	[JsonPropertyName("length")]
	public string? Length { get; init; }

	[JsonPropertyName("bank")]
	public int? Bank { get; init; }

	/// <summary>
	/// Parse offset as integer
	/// </summary>
	public int GetOffset() => ParseHex(Offset);

	/// <summary>
	/// Parse length as integer
	/// </summary>
	public int? GetLength() => Length != null ? ParseHex(Length) : null;

	private static int ParseHex(string value)
	{
		if (value.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
			return Convert.ToInt32(value[2..], 16);
		if (value.StartsWith("$"))
			return Convert.ToInt32(value[1..], 16);
		return int.TryParse(value, out var result) ? result : 0;
	}
}

/// <summary>
/// Target platform
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum Platform
{
	Unknown,
	Nes,
	Snes,
	Genesis,
	Gb,
	Gbc,
	Gba
}

/// <summary>
/// Assembler type
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum Assembler
{
	Unknown,
	Ca65,
	Asar,
	Asm68k,
	Rgbds,
	DevkitArm
}

/// <summary>
/// Asset type
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum AssetType
{
	Graphics,
	Palette,
	Tilemap,
	Data,
	Text,
	Audio
}

/// <summary>
/// Color format
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum ColorFormat
{
	Rgb24,
	Bgr15,
	Bgr9,
	Indexed
}

/// <summary>
/// Compression algorithm
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
public enum CompressionAlgorithm
{
	None,
	Lzss,
	Rle,
	Huffman,
	Custom
}
