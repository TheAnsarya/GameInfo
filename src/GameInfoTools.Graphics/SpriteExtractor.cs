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

	#region Sprite Boundary Detection

	/// <summary>
	/// Auto-detect sprite boundaries in CHR data.
	/// </summary>
	public static List<SpriteBoundary> DetectSpriteBoundaries(ChrEditor chr, int minWidth = 8, int minHeight = 8) {
		var boundaries = new List<SpriteBoundary>();

		// Build a usage map of which tiles contain non-transparent pixels
		var tileUsage = new bool[chr.TileCount];
		for (int i = 0; i < chr.TileCount; i++) {
			tileUsage[i] = TileHasContent(chr.GetTile(i));
		}

		// Group consecutive tiles that form sprites
		int tilesPerRow = 16; // Standard NES/GB CHR arrangement
		int rows = (chr.TileCount + tilesPerRow - 1) / tilesPerRow;

		// Scan for rectangular groups of tiles
		var visited = new bool[chr.TileCount];

		for (int startTile = 0; startTile < chr.TileCount; startTile++) {
			if (visited[startTile] || !tileUsage[startTile])
				continue;

			// Try to find a rectangular region
			var boundary = FloodFillBoundary(tileUsage, visited, startTile, tilesPerRow, rows);
			if (boundary != null && boundary.Width >= minWidth && boundary.Height >= minHeight) {
				boundaries.Add(boundary);
			}
		}

		return boundaries;
	}

	private static bool TileHasContent(byte[,] tile) {
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				if (tile[y, x] != 0) return true;
			}
		}

		return false;
	}

	private static SpriteBoundary? FloodFillBoundary(bool[] tileUsage, bool[] visited, int startTile, int tilesPerRow, int rows) {
		var queue = new Queue<int>();
		var tiles = new List<int>();

		queue.Enqueue(startTile);

		int minCol = startTile % tilesPerRow;
		int maxCol = minCol;
		int minRow = startTile / tilesPerRow;
		int maxRow = minRow;

		while (queue.Count > 0) {
			int tile = queue.Dequeue();
			if (tile < 0 || tile >= tileUsage.Length || visited[tile] || !tileUsage[tile])
				continue;

			visited[tile] = true;
			tiles.Add(tile);

			int col = tile % tilesPerRow;
			int row = tile / tilesPerRow;
			minCol = Math.Min(minCol, col);
			maxCol = Math.Max(maxCol, col);
			minRow = Math.Min(minRow, row);
			maxRow = Math.Max(maxRow, row);

			// Check neighbors (4-connected)
			if (col > 0) queue.Enqueue(tile - 1);
			if (col < tilesPerRow - 1) queue.Enqueue(tile + 1);
			if (row > 0) queue.Enqueue(tile - tilesPerRow);
			if (row < rows - 1) queue.Enqueue(tile + tilesPerRow);
		}

		if (tiles.Count == 0)
			return null;

		return new SpriteBoundary(
			StartTile: tiles.Min(),
			TileCount: tiles.Count,
			Width: (maxCol - minCol + 1) * 8,
			Height: (maxRow - minRow + 1) * 8,
			Tiles: tiles
		);
	}

	#endregion

	#region Animation Extraction

	/// <summary>
	/// Extract animation sequences from ROM.
	/// </summary>
	public static AnimationSequence ExtractAnimation(byte[] data, int offset, AnimationFormat format) {
		return format switch {
			AnimationFormat.FrameList => ParseFrameListAnimation(data, offset),
			AnimationFormat.TimedFrames => ParseTimedFrameAnimation(data, offset),
			AnimationFormat.ScriptedAnimation => ParseScriptedAnimation(data, offset),
			_ => new AnimationSequence("Unknown", [])
		};
	}

	private static AnimationSequence ParseFrameListAnimation(byte[] data, int offset) {
		var frames = new List<AnimationFrame>();
		int frameCount = data[offset];

		for (int i = 0; i < frameCount && offset + 1 + i < data.Length; i++) {
			int frameIndex = data[offset + 1 + i];
			frames.Add(new AnimationFrame(frameIndex, 1, 0, 0));
		}

		return new AnimationSequence($"Anim_{offset:x4}", frames);
	}

	private static AnimationSequence ParseTimedFrameAnimation(byte[] data, int offset) {
		var frames = new List<AnimationFrame>();

		// Format: duration, frame, duration, frame, ... terminated by 0 or $FF
		int pos = offset;
		while (pos + 1 < data.Length) {
			int duration = data[pos];
			if (duration == 0 || duration == 0xff)
				break;

			int frameIndex = data[pos + 1];
			frames.Add(new AnimationFrame(frameIndex, duration, 0, 0));
			pos += 2;
		}

		return new AnimationSequence($"Anim_{offset:x4}", frames) { Loop = data[pos] != 0xff };
	}

	private static AnimationSequence ParseScriptedAnimation(byte[] data, int offset) {
		var frames = new List<AnimationFrame>();

		// Format: command byte followed by data
		// Common commands: 0x00=end, 0x80+=frame, other=special
		int pos = offset;
		int duration = 1;

		while (pos < data.Length) {
			byte cmd = data[pos++];

			if (cmd == 0x00)
				break; // End
			else if (cmd == 0xff)
				break; // Loop end
			else if (cmd >= 0x80) {
				// Frame index
				int frameIndex = cmd - 0x80;
				frames.Add(new AnimationFrame(frameIndex, duration, 0, 0));
			} else if (cmd < 0x40) {
				// Duration
				duration = cmd;
			}
		}

		return new AnimationSequence($"Anim_{offset:x4}", frames);
	}

	/// <summary>
	/// Detect animation tables in ROM.
	/// </summary>
	public static List<AnimationTableEntry> DetectAnimationTables(byte[] data, int searchStart, int searchEnd, Core.SystemType system) {
		var results = new List<AnimationTableEntry>();

		for (int i = searchStart; i < searchEnd - 16; i++) {
			// Look for pointer table patterns followed by animation data
			if (IsLikelyAnimationTable(data, i, system)) {
				int tableSize = DetectTableSize(data, i, system);
				if (tableSize > 0) {
					results.Add(new AnimationTableEntry(i, tableSize, system));
				}
			}
		}

		return results;
	}

	private static bool IsLikelyAnimationTable(byte[] data, int offset, Core.SystemType system) {
		if (system == Core.SystemType.Nes) {
			// NES: Look for pointer pairs in $8000-$FFFF range
			for (int i = 0; i < 4 && offset + i * 2 + 1 < data.Length; i++) {
				int ptr = data[offset + i * 2] | (data[offset + i * 2 + 1] << 8);
				if (ptr < 0x8000 || ptr > 0xffff)
					return false;
			}

			return true;
		}

		return false;
	}

	private static int DetectTableSize(byte[] data, int offset, Core.SystemType system) {
		int count = 0;
		int maxEntries = 64;

		for (int i = 0; i < maxEntries && offset + i * 2 + 1 < data.Length; i++) {
			int ptr = data[offset + i * 2] | (data[offset + i * 2 + 1] << 8);

			if (system == Core.SystemType.Nes) {
				if (ptr < 0x8000 || ptr > 0xffff)
					break;
			}

			count++;
		}

		return count >= 2 ? count : 0;
	}

	#endregion

	#region Sprite Sheet Generation

	/// <summary>
	/// Generate sprite sheet from metasprites.
	/// </summary>
	public static SpriteSheet GenerateSpriteSheet(
		List<Metasprite> metasprites,
		ChrEditor chr,
		int maxWidth = 256,
		int padding = 1,
		bool is8x16 = false) {
		// Calculate total size needed
		var renderedSprites = new List<(byte[,] Pixels, Metasprite Meta)>();

		foreach (var meta in metasprites) {
			var pixels = RenderMetasprite(meta, chr, is8x16);
			renderedSprites.Add((pixels, meta));
		}

		// Pack sprites into sheet using simple row-based packing
		int currentX = padding;
		int currentY = padding;
		int rowHeight = 0;
		var placements = new List<SpritePlacement>();

		foreach (var (pixels, meta) in renderedSprites) {
			int spriteWidth = pixels.GetLength(1);
			int spriteHeight = pixels.GetLength(0);

			// Check if we need to start a new row
			if (currentX + spriteWidth + padding > maxWidth) {
				currentX = padding;
				currentY += rowHeight + padding;
				rowHeight = 0;
			}

			placements.Add(new SpritePlacement(meta.Name ?? "sprite", currentX, currentY, spriteWidth, spriteHeight, pixels));

			currentX += spriteWidth + padding;
			rowHeight = Math.Max(rowHeight, spriteHeight);
		}

		int sheetWidth = maxWidth;
		int sheetHeight = currentY + rowHeight + padding;

		// Power of 2 height
		sheetHeight = NextPowerOfTwo(sheetHeight);

		// Render final sheet
		var sheet = new byte[sheetHeight, sheetWidth];
		foreach (var placement in placements) {
			CopyToSheet(sheet, placement.Pixels, placement.X, placement.Y);
		}

		return new SpriteSheet(sheet, sheetWidth, sheetHeight, placements);
	}

	private static void CopyToSheet(byte[,] sheet, byte[,] sprite, int x, int y) {
		int spriteHeight = sprite.GetLength(0);
		int spriteWidth = sprite.GetLength(1);
		int sheetHeight = sheet.GetLength(0);
		int sheetWidth = sheet.GetLength(1);

		for (int sy = 0; sy < spriteHeight; sy++) {
			for (int sx = 0; sx < spriteWidth; sx++) {
				int destX = x + sx;
				int destY = y + sy;
				if (destX < sheetWidth && destY < sheetHeight) {
					sheet[destY, destX] = sprite[sy, sx];
				}
			}
		}
	}

	private static int NextPowerOfTwo(int value) {
		value--;
		value |= value >> 1;
		value |= value >> 2;
		value |= value >> 4;
		value |= value >> 8;
		value |= value >> 16;
		return value + 1;
	}

	#endregion

	#region Export Formats

	/// <summary>
	/// Export sprite sheet to GMS (GameMaker Studio) format.
	/// </summary>
	public static string ExportToGms(SpriteSheet sheet, string spriteName) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"// GameMaker Studio sprite: {spriteName}");
		sb.AppendLine($"// Size: {sheet.Width}x{sheet.Height}");
		sb.AppendLine();
		sb.AppendLine($"sprite = sprite_add(\"{spriteName}.png\", 0, false, false, 0, 0);");
		sb.AppendLine();
		sb.AppendLine("// Subimages:");

		int index = 0;
		foreach (var placement in sheet.Placements) {
			sb.AppendLine($"// [{index}] {placement.Name}: ({placement.X}, {placement.Y}) {placement.Width}x{placement.Height}");
			index++;
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export sprite sheet to Unity format (JSON + Sprite metadata).
	/// </summary>
	public static string ExportToUnity(SpriteSheet sheet, string textureName) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine($"  \"texture\": \"{textureName}.png\",");
		sb.AppendLine($"  \"width\": {sheet.Width},");
		sb.AppendLine($"  \"height\": {sheet.Height},");
		sb.AppendLine("  \"sprites\": [");

		for (int i = 0; i < sheet.Placements.Count; i++) {
			var p = sheet.Placements[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"name\": \"{p.Name}\",");
			sb.AppendLine($"      \"x\": {p.X},");
			sb.AppendLine($"      \"y\": {p.Y},");
			sb.AppendLine($"      \"width\": {p.Width},");
			sb.AppendLine($"      \"height\": {p.Height},");
			sb.AppendLine($"      \"pivot\": {{ \"x\": 0.5, \"y\": 0.5 }}");
			sb.Append("    }");
			sb.AppendLine(i < sheet.Placements.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");
		return sb.ToString();
	}

	/// <summary>
	/// Export sprite sheet to Godot format (.tres resource).
	/// </summary>
	public static string ExportToGodot(SpriteSheet sheet, string resourcePath) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("[gd_resource type=\"AtlasTexture\" load_steps=2 format=3]");
		sb.AppendLine();
		sb.AppendLine($"[ext_resource path=\"res://{resourcePath}.png\" type=\"Texture2D\" id=\"1\"]");
		sb.AppendLine();

		foreach (var p in sheet.Placements) {
			sb.AppendLine($"[sub_resource type=\"AtlasTexture\" id=\"{p.Name}\"]");
			sb.AppendLine("atlas = ExtResource(\"1\")");
			sb.AppendLine($"region = Rect2({p.X}, {p.Y}, {p.Width}, {p.Height})");
			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export animation to Aseprite JSON format.
	/// </summary>
	public static string ExportAnimationToAseprite(AnimationSequence animation, SpriteSheet sheet) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("{ \"frames\": {");

		for (int i = 0; i < animation.Frames.Count && i < sheet.Placements.Count; i++) {
			var frame = animation.Frames[i];
			var placement = sheet.Placements[frame.FrameIndex < sheet.Placements.Count ? frame.FrameIndex : 0];

			sb.AppendLine($"   \"{animation.Name}_{i}.png\": {{");
			sb.AppendLine($"    \"frame\": {{ \"x\": {placement.X}, \"y\": {placement.Y}, \"w\": {placement.Width}, \"h\": {placement.Height} }},");
			sb.AppendLine($"    \"rotated\": false,");
			sb.AppendLine($"    \"trimmed\": false,");
			sb.AppendLine($"    \"spriteSourceSize\": {{ \"x\": 0, \"y\": 0, \"w\": {placement.Width}, \"h\": {placement.Height} }},");
			sb.AppendLine($"    \"sourceSize\": {{ \"w\": {placement.Width}, \"h\": {placement.Height} }},");
			sb.AppendLine($"    \"duration\": {frame.Duration * 16}");
			sb.Append("   }");
			sb.AppendLine(i < animation.Frames.Count - 1 ? "," : "");
		}

		sb.AppendLine("},");
		sb.AppendLine("\"meta\": {");
		sb.AppendLine($"  \"app\": \"GameInfoTools\",");
		sb.AppendLine($"  \"image\": \"{animation.Name}.png\",");
		sb.AppendLine($"  \"size\": {{ \"w\": {sheet.Width}, \"h\": {sheet.Height} }},");
		sb.AppendLine($"  \"frameTags\": [");
		sb.AppendLine($"    {{ \"name\": \"{animation.Name}\", \"from\": 0, \"to\": {animation.Frames.Count - 1}, \"direction\": \"forward\" }}");
		sb.AppendLine($"  ]");
		sb.AppendLine("}}");

		return sb.ToString();
	}

	#endregion
}

#region Records

/// <summary>
/// Detected sprite boundary.
/// </summary>
public record SpriteBoundary(
	int StartTile,
	int TileCount,
	int Width,
	int Height,
	List<int> Tiles
);

/// <summary>
/// Animation sequence.
/// </summary>
public record AnimationSequence(
	string Name,
	List<AnimationFrame> Frames
) {
	public bool Loop { get; set; } = true;
}

/// <summary>
/// Single animation frame.
/// </summary>
public record AnimationFrame(
	int FrameIndex,
	int Duration,
	int OffsetX,
	int OffsetY
);

/// <summary>
/// Animation format types.
/// </summary>
public enum AnimationFormat {
	FrameList,
	TimedFrames,
	ScriptedAnimation,
	Custom
}

/// <summary>
/// Animation table entry.
/// </summary>
public record AnimationTableEntry(
	int Offset,
	int EntryCount,
	Core.SystemType System
);

/// <summary>
/// Generated sprite sheet.
/// </summary>
public record SpriteSheet(
	byte[,] Pixels,
	int Width,
	int Height,
	List<SpritePlacement> Placements
);

/// <summary>
/// Sprite placement in sheet.
/// </summary>
public record SpritePlacement(
	string Name,
	int X,
	int Y,
	int Width,
	int Height,
	byte[,] Pixels
);

/// <summary>
/// Advanced sprite detection for automatic boundary finding.
/// </summary>
public class AdvancedSpriteDetector {
	/// <summary>
	/// Detection result for a sprite region.
	/// </summary>
	public record DetectedSprite(
		int StartTile,
		int Width,
		int Height,
		List<int> TileIndices,
		SpriteType Type,
		float Confidence
	);

	/// <summary>
	/// Type of detected sprite.
	/// </summary>
	public enum SpriteType {
		Static,
		Character,
		Enemy,
		Item,
		Tile,
		Font,
		Unknown
	}

	/// <summary>
	/// Auto-detect and classify sprites in CHR data.
	/// </summary>
	public static List<DetectedSprite> DetectSprites(ChrEditor chr, DetectionOptions? options = null) {
		options ??= new DetectionOptions();
		var results = new List<DetectedSprite>();

		// Build tile analysis
		var tileAnalysis = new TileAnalysis[chr.TileCount];
		for (int i = 0; i < chr.TileCount; i++) {
			tileAnalysis[i] = AnalyzeTile(chr.GetTile(i));
		}

		// Find connected regions
		var visited = new bool[chr.TileCount];
		int tilesPerRow = 16;

		for (int startTile = 0; startTile < chr.TileCount; startTile++) {
			if (visited[startTile] || !tileAnalysis[startTile].HasContent)
				continue;

			var region = FloodFillRegion(tileAnalysis, visited, startTile, tilesPerRow, chr.TileCount);
			if (region.Tiles.Count > 0) {
				var spriteType = ClassifySprite(region, tileAnalysis, options);
				var confidence = CalculateConfidence(region, tileAnalysis, spriteType);

				results.Add(new DetectedSprite(
					region.StartTile,
					region.Width,
					region.Height,
					region.Tiles,
					spriteType,
					confidence
				));
			}
		}

		// Filter by minimum size if specified
		if (options.MinWidth > 0 || options.MinHeight > 0) {
			results = results.Where(s =>
				s.Width >= options.MinWidth && s.Height >= options.MinHeight
			).ToList();
		}

		return results;
	}

	private record TileAnalysis(bool HasContent, int ColorCount, bool IsSymmetric, float Density);

	private static TileAnalysis AnalyzeTile(byte[,] tile) {
		var colors = new HashSet<byte>();
		int nonZeroPixels = 0;
		bool hasContent = false;

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				byte pixel = tile[y, x];
				colors.Add(pixel);
				if (pixel != 0) {
					nonZeroPixels++;
					hasContent = true;
				}
			}
		}

		// Check horizontal symmetry
		bool isSymmetric = true;
		for (int y = 0; y < 8 && isSymmetric; y++) {
			for (int x = 0; x < 4; x++) {
				if (tile[y, x] != tile[y, 7 - x]) {
					isSymmetric = false;
					break;
				}
			}
		}

		float density = nonZeroPixels / 64f;

		return new TileAnalysis(hasContent, colors.Count, isSymmetric, density);
	}

	private record RegionInfo(int StartTile, int Width, int Height, List<int> Tiles);

	private static RegionInfo FloodFillRegion(TileAnalysis[] analysis, bool[] visited, int start, int tilesPerRow, int totalTiles) {
		var tiles = new List<int>();
		var queue = new Queue<int>();
		queue.Enqueue(start);

		int minCol = start % tilesPerRow;
		int maxCol = minCol;
		int minRow = start / tilesPerRow;
		int maxRow = minRow;
		int totalRows = (totalTiles + tilesPerRow - 1) / tilesPerRow;

		while (queue.Count > 0) {
			int tile = queue.Dequeue();
			if (tile < 0 || tile >= totalTiles || visited[tile] || !analysis[tile].HasContent)
				continue;

			visited[tile] = true;
			tiles.Add(tile);

			int col = tile % tilesPerRow;
			int row = tile / tilesPerRow;
			minCol = Math.Min(minCol, col);
			maxCol = Math.Max(maxCol, col);
			minRow = Math.Min(minRow, row);
			maxRow = Math.Max(maxRow, row);

			// 4-connected neighbors
			if (col > 0) queue.Enqueue(tile - 1);
			if (col < tilesPerRow - 1) queue.Enqueue(tile + 1);
			if (row > 0) queue.Enqueue(tile - tilesPerRow);
			if (row < totalRows - 1) queue.Enqueue(tile + tilesPerRow);
		}

		return new RegionInfo(
			tiles.Count > 0 ? tiles.Min() : start,
			(maxCol - minCol + 1) * 8,
			(maxRow - minRow + 1) * 8,
			tiles
		);
	}

	private static SpriteType ClassifySprite(RegionInfo region, TileAnalysis[] analysis, DetectionOptions options) {
		// Heuristics for classification
		int tileCount = region.Tiles.Count;
		int symmetricCount = region.Tiles.Count(t => analysis[t].IsSymmetric);
		float avgDensity = region.Tiles.Average(t => analysis[t].Density);

		// Font tiles: small, usually 1 tile, high density
		if (tileCount == 1 && avgDensity > 0.3f && avgDensity < 0.7f) {
			return SpriteType.Font;
		}

		// Character sprites: typically 2x3 or 2x2, often symmetric
		if ((region.Width == 16 && region.Height == 24) ||
		    (region.Width == 16 && region.Height == 16)) {
			if (symmetricCount > tileCount / 2) {
				return SpriteType.Character;
			}
		}

		// Item sprites: usually small, 1x1 or 1x2
		if (tileCount <= 2 && avgDensity > 0.2f) {
			return SpriteType.Item;
		}

		// Enemy sprites: larger, less symmetric
		if (tileCount >= 4 && symmetricCount < tileCount / 3) {
			return SpriteType.Enemy;
		}

		// Tile patterns: very regular, often full density
		if (avgDensity > 0.8f) {
			return SpriteType.Tile;
		}

		return SpriteType.Unknown;
	}

	private static float CalculateConfidence(RegionInfo region, TileAnalysis[] analysis, SpriteType type) {
		// Base confidence on how well the sprite matches expected patterns
		float confidence = 0.5f;

		// Rectangular regions are more likely to be valid sprites
		int expectedTiles = (region.Width / 8) * (region.Height / 8);
		float fillRatio = region.Tiles.Count / (float)expectedTiles;
		if (fillRatio > 0.8f) confidence += 0.2f;

		// Consistent density across tiles
		var densities = region.Tiles.Select(t => analysis[t].Density).ToList();
		float densityVariance = densities.Count > 1 ?
			(float)densities.Select(d => Math.Pow(d - densities.Average(), 2)).Average() : 0;
		if (densityVariance < 0.05f) confidence += 0.15f;

		return Math.Min(confidence, 1.0f);
	}
}

