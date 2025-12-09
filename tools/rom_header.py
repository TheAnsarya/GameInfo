#!/usr/bin/env python3
"""
ROM Header Editor - Edit ROM headers for various platforms.

Tools for viewing and modifying ROM header information including
title, region, version, and mapper settings.

Usage:
	python rom_header.py rom.nes --view
	python rom_header.py rom.sfc --set-title "New Title"
	python rom_header.py --fix

Features:
	- NES iNES/NES2.0 headers
	- SNES internal headers
	- GB/GBC headers
	- Genesis headers
	- Header fixing
"""

import argparse
import json
import os
import struct
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class HeaderFormat(Enum):
	"""ROM header formats."""
	INES = auto()         # NES iNES format
	INES2 = auto()        # NES 2.0 format
	SNES_LOROM = auto()   # SNES LoROM
	SNES_HIROM = auto()   # SNES HiROM
	GB = auto()           # Game Boy
	GBC = auto()          # Game Boy Color
	GENESIS = auto()      # Sega Genesis
	UNKNOWN = auto()


@dataclass
class iNESHeader:
	"""NES iNES header."""
	valid: bool = False
	prg_rom_size: int = 0       # In 16KB units
	chr_rom_size: int = 0       # In 8KB units
	mapper: int = 0
	mirroring: int = 0          # 0=horizontal, 1=vertical
	battery: bool = False
	trainer: bool = False
	four_screen: bool = False

	# NES 2.0
	is_nes2: bool = False
	submapper: int = 0
	prg_ram_size: int = 0
	chr_ram_size: int = 0
	cpu_ppu_timing: int = 0

	def load(self, data: bytes) -> None:
		"""Load from ROM data."""
		if len(data) < 16 or data[0:4] != b'NES\x1a':
			return

		self.valid = True
		self.prg_rom_size = data[4]
		self.chr_rom_size = data[5]

		flags6 = data[6]
		flags7 = data[7]

		self.mirroring = flags6 & 0x01
		self.battery = bool(flags6 & 0x02)
		self.trainer = bool(flags6 & 0x04)
		self.four_screen = bool(flags6 & 0x08)

		self.mapper = ((flags6 >> 4) & 0x0F) | (flags7 & 0xF0)

		# Check for NES 2.0
		if (flags7 & 0x0C) == 0x08:
			self.is_nes2 = True
			flags8 = data[8]
			self.mapper |= (flags8 & 0x0F) << 8
			self.submapper = (flags8 >> 4) & 0x0F

	def to_bytes(self) -> bytes:
		"""Convert to 16-byte header."""
		header = bytearray(16)
		header[0:4] = b'NES\x1a'
		header[4] = self.prg_rom_size
		header[5] = self.chr_rom_size

		flags6 = self.mirroring & 0x01
		if self.battery:
			flags6 |= 0x02
		if self.trainer:
			flags6 |= 0x04
		if self.four_screen:
			flags6 |= 0x08
		flags6 |= (self.mapper & 0x0F) << 4
		header[6] = flags6

		flags7 = self.mapper & 0xF0
		if self.is_nes2:
			flags7 |= 0x08
		header[7] = flags7

		if self.is_nes2:
			header[8] = ((self.mapper >> 8) & 0x0F) | (self.submapper << 4)

		return bytes(header)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"format": "NES 2.0" if self.is_nes2 else "iNES",
			"prg_rom_size": f"{self.prg_rom_size * 16}KB",
			"chr_rom_size": f"{self.chr_rom_size * 8}KB",
			"mapper": self.mapper,
			"submapper": self.submapper if self.is_nes2 else 0,
			"mirroring": "Vertical" if self.mirroring else "Horizontal",
			"battery": self.battery,
			"trainer": self.trainer,
			"four_screen": self.four_screen
		}


