namespace DQ3Lib.Text.Font.ScriptFont;

/*
	gggggggg wwwwgggg aaaaaaaa aaaaaaaa 00hhhh00

	g: group size, 12 bits
	w: width, 4 bits, add 1 so value is 1 to 16
	a: offset address, 16 bits (combines with bank to create pointer to data)
	h: height, 4 bits, add 1 so value is 1 to 16
*/
internal class Group {
	public int Size { get; set; }

	public int Width { get; set; }

	public int Height { get; set; }

	public int Offset { get; set; }

	// data should be 5 bytes
	public Group(Span<byte> data) {
		if (data.Length != 5) {
			throw new ArgumentException("Data length must be 5 bytes.");
		}

		Size = data[0] | ((data[1] & 0x0f) << 8);
		Width = ((data[1] & 0xf0) >> 4) + 1;
		Height = ((data[4] & 0x3c) >> 2) + 1;
		Offset = data[2] | (data[3] << 8);
	}

	// data should be 5 bytes
	public void WriteGroup(Span<byte> data) {
		if (data.Length != 5) {
			throw new ArgumentException("Data length must be 5 bytes.", nameof(data));
		}

		if (Size > 0xfff) {
			throw new ArgumentOutOfRangeException(nameof(Size), "Size must be less than 0x1000.");
		}

		if (Width > 0x10) {
			throw new ArgumentOutOfRangeException(nameof(Width), "Width must be less than 0x11.");
		}

		if (Height > 0x10) {
			throw new ArgumentOutOfRangeException(nameof(Height), "Height must be less than 0x11.");
		}

		if (Offset > 0xffff) {
			throw new ArgumentOutOfRangeException(nameof(Offset), "Offset must be less than 0x10000.");
		}

		data[0] = (byte)(Size & 0xff);
		data[1] = (byte)(((Size >> 8) & 0x0f) | ((Width - 1) << 4));
		data[2] = (byte)(Offset & 0xff);
		data[3] = (byte)((Offset >> 8) & 0xff);
		data[4] = (byte)((Height - 1) << 2);
	}

	public byte[] ToByteArray() {
		var data = new byte[5];
		WriteGroup(data);
		return data;
	}
}
