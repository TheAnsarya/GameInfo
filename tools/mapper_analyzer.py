#!/usr/bin/env python3
"""
Mapper Analyzer

Analyzes and documents mapper configurations for NES/Famicom ROMs.
Identifies mapper type and bank switching patterns.

Author: GameInfo Project
License: MIT
"""

import struct
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import Enum


class MapperType(Enum):
	"""Common NES mapper types"""
	NROM = 0
	MMC1 = 1
	UNROM = 2
	CNROM = 3
	MMC3 = 4
	MMC5 = 5
	AXROM = 7
	MMC2 = 9
	MMC4 = 10
	COLOR_DREAMS = 11
	CPROM = 13
	BANDAI_FCG = 16
	VRC4 = 21
	VRC2A = 22
	VRC2B = 23
	VRC6A = 24
	VRC6B = 26
	VRC4E = 25
	VRC7 = 85
	NAMCO_163 = 19
	FDS = 20
	KONAMI_VRC3 = 73
	MMC3_VARIANT = 118
	UNKNOWN = 255


@dataclass
class MapperInfo:
	"""Information about a mapper"""
	mapper_id: int
	mapper_type: MapperType
	name: str
	description: str = ""
	prg_size: int = 0
	chr_size: int = 0
	prg_banks: int = 0
	chr_banks: int = 0
	prg_bank_size: int = 0x4000  # 16KB default
	chr_bank_size: int = 0x2000  # 8KB default
	has_battery: bool = False
	has_trainer: bool = False
	mirroring: str = "horizontal"
	register_info: dict = field(default_factory=dict)


@dataclass
class BankSwitchAccess:
	"""A detected bank switch register access"""
	address: int
	value: int
	bank_type: str  # 'prg' or 'chr'
	bank_slot: int
	source_offset: int  # Where in ROM this was found


MAPPER_NAMES = {
	0: "NROM",
	1: "MMC1 (SxROM)",
	2: "UxROM",
	3: "CNROM",
	4: "MMC3 (TxROM)",
	5: "MMC5 (ExROM)",
	7: "AxROM",
	9: "MMC2 (PxROM)",
	10: "MMC4 (FxROM)",
	11: "Color Dreams",
	13: "CPROM",
	16: "Bandai FCG",
	19: "Namco 163",
	21: "VRC4a/VRC4c",
	22: "VRC2a",
	23: "VRC2b/VRC4e",
	24: "VRC6a",
	25: "VRC4b/VRC4d",
	26: "VRC6b",
	66: "GxROM/MxROM",
	69: "Sunsoft FME-7",
	71: "Codemasters",
	73: "VRC3",
	85: "VRC7",
	118: "TxSROM",
	119: "TQROM",
}

MAPPER_DESCRIPTIONS = {
	0: "No mapper - 32KB PRG, 8KB CHR maximum",
	1: "Nintendo MMC1 - Up to 256KB PRG, 128KB CHR, battery SRAM",
	2: "UxROM - Up to 256KB PRG, fixed CHR",
	3: "CNROM - 32KB PRG, up to 32KB CHR bank switching",
	4: "Nintendo MMC3 - Up to 512KB PRG, 256KB CHR, IRQ counter",
	5: "Nintendo MMC5 - Advanced mapper with extra features",
	7: "AxROM - Up to 256KB PRG, single-screen mirroring",
	9: "MMC2 - Punch-Out!! mapper with automatic CHR switching",
	10: "MMC4 - Similar to MMC2",
	21: "Konami VRC4a/VRC4c - IRQ, fine PRG/CHR banking",
	24: "Konami VRC6a - Extra audio channels",
	85: "Konami VRC7 - FM synthesis audio",
}


