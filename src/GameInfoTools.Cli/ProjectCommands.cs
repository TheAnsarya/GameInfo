using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Project management commands.
/// </summary>
public static class ProjectCommands
{
	public static void Init(string projectName, string projectType, string targetPath)
	{
		AnsiConsole.MarkupLine($"[cyan]Initializing new project: {projectName}[/]");
		AnsiConsole.MarkupLine($"[grey]Type: {projectType}[/]");

		var basePath = Path.Combine(targetPath, projectName);
		Directory.CreateDirectory(basePath);

		switch (projectType.ToLowerInvariant())
		{
			case "disassembly":
			case "disasm":
				CreateDisassemblyProject(basePath, projectName);
				break;

			case "romhack":
			case "hack":
				CreateRomHackProject(basePath, projectName);
				break;

			case "translation":
			case "trans":
				CreateTranslationProject(basePath, projectName);
				break;

			case "documentation":
			case "docs":
				CreateDocumentationProject(basePath, projectName);
				break;

			default:
				CreateGenericProject(basePath, projectName);
				break;
		}

		AnsiConsole.MarkupLine($"[green]Project created at: {basePath}[/]");
	}

	private static void CreateDisassemblyProject(string basePath, string name)
	{
		// Create standard disassembly project structure
		var dirs = new[]
		{
			"src",
			"src/banks",
			"src/data",
			"src/include",
			"assets",
			"assets/graphics",
			"assets/text",
			"assets/audio",
			"build",
			"docs",
			"tools",
			"roms"
		};

		foreach (var dir in dirs)
		{
			Directory.CreateDirectory(Path.Combine(basePath, dir));
		}

		// Create README
		var readme = $@"# {name}

A disassembly project.

## Building

```bash
# Build the ROM
./build.ps1

# Clean and rebuild
./build.ps1 -Clean
```

## Structure

- `src/` - Assembly source files
  - `banks/` - Per-bank assembly files
  - `data/` - Data tables and definitions
  - `include/` - Headers and macros
- `assets/` - Extracted game assets
- `build/` - Build output
- `docs/` - Documentation
- `tools/` - Custom tools
- `roms/` - Original ROMs (not in repo)

## Resources

- Data Crystal: https://datacrystal.romhacking.net/
";

		File.WriteAllText(Path.Combine(basePath, "README.md"), readme);

		// Create .gitignore
		var gitignore = @"# Build output
build/
*.nes
*.sfc
*.smc
*.gba
*.gb
*.gbc

# ROMs
roms/

# IDE
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
";

		File.WriteAllText(Path.Combine(basePath, ".gitignore"), gitignore);

		// Create basic config
		var config = $@"{{
	""projectName"": ""{name}"",
	""projectType"": ""disassembly"",
	""system"": ""nes"",
	""assembler"": ""ca65"",
	""linker"": ""ld65"",
	""sourceDir"": ""src"",
	""buildDir"": ""build"",
	""outputRom"": ""{name.ToLowerInvariant().Replace(" ", "-")}.nes""
}}
";

		File.WriteAllText(Path.Combine(basePath, "project.json"), config);

		AnsiConsole.MarkupLine("[green]Created disassembly project structure[/]");
	}

	private static void CreateRomHackProject(string basePath, string name)
	{
		var dirs = new[]
		{
			"patches",
			"assets",
			"assets/graphics",
			"assets/text",
			"docs",
			"tools",
			"roms"
		};

		foreach (var dir in dirs)
		{
			Directory.CreateDirectory(Path.Combine(basePath, dir));
		}

		var readme = $@"# {name}

A ROM hack project.

## Applying the Hack

1. Obtain a clean ROM
2. Apply the patch from `patches/`

## Structure

- `patches/` - IPS/BPS patch files
- `assets/` - Modified assets
- `docs/` - Documentation
- `tools/` - Utilities
";

		File.WriteAllText(Path.Combine(basePath, "README.md"), readme);

		AnsiConsole.MarkupLine("[green]Created ROM hack project structure[/]");
	}

	private static void CreateTranslationProject(string basePath, string name)
	{
		var dirs = new[]
		{
			"text",
			"text/original",
			"text/translated",
			"graphics",
			"graphics/original",
			"graphics/translated",
			"fonts",
			"tools",
			"patches",
			"docs",
			"roms"
		};

		foreach (var dir in dirs)
		{
			Directory.CreateDirectory(Path.Combine(basePath, dir));
		}

		var readme = $@"# {name}

A translation project.

## Progress

- [ ] Script extraction
- [ ] Script translation
- [ ] Script insertion
- [ ] Graphics translation
- [ ] Testing

## Structure

- `text/` - Game text
  - `original/` - Original language
  - `translated/` - Translated text
- `graphics/` - Graphical text
- `fonts/` - Custom fonts
- `patches/` - Translation patches
";

		File.WriteAllText(Path.Combine(basePath, "README.md"), readme);

		// Create table file template
		var tableFile = @"; Text table file
; Format: XX=Character

00=[END]
01=[NL]
02= 

; Uppercase
41=A
42=B
43=C
; ... etc
";

		File.WriteAllText(Path.Combine(basePath, "text", "game.tbl"), tableFile);

		AnsiConsole.MarkupLine("[green]Created translation project structure[/]");
	}

	private static void CreateDocumentationProject(string basePath, string name)
	{
		var dirs = new[]
		{
			"wiki",
			"wiki/images",
			"research",
			"references",
			"tools"
		};

		foreach (var dir in dirs)
		{
			Directory.CreateDirectory(Path.Combine(basePath, dir));
		}

		var readme = $@"# {name}

Documentation project for game research.

## Contents

- `wiki/` - Data Crystal wiki articles
- `research/` - Research notes and findings
- `references/` - External references
- `tools/` - Analysis tools
";

		File.WriteAllText(Path.Combine(basePath, "README.md"), readme);

		// Create wiki template
		var wikiTemplate = @"{{Infobox|game=GAME_NAME|image=GAME.png|title=GAME_NAME|developer=DEVELOPER|publisher=PUBLISHER|platform=PLATFORM|released=YYYY}}

==ROM map==

===Bank 0===
{| class=""mw-datatable""
! ROM Address
! Length
! Description
|-
| $0000
| 
| 
|}

==RAM map==

{| class=""mw-datatable""
! Address
! Length
! Description
|-
| $0000
| 
| 
|}

==Text Table==

See [[GAME_NAME:TBL|Text Table]]
";

		File.WriteAllText(Path.Combine(basePath, "wiki", "main.wikitext"), wikiTemplate);

		AnsiConsole.MarkupLine("[green]Created documentation project structure[/]");
	}

	private static void CreateGenericProject(string basePath, string name)
	{
		var dirs = new[] { "src", "docs", "tools", "build" };

		foreach (var dir in dirs)
		{
			Directory.CreateDirectory(Path.Combine(basePath, dir));
		}

		var readme = $@"# {name}

A game info project.
";

		File.WriteAllText(Path.Combine(basePath, "README.md"), readme);

		AnsiConsole.MarkupLine("[green]Created generic project structure[/]");
	}

	public static void ListProjects(string searchPath)
	{
		AnsiConsole.MarkupLine($"[cyan]Scanning for projects in: {searchPath}[/]");

		var projects = new List<(string Path, string Name, string Type)>();

		// Look for project.json files
		foreach (var file in Directory.EnumerateFiles(searchPath, "project.json", SearchOption.AllDirectories))
		{
			try
			{
				var dir = Path.GetDirectoryName(file);
				var name = Path.GetFileName(dir) ?? "Unknown";
				projects.Add((dir ?? "", name, "Disassembly"));
			}
			catch
			{
				// Skip inaccessible directories
			}
		}

		// Look for common project indicators
		foreach (var dir in Directory.EnumerateDirectories(searchPath))
		{
			var name = Path.GetFileName(dir);

			if (Directory.Exists(Path.Combine(dir, "src", "banks")))
			{
				if (!projects.Any(p => p.Path == dir))
					projects.Add((dir, name, "Disassembly"));
			}
			else if (Directory.Exists(Path.Combine(dir, "wiki")))
			{
				if (!projects.Any(p => p.Path == dir))
					projects.Add((dir, name, "Documentation"));
			}
			else if (Directory.Exists(Path.Combine(dir, "text", "translated")))
			{
				if (!projects.Any(p => p.Path == dir))
					projects.Add((dir, name, "Translation"));
			}
		}

		if (projects.Count == 0)
		{
			AnsiConsole.MarkupLine("[yellow]No projects found[/]");
			return;
		}

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title($"[cyan]Found {projects.Count} Projects[/]")
			.AddColumn("Name")
			.AddColumn("Type")
			.AddColumn("Path");

		foreach (var (path, name, type) in projects)
		{
			table.AddRow(name, type, path);
		}

		AnsiConsole.Write(table);
	}

	public static void Status(string projectPath)
	{
		if (!Directory.Exists(projectPath))
		{
			AnsiConsole.MarkupLine($"[red]Error: Project path not found: {projectPath}[/]");
			return;
		}

		var name = Path.GetFileName(projectPath);
		AnsiConsole.MarkupLine($"[cyan]Project Status: {name}[/]");

		// Count files by type
		var stats = new Dictionary<string, int>();
		foreach (var file in Directory.EnumerateFiles(projectPath, "*", SearchOption.AllDirectories))
		{
			var ext = Path.GetExtension(file).ToLowerInvariant();
			if (string.IsNullOrEmpty(ext)) ext = "(no ext)";

			if (stats.ContainsKey(ext))
				stats[ext]++;
			else
				stats[ext] = 1;
		}

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Extension")
			.AddColumn("Count");

		foreach (var kvp in stats.OrderByDescending(k => k.Value).Take(15))
		{
			table.AddRow(kvp.Key, kvp.Value.ToString());
		}

		AnsiConsole.Write(table);

		// Check for common issues
		AnsiConsole.MarkupLine("[cyan]Checks:[/]");

		if (File.Exists(Path.Combine(projectPath, "README.md")))
			AnsiConsole.MarkupLine("[green]✓[/] README.md exists");
		else
			AnsiConsole.MarkupLine("[yellow]⚠[/] README.md missing");

		if (File.Exists(Path.Combine(projectPath, ".gitignore")))
			AnsiConsole.MarkupLine("[green]✓[/] .gitignore exists");
		else
			AnsiConsole.MarkupLine("[yellow]⚠[/] .gitignore missing");

		if (Directory.Exists(Path.Combine(projectPath, ".git")))
			AnsiConsole.MarkupLine("[green]✓[/] Git repository initialized");
		else
			AnsiConsole.MarkupLine("[yellow]⚠[/] Not a git repository");
	}
}
