using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// Patch creation and application commands.
/// </summary>
public static class PatchCommands
{
	public static void Create(FileInfo originalFile, FileInfo modifiedFile, string outputPath, string format)
	{
		if (!originalFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: Original file not found: {originalFile.FullName}[/]");
			return;
		}

		if (!modifiedFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: Modified file not found: {modifiedFile.FullName}[/]");
			return;
		}

		var original = File.ReadAllBytes(originalFile.FullName);
		var modified = File.ReadAllBytes(modifiedFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Creating {format.ToUpper()} patch...[/]");
		AnsiConsole.MarkupLine($"[grey]Original: {originalFile.Name} ({original.Length} bytes)[/]");
		AnsiConsole.MarkupLine($"[grey]Modified: {modifiedFile.Name} ({modified.Length} bytes)[/]");

		switch (format.ToLowerInvariant())
		{
			case "ips":
				CreateIpsPatch(original, modified, outputPath);
				break;

			case "bps":
				CreateBpsPatch(original, modified, outputPath);
				break;

			case "ups":
				CreateUpsPatch(original, modified, outputPath);
				break;

			default:
				AnsiConsole.MarkupLine($"[yellow]Unknown patch format: {format}[/]");
				AnsiConsole.MarkupLine("[grey]Supported formats: IPS, BPS, UPS[/]");
				break;
		}
	}

	private static void CreateIpsPatch(byte[] original, byte[] modified, string outputPath)
	{
		using var output = new FileStream(outputPath, FileMode.Create);
		using var writer = new BinaryWriter(output);

		// IPS header
		writer.Write(System.Text.Encoding.ASCII.GetBytes("PATCH"));

		int changesCount = 0;
		int i = 0;

		while (i < modified.Length)
		{
			// Find start of difference
			while (i < modified.Length && i < original.Length && original[i] == modified[i])
			{
				i++;
			}

			if (i >= modified.Length)
				break;

			int start = i;

			// Find end of difference (or max 0xffff bytes)
			int len = 0;
			while (i < modified.Length && len < 0xffff)
			{
				if (i >= original.Length || original[i] != modified[i])
				{
					i++;
					len++;
				}
				else
				{
					// Check if we should continue (small identical run)
					int identicalRun = 0;
					int tempI = i;
					while (tempI < modified.Length && tempI < original.Length &&
						   original[tempI] == modified[tempI] && identicalRun < 6)
					{
						tempI++;
						identicalRun++;
					}

					if (identicalRun >= 6)
						break;

					i++;
					len++;
				}
			}

			if (len > 0)
			{
				// Write record
				// 3-byte offset
				writer.Write((byte)((start >> 16) & 0xff));
				writer.Write((byte)((start >> 8) & 0xff));
				writer.Write((byte)(start & 0xff));

				// 2-byte size
				writer.Write((byte)((len >> 8) & 0xff));
				writer.Write((byte)(len & 0xff));

				// Data
				for (int j = 0; j < len; j++)
				{
					writer.Write(modified[start + j]);
				}

				changesCount++;
			}
		}

		// Handle expansion
		if (modified.Length > original.Length)
		{
			int start = original.Length;
			int len = modified.Length - original.Length;

			// May need multiple records for large expansions
			while (len > 0)
			{
				int chunkLen = Math.Min(len, 0xffff);

				writer.Write((byte)((start >> 16) & 0xff));
				writer.Write((byte)((start >> 8) & 0xff));
				writer.Write((byte)(start & 0xff));

				writer.Write((byte)((chunkLen >> 8) & 0xff));
				writer.Write((byte)(chunkLen & 0xff));

				for (int j = 0; j < chunkLen; j++)
				{
					writer.Write(modified[start + j]);
				}

				start += chunkLen;
				len -= chunkLen;
				changesCount++;
			}
		}

		// IPS EOF marker
		writer.Write(System.Text.Encoding.ASCII.GetBytes("EOF"));

		AnsiConsole.MarkupLine($"[green]Created IPS patch: {outputPath}[/]");
		AnsiConsole.MarkupLine($"[grey]{changesCount} change records written[/]");
	}

	private static void CreateBpsPatch(byte[] original, byte[] modified, string outputPath)
	{
		// BPS is more complex, using delta encoding
		AnsiConsole.MarkupLine("[yellow]BPS patch creation is experimental[/]");

		using var output = new FileStream(outputPath, FileMode.Create);
		using var writer = new BinaryWriter(output);

		// BPS header
		writer.Write(System.Text.Encoding.ASCII.GetBytes("BPS1"));

		// Write sizes as variable-length integers
		WriteVarInt(writer, original.Length);
		WriteVarInt(writer, modified.Length);
		WriteVarInt(writer, 0); // Metadata size

		// For now, write as simple TargetRead records
		for (int i = 0; i < modified.Length; i++)
		{
			// Action 0 = SourceRead (copy from source)
			// Action 1 = TargetRead (literal data)
			// Action 2 = SourceCopy
			// Action 3 = TargetCopy

			if (i < original.Length && original[i] == modified[i])
			{
				// Could optimize with SourceRead runs
				continue;
			}

			// TargetRead for changed bytes
			WriteVarInt(writer, (1 << 2) | 1); // Length 1, action TargetRead
			writer.Write(modified[i]);
		}

		// Checksums (simplified - would need proper CRC32)
		writer.Write(0); // Source CRC32
		writer.Write(0); // Target CRC32
		writer.Write(0); // Patch CRC32

		AnsiConsole.MarkupLine($"[green]Created BPS patch: {outputPath}[/]");
	}

	private static void CreateUpsPatch(byte[] original, byte[] modified, string outputPath)
	{
		AnsiConsole.MarkupLine("[yellow]UPS patch creation is experimental[/]");

		using var output = new FileStream(outputPath, FileMode.Create);
		using var writer = new BinaryWriter(output);

		// UPS header
		writer.Write(System.Text.Encoding.ASCII.GetBytes("UPS1"));

		// File sizes
		WriteVarInt(writer, original.Length);
		WriteVarInt(writer, modified.Length);

		// XOR differences
		long offset = 0;
		for (int i = 0; i < Math.Max(original.Length, modified.Length); i++)
		{
			byte orig = i < original.Length ? original[i] : (byte)0;
			byte mod = i < modified.Length ? modified[i] : (byte)0;
			byte xorVal = (byte)(orig ^ mod);

			if (xorVal != 0)
			{
				// Write relative offset
				WriteVarInt(writer, i - offset);
				offset = i + 1;

				// Write XOR data until 0x00
				writer.Write(xorVal);
				writer.Write((byte)0);
			}
		}

		// Checksums
		writer.Write(0); // Source CRC32
		writer.Write(0); // Target CRC32
		writer.Write(0); // Patch CRC32

		AnsiConsole.MarkupLine($"[green]Created UPS patch: {outputPath}[/]");
	}

	private static void WriteVarInt(BinaryWriter writer, long value)
	{
		while (true)
		{
			byte b = (byte)(value & 0x7f);
			value >>= 7;
			if (value == 0)
			{
				writer.Write((byte)(b | 0x80));
				break;
			}
			writer.Write(b);
			value--;
		}
	}

	public static void Apply(FileInfo romFile, FileInfo patchFile, string outputPath)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		if (!patchFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: Patch file not found: {patchFile.FullName}[/]");
			return;
		}

		var romData = File.ReadAllBytes(romFile.FullName);
		var patchData = File.ReadAllBytes(patchFile.FullName);

		string format = DetectPatchFormat(patchData);
		AnsiConsole.MarkupLine($"[cyan]Detected patch format: {format}[/]");

		byte[]? result = format switch
		{
			"IPS" => ApplyIpsPatch(romData, patchData),
			"BPS" => ApplyBpsPatch(romData, patchData),
			"UPS" => ApplyUpsPatch(romData, patchData),
			_ => null
		};

		if (result == null)
		{
			AnsiConsole.MarkupLine($"[red]Failed to apply patch[/]");
			return;
		}

		File.WriteAllBytes(outputPath, result);
		AnsiConsole.MarkupLine($"[green]Patched ROM saved to: {outputPath}[/]");
		AnsiConsole.MarkupLine($"[grey]Original: {romData.Length} bytes, Patched: {result.Length} bytes[/]");
	}

