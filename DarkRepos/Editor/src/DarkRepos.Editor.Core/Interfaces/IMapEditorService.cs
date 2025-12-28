namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for editing game maps, tilemaps, and level data.
/// Supports various map formats common in retro games.
/// </summary>
public interface IMapEditorService
{
	/// <summary>
	/// Loads a tileset from ROM data.
	/// </summary>
	Tileset LoadTileset(byte[] data, int offset, int tileCount, MapTileFormat format);

	/// <summary>
	/// Loads a map from ROM data.
	/// </summary>
	TileMap LoadMap(byte[] data, int offset, int width, int height, MapFormat format);

	/// <summary>
	/// Loads a map using metatiles (tiles of tiles).
	/// </summary>
	MetaTileMap LoadMetaTileMap(byte[] data, int offset, int width, int height, MetaTileFormat format);

	/// <summary>
	/// Exports tileset to editable format.
	/// </summary>
	byte[] ExportTileset(Tileset tileset);

	/// <summary>
	/// Exports map to editable format.
	/// </summary>
	byte[] ExportMap(TileMap map, MapFormat format);

	/// <summary>
	/// Imports tileset from editable format.
	/// </summary>
	void ImportTileset(byte[] data, Tileset tileset);

	/// <summary>
	/// Imports map from editable format.
	/// </summary>
	void ImportMap(byte[] data, TileMap map, MapFormat format);

	/// <summary>
	/// Gets MapTile at map coordinates.
	/// </summary>
	MapTile GetTile(TileMap map, int x, int y);

	/// <summary>
	/// Sets MapTile at map coordinates.
	/// </summary>
	void SetTile(TileMap map, int x, int y, MapTile MapTile);

	/// <summary>
	/// Fills a rectangular region with a MapTile.
	/// </summary>
	void FillRegion(TileMap map, int x, int y, int width, int height, MapTile MapTile);

	/// <summary>
	/// Flood fills from a point with a MapTile.
	/// </summary>
	void FloodFill(TileMap map, int x, int y, MapTile MapTile);

	/// <summary>
	/// Copies a region of the map.
	/// </summary>
	TileRegion CopyRegion(TileMap map, int x, int y, int width, int height);

	/// <summary>
	/// Pastes a region to the map.
	/// </summary>
	void PasteRegion(TileMap map, int x, int y, TileRegion region);

	/// <summary>
	/// Validates map data integrity.
	/// </summary>
	MapValidationResult ValidateMap(TileMap map, Tileset tileset);

	/// <summary>
	/// Decompresses RLE compressed map data.
	/// </summary>
	byte[] DecompressRle(byte[] data, int offset, int decompressedSize);

	/// <summary>
	/// Compresses map data with RLE.
	/// </summary>
	byte[] CompressRle(byte[] data);

	/// <summary>
	/// Decompresses LZSS compressed map data.
	/// </summary>
	byte[] DecompressLzss(byte[] data, int offset);

	/// <summary>
	/// Compresses map data with LZSS.
	/// </summary>
	byte[] CompressLzss(byte[] data);

	/// <summary>
	/// Renders the map to an image.
	/// </summary>
	byte[] RenderMapToPng(TileMap map, Tileset tileset, MapPalette MapPalette);

	/// <summary>
	/// Renders a single MapTile to an image.
	/// </summary>
	byte[] RenderTileToPng(MapTile MapTile, Tileset tileset, MapPalette MapPalette, int scale = 1);
}

/// <summary>
/// Represents a complete tileset with multiple tiles.
/// </summary>
public class Tileset
{
	/// <summary>
	/// Name or identifier for this tileset.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// ROM offset where tileset data begins.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Format of MapTile graphics.
	/// </summary>
	public MapTileFormat Format { get; set; } = MapTileFormat.Nes2Bpp;

	/// <summary>
	/// Width of each MapTile in pixels.
	/// </summary>
	public int TileWidth { get; set; } = 8;

	/// <summary>
	/// Height of each MapTile in pixels.
	/// </summary>
	public int TileHeight { get; set; } = 8;

	/// <summary>
	/// All tiles in this tileset.
	/// </summary>
	public List<TileGraphics> Tiles { get; set; } = [];

	/// <summary>
	/// Total size in bytes of the tileset data.
	/// </summary>
	public int TotalSize => Tiles.Count * GetBytesPerTile(Format, TileWidth, TileHeight);

