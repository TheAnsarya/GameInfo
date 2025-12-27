using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data.Robotrek;

/// <summary>
/// Statistics and analytics for Robotrek ROM data.
/// </summary>
public class RobotrekStats {
	public int TotalItems { get; set; }
	public int WeaponCount { get; set; }
	public int ArmorCount { get; set; }
	public int InventCount { get; set; }
	public int UseItemCount { get; set; }
	public int KeyItemCount { get; set; }

	public int TotalEnemies { get; set; }
	public int BossCount { get; set; }
	public int RegularEnemyCount { get; set; }

	public int TotalInventions { get; set; }
	public int WeaponInventions { get; set; }
	public int ArmorInventions { get; set; }
	public int ProgramInventions { get; set; }
	public int OtherInventions { get; set; }

	public int TotalTextStrings { get; set; }
	public int TotalTextBytes { get; set; }

	public int TotalSpriteTiles { get; set; }
	public int TotalSpriteBytes { get; set; }

	/// <summary>
	/// Generate statistics from loaded data.
	/// </summary>
	public static RobotrekStats FromEditor(RobotrekEditor editor) {
		var stats = new RobotrekStats();

		// Item statistics
		var items = editor.GetItems();
		stats.TotalItems = items.Count;
		stats.WeaponCount = items.Count(i => i.Type == RobotrekItemType.Weapon);
		stats.ArmorCount = items.Count(i => i.Type == RobotrekItemType.Armor);
		stats.InventCount = items.Count(i => i.Type == RobotrekItemType.Invent);
		stats.UseItemCount = items.Count(i => i.Type == RobotrekItemType.UseItem);
		stats.KeyItemCount = items.Count(i => i.Type == RobotrekItemType.KeyItem);

		// Enemy statistics
		var enemies = editor.GetEnemies();
		stats.TotalEnemies = enemies.Count;
		stats.BossCount = enemies.Count(e => e.IsBoss);
		stats.RegularEnemyCount = enemies.Count(e => !e.IsBoss);

		// Invention statistics
		var inventions = editor.GetInventions();
		stats.TotalInventions = inventions.Count;
		stats.WeaponInventions = inventions.Count(i => i.Type == RobotrekItemType.Weapon);
		stats.ArmorInventions = inventions.Count(i => i.Type == RobotrekItemType.Armor);
		stats.ProgramInventions = inventions.Count(i => i.Type == RobotrekItemType.Invent);
		stats.OtherInventions = inventions.Count(i =>
			i.Type != RobotrekItemType.Weapon &&
			i.Type != RobotrekItemType.Armor &&
			i.Type != RobotrekItemType.Invent);

		return stats;
	}

	/// <summary>
	/// Format as human-readable report.
	/// </summary>
	public string ToReport() {
		return $"""
			Robotrek ROM Statistics
			========================

			Items ({TotalItems} total):
			  Weapons: {WeaponCount}
			  Armor: {ArmorCount}
			  Invent Items: {InventCount}
			  Use Items: {UseItemCount}
			  Key Items: {KeyItemCount}

			Enemies ({TotalEnemies} total):
			  Bosses: {BossCount}
			  Regular: {RegularEnemyCount}

			Inventions ({TotalInventions} total):
			  Weapons: {WeaponInventions}
			  Armor: {ArmorInventions}
			  Programs: {ProgramInventions}
			  Other: {OtherInventions}

			Text Data:
			  Strings: {TotalTextStrings}
			  Bytes: {TotalTextBytes:N0}

			Sprite Data:
			  Tiles: {TotalSpriteTiles}
			  Bytes: {TotalSpriteBytes:N0}
			""";
	}

	/// <summary>
	/// Serialize to JSON.
	/// </summary>
	public string ToJson() {
		var options = new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		};
		return JsonSerializer.Serialize(this, options);
	}
}

/// <summary>
/// Balance analysis for game data.
/// </summary>
public class RobotrekBalance {
	public List<string> Issues { get; } = new();
	public List<string> Warnings { get; } = new();
	public List<string> Suggestions { get; } = new();

