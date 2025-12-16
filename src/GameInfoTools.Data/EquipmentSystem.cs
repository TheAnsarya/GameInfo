using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Equipment and item system editor for RPG ROMs.
/// Provides specialized functionality for editing weapons, armor, and items.
/// </summary>
public class EquipmentSystem {
	/// <summary>
	/// Equipment category.
	/// </summary>
	public enum EquipmentCategory {
		Weapon,
		Armor,
		Shield,
		Helmet,
		Accessory,
		Consumable,
		KeyItem,
		Other
	}

	/// <summary>
	/// Equipment slot flags.
	/// </summary>
	[Flags]
	public enum EquipSlot {
		None = 0,
		RightHand = 1,
		LeftHand = 2,
		Head = 4,
		Body = 8,
		Arms = 16,
		Feet = 32,
		Accessory1 = 64,
		Accessory2 = 128
	}

	/// <summary>
	/// Character class flags for equipment restrictions.
	/// </summary>
	[Flags]
	public enum CharacterClass {
		None = 0,
		Class1 = 1,
		Class2 = 2,
		Class3 = 4,
		Class4 = 8,
		Class5 = 16,
		Class6 = 32,
		Class7 = 64,
		Class8 = 128,
		AllClasses = 255
	}

	/// <summary>
	/// Element/damage type flags.
	/// </summary>
	[Flags]
	public enum ElementType {
		None = 0,
		Fire = 1,
		Ice = 2,
		Lightning = 4,
		Wind = 8,
		Earth = 16,
		Water = 32,
		Holy = 64,
		Dark = 128
	}

	/// <summary>
	/// Status effect flags.
	/// </summary>
	[Flags]
	public enum StatusEffect {
		None = 0,
		Poison = 1,
		Sleep = 2,
		Paralysis = 4,
		Confusion = 8,
		Silence = 16,
		Blind = 32,
		Death = 64,
		Stone = 128
	}

	/// <summary>
	/// Equipment item definition.
	/// </summary>
	public class Equipment {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public EquipmentCategory Category { get; set; }
		public EquipSlot Slot { get; set; }

		// Stats
		public int Attack { get; set; }
		public int Defense { get; set; }
		public int MagicAttack { get; set; }
		public int MagicDefense { get; set; }
		public int Speed { get; set; }
		public int Evasion { get; set; }
		public int Accuracy { get; set; }
		public int CriticalRate { get; set; }

		// Bonuses
		public int StrengthBonus { get; set; }
		public int AgilityBonus { get; set; }
		public int VitalityBonus { get; set; }
		public int IntelligenceBonus { get; set; }
		public int LuckBonus { get; set; }
		public int MaxHpBonus { get; set; }
		public int MaxMpBonus { get; set; }

		// Equipment restrictions and properties
		public CharacterClass EquipableBy { get; set; } = CharacterClass.AllClasses;
		public ElementType ElementAffinity { get; set; }
		public ElementType ElementResistance { get; set; }
		public StatusEffect StatusInflict { get; set; }
		public StatusEffect StatusResist { get; set; }
		public int StatusInflictChance { get; set; }

		// Economy
		public int BuyPrice { get; set; }
		public int SellPrice { get; set; }

		// Graphics/sound
		public int IconIndex { get; set; }
		public int PaletteIndex { get; set; }
		public int SoundEffect { get; set; }

		// Flags
		public bool IsCursed { get; set; }
		public bool IsTwoHanded { get; set; }
		public bool IsUnique { get; set; }
		public bool IsStackable { get; set; }
		public int MaxStack { get; set; } = 1;

		// Item-specific (consumables)
		public int HpRestore { get; set; }
		public int MpRestore { get; set; }
		public int SpellCast { get; set; }
		public bool UsableInBattle { get; set; }
		public bool UsableInField { get; set; }

		// Raw data reference
		public int RomOffset { get; set; }
		public byte[] RawData { get; set; } = [];
	}

	/// <summary>
	/// Equipment table schema definition.
	/// </summary>
	public class EquipmentSchema {
		public string Name { get; set; } = "";
		public int BaseOffset { get; set; }
		public int RecordSize { get; set; }
		public int RecordCount { get; set; }
		public EquipmentCategory Category { get; set; }
		public List<EquipmentFieldMapping> Fields { get; } = [];

