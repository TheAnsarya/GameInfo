# DQ3R Tools Directory

# Development tools for Dragon Quest III Remake disassembly project

# Based on FFMQ-Info project structure

This directory contains tools for ROM analysis, asset extraction, data editing, and build automation.

# # 📁 Tool Categories

# ## 🔍 Analysis Tools (`analysis/`)
- **analyze_rom.py** - Initial ROM analysis and structure detection
- **find_patterns.py** - Pattern detection for graphics, text, and data
- **memory_mapper.py** - SNES memory mapping analysis
- **compression_detector.py** - Detect compression algorithms used

# ## 📦 Asset Extractors (`extractors/`)
- **extract_graphics.py** - Extract tiles, sprites, and backgrounds
- **extract_text.py** - Extract dialog, menus, and item names
- **extract_music.py** - Extract music and sound data
- **extract_data.py** - Extract game data tables

# ## ✏️ Data Editors (`editors/`)
- **character_editor.py** - Edit character stats and abilities
- **enemy_editor.py** - Edit enemy stats, AI, and drops
- **item_editor.py** - Edit item properties and effects
- **spell_editor.py** - Edit magic spells and abilities

# ## 🔧 Build Tools (`build/`)
- **build_rom.py** - Python ROM building pipeline
- **validate_rom.py** - ROM integrity validation
- **compare_roms.py** - Compare built ROM with original
- **patch_creator.py** - Create IPS patches from changes

# ## 🎨 Formatting Tools (`formatting/`)
- **format_asm.ps1** - Assembly code formatting
- **clean_code.py** - Code cleanup and standardization
- **check_style.py** - Code style verification

# # 🚀 Quick Start

# ## Initial ROM Analysis
```powershell

# Analyze the primary target ROM
python tools/analysis/analyze_rom.py static/"Dragon Quest III - Soshite Densetsu he... (J).smc"

# Find graphics patterns
python tools/analysis/find_patterns.py --type graphics --output analysis/graphics_map.json
```

# ## Asset Extraction
```powershell

# Extract all graphics
python tools/extractors/extract_graphics.py --input static/ --output assets/graphics/

# Extract text and dialog
python tools/extractors/extract_text.py --input static/ --output assets/text/

# Extract music data
python tools/extractors/extract_music.py --input static/ --output assets/music/
```

# ## Data Editing
```powershell

# Launch character editor
python tools/editors/character_editor.py

# Edit enemy data
python tools/editors/enemy_editor.py --enemy "Slime" --stat hp --value 15

# Batch edit items
python tools/editors/item_editor.py --batch assets/data/items.json
```

# ## Building and Testing
```powershell

# Build ROM from extracted assets
python tools/build/build_rom.py --source src/ --output build/dq3r-rebuilt.sfc

# Validate the built ROM
python tools/build/validate_rom.py build/dq3r-rebuilt.sfc

# Compare with original
python tools/build/compare_roms.py original.smc build/dq3r-rebuilt.sfc
```

# # 🛠️ Tool Dependencies

**Core Requirements:**
- Python 3.8+ with packages from requirements.txt
- Asar SNES assembler for building ROMs
- PIL/Pillow for graphics processing
- NumPy for numerical data processing

**Optional Tools:**
- MesenS emulator for testing
- YY-CHR for graphics editing
- Hex editor for manual analysis

# # 📖 Tool Documentation

Each tool includes detailed help:

```powershell

# Get help for any tool
python tools/[category]/[tool_name].py --help

# Example
python tools/extractors/extract_graphics.py --help
```

For comprehensive documentation, see:
- `docs/tools/` - Individual tool guides
- `docs/guides/tool-usage.md` - Tool usage examples
- `docs/reference/tool-reference.md` - Complete tool reference

# # ⚙️ Configuration

Tools can be configured via:
- `build.config.json` - Global build configuration
- `tools/config/` - Tool-specific configuration files
- Command line arguments - Override default settings

# # 🐛 Troubleshooting

**Common Issues:**

1. **Import errors**: Ensure you've activated the virtual environment and installed requirements
2. **ROM not found**: Check file paths in static/ directory
3. **Permission errors**: Run PowerShell as administrator if needed
4. **Encoding issues**: Ensure files are saved as UTF-8 with CRLF line endings

**Getting Help:**
- Check tool help: `python [tool].py --help`
- Review error logs in `build/logs/`
- See troubleshooting guide: `docs/guides/troubleshooting.md`

# # 🤝 Contributing

When adding new tools:
1. Follow the existing directory structure
2. Include comprehensive help text
3. Add error handling and validation
4. Write tests in `tests/` directory
5. Update this README with new tools

# # 📊 Tool Status

# ## Extraction Tools
- [ ] Graphics extractor - In development
- [ ] Text extractor - Planned
- [ ] Music extractor - Planned
- [ ] Data extractor - Planned

# ## Editor Tools
- [ ] Character editor - Planned
- [ ] Enemy editor - Planned
- [ ] Item editor - Planned
- [ ] Map editor - Future

# ## Build Tools
- [x] Basic build script - Complete
- [ ] ROM validator - Planned
- [ ] ROM comparison - Planned
- [ ] Patch creator - Future

Happy ROM hacking! 🎮
