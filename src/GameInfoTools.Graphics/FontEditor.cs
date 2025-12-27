using System.Text;
using System.Text.Json;

namespace GameInfoTools.Graphics;

/// <summary>
/// Font editor for retro game bitmap fonts.
/// Supports NES, SNES, Game Boy, and other tile-based font formats.
/// </summary>
/// <remarks>
/// C# equivalent of: tools/graphics/font_editor.py
/// </remarks>
public class FontEditor {
	/// <summary>
	/// Bit depth for font tiles.
	/// </summary>
	public enum BitDepth {
		/// <summary>1 bit per pixel (2 colors).</summary>
		OneBpp = 1,
		/// <summary>2 bits per pixel (4 colors).</summary>
		TwoBpp = 2,
		/// <summary>4 bits per pixel (16 colors).</summary>
		FourBpp = 4,
		/// <summary>8 bits per pixel (256 colors).</summary>
		EightBpp = 8
	}

	/// <summary>
	/// Font tile format for different platforms.
	/// </summary>
	public enum TileFormat {
		/// <summary>NES 2bpp planar format.</summary>
		Nes2bpp,
		/// <summary>SNES 2bpp planar format.</summary>
		Snes2bpp,
		/// <summary>SNES 4bpp planar format.</summary>
		Snes4bpp,
		/// <summary>Game Boy 2bpp format.</summary>
		GameBoy2bpp,
		/// <summary>GBA 4bpp linear format.</summary>
		Gba4bpp,
		/// <summary>1bpp monochrome format.</summary>
		Mono1bpp,
		/// <summary>Linear 8bpp format.</summary>
		Linear8bpp
	}

	/// <summary>
	/// Represents a single character glyph in the font.
	/// </summary>
	public record Glyph {
		/// <summary>Character code (index in font table).</summary>
		public int CharCode { get; init; }

		/// <summary>Character this glyph represents (if mapped).</summary>
		public char? Character { get; init; }

		/// <summary>Glyph width in pixels.</summary>
		public int Width { get; init; }

		/// <summary>Glyph height in pixels.</summary>
		public int Height { get; init; }

		/// <summary>Pixel data as 2D array of color indices.</summary>
		public byte[,] Pixels { get; init; } = new byte[8, 8];

		/// <summary>Horizontal advance for variable-width fonts.</summary>
		public int Advance { get; init; }

		/// <summary>X offset from origin.</summary>
		public int OffsetX { get; init; }

		/// <summary>Y offset from baseline.</summary>
		public int OffsetY { get; init; }

		/// <summary>Create a new glyph with default 8x8 size.</summary>
		public Glyph() {
			Width = 8;
			Height = 8;
			Advance = 8;
		}

		/// <summary>Create a glyph with specified dimensions.</summary>
		public Glyph(int width, int height) {
			Width = width;
			Height = height;
			Advance = width;
			Pixels = new byte[height, width];
		}
	}

	/// <summary>
	/// Variable-width font metrics.
	/// </summary>
	public record VwfMetrics {
		/// <summary>Per-character widths (index = char code).</summary>
		public byte[] CharWidths { get; init; } = [];

		/// <summary>Default character spacing.</summary>
		public int DefaultSpacing { get; init; } = 1;

		/// <summary>Line height.</summary>
		public int LineHeight { get; init; } = 8;

		/// <summary>Space character width.</summary>
		public int SpaceWidth { get; init; } = 4;
	}

	/// <summary>
	/// Font configuration.
	/// </summary>
	public record FontConfig {
		/// <summary>Font name/identifier.</summary>
		public string Name { get; init; } = "";

		/// <summary>Tile format.</summary>
		public TileFormat Format { get; init; } = TileFormat.Nes2bpp;

		/// <summary>Tile width in pixels.</summary>
		public int TileWidth { get; init; } = 8;

		/// <summary>Tile height in pixels.</summary>
		public int TileHeight { get; init; } = 8;

		/// <summary>Number of characters in font.</summary>
		public int CharCount { get; init; } = 256;

		/// <summary>First character code.</summary>
		public int FirstChar { get; init; } = 0;

		/// <summary>Is variable-width font.</summary>
		public bool IsVariableWidth { get; init; } = false;

