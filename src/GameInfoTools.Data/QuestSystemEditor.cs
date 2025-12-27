using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Service for editing quest/event system data in RPGs.
/// Handles quest definitions, objectives, rewards, triggers, and state management.
/// </summary>
public class QuestSystemEditor {
	private readonly Dictionary<string, Quest> _quests = [];
	private readonly Dictionary<string, QuestChain> _chains = [];
	private readonly Dictionary<string, QuestTrigger> _triggers = [];
	private readonly List<QuestVariable> _variables = [];

	/// <summary>
	/// Current schema configuration.
	/// </summary>
	public QuestSystemSchema Schema { get; private set; } = new();

	/// <summary>
	/// All loaded quests.
	/// </summary>
	public IReadOnlyDictionary<string, Quest> Quests => _quests;

	/// <summary>
	/// All quest chains.
	/// </summary>
	public IReadOnlyDictionary<string, QuestChain> Chains => _chains;

	/// <summary>
	/// All quest triggers.
	/// </summary>
	public IReadOnlyDictionary<string, QuestTrigger> Triggers => _triggers;

	/// <summary>
	/// Quest system variables.
	/// </summary>
	public IReadOnlyList<QuestVariable> Variables => _variables;

	#region Quest Management

	/// <summary>
	/// Add a new quest.
	/// </summary>
	public void AddQuest(Quest quest) {
		ArgumentNullException.ThrowIfNull(quest);
		if (string.IsNullOrEmpty(quest.Id))
			throw new ArgumentException("Quest ID is required");

		_quests[quest.Id] = quest;
	}

	/// <summary>
	/// Remove a quest.
	/// </summary>
	public bool RemoveQuest(string questId) {
		return _quests.Remove(questId);
	}

	/// <summary>
	/// Get a quest by ID.
	/// </summary>
	public Quest? GetQuest(string questId) {
		return _quests.GetValueOrDefault(questId);
	}

	/// <summary>
	/// Update a quest.
	/// </summary>
	public void UpdateQuest(Quest quest) {
		ArgumentNullException.ThrowIfNull(quest);
		if (!_quests.ContainsKey(quest.Id))
			throw new KeyNotFoundException($"Quest '{quest.Id}' not found");

		_quests[quest.Id] = quest;
	}

	/// <summary>
	/// Get quests by type.
	/// </summary>
	public IEnumerable<Quest> GetQuestsByType(QuestType type) {
		return _quests.Values.Where(q => q.Type == type);
	}

	/// <summary>
	/// Get quests by category.
	/// </summary>
	public IEnumerable<Quest> GetQuestsByCategory(string category) {
		return _quests.Values.Where(q =>
			string.Equals(q.Category, category, StringComparison.OrdinalIgnoreCase));
	}

	/// <summary>
	/// Search quests by name or description.
	/// </summary>
	public IEnumerable<Quest> SearchQuests(string searchTerm, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _quests.Values.Where(q =>
			q.Name.Contains(searchTerm, comparison) ||
			(q.Description?.Contains(searchTerm, comparison) ?? false));
	}

	#endregion

	#region Objective Management

	/// <summary>
	/// Add an objective to a quest.
	/// </summary>
	public void AddObjective(string questId, QuestObjective objective) {
		var quest = GetQuest(questId)
			?? throw new KeyNotFoundException($"Quest '{questId}' not found");

		var objectives = quest.Objectives.ToList();
		objectives.Add(objective);

		_quests[questId] = quest with { Objectives = objectives };
	}

	/// <summary>
	/// Remove an objective from a quest.
	/// </summary>
	public bool RemoveObjective(string questId, string objectiveId) {
		var quest = GetQuest(questId);
		if (quest == null) return false;

		var objectives = quest.Objectives.Where(o => o.Id != objectiveId).ToList();
		if (objectives.Count == quest.Objectives.Count) return false;

		_quests[questId] = quest with { Objectives = objectives };
		return true;
	}

	/// <summary>
	/// Update an objective.
	/// </summary>
	public void UpdateObjective(string questId, QuestObjective objective) {
		var quest = GetQuest(questId)
			?? throw new KeyNotFoundException($"Quest '{questId}' not found");

		var objectives = quest.Objectives.ToList();
		var index = objectives.FindIndex(o => o.Id == objective.Id);
		if (index < 0)
			throw new KeyNotFoundException($"Objective '{objective.Id}' not found in quest '{questId}'");

		objectives[index] = objective;
		_quests[questId] = quest with { Objectives = objectives };
	}

