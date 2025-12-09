using System.Text;

namespace GameInfoTools.Rom;

/// <summary>
/// IPS patch format support.
/// </summary>
public static class IpsPatch
{
	private static readonly byte[] IpsHeader = { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' };
	private static readonly byte[] IpsEof = { (byte)'E', (byte)'O', (byte)'F' };

	/// <summary>
	/// A single IPS patch record.
	/// </summary>
	public record IpsRecord(int Offset, byte[] Data, bool IsRle = false, int RleCount = 0);

	/// <summary>
	/// Read an IPS patch file.
	/// </summary>
	public static List<IpsRecord> ReadPatch(byte[] patchData)
	{
		var records = new List<IpsRecord>();

		// Verify header
		if (patchData.Length < 8)
		{
			throw new InvalidDataException("IPS file too small");
		}

		for (int i = 0; i < 5; i++)
		{
			if (patchData[i] != IpsHeader[i])
			{
				throw new InvalidDataException("Invalid IPS header");
			}
		}

		int pos = 5;
		while (pos + 3 <= patchData.Length)
		{
			// Check for EOF
			if (pos + 3 <= patchData.Length &&
				patchData[pos] == IpsEof[0] &&
				patchData[pos + 1] == IpsEof[1] &&
				patchData[pos + 2] == IpsEof[2])
			{
				break;
			}

			// Read offset (3 bytes, big endian)
			int offset = (patchData[pos] << 16) | (patchData[pos + 1] << 8) | patchData[pos + 2];
			pos += 3;

			if (pos + 2 > patchData.Length)
			{
				break;
			}

			// Read size (2 bytes, big endian)
			int size = (patchData[pos] << 8) | patchData[pos + 1];
			pos += 2;

			if (size == 0)
			{
				// RLE encoded record
				if (pos + 3 > patchData.Length)
				{
					break;
				}

				int rleCount = (patchData[pos] << 8) | patchData[pos + 1];
				byte rleValue = patchData[pos + 2];
				pos += 3;

				records.Add(new IpsRecord(offset, new byte[] { rleValue }, true, rleCount));
			}
			else
			{
				// Normal record
				if (pos + size > patchData.Length)
				{
					break;
				}

				var data = new byte[size];
				Array.Copy(patchData, pos, data, 0, size);
				pos += size;

				records.Add(new IpsRecord(offset, data));
			}
		}

		return records;
	}

	/// <summary>
	/// Apply an IPS patch to ROM data.
	/// </summary>
	public static byte[] ApplyPatch(byte[] romData, byte[] patchData)
	{
		var records = ReadPatch(patchData);
		return ApplyRecords(romData, records);
	}

	/// <summary>
	/// Apply IPS records to ROM data.
	/// </summary>
	public static byte[] ApplyRecords(byte[] romData, List<IpsRecord> records)
	{
		// Determine required size
		int maxSize = romData.Length;
		foreach (var record in records)
		{
			int recordEnd = record.IsRle ? record.Offset + record.RleCount : record.Offset + record.Data.Length;
			maxSize = Math.Max(maxSize, recordEnd);
		}

		var result = new byte[maxSize];
		Array.Copy(romData, result, romData.Length);

		// Apply each record
		foreach (var record in records)
		{
			if (record.IsRle)
			{
				for (int i = 0; i < record.RleCount; i++)
				{
					result[record.Offset + i] = record.Data[0];
				}
			}
			else
			{
				Array.Copy(record.Data, 0, result, record.Offset, record.Data.Length);
			}
		}

		return result;
	}

	/// <summary>
	/// Create an IPS patch from two ROMs.
	/// </summary>
	public static byte[] CreatePatch(byte[] original, byte[] modified)
	{
		var records = new List<IpsRecord>();
		int length = Math.Max(original.Length, modified.Length);
		int pos = 0;

		while (pos < length)
		{
			// Skip matching bytes
			while (pos < length && GetByte(original, pos) == GetByte(modified, pos))
			{
				pos++;
			}

			if (pos >= length)
			{
				break;
			}

			// Find extent of difference
			int start = pos;
			int end = pos;

			// Find run of differences (with small gaps allowed)
			while (end < length)
			{
				// Count consecutive differences
				int diffCount = 0;
				int matchCount = 0;

				while (end + diffCount < length && GetByte(original, end + diffCount) != GetByte(modified, end + diffCount))
				{
					diffCount++;
				}

				// Count following matches
				while (end + diffCount + matchCount < length &&
					   GetByte(original, end + diffCount + matchCount) == GetByte(modified, end + diffCount + matchCount) &&
					   matchCount < 8)
				{
					matchCount++;
				}

				// If small gap followed by more differences, include gap
				if (diffCount > 0)
				{
					end += diffCount;
					if (matchCount < 8 && end + matchCount < length &&
						GetByte(original, end + matchCount) != GetByte(modified, end + matchCount))
					{
						end += matchCount;
					}
					else
					{
						break;
					}
				}
				else
				{
					break;
				}
			}

			// Extract modified data
			var data = new byte[end - start];
			for (int i = 0; i < data.Length; i++)
			{
				data[i] = GetByte(modified, start + i);
			}

			// Check for RLE opportunity
			if (data.Length >= 8 && IsAllSame(data))
			{
				records.Add(new IpsRecord(start, new byte[] { data[0] }, true, data.Length));
			}
			else
			{
				records.Add(new IpsRecord(start, data));
			}

			pos = end;
		}

		return WritePatch(records);
	}

	private static byte GetByte(byte[] data, int index)
	{
		return index < data.Length ? data[index] : (byte)0;
	}

	private static bool IsAllSame(byte[] data)
	{
		if (data.Length == 0)
		{
			return true;
		}
		byte first = data[0];
		for (int i = 1; i < data.Length; i++)
		{
			if (data[i] != first)
			{
				return false;
			}
		}
		return true;
	}

	/// <summary>
	/// Write IPS records to patch file format.
	/// </summary>
	public static byte[] WritePatch(List<IpsRecord> records)
	{
		using var ms = new MemoryStream();

		// Header
		ms.Write(IpsHeader, 0, 5);

		// Records
		foreach (var record in records)
		{
			// Offset (3 bytes, big endian)
			ms.WriteByte((byte)((record.Offset >> 16) & 0xff));
			ms.WriteByte((byte)((record.Offset >> 8) & 0xff));
			ms.WriteByte((byte)(record.Offset & 0xff));

			if (record.IsRle)
			{
				// RLE: size=0, then count, then value
				ms.WriteByte(0);
				ms.WriteByte(0);
				ms.WriteByte((byte)((record.RleCount >> 8) & 0xff));
				ms.WriteByte((byte)(record.RleCount & 0xff));
				ms.WriteByte(record.Data[0]);
			}
			else
			{
				// Normal: size, then data
				int size = record.Data.Length;
				ms.WriteByte((byte)((size >> 8) & 0xff));
				ms.WriteByte((byte)(size & 0xff));
				ms.Write(record.Data, 0, record.Data.Length);
			}
		}

		// EOF
		ms.Write(IpsEof, 0, 3);

		return ms.ToArray();
	}

	/// <summary>
	/// Get patch information as text.
	/// </summary>
	public static string GetPatchInfo(byte[] patchData)
	{
		var records = ReadPatch(patchData);
		var sb = new StringBuilder();

		sb.AppendLine($"IPS Patch: {records.Count} records");
		sb.AppendLine();

		int totalBytes = 0;
		foreach (var record in records)
		{
			int size = record.IsRle ? record.RleCount : record.Data.Length;
			totalBytes += size;

			if (record.IsRle)
			{
				sb.AppendLine($"  ${record.Offset:x6}: RLE {size} bytes (${record.Data[0]:x2})");
			}
			else
			{
				sb.AppendLine($"  ${record.Offset:x6}: {size} bytes");
			}
		}

		sb.AppendLine();
		sb.AppendLine($"Total modified: {totalBytes} bytes");

		return sb.ToString();
	}
}

/// <summary>
/// BPS patch format support.
/// </summary>
public static class BpsPatch
{
	private static readonly byte[] BpsHeader = { (byte)'B', (byte)'P', (byte)'S', (byte)'1' };

