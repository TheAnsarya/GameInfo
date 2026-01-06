# FFMQ SNES - Graphics Editor Testing

Manual test cases for verifying Final Fantasy Mystic Quest graphics editing functionality.

## 📋 System Overview

### Graphics Architecture
- **Tile Format**: 4bpp planar (32 bytes per 8×8 tile)
- **Palette Format**: BGR555 (2 bytes per color)
- **Graphics Mode**: Mode 1 (4bpp BG1/BG2, 2bpp BG3)
- **Sprite Format**: 4bpp, variable size OAM

### Graphics Categories
| Type | Tile Count | Location | Notes |
|------|------------|----------|-------|
| Map Tilesets | ~512 per set | $D80000+ | Multiple sets |
| Character Sprites | 256 tiles | $C80000+ | Hero + partners |
| Monster Sprites | Variable | $C00000+ | Compressed |
| Battle Backgrounds | 128 tiles | $CC0000+ | 8 backgrounds |
| Menu Graphics | 64 tiles | $D00000+ | Windows, fonts |
| Effects/Particles | 32 tiles | $CE0000+ | Spell animations |

### ROM Layout
| Region | Address | Size | Contents |
|--------|---------|------|----------|
| $C00000 | LoROM Bank 80 | ~256KB | Monster graphics (compressed) |
| $C80000 | LoROM Bank 90 | ~64KB | Character sprites |
| $CC0000 | LoROM Bank 98 | ~32KB | Battle backgrounds |
| $D00000 | LoROM Bank A0 | ~16KB | Menu/UI graphics |
| $D80000 | LoROM Bank B0 | ~128KB | Map tilesets |

---

## 🧪 Test Cases

### TC-01: 4bpp Tile Loading
**Purpose**: Verify SNES 4bpp tile graphics load correctly.

**Prerequisites**:
- FFMQ USA ROM loaded
- Graphics Editor open

**Steps**:
1. Select "Map Tileset" category
2. Enter offset: $D80000 (first tileset)
3. Set tile count: 256
4. Click "Load Graphics"
5. Verify tiles display correctly

**Expected Results**:
- 256 tiles visible in palette grid
- Grass/terrain tiles recognizable
- No garbled pixels
- Grid shows 16×16 tile preview

**4bpp Format Reference**:
```
8×8 tile = 32 bytes:
  Bytes 0-15:  Bitplanes 0-1 (low bits)
    Row 0: BP0[0], BP1[0]
    Row 1: BP0[1], BP1[1]
    ...
    Row 7: BP0[7], BP1[7]
  
  Bytes 16-31: Bitplanes 2-3 (high bits)
    Row 0: BP2[0], BP3[0]
    ...
    Row 7: BP2[7], BP3[7]

Pixel value = BP0 + (BP1 << 1) + (BP2 << 2) + (BP3 << 3)
Range: 0-15 (index into palette)
```

---

### TC-02: BGR555 Palette Loading
**Purpose**: Verify SNES palette colors load correctly.

**Prerequisites**:
- Graphics loaded from TC-01

**Steps**:
1. Enter palette offset: $D00000 (map palettes)
2. Set palette count: 8
3. Click "Load Palette"
4. Verify 8 × 16 = 128 colors displayed
5. Check first palette has expected colors

**Expected Results**:
- 16 colors per palette row
- Color 0 is transparent (shown as checkerboard)
- Greens for grass, browns for ground
- No incorrect color channels

**BGR555 Format**:
```
2 bytes per color (little-endian):
  Bits 0-4:   Red   (0-31)
  Bits 5-9:   Green (0-31)
  Bits 10-14: Blue  (0-31)
  Bit 15:     Unused (0)

Convert to RGB888:
  R = (color & 0x1F) * 8
  G = ((color >> 5) & 0x1F) * 8
  B = ((color >> 10) & 0x1F) * 8
```

---