		/// <summary>VWF metrics (if variable-width).</summary>
		public VwfMetrics? VwfMetrics { get; init; }

		/// <summary>Character mapping table (char code -> character).</summary>
		public Dictionary<int, char> CharMap { get; init; } = [];
	}

	/// <summary>
	/// Font editing result.
	/// </summary>
	public record FontEditResult {
		/// <summary>Whether operation succeeded.</summary>
		public bool Success { get; init; }

		/// <summary>Modified glyph count.</summary>
		public int ModifiedCount { get; init; }

		/// <summary>Error messages.</summary>
		public List<string> Errors { get; init; } = [];
	}

	private readonly List<Glyph> _glyphs;

	/// <summary>
	/// Current font configuration.
	/// </summary>
	public FontConfig Config { get; private set; }

	/// <summary>
	/// Number of glyphs in the font.
	/// </summary>
	public int GlyphCount => _glyphs.Count;

	/// <summary>
	/// Create a new empty font editor.
	/// </summary>
	public FontEditor() {
		_glyphs = [];
		Config = new FontConfig();
	}

	/// <summary>
	/// Create a font editor with specified configuration.
	/// </summary>
	/// <param name="config">Font configuration.</param>
	public FontEditor(FontConfig config) {
		Config = config;
		_glyphs = new List<Glyph>(config.CharCount);

		// Initialize empty glyphs
		for (int i = 0; i < config.CharCount; i++) {
			_glyphs.Add(new Glyph(config.TileWidth, config.TileHeight) {
				CharCode = config.FirstChar + i,
				Character = config.CharMap.TryGetValue(config.FirstChar + i, out var c) ? c : null
			});
		}
	}

	/// <summary>
	/// Load font from raw tile data.
	/// </summary>
	/// <param name="data">Raw tile data.</param>
	/// <param name="format">Tile format.</param>
	/// <param name="tileWidth">Tile width.</param>
	/// <param name="tileHeight">Tile height.</param>
	/// <returns>Number of glyphs loaded.</returns>
	public int LoadFromData(byte[] data, TileFormat format, int tileWidth = 8, int tileHeight = 8) {
		_glyphs.Clear();
		int bytesPerTile = CalculateBytesPerTile(format, tileWidth, tileHeight);

		if (bytesPerTile == 0) return 0;

		int tileCount = data.Length / bytesPerTile;
		Config = Config with {
			Format = format,
			TileWidth = tileWidth,
			TileHeight = tileHeight,
			CharCount = tileCount
		};

		for (int i = 0; i < tileCount; i++) {
			int offset = i * bytesPerTile;
			var tileData = data[offset..(offset + bytesPerTile)];
			var pixels = DecodeTile(tileData, format, tileWidth, tileHeight);

			_glyphs.Add(new Glyph(tileWidth, tileHeight) {
				CharCode = i,
				Pixels = pixels,
				Advance = tileWidth
			});
		}

		return tileCount;
	}

	/// <summary>
	/// Export font to raw tile data.
	/// </summary>
	/// <param name="format">Output tile format (null = use current).</param>
	/// <returns>Encoded tile data.</returns>
	public byte[] ExportToData(TileFormat? format = null) {
		var outFormat = format ?? Config.Format;
		int bytesPerTile = CalculateBytesPerTile(outFormat, Config.TileWidth, Config.TileHeight);
		var result = new byte[_glyphs.Count * bytesPerTile];

		for (int i = 0; i < _glyphs.Count; i++) {
			var encoded = EncodeTile(_glyphs[i].Pixels, outFormat);
			Array.Copy(encoded, 0, result, i * bytesPerTile, bytesPerTile);
		}

		return result;
	}

	/// <summary>
	/// Get a glyph by character code.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <returns>Glyph or null if not found.</returns>
	public Glyph? GetGlyph(int charCode) {
		int index = charCode - Config.FirstChar;
		return index >= 0 && index < _glyphs.Count ? _glyphs[index] : null;
	}

	/// <summary>
	/// Set a glyph by character code.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <param name="glyph">New glyph data.</param>
	/// <returns>True if successful.</returns>
	public bool SetGlyph(int charCode, Glyph glyph) {
		int index = charCode - Config.FirstChar;
		if (index < 0 || index >= _glyphs.Count) return false;

		_glyphs[index] = glyph with { CharCode = charCode };
		return true;
	}

