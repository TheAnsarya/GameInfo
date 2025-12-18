using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests.Build;

/// <summary>
/// Tests for ProjectTemplateGenerator.
/// </summary>
public class ProjectTemplateGeneratorTests {
	[Fact]
	public void Constructor_WithDefaultConfig_CreatesGenerator() {
		var generator = new ProjectTemplateGenerator();
		Assert.NotNull(generator);
	}

	[Fact]
	public void Constructor_WithConfig_AppliesSettings() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "TestProject",
			Platform = ProjectTemplateGenerator.Platform.Nes,
			GameTitle = "Test Game"
		};
		var generator = new ProjectTemplateGenerator(config);
		Assert.NotNull(generator);
	}

	[Fact]
	public void Preview_ReturnsExpectedStructure() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame",
			Platform = ProjectTemplateGenerator.Platform.Nes,
			Components = ProjectTemplateGenerator.TemplateComponents.All
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.True(result.Success);
		Assert.Equal("MyGame", result.ProjectPath);
		Assert.NotEmpty(result.GeneratedFiles);
		Assert.NotEmpty(result.CreatedDirectories);
	}

	[Fact]
	public void Preview_ContainsReadme() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame"
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.GeneratedFiles, f => f.RelativePath == "README.md");
	}

	[Fact]
	public void Preview_ContainsBuildConfig() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame"
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.GeneratedFiles, f => f.RelativePath == "build.config.json");
	}

	[Fact]
	public void Preview_WithGraphicsComponent_IncludesGraphicsDirectories() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame",
			Components = ProjectTemplateGenerator.TemplateComponents.Graphics
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.CreatedDirectories, d => d.Contains("graphics"));
	}

	[Fact]
	public void Preview_WithTextComponent_IncludesTblFile() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame",
			Components = ProjectTemplateGenerator.TemplateComponents.Text
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.GeneratedFiles, f => f.RelativePath.Contains(".tbl"));
	}

	[Fact]
	public void Preview_WithDebugComponent_IncludesDebugDirectories() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame",
			Components = ProjectTemplateGenerator.TemplateComponents.Debug
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.CreatedDirectories, d => d.Contains("debug"));
	}

	[Fact]
	public void Preview_NesPlatform_IncludesMesenLabels() {
		var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "MyGame",
			Platform = ProjectTemplateGenerator.Platform.Nes,
			Components = ProjectTemplateGenerator.TemplateComponents.Debug
		};
		var generator = new ProjectTemplateGenerator(config);

		var result = generator.Preview();

		Assert.Contains(result.GeneratedFiles, f => f.RelativePath.EndsWith(".mlb"));
	}

	[Fact]
	public void Preview_WithMinimalComponents_HasFewerFiles() {
		var fullConfig = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "Full",
			Components = ProjectTemplateGenerator.TemplateComponents.All
		};
		var minimalConfig = new ProjectTemplateGenerator.ProjectTemplateConfig {
			ProjectName = "Minimal",
			Components = ProjectTemplateGenerator.TemplateComponents.None
		};

		var fullResult = new ProjectTemplateGenerator(fullConfig).Preview();
		var minimalResult = new ProjectTemplateGenerator(minimalConfig).Preview();

		Assert.True(fullResult.GeneratedFiles.Count > minimalResult.GeneratedFiles.Count);
	}

	[Fact]
	public void GetPreset_Full_ReturnsAllComponents() {
		var preset = ProjectTemplateGenerator.GetPreset(
			ProjectTemplateGenerator.Platform.Nes,
			ProjectTemplateGenerator.TemplateType.Full
		);

		Assert.Equal(ProjectTemplateGenerator.TemplateComponents.All, preset.Components);
	}

	[Fact]
	public void GetPreset_Disassembly_ReturnsDisassemblyComponents() {
		var preset = ProjectTemplateGenerator.GetPreset(
			ProjectTemplateGenerator.Platform.Snes,
			ProjectTemplateGenerator.TemplateType.Disassembly
		);

		Assert.True(preset.Components.HasFlag(ProjectTemplateGenerator.TemplateComponents.Disassembly));
		Assert.True(preset.Components.HasFlag(ProjectTemplateGenerator.TemplateComponents.Debug));
	}

	[Fact]
	public void GetPreset_Translation_ReturnsTextComponents() {
		var preset = ProjectTemplateGenerator.GetPreset(
			ProjectTemplateGenerator.Platform.Nes,
			ProjectTemplateGenerator.TemplateType.Translation
		);

		Assert.True(preset.Components.HasFlag(ProjectTemplateGenerator.TemplateComponents.Text));
		Assert.True(preset.Components.HasFlag(ProjectTemplateGenerator.TemplateComponents.Build));
	}

	[Fact]
	public void Generate_CreatesProjectDirectory() {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = "TestProject",
				Components = ProjectTemplateGenerator.TemplateComponents.None
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			Assert.True(result.Success);
			Assert.True(Directory.Exists(result.ProjectPath));
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	[Fact]
	public void Generate_CreatesReadmeFile() {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = "TestProject",
				Components = ProjectTemplateGenerator.TemplateComponents.None
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			var readmePath = Path.Combine(result.ProjectPath, "README.md");
			Assert.True(File.Exists(readmePath));
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	[Fact]
	public void Generate_ReadmeContainsProjectName() {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = "MyAwesomeGame",
				GameTitle = "My Awesome Game",
				Components = ProjectTemplateGenerator.TemplateComponents.None
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			var readmePath = Path.Combine(result.ProjectPath, "README.md");
			var content = File.ReadAllText(readmePath);
			Assert.Contains("My Awesome Game", content);
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	[Fact]
	public void Generate_WithGitInit_CreatesGitignore() {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = "TestProject",
				InitGit = true,
				Components = ProjectTemplateGenerator.TemplateComponents.None
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			var gitignorePath = Path.Combine(result.ProjectPath, ".gitignore");
			Assert.True(File.Exists(gitignorePath));
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	[Fact]
	public void Generate_CreatesEditorConfig() {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = "TestProject",
				UseTabs = true,
				Components = ProjectTemplateGenerator.TemplateComponents.None
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			var editorConfigPath = Path.Combine(result.ProjectPath, ".editorconfig");
			Assert.True(File.Exists(editorConfigPath));
			var content = File.ReadAllText(editorConfigPath);
			Assert.Contains("indent_style = tab", content);
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	[Theory]
	[InlineData(ProjectTemplateGenerator.Platform.Nes)]
	[InlineData(ProjectTemplateGenerator.Platform.Snes)]
	[InlineData(ProjectTemplateGenerator.Platform.Genesis)]
	[InlineData(ProjectTemplateGenerator.Platform.GameBoy)]
	[InlineData(ProjectTemplateGenerator.Platform.Gba)]
	public void Generate_AllPlatforms_Succeed(ProjectTemplateGenerator.Platform platform) {
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		try {
			var config = new ProjectTemplateGenerator.ProjectTemplateConfig {
				ProjectName = $"Test{platform}",
				Platform = platform,
				Components = ProjectTemplateGenerator.TemplateComponents.All
			};
			var generator = new ProjectTemplateGenerator(config);

			var result = generator.Generate(tempDir);

			Assert.True(result.Success);
			Assert.Empty(result.Errors);
		} finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}
}
