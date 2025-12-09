#!/usr/bin/env python3
"""
Debug Symbol Manager - Manage debugger labels and symbols.

Tools for working with debugger symbol files (.mlb, .sym, etc.)

Usage:
	python debug_symbols.py --import symbols.txt --format mlb
	python debug_symbols.py --export game.mlb --format txt
	python debug_symbols.py --merge file1.mlb file2.mlb

Features:
	- FCEUX MLB format
	- Mesen MLB format
	- Generic symbol files
	- Comment preservation
	- Address range support
"""

import argparse
import json
import re
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


class SymbolType(Enum):
	"""Symbol types."""
	CODE = "code"
	DATA = "data"
	RAM = "ram"
	ROM = "rom"
	PPU = "ppu"
	APU = "apu"
	UNKNOWN = "unknown"


class AddressType(Enum):
	"""Address space types."""
	CPU = "cpu"       # CPU address (RAM, ROM, I/O)
	PPU = "ppu"       # PPU address (pattern tables, nametables)
	PRG = "prg"       # PRG ROM offset
	CHR = "chr"       # CHR ROM offset
	SRAM = "sram"     # Save RAM
	WRAM = "wram"     # Work RAM


@dataclass
class Symbol:
	"""A debug symbol."""
	name: str
	address: int
	type: SymbolType = SymbolType.UNKNOWN
	addr_type: AddressType = AddressType.CPU
	bank: int = -1                  # -1 = no bank
	size: int = 0                   # Size in bytes, 0 = unknown
	comment: str = ""

	def __hash__(self):
		return hash((self.name, self.address, self.addr_type, self.bank))

	def __eq__(self, other):
		if not isinstance(other, Symbol):
			return False
		return (self.name == other.name and
				self.address == other.address and
				self.addr_type == other.addr_type and
				self.bank == other.bank)

	def full_address(self) -> int:
		"""Get full address including bank."""
		if self.bank >= 0:
			return (self.bank << 16) | self.address
		return self.address


@dataclass
class SymbolTable:
	"""Collection of symbols."""
	symbols: List[Symbol] = field(default_factory=list)
	comments: List[Tuple[int, str]] = field(default_factory=list)  # (line, comment)

	def add(self, symbol: Symbol):
		"""Add symbol if not duplicate."""
		if symbol not in self.symbols:
			self.symbols.append(symbol)

	def get_by_name(self, name: str) -> Optional[Symbol]:
		"""Find symbol by name."""
		for sym in self.symbols:
			if sym.name == name:
				return sym
		return None

	def get_by_address(self, address: int,
					  addr_type: AddressType = AddressType.CPU,
					  bank: int = -1) -> Optional[Symbol]:
		"""Find symbol by address."""
		for sym in self.symbols:
			if sym.address == address and sym.addr_type == addr_type:
				if bank < 0 or sym.bank < 0 or sym.bank == bank:
					return sym
		return None

	def get_all_at_address(self, address: int) -> List[Symbol]:
		"""Get all symbols at an address."""
		return [s for s in self.symbols if s.address == address]

	def filter_by_type(self, sym_type: SymbolType) -> List[Symbol]:
		"""Get symbols of a specific type."""
		return [s for s in self.symbols if s.type == sym_type]

	def filter_by_range(self, start: int, end: int) -> List[Symbol]:
		"""Get symbols in address range."""
		return [s for s in self.symbols if start <= s.address <= end]

	def merge(self, other: "SymbolTable"):
		"""Merge another symbol table."""
		for sym in other.symbols:
			self.add(sym)

	def sort(self):
		"""Sort symbols by address."""
		self.symbols.sort(key=lambda s: (s.addr_type.value, s.bank, s.address))