/// <summary>
/// Options for sprite detection.
/// </summary>
public class DetectionOptions {
	public int MinWidth { get; set; } = 8;
	public int MinHeight { get; set; } = 8;
	public float MinConfidence { get; set; } = 0.3f;
	public bool DetectAnimations { get; set; } = true;
}

/// <summary>
/// Advanced animation extractor.
/// </summary>
public class AnimationExtractor {
	/// <summary>
	/// Extracted animation bank.
	/// </summary>
	public record AnimationBank(
		string Name,
		List<AnimationSequence> Animations,
		int BaseAddress,
		Core.SystemType System
	);

	/// <summary>
	/// Animation frame with full metadata.
	/// </summary>
	public record ExtendedAnimationFrame(
		int FrameIndex,
		int Duration,
		int OffsetX,
		int OffsetY,
		int Flags,
		List<int> MetaspriteIndices
	);

	/// <summary>
	/// Extract all animations from a character bank.
	/// </summary>
	public static AnimationBank ExtractCharacterAnimations(
		byte[] data,
		int bankOffset,
		int bankSize,
		Core.SystemType system) {
		var animations = new List<AnimationSequence>();

		// Look for animation pointer tables
		var tables = FindAnimationPointerTables(data, bankOffset, bankOffset + bankSize, system);

		foreach (var table in tables) {
			var tableAnimations = ExtractAnimationsFromTable(data, table.Offset, table.Count, system);
			animations.AddRange(tableAnimations);
		}

		return new AnimationBank(
			$"Bank_{bankOffset:X4}",
			animations,
			bankOffset,
			system
		);
	}

