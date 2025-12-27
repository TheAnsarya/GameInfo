using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Service for editing achievement/trophy system data.
/// Handles achievement definitions, conditions, rewards, and tracking.
/// </summary>
public class AchievementEditor {
	private readonly Dictionary<string, Achievement> _achievements = [];
	private readonly Dictionary<string, AchievementCategory> _categories = [];

	/// <summary>
	/// Current schema configuration.
	/// </summary>
	public AchievementSchema Schema { get; private set; } = new();

	/// <summary>
	/// All loaded achievements.
	/// </summary>
	public IReadOnlyDictionary<string, Achievement> Achievements => _achievements;

	/// <summary>
	/// All achievement categories.
	/// </summary>
	public IReadOnlyDictionary<string, AchievementCategory> Categories => _categories;

	#region Achievement Management

	/// <summary>
	/// Add a new achievement.
	/// </summary>
	public void AddAchievement(Achievement achievement) {
		ArgumentNullException.ThrowIfNull(achievement);
		if (string.IsNullOrEmpty(achievement.Id))
			throw new ArgumentException("Achievement ID is required");

		_achievements[achievement.Id] = achievement;
	}

	/// <summary>
	/// Remove an achievement.
	/// </summary>
	public bool RemoveAchievement(string achievementId) {
		return _achievements.Remove(achievementId);
	}

	/// <summary>
	/// Get an achievement by ID.
	/// </summary>
	public Achievement? GetAchievement(string achievementId) {
		return _achievements.GetValueOrDefault(achievementId);
	}

	/// <summary>
	/// Update an achievement.
	/// </summary>
	public void UpdateAchievement(Achievement achievement) {
		ArgumentNullException.ThrowIfNull(achievement);
		if (!_achievements.ContainsKey(achievement.Id))
			throw new KeyNotFoundException($"Achievement '{achievement.Id}' not found");

		_achievements[achievement.Id] = achievement;
	}

	/// <summary>
	/// Get achievements by category.
	/// </summary>
	public IEnumerable<Achievement> GetByCategory(string categoryId) {
		return _achievements.Values.Where(a => a.CategoryId == categoryId);
	}

	/// <summary>
	/// Get achievements by type.
	/// </summary>
	public IEnumerable<Achievement> GetByType(AchievementType type) {
		return _achievements.Values.Where(a => a.Type == type);
	}

	/// <summary>
	/// Get achievements by rarity.
	/// </summary>
	public IEnumerable<Achievement> GetByRarity(AchievementRarity rarity) {
		return _achievements.Values.Where(a => a.Rarity == rarity);
	}

	/// <summary>
	/// Search achievements by name or description.
	/// </summary>
	public IEnumerable<Achievement> Search(string searchTerm, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _achievements.Values.Where(a =>
			a.Name.Contains(searchTerm, comparison) ||
			(a.Description?.Contains(searchTerm, comparison) ?? false));
	}

	/// <summary>
	/// Get hidden achievements.
	/// </summary>
	public IEnumerable<Achievement> GetHidden() {
		return _achievements.Values.Where(a => a.IsHidden);
	}

	/// <summary>
	/// Get secret achievements (hidden until unlocked).
	/// </summary>
	public IEnumerable<Achievement> GetSecret() {
		return _achievements.Values.Where(a => a.IsSecret);
	}

	#endregion

	#region Category Management

	/// <summary>
	/// Add a new category.
	/// </summary>
	public void AddCategory(AchievementCategory category) {
		ArgumentNullException.ThrowIfNull(category);
		if (string.IsNullOrEmpty(category.Id))
			throw new ArgumentException("Category ID is required");

		_categories[category.Id] = category;
	}

	/// <summary>
	/// Remove a category.
	/// </summary>
	public bool RemoveCategory(string categoryId) {
		return _categories.Remove(categoryId);
	}

	/// <summary>
	/// Get a category by ID.
	/// </summary>
	public AchievementCategory? GetCategory(string categoryId) {
		return _categories.GetValueOrDefault(categoryId);
	}

	/// <summary>
	/// Update a category.
	/// </summary>
	public void UpdateCategory(AchievementCategory category) {
		ArgumentNullException.ThrowIfNull(category);
		if (!_categories.ContainsKey(category.Id))
			throw new KeyNotFoundException($"Category '{category.Id}' not found");

		_categories[category.Id] = category;
	}

	#endregion

