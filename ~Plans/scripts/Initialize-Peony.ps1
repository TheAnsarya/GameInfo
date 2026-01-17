<#
.SYNOPSIS
	Initialize Peony repository structure

.DESCRIPTION
	Creates the complete directory structure and initial files for the Peony
	disassembler framework.

.PARAMETER Path
	Target path for the new repository (default: sibling to GameInfo)

.EXAMPLE
	.\Initialize-Peony.ps1
	.\Initialize-Peony.ps1 -Path "C:\Users\me\source\repos\peony"
#>
param(
	[string]$Path = "C:\Users\me\source\repos\peony"
)

$ErrorActionPreference = "Stop"

Write-Host "� Initializing Peony Disassembler Framework..." -ForegroundColor Magenta
Write-Host "   Target: $Path"

# Create directories
$dirs = @(
	"src/Peony.Core",
	"src/Peony.Cpu.6502",
	"src/Peony.Cpu.65816",
	"src/Peony.Cpu.SM83",
	"src/Peony.Platform.Atari2600",
	"src/Peony.Platform.NES",
	"src/Peony.Platform.SNES",
	"src/Peony.Platform.GB",
	"src/Peony.Cli",
	"tests/Peony.Core.Tests",
	"tests/Peony.Cpu.6502.Tests",
	"tests/Peony.Platform.Atari2600.Tests",
	"docs",
	"~docs/chat-logs",
	"~docs/session-logs",
	"~Plans",
	"~manual-testing",
	"~reference-files"
)

foreach ($dir in $dirs) {
	$fullPath = Join-Path $Path $dir
	if (-not (Test-Path $fullPath)) {
		New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
		Write-Host "   📁 Created: $dir" -ForegroundColor DarkGray
	}
}

# Create README.md
$readme = @"
# � Peony - Multi-System Disassembler Framework

> The anti-Poppy: ROM → Source code conversion

