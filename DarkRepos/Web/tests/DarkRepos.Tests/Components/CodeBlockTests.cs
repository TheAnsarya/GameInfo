using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.JSInterop;
using Moq;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the CodeBlock component.
/// </summary>
public class CodeBlockTests : TestContext {
	[Fact]
	public void CodeBlock_RendersCode() {
		// Arrange
		SetupJsMock();
		var code = "console.log('hello');";

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, code));

		// Assert
		cut.Find(".code-text").TextContent.Should().Be(code);
	}

	[Fact]
	public void CodeBlock_RendersLanguageLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "var x = 1;")
			.Add(p => p.Language, "javascript"));

		// Assert
		cut.Find(".code-language").TextContent.Should().Be("JavaScript");
	}

	[Fact]
	public void CodeBlock_RendersTitle_WhenProvided() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.Title, "Example Code"));

		// Assert
		cut.Find(".code-title").TextContent.Should().Be("Example Code");
	}

	[Fact]
	public void CodeBlock_DoesNotRenderTitle_WhenNull() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.FindAll(".code-title").Should().BeEmpty();
	}

	[Fact]
	public void CodeBlock_RendersLineNumbers_WhenEnabled() {
		// Arrange
		SetupJsMock();
		var code = "line1\nline2\nline3";

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, code)
			.Add(p => p.ShowLineNumbers, true));

		// Assert
		var lineNumbers = cut.FindAll(".line-number");
		lineNumbers.Should().HaveCount(3);
		lineNumbers[0].TextContent.Should().Be("1");
		lineNumbers[1].TextContent.Should().Be("2");
		lineNumbers[2].TextContent.Should().Be("3");
	}

	[Fact]
	public void CodeBlock_DoesNotRenderLineNumbers_WhenDisabled() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "line1\nline2")
			.Add(p => p.ShowLineNumbers, false));

		// Assert
		cut.FindAll(".line-numbers").Should().BeEmpty();
	}

	[Fact]
	public void CodeBlock_HasWithLinesClass_WhenLineNumbersEnabled() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.ShowLineNumbers, true));

		// Assert
		cut.Find(".code-block").ClassList.Should().Contain("with-lines");
	}

	[Fact]
	public void CodeBlock_DoesNotHaveWithLinesClass_WhenLineNumbersDisabled() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.ShowLineNumbers, false));

		// Assert
		cut.Find(".code-block").ClassList.Should().NotContain("with-lines");
	}

	[Fact]
	public void CodeBlock_HasLanguageClass_OnCodeElement() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.Language, "python"));

		// Assert
		cut.Find(".code-text").ClassList.Should().Contain("language-python");
	}

	[Fact]
	public void CodeBlock_IncludesCopyButton() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.FindComponent<CopyButton>().Should().NotBeNull();
	}

	[Theory]
	[InlineData("csharp", "C#")]
	[InlineData("cs", "C#")]
	[InlineData("javascript", "JavaScript")]
	[InlineData("js", "JavaScript")]
	[InlineData("typescript", "TypeScript")]
	[InlineData("ts", "TypeScript")]
	[InlineData("python", "Python")]
	[InlineData("py", "Python")]
	[InlineData("html", "HTML")]
	[InlineData("css", "CSS")]
	[InlineData("json", "JSON")]
	[InlineData("yaml", "YAML")]
	[InlineData("yml", "YAML")]
	[InlineData("sql", "SQL")]
	[InlineData("bash", "Shell")]
	[InlineData("shell", "Shell")]
	[InlineData("powershell", "PowerShell")]
	[InlineData("razor", "Razor")]
	[InlineData("asm", "Assembly")]
	[InlineData("6502", "6502 ASM")]
	[InlineData("65816", "65816 ASM")]
	[InlineData("z80", "Z80 ASM")]
	[InlineData("text", "Plain Text")]
	public void CodeBlock_FormatsLanguageLabel_Correctly(string language, string expected) {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.Language, language));

		// Assert
		cut.Find(".code-language").TextContent.Should().Be(expected);
	}

	[Fact]
	public void CodeBlock_UsesUppercase_ForUnknownLanguage() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.Language, "kotlin"));

		// Assert
		cut.Find(".code-language").TextContent.Should().Be("KOTLIN");
	}

	[Fact]
	public void CodeBlock_ShowsCode_ForEmptyLanguage() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code")
			.Add(p => p.Language, ""));

		// Assert
		cut.Find(".code-language").TextContent.Should().Be("Code");
	}

	[Fact]
	public void CodeBlock_CountsLines_Correctly() {
		// Arrange
		SetupJsMock();
		var code = "a\nb\nc\nd\ne"; // 5 lines

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, code)
			.Add(p => p.ShowLineNumbers, true));

		// Assert
		cut.FindAll(".line-number").Should().HaveCount(5);
	}

	[Fact]
	public void CodeBlock_HandlesEmptyCode() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, ""));

		// Assert
		cut.Find(".code-text").TextContent.Should().BeEmpty();
	}

	[Fact]
	public void CodeBlock_PreservesWhitespace() {
		// Arrange
		SetupJsMock();
		var code = "  indented\n\ttabbed";

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, code));

		// Assert
		cut.Find(".code-text").TextContent.Should().Be(code);
	}

	[Fact]
	public void CodeBlock_HasPreElement() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.Find("pre.code-pre").Should().NotBeNull();
	}

	[Fact]
	public void CodeBlock_HasCodeElement() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.Find("code.code-text").Should().NotBeNull();
	}

	[Fact]
	public void CodeBlock_LineNumbersAreHiddenFromAria() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "line1\nline2")
			.Add(p => p.ShowLineNumbers, true));

		// Assert
		cut.Find(".line-numbers").GetAttribute("aria-hidden").Should().Be("true");
	}

	[Fact]
	public void CodeBlock_DefaultsToTextLanguage() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.Find(".code-text").ClassList.Should().Contain("language-text");
	}

	[Fact]
	public void CodeBlock_DefaultsToNoLineNumbers() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CodeBlock>(parameters => parameters
			.Add(p => p.Code, "code"));

		// Assert
		cut.FindAll(".line-numbers").Should().BeEmpty();
	}

	private void SetupJsMock() {
		var jsMock = new Mock<IJSRuntime>();
		Services.AddSingleton(jsMock.Object);
	}
}
