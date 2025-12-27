using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data.Robotrek;

/// <summary>
/// Robotrek-specific data structures and editors.
/// </summary>
public static class RobotrekData {
	// ROM mapping constants
	public const int HeaderSize = 0x200;
	public const bool IsHiRom = true;

	// Data locations (HiROM addresses)
	public const int ItemDataBank = 0xD0;
	public const int ItemDataStart = 0x8000;
	public const int ItemEntrySize = 8;
	public const int ItemCount = 150;

	public const int EnemyDataBank = 0xD1;
	public const int EnemyDataStart = 0x8000;
	public const int EnemyEntrySize = 16;
	public const int EnemyCount = 80;

	public const int InventionDataBank = 0xD2;
	public const int InventionDataStart = 0x8000;
	public const int InventionEntrySize = 8;
	public const int InventionCount = 100;

	/// <summary>
	/// Convert HiROM bank:address to file offset.
	/// </summary>
	public static int ToFileOffset(int bank, int address, bool hasHeader = true) {
		int offset = hasHeader ? HeaderSize : 0;
		if (bank >= 0xC0) {
			return offset + ((bank - 0xC0) * 0x10000) + (address >= 0x8000 ? address - 0x8000 : address);
		}

		return offset + (bank * 0x10000) + address;
	}
}

/// <summary>
/// Item types in Robotrek.
/// </summary>
public enum RobotrekItemType : byte {
	Consumable = 0x00,
	Weapon = 0x01,
	Armor = 0x02,
	Accessory = 0x03,
	Material = 0x04,
	RobotPart = 0x05,
	KeyItem = 0x06
}

/// <summary>
/// Item flags in Robotrek.
/// </summary>
[Flags]
public enum RobotrekItemFlags : ushort {
	None = 0x0000,
	UsableInBattle = 0x0001,
	UsableInField = 0x0002,
	Consumable = 0x0004,
	Equippable = 0x0008,
	RobotOnly = 0x0010,
	QuestItem = 0x0020,
	Rare = 0x0040,
	Unique = 0x0080
}

/// <summary>
/// Robotrek item data structure.
/// </summary>
public class RobotrekItem {
	public int Id { get; set; }
	public byte ItemId { get; set; }
	public RobotrekItemType ItemType { get; set; }
	public byte PrimaryStat { get; set; }
	public byte SecondaryStat { get; set; }
	public ushort BuyPrice { get; set; }
	public RobotrekItemFlags Flags { get; set; }

	[JsonIgnore]
	public ushort SellPrice => (ushort)(BuyPrice / 2);

	public string TypeName => ItemType.ToString();

	public static RobotrekItem FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < RobotrekData.ItemEntrySize) {
			throw new ArgumentException("Insufficient data for item");
		}

		return new RobotrekItem {
			Id = id,
			ItemId = data[0],
			ItemType = (RobotrekItemType)data[1],
			PrimaryStat = data[2],
			SecondaryStat = data[3],
			BuyPrice = (ushort)(data[4] | (data[5] << 8)),
			Flags = (RobotrekItemFlags)(data[6] | (data[7] << 8))
		};
	}

	public byte[] ToBytes() {
		var bytes = new byte[RobotrekData.ItemEntrySize];
		bytes[0] = ItemId;
		bytes[1] = (byte)ItemType;
		bytes[2] = PrimaryStat;
		bytes[3] = SecondaryStat;
		bytes[4] = (byte)(BuyPrice & 0xFF);
		bytes[5] = (byte)((BuyPrice >> 8) & 0xFF);
		bytes[6] = (byte)((ushort)Flags & 0xFF);
		bytes[7] = (byte)(((ushort)Flags >> 8) & 0xFF);
		return bytes;
	}
}

/// <summary>
/// AI patterns for enemies.
/// </summary>
public enum RobotrekAiPattern : byte {
	Aggressive = 0x00,
	Defensive = 0x01,
	Support = 0x02,
	Ranged = 0x03,
	HitAndRun = 0x04,
	BossPhase1 = 0x05,
	BossPhase2 = 0x06,
	BossSpecial = 0x07
}

