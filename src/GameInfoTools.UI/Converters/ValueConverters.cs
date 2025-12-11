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
