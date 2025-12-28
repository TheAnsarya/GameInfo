#!/usr/bin/env python3
"""
ROM Catalog Generator

Generates a JSON catalog of all ROM files in a directory with:
- File metadata (name, path, size, extension)
- Multiple hash algorithms (CRC32, MD5, SHA-1, SHA-256, SHA-512, BLAKE2b, BLAKE3)
- SNES header information (if applicable)
- Descriptions based on filename parsing

This catalog allows scripts to reference ROMs by hash even though
the actual ROM files are not in source control due to copyright.
"""

import argparse
import binascii
import hashlib
import json
import os
import re
import struct
import zlib
from dataclasses import asdict, dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional

# Try to import blake3 (optional, faster hashing)
try:
	import blake3
	HAS_BLAKE3 = True
except ImportError:
	HAS_BLAKE3 = False


@dataclass
class SNESHeader:
	"""SNES ROM header information."""
	title: str = ""
	mapper: str = ""
	rom_type: str = ""
	rom_size: int = 0
	sram_size: int = 0
	country: str = ""
	license: str = ""
	version: int = 0
	checksum: int = 0
	complement: int = 0
	header_offset: int = 0
	is_valid: bool = False


@dataclass
class NESHeader:
	"""NES ROM header information (iNES format)."""
	format: str = ""  # iNES, NES2.0
	prg_rom_size: int = 0  # PRG ROM size in bytes
	chr_rom_size: int = 0  # CHR ROM size in bytes
	mapper: int = 0  # Mapper number
	mapper_name: str = ""
	mirroring: str = ""  # Horizontal, Vertical, Four-screen
	has_battery: bool = False
	has_trainer: bool = False
	prg_ram_size: int = 0
	chr_ram_size: int = 0
	tv_system: str = ""  # NTSC, PAL, Dual
	is_valid: bool = False


@dataclass
class GBAHeader:
	"""GBA ROM header information."""
	title: str = ""
	game_code: str = ""
	maker_code: str = ""
	unit_code: int = 0
	software_version: int = 0
	complement: int = 0
	is_valid: bool = False


@dataclass
class RomFile:
	"""ROM file information."""
	filename: str
	relative_path: str
	size: int
	extension: str

	# Hashes
	crc32: str = ""
	md5: str = ""
	sha1: str = ""
	sha256: str = ""
	sha512: str = ""
	blake2b: str = ""
	blake3: str = ""

	# Metadata
	description: str = ""
	platform: str = ""
	region: str = ""
	revision: str = ""
	is_verified: bool = False
	is_bad_dump: bool = False
	is_overdump: bool = False
	is_underdump: bool = False
	is_hack: bool = False
	is_translation: bool = False
	is_unlicensed: bool = False
	is_prototype: bool = False
	is_beta: bool = False

	# SNES-specific
	snes_header: Optional[Dict[str, Any]] = None

	# NES-specific
	nes_header: Optional[Dict[str, Any]] = None

	# GBA-specific
	gba_header: Optional[Dict[str, Any]] = None


@dataclass
class RomCatalog:
	"""ROM catalog with folder structure."""
	generated: str = ""
	generator: str = "rom_catalog_generator.py"
	version: str = "1.0.0"
	root_path: str = ""
	total_files: int = 0
	total_size: int = 0
	platforms: Dict[str, int] = field(default_factory=dict)
	folders: Dict[str, Any] = field(default_factory=dict)
	files: List[Dict[str, Any]] = field(default_factory=list)


# Region codes
REGION_CODES = {
	"(U)": "USA",
	"(E)": "Europe",
	"(J)": "Japan",
	"(F)": "France",
	"(G)": "Germany",
	"(S)": "Spain",
	"(I)": "Italy",
	"(Sw)": "Sweden",
	"(FC)": "French Canadian",
	"(D)": "Germany/Dutch",
	"(A)": "Australia",
	"(K)": "Korea",
	"(C)": "China",
	"(W)": "World",
	"(PD)": "Public Domain",
	"(Unl)": "Unlicensed",
}

