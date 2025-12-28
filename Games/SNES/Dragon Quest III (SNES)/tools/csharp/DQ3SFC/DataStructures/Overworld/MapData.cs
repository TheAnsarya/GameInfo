using DQ3SFC.Compression;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DQ3SFC.DataStructures.Overworld;

public static class MapData {
	public const int ChunkEntries = 0xa3d;


	public readonly static int[] TilemapAddresses = new int[4 * 4] {
			// Top Row
			0xeda49c,	// Top left tile
			0xedaed9,
			0xedb916,
			0xedc353,	// Top right tile

			0xedcd90,
			0xedd7cd,
			0xede20a,
			0xedec47,

			0xedf684,
			0xee00c1,
			0xee0afe,
			0xee153b,

			// Bottom row
			0xee1f78,	// Bottom left tile
			0xee29b5,
			0xee33f2,
			0xee3e2f	// Bottom right tile
		};

	// Overworld tilemap top-level grid layout
	public static Memory<byte> GetLayout() {
		var source = Rom.Slice(0xed8a00);
		return BasicRing400.Decompress(source, 0x2000);
	}

	public static MetaTileDefinition[] GetTileDefinitions() {
		// 0xe54f38 - 0xe5569f
		var source = Rom.StreamAt(0xe54f38);
		var entries = new List<MetaTileDefinition>();
		var endAddress = Rom.AddressToPC(0xe5569f);

		// 237 entries at present, $00 to $EC
		while (source.Address < endAddress) {
			entries.Add(new MetaTileDefinition(source));
		}

		return entries.ToArray();
	}

	public static Chunk[] GetTilemapChunks() {
		var chunks = new List<Chunk>();
		var sources = GetTilemapChunkStreams();

		for (int i = 0; i < ChunkEntries; i++) {
			chunks.Add(new Chunk {
				Index = i,
				Data = new byte[] {
					sources[0x00].Byte(),
					sources[0x01].Byte(),
					sources[0x02].Byte(),
					sources[0x03].Byte(),
					sources[0x04].Byte(),
					sources[0x05].Byte(),
					sources[0x06].Byte(),
					sources[0x07].Byte(),
					sources[0x08].Byte(),
					sources[0x09].Byte(),
					sources[0x0a].Byte(),
					sources[0x0b].Byte(),
					sources[0x0c].Byte(),
					sources[0x0d].Byte(),
					sources[0x0e].Byte(),
					sources[0x0f].Byte(),
				}
			});
		}

		return chunks.ToArray();
	}

	public static ByteArrayStream[] GetTilemapChunkStreams() {
		var tilemaps =
			TilemapAddresses
				.Select(x => new ByteArrayStream(Rom.Slice(x, ChunkEntries)))
				.ToArray();

		return tilemaps;
	}

	public static byte[,] GetTilemapData() {
		var layout = GetLayout().Span;
		var tilemaps =
			TilemapAddresses
				.Select(x => Rom.Slice(x, ChunkEntries))
				.ToArray();

		// fullmap[y, x]
		var fullmap = new byte[0x100, 0x100];
		for (int i = 0; i < 0x1000; i++) {
			// each 4 by 4 chunk
			var sourceIndex = layout[i * 2];
			var xStart = i % 64 * 4;
			var yStart = i / 64 * 4;

			for (int k = 0; k < 4; k++) {
				var tilemapStart = k * 4;
				fullmap[yStart + 0, xStart + k] = tilemaps[tilemapStart + 0].Span[sourceIndex];
				fullmap[yStart + 1, xStart + k] = tilemaps[tilemapStart + 1].Span[sourceIndex];
				fullmap[yStart + 2, xStart + k] = tilemaps[tilemapStart + 2].Span[sourceIndex];
				fullmap[yStart + 3, xStart + k] = tilemaps[tilemapStart + 3].Span[sourceIndex];
			}
		}

		return fullmap;
	}
}

