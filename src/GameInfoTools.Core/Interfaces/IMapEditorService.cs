namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Represents a map tile placement.
/// </summary>
public record MapTile(int X, int Y, int TileIndex, int PaletteIndex = 0, bool FlipX = false, bool FlipY = false);

/// <summary>
/// Represents an event/trigger on a map.
/// </summary>
public record MapEvent(int X, int Y, string Type, Dictionary<string, object>? Properties = null);

/// <summary>
/// Represents a complete map layer.
/// </summary>
public record MapLayer(string Name, int Width, int Height, MapTile[] Tiles, bool Visible = true);

/// <summary>
/// Interface for map editor services.
/// </summary>
public interface IMapEditorService
{
	/// <summary>Map width in tiles.</summary>
	int Width { get; }

	/// <summary>Map height in tiles.</summary>
	int Height { get; }

	/// <summary>All layers in the map.</summary>
	IReadOnlyList<MapLayer> Layers { get; }

	/// <summary>All events/triggers on the map.</summary>
	IReadOnlyList<MapEvent> Events { get; }

	/// <summary>Gets a tile at the specified position and layer.</summary>
	MapTile? GetTile(int layerIndex, int x, int y);

	/// <summary>Sets a tile at the specified position and layer.</summary>
	void SetTile(int layerIndex, int x, int y, MapTile tile);

	/// <summary>Sets a rectangular region of tiles.</summary>
	void SetTiles(int layerIndex, int x, int y, int width, int height, MapTile[] tiles);

	/// <summary>Flood fills a region with a tile.</summary>
	void FloodFill(int layerIndex, int x, int y, MapTile tile);

	/// <summary>Adds an event to the map.</summary>
	void AddEvent(MapEvent mapEvent);

	/// <summary>Removes an event from the map.</summary>
	void RemoveEvent(MapEvent mapEvent);

	/// <summary>Gets events at a specific position.</summary>
	IEnumerable<MapEvent> GetEventsAt(int x, int y);

	/// <summary>Adds a new layer.</summary>
	void AddLayer(string name);

	/// <summary>Removes a layer by index.</summary>
	void RemoveLayer(int index);

	/// <summary>Reorders layers.</summary>
	void MoveLayer(int fromIndex, int toIndex);

	/// <summary>Exports the map to JSON format.</summary>
	string ExportToJson();

	/// <summary>Imports a map from JSON format.</summary>
	void ImportFromJson(string json);

	/// <summary>Renders the map as a PNG image.</summary>
	byte[] RenderToPng(IChrEditorService chrService, int scale = 1);

	/// <summary>Undoes the last edit.</summary>
	void Undo();

	/// <summary>Redoes the last undone edit.</summary>
	void Redo();

	/// <summary>Whether an undo operation is available.</summary>
	bool CanUndo { get; }

	/// <summary>Whether a redo operation is available.</summary>
	bool CanRedo { get; }

	/// <summary>Fired when the map is modified.</summary>
	event EventHandler? MapChanged;
}
