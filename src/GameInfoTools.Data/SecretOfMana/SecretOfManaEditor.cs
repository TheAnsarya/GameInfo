using System.Security.Cryptography;

namespace GameInfoTools.Data.SecretOfMana;

/// <summary>
/// Editor and reader for Secret of Mana ROM data.
/// </summary>
public class SecretOfManaEditor {
	private readonly byte[] _romData;

	/// <summary>
	/// Create editor from ROM bytes.
	/// </summary>
	public SecretOfManaEditor(byte[] romData) {
		if (romData.Length != SecretOfManaData.RomSize) {
			throw new ArgumentException(
				$"Invalid ROM size. Expected {SecretOfManaData.RomSize} bytes, got {romData.Length}");
		}

		_romData = romData;
	}

	/// <summary>
	/// Load ROM from file.
	/// </summary>
	public static SecretOfManaEditor LoadFromFile(string path) {
		var data = File.ReadAllBytes(path);
		return new SecretOfManaEditor(data);
	}

	/// <summary>
	/// Save ROM to file.
	/// </summary>
	public void SaveToFile(string path) {
		File.WriteAllBytes(path, _romData);
	}

	/// <summary>
	/// Get ROM data as span.
	/// </summary>
	public ReadOnlySpan<byte> RomData => _romData;

	/// <summary>
	/// Verify ROM matches expected hash.
	/// </summary>
	public bool VerifyRom() {
		return ComputeSha256() == SecretOfManaData.ExpectedSha256;
	}

	/// <summary>
	/// Compute SHA256 hash of ROM.
	/// </summary>
	public string ComputeSha256() {
		var hash = SHA256.HashData(_romData);
		return Convert.ToHexString(hash).ToLowerInvariant();
	}

	#region Enemy Data

	/// <summary>
	/// Read all enemies from ROM.
	/// </summary>
	public IEnumerable<SecretOfManaEnemy> ReadAllEnemies() {
		for (int i = 0; i < SecretOfManaData.EnemyCount; i++) {
			yield return ReadEnemy(i);
		}
	}

	/// <summary>
	/// Read enemy by index.
	/// </summary>
	public SecretOfManaEnemy ReadEnemy(int index) {
		if (index < 0 || index >= SecretOfManaData.EnemyCount) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		int offset = SecretOfManaData.EnemyStatsOffset +
			(index * SecretOfManaData.EnemyStatsEntrySize);

		var span = _romData.AsSpan(offset, SecretOfManaData.EnemyStatsEntrySize);
		return SecretOfManaEnemy.FromBytes(index, span);
	}

	/// <summary>
	/// Write enemy data back to ROM.
	/// </summary>
	public void WriteEnemy(SecretOfManaEnemy enemy) {
		if (enemy.Id < 0 || enemy.Id >= SecretOfManaData.EnemyCount) {
			throw new ArgumentOutOfRangeException(nameof(enemy));
		}

		int offset = SecretOfManaData.EnemyStatsOffset +
			(enemy.Id * SecretOfManaData.EnemyStatsEntrySize);

		var bytes = enemy.ToBytes();
		Array.Copy(bytes, 0, _romData, offset, bytes.Length);
	}

	#endregion

	#region Exit Data

	/// <summary>
	/// Read exit by index.
	/// </summary>
	public SecretOfManaExit ReadExit(int index) {
		int offset = SecretOfManaData.ExitDataOffset +
			(index * SecretOfManaData.ExitEntrySize);

		if (offset + SecretOfManaData.ExitEntrySize > _romData.Length) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		var span = _romData.AsSpan(offset, SecretOfManaData.ExitEntrySize);
		return SecretOfManaExit.FromBytes(index, span);
	}

	/// <summary>
	/// Write exit data back to ROM.
	/// </summary>
	public void WriteExit(SecretOfManaExit exit) {
		int offset = SecretOfManaData.ExitDataOffset +
			(exit.Id * SecretOfManaData.ExitEntrySize);

		if (offset + SecretOfManaData.ExitEntrySize > _romData.Length) {
			throw new ArgumentOutOfRangeException(nameof(exit));
		}

		var bytes = exit.ToBytes();
		Array.Copy(bytes, 0, _romData, offset, bytes.Length);
	}

	#endregion

	#region Raw Data Access

	/// <summary>
	/// Read bytes at file offset.
	/// </summary>
	public byte[] ReadBytes(int offset, int count) {
		var result = new byte[count];
		Array.Copy(_romData, offset, result, 0, count);
		return result;
	}

	/// <summary>
	/// Read byte at file offset.
	/// </summary>
	public byte ReadByte(int offset) {
		return _romData[offset];
	}

	/// <summary>
	/// Read 16-bit word at file offset.
	/// </summary>
	public ushort ReadWord(int offset) {
		return SecretOfManaAddresses.ReadWord(_romData, offset);
	}

	/// <summary>
	/// Write bytes at file offset.
	/// </summary>
	public void WriteBytes(int offset, byte[] data) {
		Array.Copy(data, 0, _romData, offset, data.Length);
	}

	/// <summary>
	/// Write byte at file offset.
	/// </summary>
	public void WriteByte(int offset, byte value) {
		_romData[offset] = value;
	}

	/// <summary>
	/// Write 16-bit word at file offset.
	/// </summary>
	public void WriteWord(int offset, ushort value) {
		SecretOfManaAddresses.WriteWord(_romData, offset, value);
	}

	#endregion

	#region Checksum

	/// <summary>
	/// Update internal ROM checksum.
	/// </summary>
	public void UpdateChecksum() {
		// SNES internal checksum is at header offset $dc-$df
		// For headerless HiROM, header is at $ffc0
		const int headerBase = 0x00ffc0;
		const int checksumOffset = headerBase + 0x1c; // $ffdc
		const int checksumComplementOffset = headerBase + 0x1e; // $ffde

		// Clear existing checksum
		_romData[checksumOffset] = 0;
		_romData[checksumOffset + 1] = 0;
		_romData[checksumComplementOffset] = 0;
		_romData[checksumComplementOffset + 1] = 0;

		// Calculate sum of all bytes
		uint sum = 0;
		for (int i = 0; i < _romData.Length; i++) {
			sum += _romData[i];
		}

		ushort checksum = (ushort)(sum & 0xffff);
		ushort complement = (ushort)(checksum ^ 0xffff);

		// Write checksum and complement
		_romData[checksumComplementOffset] = (byte)(complement & 0xff);
		_romData[checksumComplementOffset + 1] = (byte)((complement >> 8) & 0xff);
		_romData[checksumOffset] = (byte)(checksum & 0xff);
		_romData[checksumOffset + 1] = (byte)((checksum >> 8) & 0xff);
	}

	#endregion
}
