# Game Boy/GBC Build Pipeline

The Game Boy pipeline supports Original Game Boy and Game Boy Color ROM development using the RGBDS assembler suite.

## Platform Specifications

### Game Boy (DMG)

| Property | Value |
|----------|-------|
| CPU | Sharp LR35902 @ 4.19 MHz |
| ROM | Up to 8 MB (with MBC) |
| RAM | 8 KB WRAM + 127B HRAM |
| VRAM | 8 KB |
| Resolution | 160×144 pixels |
| Colors | 4 shades of green |
| Sprites | 40 sprites, 10 per line |
| BG Layers | 1 background + 1 window |

### Game Boy Color

| Property | Value |
|----------|-------|
| CPU | Sharp LR35902 @ 8.38 MHz (double speed) |
| ROM | Up to 8 MB (with MBC) |
| RAM | 32 KB WRAM (8 banks) |
| VRAM | 16 KB (2 banks) |
| Resolution | 160×144 pixels |
| Colors | 32,768 available, 56 on screen |
| Sprites | 40 sprites, 10 per line |

## ROM Format

### Header ($0100-$014F)
```
$0100-$0103: Entry point (nop; jp $0150)
$0104-$0133: Nintendo logo (required)
$0134-$0143: Title (uppercase ASCII)
$0143:       CGB flag ($80=GBC, $C0=GBC only)
$0144-$0145: New licensee code
$0146:       SGB flag
$0147:       Cartridge type (MBC)
$0148:       ROM size
$0149:       RAM size
$014A:       Destination code
$014B:       Old licensee code
$014C:       ROM version
$014D:       Header checksum
$014E-$014F: Global checksum
```

### Memory Bank Controllers

| Type | Code | PRG Banks | RAM | Features |
|------|------|-----------|-----|----------|
| ROM only | $00 | 2 | - | 32KB max |
| MBC1 | $01-03 | 128 | 32KB | Most common |
| MBC2 | $05-06 | 16 | 512×4 | Built-in RAM |
| MBC3 | $0F-13 | 128 | 32KB | RTC support |
| MBC5 | $19-1E | 512 | 128KB | Rumble option |

## Graphics

### Tile Format (2bpp)
Each 8×8 tile uses 16 bytes:
```
Row 0: [low_byte] [high_byte]
Row 1: [low_byte] [high_byte]
...
Row 7: [low_byte] [high_byte]

Pixel value = (high_bit << 1) | low_bit
DMG: 0=white, 1=light, 2=dark, 3=black
GBC: 0-3 indexes into palette
```

### Palettes

**DMG Palettes** (1 byte each):
```
BGP  ($FF47): Background palette
OBP0 ($FF48): Sprite palette 0
OBP1 ($FF49): Sprite palette 1

Bits 7-6: Color 3
Bits 5-4: Color 2
Bits 3-2: Color 1
Bits 1-0: Color 0
```

**GBC Palettes** (2 bytes per color, 15-bit BGR):
```
Bit:  15  14-10  9-5   4-0
      X   Blue   Green Red

8 BG palettes × 4 colors = 64 bytes
8 OBJ palettes × 4 colors = 64 bytes
```

### Tilemaps
- Background: 32×32 tiles (256×256 pixels)
- Window: 32×32 tiles, fixed position
- GBC adds attribute byte per tile:
  - Bit 7: BG-to-OAM priority
  - Bit 6: Vertical flip
  - Bit 5: Horizontal flip
  - Bit 4: Tile VRAM bank
  - Bit 2-0: Palette number

## Assembler Configuration

### RGBDS Setup
```bash
# Assemble
rgbasm -o main.o src/main.asm

# Link
rgblink -o game.gb -m game.map -n game.sym main.o

# Fix header (checksums, logo)
rgbfix -v -p 0xFF game.gb
```

### RGBDS Directives
```asm
INCLUDE "hardware.inc"  ; Include file
INCBIN "data.bin"       ; Binary include

SECTION "Header", ROM0[$100]
	nop
	jp Start

SECTION "Main", ROM0[$150]
Start:
	; Code here

SECTION "Bank1", ROMX[$4000], BANK[1]
	; Banked ROM

SECTION "Variables", WRAM0
counter: ds 1           ; Reserve 1 byte
buffer:  ds 256         ; Reserve 256 bytes
```

