namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Represents a single tile in CHR data.
/// </summary>
public record ChrTile(int Index, byte[] PixelData, int Width = 8, int Height = 8);

/// <summary>
/// Represents a color palette.
/// </summary>
public record Palette(int Index, uint[] Colors);

/// <summary>
/// Interface for CHR (character/tile) editor services.
/// </summary>
public interface IChrEditorService
{
	/// <summary>Total number of tiles in the loaded CHR data.</summary>
	int TileCount { get; }

	/// <summary>Bits per pixel (2 for NES, 4 for SNES).</summary>
	int BitsPerPixel { get; }

	/// <summary>Tile width in pixels (usually 8).</summary>
	int TileWidth { get; }

	/// <summary>Tile height in pixels (usually 8).</summary>
	int TileHeight { get; }

	/// <summary>Gets a tile by index.</summary>
	ChrTile GetTile(int index);

	/// <summary>Sets a tile at the specified index.</summary>
	void SetTile(int index, ChrTile tile);

	/// <summary>Gets the raw CHR data for a range of tiles.</summary>
	byte[] GetRawData(int startTile, int tileCount);

	/// <summary>Sets raw CHR data starting at a tile index.</summary>
	void SetRawData(int startTile, ReadOnlySpan<byte> data);

	/// <summary>Exports a tile as a PNG image.</summary>
	byte[] ExportTileToPng(int index, Palette palette);

	/// <summary>Exports multiple tiles as a PNG spritesheet.</summary>
	byte[] ExportTilesToPng(int startIndex, int width, int height, Palette palette);

	/// <summary>Imports a PNG image as tile data.</summary>
	void ImportTileFromPng(int index, byte[] pngData, Palette palette);

	/// <summary>Gets all available palettes.</summary>
	IReadOnlyList<Palette> Palettes { get; }

	/// <summary>Sets a palette.</summary>
	void SetPalette(int index, Palette palette);

	/// <summary>Undoes the last edit.</summary>
	void Undo();

	/// <summary>Redoes the last undone edit.</summary>
	void Redo();

	/// <summary>Whether an undo operation is available.</summary>
	bool CanUndo { get; }

	/// <summary>Whether a redo operation is available.</summary>
	bool CanRedo { get; }

	/// <summary>Fired when tile data changes.</summary>
	event EventHandler<int>? TileChanged;

	/// <summary>Fired when a palette changes.</summary>
	event EventHandler<int>? PaletteChanged;
}
