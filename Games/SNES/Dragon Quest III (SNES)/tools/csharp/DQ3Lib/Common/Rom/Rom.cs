using DQ3Lib.Streams;

namespace DQ3Lib.Common.Rom;

public abstract class Rom {
	// You can pull all the spans you want from here, so for now I'll not add methods
	public required byte[] Data { get; init; }

	public Rom() { }

	public Rom(string fileName) => Data = File.ReadAllBytes(fileName);

	public Rom(byte[] data) => Data = data;

	public ByteArrayStream GetStream(PCAddress address) => new(Data, address.Address);

	public ByteArrayStream GetStream(SNESAddress address) => new(Data, ToPCAddress(address).Address);

	// Abstracted address conversion methods
	abstract public PCAddress ToPCAddress(int address);

	abstract public PCAddress ToPCAddress(SNESAddress address);

	abstract public SNESAddress ToSNESAddress(int address);

	abstract public SNESAddress ToSNESAddress(PCAddress address);
}
