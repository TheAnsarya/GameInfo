using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the FileSize component.
/// </summary>
public class FileSizeTests : TestContext
{
	[Fact]
	public void FileSize_RendersSpanElement()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024));

		// Assert
		cut.Find("span.file-size").Should().NotBeNull();
	}

	[Fact]
	public void FileSize_HasTooltipWithExactByteCount()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1536));

		// Assert
		cut.Find("span").GetAttribute("title").Should().Be("1,536 bytes");
	}

	[Fact]
	public void FileSize_TooltipShowsBytes_ForSingleByte()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1));

		// Assert
		cut.Find("span").GetAttribute("title").Should().Be("1 bytes");
	}

	[Fact]
	public void FileSize_HidesTooltip_WhenShowTooltipIsFalse()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.ShowTooltip, false));

		// Assert
		cut.Find("span").GetAttribute("title").Should().BeEmpty();
	}

	// === Byte formatting tests ===

	[Fact]
	public void FileSize_Shows0B_ForZeroBytes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 0));

		// Assert
		cut.Find("span").TextContent.Should().Be("0 B");
	}

	[Fact]
	public void FileSize_ShowsBytes_ForSmallValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 512));

		// Assert
		cut.Find("span").TextContent.Should().Be("512 B");
	}

	[Fact]
	public void FileSize_ShowsKB_ForKilobyteValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1500));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.50 KB");
	}

	[Fact]
	public void FileSize_ShowsMB_ForMegabyteValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_500_000));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.50 MB");
	}

	[Fact]
	public void FileSize_ShowsGB_ForGigabyteValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_500_000_000));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.50 GB");
	}

	[Fact]
	public void FileSize_ShowsTB_ForTerabyteValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_500_000_000_000));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.50 TB");
	}

	[Fact]
	public void FileSize_ShowsPB_ForPetabyteValues()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_500_000_000_000_000));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.50 PB");
	}

	// === Precision tests ===

	[Fact]
	public void FileSize_UsesPrecision0_ForWholeNumbers()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 2_000_000)
			.Add(p => p.Precision, 0));

		// Assert
		cut.Find("span").TextContent.Should().Be("2 MB");
	}

	[Fact]
	public void FileSize_UsesPrecision3_ForMoreDetail()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_234_567)
			.Add(p => p.Precision, 3));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.235 MB");
	}

	[Fact]
	public void FileSize_UsesPrecision1()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_500_000)
			.Add(p => p.Precision, 1));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.5 MB");
	}

	// === Binary units tests ===

	[Fact]
	public void FileSize_UsesBinaryUnits_WithKiB()
	{
		// 1024 bytes = 1 KiB
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.UseBinaryUnits, true)
			.Add(p => p.UseAbbreviatedUnits, false));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.00 KiB");
	}

	[Fact]
	public void FileSize_UsesBinaryUnits_WithMiB()
	{
		// 1048576 bytes = 1 MiB
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1048576)
			.Add(p => p.UseBinaryUnits, true)
			.Add(p => p.UseAbbreviatedUnits, false));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.00 MiB");
	}

	[Fact]
	public void FileSize_UsesBinaryUnits_WithAbbreviation()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1048576)
			.Add(p => p.UseBinaryUnits, true)
			.Add(p => p.UseAbbreviatedUnits, true));

		// Assert
		cut.Find("span").TextContent.Should().Be("1.00 MB");
	}

	// === Icon tests ===

	[Fact]
	public void FileSize_HidesIcon_ByDefault()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024));

		// Assert
		cut.FindAll(".file-size-icon").Should().BeEmpty();
	}

	[Fact]
	public void FileSize_ShowsIcon_WhenShowIconIsTrue()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.ShowIcon, true));

		// Assert
		cut.Find(".file-size-icon").Should().NotBeNull();
		cut.Find("span").ClassList.Should().Contain("with-icon");
	}

	[Fact]
	public void FileSize_IconIsHiddenFromAccessibility()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.ShowIcon, true));

		// Assert
		cut.Find(".file-size-icon").GetAttribute("aria-hidden").Should().Be("true");
	}

	// === CSS class tests ===

	[Fact]
	public void FileSize_HasSizeTinyClass_ForByteSizes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 512));

		// Assert
		cut.Find("span").ClassList.Should().Contain("size-tiny");
	}

	[Fact]
	public void FileSize_HasSizeSmallClass_ForKBSizes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 50_000));

		// Assert
		cut.Find("span").ClassList.Should().Contain("size-small");
	}

	[Fact]
	public void FileSize_HasSizeMediumClass_ForMBSizes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 5_000_000));

		// Assert
		cut.Find("span").ClassList.Should().Contain("size-medium");
	}

	[Fact]
	public void FileSize_HasSizeLargeClass_ForGBSizes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 5_000_000_000));

		// Assert
		cut.Find("span").ClassList.Should().Contain("size-large");
	}

	[Fact]
	public void FileSize_HasSizeHugeClass_ForTBSizes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 5_000_000_000_000));

		// Assert
		cut.Find("span").ClassList.Should().Contain("size-huge");
	}

	[Fact]
	public void FileSize_UsesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.CssClass, "custom-class"));

		// Assert
		cut.Find("span").ClassList.Should().Contain("custom-class");
	}

	// === Edge case tests ===

	[Fact]
	public void FileSize_HandlesNegativeBytes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, -100));

		// Assert - negative values display with negative sign
		cut.Find("span").TextContent.Should().Be("-100 B");
		cut.Find("span").GetAttribute("title").Should().Be("-100 bytes");
	}

	[Fact]
	public void FileSize_HandlesExactlyOneKB()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1000)
			.Add(p => p.Precision, 0));

		// Assert
		cut.Find("span").TextContent.Should().Be("1 KB");
	}

	[Fact]
	public void FileSize_HandlesExactlyOneKiB()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1024)
			.Add(p => p.UseBinaryUnits, true)
			.Add(p => p.UseAbbreviatedUnits, false)
			.Add(p => p.Precision, 0));

		// Assert
		cut.Find("span").TextContent.Should().Be("1 KiB");
	}

	[Fact]
	public void FileSize_HandlesMaxLongValue()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, long.MaxValue)
			.Add(p => p.Precision, 1));

		// Assert
		cut.Find("span").TextContent.Should().Contain("EB");
	}

	// === Tooltip formatting tests ===

	[Fact]
	public void FileSize_FormatsLargeNumbersInTooltip()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 1_234_567_890));

		// Assert
		cut.Find("span").GetAttribute("title").Should().Be("1,234,567,890 bytes");
	}

	[Fact]
	public void FileSize_TooltipFor0Bytes()
	{
		// Act
		var cut = RenderComponent<FileSize>(parameters => parameters
			.Add(p => p.Bytes, 0));

		// Assert
		cut.Find("span").GetAttribute("title").Should().Be("0 bytes");
	}
}
