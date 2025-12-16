using GameInfoTools.Data;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for <see cref="CutsceneEditor"/>.
/// </summary>
public class CutsceneEditorTests {
	#region Cutscene Management

	[Fact]
	public void AddCutscene_ValidCutscene_AddsSuccessfully() {
		// Arrange
		var editor = new CutsceneEditor();
		var cutscene = CreateTestCutscene("cs1", "Opening");

		// Act
		editor.AddCutscene(cutscene);

		// Assert
		Assert.Single(editor.Cutscenes);
		Assert.Equal("Opening", editor.Cutscenes["cs1"].Name);
	}

	[Fact]
	public void AddCutscene_NullCutscene_ThrowsArgumentNullException() {
		// Arrange
		var editor = new CutsceneEditor();

		// Act & Assert
		Assert.Throws<ArgumentNullException>(() => editor.AddCutscene(null!));
	}

	[Fact]
	public void AddCutscene_EmptyId_ThrowsArgumentException() {
		// Arrange
		var editor = new CutsceneEditor();
		var cutscene = new Cutscene { Id = "", Name = "Test" };

		// Act & Assert
		Assert.Throws<ArgumentException>(() => editor.AddCutscene(cutscene));
	}

	[Fact]
	public void RemoveCutscene_ExistingCutscene_ReturnsTrue() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Test"));

		// Act
		var result = editor.RemoveCutscene("cs1");

