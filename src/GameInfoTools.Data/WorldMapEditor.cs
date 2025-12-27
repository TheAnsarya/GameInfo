using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// World map editor for game overworld/dungeon maps.
/// Handles map data, tile placement, events, and warps.
/// </summary>
public class WorldMapEditor {
	/// <summary>
	/// Type of map.
	/// </summary>
	public enum MapType {
		Overworld,
		Dungeon,
		Town,
		Interior,
		Battle,
		MiniMap,
		Custom
	}

	/// <summary>
	/// Map layer type.
	/// </summary>
	public enum LayerType {
		Background,
		Foreground,
		Collision,
		Events,
		Overlay
	}

	/// <summary>
	/// Event trigger type.
	/// </summary>
	public enum EventTriggerType {
		None,
		OnStep,
		OnAction,
		OnTouch,
		OnExit,
		AutoRun,
		Parallel
	}

	/// <summary>
	/// A map layer containing tile data.
	/// </summary>
	public class MapLayer {
		public LayerType Type { get; set; }
		public string Name { get; set; } = "";
		public int Width { get; set; }
		public int Height { get; set; }
		public int[] TileData { get; set; } = [];
		public bool Visible { get; set; } = true;
		public int Priority { get; set; }
	}

	/// <summary>
	/// A warp/teleport point.
	/// </summary>
	public class WarpPoint {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int SourceX { get; set; }
		public int SourceY { get; set; }
		public int DestMapId { get; set; }
		public int DestX { get; set; }
		public int DestY { get; set; }
		public int Direction { get; set; }  // Facing direction after warp
		public int Flags { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// A map event/trigger.
	/// </summary>
	public class MapEvent {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int X { get; set; }
		public int Y { get; set; }
		public int Width { get; set; } = 1;
		public int Height { get; set; } = 1;
		public EventTriggerType TriggerType { get; set; }
		public int ScriptId { get; set; }
		public int SpriteId { get; set; } = -1;  // -1 = invisible
		public int Condition { get; set; }  // Flag/switch that enables this event
		public Dictionary<string, int> Properties { get; } = [];
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// An NPC on the map.
	/// </summary>
	public class MapNpc {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public int X { get; set; }
		public int Y { get; set; }
		public int SpriteId { get; set; }
		public int Direction { get; set; }
		public int MovementType { get; set; }  // Stationary, wander, patrol, etc.
		public int DialogueId { get; set; }
		public int ScriptId { get; set; }
		public bool Solid { get; set; } = true;
		public int Condition { get; set; }
		public int RomOffset { get; set; }
	}

	/// <summary>
	/// A complete map definition.
	/// </summary>
	public class GameMap {
		public int Id { get; set; }
		public string Name { get; set; } = "";
		public MapType Type { get; set; }
		public int Width { get; set; }
		public int Height { get; set; }
		public int TilesetId { get; set; }
		public int PaletteId { get; set; }
		public int MusicId { get; set; }
		public List<MapLayer> Layers { get; } = [];
		public List<WarpPoint> Warps { get; } = [];
		public List<MapEvent> Events { get; } = [];
		public List<MapNpc> Npcs { get; } = [];
		public int[] CollisionData { get; set; } = [];
		public Dictionary<string, int> Properties { get; } = [];
		public int RomOffset { get; set; }
		public int DataSize { get; set; }
		public bool IsCompressed { get; set; }
	}

	/// <summary>
	/// Schema for reading maps from ROM.
	/// </summary>
	public class MapSchema {
		public string Name { get; set; } = "";
		public int MapTableOffset { get; set; }
		public int MapCount { get; set; }
		public int PointerSize { get; set; } = 2;
		public int MapDataBankOffset { get; set; }
		public int DefaultWidth { get; set; } = 32;
		public int DefaultHeight { get; set; } = 32;
		public bool HasDimensions { get; set; }  // Map data includes width/height
		public int WarpTableOffset { get; set; } = -1;
		public int EventTableOffset { get; set; } = -1;
		public int NpcTableOffset { get; set; } = -1;
		public int WarpSize { get; set; } = 8;
		public int EventSize { get; set; } = 8;
		public int NpcSize { get; set; } = 8;
		public bool IsCompressed { get; set; }
		public int CollisionOffset { get; set; } = -1;
	}

	private readonly byte[] _data;
	private readonly List<GameMap> _maps = [];

	public WorldMapEditor(byte[] romData) {
		_data = romData;
	}

	/// <summary>
	/// Gets all loaded maps.
	/// </summary>
	public IReadOnlyList<GameMap> Maps => _maps;

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public MapSchema? Schema { get; private set; }

	/// <summary>
	/// Sets the map schema.
	/// </summary>
	public void SetSchema(MapSchema schema) {
		Schema = schema;
	}

	/// <summary>
	/// Loads all maps from ROM using the configured schema.
	/// </summary>
	public void LoadMaps() {
		if (Schema == null) {
			throw new InvalidOperationException("Schema must be set before loading maps");
		}

		_maps.Clear();

		for (int i = 0; i < Schema.MapCount; i++) {
			var map = LoadMap(i);
			if (map != null) {
				_maps.Add(map);
			}
		}
	}

	/// <summary>
	/// Loads a single map by ID.
	/// </summary>
	public GameMap? LoadMap(int mapId) {
		if (Schema == null) return null;

		// Read pointer to map data
		int pointerOffset = Schema.MapTableOffset + (mapId * Schema.PointerSize);
		if (pointerOffset + Schema.PointerSize > _data.Length) return null;

		int mapPointer = ReadPointer(pointerOffset, Schema.PointerSize);
		int mapDataOffset = mapPointer + Schema.MapDataBankOffset;

		if (mapDataOffset < 0 || mapDataOffset >= _data.Length) return null;

		var map = new GameMap {
			Id = mapId,
			Name = $"Map #{mapId}",
			RomOffset = mapDataOffset
		};

		// Determine map dimensions
		int width = Schema.DefaultWidth;
		int height = Schema.DefaultHeight;
		int dataOffset = mapDataOffset;

		if (Schema.HasDimensions && dataOffset + 2 <= _data.Length) {
			width = _data[dataOffset];
			height = _data[dataOffset + 1];
			dataOffset += 2;
		}

		map.Width = width;
		map.Height = height;

		// Load map tile data
		int tileCount = width * height;
		var tileData = new int[tileCount];

		if (Schema.IsCompressed) {
			// For compressed maps, we'd need specific decompression
			// For now, just read raw
			tileData = ReadRawTileData(dataOffset, tileCount);
		} else {
			tileData = ReadRawTileData(dataOffset, tileCount);
		}

		// Create main layer
		var mainLayer = new MapLayer {
			Type = LayerType.Background,
			Name = "Background",
			Width = width,
			Height = height,
			TileData = tileData,
			Priority = 0
		};
		map.Layers.Add(mainLayer);

		map.DataSize = tileCount;

		// Load warps if present
		if (Schema.WarpTableOffset >= 0) {
			LoadWarps(map, mapId);
		}

		// Load events if present
		if (Schema.EventTableOffset >= 0) {
			LoadEvents(map, mapId);
		}

		// Load NPCs if present
		if (Schema.NpcTableOffset >= 0) {
			LoadNpcs(map, mapId);
		}

		// Load collision if present
		if (Schema.CollisionOffset >= 0) {
			LoadCollision(map);
		}

		return map;
	}

	private int ReadPointer(int offset, int size) {
		if (offset + size > _data.Length) return 0;

		return size switch {
			1 => _data[offset],
			2 => _data[offset] | (_data[offset + 1] << 8),
			3 => _data[offset] | (_data[offset + 1] << 8) | (_data[offset + 2] << 16),
			_ => _data[offset] | (_data[offset + 1] << 8)
		};
	}

	private int[] ReadRawTileData(int offset, int count) {
		var tiles = new int[count];

		for (int i = 0; i < count && offset + i < _data.Length; i++) {
			tiles[i] = _data[offset + i];
		}

		return tiles;
	}

	private void LoadWarps(GameMap map, int mapId) {
		if (Schema == null || Schema.WarpTableOffset < 0) return;

		// This is a simplified warp loading - actual format varies by game
		// Typically warps are stored per-map or in a global table
		int warpOffset = Schema.WarpTableOffset;
		int warpId = 0;

		// Look for warps associated with this map
		// Common format: [MapId, X, Y, DestMap, DestX, DestY, Direction, Flags]
		while (warpOffset + Schema.WarpSize <= _data.Length) {
			int warpMapId = _data[warpOffset];
			if (warpMapId == 0xff) break;  // End marker
			if (warpMapId != mapId) {
				warpOffset += Schema.WarpSize;
				continue;
			}

			var warp = new WarpPoint {
				Id = warpId++,
				SourceX = Schema.WarpSize > 1 ? _data[warpOffset + 1] : 0,
				SourceY = Schema.WarpSize > 2 ? _data[warpOffset + 2] : 0,
				DestMapId = Schema.WarpSize > 3 ? _data[warpOffset + 3] : 0,
				DestX = Schema.WarpSize > 4 ? _data[warpOffset + 4] : 0,
				DestY = Schema.WarpSize > 5 ? _data[warpOffset + 5] : 0,
				Direction = Schema.WarpSize > 6 ? _data[warpOffset + 6] : 0,
				Flags = Schema.WarpSize > 7 ? _data[warpOffset + 7] : 0,
				RomOffset = warpOffset
			};

			map.Warps.Add(warp);
			warpOffset += Schema.WarpSize;
		}
	}

	private void LoadEvents(GameMap map, int mapId) {
		if (Schema == null || Schema.EventTableOffset < 0) return;

		int eventOffset = Schema.EventTableOffset;
		int eventId = 0;

		while (eventOffset + Schema.EventSize <= _data.Length) {
			int eventMapId = _data[eventOffset];
			if (eventMapId == 0xff) break;
			if (eventMapId != mapId) {
				eventOffset += Schema.EventSize;
				continue;
			}

			var evt = new MapEvent {
				Id = eventId++,
				X = Schema.EventSize > 1 ? _data[eventOffset + 1] : 0,
				Y = Schema.EventSize > 2 ? _data[eventOffset + 2] : 0,
				TriggerType = Schema.EventSize > 3 ? (EventTriggerType)(_data[eventOffset + 3] & 0x0f) : EventTriggerType.None,
				ScriptId = Schema.EventSize > 4 ? _data[eventOffset + 4] | (Schema.EventSize > 5 ? _data[eventOffset + 5] << 8 : 0) : 0,
				RomOffset = eventOffset
			};

			map.Events.Add(evt);
			eventOffset += Schema.EventSize;
		}
	}

	private void LoadNpcs(GameMap map, int mapId) {
		if (Schema == null || Schema.NpcTableOffset < 0) return;

		int npcOffset = Schema.NpcTableOffset;
		int npcId = 0;

		while (npcOffset + Schema.NpcSize <= _data.Length) {
			int npcMapId = _data[npcOffset];
			if (npcMapId == 0xff) break;
			if (npcMapId != mapId) {
				npcOffset += Schema.NpcSize;
				continue;
			}

			var npc = new MapNpc {
				Id = npcId++,
				X = Schema.NpcSize > 1 ? _data[npcOffset + 1] : 0,
				Y = Schema.NpcSize > 2 ? _data[npcOffset + 2] : 0,
				SpriteId = Schema.NpcSize > 3 ? _data[npcOffset + 3] : 0,
				Direction = Schema.NpcSize > 4 ? _data[npcOffset + 4] & 0x03 : 0,
				MovementType = Schema.NpcSize > 4 ? (_data[npcOffset + 4] >> 2) & 0x0f : 0,
				DialogueId = Schema.NpcSize > 5 ? _data[npcOffset + 5] : 0,
				RomOffset = npcOffset
			};

			map.Npcs.Add(npc);
			npcOffset += Schema.NpcSize;
		}
	}

	private void LoadCollision(GameMap map) {
		if (Schema == null || Schema.CollisionOffset < 0) return;

		int collisionSize = map.Width * map.Height;
		map.CollisionData = new int[collisionSize];

		int offset = Schema.CollisionOffset;
		for (int i = 0; i < collisionSize && offset + i < _data.Length; i++) {
			map.CollisionData[i] = _data[offset + i];
		}
	}

	/// <summary>
	/// Gets a map by ID.
	/// </summary>
	public GameMap? GetMap(int mapId) {
		return _maps.FirstOrDefault(m => m.Id == mapId);
	}

	/// <summary>
	/// Gets the tile at a specific position.
	/// </summary>
	public int GetTile(int mapId, int x, int y, int layerIndex = 0) {
		var map = GetMap(mapId);
		if (map == null) return -1;
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height) return -1;
		if (layerIndex < 0 || layerIndex >= map.Layers.Count) return -1;

		var layer = map.Layers[layerIndex];
		int index = (y * layer.Width) + x;
		return index < layer.TileData.Length ? layer.TileData[index] : -1;
	}

	/// <summary>
	/// Sets the tile at a specific position.
	/// </summary>
	public bool SetTile(int mapId, int x, int y, int tileId, int layerIndex = 0) {
		var map = GetMap(mapId);
		if (map == null) return false;
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height) return false;
		if (layerIndex < 0 || layerIndex >= map.Layers.Count) return false;

		var layer = map.Layers[layerIndex];
		int index = (y * layer.Width) + x;
		if (index >= layer.TileData.Length) return false;

		layer.TileData[index] = tileId;
		return true;
	}

