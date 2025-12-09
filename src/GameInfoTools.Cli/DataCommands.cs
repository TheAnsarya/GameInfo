using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// Game data export/import commands.
/// </summary>
public static class DataCommands
{
	public static void Export(FileInfo romFile, string dataType)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Exporting {dataType} data from {romFile.Name}...[/]");

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		switch (dataType.ToLowerInvariant())
		{
			case "monsters":
			case "enemies":
				ExportMonsters(rom);
				break;

			case "items":
				ExportItems(rom);
				break;

			case "spells":
			case "magic":
				ExportSpells(rom);
				break;

			case "weapons":
				ExportWeapons(rom);
				break;

			case "armor":
				ExportArmor(rom);
				break;

			default:
				AnsiConsole.MarkupLine($"[yellow]Unknown data type: {dataType}[/]");
				AnsiConsole.MarkupLine("[grey]Available types: monsters, items, spells, weapons, armor[/]");
				break;
		}
	}

	private static void ExportMonsters(RomFile rom)
	{
		AnsiConsole.MarkupLine("[yellow]Monster export requires game-specific configuration[/]");
		AnsiConsole.MarkupLine("[grey]This tool works best with a JSON schema defining data locations[/]");

		// Show what we'd need
		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Monster Data Structure (typical)[/]")
			.AddColumn("Field")
			.AddColumn("Size")
			.AddColumn("Description");

		table.AddRow("HP", "2 bytes", "Hit points");
		table.AddRow("Attack", "1-2 bytes", "Attack power");
		table.AddRow("Defense", "1-2 bytes", "Defense rating");
		table.AddRow("Speed", "1 byte", "Agility/speed");
		table.AddRow("EXP", "2 bytes", "Experience reward");
		table.AddRow("Gold", "2 bytes", "Gold reward");
		table.AddRow("Name", "variable", "Monster name (pointer or inline)");

		AnsiConsole.Write(table);
	}

	private static void ExportItems(RomFile rom)
	{
		AnsiConsole.MarkupLine("[yellow]Item export requires game-specific configuration[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Item Data Structure (typical)[/]")
			.AddColumn("Field")
			.AddColumn("Size")
			.AddColumn("Description");

		table.AddRow("Name", "variable", "Item name");
		table.AddRow("Price", "2 bytes", "Shop price");
		table.AddRow("Effect", "1-2 bytes", "Item effect ID");
		table.AddRow("Target", "1 byte", "Target type (self, ally, enemy, etc.)");
		table.AddRow("Flags", "1 byte", "Special flags (usable in battle, etc.)");

		AnsiConsole.Write(table);
	}

	private static void ExportSpells(RomFile rom)
	{
		AnsiConsole.MarkupLine("[yellow]Spell export requires game-specific configuration[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Spell Data Structure (typical)[/]")
			.AddColumn("Field")
			.AddColumn("Size")
			.AddColumn("Description");

		table.AddRow("Name", "variable", "Spell name");
		table.AddRow("MP Cost", "1 byte", "Magic points required");
		table.AddRow("Power", "1-2 bytes", "Spell power/damage");
		table.AddRow("Target", "1 byte", "Target type");
		table.AddRow("Element", "1 byte", "Elemental type");
		table.AddRow("Effect", "1-2 bytes", "Effect ID");

		AnsiConsole.Write(table);
	}

	private static void ExportWeapons(RomFile rom)
	{
		AnsiConsole.MarkupLine("[yellow]Weapon export requires game-specific configuration[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Weapon Data Structure (typical)[/]")
			.AddColumn("Field")
			.AddColumn("Size")
			.AddColumn("Description");

		table.AddRow("Name", "variable", "Weapon name");
		table.AddRow("Attack", "1-2 bytes", "Attack bonus");
		table.AddRow("Price", "2 bytes", "Shop price");
		table.AddRow("Equip Flags", "1 byte", "Who can equip");
		table.AddRow("Special", "1 byte", "Special effect");

		AnsiConsole.Write(table);
	}

	private static void ExportArmor(RomFile rom)
	{
		AnsiConsole.MarkupLine("[yellow]Armor export requires game-specific configuration[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Armor Data Structure (typical)[/]")
			.AddColumn("Field")
			.AddColumn("Size")
			.AddColumn("Description");

		table.AddRow("Name", "variable", "Armor name");
		table.AddRow("Defense", "1-2 bytes", "Defense bonus");
		table.AddRow("Price", "2 bytes", "Shop price");
		table.AddRow("Equip Flags", "1 byte", "Who can equip");
		table.AddRow("Slot", "1 byte", "Equipment slot (body, head, etc.)");
		table.AddRow("Resistance", "1 byte", "Elemental resistance");

		AnsiConsole.Write(table);
	}

	public static void Import(FileInfo romFile, FileInfo jsonFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		if (!jsonFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: JSON file not found: {jsonFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Importing data from {jsonFile.Name} into {romFile.Name}...[/]");
		AnsiConsole.MarkupLine("[yellow]Data import not yet fully implemented[/]");

		// Read JSON and validate structure
		var json = File.ReadAllText(jsonFile.FullName);
		AnsiConsole.MarkupLine($"[green]Read {json.Length} bytes of JSON data[/]");

		// TODO: Parse JSON and write to ROM based on schema
	}
}
