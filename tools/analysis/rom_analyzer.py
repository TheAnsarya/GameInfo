#!/usr/bin/env python3
"""
ROM Analysis Tool

Analyzes NES ROMs using CDL data to identify and label code/data regions.
Generates debug labels for Mesen (MLB) and FCEUX (NL) formats.

C# equivalent: GameInfoTools.Analysis.RomAnalyzer

Features:
- Auto-detect function boundaries from CDL
- Identify data tables and their types
- Generate labels with heuristic naming
- Cross-reference with existing label files
- Export to multiple formats

Usage:
	python rom_analyzer.py <rom_file> --cdl <cdl_file> [options]
	python rom_analyzer.py <rom_file> --cdl <cdl_file> --output labels.mlb
	python rom_analyzer.py <rom_file> --cdl <cdl_file> --format nl
"""

import argparse
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import BinaryIO, Dict, List, Optional, Set, Tuple


class LabelType(Enum):
	"""Types of labels"""
	UNKNOWN = "unknown"
	SUBROUTINE = "sub"
	JUMP_TARGET = "loc"
	DATA_BYTE = "byte"
	DATA_WORD = "word"
	DATA_TABLE = "tbl"
	STRING = "str"
	POINTER_TABLE = "ptr"
	VECTOR = "vec"


@dataclass
class Label:
	"""Represents a debug label"""
	address: int
	name: str
	label_type: LabelType
	comment: str = ""
	bank: int = -1
	size: int = 1
	references: List[int] = field(default_factory=list)

	def __str__(self) -> str:
		return f"${self.address:04X}: {self.name} ({self.label_type.value})"


@dataclass
class CodeRegion:
	"""A region of code in the ROM"""
	start: int
	end: int
	entry_points: List[int] = field(default_factory=list)
	exit_points: List[int] = field(default_factory=list)

	@property
	def size(self) -> int:
		return self.end - self.start + 1


@dataclass
class DataRegion:
	"""A region of data in the ROM"""
	start: int
	end: int
	data_type: str = "byte"  # byte, word, pointer, string
	references: List[int] = field(default_factory=list)

	@property
	def size(self) -> int:
		return self.end - self.start + 1


