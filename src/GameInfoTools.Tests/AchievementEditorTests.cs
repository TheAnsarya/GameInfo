using GameInfoTools.Data;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for <see cref="AchievementEditor"/>.
/// </summary>
public class AchievementEditorTests {
	#region Achievement Management

	[Fact]
	public void AddAchievement_ValidAchievement_AddsSuccessfully() {
		// Arrange
		var editor = new AchievementEditor();
		var achievement = CreateTestAchievement("ach1", "First Steps");

		// Act
		editor.AddAchievement(achievement);

		// Assert
		Assert.Single(editor.Achievements);
		Assert.Equal("First Steps", editor.Achievements["ach1"].Name);
	}

	[Fact]
	public void AddAchievement_NullAchievement_ThrowsArgumentNullException() {
		// Arrange
		var editor = new AchievementEditor();

		// Act & Assert
		Assert.Throws<ArgumentNullException>(() => editor.AddAchievement(null!));
	}

	[Fact]
	public void AddAchievement_EmptyId_ThrowsArgumentException() {
		// Arrange
		var editor = new AchievementEditor();
		var achievement = new Achievement {
			Id = "",
			Name = "Test",
			Conditions = [new AchievementCondition { StatName = "test", TargetValue = 1 }]
		};

		// Act & Assert
		Assert.Throws<ArgumentException>(() => editor.AddAchievement(achievement));
	}

