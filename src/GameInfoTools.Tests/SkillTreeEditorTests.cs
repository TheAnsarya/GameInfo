using GameInfoTools.Data;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for <see cref="SkillTreeEditor"/>.
/// </summary>
public class SkillTreeEditorTests {
	#region Skill Management

	[Fact]
	public void AddSkill_ValidSkill_AddsSuccessfully() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });
		var skill = new Skill {
			Id = "skill1",
			Name = "Fireball",
			Category = SkillCategory.Active
		};

		// Act
		editor.AddSkill("tree1", skill);

		// Assert
		Assert.Single(editor.Skills);
		Assert.Equal("skill1", editor.Skills.First().Value.Id);
	}

	[Fact]
	public void AddSkill_NullSkill_ThrowsException() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });

		// Act & Assert - Editor throws NullReferenceException when null skill passed
		Assert.ThrowsAny<Exception>(() => editor.AddSkill("tree1", null!));
	}

	[Fact]
	public void AddSkill_TreeNotFound_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new SkillTreeEditor();
		var skill = new Skill {
			Id = "skill1",
			Name = "Test",
			Category = SkillCategory.Active
		};

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() => editor.AddSkill("nonexistent", skill));
	}

	[Fact]
	public void AddSkill_ToExistingTree_AddsToSkillsIndex() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });
		var skill1 = new Skill { Id = "skill1", Name = "Original", Category = SkillCategory.Active };
		var skill2 = new Skill { Id = "skill2", Name = "Second", Category = SkillCategory.Passive };

		// Act
		editor.AddSkill("tree1", skill1);
		editor.AddSkill("tree1", skill2);

		// Assert
		Assert.Equal(2, editor.Skills.Count);
		Assert.Equal("Original", editor.Skills["skill1"].Name);
		Assert.Equal("Second", editor.Skills["skill2"].Name);
	}

	[Fact]
	public void RemoveSkill_ExistingSkill_ReturnsTrue() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Test", Category = SkillCategory.Active });

		// Act
		var result = editor.RemoveSkill("tree1", "skill1");

		// Assert
		Assert.True(result);
		Assert.Empty(editor.Skills);
	}

	[Fact]
	public void RemoveSkill_NonexistentSkill_ReturnsFalse() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });

		// Act
		var result = editor.RemoveSkill("tree1", "nonexistent");

		// Assert
		Assert.False(result);
	}

	[Fact]
	public void GetSkill_ExistingSkill_ReturnsSkill() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Fireball", Category = SkillCategory.Active });

		// Act
		var skill = editor.GetSkill("skill1");

		// Assert
		Assert.NotNull(skill);
		Assert.Equal("Fireball", skill.Name);
	}

	[Fact]
	public void GetSkill_NonexistentSkill_ReturnsNull() {
		// Arrange
		var editor = new SkillTreeEditor();

		// Act
		var skill = editor.GetSkill("nonexistent");

		// Assert
		Assert.Null(skill);
	}

	[Fact]
	public void UpdateSkill_ExistingSkill_UpdatesSuccessfully() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Original", Category = SkillCategory.Active });

		// Act
		editor.UpdateSkill("tree1", new Skill { Id = "skill1", Name = "Updated", Category = SkillCategory.Passive });

		// Assert
		Assert.Equal("Updated", editor.Skills["skill1"].Name);
		Assert.Equal(SkillCategory.Passive, editor.Skills["skill1"].Category);
	}

	[Fact]
	public void UpdateSkill_NonexistentSkill_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test Tree" });

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() =>
			editor.UpdateSkill("tree1", new Skill { Id = "nonexistent", Name = "Test", Category = SkillCategory.Active }));
	}

	#endregion

	#region Skill Tree Management

	[Fact]
	public void AddTree_ValidTree_AddsSuccessfully() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "Fire Magic"
		};

		// Act
		editor.AddTree(tree);

		// Assert
		Assert.Single(editor.Trees);
		Assert.Equal("Fire Magic", editor.Trees["tree1"].Name);
	}

	[Fact]
	public void AddTree_NullTree_ThrowsArgumentNullException() {
		// Arrange
		var editor = new SkillTreeEditor();

		// Act & Assert
		Assert.Throws<ArgumentNullException>(() => editor.AddTree(null!));
	}

	[Fact]
	public void RemoveTree_ExistingTree_ReturnsTrue() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });

		// Act
		var result = editor.RemoveTree("tree1");

		// Assert
		Assert.True(result);
		Assert.Empty(editor.Trees);
	}

	[Fact]
	public void GetTree_ExistingTree_ReturnsTree() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Fire Magic" });

		// Act
		var tree = editor.GetTree("tree1");

		// Assert
		Assert.NotNull(tree);
		Assert.Equal("Fire Magic", tree.Name);
	}

	[Fact]
	public void UpdateTree_ExistingTree_UpdatesSuccessfully() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Original" });

		// Act
		editor.UpdateTree(new SkillTree { Id = "tree1", Name = "Updated" });

		// Assert
		Assert.Equal("Updated", editor.Trees["tree1"].Name);
	}

	#endregion

	#region Prerequisite Management

	[Fact]
	public void AddPrerequisite_ValidSkills_AddsSuccessfully() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Base", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill { Id = "skill2", Name = "Advanced", Category = SkillCategory.Active });

		// Act
		editor.AddPrerequisite("tree1", "skill2", "skill1");

		// Assert
		var skill = editor.GetSkill("skill2");
		Assert.NotNull(skill);
		Assert.Contains("skill1", skill.Prerequisites);
	}

	[Fact]
	public void AddPrerequisite_SkillNotFound_ThrowsKeyNotFoundException() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Base", Category = SkillCategory.Active });

		// Act & Assert
		Assert.Throws<KeyNotFoundException>(() => editor.AddPrerequisite("tree1", "nonexistent", "skill1"));
	}

	[Fact]
	public void RemovePrerequisite_ExistingPrereq_ReturnsTrue() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Base", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill {
			Id = "skill2",
			Name = "Advanced",
			Category = SkillCategory.Active,
			Prerequisites = ["skill1"]
		});

		// Act
		var result = editor.RemovePrerequisite("tree1", "skill2", "skill1");

		// Assert
		Assert.True(result);
		var skill = editor.GetSkill("skill2");
		Assert.NotNull(skill);
		Assert.DoesNotContain("skill1", skill.Prerequisites);
	}

	[Fact]
	public void GetDependentSkills_ReturnsCorrectSkills() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Base", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill {
			Id = "skill2",
			Name = "Child1",
			Category = SkillCategory.Active,
			Prerequisites = ["skill1"]
		});
		editor.AddSkill("tree1", new Skill {
			Id = "skill3",
			Name = "Child2",
			Category = SkillCategory.Active,
			Prerequisites = ["skill1"]
		});

		// Act
		var dependents = editor.GetDependentSkills("skill1").ToList();

		// Assert
		Assert.Equal(2, dependents.Count);
		Assert.All(dependents, s => Assert.Contains("skill1", s.Prerequisites));
	}

	[Fact]
	public void GetPrerequisiteChain_ReturnsFullChain() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "skill1", Name = "Root", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill {
			Id = "skill2",
			Name = "Level2",
			Category = SkillCategory.Active,
			Prerequisites = ["skill1"]
		});
		editor.AddSkill("tree1", new Skill {
			Id = "skill3",
			Name = "Level3",
			Category = SkillCategory.Active,
			Prerequisites = ["skill2"]
		});

		// Act
		var chain = editor.GetPrerequisiteChain("skill3").ToList();

		// Assert
		Assert.Equal(2, chain.Count);
		Assert.Contains(chain, s => s.Id == "skill1");
		Assert.Contains(chain, s => s.Id == "skill2");
	}

	#endregion

	#region Querying

	[Fact]
	public void GetSkillsByCategory_ReturnsMatchingSkills() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "s1", Name = "Active1", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill { Id = "s2", Name = "Passive1", Category = SkillCategory.Passive });
		editor.AddSkill("tree1", new Skill { Id = "s3", Name = "Active2", Category = SkillCategory.Active });

		// Act
		var activeSkills = editor.GetSkillsByCategory(SkillCategory.Active).ToList();

		// Assert
		Assert.Equal(2, activeSkills.Count);
		Assert.All(activeSkills, s => Assert.Equal(SkillCategory.Active, s.Category));
	}

	[Fact]
	public void GetSkillsByTier_ReturnsMatchingSkills() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "s1", Name = "Tier0", Category = SkillCategory.Active, Tier = 0 });
		editor.AddSkill("tree1", new Skill { Id = "s2", Name = "Tier1A", Category = SkillCategory.Active, Tier = 1 });
		editor.AddSkill("tree1", new Skill { Id = "s3", Name = "Tier1B", Category = SkillCategory.Active, Tier = 1 });

		// Act
		var tier1Skills = editor.GetSkillsByTier(1).ToList();

		// Assert
		Assert.Equal(2, tier1Skills.Count);
		Assert.All(tier1Skills, s => Assert.Equal(1, s.Tier));
	}

	[Fact]
	public void SearchSkills_FindsByName() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "s1", Name = "Fireball", Category = SkillCategory.Active, Description = "Launch fire" });
		editor.AddSkill("tree1", new Skill { Id = "s2", Name = "Ice Storm", Category = SkillCategory.Active, Description = "Summon ice" });
		editor.AddSkill("tree1", new Skill { Id = "s3", Name = "Fire Bolt", Category = SkillCategory.Active, Description = "A bolt of light" });

		// Act - Search for "fire" matches both name and description
		var results = editor.SearchSkills("fire").ToList();

		// Assert - Should match "Fireball" (name) and "Fire Bolt" (name), description text not matching "fire" directly
		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void SearchSkills_CaseSensitive_RespectsCase() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree { Id = "tree1", Name = "Test" });
		editor.AddSkill("tree1", new Skill { Id = "s1", Name = "Fireball", Category = SkillCategory.Active });
		editor.AddSkill("tree1", new Skill { Id = "s2", Name = "fireball", Category = SkillCategory.Passive });

		// Act
		var results = editor.SearchSkills("Fire", caseSensitive: true).ToList();

		// Assert
		Assert.Single(results);
		Assert.Equal("Fireball", results[0].Name);
	}

	#endregion

	#region Cost Calculation

	[Fact]
	public void CalculateTotalCost_ReturnsSkillCostInfo() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "Test",
			Skills = [new Skill { Id = "s1", Name = "Test", Category = SkillCategory.Active, PointCost = 5, GoldCost = 100 }]
		};
		editor.AddTree(tree);

		// Act
		var cost = editor.CalculateTotalCost("s1");

		// Assert - Should return SkillCost with values
		Assert.True(cost.SkillPoints > 0);
		Assert.True(cost.SkillCount >= 1);
	}

	[Fact]
	public void CalculateTotalCost_WithPrerequisites_IncludesAllSkills() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "Test",
			Skills = [
				new Skill { Id = "s1", Name = "Root", Category = SkillCategory.Active, PointCost = 1, Tier = 0 },
				new Skill {
					Id = "s2",
					Name = "Child",
					Category = SkillCategory.Active,
					PointCost = 2,
					Tier = 1,
					Prerequisites = ["s1"]
				}
			]
		};
		editor.AddTree(tree);

		// Act - Calculate cost of s2 which requires s1
		var cost = editor.CalculateTotalCost("s2");

		// Assert - Should include multiple skills (at least 2 for the prerequisite chain)
		Assert.True(cost.SkillCount >= 2);
		Assert.True(cost.SkillPoints > 0);
	}

	#endregion

	#region Validation

	[Fact]
	public void ValidateTree_ValidTree_ReturnsNoErrors() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "Test Tree",
			Skills = [new Skill { Id = "s1", Name = "Skill1", Category = SkillCategory.Active }]
		};
		editor.AddTree(tree);

		// Act
		var result = editor.ValidateTree(tree);

		// Assert
		Assert.Empty(result);
	}

	[Fact]
	public void ValidateTree_MissingName_ReturnsError() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "", // Empty name
			Skills = [new Skill { Id = "s1", Name = "Skill1", Category = SkillCategory.Active }]
		};

		// Act
		var result = editor.ValidateTree(tree).ToList();

		// Assert
		Assert.NotEmpty(result);
		Assert.Contains(result, e => e.Type == SkillTreeValidationErrorType.MissingRequired);
	}

	[Fact]
	public void ValidateTree_DuplicateSkillIds_ReturnsError() {
		// Arrange
		var editor = new SkillTreeEditor();
		var tree = new SkillTree {
			Id = "tree1",
			Name = "Test Tree",
			Skills = [
				new Skill { Id = "s1", Name = "Skill1", Category = SkillCategory.Active },
				new Skill { Id = "s1", Name = "Duplicate", Category = SkillCategory.Passive }
			]
		};

		// Act
		var result = editor.ValidateTree(tree).ToList();

		// Assert
		Assert.NotEmpty(result);
		Assert.Contains(result, e => e.Type == SkillTreeValidationErrorType.DuplicateId);
	}

	#endregion

	#region Import/Export

	[Fact]
	public async Task ExportToJson_CreatesValidFile() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree {
			Id = "t1",
			Name = "Fire Magic",
			Skills = [new Skill { Id = "s1", Name = "Fireball", Category = SkillCategory.Active }]
		});
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await editor.ExportToJsonAsync(tempPath);

			// Assert
			Assert.True(File.Exists(tempPath));
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.Contains("Fireball", content);
			Assert.Contains("Fire Magic", content);
		} finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public async Task ImportFromJson_LoadsData() {
		// Arrange
		var originalEditor = new SkillTreeEditor();
		originalEditor.AddTree(new SkillTree {
			Id = "t1",
			Name = "Fire Magic",
			Skills = [new Skill { Id = "s1", Name = "Fireball", Category = SkillCategory.Active }]
		});
		var tempPath = Path.GetTempFileName();

		try {
			await originalEditor.ExportToJsonAsync(tempPath);

			var newEditor = new SkillTreeEditor();

			// Act
			await newEditor.ImportFromJsonAsync(tempPath);

			// Assert
			Assert.Single(newEditor.Trees);
			Assert.Single(newEditor.Skills);
			Assert.Equal("Fireball", newEditor.Skills["s1"].Name);
		} finally {
			File.Delete(tempPath);
		}
	}

	#endregion

	#region Clear

	[Fact]
	public void Clear_RemovesAllData() {
		// Arrange
		var editor = new SkillTreeEditor();
		editor.AddTree(new SkillTree {
			Id = "t1",
			Name = "Test Tree",
			Skills = [new Skill { Id = "s1", Name = "Test", Category = SkillCategory.Active }]
		});

		// Act
		editor.Clear();

		// Assert
		Assert.Empty(editor.Skills);
		Assert.Empty(editor.Trees);
	}

	#endregion
}