# Platform detection by extension
PLATFORM_EXTENSIONS = {
	".sfc": "SNES",
	".smc": "SNES",
	".nes": "NES",
	".gb": "Game Boy",
	".gbc": "Game Boy Color",
	".gba": "Game Boy Advance",
	".smd": "Genesis/Mega Drive",
	".gen": "Genesis/Mega Drive",
	".md": "Genesis/Mega Drive",
	".n64": "Nintendo 64",
	".z64": "Nintendo 64",
	".v64": "Nintendo 64",
	".nds": "Nintendo DS",
	".3ds": "Nintendo 3DS",
	".pce": "PC Engine/TurboGrafx-16",
	".iso": "CD-ROM",
	".bin": "Binary",
	".a26": "Atari 2600",
	".a78": "Atari 7800",
	".lnx": "Atari Lynx",
	".jag": "Atari Jaguar",
	".32x": "Sega 32X",
	".sms": "Sega Master System",
	".gg": "Sega Game Gear",
	".sat": "Sega Saturn",
	".cdi": "Sega Dreamcast",
	".ws": "WonderSwan",
	".wsc": "WonderSwan Color",
	".ngp": "Neo Geo Pocket",
	".ngc": "Neo Geo Pocket Color",
	".vec": "Vectrex",
}

# SNES mapper types
SNES_MAPPERS = {
	0x20: "LoROM",
	0x21: "HiROM",
	0x22: "LoROM+S-DD1",
	0x23: "LoROM+SA-1",
	0x25: "ExHiROM",
	0x30: "LoROM+FastROM",
	0x31: "HiROM+FastROM",
	0x32: "ExLoROM",
	0x35: "ExHiROM+FastROM",
}

# SNES ROM types
SNES_ROM_TYPES = {
	0x00: "ROM only",
	0x01: "ROM+RAM",
	0x02: "ROM+RAM+Battery",
	0x03: "ROM+DSP",
	0x04: "ROM+DSP+RAM",
	0x05: "ROM+DSP+RAM+Battery",
	0x13: "ROM+SuperFX",
	0x14: "ROM+SuperFX+RAM",
	0x15: "ROM+SuperFX+RAM+Battery",
	0x25: "ROM+OBC1",
	0x32: "ROM+SA-1",
	0x33: "ROM+SA-1+RAM",
	0x34: "ROM+SA-1+RAM+Battery",
	0x35: "ROM+S-DD1",
	0x36: "ROM+S-DD1+RAM",
	0xE3: "ROM+SGB",
	0xF3: "ROM+CX4",
	0xF5: "ROM+ST018",
	0xF6: "ROM+ST010/ST011",
	0xF9: "ROM+SPC7110",
}

# SNES country codes
SNES_COUNTRIES = {
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
	0x0E: "International",
	0x0F: "Canada",
	0x10: "Brazil",
	0x11: "Australia",
}

# NES mapper names (common ones)
NES_MAPPERS = {
	0: "NROM",
	1: "MMC1/SxROM",
	2: "UxROM",
	3: "CNROM",
	4: "MMC3/TxROM",
	5: "MMC5/ExROM",
	7: "AxROM",
	9: "MMC2/PxROM",
	10: "MMC4/FxROM",
	11: "Color Dreams",
	13: "CPROM",
	15: "100-in-1",
	16: "Bandai FCG",
	18: "Jaleco SS88006",
	19: "Namco 129/163",
	21: "Konami VRC4a/VRC4c",
	22: "Konami VRC2a",
	23: "Konami VRC2b/VRC4e/VRC4f",
	24: "Konami VRC6a",
	25: "Konami VRC4b/VRC4d",
	26: "Konami VRC6b",
	33: "Taito TC0190",
	34: "BNROM/NINA-001",
	64: "Tengen RAMBO-1",
	65: "Irem H-3001",
	66: "GxROM/MxROM",
	67: "Sunsoft-3",
	68: "Sunsoft-4",
	69: "Sunsoft FME-7",
	71: "Codemasters/Camerica",
	73: "Konami VRC3",
	75: "Konami VRC1",
	76: "Namcot 108 variant",
	78: "Irem 74HC161/32",
	79: "NINA-003/NINA-006",
	80: "Taito X1-005",
	85: "Konami VRC7",
	87: "Jaleco JF-09/JF-10",
	88: "Namcot 118",
	89: "Sunsoft-2",
	94: "Capcom UN1ROM",
	95: "Namcot 118 variant",
	105: "NES-EVENT/MMC1",
	118: "TxSROM",
	119: "TQROM",
	140: "Jaleco JF-11/14",
	180: "Crazy Climber",
	185: "CNROM variant",
	206: "Namco 118",
	228: "Action 52",
}

