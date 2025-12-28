using DarkRepos.Editor.Core.Models;
using DarkRepos.Editor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services;

public class RomServiceTests
{
	private readonly RomService _service = new();

	[Fact]
	public async Task LoadAsync_WithValidData_ReturnsRom()
	{
		// Arrange
		var data = new byte[] { 0x4e, 0x45, 0x53, 0x1a, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
		var fileName = "test.nes";

		// Act
		var rom = await _service.LoadAsync(data, fileName);

		// Assert
		rom.Should().NotBeNull();
		rom.Id.Should().NotBe(Guid.Empty);
		rom.Name.Should().Be("test");
		rom.FileName.Should().Be("test.nes");
		rom.Platform.Should().Be(RomPlatform.Nes);
		rom.Size.Should().Be(16);
		rom.Sha256.Should().NotBeNullOrEmpty();
		rom.Crc32.Should().NotBeNullOrEmpty();
		rom.Data.Should().BeEquivalentTo(data);
	}

	[Fact]
	public async Task LoadAsync_WithEmptyData_ThrowsArgumentException()
	{
		// Arrange
		var data = Array.Empty<byte>();

		// Act & Assert
		await Assert.ThrowsAsync<ArgumentException>(() => _service.LoadAsync(data, "test.bin"));
	}

	[Fact]
	public async Task LoadAsync_WithNullData_ThrowsArgumentException()
	{
		// Act & Assert
		await Assert.ThrowsAsync<ArgumentException>(() => _service.LoadAsync(null!, "test.bin"));
	}

	[Theory]
	[InlineData(".nes", RomPlatform.Nes)]
	[InlineData(".sfc", RomPlatform.Snes)]
	[InlineData(".smc", RomPlatform.Snes)]
	[InlineData(".gb", RomPlatform.GameBoy)]
	[InlineData(".gbc", RomPlatform.GameBoyColor)]
	[InlineData(".gba", RomPlatform.GameBoyAdvance)]
	[InlineData(".sms", RomPlatform.MasterSystem)]
	[InlineData(".n64", RomPlatform.Nintendo64)]
	[InlineData(".nds", RomPlatform.NintendoDs)]
	[InlineData(".pce", RomPlatform.PcEngine)]
	public void DetectPlatform_ByExtension_ReturnsCorrectPlatform(string extension, RomPlatform expected)
	{
		// Arrange
		var data = new byte[256];
		var fileName = $"test{extension}";

		// Act
		var platform = _service.DetectPlatform(data, fileName);

		// Assert
		platform.Should().Be(expected);
	}

	[Fact]
	public void DetectPlatform_WithNesHeader_ReturnsNes()
	{
		// Arrange - NES header magic "NES\x1A"
		var data = new byte[] { 0x4e, 0x45, 0x53, 0x1a, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

		// Act
		var platform = _service.DetectPlatform(data, "unknown.bin");

		// Assert
		platform.Should().Be(RomPlatform.Nes);
	}

	[Fact]
	public void CalculateSha256_ReturnsLowercaseHash()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x01, 0x02, 0x03 };

		// Act
		var hash = _service.CalculateSha256(data);

		// Assert
		hash.Should().NotBeNullOrEmpty();
		hash.Should().Be(hash.ToLowerInvariant());
		hash.Should().HaveLength(64); // SHA-256 produces 32 bytes = 64 hex chars
	}

	[Fact]
	public void CalculateCrc32_ReturnsLowercaseHash()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x01, 0x02, 0x03 };

		// Act
		var hash = _service.CalculateCrc32(data);

		// Assert
		hash.Should().NotBeNullOrEmpty();
		hash.Should().Be(hash.ToLowerInvariant());
		hash.Should().HaveLength(8); // CRC32 produces 4 bytes = 8 hex chars
	}

	[Fact]
	public async Task LoadAsync_NesRom_ExtractsMapper()
	{
		// Arrange - iNES header with mapper 1 (MMC1)
		var data = new byte[32];
		data[0] = 0x4e; // N
		data[1] = 0x45; // E
		data[2] = 0x53; // S
		data[3] = 0x1a; // EOF
		data[4] = 0x02; // PRG ROM size
		data[5] = 0x01; // CHR ROM size
		data[6] = 0x10; // Mapper low nibble = 1
		data[7] = 0x00; // Mapper high nibble = 0

		// Act
		var rom = await _service.LoadAsync(data, "test.nes");

		// Assert
		rom.Mapper.Should().Be(1);
	}
}
