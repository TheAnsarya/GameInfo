# DW4→DQ3r Conversion Tools Specification

## Overview

This document specifies the C# tools needed to convert Dragon Warrior IV (NES) data to Dragon Quest III Remake (SNES) format.

All tools are part of the `DW4Lib` project in the `logsmall` solution.

---

## Tool Architecture

```
logsmall/
├── DW4Lib/
│   ├── Converters/
│   │   ├── MonsterConverter.cs
│   │   ├── ItemConverter.cs
│   │   ├── SpellConverter.cs
│   │   ├── MapConverter.cs
│   │   ├── TextConverter.cs
│   │   └── GraphicsConverter.cs
│   ├── Extractors/
│   │   ├── DW4MonsterExtractor.cs
│   │   ├── DW4ItemExtractor.cs
│   │   ├── DW4SpellExtractor.cs
│   │   ├── DW4MapExtractor.cs
│   │   └── DW4TextExtractor.cs
│   ├── Models/
│   │   ├── DW4Monster.cs
│   │   ├── DW4Item.cs
│   │   ├── DW4Spell.cs
│   │   ├── DW4Map.cs
│   │   └── DW4Character.cs
│   └── Compression/
│       ├── RleDecompressor.cs
│       └── DW4TextDecoder.cs
```

---

## 1. Monster Converter

### Class: `MonsterConverter`

```csharp
namespace DW4Lib.Converters;

/// <summary>
/// Converts DW4 NES monster data to DQ3r SNES format.
/// </summary>
public class MonsterConverter {
    /// <summary>
    /// Convert a single monster from DW4 to DQ3r format.
    /// </summary>
    public DQ3rMonster Convert(DW4Monster source, ConversionOptions options);
    
    /// <summary>
    /// Convert all monsters with scaling and balancing.
    /// </summary>
    public IEnumerable<DQ3rMonster> ConvertAll(
        IEnumerable<DW4Monster> sources, 
        ConversionOptions options);
    
    /// <summary>
    /// Generate stat scaling based on NES→SNES stat ranges.
    /// </summary>
    public StatScaling CalculateScaling(
        IEnumerable<DW4Monster> sources);
}
```

### Conversion Logic

```csharp
public class ConversionOptions {
    /// <summary>
    /// Multiplier for HP conversion (NES 8-bit to SNES 16-bit).
    /// </summary>
    public double HpScaling { get; set; } = 1.5;
    
    /// <summary>
    /// Multiplier for attack/defense stats.
    /// </summary>
    public double StatScaling { get; set; } = 1.2;
    
    /// <summary>
    /// Multiplier for experience rewards.
    /// </summary>
    public double ExpScaling { get; set; } = 1.0;
    
    /// <summary>
    /// Multiplier for gold rewards.
    /// </summary>
    public double GoldScaling { get; set; } = 1.0;
    
    /// <summary>
    /// Whether to add a second item drop slot.
    /// </summary>
    public bool AddSecondDrop { get; set; } = false;
}
```

### Model Classes

```csharp
public record DW4Monster {
    public int Id { get; init; }
    public string Name { get; init; } = "";
    public int Hp { get; init; }
    public int Attack { get; init; }
    public int Defense { get; init; }
    public int Agility { get; init; }
    public int Exp { get; init; }
    public int Gold { get; init; }
    public int ActionPattern { get; init; }
    public List<int> Skills { get; init; } = [];
    public int Resistances { get; init; }
    public int ItemDrop { get; init; }
    public int DropRate { get; init; }
    public int Flags { get; init; }
}

public record DQ3rMonster {
    public int Id { get; init; }
    public string Name { get; init; } = "";
    public int Hp { get; init; }
    public int Mp { get; init; }
    public int Attack { get; init; }
    public int Defense { get; init; }
    public int Agility { get; init; }
    public int Exp { get; init; }
    public int Gold { get; init; }
    public int ActionPatternPointer { get; init; }
    public int Resistances { get; init; }
    public int ItemDrop1 { get; init; }
    public int DropRate1 { get; init; }
    public int ItemDrop2 { get; init; }
    public int DropRate2 { get; init; }
    public int Flags { get; init; }
}
```