# GBA maker codes (common ones)
GBA_MAKERS = {
	"01": "Nintendo",
	"08": "Capcom",
	"13": "Electronic Arts",
	"18": "Hudson Soft",
	"20": "Destination Software",
	"25": "San-X",
	"28": "Kemco Japan",
	"29": "Seta",
	"33": "Bandai",
	"34": "Sunsoft",
	"35": "Kemco",
	"41": "Ubisoft",
	"42": "Atlus",
	"44": "Malibu",
	"46": "Angel",
	"47": "Spectrum Holobyte",
	"49": "Irem",
	"4A": "Virgin",
	"4D": "Malibu",
	"4F": "U.S. Gold",
	"50": "Absolute",
	"51": "Acclaim",
	"52": "Activision",
	"53": "American Sammy",
	"54": "GameTek",
	"55": "Park Place",
	"56": "LJN",
	"57": "Matchbox",
	"59": "Milton Bradley",
	"5A": "Mindscape",
	"5B": "Romstar",
	"5C": "Naxat Soft",
	"5D": "Tradewest",
	"60": "Titus",
	"61": "Virgin",
	"67": "Ocean",
	"69": "Electronic Arts",
	"6E": "Elite Systems",
	"6F": "Electro Brain",
	"70": "Infogrames",
	"71": "Interplay",
	"72": "JVC",
	"73": "Parker Brothers",
	"75": "Sales Curve",
	"78": "THQ",
	"79": "Accolade",
	"7A": "Triffix",
	"7C": "Microprose",
	"7F": "Kemco",
	"80": "Misawa",
	"83": "LOZC",
	"86": "Tokuma Shoten",
	"8B": "Bullet-Proof Software",
	"8C": "Vic Tokai",
	"8E": "Ape",
	"8F": "I'Max",
	"91": "Chunsoft",
	"92": "Video System",
	"93": "BEC",
	"95": "Varie",
	"97": "Kaneko",
	"99": "ARC",
	"9A": "Nihon Bussan",
	"9B": "Tecmo",
	"9C": "Imagineer",
	"9D": "Banpresto",
	"9F": "Nova",
	"A1": "Hori Electric",
	"A4": "Konami",
	"A7": "Takara",
	"A9": "Technos Japan",
	"AA": "Broderbund",
	"AC": "Toei Animation",
	"AD": "Toho",
	"AF": "Namco",
	"B0": "Acclaim",
	"B1": "ASCII or Nexoft",
	"B2": "Bandai",
	"B4": "Square Enix",
	"B6": "HAL Laboratory",
	"B7": "SNK",
	"B9": "Pony Canyon",
	"BA": "Culture Brain",
	"BB": "Sunsoft",
	"BD": "Sony Imagesoft",
	"BF": "Sammy",
	"C0": "Taito",
	"C2": "Kemco",
	"C3": "Squaresoft",
	"C4": "Tokuma Shoten Intermedia",
	"C5": "Data East",
	"C6": "Tonkinhouse",
	"C8": "Koei",
	"C9": "UFL",
	"CA": "Ultra",
	"CB": "Vap",
	"CC": "Use Corporation",
	"CD": "Meldac",
	"CE": "Pony Canyon",
	"CF": "Angel",
	"D0": "Taito",
	"D1": "Sofel",
	"D2": "Quest",
	"D3": "Sigma Enterprises",
	"D4": "ASK Kodansha",
	"D6": "Naxat Soft",
	"D7": "Copya System",
	"DA": "Tomy",
	"DB": "LJN",
	"DD": "NCS",
	"DE": "Human",
	"DF": "Altron",
	"E0": "Jaleco",
	"E1": "Towa Chiki",
	"E2": "Yutaka",
	"E3": "Varie",
	"E5": "Epoch",
	"E7": "Athena",
	"E8": "Asmik",
	"E9": "Natsume",
	"EA": "King Records",
	"EB": "Atlus",
	"EC": "Epic/Sony Records",
	"EE": "IGS",
	"F0": "A Wave",
	"F3": "Extreme Entertainment",
	"FF": "LJN",
}


