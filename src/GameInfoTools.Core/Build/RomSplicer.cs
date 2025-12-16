using System.Security.Cryptography;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Service for combining and splitting ROM data, with support for headers,
/// interleaving, and various ROM formats.
/// </summary>
public class RomSplicer {
	/// <summary>
	/// Split a ROM into multiple parts.
	/// </summary>
	/// <param name="romPath">Path to the source ROM.</param>
	/// <param name="outputDir">Directory for output parts.</param>
	/// <param name="config">Split configuration.</param>
	public async Task<SplitResult> SplitAsync(string romPath, string outputDir, SplitConfig config) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);

		var romData = await File.ReadAllBytesAsync(romPath);
		return await SplitAsync(romData, outputDir, config);
	}

	/// <summary>
	/// Split ROM data into multiple parts.
	/// </summary>
	public async Task<SplitResult> SplitAsync(byte[] romData, string outputDir, SplitConfig config) {
		ArgumentNullException.ThrowIfNull(romData);
		ArgumentNullException.ThrowIfNull(outputDir);
		ArgumentNullException.ThrowIfNull(config);

		Directory.CreateDirectory(outputDir);

		var parts = new List<SplitPart>();
		var offset = config.SkipHeader;

		// Handle header separately if present
		if (config.SkipHeader > 0 && config.ExtractHeader) {
			var headerPath = Path.Combine(outputDir, config.HeaderFileName ?? "header.bin");
			await File.WriteAllBytesAsync(headerPath, romData[..config.SkipHeader]);
			parts.Add(new SplitPart {
				FileName = config.HeaderFileName ?? "header.bin",
				Offset = 0,
				Size = config.SkipHeader,
				IsHeader = true
			});
		}

		// Split based on configuration mode
		if (config.Regions.Count > 0) {
			// Split by defined regions
			foreach (var region in config.Regions) {
				var regionOffset = region.Offset + config.SkipHeader;
				if (regionOffset >= romData.Length)
					continue;

				var size = Math.Min(region.Size, romData.Length - regionOffset);
				var regionData = romData.AsSpan(regionOffset, size).ToArray();

				var fileName = region.FileName ?? $"region_{region.Offset:x6}_{size:x6}.bin";
				var path = Path.Combine(outputDir, fileName);
				await File.WriteAllBytesAsync(path, regionData);

				parts.Add(new SplitPart {
					FileName = fileName,
					Offset = region.Offset,
					Size = size,
					Name = region.Name
				});
			}
		} else if (config.PartSize > 0) {
			// Split by fixed part size
			var partIndex = 0;
			while (offset < romData.Length) {
				var size = Math.Min(config.PartSize, romData.Length - offset);
				var partData = romData.AsSpan(offset, size).ToArray();

				var fileName = config.PartNameFormat != null
					? string.Format(config.PartNameFormat, partIndex)
					: $"part_{partIndex:d3}.bin";

				var path = Path.Combine(outputDir, fileName);
				await File.WriteAllBytesAsync(path, partData);

				parts.Add(new SplitPart {
					FileName = fileName,
					Offset = offset - config.SkipHeader,
					Size = size,
					Index = partIndex
				});

				offset += size;
				partIndex++;
			}
		} else if (config.Interleave != InterleaveMode.None) {
			// Split interleaved data
			parts.AddRange(await SplitInterleavedAsync(romData, outputDir, config));
		} else {
			throw new ArgumentException("Must specify regions, partSize, or interleave mode");
		}

		return new SplitResult {
			OriginalSize = romData.Length,
			OriginalHash = ComputeHash(romData),
			Parts = parts
		};
	}

	/// <summary>
	/// Combine multiple ROM parts into a single ROM.
	/// </summary>
	/// <param name="outputPath">Path for the combined ROM.</param>
	/// <param name="config">Combine configuration.</param>
	public async Task<CombineResult> CombineAsync(string outputPath, CombineConfig config) {
		ArgumentNullException.ThrowIfNull(outputPath);
		ArgumentNullException.ThrowIfNull(config);

		var headerSize = 0;
		var outputData = new List<byte>();

		// Add header if specified
		if (!string.IsNullOrEmpty(config.HeaderPath)) {
			if (!File.Exists(config.HeaderPath))
				throw new FileNotFoundException("Header file not found", config.HeaderPath);

			var headerData = await File.ReadAllBytesAsync(config.HeaderPath);
			outputData.AddRange(headerData);
			headerSize = headerData.Length;
		} else if (config.HeaderSize > 0) {
			// Create empty header
			outputData.AddRange(new byte[config.HeaderSize]);
			headerSize = config.HeaderSize;
		}

		// Combine parts
		if (config.Interleave != InterleaveMode.None && config.Parts.Count >= 2) {
			// Interleave parts
			var interleavedData = await CombineInterleavedAsync(config);
			outputData.AddRange(interleavedData);
		} else if (config.Parts.Count > 0) {
			// Simple concatenation (sorted by index or order)
			var sortedParts = config.Parts.OrderBy(p => p.Index ?? 0).ToList();
			foreach (var part in sortedParts) {
				if (!File.Exists(part.Path))
					throw new FileNotFoundException($"Part file not found: {part.Path}", part.Path);

				var partData = await File.ReadAllBytesAsync(part.Path);

				// Handle offset gaps
				if (part.Offset.HasValue && outputData.Count < part.Offset.Value + headerSize) {
					var padding = part.Offset.Value + headerSize - outputData.Count;
					outputData.AddRange(Enumerable.Repeat(config.FillByte, padding));
				}

				outputData.AddRange(partData);
			}
		}

		// Pad to target size if specified
		if (config.TargetSize > 0 && outputData.Count < config.TargetSize) {
			outputData.AddRange(Enumerable.Repeat(config.FillByte, config.TargetSize - outputData.Count));
		}

		// Write output
		var outputArray = outputData.ToArray();
		await File.WriteAllBytesAsync(outputPath, outputArray);

		return new CombineResult {
			PartsCount = config.Parts.Count,
			HeaderSize = headerSize,
			OutputSize = outputArray.Length,
			OutputHash = ComputeHash(outputArray)
		};
	}

	/// <summary>
	/// Extract a region from a ROM to a separate file.
	/// </summary>
	public async Task<ExtractResult> ExtractRegionAsync(string romPath, string outputPath, int offset, int size) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);

		var romData = await File.ReadAllBytesAsync(romPath);

		if (offset < 0 || offset >= romData.Length)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range");

		var actualSize = Math.Min(size, romData.Length - offset);
		var regionData = romData.AsSpan(offset, actualSize).ToArray();

		await File.WriteAllBytesAsync(outputPath, regionData);

		return new ExtractResult {
			Offset = offset,
			Size = actualSize,
			Hash = ComputeHash(regionData)
		};
	}

	/// <summary>
	/// Insert data into a ROM at a specific offset.
	/// </summary>
	public async Task<InsertResult> InsertRegionAsync(string romPath, string dataPath, string outputPath, int offset, InsertMode mode = InsertMode.Replace) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);
		if (!File.Exists(dataPath))
			throw new FileNotFoundException("Data file not found", dataPath);

		var romData = await File.ReadAllBytesAsync(romPath);
		var insertData = await File.ReadAllBytesAsync(dataPath);

		return await InsertRegionAsync(romData, insertData, outputPath, offset, mode);
	}

	/// <summary>
	/// Insert data into ROM data at a specific offset.
	/// </summary>
	public async Task<InsertResult> InsertRegionAsync(byte[] romData, byte[] insertData, string outputPath, int offset, InsertMode mode = InsertMode.Replace) {
		ArgumentNullException.ThrowIfNull(romData);
		ArgumentNullException.ThrowIfNull(insertData);

		if (offset < 0)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset cannot be negative");

		byte[] outputData;

		switch (mode) {
			case InsertMode.Replace:
				// Replace bytes at offset
				outputData = new byte[Math.Max(romData.Length, offset + insertData.Length)];
				romData.CopyTo(outputData, 0);
				insertData.CopyTo(outputData, offset);
				break;

			case InsertMode.Insert:
				// Insert bytes, shifting existing data
				outputData = new byte[romData.Length + insertData.Length];
				romData.AsSpan(0, offset).CopyTo(outputData);
				insertData.CopyTo(outputData, offset);
				if (offset < romData.Length)
					romData.AsSpan(offset).CopyTo(outputData.AsSpan(offset + insertData.Length));
				break;

			case InsertMode.Overwrite:
				// Overwrite without expanding
				outputData = (byte[])romData.Clone();
				var copyLen = Math.Min(insertData.Length, romData.Length - offset);
				if (copyLen > 0)
					insertData.AsSpan(0, copyLen).CopyTo(outputData.AsSpan(offset));
				break;

			default:
				throw new ArgumentException($"Unknown insert mode: {mode}");
		}

		await File.WriteAllBytesAsync(outputPath, outputData);

		return new InsertResult {
			Offset = offset,
			InsertedSize = insertData.Length,
			ResultSize = outputData.Length,
			Mode = mode
		};
	}

	/// <summary>
	/// Remove/strip header from a ROM.
	/// </summary>
	public async Task<StripResult> StripHeaderAsync(string romPath, string outputPath, int headerSize) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);

		var romData = await File.ReadAllBytesAsync(romPath);

		if (headerSize < 0 || headerSize >= romData.Length)
			throw new ArgumentOutOfRangeException(nameof(headerSize), "Header size is invalid");

		var strippedData = romData.AsSpan(headerSize).ToArray();
		await File.WriteAllBytesAsync(outputPath, strippedData);

		return new StripResult {
			OriginalSize = romData.Length,
			StrippedSize = strippedData.Length,
			HeaderSize = headerSize,
			HeaderHash = ComputeHash(romData.AsSpan(0, headerSize).ToArray()),
			OutputHash = ComputeHash(strippedData)
		};
	}

	/// <summary>
	/// Add header to a ROM.
	/// </summary>
	public async Task<AddHeaderResult> AddHeaderAsync(string romPath, string outputPath, byte[] header) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);
		ArgumentNullException.ThrowIfNull(header);

		var romData = await File.ReadAllBytesAsync(romPath);
		var outputData = new byte[header.Length + romData.Length];
		header.CopyTo(outputData, 0);
		romData.CopyTo(outputData, header.Length);

		await File.WriteAllBytesAsync(outputPath, outputData);

		return new AddHeaderResult {
			OriginalSize = romData.Length,
			HeaderSize = header.Length,
			OutputSize = outputData.Length,
			OutputHash = ComputeHash(outputData)
		};
	}

	/// <summary>
	/// Verify ROM matches expected checksums.
	/// </summary>
	public async Task<VerifyResult> VerifyAsync(string romPath, string? expectedMd5 = null, string? expectedSha1 = null, string? expectedCrc32 = null) {
		if (!File.Exists(romPath))
			throw new FileNotFoundException("ROM file not found", romPath);

		var romData = await File.ReadAllBytesAsync(romPath);
		var md5Hash = ComputeHash(romData);
		var sha1Hash = ComputeSha1(romData);
		var crc32 = ComputeCrc32(romData);

		return new VerifyResult {
			Size = romData.Length,
			Md5 = md5Hash,
			Sha1 = sha1Hash,
			Crc32 = crc32,
			Md5Match = expectedMd5 == null || string.Equals(md5Hash, expectedMd5, StringComparison.OrdinalIgnoreCase),
			Sha1Match = expectedSha1 == null || string.Equals(sha1Hash, expectedSha1, StringComparison.OrdinalIgnoreCase),
			Crc32Match = expectedCrc32 == null || string.Equals(crc32, expectedCrc32, StringComparison.OrdinalIgnoreCase)
		};
	}

	/// <summary>
	/// Convert between interleaving formats (e.g., SMD to BIN).
	/// </summary>
	public async Task<ConvertResult> ConvertInterleavingAsync(string inputPath, string outputPath, InterleaveMode sourceMode, InterleaveMode targetMode) {
		if (!File.Exists(inputPath))
			throw new FileNotFoundException("Input file not found", inputPath);

		var inputData = await File.ReadAllBytesAsync(inputPath);
		var deinterleaved = Deinterleave(inputData, sourceMode);
		var reinterleaved = Interleave(deinterleaved, targetMode);

		await File.WriteAllBytesAsync(outputPath, reinterleaved);

		return new ConvertResult {
			InputSize = inputData.Length,
			OutputSize = reinterleaved.Length,
			SourceMode = sourceMode,
			TargetMode = targetMode
		};
	}

	/// <summary>
	/// Load a splice manifest from JSON.
	/// </summary>
	public async Task<SpliceManifest> LoadManifestAsync(string path) {
		var json = await File.ReadAllTextAsync(path);
		return JsonSerializer.Deserialize<SpliceManifest>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse manifest");
	}

	/// <summary>
	/// Save a splice manifest to JSON.
	/// </summary>
	public async Task SaveManifestAsync(SpliceManifest manifest, string path) {
		var json = JsonSerializer.Serialize(manifest, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	#region Private Methods

	private async Task<List<SplitPart>> SplitInterleavedAsync(byte[] romData, string outputDir, SplitConfig config) {
		var parts = new List<SplitPart>();
		var deinterleaved = Deinterleave(romData.AsSpan(config.SkipHeader).ToArray(), config.Interleave);

		// For 2-way interleaving, split into two files
		switch (config.Interleave) {
			case InterleaveMode.WordSwap:
			case InterleaveMode.SMD:
				var halfSize = deinterleaved.Length / 2;
				var evenData = deinterleaved.AsSpan(0, halfSize).ToArray();
				var oddData = deinterleaved.AsSpan(halfSize).ToArray();

				await File.WriteAllBytesAsync(Path.Combine(outputDir, "even.bin"), evenData);
				await File.WriteAllBytesAsync(Path.Combine(outputDir, "odd.bin"), oddData);

				parts.Add(new SplitPart { FileName = "even.bin", Size = evenData.Length, Index = 0, Name = "Even bytes" });
				parts.Add(new SplitPart { FileName = "odd.bin", Size = oddData.Length, Index = 1, Name = "Odd bytes" });
				break;

			default:
				// For non-interleaved, just save the whole thing
				await File.WriteAllBytesAsync(Path.Combine(outputDir, "data.bin"), deinterleaved);
				parts.Add(new SplitPart { FileName = "data.bin", Size = deinterleaved.Length });
				break;
		}

		return parts;
	}

	private async Task<byte[]> CombineInterleavedAsync(CombineConfig config) {
		var partDataList = new List<byte[]>();

		foreach (var part in config.Parts.OrderBy(p => p.Index ?? 0)) {
			if (!File.Exists(part.Path))
				throw new FileNotFoundException($"Part file not found: {part.Path}", part.Path);
			partDataList.Add(await File.ReadAllBytesAsync(part.Path));
		}

		if (config.Interleave == InterleaveMode.WordSwap && partDataList.Count >= 2) {
			// Word-swap two parts
			return InterleaveWordSwap(partDataList[0], partDataList[1]);
		} else if (config.Interleave == InterleaveMode.SMD && partDataList.Count >= 2) {
			// SMD interleaving
			return InterleaveSmd(partDataList[0], partDataList[1]);
		}

		// Default: concatenate
		return partDataList.SelectMany(p => p).ToArray();
	}

	private byte[] Deinterleave(byte[] data, InterleaveMode mode) {
		return mode switch {
			InterleaveMode.None => data,
			InterleaveMode.WordSwap => DeinterleaveWordSwap(data),
			InterleaveMode.SMD => DeinterleaveSmd(data),
			_ => data
		};
	}

	private byte[] Interleave(byte[] data, InterleaveMode mode) {
		return mode switch {
			InterleaveMode.None => data,
			InterleaveMode.WordSwap => InterleaveWordSwapSingle(data),
			InterleaveMode.SMD => InterleaveSmdSingle(data),
			_ => data
		};
	}

	private byte[] DeinterleaveWordSwap(byte[] data) {
		// Separate even and odd bytes
		var halfSize = data.Length / 2;
		var result = new byte[data.Length];

		for (var i = 0; i < data.Length; i += 2) {
			result[i / 2] = data[i];
			result[halfSize + i / 2] = data[i + 1];
		}

		return result;
	}

	private byte[] InterleaveWordSwap(byte[] even, byte[] odd) {
		var size = Math.Max(even.Length, odd.Length);
		var result = new byte[size * 2];

		for (var i = 0; i < size; i++) {
			result[i * 2] = i < even.Length ? even[i] : (byte)0;
			result[i * 2 + 1] = i < odd.Length ? odd[i] : (byte)0;
		}

		return result;
	}

	private byte[] InterleaveWordSwapSingle(byte[] data) {
		// Re-interleave pre-split data
		var halfSize = data.Length / 2;
		var result = new byte[data.Length];

		for (var i = 0; i < halfSize; i++) {
			result[i * 2] = data[i];
			result[i * 2 + 1] = data[halfSize + i];
		}

		return result;
	}

	private byte[] DeinterleaveSmd(byte[] data) {
		// SMD format: 16KB blocks with odd/even byte interleaving
		const int blockSize = 16384;
		var blocks = (data.Length + blockSize - 1) / blockSize;
		var result = new byte[data.Length];
		var resultOffset = 0;

		for (var block = 0; block < blocks; block++) {
			var blockStart = block * blockSize;
			var thisBlockSize = Math.Min(blockSize, data.Length - blockStart);
			var halfBlock = thisBlockSize / 2;

			// Each block: first half is odd bytes, second half is even bytes
			for (var i = 0; i < halfBlock; i++) {
				result[resultOffset + i * 2] = data[blockStart + halfBlock + i]; // even
				result[resultOffset + i * 2 + 1] = data[blockStart + i]; // odd
			}

			resultOffset += thisBlockSize;
		}

		return result;
	}

	private byte[] InterleaveSmd(byte[] even, byte[] odd) {
		const int blockSize = 16384;
		var size = Math.Max(even.Length, odd.Length);
		var result = new byte[size * 2];
		var blocks = (size * 2 + blockSize - 1) / blockSize;

		for (var block = 0; block < blocks; block++) {
			var blockStart = block * blockSize;
			var halfBlock = blockSize / 2;
			var evenStart = block * halfBlock;
			var oddStart = block * halfBlock;

			for (var i = 0; i < halfBlock && (evenStart + i) < even.Length; i++) {
				result[blockStart + halfBlock + i] = evenStart + i < even.Length ? even[evenStart + i] : (byte)0;
				result[blockStart + i] = oddStart + i < odd.Length ? odd[oddStart + i] : (byte)0;
			}
		}

		return result;
	}

	private byte[] InterleaveSmdSingle(byte[] data) {
		const int blockSize = 16384;
		var blocks = (data.Length + blockSize - 1) / blockSize;
		var result = new byte[data.Length];
		var sourceOffset = 0;

		for (var block = 0; block < blocks; block++) {
			var blockStart = block * blockSize;
			var thisBlockSize = Math.Min(blockSize, data.Length - blockStart);
			var halfBlock = thisBlockSize / 2;

			for (var i = 0; i < halfBlock; i++) {
				// even bytes go to second half of block
				result[blockStart + halfBlock + i] = data[sourceOffset + i * 2];
				// odd bytes go to first half of block
				result[blockStart + i] = data[sourceOffset + i * 2 + 1];
			}

			sourceOffset += thisBlockSize;
		}

		return result;
	}

	private static string ComputeHash(byte[] data) {
		var hash = MD5.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	private static string ComputeSha1(byte[] data) {
		var hash = SHA1.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	private static string ComputeCrc32(byte[] data) {
		uint crc = 0xffffffff;
		foreach (var b in data) {
			crc ^= b;
			for (var i = 0; i < 8; i++) {
				crc = (crc & 1) != 0 ? (crc >> 1) ^ 0xedb88320 : crc >> 1;
			}
		}
		return (~crc).ToString("x8");
	}

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};

	#endregion
}

#region Configuration Types

/// <summary>
/// Configuration for splitting a ROM.
/// </summary>
public record SplitConfig {
	/// <summary>Bytes to skip at start (header size).</summary>
	public int SkipHeader { get; init; }

	/// <summary>Whether to extract header as separate file.</summary>
	public bool ExtractHeader { get; init; }

	/// <summary>Filename for extracted header.</summary>
	public string? HeaderFileName { get; init; }

	/// <summary>Fixed size for each part (if using uniform splits).</summary>
	public int PartSize { get; init; }

	/// <summary>Format string for part filenames (e.g., "bank_{0:d2}.bin").</summary>
	public string? PartNameFormat { get; init; }

	/// <summary>Specific regions to extract.</summary>
	public List<RegionConfig> Regions { get; init; } = [];

	/// <summary>Interleaving mode of source ROM.</summary>
	public InterleaveMode Interleave { get; init; } = InterleaveMode.None;
}

/// <summary>
/// Configuration for a specific region to extract.
/// </summary>
public record RegionConfig {
	/// <summary>Offset in the ROM (after header).</summary>
	public int Offset { get; init; }

	/// <summary>Size of the region.</summary>
	public int Size { get; init; }

	/// <summary>Output filename.</summary>
	public string? FileName { get; init; }

	/// <summary>Descriptive name for the region.</summary>
	public string? Name { get; init; }
}

/// <summary>
/// Configuration for combining ROM parts.
/// </summary>
public record CombineConfig {
	/// <summary>Path to header file (optional).</summary>
	public string? HeaderPath { get; init; }

	/// <summary>Size of header to create (if no header file).</summary>
	public int HeaderSize { get; init; }

	/// <summary>Parts to combine.</summary>
	public List<PartConfig> Parts { get; init; } = [];

	/// <summary>Target size for output (pads with fill byte).</summary>
	public int TargetSize { get; init; }

	/// <summary>Byte value for padding.</summary>
	public byte FillByte { get; init; } = 0xff;

	/// <summary>Interleaving mode for output.</summary>
	public InterleaveMode Interleave { get; init; } = InterleaveMode.None;
}

/// <summary>
/// Configuration for a single part in combination.
/// </summary>
public record PartConfig {
	/// <summary>Path to the part file.</summary>
	public required string Path { get; init; }

	/// <summary>Index for ordering (optional).</summary>
	public int? Index { get; init; }

	/// <summary>Offset in output (optional, for sparse assembly).</summary>
	public int? Offset { get; init; }
}

/// <summary>
/// Interleaving mode for ROM data.
/// </summary>
public enum InterleaveMode {
	/// <summary>No interleaving.</summary>
	None,

	/// <summary>Word-swapped (alternating bytes).</summary>
	WordSwap,

	/// <summary>SMD format (Genesis/Mega Drive dumps).</summary>
	SMD,

	/// <summary>Super Magic Drive format.</summary>
	SuperMD
}

/// <summary>
/// Mode for inserting data into a ROM.
/// </summary>
public enum InsertMode {
	/// <summary>Replace bytes at offset (may expand ROM).</summary>
	Replace,

	/// <summary>Insert bytes, shifting existing data.</summary>
	Insert,

	/// <summary>Overwrite without expanding.</summary>
	Overwrite
}

#endregion

#region Result Types

/// <summary>
/// Result of a split operation.
/// </summary>
public record SplitResult {
	/// <summary>Original ROM size.</summary>
	public int OriginalSize { get; init; }

	/// <summary>MD5 hash of original ROM.</summary>
	public string OriginalHash { get; init; } = "";

	/// <summary>Parts created.</summary>
	public List<SplitPart> Parts { get; init; } = [];
}

/// <summary>
/// Information about a split part.
/// </summary>
public record SplitPart {
	/// <summary>Output filename.</summary>
	public string FileName { get; init; } = "";

	/// <summary>Offset in original ROM.</summary>
	public int Offset { get; init; }

	/// <summary>Size of the part.</summary>
	public int Size { get; init; }

	/// <summary>Index (for numbered parts).</summary>
	public int? Index { get; init; }

	/// <summary>Descriptive name.</summary>
	public string? Name { get; init; }

	/// <summary>Whether this is the header.</summary>
	public bool IsHeader { get; init; }
}

/// <summary>
/// Result of a combine operation.
/// </summary>
public record CombineResult {
	/// <summary>Number of parts combined.</summary>
	public int PartsCount { get; init; }

	/// <summary>Size of header added.</summary>
	public int HeaderSize { get; init; }

	/// <summary>Total output size.</summary>
	public int OutputSize { get; init; }

	/// <summary>MD5 hash of output.</summary>
	public string OutputHash { get; init; } = "";
}

/// <summary>
/// Result of an extract operation.
/// </summary>
public record ExtractResult {
	/// <summary>Offset extracted from.</summary>
	public int Offset { get; init; }

	/// <summary>Size of extracted data.</summary>
	public int Size { get; init; }

	/// <summary>MD5 hash of extracted data.</summary>
	public string Hash { get; init; } = "";
}

/// <summary>
/// Result of an insert operation.
/// </summary>
public record InsertResult {
	/// <summary>Offset inserted at.</summary>
	public int Offset { get; init; }

	/// <summary>Size of inserted data.</summary>
	public int InsertedSize { get; init; }

	/// <summary>Total result size.</summary>
	public int ResultSize { get; init; }

	/// <summary>Insert mode used.</summary>
	public InsertMode Mode { get; init; }
}

/// <summary>
/// Result of stripping a header.
/// </summary>
public record StripResult {
	/// <summary>Original file size.</summary>
	public int OriginalSize { get; init; }

	/// <summary>Size after stripping.</summary>
	public int StrippedSize { get; init; }

	/// <summary>Size of stripped header.</summary>
	public int HeaderSize { get; init; }

	/// <summary>MD5 hash of header.</summary>
	public string HeaderHash { get; init; } = "";

	/// <summary>MD5 hash of stripped ROM.</summary>
	public string OutputHash { get; init; } = "";
}

/// <summary>
/// Result of adding a header.
/// </summary>
public record AddHeaderResult {
	/// <summary>Original ROM size.</summary>
	public int OriginalSize { get; init; }

	/// <summary>Size of added header.</summary>
	public int HeaderSize { get; init; }

	/// <summary>Total output size.</summary>
	public int OutputSize { get; init; }

	/// <summary>MD5 hash of output.</summary>
	public string OutputHash { get; init; } = "";
}

/// <summary>
/// Result of verification.
/// </summary>
public record VerifyResult {
	/// <summary>ROM size.</summary>
	public int Size { get; init; }

	/// <summary>MD5 hash.</summary>
	public string Md5 { get; init; } = "";

	/// <summary>SHA1 hash.</summary>
	public string Sha1 { get; init; } = "";

	/// <summary>CRC32 hash.</summary>
	public string Crc32 { get; init; } = "";

	/// <summary>Whether MD5 matches expected.</summary>
	public bool Md5Match { get; init; } = true;

	/// <summary>Whether SHA1 matches expected.</summary>
	public bool Sha1Match { get; init; } = true;

	/// <summary>Whether CRC32 matches expected.</summary>
	public bool Crc32Match { get; init; } = true;

	/// <summary>Overall match result.</summary>
	public bool AllMatch => Md5Match && Sha1Match && Crc32Match;
}

/// <summary>
/// Result of interleaving conversion.
/// </summary>
public record ConvertResult {
	/// <summary>Input file size.</summary>
	public int InputSize { get; init; }

	/// <summary>Output file size.</summary>
	public int OutputSize { get; init; }

	/// <summary>Source interleaving mode.</summary>
	public InterleaveMode SourceMode { get; init; }

	/// <summary>Target interleaving mode.</summary>
	public InterleaveMode TargetMode { get; init; }
}

/// <summary>
/// Manifest describing a ROM's structure for splicing.
/// </summary>
public record SpliceManifest {
	/// <summary>Format version.</summary>
	public int Version { get; init; } = 1;

	/// <summary>ROM name/title.</summary>
	public string? Name { get; init; }

	/// <summary>Platform.</summary>
	public string? Platform { get; init; }

	/// <summary>Header size.</summary>
	public int HeaderSize { get; init; }

	/// <summary>Total ROM size (without header).</summary>
	public int RomSize { get; init; }

	/// <summary>Interleaving mode.</summary>
	public InterleaveMode Interleave { get; init; }

	/// <summary>Defined regions.</summary>
	public List<ManifestRegion> Regions { get; init; } = [];

	/// <summary>Checksums for verification.</summary>
	public ManifestChecksums? Checksums { get; init; }
}

/// <summary>
/// Region definition in a manifest.
/// </summary>
public record ManifestRegion {
	/// <summary>Region name.</summary>
	public required string Name { get; init; }

	/// <summary>Offset in ROM.</summary>
	public int Offset { get; init; }

	/// <summary>Region size.</summary>
	public int Size { get; init; }

	/// <summary>Description.</summary>
	public string? Description { get; init; }

	/// <summary>Content type (code, data, graphics, etc.).</summary>
	public string? Type { get; init; }
}

/// <summary>
/// Checksums for a ROM.
/// </summary>
public record ManifestChecksums {
	/// <summary>MD5 hash.</summary>
	public string? Md5 { get; init; }

	/// <summary>SHA1 hash.</summary>
	public string? Sha1 { get; init; }

	/// <summary>CRC32 hash.</summary>
	public string? Crc32 { get; init; }
}

#endregion