	private record AnimTableInfo(int Offset, int Count);

	private static List<AnimTableInfo> FindAnimationPointerTables(byte[] data, int start, int end, Core.SystemType system) {
		var tables = new List<AnimTableInfo>();

		// Look for sequences of valid pointers
		for (int i = start; i < end - 8; i += 2) {
			int consecutiveValid = 0;
			for (int j = 0; j < 32 && i + j * 2 + 1 < end; j++) {
				int ptr = data[i + j * 2] | (data[i + j * 2 + 1] << 8);

				bool valid = system switch {
					Core.SystemType.Nes => ptr >= 0x8000 && ptr <= 0xffff,
					Core.SystemType.Snes => ptr >= 0x0000 && ptr <= 0xffff, // Bank-relative
					Core.SystemType.GameBoy => ptr >= 0x4000 && ptr <= 0x7fff,
					_ => false
				};

				if (valid) {
					consecutiveValid++;
				} else {
					break;
				}
			}

			if (consecutiveValid >= 3) {
				tables.Add(new AnimTableInfo(i, consecutiveValid));
				i += consecutiveValid * 2;
			}
		}

		return tables;
	}

	private static List<AnimationSequence> ExtractAnimationsFromTable(byte[] data, int tableOffset, int count, Core.SystemType system) {
		var animations = new List<AnimationSequence>();

		for (int i = 0; i < count; i++) {
			int ptr = data[tableOffset + i * 2] | (data[tableOffset + i * 2 + 1] << 8);

			// Convert to file offset
			int fileOffset = system switch {
				Core.SystemType.Nes => ptr - 0x8000 + (tableOffset & 0xfff0000),
				_ => ptr
			};

			if (fileOffset >= 0 && fileOffset < data.Length) {
				var frames = ParseAnimationFrames(data, fileOffset);
				if (frames.Count > 0) {
					animations.Add(new AnimationSequence($"Anim_{i:D2}", frames));
				}
			}
		}

		return animations;
	}

