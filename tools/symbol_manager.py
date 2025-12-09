#!/usr/bin/env python3
"""
Symbol Manager - Manage debug symbols and labels for ROMs.

Tools for creating, editing, and managing symbol tables used
for debugging and disassembly annotations.

Usage:
	python symbol_manager.py <symbols.sym>
	python symbol_manager.py --import mesen.mlb
	python symbol_manager.py --export ida.idc

Features:
	- Multi-format support
	- Symbol organization
	- Cross-reference tracking
	- Auto-labeling
	- Export formats
"""

import argparse
import json
import os
import re
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class SymbolType(Enum):
	"""Types of symbols."""
	CODE = auto()      # Code label
	DATA = auto()      # Data label
	RAM = auto()       # RAM variable
	ROM = auto()       # ROM constant
	IO = auto()        # I/O register
	CONST = auto()     # Constant value
	MACRO = auto()     # Macro definition
	STRUCT = auto()    # Structure
	ENUM = auto()      # Enumeration
	FUNCTION = auto()  # Function entry
	JUMP = auto()      # Jump target
	UNKNOWN = auto()   # Unknown type


class SymbolScope(Enum):
	"""Symbol visibility scope."""
	GLOBAL = auto()    # Visible everywhere
	LOCAL = auto()     # Local to file/section
	INTERNAL = auto()  # Internal use


@dataclass
class Symbol:
	"""A debug symbol."""
	name: str
	address: int
	type: SymbolType = SymbolType.UNKNOWN
	scope: SymbolScope = SymbolScope.GLOBAL
	bank: int = 0
	size: int = 0
	comment: str = ""
	file: str = ""
	line: int = 0
	
	# Cross-references
	references: List[int] = field(default_factory=list)
	
	@property
	def qualified_name(self) -> str:
		"""Get fully qualified name."""
		if self.bank:
			return f"{self.bank:02X}:{self.address:04X}:{self.name}"
		return self.name
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"address": f"0x{self.address:X}",
			"type": self.type.name,
			"scope": self.scope.name,
			"bank": self.bank,
			"size": self.size,
			"comment": self.comment,
			"file": self.file,
			"line": self.line,
			"references": [f"0x{r:X}" for r in self.references]
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Symbol":
		"""Create from dictionary."""
		addr = data.get("address", 0)
		if isinstance(addr, str):
			addr = int(addr, 0)
		
		refs = []
		for r in data.get("references", []):
			if isinstance(r, str):
				refs.append(int(r, 0))
			else:
				refs.append(r)
		
		return cls(
			name=data.get("name", ""),
			address=addr,
			type=SymbolType[data.get("type", "UNKNOWN")],
			scope=SymbolScope[data.get("scope", "GLOBAL")],
			bank=data.get("bank", 0),
			size=data.get("size", 0),
			comment=data.get("comment", ""),
			file=data.get("file", ""),
			line=data.get("line", 0),
			references=refs
		)


