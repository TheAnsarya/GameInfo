using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

#region Base Classes

/// <summary>
/// Base class for game data editors with common functionality.
/// </summary>
/// <typeparam name="TSchema">Schema type for the data format.</typeparam>
/// <typeparam name="TRecord">Record type being edited.</typeparam>
public abstract class GameDataEditor<TSchema, TRecord>
	where TSchema : class, new()
	where TRecord : class, new() {

	protected readonly byte[] _data;
	protected TSchema? _schema;
	protected readonly List<TRecord> _records = [];

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public TSchema? Schema => _schema;

	/// <summary>
	/// Gets all loaded records.
	/// </summary>
	public IReadOnlyList<TRecord> Records => _records;

	/// <summary>
	/// Gets the number of records.
	/// </summary>
	public int Count => _records.Count;

	protected GameDataEditor(byte[] data) {
		_data = data ?? throw new ArgumentNullException(nameof(data));
	}

	/// <summary>
	/// Loads schema from JSON.
	/// </summary>
	public virtual void LoadSchema(string json) {
		_schema = JsonSerializer.Deserialize<TSchema>(json)
			?? throw new InvalidOperationException("Failed to deserialize schema");
	}

	/// <summary>
	/// Loads schema from file.
	/// </summary>
	public void LoadSchemaFromFile(string path) {
		LoadSchema(File.ReadAllText(path));
	}

	/// <summary>
	/// Extracts records from ROM data using the loaded schema.
	/// </summary>
	public abstract void Extract();

	/// <summary>
	/// Writes modified records back to ROM data.
	/// </summary>
	public abstract void Apply();

	/// <summary>
	/// Gets a record by index.
	/// </summary>
	public TRecord? Get(int index) =>
		index >= 0 && index < _records.Count ? _records[index] : null;

	/// <summary>
	/// Sets a record by index.
	/// </summary>
	public void Set(int index, TRecord record) {
		if (index >= 0 && index < _records.Count) {
			_records[index] = record;
		}
	}

	/// <summary>
	/// Exports records to JSON.
	/// </summary>
	public string ExportJson(bool indented = true) {
		return JsonSerializer.Serialize(_records, new JsonSerializerOptions {
			WriteIndented = indented,
			DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
		});
	}

	/// <summary>
	/// Imports records from JSON.
	/// </summary>
	public void ImportJson(string json) {
		var imported = JsonSerializer.Deserialize<List<TRecord>>(json);
		if (imported != null) {
			_records.Clear();
			_records.AddRange(imported);
		}
	}

	/// <summary>
	/// Validates all records.
	/// </summary>
	public abstract List<string> Validate();

	/// <summary>
	/// Clears all records.
	/// </summary>
	public void Clear() => _records.Clear();

	// Helper methods for reading data
	protected int ReadByte(int offset) =>
		offset >= 0 && offset < _data.Length ? _data[offset] : 0;

	protected int ReadWord(int offset) =>
		offset >= 0 && offset + 1 < _data.Length
			? _data[offset] | (_data[offset + 1] << 8)
			: 0;

	protected int ReadWordBE(int offset) =>
		offset >= 0 && offset + 1 < _data.Length
			? (_data[offset] << 8) | _data[offset + 1]
			: 0;

	protected void WriteByte(int offset, int value) {
		if (offset >= 0 && offset < _data.Length) {
			_data[offset] = (byte)value;
		}
	}

	protected void WriteWord(int offset, int value) {
		if (offset >= 0 && offset + 1 < _data.Length) {
			_data[offset] = (byte)(value & 0xFF);
			_data[offset + 1] = (byte)((value >> 8) & 0xFF);
		}
	}

	protected void WriteWordBE(int offset, int value) {
		if (offset >= 0 && offset + 1 < _data.Length) {
			_data[offset] = (byte)((value >> 8) & 0xFF);
			_data[offset + 1] = (byte)(value & 0xFF);
		}
	}
}

#endregion

#region Shop Editor