	/// <summary>
	/// Apply a BPS patch to ROM data.
	/// </summary>
	public static byte[] ApplyPatch(byte[] sourceData, byte[] patchData)
	{
		// Verify header
		if (patchData.Length < 4)
		{
			throw new InvalidDataException("BPS file too small");
		}

		for (int i = 0; i < 4; i++)
		{
			if (patchData[i] != BpsHeader[i])
			{
				throw new InvalidDataException("Invalid BPS header");
			}
		}

		int pos = 4;

		// Read variable-length integers
		long sourceSize = ReadVarInt(patchData, ref pos);
		long targetSize = ReadVarInt(patchData, ref pos);
		long metadataSize = ReadVarInt(patchData, ref pos);

		// Skip metadata
		pos += (int)metadataSize;

		// Create target buffer
		var target = new byte[targetSize];
		int outputPos = 0;
		int sourceRelOffset = 0;
		int targetRelOffset = 0;

		// Process actions
		while (pos < patchData.Length - 12) // 12 = 3 CRC32s
		{
			long data = ReadVarInt(patchData, ref pos);
			int command = (int)(data & 3);
			int length = (int)((data >> 2) + 1);

			switch (command)
			{
				case 0: // SourceRead
					Array.Copy(sourceData, outputPos, target, outputPos, length);
					outputPos += length;
					break;

				case 1: // TargetRead
					for (int i = 0; i < length && pos < patchData.Length - 12; i++)
					{
						target[outputPos++] = patchData[pos++];
					}
					break;

				case 2: // SourceCopy
					{
						long offset = ReadVarInt(patchData, ref pos);
						sourceRelOffset += (int)((offset & 1) != 0 ? -(offset >> 1) - 1 : (offset >> 1));
						for (int i = 0; i < length; i++)
						{
							target[outputPos++] = sourceData[sourceRelOffset++];
						}
					}
					break;

				case 3: // TargetCopy
					{
						long offset = ReadVarInt(patchData, ref pos);
						targetRelOffset += (int)((offset & 1) != 0 ? -(offset >> 1) - 1 : (offset >> 1));
						for (int i = 0; i < length; i++)
						{
							target[outputPos++] = target[targetRelOffset++];
						}
					}
					break;
			}
		}

		return target;
	}

	private static long ReadVarInt(byte[] data, ref int pos)
	{
		long result = 0;
		int shift = 0;

		while (pos < data.Length)
		{
			byte b = data[pos++];
			result |= (long)(b & 0x7f) << shift;

			if ((b & 0x80) != 0)
			{
				result += 1L << (shift + 7);
				shift += 7;
			}
			else
			{
				break;
			}
		}

		return result;
	}
}
