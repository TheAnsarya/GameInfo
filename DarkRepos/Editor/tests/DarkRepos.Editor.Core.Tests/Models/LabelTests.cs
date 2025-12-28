using DarkRepos.Editor.Core.Models;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Models;

public class LabelTests {
	[Fact]
	public void Label_DefaultValues_AreCorrect() {
		// Arrange & Act
		var label = new Label();

		// Assert
		label.Id.Should().Be(Guid.Empty);
		label.ProjectId.Should().Be(Guid.Empty);
		label.Address.Should().Be(0);
		label.Bank.Should().BeNull();
		label.Name.Should().BeEmpty();
		label.Comment.Should().BeNull();
		label.Type.Should().Be(LabelType.Unknown);
		label.Size.Should().BeNull();
		label.CreatedAt.Should().BeCloseTo(DateTime.UtcNow, TimeSpan.FromSeconds(1));
	}

	[Fact]
	public void Label_CanSetProperties() {
		// Arrange
		var id = Guid.NewGuid();
		var projectId = Guid.NewGuid();
		var now = DateTime.UtcNow;

		// Act
		var label = new Label {
			Id = id,
			ProjectId = projectId,
			Address = 0x8000,
			Bank = 0,
			Name = "ResetVector",
			Comment = "Main entry point",
			Type = LabelType.Code,
			Size = null,
			CreatedAt = now
		};

		// Assert
		label.Id.Should().Be(id);
		label.ProjectId.Should().Be(projectId);
		label.Address.Should().Be(0x8000);
		label.Bank.Should().Be(0);
		label.Name.Should().Be("ResetVector");
		label.Comment.Should().Be("Main entry point");
		label.Type.Should().Be(LabelType.Code);
		label.Size.Should().BeNull();
		label.CreatedAt.Should().Be(now);
	}

	[Theory]
	[InlineData(LabelType.Unknown)]
	[InlineData(LabelType.Code)]
	[InlineData(LabelType.Subroutine)]
	[InlineData(LabelType.Data)]
	[InlineData(LabelType.Pointer)]
	[InlineData(LabelType.Text)]
	[InlineData(LabelType.Graphics)]
	[InlineData(LabelType.Variable)]
	[InlineData(LabelType.Register)]
	public void LabelType_AllValues_AreValid(LabelType type) {
		// Arrange & Act
		var label = new Label { Type = type };

		// Assert
		label.Type.Should().Be(type);
	}
}