	/// <summary>
	/// Gets the collision value at a position.
	/// </summary>
	public int GetCollision(int mapId, int x, int y) {
		var map = GetMap(mapId);
		if (map == null || map.CollisionData.Length == 0) return -1;
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height) return -1;

		int index = (y * map.Width) + x;
		return index < map.CollisionData.Length ? map.CollisionData[index] : -1;
	}

	/// <summary>
	/// Sets the collision value at a position.
	/// </summary>
	public bool SetCollision(int mapId, int x, int y, int collision) {
		var map = GetMap(mapId);
		if (map == null || map.CollisionData.Length == 0) return false;
		if (x < 0 || x >= map.Width || y < 0 || y >= map.Height) return false;

		int index = (y * map.Width) + x;
		if (index >= map.CollisionData.Length) return false;

		map.CollisionData[index] = collision;
		return true;
	}

	/// <summary>
	/// Adds a warp point to a map.
	/// </summary>
	public WarpPoint AddWarp(int mapId, int x, int y, int destMapId, int destX, int destY) {
		var map = GetMap(mapId);
		if (map == null) {
			return new WarpPoint();
		}

		var warp = new WarpPoint {
			Id = map.Warps.Count,
			SourceX = x,
			SourceY = y,
			DestMapId = destMapId,
			DestX = destX,
			DestY = destY
		};

		map.Warps.Add(warp);
		return warp;
	}

