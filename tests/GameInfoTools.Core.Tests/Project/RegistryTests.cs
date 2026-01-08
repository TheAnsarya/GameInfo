namespace GameInfoTools.Core.Tests.Project;

using GameInfoTools.Core.Project;
using GameInfoTools.Core.Project.Extractors;
using GameInfoTools.Core.Project.Assemblers;

/// <summary>
/// Tests for IAssetExtractorRegistry implementation.
/// </summary>
public class AssetExtractorRegistryTests {
	[Fact]
	public void Register_AddsExtractor() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();

		// Act
		registry.Register(extractor);

		// Assert
		Assert.Single(registry.Extractors);
		Assert.Same(extractor, registry.Extractors[0]);
	}

	[Fact]
	public void Register_DoesNotAddDuplicate() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor1 = new DragonWarrior4Extractor();
		var extractor2 = new DragonWarrior4Extractor();

		// Act
		registry.Register(extractor1);
		registry.Register(extractor2);

		// Assert
		Assert.Single(registry.Extractors);
	}

	[Fact]
	public void GetExtractor_ReturnsMatchingExtractor() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();
		registry.Register(extractor);

		// Act
		var result = registry.GetExtractor("dw4-nes-us");

		// Assert
		Assert.NotNull(result);
		Assert.Same(extractor, result);
	}

	[Fact]
	public void GetExtractor_ReturnsNull_WhenNotFound() {
		// Arrange
		var registry = new AssetExtractorRegistry();

		// Act
		var result = registry.GetExtractor("non-existent");

		// Assert
		Assert.Null(result);
	}

	[Fact]
	public void GetExtractor_IsCaseInsensitive() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();
		registry.Register(extractor);

		// Act
		var result = registry.GetExtractor("DW4-NES-US");

		// Assert
		Assert.NotNull(result);
		Assert.Same(extractor, result);
	}

	[Fact]
	public void GetGameDefinitions_ReturnsAllDefinitions() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();
		registry.Register(extractor);

		// Act
		var definitions = registry.GetGameDefinitions();

		// Assert
		Assert.Single(definitions);
		Assert.Equal("dw4-nes-us", definitions[0].Id);
		Assert.Equal("Dragon Warrior IV (US)", definitions[0].Name);
	}

	[Fact]
	public async Task DetectExtractorAsync_ReturnsMatchingExtractor() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();
		registry.Register(extractor);

		// Create a valid DW4 ROM header (NES + correct size)
		var romData = new byte[0x80010]; // 512KB + 16 byte header
		romData[0] = (byte)'N';
		romData[1] = (byte)'E';
		romData[2] = (byte)'S';
		romData[3] = 0x1a;
		romData[4] = 0x20; // 32 * 16KB PRG

		// Act
		var result = await registry.DetectExtractorAsync(romData);

		// Assert
		Assert.NotNull(result);
		Assert.Same(extractor, result);
	}

	[Fact]
	public async Task DetectExtractorAsync_ReturnsNull_WhenNoMatch() {
		// Arrange
		var registry = new AssetExtractorRegistry();
		var extractor = new DragonWarrior4Extractor();
		registry.Register(extractor);

		// Create invalid ROM data
		var romData = new byte[100];

		// Act
		var result = await registry.DetectExtractorAsync(romData);

		// Assert
		Assert.Null(result);
	}
}

/// <summary>
/// Tests for IAssemblerRegistry implementation.
/// </summary>
public class AssemblerRegistryTests {
	[Fact]
	public void Register_AddsAssembler() {
		// Arrange
		var registry = new AssemblerRegistry();
		var assembler = new Ca65Assembler();

		// Act
		registry.Register(assembler);

		// Assert
		Assert.Single(registry.Assemblers);
		Assert.Same(assembler, registry.Assemblers[0]);
	}

	[Fact]
	public void Register_DoesNotAddDuplicate() {
		// Arrange
		var registry = new AssemblerRegistry();
		var assembler1 = new Ca65Assembler();
		var assembler2 = new Ca65Assembler();

		// Act
		registry.Register(assembler1);
		registry.Register(assembler2);

		// Assert
		Assert.Single(registry.Assemblers);
	}

	[Fact]
	public void GetAssembler_ReturnsMatchingAssembler() {
		// Arrange
		var registry = new AssemblerRegistry();
		var ca65 = new Ca65Assembler();
		var ophis = new OphisAssembler();
		registry.Register(ca65);
		registry.Register(ophis);

		// Act
		var result = registry.GetAssembler("ca65");

		// Assert
		Assert.NotNull(result);
		Assert.Same(ca65, result);
	}

