using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Project template generator for ROM hacking projects.
/// Creates folder structures, config files, and starter scripts for new projects.
/// </summary>
/// <remarks>
/// C# equivalent of: tools/converters/project_gen.py
/// </remarks>
public class ProjectTemplateGenerator {
	private readonly ProjectTemplateConfig _config;

	/// <summary>
	/// Supported platform types for project templates.
	/// </summary>
	public enum Platform {
		/// <summary>Nintendo Entertainment System (NES/Famicom).</summary>
		Nes,
		/// <summary>Super Nintendo Entertainment System (SNES/Super Famicom).</summary>
		Snes,
		/// <summary>Sega Genesis / Mega Drive.</summary>
		Genesis,
		/// <summary>Game Boy / Game Boy Color.</summary>
		GameBoy,
		/// <summary>Game Boy Advance.</summary>
		Gba,
		/// <summary>Generic platform (no specific configuration).</summary>
		Generic
	}

	/// <summary>
	/// Project template types.
	/// </summary>
	public enum TemplateType {
		/// <summary>Full ROM hacking project with all components.</summary>
		Full,
		/// <summary>Disassembly project focused on analysis.</summary>
		Disassembly,
		/// <summary>Translation project for text localization.</summary>
		Translation,
		/// <summary>Documentation-only project.</summary>
		Documentation,
		/// <summary>Minimal project structure.</summary>
		Minimal
	}

	/// <summary>
	/// Template component options.
	/// </summary>
	[Flags]
	public enum TemplateComponents {
		None = 0,
		Disassembly = 1 << 0,
		Graphics = 1 << 1,
		Text = 1 << 2,
		Audio = 1 << 3,
		Maps = 1 << 4,
		Data = 1 << 5,
		Debug = 1 << 6,
		Wiki = 1 << 7,
		Build = 1 << 8,
		Tools = 1 << 9,
		Docs = 1 << 10,
		All = Disassembly | Graphics | Text | Audio | Maps | Data | Debug | Wiki | Build | Tools | Docs
	}

	/// <summary>
	/// Project template configuration.
	/// </summary>
	public record ProjectTemplateConfig {
		/// <summary>Project name.</summary>
		public string ProjectName { get; init; } = "NewProject";

		/// <summary>Target platform.</summary>
		public Platform Platform { get; init; } = Platform.Nes;

		/// <summary>Template type.</summary>
		public TemplateType Type { get; init; } = TemplateType.Full;

		/// <summary>Components to include.</summary>
		public TemplateComponents Components { get; init; } = TemplateComponents.All;

		/// <summary>Game title for documentation.</summary>
		public string GameTitle { get; init; } = "";

		/// <summary>ROM filename (optional).</summary>
		public string RomFilename { get; init; } = "";

		/// <summary>Author/contributor name.</summary>
		public string Author { get; init; } = "";

		/// <summary>Repository URL (optional).</summary>
		public string RepositoryUrl { get; init; } = "";

		/// <summary>Include sample files.</summary>
		public bool IncludeSamples { get; init; } = true;

		/// <summary>Initialize git repository.</summary>
		public bool InitGit { get; init; } = true;

		/// <summary>Use tabs for indentation.</summary>
		public bool UseTabs { get; init; } = true;
	}

	/// <summary>
	/// Generated file information.
	/// </summary>
	public record GeneratedFile(string RelativePath, string Content, bool IsBinary = false);

	/// <summary>
	/// Project generation result.
	/// </summary>
	public record GenerationResult {
		/// <summary>Whether generation was successful.</summary>
		public bool Success { get; init; }

		/// <summary>Project root directory.</summary>
		public string ProjectPath { get; init; } = "";

		/// <summary>List of generated files.</summary>
		public List<GeneratedFile> GeneratedFiles { get; init; } = [];

		/// <summary>List of created directories.</summary>
		public List<string> CreatedDirectories { get; init; } = [];

		/// <summary>Error messages if any.</summary>
		public List<string> Errors { get; init; } = [];

		/// <summary>Warning messages if any.</summary>
		public List<string> Warnings { get; init; } = [];
	}

	/// <summary>
	/// Create a new project template generator.
	/// </summary>
	/// <param name="config">Template configuration.</param>
	public ProjectTemplateGenerator(ProjectTemplateConfig config) {
		_config = config;
	}

	/// <summary>
	/// Create a new project template generator with default configuration.
	/// </summary>
	public ProjectTemplateGenerator() : this(new ProjectTemplateConfig()) { }

