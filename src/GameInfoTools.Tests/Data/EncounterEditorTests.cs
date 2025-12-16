using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

/// <summary>
/// Tests for the encounter editor service.
/// </summary>
public class EncounterEditorTests {
	private static byte[] CreateTestRomData() {
		var data = new byte[0x1000];

		// Formation table at 0x100 (8 bytes per formation, 6 formations)
		// Format: Enemy1, Count1, Enemy2, Count2, Enemy3, Count3, Background, Flags
		int offset = 0x100;

		// Formation 0: Single Slime
		data[offset + 0] = 0x01; // Slime
		data[offset + 1] = 0x01; // Count 1
		data[offset + 2] = 0x00; // Empty
		data[offset + 3] = 0x00;
		data[offset + 4] = 0x00;
		data[offset + 5] = 0x00;
		data[offset + 6] = 0x01; // Background 1
		data[offset + 7] = 0x00; // Flags (normal)

		// Formation 1: Slime x3
		offset += 8;
		data[offset + 0] = 0x01; // Slime
		data[offset + 1] = 0x03; // Count 3
		data[offset + 2] = 0x00;
		data[offset + 3] = 0x00;
		data[offset + 4] = 0x00;
		data[offset + 5] = 0x00;
		data[offset + 6] = 0x01;
		data[offset + 7] = 0x00;

		// Formation 2: Goblin + Slime x2
		offset += 8;
		data[offset + 0] = 0x02; // Goblin
		data[offset + 1] = 0x01;
		data[offset + 2] = 0x01; // Slime
		data[offset + 3] = 0x02; // Count 2
		data[offset + 4] = 0x00;
		data[offset + 5] = 0x00;
		data[offset + 6] = 0x02; // Background 2
		data[offset + 7] = 0x00;

		// Formation 3: Wolf pack
		offset += 8;
		data[offset + 0] = 0x03; // Wolf
		data[offset + 1] = 0x04; // Count 4
		data[offset + 2] = 0x00;
		data[offset + 3] = 0x00;
		data[offset + 4] = 0x00;
		data[offset + 5] = 0x00;
		data[offset + 6] = 0x03;
		data[offset + 7] = 0x00;

		// Formation 4: Dragon (boss)
		offset += 8;
		data[offset + 0] = 0x10; // Dragon
		data[offset + 1] = 0x01;
		data[offset + 2] = 0x00;
		data[offset + 3] = 0x00;
		data[offset + 4] = 0x00;
		data[offset + 5] = 0x00;
		data[offset + 6] = 0x10;
		data[offset + 7] = 0x03; // Boss, no escape, no surprise

		// Formation 5: Mixed group
		offset += 8;
		data[offset + 0] = 0x01; // Slime
		data[offset + 1] = 0x02;
		data[offset + 2] = 0x02; // Goblin
		data[offset + 3] = 0x02;
		data[offset + 4] = 0x03; // Wolf
		data[offset + 5] = 0x01;
		data[offset + 6] = 0x02;
		data[offset + 7] = 0x00;

		// Encounter group table at 0x200 (8 bytes per group, 4 groups)
		// Format: EncounterRate, Formation indices (up to 7)
		offset = 0x200;

		// Group 0: Plains (Slimes)
		data[offset + 0] = 32;   // Encounter rate
		data[offset + 1] = 0;    // Formation 0
		data[offset + 2] = 1;    // Formation 1
		data[offset + 3] = 0xff; // End
		data[offset + 4] = 0xff;
		data[offset + 5] = 0xff;
		data[offset + 6] = 0xff;
		data[offset + 7] = 0xff;

		// Group 1: Forest (Mixed)
		offset += 8;
		data[offset + 0] = 48;   // Higher rate
		data[offset + 1] = 2;    // Formation 2
		data[offset + 2] = 3;    // Formation 3
		data[offset + 3] = 5;    // Formation 5
		data[offset + 4] = 0xff;
		data[offset + 5] = 0xff;
		data[offset + 6] = 0xff;
		data[offset + 7] = 0xff;

		// Group 2: Cave
		offset += 8;
		data[offset + 0] = 64;
		data[offset + 1] = 1;
		data[offset + 2] = 2;
		data[offset + 3] = 3;
		data[offset + 4] = 5;
		data[offset + 5] = 0xff;
		data[offset + 6] = 0xff;
		data[offset + 7] = 0xff;

		// Group 3: Boss area
		offset += 8;
		data[offset + 0] = 0;    // No random encounters
		data[offset + 1] = 4;    // Boss formation only (for scripted battle)
		data[offset + 2] = 0xff;
		data[offset + 3] = 0xff;
		data[offset + 4] = 0xff;
		data[offset + 5] = 0xff;
		data[offset + 6] = 0xff;
		data[offset + 7] = 0xff;

		return data;
	}

	private static EncounterEditor CreateEditorWithData() {
		var data = CreateTestRomData();
		var editor = new EncounterEditor(data);

		var schema = new EncounterEditor.EncounterTableSchema {
			Name = "Test Encounters",
			BaseOffset = 0x200,
			GroupSize = 8,
			GroupCount = 4,
			FormationTableOffset = 0x100,
			FormationSize = 8,
			FormationCount = 6,
			MaxFormationsPerGroup = 7,
			MaxSlotsPerFormation = 3,
			EncounterRateOffset = 0,
			FormationIndexOffset = 1,
			EnemyIdOffset = 0,
			EnemyCountOffset = 1,
			BackgroundOffset = 6,
			FlagsOffset = 7
		};

		editor.SetSchema(schema);
		editor.SetEnemyNames(new Dictionary<int, string> {
			[0x01] = "Slime",
			[0x02] = "Goblin",
			[0x03] = "Wolf",
			[0x10] = "Dragon"
		});

		return editor;
	}