	#region Conditions

	/// <summary>
	/// Add a condition to an achievement.
	/// </summary>
	public void AddCondition(string achievementId, AchievementCondition condition) {
		var achievement = GetAchievement(achievementId)
			?? throw new KeyNotFoundException($"Achievement '{achievementId}' not found");

		var conditions = achievement.Conditions.ToList();
		conditions.Add(condition);

		_achievements[achievementId] = achievement with { Conditions = conditions };
	}

	/// <summary>
	/// Remove a condition from an achievement.
	/// </summary>
	public bool RemoveCondition(string achievementId, int conditionIndex) {
		var achievement = GetAchievement(achievementId);
		if (achievement == null) return false;

		var conditions = achievement.Conditions.ToList();
		if (conditionIndex < 0 || conditionIndex >= conditions.Count) return false;

		conditions.RemoveAt(conditionIndex);
		_achievements[achievementId] = achievement with { Conditions = conditions };
		return true;
	}

	/// <summary>
	/// Update a condition in an achievement.
	/// </summary>
	public void UpdateCondition(string achievementId, int conditionIndex, AchievementCondition condition) {
		var achievement = GetAchievement(achievementId)
			?? throw new KeyNotFoundException($"Achievement '{achievementId}' not found");

		var conditions = achievement.Conditions.ToList();
		if (conditionIndex < 0 || conditionIndex >= conditions.Count)
			throw new IndexOutOfRangeException("Condition index out of range");

		conditions[conditionIndex] = condition;
		_achievements[achievementId] = achievement with { Conditions = conditions };
	}

	#endregion

	#region Progress Evaluation

	/// <summary>
	/// Evaluate if an achievement would be unlocked given current state.
	/// </summary>
	public AchievementProgress EvaluateProgress(string achievementId, Dictionary<string, int> gameState) {
		var achievement = GetAchievement(achievementId);
		if (achievement == null)
			return new AchievementProgress { AchievementId = achievementId, IsUnlocked = false };

		var conditionResults = new List<ConditionProgress>();
		var allMet = true;
		var anyMet = false;

		foreach (var condition in achievement.Conditions) {
			var current = gameState.GetValueOrDefault(condition.StatName, 0);
			var met = EvaluateCondition(condition, current);

			conditionResults.Add(new ConditionProgress {
				StatName = condition.StatName,
				CurrentValue = current,
				TargetValue = condition.TargetValue,
				IsMet = met,
				PercentComplete = condition.TargetValue > 0
					? Math.Min(100, (int)(current * 100.0 / condition.TargetValue))
					: (met ? 100 : 0)
			});

			if (met) anyMet = true;
			else allMet = false;
		}

		// Check if achievement is unlocked based on logic mode
		var isUnlocked = achievement.ConditionLogic switch {
			ConditionLogic.All => allMet,
			ConditionLogic.Any => anyMet,
			ConditionLogic.Count => conditionResults.Count(c => c.IsMet) >= (achievement.RequiredConditionCount ?? 1),
			_ => allMet
		};

		return new AchievementProgress {
			AchievementId = achievementId,
			IsUnlocked = isUnlocked,
			ConditionProgress = conditionResults,
			OverallPercent = conditionResults.Count > 0
				? (int)conditionResults.Average(c => c.PercentComplete)
				: 0
		};
	}

	private static bool EvaluateCondition(AchievementCondition condition, int currentValue) {
		return condition.Comparison switch {
			ComparisonType.GreaterOrEqual => currentValue >= condition.TargetValue,
			ComparisonType.Greater => currentValue > condition.TargetValue,
			ComparisonType.Equal => currentValue == condition.TargetValue,
			ComparisonType.Less => currentValue < condition.TargetValue,
			ComparisonType.LessOrEqual => currentValue <= condition.TargetValue,
			ComparisonType.NotEqual => currentValue != condition.TargetValue,
			_ => currentValue >= condition.TargetValue
		};
	}

	/// <summary>
	/// Get all achievements that would be newly unlocked given state change.
	/// </summary>
	public IEnumerable<Achievement> GetNewlyUnlocked(
		Dictionary<string, int> previousState,
		Dictionary<string, int> currentState) {
		foreach (var achievement in _achievements.Values) {
			var wasUnlocked = EvaluateProgress(achievement.Id, previousState).IsUnlocked;
			var nowUnlocked = EvaluateProgress(achievement.Id, currentState).IsUnlocked;

			if (!wasUnlocked && nowUnlocked) {
				yield return achievement;
			}
		}
	}

