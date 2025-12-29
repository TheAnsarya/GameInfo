using System.Text;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Formats.Snes;

/// <summary>
/// Snes9x SMV format reader/writer.
/// </summary>
/// <remarks>
/// SMV is the native format for Snes9x emulator.
/// Header is 32 bytes for version 1.43 and earlier, 64 bytes for 1.51+.
/// Signature: "SMV\x1A"
/// </remarks>
public class SmvFormat : TasFormatBase {
	private static readonly byte[] Signature = "SMV\x1A"u8.ToArray();

	/// <inheritdoc/>
	public override string Name => "SMV";

	/// <inheritdoc/>
	public override string Description => "Snes9x movie file";

	/// <inheritdoc/>
	public override string EmulatorName => "Snes9x";

	/// <inheritdoc/>
	public override IReadOnlyList<string> Extensions => ["smv"];

	/// <inheritdoc/>
	public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Snes];

	/// <inheritdoc/>
	public override bool CanHandle(Stream stream) {
		if (stream.Length < 4) return false;

		Span<byte> header = stackalloc byte[4];
		stream.ReadExactly(header);
		return header.SequenceEqual(Signature);
	}

	/// <inheritdoc/>
	public override async Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default) {
		// Read header
		var header = await ReadHeaderAsync(stream, cancellationToken);

		// Read controller data
		var frames = await ReadFramesAsync(stream, header, cancellationToken);

		// Read savestate if present
		byte[]? savestateData = null;
		if (header.SavestateOffset > 0 && stream.Position < stream.Length) {
			stream.Position = header.SavestateOffset;
			savestateData = new byte[stream.Length - header.SavestateOffset];
			await stream.ReadExactlyAsync(savestateData, cancellationToken);
		}

		// Build metadata
		var metadata = new TasMetadata {
			EmulatorName = "Snes9x",
			EmulatorVersion = $"1.{header.Version}",
			FormatName = "SMV",
			FormatVersion = (int)header.Version,
			FrameCount = (int)header.FrameCount,
			RerecordCount = (int)header.RerecordCount,
			Region = (header.Flags & SmvFlags.Pal) != 0 ? GameRegion.Pal : GameRegion.Ntsc,
			StartType = (header.Flags & SmvFlags.FromReset) != 0 ? MovieStartType.PowerOn :
				(header.Flags & SmvFlags.FromSram) != 0 ? MovieStartType.Sram : MovieStartType.Savestate,
			RomName = header.RomName,
			RomChecksum = header.RomCrc32.ToString("x8"),
			RomChecksumType = ChecksumType.Crc32,
		};

		// Build controller info
		var controllers = new List<ControllerInfo>();
		if ((header.ControllerFlags & 0x01) != 0) controllers.Add(new ControllerInfo { Port = 0, Type = ControllerType.Gamepad });
		if ((header.ControllerFlags & 0x02) != 0) controllers.Add(new ControllerInfo { Port = 1, Type = ControllerType.Gamepad });
		if ((header.ControllerFlags & 0x04) != 0) controllers.Add(new ControllerInfo { Port = 2, Type = ControllerType.Gamepad });
		if ((header.ControllerFlags & 0x08) != 0) controllers.Add(new ControllerInfo { Port = 3, Type = ControllerType.Gamepad });
		if ((header.ControllerFlags & 0x10) != 0) controllers.Add(new ControllerInfo { Port = 4, Type = ControllerType.Gamepad });

		return new TasMovie {
			Metadata = metadata,
			Frames = frames,
			System = GameSystem.Snes,
			Controllers = controllers,
			SavestateData = savestateData,
		};
	}

	/// <inheritdoc/>
	public override async Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default) {
		// Build header
		var header = new SmvHeader {
			Version = 4, // Write as version 1.51+ format
			Uid = (uint)DateTimeOffset.UtcNow.ToUnixTimeSeconds(),
			RerecordCount = (uint)movie.Metadata.RerecordCount,
			FrameCount = (uint)movie.Frames.Count,
			ControllerFlags = 0,
			MovieFlags = 0,
			SyncFlags = 0,
			SavestateOffset = 0,
			ControllerDataOffset = 64, // Fixed for 1.51+ header
		};

		// Set controller flags
		foreach (var controller in movie.Controllers) {
			if (controller.Port < 5) {
				header.ControllerFlags |= (byte)(1 << controller.Port);
			}
		}

		// Set movie flags
		header.Flags = SmvFlags.None;
		if (movie.Metadata.Region == GameRegion.Pal) header.Flags |= SmvFlags.Pal;
		if (movie.Metadata.StartType == MovieStartType.PowerOn) header.Flags |= SmvFlags.FromReset;
		if (movie.Metadata.StartType == MovieStartType.Sram) header.Flags |= SmvFlags.FromSram;

		// Write header
		await WriteHeaderAsync(stream, header, cancellationToken);

		// Write controller data
		await WriteFramesAsync(stream, movie.Frames, movie.Controllers.Count, cancellationToken);

		// Write savestate if present
		if (movie.SavestateData is not null) {
			// Update savestate offset in header
			var savestateOffset = stream.Position;
			await stream.WriteAsync(movie.SavestateData, cancellationToken);

			// Go back and update the offset
			stream.Position = 24;
			WriteUInt32LE(stream, (uint)savestateOffset);
			stream.Position = stream.Length;
		}
	}

	private static async Task<SmvHeader> ReadHeaderAsync(Stream stream, CancellationToken cancellationToken) {
		var header = new SmvHeader();

		// Read signature
		var sig = new byte[4];
		await stream.ReadExactlyAsync(sig, cancellationToken);
		if (!sig.AsSpan().SequenceEqual(Signature)) {
			throw new InvalidDataException("Invalid SMV signature.");
		}

		// Read version
		header.Version = ReadUInt32LE(stream);

		// Read UID (Unix timestamp)
		header.Uid = ReadUInt32LE(stream);

		// Read rerecord count
		header.RerecordCount = ReadUInt32LE(stream);

		// Read frame count
		header.FrameCount = ReadUInt32LE(stream);

		// Read controller flags
		header.ControllerFlags = (byte)stream.ReadByte();

		// Read movie flags
		header.MovieFlags = (byte)stream.ReadByte();
		header.Flags = (SmvFlags)header.MovieFlags;

		// Read sync flags
		header.SyncFlags = (byte)stream.ReadByte();

		// Reserved byte
		stream.ReadByte();

		// Read savestate offset
		header.SavestateOffset = ReadUInt32LE(stream);

		// Read controller data offset
		header.ControllerDataOffset = ReadUInt32LE(stream);

		// Version 1.51+ has extended header
		if (header.Version >= 4) {
			// Additional fields in 64-byte header
			// Skip to controller data for now
			stream.Position = header.ControllerDataOffset;
		}

		return header;
	}

	private static async Task WriteHeaderAsync(Stream stream, SmvHeader header, CancellationToken cancellationToken) {
		// Write signature
		await stream.WriteAsync(Signature, cancellationToken);

		// Write version
		WriteUInt32LE(stream, header.Version);

		// Write UID
		WriteUInt32LE(stream, header.Uid);

		// Write rerecord count
		WriteUInt32LE(stream, header.RerecordCount);

		// Write frame count
		WriteUInt32LE(stream, header.FrameCount);

		// Write controller flags
		stream.WriteByte(header.ControllerFlags);

		// Write movie flags
		stream.WriteByte((byte)header.Flags);

		// Write sync flags
		stream.WriteByte(header.SyncFlags);

		// Reserved byte
		stream.WriteByte(0);

		// Write savestate offset (will be updated later if needed)
		WriteUInt32LE(stream, header.SavestateOffset);

		// Write controller data offset
		WriteUInt32LE(stream, header.ControllerDataOffset);

		// Pad to 64 bytes for version 1.51+ header
		var padding = new byte[64 - 32];
		await stream.WriteAsync(padding, cancellationToken);
	}

	private static async Task<List<TasFrame>> ReadFramesAsync(
		Stream stream,
		SmvHeader header,
		CancellationToken cancellationToken) {
		var frames = new List<TasFrame>();

		// Count active controllers
		var controllerCount = CountBits(header.ControllerFlags);
		if (controllerCount == 0) {
			return frames; // No controllers enabled
		}

		var bytesPerFrame = controllerCount * 2; // 2 bytes per controller

		// Calculate number of frames from remaining data
		var dataLength = header.SavestateOffset > 0
			? header.SavestateOffset - header.ControllerDataOffset
			: stream.Length - header.ControllerDataOffset;

		// Sanity check - avoid infinite loops on malformed data
		if (header.ControllerDataOffset > stream.Length) {
			return frames;
		}

		stream.Position = header.ControllerDataOffset;

		var buffer = new byte[bytesPerFrame];
		var frameNumber = 0;

		while (stream.Position < stream.Length &&
			(header.SavestateOffset == 0 || stream.Position < header.SavestateOffset)) {
			var bytesRead = await stream.ReadAsync(buffer, cancellationToken);
			if (bytesRead < bytesPerFrame) break;

			var inputs = new List<ControllerInput>();
			var activePort = 0;

			for (var i = 0; i < 5; i++) {
				if ((header.ControllerFlags & (1 << i)) == 0) continue;

				var buttons = BitConverter.ToUInt16(buffer, activePort * 2);
				inputs.Add(new ControllerInput {
					Port = i,
					RawButtons = buttons,
				});
				activePort++;
			}

			frames.Add(new TasFrame {
				FrameNumber = frameNumber++,
				Inputs = inputs,
			});
		}

		return frames;
	}

	private static async Task WriteFramesAsync(
		Stream stream,
		IReadOnlyList<TasFrame> frames,
		int controllerCount,
		CancellationToken cancellationToken) {
		var buffer = new byte[controllerCount * 2];

		foreach (var frame in frames) {
			var offset = 0;
			foreach (var input in frame.Inputs) {
				BitConverter.TryWriteBytes(buffer.AsSpan(offset), (ushort)input.RawButtons);
				offset += 2;
			}
			await stream.WriteAsync(buffer, cancellationToken);
		}
	}

	private static int CountBits(byte value) {
		var count = 0;
		while (value != 0) {
			count += value & 1;
			value >>= 1;
		}
		return count;
	}

	private class SmvHeader {
		public uint Version;
		public uint Uid;
		public uint RerecordCount;
		public uint FrameCount;
		public byte ControllerFlags;
		public byte MovieFlags;
		public byte SyncFlags;
		public uint SavestateOffset;
		public uint ControllerDataOffset;
		public SmvFlags Flags;
		public string? RomName;
		public uint RomCrc32;
	}

	[Flags]
	private enum SmvFlags : byte {
		None = 0,
		FromReset = 1 << 0,
		Pal = 1 << 1,
		FromSram = 1 << 2,
	}
}
