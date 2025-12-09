# GameInfo Tools

A comprehensive collection of 148+ Python tools for ROM hacking, game documentation, and retro game research. Tools are organized by category for easy discovery.

## Tool Categories

| Category | Count | Description |
|----------|-------|-------------|
| [analysis/](analysis/) | 22 | ROM analysis, pattern detection, formula research |
| [assembly/](assembly/) | 12 | Assembly formatting, labels, macros, disassembly |
| [audio/](audio/) | 6 | Music extraction, NSF/SPC analysis, sound editing |
| [converters/](converters/) | 11 | Format conversion, batch processing, project generation |
| [data/](data/) | 29 | Game data editing (monsters, items, spells, stats) |
| [debug/](debug/) | 12 | Debug labels, CDL tools, memory tracing |
| [editors/](editors/) | 7 | Specialized editors (AI, banks, savestates) |
| [graphics/](graphics/) | 19 | Tiles, sprites, palettes, animation |
| [maps/](maps/) | 10 | World maps, collision, warps, encounters |
| [rom/](rom/) | 20 | ROM operations (patches, checksums, headers) |
| [text/](text/) | 19 | Text extraction, encoding, dialogue, scripts |

## Quick Reference

### Analysis Tools (`analysis/`)

| Tool | Description |
|------|-------------|
| `rom_analyzer.py` | Comprehensive ROM structure analysis |
| `bank_analyzer.py` | Bank contents and usage statistics |
| `bank_conflict_analyzer.py` | Detect bank mapping conflicts |
| `battle_analyzer.py` | Analyze battle system mechanics |
| `battle_formula_analyzer.py` | Reverse-engineer battle formulas |
| `compression_analyzer.py` | Analyze compression ratios and methods |
| `compression_detector.py` | Detect compression algorithms in ROMs |
| `data_comparator.py` | Compare data structures across ROMs |
| `dte_analyzer.py` | Analyze DTE compression efficiency |
| `formula_analyzer.py` | Generic formula analysis |
| `opcode_analyzer.py` | Opcode frequency and usage analysis |
| `palette_analyzer.py` | Palette usage analysis |
| `pattern_finder.py` | Find recurring patterns in data |
| `pattern_matcher.py` | Match known patterns against ROM |
| `rng_analyzer.py` | Random number generator analysis |
| `rom_stats.py` | ROM usage statistics |
| `rom_version_comparator.py` | Compare different ROM versions |
| `savestate_analyzer.py` | Analyze savestate formats |
| `save_state_analyzer.py` | Additional savestate analysis |
| `trace_analyzer.py` | CPU trace analysis |
| `xref.py` | Cross-reference generation |
| `xref_database.py` | Cross-reference database management |

### Graphics Tools (`graphics/`)

| Tool | Description |
|------|-------------|
| `animation_viewer.py` | View sprite animations |
| `chr_editor.py` | Edit CHR tile data |
| `chr_extractor.py` | Extract CHR/tile graphics |
| `font_editor.py` | Edit game fonts |
| `graphics_ripper.py` | Rip graphics to images |
| `metatile_editor.py` | Edit metatile definitions |
| `palette.py` | Palette manipulation utilities |
| `palette_converter.py` | Convert between palette formats |
| `palette_editor.py` | Edit color palettes |
| `sprite_animation_tool.py` | Sprite animation editing |
| `sprite_animator.py` | Create sprite animations |
| `sprite_editor.py` | Edit sprite data |
| `sprite_sheet.py` | Sprite sheet management |
| `tilemap_editor.py` | Edit tile maps |
| `tileset_manager.py` | Manage tileset collections |
| `tileset_ripper.py` | Rip complete tilesets |
| `tile_collision.py` | Tile collision editing |
| `tile_viewer.py` | View tile data |
| `vram_viewer.py` | VRAM content viewer |

### Text Tools (`text/`)