### TC-03: Character Sprite Editing
**Purpose**: Test hero character sprite modification.

**Prerequisites**:
- Graphics Editor in sprite mode

**Steps**:
1. Load hero sprites from $C80000
2. Identify walking animation frames (4 directions × 4 frames)
3. Select tile from south-facing walk
4. Modify one pixel to bright red
5. Export and verify change
6. Apply to ROM and test in-game

**Expected Results**:
- 16 frames for walking (4 dirs × 4 frames)
- Edit shows immediately in preview
- Export produces valid 4bpp data
- In-game hero shows red pixel

**Hero Sprite Layout**:
```
Offset  Frames  Direction
$00     4       South (down)
$10     4       North (up)
$20     4       West (left)
$30     4       East (right)

Each frame: 2×2 tiles = 4 tiles = 128 bytes
Total: 16 × 128 = 2048 bytes per character
```

---

### TC-04: Monster Sprite Decompression
**Purpose**: Verify compressed monster graphics decompress correctly.

**Prerequisites**:
- Monster sprite at known address

**Steps**:
1. Select "Monster Graphics" category
2. Enable "Decompress" option
3. Enter Brownie monster address
4. Click "Load Graphics"
5. Verify monster sprite displays correctly
6. Check dimensions (32×32 for small enemies)

**Expected Results**:
- Monster image recognizable
- Correct palette applied
- No decompression artifacts
- Size matches expected dimensions

**Monster Compression**:
```
FFMQ uses custom compression for monster sprites:
- Header: 2 bytes width, 2 bytes height, 3 bytes data pointer
- Data: Similar to LZ77 but with different encoding
```

---

### TC-05: Battle Background Editing
**Purpose**: Test battle backdrop modification.

**Prerequisites**:
- Battle background address known

**Steps**:
1. Select "Battle BG" category
2. Load Foresta background (forest theme)
3. View tileset (trees, grass, sky)
4. Edit sky color in tile
5. Rebuild tileset
6. Test in battle

**Expected Results**:
- Background tiles display correctly
- Tree/foliage patterns visible
- Sky tiles identifiable
- Edit persists through battle transitions

---

### TC-06: Animation Frame Extraction
**Purpose**: Verify multi-frame sprite animation export.

**Prerequisites**:
- Character or monster with animation

**Steps**:
1. Load spell effect graphics
2. Identify Fire spell animation frames
3. Click "Export Animation..."
4. Choose GIF or PNG sequence format
5. Verify all frames exported in order

**Expected Results**:
- All animation frames captured
- Timing data included (if available)
- Transparency preserved
- Loop point identified

---

### TC-07: Tileset Import
**Purpose**: Test importing graphics from external file.

**Prerequisites**:
- External PNG file with 4bpp-compatible graphics

**Steps**:
1. Create 128×128 PNG (16×16 tiles of 8×8 each = 256 tiles)
2. Use 16-color indexed palette
3. Click "Import Tileset..."
4. Select the PNG file
5. Verify conversion to 4bpp
6. Apply to ROM

**Expected Results**:
- PNG imports without error
- Colors map to nearest palette entries
- Tile count matches expected
- Quality acceptable after quantization

---

### TC-08: OAM Sprite Assembly
**Purpose**: Test building multi-tile sprites.

**Prerequisites**:
- Large monster sprite loaded (e.g., Dark King)

**Steps**:
1. Load Dark King boss graphics
2. View OAM assembly data
3. Verify tile arrangement (8×8 grid)
4. Edit one component tile
5. Preview full assembled sprite
6. Export assembled image

**Expected Results**:
- Multi-tile sprite assembles correctly
- OAM entries show position offsets
- Edit reflects in assembly
- Export shows complete boss sprite

**OAM Format**:
```
Per sprite entry (4 bytes):
  Byte 0: X position (low 8 bits)
  Byte 1: Y position
  Byte 2: Tile index
  Byte 3: Attributes
    Bits 0-2: Palette (0-7)
    Bit 6: X flip
    Bit 7: Y flip
```

