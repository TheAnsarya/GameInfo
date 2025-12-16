using System.Drawing;

namespace GameInfoTools.Core.Graphics;

/// <summary>
/// Represents a color palette for retro game graphics
/// </summary>
public class GamePalette {
	private readonly List<Color> _colors = [];

	/// <summary>
	/// Name of the palette
	/// </summary>
	public string Name { get; set; } = "Untitled";

	/// <summary>
	/// Colors in the palette
	/// </summary>
	public IReadOnlyList<Color> Colors => _colors;

	/// <summary>
	/// Number of colors in the palette
	/// </summary>
	public int Count => _colors.Count;

	/// <summary>
	/// Bits per pixel for this palette (2=4 colors, 4=16 colors, 8=256 colors)
	/// </summary>
	public int BitsPerPixel { get; set; } = 4;

	/// <summary>
	/// Platform-specific format info
	/// </summary>
	public PaletteFormat Format { get; set; } = PaletteFormat.Rgb888;

	/// <summary>
	/// Source address in ROM (if known)
	/// </summary>
	public int? SourceAddress { get; set; }

	/// <summary>
	/// Add a color to the palette
	/// </summary>
	public void AddColor(Color color) => _colors.Add(color);

	/// <summary>
	/// Set a color at a specific index
	/// </summary>
	public void SetColor(int index, Color color) {
		while (_colors.Count <= index) {
			_colors.Add(Color.Black);
		}
		_colors[index] = color;
	}

	/// <summary>
	/// Get a color at a specific index
	/// </summary>
	public Color GetColor(int index) {
		return index >= 0 && index < _colors.Count ? _colors[index] : Color.Magenta;
	}

	/// <summary>
	/// Clear all colors
	/// </summary>
	public void Clear() => _colors.Clear();

	/// <summary>
	/// Create a deep copy of this palette
	/// </summary>
	public GamePalette Clone() {
		var clone = new GamePalette {
			Name = Name,
			BitsPerPixel = BitsPerPixel,
			Format = Format,
			SourceAddress = SourceAddress
		};
		foreach (var color in _colors) {
			clone.AddColor(color);
		}
		return clone;
	}
}

/// <summary>
/// Palette format types
/// </summary>
public enum PaletteFormat {
	/// <summary>RGB 24-bit (8-8-8)</summary>
	Rgb888,
	/// <summary>BGR 24-bit (8-8-8)</summary>
	Bgr888,
	/// <summary>RGB 15-bit SNES/GBA (5-5-5)</summary>
	Rgb555,
	/// <summary>BGR 15-bit (5-5-5)</summary>
	Bgr555,
	/// <summary>RGB 16-bit Genesis (3-3-3 in 4-4-4)</summary>
	Genesis,
	/// <summary>NES palette indices</summary>
	Nes,
	/// <summary>Game Boy 2-bit grayscale</summary>
	GameBoy,
	/// <summary>Game Boy Color 15-bit (5-5-5)</summary>
	GameBoyColor
}

/// <summary>
/// Analyzes and manipulates color palettes
/// </summary>
public class PaletteAnalyzer {
	/// <summary>
	/// Parse colors from raw bytes using the specified format
	/// </summary>
	public static GamePalette ParseFromBytes(byte[] data, PaletteFormat format, int colorCount = 16) {
		var palette = new GamePalette { Format = format };

		switch (format) {
			case PaletteFormat.Rgb888:
				ParseRgb888(data, palette, colorCount);
				break;
			case PaletteFormat.Bgr888:
				ParseBgr888(data, palette, colorCount);
				break;
			case PaletteFormat.Rgb555:
			case PaletteFormat.GameBoyColor:
				ParseRgb555(data, palette, colorCount);
				break;
			case PaletteFormat.Bgr555:
				ParseBgr555(data, palette, colorCount);
				break;
			case PaletteFormat.Genesis:
				ParseGenesis(data, palette, colorCount);
				break;
			case PaletteFormat.Nes:
				ParseNes(data, palette, colorCount);
				break;
			case PaletteFormat.GameBoy:
				ParseGameBoy(data, palette);
				break;
		}

		return palette;
	}