| Tool | Description |
|------|-------------|
| `control_codes.py` | Text control code management |
| `dialogue_editor.py` | Edit NPC dialogue |
| `dialog_tree.py` | Dialogue tree visualization |
| `dte_compress.py` | Dual-tile encoding compression |
| `encoding_detector.py` | Detect text encoding schemes |
| `localization.py` | Localization management |
| `npc_dialogue.py` | NPC-specific dialogue handling |
| `script_compiler.py` | Compile text scripts |
| `script_disasm.py` | Disassemble text scripts |
| `script_disassembler.py` | Full script disassembler |
| `script_inserter.py` | Insert translated scripts |
| `string_extractor.py` | Extract text strings |
| `string_table.py` | String table management |
| `text_codec.py` | Text encoding/decoding |
| `text_encoder.py` | Encode text to ROM format |
| `text_extract.py` | Extract game text |
| `text_script.py` | Text script handling |
| `wikitext_generator.py` | Generate wikitext documentation |
| `wiki_generator.py` | Generate wiki pages |

### ROM Tools (`rom/`)

| Tool | Description |
|------|-------------|
| `checksum.py` | Checksum calculation |
| `checksum_calc.py` | Extended checksum utilities |
| `compression.py` | Compression/decompression |
| `header_editor.py` | ROM header editing |
| `mapper_analyzer.py` | Mapper analysis and detection |
| `mapper_info.py` | Mapper information display |
| `patch_creator.py` | Create IPS/BPS patches |
| `patch_manager.py` | Manage patch collections |
| `pointer_fixup.py` | Fix pointer tables |
| `pointer_scanner.py` | Scan for pointer tables |
| `pointer_table.py` | Pointer table management |
| `pointers.py` | General pointer utilities |
| `rom_comparison_gui.py` | GUI ROM comparison tool |
| `rom_diff.py` | Compare ROM versions |
| `rom_expansion.py` | Expand ROM size |
| `rom_header.py` | ROM header utilities |
| `rom_info.py` | Display ROM information |
| `rom_patch.py` | Apply ROM patches |
| `rom_patcher.py` | Patching utilities |
| `rom_splicer.py` | Splice ROM sections |

### Data Tools (`data/`)

| Tool | Description |
|------|-------------|
| `achievements.py` | Achievement system |
| `armor_editor.py` | Edit armor data |
| `attribute_editor.py` | Edit attribute definitions |
| `battle_system.py` | Battle system data |
| `cheat_code_generator.py` | Generate cheat codes |
| `cheat_generator.py` | Cheat code generation |
| `chest_editor.py` | Edit chest contents |
| `class_editor.py` | Edit character classes |
| `data_table.py` | Data table management |
| `encounter_editor.py` | Edit random encounters |
| `enemy_formation.py` | Enemy formation editing |
| `equipment_system.py` | Equipment system data |
| `event_editor.py` | Event data editing |
| `event_script.py` | Event scripting |
| `event_script_decompiler.py` | Decompile event scripts |
| `exp_curve.py` | Experience curve editing |
| `item_database.py` | Item database management |
| `monster_database.py` | Monster stats management |
| `party_editor.py` | Party data editing |
| `quest_system.py` | Quest system data |
| `shop_editor.py` | Shop inventory editing |
| `skill_editor.py` | Skill data editing |
| `skill_tree.py` | Skill tree management |
| `spell_database.py` | Spell/magic data |
| `stats_calculator.py` | Stats calculation |
| `status_effects.py` | Status effect editing |
| `stat_growth.py` | Stat growth curves |
| `struct_viewer.py` | Data structure viewer |
| `weapon_editor.py` | Weapon data editing |

### Assembly Tools (`assembly/`)

| Tool | Description |
|------|-------------|
| `asm_formatter.py` | Format assembly source |
| `asm_helper.py` | Assembly utilities |
| `asm_syntax_highlighter.py` | Syntax highlighting |
| `assembly_differ.py` | Diff assembly files |
| `code_flow.py` | Code flow analysis |
| `disasm_export.py` | Export disassembly |
| `label_converter.py` | Convert label formats |
| `label_file_manager.py` | Label file management |
| `label_merge.py` | Merge label files |
| `macro_processor.py` | Process assembly macros |
| `symbol_manager.py` | Symbol management |
| `symbol_table.py` | Symbol table utilities |

