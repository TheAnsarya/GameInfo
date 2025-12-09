#!/usr/bin/env python3
"""
Bank Conflict Analyzer - Detect and resolve mapper bank conflicts

Analyzes ROM usage to find:
- Bank boundary issues
- Code/data crossing bank boundaries
- Overlapping bank allocations
- Unused space in banks
- Optimal bank organization suggestions

Supports common mappers:
- NES: NROM, MMC1, MMC3, MMC5, etc.
- SNES: LoROM, HiROM, ExLoROM, ExHiROM
- Genesis: Standard banking
"""

import argparse
import json
import os
import re
import struct
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class MapperType(Enum):
	"""ROM mapper types"""
	# NES mappers
	NROM = "nrom"
	MMC1 = "mmc1"
	MMC3 = "mmc3"
	MMC5 = "mmc5"
	UNROM = "unrom"
	CNROM = "cnrom"

	# SNES mappers
	LOROM = "lorom"
	HIROM = "hirom"
	EXLOROM = "exlorom"
	EXHIROM = "exhirom"
	SA1 = "sa1"

	# Genesis
	GENESIS = "genesis"

	UNKNOWN = "unknown"


@dataclass
class BankInfo:
	"""Information about a ROM bank"""
	bank_number: int
	start_offset: int  # File offset
	end_offset: int
	size: int
	mapper: MapperType
	cpu_start: int = 0  # CPU address when mapped
	cpu_end: int = 0
	used_bytes: int = 0
	free_bytes: int = 0
	usage_map: bytes = field(default_factory=bytes)  # 1 = used, 0 = free
	labels: list = field(default_factory=list)
	entry_points: list = field(default_factory=list)


@dataclass
class ConflictReport:
	"""Bank conflict information"""
	conflict_type: str
	bank_a: int
	bank_b: Optional[int] = None
	address: Optional[int] = None
	description: str = ""
	severity: str = "warning"  # info, warning, error


@dataclass
class CrossingInfo:
	"""Information about code/data crossing bank boundary"""
	start_bank: int
	end_bank: int
	start_address: int
	end_address: int
	crossing_type: str  # code, data, pointer
	context: str = ""