	private static void ParseRgb888(byte[] data, GamePalette palette, int colorCount) {
		for (var i = 0; i < colorCount && i * 3 + 2 < data.Length; i++) {
			var r = data[i * 3];
			var g = data[i * 3 + 1];
			var b = data[i * 3 + 2];
			palette.AddColor(Color.FromArgb(r, g, b));
		}
	}

	private static void ParseBgr888(byte[] data, GamePalette palette, int colorCount) {
		for (var i = 0; i < colorCount && i * 3 + 2 < data.Length; i++) {
			var b = data[i * 3];
			var g = data[i * 3 + 1];
			var r = data[i * 3 + 2];
			palette.AddColor(Color.FromArgb(r, g, b));
		}
	}

	private static void ParseRgb555(byte[] data, GamePalette palette, int colorCount) {
		for (var i = 0; i < colorCount && i * 2 + 1 < data.Length; i++) {
			var value = data[i * 2] | (data[i * 2 + 1] << 8);
			var r = ((value >> 0) & 0x1F) * 255 / 31;
			var g = ((value >> 5) & 0x1F) * 255 / 31;
			var b = ((value >> 10) & 0x1F) * 255 / 31;
			palette.AddColor(Color.FromArgb(r, g, b));
		}
	}

	private static void ParseBgr555(byte[] data, GamePalette palette, int colorCount) {
		for (var i = 0; i < colorCount && i * 2 + 1 < data.Length; i++) {
			var value = data[i * 2] | (data[i * 2 + 1] << 8);
			var b = ((value >> 0) & 0x1F) * 255 / 31;
			var g = ((value >> 5) & 0x1F) * 255 / 31;
			var r = ((value >> 10) & 0x1F) * 255 / 31;
			palette.AddColor(Color.FromArgb(r, g, b));
		}
	}

	private static void ParseGenesis(byte[] data, GamePalette palette, int colorCount) {
		// Genesis uses 9-bit color: 0000BBB0 GGG0RRR0
		for (var i = 0; i < colorCount && i * 2 + 1 < data.Length; i++) {
			var value = (data[i * 2] << 8) | data[i * 2 + 1]; // Big endian
			var r = ((value >> 1) & 0x07) * 255 / 7;
			var g = ((value >> 5) & 0x07) * 255 / 7;
			var b = ((value >> 9) & 0x07) * 255 / 7;
			palette.AddColor(Color.FromArgb(r, g, b));
		}
	}

	// Standard NES palette (2C02)
	private static readonly Color[] NesMasterPalette = [
		Color.FromArgb(84, 84, 84),    // 00
		Color.FromArgb(0, 30, 116),    // 01
		Color.FromArgb(8, 16, 144),    // 02
		Color.FromArgb(48, 0, 136),    // 03
		Color.FromArgb(68, 0, 100),    // 04
		Color.FromArgb(92, 0, 48),     // 05
		Color.FromArgb(84, 4, 0),      // 06
		Color.FromArgb(60, 24, 0),     // 07
		Color.FromArgb(32, 42, 0),     // 08
		Color.FromArgb(8, 58, 0),      // 09
		Color.FromArgb(0, 64, 0),      // 0A
		Color.FromArgb(0, 60, 0),      // 0B
		Color.FromArgb(0, 50, 60),     // 0C
		Color.FromArgb(0, 0, 0),       // 0D
		Color.FromArgb(0, 0, 0),       // 0E
		Color.FromArgb(0, 0, 0),       // 0F
		Color.FromArgb(152, 150, 152), // 10
		Color.FromArgb(8, 76, 196),    // 11
		Color.FromArgb(48, 50, 236),   // 12
		Color.FromArgb(92, 30, 228),   // 13
		Color.FromArgb(136, 20, 176),  // 14
		Color.FromArgb(160, 20, 100),  // 15
		Color.FromArgb(152, 34, 32),   // 16
		Color.FromArgb(120, 60, 0),    // 17
		Color.FromArgb(84, 90, 0),     // 18
		Color.FromArgb(40, 114, 0),    // 19
		Color.FromArgb(8, 124, 0),     // 1A
		Color.FromArgb(0, 118, 40),    // 1B
		Color.FromArgb(0, 102, 120),   // 1C
		Color.FromArgb(0, 0, 0),       // 1D
		Color.FromArgb(0, 0, 0),       // 1E
		Color.FromArgb(0, 0, 0),       // 1F
		Color.FromArgb(236, 238, 236), // 20
		Color.FromArgb(76, 154, 236),  // 21
		Color.FromArgb(120, 124, 236), // 22
		Color.FromArgb(176, 98, 236),  // 23
		Color.FromArgb(228, 84, 236),  // 24
		Color.FromArgb(236, 88, 180),  // 25
		Color.FromArgb(236, 106, 100), // 26
		Color.FromArgb(212, 136, 32),  // 27
		Color.FromArgb(160, 170, 0),   // 28
		Color.FromArgb(116, 196, 0),   // 29
		Color.FromArgb(76, 208, 32),   // 2A
		Color.FromArgb(56, 204, 108),  // 2B
		Color.FromArgb(56, 180, 204),  // 2C
		Color.FromArgb(60, 60, 60),    // 2D
		Color.FromArgb(0, 0, 0),       // 2E
		Color.FromArgb(0, 0, 0),       // 2F
		Color.FromArgb(236, 238, 236), // 30
		Color.FromArgb(168, 204, 236), // 31
		Color.FromArgb(188, 188, 236), // 32
		Color.FromArgb(212, 178, 236), // 33
		Color.FromArgb(236, 174, 236), // 34
		Color.FromArgb(236, 174, 212), // 35
		Color.FromArgb(236, 180, 176), // 36
		Color.FromArgb(228, 196, 144), // 37
		Color.FromArgb(204, 210, 120), // 38
		Color.FromArgb(180, 222, 120), // 39
		Color.FromArgb(168, 226, 144), // 3A
		Color.FromArgb(152, 226, 180), // 3B
		Color.FromArgb(160, 214, 228), // 3C
		Color.FromArgb(160, 162, 160), // 3D
		Color.FromArgb(0, 0, 0),       // 3E
		Color.FromArgb(0, 0, 0)        // 3F
	];

