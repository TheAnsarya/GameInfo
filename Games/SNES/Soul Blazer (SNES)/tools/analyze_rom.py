#!/usr/bin/env python3
"""
Soul Blazer (SNES) ROM Analyzer
Analyzes the ROM structure and extracts key information.
"""

import struct
import hashlib
import binascii
import sys
from pathlib import Path


def analyze_rom(rom_path: str) -> dict:
	"""Analyze Soul Blazer ROM and return structure information."""
	with open(rom_path, 'rb') as f:
		rom = f.read()

	# Calculate hashes
	sha256 = hashlib.sha256(rom).hexdigest()
	sha1 = hashlib.sha1(rom).hexdigest()
	md5 = hashlib.md5(rom).hexdigest()
	crc32 = format(binascii.crc32(rom) & 0xffffffff, '08x')

	# Check for SMC header
	has_smc_header = len(rom) % 0x8000 == 0x200
	header_offset = 0x200 if has_smc_header else 0

	# LoROM internal header at $7fc0
	lorom_offset = 0x7fc0 + header_offset

	# Parse internal header
	title = rom[lorom_offset:lorom_offset+21].decode('ascii', errors='replace').strip()
	map_mode = rom[lorom_offset+21]
	rom_type = rom[lorom_offset+22]
	rom_size_byte = rom[lorom_offset+23]
	sram_size_byte = rom[lorom_offset+24]
	region = rom[lorom_offset+25]
	dev_id = rom[lorom_offset+26]
	version = rom[lorom_offset+27]
	checksum_comp = struct.unpack('<H', rom[lorom_offset+28:lorom_offset+30])[0]
	checksum = struct.unpack('<H', rom[lorom_offset+30:lorom_offset+32])[0]

	# Interrupt vectors (Native mode at $7fe0)
	vectors_offset = 0x7fe0 + header_offset
	native_vectors = {
		'COP': struct.unpack('<H', rom[vectors_offset+4:vectors_offset+6])[0],
		'BRK': struct.unpack('<H', rom[vectors_offset+6:vectors_offset+8])[0],
		'ABORT': struct.unpack('<H', rom[vectors_offset+8:vectors_offset+10])[0],
		'NMI': struct.unpack('<H', rom[vectors_offset+10:vectors_offset+12])[0],
		'RESET': struct.unpack('<H', rom[vectors_offset+12:vectors_offset+14])[0],
		'IRQ': struct.unpack('<H', rom[vectors_offset+14:vectors_offset+16])[0],
	}

	# Emulation mode vectors at $7ff0
	emu_vectors_offset = 0x7ff0 + header_offset
	emu_vectors = {
		'COP': struct.unpack('<H', rom[emu_vectors_offset+4:emu_vectors_offset+6])[0],
		'ABORT': struct.unpack('<H', rom[emu_vectors_offset+8:emu_vectors_offset+10])[0],
		'NMI': struct.unpack('<H', rom[emu_vectors_offset+10:emu_vectors_offset+12])[0],
		'RESET': struct.unpack('<H', rom[emu_vectors_offset+12:emu_vectors_offset+14])[0],
		'IRQ': struct.unpack('<H', rom[emu_vectors_offset+14:emu_vectors_offset+16])[0],
	}

	# Determine map mode description
	is_fastrom = (map_mode & 0x10) != 0
	is_hirom = (map_mode & 0x01) != 0
	speed = "FastROM" if is_fastrom else "SlowROM"
	mapping = "HiROM" if is_hirom else "LoROM"

	# Region description
	region_names = {0: "Japan", 1: "North America", 2: "Europe"}
	region_name = region_names.get(region, f"Unknown (0x{region:02x})")

	# Developer ID lookup (partial)
	dev_names = {
		0xb4: "Enix",
		0x33: "See extended header",
	}
	dev_name = dev_names.get(dev_id, f"Unknown (0x{dev_id:02x})")

	return {
		'file': {
			'path': rom_path,
			'size': len(rom),
			'size_kb': len(rom) // 1024,
			'banks': len(rom) // 0x8000,
			'has_smc_header': has_smc_header,
		},
		'hashes': {
			'sha256': sha256,
			'sha1': sha1,
			'md5': md5,
			'crc32': crc32,
		},
		'header': {
			'title': title,
			'map_mode': map_mode,
			'map_mode_desc': f"{speed}, {mapping}",
			'rom_type': rom_type,
			'rom_size': 2 ** rom_size_byte,
			'sram_size': 2 ** sram_size_byte if sram_size_byte else 0,
			'region': region,
			'region_name': region_name,
			'developer_id': dev_id,
			'developer_name': dev_name,
			'version': f"1.{version}",
			'checksum': checksum,
			'checksum_complement': checksum_comp,
			'checksum_valid': (checksum ^ checksum_comp) == 0xffff,
		},
		'vectors': {
			'native': native_vectors,
			'emulation': emu_vectors,
		},
		'rom_data': rom,
	}