	[Fact]
	public void RemoveAchievement_ExistingAchievement_ReturnsTrue() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("ach1", "Test"));

		// Act
		var result = editor.RemoveAchievement("ach1");

		// Assert
		Assert.True(result);
		Assert.Empty(editor.Achievements);
	}

	[Fact]
	public void RemoveAchievement_NonexistentAchievement_ReturnsFalse() {
		// Arrange
		var editor = new AchievementEditor();

		// Act
		var result = editor.RemoveAchievement("nonexistent");

		// Assert
		Assert.False(result);
	}

	[Fact]
	public void GetAchievement_ExistingAchievement_ReturnsAchievement() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("ach1", "First Steps"));

		// Act
		var achievement = editor.GetAchievement("ach1");

		// Assert
		Assert.NotNull(achievement);
		Assert.Equal("First Steps", achievement.Name);
	}

	[Fact]
	public void GetAchievement_NonexistentAchievement_ReturnsNull() {
		// Arrange
		var editor = new AchievementEditor();

		// Act
		var achievement = editor.GetAchievement("nonexistent");

		// Assert
		Assert.Null(achievement);
	}

	[Fact]
	public void UpdateAchievement_ExistingAchievement_UpdatesSuccessfully() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("ach1", "Original"));

		var updated = CreateTestAchievement("ach1", "Updated") with { Points = 50 };

		// Act
		editor.UpdateAchievement(updated);

		// Assert
		Assert.Equal("Updated", editor.Achievements["ach1"].Name);
		Assert.Equal(50, editor.Achievements["ach1"].Points);
	}

	[Fact]
	public void UpdateAchievement_NonexistentAchievement_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new AchievementEditor();

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() =>
			editor.UpdateAchievement(CreateTestAchievement("nonexistent", "Test")));
	}

	#endregion

	#region Category Management

	[Fact]
	public void AddCategory_ValidCategory_AddsSuccessfully() {
		// Arrange
		var editor = new AchievementEditor();
		var category = new AchievementCategory { Id = "cat1", Name = "Story" };

		// Act
		editor.AddCategory(category);

		// Assert
		Assert.Single(editor.Categories);
		Assert.Equal("Story", editor.Categories["cat1"].Name);
	}

	[Fact]
	public void RemoveCategory_ExistingCategory_ReturnsTrue() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "cat1", Name = "Story" });

		// Act
		var result = editor.RemoveCategory("cat1");

		// Assert
		Assert.True(result);
		Assert.Empty(editor.Categories);
	}

	[Fact]
	public void GetCategory_ExistingCategory_ReturnsCategory() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "cat1", Name = "Story" });

		// Act
		var category = editor.GetCategory("cat1");

		// Assert
		Assert.NotNull(category);
		Assert.Equal("Story", category.Name);
	}

	#endregion

	#region Querying

	[Fact]
	public void GetByCategory_ReturnsMatchingAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test1") with { CategoryId = "story" });
		editor.AddAchievement(CreateTestAchievement("a2", "Test2") with { CategoryId = "collection" });
		editor.AddAchievement(CreateTestAchievement("a3", "Test3") with { CategoryId = "story" });

		// Act
		var results = editor.GetByCategory("story").ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.All(results, a => Assert.Equal("story", a.CategoryId));
	}

	[Fact]
	public void GetByType_ReturnsMatchingAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test1") with { Type = AchievementType.Story });
		editor.AddAchievement(CreateTestAchievement("a2", "Test2") with { Type = AchievementType.Collection });
		editor.AddAchievement(CreateTestAchievement("a3", "Test3") with { Type = AchievementType.Story });

		// Act
		var results = editor.GetByType(AchievementType.Story).ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.All(results, a => Assert.Equal(AchievementType.Story, a.Type));
	}

	[Fact]
	public void GetByRarity_ReturnsMatchingAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test1") with { Rarity = AchievementRarity.Common });
		editor.AddAchievement(CreateTestAchievement("a2", "Test2") with { Rarity = AchievementRarity.Rare });
		editor.AddAchievement(CreateTestAchievement("a3", "Test3") with { Rarity = AchievementRarity.Rare });

		// Act
		var results = editor.GetByRarity(AchievementRarity.Rare).ToList();

		// Assert
		Assert.Equal(2, results.Count);
		Assert.All(results, a => Assert.Equal(AchievementRarity.Rare, a.Rarity));
	}

	[Fact]
	public void Search_FindsByNameAndDescription() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Dragon Slayer") with { Description = "Defeat the boss" });
		editor.AddAchievement(CreateTestAchievement("a2", "First Kill") with { Description = "Kill a dragon" });
		editor.AddAchievement(CreateTestAchievement("a3", "Explorer") with { Description = "Find all areas" });

		// Act
		var results = editor.Search("dragon").ToList();

		// Assert
		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void GetHidden_ReturnsHiddenAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Visible"));
		editor.AddAchievement(CreateTestAchievement("a2", "Hidden") with { IsHidden = true });

		// Act
		var results = editor.GetHidden().ToList();

		// Assert
		Assert.Single(results);
		Assert.Equal("Hidden", results[0].Name);
	}

	[Fact]
	public void GetSecret_ReturnsSecretAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Public"));
		editor.AddAchievement(CreateTestAchievement("a2", "Secret") with { IsSecret = true });

		// Act
		var results = editor.GetSecret().ToList();

		// Assert
		Assert.Single(results);
		Assert.Equal("Secret", results[0].Name);
	}

	#endregion

	#region Conditions

	[Fact]
	public void AddCondition_AddsToAchievement() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test"));
		var newCondition = new AchievementCondition { StatName = "newStat", TargetValue = 100 };

		// Act
		editor.AddCondition("a1", newCondition);

		// Assert
		var achievement = editor.GetAchievement("a1");
		Assert.NotNull(achievement);
		Assert.Equal(2, achievement.Conditions.Count);
	}

	[Fact]
	public void RemoveCondition_RemovesFromAchievement() {
		// Arrange
		var editor = new AchievementEditor();
		var achievement = new Achievement {
			Id = "a1",
			Name = "Test",
			Conditions = [
				new AchievementCondition { StatName = "stat1", TargetValue = 10 },
				new AchievementCondition { StatName = "stat2", TargetValue = 20 }
			]
		};
		editor.AddAchievement(achievement);

		// Act
		var result = editor.RemoveCondition("a1", 0);

		// Assert
		Assert.True(result);
		var updated = editor.GetAchievement("a1");
		Assert.NotNull(updated);
		Assert.Single(updated.Conditions);
		Assert.Equal("stat2", updated.Conditions[0].StatName);
	}

	[Fact]
	public void UpdateCondition_UpdatesExistingCondition() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test"));
		var updatedCondition = new AchievementCondition { StatName = "updatedStat", TargetValue = 999 };

		// Act
		editor.UpdateCondition("a1", 0, updatedCondition);

		// Assert
		var achievement = editor.GetAchievement("a1");
		Assert.NotNull(achievement);
		Assert.Equal("updatedStat", achievement.Conditions[0].StatName);
		Assert.Equal(999, achievement.Conditions[0].TargetValue);
	}

	#endregion

	#region Progress Evaluation

	[Fact]
	public void EvaluateProgress_ConditionMet_ReturnsUnlocked() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "Collector",
			Conditions = [new AchievementCondition { StatName = "itemsCollected", TargetValue = 10 }]
		});

		var state = new Dictionary<string, int> { ["itemsCollected"] = 15 };

		// Act
		var progress = editor.EvaluateProgress("a1", state);

		// Assert
		Assert.True(progress.IsUnlocked);
		Assert.Equal(100, progress.OverallPercent);
	}

	[Fact]
	public void EvaluateProgress_ConditionNotMet_ReturnsNotUnlocked() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "Collector",
			Conditions = [new AchievementCondition { StatName = "itemsCollected", TargetValue = 10 }]
		});

		var state = new Dictionary<string, int> { ["itemsCollected"] = 5 };

		// Act
		var progress = editor.EvaluateProgress("a1", state);

		// Assert
		Assert.False(progress.IsUnlocked);
		Assert.Equal(50, progress.OverallPercent);
	}

	[Fact]
	public void EvaluateProgress_MultipleConditionsAll_RequiresAll() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "Master",
			ConditionLogic = ConditionLogic.All,
			Conditions = [
				new AchievementCondition { StatName = "kills", TargetValue = 100 },
				new AchievementCondition { StatName = "deaths", Comparison = ComparisonType.Equal, TargetValue = 0 }
			]
		});

		var state1 = new Dictionary<string, int> { ["kills"] = 100, ["deaths"] = 0 };
		var state2 = new Dictionary<string, int> { ["kills"] = 100, ["deaths"] = 5 };

		// Act
		var progress1 = editor.EvaluateProgress("a1", state1);
		var progress2 = editor.EvaluateProgress("a1", state2);

		// Assert
		Assert.True(progress1.IsUnlocked);
		Assert.False(progress2.IsUnlocked);
	}

	[Fact]
	public void EvaluateProgress_MultipleConditionsAny_RequiresAny() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "Fighter",
			ConditionLogic = ConditionLogic.Any,
			Conditions = [
				new AchievementCondition { StatName = "swordKills", TargetValue = 50 },
				new AchievementCondition { StatName = "magicKills", TargetValue = 50 }
			]
		});

		var state = new Dictionary<string, int> { ["swordKills"] = 10, ["magicKills"] = 60 };

		// Act
		var progress = editor.EvaluateProgress("a1", state);

		// Assert
		Assert.True(progress.IsUnlocked);
	}

	[Fact]
	public void GetNewlyUnlocked_ReturnsNewlyUnlockedAchievements() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "First",
			Conditions = [new AchievementCondition { StatName = "level", TargetValue = 5 }]
		});
		editor.AddAchievement(new Achievement {
			Id = "a2",
			Name = "Second",
			Conditions = [new AchievementCondition { StatName = "level", TargetValue = 10 }]
		});

		var previousState = new Dictionary<string, int> { ["level"] = 3 };
		var currentState = new Dictionary<string, int> { ["level"] = 7 };

		// Act
		var newlyUnlocked = editor.GetNewlyUnlocked(previousState, currentState).ToList();

		// Assert
		Assert.Single(newlyUnlocked);
		Assert.Equal("First", newlyUnlocked[0].Name);
	}

	#endregion

	#region Validation

	[Fact]
	public void Validate_ValidAchievements_ReturnsNoErrors() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		editor.AddAchievement(CreateTestAchievement("a1", "Test") with { CategoryId = "story" });

		// Act
		var result = editor.Validate();

		// Assert
		Assert.True(result.IsValid);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Validate_MissingName_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement {
			Id = "a1",
			Name = "",
			Conditions = [new AchievementCondition { StatName = "test", TargetValue = 1 }]
		});

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.MissingRequired);
	}

	[Fact]
	public void Validate_NoConditions_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(new Achievement { Id = "a1", Name = "Test" });

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.NoConditions);
	}

	[Fact]
	public void Validate_InvalidCategory_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test") with { CategoryId = "nonexistent" });

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.InvalidCategory);
	}

	[Fact]
	public void Validate_InvalidPrerequisite_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test") with {
			Prerequisites = ["nonexistent"]
		});

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.InvalidPrerequisite);
	}

	[Fact]
	public void Validate_CircularPrerequisite_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "First") with { Prerequisites = ["a2"] });
		editor.AddAchievement(CreateTestAchievement("a2", "Second") with { Prerequisites = ["a1"] });

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.CircularPrerequisite);
	}

	[Fact]
	public void Validate_NegativePoints_ReturnsError() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test") with { Points = -10 });

		// Act
		var result = editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == AchievementValidationErrorType.InvalidValue);
	}

	#endregion

	#region Statistics

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		editor.AddAchievement(CreateTestAchievement("a1", "Test1") with {
			CategoryId = "story",
			Type = AchievementType.Story,
			Rarity = AchievementRarity.Common,
			Points = 10
		});
		editor.AddAchievement(CreateTestAchievement("a2", "Test2") with {
			CategoryId = "story",
			Type = AchievementType.Collection,
			Rarity = AchievementRarity.Rare,
			Points = 20,
			IsHidden = true
		});
		editor.AddAchievement(CreateTestAchievement("a3", "Test3") with {
			Type = AchievementType.Story,
			Rarity = AchievementRarity.Common,
			Points = 30,
			IsSecret = true
		});

		// Act
		var stats = editor.GetStatistics();

		// Assert
		Assert.Equal(3, stats.TotalAchievements);
		Assert.Equal(1, stats.TotalCategories);
		Assert.Equal(60, stats.TotalPoints);
		Assert.Equal(2, stats.ByType[AchievementType.Story]);
		Assert.Equal(2, stats.ByRarity[AchievementRarity.Common]);
		Assert.Equal(1, stats.HiddenCount);
		Assert.Equal(1, stats.SecretCount);
	}

	[Fact]
	public void CalculateCompletion_ReturnsCorrectStats() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddAchievement(CreateTestAchievement("a1", "Test1") with { Points = 10 });
		editor.AddAchievement(CreateTestAchievement("a2", "Test2") with { Points = 20 });
		editor.AddAchievement(CreateTestAchievement("a3", "Test3") with { Points = 30 });

		var unlocked = new[] { "a1", "a3" };

		// Act
		var completion = editor.CalculateCompletion(unlocked);

		// Assert
		Assert.Equal(2, completion.UnlockedCount);
		Assert.Equal(3, completion.TotalCount);
		Assert.Equal(40, completion.UnlockedPoints);
		Assert.Equal(60, completion.TotalPoints);
		Assert.Equal(66, completion.CompletionPercent);
	}

	#endregion

	#region Import/Export

	[Fact]
	public async Task ExportToJson_CreatesValidFile() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		editor.AddAchievement(CreateTestAchievement("a1", "First Steps"));
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await editor.ExportToJsonAsync(tempPath);

			// Assert
			Assert.True(File.Exists(tempPath));
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.Contains("First Steps", content);
			Assert.Contains("Story", content);
		} finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public async Task ImportFromJson_LoadsData() {
		// Arrange
		var originalEditor = new AchievementEditor();
		originalEditor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		originalEditor.AddAchievement(CreateTestAchievement("a1", "First Steps"));
		var tempPath = Path.GetTempFileName();

		try {
			await originalEditor.ExportToJsonAsync(tempPath);

			var newEditor = new AchievementEditor();

			// Act
			await newEditor.ImportFromJsonAsync(tempPath);

			// Assert
			Assert.Single(newEditor.Achievements);
			Assert.Single(newEditor.Categories);
			Assert.Equal("First Steps", newEditor.Achievements["a1"].Name);
		} finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public void ExportToBinary_CreatesBinaryData() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		editor.AddAchievement(CreateTestAchievement("a1", "Test"));

		// Act
		var binary = editor.ExportToBinary();

		// Assert
		Assert.NotEmpty(binary);
		Assert.Equal((byte)'A', binary[0]); // Header
		Assert.Equal((byte)'C', binary[1]);
		Assert.Equal((byte)'H', binary[2]);
	}

	[Fact]
	public void ImportFromBinary_LoadsData() {
		// Arrange
		var originalEditor = new AchievementEditor();
		originalEditor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		originalEditor.AddAchievement(CreateTestAchievement("a1", "Test"));
		var binary = originalEditor.ExportToBinary();

		var newEditor = new AchievementEditor();

		// Act
		newEditor.ImportFromBinary(binary);

		// Assert
		Assert.Single(newEditor.Categories);
		Assert.Single(newEditor.Achievements);
		Assert.Equal("Test", newEditor.Achievements["a1"].Name);
	}

	#endregion

	#region Clear

	[Fact]
	public void Clear_RemovesAllData() {
		// Arrange
		var editor = new AchievementEditor();
		editor.AddCategory(new AchievementCategory { Id = "story", Name = "Story" });
		editor.AddAchievement(CreateTestAchievement("a1", "Test"));

		// Act
		editor.Clear();

		// Assert
		Assert.Empty(editor.Achievements);
		Assert.Empty(editor.Categories);
	}

	#endregion

	#region Helper Methods

	private static Achievement CreateTestAchievement(string id, string name) {
		return new Achievement {
			Id = id,
			Name = name,
			Conditions = [new AchievementCondition { StatName = "testStat", TargetValue = 1 }]
		};
	}

	#endregion
}