	private static string DetectPatchFormat(byte[] data)
	{
		if (data.Length >= 5)
		{
			string header = System.Text.Encoding.ASCII.GetString(data, 0, 5);
			if (header == "PATCH") return "IPS";
		}

		if (data.Length >= 4)
		{
			string header = System.Text.Encoding.ASCII.GetString(data, 0, 4);
			if (header == "BPS1") return "BPS";
			if (header == "UPS1") return "UPS";
		}

		return "Unknown";
	}

	private static byte[] ApplyIpsPatch(byte[] rom, byte[] patch)
	{
		// Verify header
		if (patch.Length < 5 || System.Text.Encoding.ASCII.GetString(patch, 0, 5) != "PATCH")
		{
			throw new InvalidDataException("Invalid IPS header");
		}

		// Determine output size (may need to expand)
		var output = new List<byte>(rom);
		int pos = 5;

		while (pos < patch.Length - 3)
		{
			// Check for EOF
			if (patch[pos] == 'E' && patch[pos + 1] == 'O' && patch[pos + 2] == 'F')
				break;

			// Read offset (3 bytes big-endian)
			int offset = (patch[pos] << 16) | (patch[pos + 1] << 8) | patch[pos + 2];
			pos += 3;

			// Read size (2 bytes big-endian)
			int size = (patch[pos] << 8) | patch[pos + 1];
			pos += 2;

			// Expand output if needed
			while (output.Count < offset + size)
			{
				output.Add(0);
			}

			if (size == 0)
			{
				// RLE record
				int rleSize = (patch[pos] << 8) | patch[pos + 1];
				pos += 2;
				byte rleValue = patch[pos];
				pos += 1;

				for (int i = 0; i < rleSize; i++)
				{
					output[offset + i] = rleValue;
				}
			}
			else
			{
				// Normal record
				for (int i = 0; i < size; i++)
				{
					output[offset + i] = patch[pos + i];
				}
				pos += size;
			}
		}

		return output.ToArray();
	}

