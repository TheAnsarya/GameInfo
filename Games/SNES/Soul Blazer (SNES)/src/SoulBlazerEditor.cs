using System.Text.Json;
using GameInfoTools.Core;

namespace GameInfoTools.Games.SoulBlazer;

/// <summary>
/// Soul Blazer (SNES) ROM editor.
/// </summary>
public class SoulBlazerEditor : IDisposable {
	private readonly RomFile _rom;
	private bool _disposed;

	// Known ROM offsets
	private const int HeaderOffset = 0x7fc0;
	private const int ChecksumOffset = 0x7fde;
	private const int ChecksumComplementOffset = 0x7fdc;

	// ROM information
	public const string ExpectedSha256 = "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2";
	public const int ExpectedSize = 1048576;

	/// <summary>
	/// Gets the underlying ROM file.
	/// </summary>
	public RomFile Rom => _rom;

	/// <summary>
	/// Gets whether the ROM has been modified.
	/// </summary>
	public bool IsModified { get; private set; }

	/// <summary>
	/// Creates a new Soul Blazer editor.
	/// </summary>
	public SoulBlazerEditor() {
		_rom = new RomFile();
	}

	/// <summary>
	/// Load a Soul Blazer ROM.
	/// </summary>
	public void Load(string path) {
		_rom.Load(path);
		IsModified = false;
	}

	/// <summary>
	/// Load a Soul Blazer ROM asynchronously.
	/// </summary>
	public async Task LoadAsync(string path, CancellationToken ct = default) {
		await _rom.LoadAsync(path, ct);
		IsModified = false;
	}

	/// <summary>
	/// Save the ROM to disk.
	/// </summary>
	public void Save(string? path = null) {
		UpdateChecksum();
		_rom.Save(path);
		IsModified = false;
	}

	/// <summary>
	/// Convert LoROM CPU address to file offset.
	/// </summary>
	public static int LoRomToFile(int bank, int address) {
		if (bank >= 0x80)
			bank -= 0x80;
		return bank * 0x8000 + (address & 0x7fff);
	}

	/// <summary>
	/// Convert file offset to LoROM bank and address.
	/// </summary>
	public static (int Bank, int Address) FileToLoRom(int offset) {
		int bank = offset / 0x8000;
		int address = 0x8000 + (offset % 0x8000);
		return (bank, address);
	}

	/// <summary>
	/// Read a byte from the ROM.
	/// </summary>
	public byte ReadByte(int offset) => _rom.ReadByte(offset);

	/// <summary>
	/// Read a 16-bit word (little-endian).
	/// </summary>
	public ushort ReadWord(int offset) => _rom.ReadUInt16(offset);

	/// <summary>
	/// Read a 24-bit value (little-endian).
	/// </summary>
	public uint ReadLong(int offset) => _rom.ReadUInt24(offset);

	/// <summary>
	/// Write a byte to the ROM.
	/// </summary>
	public void WriteByte(int offset, byte value) {
		_rom.WriteByte(offset, value);
		IsModified = true;
	}

	/// <summary>
	/// Write a 16-bit word (little-endian).
	/// </summary>
	public void WriteWord(int offset, ushort value) {
		_rom.Write(offset, [(byte)(value & 0xff), (byte)(value >> 8)]);
		IsModified = true;
	}

	/// <summary>
	/// Update the ROM checksum.
	/// </summary>
	public void UpdateChecksum() {
		// Zero out existing checksum
		var data = _rom.Data;
		data[ChecksumOffset] = 0;
		data[ChecksumOffset + 1] = 0;
		data[ChecksumComplementOffset] = 0;
		data[ChecksumComplementOffset + 1] = 0;

		// Calculate sum of all bytes
		uint sum = 0;
		foreach (byte b in data)
			sum += b;

		ushort checksum = (ushort)(sum & 0xffff);
		ushort complement = (ushort)(checksum ^ 0xffff);

		// Write checksum and complement
		data[ChecksumComplementOffset] = (byte)(complement & 0xff);
		data[ChecksumComplementOffset + 1] = (byte)(complement >> 8);
		data[ChecksumOffset] = (byte)(checksum & 0xff);
		data[ChecksumOffset + 1] = (byte)(checksum >> 8);
	}

