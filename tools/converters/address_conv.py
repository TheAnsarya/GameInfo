#!/usr/bin/env python3
"""
Address Converter - Convert between different address formats

Supports:
- CPU to ROM address conversion
- Bank/offset calculations
- Various mapper address schemes
- SNES LoROM/HiROM addressing
"""

import argparse
import sys
from typing import Dict, Optional, Tuple


class AddressConverter:
	"""Convert between different address formats."""

	# NES Mapper info
	NES_MAPPERS = {
		0: {"name": "NROM", "prg_banks": 2, "bank_size": 0x4000},
		1: {"name": "MMC1", "prg_banks": 16, "bank_size": 0x4000},
		2: {"name": "UxROM", "prg_banks": 16, "bank_size": 0x4000},
		3: {"name": "CNROM", "prg_banks": 2, "bank_size": 0x4000},
		4: {"name": "MMC3", "prg_banks": 64, "bank_size": 0x2000},
		7: {"name": "AxROM", "prg_banks": 8, "bank_size": 0x8000},
		9: {"name": "MMC2", "prg_banks": 16, "bank_size": 0x2000},
		10: {"name": "MMC4", "prg_banks": 16, "bank_size": 0x4000},
		11: {"name": "Color Dreams", "prg_banks": 4, "bank_size": 0x8000},
		66: {"name": "GNROM", "prg_banks": 4, "bank_size": 0x8000},
		69: {"name": "FME-7", "prg_banks": 32, "bank_size": 0x2000},
		71: {"name": "Camerica", "prg_banks": 16, "bank_size": 0x4000},
	}

	def __init__(
		self,
		platform: str = "nes",
		mapper: int = 0,
		header_size: int = 16,
		prg_size: int = 0,
	):
		self.platform = platform.lower()
		self.mapper = mapper
		self.header_size = header_size
		self.prg_size = prg_size

		# Get mapper info
		if self.platform == "nes" and mapper in self.NES_MAPPERS:
			self.mapper_info = self.NES_MAPPERS[mapper]
		else:
			self.mapper_info = {"name": "Unknown", "prg_banks": 1, "bank_size": 0x4000}

	def cpu_to_rom(self, cpu_address: int, bank: int = 0) -> int:
		"""Convert CPU address to ROM file offset."""
		if self.platform == "nes":
			return self._nes_cpu_to_rom(cpu_address, bank)
		elif self.platform == "snes":
			return self._snes_cpu_to_rom(cpu_address, bank)
		elif self.platform == "gb":
			return self._gb_cpu_to_rom(cpu_address, bank)
		else:
			return cpu_address

	def rom_to_cpu(self, rom_offset: int) -> Tuple[int, int]:
		"""Convert ROM file offset to CPU address and bank."""
		if self.platform == "nes":
			return self._nes_rom_to_cpu(rom_offset)
		elif self.platform == "snes":
			return self._snes_rom_to_cpu(rom_offset)
		elif self.platform == "gb":
			return self._gb_rom_to_cpu(rom_offset)
		else:
			return rom_offset, 0

	def _nes_cpu_to_rom(self, cpu_address: int, bank: int) -> int:
		"""NES CPU address to ROM offset."""
		bank_size = self.mapper_info["bank_size"]

		# Check if in fixed bank (usually last bank at $C000-$FFFF)
		if cpu_address >= 0xC000 and bank_size == 0x4000:
			# Last bank is usually fixed
			if self.prg_size > 0:
				last_bank = (self.prg_size // bank_size) - 1
				offset = (last_bank * bank_size) + (cpu_address - 0xC000)
			else:
				offset = cpu_address - 0x8000
		elif cpu_address >= 0x8000:
			# Banked area
			offset = (bank * bank_size) + (cpu_address - 0x8000)
		else:
			# Below PRG area
			return -1

		return self.header_size + offset

	def _nes_rom_to_cpu(self, rom_offset: int) -> Tuple[int, int]:
		"""NES ROM offset to CPU address and bank."""
		if rom_offset < self.header_size:
			return -1, -1

		prg_offset = rom_offset - self.header_size
		bank_size = self.mapper_info["bank_size"]

		bank = prg_offset // bank_size
		offset_in_bank = prg_offset % bank_size

		# Calculate CPU address
		if bank_size == 0x8000:
			cpu_address = 0x8000 + offset_in_bank
		elif bank_size == 0x4000:
			cpu_address = 0x8000 + offset_in_bank
		elif bank_size == 0x2000:
			# 8KB banks - more complex mapping
			window = bank % 4
			cpu_address = 0x8000 + (window * 0x2000) + offset_in_bank

		return cpu_address, bank

	def _snes_cpu_to_rom(self, cpu_address: int, bank: int) -> int:
		"""SNES CPU address to ROM offset (LoROM default)."""
		# LoROM mapping
		if bank < 0x80:
			if cpu_address >= 0x8000:
				offset = (bank * 0x8000) + (cpu_address - 0x8000)
			else:
				return -1
		else:
			# Mirror
			offset = ((bank - 0x80) * 0x8000) + (cpu_address - 0x8000)

		return self.header_size + offset

	def _snes_rom_to_cpu(self, rom_offset: int) -> Tuple[int, int]:
		"""SNES ROM offset to CPU address and bank (LoROM)."""
		if rom_offset < self.header_size:
			return -1, -1

		offset = rom_offset - self.header_size
		bank = offset // 0x8000
		cpu_address = 0x8000 + (offset % 0x8000)

		return cpu_address, bank

	def _gb_cpu_to_rom(self, cpu_address: int, bank: int) -> int:
		"""Game Boy CPU address to ROM offset."""
		if cpu_address < 0x4000:
			# Bank 0 (fixed)
			return cpu_address
		elif cpu_address < 0x8000:
			# Banked ROM
			return (bank * 0x4000) + (cpu_address - 0x4000)
		else:
			return -1

	def _gb_rom_to_cpu(self, rom_offset: int) -> Tuple[int, int]:
		"""Game Boy ROM offset to CPU address and bank."""
		if rom_offset < 0x4000:
			return rom_offset, 0
		else:
			bank = rom_offset // 0x4000
			cpu_address = 0x4000 + (rom_offset % 0x4000)
			return cpu_address, bank

	def pointer_to_address(
		self,
		low: int,
		high: int,
		bank: Optional[int] = None,
	) -> int:
		"""Convert pointer bytes to address."""
		address = low | (high << 8)
		if bank is not None:
			return self.cpu_to_rom(address, bank)
		return address

	def address_to_pointer(self, address: int) -> Tuple[int, int]:
		"""Convert address to pointer bytes (little-endian)."""
		return address & 0xFF, (address >> 8) & 0xFF

	def calculate_checksum_address(self, value: int) -> int:
		"""Calculate checksum complement for SNES/GB."""
		return 0xFFFF - value


def format_address(
	address: int,
	format_type: str = "hex",
	include_bank: bool = False,
	bank: int = 0,
) -> str:
	"""Format an address for display."""
	if format_type == "hex":
		if include_bank:
			return f"${bank:02X}:{address:04X}"
		return f"${address:04X}"
	elif format_type == "decimal":
		return str(address)
	elif format_type == "binary":
		return f"%{address:016b}"
	elif format_type == "c":
		return f"0x{address:04X}"
	else:
		return f"${address:X}"


def parse_address(value: str) -> int:
	"""Parse an address string."""
	value = value.strip()

	# Handle bank:address format
	if ":" in value:
		parts = value.replace("$", "").split(":")
		bank = int(parts[0], 16)
		addr = int(parts[1], 16)
		return (bank << 16) | addr

	# Handle prefixes
	if value.startswith("$"):
		return int(value[1:], 16)
	elif value.startswith("0x"):
		return int(value, 16)
	elif value.startswith("%"):
		return int(value[1:], 2)
	elif value.startswith("0b"):
		return int(value, 2)
	else:
		# Try hex first, then decimal
		try:
			return int(value, 16)
		except ValueError:
			return int(value)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Address Converter - Convert between address formats",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Convert CPU address to ROM offset (NES)
	python address_conv.py cpu2rom 0xC123 --mapper 4 --bank 5

	# Convert ROM offset to CPU address
	python address_conv.py rom2cpu 0x8010 --platform nes --header 16

	# Convert pointer bytes to address
	python address_conv.py pointer 0x23 0xC1

	# SNES LoROM conversion
	python address_conv.py cpu2rom 0x8000 --platform snes --bank 0x10

	# Show mapper info
	python address_conv.py mappers

	# Interactive mode
	python address_conv.py interactive
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# CPU to ROM command
	cpu2rom_parser = subparsers.add_parser("cpu2rom", help="Convert CPU address to ROM offset")
	cpu2rom_parser.add_argument("address", help="CPU address")
	cpu2rom_parser.add_argument("--platform", "-p", default="nes", help="Platform (nes, snes, gb)")
	cpu2rom_parser.add_argument("--mapper", "-m", type=int, default=0, help="Mapper number (NES)")
	cpu2rom_parser.add_argument("--bank", "-b", type=int, default=0, help="Bank number")
	cpu2rom_parser.add_argument("--header", type=int, default=16, help="Header size")
	cpu2rom_parser.add_argument("--prg-size", type=int, default=0, help="PRG size in bytes")

	# ROM to CPU command
	rom2cpu_parser = subparsers.add_parser("rom2cpu", help="Convert ROM offset to CPU address")
	rom2cpu_parser.add_argument("offset", help="ROM file offset")
	rom2cpu_parser.add_argument("--platform", "-p", default="nes", help="Platform")
	rom2cpu_parser.add_argument("--mapper", "-m", type=int, default=0, help="Mapper number")
	rom2cpu_parser.add_argument("--header", type=int, default=16, help="Header size")

	# Pointer command
	pointer_parser = subparsers.add_parser("pointer", help="Convert pointer bytes to address")
	pointer_parser.add_argument("low", help="Low byte")
	pointer_parser.add_argument("high", help="High byte")
	pointer_parser.add_argument("--bank", "-b", type=int, help="Bank byte")

	# Mappers command
	mappers_parser = subparsers.add_parser("mappers", help="Show mapper information")
	mappers_parser.add_argument("--mapper", "-m", type=int, help="Specific mapper")

	# Interactive command
	interactive_parser = subparsers.add_parser("interactive", help="Interactive mode")
	interactive_parser.add_argument("--platform", "-p", default="nes", help="Platform")
	interactive_parser.add_argument("--mapper", "-m", type=int, default=0, help="Mapper")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		if args.command == "cpu2rom":
			converter = AddressConverter(
				platform=args.platform,
				mapper=args.mapper,
				header_size=args.header,
				prg_size=args.prg_size,
			)

			cpu_addr = parse_address(args.address)
			rom_offset = converter.cpu_to_rom(cpu_addr, args.bank)

			print(f"Platform: {args.platform.upper()}")
			if args.platform == "nes":
				print(f"Mapper: {args.mapper} ({converter.mapper_info['name']})")
			print(f"CPU Address: ${cpu_addr:04X}")
			print(f"Bank: {args.bank}")
			print(f"ROM Offset: ${rom_offset:06X} ({rom_offset})")

		elif args.command == "rom2cpu":
			converter = AddressConverter(
				platform=args.platform,
				mapper=args.mapper,
				header_size=args.header,
			)

			rom_offset = parse_address(args.offset)
			cpu_addr, bank = converter.rom_to_cpu(rom_offset)

			print(f"Platform: {args.platform.upper()}")
			if args.platform == "nes":
				print(f"Mapper: {args.mapper} ({converter.mapper_info['name']})")
			print(f"ROM Offset: ${rom_offset:06X}")
			print(f"CPU Address: ${cpu_addr:04X}")
			print(f"Bank: {bank}")

		elif args.command == "pointer":
			low = parse_address(args.low)
			high = parse_address(args.high)
			address = low | (high << 8)

			print(f"Low byte: ${low:02X}")
			print(f"High byte: ${high:02X}")
			print(f"Address: ${address:04X}")

			if args.bank is not None:
				print(f"Bank byte: ${args.bank:02X}")
				full = address | (args.bank << 16)
				print(f"Full address: ${full:06X}")

		elif args.command == "mappers":
			if args.mapper is not None:
				if args.mapper in AddressConverter.NES_MAPPERS:
					info = AddressConverter.NES_MAPPERS[args.mapper]
					print(f"\nMapper {args.mapper}: {info['name']}")
					print(f"  Bank size: ${info['bank_size']:04X} ({info['bank_size'] // 1024}KB)")
					print(f"  Max banks: {info['prg_banks']}")
				else:
					print(f"Unknown mapper: {args.mapper}")
			else:
				print("\nSupported NES Mappers:")
				print("-" * 50)
				for num, info in sorted(AddressConverter.NES_MAPPERS.items()):
					bank_kb = info['bank_size'] // 1024
					print(f"  {num:3d}: {info['name']:<15} {bank_kb}KB banks, max {info['prg_banks']}")

		elif args.command == "interactive":
			converter = AddressConverter(
				platform=args.platform,
				mapper=args.mapper,
			)

			print(f"\nAddress Converter - {args.platform.upper()}")
			if args.platform == "nes":
				print(f"Mapper: {args.mapper} ({converter.mapper_info['name']})")
			print("Commands: cpu2rom, rom2cpu, ptr, quit")
			print()

			while True:
				try:
					line = input("> ").strip()
					if not line:
						continue

					parts = line.split()
					cmd = parts[0].lower()

					if cmd in ("quit", "exit", "q"):
						break
					elif cmd == "cpu2rom" and len(parts) >= 2:
						addr = parse_address(parts[1])
						bank = int(parts[2]) if len(parts) > 2 else 0
						offset = converter.cpu_to_rom(addr, bank)
						print(f"  ROM: ${offset:06X}")
					elif cmd == "rom2cpu" and len(parts) >= 2:
						offset = parse_address(parts[1])
						addr, bank = converter.rom_to_cpu(offset)
						print(f"  CPU: ${addr:04X}, Bank: {bank}")
					elif cmd == "ptr" and len(parts) >= 3:
						low = parse_address(parts[1])
						high = parse_address(parts[2])
						print(f"  Address: ${low | (high << 8):04X}")
					else:
						print("  Unknown command")

				except (ValueError, IndexError) as e:
					print(f"  Error: {e}")
				except EOFError:
					break

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
