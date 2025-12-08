#!/usr/bin/env python3
"""
Mapper Info

Information and utilities for NES mapper configurations.
Provides mapper documentation, register info, and analysis.

Features:
- Look up mapper specifications
- Analyze ROM for mapper usage
- Generate mapper documentation
- Verify mapper compatibility

Usage:
	python mapper_info.py lookup 4
	python mapper_info.py analyze <rom_file>
	python mapper_info.py list [--category mmc]
	python mapper_info.py registers 4
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class MapperRegister:
	"""Mapper register definition"""
	address: int
	address_end: int = 0  # For ranges
	name: str = ""
	description: str = ""
	bits: Dict[str, str] = field(default_factory=dict)  # bit range -> description


@dataclass
class MapperInfo:
	"""Full mapper information"""
	number: int
	name: str
	category: str = ""
	description: str = ""
	prg_banks: str = ""  # Bank configuration
	chr_banks: str = ""
	mirroring: str = ""
	battery: bool = False
	registers: List[MapperRegister] = field(default_factory=list)
	notes: List[str] = field(default_factory=list)
	games: List[str] = field(default_factory=list)


# Mapper database (commonly used mappers)
MAPPERS = {
	0: MapperInfo(
		number=0,
		name="NROM",
		category="basic",
		description="No mapper - simple ROM/RAM configuration",
		prg_banks="16KB or 32KB fixed",
		chr_banks="8KB fixed",
		mirroring="Fixed (H or V)",
		notes=[
			"Simplest mapper configuration",
			"PRG at $8000-$FFFF (mirrored if 16KB)",
			"CHR at $0000-$1FFF",
		],
		games=["Super Mario Bros.", "Donkey Kong", "Excitebike"],
	),
	1: MapperInfo(
		number=1,
		name="MMC1 (SxROM)",
		category="mmc",
		description="Nintendo MMC1 - common switchable mapper",
		prg_banks="Up to 256KB, 16KB switchable",
		chr_banks="Up to 128KB, 4KB switchable",
		mirroring="Switchable",
		battery=True,
		registers=[
			MapperRegister(
				address=0x8000, address_end=0x9FFF,
				name="Control",
				description="Mirroring, PRG mode, CHR mode",
				bits={
					"0-1": "Mirroring (0=1scr low, 1=1scr high, 2=V, 3=H)",
					"2-3": "PRG bank mode",
					"4": "CHR bank mode (0=8KB, 1=4KB)",
				}
			),
			MapperRegister(
				address=0xA000, address_end=0xBFFF,
				name="CHR Bank 0",
				description="CHR bank for $0000-$0FFF (or $0000-$1FFF)",
			),
			MapperRegister(
				address=0xC000, address_end=0xDFFF,
				name="CHR Bank 1",
				description="CHR bank for $1000-$1FFF (4KB mode)",
			),
			MapperRegister(
				address=0xE000, address_end=0xFFFF,
				name="PRG Bank",
				description="PRG bank selection + RAM enable",
				bits={
					"0-3": "PRG bank number",
					"4": "PRG RAM enable (0=enabled)",
				}
			),
		],
		notes=[
			"Write 5 bits serially (bit 0 first)",
			"Writes must be to same register",
			"Write $80+ to reset shift register",
		],
		games=["The Legend of Zelda", "Metroid", "Final Fantasy"],
	),
	2: MapperInfo(
		number=2,
		name="UxROM",
		category="basic",
		description="Simple PRG bank switching",
		prg_banks="Up to 256KB, 16KB switchable + 16KB fixed",
		chr_banks="8KB CHR-RAM",
		mirroring="Fixed",
		registers=[
			MapperRegister(
				address=0x8000, address_end=0xFFFF,
				name="Bank Select",
				description="Select 16KB PRG bank at $8000-$BFFF",
			),
		],
		notes=[
			"Last PRG bank fixed at $C000-$FFFF",
			"Simple mapper for larger games without battery",
		],
		games=["Mega Man", "Castlevania", "Contra"],
	),
	3: MapperInfo(
		number=3,
		name="CNROM",
		category="basic",
		description="Simple CHR bank switching",
		prg_banks="16KB or 32KB fixed",
		chr_banks="Up to 32KB, 8KB switchable",
		mirroring="Fixed",
		registers=[
			MapperRegister(
				address=0x8000, address_end=0xFFFF,
				name="CHR Bank",
				description="Select 8KB CHR bank",
				bits={"0-1": "CHR bank number"},
			),
		],
		notes=[
			"PRG ROM fixed",
			"Only lower bits of data bus used for bank",
		],
		games=["Solomon's Key", "Arkanoid"],
	),
	4: MapperInfo(
		number=4,
		name="MMC3 (TxROM)",
		category="mmc",
		description="Nintendo MMC3 - most popular mapper",
		prg_banks="Up to 512KB, 8KB switchable",
		chr_banks="Up to 256KB, 2KB/1KB switchable",
		mirroring="Switchable",
		battery=True,
		registers=[
			MapperRegister(
				address=0x8000,
				name="Bank Select",
				description="Select which bank to configure",
				bits={
					"0-2": "Bank register (R0-R7)",
					"6": "PRG mode (0=$8000, 1=$C000 switchable)",
					"7": "CHR mode (0=2KB@$0000, 1=2KB@$1000)",
				}
			),
			MapperRegister(
				address=0x8001,
				name="Bank Data",
				description="Data for selected bank register",
			),
			MapperRegister(
				address=0xA000,
				name="Mirroring",
				description="Select mirroring",
				bits={"0": "0=Vertical, 1=Horizontal"},
			),
			MapperRegister(
				address=0xA001,
				name="PRG RAM Protect",
				description="PRG RAM enable/protect",
				bits={
					"6": "Write protect",
					"7": "PRG RAM enable",
				}
			),
			MapperRegister(
				address=0xC000,
				name="IRQ Latch",
				description="IRQ counter reload value",
			),
			MapperRegister(
				address=0xC001,
				name="IRQ Reload",
				description="Trigger IRQ counter reload",
			),
			MapperRegister(
				address=0xE000,
				name="IRQ Disable",
				description="Disable IRQ and acknowledge",
			),
			MapperRegister(
				address=0xE001,
				name="IRQ Enable",
				description="Enable IRQ",
			),
		],
		notes=[
			"Scanline counter for IRQs",
			"8 bank registers: R0-R5 CHR, R6-R7 PRG",
			"Very flexible banking",
		],
		games=["Super Mario Bros. 3", "Kirby's Adventure", "Mega Man 3-6"],
	),
	7: MapperInfo(
		number=7,
		name="AxROM",
		category="basic",
		description="32KB PRG switching with single-screen mirroring",
		prg_banks="Up to 256KB, 32KB switchable",
		chr_banks="8KB CHR-RAM",
		mirroring="Single-screen switchable",
		registers=[
			MapperRegister(
				address=0x8000, address_end=0xFFFF,
				name="Bank Select",
				description="PRG bank and nametable",
				bits={
					"0-2": "PRG bank",
					"4": "Nametable select",
				}
			),
		],
		games=["Battletoads", "Marble Madness"],
	),
	9: MapperInfo(
		number=9,
		name="MMC2 (PxROM)",
		category="mmc",
		description="Nintendo MMC2 - rare, with tile-triggered banking",
		prg_banks="128KB, 8KB switchable",
		chr_banks="128KB, 4KB latch-switched",
		mirroring="Switchable",
		registers=[
			MapperRegister(address=0xA000, name="PRG Bank", description="8KB PRG at $8000"),
			MapperRegister(address=0xB000, name="CHR Bank 0A", description="$FD latch $0000"),
			MapperRegister(address=0xC000, name="CHR Bank 0B", description="$FE latch $0000"),
			MapperRegister(address=0xD000, name="CHR Bank 1A", description="$FD latch $1000"),
			MapperRegister(address=0xE000, name="CHR Bank 1B", description="$FE latch $1000"),
			MapperRegister(address=0xF000, name="Mirroring", description="H/V select"),
		],
		notes=["Used almost exclusively by Punch-Out!!"],
		games=["Punch-Out!!", "Mike Tyson's Punch-Out!!"],
	),
	10: MapperInfo(
		number=10,
		name="MMC4 (FxROM)",
		category="mmc",
		description="Nintendo MMC4 - MMC2 with battery",
		prg_banks="256KB, 16KB switchable",
		chr_banks="128KB, 4KB latch-switched",
		mirroring="Switchable",
		battery=True,
		notes=["Similar to MMC2 but with battery save"],
		games=["Fire Emblem", "Fire Emblem Gaiden"],
	),
	66: MapperInfo(
		number=66,
		name="GxROM",
		category="basic",
		description="Simple PRG+CHR switching",
		prg_banks="Up to 128KB, 32KB switchable",
		chr_banks="Up to 32KB, 8KB switchable",
		mirroring="Fixed",
		registers=[
			MapperRegister(
				address=0x8000, address_end=0xFFFF,
				name="Bank Select",
				description="Combined PRG/CHR bank select",
				bits={
					"0-1": "CHR bank",
					"4-5": "PRG bank",
				}
			),
		],
		games=["Super Mario Bros. + Duck Hunt"],
	),
	71: MapperInfo(
		number=71,
		name="Camerica/Codemasters",
		category="unlicensed",
		description="Used by Camerica/Codemasters games",
		prg_banks="Up to 256KB, 16KB switchable",
		chr_banks="8KB CHR-RAM",
		mirroring="Fixed or single-screen",
		notes=["Some variants support single-screen mirroring"],
		games=["Micro Machines", "Dizzy series"],
	),
	206: MapperInfo(
		number=206,
		name="DxROM/Namco 118",
		category="other",
		description="Subset of MMC3",
		prg_banks="128KB, 8KB switchable",
		chr_banks="64KB, 1KB/2KB switchable",
		mirroring="Fixed",
		notes=["No IRQ, mirroring fixed by solder pad"],
		games=["Mappy-Land", "Dragon Spirit"],
	),
}


def get_mapper_info(number: int) -> Optional[MapperInfo]:
	"""Get mapper information by number"""
	return MAPPERS.get(number)


def detect_mapper(rom_path: str) -> Tuple[int, Dict[str, any]]:
	"""Detect mapper from ROM file"""
	with open(rom_path, 'rb') as f:
		header = f.read(16)

	if header[:4] != b'NES\x1a':
		return -1, {"error": "Not a valid iNES ROM"}

	# Basic mapper number
	mapper = ((header[6] >> 4) & 0x0F) | (header[7] & 0xF0)

	# NES 2.0 extended mapper
	if (header[7] & 0x0C) == 0x08:
		mapper |= (header[8] & 0x0F) << 8

	prg_size = header[4] * 16384
	chr_size = header[5] * 8192

	info = {
		"mapper": mapper,
		"prg_size": prg_size,
		"chr_size": chr_size,
		"mirroring": "Vertical" if (header[6] & 0x01) else "Horizontal",
		"battery": bool(header[6] & 0x02),
		"trainer": bool(header[6] & 0x04),
		"four_screen": bool(header[6] & 0x08),
	}

	return mapper, info


def format_register(reg: MapperRegister) -> str:
	"""Format register information"""
	lines = []

	if reg.address_end:
		lines.append(f"${reg.address:04X}-${reg.address_end:04X}: {reg.name}")
	else:
		lines.append(f"${reg.address:04X}: {reg.name}")

	if reg.description:
		lines.append(f"    {reg.description}")

	if reg.bits:
		lines.append("    Bits:")
		for bits, desc in reg.bits.items():
			lines.append(f"      [{bits}]: {desc}")

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(
		description='Mapper Info',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Lookup command
	lookup_parser = subparsers.add_parser('lookup', help='Look up mapper info')
	lookup_parser.add_argument('mapper', type=int, help='Mapper number')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze ROM mapper')
	analyze_parser.add_argument('file', help='ROM file')

	# List command
	list_parser = subparsers.add_parser('list', help='List known mappers')
	list_parser.add_argument('--category', '-c', help='Filter by category')

	# Registers command
	reg_parser = subparsers.add_parser('registers', help='Show mapper registers')
	reg_parser.add_argument('mapper', type=int, help='Mapper number')

	args = parser.parse_args()

	if args.command == 'lookup':
		info = get_mapper_info(args.mapper)

		if info:
			print(f"Mapper {info.number}: {info.name}")
			print(f"Category: {info.category}")
			print(f"Description: {info.description}")
			print()
			print(f"PRG Banks: {info.prg_banks}")
			print(f"CHR Banks: {info.chr_banks}")
			print(f"Mirroring: {info.mirroring}")
			print(f"Battery: {'Yes' if info.battery else 'No'}")

			if info.notes:
				print()
				print("Notes:")
				for note in info.notes:
					print(f"  - {note}")

			if info.games:
				print()
				print("Example Games:")
				for game in info.games:
					print(f"  - {game}")
		else:
			print(f"Mapper {args.mapper}: Unknown")
			print("(Mapper not in database)")

	elif args.command == 'analyze':
		mapper_num, info = detect_mapper(args.file)

		print(f"ROM Analysis: {args.file}")
		print()
		print(f"Mapper: {mapper_num}")
		print(f"PRG Size: {info['prg_size']:,} bytes ({info['prg_size'] // 1024}KB)")
		print(f"CHR Size: {info['chr_size']:,} bytes ({info['chr_size'] // 1024}KB)")
		print(f"Mirroring: {info['mirroring']}")
		print(f"Battery: {'Yes' if info['battery'] else 'No'}")

		mapper_info = get_mapper_info(mapper_num)
		if mapper_info:
			print()
			print(f"Mapper Name: {mapper_info.name}")
			print(f"Description: {mapper_info.description}")

	elif args.command == 'list':
		print("Known Mappers:")
		print("=" * 60)

		sorted_mappers = sorted(MAPPERS.items())

		for num, info in sorted_mappers:
			if args.category and info.category != args.category:
				continue
			print(f"  {num:>3}: {info.name:<20} ({info.category})")

	elif args.command == 'registers':
		info = get_mapper_info(args.mapper)

		if not info:
			print(f"Mapper {args.mapper}: Unknown")
			sys.exit(1)

		print(f"Mapper {info.number}: {info.name}")
		print(f"Registers:")
		print("-" * 50)

		if info.registers:
			for reg in info.registers:
				print(format_register(reg))
				print()
		else:
			print("  No register information available")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
