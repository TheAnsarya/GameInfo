namespace GameInfoTools.Data.SoulBlazer;

/// <summary>
/// Item types in Soul Blazer.
/// </summary>
public enum SoulBlazerItemType : byte {
	Weapon = 0x00,
	Armor = 0x01,
	Shield = 0x02,
	Accessory = 0x03,
	Consumable = 0x04,
	KeyItem = 0x05
}

/// <summary>
/// Item flags for Soul Blazer.
/// </summary>
[Flags]
public enum SoulBlazerItemFlags : byte {
	None = 0x00,
	Equippable = 0x01,
	UsableInBattle = 0x02,
	UsableInField = 0x04,
	Stackable = 0x08,
	Cursed = 0x10,
	Unique = 0x20
}

/// <summary>
/// Soul Blazer item data structure.
/// </summary>
public class SoulBlazerItem {
	public int Id { get; set; }
	public byte ItemId { get; set; }
	public string Name { get; set; } = "";
	public SoulBlazerItemType ItemType { get; set; }
	public byte Power { get; set; }
	public byte Defense { get; set; }
	public ushort Price { get; set; }
	public SoulBlazerItemFlags Flags { get; set; }

	/// <summary>
	/// Sell price is typically half of buy price.
	/// </summary>
	public int SellPrice => Price / 2;

	/// <summary>
	/// Get item type name.
	/// </summary>
	public string TypeName => ItemType.ToString();

	/// <summary>
	/// Parse item from ROM bytes.
	/// </summary>
	public static SoulBlazerItem FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SoulBlazerData.ItemEntrySize) {
			throw new ArgumentException("Insufficient data for item");
		}

		return new SoulBlazerItem {
			Id = id,
			ItemId = data[0],
			ItemType = (SoulBlazerItemType)data[1],
			Power = data[2],
			Defense = data[3],
			Price = (ushort)(data[4] | (data[5] << 8)),
			Flags = (SoulBlazerItemFlags)data[6]
		};
	}

	/// <summary>
	/// Serialize item to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var bytes = new byte[SoulBlazerData.ItemEntrySize];
		bytes[0] = ItemId;
		bytes[1] = (byte)ItemType;
		bytes[2] = Power;
		bytes[3] = Defense;
		bytes[4] = (byte)(Price & 0xFF);
		bytes[5] = (byte)((Price >> 8) & 0xFF);
		bytes[6] = (byte)Flags;
		bytes[7] = 0; // Reserved
		return bytes;
	}
}

/// <summary>
/// Enemy behavior types.
/// </summary>
public enum SoulBlazerEnemyBehavior : byte {
	Stationary = 0x00,
	Patrol = 0x01,
	ChasePlayer = 0x02,
	Ranged = 0x03,
	FlyingPatrol = 0x04,
	FlyingChase = 0x05,
	Boss = 0x06,
	MiniBoss = 0x07
}

/// <summary>
/// Soul types that enemies release.
/// </summary>
public enum SoulBlazerSoulType : byte {
	None = 0x00,
	Villager = 0x01,
	Animal = 0x02,
	Plant = 0x03,
	Spirit = 0x04,
	Item = 0x05,
	Chest = 0x06,
	PathOpen = 0x07
}

/// <summary>
/// Soul Blazer enemy data structure.
/// </summary>
public class SoulBlazerEnemy {
	public int Id { get; set; }
	public byte EnemyId { get; set; }
	public string Name { get; set; } = "";
	public ushort HP { get; set; }
	public byte Attack { get; set; }
	public byte Defense { get; set; }
	public ushort Exp { get; set; }
	public byte Gems { get; set; }
	public SoulBlazerSoulType SoulType { get; set; }
	public byte SpriteId { get; set; }
	public SoulBlazerEnemyBehavior Behavior { get; set; }

	/// <summary>
	/// True if this is a boss enemy.
	/// </summary>
	public bool IsBoss => Behavior is SoulBlazerEnemyBehavior.Boss or SoulBlazerEnemyBehavior.MiniBoss;

	/// <summary>
	/// Parse enemy from ROM bytes.
	/// </summary>
	public static SoulBlazerEnemy FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SoulBlazerData.EnemyEntrySize) {
			throw new ArgumentException("Insufficient data for enemy");
		}

		return new SoulBlazerEnemy {
			Id = id,
			EnemyId = data[0],
			HP = (ushort)(data[1] | (data[2] << 8)),
			Attack = data[3],
			Defense = data[4],
			Exp = (ushort)(data[5] | (data[6] << 8)),
			Gems = data[7],
			SoulType = (SoulBlazerSoulType)data[8],
			SpriteId = data[9],
			Behavior = (SoulBlazerEnemyBehavior)data[10]
		};
	}

	/// <summary>
	/// Serialize enemy to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var bytes = new byte[SoulBlazerData.EnemyEntrySize];
		bytes[0] = EnemyId;
		bytes[1] = (byte)(HP & 0xFF);
		bytes[2] = (byte)((HP >> 8) & 0xFF);
		bytes[3] = Attack;
		bytes[4] = Defense;
		bytes[5] = (byte)(Exp & 0xFF);
		bytes[6] = (byte)((Exp >> 8) & 0xFF);
		bytes[7] = Gems;
		bytes[8] = (byte)SoulType;
		bytes[9] = SpriteId;
		bytes[10] = (byte)Behavior;
		// Bytes 11-15 reserved
		return bytes;
	}
}

/// <summary>
/// Release types for soul lairs.
/// </summary>
public enum SoulBlazerReleaseType : byte {
	Villager = 0x00,
	Animal = 0x01,
	Plant = 0x02,
	Object = 0x03,
	PathOpen = 0x04,
	Treasure = 0x05,
	BossKey = 0x06,
	Nothing = 0xFF
}

/// <summary>
/// Soul Blazer soul lair data structure.
/// </summary>
public class SoulBlazerSoulLair {
	public int Id { get; set; }
	public ushort X { get; set; }
	public ushort Y { get; set; }
	public byte EnemyType { get; set; }
	public byte EnemyCount { get; set; }
	public byte SoulsRequired { get; set; }
	public SoulBlazerReleaseType ReleaseType { get; set; }
	public byte ReleaseId { get; set; }
	public byte MapId { get; set; }

	/// <summary>
	/// Parse soul lair from ROM bytes.
	/// </summary>
	public static SoulBlazerSoulLair FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SoulBlazerData.SoulLairEntrySize) {
			throw new ArgumentException("Insufficient data for soul lair");
		}

		return new SoulBlazerSoulLair {
			Id = id,
			X = (ushort)(data[0] | (data[1] << 8)),
			Y = (ushort)(data[2] | (data[3] << 8)),
			EnemyType = data[4],
			EnemyCount = data[5],
			SoulsRequired = data[6],
			ReleaseType = (SoulBlazerReleaseType)data[7],
			ReleaseId = data[8],
			MapId = data[9]
		};
	}

	/// <summary>
	/// Serialize soul lair to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var bytes = new byte[SoulBlazerData.SoulLairEntrySize];
		bytes[0] = (byte)(X & 0xFF);
		bytes[1] = (byte)((X >> 8) & 0xFF);
		bytes[2] = (byte)(Y & 0xFF);
		bytes[3] = (byte)((Y >> 8) & 0xFF);
		bytes[4] = EnemyType;
		bytes[5] = EnemyCount;
		bytes[6] = SoulsRequired;
		bytes[7] = (byte)ReleaseType;
		bytes[8] = ReleaseId;
		bytes[9] = MapId;
		// Bytes 10-11 reserved
		return bytes;
	}
}
