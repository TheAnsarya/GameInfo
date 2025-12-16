using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

/// <summary>
/// Tests for the BattleSystemEditor service.
/// </summary>
public class BattleSystemEditorTests {
	private static byte[] CreateTestRomData() {
		var data = new byte[0x500];

		// Damage formula table at 0x100 (4 formulas, 6 bytes each)
		int offset = 0x100;
		// Formula 0: Physical type, multiplier 100, stat weight 50, def weight 50, variance 16, no element
		data[offset + 0] = 0x00;  // Type: Physical (0)
		data[offset + 1] = 100;   // BaseMultiplier
		data[offset + 2] = 50;    // StatWeight
		data[offset + 3] = 50;    // DefenseWeight
		data[offset + 4] = 16;    // RandomVariance
		data[offset + 5] = 0;     // ElementId

		offset += 6;
		// Formula 1: Magical type, multiplier 150, high stat weight
		data[offset + 0] = 0x01;  // Type: Magical (1)
		data[offset + 1] = 150;
		data[offset + 2] = 80;
		data[offset + 3] = 30;
		data[offset + 4] = 8;
		data[offset + 5] = 1;     // Fire element

		offset += 6;
		// Formula 2: Fixed damage type
		data[offset + 0] = 0x02;  // Type: FixedDamage (2)
		data[offset + 1] = 200;
		data[offset + 2] = 0;
		data[offset + 3] = 0;
		data[offset + 4] = 0;
		data[offset + 5] = 0;

		offset += 6;
		// Formula 3: Healing type
		data[offset + 0] = 0x04;  // Type: Healing (4)
		data[offset + 1] = 120;
		data[offset + 2] = 60;
		data[offset + 3] = 0;
		data[offset + 4] = 10;
		data[offset + 5] = 0;

		// Action table at 0x200 (8 actions, 8 bytes each)
		offset = 0x200;
		// Action 0: Basic attack
		data[offset + 0] = 0x00 | (0x03 << 3);  // Type: Attack, Target: SingleEnemy
		data[offset + 1] = 100;   // Power
		data[offset + 2] = 95;    // Accuracy
		data[offset + 3] = 0;     // MP cost
		data[offset + 4] = 0;     // FormulaId
		data[offset + 5] = 0;     // ElementId
		data[offset + 6] = 0;     // StatusEffectId
		data[offset + 7] = 0;     // StatusChance

		offset += 8;
		// Action 1: Fire spell
		data[offset + 0] = 0x01 | (0x03 << 3);  // Type: Spell, Target: SingleEnemy
		data[offset + 1] = 80;
		data[offset + 2] = 100;
		data[offset + 3] = 5;     // 5 MP
		data[offset + 4] = 1;     // Magic formula
		data[offset + 5] = 0;     // Fire element
		data[offset + 6] = 0;
		data[offset + 7] = 0;

		offset += 8;
		// Action 2: Poison attack
		data[offset + 0] = 0x02 | (0x03 << 3);  // Type: Skill, Target: SingleEnemy
		data[offset + 1] = 60;
		data[offset + 2] = 80;
		data[offset + 3] = 3;
		data[offset + 4] = 0;
		data[offset + 5] = 0;
		data[offset + 6] = 0;     // Poison status
		data[offset + 7] = 50;    // 50% chance

		offset += 8;
		// Action 3: Heal spell
		data[offset + 0] = 0x01 | (0x01 << 3);  // Type: Spell, Target: SingleAlly
		data[offset + 1] = 50;
		data[offset + 2] = 100;
		data[offset + 3] = 4;
		data[offset + 4] = 3;     // Healing formula
		data[offset + 5] = 0;
		data[offset + 6] = 0;
		data[offset + 7] = 0;

		offset += 8;
		// Action 4: Ice spell (all enemies)
		data[offset + 0] = 0x01 | (0x04 << 3);  // Type: Spell, Target: AllEnemies
		data[offset + 1] = 60;
		data[offset + 2] = 100;
		data[offset + 3] = 8;
		data[offset + 4] = 1;
		data[offset + 5] = 1;     // Ice element
		data[offset + 6] = 0;
		data[offset + 7] = 0;

		offset += 8;
		// Action 5: Thunder spell
		data[offset + 0] = 0x01 | (0x03 << 3);
		data[offset + 1] = 90;
		data[offset + 2] = 90;
		data[offset + 3] = 6;
		data[offset + 4] = 1;
		data[offset + 5] = 2;     // Thunder element
		data[offset + 6] = 1;     // Paralysis
		data[offset + 7] = 20;    // 20% chance

		offset += 8;
		// Action 6: Defend
		data[offset + 0] = 0x04 | (0x00 << 3);  // Type: Defend, Target: Self
		data[offset + 1] = 0;
		data[offset + 2] = 100;
		data[offset + 3] = 0;
		data[offset + 4] = 0;
		data[offset + 5] = 0;
		data[offset + 6] = 0;
		data[offset + 7] = 0;

		offset += 8;
		// Action 7: Escape
		data[offset + 0] = 0x05 | (0x02 << 3);  // Type: Escape, Target: AllAllies
		data[offset + 1] = 0;
		data[offset + 2] = 50;    // 50% success
		data[offset + 3] = 0;
		data[offset + 4] = 0;
		data[offset + 5] = 0;
		data[offset + 6] = 0;
		data[offset + 7] = 0;

		// Status effect table at 0x300 (4 statuses, 4 bytes each)
		// Format: bits 0-2 = category (0-7), bits 3-7 = flags (masked with 0xf8)
		offset = 0x300;
		// Status 0: Poison - Category Ailment (2), Flags TakesDamageOverTime
		// To store TakesDamageOverTime (value 4) in bits 3-7, we need to shift or use the mask value
		// The loader reads flags as (_data[offset] & 0xf8), so value 4 would need to be at bit position 3+
		// TakesDamageOverTime = 4 = 0b00000100, after & 0xf8 = 0
		// We need the actual byte value to have bits 3+ set: 0x08 = TakesDamageOverTime in position
		data[offset + 0] = 0x02 | 0x08;  // Ailment(2) | TakesDamageOverTime flag at bit 3 (value 8 when masked with 0xf8)
		data[offset + 1] = 255;   // Infinite duration (until cured)
		data[offset + 2] = 5;     // 5 damage per tick
		data[offset + 3] = 0;

		offset += 4;
		// Status 1: Sleep - Using index 1 which maps to "Sleep" in defaults, Ailment category with CannotAct
		// CannotAct = 1 = 0b00000001, need it at bit 3+ = 0x08
		data[offset + 0] = 0x02 | 0x08;  // Ailment + CannotAct flag
		data[offset + 1] = 3;     // 3 turns
		data[offset + 2] = 0;
		data[offset + 3] = 0;

		offset += 4;
		// Status 2: Confusion (mapped by default name array index)
		data[offset + 0] = 0x02 | 0x08 | 0x10;  // Ailment + CannotAct + RemoveOnDamage
		data[offset + 1] = 5;
		data[offset + 2] = 0;
		data[offset + 3] = 0;

		offset += 4;
		// Status 3: Paralysis (index 3 = Paralysis in defaults) - Buff category, no flags
		data[offset + 0] = 0x00;  // Buff category, no flags
		data[offset + 1] = 3;
		data[offset + 2] = 0;
		data[offset + 3] = 25;    // +25% stat modifier

		// Element table at 0x400 (4 elements, 2 bytes each)
		offset = 0x400;
		// Element 0: Fire (opposes Ice)
		data[offset + 0] = 1;     // Opposing element: Ice
		data[offset + 1] = 50;    // 50% bonus damage

		offset += 2;
		// Element 1: Ice (opposes Fire)
		data[offset + 0] = 0;     // Opposing element: Fire
		data[offset + 1] = 50;

		offset += 2;
		// Element 2: Thunder (no opposing)
		data[offset + 0] = 0xff;
		data[offset + 1] = 0;

		offset += 2;
		// Element 3: Wind (opposes Earth - not present)
		data[offset + 0] = 4;
		data[offset + 1] = 30;

		return data;
	}

