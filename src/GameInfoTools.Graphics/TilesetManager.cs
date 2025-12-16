using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Graphics;

/// <summary>
/// Tileset manager for viewing and editing game tilesets.
/// Handles tile data, palettes, and tile properties.
/// </summary>
public class TilesetManager {
	/// <summary>
	/// Platform-specific tile formats.
	/// </summary>
	public enum TileFormat {
		Planar2BPP,      // NES, Game Boy (2 bitplanes)
		Planar4BPP,      // SNES, GBA (4 bitplanes)
		Planar8BPP,      // SNES mode 7
		Linear4BPP,      // GBA, Genesis (linear)
		Linear8BPP,      // GBA (linear 8-bit)
		Interleaved,     // Genesis/Mega Drive
		Composite        // Various compressed formats
	}

	/// <summary>
	/// Tile collision type.
	/// </summary>
	public enum CollisionType {
		None,
		Solid,
		SemiSolid,      // Can jump through from below
		Ladder,
		Water,
		Damage,
		SlipperyFloor,
		Conveyor,
		Pit,
		Door,
		Warp,
		SavePoint,
		Custom
	}

	/// <summary>
	/// A single tile definition.
	/// </summary>
	public class TileDefinition {
		public int Id { get; set; }
		public byte[] PixelData { get; set; } = [];
		public int PaletteIndex { get; set; }
		public bool FlipHorizontal { get; set; }
		public bool FlipVertical { get; set; }
		public bool Priority { get; set; }
		public CollisionType Collision { get; set; }
		public int AnimationFrame { get; set; }
		public int AnimationGroup { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// A metatile (composed of multiple tiles).
	/// </summary>
	public class MetaTile {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int[] TileIds { get; set; } = [];
		public int[] TileFlips { get; set; } = [];  // Flip flags per subtile
		public int[] TilePalettes { get; set; } = [];  // Palette per subtile
		public CollisionType Collision { get; set; }
		public int Width { get; set; } = 2;  // In tiles (2x2 = 16x16 metatile)
		public int Height { get; set; } = 2;
		public Dictionary<string, int> Properties { get; } = [];
	}

	/// <summary>
	/// A complete tileset.
	/// </summary>
	public class Tileset {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public List<TileDefinition> Tiles { get; } = [];
		public List<MetaTile> MetaTiles { get; } = [];
		public List<PaletteEntry> Palettes { get; } = [];
		public TileFormat Format { get; set; }
		public int TileWidth { get; set; } = 8;
		public int TileHeight { get; set; } = 8;
		public int BitsPerPixel { get; set; } = 2;
		public int RomOffset { get; set; }
		public int DataSize { get; set; }
		public bool IsCompressed { get; set; }
	}

	/// <summary>
	/// Palette entry.
	/// </summary>
	public class PaletteEntry {
		public int Index { get; set; }
		public byte[] Colors { get; set; } = [];  // RGB or RGBA values
		public int ColorCount { get; set; } = 4;  // 4 for 2BPP, 16 for 4BPP
	}

	/// <summary>
	/// Tileset schema for reading from ROM.
	/// </summary>
	public class TilesetSchema {
		public string Name { get; set; } = "";
		public int TileDataOffset { get; set; }
		public int TileCount { get; set; }
		public TileFormat Format { get; set; } = TileFormat.Planar2BPP;
		public int BitsPerPixel { get; set; } = 2;
		public int TileWidth { get; set; } = 8;
		public int TileHeight { get; set; } = 8;
		public int PaletteOffset { get; set; } = -1;  // -1 means no palette data
		public int PaletteCount { get; set; } = 1;
		public int ColorsPerPalette { get; set; } = 4;
		public int MetaTileOffset { get; set; } = -1;
		public int MetaTileCount { get; set; }
		public int MetaTileSize { get; set; } = 4;  // 4 bytes for 2x2 metatile
		public int CollisionOffset { get; set; } = -1;
		public bool HasPriority { get; set; }
	}

	private readonly byte[] _data;
	private readonly List<Tileset> _tilesets = [];
	private TilesetSchema? _schema;

	public TilesetManager(byte[] romData) {
		_data = romData;
	}

	/// <summary>
	/// Gets all loaded tilesets.
	/// </summary>
	public IReadOnlyList<Tileset> Tilesets => _tilesets;

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public TilesetSchema? Schema => _schema;

	/// <summary>
	/// Sets the tileset schema.
	/// </summary>
	public void SetSchema(TilesetSchema schema) {
		_schema = schema;
	}

	/// <summary>
	/// Loads a tileset from ROM using the configured schema.
	/// </summary>
	public Tileset LoadTileset(int id = 0) {
		if (_schema == null) {
			throw new InvalidOperationException("Schema must be set before loading tileset");
		}

		var tileset = new Tileset {
			Id = id,
			Name = _schema.Name,
			Format = _schema.Format,
			TileWidth = _schema.TileWidth,
			TileHeight = _schema.TileHeight,
			BitsPerPixel = _schema.BitsPerPixel,
			RomOffset = _schema.TileDataOffset
		};

		// Calculate bytes per tile
		int bytesPerTile = CalculateBytesPerTile(_schema.TileWidth, _schema.TileHeight, _schema.BitsPerPixel, _schema.Format);
		tileset.DataSize = bytesPerTile * _schema.TileCount;

		// Load tiles
		for (int i = 0; i < _schema.TileCount; i++) {
			int offset = _schema.TileDataOffset + (i * bytesPerTile);
			var tile = ReadTile(offset, i, bytesPerTile);
			tileset.Tiles.Add(tile);
		}

		// Load palettes if present
		if (_schema.PaletteOffset >= 0) {
			LoadPalettes(tileset);
		}

		// Load metatiles if present
		if (_schema.MetaTileOffset >= 0) {
			LoadMetaTiles(tileset);
		}

		// Load collision data if present
		if (_schema.CollisionOffset >= 0) {
			LoadCollisionData(tileset);
		}

		_tilesets.Add(tileset);
		return tileset;
	}

	private int CalculateBytesPerTile(int width, int height, int bpp, TileFormat format) {
		int pixelCount = width * height;
		return format switch {
			TileFormat.Planar2BPP => (pixelCount * 2) / 8,    // 16 bytes for 8x8
			TileFormat.Planar4BPP => (pixelCount * 4) / 8,    // 32 bytes for 8x8
			TileFormat.Planar8BPP => pixelCount,               // 64 bytes for 8x8
			TileFormat.Linear4BPP => (pixelCount * 4) / 8,    // 32 bytes for 8x8
			TileFormat.Linear8BPP => pixelCount,               // 64 bytes for 8x8
			TileFormat.Interleaved => (pixelCount * bpp) / 8,
			_ => (pixelCount * bpp) / 8
		};
	}

	private TileDefinition ReadTile(int offset, int id, int size) {
		if (_schema == null) return new TileDefinition { Id = id };

		var tile = new TileDefinition {
			Id = id,
			RomOffset = offset
		};

		if (offset + size > _data.Length) {
			tile.PixelData = new byte[_schema.TileWidth * _schema.TileHeight];
			return tile;
		}

		// Read raw tile data
		byte[] rawData = new byte[size];
		Array.Copy(_data, offset, rawData, 0, size);

		// Decode pixel data based on format
		tile.PixelData = DecodeTile(rawData, _schema.TileWidth, _schema.TileHeight, _schema.Format);

		return tile;
	}

	/// <summary>
	/// Decodes raw tile data to pixel indices.
	/// </summary>
	public byte[] DecodeTile(byte[] rawData, int width, int height, TileFormat format) {
		int pixelCount = width * height;
		byte[] pixels = new byte[pixelCount];

		switch (format) {
			case TileFormat.Planar2BPP:
				DecodePlanar2BPP(rawData, pixels, width, height);
				break;

			case TileFormat.Planar4BPP:
				DecodePlanar4BPP(rawData, pixels, width, height);
				break;

			case TileFormat.Linear4BPP:
				DecodeLinear4BPP(rawData, pixels, width, height);
				break;

			case TileFormat.Linear8BPP:
				Array.Copy(rawData, pixels, Math.Min(rawData.Length, pixels.Length));
				break;

			case TileFormat.Interleaved:
				DecodeInterleaved(rawData, pixels, width, height);
				break;

			default:
				// Default to planar 2BPP
				DecodePlanar2BPP(rawData, pixels, width, height);
				break;
		}

		return pixels;
	}

	private static void DecodePlanar2BPP(byte[] data, byte[] pixels, int width, int height) {
		// NES/GB format: 2 bytes per row (bitplane 0, bitplane 1)
		int rowBytes = 2;
		for (int row = 0; row < height && row * rowBytes + 1 < data.Length; row++) {
			byte plane0 = data[row * rowBytes];
			byte plane1 = data[row * rowBytes + 1];

			for (int col = 0; col < width; col++) {
				int bit = 7 - col;
				int pixelIndex = row * width + col;
				if (pixelIndex < pixels.Length) {
					int value = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
					pixels[pixelIndex] = (byte)value;
				}
			}
		}
	}

	private static void DecodePlanar4BPP(byte[] data, byte[] pixels, int width, int height) {
		// SNES format: Interleaved bitplane pairs
		// First 16 bytes: planes 0,1 (2 bytes per row)
		// Next 16 bytes: planes 2,3 (2 bytes per row)
		int rowBytes = 2;
		for (int row = 0; row < height; row++) {
			byte plane0 = row * rowBytes < data.Length ? data[row * rowBytes] : (byte)0;
			byte plane1 = row * rowBytes + 1 < data.Length ? data[row * rowBytes + 1] : (byte)0;
			int offset2 = height * rowBytes;
			byte plane2 = row * rowBytes + offset2 < data.Length ? data[row * rowBytes + offset2] : (byte)0;
			byte plane3 = row * rowBytes + offset2 + 1 < data.Length ? data[row * rowBytes + offset2 + 1] : (byte)0;

			for (int col = 0; col < width; col++) {
				int bit = 7 - col;
				int pixelIndex = row * width + col;
				if (pixelIndex < pixels.Length) {
					int value = ((plane0 >> bit) & 1) |
								(((plane1 >> bit) & 1) << 1) |
								(((plane2 >> bit) & 1) << 2) |
								(((plane3 >> bit) & 1) << 3);
					pixels[pixelIndex] = (byte)value;
				}
			}
		}
	}

	private static void DecodeLinear4BPP(byte[] data, byte[] pixels, int width, int height) {
		// Linear 4BPP: 2 pixels per byte
		for (int i = 0; i < data.Length && i * 2 + 1 < pixels.Length; i++) {
			pixels[i * 2] = (byte)(data[i] & 0x0f);
			pixels[i * 2 + 1] = (byte)((data[i] >> 4) & 0x0f);
		}
	}

	private static void DecodeInterleaved(byte[] data, byte[] pixels, int width, int height) {
		// Genesis/Mega Drive: Linear 4BPP with different pixel order
		for (int i = 0; i < data.Length && i * 2 + 1 < pixels.Length; i++) {
			pixels[i * 2] = (byte)((data[i] >> 4) & 0x0f);      // High nibble first
			pixels[i * 2 + 1] = (byte)(data[i] & 0x0f);
		}
	}

	private void LoadPalettes(Tileset tileset) {
		if (_schema == null || _schema.PaletteOffset < 0) return;

		int bytesPerColor = _schema.Format == TileFormat.Linear8BPP ? 3 : 2;  // RGB or 15-bit color
		int bytesPerPalette = _schema.ColorsPerPalette * bytesPerColor;

		for (int p = 0; p < _schema.PaletteCount; p++) {
			int offset = _schema.PaletteOffset + (p * bytesPerPalette);
			if (offset + bytesPerPalette > _data.Length) break;

			var palette = new PaletteEntry {
				Index = p,
				ColorCount = _schema.ColorsPerPalette,
				Colors = new byte[_schema.ColorsPerPalette * 4]  // RGBA
			};

			// Read colors
			for (int c = 0; c < _schema.ColorsPerPalette; c++) {
				int colorOffset = offset + (c * bytesPerColor);
				if (colorOffset + bytesPerColor > _data.Length) break;

				byte r, g, b;
				if (bytesPerColor == 2) {
					// 15-bit color (SNES, GBA)
					int color = _data[colorOffset] | (_data[colorOffset + 1] << 8);
					r = (byte)((color & 0x1f) << 3);
					g = (byte)(((color >> 5) & 0x1f) << 3);
					b = (byte)(((color >> 10) & 0x1f) << 3);
				} else {
					// 24-bit RGB
					r = _data[colorOffset];
					g = _data[colorOffset + 1];
					b = _data[colorOffset + 2];
				}

				palette.Colors[c * 4] = r;
				palette.Colors[c * 4 + 1] = g;
				palette.Colors[c * 4 + 2] = b;
				palette.Colors[c * 4 + 3] = (byte)(c == 0 ? 0 : 255);  // Index 0 transparent
			}

			tileset.Palettes.Add(palette);
		}
	}

	private void LoadMetaTiles(Tileset tileset) {
		if (_schema == null || _schema.MetaTileOffset < 0) return;

		for (int m = 0; m < _schema.MetaTileCount; m++) {
			int offset = _schema.MetaTileOffset + (m * _schema.MetaTileSize);
			if (offset + _schema.MetaTileSize > _data.Length) break;

			var metaTile = new MetaTile {
				Id = m,
				Name = $"MetaTile #{m}",
				Width = 2,
				Height = 2,
				TileIds = new int[4],
				TileFlips = new int[4],
				TilePalettes = new int[4]
			};

			// Read subtile indices
			// Format varies by platform, assume simple 1-byte-per-subtile
			for (int s = 0; s < Math.Min(_schema.MetaTileSize, 4); s++) {
				int dataOffset = offset + s;
				if (dataOffset < _data.Length) {
					byte data = _data[dataOffset];

					if (_schema.HasPriority) {
						// Packed format: [priority][palette][flip][tile]
						metaTile.TileIds[s] = data & 0x3f;
						metaTile.TileFlips[s] = (data >> 6) & 0x03;
					} else {
						metaTile.TileIds[s] = data;
					}
				}
			}

			tileset.MetaTiles.Add(metaTile);
		}
	}

	private void LoadCollisionData(Tileset tileset) {
		if (_schema == null || _schema.CollisionOffset < 0) return;

		// Collision data is usually 1 byte per metatile or tile
		int count = tileset.MetaTiles.Count > 0 ? tileset.MetaTiles.Count : tileset.Tiles.Count;

		for (int i = 0; i < count; i++) {
			int offset = _schema.CollisionOffset + i;
			if (offset >= _data.Length) break;

			byte collision = _data[offset];

			if (tileset.MetaTiles.Count > 0 && i < tileset.MetaTiles.Count) {
				tileset.MetaTiles[i].Collision = (CollisionType)(collision & 0x0f);
			} else if (i < tileset.Tiles.Count) {
				tileset.Tiles[i].Collision = (CollisionType)(collision & 0x0f);
			}
		}
	}

	/// <summary>
	/// Gets a specific tileset by ID.
	/// </summary>
	public Tileset? GetTileset(int id) {
		return _tilesets.FirstOrDefault(t => t.Id == id);
	}

	/// <summary>
	/// Gets a tile by ID from a tileset.
	/// </summary>
	public TileDefinition? GetTile(int tilesetId, int tileId) {
		var tileset = GetTileset(tilesetId);
		return tileset?.Tiles.FirstOrDefault(t => t.Id == tileId);
	}

	/// <summary>
	/// Gets a metatile by ID from a tileset.
	/// </summary>
	public MetaTile? GetMetaTile(int tilesetId, int metaTileId) {
		var tileset = GetTileset(tilesetId);
		return tileset?.MetaTiles.FirstOrDefault(m => m.Id == metaTileId);
	}

	/// <summary>
	/// Updates a tile's pixel data.
	/// </summary>
	public bool UpdateTile(int tilesetId, int tileId, byte[] newPixelData) {
		var tile = GetTile(tilesetId, tileId);
		if (tile == null) return false;
		if (_schema == null) return false;

		int expectedSize = _schema.TileWidth * _schema.TileHeight;
		if (newPixelData.Length != expectedSize) return false;

		// Encode and write back to ROM
		int bytesPerTile = CalculateBytesPerTile(_schema.TileWidth, _schema.TileHeight, _schema.BitsPerPixel, _schema.Format);
		byte[] encoded = EncodeTile(newPixelData, _schema.TileWidth, _schema.TileHeight, _schema.Format);

		if (tile.RomOffset + bytesPerTile > _data.Length) return false;

		Array.Copy(encoded, 0, _data, tile.RomOffset, bytesPerTile);
		tile.PixelData = newPixelData;

		return true;
	}

	/// <summary>
	/// Encodes pixel data to raw tile format.
	/// </summary>
	public byte[] EncodeTile(byte[] pixels, int width, int height, TileFormat format) {
		int pixelCount = width * height;

		return format switch {
			TileFormat.Planar2BPP => EncodePlanar2BPP(pixels, width, height),
			TileFormat.Planar4BPP => EncodePlanar4BPP(pixels, width, height),
			TileFormat.Linear4BPP => EncodeLinear4BPP(pixels, width, height),
			TileFormat.Linear8BPP => (byte[])pixels.Clone(),
			TileFormat.Interleaved => EncodeInterleaved(pixels, width, height),
			_ => EncodePlanar2BPP(pixels, width, height)
		};
	}

	private static byte[] EncodePlanar2BPP(byte[] pixels, int width, int height) {
		byte[] result = new byte[height * 2];

		for (int row = 0; row < height; row++) {
			byte plane0 = 0, plane1 = 0;

			for (int col = 0; col < width; col++) {
				int pixelIndex = row * width + col;
				if (pixelIndex >= pixels.Length) continue;

				int value = pixels[pixelIndex] & 0x03;
				int bit = 7 - col;
				plane0 |= (byte)((value & 1) << bit);
				plane1 |= (byte)(((value >> 1) & 1) << bit);
			}

			result[row * 2] = plane0;
			result[row * 2 + 1] = plane1;
		}

		return result;
	}

	private static byte[] EncodePlanar4BPP(byte[] pixels, int width, int height) {
		byte[] result = new byte[height * 4];

		for (int row = 0; row < height; row++) {
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;

			for (int col = 0; col < width; col++) {
				int pixelIndex = row * width + col;
				if (pixelIndex >= pixels.Length) continue;

				int value = pixels[pixelIndex] & 0x0f;
				int bit = 7 - col;
				plane0 |= (byte)((value & 1) << bit);
				plane1 |= (byte)(((value >> 1) & 1) << bit);
				plane2 |= (byte)(((value >> 2) & 1) << bit);
				plane3 |= (byte)(((value >> 3) & 1) << bit);
			}

			result[row * 2] = plane0;
			result[row * 2 + 1] = plane1;
			result[height * 2 + row * 2] = plane2;
			result[height * 2 + row * 2 + 1] = plane3;
		}

		return result;
	}

	private static byte[] EncodeLinear4BPP(byte[] pixels, int width, int height) {
		int resultSize = (width * height) / 2;
		byte[] result = new byte[resultSize];

		for (int i = 0; i < resultSize && i * 2 + 1 < pixels.Length; i++) {
			result[i] = (byte)((pixels[i * 2] & 0x0f) | ((pixels[i * 2 + 1] & 0x0f) << 4));
		}

		return result;
	}

	private static byte[] EncodeInterleaved(byte[] pixels, int width, int height) {
		int resultSize = (width * height) / 2;
		byte[] result = new byte[resultSize];

		for (int i = 0; i < resultSize && i * 2 + 1 < pixels.Length; i++) {
			result[i] = (byte)(((pixels[i * 2] & 0x0f) << 4) | (pixels[i * 2 + 1] & 0x0f));
		}

		return result;
	}

	/// <summary>
	/// Updates a metatile definition.
	/// </summary>
	public bool UpdateMetaTile(int tilesetId, int metaTileId, int[] tileIds, int[]? flips = null) {
		var metaTile = GetMetaTile(tilesetId, metaTileId);
		if (metaTile == null) return false;
		if (tileIds.Length != metaTile.TileIds.Length) return false;

		Array.Copy(tileIds, metaTile.TileIds, tileIds.Length);
		if (flips != null && flips.Length == metaTile.TileFlips.Length) {
			Array.Copy(flips, metaTile.TileFlips, flips.Length);
		}

		// Write back to ROM if schema supports it
		if (_schema != null && _schema.MetaTileOffset >= 0) {
			int offset = _schema.MetaTileOffset + (metaTileId * _schema.MetaTileSize);
			for (int s = 0; s < Math.Min(_schema.MetaTileSize, tileIds.Length); s++) {
				if (offset + s < _data.Length) {
					byte data = (byte)tileIds[s];
					if (_schema.HasPriority && flips != null && s < flips.Length) {
						data = (byte)((data & 0x3f) | ((flips[s] & 0x03) << 6));
					}
					_data[offset + s] = data;
				}
			}
		}

		return true;
	}

	/// <summary>
	/// Renders a tile to RGBA pixel array.
	/// </summary>
	public byte[] RenderTile(TileDefinition tile, PaletteEntry palette, bool flipH = false, bool flipV = false) {
		if (_schema == null) return [];

		int width = _schema.TileWidth;
		int height = _schema.TileHeight;
		byte[] rgba = new byte[width * height * 4];

		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int srcX = flipH ? (width - 1 - x) : x;
				int srcY = flipV ? (height - 1 - y) : y;
				int srcIndex = srcY * width + srcX;
				int dstIndex = (y * width + x) * 4;

				if (srcIndex < tile.PixelData.Length && dstIndex + 3 < rgba.Length) {
					int colorIndex = tile.PixelData[srcIndex];
					if (colorIndex * 4 + 3 < palette.Colors.Length) {
						rgba[dstIndex] = palette.Colors[colorIndex * 4];
						rgba[dstIndex + 1] = palette.Colors[colorIndex * 4 + 1];
						rgba[dstIndex + 2] = palette.Colors[colorIndex * 4 + 2];
						rgba[dstIndex + 3] = palette.Colors[colorIndex * 4 + 3];
					}
				}
			}
		}