	private static List<AnimationFrame> ParseAnimationFrames(byte[] data, int offset) {
		var frames = new List<AnimationFrame>();

		// Try different frame formats
		int pos = offset;
		int maxFrames = 32;

		while (frames.Count < maxFrames && pos + 1 < data.Length) {
			byte b1 = data[pos];
			byte b2 = data[pos + 1];

			// End markers
			if (b1 == 0x00 || b1 == 0xff) break;

			// Common format: duration, frame index
			if (b1 < 0x80 && b2 < 0x80) {
				frames.Add(new AnimationFrame(b2, b1, 0, 0));
				pos += 2;
			}
			// Alternative: frame index with high bit flag
			else if (b1 >= 0x80) {
				frames.Add(new AnimationFrame(b1 & 0x7f, 1, 0, 0));
				pos += 1;
			} else {
				break;
			}
		}

		return frames;
	}

	/// <summary>
	/// Detect animation groups (walk cycle, attack, idle, etc).
	/// </summary>
	public static List<AnimationGroup> GroupAnimations(List<AnimationSequence> animations) {
		var groups = new List<AnimationGroup>();

		// Group by frame count patterns
		var byFrameCount = animations.GroupBy(a => a.Frames.Count).ToDictionary(g => g.Key, g => g.ToList());

		// Walk cycles typically have 2-4 frames
		if (byFrameCount.TryGetValue(4, out var fourFrame)) {
			groups.Add(new AnimationGroup("Walk Cycles", fourFrame.Take(4).ToList()));
		}

		// Idle animations often have 1-2 frames
		if (byFrameCount.TryGetValue(1, out var oneFrame)) {
			groups.Add(new AnimationGroup("Idle", oneFrame.Take(4).ToList()));
		}

		// Attacks often have 3-5 frames
		if (byFrameCount.TryGetValue(3, out var threeFrame)) {
			groups.Add(new AnimationGroup("Actions", threeFrame.Take(4).ToList()));
		}

		return groups;
	}
}