	/// <summary>
	/// Reorder objectives in a quest.
	/// </summary>
	public void ReorderObjectives(string questId, IEnumerable<string> objectiveIds) {
		var quest = GetQuest(questId)
			?? throw new KeyNotFoundException($"Quest '{questId}' not found");

		var idList = objectiveIds.ToList();
		var objectives = new List<QuestObjective>();

		foreach (var id in idList) {
			var obj = quest.Objectives.FirstOrDefault(o => o.Id == id);
			if (obj != null) objectives.Add(obj);
		}

		// Add any objectives not in the list at the end
		foreach (var obj in quest.Objectives.Where(o => !idList.Contains(o.Id))) {
			objectives.Add(obj);
		}

		_quests[questId] = quest with { Objectives = objectives };
	}

	#endregion

	#region Reward Management

	/// <summary>
	/// Add a reward to a quest.
	/// </summary>
	public void AddReward(string questId, QuestReward reward) {
		var quest = GetQuest(questId)
			?? throw new KeyNotFoundException($"Quest '{questId}' not found");

		var rewards = quest.Rewards.ToList();
		rewards.Add(reward);

		_quests[questId] = quest with { Rewards = rewards };
	}

	/// <summary>
	/// Remove a reward from a quest.
	/// </summary>
	public bool RemoveReward(string questId, int rewardIndex) {
		var quest = GetQuest(questId);
		if (quest == null) return false;
		if (rewardIndex < 0 || rewardIndex >= quest.Rewards.Count) return false;

		var rewards = quest.Rewards.ToList();
		rewards.RemoveAt(rewardIndex);

		_quests[questId] = quest with { Rewards = rewards };
		return true;
	}

	/// <summary>
	/// Set all rewards for a quest.
	/// </summary>
	public void SetRewards(string questId, IEnumerable<QuestReward> rewards) {
		var quest = GetQuest(questId)
			?? throw new KeyNotFoundException($"Quest '{questId}' not found");

		_quests[questId] = quest with { Rewards = rewards.ToList() };
	}

	#endregion

	#region Quest Chain Management

	/// <summary>
	/// Create a quest chain.
	/// </summary>
	public void CreateChain(QuestChain chain) {
		ArgumentNullException.ThrowIfNull(chain);
		if (string.IsNullOrEmpty(chain.Id))
			throw new ArgumentException("Chain ID is required");

		_chains[chain.Id] = chain;
	}

	/// <summary>
	/// Remove a quest chain.
	/// </summary>
	public bool RemoveChain(string chainId) {
		return _chains.Remove(chainId);
	}

	/// <summary>
	/// Get a quest chain.
	/// </summary>
	public QuestChain? GetChain(string chainId) {
		return _chains.GetValueOrDefault(chainId);
	}

	/// <summary>
	/// Add a quest to a chain.
	/// </summary>
	public void AddQuestToChain(string chainId, string questId, int? position = null) {
		var chain = GetChain(chainId)
			?? throw new KeyNotFoundException($"Chain '{chainId}' not found");

		if (!_quests.ContainsKey(questId))
			throw new KeyNotFoundException($"Quest '{questId}' not found");

		var quests = chain.QuestIds.ToList();
		if (position.HasValue && position.Value >= 0 && position.Value < quests.Count)
			quests.Insert(position.Value, questId);
		else
			quests.Add(questId);

		_chains[chainId] = chain with { QuestIds = quests };
	}

	/// <summary>
	/// Remove a quest from a chain.
	/// </summary>
	public bool RemoveQuestFromChain(string chainId, string questId) {
		var chain = GetChain(chainId);
		if (chain == null) return false;

		var quests = chain.QuestIds.Where(id => id != questId).ToList();
		if (quests.Count == chain.QuestIds.Count) return false;

		_chains[chainId] = chain with { QuestIds = quests };
		return true;
	}

	/// <summary>
	/// Get the chain containing a quest.
	/// </summary>
	public QuestChain? GetChainForQuest(string questId) {
		return _chains.Values.FirstOrDefault(c => c.QuestIds.Contains(questId));
	}

	#endregion

	#region Trigger Management