---

## 🔄 Regression Tests

### RT-01: Graphics Corruption Prevention
**Purpose**: Ensure edits don't corrupt adjacent data.

**Steps**:
1. Load tileset and note adjacent data
2. Make multiple tile edits
3. Save changes
4. Verify adjacent regions unchanged
5. Test game stability

**Expected Results**:
- Only target tiles modified
- Adjacent pointers intact
- No buffer overflows
- Game loads normally

---

### RT-02: Palette Consistency
**Purpose**: Verify palette changes apply globally.

**Steps**:
1. Edit color in map palette
2. Save and rebuild ROM
3. Load multiple maps using same palette
4. Verify color change appears everywhere

**Expected Results**:
- Palette is shared resource
- All maps reflect change
- No palette index conflicts
- Consistent across areas

---

### RT-03: Compression Round-Trip
**Purpose**: Test graphics survive recompression.

**Steps**:
1. Load compressed monster graphics
2. Decompress for editing
3. Make minor edit
4. Recompress
5. Decompress again
6. Compare to verify no loss

**Expected Results**:
- Edit preserved through cycle
- No additional artifacts
- File size reasonable
- Game loads sprite correctly

---

## 📊 Graphics Reference Data

### Map Tileset Addresses
| Tileset | Address | Tiles | Usage |
|---------|---------|-------|-------|
| Foresta | $D80000 | 256 | Forest outdoor areas |
| Aquaria | $D88000 | 256 | Water/ice areas |
| Fireburg | $D90000 | 256 | Lava/fire areas |
| Windia | $D98000 | 256 | Wind temple areas |
| Doom | $DA0000 | 256 | Final dungeon |
| Towns | $DA8000 | 256 | Indoor/building |
| Battle | $DB0000 | 128 | Battle UI elements |

### Character Sprite Addresses
| Character | Address | Frames |
|-----------|---------|--------|
| Benjamin (Hero) | $C80000 | 16 walk + 8 battle |
| Kaeli | $C80800 | 16 walk + 8 battle |
| Tristam | $C81000 | 16 walk + 8 battle |
| Phoebe | $C81800 | 16 walk + 8 battle |
| Reuben | $C82000 | 16 walk + 8 battle |

### Monster Sprite Sizes
| Size Class | Dimensions | Tiles | Examples |
|------------|------------|-------|----------|
| Small | 32×32 | 16 | Brownie, Mint Mint |
| Medium | 48×48 | 36 | Sand Worm, Minotaur |
| Large | 64×64 | 64 | Pazuzu, Dullahan |
| Boss | 64×96+ | 96+ | Dark King phases |

---

## 🔧 Test Harness Code

