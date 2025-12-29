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
/// </summary>
public class SecretOfManaEnemy {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public ushort Hp { get; set; }
	public ushort Mp { get; set; }
	public ushort Experience { get; set; }
	public ushort Gold { get; set; }
	public byte Level { get; set; }
	public byte WeaponPower { get; set; }
	public byte Defense { get; set; }
	public byte Evade { get; set; }
	public byte MagicDefense { get; set; }
	public Elements Weakness { get; set; }
	public byte DropItemId { get; set; }
	public byte DropChance { get; set; }

	/// <summary>
	/// Parse enemy from ROM bytes.
	/// </summary>
	public static SecretOfManaEnemy FromBytes(int id, ReadOnlySpan<byte> data) {
		if (data.Length < SecretOfManaData.EnemyStatsEntrySize) {
			throw new ArgumentException("Insufficient data for enemy");
		}

		return new SecretOfManaEnemy {
			Id = id,
			Hp = SecretOfManaAddresses.ReadWord(data, 0),
			Mp = SecretOfManaAddresses.ReadWord(data, 2),
			Experience = SecretOfManaAddresses.ReadWord(data, 4),
			Gold = SecretOfManaAddresses.ReadWord(data, 6),
			Level = data[8],
			WeaponPower = data[9],
			Defense = data[10],
			Evade = data[11],
			MagicDefense = data[12],
			Weakness = (Elements)data[13],
			// Additional fields would be parsed here
		};
	}

	/// <summary>
	/// Serialize enemy to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var bytes = new byte[SecretOfManaData.EnemyStatsEntrySize];
		SecretOfManaAddresses.WriteWord(bytes, 0, Hp);
		SecretOfManaAddresses.WriteWord(bytes, 2, Mp);
		SecretOfManaAddresses.WriteWord(bytes, 4, Experience);
		SecretOfManaAddresses.WriteWord(bytes, 6, Gold);
		bytes[8] = Level;
		bytes[9] = WeaponPower;
		bytes[10] = Defense;
		bytes[11] = Evade;
		bytes[12] = MagicDefense;
		bytes[13] = (byte)Weakness;
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
