using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Service for editing battle system data including formulas, configurations, and battle mechanics.
/// Supports RPG battle systems from NES, SNES, GB, and GBA games.
/// </summary>
public class BattleSystemEditor {
	private readonly byte[] _data;
	private BattleSchema? _schema;
	private readonly List<DamageFormula> _damageFormulas = [];
	private readonly List<BattleAction> _actions = [];
	private readonly List<StatusEffect> _statusEffects = [];
	private readonly List<ElementType> _elements = [];
	private readonly List<BattleConfig> _configs = [];

	/// <summary>
	/// Creates a new BattleSystemEditor with the specified ROM data.
	/// </summary>
	public BattleSystemEditor(byte[] data) {
		_data = data ?? throw new ArgumentNullException(nameof(data));
	}

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public BattleSchema? Schema => _schema;

	/// <summary>
	/// Gets the loaded damage formulas.
	/// </summary>
	public IReadOnlyList<DamageFormula> DamageFormulas => _damageFormulas;

	/// <summary>
	/// Gets the loaded battle actions.
	/// </summary>
	public IReadOnlyList<BattleAction> Actions => _actions;

	/// <summary>
	/// Gets the loaded status effects.
	/// </summary>
	public IReadOnlyList<StatusEffect> StatusEffects => _statusEffects;

	/// <summary>
	/// Gets the loaded element types.
	/// </summary>
	public IReadOnlyList<ElementType> Elements => _elements;

	/// <summary>
	/// Gets the loaded battle configurations.
	/// </summary>
	public IReadOnlyList<BattleConfig> Configs => _configs;

	#region Data Classes

	/// <summary>
	/// Schema for battle system data layout.
	/// </summary>
	public class BattleSchema {
		public string Name { get; set; } = "";
		public int DamageFormulaTableOffset { get; set; } = -1;
		public int DamageFormulaCount { get; set; }
		public int DamageFormulaSize { get; set; } = 8;
		public int ActionTableOffset { get; set; } = -1;
		public int ActionCount { get; set; }
		public int ActionSize { get; set; } = 8;
		public int StatusEffectTableOffset { get; set; } = -1;
		public int StatusEffectCount { get; set; }
		public int StatusEffectSize { get; set; } = 4;
		public int ElementTableOffset { get; set; } = -1;
		public int ElementCount { get; set; }
		public int ElementSize { get; set; } = 2;
		public int BattleConfigOffset { get; set; } = -1;
		public int BattleConfigSize { get; set; } = 16;
		public int CriticalHitRateOffset { get; set; } = -1;
		public int ExpFormulaOffset { get; set; } = -1;
		public int GoldFormulaOffset { get; set; } = -1;
		public bool HasElementalSystem { get; set; } = true;
		public bool HasStatusSystem { get; set; } = true;
	}

	/// <summary>
	/// Represents a damage calculation formula.
	/// </summary>
	public class DamageFormula {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public FormulaType Type { get; set; } = FormulaType.Physical;
		public int BaseMultiplier { get; set; } = 100;
		public int StatWeight { get; set; } = 50;
		public int DefenseWeight { get; set; } = 50;
		public int RandomVariance { get; set; } = 16;
		public int ElementId { get; set; }
		public int Flags { get; set; }
		public int RomOffset { get; set; }

		/// <summary>
		/// Calculates damage using this formula.
		/// </summary>
		public int CalculateDamage(int attack, int defense, int level = 1, int random = 0) {
			// Basic damage formula: (Attack * Multiplier / 100 - Defense * DefWeight / 100) * (100 + random) / 100
			int baseDamage = (attack * BaseMultiplier / 100) - (defense * DefenseWeight / 100);
			int variance = random % (RandomVariance + 1);
			int finalDamage = baseDamage * (100 + variance) / 100;
			return Math.Max(1, finalDamage);
		}
	}

	/// <summary>
	/// Types of damage formulas.
	/// </summary>
	public enum FormulaType {
		Physical,
		Magical,
		FixedDamage,
		PercentDamage,
		Healing,
		Drain,
		Custom
	}

