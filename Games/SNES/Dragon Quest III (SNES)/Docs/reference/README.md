# Dragon Quest III ROM Analysis Toolkit

**Comprehensive analysis and editing tools for Dragon Quest III SNES ROM files**

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Tools Reference](#tools-reference)
- [API Documentation](#api-documentation)
- [Examples](#examples)
- [Technical Specifications](#technical-specifications)
- [Development](#development)
- [Contributing](#contributing)

## Overview

The Dragon Quest III ROM Analysis Toolkit is a comprehensive suite of tools for analyzing, understanding, and modifying Dragon Quest III ROM files for the Super Nintendo Entertainment System (SNES). This toolkit provides deep insights into game data structures, graphics, audio, code, and more.

### Key Features

- **Complete ROM Analysis**: Comprehensive analysis of ROM structure, data types, and organization
- **Graphics Analysis**: Detection and extraction of sprites, tiles, palettes, and graphics data
- **Audio Analysis**: BRR sample detection, music sequence analysis, and audio driver identification
- **Game Data Extraction**: Character stats, items, monsters, spells, and location data
- **Disassembly**: Complete 65816 assembly disassembler with 242 opcodes and 23 addressing modes
- **Interactive Browser**: Flask-based web interface for exploring ROM data
- **Advanced Editing**: Safe ROM modification with backup, validation, and rollback capabilities
- **Performance Optimization**: Intelligent caching and memory-mapped file access

### Supported ROM Files

- Dragon Quest III - Soshite Densetsu he... (Japanese)
- Dragon Quest III - English Translation (Patched)

## Installation

### Prerequisites

- Python 3.8 or higher
- Windows, macOS, or Linux
- At least 1GB of available RAM
- ROM file(s) for analysis

### Setup

1. Clone or download the toolkit:
```bash
git clone <repository-url>
cd dq3r-info
```

2. Install dependencies (optional for enhanced features):
```bash
pip install flask numpy pillow psutil
```

3. Place ROM files in the `static/` directory

4. Verify installation:
```python
python tools/analysis/comprehensive_rom_analyzer.py
```

## Quick Start

### Basic ROM Analysis

```python
import sys
sys.path.append('tools/analysis')
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

# Initialize analyzer
analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')

# Analyze ROM structure
bank_info = analyzer.analyze_hirom_banks()
print(f"Found {len(bank_info)} banks")

# Find graphics data
graphics_data = analyzer.find_graphics_data()
print(f"Graphics confidence: {graphics_data['confidence']}")
```

### Game Data Extraction

```python
from dq3_game_data_extractor import DQ3GameDataExtractor

# Extract game data
extractor = DQ3GameDataExtractor('static/Dragon Quest III - english.smc')
characters = extractor.find_character_data()
items = extractor.find_item_data()
monsters = extractor.find_monster_data()

print(f"Found {len(characters)} characters, {len(items)} items, {len(monsters)} monsters")
```

### Interactive Browser

```python
from interactive_rom_browser import InteractiveROMBrowser

# Start web interface
browser = InteractiveROMBrowser('static/Dragon Quest III - english.smc')
browser.run(host='127.0.0.1', port=5000)
# Open http://localhost:5000 in your browser
```

### Safe ROM Editing

```python
from advanced_rom_editor import AdvancedROMEditor

# Initialize editor with automatic backup
editor = AdvancedROMEditor('static/Dragon Quest III - english.smc', '.')

# Make a safe edit
changeset_id = editor.edit_data(0x8000, b'\xFF\xFE', "Test modification")

# Undo if needed
editor.undo()

# Save changes
editor.save_rom('static/Dragon Quest III - modified.smc')
```

## Tools Reference

### Analysis Tools

#### `comprehensive_rom_analyzer.py`
- **Purpose**: Main ROM structure analysis
- **Features**: HiROM bank mapping, entropy analysis, data type detection
- **Key Methods**: `analyze_hirom_banks()`, `find_graphics_data()`, `get_entropy_analysis()`

#### `enhanced_graphics_analyzer.py`
- **Purpose**: Graphics data detection and analysis
- **Features**: Sprite detection, palette analysis, tile format identification
- **Key Methods**: `find_graphics_candidates()`, `analyze_palette_data()`, `detect_tile_format()`

#### `snes_disassembler.py`
- **Purpose**: 65816 assembly code disassembly
- **Features**: Complete instruction set, address mode detection, code flow analysis
- **Key Methods**: `disassemble_range()`, `analyze_code_flow()`, `find_subroutines()`

#### `snes_audio_analyzer.py`
- **Purpose**: SNES audio system analysis
- **Features**: BRR sample detection, music sequence analysis, audio driver identification
- **Key Methods**: `find_brr_samples()`, `analyze_music_sequences()`, `detect_audio_driver()`

#### `dq3_game_data_extractor.py`
- **Purpose**: Game-specific data extraction
- **Features**: Character stats, items, monsters, spells, locations
- **Key Methods**: `find_character_data()`, `find_item_data()`, `find_monster_data()`

### Interface Tools

#### `interactive_rom_browser.py`
- **Purpose**: Web-based ROM exploration interface
- **Features**: Graphics gallery, disassembly viewer, game data browser, hex editor
- **API Endpoints**: `/api/rom/info`, `/api/graphics/gallery`, `/api/disassembly`, `/api/gamedata/*`

### Editing Tools

#### `advanced_rom_editor.py`
- **Purpose**: Safe ROM modification with version control
- **Features**: Change tracking, automatic backups, validation, rollback
- **Key Methods**: `edit_data()`, `undo()`, `redo()`, `save_rom()`, `export_patch()`

### Performance Tools

#### `performance_optimizer.py`
- **Purpose**: Performance optimization and caching
- **Features**: Memory-mapped file access, intelligent caching, background processing
- **Key Methods**: `analyze_region_cached()`, `batch_analyze()`, `get_performance_report()`

## API Documentation

### ComprehensiveROMAnalyzer

```python
class ComprehensiveROMAnalyzer:
    """Main ROM analysis engine"""

    def __init__(self, rom_path: str)
        """Initialize analyzer with ROM file path"""

    def analyze_hirom_banks(self) -> List[Dict[str, Any]]
        """Analyze HiROM bank structure"""
        # Returns list of bank information dictionaries

    def find_graphics_data(self, bank: int = None) -> Dict[str, Any]
        """Find graphics data in ROM"""
        # Returns graphics analysis with confidence scores

    def get_entropy_analysis(self, offset: int, size: int) -> Dict[str, float]
        """Calculate data entropy at offset"""
        # Returns entropy metrics
```

### DQ3GameDataExtractor

```python
class DQ3GameDataExtractor:
    """Dragon Quest III specific data extraction"""

    def find_character_data(self, start_bank: int = 8) -> List[Character]
        """Extract character data structures"""

    def find_item_data(self, start_bank: int = 16) -> List[Item]
        """Extract item data structures"""

    def find_monster_data(self, start_bank: int = 24) -> List[Monster]
        """Extract monster data structures"""
```

### AdvancedROMEditor

```python
class AdvancedROMEditor:
    """Safe ROM editing with change tracking"""

    def edit_data(self, offset: int, new_data: bytes, description: str = "") -> str
        """Edit ROM data with full change tracking"""

    def undo(self) -> bool
        """Undo the last change"""

    def save_rom(self, output_path: str = None, create_backup: bool = True) -> str
        """Save current ROM state to file"""

    def export_patch(self, format: str = "ips", output_path: str = None) -> str
        """Export changes as patch file (IPS/BPS/JSON)"""
```

## Examples

### Example 1: Find All Text Strings

```python
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer
import re

analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')

# Search for text patterns
text_candidates = []
for bank in range(32):
    bank_data = analyzer.read_bank(bank)

    # Look for ASCII text
    text_matches = re.findall(rb'[A-Za-z0-9\s]{8,}', bank_data)
    for match in text_matches:
        try:
            decoded = match.decode('ascii').strip()
            if len(decoded) > 4:
                text_candidates.append({
                    'bank': bank,
                    'text': decoded,
                    'length': len(decoded)
                })
        except:
            continue

print(f"Found {len(text_candidates)} text candidates")
for candidate in text_candidates[:10]:
    print(f"Bank {candidate['bank']}: '{candidate['text']}'")
```

### Example 2: Audio Sample Analysis

```python
from snes_audio_analyzer import SNESAudioAnalyzer

analyzer = SNESAudioAnalyzer('static/Dragon Quest III - english.smc')

# Find BRR samples
samples = analyzer.find_brr_samples()
print(f"Found {len(samples)} BRR samples")

# Analyze each sample
for sample in samples[:5]:
    analysis = analyzer.analyze_brr_sample(sample['offset'], sample['size'])
    print(f"Sample at 0x{sample['offset']:06X}:")
    print(f"  Loop: {analysis['has_loop']}")
    print(f"  Length: {analysis['duration_ms']}ms")
    print(f"  Quality: {analysis['quality_score']}")
```

### Example 3: Graphics Extraction

```python
from enhanced_graphics_analyzer import EnhancedGraphicsAnalyzer

analyzer = EnhancedGraphicsAnalyzer('static/Dragon Quest III - english.smc')

# Find graphics with high confidence
graphics = analyzer.find_graphics_candidates()
high_confidence = [g for g in graphics if g['confidence'] > 0.8]

print(f"Found {len(high_confidence)} high-confidence graphics")

for graphic in high_confidence[:3]:
    print(f"Graphics at 0x{graphic['offset']:06X}:")
    print(f"  Format: {graphic['format']}")
    print(f"  Dimensions: {graphic['width']}x{graphic['height']}")
    print(f"  Colors: {graphic['colors']}")
```

### Example 4: Safe Character Stat Modification

```python
from advanced_rom_editor import AdvancedROMEditor
from dq3_game_data_extractor import DQ3GameDataExtractor

# Initialize tools
editor = AdvancedROMEditor('static/Dragon Quest III - english.smc', '.')
extractor = DQ3GameDataExtractor(editor.get_current_data())

# Find character data
characters = extractor.find_character_data()
hero_data = characters[0]  # Assuming first character is hero

print(f"Hero current HP: {hero_data.hp}")

# Modify hero HP (example: set to 999)
hp_offset = hero_data.offset + 4  # Assuming HP is at offset +4
new_hp = (999).to_bytes(2, 'little')  # 16-bit little-endian

changeset_id = editor.edit_data(hp_offset, new_hp, "Boost hero HP to 999")

# Verify the change
new_data = extractor.find_character_data()
print(f"Hero new HP: {new_data[0].hp}")

# Save with automatic backup
editor.save_rom('static/Dragon Quest III - hero_boosted.smc')
```

## Technical Specifications

### ROM Structure

#### HiROM Memory Map
- Banks $C0-$FF: ROM data (Fast)
- Banks $40-$7F: ROM data (Slow)
- Banks $00-$3F: I/O and ROM mirrors

#### SNES Header Format
- Offset $FFB0-$FFD4: Header information
- Title: 21 bytes ASCII
- Map Mode: $FFB5 (HiROM = $21)
- ROM Size: $FFB7 (log2(size/1024))
- Checksum: $FFDC-$FFDF

#### Graphics Formats
- 2BPP: 2 bits per pixel, 4 colors
- 4BPP: 4 bits per pixel, 16 colors
- 8BPP: 8 bits per pixel, 256 colors
- Tile size: 8x8 pixels

#### Audio System
- SPC700 processor: 2.048MHz
- 64KB audio RAM
- BRR sample format: 9 bytes per block
- 8 voice channels

### Data Structures

#### Character Data (Estimated)
```
Offset  Size  Description
+0      2     Character ID
+2      2     Current HP
+4      2     Maximum HP
+6      2     Current MP
+8      2     Maximum MP
+10     1     Level
+11     1     Experience (low byte)
...
```

#### Item Data (Estimated)
```
Offset  Size  Description
+0      2     Item ID
+2      1     Type (weapon/armor/item)
+3      1     Rarity
+4      2     Buy Price
+6      2     Sell Price
+8      1     Attack Power
+9      1     Defense Power
...
```

### File Formats

#### Supported Input Formats
- `.smc` - Super Nintendo ROM
- `.sfc` - Super Famicom ROM
- `.rom` - Generic ROM file

#### Patch Export Formats
- **IPS**: International Patching System
- **BPS**: Binary Patch System
- **JSON**: Human-readable change format

## Development

### Project Structure

```
dq3r-info/
├── static/                 # ROM files
├── tools/
│   ├── analysis/          # Analysis modules
│   ├── editing/           # Editing tools
│   ├── optimization/      # Performance tools
│   └── web/              # Web interface
├── docs/                  # Documentation
├── examples/              # Usage examples
└── tests/                # Test suite
```

### Coding Standards

- Python 3.8+ compatibility
- Type hints for all functions
- Comprehensive docstrings
- Error handling and logging
- Unit tests for critical functions

### Testing

```python
# Run basic tests
python -m pytest tests/

# Test specific module
python tools/analysis/comprehensive_rom_analyzer.py

# Performance testing
python tools/optimization/performance_optimizer.py
```

### Contributing

1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Submit a pull request

### Performance Considerations

- Use memory-mapped files for large ROMs
- Implement caching for expensive operations
- Profile memory usage for optimization
- Consider background processing for UI responsiveness

## Advanced Usage

### Custom Analysis Scripts

Create custom analysis by extending base classes:

```python
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

class CustomAnalyzer(ComprehensiveROMAnalyzer):
    def find_custom_data(self):
        """Implement custom data detection logic"""
        pass
```

### Batch Processing

Process multiple ROM files:

```python
import glob
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

rom_files = glob.glob('roms/*.smc')
results = {}

for rom_file in rom_files:
    analyzer = ComprehensiveROMAnalyzer(rom_file)
    results[rom_file] = analyzer.analyze_hirom_banks()
```

### Integration with External Tools

Export data for use with other tools:

```python
# Export disassembly for external assembler
disasm = analyzer.disassemble_range(0x8000, 0x1000)
with open('code.asm', 'w') as f:
    for line in disasm:
        f.write(f"{line['address']:04X}: {line['mnemonic']} {line['operand']}\n")
```

---

**Dragon Quest III ROM Analysis Toolkit**
Version 1.0
For support and updates, visit the project repository.
