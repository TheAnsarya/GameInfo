<#
.SYNOPSIS
	Batch disassemble Atari 2600 ROMs using Peony

.DESCRIPTION
	Disassembles multiple Atari 2600 ROMs from the Good2600 collection
	and creates project structures for each.

.PARAMETER RomDirectory
	Directory containing Atari 2600 ROMs

.PARAMETER OutputDirectory
	Directory to create disassembly projects

.PARAMETER GameList
	Path to text file with game names (one per line) or 'all' for all ROMs

.PARAMETER MaxGames
	Maximum number of games to process (default: 40)

.EXAMPLE
	.\Batch-Disassemble-Atari2600.ps1 -GameList ".\tier1-games.txt"
	.\Batch-Disassemble-Atari2600.ps1 -MaxGames 10
#>
param(
	[string]$RomDirectory = "C:\Users\me\source\repos\GameInfo\~roms\Good2600 v3.14",
	[string]$OutputDirectory = "C:\Users\me\source\repos\GameInfo\Games\Atari2600",
	[string]$GameList = "",
	[int]$MaxGames = 40
)

$ErrorActionPreference = "Stop"

Write-Host "🎮 Atari 2600 Batch Disassembly" -ForegroundColor Magenta
Write-Host "   ROM Source: $RomDirectory"
Write-Host "   Output: $OutputDirectory"
Write-Host ""

# Tier 1 games (must-haves)
$tier1Games = @(
	"Adventure (1979) (Atari)",
	"Asteroids (1981) (Atari)",
	"Combat (1977) (Atari)",
	"Pitfall! (1982) (Activision)",
	"Space Invaders (1980) (Atari)",
	"Pac-Man (1981) (Atari)",
	"Missile Command (1981) (Atari)",
	"Frogger (1982) (Parker Bros)",
	"River Raid (1982) (Activision)",
	"Breakout (1978) (Atari)"
)

# Tier 2 games (important)
$tier2Games = @(
	"Yars' Revenge (1982) (Atari)",
	"Defender (1981) (Atari)",
	"Centipede (1982) (Atari)",
	"Kaboom! (1981) (Activision)",
	"Enduro (1983) (Activision)",
	"H.E.R.O. (1984) (Activision)",
	"Demon Attack (1982) (Imagic)",
	"Berzerk (1982) (Atari)",
	"Atlantis (1982) (Imagic)",
	"Chopper Command (1982) (Activision)"
)

# Tier 3 games (additional)
$tier3Games = @(
	"Freeway (1981) (Activision)",
	"Keystone Kapers (1983) (Activision)",
	"Stampede (1981) (Activision)",
	"Skiing (1980) (Activision)",
	"Fishing Derby (1980) (Activision)",
	"Boxing (1980) (Activision)",
	"Tennis (1981) (Activision)",
	"Ice Hockey (1981) (Activision)",
	"Barnstorming (1982) (Activision)",
	"Laser Blast (1981) (Activision)",
	"E.T. - The Extra-Terrestrial (1982) (Atari)",
	"Haunted House (1981) (Atari)",
	"Warlords (1981) (Atari)",
	"Night Driver (1978) (Atari)",
	"Outlaw (1978) (Atari)",
	"Surround (1977) (Atari)",
	"Video Olympics (1977) (Atari)",
	"Star Ship (1977) (Atari)",
	"Basic Math (1977) (Atari)",
	"Air-Sea Battle (1977) (Atari)"
)

# Determine which games to process
$gamesToProcess = @()
if ($GameList -and (Test-Path $GameList)) {
	$gamesToProcess = Get-Content $GameList | Where-Object { $_ -match '\S' }
	Write-Host "Loading games from: $GameList" -ForegroundColor Cyan
} else {
	$gamesToProcess = $tier1Games + $tier2Games + $tier3Games
	Write-Host "Using default game list (all tiers)" -ForegroundColor Cyan
}

if ($MaxGames -gt 0 -and $gamesToProcess.Count -gt $MaxGames) {
	$gamesToProcess = $gamesToProcess[0..($MaxGames-1)]
	Write-Host "Limited to $MaxGames games" -ForegroundColor Yellow
}

Write-Host "Processing $($gamesToProcess.Count) games" -ForegroundColor Cyan
Write-Host ""

# Find matching ROMs
$allRoms = Get-ChildItem -Path $RomDirectory -Filter "*.a26" -Recurse

$processedCount = 0
$errors = @()