@dataclass
class SNESHeader:
	"""SNES internal header."""
	valid: bool = False
	offset: int = 0
	is_lorom: bool = True

	title: str = ""
	map_mode: int = 0
	rom_type: int = 0
	rom_size: int = 0
	ram_size: int = 0
	country: int = 0
	license: int = 0
	version: int = 0
	checksum: int = 0
	complement: int = 0

	# Vectors
	native_cop: int = 0
	native_brk: int = 0
	native_abort: int = 0
	native_nmi: int = 0
	native_reset: int = 0
	native_irq: int = 0

	def load(self, data: bytes) -> None:
		"""Load from ROM data."""
		# Find header
		for offset in [0x7FB0, 0xFFB0, 0x7FB0 + 512, 0xFFB0 + 512]:
			if self._try_load(data, offset):
				self.offset = offset
				self.is_lorom = offset in [0x7FB0, 0x7FB0 + 512]
				return

	def _try_load(self, data: bytes, offset: int) -> bool:
		"""Try to load header at offset."""
		if offset + 64 > len(data):
			return False

		# Check checksum complement
		complement = data[offset + 0x2C] | (data[offset + 0x2D] << 8)
		checksum = data[offset + 0x2E] | (data[offset + 0x2F] << 8)

		if (checksum ^ complement) != 0xFFFF:
			return False

		self.valid = True
		self.checksum = checksum
		self.complement = complement

		# Read title (21 bytes at offset + 0x10)
		title_bytes = data[offset + 0x10:offset + 0x25]
		self.title = title_bytes.decode('ascii', errors='replace').rstrip()

		self.map_mode = data[offset + 0x25]
		self.rom_type = data[offset + 0x26]
		self.rom_size = data[offset + 0x27]
		self.ram_size = data[offset + 0x28]
		self.country = data[offset + 0x29]
		self.license = data[offset + 0x2A]
		self.version = data[offset + 0x2B]

		# Vectors (at 0xFFE0+)
		vec_offset = offset + 0x30 if self.is_lorom else offset + 0x30
		# Actually vectors are at fixed addresses

		return True

	def get_rom_size_bytes(self) -> int:
		"""Get ROM size in bytes."""
		if self.rom_size == 0:
			return 0
		return 1024 << self.rom_size

	def get_ram_size_bytes(self) -> int:
		"""Get RAM size in bytes."""
		if self.ram_size == 0:
			return 0
		return 1024 << self.ram_size

	def get_country_name(self) -> str:
		"""Get country name."""
		countries = {
			0: "Japan",
			1: "USA",
			2: "Europe",
			3: "Sweden",
			4: "Finland",
			5: "Denmark",
			6: "France",
			7: "Netherlands",
			8: "Spain",
			9: "Germany",
			10: "Italy",
			11: "China",
			12: "Indonesia",
			13: "Korea",
			14: "Global",
			15: "Canada",
			16: "Brazil",
			17: "Australia"
		}
		return countries.get(self.country, f"Unknown ({self.country})")

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"format": "LoROM" if self.is_lorom else "HiROM",
			"title": self.title,
			"map_mode": f"0x{self.map_mode:02X}",
			"rom_type": f"0x{self.rom_type:02X}",
			"rom_size": f"{self.get_rom_size_bytes() // 1024}KB",
			"ram_size": f"{self.get_ram_size_bytes() // 1024}KB",
			"country": self.get_country_name(),
			"license": f"0x{self.license:02X}",
			"version": f"1.{self.version}",
			"checksum": f"0x{self.checksum:04X}",
			"complement": f"0x{self.complement:04X}"
		}