		return rgba;
	}

	/// <summary>
	/// Renders a metatile to RGBA pixel array.
	/// </summary>
	public byte[] RenderMetaTile(MetaTile metaTile, Tileset tileset, int paletteIndex = 0) {
		if (_schema == null) return [];

		int tileWidth = _schema.TileWidth;
		int tileHeight = _schema.TileHeight;
		int metaWidth = metaTile.Width * tileWidth;
		int metaHeight = metaTile.Height * tileHeight;
		byte[] rgba = new byte[metaWidth * metaHeight * 4];

		if (paletteIndex >= tileset.Palettes.Count) return rgba;
		var palette = tileset.Palettes[paletteIndex];

		for (int subY = 0; subY < metaTile.Height; subY++) {
			for (int subX = 0; subX < metaTile.Width; subX++) {
				int subIndex = subY * metaTile.Width + subX;
				if (subIndex >= metaTile.TileIds.Length) continue;

				int tileId = metaTile.TileIds[subIndex];
				if (tileId >= tileset.Tiles.Count) continue;

				var tile = tileset.Tiles[tileId];
				int flip = subIndex < metaTile.TileFlips.Length ? metaTile.TileFlips[subIndex] : 0;
				bool flipH = (flip & 1) != 0;
				bool flipV = (flip & 2) != 0;

				byte[] tileRgba = RenderTile(tile, palette, flipH, flipV);

				// Copy tile to metatile at correct position
				int baseX = subX * tileWidth;
				int baseY = subY * tileHeight;

				for (int y = 0; y < tileHeight; y++) {
					for (int x = 0; x < tileWidth; x++) {
						int srcIndex = (y * tileWidth + x) * 4;
						int dstIndex = ((baseY + y) * metaWidth + (baseX + x)) * 4;

						if (srcIndex + 3 < tileRgba.Length && dstIndex + 3 < rgba.Length) {
							rgba[dstIndex] = tileRgba[srcIndex];
							rgba[dstIndex + 1] = tileRgba[srcIndex + 1];
							rgba[dstIndex + 2] = tileRgba[srcIndex + 2];
							rgba[dstIndex + 3] = tileRgba[srcIndex + 3];
						}
					}
				}
			}
		}

		return rgba;
	}

