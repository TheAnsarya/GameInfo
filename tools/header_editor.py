#!/usr/bin/env python3
"""
ROM Header Editor

View and edit ROM headers for various console formats.
Supports NES (iNES/NES 2.0), SNES, GB/GBC, and GBA.

Features:
- Parse and display header information
- Edit header fields
- Fix checksums
- Convert between header formats
- Validate header integrity

Usage:
	python header_editor.py info game.nes
	python header_editor.py edit game.nes --mapper 4
	python header_editor.py fix game.sfc --checksum
	python header_editor.py convert game.nes --to nes20
"""

import argparse
import struct
import sys
from pathlib import Path
from typing import Dict, Optional, Tuple


class ROMHeader:
	"""Base class for ROM headers."""

	def __init__(self, data: bytes):
		self.data = bytearray(data)
		self.header_size = 0
		self.format = "Unknown"
		self._parse()

	def _parse(self):
		"""Parse header. Override in subclasses."""
		raise NotImplementedError

	def get_info(self) -> Dict:
		"""Get header information as dictionary."""
		raise NotImplementedError

	def set_field(self, field: str, value):
		"""Set a header field."""
		raise NotImplementedError

	def fix_checksum(self):
		"""Fix/update checksum."""
		pass

	def export(self) -> bytes:
		"""Export modified ROM."""
		return bytes(self.data)


class iNESHeader(ROMHeader):
	"""iNES/NES 2.0 header parser."""

	def _parse(self):
		if len(self.data) < 16 or self.data[:4] != b'NES\x1a':
			raise ValueError("Not a valid iNES ROM")

		self.header_size = 16
		self.prg_size = self.data[4]
		self.chr_size = self.data[5]
		self.flags6 = self.data[6]
		self.flags7 = self.data[7]
		self.flags8 = self.data[8]
		self.flags9 = self.data[9]
		self.flags10 = self.data[10]

		# Determine format version
		if (self.flags7 & 0x0C) == 0x08:
			self.format = "NES 2.0"
			self._parse_nes20()
		else:
			self.format = "iNES"
			self._parse_ines()

	def _parse_ines(self):
		"""Parse standard iNES header."""
		self.mapper = (self.flags6 >> 4) | (self.flags7 & 0xF0)
		self.mirroring = 'vertical' if self.flags6 & 0x01 else 'horizontal'
		self.battery = bool(self.flags6 & 0x02)
		self.trainer = bool(self.flags6 & 0x04)
		self.four_screen = bool(self.flags6 & 0x08)
		self.vs_system = bool(self.flags7 & 0x01)
		self.playchoice = bool(self.flags7 & 0x02)

	def _parse_nes20(self):
		"""Parse NES 2.0 header."""
		self._parse_ines()

		# Extended mapper
		self.mapper |= (self.flags8 & 0x0F) << 8
		self.submapper = (self.flags8 >> 4) & 0x0F

		# Extended sizes
		prg_msb = (self.flags9 & 0x0F)
		chr_msb = (self.flags9 >> 4) & 0x0F

		if prg_msb < 0x0F:
			self.prg_size = (prg_msb << 8) | self.prg_size
		if chr_msb < 0x0F:
			self.chr_size = (chr_msb << 8) | self.chr_size

		# PRG/CHR RAM sizes
		self.prg_ram = self.flags10 & 0x0F
		self.prg_nvram = (self.flags10 >> 4) & 0x0F
		self.chr_ram = self.data[11] & 0x0F
		self.chr_nvram = (self.data[11] >> 4) & 0x0F

		# Timing
		self.timing = self.data[12] & 0x03

	def get_info(self) -> Dict:
		"""Get header info."""
		info = {
			'format': self.format,
			'prg_size': f"{self.prg_size * 16}KB ({self.prg_size} banks)",
			'chr_size': f"{self.chr_size * 8}KB ({self.chr_size} banks)" if self.chr_size else "CHR-RAM",
			'mapper': self.mapper,
			'mirroring': self.mirroring,
			'battery': self.battery,
			'trainer': self.trainer,
			'four_screen': self.four_screen,
		}

		if self.format == "NES 2.0":
			info['submapper'] = self.submapper
			info['prg_ram'] = f"{64 << self.prg_ram if self.prg_ram else 0} bytes" if hasattr(self, 'prg_ram') else "N/A"
			info['timing'] = ['NTSC', 'PAL', 'Multi', 'Dendy'][self.timing] if hasattr(self, 'timing') else "N/A"

		return info

	def set_field(self, field: str, value):
		"""Set header field."""
		if field == 'mapper':
			value = int(value)
			self.data[6] = (self.data[6] & 0x0F) | ((value & 0x0F) << 4)
			self.data[7] = (self.data[7] & 0x0F) | (value & 0xF0)
			if self.format == "NES 2.0":
				self.data[8] = (self.data[8] & 0xF0) | ((value >> 8) & 0x0F)

		elif field == 'mirroring':
			if value in ('v', 'vertical', '1'):
				self.data[6] |= 0x01
			elif value in ('h', 'horizontal', '0'):
				self.data[6] &= ~0x01

		elif field == 'battery':
			if value in ('1', 'true', 'yes'):
				self.data[6] |= 0x02
			else:
				self.data[6] &= ~0x02

		elif field == 'prg':
			value = int(value)
			self.data[4] = value & 0xFF
			if self.format == "NES 2.0":
				self.data[9] = (self.data[9] & 0xF0) | ((value >> 8) & 0x0F)

		elif field == 'chr':
			value = int(value)
			self.data[5] = value & 0xFF
			if self.format == "NES 2.0":
				self.data[9] = (self.data[9] & 0x0F) | ((value >> 4) & 0xF0)


