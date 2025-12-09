namespace GameInfoTools.Core;

/// <summary>
/// Supported console/system types.
/// </summary>
public enum SystemType {
	Unknown,
	Nes,
	Snes,
	GameBoy,
	GameBoyColor,
	GameBoyAdvance,
	Genesis,
	MasterSystem,
	GameGear,
	TurboGrafx16,
	NeoGeo
}

/// <summary>
/// ROM header information.
/// </summary>
public record RomHeader {
	public SystemType System { get; init; }
	public string? Title { get; init; }
	public int HeaderSize { get; init; }
	public int PrgRomSize { get; init; }
	public int ChrRomSize { get; init; }
	public int Mapper { get; init; }
	public bool HasBattery { get; init; }
	public bool HasTrainer { get; init; }
	public byte[] RawHeader { get; init; } = [];
}

/// <summary>
/// Address space types.
/// </summary>
public enum AddressSpace {
	File,
	Cpu,
	Ppu,
	Sram
}

/// <summary>
/// Represents an address with context about which space it belongs to.
/// </summary>
public readonly struct GameAddress : IEquatable<GameAddress> {
	public int Value { get; }
	public AddressSpace Space { get; }
	public int Bank { get; }

	public GameAddress(int value, AddressSpace space = AddressSpace.File, int bank = -1) {
		Value = value;
		Space = space;
		Bank = bank;
	}

	public string ToHexString() => $"${Value:x6}";
	public string ToShortHex() => $"${Value:x4}";

	public override string ToString() => Space switch {
		AddressSpace.File => $"File:${Value:x6}",
		AddressSpace.Cpu => Bank >= 0 ? $"CPU:${Value:x4} (Bank {Bank})" : $"CPU:${Value:x4}",
		AddressSpace.Ppu => $"PPU:${Value:x4}",
		AddressSpace.Sram => $"SRAM:${Value:x4}",
		_ => $"${Value:x6}"
	};

	public bool Equals(GameAddress other) =>
		Value == other.Value && Space == other.Space && Bank == other.Bank;

	public override bool Equals(object? obj) => obj is GameAddress other && Equals(other);
	public override int GetHashCode() => HashCode.Combine(Value, Space, Bank);
	public static bool operator ==(GameAddress left, GameAddress right) => left.Equals(right);
	public static bool operator !=(GameAddress left, GameAddress right) => !left.Equals(right);
}

/// <summary>
/// Represents a label/symbol in the ROM.
/// </summary>
public record Label {
	public required string Name { get; init; }
	public required GameAddress Address { get; init; }
	public string? Comment { get; init; }
	public LabelType Type { get; init; } = LabelType.Unknown;
}

/// <summary>
/// Label type classification.
/// </summary>
public enum LabelType {
	Unknown,
	Code,
	Data,
	Pointer,
	Text,
	Graphics,
	Audio
}

/// <summary>
/// Basic ROM information.
/// </summary>
public record RomInfo {
	public SystemType System { get; init; }
	public int HeaderSize { get; init; }
	public int Size { get; init; }
	public string? Title { get; init; }
	public int Mapper { get; init; }
}