	[Fact]
	public void LoadEncounters_LoadsFormations() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();

		Assert.Equal(6, editor.Formations.Count);
	}

	[Fact]
	public void LoadEncounters_LoadsGroups() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();

		Assert.Equal(4, editor.Groups.Count);
	}

	[Fact]
	public void LoadEncounters_FormationHasCorrectEnemies() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var formation = editor.GetFormation(2); // Goblin + Slime x2

		Assert.NotNull(formation);
		Assert.Equal(2, formation!.Slots.Count);
		Assert.Equal(0x02, formation.Slots[0].EnemyId); // Goblin
		Assert.Equal(0x01, formation.Slots[1].EnemyId); // Slime
	}

	[Fact]
	public void LoadEncounters_FormationHasCorrectCounts() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var formation = editor.GetFormation(2);

		Assert.NotNull(formation);
		Assert.Equal(1, formation!.Slots[0].MinCount); // Goblin x1
		Assert.Equal(2, formation.Slots[1].MinCount);  // Slime x2
	}

	[Fact]
	public void LoadEncounters_FormationHasBackground() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var formation = editor.GetFormation(2);

		Assert.NotNull(formation);
		Assert.Equal(2, formation!.BackgroundId);
	}

	[Fact]
	public void LoadEncounters_BossFormationHasFlags() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var bossFormation = editor.GetFormation(4);

		Assert.NotNull(bossFormation);
		Assert.True(bossFormation!.IsBossFight);
		Assert.False(bossFormation.CanEscape);
	}

	[Fact]
	public void LoadEncounters_GroupHasEncounterRate() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var group = editor.GetGroup(1); // Forest

		Assert.NotNull(group);
		Assert.Equal(48, group!.EncounterRate);
	}

	[Fact]
	public void LoadEncounters_GroupHasFormations() {
		var editor = CreateEditorWithData();

		editor.LoadEncounters();
		var group = editor.GetGroup(1); // Forest

		Assert.NotNull(group);
		Assert.Equal(3, group!.Formations.Count);
	}

	[Fact]
	public void GetEnemyName_ReturnsConfiguredName() {
		var editor = CreateEditorWithData();

		Assert.Equal("Slime", editor.GetEnemyName(0x01));
		Assert.Equal("Dragon", editor.GetEnemyName(0x10));
	}

	[Fact]
	public void GetEnemyName_ReturnsFallbackForUnknown() {
		var editor = CreateEditorWithData();

		Assert.Equal("Enemy #99", editor.GetEnemyName(0x99)); // 0x99 formats as "99" in hex
	}

	[Fact]
	public void GetFormationsWithEnemy_ReturnsCorrectFormations() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var slimeFormations = editor.GetFormationsWithEnemy(0x01);

		Assert.True(slimeFormations.Count >= 3); // Formations 0, 1, 2, 5
	}

	[Fact]
	public void GetUsedEnemies_ReturnsAllUsed() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var enemies = editor.GetUsedEnemies();

		Assert.Equal(4, enemies.Count); // Slime, Goblin, Wolf, Dragon
	}

	[Fact]
	public void SetEncounterRate_UpdatesGroup() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		editor.SetEncounterRate(0, 100);
		var group = editor.GetGroup(0);

		Assert.NotNull(group);
		Assert.Equal(100, group!.EncounterRate);
	}

	[Fact]
	public void ReplaceEnemy_UpdatesFormation() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		editor.ReplaceEnemy(0, 0, 0x02); // Replace Slime with Goblin
		var formation = editor.GetFormation(0);

		Assert.NotNull(formation);
		Assert.Equal(0x02, formation!.Slots[0].EnemyId);
		Assert.Equal("Goblin", formation.Slots[0].EnemyName);
	}

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var stats = editor.GetStatistics();

		Assert.Equal(4, stats.GroupCount);
		Assert.Equal(6, stats.FormationCount);
		Assert.Equal(4, stats.UniqueEnemyCount);
		Assert.Equal(1, stats.BossFormationCount);
	}

	[Fact]
	public void ExportToJson_CreatesValidJson() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var json = editor.ExportToJson();

		Assert.NotEmpty(json);
		Assert.Contains("Formations", json);
		Assert.Contains("Groups", json);
		Assert.Contains("Slime", json);
	}

	[Fact]
	public void CreateNesSchema_HasCorrectDefaults() {
		var schema = EncounterEditor.CreateNesSchema(0x1000, 8, 16, 0x2000, 4, 32);

		Assert.Equal("NES Encounters", schema.Name);
		Assert.Equal(0x1000, schema.BaseOffset);
		Assert.Equal(4, schema.MaxFormationsPerGroup);
		Assert.Equal(4, schema.MaxSlotsPerFormation);
	}

	[Fact]
	public void CreateSnesSchema_HasCorrectDefaults() {
		var schema = EncounterEditor.CreateSnesSchema(0x1000, 16, 32, 0x3000, 8, 64);

		Assert.Equal("SNES Encounters", schema.Name);
		Assert.Equal(8, schema.MaxFormationsPerGroup);
		Assert.Equal(6, schema.MaxSlotsPerFormation);
	}

	[Fact]
	public void LoadEncounters_ThrowsWithoutSchema() {
		var data = CreateTestRomData();
		var editor = new EncounterEditor(data);

		Assert.Throws<InvalidOperationException>(() => editor.LoadEncounters());
	}

	[Fact]
	public void GetGroup_ReturnsNullForInvalidId() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var group = editor.GetGroup(999);

		Assert.Null(group);
	}

	[Fact]
	public void GetFormation_ReturnsNullForInvalidId() {
		var editor = CreateEditorWithData();
		editor.LoadEncounters();

		var formation = editor.GetFormation(999);

		Assert.Null(formation);
	}
}
