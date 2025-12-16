using GameInfoTools.Data;

namespace GameInfoTools.Tests.Data;

/// <summary>
/// Tests for the WorldMapEditor service.
/// </summary>
public class WorldMapEditorTests {
	private static byte[] CreateTestRomData() {
		var data = new byte[0x2000];

		// Map pointer table at 0x100 (4 maps, 2 bytes each)
		// Using direct file offsets (little-endian)
		data[0x100] = 0x00; // Map 0 -> 0x0200
		data[0x101] = 0x02;
		data[0x102] = 0x00; // Map 1 -> 0x0400
		data[0x103] = 0x04;
		data[0x104] = 0x00; // Map 2 -> 0x0600
		data[0x105] = 0x06;
		data[0x106] = 0x00; // Map 3 -> 0x0800
		data[0x107] = 0x08;

		// Map 0 data at 0x200 (8x8 simple map)
		// For HasDimensions=true, first 2 bytes are width, height
		data[0x200] = 8;  // Width
		data[0x201] = 8;  // Height
						  // Fill 64 tiles
		for (int i = 0; i < 64; i++) {
			data[0x202 + i] = (byte)(i % 4);  // Tiles 0-3 repeating
		}

		// Map 1 data at 0x400 (8x8 with different tiles)
		data[0x400] = 8;
		data[0x401] = 8;
		for (int i = 0; i < 64; i++) {
			data[0x402 + i] = (byte)(i / 8);  // Row number as tile
		}

		// Map 2 data at 0x600 (4x4 small map)
		data[0x600] = 4;
		data[0x601] = 4;
		for (int i = 0; i < 16; i++) {
			data[0x602 + i] = (byte)i;  // Unique tiles 0-15
		}

		// Map 3 data at 0x800 (16x16 larger map)
		data[0x800] = 16;
		data[0x801] = 16;
		for (int i = 0; i < 256; i++) {
			data[0x802 + i] = (byte)(i % 16);
		}

		// Warp table at 0x1000
		// Format: MapId, SourceX, SourceY, DestMap, DestX, DestY, Direction, Flags
		int warpOffset = 0x1000;
		// Warp 0: Map 0 (5,5) -> Map 1 (2,2)
		data[warpOffset + 0] = 0;     // Map 0
		data[warpOffset + 1] = 5;     // SourceX
		data[warpOffset + 2] = 5;     // SourceY
		data[warpOffset + 3] = 1;     // DestMap
		data[warpOffset + 4] = 2;     // DestX
		data[warpOffset + 5] = 2;     // DestY
		data[warpOffset + 6] = 0;     // Direction (down)
		data[warpOffset + 7] = 0;     // Flags
									  // Warp 1: Map 1 (2,2) -> Map 0 (5,5)
		warpOffset += 8;
		data[warpOffset + 0] = 1;
		data[warpOffset + 1] = 2;
		data[warpOffset + 2] = 2;
		data[warpOffset + 3] = 0;
		data[warpOffset + 4] = 5;
		data[warpOffset + 5] = 5;
		data[warpOffset + 6] = 2;
		data[warpOffset + 7] = 0;
		// End marker
		warpOffset += 8;
		data[warpOffset] = 0xff;

		// NPC table at 0x1100
		// Format: MapId, X, Y, SpriteId, Direction|Movement, DialogueId, padding, padding
		int npcOffset = 0x1100;
		// NPC 0: Map 0 at (3,4) sprite 5
		data[npcOffset + 0] = 0;     // Map 0
		data[npcOffset + 1] = 3;     // X
		data[npcOffset + 2] = 4;     // Y
		data[npcOffset + 3] = 5;     // SpriteId
		data[npcOffset + 4] = 0x12;  // Direction 2, Movement 4
		data[npcOffset + 5] = 10;    // DialogueId
		data[npcOffset + 6] = 0;
		data[npcOffset + 7] = 0;
		// NPC 1: Map 0 at (6,6) sprite 3
		npcOffset += 8;
		data[npcOffset + 0] = 0;
		data[npcOffset + 1] = 6;
		data[npcOffset + 2] = 6;
		data[npcOffset + 3] = 3;
		data[npcOffset + 4] = 0x00;
		data[npcOffset + 5] = 20;
		data[npcOffset + 6] = 0;
		data[npcOffset + 7] = 0;
		// End marker
		npcOffset += 8;
		data[npcOffset] = 0xff;

		// Event table at 0x1200
		// Format: MapId, X, Y, TriggerType, ScriptIdLo, ScriptIdHi, padding, padding
		int eventOffset = 0x1200;
		// Event 0: Map 0 at (7,7) OnStep trigger
		data[eventOffset + 0] = 0;    // Map 0
		data[eventOffset + 1] = 7;    // X
		data[eventOffset + 2] = 7;    // Y
		data[eventOffset + 3] = 1;    // OnStep
		data[eventOffset + 4] = 0x34; // Script 0x1234
		data[eventOffset + 5] = 0x12;
		data[eventOffset + 6] = 0;
		data[eventOffset + 7] = 0;
		// End marker
		eventOffset += 8;
		data[eventOffset] = 0xff;

		return data;
	}

