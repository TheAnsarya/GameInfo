#!/usr/bin/env python3
"""
Soul Blazer (SNES) Memory Scanner
Scans ROM for memory access patterns and data references.
"""

import json
import struct
import re
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum, auto
from collections import defaultdict


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
DATA_DIR = ASSETS_DIR / "data"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class AddressMode(IntEnum):
	"""65816 addressing modes."""
	IMMEDIATE_8 = auto()
	IMMEDIATE_16 = auto()
	ABSOLUTE = auto()
	ABSOLUTE_LONG = auto()
	DIRECT_PAGE = auto()
	DIRECT_PAGE_INDIRECT = auto()
	DIRECT_PAGE_INDIRECT_LONG = auto()
	ABSOLUTE_INDEXED_X = auto()
	ABSOLUTE_INDEXED_Y = auto()
	DIRECT_PAGE_INDEXED_X = auto()
	STACK_RELATIVE = auto()


class MemoryRegion(IntEnum):
	"""SNES memory regions."""
	WRAM = 0           # $7E0000-$7FFFFF (128KB)
	SRAM = 1           # $70:0000-$7D:FFFF (varies)
	HARDWARE = 2       # $2100-$21FF, $4200-$44FF
	ROM = 3            # Bank $00-$3F, $80-$FF


@dataclass
class MemoryAccess:
	"""Single memory access found in code."""
	rom_offset: int
	address: int
	mode: AddressMode
	is_read: bool
	is_write: bool
	opcode: int
	instruction: str
	bank: int
	context: str = ""


@dataclass
class MemoryPattern:
	"""Pattern of memory accesses to a location."""
	address: int
	region: MemoryRegion
	accesses: list[MemoryAccess] = field(default_factory=list)
	read_count: int = 0
	write_count: int = 0
	name: str = ""
	purpose: str = ""