	private static int GetBytesPerTile(MapTileFormat format, int width, int height)
	{
		return format switch
		{
			MapTileFormat.Nes2Bpp => (width * height * 2) / 8,    // 16 bytes for 8x8
			MapTileFormat.Snes4Bpp => (width * height * 4) / 8,   // 32 bytes for 8x8
			MapTileFormat.Snes8Bpp => (width * height * 8) / 8,   // 64 bytes for 8x8
			MapTileFormat.Gb2Bpp => (width * height * 2) / 8,     // 16 bytes for 8x8
			MapTileFormat.Genesis4Bpp => (width * height * 4) / 8, // 32 bytes for 8x8
			MapTileFormat.Gba4Bpp => (width * height * 4) / 8,    // 32 bytes for 8x8
			MapTileFormat.Gba8Bpp => width * height,              // 64 bytes for 8x8
			MapTileFormat.Linear1Bpp => (width * height) / 8,     // 8 bytes for 8x8
			_ => 16
		};
	}
}

/// <summary>
/// Raw graphics data for a single MapTile.
/// </summary>
public class TileGraphics
{
	/// <summary>
	/// MapTile index in the tileset.
	/// </summary>
	public int Index { get; set; }

	/// <summary>
	/// Raw pixel data (MapPalette indices).
	/// </summary>
	public byte[] PixelData { get; set; } = [];

	/// <summary>
	/// Original raw bytes from ROM.
	/// </summary>
	public byte[] RawBytes { get; set; } = [];
}

/// <summary>
/// Represents a MapTile placement in a map.
/// </summary>
public class MapTile
{
	/// <summary>
	/// Index into the tileset.
	/// </summary>
	public int TileIndex { get; set; }

	/// <summary>
	/// MapPalette index for this MapTile (for systems that support it).
	/// </summary>
	public int PaletteIndex { get; set; }

	/// <summary>
	/// Whether the MapTile is flipped horizontally.
	/// </summary>
	public bool FlipX { get; set; }

	/// <summary>
	/// Whether the MapTile is flipped vertically.
	/// </summary>
	public bool FlipY { get; set; }

	/// <summary>
	/// Priority/layer for this MapTile (for systems that support it).
	/// </summary>
	public int Priority { get; set; }

	/// <summary>
	/// Raw attribute byte from ROM.
	/// </summary>
	public byte Attributes { get; set; }
}

/// <summary>
/// A tilemap containing grid of MapTile references.
/// </summary>
public class TileMap
{
	/// <summary>
	/// Name or identifier for this map.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// ROM offset where map data begins.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Width of the map in tiles.
	/// </summary>
	public int Width { get; set; }

	/// <summary>
	/// Height of the map in tiles.
	/// </summary>
	public int Height { get; set; }

	/// <summary>
	/// Format of the map data.
	/// </summary>
	public MapFormat Format { get; set; } = MapFormat.Linear;

	/// <summary>
	/// MapTile data as 2D array.
	/// </summary>
	public MapTile[,] Tiles { get; set; } = new MapTile[0, 0];

	/// <summary>
	/// Attribute data (for NES-style systems).
	/// </summary>
	public byte[]? AttributeData { get; set; }

	/// <summary>
	/// Whether the map has been modified.
	/// </summary>
	public bool IsModified { get; set; }
}

/// <summary>
/// A metatile (MapTile made of smaller tiles).
/// </summary>
public class MetaTile
{
	/// <summary>
	/// Index of this metatile.
	/// </summary>
	public int Index { get; set; }

	/// <summary>
	/// Width in sub-tiles.
	/// </summary>
	public int Width { get; set; } = 2;

	/// <summary>
	/// Height in sub-tiles.
	/// </summary>
	public int Height { get; set; } = 2;

	/// <summary>
	/// Sub-MapTile indices that make up this metatile.
	/// </summary>
	public int[] SubTiles { get; set; } = [];

	/// <summary>
	/// Collision/behavior data for this metatile.
	/// </summary>
	public byte Collision { get; set; }

	/// <summary>
	/// Additional properties (game-specific).
	/// </summary>
	public Dictionary<string, object> Properties { get; set; } = [];
}

/// <summary>
/// A map using metatiles instead of raw tiles.
/// </summary>
public class MetaTileMap
{
	/// <summary>
	/// Name of this map.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// ROM offset.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Width in metatiles.
	/// </summary>
	public int Width { get; set; }

	/// <summary>
	/// Height in metatiles.
	/// </summary>
	public int Height { get; set; }