	/// <summary>
	/// Removes a warp point from a map.
	/// </summary>
	public bool RemoveWarp(int mapId, int warpId) {
		var map = GetMap(mapId);
		if (map == null) return false;

		var warp = map.Warps.FirstOrDefault(w => w.Id == warpId);
		if (warp == null) return false;

		return map.Warps.Remove(warp);
	}

	/// <summary>
	/// Adds an NPC to a map.
	/// </summary>
	public MapNpc AddNpc(int mapId, int x, int y, int spriteId, int dialogueId = 0) {
		var map = GetMap(mapId);
		if (map == null) {
			return new MapNpc();
		}

		var npc = new MapNpc {
			Id = map.Npcs.Count,
			X = x,
			Y = y,
			SpriteId = spriteId,
			DialogueId = dialogueId
		};

		map.Npcs.Add(npc);
		return npc;
	}

	/// <summary>
	/// Removes an NPC from a map.
	/// </summary>
	public bool RemoveNpc(int mapId, int npcId) {
		var map = GetMap(mapId);
		if (map == null) return false;

		var npc = map.Npcs.FirstOrDefault(n => n.Id == npcId);
		if (npc == null) return false;

		return map.Npcs.Remove(npc);
	}

	/// <summary>
	/// Adds an event to a map.
	/// </summary>
	public MapEvent AddEvent(int mapId, int x, int y, EventTriggerType triggerType, int scriptId) {
		var map = GetMap(mapId);
		if (map == null) {
			return new MapEvent();
		}

		var evt = new MapEvent {
			Id = map.Events.Count,
			X = x,
			Y = y,
			TriggerType = triggerType,
			ScriptId = scriptId
		};

		map.Events.Add(evt);
		return evt;
	}