/// <summary>
/// Group of related animations.
/// </summary>
public record AnimationGroup(string Name, List<AnimationSequence> Animations);

/// <summary>
/// Sprite sheet generator with advanced packing.
/// </summary>
public class SpriteSheetGenerator {
	/// <summary>
	/// Packing algorithm options.
	/// </summary>
	public enum PackingAlgorithm {
		RowBased,
		BestFit,
		MaxRects
	}

	/// <summary>
	/// Generate optimally packed sprite sheet.
	/// </summary>
	public static SpriteSheet GenerateOptimized(
		List<(string Name, byte[,] Pixels)> sprites,
		int maxWidth = 512,
		int maxHeight = 512,
		PackingAlgorithm algorithm = PackingAlgorithm.MaxRects,
		int padding = 1,
		bool powerOfTwo = true) {
		var placements = algorithm switch {
			PackingAlgorithm.MaxRects => PackMaxRects(sprites, maxWidth, maxHeight, padding),
			PackingAlgorithm.BestFit => PackBestFit(sprites, maxWidth, maxHeight, padding),
			_ => PackRowBased(sprites, maxWidth, padding)
		};

		if (placements.Count == 0) {
			return new SpriteSheet(new byte[0, 0], 0, 0, []);
		}

		// Calculate sheet dimensions
		int width = placements.Max(p => p.X + p.Width + padding);
		int height = placements.Max(p => p.Y + p.Height + padding);

		if (powerOfTwo) {
			width = NextPowerOfTwo(width);
			height = NextPowerOfTwo(height);
		}

		// Render sheet
		var pixels = new byte[height, width];
		foreach (var placement in placements) {
			for (int y = 0; y < placement.Pixels.GetLength(0); y++) {
				for (int x = 0; x < placement.Pixels.GetLength(1); x++) {
					int destX = placement.X + x;
					int destY = placement.Y + y;
					if (destX < width && destY < height) {
						pixels[destY, destX] = placement.Pixels[y, x];
					}
				}
			}
		}

		return new SpriteSheet(pixels, width, height, placements);
	}