	/// <summary>
	/// Metatile indices.
	/// </summary>
	public int[,] MetaTiles { get; set; } = new int[0, 0];

	/// <summary>
	/// Metatile definitions.
	/// </summary>
	public List<MetaTile> MetaTileSet { get; set; } = [];
}

/// <summary>
/// A copied region of tiles.
/// </summary>
public class TileRegion
{
	/// <summary>
	/// Width of the region.
	/// </summary>
	public int Width { get; set; }

	/// <summary>
	/// Height of the region.
	/// </summary>
	public int Height { get; set; }

	/// <summary>
	/// MapTile data.
	/// </summary>
	public MapTile[,] Tiles { get; set; } = new MapTile[0, 0];
}

/// <summary>
/// Color MapPalette for rendering.
/// </summary>
public class MapPalette
{
	/// <summary>
	/// MapPalette name.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Number of colors in the MapPalette.
	/// </summary>
	public int ColorCount { get; set; } = 16;

	/// <summary>
	/// Colors as ARGB values.
	/// </summary>
	public uint[] Colors { get; set; } = [];

	/// <summary>
	/// Whether first color is transparent.
	/// </summary>
	public bool TransparentIndex0 { get; set; } = true;
}

/// <summary>
/// Result of map validation.
/// </summary>
public class MapValidationResult
{
	/// <summary>
	/// Whether the map is valid.
	/// </summary>
	public bool IsValid { get; set; }

	/// <summary>
	/// Validation errors.
	/// </summary>
	public List<string> Errors { get; set; } = [];

	/// <summary>
	/// Validation warnings.
	/// </summary>
	public List<string> Warnings { get; set; } = [];

	/// <summary>
	/// Number of unique tiles used.
	/// </summary>
	public int UniqueTilesUsed { get; set; }

	/// <summary>
	/// Highest MapTile index referenced.
	/// </summary>
	public int MaxTileIndex { get; set; }
}

/// <summary>
/// Format of MapTile graphics data.
/// </summary>
public enum MapTileFormat
{
	/// <summary>
	/// NES 2-bit planar (CHR format).
	/// </summary>
	Nes2Bpp,

	/// <summary>
	/// SNES 4-bit planar.
	/// </summary>
	Snes4Bpp,

	/// <summary>
	/// SNES 8-bit mode 7.
	/// </summary>
	Snes8Bpp,

	/// <summary>
	/// Game Boy 2-bit planar.
	/// </summary>
	Gb2Bpp,

	/// <summary>
	/// Genesis/Mega Drive 4-bit planar.
	/// </summary>
	Genesis4Bpp,

	/// <summary>
	/// GBA 4-bit linear.
	/// </summary>
	Gba4Bpp,

	/// <summary>
	/// GBA 8-bit linear.
	/// </summary>
	Gba8Bpp,

	/// <summary>
	/// 1-bit monochrome.
	/// </summary>
	Linear1Bpp
}

/// <summary>
/// Format of map data layout.
/// </summary>
public enum MapFormat
{
	/// <summary>
	/// Linear row-by-row layout.
	/// </summary>
	Linear,

	/// <summary>
	/// NES nametable format (32x30 with attributes).
	/// </summary>
	NesNametable,

	/// <summary>
	/// SNES tilemap format with flip bits.
	/// </summary>
	SnesTilemap,

	/// <summary>
	/// Game Boy background map.
	/// </summary>
	GbBackground,

	/// <summary>
	/// Genesis plane format.
	/// </summary>
	GenesisPlane,

	/// <summary>
	/// GBA tilemap format.
	/// </summary>
	GbaTilemap,

	/// <summary>
	/// Column-by-column layout.
	/// </summary>
	ColumnMajor,

	/// <summary>
	/// Block-based layout (e.g., 2x2 blocks).
	/// </summary>
	Block2x2,

	/// <summary>
	/// RLE compressed.
	/// </summary>
	CompressedRle,

	/// <summary>
	/// LZSS compressed.
	/// </summary>
	CompressedLzss
}

/// <summary>
/// Format of metatile definitions.
/// </summary>
public enum MetaTileFormat
{
	/// <summary>
	/// Simple 2x2 metatiles.
	/// </summary>
	Simple2x2,

	/// <summary>
	/// 2x2 with collision byte.
	/// </summary>
	WithCollision,

	/// <summary>
	/// 4x4 metatiles.
	/// </summary>
	Block4x4,

	/// <summary>
	/// Variable size metatiles.
	/// </summary>
	Variable
}
