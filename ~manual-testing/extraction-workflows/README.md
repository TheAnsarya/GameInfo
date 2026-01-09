# Extraction Workflows

Step-by-step procedures for extracting different types of game assets.

## 📚 Guides

| Guide | Asset Type | Description |
|-------|------------|-------------|
| [Project System](project-system-workflow.md) | Projects | Create, open, manage .giproj projects |
| [Graphics Extraction](graphics-extraction.md) | Graphics | Extract and decode tile graphics |
| [Audio Extraction](audio-extraction.md) | Audio | Extract SPC music and sound effects |
| [Compression Analysis](compression-analysis.md) | Compressed Data | Identify and decode compression |

## 🎯 Workflow Overview

```
┌──────────────────┐
│ 1. Identify Data │ ← Breakpoint analysis, VRAM watching
└────────┬─────────┘
         │
┌────────▼─────────┐
│ 2. Locate Source │ ← DMA tracing, memory search
└────────┬─────────┘
         │
┌────────▼─────────┐
│ 3. Analyze Format│ ← Compression detection, format RE
└────────┬─────────┘
         │
┌────────▼─────────┐
│ 4. Extract Raw   │ ← ROM dump, memory export
└────────┬─────────┘
         │
┌────────▼─────────┐
│ 5. Decode/Convert│ ← Custom tools, decompression
└────────┬─────────┘
         │
┌────────▼─────────┐
│ 6. Document      │ ← Update specs, mappings
└──────────────────┘
```

## 🔧 Common Tools

| Tool | Purpose |
|------|---------|
| Mesen-S | VRAM/memory export, debugging |
| Tile Molester | Graphics viewing/editing |
| snes_extractor.py | Automated asset extraction |
| bsnes-plus | Detailed trace logging |
| HxD / 010 Editor | Hex editing and analysis |

## 📋 Asset Checklist by Game

### DQ3r SNES
- [ ] Monster sprites (155 monsters)
- [ ] Spell animations (~50 spells)
- [ ] Battle backgrounds
- [ ] Overworld tilesets
- [ ] Town/dungeon tilesets
- [ ] Character sprites
- [ ] UI elements
- [ ] Font graphics
- [ ] Music (SPC format)
- [ ] Sound effects

### DW4 NES
- [ ] Monster sprites
- [ ] Overworld tiles
- [ ] Town tiles
- [ ] Battle backgrounds
- [ ] Character sprites
- [ ] Text font
- [ ] Music data

### FFMQ SNES
- [ ] Monster sprites
- [ ] Spell effects
- [ ] Character sprites
- [ ] Tilesets
- [ ] Music
