using System.Globalization;
using Avalonia.Data.Converters;

namespace GameInfoTools.UI.Converters;

/// <summary>
/// Converts an integer to a boolean by comparing with a parameter value.
/// Used for radio button groups bound to an integer property.
/// </summary>
public class IntEqualsConverter : IValueConverter {
	public static readonly IntEqualsConverter Instance = new();

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is int intValue && parameter is string paramStr && int.TryParse(paramStr, out int paramValue)) {
			return intValue == paramValue;
		}

		return false;
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is true && parameter is string paramStr && int.TryParse(paramStr, out int paramValue)) {
			return paramValue;
		}

		return Avalonia.Data.BindingOperations.DoNothing;
	}
}

/// <summary>
/// Converts milliseconds (int) to TimeSpan.
/// </summary>
public class MsToTimeSpanConverter : IValueConverter {
	public static readonly MsToTimeSpanConverter Instance = new();

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is int ms) {
			return TimeSpan.FromMilliseconds(ms);
		}

		return TimeSpan.FromMilliseconds(200);
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is TimeSpan ts) {
			return (int)ts.TotalMilliseconds;
		}

		return 200;
	}
}

/// <summary>
/// Inverts a boolean value.
/// </summary>
public class InverseBoolConverter : IValueConverter {
	public static readonly InverseBoolConverter Instance = new();

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is bool boolValue) {
			return !boolValue;
		}

		return false;
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is bool boolValue) {
			return !boolValue;
		}

		return false;
	}
}

/// <summary>
/// Returns true if a count is greater than zero.
/// </summary>
public class CountToBoolConverter : IValueConverter {
	public static readonly CountToBoolConverter Instance = new();

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is int count) {
			return count > 0;
		}

		return false;
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		throw new NotSupportedException();
	}
}

/// <summary>
/// Converts an enum value to a boolean by comparing with a parameter value (enum name as string).
/// Used for radio button groups bound to an enum property.
/// </summary>
public class EnumEqualsConverter : IValueConverter {
	public static readonly EnumEqualsConverter Instance = new();

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is null || parameter is not string paramStr) {
			return false;
		}

		var enumType = value.GetType();
		if (!enumType.IsEnum) {
			return false;
		}

		return value.ToString() == paramStr;
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is true && parameter is string paramStr && targetType.IsEnum) {
			if (Enum.TryParse(targetType, paramStr, out var result)) {
				return result;
			}
		}

		return Avalonia.Data.BindingOperations.DoNothing;
	}
}

/// <summary>
/// Converts 6502/65816 instruction mnemonics to syntax highlighting colors.
/// Provides distinct colors for branches, jumps, loads, stores, math, etc.
/// </summary>
public class MnemonicColorConverter : IValueConverter {
	public static readonly MnemonicColorConverter Instance = new();

	// Color palette for syntax highlighting (using hex color strings)
	private static readonly string BranchColor = "#FFD54F";      // Yellow - branches
	private static readonly string JumpColor = "#FF8A65";        // Orange - jumps
	private static readonly string CallColor = "#EF5350";        // Red - subroutine calls
	private static readonly string ReturnColor = "#E57373";      // Light red - returns
	private static readonly string LoadColor = "#81C784";        // Green - loads
	private static readonly string StoreColor = "#4DB6AC";       // Teal - stores
	private static readonly string MathColor = "#64B5F6";        // Blue - arithmetic
	private static readonly string LogicColor = "#7986CB";       // Indigo - logic
	private static readonly string CompareColor = "#BA68C8";     // Purple - compares
	private static readonly string StackColor = "#F48FB1";       // Pink - stack ops
	private static readonly string ControlColor = "#90A4AE";     // Gray - control
	private static readonly string DefaultColor = "#E0E0E0";     // White-ish - default

	// Branch instructions
	private static readonly HashSet<string> BranchMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"bcc", "bcs", "beq", "bmi", "bne", "bpl", "bvc", "bvs", "bra", "brl"
	};

	// Jump instructions
	private static readonly HashSet<string> JumpMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"jmp", "jml"
	};

	// Call instructions
	private static readonly HashSet<string> CallMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"jsr", "jsl"
	};

	// Return instructions
	private static readonly HashSet<string> ReturnMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"rts", "rtl", "rti", "brk"
	};

	// Load instructions
	private static readonly HashSet<string> LoadMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"lda", "ldx", "ldy", "pla", "plx", "ply", "plp", "pld", "plb"
	};

	// Store instructions
	private static readonly HashSet<string> StoreMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"sta", "stx", "sty", "stz", "pha", "phx", "phy", "php", "phd", "phb", "phk"
	};

	// Arithmetic instructions
	private static readonly HashSet<string> MathMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"adc", "sbc", "inc", "inx", "iny", "dec", "dex", "dey", "asl", "lsr", "rol", "ror"
	};

	// Logic instructions
	private static readonly HashSet<string> LogicMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"and", "ora", "eor", "bit", "trb", "tsb"
	};

	// Compare instructions
	private static readonly HashSet<string> CompareMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"cmp", "cpx", "cpy"
	};

	// Stack/transfer instructions
	private static readonly HashSet<string> StackMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"tax", "tay", "txa", "tya", "txs", "tsx", "tcd", "tdc", "tcs", "tsc", "txy", "tyx",
		"xba", "xce"
	};

	// Control/flag instructions
	private static readonly HashSet<string> ControlMnemonics = new(StringComparer.OrdinalIgnoreCase) {
		"nop", "clc", "sec", "cli", "sei", "clv", "cld", "sed", "rep", "sep", "wai", "stp"
	};

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is not string mnemonic || string.IsNullOrWhiteSpace(mnemonic)) {
			return Avalonia.Media.Brush.Parse(DefaultColor);
		}

		// Remove any leading/trailing whitespace
		mnemonic = mnemonic.Trim();

		string colorHex = mnemonic switch {
			_ when BranchMnemonics.Contains(mnemonic) => BranchColor,
			_ when JumpMnemonics.Contains(mnemonic) => JumpColor,
			_ when CallMnemonics.Contains(mnemonic) => CallColor,
			_ when ReturnMnemonics.Contains(mnemonic) => ReturnColor,
			_ when LoadMnemonics.Contains(mnemonic) => LoadColor,
			_ when StoreMnemonics.Contains(mnemonic) => StoreColor,
			_ when MathMnemonics.Contains(mnemonic) => MathColor,
			_ when LogicMnemonics.Contains(mnemonic) => LogicColor,
			_ when CompareMnemonics.Contains(mnemonic) => CompareColor,
			_ when StackMnemonics.Contains(mnemonic) => StackColor,
			_ when ControlMnemonics.Contains(mnemonic) => ControlColor,
			_ => DefaultColor
		};

		return Avalonia.Media.Brush.Parse(colorHex);
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		throw new NotSupportedException();
	}
}
