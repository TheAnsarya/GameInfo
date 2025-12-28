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
		var items = editor.Items;
		stats.TotalItems = items.Count;
		stats.WeaponCount = items.Count(i => i.ItemType == RobotrekItemType.Weapon);
		stats.ArmorCount = items.Count(i => i.ItemType == RobotrekItemType.Armor);
		stats.InventCount = items.Count(i => i.ItemType == RobotrekItemType.RobotPart);
		stats.UseItemCount = items.Count(i => i.ItemType == RobotrekItemType.Consumable);
		stats.KeyItemCount = items.Count(i => i.ItemType == RobotrekItemType.KeyItem);

		// Enemy statistics
		var enemies = editor.Enemies;
		stats.TotalEnemies = enemies.Count;
		// Boss detection via AI pattern
		stats.BossCount = enemies.Count(e => e.AiPattern is RobotrekAiPattern.BossPhase1
			or RobotrekAiPattern.BossPhase2 or RobotrekAiPattern.BossSpecial);
		stats.RegularEnemyCount = stats.TotalEnemies - stats.BossCount;

		// Invention statistics (count by result item type - requires lookup)
		var inventions = editor.Inventions;
		stats.TotalInventions = inventions.Count;
		// Since we don't have direct type info on inventions, count all
		stats.WeaponInventions = 0;
		stats.ArmorInventions = 0;
		stats.ProgramInventions = 0;
		stats.OtherInventions = inventions.Count;

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
		// Check for zero power weapons
		var zeroWeapons = items.Where(i =>
			i.ItemType == RobotrekItemType.Weapon && i.PrimaryStat == 0).ToList();
		if (zeroWeapons.Count > 0) {
			Issues.Add($"{zeroWeapons.Count} weapons have 0 primary stat");
		}

		// Check price distribution
		var prices = items.Where(i => i.BuyPrice > 0).Select(i => (int)i.BuyPrice).ToList();
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

		// Check for zero EXP (non-boss enemies)
		var bosses = enemies.Where(e => e.AiPattern is RobotrekAiPattern.BossPhase1
			or RobotrekAiPattern.BossPhase2 or RobotrekAiPattern.BossSpecial).ToList();
		var zeroExp = enemies.Where(e => e.Exp == 0 && !bosses.Contains(e)).ToList();
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
		// Check for recipes requiring 3 ingredients
		var threeIngredients = inventions.Where(i =>
			i.Material1Id > 0 && i.Material2Id > 0 && i.Material3Id > 0).ToList();
		if (threeIngredients.Count > 10) {
			Suggestions.Add($"{threeIngredients.Count} inventions require 3 materials - may be difficult");
		}

		// Check for duplicate recipes
		var recipes = inventions
			.Select(i => $"{i.Material1Id},{i.Material2Id},{i.Material3Id}")
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
