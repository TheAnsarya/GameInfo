namespace DQ3Lib.Common.Rom;

// HiRom is a class that represents the HiROM memory mapping scheme used in SNES cartridges.
public class HiRom : Rom {
	public const int AddressOffset = 0xc00000;

	public override PCAddress ToPCAddress(int address) => new(address - AddressOffset);

	public override PCAddress ToPCAddress(SNESAddress address) => new(address.Address - AddressOffset);

	public override SNESAddress ToSNESAddress(int address) => new(address + AddressOffset);

	public override SNESAddress ToSNESAddress(PCAddress address) => new(address.Address + AddressOffset);
}