class ROMAnalyzer:
	"""Analyze ROM structure and bank usage"""

	# NES iNES header
	INES_SIGNATURE = b'NES\x1a'

	# SNES header locations (relative to ROM start, no header)
	SNES_HEADER_LOROM = 0x7fb0
	SNES_HEADER_HIROM = 0xffb0

	def __init__(self, rom_path: str):
		self.rom_path = rom_path
		self.rom_data = self._load_rom()
		self.header_size = 0
		self.mapper = MapperType.UNKNOWN
		self.banks = []
		self.prg_size = 0
		self.chr_size = 0

	def _load_rom(self) -> bytes:
		"""Load ROM file"""
		with open(self.rom_path, 'rb') as f:
			return f.read()

	def detect_platform_and_mapper(self) -> MapperType:
		"""Auto-detect ROM platform and mapper type"""
		# Check for iNES header
		if self.rom_data[:4] == self.INES_SIGNATURE:
			return self._detect_nes_mapper()

		# Check for SNES
		if len(self.rom_data) >= 0x8000:
			if self._check_snes_header(self.SNES_HEADER_LOROM):
				return MapperType.LOROM
			if self._check_snes_header(self.SNES_HEADER_HIROM):
				return MapperType.HIROM

		# Check for Genesis
		if len(self.rom_data) >= 0x200:
			if b'SEGA' in self.rom_data[0x100:0x120]:
				return MapperType.GENESIS

		return MapperType.UNKNOWN

	def _detect_nes_mapper(self) -> MapperType:
		"""Detect NES mapper from iNES header"""
		if len(self.rom_data) < 16:
			return MapperType.UNKNOWN

		self.header_size = 16
		self.prg_size = self.rom_data[4] * 16384
		self.chr_size = self.rom_data[5] * 8192

		mapper_lo = (self.rom_data[6] >> 4) & 0x0f
		mapper_hi = self.rom_data[7] & 0xf0
		mapper_num = mapper_hi | mapper_lo

		mapper_map = {
			0: MapperType.NROM,
			1: MapperType.MMC1,
			2: MapperType.UNROM,
			3: MapperType.CNROM,
			4: MapperType.MMC3,
			5: MapperType.MMC5,
		}

		return mapper_map.get(mapper_num, MapperType.UNKNOWN)

	def _check_snes_header(self, offset: int) -> bool:
		"""Check if valid SNES header exists at offset"""
		if len(self.rom_data) < offset + 0x40:
			return False

		# Check for valid checksum complement
		checksum = struct.unpack('<H', self.rom_data[offset + 0x2e:offset + 0x30])[0]
		complement = struct.unpack('<H', self.rom_data[offset + 0x2c:offset + 0x2e])[0]

		return (checksum ^ complement) == 0xffff

	def analyze_banks(self) -> list:
		"""Analyze all banks in ROM"""
		self.mapper = self.detect_platform_and_mapper()
		self.banks = []

		if self.mapper in (MapperType.NROM, MapperType.MMC1, MapperType.MMC3,
						  MapperType.MMC5, MapperType.UNROM, MapperType.CNROM):
			self._analyze_nes_banks()
		elif self.mapper in (MapperType.LOROM, MapperType.HIROM,
							MapperType.EXLOROM, MapperType.EXHIROM):
			self._analyze_snes_banks()
		elif self.mapper == MapperType.GENESIS:
			self._analyze_genesis_banks()

		return self.banks

	def _analyze_nes_banks(self):
		"""Analyze NES PRG ROM banks"""
		bank_size = 16384 if self.mapper != MapperType.UNROM else 16384
		if self.mapper == MapperType.NROM and self.prg_size <= 16384:
			bank_size = self.prg_size

		num_banks = self.prg_size // bank_size

		for i in range(num_banks):
			start = self.header_size + (i * bank_size)
			end = start + bank_size

			# CPU address mapping
			if num_banks == 1:
				cpu_start = 0xc000
			else:
				cpu_start = 0x8000 if i < num_banks - 1 else 0xc000
			cpu_end = cpu_start + bank_size - 1

			bank = BankInfo(
				bank_number=i,
				start_offset=start,
				end_offset=end,
				size=bank_size,
				mapper=self.mapper,
				cpu_start=cpu_start,
				cpu_end=cpu_end
			)

			# Analyze usage
			self._analyze_bank_usage(bank)
			self.banks.append(bank)

	def _analyze_snes_banks(self):
		"""Analyze SNES ROM banks"""
		bank_size = 0x8000 if self.mapper == MapperType.LOROM else 0x10000
		num_banks = len(self.rom_data) // bank_size

		for i in range(num_banks):
			start = i * bank_size
			end = start + bank_size

			# CPU address mapping varies by mapper and bank
			if self.mapper == MapperType.LOROM:
				cpu_bank = i * 2
				cpu_start = (cpu_bank << 16) | 0x8000
			else:
				cpu_start = (i << 16) | 0x0000

			cpu_end = cpu_start + bank_size - 1

			bank = BankInfo(
				bank_number=i,
				start_offset=start,
				end_offset=min(end, len(self.rom_data)),
				size=min(bank_size, len(self.rom_data) - start),
				mapper=self.mapper,
				cpu_start=cpu_start,
				cpu_end=cpu_end
			)

			self._analyze_bank_usage(bank)
			self.banks.append(bank)

	def _analyze_genesis_banks(self):
		"""Analyze Genesis ROM banks"""
		bank_size = 0x80000  # 512KB banks
		num_banks = (len(self.rom_data) + bank_size - 1) // bank_size

		for i in range(num_banks):
			start = i * bank_size
			end = min(start + bank_size, len(self.rom_data))

			bank = BankInfo(
				bank_number=i,
				start_offset=start,
				end_offset=end,
				size=end - start,
				mapper=self.mapper,
				cpu_start=0x000000,  # Mapped at 0x000000 when selected
				cpu_end=0x3fffff
			)

			self._analyze_bank_usage(bank)
			self.banks.append(bank)

	def _analyze_bank_usage(self, bank: BankInfo):
		"""Analyze how a bank's space is used"""
		bank_data = self.rom_data[bank.start_offset:bank.end_offset]

		# Count free bytes (typically $ff for erased flash/EPROM)
		free_count = bank_data.count(b'\xff')
		# Also check for $00 padding
		zero_count = bank_data.count(b'\x00')

		# Heuristic: if > 50% is $ff or trailing $ff, consider those free
		trailing_ff = 0
		for byte in reversed(bank_data):
			if byte == 0xff:
				trailing_ff += 1
			else:
				break

		bank.free_bytes = trailing_ff
		bank.used_bytes = bank.size - trailing_ff


