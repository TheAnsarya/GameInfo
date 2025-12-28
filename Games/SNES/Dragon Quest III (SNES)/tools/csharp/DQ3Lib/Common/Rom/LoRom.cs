namespace DQ3Lib.Common.Rom;

// LoRom is a class that represents the LoROM memory mapping scheme used in SNES cartridges.
public class LoRom : Rom {
	public override PCAddress ToPCAddress(int address) {
		if ((0x00ffff & address) < 0x8000) {
			throw new ArgumentException($"lower word of {nameof(address)} must be at least 0x8000");
		}

		var pc = (((0xff0000 & address) >> 16) * 0x8000) + ((0x00ffff & address) - 0x8000);
		return new PCAddress(pc);
	}

	public override PCAddress ToPCAddress(SNESAddress address) => ToPCAddress(address.Address);

	public override SNESAddress ToSNESAddress(int address) {
		var snes = (address / 0x8000 * 0x10000) + (address % 0x8000) + 0x8000;
		return new SNESAddress(snes);
	}

	public override SNESAddress ToSNESAddress(PCAddress address) => ToSNESAddress(address.Address);
}
