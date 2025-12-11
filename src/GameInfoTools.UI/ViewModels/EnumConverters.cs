using System.Globalization;
using Avalonia.Data.Converters;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Static converters for enum to bool conversion in ToggleButton bindings.
/// </summary>
public static class EnumConverters {
	/// <summary>
	/// Converter for MapDrawingTool.Pencil.
	/// </summary>
	public static readonly IValueConverter MapToolPencil = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Pencil);

	/// <summary>
	/// Converter for MapDrawingTool.Fill.
	/// </summary>
	public static readonly IValueConverter MapToolFill = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Fill);

	/// <summary>
	/// Converter for MapDrawingTool.Rectangle.
	/// </summary>
	public static readonly IValueConverter MapToolRectangle = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Rectangle);

	/// <summary>
	/// Converter for MapDrawingTool.Line.
	/// </summary>
	public static readonly IValueConverter MapToolLine = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Line);

	/// <summary>
	/// Converter for MapDrawingTool.Selection.
	/// </summary>
	public static readonly IValueConverter MapToolSelection = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Selection);

	/// <summary>
	/// Converter for MapDrawingTool.Eyedropper.
	/// </summary>
	public static readonly IValueConverter MapToolEyedropper = new EnumToBoolConverter<MapDrawingTool>(MapDrawingTool.Eyedropper);
}

/// <summary>
/// Generic converter that converts an enum value to bool by comparing with a target value.
/// </summary>
/// <typeparam name="TEnum">The enum type.</typeparam>
public class EnumToBoolConverter<TEnum> : IValueConverter where TEnum : struct, Enum {
	private readonly TEnum _targetValue;

	public EnumToBoolConverter(TEnum targetValue) {
		_targetValue = targetValue;
	}

	public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is TEnum enumValue) {
			return enumValue.Equals(_targetValue);
		}
		return false;
	}

	public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture) {
		if (value is true) {
			return _targetValue;
		}
		return Avalonia.Data.BindingOperations.DoNothing;
	}
}