class ConflictDetector:
	"""Detect bank conflicts and issues"""

	def __init__(self, rom_analyzer: ROMAnalyzer):
		self.analyzer = rom_analyzer
		self.conflicts = []

	def detect_all_conflicts(self) -> list:
		"""Run all conflict detection checks"""
		self.conflicts = []

		self._check_bank_overflow()
		self._check_pointer_crossings()
		self._check_unused_space()
		self._check_alignment_issues()

		return self.conflicts

	def _check_bank_overflow(self):
		"""Check for data potentially overflowing bank boundaries"""
		for bank in self.analyzer.banks:
			# Check if bank is nearly full
			usage_percent = (bank.used_bytes / bank.size) * 100 if bank.size > 0 else 0

			if usage_percent > 95:
				self.conflicts.append(ConflictReport(
					conflict_type="near_overflow",
					bank_a=bank.bank_number,
					description=f"Bank {bank.bank_number} is {usage_percent:.1f}% full "
							   f"({bank.used_bytes}/{bank.size} bytes)",
					severity="warning"
				))

			if usage_percent == 100:
				self.conflicts.append(ConflictReport(
					conflict_type="potential_overflow",
					bank_a=bank.bank_number,
					description=f"Bank {bank.bank_number} is completely full - "
							   "check for overflow into next bank",
					severity="error"
				))

	def _check_pointer_crossings(self):
		"""Check for pointers that might cross bank boundaries"""
		rom_data = self.analyzer.rom_data
		header_size = self.analyzer.header_size

		for bank in self.analyzer.banks:
			bank_data = rom_data[bank.start_offset:bank.end_offset]

			# Look for 16-bit pointer patterns near bank boundary
			boundary_region_start = max(0, bank.size - 256)

			for i in range(boundary_region_start, bank.size - 1):
				# Check for pointer-like values
				ptr = bank_data[i] | (bank_data[i + 1] << 8)

				# If pointer appears to reference past bank boundary
				if bank.cpu_start <= ptr <= bank.cpu_end + 0x100:
					if ptr > bank.cpu_end:
						self.conflicts.append(ConflictReport(
							conflict_type="boundary_pointer",
							bank_a=bank.bank_number,
							address=bank.start_offset + i,
							description=f"Possible pointer ${ptr:04x} at offset "
									   f"${bank.start_offset + i:06x} may cross bank boundary",
							severity="info"
						))

	def _check_unused_space(self):
		"""Check for fragmented or wasted space"""
		total_free = sum(b.free_bytes for b in self.analyzer.banks)
		total_size = sum(b.size for b in self.analyzer.banks)

		for bank in self.analyzer.banks:
			free_percent = (bank.free_bytes / bank.size) * 100 if bank.size > 0 else 0

			if 10 < free_percent < 50:
				self.conflicts.append(ConflictReport(
					conflict_type="fragmented_space",
					bank_a=bank.bank_number,
					description=f"Bank {bank.bank_number} has {bank.free_bytes} bytes "
							   f"({free_percent:.1f}%) unused - potential for optimization",
					severity="info"
				))

		# Overall fragmentation
		if total_size > 0:
			overall_free_percent = (total_free / total_size) * 100
			if overall_free_percent > 20:
				self.conflicts.append(ConflictReport(
					conflict_type="overall_fragmentation",
					bank_a=-1,
					description=f"ROM has {total_free:,} bytes ({overall_free_percent:.1f}%) "
							   f"total unused space across all banks",
					severity="info"
				))

	def _check_alignment_issues(self):
		"""Check for alignment problems"""
		for bank in self.analyzer.banks:
			# Check if bank size is power of 2
			if bank.size & (bank.size - 1) != 0:
				self.conflicts.append(ConflictReport(
					conflict_type="non_power_of_2",
					bank_a=bank.bank_number,
					description=f"Bank {bank.bank_number} size {bank.size} "
							   "is not a power of 2",
					severity="warning"
				))


