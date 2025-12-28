using DQ3Lib.Common.SNES.Graphics;
using DQ3Lib.Streams;

namespace DQ3Lib.Maps.Overworld;

public class MetaTileDefinition {
	public BGMapEntry TopLeft { get; set; }

	public BGMapEntry TopRight { get; set; }

	public BGMapEntry BottomLeft { get; set; }

	public BGMapEntry BottomRight { get; set; }

	public MetaTileDefinition(ByteArrayStream source) {
		ArgumentNullException.ThrowIfNull(source, nameof(source));

		TopLeft = new BGMapEntry(source.Word());
		TopRight = new BGMapEntry(source.Word());
		BottomLeft = new BGMapEntry(source.Word());
		BottomRight = new BGMapEntry(source.Word());
	}
}
