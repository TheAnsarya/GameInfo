namespace GameInfoTools.Graphics;

/// <summary>
/// Sprite sheet layout options.
/// </summary>
public enum SpriteSheetLayout {
	/// <summary>Arrange tiles horizontally in a row.</summary>
	Horizontal,
	/// <summary>Arrange tiles vertically in a column.</summary>
	Vertical,
	/// <summary>Arrange tiles in a grid pattern.</summary>
	Grid
}

/// <summary>
/// Animation frame data for CHR sprite preview.
/// </summary>
public record ChrAnimationFrame(int[] TileIndices, int DurationMs = 100, bool FlipH = false, bool FlipV = false);

/// <summary>
/// Animation sequence for multi-tile sprites.
/// </summary>
public record SpriteAnimation(
	string Name,
	List<ChrAnimationFrame> Frames,
	int SpriteWidth = 1,
	int SpriteHeight = 1,
	bool Loop = true);

/// <summary>
/// Palette cycle animation configuration.
/// </summary>
public record PaletteCycleConfig(
	int StartIndex,
	int EndIndex,
	int SpeedMs = 100,
	bool Reverse = false);

/// <summary>
/// Sprite sheet export configuration.
/// </summary>
public record SpriteSheetConfig(
	int[] TileIndices,
	SpriteSheetLayout Layout = SpriteSheetLayout.Horizontal,
	int TilesPerRow = 16,
	int TileSpacing = 0,
	bool IncludeFlippedVariants = false,
	(byte R, byte G, byte B)[]? Palette = null);

/// <summary>
/// CHR data extraction and editing for NES ROMs.
/// </summary>
public class ChrEditor {
	private readonly byte[] _data;
	private readonly int _offset;

	/// <summary>
	/// Size of one 8x8 CHR tile in bytes.
	/// </summary>
	public const int TileSize = 16;

	/// <summary>
	/// Tiles per CHR bank (8KB).
	/// </summary>
	public const int TilesPerBank = 512;

	/// <summary>
	/// Create a CHR editor from ROM data.
	/// </summary>
	public ChrEditor(byte[] data, int offset = 0, int? length = null) {
		_data = data;
		_offset = offset;
		int dataLength = length ?? (data.Length - offset);
		TileCount = dataLength / TileSize;
	}

	/// <summary>
	/// Number of tiles in the CHR data.
	/// </summary>
	public int TileCount { get; }

	/// <summary>
	/// Number of CHR banks (8KB each).
	/// </summary>
	public int BankCount => (TileCount + TilesPerBank - 1) / TilesPerBank;

	/// <summary>
	/// Get a single tile as indexed pixel data.
	/// </summary>
	public byte[,] GetTile(int index) {
		if (index < 0 || index >= TileCount) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		return Core.TileGraphics.DecodeTile(_data, _offset + (index * TileSize), Core.TileGraphics.TileFormat.Nes2Bpp);
	}

	/// <summary>
	/// Set a single tile from indexed pixel data.
	/// </summary>
	public void SetTile(int index, byte[,] pixels) {
		if (index < 0 || index >= TileCount) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		var encoded = Core.TileGraphics.EncodeTile(pixels, Core.TileGraphics.TileFormat.Nes2Bpp);
		Array.Copy(encoded, 0, _data, _offset + (index * TileSize), TileSize);
	}

	/// <summary>
	/// Get raw tile bytes.
	/// </summary>
	public byte[] GetTileBytes(int index) {
		var bytes = new byte[TileSize];
		Array.Copy(_data, _offset + (index * TileSize), bytes, 0, TileSize);
		return bytes;
	}

	/// <summary>
	/// Set raw tile bytes.
	/// </summary>
	public void SetTileBytes(int index, byte[] bytes) {
		if (bytes.Length != TileSize) {
			throw new ArgumentException($"Tile data must be {TileSize} bytes", nameof(bytes));
		}

		Array.Copy(bytes, 0, _data, _offset + (index * TileSize), TileSize);
	}

	/// <summary>
	/// Get a range of tiles.
	/// </summary>
	public List<byte[,]> GetTiles(int startIndex, int count) {
		var tiles = new List<byte[,]>();
		for (int i = 0; i < count && startIndex + i < TileCount; i++) {
			tiles.Add(GetTile(startIndex + i));
		}

		return tiles;
	}