	private static WorldMapEditor CreateEditorWithSchema() {
		var data = CreateTestRomData();
		var editor = new WorldMapEditor(data);

		var schema = new WorldMapEditor.MapSchema {
			Name = "Test Maps",
			MapTableOffset = 0x100,
			MapCount = 4,
			PointerSize = 2,
			MapDataBankOffset = 0,  // Already using file offsets
			DefaultWidth = 8,
			DefaultHeight = 8,
			HasDimensions = true,
			WarpTableOffset = 0x1000,
			WarpSize = 8,
			NpcTableOffset = 0x1100,
			NpcSize = 8,
			EventTableOffset = 0x1200,
			EventSize = 8
		};

		editor.SetSchema(schema);
		return editor;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var data = new byte[100];
		var editor = new WorldMapEditor(data);
		Assert.NotNull(editor);
		Assert.Empty(editor.Maps);
	}

	[Fact]
	public void Constructor_WithEmptyData_CreatesInstance() {
		var data = Array.Empty<byte>();
		var editor = new WorldMapEditor(data);
		Assert.NotNull(editor);
	}

	#endregion

	#region Schema Tests

	[Fact]
	public void SetSchema_StoresSchema() {
		var data = new byte[100];
		var editor = new WorldMapEditor(data);
		var schema = new WorldMapEditor.MapSchema {
			Name = "Test",
			MapCount = 10
		};

		editor.SetSchema(schema);

		Assert.Equal(schema, editor.Schema);
	}

	[Fact]
	public void CreateNesSchema_ReturnsCorrectFormat() {
		var schema = WorldMapEditor.CreateNesSchema(0x8000, 100);

		Assert.Equal("NES Maps", schema.Name);
		Assert.Equal(0x8000, schema.MapTableOffset);
		Assert.Equal(100, schema.MapCount);
		Assert.Equal(2, schema.PointerSize);
		Assert.Equal(32, schema.DefaultWidth);
		Assert.Equal(32, schema.DefaultHeight);
	}

	[Fact]
	public void CreateSnesSchema_ReturnsCorrectFormat() {
		var schema = WorldMapEditor.CreateSnesSchema(0x10000, 200);

		Assert.Equal("SNES Maps", schema.Name);
		Assert.Equal(3, schema.PointerSize);
		Assert.Equal(64, schema.DefaultWidth);
		Assert.True(schema.HasDimensions);
	}

	[Fact]
	public void CreateGameBoySchema_ReturnsCorrectFormat() {
		var schema = WorldMapEditor.CreateGameBoySchema(0x4000, 50);

		Assert.Equal("Game Boy Maps", schema.Name);
		Assert.Equal(2, schema.PointerSize);
		Assert.Equal(20, schema.DefaultWidth);
		Assert.Equal(18, schema.DefaultHeight);
	}

	#endregion

	#region Load Maps Tests

	[Fact]
	public void LoadMaps_LoadsAllMaps() {
		var editor = CreateEditorWithSchema();

		editor.LoadMaps();

		Assert.Equal(4, editor.Maps.Count);
	}

	[Fact]
	public void LoadMaps_WithoutSchema_ThrowsException() {
		var data = new byte[100];
		var editor = new WorldMapEditor(data);

		Assert.Throws<InvalidOperationException>(() => editor.LoadMaps());
	}

