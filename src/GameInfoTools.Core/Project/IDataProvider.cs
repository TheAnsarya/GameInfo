namespace GameInfoTools.Core.Project;

/// <summary>
/// Provides access to data from either a ROM file or project asset.
/// Allows views to work with either direct ROM data or extracted project assets.
/// </summary>
public interface IDataProvider {
	/// <summary>Gets whether data is available.</summary>
	bool HasData { get; }

	/// <summary>Gets the data source name for display.</summary>
	string SourceName { get; }

	/// <summary>Gets the raw data bytes.</summary>
	byte[] Data { get; }

	/// <summary>Gets the data length.</summary>
	int Length { get; }

	/// <summary>Reads a byte at the specified offset.</summary>
	byte ReadByte(int offset);

	/// <summary>Reads a word (2 bytes, little-endian) at the specified offset.</summary>
	ushort ReadWord(int offset);

	/// <summary>Reads bytes from the specified range.</summary>
	byte[] ReadBytes(int offset, int length);

	/// <summary>Writes a byte at the specified offset.</summary>
	void WriteByte(int offset, byte value);

	/// <summary>Writes a word (2 bytes, little-endian) at the specified offset.</summary>
	void WriteWord(int offset, ushort value);

	/// <summary>Writes bytes at the specified offset.</summary>
	void WriteBytes(int offset, byte[] data);
}

/// <summary>
/// Data provider backed by a RomFile.
/// </summary>
public class RomDataProvider : IDataProvider {
	private readonly RomFile _rom;

	public RomDataProvider(RomFile rom) {
		_rom = rom ?? throw new ArgumentNullException(nameof(rom));
	}

	public bool HasData => _rom.IsLoaded;

	public string SourceName => _rom.FilePath is not null
		? Path.GetFileName(_rom.FilePath)
		: "Loaded ROM";

	public byte[] Data => _rom.Data;

	public int Length => _rom.Length;

	public byte ReadByte(int offset) => _rom.Data[offset];

	public ushort ReadWord(int offset) =>
		(ushort)(_rom.Data[offset] | (_rom.Data[offset + 1] << 8));

	public byte[] ReadBytes(int offset, int length) {
		var result = new byte[length];
		Array.Copy(_rom.Data, offset, result, 0, length);
		return result;
	}

	public void WriteByte(int offset, byte value) {
		_rom.Data[offset] = value;
	}

	public void WriteWord(int offset, ushort value) {
		_rom.Data[offset] = (byte)(value & 0xFF);
		_rom.Data[offset + 1] = (byte)((value >> 8) & 0xFF);
	}

	public void WriteBytes(int offset, byte[] data) {
		Array.Copy(data, 0, _rom.Data, offset, data.Length);
	}
}

/// <summary>
/// Data provider backed by project asset data.
/// </summary>
public class ProjectAssetDataProvider : IDataProvider {
	private readonly byte[] _data;
	private readonly string _assetPath;

	public ProjectAssetDataProvider(byte[] data, string assetPath) {
		_data = data ?? throw new ArgumentNullException(nameof(data));
		_assetPath = assetPath;
	}

	public bool HasData => _data.Length > 0;

	public string SourceName => Path.GetFileName(_assetPath);

	public byte[] Data => _data;

	public int Length => _data.Length;

	public byte ReadByte(int offset) => _data[offset];

	public ushort ReadWord(int offset) =>
		(ushort)(_data[offset] | (_data[offset + 1] << 8));

	public byte[] ReadBytes(int offset, int length) {
		var result = new byte[length];
		Array.Copy(_data, offset, result, 0, length);
		return result;
	}

	public void WriteByte(int offset, byte value) {
		_data[offset] = value;
	}

	public void WriteWord(int offset, ushort value) {
		_data[offset] = (byte)(value & 0xFF);
		_data[offset + 1] = (byte)((value >> 8) & 0xFF);
	}

	public void WriteBytes(int offset, byte[] data) {
		Array.Copy(data, 0, _data, offset, data.Length);
	}
}

/// <summary>
/// Empty data provider when no data is available.
/// </summary>
public class EmptyDataProvider : IDataProvider {
	public static EmptyDataProvider Instance { get; } = new();

	public bool HasData => false;

	public string SourceName => "No data";

	public byte[] Data => [];

	public int Length => 0;

	public byte ReadByte(int offset) => 0;

	public ushort ReadWord(int offset) => 0;

	public byte[] ReadBytes(int offset, int length) => new byte[length];

	public void WriteByte(int offset, byte value) { }

	public void WriteWord(int offset, ushort value) { }

	public void WriteBytes(int offset, byte[] data) { }
}