def calculate_hashes(filepath: Path) -> Dict[str, str]:
	"""Calculate all hash values for a file."""
	hashes = {
		"crc32": "",
		"md5": "",
		"sha1": "",
		"sha256": "",
		"sha512": "",
		"blake2b": "",
		"blake3": "",
	}

	try:
		with open(filepath, "rb") as f:
			data = f.read()

		# CRC32
		hashes["crc32"] = format(zlib.crc32(data) & 0xffffffff, "08x")

		# MD5
		hashes["md5"] = hashlib.md5(data).hexdigest()

		# SHA-1
		hashes["sha1"] = hashlib.sha1(data).hexdigest()

		# SHA-256
		hashes["sha256"] = hashlib.sha256(data).hexdigest()

		# SHA-512
		hashes["sha512"] = hashlib.sha512(data).hexdigest()

		# BLAKE2b
		hashes["blake2b"] = hashlib.blake2b(data).hexdigest()

		# BLAKE3 (if available)
		if HAS_BLAKE3:
			hashes["blake3"] = blake3.blake3(data).hexdigest()

	except Exception as e:
		print(f"Error calculating hashes for {filepath}: {e}")

	return hashes


def parse_snes_header(filepath: Path) -> Optional[SNESHeader]:
	"""Parse SNES ROM header."""
	try:
		with open(filepath, "rb") as f:
			data = f.read()

		# Check for copier header (512 bytes)
		header_offset = 0
		if len(data) % 0x8000 == 512:
			header_offset = 512

		# Try LoROM location first ($7FC0)
		lorom_offset = header_offset + 0x7FC0
		hirom_offset = header_offset + 0xFFC0

		header = SNESHeader()

		# Check LoROM
		if lorom_offset + 32 <= len(data):
			# Read checksum and complement from LoROM location
			checksum = struct.unpack("<H", data[lorom_offset + 0x1C:lorom_offset + 0x1E])[0]
			complement = struct.unpack("<H", data[lorom_offset + 0x1E:lorom_offset + 0x20])[0]

			if (checksum ^ complement) == 0xFFFF:
				header.header_offset = lorom_offset
				header.is_valid = True

		# Check HiROM if LoROM invalid
		if not header.is_valid and hirom_offset + 32 <= len(data):
			checksum = struct.unpack("<H", data[hirom_offset + 0x1C:hirom_offset + 0x1E])[0]
			complement = struct.unpack("<H", data[hirom_offset + 0x1E:hirom_offset + 0x20])[0]

			if (checksum ^ complement) == 0xFFFF:
				header.header_offset = hirom_offset
				header.is_valid = True

		if header.is_valid:
			offset = header.header_offset

			# Title (21 bytes, ASCII)
			title_bytes = data[offset:offset + 21]
			header.title = title_bytes.decode("ascii", errors="replace").strip()

			# Mapper mode
			mapper_byte = data[offset + 0x15]
			header.mapper = SNES_MAPPERS.get(mapper_byte, f"Unknown (0x{mapper_byte:02X})")

			# ROM type
			rom_type_byte = data[offset + 0x16]
			header.rom_type = SNES_ROM_TYPES.get(rom_type_byte, f"Unknown (0x{rom_type_byte:02X})")

			# ROM size (2^n KB)
			rom_size_byte = data[offset + 0x17]
			header.rom_size = (1 << rom_size_byte) * 1024

			# SRAM size (2^n KB, 0 = none)
			sram_size_byte = data[offset + 0x18]
			header.sram_size = (1 << sram_size_byte) * 1024 if sram_size_byte > 0 else 0

			# Country
			country_byte = data[offset + 0x19]
			header.country = SNES_COUNTRIES.get(country_byte, f"Unknown (0x{country_byte:02X})")

			# License code
			header.license = f"0x{data[offset + 0x1A]:02X}"

			# Version
			header.version = data[offset + 0x1B]

			# Checksum values
			header.complement = struct.unpack("<H", data[offset + 0x1C:offset + 0x1E])[0]
			header.checksum = struct.unpack("<H", data[offset + 0x1E:offset + 0x20])[0]

			return header

	except Exception as e:
		print(f"Error parsing SNES header for {filepath}: {e}")

	return None