		// Assert
		Assert.True(result);
		Assert.Empty(editor.Cutscenes);
	}

	[Fact]
	public void RemoveCutscene_NonexistentCutscene_ReturnsFalse() {
		// Arrange
		var editor = new CutsceneEditor();

		// Act
		var result = editor.RemoveCutscene("nonexistent");

		// Assert
		Assert.False(result);
	}

	[Fact]
	public void GetCutscene_ExistingCutscene_ReturnsCutscene() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Opening"));

		// Act
		var cutscene = editor.GetCutscene("cs1");

		// Assert
		Assert.NotNull(cutscene);
		Assert.Equal("Opening", cutscene.Name);
	}

	[Fact]
	public void GetCutscene_NonexistentCutscene_ReturnsNull() {
		// Arrange
		var editor = new CutsceneEditor();

		// Act
		var cutscene = editor.GetCutscene("nonexistent");

		// Assert
		Assert.Null(cutscene);
	}

	[Fact]
	public void UpdateCutscene_ExistingCutscene_UpdatesSuccessfully() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Original"));

		// Act
		editor.UpdateCutscene(new Cutscene { Id = "cs1", Name = "Updated" });

		// Assert
		Assert.Equal("Updated", editor.Cutscenes["cs1"].Name);
	}

	[Fact]
	public void UpdateCutscene_NonexistentCutscene_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new CutsceneEditor();

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() =>
			editor.UpdateCutscene(new Cutscene { Id = "nonexistent", Name = "Test" }));
	}

	#endregion

	#region Querying

	[Fact]
	public void Search_FindsByNameAndDescription() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Boss Fight") with { Description = "Epic battle" });
		editor.AddCutscene(CreateTestCutscene("cs2", "Intro") with { Description = "Game boss intro" });
		editor.AddCutscene(CreateTestCutscene("cs3", "Ending") with { Description = "Credits roll" });

		// Act
		var results = editor.Search("boss").ToList();

		// Assert
		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void GetByType_ReturnsMatchingCutscenes() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Test1") with { Type = CutsceneType.Intro });
		editor.AddCutscene(CreateTestCutscene("cs2", "Test2") with { Type = CutsceneType.Standard });
		editor.AddCutscene(CreateTestCutscene("cs3", "Test3") with { Type = CutsceneType.Intro });

		// Act
		var results = editor.GetByType(CutsceneType.Intro).ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.All(results, c => Assert.Equal(CutsceneType.Intro, c.Type));
	}

	[Fact]
	public void GetByTrigger_ReturnsMatchingCutscenes() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Test1") with { Trigger = CutsceneTrigger.MapEnter });
		editor.AddCutscene(CreateTestCutscene("cs2", "Test2") with { Trigger = CutsceneTrigger.NpcInteract });
		editor.AddCutscene(CreateTestCutscene("cs3", "Test3") with { Trigger = CutsceneTrigger.MapEnter });

		// Act
		var results = editor.GetByTrigger(CutsceneTrigger.MapEnter).ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.All(results, c => Assert.Equal(CutsceneTrigger.MapEnter, c.Trigger));
	}

	#endregion

	#region Command Management

	[Fact]
	public void AddCommand_AddsToCutscene() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Test"));
		var command = new CutsceneCommand { Type = CommandType.Dialogue };

		// Act
		editor.AddCommand("cs1", command);

		// Assert
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Single(cutscene.Commands);
	}

	[Fact]
	public void AddCommand_NonexistentCutscene_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new CutsceneEditor();
		var command = new CutsceneCommand { Type = CommandType.Dialogue };

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() => editor.AddCommand("nonexistent", command));
	}

	[Fact]
	public void InsertCommand_InsertsAtIndex() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [
				new CutsceneCommand { Type = CommandType.Dialogue, Label = "first" },
				new CutsceneCommand { Type = CommandType.Wait, Label = "third" }
			]
		});
		var newCommand = new CutsceneCommand { Type = CommandType.PlaySound, Label = "second" };

		// Act
		editor.InsertCommand("cs1", 1, newCommand);

		// Assert
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Equal(3, cutscene.Commands.Count);
		Assert.Equal("second", cutscene.Commands[1].Label);
	}

	[Fact]
	public void RemoveCommand_RemovesFromCutscene() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [
				new CutsceneCommand { Type = CommandType.Dialogue },
				new CutsceneCommand { Type = CommandType.Wait }
			]
		});

		// Act
		var result = editor.RemoveCommand("cs1", 0);

		// Assert
		Assert.True(result);
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Single(cutscene.Commands);
		Assert.Equal(CommandType.Wait, cutscene.Commands[0].Type);
	}

	[Fact]
	public void UpdateCommand_UpdatesExistingCommand() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Dialogue }]
		});
		var updated = new CutsceneCommand { Type = CommandType.PlayMusic, DurationFrames = 100 };

		// Act
		editor.UpdateCommand("cs1", 0, updated);

		// Assert
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Equal(CommandType.PlayMusic, cutscene.Commands[0].Type);
		Assert.Equal(100, cutscene.Commands[0].DurationFrames);
	}

	[Fact]
	public void MoveCommand_MovesWithinCutscene() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [
				new CutsceneCommand { Type = CommandType.Dialogue, Label = "first" },
				new CutsceneCommand { Type = CommandType.Wait, Label = "second" },
				new CutsceneCommand { Type = CommandType.PlaySound, Label = "third" }
			]
		});

		// Act
		editor.MoveCommand("cs1", 0, 2);

		// Assert
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Equal("second", cutscene.Commands[0].Label);
		Assert.Equal("third", cutscene.Commands[1].Label);
		Assert.Equal("first", cutscene.Commands[2].Label);
	}

	[Fact]
	public void DuplicateCommand_CreatesClone() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Dialogue, DurationFrames = 60 }]
		});

		// Act
		editor.DuplicateCommand("cs1", 0);

		// Assert
		var cutscene = editor.GetCutscene("cs1");
		Assert.NotNull(cutscene);
		Assert.Equal(2, cutscene.Commands.Count);
		Assert.Equal(CommandType.Dialogue, cutscene.Commands[1].Type);
		Assert.Equal(60, cutscene.Commands[1].DurationFrames);
	}

	#endregion

	#region Command Templates

	[Fact]
	public void AddCommandTemplate_AddsTemplate() {
		// Arrange
		var editor = new CutsceneEditor();
		var template = new CutsceneCommand {
			Type = CommandType.ScreenFade,
			DurationFrames = 30,
			Parameters = new Dictionary<string, object> { ["fadeType"] = "out" }
		};

		// Act
		editor.AddCommandTemplate("fadeOut", template);

		// Assert
		Assert.Single(editor.CommandTemplates);
		Assert.NotNull(editor.GetCommandTemplate("fadeOut"));
	}

	[Fact]
	public void CreateFromTemplate_CreatesCommandFromTemplate() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCommandTemplate("fadeOut", new CutsceneCommand {
			Type = CommandType.ScreenFade,
			DurationFrames = 30,
			Parameters = new Dictionary<string, object> { ["fadeType"] = "out" }
		});

		// Act
		var command = editor.CreateFromTemplate("fadeOut");

		// Assert
		Assert.NotNull(command);
		Assert.Equal(CommandType.ScreenFade, command.Type);
		Assert.Equal(30, command.DurationFrames);
	}

	[Fact]
	public void CreateFromTemplate_WithOverrides_AppliesOverrides() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCommandTemplate("fadeOut", new CutsceneCommand {
			Type = CommandType.ScreenFade,
			DurationFrames = 30,
			Parameters = new Dictionary<string, object> { ["fadeType"] = "out" }
		});

		// Act
		var command = editor.CreateFromTemplate("fadeOut", new Dictionary<string, object> { ["fadeType"] = "in" });

		// Assert
		Assert.NotNull(command);
		Assert.Equal("in", command.Parameters["fadeType"]);
	}

	#endregion

	#region Timing

	[Fact]
	public void CalculateDuration_EmptyCutscene_ReturnsZero() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Empty"));

		// Act
		var duration = editor.CalculateDuration("cs1");

		// Assert
		Assert.Equal(TimeSpan.Zero, duration);
	}

	[Fact]
	public void CalculateDuration_SequentialCommands_SumsDurations() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [
				new CutsceneCommand { Type = CommandType.Wait, DurationFrames = 60, WaitForPrevious = true },
				new CutsceneCommand { Type = CommandType.Wait, DurationFrames = 30, WaitForPrevious = true }
			]
		});

		// Act
		var duration = editor.CalculateDuration("cs1");

		// Assert
		Assert.Equal(TimeSpan.FromSeconds(1.5), duration); // (60+30) frames at 60fps = 1.5s
	}

	[Fact]
	public void GetTimeline_ReturnsTimelineEntries() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [
				new CutsceneCommand { Type = CommandType.Dialogue, DurationFrames = 60, Label = "Talk" },
				new CutsceneCommand { Type = CommandType.Wait, DurationFrames = 30 }
			]
		});

		// Act
		var timeline = editor.GetTimeline("cs1");

		// Assert
		Assert.Equal("cs1", timeline.CutsceneId);
		Assert.Equal(2, timeline.Entries.Count);
		Assert.Equal("Talk", timeline.Entries[0].Label);
	}

	#endregion

	#region Validation

	[Fact]
	public void Validate_ValidCutscene_ReturnsNoErrors() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Valid",
			Commands = [
				new CutsceneCommand {
					Type = CommandType.Dialogue,
					Parameters = new Dictionary<string, object> { ["text"] = "Hello" }
				}
			]
		});

		// Act
		var result = editor.Validate("cs1");

		// Assert
		Assert.True(result.IsValid);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Validate_MissingName_ReturnsError() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene { Id = "cs1", Name = "" });

		// Act
		var result = editor.Validate("cs1");

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == CutsceneValidationErrorType.MissingRequired);
	}

	[Fact]
	public void Validate_NegativeDuration_ReturnsError() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Wait, DurationFrames = -10 }]
		});

		// Act
		var result = editor.Validate("cs1");

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == CutsceneValidationErrorType.InvalidValue);
	}

	[Fact]
	public void Validate_DialogueMissingText_ReturnsError() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Dialogue }]
		});

		// Act
		var result = editor.Validate("cs1");

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == CutsceneValidationErrorType.MissingParameter);
	}

	[Fact]
	public void Validate_InvalidLabelReference_ReturnsError() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Goto, GotoLabel = "nonexistent" }]
		});

		// Act
		var result = editor.Validate("cs1");

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == CutsceneValidationErrorType.InvalidLabel);
	}

	[Fact]
	public void Validate_NonexistentCutscene_ReturnsNotFoundError() {
		// Arrange
		var editor = new CutsceneEditor();

		// Act
		var result = editor.Validate("nonexistent");

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == CutsceneValidationErrorType.NotFound);
	}

	[Fact]
	public void ValidateAll_ValidatesAllCutscenes() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene { Id = "cs1", Name = "Valid" });
		editor.AddCutscene(new Cutscene { Id = "cs2", Name = "" }); // Invalid

		// Act
		var results = editor.ValidateAll().ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.Contains(results, r => r.IsValid);
		Assert.Contains(results, r => !r.IsValid);
	}

	#endregion

	#region Statistics

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test1",
			Type = CutsceneType.Intro,
			Trigger = CutsceneTrigger.MapEnter,
			Commands = [
				new CutsceneCommand { Type = CommandType.Dialogue },
				new CutsceneCommand { Type = CommandType.Wait }
			]
		});
		editor.AddCutscene(new Cutscene {
			Id = "cs2",
			Name = "Test2",
			Type = CutsceneType.Standard,
			Trigger = CutsceneTrigger.MapEnter,
			Commands = [new CutsceneCommand { Type = CommandType.Dialogue }]
		});
		editor.AddCommandTemplate("template1", new CutsceneCommand { Type = CommandType.Wait });

		// Act
		var stats = editor.GetStatistics();

		// Assert
		Assert.Equal(2, stats.TotalCutscenes);
		Assert.Equal(3, stats.TotalCommands);
		Assert.Equal(1, stats.TotalTemplates);
		Assert.Equal(1, stats.ByType[CutsceneType.Intro]);
		Assert.Equal(2, stats.ByTrigger[CutsceneTrigger.MapEnter]);
		Assert.Equal(2, stats.CommandsByType[CommandType.Dialogue]);
	}

	#endregion

	#region Import/Export

	[Fact]
	public async Task ExportToJson_CreatesValidFile() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Opening"));
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await editor.ExportToJsonAsync(tempPath);

			// Assert
			Assert.True(File.Exists(tempPath));
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.Contains("Opening", content);
		} finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public async Task ImportFromJson_LoadsData() {
		// Arrange
		var originalEditor = new CutsceneEditor();
		originalEditor.AddCutscene(CreateTestCutscene("cs1", "Opening"));
		originalEditor.AddCommandTemplate("template1", new CutsceneCommand { Type = CommandType.Wait });
		var tempPath = Path.GetTempFileName();

		try {
			await originalEditor.ExportToJsonAsync(tempPath);

			var newEditor = new CutsceneEditor();

			// Act
			await newEditor.ImportFromJsonAsync(tempPath);

			// Assert
			Assert.Single(newEditor.Cutscenes);
			Assert.Single(newEditor.CommandTemplates);
			Assert.Equal("Opening", newEditor.Cutscenes["cs1"].Name);
		} finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public void ExportToScript_CreatesReadableScript() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test Scene",
			Commands = [
				new CutsceneCommand {
					Type = CommandType.Dialogue,
					Label = "start",
					Parameters = new Dictionary<string, object> { ["text"] = "Hello World" },
					DurationFrames = 60
				}
			]
		});

		// Act
		var script = editor.ExportToScript("cs1");

		// Assert
		Assert.Contains("# Cutscene: Test Scene", script);
		Assert.Contains("DIALOGUE", script);
		Assert.Contains("text=\"Hello World\"", script);
	}

	[Fact]
	public void ParseFromScript_CreatesValidCutscene() {
		// Arrange
		var editor = new CutsceneEditor();
		var script = """
			# Cutscene: Test
			DIALOGUE text="Hello" duration=60
			WAIT duration=30
			""";

		// Act
		var cutscene = editor.ParseFromScript(script, "cs1", "Test Scene");

		// Assert
		Assert.NotNull(cutscene);
		Assert.Equal("cs1", cutscene.Id);
		Assert.Equal("Test Scene", cutscene.Name);
		Assert.Equal(2, cutscene.Commands.Count);
		Assert.Equal(CommandType.Dialogue, cutscene.Commands[0].Type);
	}

	[Fact]
	public void ExportToBinary_CreatesBinaryData() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(new Cutscene {
			Id = "cs1",
			Name = "Test",
			Commands = [new CutsceneCommand { Type = CommandType.Wait, DurationFrames = 30 }]
		});

		// Act
		var binary = editor.ExportToBinary("cs1");

		// Assert
		Assert.NotEmpty(binary);
		Assert.Equal((byte)'C', binary[0]); // Header
		Assert.Equal((byte)'U', binary[1]);
		Assert.Equal((byte)'T', binary[2]);
	}

	#endregion

	#region Clear

	[Fact]
	public void Clear_RemovesAllData() {
		// Arrange
		var editor = new CutsceneEditor();
		editor.AddCutscene(CreateTestCutscene("cs1", "Test"));
		editor.AddCommandTemplate("template", new CutsceneCommand { Type = CommandType.Wait });

		// Act
		editor.Clear();

		// Assert
		Assert.Empty(editor.Cutscenes);
		Assert.Empty(editor.CommandTemplates);
	}

	#endregion

	#region Helper Methods

	private static Cutscene CreateTestCutscene(string id, string name) {
		return new Cutscene { Id = id, Name = name };
	}

	#endregion
}
