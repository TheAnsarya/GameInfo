<#
.SYNOPSIS
	Migrate a project from legacy assembler to Poppy

.DESCRIPTION
	Converts assembly files from Ophis/ca65/ASAR/RGBDS to Poppy syntax
	and creates a new build.config.json file.

.PARAMETER ProjectPath
	Path to the project to migrate

.PARAMETER SourceAssembler
	Source assembler: ophis, ca65, asar, rgbds

.PARAMETER Platform
	Target platform: nes, snes, gb, atari2600, lynx

.PARAMETER DryRun
	Preview changes without modifying files

.EXAMPLE
	.\Migrate-ToPoppy.ps1 -ProjectPath "C:\repos\dw4" -SourceAssembler ophis -Platform nes
#>
param(
	[Parameter(Mandatory=$true)]
	[string]$ProjectPath,

	[Parameter(Mandatory=$true)]
	[ValidateSet("ophis", "ca65", "asar", "rgbds")]
	[string]$SourceAssembler,

	[Parameter(Mandatory=$true)]
	[ValidateSet("nes", "snes", "gb", "gba", "atari2600", "lynx", "genesis")]
	[string]$Platform,

	[switch]$DryRun
)

$ErrorActionPreference = "Stop"

Write-Host "🌸 Poppy Migration Tool" -ForegroundColor Magenta
Write-Host "   Project: $ProjectPath"
Write-Host "   From: $SourceAssembler"
Write-Host "   Platform: $Platform"
if ($DryRun) { Write-Host "   Mode: DRY RUN" -ForegroundColor Yellow }
Write-Host ""

# Define syntax conversions
$conversions = @{
	"ophis" = @{
		patterns = @(
			@{ old = '\.byte\s+'; new = '.db ' },
			@{ old = '\.word\s+'; new = '.dw ' },
			@{ old = '\.advance\s+'; new = '.org ' },
			@{ old = '\.alias\s+(\w+)\s+(.+)'; new = '$1 = $2' },
			@{ old = '\.require\s+"(.+)"'; new = '.include "$1"' },
			@{ old = '\.incbin\s+"(.+)"'; new = '.incbin "$1"' },
			@{ old = '\.text\s+mapping'; new = '; .text mapping (manual)' },
			@{ old = '\.scope'; new = '; .scope start' },
			@{ old = '\.scend'; new = '; .scope end' }
		)
		extension = ".oph"
	}
	"ca65" = @{
		patterns = @(
			@{ old = '\.segment\s+"(\w+)"'; new = '.segment $1' },
			@{ old = '\.res\s+(\d+)'; new = '.ds $1' },
			@{ old = '\.export\s+(\w+)'; new = '.export $1' },
			@{ old = '\.import\s+(\w+)'; new = '.import $1' },
			@{ old = '\.proc\s+(\w+)'; new = '$1:' },
			@{ old = '\.endproc'; new = '; end proc' },
			@{ old = '\.macro\s+(\w+)'; new = '.macro $1' },
			@{ old = '\.endmacro'; new = '.endm' },
			@{ old = '\.local\s+(\w+)'; new = '@@$1' }
		)
		extension = ".s"
	}
	"asar" = @{
		patterns = @(
			@{ old = 'org\s+\$([0-9a-fA-F]+)'; new = '.org $$1' },
			@{ old = 'db\s+'; new = '.db ' },
			@{ old = 'dw\s+'; new = '.dw ' },
			@{ old = 'dl\s+'; new = '.dl ' },
			@{ old = 'incbin\s+'; new = '.incbin ' },
			@{ old = 'incsrc\s+'; new = '.include ' },
			@{ old = '!(\w+)\s*=\s*(.+)'; new = '$1 = $2' },
			@{ old = '%(\w+)\('; new = '$1(' },
			@{ old = 'lorom'; new = '.lorom' },
			@{ old = 'hirom'; new = '.hirom' }
		)
		extension = ".asm"
	}
	"rgbds" = @{
		patterns = @(
			@{ old = 'SECTION\s+"(\w+)",\s*(\w+)'; new = '.segment $1 ; $2' },
			@{ old = 'DB\s+'; new = '.db ' },
			@{ old = 'DW\s+'; new = '.dw ' },
			@{ old = 'DS\s+'; new = '.ds ' },
			@{ old = 'INCBIN\s+'; new = '.incbin ' },
			@{ old = 'INCLUDE\s+'; new = '.include ' },
			@{ old = 'EQU'; new = '=' },
			@{ old = 'MACRO\s+(\w+)'; new = '.macro $1' },
			@{ old = 'ENDM'; new = '.endm' }
		)
		extension = ".asm"
	}
}

$config = $conversions[$SourceAssembler]

# Find source files
$extensions = @("*.asm", "*.s", "*.oph", "*.inc", "*.h")
$sourceFiles = Get-ChildItem -Path $ProjectPath -Include $extensions -Recurse

Write-Host "Found $($sourceFiles.Count) source files" -ForegroundColor Cyan

$convertedCount = 0
foreach ($file in $sourceFiles) {
	$content = Get-Content $file.FullName -Raw
	$originalContent = $content
	$modified = $false

	foreach ($pattern in $config.patterns) {
		$newContent = $content -replace $pattern.old, $pattern.new
		if ($newContent -ne $content) {
			$content = $newContent
			$modified = $true
		}
	}

	# Convert hex to lowercase
	$content = [regex]::Replace($content, '\$([0-9A-Fa-f]+)', { param($m) '$' + $m.Groups[1].Value.ToLower() })

	if ($modified) {
		$convertedCount++
		$relativePath = $file.FullName.Substring($ProjectPath.Length + 1)

		if ($DryRun) {
			Write-Host "   Would convert: $relativePath" -ForegroundColor Yellow
		} else {
			# Create .pasm file
			$newPath = $file.FullName -replace '\.[^.]+$', '.pasm'
			Set-Content -Path $newPath -Value $content -Encoding UTF8
			Write-Host "   Converted: $relativePath → $($newPath.Substring($ProjectPath.Length + 1))" -ForegroundColor Green
		}
	}
}

Write-Host ""
Write-Host "Converted $convertedCount files" -ForegroundColor Cyan

# Create build.config.json
$buildConfig = @{
	'$schema' = "https://gameinfo.example.com/schemas/build-config.json"
	project = @{
		name = (Split-Path $ProjectPath -Leaf)
		platform = $Platform
		version = "1.0.0"
	}
	source = @{
		assembler = "poppy"
		mainFile = "src/main.pasm"
		includes = @("src/", "include/")
	}
	assets = @{
		extractDir = "assets/binary"
		editableDir = "assets/json"
	}
} | ConvertTo-Json -Depth 4

$configPath = Join-Path $ProjectPath "build.config.json"
if ($DryRun) {
	Write-Host "Would create: build.config.json" -ForegroundColor Yellow
} else {
	Set-Content -Path $configPath -Value $buildConfig -Encoding UTF8
	Write-Host "Created: build.config.json" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Migration complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Review converted .pasm files"
Write-Host "  2. Update build.ps1 to use Poppy"
Write-Host "  3. Test build with: poppy build build.config.json"
Write-Host "  4. Verify ROM matches original"
Write-Host ""