	/// <summary>
	/// Export all tiles to a grid image data structure.
	/// </summary>
	public byte[,] ExportToGrid(int tilesPerRow = 16, (byte R, byte G, byte B)[]? palette = null) {
		palette ??= Core.Palette.DefaultNesPalette();

		int rows = (TileCount + tilesPerRow - 1) / tilesPerRow;
		int width = tilesPerRow * 8;
		int height = rows * 8;

		var result = new byte[height, width];

		for (int tileIndex = 0; tileIndex < TileCount; tileIndex++) {
			int gridX = tileIndex % tilesPerRow * 8;
			int gridY = tileIndex / tilesPerRow * 8;

			var tile = GetTile(tileIndex);

			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					result[gridY + y, gridX + x] = tile[y, x];
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Import tiles from a grid.
	/// </summary>
	public void ImportFromGrid(byte[,] grid, int tilesPerRow = 16) {
		int gridHeight = grid.GetLength(0);
		int gridWidth = grid.GetLength(1);
		int rows = gridHeight / 8;
		int cols = gridWidth / 8;

		for (int tileY = 0; tileY < rows; tileY++) {
			for (int tileX = 0; tileX < cols; tileX++) {
				int tileIndex = (tileY * tilesPerRow) + tileX;
				if (tileIndex >= TileCount) {
					return;
				}

				var tile = new byte[8, 8];
				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						tile[y, x] = grid[(tileY * 8) + y, (tileX * 8) + x];
					}
				}

				SetTile(tileIndex, tile);
			}
		}
	}

	/// <summary>
	/// Extract a CHR bank.
	/// </summary>
	public byte[] ExtractBank(int bankIndex) {
		int startTile = bankIndex * TilesPerBank;
		int tileCount = Math.Min(TilesPerBank, TileCount - startTile);
		var bankData = new byte[tileCount * TileSize];

		Array.Copy(_data, _offset + (startTile * TileSize), bankData, 0, bankData.Length);
		return bankData;
	}

	/// <summary>
	/// Replace a CHR bank.
	/// </summary>
	public void ReplaceBank(int bankIndex, byte[] bankData) {
		int startOffset = _offset + (bankIndex * TilesPerBank * TileSize);
		int length = Math.Min(bankData.Length, TilesPerBank * TileSize);

		Array.Copy(bankData, 0, _data, startOffset, length);
	}

	/// <summary>
	/// Find duplicate tiles.
	/// </summary>
	public List<(int Original, List<int> Duplicates)> FindDuplicates() {
		var tileHashes = new Dictionary<string, List<int>>();

		for (int i = 0; i < TileCount; i++) {
			var bytes = GetTileBytes(i);
			var hash = Convert.ToBase64String(bytes);

			if (!tileHashes.TryGetValue(hash, out var indices)) {
				indices = new List<int>();
				tileHashes[hash] = indices;
			}

			indices.Add(i);
		}

		return tileHashes.Values
			.Where(v => v.Count > 1)
			.Select(v => (v[0], v.Skip(1).ToList()))
			.ToList();
	}

