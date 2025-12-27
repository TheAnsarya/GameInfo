using DarkReposEditor.Core.Interfaces;

namespace DarkReposEditor.Core.Services;

/// <summary>
/// Service for editing game maps, tilemaps, and level data.
/// </summary>
public class MapEditorService : IMapEditorService
{
	public Tileset LoadTileset(byte[] data, int offset, int tileCount, MapTileFormat format)
	{
		var tileset = new Tileset
		{
			Offset = offset,
			Format = format,
			TileWidth = 8,
			TileHeight = 8
		};

		var bytesPerTile = GetBytesPerTile(format);
		var pos = offset;

		for (int i = 0; i < tileCount && pos + bytesPerTile <= data.Length; i++)
		{
			var rawBytes = new byte[bytesPerTile];
			Array.Copy(data, pos, rawBytes, 0, bytesPerTile);

			var pixels = DecodeTileGraphics(rawBytes, format);

			tileset.Tiles.Add(new TileGraphics
			{
				Index = i,
				RawBytes = rawBytes,
				PixelData = pixels
			});

			pos += bytesPerTile;
		}

		return tileset;
	}

	public TileMap LoadMap(byte[] data, int offset, int width, int height, MapFormat format)
	{
		var map = new TileMap
		{
			Offset = offset,
			Width = width,
			Height = height,
			Format = format,
			Tiles = new MapTile[width, height]
		};

		// Initialize all tiles
		for (int y = 0; y < height; y++)
		{
			for (int x = 0; x < width; x++)
			{
				map.Tiles[x, y] = new MapTile();
			}
		}

		switch (format)
		{
			case MapFormat.Linear:
				LoadLinearMap(data, offset, map);
				break;

			case MapFormat.NesNametable:
				LoadNesNametable(data, offset, map);
				break;

			case MapFormat.SnesTilemap:
				LoadSnesTilemap(data, offset, map);
				break;

			case MapFormat.GbBackground:
				LoadGbBackground(data, offset, map);
				break;

			case MapFormat.GenesisPlane:
				LoadGenesisPlane(data, offset, map);
				break;

			case MapFormat.GbaTilemap:
				LoadGbaTilemap(data, offset, map);
				break;

			case MapFormat.ColumnMajor:
				LoadColumnMajorMap(data, offset, map);
				break;

			case MapFormat.Block2x2:
				LoadBlock2x2Map(data, offset, map);
				break;

			case MapFormat.CompressedRle:
				var decompressed = DecompressRle(data, offset, width * height);
				LoadLinearMap(decompressed, 0, map);
				break;

			case MapFormat.CompressedLzss:
				var decompLzss = DecompressLzss(data, offset);
				LoadLinearMap(decompLzss, 0, map);
				break;
		}

		return map;
	}

	public MetaTileMap LoadMetaTileMap(byte[] data, int offset, int width, int height, MetaTileFormat format)
	{
		var map = new MetaTileMap
		{
			Offset = offset,
			Width = width,
			Height = height,
			MetaTiles = new int[width, height]
		};

		var pos = offset;
		for (int y = 0; y < height; y++)
		{
			for (int x = 0; x < width; x++)
			{
				if (pos < data.Length)
				{
					map.MetaTiles[x, y] = data[pos++];
				}
			}
		}

		return map;
	}

	public byte[] ExportTileset(Tileset tileset)
	{
		var result = new List<byte>();

		foreach (var MapTile in tileset.Tiles)
		{
			result.AddRange(MapTile.RawBytes);
		}

		return result.ToArray();
	}

	public byte[] ExportMap(TileMap map, MapFormat format)
	{
		return format switch
		{
			MapFormat.Linear => ExportLinearMap(map),
			MapFormat.NesNametable => ExportNesNametable(map),
			MapFormat.SnesTilemap => ExportSnesTilemap(map),
			MapFormat.GbBackground => ExportGbBackground(map),
			MapFormat.GenesisPlane => ExportGenesisPlane(map),
			MapFormat.GbaTilemap => ExportGbaTilemap(map),
			MapFormat.ColumnMajor => ExportColumnMajorMap(map),
			_ => ExportLinearMap(map)
		};
	}

