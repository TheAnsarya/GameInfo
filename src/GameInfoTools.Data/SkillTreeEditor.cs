using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Service for editing skill tree/ability system data in RPGs.
/// Handles skill nodes, prerequisites, paths, and progression.
/// </summary>
public class SkillTreeEditor {
	private readonly Dictionary<string, SkillTree> _trees = [];
	private readonly Dictionary<string, Skill> _skills = [];

	/// <summary>
	/// Current schema configuration.
	/// </summary>
	public SkillTreeSchema Schema { get; private set; } = new();

	/// <summary>
	/// All loaded skill trees.
	/// </summary>
	public IReadOnlyDictionary<string, SkillTree> Trees => _trees;

	/// <summary>
	/// All skills across all trees.
	/// </summary>
	public IReadOnlyDictionary<string, Skill> Skills => _skills;

	#region Tree Management

	/// <summary>
	/// Add a new skill tree.
	/// </summary>
	public void AddTree(SkillTree tree) {
		ArgumentNullException.ThrowIfNull(tree);
		if (string.IsNullOrEmpty(tree.Id))
			throw new ArgumentException("Tree ID is required");

		_trees[tree.Id] = tree;

		// Index all skills in the tree
		foreach (var skill in tree.Skills) {
			_skills[skill.Id] = skill;
		}
	}

	/// <summary>
	/// Remove a skill tree.
	/// </summary>
	public bool RemoveTree(string treeId) {
		if (!_trees.TryGetValue(treeId, out var tree))
			return false;

		// Remove all skills from index
		foreach (var skill in tree.Skills) {
			_skills.Remove(skill.Id);
		}

		return _trees.Remove(treeId);
	}

	/// <summary>
	/// Get a skill tree by ID.
	/// </summary>
	public SkillTree? GetTree(string treeId) {
		return _trees.GetValueOrDefault(treeId);
	}

	/// <summary>
	/// Update a skill tree.
	/// </summary>
	public void UpdateTree(SkillTree tree) {
		ArgumentNullException.ThrowIfNull(tree);
		if (!_trees.ContainsKey(tree.Id))
			throw new KeyNotFoundException($"Tree '{tree.Id}' not found");

		// Re-index skills
		var oldTree = _trees[tree.Id];
		foreach (var skill in oldTree.Skills) {
			_skills.Remove(skill.Id);
		}

		foreach (var skill in tree.Skills) {
			_skills[skill.Id] = skill;
		}

		_trees[tree.Id] = tree;
	}

	#endregion

	#region Skill Management

	/// <summary>
	/// Add a skill to a tree.
	/// </summary>
	public void AddSkill(string treeId, Skill skill) {
		var tree = GetTree(treeId)
			?? throw new KeyNotFoundException($"Tree '{treeId}' not found");

		var skills = tree.Skills.ToList();
		skills.Add(skill);

		_trees[treeId] = tree with { Skills = skills };
		_skills[skill.Id] = skill;
	}

	/// <summary>
	/// Remove a skill from a tree.
	/// </summary>
	public bool RemoveSkill(string treeId, string skillId) {
		var tree = GetTree(treeId);
		if (tree == null) return false;

		var skills = tree.Skills.Where(s => s.Id != skillId).ToList();
		if (skills.Count == tree.Skills.Count) return false;

		_trees[treeId] = tree with { Skills = skills };
		_skills.Remove(skillId);

		// Remove as prerequisite from other skills
		foreach (var t in _trees.Values) {
			var updatedSkills = t.Skills.Select(s =>
				s.Prerequisites.Contains(skillId)
					? s with { Prerequisites = s.Prerequisites.Where(p => p != skillId).ToList() }
					: s
			).ToList();
			_trees[t.Id] = t with { Skills = updatedSkills };
		}

		return true;
	}

	/// <summary>
	/// Get a skill by ID.
	/// </summary>
	public Skill? GetSkill(string skillId) {
		return _skills.GetValueOrDefault(skillId);
	}