def parse_nes_header(filepath: Path) -> Optional[NESHeader]:
	"""Parse NES ROM header (iNES/NES2.0 format)."""
	try:
		with open(filepath, "rb") as f:
			data = f.read(16)  # Header is 16 bytes

		if len(data) < 16:
			return None

		# Check for NES signature
		if data[0:4] != b"NES\x1a":
			return None

		header = NESHeader()
		header.is_valid = True

		# Check for NES 2.0 format
		if (data[7] & 0x0C) == 0x08:
			header.format = "NES2.0"
		else:
			header.format = "iNES"

		# PRG ROM size
		prg_lsb = data[4]
		if header.format == "NES2.0":
			prg_msb = data[9] & 0x0F
			if prg_msb == 0x0F:
				# Exponent-multiplier notation
				exponent = (prg_lsb >> 2) & 0x3F
				multiplier = prg_lsb & 0x03
				header.prg_rom_size = (2 ** exponent) * (multiplier * 2 + 1)
			else:
				header.prg_rom_size = ((prg_msb << 8) | prg_lsb) * 16384
		else:
			header.prg_rom_size = prg_lsb * 16384

		# CHR ROM size
		chr_lsb = data[5]
		if header.format == "NES2.0":
			chr_msb = (data[9] >> 4) & 0x0F
			if chr_msb == 0x0F:
				exponent = (chr_lsb >> 2) & 0x3F
				multiplier = chr_lsb & 0x03
				header.chr_rom_size = (2 ** exponent) * (multiplier * 2 + 1)
			else:
				header.chr_rom_size = ((chr_msb << 8) | chr_lsb) * 8192
		else:
			header.chr_rom_size = chr_lsb * 8192

		# Flags 6
		flags6 = data[6]
		if flags6 & 0x08:
			header.mirroring = "Four-screen"
		elif flags6 & 0x01:
			header.mirroring = "Vertical"
		else:
			header.mirroring = "Horizontal"

		header.has_battery = bool(flags6 & 0x02)
		header.has_trainer = bool(flags6 & 0x04)

		# Mapper number
		mapper_lo = (flags6 >> 4) & 0x0F
		mapper_hi = (data[7] >> 4) & 0x0F

		if header.format == "NES2.0":
			mapper_ext = (data[8] & 0x0F) << 8
			header.mapper = mapper_ext | (mapper_hi << 4) | mapper_lo
		else:
			header.mapper = (mapper_hi << 4) | mapper_lo

		header.mapper_name = NES_MAPPERS.get(header.mapper, f"Unknown ({header.mapper})")

		# PRG RAM size
		if header.format == "NES2.0":
			prg_ram_shift = data[10] & 0x0F
			prg_nvram_shift = (data[10] >> 4) & 0x0F
			if prg_ram_shift > 0:
				header.prg_ram_size = 64 << prg_ram_shift
			if prg_nvram_shift > 0:
				header.prg_ram_size = 64 << prg_nvram_shift
		else:
			prg_ram = data[8]
			header.prg_ram_size = prg_ram * 8192 if prg_ram > 0 else 8192

		# CHR RAM size
		if header.format == "NES2.0":
			chr_ram_shift = data[11] & 0x0F
			chr_nvram_shift = (data[11] >> 4) & 0x0F
			if chr_ram_shift > 0:
				header.chr_ram_size = 64 << chr_ram_shift
			if chr_nvram_shift > 0:
				header.chr_ram_size = 64 << chr_nvram_shift
		else:
			# CHR RAM is used when CHR ROM = 0
			if header.chr_rom_size == 0:
				header.chr_ram_size = 8192

		# TV system
		if header.format == "NES2.0":
			tv_byte = data[12] & 0x03
			if tv_byte == 0:
				header.tv_system = "NTSC"
			elif tv_byte == 1:
				header.tv_system = "PAL"
			elif tv_byte == 2:
				header.tv_system = "Dual"
			else:
				header.tv_system = "Dendy"
		else:
			# iNES doesn't have reliable TV system info
			header.tv_system = "Unknown"

		return header

	except Exception as e:
		print(f"Error parsing NES header for {filepath}: {e}")

	return None