@dataclass
class SymbolTable:
	"""Collection of symbols."""
	name: str = ""
	symbols: Dict[str, Symbol] = field(default_factory=dict)
	by_address: Dict[int, List[Symbol]] = field(default_factory=dict)
	
	def add(self, symbol: Symbol) -> None:
		"""Add symbol to table."""
		self.symbols[symbol.name] = symbol
		
		# Index by address
		if symbol.address not in self.by_address:
			self.by_address[symbol.address] = []
		self.by_address[symbol.address].append(symbol)
	
	def get(self, name: str) -> Optional[Symbol]:
		"""Get symbol by name."""
		return self.symbols.get(name)
	
	def get_at(self, address: int, bank: int = 0) -> List[Symbol]:
		"""Get symbols at address."""
		result = []
		for sym in self.by_address.get(address, []):
			if bank == 0 or sym.bank == bank:
				result.append(sym)
		return result
	
	def remove(self, name: str) -> bool:
		"""Remove symbol by name."""
		if name in self.symbols:
			symbol = self.symbols[name]
			del self.symbols[name]
			
			# Remove from address index
			if symbol.address in self.by_address:
				self.by_address[symbol.address] = [
					s for s in self.by_address[symbol.address]
					if s.name != name
				]
			return True
		return False
	
	def rename(self, old_name: str, new_name: str) -> bool:
		"""Rename a symbol."""
		if old_name in self.symbols and new_name not in self.symbols:
			symbol = self.symbols[old_name]
			del self.symbols[old_name]
			symbol.name = new_name
			self.symbols[new_name] = symbol
			return True
		return False
	
	def find_by_type(self, sym_type: SymbolType) -> List[Symbol]:
		"""Find symbols by type."""
		return [s for s in self.symbols.values() if s.type == sym_type]
	
	def find_by_prefix(self, prefix: str) -> List[Symbol]:
		"""Find symbols by name prefix."""
		return [s for s in self.symbols.values() if s.name.startswith(prefix)]
	
	def find_in_range(self, start: int, end: int) -> List[Symbol]:
		"""Find symbols in address range."""
		return [s for s in self.symbols.values()
				if start <= s.address <= end]
	
	def merge(self, other: "SymbolTable", overwrite: bool = False) -> int:
		"""Merge another symbol table."""
		count = 0
		for name, symbol in other.symbols.items():
			if name not in self.symbols or overwrite:
				self.add(symbol)
				count += 1
		return count
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"symbols": {k: v.to_dict() for k, v in self.symbols.items()}
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SymbolTable":
		"""Create from dictionary."""
		table = cls(name=data.get("name", ""))
		for sym_data in data.get("symbols", {}).values():
			table.add(Symbol.from_dict(sym_data))
		return table


class SymbolImporter:
	"""Import symbols from various formats."""
	
	@staticmethod
	def from_sym(content: str) -> SymbolTable:
		"""Import from .sym file (cc65 style)."""
		table = SymbolTable()
		
		for line in content.split("\n"):
			line = line.strip()
			if not line or line.startswith(";"):
				continue
			
			# Format: BANK:ADDR NAME or ADDR NAME
			match = re.match(r'^([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(.+)$', line)
			if match:
				bank = int(match.group(1), 16)
				addr = int(match.group(2), 16)
				name = match.group(3).strip()
			else:
				match = re.match(r'^([0-9A-Fa-f]+)\s+(.+)$', line)
				if match:
					bank = 0
					addr = int(match.group(1), 16)
					name = match.group(2).strip()
				else:
					continue
			
			symbol = Symbol(name=name, address=addr, bank=bank)
			table.add(symbol)
		
		return table
	
	@staticmethod
	def from_mlb(content: str) -> SymbolTable:
		"""Import from Mesen .mlb file."""
		table = SymbolTable()
		
		for line in content.split("\n"):
			line = line.strip()
			if not line:
				continue
			
			# Format: TYPE:BANK:ADDR:NAME:COMMENT
			parts = line.split(":")
			if len(parts) >= 4:
				mem_type = parts[0]
				bank = int(parts[1], 16) if parts[1] else 0
				addr = int(parts[2], 16)
				name = parts[3]
				comment = parts[4] if len(parts) > 4 else ""
				
				# Determine type
				sym_type = SymbolType.UNKNOWN
				if mem_type in ["P", "PRG"]:
					sym_type = SymbolType.ROM
				elif mem_type in ["G", "RAM"]:
					sym_type = SymbolType.RAM
				elif mem_type in ["R", "REG"]:
					sym_type = SymbolType.IO
				
				symbol = Symbol(
					name=name,
					address=addr,
					bank=bank,
					type=sym_type,
					comment=comment
				)
				table.add(symbol)
		
		return table
	
	@staticmethod
	def from_fns(content: str) -> SymbolTable:
		"""Import from FCEUX .fns file."""
		table = SymbolTable()
		
		for line in content.split("\n"):
			line = line.strip()
			if not line or line.startswith("#"):
				continue
			
			# Format: $ADDR#NAME#
			match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)#', line)
			if match:
				addr = int(match.group(1), 16)
				name = match.group(2)
				
				symbol = Symbol(name=name, address=addr)
				table.add(symbol)
		
		return table
	
	@staticmethod
	def from_wla(content: str) -> SymbolTable:
		"""Import from WLA-DX .sym file."""
		table = SymbolTable()
		current_section = ""
		
		for line in content.split("\n"):
			line = line.strip()
			
			# Section headers
			if line.startswith("["):
				current_section = line[1:-1].lower()
				continue
			
			if not line:
				continue
			
			# Format varies by section
			# [labels] bank:addr name
			if current_section == "labels":
				match = re.match(r'^([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(.+)$', line)
				if match:
					bank = int(match.group(1), 16)
					addr = int(match.group(2), 16)
					name = match.group(3)
					symbol = Symbol(name=name, address=addr, bank=bank)
					table.add(symbol)
			
			# [definitions] VALUE name
			elif current_section == "definitions":
				match = re.match(r'^([0-9A-Fa-f]+)\s+(.+)$', line)
				if match:
					value = int(match.group(1), 16)
					name = match.group(2)
					symbol = Symbol(
						name=name,
						address=value,
						type=SymbolType.CONST
					)
					table.add(symbol)
		
		return table