/// <summary>
/// Schema for shop data.
/// </summary>
public class ShopSchema {
	public string Name { get; set; } = "";
	public int TableOffset { get; set; }
	public int ShopCount { get; set; }
	public int RecordSize { get; set; } = 8;
	public int MaxItemsPerShop { get; set; } = 8;
	public int ItemIdSize { get; set; } = 1; // 1 or 2 bytes
	public int TerminatorValue { get; set; } = 0xFF;
	public bool HasPriceModifiers { get; set; } = false;
	public int PriceModifierOffset { get; set; } = -1;
	public ShopFormat Format { get; set; } = ShopFormat.FixedSlots;
}

/// <summary>
/// Shop data format.
/// </summary>
public enum ShopFormat {
	FixedSlots,     // Fixed number of item slots
	Terminated,     // Item list with terminator
	PointerTable    // Pointer to item list
}

/// <summary>
/// Shop type enumeration.
/// </summary>
public enum ShopType {
	General,
	Weapon,
	Armor,
	Item,
	Magic,
	Inn,
	Special
}

/// <summary>
/// Represents a shop with its inventory.
/// </summary>
public class Shop {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public ShopType Type { get; set; } = ShopType.General;
	public List<ShopItem> Items { get; set; } = [];
	public int PriceModifier { get; set; } = 100; // Percentage
	public int RomOffset { get; set; }
	public int LocationId { get; set; } = -1;
}

/// <summary>
/// Item in a shop.
/// </summary>
public class ShopItem {
	public int ItemId { get; set; }
	public string Name { get; set; } = "";
	public int Quantity { get; set; } = -1; // -1 = unlimited
	public int CustomPrice { get; set; } = -1; // -1 = use default
	public bool Available { get; set; } = true;
}

/// <summary>
/// Editor for shop data.
/// </summary>
public class ShopEditor : GameDataEditor<ShopSchema, Shop> {
	public ShopEditor(byte[] data) : base(data) { }

	public override void Extract() {
		if (_schema == null) return;
		_records.Clear();

		for (int i = 0; i < _schema.ShopCount; i++) {
			var shop = new Shop {
				Id = i,
				RomOffset = _schema.TableOffset + (i * _schema.RecordSize)
			};

			// Read items based on format
			int itemOffset = shop.RomOffset;
			for (int j = 0; j < _schema.MaxItemsPerShop; j++) {
				int itemId = _schema.ItemIdSize == 2
					? ReadWord(itemOffset)
					: ReadByte(itemOffset);

				if (_schema.Format == ShopFormat.Terminated && itemId == _schema.TerminatorValue) {
					break;
				}

				if (itemId != 0 && itemId != _schema.TerminatorValue) {
					shop.Items.Add(new ShopItem { ItemId = itemId });
				}

				itemOffset += _schema.ItemIdSize;
			}

			// Read price modifier if present
			if (_schema.HasPriceModifiers && _schema.PriceModifierOffset >= 0) {
				shop.PriceModifier = ReadByte(_schema.PriceModifierOffset + i);
			}

			_records.Add(shop);
		}
	}

	public override void Apply() {
		if (_schema == null) return;

		for (int i = 0; i < _records.Count && i < _schema.ShopCount; i++) {
			var shop = _records[i];
			int itemOffset = _schema.TableOffset + (i * _schema.RecordSize);

			// Write items
			for (int j = 0; j < _schema.MaxItemsPerShop; j++) {
				int itemId = j < shop.Items.Count ? shop.Items[j].ItemId : 0;

				if (_schema.Format == ShopFormat.Terminated && j >= shop.Items.Count) {
					itemId = _schema.TerminatorValue;
				}

				if (_schema.ItemIdSize == 2) {
					WriteWord(itemOffset, itemId);
				} else {
					WriteByte(itemOffset, itemId);
				}
				itemOffset += _schema.ItemIdSize;
			}

			// Write price modifier
			if (_schema.HasPriceModifiers && _schema.PriceModifierOffset >= 0) {
				WriteByte(_schema.PriceModifierOffset + i, shop.PriceModifier);
			}
		}
	}

	public override List<string> Validate() {
		var errors = new List<string>();

		for (int i = 0; i < _records.Count; i++) {
			var shop = _records[i];

			if (_schema != null && shop.Items.Count > _schema.MaxItemsPerShop) {
				errors.Add($"Shop {i} has too many items ({shop.Items.Count} > {_schema.MaxItemsPerShop})");
			}

			foreach (var item in shop.Items) {
				if (item.ItemId < 0) {
					errors.Add($"Shop {i} has invalid item ID: {item.ItemId}");
				}
			}
		}

		return errors;
	}

