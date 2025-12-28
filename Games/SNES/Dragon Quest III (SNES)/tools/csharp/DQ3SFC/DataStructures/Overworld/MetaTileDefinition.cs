using DQ3SFC.DataStructures.SNES.Graphics;
using System;

namespace DQ3SFC.DataStructures.Overworld;

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

