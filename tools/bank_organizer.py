#!/usr/bin/env python3
"""
Bank Organizer - Manage and organize ROM bank layouts.

Features:
- Analyze ROM bank structure
- Calculate free space in banks
- Plan bank reorganization
- Generate bank maps
- Support for multiple mappers

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class MapperType(Enum):
	"""Common NES mappers."""
	NROM = 0
	MMC1 = 1
	UNROM = 2
	CNROM = 3
	MMC3 = 4
	MMC5 = 5
	AOROM = 7


@dataclass
class BankInfo:
	"""Information about a single ROM bank."""
	index: int
	offset: int  # Offset in ROM file
	size: int  # Bank size in bytes
	used_bytes: int = 0
	free_bytes: int = 0
	is_prg: bool = True  # True for PRG, False for CHR
	description: str = ""
	contents: List[Tuple[int, int, str]] = field(default_factory=list)  # (offset, size, label)


@dataclass
class ROMLayout:
	"""ROM bank layout."""
	prg_banks: List[BankInfo] = field(default_factory=list)
	chr_banks: List[BankInfo] = field(default_factory=list)
	mapper: MapperType = MapperType.NROM
	prg_bank_size: int = 0x4000  # 16KB default
	chr_bank_size: int = 0x2000  # 8KB default
	total_prg: int = 0
	total_chr: int = 0


@dataclass
class FreeSpaceBlock:
	"""Free space block within a bank."""
	bank_index: int
	offset: int  # Within bank
	size: int
	rom_offset: int  # Absolute ROM offset


def parse_ines_header(data: bytes) -> Dict[str, Any]:
	"""Parse iNES header."""
	if len(data) < 16 or data[:4] != b'NES\x1a':
		raise ValueError("Not a valid iNES ROM")

	prg_size = data[4] * 0x4000  # 16KB units
	chr_size = data[5] * 0x2000  # 8KB units

	flags6 = data[6]
	flags7 = data[7]

	mapper = ((flags6 >> 4) & 0x0F) | (flags7 & 0xF0)

	return {
		'prg_size': prg_size,
		'chr_size': chr_size,
		'mapper': mapper,
		'mirroring': 'vertical' if flags6 & 1 else 'horizontal',
		'has_battery': bool(flags6 & 2),
		'has_trainer': bool(flags6 & 4),
		'prg_banks': data[4],
		'chr_banks': data[5]
	}


def analyze_bank_usage(data: bytes, bank_start: int, bank_size: int) -> Tuple[int, int, List[FreeSpaceBlock]]:
	"""Analyze bank for used/free space."""
	bank_data = data[bank_start:bank_start + bank_size]

	if len(bank_data) < bank_size:
		return 0, bank_size, []

	# Find free space (runs of $FF or $00)
	free_blocks = []
	used_bytes = 0

	i = 0
	while i < len(bank_data):
		# Count consecutive free bytes
		free_start = i
		while i < len(bank_data) and bank_data[i] in (0x00, 0xFF):
			i += 1

		free_len = i - free_start

		if free_len >= 16:  # Minimum useful free space
			free_blocks.append(FreeSpaceBlock(
				bank_index=0,  # Set by caller
				offset=free_start,
				size=free_len,
				rom_offset=bank_start + free_start
			))
		else:
			used_bytes += free_len

		# Count used bytes until next free section
		while i < len(bank_data) and bank_data[i] not in (0x00, 0xFF):
			used_bytes += 1
			i += 1

	# Also count small gaps as used
	total_free = sum(b.size for b in free_blocks)

	return used_bytes, total_free, free_blocks


def analyze_rom(path: str) -> ROMLayout:
	"""Analyze ROM bank structure."""
	data = Path(path).read_bytes()

	header = parse_ines_header(data)

	layout = ROMLayout()

	# Determine mapper
	try:
		layout.mapper = MapperType(header['mapper'])
	except ValueError:
		layout.mapper = MapperType.NROM

	# Set bank sizes based on mapper
	if layout.mapper in [MapperType.MMC1, MapperType.MMC3]:
		layout.prg_bank_size = 0x4000  # 16KB or 8KB switchable
	elif layout.mapper == MapperType.UNROM:
		layout.prg_bank_size = 0x4000  # 16KB
	else:
		layout.prg_bank_size = 0x4000  # Default 16KB

	layout.chr_bank_size = 0x2000  # 8KB default
	layout.total_prg = header['prg_size']
	layout.total_chr = header['chr_size']

	# Header offset (16 bytes, or 528 if trainer present)
	header_size = 16 + (512 if header['has_trainer'] else 0)

	# Analyze PRG banks
	prg_count = header['prg_banks']
	for i in range(prg_count):
		offset = header_size + i * layout.prg_bank_size
		used, free, blocks = analyze_bank_usage(data, offset, layout.prg_bank_size)

		# Update block bank indices
		for block in blocks:
			block.bank_index = i

		bank = BankInfo(
			index=i,
			offset=offset,
			size=layout.prg_bank_size,
			used_bytes=used,
			free_bytes=free,
			is_prg=True
		)
		layout.prg_banks.append(bank)

	# Analyze CHR banks
	chr_count = header['chr_banks']
	chr_start = header_size + header['prg_size']

	for i in range(chr_count):
		offset = chr_start + i * layout.chr_bank_size
		used, free, blocks = analyze_bank_usage(data, offset, layout.chr_bank_size)

		for block in blocks:
			block.bank_index = i

		bank = BankInfo(
			index=i,
			offset=offset,
			size=layout.chr_bank_size,
			used_bytes=used,
			free_bytes=free,
			is_prg=False
		)
		layout.chr_banks.append(bank)

	return layout


def find_free_space(
	layout: ROMLayout,
	required_size: int,
	prg_only: bool = True
) -> List[FreeSpaceBlock]:
	"""Find free space blocks that can fit required size."""
	results = []
	data = None  # Would need ROM data for detailed analysis

	banks = layout.prg_banks if prg_only else layout.prg_banks + layout.chr_banks

	for bank in banks:
		if bank.free_bytes >= required_size:
			# Bank has enough total free space
			# For detailed block info, would need to re-analyze
			results.append(FreeSpaceBlock(
				bank_index=bank.index,
				offset=0,  # Placeholder
				size=bank.free_bytes,
				rom_offset=bank.offset
			))

	return results


def generate_bank_map(layout: ROMLayout) -> str:
	"""Generate text bank map."""
	lines = []

	lines.append("=" * 60)
	lines.append("ROM Bank Layout")
	lines.append("=" * 60)
	lines.append(f"Mapper: {layout.mapper.name} ({layout.mapper.value})")
	lines.append(f"PRG ROM: {layout.total_prg // 1024}KB ({len(layout.prg_banks)} banks)")
	lines.append(f"CHR ROM: {layout.total_chr // 1024}KB ({len(layout.chr_banks)} banks)")
	lines.append("")

	# PRG Banks
	lines.append("PRG Banks:")
	lines.append("-" * 50)

	total_prg_free = 0
	for bank in layout.prg_banks:
		usage_pct = (bank.used_bytes / bank.size) * 100 if bank.size > 0 else 0
		bar_len = int(usage_pct / 5)  # 20 char bar
		bar = '█' * bar_len + '░' * (20 - bar_len)

		total_prg_free += bank.free_bytes

		lines.append(
			f"  Bank {bank.index:2d}: ${bank.offset:06X}  "
			f"[{bar}] {usage_pct:5.1f}%  "
			f"Free: {bank.free_bytes:5d} bytes"
		)

	lines.append(f"\n  Total PRG free space: {total_prg_free:,} bytes")

	# CHR Banks
	if layout.chr_banks:
		lines.append("")
		lines.append("CHR Banks:")
		lines.append("-" * 50)

		total_chr_free = 0
		for bank in layout.chr_banks:
			usage_pct = (bank.used_bytes / bank.size) * 100 if bank.size > 0 else 0
			bar_len = int(usage_pct / 5)
			bar = '█' * bar_len + '░' * (20 - bar_len)

			total_chr_free += bank.free_bytes

			lines.append(
				f"  Bank {bank.index:2d}: ${bank.offset:06X}  "
				f"[{bar}] {usage_pct:5.1f}%  "
				f"Free: {bank.free_bytes:5d} bytes"
			)

		lines.append(f"\n  Total CHR free space: {total_chr_free:,} bytes")

	return '\n'.join(lines)


def export_layout_json(layout: ROMLayout, path: str) -> None:
	"""Export layout to JSON."""
	data = {
		'mapper': layout.mapper.value,
		'mapper_name': layout.mapper.name,
		'prg_bank_size': layout.prg_bank_size,
		'chr_bank_size': layout.chr_bank_size,
		'total_prg': layout.total_prg,
		'total_chr': layout.total_chr,
		'prg_banks': [],
		'chr_banks': []
	}

	for bank in layout.prg_banks:
		data['prg_banks'].append({
			'index': bank.index,
			'offset': f'0x{bank.offset:06X}',
			'size': bank.size,
			'used_bytes': bank.used_bytes,
			'free_bytes': bank.free_bytes,
			'usage_percent': round((bank.used_bytes / bank.size) * 100, 1) if bank.size > 0 else 0
		})

	for bank in layout.chr_banks:
		data['chr_banks'].append({
			'index': bank.index,
			'offset': f'0x{bank.offset:06X}',
			'size': bank.size,
			'used_bytes': bank.used_bytes,
			'free_bytes': bank.free_bytes,
			'usage_percent': round((bank.used_bytes / bank.size) * 100, 1) if bank.size > 0 else 0
		})

	with open(path, 'w') as f:
		json.dump(data, f, indent=2)


def generate_asm_defines(layout: ROMLayout) -> str:
	"""Generate assembly defines for bank offsets."""
	lines = [
		"; Bank layout defines",
		"; Generated by bank_organizer.py",
		""
	]

	for bank in layout.prg_banks:
		lines.append(f"PRG_BANK_{bank.index}_OFFSET = ${bank.offset:06X}")
		lines.append(f"PRG_BANK_{bank.index}_SIZE = ${bank.size:04X}")

	if layout.chr_banks:
		lines.append("")
		for bank in layout.chr_banks:
			lines.append(f"CHR_BANK_{bank.index}_OFFSET = ${bank.offset:06X}")
			lines.append(f"CHR_BANK_{bank.index}_SIZE = ${bank.size:04X}")

	return '\n'.join(lines)


def calculate_cpu_address(rom_offset: int, bank_index: int, mapper: MapperType) -> int:
	"""Calculate CPU address from ROM offset."""
	# This is a simplified calculation
	# Real calculation depends on mapper and current bank configuration

	if mapper == MapperType.NROM:
		# NROM: $8000-$FFFF
		return 0x8000 + (rom_offset & 0x7FFF)
	elif mapper == MapperType.UNROM:
		# UNROM: Bank at $8000-$BFFF, fixed at $C000-$FFFF
		if bank_index == 7:  # Assuming 8 banks, last is fixed
			return 0xC000 + (rom_offset & 0x3FFF)
		else:
			return 0x8000 + (rom_offset & 0x3FFF)
	elif mapper in [MapperType.MMC1, MapperType.MMC3]:
		# MMC1/MMC3: Depends on configuration
		return 0x8000 + (rom_offset & 0x3FFF)
	else:
		return 0x8000 + (rom_offset & 0x7FFF)


def find_contiguous_space(
	data: bytes,
	header_size: int,
	min_size: int = 256
) -> List[Tuple[int, int]]:
	"""Find all contiguous free space regions."""
	regions = []

	i = header_size
	while i < len(data):
		# Find start of free region
		start = i
		while i < len(data) and data[i] in (0x00, 0xFF):
			i += 1

		size = i - start
		if size >= min_size:
			regions.append((start, size))

		# Skip used bytes
		while i < len(data) and data[i] not in (0x00, 0xFF):
			i += 1

	return regions


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Analyze and organize ROM bank layouts",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s analyze game.nes                   # Analyze bank layout
  %(prog)s map game.nes -o layout.txt         # Generate bank map
  %(prog)s free game.nes --min 256            # Find free space
  %(prog)s export game.nes -o layout.json     # Export to JSON
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze", help="Analyze ROM banks")
	analyze_parser.add_argument("rom", help="ROM file")
	analyze_parser.add_argument("-v", "--verbose", action="store_true")

	# Map command
	map_parser = subparsers.add_parser("map", help="Generate bank map")
	map_parser.add_argument("rom", help="ROM file")
	map_parser.add_argument("-o", "--output", help="Output file")

	# Free command
	free_parser = subparsers.add_parser("free", help="Find free space")
	free_parser.add_argument("rom", help="ROM file")
	free_parser.add_argument("--min", type=int, default=16, help="Minimum block size")
	free_parser.add_argument("--prg-only", action="store_true", help="PRG banks only")

	# Export command
	export_parser = subparsers.add_parser("export", help="Export layout")
	export_parser.add_argument("rom", help="ROM file")
	export_parser.add_argument("-o", "--output", required=True, help="Output file")
	export_parser.add_argument("-f", "--format", choices=["json", "asm"], default="json")

	# Find command
	find_parser = subparsers.add_parser("find", help="Find space for data")
	find_parser.add_argument("rom", help="ROM file")
	find_parser.add_argument("--size", type=int, required=True, help="Required size")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		if args.command == "analyze":
			layout = analyze_rom(args.rom)

			print(f"Mapper: {layout.mapper.name} ({layout.mapper.value})")
			print(f"PRG ROM: {layout.total_prg // 1024}KB ({len(layout.prg_banks)} banks)")
			print(f"CHR ROM: {layout.total_chr // 1024}KB ({len(layout.chr_banks)} banks)")
			print()

			total_free = sum(b.free_bytes for b in layout.prg_banks)
			print(f"Total PRG free space: {total_free:,} bytes")

			if layout.chr_banks:
				chr_free = sum(b.free_bytes for b in layout.chr_banks)
				print(f"Total CHR free space: {chr_free:,} bytes")

			if args.verbose:
				print()
				for bank in layout.prg_banks:
					pct = (bank.used_bytes / bank.size) * 100 if bank.size > 0 else 0
					print(f"PRG Bank {bank.index}: {pct:.1f}% used, {bank.free_bytes} bytes free")

		elif args.command == "map":
			layout = analyze_rom(args.rom)
			bank_map = generate_bank_map(layout)

			if args.output:
				Path(args.output).write_text(bank_map)
				print(f"Bank map saved to: {args.output}")
			else:
				print(bank_map)

		elif args.command == "free":
			data = Path(args.rom).read_bytes()
			header = parse_ines_header(data)
			header_size = 16 + (512 if header['has_trainer'] else 0)

			regions = find_contiguous_space(data, header_size, args.min)

			print(f"Free space regions (>= {args.min} bytes):")
			print()

			# Filter by PRG/CHR if requested
			prg_end = header_size + header['prg_size']

			for offset, size in sorted(regions, key=lambda x: -x[1]):
				is_prg = offset < prg_end

				if args.prg_only and not is_prg:
					continue

				region_type = "PRG" if is_prg else "CHR"
				print(f"  ${offset:06X} - ${offset + size:06X}: {size:6,} bytes ({region_type})")

			total = sum(size for _, size in regions)
			print(f"\nTotal: {total:,} bytes in {len(regions)} regions")

		elif args.command == "export":
			layout = analyze_rom(args.rom)

			if args.format == "json":
				export_layout_json(layout, args.output)
			elif args.format == "asm":
				asm = generate_asm_defines(layout)
				Path(args.output).write_text(asm)

			print(f"Exported to: {args.output}")

		elif args.command == "find":
			layout = analyze_rom(args.rom)

			print(f"Looking for {args.size} bytes of free space...")
			print()

			candidates = find_free_space(layout, args.size)

			if candidates:
				print("Candidates:")
				for block in candidates:
					print(f"  Bank {block.bank_index}: {block.size:,} bytes free at ${block.rom_offset:06X}")
			else:
				print("No single block large enough found.")

				# Suggest fragmented options
				total_free = sum(b.free_bytes for b in layout.prg_banks)
				print(f"Total free space: {total_free:,} bytes")
				print("Consider splitting data across multiple regions.")

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except ValueError as e:
		print(f"Error: {e}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
