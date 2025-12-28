using System.Collections.Generic;

namespace DQ3SFC.Extensions;

static class PrimitiveExtensions {
	// bits to bools
	public static Queue<bool> ToBooleanQueue(this byte value) {
		return [
			(value & 0b0000_0001) != 0,
			(value & 0b0000_0010) != 0,
			(value & 0b0000_0100) != 0,
			(value & 0b0000_1000) != 0,
			(value & 0b0001_0000) != 0,
			(value & 0b0010_0000) != 0,
			(value & 0b0100_0000) != 0,
			(value & 0b1000_0000) != 0,
		];
	}
}