	/// <summary>
	/// Create a trigger.
	/// </summary>
	public void CreateTrigger(QuestTrigger trigger) {
		ArgumentNullException.ThrowIfNull(trigger);
		if (string.IsNullOrEmpty(trigger.Id))
			throw new ArgumentException("Trigger ID is required");

		_triggers[trigger.Id] = trigger;
	}

	/// <summary>
	/// Remove a trigger.
	/// </summary>
	public bool RemoveTrigger(string triggerId) {
		return _triggers.Remove(triggerId);
	}

	/// <summary>
	/// Get triggers for a quest.
	/// </summary>
	public IEnumerable<QuestTrigger> GetTriggersForQuest(string questId) {
		return _triggers.Values.Where(t => t.QuestId == questId);
	}

	/// <summary>
	/// Get triggers by type.
	/// </summary>
	public IEnumerable<QuestTrigger> GetTriggersByType(TriggerType type) {
		return _triggers.Values.Where(t => t.Type == type);
	}

	/// <summary>
	/// Link a trigger to a quest.
	/// </summary>
	public void LinkTriggerToQuest(string triggerId, string questId, TriggerAction action) {
		var trigger = _triggers.GetValueOrDefault(triggerId)
			?? throw new KeyNotFoundException($"Trigger '{triggerId}' not found");

		_triggers[triggerId] = trigger with { QuestId = questId, Action = action };
	}

	#endregion

	#region Variable Management

	/// <summary>
	/// Define a quest variable.
	/// </summary>
	public void DefineVariable(QuestVariable variable) {
		ArgumentNullException.ThrowIfNull(variable);
		if (string.IsNullOrEmpty(variable.Name))
			throw new ArgumentException("Variable name is required");

		var existing = _variables.FindIndex(v => v.Name == variable.Name);
		if (existing >= 0)
			_variables[existing] = variable;
		else
			_variables.Add(variable);
	}

	/// <summary>
	/// Remove a variable.
	/// </summary>
	public bool RemoveVariable(string name) {
		var index = _variables.FindIndex(v => v.Name == name);
		if (index < 0) return false;

		_variables.RemoveAt(index);
		return true;
	}

	/// <summary>
	/// Get a variable by name.
	/// </summary>
	public QuestVariable? GetVariable(string name) {
		return _variables.FirstOrDefault(v => v.Name == name);
	}

	#endregion

	#region Validation

	/// <summary>
	/// Validate the entire quest system.
	/// </summary>
	public QuestValidationResult Validate() {
		var errors = new List<QuestValidationError>();

		// Validate individual quests
		foreach (var quest in _quests.Values) {
			errors.AddRange(ValidateQuest(quest));
		}

		// Validate chains
		foreach (var chain in _chains.Values) {
			errors.AddRange(ValidateChain(chain));
		}

		// Validate triggers
		foreach (var trigger in _triggers.Values) {
			errors.AddRange(ValidateTrigger(trigger));
		}

		// Check for circular dependencies
		errors.AddRange(CheckCircularDependencies());

		return new QuestValidationResult {
			IsValid = errors.Count == 0,
			Errors = errors
		};
	}

	/// <summary>
	/// Validate a single quest.
	/// </summary>
	public IEnumerable<QuestValidationError> ValidateQuest(Quest quest) {
		var errors = new List<QuestValidationError>();

		if (string.IsNullOrEmpty(quest.Name))
			errors.Add(new QuestValidationError {
				QuestId = quest.Id,
				Type = ValidationErrorType.MissingRequired,
				Message = "Quest name is required"
			});

		// Check prerequisites exist
		foreach (var prereq in quest.Prerequisites) {
			if (!_quests.ContainsKey(prereq))
				errors.Add(new QuestValidationError {
					QuestId = quest.Id,
					Type = ValidationErrorType.InvalidReference,
					Message = $"Prerequisite quest '{prereq}' not found"
				});
		}

		// Validate objectives
		var objectiveIds = new HashSet<string>();
		foreach (var obj in quest.Objectives) {
			if (string.IsNullOrEmpty(obj.Id))
				errors.Add(new QuestValidationError {
					QuestId = quest.Id,
					Type = ValidationErrorType.MissingRequired,
					Message = "Objective ID is required"
				});
			else if (!objectiveIds.Add(obj.Id))
				errors.Add(new QuestValidationError {
					QuestId = quest.Id,
					Type = ValidationErrorType.DuplicateId,
					Message = $"Duplicate objective ID '{obj.Id}'"
				});
		}

		// Validate rewards against schema
		foreach (var reward in quest.Rewards) {
			if (reward.Type == RewardType.Item && Schema.ValidItemIds.Count > 0) {
				if (!Schema.ValidItemIds.Contains(reward.ItemId ?? ""))
					errors.Add(new QuestValidationError {
						QuestId = quest.Id,
						Type = ValidationErrorType.InvalidValue,
						Message = $"Invalid item ID '{reward.ItemId}' in reward"
					});
			}
		}

		return errors;
	}

