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
	/// Get weapon data table.
	/// </summary>
	public DataTable? LoadWeapons() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.WeaponJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Weapons.FileOffset,
			structure,
			Tables.Weapons.Count);
	}

	/// <summary>
	/// Get armor data table.
	/// </summary>
	public DataTable? LoadArmor() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.ArmorJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.Armor.FileOffset,
			structure,
			Tables.Armor.Count);
	}

	/// <summary>
	/// Get monster AI data table.
	/// </summary>
	public DataTable? LoadMonsterAi() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.MonsterAiJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.MonsterAi.FileOffset,
			structure,
			Tables.MonsterAi.Count);
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
	/// Save weapon data back to ROM.
	/// </summary>
	public void SaveWeapons(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Weapons.FileOffset, exported.Length);
	}

	/// <summary>
	/// Save armor data back to ROM.
	/// </summary>
	public void SaveArmor(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.Armor.FileOffset, exported.Length);
	}

	/// <summary>
	/// Save monster AI data back to ROM.
	/// </summary>
	public void SaveMonsterAi(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.MonsterAi.FileOffset, exported.Length);
	}

	/// <summary>
	/// Get experience table data.
	/// </summary>
	public DataTable? LoadExpTable() {
		if (_romData.Length == 0) return null;

		var structure = _dataEditor.LoadStructureDefinition(DQ3rStructures.ExpTableJson);
		return _dataEditor.LoadDataTable(
			_romData,
			Tables.ExpTable.FileOffset,
			structure,
			Tables.ExpTable.Count);
	}

	/// <summary>
	/// Save experience table back to ROM.
	/// </summary>
	public void SaveExpTable(DataTable table) {
		var exported = _dataEditor.ExportTable(table);
		Array.Copy(exported, 0, _romData, Tables.ExpTable.FileOffset, exported.Length);
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
/// Addresses verified from dq3_extracted/extraction_summary.json.
/// </summary>
public class DQ3rKnownTables {
	// Data bank $50 (80) - File offset 0x500000
	public TableLocation Items { get; } = new(0x500000, 512, 16, "Item Data");
	public TableLocation Weapons { get; } = new(0x502000, 128, 16, "Weapon Data");
	public TableLocation Armor { get; } = new(0x504000, 128, 16, "Armor Data");

	// Data bank $51 (81) - File offset 0x510000
	public TableLocation Monsters { get; } = new(0x510000, 384, 32, "Monster Stats");
	public TableLocation MonsterAi { get; } = new(0x513000, 256, 32, "Monster AI");

	// Data bank $52 (82) - File offset 0x520000
	public TableLocation Spells { get; } = new(0x520000, 341, 12, "Spell Data");
	public TableLocation Classes { get; } = new(0x521000, 128, 16, "Class Stats");
	public TableLocation ExpTable { get; } = new(0x522000, 99, 4, "Experience Table");

	// Text - Bank $40 (64) - File offset 0x400000
	public TableLocation MainDialog { get; } = new(0x400000, -1, -1, "Main Dialog (compressed)");

	// Text from datamap.json (Bank $C1, etc.)
	public TableLocation DialogFont { get; } = new(0x010ed3, -1, 0x42d7, "Dialog Font Data");
	public TableLocation DialogFontMeta { get; } = new(0x0151aa, 50, 5, "Font Metadata Table");
	public TableLocation DialogScript { get; } = new(0x3cc258, -1, 0x20d5e, "Dialog Script");

	// Graphics
	public TableLocation CharSprites { get; } = new(0x200000, 2048, 32, "Character Sprites");
	public TableLocation MonsterGraphics { get; } = new(0x220000, 4096, 32, "Monster Graphics");
	public TableLocation WorldTiles { get; } = new(0x180000, 2048, 16, "World Map Tiles");
	public TableLocation UiGraphics { get; } = new(0x1a0000, 1024, 16, "UI Graphics");
	public TableLocation FontGraphics { get; } = new(0x1b0000, 512, 16, "Font Tiles");

	// Audio
	public TableLocation MusicBank1 { get; } = new(0x300000, 4, -1, "Music Bank 1");
	public TableLocation MusicBank2 { get; } = new(0x308000, 6, -1, "Music Bank 2");
	public TableLocation SoundEffects { get; } = new(0x310000, -1, 16384, "Sound Effects (BRR)");
	public TableLocation Instruments { get; } = new(0x320000, -1, 32768, "Instrument Samples (BRR)");
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
	DataTable? LoadMonsterAi();
	DataTable? LoadItems();
	DataTable? LoadWeapons();
	DataTable? LoadArmor();
	DataTable? LoadSpells();
	DataTable? LoadClasses();
	DataTable? LoadExpTable();
	void SaveMonsters(DataTable table);
	void SaveItems(DataTable table);
	void SaveSpells(DataTable table);
	void SaveClasses(DataTable table);
	void SaveWeapons(DataTable table);
	void SaveArmor(DataTable table);
	void SaveMonsterAi(DataTable table);
	void SaveExpTable(DataTable table);
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
		"recordSize": 16,
		"endianness": "little",
		"fields": [
			{ "name": "base_hp", "type": "uint8", "description": "Base HP Modifier" },
			{ "name": "base_mp", "type": "uint8", "description": "Base MP Modifier" },
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
			{ "name": "equip_mask", "type": "uint16", "description": "Equipment Types Allowed" }
		]
	}
	""";

	/// <summary>
	/// Weapon data structure schema.
	/// </summary>
	public static readonly string WeaponJson = """
	{
		"name": "Weapon",
		"recordSize": 16,
		"endianness": "little",
		"fields": [
			{ "name": "attack", "type": "uint8", "description": "Attack Power" },
			{ "name": "hit_rate", "type": "uint8", "description": "Hit Rate Bonus" },
			{ "name": "element", "type": "uint8", "description": "Elemental Type" },
			{ "name": "effect", "type": "uint8", "description": "Special Effect" },
			{ "name": "equip_class", "type": "uint8", "description": "Equippable Classes Mask" },
			{ "name": "flags", "type": "uint8", "description": "Weapon Flags" },
			{ "name": "buy_price", "type": "uint16", "description": "Buy Price" },
			{ "name": "sell_price", "type": "uint16", "description": "Sell Price" },
			{ "name": "name_ptr", "type": "uint16", "description": "Name Pointer" },
			{ "name": "desc_ptr", "type": "uint16", "description": "Description Pointer" },
			{ "name": "reserved", "type": "uint16" }
		]
	}
	""";

	/// <summary>
	/// Armor data structure schema.
	/// </summary>
	public static readonly string ArmorJson = """
	{
		"name": "Armor",
		"recordSize": 16,
		"endianness": "little",
		"fields": [
			{ "name": "defense", "type": "uint8", "description": "Defense Power" },
			{ "name": "resist", "type": "uint8", "description": "Resistance Type" },
			{ "name": "element", "type": "uint8", "description": "Elemental Defense" },
			{ "name": "effect", "type": "uint8", "description": "Special Effect" },
			{ "name": "equip_class", "type": "uint8", "description": "Equippable Classes Mask" },
			{ "name": "slot", "type": "uint8", "description": "Equipment Slot (body/helm/shield)" },
			{ "name": "buy_price", "type": "uint16", "description": "Buy Price" },
			{ "name": "sell_price", "type": "uint16", "description": "Sell Price" },
			{ "name": "name_ptr", "type": "uint16", "description": "Name Pointer" },
			{ "name": "desc_ptr", "type": "uint16", "description": "Description Pointer" },
			{ "name": "reserved", "type": "uint16" }
		]
	}
	""";

	/// <summary>
	/// Monster AI data structure schema.
	/// </summary>
	public static readonly string MonsterAiJson = """
	{
		"name": "MonsterAI",
		"recordSize": 32,
		"endianness": "little",
		"fields": [
			{ "name": "ai_type", "type": "uint8", "description": "AI Behavior Type" },
			{ "name": "action_1", "type": "uint8", "description": "Primary Action" },
			{ "name": "action_1_rate", "type": "uint8", "description": "Primary Action Rate" },
			{ "name": "action_2", "type": "uint8", "description": "Secondary Action" },
			{ "name": "action_2_rate", "type": "uint8", "description": "Secondary Action Rate" },
			{ "name": "action_3", "type": "uint8", "description": "Tertiary Action" },
			{ "name": "action_3_rate", "type": "uint8", "description": "Tertiary Action Rate" },
			{ "name": "action_4", "type": "uint8", "description": "Quaternary Action" },
			{ "name": "action_4_rate", "type": "uint8", "description": "Quaternary Action Rate" },
			{ "name": "hp_threshold", "type": "uint8", "description": "HP% for AI Change" },
			{ "name": "phase2_type", "type": "uint8", "description": "Phase 2 AI Type" },
			{ "name": "flee_rate", "type": "uint8", "description": "Flee Probability" },
			{ "name": "call_ally_id", "type": "uint8", "description": "Call Ally Monster ID" },
			{ "name": "call_ally_rate", "type": "uint8", "description": "Call Ally Rate" },
			{ "name": "target_priority", "type": "uint8", "description": "Target Selection" },
			{ "name": "flags", "type": "uint8", "description": "Behavior Flags" },
			{ "name": "reserved", "type": "bytes", "size": 16 }
		]
	}
	""";

	/// <summary>
	/// Experience table data structure schema.
	/// </summary>
	public static readonly string ExpTableJson = """
	{
		"name": "ExperienceLevel",
		"recordSize": 4,
		"endianness": "little",
		"fields": [
			{ "name": "exp_required", "type": "uint32", "description": "Experience Required for Level" }
		]
	}
	""";
}
