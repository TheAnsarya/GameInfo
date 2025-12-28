# Getting Started with Dragon Quest III ROM Analysis Toolkit

This guide will help you set up and start using the Dragon Quest III ROM Analysis Toolkit to analyze, explore, and modify Dragon Quest III ROM files.

## Prerequisites

Before you begin, ensure you have:

- **Python 3.8 or higher** installed on your system
- **Dragon Quest III ROM file(s)** - Supported formats:
  - Dragon Quest III - Soshite Densetsu he... (Japanese original)
  - Dragon Quest III - English Translation (patched)
  - File formats: `.smc`, `.sfc`, `.rom`
- **At least 1GB of RAM** for analysis operations
- **Basic familiarity with Python** (helpful but not required for basic usage)

## Installation

### Step 1: Download the Toolkit

```bash
# Clone the repository (if using Git)
git clone <repository-url>
cd dq3r-info

# Or download and extract the ZIP file
```

### Step 2: Set Up Your Environment

The toolkit works with base Python, but some features benefit from additional packages:

```bash
# Optional: Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install optional dependencies for enhanced features
pip install flask numpy pillow psutil
```

### Step 3: Prepare Your ROM Files

1. Create a `static` directory in the project root (if it doesn't exist)
2. Copy your Dragon Quest III ROM files to the `static` directory
3. Supported filenames:
   - `Dragon Quest III - Soshite Densetsu he... (J).smc`
   - `Dragon Quest III - english (patched).smc`
   - `Dragon Quest III - english.smc`

```
dq3r-info/
├── static/
│   ├── Dragon Quest III - english.smc
│   └── Dragon Quest III - Soshite Densetsu he... (J).smc
├── tools/
└── docs/
```

## Your First Analysis

### Quick Test

Let's start with a simple test to ensure everything is working:

```python
# test_setup.py
import sys
sys.path.append('tools/analysis')

try:
    from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

    # Test with your ROM file
    rom_path = 'static/Dragon Quest III - english.smc'
    analyzer = ComprehensiveROMAnalyzer(rom_path)

    print("✅ ROM loaded successfully!")
    print(f"ROM size: {len(analyzer.load_rom_data()):,} bytes")
    print("Setup complete - ready for analysis!")

except FileNotFoundError:
    print("❌ ROM file not found. Please check the file path.")
except Exception as e:
    print(f"❌ Error: {e}")
```

Save this as `test_setup.py` in the project root and run:

```bash
python test_setup.py
```

### Basic ROM Analysis

Once setup is verified, try your first analysis:

```python
# first_analysis.py
import sys
sys.path.append('tools/analysis')
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

# Initialize analyzer
analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')

# Analyze ROM structure
print("Analyzing ROM structure...")
banks = analyzer.analyze_hirom_banks()

print(f"\n📊 Found {len(banks)} banks:")
for i, bank in enumerate(banks[:5]):  # Show first 5 banks
    print(f"  Bank {bank['bank']:2d}: {bank['data_type']:12s} (entropy: {bank['entropy']:.3f})")

print("...")

# Find graphics data
print("\n🎨 Looking for graphics data...")
graphics = analyzer.find_graphics_data()
print(f"Graphics confidence: {graphics['confidence']:.3f}")
print(f"Candidates found: {graphics['total_found']}")
```

Expected output:
```
Analyzing ROM structure...

📊 Found 64 banks:
  Bank  0: code         (entropy: 0.745)
  Bank  1: mixed        (entropy: 0.823)
  Bank  2: graphics     (entropy: 0.891)
  Bank  3: graphics     (entropy: 0.945)
  Bank  4: data         (entropy: 0.672)
...

🎨 Looking for graphics data...
Graphics confidence: 0.884
Candidates found: 42
```

## Core Features Walkthrough

### 1. Game Data Extraction

Extract character, item, and monster data:

```python
# game_data_demo.py
import sys
sys.path.append('tools/analysis')
from dq3_game_data_extractor import DQ3GameDataExtractor

extractor = DQ3GameDataExtractor('static/Dragon Quest III - english.smc')

# Find characters
print("🧙 Extracting character data...")
characters = extractor.find_character_data()
print(f"Found {len(characters)} characters")

for char in characters[:3]:  # Show first 3
    print(f"  Character {char.character_id}: HP={char.hp}, MP={char.mp}, Level={char.level}")

# Find items
print("\n⚔️  Extracting item data...")
items = extractor.find_item_data()
print(f"Found {len(items)} items")

for item in items[:3]:  # Show first 3
    print(f"  Item {item.item_id}: {item.type}, Buy=${item.buy_price}, Sell=${item.sell_price}")

# Find monsters
print("\n👹 Extracting monster data...")
monsters = extractor.find_monster_data()
print(f"Found {len(monsters)} monsters")

for monster in monsters[:3]:  # Show first 3
    print(f"  Monster {monster.monster_id}: HP={monster.hp}, ATK={monster.attack}, EXP={monster.exp_reward}")
```

### 2. Audio Analysis

Analyze SNES audio data:

```python
# audio_demo.py
import sys
sys.path.append('tools/analysis')
from snes_audio_analyzer import SNESAudioAnalyzer

analyzer = SNESAudioAnalyzer('static/Dragon Quest III - english.smc')

# Find audio samples
print("🎵 Searching for BRR audio samples...")
samples = analyzer.find_brr_samples()
print(f"Found {len(samples)} audio samples")

# Analyze first few samples
for sample in samples[:5]:
    print(f"  Sample at 0x{sample['offset']:06X}: {sample['size']} bytes, Loop: {sample['has_loop']}")

# Detect audio driver
print("\n🎼 Detecting audio driver...")
driver = analyzer.detect_audio_driver()
print(f"Audio driver type: {driver['type']}")
if driver.get('features'):
    print(f"Features: {', '.join(driver['features'])}")
```

### 3. Code Disassembly

Disassemble 65816 assembly code:

```python
# disasm_demo.py
import sys
sys.path.append('tools/analysis')
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer
from snes_disassembler import SNESDisassembler

# Load ROM and find code
analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')
rom_data = analyzer.load_rom_data()

# Initialize disassembler
disasm = SNESDisassembler()

# Disassemble reset vector area
print("💻 Disassembling reset vector code...")
start_offset = 0x8000  # Common code location
instructions = disasm.disassemble_range(rom_data, start_offset, 64)

print(f"Disassembly at 0x{start_offset:04X}:")
for inst in instructions[:10]:  # Show first 10 instructions
    print(f"  {inst['address']:04X}: {inst['bytes']:12s} {inst['mnemonic']:4s} {inst['operand']}")
```

### 4. Interactive Web Browser

Launch the web interface for visual exploration:

```python
# web_browser.py
import sys
sys.path.append('tools/web')
from interactive_rom_browser import InteractiveROMBrowser

# Initialize browser
browser = InteractiveROMBrowser('static/Dragon Quest III - english.smc')

print("🌐 Starting ROM browser...")
print("Open your web browser and go to: http://localhost:5000")
print("Press Ctrl+C to stop the server")

# Start web server
browser.run(debug=False)
```

Open your web browser and navigate to `http://localhost:5000` to explore:
- Graphics gallery with visual previews
- Interactive hex viewer
- Disassembly browser
- Game data tables
- Audio sample player (if browser supports it)

### 5. Safe ROM Editing

Make safe modifications to ROM data:

```python
# editing_demo.py
import sys
sys.path.append('tools/editing')
from advanced_rom_editor import AdvancedROMEditor

# Initialize editor (creates automatic backup)
editor = AdvancedROMEditor('static/Dragon Quest III - english.smc', '.')

print("📝 ROM editor initialized with automatic backup")

# Make a small test edit
original_data = editor.get_current_data()[0x8000:0x8004]
print(f"Original data at 0x8000: {original_data.hex().upper()}")

# Edit some bytes (just for demonstration)
new_data = b'\xFF\xFE\xFD\xFC'
changeset_id = editor.edit_data(0x8000, new_data, "Test modification")
print(f"Applied changeset: {changeset_id}")

# Verify the change
modified_data = editor.get_current_data()[0x8000:0x8004]
print(f"Modified data: {modified_data.hex().upper()}")

# Undo the change
editor.undo()
restored_data = editor.get_current_data()[0x8000:0x8004]
print(f"Restored data: {restored_data.hex().upper()}")

print("✅ Edit/undo cycle completed successfully")

# Get change summary
summary = editor.get_change_summary()
print(f"Change history: {summary['total_changesets']} changesets")
```

## Working with Multiple ROM Versions

The toolkit can work with multiple ROM versions. Here's how to compare them:

```python
# compare_roms.py
import sys
sys.path.append('tools/analysis')
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

# Analyze different ROM versions
roms = [
    'static/Dragon Quest III - Soshite Densetsu he... (J).smc',
    'static/Dragon Quest III - english.smc'
]

results = {}

for rom_path in roms:
    try:
        analyzer = ComprehensiveROMAnalyzer(rom_path)
        rom_data = analyzer.load_rom_data()

        results[rom_path] = {
            'size': len(rom_data),
            'banks': len(analyzer.analyze_hirom_banks())
        }

        print(f"✅ {rom_path}")
        print(f"   Size: {results[rom_path]['size']:,} bytes")
        print(f"   Banks analyzed: {results[rom_path]['banks']}")

    except FileNotFoundError:
        print(f"❌ {rom_path} - File not found")
    except Exception as e:
        print(f"❌ {rom_path} - Error: {e}")
```

## Performance Optimization

For large ROM files or intensive analysis, use the performance optimizer:

```python
# optimized_analysis.py
import sys
sys.path.append('tools/optimization')
from performance_optimizer import OptimizedROMAnalyzer

# Initialize with caching (256MB cache)
analyzer = OptimizedROMAnalyzer('.', cache_size_mb=256)

print("🚀 Running optimized analysis...")

# Analyze multiple regions with caching
regions = [(0x8000 + i * 1024, 512) for i in range(20)]
results = analyzer.batch_analyze(regions, "entropy")

print(f"Analyzed {len(results)} regions with caching")

# Get performance report
report = analyzer.get_performance_report()
print(f"Cache hits: {report['cache_stats']['total_accesses']}")
print(f"Memory usage: {report['cache_stats']['memory_usage_mb']:.1f}MB")

analyzer.cleanup()
```

## Common Tasks

### Extract All Text Strings

```python
import re
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')
rom_data = analyzer.load_rom_data()

# Search for ASCII text
text_pattern = rb'[A-Za-z0-9 ]{4,}'
texts = re.findall(text_pattern, rom_data)

print(f"Found {len(texts)} text strings:")
for text in texts[:10]:
    try:
        decoded = text.decode('ascii').strip()
        if len(decoded) > 3:
            print(f"  '{decoded}'")
    except:
        pass
```

### Find Graphics by Entropy

```python
from comprehensive_rom_analyzer import ComprehensiveROMAnalyzer

analyzer = ComprehensiveROMAnalyzer('static/Dragon Quest III - english.smc')

# Look for regions with high entropy (likely graphics/compressed data)
print("🎨 Searching for high-entropy regions (graphics)...")

high_entropy_regions = []
for offset in range(0, 0x200000, 0x1000):  # Check every 4KB
    entropy = analyzer.get_entropy_analysis(offset, 0x1000)
    if entropy['normalized'] > 0.85:  # High entropy threshold
        high_entropy_regions.append((offset, entropy['normalized']))

print(f"Found {len(high_entropy_regions)} high-entropy regions:")
for offset, entropy in high_entropy_regions[:10]:
    print(f"  0x{offset:06X}: {entropy:.3f}")
```

## Troubleshooting

### Common Issues

**1. "ROM file not found"**
- Check that ROM files are in the `static/` directory
- Verify file names match exactly (case-sensitive on Linux/macOS)
- Ensure files have correct extensions (`.smc`, `.sfc`, `.rom`)

**2. "Module not found" errors**
- Ensure you're running from the project root directory
- Check that `sys.path.append()` paths are correct
- Verify Python can find the tools directories

**3. Memory errors with large ROMs**
- Use the performance optimizer for large files
- Increase cache size if you have available RAM
- Process ROM in smaller chunks

**4. Web browser doesn't start**
- Check if port 5000 is already in use
- Try a different port: `browser.run(host='127.0.0.1', port=8080)`
- Install Flask if you get import errors: `pip install flask`

### Getting Help

1. Check the [API Reference](API_REFERENCE.md) for detailed function documentation
2. Look at example scripts in the `examples/` directory
3. Enable debug logging:
   ```python
   import logging
   logging.basicConfig(level=logging.DEBUG)
   ```

## Next Steps

Once you're comfortable with the basics:

1. **Explore the Web Interface**: Use the interactive browser to visually explore ROM data
2. **Try Advanced Editing**: Use the ROM editor to make safe modifications
3. **Write Custom Scripts**: Combine tools to create custom analysis workflows
4. **Performance Tuning**: Use the optimizer for faster analysis of large datasets
5. **Study the Code**: Look at the source code to understand how analysis works

### Example Workflow: Character Stat Modification

Here's a complete workflow for safely modifying character stats:

```python
# character_mod_workflow.py
import sys
sys.path.append('tools/analysis')
sys.path.append('tools/editing')

from dq3_game_data_extractor import DQ3GameDataExtractor
from advanced_rom_editor import AdvancedROMEditor

# 1. Load and analyze ROM
print("🔍 Step 1: Analyzing ROM for character data...")
extractor = DQ3GameDataExtractor('static/Dragon Quest III - english.smc')
characters = extractor.find_character_data()

print(f"Found {len(characters)} characters:")
for i, char in enumerate(characters[:3]):
    print(f"  {i}: HP={char.hp}, MP={char.mp}, Level={char.level}")

# 2. Initialize editor with backup
print("\n💾 Step 2: Initializing editor with backup...")
editor = AdvancedROMEditor('static/Dragon Quest III - english.smc', '.')

# 3. Modify character data (example: boost first character's HP)
if characters:
    char = characters[0]
    print(f"\n✏️  Step 3: Modifying character HP from {char.hp} to 999...")

    # Assuming HP is stored as 16-bit little-endian at character offset + 2
    hp_offset = char.offset + 2
    new_hp_bytes = (999).to_bytes(2, 'little')

    changeset_id = editor.edit_data(hp_offset, new_hp_bytes, "Boost character HP to 999")
    print(f"Applied changeset: {changeset_id}")

# 4. Verify the change
print("\n✅ Step 4: Verifying modification...")
new_extractor = DQ3GameDataExtractor(editor.get_current_data())
new_characters = new_extractor.find_character_data()
if new_characters:
    print(f"Character HP now: {new_characters[0].hp}")

# 5. Save modified ROM
print("\n💾 Step 5: Saving modified ROM...")
output_path = editor.save_rom('static/Dragon Quest III - modified.smc')
print(f"Saved to: {output_path}")

print("\n🎉 Character modification workflow complete!")
print("The original ROM remains unchanged, and a backup was created automatically.")
```

This workflow demonstrates the complete process of safely modifying ROM data with full backup and verification.

---

**Congratulations!** You're now ready to explore and analyze Dragon Quest III ROMs with the toolkit. Start with the basic examples above and gradually work your way up to more advanced analysis and modification tasks.

For more detailed information, see:
- [API Reference](API_REFERENCE.md) - Complete function documentation
- [Technical Specifications](TECHNICAL_SPECS.md) - ROM format details
- Example scripts in the `examples/` directory

Happy ROM hacking! 🎮
