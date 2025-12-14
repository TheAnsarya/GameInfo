namespace GameInfoTools.Data.MapFormats;

/// <summary>
/// Map format definitions for Dragon Warrior (NES) series.
/// </summary>
public static class DragonWarriorMaps {
	/// <summary>
	/// Dragon Warrior 1 map dimensions.
	/// </summary>
	public static readonly MapDefinition[] Dw1Maps = [
		new("Overworld", 0x0000, 120, 120, MapFormat.Compressed, "Main overworld map"),
		new("Tantegel Castle", 0x1000, 20, 20, MapFormat.Tiled, "King Lorik's castle"),
		new("Tantegel Town", 0x1200, 24, 24, MapFormat.Tiled, "Starting town"),
		new("Charlock Castle", 0x1400, 32, 32, MapFormat.Tiled, "Final dungeon exterior"),
		new("Charlock Dungeon", 0x1800, 20, 50, MapFormat.Tiled, "Final dungeon interior"),
		new("Swamp Cave", 0x1c00, 10, 10, MapFormat.Tiled, "South cave"),
		new("Rocky Mountain Cave", 0x1e00, 10, 10, MapFormat.Tiled, "North cave"),
		new("Erdrick's Cave", 0x2000, 10, 10, MapFormat.Tiled, "Token cave"),
		new("Garinham", 0x2200, 16, 16, MapFormat.Tiled, "Northern town"),
		new("Kol", 0x2400, 16, 16, MapFormat.Tiled, "Eastern town"),
		new("Rimuldar", 0x2600, 16, 16, MapFormat.Tiled, "Central town"),
		new("Cantlin", 0x2800, 16, 16, MapFormat.Tiled, "Southern town"),
		new("Hauksness", 0x2a00, 16, 16, MapFormat.Tiled, "Ruined town"),
	];

	/// <summary>
	/// Dragon Warrior 4 map structure (NES).
	/// Maps use metatile compression with 16x16 metatiles.
	/// </summary>
	public static readonly MapDefinition[] Dw4Maps = [
		new("Overworld Ch1", 0x08000, 128, 128, MapFormat.Metatile, "Chapter 1 overworld"),
		new("Overworld Ch2", 0x0a000, 128, 128, MapFormat.Metatile, "Chapter 2 overworld"),
		new("Overworld Ch3", 0x0c000, 128, 128, MapFormat.Metatile, "Chapter 3 overworld"),
		new("Overworld Ch4", 0x0e000, 128, 128, MapFormat.Metatile, "Chapter 4 overworld"),
		new("Overworld Ch5", 0x10000, 256, 256, MapFormat.Metatile, "Chapter 5 overworld"),
		new("Burland Castle", 0x12000, 32, 32, MapFormat.Metatile, "Ragnar's starting castle"),
		new("Izmit", 0x12400, 24, 24, MapFormat.Metatile, "Town near Burland"),
	];

	/// <summary>
	/// Tile types for Dragon Warrior overworld.
	/// </summary>
	public static readonly TileDefinition[] Dw1OverworldTiles = [
		new(0x00, "Grass", true, false, "Normal grass terrain"),
		new(0x01, "Forest", true, false, "Forested area"),
		new(0x02, "Hills", true, false, "Hilly terrain"),
		new(0x03, "Mountains", false, false, "Impassable mountains"),
		new(0x04, "Water", false, true, "Ocean/lake"),
		new(0x05, "Desert", true, false, "Desert terrain"),
		new(0x06, "Swamp", true, false, "Poisonous swamp"),
		new(0x07, "Bridge", true, false, "Bridge over water"),
		new(0x08, "Town", true, false, "Town entrance"),
		new(0x09, "Castle", true, false, "Castle entrance"),
		new(0x0a, "Cave", true, false, "Dungeon entrance"),
		new(0x0b, "Shrine", true, false, "Shrine building"),
	];
}

/// <summary>
/// Map format definitions for Final Fantasy (NES) series.
/// </summary>
public static class FinalFantasyMaps {
	/// <summary>
	/// Final Fantasy 1 (NES) map locations.
	/// </summary>
	public static readonly MapDefinition[] Ff1Maps = [
		new("Overworld", 0x04000, 256, 256, MapFormat.Compressed, "World map"),
		new("Cornelia", 0x10000, 64, 64, MapFormat.Tiled, "Starting town"),
		new("Cornelia Castle", 0x10800, 32, 32, MapFormat.Tiled, "Castle"),
		new("Temple of Fiends", 0x11000, 64, 64, MapFormat.Tiled, "First/final dungeon"),
		new("Pravoka", 0x11800, 48, 48, MapFormat.Tiled, "Port town"),
		new("Elfheim", 0x12000, 48, 48, MapFormat.Tiled, "Elf town"),
		new("Marsh Cave", 0x12800, 64, 64, MapFormat.Tiled, "Poison dungeon"),
		new("Melmond", 0x13000, 48, 48, MapFormat.Tiled, "Earth town"),
		new("Earth Cave", 0x13800, 80, 80, MapFormat.Tiled, "Earth crystal dungeon"),
		new("Crescent Lake", 0x14000, 48, 48, MapFormat.Tiled, "Sage town"),
		new("Ice Cave", 0x14800, 64, 64, MapFormat.Tiled, "Ice dungeon"),
		new("Gurgu Volcano", 0x15000, 64, 64, MapFormat.Tiled, "Fire dungeon"),
		new("Sea Shrine", 0x15800, 64, 64, MapFormat.Tiled, "Water dungeon"),
		new("Mirage Tower", 0x16000, 32, 32, MapFormat.Tiled, "Sky entrance"),
		new("Sky Palace", 0x16800, 64, 64, MapFormat.Tiled, "Air dungeon"),
	];

