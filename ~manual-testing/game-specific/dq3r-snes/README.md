# DQ3r SNES - Debugging Notes

Dragon Quest III SNES-specific debugging documentation.

## 📋 Quick Reference

### ROM Info
- **Platform**: Super Nintendo (SNES)
- **Region**: Japan (with fan translation available)
- **Size**: 6MB (48Mbit) - HiROM
- **Mapper**: HiROM (Mode $21, FastROM)
- **Banks**: 192 ($00-$BF)
- **SRAM**: 8KB

### Key ROM Regions

| Address (ROM) | Address (SNES) | Size | Contents | Status |
|---------------|----------------|------|----------|--------|
| $000000 | $C00000 | 64KB | Boot code, system init | ✅ Verified |
| $010000 | $C10000 | 64KB | Main game engine | ✅ Verified |
| $020000 | $C20000 | 64KB | Battle system core | ✅ Verified |
| $030000 | $C30000 | 64KB | Menu/UI system | ✅ Verified |
| $1a0000 | - | 16KB | UI Graphics (2bpp) | ✅ Extracted |
| $1b0000 | - | 8KB | Font Data (2bpp) | ✅ Extracted |
| $200000 | - | 64KB | Character Tiles (4bpp) | ✅ Extracted |
| $220000 | $C40000 | 128KB | Monster Graphics (4bpp) | ✅ Extracted |
| $240000 | - | 32KB | Player Character Sprites | ✅ Verified |
| $250000 | - | 48KB | NPC Sprites | ✅ Verified |
| $260000 | - | 24KB | Battle Effects | 📋 Estimated |
| $3ed964 | - | 1,896B | Monster Metadata | ✅ Verified |
| $500000 | - | 8KB | Item Data | ✅ Extracted |
| $510000 | - | 8KB | Monster Stats | ✅ Verified |
| $512000 | - | 12KB | Monster AI | ✅ Verified |
| $520000 | - | 4KB | Spell Data | ✅ Extracted |
| $520800 | - | 4KB | Spell Effects | 📋 Estimated |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $7E0000-$7E1FFF | 8KB | Direct Page / Stack |
| $7E2000-$7EFFFF | ~56KB | Work RAM |
| $7F0000-$7FFFFF | 64KB | Extended RAM |

### VRAM Layout (Battle)

| VRAM Address | Size | Contents |
|--------------|------|----------|
| $0000-$3FFF | 16KB | Background tiles (battle scene) |
| $4000-$5FFF | 8KB | Monster graphics |
| $6000-$7FFF | 8KB | Spell effect tiles (DMA loaded) |

### Palette Organization

| Palette | Index | Usage |
|---------|-------|-------|
| 0-3 | $00-$03 | Player character sprites |
| 4-7 | $04-$07 | Monster sprites |
| 8-11 | $08-$0B | Spell effects |
| 12-15 | $0C-$0F | UI elements |

## 🔬 Debugging Sessions

### Session Log

| Date | Focus | Findings | Link |
|------|-------|----------|------|
| 2025-12-31 | Animation research | Created documentation, identified ROM regions | [session-02](../../../../~docs/session-logs/2025-12-31-session-02-dq3r-animations.md) |
| TBD | Breakpoint analysis | Pending manual work | [breakpoint-log.md](breakpoint-log.md) |

## 📍 Known Breakpoints

### Battle System

```asm
; Battle initialization
; Bank $02 ($C20000 region) - Battle system core

; Spell cast handler
; Look for table lookup at $520000 region

; Animation player
; Estimated in Bank $02-$03
```

### Graphics Loading

```asm
; Monster sprite DMA
; Set breakpoint on $420B (DMA enable)
; Watch for source in $220000+ region

; Spell effect DMA  
; Set breakpoint on $420B
; Watch for source in $260000 or $520800 region
```

### Recommended DMA Breakpoints

```
$4300-$4306 - DMA Channel 0 registers
$420B       - DMA enable register
$2118/$2119 - VRAM data write
$2122       - CGRAM data write
```

## 📊 Data Structures

See [structures.md](structures.md) for detailed format documentation.

### Monster Data (Summary)
- **Count**: 155 monsters
- **Graphics**: $220000 (128KB, 4bpp)
- **Metadata**: $3ed964-$3ee0db (1,896 bytes)
- **Stats**: $510000 (8KB)
- **AI**: $512000 (12KB)
- **Sizes**: 16x16 to 64x64 pixels (2x2 to 8x8 tiles)
- **Palettes**: Indices 4-7

### Spell Data (Summary)
- **Count**: ~100 spells
- **Main Table**: $520000 (4KB)
- **Effects**: $520800 (4KB, estimated)
- **Animation tiles loaded dynamically to VRAM $6000-$7FFF

## 📦 Extracted Assets

From dq3r-info extraction report:

| Asset | Size | Format | Checksum |
|-------|------|--------|----------|
| monster_graphics | 131,072 | snes_4bpp | fa88d51f26e401cc |
| spell_data | 4,096 | spell_table | 2086872ad28f6e03 |
| monster_stats | 12,288 | monster_table | ac473044a9670258 |
| character_sprites | 65,536 | snes_4bpp | ebb74803f46886cb |

## 🔗 Related Documentation

- [ROM Map](../../../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/ROM-Map.md) - Complete ROM map
- [Technical Reference](../../../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/)
- [Battle Animations](../../../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/battle-animations.md)
- [Animation Extraction Guide](../../breakpoint-guides/dq3r-animation-extraction.md)
- [Extraction Report](../../../../../dq3r-info/assets/dq3_extracted/extraction_report.md)