class MLBParser:
	"""Parser for Mesen/FCEUX MLB format."""

	# MLB format:
	# Type:Address:Label
	# G:0000:symbol_name

	TYPE_CODES = {
		'G': (AddressType.CPU, SymbolType.CODE),    # CPU code
		'R': (AddressType.CPU, SymbolType.DATA),    # CPU RAM
		'W': (AddressType.SRAM, SymbolType.DATA),   # Work/Save RAM
		'P': (AddressType.PRG, SymbolType.CODE),    # PRG ROM
		'S': (AddressType.PPU, SymbolType.DATA),    # PPU sprite
		'N': (AddressType.PPU, SymbolType.DATA),    # PPU nametable
	}

	@classmethod
	def parse(cls, content: str) -> SymbolTable:
		"""Parse MLB content."""
		table = SymbolTable()

		for line_num, line in enumerate(content.splitlines()):
			line = line.strip()

			if not line or line.startswith('#'):
				if line.startswith('#'):
					table.comments.append((line_num, line[1:].strip()))
				continue

			parts = line.split(':')
			if len(parts) >= 3:
				type_code = parts[0]
				addr_str = parts[1]
				name = parts[2]

				try:
					address = int(addr_str, 16)
				except ValueError:
					continue

				addr_type, sym_type = cls.TYPE_CODES.get(
					type_code, (AddressType.CPU, SymbolType.UNKNOWN))

				# Check for bank prefix
				bank = -1
				if '-' in addr_str:
					bank_str, addr_str = addr_str.split('-', 1)
					try:
						bank = int(bank_str, 16)
						address = int(addr_str, 16)
					except ValueError:
						pass

				comment = ""
				if len(parts) > 3:
					comment = ':'.join(parts[3:])

				symbol = Symbol(
					name=name,
					address=address,
					type=sym_type,
					addr_type=addr_type,
					bank=bank,
					comment=comment
				)
				table.add(symbol)

		return table

	@classmethod
	def format(cls, table: SymbolTable) -> str:
		"""Format symbol table as MLB."""
		lines = []

		# Reverse lookup for type codes
		code_lookup = {v: k for k, v in cls.TYPE_CODES.items()}

		table.sort()

		for sym in table.symbols:
			type_code = code_lookup.get(
				(sym.addr_type, sym.type), 'G')

			if sym.bank >= 0:
				addr_str = f"{sym.bank:02X}-{sym.address:04X}"
			else:
				addr_str = f"{sym.address:04X}"

			line = f"{type_code}:{addr_str}:{sym.name}"
			if sym.comment:
				line += f":{sym.comment}"

			lines.append(line)

		return '\n'.join(lines)


class SymParser:
	"""Parser for generic .sym files."""

	# Format: BANK:ADDR LABEL
	# Or: ADDR LABEL

	@classmethod
	def parse(cls, content: str) -> SymbolTable:
		"""Parse .sym content."""
		table = SymbolTable()

		for line in content.splitlines():
			line = line.strip()

			if not line or line.startswith(';') or line.startswith('#'):
				continue

			# Try BANK:ADDR NAME format
			match = re.match(r'([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(\S+)', line)
			if match:
				bank = int(match.group(1), 16)
				address = int(match.group(2), 16)
				name = match.group(3)

				symbol = Symbol(
					name=name,
					address=address,
					bank=bank
				)
				table.add(symbol)
				continue

			# Try ADDR NAME format
			match = re.match(r'([0-9A-Fa-f]+)\s+(\S+)', line)
			if match:
				address = int(match.group(1), 16)
				name = match.group(2)

				symbol = Symbol(name=name, address=address)
				table.add(symbol)
				continue

			# Try NAME = ADDR format
			match = re.match(r'(\S+)\s*=\s*\$?([0-9A-Fa-f]+)', line)
			if match:
				name = match.group(1)
				address = int(match.group(2), 16)

				symbol = Symbol(name=name, address=address)
				table.add(symbol)

		return table

	@classmethod
	def format(cls, table: SymbolTable) -> str:
		"""Format as .sym file."""
		lines = []
		table.sort()

		for sym in table.symbols:
			if sym.bank >= 0:
				lines.append(f"{sym.bank:02X}:{sym.address:04X} {sym.name}")
			else:
				lines.append(f"{sym.address:04X} {sym.name}")

		return '\n'.join(lines)


