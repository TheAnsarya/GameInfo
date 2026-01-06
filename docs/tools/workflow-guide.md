# ROM Hacking Workflow Guide

This guide documents standard workflows for ROM hacking projects.

## Overview

ROM hacking involves multiple steps from initial analysis to final patching. This guide covers common workflows and best practices.

## Workflow Types

### 1. Translation Project Workflow

#### Phase 1: Analysis

```
1. Extract text from ROM
   python tools/text_extractor.py game.sfc --output text/

2. Identify text encoding (TBL)
   python tools/tbl_analyzer.py game.sfc --scan

3. Map text pointers
   python tools/pointer_analyzer.py game.sfc --text-bank 0x10

4. Document control codes
   python tools/control_code_finder.py game.sfc --output codes.md
```

#### Phase 2: Font Expansion (if needed)

```
1. Extract existing font
   python tools/font_extractor.py game.sfc --output font.png

2. Create new font (VWF or expanded)
   # Use graphics editor to modify font.png

3. Create font table
   python tools/font_builder.py font.png --output font.bin

4. Insert new font
   python tools/rom_patcher.py game.sfc --insert font.bin --at 0x10000
```

#### Phase 3: Translation

```
1. Create translation workspace
   mkdir translation/
   cp text/script.txt translation/script_en.txt

2. Translate text files
   # Edit translation/script_en.txt

3. Validate text lengths
   python tools/text_validator.py translation/ --max-length 32

4. Re-encode text
   python tools/text_encoder.py translation/ --tbl custom.tbl --output build/
```

#### Phase 4: Insertion

```
1. Build translated ROM
   python tools/rom_builder.py game.sfc --text build/ --output translated.sfc

2. Test in emulator
   # Play through critical scenes

3. Create patch
   python tools/patch_creator.py game.sfc translated.sfc --output patch.ips
```

### 2. Disassembly Project Workflow

#### Phase 1: Setup

```
1. Create project structure
   mkdir -p project/{src,build,roms,docs}

2. Generate initial disassembly
   python tools/disassembler.py game.nes --output src/

3. Create labels from RAM map
   python tools/label_importer.py ram_map.md --output src/labels.asm
```

#### Phase 2: Analysis

```
1. Load CDL data (if available)
   python tools/cdl_analyzer.py trace.cdl --output coverage.md

2. Identify routines
   python tools/routine_finder.py src/main.asm --output routines.md

3. Document data structures
   # Manually analyze and annotate

4. Label code and data
   # Edit src/*.asm to add labels
```

#### Phase 3: Split & Build

```
1. Split ROM into segments
   python tools/rom_splitter.py game.nes --config split.json

2. Create build script
   # Write build.ps1 or Makefile

3. Verify byte-perfect build
   python tools/verify_rom.py --original game.nes --built build/game.nes
```

#### Phase 4: Modification

```
1. Make changes to source
   # Edit src/*.asm

2. Build modified ROM
   ./build.ps1

3. Test changes
   # Emulator testing

4. Document changes
   # Update docs/changes.md
```

### 3. Graphics Hack Workflow

#### Phase 1: Extraction

```
1. Dump all graphics
   python tools/graphics_extractor.py game.sfc --output gfx/

2. Identify tile layouts
   python tools/tilemap_analyzer.py game.sfc --output tilemaps/

3. Extract palettes
   python tools/palette_extractor.py game.sfc --output palettes/
```

#### Phase 2: Editing

```
1. Edit tiles in graphics editor
   # Use Aseprite, GIMP, or Tile Molester

2. Maintain palette constraints
   # NES: 4 colors per palette
   # SNES: 16 colors per palette (typically)

3. Test edits in-game
   # Use emulator with breakpoints
```

#### Phase 3: Insertion

```
1. Convert edited graphics
   python tools/graphics_converter.py edited.png --output tiles.bin

2. Insert into ROM
   python tools/rom_patcher.py game.sfc --insert tiles.bin --at 0x10000

3. Update palette if needed
   python tools/palette_inserter.py game.sfc --palette new.pal --at 0x1000
```

### 4. Gameplay Mod Workflow

#### Phase 1: Research