def parse_gba_header(filepath: Path) -> Optional[GBAHeader]:
	"""Parse GBA ROM header."""
	try:
		with open(filepath, "rb") as f:
			data = f.read(0xC0)  # Header is at start, we need up to $C0

		if len(data) < 0xC0:
			return None

		# Check for valid GBA ROM (fixed value at $B2)
		if data[0xB2] != 0x96:
			return None

		header = GBAHeader()
		header.is_valid = True

		# Title (12 bytes at $A0)
		title_bytes = data[0xA0:0xAC]
		header.title = title_bytes.decode("ascii", errors="replace").strip("\x00").strip()

		# Game code (4 bytes at $AC)
		game_code_bytes = data[0xAC:0xB0]
		header.game_code = game_code_bytes.decode("ascii", errors="replace")

		# Maker code (2 bytes at $B0)
		maker_code_bytes = data[0xB0:0xB2]
		header.maker_code = maker_code_bytes.decode("ascii", errors="replace")

		# Unit code ($B3)
		header.unit_code = data[0xB3]

		# Software version ($BC)
		header.software_version = data[0xBC]

		# Header checksum complement ($BD)
		header.complement = data[0xBD]

		return header

	except Exception as e:
		print(f"Error parsing GBA header for {filepath}: {e}")

	return None


def parse_filename(filename: str) -> Dict[str, Any]:
	"""Parse ROM filename for metadata."""
	info = {
		"description": "",
		"region": "",
		"revision": "",
		"is_verified": False,
		"is_bad_dump": False,
		"is_overdump": False,
		"is_underdump": False,
		"is_hack": False,
		"is_translation": False,
		"is_unlicensed": False,
		"is_prototype": False,
		"is_beta": False,
	}

	# Get base name without extension
	base = os.path.splitext(filename)[0]

	# Check for verified dump [!]
	if "[!]" in base:
		info["is_verified"] = True

	# Check for bad dump [b]
	if "[b" in base.lower() or "(bad)" in base.lower():
		info["is_bad_dump"] = True

	# Check for overdump [o]
	if "[o" in base.lower():
		info["is_overdump"] = True

	# Check for underdump
	if "[u]" in base.lower():
		info["is_underdump"] = True

	# Check for hack [h]
	if "[h" in base.lower() or "(hack)" in base.lower():
		info["is_hack"] = True

	# Check for translation [T]
	if "[t" in base.lower() or "(translation)" in base.lower():
		info["is_translation"] = True

	# Check for prototype
	if "(prototype)" in base.lower() or "(proto)" in base.lower():
		info["is_prototype"] = True

	# Check for beta
	if "(beta" in base.lower():
		info["is_beta"] = True

	# Extract region
	for code, region in REGION_CODES.items():
		if code in base:
			info["region"] = region
			# Check for unlicensed
			if code == "(Unl)":
				info["is_unlicensed"] = True
			break

	# Extract version/revision
	rev_match = re.search(r"\(V(\d+\.\d+)\)", base)
	if rev_match:
		info["revision"] = rev_match.group(1)

	# Generate description
	# Remove codes from name for clean description
	clean_name = base
	for code in REGION_CODES.keys():
		clean_name = clean_name.replace(code, "")
	clean_name = re.sub(r"\[.*?\]", "", clean_name)
	clean_name = re.sub(r"\(V\d+\.\d+\)", "", clean_name)
	clean_name = re.sub(r"\(Beta\d*\)", "", clean_name, flags=re.IGNORECASE)
	clean_name = re.sub(r"\(Prototype\)", "", clean_name, flags=re.IGNORECASE)
	clean_name = clean_name.strip()

	info["description"] = clean_name

	return info


