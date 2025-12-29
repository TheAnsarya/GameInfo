namespace GameInfoTools.Data.SoulBlazer;

/// <summary>
/// Editor for Soul Blazer ROM data.
/// </summary>
public class SoulBlazerEditor {
	private readonly byte[] _romData;
	private readonly bool _hasHeader;

	public List<SoulBlazerItem> Items { get; private set; } = [];
	public List<SoulBlazerEnemy> Enemies { get; private set; } = [];
	public List<SoulBlazerSoulLair> SoulLairs { get; private set; } = [];

	/// <summary>
	/// Gets the ROM size.
	/// </summary>
	public int RomSize => _romData.Length;

	/// <summary>
	/// Gets whether ROM has a copier header.
	/// </summary>
	public bool HasHeader => _hasHeader;

	/// <summary>
	/// Expected SHA-256 hash for US version.
	/// </summary>
	public const string ExpectedSha256 = "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2";

	/// <summary>
	/// Create editor with ROM data.
	/// </summary>
	public SoulBlazerEditor(byte[] romData) {
		_romData = romData;
		_hasHeader = (romData.Length % 0x8000) == SoulBlazerRegions.HeaderSize;
		LoadAllData();
	}

	/// <summary>
	/// Load from ROM file.
	/// </summary>
	public static SoulBlazerEditor FromFile(string path) {
		var data = File.ReadAllBytes(path);
		return new SoulBlazerEditor(data);
	}

	/// <summary>
	/// Convert bank/address to file offset.
	/// </summary>
	private int ToFileOffset(int bank, int address) {
		return SoulBlazerData.ToFileOffset(bank, address, _hasHeader);
	}

	/// <summary>
	/// Load all data from ROM.
	/// </summary>
	private void LoadAllData() {
		LoadItems();
		LoadEnemies();
		LoadSoulLairs();
	}

	/// <summary>
	/// Load item data from ROM.
	/// </summary>
	private void LoadItems() {
		Items.Clear();

		int offset = SoulBlazerRegions.ItemTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		for (int i = 0; i < SoulBlazerData.ItemCount; i++) {
			if (offset + SoulBlazerData.ItemEntrySize > _romData.Length) break;

			var item = SoulBlazerItem.FromBytes(i, _romData.AsSpan(offset, SoulBlazerData.ItemEntrySize));
			Items.Add(item);
			offset += SoulBlazerData.ItemEntrySize;
		}
	}

	/// <summary>
	/// Load enemy data from ROM.
	/// </summary>
	private void LoadEnemies() {
		Enemies.Clear();

		int offset = SoulBlazerRegions.EnemyTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		for (int i = 0; i < SoulBlazerData.EnemyCount; i++) {
			if (offset + SoulBlazerData.EnemyEntrySize > _romData.Length) break;

			var enemy = SoulBlazerEnemy.FromBytes(i, _romData.AsSpan(offset, SoulBlazerData.EnemyEntrySize));
			Enemies.Add(enemy);
			offset += SoulBlazerData.EnemyEntrySize;
		}
	}

	/// <summary>
	/// Load soul lair data from ROM.
	/// </summary>
	private void LoadSoulLairs() {
		SoulLairs.Clear();

		int offset = SoulBlazerRegions.SoulLairTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		for (int i = 0; i < SoulBlazerData.SoulLairCount; i++) {
			if (offset + SoulBlazerData.SoulLairEntrySize > _romData.Length) break;

			var lair = SoulBlazerSoulLair.FromBytes(i, _romData.AsSpan(offset, SoulBlazerData.SoulLairEntrySize));
			SoulLairs.Add(lair);
			offset += SoulBlazerData.SoulLairEntrySize;
		}
	}

	/// <summary>
	/// Save item data back to ROM.
	/// </summary>
	public void SaveItems() {
		int offset = SoulBlazerRegions.ItemTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		foreach (var item in Items) {
			var bytes = item.ToBytes();
			Array.Copy(bytes, 0, _romData, offset, bytes.Length);
			offset += SoulBlazerData.ItemEntrySize;
		}
	}

	/// <summary>
	/// Save enemy data back to ROM.
	/// </summary>
	public void SaveEnemies() {
		int offset = SoulBlazerRegions.EnemyTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		foreach (var enemy in Enemies) {
			var bytes = enemy.ToBytes();
			Array.Copy(bytes, 0, _romData, offset, bytes.Length);
			offset += SoulBlazerData.EnemyEntrySize;
		}
	}

	/// <summary>
	/// Save soul lair data back to ROM.
	/// </summary>
	public void SaveSoulLairs() {
		int offset = SoulBlazerRegions.SoulLairTableOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		foreach (var lair in SoulLairs) {
			var bytes = lair.ToBytes();
			Array.Copy(bytes, 0, _romData, offset, bytes.Length);
			offset += SoulBlazerData.SoulLairEntrySize;
		}
	}

	/// <summary>
	/// Get the modified ROM data.
	/// </summary>
	public byte[] GetRomData() {
		return _romData;
	}

	/// <summary>
	/// Save ROM to file.
	/// </summary>
	public void SaveToFile(string path) {
		File.WriteAllBytes(path, _romData);
	}

	/// <summary>
	/// Read ROM title from header.
	/// </summary>
	public string GetRomTitle() {
		int offset = SoulBlazerRegions.HeaderOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		if (offset + 21 > _romData.Length) return "";

		return System.Text.Encoding.ASCII.GetString(_romData, offset, 21).TrimEnd();
	}

	/// <summary>
	/// Read checksum from ROM.
	/// </summary>
	public (ushort Checksum, ushort Complement) GetChecksum() {
		int offset = SoulBlazerRegions.ChecksumOffset;
		if (_hasHeader) offset += SoulBlazerRegions.HeaderSize;

		if (offset + 2 > _romData.Length) return (0, 0);

		ushort checksum = (ushort)(_romData[offset] | (_romData[offset + 1] << 8));
		ushort complement = (ushort)(_romData[offset - 2] | (_romData[offset - 1] << 8));

		return (checksum, complement);
	}

	/// <summary>
	/// Verify checksum is valid.
	/// </summary>
	public bool VerifyChecksum() {
		var (checksum, complement) = GetChecksum();
		return (checksum ^ complement) == 0xFFFF;
	}

	/// <summary>
	/// Update ROM checksum.
	/// </summary>
	public void UpdateChecksum() {
		int checksumOffset = SoulBlazerRegions.ChecksumOffset;
		int complementOffset = SoulBlazerRegions.ChecksumComplementOffset;
		if (_hasHeader) {
			checksumOffset += SoulBlazerRegions.HeaderSize;
			complementOffset += SoulBlazerRegions.HeaderSize;
		}

		// Zero out existing checksum
		_romData[checksumOffset] = 0;
		_romData[checksumOffset + 1] = 0;
		_romData[complementOffset] = 0;
		_romData[complementOffset + 1] = 0;

		// Calculate sum
		uint sum = 0;
		foreach (byte b in _romData) {
			sum += b;
		}

		ushort checksum = (ushort)(sum & 0xFFFF);
		ushort complement = (ushort)(checksum ^ 0xFFFF);

		// Write
		_romData[complementOffset] = (byte)(complement & 0xFF);
		_romData[complementOffset + 1] = (byte)(complement >> 8);
		_romData[checksumOffset] = (byte)(checksum & 0xFF);
		_romData[checksumOffset + 1] = (byte)(checksum >> 8);
	}
}