/// <summary>
/// Robotrek enemy data structure.
/// </summary>
public class RobotrekEnemy {
	public int Id { get; set; }
	public byte EnemyId { get; set; }
	public byte SpriteIndex { get; set; }
	public ushort HP { get; set; }
	public byte Power { get; set; }
	public byte Guard { get; set; }
	public byte Speed { get; set; }
	public RobotrekAiPattern AiPattern { get; set; }
	public ushort Exp { get; set; }
	public ushort Gold { get; set; }
	public byte Drop1Id { get; set; }
	public byte Drop1Rate { get; set; }
	public byte Drop2Id { get; set; }
	public byte Drop2Rate { get; set; }

	public string AiName => AiPattern.ToString();

	public static RobotrekEnemy FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < RobotrekData.EnemyEntrySize) {
			throw new ArgumentException("Insufficient data for enemy");
		}

		return new RobotrekEnemy {
			Id = id,
			EnemyId = data[0],
			SpriteIndex = data[1],
			HP = (ushort)(data[2] | (data[3] << 8)),
			Power = data[4],
			Guard = data[5],
			Speed = data[6],
			AiPattern = (RobotrekAiPattern)data[7],
			Exp = (ushort)(data[8] | (data[9] << 8)),
			Gold = (ushort)(data[10] | (data[11] << 8)),
			Drop1Id = data[12],
			Drop1Rate = data[13],
			Drop2Id = data[14],
			Drop2Rate = data[15]
		};
	}

	public byte[] ToBytes() {
		var bytes = new byte[RobotrekData.EnemyEntrySize];
		bytes[0] = EnemyId;
		bytes[1] = SpriteIndex;
		bytes[2] = (byte)(HP & 0xFF);
		bytes[3] = (byte)((HP >> 8) & 0xFF);
		bytes[4] = Power;
		bytes[5] = Guard;
		bytes[6] = Speed;
		bytes[7] = (byte)AiPattern;
		bytes[8] = (byte)(Exp & 0xFF);
		bytes[9] = (byte)((Exp >> 8) & 0xFF);
		bytes[10] = (byte)(Gold & 0xFF);
		bytes[11] = (byte)((Gold >> 8) & 0xFF);
		bytes[12] = Drop1Id;
		bytes[13] = Drop1Rate;
		bytes[14] = Drop2Id;
		bytes[15] = Drop2Rate;
		return bytes;
	}
}

/// <summary>
/// Robotrek invention recipe data structure.
/// </summary>
public class RobotrekInvention {
	public int Id { get; set; }
	public byte ResultItem { get; set; }
	public byte Material1Id { get; set; }
	public byte Material1Qty { get; set; }
	public byte Material2Id { get; set; }
	public byte Material2Qty { get; set; }
	public byte Material3Id { get; set; }
	public byte Material3Qty { get; set; }
	public byte RequiredLevel { get; set; }
	public byte Flags { get; set; }

	public static RobotrekInvention FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < RobotrekData.InventionEntrySize) {
			throw new ArgumentException("Insufficient data for invention");
		}

		return new RobotrekInvention {
			Id = id,
			ResultItem = data[0],
			Material1Id = data[1],
			Material1Qty = data[2],
			Material2Id = data[3],
			Material2Qty = data[4],
			Material3Id = data[5],
			Material3Qty = data[6],
			RequiredLevel = (byte)(data[7] & 0x3F),
			Flags = (byte)((data[7] >> 6) & 0x03)
		};
	}

	public byte[] ToBytes() {
		var bytes = new byte[RobotrekData.InventionEntrySize];
		bytes[0] = ResultItem;
		bytes[1] = Material1Id;
		bytes[2] = Material1Qty;
		bytes[3] = Material2Id;
		bytes[4] = Material2Qty;
		bytes[5] = Material3Id;
		bytes[6] = Material3Qty;
		bytes[7] = (byte)((RequiredLevel & 0x3F) | ((Flags & 0x03) << 6));
		return bytes;
	}
}

/// <summary>
/// Editor for Robotrek ROM data.
/// </summary>
public class RobotrekEditor {
	private byte[] _romData;
	private bool _hasHeader;

	public List<RobotrekItem> Items { get; private set; } = new();
	public List<RobotrekEnemy> Enemies { get; private set; } = new();
	public List<RobotrekInvention> Inventions { get; private set; } = new();