	private IEnumerable<QuestValidationError> ValidateChain(QuestChain chain) {
		var errors = new List<QuestValidationError>();

		foreach (var questId in chain.QuestIds) {
			if (!_quests.ContainsKey(questId))
				errors.Add(new QuestValidationError {
					QuestId = questId,
					Type = ValidationErrorType.InvalidReference,
					Message = $"Quest '{questId}' in chain '{chain.Id}' not found"
				});
		}

		// Check for duplicates
		var duplicates = chain.QuestIds.GroupBy(id => id).Where(g => g.Count() > 1);
		foreach (var dup in duplicates) {
			errors.Add(new QuestValidationError {
				QuestId = dup.Key,
				Type = ValidationErrorType.DuplicateId,
				Message = $"Quest '{dup.Key}' appears multiple times in chain '{chain.Id}'"
			});
		}

		return errors;
	}

	private IEnumerable<QuestValidationError> ValidateTrigger(QuestTrigger trigger) {
		var errors = new List<QuestValidationError>();

		if (!string.IsNullOrEmpty(trigger.QuestId) && !_quests.ContainsKey(trigger.QuestId))
			errors.Add(new QuestValidationError {
				QuestId = trigger.QuestId,
				Type = ValidationErrorType.InvalidReference,
				Message = $"Trigger '{trigger.Id}' references unknown quest '{trigger.QuestId}'"
			});

		return errors;
	}

	private IEnumerable<QuestValidationError> CheckCircularDependencies() {
		var errors = new List<QuestValidationError>();
		var visited = new HashSet<string>();
		var stack = new HashSet<string>();

		foreach (var quest in _quests.Values) {
			if (HasCircularDependency(quest.Id, visited, stack, out var cycle)) {
				errors.Add(new QuestValidationError {
					QuestId = quest.Id,
					Type = ValidationErrorType.CircularDependency,
					Message = $"Circular dependency detected: {string.Join(" -> ", cycle)}"
				});
			}
		}

		return errors;
	}

	private bool HasCircularDependency(string questId, HashSet<string> visited, HashSet<string> stack, out List<string> cycle) {
		cycle = [];

		if (stack.Contains(questId)) {
			cycle.Add(questId);
			return true;
		}

		if (visited.Contains(questId))
			return false;

		visited.Add(questId);
		stack.Add(questId);

		var quest = GetQuest(questId);
		if (quest != null) {
			foreach (var prereq in quest.Prerequisites) {
				if (HasCircularDependency(prereq, visited, stack, out cycle)) {
					cycle.Insert(0, questId);
					return true;
				}
			}
		}

		stack.Remove(questId);
		return false;
	}

	#endregion

	#region Import/Export