class SymbolExporter:
	"""Export symbols to various formats."""
	
	@staticmethod
	def to_sym(table: SymbolTable) -> str:
		"""Export to .sym format."""
		lines = ["; Symbol file", ""]
		
		# Sort by address
		symbols = sorted(table.symbols.values(), key=lambda s: (s.bank, s.address))
		
		for symbol in symbols:
			if symbol.bank:
				lines.append(f"{symbol.bank:02X}:{symbol.address:04X} {symbol.name}")
			else:
				lines.append(f"{symbol.address:04X} {symbol.name}")
		
		return "\n".join(lines)
	
	@staticmethod
	def to_mlb(table: SymbolTable) -> str:
		"""Export to Mesen .mlb format."""
		lines = []
		
		for symbol in table.symbols.values():
			# Determine memory type
			if symbol.type == SymbolType.RAM:
				mem_type = "G"
			elif symbol.type == SymbolType.IO:
				mem_type = "R"
			else:
				mem_type = "P"
			
			comment = symbol.comment or ""
			line = f"{mem_type}:{symbol.bank:02X}:{symbol.address:04X}:{symbol.name}:{comment}"
			lines.append(line)
		
		return "\n".join(lines)
	
	@staticmethod
	def to_fns(table: SymbolTable) -> str:
		"""Export to FCEUX .fns format."""
		lines = []
		
		for symbol in table.symbols.values():
			lines.append(f"${symbol.address:04X}#{symbol.name}#")
		
		return "\n".join(lines)
	
	@staticmethod
	def to_idc(table: SymbolTable) -> str:
		"""Export to IDA Pro .idc format."""
		lines = [
			"// IDA Pro symbol file",
			"#include <idc.idc>",
			"",
			"static main() {"
		]
		
		for symbol in table.symbols.values():
			lines.append(f'\tMakeName(0x{symbol.address:X}, "{symbol.name}");')
			
			if symbol.comment:
				lines.append(f'\tMakeComm(0x{symbol.address:X}, "{symbol.comment}");')
		
		lines.append("}")
		return "\n".join(lines)
	
	@staticmethod
	def to_ghidra(table: SymbolTable) -> str:
		"""Export to Ghidra script format."""
		lines = [
			"// Ghidra Python script",
			"# @category Analysis",
			"",
			"from ghidra.program.model.symbol import SourceType",
			"",
			"def create_labels():",
			"\tlisting = currentProgram.getListing()",
			"\tsymTable = currentProgram.getSymbolTable()",
			""
		]
		
		for symbol in table.symbols.values():
			lines.append(f'\taddr = toAddr(0x{symbol.address:X})')
			lines.append(f'\tsymTable.createLabel(addr, "{symbol.name}", SourceType.USER_DEFINED)')
		
		lines.append("")
		lines.append("create_labels()")
		
		return "\n".join(lines)
	
	@staticmethod
	def to_asm_equates(table: SymbolTable) -> str:
		"""Export to assembly equates."""
		lines = ["; Symbol equates", ""]
		
		# Group by type
		ram_symbols = []
		rom_symbols = []
		io_symbols = []
		other_symbols = []
		
		for symbol in table.symbols.values():
			if symbol.type == SymbolType.RAM:
				ram_symbols.append(symbol)
			elif symbol.type in [SymbolType.ROM, SymbolType.CODE, SymbolType.DATA]:
				rom_symbols.append(symbol)
			elif symbol.type == SymbolType.IO:
				io_symbols.append(symbol)
			else:
				other_symbols.append(symbol)
		
		# RAM
		if ram_symbols:
			lines.append("; RAM Variables")
			for sym in sorted(ram_symbols, key=lambda s: s.address):
				comment = f" ; {sym.comment}" if sym.comment else ""
				lines.append(f"{sym.name} = ${sym.address:04X}{comment}")
			lines.append("")
		
		# I/O
		if io_symbols:
			lines.append("; I/O Registers")
			for sym in sorted(io_symbols, key=lambda s: s.address):
				comment = f" ; {sym.comment}" if sym.comment else ""
				lines.append(f"{sym.name} = ${sym.address:04X}{comment}")
			lines.append("")
		
		# ROM
		if rom_symbols:
			lines.append("; ROM Labels")
			for sym in sorted(rom_symbols, key=lambda s: s.address):
				comment = f" ; {sym.comment}" if sym.comment else ""
				lines.append(f"{sym.name} = ${sym.address:04X}{comment}")
		
		return "\n".join(lines)
	
	@staticmethod
	def to_c_header(table: SymbolTable) -> str:
		"""Export to C header file."""
		lines = [
			"// Auto-generated symbol definitions",
			"#ifndef _SYMBOLS_H_",
			"#define _SYMBOLS_H_",
			""
		]
		
		for symbol in sorted(table.symbols.values(), key=lambda s: s.address):
			name = symbol.name.upper().replace(" ", "_")
			lines.append(f"#define {name} 0x{symbol.address:04X}")
		
		lines.append("")
		lines.append("#endif // _SYMBOLS_H_")
		
		return "\n".join(lines)


