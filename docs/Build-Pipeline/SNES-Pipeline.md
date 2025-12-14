# SNES Build Pipeline

The SNES pipeline supports Super Nintendo and Super Famicom ROM development using the asar assembler.

## Platform Specifications

| Property | Value |
|----------|-------|
| CPU | Ricoh 5A22 (65816) |
| Clock | 3.58 MHz (fast) / 2.68 MHz (slow) |
| ROM | Up to 6 MB (ExHiROM) |
| RAM | 128 KB WRAM |
| VRAM | 64 KB |
| Resolution | 256×224 (NTSC) / 256×239 (PAL) |
| Colors | 32,768 available, 256 on screen |
| Sprites | 128 sprites, 32 per scanline |
| BG Layers | Up to 4 layers |

## ROM Formats

### SFC Format (Headerless)
Raw ROM data with no external header:
- LoROM: Data at $8000-$FFFF per bank
- HiROM: Data at $0000-$FFFF per bank
- Internal header at $00FFC0 (LoROM) or $00FFB0 (HiROM)

### SMC Format (Headered)
512-byte copier header + ROM data:
```
Bytes 0-1:   File size (512-byte blocks)
Byte 2:      Flags
Bytes 3-511: Reserved (usually zero)
```

### Memory Mapping

**LoROM** (Mode 20):
```
Bank $00-$7D: $8000-$FFFF = ROM
Bank $80-$FD: $8000-$FFFF = ROM (mirror)
```

**HiROM** (Mode 21):
```
Bank $40-$7D: $0000-$FFFF = ROM
Bank $C0-$FD: $0000-$FFFF = ROM (mirror)
```

## Graphics

### Tile Formats

**2bpp (Mode 0, Layers 0-3)**
- 16 bytes per 8×8 tile
- 4 colors per palette

**4bpp (Modes 1, 2)**
- 32 bytes per 8×8 tile
- 16 colors per palette
- Interleaved bitplanes: [bp0+bp1] [bp2+bp3]

**8bpp (Mode 3, 4, 7)**
- 64 bytes per 8×8 tile
- 256 colors

### Palette Format (15-bit BGR)
```
Bit:  15  14-10  9-5   4-0
      0   Blue   Green Red

Each color = 2 bytes (little-endian)
256 colors = 512 bytes palette RAM
```

### Sprites
- 8×8, 16×16, 32×32, 64×64 sizes
- 128 OAM entries + 32 bytes extended
- Always 4bpp (16 colors from palette 128-255)

## Video Modes

| Mode | BG1 | BG2 | BG3 | BG4 | Features |
|------|-----|-----|-----|-----|----------|
| 0 | 2bpp | 2bpp | 2bpp | 2bpp | 4 layers, 4 colors each |
| 1 | 4bpp | 4bpp | 2bpp | - | Most common |
| 2 | 4bpp | 4bpp | - | - | Offset-per-tile |
| 3 | 8bpp | 4bpp | - | - | 256-color BG1 |
| 4 | 8bpp | 2bpp | - | - | Offset + 256 color |
| 5 | 4bpp | 2bpp | - | - | 512×224 hires |
| 6 | 4bpp | - | - | - | 512×224 offset |
| 7 | 8bpp | - | - | - | Rotation/scaling |

## Assembler Configuration

### asar Setup
```bash
# Simple assembly
asar main.asm output.smc

# With patches
asar patch.asm baserom.smc
```

### asar Directives
```asm
lorom           ; Set LoROM mapping
hirom           ; Set HiROM mapping

org $008000     ; Set PC to address
base $80        ; Set bank base

db $00          ; Define byte
dw $0000        ; Define word (16-bit)
dl $000000      ; Define long (24-bit)

incbin "data.bin"           ; Include binary
incbin "data.bin":$100:$50  ; Offset $100, length $50

!define = $1234  ; Define constant
```

### Macros
```asm
macro LoadPalette(source, dest, count)
	rep #$20
	lda.w #<source>
	sta $4302
	lda.w #<source>>>16
	sta $4304
	lda.w #<count>*2
	sta $4305
	sep #$20
	lda #<dest>
	sta $2121
	lda #$22
	sta $4301
	lda #$01
	sta $420B
endmacro
```

## Asset Pipeline

### Extraction
```bash
# Extract tiles (auto-detect bpp)
gameinfo extract-snes-gfx --rom game.sfc --output tiles/

# Extract with specific settings
gameinfo extract-snes-gfx --rom game.sfc --offset 0x10000 --bpp 4 --tiles 256

# Extract palettes
gameinfo extract-snes-pal --rom game.sfc --output palettes/

# Extract SPC audio
gameinfo extract-spc --rom game.sfc --output audio/
```

### Conversion
```bash
# PNG to SNES tiles
gameinfo png-to-snes --input sprite.png --bpp 4 --output sprite.bin

# JSON palette to SNES format
gameinfo json-to-snes-pal --input colors.json --output colors.bin

# Tiled TMX to SNES tilemap
gameinfo tmx-to-snes --input level.tmx --output level.bin
```

### Build Integration
```json
{
	"platform": "snes",
	"assets": {
		"graphics": [
			{
				"source": "assets/sprites/*.png",
				"output": "build/gfx/",
				"bpp": 4,
				"tileSize": [8, 8]
			}
		],
		"palettes": [
			{
				"source": "assets/palettes/*.json",
				"output": "build/pal/",
				"format": "bgr15"
			}
		]
	}
}
```

## Memory Map

```
$00-$3F:$0000-$1FFF  LowRAM (shadow)
$00-$3F:$2000-$20FF  PPU registers
$00-$3F:$2100-$213F  PPU registers
$00-$3F:$2140-$2143  APU ports
$00-$3F:$4000-$41FF  CPU registers
$00-$3F:$4200-$44FF  CPU/DMA registers
$00-$3F:$8000-$FFFF  LoROM banks
$40-$7D:$0000-$FFFF  HiROM banks
$7E:$0000-$FFFF      WRAM (128KB)
$7F:$0000-$FFFF      WRAM continued
```

## Enhancement Chips

| Chip | Purpose | Games |
|------|---------|-------|
| SA-1 | 10MHz 65816 coprocessor | Kirby Super Star |
| SuperFX | 3D/bitmap processor | Star Fox |
| DSP-1/2/3/4 | Math coprocessor | Pilotwings |
| SDD-1 | Decompression | Star Ocean |
| Cx4 | Wireframe 3D | Mega Man X2/X3 |

## Example Project Structure

```
my-snes-game/
├── build.config.json
├── src/
│   ├── main.asm
│   ├── init.asm
│   ├── ppu.asm
│   └── data/
│       ├── graphics.asm
│       └── maps.asm
├── assets/
│   ├── gfx/
│   │   ├── player.png
│   │   └── tiles.png
│   ├── pal/
│   │   └── main.json
│   └── maps/
│       └── world1.tmx
└── build/
	├── game.sfc
	└── assets/
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
