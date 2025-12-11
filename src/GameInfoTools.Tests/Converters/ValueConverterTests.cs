using System.Globalization;
using Xunit;
using GameInfoTools.UI.Converters;
using GameInfoTools.UI.Controls;

namespace GameInfoTools.Tests.Converters;

/// <summary>
/// Tests for value converters.
/// </summary>
public class ValueConverterTests {
	#region IntEqualsConverter Tests

	[Fact]
	public void IntEqualsConverter_Convert_ReturnsTrue_WhenValuesMatch() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.Convert(2, typeof(bool), "2", CultureInfo.InvariantCulture);

		Assert.True((bool)result!);
	}

	[Fact]
	public void IntEqualsConverter_Convert_ReturnsFalse_WhenValuesDoNotMatch() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.Convert(1, typeof(bool), "2", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void IntEqualsConverter_Convert_ReturnsFalse_WithNullValue() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.Convert(null, typeof(bool), "2", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void IntEqualsConverter_Convert_ReturnsFalse_WithInvalidParameter() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.Convert(2, typeof(bool), "invalid", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void IntEqualsConverter_ConvertBack_ReturnsParameterValue_WhenTrue() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.ConvertBack(true, typeof(int), "3", CultureInfo.InvariantCulture);

		Assert.Equal(3, result);
	}

	[Fact]
	public void IntEqualsConverter_ConvertBack_ReturnsDoNothing_WhenFalse() {
		var converter = IntEqualsConverter.Instance;

		var result = converter.ConvertBack(false, typeof(int), "3", CultureInfo.InvariantCulture);

		Assert.Equal(Avalonia.Data.BindingOperations.DoNothing, result);
	}

	#endregion

	#region MsToTimeSpanConverter Tests

	[Fact]
	public void MsToTimeSpanConverter_Convert_ReturnsCorrectTimeSpan() {
		var converter = MsToTimeSpanConverter.Instance;

		var result = converter.Convert(500, typeof(TimeSpan), null, CultureInfo.InvariantCulture);

		Assert.Equal(TimeSpan.FromMilliseconds(500), result);
	}

	[Fact]
	public void MsToTimeSpanConverter_Convert_ReturnsDefault_WithNullValue() {
		var converter = MsToTimeSpanConverter.Instance;

		var result = converter.Convert(null, typeof(TimeSpan), null, CultureInfo.InvariantCulture);

		Assert.Equal(TimeSpan.FromMilliseconds(200), result);
	}

	[Fact]
	public void MsToTimeSpanConverter_ConvertBack_ReturnsCorrectMs() {
		var converter = MsToTimeSpanConverter.Instance;

		var result = converter.ConvertBack(TimeSpan.FromMilliseconds(750), typeof(int), null, CultureInfo.InvariantCulture);

		Assert.Equal(750, result);
	}

	[Fact]
	public void MsToTimeSpanConverter_ConvertBack_ReturnsDefault_WithNullValue() {
		var converter = MsToTimeSpanConverter.Instance;

		var result = converter.ConvertBack(null, typeof(int), null, CultureInfo.InvariantCulture);

		Assert.Equal(200, result);
	}

	#endregion

	#region InverseBoolConverter Tests

	[Fact]
	public void InverseBoolConverter_Convert_InvertsTrue() {
		var converter = InverseBoolConverter.Instance;

		var result = converter.Convert(true, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void InverseBoolConverter_Convert_InvertsFalse() {
		var converter = InverseBoolConverter.Instance;

		var result = converter.Convert(false, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.True((bool)result!);
	}

	[Fact]
	public void InverseBoolConverter_Convert_ReturnsFalse_WithNullValue() {
		var converter = InverseBoolConverter.Instance;

		var result = converter.Convert(null, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void InverseBoolConverter_ConvertBack_InvertsTrue() {
		var converter = InverseBoolConverter.Instance;

		var result = converter.ConvertBack(true, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void InverseBoolConverter_ConvertBack_InvertsFalse() {
		var converter = InverseBoolConverter.Instance;

		var result = converter.ConvertBack(false, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.True((bool)result!);
	}

	#endregion

	#region CountToBoolConverter Tests

	[Fact]
	public void CountToBoolConverter_Convert_ReturnsTrue_WhenCountGreaterThanZero() {
		var converter = CountToBoolConverter.Instance;

		var result = converter.Convert(5, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.True((bool)result!);
	}

	[Fact]
	public void CountToBoolConverter_Convert_ReturnsFalse_WhenCountIsZero() {
		var converter = CountToBoolConverter.Instance;

		var result = converter.Convert(0, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void CountToBoolConverter_Convert_ReturnsFalse_WithNullValue() {
		var converter = CountToBoolConverter.Instance;

		var result = converter.Convert(null, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void CountToBoolConverter_ConvertBack_ThrowsNotSupportedException() {
		var converter = CountToBoolConverter.Instance;

		Assert.Throws<NotSupportedException>(() =>
			converter.ConvertBack(true, typeof(int), null, CultureInfo.InvariantCulture));
	}

	#endregion

	#region EnumEqualsConverter Tests

	[Fact]
	public void EnumEqualsConverter_Convert_ReturnsTrue_WhenEnumMatchesParameter() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.Convert(DrawingTool.Pencil, typeof(bool), "Pencil", CultureInfo.InvariantCulture);

		Assert.True((bool)result!);
	}

	[Fact]
	public void EnumEqualsConverter_Convert_ReturnsFalse_WhenEnumDoesNotMatchParameter() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.Convert(DrawingTool.Pencil, typeof(bool), "Fill", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void EnumEqualsConverter_Convert_ReturnsFalse_WithNullValue() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.Convert(null, typeof(bool), "Pencil", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void EnumEqualsConverter_Convert_ReturnsFalse_WithNullParameter() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.Convert(DrawingTool.Pencil, typeof(bool), null, CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void EnumEqualsConverter_Convert_ReturnsFalse_WithNonEnumValue() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.Convert(42, typeof(bool), "Pencil", CultureInfo.InvariantCulture);

		Assert.False((bool)result!);
	}

	[Fact]
	public void EnumEqualsConverter_ConvertBack_ReturnsEnumValue_WhenTrue() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.ConvertBack(true, typeof(DrawingTool), "Fill", CultureInfo.InvariantCulture);

		Assert.Equal(DrawingTool.Fill, result);
	}

	[Fact]
	public void EnumEqualsConverter_ConvertBack_ReturnsDoNothing_WhenFalse() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.ConvertBack(false, typeof(DrawingTool), "Fill", CultureInfo.InvariantCulture);

		Assert.Equal(Avalonia.Data.BindingOperations.DoNothing, result);
	}

	[Fact]
	public void EnumEqualsConverter_ConvertBack_ReturnsDoNothing_WithInvalidEnumName() {
		var converter = EnumEqualsConverter.Instance;

		var result = converter.ConvertBack(true, typeof(DrawingTool), "InvalidName", CultureInfo.InvariantCulture);

		Assert.Equal(Avalonia.Data.BindingOperations.DoNothing, result);
	}

	[Fact]
	public void EnumEqualsConverter_Works_WithAllDrawingTools() {
		var converter = EnumEqualsConverter.Instance;
		var tools = Enum.GetValues<DrawingTool>();

		foreach (var tool in tools) {
			var result = converter.Convert(tool, typeof(bool), tool.ToString(), CultureInfo.InvariantCulture);
			Assert.True((bool)result!, $"Should match for {tool}");
		}
	}

	#endregion
}