	/// <summary>
	/// Export quest system to JSON.
	/// </summary>
	public async Task ExportToJsonAsync(string path) {
		var export = new QuestSystemExport {
			Schema = Schema,
			Quests = _quests.Values.ToList(),
			Chains = _chains.Values.ToList(),
			Triggers = _triggers.Values.ToList(),
			Variables = _variables.ToList()
		};

		var json = JsonSerializer.Serialize(export, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Import quest system from JSON.
	/// </summary>
	public async Task ImportFromJsonAsync(string path) {
		var json = await File.ReadAllTextAsync(path);
		var import = JsonSerializer.Deserialize<QuestSystemExport>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse quest system data");

		Schema = import.Schema ?? new QuestSystemSchema();

		_quests.Clear();
		foreach (var quest in import.Quests) {
			_quests[quest.Id] = quest;
		}

		_chains.Clear();
		foreach (var chain in import.Chains) {
			_chains[chain.Id] = chain;
		}

		_triggers.Clear();
		foreach (var trigger in import.Triggers) {
			_triggers[trigger.Id] = trigger;
		}

		_variables.Clear();
		_variables.AddRange(import.Variables);
	}

	/// <summary>
	/// Export to binary format for ROM injection.
	/// </summary>
	public byte[] ExportToBinary() {
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// Write header
		writer.Write((byte)0x51); // 'Q'
		writer.Write((byte)0x53); // 'S'
		writer.Write((byte)1);    // Version

		// Write quest count
		writer.Write((ushort)_quests.Count);

		// Write each quest
		foreach (var quest in _quests.Values) {
			WriteQuest(writer, quest);
		}

		// Write chain count
		writer.Write((ushort)_chains.Count);

		// Write each chain
		foreach (var chain in _chains.Values) {
			WriteChain(writer, chain);
		}

		return ms.ToArray();
	}

	/// <summary>
	/// Import from binary format.
	/// </summary>
	public void ImportFromBinary(byte[] data) {
		using var ms = new MemoryStream(data);
		using var reader = new BinaryReader(ms);

		// Read and verify header
		var q = reader.ReadByte();
		var s = reader.ReadByte();
		var version = reader.ReadByte();

		if (q != 0x51 || s != 0x53)
			throw new InvalidDataException("Invalid quest system binary format");

		_quests.Clear();
		_chains.Clear();

		// Read quests
		var questCount = reader.ReadUInt16();
		for (var i = 0; i < questCount; i++) {
			var quest = ReadQuest(reader);
			_quests[quest.Id] = quest;
		}

		// Read chains
		var chainCount = reader.ReadUInt16();
		for (var i = 0; i < chainCount; i++) {
			var chain = ReadChain(reader);
			_chains[chain.Id] = chain;
		}
	}

	private void WriteQuest(BinaryWriter writer, Quest quest) {
		WriteLengthPrefixedString(writer, quest.Id);
		WriteLengthPrefixedString(writer, quest.Name);
		WriteLengthPrefixedString(writer, quest.Description ?? "");
		writer.Write((byte)quest.Type);

		// Write objectives
		writer.Write((byte)quest.Objectives.Count);
		foreach (var obj in quest.Objectives) {
			WriteLengthPrefixedString(writer, obj.Id);
			WriteLengthPrefixedString(writer, obj.Description ?? "");
			writer.Write((byte)obj.Type);
			writer.Write(obj.TargetCount);
		}

		// Write rewards
		writer.Write((byte)quest.Rewards.Count);
		foreach (var reward in quest.Rewards) {
			writer.Write((byte)reward.Type);
			writer.Write(reward.Amount);
			WriteLengthPrefixedString(writer, reward.ItemId ?? "");
		}

		// Write prerequisites
		writer.Write((byte)quest.Prerequisites.Count);
		foreach (var prereq in quest.Prerequisites) {
			WriteLengthPrefixedString(writer, prereq);
		}
	}

	private Quest ReadQuest(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var description = ReadLengthPrefixedString(reader);
		var type = (QuestType)reader.ReadByte();

		// Read objectives
		var objectiveCount = reader.ReadByte();
		var objectives = new List<QuestObjective>();
		for (var i = 0; i < objectiveCount; i++) {
			objectives.Add(new QuestObjective {
				Id = ReadLengthPrefixedString(reader),
				Description = ReadLengthPrefixedString(reader),
				Type = (ObjectiveType)reader.ReadByte(),
				TargetCount = reader.ReadInt32()
			});
		}

		// Read rewards
		var rewardCount = reader.ReadByte();
		var rewards = new List<QuestReward>();
		for (var i = 0; i < rewardCount; i++) {
			rewards.Add(new QuestReward {
				Type = (RewardType)reader.ReadByte(),
				Amount = reader.ReadInt32(),
				ItemId = ReadLengthPrefixedString(reader)
			});
		}

		// Read prerequisites
		var prereqCount = reader.ReadByte();
		var prereqs = new List<string>();
		for (var i = 0; i < prereqCount; i++) {
			prereqs.Add(ReadLengthPrefixedString(reader));
		}

		return new Quest {
			Id = id,
			Name = name,
			Description = description,
			Type = type,
			Objectives = objectives,
			Rewards = rewards,
			Prerequisites = prereqs
		};
	}

	private void WriteChain(BinaryWriter writer, QuestChain chain) {
		WriteLengthPrefixedString(writer, chain.Id);
		WriteLengthPrefixedString(writer, chain.Name);
		writer.Write((byte)chain.QuestIds.Count);
		foreach (var questId in chain.QuestIds) {
			WriteLengthPrefixedString(writer, questId);
		}
	}

	private QuestChain ReadChain(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var questCount = reader.ReadByte();
		var quests = new List<string>();
		for (var i = 0; i < questCount; i++) {
			quests.Add(ReadLengthPrefixedString(reader));
		}

		return new QuestChain {
			Id = id,
			Name = name,
			QuestIds = quests
		};
	}

	private static void WriteLengthPrefixedString(BinaryWriter writer, string value) {
		var bytes = System.Text.Encoding.UTF8.GetBytes(value);
		writer.Write((byte)bytes.Length);
		writer.Write(bytes);
	}

	private static string ReadLengthPrefixedString(BinaryReader reader) {
		var length = reader.ReadByte();
		var bytes = reader.ReadBytes(length);
		return System.Text.Encoding.UTF8.GetString(bytes);
	}

	#endregion

	#region Statistics

	/// <summary>
	/// Get statistics about the quest system.
	/// </summary>
	public QuestSystemStats GetStatistics() {
		return new QuestSystemStats {
			TotalQuests = _quests.Count,
			TotalChains = _chains.Count,
			TotalTriggers = _triggers.Count,
			TotalVariables = _variables.Count,
			QuestsByType = _quests.Values
				.GroupBy(q => q.Type)
				.ToDictionary(g => g.Key, g => g.Count()),
			AverageObjectivesPerQuest = _quests.Count > 0
				? _quests.Values.Average(q => q.Objectives.Count)
				: 0,
			AverageRewardsPerQuest = _quests.Count > 0
				? _quests.Values.Average(q => q.Rewards.Count)
				: 0,
			QuestsWithPrerequisites = _quests.Values.Count(q => q.Prerequisites.Count > 0),
			OrphanedQuests = _quests.Values.Count(q =>
				!_chains.Values.Any(c => c.QuestIds.Contains(q.Id)) &&
				!_triggers.Values.Any(t => t.QuestId == q.Id))
		};
	}

	#endregion

	/// <summary>
	/// Clear all data.
	/// </summary>
	public void Clear() {
		_quests.Clear();
		_chains.Clear();
		_triggers.Clear();
		_variables.Clear();
		Schema = new QuestSystemSchema();
	}

	/// <summary>
	/// Set the schema configuration.
	/// </summary>
	public void SetSchema(QuestSystemSchema schema) {
		Schema = schema ?? new QuestSystemSchema();
	}

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};
}

#region Data Types

/// <summary>
/// Represents a quest/mission.
/// </summary>
public record Quest {
	/// <summary>Unique quest identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Quest description.</summary>
	public string? Description { get; init; }

