using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

/// <summary>
/// Unit tests for QuestSystemEditor service.
/// </summary>
public class QuestSystemEditorTests : IDisposable {
	private readonly QuestSystemEditor _editor;
	private readonly string _tempDir;

	public QuestSystemEditorTests() {
		_editor = new QuestSystemEditor();
		_tempDir = Path.Combine(Path.GetTempPath(), $"QuestSystemEditorTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, true);
		}
		GC.SuppressFinalize(this);
	}

	private Quest CreateTestQuest(string id, string name = "Test Quest") => new() {
		Id = id,
		Name = name,
		Description = "A test quest",
		Type = QuestType.Main
	};

	#region Quest Management Tests

	[Fact]
	public void AddQuest_ValidQuest_AddsSuccessfully() {
		// Arrange
		var quest = CreateTestQuest("quest1", "First Quest");

		// Act
		_editor.AddQuest(quest);

		// Assert
		Assert.Single(_editor.Quests);
		Assert.Equal("First Quest", _editor.Quests["quest1"].Name);
	}

	[Fact]
	public void AddQuest_NullId_ThrowsException() {
		// Arrange
		var quest = new Quest { Id = "", Name = "Invalid" };

		// Act & Assert
		Assert.Throws<ArgumentException>(() => _editor.AddQuest(quest));
	}

	[Fact]
	public void RemoveQuest_ExistingQuest_ReturnsTrue() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1"));

		// Act
		var result = _editor.RemoveQuest("quest1");