	/// <summary>
	/// Set a pixel in a glyph.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <param name="x">X coordinate.</param>
	/// <param name="y">Y coordinate.</param>
	/// <param name="colorIndex">Color index.</param>
	/// <returns>True if successful.</returns>
	public bool SetPixel(int charCode, int x, int y, byte colorIndex) {
		var glyph = GetGlyph(charCode);
		if (glyph == null || x < 0 || x >= glyph.Width || y < 0 || y >= glyph.Height) {
			return false;
		}

		glyph.Pixels[y, x] = colorIndex;
		return true;
	}

	/// <summary>
	/// Get a pixel from a glyph.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <param name="x">X coordinate.</param>
	/// <param name="y">Y coordinate.</param>
	/// <returns>Color index or -1 if invalid.</returns>
	public int GetPixel(int charCode, int x, int y) {
		var glyph = GetGlyph(charCode);
		if (glyph == null || x < 0 || x >= glyph.Width || y < 0 || y >= glyph.Height) {
			return -1;
		}

		return glyph.Pixels[y, x];
	}

	/// <summary>
	/// Copy a glyph to another position.
	/// </summary>
	/// <param name="sourceChar">Source character code.</param>
	/// <param name="destChar">Destination character code.</param>
	/// <returns>True if successful.</returns>
	public bool CopyGlyph(int sourceChar, int destChar) {
		var source = GetGlyph(sourceChar);
		if (source == null) return false;

		// Deep copy pixels
		var newPixels = new byte[source.Height, source.Width];
		Array.Copy(source.Pixels, newPixels, source.Pixels.Length);

		return SetGlyph(destChar, source with {
			CharCode = destChar,
			Pixels = newPixels
		});
	}

	/// <summary>
	/// Clear a glyph (set all pixels to 0).
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <returns>True if successful.</returns>
	public bool ClearGlyph(int charCode) {
		var glyph = GetGlyph(charCode);
		if (glyph == null) return false;

		for (int y = 0; y < glyph.Height; y++) {
			for (int x = 0; x < glyph.Width; x++) {
				glyph.Pixels[y, x] = 0;
			}
		}

		return true;
	}

	/// <summary>
	/// Flip a glyph horizontally.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <returns>True if successful.</returns>
	public bool FlipHorizontal(int charCode) {
		var glyph = GetGlyph(charCode);
		if (glyph == null) return false;

		for (int y = 0; y < glyph.Height; y++) {
			for (int x = 0; x < glyph.Width / 2; x++) {
				int oppositeX = glyph.Width - 1 - x;
				(glyph.Pixels[y, x], glyph.Pixels[y, oppositeX]) =
					(glyph.Pixels[y, oppositeX], glyph.Pixels[y, x]);
			}
		}

		return true;
	}

	/// <summary>
	/// Flip a glyph vertically.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <returns>True if successful.</returns>
	public bool FlipVertical(int charCode) {
		var glyph = GetGlyph(charCode);
		if (glyph == null) return false;

		for (int y = 0; y < glyph.Height / 2; y++) {
			int oppositeY = glyph.Height - 1 - y;
			for (int x = 0; x < glyph.Width; x++) {
				(glyph.Pixels[y, x], glyph.Pixels[oppositeY, x]) =
					(glyph.Pixels[oppositeY, x], glyph.Pixels[y, x]);
			}
		}

		return true;
	}

	/// <summary>
	/// Invert colors in a glyph.
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <param name="maxColorIndex">Maximum color index for inversion.</param>
	/// <returns>True if successful.</returns>
	public bool InvertColors(int charCode, byte maxColorIndex = 3) {
		var glyph = GetGlyph(charCode);
		if (glyph == null) return false;

		for (int y = 0; y < glyph.Height; y++) {
			for (int x = 0; x < glyph.Width; x++) {
				glyph.Pixels[y, x] = (byte)(maxColorIndex - glyph.Pixels[y, x]);
			}
		}

		return true;
	}

