namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// DQ3r graphics analysis and extraction.
/// Handles character sprites, monster graphics, tilesets, and UI elements.
/// </summary>
public class DQ3rGraphicsAnalyzer {
	private readonly byte[] _romData;
	private readonly int _headerOffset;

	/// <summary>
	/// Known graphics locations from research.
	/// </summary>
	public static class GraphicsLocations {
		// Bank $C1 - Dialog font data
		public const int DialogFontStart = 0x010ed3;
		public const int DialogFontEnd = 0x0151a9;
		public const int DialogFontBank = 0xc1;

		// Bank $C2-$C3 - Common graphics
		public const int CommonGraphicsStart = 0x020000;
		public const int CommonGraphicsEnd = 0x040000;

		// Banks $C4-$CF - Character/battle sprites
		public const int BattleSpriteStart = 0x040000;
		public const int BattleSpriteEnd = 0x100000;

		// Banks $D0-$DF - Field graphics/tilesets
		public const int FieldGraphicsStart = 0x100000;
		public const int FieldGraphicsEnd = 0x200000;

		// Banks $E0-$EF - Monster graphics
		public const int MonsterGraphicsStart = 0x200000;
		public const int MonsterGraphicsEnd = 0x300000;

		// Banks $F0-$FB - Additional assets
		public const int AdditionalAssetsStart = 0x300000;
		public const int AdditionalAssetsEnd = 0x3c0000;
	}

	public DQ3rGraphicsAnalyzer(byte[] romData) {
		_romData = romData;
		_headerOffset = romData.Length % 1024 == 512 ? 512 : 0;
	}

	/// <summary>
	/// Extract dialog font tiles.
	/// </summary>
	/// <returns>List of decoded tile pixel data.</returns>
	public List<GraphicsTile> ExtractDialogFont() {
		var tiles = new List<GraphicsTile>();

		int start = GraphicsLocations.DialogFontStart + _headerOffset;
		int end = Math.Min(GraphicsLocations.DialogFontEnd + _headerOffset, _romData.Length);
		int size = end - start;

		if (size <= 0) return tiles;

		// Dialog font uses 2bpp SNES format
		const int tileSize = 16; // 2bpp = 16 bytes per 8x8 tile
		int tileCount = size / tileSize;

		for (int i = 0; i < tileCount; i++) {
			int offset = start + (i * tileSize);
			if (offset + tileSize > _romData.Length) break;

			var tileData = new byte[tileSize];
			Array.Copy(_romData, offset, tileData, 0, tileSize);

			// Decode 2bpp tile
			var pixels = DecodeSnes2bpp(tileData);

			tiles.Add(new GraphicsTile {
				Index = i,
				FileOffset = offset - _headerOffset,
				SnesAddress = DQ3rAddressTranslator.FormatSnesAddress(
					DQ3rAddressTranslator.FileToSnesAddress(offset - _headerOffset)),
				Width = 8,
				Height = 8,
				BitsPerPixel = 2,
				Pixels = pixels
			});
		}

		return tiles;
	}

	/// <summary>
	/// Extract 4bpp sprite tiles from a region.
	/// </summary>
	/// <param name="fileStart">Start file offset.</param>
	/// <param name="fileEnd">End file offset.</param>
	/// <returns>List of decoded tiles.</returns>
	public List<GraphicsTile> Extract4bppTiles(int fileStart, int fileEnd) {
		var tiles = new List<GraphicsTile>();

		int start = fileStart + _headerOffset;
		int end = Math.Min(fileEnd + _headerOffset, _romData.Length);
		int size = end - start;

		if (size <= 0) return tiles;

		const int tileSize = 32; // 4bpp = 32 bytes per 8x8 tile
		int tileCount = size / tileSize;

		for (int i = 0; i < tileCount; i++) {
			int offset = start + (i * tileSize);
			if (offset + tileSize > _romData.Length) break;

			var tileData = new byte[tileSize];
			Array.Copy(_romData, offset, tileData, 0, tileSize);

			// Decode 4bpp tile
			var pixels = DecodeSnes4bpp(tileData);

			tiles.Add(new GraphicsTile {
				Index = i,
				FileOffset = offset - _headerOffset,
				SnesAddress = DQ3rAddressTranslator.FormatSnesAddress(
					DQ3rAddressTranslator.FileToSnesAddress(offset - _headerOffset)),
				Width = 8,
				Height = 8,
				BitsPerPixel = 4,
				Pixels = pixels
			});
		}

		return tiles;
	}

