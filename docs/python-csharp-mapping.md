# Python/C# Tool Mapping

This document maps the Python tools in `tools/` to their C# equivalents in `src/`.

## Overview

The GameInfo project provides tools in both Python (for quick scripting and prototyping) and C# (for the integrated application). Many tools have equivalents in both languages.

## Mapping Table

### Analysis Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `analysis/rom_analyzer.py` | `GameInfoTools.Analysis.RomAnalyzer` | ROM structure analysis |
| `analysis/xref.py` | `GameInfoTools.Analysis.CrossReference` | Cross-reference generation |
| `analysis/xref_database.py` | `GameInfoTools.Analysis.CrossReference` | Reference database |
| `analysis/palette_analyzer.py` | `GameInfoTools.Core.Graphics.PaletteAnalyzer` | Palette analysis |
| `analysis/pattern_finder.py` | `GameInfoTools.Core.PatternDetector` | Pattern detection |
| `analysis/compression_detector.py` | `GameInfoTools.Core.CompressionDetector` | Compression detection |

### Debug/CDL Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `debug/cdl_coverage.py` | `GameInfoTools.Analysis.CdlMerger` | CDL coverage tracking |
| `debug/cdl_editor.py` | `GameInfoTools.Analysis.CdlMerger` | CDL editing/merging |
| `debug/cdl_build.py` | `GameInfoTools.Analysis.CdlMerger` | CDL build/merge |
| `debug/cdl_visualizer.py` | `GameInfoTools.Analysis.CdlHeatmap` | CDL visualization |
| `debug/debug_labels.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Debug label management |
| `debug/debug_symbols.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Symbol handling |
| `debug/mlb_editor.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Mesen label files |
| `debug/nl_editor.py` | `GameInfoTools.Core.Symbols.SymbolManager` | FCEUX NL files |
| `debug/debug_logger.py` | `GameInfoTools.Core.DebugLogger` | Debug logging |

### Graphics Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `graphics/chr_editor.py` | `GameInfoTools.Graphics.ChrEditor` | CHR tile editing |
| `graphics/chr_extractor.py` | `GameInfoTools.Graphics.ChrEditor` | CHR extraction |
| `graphics/font_editor.py` | `GameInfoTools.Graphics.FontEditor` | Font editing |
| `graphics/sprite_editor.py` | `GameInfoTools.Graphics.SpriteExtractor` | Sprite editing |
| `graphics/sprite_sheet.py` | `GameInfoTools.Graphics.SpriteExtractor` | Sprite sheets |
| `graphics/tileset_manager.py` | `GameInfoTools.Graphics.TilesetManager` | Tileset management |
| `graphics/tilemap_editor.py` | `GameInfoTools.Graphics.TilesetManager` | Tilemap editing |
| `graphics/palette.py` | `GameInfoTools.Core.Graphics.PaletteAnalyzer` | Palette utilities |
| `graphics/palette_editor.py` | `GameInfoTools.Core.Graphics.PaletteAnalyzer` | Palette editing |

### Text Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `text/string_extractor.py` | `GameInfoTools.Text.StringExtractor` | Text extraction |
| `text/text_extract.py` | `GameInfoTools.Text.StringExtractor` | Text extraction |
| `text/dialogue_editor.py` | `GameInfoTools.Text.DialogueEditor` | Dialogue editing |
| `text/script_compiler.py` | `GameInfoTools.Text.ScriptCompiler` | Script compilation |
| `text/script_disasm.py` | `GameInfoTools.Text.ScriptCompiler` | Script disassembly |
| `text/localization.py` | `GameInfoTools.Text.LocalizationManager` | Localization |
| `text/dte_compress.py` | `GameInfoTools.Text.DteOptimizer` | DTE compression |
| `analysis/dte_analyzer.py` | `GameInfoTools.Text.DteOptimizer` | DTE analysis |
| `text/text_encoder.py` | `GameInfoTools.Core.TextTable` | Text encoding |
| `text/text_codec.py` | `GameInfoTools.Core.TextTable` | Text codec |

### ROM Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `rom/rom_expansion.py` | `GameInfoTools.Rom.RomExpander` | ROM expansion |
| `rom/rom_splicer.py` | `GameInfoTools.Core.Build.RomSplicer` | ROM splicing |
| `rom/pointer_scanner.py` | `GameInfoTools.Core.Analysis.PointerScanner` | Pointer scanning |
| `rom/pointer_fixup.py` | `GameInfoTools.Core.Build.PointerFixup` | Pointer fixup |
| `rom/checksum.py` | `GameInfoTools.Core.Checksum` | Checksum calculation |
| `rom/rom_patch.py` | `GameInfoTools.Rom.Patching` | IPS/BPS patching |
| `rom/rom_patcher.py` | `GameInfoTools.Rom.Patching` | Patching utilities |
| `rom/header_editor.py` | `GameInfoTools.Core.RomFile` | Header editing |
| `rom/rom_info.py` | `GameInfoTools.Core.RomFile` | ROM information |

### Data Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `data/data_table.py` | `GameInfoTools.Data.DataTableEditor` | Data table editing |
| `data/battle_system.py` | `GameInfoTools.Data.BattleSystemEditor` | Battle system |
| `data/encounter_editor.py` | `GameInfoTools.Data.EncounterEditor` | Encounters |
| `data/equipment_system.py` | `GameInfoTools.Data.EquipmentSystem` | Equipment |
| `data/quest_system.py` | `GameInfoTools.Data.QuestSystemEditor` | Quests |
| `data/skill_tree.py` | `GameInfoTools.Data.SkillTreeEditor` | Skill trees |
| `data/achievements.py` | `GameInfoTools.Data.AchievementEditor` | Achievements |

### Editors

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `editors/save_editor.py` | `GameInfoTools.Core.SaveData.SaveEditor` | Save editing |
| `editors/savefile_editor.py` | `GameInfoTools.Core.SaveData.SaveEditor` | Save files |
| `editors/cutscene_editor.py` | `GameInfoTools.Data.CutsceneEditor` | Cutscenes |
| `editors/table_editor.py` | `GameInfoTools.Data.DataTableEditor` | Table editing |

### Converters

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `converters/project_gen.py` | `GameInfoTools.Core.Build.ProjectTemplateGenerator` | Project scaffolding |
| `converters/cdl_converter.py` | `GameInfoTools.Analysis.CdlMerger` | CDL conversion |
| `converters/address_conv.py` | `GameInfoTools.Core.AddressConverter` | Address conversion |

### Assembly Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `assembly/symbol_manager.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Symbol management |
| `assembly/symbol_table.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Symbol tables |
| `assembly/label_file_manager.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Label files |
| `assembly/label_merge.py` | `GameInfoTools.Core.Symbols.SymbolManager` | Label merging |
| `assembly/asm_formatter.py` | `GameInfoTools.Core.AsmProcessor` | ASM formatting |
| `assembly/macro_processor.py` | `GameInfoTools.Core.AsmProcessor` | Macro processing |