	/// <summary>
	/// Analyze item balance.
	/// </summary>
	public void AnalyzeItems(List<RobotrekItem> items) {
		// Check for missing names
		var unnamed = items.Where(i => string.IsNullOrEmpty(i.Name)).ToList();
		if (unnamed.Count > 0) {
			Warnings.Add($"{unnamed.Count} items have no name");
		}

		// Check for zero power weapons
		var zeroWeapons = items.Where(i =>
			i.Type == RobotrekItemType.Weapon && i.Power == 0).ToList();
		if (zeroWeapons.Count > 0) {
			Issues.Add($"{zeroWeapons.Count} weapons have 0 power");
		}

		// Check price distribution
		var prices = items.Where(i => i.Price > 0).Select(i => (int)i.Price).ToList();
		if (prices.Count > 0) {
			var avg = prices.Average();
			var max = prices.Max();
			var min = prices.Min();
			if (max > avg * 10) {
				Suggestions.Add($"Large price variance: min={min}, avg={avg:F0}, max={max}");
			}
		}
	}

	/// <summary>
	/// Analyze enemy balance.
	/// </summary>
	public void AnalyzeEnemies(List<RobotrekEnemy> enemies) {
		// Check for zero HP enemies
		var zeroHp = enemies.Where(e => e.HP == 0).ToList();
		if (zeroHp.Count > 0) {
			Issues.Add($"{zeroHp.Count} enemies have 0 HP");
		}

		// Check for zero EXP
		var zeroExp = enemies.Where(e => e.ExpReward == 0 && !e.IsBoss).ToList();
		if (zeroExp.Count > 0) {
			Warnings.Add($"{zeroExp.Count} non-boss enemies give 0 EXP");
		}

		// HP progression
		var hpValues = enemies.Where(e => e.HP > 0).Select(e => (int)e.HP).ToList();
		if (hpValues.Count > 0) {
			var avg = hpValues.Average();
			Suggestions.Add($"Enemy HP range: {hpValues.Min()} - {hpValues.Max()} (avg: {avg:F0})");
		}
	}

	/// <summary>
	/// Analyze invention recipes.
	/// </summary>
	public void AnalyzeInventions(List<RobotrekInvention> inventions) {
		// Check for impossible recipes (require too many ingredients)
		var tooMany = inventions.Where(i =>
			i.Ingredient1 > 0 && i.Ingredient2 > 0 && i.Ingredient3 > 0).ToList();
		if (tooMany.Count > 10) {
			Suggestions.Add($"{tooMany.Count} inventions require 3 ingredients - may be difficult");
		}

		// Check for duplicate recipes
		var recipes = inventions
			.Select(i => $"{i.Ingredient1},{i.Ingredient2},{i.Ingredient3}")
			.ToList();
		var dupes = recipes.GroupBy(r => r)
			.Where(g => g.Count() > 1)
			.Select(g => g.Key)
			.ToList();
		if (dupes.Count > 0) {
			Issues.Add($"{dupes.Count} duplicate recipes found");
		}
	}

	/// <summary>
	/// Format analysis results.
	/// </summary>
	public string ToReport() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("Robotrek Balance Analysis");
		sb.AppendLine("=========================\n");

		if (Issues.Count > 0) {
			sb.AppendLine("ISSUES:");
			foreach (var issue in Issues) {
				sb.AppendLine($"  ❌ {issue}");
			}

			sb.AppendLine();
		}

		if (Warnings.Count > 0) {
			sb.AppendLine("WARNINGS:");
			foreach (var warning in Warnings) {
				sb.AppendLine($"  ⚠️ {warning}");
			}

			sb.AppendLine();
		}

		if (Suggestions.Count > 0) {
			sb.AppendLine("SUGGESTIONS:");
			foreach (var suggestion in Suggestions) {
				sb.AppendLine($"  💡 {suggestion}");
			}
		}

		if (Issues.Count == 0 && Warnings.Count == 0) {
			sb.AppendLine("✅ No balance issues detected");
		}

		return sb.ToString();
	}
}
