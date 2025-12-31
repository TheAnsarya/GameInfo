# DQ3r Monster Graphics Documentation

> **Status:** Research In Progress  
> **Last Updated:** 2025-12-31

## Overview

Dragon Quest III SNES features 155 unique monsters plus palette swaps. This document details the monster graphics system, including sprite formats, palettes, and battle display mechanics.

## Monster Graphics Layout

### ROM Location
| Data | Address | Size | Format |
|------|---------|------|--------|
| Monster Tiles | `$220000` | 128KB | SNES 4bpp planar |
| Monster Palettes | TBD | ~5KB | 16-color SNES format |
| Monster Metadata | `$3ed964-$3ee0db` | 1,896B | Stats + graphics refs |

### Tile Format
- **Bit Depth**: 4bpp (16 colors per monster)
- **Tile Size**: 8x8 pixels
- **Monster Size**: Variable (2x2 to 8x8 tiles = 16x16 to 64x64 pixels)

### Monster Size Categories
| Size | Tiles | Pixels | Example Monsters |
|------|-------|--------|------------------|
| Small | 2x2 | 16x16 | Slime, Bubble Slime |
| Medium | 4x4 | 32x32 | Druid, Magician |
| Large | 6x6 | 48x48 | Dragon, Troll |
| Boss | 8x8 | 64x64 | Baramos, Zoma |

## Monster List with Graphics Info

### Regular Monsters (001-099)

| ID | JP Name | EN Name | Size | Palette Group |
|----|---------|---------|------|---------------|
| 01 | スライム | Slime | Small | Blue |
| 02 | おおがらす | Raven | Small | Black |
| 03 | いっかくうさぎ | Pointed Rabbit | Small | Brown |
| 04 | おおありくい | Large Anteater | Medium | Gray |
| 05 | じんめんちょう | Human Face Butterfly | Medium | Purple |
| 06 | フロッガー | Frogger | Medium | Green |
| 07 | バブルスライム | Bubble Slime | Small | Green |
| 08 | まほうつかい | Magician | Medium | Blue |
| 09 | さそりばち | Scorpion Wasp | Small | Yellow |
| 0A | ホイミスライム | Healslime | Small | Orange |
| ... | ... | ... | ... | ... |

### Metal Monsters
| ID | JP Name | EN Name | Size | Notes |
|----|---------|---------|------|-------|
| 32 | メタルスライム | Metal Slime | Small | Metallic palette |
| 6D | はぐれメタル | Liquid Metal Slime | Small | Shiny metallic |

### Boss Monsters
| ID | JP Name | EN Name | Size | Notes |
|----|---------|---------|------|-------|
| 85 | バラモス | Baramos | Boss | Chapter boss |
| 86 | ゾーマ | Zoma | Boss | Final boss |
| 87 | オルテガ | Ortega | Large | Story character |

## Monster Graphics Format

### Tile Data Structure
```
; 4bpp planar format (SNES native)
; 8x8 tile = 32 bytes
; Row format: 2 bytes bitplanes 0-1, then 2 bytes bitplanes 2-3

MonsterTile:
    .db $00, $00    ; Row 0, bitplanes 0-1
    .db $00, $00    ; Row 1, bitplanes 0-1
    ; ... 8 rows ...
    .db $00, $00    ; Row 0, bitplanes 2-3
    .db $00, $00    ; Row 1, bitplanes 2-3
    ; ... 8 rows ...
```

### Monster Metadata Structure
Based on DataCrystal documentation:
```
struct MonsterData {
    uint16_t experience;    // EXP gained
    uint8_t  gold;          // Gold dropped
    // ... stats ...
    uint8_t  sprite_id;     // Graphics index
    uint8_t  palette_id;    // Color palette
}
```

## Palette System

### Palette Organization
- **Palette 0-3**: Player character sprites
- **Palette 4-7**: Monster sprites (up to 4 monsters)
- **Palette 8-11**: Spell effects
- **Palette 12-15**: UI elements

### Color Format
```
; SNES 15-bit BGR format
; %0BBBBBGGGGGRRRRR
Color_Example:
    .dw $7FFF       ; White
    .dw $0000       ; Black (transparent)
    .dw $001F       ; Red
    .dw $03E0       ; Green
    .dw $7C00       ; Blue
```