```
1. Document game mechanics
   # Create mechanics.md

2. Find relevant RAM addresses
   python tools/ram_scanner.py game.nes --value 50 --type hp

3. Trace code execution
   # Use emulator debugger + CDL

4. Identify target routines
   # Document in rom_map.md
```

#### Phase 2: Planning

```
1. Design changes
   # Create design document

2. Estimate space requirements
   # Calculate code/data needs

3. Identify insertion points
   # Find free space or expansion areas

4. Plan compatibility
   # Consider version differences
```

#### Phase 3: Implementation

```
1. Write new code
   # Assembly or compiled code

2. Hook into game
   # JMP/JSR patches

3. Test incrementally
   # Build and test each change

4. Optimize for space
   # Refactor if needed
```

## Project Structure

### Recommended Directory Layout

```
project/
├── build/              # Build output
├── docs/               # Documentation
│   ├── rom-map.md
│   ├── ram-map.md
│   └── changes.md
├── roms/               # Original ROMs (gitignored)
├── src/                # Source files
│   ├── main.asm
│   ├── labels.asm
│   └── data/
├── tools/              # Project-specific tools
├── assets/             # Graphics, text, etc.
│   ├── gfx/
│   ├── text/
│   └── audio/
├── build.ps1           # Build script
├── verify.ps1          # Verification script
└── README.md
```

### Configuration Files

#### build.config.json

```json
{
  "assembler": "cc65",
  "original_rom": "roms/game.nes",
  "output_rom": "build/game.nes",
  "entry_point": "src/main.asm",
  "includes": ["src/labels.asm"],
  "defines": {
    "VERSION": "1.0"
  }
}
```

#### split.json (ROM splitting)

```json
{
  "segments": [
    {"name": "header", "start": 0, "end": 16},
    {"name": "prg0", "start": 16, "end": 16400},
    {"name": "prg1", "start": 16400, "end": 32784},
    {"name": "chr", "start": 32784, "end": 40976}
  ]
}
```

## Quality Assurance

### Testing Checklist

```markdown
## Pre-Release Testing

### Functionality
- [ ] Game boots correctly
- [ ] Title screen displays properly
- [ ] All menus work
- [ ] Gameplay functions correctly
- [ ] Save/Load works (if applicable)
- [ ] All endings reachable

### Compatibility
- [ ] Works in multiple emulators
- [ ] No new glitches introduced
- [ ] Original game features intact
- [ ] Performance acceptable

### Documentation
- [ ] README complete
- [ ] Patch notes written
- [ ] Credits accurate
- [ ] License clear
```

### Automated Testing

```python
# tests/test_rom.py
def test_checksum():
    """Verify ROM checksum is correct."""
    pass

def test_header():
    """Verify ROM header is valid."""
    pass

def test_byte_perfect():
    """Verify unmodified build matches original."""
    pass

def test_text_encoding():
    """Verify all text encodes correctly."""
    pass
```

## Version Control

### Git Best Practices

```bash
# Initial commit
git add .
git commit -m "feat: initial project setup"

# Feature branch
git checkout -b feature/translation-ch1

# Regular commits
git commit -m "feat: translate chapter 1 dialogue"
git commit -m "fix: text overflow in battle menu"

# Merge
git checkout main
git merge feature/translation-ch1
```

### What to Track

**Include:**
- Source code (`.asm`, `.s`, `.py`)
- Configuration files
- Documentation
- Tools/scripts
- Assets (if small/generated)

**Exclude:**
- Original ROMs
- Built ROMs
- Large binary assets
- Personal notes

## Collaboration

### Multi-Person Projects

```
1. Use branches for features
2. Pull request for review
3. Maintain changelog
4. Document conventions
5. Use issue tracking
```

### Division of Work

```
Translator 1: Chapters 1-5
Translator 2: Chapters 6-10
Graphics: All sprites
Testing: All testers
```

## Common Pitfalls

### Avoid These Mistakes

1. **No backups** - Always keep original ROM safe
2. **No version control** - Use Git from day 1
3. **No documentation** - Document as you go
4. **No testing** - Test every change
5. **Hardcoded offsets** - Use labels/symbols
6. **Ignoring edge cases** - Test boundary conditions

## See Also

- [Testing Procedures](testing-procedures.md)
- [Disassembly Guide](disassembly-guide.md)
- [Text Tools](text-tools.md)
- [Graphics Tools](graphics-tools.md)