def print_analysis(info: dict) -> None:
	"""Print ROM analysis results."""
	print("=" * 60)
	print("SNES ROM Analysis: Soul Blazer (U)")
	print("=" * 60)
	print()

	print("=== File Information ===")
	print(f"  Path: {info['file']['path']}")
	print(f"  Size: {info['file']['size']:,} bytes ({info['file']['size_kb']} KB)")
	print(f"  Banks: {info['file']['banks']}")
	print(f"  SMC Header: {'Yes' if info['file']['has_smc_header'] else 'No'}")
	print()

	print("=== Hashes ===")
	print(f"  SHA256: {info['hashes']['sha256']}")
	print(f"  SHA1:   {info['hashes']['sha1']}")
	print(f"  MD5:    {info['hashes']['md5']}")
	print(f"  CRC32:  {info['hashes']['crc32']}")
	print()

	hdr = info['header']
	print("=== Internal Header ===")
	print(f"  Title: {hdr['title']}")
	print(f"  Map Mode: 0x{hdr['map_mode']:02x} ({hdr['map_mode_desc']})")
	print(f"  ROM Type: 0x{hdr['rom_type']:02x}")
	print(f"  ROM Size: {hdr['rom_size']} KB")
	print(f"  SRAM Size: {hdr['sram_size']} KB")
	print(f"  Region: {hdr['region_name']}")
	print(f"  Developer: {hdr['developer_name']}")
	print(f"  Version: {hdr['version']}")
	print(f"  Checksum: 0x{hdr['checksum']:04x}")
	print(f"  Checksum Complement: 0x{hdr['checksum_complement']:04x}")
	print(f"  Checksum Valid: {hdr['checksum_valid']}")
	print()

	print("=== Interrupt Vectors (Native Mode) ===")
	for name, addr in info['vectors']['native'].items():
		print(f"  {name}: ${addr:04x}")
	print()

	print("=== Interrupt Vectors (Emulation Mode) ===")
	for name, addr in info['vectors']['emulation'].items():
		print(f"  {name}: ${addr:04x}")


def find_pointer_tables(rom: bytes, min_count: int = 8) -> list:
	"""Find potential pointer tables in ROM."""
	tables = []
	# Look for sequences of 16-bit values that could be pointers
	# In LoROM, valid pointers are typically $8000-$ffff
	for offset in range(0, len(rom) - min_count * 2, 2):
		pointers = []
		valid = True
		for i in range(min_count):
			ptr = struct.unpack('<H', rom[offset + i*2:offset + i*2 + 2])[0]
			if ptr < 0x8000:
				valid = False
				break
			pointers.append(ptr)

		if valid:
			# Check if they're sequential or close together
			tables.append({
				'offset': offset,
				'pointers': pointers[:min_count],
			})

	return tables[:20]  # Return first 20 candidates


def scan_for_strings(rom: bytes, min_length: int = 4) -> list:
	"""Scan for potential text strings in ROM."""
	strings = []
	# Common Soul Blazer text encoding uses ASCII-like values
	i = 0
	while i < len(rom):
		start = i
		text = []
		while i < len(rom):
			b = rom[i]
			# Check for printable ASCII range
			if 0x20 <= b <= 0x7e:
				text.append(chr(b))
				i += 1
			elif b == 0x00 and len(text) >= min_length:
				# Null terminator
				break
			else:
				break

		if len(text) >= min_length:
			strings.append({
				'offset': start,
				'text': ''.join(text),
			})

		i += 1

	return strings


if __name__ == '__main__':
	if len(sys.argv) < 2:
		# Default path
		rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	else:
		rom_path = sys.argv[1]

	info = analyze_rom(rom_path)
	print_analysis(info)

	# Find some potential pointer tables
	print()
	print("=== Scanning for Pointer Tables ===")
	tables = find_pointer_tables(info['rom_data'])
	for t in tables[:5]:
		ptrs = ', '.join([f'${p:04x}' for p in t['pointers'][:4]])
		print(f"  ${t['offset']:06x}: {ptrs}...")

	# Find some text strings
	print()
	print("=== Sample Text Strings Found ===")
	strings = scan_for_strings(info['rom_data'], min_length=6)
	for s in strings[:10]:
		print(f"  ${s['offset']:06x}: {s['text'][:40]}")