### Debug Tools (`debug/`)

| Tool | Description |
|------|-------------|
| `cdl_build.py` | CDL build system |
| `cdl_build_config.json` | CDL build configuration |
| `cdl_coverage.py` | CDL coverage analysis |
| `cdl_editor.py` | CDL file editor |
| `cdl_visualizer.py` | CDL visualization |
| `debug_labels.py` | Debug label management |
| `debug_logger.py` | Debug logging |
| `debug_symbols.py` | Debug symbol handling |
| `memory_tracer.py` | Memory access tracing |
| `memory_watch.py` | Memory watch utilities |
| `mlb_editor.py` | Mesen label file editor |
| `nl_editor.py` | NL file editor |
| `savestate.py` | Savestate manipulation |

### Audio Tools (`audio/`)

| Tool | Description |
|------|-------------|
| `music_analyzer.py` | Music data analysis |
| `music_editor.py` | Edit music data |
| `music_extractor.py` | Extract music |
| `music_ripper.py` | Rip music to files |
| `nsf_info.py` | NSF file information |
| `spc_info.py` | SPC file information |

### Map Tools (`maps/`)

| Tool | Description |
|------|-------------|
| `bank_map.py` | Bank mapping visualization |
| `collision_editor.py` | Edit collision data |
| `collision_map_editor.py` | Collision map editing |
| `map_connection.py` | Map connections |
| `map_encounter.py` | Map encounter editing |
| `map_viewer.py` | Map visualization |
| `memory_layout.py` | Memory layout mapping |
| `memory_map.py` | Memory map generation |
| `warp_editor.py` | Warp point editing |
| `world_map.py` | World map editing |

### Converters (`converters/`)

| Tool | Description |
|------|-------------|
| `address_conv.py` | Address conversion |
| `batch_process.py` | Batch file processing |
| `cdl_converter.py` | CDL format conversion |
| `config_manager.py` | Configuration management |
| `data_migrator.py` | Data format migration |
| `doc_generator.py` | Documentation generation |
| `hex_calc.py` | Hex calculator |
| `hex_finder.py` | Hex string finder |
| `project_gen.py` | Project generation |
| `schema_validator.py` | Schema validation |
| `spaces_to_tabs.py` | Whitespace conversion |

### Editors (`editors/`)

| Tool | Description |
|------|-------------|
| `ai_editor.py` | AI behavior editing |
| `bank_organizer.py` | Bank organization |
| `bank_swapper.py` | Bank swapping utilities |
| `cutscene_editor.py` | Cutscene editing |
| `save_editor.py` | Save file editing |
| `savefile_editor.py` | Extended save editing |
| `table_editor.py` | Table editing |

## Usage

Most tools can be run directly from their category folder:

```bash
# Show tool help
python tools/analysis/rom_analyzer.py --help

# Analyze a ROM
python tools/analysis/rom_analyzer.py path/to/rom.nes

# Extract graphics
python tools/graphics/chr_extractor.py rom.nes --output tiles/

# Extract text
python tools/text/text_extract.py rom.nes --table game.tbl

# Create a patch
python tools/rom/patch_creator.py original.nes modified.nes --output patch.ips
```

## C# .NET Replacement

These Python tools are being converted to C# .NET 9 in the `src/GameInfoTools.*` projects. The C# version provides:

- Better performance
- Type safety
- Cross-platform native builds
- Unified CLI interface with Spectre.Console

See `GameInfoTools.sln` for the C# solution.

## Contributing

When adding new tools:

1. Place in the appropriate category folder
2. Follow naming conventions (`snake_case.py`)
3. Add `--help` support with argparse
4. Include docstrings
5. Use tabs for indentation (per `.editorconfig`)
6. Add tool to this README