	/// <summary>
	/// Gets all warps at a specific position.
	/// </summary>
	public List<WarpPoint> GetWarpsAt(int mapId, int x, int y) {
		var map = GetMap(mapId);
		if (map == null) return [];

		return map.Warps.Where(w => w.SourceX == x && w.SourceY == y).ToList();
	}

	/// <summary>
	/// Gets all NPCs at a specific position.
	/// </summary>
	public List<MapNpc> GetNpcsAt(int mapId, int x, int y) {
		var map = GetMap(mapId);
		if (map == null) return [];

		return map.Npcs.Where(n => n.X == x && n.Y == y).ToList();
	}

	/// <summary>
	/// Gets all events at a specific position.
	/// </summary>
	public List<MapEvent> GetEventsAt(int mapId, int x, int y) {
		var map = GetMap(mapId);
		if (map == null) return [];

		return map.Events.Where(e =>
			x >= e.X && x < e.X + e.Width &&
			y >= e.Y && y < e.Y + e.Height
		).ToList();
	}

	/// <summary>
	/// Finds all maps that warp to a specific map.
	/// </summary>
	public List<(int MapId, WarpPoint Warp)> FindWarpsTo(int destMapId) {
		var results = new List<(int, WarpPoint)>();

		foreach (var map in _maps) {
			foreach (var warp in map.Warps) {
				if (warp.DestMapId == destMapId) {
					results.Add((map.Id, warp));
				}
			}
		}

		return results;
	}