	[Fact]
	public void GetAssembler_IsCaseInsensitive() {
		// Arrange
		var registry = new AssemblerRegistry();
		var assembler = new Ca65Assembler();
		registry.Register(assembler);

		// Act
		var result = registry.GetAssembler("CA65");

		// Assert
		Assert.NotNull(result);
	}

	[Fact]
	public void GetAssembler_ReturnsNull_WhenNotFound() {
		// Arrange
		var registry = new AssemblerRegistry();

		// Act
		var result = registry.GetAssembler("non-existent");

		// Assert
		Assert.Null(result);
	}
}

/// <summary>
/// Tests for GameDefinition.
/// </summary>
public class GameDefinitionTests {
	[Fact]
	public void DisplayName_ReturnsSameAsName() {
		// Arrange
		var definition = new GameDefinition {
			Id = "test",
			Name = "Test Game",
			Platform = "NES",
			Region = "US",
			ExtractorType = "TestExtractor"
		};

		// Act & Assert
		Assert.Equal(definition.Name, definition.DisplayName);
	}

	[Fact]
	public void Tags_DefaultsToEmptyList() {
		// Arrange
		var definition = new GameDefinition {
			Id = "test",
			Name = "Test Game",
			Platform = "NES",
			Region = "US",
			ExtractorType = "TestExtractor"
		};

		// Act & Assert
		Assert.NotNull(definition.Tags);
		Assert.Empty(definition.Tags);
	}

	[Fact]
	public void Assembler_DefaultsToCa65() {
		// Arrange
		var definition = new GameDefinition {
			Id = "test",
			Name = "Test Game",
			Platform = "NES",
			Region = "US",
			ExtractorType = "TestExtractor"
		};

		// Act & Assert
		Assert.Equal("ca65", definition.Assembler);
	}
}

/// <summary>
/// Tests for BuildResult record.
/// </summary>
public class BuildResultTests {
	[Fact]
	public void BuildResult_Success_ContainsRomData() {
		// Arrange
		var romData = new byte[] { 0x4e, 0x45, 0x53, 0x1a };
		var result = new BuildResult(
			Success: true,
			RomData: romData,
			OutputPath: "/path/to/rom.nes",
			Errors: [],
			Warnings: [],
			Duration: TimeSpan.FromSeconds(5)
		);

		// Assert
		Assert.True(result.Success);
		Assert.Equal(romData, result.RomData);
		Assert.Equal("/path/to/rom.nes", result.OutputPath);
		Assert.Empty(result.Errors);
		Assert.Empty(result.Warnings);
	}

	[Fact]
	public void BuildResult_Failure_ContainsErrors() {
		// Arrange
		var result = new BuildResult(
			Success: false,
			RomData: null,
			OutputPath: null,
			Errors: ["Error 1", "Error 2"],
			Warnings: ["Warning 1"],
			Duration: TimeSpan.FromSeconds(1)
		);

		// Assert
		Assert.False(result.Success);
		Assert.Null(result.RomData);
		Assert.Equal(2, result.Errors.Count);
		Assert.Single(result.Warnings);
	}
}

/// <summary>
/// Tests for VerifyResult record.
/// </summary>
public class VerifyResultTests {
	[Fact]
	public void VerifyResult_Match_HasZeroDifferences() {
		// Arrange
		var result = new VerifyResult(
			IsMatch: true,
			BytesDifferent: 0,
			Differences: [],
			ExpectedChecksum: "abc123",
			ActualChecksum: "abc123"
		);

		// Assert
		Assert.True(result.IsMatch);
		Assert.Equal(0, result.BytesDifferent);
		Assert.Empty(result.Differences);
		Assert.Equal(result.ExpectedChecksum, result.ActualChecksum);
	}

	[Fact]
	public void VerifyResult_NoMatch_ContainsDifferences() {
		// Arrange
		var differences = new List<(int Offset, byte Expected, byte Actual)> {
			(0x100, 0x00, 0xff),
			(0x200, 0xaa, 0xbb)
		};

		var result = new VerifyResult(
			IsMatch: false,
			BytesDifferent: 2,
			Differences: differences,
			ExpectedChecksum: "abc123",
			ActualChecksum: "xyz789"
		);

		// Assert
		Assert.False(result.IsMatch);
		Assert.Equal(2, result.BytesDifferent);
		Assert.Equal(2, result.Differences.Count);
		Assert.NotEqual(result.ExpectedChecksum, result.ActualChecksum);
	}
}