	private static BattleSystemEditor CreateEditorWithSchema() {
		var data = CreateTestRomData();
		var editor = new BattleSystemEditor(data);

		var schema = new BattleSystemEditor.BattleSchema {
			Name = "Test Battle System",
			DamageFormulaTableOffset = 0x100,
			DamageFormulaCount = 4,
			DamageFormulaSize = 6,
			ActionTableOffset = 0x200,
			ActionCount = 8,
			ActionSize = 8,
			StatusEffectTableOffset = 0x300,
			StatusEffectCount = 4,
			StatusEffectSize = 4,
			ElementTableOffset = 0x400,
			ElementCount = 4,
			ElementSize = 2,
			HasElementalSystem = true,
			HasStatusSystem = true
		};

		editor.SetSchema(schema);
		return editor;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var data = new byte[100];
		var editor = new BattleSystemEditor(data);
		Assert.NotNull(editor);
	}

	[Fact]
	public void Constructor_WithNullData_ThrowsException() {
		Assert.Throws<ArgumentNullException>(() => new BattleSystemEditor(null!));
	}

	[Fact]
	public void Constructor_InitializesEmptyCollections() {
		var data = new byte[100];
		var editor = new BattleSystemEditor(data);

		Assert.Empty(editor.DamageFormulas);
		Assert.Empty(editor.Actions);
		Assert.Empty(editor.StatusEffects);
		Assert.Empty(editor.Elements);
	}