		public int TotalSize => RecordSize * RecordCount;
	}

	/// <summary>
	/// Maps a schema field to an Equipment property.
	/// </summary>
	public class EquipmentFieldMapping {
		public string PropertyName { get; set; } = "";
		public int Offset { get; set; }
		public DataTableEditor.FieldType Type { get; set; }
		public int Size { get; set; } = 1;
		public int BitMask { get; set; } = 0xff;
		public int BitShift { get; set; } = 0;
		public int Multiplier { get; set; } = 1;
		public Dictionary<int, string>? ValueNames { get; set; }
	}

	private readonly byte[] _data;
	private readonly List<EquipmentSchema> _schemas = [];
	private readonly Dictionary<int, Equipment> _equipmentCache = [];

	public EquipmentSystem(byte[] romData) {
		_data = romData;
	}

	/// <summary>
	/// Gets loaded schemas.
	/// </summary>
	public IReadOnlyList<EquipmentSchema> Schemas => _schemas;

	/// <summary>
	/// Adds an equipment schema to the system.
	/// </summary>
	public void AddSchema(EquipmentSchema schema) {
		_schemas.Add(schema);
	}

	/// <summary>
	/// Loads equipment from ROM using defined schemas.
	/// </summary>
	public List<Equipment> LoadEquipment() {
		var equipment = new List<Equipment>();
		int globalId = 0;

		foreach (var schema in _schemas) {
			for (int i = 0; i < schema.RecordCount; i++) {
				int offset = schema.BaseOffset + (i * schema.RecordSize);
				var item = ReadEquipment(offset, schema, globalId++);
				_equipmentCache[item.Id] = item;
				equipment.Add(item);
			}
		}

		return equipment;
	}

	/// <summary>
	/// Gets equipment by ID from cache.
	/// </summary>
	public Equipment? GetEquipment(int id) {
		return _equipmentCache.TryGetValue(id, out var item) ? item : null;
	}

	/// <summary>
	/// Saves modified equipment back to ROM data.
	/// </summary>
	public void SaveEquipment(Equipment item) {
		var schema = _schemas.FirstOrDefault(s => s.Category == item.Category);
		if (schema == null) return;

		WriteEquipment(item, schema);
	}

	/// <summary>
	/// Gets equipment filtered by category.
	/// </summary>
	public List<Equipment> GetByCategory(EquipmentCategory category) {
		return _equipmentCache.Values.Where(e => e.Category == category).OrderBy(e => e.Id).ToList();
	}

	/// <summary>
	/// Gets equipment filtered by slot.
	/// </summary>
	public List<Equipment> GetBySlot(EquipSlot slot) {
		return _equipmentCache.Values.Where(e => e.Slot.HasFlag(slot)).OrderBy(e => e.Id).ToList();
	}

	/// <summary>
	/// Gets equipment usable by a character class.
	/// </summary>
	public List<Equipment> GetEquipableBy(CharacterClass characterClass) {
		return _equipmentCache.Values
			.Where(e => e.EquipableBy.HasFlag(characterClass))
			.OrderBy(e => e.Id)
			.ToList();
	}

