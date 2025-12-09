namespace GameInfoTools.Graphics;

/// <summary>
/// Sprite extraction and composition.
/// </summary>
public class SpriteExtractor {
	/// <summary>
	/// NES OAM sprite entry.
	/// </summary>
	public record NesSprite(byte Y, byte TileIndex, byte Attributes, byte X) {
		/// <summary>
		/// Palette index (0-3).
		/// </summary>
		public int Palette => Attributes & 0x03;

		/// <summary>
		/// Behind background flag.
		/// </summary>
		public bool BehindBackground => (Attributes & 0x20) != 0;

		/// <summary>
		/// Horizontal flip.
		/// </summary>
		public bool FlipH => (Attributes & 0x40) != 0;

		/// <summary>
		/// Vertical flip.
		/// </summary>
		public bool FlipV => (Attributes & 0x80) != 0;
	}

	/// <summary>
	/// SNES OAM sprite entry.
	/// </summary>
	public record SnesSprite(int X, int Y, int TileIndex, int Palette, bool Priority0, bool Priority1, bool FlipH, bool FlipV, bool LargeSize);

	/// <summary>
	/// Metasprite composed of multiple hardware sprites.
	/// </summary>
	public class Metasprite {
		public string? Name { get; set; }
		public List<(int OffsetX, int OffsetY, int TileIndex, int Attributes)> Sprites { get; } = new();
		public int Width { get; set; }
		public int Height { get; set; }

		/// <summary>
		/// Calculate bounding box.
		/// </summary>
		public (int MinX, int MinY, int MaxX, int MaxY) GetBounds(int tileHeight = 8) {
			if (Sprites.Count == 0) {
				return (0, 0, 0, 0);
			}

			int minX = int.MaxValue, minY = int.MaxValue;
			int maxX = int.MinValue, maxY = int.MinValue;

			foreach (var (ox, oy, _, _) in Sprites) {
				minX = Math.Min(minX, ox);
				minY = Math.Min(minY, oy);
				maxX = Math.Max(maxX, ox + 8);
				maxY = Math.Max(maxY, oy + tileHeight);
			}

			return (minX, minY, maxX, maxY);
		}
	}

	/// <summary>
	/// Parse NES OAM data.
	/// </summary>
	public static List<NesSprite> ParseNesOam(byte[] data, int offset = 0, int count = 64) {
		var sprites = new List<NesSprite>();

		for (int i = 0; i < count && offset + 4 <= data.Length; i++) {
			sprites.Add(new NesSprite(
				data[offset],
				data[offset + 1],
				data[offset + 2],
				data[offset + 3]
			));
			offset += 4;
		}

		return sprites;
	}

	/// <summary>
	/// Extract sprite definition from ROM (common format).
	/// </summary>
	public static Metasprite ExtractMetasprite(byte[] data, int offset, int spriteCount, bool is8x16 = false) {
		var meta = new Metasprite();
		int tileHeight = is8x16 ? 16 : 8;

		for (int i = 0; i < spriteCount && offset + 4 <= data.Length; i++) {
			// Common format: X offset, Y offset, tile index, attributes
			int ox = (sbyte)data[offset];
			int oy = (sbyte)data[offset + 1];
			int tile = data[offset + 2];
			int attr = data[offset + 3];

			meta.Sprites.Add((ox, oy, tile, attr));
			offset += 4;
		}

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight);
		meta.Width = MaxX - MinX;
		meta.Height = MaxY - MinY;