[![.NET](https://img.shields.io/badge/.NET-10.0-blue)](https://dotnet.microsoft.com/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

## Overview

Peony is a multi-system disassembler framework designed to work alongside [Poppy](https://github.com/TheAnsarya/poppy) to provide complete bidirectional ROM ↔ Source conversion.

| Direction | Tool | Input | Output |
|-----------|------|-------|--------|
| Assembly | **Poppy** | `.pasm` source | ROM binary |
| Disassembly | **Peony** | ROM binary | `.pasm` source |

## 🎮 Supported Systems

| System | CPU | Status |
|--------|-----|--------|
| Atari 2600 | 6507 | 🎯 Priority |
| NES | 6502 | Planned |
| SNES | 65816 | Planned |
| Game Boy | SM83 | Planned |
| Atari Lynx | 65C02 | Planned |

## ✨ Features

- **Roundtrip Guarantee**: Disassembled code reassembles to identical ROM
- **Multiple Algorithms**: Linear sweep, recursive descent, speculative, hybrid
- **Platform-Aware**: Automatic register labeling, kernel detection
- **Integration**: Import from Mesen2 CDL, DiztinGUIsh, FCEUX
- **Poppy Output**: Native `.pasm` output format

## 🚀 Quick Start

``````bash
# Disassemble an Atari 2600 ROM
peony disasm --platform atari2600 game.a26 -o game/

# Disassemble with CDL hints
peony disasm --platform nes game.nes --cdl game.cdl -o game/

# Verify roundtrip
peony verify game/ --original game.nes
``````

## 📁 Project Structure

``````
src/
├── Peony.Core/              # Core framework
├── Peony.Cpu.6502/          # 6502/6507/65C02 decoder
├── Peony.Cpu.65816/         # 65816 decoder
├── Peony.Cpu.SM83/          # Game Boy CPU decoder
├── Peony.Platform.Atari2600/# Atari 2600 analysis
├── Peony.Platform.NES/      # NES analysis
├── Peony.Platform.SNES/     # SNES analysis
├── Peony.Platform.GB/       # Game Boy analysis
└── Peony.Cli/               # CLI application
``````

## 🔧 Building

``````bash
dotnet build
dotnet test
dotnet pack
``````

## 📖 Documentation

- [Architecture](docs/Architecture.md)
- [CPU Support](docs/CPU-Support.md)
- [Platform Support](docs/Platform-Support.md)
- [Output Formats](docs/Output-Formats.md)

## 🤝 Related Projects

- [Poppy](https://github.com/TheAnsarya/poppy) - Multi-system assembler
- [BPS-Patch](https://github.com/TheAnsarya/bps-patch) - Binary patching
- [GameInfo](https://github.com/TheAnsarya/GameInfo) - Game documentation

## 📜 License

MIT License - See [LICENSE](LICENSE) for details.
"@

Set-Content -Path (Join-Path $Path "README.md") -Value $readme -Encoding UTF8
Write-Host "   📄 Created: README.md" -ForegroundColor Green

# Create solution file
$sln = @"
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 17
VisualStudioVersion = 17.0.31903.59
MinimumVisualStudioVersion = 10.0.40219.1
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Peony.Core", "src\Peony.Core\Peony.Core.csproj", "{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Peony.Cpu.6502", "src\Peony.Cpu.6502\Peony.Cpu.6502.csproj", "{B2C3D4E5-F6A7-8901-BCDE-F23456789012}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Peony.Platform.Atari2600", "src\Peony.Platform.Atari2600\Peony.Platform.Atari2600.csproj", "{C3D4E5F6-A7B8-9012-CDEF-345678901234}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Peony.Cli", "src\Peony.Cli\Peony.Cli.csproj", "{D4E5F6A7-B8C9-0123-DEF0-456789012345}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
EndGlobal
"@

Set-Content -Path (Join-Path $Path "Peony.sln") -Value $sln -Encoding UTF8
Write-Host "   📄 Created: Peony.sln" -ForegroundColor Green

# Create Core project
$coreCsproj = @"
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<TargetFramework>net10.0</TargetFramework>
		<ImplicitUsings>enable</ImplicitUsings>
		<Nullable>enable</Nullable>
		<LangVersion>14</LangVersion>
		<RootNamespace>Peony.Core</RootNamespace>
	</PropertyGroup>
</Project>
"@

Set-Content -Path (Join-Path $Path "src/Peony.Core/Peony.Core.csproj") -Value $coreCsproj -Encoding UTF8
Write-Host "   📄 Created: Peony.Core.csproj" -ForegroundColor Green

# Create core interfaces
$interfaces = @"
namespace Peony.Core;

/// <summary>
/// CPU instruction decoder interface
/// </summary>
public interface ICpuDecoder {
	/// <summary>CPU architecture name (e.g., "6502", "65816")</summary>
	string Architecture { get; }

	/// <summary>Decode instruction at offset</summary>
	DecodedInstruction Decode(ReadOnlySpan<byte> data, uint address);

	/// <summary>Check if instruction modifies control flow</summary>
	bool IsControlFlow(DecodedInstruction instruction);

	/// <summary>Get possible target addresses for control flow instruction</summary>
	IEnumerable<uint> GetTargets(DecodedInstruction instruction, uint address);
}

/// <summary>
/// Platform-specific ROM analyzer
/// </summary>
public interface IPlatformAnalyzer {
	/// <summary>Platform name (e.g., "Atari 2600", "NES")</summary>
	string Platform { get; }

	/// <summary>Associated CPU decoder</summary>
	ICpuDecoder CpuDecoder { get; }

	/// <summary>Detect ROM type and configuration</summary>
	RomInfo Analyze(ReadOnlySpan<byte> rom);

	/// <summary>Get hardware register label for address</summary>
	string? GetRegisterLabel(uint address);

	/// <summary>Get memory region type for address</summary>
	MemoryRegion GetMemoryRegion(uint address);
}

/// <summary>
/// Output format generator
/// </summary>
public interface IOutputFormatter {
	/// <summary>Format name</summary>
	string Name { get; }

	/// <summary>File extension</summary>
	string Extension { get; }

	/// <summary>Generate output from disassembly</summary>
	void Generate(DisassemblyResult result, string outputPath);
}

/// <summary>
/// Decoded instruction
/// </summary>
public record DecodedInstruction(
	string Mnemonic,
	string Operand,
	byte[] Bytes,
	AddressingMode Mode
);

/// <summary>
/// Addressing modes
/// </summary>
public enum AddressingMode {
	Implied,
	Immediate,
	ZeroPage,
	ZeroPageX,
	ZeroPageY,
	Absolute,
	AbsoluteX,
	AbsoluteY,
	Indirect,
	IndirectX,
	IndirectY,
	Relative
}

/// <summary>
/// Memory region types
/// </summary>
public enum MemoryRegion {
	Unknown,
	Code,
	Data,
	Graphics,
	Audio,
	Ram,
	Rom,
	Hardware
}

/// <summary>
/// ROM information
/// </summary>
public record RomInfo(
	string Platform,
	int Size,
	string? Mapper,
	Dictionary<string, string> Metadata
);

/// <summary>
/// Disassembly result
/// </summary>
public class DisassemblyResult {
	public RomInfo RomInfo { get; set; } = null!;
	public List<DisassembledBlock> Blocks { get; } = [];
	public Dictionary<uint, string> Labels { get; } = [];
	public Dictionary<uint, string> Comments { get; } = [];
}

/// <summary>
/// Block of disassembled code/data
/// </summary>
public record DisassembledBlock(
	uint StartAddress,
	uint EndAddress,
	MemoryRegion Type,
	List<DisassembledLine> Lines
);

/// <summary>
/// Single disassembled line
/// </summary>
public record DisassembledLine(
	uint Address,
	byte[] Bytes,
	string? Label,
	string Content,
	string? Comment
);
"@

Set-Content -Path (Join-Path $Path "src/Peony.Core/Interfaces.cs") -Value $interfaces -Encoding UTF8
Write-Host "   📄 Created: Interfaces.cs" -ForegroundColor Green

# Create .gitignore
$gitignore = @"
## Build results
bin/
obj/
build/

## IDE
.vs/
.vscode/
*.user
*.suo

## Packages
packages/
*.nupkg

## Test results
TestResults/
coverage/

## OS files
.DS_Store
Thumbs.db
"@

Set-Content -Path (Join-Path $Path ".gitignore") -Value $gitignore -Encoding UTF8
Write-Host "   📄 Created: .gitignore" -ForegroundColor Green

# Create LICENSE
$license = @"
MIT License

Copyright (c) 2026 TheAnsarya

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"@

Set-Content -Path (Join-Path $Path "LICENSE") -Value $license -Encoding UTF8
Write-Host "   📄 Created: LICENSE" -ForegroundColor Green

# Create .editorconfig
$editorconfig = @"
root = true

[*]
indent_style = tab
indent_size = 4
end_of_line = crlf
charset = utf-8-bom
trim_trailing_whitespace = true
insert_final_newline = true

[*.cs]
csharp_style_namespace_declarations = file_scoped:suggestion
csharp_new_line_before_open_brace = none

[*.md]
trim_trailing_whitespace = false
"@

Set-Content -Path (Join-Path $Path ".editorconfig") -Value $editorconfig -Encoding UTF8
Write-Host "   📄 Created: .editorconfig" -ForegroundColor Green

# Create copilot-instructions.md
$copilotInstructions = @"
# Peony Disassembler - AI Copilot Directives

## Project Overview

**Peony** is a multi-system disassembler framework - the "anti-Poppy" that converts ROM binaries back into source code.

## Coding Standards

### Indentation
- **ALWAYS use TABS** - never spaces
- Tab width: 4 spaces equivalent

### Hexadecimal
- **Always lowercase** for hex values
- Use `$` for addresses in output: `$ff00`
- Use `0x` for C# hex literals: `0xff00`

### C# Style
- **K&R brace style** - opening brace on same line
- .NET 10 / C# 14 features
- File-scoped namespaces
- Nullable reference types enabled

## Architecture

### Core Abstractions
- `ICpuDecoder` - CPU instruction decoding
- `IPlatformAnalyzer` - Platform-specific analysis
- `IOutputFormatter` - Output generation

### Roundtrip Guarantee
**CRITICAL**: All disassembled code MUST reassemble to identical ROMs using Poppy.

## Related Projects
- **Poppy** - Assembler (source → ROM)
- **BPS-Patch** - Binary patching
- **GameInfo** - Game documentation
"@

New-Item -ItemType Directory -Path (Join-Path $Path ".github") -Force | Out-Null
Set-Content -Path (Join-Path $Path ".github/copilot-instructions.md") -Value $copilotInstructions -Encoding UTF8
Write-Host "   📄 Created: .github/copilot-instructions.md" -ForegroundColor Green

Write-Host ""
Write-Host "✅ Peony repository initialized!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. cd $Path"
Write-Host "  2. git init"
Write-Host "  3. git add ."
Write-Host "  4. git commit -m 'Initial Peony framework'"
Write-Host "  5. gh repo create TheAnsarya/peony --public --source=."
Write-Host ""