		// Assert
		Assert.True(result);
		Assert.Empty(_editor.Quests);
	}

	[Fact]
	public void RemoveQuest_NonExistentQuest_ReturnsFalse() {
		// Act
		var result = _editor.RemoveQuest("nonexistent");

		// Assert
		Assert.False(result);
	}

	[Fact]
	public void GetQuest_ExistingQuest_ReturnsQuest() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1", "My Quest"));

		// Act
		var quest = _editor.GetQuest("quest1");

		// Assert
		Assert.NotNull(quest);
		Assert.Equal("My Quest", quest.Name);
	}

	[Fact]
	public void GetQuest_NonExistentQuest_ReturnsNull() {
		// Act
		var quest = _editor.GetQuest("nonexistent");

		// Assert
		Assert.Null(quest);
	}

	[Fact]
	public void UpdateQuest_ExistingQuest_UpdatesSuccessfully() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1", "Original Name"));
		var updated = CreateTestQuest("quest1", "Updated Name");

		// Act
		_editor.UpdateQuest(updated);

		// Assert
		Assert.Equal("Updated Name", _editor.Quests["quest1"].Name);
	}

	[Fact]
	public void UpdateQuest_NonExistentQuest_ThrowsException() {
		// Arrange
		var quest = CreateTestQuest("nonexistent");

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() => _editor.UpdateQuest(quest));
	}

	[Fact]
	public void GetQuestsByType_ReturnsCorrectQuests() {
		// Arrange
		_editor.AddQuest(new Quest { Id = "main1", Name = "Main 1", Type = QuestType.Main });
		_editor.AddQuest(new Quest { Id = "side1", Name = "Side 1", Type = QuestType.Side });
		_editor.AddQuest(new Quest { Id = "main2", Name = "Main 2", Type = QuestType.Main });

		// Act
		var mainQuests = _editor.GetQuestsByType(QuestType.Main).ToList();

		// Assert
		Assert.Equal(2, mainQuests.Count);
		Assert.All(mainQuests, q => Assert.Equal(QuestType.Main, q.Type));
	}

	[Fact]
	public void GetQuestsByCategory_ReturnsCorrectQuests() {
		// Arrange
		_editor.AddQuest(new Quest { Id = "q1", Name = "Q1", Category = "combat" });
		_editor.AddQuest(new Quest { Id = "q2", Name = "Q2", Category = "exploration" });
		_editor.AddQuest(new Quest { Id = "q3", Name = "Q3", Category = "Combat" }); // Different case

		// Act
		var combatQuests = _editor.GetQuestsByCategory("combat").ToList();

		// Assert
		Assert.Equal(2, combatQuests.Count); // Case insensitive
	}

	[Fact]
	public void SearchQuests_FindsByNameAndDescription() {
		// Arrange
		_editor.AddQuest(new Quest { Id = "q1", Name = "Dragon Slayer", Description = "Kill the beast" });
		_editor.AddQuest(new Quest { Id = "q2", Name = "Fetch Quest", Description = "Slay the dragon" });
		_editor.AddQuest(new Quest { Id = "q3", Name = "Deliver Items", Description = "Bring items to town" });

		// Act
		var dragonQuests = _editor.SearchQuests("dragon").ToList();

		// Assert
		Assert.Equal(2, dragonQuests.Count); // Found in q1 name, q2 description
	}

	#endregion

	#region Objective Management Tests

	[Fact]
	public void AddObjective_ValidObjective_AddsToQuest() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1"));
		var objective = new QuestObjective { Id = "obj1", Description = "Kill 10 enemies", Type = ObjectiveType.Kill, TargetCount = 10 };

		// Act
		_editor.AddObjective("quest1", objective);

		// Assert
		var quest = _editor.GetQuest("quest1");
		Assert.NotNull(quest);
		Assert.Single(quest.Objectives);
		Assert.Equal("Kill 10 enemies", quest.Objectives[0].Description);
	}

	[Fact]
	public void AddObjective_NonExistentQuest_ThrowsException() {
		// Arrange
		var objective = new QuestObjective { Id = "obj1", Description = "Test" };

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() => _editor.AddObjective("nonexistent", objective));
	}

	[Fact]
	public void RemoveObjective_ExistingObjective_ReturnsTrue() {
		// Arrange
		var quest = CreateTestQuest("quest1") with {
			Objectives = [new QuestObjective { Id = "obj1" }, new QuestObjective { Id = "obj2" }]
		};
		_editor.AddQuest(quest);

		// Act
		var result = _editor.RemoveObjective("quest1", "obj1");

		// Assert
		Assert.True(result);
		Assert.Single(_editor.GetQuest("quest1")!.Objectives);
	}

	[Fact]
	public void UpdateObjective_ExistingObjective_Updates() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1") with {
			Objectives = [new QuestObjective { Id = "obj1", Description = "Original" }]
		});
		var updated = new QuestObjective { Id = "obj1", Description = "Updated" };

		// Act
		_editor.UpdateObjective("quest1", updated);

		// Assert
		Assert.Equal("Updated", _editor.GetQuest("quest1")!.Objectives[0].Description);
	}

	[Fact]
	public void ReorderObjectives_ReordersCorrectly() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1") with {
			Objectives = [
				new QuestObjective { Id = "obj1" },
				new QuestObjective { Id = "obj2" },
				new QuestObjective { Id = "obj3" }
			]
		});

		// Act
		_editor.ReorderObjectives("quest1", ["obj3", "obj1", "obj2"]);

		// Assert
		var objectives = _editor.GetQuest("quest1")!.Objectives;
		Assert.Equal("obj3", objectives[0].Id);
		Assert.Equal("obj1", objectives[1].Id);
		Assert.Equal("obj2", objectives[2].Id);
	}

	#endregion

	#region Reward Management Tests

	[Fact]
	public void AddReward_ValidReward_AddsToQuest() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1"));
		var reward = new QuestReward { Type = RewardType.Gold, Amount = 100 };

		// Act
		_editor.AddReward("quest1", reward);

		// Assert
		var quest = _editor.GetQuest("quest1");
		Assert.Single(quest!.Rewards);
		Assert.Equal(100, quest.Rewards[0].Amount);
	}

	[Fact]
	public void RemoveReward_ValidIndex_RemovesReward() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1") with {
			Rewards = [
				new QuestReward { Type = RewardType.Gold, Amount = 100 },
				new QuestReward { Type = RewardType.Experience, Amount = 500 }
			]
		});

		// Act
		var result = _editor.RemoveReward("quest1", 0);

		// Assert
		Assert.True(result);
		Assert.Single(_editor.GetQuest("quest1")!.Rewards);
		Assert.Equal(RewardType.Experience, _editor.GetQuest("quest1")!.Rewards[0].Type);
	}

	[Fact]
	public void SetRewards_ReplacesAllRewards() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("quest1") with {
			Rewards = [new QuestReward { Type = RewardType.Gold, Amount = 100 }]
		});
		var newRewards = new List<QuestReward> {
			new() { Type = RewardType.Item, ItemId = "sword" },
			new() { Type = RewardType.Experience, Amount = 1000 }
		};

		// Act
		_editor.SetRewards("quest1", newRewards);

		// Assert
		var rewards = _editor.GetQuest("quest1")!.Rewards;
		Assert.Equal(2, rewards.Count);
		Assert.Equal(RewardType.Item, rewards[0].Type);
	}

	#endregion

	#region Quest Chain Tests

	[Fact]
	public void CreateChain_ValidChain_CreatesSuccessfully() {
		// Arrange
		var chain = new QuestChain { Id = "chain1", Name = "Main Story" };

		// Act
		_editor.CreateChain(chain);

		// Assert
		Assert.Single(_editor.Chains);
		Assert.Equal("Main Story", _editor.Chains["chain1"].Name);
	}

	[Fact]
	public void AddQuestToChain_AddsQuest() {
		// Arrange
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story" });
		_editor.AddQuest(CreateTestQuest("quest1"));

		// Act
		_editor.AddQuestToChain("chain1", "quest1");

		// Assert
		Assert.Single(_editor.Chains["chain1"].QuestIds);
		Assert.Equal("quest1", _editor.Chains["chain1"].QuestIds[0]);
	}

	[Fact]
	public void AddQuestToChain_WithPosition_InsertsAtPosition() {
		// Arrange
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["q1", "q3"] });
		_editor.AddQuest(CreateTestQuest("q1"));
		_editor.AddQuest(CreateTestQuest("q2"));
		_editor.AddQuest(CreateTestQuest("q3"));

		// Act
		_editor.AddQuestToChain("chain1", "q2", position: 1);

		// Assert
		var chain = _editor.GetChain("chain1")!;
		Assert.Equal(3, chain.QuestIds.Count);
		Assert.Equal("q2", chain.QuestIds[1]);
	}

	[Fact]
	public void RemoveQuestFromChain_RemovesQuest() {
		// Arrange
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["q1", "q2"] });

		// Act
		var result = _editor.RemoveQuestFromChain("chain1", "q1");

		// Assert
		Assert.True(result);
		Assert.Single(_editor.Chains["chain1"].QuestIds);
	}

	[Fact]
	public void GetChainForQuest_ReturnsCorrectChain() {
		// Arrange
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["q1", "q2"] });
		_editor.CreateChain(new QuestChain { Id = "chain2", Name = "Side", QuestIds = ["q3"] });

		// Act
		var chain = _editor.GetChainForQuest("q2");

		// Assert
		Assert.NotNull(chain);
		Assert.Equal("chain1", chain.Id);
	}

	#endregion

	#region Trigger Management Tests

	[Fact]
	public void CreateTrigger_ValidTrigger_CreatesSuccessfully() {
		// Arrange
		var trigger = new QuestTrigger {
			Id = "trigger1",
			Type = TriggerType.EnterLocation,
			LocationId = "town_square"
		};

		// Act
		_editor.CreateTrigger(trigger);

		// Assert
		Assert.Single(_editor.Triggers);
	}

	[Fact]
	public void GetTriggersForQuest_ReturnsCorrectTriggers() {
		// Arrange
		_editor.CreateTrigger(new QuestTrigger { Id = "t1", Type = TriggerType.EnterLocation, QuestId = "q1" });
		_editor.CreateTrigger(new QuestTrigger { Id = "t2", Type = TriggerType.TalkToNpc, QuestId = "q2" });
		_editor.CreateTrigger(new QuestTrigger { Id = "t3", Type = TriggerType.KillEnemy, QuestId = "q1" });

		// Act
		var triggers = _editor.GetTriggersForQuest("q1").ToList();

		// Assert
		Assert.Equal(2, triggers.Count);
	}

	[Fact]
	public void LinkTriggerToQuest_LinksTrigger() {
		// Arrange
		_editor.CreateTrigger(new QuestTrigger { Id = "t1", Type = TriggerType.EnterLocation });
		_editor.AddQuest(CreateTestQuest("q1"));

		// Act
		_editor.LinkTriggerToQuest("t1", "q1", TriggerAction.Start);

		// Assert
		var trigger = _editor.Triggers["t1"];
		Assert.Equal("q1", trigger.QuestId);
		Assert.Equal(TriggerAction.Start, trigger.Action);
	}

	#endregion

	#region Variable Management Tests

	[Fact]
	public void DefineVariable_NewVariable_Adds() {
		// Arrange
		var variable = new QuestVariable { Name = "dragon_killed", Type = VariableType.Bool, DefaultValue = false };

		// Act
		_editor.DefineVariable(variable);

		// Assert
		Assert.Single(_editor.Variables);
		Assert.Equal("dragon_killed", _editor.Variables[0].Name);
	}

	[Fact]
	public void DefineVariable_ExistingVariable_Updates() {
		// Arrange
		_editor.DefineVariable(new QuestVariable { Name = "counter", Type = VariableType.Int, DefaultValue = 0 });

		// Act
		_editor.DefineVariable(new QuestVariable { Name = "counter", Type = VariableType.Int, DefaultValue = 10 });

		// Assert
		Assert.Single(_editor.Variables);
		Assert.Equal(10, _editor.Variables[0].DefaultValue);
	}

	[Fact]
	public void RemoveVariable_ExistingVariable_ReturnsTrue() {
		// Arrange
		_editor.DefineVariable(new QuestVariable { Name = "test_var" });

		// Act
		var result = _editor.RemoveVariable("test_var");

		// Assert
		Assert.True(result);
		Assert.Empty(_editor.Variables);
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void Validate_ValidSystem_ReturnsValid() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1", "Quest 1"));
		_editor.AddQuest(CreateTestQuest("q2", "Quest 2") with { Prerequisites = ["q1"] });

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.True(result.IsValid);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void Validate_MissingQuestName_ReturnsError() {
		// Arrange
		_editor.AddQuest(new Quest { Id = "q1", Name = "" });

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == ValidationErrorType.MissingRequired);
	}

	[Fact]
	public void Validate_InvalidPrerequisite_ReturnsError() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1") with { Prerequisites = ["nonexistent"] });

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == ValidationErrorType.InvalidReference);
	}

	[Fact]
	public void Validate_DuplicateObjectiveId_ReturnsError() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1") with {
			Objectives = [
				new QuestObjective { Id = "obj1" },
				new QuestObjective { Id = "obj1" } // Duplicate
			]
		});

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == ValidationErrorType.DuplicateId);
	}

	[Fact]
	public void Validate_CircularDependency_ReturnsError() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1") with { Prerequisites = ["q3"] });
		_editor.AddQuest(CreateTestQuest("q2") with { Prerequisites = ["q1"] });
		_editor.AddQuest(CreateTestQuest("q3") with { Prerequisites = ["q2"] });

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == ValidationErrorType.CircularDependency);
	}

	[Fact]
	public void Validate_ChainWithMissingQuest_ReturnsError() {
		// Arrange
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["nonexistent"] });

		// Act
		var result = _editor.Validate();

		// Assert
		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Type == ValidationErrorType.InvalidReference);
	}

	#endregion

	#region Import/Export Tests

	[Fact]
	public async Task ExportAndImportJson_RoundTrip() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1", "Quest 1"));
		_editor.AddQuest(CreateTestQuest("q2", "Quest 2") with { Prerequisites = ["q1"] });
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["q1", "q2"] });
		_editor.CreateTrigger(new QuestTrigger { Id = "t1", Type = TriggerType.EnterLocation, QuestId = "q1" });

		var path = Path.Combine(_tempDir, "quests.json");

		// Act
		await _editor.ExportToJsonAsync(path);

		var newEditor = new QuestSystemEditor();
		await newEditor.ImportFromJsonAsync(path);

		// Assert
		Assert.Equal(2, newEditor.Quests.Count);
		Assert.Single(newEditor.Chains);
		Assert.Single(newEditor.Triggers);
		Assert.Equal("Quest 1", newEditor.GetQuest("q1")!.Name);
	}

	[Fact]
	public void ExportAndImportBinary_RoundTrip() {
		// Arrange
		_editor.AddQuest(new Quest {
			Id = "q1",
			Name = "Quest 1",
			Description = "Description",
			Type = QuestType.Main,
			Objectives = [new QuestObjective { Id = "obj1", Description = "Kill enemies", Type = ObjectiveType.Kill, TargetCount = 10 }],
			Rewards = [new QuestReward { Type = RewardType.Gold, Amount = 100 }],
			Prerequisites = ["prereq1"]
		});
		_editor.CreateChain(new QuestChain { Id = "chain1", Name = "Story", QuestIds = ["q1"] });

		// Act
		var binary = _editor.ExportToBinary();

		var newEditor = new QuestSystemEditor();
		newEditor.ImportFromBinary(binary);

		// Assert
		Assert.Single(newEditor.Quests);
		Assert.Single(newEditor.Chains);
		var quest = newEditor.GetQuest("q1");
		Assert.NotNull(quest);
		Assert.Equal("Quest 1", quest.Name);
		Assert.Single(quest.Objectives);
		Assert.Single(quest.Rewards);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectStats() {
		// Arrange
		_editor.AddQuest(new Quest { Id = "q1", Name = "Q1", Type = QuestType.Main });
		_editor.AddQuest(new Quest { Id = "q2", Name = "Q2", Type = QuestType.Side });
		_editor.AddQuest(new Quest { Id = "q3", Name = "Q3", Type = QuestType.Main, Prerequisites = ["q1"] });
		_editor.CreateChain(new QuestChain { Id = "c1", Name = "C1" });
		_editor.CreateTrigger(new QuestTrigger { Id = "t1", Type = TriggerType.Custom });

		// Act
		var stats = _editor.GetStatistics();

		// Assert
		Assert.Equal(3, stats.TotalQuests);
		Assert.Equal(1, stats.TotalChains);
		Assert.Equal(1, stats.TotalTriggers);
		Assert.Equal(2, stats.QuestsByType[QuestType.Main]);
		Assert.Equal(1, stats.QuestsByType[QuestType.Side]);
		Assert.Equal(1, stats.QuestsWithPrerequisites);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void Clear_ClearsAllData() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1"));
		_editor.CreateChain(new QuestChain { Id = "c1", Name = "C1" });
		_editor.CreateTrigger(new QuestTrigger { Id = "t1", Type = TriggerType.Custom });
		_editor.DefineVariable(new QuestVariable { Name = "v1" });

		// Act
		_editor.Clear();

		// Assert
		Assert.Empty(_editor.Quests);
		Assert.Empty(_editor.Chains);
		Assert.Empty(_editor.Triggers);
		Assert.Empty(_editor.Variables);
	}

	[Fact]
	public void AddQuest_DuplicateId_OverwritesExisting() {
		// Arrange
		_editor.AddQuest(CreateTestQuest("q1", "Original"));

		// Act
		_editor.AddQuest(CreateTestQuest("q1", "Replacement"));

		// Assert
		Assert.Single(_editor.Quests);
		Assert.Equal("Replacement", _editor.Quests["q1"].Name);
	}

	#endregion
}