	/// <summary>
	/// Final Fantasy 1 tile types for overworld.
	/// </summary>
	public static readonly TileDefinition[] Ff1OverworldTiles = [
		new(0x00, "Ocean", false, true, "Deep water"),
		new(0x01, "Land", true, false, "Normal terrain"),
		new(0x02, "Forest", true, false, "Forest"),
		new(0x03, "Mountain", false, false, "Impassable mountain"),
		new(0x04, "Marsh", true, false, "Swamp"),
		new(0x05, "Desert", true, false, "Desert"),
		new(0x06, "River", false, true, "River"),
		new(0x07, "Coast", false, true, "Shallow water"),
		new(0x08, "Town", true, false, "Town entrance"),
		new(0x09, "Castle", true, false, "Castle entrance"),
		new(0x0a, "Cave", true, false, "Dungeon entrance"),
		new(0x0b, "Bridge", true, false, "Bridge"),
		new(0x0c, "Grass", true, false, "Grassland"),
	];
}

/// <summary>
/// Map format definitions for Final Fantasy IV/II (SNES).
/// </summary>
public static class FinalFantasy4Maps {
	/// <summary>
	/// FF4 SNES map metadata.
	/// Uses 16x16 metatiles with layer 1 and 2.
	/// </summary>
	public static readonly MapDefinition[] Ff4Maps = [
		new("Overworld", 0x100000, 256, 256, MapFormat.Snes16x16, "Surface world map"),
		new("Underworld", 0x110000, 256, 256, MapFormat.Snes16x16, "Underground map"),
		new("Moon", 0x120000, 128, 128, MapFormat.Snes16x16, "Lunar surface"),
		new("Baron Castle", 0x130000, 64, 64, MapFormat.Snes16x16, "Dark Knight's castle"),
		new("Baron Town", 0x131000, 48, 48, MapFormat.Snes16x16, "Starting town"),
		new("Mist Cave", 0x132000, 32, 96, MapFormat.Snes16x16, "First dungeon"),
		new("Mist Village", 0x133000, 32, 32, MapFormat.Snes16x16, "Summoner village"),
		new("Kaipo", 0x134000, 40, 40, MapFormat.Snes16x16, "Desert town"),
		new("Water Cavern", 0x135000, 48, 128, MapFormat.Snes16x16, "Octomamm dungeon"),
		new("Damcyan Castle", 0x136000, 48, 48, MapFormat.Snes16x16, "Edward's castle"),
		new("Mount Hobbs", 0x137000, 32, 96, MapFormat.Snes16x16, "Mountain path"),
		new("Fabul Castle", 0x138000, 48, 48, MapFormat.Snes16x16, "Monk kingdom"),
		new("Tower of Zot", 0x139000, 32, 128, MapFormat.Snes16x16, "Golbez's tower"),
	];
}

/// <summary>
/// Map format type enumeration.
/// </summary>
public enum MapFormat {
	/// <summary>Linear tile array, one byte per tile.</summary>
	Tiled,
	/// <summary>RLE or other compression.</summary>
	Compressed,
	/// <summary>16x16 metatile system (NES RPGs).</summary>
	Metatile,
	/// <summary>SNES 16x16 metatile with dual layers.</summary>
	Snes16x16,
	/// <summary>Mode 7 rotation/scaling format.</summary>
	Mode7,
}

/// <summary>
/// Represents a map definition.
/// </summary>
/// <param name="Name">Human-readable map name.</param>
/// <param name="Offset">ROM offset to map data.</param>
/// <param name="Width">Map width in tiles.</param>
/// <param name="Height">Map height in tiles.</param>
/// <param name="Format">Map storage format.</param>
/// <param name="Description">Description of the map.</param>
public record MapDefinition(string Name, int Offset, int Width, int Height, MapFormat Format, string Description);

/// <summary>
/// Represents a tile type definition.
/// </summary>
/// <param name="Id">Tile ID value.</param>
/// <param name="Name">Tile name.</param>
/// <param name="Walkable">Whether the tile can be walked on.</param>
/// <param name="Water">Whether the tile is water (requires boat/canoe).</param>
/// <param name="Description">Description of the tile.</param>
public record TileDefinition(byte Id, string Name, bool Walkable, bool Water, string Description);