	/// <summary>
	/// Adds an item to a shop.
	/// </summary>
	public bool AddItem(int shopIndex, int itemId) {
		if (shopIndex < 0 || shopIndex >= _records.Count) return false;

		var shop = _records[shopIndex];
		if (_schema != null && shop.Items.Count >= _schema.MaxItemsPerShop) return false;

		shop.Items.Add(new ShopItem { ItemId = itemId });
		return true;
	}

	/// <summary>
	/// Removes an item from a shop.
	/// </summary>
	public bool RemoveItem(int shopIndex, int itemId) {
		if (shopIndex < 0 || shopIndex >= _records.Count) return false;

		var shop = _records[shopIndex];
		return shop.Items.RemoveAll(i => i.ItemId == itemId) > 0;
	}
}

#endregion

#region Chest Editor

/// <summary>
/// Schema for chest/treasure data.
/// </summary>
public class ChestSchema {
	public string Name { get; set; } = "";
	public int TableOffset { get; set; }
	public int ChestCount { get; set; }
	public int RecordSize { get; set; } = 4;
	public int ItemIdOffset { get; set; } = 0;
	public int ItemIdSize { get; set; } = 1;
	public int QuantityOffset { get; set; } = -1;
	public int MapIdOffset { get; set; } = -1;
	public int XOffset { get; set; } = -1;
	public int YOffset { get; set; } = -1;
	public int FlagOffset { get; set; } = -1;
	public bool HasGoldChests { get; set; } = false;
	public int GoldMultiplier { get; set; } = 1;
}

/// <summary>
/// Chest content type.
/// </summary>
public enum ChestContentType {
	Item,
	Gold,
	Equipment,
	Key,
	Trap,
	Mimic,
	Empty
}

/// <summary>
/// Represents a treasure chest.
/// </summary>
public class Chest {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public ChestContentType ContentType { get; set; } = ChestContentType.Item;
	public int ItemId { get; set; }
	public int Quantity { get; set; } = 1;
	public int GoldAmount { get; set; }
	public int MapId { get; set; } = -1;
	public int X { get; set; }
	public int Y { get; set; }
	public int FlagId { get; set; } = -1;
	public bool IsOpened { get; set; }
	public int RomOffset { get; set; }
}

/// <summary>
/// Editor for chest/treasure data.
/// </summary>
public class ChestEditor : GameDataEditor<ChestSchema, Chest> {
	public ChestEditor(byte[] data) : base(data) { }

	public override void Extract() {
		if (_schema == null) return;
		_records.Clear();

		for (int i = 0; i < _schema.ChestCount; i++) {
			int baseOffset = _schema.TableOffset + (i * _schema.RecordSize);

			var chest = new Chest {
				Id = i,
				RomOffset = baseOffset
			};

			// Read item ID
			chest.ItemId = _schema.ItemIdSize == 2
				? ReadWord(baseOffset + _schema.ItemIdOffset)
				: ReadByte(baseOffset + _schema.ItemIdOffset);

			// Read optional fields
			if (_schema.QuantityOffset >= 0) {
				chest.Quantity = ReadByte(baseOffset + _schema.QuantityOffset);
			}

			if (_schema.MapIdOffset >= 0) {
				chest.MapId = ReadByte(baseOffset + _schema.MapIdOffset);
			}

			if (_schema.XOffset >= 0) {
				chest.X = ReadByte(baseOffset + _schema.XOffset);
			}

			if (_schema.YOffset >= 0) {
				chest.Y = ReadByte(baseOffset + _schema.YOffset);
			}

			if (_schema.FlagOffset >= 0) {
				chest.FlagId = ReadByte(baseOffset + _schema.FlagOffset);
			}

			// Determine content type
			if (_schema.HasGoldChests && chest.ItemId >= 0xF0) {
				chest.ContentType = ChestContentType.Gold;
				chest.GoldAmount = (chest.ItemId - 0xF0) * _schema.GoldMultiplier;
			}

			_records.Add(chest);
		}
	}

