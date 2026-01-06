# FFMQ SNES - Map Editor Testing

Manual test cases for verifying Final Fantasy Mystic Quest SNES map editing functionality.

## 📋 System Overview

### Map Architecture
- **Map Mode**: SNES Mode 1 (4bpp BG1/BG2, 2bpp BG3)
- **Tile Size**: 8×8 pixels, 16×16 metatiles
- **Tileset Format**: 4bpp planar (32 bytes/tile)
- **Palette**: BGR555, 8 palettes × 16 colors
- **Map Size**: Variable by location type

### Map Types
| Type | Typical Size | Layer Count | Notes |
|------|--------------|-------------|-------|
| Overworld | 64×64 | 2 | Scrollable world map |
| Dungeon | 32×32 to 64×64 | 2-3 | Floor + wall layers |
| Town | 24×24 to 48×48 | 2 | Building interiors |
| Battle Arena | 16×16 | 1 | Combat backgrounds |

### ROM Layout (LoROM)
| Region | Address | Contents |
|--------|---------|----------|
| Map Data | $E00000+ | Compressed map layouts |
| Tilesets | $D80000+ | 4bpp tile graphics |
| Palettes | $D00000+ | Map color palettes |
| Collision | $E40000+ | Walkability data |

---

## 🧪 Test Cases

### TC-01: Map Loading
**Purpose**: Verify FFMQ map data loads correctly with LoROM addressing.

**Prerequisites**:
- FFMQ USA ROM loaded ($100000 bytes)
- Map Editor open

**Steps**:
1. Select "FFMQ SNES" from platform dropdown
2. Enter Focus Tower map offset: 0x00 (first dungeon map)
3. Set dimensions: 32×32
4. Click "Load Map"

**Expected Results**:
- Map displays without corruption
- Status shows "Loaded 1024 tiles"
- Tileset renders with correct colors
- Grid overlay aligns with tile boundaries

**Validation Points**:
- [ ] LoROM to PC address conversion correct
- [ ] Compressed data decompresses properly
- [ ] Tile indices in valid range (0-255)

---

### TC-02: 4bpp Tileset Rendering
**Purpose**: Verify SNES 4bpp tiles render correctly.

**Prerequisites**:
- FFMQ ROM loaded
- Map with visible tileset

**Steps**:
1. Load Foresta town map
2. Open tileset panel
3. Verify forest/grass tiles display correctly
4. Check building/indoor tiles
5. Verify water animation tiles

**Expected Results**:
- All 256 tileset tiles visible
- Colors match original game
- No garbled graphics
- Transparency (color 0) handled correctly

**Technical Verification**:
```
4bpp tile format (32 bytes):
Bytes 0-15:  Bitplanes 0-1 (low bits)
Bytes 16-31: Bitplanes 2-3 (high bits)

Row 0: BP0[0], BP1[0], ..., BP0[7], BP1[7], BP2[0], BP3[0], ...
```

---

### TC-03: Multi-Layer Editing
**Purpose**: Test FFMQ's layered map system.

**Prerequisites**:
- Dungeon map loaded (has floor + wall layers)

**Steps**:
1. Load Level Forest map
2. Toggle BG1 (floor) visibility
3. Toggle BG2 (obstacles) visibility
4. Edit BG1 - place floor tile
5. Edit BG2 - place tree obstacle
6. Verify layers composite correctly

**Expected Results**:
- Layers toggle independently
- Edits stay on correct layer
- Layer order: BG2 over BG1
- Semi-transparent overlay mode works

---

### TC-04: Palette Application
**Purpose**: Verify FFMQ palette handling.

**Prerequisites**:
- Map with multiple palette regions loaded

**Steps**:
1. Load Bone Dungeon map (uses dark palette)
2. Check palette dropdown shows 8 options
3. Switch between palettes 0-7
4. Verify tile attributes store palette index

**Expected Results**:
- 8 palettes × 16 colors = 128 colors available
- Palette 0 default for most tiles
- Palette switch updates all applicable tiles
- Attribute byte stores palette in bits 2-4

**Palette Attribute Format**:
```
Tile Attribute Byte:
Bits 0-1: Priority (usually 0)
Bits 2-4: Palette index (0-7)
Bit 5: X flip
Bit 6: Y flip
Bit 7: Priority high
```

---

### TC-05: Collision Data Editing
**Purpose**: Test FFMQ collision/walkability data.

**Prerequisites**:
- Map loaded with collision overlay enabled

**Steps**:
1. Load any dungeon map
2. Enable "Show Collision" overlay
3. Identify walkable (green) vs blocked (red) tiles
4. Toggle collision on a floor tile
5. Save and verify in-game

**Expected Results**:
- Collision grid aligns with tile grid
- Wall tiles marked as blocked
- Floor tiles marked as walkable
- Water/pit tiles have special collision types

**Collision Types**:
| Value | Meaning |
|-------|---------|
| 0x00 | Walkable |
| 0x01 | Blocked |
| 0x02 | Jump-over |
| 0x04 | Water |
| 0x08 | Damage floor |

---

### TC-06: Map Export/Import
**Purpose**: Verify map data export and reimport.

**Steps**:
1. Load Fireburg map
2. Click "Export Map..."
3. Save as JSON and PNG
4. Make edit to original
5. Click "Import Map..."
6. Reload from PNG
7. Verify restoration

**Expected Results**:
- JSON contains full tile data
- PNG is pixel-perfect representation
- Import reconstructs original
- Undo restores pre-import state

---

### TC-07: Treasure/Event Overlay
**Purpose**: Test special marker overlays.

