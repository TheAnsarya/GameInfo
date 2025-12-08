#!/usr/bin/env python3
"""
Disassembly Exporter

Export CDL and symbol data to various disassembler formats.
Supports generating annotated disassembly output.

Features:
- Export to IDA, Ghidra, and other disassembler formats
- Generate annotated assembly source files
- Create control files for disassemblers
- Support for NES/SNES specific features
- Bank-aware output generation

Usage:
	python disasm_export.py <rom> --cdl <cdl_file> --labels <mlb_file> --output <dir>
	python disasm_export.py <rom> --format ida --output <idc_file>
	python disasm_export.py <rom> --format ghidra --output <script.py>
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, BinaryIO


class OutputFormat(Enum):
	"""Output format types"""
	ASM = "asm"
	IDA = "ida"
	GHIDRA = "ghidra"
	NO_CASH = "nocash"
	FCEUX = "fceux"
	MESEN = "mesen"
	CA65 = "ca65"
	WLA = "wla"


class RegionType(Enum):
	"""Memory region types"""
	CODE = "code"
	DATA = "data"
	TEXT = "text"
	GRAPHICS = "graphics"
	AUDIO = "audio"
	UNKNOWN = "unknown"


@dataclass
class MemoryRegion:
	"""A memory region with type information"""
	start: int
	end: int
	region_type: RegionType
	bank: int = -1
	name: str = ""
	comment: str = ""


@dataclass
class Symbol:
	"""A symbol/label"""
	address: int
	name: str
	bank: int = -1
	comment: str = ""
	is_code: bool = True


class ROMInfo:
	"""ROM information container"""

	def __init__(self, filepath: str):
		self.filepath = filepath
		self.data: bytes = b''
		self.prg_size: int = 0
		self.chr_size: int = 0
		self.mapper: int = 0
		self.prg_banks: int = 0
		self.chr_banks: int = 0
		self.header_size: int = 16

		self._load()

	def _load(self):
		"""Load and parse ROM"""
		with open(self.filepath, 'rb') as f:
			self.data = f.read()

		# Parse iNES header
		if self.data[:4] == b'NES\x1a':
			self.prg_banks = self.data[4]
			self.chr_banks = self.data[5]
			self.mapper = (self.data[6] >> 4) | (self.data[7] & 0xF0)

			self.prg_size = self.prg_banks * 16384
			self.chr_size = self.chr_banks * 8192

			# Check for trainer
			if self.data[6] & 0x04:
				self.header_size = 16 + 512

	def get_prg_data(self) -> bytes:
		"""Get PRG ROM data"""
		start = self.header_size
		return self.data[start:start + self.prg_size]

	def get_chr_data(self) -> bytes:
		"""Get CHR ROM data"""
		start = self.header_size + self.prg_size
		return self.data[start:start + self.chr_size]

	def get_bank_data(self, bank: int) -> bytes:
		"""Get data for a specific PRG bank"""
		bank_size = 16384
		start = self.header_size + (bank * bank_size)
		return self.data[start:start + bank_size]


class CDLData:
	"""CDL (Code/Data Logger) data"""

	CODE = 0x01
	DATA = 0x02
	PCM = 0x40

	def __init__(self, filepath: str = None):
		self.data: bytes = b''
		self.format: str = 'fceux'

		if filepath:
			self._load(filepath)

	def _load(self, filepath: str):
		"""Load CDL file"""
		with open(filepath, 'rb') as f:
			self.data = f.read()

		# Detect format
		if self.data[:3] == b'MCD':
			self.format = 'mesen'
			self.data = self.data[3:]
		elif self.data[:4] == b'CDL\x1a':
			self.format = 'mesen2'
			self.data = self.data[4:]

	def get_type(self, offset: int) -> RegionType:
		"""Get the type of data at an offset"""
		if offset >= len(self.data):
			return RegionType.UNKNOWN

		flags = self.data[offset]

		if flags & self.CODE:
			return RegionType.CODE
		elif flags & self.DATA:
			return RegionType.DATA
		elif flags & self.PCM:
			return RegionType.AUDIO

		return RegionType.UNKNOWN

	def is_code(self, offset: int) -> bool:
		"""Check if offset is code"""
		return self.get_type(offset) == RegionType.CODE

	def is_data(self, offset: int) -> bool:
		"""Check if offset is data"""
		return self.get_type(offset) == RegionType.DATA

	def get_regions(self, prg_size: int) -> List[MemoryRegion]:
		"""Get all distinct regions"""
		regions = []
		if not self.data:
			return regions

		current_type = self.get_type(0)
		region_start = 0

		for i in range(1, min(len(self.data), prg_size)):
			new_type = self.get_type(i)
			if new_type != current_type:
				regions.append(MemoryRegion(
					start=region_start,
					end=i - 1,
					region_type=current_type
				))
				current_type = new_type
				region_start = i

		# Final region
		regions.append(MemoryRegion(
			start=region_start,
			end=min(len(self.data), prg_size) - 1,
			region_type=current_type
		))

		return regions


class SymbolData:
	"""Symbol/label data"""

	def __init__(self, filepath: str = None):
		self.symbols: Dict[str, Symbol] = {}  # key: "bank:address"

		if filepath:
			self._load(filepath)

	def _load(self, filepath: str):
		"""Load symbols from MLB or NL file"""
		ext = os.path.splitext(filepath)[1].lower()

		with open(filepath, 'r', encoding='utf-8') as f:
			content = f.read()

		if ext == '.mlb':
			self._parse_mlb(content, filepath)
		elif ext == '.nl':
			self._parse_nl(content, filepath)

	def _parse_mlb(self, content: str, filepath: str):
		"""Parse MLB format"""
		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith(';'):
				continue

			parts = line.split(':')
			if len(parts) < 3:
				continue

			try:
				addr_type = parts[0]
				is_code = addr_type == 'P'

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

				key = f"{bank:02X}:{address:04X}" if bank >= 0 else f"{address:04X}"
				self.symbols[key] = Symbol(
					address=address,
					name=name,
					bank=bank,
					comment=comment,
					is_code=is_code
				)
			except (ValueError, IndexError):
				continue

	def _parse_nl(self, content: str, filepath: str):
		"""Parse NL format"""
		# Determine bank from filename
		basename = os.path.basename(filepath)
		bank = -1
		match = re.search(r'\.(\d+)\.nl$', basename, re.IGNORECASE)
		if match:
			bank = int(match.group(1))

		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith(';'):
				continue

			match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
			if match:
				address = int(match.group(1), 16)
				name = match.group(2)
				comment = match.group(3) or ""

				key = f"{bank:02X}:{address:04X}" if bank >= 0 else f"{address:04X}"
				self.symbols[key] = Symbol(
					address=address,
					name=name,
					bank=bank,
					comment=comment
				)

	def get_symbol(self, address: int, bank: int = -1) -> Optional[Symbol]:
		"""Get symbol at address"""
		if bank >= 0:
			key = f"{bank:02X}:{address:04X}"
			if key in self.symbols:
				return self.symbols[key]

		# Try without bank
		key = f"{address:04X}"
		return self.symbols.get(key)

	def get_symbols_in_range(self, start: int, end: int, bank: int = -1) -> List[Symbol]:
		"""Get all symbols in address range"""
		result = []
		for symbol in self.symbols.values():
			if start <= symbol.address <= end:
				if bank < 0 or symbol.bank == bank:
					result.append(symbol)
		return sorted(result, key=lambda s: s.address)


class DisassemblyExporter:
	"""Export disassembly data to various formats"""

	def __init__(self, rom: ROMInfo, cdl: CDLData = None, symbols: SymbolData = None):
		self.rom = rom
		self.cdl = cdl
		self.symbols = symbols

	def export_ida_idc(self, output_path: str) -> int:
		"""Export to IDA IDC script"""
		lines = [
			"// IDA Pro IDC Script",
			f"// Generated for: {os.path.basename(self.rom.filepath)}",
			"",
			"#include <idc.idc>",
			"",
			"static main() {",
		]

		count = 0

		# Add symbols
		if self.symbols:
			lines.append("\t// Symbols")
			for symbol in sorted(self.symbols.symbols.values(), key=lambda s: s.address):
				addr = symbol.address
				lines.append(f'\tMakeName({addr:#06x}, "{symbol.name}");')
				if symbol.comment:
					lines.append(f'\tMakeComm({addr:#06x}, "{symbol.comment}");')
				count += 1

		# Mark code/data regions from CDL
		if self.cdl:
			regions = self.cdl.get_regions(self.rom.prg_size)
			lines.append("")
			lines.append("\t// Code/Data regions from CDL")
			for region in regions:
				# Convert PRG offset to CPU address (assuming $8000 base)
				bank = region.start // 16384
				offset_in_bank = region.start % 16384
				cpu_addr = 0x8000 + offset_in_bank

				if region.region_type == RegionType.CODE:
					lines.append(f"\tMakeCode({cpu_addr:#06x});")
				elif region.region_type == RegionType.DATA:
					lines.append(f"\tMakeData({cpu_addr:#06x}, FF_BYTE, 1, 0);")

		lines.append("}")

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return count

	def export_ghidra_script(self, output_path: str) -> int:
		"""Export to Ghidra Python script"""
		lines = [
			"# Ghidra Python Script",
			f"# Generated for: {os.path.basename(self.rom.filepath)}",
			"#@category NES",
			"#@author CDL Tools",
			"",
			"from ghidra.program.model.symbol import SourceType",
			"from ghidra.program.model.listing import CodeUnit",
			"",
			"def create_label(addr, name):",
			"\taddress = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(addr)",
			"\tsymbolTable = currentProgram.getSymbolTable()",
			"\tsymbolTable.createLabel(address, name, SourceType.USER_DEFINED)",
			"",
			"def set_comment(addr, comment):",
			"\taddress = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(addr)",
			"\tlisting = currentProgram.getListing()",
			"\tcu = listing.getCodeUnitAt(address)",
			"\tif cu:",
			"\t\tcu.setComment(CodeUnit.EOL_COMMENT, comment)",
			"",
			"def main():",
		]

		count = 0

		# Add symbols
		if self.symbols:
			lines.append("\t# Add symbols")
			for symbol in sorted(self.symbols.symbols.values(), key=lambda s: s.address):
				lines.append(f'\tcreate_label({symbol.address:#06x}, "{symbol.name}")')
				if symbol.comment:
					comment_escaped = symbol.comment.replace('"', '\\"')
					lines.append(f'\tset_comment({symbol.address:#06x}, "{comment_escaped}")')
				count += 1

		lines.extend([
			"",
			"if __name__ == '__main__':",
			"\tmain()",
		])

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return count

	def export_ca65_config(self, output_path: str) -> int:
		"""Export to ca65 linker configuration"""
		lines = [
			"# ca65 Linker Configuration",
			f"# Generated for: {os.path.basename(self.rom.filepath)}",
			"",
			"MEMORY {",
			"\tZP:     start = $0000, size = $0100, type = rw;",
			"\tRAM:    start = $0200, size = $0600, type = rw;",
			"\tSRAM:   start = $6000, size = $2000, type = rw, optional = yes;",
		]

		# Add PRG banks
		for bank in range(self.rom.prg_banks):
			if bank == self.rom.prg_banks - 1:
				# Last bank is fixed at $C000
				lines.append(f"\tPRG{bank:02X}: start = $C000, size = $4000, type = ro, file = %O, fill = yes;")
			else:
				lines.append(f"\tPRG{bank:02X}: start = $8000, size = $4000, type = ro, file = %O, fill = yes;")

		# Add CHR banks
		for bank in range(self.rom.chr_banks):
			lines.append(f"\tCHR{bank:02X}: start = $0000, size = $2000, type = ro, file = %O, fill = yes;")

		lines.extend([
			"}",
			"",
			"SEGMENTS {",
			"\tZEROPAGE: load = ZP,  type = zp;",
			"\tBSS:      load = RAM, type = bss;",
		])

		# Add PRG segments
		for bank in range(self.rom.prg_banks):
			lines.append(f"\tCODE{bank:02X}:  load = PRG{bank:02X}, type = ro;")

		# Add CHR segments
		for bank in range(self.rom.chr_banks):
			lines.append(f"\tCHR{bank:02X}:   load = CHR{bank:02X}, type = ro;")

		lines.append("}")

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return self.rom.prg_banks + self.rom.chr_banks

	def export_wla_symbols(self, output_path: str) -> int:
		"""Export to WLA-DX symbol format"""
		lines = [
			"; WLA-DX Symbol File",
			f"; Generated for: {os.path.basename(self.rom.filepath)}",
			"",
			"[labels]",
		]

		count = 0

		if self.symbols:
			for symbol in sorted(self.symbols.symbols.values(), key=lambda s: (s.bank, s.address)):
				bank = max(0, symbol.bank)
				lines.append(f"{bank:02X}:{symbol.address:04X} {symbol.name}")
				count += 1

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return count

	def export_fceux_debug(self, output_dir: str, rom_name: str) -> Dict[str, int]:
		"""Export to FCEUX debug files"""
		os.makedirs(output_dir, exist_ok=True)
		result = {'nl': 0, 'cdl': 0}

		# Export NL files
		if self.symbols:
			by_bank: Dict[int, List[Symbol]] = {}
			ram_symbols = []

			for symbol in self.symbols.symbols.values():
				if symbol.address < 0x8000:
					ram_symbols.append(symbol)
				else:
					bank = max(0, symbol.bank)
					if bank not in by_bank:
						by_bank[bank] = []
					by_bank[bank].append(symbol)

			# RAM file
			if ram_symbols:
				ram_path = os.path.join(output_dir, f"{rom_name}.nes.ram.nl")
				with open(ram_path, 'w', encoding='utf-8', newline='\n') as f:
					f.write("; RAM Labels\n")
					for sym in sorted(ram_symbols, key=lambda s: s.address):
						f.write(f"${sym.address:04X}#{sym.name}#{sym.comment}\n")
				result['nl'] += len(ram_symbols)

			# Bank files
			for bank, symbols in by_bank.items():
				bank_path = os.path.join(output_dir, f"{rom_name}.nes.{bank}.nl")
				with open(bank_path, 'w', encoding='utf-8', newline='\n') as f:
					f.write(f"; Bank {bank} Labels\n")
					for sym in sorted(symbols, key=lambda s: s.address):
						f.write(f"${sym.address:04X}#{sym.name}#{sym.comment}\n")
				result['nl'] += len(symbols)

		return result

	def export_mesen_debug(self, output_path: str) -> int:
		"""Export to Mesen MLB format"""
		lines = ["; Mesen Label File", f"; Generated for: {os.path.basename(self.rom.filepath)}", ""]

		count = 0

		if self.symbols:
			for symbol in sorted(self.symbols.symbols.values(), key=lambda s: (s.bank, s.address)):
				prefix = 'P' if symbol.is_code else 'R'
				if symbol.bank >= 0:
					lines.append(f"{prefix}:{symbol.bank:02X}:{symbol.address:04X}:{symbol.name}:{symbol.comment}")
				else:
					lines.append(f"{prefix}:{symbol.address:04X}:{symbol.name}:{symbol.comment}")
				count += 1

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines) + '\n')

		return count

	def generate_disassembly_info(self, output_path: str) -> int:
		"""Generate a JSON file with disassembly information"""
		info = {
			'rom': {
				'name': os.path.basename(self.rom.filepath),
				'prg_size': self.rom.prg_size,
				'chr_size': self.rom.chr_size,
				'prg_banks': self.rom.prg_banks,
				'chr_banks': self.rom.chr_banks,
				'mapper': self.rom.mapper,
			},
			'regions': [],
			'symbols': [],
		}

		# Add CDL regions
		if self.cdl:
			regions = self.cdl.get_regions(self.rom.prg_size)
			for region in regions:
				info['regions'].append({
					'start': region.start,
					'end': region.end,
					'type': region.region_type.value,
				})

		# Add symbols
		if self.symbols:
			for symbol in sorted(self.symbols.symbols.values(), key=lambda s: s.address):
				info['symbols'].append({
					'address': symbol.address,
					'name': symbol.name,
					'bank': symbol.bank,
					'comment': symbol.comment,
					'is_code': symbol.is_code,
				})

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(info, f, indent='\t')

		return len(info['symbols'])


def main():
	parser = argparse.ArgumentParser(
		description='Disassembly Exporter',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	parser.add_argument('rom', help='ROM file')
	parser.add_argument('--cdl', help='CDL file')
	parser.add_argument('--labels', '-l', help='Label file (MLB or NL)')
	parser.add_argument('--output', '-o', required=True, help='Output file/directory')
	parser.add_argument('--format', '-f', required=True,
						choices=['ida', 'ghidra', 'ca65', 'wla', 'fceux', 'mesen', 'json'],
						help='Output format')
	parser.add_argument('--rom-name', help='ROM name for output files')

	args = parser.parse_args()

	# Load ROM
	rom = ROMInfo(args.rom)
	print(f"Loaded ROM: {args.rom}")
	print(f"  PRG: {rom.prg_size // 1024}KB ({rom.prg_banks} banks)")
	print(f"  CHR: {rom.chr_size // 1024}KB ({rom.chr_banks} banks)")
	print(f"  Mapper: {rom.mapper}")

	# Load CDL if provided
	cdl = None
	if args.cdl:
		cdl = CDLData(args.cdl)
		print(f"Loaded CDL: {args.cdl}")

	# Load labels if provided
	symbols = None
	if args.labels:
		symbols = SymbolData(args.labels)
		print(f"Loaded {len(symbols.symbols)} symbols from {args.labels}")

	# Create exporter
	exporter = DisassemblyExporter(rom, cdl, symbols)

	# Export
	rom_name = args.rom_name or os.path.splitext(os.path.basename(args.rom))[0]

	if args.format == 'ida':
		count = exporter.export_ida_idc(args.output)
		print(f"Exported {count} items to IDA IDC script: {args.output}")

	elif args.format == 'ghidra':
		count = exporter.export_ghidra_script(args.output)
		print(f"Exported {count} items to Ghidra script: {args.output}")

	elif args.format == 'ca65':
		count = exporter.export_ca65_config(args.output)
		print(f"Exported ca65 config with {count} segments: {args.output}")

	elif args.format == 'wla':
		count = exporter.export_wla_symbols(args.output)
		print(f"Exported {count} symbols to WLA format: {args.output}")

	elif args.format == 'fceux':
		result = exporter.export_fceux_debug(args.output, rom_name)
		print(f"Exported {result['nl']} labels to FCEUX debug files: {args.output}")

	elif args.format == 'mesen':
		count = exporter.export_mesen_debug(args.output)
		print(f"Exported {count} labels to Mesen MLB: {args.output}")

	elif args.format == 'json':
		count = exporter.generate_disassembly_info(args.output)
		print(f"Exported disassembly info with {count} symbols: {args.output}")


if __name__ == '__main__':
	main()