	/// <summary>
	/// Represents a battle action (attack, spell, item use, etc.).
	/// </summary>
	public class BattleAction {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public ActionType Type { get; set; } = ActionType.Attack;
		public int Power { get; set; }
		public int Accuracy { get; set; } = 100;
		public int MpCost { get; set; }
		public int FormulaId { get; set; }
		public int ElementId { get; set; }
		public int StatusEffectId { get; set; }
		public int StatusChance { get; set; }
		public TargetType Target { get; set; } = TargetType.SingleEnemy;
		public int AnimationId { get; set; }
		public int SoundId { get; set; }
		public int Priority { get; set; }
		public int Flags { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// Types of battle actions.
	/// </summary>
	public enum ActionType {
		Attack,
		Spell,
		Skill,
		Item,
		Defend,
		Escape,
		Special
	}

	/// <summary>
	/// Target types for battle actions.
	/// </summary>
	public enum TargetType {
		Self,
		SingleAlly,
		AllAllies,
		SingleEnemy,
		AllEnemies,
		All,
		Random
	}

	/// <summary>
	/// Represents a status effect (poison, sleep, etc.).
	/// </summary>
	public class StatusEffect {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public StatusCategory Category { get; set; } = StatusCategory.Debuff;
		public int Duration { get; set; }
		public int TickDamage { get; set; }
		public int StatModifier { get; set; }
		public StatusFlags Flags { get; set; }
		public int CureItemId { get; set; }
		public int IconId { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// Categories of status effects.
	/// </summary>
	public enum StatusCategory {
		Buff,
		Debuff,
		Ailment,
		Instant,
		Persistent
	}

	/// <summary>
	/// Flags for status effect behavior.
	/// </summary>
	[Flags]
	public enum StatusFlags {
		None = 0,
		CannotAct = 1,
		CannotMove = 2,
		TakesDamageOverTime = 4,
		RemoveOnDamage = 8,
		RemoveAfterBattle = 16,
		Stackable = 32,
		CuresOnRest = 64,
		PersistsOnDeath = 128
	}

	/// <summary>
	/// Represents an element type (fire, ice, etc.).
	/// </summary>
	public class ElementType {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int OpposingElementId { get; set; } = -1;
		public int BonusDamagePercent { get; set; } = 50;
		public int ResistanceReduction { get; set; } = 50;
		public int IconId { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// Battle system configuration values.
	/// </summary>
	public class BattleConfig {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int Value { get; set; }
		public int MinValue { get; set; }
		public int MaxValue { get; set; } = 255;
		public string Description { get; set; } = "";
		public int RomOffset { get; set; }
	}

	#endregion

	#region Schema Methods

	/// <summary>
	/// Sets the schema for reading battle data.
	/// </summary>
	public void SetSchema(BattleSchema schema) {
		_schema = schema ?? throw new ArgumentNullException(nameof(schema));
		_damageFormulas.Clear();
		_actions.Clear();
		_statusEffects.Clear();
		_elements.Clear();
		_configs.Clear();
	}

	/// <summary>
	/// Creates a schema for Dragon Quest NES-style battle systems.
	/// </summary>
	public static BattleSchema CreateDragonQuestNesSchema(
		int damageFormulaOffset,
		int actionOffset,
		int statusOffset) {
		return new BattleSchema {
			Name = "Dragon Quest NES",
			DamageFormulaTableOffset = damageFormulaOffset,
			DamageFormulaCount = 8,
			DamageFormulaSize = 4,
			ActionTableOffset = actionOffset,
			ActionCount = 64,
			ActionSize = 6,
			StatusEffectTableOffset = statusOffset,
			StatusEffectCount = 8,
			StatusEffectSize = 2,
			HasElementalSystem = false,
			HasStatusSystem = true
		};
	}

	/// <summary>
	/// Creates a schema for Final Fantasy NES-style battle systems.
	/// </summary>
	public static BattleSchema CreateFinalFantasyNesSchema(
		int damageFormulaOffset,
		int actionOffset,
		int statusOffset,
		int elementOffset) {
		return new BattleSchema {
			Name = "Final Fantasy NES",
			DamageFormulaTableOffset = damageFormulaOffset,
			DamageFormulaCount = 16,
			DamageFormulaSize = 8,
			ActionTableOffset = actionOffset,
			ActionCount = 128,
			ActionSize = 8,
			StatusEffectTableOffset = statusOffset,
			StatusEffectCount = 16,
			StatusEffectSize = 4,
			ElementTableOffset = elementOffset,
			ElementCount = 8,
			ElementSize = 2,
			HasElementalSystem = true,
			HasStatusSystem = true
		};
	}

	/// <summary>
	/// Creates a schema for SNES RPG battle systems.
	/// </summary>
	public static BattleSchema CreateSnesRpgSchema(
		int damageFormulaOffset,
		int actionOffset,
		int statusOffset,
		int elementOffset) {
		return new BattleSchema {
			Name = "SNES RPG",
			DamageFormulaTableOffset = damageFormulaOffset,
			DamageFormulaCount = 32,
			DamageFormulaSize = 12,
			ActionTableOffset = actionOffset,
			ActionCount = 256,
			ActionSize = 14,
			StatusEffectTableOffset = statusOffset,
			StatusEffectCount = 32,
			StatusEffectSize = 8,
			ElementTableOffset = elementOffset,
			ElementCount = 16,
			ElementSize = 4,
			HasElementalSystem = true,
			HasStatusSystem = true
		};
	}

	#endregion

	#region Load Methods

	/// <summary>
	/// Loads all battle data from ROM.
	/// </summary>
	public void LoadAll() {
		if (_schema == null) {
			throw new InvalidOperationException("Schema must be set before loading data");
		}

		LoadDamageFormulas();
		LoadActions();
		if (_schema.HasStatusSystem) {
			LoadStatusEffects();
		}
		if (_schema.HasElementalSystem) {
			LoadElements();
		}
	}

	/// <summary>
	/// Loads damage formulas from ROM.
	/// </summary>
	public void LoadDamageFormulas() {
		if (_schema == null || _schema.DamageFormulaTableOffset < 0) return;

		_damageFormulas.Clear();
		int offset = _schema.DamageFormulaTableOffset;

		for (int i = 0; i < _schema.DamageFormulaCount; i++) {
			if (offset + _schema.DamageFormulaSize > _data.Length) break;

			var formula = new DamageFormula {
				Id = i,
				Name = $"Formula #{i}",
				RomOffset = offset
			};

			// Read formula data based on size
			if (_schema.DamageFormulaSize >= 1) {
				formula.Type = (FormulaType)(_data[offset] & 0x07);
				formula.Flags = _data[offset] >> 3;
			}
			if (_schema.DamageFormulaSize >= 2) {
				formula.BaseMultiplier = _data[offset + 1];
			}
			if (_schema.DamageFormulaSize >= 3) {
				formula.StatWeight = _data[offset + 2];
			}
			if (_schema.DamageFormulaSize >= 4) {
				formula.DefenseWeight = _data[offset + 3];
			}
			if (_schema.DamageFormulaSize >= 5) {
				formula.RandomVariance = _data[offset + 4];
			}
			if (_schema.DamageFormulaSize >= 6) {
				formula.ElementId = _data[offset + 5];
			}

			_damageFormulas.Add(formula);
			offset += _schema.DamageFormulaSize;
		}
	}

	/// <summary>
	/// Loads battle actions from ROM.
	/// </summary>
	public void LoadActions() {
		if (_schema == null || _schema.ActionTableOffset < 0) return;

		_actions.Clear();
		int offset = _schema.ActionTableOffset;

		for (int i = 0; i < _schema.ActionCount; i++) {
			if (offset + _schema.ActionSize > _data.Length) break;

			var action = new BattleAction {
				Id = i,
				Name = $"Action #{i}",
				RomOffset = offset
			};

			// Read action data based on size
			if (_schema.ActionSize >= 1) {
				action.Type = (ActionType)(_data[offset] & 0x07);
				action.Target = (TargetType)((_data[offset] >> 3) & 0x07);
			}
			if (_schema.ActionSize >= 2) {
				action.Power = _data[offset + 1];
			}
			if (_schema.ActionSize >= 3) {
				action.Accuracy = _data[offset + 2];
			}
			if (_schema.ActionSize >= 4) {
				action.MpCost = _data[offset + 3];
			}
			if (_schema.ActionSize >= 5) {
				action.FormulaId = _data[offset + 4];
			}
			if (_schema.ActionSize >= 6) {
				action.ElementId = _data[offset + 5];
			}
			if (_schema.ActionSize >= 7) {
				action.StatusEffectId = _data[offset + 6];
			}
			if (_schema.ActionSize >= 8) {
				action.StatusChance = _data[offset + 7];
			}

			_actions.Add(action);
			offset += _schema.ActionSize;
		}
	}

	/// <summary>
	/// Loads status effects from ROM.
	/// </summary>
	public void LoadStatusEffects() {
		if (_schema == null || _schema.StatusEffectTableOffset < 0) return;

		_statusEffects.Clear();
		int offset = _schema.StatusEffectTableOffset;

		for (int i = 0; i < _schema.StatusEffectCount; i++) {
			if (offset + _schema.StatusEffectSize > _data.Length) break;

			var status = new StatusEffect {
				Id = i,
				Name = GetDefaultStatusName(i),
				RomOffset = offset
			};

			// Read status data based on size
			if (_schema.StatusEffectSize >= 1) {
				status.Category = (StatusCategory)(_data[offset] & 0x07);
				status.Flags = (StatusFlags)(_data[offset] & 0xf8);
			}
			if (_schema.StatusEffectSize >= 2) {
				status.Duration = _data[offset + 1];
			}
			if (_schema.StatusEffectSize >= 3) {
				status.TickDamage = _data[offset + 2];
			}
			if (_schema.StatusEffectSize >= 4) {
				status.StatModifier = _data[offset + 3];
			}

			_statusEffects.Add(status);
			offset += _schema.StatusEffectSize;
		}
	}

	/// <summary>
	/// Loads element types from ROM.
	/// </summary>
	public void LoadElements() {
		if (_schema == null || _schema.ElementTableOffset < 0) return;

		_elements.Clear();
		int offset = _schema.ElementTableOffset;

		for (int i = 0; i < _schema.ElementCount; i++) {
			if (offset + _schema.ElementSize > _data.Length) break;

			var element = new ElementType {
				Id = i,
				Name = GetDefaultElementName(i),
				RomOffset = offset
			};

			// Read element data based on size
			if (_schema.ElementSize >= 1) {
				element.OpposingElementId = _data[offset] & 0x0f;
			}
			if (_schema.ElementSize >= 2) {
				element.BonusDamagePercent = _data[offset + 1];
			}

			_elements.Add(element);
			offset += _schema.ElementSize;
		}
	}

	private static string GetDefaultStatusName(int id) {
		return id switch {
			0 => "Poison",
			1 => "Sleep",
			2 => "Confusion",
			3 => "Paralysis",
			4 => "Silence",
			5 => "Blind",
			6 => "Stone",
			7 => "Death",
			_ => $"Status #{id}"
		};
	}

	private static string GetDefaultElementName(int id) {
		return id switch {
			0 => "Fire",
			1 => "Ice",
			2 => "Thunder",
			3 => "Wind",
			4 => "Earth",
			5 => "Water",
			6 => "Holy",
			7 => "Dark",
			_ => $"Element #{id}"
		};
	}

	#endregion

	#region Get Methods

	/// <summary>
	/// Gets a damage formula by ID.
	/// </summary>
	public DamageFormula? GetFormula(int id) {
		return _damageFormulas.FirstOrDefault(f => f.Id == id);
	}

	/// <summary>
	/// Gets a battle action by ID.
	/// </summary>
	public BattleAction? GetAction(int id) {
		return _actions.FirstOrDefault(a => a.Id == id);
	}

	/// <summary>
	/// Gets a status effect by ID.
	/// </summary>
	public StatusEffect? GetStatusEffect(int id) {
		return _statusEffects.FirstOrDefault(s => s.Id == id);
	}

	/// <summary>
	/// Gets an element type by ID.
	/// </summary>
	public ElementType? GetElement(int id) {
		return _elements.FirstOrDefault(e => e.Id == id);
	}

	/// <summary>
	/// Gets actions by type.
	/// </summary>
	public List<BattleAction> GetActionsByType(ActionType type) {
		return _actions.Where(a => a.Type == type).ToList();
	}

	/// <summary>
	/// Gets actions by element.
	/// </summary>
	public List<BattleAction> GetActionsByElement(int elementId) {
		return _actions.Where(a => a.ElementId == elementId).ToList();
	}

	/// <summary>
	/// Gets actions that inflict a status.
	/// </summary>
	public List<BattleAction> GetActionsWithStatus(int statusId) {
		return _actions.Where(a => a.StatusEffectId == statusId && a.StatusChance > 0).ToList();
	}

	#endregion

	#region Update Methods

	/// <summary>
	/// Updates a damage formula.
	/// </summary>
	public bool UpdateFormula(DamageFormula formula) {
		if (_schema == null) return false;

		var existing = _damageFormulas.FirstOrDefault(f => f.Id == formula.Id);
		if (existing == null) return false;

		// Update in-memory
		int index = _damageFormulas.IndexOf(existing);
		_damageFormulas[index] = formula;
		formula.RomOffset = existing.RomOffset;

		return true;
	}

	/// <summary>
	/// Updates a battle action.
	/// </summary>
	public bool UpdateAction(BattleAction action) {
		if (_schema == null) return false;

		var existing = _actions.FirstOrDefault(a => a.Id == action.Id);
		if (existing == null) return false;

		int index = _actions.IndexOf(existing);
		_actions[index] = action;
		action.RomOffset = existing.RomOffset;

		return true;
	}

	/// <summary>
	/// Updates a status effect.
	/// </summary>
	public bool UpdateStatusEffect(StatusEffect status) {
		if (_schema == null) return false;

		var existing = _statusEffects.FirstOrDefault(s => s.Id == status.Id);
		if (existing == null) return false;

		int index = _statusEffects.IndexOf(existing);
		_statusEffects[index] = status;
		status.RomOffset = existing.RomOffset;

		return true;
	}

	/// <summary>
	/// Updates an element type.
	/// </summary>
	public bool UpdateElement(ElementType element) {
		if (_schema == null) return false;

		var existing = _elements.FirstOrDefault(e => e.Id == element.Id);
		if (existing == null) return false;

		int index = _elements.IndexOf(existing);
		_elements[index] = element;
		element.RomOffset = existing.RomOffset;

		return true;
	}

	#endregion

	#region Save Methods

	/// <summary>
	/// Saves all battle data back to ROM bytes.
	/// </summary>
	public byte[] SaveToData() {
		var output = new byte[_data.Length];
		Array.Copy(_data, output, _data.Length);

		SaveDamageFormulas(output);
		SaveActions(output);
		SaveStatusEffects(output);
		SaveElements(output);

		return output;
	}

	private void SaveDamageFormulas(byte[] output) {
		if (_schema == null || _schema.DamageFormulaTableOffset < 0) return;

		foreach (var formula in _damageFormulas) {
			int offset = formula.RomOffset;
			if (offset < 0 || offset + _schema.DamageFormulaSize > output.Length) continue;

			if (_schema.DamageFormulaSize >= 1) {
				output[offset] = (byte)(((int)formula.Type & 0x07) | (formula.Flags << 3));
			}
			if (_schema.DamageFormulaSize >= 2) {
				output[offset + 1] = (byte)formula.BaseMultiplier;
			}
			if (_schema.DamageFormulaSize >= 3) {
				output[offset + 2] = (byte)formula.StatWeight;
			}
			if (_schema.DamageFormulaSize >= 4) {
				output[offset + 3] = (byte)formula.DefenseWeight;
			}
			if (_schema.DamageFormulaSize >= 5) {
				output[offset + 4] = (byte)formula.RandomVariance;
			}
			if (_schema.DamageFormulaSize >= 6) {
				output[offset + 5] = (byte)formula.ElementId;
			}
		}
	}

	private void SaveActions(byte[] output) {
		if (_schema == null || _schema.ActionTableOffset < 0) return;

		foreach (var action in _actions) {
			int offset = action.RomOffset;
			if (offset < 0 || offset + _schema.ActionSize > output.Length) continue;

			if (_schema.ActionSize >= 1) {
				output[offset] = (byte)((int)action.Type | ((int)action.Target << 3));
			}
			if (_schema.ActionSize >= 2) {
				output[offset + 1] = (byte)action.Power;
			}
			if (_schema.ActionSize >= 3) {
				output[offset + 2] = (byte)action.Accuracy;
			}
			if (_schema.ActionSize >= 4) {
				output[offset + 3] = (byte)action.MpCost;
			}
			if (_schema.ActionSize >= 5) {
				output[offset + 4] = (byte)action.FormulaId;
			}
			if (_schema.ActionSize >= 6) {
				output[offset + 5] = (byte)action.ElementId;
			}
			if (_schema.ActionSize >= 7) {
				output[offset + 6] = (byte)action.StatusEffectId;
			}
			if (_schema.ActionSize >= 8) {
				output[offset + 7] = (byte)action.StatusChance;
			}
		}
	}

	private void SaveStatusEffects(byte[] output) {
		if (_schema == null || _schema.StatusEffectTableOffset < 0) return;

		foreach (var status in _statusEffects) {
			int offset = status.RomOffset;
			if (offset < 0 || offset + _schema.StatusEffectSize > output.Length) continue;

			if (_schema.StatusEffectSize >= 1) {
				output[offset] = (byte)(((int)status.Category & 0x07) | ((int)status.Flags & 0xf8));
			}
			if (_schema.StatusEffectSize >= 2) {
				output[offset + 1] = (byte)status.Duration;
			}
			if (_schema.StatusEffectSize >= 3) {
				output[offset + 2] = (byte)status.TickDamage;
			}
			if (_schema.StatusEffectSize >= 4) {
				output[offset + 3] = (byte)status.StatModifier;
			}
		}
	}

	private void SaveElements(byte[] output) {
		if (_schema == null || _schema.ElementTableOffset < 0) return;

		foreach (var element in _elements) {
			int offset = element.RomOffset;
			if (offset < 0 || offset + _schema.ElementSize > output.Length) continue;

			if (_schema.ElementSize >= 1) {
				output[offset] = (byte)(element.OpposingElementId & 0x0f);
			}
			if (_schema.ElementSize >= 2) {
				output[offset + 1] = (byte)element.BonusDamagePercent;
			}
		}
	}

	#endregion

	#region Analysis Methods

	/// <summary>
	/// Calculates damage for an action.
	/// </summary>
	public int CalculateActionDamage(int actionId, int attackStat, int defenseStat, int level = 1, int randomValue = 0) {
		var action = GetAction(actionId);
		if (action == null) return 0;

		var formula = GetFormula(action.FormulaId);
		if (formula == null) {
			// Simple fallback formula
			return Math.Max(1, action.Power - defenseStat / 2);
		}

		return formula.CalculateDamage(attackStat * action.Power / 100, defenseStat, level, randomValue);
	}

	/// <summary>
	/// Checks elemental effectiveness.
	/// </summary>
	public int GetElementalDamageModifier(int attackElementId, int defenseElementId) {
		var attackElement = GetElement(attackElementId);
		var defenseElement = GetElement(defenseElementId);

		if (attackElement == null || defenseElement == null) return 100;

		// Check if attacking with opposing element
		if (attackElement.OpposingElementId == defenseElementId) {
			return 100 + attackElement.BonusDamagePercent;
		}

		// Check if defending with opposing element
		if (defenseElement.OpposingElementId == attackElementId) {
			return 100 - defenseElement.ResistanceReduction;
		}

		return 100;
	}

	/// <summary>
	/// Gets battle statistics.
	/// </summary>
	public BattleStatistics GetStatistics() {
		var actionsByType = _actions.GroupBy(a => a.Type)
			.ToDictionary(g => g.Key, g => g.Count());

		var actionsByElement = _actions.Where(a => a.ElementId >= 0)
			.GroupBy(a => a.ElementId)
			.ToDictionary(g => g.Key, g => g.Count());

		return new BattleStatistics(
			FormulaCount: _damageFormulas.Count,
			ActionCount: _actions.Count,
			StatusEffectCount: _statusEffects.Count,
			ElementCount: _elements.Count,
			ActionsByType: actionsByType,
			ActionsByElement: actionsByElement,
			AverageActionPower: _actions.Any() ? _actions.Average(a => a.Power) : 0,
			AverageActionAccuracy: _actions.Any() ? _actions.Average(a => a.Accuracy) : 0
		);
	}

	/// <summary>
	/// Statistics about the battle system.
	/// </summary>
	public record BattleStatistics(
		int FormulaCount,
		int ActionCount,
		int StatusEffectCount,
		int ElementCount,
		Dictionary<ActionType, int> ActionsByType,
		Dictionary<int, int> ActionsByElement,
		double AverageActionPower,
		double AverageActionAccuracy
	);

	#endregion

	#region Export Methods

	/// <summary>
	/// Exports all battle data to JSON.
	/// </summary>
	public string ExportToJson() {
		var data = new {
			Formulas = _damageFormulas,
			Actions = _actions,
			StatusEffects = _statusEffects,
			Elements = _elements
		};

		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Exports damage formulas to JSON.
	/// </summary>
	public string ExportFormulasToJson() {
		return JsonSerializer.Serialize(_damageFormulas, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Exports actions to JSON.
	/// </summary>
	public string ExportActionsToJson() {
		return JsonSerializer.Serialize(_actions, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	#endregion
}
