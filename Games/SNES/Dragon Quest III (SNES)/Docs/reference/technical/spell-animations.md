# DQ3r Spell Animation Reference

> **Status:** Research In Progress  
> **Last Updated:** 2025-12-31

## Overview

This document catalogs all spell and magic animations in Dragon Quest III SNES, including their ROM locations, frame data, and visual descriptions.

## Spell Categories

### Attack Magic (攻撃呪文)

#### Fire Element (メラ系)
| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 01 | メラ | Frizz | Single | Small fireball |
| 02 | メラミ | Frizzle | Single | Medium fireball |
| 03 | メラゾーマ | Kafrizzle | Single | Large fireball explosion |

#### Ice Element (ヒャド系)
| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 04 | ヒャド | Crack | Single | Ice spike |
| 05 | ヒャダルコ | Crackle | Group | Ice shards |
| 06 | マヒャド | Kacrack | All | Blizzard effect |

#### Electric Element (デイン系)
| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 07 | ライデイン | Zap | Single | Lightning bolt |
| 08 | ギガデイン | Kazap | All | Multiple lightning |

#### Explosion (イオ系)
| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 09 | イオ | Bang | Group | Small explosion |
| 0A | イオラ | Boom | Group | Medium explosion |
| 0B | イオナズン | Kaboom | All | Large explosion |

#### Wind (バギ系)
| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 0C | バギ | Woosh | Group | Wind gust |
| 0D | バギマ | Swoosh | Group | Tornado |
| 0E | バギクロス | Kaswoosh | All | Cross wind |

### Healing Magic (回復呪文)

| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 10 | ホイミ | Heal | Single | Sparkles rise |
| 11 | ベホイミ | Midheal | Single | Larger sparkles |
| 12 | ベホマ | Fullheal | Single | Full body glow |
| 13 | ベホマズン | Omniheal | All | Party-wide glow |
| 14 | ザオラル | Zing | Single | Resurrection light |
| 15 | ザオリク | Kazing | Single | Full resurrection |

### Status Magic (状態異常呪文)

| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 20 | ラリホー | Snooze | Group | Sleeping bubbles |
| 21 | メダパニ | Fuddle | Group | Confusion swirls |
| 22 | マホトーン | Fizzle | Group | Silence effect |
| 23 | マヌーサ | Dazzle | Group | Illusion stars |

### Support Magic (補助呪文)

| ID | Name (JP) | Name (EN) | Target | Animation Style |
|----|-----------|-----------|--------|-----------------|
| 30 | スカラ | Buff | Single | Defense up glow |
| 31 | スクルト | Kabuff | All | Party defense glow |
| 32 | ピオリム | Accelerate | All | Speed up effect |
| 33 | バイキルト | Oomph | Single | Attack up flash |
| 34 | ルカニ | Sap | Single | Defense down |
| 35 | ルカナン | Kasap | Group | Group defense down |

## Animation Technical Details

### Frame Timing
- Base frame duration: 2-4 game frames (33-66ms at 60fps)
- Typical spell animation length: 30-90 frames (0.5-1.5 seconds)
- Hit confirmation delay: 15 frames

### Graphic Layers
Spell animations typically use:
- **OBJ Layer 0**: Main effect sprites (highest priority)
- **OBJ Layer 1**: Secondary particles
- **BG3**: Flash/overlay effects
- **CGRAM**: Palette cycling for glow effects

### Color Cycling
Many spells use HDMA-based palette cycling:
```
; Typical fire spell palette cycle
Palette_FireSpell:
    dw $001F, $02FF, $03FF, $07FF  ; Bright yellow-white
    dw $001F, $02BF, $037F, $071F  ; Orange-red
    dw $001F, $0258, $0314, $0410  ; Dark red
```

## Animation Data Locations (Research)

### Estimated ROM Banks
| Content | Banks | Size (est.) |
|---------|-------|-------------|
| Spell Effect Tiles | 35-37 | 96KB |
| Animation Scripts | 38-39 | 32KB |
| Palette Data | 40 | 16KB |
| Sound Effect Refs | 41 | 8KB |

### Memory Layout During Battle
```
VRAM Layout:
$0000-$3FFF: Background tiles (battle scene)
$4000-$5FFF: Monster graphics
$6000-$7FFF: Spell effect tiles (DMA loaded)

OAM Layout:
$00-$1F: Party member sprites
$20-$5F: Monster sprites  
$60-$7F: Spell effect sprites
```

## DW4 to DQ3r Spell Animation Mapping

### Direct Equivalents
| DW4 Spell | DQ3r Spell | Notes |
|-----------|------------|-------|
| BLAZE | Frizz | Same element, similar power |
| BLAZEMORE | Frizzle | Upgraded version |
| FIREBANE | Sizz | Group target fire |
| HEAL | Heal | Identical function |
| HEALMORE | Midheal | Identical function |
| HEALALL | Fullheal | Full HP restore |

### DW4-Only Spells (Need New Animations)
| DW4 Spell | Proposed DQ3r Match | Notes |
|-----------|---------------------|-------|
| TRANSFORM | None | Unique to DW4 |
| VIVIFY | Zing | Lower success rate |
| CHANCE | None | Random effect |

### DQ3r-Only Spells (No DW4 Equivalent)
| DQ3r Spell | Category | Notes |
|------------|----------|-------|
| Kafrizzle | Attack | Strongest fire |
| Kaswoosh | Attack | Strongest wind |
| Omniheal | Heal | Full party heal |

## Animation Script Example

Hypothetical animation script structure (needs verification):

```
; Frizz spell animation
anim_frizz:
    .db $08         ; 8 frames total
    .db $FF         ; No loop
    
    ; Frame 1: Start
    .db 04          ; Duration: 4 ticks
    .db $00         ; Tile offset
    .db 64, 80      ; X, Y position
    .db %00000000   ; Flags: normal
    
    ; Frame 2: Fireball appears
    .db 04
    .db $04
    .db 64, 70
    .db %00000000
    
    ; Frame 3-4: Fireball moves
    .db 04
    .db $08
    .db 64, 60
    .db %00000000
    
    ; ... continues ...
    
    ; Frame 8: Impact
    .db 08
    .db $20
    .db 64, 48
    .db %01000000   ; Priority high
```

## Research Notes

### Observations from Gameplay
1. All attack spells pause briefly before damage display
2. Healing spells always show upward particle motion
3. Status spells have shorter animations than attack spells
4. Boss-specific spells may have unique animations

### Reverse Engineering Approach
1. Set breakpoints on VRAM DMA transfers during spells
2. Trace OAM updates to find animation driver code
3. Identify animation data pointers from driver code
4. Document frame-by-frame data structure

## See Also

- [battle-animations.md](battle-animations.md) - General animation system
- [monster-graphics.md](monster-graphics.md) - Monster sprite data
- [../../../ROM-Map.md](../../../ROM-Map.md) - Complete ROM documentation
