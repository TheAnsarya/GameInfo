using GameInfoTools.Core.Analysis;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for MemoryLayoutAnalyzer and related types.
/// </summary>
public class MemoryLayoutAnalyzerTests {
	#region MemoryRegion Tests

	[Fact]
	public void MemoryRegion_Constructor_SetsProperties() {
		var region = new MemoryRegion {
			Name = "RAM",
			StartAddress = 0x0000,
			EndAddress = 0x07ff,
			Type = MemoryRegionType.Ram
		};

		Assert.Equal("RAM", region.Name);
		Assert.Equal(0x0000, region.StartAddress);
		Assert.Equal(0x07ff, region.EndAddress);
		Assert.Equal(MemoryRegionType.Ram, region.Type);
	}

	[Fact]
	public void MemoryRegion_Size_CalculatedCorrectly() {
		var region = new MemoryRegion {
			Name = "Test",
			StartAddress = 0x8000,
			EndAddress = 0xbfff
		};

		Assert.Equal(0x4000, region.Size);
	}

	[Fact]
	public void MemoryRegion_Contains_WithinRange_ReturnsTrue() {
		var region = new MemoryRegion {
			Name = "Test",
			StartAddress = 0x8000,
			EndAddress = 0xbfff
		};

		Assert.True(region.Contains(0x8000));
		Assert.True(region.Contains(0x9000));
		Assert.True(region.Contains(0xbfff));
	}

	[Fact]
	public void MemoryRegion_Contains_OutsideRange_ReturnsFalse() {
		var region = new MemoryRegion {
			Name = "Test",
			StartAddress = 0x8000,
			EndAddress = 0xbfff
		};

		Assert.False(region.Contains(0x7fff));
		Assert.False(region.Contains(0xc000));
	}

	[Fact]
	public void MemoryRegion_FormattedStart_IsHex() {
		var region = new MemoryRegion {
			Name = "Test",
			StartAddress = 0x8000,
			EndAddress = 0xbfff
		};

		Assert.Contains("8000", region.FormattedStart);
	}

	[Fact]
	public void MemoryRegion_FormattedSize_ShowsKB() {
		var region = new MemoryRegion {
			Name = "Test",
			StartAddress = 0x8000,
			EndAddress = 0xbfff // 16KB
		};

		Assert.Contains("KB", region.FormattedSize);
	}

	#endregion

	#region MemoryLayoutAnalyzer Basic Tests

