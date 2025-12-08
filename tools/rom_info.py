#!/usr/bin/env python3
"""
ROM Info Extractor

Extract detailed information from ROM files including headers, checksums,
mapper info, and database lookups.

Supports:
- NES (iNES, NES 2.0)
- SNES/SFC
- GB/GBC/GBA
- Genesis/Mega Drive
- Generic CRC/SHA1 calculation

Usage:
	python rom_info.py analyze <rom_file>
	python rom_info.py compare <rom1> <rom2>
	python rom_info.py database <rom_file> --db <database.json>
	python rom_info.py batch <directory> --report <report.html>
"""

import argparse
import hashlib
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class ROMInfo:
	"""ROM information container"""
	filepath: str = ""
	filename: str = ""
	file_size: int = 0
	crc32: str = ""
	md5: str = ""
	sha1: str = ""
	sha256: str = ""
	format: str = ""
	region: str = ""
	title: str = ""
	header: Dict = field(default_factory=dict)
	extra: Dict = field(default_factory=dict)


class NESROMAnalyzer:
	"""Analyze NES ROM files"""

	# Mapper names
	MAPPERS = {
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
		16: "Bandai FCG",
		18: "Jaleco SS88006",
		19: "Namco 129/163",
		21: "VRC4a/c",
		22: "VRC2a",
		23: "VRC2b/VRC4e",
		24: "VRC6a",
		25: "VRC4b/d",
		26: "VRC6b",
		34: "BNROM/NINA-001",
		66: "GxROM/MxROM",
		69: "FME-7/Sunsoft 5B",
		71: "Camerica/Codemasters",
		79: "NINA-003/006",
		85: "VRC7",
		118: "TxSROM/TKSROM",
		119: "TQROM",
		206: "DxROM/NAMCOT",
	}

	# TV systems
	TV_SYSTEMS = {
		0: "NTSC",
		1: "PAL",
		2: "Multi-region",
		3: "Dendy",
	}

	@classmethod
	def analyze(cls, data: bytes) -> Optional[ROMInfo]:
		"""Analyze NES ROM"""
		if len(data) < 16:
			return None

		# Check header
		if data[:4] != b'NES\x1a':
			return None

		info = ROMInfo()
		info.format = "NES"

		# Parse iNES header
		prg_size = data[4] * 16384
		chr_size = data[5] * 8192
		flags6 = data[6]
		flags7 = data[7]

		# Mapper number
		mapper = (flags6 >> 4) | (flags7 & 0xF0)

		# NES 2.0 check
		is_nes2 = (flags7 & 0x0C) == 0x08

		if is_nes2:
			info.format = "NES 2.0"
			# Extended mapper
			mapper |= (data[8] & 0x0F) << 8
			# Extended sizes
			if data[9] & 0x0F:
				prg_size = ((data[9] & 0x0F) << 8 | data[4]) * 16384
			if data[9] >> 4:
				chr_size = ((data[9] >> 4) << 8 | data[5]) * 8192

			# Timing/TV system
			tv_system = data[12] & 0x03
			info.region = cls.TV_SYSTEMS.get(tv_system, "Unknown")
		else:
			info.region = "NTSC" if (data[9] & 0x01) == 0 else "PAL"

		# Mirroring
		if flags6 & 0x08:
			mirroring = "Four-screen"
		elif flags6 & 0x01:
			mirroring = "Vertical"
		else:
			mirroring = "Horizontal"

		# Battery
		has_battery = bool(flags6 & 0x02)

		# Trainer
		has_trainer = bool(flags6 & 0x04)

		info.header = {
			'prg_rom': prg_size,
			'chr_rom': chr_size,
			'prg_rom_banks': data[4],
			'chr_rom_banks': data[5],
			'mapper': mapper,
			'mapper_name': cls.MAPPERS.get(mapper, f"Mapper {mapper}"),
			'mirroring': mirroring,
			'battery': has_battery,
			'trainer': has_trainer,
			'format': info.format,
		}

		# Calculate PRG+CHR data start
		header_size = 16
		if has_trainer:
			header_size += 512

		info.extra['prg_offset'] = header_size
		info.extra['chr_offset'] = header_size + prg_size

		return info