---

## 2. Item Converter

### Class: `ItemConverter`

```csharp
namespace DW4Lib.Converters;

public class ItemConverter {
    /// <summary>
    /// Convert a single item from DW4 to DQ3r format.
    /// </summary>
    public DQ3rItem Convert(DW4Item source);
    
    /// <summary>
    /// Convert all items.
    /// </summary>
    public IEnumerable<DQ3rItem> ConvertAll(IEnumerable<DW4Item> sources);
    
    /// <summary>
    /// Generate equipment compatibility mapping.
    /// DW4 uses character-based flags, DQ3r uses class-based.
    /// </summary>
    public Dictionary<int, int> MapEquipFlags(DW4Item source);
}
```

### Equipment Flag Mapping

```csharp
// DW4 character equip flags
[Flags]
public enum DW4EquipFlags : byte {
    Hero = 0x01,
    Ragnar = 0x02,
    Alena = 0x04,
    Cristo = 0x08,  // Clift
    Brey = 0x10,
    Taloon = 0x20,
    Mara = 0x40,
    Nara = 0x80
}

// Mapping to DQ3r class-based system
public static Dictionary<DW4EquipFlags, DQ3rClassFlags> EquipMapping = new() {
    [DW4EquipFlags.Hero] = DQ3rClassFlags.Hero,
    [DW4EquipFlags.Ragnar] = DQ3rClassFlags.Soldier,
    [DW4EquipFlags.Alena] = DQ3rClassFlags.Fighter,
    [DW4EquipFlags.Cristo] = DQ3rClassFlags.Priest,
    [DW4EquipFlags.Brey] = DQ3rClassFlags.Mage,
    [DW4EquipFlags.Taloon] = DQ3rClassFlags.Merchant,
    [DW4EquipFlags.Mara] = DQ3rClassFlags.Mage,
    [DW4EquipFlags.Nara] = DQ3rClassFlags.Priest
};
```

---

## 3. Spell Converter

### Class: `SpellConverter`

```csharp
namespace DW4Lib.Converters;

public class SpellConverter {
    /// <summary>
    /// Convert spell data from DW4 to DQ3r format.
    /// </summary>
    public DQ3rSpell Convert(DW4Spell source);
    
    /// <summary>
    /// Map DW4 spell effects to DQ3r equivalents.
    /// </summary>
    public int MapEffectType(int dw4Effect);
    
    /// <summary>
    /// Generate spell learning tables for each character.
    /// </summary>
    public Dictionary<int, List<SpellLearning>> GenerateLearningTables();
}
```

### Spell Effect Mapping

```csharp
// DW4 → DQ3r spell effect mapping
public static Dictionary<int, int> SpellEffectMap = new() {
    [0x01] = 0x01,  // Fire damage
    [0x02] = 0x02,  // Ice damage
    [0x03] = 0x03,  // Electric damage
    [0x04] = 0x05,  // Heal single
    [0x05] = 0x06,  // Heal all
    [0x06] = 0x07,  // Revive
    [0x07] = 0x08,  // Defense up
    [0x08] = 0x09,  // Attack up
    // ... etc
};
```

---

## 4. Map Converter

### Class: `MapConverter`

```csharp
namespace DW4Lib.Converters;

public class MapConverter {
    private readonly RleDecompressor _rleDecompressor;
    private readonly LzssCompressor _lzssCompressor;
    private readonly TileMappingTable _tileMappings;
    
    /// <summary>
    /// Convert a DW4 NES map to DQ3r SNES format.
    /// </summary>
    public DQ3rMap Convert(DW4Map source);
    
    /// <summary>
    /// Decompress DW4 RLE-compressed map data.
    /// </summary>
    public byte[] DecompressRle(byte[] compressed);
    
    /// <summary>
    /// Convert 1-byte tiles to 2-byte SNES tiles.
    /// </summary>
    public ushort[] ConvertTiles(byte[] nesTiles);
    
    /// <summary>
    /// Recompress map data using LZSS.
    /// </summary>
    public byte[] CompressLzss(ushort[] tiles);
}
```

