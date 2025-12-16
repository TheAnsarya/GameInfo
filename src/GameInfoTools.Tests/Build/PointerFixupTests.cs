using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests.Build;

/// <summary>
/// Unit tests for PointerFixup service.
/// </summary>
public class PointerFixupTests : IDisposable {
	private readonly PointerFixup _fixup;
	private readonly string _tempDir;

	public PointerFixupTests() {
		_fixup = new PointerFixup();
		_tempDir = Path.Combine(Path.GetTempPath(), $"PointerFixupTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, true);
		}
		GC.SuppressFinalize(this);
	}

	#region Analyze Pointers Tests

	[Fact]
	public void AnalyzePointers_FindsValidPointers() {
		// Arrange: Data with some 16-bit pointers pointing to valid addresses
		var data = new byte[] {
			0x00, 0x80, // Pointer to 0x8000
			0x10, 0x80, // Pointer to 0x8010
			0xff, 0xff, // Invalid (0xffff)
			0x20, 0x80, // Pointer to 0x8020
		};
		var config = new PointerAnalysisConfig {
			Format = PointerFormat.Nes16,
			MinValidAddress = 0x8000,
			MaxValidAddress = 0xffff
		};

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert
		Assert.Equal(8, result.TotalBytesAnalyzed);
		// Should find pointers at positions where valid addresses are formed
		var validPointers = result.PointersFound.Where(p => p.TargetAddress >= 0x8000 && p.TargetAddress <= 0xffff).ToList();
		Assert.True(validPointers.Count > 0);
	}

	[Fact]
	public void AnalyzePointers_RespectsAddressRange() {
		// Arrange: Data with pointers, only some in valid range
		var data = new byte[] {
			0x00, 0x10, // 0x1000 - out of range
			0x00, 0x80, // 0x8000 - in range
			0x00, 0xc0, // 0xc000 - in range
		};
		var config = new PointerAnalysisConfig {
			Format = PointerFormat.Nes16,
			MinValidAddress = 0x8000,
			MaxValidAddress = 0xffff
		};

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert: Should not include 0x1000 pointer
		var foundAddresses = result.PointersFound.Select(p => p.TargetAddress).ToList();
		Assert.Contains(0x8000, foundAddresses);
		Assert.Contains(0xc000, foundAddresses);
		Assert.DoesNotContain(0x1000, foundAddresses);
	}

	[Fact]
	public void AnalyzePointers_BigEndian_ReadsCorrectly() {
		// Arrange: Big-endian pointer data
		var data = new byte[] {
			0x80, 0x00, // Big-endian 0x8000
			0x80, 0x10, // Big-endian 0x8010
		};
		var config = new PointerAnalysisConfig {
			Format = new PointerFormat {
				Type = PointerType.Absolute16,
				ByteSize = 2,
				Endianness = Endianness.Big
			},
			MinValidAddress = 0x8000,
			MaxValidAddress = 0x8fff
		};

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert
		Assert.Contains(result.PointersFound, p => p.TargetAddress == 0x8000);
		Assert.Contains(result.PointersFound, p => p.TargetAddress == 0x8010);
	}

	[Fact]
	public void AnalyzePointers_24Bit_ReadsCorrectly() {
		// Arrange: 24-bit pointer data (SNES style)
		var data = new byte[] {
			0x00, 0x80, 0x00, // 0x008000
			0x00, 0x00, 0x01, // 0x010000
		};
		var config = new PointerAnalysisConfig {
			Format = PointerFormat.Snes24,
			MinValidAddress = 0,
			MaxValidAddress = 0xffffff
		};

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert
		Assert.Contains(result.PointersFound, p => p.TargetAddress == 0x008000);
		Assert.Contains(result.PointersFound, p => p.TargetAddress == 0x010000);
	}