	private static List<SpritePlacement> PackRowBased(List<(string Name, byte[,] Pixels)> sprites, int maxWidth, int padding) {
		var placements = new List<SpritePlacement>();
		int x = padding, y = padding, rowHeight = 0;

		foreach (var (name, pixels) in sprites) {
			int w = pixels.GetLength(1);
			int h = pixels.GetLength(0);

			if (x + w + padding > maxWidth) {
				x = padding;
				y += rowHeight + padding;
				rowHeight = 0;
			}

			placements.Add(new SpritePlacement(name, x, y, w, h, pixels));
			x += w + padding;
			rowHeight = Math.Max(rowHeight, h);
		}

		return placements;
	}

	private static List<SpritePlacement> PackBestFit(List<(string Name, byte[,] Pixels)> sprites, int maxWidth, int maxHeight, int padding) {
		// Sort by height descending for better packing
		var sorted = sprites.OrderByDescending(s => s.Pixels.GetLength(0)).ToList();
		return PackRowBased(sorted, maxWidth, padding);
	}

	private static List<SpritePlacement> PackMaxRects(List<(string Name, byte[,] Pixels)> sprites, int maxWidth, int maxHeight, int padding) {
		var placements = new List<SpritePlacement>();
		var freeRects = new List<(int X, int Y, int W, int H)> { (0, 0, maxWidth, maxHeight) };

		// Sort by area descending
		var sorted = sprites.OrderByDescending(s => s.Pixels.GetLength(0) * s.Pixels.GetLength(1)).ToList();

		foreach (var (name, pixels) in sorted) {
			int w = pixels.GetLength(1) + padding;
			int h = pixels.GetLength(0) + padding;

			// Find best fit
			int bestIdx = -1;
			int bestScore = int.MaxValue;

			for (int i = 0; i < freeRects.Count; i++) {
				var rect = freeRects[i];
				if (rect.W >= w && rect.H >= h) {
					int score = Math.Min(rect.W - w, rect.H - h);
					if (score < bestScore) {
						bestScore = score;
						bestIdx = i;
					}
				}
			}

			if (bestIdx < 0) continue; // Doesn't fit

			var bestRect = freeRects[bestIdx];
			placements.Add(new SpritePlacement(name, bestRect.X, bestRect.Y, pixels.GetLength(1), pixels.GetLength(0), pixels));

			// Split remaining space
			freeRects.RemoveAt(bestIdx);

			// Right remainder
			if (bestRect.W - w > 0) {
				freeRects.Add((bestRect.X + w, bestRect.Y, bestRect.W - w, h));
			}

			// Bottom remainder
			if (bestRect.H - h > 0) {
				freeRects.Add((bestRect.X, bestRect.Y + h, bestRect.W, bestRect.H - h));
			}
		}

		return placements;
	}

