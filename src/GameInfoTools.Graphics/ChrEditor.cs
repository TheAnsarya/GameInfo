namespace GameInfoTools.Graphics;

/// <summary>
/// CHR data extraction and editing for NES ROMs.
/// </summary>
public class ChrEditor {
	private readonly byte[] _data;
	private readonly int _offset;
	private readonly int _tileCount;

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
		int dataLength = length ?? data.Length - offset;
		_tileCount = dataLength / TileSize;
	}

	/// <summary>
	/// Number of tiles in the CHR data.
	/// </summary>
	public int TileCount => _tileCount;

	/// <summary>
	/// Number of CHR banks (8KB each).
	/// </summary>
	public int BankCount => (_tileCount + TilesPerBank - 1) / TilesPerBank;

	/// <summary>
	/// Get a single tile as indexed pixel data.
	/// </summary>
	public byte[,] GetTile(int index) {
		if (index < 0 || index >= _tileCount) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		return Core.TileGraphics.DecodeTile(_data, _offset + index * TileSize, Core.TileGraphics.TileFormat.Nes2Bpp);
	}

	/// <summary>
	/// Set a single tile from indexed pixel data.
	/// </summary>
	public void SetTile(int index, byte[,] pixels) {
		if (index < 0 || index >= _tileCount) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		var encoded = Core.TileGraphics.EncodeTile(pixels, Core.TileGraphics.TileFormat.Nes2Bpp);
		Array.Copy(encoded, 0, _data, _offset + index * TileSize, TileSize);
	}

	/// <summary>
	/// Get raw tile bytes.
	/// </summary>
	public byte[] GetTileBytes(int index) {
		var bytes = new byte[TileSize];
		Array.Copy(_data, _offset + index * TileSize, bytes, 0, TileSize);
		return bytes;
	}

	/// <summary>
	/// Set raw tile bytes.
	/// </summary>
	public void SetTileBytes(int index, byte[] bytes) {
		if (bytes.Length != TileSize) {
			throw new ArgumentException($"Tile data must be {TileSize} bytes", nameof(bytes));
		}
		Array.Copy(bytes, 0, _data, _offset + index * TileSize, TileSize);
	}

	/// <summary>
	/// Get a range of tiles.
	/// </summary>
	public List<byte[,]> GetTiles(int startIndex, int count) {
		var tiles = new List<byte[,]>();
		for (int i = 0; i < count && startIndex + i < _tileCount; i++) {
			tiles.Add(GetTile(startIndex + i));
		}
		return tiles;
	}

	/// <summary>
	/// Export all tiles to a grid image data structure.
	/// </summary>
	public byte[,] ExportToGrid(int tilesPerRow = 16, (byte R, byte G, byte B)[]? palette = null) {
		palette ??= Core.Palette.DefaultNesPalette();

		int rows = (_tileCount + tilesPerRow - 1) / tilesPerRow;
		int width = tilesPerRow * 8;
		int height = rows * 8;

		var result = new byte[height, width];

		for (int tileIndex = 0; tileIndex < _tileCount; tileIndex++) {
			int gridX = (tileIndex % tilesPerRow) * 8;
			int gridY = (tileIndex / tilesPerRow) * 8;

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
				int tileIndex = tileY * tilesPerRow + tileX;
				if (tileIndex >= _tileCount) {
					return;
				}

				var tile = new byte[8, 8];
				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						tile[y, x] = grid[tileY * 8 + y, tileX * 8 + x];
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
		int tileCount = Math.Min(TilesPerBank, _tileCount - startTile);
		var bankData = new byte[tileCount * TileSize];

		Array.Copy(_data, _offset + startTile * TileSize, bankData, 0, bankData.Length);
		return bankData;
	}

	/// <summary>
	/// Replace a CHR bank.
	/// </summary>
	public void ReplaceBank(int bankIndex, byte[] bankData) {
		int startOffset = _offset + bankIndex * TilesPerBank * TileSize;
		int length = Math.Min(bankData.Length, TilesPerBank * TileSize);

		Array.Copy(bankData, 0, _data, startOffset, length);
	}

	/// <summary>
	/// Find duplicate tiles.
	/// </summary>
	public List<(int Original, List<int> Duplicates)> FindDuplicates() {
		var tileHashes = new Dictionary<string, List<int>>();

		for (int i = 0; i < _tileCount; i++) {
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
}