		return meta;
	}

	/// <summary>
	/// Find metasprite table in ROM.
	/// </summary>
	public static List<(int Offset, Metasprite Sprite)> FindMetaspriteTable(
		byte[] data,
		int tableOffset,
		int count,
		Core.PointerTable.PointerFormat pointerFormat = Core.PointerTable.PointerFormat.Absolute16,
		int bank = 0,
		bool is8x16 = false) {
		var results = new List<(int Offset, Metasprite Sprite)>();

		var pointerTable = Core.PointerTable.Read(data, tableOffset, count, pointerFormat, bank);

		foreach (var entry in pointerTable.Entries) {
			// Convert CPU address to file offset (NES specific)
			int fileOffset = entry.TargetAddress - 0x8000;
			if (fileOffset < 0 || fileOffset >= data.Length) {
				continue;
			}

			// Try to detect sprite count by looking for terminator
			int spriteCount = DetectSpriteCount(data, fileOffset);
			if (spriteCount > 0) {
				var meta = ExtractMetasprite(data, fileOffset, spriteCount, is8x16);
				results.Add((entry.TargetAddress, meta));
			}
		}

		return results;
	}

	private static int DetectSpriteCount(byte[] data, int offset, int maxSprites = 16) {
		// Look for common terminator patterns
		for (int i = 0; i < maxSprites; i++) {
			int pos = offset + (i * 4);
			if (pos + 4 > data.Length) {
				return i;
			}

			// Common terminators:
			// - Y coordinate of $F8 or higher (off-screen)
			// - All zeros
			// - $FF $FF pattern
			if (data[pos] >= 0xf8) {
				return i;
			}

			if (data[pos] == 0 && data[pos + 1] == 0 && data[pos + 2] == 0 && data[pos + 3] == 0) {
				return i;
			}

			if (data[pos] == 0xff && data[pos + 1] == 0xff) {
				return i;
			}
		}

		return maxSprites;
	}

	/// <summary>
	/// Render a metasprite to indexed pixel buffer.
	/// </summary>
	public static byte[,] RenderMetasprite(
		Metasprite meta,
		ChrEditor chr,
		bool is8x16 = false,
		int? width = null,
		int? height = null) {
		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(is8x16 ? 16 : 8);
		int w = width ?? Math.Max(MaxX - MinX, 8);
		int h = height ?? Math.Max(MaxY - MinY, 8);
		int offsetX = -MinX;
		int offsetY = -MinY;

		var result = new byte[h, w];

		foreach (var (ox, oy, tileIndex, attr) in meta.Sprites) {
			int destX = ox + offsetX;
			int destY = oy + offsetY;
			bool flipH = (attr & 0x40) != 0;
			bool flipV = (attr & 0x80) != 0;

			if (is8x16) {
				// 8x16 sprite mode: even tile index for top, odd for bottom
				int topTile = tileIndex & 0xfe;
				int bottomTile = topTile | 1;

				RenderTile(result, chr.GetTile(flipV ? bottomTile : topTile), destX, destY, flipH, flipV);
				RenderTile(result, chr.GetTile(flipV ? topTile : bottomTile), destX, destY + 8, flipH, flipV);
			} else {
				if (tileIndex < chr.TileCount) {
					RenderTile(result, chr.GetTile(tileIndex), destX, destY, flipH, flipV);
				}
			}
		}

		return result;
	}

	private static void RenderTile(byte[,] dest, byte[,] tile, int destX, int destY, bool flipH, bool flipV) {
		int destHeight = dest.GetLength(0);
		int destWidth = dest.GetLength(1);

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				int srcX = flipH ? 7 - x : x;
				int srcY = flipV ? 7 - y : y;
				int px = destX + x;
				int py = destY + y;

				if (px >= 0 && px < destWidth && py >= 0 && py < destHeight) {
					byte color = tile[srcY, srcX];
					if (color != 0) // Don't overwrite with transparent
					{
						dest[py, px] = color;
					}
				}
			}
		}
	}

	/// <summary>
	/// Export metasprite to JSON-compatible format.
	/// </summary>
	public static object ExportMetaspriteData(Metasprite meta) {
		return new {
			name = meta.Name,
			width = meta.Width,
			height = meta.Height,
			sprites = meta.Sprites.Select(s => new {
				x = s.OffsetX,
				y = s.OffsetY,
				tile = s.TileIndex,
				palette = s.Attributes & 0x03,
				flipH = (s.Attributes & 0x40) != 0,
				flipV = (s.Attributes & 0x80) != 0,
				priority = (s.Attributes & 0x20) != 0
			}).ToList()
		};
	}

	/// <summary>
	/// Generate metasprite assembly data.
	/// </summary>
	public static string GenerateMetaspriteAsm(Metasprite meta, string label) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"{label}:");
		sb.AppendLine($"\t.byte {meta.Sprites.Count}\t\t; sprite count");

		foreach (var (ox, oy, tile, attr) in meta.Sprites) {
			sb.AppendLine($"\t.byte ${ox & 0xff:x2}, ${oy & 0xff:x2}, ${tile:x2}, ${attr:x2}");
		}

		return sb.ToString();
	}
}
