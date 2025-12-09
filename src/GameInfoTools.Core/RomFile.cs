namespace GameInfoTools.Core;

/// <summary>
/// Base class for ROM file operations.
/// </summary>
public class RomFile : IDisposable {
	private byte[] _data = [];
	private bool _disposed;

	public string FilePath { get; private set; } = string.Empty;
	public RomHeader? Header { get; private set; }
	public int Length => _data.Length;
	public bool IsLoaded => _data.Length > 0;

	/// <summary>
	/// Gets the raw byte data of the ROM.
	/// </summary>
	public byte[] Data => _data;

	/// <summary>
	/// Get ROM information (system type, header size, title).
	/// </summary>
	public RomInfo GetInfo() => GetRomInfo(_data);

	/// <summary>
	/// Save the ROM to disk.
	/// </summary>
	public void Save(string? path = null) {
		var savePath = path ?? FilePath;
		if (string.IsNullOrEmpty(savePath))
			throw new InvalidOperationException("No file path specified");
		File.WriteAllBytes(savePath, _data);
	}

	/// <summary>
	/// Load a ROM file from disk.
	/// </summary>
	public async Task LoadAsync(string path, CancellationToken cancellationToken = default) {
		FilePath = path;
		_data = await File.ReadAllBytesAsync(path, cancellationToken);
		Header = DetectHeader();
	}

	/// <summary>
	/// Load a ROM file synchronously.
	/// </summary>
	public void Load(string path) {
		FilePath = path;
		_data = File.ReadAllBytes(path);
		Header = DetectHeader();
	}

	/// <summary>
	/// Save ROM to file.
	/// </summary>
	public async Task SaveAsync(string? path = null, CancellationToken cancellationToken = default) {
		var savePath = path ?? FilePath;
		await File.WriteAllBytesAsync(savePath, _data, cancellationToken);
	}

	/// <summary>
	/// Read bytes from ROM.
	/// </summary>
	public ReadOnlySpan<byte> Read(int offset, int length) {
		ArgumentOutOfRangeException.ThrowIfNegative(offset);
		ArgumentOutOfRangeException.ThrowIfGreaterThan(offset + length, _data.Length);
		return _data.AsSpan(offset, length);
	}

	/// <summary>
	/// Read a single byte.
	/// </summary>
	public byte ReadByte(int offset) {
		ArgumentOutOfRangeException.ThrowIfNegative(offset);
		ArgumentOutOfRangeException.ThrowIfGreaterThanOrEqual(offset, _data.Length);
		return _data[offset];
	}

	/// <summary>
	/// Read a 16-bit little-endian value.
	/// </summary>
	public ushort ReadUInt16(int offset) {
		var span = Read(offset, 2);
		return (ushort)(span[0] | (span[1] << 8));
	}

	/// <summary>
	/// Read a 24-bit little-endian value.
	/// </summary>
	public uint ReadUInt24(int offset) {
		var span = Read(offset, 3);
		return (uint)(span[0] | (span[1] << 8) | (span[2] << 16));
	}

	/// <summary>
	/// Write bytes to ROM.
	/// </summary>
	public void Write(int offset, ReadOnlySpan<byte> data) {
		ArgumentOutOfRangeException.ThrowIfNegative(offset);
		ArgumentOutOfRangeException.ThrowIfGreaterThan(offset + data.Length, _data.Length);
		data.CopyTo(_data.AsSpan(offset));
	}

	/// <summary>
	/// Write a single byte.
	/// </summary>
	public void WriteByte(int offset, byte value) {
		ArgumentOutOfRangeException.ThrowIfNegative(offset);
		ArgumentOutOfRangeException.ThrowIfGreaterThanOrEqual(offset, _data.Length);
		_data[offset] = value;
	}

	/// <summary>
	/// Get the entire ROM data as a span.
	/// </summary>
	public ReadOnlySpan<byte> AsSpan() => _data;

	/// <summary>
	/// Get ROM data without header.
	/// </summary>
	public ReadOnlySpan<byte> GetDataWithoutHeader() {
		var headerSize = Header?.HeaderSize ?? 0;
		return _data.AsSpan(headerSize);
	}