**Prerequisites**:
- Map with chest/NPC data

**Steps**:
1. Load Aquaria map
2. Enable "Show Events" overlay
3. Verify chest locations marked
4. Verify NPC spawn points marked
5. Click on event to show details

**Expected Results**:
- Chest icons at correct positions
- NPC markers with ID numbers
- Exit/warp points highlighted
- Event panel shows item/script info

---

### TC-08: Metatile System
**Purpose**: Verify 16×16 metatile support.

**Prerequisites**:
- Map loaded with metatile mode enabled

**Steps**:
1. Load Doom Castle map
2. Switch to "16×16 Grid" view
3. Edit by placing full metatiles
4. Verify 4 tiles update together
5. Check metatile definitions

**Expected Results**:
- Grid shows 16×16 boundaries
- Metatile palette shows grouped tiles
- Single click places 4 tiles (2×2)
- Metatile ID stored separately from tile data

---

## 🔄 Regression Tests

### RT-01: Save File Integration
**Purpose**: Verify map edits reflect in save state.

**Steps**:
1. Load ROM and make map edit
2. Build patched ROM
3. Load existing save file
4. Navigate to edited area
5. Verify changes visible in-game

**Expected Results**:
- Edited tiles render correctly
- Collision changes work as expected
- No save file corruption
- Game doesn't crash on edited map

---

### RT-02: Decompression Round-Trip
**Purpose**: Verify compression maintains data integrity.

**Steps**:
1. Load compressed map data
2. Decompress and display
3. Make edits
4. Recompress
5. Compare decompression of new data

**Expected Results**:
- Original data survives round-trip
- Edited tiles persist after recompression
- Compression ratio reasonable
- No data loss or corruption

---

### RT-03: Cross-Map Reference Integrity
**Purpose**: Test that shared tilesets work correctly.

**Steps**:
1. Load map using shared tileset (Foresta outdoor)
2. Verify tileset correct
3. Load different map with same tileset (Life Temple outdoor)
4. Verify same tileset applies

**Expected Results**:
- Tileset pointer resolves correctly
- Shared graphics display identically
- Palette differences handled
- No pointer corruption

---

## 📊 Data Format Reference

### FFMQ Map Header Structure
```
Offset  Size  Description
$00     2     Width (tiles)
$02     2     Height (tiles)
$04     3     BG1 tilemap pointer
$07     3     BG2 tilemap pointer
$0A     3     Tileset pointer
$0D     3     Palette pointer
$10     3     Collision pointer
$13     1     Music ID
$14     1     Ambient SFX ID
```

### Tile Data Format
```
BG1/BG2 Tilemap Entry (2 bytes):
  Byte 0: Tile index (0-255)
  Byte 1: Attributes
    Bits 0-1: Priority
    Bits 2-4: Palette (0-7)
    Bit 5: X flip
    Bit 6: Y flip
    Bit 7: Priority high
```

---

## ✅ Test Coverage Summary

| Category | Test Cases | Regressions |
|----------|------------|-------------|
| Map Loading | 2 | 1 |
| Tileset | 2 | 1 |
| Layers | 1 | 0 |
| Collision | 1 | 0 |
| Export | 1 | 0 |
| Events | 1 | 1 |
| **Total** | **8** | **3** |

---

## 🔧 Test Harness Code

### FFMQ Map Loader
```csharp
public class FfmqMapLoader {
	/// <summary>
	/// Load FFMQ map from LoROM address.
	/// </summary>
	public static FfmqMap LoadMap(RomFile rom, int loromAddress) {
		// Convert LoROM to PC address
		int pcAddress = LoRomToPc(loromAddress);
		
		// Read header
		int width = rom.ReadUInt16(pcAddress);
		int height = rom.ReadUInt16(pcAddress + 2);
		
		// Get tilemap pointer (24-bit)
		int bg1Ptr = LoRomToPc(rom.ReadUInt24(pcAddress + 4));
		int bg2Ptr = LoRomToPc(rom.ReadUInt24(pcAddress + 7));
		
		// Decompress tilemaps
		byte[] bg1 = FfmqDecompress(rom.Data, bg1Ptr);
		byte[] bg2 = FfmqDecompress(rom.Data, bg2Ptr);
		
		return new FfmqMap {
			Width = width,
			Height = height,
			BG1 = ParseTilemap(bg1, width, height),
			BG2 = ParseTilemap(bg2, width, height)
		};
	}
	
	/// <summary>
	/// Convert SNES LoROM address to PC file offset.
	/// </summary>
	public static int LoRomToPc(int lorom) {
		// LoROM: Bank * $8000 + (Address & $7FFF)
		int bank = (lorom >> 16) & 0xFF;
		int offset = lorom & 0x7FFF;
		return (bank * 0x8000) + offset;
	}
}

public record FfmqMap {
	public int Width { get; init; }
	public int Height { get; init; }
	public FfmqTile[,] BG1 { get; init; } = new FfmqTile[0, 0];
	public FfmqTile[,] BG2 { get; init; } = new FfmqTile[0, 0];
}

public record struct FfmqTile(byte Index, byte Attributes) {
	public int Palette => (Attributes >> 2) & 0x07;
	public bool FlipX => (Attributes & 0x20) != 0;
	public bool FlipY => (Attributes & 0x40) != 0;
}
```

---

## 📝 Notes

- FFMQ uses unique compression (not LZ77) - needs custom decompressor
- Battle backgrounds are separate from field maps
- Some maps share tilesets but have different palettes
- Event scripting is complex - separate testing doc needed
