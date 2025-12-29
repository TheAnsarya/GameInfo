namespace GameInfoTools.Data.SecretOfMana;

/// <summary>
/// Mana Spirit types.
/// </summary>
public enum ManaSpirit : byte {
	Undine = 0,
	Gnome = 1,
	Sylphid = 2,
	Salamando = 3,
	Shade = 4,
	Lumina = 5,
	Luna = 6,
	Dryad = 7
}

/// <summary>
/// Weapon types in Secret of Mana.
/// </summary>
public enum WeaponType : byte {
	Sword = 0,
	Spear = 1,
	Bow = 2,
	Axe = 3,
	Boomerang = 4,
	Glove = 5,
	Whip = 6,
	Javelin = 7
}

/// <summary>
/// Status effect flags.
/// </summary>
[Flags]
public enum StatusEffects : ushort {
	None = 0x0000,
	Poison = 0x0001,
	Sleep = 0x0002,
	Petrify = 0x0004,
	Confuse = 0x0008,
	Moogle = 0x0010,
	Barrel = 0x0020,
	Engulfed = 0x0040,
	Shrink = 0x0080,
	Speed = 0x0100,
	Slow = 0x0200,
	DefenseUp = 0x0400,
	DefenseDown = 0x0800,
	AttackUp = 0x1000,
	AttackDown = 0x2000,
	MagicDefenseUp = 0x4000,
	MagicDefenseDown = 0x8000
}

/// <summary>
/// Element flags for attacks and weaknesses.
/// </summary>
[Flags]
public enum Elements : byte {
	None = 0x00,
	Undine = 0x01,   // Water/Ice
	Gnome = 0x02,    // Earth
	Sylphid = 0x04,  // Wind
	Salamando = 0x08, // Fire
	Shade = 0x10,    // Dark
	Lumina = 0x20,   // Light
	Luna = 0x40,     // Moon
	Dryad = 0x80     // Wood
}

/// <summary>
/// Enemy data structure from ROM.
/// 29-byte format with HP as single byte at offset 0.
/// </summary>
public class SecretOfManaEnemy {
	public int Id { get; set; }
	public string Name { get; set; } = "";

	/// <summary>
	/// Enemy HP (byte value 0-255).
	/// </summary>
	public byte Hp { get; set; }

	/// <summary>
	/// Unknown byte at offset 1 (often duplicates HP).
	/// </summary>
	public byte Unknown1 { get; set; }

	/// <summary>
	/// Combat attribute bytes 8-9.
	/// </summary>
	public byte Attribute8 { get; set; }
	public byte Attribute9 { get; set; }

	/// <summary>
	/// Attack modifier at offset 10.
	/// </summary>
	public byte AttackMod { get; set; }

	/// <summary>
	/// Defense modifier at offset 11.
	/// </summary>
	public byte DefenseMod { get; set; }

	/// <summary>
	/// Raw experience value from bytes 20-21.
	/// </summary>
	public ushort ExpRaw { get; set; }

	/// <summary>
	/// Raw bytes for further analysis.
	/// </summary>
	public byte[] RawData { get; set; } = [];

	/// <summary>
	/// Parse enemy from ROM bytes.
	/// </summary>
	public static SecretOfManaEnemy FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SecretOfManaData.EnemyStatsEntrySize) {
			throw new ArgumentException("Insufficient data for enemy");
		}

		var rawData = data[..SecretOfManaData.EnemyStatsEntrySize].ToArray();

		return new SecretOfManaEnemy {
			Id = id,
			Hp = data[0],
			Unknown1 = data[1],
			Attribute8 = data[8],
			Attribute9 = data[9],
			AttackMod = data[10],
			DefenseMod = data[11],
			ExpRaw = SecretOfManaAddresses.ReadWord(data, 20),
			RawData = rawData
		};
	}

	/// <summary>
	/// Serialize enemy to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var bytes = new byte[SecretOfManaData.EnemyStatsEntrySize];
		if (RawData.Length >= SecretOfManaData.EnemyStatsEntrySize) {
			Array.Copy(RawData, bytes, SecretOfManaData.EnemyStatsEntrySize);
		}
		bytes[0] = Hp;
		bytes[1] = Unknown1;
		bytes[8] = Attribute8;
		bytes[9] = Attribute9;
		bytes[10] = AttackMod;
		bytes[11] = DefenseMod;
		SecretOfManaAddresses.WriteWord(bytes, 20, ExpRaw);
		return bytes;
	}
}