	/// <summary>Quest type.</summary>
	public QuestType Type { get; init; } = QuestType.Main;

	/// <summary>Quest category (for grouping).</summary>
	public string? Category { get; init; }

	/// <summary>Quest objectives.</summary>
	public IReadOnlyList<QuestObjective> Objectives { get; init; } = [];

	/// <summary>Quest rewards.</summary>
	public IReadOnlyList<QuestReward> Rewards { get; init; } = [];

	/// <summary>Prerequisite quest IDs.</summary>
	public IReadOnlyList<string> Prerequisites { get; init; } = [];

	/// <summary>Minimum level required.</summary>
	public int MinLevel { get; init; }

	/// <summary>Whether quest is repeatable.</summary>
	public bool Repeatable { get; init; }

	/// <summary>Time limit in game ticks (0 = no limit).</summary>
	public int TimeLimit { get; init; }

	/// <summary>Custom metadata.</summary>
	public Dictionary<string, object>? Metadata { get; init; }
}

/// <summary>
/// Quest objective/goal.
/// </summary>
public record QuestObjective {
	/// <summary>Objective identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Objective description.</summary>
	public string? Description { get; init; }

	/// <summary>Objective type.</summary>
	public ObjectiveType Type { get; init; } = ObjectiveType.Custom;

	/// <summary>Target ID (enemy, item, location, etc.).</summary>
	public string? TargetId { get; init; }

	/// <summary>Required count.</summary>
	public int TargetCount { get; init; } = 1;

	/// <summary>Whether this objective is optional.</summary>
	public bool Optional { get; init; }

	/// <summary>Whether this objective is hidden until revealed.</summary>
	public bool Hidden { get; init; }