	/// <summary>
	/// Update a skill.
	/// </summary>
	public void UpdateSkill(string treeId, Skill skill) {
		var tree = GetTree(treeId)
			?? throw new KeyNotFoundException($"Tree '{treeId}' not found");

		var skills = tree.Skills.ToList();
		var index = skills.FindIndex(s => s.Id == skill.Id);
		if (index < 0)
			throw new KeyNotFoundException($"Skill '{skill.Id}' not found in tree '{treeId}'");

		skills[index] = skill;
		_trees[treeId] = tree with { Skills = skills };
		_skills[skill.Id] = skill;
	}

	/// <summary>
	/// Get skills by category.
	/// </summary>
	public IEnumerable<Skill> GetSkillsByCategory(SkillCategory category) {
		return _skills.Values.Where(s => s.Category == category);
	}

	/// <summary>
	/// Get skills by tier.
	/// </summary>
	public IEnumerable<Skill> GetSkillsByTier(int tier) {
		return _skills.Values.Where(s => s.Tier == tier);
	}

	/// <summary>
	/// Search skills by name or description.
	/// </summary>
	public IEnumerable<Skill> SearchSkills(string searchTerm, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _skills.Values.Where(s =>
			s.Name.Contains(searchTerm, comparison) ||
			(s.Description?.Contains(searchTerm, comparison) ?? false));
	}

	#endregion

	#region Prerequisites & Connections

	/// <summary>
	/// Add a prerequisite to a skill.
	/// </summary>
	public void AddPrerequisite(string treeId, string skillId, string prerequisiteId) {
		var skill = GetSkill(skillId)
			?? throw new KeyNotFoundException($"Skill '{skillId}' not found");

		if (!_skills.ContainsKey(prerequisiteId))
			throw new KeyNotFoundException($"Prerequisite skill '{prerequisiteId}' not found");

		if (skill.Prerequisites.Contains(prerequisiteId))
			return;

		var prereqs = skill.Prerequisites.ToList();
		prereqs.Add(prerequisiteId);

		var updated = skill with { Prerequisites = prereqs };
		UpdateSkill(treeId, updated);
	}

	/// <summary>
	/// Remove a prerequisite from a skill.
	/// </summary>
	public bool RemovePrerequisite(string treeId, string skillId, string prerequisiteId) {
		var skill = GetSkill(skillId);
		if (skill == null) return false;

		var prereqs = skill.Prerequisites.Where(p => p != prerequisiteId).ToList();
		if (prereqs.Count == skill.Prerequisites.Count) return false;

		var updated = skill with { Prerequisites = prereqs };
		UpdateSkill(treeId, updated);
		return true;
	}

	/// <summary>
	/// Get all skills that depend on a given skill.
	/// </summary>
	public IEnumerable<Skill> GetDependentSkills(string skillId) {
		return _skills.Values.Where(s => s.Prerequisites.Contains(skillId));
	}

	/// <summary>
	/// Get the full prerequisite chain for a skill.
	/// </summary>
	public IEnumerable<Skill> GetPrerequisiteChain(string skillId) {
		var chain = new List<Skill>();
		var visited = new HashSet<string>();
		var queue = new Queue<string>();

		var skill = GetSkill(skillId);
		if (skill == null) return chain;

		foreach (var prereq in skill.Prerequisites) {
			queue.Enqueue(prereq);
		}

		while (queue.Count > 0) {
			var currentId = queue.Dequeue();
			if (visited.Contains(currentId)) continue;
			visited.Add(currentId);

			var current = GetSkill(currentId);
			if (current != null) {
				chain.Add(current);
				foreach (var prereq in current.Prerequisites) {
					queue.Enqueue(prereq);
				}
			}
		}

		return chain;
	}

	/// <summary>
	/// Check if a skill can be learned given currently learned skills.
	/// </summary>
	public bool CanLearn(string skillId, IEnumerable<string> learnedSkillIds) {
		var skill = GetSkill(skillId);
		if (skill == null) return false;

		var learned = new HashSet<string>(learnedSkillIds);
		return skill.Prerequisites.All(p => learned.Contains(p));
	}