	/// <summary>
	/// Exports tileset to JSON.
	/// </summary>
	public string ExportToJson(int tilesetId) {
		var tileset = GetTileset(tilesetId);
		if (tileset == null) return "{}";

		return JsonSerializer.Serialize(tileset, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Gets tileset statistics.
	/// </summary>
	public TilesetStatistics GetStatistics(int tilesetId) {
		var tileset = GetTileset(tilesetId);
		if (tileset == null) {
			return new TilesetStatistics(0, 0, 0, 0, 0, 0, []);
		}

		// Count unique tiles
		var uniqueTiles = new HashSet<string>();
		foreach (var tile in tileset.Tiles) {
			string hash = Convert.ToBase64String(tile.PixelData);
			uniqueTiles.Add(hash);
		}

		// Count collision types
		var collisionCounts = new Dictionary<CollisionType, int>();
		foreach (var tile in tileset.Tiles) {
			if (!collisionCounts.ContainsKey(tile.Collision)) {
				collisionCounts[tile.Collision] = 0;
			}
			collisionCounts[tile.Collision]++;
		}

		return new TilesetStatistics(
			TileCount: tileset.Tiles.Count,
			UniqueTiles: uniqueTiles.Count,
			MetaTileCount: tileset.MetaTiles.Count,
			PaletteCount: tileset.Palettes.Count,
			DataSize: tileset.DataSize,
			BitsPerPixel: tileset.BitsPerPixel,
			CollisionCounts: collisionCounts
		);
	}

	/// <summary>
	/// Statistics about a tileset.
	/// </summary>
	public record TilesetStatistics(
		int TileCount,
		int UniqueTiles,
		int MetaTileCount,
		int PaletteCount,
		int DataSize,
		int BitsPerPixel,
		Dictionary<CollisionType, int> CollisionCounts
	);

	/// <summary>
	/// Creates a schema for NES CHR data.
	/// </summary>
	public static TilesetSchema CreateNesSchema(int offset, int tileCount, int paletteOffset = -1) {
		return new TilesetSchema {
			Name = "NES CHR",
			TileDataOffset = offset,
			TileCount = tileCount,
			Format = TileFormat.Planar2BPP,
			BitsPerPixel = 2,
			TileWidth = 8,
			TileHeight = 8,
			PaletteOffset = paletteOffset,
			PaletteCount = 4,
			ColorsPerPalette = 4
		};
	}

	/// <summary>
	/// Creates a schema for SNES tileset.
	/// </summary>
	public static TilesetSchema CreateSnesSchema(int offset, int tileCount, int paletteOffset = -1, int bpp = 4) {
		return new TilesetSchema {
			Name = "SNES Tileset",
			TileDataOffset = offset,
			TileCount = tileCount,
			Format = bpp == 4 ? TileFormat.Planar4BPP : TileFormat.Planar2BPP,
			BitsPerPixel = bpp,
			TileWidth = 8,
			TileHeight = 8,
			PaletteOffset = paletteOffset,
			PaletteCount = 8,
			ColorsPerPalette = bpp == 4 ? 16 : 4
		};
	}

	/// <summary>
	/// Creates a schema for Game Boy tileset.
	/// </summary>
	public static TilesetSchema CreateGameBoySchema(int offset, int tileCount) {
		return new TilesetSchema {
			Name = "Game Boy Tileset",
			TileDataOffset = offset,
			TileCount = tileCount,
			Format = TileFormat.Planar2BPP,
			BitsPerPixel = 2,
			TileWidth = 8,
			TileHeight = 8,
			PaletteCount = 1,
			ColorsPerPalette = 4
		};
	}

	/// <summary>
	/// Creates a schema for GBA tileset.
	/// </summary>
	public static TilesetSchema CreateGbaSchema(int offset, int tileCount, int paletteOffset = -1, bool is8bpp = false) {
		return new TilesetSchema {
			Name = "GBA Tileset",
			TileDataOffset = offset,
			TileCount = tileCount,
			Format = is8bpp ? TileFormat.Linear8BPP : TileFormat.Linear4BPP,
			BitsPerPixel = is8bpp ? 8 : 4,
			TileWidth = 8,
			TileHeight = 8,
			PaletteOffset = paletteOffset,
			PaletteCount = is8bpp ? 1 : 16,
			ColorsPerPalette = is8bpp ? 256 : 16
		};
	}
}