	/// <summary>Condition expression for custom objectives.</summary>
	public string? Condition { get; init; }
}

/// <summary>
/// Quest reward.
/// </summary>
public record QuestReward {
	/// <summary>Reward type.</summary>
	public RewardType Type { get; init; }

	/// <summary>Amount (gold, XP, etc.).</summary>
	public int Amount { get; init; }

	/// <summary>Item ID for item rewards.</summary>
	public string? ItemId { get; init; }

	/// <summary>Item quantity.</summary>
	public int Quantity { get; init; } = 1;

	/// <summary>Description.</summary>
	public string? Description { get; init; }
}

/// <summary>
/// Quest chain (series of related quests).
/// </summary>
public record QuestChain {
	/// <summary>Chain identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Chain name.</summary>
	public required string Name { get; init; }

	/// <summary>Chain description.</summary>
	public string? Description { get; init; }

	/// <summary>Quest IDs in order.</summary>
	public IReadOnlyList<string> QuestIds { get; init; } = [];
}

/// <summary>
/// Quest trigger (starts/updates quests based on events).
/// </summary>
public record QuestTrigger {
	/// <summary>Trigger identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Trigger type.</summary>
	public TriggerType Type { get; init; }

	/// <summary>Quest to affect.</summary>
	public string? QuestId { get; init; }

	/// <summary>Action to perform.</summary>
	public TriggerAction Action { get; init; }

	/// <summary>Location for location-based triggers.</summary>
	public string? LocationId { get; init; }

	/// <summary>NPC for NPC-based triggers.</summary>
	public string? NpcId { get; init; }

	/// <summary>Item for item-based triggers.</summary>
	public string? ItemId { get; init; }

	/// <summary>Condition expression.</summary>
	public string? Condition { get; init; }

	/// <summary>Whether trigger fires only once.</summary>
	public bool OneTime { get; init; } = true;
}

/// <summary>
/// Quest system variable.
/// </summary>
public record QuestVariable {
	/// <summary>Variable name.</summary>
	public required string Name { get; init; }

	/// <summary>Variable type.</summary>
	public VariableType Type { get; init; } = VariableType.Int;

	/// <summary>Default value.</summary>
	public object? DefaultValue { get; init; }

	/// <summary>Description.</summary>
	public string? Description { get; init; }
}

/// <summary>
/// Schema configuration for quest system.
/// </summary>
public record QuestSystemSchema {
	/// <summary>Valid item IDs (for validation).</summary>
	public HashSet<string> ValidItemIds { get; init; } = [];

	/// <summary>Valid location IDs.</summary>
	public HashSet<string> ValidLocationIds { get; init; } = [];

	/// <summary>Valid NPC IDs.</summary>
	public HashSet<string> ValidNpcIds { get; init; } = [];

	/// <summary>Valid enemy IDs.</summary>
	public HashSet<string> ValidEnemyIds { get; init; } = [];

	/// <summary>Maximum objectives per quest.</summary>
	public int MaxObjectivesPerQuest { get; init; } = 10;