	#endregion

	#region Path Building

	/// <summary>
	/// Calculate the shortest path to a skill from a set of learned skills.
	/// </summary>
	public IEnumerable<Skill> GetPathToSkill(string targetSkillId, IEnumerable<string> learnedSkillIds) {
		var target = GetSkill(targetSkillId);
		if (target == null) return [];

		var learned = new HashSet<string>(learnedSkillIds);
		if (learned.Contains(targetSkillId)) return [];

		var path = new List<Skill>();
		var needed = new HashSet<string>();

		// DFS to find all needed prerequisites
		var stack = new Stack<string>();
		stack.Push(targetSkillId);

		while (stack.Count > 0) {
			var currentId = stack.Pop();
			if (learned.Contains(currentId)) continue;
			if (needed.Contains(currentId)) continue;

			needed.Add(currentId);
			var current = GetSkill(currentId);
			if (current != null) {
				foreach (var prereq in current.Prerequisites) {
					stack.Push(prereq);
				}
			}
		}

		// Order by tier (prerequisites first)
		return needed
			.Select(id => GetSkill(id))
			.Where(s => s != null)
			.OrderBy(s => s!.Tier)
			.ThenBy(s => s!.Name)
			.Cast<Skill>();
	}

	/// <summary>
	/// Calculate total cost to learn a skill from scratch.
	/// </summary>
	public SkillCost CalculateTotalCost(string skillId, IEnumerable<string>? learnedSkillIds = null) {
		var path = GetPathToSkill(skillId, learnedSkillIds ?? []);
		var skill = GetSkill(skillId);

		if (skill != null && !(learnedSkillIds?.Contains(skillId) ?? false)) {
			path = path.Append(skill);
		}

		return new SkillCost {
			SkillPoints = path.Sum(s => s.PointCost),
			Gold = path.Sum(s => s.GoldCost),
			Level = path.Max(s => (int?)s.LevelRequired) ?? 0,
			SkillCount = path.Count()
		};
	}

	#endregion

	#region Validation

	/// <summary>
	/// Validate the entire skill tree system.
	/// </summary>
	public SkillTreeValidationResult Validate() {
		var errors = new List<SkillTreeValidationError>();

		// Validate trees
		foreach (var tree in _trees.Values) {
			errors.AddRange(ValidateTree(tree));
		}

		// Check for orphaned skills
		foreach (var skill in _skills.Values) {
			if (!_trees.Values.Any(t => t.Skills.Any(s => s.Id == skill.Id))) {
				errors.Add(new SkillTreeValidationError {
					SkillId = skill.Id,
					Type = SkillTreeValidationErrorType.OrphanedSkill,
					Message = $"Skill '{skill.Id}' is not in any tree"
				});
			}
		}

		// Check for circular dependencies
		errors.AddRange(CheckCircularDependencies());

		return new SkillTreeValidationResult {
			IsValid = errors.Count == 0,
			Errors = errors
		};
	}

	/// <summary>
	/// Validate a single skill tree.
	/// </summary>
	public IEnumerable<SkillTreeValidationError> ValidateTree(SkillTree tree) {
		var errors = new List<SkillTreeValidationError>();

		if (string.IsNullOrEmpty(tree.Name)) {
			errors.Add(new SkillTreeValidationError {
				TreeId = tree.Id,
				Type = SkillTreeValidationErrorType.MissingRequired,
				Message = "Tree name is required"
			});
		}

		var skillIds = new HashSet<string>();
		foreach (var skill in tree.Skills) {
			// Check for duplicate IDs
			if (!skillIds.Add(skill.Id)) {
				errors.Add(new SkillTreeValidationError {
					TreeId = tree.Id,
					SkillId = skill.Id,
					Type = SkillTreeValidationErrorType.DuplicateId,
					Message = $"Duplicate skill ID '{skill.Id}' in tree"
				});
			}

			// Validate skill
			errors.AddRange(ValidateSkill(skill));
		}

		return errors;
	}

