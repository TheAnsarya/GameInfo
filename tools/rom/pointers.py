#!/usr/bin/env python3
"""
Pointer Table Analyzer

Find, analyze, and work with pointer tables in ROMs.
Essential for text extraction and data structure discovery.

Features:
- Detect pointer tables automatically
- Calculate pointer targets
- Extract data via pointer tables
- Generate pointer table documentation
- Handle various pointer formats (absolute, banked, relative)

Usage:
	python pointers.py scan <rom_file> --bank 0x10
	python pointers.py analyze <rom_file> --offset 0x8000 --count 20
	python pointers.py extract <rom_file> --table 0x8000 --count 20 --output text/
	python pointers.py document <rom_file> --table 0x8000 --count 20
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
class Pointer:
	"""Represents a single pointer"""
	table_offset: int  # Offset in table
	raw_value: int     # Raw pointer value
	target: int        # Calculated target address
	bank: int = 0      # Bank number (if applicable)
	size: int = 2      # Pointer size in bytes


@dataclass
class PointerTable:
	"""Represents a pointer table"""
	offset: int                           # Table offset in file
	count: int                            # Number of pointers
	pointer_size: int = 2                 # Size of each pointer (2 or 3)
	base_address: int = 0                 # Base address for relative pointers
	bank: int = -1                        # Bank number (-1 = auto)
	pointers: List[Pointer] = field(default_factory=list)


class PointerFormat:
	"""Pointer format handlers"""

	@staticmethod
	def read_16bit_le(data: bytes, offset: int) -> int:
		"""Read 16-bit little-endian pointer"""
		if offset + 2 > len(data):
			return 0
		return struct.unpack('<H', data[offset:offset + 2])[0]

	@staticmethod
	def read_16bit_be(data: bytes, offset: int) -> int:
		"""Read 16-bit big-endian pointer"""
		if offset + 2 > len(data):
			return 0
		return struct.unpack('>H', data[offset:offset + 2])[0]

	@staticmethod
	def read_24bit_le(data: bytes, offset: int) -> int:
		"""Read 24-bit little-endian pointer (bank:addr)"""
		if offset + 3 > len(data):
			return 0
		return struct.unpack('<I', data[offset:offset + 3] + b'\x00')[0]

	@staticmethod
	def calculate_nes_target(pointer: int, bank: int, header_size: int = 16) -> int:
		"""Calculate NES file offset from CPU address"""
		# NES bank calculation
		# $8000-$BFFF = bank * 0x4000 + (addr - 0x8000)
		# $C000-$FFFF = last bank or fixed
		if 0x8000 <= pointer < 0xC000:
			return header_size + (bank * 0x4000) + (pointer - 0x8000)
		elif 0xC000 <= pointer <= 0xFFFF:
			return header_size + (bank * 0x4000) + (pointer - 0x8000)
		return pointer

	@staticmethod
	def calculate_snes_lorom_target(pointer: int, bank: int) -> int:
		"""Calculate SNES LoROM file offset"""
		# LoROM: bank $00-$7D maps to $8000-$FFFF
		if bank < 0x80:
			return (bank * 0x8000) + (pointer - 0x8000)
		else:
			return ((bank - 0x80) * 0x8000) + (pointer - 0x8000)

	@staticmethod
	def calculate_snes_hirom_target(pointer: int, bank: int) -> int:
		"""Calculate SNES HiROM file offset"""
		# HiROM: direct mapping
		return (bank * 0x10000) + pointer


def detect_pointer_tables(data: bytes, min_pointers: int = 4, pointer_range: Tuple[int, int] = (0x8000, 0xFFFF)) -> List[Tuple[int, int]]:
	"""
	Scan for potential pointer tables.
	Returns list of (offset, estimated_count) tuples.
	"""
	results = []
	min_ptr, max_ptr = pointer_range

	i = 0
	while i < len(data) - (min_pointers * 2):
		# Read potential pointer
		ptr = struct.unpack('<H', data[i:i + 2])[0]

		if min_ptr <= ptr <= max_ptr:
			# Might be start of table - check consecutive pointers
			count = 0
			prev_ptr = ptr

			for j in range(i, min(i + 256, len(data) - 2), 2):
				test_ptr = struct.unpack('<H', data[j:j + 2])[0]

				if min_ptr <= test_ptr <= max_ptr:
					# Check if pointers are reasonably close (within 16KB)
					if abs(test_ptr - prev_ptr) < 0x4000:
						count += 1
						prev_ptr = test_ptr
					else:
						break
				else:
					break

			if count >= min_pointers:
				results.append((i, count))
				i += count * 2  # Skip past this table
			else:
				i += 2
		else:
			i += 2

	return results


def analyze_pointer_table(
	data: bytes,
	offset: int,
	count: int,
	pointer_size: int = 2,
	bank: int = -1,
	base_address: int = 0,
	header_size: int = 16,
	platform: str = 'nes'
) -> PointerTable:
	"""Analyze a pointer table and calculate targets"""

	table = PointerTable(
		offset=offset,
		count=count,
		pointer_size=pointer_size,
		base_address=base_address,
		bank=bank,
	)

	# Auto-detect bank from offset
	if bank == -1 and platform == 'nes':
		bank = (offset - header_size) // 0x4000
		table.bank = bank

	for i in range(count):
		ptr_offset = offset + (i * pointer_size)

		if ptr_offset + pointer_size > len(data):
			break

		if pointer_size == 2:
			raw_value = PointerFormat.read_16bit_le(data, ptr_offset)
		elif pointer_size == 3:
			raw_value = PointerFormat.read_24bit_le(data, ptr_offset)
		else:
			raw_value = PointerFormat.read_16bit_le(data, ptr_offset)

		# Calculate target
		if platform == 'nes':
			target = PointerFormat.calculate_nes_target(raw_value, bank, header_size)
		elif platform == 'snes_lorom':
			ptr_bank = (raw_value >> 16) if pointer_size == 3 else bank
			target = PointerFormat.calculate_snes_lorom_target(raw_value & 0xFFFF, ptr_bank)
		elif platform == 'snes_hirom':
			ptr_bank = (raw_value >> 16) if pointer_size == 3 else bank
			target = PointerFormat.calculate_snes_hirom_target(raw_value & 0xFFFF, ptr_bank)
		else:
			target = raw_value + base_address

		pointer = Pointer(
			table_offset=ptr_offset,
			raw_value=raw_value,
			target=target,
			bank=bank,
			size=pointer_size,
		)
		table.pointers.append(pointer)

	return table


def extract_via_pointers(
	data: bytes,
	table: PointerTable,
	end_markers: List[int] = None,
	max_length: int = 1024
) -> List[Tuple[int, bytes]]:
	"""Extract data using pointer table"""

	if end_markers is None:
		end_markers = [0x00, 0xFF]

	results = []

	for i, ptr in enumerate(table.pointers):
		if ptr.target >= len(data):
			results.append((ptr.target, b''))
			continue

		# Find end of data
		end = ptr.target
		for j in range(ptr.target, min(ptr.target + max_length, len(data))):
			if data[j] in end_markers:
				end = j + 1  # Include end marker
				break
		else:
			end = min(ptr.target + max_length, len(data))

		extracted = data[ptr.target:end]
		results.append((ptr.target, extracted))

	return results


def generate_documentation(table: PointerTable, extracts: List[Tuple[int, bytes]] = None) -> str:
	"""Generate documentation for pointer table"""

	lines = [
		f"Pointer Table Documentation",
		f"===========================",
		f"",
		f"Table Offset: 0x{table.offset:06X}",
		f"Pointer Count: {table.count}",
		f"Pointer Size: {table.pointer_size} bytes",
		f"Bank: {table.bank}",
		f"",
		f"Pointers:",
		f"---------",
	]

	for i, ptr in enumerate(table.pointers):
		line = f"  [{i:3}] Table: 0x{ptr.table_offset:06X}  Value: ${ptr.raw_value:04X}  Target: 0x{ptr.target:06X}"

		if extracts and i < len(extracts):
			target, data = extracts[i]
			if data:
				hex_preview = data[:16].hex().upper()
				if len(data) > 16:
					hex_preview += "..."
				line += f"  Data: {hex_preview}"

		lines.append(line)

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(
		description='Pointer Table Analyzer',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Scan command
	scan_parser = subparsers.add_parser('scan', help='Scan for pointer tables')
	scan_parser.add_argument('file', help='ROM file')
	scan_parser.add_argument('--bank', '-b', type=lambda x: int(x, 0), default=-1, help='Bank to scan')
	scan_parser.add_argument('--min-ptrs', type=int, default=4, help='Minimum pointers to detect')
	scan_parser.add_argument('--range', type=str, default='8000-FFFF', help='Pointer value range (hex)')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze pointer table')
	analyze_parser.add_argument('file', help='ROM file')
	analyze_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), required=True, help='Table offset')
	analyze_parser.add_argument('--count', '-c', type=int, required=True, help='Number of pointers')
	analyze_parser.add_argument('--size', '-s', type=int, default=2, choices=[2, 3], help='Pointer size')
	analyze_parser.add_argument('--bank', '-b', type=lambda x: int(x, 0), default=-1, help='Bank number')
	analyze_parser.add_argument('--platform', '-p', default='nes', choices=['nes', 'snes_lorom', 'snes_hirom', 'raw'])

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract data via pointers')
	extract_parser.add_argument('file', help='ROM file')
	extract_parser.add_argument('--table', '-t', type=lambda x: int(x, 0), required=True, help='Table offset')
	extract_parser.add_argument('--count', '-c', type=int, required=True, help='Number of pointers')
	extract_parser.add_argument('--output', '-o', required=True, help='Output directory')
	extract_parser.add_argument('--end-marker', '-e', type=lambda x: int(x, 0), default=0x00, help='End marker byte')
	extract_parser.add_argument('--platform', '-p', default='nes', choices=['nes', 'snes_lorom', 'snes_hirom', 'raw'])

	# Document command
	doc_parser = subparsers.add_parser('document', help='Generate documentation')
	doc_parser.add_argument('file', help='ROM file')
	doc_parser.add_argument('--table', '-t', type=lambda x: int(x, 0), required=True, help='Table offset')
	doc_parser.add_argument('--count', '-c', type=int, required=True, help='Number of pointers')
	doc_parser.add_argument('--output', '-o', help='Output file')
	doc_parser.add_argument('--platform', '-p', default='nes', choices=['nes', 'snes_lorom', 'snes_hirom', 'raw'])

	args = parser.parse_args()

	if args.command == 'scan':
		with open(args.file, 'rb') as f:
			data = f.read()

		# Parse range
		range_parts = args.range.split('-')
		ptr_range = (int(range_parts[0], 16), int(range_parts[1], 16))

		# Scan area
		if args.bank >= 0:
			start = 16 + (args.bank * 0x4000)
			end = start + 0x4000
			scan_data = data[start:end]
			offset_adjust = start
		else:
			scan_data = data
			offset_adjust = 0

		tables = detect_pointer_tables(scan_data, args.min_ptrs, ptr_range)

		print(f"Scanning: {args.file}")
		if args.bank >= 0:
			print(f"Bank: {args.bank}")
		print(f"Pointer range: ${ptr_range[0]:04X}-${ptr_range[1]:04X}")
		print(f"Found {len(tables)} potential tables:")
		print()

		for offset, count in tables[:50]:
			actual_offset = offset + offset_adjust
			print(f"  0x{actual_offset:06X}: {count} pointers")

	elif args.command == 'analyze':
		with open(args.file, 'rb') as f:
			data = f.read()

		table = analyze_pointer_table(
			data, args.offset, args.count,
			pointer_size=args.size,
			bank=args.bank,
			platform=args.platform
		)

		print(f"Pointer Table at 0x{args.offset:06X}")
		print(f"Bank: {table.bank}")
		print(f"Pointers: {len(table.pointers)}")
		print()

		for i, ptr in enumerate(table.pointers):
			print(f"  [{i:3}] ${ptr.raw_value:04X} -> 0x{ptr.target:06X}")

	elif args.command == 'extract':
		with open(args.file, 'rb') as f:
			data = f.read()

		table = analyze_pointer_table(data, args.table, args.count, platform=args.platform)
		extracts = extract_via_pointers(data, table, end_markers=[args.end_marker])

		# Create output directory
		output_dir = Path(args.output)
		output_dir.mkdir(parents=True, exist_ok=True)

		for i, (target, extracted) in enumerate(extracts):
			if extracted:
				filename = output_dir / f"entry_{i:03d}_0x{target:06X}.bin"
				with open(filename, 'wb') as f:
					f.write(extracted)

		print(f"Extracted {len(extracts)} entries to: {args.output}")

	elif args.command == 'document':
		with open(args.file, 'rb') as f:
			data = f.read()

		table = analyze_pointer_table(data, args.table, args.count, platform=args.platform)
		extracts = extract_via_pointers(data, table)

		doc = generate_documentation(table, extracts)

		if args.output:
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				f.write(doc)
			print(f"Documentation saved to: {args.output}")
		else:
			print(doc)

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
