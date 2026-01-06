using GameInfoTools.Core;

namespace GameInfoTools.UI.Services;

/// <summary>
/// Service for loading DQ3 SNES map data using the same format as DQ3Lib.
/// Provides chunk-based overworld loading without direct DQ3Lib dependency.
/// </summary>
public class DQ3MapDataService {
	/// <summary>
	/// DQ3 SNES ROM addresses for overworld data.
	/// </summary>
	public static class Addresses {
		/// <summary>Overworld layout - compressed, 0x2000 bytes decompressed.</summary>
		public const int OverworldLayout = 0x255000;

		/// <summary>MetaTile definitions start - 237 entries ($00 to $EC).</summary>
		public const int MetaTileDefinitions = 0xE54F38;

		/// <summary>MetaTile definitions end.</summary>
		public const int MetaTileDefinitionsEnd = 0xE5569F;

		/// <summary>Number of overworld chunk entries.</summary>
		public const int ChunkEntryCount = 0xA3D;

		/// <summary>
		/// Tilemap stream addresses - 4x4 grid of chunk streams.
		/// Each stream contains chunk data for that quadrant position.
		/// </summary>
		public static readonly int[,] TilemapStreams = {
			// Row 0 (Top)
			{ 0xEDA49C, 0xEDAED9, 0xEDB916, 0xEDC353 },
			// Row 1
			{ 0xEDCD90, 0xEDD7CD, 0xEDE20A, 0xEDEC47 },
			// Row 2
			{ 0xEDF684, 0xEE00C1, 0xEE0AFE, 0xEE153B },
			// Row 3 (Bottom)
			{ 0xEE1F78, 0xEE29B5, 0xEE33F2, 0xEE3E2F }
		};
	}

	/// <summary>
	/// A 4x4 metatile chunk from DQ3 overworld.
	/// </summary>
	public record Chunk(int Index, byte[] Data) {
		/// <summary>
		/// Get the 16-byte key for chunk deduplication.
		/// </summary>
		public string Key => string.Join("", Data.Select(x => x.ToString("x2")));

		/// <summary>
		/// Create an empty chunk (all zeros).
		/// </summary>
		public static Chunk Empty() => new(0, new byte[16]);
	}

	/// <summary>
	/// MetaTile definition - describes a 16x16 tile made of 4 8x8 tiles.
	/// </summary>
	public record MetaTileDefinition(
		byte TopLeft,
		byte TopRight,
		byte BottomLeft,
		byte BottomRight,
		byte Attributes,
		byte CollisionFlags
	);

	private readonly RomFile _rom;

	public DQ3MapDataService(RomFile rom) {
		_rom = rom ?? throw new ArgumentNullException(nameof(rom));
	}

	/// <summary>
	/// Load the overworld layout data.
	/// Returns 0x2000 bytes of layout indices.
	/// </summary>
	public byte[]? GetOverworldLayout() {
		if (!_rom.IsLoaded) return null;

		// In full implementation, would decompress using BasicRing400
		// For now, return raw data - decompression requires DQ3Lib
		var layoutAddress = Addresses.OverworldLayout;
		var layoutData = new byte[0x2000];

		try {
			for (int i = 0; i < layoutData.Length && layoutAddress + i < _rom.Length; i++) {
				layoutData[i] = _rom.ReadByte(layoutAddress + i);
			}

			return layoutData;
		} catch {
			return null;
		}
	}

	/// <summary>
	/// Load metatile definitions from ROM.
	/// </summary>
	public MetaTileDefinition[]? GetMetaTileDefinitions() {
		if (!_rom.IsLoaded) return null;

		var definitions = new List<MetaTileDefinition>();
		var address = Addresses.MetaTileDefinitions;

		// Estimate 6 bytes per definition for basic structure
		// Full implementation reads actual format from DQ3Lib
		while (address < Addresses.MetaTileDefinitionsEnd) {
			try {
				var def = new MetaTileDefinition(
					_rom.ReadByte(address),
					_rom.ReadByte(address + 1),
					_rom.ReadByte(address + 2),
					_rom.ReadByte(address + 3),
					_rom.ReadByte(address + 4),
					_rom.ReadByte(address + 5)
				);
				definitions.Add(def);
				address += 6;
			} catch {
				break;
			}
		}

		return definitions.ToArray();
	}