	/// <summary>
	/// Flip a tile horizontally.
	/// </summary>
	public static byte[,] FlipHorizontal(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				result[y, 7 - x] = tile[y, x];
			}
		}

		return result;
	}

	/// <summary>
	/// Flip a tile vertically.
	/// </summary>
	public static byte[,] FlipVertical(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				result[7 - y, x] = tile[y, x];
			}
		}

		return result;
	}

	/// <summary>
	/// Rotate a tile 90 degrees clockwise.
	/// </summary>
	public static byte[,] Rotate90(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				result[x, 7 - y] = tile[y, x];
			}
		}

		return result;
	}

	#region Sprite Sheet Export

	/// <summary>
	/// Export selected tiles as a sprite sheet.
	/// </summary>
	public byte[,] ExportSpriteSheet(SpriteSheetConfig config) {
		if (config.TileIndices.Length == 0) {
			return new byte[0, 0];
		}

		var palette = config.Palette ?? Core.Palette.DefaultNesPalette();
		int tileCount = config.TileIndices.Length;

		// Calculate dimensions based on layout
		int tilesWide, tilesTall;
		switch (config.Layout) {
			case SpriteSheetLayout.Horizontal:
				tilesWide = tileCount;
				tilesTall = 1;
				if (config.IncludeFlippedVariants) {
					tilesTall = 4; // Normal, FlipH, FlipV, FlipHV
				}
				break;

			case SpriteSheetLayout.Vertical:
				tilesWide = 1;
				tilesTall = tileCount;
				if (config.IncludeFlippedVariants) {
					tilesWide = 4;
				}
				break;

			case SpriteSheetLayout.Grid:
			default:
				tilesWide = config.TilesPerRow > 0 ? config.TilesPerRow : 16;
				tilesTall = (tileCount + tilesWide - 1) / tilesWide;
				if (config.IncludeFlippedVariants) {
					tilesTall *= 4;
				}
				break;
		}

		int tileWidthWithSpacing = 8 + config.TileSpacing;
		int tileHeightWithSpacing = 8 + config.TileSpacing;
		int width = tilesWide * tileWidthWithSpacing - config.TileSpacing;
		int height = tilesTall * tileHeightWithSpacing - config.TileSpacing;

		var result = new byte[height, width];

		// Place tiles
		for (int i = 0; i < tileCount; i++) {
			int tileIndex = config.TileIndices[i];
			if (tileIndex < 0 || tileIndex >= TileCount) continue;

			var tile = GetTile(tileIndex);
			PlaceTileInSheet(result, tile, i, 0, config, tileWidthWithSpacing, tileHeightWithSpacing);

			if (config.IncludeFlippedVariants) {
				PlaceTileInSheet(result, FlipHorizontal(tile), i, 1, config, tileWidthWithSpacing, tileHeightWithSpacing);
				PlaceTileInSheet(result, FlipVertical(tile), i, 2, config, tileWidthWithSpacing, tileHeightWithSpacing);
				PlaceTileInSheet(result, FlipHorizontal(FlipVertical(tile)), i, 3, config, tileWidthWithSpacing, tileHeightWithSpacing);
			}
		}

		return result;
	}

	private void PlaceTileInSheet(byte[,] sheet, byte[,] tile, int tileNum, int variantRow,
		SpriteSheetConfig config, int tileWidthWithSpacing, int tileHeightWithSpacing) {

		int tilesPerRow = config.Layout switch {
			SpriteSheetLayout.Horizontal => config.TileIndices.Length,
			SpriteSheetLayout.Vertical => 1,
			_ => config.TilesPerRow > 0 ? config.TilesPerRow : 16
		};

		int gridX, gridY;
		if (config.Layout == SpriteSheetLayout.Vertical) {
			gridX = variantRow * tileWidthWithSpacing;
			gridY = tileNum * tileHeightWithSpacing;
		} else {
			gridX = (tileNum % tilesPerRow) * tileWidthWithSpacing;
			int baseRow = tileNum / tilesPerRow;
			if (config.IncludeFlippedVariants) {
				gridY = (baseRow * 4 + variantRow) * tileHeightWithSpacing;
			} else {
				gridY = baseRow * tileHeightWithSpacing;
			}
		}

		for (int y = 0; y < 8 && gridY + y < sheet.GetLength(0); y++) {
			for (int x = 0; x < 8 && gridX + x < sheet.GetLength(1); x++) {
				sheet[gridY + y, gridX + x] = tile[y, x];
			}
		}
	}

	/// <summary>
	/// Export sprite sheet as PNG byte data.
	/// </summary>
	public byte[] ExportSpriteSheetPng(SpriteSheetConfig config) {
		var indexed = ExportSpriteSheet(config);
		var palette = config.Palette ?? Core.Palette.DefaultNesPalette();
		return ToPngBytes(indexed, palette);
	}

	/// <summary>
	/// Export sprite sheet as BMP byte data.
	/// </summary>
	public byte[] ExportSpriteSheetBmp(SpriteSheetConfig config) {
		var indexed = ExportSpriteSheet(config);
		var palette = config.Palette ?? Core.Palette.DefaultNesPalette();
		return ToBmpBytes(indexed, palette);
	}

	#endregion

	#region Animation Preview

	/// <summary>
	/// Compose a single frame from multiple tiles arranged in a grid.
	/// </summary>
	public byte[,] ComposeFrame(int[] tileIndices, int spriteWidth, int spriteHeight,
		bool flipH = false, bool flipV = false) {

		int pixelWidth = spriteWidth * 8;
		int pixelHeight = spriteHeight * 8;
		var result = new byte[pixelHeight, pixelWidth];

		for (int ty = 0; ty < spriteHeight; ty++) {
			for (int tx = 0; tx < spriteWidth; tx++) {
				int tileListIndex = ty * spriteWidth + tx;
				if (tileListIndex >= tileIndices.Length) continue;

				int tileIndex = tileIndices[tileListIndex];
				if (tileIndex < 0 || tileIndex >= TileCount) continue;

				var tile = GetTile(tileIndex);

				// Apply flipping
				if (flipH) tile = FlipHorizontal(tile);
				if (flipV) tile = FlipVertical(tile);

				// Calculate position (flip affects placement)
				int destX = flipH ? (spriteWidth - 1 - tx) * 8 : tx * 8;
				int destY = flipV ? (spriteHeight - 1 - ty) * 8 : ty * 8;

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						if (destY + y < pixelHeight && destX + x < pixelWidth) {
							result[destY + y, destX + x] = tile[y, x];
						}
					}
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Get all frames from an animation as composed images.
	/// </summary>
	public List<byte[,]> GetAnimationFrames(SpriteAnimation animation) {
		var frames = new List<byte[,]>();

		foreach (var frame in animation.Frames) {
			var composed = ComposeFrame(frame.TileIndices, animation.SpriteWidth, animation.SpriteHeight,
				frame.FlipH, frame.FlipV);
			frames.Add(composed);
		}

		return frames;
	}

	/// <summary>
	/// Export animation frames as a sprite strip.
	/// </summary>
	public byte[,] ExportAnimationStrip(SpriteAnimation animation, bool horizontal = true, int spacing = 0) {
		var frames = GetAnimationFrames(animation);
		if (frames.Count == 0) {
			return new byte[0, 0];
		}

		int frameWidth = animation.SpriteWidth * 8;
		int frameHeight = animation.SpriteHeight * 8;

		int width, height;
		if (horizontal) {
			width = frames.Count * frameWidth + (frames.Count - 1) * spacing;
			height = frameHeight;
		} else {
			width = frameWidth;
			height = frames.Count * frameHeight + (frames.Count - 1) * spacing;
		}

		var result = new byte[height, width];

		for (int i = 0; i < frames.Count; i++) {
			var frame = frames[i];
			int offsetX = horizontal ? i * (frameWidth + spacing) : 0;
			int offsetY = horizontal ? 0 : i * (frameHeight + spacing);

			for (int y = 0; y < frameHeight; y++) {
				for (int x = 0; x < frameWidth; x++) {
					if (offsetY + y < height && offsetX + x < width) {
						result[offsetY + y, offsetX + x] = frame[y, x];
					}
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Calculate total animation duration in milliseconds.
	/// </summary>
	public static int GetAnimationDuration(SpriteAnimation animation) {
		return animation.Frames.Sum(f => f.DurationMs);
	}

	/// <summary>
	/// Get the frame at a specific time position.
	/// </summary>
	public static int GetFrameAtTime(SpriteAnimation animation, int timeMs) {
		if (animation.Frames.Count == 0) return 0;

		int totalDuration = GetAnimationDuration(animation);
		if (totalDuration == 0) return 0;

		if (animation.Loop) {
			timeMs %= totalDuration;
		} else if (timeMs >= totalDuration) {
			return animation.Frames.Count - 1;
		}

		int accumulated = 0;
		for (int i = 0; i < animation.Frames.Count; i++) {
			accumulated += animation.Frames[i].DurationMs;
			if (timeMs < accumulated) {
				return i;
			}
		}

		return animation.Frames.Count - 1;
	}

	#endregion

	#region Palette Cycling

	/// <summary>
	/// Apply palette cycling to create an animated palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] CyclePalette((byte R, byte G, byte B)[] palette,
		PaletteCycleConfig config, int step) {

		var result = new (byte R, byte G, byte B)[palette.Length];
		Array.Copy(palette, result, palette.Length);

		int cycleLength = config.EndIndex - config.StartIndex + 1;
		if (cycleLength <= 1) return result;

		int offset = config.Reverse ? -step : step;
		offset = ((offset % cycleLength) + cycleLength) % cycleLength;

		for (int i = config.StartIndex; i <= config.EndIndex; i++) {
			int sourceIndex = config.StartIndex + ((i - config.StartIndex + offset) % cycleLength);
			result[i] = palette[sourceIndex];
		}

		return result;
	}

	/// <summary>
	/// Generate all frames of a palette cycle.
	/// </summary>
	public static List<(byte R, byte G, byte B)[]> GeneratePaletteCycleFrames(
		(byte R, byte G, byte B)[] basePalette, PaletteCycleConfig config) {

		var frames = new List<(byte R, byte G, byte B)[]>();
		int cycleLength = config.EndIndex - config.StartIndex + 1;

		for (int i = 0; i < cycleLength; i++) {
			frames.Add(CyclePalette(basePalette, config, i));
		}

		return frames;
	}

	#endregion

	#region Image Export Helpers

	/// <summary>
	/// Convert indexed pixel data to PNG bytes.
	/// </summary>
	public static byte[] ToPngBytes(byte[,] indexed, (byte R, byte G, byte B)[] palette) {
		int height = indexed.GetLength(0);
		int width = indexed.GetLength(1);

		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// PNG signature
		writer.Write(new byte[] { 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a });

		// IHDR
		WriteChunk(writer, "IHDR", w => {
			w.Write(ToBigEndian(width));
			w.Write(ToBigEndian(height));
			w.Write((byte)8);  // bit depth
			w.Write((byte)3);  // color type (indexed)
			w.Write((byte)0);  // compression
			w.Write((byte)0);  // filter
			w.Write((byte)0);  // interlace
		});

		// PLTE
		WriteChunk(writer, "PLTE", w => {
			for (int i = 0; i < Math.Min(256, palette.Length); i++) {
				w.Write(palette[i].R);
				w.Write(palette[i].G);
				w.Write(palette[i].B);
			}
		});

		// IDAT
		WriteChunk(writer, "IDAT", w => {
			using var dataMs = new MemoryStream();
			using var deflate = new System.IO.Compression.DeflateStream(dataMs, System.IO.Compression.CompressionLevel.Optimal, true);

			for (int y = 0; y < height; y++) {
				deflate.WriteByte(0); // Filter byte (none)
				for (int x = 0; x < width; x++) {
					deflate.WriteByte(indexed[y, x]);
				}
			}

			deflate.Flush();
			deflate.Close();

			// Zlib header
			w.Write((byte)0x78);
			w.Write((byte)0x9c);
			w.Write(dataMs.ToArray());

			// Adler32
			uint adler = ComputeAdler32(indexed);
			w.Write(ToBigEndian((int)adler));
		});

		// IEND
		WriteChunk(writer, "IEND", _ => { });

		return ms.ToArray();
	}

	/// <summary>
	/// Convert indexed pixel data to BMP bytes.
	/// </summary>
	public static byte[] ToBmpBytes(byte[,] indexed, (byte R, byte G, byte B)[] palette) {
		int height = indexed.GetLength(0);
		int width = indexed.GetLength(1);
		int rowSize = ((width + 3) / 4) * 4; // BMP rows are 4-byte aligned
		int imageSize = rowSize * height;
		int paletteSize = 256 * 4;
		int fileSize = 54 + paletteSize + imageSize;

		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// BMP Header
		writer.Write(new byte[] { 0x42, 0x4d }); // "BM"
		writer.Write(fileSize);
		writer.Write((short)0); // Reserved
		writer.Write((short)0); // Reserved
		writer.Write(54 + paletteSize); // Pixel data offset

		// DIB Header (BITMAPINFOHEADER)
		writer.Write(40); // Header size
		writer.Write(width);
		writer.Write(height);
		writer.Write((short)1); // Color planes
		writer.Write((short)8); // Bits per pixel
		writer.Write(0); // Compression (none)
		writer.Write(imageSize);
		writer.Write(2835); // Horizontal resolution (72 DPI)
		writer.Write(2835); // Vertical resolution
		writer.Write(256); // Colors in palette
		writer.Write(0); // Important colors

		// Palette (BGRA format)
		for (int i = 0; i < 256; i++) {
			if (i < palette.Length) {
				writer.Write(palette[i].B);
				writer.Write(palette[i].G);
				writer.Write(palette[i].R);
				writer.Write((byte)0);
			} else {
				writer.Write(new byte[] { 0, 0, 0, 0 });
			}
		}

		// Pixel data (bottom-up)
		for (int y = height - 1; y >= 0; y--) {
			for (int x = 0; x < width; x++) {
				writer.Write(indexed[y, x]);
			}
			// Padding
			for (int p = width; p < rowSize; p++) {
				writer.Write((byte)0);
			}
		}

		return ms.ToArray();
	}

	private static void WriteChunk(BinaryWriter writer, string type, Action<BinaryWriter> writeData) {
		using var chunkMs = new MemoryStream();
		using var chunkWriter = new BinaryWriter(chunkMs);
		writeData(chunkWriter);
		chunkWriter.Flush();
		var data = chunkMs.ToArray();

		writer.Write(ToBigEndian(data.Length));
		var typeBytes = System.Text.Encoding.ASCII.GetBytes(type);
		writer.Write(typeBytes);
		writer.Write(data);

		// CRC32
		var crcData = new byte[4 + data.Length];
		Array.Copy(typeBytes, 0, crcData, 0, 4);
		Array.Copy(data, 0, crcData, 4, data.Length);
		uint crc = ComputeCrc32(crcData);
		writer.Write(ToBigEndian((int)crc));
	}

	private static byte[] ToBigEndian(int value) {
		var bytes = BitConverter.GetBytes(value);
		if (BitConverter.IsLittleEndian) {
			Array.Reverse(bytes);
		}
		return bytes;
	}

	private static uint ComputeCrc32(byte[] data) {
		uint crc = 0xffffffff;
		foreach (byte b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				crc = (crc >> 1) ^ ((crc & 1) == 1 ? 0xedb88320u : 0);
			}
		}
		return ~crc;
	}

	private static uint ComputeAdler32(byte[,] data) {
		uint a = 1, b = 0;
		int height = data.GetLength(0);
		int width = data.GetLength(1);

		for (int y = 0; y < height; y++) {
			a = (a + 0) % 65521; b = (b + a) % 65521; // Filter byte
			for (int x = 0; x < width; x++) {
				a = (a + data[y, x]) % 65521;
				b = (b + a) % 65521;
			}
		}

		return (b << 16) | a;
	}

	#endregion

	#region Mirror/Rotation Preview

	/// <summary>
	/// Create a preview grid showing all transformation variants of a tile.
	/// </summary>
	public byte[,] CreateTransformPreview(int tileIndex, int spacing = 1) {
		if (tileIndex < 0 || tileIndex >= TileCount) {
			return new byte[0, 0];
		}

		var tile = GetTile(tileIndex);

		// Create 2x4 grid: Original, FlipH, FlipV, FlipHV, Rot90, Rot180, Rot270, Rot360
		int cellSize = 8 + spacing;
		int width = 4 * cellSize - spacing;
		int height = 2 * cellSize - spacing;
		var result = new byte[height, width];

		// First row: Original, FlipH, FlipV, FlipHV
		// Second row: Original, Rot90, Rot180, Rot270
		var row1 = new[] { tile, FlipHorizontal(tile), FlipVertical(tile), FlipHorizontal(FlipVertical(tile)) };
		var row2 = new[] { tile, Rotate90(tile), Rotate90(Rotate90(tile)), Rotate90(Rotate90(Rotate90(tile))) };

		for (int col = 0; col < 4; col++) {
			// Row 0
			var variant0 = row1[col];
			int offsetX = col * cellSize;
			int offsetY = 0;
			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					result[offsetY + y, offsetX + x] = variant0[y, x];
				}
			}

			// Row 1
			var variant1 = row2[col];
			offsetY = cellSize;
			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					result[offsetY + y, offsetX + x] = variant1[y, x];
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Rotate a tile 180 degrees.
	/// </summary>
	public static byte[,] Rotate180(byte[,] tile) {
		return FlipHorizontal(FlipVertical(tile));
	}

	/// <summary>
	/// Rotate a tile 270 degrees clockwise (90 counter-clockwise).
	/// </summary>
	public static byte[,] Rotate270(byte[,] tile) {
		return Rotate90(Rotate90(Rotate90(tile)));
	}

	#endregion
}