/// <summary>
/// Character stats structure.
/// </summary>
public class SecretOfManaCharacterStats {
	public int Level { get; set; }
	public int CharacterIndex { get; set; }
	public ushort Hp { get; set; }
	public ushort Mp { get; set; }
	public byte Strength { get; set; }
	public byte Agility { get; set; }
	public byte Constitution { get; set; }
	public byte Intelligence { get; set; }
	public byte Wisdom { get; set; }
	public byte Luck { get; set; }

	/// <summary>
	/// Character name (0=Hero, 1=Girl, 2=Sprite).
	/// </summary>
	public string CharacterName => CharacterIndex switch {
		0 => "Hero",
		1 => "Girl",
		2 => "Sprite",
		_ => $"Character {CharacterIndex}"
	};
}

/// <summary>
/// Item data structure.
/// </summary>
public class SecretOfManaItem {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public byte ItemType { get; set; }
	public ushort Price { get; set; }
	public byte Power { get; set; }
	public byte Defense { get; set; }
	public byte MagicDefense { get; set; }
	public Elements Element { get; set; }

	/// <summary>
	/// Sell price (typically half of buy price).
	/// </summary>
	public int SellPrice => Price / 2;
}

/// <summary>
/// Map exit data structure.
/// </summary>
public class SecretOfManaExit {
	public int Id { get; set; }
	public byte DestinationMap { get; set; }
	public byte DestinationX { get; set; }
	public byte DestinationY { get; set; }
	public byte Flags { get; set; }

	/// <summary>
	/// Parse exit from ROM bytes.
	/// </summary>
	public static SecretOfManaExit FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SecretOfManaData.ExitEntrySize) {
			throw new ArgumentException("Insufficient data for exit");
		}

		return new SecretOfManaExit {
			Id = id,
			DestinationMap = data[0],
			DestinationX = data[1],
			DestinationY = data[2],
			Flags = data[3]
		};
	}

	/// <summary>
	/// Serialize exit to bytes.
	/// </summary>
	public byte[] ToBytes() {
		return [DestinationMap, DestinationX, DestinationY, Flags];
	}
}

/// <summary>
/// Magic spell data structure.
/// </summary>
public class SecretOfManaMagic {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public ManaSpirit Spirit { get; set; }
	public bool IsGirlSpell { get; set; }
	public byte MpCost { get; set; }
	public byte BasePower { get; set; }
	public Elements Element { get; set; }

	/// <summary>
	/// Character that can use this spell.
	/// </summary>
	public string CasterName => IsGirlSpell ? "Girl" : "Sprite";
}

/// <summary>
/// Weapon data structure.
/// </summary>
public class SecretOfManaWeapon {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public WeaponType Type { get; set; }
	public byte Level { get; set; }
	public byte Attack { get; set; }
	public byte HitRate { get; set; }
	public byte CriticalRate { get; set; }
	public byte ChargeSpeed { get; set; }
	public byte OrbsRequired { get; set; }

	/// <summary>
	/// Weapon type name.
	/// </summary>
	public string TypeName => Type switch {
		WeaponType.Sword => "Sword",
		WeaponType.Spear => "Spear",
		WeaponType.Bow => "Bow",
		WeaponType.Axe => "Axe",
		WeaponType.Boomerang => "Boomerang",
		WeaponType.Glove => "Glove",
		WeaponType.Whip => "Whip",
		WeaponType.Javelin => "Javelin",
		_ => "Unknown"
	};
}

/// <summary>
/// Armor data structure.
/// </summary>
public class SecretOfManaArmor {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public byte ArmorType { get; set; }  // 0=Head, 1=Body, 2=Accessory
	public ushort Price { get; set; }
	public byte Defense { get; set; }
	public byte MagicDefense { get; set; }
	public byte Evade { get; set; }
	public Elements Resistance { get; set; }

	/// <summary>
	/// Armor type name.
	/// </summary>
	public string ArmorTypeName => ArmorType switch {
		0 => "Helmet",
		1 => "Armor",
		2 => "Accessory",
		_ => "Unknown"
	};
}