	#endregion

	#region Schema Tests

	[Fact]
	public void SetSchema_StoresSchema() {
		var data = new byte[100];
		var editor = new BattleSystemEditor(data);
		var schema = new BattleSystemEditor.BattleSchema {
			Name = "Test Schema"
		};

		editor.SetSchema(schema);

		Assert.Equal(schema, editor.Schema);
	}

	[Fact]
	public void SetSchema_ClearsExistingData() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();
		Assert.NotEmpty(editor.DamageFormulas);

		var newSchema = new BattleSystemEditor.BattleSchema { Name = "New Schema" };
		editor.SetSchema(newSchema);

		Assert.Empty(editor.DamageFormulas);
	}

	[Fact]
	public void CreateDragonQuestNesSchema_ReturnsCorrectFormat() {
		var schema = BattleSystemEditor.CreateDragonQuestNesSchema(0x1000, 0x2000, 0x3000);

		Assert.Equal("Dragon Quest NES", schema.Name);
		Assert.Equal(8, schema.DamageFormulaCount);
		Assert.Equal(4, schema.DamageFormulaSize);
		Assert.Equal(64, schema.ActionCount);
		Assert.False(schema.HasElementalSystem);
		Assert.True(schema.HasStatusSystem);
	}

	[Fact]
	public void CreateFinalFantasyNesSchema_ReturnsCorrectFormat() {
		var schema = BattleSystemEditor.CreateFinalFantasyNesSchema(0x1000, 0x2000, 0x3000, 0x4000);

		Assert.Equal("Final Fantasy NES", schema.Name);
		Assert.Equal(16, schema.DamageFormulaCount);
		Assert.Equal(128, schema.ActionCount);
		Assert.True(schema.HasElementalSystem);
		Assert.True(schema.HasStatusSystem);
	}

	[Fact]
	public void CreateSnesRpgSchema_ReturnsCorrectFormat() {
		var schema = BattleSystemEditor.CreateSnesRpgSchema(0x10000, 0x20000, 0x30000, 0x40000);

		Assert.Equal("SNES RPG", schema.Name);
		Assert.Equal(32, schema.DamageFormulaCount);
		Assert.Equal(256, schema.ActionCount);
		Assert.Equal(32, schema.StatusEffectCount);
		Assert.Equal(16, schema.ElementCount);
	}

	#endregion

	#region Load Tests

	[Fact]
	public void LoadAll_WithoutSchema_ThrowsException() {
		var data = new byte[100];
		var editor = new BattleSystemEditor(data);

		Assert.Throws<InvalidOperationException>(() => editor.LoadAll());
	}

	[Fact]
	public void LoadAll_LoadsAllData() {
		var editor = CreateEditorWithSchema();

		editor.LoadAll();

		Assert.Equal(4, editor.DamageFormulas.Count);
		Assert.Equal(8, editor.Actions.Count);
		Assert.Equal(4, editor.StatusEffects.Count);
		Assert.Equal(4, editor.Elements.Count);
	}

	[Fact]
	public void LoadDamageFormulas_LoadsCorrectData() {
		var editor = CreateEditorWithSchema();

		editor.LoadDamageFormulas();

		Assert.Equal(4, editor.DamageFormulas.Count);

		var formula0 = editor.DamageFormulas[0];
		Assert.Equal(0, formula0.Id);
		Assert.Equal(BattleSystemEditor.FormulaType.Physical, formula0.Type);
		Assert.Equal(100, formula0.BaseMultiplier);
		Assert.Equal(50, formula0.StatWeight);
		Assert.Equal(50, formula0.DefenseWeight);
	}

	[Fact]
	public void LoadDamageFormulas_SetsRomOffset() {
		var editor = CreateEditorWithSchema();

		editor.LoadDamageFormulas();

		Assert.Equal(0x100, editor.DamageFormulas[0].RomOffset);
		Assert.Equal(0x106, editor.DamageFormulas[1].RomOffset);
	}

	[Fact]
	public void LoadActions_LoadsCorrectData() {
		var editor = CreateEditorWithSchema();

		editor.LoadActions();

		Assert.Equal(8, editor.Actions.Count);

		var attack = editor.Actions[0];
		Assert.Equal(BattleSystemEditor.ActionType.Attack, attack.Type);
		Assert.Equal(BattleSystemEditor.TargetType.SingleEnemy, attack.Target);
		Assert.Equal(100, attack.Power);
		Assert.Equal(95, attack.Accuracy);
	}

	[Fact]
	public void LoadActions_LoadsSpellWithMpCost() {
		var editor = CreateEditorWithSchema();

		editor.LoadActions();

		var fireSpell = editor.Actions[1];
		Assert.Equal(BattleSystemEditor.ActionType.Spell, fireSpell.Type);
		Assert.Equal(5, fireSpell.MpCost);
		Assert.Equal(1, fireSpell.FormulaId);
	}

	[Fact]
	public void LoadActions_LoadsActionWithStatusEffect() {
		var editor = CreateEditorWithSchema();

		editor.LoadActions();

		var poisonAttack = editor.Actions[2];
		Assert.Equal(0, poisonAttack.StatusEffectId);
		Assert.Equal(50, poisonAttack.StatusChance);
	}

	[Fact]
	public void LoadStatusEffects_LoadsCorrectData() {
		var editor = CreateEditorWithSchema();

		editor.LoadStatusEffects();

		Assert.Equal(4, editor.StatusEffects.Count);

		var poison = editor.StatusEffects[0];
		Assert.Equal(BattleSystemEditor.StatusCategory.Ailment, poison.Category);
		Assert.Equal(5, poison.TickDamage);
	}

	[Fact]
	public void LoadStatusEffects_SetsDefaultNames() {
		var editor = CreateEditorWithSchema();

		editor.LoadStatusEffects();

		// Default names are assigned by index: 0=Poison, 1=Sleep, 2=Confusion, 3=Paralysis
		Assert.Equal("Poison", editor.StatusEffects[0].Name);
		Assert.Equal("Sleep", editor.StatusEffects[1].Name);
		Assert.Equal("Confusion", editor.StatusEffects[2].Name);
		Assert.Equal("Paralysis", editor.StatusEffects[3].Name);
	}

	[Fact]
	public void LoadElements_LoadsCorrectData() {
		var editor = CreateEditorWithSchema();

		editor.LoadElements();

		Assert.Equal(4, editor.Elements.Count);

		var fire = editor.Elements[0];
		Assert.Equal(1, fire.OpposingElementId);
		Assert.Equal(50, fire.BonusDamagePercent);
	}

	[Fact]
	public void LoadElements_SetsDefaultNames() {
		var editor = CreateEditorWithSchema();

		editor.LoadElements();

		Assert.Equal("Fire", editor.Elements[0].Name);
		Assert.Equal("Ice", editor.Elements[1].Name);
		Assert.Equal("Thunder", editor.Elements[2].Name);
	}

	#endregion

	#region Get Tests

	[Fact]
	public void GetFormula_ReturnsCorrectFormula() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var formula = editor.GetFormula(1);

		Assert.NotNull(formula);
		Assert.Equal(1, formula.Id);
		Assert.Equal(BattleSystemEditor.FormulaType.Magical, formula.Type);
	}

	[Fact]
	public void GetFormula_WithInvalidId_ReturnsNull() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var formula = editor.GetFormula(99);

		Assert.Null(formula);
	}

	[Fact]
	public void GetAction_ReturnsCorrectAction() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var action = editor.GetAction(1);

		Assert.NotNull(action);
		Assert.Equal(1, action.Id);
		Assert.Equal(BattleSystemEditor.ActionType.Spell, action.Type);
	}

	[Fact]
	public void GetStatusEffect_ReturnsCorrectStatus() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var status = editor.GetStatusEffect(0);

		Assert.NotNull(status);
		Assert.Equal("Poison", status.Name);
	}

	[Fact]
	public void GetElement_ReturnsCorrectElement() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var element = editor.GetElement(0);

		Assert.NotNull(element);
		Assert.Equal("Fire", element.Name);
	}

	[Fact]
	public void GetActionsByType_ReturnsMatchingActions() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var spells = editor.GetActionsByType(BattleSystemEditor.ActionType.Spell);

		Assert.Equal(4, spells.Count);  // Fire, Heal, Ice, Thunder
	}

	[Fact]
	public void GetActionsByElement_ReturnsMatchingActions() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var thunderActions = editor.GetActionsByElement(2);

		Assert.Single(thunderActions);  // Thunder spell has element 2
	}

	[Fact]
	public void GetActionsWithStatus_ReturnsMatchingActions() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var poisonActions = editor.GetActionsWithStatus(0);

		Assert.Single(poisonActions);  // Poison attack
	}

	#endregion

	#region Update Tests

	[Fact]
	public void UpdateFormula_UpdatesInMemory() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var formula = editor.GetFormula(0);
		Assert.NotNull(formula);

		formula.BaseMultiplier = 200;
		var success = editor.UpdateFormula(formula);

		Assert.True(success);
		Assert.Equal(200, editor.DamageFormulas[0].BaseMultiplier);
	}

	[Fact]
	public void UpdateFormula_WithNonexistentId_ReturnsFalse() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var formula = new BattleSystemEditor.DamageFormula { Id = 99 };
		var success = editor.UpdateFormula(formula);

		Assert.False(success);
	}

	[Fact]
	public void UpdateAction_UpdatesInMemory() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var action = editor.GetAction(0);
		Assert.NotNull(action);

		action.Power = 150;
		var success = editor.UpdateAction(action);

		Assert.True(success);
		Assert.Equal(150, editor.Actions[0].Power);
	}

	[Fact]
	public void UpdateStatusEffect_UpdatesInMemory() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var status = editor.GetStatusEffect(0);
		Assert.NotNull(status);

		status.Duration = 10;
		var success = editor.UpdateStatusEffect(status);

		Assert.True(success);
		Assert.Equal(10, editor.StatusEffects[0].Duration);
	}

	[Fact]
	public void UpdateElement_UpdatesInMemory() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var element = editor.GetElement(0);
		Assert.NotNull(element);

		element.BonusDamagePercent = 100;
		var success = editor.UpdateElement(element);

		Assert.True(success);
		Assert.Equal(100, editor.Elements[0].BonusDamagePercent);
	}

	#endregion

	#region Save Tests

	[Fact]
	public void SaveToData_ReturnsModifiedData() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var formula = editor.GetFormula(0);
		Assert.NotNull(formula);
		formula.BaseMultiplier = 200;
		editor.UpdateFormula(formula);

		var savedData = editor.SaveToData();

		Assert.Equal(200, savedData[0x100 + 1]);  // BaseMultiplier at offset + 1
	}

	[Fact]
	public void SaveToData_PreservesUnmodifiedData() {
		var originalData = CreateTestRomData();
		var editor = new BattleSystemEditor(originalData);

		var schema = new BattleSystemEditor.BattleSchema {
			Name = "Test",
			DamageFormulaTableOffset = 0x100,
			DamageFormulaCount = 4,
			DamageFormulaSize = 6
		};
		editor.SetSchema(schema);
		editor.LoadDamageFormulas();

		var savedData = editor.SaveToData();

		// Check unrelated data is preserved
		Assert.Equal(originalData[0], savedData[0]);
		Assert.Equal(originalData[0x50], savedData[0x50]);
	}

	[Fact]
	public void SaveToData_SavesActionChanges() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var action = editor.GetAction(0);
		Assert.NotNull(action);
		action.Power = 255;
		editor.UpdateAction(action);

		var savedData = editor.SaveToData();

		Assert.Equal(255, savedData[0x200 + 1]);  // Power at offset + 1
	}

	[Fact]
	public void SaveToData_SavesStatusChanges() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var status = editor.GetStatusEffect(0);
		Assert.NotNull(status);
		status.TickDamage = 20;
		editor.UpdateStatusEffect(status);

		var savedData = editor.SaveToData();

		Assert.Equal(20, savedData[0x300 + 2]);  // TickDamage at offset + 2
	}

	#endregion

	#region Calculation Tests

	[Fact]
	public void DamageFormula_CalculateDamage_ReturnsCorrectValue() {
		var formula = new BattleSystemEditor.DamageFormula {
			BaseMultiplier = 100,
			StatWeight = 50,
			DefenseWeight = 50,
			RandomVariance = 0  // No variance for predictable test
		};

		int damage = formula.CalculateDamage(100, 50);

		Assert.Equal(75, damage);  // (100 * 100 / 100) - (50 * 50 / 100) = 100 - 25 = 75
	}

	[Fact]
	public void DamageFormula_CalculateDamage_MinimumOfOne() {
		var formula = new BattleSystemEditor.DamageFormula {
			BaseMultiplier = 10,
			DefenseWeight = 100,
			RandomVariance = 0
		};

		int damage = formula.CalculateDamage(10, 100);

		Assert.Equal(1, damage);  // Should never go below 1
	}

	[Fact]
	public void CalculateActionDamage_UsesFormulaCorrectly() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		int damage = editor.CalculateActionDamage(0, 100, 50, 1, 0);

		Assert.True(damage > 0);
	}

	[Fact]
	public void CalculateActionDamage_WithInvalidAction_ReturnsZero() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		int damage = editor.CalculateActionDamage(99, 100, 50);

		Assert.Equal(0, damage);
	}

	[Fact]
	public void GetElementalDamageModifier_WithOpposingElements_ReturnsBonusDamage() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		// Fire (0) attacking Ice (1), Fire opposes Ice
		int modifier = editor.GetElementalDamageModifier(0, 1);

		Assert.Equal(150, modifier);  // 100 + 50% bonus
	}

	[Fact]
	public void GetElementalDamageModifier_WithNeutralElements_ReturnsBaseDamage() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		// Thunder (2) attacking Fire (0), no opposition
		int modifier = editor.GetElementalDamageModifier(2, 0);

		Assert.Equal(100, modifier);
	}

	[Fact]
	public void GetElementalDamageModifier_WithInvalidElements_ReturnsBaseDamage() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		int modifier = editor.GetElementalDamageModifier(99, 0);

		Assert.Equal(100, modifier);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var stats = editor.GetStatistics();

		Assert.Equal(4, stats.FormulaCount);
		Assert.Equal(8, stats.ActionCount);
		Assert.Equal(4, stats.StatusEffectCount);
		Assert.Equal(4, stats.ElementCount);
	}

	[Fact]
	public void GetStatistics_CalculatesActionsByType() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var stats = editor.GetStatistics();

		Assert.True(stats.ActionsByType.ContainsKey(BattleSystemEditor.ActionType.Attack));
		Assert.True(stats.ActionsByType.ContainsKey(BattleSystemEditor.ActionType.Spell));
	}

	[Fact]
	public void GetStatistics_CalculatesAverages() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var stats = editor.GetStatistics();

		Assert.True(stats.AverageActionPower > 0);
		Assert.True(stats.AverageActionAccuracy > 0);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportToJson_ReturnsValidJson() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var json = editor.ExportToJson();

		Assert.Contains("Formulas", json);
		Assert.Contains("Actions", json);
		Assert.Contains("StatusEffects", json);
		Assert.Contains("Elements", json);
	}

	[Fact]
	public void ExportFormulasToJson_ReturnsValidJson() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var json = editor.ExportFormulasToJson();

		Assert.Contains("BaseMultiplier", json);
		Assert.Contains("Physical", json);  // FormulaType as string
	}

	[Fact]
	public void ExportActionsToJson_ReturnsValidJson() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		var json = editor.ExportActionsToJson();

		Assert.Contains("Power", json);
		Assert.Contains("Accuracy", json);
		Assert.Contains("Attack", json);  // ActionType as string
	}

	#endregion

	#region Integration Tests

	[Fact]
	public void RoundTrip_LoadSaveLoad_PreservesData() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		// Modify something
		var action = editor.GetAction(0);
		Assert.NotNull(action);
		action.Power = 123;
		editor.UpdateAction(action);

		// Save and reload
		var savedData = editor.SaveToData();
		var editor2 = new BattleSystemEditor(savedData);
		editor2.SetSchema(editor.Schema!);
		editor2.LoadAll();

		// Verify preserved
		Assert.Equal(123, editor2.Actions[0].Power);
	}

	[Fact]
	public void FullBattleCalculation_Works() {
		var editor = CreateEditorWithSchema();
		editor.LoadAll();

		// Simulate a Fire spell attack
		var fireSpell = editor.GetAction(1);  // Fire spell
		Assert.NotNull(fireSpell);

		int baseDamage = editor.CalculateActionDamage(1, 80, 30, 10, 0);

		// Fire vs Ice gives 150% damage
		int elementModifier = editor.GetElementalDamageModifier(fireSpell.ElementId, 1);
		int finalDamage = baseDamage * elementModifier / 100;

		Assert.True(finalDamage > baseDamage);
	}

	#endregion
}
