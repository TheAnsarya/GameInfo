using System.Text.Json;

namespace GameInfoTools.Data.SoulBlazer;

/// <summary>
/// Statistics for Soul Blazer ROM data.
/// </summary>
public class SoulBlazerStats {
	// Item statistics
	public int TotalItems { get; set; }
	public int WeaponCount { get; set; }
	public int ArmorCount { get; set; }
	public int AccessoryCount { get; set; }
	public int ConsumableCount { get; set; }
	public int KeyItemCount { get; set; }

	// Enemy statistics
	public int TotalEnemies { get; set; }
	public int BossCount { get; set; }
	public int RegularEnemyCount { get; set; }
	public int AverageEnemyHp { get; set; }
	public int MaxEnemyHp { get; set; }

	// Soul lair statistics
	public int TotalSoulLairs { get; set; }
	public int VillagerLairs { get; set; }
	public int AnimalLairs { get; set; }
	public int PlantLairs { get; set; }

	/// <summary>
	/// Generate stats from editor data.
	/// </summary>
	public static SoulBlazerStats FromEditor(SoulBlazerEditor editor) {
		var stats = new SoulBlazerStats {
			TotalItems = editor.Items.Count,
			TotalEnemies = editor.Enemies.Count,
			TotalSoulLairs = editor.SoulLairs.Count
		};

		// Item type counts
		stats.WeaponCount = editor.Items.Count(i => i.ItemType == SoulBlazerItemType.Weapon);
		stats.ArmorCount = editor.Items.Count(i => i.ItemType == SoulBlazerItemType.Armor);
		stats.AccessoryCount = editor.Items.Count(i => i.ItemType == SoulBlazerItemType.Accessory);
		stats.ConsumableCount = editor.Items.Count(i => i.ItemType == SoulBlazerItemType.Consumable);
		stats.KeyItemCount = editor.Items.Count(i => i.ItemType == SoulBlazerItemType.KeyItem);

		// Enemy counts
		stats.BossCount = editor.Enemies.Count(e => e.IsBoss);
		stats.RegularEnemyCount = editor.Enemies.Count(e => !e.IsBoss);

		if (editor.Enemies.Count > 0) {
			stats.AverageEnemyHp = (int)editor.Enemies.Average(e => e.HP);
			stats.MaxEnemyHp = editor.Enemies.Max(e => e.HP);
		}

		// Soul lair counts
		stats.VillagerLairs = editor.SoulLairs.Count(l => l.ReleaseType == SoulBlazerReleaseType.Villager);
		stats.AnimalLairs = editor.SoulLairs.Count(l => l.ReleaseType == SoulBlazerReleaseType.Animal);
		stats.PlantLairs = editor.SoulLairs.Count(l => l.ReleaseType == SoulBlazerReleaseType.Plant);

		return stats;
	}

	/// <summary>
	/// Generate formatted report.
	/// </summary>
	public string ToReport() {
		return $$"""
			Soul Blazer Statistics Report
			==============================

			Items ({{TotalItems}} total):
			  Weapons:     {{WeaponCount}}
			  Armor:       {{ArmorCount}}
			  Accessories: {{AccessoryCount}}
			  Consumables: {{ConsumableCount}}
			  Key Items:   {{KeyItemCount}}

			Enemies ({{TotalEnemies}} total):
			  Bosses:       {{BossCount}}
			  Regular:      {{RegularEnemyCount}}
			  Average HP:   {{AverageEnemyHp}}
			  Max HP:       {{MaxEnemyHp}}

			Soul Lairs ({{TotalSoulLairs}} total):
			  Villager Lairs: {{VillagerLairs}}
			  Animal Lairs:   {{AnimalLairs}}
			  Plant Lairs:    {{PlantLairs}}
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
/// Balance analysis for Soul Blazer data.
/// </summary>
public class SoulBlazerBalance {
	public List<string> Issues { get; } = [];
	public List<string> Warnings { get; } = [];
	public List<string> Suggestions { get; } = [];

	/// <summary>
	/// Analyze item balance.
	/// </summary>
	public void AnalyzeItems(List<SoulBlazerItem> items) {
		// Check for weapons with no power
		var weakWeapons = items.Where(i => i.ItemType == SoulBlazerItemType.Weapon && i.Power == 0).ToList();
		if (weakWeapons.Count > 0) {
			Issues.Add($"{weakWeapons.Count} weapons have 0 power");
		}

		// Check price distribution
		var prices = items.Where(i => i.Price > 0).Select(i => (int)i.Price).ToList();
		if (prices.Count > 0) {
			var avg = prices.Average();
			var max = prices.Max();
			if (max > avg * 10) {
				Suggestions.Add($"Large price variance: max={max}, avg={avg:F0}");
			}
		}
	}

	/// <summary>
	/// Analyze enemy balance.
	/// </summary>
	public void AnalyzeEnemies(List<SoulBlazerEnemy> enemies) {
		// Check for zero HP enemies
		var zeroHp = enemies.Where(e => e.HP == 0).ToList();
		if (zeroHp.Count > 0) {
			Issues.Add($"{zeroHp.Count} enemies have 0 HP");
		}

		// Check for zero EXP non-bosses
		var zeroExp = enemies.Where(e => e.Exp == 0 && !e.IsBoss).ToList();
		if (zeroExp.Count > 0) {
			Warnings.Add($"{zeroExp.Count} non-boss enemies give 0 EXP");
		}

		// HP progression analysis
		var hpValues = enemies.Where(e => e.HP > 0).Select(e => (int)e.HP).ToList();
		if (hpValues.Count > 0) {
			Suggestions.Add($"Enemy HP range: {hpValues.Min()} - {hpValues.Max()} (avg: {hpValues.Average():F0})");
		}
	}

	/// <summary>
	/// Analyze soul lairs.
	/// </summary>
	public void AnalyzeSoulLairs(List<SoulBlazerSoulLair> lairs) {
		// Check for lairs with no enemies
		var emptyLairs = lairs.Where(l => l.EnemyCount == 0).ToList();
		if (emptyLairs.Count > 0) {
			Warnings.Add($"{emptyLairs.Count} soul lairs have 0 enemies");
		}

		// Check release type distribution
		var releaseTypes = lairs.GroupBy(l => l.ReleaseType)
			.Select(g => $"{g.Key}: {g.Count()}")
			.ToList();
		if (releaseTypes.Count > 0) {
			Suggestions.Add($"Release type distribution: {string.Join(", ", releaseTypes)}");
		}
	}

	/// <summary>
	/// Format analysis results.
	/// </summary>
	public string ToReport() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("Soul Blazer Balance Analysis");
		sb.AppendLine("============================\n");

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