	#endregion

	#region Validation

	/// <summary>
	/// Validate the achievement system.
	/// </summary>
	public AchievementValidationResult Validate() {
		var errors = new List<AchievementValidationError>();

		// Validate achievements
		foreach (var achievement in _achievements.Values) {
			errors.AddRange(ValidateAchievement(achievement));
		}

		// Check for duplicate IDs (should be prevented by dictionary, but check display)
		var idCounts = _achievements.Values.GroupBy(a => a.Id).Where(g => g.Count() > 1);
		foreach (var group in idCounts) {
			errors.Add(new AchievementValidationError {
				AchievementId = group.Key,
				Type = AchievementValidationErrorType.DuplicateId,
				Message = $"Duplicate achievement ID: {group.Key}"
			});
		}

		// Check category references
		foreach (var achievement in _achievements.Values.Where(a => !string.IsNullOrEmpty(a.CategoryId))) {
			if (!_categories.ContainsKey(achievement.CategoryId!)) {
				errors.Add(new AchievementValidationError {
					AchievementId = achievement.Id,
					Type = AchievementValidationErrorType.InvalidCategory,
					Message = $"Category '{achievement.CategoryId}' not found"
				});
			}
		}

		// Check prerequisite references
		foreach (var achievement in _achievements.Values) {
			foreach (var prereq in achievement.Prerequisites) {
				if (!_achievements.ContainsKey(prereq)) {
					errors.Add(new AchievementValidationError {
						AchievementId = achievement.Id,
						Type = AchievementValidationErrorType.InvalidPrerequisite,
						Message = $"Prerequisite achievement '{prereq}' not found"
					});
				}
			}
		}

		// Check for circular prerequisites
		errors.AddRange(CheckCircularPrerequisites());

		return new AchievementValidationResult {
			IsValid = errors.Count == 0,
			Errors = errors
		};
	}

	private IEnumerable<AchievementValidationError> ValidateAchievement(Achievement achievement) {
		var errors = new List<AchievementValidationError>();

		if (string.IsNullOrEmpty(achievement.Name)) {
			errors.Add(new AchievementValidationError {
				AchievementId = achievement.Id,
				Type = AchievementValidationErrorType.MissingRequired,
				Message = "Achievement name is required"
			});
		}

		if (achievement.Points < 0) {
			errors.Add(new AchievementValidationError {
				AchievementId = achievement.Id,
				Type = AchievementValidationErrorType.InvalidValue,
				Message = "Achievement points cannot be negative"
			});
		}

		if (achievement.Conditions.Count == 0) {
			errors.Add(new AchievementValidationError {
				AchievementId = achievement.Id,
				Type = AchievementValidationErrorType.NoConditions,
				Message = "Achievement has no unlock conditions"
			});
		}

		return errors;
	}

	private IEnumerable<AchievementValidationError> CheckCircularPrerequisites() {
		var errors = new List<AchievementValidationError>();
		var visited = new HashSet<string>();
		var stack = new HashSet<string>();

		foreach (var achievement in _achievements.Values) {
			if (HasCircularPrerequisite(achievement.Id, visited, stack, out var cycle)) {
				errors.Add(new AchievementValidationError {
					AchievementId = achievement.Id,
					Type = AchievementValidationErrorType.CircularPrerequisite,
					Message = $"Circular prerequisite: {string.Join(" -> ", cycle)}"
				});
			}
		}

		return errors;
	}

	private bool HasCircularPrerequisite(string achievementId, HashSet<string> visited, HashSet<string> stack, out List<string> cycle) {
		cycle = [];

		if (stack.Contains(achievementId)) {
			cycle.Add(achievementId);
			return true;
		}

		if (visited.Contains(achievementId))
			return false;

		visited.Add(achievementId);
		stack.Add(achievementId);

		var achievement = GetAchievement(achievementId);
		if (achievement != null) {
			foreach (var prereq in achievement.Prerequisites) {
				if (HasCircularPrerequisite(prereq, visited, stack, out cycle)) {
					cycle.Insert(0, achievementId);
					return true;
				}
			}
		}

		stack.Remove(achievementId);
		return false;
	}

	#endregion

	#region Import/Export