class AsmDefParser:
	"""Parser for assembly .def/.equ files."""

	@classmethod
	def parse(cls, content: str) -> SymbolTable:
		"""Parse .def/.equ content."""
		table = SymbolTable()

		for line in content.splitlines():
			line = line.strip()

			if not line or line.startswith(';'):
				continue

			# NAME = $VALUE
			match = re.match(r'(\w+)\s*(?:=|\.equ|\.def)\s*\$([0-9A-Fa-f]+)', line, re.I)
			if match:
				name = match.group(1)
				address = int(match.group(2), 16)

				symbol = Symbol(name=name, address=address)
				table.add(symbol)
				continue

			# NAME: .org $VALUE
			match = re.match(r'(\w+):\s*\.org\s*\$([0-9A-Fa-f]+)', line, re.I)
			if match:
				name = match.group(1)
				address = int(match.group(2), 16)

				symbol = Symbol(name=name, address=address, type=SymbolType.CODE)
				table.add(symbol)

		return table

	@classmethod
	def format(cls, table: SymbolTable) -> str:
		"""Format as assembly definitions."""
		lines = ["; Auto-generated symbol definitions", ""]

		# Group by type
		ram_syms = table.filter_by_range(0x0000, 0x07FF)
		rom_syms = table.filter_by_range(0x8000, 0xFFFF)

		if ram_syms:
			lines.append("; RAM addresses")
			for sym in sorted(ram_syms, key=lambda s: s.address):
				lines.append(f"{sym.name} = ${sym.address:04X}")
			lines.append("")

		if rom_syms:
			lines.append("; ROM addresses")
			for sym in sorted(rom_syms, key=lambda s: s.address):
				lines.append(f"{sym.name} = ${sym.address:04X}")

		return '\n'.join(lines)