class AutoLabeler:
	"""Generate automatic labels from ROM analysis."""
	
	def __init__(self, data: bytes):
		self.data = data
		self.symbols: List[Symbol] = []
	
	def find_jump_targets(self) -> List[int]:
		"""Find addresses that are jump targets."""
		targets: Set[int] = set()
		
		# Simple 6502 analysis
		i = 0
		while i < len(self.data):
			opcode = self.data[i]
			
			# JMP absolute
			if opcode == 0x4C and i + 2 < len(self.data):
				target = self.data[i + 1] | (self.data[i + 2] << 8)
				targets.add(target)
				i += 3
			# JSR
			elif opcode == 0x20 and i + 2 < len(self.data):
				target = self.data[i + 1] | (self.data[i + 2] << 8)
				targets.add(target)
				i += 3
			# Branches
			elif opcode in [0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0]:
				if i + 1 < len(self.data):
					offset = self.data[i + 1]
					if offset > 127:
						offset -= 256
					target = (i + 2 + offset) & 0xFFFF
					targets.add(target)
				i += 2
			else:
				i += 1
		
		return sorted(targets)
	
	def generate_labels(self, base_address: int = 0x8000) -> List[Symbol]:
		"""Generate automatic labels."""
		targets = self.find_jump_targets()
		
		for addr in targets:
			# Skip invalid addresses
			if addr < base_address:
				continue
			
			# Determine type
			if addr in [t for t in targets]:
				# Check if it's a JSR target (function)
				sym_type = SymbolType.CODE
				prefix = "sub"
			else:
				sym_type = SymbolType.JUMP
				prefix = "loc"
			
			symbol = Symbol(
				name=f"{prefix}_{addr:04X}",
				address=addr,
				type=sym_type
			)
			self.symbols.append(symbol)
		
		return self.symbols


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Symbol Manager")
	parser.add_argument("file", nargs="?", help="Symbol file")
	parser.add_argument("--import", "-i", dest="import_file",
						help="Import from file")
	parser.add_argument("--import-format",
						choices=["sym", "mlb", "fns", "wla"],
						default="sym", help="Import format")
	parser.add_argument("--export", "-e", dest="export_file",
						help="Export to file")
	parser.add_argument("--export-format",
						choices=["sym", "mlb", "fns", "idc", "ghidra", "asm", "c"],
						default="sym", help="Export format")
	parser.add_argument("--list", "-l", action="store_true",
						help="List symbols")
	parser.add_argument("--find", "-f", help="Find symbol by name")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Find symbol at address")
	parser.add_argument("--stats", action="store_true",
						help="Show statistics")
	
	args = parser.parse_args()
	
	table = SymbolTable()
	
	# Load existing file
	if args.file and os.path.exists(args.file):
		with open(args.file, "r") as f:
			content = f.read()
		
		if args.file.endswith(".json"):
			data = json.loads(content)
			table = SymbolTable.from_dict(data)
		else:
			table = SymbolImporter.from_sym(content)
		
		print(f"Loaded: {args.file} ({len(table.symbols)} symbols)")
	
	# Import
	if args.import_file:
		with open(args.import_file, "r") as f:
			content = f.read()
		
		importers = {
			"sym": SymbolImporter.from_sym,
			"mlb": SymbolImporter.from_mlb,
			"fns": SymbolImporter.from_fns,
			"wla": SymbolImporter.from_wla
		}
		
		imported = importers[args.import_format](content)
		count = table.merge(imported)
		print(f"Imported: {count} symbols from {args.import_file}")
	
	# List symbols
	if args.list:
		symbols = sorted(table.symbols.values(), key=lambda s: s.address)
		for sym in symbols[:50]:
			print(f"${sym.address:04X}: {sym.name} ({sym.type.name})")
		if len(symbols) > 50:
			print(f"... and {len(symbols) - 50} more")
		return
	
	# Find by name
	if args.find:
		matches = table.find_by_prefix(args.find)
		for sym in matches:
			print(f"${sym.address:04X}: {sym.name}")
			if sym.comment:
				print(f"  {sym.comment}")
		return
	
	# Find by address
	if args.address is not None:
		symbols = table.get_at(args.address)
		for sym in symbols:
			print(f"{sym.name} (${sym.address:04X})")
			print(f"  Type: {sym.type.name}")
			if sym.comment:
				print(f"  Comment: {sym.comment}")
		return
	
	# Statistics
	if args.stats:
		print(f"Total symbols: {len(table.symbols)}")
		for sym_type in SymbolType:
			count = len(table.find_by_type(sym_type))
			if count:
				print(f"  {sym_type.name}: {count}")
		return
	
	# Export
	if args.export_file:
		exporters = {
			"sym": SymbolExporter.to_sym,
			"mlb": SymbolExporter.to_mlb,
			"fns": SymbolExporter.to_fns,
			"idc": SymbolExporter.to_idc,
			"ghidra": SymbolExporter.to_ghidra,
			"asm": SymbolExporter.to_asm_equates,
			"c": SymbolExporter.to_c_header
		}
		
		content = exporters[args.export_format](table)
		with open(args.export_file, "w") as f:
			f.write(content)
		print(f"Exported: {args.export_file}")
		return
	
	# Save to JSON if modified
	if args.file and args.import_file:
		output = args.file if args.file.endswith(".json") else args.file + ".json"
		with open(output, "w") as f:
			json.dump(table.to_dict(), f, indent="\t")
		print(f"Saved: {output}")
	
	if not any([args.file, args.import_file, args.list, args.find,
				args.address is not None, args.stats, args.export_file]):
		print("Symbol Manager")
		print()
		print("Usage: python symbol_manager.py <file> [options]")
		print()
		print("Options:")
		print("  --import FILE     Import symbols")
		print("  --import-format   Import format (sym/mlb/fns/wla)")
		print("  --export FILE     Export symbols")
		print("  --export-format   Export format")
		print("  --list            List symbols")
		print("  --find NAME       Find by name prefix")
		print("  --address ADDR    Find at address")
		print("  --stats           Show statistics")


if __name__ == "__main__":
	main()