	/// <summary>
	/// Exports all equipment to JSON.
	/// </summary>
	public string ExportToJson() {
		return JsonSerializer.Serialize(_equipmentCache.Values.OrderBy(e => e.Id), new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Imports equipment from JSON.
	/// </summary>
	public void ImportFromJson(string json) {
		var items = JsonSerializer.Deserialize<List<Equipment>>(json, new JsonSerializerOptions {
			Converters = { new JsonStringEnumConverter() }
		});

		if (items == null) return;

		foreach (var item in items) {
			if (_equipmentCache.ContainsKey(item.Id)) {
				_equipmentCache[item.Id] = item;
				SaveEquipment(item);
			}
		}
	}

	/// <summary>
	/// Creates a standard schema for common RPG weapon tables.
	/// </summary>
	public static EquipmentSchema CreateWeaponSchema(int baseOffset, int recordSize, int recordCount) {
		return new EquipmentSchema {
			Name = "Weapons",
			BaseOffset = baseOffset,
			RecordSize = recordSize,
			RecordCount = recordCount,
			Category = EquipmentCategory.Weapon,
			Fields = {
				new EquipmentFieldMapping { PropertyName = "Attack", Offset = 0, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "Accuracy", Offset = 1, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "CriticalRate", Offset = 2, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "ElementAffinity", Offset = 3, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "StatusInflict", Offset = 4, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "EquipableBy", Offset = 5, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "BuyPrice", Offset = 6, Type = DataTableEditor.FieldType.Word }
			}
		};
	}

	/// <summary>
	/// Creates a standard schema for common RPG armor tables.
	/// </summary>
	public static EquipmentSchema CreateArmorSchema(int baseOffset, int recordSize, int recordCount) {
		return new EquipmentSchema {
			Name = "Armor",
			BaseOffset = baseOffset,
			RecordSize = recordSize,
			RecordCount = recordCount,
			Category = EquipmentCategory.Armor,
			Fields = {
				new EquipmentFieldMapping { PropertyName = "Defense", Offset = 0, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "MagicDefense", Offset = 1, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "Evasion", Offset = 2, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "ElementResistance", Offset = 3, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "StatusResist", Offset = 4, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "EquipableBy", Offset = 5, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "BuyPrice", Offset = 6, Type = DataTableEditor.FieldType.Word }
			}
		};
	}

	/// <summary>
	/// Creates a standard schema for common RPG item tables.
	/// </summary>
	public static EquipmentSchema CreateItemSchema(int baseOffset, int recordSize, int recordCount) {
		return new EquipmentSchema {
			Name = "Items",
			BaseOffset = baseOffset,
			RecordSize = recordSize,
			RecordCount = recordCount,
			Category = EquipmentCategory.Consumable,
			Fields = {
				new EquipmentFieldMapping { PropertyName = "HpRestore", Offset = 0, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "MpRestore", Offset = 1, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "SpellCast", Offset = 2, Type = DataTableEditor.FieldType.Byte },
				new EquipmentFieldMapping { PropertyName = "UsableInBattle", Offset = 3, Type = DataTableEditor.FieldType.Byte, BitMask = 0x01 },
				new EquipmentFieldMapping { PropertyName = "UsableInField", Offset = 3, Type = DataTableEditor.FieldType.Byte, BitMask = 0x02, BitShift = 1 },
				new EquipmentFieldMapping { PropertyName = "BuyPrice", Offset = 4, Type = DataTableEditor.FieldType.Word }
			}
		};
	}

	private Equipment ReadEquipment(int offset, EquipmentSchema schema, int id) {
		var item = new Equipment {
			Id = id,
			Category = schema.Category,
			RomOffset = offset,
			RawData = _data.Skip(offset).Take(schema.RecordSize).ToArray()
		};

		// Set default slot based on category
		item.Slot = schema.Category switch {
			EquipmentCategory.Weapon => EquipSlot.RightHand,
			EquipmentCategory.Shield => EquipSlot.LeftHand,
			EquipmentCategory.Armor => EquipSlot.Body,
			EquipmentCategory.Helmet => EquipSlot.Head,
			EquipmentCategory.Accessory => EquipSlot.Accessory1,
			_ => EquipSlot.None
		};

		foreach (var field in schema.Fields) {
			var value = ReadFieldValue(offset, field);
			SetPropertyValue(item, field.PropertyName, value, field);
		}

		return item;
	}

	private int ReadFieldValue(int baseOffset, EquipmentFieldMapping field) {
		int offset = baseOffset + field.Offset;
		if (offset >= _data.Length) return 0;

		int value = field.Type switch {
			DataTableEditor.FieldType.Byte => _data[offset],
			DataTableEditor.FieldType.Word => _data[offset] | (_data[offset + 1] << 8),
			DataTableEditor.FieldType.Long => _data[offset] | (_data[offset + 1] << 8) | (_data[offset + 2] << 16),
			DataTableEditor.FieldType.SignedByte => (sbyte)_data[offset],
			DataTableEditor.FieldType.SignedWord => (short)(_data[offset] | (_data[offset + 1] << 8)),
			_ => _data[offset]
		};

		// Apply bit mask and shift (only for masked fields)
		// Use appropriate mask based on field type
		int defaultMask = field.Type switch {
			DataTableEditor.FieldType.Byte or DataTableEditor.FieldType.SignedByte or DataTableEditor.FieldType.BitFlags => 0xff,
			DataTableEditor.FieldType.Word or DataTableEditor.FieldType.SignedWord or DataTableEditor.FieldType.Pointer => 0xffff,
			DataTableEditor.FieldType.Long => 0xffffff,
			_ => 0xff
		};

		// Only apply mask if it differs from default (custom mask specified)
		if (field.BitMask != 0xff || field.BitShift != 0) {
			value = (value & field.BitMask) >> field.BitShift;
		}

		value *= field.Multiplier;

		return value;
	}

	private void WriteFieldValue(int baseOffset, EquipmentFieldMapping field, int value) {
		int offset = baseOffset + field.Offset;
		if (offset >= _data.Length) return;

		value /= Math.Max(1, field.Multiplier);

		// Read existing value, apply mask, merge new value
		int existing = 0;
		if (field.BitMask != 0xff) {
			existing = _data[offset] & ~field.BitMask;
			value = existing | ((value << field.BitShift) & field.BitMask);
		}

		switch (field.Type) {
			case DataTableEditor.FieldType.Byte:
			case DataTableEditor.FieldType.SignedByte:
				_data[offset] = (byte)value;
				break;
			case DataTableEditor.FieldType.Word:
			case DataTableEditor.FieldType.SignedWord:
				_data[offset] = (byte)(value & 0xff);
				_data[offset + 1] = (byte)((value >> 8) & 0xff);
				break;
			case DataTableEditor.FieldType.Long:
				_data[offset] = (byte)(value & 0xff);
				_data[offset + 1] = (byte)((value >> 8) & 0xff);
				_data[offset + 2] = (byte)((value >> 16) & 0xff);
				break;
		}
	}

	private static void SetPropertyValue(Equipment item, string propertyName, int value, EquipmentFieldMapping field) {
		var prop = typeof(Equipment).GetProperty(propertyName);
		if (prop == null) return;

		object convertedValue;
		if (prop.PropertyType.IsEnum) {
			convertedValue = Enum.ToObject(prop.PropertyType, value);
		} else if (prop.PropertyType == typeof(bool)) {
			convertedValue = value != 0;
		} else {
			convertedValue = Convert.ChangeType(value, prop.PropertyType);
		}

		prop.SetValue(item, convertedValue);
	}

	private static int GetPropertyValue(Equipment item, string propertyName) {
		var prop = typeof(Equipment).GetProperty(propertyName);
		if (prop == null) return 0;

		var value = prop.GetValue(item);
		if (value == null) return 0;

		if (prop.PropertyType.IsEnum) {
			return Convert.ToInt32(value);
		} else if (prop.PropertyType == typeof(bool)) {
			return (bool)value ? 1 : 0;
		} else {
			return Convert.ToInt32(value);
		}
	}

	private void WriteEquipment(Equipment item, EquipmentSchema schema) {
		foreach (var field in schema.Fields) {
			var value = GetPropertyValue(item, field.PropertyName);
			WriteFieldValue(item.RomOffset, field, value);
		}
	}

	/// <summary>
	/// Gets statistics about the equipment database.
	/// </summary>
	public EquipmentStatistics GetStatistics() {
		return new EquipmentStatistics(
			TotalItems: _equipmentCache.Count,
			WeaponCount: GetByCategory(EquipmentCategory.Weapon).Count,
			ArmorCount: GetByCategory(EquipmentCategory.Armor).Count,
			ShieldCount: GetByCategory(EquipmentCategory.Shield).Count,
			HelmetCount: GetByCategory(EquipmentCategory.Helmet).Count,
			AccessoryCount: GetByCategory(EquipmentCategory.Accessory).Count,
			ConsumableCount: GetByCategory(EquipmentCategory.Consumable).Count,
			KeyItemCount: GetByCategory(EquipmentCategory.KeyItem).Count
		);
	}

	/// <summary>
	/// Statistics about the equipment database.
	/// </summary>
	public record EquipmentStatistics(
		int TotalItems,
		int WeaponCount,
		int ArmorCount,
		int ShieldCount,
		int HelmetCount,
		int AccessoryCount,
		int ConsumableCount,
		int KeyItemCount
	);
}