	[Fact]
	public void AnalyzePointers_WithValidRanges_FiltersCorrectly() {
		// Arrange: Only specific ranges are valid
		var data = new byte[] {
			0x00, 0x80, // 0x8000 - valid range 1
			0x00, 0x90, // 0x9000 - invalid (between ranges)
			0x00, 0xa0, // 0xa000 - valid range 2
		};
		var config = new PointerAnalysisConfig {
			Format = PointerFormat.Nes16,
			MinValidAddress = 0x8000,
			MaxValidAddress = 0xffff,
			ValidRanges = [
				new AddressRange { Start = 0x8000, Size = 0x1000 },
				new AddressRange { Start = 0xa000, Size = 0x1000 }
			]
		};

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert
		var foundAddresses = result.PointersFound.Select(p => p.TargetAddress).ToList();
		Assert.Contains(0x8000, foundAddresses);
		Assert.Contains(0xa000, foundAddresses);
		Assert.DoesNotContain(0x9000, foundAddresses);
	}

	#endregion

	#region Fix Pointers For Move Tests

	[Fact]
	public void FixPointersForMove_UpdatesPointersCorrectly() {
		// Arrange: ROM data with pointers to region being moved
		var data = new byte[] {
			0x00, 0x00, // Padding
			0x00, 0x80, // Pointer to 0x8000 (being moved)
			0x10, 0x80, // Pointer to 0x8010 (being moved)
			0x00, 0x90, // Pointer to 0x9000 (not being moved)
		};
		var move = new MoveOperation { OldStart = 0x8000, NewStart = 0x9000, Size = 0x100 };
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 2, Format = PointerFormat.Nes16 },
			new() { Offset = 4, Format = PointerFormat.Nes16 },
			new() { Offset = 6, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.FixPointersForMove(data, move, pointerLocations);

		// Assert
		Assert.Equal(2, result.TotalPointersFixed); // Two pointers pointed to moved region
													// Check the first moved pointer now points to 0x9000
		Assert.Equal(0x00, result.ModifiedData[2]);
		Assert.Equal(0x90, result.ModifiedData[3]);
		// Check the second moved pointer now points to 0x9010
		Assert.Equal(0x10, result.ModifiedData[4]);
		Assert.Equal(0x90, result.ModifiedData[5]);
		// Third pointer should be unchanged
		Assert.Equal(0x00, result.ModifiedData[6]);
		Assert.Equal(0x90, result.ModifiedData[7]);
	}

	[Fact]
	public void FixPointersForMove_PreservesUnaffectedPointers() {
		// Arrange
		var data = new byte[] {
			0x00, 0x70, // Pointer to 0x7000 (before moved region)
			0x00, 0xa0, // Pointer to 0xa000 (after moved region)
		};
		var move = new MoveOperation { OldStart = 0x8000, NewStart = 0x9000, Size = 0x100 };
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 },
			new() { Offset = 2, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.FixPointersForMove(data, move, pointerLocations);

		// Assert
		Assert.Equal(0, result.TotalPointersFixed);
		Assert.Equal(data, result.ModifiedData);
	}

	[Fact]
	public void FixPointersForMove_HandlesRelativeOffset() {
		// Arrange: Pointer at middle of moved region
		var data = new byte[] {
			0x50, 0x80, // Pointer to 0x8050 (50 bytes into moved region)
		};
		var move = new MoveOperation { OldStart = 0x8000, NewStart = 0xa000, Size = 0x100 };
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.FixPointersForMove(data, move, pointerLocations);

		// Assert: Should now point to 0xa050
		Assert.Equal(0x50, result.ModifiedData[0]);
		Assert.Equal(0xa0, result.ModifiedData[1]);
	}

	#endregion

	#region Fix Pointers For Insert Tests

	[Fact]
	public void FixPointersForInsert_ShiftsPointersCorrectly() {
		// Arrange: Pointers pointing past insertion point
		// The function fixes pointers that point to addresses >= insertOffset
		var data = new byte[] {
			0x00, 0x40, // Pointer to 0x4000 (before insertion at 0x5000)
			0x00, 0x80, // Pointer to 0x8000 (after insertion at 0x5000)
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 },
			new() { Offset = 2, Format = PointerFormat.Nes16 }
		};

		// Act: Insert 0x100 bytes at 0x5000
		var result = _fixup.FixPointersForInsert(data, 0x5000, 0x100, pointerLocations);

