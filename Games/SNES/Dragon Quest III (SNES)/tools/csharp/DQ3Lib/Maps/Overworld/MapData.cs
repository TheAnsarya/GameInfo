using DQ3Lib.Common;
using DQ3Lib.Common.Rom;
using DQ3Lib.Compression;
using DQ3Lib.Streams;

namespace DQ3Lib.Maps.Overworld;

public static class MapData {
	// Overworld tilemap top-level grid layout
	public static byte[] GetLayout(Rom rom, PCAddress? address) {
		var actualAddress = address ?? rom.ToPCAddress(new SNESAddress(DefaultValues.MapsOverworldMapDataLayoutAddress));
		var source = rom.GetStream(actualAddress);
		return BasicRing400.Decompress(source, 0x2000);
	}

	public static MetaTileDefinition[] GetTileDefinitions(Rom rom, PCAddress? address) {
		// 0xe54f38 - 0xe5569f
		var actualAddress = address ?? rom.ToPCAddress(new SNESAddress(DefaultValues.MapsOverworldMetaTileDefinition));
		var source = rom.GetStream(actualAddress);
		var entries = new List<MetaTileDefinition>();

		// 237 entries at present, $00 to $EC
		while (source.Address < 0xe5569f) {
			entries.Add(new MetaTileDefinition(source));
		}

		return entries.ToArray();
	}

	public static Chunk[] GetTilemapChunks() {
		var chunks = new List<Chunk>();
		var sources = GetTilemapChunkStreams();

		for (int i = 0; i < DefaultValues.MapsOverworldChunkEntries; i++) {
			chunks.Add(new Chunk {
				Index = i,
				Data = new byte[] {
					sources[0][0].Byte(),
					sources[0][1].Byte(),
					sources[0][2].Byte(),
					sources[0][3].Byte(),

					sources[1][0].Byte(),
					sources[1][1].Byte(),
					sources[1][2].Byte(),
					sources[1][3].Byte(),

					sources[2][0].Byte(),
					sources[2][1].Byte(),
					sources[2][2].Byte(),
					sources[2][3].Byte(),

					sources[3][0].Byte(),
					sources[3][1].Byte(),
					sources[3][2].Byte(),
					sources[3][3].Byte(),
				}
			});
		}

		return chunks.ToArray();
	}

	public static ByteArrayStream[][] GetTilemapChunkStreams(Rom rom) {
		var tilemaps = new ByteArrayStream[][] {
			// Top Row
			new ByteArrayStream[]{
				rom.GetStream(0xeda49c),	// Top left tile
				rom.GetStream(0xedaed9),
				rom.GetStream(0xedb916),
				rom.GetStream(0xedc353)		// Top right tile
			},
			new ByteArrayStream[]{
				rom.GetStream(0xedcd90),
				rom.GetStream(0xedd7cd),
				rom.GetStream(0xede20a),
				rom.GetStream(0xedec47)
			},
			new ByteArrayStream[]{
				rom.GetStream(0xedf684),
				rom.GetStream(0xee00c1),
				rom.GetStream(0xee0afe),
				rom.GetStream(0xee153b)
			},
			// Bottom row
			new ByteArrayStream[]{
				rom.GetStream(0xee1f78),	// Bottom left tile
				rom.GetStream(0xee29b5),
				rom.GetStream(0xee33f2),
				rom.GetStream(0xee3e2f)		// Bottom right tile
			}
		};

		return tilemaps;
	}






	public static RomByteArray[,] GetOverworldTilemaps() {
		var tilemaps = new RomByteArray[4, 4] {
			// Top Row
			{
				Rom.ByteArray(0xeda49c),	// Top left tile
				Rom.ByteArray(0xedaed9),
				Rom.ByteArray(0xedb916),
				Rom.ByteArray(0xedc353)		// Top right tile
			},
			{
				Rom.ByteArray(0xedcd90),
				Rom.ByteArray(0xedd7cd),
				Rom.ByteArray(0xede20a),
				Rom.ByteArray(0xedec47)
			},
			{
				Rom.ByteArray(0xedf684),
				Rom.ByteArray(0xee00c1),
				Rom.ByteArray(0xee0afe),
				Rom.ByteArray(0xee153b)
			},
			// Bottom row
			{
				Rom.ByteArray(0xee1f78),	// Bottom left tile
				Rom.ByteArray(0xee29b5),
				Rom.ByteArray(0xee33f2),
				Rom.ByteArray(0xee3e2f)		// Bottom right tile
			}
		};

		return tilemaps;
	}

	public static byte[,] GetTilemapData() {
		var layout = GetLayout();
		var tilemaps = GetOverworldTilemaps();

		// fullmap[y, x]
		var fullmap = new byte[0x100, 0x100];
		for (int i = 0; i < 0x1000; i++) {
			// each 4 by 4 chunk
			var sourceIndex = layout[i * 2];
			var xStart = i % 64 * 4;
			var yStart = i / 64 * 4;

			for (int k = 0; k < 4; k++) {
				fullmap[yStart + 0, xStart + k] = tilemaps[0, k][sourceIndex];
				fullmap[yStart + 1, xStart + k] = tilemaps[1, k][sourceIndex];
				fullmap[yStart + 2, xStart + k] = tilemaps[2, k][sourceIndex];
				fullmap[yStart + 3, xStart + k] = tilemaps[3, k][sourceIndex];
			}
		}

		return fullmap;
	}
}
