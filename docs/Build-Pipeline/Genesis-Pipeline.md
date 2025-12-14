# Genesis/Mega Drive Build Pipeline

The Genesis pipeline supports Sega Genesis and Mega Drive ROM development using the asm68k assembler.

## Platform Specifications

| Property | Value |
|----------|-------|
| CPU | Motorola 68000 @ 7.67 MHz |
| Sound CPU | Zilog Z80 @ 3.58 MHz |
| ROM | Up to 4 MB |
| RAM | 64 KB main + 8 KB Z80 |
| VRAM | 64 KB |
| Resolution | 320×224 or 256×224 |
| Colors | 512 available, 64 on screen |
| Sprites | 80 sprites, 20 per scanline |
| BG Layers | 2 scrolling planes + window |

## ROM Formats

### BIN Format
Raw ROM data, starts at $000000:
```
$000100: Entry point (after vectors)
$000000-$0000FF: 68000 exception vectors
$000100-$0001FF: ROM header
```

### SMD Format (Interleaved)
Super Magic Drive copier format:
- 512-byte header
- Data interleaved in 16KB blocks
- Must deinterleave before use

### ROM Header ($000100-$0001FF)
```
$100-$10F: Console name ("SEGA GENESIS    ")
$110-$11F: Copyright
$120-$14F: Domestic name
$150-$17F: International name
$180-$181: ROM type
$182-$183: Product code
$184-$185: Checksum
$186-$195: I/O support
$1A0-$1A3: ROM start address
$1A4-$1A7: ROM end address
$1A8-$1AF: RAM info
$1F0-$1FF: Region codes
```

## Graphics

### Tile Format (4bpp Planar)
Each 8×8 tile uses 32 bytes:
```
4 bits per pixel, planar arrangement
Row format: 4 bytes = 8 pixels
32 bytes total per tile

Pixel value 0-15 indexes into palette
```

### Palette Format (9-bit BGR)
```
Bit:  15-12  11-9   8-6   5-3   2-0
      Unused Blue   Unused Green Unused Red

Each color = 2 bytes (big-endian)
4 palettes × 16 colors = 128 bytes CRAM

Values: 0, 2, 4, 6, 8, A, C, E (even only)
```

### VDP Planes
- **Plane A**: Foreground scrolling plane
- **Plane B**: Background scrolling plane
- **Window**: Non-scrolling overlay
- **Sprites**: 80 hardware sprites

### Tilemap Format
```
Bit 15:    Priority
Bit 14-13: Palette (0-3)
Bit 12:    Vertical flip
Bit 11:    Horizontal flip
Bit 10-0:  Tile index (0-2047)
```

## Assembler Configuration

### asm68k Setup
```bash
# Assemble single file
asm68k /p main.asm, game.bin

# With include paths
asm68k /i include/ /p main.asm, game.bin

# Listing output
asm68k /l listing.txt /p main.asm, game.bin
```

### asm68k Directives
```asm
	include "header.asm"    ; Include source
	incbin "data.bin"       ; Include binary
	
	org $000000             ; Set origin
	even                    ; Align to word
	
	dc.b $00                ; Define byte
	dc.w $0000              ; Define word
	dc.l $00000000          ; Define long
	
	rs.b 1                  ; Reserve byte
	rs.w 1                  ; Reserve word
```

### Macros
```asm
VDPCommand macro addr, type, rwd
	move.l #($\type\<<30)|(((\addr)&$3FFF)<<16)|((\rwd)<<6)|((\addr)>>14),($C00004).l
	endm

LoadTiles macro source, dest, count
	VDPCommand \dest, VRAM, DMA
	lea \source, a0
	move.w #\count-1, d0
.loop:
	move.l (a0)+, ($C00000).l
	dbf d0, .loop
	endm
```

## Asset Pipeline

### Extraction
```bash
# Extract tiles
gameinfo extract-gen-gfx --rom game.bin --output tiles/

# Extract specific tile range
gameinfo extract-gen-gfx --rom game.bin --offset 0x20000 --tiles 512

# Extract palettes from CRAM dump
gameinfo extract-gen-pal --rom game.bin --output palettes/

# Convert SMD to BIN
gameinfo smd-to-bin --input game.smd --output game.bin
```

### Conversion
```bash
# PNG to Genesis tiles (4bpp planar)
gameinfo png-to-gen --input sprites.png --output sprites.bin

# JSON to Genesis palette (9-bit BGR)
gameinfo json-to-gen-pal --input colors.json --output colors.bin

# Tiled TMX to Genesis tilemap
gameinfo tmx-to-gen --input level.tmx --output level.bin
```

### Build Integration
```json
{
	"platform": "genesis",
	"assets": {
		"graphics": [
			{
				"source": "assets/sprites/*.png",
				"output": "build/gfx/",
				"bpp": 4,
				"format": "planar"
			}
		],
		"palettes": [
			{
				"source": "assets/palettes/*.json",
				"output": "build/pal/",
				"format": "bgr9"
			}
		]
	}
}
```

## Memory Map

```
68000 Address Space:
$000000-$3FFFFF  ROM (up to 4MB)
$A00000-$A0FFFF  Z80 address space
$A10000-$A1001F  I/O registers
$A11100          Z80 bus request
$A11200          Z80 reset
$C00000-$C00003  VDP data port
$C00004-$C00007  VDP control port
$C00008          H/V counter
$E00000-$FFFFFF  RAM (64KB, mirrored)

VDP VRAM ($0000-$FFFF):
$0000-$BFFF  Tile patterns (variable)
$C000-$CFFF  Plane A tilemap (typical)
$E000-$EFFF  Plane B tilemap (typical)
$F000-$F7FF  Window tilemap (typical)
$F800-$FFFF  Sprite attribute table
```

## VDP Registers

| Register | Purpose |
|----------|---------|
| $00 | Mode register 1 |
| $01 | Mode register 2 |
| $02 | Plane A name table |
| $03 | Window name table |
| $04 | Plane B name table |
| $05 | Sprite table address |
| $07 | Background color |
| $0A | H interrupt counter |
| $0B | Mode register 3 |
| $0C | Mode register 4 |
| $0D | H scroll table |
| $0F | Auto increment |
| $10 | Plane size |

## Sound

### YM2612 (FM Synthesis)
- 6 FM channels
- 4 operators per channel
- Various algorithms

### SN76489 (PSG)
- 3 tone channels
- 1 noise channel
- Shared with Z80

### Z80 Sound Driver
- Runs independently
- Communicates via shared memory
- Common formats: VGM, XGM, SMPS

## Example Project Structure

```
my-genesis-game/
├── build.config.json
├── src/
│   ├── main.asm
│   ├── header.asm
│   ├── vdp.asm
│   ├── sound/
│   │   └── driver.asm
│   └── data/
│       ├── graphics.asm
│       └── levels.asm
├── assets/
│   ├── gfx/
│   │   ├── player.png
│   │   └── enemies.png
│   ├── pal/
│   │   └── main.json
│   └── sound/
│       └── music.vgm
└── build/
	├── game.bin
	└── assets/
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
