#!/usr/bin/env python3
"""
ROM Expansion Tool - Expand and resize ROM files.

Tools for expanding NES, SNES, and other ROMs to larger sizes,
with proper header updates and bank management.

Usage:
	python rom_expansion.py <rom.nes> --prg-size 256
	python rom_expansion.py <rom.sfc> --size 2048
	python rom_expansion.py --info

Features:
	- NES/SNES/GB ROM expansion
	- Header auto-update
	- Bank fill patterns
	- Mirror detection
	- Safe expansion validation
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ROMFormat(Enum):
	"""ROM formats."""
	INES = auto()
	NES20 = auto()
	SFC_LOROM = auto()
	SFC_HIROM = auto()
	GB = auto()
	GBA = auto()
	GENESIS = auto()
	UNKNOWN = auto()


@dataclass
class NESHeader:
	"""NES iNES/NES2.0 header."""
	prg_rom_size: int  # In 16KB units
	chr_rom_size: int  # In 8KB units
	mapper: int
	mirroring: int  # 0=horizontal, 1=vertical
	battery: bool
	trainer: bool
	four_screen: bool
	vs_unisystem: bool
	playchoice_10: bool
	nes20: bool
	prg_ram_size: int
	chr_ram_size: int
	
	@classmethod
	def from_bytes(cls, data: bytes) -> Optional["NESHeader"]:
		"""Parse iNES header."""
		if len(data) < 16:
			return None
		if data[:4] != b"NES\x1a":
			return None
		
		prg_rom = data[4]
		chr_rom = data[5]
		flags6 = data[6]
		flags7 = data[7]
		flags8 = data[8]
		flags9 = data[9]
		flags10 = data[10]
		
		# Basic mapper
		mapper = (flags6 >> 4) | (flags7 & 0xF0)
		
		# NES 2.0 detection
		nes20 = (flags7 & 0x0C) == 0x08
		
		if nes20:
			mapper |= (flags8 & 0x0F) << 8
			prg_rom |= (flags9 & 0x0F) << 8
			chr_rom |= (flags9 & 0xF0) << 4
		
		return cls(
			prg_rom_size=prg_rom,
			chr_rom_size=chr_rom,
			mapper=mapper,
			mirroring=flags6 & 0x01,
			battery=bool(flags6 & 0x02),
			trainer=bool(flags6 & 0x04),
			four_screen=bool(flags6 & 0x08),
			vs_unisystem=bool(flags7 & 0x01),
			playchoice_10=bool(flags7 & 0x02),
			nes20=nes20,
			prg_ram_size=flags8 if not nes20 else 0,
			chr_ram_size=0
		)
	
	def to_bytes(self) -> bytes:
		"""Generate header bytes."""
		header = bytearray(16)
		header[:4] = b"NES\x1a"
		
		if self.nes20 and (self.prg_rom_size > 255 or self.chr_rom_size > 255):
			# NES 2.0 header
			header[4] = self.prg_rom_size & 0xFF
			header[5] = self.chr_rom_size & 0xFF
			
			flags6 = self.mirroring
			if self.battery:
				flags6 |= 0x02
			if self.trainer:
				flags6 |= 0x04
			if self.four_screen:
				flags6 |= 0x08
			flags6 |= (self.mapper & 0x0F) << 4
			header[6] = flags6
			
			flags7 = 0x08  # NES 2.0 identifier
			if self.vs_unisystem:
				flags7 |= 0x01
			if self.playchoice_10:
				flags7 |= 0x02
			flags7 |= (self.mapper & 0xF0)
			header[7] = flags7
			
			header[8] = (self.mapper >> 8) & 0x0F
			header[9] = ((self.prg_rom_size >> 8) & 0x0F) | ((self.chr_rom_size >> 4) & 0xF0)
		else:
			# iNES header
			header[4] = self.prg_rom_size
			header[5] = self.chr_rom_size
			
			flags6 = self.mirroring
			if self.battery:
				flags6 |= 0x02
			if self.trainer:
				flags6 |= 0x04
			if self.four_screen:
				flags6 |= 0x08
			flags6 |= (self.mapper & 0x0F) << 4
			header[6] = flags6
			
			flags7 = (self.mapper & 0xF0)
			if self.vs_unisystem:
				flags7 |= 0x01
			if self.playchoice_10:
				flags7 |= 0x02
			header[7] = flags7
			
			header[8] = self.prg_ram_size
		
		return bytes(header)


@dataclass
class SNESHeader:
	"""SNES internal header."""
	title: str
	rom_type: int
	rom_size: int  # Log2 in KB
	sram_size: int
	country: int
	license: int
	version: int
	checksum: int
	complement: int
	lorom: bool
	header_offset: int
	
	@classmethod
	def from_bytes(cls, data: bytes, offset: int) -> Optional["SNESHeader"]:
		"""Parse SNES header at offset."""
		if len(data) < offset + 0x30:
			return None
		
		header = data[offset:offset + 0x30]
		
		title = header[0x00:0x15].decode("ascii", errors="replace").rstrip()
		rom_type = header[0x15]
		rom_size = header[0x17]
		sram_size = header[0x18]
		country = header[0x19]
		license_code = header[0x1A]
		version = header[0x1B]
		complement = struct.unpack("<H", header[0x1C:0x1E])[0]
		checksum = struct.unpack("<H", header[0x1E:0x20])[0]
		
		# Validate checksum complement
		if (checksum ^ complement) != 0xFFFF:
			return None
		
		return cls(
			title=title,
			rom_type=rom_type,
			rom_size=rom_size,
			sram_size=sram_size,
			country=country,
			license=license_code,
			version=version,
			checksum=checksum,
			complement=complement,
			lorom=(offset == 0x7FB0),
			header_offset=offset
		)
	
	def get_rom_size_kb(self) -> int:
		"""Get ROM size in KB."""
		return 1 << self.rom_size


class ROMExpander:
	"""ROM expansion tool."""
	
	def __init__(self):
		self.data: bytearray = bytearray()
		self.filepath: str = ""
		self.format: ROMFormat = ROMFormat.UNKNOWN
		self.nes_header: Optional[NESHeader] = None
		self.snes_header: Optional[SNESHeader] = None
	
	def load(self, filepath: str) -> bool:
		"""Load ROM file."""
		with open(filepath, "rb") as f:
			self.data = bytearray(f.read())
		self.filepath = filepath
		self._detect_format()
		return self.format != ROMFormat.UNKNOWN
	
	def _detect_format(self) -> None:
		"""Detect ROM format."""
		if len(self.data) < 16:
			self.format = ROMFormat.UNKNOWN
			return
		
		# Check for iNES
		if self.data[:4] == b"NES\x1a":
			self.nes_header = NESHeader.from_bytes(bytes(self.data[:16]))
			self.format = ROMFormat.NES20 if self.nes_header.nes20 else ROMFormat.INES
			return
		
		# Check for Game Boy
		if len(self.data) >= 0x150:
			nintendo_logo = self.data[0x104:0x134]
			# GB logo check (first few bytes)
			if self.data[0x104:0x108] == bytes([0xCE, 0xED, 0x66, 0x66]):
				self.format = ROMFormat.GB
				return
		
		# Check for SNES
		# Try LoROM header location
		if len(self.data) >= 0x8000:
			header = SNESHeader.from_bytes(bytes(self.data), 0x7FB0)
			if header:
				self.snes_header = header
				self.format = ROMFormat.SFC_LOROM
				return
		
		# Try HiROM header location
		if len(self.data) >= 0x10000:
			header = SNESHeader.from_bytes(bytes(self.data), 0xFFB0)
			if header:
				self.snes_header = header
				self.format = ROMFormat.SFC_HIROM
				return
		
		# Check for Genesis
		if len(self.data) >= 0x200:
			if b"SEGA" in self.data[0x100:0x110]:
				self.format = ROMFormat.GENESIS
				return
		
		# Check for GBA
		if len(self.data) >= 0xC0:
			# GBA ROMs have Nintendo logo at 0x04
			if self.data[0xB2] == 0x96:  # Fixed value in GBA header
				self.format = ROMFormat.GBA
				return
		
		self.format = ROMFormat.UNKNOWN
	
	def get_info(self) -> Dict[str, Any]:
		"""Get ROM information."""
		info = {
			"filepath": self.filepath,
			"size": len(self.data),
			"format": self.format.name
		}
		
		if self.format in [ROMFormat.INES, ROMFormat.NES20]:
			if self.nes_header:
				prg_bytes = self.nes_header.prg_rom_size * 16 * 1024
				chr_bytes = self.nes_header.chr_rom_size * 8 * 1024
				info["prg_rom"] = f"{self.nes_header.prg_rom_size} x 16KB = {prg_bytes // 1024}KB"
				info["chr_rom"] = f"{self.nes_header.chr_rom_size} x 8KB = {chr_bytes // 1024}KB"
				info["mapper"] = self.nes_header.mapper
				info["mirroring"] = "Vertical" if self.nes_header.mirroring else "Horizontal"
				info["battery"] = self.nes_header.battery
				info["trainer"] = self.nes_header.trainer
		
		elif self.format in [ROMFormat.SFC_LOROM, ROMFormat.SFC_HIROM]:
			if self.snes_header:
				info["title"] = self.snes_header.title
				info["rom_size"] = f"{self.snes_header.get_rom_size_kb()}KB"
				info["sram"] = f"{(1 << self.snes_header.sram_size) if self.snes_header.sram_size else 0}KB"
				info["mapping"] = "LoROM" if self.snes_header.lorom else "HiROM"
				info["checksum"] = f"${self.snes_header.checksum:04X}"
		
		return info
	
	def expand_nes_prg(self, new_size_kb: int, fill: int = 0xFF) -> bool:
		"""Expand NES PRG ROM to new size in KB."""
		if self.format not in [ROMFormat.INES, ROMFormat.NES20]:
			return False
		if not self.nes_header:
			return False
		
		current_size = self.nes_header.prg_rom_size * 16  # In KB
		if new_size_kb <= current_size:
			return False
		
		# Calculate expansion
		new_units = new_size_kb // 16
		if new_units > 255 and not self.nes_header.nes20:
			# Need NES 2.0 for > 4MB
			self.nes_header.nes20 = True
		
		# Find PRG start
		header_size = 16
		trainer_size = 512 if self.nes_header.trainer else 0
		prg_start = header_size + trainer_size
		prg_end = prg_start + (current_size * 1024)
		chr_size = self.nes_header.chr_rom_size * 8 * 1024
		
		# Extract CHR
		chr_data = bytes(self.data[prg_end:prg_end + chr_size]) if chr_size else b""
		
		# Expand PRG
		new_prg_size = new_size_kb * 1024
		old_prg = self.data[prg_start:prg_end]
		
		# Create new PRG with fill
		new_prg = bytearray([fill] * new_prg_size)
		
		# Copy old PRG to end (for bank mapping)
		offset = new_prg_size - len(old_prg)
		new_prg[offset:] = old_prg
		
		# Rebuild ROM
		self.nes_header.prg_rom_size = new_units
		new_header = self.nes_header.to_bytes()
		
		trainer_data = self.data[header_size:prg_start] if trainer_size else b""
		
		self.data = bytearray(new_header + trainer_data + new_prg + chr_data)
		
		return True
	
	def expand_nes_chr(self, new_size_kb: int, fill: int = 0x00) -> bool:
		"""Expand NES CHR ROM to new size in KB."""
		if self.format not in [ROMFormat.INES, ROMFormat.NES20]:
			return False
		if not self.nes_header:
			return False
		
		current_size = self.nes_header.chr_rom_size * 8  # In KB
		if new_size_kb <= current_size:
			return False
		
		new_units = new_size_kb // 8
		if new_units > 255 and not self.nes_header.nes20:
			self.nes_header.nes20 = True
		
		# Find CHR location
		header_size = 16
		trainer_size = 512 if self.nes_header.trainer else 0
		prg_size = self.nes_header.prg_rom_size * 16 * 1024
		chr_start = header_size + trainer_size + prg_size
		
		# Get existing data
		header_and_prg = bytes(self.data[:chr_start])
		old_chr = bytes(self.data[chr_start:]) if current_size else b""
		
		# Create new CHR
		new_chr_size = new_size_kb * 1024
		new_chr = bytearray([fill] * new_chr_size)
		new_chr[:len(old_chr)] = old_chr
		
		# Update header
		self.nes_header.chr_rom_size = new_units
		new_header = self.nes_header.to_bytes()
		
		# Rebuild
		self.data = bytearray(new_header + header_and_prg[16:] + new_chr)
		
		return True
	
	def expand_snes(self, new_size_kb: int, fill: int = 0x00) -> bool:
		"""Expand SNES ROM to new size in KB."""
		if self.format not in [ROMFormat.SFC_LOROM, ROMFormat.SFC_HIROM]:
			return False
		
		current_size = len(self.data) // 1024
		if new_size_kb <= current_size:
			return False
		
		# Must be power of 2
		if new_size_kb & (new_size_kb - 1):
			# Round up to next power of 2
			new_size_kb = 1 << (new_size_kb - 1).bit_length()
		
		# Calculate new size byte
		import math
		new_size_byte = int(math.log2(new_size_kb))
		
		# Expand data
		expansion = (new_size_kb * 1024) - len(self.data)
		self.data.extend([fill] * expansion)
		
		# Update header
		if self.snes_header:
			header_offset = self.snes_header.header_offset
			self.data[header_offset + 0x17] = new_size_byte
			
			# Recalculate checksum
			self._update_snes_checksum()
		
		return True
	
	def _update_snes_checksum(self) -> None:
		"""Recalculate SNES checksum."""
		if not self.snes_header:
			return
		
		# Clear old checksum
		offset = self.snes_header.header_offset
		self.data[offset + 0x1C:offset + 0x20] = [0, 0, 0xFF, 0xFF]
		
		# Calculate checksum
		checksum = sum(self.data) & 0xFFFF
		complement = checksum ^ 0xFFFF
		
		# Write new values
		self.data[offset + 0x1C] = complement & 0xFF
		self.data[offset + 0x1D] = (complement >> 8) & 0xFF
		self.data[offset + 0x1E] = checksum & 0xFF
		self.data[offset + 0x1F] = (checksum >> 8) & 0xFF
	
	def detect_mirrors(self) -> List[Tuple[int, int]]:
		"""Detect mirrored banks in ROM."""
		mirrors = []
		
		if self.format in [ROMFormat.INES, ROMFormat.NES20]:
			bank_size = 16 * 1024
			prg_start = 16 + (512 if self.nes_header and self.nes_header.trainer else 0)
			prg_end = prg_start + (self.nes_header.prg_rom_size * 16 * 1024 if self.nes_header else 0)
			
			banks = []
			for i in range(prg_start, prg_end, bank_size):
				banks.append(bytes(self.data[i:i + bank_size]))
			
			for i, bank1 in enumerate(banks):
				for j, bank2 in enumerate(banks[i + 1:], i + 1):
					if bank1 == bank2:
						mirrors.append((i, j))
		
		elif self.format in [ROMFormat.SFC_LOROM, ROMFormat.SFC_HIROM]:
			bank_size = 32 * 1024 if self.format == ROMFormat.SFC_LOROM else 64 * 1024
			
			banks = []
			for i in range(0, len(self.data), bank_size):
				banks.append(bytes(self.data[i:i + bank_size]))
			
			for i, bank1 in enumerate(banks):
				for j, bank2 in enumerate(banks[i + 1:], i + 1):
					if bank1 == bank2:
						mirrors.append((i, j))
		
		return mirrors
	
	def save(self, filepath: Optional[str] = None) -> None:
		"""Save ROM file."""
		filepath = filepath or self.filepath
		with open(filepath, "wb") as f:
			f.write(self.data)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="ROM Expansion Tool")
	parser.add_argument("romfile", nargs="?", help="ROM file to expand")
	parser.add_argument("--info", "-i", action="store_true",
						help="Show ROM information")
	parser.add_argument("--prg-size", type=int,
						help="New PRG ROM size in KB (NES)")
	parser.add_argument("--chr-size", type=int,
						help="New CHR ROM size in KB (NES)")
	parser.add_argument("--size", type=int,
						help="New ROM size in KB (SNES/GB)")
	parser.add_argument("--fill", type=lambda x: int(x, 0), default=0xFF,
						help="Fill byte (default: 0xFF)")
	parser.add_argument("--detect-mirrors", "-m", action="store_true",
						help="Detect mirrored banks")
	parser.add_argument("--output", "-o", help="Output file")
	
	args = parser.parse_args()
	
	expander = ROMExpander()
	
	if not args.romfile:
		print("ROM Expansion Tool")
		print()
		print("Usage: python rom_expansion.py <rom.nes> [options]")
		print()
		print("Options:")
		print("  --info              Show ROM info")
		print("  --prg-size KB       Expand PRG ROM (NES)")
		print("  --chr-size KB       Expand CHR ROM (NES)")
		print("  --size KB           Expand ROM (SNES/GB)")
		print("  --fill BYTE         Fill byte (hex OK)")
		print("  --detect-mirrors    Find mirrored banks")
		print("  --output FILE       Output file")
		return
	
	if not os.path.exists(args.romfile):
		print(f"File not found: {args.romfile}")
		return
	
	if not expander.load(args.romfile):
		print(f"Unrecognized ROM format: {args.romfile}")
		return
	
	print(f"Loaded: {args.romfile}")
	print(f"Format: {expander.format.name}")
	print(f"Size: {len(expander.data)} bytes ({len(expander.data) // 1024} KB)")
	print()
	
	# Show info
	if args.info:
		info = expander.get_info()
		print("ROM Information:")
		for key, value in info.items():
			if key != "filepath":
				print(f"  {key}: {value}")
		print()
	
	# Detect mirrors
	if args.detect_mirrors:
		mirrors = expander.detect_mirrors()
		if mirrors:
			print(f"Mirrored Banks ({len(mirrors)} pairs):")
			for i, j in mirrors[:10]:
				print(f"  Bank {i} == Bank {j}")
			if len(mirrors) > 10:
				print(f"  ... and {len(mirrors) - 10} more")
		else:
			print("No mirrored banks detected")
		print()
	
	# Expand PRG
	if args.prg_size:
		if expander.expand_nes_prg(args.prg_size, args.fill):
			print(f"Expanded PRG ROM to {args.prg_size} KB")
		else:
			print("PRG expansion failed")
	
	# Expand CHR
	if args.chr_size:
		if expander.expand_nes_chr(args.chr_size, args.fill):
			print(f"Expanded CHR ROM to {args.chr_size} KB")
		else:
			print("CHR expansion failed")
	
	# Expand SNES
	if args.size:
		if expander.expand_snes(args.size, args.fill):
			print(f"Expanded ROM to {args.size} KB")
		else:
			print("ROM expansion failed")
	
	# Save
	if args.prg_size or args.chr_size or args.size:
		output = args.output or args.romfile
		expander.save(output)
		print(f"Saved: {output}")
		print(f"New size: {len(expander.data)} bytes")


if __name__ == "__main__":
	main()