	public RobotrekEditor(byte[] romData) {
		_romData = romData;
		_hasHeader = (romData.Length % 0x8000) == RobotrekData.HeaderSize;
		LoadAllData();
	}

	public static RobotrekEditor FromFile(string path) {
		var data = File.ReadAllBytes(path);
		return new RobotrekEditor(data);
	}

	private int ToFileOffset(int bank, int address) {
		return RobotrekData.ToFileOffset(bank, address, _hasHeader);
	}

	private void LoadAllData() {
		LoadItems();
		LoadEnemies();
		LoadInventions();
	}

	private void LoadItems() {
		Items.Clear();
		int offset = ToFileOffset(RobotrekData.ItemDataBank, RobotrekData.ItemDataStart);

		for (int i = 0; i < RobotrekData.ItemCount; i++) {
			var data = _romData.AsSpan(offset + (i * RobotrekData.ItemEntrySize), RobotrekData.ItemEntrySize);
			Items.Add(RobotrekItem.FromBytes(i, data));
		}
	}

	private void LoadEnemies() {
		Enemies.Clear();
		int offset = ToFileOffset(RobotrekData.EnemyDataBank, RobotrekData.EnemyDataStart);

		for (int i = 0; i < RobotrekData.EnemyCount; i++) {
			var data = _romData.AsSpan(offset + (i * RobotrekData.EnemyEntrySize), RobotrekData.EnemyEntrySize);
			Enemies.Add(RobotrekEnemy.FromBytes(i, data));
		}
	}

	private void LoadInventions() {
		Inventions.Clear();
		int offset = ToFileOffset(RobotrekData.InventionDataBank, RobotrekData.InventionDataStart);

		for (int i = 0; i < RobotrekData.InventionCount; i++) {
			var data = _romData.AsSpan(offset + (i * RobotrekData.InventionEntrySize), RobotrekData.InventionEntrySize);
			Inventions.Add(RobotrekInvention.FromBytes(i, data));
		}
	}

	/// <summary>
	/// Save item changes back to ROM data.
	/// </summary>
	public void SaveItems() {
		int offset = ToFileOffset(RobotrekData.ItemDataBank, RobotrekData.ItemDataStart);

		foreach (var item in Items) {
			var bytes = item.ToBytes();
			bytes.CopyTo(_romData, offset + (item.Id * RobotrekData.ItemEntrySize));
		}
	}

	/// <summary>
	/// Save enemy changes back to ROM data.
	/// </summary>
	public void SaveEnemies() {
		int offset = ToFileOffset(RobotrekData.EnemyDataBank, RobotrekData.EnemyDataStart);

		foreach (var enemy in Enemies) {
			var bytes = enemy.ToBytes();
			bytes.CopyTo(_romData, offset + (enemy.Id * RobotrekData.EnemyEntrySize));
		}
	}

	/// <summary>
	/// Save invention changes back to ROM data.
	/// </summary>
	public void SaveInventions() {
		int offset = ToFileOffset(RobotrekData.InventionDataBank, RobotrekData.InventionDataStart);

		foreach (var invention in Inventions) {
			var bytes = invention.ToBytes();
			bytes.CopyTo(_romData, offset + (invention.Id * RobotrekData.InventionEntrySize));
		}
	}

	/// <summary>
	/// Save all changes and write to file.
	/// </summary>
	public void SaveToFile(string path) {
		SaveItems();
		SaveEnemies();
		SaveInventions();
		File.WriteAllBytes(path, _romData);
	}

	/// <summary>
	/// Export items to JSON.
	/// </summary>
	public string ExportItemsJson() {
		var data = new {
			game = "Robotrek",
			data_type = "items",
			items = Items
		};
		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		});
	}

	/// <summary>
	/// Export enemies to JSON.
	/// </summary>
	public string ExportEnemiesJson() {
		var data = new {
			game = "Robotrek",
			data_type = "enemies",
			enemies = Enemies
		};
		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		});
	}

	/// <summary>
	/// Export inventions to JSON.
	/// </summary>
	public string ExportInventionsJson() {
		var data = new {
			game = "Robotrek",
			data_type = "inventions",
			inventions = Inventions
		};
		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		});
	}
}