	/// <summary>
	/// Load chunks from the 16 tilemap streams.
	/// </summary>
	public Chunk[]? GetTilemapChunks() {
		if (!_rom.IsLoaded) return null;

		var chunks = new List<Chunk> { Chunk.Empty() };

		// Read from each of the 16 stream positions
		for (int chunkIndex = 0; chunkIndex < Addresses.ChunkEntryCount; chunkIndex++) {
			var chunkData = new byte[16];
			int byteIndex = 0;

			// Read one byte from each of the 16 stream positions
			for (int row = 0; row < 4; row++) {
				for (int col = 0; col < 4; col++) {
					var streamAddress = Addresses.TilemapStreams[row, col] + chunkIndex;
					try {
						chunkData[byteIndex++] = _rom.ReadByte(streamAddress);
					} catch {
						chunkData[byteIndex++] = 0;
					}
				}
			}

			chunks.Add(new Chunk(chunkIndex + 1, chunkData));
		}

		return chunks.ToArray();
	}

	/// <summary>
	/// Build full 256x256 overworld tilemap from layout and chunks.
	/// </summary>
	public byte[,]? GetFullOverworldTilemap() {
		var layout = GetOverworldLayout();
		if (layout is null) return null;

		var chunks = GetTilemapChunks();
		if (chunks is null) return null;

		// 256x256 tile grid
		var fullmap = new byte[256, 256];

		// Each layout entry is 2 bytes - chunk index
		// 64x64 = 4096 chunks covering 256x256 tiles (4x4 per chunk)
		for (int i = 0; i < 0x1000 && (i * 2) + 1 < layout.Length; i++) {
			var chunkIndex = layout[i * 2];
			if (chunkIndex >= chunks.Length) continue;

			var chunk = chunks[chunkIndex];
			var xStart = i % 64 * 4;
			var yStart = i / 64 * 4;

			// Fill 4x4 area from chunk
			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					if (yStart + y < 256 && xStart + x < 256) {
						fullmap[yStart + y, xStart + x] = chunk.Data[(y * 4) + x];
					}
				}
			}
		}

		return fullmap;
	}

	/// <summary>
	/// Convert 256x256 tilemap back to layout + unique chunks.
	/// Uses deduplication to minimize chunk count.
	/// </summary>
	public (byte[] Layout, List<Chunk> UniqueChunks) TilemapToChunks(byte[,] tilemap) {
		if (tilemap.GetLength(0) != 256 || tilemap.GetLength(1) != 256) {
			throw new ArgumentException("Tilemap must be 256x256");
		}

		var uniqueChunks = new List<Chunk> { Chunk.Empty() };
		var chunkLookup = new Dictionary<string, int> { [Chunk.Empty().Key] = 0 };
		var layout = new byte[0x2000];

		for (int i = 0; i < 0x1000; i++) {
			var xStart = i % 64 * 4;
			var yStart = i / 64 * 4;

			var chunkData = new byte[16];
			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					chunkData[(y * 4) + x] = tilemap[yStart + y, xStart + x];
				}
			}

			var chunk = new Chunk(uniqueChunks.Count, chunkData);
			if (!chunkLookup.TryGetValue(chunk.Key, out var existingIndex)) {
				existingIndex = uniqueChunks.Count;
				chunkLookup[chunk.Key] = existingIndex;
				uniqueChunks.Add(chunk);
			}

			layout[i * 2] = (byte)existingIndex;
			layout[(i * 2) + 1] = 0; // High byte usually 0
		}

		return (layout, uniqueChunks);
	}
}
