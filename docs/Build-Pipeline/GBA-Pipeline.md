# GBA Build Pipeline

The GBA pipeline supports Game Boy Advance ROM development using the devkitARM toolchain.

## Platform Specifications

| Property | Value |
|----------|-------|
| CPU | ARM7TDMI @ 16.78 MHz |
| ROM | Up to 32 MB |
| EWRAM | 256 KB (external) |
| IWRAM | 32 KB (internal, fast) |
| VRAM | 96 KB |
| Resolution | 240×160 pixels |
| Colors | 32,768 available |
| Sprites | 128 sprites |
| BG Layers | Up to 4 layers |

## ROM Format

### Header ($0000-$00BF)
```
$000-$003: ROM entry point (ARM branch)
$004-$09F: Nintendo logo (required)
$0A0-$0AB: Game title (12 chars)
$0AC-$0AF: Game code (4 chars)
$0B0-$0B1: Maker code
$0B2:      Fixed value ($96)
$0B3:      Main unit code
$0B4:      Device type
$0B5-$0BB: Reserved
$0BC:      Software version
$0BD:      Header checksum
$0BE-$0BF: Reserved
```

### Save Types

| Type | Size | Games |
|------|------|-------|
| SRAM | 32KB | Simple saves |
| EEPROM | 512B/8KB | Common |
| Flash | 64KB/128KB | Large saves |

## Graphics

### Video Modes

| Mode | Type | BG0 | BG1 | BG2 | BG3 |
|------|------|-----|-----|-----|-----|
| 0 | Text | Text | Text | Text | Text |
| 1 | Mixed | Text | Text | Affine | - |
| 2 | Affine | - | - | Affine | Affine |
| 3 | Bitmap | 240×160×16bpp | - | - | - |
| 4 | Bitmap | 240×160×8bpp ×2 | - | - | - |
| 5 | Bitmap | 160×128×16bpp ×2 | - | - | - |

### Tile Formats

**4bpp (16 colors)**
```
32 bytes per 8×8 tile
Each byte = 2 pixels (packed nibbles)
16 palettes × 16 colors available
```

**8bpp (256 colors)**
```
64 bytes per 8×8 tile
Each byte = 1 pixel
Single 256-color palette
```

### Palette Format (15-bit BGR)
```
Bit:  15  14-10  9-5   4-0
      X   Blue   Green Red

BG Palette:  256 colors @ $05000000
OBJ Palette: 256 colors @ $05000200
```

### Sprites (OAM)
Each sprite uses 8 bytes (6 used + 2 affine):
```
Attr0 (2 bytes):
  Bits 13-14: Shape (square/horizontal/vertical)
  Bit 12:     Color mode (4bpp/8bpp)
  Bit 9:      Affine enable
  Bits 0-7:   Y coordinate

Attr1 (2 bytes):
  Bits 14-15: Size
  Bit 13:     V flip (non-affine)
  Bit 12:     H flip (non-affine)
  Bits 0-8:   X coordinate

Attr2 (2 bytes):
  Bits 12-15: Palette (4bpp)
  Bit 11-10:  Priority
  Bits 0-9:   Tile index
```

### Affine Transformations
```
Matrix: [PA PB]    Reference point (X0, Y0)
        [PC PD]

PA, PB, PC, PD: 16-bit signed 8.8 fixed-point
X0, Y0: 28-bit signed 20.8 fixed-point

Rotation: PA=cos(θ), PB=-sin(θ), PC=sin(θ), PD=cos(θ)
Scale:    PA=sx, PD=sy, PB=PC=0
```

## Compiler Configuration

### devkitARM Setup
```bash
# Set environment
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export PATH=$DEVKITARM/bin:$PATH

# Compile C code
arm-none-eabi-gcc -mthumb -mthumb-interwork -o main.o -c main.c

# Assemble
arm-none-eabi-as -mthumb -o startup.o startup.s

# Link
arm-none-eabi-ld -T gba.ld -o game.elf main.o startup.o

# Convert to GBA ROM
arm-none-eabi-objcopy -O binary game.elf game.gba

# Fix header
gbafix game.gba
```

### Linker Script (gba.ld)
```
MEMORY {
	rom   : ORIGIN = 0x08000000, LENGTH = 32M
	iwram : ORIGIN = 0x03000000, LENGTH = 32K
	ewram : ORIGIN = 0x02000000, LENGTH = 256K
}

SECTIONS {
	.text : { *(.text) } > rom
	.rodata : { *(.rodata) } > rom
	.data : { *(.data) } > iwram AT > rom
	.bss : { *(.bss) } > iwram
}
```