	private static byte[] ApplyBpsPatch(byte[] rom, byte[] patch)
	{
		// BPS implementation would go here
		AnsiConsole.MarkupLine("[yellow]BPS patch application not fully implemented[/]");
		return rom;
	}

	private static byte[] ApplyUpsPatch(byte[] rom, byte[] patch)
	{
		// UPS implementation would go here
		AnsiConsole.MarkupLine("[yellow]UPS patch application not fully implemented[/]");
		return rom;
	}

	public static void Info(FileInfo patchFile)
	{
		if (!patchFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: Patch file not found: {patchFile.FullName}[/]");
			return;
		}

		var data = File.ReadAllBytes(patchFile.FullName);
		string format = DetectPatchFormat(data);

		AnsiConsole.MarkupLine($"[cyan]Patch Information: {patchFile.Name}[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Property")
			.AddColumn("Value");

		table.AddRow("Format", format);
		table.AddRow("File Size", $"{data.Length:n0} bytes");

		switch (format)
		{
			case "IPS":
				AnalyzeIpsPatch(data, table);
				break;

			case "BPS":
				table.AddRow("BPS Version", "1");
				break;

			case "UPS":
				table.AddRow("UPS Version", "1");
				break;
		}

		AnsiConsole.Write(table);
	}

	private static void AnalyzeIpsPatch(byte[] patch, Table table)
	{
		int pos = 5;
		int recordCount = 0;
		int totalDataBytes = 0;

		while (pos < patch.Length - 3)
		{
			if (patch[pos] == 'E' && patch[pos + 1] == 'O' && patch[pos + 2] == 'F')
				break;

			pos += 3; // offset
			int size = (patch[pos] << 8) | patch[pos + 1];
			pos += 2;

			if (size == 0)
			{
				int rleSize = (patch[pos] << 8) | patch[pos + 1];
				pos += 3;
				totalDataBytes += rleSize;
			}
			else
			{
				pos += size;
				totalDataBytes += size;
			}

			recordCount++;
		}

		table.AddRow("Records", recordCount.ToString());
		table.AddRow("Data Changed", $"{totalDataBytes:n0} bytes");
	}
}