	[Fact]
	public void MemoryLayoutAnalyzer_AddRegion_IncreasesCount() {
		var analyzer = new MemoryLayoutAnalyzer();
		var region = new MemoryRegion { Name = "Test", StartAddress = 0x8000, EndAddress = 0xbfff };

		analyzer.AddRegion(region);

		Assert.Single(analyzer.Regions);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_AddRegion_SortsByStartAddress() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "High", StartAddress = 0x8000, EndAddress = 0xbfff });
		analyzer.AddRegion(new MemoryRegion { Name = "Low", StartAddress = 0x0000, EndAddress = 0x07ff });

		Assert.Equal("Low", analyzer.Regions[0].Name);
		Assert.Equal("High", analyzer.Regions[1].Name);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_FindRegion_FindsCorrectRegion() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "RAM", StartAddress = 0x0000, EndAddress = 0x07ff });
		analyzer.AddRegion(new MemoryRegion { Name = "ROM", StartAddress = 0x8000, EndAddress = 0xffff });

		var region = analyzer.FindRegion(0x8500);

		Assert.NotNull(region);
		Assert.Equal("ROM", region!.Name);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_FindRegion_ReturnsNullIfNotFound() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "ROM", StartAddress = 0x8000, EndAddress = 0xffff });

		var region = analyzer.FindRegion(0x0100);

		Assert.Null(region);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_RemoveRegion_Works() {
		var analyzer = new MemoryLayoutAnalyzer();
		var region = new MemoryRegion { Name = "Test", StartAddress = 0x8000, EndAddress = 0xbfff };
		analyzer.AddRegion(region);

		analyzer.RemoveRegion(region);

		Assert.Empty(analyzer.Regions);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_Clear_RemovesAll() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "Test1", StartAddress = 0x0000, EndAddress = 0x0fff });
		analyzer.AddRegion(new MemoryRegion { Name = "Test2", StartAddress = 0x8000, EndAddress = 0xffff });

		analyzer.Clear();

		Assert.Empty(analyzer.Regions);
	}

	#endregion

	#region Platform Template Tests

	[Fact]
	public void MemoryLayoutAnalyzer_CreateNesLayout_HasExpectedRegions() {
		var analyzer = MemoryLayoutAnalyzer.CreateNesLayout();

		Assert.NotEmpty(analyzer.Regions);
		Assert.Contains(analyzer.Regions, r => r.Name == "Zero Page");
		Assert.Contains(analyzer.Regions, r => r.Type == MemoryRegionType.Ram);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_CreateSnesLoRomLayout_HasExpectedRegions() {
		var analyzer = MemoryLayoutAnalyzer.CreateSnesLoRomLayout();

		Assert.NotEmpty(analyzer.Regions);
		Assert.Contains(analyzer.Regions, r => r.Type == MemoryRegionType.Wram);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_CreateGameBoyLayout_HasExpectedRegions() {
		var analyzer = MemoryLayoutAnalyzer.CreateGameBoyLayout();

		Assert.NotEmpty(analyzer.Regions);
		Assert.Contains(analyzer.Regions, r => r.Name.Contains("VRAM"));
		Assert.Contains(analyzer.Regions, r => r.Name.Contains("WRAM"));
	}

	#endregion

	#region Overlap Detection Tests

	[Fact]
	public void MemoryLayoutAnalyzer_FindOverlaps_DetectsOverlapping() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "Region1", StartAddress = 0x8000, EndAddress = 0x9000 });
		analyzer.AddRegion(new MemoryRegion { Name = "Region2", StartAddress = 0x8800, EndAddress = 0xa000 });

		var overlaps = analyzer.FindOverlaps().ToList();

		Assert.NotEmpty(overlaps);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_FindOverlaps_NoOverlaps_ReturnsEmpty() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "Region1", StartAddress = 0x8000, EndAddress = 0x8fff });
		analyzer.AddRegion(new MemoryRegion { Name = "Region2", StartAddress = 0x9000, EndAddress = 0x9fff });

		var overlaps = analyzer.FindOverlaps().ToList();

		Assert.Empty(overlaps);
	}

	#endregion

	#region Gap Detection Tests

	[Fact]
	public void MemoryLayoutAnalyzer_FindGaps_DetectsUnmappedAreas() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "RAM", StartAddress = 0x0000, EndAddress = 0x07ff });
		analyzer.AddRegion(new MemoryRegion { Name = "ROM", StartAddress = 0x8000, EndAddress = 0xffff });

		var gaps = analyzer.FindGaps(0x10000).ToList();

		Assert.NotEmpty(gaps);
		Assert.Contains(gaps, g => g.Start == 0x0800);
	}

	#endregion

	#region Filter Tests

	[Fact]
	public void MemoryLayoutAnalyzer_GetRegionsByType_FiltersCorrectly() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "RAM", StartAddress = 0x0000, EndAddress = 0x07ff, Type = MemoryRegionType.Ram });
		analyzer.AddRegion(new MemoryRegion { Name = "ROM", StartAddress = 0x8000, EndAddress = 0xffff, Type = MemoryRegionType.Rom });

		var ramRegions = analyzer.GetRegionsByType(MemoryRegionType.Ram).ToList();

		Assert.Single(ramRegions);
		Assert.Equal("RAM", ramRegions[0].Name);
	}

	[Fact]
	public void MemoryLayoutAnalyzer_FindRegionsInRange_Works() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "Low", StartAddress = 0x0000, EndAddress = 0x0fff });
		analyzer.AddRegion(new MemoryRegion { Name = "Mid", StartAddress = 0x4000, EndAddress = 0x7fff });
		analyzer.AddRegion(new MemoryRegion { Name = "High", StartAddress = 0x8000, EndAddress = 0xffff });

		var regions = analyzer.FindRegionsInRange(0x3000, 0x5000).ToList();

		Assert.Single(regions);
		Assert.Equal("Mid", regions[0].Name);
	}

	#endregion

	#region Memory Type Tests

	[Fact]
	public void MemoryRegionType_AllValues_Exist() {
		var types = Enum.GetValues<MemoryRegionType>();

		Assert.Contains(MemoryRegionType.Unknown, types);
		Assert.Contains(MemoryRegionType.Ram, types);
		Assert.Contains(MemoryRegionType.Rom, types);
		Assert.Contains(MemoryRegionType.Vram, types);
		Assert.Contains(MemoryRegionType.Io, types);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void MemoryLayoutAnalyzer_GetStatistics_CalculatesCorrectly() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion { Name = "RAM", StartAddress = 0x0000, EndAddress = 0x07ff, Type = MemoryRegionType.Ram });
		analyzer.AddRegion(new MemoryRegion { Name = "ROM", StartAddress = 0x8000, EndAddress = 0xffff, Type = MemoryRegionType.Rom });

		var stats = analyzer.GetStatistics(0x10000);

		Assert.Equal(2, stats.RegionCount);
		Assert.True(stats.RamSize > 0);
		Assert.True(stats.RomSize > 0);
	}

	#endregion

	#region Serialization Tests

	[Fact]
	public void MemoryLayoutAnalyzer_ExportToJson_ProducesValidJson() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion {
			Name = "TestRegion",
			StartAddress = 0x8000,
			EndAddress = 0xbfff,
			Type = MemoryRegionType.Rom
		});

		var json = analyzer.ExportToJson();

		Assert.Contains("TestRegion", json);
		Assert.Contains("32768", json); // 0x8000 in decimal
	}

	[Fact]
	public void MemoryLayoutAnalyzer_ImportFromJson_RestoresData() {
		var analyzer = new MemoryLayoutAnalyzer();
		analyzer.AddRegion(new MemoryRegion {
			Name = "TestRegion",
			StartAddress = 0x8000,
			EndAddress = 0xbfff
		});

		var json = analyzer.ExportToJson();

		var restored = new MemoryLayoutAnalyzer();
		restored.ImportFromJson(json);

		Assert.Single(restored.Regions);
		Assert.Equal("TestRegion", restored.Regions[0].Name);
	}

	#endregion

	#region ASCII Map Tests

	[Fact]
	public void MemoryLayoutAnalyzer_GenerateAsciiMap_ProducesOutput() {
		var analyzer = MemoryLayoutAnalyzer.CreateNesLayout();

		var map = analyzer.GenerateAsciiMap(0x10000);

		Assert.NotEmpty(map);
		Assert.Contains("Memory Map", map);
	}

	#endregion
}