	private static void ParseNes(byte[] data, GamePalette palette, int colorCount) {
		for (var i = 0; i < colorCount && i < data.Length; i++) {
			var index = data[i] & 0x3F;
			palette.AddColor(NesMasterPalette[index]);
		}
	}

	private static void ParseGameBoy(byte[] data, GamePalette palette) {
		// Game Boy BGP/OBP register: 2 bits per color, 4 colors
		if (data.Length == 0) return;

		var bgp = data[0];
		var shades = new[] { 255, 170, 85, 0 }; // White to black

		for (var i = 0; i < 4; i++) {
			var shade = shades[(bgp >> (i * 2)) & 0x03];
			palette.AddColor(Color.FromArgb(shade, shade, shade));
		}
	}

	/// <summary>
	/// Convert palette to raw bytes
	/// </summary>
	public static byte[] ToBytes(GamePalette palette) {
		var bytes = new List<byte>();

		foreach (var color in palette.Colors) {
			switch (palette.Format) {
				case PaletteFormat.Rgb888:
					bytes.Add(color.R);
					bytes.Add(color.G);
					bytes.Add(color.B);
					break;

				case PaletteFormat.Bgr888:
					bytes.Add(color.B);
					bytes.Add(color.G);
					bytes.Add(color.R);
					break;

				case PaletteFormat.Rgb555:
				case PaletteFormat.GameBoyColor:
					var rgb555 = ((color.R * 31 / 255) << 0) |
								 ((color.G * 31 / 255) << 5) |
								 ((color.B * 31 / 255) << 10);
					bytes.Add((byte)(rgb555 & 0xFF));
					bytes.Add((byte)((rgb555 >> 8) & 0xFF));
					break;

				case PaletteFormat.Bgr555:
					var bgr555 = ((color.B * 31 / 255) << 0) |
								 ((color.G * 31 / 255) << 5) |
								 ((color.R * 31 / 255) << 10);
					bytes.Add((byte)(bgr555 & 0xFF));
					bytes.Add((byte)((bgr555 >> 8) & 0xFF));
					break;

				case PaletteFormat.Genesis:
					var genesis = ((color.R * 7 / 255) << 1) |
								  ((color.G * 7 / 255) << 5) |
								  ((color.B * 7 / 255) << 9);
					bytes.Add((byte)((genesis >> 8) & 0xFF)); // Big endian
					bytes.Add((byte)(genesis & 0xFF));
					break;
			}
		}

		return [.. bytes];
	}

