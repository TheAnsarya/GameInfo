# Soul Blazer Graphics Formats

Comprehensive documentation of all graphics formats used in Soul Blazer (SNES).

## 4BPP Tile Format

Soul Blazer uses standard SNES 4BPP (4 bits per pixel) tiles for most graphics.

### Structure

Each 8×8 pixel tile is stored as 32 bytes in bitplane format:

| Offset | Size | Content |
|--------|------|---------|
| $00-$0F | 16 bytes | Bitplanes 0 & 1 (interleaved) |
| $10-$1F | 16 bytes | Bitplanes 2 & 3 (interleaved) |

### Bitplane Layout

```
Row N:
  Byte 0 + N*2:   Bitplane 0 (bits 0)
  Byte 1 + N*2:   Bitplane 1 (bits 1)
  Byte 16 + N*2:  Bitplane 2 (bits 2)
  Byte 17 + N*2:  Bitplane 3 (bits 3)
```

### Pixel Reconstruction

For each pixel at position (x, y) within the 8×8 tile:

```python
def get_pixel(tile_data: bytes, x: int, y: int) -> int:
    """Get 4-bit palette index for pixel (x,y)"""
    bit_mask = 0x80 >> x
    
    bp0 = (tile_data[y * 2 + 0] & bit_mask) >> (7 - x)
    bp1 = (tile_data[y * 2 + 1] & bit_mask) >> (7 - x)
    bp2 = (tile_data[y * 2 + 16] & bit_mask) >> (7 - x)
    bp3 = (tile_data[y * 2 + 17] & bit_mask) >> (7 - x)
    
    return (bp3 << 3) | (bp2 << 2) | (bp1 << 1) | bp0
```

### Memory Layout

```
Tile 0:    $0000-$001F (32 bytes)
Tile 1:    $0020-$003F (32 bytes)
...
Tile 255:  $1FE0-$1FFF (32 bytes)
```

A full 256-tile tileset occupies 8,192 bytes ($2000).

---

## 2BPP Tile Format

Used for some menu graphics and low-color elements.

### Structure

Each 8×8 pixel tile is stored as 16 bytes:

| Offset | Size | Content |
|--------|------|---------|
| $00-$0F | 16 bytes | Bitplanes 0 & 1 (interleaved) |

Only 4 colors per palette (indices 0-3).

---

## Tilemap Format

Tilemaps define the arrangement of tiles on screen.

### Entry Format (2 bytes)

```
  Byte 0: Tile Index (low 8 bits)
  Byte 1: Attributes
    Bit 7:   V-Flip (vertical flip)
    Bit 6:   H-Flip (horizontal flip)
    Bit 5:   Priority (0=low, 1=high)
    Bit 4-2: Palette (0-7)
    Bit 1-0: Tile Index high bits (for 10-bit tile index)
```

### Complete Word Format

```
vhopppcc cccccccc
│││││││└────────── Tile index (10 bits: 0-1023)
│││└└└───────────── Palette (3 bits: 0-7)
││└──────────────── Priority
│└───────────────── H-flip
└────────────────── V-flip
```

### Screen Size

| Mode | Tiles | Bytes | VRAM |
|------|-------|-------|------|
| 32×32 | 1,024 | 2,048 | $800 |
| 64×32 | 2,048 | 4,096 | $1000 |
| 32×64 | 2,048 | 4,096 | $1000 |
| 64×64 | 4,096 | 8,192 | $2000 |

---

## Palette Format

SNES 15-bit BGR color format.

### Color Entry (2 bytes)

```
  Little-endian word:
    Bits 0-4:   Red (0-31)
    Bits 5-9:   Green (0-31)
    Bits 10-14: Blue (0-31)
    Bit 15:     Unused (always 0)
```

### Byte Format

```
  Byte 0: gggrrrrr
  Byte 1: 0bbbbbgg
```

### Palette Layout

Each palette contains 16 colors (32 bytes):

| Index | Purpose |
|-------|---------|
| 0 | Transparent |
| 1-15 | Visible colors |

### Full CGRAM Layout

```
Palette 0: $00-$1F (sprite palette 0 / BG palette 0)
Palette 1: $20-$3F
...
Palette 7: $E0-$FF
```

