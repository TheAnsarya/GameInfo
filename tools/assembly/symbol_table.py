#!/usr/bin/env python3
"""
Symbol Table Manager

A tool for managing symbol tables used in NES/SNES disassembly.
Supports multiple formats and provides cross-referencing capabilities.

Features:
- Import symbols from multiple sources (MLB, NL, ASM, IDA, Ghidra)
- Export to various disassembler formats
- Cross-reference analysis
- Symbol categorization and tagging
- Address range validation
- Duplicate detection and resolution

Usage:
	python symbol_table.py import <file> --format <fmt>
	python symbol_table.py export <output> --format <fmt>
	python symbol_table.py analyze --find-gaps
	python symbol_table.py merge <file1> <file2> --output <merged>
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field, asdict
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


class SymbolType(Enum):
	"""Types of symbols"""
	CODE = "code"
	DATA = "data"
	POINTER = "pointer"
	VECTOR = "vector"
	RAM = "ram"
	REGISTER = "register"
	CONSTANT = "constant"
	UNKNOWN = "unknown"


class ExportFormat(Enum):
	"""Export formats"""
	MLB = "mlb"
	NL = "nl"
	ASM = "asm"
	IDA = "ida"
	GHIDRA = "ghidra"
	JSON = "json"
	CSV = "csv"
	SYM = "sym"
	DBG = "dbg"


@dataclass
class Symbol:
	"""A single symbol entry"""
	address: int
	name: str
	symbol_type: SymbolType = SymbolType.UNKNOWN
	bank: int = -1
	size: int = 0
	comment: str = ""
	tags: List[str] = field(default_factory=list)
	references: List[int] = field(default_factory=list)
	source: str = ""

	@property
	def key(self) -> str:
		"""Unique key for this symbol"""
		if self.bank >= 0:
			return f"{self.bank:02X}:{self.address:04X}"
		return f"{self.address:04X}"

	@property
	def is_ram(self) -> bool:
		"""Check if this is a RAM symbol"""
		return self.symbol_type == SymbolType.RAM or self.address < 0x8000

	def to_dict(self) -> dict:
		"""Convert to dictionary"""
		return {
			'address': self.address,
			'name': self.name,
			'type': self.symbol_type.value,
			'bank': self.bank,
			'size': self.size,
			'comment': self.comment,
			'tags': self.tags,
			'references': self.references,
			'source': self.source
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'Symbol':
		"""Create from dictionary"""
		return cls(
			address=data['address'],
			name=data['name'],
			symbol_type=SymbolType(data.get('type', 'unknown')),
			bank=data.get('bank', -1),
			size=data.get('size', 0),
			comment=data.get('comment', ''),
			tags=data.get('tags', []),
			references=data.get('references', []),
			source=data.get('source', '')
		)


class SymbolTable:
	"""Manages a collection of symbols"""

	def __init__(self, name: str = ""):
		self.name = name
		self.symbols: Dict[str, Symbol] = {}
		self.by_name: Dict[str, Symbol] = {}
		self.metadata: Dict = {}

	def add(self, symbol: Symbol) -> bool:
		"""Add a symbol. Returns True if added, False if duplicate."""
		key = symbol.key
		if key in self.symbols:
			return False

		self.symbols[key] = symbol
		self.by_name[symbol.name] = symbol
		return True

	def update(self, symbol: Symbol) -> None:
		"""Add or update a symbol"""
		key = symbol.key

		# Remove old name mapping if exists
		if key in self.symbols:
			old_name = self.symbols[key].name
			if old_name in self.by_name:
				del self.by_name[old_name]

		self.symbols[key] = symbol
		self.by_name[symbol.name] = symbol

	def get_by_address(self, address: int, bank: int = -1) -> Optional[Symbol]:
		"""Get symbol by address"""
		if bank >= 0:
			key = f"{bank:02X}:{address:04X}"
		else:
			key = f"{address:04X}"
		return self.symbols.get(key)

	def get_by_name(self, name: str) -> Optional[Symbol]:
		"""Get symbol by name"""
		return self.by_name.get(name)

	def remove(self, address: int, bank: int = -1) -> bool:
		"""Remove a symbol"""
		if bank >= 0:
			key = f"{bank:02X}:{address:04X}"
		else:
			key = f"{address:04X}"

		if key in self.symbols:
			symbol = self.symbols[key]
			del self.symbols[key]
			if symbol.name in self.by_name:
				del self.by_name[symbol.name]
			return True
		return False

	def find(self, pattern: str) -> List[Symbol]:
		"""Find symbols matching a pattern"""
		regex = re.compile(pattern, re.IGNORECASE)
		return [s for s in self.symbols.values()
				if regex.search(s.name) or regex.search(s.comment)]

	def filter_by_type(self, symbol_type: SymbolType) -> List[Symbol]:
		"""Get all symbols of a specific type"""
		return [s for s in self.symbols.values() if s.symbol_type == symbol_type]

	def filter_by_tag(self, tag: str) -> List[Symbol]:
		"""Get all symbols with a specific tag"""
		return [s for s in self.symbols.values() if tag in s.tags]

	def filter_by_bank(self, bank: int) -> List[Symbol]:
		"""Get all symbols in a specific bank"""
		return [s for s in self.symbols.values() if s.bank == bank]

	def get_address_range(self, start: int, end: int, bank: int = -1) -> List[Symbol]:
		"""Get symbols in an address range"""
		return [s for s in self.symbols.values()
				if start <= s.address <= end and (bank < 0 or s.bank == bank)]

	def get_stats(self) -> Dict:
		"""Get symbol statistics"""
		stats = {
			'total': len(self.symbols),
			'by_type': {},
			'by_bank': {},
			'with_comments': 0,
			'with_tags': 0,
			'with_references': 0,
		}

		for symbol in self.symbols.values():
			# By type
			type_name = symbol.symbol_type.value
			stats['by_type'][type_name] = stats['by_type'].get(type_name, 0) + 1

			# By bank
			bank_key = str(symbol.bank) if symbol.bank >= 0 else 'none'
			stats['by_bank'][bank_key] = stats['by_bank'].get(bank_key, 0) + 1

			# Counts
			if symbol.comment:
				stats['with_comments'] += 1
			if symbol.tags:
				stats['with_tags'] += 1
			if symbol.references:
				stats['with_references'] += 1

		return stats

	def find_gaps(self, start: int, end: int, bank: int = -1) -> List[Tuple[int, int]]:
		"""Find gaps in symbol coverage"""
		symbols = self.get_address_range(start, end, bank)
		symbols.sort(key=lambda s: s.address)

		gaps = []
		current = start

		for symbol in symbols:
			if symbol.address > current:
				gaps.append((current, symbol.address - 1))
			current = symbol.address + max(1, symbol.size)

		if current < end:
			gaps.append((current, end))

		return gaps

	def find_duplicates(self) -> List[Tuple[str, List[Symbol]]]:
		"""Find duplicate symbol names"""
		by_name: Dict[str, List[Symbol]] = {}

		for symbol in self.symbols.values():
			if symbol.name not in by_name:
				by_name[symbol.name] = []
			by_name[symbol.name].append(symbol)

		return [(name, syms) for name, syms in by_name.items() if len(syms) > 1]

	def merge(self, other: 'SymbolTable', strategy: str = 'skip') -> Dict:
		"""Merge another symbol table. Strategy: skip, overwrite, rename"""
		result = {'added': 0, 'skipped': 0, 'renamed': 0, 'overwritten': 0}

		for symbol in other.symbols.values():
			key = symbol.key

			if key not in self.symbols:
				self.add(symbol)
				result['added'] += 1
			elif strategy == 'skip':
				result['skipped'] += 1
			elif strategy == 'overwrite':
				self.update(symbol)
				result['overwritten'] += 1
			elif strategy == 'rename':
				# Generate unique name
				base_name = symbol.name
				counter = 1
				while symbol.name in self.by_name:
					symbol.name = f"{base_name}_{counter}"
					counter += 1
				self.add(symbol)
				result['renamed'] += 1

		return result

	def __len__(self) -> int:
		return len(self.symbols)

	def __iter__(self):
		return iter(self.symbols.values())


class SymbolImporter:
	"""Import symbols from various formats"""

	@staticmethod
	def import_mlb(filepath: str) -> SymbolTable:
		"""Import from Mesen MLB format"""
		table = SymbolTable(filepath)

		type_map = {
			'P': SymbolType.CODE,
			'C': SymbolType.DATA,
			'R': SymbolType.RAM,
			'S': SymbolType.RAM,
			'G': SymbolType.REGISTER,
			'I': SymbolType.RAM,
		}

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				parts = line.split(':')
				if len(parts) < 3:
					continue

				try:
					addr_type = parts[0]
					symbol_type = type_map.get(addr_type, SymbolType.UNKNOWN)

					if len(parts) >= 5:
						bank = int(parts[1], 16)
						address = int(parts[2], 16)
						name = parts[3]
						comment = parts[4] if len(parts) > 4 else ""
					else:
						bank = -1
						address = int(parts[1], 16)
						name = parts[2]
						comment = parts[3] if len(parts) > 3 else ""

					symbol = Symbol(
						address=address,
						name=name,
						symbol_type=symbol_type,
						bank=bank,
						comment=comment,
						source=filepath
					)
					table.add(symbol)
				except (ValueError, IndexError):
					continue

		return table

	@staticmethod
	def import_nl(filepath: str) -> SymbolTable:
		"""Import from FCEUX NL format"""
		table = SymbolTable(filepath)

		# Determine bank from filename
		basename = os.path.basename(filepath)
		is_ram = '.ram.nl' in basename
		bank = -1

		if not is_ram:
			match = re.search(r'\.(\d+)\.nl$', basename, re.IGNORECASE)
			if match:
				bank = int(match.group(1))

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
				if match:
					address = int(match.group(1), 16)
					name = match.group(2)
					comment = match.group(3) or ""

					symbol = Symbol(
						address=address,
						name=name,
						symbol_type=SymbolType.RAM if is_ram else SymbolType.CODE,
						bank=bank if not is_ram else -1,
						comment=comment,
						source=filepath
					)
					table.add(symbol)

		return table

	@staticmethod
	def import_asm(filepath: str) -> SymbolTable:
		"""Import from ASM format (equ/= definitions)"""
		table = SymbolTable(filepath)

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line_stripped = line.strip()
				if not line_stripped or line_stripped.startswith(';'):
					continue

				# Match: name = $XXXX or name equ $XXXX
				match = re.match(
					r'(\w+)\s*(?:=|equ)\s*\$([0-9A-Fa-f]+)(?:\s*;\s*(.*))?',
					line_stripped, re.IGNORECASE
				)
				if match:
					name = match.group(1)
					address = int(match.group(2), 16)
					comment = match.group(3) or ""

					symbol = Symbol(
						address=address,
						name=name,
						symbol_type=SymbolType.RAM if address < 0x8000 else SymbolType.CODE,
						comment=comment,
						source=filepath
					)
					table.add(symbol)

		return table

	@staticmethod
	def import_sym(filepath: str) -> SymbolTable:
		"""Import from SYM format (WLA-DX, cc65)"""
		table = SymbolTable(filepath)

		with open(filepath, 'r', encoding='utf-8') as f:
			current_section = None

			for line in f:
				line = line.strip()
				if not line:
					continue

				# Section headers
				if line.startswith('['):
					current_section = line[1:-1].lower()
					continue

				# Parse symbol line: BANK:ADDR name
				match = re.match(r'([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(\S+)', line)
				if match:
					bank = int(match.group(1), 16)
					address = int(match.group(2), 16)
					name = match.group(3)

					symbol = Symbol(
						address=address,
						name=name,
						bank=bank,
						source=filepath
					)
					table.add(symbol)

		return table

	@staticmethod
	def import_json(filepath: str) -> SymbolTable:
		"""Import from JSON format"""
		with open(filepath, 'r', encoding='utf-8') as f:
			data = json.load(f)

		table = SymbolTable(data.get('name', filepath))
		table.metadata = data.get('metadata', {})

		for entry in data.get('symbols', []):
			symbol = Symbol.from_dict(entry)
			symbol.source = filepath
			table.add(symbol)

		return table

	@classmethod
	def import_file(cls, filepath: str, format_hint: str = None) -> SymbolTable:
		"""Import from file, auto-detecting format"""
		ext = os.path.splitext(filepath)[1].lower()

		if format_hint:
			fmt = format_hint.lower()
		elif ext == '.mlb':
			fmt = 'mlb'
		elif ext == '.nl':
			fmt = 'nl'
		elif ext in ('.asm', '.s', '.inc'):
			fmt = 'asm'
		elif ext == '.sym':
			fmt = 'sym'
		elif ext == '.json':
			fmt = 'json'
		else:
			fmt = 'asm'

		if fmt == 'mlb':
			return cls.import_mlb(filepath)
		elif fmt == 'nl':
			return cls.import_nl(filepath)
		elif fmt == 'asm':
			return cls.import_asm(filepath)
		elif fmt == 'sym':
			return cls.import_sym(filepath)
		elif fmt == 'json':
			return cls.import_json(filepath)
		else:
			raise ValueError(f"Unknown format: {fmt}")


class SymbolExporter:
	"""Export symbols to various formats"""

	@staticmethod
	def export_mlb(table: SymbolTable, filepath: str) -> int:
		"""Export to Mesen MLB format"""
		lines = ["; Mesen Label File", f"; Exported from: {table.name}", ""]

		type_map = {
			SymbolType.CODE: 'P',
			SymbolType.DATA: 'P',
			SymbolType.POINTER: 'P',
			SymbolType.VECTOR: 'P',
			SymbolType.RAM: 'R',
			SymbolType.REGISTER: 'G',
			SymbolType.CONSTANT: 'R',
			SymbolType.UNKNOWN: 'P',
		}

		# Group by type
		ram_symbols = [s for s in table if s.is_ram]
		rom_symbols = [s for s in table if not s.is_ram]

		if ram_symbols:
			lines.append("; RAM")
			for symbol in sorted(ram_symbols, key=lambda s: s.address):
				prefix = type_map.get(symbol.symbol_type, 'R')
				lines.append(f"{prefix}:{symbol.address:04X}:{symbol.name}:{symbol.comment}")
			lines.append("")

		if rom_symbols:
			lines.append("; ROM")
			for symbol in sorted(rom_symbols, key=lambda s: (s.bank, s.address)):
				prefix = type_map.get(symbol.symbol_type, 'P')
				if symbol.bank >= 0:
					lines.append(f"{prefix}:{symbol.bank:02X}:{symbol.address:04X}:{symbol.name}:{symbol.comment}")
				else:
					lines.append(f"{prefix}:{symbol.address:04X}:{symbol.name}:{symbol.comment}")

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return len(table)

	@staticmethod
	def export_nl(table: SymbolTable, output_dir: str, rom_name: str) -> Dict[str, int]:
		"""Export to FCEUX NL format"""
		os.makedirs(output_dir, exist_ok=True)
		result = {'ram': 0, 'rom': 0}

		# RAM symbols
		ram_symbols = [s for s in table if s.is_ram]
		if ram_symbols:
			ram_path = os.path.join(output_dir, f"{rom_name}.nes.ram.nl")
			with open(ram_path, 'w', encoding='utf-8', newline='\n') as f:
				f.write("; RAM Labels\n")
				for symbol in sorted(ram_symbols, key=lambda s: s.address):
					f.write(f"${symbol.address:04X}#{symbol.name}#{symbol.comment}\n")
			result['ram'] = len(ram_symbols)

		# ROM symbols by bank
		rom_symbols = [s for s in table if not s.is_ram]
		by_bank: Dict[int, List[Symbol]] = {}
		for symbol in rom_symbols:
			bank = max(0, symbol.bank)
			if bank not in by_bank:
				by_bank[bank] = []
			by_bank[bank].append(symbol)

		for bank, symbols in by_bank.items():
			bank_path = os.path.join(output_dir, f"{rom_name}.nes.{bank}.nl")
			with open(bank_path, 'w', encoding='utf-8', newline='\n') as f:
				f.write(f"; Bank {bank} Labels\n")
				for symbol in sorted(symbols, key=lambda s: s.address):
					f.write(f"${symbol.address:04X}#{symbol.name}#{symbol.comment}\n")
			result['rom'] += len(symbols)

		return result

	@staticmethod
	def export_asm(table: SymbolTable, filepath: str) -> int:
		"""Export to ASM format"""
		lines = ["; Symbol Definitions", f"; Exported from: {table.name}", ""]

		# RAM first
		ram_symbols = [s for s in table if s.is_ram]
		if ram_symbols:
			lines.append("; RAM")
			for symbol in sorted(ram_symbols, key=lambda s: s.address):
				if symbol.comment:
					lines.append(f"{symbol.name}\t= ${symbol.address:04X}\t; {symbol.comment}")
				else:
					lines.append(f"{symbol.name}\t= ${symbol.address:04X}")
			lines.append("")

		# ROM
		rom_symbols = [s for s in table if not s.is_ram]
		if rom_symbols:
			lines.append("; ROM")
			for symbol in sorted(rom_symbols, key=lambda s: (s.bank, s.address)):
				if symbol.comment:
					lines.append(f"{symbol.name}\t= ${symbol.address:04X}\t; {symbol.comment}")
				else:
					lines.append(f"{symbol.name}\t= ${symbol.address:04X}")

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return len(table)

	@staticmethod
	def export_json(table: SymbolTable, filepath: str) -> int:
		"""Export to JSON format"""
		data = {
			'name': table.name,
			'metadata': table.metadata,
			'symbols': [s.to_dict() for s in sorted(table, key=lambda s: (s.bank, s.address))]
		}

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(data, f, indent='\t')

		return len(table)

	@staticmethod
	def export_csv(table: SymbolTable, filepath: str) -> int:
		"""Export to CSV format"""
		lines = ["address,bank,name,type,size,comment,tags"]

		for symbol in sorted(table, key=lambda s: (s.bank, s.address)):
			tags_str = '|'.join(symbol.tags)
			comment_escaped = symbol.comment.replace('"', '""')
			lines.append(
				f"${symbol.address:04X},{symbol.bank},{symbol.name},"
				f"{symbol.symbol_type.value},{symbol.size},"
				f'"{comment_escaped}","{tags_str}"'
			)

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return len(table)

	@staticmethod
	def export_sym(table: SymbolTable, filepath: str) -> int:
		"""Export to SYM format"""
		lines = ["; Symbol file", "[labels]"]

		for symbol in sorted(table, key=lambda s: (s.bank, s.address)):
			bank = max(0, symbol.bank)
			lines.append(f"{bank:02X}:{symbol.address:04X} {symbol.name}")

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return len(table)

	@classmethod
	def export_file(cls, table: SymbolTable, filepath: str, format_type: str, **kwargs) -> int:
		"""Export to file with specified format"""
		fmt = format_type.lower()

		if fmt == 'mlb':
			return cls.export_mlb(table, filepath)
		elif fmt == 'nl':
			rom_name = kwargs.get('rom_name', 'rom')
			result = cls.export_nl(table, filepath, rom_name)
			return result['ram'] + result['rom']
		elif fmt == 'asm':
			return cls.export_asm(table, filepath)
		elif fmt == 'json':
			return cls.export_json(table, filepath)
		elif fmt == 'csv':
			return cls.export_csv(table, filepath)
		elif fmt == 'sym':
			return cls.export_sym(table, filepath)
		else:
			raise ValueError(f"Unknown export format: {fmt}")


def main():
	parser = argparse.ArgumentParser(
		description='Symbol Table Manager',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Import command
	import_parser = subparsers.add_parser('import', help='Import symbols')
	import_parser.add_argument('file', help='File to import')
	import_parser.add_argument('--format', '-f', help='Input format')
	import_parser.add_argument('--output', '-o', help='Output file (JSON)')

	# Export command
	export_parser = subparsers.add_parser('export', help='Export symbols')
	export_parser.add_argument('input', help='Input JSON file')
	export_parser.add_argument('--output', '-o', required=True, help='Output file')
	export_parser.add_argument('--format', '-f', required=True,
							   choices=['mlb', 'nl', 'asm', 'json', 'csv', 'sym'],
							   help='Output format')
	export_parser.add_argument('--rom-name', help='ROM name for NL export')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze symbols')
	analyze_parser.add_argument('input', help='Input file')
	analyze_parser.add_argument('--find-gaps', action='store_true', help='Find address gaps')
	analyze_parser.add_argument('--find-duplicates', action='store_true', help='Find duplicate names')
	analyze_parser.add_argument('--stats', action='store_true', help='Show statistics')
	analyze_parser.add_argument('--start', type=lambda x: int(x, 16), default=0x8000,
							   help='Start address (hex)')
	analyze_parser.add_argument('--end', type=lambda x: int(x, 16), default=0xFFFF,
							   help='End address (hex)')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Merge symbol files')
	merge_parser.add_argument('files', nargs='+', help='Files to merge')
	merge_parser.add_argument('--output', '-o', required=True, help='Output file')
	merge_parser.add_argument('--format', '-f', default='json',
							  choices=['mlb', 'nl', 'asm', 'json', 'csv', 'sym'],
							  help='Output format')
	merge_parser.add_argument('--strategy', '-s', default='skip',
							  choices=['skip', 'overwrite', 'rename'],
							  help='Conflict resolution strategy')

	# Convert command
	convert_parser = subparsers.add_parser('convert', help='Convert between formats')
	convert_parser.add_argument('input', help='Input file')
	convert_parser.add_argument('--output', '-o', required=True, help='Output file')
	convert_parser.add_argument('--from', dest='from_fmt', help='Input format')
	convert_parser.add_argument('--to', dest='to_fmt', required=True,
								choices=['mlb', 'nl', 'asm', 'json', 'csv', 'sym'],
								help='Output format')
	convert_parser.add_argument('--rom-name', help='ROM name for NL export')

	args = parser.parse_args()

	if args.command == 'import':
		table = SymbolImporter.import_file(args.file, args.format)
		print(f"Imported {len(table)} symbols from {args.file}")

		stats = table.get_stats()
		print(f"  Types: {stats['by_type']}")

		if args.output:
			SymbolExporter.export_json(table, args.output)
			print(f"Saved to {args.output}")

	elif args.command == 'export':
		table = SymbolImporter.import_json(args.input)
		count = SymbolExporter.export_file(
			table, args.output, args.format,
			rom_name=args.rom_name
		)
		print(f"Exported {count} symbols to {args.output}")

	elif args.command == 'analyze':
		table = SymbolImporter.import_file(args.input)
		print(f"Analyzing {len(table)} symbols from {args.input}")

		if args.stats:
			stats = table.get_stats()
			print(f"\nStatistics:")
			print(f"  Total: {stats['total']}")
			print(f"  By type: {stats['by_type']}")
			print(f"  With comments: {stats['with_comments']}")
			print(f"  With tags: {stats['with_tags']}")

		if args.find_gaps:
			gaps = table.find_gaps(args.start, args.end)
			print(f"\nAddress gaps ({len(gaps)} found):")
			for start, end in gaps[:20]:
				print(f"  ${start:04X} - ${end:04X} ({end - start + 1} bytes)")
			if len(gaps) > 20:
				print(f"  ... and {len(gaps) - 20} more")

		if args.find_duplicates:
			dupes = table.find_duplicates()
			print(f"\nDuplicate names ({len(dupes)} found):")
			for name, symbols in dupes[:20]:
				addrs = ', '.join(f"${s.address:04X}" for s in symbols)
				print(f"  {name}: {addrs}")

	elif args.command == 'merge':
		merged = SymbolTable("merged")
		total_result = {'added': 0, 'skipped': 0, 'renamed': 0, 'overwritten': 0}

		for filepath in args.files:
			table = SymbolImporter.import_file(filepath)
			result = merged.merge(table, args.strategy)
			for k, v in result.items():
				total_result[k] += v
			print(f"Merged {len(table)} symbols from {filepath}")

		print(f"\nMerge result: {total_result}")
		SymbolExporter.export_file(merged, args.output, args.format)
		print(f"Saved {len(merged)} symbols to {args.output}")

	elif args.command == 'convert':
		table = SymbolImporter.import_file(args.input, args.from_fmt)
		count = SymbolExporter.export_file(
			table, args.output, args.to_fmt,
			rom_name=args.rom_name
		)
		print(f"Converted {count} symbols from {args.input} to {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