	/// <summary>
	/// Verify the ROM checksum.
	/// </summary>
	public bool VerifyChecksum() {
		ushort stored = ReadWord(ChecksumOffset);
		ushort complement = ReadWord(ChecksumComplementOffset);
		return (stored ^ complement) == 0xffff;
	}

	/// <summary>
	/// Get the internal ROM title.
	/// </summary>
	public string GetTitle() {
		var span = _rom.Read(HeaderOffset, 21);
		return System.Text.Encoding.ASCII.GetString(span).TrimEnd();
	}

	/// <summary>
	/// Get enemy data by ID.
	/// </summary>
	public EnemyData? GetEnemy(int id) {
		// Enemy table location needs verification
		int tableOffset = 0x030000;
		int entrySize = 16;
		int offset = tableOffset + id * entrySize;

		if (offset + entrySize > _rom.Length)
			return null;

		return new EnemyData {
			Id = id,
			Hp = ReadWord(offset),
			Attack = ReadByte(offset + 2),
			Defense = ReadByte(offset + 3),
			Exp = ReadWord(offset + 4),
			Gems = ReadByte(offset + 6),
			SoulType = ReadByte(offset + 7),
			SpriteId = ReadByte(offset + 8),
			Behavior = ReadByte(offset + 9),
		};
	}

	/// <summary>
	/// Set enemy data.
	/// </summary>
	public void SetEnemy(EnemyData enemy) {
		int tableOffset = 0x030000;
		int entrySize = 16;
		int offset = tableOffset + enemy.Id * entrySize;

		WriteWord(offset, enemy.Hp);
		WriteByte(offset + 2, enemy.Attack);
		WriteByte(offset + 3, enemy.Defense);
		WriteWord(offset + 4, enemy.Exp);
		WriteByte(offset + 6, enemy.Gems);
		WriteByte(offset + 7, enemy.SoulType);
		WriteByte(offset + 8, enemy.SpriteId);
		WriteByte(offset + 9, enemy.Behavior);
	}

	/// <summary>
	/// Export all enemies to JSON.
	/// </summary>
	public void ExportEnemies(string path, int count = 100) {
		var enemies = new List<EnemyData>();

		for (int i = 0; i < count; i++) {
			var enemy = GetEnemy(i);
			if (enemy != null)
				enemies.Add(enemy);
		}

		var json = JsonSerializer.Serialize(enemies, new JsonSerializerOptions {
			WriteIndented = true
		});

		File.WriteAllText(path, json);
	}

	/// <summary>
	/// Import enemies from JSON.
	/// </summary>
	public void ImportEnemies(string path) {
		var json = File.ReadAllText(path);
		var enemies = JsonSerializer.Deserialize<List<EnemyData>>(json);

		if (enemies != null) {
			foreach (var enemy in enemies)
				SetEnemy(enemy);
		}
	}

	protected virtual void Dispose(bool disposing) {
		if (!_disposed) {
			if (disposing) {
				_rom.Dispose();
			}
			_disposed = true;
		}
	}

	public void Dispose() {
		Dispose(true);
		GC.SuppressFinalize(this);
	}
}

/// <summary>
/// Enemy data structure.
/// </summary>
public class EnemyData {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public ushort Hp { get; set; }
	public byte Attack { get; set; }
	public byte Defense { get; set; }
	public ushort Exp { get; set; }
	public byte Gems { get; set; }
	public byte SoulType { get; set; }
	public byte SpriteId { get; set; }
	public byte Behavior { get; set; }
}

/// <summary>
/// Item data structure.
/// </summary>
public class ItemData {
	public int Id { get; set; }
	public string Name { get; set; } = "";
	public byte Type { get; set; }
	public byte Power { get; set; }
	public ushort Price { get; set; }
}

/// <summary>
/// Soul lair data structure.
/// </summary>
public class SoulLairData {
	public int Id { get; set; }
	public ushort X { get; set; }
	public ushort Y { get; set; }
	public byte EnemyType { get; set; }
	public byte EnemyCount { get; set; }
	public byte SoulCount { get; set; }
	public byte ReleaseType { get; set; }
	public byte ReleaseId { get; set; }
}