	/// <summary>
	/// Extract character/battle sprites.
	/// </summary>
	public List<GraphicsTile> ExtractBattleSprites() =>
		Extract4bppTiles(GraphicsLocations.BattleSpriteStart, GraphicsLocations.BattleSpriteEnd);

	/// <summary>
	/// Extract monster graphics.
	/// </summary>
	public List<GraphicsTile> ExtractMonsterGraphics() =>
		Extract4bppTiles(GraphicsLocations.MonsterGraphicsStart, GraphicsLocations.MonsterGraphicsEnd);

	/// <summary>
	/// Extract field tilesets.
	/// </summary>
	public List<GraphicsTile> ExtractFieldTilesets() =>
		Extract4bppTiles(GraphicsLocations.FieldGraphicsStart, GraphicsLocations.FieldGraphicsEnd);

	/// <summary>
	/// Detect graphics regions in ROM based on entropy and patterns.
	/// </summary>
	/// <returns>List of detected graphics regions.</returns>
	public List<DetectedGraphicsRegion> DetectGraphicsRegions() {
		var regions = new List<DetectedGraphicsRegion>();

		// Scan by bank for graphics characteristics
		for (int bank = 0xc0; bank <= 0xff; bank++) {
			int bankStart = ((bank - 0xc0) * 0x10000) + _headerOffset;
			int bankEnd = Math.Min(bankStart + 0x10000, _romData.Length);

			if (bankStart >= _romData.Length) break;

			var bankData = _romData.AsSpan(bankStart, bankEnd - bankStart);
			var analysis = AnalyzeGraphicsCharacteristics(bankData);

			if (analysis.LikelyGraphics) {
				regions.Add(new DetectedGraphicsRegion {
					Bank = bank,
					FileStart = bankStart - _headerOffset,
					FileEnd = bankEnd - _headerOffset,
					Format = analysis.DetectedFormat,
					Confidence = analysis.Confidence,
					TileCount = analysis.EstimatedTileCount
				});
			}
		}

		return regions;
	}

	/// <summary>
	/// Analyze byte data for graphics characteristics.
	/// </summary>
	private GraphicsAnalysisResult AnalyzeGraphicsCharacteristics(ReadOnlySpan<byte> data) {
		var result = new GraphicsAnalysisResult();

		if (data.Length < 32) return result;

		// Calculate entropy
		var frequencies = new int[256];
		foreach (byte b in data) {
			frequencies[b]++;
		}

		double entropy = 0;
		foreach (int count in frequencies) {
			if (count > 0) {
				double probability = (double)count / data.Length;
				entropy -= probability * Math.Log2(probability);
			}
		}

		// Graphics typically have entropy between 2.0 and 6.0
		// (not too random like compressed data, not too uniform like padding)
		result.Entropy = entropy;

		if (entropy > 2.0 && entropy < 6.0) {
			result.LikelyGraphics = true;
			result.Confidence = 1.0 - Math.Abs(entropy - 4.0) / 4.0;
		}

		// Check for tile patterns
		// 4bpp tiles often have low-value bytes (palette indices 0-15)
		int lowValueBytes = 0;
		foreach (byte b in data) {
			if ((b & 0xf0) == 0 || (b & 0x0f) == 0) lowValueBytes++;
		}

		if (lowValueBytes > data.Length * 0.3) {
			result.Confidence += 0.2;
			result.DetectedFormat = GraphicsFormat.Snes4bpp;
			result.EstimatedTileCount = data.Length / 32;
		}

		// Check for 2bpp patterns (more zeros in high bits)
		int twoBytePatterns = 0;
		for (int i = 0; i < data.Length - 16; i += 16) {
			bool could2bpp = true;
			for (int j = 0; j < 8 && could2bpp; j++) {
				// In 2bpp, planes are interleaved
				// Check if the pattern looks like 2bpp planar
				could2bpp = data[i + j] != 0 || data[i + j + 8] != 0;
			}
			if (could2bpp) twoBytePatterns++;
		}

		if (twoBytePatterns > (data.Length / 16) * 0.5 && result.DetectedFormat == GraphicsFormat.Unknown) {
			result.DetectedFormat = GraphicsFormat.Snes2bpp;
			result.EstimatedTileCount = data.Length / 16;
		}

		result.LikelyGraphics = result.Confidence > 0.3;
		return result;
	}