	/// <summary>
	/// Analyze color distribution in palette
	/// </summary>
	public static PaletteAnalysisResult Analyze(GamePalette palette) {
		if (palette.Count == 0) {
			return new PaletteAnalysisResult();
		}

		var colors = palette.Colors.ToList();

		// Calculate average color
		var avgR = (int)colors.Average(c => c.R);
		var avgG = (int)colors.Average(c => c.G);
		var avgB = (int)colors.Average(c => c.B);

		// Find brightest and darkest
		var brightest = colors.OrderByDescending(c => c.R + c.G + c.B).First();
		var darkest = colors.OrderBy(c => c.R + c.G + c.B).First();

		// Calculate saturation and brightness ranges
		var saturations = colors.Select(c => GetSaturation(c)).ToList();
		var brightnesses = colors.Select(c => GetBrightness(c)).ToList();

		// Find unique colors
		var uniqueColors = colors.Distinct().Count();

		// Detect if grayscale
		var isGrayscale = colors.All(c => Math.Abs(c.R - c.G) < 10 && Math.Abs(c.G - c.B) < 10);

		return new PaletteAnalysisResult {
			ColorCount = palette.Count,
			UniqueColorCount = uniqueColors,
			AverageColor = Color.FromArgb(avgR, avgG, avgB),
			BrightestColor = brightest,
			DarkestColor = darkest,
			AverageSaturation = saturations.Average(),
			AverageBrightness = brightnesses.Average(),
			IsGrayscale = isGrayscale,
			HasTransparency = colors.Any(c => c.A < 255)
		};
	}

	private static double GetSaturation(Color c) {
		var max = Math.Max(c.R, Math.Max(c.G, c.B));
		var min = Math.Min(c.R, Math.Min(c.G, c.B));
		return max == 0 ? 0 : (double)(max - min) / max;
	}

	private static double GetBrightness(Color c) {
		return (c.R + c.G + c.B) / 3.0 / 255.0;
	}

	/// <summary>
	/// Find the closest matching color index in a palette
	/// </summary>
	public static int FindClosestColor(GamePalette palette, Color target) {
		var bestIndex = 0;
		var bestDistance = double.MaxValue;

		for (var i = 0; i < palette.Count; i++) {
			var color = palette.GetColor(i);
			var distance = ColorDistance(color, target);
			if (distance < bestDistance) {
				bestDistance = distance;
				bestIndex = i;
			}
		}

		return bestIndex;
	}

	private static double ColorDistance(Color a, Color b) {
		// Use weighted Euclidean distance (human perception)
		var rDiff = a.R - b.R;
		var gDiff = a.G - b.G;
		var bDiff = a.B - b.B;
		return Math.Sqrt(2 * rDiff * rDiff + 4 * gDiff * gDiff + 3 * bDiff * bDiff);
	}

	/// <summary>
	/// Generate a grayscale ramp palette
	/// </summary>
	public static GamePalette CreateGrayscaleRamp(int colorCount) {
		var palette = new GamePalette { Name = "Grayscale Ramp" };
		for (var i = 0; i < colorCount; i++) {
			var shade = i * 255 / (colorCount - 1);
			palette.AddColor(Color.FromArgb(shade, shade, shade));
		}
		return palette;
	}

	/// <summary>
	/// Generate a standard Game Boy palette
	/// </summary>
	public static GamePalette CreateGameBoyPalette() {
		var palette = new GamePalette {
			Name = "Game Boy",
			Format = PaletteFormat.GameBoy,
			BitsPerPixel = 2
		};
		palette.AddColor(Color.FromArgb(155, 188, 15));  // Lightest
		palette.AddColor(Color.FromArgb(139, 172, 15));
		palette.AddColor(Color.FromArgb(48, 98, 48));
		palette.AddColor(Color.FromArgb(15, 56, 15));    // Darkest
		return palette;
	}
}

/// <summary>
/// Results of palette analysis
/// </summary>
public record PaletteAnalysisResult {
	public int ColorCount { get; init; }
	public int UniqueColorCount { get; init; }
	public Color AverageColor { get; init; }
	public Color BrightestColor { get; init; }
	public Color DarkestColor { get; init; }
	public double AverageSaturation { get; init; }
	public double AverageBrightness { get; init; }
	public bool IsGrayscale { get; init; }
	public bool HasTransparency { get; init; }
}