### Macros
```asm
; Wait for VBlank
MACRO WaitVBlank
.wait\@
	ldh a, [rLY]
	cp 144
	jr c, .wait\@
ENDM

; Load 16-bit value into register pair
MACRO ld16
	ld \1, LOW(\2)
	ld \1 + 1, HIGH(\2)
ENDM
```

## Asset Pipeline

### Extraction
```bash
# Extract tiles to PNG
gameinfo extract-gb-gfx --rom game.gb --output tiles/

# Extract with specific VRAM address
gameinfo extract-gb-gfx --rom game.gb --offset 0x8000 --tiles 256

# Extract palettes (GBC)
gameinfo extract-gb-pal --rom game.gbc --output palettes/

# Extract tilemaps
gameinfo extract-gb-map --rom game.gb --output maps/
```

### Conversion
```bash
# PNG to GB tiles (2bpp)
gameinfo png-to-gb --input sprites.png --output sprites.2bpp

# JSON palette to GBC format
gameinfo json-to-gb-pal --input colors.json --output colors.pal

# Tiled TMX to GB tilemap
gameinfo tmx-to-gb --input level.tmx --output level.bin
```

### Build Integration
```json
{
	"platform": "gb",
	"gbcMode": true,
	"assets": {
		"graphics": [
			{
				"source": "assets/sprites/*.png",
				"output": "build/gfx/",
				"bpp": 2
			}
		],
		"palettes": [
			{
				"source": "assets/palettes/*.json",
				"output": "build/pal/",
				"format": "gbc"
			}
		]
	}
}
```

## Memory Map

```
$0000-$3FFF  ROM Bank 0 (fixed)
$4000-$7FFF  ROM Bank N (switchable)
$8000-$97FF  Tile Data (384 tiles)
$9800-$9BFF  Tilemap 0 (BG)
$9C00-$9FFF  Tilemap 1 (Window)
$A000-$BFFF  External RAM (cartridge)
$C000-$CFFF  WRAM Bank 0
$D000-$DFFF  WRAM Bank N (GBC: 1-7)
$FE00-$FE9F  OAM (40 sprites × 4 bytes)
$FF00-$FF7F  I/O registers
$FF80-$FFFE  HRAM (127 bytes)
$FFFF        Interrupt Enable
```

## Registers

### LCD Control ($FF40)
| Bit | Purpose |
|-----|---------|
| 7 | LCD enable |
| 6 | Window tile map |
| 5 | Window enable |
| 4 | BG/Window tile data |
| 3 | BG tile map |
| 2 | Sprite size (8×8/8×16) |
| 1 | Sprite enable |
| 0 | BG/Window enable |

### STAT Register ($FF41)
| Bit | Purpose |
|-----|---------|
| 6 | LYC=LY interrupt |
| 5 | Mode 2 interrupt |
| 4 | Mode 1 interrupt |
| 3 | Mode 0 interrupt |
| 2 | LYC=LY flag |
| 1-0 | Mode (0-3) |

## Sound

### Channels
1. **Square 1**: Sweep, duty, envelope
2. **Square 2**: Duty, envelope
3. **Wave**: 32-sample waveform
4. **Noise**: LFSR-based

### Registers ($FF10-$FF26)
- NRx0: Sweep (ch1 only)
- NRx1: Length/duty
- NRx2: Volume envelope
- NRx3: Frequency low
- NRx4: Frequency high/trigger

## Example Project Structure

```
my-gb-game/
├── build.config.json
├── Makefile
├── src/
│   ├── main.asm
│   ├── init.asm
│   ├── graphics.asm
│   └── data/
│       ├── tiles.asm
│       └── maps.asm
├── include/
│   ├── hardware.inc
│   └── macros.inc
├── assets/
│   ├── gfx/
│   │   ├── player.png
│   │   └── tileset.png
│   ├── pal/
│   │   └── main.json
│   └── maps/
│       └── level1.tmx
└── build/
	├── game.gb
	└── assets/
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