### Palette Swaps
Many monsters share base sprites with different palettes:
| Base Monster | Variant 1 | Variant 2 |
|--------------|-----------|-----------|
| Slime (Blue) | Bubble Slime (Green) | Metal Slime (Gray) |
| Dragon (Green) | Snow Dragon (White) | Dragon Zombie (Brown) |

## Battle Display System

### Monster Positioning
```
; Battle screen layout (up to 8 monsters)
;
;  [M1] [M2] [M3] [M4]     (Front row)
;      [M5] [M6] [M7] [M8] (Back row - if applicable)
;
; Y positions are fixed per row
; X positions calculated based on monster count

MonsterPositions:
    ; 1 monster: centered
    .dw 112         ; X position
    
    ; 2 monsters: split
    .dw 72, 152
    
    ; 3 monsters: evenly spaced
    .dw 48, 112, 176
    
    ; 4 monsters
    .dw 32, 80, 144, 192
```

### Animation States
Monsters have these display states:
1. **Normal** - Default display
2. **Attacked** - Flash white (palette swap)
3. **Casting** - Brief highlight
4. **Damaged** - Shake effect (position offset)
5. **Dying** - Fade to transparent
6. **Dead** - Not displayed

### Hit Flash Effect
```
; Hit animation: palette cycle
; Frame 1-2: Normal palette
; Frame 3-4: White palette (all $7FFF)
; Frame 5-6: Normal palette
; Frame 7-8: White palette
; Frame 9+: Normal palette

HitFlash_Duration: .db 8    ; frames
HitFlash_Pattern:  .db $00, $FF, $00, $FF  ; 0=normal, FF=white
```

## Extracted Monster Graphics

### From dq3r-info
Located in `extracted_assets/graphics/`:
- Tiles 0000-0300 estimated as monster graphics
- Need correlation with monster IDs

### From GameInfo
Located in `assets/dq3_extracted/graphics/`:
- `monster_graphics.4bpp` - 131,072 bytes (4,096 tiles)
- Confirmed at `$220000`

## Monster Graphics Extraction Pipeline

### Current Tools
1. **snes_extractor.py** - General graphics extraction
2. **battle_analyzer.py** - Battle system analysis

### Proposed Workflow
```
ROM -> Extract 4bpp tiles -> Apply palettes -> Export PNG
                         -> Create tilemap  -> Assemble sprites
                         -> Add metadata    -> JSON database
```

## DW4 to DQ3r Monster Graphics Conversion

### Size Comparison
| Platform | Tile Format | Colors | Max Size |
|----------|-------------|--------|----------|
| NES (DW4) | 2bpp | 4 | 32x32 |
| SNES (DQ3r) | 4bpp | 16 | 64x64 |

### Conversion Requirements
1. **Upscale Sprites** - 2x or AI-assisted upscaling
2. **Expand Palette** - 4 colors → 16 colors
3. **Add Detail** - Enhanced shading possible
4. **Maintain Style** - Keep recognizable silhouettes

### Monster Mapping (DW4 → DQ3r)
| DW4 Monster | DQ3r Equivalent | Notes |
|-------------|-----------------|-------|
| Slime | Slime | Direct match |
| Metal Slime | Metal Slime | Direct match |
| Healslime | Healslime | Direct match |
| Drakee | Chimaera | Similar bat-type |
| Magician | Magician | Direct match |
| (DW4-only) | N/A | Need custom sprites |

## Research Tasks

### Completed
- [x] Locate monster graphics in ROM
- [x] Identify 4bpp tile format
- [x] Extract raw tile data
- [x] Document monster count (155)

### In Progress
- [ ] Map monster ID to sprite offset
- [ ] Extract all monster palettes
- [ ] Create monster sprite viewer
- [ ] Document all palette swaps

### Future Work
- [ ] Export all monsters as PNG
- [ ] Create monster editor tool
- [ ] DW4 monster import pipeline
- [ ] Animation state documentation

## See Also

- [battle-animations.md](battle-animations.md) - Battle animation system
- [spell-animations.md](spell-animations.md) - Spell effect animations
- [../../ROM-Map.md](../../ROM-Map.md) - Complete ROM map