### Map Tools

| Python Script | C# Class | Notes |
|--------------|----------|-------|
| `maps/world_map.py` | `GameInfoTools.Data.WorldMapEditor` | World maps |
| `maps/tilemap.py` | `GameInfoTools.Data.WorldMapEditor` | Tilemaps |

## Tools Without C# Equivalents (Future Work)

These Python tools don't have C# equivalents yet:

### Analysis
- `analysis/battle_analyzer.py` - Battle mechanics analysis
- `analysis/battle_formula_analyzer.py` - Battle formula reverse engineering
- `analysis/rng_analyzer.py` - RNG analysis
- `analysis/trace_analyzer.py` - CPU trace analysis

### Data Editors
- ~~`data/shop_editor.py`~~ → `ShopEditor` ✅ (Issue #73 complete)
- ~~`data/chest_editor.py`~~ → `ChestEditor` ✅ (Issue #73 complete)
- ~~`data/party_editor.py`~~ → `PartyEditor` ✅ (Issue #73 complete)
- ~~`data/class_editor.py`~~ → `ClassEditor` ✅ (Issue #73 complete)
- ~~`data/battle_formula*.py`~~ → `BattleFormulaEditor` ✅ (Issue #73 complete)
- `data/monster_database.py` - Monster data management
- `data/item_database.py` - Item data management
- `data/spell_database.py` - Spell data management
- `data/exp_curve.py` - Experience curves
- `data/stat_growth.py` - Stat growth curves

### Graphics
- `graphics/animation_viewer.py` - Animation preview
- `graphics/sprite_animator.py` - Sprite animation creation
- `graphics/vram_viewer.py` - VRAM visualization

### Text
- ~~`text/dte_compress.py`~~ → `DteOptimizer` ✅ (Issue #71 complete)
- ~~`analysis/dte_analyzer.py`~~ → `DteOptimizer` ✅ (Issue #71 complete)

### Other
- `converters/hex_calc.py` - Hex calculator utility
- `debug/memory_tracer.py` - Memory tracing
- `debug/memory_watch.py` - Memory watching

## Usage Notes

### When to Use Python vs C#

**Use Python tools when:**
- Quick one-off analysis tasks
- Prototyping new features
- Command-line scripting
- Cross-platform compatibility without .NET

**Use C# tools when:**
- Integration with the UI application
- High-performance processing
- Type-safe operations
- Part of the build pipeline

### Cross-Reference Comments

Both Python and C# files include comments indicating their counterparts:

**Python format:**
```python
"""
Tool Name

Description...

C# equivalent: GameInfoTools.Namespace.ClassName
"""
```

**C# format:**
```csharp
/// <summary>
/// Description...
/// </summary>
/// <remarks>
/// C# equivalent of: tools/category/script_name.py
/// </remarks>
```
