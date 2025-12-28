using DarkRepos.Editor.Core.Models;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Models;

public class RomTests {
	[Fact]
	public void Rom_DefaultValues_AreCorrect() {
		// Arrange & Act
		var rom = new Rom();

		// Assert
		rom.Id.Should().Be(Guid.Empty);
		rom.Name.Should().BeEmpty();
		rom.FileName.Should().BeEmpty();
		rom.Platform.Should().Be(RomPlatform.Unknown);
		rom.Size.Should().Be(0);
		rom.Sha256.Should().BeEmpty();
		rom.Crc32.Should().BeEmpty();
		rom.InternalTitle.Should().BeNull();
		rom.Mapper.Should().BeNull();
		rom.Data.Should().BeNull();
		rom.AddedAt.Should().BeCloseTo(DateTime.UtcNow, TimeSpan.FromSeconds(1));
		rom.LastAccessedAt.Should().BeNull();
	}

	[Fact]
	public void Rom_CanSetProperties() {
		// Arrange
		var id = Guid.NewGuid();
		var now = DateTime.UtcNow;
		var data = new byte[] { 0x4e, 0x45, 0x53, 0x1a };

		// Act
		var rom = new Rom {
			Id = id,
			Name = "Super Mario Bros",
			FileName = "smb.nes",
			Platform = RomPlatform.Nes,
			Size = 40976,
			Sha256 = "abc123",
			Crc32 = "def456",
			InternalTitle = "SUPER MARIO",
			Mapper = 0,
			Data = data,
			AddedAt = now,
			LastAccessedAt = now
		};

		// Assert
		rom.Id.Should().Be(id);
		rom.Name.Should().Be("Super Mario Bros");
		rom.FileName.Should().Be("smb.nes");
		rom.Platform.Should().Be(RomPlatform.Nes);
		rom.Size.Should().Be(40976);
		rom.Sha256.Should().Be("abc123");
		rom.Crc32.Should().Be("def456");
		rom.InternalTitle.Should().Be("SUPER MARIO");
		rom.Mapper.Should().Be(0);
		rom.Data.Should().BeEquivalentTo(data);
		rom.AddedAt.Should().Be(now);
		rom.LastAccessedAt.Should().Be(now);
	}
}