	/// <summary>
	/// Generate the project structure.
	/// </summary>
	/// <param name="outputPath">Base path where project will be created.</param>
	/// <returns>Generation result with details of created files and directories.</returns>
	public GenerationResult Generate(string outputPath) {
		var result = new GenerationResult {
			Success = true,
			ProjectPath = Path.Combine(outputPath, _config.ProjectName),
			GeneratedFiles = [],
			CreatedDirectories = [],
			Errors = [],
			Warnings = []
		};

		try {
			// Create project root
			Directory.CreateDirectory(result.ProjectPath);
			result.CreatedDirectories.Add(result.ProjectPath);

			// Create directory structure
			foreach (var dir in GetDirectories()) {
				var fullPath = Path.Combine(result.ProjectPath, dir);
				Directory.CreateDirectory(fullPath);
				result.CreatedDirectories.Add(fullPath);
			}

			// Generate files
			foreach (var file in GetFiles()) {
				var fullPath = Path.Combine(result.ProjectPath, file.RelativePath);
				var directory = Path.GetDirectoryName(fullPath);
				if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory)) {
					Directory.CreateDirectory(directory);
				}

				if (file.IsBinary) {
					File.WriteAllBytes(fullPath, Convert.FromBase64String(file.Content));
				} else {
					File.WriteAllText(fullPath, file.Content);
				}
				result.GeneratedFiles.Add(file);
			}

