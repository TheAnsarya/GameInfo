using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace DQ3SFC.DataStructures.Overworld;


public class Chunk {
	public int Index { get; set; }

	// TODO: Make sure temp var access is not an issue (ie, looping)
	public Memory<byte> Data { get; set; }

	private string? _key;
	public string Key {
		get {
			_key ??= string.Join("", Data.Span.ToArray().Select(x => x.ToString("x2", CultureInfo.InvariantCulture)));

			return _key;
		}
	}

	public static Chunk Empty() {
		return new Chunk() {
			Index = 0,
			Data = new byte[16]
		};
	}

	// fullmap is [y, x];
	public static (List<Chunk> Chunks, List<int> Map) TilemapToChunks(byte[,] fullmap) {
		ArgumentNullException.ThrowIfNull(fullmap, nameof(fullmap));

		if (fullmap.GetLength(0) % 4 != 0 || fullmap.GetLength(1) % 4 != 0) {
			throw new ArgumentException("Array dimensions wrong, must be multiples of 4");
		}

		var yBlocks = fullmap.GetLength(0) / 4;
		var xBlocks = fullmap.GetLength(1) / 4;
		var totalBlocks = xBlocks * yBlocks;

		var chunks = new List<Chunk>();
		var chunkLookup = new Dictionary<string, Chunk>();
		var chunkMap = new List<int>();

		// Always start with an empty chunk
		chunks.Add(Empty());

		for (int i = 0; i < totalBlocks; i++) {
			// each 4 by 4 chunk
			var xStart = i % xBlocks * 4;
			var yStart = i / xBlocks * 4;
			var current = new Chunk {
				Data = new byte[] {
					fullmap[yStart + 0, xStart + 0],
					fullmap[yStart + 0, xStart + 1],
					fullmap[yStart + 0, xStart + 2],
					fullmap[yStart + 0, xStart + 3],
					fullmap[yStart + 1, xStart + 0],
					fullmap[yStart + 1, xStart + 1],
					fullmap[yStart + 1, xStart + 2],
					fullmap[yStart + 1, xStart + 3],
					fullmap[yStart + 2, xStart + 0],
					fullmap[yStart + 2, xStart + 1],
					fullmap[yStart + 2, xStart + 2],
					fullmap[yStart + 2, xStart + 3],
					fullmap[yStart + 3, xStart + 0],
					fullmap[yStart + 3, xStart + 1],
					fullmap[yStart + 3, xStart + 2],
					fullmap[yStart + 3, xStart + 3],
				}
			};

			if (chunkLookup.ContainsKey(current.Key)) {
				chunkMap.Add(chunkLookup[current.Key].Index);
			} else {
				current.Index = chunks.Count;
				chunks.Add(current);
				chunkLookup.Add(current.Key, current);
				chunkMap.Add(current.Index);
			}
		}

		return (chunks, chunkMap);
	}
}