	public override void Apply() {
		if (_schema == null) return;

		for (int i = 0; i < _records.Count && i < _schema.ChestCount; i++) {
			var chest = _records[i];
			int baseOffset = _schema.TableOffset + (i * _schema.RecordSize);

			// Write item ID
			int itemId = chest.ContentType == ChestContentType.Gold && _schema.HasGoldChests
				? 0xF0 + (chest.GoldAmount / _schema.GoldMultiplier)
				: chest.ItemId;

			if (_schema.ItemIdSize == 2) {
				WriteWord(baseOffset + _schema.ItemIdOffset, itemId);
			} else {
				WriteByte(baseOffset + _schema.ItemIdOffset, itemId);
			}

			// Write optional fields
			if (_schema.QuantityOffset >= 0) {
				WriteByte(baseOffset + _schema.QuantityOffset, chest.Quantity);
			}

			if (_schema.MapIdOffset >= 0) {
				WriteByte(baseOffset + _schema.MapIdOffset, chest.MapId);
			}

			if (_schema.XOffset >= 0) {
				WriteByte(baseOffset + _schema.XOffset, chest.X);
			}

			if (_schema.YOffset >= 0) {
				WriteByte(baseOffset + _schema.YOffset, chest.Y);
			}

			if (_schema.FlagOffset >= 0) {
				WriteByte(baseOffset + _schema.FlagOffset, chest.FlagId);
			}
		}
	}

	public override List<string> Validate() {
		var errors = new List<string>();

		for (int i = 0; i < _records.Count; i++) {
			var chest = _records[i];

			if (chest.ItemId < 0) {
				errors.Add($"Chest {i} has invalid item ID: {chest.ItemId}");
			}

			if (chest.Quantity < 0) {
				errors.Add($"Chest {i} has invalid quantity: {chest.Quantity}");
			}
		}

		return errors;
	}

	/// <summary>
	/// Gets all chests on a specific map.
	/// </summary>
	public IEnumerable<Chest> GetChestsByMap(int mapId) =>
		_records.Where(c => c.MapId == mapId);

	/// <summary>
	/// Gets all unopened chests.
	/// </summary>
	public IEnumerable<Chest> GetUnopenedChests() =>
		_records.Where(c => !c.IsOpened);
}

#endregion

#region Party/Character Editor

/// <summary>
/// Schema for party/character data.
/// </summary>
public class PartySchema {
	public string Name { get; set; } = "";
	public int CharacterTableOffset { get; set; }
	public int CharacterCount { get; set; }
	public int CharacterRecordSize { get; set; } = 32;
	public int BaseStatsOffset { get; set; } = 0;
	public int GrowthTableOffset { get; set; } = -1;
	public int GrowthRecordSize { get; set; } = 8;
	public int ExpTableOffset { get; set; } = -1;
	public int MaxLevel { get; set; } = 99;
	public int StartingEquipmentOffset { get; set; } = -1;
	public int EquipmentSlots { get; set; } = 4;
	public List<StatDefinition> Stats { get; set; } = [];
}

/// <summary>
/// Stat definition for character data.
/// </summary>
public class StatDefinition {
	public string Name { get; set; } = "";
	public int Offset { get; set; }
	public int Size { get; set; } = 1;
	public int MinValue { get; set; } = 0;
	public int MaxValue { get; set; } = 255;
}

/// <summary>
/// Represents a playable character.
/// </summary>
public class Character {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public int ClassId { get; set; }
	public Dictionary<string, int> BaseStats { get; set; } = new();
	public Dictionary<string, int> GrowthRates { get; set; } = new();
	public List<int> StartingEquipment { get; set; } = [];
	public int StartingLevel { get; set; } = 1;
	public int SpriteId { get; set; }
	public int PortraitId { get; set; }
	public int RomOffset { get; set; }
}

/// <summary>
/// Experience table entry.
/// </summary>
public class ExpTableEntry {
	public int Level { get; set; }
	public int ExpRequired { get; set; }
	public int TotalExp { get; set; }
}

/// <summary>
/// Editor for party/character data.
/// </summary>
public class PartyEditor : GameDataEditor<PartySchema, Character> {
	private readonly List<ExpTableEntry> _expTable = [];