### Map Processing Pipeline

```csharp
public DQ3rMap Convert(DW4Map source) {
    // Step 1: Decompress NES RLE data
    byte[] rawTiles = DecompressRle(source.CompressedData);
    
    // Step 2: Convert 1-byte to 2-byte tiles
    ushort[] snesTiles = ConvertTiles(rawTiles);
    
    // Step 3: Add tile properties
    ApplyTileProperties(snesTiles, source.PropertyTable);
    
    // Step 4: Handle size differences
    if (source.Width > 64 || source.Height > 64) {
        // DQ3r supports larger maps, might need to split
        snesTiles = ResizeMap(snesTiles, source.Width, source.Height);
    }
    
    // Step 5: Compress for SNES
    byte[] compressed = CompressLzss(snesTiles);
    
    return new DQ3rMap {
        Id = source.Id,
        Width = source.Width,
        Height = source.Height,
        CompressedData = compressed,
        // ... other properties
    };
}
```

### Tile Mapping Table

```csharp
/// <summary>
/// Maps DW4 NES tile IDs to DQ3r SNES tile IDs.
/// </summary>
public class TileMappingTable {
    private readonly Dictionary<byte, ushort> _mappings;
    
    /// <summary>
    /// Get SNES tile for NES tile.
    /// Returns closest equivalent or placeholder.
    /// </summary>
    public ushort GetSnnesTile(byte nesTile) {
        return _mappings.TryGetValue(nesTile, out var snes) 
            ? snes 
            : DefaultTile;
    }
    
    /// <summary>
    /// Load mappings from configuration file.
    /// </summary>
    public static TileMappingTable LoadFromJson(string path);
}
```

---

## 5. Text Converter

### Class: `TextConverter`

```csharp
namespace DW4Lib.Converters;

public class TextConverter {
    private readonly DW4TextDecoder _decoder;
    private readonly DQ3rTextEncoder _encoder;
    private readonly Dictionary<byte, byte> _controlCodeMap;
    
    /// <summary>
    /// Convert DW4 text block to DQ3r format.
    /// </summary>
    public byte[] Convert(byte[] dw4Text);
    
    /// <summary>
    /// Decode DW4 text to Unicode string.
    /// </summary>
    public string Decode(byte[] dw4Text);
    
    /// <summary>
    /// Encode Unicode string to DQ3r format.
    /// </summary>
    public byte[] Encode(string text);
    
    /// <summary>
    /// Process DTE (dual-tile encoding) compression.
    /// </summary>
    public string ExpandDte(byte[] compressed);
}
```

### Encoding Tables

```csharp
// DW4 NES encoding table
public static class DW4Encoding {
    public static readonly Dictionary<byte, char> Table = new() {
        [0x80] = 'A',
        [0x81] = 'B',
        [0x82] = 'C',
        // ... uppercase letters
        [0xA0] = 'a',
        [0xA1] = 'b',
        // ... lowercase letters
        [0xBA] = '0',
        [0xBB] = '1',
        // ... numbers
        [0xC4] = '.',
        [0xC5] = ',',
        // ... punctuation
    };
    
    // DTE pairs (0xE0-0xFF)
    public static readonly Dictionary<byte, string> DtePairs = new() {
        [0xE0] = "th",
        [0xE1] = "he",
        [0xE2] = "in",
        // ... etc
    };
}
```

---

## 6. Graphics Converter

### Class: `GraphicsConverter`

```csharp
namespace DW4Lib.Converters;

public class GraphicsConverter {
    /// <summary>
    /// Convert 2bpp NES tile to 4bpp SNES tile.
    /// </summary>
    public byte[] Convert2bppTo4bpp(byte[] nesTile);
    
    /// <summary>
    /// Convert NES palette to SNES palette.
    /// </summary>
    public ushort[] ConvertPalette(byte[] nesPalette);
    
    /// <summary>
    /// Expand 4-color palette to 16-color with enhancement.
    /// </summary>
    public ushort[] ExpandPalette(ushort[] snes4Color);
    
    /// <summary>
    /// Convert full CHR bank.
    /// </summary>
    public byte[] ConvertChrBank(byte[] nesBank);
}
```