	/// <summary>
	/// Validates map connections (warps).
	/// </summary>
	public List<string> ValidateConnections() {
		var errors = new List<string>();

		foreach (var map in _maps) {
			foreach (var warp in map.Warps) {
				// Check if destination map exists
				if (!_maps.Any(m => m.Id == warp.DestMapId)) {
					errors.Add($"Map {map.Id} warp #{warp.Id}: Destination map {warp.DestMapId} not found");
				}
			}
		}

		return errors;
	}

	/// <summary>
	/// Fills a rectangular area with a tile.
	/// </summary>
	public bool FillRect(int mapId, int x, int y, int width, int height, int tileId, int layerIndex = 0) {
		var map = GetMap(mapId);
		if (map == null) return false;

		for (int ty = y; ty < y + height; ty++) {
			for (int tx = x; tx < x + width; tx++) {
				SetTile(mapId, tx, ty, tileId, layerIndex);
			}
		}

		return true;
	}

	/// <summary>
	/// Copies a region of tiles.
	/// </summary>
	public int[] CopyRegion(int mapId, int x, int y, int width, int height, int layerIndex = 0) {
		var map = GetMap(mapId);
		if (map == null) return [];

		var tiles = new int[width * height];
		for (int ty = 0; ty < height; ty++) {
			for (int tx = 0; tx < width; tx++) {
				tiles[(ty * width) + tx] = GetTile(mapId, x + tx, y + ty, layerIndex);
			}
		}

		return tiles;
	}