	/// <summary>
	/// Calculate width of a glyph (rightmost non-zero column + 1).
	/// </summary>
	/// <param name="charCode">Character code.</param>
	/// <returns>Calculated width or -1 if invalid.</returns>
	public int CalculateGlyphWidth(int charCode) {
		var glyph = GetGlyph(charCode);
		if (glyph == null) return -1;

		int maxX = -1;
		for (int y = 0; y < glyph.Height; y++) {
			for (int x = glyph.Width - 1; x >= 0; x--) {
				if (glyph.Pixels[y, x] != 0) {
					maxX = Math.Max(maxX, x);
					break;
				}
			}
		}

		return maxX + 1;
	}

	/// <summary>
	/// Auto-calculate VWF widths for all glyphs.
	/// </summary>
	/// <param name="minWidth">Minimum width.</param>
	/// <param name="spacing">Extra spacing to add.</param>
	/// <returns>Array of calculated widths.</returns>
	public byte[] CalculateVwfWidths(int minWidth = 1, int spacing = 1) {
		var widths = new byte[_glyphs.Count];

		for (int i = 0; i < _glyphs.Count; i++) {
			int calculated = CalculateGlyphWidth(Config.FirstChar + i);
			widths[i] = (byte)Math.Max(minWidth, calculated + spacing);
		}

		return widths;
	}

	/// <summary>
	/// Apply character mapping from a TBL file.
	/// </summary>
	/// <param name="tblContent">TBL file content.</param>
	public void ApplyCharacterMapping(string tblContent) {
		var charMap = new Dictionary<int, char>();

		foreach (var line in tblContent.Split('\n')) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#')) continue;

			var parts = trimmed.Split('=');
			if (parts.Length != 2) continue;

			if (int.TryParse(parts[0], System.Globalization.NumberStyles.HexNumber, null, out int code)) {
				if (parts[1].Length > 0) {
					charMap[code] = parts[1][0];
				}
			}
		}

		Config = Config with { CharMap = charMap };