	private IEnumerable<SkillTreeValidationError> ValidateSkill(Skill skill) {
		var errors = new List<SkillTreeValidationError>();

		if (string.IsNullOrEmpty(skill.Name)) {
			errors.Add(new SkillTreeValidationError {
				SkillId = skill.Id,
				Type = SkillTreeValidationErrorType.MissingRequired,
				Message = "Skill name is required"
			});
		}

		// Check prerequisites exist
		foreach (var prereq in skill.Prerequisites) {
			if (!_skills.ContainsKey(prereq)) {
				errors.Add(new SkillTreeValidationError {
					SkillId = skill.Id,
					Type = SkillTreeValidationErrorType.InvalidReference,
					Message = $"Prerequisite skill '{prereq}' not found"
				});
			}
		}

		// Check exclusive skills exist
		foreach (var exclusive in skill.ExclusiveWith) {
			if (!_skills.ContainsKey(exclusive)) {
				errors.Add(new SkillTreeValidationError {
					SkillId = skill.Id,
					Type = SkillTreeValidationErrorType.InvalidReference,
					Message = $"Exclusive skill '{exclusive}' not found"
				});
			}
		}

		return errors;
	}

	private IEnumerable<SkillTreeValidationError> CheckCircularDependencies() {
		var errors = new List<SkillTreeValidationError>();
		var visited = new HashSet<string>();
		var stack = new HashSet<string>();

		foreach (var skill in _skills.Values) {
			if (HasCircularDependency(skill.Id, visited, stack, out var cycle)) {
				errors.Add(new SkillTreeValidationError {
					SkillId = skill.Id,
					Type = SkillTreeValidationErrorType.CircularDependency,
					Message = $"Circular dependency detected: {string.Join(" -> ", cycle)}"
				});
			}
		}

		return errors;
	}

	private bool HasCircularDependency(string skillId, HashSet<string> visited, HashSet<string> stack, out List<string> cycle) {
		cycle = [];

		if (stack.Contains(skillId)) {
			cycle.Add(skillId);
			return true;
		}

		if (visited.Contains(skillId))
			return false;

		visited.Add(skillId);
		stack.Add(skillId);

		var skill = GetSkill(skillId);
		if (skill != null) {
			foreach (var prereq in skill.Prerequisites) {
				if (HasCircularDependency(prereq, visited, stack, out cycle)) {
					cycle.Insert(0, skillId);
					return true;
				}
			}
		}

		stack.Remove(skillId);
		return false;
	}

	#endregion

	#region Import/Export