def process_rom_file(filepath: Path, root_path: Path) -> RomFile:
	"""Process a single ROM file and gather all information."""
	relative = filepath.relative_to(root_path)

	# Get basic info
	rom = RomFile(
		filename=filepath.name,
		relative_path=str(relative).replace("\\", "/"),
		size=filepath.stat().st_size,
		extension=filepath.suffix.lower(),
	)

	# Calculate hashes
	hashes = calculate_hashes(filepath)
	rom.crc32 = hashes["crc32"]
	rom.md5 = hashes["md5"]
	rom.sha1 = hashes["sha1"]
	rom.sha256 = hashes["sha256"]
	rom.sha512 = hashes["sha512"]
	rom.blake2b = hashes["blake2b"]
	rom.blake3 = hashes["blake3"]

	# Parse filename
	file_info = parse_filename(filepath.name)
	rom.description = file_info["description"]
	rom.region = file_info["region"]
	rom.revision = file_info["revision"]
	rom.is_verified = file_info["is_verified"]
	rom.is_bad_dump = file_info["is_bad_dump"]
	rom.is_overdump = file_info["is_overdump"]
	rom.is_underdump = file_info["is_underdump"]
	rom.is_hack = file_info["is_hack"]
	rom.is_translation = file_info["is_translation"]
	rom.is_unlicensed = file_info["is_unlicensed"]
	rom.is_prototype = file_info["is_prototype"]
	rom.is_beta = file_info["is_beta"]

	# Detect platform
	rom.platform = PLATFORM_EXTENSIONS.get(rom.extension, "Unknown")

	# Check parent folder for platform hint
	parent_folder = relative.parts[0] if len(relative.parts) > 1 else ""
	if parent_folder.upper() == "SNES":
		rom.platform = "SNES"
	elif parent_folder.upper() == "NES":
		rom.platform = "NES"
	elif parent_folder.upper() == "GBA":
		rom.platform = "Game Boy Advance"
	elif parent_folder.upper() == "GB":
		rom.platform = "Game Boy"
	elif parent_folder.upper() == "GBC":
		rom.platform = "Game Boy Color"
	elif parent_folder.upper() == "GENESIS" or parent_folder.upper() == "MD":
		rom.platform = "Genesis/Mega Drive"

	# Parse SNES header if applicable
	if rom.platform == "SNES" and rom.extension in [".sfc", ".smc"]:
		header = parse_snes_header(filepath)
		if header and header.is_valid:
			rom.snes_header = asdict(header)

	# Parse NES header if applicable
	if rom.platform == "NES" and rom.extension == ".nes":
		header = parse_nes_header(filepath)
		if header and header.is_valid:
			rom.nes_header = asdict(header)

	# Parse GBA header if applicable
	if rom.platform == "Game Boy Advance" and rom.extension == ".gba":
		header = parse_gba_header(filepath)
		if header and header.is_valid:
			rom.gba_header = asdict(header)

	return rom


def build_folder_structure(files: List[RomFile]) -> Dict[str, Any]:
	"""Build nested folder structure from file list."""
	root: Dict[str, Any] = {}

	for rom in files:
		path_parts = Path(rom.relative_path).parts
		current = root

		# Navigate/create folders
		for i, part in enumerate(path_parts[:-1]):
			if part not in current:
				current[part] = {
					"_type": "folder",
					"_files": [],
					"_subfolders": {}
				}
			current = current[part]["_subfolders"] if "_subfolders" in current[part] else current[part]

		# Add file to final folder
		folder_name = path_parts[-2] if len(path_parts) > 1 else "/"
		if folder_name not in current:
			current[folder_name] = {
				"_type": "folder",
				"_files": [],
				"_subfolders": {}
			}
		current[folder_name]["_files"].append({
			"filename": rom.filename,
			"size": rom.size,
			"crc32": rom.crc32,
			"sha256": rom.sha256,
		})

	return root


