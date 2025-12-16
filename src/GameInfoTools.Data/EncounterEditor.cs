using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Random encounter editor for RPG ROMs.
/// Handles encounter tables, enemy formations, and encounter rates.
/// </summary>
public class EncounterEditor {
	/// <summary>
	/// Type of encounter area.
	/// </summary>
	public enum AreaType {
		Overworld,
		Dungeon,
		Cave,
		Forest,
		Desert,
		Mountain,
		Water,
		Tower,
		Castle,
		Town,
		Special
	}

	/// <summary>
	/// Encounter group configuration.
	/// </summary>
	public class EncounterGroup {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public AreaType AreaType { get; set; }
		public int EncounterRate { get; set; }
		public List<EnemyFormation> Formations { get; } = [];
		public List<int> FormationWeights { get; } = [];
		public int MinLevel { get; set; }
		public int MaxLevel { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// A single enemy formation (battle group).
	/// </summary>
	public class EnemyFormation {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public List<FormationSlot> Slots { get; } = [];
		public int BackgroundId { get; set; }
		public int MusicId { get; set; }
		public bool IsBossFight { get; set; }
		public bool CanEscape { get; set; } = true;
		public bool CanSurprise { get; set; } = true;
		public int BaseGold { get; set; }
		public int BaseExperience { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// A single slot in an enemy formation.
	/// </summary>
	public class FormationSlot {
		public int Position { get; set; }
		public int EnemyId { get; set; }
		public string EnemyName { get; set; } = "";
		public int MinCount { get; set; } = 1;
		public int MaxCount { get; set; } = 1;
		public int XPosition { get; set; }
		public int YPosition { get; set; }
	}

	/// <summary>
	/// Schema for reading encounter tables from ROM.
	/// </summary>
	public class EncounterTableSchema {
		public string Name { get; set; } = "";
		public int BaseOffset { get; set; }
		public int GroupSize { get; set; }
		public int GroupCount { get; set; }
		public int FormationTableOffset { get; set; }
		public int FormationSize { get; set; }
		public int FormationCount { get; set; }
		public int MaxFormationsPerGroup { get; set; } = 8;
		public int MaxSlotsPerFormation { get; set; } = 8;

		// Field offsets within encounter group record
		public int EncounterRateOffset { get; set; } = 0;
		public int FormationIndexOffset { get; set; } = 1;

		// Field offsets within formation record
		public int EnemyIdOffset { get; set; } = 0;
		public int EnemyCountOffset { get; set; } = 1;
		public int BackgroundOffset { get; set; } = -1; // -1 means not present
		public int FlagsOffset { get; set; } = -1;
	}

	private readonly byte[] _data;
	private readonly List<EncounterGroup> _groups = [];
	private readonly List<EnemyFormation> _formations = [];
	private readonly Dictionary<int, string> _enemyNames = [];
	private EncounterTableSchema? _schema;

	public EncounterEditor(byte[] romData) {
		_data = romData;
	}

	/// <summary>
	/// Gets all loaded encounter groups.
	/// </summary>
	public IReadOnlyList<EncounterGroup> Groups => _groups;

	/// <summary>
	/// Gets all loaded formations.
	/// </summary>
	public IReadOnlyList<EnemyFormation> Formations => _formations;

	/// <summary>
	/// Sets the enemy name lookup table.
	/// </summary>
	public void SetEnemyNames(Dictionary<int, string> names) {
		_enemyNames.Clear();
		foreach (var kvp in names) {
			_enemyNames[kvp.Key] = kvp.Value;
		}
	}

	/// <summary>
	/// Gets an enemy name by ID.
	/// </summary>
	public string GetEnemyName(int id) {
		return _enemyNames.TryGetValue(id, out var name) ? name : $"Enemy #{id}";
	}

	/// <summary>
	/// Sets the encounter table schema.
	/// </summary>
	public void SetSchema(EncounterTableSchema schema) {
		_schema = schema;
	}

	/// <summary>
	/// Loads encounter data from ROM using the configured schema.
	/// </summary>
	public void LoadEncounters() {
		if (_schema == null) {
			throw new InvalidOperationException("Schema must be set before loading encounters");
		}

		_groups.Clear();
		_formations.Clear();

		// Load formations first
		LoadFormations();

		// Load encounter groups
		LoadGroups();
	}

	private void LoadFormations() {
		if (_schema == null) return;

		for (int i = 0; i < _schema.FormationCount; i++) {
			int offset = _schema.FormationTableOffset + (i * _schema.FormationSize);
			var formation = ReadFormation(offset, i);
			_formations.Add(formation);
		}
	}

	private void LoadGroups() {
		if (_schema == null) return;

		for (int i = 0; i < _schema.GroupCount; i++) {
			int offset = _schema.BaseOffset + (i * _schema.GroupSize);
			var group = ReadGroup(offset, i);
			_groups.Add(group);
		}
	}

	private EnemyFormation ReadFormation(int offset, int id) {
		if (_schema == null) return new EnemyFormation { Id = id };

		var formation = new EnemyFormation {
			Id = id,
			Name = $"Formation #{id}",
			RomOffset = offset
		};

		// Read enemy slots
		for (int slot = 0; slot < _schema.MaxSlotsPerFormation; slot++) {
			int slotOffset = offset + _schema.EnemyIdOffset + (slot * 2); // Assume 2 bytes per slot
			if (slotOffset >= _data.Length) break;

			int enemyId = _data[slotOffset];
			if (enemyId == 0 || enemyId == 0xff) continue; // Empty slot

			int count = 1;
			if (_schema.EnemyCountOffset >= 0) {
				int countOffset = offset + _schema.EnemyCountOffset + slot;
				if (countOffset < _data.Length) {
					count = Math.Max(1, _data[countOffset] & 0x0f);
				}
			}

			formation.Slots.Add(new FormationSlot {
				Position = slot,
				EnemyId = enemyId,
				EnemyName = GetEnemyName(enemyId),
				MinCount = count,
				MaxCount = count
			});
		}

		// Read background if present
		if (_schema.BackgroundOffset >= 0 && offset + _schema.BackgroundOffset < _data.Length) {
			formation.BackgroundId = _data[offset + _schema.BackgroundOffset];
		}

		// Read flags if present
		if (_schema.FlagsOffset >= 0 && offset + _schema.FlagsOffset < _data.Length) {
			byte flags = _data[offset + _schema.FlagsOffset];
			formation.IsBossFight = (flags & 0x01) != 0;
			formation.CanEscape = (flags & 0x02) == 0;
			formation.CanSurprise = (flags & 0x04) == 0;
		}

		return formation;
	}

	private EncounterGroup ReadGroup(int offset, int id) {
		if (_schema == null) return new EncounterGroup { Id = id };

		var group = new EncounterGroup {
			Id = id,
			Name = $"Area #{id}",
			RomOffset = offset
		};

		// Read encounter rate
		if (_schema.EncounterRateOffset >= 0 && offset + _schema.EncounterRateOffset < _data.Length) {
			group.EncounterRate = _data[offset + _schema.EncounterRateOffset];
		}

		// Read formation indices
		for (int i = 0; i < _schema.MaxFormationsPerGroup; i++) {
			int indexOffset = offset + _schema.FormationIndexOffset + i;
			if (indexOffset >= _data.Length) break;

			int formationIndex = _data[indexOffset];
			if (formationIndex == 0xff) break; // End marker

			if (formationIndex < _formations.Count) {
				group.Formations.Add(_formations[formationIndex]);
				group.FormationWeights.Add(1); // Default weight
			}
		}

		return group;
	}

	/// <summary>
	/// Gets an encounter group by ID.
	/// </summary>
	public EncounterGroup? GetGroup(int id) {
		return _groups.FirstOrDefault(g => g.Id == id);
	}

	/// <summary>
	/// Gets a formation by ID.
	/// </summary>
	public EnemyFormation? GetFormation(int id) {
		return _formations.FirstOrDefault(f => f.Id == id);
	}

	/// <summary>
	/// Gets groups by area type.
	/// </summary>
	public List<EncounterGroup> GetGroupsByAreaType(AreaType areaType) {
		return _groups.Where(g => g.AreaType == areaType).ToList();
	}

	/// <summary>
	/// Gets formations containing a specific enemy.
	/// </summary>
	public List<EnemyFormation> GetFormationsWithEnemy(int enemyId) {
		return _formations
			.Where(f => f.Slots.Any(s => s.EnemyId == enemyId))
			.ToList();
	}

	/// <summary>
	/// Gets all enemies used in encounter tables.
	/// </summary>
	public List<(int Id, string Name, int FormationCount)> GetUsedEnemies() {
		var enemyCounts = new Dictionary<int, int>();

		foreach (var formation in _formations) {
			foreach (var slot in formation.Slots) {
				if (!enemyCounts.ContainsKey(slot.EnemyId)) {
					enemyCounts[slot.EnemyId] = 0;
				}
				enemyCounts[slot.EnemyId]++;
			}
		}

		return enemyCounts
			.Select(kvp => (kvp.Key, GetEnemyName(kvp.Key), kvp.Value))
			.OrderBy(x => x.Item1)
			.ToList();
	}

	/// <summary>
	/// Updates an encounter group's encounter rate.
	/// </summary>
	public void SetEncounterRate(int groupId, int rate) {
		if (_schema == null) return;

		var group = GetGroup(groupId);
		if (group == null) return;

		group.EncounterRate = rate;

		int offset = group.RomOffset + _schema.EncounterRateOffset;
		if (offset < _data.Length) {
			_data[offset] = (byte)Math.Clamp(rate, 0, 255);
		}
	}

	/// <summary>
	/// Replaces an enemy in a formation.
	/// </summary>
	public void ReplaceEnemy(int formationId, int slotIndex, int newEnemyId) {
		if (_schema == null) return;

		var formation = GetFormation(formationId);
		if (formation == null || slotIndex >= formation.Slots.Count) return;

		var slot = formation.Slots[slotIndex];
		slot.EnemyId = newEnemyId;
		slot.EnemyName = GetEnemyName(newEnemyId);

		int offset = formation.RomOffset + _schema.EnemyIdOffset + (slotIndex * 2);
		if (offset < _data.Length) {
			_data[offset] = (byte)newEnemyId;
		}
	}

	/// <summary>
	/// Sets the enemy count in a formation slot.
	/// </summary>
	public void SetEnemyCount(int formationId, int slotIndex, int count) {
		if (_schema == null || _schema.EnemyCountOffset < 0) return;

		var formation = GetFormation(formationId);
		if (formation == null || slotIndex >= formation.Slots.Count) return;

		var slot = formation.Slots[slotIndex];
		slot.MinCount = count;
		slot.MaxCount = count;

		int offset = formation.RomOffset + _schema.EnemyCountOffset + slotIndex;
		if (offset < _data.Length) {
			_data[offset] = (byte)Math.Clamp(count, 1, 15);
		}
	}

	/// <summary>
	/// Exports encounter data to JSON.
	/// </summary>
	public string ExportToJson() {
		var export = new {
			Formations = _formations,
			Groups = _groups
		};

		return JsonSerializer.Serialize(export, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Gets encounter statistics.
	/// </summary>
	public EncounterStatistics GetStatistics() {
		var usedEnemies = GetUsedEnemies();
		int totalSlots = _formations.Sum(f => f.Slots.Count);
		int bossFormations = _formations.Count(f => f.IsBossFight);
		int avgFormationsPerGroup = _groups.Count > 0 ? _groups.Sum(g => g.Formations.Count) / _groups.Count : 0;

		return new EncounterStatistics(
			GroupCount: _groups.Count,
			FormationCount: _formations.Count,
			UniqueEnemyCount: usedEnemies.Count,
			TotalSlots: totalSlots,
			BossFormationCount: bossFormations,
			AverageFormationsPerGroup: avgFormationsPerGroup,
			AverageEncounterRate: _groups.Count > 0 ? _groups.Average(g => g.EncounterRate) : 0
		);
	}

	/// <summary>
	/// Statistics about the encounter database.
	/// </summary>
	public record EncounterStatistics(
		int GroupCount,
		int FormationCount,
		int UniqueEnemyCount,
		int TotalSlots,
		int BossFormationCount,
		int AverageFormationsPerGroup,
		double AverageEncounterRate
	);

	/// <summary>
	/// Creates a schema for NES-style encounter tables.
	/// </summary>
	public static EncounterTableSchema CreateNesSchema(
		int groupTableOffset, int groupSize, int groupCount,
		int formationTableOffset, int formationSize, int formationCount) {
		return new EncounterTableSchema {
			Name = "NES Encounters",
			BaseOffset = groupTableOffset,
			GroupSize = groupSize,
			GroupCount = groupCount,
			FormationTableOffset = formationTableOffset,
			FormationSize = formationSize,
			FormationCount = formationCount,
			MaxFormationsPerGroup = 4,
			MaxSlotsPerFormation = 4,
			EncounterRateOffset = 0,
			FormationIndexOffset = 1,
			EnemyIdOffset = 0,
			EnemyCountOffset = -1, // Not used
			BackgroundOffset = -1,
			FlagsOffset = -1
		};
	}

	/// <summary>
	/// Creates a schema for SNES-style encounter tables.
	/// </summary>
	public static EncounterTableSchema CreateSnesSchema(
		int groupTableOffset, int groupSize, int groupCount,
		int formationTableOffset, int formationSize, int formationCount) {
		return new EncounterTableSchema {
			Name = "SNES Encounters",
			BaseOffset = groupTableOffset,
			GroupSize = groupSize,
			GroupCount = groupCount,
			FormationTableOffset = formationTableOffset,
			FormationSize = formationSize,
			FormationCount = formationCount,
			MaxFormationsPerGroup = 8,
			MaxSlotsPerFormation = 6,
			EncounterRateOffset = 0,
			FormationIndexOffset = 2,
			EnemyIdOffset = 0,
			EnemyCountOffset = 1,
			BackgroundOffset = formationSize - 2,
			FlagsOffset = formationSize - 1
		};
	}
}