class INESHeader:
	"""Parse iNES/NES 2.0 header"""
	
	def __init__(self, data: bytes):
		self.data = data
		self.valid = self._validate()
		
		if self.valid:
			self._parse()
	
	def _validate(self) -> bool:
		"""Validate header magic"""
		if len(self.data) < 16:
			return False
		return self.data[0:4] == b'NES\x1a'
	
	def _parse(self):
		"""Parse header fields"""
		self.prg_size = self.data[4] * 16384  # 16KB units
		self.chr_size = self.data[5] * 8192   # 8KB units
		
		flags6 = self.data[6]
		flags7 = self.data[7]
		
		self.mirroring = "vertical" if flags6 & 0x01 else "horizontal"
		self.battery = bool(flags6 & 0x02)
		self.trainer = bool(flags6 & 0x04)
		self.four_screen = bool(flags6 & 0x08)
		
		# Mapper number
		self.mapper = ((flags6 >> 4) & 0x0f) | (flags7 & 0xf0)
		
		# NES 2.0 check
		self.nes2 = (flags7 & 0x0c) == 0x08
		
		if self.nes2:
			flags8 = self.data[8]
			self.mapper |= (flags8 & 0x0f) << 8
			self.submapper = (flags8 >> 4) & 0x0f
			
			# Extended ROM sizes
			flags9 = self.data[9]
			prg_msb = flags9 & 0x0f
			chr_msb = (flags9 >> 4) & 0x0f
			
			if prg_msb < 0x0f:
				self.prg_size = ((prg_msb << 8) | self.data[4]) * 16384
			if chr_msb < 0x0f:
				self.chr_size = ((chr_msb << 8) | self.data[5]) * 8192
		else:
			self.submapper = 0
		
		self.prg_ram = self.data[8] * 8192 if not self.nes2 else 0
	
	def to_dict(self) -> dict:
		"""Export header info as dict"""
		if not self.valid:
			return {'valid': False}
		
		return {
			'valid': True,
			'prg_size': self.prg_size,
			'chr_size': self.chr_size,
			'mapper': self.mapper,
			'submapper': self.submapper,
			'mirroring': self.mirroring,
			'battery': self.battery,
			'trainer': self.trainer,
			'four_screen': self.four_screen,
			'nes2': self.nes2,
		}


