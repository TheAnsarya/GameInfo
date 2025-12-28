using System.Globalization;

namespace DQ3Lib.Common.SNES.Graphics;

public class BGMapEntry {
	public ushort Data { get; set; }

	public BGMapEntry() { }

	public BGMapEntry(ushort data) {
		Data = data;
	}

	// bits 0-9, values 0x000-0x3ff
	public int TileNumber {
		get => 0x03ff & Data;
		set {
			if (value is < 0 or > 0x3ff) {
				throw new ArgumentOutOfRangeException($"Value must be between 0 and 0x3ff: {value}, {value.ToString("x4", CultureInfo.InvariantCulture)}");
			}

			Data = (ushort)((Data & 0xfc) + value);
		}
	}

	// bits 10-12, values 0-7
	public int PaletteNumber {
		get => (0x1c00 & Data) >> 10;
		set {
			if (value is < 0 or > 7) {
				throw new ArgumentOutOfRangeException($"Value must be between 0 and 7: {value}, {value.ToString("x4", CultureInfo.InvariantCulture)}");
			}

			Data = (ushort)((Data & 0xe3ff) + (value << 10));
		}
	}

	// bit 13, 0 = lower, 1 = higher
	public bool Priority {
		get => (0x2000 & Data) != 0;
		set => Data = (ushort)((0xdfff & Data) + (value ? 0x2000 : 0));
	}

	// bit 14, 0 = normal, 1 = mirror horizontally
	public bool XFlip {
		get => (0x4000 & Data) != 0;
		set => Data = (ushort)((0xbfff & Data) + (value ? 0x4000 : 0));
	}

	// bit 15, 0 = Normal, 1 = mirror vertically
	public bool YFlip {
		get => (0x8000 & Data) != 0;
		set => Data = (ushort)((0x7fff & Data) + (value ? 0x8000 : 0));
	}
}