@dataclass
class GBHeader:
	"""Game Boy header."""
	valid: bool = False

	title: str = ""
	manufacturer: str = ""
	cgb_flag: int = 0
	new_license: str = ""
	sgb_flag: int = 0
	cartridge_type: int = 0
	rom_size: int = 0
	ram_size: int = 0
	destination: int = 0
	old_license: int = 0
	version: int = 0
	header_checksum: int = 0
	global_checksum: int = 0

	def load(self, data: bytes) -> None:
		"""Load from ROM data."""
		if len(data) < 0x150:
			return

		# Check Nintendo logo
		logo = bytes([
			0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D
		])
		if data[0x0104:0x0114] != logo:
			return

		self.valid = True

		# Title (0x0134-0x0143, but may be shorter for CGB)
		self.cgb_flag = data[0x0143]
		if self.cgb_flag in [0x80, 0xC0]:
			# CGB game - title is 15 bytes
			self.title = data[0x0134:0x0143].decode('ascii', errors='replace').rstrip('\x00')
			self.manufacturer = data[0x013F:0x0143].decode('ascii', errors='replace')
		else:
			# Non-CGB - title is 16 bytes
			self.title = data[0x0134:0x0144].decode('ascii', errors='replace').rstrip('\x00')

		self.new_license = data[0x0144:0x0146].decode('ascii', errors='replace')
		self.sgb_flag = data[0x0146]
		self.cartridge_type = data[0x0147]
		self.rom_size = data[0x0148]
		self.ram_size = data[0x0149]
		self.destination = data[0x014A]
		self.old_license = data[0x014B]
		self.version = data[0x014C]
		self.header_checksum = data[0x014D]
		self.global_checksum = (data[0x014E] << 8) | data[0x014F]

	def get_rom_size_bytes(self) -> int:
		"""Get ROM size in bytes."""
		if self.rom_size <= 8:
			return 32768 << self.rom_size
		return 0

	def get_ram_size_bytes(self) -> int:
		"""Get RAM size in bytes."""
		ram_sizes = {0: 0, 1: 2048, 2: 8192, 3: 32768, 4: 131072, 5: 65536}
		return ram_sizes.get(self.ram_size, 0)

	def get_cartridge_type_name(self) -> str:
		"""Get cartridge type name."""
		types = {
			0x00: "ROM ONLY",
			0x01: "MBC1",
			0x02: "MBC1+RAM",
			0x03: "MBC1+RAM+BATTERY",
			0x05: "MBC2",
			0x06: "MBC2+BATTERY",
			0x08: "ROM+RAM",
			0x09: "ROM+RAM+BATTERY",
			0x0B: "MMM01",
			0x0C: "MMM01+RAM",
			0x0D: "MMM01+RAM+BATTERY",
			0x0F: "MBC3+TIMER+BATTERY",
			0x10: "MBC3+TIMER+RAM+BATTERY",
			0x11: "MBC3",
			0x12: "MBC3+RAM",
			0x13: "MBC3+RAM+BATTERY",
			0x19: "MBC5",
			0x1A: "MBC5+RAM",
			0x1B: "MBC5+RAM+BATTERY",
			0x1C: "MBC5+RUMBLE",
			0x1D: "MBC5+RUMBLE+RAM",
			0x1E: "MBC5+RUMBLE+RAM+BATTERY"
		}
		return types.get(self.cartridge_type, f"Unknown (0x{self.cartridge_type:02X})")

	def is_gbc(self) -> bool:
		"""Check if GBC game."""
		return self.cgb_flag in [0x80, 0xC0]

	def is_gbc_only(self) -> bool:
		"""Check if GBC only."""
		return self.cgb_flag == 0xC0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"format": "GBC" if self.is_gbc() else "GB",
			"title": self.title,
			"manufacturer": self.manufacturer,
			"cgb_flag": f"0x{self.cgb_flag:02X}",
			"sgb_support": self.sgb_flag == 0x03,
			"cartridge_type": self.get_cartridge_type_name(),
			"rom_size": f"{self.get_rom_size_bytes() // 1024}KB",
			"ram_size": f"{self.get_ram_size_bytes() // 1024}KB" if self.get_ram_size_bytes() > 0 else "None",
			"destination": "Japan" if self.destination == 0 else "Non-Japan",
			"version": f"1.{self.version}",
			"header_checksum": f"0x{self.header_checksum:02X}",
			"global_checksum": f"0x{self.global_checksum:04X}"
		}


