using System.Text.Json;
using DarkRepos.Editor.Core.Interfaces;

namespace DarkRepos.Editor.Core.Services.Games;

/// <summary>
/// Dragon Quest III SNES (DQ3r) specific editor service.
/// Provides game-specific data structure editing capabilities.
/// </summary>
public class DQ3rEditorService : IDQ3rEditorService {
	private readonly IDataEditorService _dataEditor;
	private byte[] _romData = [];

	/// <summary>
	/// Known data table locations in DQ3r ROM.
	/// Based on research from dq3r-info disassembly.
	/// </summary>
	public static readonly DQ3rKnownTables Tables = new();

	public DQ3rEditorService(IDataEditorService dataEditor) {
		_dataEditor = dataEditor;
	}

	/// <summary>
	/// Load ROM data for editing.
	/// </summary>
	/// <param name="data">ROM byte data (with or without SMC header).</param>
	public void LoadRom(byte[] data) {
		// Strip SMC header if present
		if (data.Length % 1024 == 512) {
			_romData = new byte[data.Length - 512];
			Array.Copy(data, 512, _romData, 0, _romData.Length);
		} else {
			_romData = data;
		}
	}

	/// <summary>
	/// Get monster data table.
	/// </summary>
	public DataTable? LoadMonsters() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.MonsterJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Monsters.FileOffset,
			structure,
			Tables.Monsters.Count);
	}

	/// <summary>
	/// Get item data table.
	/// </summary>
	public DataTable? LoadItems() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.ItemJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Items.FileOffset,
			structure,
			Tables.Items.Count);
	}

	/// <summary>
	/// Get spell data table.
	/// </summary>
	public DataTable? LoadSpells() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.SpellJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Spells.FileOffset,
			structure,
			Tables.Spells.Count);
	}

	/// <summary>
	/// Get class data table.
	/// </summary>
	public DataTable? LoadClasses() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.ClassJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Classes.FileOffset,
			structure,
			Tables.Classes.Count);
	}

	/// <summary>
	/// Save monster data back to ROM.
	/// </summary>
	public void SaveMonsters(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Monsters.FileOffset, exported.Length);
	}

	/// <summary>
	/// Save item data back to ROM.
	/// </summary>
	public void SaveItems(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Items.FileOffset, exported.Length);
	}

	/// <summary>
	/// Save spell data back to ROM.
	/// </summary>
	public void SaveSpells(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Spells.FileOffset, exported.Length);
	}

	/// <summary>
	/// Save class data back to ROM.
	/// </summary>
	public void SaveClasses(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Classes.FileOffset, exported.Length);
	}

	/// <summary>
	/// Get the modified ROM data.
	/// </summary>
	public byte[] GetRomData() => _romData;

	/// <summary>
	/// Convert SNES address to file offset.
	/// </summary>
	public static int SnesAddressToFile(int snesAddress) {
		const int HiRomOffset = 0xc00000;
		return snesAddress >= HiRomOffset ? snesAddress - HiRomOffset : snesAddress;
	}
}

/// <summary>
/// Known table locations in DQ3r ROM.
/// Addresses are file offsets (after header removal).
/// </summary>
public class DQ3rKnownTables {
	// TODO: These addresses need verification from datamap.json and disassembly
	// Placeholder values based on typical DQ3 SNES structure

	public TableLocation Monsters { get; } = new(0x1a0000, 256, 32, "Monster Stats");
	public TableLocation Items { get; } = new(0x1b0000, 256, 16, "Item Data");
	public TableLocation Spells { get; } = new(0x1c0000, 128, 12, "Spell Data");
	public TableLocation Classes { get; } = new(0x1d0000, 16, 64, "Class Stats");
	public TableLocation Equipment { get; } = new(0x1e0000, 256, 8, "Equipment Stats");
	public TableLocation Shops { get; } = new(0x1f0000, 64, 32, "Shop Inventory");
}

/// <summary>
/// Represents a known table location.
/// </summary>
public record TableLocation(int FileOffset, int Count, int EntrySize, string Description) {
	public int TotalSize => Count * EntrySize;
	public int SnesAddress => FileOffset + 0xc00000;
	public string SnesAddressHex => $"${SnesAddress:x6}";
}

/// <summary>
/// Interface for DQ3r-specific editing operations.
/// </summary>
public interface IDQ3rEditorService {
	void LoadRom(byte[] data);
	DataTable? LoadMonsters();
	DataTable? LoadItems();
	DataTable? LoadSpells();
	DataTable? LoadClasses();
	void SaveMonsters(DataTable table);
	void SaveItems(DataTable table);
	void SaveSpells(DataTable table);
	void SaveClasses(DataTable table);
	byte[] GetRomData();
}