class DebugSymbolManager:
	"""Manager for debug symbols."""

	PARSERS = {
		'.mlb': MLBParser,
		'.sym': SymParser,
		'.def': AsmDefParser,
		'.equ': AsmDefParser,
		'.txt': SymParser,
	}

	def __init__(self):
		self.table = SymbolTable()

	def load(self, path: Path) -> int:
		"""Load symbols from file. Returns count loaded."""
		ext = path.suffix.lower()
		parser = self.PARSERS.get(ext, SymParser)

		content = path.read_text(errors='replace')
		loaded = parser.parse(content)

		count = len(loaded.symbols)
		self.table.merge(loaded)

		return count

	def save(self, path: Path, format: str = None):
		"""Save symbols to file."""
		ext = format or path.suffix.lower()

		if ext == '.mlb' or ext == 'mlb':
			content = MLBParser.format(self.table)
		elif ext == '.def' or ext == 'def':
			content = AsmDefParser.format(self.table)
		else:
			content = SymParser.format(self.table)

		path.write_text(content)

	def import_json(self, path: Path):
		"""Import from JSON."""
		with open(path) as f:
			data = json.load(f)

		for sym_data in data.get('symbols', []):
			symbol = Symbol(
				name=sym_data.get('name', ''),
				address=int(sym_data.get('address', '0'), 16) if isinstance(sym_data.get('address'), str) else sym_data.get('address', 0),
				type=SymbolType(sym_data.get('type', 'unknown')),
				bank=sym_data.get('bank', -1),
				comment=sym_data.get('comment', '')
			)
			self.table.add(symbol)

	def export_json(self, path: Path):
		"""Export to JSON."""
		data = {
			'symbols': [
				{
					'name': s.name,
					'address': f"${s.address:04X}",
					'type': s.type.value,
					'bank': s.bank,
					'comment': s.comment
				}
				for s in self.table.symbols
			]
		}

		with open(path, 'w') as f:
			json.dump(data, f, indent='\t')

	def find_duplicates(self) -> List[Tuple[Symbol, Symbol]]:
		"""Find duplicate symbol names."""
		seen: Dict[str, Symbol] = {}
		duplicates = []

		for sym in self.table.symbols:
			if sym.name in seen:
				duplicates.append((seen[sym.name], sym))
			else:
				seen[sym.name] = sym

		return duplicates

	def find_conflicts(self) -> List[Tuple[Symbol, Symbol]]:
		"""Find address conflicts."""
		by_addr: Dict[int, List[Symbol]] = {}
		conflicts = []

		for sym in self.table.symbols:
			full = sym.full_address()
			if full not in by_addr:
				by_addr[full] = []
			by_addr[full].append(sym)

		for addr, syms in by_addr.items():
			if len(syms) > 1:
				for i, s1 in enumerate(syms):
					for s2 in syms[i + 1:]:
						conflicts.append((s1, s2))

		return conflicts

	def statistics(self) -> Dict[str, int]:
		"""Get symbol statistics."""
		stats = {
			'total': len(self.table.symbols),
			'code': 0,
			'data': 0,
			'ram': 0,
			'ppu': 0,
			'with_bank': 0,
			'with_comment': 0
		}

		for sym in self.table.symbols:
			if sym.type == SymbolType.CODE:
				stats['code'] += 1
			elif sym.type == SymbolType.DATA:
				stats['data'] += 1

			if sym.addr_type == AddressType.PPU:
				stats['ppu'] += 1
			elif sym.address < 0x2000:
				stats['ram'] += 1

			if sym.bank >= 0:
				stats['with_bank'] += 1
			if sym.comment:
				stats['with_comment'] += 1

		return stats


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Debug Symbol Manager")
	parser.add_argument("--import", "-i", dest="import_file", type=Path,
						help="Import symbols from file")
	parser.add_argument("--export", "-e", dest="export_file", type=Path,
						help="Export symbols to file")
	parser.add_argument("--format", "-f", type=str, default="auto",
						choices=["auto", "mlb", "sym", "def", "json"],
						help="File format")
	parser.add_argument("--merge", "-m", nargs='+', type=Path,
						help="Merge multiple files")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--stats", action="store_true",
						help="Show statistics")
	parser.add_argument("--find-dups", action="store_true",
						help="Find duplicate names")
	parser.add_argument("--find-conflicts", action="store_true",
						help="Find address conflicts")

	args = parser.parse_args()
	manager = DebugSymbolManager()

	# Load files
	if args.import_file:
		count = manager.load(args.import_file)
		print(f"Loaded {count} symbols from {args.import_file}")

	if args.merge:
		for path in args.merge:
			count = manager.load(path)
			print(f"Merged {count} symbols from {path}")

	# Analysis
	if args.stats:
		stats = manager.statistics()
		print("\nSymbol Statistics:")
		print(f"  Total: {stats['total']}")
		print(f"  Code: {stats['code']}")
		print(f"  Data: {stats['data']}")
		print(f"  RAM: {stats['ram']}")
		print(f"  PPU: {stats['ppu']}")
		print(f"  With bank: {stats['with_bank']}")
		print(f"  With comment: {stats['with_comment']}")

	if args.find_dups:
		dups = manager.find_duplicates()
		if dups:
			print(f"\nFound {len(dups)} duplicate names:")
			for s1, s2 in dups[:10]:
				print(f"  {s1.name}: ${s1.address:04X} and ${s2.address:04X}")
		else:
			print("\nNo duplicate names found.")

	if args.find_conflicts:
		conflicts = manager.find_conflicts()
		if conflicts:
			print(f"\nFound {len(conflicts)} address conflicts:")
			for s1, s2 in conflicts[:10]:
				print(f"  ${s1.address:04X}: {s1.name} and {s2.name}")
		else:
			print("\nNo address conflicts found.")

	# Export
	if args.export_file or args.output:
		output = args.output or args.export_file
		fmt = args.format if args.format != "auto" else None

		if args.format == "json" or (output and output.suffix == '.json'):
			manager.export_json(output)
		else:
			manager.save(output, fmt)

		print(f"\nSaved {len(manager.table.symbols)} symbols to {output}")


if __name__ == "__main__":
	main()