	/// <summary>
	/// Decode SNES 2bpp tile to pixel indices.
	/// </summary>
	private static byte[] DecodeSnes2bpp(byte[] data) {
		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = data[row * 2];
			byte plane1 = data[row * 2 + 1];

			for (int col = 7; col >= 0; col--) {
				int bit0 = (plane0 >> col) & 1;
				int bit1 = (plane1 >> col) & 1;
				pixels[pixelIndex++] = (byte)((bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Decode SNES 4bpp tile to pixel indices.
	/// </summary>
	private static byte[] DecodeSnes4bpp(byte[] data) {
		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			// SNES 4bpp: bitplanes 0,1 in first 16 bytes, bitplanes 2,3 in second 16 bytes
			byte plane0 = data[row * 2];
			byte plane1 = data[row * 2 + 1];
			byte plane2 = data[16 + row * 2];
			byte plane3 = data[16 + row * 2 + 1];

			for (int col = 7; col >= 0; col--) {
				int bit0 = (plane0 >> col) & 1;
				int bit1 = (plane1 >> col) & 1;
				int bit2 = (plane2 >> col) & 1;
				int bit3 = (plane3 >> col) & 1;
				pixels[pixelIndex++] = (byte)((bit3 << 3) | (bit2 << 2) | (bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Get graphics extraction summary.
	/// </summary>
	public DQ3rGraphicsSummary GetSummary() {
		var fontTiles = ExtractDialogFont();
		var regions = DetectGraphicsRegions();

		return new DQ3rGraphicsSummary {
			DialogFontTiles = fontTiles.Count,
			DetectedRegions = regions.Count,
			Total4bppTileEstimate = regions.Sum(r => r.TileCount),
			GraphicsRegions = regions
		};
	}
}

/// <summary>
/// Represents a decoded graphics tile.
/// </summary>
public class GraphicsTile {
	public int Index { get; init; }
	public int FileOffset { get; init; }
	public string SnesAddress { get; init; } = string.Empty;
	public int Width { get; init; } = 8;
	public int Height { get; init; } = 8;
	public int BitsPerPixel { get; init; }
	public byte[] Pixels { get; init; } = [];
}

/// <summary>
/// Detected graphics region.
/// </summary>
public class DetectedGraphicsRegion {
	public int Bank { get; init; }
	public int FileStart { get; init; }
	public int FileEnd { get; init; }
	public GraphicsFormat Format { get; init; }
	public double Confidence { get; init; }
	public int TileCount { get; init; }

	public int Size => FileEnd - FileStart;
	public string BankHex => $"${Bank:x2}";
}

/// <summary>
/// Graphics format types.
/// </summary>
public enum GraphicsFormat {
	Unknown,
	Snes2bpp,
	Snes4bpp,
	Snes8bpp,
	SnesMode7,
	Compressed
}

/// <summary>
/// Graphics analysis result.
/// </summary>
internal class GraphicsAnalysisResult {
	public bool LikelyGraphics { get; set; }
	public double Entropy { get; set; }
	public double Confidence { get; set; }
	public GraphicsFormat DetectedFormat { get; set; } = GraphicsFormat.Unknown;
	public int EstimatedTileCount { get; set; }
}

/// <summary>
/// DQ3r graphics summary.
/// </summary>
public class DQ3rGraphicsSummary {
	public int DialogFontTiles { get; init; }
	public int DetectedRegions { get; init; }
	public int Total4bppTileEstimate { get; init; }
	public List<DetectedGraphicsRegion> GraphicsRegions { get; init; } = [];

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("=== DQ3r Graphics Summary ===");
		sb.AppendLine($"Dialog Font Tiles: {DialogFontTiles}");
		sb.AppendLine($"Detected Graphics Regions: {DetectedRegions}");
		sb.AppendLine($"Estimated 4bpp Tiles: {Total4bppTileEstimate:N0}");
		sb.AppendLine();
		sb.AppendLine("Regions:");
		foreach (var region in GraphicsRegions.Take(10)) {
			sb.AppendLine($"  Bank {region.BankHex}: {region.Format}, {region.TileCount} tiles, {region.Confidence:P0} confidence");
		}
		if (GraphicsRegions.Count > 10) {
			sb.AppendLine($"  ... and {GraphicsRegions.Count - 10} more regions");
		}
		return sb.ToString();
	}
}
