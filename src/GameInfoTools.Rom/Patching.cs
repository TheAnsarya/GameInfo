using System.Text;

namespace GameInfoTools.Rom;

/// <summary>
/// IPS patch format support.
/// </summary>
public static class IpsPatch {
	private static readonly byte[] IpsHeader = { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' };
	private static readonly byte[] IpsEof = { (byte)'E', (byte)'O', (byte)'F' };

	/// <summary>
	/// A single IPS patch record.
	/// </summary>
	public record IpsRecord(int Offset, byte[] Data, bool IsRle = false, int RleCount = 0);

	/// <summary>
	/// Read an IPS patch file.
	/// </summary>
	public static List<IpsRecord> ReadPatch(byte[] patchData) {
		var records = new List<IpsRecord>();

		// Verify header
		if (patchData.Length < 8) {
			throw new InvalidDataException("IPS file too small");
		}

		for (int i = 0; i < 5; i++) {
			if (patchData[i] != IpsHeader[i]) {
				throw new InvalidDataException("Invalid IPS header");
			}
		}

		int pos = 5;
		while (pos + 3 <= patchData.Length) {
			// Check for EOF
			if (pos + 3 <= patchData.Length &&
				patchData[pos] == IpsEof[0] &&
				patchData[pos + 1] == IpsEof[1] &&
				patchData[pos + 2] == IpsEof[2]) {
				break;
			}

			// Read offset (3 bytes, big endian)
			int offset = (patchData[pos] << 16) | (patchData[pos + 1] << 8) | patchData[pos + 2];
			pos += 3;

			if (pos + 2 > patchData.Length) {
				break;
			}

			// Read size (2 bytes, big endian)
			int size = (patchData[pos] << 8) | patchData[pos + 1];
			pos += 2;

			if (size == 0) {
				// RLE encoded record
				if (pos + 3 > patchData.Length) {
					break;
				}

				int rleCount = (patchData[pos] << 8) | patchData[pos + 1];
				byte rleValue = patchData[pos + 2];
				pos += 3;

				records.Add(new IpsRecord(offset, new byte[] { rleValue }, true, rleCount));
			} else {
				// Normal record
				if (pos + size > patchData.Length) {
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
	public static byte[] ApplyPatch(byte[] romData, byte[] patchData) {
		var records = ReadPatch(patchData);
		return ApplyRecords(romData, records);
	}

	/// <summary>
	/// Apply IPS records to ROM data.
	/// </summary>
	public static byte[] ApplyRecords(byte[] romData, List<IpsRecord> records) {
		// Determine required size
		int maxSize = romData.Length;
		foreach (var record in records) {
			int recordEnd = record.IsRle ? record.Offset + record.RleCount : record.Offset + record.Data.Length;
			maxSize = Math.Max(maxSize, recordEnd);
		}

		var result = new byte[maxSize];
		Array.Copy(romData, result, romData.Length);

		// Apply each record
		foreach (var record in records) {
			if (record.IsRle) {
				for (int i = 0; i < record.RleCount; i++) {
					result[record.Offset + i] = record.Data[0];
				}
			} else {
				Array.Copy(record.Data, 0, result, record.Offset, record.Data.Length);
			}
		}

		return result;
	}

	/// <summary>
	/// Create an IPS patch from two ROMs.
	/// </summary>
	public static byte[] CreatePatch(byte[] original, byte[] modified) {
		var records = new List<IpsRecord>();
		int length = Math.Max(original.Length, modified.Length);
		int pos = 0;

		while (pos < length) {
			// Skip matching bytes
			while (pos < length && GetByte(original, pos) == GetByte(modified, pos)) {
				pos++;
			}

			if (pos >= length) {
				break;
			}

			// Find extent of difference
			int start = pos;
			int end = pos;

			// Find run of differences (with small gaps allowed)
			while (end < length) {
				// Count consecutive differences
				int diffCount = 0;
				int matchCount = 0;

				while (end + diffCount < length && GetByte(original, end + diffCount) != GetByte(modified, end + diffCount)) {
					diffCount++;
				}

				// Count following matches
				while (end + diffCount + matchCount < length &&
					   GetByte(original, end + diffCount + matchCount) == GetByte(modified, end + diffCount + matchCount) &&
					   matchCount < 8) {
					matchCount++;
				}

				// If small gap followed by more differences, include gap
				if (diffCount > 0) {
					end += diffCount;
					if (matchCount < 8 && end + matchCount < length &&
						GetByte(original, end + matchCount) != GetByte(modified, end + matchCount)) {
						end += matchCount;
					} else {
						break;
					}
				} else {
					break;
				}
			}

			// Extract modified data
			var data = new byte[end - start];
			for (int i = 0; i < data.Length; i++) {
				data[i] = GetByte(modified, start + i);
			}

			// Check for RLE opportunity
			if (data.Length >= 8 && IsAllSame(data)) {
				records.Add(new IpsRecord(start, new byte[] { data[0] }, true, data.Length));
			} else {
				records.Add(new IpsRecord(start, data));
			}

			pos = end;
		}

		return WritePatch(records);
	}

	private static byte GetByte(byte[] data, int index) {
		return index < data.Length ? data[index] : (byte)0;
	}

	private static bool IsAllSame(byte[] data) {
		if (data.Length == 0) {
			return true;
		}

		byte first = data[0];
		for (int i = 1; i < data.Length; i++) {
			if (data[i] != first) {
				return false;
			}
		}

		return true;
	}

	/// <summary>
	/// Write IPS records to patch file format.
	/// </summary>
	public static byte[] WritePatch(List<IpsRecord> records) {
		using var ms = new MemoryStream();

		// Header
		ms.Write(IpsHeader, 0, 5);

		// Records
		foreach (var record in records) {
			// Offset (3 bytes, big endian)
			ms.WriteByte((byte)((record.Offset >> 16) & 0xff));
			ms.WriteByte((byte)((record.Offset >> 8) & 0xff));
			ms.WriteByte((byte)(record.Offset & 0xff));

			if (record.IsRle) {
				// RLE: size=0, then count, then value
				ms.WriteByte(0);
				ms.WriteByte(0);
				ms.WriteByte((byte)((record.RleCount >> 8) & 0xff));
				ms.WriteByte((byte)(record.RleCount & 0xff));
				ms.WriteByte(record.Data[0]);
			} else {
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
	public static string GetPatchInfo(byte[] patchData) {
		var records = ReadPatch(patchData);
		var sb = new StringBuilder();

		sb.AppendLine($"IPS Patch: {records.Count} records");
		sb.AppendLine();

		int totalBytes = 0;
		foreach (var record in records) {
			int size = record.IsRle ? record.RleCount : record.Data.Length;
			totalBytes += size;

			if (record.IsRle) {
				sb.AppendLine($"  ${record.Offset:x6}: RLE {size} bytes (${record.Data[0]:x2})");
			} else {
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
public static class BpsPatch {
	private static readonly byte[] BpsHeader = { (byte)'B', (byte)'P', (byte)'S', (byte)'1' };

	/// <summary>
	/// Apply a BPS patch to ROM data.
	/// </summary>
	public static byte[] ApplyPatch(byte[] sourceData, byte[] patchData) {
		// Verify header
		if (patchData.Length < 4) {
			throw new InvalidDataException("BPS file too small");
		}

		for (int i = 0; i < 4; i++) {
			if (patchData[i] != BpsHeader[i]) {
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

			switch (command) {
				case 0: // SourceRead
					Array.Copy(sourceData, outputPos, target, outputPos, length);
					outputPos += length;
					break;

				case 1: // TargetRead
					for (int i = 0; i < length && pos < patchData.Length - 12; i++) {
						target[outputPos++] = patchData[pos++];
					}

					break;

				case 2: // SourceCopy
					{
						long offset = ReadVarInt(patchData, ref pos);
						sourceRelOffset += (int)((offset & 1) != 0 ? -(offset >> 1) - 1 : (offset >> 1));
						for (int i = 0; i < length; i++) {
							target[outputPos++] = sourceData[sourceRelOffset++];
						}
					}

					break;

				case 3: // TargetCopy
					{
						long offset = ReadVarInt(patchData, ref pos);
						targetRelOffset += (int)((offset & 1) != 0 ? -(offset >> 1) - 1 : (offset >> 1));
						for (int i = 0; i < length; i++) {
							target[outputPos++] = target[targetRelOffset++];
						}
					}

					break;
			}
		}

		return target;
	}

	private static long ReadVarInt(byte[] data, ref int pos) {
		long result = 0;
		int shift = 0;

		while (pos < data.Length) {
			byte b = data[pos++];
			result |= (long)(b & 0x7f) << shift;

			if ((b & 0x80) != 0) {
				result += 1L << (shift + 7);
				shift += 7;
			} else {
				break;
			}
		}

		return result;
	}
}

/// <summary>
/// UPS patch format support.
/// </summary>
public static class UpsPatch {
	private static readonly byte[] UpsHeader = { (byte)'U', (byte)'P', (byte)'S', (byte)'1' };

	/// <summary>
	/// A single UPS patch record with XOR data.
	/// </summary>
	public record UpsRecord(int RelativeOffset, byte[] XorData);

	/// <summary>
	/// Read a UPS patch file.
	/// </summary>
	public static (long SourceSize, long TargetSize, List<UpsRecord> Records, uint SourceCrc, uint TargetCrc, uint PatchCrc) ReadPatch(byte[] patchData) {
		// Verify header
		if (patchData.Length < 18) {
			throw new InvalidDataException("UPS file too small");
		}

		for (int i = 0; i < 4; i++) {
			if (patchData[i] != UpsHeader[i]) {
				throw new InvalidDataException("Invalid UPS header");
			}
		}

		int pos = 4;

		// Read source and target sizes
		long sourceSize = ReadVarInt(patchData, ref pos);
		long targetSize = ReadVarInt(patchData, ref pos);

		var records = new List<UpsRecord>();

		// Read records until we hit the footer (12 bytes: 3 CRC32s)
		while (pos < patchData.Length - 12) {
			// Relative offset
			long relOffset = ReadVarInt(patchData, ref pos);

			// XOR data (null-terminated)
			var xorData = new List<byte>();
			while (pos < patchData.Length - 12 && patchData[pos] != 0) {
				xorData.Add(patchData[pos++]);
			}

			// Skip null terminator
			if (pos < patchData.Length - 12) {
				pos++;
			}

			records.Add(new UpsRecord((int)relOffset, xorData.ToArray()));
		}

		// Read footer CRCs
		uint sourceCrc = ReadUInt32LE(patchData, pos);
		uint targetCrc = ReadUInt32LE(patchData, pos + 4);
		uint patchCrc = ReadUInt32LE(patchData, pos + 8);

		return (sourceSize, targetSize, records, sourceCrc, targetCrc, patchCrc);
	}

	/// <summary>
	/// Apply a UPS patch to ROM data.
	/// </summary>
	public static byte[] ApplyPatch(byte[] sourceData, byte[] patchData) {
		var (sourceSize, targetSize, records, sourceCrc, targetCrc, patchCrc) = ReadPatch(patchData);

		// Verify source size
		if (sourceData.Length != sourceSize) {
			throw new InvalidDataException($"Source size mismatch: expected {sourceSize}, got {sourceData.Length}");
		}

		// Verify source CRC
		uint actualSourceCrc = Crc32.Calculate(sourceData);
		if (actualSourceCrc != sourceCrc) {
			throw new InvalidDataException($"Source CRC mismatch: expected {sourceCrc:x8}, got {actualSourceCrc:x8}");
		}

		// Create target buffer
		var target = new byte[targetSize];
		Array.Copy(sourceData, target, Math.Min(sourceData.Length, target.Length));

		// Apply XOR patches
		int outputPos = 0;
		foreach (var record in records) {
			outputPos += record.RelativeOffset;

			foreach (byte xorByte in record.XorData) {
				if (outputPos < target.Length) {
					byte sourceByte = outputPos < sourceData.Length ? sourceData[outputPos] : (byte)0;
					target[outputPos] = (byte)(sourceByte ^ xorByte);
				}

				outputPos++;
			}

			outputPos++; // Skip the null terminator position
		}

		// Verify target CRC
		uint actualTargetCrc = Crc32.Calculate(target);
		if (actualTargetCrc != targetCrc) {
			throw new InvalidDataException($"Target CRC mismatch: expected {targetCrc:x8}, got {actualTargetCrc:x8}");
		}

		return target;
	}

	/// <summary>
	/// Create a UPS patch from two ROMs.
	/// </summary>
	public static byte[] CreatePatch(byte[] original, byte[] modified) {
		var records = new List<UpsRecord>();
		int maxLen = Math.Max(original.Length, modified.Length);
		int pos = 0;
		int lastDiffPos = 0;

		while (pos < maxLen) {
			// Find next difference
			while (pos < maxLen && GetByte(original, pos) == GetByte(modified, pos)) {
				pos++;
			}

			if (pos >= maxLen) {
				break;
			}

			// Calculate relative offset
			int relOffset = pos - lastDiffPos;

			// Collect XOR data until we find matching bytes again
			var xorData = new List<byte>();
			while (pos < maxLen && GetByte(original, pos) != GetByte(modified, pos)) {
				byte xorByte = (byte)(GetByte(original, pos) ^ GetByte(modified, pos));
				xorData.Add(xorByte);
				pos++;
			}

			records.Add(new UpsRecord(relOffset, xorData.ToArray()));
			lastDiffPos = pos + 1; // +1 for null terminator
		}

		return WritePatch(original.Length, modified.Length, records,
			Crc32.Calculate(original), Crc32.Calculate(modified));
	}

	private static byte GetByte(byte[] data, int index) {
		return index < data.Length ? data[index] : (byte)0;
	}

	/// <summary>
	/// Write UPS records to patch file format.
	/// </summary>
	public static byte[] WritePatch(long sourceSize, long targetSize, List<UpsRecord> records, uint sourceCrc, uint targetCrc) {
		using var ms = new MemoryStream();

		// Header
		ms.Write(UpsHeader, 0, 4);

		// Source and target sizes
		WriteVarInt(ms, sourceSize);
		WriteVarInt(ms, targetSize);

		// Records
		foreach (var record in records) {
			WriteVarInt(ms, record.RelativeOffset);
			ms.Write(record.XorData, 0, record.XorData.Length);
			ms.WriteByte(0); // Null terminator
		}

		// Calculate patch CRC (excluding the patch CRC itself)
		byte[] patchWithoutCrc = ms.ToArray();
		uint patchCrc = Crc32.Calculate(patchWithoutCrc);

		// Append CRCs
		WriteUInt32LE(ms, sourceCrc);
		WriteUInt32LE(ms, targetCrc);
		WriteUInt32LE(ms, patchCrc);

		return ms.ToArray();
	}

	/// <summary>
	/// Get patch information as text.
	/// </summary>
	public static string GetPatchInfo(byte[] patchData) {
		var (sourceSize, targetSize, records, sourceCrc, targetCrc, patchCrc) = ReadPatch(patchData);
		var sb = new StringBuilder();

		sb.AppendLine($"UPS Patch: {records.Count} records");
		sb.AppendLine($"Source size: {sourceSize} bytes (CRC: {sourceCrc:x8})");
		sb.AppendLine($"Target size: {targetSize} bytes (CRC: {targetCrc:x8})");
		sb.AppendLine($"Patch CRC: {patchCrc:x8}");
		sb.AppendLine();

		int totalBytes = 0;
		int currentPos = 0;
		foreach (var record in records) {
			currentPos += record.RelativeOffset;
			totalBytes += record.XorData.Length;
			sb.AppendLine($"  ${currentPos:x6}: {record.XorData.Length} XOR bytes");
			currentPos += record.XorData.Length + 1;
		}

		sb.AppendLine();
		sb.AppendLine($"Total modified: {totalBytes} bytes");

		return sb.ToString();
	}

	private static long ReadVarInt(byte[] data, ref int pos) {
		long value = 0;
		int shift = 0;

		while (pos < data.Length) {
			byte b = data[pos++];
			value += (long)(b & 0x7f) << shift;

			if ((b & 0x80) == 0) {
				break;
			}

			value += 1L << (shift + 7);
			shift += 7;
		}

		return value;
	}

	private static void WriteVarInt(MemoryStream ms, long value) {
		while (true) {
			byte b = (byte)(value & 0x7f);
			value >>= 7;

			if (value == 0) {
				ms.WriteByte(b);
				break;
			}

			ms.WriteByte((byte)(b | 0x80));
			value--;
		}
	}

	private static uint ReadUInt32LE(byte[] data, int offset) {
		return (uint)(data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24));
	}

	private static void WriteUInt32LE(MemoryStream ms, uint value) {
		ms.WriteByte((byte)(value & 0xff));
		ms.WriteByte((byte)((value >> 8) & 0xff));
		ms.WriteByte((byte)((value >> 16) & 0xff));
		ms.WriteByte((byte)((value >> 24) & 0xff));
	}
}

/// <summary>
/// Patch format type.
/// </summary>
public enum PatchFormat {
	/// <summary>Unknown or invalid format.</summary>
	Unknown,
	/// <summary>IPS patch format.</summary>
	Ips,
	/// <summary>BPS patch format.</summary>
	Bps,
	/// <summary>UPS patch format.</summary>
	Ups
}

/// <summary>
/// A single change to be applied to a ROM.
/// </summary>
/// <param name="Offset">The byte offset in the ROM.</param>
/// <param name="OriginalData">The original byte values (for preview/undo).</param>
/// <param name="NewData">The new byte values to write.</param>
/// <param name="Source">Which patch file this change came from.</param>
public record PatchChange(int Offset, byte[] OriginalData, byte[] NewData, string Source);

/// <summary>
/// Represents a conflict between multiple patches.
/// </summary>
/// <param name="Offset">The byte offset where conflict occurs.</param>
/// <param name="Length">Number of bytes affected.</param>
/// <param name="Patches">Names of patches that conflict.</param>
/// <param name="Values">The different values each patch wants to write.</param>
public record PatchConflict(int Offset, int Length, List<string> Patches, List<byte[]> Values);

/// <summary>
/// Result of applying multiple patches.
/// </summary>
/// <param name="Success">Whether all patches applied successfully.</param>
/// <param name="PatchedData">The resulting ROM data.</param>
/// <param name="Changes">All changes that were applied.</param>
/// <param name="Conflicts">Any conflicts detected.</param>
/// <param name="Errors">Any errors that occurred.</param>
public record MultiPatchResult(bool Success, byte[] PatchedData, List<PatchChange> Changes, List<PatchConflict> Conflicts, List<string> Errors);

/// <summary>
/// Preview information for a patch.
/// </summary>
/// <param name="Format">The patch format.</param>
/// <param name="RecordCount">Number of patch records.</param>
/// <param name="TotalBytesChanged">Total bytes that will be modified.</param>
/// <param name="Changes">List of all changes (with original and new values).</param>
/// <param name="MinOffset">Minimum ROM offset modified.</param>
/// <param name="MaxOffset">Maximum ROM offset modified.</param>
public record PatchPreview(PatchFormat Format, int RecordCount, int TotalBytesChanged, List<PatchChange> Changes, int MinOffset, int MaxOffset);

/// <summary>
/// Advanced patching utilities including preview, multi-patch, and conflict detection.
/// </summary>
public static class PatchUtilities {
	/// <summary>
	/// Detect the format of a patch file.
	/// </summary>
	public static PatchFormat DetectFormat(byte[] patchData) {
		if (patchData.Length < 4) {
			return PatchFormat.Unknown;
		}

		// IPS: "PATCH"
		if (patchData.Length >= 5 &&
			patchData[0] == 'P' && patchData[1] == 'A' && patchData[2] == 'T' &&
			patchData[3] == 'C' && patchData[4] == 'H') {
			return PatchFormat.Ips;
		}

		// BPS: "BPS1"
		if (patchData[0] == 'B' && patchData[1] == 'P' && patchData[2] == 'S' && patchData[3] == '1') {
			return PatchFormat.Bps;
		}

		// UPS: "UPS1"
		if (patchData[0] == 'U' && patchData[1] == 'P' && patchData[2] == 'S' && patchData[3] == '1') {
			return PatchFormat.Ups;
		}

		return PatchFormat.Unknown;
	}

	/// <summary>
	/// Preview what changes a patch will make without applying it.
	/// </summary>
	public static PatchPreview PreviewPatch(byte[] patchData, byte[] sourceData, string sourceName = "patch") {
		var format = DetectFormat(patchData);
		var changes = new List<PatchChange>();
		int recordCount = 0;
		int totalBytes = 0;
		int minOffset = int.MaxValue;
		int maxOffset = 0;

		switch (format) {
			case PatchFormat.Ips:
				var ipsRecords = IpsPatch.ReadPatch(patchData);
				recordCount = ipsRecords.Count;

				foreach (var record in ipsRecords) {
					int length = record.IsRle ? record.RleCount : record.Data.Length;
					byte[] newData = record.IsRle
						? Enumerable.Repeat(record.Data[0], record.RleCount).ToArray()
						: record.Data;

					// Get original data
					byte[] originalData = new byte[length];
					for (int i = 0; i < length && record.Offset + i < sourceData.Length; i++) {
						originalData[i] = sourceData[record.Offset + i];
					}

					changes.Add(new PatchChange(record.Offset, originalData, newData, sourceName));
					totalBytes += length;
					minOffset = Math.Min(minOffset, record.Offset);
					maxOffset = Math.Max(maxOffset, record.Offset + length - 1);
				}

				break;

			case PatchFormat.Ups:
				var (_, _, upsRecords, _, _, _) = UpsPatch.ReadPatch(patchData);
				recordCount = upsRecords.Count;

				int currentPos = 0;
				foreach (var record in upsRecords) {
					currentPos += record.RelativeOffset;

					// UPS uses XOR, so we need to calculate actual new values
					byte[] originalData = new byte[record.XorData.Length];
					byte[] newData = new byte[record.XorData.Length];

					for (int i = 0; i < record.XorData.Length; i++) {
						int pos = currentPos + i;
						byte srcByte = pos < sourceData.Length ? sourceData[pos] : (byte)0;
						originalData[i] = srcByte;
						newData[i] = (byte)(srcByte ^ record.XorData[i]);
					}

					changes.Add(new PatchChange(currentPos, originalData, newData, sourceName));
					totalBytes += record.XorData.Length;
					minOffset = Math.Min(minOffset, currentPos);
					maxOffset = Math.Max(maxOffset, currentPos + record.XorData.Length - 1);

					currentPos += record.XorData.Length + 1;
				}

				break;

			case PatchFormat.Bps:
				// BPS is complex - for preview, we apply and diff
				try {
					byte[] result = BpsPatch.ApplyPatch(sourceData, patchData);
					recordCount = 1; // BPS doesn't have discrete records

					// Find all differences
					int diffStart = -1;
					for (int i = 0; i < Math.Max(sourceData.Length, result.Length); i++) {
						byte srcByte = i < sourceData.Length ? sourceData[i] : (byte)0;
						byte dstByte = i < result.Length ? result[i] : (byte)0;

						if (srcByte != dstByte) {
							if (diffStart == -1) {
								diffStart = i;
							}
						} else if (diffStart != -1) {
							// End of a diff region
							int length = i - diffStart;
							byte[] origData = new byte[length];
							byte[] newDataArr = new byte[length];
							Array.Copy(sourceData, diffStart, origData, 0, Math.Min(length, sourceData.Length - diffStart));
							Array.Copy(result, diffStart, newDataArr, 0, length);

							changes.Add(new PatchChange(diffStart, origData, newDataArr, sourceName));
							totalBytes += length;
							minOffset = Math.Min(minOffset, diffStart);
							maxOffset = Math.Max(maxOffset, i - 1);

							diffStart = -1;
							recordCount++;
						}
					}

					// Handle trailing diff
					if (diffStart != -1) {
						int length = Math.Max(sourceData.Length, result.Length) - diffStart;
						byte[] origData = new byte[length];
						byte[] newDataArr = new byte[length];
						if (diffStart < sourceData.Length) {
							Array.Copy(sourceData, diffStart, origData, 0, Math.Min(length, sourceData.Length - diffStart));
						}

						Array.Copy(result, diffStart, newDataArr, 0, length);

						changes.Add(new PatchChange(diffStart, origData, newDataArr, sourceName));
						totalBytes += length;
						minOffset = Math.Min(minOffset, diffStart);
						maxOffset = Math.Max(maxOffset, diffStart + length - 1);
					}
				} catch {
					// If BPS fails to apply, return empty preview
				}

				break;
		}

		if (minOffset == int.MaxValue) {
			minOffset = 0;
		}

		return new PatchPreview(format, recordCount, totalBytes, changes, minOffset, maxOffset);
	}

	/// <summary>
	/// Detect conflicts between multiple patches.
	/// </summary>
	public static List<PatchConflict> DetectConflicts(List<(byte[] PatchData, string Name)> patches, byte[] sourceData) {
		var conflicts = new List<PatchConflict>();
		var allChanges = new Dictionary<int, List<(string Name, byte Value)>>();

		// Collect all byte changes from all patches
		foreach (var (patchData, name) in patches) {
			var preview = PreviewPatch(patchData, sourceData, name);

			foreach (var change in preview.Changes) {
				for (int i = 0; i < change.NewData.Length; i++) {
					int offset = change.Offset + i;

					if (!allChanges.ContainsKey(offset)) {
						allChanges[offset] = [];
					}

					allChanges[offset].Add((name, change.NewData[i]));
				}
			}
		}

		// Find offsets where multiple patches write different values
		var conflictingOffsets = new List<int>();
		foreach (var (offset, changes) in allChanges) {
			if (changes.Count > 1) {
				// Check if they write different values
				var distinctValues = changes.Select(c => c.Value).Distinct().ToList();
				if (distinctValues.Count > 1) {
					conflictingOffsets.Add(offset);
				}
			}
		}

		// Group consecutive conflicting offsets
		conflictingOffsets.Sort();
		int conflictStart = -1;
		var currentPatches = new HashSet<string>();
		var currentValues = new Dictionary<string, List<byte>>();

		for (int i = 0; i <= conflictingOffsets.Count; i++) {
			int offset = i < conflictingOffsets.Count ? conflictingOffsets[i] : -1;

			if (conflictStart == -1 && offset != -1) {
				// Start new conflict region
				conflictStart = offset;
				currentPatches.Clear();
				currentValues.Clear();

				foreach (var (name, value) in allChanges[offset]) {
					currentPatches.Add(name);
					if (!currentValues.ContainsKey(name)) {
						currentValues[name] = [];
					}

					currentValues[name].Add(value);
				}
			} else if (conflictStart != -1 && (offset == -1 || offset > conflictingOffsets[i - 1] + 1)) {
				// End current conflict region
				int length = conflictingOffsets[i - 1] - conflictStart + 1;
				conflicts.Add(new PatchConflict(
					conflictStart,
					length,
					currentPatches.ToList(),
					currentPatches.Select(p => currentValues[p].ToArray()).ToList()
				));

				conflictStart = offset;
				if (offset != -1) {
					currentPatches.Clear();
					currentValues.Clear();
					foreach (var (name, value) in allChanges[offset]) {
						currentPatches.Add(name);
						if (!currentValues.ContainsKey(name)) {
							currentValues[name] = [];
						}

						currentValues[name].Add(value);
					}
				}
			} else if (offset != -1) {
				// Continue current conflict region
				foreach (var (name, value) in allChanges[offset]) {
					currentPatches.Add(name);
					if (!currentValues.ContainsKey(name)) {
						currentValues[name] = [];
					}

					currentValues[name].Add(value);
				}
			}
		}

		return conflicts;
	}

	/// <summary>
	/// Apply multiple patches in sequence.
	/// </summary>
	/// <param name="sourceData">The original ROM data.</param>
	/// <param name="patches">List of patches with their names.</param>
	/// <param name="stopOnConflict">If true, stop when conflicts are detected.</param>
	/// <param name="conflictResolution">Strategy for resolving conflicts: "first", "last", or "skip".</param>
	public static MultiPatchResult ApplyMultiplePatches(
		byte[] sourceData,
		List<(byte[] PatchData, string Name)> patches,
		bool stopOnConflict = false,
		string conflictResolution = "last") {
		var allChanges = new List<PatchChange>();
		var errors = new List<string>();

		// First, detect conflicts
		var conflicts = DetectConflicts(patches, sourceData);

		if (stopOnConflict && conflicts.Count > 0) {
			return new MultiPatchResult(false, sourceData, [], conflicts, ["Conflicts detected, stopping"]);
		}

		// Start with a copy of source
		byte[] result = new byte[sourceData.Length];
		Array.Copy(sourceData, result, sourceData.Length);

		// Track which bytes have been modified and by which patch
		var modifiedBy = new Dictionary<int, string>();

		// Apply patches in order
		foreach (var (patchData, name) in patches) {
			try {
				var preview = PreviewPatch(patchData, result, name);

				foreach (var change in preview.Changes) {
					bool hasConflict = false;
					string conflictingPatch = "";

					// Check for conflicts with already-applied patches
					for (int i = 0; i < change.NewData.Length; i++) {
						int offset = change.Offset + i;
						if (modifiedBy.TryGetValue(offset, out string? existingPatch)) {
							hasConflict = true;
							conflictingPatch = existingPatch;
							break;
						}
					}

					bool applyChange = true;
					if (hasConflict) {
						applyChange = conflictResolution switch {
							"first" => false, // Keep first patch's value
							"last" => true,   // Overwrite with this patch
							"skip" => false,  // Skip conflicting changes
							_ => true
						};
					}

					if (applyChange) {
						// Apply the change
						for (int i = 0; i < change.NewData.Length && change.Offset + i < result.Length; i++) {
							result[change.Offset + i] = change.NewData[i];
							modifiedBy[change.Offset + i] = name;
						}

						allChanges.Add(change);
					}
				}
			} catch (Exception ex) {
				errors.Add($"Error applying {name}: {ex.Message}");
			}
		}

		return new MultiPatchResult(errors.Count == 0, result, allChanges, conflicts, errors);
	}

	/// <summary>
	/// Generate a detailed text report of patch changes.
	/// </summary>
	public static string GeneratePatchReport(PatchPreview preview, int maxChangesToShow = 50) {
		var sb = new StringBuilder();

		sb.AppendLine($"Patch Format: {preview.Format}");
		sb.AppendLine($"Records: {preview.RecordCount}");
		sb.AppendLine($"Total Bytes Changed: {preview.TotalBytesChanged}");
		sb.AppendLine($"Offset Range: ${preview.MinOffset:x6} - ${preview.MaxOffset:x6}");
		sb.AppendLine();

		sb.AppendLine("Changes:");
		int shown = 0;
		foreach (var change in preview.Changes) {
			if (shown >= maxChangesToShow) {
				sb.AppendLine($"  ... and {preview.Changes.Count - shown} more changes");
				break;
			}

			sb.AppendLine($"  ${change.Offset:x6}: {change.NewData.Length} bytes");

			// Show first few bytes of change
			int bytesToShow = Math.Min(8, change.NewData.Length);
			string origHex = string.Join(" ", change.OriginalData.Take(bytesToShow).Select(b => $"{b:x2}"));
			string newHex = string.Join(" ", change.NewData.Take(bytesToShow).Select(b => $"{b:x2}"));

			if (change.NewData.Length > bytesToShow) {
				origHex += " ...";
				newHex += " ...";
			}

			sb.AppendLine($"    Original: {origHex}");
			sb.AppendLine($"    New:      {newHex}");

			shown++;
		}

		return sb.ToString();
	}

	/// <summary>
	/// Generate a conflict report.
	/// </summary>
	public static string GenerateConflictReport(List<PatchConflict> conflicts) {
		if (conflicts.Count == 0) {
			return "No conflicts detected.";
		}

		var sb = new StringBuilder();
		sb.AppendLine($"Detected {conflicts.Count} conflict(s):");
		sb.AppendLine();

		foreach (var conflict in conflicts) {
			sb.AppendLine($"Conflict at ${conflict.Offset:x6} ({conflict.Length} bytes):");
			sb.AppendLine($"  Patches involved: {string.Join(", ", conflict.Patches)}");

			for (int i = 0; i < conflict.Patches.Count; i++) {
				int bytesToShow = Math.Min(8, conflict.Values[i].Length);
				string hex = string.Join(" ", conflict.Values[i].Take(bytesToShow).Select(b => $"{b:x2}"));
				if (conflict.Values[i].Length > bytesToShow) {
					hex += " ...";
				}

				sb.AppendLine($"    {conflict.Patches[i]}: {hex}");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Create an undo patch that reverses the changes made by a patch.
	/// </summary>
	public static byte[] CreateUndoPatch(byte[] patchData, byte[] sourceData, PatchFormat outputFormat = PatchFormat.Ips) {
		var preview = PreviewPatch(patchData, sourceData);

		// Create records that restore original values
		var undoRecords = new List<IpsPatch.IpsRecord>();

		foreach (var change in preview.Changes) {
			undoRecords.Add(new IpsPatch.IpsRecord(change.Offset, change.OriginalData));
		}

		return IpsPatch.WritePatch(undoRecords);
	}

	/// <summary>
	/// Merge multiple patches into a single patch file.
	/// </summary>
	public static byte[] MergePatches(byte[] sourceData, List<(byte[] PatchData, string Name)> patches, string conflictResolution = "last") {
		var result = ApplyMultiplePatches(sourceData, patches, false, conflictResolution);

		if (!result.Success && result.Errors.Count > 0) {
			throw new InvalidOperationException($"Failed to merge patches: {string.Join(", ", result.Errors)}");
		}

		// Create a single IPS patch from the merged result
		return IpsPatch.CreatePatch(sourceData, result.PatchedData);
	}
}

/// <summary>
/// IPS patch header information and editing.
/// </summary>
public static class IpsPatchHeader {
	/// <summary>
	/// Standard IPS header.
	/// </summary>
	public static readonly byte[] Header = { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' };

	/// <summary>
	/// Standard IPS EOF marker.
	/// </summary>
	public static readonly byte[] Eof = { (byte)'E', (byte)'O', (byte)'F' };

	/// <summary>
	/// Truncate extension (optional, follows EOF).
	/// </summary>
	public static bool HasTruncateExtension(byte[] patchData) {
		// Check if patch has 3 more bytes after EOF for truncation address
		int eofPos = FindEof(patchData);
		return eofPos != -1 && patchData.Length >= eofPos + 3 + 3;
	}

	/// <summary>
	/// Get truncation offset if present.
	/// </summary>
	public static int? GetTruncateOffset(byte[] patchData) {
		if (!HasTruncateExtension(patchData)) {
			return null;
		}

		int eofPos = FindEof(patchData);
		int truncPos = eofPos + 3;

		return (patchData[truncPos] << 16) | (patchData[truncPos + 1] << 8) | patchData[truncPos + 2];
	}

	/// <summary>
	/// Add truncation extension to an IPS patch.
	/// </summary>
	public static byte[] AddTruncateExtension(byte[] patchData, int truncateOffset) {
		// Remove existing truncate extension if present
		byte[] clean = RemoveTruncateExtension(patchData);

		// Add new truncate extension
		var result = new byte[clean.Length + 3];
		Array.Copy(clean, result, clean.Length);

		result[clean.Length] = (byte)((truncateOffset >> 16) & 0xff);
		result[clean.Length + 1] = (byte)((truncateOffset >> 8) & 0xff);
		result[clean.Length + 2] = (byte)(truncateOffset & 0xff);

		return result;
	}

	/// <summary>
	/// Remove truncation extension from an IPS patch.
	/// </summary>
	public static byte[] RemoveTruncateExtension(byte[] patchData) {
		int eofPos = FindEof(patchData);
		if (eofPos == -1) {
			return patchData;
		}

		// Return just up to and including EOF
		var result = new byte[eofPos + 3];
		Array.Copy(patchData, result, result.Length);
		return result;
	}

	private static int FindEof(byte[] patchData) {
		// Search for EOF marker from the end
		for (int i = patchData.Length - 3; i >= 5; i--) {
			if (patchData[i] == 'E' && patchData[i + 1] == 'O' && patchData[i + 2] == 'F') {
				return i;
			}
		}

		return -1;
	}

	/// <summary>
	/// Validate an IPS patch file.
	/// </summary>
	public static (bool IsValid, string? Error) Validate(byte[] patchData) {
		if (patchData.Length < 8) {
			return (false, "File too small to be valid IPS patch");
		}

		// Check header
		for (int i = 0; i < 5; i++) {
			if (patchData[i] != Header[i]) {
				return (false, "Invalid IPS header");
			}
		}

		// Check for EOF
		int eofPos = FindEof(patchData);
		if (eofPos == -1) {
			return (false, "Missing EOF marker");
		}

		// Try to read records
		try {
			_ = IpsPatch.ReadPatch(patchData);
		} catch (Exception ex) {
			return (false, $"Invalid patch data: {ex.Message}");
		}

		return (true, null);
	}
}

/// <summary>
/// CRC32 calculation (used by UPS format).
/// </summary>
public static class Crc32 {
	private static readonly uint[] Table;

	static Crc32() {
		Table = new uint[256];
		const uint polynomial = 0xedb88320;

		for (uint i = 0; i < 256; i++) {
			uint crc = i;
			for (int j = 0; j < 8; j++) {
				crc = (crc & 1) != 0 ? (crc >> 1) ^ polynomial : crc >> 1;
			}

			Table[i] = crc;
		}
	}

	/// <summary>
	/// Calculate CRC32 of data.
	/// </summary>
	public static uint Calculate(byte[] data) {
		uint crc = 0xffffffff;

		foreach (byte b in data) {
			crc = Table[(crc ^ b) & 0xff] ^ (crc >> 8);
		}

		return crc ^ 0xffffffff;
	}

	/// <summary>
	/// Calculate CRC32 of a span.
	/// </summary>
	public static uint Calculate(ReadOnlySpan<byte> data) {
		uint crc = 0xffffffff;

		foreach (byte b in data) {
			crc = Table[(crc ^ b) & 0xff] ^ (crc >> 8);
		}

		return crc ^ 0xffffffff;
	}
}