	/// <summary>
	/// Gets the experience table.
	/// </summary>
	public IReadOnlyList<ExpTableEntry> ExpTable => _expTable;

	public PartyEditor(byte[] data) : base(data) { }

	public override void Extract() {
		if (_schema == null) return;
		_records.Clear();

		// Extract characters
		for (int i = 0; i < _schema.CharacterCount; i++) {
			int baseOffset = _schema.CharacterTableOffset + (i * _schema.CharacterRecordSize);

			var character = new Character {
				Id = i,
				RomOffset = baseOffset
			};

			// Read stats
			foreach (var stat in _schema.Stats) {
				int value = stat.Size == 2
					? ReadWord(baseOffset + stat.Offset)
					: ReadByte(baseOffset + stat.Offset);
				character.BaseStats[stat.Name] = value;
			}

			// Read growth rates if available
			if (_schema.GrowthTableOffset >= 0) {
				int growthOffset = _schema.GrowthTableOffset + (i * _schema.GrowthRecordSize);
				foreach (var stat in _schema.Stats) {
					int growth = ReadByte(growthOffset + stat.Offset);
					character.GrowthRates[stat.Name] = growth;
				}
			}

			// Read starting equipment
			if (_schema.StartingEquipmentOffset >= 0) {
				int equipOffset = _schema.StartingEquipmentOffset + (i * _schema.EquipmentSlots);
				for (int j = 0; j < _schema.EquipmentSlots; j++) {
					character.StartingEquipment.Add(ReadByte(equipOffset + j));
				}
			}

			_records.Add(character);
		}

		// Extract EXP table
		if (_schema.ExpTableOffset >= 0) {
			ExtractExpTable();
		}
	}

	private void ExtractExpTable() {
		if (_schema == null) return;
		_expTable.Clear();

		int totalExp = 0;
		for (int level = 1; level <= _schema.MaxLevel; level++) {
			int expRequired = ReadWord(_schema.ExpTableOffset + ((level - 1) * 2));
			totalExp += expRequired;

			_expTable.Add(new ExpTableEntry {
				Level = level,
				ExpRequired = expRequired,
				TotalExp = totalExp
			});
		}
	}

	public override void Apply() {
		if (_schema == null) return;

		for (int i = 0; i < _records.Count && i < _schema.CharacterCount; i++) {
			var character = _records[i];
			int baseOffset = _schema.CharacterTableOffset + (i * _schema.CharacterRecordSize);

			// Write stats
			foreach (var stat in _schema.Stats) {
				if (character.BaseStats.TryGetValue(stat.Name, out var value)) {
					if (stat.Size == 2) {
						WriteWord(baseOffset + stat.Offset, value);
					} else {
						WriteByte(baseOffset + stat.Offset, value);
					}
				}
			}

			// Write growth rates
			if (_schema.GrowthTableOffset >= 0) {
				int growthOffset = _schema.GrowthTableOffset + (i * _schema.GrowthRecordSize);
				foreach (var stat in _schema.Stats) {
					if (character.GrowthRates.TryGetValue(stat.Name, out var growth)) {
						WriteByte(growthOffset + stat.Offset, growth);
					}
				}
			}

			// Write starting equipment
			if (_schema.StartingEquipmentOffset >= 0) {
				int equipOffset = _schema.StartingEquipmentOffset + (i * _schema.EquipmentSlots);
				for (int j = 0; j < _schema.EquipmentSlots && j < character.StartingEquipment.Count; j++) {
					WriteByte(equipOffset + j, character.StartingEquipment[j]);
				}
			}
		}
	}

	public override List<string> Validate() {
		var errors = new List<string>();

		if (_schema == null) return errors;

		for (int i = 0; i < _records.Count; i++) {
			var character = _records[i];

			foreach (var stat in _schema.Stats) {
				if (character.BaseStats.TryGetValue(stat.Name, out var value)) {
					if (value < stat.MinValue || value > stat.MaxValue) {
						errors.Add($"Character {i} stat {stat.Name} out of range: {value} (valid: {stat.MinValue}-{stat.MaxValue})");
					}
				}
			}
		}

		return errors;
	}

