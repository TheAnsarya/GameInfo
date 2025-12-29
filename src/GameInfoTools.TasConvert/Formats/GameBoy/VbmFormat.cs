using System.Text;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Formats.GameBoy;

/// <summary>
/// VBA-RR VBM format reader/writer.
/// </summary>
/// <remarks>
/// VBM is the native format for Visual Boy Advance Re-Recording.
/// Binary format with 64-byte header + 192-byte info section.
/// Signature: "VBM\x1A"
/// </remarks>
public class VbmFormat : TasFormatBase {
	private static readonly byte[] Signature = "VBM\x1A"u8.ToArray();

	/// <inheritdoc/>
	public override string Name => "VBM";

	/// <inheritdoc/>
	public override string Description => "VBA-RR movie file";

	/// <inheritdoc/>
	public override string EmulatorName => "VBA-RR";

	/// <inheritdoc/>
	public override IReadOnlyList<string> Extensions => ["vbm"];

	/// <inheritdoc/>
	public override IReadOnlyList<GameSystem> SupportedSystems => [
		GameSystem.GameBoy,
		GameSystem.GameBoyColor,
		GameSystem.GameBoyAdvance
	];

	/// <inheritdoc/>
	public override bool CanHandle(Stream stream) {
		if (stream.Length < 4) return false;

		Span<byte> header = stackalloc byte[4];
		stream.ReadExactly(header);
		return header.SequenceEqual(Signature);
	}