class CodeAnalyzer:
	"""Analyze code for bank-related issues"""

	def __init__(self, rom_analyzer: ROMAnalyzer):
		self.analyzer = rom_analyzer

	def find_bank_crossings(self, labels_file: str = None) -> list:
		"""Find code that crosses bank boundaries"""
		crossings = []
		rom_data = self.analyzer.rom_data

		# Load labels if provided
		labels = {}
		if labels_file and os.path.exists(labels_file):
			labels = self._load_labels(labels_file)

		for i, bank in enumerate(self.analyzer.banks):
			if i >= len(self.analyzer.banks) - 1:
				continue

			next_bank = self.analyzer.banks[i + 1]

			# Check last bytes of bank for incomplete instructions
			bank_end = bank.end_offset
			if bank_end < len(rom_data):
				last_byte = rom_data[bank_end - 1]

				# Check for multi-byte instructions that might span banks
				# This is architecture-specific
				if self._is_multibyte_opcode(last_byte, self.analyzer.mapper):
					crossings.append(CrossingInfo(
						start_bank=bank.bank_number,
						end_bank=next_bank.bank_number,
						start_address=bank.cpu_end,
						end_address=next_bank.cpu_start,
						crossing_type="code",
						context=f"Possible incomplete instruction ${last_byte:02x} "
							   f"at bank boundary"
					))

		return crossings

	def _is_multibyte_opcode(self, opcode: int, mapper: MapperType) -> bool:
		"""Check if opcode is multi-byte (simplified)"""
		if mapper in (MapperType.NROM, MapperType.MMC1, MapperType.MMC3,
					 MapperType.MMC5, MapperType.UNROM, MapperType.CNROM):
			# 6502 multi-byte opcodes (simplified list)
			multibyte = {
				0x20, 0x4c, 0x6c,  # JSR, JMP
				0xad, 0xae, 0xac,  # LDA/LDX/LDY absolute
				0x8d, 0x8e, 0x8c,  # STA/STX/STY absolute
				0xcd, 0xcc, 0xec,  # CMP/CPY/CPX absolute
				# ... many more
			}
			return opcode in multibyte
		return False

	def _load_labels(self, labels_file: str) -> dict:
		"""Load labels from file"""
		labels = {}
		with open(labels_file, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				# Common formats: ADDR = LABEL or LABEL: EQU ADDR
				match = re.match(r'([0-9a-fA-F]+)\s*=?\s*(\w+)', line.strip())
				if match:
					addr = int(match.group(1), 16)
					name = match.group(2)
					labels[addr] = name
		return labels


def generate_report(analyzer: ROMAnalyzer, detector: ConflictDetector,
				   code_analyzer: CodeAnalyzer, format_type: str = 'text') -> str:
	"""Generate comprehensive bank analysis report"""
	if format_type == 'json':
		return _generate_json_report(analyzer, detector, code_analyzer)
	else:
		return _generate_text_report(analyzer, detector, code_analyzer)


def _generate_text_report(analyzer: ROMAnalyzer, detector: ConflictDetector,
						 code_analyzer: CodeAnalyzer) -> str:
	"""Generate text report"""
	lines = []
	lines.append("Bank Conflict Analysis Report")
	lines.append("=" * 60)
	lines.append("")

	# ROM Info
	lines.append(f"ROM File: {os.path.basename(analyzer.rom_path)}")
	lines.append(f"ROM Size: {len(analyzer.rom_data):,} bytes")
	lines.append(f"Mapper: {analyzer.mapper.value}")
	lines.append(f"Number of Banks: {len(analyzer.banks)}")
	lines.append("")

	# Bank Summary
	lines.append("Bank Summary:")
	lines.append("-" * 60)
	lines.append(f"{'Bank':>4} {'Offset':>10} {'Size':>8} {'Used':>8} {'Free':>8} {'Usage':>6}")
	lines.append("-" * 60)

	for bank in analyzer.banks:
		usage = (bank.used_bytes / bank.size) * 100 if bank.size > 0 else 0
		lines.append(f"{bank.bank_number:>4} "
					f"${bank.start_offset:>08x} "
					f"{bank.size:>8,} "
					f"{bank.used_bytes:>8,} "
					f"{bank.free_bytes:>8,} "
					f"{usage:>5.1f}%")

	lines.append("")

	# Conflicts
	conflicts = detector.detect_all_conflicts()
	if conflicts:
		lines.append("Detected Issues:")
		lines.append("-" * 60)

		# Group by severity
		errors = [c for c in conflicts if c.severity == 'error']
		warnings = [c for c in conflicts if c.severity == 'warning']
		infos = [c for c in conflicts if c.severity == 'info']

		for severity, group in [('ERRORS', errors), ('WARNINGS', warnings), ('INFO', infos)]:
			if group:
				lines.append(f"\n{severity}:")
				for conflict in group:
					lines.append(f"  [{conflict.conflict_type}] {conflict.description}")

	# Code crossings
	crossings = code_analyzer.find_bank_crossings()
	if crossings:
		lines.append("\nPotential Bank Boundary Crossings:")
		lines.append("-" * 60)
		for crossing in crossings:
			lines.append(f"  Bank {crossing.start_bank} -> {crossing.end_bank}: "
						f"{crossing.crossing_type} - {crossing.context}")

	return "\n".join(lines)


def _generate_json_report(analyzer: ROMAnalyzer, detector: ConflictDetector,
						 code_analyzer: CodeAnalyzer) -> str:
	"""Generate JSON report"""
	data = {
		'rom_info': {
			'file': os.path.basename(analyzer.rom_path),
			'size': len(analyzer.rom_data),
			'mapper': analyzer.mapper.value,
			'num_banks': len(analyzer.banks)
		},
		'banks': [],
		'conflicts': [],
		'crossings': []
	}

	for bank in analyzer.banks:
		data['banks'].append({
			'number': bank.bank_number,
			'offset': bank.start_offset,
			'size': bank.size,
			'used': bank.used_bytes,
			'free': bank.free_bytes,
			'cpu_start': bank.cpu_start,
			'cpu_end': bank.cpu_end
		})

	for conflict in detector.detect_all_conflicts():
		data['conflicts'].append({
			'type': conflict.conflict_type,
			'bank': conflict.bank_a,
			'severity': conflict.severity,
			'description': conflict.description
		})

	for crossing in code_analyzer.find_bank_crossings():
		data['crossings'].append({
			'start_bank': crossing.start_bank,
			'end_bank': crossing.end_bank,
			'type': crossing.crossing_type,
			'context': crossing.context
		})

	return json.dumps(data, indent=2)


def main():
	parser = argparse.ArgumentParser(
		description='Analyze ROM bank usage and detect conflicts'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Full bank analysis')
	analyze_parser.add_argument('rom', help='ROM file to analyze')
	analyze_parser.add_argument('--labels', help='Labels file for better analysis')
	analyze_parser.add_argument('--format', choices=['text', 'json'], default='text')
	analyze_parser.add_argument('-o', '--output', help='Output file')

	# Banks command
	banks_parser = subparsers.add_parser('banks', help='List banks')
	banks_parser.add_argument('rom', help='ROM file to analyze')

	# Check command
	check_parser = subparsers.add_parser('check', help='Check for conflicts')
	check_parser.add_argument('rom', help='ROM file to analyze')
	check_parser.add_argument('--severity', choices=['all', 'error', 'warning'],
							default='all', help='Minimum severity to show')

	# Free space command
	free_parser = subparsers.add_parser('free', help='Find free space')
	free_parser.add_argument('rom', help='ROM file to analyze')
	free_parser.add_argument('--min-size', type=int, default=16,
						   help='Minimum free block size to report')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	# Load and analyze ROM
	analyzer = ROMAnalyzer(args.rom)
	analyzer.analyze_banks()
	detector = ConflictDetector(analyzer)
	code_analyzer = CodeAnalyzer(analyzer)

	if args.command == 'analyze':
		report = generate_report(analyzer, detector, code_analyzer, args.format)

		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(report)
			print(f"Report written to {args.output}")
		else:
			print(report)

	elif args.command == 'banks':
		print(f"ROM: {os.path.basename(args.rom)}")
		print(f"Mapper: {analyzer.mapper.value}")
		print(f"Banks: {len(analyzer.banks)}")
		print()
		print(f"{'Bank':>4} {'File Offset':>12} {'CPU Address':>14} {'Size':>8}")
		print("-" * 50)

		for bank in analyzer.banks:
			print(f"{bank.bank_number:>4} "
				 f"${bank.start_offset:>010x} "
				 f"${bank.cpu_start:06x}-${bank.cpu_end:06x} "
				 f"{bank.size:>8,}")

	elif args.command == 'check':
		conflicts = detector.detect_all_conflicts()

		if args.severity != 'all':
			if args.severity == 'error':
				conflicts = [c for c in conflicts if c.severity == 'error']
			elif args.severity == 'warning':
				conflicts = [c for c in conflicts if c.severity in ('error', 'warning')]

		if conflicts:
			print(f"Found {len(conflicts)} issue(s):")
			print("-" * 50)
			for conflict in conflicts:
				print(f"[{conflict.severity.upper()}] {conflict.conflict_type}")
				print(f"  {conflict.description}")
				print()
		else:
			print("No conflicts detected")

	elif args.command == 'free':
		print(f"Free Space Analysis: {os.path.basename(args.rom)}")
		print("-" * 50)

		total_free = 0
		for bank in analyzer.banks:
			if bank.free_bytes >= args.min_size:
				print(f"Bank {bank.bank_number}: {bank.free_bytes:,} bytes free "
					 f"(offset ${bank.end_offset - bank.free_bytes:06x})")
				total_free += bank.free_bytes

		print("-" * 50)
		print(f"Total free space: {total_free:,} bytes")


if __name__ == '__main__':
	main()