class NESAnalyzer:
	"""Analyzes NES ROMs with CDL data"""

	# 6502 opcode information
	OPCODES = {
		# BRK, ORA, etc - focusing on branch/jump/return opcodes
		0x00: ('BRK', 1, 'implicit'),
		0x10: ('BPL', 2, 'relative'),
		0x20: ('JSR', 3, 'absolute'),
		0x30: ('BMI', 2, 'relative'),
		0x40: ('RTI', 1, 'implicit'),
		0x4C: ('JMP', 3, 'absolute'),
		0x50: ('BVC', 2, 'relative'),
		0x60: ('RTS', 1, 'implicit'),
		0x6C: ('JMP', 3, 'indirect'),
		0x70: ('BVS', 2, 'relative'),
		0x90: ('BCC', 2, 'relative'),
		0xB0: ('BCS', 2, 'relative'),
		0xD0: ('BNE', 2, 'relative'),
		0xF0: ('BEQ', 2, 'relative'),
	}

	# Common vector names
	VECTORS = {
		0xFFFA: 'NMI_Vector',
		0xFFFC: 'Reset_Vector',
		0xFFFE: 'IRQ_Vector',
	}

	def __init__(self, rom_path: str, cdl_path: Optional[str] = None):
		self.rom_path = rom_path
		self.cdl_path = cdl_path

		# Load ROM
		with open(rom_path, 'rb') as f:
			self.rom_data = f.read()

		# Parse iNES header
		self._parse_header()

		# Load CDL if provided
		self.cdl_data: Optional[bytearray] = None
		if cdl_path:
			with open(cdl_path, 'rb') as f:
				self.cdl_data = bytearray(f.read())

		# Analysis results
		self.labels: Dict[int, Label] = {}
		self.code_regions: List[CodeRegion] = []
		self.data_regions: List[DataRegion] = []
		self.jump_targets: Set[int] = set()
		self.call_targets: Set[int] = set()

	def _parse_header(self) -> None:
		"""Parse iNES header"""
		if self.rom_data[:4] != b'NES\x1a':
			raise ValueError("Not a valid NES ROM (missing iNES header)")

		self.prg_banks = self.rom_data[4]
		self.chr_banks = self.rom_data[5]
		self.mapper = (self.rom_data[6] >> 4) | (self.rom_data[7] & 0xF0)
		self.prg_size = self.prg_banks * 16384
		self.chr_size = self.chr_banks * 8192
		self.header_size = 16

		# Check for trainer
		if self.rom_data[6] & 0x04:
			self.header_size += 512

	def prg_offset_to_address(self, offset: int, bank: int = -1) -> int:
		"""Convert PRG ROM offset to CPU address"""
		if self.prg_size <= 32768:
			# Small ROM - mapped to $8000-$FFFF
			return 0x8000 + offset
		else:
			# Bank-switched - assume last bank at $C000
			bank_size = 16384
			if bank < 0:
				bank = offset // bank_size
			offset_in_bank = offset % bank_size

			# Last bank is usually fixed at $C000
			if bank == self.prg_banks - 1:
				return 0xC000 + offset_in_bank
			else:
				return 0x8000 + offset_in_bank

	def address_to_prg_offset(self, address: int, bank: int = 0) -> int:
		"""Convert CPU address to PRG ROM offset"""
		if address < 0x8000:
			return -1

		if self.prg_size <= 32768:
			return address - 0x8000
		else:
			bank_size = 16384
			if address >= 0xC000:
				# Fixed bank (last bank)
				return (self.prg_banks - 1) * bank_size + (address - 0xC000)
			else:
				return bank * bank_size + (address - 0x8000)

	def get_prg_byte(self, offset: int) -> int:
		"""Get a byte from PRG ROM"""
		return self.rom_data[self.header_size + offset]

	def get_prg_word(self, offset: int) -> int:
		"""Get a 16-bit word from PRG ROM (little-endian)"""
		lo = self.get_prg_byte(offset)
		hi = self.get_prg_byte(offset + 1)
		return (hi << 8) | lo

	def analyze(self) -> None:
		"""Perform full analysis"""
		print(f"Analyzing ROM: {os.path.basename(self.rom_path)}")
		print(f"PRG Size: {self.prg_size // 1024}KB ({self.prg_banks} banks)")
		print(f"CHR Size: {self.chr_size // 1024}KB")
		print(f"Mapper: {self.mapper}")
		print()

		# Analyze vectors first
		self._analyze_vectors()

		# Use CDL data if available
		if self.cdl_data:
			self._analyze_with_cdl()
		else:
			self._analyze_without_cdl()

		# Post-process
		self._identify_data_patterns()
		self._generate_label_names()

		print(f"Found {len(self.labels)} labels")
		print(f"  Subroutines: {sum(1 for l in self.labels.values() if l.label_type == LabelType.SUBROUTINE)}")
		print(f"  Jump targets: {sum(1 for l in self.labels.values() if l.label_type == LabelType.JUMP_TARGET)}")
		print(f"  Data tables: {sum(1 for l in self.labels.values() if l.label_type == LabelType.DATA_TABLE)}")

	def _analyze_vectors(self) -> None:
		"""Analyze interrupt vectors"""
		# NMI, Reset, IRQ vectors at end of PRG
		vector_offset = self.prg_size - 6

		for vec_addr, vec_name in self.VECTORS.items():
			offset = self.address_to_prg_offset(vec_addr)
			if 0 <= offset < self.prg_size - 1:
				target = self.get_prg_word(offset)

				# Add vector label
				self.labels[vec_addr] = Label(
					address=vec_addr,
					name=vec_name,
					label_type=LabelType.VECTOR,
					comment=f"Points to ${target:04X}"
				)

				# Add target as subroutine
				if 0x8000 <= target <= 0xFFFF:
					if target not in self.labels:
						name = vec_name.replace('_Vector', '')
						self.labels[target] = Label(
							address=target,
							name=name,
							label_type=LabelType.SUBROUTINE,
							comment=f"Entry point from {vec_name}"
						)
					self.call_targets.add(target)

	def _analyze_with_cdl(self) -> None:
		"""Analyze ROM using CDL data"""
		print("Using CDL data for analysis...")

		# Find code regions from CDL
		in_code = False
		code_start = 0

		for offset in range(len(self.cdl_data)):
			is_code = bool(self.cdl_data[offset] & 0x01)

			if is_code and not in_code:
				code_start = offset
				in_code = True
			elif not is_code and in_code:
				# End of code region
				self.code_regions.append(CodeRegion(
					start=code_start,
					end=offset - 1
				))
				in_code = False

		if in_code:
			self.code_regions.append(CodeRegion(
				start=code_start,
				end=len(self.cdl_data) - 1
			))

		# Analyze each code region
		for region in self.code_regions:
			self._analyze_code_region(region)

		# Find data regions
		in_data = False
		data_start = 0

		for offset in range(len(self.cdl_data)):
			is_data = bool(self.cdl_data[offset] & 0x02) and not bool(self.cdl_data[offset] & 0x01)

			if is_data and not in_data:
				data_start = offset
				in_data = True
			elif not is_data and in_data:
				self.data_regions.append(DataRegion(
					start=data_start,
					end=offset - 1
				))
				in_data = False

		if in_data:
			self.data_regions.append(DataRegion(
				start=data_start,
				end=len(self.cdl_data) - 1
			))

	def _analyze_without_cdl(self) -> None:
		"""Analyze ROM without CDL data (basic heuristics)"""
		print("No CDL data - using heuristic analysis...")

		# Start from known entry points (vectors)
		work_queue = list(self.call_targets)
		visited = set()

		while work_queue:
			addr = work_queue.pop(0)
			if addr in visited:
				continue
			if addr < 0x8000 or addr > 0xFFFF:
				continue

			visited.add(addr)

			offset = self.address_to_prg_offset(addr)
			if offset < 0 or offset >= self.prg_size:
				continue

			# Trace instructions
			current = offset
			while current < self.prg_size:
				opcode = self.get_prg_byte(current)

				if opcode in self.OPCODES:
					mnemonic, size, mode = self.OPCODES[opcode]

					if mnemonic == 'JSR':
						# Subroutine call
						target = self.get_prg_word(current + 1)
						self.call_targets.add(target)
						if target not in visited:
							work_queue.append(target)

					elif mnemonic == 'JMP':
						if mode == 'absolute':
							target = self.get_prg_word(current + 1)
							self.jump_targets.add(target)
							if target not in visited:
								work_queue.append(target)
						# Stop tracing after unconditional jump
						break

					elif mode == 'relative':
						# Branch instruction
						offset_byte = self.get_prg_byte(current + 1)
						if offset_byte >= 0x80:
							offset_byte = offset_byte - 256
						target = self.prg_offset_to_address(current + 2 + offset_byte)
						self.jump_targets.add(target)

					elif mnemonic in ('RTS', 'RTI', 'BRK'):
						# End of subroutine
						break

					current += size
				else:
					# Unknown opcode - might be data
					break

		# Create labels for found targets
		for addr in self.call_targets:
			if addr not in self.labels:
				self.labels[addr] = Label(
					address=addr,
					name=f"sub_{addr:04X}",
					label_type=LabelType.SUBROUTINE
				)

		for addr in self.jump_targets:
			if addr not in self.labels:
				self.labels[addr] = Label(
					address=addr,
					name=f"loc_{addr:04X}",
					label_type=LabelType.JUMP_TARGET
				)

	def _analyze_code_region(self, region: CodeRegion) -> None:
		"""Analyze a code region to find subroutines and branches"""
		current = region.start

		while current <= region.end:
			opcode = self.get_prg_byte(current)

			if opcode in self.OPCODES:
				mnemonic, size, mode = self.OPCODES[opcode]
				addr = self.prg_offset_to_address(current)

				# Check if this is a subroutine entry
				if current == region.start or self.cdl_data[current] & 0x28:
					# Entry point or indirect jump target
					if addr not in self.labels:
						self.labels[addr] = Label(
							address=addr,
							name=f"sub_{addr:04X}",
							label_type=LabelType.SUBROUTINE
						)
					self.call_targets.add(addr)

				if mnemonic == 'JSR' and current + 2 <= region.end:
					target = self.get_prg_word(current + 1)
					self.call_targets.add(target)
					if target not in self.labels:
						self.labels[target] = Label(
							address=target,
							name=f"sub_{target:04X}",
							label_type=LabelType.SUBROUTINE
						)

				elif mnemonic == 'JMP' and mode == 'absolute':
					target = self.get_prg_word(current + 1)
					self.jump_targets.add(target)
					if target not in self.labels:
						self.labels[target] = Label(
							address=target,
							name=f"loc_{target:04X}",
							label_type=LabelType.JUMP_TARGET
						)

				elif mode == 'relative':
					offset_byte = self.get_prg_byte(current + 1)
					if offset_byte >= 0x80:
						offset_byte = offset_byte - 256
					target = self.prg_offset_to_address(current + 2 + offset_byte)
					self.jump_targets.add(target)
					if target not in self.labels:
						self.labels[target] = Label(
							address=target,
							name=f"loc_{target:04X}",
							label_type=LabelType.JUMP_TARGET
						)

				current += size
			else:
				current += 1

	def _identify_data_patterns(self) -> None:
		"""Identify patterns in data regions"""
		for region in self.data_regions:
			addr = self.prg_offset_to_address(region.start)

			# Check for pointer table (sequences of valid addresses)
			if self._looks_like_pointer_table(region.start, region.end):
				if addr not in self.labels:
					self.labels[addr] = Label(
						address=addr,
						name=f"ptr_tbl_{addr:04X}",
						label_type=LabelType.POINTER_TABLE,
						size=region.size
					)
				region.data_type = "pointer"

			# Check for text
			elif self._looks_like_text(region.start, region.end):
				if addr not in self.labels:
					self.labels[addr] = Label(
						address=addr,
						name=f"str_{addr:04X}",
						label_type=LabelType.STRING,
						size=region.size
					)
				region.data_type = "string"

			# Default to byte data
			else:
				if addr not in self.labels and region.size >= 8:
					self.labels[addr] = Label(
						address=addr,
						name=f"data_{addr:04X}",
						label_type=LabelType.DATA_TABLE,
						size=region.size
					)

	def _looks_like_pointer_table(self, start: int, end: int) -> bool:
		"""Check if region looks like a pointer table"""
		if (end - start + 1) < 4 or (end - start + 1) % 2 != 0:
			return False

		valid_pointers = 0
		total_pointers = (end - start + 1) // 2

		for i in range(start, end, 2):
			word = self.get_prg_word(i)
			if 0x8000 <= word <= 0xFFFF:
				valid_pointers += 1

		return valid_pointers >= total_pointers * 0.7

	def _looks_like_text(self, start: int, end: int) -> bool:
		"""Check if region looks like text data"""
		printable = 0
		total = end - start + 1

		for i in range(start, end + 1):
			byte = self.get_prg_byte(i)
			# Common text range or control characters
			if 0x20 <= byte <= 0x7E or byte in (0x00, 0x0A, 0x0D):
				printable += 1

		return printable >= total * 0.8

	def _generate_label_names(self) -> None:
		"""Generate meaningful names for labels"""
		# Group subroutines by address range
		subs_by_bank: Dict[int, List[Label]] = {}

		for label in self.labels.values():
			if label.label_type == LabelType.SUBROUTINE:
				bank = (label.address - 0x8000) // 0x4000
				if bank not in subs_by_bank:
					subs_by_bank[bank] = []
				subs_by_bank[bank].append(label)

		# Number subroutines within each bank
		for bank, subs in subs_by_bank.items():
			subs.sort(key=lambda l: l.address)
			for i, sub in enumerate(subs):
				if sub.name.startswith('sub_'):
					sub.name = f"Sub_{bank:02X}_{i:03X}"

	def export_mlb(self, output_path: str) -> None:
		"""Export labels to Mesen MLB format"""
		lines = [
			"; Mesen Label File",
			f"; Generated from: {os.path.basename(self.rom_path)}",
			f"; CDL: {os.path.basename(self.cdl_path) if self.cdl_path else 'None'}",
			"",
		]

		# Sort labels by address
		sorted_labels = sorted(self.labels.values(), key=lambda l: l.address)

		current_section = None
		for label in sorted_labels:
			# Determine section
			if label.address >= 0x8000:
				section = "PRG ROM"
				prefix = "P"
			elif label.address >= 0x6000:
				section = "SRAM"
				prefix = "S"
			elif label.address >= 0x2000:
				section = "Registers"
				prefix = "G"
			else:
				section = "RAM"
				prefix = "R"

			if section != current_section:
				lines.append(f"\n; {section}")
				current_section = section

			comment = label.comment or ""
			if label.bank >= 0:
				lines.append(f"{prefix}:{label.bank:02X}:{label.address:04X}:{label.name}:{comment}")
			else:
				lines.append(f"{prefix}:{label.address:04X}:{label.name}:{comment}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported {len(self.labels)} labels to {output_path}")

	def export_nl(self, output_path: str) -> None:
		"""Export labels to FCEUX NL format"""
		# Group by file type
		ram_labels = []
		rom_labels = []

		for label in sorted(self.labels.values(), key=lambda l: l.address):
			if label.address < 0x0800:
				ram_labels.append(label)
			elif label.address >= 0x8000:
				rom_labels.append(label)

		# Write RAM labels
		if ram_labels:
			ram_path = output_path.replace('.nl', '.ram.nl')
			with open(ram_path, 'w') as f:
				f.write("; RAM Labels\n")
				for label in ram_labels:
					comment = label.comment or ""
					f.write(f"${label.address:04X}#{label.name}#{comment}\n")
			print(f"Exported {len(ram_labels)} RAM labels to {ram_path}")

		# Write ROM labels (bank 0)
		if rom_labels:
			rom_path = output_path.replace('.nl', '.0.nl')
			with open(rom_path, 'w') as f:
				f.write("; ROM Labels (Bank 0)\n")
				for label in rom_labels:
					comment = label.comment or ""
					f.write(f"${label.address:04X}#{label.name}#{comment}\n")
			print(f"Exported {len(rom_labels)} ROM labels to {rom_path}")

	def export_asm(self, output_path: str) -> None:
		"""Export labels as assembly include file"""
		lines = [
			"; Symbol definitions",
			f"; Generated from: {os.path.basename(self.rom_path)}",
			"",
		]

		for label in sorted(self.labels.values(), key=lambda l: l.address):
			# Skip labels that look like auto-generated
			if re.match(r'^(sub|loc|data)_[0-9A-F]+$', label.name):
				continue

			lines.append(f"{label.name} = ${label.address:04X}")

		with open(output_path, 'w') as f:
			f.write('\n'.join(lines))

		print(f"Exported to {output_path}")


def main():
	parser = argparse.ArgumentParser(description='ROM Analysis Tool')
	parser.add_argument('rom', help='NES ROM file')
	parser.add_argument('--cdl', help='CDL file for analysis hints')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--format', '-f', choices=['mlb', 'nl', 'asm'], default='mlb',
						help='Output format')
	parser.add_argument('--verbose', '-v', action='store_true', help='Verbose output')

	args = parser.parse_args()

	# Analyze
	analyzer = NESAnalyzer(args.rom, args.cdl)
	analyzer.analyze()

	# Export
	if args.output:
		output_path = args.output
	else:
		base = os.path.splitext(args.rom)[0]
		output_path = f"{base}.{args.format}"

	if args.format == 'mlb':
		analyzer.export_mlb(output_path)
	elif args.format == 'nl':
		analyzer.export_nl(output_path)
	elif args.format == 'asm':
		analyzer.export_asm(output_path)


if __name__ == '__main__':
	main()