	/// <summary>
	/// Export achievements to JSON.
	/// </summary>
	public async Task ExportToJsonAsync(string path) {
		var export = new AchievementExport {
			Schema = Schema,
			Categories = _categories.Values.ToList(),
			Achievements = _achievements.Values.ToList()
		};

		var json = JsonSerializer.Serialize(export, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Import achievements from JSON.
	/// </summary>
	public async Task ImportFromJsonAsync(string path) {
		var json = await File.ReadAllTextAsync(path);
		var import = JsonSerializer.Deserialize<AchievementExport>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse achievement data");

		Schema = import.Schema ?? new AchievementSchema();

		_categories.Clear();
		_achievements.Clear();

		foreach (var category in import.Categories) {
			AddCategory(category);
		}

		foreach (var achievement in import.Achievements) {
			AddAchievement(achievement);
		}
	}

	/// <summary>
	/// Export to binary format for ROM injection.
	/// </summary>
	public byte[] ExportToBinary() {
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// Write header
		writer.Write((byte)0x41); // 'A'
		writer.Write((byte)0x43); // 'C'
		writer.Write((byte)0x48); // 'H'
		writer.Write((byte)1);    // Version

		// Write category count and data
		writer.Write((ushort)_categories.Count);
		foreach (var category in _categories.Values) {
			WriteCategory(writer, category);
		}

		// Write achievement count and data
		writer.Write((ushort)_achievements.Count);
		foreach (var achievement in _achievements.Values) {
			WriteAchievement(writer, achievement);
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
		var a = reader.ReadByte();
		var c = reader.ReadByte();
		var h = reader.ReadByte();
		var version = reader.ReadByte();

		if (a != 0x41 || c != 0x43 || h != 0x48)
			throw new InvalidDataException("Invalid achievement binary format");

		_categories.Clear();
		_achievements.Clear();

		// Read categories
		var categoryCount = reader.ReadUInt16();
		for (var i = 0; i < categoryCount; i++) {
			var category = ReadCategory(reader);
			AddCategory(category);
		}

		// Read achievements
		var achievementCount = reader.ReadUInt16();
		for (var i = 0; i < achievementCount; i++) {
			var achievement = ReadAchievement(reader);
			AddAchievement(achievement);
		}
	}

	private void WriteCategory(BinaryWriter writer, AchievementCategory category) {
		WriteLengthPrefixedString(writer, category.Id);
		WriteLengthPrefixedString(writer, category.Name);
		writer.Write((byte)category.SortOrder);
	}

	private void WriteAchievement(BinaryWriter writer, Achievement achievement) {
		WriteLengthPrefixedString(writer, achievement.Id);
		WriteLengthPrefixedString(writer, achievement.Name);
		WriteLengthPrefixedString(writer, achievement.Description ?? "");
		WriteLengthPrefixedString(writer, achievement.CategoryId ?? "");
		writer.Write((byte)achievement.Type);
		writer.Write((byte)achievement.Rarity);
		writer.Write((ushort)achievement.Points);
		writer.Write(achievement.IsHidden);
		writer.Write(achievement.IsSecret);

		// Write conditions
		writer.Write((byte)achievement.Conditions.Count);
		foreach (var condition in achievement.Conditions) {
			WriteLengthPrefixedString(writer, condition.StatName);
			writer.Write((byte)condition.Comparison);
			writer.Write(condition.TargetValue);
		}
	}

	private AchievementCategory ReadCategory(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var sortOrder = reader.ReadByte();

		return new AchievementCategory {
			Id = id,
			Name = name,
			SortOrder = sortOrder
		};
	}

	private Achievement ReadAchievement(BinaryReader reader) {
		var id = ReadLengthPrefixedString(reader);
		var name = ReadLengthPrefixedString(reader);
		var description = ReadLengthPrefixedString(reader);
		var categoryId = ReadLengthPrefixedString(reader);
		var type = (AchievementType)reader.ReadByte();
		var rarity = (AchievementRarity)reader.ReadByte();
		var points = reader.ReadUInt16();
		var isHidden = reader.ReadBoolean();
		var isSecret = reader.ReadBoolean();

		var conditionCount = reader.ReadByte();
		var conditions = new List<AchievementCondition>();
		for (var i = 0; i < conditionCount; i++) {
			conditions.Add(new AchievementCondition {
				StatName = ReadLengthPrefixedString(reader),
				Comparison = (ComparisonType)reader.ReadByte(),
				TargetValue = reader.ReadInt32()
			});
		}

		return new Achievement {
			Id = id,
			Name = name,
			Description = string.IsNullOrEmpty(description) ? null : description,
			CategoryId = string.IsNullOrEmpty(categoryId) ? null : categoryId,
			Type = type,
			Rarity = rarity,
			Points = points,
			IsHidden = isHidden,
			IsSecret = isSecret,
			Conditions = conditions
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
	/// Get achievement system statistics.
	/// </summary>
	public AchievementStats GetStatistics() {
		return new AchievementStats {
			TotalAchievements = _achievements.Count,
			TotalCategories = _categories.Count,
			TotalPoints = _achievements.Values.Sum(a => a.Points),
			ByType = _achievements.Values
				.GroupBy(a => a.Type)
				.ToDictionary(g => g.Key, g => g.Count()),
			ByRarity = _achievements.Values
				.GroupBy(a => a.Rarity)
				.ToDictionary(g => g.Key, g => g.Count()),
			ByCategory = _achievements.Values
				.Where(a => !string.IsNullOrEmpty(a.CategoryId))
				.GroupBy(a => a.CategoryId!)
				.ToDictionary(g => g.Key, g => g.Count()),
			HiddenCount = _achievements.Values.Count(a => a.IsHidden),
			SecretCount = _achievements.Values.Count(a => a.IsSecret)
		};
	}

	/// <summary>
	/// Calculate completion progress given unlocked achievement IDs.
	/// </summary>
	public CompletionStats CalculateCompletion(IEnumerable<string> unlockedIds) {
		var unlocked = new HashSet<string>(unlockedIds);
		var unlockedAchievements = _achievements.Values.Where(a => unlocked.Contains(a.Id)).ToList();

		return new CompletionStats {
			UnlockedCount = unlockedAchievements.Count,
			TotalCount = _achievements.Count,
			UnlockedPoints = unlockedAchievements.Sum(a => a.Points),
			TotalPoints = _achievements.Values.Sum(a => a.Points),
			CompletionPercent = _achievements.Count > 0
				? (int)(unlockedAchievements.Count * 100.0 / _achievements.Count)
				: 100,
			PointsPercent = _achievements.Values.Sum(a => a.Points) > 0
				? (int)(unlockedAchievements.Sum(a => a.Points) * 100.0 / _achievements.Values.Sum(a => a.Points))
				: 100
		};
	}

	#endregion

	/// <summary>
	/// Clear all data.
	/// </summary>
	public void Clear() {
		_achievements.Clear();
		_categories.Clear();
		Schema = new AchievementSchema();
	}

	/// <summary>
	/// Set the schema configuration.
	/// </summary>
	public void SetSchema(AchievementSchema schema) {
		Schema = schema ?? new AchievementSchema();
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
/// Represents an achievement.
/// </summary>
public record Achievement {
	/// <summary>Unique achievement identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Achievement description.</summary>
	public string? Description { get; init; }

	/// <summary>Category ID.</summary>
	public string? CategoryId { get; init; }

	/// <summary>Achievement type.</summary>
	public AchievementType Type { get; init; } = AchievementType.Standard;

	/// <summary>Achievement rarity.</summary>
	public AchievementRarity Rarity { get; init; } = AchievementRarity.Common;

	/// <summary>Point value.</summary>
	public int Points { get; init; } = 10;

	/// <summary>Whether achievement is hidden from list.</summary>
	public bool IsHidden { get; init; }

	/// <summary>Whether achievement description is hidden until unlocked.</summary>
	public bool IsSecret { get; init; }

	/// <summary>Unlock conditions.</summary>
	public IReadOnlyList<AchievementCondition> Conditions { get; init; } = [];

	/// <summary>Prerequisites (other achievements).</summary>
	public IReadOnlyList<string> Prerequisites { get; init; } = [];

	/// <summary>Rewards for unlocking.</summary>
	public IReadOnlyList<AchievementReward> Rewards { get; init; } = [];

	/// <summary>Icon identifier.</summary>
	public string? IconId { get; init; }

	/// <summary>Locked icon identifier.</summary>
	public string? LockedIconId { get; init; }

	/// <summary>Logic for combining conditions.</summary>
	public ConditionLogic ConditionLogic { get; init; } = ConditionLogic.All;

	/// <summary>Number of conditions required when using Count logic.</summary>
	public int? RequiredConditionCount { get; init; }
}

/// <summary>
/// Achievement category for organization.
/// </summary>
public record AchievementCategory {
	/// <summary>Category ID.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Category description.</summary>
	public string? Description { get; init; }

	/// <summary>Sort order.</summary>
	public int SortOrder { get; init; }

	/// <summary>Icon identifier.</summary>
	public string? IconId { get; init; }
}

/// <summary>
/// Condition for unlocking an achievement.
/// </summary>
public record AchievementCondition {
	/// <summary>Stat/variable name to check.</summary>
	public required string StatName { get; init; }

	/// <summary>Comparison type.</summary>
	public ComparisonType Comparison { get; init; } = ComparisonType.GreaterOrEqual;

	/// <summary>Target value.</summary>
	public int TargetValue { get; init; }

	/// <summary>Description of this condition.</summary>
	public string? Description { get; init; }
}

/// <summary>
/// Reward for unlocking an achievement.
/// </summary>
public record AchievementReward {
	/// <summary>Reward type.</summary>
	public AchievementRewardType Type { get; init; }

	/// <summary>Item/unlock ID.</summary>
	public string? ItemId { get; init; }

	/// <summary>Reward amount.</summary>
	public int Amount { get; init; }

	/// <summary>Reward description.</summary>
	public string? Description { get; init; }
}

/// <summary>
/// Schema configuration.
/// </summary>
public record AchievementSchema {
	/// <summary>Maximum achievement name length.</summary>
	public int MaxNameLength { get; init; } = 64;

	/// <summary>Maximum description length.</summary>
	public int MaxDescriptionLength { get; init; } = 256;

	/// <summary>Valid stat names for conditions.</summary>
	public HashSet<string> ValidStatNames { get; init; } = [];
}

#endregion

#region Enums

/// <summary>
/// Achievement type.
/// </summary>
public enum AchievementType {
	/// <summary>Standard one-time achievement.</summary>
	Standard,
	/// <summary>Progressive/incremental achievement.</summary>
	Progressive,
	/// <summary>Story-related achievement.</summary>
	Story,
	/// <summary>Collection achievement.</summary>
	Collection,
	/// <summary>Challenge/difficulty achievement.</summary>
	Challenge,
	/// <summary>Multiplayer achievement.</summary>
	Multiplayer,
	/// <summary>DLC/expansion achievement.</summary>
	DLC
}

/// <summary>
/// Achievement rarity.
/// </summary>
public enum AchievementRarity {
	/// <summary>Common - most players unlock.</summary>
	Common,
	/// <summary>Uncommon - many players unlock.</summary>
	Uncommon,
	/// <summary>Rare - some players unlock.</summary>
	Rare,
	/// <summary>Epic - few players unlock.</summary>
	Epic,
	/// <summary>Legendary - very few unlock.</summary>
	Legendary,
	/// <summary>Platinum - completion achievement.</summary>
	Platinum
}

/// <summary>
/// Comparison type for conditions.
/// </summary>
public enum ComparisonType {
	/// <summary>Greater than or equal.</summary>
	GreaterOrEqual,
	/// <summary>Greater than.</summary>
	Greater,
	/// <summary>Equal to.</summary>
	Equal,
	/// <summary>Less than.</summary>
	Less,
	/// <summary>Less than or equal.</summary>
	LessOrEqual,
	/// <summary>Not equal.</summary>
	NotEqual
}

/// <summary>
/// Logic for multiple conditions.
/// </summary>
public enum ConditionLogic {
	/// <summary>All conditions must be met.</summary>
	All,
	/// <summary>Any condition can trigger.</summary>
	Any,
	/// <summary>A specific count of conditions.</summary>
	Count
}

/// <summary>
/// Achievement reward type.
/// </summary>
public enum AchievementRewardType {
	/// <summary>Currency reward.</summary>
	Currency,
	/// <summary>Item reward.</summary>
	Item,
	/// <summary>Unlock (cosmetic, feature, etc.).</summary>
	Unlock,
	/// <summary>Experience points.</summary>
	Experience,
	/// <summary>Title/badge.</summary>
	Title
}

/// <summary>
/// Validation error type.
/// </summary>
public enum AchievementValidationErrorType {
	/// <summary>Missing required field.</summary>
	MissingRequired,
	/// <summary>Invalid value.</summary>
	InvalidValue,
	/// <summary>Duplicate ID.</summary>
	DuplicateId,
	/// <summary>Invalid category reference.</summary>
	InvalidCategory,
	/// <summary>Invalid prerequisite reference.</summary>
	InvalidPrerequisite,
	/// <summary>Circular prerequisite.</summary>
	CircularPrerequisite,
	/// <summary>No conditions defined.</summary>
	NoConditions
}

#endregion

#region Result Types

/// <summary>
/// Progress for a single condition.
/// </summary>
public record ConditionProgress {
	/// <summary>Stat name.</summary>
	public required string StatName { get; init; }

	/// <summary>Current value.</summary>
	public int CurrentValue { get; init; }

	/// <summary>Target value.</summary>
	public int TargetValue { get; init; }

	/// <summary>Whether condition is met.</summary>
	public bool IsMet { get; init; }

	/// <summary>Percent complete (0-100).</summary>
	public int PercentComplete { get; init; }
}

/// <summary>
/// Progress for an achievement.
/// </summary>
public record AchievementProgress {
	/// <summary>Achievement ID.</summary>
	public required string AchievementId { get; init; }

	/// <summary>Whether achievement is unlocked.</summary>
	public bool IsUnlocked { get; init; }

	/// <summary>Progress for each condition.</summary>
	public IReadOnlyList<ConditionProgress> ConditionProgress { get; init; } = [];

	/// <summary>Overall percent complete.</summary>
	public int OverallPercent { get; init; }
}

/// <summary>
/// Validation error.
/// </summary>
public record AchievementValidationError {
	/// <summary>Achievement ID (if applicable).</summary>
	public string? AchievementId { get; init; }

	/// <summary>Error type.</summary>
	public AchievementValidationErrorType Type { get; init; }

	/// <summary>Error message.</summary>
	public required string Message { get; init; }
}

/// <summary>
/// Validation result.
/// </summary>
public record AchievementValidationResult {
	/// <summary>Whether validation passed.</summary>
	public bool IsValid { get; init; }

	/// <summary>Validation errors.</summary>
	public IReadOnlyList<AchievementValidationError> Errors { get; init; } = [];
}

/// <summary>
/// Achievement system statistics.
/// </summary>
public record AchievementStats {
	/// <summary>Total achievements.</summary>
	public int TotalAchievements { get; init; }

	/// <summary>Total categories.</summary>
	public int TotalCategories { get; init; }

	/// <summary>Total possible points.</summary>
	public int TotalPoints { get; init; }

	/// <summary>Count by type.</summary>
	public Dictionary<AchievementType, int> ByType { get; init; } = [];

	/// <summary>Count by rarity.</summary>
	public Dictionary<AchievementRarity, int> ByRarity { get; init; } = [];

	/// <summary>Count by category.</summary>
	public Dictionary<string, int> ByCategory { get; init; } = [];

	/// <summary>Hidden achievement count.</summary>
	public int HiddenCount { get; init; }

	/// <summary>Secret achievement count.</summary>
	public int SecretCount { get; init; }
}

/// <summary>
/// Player completion statistics.
/// </summary>
public record CompletionStats {
	/// <summary>Unlocked achievement count.</summary>
	public int UnlockedCount { get; init; }

	/// <summary>Total achievement count.</summary>
	public int TotalCount { get; init; }

	/// <summary>Unlocked points.</summary>
	public int UnlockedPoints { get; init; }

	/// <summary>Total points.</summary>
	public int TotalPoints { get; init; }

	/// <summary>Completion percentage.</summary>
	public int CompletionPercent { get; init; }

	/// <summary>Points percentage.</summary>
	public int PointsPercent { get; init; }
}

/// <summary>
/// Export format.
/// </summary>
internal record AchievementExport {
	public AchievementSchema? Schema { get; init; }
	public List<AchievementCategory> Categories { get; init; } = [];
	public List<Achievement> Achievements { get; init; } = [];
}

#endregion

/// <summary>
/// Extension for Achievement to support condition count logic.
/// </summary>
public static class AchievementExtensions {
	/// <summary>
	/// Create a modified achievement with condition logic.
	/// </summary>
	public static Achievement WithConditionLogic(this Achievement achievement, ConditionLogic logic, int? requiredCount = null) {
		return achievement with {
			ConditionLogic = logic,
			RequiredConditionCount = requiredCount
		};
	}
}