	/// <summary>
	/// Calculates stats at a given level for a character.
	/// </summary>
	public Dictionary<string, int> CalculateStatsAtLevel(int characterIndex, int level) {
		var result = new Dictionary<string, int>();
		if (characterIndex < 0 || characterIndex >= _records.Count || _schema == null) {
			return result;
		}

		var character = _records[characterIndex];

		foreach (var stat in _schema.Stats) {
			if (character.BaseStats.TryGetValue(stat.Name, out var baseStat)) {
				int growth = character.GrowthRates.GetValueOrDefault(stat.Name, 0);
				int calculated = baseStat + (growth * (level - 1) / 4); // Simple growth formula
				result[stat.Name] = Math.Clamp(calculated, stat.MinValue, stat.MaxValue);
			}
		}

		return result;
	}

	/// <summary>
	/// Gets total EXP required for a level.
	/// </summary>
	public int GetExpForLevel(int level) =>
		level > 0 && level <= _expTable.Count ? _expTable[level - 1].TotalExp : 0;
}

#endregion

#region Class/Job Editor

/// <summary>
/// Schema for class/job data.
/// </summary>
public class ClassSchema {
	public string Name { get; set; } = "";
	public int TableOffset { get; set; }
	public int ClassCount { get; set; }
	public int RecordSize { get; set; } = 16;
	public int StatBonusOffset { get; set; } = 0;
	public int EquipmentFlagsOffset { get; set; } = -1;
	public int SkillListOffset { get; set; } = -1;
	public int SkillsPerClass { get; set; } = 8;
	public int ClassChangeReqOffset { get; set; } = -1;
	public List<StatDefinition> StatBonuses { get; set; } = [];
}

/// <summary>
/// Represents a character class/job.
/// </summary>
public class CharacterClass {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public Dictionary<string, int> StatBonuses { get; set; } = new();
	public int EquipmentFlags { get; set; }
	public List<int> LearnableSkills { get; set; } = [];
	public Dictionary<int, int> SkillLevels { get; set; } = new(); // SkillId -> Level learned
	public int PromotionFromClass { get; set; } = -1;
	public int PromotionToClass { get; set; } = -1;
	public int PromotionLevel { get; set; }
	public int PromotionItemId { get; set; } = -1;
	public int RomOffset { get; set; }
}

/// <summary>
/// Editor for class/job data.
/// </summary>
public class ClassEditor : GameDataEditor<ClassSchema, CharacterClass> {
	public ClassEditor(byte[] data) : base(data) { }

	public override void Extract() {
		if (_schema == null) return;
		_records.Clear();

		for (int i = 0; i < _schema.ClassCount; i++) {
			int baseOffset = _schema.TableOffset + (i * _schema.RecordSize);

			var charClass = new CharacterClass {
				Id = i,
				RomOffset = baseOffset
			};

			// Read stat bonuses
			foreach (var stat in _schema.StatBonuses) {
				int value = stat.Size == 2
					? ReadWord(baseOffset + stat.Offset)
					: ReadByte(baseOffset + stat.Offset);
				charClass.StatBonuses[stat.Name] = value;
			}

			// Read equipment flags
			if (_schema.EquipmentFlagsOffset >= 0) {
				charClass.EquipmentFlags = ReadWord(baseOffset + _schema.EquipmentFlagsOffset);
			}

			// Read learnable skills
			if (_schema.SkillListOffset >= 0) {
				int skillOffset = _schema.SkillListOffset + (i * _schema.SkillsPerClass * 2);
				for (int j = 0; j < _schema.SkillsPerClass; j++) {
					int skillId = ReadByte(skillOffset + (j * 2));
					int level = ReadByte(skillOffset + (j * 2) + 1);
					if (skillId != 0 && skillId != 0xFF) {
						charClass.LearnableSkills.Add(skillId);
						charClass.SkillLevels[skillId] = level;
					}
				}
			}

			_records.Add(charClass);
		}
	}