class SNESHeader(ROMHeader):
	"""SNES ROM header parser."""

	def _parse(self):
		# SNES header can be at multiple locations
		# LoROM: $7FC0, HiROM: $FFC0
		# With 512-byte copier header: +$200

		self.copier_header = len(self.data) % 0x8000 == 512

		if self.copier_header:
			self.header_size = 512
			base = 512
		else:
			self.header_size = 0
			base = 0

		# Try to find header
		for offset in [0x7FC0 + base, 0xFFC0 + base]:
			if offset + 32 <= len(self.data):
				if self._validate_header(offset):
					self.header_offset = offset
					self._parse_header(offset)
					return

		raise ValueError("Could not find valid SNES header")

	def _validate_header(self, offset: int) -> bool:
		"""Validate SNES header at offset."""
		# Check for valid makeup byte and ROM type
		makeup = self.data[offset + 0x15]
		rom_type = self.data[offset + 0x16]

		# Checksum + complement should equal 0xFFFF
		checksum = struct.unpack('<H', self.data[offset + 0x1C:offset + 0x1E])[0]
		complement = struct.unpack('<H', self.data[offset + 0x1E:offset + 0x20])[0]

		return (checksum ^ complement) == 0xFFFF

	def _parse_header(self, offset: int):
		"""Parse SNES header at offset."""
		self.format = "SNES"

		# Title (21 bytes)
		self.title = self.data[offset:offset + 21].decode('ascii', errors='replace').strip()

		# Makeup byte
		makeup = self.data[offset + 0x15]
		self.rom_type = 'HiROM' if makeup & 0x01 else 'LoROM'
		self.fast_rom = bool(makeup & 0x10)

		# Chipset
		self.chipset = self.data[offset + 0x16]

		# ROM size (2^n KB)
		rom_size_byte = self.data[offset + 0x17]
		self.rom_size = (1 << rom_size_byte) if rom_size_byte > 0 else 0

		# RAM size
		ram_size_byte = self.data[offset + 0x18]
		self.ram_size = (1 << ram_size_byte) if ram_size_byte > 0 else 0

		# Country/region
		self.country = self.data[offset + 0x19]

		# Developer ID
		self.developer = self.data[offset + 0x1A]

		# Version
		self.version = self.data[offset + 0x1B]

		# Checksums
		self.complement = struct.unpack('<H', self.data[offset + 0x1C:offset + 0x1E])[0]
		self.checksum = struct.unpack('<H', self.data[offset + 0x1E:offset + 0x20])[0]

	def get_info(self) -> Dict:
		return {
			'format': self.format,
			'title': self.title,
			'rom_type': self.rom_type,
			'fast_rom': self.fast_rom,
			'rom_size': f"{self.rom_size}KB",
			'ram_size': f"{self.ram_size}KB" if self.ram_size else "None",
			'country': self._country_name(self.country),
			'version': f"1.{self.version}",
			'checksum': f"${self.checksum:04X}",
			'complement': f"${self.complement:04X}",
			'copier_header': self.copier_header,
		}

	def _country_name(self, code: int) -> str:
		countries = {
			0x00: "Japan",
			0x01: "USA",
			0x02: "Europe",
			0x03: "Sweden",
			0x04: "Finland",
			0x05: "Denmark",
			0x06: "France",
			0x07: "Netherlands",
			0x08: "Spain",
			0x09: "Germany",
			0x0A: "Italy",
			0x0B: "China",
			0x0C: "Indonesia",
			0x0D: "Korea",
		}
		return countries.get(code, f"Unknown (${code:02X})")

	def fix_checksum(self):
		"""Calculate and fix SNES checksum."""
		# Remove copier header from calculation
		if self.copier_header:
			rom_data = self.data[512:]
		else:
			rom_data = self.data

		# Calculate checksum
		checksum = sum(rom_data) & 0xFFFF

		# Temporarily zero out checksum fields
		offset = self.header_offset
		orig_check = self.data[offset + 0x1E:offset + 0x20]
		orig_comp = self.data[offset + 0x1C:offset + 0x1E]

		# Subtract old values, add new
		old_sum = sum(orig_check) + sum(orig_comp)
		checksum = (checksum - old_sum) & 0xFFFF

		# Add in checksum field itself (to make it work correctly)
		# The complement should be 0xFFFF - checksum
		complement = 0xFFFF ^ checksum

		# Write new values
		struct.pack_into('<H', self.data, offset + 0x1C, complement)
		struct.pack_into('<H', self.data, offset + 0x1E, checksum)


