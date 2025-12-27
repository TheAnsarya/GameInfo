namespace DarkReposEditor.Core.Interfaces;

/// <summary>
/// Service for CHR/graphics tile editing operations.
/// </summary>
public interface IChrEditorService
{
	/// <summary>
	/// Decode tiles from raw byte data.
	/// </summary>
	Tile[] DecodeTiles(byte[] data, TileFormat format, int offset = 0, int count = -1);

	/// <summary>
	/// Encode tiles back to raw byte data.
	/// </summary>
	byte[] EncodeTiles(Tile[] tiles, TileFormat format);

	/// <summary>
	/// Get a single tile from data.
	/// </summary>
	Tile GetTile(byte[] data, TileFormat format, int index);

	/// <summary>
	/// Set a single tile in data.
	/// </summary>
	void SetTile(byte[] data, TileFormat format, int index, Tile tile);

	/// <summary>
	/// Apply a palette to a tile to get actual colors.
	/// </summary>
	Color[] ApplyPalette(Tile tile, Palette palette);

	/// <summary>
	/// Render tiles to an RGBA image buffer.
	/// </summary>
	byte[] RenderToImage(Tile[] tiles, Palette palette, int tilesPerRow, int scale = 1);

	/// <summary>
	/// Export tiles to PNG format.
	/// </summary>
	byte[] ExportToPng(Tile[] tiles, Palette palette, int tilesPerRow, int scale = 1);

	/// <summary>
	/// Import tiles from an image buffer.
	/// </summary>
	Tile[] ImportFromImage(byte[] imageData, int width, int height, TileFormat format, Palette palette);

	/// <summary>
	/// Get the bytes per tile for a format.
	/// </summary>
	int GetBytesPerTile(TileFormat format);

	/// <summary>
	/// Get default palette for a platform.
	/// </summary>
	Palette GetDefaultPalette(TilePlatform platform);

	/// <summary>
	/// Create a grayscale palette with the specified bits per pixel.
	/// </summary>
	Palette CreateGrayscalePalette(int bitsPerPixel);
}

/// <summary>
/// Represents a single 8x8 pixel tile.
/// </summary>
public class Tile
{
	/// <summary>
	/// Pixel data as palette indices (0-based). 8x8 = 64 pixels.
	/// Row-major order: [y * 8 + x]
	/// </summary>
	public byte[] Pixels { get; }

	/// <summary>
	/// Width of the tile in pixels.
	/// </summary>
	public int Width { get; }

	/// <summary>
	/// Height of the tile in pixels.
	/// </summary>
	public int Height { get; }

	public Tile(int width = 8, int height = 8)
	{
		Width = width;
		Height = height;
		Pixels = new byte[width * height];
	}

	public Tile(byte[] pixels, int width = 8, int height = 8)
	{
		Width = width;
		Height = height;
		if (pixels.Length != width * height)
			throw new ArgumentException($"Pixels array must be {width * height} bytes", nameof(pixels));
		Pixels = pixels;
	}

	/// <summary>
	/// Get pixel value at coordinates.
	/// </summary>
	public byte GetPixel(int x, int y)
	{
		if (x < 0 || x >= Width || y < 0 || y >= Height)
			throw new ArgumentOutOfRangeException();
		return Pixels[y * Width + x];
	}

	/// <summary>
	/// Set pixel value at coordinates.
	/// </summary>
	public void SetPixel(int x, int y, byte value)
	{
		if (x < 0 || x >= Width || y < 0 || y >= Height)
			throw new ArgumentOutOfRangeException();
		Pixels[y * Width + x] = value;
	}

	/// <summary>
	/// Create a copy of this tile.
	/// </summary>
	public Tile Clone() => new((byte[])Pixels.Clone(), Width, Height);
}

/// <summary>
/// RGBA color.
/// </summary>
public readonly record struct Color(byte R, byte G, byte B, byte A = 255)
{
	public static Color Transparent => new(0, 0, 0, 0);
	public static Color Black => new(0, 0, 0);
	public static Color White => new(255, 255, 255);

	public static Color FromRgb(int rgb) => new(
		(byte)((rgb >> 16) & 0xff),
		(byte)((rgb >> 8) & 0xff),
		(byte)(rgb & 0xff));

	public int ToRgba() => (A << 24) | (R << 16) | (G << 8) | B;
	public int ToArgb() => (A << 24) | (R << 16) | (G << 8) | B;
}

/// <summary>
/// A color palette for tiles.
/// </summary>
public class Palette
{
	/// <summary>
	/// Colors in the palette.
	/// </summary>
	public Color[] Colors { get; }

	/// <summary>
	/// Name of the palette.
	/// </summary>
	public string Name { get; set; }

	public Palette(int size, string name = "Palette")
	{
		Colors = new Color[size];
		Name = name;
	}

	public Palette(Color[] colors, string name = "Palette")
	{
		Colors = colors;
		Name = name;
	}

	public Color this[int index]
	{
		get => Colors[index];
		set => Colors[index] = value;
	}

	public int Count => Colors.Length;
}

/// <summary>
/// Tile data format.
/// </summary>
public enum TileFormat
{
	/// <summary>1 bit per pixel (2 colors)</summary>
	Bpp1 = 1,

	/// <summary>2 bits per pixel planar (4 colors) - NES, GB</summary>
	Bpp2Planar = 2,

	/// <summary>2 bits per pixel interleaved</summary>
	Bpp2Interleaved = 3,

	/// <summary>3 bits per pixel planar (8 colors) - SNES mode 0</summary>
	Bpp3Planar = 4,

	/// <summary>4 bits per pixel planar (16 colors) - SNES</summary>
	Bpp4Planar = 5,

	/// <summary>4 bits per pixel interleaved</summary>
	Bpp4Interleaved = 6,

	/// <summary>8 bits per pixel (256 colors) - SNES mode 7, GBA</summary>
	Bpp8 = 7,

	/// <summary>NES format (2bpp planar, specific layout)</summary>
	Nes = 10,

	/// <summary>SNES format (4bpp planar, specific layout)</summary>
	Snes4Bpp = 11,

	/// <summary>Game Boy format (2bpp)</summary>
	GameBoy = 12,

	/// <summary>GBA 4bpp format</summary>
	Gba4Bpp = 13,

	/// <summary>GBA 8bpp format</summary>
	Gba8Bpp = 14,

	/// <summary>Genesis/Mega Drive format (4bpp planar)</summary>
	Genesis = 15
}

/// <summary>
/// Platform for tile operations.
/// </summary>
public enum TilePlatform
{
	Nes,
	Snes,
	GameBoy,
	GameBoyColor,
	GameBoyAdvance,
	Genesis,
	MasterSystem,
	PcEngine
}