### Color Conversion

```csharp
/// <summary>
/// Convert NES color index to SNES RGB555 color.
/// </summary>
public static ushort NesToSnesColor(byte nesColor) {
    // NES uses 64-color palette, SNES uses RGB555
    var (r, g, b) = NesPalette[nesColor];
    
    // Convert 8-bit RGB to 5-bit RGB
    int r5 = r >> 3;
    int g5 = g >> 3;
    int b5 = b >> 3;
    
    // SNES RGB555 format: 0bbbbbgggggrrrrr
    return (ushort)((b5 << 10) | (g5 << 5) | r5);
}

/// <summary>
/// Generate shadow colors (darker versions).
/// </summary>
public static ushort[] GenerateShadows(ushort[] baseColors) {
    return baseColors.Select(c => {
        int r = (c & 0x1F) * 2 / 3;
        int g = ((c >> 5) & 0x1F) * 2 / 3;
        int b = ((c >> 10) & 0x1F) * 2 / 3;
        return (ushort)((b << 10) | (g << 5) | r);
    }).ToArray();
}
```

---

## 7. CLI Interface

### Commands

```bash
# Extract all DW4 data to JSON
dotnet dw4-tools extract --rom "Dragon Warrior IV.nes" --output ./extracted

# Convert monsters
dotnet dw4-tools convert monsters --input ./extracted/monsters.json --output ./converted

# Convert items
dotnet dw4-tools convert items --input ./extracted/items.json --output ./converted

# Convert maps
dotnet dw4-tools convert maps --input ./extracted/maps/ --output ./converted/maps/

# Convert all
dotnet dw4-tools convert all --input ./extracted --output ./converted

# Generate DQ3r patch
dotnet dw4-tools patch --data ./converted --base-rom "DQ3r.sfc" --output "DW4-SNES.sfc"
```

### Configuration File

```json
{
  "conversion": {
    "statScaling": {
      "hp": 1.5,
      "attack": 1.2,
      "defense": 1.2,
      "agility": 1.0
    },
    "rewardScaling": {
      "exp": 1.0,
      "gold": 1.0
    },
    "tileMapping": "./config/tile-mapping.json",
    "textEncoding": "./config/text-encoding.json"
  },
  "output": {
    "format": "json",
    "prettyPrint": true
  }
}
```

---

## 8. Testing Requirements

### Unit Tests

```csharp
[TestClass]
public class MonsterConverterTests {
    [TestMethod]
    public void Convert_Slime_ScalesCorrectly() {
        var dw4Slime = new DW4Monster {
            Id = 1,
            Name = "Slime",
            Hp = 8,
            Attack = 7,
            Defense = 4,
            Agility = 4,
            Exp = 1,
            Gold = 2
        };
        
        var converter = new MonsterConverter();
        var result = converter.Convert(dw4Slime, new() { HpScaling = 1.5 });
        
        Assert.AreEqual(12, result.Hp); // 8 * 1.5
    }
    
    [TestMethod]
    public void ConvertAll_PreservesOrder() {
        // ...
    }
}

[TestClass]
public class MapConverterTests {
    [TestMethod]
    public void DecompressRle_ValidData_ReturnsExpected() {
        // ...
    }
    
    [TestMethod]
    public void CompressLzss_RoundTrip_PreservesData() {
        // ...
    }
}
```

---

## 9. Implementation Priority

### Phase 1 (Essential)
1. MonsterConverter - Required for all battles
2. ItemConverter - Required for equipment/shops
3. SpellConverter - Required for magic system
4. TextConverter - Required for all dialog

### Phase 2 (Content)
5. MapConverter - Required for world
6. GraphicsConverter - Required for visuals

### Phase 3 (Polish)
7. Audio tools (if implementing)
8. Optimization tools
9. Validation tools

---

*Last Updated: 2025-12-30*