def generate_catalog(root_path: Path, output_path: Path, verbose: bool = True) -> RomCatalog:
	"""Generate ROM catalog for a directory."""
	catalog = RomCatalog(
		generated=datetime.now().isoformat(),
		root_path=str(root_path),
	)

	# Find all ROM files
	rom_extensions = set(PLATFORM_EXTENSIONS.keys())

	files: List[RomFile] = []
	platform_counts: Dict[str, int] = {}
	total_size = 0

	for filepath in root_path.rglob("*"):
		if filepath.is_file() and filepath.suffix.lower() in rom_extensions:
			if verbose:
				print(f"Processing: {filepath.name}")

			rom = process_rom_file(filepath, root_path)
			files.append(rom)

			# Count platforms
			platform_counts[rom.platform] = platform_counts.get(rom.platform, 0) + 1
			total_size += rom.size

	# Sort files by path
	files.sort(key=lambda x: x.relative_path)

	# Update catalog
	catalog.total_files = len(files)
	catalog.total_size = total_size
	catalog.platforms = platform_counts
	catalog.files = [asdict(f) for f in files]
	catalog.folders = build_folder_structure(files)

	# Save to JSON
	with open(output_path, "w", encoding="utf-8") as f:
		json.dump(asdict(catalog), f, indent="\t", ensure_ascii=False)

	if verbose:
		print(f"\nCatalog generated: {output_path}")
		print(f"Total files: {catalog.total_files}")
		print(f"Total size: {catalog.total_size:,} bytes ({catalog.total_size / (1024*1024):.2f} MB)")
		print(f"Platforms: {catalog.platforms}")

	return catalog


def lookup_rom(catalog_path: Path, **criteria) -> List[Dict[str, Any]]:
	"""Look up ROMs in catalog by various criteria."""
	with open(catalog_path, "r", encoding="utf-8") as f:
		catalog = json.load(f)

	results = []

	for rom in catalog.get("files", []):
		match = True

		for key, value in criteria.items():
			if key in rom:
				rom_value = rom[key]
				if isinstance(value, str):
					if value.lower() not in str(rom_value).lower():
						match = False
						break
				elif rom_value != value:
					match = False
					break

		if match:
			results.append(rom)

	return results


def main():
	parser = argparse.ArgumentParser(
		description="Generate ROM catalog with hashes and metadata"
	)
	parser.add_argument(
		"--root", "-r",
		type=Path,
		default=Path(__file__).parent.parent / "~roms",
		help="Root directory to scan for ROMs"
	)
	parser.add_argument(
		"--output", "-o",
		type=Path,
		default=Path(__file__).parent.parent / "data" / "rom_catalog.json",
		help="Output JSON file path"
	)
	parser.add_argument(
		"--quiet", "-q",
		action="store_true",
		help="Quiet mode - suppress progress output"
	)
	parser.add_argument(
		"--lookup",
		type=str,
		help="Look up ROM by name or hash"
	)
	parser.add_argument(
		"--lookup-hash",
		type=str,
		help="Look up ROM by SHA-256 hash"
	)

	args = parser.parse_args()

	# Lookup mode
	if args.lookup or args.lookup_hash:
		catalog_path = args.output
		if not catalog_path.exists():
			print(f"Catalog not found: {catalog_path}")
			print("Run without --lookup first to generate catalog")
			return 1

		if args.lookup:
			results = lookup_rom(catalog_path, description=args.lookup)
		else:
			results = lookup_rom(catalog_path, sha256=args.lookup_hash)

		if results:
			print(f"Found {len(results)} matching ROM(s):")
			for rom in results:
				print(f"\n  {rom['filename']}")
				print(f"    Path: {rom['relative_path']}")
				print(f"    Size: {rom['size']:,} bytes")
				print(f"    CRC32: {rom['crc32']}")
				print(f"    SHA-256: {rom['sha256']}")
				print(f"    Platform: {rom['platform']}")
				print(f"    Region: {rom['region']}")
		else:
			print("No matching ROMs found")

		return 0

	# Generate catalog
	if not args.root.exists():
		print(f"Root directory not found: {args.root}")
		return 1

	# Ensure output directory exists
	args.output.parent.mkdir(parents=True, exist_ok=True)

	generate_catalog(args.root, args.output, verbose=not args.quiet)
	return 0


if __name__ == "__main__":
	exit(main())