		// Update glyph character mappings
		for (int i = 0; i < _glyphs.Count; i++) {
			int code = Config.FirstChar + i;
			if (charMap.TryGetValue(code, out var c)) {
				_glyphs[i] = _glyphs[i] with { Character = c };
			}
		}
	}

	/// <summary>
	/// Export font configuration as JSON.
	/// </summary>
	/// <returns>JSON string.</returns>
	public string ExportConfigJson() {
		var config = new {
			name = Config.Name,
			format = Config.Format.ToString(),
			tileWidth = Config.TileWidth,
			tileHeight = Config.TileHeight,
			charCount = Config.CharCount,
			firstChar = Config.FirstChar,
			isVariableWidth = Config.IsVariableWidth,
			charMap = Config.CharMap.ToDictionary(
				kv => $"0x{kv.Key:x2}",
				kv => kv.Value.ToString()
			)
		};

		return JsonSerializer.Serialize(config, new JsonSerializerOptions {
			WriteIndented = true
		});
	}

	/// <summary>
	/// Render text using this font.
	/// </summary>
	/// <param name="text">Text to render.</param>
	/// <param name="maxWidth">Maximum width (0 = no limit).</param>
	/// <returns>2D pixel array.</returns>
	public byte[,] RenderText(string text, int maxWidth = 0) {
		if (string.IsNullOrEmpty(text)) return new byte[0, 0];

		// Calculate dimensions
		int totalWidth = 0;
		int lineHeight = Config.TileHeight;

		foreach (char c in text) {
			var glyph = FindGlyphForChar(c);
			if (glyph != null) {
				totalWidth += Config.IsVariableWidth ? glyph.Advance : Config.TileWidth;
			}
		}

		if (maxWidth > 0 && totalWidth > maxWidth) totalWidth = maxWidth;
		if (totalWidth == 0) return new byte[0, 0];

		var result = new byte[lineHeight, totalWidth];
		int currentX = 0;

		foreach (char c in text) {
			var glyph = FindGlyphForChar(c);
			if (glyph == null) continue;

			int advance = Config.IsVariableWidth ? glyph.Advance : Config.TileWidth;
			if (maxWidth > 0 && currentX + advance > maxWidth) break;

			// Copy glyph pixels
			for (int y = 0; y < glyph.Height && y < lineHeight; y++) {
				for (int x = 0; x < glyph.Width && currentX + x < totalWidth; x++) {
					result[y, currentX + x] = glyph.Pixels[y, x];
				}
			}

			currentX += advance;
		}

		return result;
	}

	private Glyph? FindGlyphForChar(char c) {
		// First try reverse lookup in char map
		foreach (var kv in Config.CharMap) {
			if (kv.Value == c) {
				return GetGlyph(kv.Key);
			}
		}

		// Fall back to ASCII if in range
		if (c >= Config.FirstChar && c < Config.FirstChar + Config.CharCount) {
			return GetGlyph(c);
		}

		return null;
	}

	/// <summary>
	/// Get bytes per tile for a format.
	/// </summary>
	public static int CalculateBytesPerTile(TileFormat format, int width, int height) {
		int pixels = width * height;
		return format switch {
			TileFormat.Mono1bpp => pixels / 8,
			TileFormat.Nes2bpp => pixels / 4,
			TileFormat.Snes2bpp => pixels / 4,
			TileFormat.GameBoy2bpp => pixels / 4,
			TileFormat.Snes4bpp => pixels / 2,
			TileFormat.Gba4bpp => pixels / 2,
			TileFormat.Linear8bpp => pixels,
			_ => pixels / 4
		};
	}

	/// <summary>
	/// Decode tile data to pixel array.
	/// </summary>
	public static byte[,] DecodeTile(byte[] data, TileFormat format, int width, int height) {
		var pixels = new byte[height, width];

		switch (format) {
			case TileFormat.Nes2bpp:
			case TileFormat.Snes2bpp:
				DecodeNes2bpp(data, pixels, width, height);
				break;
			case TileFormat.GameBoy2bpp:
				DecodeGameBoy2bpp(data, pixels, width, height);
				break;
			case TileFormat.Snes4bpp:
				DecodeSnes4bpp(data, pixels, width, height);
				break;
			case TileFormat.Mono1bpp:
				DecodeMono1bpp(data, pixels, width, height);
				break;
			case TileFormat.Linear8bpp:
				DecodeLinear8bpp(data, pixels, width, height);
				break;
			case TileFormat.Gba4bpp:
				DecodeGba4bpp(data, pixels, width, height);
				break;
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel array to tile data.
	/// </summary>
	public byte[] EncodeTile(byte[,] pixels, TileFormat format) {
		int height = pixels.GetLength(0);
		int width = pixels.GetLength(1);
		int bytesPerTile = CalculateBytesPerTile(format, width, height);
		var data = new byte[bytesPerTile];

		switch (format) {
			case TileFormat.Nes2bpp:
			case TileFormat.Snes2bpp:
				EncodeNes2bpp(pixels, data, width, height);
				break;
			case TileFormat.GameBoy2bpp:
				EncodeGameBoy2bpp(pixels, data, width, height);
				break;
			case TileFormat.Snes4bpp:
				EncodeSnes4bpp(pixels, data, width, height);
				break;
			case TileFormat.Mono1bpp:
				EncodeMono1bpp(pixels, data, width, height);
				break;
			case TileFormat.Linear8bpp:
				EncodeLinear8bpp(pixels, data, width, height);
				break;
			case TileFormat.Gba4bpp:
				EncodeGba4bpp(pixels, data, width, height);
				break;
		}

		return data;
	}

	// Decoding implementations
	private static void DecodeNes2bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = data[y];
			byte plane1 = data[y + 8];
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				pixels[y, x] = (byte)(
					((plane0 >> bit) & 1) |
					(((plane1 >> bit) & 1) << 1)
				);
			}
		}
	}

	private static void DecodeGameBoy2bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = data[y * 2];
			byte plane1 = data[(y * 2) + 1];
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				pixels[y, x] = (byte)(
					((plane0 >> bit) & 1) |
					(((plane1 >> bit) & 1) << 1)
				);
			}
		}
	}

	private static void DecodeSnes4bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = data[y];
			byte plane1 = data[y + 8];
			byte plane2 = data[y + 16];
			byte plane3 = data[y + 24];
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				pixels[y, x] = (byte)(
					((plane0 >> bit) & 1) |
					(((plane1 >> bit) & 1) << 1) |
					(((plane2 >> bit) & 1) << 2) |
					(((plane3 >> bit) & 1) << 3)
				);
			}
		}
	}

	private static void DecodeMono1bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int byteIndex = ((y * width) + x) / 8;
				int bitIndex = 7 - (((y * width) + x) % 8);
				if (byteIndex < data.Length) {
					pixels[y, x] = (byte)((data[byteIndex] >> bitIndex) & 1);
				}
			}
		}
	}

	private static void DecodeLinear8bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int index = (y * width) + x;
				if (index < data.Length) {
					pixels[y, x] = data[index];
				}
			}
		}
	}

	private static void DecodeGba4bpp(byte[] data, byte[,] pixels, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int index = ((y * width) + x) / 2;
				if (index < data.Length) {
					pixels[y, x] = (byte)((x % 2 == 0)
						? data[index] & 0x0F
						: (data[index] >> 4) & 0x0F);
				}
			}
		}
	}

	// Encoding implementations
	private static void EncodeNes2bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = 0, plane1 = 0;
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				byte pixel = pixels[y, x];
				if ((pixel & 1) != 0) plane0 |= (byte)(1 << bit);
				if ((pixel & 2) != 0) plane1 |= (byte)(1 << bit);
			}

			data[y] = plane0;
			data[y + 8] = plane1;
		}
	}

	private static void EncodeGameBoy2bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = 0, plane1 = 0;
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				byte pixel = pixels[y, x];
				if ((pixel & 1) != 0) plane0 |= (byte)(1 << bit);
				if ((pixel & 2) != 0) plane1 |= (byte)(1 << bit);
			}

			data[y * 2] = plane0;
			data[(y * 2) + 1] = plane1;
		}
	}

	private static void EncodeSnes4bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height && y < 8; y++) {
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;
			for (int x = 0; x < width && x < 8; x++) {
				int bit = 7 - x;
				byte pixel = pixels[y, x];
				if ((pixel & 1) != 0) plane0 |= (byte)(1 << bit);
				if ((pixel & 2) != 0) plane1 |= (byte)(1 << bit);
				if ((pixel & 4) != 0) plane2 |= (byte)(1 << bit);
				if ((pixel & 8) != 0) plane3 |= (byte)(1 << bit);
			}

			data[y] = plane0;
			data[y + 8] = plane1;
			data[y + 16] = plane2;
			data[y + 24] = plane3;
		}
	}

	private static void EncodeMono1bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int byteIndex = ((y * width) + x) / 8;
				int bitIndex = 7 - (((y * width) + x) % 8);
				if (byteIndex < data.Length && pixels[y, x] != 0) {
					data[byteIndex] |= (byte)(1 << bitIndex);
				}
			}
		}
	}

	private static void EncodeLinear8bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int index = (y * width) + x;
				if (index < data.Length) {
					data[index] = pixels[y, x];
				}
			}
		}
	}

	private static void EncodeGba4bpp(byte[,] pixels, byte[] data, int width, int height) {
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x += 2) {
				int index = ((y * width) + x) / 2;
				if (index < data.Length) {
					byte lo = (byte)(pixels[y, x] & 0x0F);
					byte hi = (byte)((x + 1 < width ? pixels[y, x + 1] : 0) << 4);
					data[index] = (byte)(lo | hi);
				}
			}
		}
	}

	/// <summary>
	/// Create a preset for NES fonts.
	/// </summary>
	public static FontConfig CreateNesPreset(string name = "NES Font") {
		return new FontConfig {
			Name = name,
			Format = TileFormat.Nes2bpp,
			TileWidth = 8,
			TileHeight = 8,
			CharCount = 256
		};
	}

	/// <summary>
	/// Create a preset for SNES fonts.
	/// </summary>
	public static FontConfig CreateSnesPreset(string name = "SNES Font", bool is4bpp = false) {
		return new FontConfig {
			Name = name,
			Format = is4bpp ? TileFormat.Snes4bpp : TileFormat.Snes2bpp,
			TileWidth = 8,
			TileHeight = 8,
			CharCount = 256
		};
	}

	/// <summary>
	/// Create a preset for Game Boy fonts.
	/// </summary>
	public static FontConfig CreateGameBoyPreset(string name = "GB Font") {
		return new FontConfig {
			Name = name,
			Format = TileFormat.GameBoy2bpp,
			TileWidth = 8,
			TileHeight = 8,
			CharCount = 256
		};
	}
}