	public void ImportTileset(byte[] data, Tileset tileset)
	{
		var bytesPerTile = GetBytesPerTile(tileset.Format);
		var pos = 0;

		for (int i = 0; i < tileset.Tiles.Count && pos + bytesPerTile <= data.Length; i++)
		{
			var rawBytes = new byte[bytesPerTile];
			Array.Copy(data, pos, rawBytes, 0, bytesPerTile);

			tileset.Tiles[i].RawBytes = rawBytes;
			tileset.Tiles[i].PixelData = DecodeTileGraphics(rawBytes, tileset.Format);

			pos += bytesPerTile;
		}
	}

	public void ImportMap(byte[] data, TileMap map, MapFormat format)
	{
		switch (format)
		{
			case MapFormat.Linear:
				LoadLinearMap(data, 0, map);
				break;
			case MapFormat.NesNametable:
				LoadNesNametable(data, 0, map);
				break;
			case MapFormat.SnesTilemap:
				LoadSnesTilemap(data, 0, map);
				break;
			default:
				LoadLinearMap(data, 0, map);
				break;
		}

		map.IsModified = true;
	}

	public MapTile GetTile(TileMap map, int x, int y)
	{
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height)
			return new MapTile();

		return map.Tiles[x, y];
	}

	public void SetTile(TileMap map, int x, int y, MapTile MapTile)
	{
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height)
			return;

		map.Tiles[x, y] = MapTile;
		map.IsModified = true;
	}

	public void FillRegion(TileMap map, int x, int y, int width, int height, MapTile MapTile)
	{
		for (int dy = 0; dy < height; dy++)
		{
			for (int dx = 0; dx < width; dx++)
			{
				var tx = x + dx;
				var ty = y + dy;

				if (tx >= 0 && tx < map.Width && ty >= 0 && ty < map.Height)
				{
					map.Tiles[tx, ty] = new MapTile
					{
						TileIndex = MapTile.TileIndex,
						PaletteIndex = MapTile.PaletteIndex,
						FlipX = MapTile.FlipX,
						FlipY = MapTile.FlipY,
						Priority = MapTile.Priority,
						Attributes = MapTile.Attributes
					};
				}
			}
		}

		map.IsModified = true;
	}

	public void FloodFill(TileMap map, int x, int y, MapTile newTile)
	{
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height)
			return;

		var targetTile = map.Tiles[x, y].TileIndex;

		// Don't fill if clicking on same MapTile
		if (targetTile == newTile.TileIndex)
			return;

		var stack = new Stack<(int X, int Y)>();
		stack.Push((x, y));

		var visited = new HashSet<(int, int)>();

		while (stack.Count > 0)
		{
			var (cx, cy) = stack.Pop();

			if (cx < 0 || cx >= map.Width || cy < 0 || cy >= map.Height)
				continue;

			if (visited.Contains((cx, cy)))
				continue;

			if (map.Tiles[cx, cy].TileIndex != targetTile)
				continue;

			visited.Add((cx, cy));

			map.Tiles[cx, cy] = new MapTile
			{
				TileIndex = newTile.TileIndex,
				PaletteIndex = newTile.PaletteIndex,
				FlipX = newTile.FlipX,
				FlipY = newTile.FlipY,
				Priority = newTile.Priority,
				Attributes = newTile.Attributes
			};

			// Add neighbors
			stack.Push((cx + 1, cy));
			stack.Push((cx - 1, cy));
			stack.Push((cx, cy + 1));
			stack.Push((cx, cy - 1));
		}

		map.IsModified = true;
	}

	public TileRegion CopyRegion(TileMap map, int x, int y, int width, int height)
	{
		var region = new TileRegion
		{
			Width = width,
			Height = height,
			Tiles = new MapTile[width, height]
		};

		for (int dy = 0; dy < height; dy++)
		{
			for (int dx = 0; dx < width; dx++)
			{
				var sx = x + dx;
				var sy = y + dy;

				if (sx >= 0 && sx < map.Width && sy >= 0 && sy < map.Height)
				{
					var src = map.Tiles[sx, sy];
					region.Tiles[dx, dy] = new MapTile
					{
						TileIndex = src.TileIndex,
						PaletteIndex = src.PaletteIndex,
						FlipX = src.FlipX,
						FlipY = src.FlipY,
						Priority = src.Priority,
						Attributes = src.Attributes
					};
				}
				else
				{
					region.Tiles[dx, dy] = new MapTile();
				}
			}
		}

		return region;
	}

	public void PasteRegion(TileMap map, int x, int y, TileRegion region)
	{
		for (int dy = 0; dy < region.Height; dy++)
		{
			for (int dx = 0; dx < region.Width; dx++)
			{
				var tx = x + dx;
				var ty = y + dy;

				if (tx >= 0 && tx < map.Width && ty >= 0 && ty < map.Height)
				{
					var src = region.Tiles[dx, dy];
					map.Tiles[tx, ty] = new MapTile
					{
						TileIndex = src.TileIndex,
						PaletteIndex = src.PaletteIndex,
						FlipX = src.FlipX,
						FlipY = src.FlipY,
						Priority = src.Priority,
						Attributes = src.Attributes
					};
				}
			}
		}

		map.IsModified = true;
	}

	public MapValidationResult ValidateMap(TileMap map, Tileset tileset)
	{
		var result = new MapValidationResult { IsValid = true };
		var usedTiles = new HashSet<int>();
		var maxIndex = 0;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				var MapTile = map.Tiles[x, y];
				usedTiles.Add(MapTile.TileIndex);
				maxIndex = Math.Max(maxIndex, MapTile.TileIndex);

				if (MapTile.TileIndex >= tileset.Tiles.Count)
				{
					result.Errors.Add($"MapTile at ({x}, {y}) references invalid MapTile index {MapTile.TileIndex}");
					result.IsValid = false;
				}

				if (MapTile.PaletteIndex < 0 || MapTile.PaletteIndex > 7)
				{
					result.Warnings.Add($"MapTile at ({x}, {y}) has unusual MapPalette index {MapTile.PaletteIndex}");
				}
			}
		}

		result.UniqueTilesUsed = usedTiles.Count;
		result.MaxTileIndex = maxIndex;

		return result;
	}

	public byte[] DecompressRle(byte[] data, int offset, int decompressedSize)
	{
		var result = new List<byte>();
		var pos = offset;

		while (result.Count < decompressedSize && pos < data.Length)
		{
			var cmd = data[pos++];

			if (pos >= data.Length)
				break;

			if ((cmd & 0x80) != 0)
			{
				// Run of repeated bytes
				var count = (cmd & 0x7f) + 1;
				var value = data[pos++];

				for (int i = 0; i < count && result.Count < decompressedSize; i++)
				{
					result.Add(value);
				}
			}
			else
			{
				// Literal bytes
				var count = cmd + 1;

				for (int i = 0; i < count && pos < data.Length && result.Count < decompressedSize; i++)
				{
					result.Add(data[pos++]);
				}
			}
		}

		return result.ToArray();
	}

	public byte[] CompressRle(byte[] data)
	{
		var result = new List<byte>();
		var pos = 0;

		while (pos < data.Length)
		{
			// Look for runs
			var runStart = pos;
			var runByte = data[pos];
			var runLength = 1;

			while (pos + runLength < data.Length &&
				   data[pos + runLength] == runByte &&
				   runLength < 128)
			{
				runLength++;
			}

			if (runLength >= 3)
			{
				// Output run
				result.Add((byte)(0x80 | (runLength - 1)));
				result.Add(runByte);
				pos += runLength;
			}
			else
			{
				// Look for literal sequence
				var literalStart = pos;
				var literalLength = 0;

				while (pos + literalLength < data.Length && literalLength < 128)
				{
					// Check if a run is starting
					if (pos + literalLength + 2 < data.Length)
					{
						var b = data[pos + literalLength];
						if (data[pos + literalLength + 1] == b &&
							data[pos + literalLength + 2] == b)
						{
							break; // Run starting
						}
					}

					literalLength++;
				}

				if (literalLength > 0)
				{
					result.Add((byte)(literalLength - 1));
					for (int i = 0; i < literalLength; i++)
					{
						result.Add(data[pos + i]);
					}
					pos += literalLength;
				}
			}
		}

		return result.ToArray();
	}

	public byte[] DecompressLzss(byte[] data, int offset)
	{
		var result = new List<byte>();
		var pos = offset;

		// Read decompressed size (4 bytes, little-endian)
		if (pos + 4 > data.Length)
			return result.ToArray();

		var size = data[pos] | (data[pos + 1] << 8) | (data[pos + 2] << 16) | (data[pos + 3] << 24);
		pos += 4;

		while (result.Count < size && pos < data.Length)
		{
			var flags = data[pos++];

			for (int bit = 0; bit < 8 && result.Count < size && pos < data.Length; bit++)
			{
				if ((flags & (1 << bit)) != 0)
				{
					// Reference to previous data
					if (pos + 1 >= data.Length)
						break;

					var lo = data[pos++];
					var hi = data[pos++];

					var length = ((hi >> 4) & 0x0f) + 3;
					var distance = ((hi & 0x0f) << 8) | lo;

					var srcPos = result.Count - distance - 1;

					for (int i = 0; i < length && result.Count < size; i++)
					{
						if (srcPos >= 0 && srcPos < result.Count)
						{
							result.Add(result[srcPos + i]);
						}
						else
						{
							result.Add(0);
						}
					}
				}
				else
				{
					// Literal byte
					result.Add(data[pos++]);
				}
			}
		}

		return result.ToArray();
	}

	public byte[] CompressLzss(byte[] data)
	{
		var result = new List<byte>();

		// Write size header
		result.Add((byte)(data.Length & 0xff));
		result.Add((byte)((data.Length >> 8) & 0xff));
		result.Add((byte)((data.Length >> 16) & 0xff));
		result.Add((byte)((data.Length >> 24) & 0xff));

		var pos = 0;
		while (pos < data.Length)
		{
			var flagByte = 0;
			var chunk = new List<byte>();

			for (int bit = 0; bit < 8 && pos < data.Length; bit++)
			{
				// Look for match in window
				var bestLength = 0;
				var bestDistance = 0;

				var windowStart = Math.Max(0, pos - 4096);

				for (int windowPos = windowStart; windowPos < pos; windowPos++)
				{
					var matchLen = 0;
					while (pos + matchLen < data.Length &&
						   matchLen < 18 &&
						   data[windowPos + matchLen] == data[pos + matchLen])
					{
						matchLen++;
						if (windowPos + matchLen >= pos)
							break;
					}

					if (matchLen >= 3 && matchLen > bestLength)
					{
						bestLength = matchLen;
						bestDistance = pos - windowPos - 1;
					}
				}

				if (bestLength >= 3)
				{
					// Output reference
					flagByte |= (1 << bit);
					chunk.Add((byte)(bestDistance & 0xff));
					chunk.Add((byte)(((bestLength - 3) << 4) | ((bestDistance >> 8) & 0x0f)));
					pos += bestLength;
				}
				else
				{
					// Output literal
					chunk.Add(data[pos++]);
				}
			}

			result.Add((byte)flagByte);
			result.AddRange(chunk);
		}

		return result.ToArray();
	}

	public byte[] RenderMapToPng(TileMap map, Tileset tileset, MapPalette MapPalette)
	{
		// Calculate image dimensions
		var imgWidth = map.Width * tileset.TileWidth;
		var imgHeight = map.Height * tileset.TileHeight;

		// Create ARGB pixel buffer
		var pixels = new uint[imgWidth * imgHeight];

		// Render each MapTile
		for (int ty = 0; ty < map.Height; ty++)
		{
			for (int tx = 0; tx < map.Width; tx++)
			{
				var MapTile = map.Tiles[tx, ty];

				if (MapTile.TileIndex < 0 || MapTile.TileIndex >= tileset.Tiles.Count)
					continue;

				var tileGfx = tileset.Tiles[MapTile.TileIndex];
				RenderTile(pixels, imgWidth, tx * tileset.TileWidth, ty * tileset.TileHeight,
						   tileGfx, tileset, MapPalette, MapTile);
			}
		}

		// Convert to PNG
		return EncodeToPng(pixels, imgWidth, imgHeight);
	}

	public byte[] RenderTileToPng(MapTile MapTile, Tileset tileset, MapPalette MapPalette, int scale = 1)
	{
		if (MapTile.TileIndex < 0 || MapTile.TileIndex >= tileset.Tiles.Count)
			return [];

		var tileGfx = tileset.Tiles[MapTile.TileIndex];
		var width = tileset.TileWidth * scale;
		var height = tileset.TileHeight * scale;
		var pixels = new uint[width * height];

		for (int y = 0; y < tileset.TileHeight; y++)
		{
			for (int x = 0; x < tileset.TileWidth; x++)
			{
				var sx = MapTile.FlipX ? (tileset.TileWidth - 1 - x) : x;
				var sy = MapTile.FlipY ? (tileset.TileHeight - 1 - y) : y;
				var pixelIndex = sy * tileset.TileWidth + sx;

				if (pixelIndex < tileGfx.PixelData.Length)
				{
					var colorIndex = tileGfx.PixelData[pixelIndex];
					var paletteOffset = MapTile.PaletteIndex * 16;
					var finalIndex = paletteOffset + colorIndex;

					uint color = 0xff000000; // Default to black
					if (finalIndex < MapPalette.Colors.Length)
					{
						color = MapPalette.Colors[finalIndex];
						if (colorIndex == 0 && MapPalette.TransparentIndex0)
						{
							color = 0x00000000; // Transparent
						}
					}

					// Fill scaled pixels
					for (int dy = 0; dy < scale; dy++)
					{
						for (int dx = 0; dx < scale; dx++)
						{
							var px = x * scale + dx;
							var py = y * scale + dy;
							pixels[py * width + px] = color;
						}
					}
				}
			}
		}

		return EncodeToPng(pixels, width, height);
	}

	#region Private Methods

	private static int GetBytesPerTile(MapTileFormat format)
	{
		return format switch
		{
			MapTileFormat.Nes2Bpp => 16,
			MapTileFormat.Snes4Bpp => 32,
			MapTileFormat.Snes8Bpp => 64,
			MapTileFormat.Gb2Bpp => 16,
			MapTileFormat.Genesis4Bpp => 32,
			MapTileFormat.Gba4Bpp => 32,
			MapTileFormat.Gba8Bpp => 64,
			MapTileFormat.Linear1Bpp => 8,
			_ => 16
		};
	}

	private static byte[] DecodeTileGraphics(byte[] rawBytes, MapTileFormat format)
	{
		return format switch
		{
			MapTileFormat.Nes2Bpp => DecodeNes2Bpp(rawBytes),
			MapTileFormat.Snes4Bpp => DecodeSnes4Bpp(rawBytes),
			MapTileFormat.Gb2Bpp => DecodeGb2Bpp(rawBytes),
			MapTileFormat.Genesis4Bpp => DecodeGenesis4Bpp(rawBytes),
			MapTileFormat.Gba4Bpp => DecodeGba4Bpp(rawBytes),
			MapTileFormat.Gba8Bpp => rawBytes, // Already linear
			MapTileFormat.Linear1Bpp => Decode1Bpp(rawBytes),
			_ => DecodeNes2Bpp(rawBytes)
		};
	}

	private static byte[] DecodeNes2Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int y = 0; y < 8; y++)
		{
			var plane0 = raw[y];
			var plane1 = raw[y + 8];

			for (int x = 0; x < 8; x++)
			{
				var bit0 = (plane0 >> (7 - x)) & 1;
				var bit1 = (plane1 >> (7 - x)) & 1;
				pixels[y * 8 + x] = (byte)((bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	private static byte[] DecodeSnes4Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int y = 0; y < 8; y++)
		{
			var plane0 = raw[y * 2];
			var plane1 = raw[y * 2 + 1];
			var plane2 = raw[y * 2 + 16];
			var plane3 = raw[y * 2 + 17];

			for (int x = 0; x < 8; x++)
			{
				var bit0 = (plane0 >> (7 - x)) & 1;
				var bit1 = (plane1 >> (7 - x)) & 1;
				var bit2 = (plane2 >> (7 - x)) & 1;
				var bit3 = (plane3 >> (7 - x)) & 1;
				pixels[y * 8 + x] = (byte)((bit3 << 3) | (bit2 << 2) | (bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	private static byte[] DecodeGb2Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int y = 0; y < 8; y++)
		{
			var plane0 = raw[y * 2];
			var plane1 = raw[y * 2 + 1];

			for (int x = 0; x < 8; x++)
			{
				var bit0 = (plane0 >> (7 - x)) & 1;
				var bit1 = (plane1 >> (7 - x)) & 1;
				pixels[y * 8 + x] = (byte)((bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	private static byte[] DecodeGenesis4Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int i = 0; i < 32; i++)
		{
			var b = raw[i];
			pixels[i * 2] = (byte)((b >> 4) & 0x0f);
			pixels[i * 2 + 1] = (byte)(b & 0x0f);
		}

		return pixels;
	}

	private static byte[] DecodeGba4Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int i = 0; i < 32; i++)
		{
			var b = raw[i];
			pixels[i * 2] = (byte)(b & 0x0f);
			pixels[i * 2 + 1] = (byte)((b >> 4) & 0x0f);
		}

		return pixels;
	}

	private static byte[] Decode1Bpp(byte[] raw)
	{
		var pixels = new byte[64];

		for (int y = 0; y < 8; y++)
		{
			var b = raw[y];
			for (int x = 0; x < 8; x++)
			{
				pixels[y * 8 + x] = (byte)((b >> (7 - x)) & 1);
			}
		}

		return pixels;
	}

	private void LoadLinearMap(byte[] data, int offset, TileMap map)
	{
		var pos = offset;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				if (pos < data.Length)
				{
					map.Tiles[x, y].TileIndex = data[pos++];
				}
			}
		}
	}

	private void LoadNesNametable(byte[] data, int offset, TileMap map)
	{
		// NES nametable: 32x30 tiles + 64 bytes attributes
		var pos = offset;

		// Load MapTile data
		for (int y = 0; y < map.Height && y < 30; y++)
		{
			for (int x = 0; x < map.Width && x < 32; x++)
			{
				if (pos < data.Length)
				{
					map.Tiles[x, y].TileIndex = data[pos++];
				}
			}
		}

		// Load attribute data
		if (pos + 64 <= data.Length)
		{
			map.AttributeData = new byte[64];
			Array.Copy(data, pos, map.AttributeData, 0, 64);

			// Apply attributes to tiles
			for (int ay = 0; ay < 8; ay++)
			{
				for (int ax = 0; ax < 8; ax++)
				{
					var attr = map.AttributeData[ay * 8 + ax];

					// Each attribute byte covers 4x4 tiles
					for (int ty = 0; ty < 4; ty++)
					{
						for (int tx = 0; tx < 4; tx++)
						{
							var mx = ax * 4 + tx;
							var my = ay * 4 + ty;

							if (mx < map.Width && my < map.Height)
							{
								// Get 2-bit MapPalette for this 2x2 block
								var blockX = tx / 2;
								var blockY = ty / 2;
								var shift = (blockY * 2 + blockX) * 2;
								var MapPalette = (attr >> shift) & 0x03;

								map.Tiles[mx, my].PaletteIndex = MapPalette;
								map.Tiles[mx, my].Attributes = (byte)MapPalette;
							}
						}
					}
				}
			}
		}
	}

	private void LoadSnesTilemap(byte[] data, int offset, TileMap map)
	{
		var pos = offset;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				if (pos + 1 < data.Length)
				{
					var lo = data[pos++];
					var hi = data[pos++];

					var word = lo | (hi << 8);

					map.Tiles[x, y].TileIndex = word & 0x03ff;
					map.Tiles[x, y].PaletteIndex = (word >> 10) & 0x07;
					map.Tiles[x, y].Priority = (word >> 13) & 0x01;
					map.Tiles[x, y].FlipX = (word & 0x4000) != 0;
					map.Tiles[x, y].FlipY = (word & 0x8000) != 0;
					map.Tiles[x, y].Attributes = hi;
				}
			}
		}
	}

	private void LoadGbBackground(byte[] data, int offset, TileMap map)
	{
		// Game Boy background: simple linear layout, usually 32x32
		LoadLinearMap(data, offset, map);
	}

	private void LoadGenesisPlane(byte[] data, int offset, TileMap map)
	{
		var pos = offset;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				if (pos + 1 < data.Length)
				{
					var hi = data[pos++];
					var lo = data[pos++];

					var word = (hi << 8) | lo;

					map.Tiles[x, y].TileIndex = word & 0x07ff;
					map.Tiles[x, y].FlipX = (word & 0x0800) != 0;
					map.Tiles[x, y].FlipY = (word & 0x1000) != 0;
					map.Tiles[x, y].PaletteIndex = (word >> 13) & 0x03;
					map.Tiles[x, y].Priority = (word >> 15) & 0x01;
				}
			}
		}
	}

	private void LoadGbaTilemap(byte[] data, int offset, TileMap map)
	{
		var pos = offset;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				if (pos + 1 < data.Length)
				{
					var lo = data[pos++];
					var hi = data[pos++];

					var word = lo | (hi << 8);

					map.Tiles[x, y].TileIndex = word & 0x03ff;
					map.Tiles[x, y].FlipX = (word & 0x0400) != 0;
					map.Tiles[x, y].FlipY = (word & 0x0800) != 0;
					map.Tiles[x, y].PaletteIndex = (word >> 12) & 0x0f;
				}
			}
		}
	}

	private void LoadColumnMajorMap(byte[] data, int offset, TileMap map)
	{
		var pos = offset;

		for (int x = 0; x < map.Width; x++)
		{
			for (int y = 0; y < map.Height; y++)
			{
				if (pos < data.Length)
				{
					map.Tiles[x, y].TileIndex = data[pos++];
				}
			}
		}
	}

	private void LoadBlock2x2Map(byte[] data, int offset, TileMap map)
	{
		// Load as 2x2 blocks
		var pos = offset;
		var blockWidth = map.Width / 2;
		var blockHeight = map.Height / 2;

		for (int by = 0; by < blockHeight; by++)
		{
			for (int bx = 0; bx < blockWidth; bx++)
			{
				for (int ty = 0; ty < 2; ty++)
				{
					for (int tx = 0; tx < 2; tx++)
					{
						var mx = bx * 2 + tx;
						var my = by * 2 + ty;

						if (pos < data.Length && mx < map.Width && my < map.Height)
						{
							map.Tiles[mx, my].TileIndex = data[pos++];
						}
					}
				}
			}
		}
	}

	private byte[] ExportLinearMap(TileMap map)
	{
		var result = new byte[map.Width * map.Height];
		var pos = 0;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				result[pos++] = (byte)map.Tiles[x, y].TileIndex;
			}
		}

		return result;
	}

	private byte[] ExportNesNametable(TileMap map)
	{
		var result = new byte[32 * 30 + 64];

		// Export MapTile data
		var pos = 0;
		for (int y = 0; y < 30; y++)
		{
			for (int x = 0; x < 32; x++)
			{
				if (x < map.Width && y < map.Height)
				{
					result[pos] = (byte)map.Tiles[x, y].TileIndex;
				}
				pos++;
			}
		}

		// Export attributes
		if (map.AttributeData != null)
		{
			Array.Copy(map.AttributeData, 0, result, 960, 64);
		}

		return result;
	}

	private byte[] ExportSnesTilemap(TileMap map)
	{
		var result = new byte[map.Width * map.Height * 2];
		var pos = 0;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				var MapTile = map.Tiles[x, y];
				var word = (MapTile.TileIndex & 0x03ff) |
						   ((MapTile.PaletteIndex & 0x07) << 10) |
						   ((MapTile.Priority & 0x01) << 13) |
						   (MapTile.FlipX ? 0x4000 : 0) |
						   (MapTile.FlipY ? 0x8000 : 0);

				result[pos++] = (byte)(word & 0xff);
				result[pos++] = (byte)((word >> 8) & 0xff);
			}
		}

		return result;
	}

	private byte[] ExportGbBackground(TileMap map)
	{
		return ExportLinearMap(map);
	}

	private byte[] ExportGenesisPlane(TileMap map)
	{
		var result = new byte[map.Width * map.Height * 2];
		var pos = 0;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				var MapTile = map.Tiles[x, y];
				var word = (MapTile.TileIndex & 0x07ff) |
						   (MapTile.FlipX ? 0x0800 : 0) |
						   (MapTile.FlipY ? 0x1000 : 0) |
						   ((MapTile.PaletteIndex & 0x03) << 13) |
						   ((MapTile.Priority & 0x01) << 15);

				result[pos++] = (byte)((word >> 8) & 0xff);
				result[pos++] = (byte)(word & 0xff);
			}
		}

		return result;
	}

	private byte[] ExportGbaTilemap(TileMap map)
	{
		var result = new byte[map.Width * map.Height * 2];
		var pos = 0;

		for (int y = 0; y < map.Height; y++)
		{
			for (int x = 0; x < map.Width; x++)
			{
				var MapTile = map.Tiles[x, y];
				var word = (MapTile.TileIndex & 0x03ff) |
						   (MapTile.FlipX ? 0x0400 : 0) |
						   (MapTile.FlipY ? 0x0800 : 0) |
						   ((MapTile.PaletteIndex & 0x0f) << 12);

				result[pos++] = (byte)(word & 0xff);
				result[pos++] = (byte)((word >> 8) & 0xff);
			}
		}

		return result;
	}

	private byte[] ExportColumnMajorMap(TileMap map)
	{
		var result = new byte[map.Width * map.Height];
		var pos = 0;

		for (int x = 0; x < map.Width; x++)
		{
			for (int y = 0; y < map.Height; y++)
			{
				result[pos++] = (byte)map.Tiles[x, y].TileIndex;
			}
		}

		return result;
	}

	private void RenderTile(uint[] pixels, int imgWidth, int x, int y,
							TileGraphics tileGfx, Tileset tileset, MapPalette MapPalette, MapTile MapTile)
	{
		for (int ty = 0; ty < tileset.TileHeight; ty++)
		{
			for (int tx = 0; tx < tileset.TileWidth; tx++)
			{
				var sx = MapTile.FlipX ? (tileset.TileWidth - 1 - tx) : tx;
				var sy = MapTile.FlipY ? (tileset.TileHeight - 1 - ty) : ty;
				var pixelIndex = sy * tileset.TileWidth + sx;

				if (pixelIndex < tileGfx.PixelData.Length)
				{
					var colorIndex = tileGfx.PixelData[pixelIndex];
					var paletteOffset = MapTile.PaletteIndex * 16;
					var finalIndex = paletteOffset + colorIndex;

					uint color = 0xff000000;
					if (finalIndex < MapPalette.Colors.Length)
					{
						color = MapPalette.Colors[finalIndex];
						if (colorIndex == 0 && MapPalette.TransparentIndex0)
						{
							color = 0x00000000;
						}
					}

					var px = x + tx;
					var py = y + ty;

					if (px >= 0 && px < imgWidth && py >= 0)
					{
						var destIndex = py * imgWidth + px;
						if (destIndex < pixels.Length)
						{
							pixels[destIndex] = color;
						}
					}
				}
			}
		}
	}

	private static byte[] EncodeToPng(uint[] pixels, int width, int height)
	{
		// Simple PNG encoder for ARGB data
		// This is a minimal implementation - in production use a proper imaging library

		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// PNG signature
		writer.Write(new byte[] { 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a });

		// IHDR chunk
		WriteChunk(writer, "IHDR", BitConverter.GetBytes(ToBigEndian(width))
			.Concat(BitConverter.GetBytes(ToBigEndian(height)))
			.Concat(new byte[] { 8, 6, 0, 0, 0 }) // 8-bit RGBA
			.ToArray());

		// IDAT chunk (raw pixel data, uncompressed)
		var rawData = new List<byte>();
		for (int y = 0; y < height; y++)
		{
			rawData.Add(0); // Filter type: None
			for (int x = 0; x < width; x++)
			{
				var pixel = pixels[y * width + x];
				rawData.Add((byte)((pixel >> 16) & 0xff)); // R
				rawData.Add((byte)((pixel >> 8) & 0xff));  // G
				rawData.Add((byte)(pixel & 0xff));         // B
				rawData.Add((byte)((pixel >> 24) & 0xff)); // A
			}
		}

		// Compress with deflate
		var compressed = DeflateCompress(rawData.ToArray());
		WriteChunk(writer, "IDAT", compressed);

		// IEND chunk
		WriteChunk(writer, "IEND", []);

		return ms.ToArray();
	}

	private static void WriteChunk(BinaryWriter writer, string type, byte[] data)
	{
		writer.Write(ToBigEndian(data.Length));
		var typeBytes = System.Text.Encoding.ASCII.GetBytes(type);
		writer.Write(typeBytes);
		writer.Write(data);

		// CRC32
		var crcData = typeBytes.Concat(data).ToArray();
		var crc = CalculateCrc32(crcData);
		writer.Write(ToBigEndian((int)crc));
	}

	private static int ToBigEndian(int value)
	{
		return System.Net.IPAddress.HostToNetworkOrder(value);
	}

	private static uint CalculateCrc32(byte[] data)
	{
		uint crc = 0xffffffff;
		foreach (var b in data)
		{
			crc ^= b;
			for (int i = 0; i < 8; i++)
			{
				crc = (crc >> 1) ^ ((crc & 1) != 0 ? 0xedb88320 : 0);
			}
		}
		return crc ^ 0xffffffff;
	}

	private static byte[] DeflateCompress(byte[] data)
	{
		using var output = new MemoryStream();
		using (var deflate = new System.IO.Compression.DeflateStream(output, System.IO.Compression.CompressionLevel.Optimal))
		{
			deflate.Write(data, 0, data.Length);
		}

		// Add zlib header and checksum
		var compressed = output.ToArray();
		var result = new byte[compressed.Length + 6];

		// zlib header (deflate, 32K window)
		result[0] = 0x78;
		result[1] = 0x9c;

		Array.Copy(compressed, 0, result, 2, compressed.Length);

		// Adler-32 checksum
		var adler = Adler32(data);
		result[result.Length - 4] = (byte)((adler >> 24) & 0xff);
		result[result.Length - 3] = (byte)((adler >> 16) & 0xff);
		result[result.Length - 2] = (byte)((adler >> 8) & 0xff);
		result[result.Length - 1] = (byte)(adler & 0xff);

		return result;
	}

	private static uint Adler32(byte[] data)
	{
		uint a = 1, b = 0;
		foreach (var d in data)
		{
			a = (a + d) % 65521;
			b = (b + a) % 65521;
		}
		return (b << 16) | a;
	}

	#endregion
}