### ARM/Thumb Interworking
```c
// Force ARM mode
__attribute__((target("arm")))
void fast_function(void) { }

// Force Thumb mode (default)
__attribute__((target("thumb")))
void small_function(void) { }

// In IWRAM (fast)
__attribute__((section(".iwram")))
void critical_function(void) { }
```

## Asset Pipeline

### Extraction
```bash
# Extract tiles (auto-detect format)
gameinfo extract-gba-gfx --rom game.gba --output tiles/

# Extract with specific settings
gameinfo extract-gba-gfx --rom game.gba --offset 0x100000 --bpp 4 --tiles 512

# Extract palettes
gameinfo extract-gba-pal --rom game.gba --output palettes/

# Extract bitmap mode images
gameinfo extract-gba-bitmap --rom game.gba --mode 3 --output bitmaps/
```

### Conversion
```bash
# PNG to GBA tiles (4bpp)
gameinfo png-to-gba --input sprites.png --bpp 4 --output sprites.bin

# PNG to GBA tiles (8bpp)
gameinfo png-to-gba --input background.png --bpp 8 --output bg.bin

# JSON palette to GBA format
gameinfo json-to-gba-pal --input colors.json --output colors.bin

# Bitmap image to Mode 3/5
gameinfo img-to-gba-bitmap --input title.png --mode 3 --output title.bin
```

### Build Integration
```json
{
	"platform": "gba",
	"assets": {
		"graphics": [
			{
				"source": "assets/sprites/*.png",
				"output": "build/gfx/",
				"bpp": 4,
				"tileSize": [8, 8]
			},
			{
				"source": "assets/backgrounds/*.png",
				"output": "build/bg/",
				"bpp": 8
			}
		],
		"palettes": [
			{
				"source": "assets/palettes/*.json",
				"output": "build/pal/",
				"format": "bgr15"
			}
		],
		"bitmaps": [
			{
				"source": "assets/images/title.png",
				"output": "build/img/title.bin",
				"mode": 3
			}
		]
	}
}
```

## Memory Map

```
$00000000-$00003FFF  BIOS (16 KB, protected)
$02000000-$0203FFFF  EWRAM (256 KB, 16-bit bus)
$03000000-$03007FFF  IWRAM (32 KB, 32-bit bus)
$04000000-$040003FF  I/O Registers
$05000000-$050003FF  Palette RAM (1 KB)
$06000000-$06017FFF  VRAM (96 KB)
$07000000-$070003FF  OAM (1 KB)
$08000000-$09FFFFFF  ROM Wait State 0 (32 MB)
$0A000000-$0BFFFFFF  ROM Wait State 1 (32 MB)
$0C000000-$0DFFFFFF  ROM Wait State 2 (32 MB)
$0E000000-$0E00FFFF  SRAM (64 KB)
```

## I/O Registers

### Display ($04000000)
| Address | Name | Purpose |
|---------|------|---------|
| $4000000 | DISPCNT | Display control |
| $4000004 | DISPSTAT | Display status |
| $4000006 | VCOUNT | Scanline counter |
| $4000008 | BG0CNT | BG0 control |
| $400000A | BG1CNT | BG1 control |
| $400000C | BG2CNT | BG2 control |
| $400000E | BG3CNT | BG3 control |

### DMA ($040000B0)
| Address | Name | Purpose |
|---------|------|---------|
| $40000B0 | DMA0SAD | DMA0 source |
| $40000B4 | DMA0DAD | DMA0 destination |
| $40000B8 | DMA0CNT | DMA0 control |

### Sound ($04000060)
| Address | Name | Purpose |
|---------|------|---------|
| $4000060 | SOUND1CNT_L | Channel 1 sweep |
| $4000062 | SOUND1CNT_H | Channel 1 control |
| $4000080 | SOUNDCNT_L | Sound control |
| $4000082 | SOUNDCNT_H | Direct sound |
| $40000A0 | FIFO_A | Sound FIFO A |
| $40000A4 | FIFO_B | Sound FIFO B |

## Sound

### Legacy Channels (GB compatible)
1. Square with sweep
2. Square
3. Wave (64 samples)
4. Noise

### Direct Sound (DMA)
- Two 8-bit PCM channels
- Timer-driven playback
- Mix with legacy channels

## Example Project Structure

```
my-gba-game/
├── build.config.json
├── Makefile
├── src/
│   ├── main.c
│   ├── graphics.c
│   ├── sound.c
│   └── data/
│       ├── sprites.s
│       └── levels.s
├── include/
│   ├── gba.h
│   └── game.h
├── assets/
│   ├── gfx/
│   │   ├── player.png
│   │   └── tileset.png
│   ├── pal/
│   │   └── main.json
│   ├── img/
│   │   └── title.png
│   └── audio/
│       └── music.raw
├── lib/
│   └── libtonc/
└── build/
	├── game.gba
	└── assets/
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
