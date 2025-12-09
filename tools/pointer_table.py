#!/usr/bin/env python3
"""
Pointer Table Manager - Manage and update pointer tables in ROMs.

Features:
- Auto-detect pointer tables
- Update pointers when data moves
- Support for various pointer formats (16-bit, 24-bit, banked)
- Batch pointer updates

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
from typing import Dict, List, Optional, Tuple, Any, Set


class PointerFormat(Enum):
	"""Pointer format types."""
	ABSOLUTE_16 = "abs16"      # 16-bit absolute ($XXXX)
	ABSOLUTE_24 = "abs24"      # 24-bit absolute ($XXXXXX)
	BANKED_HILO = "banked_hl"  # Bank:Addr in high-low order
	BANKED_LOHI = "banked_lh"  # Addr:Bank in low-high order
	RELATIVE_8 = "rel8"        # 8-bit relative offset
	RELATIVE_16 = "rel16"      # 16-bit relative offset
	SPLIT_LOHI = "split_lh"    # Split table (low bytes, high bytes)
	NES_PRG = "nes_prg"        # NES PRG bank pointer


@dataclass
class Pointer:
	"""Represents a single pointer."""
	table_offset: int      # Offset within ROM of pointer location
	target_address: int    # Target address the pointer points to
	format_type: PointerFormat
	bank: int = 0          # Bank number (if applicable)
	index: int = 0         # Index in pointer table

	def get_rom_offset(self, base_address: int = 0x8000, bank_size: int = 0x4000) -> int:
		"""Convert target address to ROM offset."""
		if self.format_type == PointerFormat.NES_PRG:
			return (self.bank * bank_size) + (self.target_address - base_address)
		elif self.format_type in (PointerFormat.ABSOLUTE_24, PointerFormat.BANKED_HILO, PointerFormat.BANKED_LOHI):
			return self.target_address
		else:
			# Simple 16-bit absolute
			return self.target_address - base_address


@dataclass
class PointerTable:
	"""Represents a pointer table."""
	name: str
	offset: int            # ROM offset of table start
	count: int             # Number of pointers
	format_type: PointerFormat
	base_address: int = 0x8000  # Base address for address calculation
	bank: int = 0          # Bank number (if applicable)
	stride: int = 0        # Bytes between pointers (0 = auto)
	pointers: List[Pointer] = field(default_factory=list)
	description: str = ""

	def __post_init__(self):
		if self.stride == 0:
			if self.format_type == PointerFormat.ABSOLUTE_16:
				self.stride = 2
			elif self.format_type == PointerFormat.ABSOLUTE_24:
				self.stride = 3
			elif self.format_type in (PointerFormat.BANKED_HILO, PointerFormat.BANKED_LOHI):
				self.stride = 3
			elif self.format_type == PointerFormat.RELATIVE_8:
				self.stride = 1
			elif self.format_type == PointerFormat.RELATIVE_16:
				self.stride = 2
			else:
				self.stride = 2


class PointerTableManager:
	"""Manage pointer tables in a ROM."""

	def __init__(self, rom_data: bytes):
		"""Initialize with ROM data."""
		self.rom_data = bytearray(rom_data)
		self.tables: Dict[str, PointerTable] = {}

	def read_pointer(self, offset: int, format_type: PointerFormat,
					base_address: int = 0x8000, bank: int = 0) -> int:
		"""Read a pointer value at offset."""
		if offset >= len(self.rom_data):
			return 0

		if format_type == PointerFormat.ABSOLUTE_16:
			if offset + 1 >= len(self.rom_data):
				return 0
			return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

		elif format_type == PointerFormat.ABSOLUTE_24:
			if offset + 2 >= len(self.rom_data):
				return 0
			return (self.rom_data[offset] |
					(self.rom_data[offset + 1] << 8) |
					(self.rom_data[offset + 2] << 16))

		elif format_type == PointerFormat.BANKED_HILO:
			if offset + 2 >= len(self.rom_data):
				return 0
			ptr_bank = self.rom_data[offset]
			addr = self.rom_data[offset + 1] | (self.rom_data[offset + 2] << 8)
			return (ptr_bank << 16) | addr

		elif format_type == PointerFormat.BANKED_LOHI:
			if offset + 2 >= len(self.rom_data):
				return 0
			addr = self.rom_data[offset] | (self.rom_data[offset + 1] << 8)
			ptr_bank = self.rom_data[offset + 2]
			return (ptr_bank << 16) | addr

		elif format_type == PointerFormat.RELATIVE_8:
			rel = self.rom_data[offset]
			if rel & 0x80:
				rel -= 256
			return base_address + offset + rel

		elif format_type == PointerFormat.RELATIVE_16:
			if offset + 1 >= len(self.rom_data):
				return 0
			rel = self.rom_data[offset] | (self.rom_data[offset + 1] << 8)
			if rel & 0x8000:
				rel -= 65536
			return base_address + offset + rel

		else:
			return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

	def write_pointer(self, offset: int, value: int, format_type: PointerFormat) -> None:
		"""Write a pointer value at offset."""
		if offset >= len(self.rom_data):
			return

		if format_type == PointerFormat.ABSOLUTE_16:
			self.rom_data[offset] = value & 0xFF
			self.rom_data[offset + 1] = (value >> 8) & 0xFF

		elif format_type == PointerFormat.ABSOLUTE_24:
			self.rom_data[offset] = value & 0xFF
			self.rom_data[offset + 1] = (value >> 8) & 0xFF
			self.rom_data[offset + 2] = (value >> 16) & 0xFF

		elif format_type == PointerFormat.BANKED_HILO:
			self.rom_data[offset] = (value >> 16) & 0xFF
			self.rom_data[offset + 1] = value & 0xFF
			self.rom_data[offset + 2] = (value >> 8) & 0xFF

		elif format_type == PointerFormat.BANKED_LOHI:
			self.rom_data[offset] = value & 0xFF
			self.rom_data[offset + 1] = (value >> 8) & 0xFF
			self.rom_data[offset + 2] = (value >> 16) & 0xFF

	def add_table(self, table: PointerTable) -> None:
		"""Add a pointer table."""
		self.tables[table.name] = table
		self._read_table(table)

	def _read_table(self, table: PointerTable) -> None:
		"""Read all pointers in a table."""
		table.pointers.clear()

		for i in range(table.count):
			offset = table.offset + (i * table.stride)
			value = self.read_pointer(offset, table.format_type, table.base_address, table.bank)

			pointer = Pointer(
				table_offset=offset,
				target_address=value,
				format_type=table.format_type,
				bank=table.bank,
				index=i
			)
			table.pointers.append(pointer)

	def update_pointers(self, old_start: int, old_end: int,
						new_start: int, new_size: int) -> int:
		"""Update all pointers when data moves. Returns count of updated pointers."""
		shift = new_start - old_start
		size_change = new_size - (old_end - old_start)
		count = 0

		for table in self.tables.values():
			for pointer in table.pointers:
				rom_offset = pointer.get_rom_offset(table.base_address)

				# Check if pointer target is in moved region
				if old_start <= rom_offset < old_end:
					# Calculate new target
					offset_in_data = rom_offset - old_start
					new_rom_offset = new_start + offset_in_data

					# Convert back to address
					new_address = new_rom_offset + table.base_address

					# Write updated pointer
					self.write_pointer(pointer.table_offset, new_address, pointer.format_type)
					pointer.target_address = new_address
					count += 1

				# Check if pointer target is after moved region
				elif rom_offset >= old_end:
					# Shift by size change
					new_address = pointer.target_address + size_change
					self.write_pointer(pointer.table_offset, new_address, pointer.format_type)
					pointer.target_address = new_address
					count += 1

		return count

	def find_pointer_tables(self, min_entries: int = 4,
						address_range: Tuple[int, int] = (0x8000, 0xFFFF)) -> List[Tuple[int, int]]:
		"""Auto-detect potential pointer tables."""
		tables = []
		min_addr, max_addr = address_range

		i = 0
		while i < len(self.rom_data) - 4:
			# Try to read as pointer table
			count = 0
			last_addr = 0

			for j in range(256):  # Max 256 entries
				offset = i + j * 2
				if offset + 1 >= len(self.rom_data):
					break

				addr = self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

				# Check if valid address
				if min_addr <= addr <= max_addr:
					# Check for reasonable ordering (not required but helps filter)
					if count == 0 or (addr >= last_addr - 0x1000 and addr <= last_addr + 0x1000):
						count += 1
						last_addr = addr
					else:
						break
				else:
					break

			if count >= min_entries:
				tables.append((i, count))
				i += count * 2  # Skip this table
			else:
				i += 1

		return tables

	def get_data(self) -> bytes:
		"""Get modified ROM data."""
		return bytes(self.rom_data)

	def to_json(self) -> Dict[str, Any]:
		"""Export table definitions to JSON."""
		return {
			"tables": [
				{
					"name": table.name,
					"offset": f"0x{table.offset:X}",
					"count": table.count,
					"format": table.format_type.value,
					"base_address": f"0x{table.base_address:X}",
					"bank": table.bank,
					"stride": table.stride,
					"description": table.description,
					"pointers": [
						{
							"index": p.index,
							"offset": f"0x{p.table_offset:X}",
							"target": f"0x{p.target_address:X}"
						}
						for p in table.pointers
					]
				}
				for table in self.tables.values()
			]
		}

	@classmethod
	def from_json(cls, rom_data: bytes, json_data: Dict[str, Any]) -> 'PointerTableManager':
		"""Load table definitions from JSON."""
		manager = cls(rom_data)

		for table_data in json_data.get("tables", []):
			offset = int(table_data["offset"], 16) if isinstance(table_data["offset"], str) else table_data["offset"]
			base = int(table_data.get("base_address", "0x8000"), 16) if isinstance(table_data.get("base_address", "0x8000"), str) else table_data.get("base_address", 0x8000)

			table = PointerTable(
				name=table_data["name"],
				offset=offset,
				count=table_data["count"],
				format_type=PointerFormat(table_data.get("format", "abs16")),
				base_address=base,
				bank=table_data.get("bank", 0),
				stride=table_data.get("stride", 0),
				description=table_data.get("description", "")
			)
			manager.add_table(table)

		return manager


def format_table(table: PointerTable) -> str:
	"""Format table for display."""
	lines = [
		f"Table: {table.name}",
		f"  Offset: 0x{table.offset:X}",
		f"  Count: {table.count}",
		f"  Format: {table.format_type.value}",
		f"  Base: 0x{table.base_address:X}",
		""
	]

	if table.pointers:
		lines.append("  Pointers:")
		for p in table.pointers[:20]:  # Show first 20
			lines.append(f"    [{p.index:3d}] 0x{p.table_offset:X} -> 0x{p.target_address:X}")

		if len(table.pointers) > 20:
			lines.append(f"    ... and {len(table.pointers) - 20} more")

	return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Manage pointer tables in ROMs",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s find game.nes                    # Find pointer tables
  %(prog)s read game.nes 0x10000 16         # Read 16 pointers at offset
  %(prog)s update game.nes tables.json      # Update pointers from definition
  %(prog)s export game.nes -o tables.json   # Export table definitions
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Find command
	find_parser = subparsers.add_parser("find", help="Find potential pointer tables")
	find_parser.add_argument("rom", help="ROM file")
	find_parser.add_argument("--min", type=int, default=4, help="Minimum entries")
	find_parser.add_argument("--range", default="8000-FFFF", help="Address range (hex)")

	# Read command
	read_parser = subparsers.add_parser("read", help="Read pointer table")
	read_parser.add_argument("rom", help="ROM file")
	read_parser.add_argument("offset", help="Table offset (hex)")
	read_parser.add_argument("count", type=int, help="Number of pointers")
	read_parser.add_argument("-f", "--format", choices=["abs16", "abs24", "banked_hl", "banked_lh"],
		default="abs16", help="Pointer format")
	read_parser.add_argument("-b", "--base", default="8000", help="Base address (hex)")

	# Update command
	update_parser = subparsers.add_parser("update", help="Update pointers after data move")
	update_parser.add_argument("rom", help="ROM file")
	update_parser.add_argument("tables", help="Table definitions JSON")
	update_parser.add_argument("--old-start", required=True, help="Old data start (hex)")
	update_parser.add_argument("--old-end", required=True, help="Old data end (hex)")
	update_parser.add_argument("--new-start", required=True, help="New data start (hex)")
	update_parser.add_argument("--new-size", type=int, help="New data size")
	update_parser.add_argument("-o", "--output", required=True, help="Output ROM")

	# Export command
	export_parser = subparsers.add_parser("export", help="Export table definitions")
	export_parser.add_argument("rom", help="ROM file")
	export_parser.add_argument("-o", "--output", required=True, help="Output JSON")
	export_parser.add_argument("--tables", nargs="+", help="Table definitions (name:offset:count)")

	# Import command
	import_parser = subparsers.add_parser("import", help="Import and verify tables")
	import_parser.add_argument("rom", help="ROM file")
	import_parser.add_argument("tables", help="Table definitions JSON")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		rom_data = Path(args.rom).read_bytes()

		if args.command == "find":
			# Parse address range
			parts = args.range.split("-")
			min_addr = int(parts[0], 16)
			max_addr = int(parts[1], 16) if len(parts) > 1 else 0xFFFF

			manager = PointerTableManager(rom_data)
			tables = manager.find_pointer_tables(args.min, (min_addr, max_addr))

			print(f"Found {len(tables)} potential pointer tables:\n")
			for offset, count in tables[:50]:  # Show first 50
				print(f"  0x{offset:06X}: {count} entries")

				# Show first few pointers
				for i in range(min(3, count)):
					ptr_offset = offset + i * 2
					addr = rom_data[ptr_offset] | (rom_data[ptr_offset + 1] << 8)
					print(f"    [{i}] -> 0x{addr:04X}")
				if count > 3:
					print(f"    ...")
				print()

		elif args.command == "read":
			offset = int(args.offset, 16)
			base = int(args.base, 16)
			format_type = PointerFormat(args.format)

			manager = PointerTableManager(rom_data)

			table = PointerTable(
				name="read_table",
				offset=offset,
				count=args.count,
				format_type=format_type,
				base_address=base
			)
			manager.add_table(table)

			print(format_table(table))

		elif args.command == "update":
			old_start = int(args.old_start, 16)
			old_end = int(args.old_end, 16)
			new_start = int(args.new_start, 16)
			new_size = args.new_size if args.new_size else (old_end - old_start)

			with open(args.tables, 'r') as f:
				table_data = json.load(f)

			manager = PointerTableManager.from_json(rom_data, table_data)
			count = manager.update_pointers(old_start, old_end, new_start, new_size)

			Path(args.output).write_bytes(manager.get_data())
			print(f"Updated {count} pointers")
			print(f"Saved to: {args.output}")

		elif args.command == "export":
			manager = PointerTableManager(rom_data)

			if args.tables:
				for table_def in args.tables:
					parts = table_def.split(":")
					name = parts[0]
					offset = int(parts[1], 16)
					count = int(parts[2])

					table = PointerTable(
						name=name,
						offset=offset,
						count=count,
						format_type=PointerFormat.ABSOLUTE_16
					)
					manager.add_table(table)

			with open(args.output, 'w') as f:
				json.dump(manager.to_json(), f, indent='\t')

			print(f"Exported {len(manager.tables)} tables to: {args.output}")

		elif args.command == "import":
			with open(args.tables, 'r') as f:
				table_data = json.load(f)

			manager = PointerTableManager.from_json(rom_data, table_data)

			print(f"Loaded {len(manager.tables)} tables:\n")
			for table in manager.tables.values():
				print(format_table(table))
				print()

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