	public override void Apply() {
		if (_schema == null) return;

		for (int i = 0; i < _records.Count && i < _schema.ClassCount; i++) {
			var charClass = _records[i];
			int baseOffset = _schema.TableOffset + (i * _schema.RecordSize);

			// Write stat bonuses
			foreach (var stat in _schema.StatBonuses) {
				if (charClass.StatBonuses.TryGetValue(stat.Name, out var value)) {
					if (stat.Size == 2) {
						WriteWord(baseOffset + stat.Offset, value);
					} else {
						WriteByte(baseOffset + stat.Offset, value);
					}
				}
			}

			// Write equipment flags
			if (_schema.EquipmentFlagsOffset >= 0) {
				WriteWord(baseOffset + _schema.EquipmentFlagsOffset, charClass.EquipmentFlags);
			}

			// Write skills
			if (_schema.SkillListOffset >= 0) {
				int skillOffset = _schema.SkillListOffset + (i * _schema.SkillsPerClass * 2);
				int skillIndex = 0;
				foreach (var skillId in charClass.LearnableSkills) {
					if (skillIndex >= _schema.SkillsPerClass) break;
					WriteByte(skillOffset + (skillIndex * 2), skillId);
					WriteByte(skillOffset + (skillIndex * 2) + 1,
						charClass.SkillLevels.GetValueOrDefault(skillId, 1));
					skillIndex++;
				}
				// Fill remaining with 0xFF
				while (skillIndex < _schema.SkillsPerClass) {
					WriteByte(skillOffset + (skillIndex * 2), 0xFF);
					WriteByte(skillOffset + (skillIndex * 2) + 1, 0);
					skillIndex++;
				}
			}
		}
	}

	public override List<string> Validate() {
		var errors = new List<string>();

		for (int i = 0; i < _records.Count; i++) {
			var charClass = _records[i];

			if (_schema != null && charClass.LearnableSkills.Count > _schema.SkillsPerClass) {
				errors.Add($"Class {i} has too many skills ({charClass.LearnableSkills.Count} > {_schema.SkillsPerClass})");
			}
		}

		return errors;
	}

	/// <summary>
	/// Checks if a class can equip an item type.
	/// </summary>
	public bool CanEquip(int classIndex, int equipmentTypeFlag) {
		if (classIndex < 0 || classIndex >= _records.Count) return false;
		return (_records[classIndex].EquipmentFlags & equipmentTypeFlag) != 0;
	}

	/// <summary>
	/// Gets skills learned by a certain level.
	/// </summary>
	public IEnumerable<int> GetSkillsAtLevel(int classIndex, int level) {
		if (classIndex < 0 || classIndex >= _records.Count) {
			return [];
		}

		var charClass = _records[classIndex];
		return charClass.SkillLevels
			.Where(kvp => kvp.Value <= level)
			.Select(kvp => kvp.Key);
	}
}

#endregion

#region Battle Formula Editor

/// <summary>
/// Schema for battle formulas.
/// </summary>
public class BattleFormulaSchema {
	public string Name { get; set; } = "";
	public int DamageFormulaOffset { get; set; } = -1;
	public int DamageFormulaCount { get; set; }
	public int DamageFormulaSize { get; set; } = 8;
	public int HitFormulaOffset { get; set; } = -1;
	public int CritFormulaOffset { get; set; } = -1;
	public int DefenseFormulaOffset { get; set; } = -1;
	public int MagicDefenseFormulaOffset { get; set; } = -1;
	public List<FormulaVariable> Variables { get; set; } = [];
}

/// <summary>
/// Variable used in formulas.
/// </summary>
public class FormulaVariable {
	public string Name { get; set; } = "";
	public string Description { get; set; } = "";
	public int DefaultValue { get; set; }
}

/// <summary>
/// Type of battle formula.
/// </summary>
public enum BattleFormulaType {
	Damage,
	Healing,
	Hit,
	Evade,
	Critical,
	Defense,
	MagicDefense,
	StatusInflict,
	StatusResist
}

/// <summary>
/// Represents a battle calculation formula.
/// </summary>
public class BattleFormula {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public BattleFormulaType Type { get; set; } = BattleFormulaType.Damage;
	public string Expression { get; set; } = "";
	public int BaseValue { get; set; }
	public int Multiplier { get; set; } = 100;
	public int AttackStatWeight { get; set; }
	public int DefenseStatWeight { get; set; }
	public int RandomMin { get; set; } = 100;
	public int RandomMax { get; set; } = 100;
	public int ElementId { get; set; } = -1;
	public int RomOffset { get; set; }
}

