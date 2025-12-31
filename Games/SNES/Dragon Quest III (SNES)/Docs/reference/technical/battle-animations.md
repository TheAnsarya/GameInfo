# DQ3r Battle Animation System Documentation

> **Status:** Research In Progress  
> **Last Updated:** 2025-12-31

## Overview

Dragon Quest III SNES uses a sophisticated animation system for battle effects including monster attack animations, spell/magic visual effects, and combat feedback. This document tracks the research and reverse engineering of these systems.

## Animation Categories

### 1. Monster Battle Animations
- **Static Monsters** - DQ3 SNES uses static monster sprites (no idle animation)
- **Attack Reaction** - Monsters flash/shake when hit
- **Death Animation** - Monsters fade/dissolve on defeat
- **Status Effect Indicators** - Visual cues for poison, sleep, etc.

### 2. Spell/Magic Animations
| Type | Examples | Visual Style |
|------|----------|--------------|
| Attack Spells | Frizz, Sizz, Bang | Elemental particle effects |
| Healing Spells | Heal, Midheal | Sparkle/glow effects |
| Status Spells | Sleep, Sap | Target-focused effects |
| Support Spells | Buff, Kabuff | Party-wide effects |

### 3. Combat Feedback Animations
- Damage numbers display
- Critical hit flash
- Miss/dodge indication
- Element resistance indicators

### 4. Menu/UI Animations
- Cursor movement
- Menu transitions
- Text display effects

## Known ROM Locations

### Graphics Data (Verified)
| Asset | ROM Address | Size | Format |
|-------|-------------|------|--------|
| Monster Graphics | `$220000` | 128KB | SNES 4bpp |
| Character Sprites | Bank 34 | 64KB | SNES 4bpp |
| UI Graphics | `$1a0000` | 16KB | SNES 2bpp |

### Animation Data (Under Research)
| Asset | Estimated Location | Notes |
|-------|-------------------|-------|
| Spell Effect Graphics | Banks 35-40 | Need verification |
| Animation Scripts | Unknown | Frame timing data |
| Palette Animation | CGRAM manipulation | Real-time palette cycling |
| OAM Animation Data | Unknown | Sprite positioning per frame |

## Technical Implementation

### SNES Graphics Architecture
- **BG Layers**: 4 background layers for battle scenes
- **OBJ Layer**: Sprites for effects and characters  
- **HDMA**: Used for palette effects and scrolling
- **Mode 7**: Not used in battle (Mode 1 primarily)

### Animation Timing
- Battle animations run at 60fps (NTSC)
- Typical spell animation: 30-60 frames
- Monster hit reaction: 15-20 frames
- Fade effects: 30-45 frames

## Extracted Assets

### dq3r-info Repository
```
extracted_assets/graphics/
├── gfx_0000-0999_tiles_4bpp.bin    # Tile graphics
├── gfx_1000-1499_palette.bin       # Palette data
├── gfx_1500-1699_sprite_oam.bin    # OAM sprite data
└── gfx_1700-1999_tilemap.bin       # Tilemap layouts
```

### GameInfo Repository  
```
Games/SNES/Dragon Quest III (SNES)/assets/dq3_extracted/graphics/
├── monster_graphics.4bpp           # 131KB monster tiles
├── character_sprites.4bpp          # 64KB character tiles
├── sprite_data_01-05.bin          # Sprite animation data
└── ui_graphics.bin                 # UI elements
```

## Animation Script Format (Hypothesis)

Based on similar games (DQ6, FFMQ), animation scripts likely contain:

```
struct AnimationFrame {
    uint8_t  duration;      // Frames to display
    uint8_t  tile_offset;   // Offset into tile bank
    int8_t   x_offset;      // Sprite X position
    int8_t   y_offset;      // Sprite Y position
    uint8_t  flags;         // Flip, priority, palette
}

struct AnimationSequence {
    uint8_t  frame_count;
    uint8_t  loop_point;    // Frame to loop from (0xFF = no loop)
    AnimationFrame frames[];
}
```

## Research Tasks

### Completed
- [x] Identify monster graphics location ($220000)
- [x] Extract base tile graphics
- [x] Extract palette data
- [x] Extract OAM/sprite data

### In Progress
- [ ] Map spell effect graphics locations
- [ ] Reverse engineer animation script format
- [ ] Identify palette animation routines
- [ ] Document HDMA effects

### Future Work
- [ ] Create animation viewer tool
- [ ] Export animations to GIF/video
- [ ] Create animation editor
- [ ] Document all spell animations
- [ ] Create DW4→DQ3r animation mapping

## DW4 → DQ3r Conversion Notes

Dragon Warrior IV (NES) to DQ3r (SNES) conversion requires:

1. **Sprite Scaling** - NES 8x8/8x16 → SNES 16x16 sprites
2. **Color Depth** - NES 4 colors → SNES 16 colors per sprite
3. **Animation Complexity** - DW4 minimal → DQ3r full effects
4. **New Effects** - DQ3r has effects not in DW4

### Animation ID Mapping (Proposed)
| DW4 Spell | DW4 Anim | DQ3r Equivalent | DQ3r Anim |
|-----------|----------|-----------------|-----------|
| Hurt | 0x01 | Frizz | TBD |
| Heal | 0x02 | Heal | TBD |
| Sleep | 0x03 | Snooze | TBD |
| Firebal | 0x04 | Sizz | TBD |
| Healmore | 0x05 | Midheal | TBD |

## Related Resources

- [DataCrystal ROM Map](https://datacrystal.tcrf.net/wiki/Dragon_Quest_III_(SNES)/ROM_map)
- [byuu's DQ3r Tools](https://web.archive.org/web/20211020093652/https://www.romhacking.net/abandoned/dq3r_toolsbyuu.zip)
- [GitHub Issue #TBD](link) - Animation extraction tracking

## See Also

- [ROM-Map.md](../ROM-Map.md) - Full ROM address documentation
- [RAM-Map.md](../RAM-Map.md) - Runtime memory layout
- [spell-animations.md](spell-animations.md) - Spell-specific animations
- [monster-graphics.md](monster-graphics.md) - Monster sprite documentation