class GBHeader(ROMHeader):
	"""Game Boy header parser."""

	def _parse(self):
		if len(self.data) < 0x150:
			raise ValueError("File too small for Game Boy ROM")

		self.format = "Game Boy"
		self.header_offset = 0x100

		# Entry point
		self.entry = self.data[0x100:0x104]

		# Nintendo logo
		self.logo = self.data[0x104:0x134]

		# Title (16 bytes, or 11 + manufacturer + CGB flag)
		title_data = self.data[0x134:0x144]

		# Check for CGB
		cgb_flag = self.data[0x143]
		if cgb_flag in (0x80, 0xC0):
			self.format = "Game Boy Color"
			self.title = title_data[:11].decode('ascii', errors='replace').strip('\x00')
			self.manufacturer = title_data[11:15].decode('ascii', errors='replace')
			self.cgb_only = cgb_flag == 0xC0
		else:
			self.title = title_data.decode('ascii', errors='replace').strip('\x00')
			self.manufacturer = ""
			self.cgb_only = False

		# SGB flag
		self.sgb = self.data[0x146] == 0x03

		# Cartridge type
		self.cart_type = self.data[0x147]

		# ROM size
		self.rom_size_code = self.data[0x148]
		self.rom_size = 32 * (1 << self.rom_size_code)  # KB

		# RAM size
		ram_sizes = {0: 0, 1: 2, 2: 8, 3: 32, 4: 128, 5: 64}
		self.ram_size_code = self.data[0x149]
		self.ram_size = ram_sizes.get(self.ram_size_code, 0)

		# Region
		self.japanese = self.data[0x14A] == 0x00

		# Old licensee
		self.old_licensee = self.data[0x14B]

		# Version
		self.version = self.data[0x14C]

		# Checksums
		self.header_checksum = self.data[0x14D]
		self.global_checksum = struct.unpack('>H', self.data[0x14E:0x150])[0]

	def get_info(self) -> Dict:
		cart_types = {
			0x00: "ROM Only",
			0x01: "MBC1",
			0x02: "MBC1+RAM",
			0x03: "MBC1+RAM+Battery",
			0x05: "MBC2",
			0x06: "MBC2+Battery",
			0x0F: "MBC3+Timer+Battery",
			0x10: "MBC3+Timer+RAM+Battery",
			0x11: "MBC3",
			0x12: "MBC3+RAM",
			0x13: "MBC3+RAM+Battery",
			0x19: "MBC5",
			0x1A: "MBC5+RAM",
			0x1B: "MBC5+RAM+Battery",
			0x1C: "MBC5+Rumble",
			0x1D: "MBC5+Rumble+RAM",
			0x1E: "MBC5+Rumble+RAM+Battery",
		}

		return {
			'format': self.format,
			'title': self.title,
			'manufacturer': self.manufacturer or "N/A",
			'sgb_support': self.sgb,
			'cart_type': cart_types.get(self.cart_type, f"Unknown (${self.cart_type:02X})"),
			'rom_size': f"{self.rom_size}KB",
			'ram_size': f"{self.ram_size}KB" if self.ram_size else "None",
			'region': "Japan" if self.japanese else "World",
			'version': f"1.{self.version}",
			'header_checksum': f"${self.header_checksum:02X}",
			'global_checksum': f"${self.global_checksum:04X}",
		}

	def fix_checksum(self):
		"""Fix Game Boy header checksum."""
		# Header checksum: bytes $0134-$014C
		checksum = 0
		for i in range(0x134, 0x14D):
			checksum = (checksum - self.data[i] - 1) & 0xFF

		self.data[0x14D] = checksum

		# Global checksum (optional, some games don't verify)
		global_sum = sum(self.data) - self.data[0x14E] - self.data[0x14F]
		global_sum &= 0xFFFF
		struct.pack_into('>H', self.data, 0x14E, global_sum)