class MemoryScanner:
	"""Scan ROM for memory access patterns."""

	# Known RAM addresses
	KNOWN_RAM = {
		0x0000: ("game_mode", "Current game mode"),
		0x0010: ("frame_counter", "Frame counter"),
		0x0012: ("rng_seed", "Random number seed"),
		0x0014: ("controller_1", "Controller 1 state"),
		0x0016: ("controller_2", "Controller 2 state"),
		0x0018: ("controller_1_new", "Controller 1 new presses"),
		0x001A: ("controller_2_new", "Controller 2 new presses"),
		0x0020: ("player_x", "Player X position (low)"),
		0x0022: ("player_x_high", "Player X position (high)"),
		0x0024: ("player_y", "Player Y position (low)"),
		0x0026: ("player_y_high", "Player Y position (high)"),
		0x0028: ("player_direction", "Player facing direction"),
		0x002A: ("player_state", "Player state/action"),
		0x002C: ("player_hp", "Current HP"),
		0x002E: ("player_max_hp", "Maximum HP"),
		0x0030: ("player_str", "Strength stat"),
		0x0032: ("player_def", "Defense stat"),
		0x0034: ("player_level", "Current level"),
		0x0036: ("player_exp", "Experience points (low)"),
		0x0038: ("player_exp_high", "Experience points (high)"),
		0x003A: ("gems_low", "GEMs (low byte)"),
		0x003C: ("gems_high", "GEMs (high byte)"),
		0x0040: ("current_sword", "Equipped sword ID"),
		0x0042: ("current_armor", "Equipped armor ID"),
		0x0044: ("current_magic", "Equipped magic ID"),
		0x0046: ("magic_uses", "Magic uses remaining"),
		0x0050: ("area_id", "Current area ID"),
		0x0052: ("map_id", "Current map ID"),
		0x0054: ("screen_x", "Screen X scroll"),
		0x0056: ("screen_y", "Screen Y scroll"),
		0x0060: ("npc_count", "Number of active NPCs"),
		0x0062: ("enemy_count", "Number of active enemies"),
		0x0070: ("menu_state", "Menu/UI state"),
		0x0080: ("sound_command", "Sound command buffer"),
		0x0082: ("music_track", "Current music track"),
		0x0100: ("entity_table", "Entity table start (32 entries × 32 bytes)"),
		0x0500: ("projectile_table", "Projectile table start"),
		0x0600: ("particle_table", "Particle effect table"),
		0x0700: ("oam_buffer", "OAM shadow buffer"),
		0x1000: ("dialogue_buffer", "Dialogue text buffer"),
		0x1800: ("lair_flags", "Soul Lair cleared flags"),
		0x1840: ("soul_flags", "Soul released flags"),
		0x1880: ("item_flags", "Item obtained flags"),
		0x18A0: ("event_flags", "Event/progress flags"),
		0x1900: ("boss_flags", "Boss defeated flags"),
		0x1910: ("emblem_flags", "Emblem obtained flags"),
	}

	# 65816 opcodes that access memory
	MEMORY_OPCODES = {
		# Load opcodes (read)
		0xA5: ("LDA dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xA9: ("LDA #imm", AddressMode.IMMEDIATE_8, False, False, 2),
		0xAD: ("LDA abs", AddressMode.ABSOLUTE, True, False, 3),
		0xAF: ("LDA long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0xB5: ("LDA dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0xBD: ("LDA abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0xB9: ("LDA abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),
		0xA1: ("LDA (dp,X)", AddressMode.DIRECT_PAGE_INDIRECT, True, False, 2),
		0xB1: ("LDA (dp),Y", AddressMode.DIRECT_PAGE_INDIRECT, True, False, 2),
		0xA7: ("LDA [dp]", AddressMode.DIRECT_PAGE_INDIRECT_LONG, True, False, 2),
		0xB7: ("LDA [dp],Y", AddressMode.DIRECT_PAGE_INDIRECT_LONG, True, False, 2),

		0xA6: ("LDX dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xAE: ("LDX abs", AddressMode.ABSOLUTE, True, False, 3),
		0xA2: ("LDX #imm", AddressMode.IMMEDIATE_8, False, False, 2),
		0xB6: ("LDX dp,Y", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0xBE: ("LDX abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		0xA4: ("LDY dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xAC: ("LDY abs", AddressMode.ABSOLUTE, True, False, 3),
		0xA0: ("LDY #imm", AddressMode.IMMEDIATE_8, False, False, 2),
		0xB4: ("LDY dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0xBC: ("LDY abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),

		# Store opcodes (write)
		0x85: ("STA dp", AddressMode.DIRECT_PAGE, False, True, 2),
		0x8D: ("STA abs", AddressMode.ABSOLUTE, False, True, 3),
		0x8F: ("STA long", AddressMode.ABSOLUTE_LONG, False, True, 4),
		0x95: ("STA dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, False, True, 2),
		0x9D: ("STA abs,X", AddressMode.ABSOLUTE_INDEXED_X, False, True, 3),
		0x99: ("STA abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, False, True, 3),
		0x81: ("STA (dp,X)", AddressMode.DIRECT_PAGE_INDIRECT, False, True, 2),
		0x91: ("STA (dp),Y", AddressMode.DIRECT_PAGE_INDIRECT, False, True, 2),
		0x87: ("STA [dp]", AddressMode.DIRECT_PAGE_INDIRECT_LONG, False, True, 2),
		0x97: ("STA [dp],Y", AddressMode.DIRECT_PAGE_INDIRECT_LONG, False, True, 2),

		0x86: ("STX dp", AddressMode.DIRECT_PAGE, False, True, 2),
		0x8E: ("STX abs", AddressMode.ABSOLUTE, False, True, 3),
		0x96: ("STX dp,Y", AddressMode.DIRECT_PAGE_INDEXED_X, False, True, 2),

		0x84: ("STY dp", AddressMode.DIRECT_PAGE, False, True, 2),
		0x8C: ("STY abs", AddressMode.ABSOLUTE, False, True, 3),
		0x94: ("STY dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, False, True, 2),

		0x64: ("STZ dp", AddressMode.DIRECT_PAGE, False, True, 2),
		0x9C: ("STZ abs", AddressMode.ABSOLUTE, False, True, 3),
		0x74: ("STZ dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, False, True, 2),
		0x9E: ("STZ abs,X", AddressMode.ABSOLUTE_INDEXED_X, False, True, 3),

		# Read-modify-write
		0x06: ("ASL dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x0E: ("ASL abs", AddressMode.ABSOLUTE, True, True, 3),
		0x16: ("ASL dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0x1E: ("ASL abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		0x46: ("LSR dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x4E: ("LSR abs", AddressMode.ABSOLUTE, True, True, 3),
		0x56: ("LSR dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0x5E: ("LSR abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		0x26: ("ROL dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x2E: ("ROL abs", AddressMode.ABSOLUTE, True, True, 3),
		0x36: ("ROL dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0x3E: ("ROL abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		0x66: ("ROR dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x6E: ("ROR abs", AddressMode.ABSOLUTE, True, True, 3),
		0x76: ("ROR dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0x7E: ("ROR abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		0xC6: ("DEC dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0xCE: ("DEC abs", AddressMode.ABSOLUTE, True, True, 3),
		0xD6: ("DEC dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0xDE: ("DEC abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		0xE6: ("INC dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0xEE: ("INC abs", AddressMode.ABSOLUTE, True, True, 3),
		0xF6: ("INC dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, True, 2),
		0xFE: ("INC abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, True, 3),

		# Compare (read only)
		0xC5: ("CMP dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xCD: ("CMP abs", AddressMode.ABSOLUTE, True, False, 3),
		0xCF: ("CMP long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0xD5: ("CMP dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0xDD: ("CMP abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0xD9: ("CMP abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		0xE4: ("CPX dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xEC: ("CPX abs", AddressMode.ABSOLUTE, True, False, 3),

		0xC4: ("CPY dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xCC: ("CPY abs", AddressMode.ABSOLUTE, True, False, 3),

		# Bit test (read only)
		0x24: ("BIT dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0x2C: ("BIT abs", AddressMode.ABSOLUTE, True, False, 3),
		0x34: ("BIT dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0x3C: ("BIT abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),

		# Arithmetic (read for source)
		0x65: ("ADC dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0x6D: ("ADC abs", AddressMode.ABSOLUTE, True, False, 3),
		0x6F: ("ADC long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0x75: ("ADC dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0x7D: ("ADC abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0x79: ("ADC abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		0xE5: ("SBC dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0xED: ("SBC abs", AddressMode.ABSOLUTE, True, False, 3),
		0xEF: ("SBC long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0xF5: ("SBC dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0xFD: ("SBC abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0xF9: ("SBC abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		# Logic (read for source)
		0x25: ("AND dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0x2D: ("AND abs", AddressMode.ABSOLUTE, True, False, 3),
		0x2F: ("AND long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0x35: ("AND dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0x3D: ("AND abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0x39: ("AND abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		0x05: ("ORA dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0x0D: ("ORA abs", AddressMode.ABSOLUTE, True, False, 3),
		0x0F: ("ORA long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0x15: ("ORA dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0x1D: ("ORA abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0x19: ("ORA abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		0x45: ("EOR dp", AddressMode.DIRECT_PAGE, True, False, 2),
		0x4D: ("EOR abs", AddressMode.ABSOLUTE, True, False, 3),
		0x4F: ("EOR long", AddressMode.ABSOLUTE_LONG, True, False, 4),
		0x55: ("EOR dp,X", AddressMode.DIRECT_PAGE_INDEXED_X, True, False, 2),
		0x5D: ("EOR abs,X", AddressMode.ABSOLUTE_INDEXED_X, True, False, 3),
		0x59: ("EOR abs,Y", AddressMode.ABSOLUTE_INDEXED_Y, True, False, 3),

		# Test and set/reset (read-modify-write)
		0x04: ("TSB dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x0C: ("TSB abs", AddressMode.ABSOLUTE, True, True, 3),
		0x14: ("TRB dp", AddressMode.DIRECT_PAGE, True, True, 2),
		0x1C: ("TRB abs", AddressMode.ABSOLUTE, True, True, 3),
	}

	def __init__(self, rom_path: str = None):
		"""Initialize scanner."""
		self.rom_data: Optional[bytes] = None
		self.patterns: dict[int, MemoryPattern] = {}
		self.accesses: list[MemoryAccess] = []

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def get_region(self, address: int) -> MemoryRegion:
		"""Determine memory region for an address."""
		bank = (address >> 16) & 0xFF
		offset = address & 0xFFFF

		# WRAM
		if bank == 0x7E or bank == 0x7F:
			return MemoryRegion.WRAM
		# WRAM mirror in bank 0
		if bank == 0x00 and offset < 0x2000:
			return MemoryRegion.WRAM
		# Hardware registers
		if bank == 0x00 and 0x2100 <= offset <= 0x21FF:
			return MemoryRegion.HARDWARE
		if bank == 0x00 and 0x4200 <= offset <= 0x44FF:
			return MemoryRegion.HARDWARE
		# SRAM
		if 0x70 <= bank <= 0x7D:
			return MemoryRegion.SRAM
		# ROM
		return MemoryRegion.ROM

	def scan_bank(self, bank: int) -> list[MemoryAccess]:
		"""Scan a single bank for memory accesses."""
		if not self.rom_data:
			return []

		accesses = []
		bank_start = bank * 0x8000
		bank_end = bank_start + 0x8000

		if bank_end > len(self.rom_data):
			return accesses

		offset = bank_start
		while offset < bank_end:
			opcode = self.rom_data[offset]

			if opcode in self.MEMORY_OPCODES:
				instr, mode, is_read, is_write, length = self.MEMORY_OPCODES[opcode]

				# Extract address operand
				address = 0
				if length >= 2 and offset + 1 < len(self.rom_data):
					address = self.rom_data[offset + 1]
				if length >= 3 and offset + 2 < len(self.rom_data):
					address |= (self.rom_data[offset + 2] << 8)
				if length >= 4 and offset + 3 < len(self.rom_data):
					address |= (self.rom_data[offset + 3] << 16)

				# Skip immediate mode (not memory access)
				if mode not in (AddressMode.IMMEDIATE_8, AddressMode.IMMEDIATE_16):
					# Resolve direct page to full address
					if mode in (AddressMode.DIRECT_PAGE, AddressMode.DIRECT_PAGE_INDEXED_X):
						# Assume direct page register = 0 for this analysis
						address = address & 0xFF

					access = MemoryAccess(
						rom_offset=offset,
						address=address,
						mode=mode,
						is_read=is_read,
						is_write=is_write,
						opcode=opcode,
						instruction=instr,
						bank=bank
					)
					accesses.append(access)

				offset += length
			else:
				offset += 1

		return accesses

	def scan_all_banks(self, start_bank: int = 0, end_bank: int = 0x20) -> None:
		"""Scan all banks for memory accesses."""
		self.accesses.clear()
		self.patterns.clear()

		for bank in range(start_bank, end_bank):
			bank_accesses = self.scan_bank(bank)
			self.accesses.extend(bank_accesses)

		# Group by address
		for access in self.accesses:
			addr = access.address
			if addr not in self.patterns:
				self.patterns[addr] = MemoryPattern(
					address=addr,
					region=self.get_region(addr)
				)
				# Check if known
				if addr in self.KNOWN_RAM:
					name, purpose = self.KNOWN_RAM[addr]
					self.patterns[addr].name = name
					self.patterns[addr].purpose = purpose

			self.patterns[addr].accesses.append(access)
			if access.is_read:
				self.patterns[addr].read_count += 1
			if access.is_write:
				self.patterns[addr].write_count += 1

	def get_hot_addresses(self, min_accesses: int = 10) -> list[MemoryPattern]:
		"""Get frequently accessed addresses."""
		hot = []
		for addr, pattern in self.patterns.items():
			total = pattern.read_count + pattern.write_count
			if total >= min_accesses:
				hot.append(pattern)

		return sorted(hot, key=lambda p: p.read_count + p.write_count, reverse=True)

	def get_wram_accesses(self) -> list[MemoryPattern]:
		"""Get all WRAM access patterns."""
		return [p for p in self.patterns.values() if p.region == MemoryRegion.WRAM]

	def get_hardware_accesses(self) -> list[MemoryPattern]:
		"""Get all hardware register access patterns."""
		return [p for p in self.patterns.values() if p.region == MemoryRegion.HARDWARE]

	def export_to_json(self, output_path: Path) -> None:
		"""Export scan results to JSON."""
		data = {
			"total_accesses": len(self.accesses),
			"unique_addresses": len(self.patterns),
			"known_addresses": len(self.KNOWN_RAM),
			"patterns": [
				{
					"address": f"${p.address:04X}",
					"region": p.region.name,
					"name": p.name,
					"purpose": p.purpose,
					"read_count": p.read_count,
					"write_count": p.write_count,
					"total_accesses": p.read_count + p.write_count,
				}
				for p in sorted(self.patterns.values(),
								key=lambda x: x.read_count + x.write_count,
								reverse=True)[:100]  # Top 100
			],
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')

	def generate_wikitext(self) -> str:
		"""Generate wikitext documentation."""
		lines = [
			"== Memory Access Analysis ==",
			"",
			"This page documents memory access patterns found in the ROM.",
			"",
			f"* Total memory accesses: {len(self.accesses)}",
			f"* Unique addresses: {len(self.patterns)}",
			f"* Known RAM addresses: {len(self.KNOWN_RAM)}",
			"",
			"=== Hot Addresses (Most Accessed) ===",
			"",
			"{| class=\"wikitable sortable\"",
			"! Address !! Name !! Reads !! Writes !! Total !! Purpose",
		]

		for pattern in self.get_hot_addresses(20)[:30]:
			lines.append("|-")
			total = pattern.read_count + pattern.write_count
			lines.append(f"| ${{{{hex|{pattern.address:04X}}}}} || {pattern.name or '?'} || "
						f"{pattern.read_count} || {pattern.write_count} || {total} || "
						f"{pattern.purpose or 'Unknown'}")

		lines.append("|}")
		lines.append("")

		# Known RAM section
		lines.append("=== Known RAM Addresses ===")
		lines.append("")
		lines.append("{| class=\"wikitable\"")
		lines.append("! Address !! Name !! Purpose")

		for addr, (name, purpose) in sorted(self.KNOWN_RAM.items()):
			lines.append("|-")
			lines.append(f"| ${{{{hex|{addr:04X}}}}} || {name} || {purpose}")

		lines.append("|}")

		return "\n".join(lines)

	def print_summary(self) -> None:
		"""Print scan summary."""
		print("=" * 60)
		print("SOUL BLAZER MEMORY SCANNER")
		print("=" * 60)

		print(f"\nTotal memory accesses: {len(self.accesses)}")
		print(f"Unique addresses: {len(self.patterns)}")

		print("\n--- Access by Region ---")
		region_counts = defaultdict(int)
		for pattern in self.patterns.values():
			region_counts[pattern.region.name] += 1
		for region, count in sorted(region_counts.items()):
			print(f"  {region}: {count}")

		print("\n--- Hot Addresses (Top 20) ---")
		for pattern in self.get_hot_addresses(10)[:20]:
			total = pattern.read_count + pattern.write_count
			name = pattern.name or "?"
			print(f"  ${pattern.address:04X}: {name:20} R:{pattern.read_count:4} W:{pattern.write_count:4} T:{total:4}")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Memory Scanner")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(DATA_DIR))
	parser.add_argument("--wikitext", "-w", action="store_true", help="Generate wikitext output")
	parser.add_argument("--bank", "-b", type=int, help="Scan specific bank only")

	args = parser.parse_args()

	scanner = MemoryScanner(args.rom)

	if not scanner.rom_data:
		print("Error: Could not load ROM")
		return

	if args.bank is not None:
		print(f"Scanning bank ${args.bank:02X}...")
		accesses = scanner.scan_bank(args.bank)
		print(f"Found {len(accesses)} memory accesses")
		for a in accesses[:50]:
			print(f"  ${a.rom_offset:06X}: {a.instruction:12} ${a.address:04X}")
	else:
		print("Scanning all banks...")
		scanner.scan_all_banks()

		if args.wikitext:
			print(scanner.generate_wikitext())
		else:
			scanner.print_summary()

			output_dir = Path(args.output)
			scanner.export_to_json(output_dir / "memory_scan.json")
			print(f"\nExported to: {output_dir}")


if __name__ == "__main__":
	main()