/// <summary>
/// DQ3r data structure JSON schemas.
/// </summary>
public static class DQ3rStructures {
	/// <summary>
	/// Monster data structure schema.
	/// </summary>
	public static readonly string MonsterJson = """
	{
		"name": "Monster",
		"recordSize": 32,
		"endianness": "little",
		"fields": [
			{ "name": "hp", "type": "uint16", "description": "Hit Points" },
			{ "name": "mp", "type": "uint16", "description": "Magic Points" },
			{ "name": "attack", "type": "uint16", "description": "Attack Power" },
			{ "name": "defense", "type": "uint16", "description": "Defense" },
			{ "name": "agility", "type": "uint16", "description": "Agility" },
			{ "name": "exp", "type": "uint16", "description": "Experience Points" },
			{ "name": "gold", "type": "uint16", "description": "Gold Dropped" },
			{ "name": "drop_item", "type": "uint8", "description": "Item Drop ID" },
			{ "name": "drop_chance", "type": "uint8", "description": "Drop Chance (1/N)" },
			{ "name": "resistance", "type": "uint16", "description": "Elemental Resistance Flags" },
			{ "name": "action_pattern", "type": "uint8", "description": "AI Pattern" },
			{ "name": "sprite_id", "type": "uint8", "description": "Sprite Index" },
			{ "name": "palette_id", "type": "uint8", "description": "Palette Index" },
			{ "name": "flags", "type": "uint8", "description": "Special Flags" },
			{ "name": "reserved", "type": "bytes", "size": 8 }
		]
	}
	""";

	/// <summary>
	/// Item data structure schema.
	/// </summary>
	public static readonly string ItemJson = """
	{
		"name": "Item",
		"recordSize": 16,
		"endianness": "little",
		"fields": [
			{ "name": "type", "type": "uint8", "description": "Item Type" },
			{ "name": "equip_class", "type": "uint8", "description": "Equippable Classes" },
			{ "name": "effect", "type": "uint8", "description": "Effect ID" },
			{ "name": "power", "type": "uint8", "description": "Power Value" },
			{ "name": "buy_price", "type": "uint16", "description": "Buy Price" },
			{ "name": "sell_price", "type": "uint16", "description": "Sell Price" },
			{ "name": "flags", "type": "uint8", "description": "Special Flags" },
			{ "name": "element", "type": "uint8", "description": "Elemental Affinity" },
			{ "name": "name_ptr", "type": "uint16", "description": "Name Pointer" },
			{ "name": "desc_ptr", "type": "uint16", "description": "Description Pointer" },
			{ "name": "reserved", "type": "uint16" }
		]
	}
	""";

	/// <summary>
	/// Spell data structure schema.
	/// </summary>
	public static readonly string SpellJson = """
	{
		"name": "Spell",
		"recordSize": 12,
		"endianness": "little",
		"fields": [
			{ "name": "mp_cost", "type": "uint8", "description": "MP Cost" },
			{ "name": "element", "type": "uint8", "description": "Element Type" },
			{ "name": "target", "type": "uint8", "description": "Target Type" },
			{ "name": "effect", "type": "uint8", "description": "Effect ID" },
			{ "name": "power", "type": "uint16", "description": "Base Power" },
			{ "name": "flags", "type": "uint8", "description": "Special Flags" },
			{ "name": "animation", "type": "uint8", "description": "Animation ID" },
			{ "name": "name_ptr", "type": "uint16", "description": "Name Pointer" },
			{ "name": "reserved", "type": "uint16" }
		]
	}
	""";

	/// <summary>
	/// Class data structure schema.
	/// </summary>
	public static readonly string ClassJson = """
	{
		"name": "Class",
		"recordSize": 64,
		"endianness": "little",
		"fields": [
			{ "name": "base_hp", "type": "uint16", "description": "Base HP" },
			{ "name": "base_mp", "type": "uint16", "description": "Base MP" },
			{ "name": "base_str", "type": "uint8", "description": "Base Strength" },
			{ "name": "base_agi", "type": "uint8", "description": "Base Agility" },
			{ "name": "base_vit", "type": "uint8", "description": "Base Vitality" },
			{ "name": "base_int", "type": "uint8", "description": "Base Intelligence" },
			{ "name": "base_luck", "type": "uint8", "description": "Base Luck" },
			{ "name": "hp_growth", "type": "uint8", "description": "HP Growth Rate" },
			{ "name": "mp_growth", "type": "uint8", "description": "MP Growth Rate" },
			{ "name": "str_growth", "type": "uint8", "description": "Strength Growth" },
			{ "name": "agi_growth", "type": "uint8", "description": "Agility Growth" },
			{ "name": "vit_growth", "type": "uint8", "description": "Vitality Growth" },
			{ "name": "int_growth", "type": "uint8", "description": "Intelligence Growth" },
			{ "name": "luck_growth", "type": "uint8", "description": "Luck Growth" },
			{ "name": "equip_mask", "type": "uint16", "description": "Equipment Types Allowed" },
			{ "name": "spell_table", "type": "uint16", "description": "Spell Learning Table Ptr" },
			{ "name": "reserved", "type": "bytes", "size": 44 }
		]
	}
	""";
}