/// <summary>
/// Result of formula simulation.
/// </summary>
public record FormulaSimulationResult(
	int MinDamage,
	int MaxDamage,
	int AvgDamage,
	double HitChance,
	double CritChance
);

/// <summary>
/// Editor for battle formula data.
/// </summary>
public class BattleFormulaEditor : GameDataEditor<BattleFormulaSchema, BattleFormula> {
	public BattleFormulaEditor(byte[] data) : base(data) { }

	public override void Extract() {
		if (_schema == null) return;
		_records.Clear();

		if (_schema.DamageFormulaOffset < 0) return;

		for (int i = 0; i < _schema.DamageFormulaCount; i++) {
			int baseOffset = _schema.DamageFormulaOffset + (i * _schema.DamageFormulaSize);

			var formula = new BattleFormula {
				Id = i,
				RomOffset = baseOffset,
				Type = BattleFormulaType.Damage
			};

			// Read formula components (layout varies by game)
			formula.BaseValue = ReadByte(baseOffset);
			formula.Multiplier = ReadByte(baseOffset + 1);
			formula.AttackStatWeight = ReadByte(baseOffset + 2);
			formula.DefenseStatWeight = ReadByte(baseOffset + 3);
			formula.RandomMin = ReadByte(baseOffset + 4);
			formula.RandomMax = ReadByte(baseOffset + 5);
			formula.ElementId = ReadByte(baseOffset + 6);

			_records.Add(formula);
		}
	}

	public override void Apply() {
		if (_schema == null || _schema.DamageFormulaOffset < 0) return;

		for (int i = 0; i < _records.Count && i < _schema.DamageFormulaCount; i++) {
			var formula = _records[i];
			int baseOffset = _schema.DamageFormulaOffset + (i * _schema.DamageFormulaSize);

			WriteByte(baseOffset, formula.BaseValue);
			WriteByte(baseOffset + 1, formula.Multiplier);
			WriteByte(baseOffset + 2, formula.AttackStatWeight);
			WriteByte(baseOffset + 3, formula.DefenseStatWeight);
			WriteByte(baseOffset + 4, formula.RandomMin);
			WriteByte(baseOffset + 5, formula.RandomMax);
			WriteByte(baseOffset + 6, formula.ElementId);
		}
	}

	public override List<string> Validate() {
		var errors = new List<string>();

		for (int i = 0; i < _records.Count; i++) {
			var formula = _records[i];

			if (formula.RandomMin > formula.RandomMax) {
				errors.Add($"Formula {i} has invalid random range: {formula.RandomMin} > {formula.RandomMax}");
			}
		}

		return errors;
	}

	/// <summary>
	/// Simulates a damage formula.
	/// </summary>
	public FormulaSimulationResult Simulate(int formulaIndex, int attackStat, int defenseStat) {
		if (formulaIndex < 0 || formulaIndex >= _records.Count) {
			return new FormulaSimulationResult(0, 0, 0, 0, 0);
		}

		var formula = _records[formulaIndex];

		// Basic damage calculation
		int baseDamage = formula.BaseValue +
			(attackStat * formula.AttackStatWeight / 100) -
			(defenseStat * formula.DefenseStatWeight / 100);

		baseDamage = baseDamage * formula.Multiplier / 100;

		int minDamage = baseDamage * formula.RandomMin / 100;
		int maxDamage = baseDamage * formula.RandomMax / 100;
		int avgDamage = (minDamage + maxDamage) / 2;

		return new FormulaSimulationResult(
			Math.Max(0, minDamage),
			Math.Max(0, maxDamage),
			Math.Max(0, avgDamage),
			0.95, // Placeholder
			0.05  // Placeholder
		);
	}

	/// <summary>
	/// Generates a formula expression string.
	/// </summary>
	public string GetFormulaExpression(int formulaIndex) {
		if (formulaIndex < 0 || formulaIndex >= _records.Count) {
			return "";
		}

		var f = _records[formulaIndex];
		return $"({f.BaseValue} + ATK*{f.AttackStatWeight}/100 - DEF*{f.DefenseStatWeight}/100) * {f.Multiplier}/100 * rand({f.RandomMin},{f.RandomMax})/100";
	}
}

#endregion
