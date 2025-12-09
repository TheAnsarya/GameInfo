using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// ROM file operation commands.
/// </summary>
public static class RomCommands
{
	public static void ShowInfo(FileInfo romFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: File not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;

		AnsiConsole.Write(new Rule($"[cyan]{romFile.Name}[/]").LeftJustified());

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Property")
			.AddColumn("Value");

		table.AddRow("File Size", $"{rom.Length:N0} bytes ({rom.Length / 1024.0:N1} KB)");
		table.AddRow("System", header?.System.ToString() ?? "Unknown");

		if (header != null)
		{
			if (!string.IsNullOrEmpty(header.Title))
				table.AddRow("Title", header.Title);

			table.AddRow("Header Size", $"{header.HeaderSize} bytes");

			if (header.System == SystemType.Nes)
			{
				table.AddRow("PRG ROM", $"{header.PrgRomSize:N0} bytes ({header.PrgRomSize / 1024} KB)");
				table.AddRow("CHR ROM", $"{header.ChrRomSize:N0} bytes ({header.ChrRomSize / 1024} KB)");
				table.AddRow("Mapper", $"{header.Mapper}");
				table.AddRow("Battery", header.HasBattery ? "Yes" : "No");
				table.AddRow("Trainer", header.HasTrainer ? "Yes" : "No");
			}
		}

		// Calculate checksums
		var data = rom.AsSpan();
		var crc32 = CalculateCrc32(data);
		var md5 = System.Security.Cryptography.MD5.HashData(data);
		var sha1 = System.Security.Cryptography.SHA1.HashData(data);

		table.AddRow("CRC32", $"{crc32:x8}");
		table.AddRow("MD5", Convert.ToHexString(md5).ToLowerInvariant());
		table.AddRow("SHA1", Convert.ToHexString(sha1).ToLowerInvariant());

		AnsiConsole.Write(table);
	}

	public static void Checksum(FileInfo romFile, bool fix)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: File not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;

		if (header?.System == SystemType.Snes)
		{
			AnsiConsole.MarkupLine("[cyan]SNES ROM checksum calculation...[/]");

			// SNES checksum is stored at specific header locations
			var data = rom.GetDataWithoutHeader();
			ushort calculated = 0;

			foreach (var b in data)
			{
				calculated += b;
			}

			var complement = (ushort)(calculated ^ 0xffff);

			AnsiConsole.MarkupLine($"Calculated checksum: [green]${calculated:x4}[/]");
			AnsiConsole.MarkupLine($"Calculated complement: [green]${complement:x4}[/]");

			if (fix)
			{
				AnsiConsole.MarkupLine("[yellow]Checksum fix not yet implemented[/]");
			}
		}
		else if (header?.System == SystemType.Nes)
		{
			AnsiConsole.MarkupLine("[cyan]NES ROMs don't have internal checksums[/]");

			var crc32 = CalculateCrc32(rom.AsSpan());
			AnsiConsole.MarkupLine($"CRC32: [green]{crc32:x8}[/]");
		}
		else
		{
			AnsiConsole.MarkupLine("[yellow]Unknown ROM type[/]");
		}
	}

	public static void Expand(FileInfo romFile, string sizeStr)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: File not found: {romFile.FullName}[/]");
			return;
		}

		// Parse size string
		var size = ParseSize(sizeStr);
		if (size <= 0)
		{
			AnsiConsole.MarkupLine($"[red]Invalid size: {sizeStr}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		if (size <= rom.Length)
		{
			AnsiConsole.MarkupLine($"[red]New size ({size:N0}) must be larger than current size ({rom.Length:N0})[/]");
			return;
		}

		AnsiConsole.MarkupLine($"Expanding from {rom.Length:N0} to {size:N0} bytes...");
		AnsiConsole.MarkupLine("[yellow]ROM expansion not yet implemented[/]");
	}

	public static void Header(FileInfo romFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: File not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;

		if (header?.RawHeader == null || header.RawHeader.Length == 0)
		{
			AnsiConsole.MarkupLine("[yellow]No header found[/]");
			return;
		}

		AnsiConsole.Write(new Rule("[cyan]Raw Header Data[/]").LeftJustified());

		// Display hex dump of header
		var headerData = header.RawHeader;
		for (var i = 0; i < headerData.Length; i += 16)
		{
			var hex = new System.Text.StringBuilder();
			var ascii = new System.Text.StringBuilder();

			for (var j = 0; j < 16 && i + j < headerData.Length; j++)
			{
				var b = headerData[i + j];
				hex.Append($"{b:x2} ");
				ascii.Append(b >= 0x20 && b < 0x7f ? (char)b : '.');
			}

			AnsiConsole.MarkupLine($"[grey]{i:x4}[/]: {hex,-48} [grey]{ascii}[/]");
		}
	}

	private static uint CalculateCrc32(ReadOnlySpan<byte> data)
	{
		uint crc = 0xffffffff;
		foreach (var b in data)
		{
			crc ^= b;
			for (var i = 0; i < 8; i++)
			{
				crc = (crc >> 1) ^ (0xedb88320 * (crc & 1));
			}
		}
		return ~crc;
	}

	private static int ParseSize(string sizeStr)
	{
		sizeStr = sizeStr.Trim().ToUpperInvariant();

		if (sizeStr.EndsWith("KB"))
		{
			if (int.TryParse(sizeStr[..^2], out var kb))
				return kb * 1024;
		}
		else if (sizeStr.EndsWith("MB"))
		{
			if (int.TryParse(sizeStr[..^2], out var mb))
				return mb * 1024 * 1024;
		}
		else if (int.TryParse(sizeStr, out var bytes))
		{
			return bytes;
		}

		return -1;
	}
}