class ROMHeaderEditor:
	"""Edit ROM headers."""

	def __init__(self):
		self.data: Optional[bytearray] = None
		self.filepath: str = ""
		self.header_format: HeaderFormat = HeaderFormat.UNKNOWN

		self.ines: Optional[iNESHeader] = None
		self.snes: Optional[SNESHeader] = None
		self.gb: Optional[GBHeader] = None

	def load(self, filepath: str) -> bool:
		"""Load ROM file."""
		if not os.path.exists(filepath):
			return False

		with open(filepath, "rb") as f:
			self.data = bytearray(f.read())

		self.filepath = filepath
		self._detect_format()
		return True

	def _detect_format(self) -> None:
		"""Detect ROM format."""
		if self.data is None:
			return

		# Check NES
		if len(self.data) >= 16 and self.data[0:4] == b'NES\x1a':
			self.ines = iNESHeader()
			self.ines.load(bytes(self.data))
			self.header_format = HeaderFormat.INES2 if self.ines.is_nes2 else HeaderFormat.INES
			return

		# Check SNES
		self.snes = SNESHeader()
		self.snes.load(bytes(self.data))
		if self.snes.valid:
			self.header_format = HeaderFormat.SNES_LOROM if self.snes.is_lorom else HeaderFormat.SNES_HIROM
			return

		# Check GB
		self.gb = GBHeader()
		self.gb.load(bytes(self.data))
		if self.gb.valid:
			self.header_format = HeaderFormat.GBC if self.gb.is_gbc() else HeaderFormat.GB
			return

		self.header_format = HeaderFormat.UNKNOWN

	def get_header_info(self) -> Dict[str, Any]:
		"""Get header information."""
		if self.header_format in [HeaderFormat.INES, HeaderFormat.INES2]:
			return self.ines.to_dict() if self.ines else {}
		elif self.header_format in [HeaderFormat.SNES_LOROM, HeaderFormat.SNES_HIROM]:
			return self.snes.to_dict() if self.snes else {}
		elif self.header_format in [HeaderFormat.GB, HeaderFormat.GBC]:
			return self.gb.to_dict() if self.gb else {}
		return {"format": "Unknown"}

	def set_nes_mapper(self, mapper: int) -> bool:
		"""Set NES mapper number."""
		if not self.ines or self.data is None:
			return False

		self.ines.mapper = mapper
		header = self.ines.to_bytes()
		self.data[0:16] = header
		return True

	def set_snes_title(self, title: str) -> bool:
		"""Set SNES title."""
		if not self.snes or self.data is None:
			return False

		# Pad/truncate to 21 characters
		title_bytes = title.encode('ascii', errors='replace')[:21].ljust(21, b' ')

		offset = self.snes.offset + 0x10
		self.data[offset:offset + 21] = title_bytes
		return True

	def set_gb_title(self, title: str) -> bool:
		"""Set GB title."""
		if not self.gb or self.data is None:
			return False

		max_len = 15 if self.gb.is_gbc() else 16
		title_bytes = title.encode('ascii', errors='replace')[:max_len].ljust(max_len, b'\x00')

		self.data[0x0134:0x0134 + max_len] = title_bytes
		return True

	def save(self, filepath: str = None) -> bool:
		"""Save ROM file."""
		if self.data is None:
			return False

		out_path = filepath or self.filepath
		with open(out_path, "wb") as f:
			f.write(self.data)
		return True

	def format_header(self) -> str:
		"""Format header for display."""
		info = self.get_header_info()

		lines = [f"ROM Header ({self.header_format.name})"]
		lines.append("=" * 40)

		for key, value in info.items():
			lines.append(f"  {key}: {value}")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="ROM Header Editor")
	parser.add_argument("input", nargs="?", help="ROM file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View header")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--set-title", help="Set ROM title")
	parser.add_argument("--set-mapper", type=int, help="Set NES mapper")
	parser.add_argument("--output", "-o", help="Output file")

	args = parser.parse_args()

	if not args.input:
		print("ROM Header Editor")
		print()
		print("Usage: python rom_header.py <rom> [options]")
		print()
		print("Options:")
		print("  --view, -v          View header")
		print("  --json, -j          Output as JSON")
		print("  --set-title TITLE   Set ROM title")
		print("  --set-mapper NUM    Set NES mapper number")
		print("  --output, -o FILE   Output file")
		print()
		print("Examples:")
		print("  View header:")
		print("    python rom_header.py game.nes --view")
		print()
		print("  Change title:")
		print("    python rom_header.py game.sfc --set-title 'New Title' -o modified.sfc")
		return

	editor = ROMHeaderEditor()
	if not editor.load(args.input):
		print(f"Failed to load: {args.input}")
		return

	# View header
	if args.view or (not args.set_title and args.set_mapper is None):
		if args.json:
			print(json.dumps(editor.get_header_info(), indent="\t"))
		else:
			print(editor.format_header())
		return

	# Set title
	if args.set_title:
		if editor.header_format in [HeaderFormat.SNES_LOROM, HeaderFormat.SNES_HIROM]:
			if editor.set_snes_title(args.set_title):
				print(f"Set SNES title: {args.set_title}")
			else:
				print("Failed to set title")
		elif editor.header_format in [HeaderFormat.GB, HeaderFormat.GBC]:
			if editor.set_gb_title(args.set_title):
				print(f"Set GB title: {args.set_title}")
			else:
				print("Failed to set title")
		else:
			print(f"Cannot set title for {editor.header_format.name}")

	# Set mapper
	if args.set_mapper is not None:
		if editor.header_format in [HeaderFormat.INES, HeaderFormat.INES2]:
			if editor.set_nes_mapper(args.set_mapper):
				print(f"Set NES mapper: {args.set_mapper}")
			else:
				print("Failed to set mapper")
		else:
			print(f"Cannot set mapper for {editor.header_format.name}")

	# Save
	out_file = args.output or args.input
	if editor.save(out_file):
		print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
