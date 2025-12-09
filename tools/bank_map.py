#!/usr/bin/env python3
"""
Bank Map Editor - Visualize and edit ROM bank mappings.

Tools for managing ROM bank layouts and memory mapping.

Usage:
	python bank_map.py --analyze rom.nes
	python bank_map.py --visualize rom.nes
	python bank_map.py --edit rom.nes --config banks.json

Features:
	- Bank layout visualization
	- PRG/CHR bank mapping
	- Mapper-specific layouts
	- Bank usage analysis
	- Cross-reference tracking
"""

import argparse
import json
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


class BankType(Enum):
	"""Bank content types."""
	CODE = "code"
	DATA = "data"
	TEXT = "text"
	GRAPHICS = "graphics"
	AUDIO = "audio"
	MIXED = "mixed"
	EMPTY = "empty"
	UNKNOWN = "unknown"


class MapperType(Enum):
	"""Common mapper types."""
	NROM = 0
	MMC1 = 1
	UNROM = 2
	CNROM = 3
	MMC3 = 4
	MMC5 = 5
	AXROM = 7
	MMC2 = 9
	MMC4 = 10
	SUNSOFT_5B = 69
	VRC6 = 24
	VRC7 = 85


@dataclass
class BankInfo:
	"""Information about a single bank."""
	index: int
	type: BankType = BankType.UNKNOWN
	offset: int = 0               # Offset in ROM
	size: int = 0x4000            # Bank size in bytes (default 16KB)
	name: str = ""
	description: str = ""

	# Content analysis
	code_bytes: int = 0
	data_bytes: int = 0
	empty_bytes: int = 0

	# References
	calls_to: Set[int] = field(default_factory=set)     # Banks this calls to
	calls_from: Set[int] = field(default_factory=set)   # Banks calling this

	@property
	def usage_percent(self) -> float:
		"""Get usage percentage."""
		used = self.size - self.empty_bytes
		return (used / self.size) * 100 if self.size > 0 else 0

	def to_dict(self) -> Dict:
		"""Convert to dictionary."""
		return {
			"index": self.index,
			"type": self.type.value,
			"offset": self.offset,
			"size": self.size,
			"name": self.name,
			"description": self.description,
			"code_bytes": self.code_bytes,
			"data_bytes": self.data_bytes,
			"empty_bytes": self.empty_bytes,
			"calls_to": list(self.calls_to),
			"calls_from": list(self.calls_from)
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "BankInfo":
		"""Create from dictionary."""
		info = cls(
			index=data.get("index", 0),
			type=BankType(data.get("type", "unknown")),
			offset=data.get("offset", 0),
			size=data.get("size", 0x4000),
			name=data.get("name", ""),
			description=data.get("description", ""),
			code_bytes=data.get("code_bytes", 0),
			data_bytes=data.get("data_bytes", 0),
			empty_bytes=data.get("empty_bytes", 0)
		)
		info.calls_to = set(data.get("calls_to", []))
		info.calls_from = set(data.get("calls_from", []))
		return info


@dataclass
class BankLayout:
	"""Complete bank layout."""
	prg_banks: List[BankInfo] = field(default_factory=list)
	chr_banks: List[BankInfo] = field(default_factory=list)

	mapper: int = 0
	prg_bank_size: int = 0x4000   # 16KB
	chr_bank_size: int = 0x2000   # 8KB

	# Mapping configuration
	fixed_banks: List[int] = field(default_factory=list)
	switchable_slots: List[Tuple[int, int]] = field(default_factory=list)  # (slot, default_bank)

	def to_dict(self) -> Dict:
		"""Convert to dictionary."""
		return {
			"mapper": self.mapper,
			"prg_bank_size": self.prg_bank_size,
			"chr_bank_size": self.chr_bank_size,
			"prg_banks": [b.to_dict() for b in self.prg_banks],
			"chr_banks": [b.to_dict() for b in self.chr_banks],
			"fixed_banks": self.fixed_banks,
			"switchable_slots": self.switchable_slots
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "BankLayout":
		"""Create from dictionary."""
		layout = cls(
			mapper=data.get("mapper", 0),
			prg_bank_size=data.get("prg_bank_size", 0x4000),
			chr_bank_size=data.get("chr_bank_size", 0x2000),
			fixed_banks=data.get("fixed_banks", []),
			switchable_slots=data.get("switchable_slots", [])
		)

		for bank_data in data.get("prg_banks", []):
			layout.prg_banks.append(BankInfo.from_dict(bank_data))

		for bank_data in data.get("chr_banks", []):
			layout.chr_banks.append(BankInfo.from_dict(bank_data))

		return layout


class BankAnalyzer:
	"""Analyzer for ROM banks."""

	# Common code patterns
	CODE_PATTERNS = [
		bytes([0x4C]),        # JMP
		bytes([0x60]),        # RTS
		bytes([0x40]),        # RTI
		bytes([0x20]),        # JSR
		bytes([0xA9]),        # LDA #imm
		bytes([0xA2]),        # LDX #imm
		bytes([0xA0]),        # LDY #imm
	]

	def __init__(self):
		self.layout = BankLayout()

	def analyze_nes(self, data: bytes) -> BankLayout:
		"""Analyze NES ROM."""
		if len(data) < 16:
			return self.layout

		# Parse iNES header
		if data[:4] != b'NES\x1a':
			return self.layout

		prg_count = data[4]
		chr_count = data[5]
		flags6 = data[6]
		flags7 = data[7]

		self.layout.mapper = (flags6 >> 4) | (flags7 & 0xF0)

		# Determine bank sizes based on mapper
		self._configure_mapper(self.layout.mapper)

		# Analyze PRG banks
		prg_offset = 16
		for i in range(prg_count):
			bank = BankInfo(
				index=i,
				offset=prg_offset,
				size=self.layout.prg_bank_size
			)

			bank_data = data[prg_offset:prg_offset + bank.size]
			self._analyze_bank_content(bank, bank_data)

			self.layout.prg_banks.append(bank)
			prg_offset += bank.size

		# Analyze CHR banks
		for i in range(chr_count):
			bank = BankInfo(
				index=i,
				offset=prg_offset,
				size=self.layout.chr_bank_size,
				type=BankType.GRAPHICS
			)

			bank_data = data[prg_offset:prg_offset + bank.size]
			bank.empty_bytes = bank_data.count(0)

			self.layout.chr_banks.append(bank)
			prg_offset += bank.size

		return self.layout

	def _configure_mapper(self, mapper: int):
		"""Configure bank sizes for mapper."""
		if mapper == 0:  # NROM
			self.layout.prg_bank_size = 0x4000
			self.layout.chr_bank_size = 0x2000
			self.layout.fixed_banks = [-1]  # Last bank

		elif mapper == 1:  # MMC1
			self.layout.prg_bank_size = 0x4000
			self.layout.chr_bank_size = 0x1000
			self.layout.switchable_slots = [(0, 0)]
			self.layout.fixed_banks = [-1]

		elif mapper == 2:  # UNROM
			self.layout.prg_bank_size = 0x4000
			self.layout.chr_bank_size = 0x2000
			self.layout.switchable_slots = [(0, 0)]
			self.layout.fixed_banks = [-1]

		elif mapper == 4:  # MMC3
			self.layout.prg_bank_size = 0x2000
			self.layout.chr_bank_size = 0x0400
			self.layout.switchable_slots = [(0, 0), (1, 1)]
			self.layout.fixed_banks = [-2, -1]

	def _analyze_bank_content(self, bank: BankInfo, data: bytes):
		"""Analyze bank content type."""
		code_score = 0
		data_score = 0

		# Count empty bytes
		bank.empty_bytes = data.count(0xFF) + data.count(0x00)

		# Check for code patterns
		for pattern in self.CODE_PATTERNS:
			code_score += data.count(pattern[0])

		# Check for repeated patterns (likely data)
		for i in range(0, len(data) - 8, 8):
			chunk = data[i:i + 8]
			if data.count(chunk) > 3:
				data_score += 10

		# Estimate content
		total = len(data)
		if bank.empty_bytes > total * 0.9:
			bank.type = BankType.EMPTY
		elif code_score > data_score * 2:
			bank.type = BankType.CODE
			bank.code_bytes = total - bank.empty_bytes
		elif data_score > code_score * 2:
			bank.type = BankType.DATA
			bank.data_bytes = total - bank.empty_bytes
		else:
			bank.type = BankType.MIXED
			bank.code_bytes = (total - bank.empty_bytes) // 2
			bank.data_bytes = (total - bank.empty_bytes) // 2

	def find_bank_references(self, data: bytes, prg_offset: int = 16):
		"""Find cross-bank references."""
		for bank in self.layout.prg_banks:
			bank_data = data[bank.offset:bank.offset + bank.size]

			# Look for JSR/JMP patterns
			i = 0
			while i < len(bank_data) - 2:
				op = bank_data[i]

				if op in (0x4C, 0x20):  # JMP, JSR
					target = bank_data[i + 1] | (bank_data[i + 2] << 8)

					# Check if target is in different bank
					target_bank = self._find_target_bank(target)
					if target_bank >= 0 and target_bank != bank.index:
						bank.calls_to.add(target_bank)
						if target_bank < len(self.layout.prg_banks):
							self.layout.prg_banks[target_bank].calls_from.add(bank.index)

				i += 1

	def _find_target_bank(self, address: int) -> int:
		"""Determine which bank an address maps to."""
		if 0x8000 <= address < 0xC000:
			return 0  # First switchable slot
		elif 0xC000 <= address <= 0xFFFF:
			return len(self.layout.prg_banks) - 1  # Fixed bank
		return -1


class BankVisualizer:
	"""Visualizer for bank layouts."""

	TYPE_CHARS = {
		BankType.CODE: '#',
		BankType.DATA: '=',
		BankType.TEXT: 'T',
		BankType.GRAPHICS: 'G',
		BankType.AUDIO: 'A',
		BankType.MIXED: '*',
		BankType.EMPTY: '.',
		BankType.UNKNOWN: '?'
	}

	@classmethod
	def render_layout(cls, layout: BankLayout, width: int = 60) -> str:
		"""Render layout as ASCII art."""
		lines = []

		# Header
		lines.append("=" * width)
		lines.append(f"Bank Layout - Mapper {layout.mapper}")
		lines.append("=" * width)

		# PRG banks
		if layout.prg_banks:
			lines.append("")
			lines.append(f"PRG Banks ({len(layout.prg_banks)} x {layout.prg_bank_size // 1024}KB):")
			lines.append("-" * width)

			for bank in layout.prg_banks:
				bar_width = width - 30
				usage = bank.usage_percent
				filled = int(bar_width * usage / 100)

				char = cls.TYPE_CHARS.get(bank.type, '?')
				bar = char * filled + '.' * (bar_width - filled)

				name = bank.name or f"Bank {bank.index:02d}"
				lines.append(f"{bank.index:2d} |{bar}| {usage:5.1f}% {name}")

		# CHR banks
		if layout.chr_banks:
			lines.append("")
			lines.append(f"CHR Banks ({len(layout.chr_banks)} x {layout.chr_bank_size // 1024}KB):")
			lines.append("-" * width)

			for bank in layout.chr_banks:
				bar_width = width - 30
				usage = bank.usage_percent
				filled = int(bar_width * usage / 100)

				bar = 'G' * filled + '.' * (bar_width - filled)

				name = bank.name or f"CHR {bank.index:02d}"
				lines.append(f"{bank.index:2d} |{bar}| {usage:5.1f}% {name}")

		# Legend
		lines.append("")
		lines.append("Legend: # Code  = Data  T Text  G Graphics  A Audio  * Mixed  . Empty")

		return '\n'.join(lines)

	@classmethod
	def render_memory_map(cls, layout: BankLayout) -> str:
		"""Render memory map view."""
		lines = []

		lines.append("Memory Map:")
		lines.append("=" * 40)

		# NES CPU address space
		lines.append("$0000-$1FFF  RAM (2KB mirrored)")
		lines.append("$2000-$3FFF  PPU Registers")
		lines.append("$4000-$401F  APU/IO Registers")
		lines.append("$4020-$5FFF  Expansion ROM/RAM")
		lines.append("$6000-$7FFF  SRAM/WRAM")
		lines.append("$8000-$BFFF  PRG ROM (switchable)")
		lines.append("$C000-$FFFF  PRG ROM (fixed)")

		lines.append("")
		lines.append("Bank Mapping:")
		lines.append("-" * 40)

		if layout.switchable_slots:
			for slot, default in layout.switchable_slots:
				lines.append(f"Slot {slot}: Default bank {default}")

		if layout.fixed_banks:
			for i, bank in enumerate(layout.fixed_banks):
				actual = bank if bank >= 0 else len(layout.prg_banks) + bank
				lines.append(f"Fixed {i}: Bank {actual}")

		return '\n'.join(lines)

	@classmethod
	def render_cross_references(cls, layout: BankLayout) -> str:
		"""Render cross-reference diagram."""
		lines = []

		lines.append("Bank Cross-References:")
		lines.append("=" * 50)

		for bank in layout.prg_banks:
			if bank.calls_to or bank.calls_from:
				lines.append(f"\nBank {bank.index:02d}:")

				if bank.calls_to:
					targets = ', '.join(str(b) for b in sorted(bank.calls_to))
					lines.append(f"  Calls to: {targets}")

				if bank.calls_from:
					sources = ', '.join(str(b) for b in sorted(bank.calls_from))
					lines.append(f"  Called from: {sources}")

		return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Bank Map Editor")
	parser.add_argument("rom", type=Path, nargs='?',
						help="ROM file to analyze")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze bank contents")
	parser.add_argument("--visualize", "-v", action="store_true",
						help="Show visual layout")
	parser.add_argument("--memory", "-m", action="store_true",
						help="Show memory map")
	parser.add_argument("--refs", "-r", action="store_true",
						help="Show cross-references")
	parser.add_argument("--output", "-o", type=Path,
						help="Output configuration file")
	parser.add_argument("--config", "-c", type=Path,
						help="Load configuration file")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")

	args = parser.parse_args()
	analyzer = BankAnalyzer()

	if args.config:
		with open(args.config) as f:
			data = json.load(f)
		analyzer.layout = BankLayout.from_dict(data)
		print(f"Loaded configuration from {args.config}")

	elif args.rom:
		rom_data = args.rom.read_bytes()
		analyzer.analyze_nes(rom_data)

		if args.refs:
			analyzer.find_bank_references(rom_data)

		print(f"Analyzed: {args.rom}")

	else:
		print("Bank Map Editor")
		print()
		print("Usage:")
		print("  bank_map.py ROM [options]")
		print()
		print("Options:")
		print("  --analyze, -a      Analyze bank contents")
		print("  --visualize, -v    Show visual layout")
		print("  --memory, -m       Show memory map")
		print("  --refs, -r         Show cross-references")
		print("  --output, -o FILE  Save configuration")
		print("  --config, -c FILE  Load configuration")
		return

	layout = analyzer.layout

	# Output options
	if args.json:
		print(json.dumps(layout.to_dict(), indent='\t'))

	elif args.visualize or args.analyze:
		print(BankVisualizer.render_layout(layout))

	if args.memory:
		print()
		print(BankVisualizer.render_memory_map(layout))

	if args.refs:
		print()
		print(BankVisualizer.render_cross_references(layout))

	if args.output:
		with open(args.output, 'w') as f:
			json.dump(layout.to_dict(), f, indent='\t')
		print(f"\nSaved configuration to {args.output}")


if __name__ == "__main__":
	main()
