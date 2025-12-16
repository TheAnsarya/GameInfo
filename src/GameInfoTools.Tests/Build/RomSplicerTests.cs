using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests.Build;

/// <summary>
/// Unit tests for RomSplicer service.
/// </summary>
public class RomSplicerTests : IDisposable {
	private readonly RomSplicer _splicer;
	private readonly string _tempDir;

	public RomSplicerTests() {
		_splicer = new RomSplicer();
		_tempDir = Path.Combine(Path.GetTempPath(), $"RomSplicerTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, true);
		}
		GC.SuppressFinalize(this);
	}

	private string CreateTempFile(string name, byte[] data) {
		var path = Path.Combine(_tempDir, name);
		File.WriteAllBytes(path, data);
		return path;
	}

	private byte[] CreateTestRom(int size, byte pattern = 0) {
		var data = new byte[size];
		for (var i = 0; i < size; i++) {
			data[i] = pattern == 0 ? (byte)(i & 0xff) : pattern;
		}
		return data;
	}

	#region Split Tests

	[Fact]
	public async Task SplitAsync_ByPartSize_CreatesCorrectParts() {
		// Arrange
		var romData = CreateTestRom(1024);
		var romPath = CreateTempFile("test.rom", romData);
		var outputDir = Path.Combine(_tempDir, "split_parts");
		var config = new SplitConfig { PartSize = 256 };

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Equal(1024, result.OriginalSize);
		Assert.Equal(4, result.Parts.Count);
		Assert.All(result.Parts, p => Assert.Equal(256, p.Size));
	}

	[Fact]
	public async Task SplitAsync_ByRegions_ExtractsCorrectData() {
		// Arrange
		var romData = new byte[512];
		for (var i = 0; i < 512; i++) romData[i] = (byte)(i & 0xff);
		var romPath = CreateTempFile("test.rom", romData);
		var outputDir = Path.Combine(_tempDir, "split_regions");
		var config = new SplitConfig {
			Regions = [
				new RegionConfig { Offset = 0, Size = 128, Name = "Header", FileName = "header.bin" },
				new RegionConfig { Offset = 128, Size = 256, Name = "Code", FileName = "code.bin" },
				new RegionConfig { Offset = 384, Size = 128, Name = "Data", FileName = "data.bin" }
			]
		};

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Equal(3, result.Parts.Count);
		Assert.Equal("header.bin", result.Parts[0].FileName);
		Assert.Equal(128, result.Parts[0].Size);
		Assert.Equal("code.bin", result.Parts[1].FileName);
		Assert.Equal(256, result.Parts[1].Size);
	}

	[Fact]
	public async Task SplitAsync_WithHeader_ExtractsHeaderSeparately() {
		// Arrange
		var header = new byte[] { 0x4e, 0x45, 0x53, 0x1a, 0x02, 0x01, 0x00, 0x00 }; // NES header
		var romContent = CreateTestRom(256);
		var romData = header.Concat(romContent).ToArray();
		var romPath = CreateTempFile("test.nes", romData);
		var outputDir = Path.Combine(_tempDir, "split_header");
		var config = new SplitConfig {
			SkipHeader = 8,
			ExtractHeader = true,
			HeaderFileName = "nes_header.bin",
			PartSize = 128
		};

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		var headerPart = result.Parts.FirstOrDefault(p => p.IsHeader);
		Assert.NotNull(headerPart);
		Assert.Equal("nes_header.bin", headerPart.FileName);
		Assert.Equal(8, headerPart.Size);
	}

	[Fact]
	public async Task SplitAsync_WithPartNameFormat_UsesFormat() {
		// Arrange
		var romData = CreateTestRom(512);
		var romPath = CreateTempFile("test.rom", romData);
		var outputDir = Path.Combine(_tempDir, "split_format");
		var config = new SplitConfig {
			PartSize = 128,
			PartNameFormat = "bank_{0:d2}.bin"
		};

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Equal("bank_00.bin", result.Parts[0].FileName);
		Assert.Equal("bank_01.bin", result.Parts[1].FileName);
		Assert.Equal("bank_02.bin", result.Parts[2].FileName);
		Assert.Equal("bank_03.bin", result.Parts[3].FileName);
	}

