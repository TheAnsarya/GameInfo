# VRAM Analysis Guide

How to analyze Video RAM (VRAM) contents to understand graphics structure.

## 🎯 Overview

SNES VRAM holds:
- Background tile graphics (4bpp/2bpp)
- Sprite tile graphics (4bpp)
- Tilemaps (screen layout)

Understanding VRAM layout helps identify what graphics are loaded and where they come from.

## 📐 VRAM Structure

### VRAM Size and Layout

Total: 64KB ($0000-$FFFF)

Typical allocation:
```
$0000-$3FFF: BG1/BG2 tiles (16KB each)
$4000-$5FFF: BG3 tiles (8KB)
$6000-$7FFF: Sprite tiles (8KB)
$8000-$BFFF: More tiles or tilemaps
$C000-$FFFF: Tilemaps (2KB each × 4)
```

Note: Layout varies by game!

## 🔧 Viewing VRAM in Emulators

### Mesen-S

1. **Tools → PPU Viewer**
2. Select **Tiles** tab
3. Configure:
   - **Palette**: Select palette index
   - **BPP**: 4bpp (most common) or 2bpp
   - **Columns**: 16 or 32

### bsnes-plus

1. **Tools → VRAM Viewer**
2. Adjust bit depth and palette
3. Use **Address** to jump to specific location

## 📍 Analyzing Battle Graphics

### Step 1: Enter Battle State

1. Load game with battle save state
2. Let battle fully load (all sprites visible)

### Step 2: Capture VRAM Snapshot

**Mesen-S:**
1. Open Memory Viewer
2. Select VRAM
3. File → Export to save binary dump

**bsnes-plus:**
1. Tools → Memory Export
2. Select VRAM region

### Step 3: Identify Tile Locations

Open PPU Viewer and note:
- Monster sprites start address
- Spell effect tiles address
- Battle UI tiles address

### Step 4: Compare Before/After

1. Save VRAM before spell cast
2. Cast spell
3. Save VRAM after animation starts
4. Diff the two dumps to find new tiles

## 📊 VRAM Address Mapping

### Background Tiles

BG tile address is set by PPU registers:
```
$2107: BG1 tilemap address
$2108: BG2 tilemap address
$2109: BG3 tilemap address
$210A: BG4 tilemap address
$210B: BG1/2 tile data address
$210C: BG3/4 tile data address
```

### Sprite Tiles

Sprite tile address set by:
```
$2101: Object size and tile base address
```

## 🔬 Finding What Loaded Where

### Method: DMA + VRAM Cross-Reference

1. Set breakpoint on VRAM write ($2118/$2119)
2. Trigger graphics load
3. Note PC address when break hits
4. Trace back to find source data

### Method: Compare Tile Patterns

1. Export VRAM tiles as image
2. Use hex editor to view ROM
3. Search for matching bit patterns
4. Account for compression if needed

## 📐 Tile Format Reference

### 4bpp Format (16 colors)

```
Bytes per 8x8 tile: 32

Structure:
Rows 0-7: Bitplanes 0,1 interleaved (16 bytes)
Rows 0-7: Bitplanes 2,3 interleaved (16 bytes)
```

### 2bpp Format (4 colors)

```
Bytes per 8x8 tile: 16

Structure:
Rows 0-7: Bitplanes 0,1 interleaved (16 bytes)
```

## 📝 VRAM Analysis Template

```markdown
## VRAM Analysis: [Event/Scene]

### Snapshot Info
- Game State: [Location in game]
- Frame: [Frame number if known]

### BG Layer Mapping
| Layer | Tilemap Addr | Tile Data Addr | Purpose |
|-------|--------------|----------------|---------|
| BG1 | $____ | $____ | [What it displays] |
| BG2 | $____ | $____ | [What it displays] |
| BG3 | $____ | $____ | [What it displays] |

### Sprite Mapping
- Base Address: $____
- Tile Range: $__ - $__
- Contents: [Monster sprites, effects, etc.]

### Notable Addresses
| VRAM Addr | Size | Contents |
|-----------|------|----------|
| $____ | $____ | [Description] |

### Observations
[What you learned about the graphics layout]
```

## 🎮 Game-Specific VRAM Maps

### DQ3r Battle VRAM (Estimated)

```
$0000-$1FFF: Battle background tiles
$2000-$3FFF: Monster sprites (current party enemy)
$4000-$5FFF: Character sprites
$6000-$6FFF: Spell effect tiles (loaded dynamically)
$7000-$7FFF: Battle UI tiles
$8000-$9FFF: Battle tilemaps
```

Note: These are estimates - verify with actual analysis!

## ⚠️ Common Issues

### Tiles Look Scrambled
- Wrong BPP setting in viewer
- Wrong palette selected
- Tiles are interleaved/planar differently

### Can't Find Expected Graphics
- Graphics may be compressed in ROM
- May be constructed from multiple sources
- Could be generated procedurally (rare)

### Colors Wrong
- Each tile references a palette index
- Palette may change during animation
- Check CGRAM viewer for actual colors

## 🔗 Related Guides

- [DMA Tracing](dma-tracing.md) - Find what loads VRAM
- [DQ3r Animation Extraction](dq3r-animation-extraction.md) - Full workflow