	/// <summary>
	/// Export skill trees to JSON.
	/// </summary>
	public async Task ExportToJsonAsync(string path) {
		var export = new SkillTreeExport {
			Schema = Schema,
			Trees = _trees.Values.ToList()
		};

		var json = JsonSerializer.Serialize(export, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Import skill trees from JSON.
	/// </summary>
	public async Task ImportFromJsonAsync(string path) {
		var json = await File.ReadAllTextAsync(path);
		var import = JsonSerializer.Deserialize<SkillTreeExport>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse skill tree data");

		Schema = import.Schema ?? new SkillTreeSchema();

		_trees.Clear();
		_skills.Clear();

		foreach (var tree in import.Trees) {
			AddTree(tree);
		}
	}

	/// <summary>
	/// Export to binary format for ROM injection.
	/// </summary>
	public byte[] ExportToBinary() {
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// Write header
		writer.Write((byte)0x53); // 'S'
		writer.Write((byte)0x54); // 'T'
		writer.Write((byte)1);    // Version

		// Write tree count
		writer.Write((ushort)_trees.Count);

		// Write each tree
		foreach (var tree in _trees.Values) {
			WriteTree(writer, tree);
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
		var s = reader.ReadByte();
		var t = reader.ReadByte();
		var version = reader.ReadByte();

		if (s != 0x53 || t != 0x54)
			throw new InvalidDataException("Invalid skill tree binary format");

		_trees.Clear();
		_skills.Clear();

		// Read trees
		var treeCount = reader.ReadUInt16();
		for (var i = 0; i < treeCount; i++) {
			var tree = ReadTree(reader);
			AddTree(tree);
		}
	}

	private void WriteTree(BinaryWriter writer, SkillTree tree) {
		WriteLengthPrefixedString(writer, tree.Id);
		WriteLengthPrefixedString(writer, tree.Name);
		writer.Write((byte)tree.Type);

		// Write skills
		writer.Write((ushort)tree.Skills.Count);
		foreach (var skill in tree.Skills) {
			WriteSkill(writer, skill);
		}
	}

	private void WriteSkill(BinaryWriter writer, Skill skill) {
		WriteLengthPrefixedString(writer, skill.Id);
		WriteLengthPrefixedString(writer, skill.Name);
		WriteLengthPrefixedString(writer, skill.Description ?? "");
		writer.Write((byte)skill.Category);
		writer.Write((byte)skill.Tier);
		writer.Write((ushort)skill.PointCost);
		writer.Write((ushort)skill.GoldCost);
		writer.Write((byte)skill.LevelRequired);
		writer.Write((byte)skill.MaxLevel);

		// Write prerequisites
		writer.Write((byte)skill.Prerequisites.Count);
		foreach (var prereq in skill.Prerequisites) {
			WriteLengthPrefixedString(writer, prereq);
		}

		// Write effects
		writer.Write((byte)skill.Effects.Count);
		foreach (var effect in skill.Effects) {
			WriteLengthPrefixedString(writer, effect.StatName);
			writer.Write(effect.Value);
			writer.Write((byte)effect.Type);
		}
	}

	private SkillTree ReadTree(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var type = (SkillTreeType)reader.ReadByte();

		var skillCount = reader.ReadUInt16();
		var skills = new List<Skill>();
		for (var i = 0; i < skillCount; i++) {
			skills.Add(ReadSkill(reader));
		}

		return new SkillTree {
			Id = id,
			Name = name,
			Type = type,
			Skills = skills
		};
	}

	private Skill ReadSkill(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var description = ReadLengthPrefixedString(reader);
		var category = (SkillCategory)reader.ReadByte();
		var tier = reader.ReadByte();
		var pointCost = reader.ReadUInt16();
		var goldCost = reader.ReadUInt16();
		var levelRequired = reader.ReadByte();
		var maxLevel = reader.ReadByte();

		var prereqCount = reader.ReadByte();
		var prereqs = new List<string>();
		for (var i = 0; i < prereqCount; i++) {
			prereqs.Add(ReadLengthPrefixedString(reader));
		}

		var effectCount = reader.ReadByte();
		var effects = new List<SkillEffect>();
		for (var i = 0; i < effectCount; i++) {
			effects.Add(new SkillEffect {
				StatName = ReadLengthPrefixedString(reader),
				Value = reader.ReadInt32(),
				Type = (EffectType)reader.ReadByte()
			});
		}

		return new Skill {
			Id = id,
			Name = name,
			Description = description,
			Category = category,
			Tier = tier,
			PointCost = pointCost,
			GoldCost = goldCost,
			LevelRequired = levelRequired,
			MaxLevel = maxLevel,
			Prerequisites = prereqs,
			Effects = effects
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
	/// Get statistics about the skill tree system.
	/// </summary>
	public SkillTreeStats GetStatistics() {
		return new SkillTreeStats {
			TotalTrees = _trees.Count,
			TotalSkills = _skills.Count,
			SkillsByCategory = _skills.Values
				.GroupBy(s => s.Category)
				.ToDictionary(g => g.Key, g => g.Count()),
			SkillsByTier = _skills.Values
				.GroupBy(s => s.Tier)
				.ToDictionary(g => g.Key, g => g.Count()),
			AveragePrerequisites = _skills.Count > 0
				? _skills.Values.Average(s => s.Prerequisites.Count)
				: 0,
			MaxTier = _skills.Values.Max(s => (int?)s.Tier) ?? 0,
			TotalPointCost = _skills.Values.Sum(s => s.PointCost),
			TotalGoldCost = _skills.Values.Sum(s => s.GoldCost)
		};
	}

	#endregion

	/// <summary>
	/// Clear all data.
	/// </summary>
	public void Clear() {
		_trees.Clear();
		_skills.Clear();
		Schema = new SkillTreeSchema();
	}

	/// <summary>
	/// Set the schema configuration.
	/// </summary>
	public void SetSchema(SkillTreeSchema schema) {
		Schema = schema ?? new SkillTreeSchema();
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
/// Represents a skill tree (collection of skills).
/// </summary>
public record SkillTree {
	/// <summary>Unique tree identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Tree description.</summary>
	public string? Description { get; init; }

	/// <summary>Tree type.</summary>
	public SkillTreeType Type { get; init; } = SkillTreeType.Class;

	/// <summary>Skills in this tree.</summary>
	public IReadOnlyList<Skill> Skills { get; init; } = [];

	/// <summary>Character/class this tree belongs to.</summary>
	public string? CharacterClass { get; init; }

	/// <summary>Icon identifier.</summary>
	public string? IconId { get; init; }
}

/// <summary>
/// Represents a skill node.
/// </summary>
public record Skill {
	/// <summary>Unique skill identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Skill description.</summary>
	public string? Description { get; init; }

	/// <summary>Skill category.</summary>
	public SkillCategory Category { get; init; } = SkillCategory.Active;

	/// <summary>Tier/rank in the tree (0 = root).</summary>
	public int Tier { get; init; }

	/// <summary>X position in tree layout.</summary>
	public int PositionX { get; init; }

	/// <summary>Y position in tree layout.</summary>
	public int PositionY { get; init; }

	/// <summary>Skill point cost to learn.</summary>
	public int PointCost { get; init; } = 1;

	/// <summary>Gold/currency cost to learn.</summary>
	public int GoldCost { get; init; }

	/// <summary>Minimum level required.</summary>
	public int LevelRequired { get; init; }

	/// <summary>Maximum skill level (for upgradeable skills).</summary>
	public int MaxLevel { get; init; } = 1;

	/// <summary>Prerequisite skill IDs.</summary>
	public IReadOnlyList<string> Prerequisites { get; init; } = [];

	/// <summary>Skills that cannot be learned if this is learned.</summary>
	public IReadOnlyList<string> ExclusiveWith { get; init; } = [];

	/// <summary>Stat/ability effects when learned.</summary>
	public IReadOnlyList<SkillEffect> Effects { get; init; } = [];

	/// <summary>Icon identifier.</summary>
	public string? IconId { get; init; }

	/// <summary>Custom metadata.</summary>
	public Dictionary<string, object>? Metadata { get; init; }
}

/// <summary>
/// Effect of learning a skill.
/// </summary>
public record SkillEffect {
	/// <summary>Name of stat affected.</summary>
	public required string StatName { get; init; }

	/// <summary>Effect value.</summary>
	public int Value { get; init; }

	/// <summary>Effect type.</summary>
	public EffectType Type { get; init; } = EffectType.Flat;

	/// <summary>Effect per skill level.</summary>
	public int ValuePerLevel { get; init; }
}

/// <summary>
/// Cost to learn a skill or path.
/// </summary>
public record SkillCost {
	/// <summary>Total skill points.</summary>
	public int SkillPoints { get; init; }

	/// <summary>Total gold cost.</summary>
	public int Gold { get; init; }

	/// <summary>Minimum level required.</summary>
	public int Level { get; init; }

	/// <summary>Number of skills.</summary>
	public int SkillCount { get; init; }
}

/// <summary>
/// Schema configuration for skill tree system.
/// </summary>
public record SkillTreeSchema {
	/// <summary>Maximum skills per tree.</summary>
	public int MaxSkillsPerTree { get; init; } = 50;

	/// <summary>Maximum prerequisites per skill.</summary>
	public int MaxPrerequisites { get; init; } = 5;

	/// <summary>Maximum skill tiers.</summary>
	public int MaxTiers { get; init; } = 10;

	/// <summary>Valid stat names for effects.</summary>
	public HashSet<string> ValidStatNames { get; init; } = [];
}

#endregion

#region Enums

/// <summary>
/// Skill tree type.
/// </summary>
public enum SkillTreeType {
	/// <summary>Class-specific skills.</summary>
	Class,
	/// <summary>Weapon proficiency.</summary>
	Weapon,
	/// <summary>General/shared skills.</summary>
	General,
	/// <summary>Crafting/profession skills.</summary>
	Profession,
	/// <summary>Hidden/secret skills.</summary>
	Hidden
}

/// <summary>
/// Skill category.
/// </summary>
public enum SkillCategory {
	/// <summary>Active ability (usable).</summary>
	Active,
	/// <summary>Passive bonus.</summary>
	Passive,
	/// <summary>Buff/enhancement.</summary>
	Buff,
	/// <summary>Attack skill.</summary>
	Attack,
	/// <summary>Defense skill.</summary>
	Defense,
	/// <summary>Magic/spell.</summary>
	Magic,
	/// <summary>Support ability.</summary>
	Support,
	/// <summary>Ultimate/finisher.</summary>
	Ultimate
}

/// <summary>
/// Effect type.
/// </summary>
public enum EffectType {
	/// <summary>Flat bonus.</summary>
	Flat,
	/// <summary>Percentage bonus.</summary>
	Percent,
	/// <summary>Multiplier.</summary>
	Multiplier,
	/// <summary>Override value.</summary>
	Override
}

/// <summary>
/// Validation error type.
/// </summary>
public enum SkillTreeValidationErrorType {
	/// <summary>Missing required field.</summary>
	MissingRequired,
	/// <summary>Invalid reference.</summary>
	InvalidReference,
	/// <summary>Duplicate ID.</summary>
	DuplicateId,
	/// <summary>Circular dependency.</summary>
	CircularDependency,
	/// <summary>Orphaned skill.</summary>
	OrphanedSkill
}

#endregion

#region Result Types

/// <summary>
/// Skill tree validation error.
/// </summary>
public record SkillTreeValidationError {
	/// <summary>Tree ID (if applicable).</summary>
	public string? TreeId { get; init; }

	/// <summary>Skill ID (if applicable).</summary>
	public string? SkillId { get; init; }

	/// <summary>Error type.</summary>
	public SkillTreeValidationErrorType Type { get; init; }

	/// <summary>Error message.</summary>
	public required string Message { get; init; }
}

/// <summary>
/// Skill tree validation result.
/// </summary>
public record SkillTreeValidationResult {
	/// <summary>Whether validation passed.</summary>
	public bool IsValid { get; init; }

	/// <summary>Validation errors.</summary>
	public IReadOnlyList<SkillTreeValidationError> Errors { get; init; } = [];
}

/// <summary>
/// Skill tree statistics.
/// </summary>
public record SkillTreeStats {
	/// <summary>Total trees.</summary>
	public int TotalTrees { get; init; }

	/// <summary>Total skills.</summary>
	public int TotalSkills { get; init; }

	/// <summary>Skills by category.</summary>
	public Dictionary<SkillCategory, int> SkillsByCategory { get; init; } = [];

	/// <summary>Skills by tier.</summary>
	public Dictionary<int, int> SkillsByTier { get; init; } = [];

	/// <summary>Average prerequisites per skill.</summary>
	public double AveragePrerequisites { get; init; }

	/// <summary>Maximum tier depth.</summary>
	public int MaxTier { get; init; }

	/// <summary>Total skill point cost for all skills.</summary>
	public int TotalPointCost { get; init; }

	/// <summary>Total gold cost for all skills.</summary>
	public int TotalGoldCost { get; init; }
}

/// <summary>
/// Export format for skill trees.
/// </summary>
internal record SkillTreeExport {
	public SkillTreeSchema? Schema { get; init; }
	public List<SkillTree> Trees { get; init; } = [];
}

#endregion