	[Fact]
	public async Task SplitAsync_LastPartSmaller_HandlesCorrectly() {
		// Arrange
		var romData = CreateTestRom(300); // Not evenly divisible by 128
		var romPath = CreateTempFile("test.rom", romData);
		var outputDir = Path.Combine(_tempDir, "split_uneven");
		var config = new SplitConfig { PartSize = 128 };

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Equal(3, result.Parts.Count);
		Assert.Equal(128, result.Parts[0].Size);
		Assert.Equal(128, result.Parts[1].Size);
		Assert.Equal(44, result.Parts[2].Size); // Remainder
	}

	[Fact]
	public async Task SplitAsync_WordSwapInterleave_SplitsCorrectly() {
		// Arrange: Create interleaved data (alternating bytes)
		var romData = new byte[256];
		for (var i = 0; i < 128; i++) {
			romData[i * 2] = (byte)i;       // Even positions
			romData[i * 2 + 1] = (byte)(i + 128); // Odd positions
		}
		var romPath = CreateTempFile("interleaved.rom", romData);
		var outputDir = Path.Combine(_tempDir, "split_interleave");
		var config = new SplitConfig { Interleave = InterleaveMode.WordSwap };

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Equal(2, result.Parts.Count);
		Assert.Contains(result.Parts, p => p.FileName == "even.bin");
		Assert.Contains(result.Parts, p => p.FileName == "odd.bin");
	}

	#endregion

	#region Combine Tests