Total: 256 colors, 512 bytes.

### Conversion Formulas

```python
def snes_to_rgb(word: int) -> tuple[int, int, int]:
    """Convert SNES 15-bit color to 24-bit RGB"""
    r = (word & 0x1F) << 3
    g = ((word >> 5) & 0x1F) << 3
    b = ((word >> 10) & 0x1F) << 3
    return (r, g, b)

def rgb_to_snes(r: int, g: int, b: int) -> int:
    """Convert 24-bit RGB to SNES 15-bit color"""
    return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)
```

---

## Sprite (OAM) Format

### OAM Table 1 Entry (4 bytes per sprite)

| Byte | Content |
|------|---------|
| 0 | X position (low 8 bits) |
| 1 | Y position |
| 2 | Tile index |
| 3 | Attributes |

### Attribute Byte

```
vhoopppN
│││││││└── Name table select (tile index bit 8)
│││└└└──── Palette (0-7, uses palettes 8-15)
││└─────── Priority (0-3)
│└──────── H-flip
└───────── V-flip
```

### OAM Table 2 (32 bytes)

High bits for 128 sprites, 2 bits per sprite:

```
  Bit 0: X position bit 8 (sign extend)
  Bit 1: Size select (0=small, 1=large)
```

### Sprite Sizes

Soul Blazer uses Object Size Select 2:

| Size | Small | Large |
|------|-------|-------|
| 0 | 8×8 | 16×16 |
| 1 | 8×8 | 32×32 |
| 2 | 8×8 | 64×64 |
| 3 | 16×16 | 32×32 |
| **4** | **16×16** | **32×32** |
| 5 | 32×32 | 64×64 |

---

## Metasprite Format

Complex sprites are built from multiple OAM entries.

### Metasprite Header

| Offset | Size | Content |
|--------|------|---------|
| $00 | 1 | Number of parts |
| $01 | 1 | Bounding box width |
| $02 | 1 | Bounding box height |
| $03 | 1 | Flags |

### Metasprite Part Entry (4 bytes)

| Offset | Size | Content |
|--------|------|---------|
| $00 | 1 | X offset (signed) |
| $01 | 1 | Y offset (signed) |
| $02 | 1 | Tile index |
| $03 | 1 | Attributes |

---

## Animation Format

### Animation Header

| Offset | Size | Content |
|--------|------|---------|
| $00 | 1 | Frame count |
| $01 | 1 | Loop start frame |
| $02 | 2 | Flags |

### Frame Entry (4 bytes)

| Offset | Size | Content |
|--------|------|---------|
| $00 | 1 | Duration (frames) |
| $01 | 1 | Metasprite index |
| $02 | 1 | X velocity |
| $03 | 1 | Y velocity |

---

## Compressed Graphics

Some graphics use RLE compression.

### RLE Header

| Offset | Size | Content |
|--------|------|---------|
| $00-$01 | 2 | Decompressed size |
| $02+ | var | Compressed data |

### RLE Commands

```
$00-$7F: Copy next (N+1) bytes literally
$80-$FF: Repeat next byte (N-$7E) times
```

### Example

```
Input:  05 41 42 43 44 45 46  84 00
Output: 41 42 43 44 45 46 00 00 00 00 00 00
        (6 literal bytes, then 6 zeros)
```

---

## Bank Layout

### Tileset Banks ($10-$14)

| Bank | Content | Size |
|------|---------|------|
| $10 | Act 1 tilesets | 32 KB |
| $11 | Act 2 tilesets | 32 KB |
| $12 | Act 3 tilesets | 32 KB |
| $13 | Act 4-5 tilesets | 32 KB |
| $14 | Act 6 + shared | 32 KB |

### Sprite Banks ($15-$19)

| Bank | Content | Size |
|------|---------|------|
| $15 | Player sprites | 32 KB |
| $16 | NPC sprites | 32 KB |
| $17 | Enemy sprites 1 | 32 KB |
| $18 | Enemy sprites 2 | 32 KB |
| $19 | Boss sprites | 32 KB |

---

## See Also

- [ROM Map](rom-map.md)
- [RAM Map](ram-map.md)
- [Audio Formats](audio-formats.md)
- [Data Structures](data-structures.md)
