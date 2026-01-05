# Dragon Quest III Remake (SNES) - Map Editor Manual Testing

## Overview

DQ3r SNES uses a sophisticated map system with:
- **Overworld**: Large world map using chunk-based compression (4x4 tile chunks)
- **Dungeons/Towns**: Individual map files with layers, events, and NPCs
- **MetaTile System**: 8x8 pixel tiles combined into 16x16 metatiles

## Map System Architecture

### Overworld Structure
```
Overworld Map
  └── Layout Grid (64x64 chunks)
        └── Chunks (4x4 metatiles each = 16 bytes)
              └── MetaTiles (8 bytes definition)
                    └── Tiles (8x8 pixels, 4bpp)
```

### Chunk System (16 bytes)
```csharp
public class Chunk {
    public int Index { get; set; }      // Chunk ID
    public byte[] Data { get; set; }    // 16 bytes = 4x4 metatile indices
    public string Key { get; }          // Hash for deduplication
}
```

### MetaTile Definition (8 bytes)
| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 1 | TopLeft | Tile index (top-left 8x8) |
| 1 | 1 | TopRight | Tile index (top-right 8x8) |
| 2 | 1 | BottomLeft | Tile index (bottom-left 8x8) |
| 3 | 1 | BottomRight | Tile index (bottom-right 8x8) |
| 4 | 1 | Palette | Palette index (0-7) |
| 5 | 1 | Flags | Walkability, priority, etc. |
| 6 | 1 | TerrainType | Encounter zone type |
| 7 | 1 | Reserved | Future use |

### ROM Addresses (DQ3 SFC)
| Data | SNES Address | File Offset |
|------|--------------|-------------|
| Overworld Layout | $e55000 | ~$255000 |
| MetaTile Defs | $e54f38 | ~$254F38 |
| Chunk Stream 0 | $eda49c | ~$25A49C |
| Chunk Stream 1 | $edcd90 | ~$25CD90 |
| Chunk Stream 2 | $edf684 | ~$25F684 |
| Chunk Stream 3 | $ee1f78 | ~$261F78 |

## Test Cases

### TC-001: Load Overworld Layout
**Objective:** Verify overworld grid loads correctly

**Steps:**
1. Open DQ3r map editor
2. Load DQ3 SFC ROM
3. Select Overworld view
4. Verify 256x256 tile display (64x64 chunks)

**Expected Results:**
- Map renders without gaps
- Recognizable DQ3 world shape (continents)
- Water, grass, mountains visible
- No corrupt tiles

```csharp
// Test code
var rom = new Rom("dq3.sfc");
var layout = MapData.GetLayout(rom, null);
Assert.AreEqual(0x2000, layout.Length); // 8KB decompressed
```

### TC-002: Load Chunk Data
**Objective:** Test chunk decompression

**Steps:**
1. Load chunk streams from ROM
2. Decompress all 4 chunk streams
3. Verify chunk count and integrity

**Expected Results:**
- 4 streams load without error
- Chunks are 16 bytes each
- Total ~1000+ unique chunks

```csharp
var chunks = MapData.GetTilemapChunks();
Assert.IsTrue(chunks.Length > 500);
foreach (var chunk in chunks) {
    Assert.AreEqual(16, chunk.Data.Length);
}
```

### TC-003: Load MetaTile Definitions
**Objective:** Verify metatile parsing

**Steps:**
1. Load metatile definitions from $e54f38
2. Parse all 237 entries
3. Verify tile indices and flags

**Expected Results:**
- 237 metatile definitions
- Valid tile indices (0-255)
- Walkability flags set appropriately

```csharp
var metaTiles = MapData.GetTileDefinitions(rom, null);
Assert.AreEqual(237, metaTiles.Length); // $00 to $EC
```

### TC-004: Edit Chunk
**Objective:** Test chunk modification

**Steps:**
1. Select chunk at known location (e.g., Aliahan area)
2. Note original metatiles
3. Change one metatile (e.g., grass → water)
4. Verify visual update
5. Export and test in emulator

**Expected Results:**
- Chunk updates visually
- Change persists after save
- Map plays correctly in emulator

### TC-005: Create New Chunk
**Objective:** Test chunk creation and deduplication

**Steps:**
1. Paint new 4x4 pattern
2. Verify chunk created if unique
3. Paint duplicate pattern elsewhere
4. Verify existing chunk reused

**Deduplication Test:**
```csharp
var (chunks, map) = Chunk.TilemapToChunks(fullmap);
var uniqueKeys = chunks.Select(c => c.Key).Distinct().Count();
Assert.AreEqual(chunks.Count, uniqueKeys); // All unique
```

### TC-006: Edit MetaTile Definition
**Objective:** Test metatile modification