		// Assert
		Assert.Equal(1, result.TotalPointersFixed); // Only second pointer should be fixed
													// First pointer unchanged (points before insertion at 0x5000)
		Assert.Equal(0x00, result.ModifiedData[0]);
		Assert.Equal(0x40, result.ModifiedData[1]);
		// Second pointer was fixed - verify old/new in the fix info
		var fix = result.FixedPointers[0];
		Assert.Equal(0x8000, fix.OldAddress);
		Assert.Equal(0x8100, fix.NewAddress);
	}

	[Fact]
	public void FixPointersForInsert_DoesNotShiftPointersBefore() {
		// Arrange: All pointers point before insertion
		var data = new byte[] {
			0x00, 0x40, // Pointer to 0x4000
			0x00, 0x50, // Pointer to 0x5000
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 },
			new() { Offset = 2, Format = PointerFormat.Nes16 }
		};

		// Act: Insert at 0x8000
		var result = _fixup.FixPointersForInsert(data, 0x8000, 0x100, pointerLocations);

		// Assert: No pointers should be shifted
		Assert.Equal(0, result.TotalPointersFixed);
		Assert.Equal(data, result.ModifiedData);
	}

	#endregion

	#region Fix Pointers For Remove Tests

	[Fact]
	public void FixPointersForRemove_ShiftsPointersDown() {
		// Arrange: Pointer pointing past removed region
		var data = new byte[] {
			0x00, 0x90, // Pointer to 0x9000 (past removed region 0x8000-0x80ff)
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 }
		};

		// Act: Remove 0x100 bytes at 0x8000
		var result = _fixup.FixPointersForRemove(data, 0x8000, 0x100, pointerLocations);

		// Assert: Pointer should shift down by 0x100
		Assert.Equal(0x00, result.ModifiedData[0]);
		Assert.Equal(0x8f, result.ModifiedData[1]); // 0x9000 - 0x100 = 0x8f00
	}

	[Fact]
	public void FixPointersForRemove_MarksInvalidPointers() {
		// Arrange: Pointer pointing into removed region
		var data = new byte[] {
			0x50, 0x80, // Pointer to 0x8050 (inside removed region 0x8000-0x80ff)
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.FixPointersForRemove(data, 0x8000, 0x100, pointerLocations);

		// Assert
		Assert.Equal(0, result.TotalPointersFixed);
		Assert.Single(result.InvalidPointers);
		Assert.True(result.InvalidPointers[0].IsInvalid);
	}

	[Fact]
	public void FixPointersForRemove_PreservesPointersBefore() {
		// Arrange
		var data = new byte[] {
			0x00, 0x60, // Pointer to 0x6000 (before removed region)
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 }
		};

		// Act: Remove at 0x8000
		var result = _fixup.FixPointersForRemove(data, 0x8000, 0x100, pointerLocations);

		// Assert
		Assert.Equal(0, result.TotalPointersFixed);
		Assert.Equal(data, result.ModifiedData);
	}

	#endregion

	#region Pointer Table Tests

	[Fact]
	public void CreatePointerTable_LittleEndian16() {
		// Arrange
		var addresses = new[] { 0x8000, 0x8100, 0x8200 };
		var format = PointerFormat.Nes16;

		// Act
		var table = _fixup.CreatePointerTable(addresses, format);

		// Assert
		Assert.Equal(6, table.Length); // 3 pointers * 2 bytes
		Assert.Equal(new byte[] { 0x00, 0x80, 0x00, 0x81, 0x00, 0x82 }, table);
	}

	[Fact]
	public void CreatePointerTable_BigEndian16() {
		// Arrange
		var addresses = new[] { 0x8000, 0x8100 };
		var format = new PointerFormat {
			Type = PointerType.Absolute16,
			ByteSize = 2,
			Endianness = Endianness.Big
		};

		// Act
		var table = _fixup.CreatePointerTable(addresses, format);

		// Assert
		Assert.Equal(new byte[] { 0x80, 0x00, 0x81, 0x00 }, table);
	}

	[Fact]
	public void ReadPointerTable_ReadsCorrectly() {
		// Arrange
		var data = new byte[] {
			0x00, 0x00, // Padding
			0x00, 0x80, // 0x8000
			0x00, 0x81, // 0x8100
			0x00, 0x82, // 0x8200
		};
		var format = PointerFormat.Nes16;

		// Act
		var addresses = _fixup.ReadPointerTable(data, 2, 3, format);

		// Assert
		Assert.Equal(3, addresses.Count);
		Assert.Equal(0x8000, addresses[0]);
		Assert.Equal(0x8100, addresses[1]);
		Assert.Equal(0x8200, addresses[2]);
	}

	[Fact]
	public void ReadPointerTable_StopsAtEndOfData() {
		// Arrange
		var data = new byte[] { 0x00, 0x80, 0x00 }; // Only 1.5 pointers worth
		var format = PointerFormat.Nes16;

		// Act
		var addresses = _fixup.ReadPointerTable(data, 0, 10, format);

		// Assert
		Assert.Single(addresses); // Only one complete pointer
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void ValidatePointers_AllValid() {
		// Arrange
		var data = new byte[] {
			0x00, 0x80, // 0x8000
			0x00, 0x90, // 0x9000
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 },
			new() { Offset = 2, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.ValidatePointers(data, pointerLocations, 0x8000, 0xffff);

		// Assert
		Assert.True(result.IsValid);
		Assert.Equal(2, result.ValidPointers.Count);
		Assert.Empty(result.InvalidPointers);
	}

	[Fact]
	public void ValidatePointers_SomeInvalid() {
		// Arrange
		var data = new byte[] {
			0x00, 0x80, // 0x8000 - valid
			0x00, 0x70, // 0x7000 - invalid (below min)
		};
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 0, Format = PointerFormat.Nes16 },
			new() { Offset = 2, Format = PointerFormat.Nes16 }
		};

		// Act
		var result = _fixup.ValidatePointers(data, pointerLocations, 0x8000, 0xffff);

		// Assert
		Assert.False(result.IsValid);
		Assert.Single(result.ValidPointers);
		Assert.Single(result.InvalidPointers);
		Assert.NotNull(result.InvalidPointers[0].ValidationError);
	}

	[Fact]
	public void ValidatePointers_LocationOutOfBounds() {
		// Arrange
		var data = new byte[] { 0x00, 0x80 };
		var pointerLocations = new List<PointerLocation> {
			new() { Offset = 10, Format = PointerFormat.Nes16 } // Out of bounds
		};

		// Act
		var result = _fixup.ValidatePointers(data, pointerLocations, 0, 0xffff);

		// Assert
		Assert.False(result.IsValid);
		Assert.Single(result.InvalidPointers);
		Assert.Contains("out of bounds", result.InvalidPointers[0].ValidationError!.ToLower());
	}

	#endregion

	#region Fixup Script Tests

	[Fact]
	public void ApplyFixupScript_MoveOperation() {
		// Arrange
		var data = new byte[] {
			0x00, 0x80, // Pointer to 0x8000
		};
		var script = new FixupScript {
			Operations = [
				new FixupOperation {
					Name = "Move data",
					Type = FixupOperationType.Move,
					Move = new MoveOperation { OldStart = 0x8000, NewStart = 0x9000, Size = 0x100 },
					PointerType = PointerType.Absolute16,
					Pointers = [new PointerEntry { Location = 0 }]
				}
			]
		};

		// Act
		var result = _fixup.ApplyFixupScript(data, script);

		// Assert
		Assert.True(result.Success);
		Assert.Single(result.AllFixes);
		Assert.Equal(0x00, result.ModifiedData[0]);
		Assert.Equal(0x90, result.ModifiedData[1]); // Now points to 0x9000
	}

	[Fact]
	public void ApplyFixupScript_SetAbsoluteOperation() {
		// Arrange
		var data = new byte[] {
			0x00, 0x00, // Original value
		};
		var script = new FixupScript {
			Operations = [
				new FixupOperation {
					Name = "Set pointer",
					Type = FixupOperationType.SetAbsolute,
					PointerType = PointerType.Absolute16,
					Pointers = [new PointerEntry { Location = 0, NewValue = 0xabcd }]
				}
			]
		};

		// Act
		var result = _fixup.ApplyFixupScript(data, script);

		// Assert
		Assert.True(result.Success);
		Assert.Equal(0xcd, result.ModifiedData[0]); // Little-endian
		Assert.Equal(0xab, result.ModifiedData[1]);
	}

	[Fact]
	public async Task SaveAndLoadFixupScript_RoundTrip() {
		// Arrange
		var script = new FixupScript {
			Version = 1,
			Description = "Test script",
			Operations = [
				new FixupOperation {
					Name = "Test operation",
					Type = FixupOperationType.Move,
					Move = new MoveOperation { OldStart = 0x1000, NewStart = 0x2000, Size = 0x100 },
					Pointers = [
						new PointerEntry { Location = 0x10, Comment = "First pointer" },
						new PointerEntry { Location = 0x20, Comment = "Second pointer" }
					]
				}
			]
		};
		var scriptPath = Path.Combine(_tempDir, "test_script.json");

		// Act
		await _fixup.SaveFixupScriptAsync(script, scriptPath);
		var data = new byte[0x30];
		var result = await _fixup.ApplyFixupScriptAsync(data, scriptPath);

		// Assert
		Assert.True(result.Success);
	}

	[Fact]
	public void CreateFixupScriptFromAnalysis_CreatesValidScript() {
		// Arrange
		var analysisResult = new PointerAnalysisResult {
			TotalBytesAnalyzed = 100,
			PointersFound = [
				new PointerInfo { Location = 0, TargetAddress = 0x8000, Format = PointerType.Absolute16 },
				new PointerInfo { Location = 4, TargetAddress = 0x8010, Format = PointerType.Absolute16 }
			],
			Config = new PointerAnalysisConfig { Format = PointerFormat.Nes16 }
		};
		var move = new MoveOperation { OldStart = 0x8000, NewStart = 0x9000, Size = 0x100 };

		// Act
		var script = _fixup.CreateFixupScriptFromAnalysis(analysisResult, move);

		// Assert
		Assert.Single(script.Operations);
		Assert.Equal(FixupOperationType.Move, script.Operations[0].Type);
		Assert.Equal(2, script.Operations[0].Pointers.Count);
	}

	#endregion

	#region Pointer Format Tests

	[Fact]
	public void PointerFormat_NesPreset() {
		// Act
		var format = PointerFormat.Nes16;

		// Assert
		Assert.Equal(PointerType.Absolute16, format.Type);
		Assert.Equal(2, format.ByteSize);
		Assert.Equal(Endianness.Little, format.Endianness);
	}

	[Fact]
	public void PointerFormat_SnesPreset() {
		// Act
		var format = PointerFormat.Snes24;

		// Assert
		Assert.Equal(PointerType.Absolute24, format.Type);
		Assert.Equal(3, format.ByteSize);
		Assert.Equal(Endianness.Little, format.Endianness);
	}

	[Fact]
	public void PointerFormat_GenesisPreset() {
		// Act
		var format = PointerFormat.Genesis32;

		// Assert
		Assert.Equal(PointerType.Absolute32, format.Type);
		Assert.Equal(4, format.ByteSize);
		Assert.Equal(Endianness.Big, format.Endianness);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void FixPointersForMove_EmptyPointerList() {
		// Arrange
		var data = new byte[] { 0x00, 0x80 };
		var move = new MoveOperation { OldStart = 0x8000, NewStart = 0x9000, Size = 0x100 };

		// Act
		var result = _fixup.FixPointersForMove(data, move, []);

		// Assert
		Assert.Equal(0, result.TotalPointersFixed);
		Assert.Equal(data, result.ModifiedData);
	}

	[Fact]
	public void AnalyzePointers_EmptyData() {
		// Arrange
		var data = Array.Empty<byte>();
		var config = new PointerAnalysisConfig();

		// Act
		var result = _fixup.AnalyzePointers(data, config);

		// Assert
		Assert.Equal(0, result.TotalBytesAnalyzed);
		Assert.Empty(result.PointersFound);
	}

	[Fact]
	public void ApplyFixupScript_EmptyScript() {
		// Arrange
		var data = new byte[] { 0x00, 0x80 };
		var script = new FixupScript();

		// Act
		var result = _fixup.ApplyFixupScript(data, script);

		// Assert
		Assert.True(result.Success);
		Assert.Empty(result.AllFixes);
		Assert.Equal(data, result.ModifiedData);
	}

	#endregion
}