	private static int NextPowerOfTwo(int value) {
		value--;
		value |= value >> 1;
		value |= value >> 2;
		value |= value >> 4;
		value |= value >> 8;
		value |= value >> 16;
		return value + 1;
	}
}

/// <summary>
/// Export formats for sprite data.
/// </summary>
public static class SpriteExporter {
	/// <summary>
	/// Export to C header format for homebrew.
	/// </summary>
	public static string ExportToCHeader(SpriteSheet sheet, string variableName) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"// Generated sprite sheet: {variableName}");
		sb.AppendLine($"// Size: {sheet.Width}x{sheet.Height}");
		sb.AppendLine();
		sb.AppendLine($"#ifndef _{variableName.ToUpperInvariant()}_H_");
		sb.AppendLine($"#define _{variableName.ToUpperInvariant()}_H_");
		sb.AppendLine();
		sb.AppendLine($"#define {variableName.ToUpperInvariant()}_WIDTH {sheet.Width}");
		sb.AppendLine($"#define {variableName.ToUpperInvariant()}_HEIGHT {sheet.Height}");
		sb.AppendLine();

		// Sprite metadata
		sb.AppendLine($"typedef struct {{ int x, y, w, h; const char* name; }} SpriteInfo;");
		sb.AppendLine();
		sb.AppendLine($"static const SpriteInfo {variableName}_sprites[] = {{");
		foreach (var p in sheet.Placements) {
			sb.AppendLine($"    {{ {p.X}, {p.Y}, {p.Width}, {p.Height}, \"{p.Name}\" }},");
		}

		sb.AppendLine("};");
		sb.AppendLine();
		sb.AppendLine($"#define {variableName.ToUpperInvariant()}_SPRITE_COUNT {sheet.Placements.Count}");
		sb.AppendLine();
		sb.AppendLine("#endif");

		return sb.ToString();
	}

	/// <summary>
	/// Export to NES CHR format (.chr file).
	/// </summary>
	public static byte[] ExportToNesChr(byte[,] pixels) {
		int height = pixels.GetLength(0);
		int width = pixels.GetLength(1);

		int tilesX = (width + 7) / 8;
		int tilesY = (height + 7) / 8;
		int tileCount = tilesX * tilesY;

		var chrData = new byte[tileCount * 16]; // 16 bytes per tile

		for (int ty = 0; ty < tilesY; ty++) {
			for (int tx = 0; tx < tilesX; tx++) {
				int tileIndex = ty * tilesX + tx;
				int chrOffset = tileIndex * 16;

				// Encode 8x8 tile in NES 2bpp format
				for (int row = 0; row < 8; row++) {
					byte plane0 = 0, plane1 = 0;

					for (int col = 0; col < 8; col++) {
						int px = tx * 8 + col;
						int py = ty * 8 + row;

						byte pixel = (px < width && py < height) ? pixels[py, px] : (byte)0;

						if ((pixel & 1) != 0) plane0 |= (byte)(0x80 >> col);
						if ((pixel & 2) != 0) plane1 |= (byte)(0x80 >> col);
					}

					chrData[chrOffset + row] = plane0;
					chrData[chrOffset + 8 + row] = plane1;
				}
			}
		}

		return chrData;
	}

	/// <summary>
	/// Export to SNES 4bpp format.
	/// </summary>
	public static byte[] ExportToSnes4bpp(byte[,] pixels) {
		int height = pixels.GetLength(0);
		int width = pixels.GetLength(1);

		int tilesX = (width + 7) / 8;
		int tilesY = (height + 7) / 8;
		int tileCount = tilesX * tilesY;

		var data = new byte[tileCount * 32]; // 32 bytes per 4bpp tile

		for (int ty = 0; ty < tilesY; ty++) {
			for (int tx = 0; tx < tilesX; tx++) {
				int tileIndex = ty * tilesX + tx;
				int offset = tileIndex * 32;

				for (int row = 0; row < 8; row++) {
					byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;

					for (int col = 0; col < 8; col++) {
						int px = tx * 8 + col;
						int py = ty * 8 + row;

						byte pixel = (px < width && py < height) ? pixels[py, px] : (byte)0;

						if ((pixel & 1) != 0) plane0 |= (byte)(0x80 >> col);
						if ((pixel & 2) != 0) plane1 |= (byte)(0x80 >> col);
						if ((pixel & 4) != 0) plane2 |= (byte)(0x80 >> col);
						if ((pixel & 8) != 0) plane3 |= (byte)(0x80 >> col);
					}

					// SNES 4bpp interleaved format
					data[offset + row * 2] = plane0;
					data[offset + row * 2 + 1] = plane1;
					data[offset + 16 + row * 2] = plane2;
					data[offset + 16 + row * 2 + 1] = plane3;
				}
			}
		}

		return data;
	}

	/// <summary>
	/// Export animation to GIF-compatible frame data.
	/// </summary>
	public static List<AnimationGifFrame> ExportAnimationFrames(
		AnimationSequence animation,
		List<SpriteExtractor.Metasprite> metasprites,
		ChrEditor chr,
		byte[][] palette) {
		var frames = new List<AnimationGifFrame>();

		foreach (var frame in animation.Frames) {
			if (frame.FrameIndex >= metasprites.Count)
				continue;

			var meta = metasprites[frame.FrameIndex];
			var pixels = SpriteExtractor.RenderMetasprite(meta, chr);

			// Apply palette to get RGB
			var rgbPixels = ApplyPalette(pixels, palette);

			frames.Add(new AnimationGifFrame(
				rgbPixels,
				pixels.GetLength(1),
				pixels.GetLength(0),
				frame.Duration * 16 // Convert to milliseconds (assuming 60fps, ~16ms per frame)
			));
		}

		return frames;
	}

	private static byte[,][] ApplyPalette(byte[,] indexed, byte[][] palette) {
		int h = indexed.GetLength(0);
		int w = indexed.GetLength(1);
		var result = new byte[h, w][];

		for (int y = 0; y < h; y++) {
			for (int x = 0; x < w; x++) {
				int idx = indexed[y, x] % palette.Length;
				result[y, x] = palette[idx];
			}
		}

		return result;
	}
}

/// <summary>
/// Animation frame data for GIF export.
/// </summary>
public record AnimationGifFrame(
	byte[,][] RgbPixels,
	int Width,
	int Height,
	int DurationMs
);

#endregion