foreach ($gameName in $gamesToProcess) {
	# Find matching ROM (prioritize [!] verified dumps)
	$matchPattern = $gameName -replace '\s+', '*'
	$matchingRoms = $allRoms | Where-Object { $_.Name -like "*$matchPattern*" }

	$rom = $matchingRoms | Where-Object { $_.Name -match '\[!\]' } | Select-Object -First 1
	if (-not $rom) {
		$rom = $matchingRoms | Select-Object -First 1
	}

	if (-not $rom) {
		$errors += "ROM not found: $gameName"
		Write-Host "   ❌ Not found: $gameName" -ForegroundColor Red
		continue
	}

	# Create output directory
	$safeName = $gameName -replace '[^\w\s-]', '' -replace '\s+', '-'
	$gameDir = Join-Path $OutputDirectory $safeName

	if (-not (Test-Path $gameDir)) {
		New-Item -ItemType Directory -Path $gameDir -Force | Out-Null
	}

	# Determine ROM size and banking
	$romSize = (Get-Item $rom.FullName).Length
	$banking = switch ($romSize) {
		2048  { "none" }
		4096  { "none" }
		8192  { "F8" }
		16384 { "F6" }
		32768 { "F4" }
		default { "unknown" }
	}

	Write-Host "   Processing: $($rom.Name)" -ForegroundColor Cyan
	Write-Host "      Size: $romSize bytes, Banking: $banking" -ForegroundColor DarkGray

	# Create project structure
	$srcDir = Join-Path $gameDir "src"
	$docsDir = Join-Path $gameDir "docs"
	New-Item -ItemType Directory -Path $srcDir -Force | Out-Null
	New-Item -ItemType Directory -Path $docsDir -Force | Out-Null

	# Copy ROM to project
	Copy-Item $rom.FullName (Join-Path $gameDir "original.a26") -Force

	# Create build.config.json
	$buildConfig = @{
		'$schema' = "https://gameinfo.example.com/schemas/build-config.json"
		project = @{
			name = $gameName
			platform = "atari2600"
			version = "1.0.0"
		}
		source = @{
			baseRom = "original.a26"
			assembler = "poppy"
			mainFile = "src/main.pasm"
			outputRom = "build/$safeName.a26"
		}
		disassembly = @{
			tool = "peony"
			banking = $banking
			verified = $false
		}
	} | ConvertTo-Json -Depth 4

	Set-Content -Path (Join-Path $gameDir "build.config.json") -Value $buildConfig -Encoding UTF8

	# Create placeholder main.pasm
	$mainAsm = @"
; $gameName
; Atari 2600 Disassembly
; Generated by Peony
; Verify with: poppy build build.config.json
;
; ROM: $($rom.Name)
; Size: $romSize bytes
; Banking: $banking

	.platform atari2600
	.include "constants.pasm"

; ============================================================================
; RAM Variables ($80-$FF)
; ============================================================================
	.segment "RAM"
	.org `$80

; TODO: Define RAM variables

; ============================================================================
; ROM Code
; ============================================================================
	.segment "CODE"
	.org `$f000

; TODO: Disassemble with Peony
; peony disasm original.a26 -o src/

; ============================================================================
; Vectors
; ============================================================================
	.segment "VECTORS"
	.org `$fffa

NMI_Vector:
	.dw NMI        ; `$fffa - NMI (not used on 2600)
Reset_Vector:
	.dw Reset      ; `$fffc - Reset
IRQ_Vector:
	.dw IRQ        ; `$fffe - IRQ/BRK (not used on 2600)
"@

	Set-Content -Path (Join-Path $srcDir "main.pasm") -Value $mainAsm -Encoding UTF8

	# Create constants file
	$constants = Get-Content -Path "$PSScriptRoot\..\ATARI-2600-DISASSEMBLY.md" -Raw
	# Extract constants section (simplified - would need parsing in real implementation)
	$constantsAsm = @"
; Atari 2600 Hardware Constants
; TIA Registers and RIOT Definitions

	.platform atari2600

; ============================================================================
; TIA Write Registers (`$00-`$2C)
; ============================================================================

VSYNC   = `$00    ; Vertical Sync
VBLANK  = `$01    ; Vertical Blank
WSYNC   = `$02    ; Wait for Sync
RSYNC   = `$03    ; Reset Sync
NUSIZ0  = `$04    ; Number/Size Player 0
NUSIZ1  = `$05    ; Number/Size Player 1
COLUP0  = `$06    ; Color Player 0
COLUP1  = `$07    ; Color Player 1
COLUPF  = `$08    ; Color Playfield
COLUBK  = `$09    ; Color Background
CTRLPF  = `$0a    ; Control Playfield
REFP0   = `$0b    ; Reflect Player 0
REFP1   = `$0c    ; Reflect Player 1
PF0     = `$0d    ; Playfield 0
PF1     = `$0e    ; Playfield 1
PF2     = `$0f    ; Playfield 2
RESP0   = `$10    ; Reset Player 0
RESP1   = `$11    ; Reset Player 1
RESM0   = `$12    ; Reset Missile 0
RESM1   = `$13    ; Reset Missile 1
RESBL   = `$14    ; Reset Ball
AUDC0   = `$15    ; Audio Control 0
AUDC1   = `$16    ; Audio Control 1
AUDF0   = `$17    ; Audio Frequency 0
AUDF1   = `$18    ; Audio Frequency 1
AUDV0   = `$19    ; Audio Volume 0
AUDV1   = `$1a    ; Audio Volume 1
GRP0    = `$1b    ; Graphics Player 0
GRP1    = `$1c    ; Graphics Player 1
ENAM0   = `$1d    ; Enable Missile 0
ENAM1   = `$1e    ; Enable Missile 1
ENABL   = `$1f    ; Enable Ball
HMP0    = `$20    ; Horizontal Motion Player 0
HMP1    = `$21    ; Horizontal Motion Player 1
HMM0    = `$22    ; Horizontal Motion Missile 0
HMM1    = `$23    ; Horizontal Motion Missile 1
HMBL    = `$24    ; Horizontal Motion Ball
VDELP0  = `$25    ; Vertical Delay Player 0
VDELP1  = `$26    ; Vertical Delay Player 1
VDELBL  = `$27    ; Vertical Delay Ball
RESMP0  = `$28    ; Reset Missile 0 to Player 0
RESMP1  = `$29    ; Reset Missile 1 to Player 1
HMOVE   = `$2a    ; Apply Horizontal Motion
HMCLR   = `$2b    ; Clear Horizontal Move Registers
CXCLR   = `$2c    ; Clear Collision Latches

; ============================================================================
; TIA Read Registers (`$00-`$0D)
; ============================================================================

CXM0P   = `$00    ; Collision M0-P1, M0-P0
CXM1P   = `$01    ; Collision M1-P0, M1-P1
CXP0FB  = `$02    ; Collision P0-PF, P0-BL
CXP1FB  = `$03    ; Collision P1-PF, P1-BL
CXM0FB  = `$04    ; Collision M0-PF, M0-BL
CXM1FB  = `$05    ; Collision M1-PF, M1-BL
CXBLPF  = `$06    ; Collision BL-PF
CXPPMM  = `$07    ; Collision P0-P1, M0-M1
INPT0   = `$08    ; Paddle 0 Input
INPT1   = `$09    ; Paddle 1 Input
INPT2   = `$0a    ; Paddle 2 Input
INPT3   = `$0b    ; Paddle 3 Input
INPT4   = `$0c    ; Joystick 0 Trigger
INPT5   = `$0d    ; Joystick 1 Trigger

; ============================================================================
; RIOT Registers (`$280-`$297)
; ============================================================================

SWCHA   = `$0280  ; Port A - Joystick Data
SWACNT  = `$0281  ; Port A DDR
SWCHB   = `$0282  ; Port B - Console Switches
SWBCNT  = `$0283  ; Port B DDR
INTIM   = `$0284  ; Timer Output
TIMINT  = `$0285  ; Timer Interrupt

TIM1T   = `$0294  ; Set 1-clock Timer
TIM8T   = `$0295  ; Set 8-clock Timer
TIM64T  = `$0296  ; Set 64-clock Timer
T1024T  = `$0297  ; Set 1024-clock Timer
"@

	Set-Content -Path (Join-Path $srcDir "constants.pasm") -Value $constantsAsm -Encoding UTF8

	# Create README
	$readme = @"
# $gameName

Atari 2600 Disassembly

## Status

- [ ] Initial disassembly
- [ ] Labels identified
- [ ] RAM variables documented
- [ ] Subroutines documented
- [ ] Roundtrip verified
- [ ] Wiki page created

## ROM Information

| Property | Value |
|----------|-------|
| File | $($rom.Name) |
| Size | $romSize bytes |
| Banking | $banking |

## Building

``````bash
poppy build build.config.json
``````

## Verification

``````bash
peony verify --original original.a26 --built build/$safeName.a26
``````
"@

	Set-Content -Path (Join-Path $gameDir "README.md") -Value $readme -Encoding UTF8

	$processedCount++
	Write-Host "   ✅ Created: $safeName" -ForegroundColor Green
}

Write-Host ""
Write-Host "=" * 60
Write-Host "Summary" -ForegroundColor Cyan
Write-Host "=" * 60
Write-Host "   Processed: $processedCount games"
Write-Host "   Errors: $($errors.Count)"

if ($errors.Count -gt 0) {
	Write-Host ""
	Write-Host "Errors:" -ForegroundColor Red
	foreach ($error in $errors) {
		Write-Host "   - $error" -ForegroundColor Red
	}
}

Write-Host ""
Write-Host "✅ Batch processing complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Run Peony on each project to generate full disassembly"
Write-Host "  2. Add labels and comments"
Write-Host "  3. Verify roundtrip with Poppy"
Write-Host "  4. Create wiki pages"
Write-Host ""