	/// <summary>
	/// Pastes tiles to a region.
	/// </summary>
	public bool PasteRegion(int mapId, int x, int y, int[] tiles, int width, int height, int layerIndex = 0) {
		var map = GetMap(mapId);
		if (map == null) return false;
		if (tiles.Length != width * height) return false;

		for (int ty = 0; ty < height; ty++) {
			for (int tx = 0; tx < width; tx++) {
				SetTile(mapId, x + tx, y + ty, tiles[(ty * width) + tx], layerIndex);
			}
		}

		return true;
	}

	/// <summary>
	/// Exports map to JSON.
	/// </summary>
	public string ExportToJson(int mapId) {
		var map = GetMap(mapId);
		if (map == null) return "{}";

		return JsonSerializer.Serialize(map, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Gets map statistics.
	/// </summary>
	public MapStatistics GetStatistics(int mapId) {
		var map = GetMap(mapId);
		if (map == null) {
			return new MapStatistics(0, 0, 0, 0, 0, 0, []);
		}

		// Count unique tiles
		var uniqueTiles = new HashSet<int>();
		foreach (var layer in map.Layers) {
			foreach (var tile in layer.TileData) {
				uniqueTiles.Add(tile);
			}
		}

		// Count tile usage
		var tileCounts = new Dictionary<int, int>();
		foreach (var layer in map.Layers) {
			foreach (var tile in layer.TileData) {
				if (!tileCounts.ContainsKey(tile)) {
					tileCounts[tile] = 0;
				}

				tileCounts[tile]++;
			}
		}

		return new MapStatistics(
			Width: map.Width,
			Height: map.Height,
			UniqueTiles: uniqueTiles.Count,
			WarpCount: map.Warps.Count,
			NpcCount: map.Npcs.Count,
			EventCount: map.Events.Count,
			TileCounts: tileCounts
		);
	}

	/// <summary>
	/// Statistics about a map.
	/// </summary>
	public record MapStatistics(
		int Width,
		int Height,
		int UniqueTiles,
		int WarpCount,
		int NpcCount,
		int EventCount,
		Dictionary<int, int> TileCounts
	);

	/// <summary>
	/// Creates a schema for NES-style maps.
	/// </summary>
	public static MapSchema CreateNesSchema(int mapTableOffset, int mapCount, int bankOffset = 0x8000) {
		return new MapSchema {
			Name = "NES Maps",
			MapTableOffset = mapTableOffset,
			MapCount = mapCount,
			PointerSize = 2,
			MapDataBankOffset = bankOffset - 0x8000,  // Convert CPU to file address
			DefaultWidth = 32,
			DefaultHeight = 32,
			HasDimensions = false
		};
	}

	/// <summary>
	/// Creates a schema for SNES-style maps.
	/// </summary>
	public static MapSchema CreateSnesSchema(int mapTableOffset, int mapCount) {
		return new MapSchema {
			Name = "SNES Maps",
			MapTableOffset = mapTableOffset,
			MapCount = mapCount,
			PointerSize = 3,  // 24-bit pointers
			MapDataBankOffset = 0,
			DefaultWidth = 64,
			DefaultHeight = 64,
			HasDimensions = true
		};
	}

	/// <summary>
	/// Creates a schema for Game Boy-style maps.
	/// </summary>
	public static MapSchema CreateGameBoySchema(int mapTableOffset, int mapCount, int bankOffset = 0x4000) {
		return new MapSchema {
			Name = "Game Boy Maps",
			MapTableOffset = mapTableOffset,
			MapCount = mapCount,
			PointerSize = 2,
			MapDataBankOffset = bankOffset - 0x4000,
			DefaultWidth = 20,
			DefaultHeight = 18,
			HasDimensions = true
		};
	}
}