	[Fact]
	public async Task CombineAsync_SimpleConcatenation_CombinesCorrectly() {
		// Arrange
		var part1 = CreateTempFile("part1.bin", new byte[] { 0x00, 0x01, 0x02, 0x03 });
		var part2 = CreateTempFile("part2.bin", new byte[] { 0x04, 0x05, 0x06, 0x07 });
		var outputPath = Path.Combine(_tempDir, "combined.rom");
		var config = new CombineConfig {
			Parts = [
				new PartConfig { Path = part1, Index = 0 },
				new PartConfig { Path = part2, Index = 1 }
			]
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		Assert.Equal(8, result.OutputSize);
		Assert.Equal(2, result.PartsCount);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07 }, outputData);
	}

	[Fact]
	public async Task CombineAsync_WithHeaderFile_AddsHeader() {
		// Arrange
		var headerData = new byte[] { 0x4e, 0x45, 0x53, 0x1a };
		var headerPath = CreateTempFile("header.bin", headerData);
		var part1 = CreateTempFile("data.bin", CreateTestRom(16));
		var outputPath = Path.Combine(_tempDir, "combined.nes");
		var config = new CombineConfig {
			HeaderPath = headerPath,
			Parts = [new PartConfig { Path = part1 }]
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		Assert.Equal(4, result.HeaderSize);
		Assert.Equal(20, result.OutputSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(0x4e, outputData[0]); // 'N'
		Assert.Equal(0x45, outputData[1]); // 'E'
		Assert.Equal(0x53, outputData[2]); // 'S'
		Assert.Equal(0x1a, outputData[3]); // EOF
	}

	[Fact]
	public async Task CombineAsync_WithHeaderSize_CreatesEmptyHeader() {
		// Arrange
		var part1 = CreateTempFile("data.bin", CreateTestRom(16));
		var outputPath = Path.Combine(_tempDir, "combined.rom");
		var config = new CombineConfig {
			HeaderSize = 16,
			Parts = [new PartConfig { Path = part1 }]
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		Assert.Equal(16, result.HeaderSize);
		Assert.Equal(32, result.OutputSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		// First 16 bytes should be zeros
		Assert.All(outputData.Take(16), b => Assert.Equal(0, b));
	}

	[Fact]
	public async Task CombineAsync_WithTargetSize_PadsOutput() {
		// Arrange
		var part1 = CreateTempFile("data.bin", new byte[] { 0x01, 0x02, 0x03, 0x04 });
		var outputPath = Path.Combine(_tempDir, "padded.rom");
		var config = new CombineConfig {
			Parts = [new PartConfig { Path = part1 }],
			TargetSize = 16,
			FillByte = 0xff
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		Assert.Equal(16, result.OutputSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(0x01, outputData[0]);
		Assert.Equal(0x02, outputData[1]);
		Assert.Equal(0x03, outputData[2]);
		Assert.Equal(0x04, outputData[3]);
		Assert.All(outputData.Skip(4), b => Assert.Equal(0xff, b));
	}

	[Fact]
	public async Task CombineAsync_WithOffset_PadsGaps() {
		// Arrange
		var part1 = CreateTempFile("part1.bin", new byte[] { 0x01, 0x02 });
		var part2 = CreateTempFile("part2.bin", new byte[] { 0x03, 0x04 });
		var outputPath = Path.Combine(_tempDir, "sparse.rom");
		var config = new CombineConfig {
			Parts = [
				new PartConfig { Path = part1, Index = 0, Offset = 0 },
				new PartConfig { Path = part2, Index = 1, Offset = 8 }
			],
			FillByte = 0xff
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(0x01, outputData[0]);
		Assert.Equal(0x02, outputData[1]);
		// Gap from 2-7 should be filled
		Assert.All(outputData.Skip(2).Take(6), b => Assert.Equal(0xff, b));
		Assert.Equal(0x03, outputData[8]);
		Assert.Equal(0x04, outputData[9]);
	}

	[Fact]
	public async Task CombineAsync_WordSwapInterleave_InterleavesCorrectly() {
		// Arrange
		var evenData = new byte[] { 0x00, 0x02, 0x04, 0x06 };
		var oddData = new byte[] { 0x01, 0x03, 0x05, 0x07 };
		var evenPath = CreateTempFile("even.bin", evenData);
		var oddPath = CreateTempFile("odd.bin", oddData);
		var outputPath = Path.Combine(_tempDir, "interleaved.rom");
		var config = new CombineConfig {
			Parts = [
				new PartConfig { Path = evenPath, Index = 0 },
				new PartConfig { Path = oddPath, Index = 1 }
			],
			Interleave = InterleaveMode.WordSwap
		};

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07 }, outputData);
	}

	#endregion

	#region Extract Region Tests

	[Fact]
	public async Task ExtractRegionAsync_ExtractsCorrectData() {
		// Arrange
		var romData = new byte[256];
		for (var i = 0; i < 256; i++) romData[i] = (byte)i;
		var romPath = CreateTempFile("test.rom", romData);
		var outputPath = Path.Combine(_tempDir, "extracted.bin");

		// Act
		var result = await _splicer.ExtractRegionAsync(romPath, outputPath, 64, 32);

		// Assert
		Assert.Equal(64, result.Offset);
		Assert.Equal(32, result.Size);
		var extractedData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(32, extractedData.Length);
		Assert.Equal(64, extractedData[0]); // First byte should be 64
		Assert.Equal(95, extractedData[31]); // Last byte should be 95
	}

	[Fact]
	public async Task ExtractRegionAsync_ClipsToEndOfFile() {
		// Arrange
		var romData = CreateTestRom(100);
		var romPath = CreateTempFile("test.rom", romData);
		var outputPath = Path.Combine(_tempDir, "extracted.bin");

		// Act
		var result = await _splicer.ExtractRegionAsync(romPath, outputPath, 80, 50);

		// Assert
		Assert.Equal(20, result.Size); // Only 20 bytes available
	}

	[Fact]
	public async Task ExtractRegionAsync_InvalidOffset_ThrowsException() {
		// Arrange
		var romData = CreateTestRom(100);
		var romPath = CreateTempFile("test.rom", romData);
		var outputPath = Path.Combine(_tempDir, "extracted.bin");

		// Act & Assert
		await Assert.ThrowsAsync<ArgumentOutOfRangeException>(
			() => _splicer.ExtractRegionAsync(romPath, outputPath, 200, 10));
	}

	#endregion

	#region Insert Region Tests

	[Fact]
	public async Task InsertRegionAsync_ReplaceMode_ReplacesData() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07 };
		var insertData = new byte[] { 0xaa, 0xbb };
		var romPath = CreateTempFile("test.rom", romData);
		var insertPath = CreateTempFile("insert.bin", insertData);
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act
		var result = await _splicer.InsertRegionAsync(romPath, insertPath, outputPath, 2, InsertMode.Replace);

		// Assert
		Assert.Equal(InsertMode.Replace, result.Mode);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0xaa, 0xbb, 0x04, 0x05, 0x06, 0x07 }, outputData);
	}

	[Fact]
	public async Task InsertRegionAsync_InsertMode_ShiftsData() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var insertData = new byte[] { 0xaa, 0xbb };
		var romPath = CreateTempFile("test.rom", romData);
		var insertPath = CreateTempFile("insert.bin", insertData);
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act
		var result = await _splicer.InsertRegionAsync(romPath, insertPath, outputPath, 2, InsertMode.Insert);

		// Assert
		Assert.Equal(InsertMode.Insert, result.Mode);
		Assert.Equal(6, result.ResultSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0xaa, 0xbb, 0x02, 0x03 }, outputData);
	}

	[Fact]
	public async Task InsertRegionAsync_OverwriteMode_DoesNotExpand() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var insertData = new byte[] { 0xaa, 0xbb, 0xcc, 0xdd, 0xee }; // Longer than remaining
		var romPath = CreateTempFile("test.rom", romData);
		var insertPath = CreateTempFile("insert.bin", insertData);
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act
		var result = await _splicer.InsertRegionAsync(romPath, insertPath, outputPath, 2, InsertMode.Overwrite);

		// Assert
		Assert.Equal(InsertMode.Overwrite, result.Mode);
		Assert.Equal(4, result.ResultSize); // Size unchanged
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0xaa, 0xbb }, outputData); // Only first 2 bytes of insert
	}

	[Fact]
	public async Task InsertRegionAsync_ReplaceExpandsRom() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var insertData = new byte[] { 0xaa, 0xbb, 0xcc };
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act
		var result = await _splicer.InsertRegionAsync(romData, insertData, outputPath, 3, InsertMode.Replace);

		// Assert
		Assert.Equal(6, result.ResultSize); // Expanded to fit
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(new byte[] { 0x00, 0x01, 0x02, 0xaa, 0xbb, 0xcc }, outputData);
	}

	#endregion

	#region Header Operations Tests

	[Fact]
	public async Task StripHeaderAsync_RemovesHeader() {
		// Arrange
		var header = new byte[] { 0x4e, 0x45, 0x53, 0x1a, 0x00, 0x00, 0x00, 0x00 };
		var romContent = CreateTestRom(32);
		var romData = header.Concat(romContent).ToArray();
		var romPath = CreateTempFile("test.nes", romData);
		var outputPath = Path.Combine(_tempDir, "stripped.nes");

		// Act
		var result = await _splicer.StripHeaderAsync(romPath, outputPath, 8);

		// Assert
		Assert.Equal(40, result.OriginalSize);
		Assert.Equal(32, result.StrippedSize);
		Assert.Equal(8, result.HeaderSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(romContent, outputData);
	}

	[Fact]
	public async Task AddHeaderAsync_AddsHeader() {
		// Arrange
		var romContent = CreateTestRom(32);
		var romPath = CreateTempFile("test.bin", romContent);
		var header = new byte[] { 0x4e, 0x45, 0x53, 0x1a, 0x02, 0x01, 0x00, 0x00 };
		var outputPath = Path.Combine(_tempDir, "with_header.nes");

		// Act
		var result = await _splicer.AddHeaderAsync(romPath, outputPath, header);

		// Assert
		Assert.Equal(32, result.OriginalSize);
		Assert.Equal(8, result.HeaderSize);
		Assert.Equal(40, result.OutputSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(header, outputData.Take(8).ToArray());
		Assert.Equal(romContent, outputData.Skip(8).ToArray());
	}

	#endregion

	#region Verify Tests

	[Fact]
	public async Task VerifyAsync_CalculatesChecksums() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var romPath = CreateTempFile("test.rom", romData);

		// Act
		var result = await _splicer.VerifyAsync(romPath);

		// Assert
		Assert.Equal(4, result.Size);
		Assert.False(string.IsNullOrEmpty(result.Md5));
		Assert.False(string.IsNullOrEmpty(result.Sha1));
		Assert.False(string.IsNullOrEmpty(result.Crc32));
		Assert.True(result.AllMatch); // No expected values, all match
	}

	[Fact]
	public async Task VerifyAsync_MatchesExpectedMd5() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var romPath = CreateTempFile("test.rom", romData);

		// Get actual hash first
		var preResult = await _splicer.VerifyAsync(romPath);

		// Act
		var result = await _splicer.VerifyAsync(romPath, expectedMd5: preResult.Md5);

		// Assert
		Assert.True(result.Md5Match);
		Assert.True(result.AllMatch);
	}

	[Fact]
	public async Task VerifyAsync_MismatchReturnsCorrectly() {
		// Arrange
		var romData = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		var romPath = CreateTempFile("test.rom", romData);

		// Act
		var result = await _splicer.VerifyAsync(romPath, expectedMd5: "00000000000000000000000000000000");

		// Assert
		Assert.False(result.Md5Match);
		Assert.False(result.AllMatch);
	}

	#endregion

	#region Interleaving Conversion Tests

	[Fact]
	public async Task ConvertInterleavingAsync_NoneToNone_PreservesData() {
		// Arrange
		var inputData = CreateTestRom(256);
		var inputPath = CreateTempFile("input.rom", inputData);
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act
		var result = await _splicer.ConvertInterleavingAsync(inputPath, outputPath, InterleaveMode.None, InterleaveMode.None);

		// Assert
		Assert.Equal(256, result.InputSize);
		Assert.Equal(256, result.OutputSize);
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(inputData, outputData);
	}

	[Fact]
	public async Task ConvertInterleavingAsync_WordSwapRoundTrip() {
		// Arrange
		var inputData = CreateTestRom(256);
		var inputPath = CreateTempFile("input.rom", inputData);
		var intermediatePath = Path.Combine(_tempDir, "intermediate.rom");
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act - Convert to word swap and back
		await _splicer.ConvertInterleavingAsync(inputPath, intermediatePath, InterleaveMode.None, InterleaveMode.WordSwap);
		var result = await _splicer.ConvertInterleavingAsync(intermediatePath, outputPath, InterleaveMode.WordSwap, InterleaveMode.None);

		// Assert
		var outputData = await File.ReadAllBytesAsync(outputPath);
		Assert.Equal(inputData, outputData);
	}

	#endregion

	#region Manifest Tests

	[Fact]
	public async Task SaveAndLoadManifest_RoundTrip() {
		// Arrange
		var manifest = new SpliceManifest {
			Version = 1,
			Name = "Test ROM",
			Platform = "NES",
			HeaderSize = 16,
			RomSize = 32768,
			Interleave = InterleaveMode.None,
			Regions = [
				new ManifestRegion { Name = "PRG-ROM", Offset = 0, Size = 16384, Type = "code" },
				new ManifestRegion { Name = "CHR-ROM", Offset = 16384, Size = 8192, Type = "graphics" }
			],
			Checksums = new ManifestChecksums {
				Md5 = "d41d8cd98f00b204e9800998ecf8427e",
				Sha1 = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
			}
		};
		var manifestPath = Path.Combine(_tempDir, "manifest.json");

		// Act
		await _splicer.SaveManifestAsync(manifest, manifestPath);
		var loaded = await _splicer.LoadManifestAsync(manifestPath);

		// Assert
		Assert.Equal(manifest.Name, loaded.Name);
		Assert.Equal(manifest.Platform, loaded.Platform);
		Assert.Equal(manifest.HeaderSize, loaded.HeaderSize);
		Assert.Equal(manifest.RomSize, loaded.RomSize);
		Assert.Equal(2, loaded.Regions.Count);
		Assert.Equal("PRG-ROM", loaded.Regions[0].Name);
		Assert.Equal(manifest.Checksums?.Md5, loaded.Checksums?.Md5);
	}

	#endregion

	#region Error Handling Tests

	[Fact]
	public async Task SplitAsync_FileNotFound_ThrowsException() {
		// Arrange
		var config = new SplitConfig { PartSize = 128 };

		// Act & Assert
		await Assert.ThrowsAsync<FileNotFoundException>(
			() => _splicer.SplitAsync("nonexistent.rom", _tempDir, config));
	}

	[Fact]
	public async Task CombineAsync_MissingPart_ThrowsException() {
		// Arrange
		var config = new CombineConfig {
			Parts = [new PartConfig { Path = "nonexistent.bin" }]
		};
		var outputPath = Path.Combine(_tempDir, "output.rom");

		// Act & Assert
		await Assert.ThrowsAsync<FileNotFoundException>(
			() => _splicer.CombineAsync(outputPath, config));
	}

	[Fact]
	public async Task SplitAsync_NoConfigMode_ThrowsException() {
		// Arrange
		var romData = CreateTestRom(256);
		var romPath = CreateTempFile("test.rom", romData);
		var config = new SplitConfig(); // No part size, no regions, no interleave

		// Act & Assert
		await Assert.ThrowsAsync<ArgumentException>(
			() => _splicer.SplitAsync(romPath, _tempDir, config));
	}

	[Fact]
	public async Task InsertRegionAsync_NegativeOffset_ThrowsException() {
		// Arrange
		var romData = CreateTestRom(100);
		var insertData = new byte[] { 0xaa };

		// Act & Assert
		await Assert.ThrowsAsync<ArgumentOutOfRangeException>(
			() => _splicer.InsertRegionAsync(romData, insertData, "output.rom", -1));
	}

	[Fact]
	public async Task StripHeaderAsync_HeaderTooLarge_ThrowsException() {
		// Arrange
		var romData = CreateTestRom(100);
		var romPath = CreateTempFile("test.rom", romData);

		// Act & Assert
		await Assert.ThrowsAsync<ArgumentOutOfRangeException>(
			() => _splicer.StripHeaderAsync(romPath, "output.rom", 200));
	}

	#endregion

	#region Edge Cases Tests

	[Fact]
	public async Task SplitAsync_EmptyData_ReturnsEmptyParts() {
		// Arrange
		var romData = Array.Empty<byte>();
		var outputDir = Path.Combine(_tempDir, "empty_split");
		var config = new SplitConfig { PartSize = 128 };

		// Act
		var result = await _splicer.SplitAsync(romData, outputDir, config);

		// Assert
		Assert.Equal(0, result.OriginalSize);
		Assert.Empty(result.Parts);
	}

	[Fact]
	public async Task CombineAsync_NoParts_CreatesEmptyOrHeaderOnly() {
		// Arrange
		var config = new CombineConfig { HeaderSize = 16 };
		var outputPath = Path.Combine(_tempDir, "header_only.rom");

		// Act
		var result = await _splicer.CombineAsync(outputPath, config);

		// Assert
		Assert.Equal(16, result.OutputSize);
		Assert.Equal(0, result.PartsCount);
	}

	[Fact]
	public async Task SplitAsync_SingleByteRom_CreatesSinglePart() {
		// Arrange
		var romData = new byte[] { 0x42 };
		var romPath = CreateTempFile("tiny.rom", romData);
		var outputDir = Path.Combine(_tempDir, "tiny_split");
		var config = new SplitConfig { PartSize = 128 };

		// Act
		var result = await _splicer.SplitAsync(romPath, outputDir, config);

		// Assert
		Assert.Single(result.Parts);
		Assert.Equal(1, result.Parts[0].Size);
	}

	#endregion
}