### SNES 4bpp Tile Codec
```csharp
public static class Snes4bppCodec {
	/// <summary>
	/// Decode SNES 4bpp tile to pixel indices.
	/// </summary>
	public static byte[,] DecodeTile(ReadOnlySpan<byte> data) {
		if (data.Length < 32)
			throw new ArgumentException("4bpp tile requires 32 bytes");

		var pixels = new byte[8, 8];

		for (int y = 0; y < 8; y++) {
			// Bitplanes 0-1 in first 16 bytes
			var bp0 = data[y * 2];
			var bp1 = data[y * 2 + 1];
			// Bitplanes 2-3 in second 16 bytes
			var bp2 = data[16 + y * 2];
			var bp3 = data[16 + y * 2 + 1];

			for (int x = 0; x < 8; x++) {
				var bit = 7 - x;
				var pixel = ((bp0 >> bit) & 1)
						  | (((bp1 >> bit) & 1) << 1)
						  | (((bp2 >> bit) & 1) << 2)
						  | (((bp3 >> bit) & 1) << 3);
				pixels[y, x] = (byte)pixel;
			}
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to SNES 4bpp format.
	/// </summary>
	public static byte[] EncodeTile(byte[,] pixels) {
		if (pixels.GetLength(0) != 8 || pixels.GetLength(1) != 8)
			throw new ArgumentException("Tile must be 8x8");

		var data = new byte[32];

		for (int y = 0; y < 8; y++) {
			byte bp0 = 0, bp1 = 0, bp2 = 0, bp3 = 0;

			for (int x = 0; x < 8; x++) {
				var bit = 7 - x;
				var pixel = pixels[y, x] & 0x0F;

				if ((pixel & 1) != 0) bp0 |= (byte)(1 << bit);
				if ((pixel & 2) != 0) bp1 |= (byte)(1 << bit);
				if ((pixel & 4) != 0) bp2 |= (byte)(1 << bit);
				if ((pixel & 8) != 0) bp3 |= (byte)(1 << bit);
			}

			data[y * 2] = bp0;
			data[y * 2 + 1] = bp1;
			data[16 + y * 2] = bp2;
			data[16 + y * 2 + 1] = bp3;
		}

		return data;
	}
}

public static class SnesPaletteCodec {
	/// <summary>
	/// Decode BGR555 color to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) DecodeColor(ushort bgr555) {
		var r = (byte)(((bgr555 >> 0) & 0x1F) * 8);
		var g = (byte)(((bgr555 >> 5) & 0x1F) * 8);
		var b = (byte)(((bgr555 >> 10) & 0x1F) * 8);
		return (r, g, b);
	}

	/// <summary>
	/// Encode RGB to BGR555.
	/// </summary>
	public static ushort EncodeColor(byte r, byte g, byte b) {
		return (ushort)(
			((r / 8) & 0x1F) |
			(((g / 8) & 0x1F) << 5) |
			(((b / 8) & 0x1F) << 10)
		);
	}

	/// <summary>
	/// Load 16-color palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] LoadPalette(ReadOnlySpan<byte> data) {
		var colors = new (byte R, byte G, byte B)[16];
		for (int i = 0; i < 16; i++) {
			var bgr = (ushort)(data[i * 2] | (data[i * 2 + 1] << 8));
			colors[i] = DecodeColor(bgr);
		}
		return colors;
	}
}
```

### FFMQ Graphics Reader
```csharp
public class FfmqGraphicsReader {
	private const int TilesetBase = 0x180000; // LoROM $D80000
	private const int CharacterBase = 0x080000; // LoROM $C80000
	private const int MonsterBase = 0x000000; // LoROM $C00000

	public static byte[][] LoadTileset(RomFile rom, int offset, int tileCount) {
		var tiles = new byte[tileCount][];
		for (int i = 0; i < tileCount; i++) {
			tiles[i] = new byte[32];
			for (int j = 0; j < 32; j++) {
				tiles[i][j] = rom.ReadByte(offset + (i * 32) + j);
			}
		}
		return tiles;
	}

	public static byte[] LoadCharacterSprite(RomFile rom, int characterId) {
		var offset = CharacterBase + (characterId * 0x800);
		var data = new byte[0x800]; // 16 frames × 4 tiles × 32 bytes
		for (int i = 0; i < data.Length; i++) {
			data[i] = rom.ReadByte(offset + i);
		}
		return data;
	}
}
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Tile Loading | 2 | 1 |
| Palettes | 1 | 1 |
| Sprites | 2 | 0 |
| Backgrounds | 1 | 0 |
| Animation | 1 | 0 |
| Import/Export | 1 | 1 |
| **Total** | **8** | **3** |

---

## 📝 Notes

- FFMQ uses standard SNES 4bpp for most graphics
- Monster sprites use custom compression (not LZ77)
- Battle backgrounds are uncompressed tilesets
- Character palettes change per area (day/night/indoor)
- Some graphics shared between areas (UI elements)
- Font uses 1bpp format, not 4bpp
