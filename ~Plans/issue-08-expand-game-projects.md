---
name: Feature - Expand Game Project Structure
about: Create project folders for 10+ tested Atari 2600 ROMs
title: 'Add game project structure for major Atari 2600 titles'
labels: feature, atari2600, organization, high-priority
assignees: ''
milestone: 'Milestone 2: Multi-Game Support'
---

## Overview

Expand the `GameInfo/Atari2600/` directory structure with individual game projects following the pattern established by Adventure (PAL).

## Directory Structure Pattern

```
Atari2600/
├── <Game Title> (<Year>) (<Publisher>) [<Region>]/
│   ├── README.md          # ROM info, build instructions, status
│   ├── source/            # Disassembled .pasm source code
│   ├── assets/            # Extracted graphics, audio, data
│   ├── builds/            # Assembled .a26 ROMs
│   ├── wiki/              # DarkRepos wikitext documentation
│   └── docs/              # Game-specific technical docs
```

## Games to Add (Priority Order)

### Tier 1: Well-Known Classics (4KB ROMs)

1. **Combat (1977) (Atari) [NTSC]**
   - 2KB ROM, simplest example
   - No bank switching
   - Good starter project

2. **Space Invaders (1980) (Atari) [NTSC]**
   - 4KB ROM
   - Highly documented
   - Popular ROM hack target

3. **Pac-Man (1982) (Atari) [NTSC]**
   - 4KB ROM
   - Notorious for poor quality
   - Interesting for analysis

4. **E.T. (1982) (Atari) [NTSC]**
   - 8KB F8 bank switching
   - Infamous game
   - Historical significance

### Tier 2: Technical Examples (8KB+ ROMs)

5. **Ms. Pac-Man (1983) (Atari) [NTSC]**
   - 16KB F6 bank switching
   - High quality port
   - Complex graphics

6. **Donkey Kong (1982) (Coleco) [NTSC]**
   - 8KB F8 bank switching
   - Good example of arcade port

7. **Yars' Revenge (1982) (Atari) [NTSC]**
   - 8KB F8 bank switching
   - Creative gameplay
   - Unique graphics

### Tier 3: Technical Challenges (Special Hardware)

8. **Pitfall! (1982) (Activision) [NTSC]**
   - 4KB ROM
   - Excellent code optimization example

9. **Pitfall II (1984) (Activision) [NTSC]**
   - 10KB DPC chip
   - Custom audio/graphics hardware
   - Tests DPC mapper support

10. **Asteroids (1981) (Atari) [NTSC]**
    - 8KB F8 bank switching
    - Vector-style graphics

11. **Missile Command (1981) (Atari) [NTSC]**
    - 8KB F8 bank switching
    - Trackball support

## Tasks for Each Game

### 1. Create Directory Structure

```bash
mkdir "Atari2600/<Game Title> (<Year>) (<Publisher>) [<Region>]"
mkdir "Atari2600/<Game>/source"
mkdir "Atari2600/<Game>/assets"
mkdir "Atari2600/<Game>/builds"
mkdir "Atari2600/<Game>/wiki"
mkdir "Atari2600/<Game>/docs"
```

### 2. Disassemble ROM

```bash
peony disasm "~roms/Good2600 v3.14/<ROM File>.a26" -o "Atari2600/<Game>/source/<game>.pasm"
```

### 3. Create README.md

Template:
```markdown
# <Game Title> (<Year>) (<Publisher>) [<Region>]

<Brief description>

## ROM Information
- **Platform**: Atari 2600
- **Size**: <size>KB (<bytes> bytes)
- **Mapper**: <mapper>
- **Region**: <region>
- **Release**: <year>
- **Publisher**: <publisher>

## Disassembly
- **Source**: source/<game>.pasm - <lines> lines, <blocks> blocks
- **Format**: Poppy assembly (.pasm)
- **System Directive**: .system:atari2600

## Build Pipeline
```bash
poppy build source/<game>.pasm -o builds/<game>.a26
peony verify "~roms/Good2600 v3.14/<ROM>.a26" --reassembled builds/<game>.a26
```

## Status
- [x] Disassembly complete
- [ ] Poppy assembly support
- [ ] Roundtrip verification
- [ ] Asset extraction

## Notes
<Game-specific notes>
```

### 4. Extract Assets (When Tools Ready)

- Graphics: Sprites, playfields, colors
- Audio: Sound effects, music
- Data: Levels, enemy patterns, scores

### 5. Generate Wiki Content (Future)

DarkRepos wikitext for games.darkrepos.com

## Acceptance Criteria

- [ ] 11 game project directories created
- [ ] Each has complete subdirectory structure
- [ ] Each has README.md with ROM info
- [ ] All ROMs disassembled to source/<game>.pasm
- [ ] Disassembly statistics documented (lines, blocks)
- [ ] No empty directories (add .gitkeep if needed)

## Automation Script

Create `scripts/create-game-project.ps1`:

```powershell
param(
	[Parameter(Mandatory=$true)]
	[string]$RomPath,
	
	[Parameter(Mandatory=$true)]
	[string]$GameTitle,
	
	[Parameter(Mandatory=$true)]
	[string]$Year,
	
	[Parameter(Mandatory=$true)]
	[string]$Publisher,
	
	[Parameter(Mandatory=$true)]
	[ValidateSet('NTSC', 'PAL', 'SECAM')]
	[string]$Region
)

$projectName = "$GameTitle ($Year) ($Publisher) [$Region]"
$basePath = "Atari2600/$projectName"

# Create directories
New-Item -ItemType Directory -Path "$basePath/source" -Force
New-Item -ItemType Directory -Path "$basePath/assets" -Force
New-Item -ItemType Directory -Path "$basePath/builds" -Force
New-Item -ItemType Directory -Path "$basePath/wiki" -Force
New-Item -ItemType Directory -Path "$basePath/docs" -Force

# Disassemble ROM
peony disasm $RomPath -o "$basePath/source/$($GameTitle.ToLower()).pasm"

# Generate README (template substitution)
# ...

Write-Host "Created project: $projectName"
```

## Related

- Adventure (PAL) - existing example
- Issue #9: Game Projects Section (documentation)
- Peony Issues: DPC mapper, multi-bank (needed for some games)

## Priority

**High** - Demonstrates GameInfo organization, provides test cases for roundtrip

## Timeline

- **Week 1**: Tier 1 games (4 games)
- **Week 2**: Tier 2 games (3 games)
- **Week 3**: Tier 3 games (4 games)
- **Week 4**: Polish, automation script
