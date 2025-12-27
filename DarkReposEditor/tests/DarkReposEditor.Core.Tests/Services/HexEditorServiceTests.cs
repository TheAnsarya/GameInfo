using DarkReposEditor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkReposEditor.Core.Tests.Services;

public class HexEditorServiceTests
{
	private readonly HexEditorService _service = new();

	#region ReadBytes Tests

	[Fact]
	public void ReadBytes_ValidRange_ReturnsCorrectBytes()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x11, 0x22, 0x33, 0x44, 0x55 };

		// Act
		var result = _service.ReadBytes(data, 2, 3);

		// Assert
		result.ToArray().Should().BeEquivalentTo([0x22, 0x33, 0x44]);
	}

	[Fact]
	public void ReadBytes_LengthExceedsBounds_ClampsToAvailable()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x11, 0x22, 0x33 };

		// Act
		var result = _service.ReadBytes(data, 2, 100);

		// Assert
		result.ToArray().Should().BeEquivalentTo([0x22, 0x33]);
	}

	[Fact]
	public void ReadBytes_InvalidOffset_ThrowsException()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x11 };

		// Act & Assert
		Assert.Throws<ArgumentOutOfRangeException>(() => _service.ReadBytes(data, 10, 1));
	}

	#endregion

	#region WriteBytes Tests

	[Fact]
	public void WriteBytes_ValidRange_ModifiesData()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		var newBytes = new byte[] { 0xaa, 0xbb };

		// Act
		_service.WriteBytes(data, 1, newBytes);

		// Assert
		data.Should().BeEquivalentTo([0x00, 0xaa, 0xbb, 0x00]);
	}

	[Fact]
	public void WriteBytes_ExceedsBounds_ThrowsException()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x00 };
		var newBytes = new byte[] { 0xaa, 0xbb, 0xcc };

		// Act & Assert
		Assert.Throws<ArgumentOutOfRangeException>(() => _service.WriteBytes(data, 1, newBytes));
	}

	#endregion

	#region Search Tests

	[Fact]
	public void Search_PatternExists_ReturnsAllOffsets()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc, 0xaa, 0xbb, 0xdd };
		var pattern = new byte[] { 0xaa, 0xbb };

		// Act
		var results = _service.Search(data, pattern).ToList();

		// Assert
		results.Should().BeEquivalentTo([0, 3]);
	}

	[Fact]
	public void Search_PatternNotFound_ReturnsEmpty()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc };
		var pattern = new byte[] { 0xff, 0xff };

		// Act
		var results = _service.Search(data, pattern).ToList();

		// Assert
		results.Should().BeEmpty();
	}

	[Fact]
	public void Search_WithStartOffset_SearchesFromOffset()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc, 0xaa, 0xbb };
		var pattern = new byte[] { 0xaa, 0xbb };

		// Act
		var results = _service.Search(data, pattern, 2).ToList();

		// Assert
		results.Should().BeEquivalentTo([3]);
	}

	[Fact]
	public void Search_EmptyPattern_ReturnsEmpty()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb };

		// Act
		var results = _service.Search(data, []).ToList();

		// Assert
		results.Should().BeEmpty();
	}

	#endregion

	#region SearchText Tests

	[Fact]
	public void SearchText_TextExists_ReturnsOffset()
	{
		// Arrange
		var data = "Hello World"u8.ToArray();

		// Act
		var results = _service.SearchText(data, "World").ToList();

		// Assert
		results.Should().BeEquivalentTo([6]);
	}

	[Fact]
	public void SearchText_TextNotFound_ReturnsEmpty()
	{
		// Arrange
		var data = "Hello World"u8.ToArray();

		// Act
		var results = _service.SearchText(data, "foo").ToList();

		// Assert
		results.Should().BeEmpty();
	}

	#endregion

	#region Replace Tests

	[Fact]
	public void Replace_MatchingBytes_Replaces()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc, 0xdd };
		var oldBytes = new byte[] { 0xbb, 0xcc };
		var newBytes = new byte[] { 0x11, 0x22 };

		// Act
		_service.Replace(data, 1, oldBytes, newBytes);

		// Assert
		data.Should().BeEquivalentTo([0xaa, 0x11, 0x22, 0xdd]);
	}

	[Fact]
	public void Replace_NonMatchingBytes_ThrowsException()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc };
		var oldBytes = new byte[] { 0xff, 0xff };
		var newBytes = new byte[] { 0x11, 0x22 };

		// Act & Assert
		Assert.Throws<InvalidOperationException>(() => _service.Replace(data, 1, oldBytes, newBytes));
	}

	[Fact]
	public void Replace_DifferentSizes_ThrowsException()
	{
		// Arrange
		var data = new byte[] { 0xaa, 0xbb, 0xcc };
		var oldBytes = new byte[] { 0xbb };
		var newBytes = new byte[] { 0x11, 0x22 };

		// Act & Assert
		Assert.Throws<ArgumentException>(() => _service.Replace(data, 1, oldBytes, newBytes));
	}

	#endregion

	#region Fill Tests

	[Fact]
	public void Fill_ValidRange_FillsWithValue()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };

		// Act
		_service.Fill(data, 1, 2, 0xff);

		// Assert
		data.Should().BeEquivalentTo([0x00, 0xff, 0xff, 0x00]);
	}

	[Fact]
	public void Fill_LengthExceedsBounds_ClampsToAvailable()
	{
		// Arrange
		var data = new byte[] { 0x00, 0x00, 0x00 };

		// Act
		_service.Fill(data, 1, 100, 0xaa);

		// Assert
		data.Should().BeEquivalentTo([0x00, 0xaa, 0xaa]);
	}

	#endregion

	#region GetHexDump Tests

	[Fact]
	public void GetHexDump_ValidData_FormatsCorrectly()
	{
		// Arrange
		var data = new byte[] { 0x48, 0x65, 0x6c, 0x6c, 0x6f }; // "Hello"

		// Act
		var result = _service.GetHexDump(data, 0, 5, 16);

		// Assert
		result.Should().Contain("00000000");
		result.Should().Contain("48 65 6c 6c 6f");
		result.Should().Contain("Hello");
	}

	#endregion

	#region ParseHex Tests

	[Theory]
	[InlineData("aabb", new byte[] { 0xaa, 0xbb })]
	[InlineData("AA BB", new byte[] { 0xaa, 0xbb })]
	[InlineData("aa-bb-cc", new byte[] { 0xaa, 0xbb, 0xcc })]
	[InlineData("  aa  bb  ", new byte[] { 0xaa, 0xbb })]
	public void ParseHex_ValidInput_ReturnsBytes(string input, byte[] expected)
	{
		// Act
		var result = _service.ParseHex(input);

		// Assert
		result.Should().BeEquivalentTo(expected);
	}

	[Fact]
	public void ParseHex_OddLength_ThrowsException()
	{
		// Act & Assert
		Assert.Throws<FormatException>(() => _service.ParseHex("aab"));
	}

	[Fact]
	public void ParseHex_EmptyString_ReturnsEmpty()
	{
		// Act
		var result = _service.ParseHex("");

		// Assert
		result.Should().BeEmpty();
	}

	#endregion

	#region FormatHex Tests

	[Fact]
	public void FormatHex_WithDefaultSeparator_FormatsWithSpaces()
	{
		// Arrange
		var bytes = new byte[] { 0xaa, 0xbb, 0xcc };

		// Act
		var result = _service.FormatHex(bytes);

		// Assert
		result.Should().Be("aa bb cc");
	}

	[Fact]
	public void FormatHex_WithCustomSeparator_UsesCustomSeparator()
	{
		// Arrange
		var bytes = new byte[] { 0xaa, 0xbb, 0xcc };

		// Act
		var result = _service.FormatHex(bytes, "-");

		// Assert
		result.Should().Be("aa-bb-cc");
	}

	[Fact]
	public void FormatHex_NoSeparator_ConcatenatesBytes()
	{
		// Arrange
		var bytes = new byte[] { 0xaa, 0xbb };

		// Act
		var result = _service.FormatHex(bytes, "");

		// Assert
		result.Should().Be("aabb");
	}

	[Fact]
	public void FormatHex_EmptyBytes_ReturnsEmpty()
	{
		// Act
		var result = _service.FormatHex(ReadOnlySpan<byte>.Empty);

		// Assert
		result.Should().BeEmpty();
	}

	#endregion
}
