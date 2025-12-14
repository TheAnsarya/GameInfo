# NES Build Pipeline

The NES pipeline supports Nintendo Entertainment System and Famicom ROM development using the ca65/ld65 assembler suite from cc65.

## Platform Specifications

| Property | Value |
|----------|-------|
| CPU | Ricoh 2A03 (6502 variant) |
| Clock | 1.79 MHz (NTSC) / 1.66 MHz (PAL) |
| PRG ROM | Up to 512 KB (with mapper) |
| CHR ROM | Up to 256 KB (with mapper) |
| RAM | 2 KB internal + mapper-specific |
| Resolution | 256×240 pixels |
| Colors | 54 system colors, 25 on screen |
| Sprites | 64 sprites, 8 per scanline |
| Tile Size | 8×8 pixels, 2bpp |

## ROM Formats

### iNES Format (.nes)
Standard format with 16-byte header:
```
Bytes 0-3:   "NES\x1A" (magic number)
Byte 4:     PRG ROM size (16 KB units)
Byte 5:     CHR ROM size (8 KB units)
Byte 6:     Flags 6 (mapper low, mirroring)
Byte 7:     Flags 7 (mapper high, format)
Bytes 8-15: Extended flags (NES 2.0) or padding
```

### NES 2.0 Format
Extended header format with additional metadata:
- Submapper numbers
- PRG/CHR RAM sizes
- CPU/PPU timing
- Extended console types

## Graphics

### CHR Tile Format (2bpp)
Each 8×8 tile uses 16 bytes:
- Bytes 0-7: Bit plane 0 (low bits)
- Bytes 8-15: Bit plane 1 (high bits)

```
Tile Pixel Layout:
Row 0: [plane0_byte0] [plane1_byte0]
Row 1: [plane0_byte1] [plane1_byte1]
...
Row 7: [plane0_byte7] [plane1_byte7]

Pixel Value = (plane1_bit << 1) | plane0_bit
Values: 0-3 (index into palette)
```

### Palettes
- 4 background palettes × 4 colors each
- 4 sprite palettes × 4 colors each
- Color 0 of each palette is transparent/background
- 54 master colors available

### Nametables
- 32×30 tiles = 960 bytes
- Attribute table: 64 bytes (2×2 tile color areas)
- Two nametables standard, mirroring via mapper

## Supported Mappers

| Mapper | Name | Banks | Features |
|--------|------|-------|----------|
| 0 | NROM | Fixed | No banking |
| 1 | MMC1 | 16×16K PRG | Battery save |
| 2 | UxROM | 8×16K PRG | Simple switching |
| 3 | CNROM | 4×8K CHR | CHR switching |
| 4 | MMC3 | Complex | Scanline IRQ |
| 7 | AxROM | 8×32K PRG | Single screen |

## Assembler Configuration

### ca65 Setup
```bash
# Assemble source files
ca65 -o main.o src/main.asm -I include/

# Link with configuration
ld65 -o game.nes -C nes.cfg main.o graphics.o
```

### Linker Configuration (nes.cfg)
```
MEMORY {
	ZP:     start = $00,    size = $100, type = rw;
	RAM:    start = $200,   size = $600, type = rw;
	HEADER: start = $0,     size = $10,  type = ro, file = %O, fill = yes;
	PRG:    start = $8000,  size = $8000, type = ro, file = %O, fill = yes;
	CHR:    start = $0,     size = $2000, type = ro, file = %O, fill = yes;
}

SEGMENTS {
	ZEROPAGE: load = ZP,     type = zp;
	BSS:      load = RAM,    type = bss;
	HEADER:   load = HEADER, type = ro;
	CODE:     load = PRG,    type = ro;
	RODATA:   load = PRG,    type = ro;
	VECTORS:  load = PRG,    type = ro, start = $FFFA;
	CHARS:    load = CHR,    type = ro;
}
```

## Asset Pipeline

### Extraction
```bash
# Extract CHR tiles to PNG
gameinfo extract-chr --rom game.nes --output tiles/

# Extract palettes to JSON
gameinfo extract-pal --rom game.nes --output palettes/

# Extract nametables
gameinfo extract-nam --rom game.nes --output maps/
```

### Conversion
```bash
# PNG to CHR (2bpp)
gameinfo png-to-chr --input tiles/sprites.png --output build/sprites.chr

# JSON to palette binary
gameinfo json-to-pal --input palettes/bg.json --output build/bg.pal

# Nametable JSON to binary
gameinfo json-to-nam --input maps/title.json --output build/title.nam
```

### Build Integration
```json
{
	"assets": {
		"chr": [
			{
				"source": "assets/tiles/*.png",
				"output": "build/chr/",
				"bpp": 2
			}
		],
		"palettes": [
			{
				"source": "assets/palettes/*.json",
				"output": "build/pal/"
			}
		]
	}
}
```

## Memory Map

```
$0000-$07FF  Internal RAM (2KB, mirrored to $1FFF)
$2000-$2007  PPU registers (mirrored to $3FFF)
$4000-$4017  APU and I/O registers
$4018-$401F  APU test mode (disabled)
$4020-$FFFF  Cartridge space (PRG ROM, mapper registers)

PPU Memory:
$0000-$0FFF  Pattern Table 0 (CHR)
$1000-$1FFF  Pattern Table 1 (CHR)
$2000-$23FF  Nametable 0
$2400-$27FF  Nametable 1
$2800-$2BFF  Nametable 2 (mirror)
$2C00-$2FFF  Nametable 3 (mirror)
$3F00-$3F1F  Palettes
```

## Example Project Structure

```
my-nes-game/
├── build.config.json
├── src/
│   ├── main.asm
│   ├── init.asm
│   ├── graphics.asm
│   └── data/
│       ├── tiles.asm
│       └── palettes.asm
├── include/
│   ├── nes.inc
│   └── macros.inc
├── assets/
│   ├── tiles/
│   │   ├── player.png
│   │   └── enemies.png
│   ├── palettes/
│   │   └── main.json
│   └── maps/
│       └── level1.json
├── cfg/
│   └── nes.cfg
└── build/
	├── game.nes
	└── chr/
```

## Related Documentation

- [Build Pipeline Overview](README.md)
- [Configuration Schema](Configuration-Schema.md)
- [Asset Formats](Asset-Formats.md)