def detect_format(data: bytes) -> Optional[ROMHeader]:
	"""Detect ROM format and return appropriate header parser."""
	# NES
	if data[:4] == b'NES\x1a':
		return iNESHeader(data)

	# Game Boy
	if len(data) >= 0x150:
		# Check for Nintendo logo
		nintendo_logo = bytes([
			0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
		])
		if data[0x104:0x114] == nintendo_logo:
			return GBHeader(data)

	# SNES
	try:
		return SNESHeader(data)
	except ValueError:
		pass

	return None


def cmd_info(args):
	"""Show header information."""
	data = Path(args.rom).read_bytes()
	header = detect_format(data)

	if header is None:
		print("Unknown ROM format")
		sys.exit(1)

	info = header.get_info()

	print(f"File: {args.rom}")
	print(f"Size: {len(data):,} bytes")
	print()

	for key, value in info.items():
		print(f"{key}: {value}")


def cmd_edit(args):
	"""Edit header field."""
	data = Path(args.rom).read_bytes()
	header = detect_format(data)

	if header is None:
		print("Unknown ROM format")
		sys.exit(1)

	# Parse field=value pairs
	for assignment in args.set:
		if '=' not in assignment:
			print(f"Invalid format: {assignment} (use field=value)")
			continue

		field, value = assignment.split('=', 1)
		header.set_field(field.strip(), value.strip())
		print(f"Set {field} = {value}")

	# Save
	output_path = args.output or args.rom
	Path(output_path).write_bytes(header.export())
	print(f"Saved to: {output_path}")


def cmd_fix(args):
	"""Fix ROM checksums."""
	data = Path(args.rom).read_bytes()
	header = detect_format(data)

	if header is None:
		print("Unknown ROM format")
		sys.exit(1)

	header.fix_checksum()

	output_path = args.output or args.rom
	Path(output_path).write_bytes(header.export())
	print(f"Fixed checksum and saved to: {output_path}")


def main():
	parser = argparse.ArgumentParser(description="ROM Header Editor")
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Info
	info = subparsers.add_parser('info', help='Show header information')
	info.add_argument('rom', help='ROM file')

	# Edit
	edit = subparsers.add_parser('edit', help='Edit header field')
	edit.add_argument('rom', help='ROM file')
	edit.add_argument('--set', '-s', action='append', required=True,
		help='Field=value to set (can specify multiple)')
	edit.add_argument('--output', '-o', help='Output file')

	# Fix
	fix = subparsers.add_parser('fix', help='Fix checksums')
	fix.add_argument('rom', help='ROM file')
	fix.add_argument('--output', '-o', help='Output file')

	args = parser.parse_args()

	commands = {
		'info': cmd_info,
		'edit': cmd_edit,
		'fix': cmd_fix,
	}

	if args.command in commands:
		commands[args.command](args)
	else:
		parser.print_help()


if __name__ == '__main__':
	main()