			// Initialize git if requested
			if (_config.InitGit) {
				var gitignorePath = Path.Combine(result.ProjectPath, ".gitignore");
				if (!File.Exists(gitignorePath)) {
					File.WriteAllText(gitignorePath, GenerateGitignore());
					result.GeneratedFiles.Add(new GeneratedFile(".gitignore", ""));
				}
			}
		} catch (Exception ex) {
			result = result with {
				Success = false,
				Errors = [.. result.Errors, ex.Message]
			};
		}

		return result;
	}

	/// <summary>
	/// Preview the project structure without creating files.
	/// </summary>
	/// <returns>Generation result showing what would be created.</returns>
	public GenerationResult Preview() {
		return new GenerationResult {
			Success = true,
			ProjectPath = _config.ProjectName,
			GeneratedFiles = GetFiles().ToList(),
			CreatedDirectories = GetDirectories().Select(d => Path.Combine(_config.ProjectName, d)).ToList(),
			Errors = [],
			Warnings = []
		};
	}

	/// <summary>
	/// Get list of directories to create based on configuration.
	/// </summary>
	private IEnumerable<string> GetDirectories() {
		// Always include base directories
		yield return "roms";

		if (_config.Components.HasFlag(TemplateComponents.Disassembly)) {
			yield return "disasm";
			yield return "disasm/banks";
		}

		if (_config.Components.HasFlag(TemplateComponents.Graphics)) {
			yield return "assets/graphics";
			yield return "assets/graphics/tiles";
			yield return "assets/graphics/sprites";
			yield return "assets/graphics/palettes";
		}

		if (_config.Components.HasFlag(TemplateComponents.Text)) {
			yield return "assets/text";
			yield return "assets/text/tables";
			yield return "assets/text/scripts";
		}

		if (_config.Components.HasFlag(TemplateComponents.Audio)) {
			yield return "assets/audio";
			yield return "assets/audio/music";
			yield return "assets/audio/sfx";
		}

		if (_config.Components.HasFlag(TemplateComponents.Maps)) {
			yield return "assets/maps";
			yield return "assets/maps/overworld";
			yield return "assets/maps/dungeons";
		}

		if (_config.Components.HasFlag(TemplateComponents.Data)) {
			yield return "data";
			yield return "data/json";
			yield return "data/tables";
			yield return "data/schema";
		}

		if (_config.Components.HasFlag(TemplateComponents.Debug)) {
			yield return "debug";
			yield return "debug/cdl";
			yield return "debug/labels";
			yield return "debug/saves";
		}

		if (_config.Components.HasFlag(TemplateComponents.Wiki)) {
			yield return "wiki";
			yield return "wiki/files";
			yield return "wiki/images";
		}

		if (_config.Components.HasFlag(TemplateComponents.Build)) {
			yield return "build";
			yield return "build/patches";
		}

		if (_config.Components.HasFlag(TemplateComponents.Tools)) {
			yield return "tools";
		}

		if (_config.Components.HasFlag(TemplateComponents.Docs)) {
			yield return "docs";
			yield return "~docs";
			yield return "~docs/session-logs";
			yield return "~docs/chat-logs";
		}
	}

	/// <summary>
	/// Get list of files to generate based on configuration.
	/// </summary>
	private IEnumerable<GeneratedFile> GetFiles() {
		// README.md
		yield return new GeneratedFile("README.md", GenerateReadme());

		// Build configuration
		yield return new GeneratedFile("build.config.json", GenerateBuildConfig());

		// EditorConfig
		yield return new GeneratedFile(".editorconfig", GenerateEditorConfig());

		// Platform-specific files
		foreach (var file in GetPlatformFiles()) {
			yield return file;
		}

		// Component-specific files
		if (_config.Components.HasFlag(TemplateComponents.Text)) {
			yield return new GeneratedFile("assets/text/tables/main.tbl", GenerateTextTable());
		}

		if (_config.Components.HasFlag(TemplateComponents.Data)) {
			yield return new GeneratedFile("data/schema/README.md", GenerateDataSchemaReadme());
		}

		if (_config.Components.HasFlag(TemplateComponents.Debug)) {
			yield return new GeneratedFile("debug/labels/README.md", GenerateLabelsReadme());
		}

		if (_config.Components.HasFlag(TemplateComponents.Wiki)) {
			yield return new GeneratedFile("wiki/README.md", GenerateWikiReadme());
		}

		if (_config.Components.HasFlag(TemplateComponents.Docs)) {
			yield return new GeneratedFile("docs/README.md", GenerateDocsReadme());
		}

		if (_config.Components.HasFlag(TemplateComponents.Build)) {
			yield return new GeneratedFile("build.ps1", GenerateBuildScript());
		}
	}

	private IEnumerable<GeneratedFile> GetPlatformFiles() {
		return _config.Platform switch {
			Platform.Nes => GetNesFiles(),
			Platform.Snes => GetSnesFiles(),
			Platform.Genesis => GetGenesisFiles(),
			Platform.GameBoy => GetGameBoyFiles(),
			Platform.Gba => GetGbaFiles(),
			_ => []
		};
	}

	private IEnumerable<GeneratedFile> GetNesFiles() {
		if (_config.Components.HasFlag(TemplateComponents.Debug)) {
			yield return new GeneratedFile($"debug/labels/{_config.ProjectName}.mlb", GenerateMesenLabels());
		}

		if (_config.Components.HasFlag(TemplateComponents.Disassembly)) {
			yield return new GeneratedFile("disasm/header.asm", GenerateNesHeader());
		}
	}

	private IEnumerable<GeneratedFile> GetSnesFiles() {
		if (_config.Components.HasFlag(TemplateComponents.Debug)) {
			yield return new GeneratedFile($"debug/labels/{_config.ProjectName}.mlb", GenerateMesenLabels());
		}
	}

	private IEnumerable<GeneratedFile> GetGenesisFiles() {
		// Genesis-specific files
		yield break;
	}

	private IEnumerable<GeneratedFile> GetGameBoyFiles() {
		// Game Boy-specific files
		yield break;
	}

	private IEnumerable<GeneratedFile> GetGbaFiles() {
		// GBA-specific files
		yield break;
	}

	private string GenerateReadme() {
		var indent = _config.UseTabs ? "\t" : "    ";
		var title = string.IsNullOrEmpty(_config.GameTitle) ? _config.ProjectName : _config.GameTitle;
		var platform = _config.Platform.ToString().ToUpper();

		var sb = new StringBuilder();
		sb.AppendLine($"# {title}");
		sb.AppendLine();
		sb.AppendLine($"ROM hacking project for {title} ({platform}).");
		sb.AppendLine();

		sb.AppendLine("## Project Structure");
		sb.AppendLine();
		sb.AppendLine("```");
		sb.AppendLine($"{_config.ProjectName}/");
		foreach (var dir in GetDirectories().Take(10)) {
			sb.AppendLine($"{indent}{dir}/");
		}
		sb.AppendLine("```");
		sb.AppendLine();

		if (!string.IsNullOrEmpty(_config.RomFilename)) {
			sb.AppendLine("## ROM Information");
			sb.AppendLine();
			sb.AppendLine($"- **Filename**: `{_config.RomFilename}`");
			sb.AppendLine($"- **Platform**: {platform}");
			sb.AppendLine();
		}

		if (_config.Components.HasFlag(TemplateComponents.Build)) {
			sb.AppendLine("## Building");
			sb.AppendLine();
			sb.AppendLine("```powershell");
			sb.AppendLine("./build.ps1");
			sb.AppendLine("```");
			sb.AppendLine();
		}

		if (!string.IsNullOrEmpty(_config.Author)) {
			sb.AppendLine("## Credits");
			sb.AppendLine();
			sb.AppendLine($"- {_config.Author}");
			sb.AppendLine();
		}

		return sb.ToString();
	}

	private string GenerateBuildConfig() {
		var config = new {
			projectName = _config.ProjectName,
			platform = _config.Platform.ToString().ToLower(),
			romFile = _config.RomFilename,
			outputDir = "build",
			assets = new {
				graphics = "assets/graphics",
				text = "assets/text",
				audio = "assets/audio",
				maps = "assets/maps"
			},
			build = new {
				verify = true,
				generatePatches = true
			}
		};

		return JsonSerializer.Serialize(config, new JsonSerializerOptions {
			WriteIndented = true,
			PropertyNamingPolicy = JsonNamingPolicy.CamelCase
		});
	}

	private string GenerateEditorConfig() {
		var sb = new StringBuilder();
		sb.AppendLine("root = true");
		sb.AppendLine();
		sb.AppendLine("[*]");
		sb.AppendLine("charset = utf-8");
		sb.AppendLine("end_of_line = lf");
		sb.AppendLine("insert_final_newline = true");
		sb.AppendLine("trim_trailing_whitespace = true");
		sb.AppendLine();
		if (_config.UseTabs) {
			sb.AppendLine("indent_style = tab");
			sb.AppendLine("indent_size = 4");
			sb.AppendLine("tab_width = 4");
		} else {
			sb.AppendLine("indent_style = space");
			sb.AppendLine("indent_size = 4");
		}
		sb.AppendLine();
		sb.AppendLine("[*.asm]");
		sb.AppendLine("indent_style = tab");
		sb.AppendLine("indent_size = 8");
		sb.AppendLine("tab_width = 8");
		sb.AppendLine();
		sb.AppendLine("[*.md]");
		sb.AppendLine("trim_trailing_whitespace = false");

		return sb.ToString();
	}

	private string GenerateGitignore() {
		var sb = new StringBuilder();
		sb.AppendLine("# Build output");
		sb.AppendLine("build/");
		sb.AppendLine("*.o");
		sb.AppendLine("*.nes");
		sb.AppendLine("*.sfc");
		sb.AppendLine("*.smc");
		sb.AppendLine("*.gba");
		sb.AppendLine("*.gb");
		sb.AppendLine("*.gbc");
		sb.AppendLine("*.bin");
		sb.AppendLine();
		sb.AppendLine("# ROMs (don't commit copyrighted files)");
		sb.AppendLine("roms/*.nes");
		sb.AppendLine("roms/*.sfc");
		sb.AppendLine("roms/*.smc");
		sb.AppendLine("roms/*.gba");
		sb.AppendLine("roms/*.gb");
		sb.AppendLine("roms/*.gbc");
		sb.AppendLine("roms/*.md");
		sb.AppendLine("roms/*.gen");
		sb.AppendLine();
		sb.AppendLine("# Debug files");
		sb.AppendLine("debug/saves/*.sav");
		sb.AppendLine("debug/saves/*.state*");
		sb.AppendLine("*.cdl");
		sb.AppendLine();
		sb.AppendLine("# IDE");
		sb.AppendLine(".vs/");
		sb.AppendLine(".vscode/");
		sb.AppendLine("*.user");
		sb.AppendLine("*.suo");
		sb.AppendLine();
		sb.AppendLine("# Python");
		sb.AppendLine("__pycache__/");
		sb.AppendLine("*.pyc");
		sb.AppendLine("venv/");

		return sb.ToString();
	}

	private string GenerateTextTable() {
		var sb = new StringBuilder();
		sb.AppendLine("# Text Table for " + (_config.GameTitle ?? _config.ProjectName));
		sb.AppendLine("# Format: HEX=CHARACTER");
		sb.AppendLine();

		// Common ASCII mappings
		for (int i = 0x20; i <= 0x7E; i++) {
			sb.AppendLine($"{i:x2}={(char)i}");
		}

		return sb.ToString();
	}

	private string GenerateMesenLabels() {
		var sb = new StringBuilder();
		sb.AppendLine($"# Mesen Label File for {_config.GameTitle ?? _config.ProjectName}");
		sb.AppendLine("# Format: Address:Label:Comment");
		sb.AppendLine();
		sb.AppendLine("# RAM Labels");
		sb.AppendLine("R:0000:zp_temp:Temporary storage");
		sb.AppendLine();
		sb.AppendLine("# PRG Labels");
		sb.AppendLine("P:8000:reset_vector:Reset handler");
		sb.AppendLine("P:FFFA:nmi_vector:NMI vector");
		sb.AppendLine("P:FFFC:reset_ptr:Reset vector pointer");
		sb.AppendLine("P:FFFE:irq_vector:IRQ vector");

		return sb.ToString();
	}

	private string GenerateNesHeader() {
		var sb = new StringBuilder();
		sb.AppendLine("; NES ROM Header");
		sb.AppendLine("; Project: " + (_config.GameTitle ?? _config.ProjectName));
		sb.AppendLine();
		sb.AppendLine(".segment \"HEADER\"");
		sb.AppendLine();
		sb.AppendLine("\t.byte \"NES\", $1A\t; iNES signature");
		sb.AppendLine("\t.byte $00\t\t; PRG ROM size in 16KB units");
		sb.AppendLine("\t.byte $00\t\t; CHR ROM size in 8KB units");
		sb.AppendLine("\t.byte $00\t\t; Flags 6 - mapper/mirroring");
		sb.AppendLine("\t.byte $00\t\t; Flags 7 - mapper/VS/PlayChoice");
		sb.AppendLine("\t.byte $00\t\t; Flags 8 - PRG RAM size");
		sb.AppendLine("\t.byte $00\t\t; Flags 9 - TV system");
		sb.AppendLine("\t.byte $00\t\t; Flags 10 - unused");
		sb.AppendLine("\t.res 5, $00\t\t; Padding");

		return sb.ToString();
	}

	private string GenerateDataSchemaReadme() {
		return $@"# Data Schemas

JSON Schema files for data structures in {_config.GameTitle ?? _config.ProjectName}.

## Structure

- `monsters.schema.json` - Monster/enemy data format
- `items.schema.json` - Item data format
- `spells.schema.json` - Magic/ability data format

## Usage

Schemas validate JSON data files in `data/json/`.
";
	}

	private string GenerateLabelsReadme() {
		return $@"# Debug Labels

Debug label files for {_config.GameTitle ?? _config.ProjectName}.

## Formats

- `.mlb` - Mesen label format
- `.nl` - FCEUX name list format
- `.sym` - Generic symbol file

## Usage

Load these files in your emulator's debugger for named addresses.
";
	}

	private string GenerateWikiReadme() {
		return $@"# Wiki Content

Data Crystal-style wikitext for {_config.GameTitle ?? _config.ProjectName}.

## Contents

- `ROM_Map.wikitext` - ROM memory layout
- `RAM_Map.wikitext` - RAM variable documentation
- `TBL.wikitext` - Text encoding table

## Publishing

See [Data Crystal](https://datacrystal.tcrf.net/) for wiki guidelines.

⚠️ **Note**: AI-generated content is not permitted on Data Crystal.
All content must be manually reviewed and edited before upload.
";
	}

	private string GenerateDocsReadme() {
		return $@"# Documentation

Project documentation for {_config.GameTitle ?? _config.ProjectName}.

## Contents

- Game mechanics documentation
- Data structure specifications
- Tool usage guides
- Research notes
";
	}

	private string GenerateBuildScript() {
		return @"# Build Script
param(
	[switch]$Clean,
	[switch]$Verify
)

$ErrorActionPreference = 'Stop'
$ProjectRoot = $PSScriptRoot

Write-Host ""Building project..."" -ForegroundColor Cyan

# Create build directory
$BuildDir = Join-Path $ProjectRoot ""build""
if (-not (Test-Path $BuildDir)) {
	New-Item -ItemType Directory -Path $BuildDir | Out-Null
}

if ($Clean) {
	Write-Host ""Cleaning build directory..."" -ForegroundColor Yellow
	Remove-Item -Path ""$BuildDir\*"" -Recurse -Force
}

# TODO: Add build steps here

Write-Host ""Build complete!"" -ForegroundColor Green
";
	}

	/// <summary>
	/// Get a preset configuration for a specific project type.
	/// </summary>
	/// <param name="platform">Target platform.</param>
	/// <param name="type">Template type.</param>
	/// <returns>Preset configuration.</returns>
	public static ProjectTemplateConfig GetPreset(Platform platform, TemplateType type) {
		var components = type switch {
			TemplateType.Full => TemplateComponents.All,
			TemplateType.Disassembly => TemplateComponents.Disassembly | TemplateComponents.Debug | TemplateComponents.Docs,
			TemplateType.Translation => TemplateComponents.Text | TemplateComponents.Data | TemplateComponents.Build,
			TemplateType.Documentation => TemplateComponents.Docs | TemplateComponents.Wiki,
			TemplateType.Minimal => TemplateComponents.None,
			_ => TemplateComponents.All
		};

		return new ProjectTemplateConfig {
			Platform = platform,
			Type = type,
			Components = components
		};
	}
}
