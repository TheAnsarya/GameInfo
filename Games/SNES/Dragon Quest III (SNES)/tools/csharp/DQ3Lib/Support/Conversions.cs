using DQ3Lib.Extensions;

namespace DQ3Lib.Support;

internal class Conversions {
	// Large binary strings are the target of this function.
	// <binaryString> is a string of 0s and 1s.
	// TODO: Endian and order checking of bits so conversion is correct.
	public static byte[] BinaryStringToByteArray(string binaryString) {
		binaryString.ThrowIfNullOrEmpty(nameof(binaryString));

		if (binaryString.Length == 0) {
			return [];
		}

		// +7, /8 is a simple way to round up
		int length = (binaryString.Length + 7) / 8;
		byte[] data = new byte[length];
		string byteString;

		for (int i = 0; i < length; i++) {
			if (i == length - 1) {
				// If this is the last byte, we need to adjust the length
				// to account for the ending bits.
				var remainingBits = binaryString.Length - (8 * i);
				// TODO: Pad Left? Make Unit tests
				byteString = binaryString.Substring(8 * i, remainingBits).PadLeft(remainingBits, '0');
			} else {
				byteString = binaryString.Substring(8 * i, 8);
			}

			// TODO: reverse byteString?
			data[i] = Convert.ToByte(byteString, 2);
		}

		return data;
	}
}