**Steps:**
1. Select metatile (e.g., #$10 = grass)
2. View 4 tile components
3. Change walkability flag
4. Verify all instances update

**Expected Results:**
- All grass tiles now unwalkable
- Visual unchanged, behavior changed

### TC-007: Map Compression Round-Trip
**Objective:** Test BasicRing400 compression

**Steps:**
1. Decompress overworld layout
2. Recompress with BasicRing400
3. Compare sizes (should be similar)
4. Decompress again and compare bytes

```csharp
var original = MapData.GetLayout(rom, null);
var compressed = BasicRing400.Compress(original);
var decompressed = BasicRing400.Decompress(compressed, 0x2000);
CollectionAssert.AreEqual(original, decompressed);
```

### TC-008: Export/Import Map
**Objective:** Test full map export/import

**Steps:**
1. Export overworld to PNG
2. Modify in external editor (Aseprite)
3. Import modified PNG
4. Verify chunk regeneration

**Export Format Options:**
- PNG: Full tilemap image
- JSON: Map structure + chunk data
- BIN: Raw binary format

## Terrain Type Reference

| ID | Terrain | Encounter Rate | Notes |
|----|---------|----------------|-------|
| 0 | None | 0% | Indoor/town |
| 1 | Grass | Normal | Standard field |
| 2 | Forest | +25% | Higher encounter |
| 3 | Desert | +50% | Desert enemies |
| 4 | Swamp | +50% | Swamp + poison |
| 5 | Mountain | 0% | Impassable |
| 6 | Water | Ship only | Sea encounters |
| 7 | Bridge | Normal | Over water |

## Compression System

DQ3r uses **BasicRing400** compression for map data:

```csharp
// Decompress
public static byte[] Decompress(ByteArrayStream source, int outputSize) {
    // Ring buffer of 0x400 bytes
    // Control bytes determine literal vs reference
    // References: (distance, length) pairs
}

// Compress (for editing)
public static byte[] Compress(byte[] data) {
    // Find repeated patterns
    // Encode as references when beneficial
    // Fall back to literals
}
```

## Regression Tests

### RT-001: Full Map Round-Trip
1. Load overworld completely
2. Export to format (JSON/PNG)
3. Clear and reimport
4. Binary compare with original

### RT-002: Chunk Integrity
1. Modify single chunk
2. Save ROM
3. Reload and verify only that chunk changed
4. Verify no corruption in adjacent chunks

### RT-003: MetaTile Consistency
1. Edit metatile definition
2. Verify all map instances update
3. Revert change
4. Verify restoration

## Known Issues

1. **Compression Ratio** - Recompressed data may be larger than original
2. **Layer System** - Some maps have multiple layers; editor may show merged
3. **Event Triggers** - Map events stored separately from visual data
4. **Animation** - Animated tiles (water, lava) not previewed

## Town/Dungeon Maps

Towns and dungeons use different format:

### Indoor Map Structure
| Data | Description |
|------|-------------|
| Header | Size, tileset ID, music |
| Tilemap | 2D array of tile indices |
| Events | NPC positions, triggers |
| Warps | Door/stair destinations |

### Test TC-009: Load Town Map
**Steps:**
1. Select Aliahan (town #1)
2. Verify tileset loads
3. Verify NPC positions
4. Verify warp destinations

## DQ4r Conversion Notes

Converting DQ3r maps to DQ4r:
- Same engine, compatible format
- Add chapter-specific variations
- Update event scripts
- Add new NPCs/shops

## Test Harness

```csharp
using DQ3Lib.Maps.Overworld;
using DQ3Lib.Common.Rom;
using DQ3Lib.Compression;

[TestClass]
public class MapEditorTests {
    private Rom _rom;

    [TestInitialize]
    public void Setup() {
        _rom = new Rom("test-roms/dq3.sfc");
    }

    [TestMethod]
    public void LoadOverworldLayout() {
        var layout = MapData.GetLayout(_rom, null);
        Assert.AreEqual(0x2000, layout.Length);
    }

    [TestMethod]
    public void LoadMetaTileDefinitions() {
        var metaTiles = MapData.GetTileDefinitions(_rom, null);
        Assert.AreEqual(237, metaTiles.Length);
    }

    [TestMethod]
    public void ChunkDeduplication() {
        var testMap = new byte[16, 16]; // 4x4 chunks
        // Fill with pattern...
        var (chunks, map) = Chunk.TilemapToChunks(testMap);
        Assert.IsTrue(chunks.Count > 0);
        Assert.AreEqual(16, map.Count); // 4x4 = 16 chunk refs
    }

    [TestMethod]
    public void CompressionRoundTrip() {
        var original = MapData.GetLayout(_rom, null);
        var compressed = BasicRing400.Compress(original);
        var decompressed = BasicRing400.Decompress(
            new ByteArrayStream(compressed), 0x2000);
        CollectionAssert.AreEqual(original, decompressed);
    }
}
```

## Sign-Off

| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-001 | | | ☐ |
| TC-002 | | | ☐ |
| TC-003 | | | ☐ |
| TC-004 | | | ☐ |
| TC-005 | | | ☐ |
| TC-006 | | | ☐ |
| TC-007 | | | ☐ |
| TC-008 | | | ☐ |
| TC-009 | | | ☐ |
| RT-001 | | | ☐ |
| RT-002 | | | ☐ |
| RT-003 | | | ☐ |
