namespace GameInfoTools.Core.Project;

/// <summary>
/// Collection of extracted assets from a ROM.
/// </summary>
public class AssetCollection {
	/// <summary>Graphics assets (tiles, sprites, backgrounds).</summary>
	public List<ExtractedAsset> Graphics { get; } = [];

	/// <summary>Text assets (dialog, menus, item names).</summary>
	public List<ExtractedAsset> Text { get; } = [];

	/// <summary>Data tables (monster stats, item properties, etc.).</summary>
	public List<ExtractedAsset> Data { get; } = [];

	/// <summary>Map data (tilemaps, collision, events).</summary>
	public List<ExtractedAsset> Maps { get; } = [];

	/// <summary>Audio data (music, sound effects).</summary>
	public List<ExtractedAsset> Audio { get; } = [];

	/// <summary>Source code files (disassembly, includes).</summary>
	public List<ExtractedAsset> Source { get; } = [];

	/// <summary>Symbol files (labels, addresses).</summary>
	public List<ExtractedAsset> Symbols { get; } = [];

	/// <summary>Analysis files (cross-references, patterns).</summary>
	public List<ExtractedAsset> Analysis { get; } = [];

	/// <summary>Gets all assets as a flat list.</summary>
	public IEnumerable<ExtractedAsset> All =>
		Graphics.Concat(Text).Concat(Data).Concat(Maps)
			.Concat(Audio).Concat(Source).Concat(Symbols).Concat(Analysis);

	/// <summary>Gets assets by type.</summary>
	public IEnumerable<ExtractedAsset> GetByType(string type) => type.ToLowerInvariant() switch {
		"graphics" => Graphics,
		"text" => Text,
		"data" => Data,
		"maps" or "map" => Maps,
		"audio" => Audio,
		"source" => Source,
		"symbols" => Symbols,
		"analysis" => Analysis,
		_ => []
	};

	/// <summary>Adds an asset to the appropriate collection.</summary>
	public void Add(ExtractedAsset asset) {
		var collection = asset.Type.ToLowerInvariant() switch {
			"graphics" => Graphics,
			"text" => Text,
			"data" => Data,
			"maps" or "map" => Maps,
			"audio" => Audio,
			"source" => Source,
			"symbols" => Symbols,
			"analysis" => Analysis,
			_ => throw new ArgumentException($"Unknown asset type: {asset.Type}")
		};

		collection.Add(asset);
	}
}

/// <summary>
/// A single extracted asset.
/// </summary>
public class ExtractedAsset {
	/// <summary>Relative path for the asset in the project.</summary>
	public required string Path { get; init; }

	/// <summary>Asset type category.</summary>
	public required string Type { get; init; }

	/// <summary>Display name for the asset.</summary>
	public required string Name { get; init; }

	/// <summary>The extracted data.</summary>
	public required byte[] Data { get; init; }

	/// <summary>Original ROM offset this was extracted from.</summary>
	public int? RomOffset { get; init; }

	/// <summary>Original length in the ROM.</summary>
	public int? RomLength { get; init; }

	/// <summary>Format of the extracted data (e.g., "png", "json", "asm").</summary>
	public string Format { get; init; } = "bin";

	/// <summary>Additional metadata about the asset.</summary>
	public Dictionary<string, object> Metadata { get; init; } = [];
}

/// <summary>
/// Progress information for packing operations.
/// </summary>
public record PackProgress(
	string CurrentOperation,
	int CurrentItem,
	int TotalItems,
	double Percentage
);

/// <summary>
/// Interface for game-specific asset extraction.
/// </summary>
public interface IAssetExtractor {
	/// <summary>Unique identifier for this extractor's game.</summary>
	string GameId { get; }

	/// <summary>Display name of the game.</summary>
	string GameName { get; }

	/// <summary>Supported file extensions for ROM files.</summary>
	IReadOnlyList<string> SupportedExtensions { get; }

	/// <summary>Asset types this extractor can handle.</summary>
	IReadOnlyList<string> SupportedAssetTypes { get; }

	/// <summary>
	/// Checks if this extractor can handle the given ROM.
	/// </summary>
	/// <param name="romData">ROM data to check.</param>
	/// <returns>True if this extractor can handle the ROM.</returns>
	Task<bool> CanExtractAsync(byte[] romData);

	/// <summary>
	/// Extracts all assets from a ROM.
	/// </summary>
	/// <param name="romData">ROM data to extract from.</param>
	/// <param name="assetTypes">Specific asset types to extract, or null for all.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Collection of extracted assets.</returns>
	Task<AssetCollection> ExtractAsync(
		byte[] romData,
		IEnumerable<string>? assetTypes = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Packs assets back into ROM format.
	/// </summary>
	/// <param name="assets">Assets to pack.</param>
	/// <param name="baseRom">Optional base ROM to apply changes to.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Packed ROM data.</returns>
	Task<byte[]> PackAsync(
		AssetCollection assets,
		byte[]? baseRom = null,
		IProgress<PackProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Verifies a ROM matches expected checksums.
	/// </summary>
	/// <param name="romData">ROM data to verify.</param>
	/// <returns>Verification result.</returns>
	Task<RomVerificationResult> VerifyRomAsync(byte[] romData);

	/// <summary>
	/// Gets the game definition for this extractor.
	/// </summary>
	GameDefinition GetGameDefinition();
}

/// <summary>
/// Registry of available asset extractors.
/// </summary>
public interface IAssetExtractorRegistry {
	/// <summary>All registered extractors.</summary>
	IReadOnlyList<IAssetExtractor> Extractors { get; }

	/// <summary>Gets an extractor by game ID.</summary>
	IAssetExtractor? GetExtractor(string gameId);

	/// <summary>Gets all game definitions.</summary>
	IReadOnlyList<GameDefinition> GetGameDefinitions();

	/// <summary>Tries to detect the appropriate extractor for a ROM.</summary>
	Task<IAssetExtractor?> DetectExtractorAsync(byte[] romData);

	/// <summary>Registers a new extractor.</summary>
	void Register(IAssetExtractor extractor);
}