class MapperAnalyzer:
	"""Analyze mapper usage in ROM"""
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.header = INESHeader(rom_data[:16])
		self.prg_data = self._extract_prg()
		self.chr_data = self._extract_chr()
		self.bank_accesses: list[BankSwitchAccess] = []
	
	def _extract_prg(self) -> bytes:
		"""Extract PRG ROM data"""
		if not self.header.valid:
			return b''
		
		start = 16
		if self.header.trainer:
			start += 512
		
		return self.rom_data[start:start + self.header.prg_size]
	
	def _extract_chr(self) -> bytes:
		"""Extract CHR ROM data"""
		if not self.header.valid:
			return b''
		
		start = 16 + self.header.prg_size
		if self.header.trainer:
			start += 512
		
		return self.rom_data[start:start + self.header.chr_size]
	
	def get_mapper_info(self) -> MapperInfo:
		"""Get information about the detected mapper"""
		if not self.header.valid:
			return MapperInfo(
				mapper_id=255,
				mapper_type=MapperType.UNKNOWN,
				name="Unknown"
			)
		
		mapper_id = self.header.mapper
		
		try:
			mapper_type = MapperType(mapper_id)
		except ValueError:
			mapper_type = MapperType.UNKNOWN
		
		name = MAPPER_NAMES.get(mapper_id, f"Mapper {mapper_id}")
		desc = MAPPER_DESCRIPTIONS.get(mapper_id, "")
		
		info = MapperInfo(
			mapper_id=mapper_id,
			mapper_type=mapper_type,
			name=name,
			description=desc,
			prg_size=self.header.prg_size,
			chr_size=self.header.chr_size,
			has_battery=self.header.battery,
			has_trainer=self.header.trainer,
			mirroring=self.header.mirroring,
		)
		
		# Calculate bank counts based on mapper
		self._calculate_banks(info)
		self._add_register_info(info)
		
		return info
	
	def _calculate_banks(self, info: MapperInfo):
		"""Calculate PRG/CHR bank counts"""
		if info.mapper_type == MapperType.NROM:
			info.prg_banks = 1 if info.prg_size <= 16384 else 2
			info.chr_banks = 1
			info.prg_bank_size = 16384
			info.chr_bank_size = 8192
		
		elif info.mapper_type == MapperType.MMC1:
			info.prg_bank_size = 16384
			info.chr_bank_size = 4096
			info.prg_banks = info.prg_size // info.prg_bank_size
			info.chr_banks = max(1, info.chr_size // info.chr_bank_size)
		
		elif info.mapper_type == MapperType.UNROM:
			info.prg_bank_size = 16384
			info.prg_banks = info.prg_size // info.prg_bank_size
			info.chr_banks = 0  # CHR RAM
		
		elif info.mapper_type == MapperType.CNROM:
			info.prg_banks = info.prg_size // 16384
			info.chr_bank_size = 8192
			info.chr_banks = max(1, info.chr_size // info.chr_bank_size)
		
		elif info.mapper_type == MapperType.MMC3:
			info.prg_bank_size = 8192
			info.chr_bank_size = 1024
			info.prg_banks = info.prg_size // info.prg_bank_size
			info.chr_banks = max(1, info.chr_size // info.chr_bank_size)
		
		else:
			# Default calculation
			info.prg_banks = max(1, info.prg_size // 16384)
			info.chr_banks = max(1, info.chr_size // 8192) if info.chr_size > 0 else 0
	
	def _add_register_info(self, info: MapperInfo):
		"""Add mapper register documentation"""
		if info.mapper_type == MapperType.MMC1:
			info.register_info = {
				'$8000-$9fff': 'Control (CPPMM)',
				'$a000-$bfff': 'CHR bank 0',
				'$c000-$dfff': 'CHR bank 1',
				'$e000-$ffff': 'PRG bank',
				'note': 'Serial port - write bit 0, shift 5 times'
			}
		
		elif info.mapper_type == MapperType.UNROM:
			info.register_info = {
				'$8000-$ffff': 'Select 16KB PRG bank at $8000'
			}
		
		elif info.mapper_type == MapperType.CNROM:
			info.register_info = {
				'$8000-$ffff': 'Select 8KB CHR bank'
			}
		
		elif info.mapper_type == MapperType.MMC3:
			info.register_info = {
				'$8000': 'Bank select (R:0-7, mode bits 6-7)',
				'$8001': 'Bank data',
				'$a000': 'Mirroring',
				'$a001': 'PRG RAM protect',
				'$c000': 'IRQ latch',
				'$c001': 'IRQ reload',
				'$e000': 'IRQ disable',
				'$e001': 'IRQ enable',
			}
		
		elif info.mapper_type == MapperType.AXROM:
			info.register_info = {
				'$8000-$ffff': 'Select 32KB PRG bank + mirroring'
			}
	
	def find_bank_switches(self) -> list[BankSwitchAccess]:
		"""Scan PRG for bank switching code patterns"""
		accesses = []
		mapper_id = self.header.mapper
		
		# Look for STA to mapper registers
		# STA absolute: 8D ll hh
		# STA absolute,X: 9D ll hh
		
		for i in range(len(self.prg_data) - 3):
			opcode = self.prg_data[i]
			
			if opcode in [0x8d, 0x9d, 0x8e, 0x8c]:  # STA, STX, STY absolute
				addr = struct.unpack_from('<H', self.prg_data, i + 1)[0]
				
				# Check if writing to mapper range
				if 0x8000 <= addr <= 0xffff:
					# Try to find what value is being written
					# Look for preceding LDA #xx
					value = None
					for j in range(max(0, i - 10), i):
						if self.prg_data[j] == 0xa9:  # LDA immediate
							value = self.prg_data[j + 1]
					
					access = BankSwitchAccess(
						address=addr,
						value=value if value is not None else -1,
						bank_type=self._classify_register(addr, mapper_id),
						bank_slot=self._get_bank_slot(addr, mapper_id),
						source_offset=i + 16  # Add header offset
					)
					accesses.append(access)
		
		self.bank_accesses = accesses
		return accesses
	
	def _classify_register(self, addr: int, mapper_id: int) -> str:
		"""Classify register as PRG or CHR bank select"""
		if mapper_id == 1:  # MMC1
			if 0xe000 <= addr <= 0xffff:
				return 'prg'
			elif 0xa000 <= addr <= 0xdfff:
				return 'chr'
			else:
				return 'control'
		
		elif mapper_id == 4:  # MMC3
			if addr == 0x8000:
				return 'select'
			elif addr == 0x8001:
				return 'data'
			elif 0xc000 <= addr <= 0xe001:
				return 'irq'
			else:
				return 'other'
		
		elif mapper_id in [2, 7]:  # UxROM, AxROM
			return 'prg'
		
		elif mapper_id == 3:  # CNROM
			return 'chr'
		
		return 'unknown'
	
	def _get_bank_slot(self, addr: int, mapper_id: int) -> int:
		"""Get which bank slot is being set"""
		if mapper_id == 1:  # MMC1
			if 0xa000 <= addr <= 0xbfff:
				return 0
			elif 0xc000 <= addr <= 0xdfff:
				return 1
			elif 0xe000 <= addr <= 0xffff:
				return 0
		
		return 0
	
	def generate_report(self) -> str:
		"""Generate analysis report"""
		lines = []
		info = self.get_mapper_info()
		
		lines.append("=" * 60)
		lines.append("MAPPER ANALYSIS REPORT")
		lines.append("=" * 60)
		lines.append("")
		
		lines.append("HEADER INFO")
		lines.append("-" * 40)
		lines.append(f"  Mapper: #{info.mapper_id} - {info.name}")
		if info.description:
			lines.append(f"  Description: {info.description}")
		lines.append(f"  PRG ROM: {info.prg_size // 1024}KB ({info.prg_banks} banks)")
		lines.append(f"  CHR ROM: {info.chr_size // 1024}KB ({info.chr_banks} banks)")
		lines.append(f"  Mirroring: {info.mirroring}")
		lines.append(f"  Battery: {'Yes' if info.has_battery else 'No'}")
		lines.append(f"  Trainer: {'Yes' if info.has_trainer else 'No'}")
		lines.append("")
		
		if info.register_info:
			lines.append("MAPPER REGISTERS")
			lines.append("-" * 40)
			for addr, desc in info.register_info.items():
				lines.append(f"  {addr}: {desc}")
			lines.append("")
		
		# Find bank switches
		accesses = self.find_bank_switches()
		if accesses:
			lines.append("DETECTED BANK SWITCHES")
			lines.append("-" * 40)
			
			# Group by address
			by_addr = {}
			for access in accesses:
				if access.address not in by_addr:
					by_addr[access.address] = []
				by_addr[access.address].append(access)
			
			for addr in sorted(by_addr.keys()):
				addr_accesses = by_addr[addr]
				lines.append(f"  ${addr:04x} ({addr_accesses[0].bank_type}):")
				
				# Show unique values
				values = set(a.value for a in addr_accesses if a.value >= 0)
				if values:
					lines.append(f"    Values written: {', '.join(f'${v:02x}' for v in sorted(values))}")
				
				# Show some source locations
				locations = [f"${a.source_offset:04x}" for a in addr_accesses[:5]]
				lines.append(f"    Sources: {', '.join(locations)}")
				if len(addr_accesses) > 5:
					lines.append(f"    ... and {len(addr_accesses) - 5} more")
			
			lines.append("")
		
		# Bank mapping
		lines.append("MEMORY MAP")
		lines.append("-" * 40)
		
		if info.mapper_type == MapperType.NROM:
			if info.prg_banks == 1:
				lines.append("  $8000-$bfff: PRG bank 0 (mirrored)")
				lines.append("  $c000-$ffff: PRG bank 0")
			else:
				lines.append("  $8000-$bfff: PRG bank 0")
				lines.append("  $c000-$ffff: PRG bank 1")
		
		elif info.mapper_type == MapperType.MMC1:
			lines.append("  $8000-$bfff: Switchable PRG bank")
			lines.append("  $c000-$ffff: Fixed to last bank (or switchable)")
		
		elif info.mapper_type == MapperType.UNROM:
			lines.append("  $8000-$bfff: Switchable PRG bank")
			lines.append("  $c000-$ffff: Fixed to last bank")
		
		elif info.mapper_type == MapperType.MMC3:
			lines.append("  $8000-$9fff: Switchable PRG (R6 or fixed)")
			lines.append("  $a000-$bfff: Switchable PRG (R7)")
			lines.append("  $c000-$dfff: Switchable PRG (R6 or fixed)")
			lines.append("  $e000-$ffff: Fixed to last bank")
		
		else:
			lines.append(f"  (Standard {info.prg_bank_size // 1024}KB bank layout)")
		
		lines.append("")
		
		return '\n'.join(lines)
	
	def to_json(self) -> dict:
		"""Export analysis as JSON"""
		info = self.get_mapper_info()
		accesses = self.find_bank_switches()
		
		return {
			'header': self.header.to_dict(),
			'mapper': {
				'id': info.mapper_id,
				'name': info.name,
				'description': info.description,
			},
			'rom': {
				'prg_size': info.prg_size,
				'chr_size': info.chr_size,
				'prg_banks': info.prg_banks,
				'chr_banks': info.chr_banks,
				'prg_bank_size': info.prg_bank_size,
				'chr_bank_size': info.chr_bank_size,
			},
			'features': {
				'battery': info.has_battery,
				'trainer': info.has_trainer,
				'mirroring': info.mirroring,
			},
			'registers': info.register_info,
			'bank_accesses': [
				{
					'address': f"${a.address:04x}",
					'value': f"${a.value:02x}" if a.value >= 0 else "unknown",
					'type': a.bank_type,
					'source': f"${a.source_offset:04x}",
				}
				for a in accesses[:100]  # Limit output
			]
		}


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Mapper Analyzer - Analyze NES mapper configurations"
	)
	parser.add_argument('rom', help='NES ROM file')
	parser.add_argument('-o', '--output', help='Output file')
	parser.add_argument('--json', action='store_true', help='Output as JSON')
	parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
	
	args = parser.parse_args()
	
	# Load ROM
	rom_data = Path(args.rom).read_bytes()
	
	# Analyze
	analyzer = MapperAnalyzer(rom_data)
	
	if args.json:
		import json
		output = json.dumps(analyzer.to_json(), indent='\t')
	else:
		output = analyzer.generate_report()
	
	if args.output:
		Path(args.output).write_text(output, encoding='utf-8')
		print(f"Wrote analysis to {args.output}")
	else:
		print(output)


if __name__ == "__main__":
	main()
