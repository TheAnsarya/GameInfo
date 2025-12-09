# Contributing to GameInfo Tools

Guidelines for contributing to the GameInfo ROM hacking toolkit.

## Development Setup

### Prerequisites

- [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0) or later
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or [VS Code](https://code.visualstudio.com/)
- Git

### Clone and Build

```bash
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo
dotnet build src/GameInfoTools.sln
```

### Run Tests

```bash
dotnet test src/GameInfoTools.sln
```

## Project Structure

```
src/
├── GameInfoTools.Core/          # Core types, utilities, RomFile
├── GameInfoTools.Analysis/      # ROM analysis, cross-references
├── GameInfoTools.Graphics/      # Tile graphics, CHR editing
├── GameInfoTools.Text/          # Text extraction, script tools
├── GameInfoTools.Rom/           # ROM manipulation, patching
├── GameInfoTools.Data/          # Game data tables, JSON export
├── GameInfoTools.Disassembly/   # CPU disassembly (6502/65816)
├── GameInfoTools.Cli/           # Command-line interface
└── GameInfoTools.Tests/         # Unit tests
```

## Code Style

### Indentation
- **Use TABS, not spaces** (enforced by `.editorconfig`)
- Tab width: 4 spaces equivalent

### Hexadecimal Values
- Always **lowercase** for hex values
- Correct: `$9d`, `0xca6e`, `$ff00`
- Incorrect: `$9D`, `0xCA6E`, `$FF00`

### Naming Conventions
- `PascalCase` for types, methods, properties
- `camelCase` for local variables, parameters
- `_camelCase` for private fields
- `UPPER_CASE` for constants

### File Organization
- One public type per file
- Group related private types in same file
- Keep files under 500 lines when practical

## Adding New Features

### 1. Create an Issue

Before starting work:
1. Check existing issues for duplicates
2. Create a new issue describing the feature
3. Wait for feedback/approval

### 2. Create a Branch

```bash
git checkout -b feature/your-feature-name
```

### 3. Write Tests First

Add tests in `GameInfoTools.Tests`:

```csharp
using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

public class YourFeatureTests
{
	[Fact]
	public void YourMethod_ExpectedBehavior_ReturnsExpectedResult()
	{
		// Arrange
		var input = ...;

		// Act
		var result = YourClass.YourMethod(input);

		// Assert
		Assert.Equal(expected, result);
	}
}
```

### 4. Implement the Feature

Follow the existing patterns in the codebase:

```csharp
namespace GameInfoTools.YourLibrary;

/// <summary>
/// Brief description of the class.
/// </summary>
public class YourClass
{
	/// <summary>
	/// Description of what the method does.
	/// </summary>
	/// <param name="param">Description of parameter.</param>
	/// <returns>Description of return value.</returns>
	public static Result YourMethod(InputType param)
	{
		// Implementation
	}
}
```

### 5. Add CLI Command (if applicable)

In `GameInfoTools.Cli`, add your command:

```csharp
// In YourCommands.cs
public static class YourCommands
{
	public static void YourCommand(FileInfo romFile)
	{
		// Implementation using Spectre.Console for output
		AnsiConsole.MarkupLine("[cyan]Processing...[/]");
	}
}

// In Program.cs, add to the command tree
var yourCommand = new Command("your-cmd", "Description");
yourCommand.SetHandler(YourCommands.YourCommand, romArg);
```

### 6. Run Tests

```bash
dotnet test src/GameInfoTools.sln
```

All tests must pass before submitting.

### 7. Update Documentation

- Add/update XML documentation comments
- Update relevant guides in `docs/`
- Add entry to CLI reference if adding commands

### 8. Commit and Push

```bash
git add .
git commit -m "feat: Add your feature description"
git push origin feature/your-feature-name
```

### 9. Create Pull Request

1. Open a PR against `main`
2. Fill in the PR template
3. Link related issues
4. Wait for review

## Commit Message Format

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation
- `style:` - Formatting (no code change)
- `refactor:` - Code restructuring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

Examples:
```
feat(Core): Add SNES checksum calculation
fix(Text): Handle null table entries gracefully
docs(Cli): Update command reference for new options
test(Analysis): Add CrossReference boundary tests
```

## Testing Guidelines

### Test Categories

1. **Unit Tests** - Test individual methods
2. **Integration Tests** - Test component interactions
3. **Edge Case Tests** - Test boundary conditions
4. **Performance Tests** - Verify performance characteristics

### Test Naming

```
MethodName_Condition_ExpectedResult
```

Examples:
```csharp
Crc32_EmptyData_ReturnsValidChecksum
ParseHex_DollarPrefix_ReturnsCorrectValue
Encode_UnknownChar_ReplacesWithPlaceholder
```

### Coverage Goals

- All public methods should have tests
- Test both success and failure paths
- Test edge cases (null, empty, boundary values)

## Pull Request Checklist

Before submitting:

- [ ] Code follows project style guidelines
- [ ] All tests pass locally
- [ ] New features have tests
- [ ] Documentation is updated
- [ ] Commit messages follow conventions
- [ ] No breaking changes (or documented if unavoidable)

## Getting Help

- Check existing issues and documentation
- Open a discussion for questions
- Join the community discussions

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