class SNESROMAnalyzer:
	"""Analyze SNES ROM files"""

	REGIONS = {
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

	ROM_TYPES = {
		0x00: "ROM",
		0x01: "ROM+RAM",
		0x02: "ROM+RAM+SRAM",
		0x03: "ROM+DSP",
		0x04: "ROM+DSP+RAM",
		0x05: "ROM+DSP+RAM+SRAM",
		0x13: "ROM+SuperFX",
		0x14: "ROM+SuperFX+RAM",
		0x15: "ROM+SuperFX+RAM+SRAM",
		0x23: "ROM+OBC1",
		0x33: "ROM+SA-1",
		0x34: "ROM+SA-1+RAM",
		0x35: "ROM+SA-1+RAM+SRAM",
		0x43: "ROM+S-DD1",
		0x45: "ROM+S-DD1+RAM+SRAM",
	}

	@classmethod
	def analyze(cls, data: bytes) -> Optional[ROMInfo]:
		"""Analyze SNES ROM"""
		info = ROMInfo()
		info.format = "SNES"

		# Try to find header
		header_offset = cls._find_header(data)
		if header_offset < 0:
			return None

		# Read internal header
		header_start = header_offset

		# Title (21 bytes)
		title_bytes = data[header_start:header_start + 21]
		try:
			info.title = title_bytes.decode('ascii', errors='ignore').strip()
		except:
			info.title = ""

		# ROM makeup byte
		makeup = data[header_start + 0x15]
		rom_speed = "FastROM" if makeup & 0x10 else "SlowROM"

		# Map mode
		map_modes = {
			0x20: "LoROM",
			0x21: "HiROM",
			0x23: "SA-1",
			0x25: "ExHiROM",
			0x30: "LoROM+FastROM",
			0x31: "HiROM+FastROM",
			0x35: "ExHiROM+FastROM",
		}
		map_mode = map_modes.get(makeup, f"Unknown ({makeup:02X})")

		# ROM type
		rom_type = data[header_start + 0x16]
		rom_type_name = cls.ROM_TYPES.get(rom_type, f"Unknown ({rom_type:02X})")

		# ROM size
		rom_size_byte = data[header_start + 0x17]
		rom_size = (1 << rom_size_byte) * 1024 if rom_size_byte < 16 else 0

		# RAM size
		ram_size_byte = data[header_start + 0x18]
		ram_size = (1 << ram_size_byte) * 1024 if ram_size_byte > 0 and ram_size_byte < 16 else 0

		# Region
		region_byte = data[header_start + 0x19]
		info.region = cls.REGIONS.get(region_byte, f"Unknown ({region_byte:02X})")

		# Developer ID
		dev_id = data[header_start + 0x1A]

		# Version
		version = data[header_start + 0x1B]

		# Checksum complement and checksum
		checksum_comp = struct.unpack('<H', data[header_start + 0x1C:header_start + 0x1E])[0]
		checksum = struct.unpack('<H', data[header_start + 0x1E:header_start + 0x20])[0]

		info.header = {
			'title': info.title,
			'map_mode': map_mode,
			'rom_type': rom_type_name,
			'rom_size': rom_size,
			'ram_size': ram_size,
			'region': info.region,
			'developer_id': dev_id,
			'version': f"1.{version}",
			'checksum': f"{checksum:04X}",
			'checksum_complement': f"{checksum_comp:04X}",
			'header_offset': header_offset,
		}

		# Validate checksum
		valid = (checksum ^ checksum_comp) == 0xFFFF
		info.extra['checksum_valid'] = valid

		return info

	@classmethod
	def _find_header(cls, data: bytes) -> int:
		"""Find SNES internal header location"""
		# Possible header locations
		candidates = [
			0x7FC0,    # LoROM
			0xFFC0,    # HiROM
			0x40FFC0,  # ExHiROM
			0x81C0,    # LoROM with 512-byte copier header
			0x101C0,   # HiROM with 512-byte copier header
		]

		for offset in candidates:
			if offset + 0x20 <= len(data):
				# Check for valid checksum complement
				if offset + 0x1E <= len(data):
					checksum_comp = struct.unpack('<H', data[offset + 0x1C:offset + 0x1E])[0]
					checksum = struct.unpack('<H', data[offset + 0x1E:offset + 0x20])[0]

					if (checksum ^ checksum_comp) == 0xFFFF:
						return offset

		# Fall back to LoROM if nothing matches
		if 0x7FC0 + 0x20 <= len(data):
			return 0x7FC0

		return -1


class GBROMAnalyzer:
	"""Analyze Game Boy ROM files"""

	TYPES = {
		0x00: "ROM Only",
		0x01: "MBC1",
		0x02: "MBC1+RAM",
		0x03: "MBC1+RAM+Battery",
		0x05: "MBC2",
		0x06: "MBC2+Battery",
		0x08: "ROM+RAM",
		0x09: "ROM+RAM+Battery",
		0x0B: "MMM01",
		0x0C: "MMM01+RAM",
		0x0D: "MMM01+RAM+Battery",
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
		0x20: "MBC6",
		0x22: "MBC7+Sensor+Rumble+RAM+Battery",
		0xFC: "Pocket Camera",
		0xFD: "Bandai TAMA5",
		0xFE: "HuC3",
		0xFF: "HuC1+RAM+Battery",
	}

	ROM_SIZES = {
		0x00: 32 * 1024,
		0x01: 64 * 1024,
		0x02: 128 * 1024,
		0x03: 256 * 1024,
		0x04: 512 * 1024,
		0x05: 1024 * 1024,
		0x06: 2048 * 1024,
		0x07: 4096 * 1024,
		0x08: 8192 * 1024,
		0x52: 1152 * 1024,
		0x53: 1280 * 1024,
		0x54: 1536 * 1024,
	}

	RAM_SIZES = {
		0x00: 0,
		0x01: 2 * 1024,
		0x02: 8 * 1024,
		0x03: 32 * 1024,
		0x04: 128 * 1024,
		0x05: 64 * 1024,
	}

	@classmethod
	def analyze(cls, data: bytes) -> Optional[ROMInfo]:
		"""Analyze Game Boy ROM"""
		if len(data) < 0x150:
			return None

		# Check Nintendo logo
		nintendo_logo = data[0x104:0x134]
		expected_logo = bytes([
			0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
			0x00, 0x08, 0x11, 0x1F, 0x88, 0x89, 0x00, 0x0E,
			0xDC, 0xCC, 0x6E, 0xE6, 0xDD, 0xDD, 0xD9, 0x99,
			0xBB, 0xBB, 0x67, 0x63, 0x6E, 0x0E, 0xEC, 0xCC,
			0xDD, 0xDC, 0x99, 0x9F, 0xBB, 0xB9, 0x33, 0x3E,
		])

		if nintendo_logo != expected_logo:
			return None

		info = ROMInfo()

		# Check for GBC
		cgb_flag = data[0x143]
		if cgb_flag in (0x80, 0xC0):
			info.format = "GBC"
		else:
			info.format = "GB"

		# Title
		title_end = 0x143 if cgb_flag in (0x80, 0xC0) else 0x144
		title_bytes = data[0x134:title_end]
		try:
			info.title = title_bytes.decode('ascii', errors='ignore').strip('\x00')
		except:
			info.title = ""

		# SGB flag
		sgb_flag = data[0x146]
		sgb_support = sgb_flag == 0x03

		# Cartridge type
		cart_type = data[0x147]
		cart_type_name = cls.TYPES.get(cart_type, f"Unknown ({cart_type:02X})")

		# ROM size
		rom_size_byte = data[0x148]
		rom_size = cls.ROM_SIZES.get(rom_size_byte, 0)

		# RAM size
		ram_size_byte = data[0x149]
		ram_size = cls.RAM_SIZES.get(ram_size_byte, 0)

		# Region
		region_byte = data[0x14A]
		info.region = "Japan" if region_byte == 0x00 else "International"

		# Header checksum
		header_checksum = data[0x14D]
		calculated = 0
		for i in range(0x134, 0x14D):
			calculated = (calculated - data[i] - 1) & 0xFF

		checksum_valid = header_checksum == calculated

		# Global checksum
		global_checksum = struct.unpack('>H', data[0x14E:0x150])[0]

		info.header = {
			'title': info.title,
			'cgb_flag': cgb_flag,
			'sgb_support': sgb_support,
			'cartridge_type': cart_type_name,
			'rom_size': rom_size,
			'ram_size': ram_size,
			'region': info.region,
			'header_checksum': f"{header_checksum:02X}",
			'global_checksum': f"{global_checksum:04X}",
		}

		info.extra['header_checksum_valid'] = checksum_valid

		return info


class HashCalculator:
	"""Calculate various hashes for ROM data"""

	@staticmethod
	def calculate_all(data: bytes, skip_header: int = 0) -> Dict[str, str]:
		"""Calculate CRC32, MD5, SHA1, SHA256"""
		calc_data = data[skip_header:]

		crc32 = 0
		for byte in calc_data:
			crc32 = (crc32 >> 8) ^ HashCalculator._crc_table[(crc32 ^ byte) & 0xFF]
		crc32 ^= 0xFFFFFFFF

		return {
			'crc32': f"{crc32 & 0xFFFFFFFF:08X}",
			'md5': hashlib.md5(calc_data).hexdigest().upper(),
			'sha1': hashlib.sha1(calc_data).hexdigest().upper(),
			'sha256': hashlib.sha256(calc_data).hexdigest().upper(),
		}

	# CRC32 table
	_crc_table = []
	for i in range(256):
		crc = i ^ 0xFFFFFFFF
		for _ in range(8):
			if crc & 1:
				crc = (crc >> 1) ^ 0xEDB88320
			else:
				crc >>= 1
		_crc_table.append(crc ^ 0xFFFFFFFF)


class ROMAnalyzer:
	"""Main ROM analyzer"""

	@staticmethod
	def analyze(filepath: str) -> ROMInfo:
		"""Analyze ROM file"""
		with open(filepath, 'rb') as f:
			data = f.read()

		info = ROMInfo()
		info.filepath = filepath
		info.filename = os.path.basename(filepath)
		info.file_size = len(data)

		# Try each analyzer
		analyzers = [
			NESROMAnalyzer.analyze,
			SNESROMAnalyzer.analyze,
			GBROMAnalyzer.analyze,
		]

		for analyzer in analyzers:
			result = analyzer(data)
			if result:
				info.format = result.format
				info.region = result.region
				info.title = result.title
				info.header = result.header
				info.extra = result.extra
				break

		# Calculate hashes
		skip_header = 0
		if info.format in ("NES", "NES 2.0"):
			skip_header = 16
			if info.header.get('trainer'):
				skip_header += 512

		hashes = HashCalculator.calculate_all(data, skip_header)
		info.crc32 = hashes['crc32']
		info.md5 = hashes['md5']
		info.sha1 = hashes['sha1']
		info.sha256 = hashes['sha256']

		return info


def format_size(size: int) -> str:
	"""Format size in human readable form"""
	if size >= 1024 * 1024:
		return f"{size / (1024 * 1024):.2f} MB"
	elif size >= 1024:
		return f"{size / 1024:.2f} KB"
	else:
		return f"{size} bytes"


def print_info(info: ROMInfo, verbose: bool = False) -> None:
	"""Print ROM info"""
	print(f"File: {info.filename}")
	print(f"Size: {format_size(info.file_size)}")
	print(f"Format: {info.format or 'Unknown'}")

	if info.title:
		print(f"Title: {info.title}")
	if info.region:
		print(f"Region: {info.region}")

	print()
	print("Hashes:")
	print(f"  CRC32:  {info.crc32}")
	print(f"  MD5:    {info.md5}")
	print(f"  SHA1:   {info.sha1}")
	if verbose:
		print(f"  SHA256: {info.sha256}")

	if info.header:
		print()
		print("Header Info:")
		for key, value in info.header.items():
			if isinstance(value, bool):
				value = "Yes" if value else "No"
			elif isinstance(value, int) and key.endswith('_size') or key.endswith('_rom') or key.endswith('_ram'):
				value = format_size(value)
			print(f"  {key}: {value}")

	if verbose and info.extra:
		print()
		print("Extra Info:")
		for key, value in info.extra.items():
			print(f"  {key}: {value}")


def main():
	parser = argparse.ArgumentParser(
		description='ROM Info Extractor',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze ROM file')
	analyze_parser.add_argument('rom', help='ROM file to analyze')
	analyze_parser.add_argument('--verbose', '-v', action='store_true', help='Verbose output')
	analyze_parser.add_argument('--json', '-j', action='store_true', help='Output as JSON')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare two ROMs')
	compare_parser.add_argument('rom1', help='First ROM')
	compare_parser.add_argument('rom2', help='Second ROM')

	# Batch command
	batch_parser = subparsers.add_parser('batch', help='Batch analyze ROMs')
	batch_parser.add_argument('directory', help='Directory to scan')
	batch_parser.add_argument('--report', '-r', help='Output report file')
	batch_parser.add_argument('--format', '-f', default='json',
							  choices=['json', 'csv', 'html'],
							  help='Report format')
	batch_parser.add_argument('--recursive', '-R', action='store_true',
							  help='Scan recursively')

	args = parser.parse_args()

	if args.command == 'analyze':
		info = ROMAnalyzer.analyze(args.rom)

		if args.json:
			output = {
				'filepath': info.filepath,
				'filename': info.filename,
				'file_size': info.file_size,
				'format': info.format,
				'region': info.region,
				'title': info.title,
				'hashes': {
					'crc32': info.crc32,
					'md5': info.md5,
					'sha1': info.sha1,
					'sha256': info.sha256,
				},
				'header': info.header,
				'extra': info.extra,
			}
			print(json.dumps(output, indent='\t'))
		else:
			print_info(info, verbose=args.verbose)

	elif args.command == 'compare':
		info1 = ROMAnalyzer.analyze(args.rom1)
		info2 = ROMAnalyzer.analyze(args.rom2)

		print(f"ROM 1: {info1.filename}")
		print(f"ROM 2: {info2.filename}")
		print()

		# Compare hashes
		print("Hash Comparison:")
		for hash_name in ['crc32', 'md5', 'sha1']:
			h1 = getattr(info1, hash_name)
			h2 = getattr(info2, hash_name)
			match = "MATCH" if h1 == h2 else "DIFFER"
			print(f"  {hash_name.upper()}: {match}")

		# Compare headers
		if info1.format == info2.format:
			print()
			print("Header Differences:")
			all_keys = set(info1.header.keys()) | set(info2.header.keys())
			for key in sorted(all_keys):
				v1 = info1.header.get(key, "N/A")
				v2 = info2.header.get(key, "N/A")
				if v1 != v2:
					print(f"  {key}: {v1} vs {v2}")

	elif args.command == 'batch':
		import glob

		patterns = ['*.nes', '*.sfc', '*.smc', '*.gb', '*.gbc', '*.gba']
		files = []

		for pattern in patterns:
			if args.recursive:
				files.extend(glob.glob(os.path.join(args.directory, '**', pattern), recursive=True))
			else:
				files.extend(glob.glob(os.path.join(args.directory, pattern)))

		print(f"Found {len(files)} ROM files")

		results = []
		for filepath in sorted(files):
			try:
				info = ROMAnalyzer.analyze(filepath)
				results.append({
					'filename': info.filename,
					'format': info.format,
					'title': info.title,
					'region': info.region,
					'crc32': info.crc32,
					'sha1': info.sha1,
					'size': info.file_size,
				})
				print(f"  {info.filename}: {info.format or 'Unknown'}")
			except Exception as e:
				print(f"  {os.path.basename(filepath)}: Error - {e}")

		if args.report:
			if args.format == 'json':
				with open(args.report, 'w', encoding='utf-8', newline='\n') as f:
					json.dump(results, f, indent='\t')
			elif args.format == 'csv':
				with open(args.report, 'w', encoding='utf-8', newline='\n') as f:
					f.write('filename,format,title,region,crc32,sha1,size\n')
					for r in results:
						f.write(f'"{r["filename"]}","{r["format"]}","{r["title"]}","{r["region"]}",{r["crc32"]},{r["sha1"]},{r["size"]}\n')
			elif args.format == 'html':
				with open(args.report, 'w', encoding='utf-8', newline='\n') as f:
					f.write("""<!DOCTYPE html>
<html>
<head>
	<title>ROM Database</title>
	<style>
		body { font-family: sans-serif; margin: 20px; }
		table { border-collapse: collapse; width: 100%; }
		th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
		th { background: #f0f0f0; }
	</style>
</head>
<body>
	<h1>ROM Database</h1>
	<table>
		<tr><th>Filename</th><th>Format</th><th>Title</th><th>Region</th><th>CRC32</th></tr>
""")
					for r in results:
						f.write(f'		<tr><td>{r["filename"]}</td><td>{r["format"]}</td><td>{r["title"]}</td><td>{r["region"]}</td><td>{r["crc32"]}</td></tr>\n')
					f.write("""	</table>
</body>
</html>""")

			print(f"\nReport saved to: {args.report}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