	/// <summary>Maximum rewards per quest.</summary>
	public int MaxRewardsPerQuest { get; init; } = 5;
}

#endregion

#region Enums

/// <summary>
/// Quest type/category.
/// </summary>
public enum QuestType {
	/// <summary>Main story quest.</summary>
	Main,
	/// <summary>Side quest.</summary>
	Side,
	/// <summary>Recurring/daily quest.</summary>
	Daily,
	/// <summary>Event/seasonal quest.</summary>
	Event,
	/// <summary>Hidden/secret quest.</summary>
	Hidden,
	/// <summary>Tutorial quest.</summary>
	Tutorial,
	/// <summary>Guild/faction quest.</summary>
	Guild
}

/// <summary>
/// Objective type.
/// </summary>
public enum ObjectiveType {
	/// <summary>Kill/defeat enemies.</summary>
	Kill,
	/// <summary>Collect items.</summary>
	Collect,
	/// <summary>Deliver items.</summary>
	Deliver,
	/// <summary>Talk to NPC.</summary>
	Talk,
	/// <summary>Reach location.</summary>
	Reach,
	/// <summary>Escort NPC.</summary>
	Escort,
	/// <summary>Use item/ability.</summary>
	Use,
	/// <summary>Discover/explore.</summary>
	Discover,
	/// <summary>Custom condition.</summary>
	Custom
}

/// <summary>
/// Reward type.
/// </summary>
public enum RewardType {
	/// <summary>Experience points.</summary>
	Experience,
	/// <summary>Gold/currency.</summary>
	Gold,
	/// <summary>Item reward.</summary>
	Item,
	/// <summary>Reputation/fame.</summary>
	Reputation,
	/// <summary>Skill points.</summary>
	SkillPoints,
	/// <summary>Unlock feature.</summary>
	Unlock,
	/// <summary>Custom reward.</summary>
	Custom
}

/// <summary>
/// Trigger type.
/// </summary>
public enum TriggerType {
	/// <summary>Enter location.</summary>
	EnterLocation,
	/// <summary>Talk to NPC.</summary>
	TalkToNpc,
	/// <summary>Acquire item.</summary>
	AcquireItem,
	/// <summary>Kill enemy.</summary>
	KillEnemy,
	/// <summary>Level up.</summary>
	LevelUp,
	/// <summary>Complete quest.</summary>
	CompleteQuest,
	/// <summary>Time elapsed.</summary>
	TimeElapsed,
	/// <summary>Custom condition.</summary>
	Custom
}

/// <summary>
/// Trigger action.
/// </summary>
public enum TriggerAction {
	/// <summary>Start quest.</summary>
	Start,
	/// <summary>Update quest progress.</summary>
	Update,
	/// <summary>Complete quest.</summary>
	Complete,
	/// <summary>Fail quest.</summary>
	Fail,
	/// <summary>Reveal hidden objective.</summary>
	Reveal
}

/// <summary>
/// Variable type.
/// </summary>
public enum VariableType {
	/// <summary>Integer.</summary>
	Int,
	/// <summary>Boolean.</summary>
	Bool,
	/// <summary>String.</summary>
	String,
	/// <summary>Float.</summary>
	Float
}

/// <summary>
/// Validation error type.
/// </summary>
public enum ValidationErrorType {
	/// <summary>Missing required field.</summary>
	MissingRequired,
	/// <summary>Invalid reference to another entity.</summary>
	InvalidReference,
	/// <summary>Invalid value.</summary>
	InvalidValue,
	/// <summary>Duplicate ID.</summary>
	DuplicateId,
	/// <summary>Circular dependency.</summary>
	CircularDependency
}

#endregion

#region Result Types

/// <summary>
/// Quest validation error.
/// </summary>
public record QuestValidationError {
	/// <summary>Quest ID (if applicable).</summary>
	public string? QuestId { get; init; }

	/// <summary>Error type.</summary>
	public ValidationErrorType Type { get; init; }

	/// <summary>Error message.</summary>
	public required string Message { get; init; }
}

/// <summary>
/// Quest validation result.
/// </summary>
public record QuestValidationResult {
	/// <summary>Whether validation passed.</summary>
	public bool IsValid { get; init; }

	/// <summary>Validation errors.</summary>
	public IReadOnlyList<QuestValidationError> Errors { get; init; } = [];
}

/// <summary>
/// Quest system statistics.
/// </summary>
public record QuestSystemStats {
	/// <summary>Total quests.</summary>
	public int TotalQuests { get; init; }

	/// <summary>Total chains.</summary>
	public int TotalChains { get; init; }

	/// <summary>Total triggers.</summary>
	public int TotalTriggers { get; init; }

	/// <summary>Total variables.</summary>
	public int TotalVariables { get; init; }

	/// <summary>Quests by type.</summary>
	public Dictionary<QuestType, int> QuestsByType { get; init; } = [];

	/// <summary>Average objectives per quest.</summary>
	public double AverageObjectivesPerQuest { get; init; }

	/// <summary>Average rewards per quest.</summary>
	public double AverageRewardsPerQuest { get; init; }

	/// <summary>Quests with prerequisites.</summary>
	public int QuestsWithPrerequisites { get; init; }

	/// <summary>Orphaned quests (not in chains or triggers).</summary>
	public int OrphanedQuests { get; init; }
}

/// <summary>
/// Export format for quest system.
/// </summary>
internal record QuestSystemExport {
	public QuestSystemSchema? Schema { get; init; }
	public List<Quest> Quests { get; init; } = [];
	public List<QuestChain> Chains { get; init; } = [];
	public List<QuestTrigger> Triggers { get; init; } = [];
	public List<QuestVariable> Variables { get; init; } = [];
}

#endregion