	/// <summary>
	/// Detect and parse ROM header.
	/// </summary>
	private RomHeader DetectHeader() {
		// Check for iNES header (NES)
		if (_data.Length >= 16 && _data[0] == 'N' && _data[1] == 'E' && _data[2] == 'S' && _data[3] == 0x1a) {
			return ParseInesHeader();
		}

		// Check for SMC header (SNES with 512-byte header)
		if (_data.Length % 0x8000 == 0x200) {
			return new RomHeader {
				System = SystemType.Snes,
				HeaderSize = 0x200,
				RawHeader = _data[..0x200]
			};
		}

		// Check for SNES internal header
		if (_data.Length >= 0x8000) {
			var loromHeader = TryParseSnesHeader(0x7fc0);
			var hiromHeader = TryParseSnesHeader(0xffc0);

			if (loromHeader != null)
				return loromHeader;
			if (hiromHeader != null)
				return hiromHeader;
		}

		return new RomHeader { System = SystemType.Unknown };
	}

	private RomHeader ParseInesHeader() {
		var prgSize = _data[4] * 16384;
		var chrSize = _data[5] * 8192;
		var mapper = (_data[6] >> 4) | (_data[7] & 0xf0);
		var hasBattery = (_data[6] & 0x02) != 0;
		var hasTrainer = (_data[6] & 0x04) != 0;

		return new RomHeader {
			System = SystemType.Nes,
			HeaderSize = hasTrainer ? 16 + 512 : 16,
			PrgRomSize = prgSize,
			ChrRomSize = chrSize,
			Mapper = mapper,
			HasBattery = hasBattery,
			HasTrainer = hasTrainer,
			RawHeader = _data[..16]
		};
	}

	private RomHeader? TryParseSnesHeader(int offset) {
		if (offset + 32 > _data.Length)
			return null;

		// Check for valid checksum complement
		var checksum = _data[offset + 0x1e] | (_data[offset + 0x1f] << 8);
		var complement = _data[offset + 0x1c] | (_data[offset + 0x1d] << 8);

		if ((checksum ^ complement) == 0xffff) {
			var titleBytes = _data.AsSpan(offset, 21);
			var title = System.Text.Encoding.ASCII.GetString(titleBytes).TrimEnd();

			return new RomHeader {
				System = SystemType.Snes,
				Title = title,
				HeaderSize = 0,
				RawHeader = _data.AsSpan(offset, 32).ToArray()
			};
		}

		return null;
	}

	protected virtual void Dispose(bool disposing) {
		if (!_disposed) {
			if (disposing) {
				_data = [];
			}
			_disposed = true;
		}
	}

	public void Dispose() {
		Dispose(true);
		GC.SuppressFinalize(this);
	}

	/// <summary>
	/// Get basic ROM information from raw data.
	/// </summary>
	public static RomInfo GetRomInfo(byte[] data) {
		// Check for NES header (iNES)
		if (data.Length >= 16 && data[0] == 'N' && data[1] == 'E' && data[2] == 'S' && data[3] == 0x1a) {
			return new RomInfo {
				System = SystemType.Nes,
				HeaderSize = 16,
				Size = data.Length
			};
		}

		// Check for SNES (check for header at common locations)
		if (data.Length >= 0x8000) {
			// LoROM header location
			if (data.Length >= 0x7fdc + 4) {
				int checksum = data[0x7fdc] | (data[0x7fdd] << 8);
				int complement = data[0x7fde] | (data[0x7fdf] << 8);
				if ((checksum ^ complement) == 0xffff) {
					return new RomInfo {
						System = SystemType.Snes,
						HeaderSize = (data.Length % 0x8000 == 0x200) ? 0x200 : 0,
						Size = data.Length
					};
				}
			}

			// HiROM header location
			if (data.Length >= 0xffdc + 4) {
				int checksum = data[0xffdc] | (data[0xffdd] << 8);
				int complement = data[0xffde] | (data[0xffdf] << 8);
				if ((checksum ^ complement) == 0xffff) {
					return new RomInfo {
						System = SystemType.Snes,
						HeaderSize = (data.Length % 0x8000 == 0x200) ? 0x200 : 0,
						Size = data.Length
					};
				}
			}
		}

		// Check for Game Boy
		if (data.Length >= 0x150 && data[0x104] == 0xce && data[0x105] == 0xed) {
			bool isGbc = data[0x143] == 0x80 || data[0x143] == 0xc0;
			return new RomInfo {
				System = isGbc ? SystemType.GameBoyColor : SystemType.GameBoy,
				HeaderSize = 0,
				Size = data.Length
			};
		}

		// Check for GBA
		if (data.Length >= 0xc0 && data[0xb2] == 0x96) {
			return new RomInfo {
				System = SystemType.GameBoyAdvance,
				HeaderSize = 0,
				Size = data.Length
			};
		}

		return new RomInfo {
			System = SystemType.Unknown,
			HeaderSize = 0,
			Size = data.Length
		};
	}
}