	[Fact]
	public void LoadMap_SetsCorrectDimensions() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Equal(8, map.Width);
		Assert.Equal(8, map.Height);
	}

	[Fact]
	public void LoadMap_LoadsTileData() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Single(map.Layers);
		Assert.Equal(64, map.Layers[0].TileData.Length);
	}

	[Fact]
	public void LoadMap_LoadsWarps() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Single(map.Warps);
		Assert.Equal(5, map.Warps[0].SourceX);
		Assert.Equal(5, map.Warps[0].SourceY);
		Assert.Equal(1, map.Warps[0].DestMapId);
	}

	[Fact]
	public void LoadMap_LoadsNpcs() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Equal(2, map.Npcs.Count);
		Assert.Equal(3, map.Npcs[0].X);
		Assert.Equal(4, map.Npcs[0].Y);
		Assert.Equal(5, map.Npcs[0].SpriteId);
	}

	[Fact]
	public void LoadMap_LoadsEvents() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Single(map.Events);
		Assert.Equal(7, map.Events[0].X);
		Assert.Equal(7, map.Events[0].Y);
		Assert.Equal(WorldMapEditor.EventTriggerType.OnStep, map.Events[0].TriggerType);
	}

	[Fact]
	public void LoadMap_SetsRomOffset() {
		var editor = CreateEditorWithSchema();

		var map = editor.LoadMap(0);

		Assert.NotNull(map);
		Assert.Equal(0x200, map.RomOffset);
	}

	[Fact]
	public void LoadMap_DifferentSizedMaps() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var smallMap = editor.GetMap(2);  // 4x4
		var largeMap = editor.GetMap(3);  // 16x16

		Assert.NotNull(smallMap);
		Assert.NotNull(largeMap);
		Assert.Equal(4, smallMap.Width);
		Assert.Equal(4, smallMap.Height);
		Assert.Equal(16, largeMap.Width);
		Assert.Equal(16, largeMap.Height);
	}

	#endregion

	#region Tile Access Tests

	[Fact]
	public void GetTile_ReturnsCorrectTile() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		// Map 0 has tiles (i % 4) repeating
		int tile = editor.GetTile(0, 0, 0);

		Assert.Equal(0, tile);
	}

	[Fact]
	public void GetTile_ReturnsMinusOneForInvalidPosition() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		int tile = editor.GetTile(0, 100, 100);

		Assert.Equal(-1, tile);
	}

	[Fact]
	public void GetTile_ReturnsMinusOneForInvalidMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		int tile = editor.GetTile(999, 0, 0);

		Assert.Equal(-1, tile);
	}

	[Fact]
	public void SetTile_UpdatesTile() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		bool result = editor.SetTile(0, 0, 0, 99);

		Assert.True(result);
		Assert.Equal(99, editor.GetTile(0, 0, 0));
	}

	[Fact]
	public void SetTile_ReturnsFalseForInvalidPosition() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		bool result = editor.SetTile(0, 100, 100, 99);

		Assert.False(result);
	}

	#endregion

	#region Map Access Tests

	[Fact]
	public void GetMap_ReturnsLoadedMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var map = editor.GetMap(1);

		Assert.NotNull(map);
		Assert.Equal(1, map.Id);
	}

	[Fact]
	public void GetMap_ReturnsNullForUnknownId() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var map = editor.GetMap(999);

		Assert.Null(map);
	}

	#endregion

	#region Warp Tests

	[Fact]
	public void AddWarp_AddsWarpToMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var warp = editor.AddWarp(0, 1, 1, 2, 3, 4);

		Assert.Equal(1, warp.SourceX);
		Assert.Equal(1, warp.SourceY);
		Assert.Equal(2, warp.DestMapId);
		Assert.Equal(3, warp.DestX);
		Assert.Equal(4, warp.DestY);
	}

	[Fact]
	public void RemoveWarp_RemovesWarpFromMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var map = editor.GetMap(0);
		int originalCount = map!.Warps.Count;

		bool result = editor.RemoveWarp(0, 0);

		Assert.True(result);
		Assert.Equal(originalCount - 1, map.Warps.Count);
	}

	[Fact]
	public void GetWarpsAt_ReturnsWarpsAtPosition() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var warps = editor.GetWarpsAt(0, 5, 5);

		Assert.Single(warps);
		Assert.Equal(1, warps[0].DestMapId);
	}

	[Fact]
	public void FindWarpsTo_FindsAllIncomingWarps() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var warpsTo0 = editor.FindWarpsTo(0);

		Assert.Single(warpsTo0);
		Assert.Equal(1, warpsTo0[0].MapId);  // Warp from map 1
	}

	#endregion

	#region NPC Tests

	[Fact]
	public void AddNpc_AddsNpcToMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var npc = editor.AddNpc(0, 1, 2, 10, 50);

		Assert.Equal(1, npc.X);
		Assert.Equal(2, npc.Y);
		Assert.Equal(10, npc.SpriteId);
		Assert.Equal(50, npc.DialogueId);
	}

	[Fact]
	public void RemoveNpc_RemovesNpcFromMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var map = editor.GetMap(0);
		int originalCount = map!.Npcs.Count;

		bool result = editor.RemoveNpc(0, 0);

		Assert.True(result);
		Assert.Equal(originalCount - 1, map.Npcs.Count);
	}

	[Fact]
	public void GetNpcsAt_ReturnsNpcsAtPosition() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var npcs = editor.GetNpcsAt(0, 3, 4);

		Assert.Single(npcs);
		Assert.Equal(5, npcs[0].SpriteId);
	}

	#endregion

	#region Event Tests

	[Fact]
	public void AddEvent_AddsEventToMap() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var evt = editor.AddEvent(0, 2, 3, WorldMapEditor.EventTriggerType.OnAction, 100);

		Assert.Equal(2, evt.X);
		Assert.Equal(3, evt.Y);
		Assert.Equal(WorldMapEditor.EventTriggerType.OnAction, evt.TriggerType);
		Assert.Equal(100, evt.ScriptId);
	}

	[Fact]
	public void GetEventsAt_ReturnsEventsAtPosition() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var events = editor.GetEventsAt(0, 7, 7);

		Assert.Single(events);
		Assert.Equal(WorldMapEditor.EventTriggerType.OnStep, events[0].TriggerType);
	}

	#endregion

	#region Region Operations Tests

	[Fact]
	public void FillRect_FillsArea() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		bool result = editor.FillRect(0, 0, 0, 3, 3, 99);

		Assert.True(result);
		for (int y = 0; y < 3; y++) {
			for (int x = 0; x < 3; x++) {
				Assert.Equal(99, editor.GetTile(0, x, y));
			}
		}
	}

	[Fact]
	public void CopyRegion_CopiesTiles() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		// Map 2 (4x4) has tiles 0-15 sequentially
		var tiles = editor.CopyRegion(2, 0, 0, 2, 2);

		Assert.Equal(4, tiles.Length);
		Assert.Equal(0, tiles[0]);
		Assert.Equal(1, tiles[1]);
		Assert.Equal(4, tiles[2]);  // Second row starts at tile 4
		Assert.Equal(5, tiles[3]);
	}

	[Fact]
	public void PasteRegion_PastesTiles() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		int[] tiles = [10, 11, 12, 13];
		bool result = editor.PasteRegion(0, 1, 1, tiles, 2, 2);

		Assert.True(result);
		Assert.Equal(10, editor.GetTile(0, 1, 1));
		Assert.Equal(11, editor.GetTile(0, 2, 1));
		Assert.Equal(12, editor.GetTile(0, 1, 2));
		Assert.Equal(13, editor.GetTile(0, 2, 2));
	}

	[Fact]
	public void PasteRegion_WrongSize_ReturnsFalse() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		int[] tiles = [1, 2, 3];  // Wrong size for 2x2

		bool result = editor.PasteRegion(0, 0, 0, tiles, 2, 2);

		Assert.False(result);
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void ValidateConnections_ReturnsEmptyForValidMaps() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var errors = editor.ValidateConnections();

		Assert.Empty(errors);  // All warps point to valid maps
	}

	[Fact]
	public void ValidateConnections_ReportsInvalidDestinations() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		// Add warp to non-existent map
		editor.AddWarp(0, 0, 0, 999, 0, 0);

		var errors = editor.ValidateConnections();

		Assert.Single(errors);
		Assert.Contains("999", errors[0]);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportToJson_ReturnsValidJson() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		string json = editor.ExportToJson(0);

		Assert.NotEmpty(json);
		Assert.Contains("Map #0", json);
		Assert.Contains("Layers", json);
		Assert.Contains("Warps", json);
	}

	[Fact]
	public void ExportToJson_UnknownId_ReturnsEmptyObject() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		string json = editor.ExportToJson(999);

		Assert.Equal("{}", json);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var stats = editor.GetStatistics(0);

		Assert.Equal(8, stats.Width);
		Assert.Equal(8, stats.Height);
		Assert.Equal(1, stats.WarpCount);
		Assert.Equal(2, stats.NpcCount);
		Assert.Equal(1, stats.EventCount);
	}

	[Fact]
	public void GetStatistics_CountsUniqueTiles() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var stats = editor.GetStatistics(0);

		// Map 0 uses tiles 0-3 repeating
		Assert.Equal(4, stats.UniqueTiles);
	}

	[Fact]
	public void GetStatistics_UnknownId_ReturnsZeros() {
		var editor = CreateEditorWithSchema();
		editor.LoadMaps();

		var stats = editor.GetStatistics(999);

		Assert.Equal(0, stats.Width);
		Assert.Equal(0, stats.Height);
	}

	#endregion

	#region Enum Tests

	[Fact]
	public void MapType_AllValuesExist() {
		var values = Enum.GetValues<WorldMapEditor.MapType>();

		Assert.Contains(WorldMapEditor.MapType.Overworld, values);
		Assert.Contains(WorldMapEditor.MapType.Dungeon, values);
		Assert.Contains(WorldMapEditor.MapType.Town, values);
		Assert.Contains(WorldMapEditor.MapType.Interior, values);
	}

	[Fact]
	public void LayerType_AllValuesExist() {
		var values = Enum.GetValues<WorldMapEditor.LayerType>();

		Assert.Contains(WorldMapEditor.LayerType.Background, values);
		Assert.Contains(WorldMapEditor.LayerType.Foreground, values);
		Assert.Contains(WorldMapEditor.LayerType.Collision, values);
		Assert.Contains(WorldMapEditor.LayerType.Events, values);
	}

	[Fact]
	public void EventTriggerType_AllValuesExist() {
		var values = Enum.GetValues<WorldMapEditor.EventTriggerType>();

		Assert.Contains(WorldMapEditor.EventTriggerType.None, values);
		Assert.Contains(WorldMapEditor.EventTriggerType.OnStep, values);
		Assert.Contains(WorldMapEditor.EventTriggerType.OnAction, values);
		Assert.Contains(WorldMapEditor.EventTriggerType.OnTouch, values);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void LoadMap_WithInvalidPointer_ReturnsNull() {
		var data = new byte[100];
		data[0] = 0xff;  // Invalid pointer
		data[1] = 0xff;

		var editor = new WorldMapEditor(data);
		editor.SetSchema(new WorldMapEditor.MapSchema {
			MapTableOffset = 0,
			MapCount = 1,
			PointerSize = 2,
			MapDataBankOffset = 0,
			HasDimensions = false,
			DefaultWidth = 8,
			DefaultHeight = 8
		});

		var map = editor.LoadMap(0);

		Assert.Null(map);  // Should handle gracefully
	}

	[Fact]
	public void MapLayer_DefaultValues() {
		var layer = new WorldMapEditor.MapLayer();

		Assert.Equal(WorldMapEditor.LayerType.Background, layer.Type);
		Assert.Equal("", layer.Name);
		Assert.Equal(0, layer.Width);
		Assert.Equal(0, layer.Height);
		Assert.Empty(layer.TileData);
		Assert.True(layer.Visible);
	}

	[Fact]
	public void GameMap_DefaultValues() {
		var map = new WorldMapEditor.GameMap();

		Assert.Equal(0, map.Id);
		Assert.Equal("", map.Name);
		Assert.Equal(WorldMapEditor.MapType.Overworld, map.Type);
		Assert.Empty(map.Layers);
		Assert.Empty(map.Warps);
		Assert.Empty(map.Npcs);
		Assert.Empty(map.Events);
	}

	[Fact]
	public void WarpPoint_DefaultValues() {
		var warp = new WorldMapEditor.WarpPoint();

		Assert.Equal(0, warp.Id);
		Assert.Equal("", warp.Name);
		Assert.Equal(0, warp.SourceX);
		Assert.Equal(0, warp.DestMapId);
	}

	[Fact]
	public void MapNpc_DefaultValues() {
		var npc = new WorldMapEditor.MapNpc();

		Assert.Equal(0, npc.Id);
		Assert.Equal("", npc.Name);
		Assert.True(npc.Solid);
	}

	#endregion
}