	/// <inheritdoc/>
	public override async Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default) {
		// Read header (64 bytes)
		var header = await ReadHeaderAsync(stream, cancellationToken);

		// Read ROM info (192 bytes)
		var romInfo = await ReadRomInfoAsync(stream, cancellationToken);

		// Read controller data
		stream.Position = header.ControllerDataOffset;
		var frames = await ReadFramesAsync(stream, header, cancellationToken);

		// Read savestate if present
		byte[]? savestateData = null;
		if (header.SavestateOffset > 0 && stream.Length > header.SavestateOffset) {
			stream.Position = header.SavestateOffset;
			savestateData = new byte[header.ControllerDataOffset - header.SavestateOffset];
			await stream.ReadExactlyAsync(savestateData, cancellationToken);
		}

		// Determine system from type flags
		var system = (header.TypeFlags & VbmTypeFlags.Gba) != 0 ? GameSystem.GameBoyAdvance :
			(header.TypeFlags & VbmTypeFlags.Gbc) != 0 ? GameSystem.GameBoyColor :
			(header.TypeFlags & VbmTypeFlags.Sgb) != 0 ? GameSystem.GameBoy : GameSystem.GameBoy;

		// Build metadata
		var metadata = new TasMetadata {
			EmulatorName = "VBA-RR",
			EmulatorVersion = $"v{header.MinorVersion}",
			FormatName = "VBM",
			FormatVersion = (int)header.MajorVersion,
			Author = romInfo.AuthorName,
			RerecordCount = (int)header.RerecordCount,
			FrameCount = (int)header.FrameCount,
			StartType = (header.StartFlags & VbmStartFlags.FromSavestate) != 0 ? MovieStartType.Savestate :
				(header.StartFlags & VbmStartFlags.FromSram) != 0 ? MovieStartType.Sram : MovieStartType.PowerOn,
			RomName = romInfo.RomName,
			RomChecksum = header.RomCrc.ToString("x8"),
			RomChecksumType = ChecksumType.Crc32,
			Comments = romInfo.Description,
		};

		// Build controller info
		var controllers = new List<ControllerInfo>();
		if ((header.ControllerFlags & 0x01) != 0) {
			controllers.Add(new ControllerInfo { Port = 0, Type = ControllerType.Gamepad });
		}
		if ((header.ControllerFlags & 0x02) != 0) {
			controllers.Add(new ControllerInfo { Port = 1, Type = ControllerType.Gamepad });
		}
		if ((header.ControllerFlags & 0x04) != 0) {
			controllers.Add(new ControllerInfo { Port = 2, Type = ControllerType.Gamepad });
		}
		if ((header.ControllerFlags & 0x08) != 0) {
			controllers.Add(new ControllerInfo { Port = 3, Type = ControllerType.Gamepad });
		}

		if (controllers.Count == 0) {
			controllers.Add(new ControllerInfo { Port = 0, Type = ControllerType.Gamepad });
		}

		return new TasMovie {
			Metadata = metadata,
			Frames = frames,
			System = system,
			Controllers = controllers,
			SavestateData = savestateData,
		};
	}

	/// <inheritdoc/>
	public override async Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default) {
		// Build header
		var header = new VbmHeader {
			MajorVersion = 1,
			MinorVersion = 0,
			Uid = (uint)DateTimeOffset.UtcNow.ToUnixTimeSeconds(),
			FrameCount = (uint)movie.Frames.Count,
			RerecordCount = (uint)movie.Metadata.RerecordCount,
			StartFlags = movie.Metadata.StartType switch {
				MovieStartType.Savestate => VbmStartFlags.FromSavestate,
				MovieStartType.Sram => VbmStartFlags.FromSram,
				_ => VbmStartFlags.FromPowerOn,
			},
			ControllerFlags = 0,
			TypeFlags = movie.System switch {
				GameSystem.GameBoyAdvance => VbmTypeFlags.Gba,
				GameSystem.GameBoyColor => VbmTypeFlags.Gbc,
				GameSystem.GameBoy => VbmTypeFlags.None,
				_ => VbmTypeFlags.None,
			},
			SavestateOffset = 0,
			ControllerDataOffset = 256, // Header (64) + ROM info (192)
		};

		// Set controller flags
		foreach (var controller in movie.Controllers) {
			if (controller.Port < 4) {
				header.ControllerFlags |= (byte)(1 << controller.Port);
			}
		}

		// Build ROM info
		var romInfo = new VbmRomInfo {
			RomName = movie.Metadata.RomName ?? "",
			AuthorName = movie.Metadata.Author ?? "",
			Description = movie.Metadata.Comments ?? "",
		};

		// Write header
		await WriteHeaderAsync(stream, header, cancellationToken);

		// Write ROM info
		await WriteRomInfoAsync(stream, romInfo, cancellationToken);

		// Write controller data
		var bytesPerFrame = movie.System == GameSystem.GameBoyAdvance ? 2 : 1;
		await WriteFramesAsync(stream, movie.Frames, bytesPerFrame, cancellationToken);

		// Write savestate if present
		if (movie.SavestateData is not null) {
			// Update savestate offset in header
			var savestateOffset = stream.Position;
			await stream.WriteAsync(movie.SavestateData, cancellationToken);

			// Go back and update offsets
			stream.Position = 12;
			WriteUInt32LE(stream, (uint)savestateOffset);
			stream.Position = stream.Length;
		}
	}

	private static async Task<VbmHeader> ReadHeaderAsync(Stream stream, CancellationToken cancellationToken) {
		var header = new VbmHeader();

		// Verify signature (4 bytes)
		var sig = new byte[4];
		await stream.ReadExactlyAsync(sig, cancellationToken);
		if (!sig.AsSpan().SequenceEqual(Signature)) {
			throw new InvalidDataException("Invalid VBM signature.");
		}

		// Major version (4 bytes)
		header.MajorVersion = ReadUInt32LE(stream);

		// Movie UID (4 bytes)
		header.Uid = ReadUInt32LE(stream);

		// Frame count (4 bytes)
		header.FrameCount = ReadUInt32LE(stream);

		// Rerecord count (4 bytes)
		header.RerecordCount = ReadUInt32LE(stream);

		// Movie start flags (1 byte)
		header.StartFlags = (VbmStartFlags)stream.ReadByte();

		// Controller flags (1 byte)
		header.ControllerFlags = (byte)stream.ReadByte();

		// System type flags (1 byte)
		header.TypeFlags = (VbmTypeFlags)stream.ReadByte();

		// Reserved (1 byte)
		stream.ReadByte();

		// Option flags (4 bytes)
		header.OptionFlags = ReadUInt32LE(stream);

		// Savestate offset (4 bytes)
		header.SavestateOffset = ReadUInt32LE(stream);

		// Controller data offset (4 bytes)
		header.ControllerDataOffset = ReadUInt32LE(stream);

		// ROM CRC (4 bytes)
		header.RomCrc = ReadUInt32LE(stream);

		// Minor version (2 bytes)
		header.MinorVersion = ReadUInt16LE(stream);

		// ROM serial (2 bytes)
		header.RomSerial = ReadUInt16LE(stream);

		// Reserved (16 bytes, skip to position 64)
		stream.Position = 64;

		return header;
	}

	private static async Task WriteHeaderAsync(Stream stream, VbmHeader header, CancellationToken cancellationToken) {
		// Signature
		await stream.WriteAsync(Signature, cancellationToken);

		// Major version
		WriteUInt32LE(stream, header.MajorVersion);

		// UID
		WriteUInt32LE(stream, header.Uid);

		// Frame count
		WriteUInt32LE(stream, header.FrameCount);

		// Rerecord count
		WriteUInt32LE(stream, header.RerecordCount);

		// Start flags
		stream.WriteByte((byte)header.StartFlags);

		// Controller flags
		stream.WriteByte(header.ControllerFlags);

		// Type flags
		stream.WriteByte((byte)header.TypeFlags);

		// Reserved
		stream.WriteByte(0);

		// Option flags
		WriteUInt32LE(stream, header.OptionFlags);

		// Savestate offset
		WriteUInt32LE(stream, header.SavestateOffset);

		// Controller data offset
		WriteUInt32LE(stream, header.ControllerDataOffset);

		// ROM CRC
		WriteUInt32LE(stream, header.RomCrc);

		// Minor version
		WriteUInt16LE(stream, header.MinorVersion);

		// ROM serial
		WriteUInt16LE(stream, header.RomSerial);

		// Pad to 64 bytes
		var padding = new byte[16];
		await stream.WriteAsync(padding, cancellationToken);
	}

	private static async Task<VbmRomInfo> ReadRomInfoAsync(Stream stream, CancellationToken cancellationToken) {
		// ROM title (12 bytes)
		var romNameBytes = new byte[12];
		await stream.ReadExactlyAsync(romNameBytes, cancellationToken);
		var romName = Encoding.ASCII.GetString(romNameBytes).TrimEnd('\0');

		// Skip to author (at offset 128)
		stream.Position = 128;

		// Author name (64 bytes)
		var authorBytes = new byte[64];
		await stream.ReadExactlyAsync(authorBytes, cancellationToken);
		var authorName = Encoding.UTF8.GetString(authorBytes).TrimEnd('\0');

		// Description (128 bytes)
		var descBytes = new byte[128];
		await stream.ReadExactlyAsync(descBytes, cancellationToken);
		var description = Encoding.UTF8.GetString(descBytes).TrimEnd('\0');

		return new VbmRomInfo {
			RomName = romName,
			AuthorName = authorName,
			Description = description,
		};
	}

	private static async Task WriteRomInfoAsync(Stream stream, VbmRomInfo info, CancellationToken cancellationToken) {
		// ROM title (12 bytes)
		var romNameBytes = new byte[12];
		Encoding.ASCII.GetBytes(info.RomName.AsSpan()[..Math.Min(11, info.RomName.Length)], romNameBytes);
		await stream.WriteAsync(romNameBytes, cancellationToken);

		// Game code (4 bytes)
		await stream.WriteAsync(new byte[4], cancellationToken);

		// GBA header CRC (2 bytes) + reserved (110 bytes) = 112 bytes
		var reserved = new byte[112];
		await stream.WriteAsync(reserved, cancellationToken);

		// Author (64 bytes)
		var authorBytes = new byte[64];
		Encoding.UTF8.GetBytes(info.AuthorName.AsSpan()[..Math.Min(63, info.AuthorName.Length)], authorBytes);
		await stream.WriteAsync(authorBytes, cancellationToken);

		// Description (64 bytes)
		var descBytes = new byte[64];
		Encoding.UTF8.GetBytes(info.Description.AsSpan()[..Math.Min(63, info.Description.Length)], descBytes);
		await stream.WriteAsync(descBytes, cancellationToken);
	}

	private static async Task<List<TasFrame>> ReadFramesAsync(
		Stream stream,
		VbmHeader header,
		CancellationToken cancellationToken) {
		var frames = new List<TasFrame>();

		// Determine bytes per frame based on system type
		var isGba = (header.TypeFlags & VbmTypeFlags.Gba) != 0;
		var bytesPerFrame = isGba ? 2 : 1;

		var buffer = new byte[bytesPerFrame];
		var frameNumber = 0;

		for (var i = 0; i < header.FrameCount; i++) {
			var bytesRead = await stream.ReadAsync(buffer, cancellationToken);
			if (bytesRead < bytesPerFrame) break;

			uint buttons = isGba
				? BitConverter.ToUInt16(buffer, 0)
				: buffer[0];

			frames.Add(new TasFrame {
				FrameNumber = frameNumber++,
				Inputs = [new ControllerInput {
					Port = 0,
					RawButtons = buttons,
				}],
			});
		}

		return frames;
	}

	private static async Task WriteFramesAsync(
		Stream stream,
		IReadOnlyList<TasFrame> frames,
		int bytesPerFrame,
		CancellationToken cancellationToken) {
		var buffer = new byte[bytesPerFrame];

		foreach (var frame in frames) {
			var input = frame.Inputs.FirstOrDefault();
			var buttons = input?.RawButtons ?? 0;

			if (bytesPerFrame == 2) {
				BitConverter.TryWriteBytes(buffer, (ushort)buttons);
			} else {
				buffer[0] = (byte)buttons;
			}

			await stream.WriteAsync(buffer, cancellationToken);
		}
	}

	private class VbmHeader {
		public uint MajorVersion;
		public uint Uid;
		public uint FrameCount;
		public uint RerecordCount;
		public VbmStartFlags StartFlags;
		public byte ControllerFlags;
		public VbmTypeFlags TypeFlags;
		public uint OptionFlags;
		public uint SavestateOffset;
		public uint ControllerDataOffset;
		public uint RomCrc;
		public ushort MinorVersion;
		public ushort RomSerial;
	}

	private class VbmRomInfo {
		public string RomName = "";
		public string AuthorName = "";
		public string Description = "";
	}

	[Flags]
	private enum VbmStartFlags : byte {
		FromPowerOn = 0,
		FromSavestate = 1 << 0,
		FromSram = 1 << 1,
	}

	[Flags]
	private enum VbmTypeFlags : byte {
		None = 0,
		Gba = 1 << 0,
		Gbc = 1 << 1,
		Sgb = 1 << 2,
	}
}
