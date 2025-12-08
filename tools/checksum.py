#!/usr/bin/env python3
"""
Checksum Calculator

Calculate and verify checksums for various ROM formats.
Supports NES, SNES, Game Boy, and generic checksums.

Features:
- Calculate multiple checksum types
- Verify ROM integrity
- Fix invalid checksums
- Compare ROM versions

Usage:
	python checksum.py calculate <file>
	python checksum.py verify <file> --type nes
	python checksum.py fix <file> --type snes --output fixed.smc
	python checksum.py compare <file1> <file2>
"""

import argparse
import hashlib
import os
import struct
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class ChecksumResult:
	"""Checksum calculation result"""
	name: str
	expected: Optional[int] = None
	calculated: int = 0
	valid: bool = True
	location: int = -1  # Offset in file


def calculate_md5(data: bytes) -> str:
	"""Calculate MD5 hash"""
	return hashlib.md5(data).hexdigest()


def calculate_sha1(data: bytes) -> str:
	"""Calculate SHA1 hash"""
	return hashlib.sha1(data).hexdigest()


def calculate_sha256(data: bytes) -> str:
	"""Calculate SHA256 hash"""
	return hashlib.sha256(data).hexdigest()


def calculate_crc32(data: bytes) -> int:
	"""Calculate CRC32"""
	import zlib
	return zlib.crc32(data) & 0xFFFFFFFF


def calculate_simple_sum(data: bytes, word_size: int = 1) -> int:
	"""Calculate simple sum of bytes/words"""
	if word_size == 1:
		return sum(data)
	elif word_size == 2:
		total = 0
		for i in range(0, len(data) - 1, 2):
			total += struct.unpack('<H', data[i:i + 2])[0]
		return total
	return sum(data)


# NES Checksum Functions
def calculate_nes_checksum(data: bytes) -> Dict[str, ChecksumResult]:
	"""Calculate NES ROM checksums"""
	results = {}

	# Check for iNES header
	if data[:4] != b'NES\x1a':
		results['header'] = ChecksumResult(name='iNES Header', valid=False)
		return results

	results['header'] = ChecksumResult(name='iNES Header', valid=True)

	# PRG and CHR sizes
	prg_size = data[4] * 16384
	chr_size = data[5] * 8192
	header_size = 16

	# Calculate PRG ROM checksum
	prg_data = data[header_size:header_size + prg_size]
	prg_sum = calculate_simple_sum(prg_data)
	results['prg_sum'] = ChecksumResult(name='PRG Sum', calculated=prg_sum)

	# Calculate CHR ROM checksum (if present)
	if chr_size > 0:
		chr_data = data[header_size + prg_size:header_size + prg_size + chr_size]
		chr_sum = calculate_simple_sum(chr_data)
		results['chr_sum'] = ChecksumResult(name='CHR Sum', calculated=chr_sum)

	# Calculate CRC32 of ROM data (without header)
	rom_data = data[header_size:]
	crc = calculate_crc32(rom_data)
	results['crc32_no_header'] = ChecksumResult(name='CRC32 (no header)', calculated=crc)

	# Calculate CRC32 with header
	crc_full = calculate_crc32(data)
	results['crc32_full'] = ChecksumResult(name='CRC32 (full)', calculated=crc_full)

	return results


# SNES Checksum Functions
def calculate_snes_checksum(data: bytes) -> Dict[str, ChecksumResult]:
	"""Calculate SNES ROM checksum"""
	results = {}

	# Detect header offset (LoROM vs HiROM)
	# Check for optional copier header (512 bytes)
	has_copier_header = (len(data) % 0x8000) == 512
	offset = 512 if has_copier_header else 0

	# Try LoROM location first ($7FC0)
	lorom_offset = offset + 0x7FC0
	hirom_offset = offset + 0xFFC0

	# Read potential header locations
	header_offset = -1
	mapping = ''

	if lorom_offset + 64 <= len(data):
		# Check LoROM
		checksum = struct.unpack('<H', data[lorom_offset + 0x2C:lorom_offset + 0x2E])[0]
		complement = struct.unpack('<H', data[lorom_offset + 0x2E:lorom_offset + 0x30])[0]
		if checksum + complement == 0xFFFF:
			header_offset = lorom_offset
			mapping = 'LoROM'

	if header_offset == -1 and hirom_offset + 64 <= len(data):
		# Check HiROM
		checksum = struct.unpack('<H', data[hirom_offset + 0x2C:hirom_offset + 0x2E])[0]
		complement = struct.unpack('<H', data[hirom_offset + 0x2E:hirom_offset + 0x30])[0]
		if checksum + complement == 0xFFFF:
			header_offset = hirom_offset
			mapping = 'HiROM'

	if header_offset == -1:
		results['header'] = ChecksumResult(name='SNES Header', valid=False)
		return results

	results['mapping'] = ChecksumResult(name=f'Mapping ({mapping})', valid=True)

	# Read stored checksum and complement
	stored_checksum = struct.unpack('<H', data[header_offset + 0x2C:header_offset + 0x2E])[0]
	stored_complement = struct.unpack('<H', data[header_offset + 0x2E:header_offset + 0x30])[0]

	# Calculate actual checksum
	rom_data = data[offset:]  # Skip copier header if present
	rom_size = len(rom_data)

	# Zero out checksum bytes for calculation
	rom_array = bytearray(rom_data)
	cs_offset = header_offset - offset + 0x2C
	rom_array[cs_offset:cs_offset + 4] = b'\x00\x00\x00\x00'

	# Calculate sum of all bytes
	calculated = sum(rom_array) & 0xFFFF

	# Handle non-power-of-2 sizes
	if rom_size & (rom_size - 1) != 0:
		# ROM is not power of 2, mirror calculation needed
		pass

	complement_valid = (stored_checksum + stored_complement) == 0xFFFF

	results['stored_checksum'] = ChecksumResult(
		name='Stored Checksum',
		expected=stored_checksum,
		calculated=calculated,
		valid=(stored_checksum == calculated),
		location=header_offset + 0x2C
	)

	results['stored_complement'] = ChecksumResult(
		name='Stored Complement',
		expected=stored_complement,
		calculated=calculated ^ 0xFFFF,
		valid=complement_valid,
		location=header_offset + 0x2E
	)

	# CRC32
	crc = calculate_crc32(rom_data)
	results['crc32'] = ChecksumResult(name='CRC32', calculated=crc)

	return results


# Game Boy Checksum Functions
def calculate_gb_checksum(data: bytes) -> Dict[str, ChecksumResult]:
	"""Calculate Game Boy ROM checksums"""
	results = {}

	if len(data) < 0x150:
		results['header'] = ChecksumResult(name='GB Header', valid=False)
		return results

	# Header checksum at $014D
	# Sum of bytes $0134-$014C, then complement
	header_sum = 0
	for i in range(0x134, 0x14D):
		header_sum = (header_sum - data[i] - 1) & 0xFF

	stored_header_cs = data[0x14D]
	results['header_checksum'] = ChecksumResult(
		name='Header Checksum',
		expected=stored_header_cs,
		calculated=header_sum,
		valid=(stored_header_cs == header_sum),
		location=0x14D
	)

	# Global checksum at $014E-$014F (big-endian)
	# Sum of all bytes except $014E-$014F
	global_sum = 0
	for i in range(len(data)):
		if i != 0x14E and i != 0x14F:
			global_sum = (global_sum + data[i]) & 0xFFFF

	stored_global = struct.unpack('>H', data[0x14E:0x150])[0]
	results['global_checksum'] = ChecksumResult(
		name='Global Checksum',
		expected=stored_global,
		calculated=global_sum,
		valid=(stored_global == global_sum),
		location=0x14E
	)

	# CRC32
	crc = calculate_crc32(data)
	results['crc32'] = ChecksumResult(name='CRC32', calculated=crc)

	return results


def fix_snes_checksum(data: bytes) -> bytes:
	"""Fix SNES ROM checksum"""
	# Similar logic to calculate, but writes back

	has_copier_header = (len(data) % 0x8000) == 512
	offset = 512 if has_copier_header else 0

	lorom_offset = offset + 0x7FC0
	hirom_offset = offset + 0xFFC0

	header_offset = -1

	# Detect mapping
	for test_offset in [lorom_offset, hirom_offset]:
		if test_offset + 64 <= len(data):
			# Check for valid title (printable ASCII)
			title = data[test_offset:test_offset + 21]
			if all(0x20 <= b < 0x7F or b == 0 for b in title):
				header_offset = test_offset
				break

	if header_offset == -1:
		return data  # Can't fix

	# Make mutable copy
	rom = bytearray(data)

	# Zero out checksum bytes
	cs_offset = header_offset + 0x2C
	rom[cs_offset:cs_offset + 4] = b'\x00\x00\x00\x00'

	# Calculate new checksum
	rom_data = rom[offset:]
	checksum = sum(rom_data) & 0xFFFF
	complement = checksum ^ 0xFFFF

	# Write back
	struct.pack_into('<H', rom, cs_offset + 2, complement)  # Complement first
	struct.pack_into('<H', rom, cs_offset, checksum)

	return bytes(rom)


def fix_gb_checksum(data: bytes) -> bytes:
	"""Fix Game Boy ROM checksums"""
	rom = bytearray(data)

	# Fix header checksum
	header_sum = 0
	for i in range(0x134, 0x14D):
		header_sum = (header_sum - rom[i] - 1) & 0xFF
	rom[0x14D] = header_sum

	# Fix global checksum
	rom[0x14E] = 0
	rom[0x14F] = 0
	global_sum = sum(rom) & 0xFFFF
	struct.pack_into('>H', rom, 0x14E, global_sum)

	return bytes(rom)


def main():
	parser = argparse.ArgumentParser(
		description='Checksum Calculator',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Calculate command
	calc_parser = subparsers.add_parser('calculate', help='Calculate checksums')
	calc_parser.add_argument('file', help='Input file')
	calc_parser.add_argument('--type', '-t', choices=['auto', 'nes', 'snes', 'gb', 'generic'], default='auto')

	# Verify command
	verify_parser = subparsers.add_parser('verify', help='Verify ROM checksums')
	verify_parser.add_argument('file', help='ROM file')
	verify_parser.add_argument('--type', '-t', choices=['auto', 'nes', 'snes', 'gb'], default='auto')

	# Fix command
	fix_parser = subparsers.add_parser('fix', help='Fix ROM checksum')
	fix_parser.add_argument('file', help='ROM file')
	fix_parser.add_argument('--type', '-t', choices=['snes', 'gb'], required=True)
	fix_parser.add_argument('--output', '-o', required=True, help='Output file')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare two ROMs')
	compare_parser.add_argument('file1', help='First file')
	compare_parser.add_argument('file2', help='Second file')

	args = parser.parse_args()

	if args.command == 'calculate':
		with open(args.file, 'rb') as f:
			data = f.read()

		print(f"File: {args.file}")
		print(f"Size: {len(data):,} bytes (0x{len(data):X})")
		print()

		# Auto-detect type
		rom_type = args.type
		if rom_type == 'auto':
			if data[:4] == b'NES\x1a':
				rom_type = 'nes'
			elif len(data) >= 0x150 and data[0x104:0x134] == bytes([
				0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
				0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
				0x00, 0x08, 0x11, 0x1F, 0x88, 0x89, 0x00, 0x0E,
				0xDC, 0xCC, 0x6E, 0xE6, 0xDD, 0xDD, 0xD9, 0x99,
				0xBB, 0xBB, 0x67, 0x63, 0x6E, 0x0E, 0xEC, 0xCC,
				0xDD, 0xDC, 0x99, 0x9F, 0xBB, 0xB9, 0x33, 0x3E
			]):
				rom_type = 'gb'
			elif len(data) >= 0x8000:
				rom_type = 'snes'
			else:
				rom_type = 'generic'

		print(f"Detected type: {rom_type.upper()}")
		print()

		# Calculate type-specific checksums
		if rom_type == 'nes':
			results = calculate_nes_checksum(data)
		elif rom_type == 'snes':
			results = calculate_snes_checksum(data)
		elif rom_type == 'gb':
			results = calculate_gb_checksum(data)
		else:
			results = {}

		# Print results
		if results:
			print("ROM Checksums:")
			for name, result in results.items():
				if result.expected is not None:
					status = "✓" if result.valid else "✗"
					print(f"  {result.name}: Expected 0x{result.expected:04X}, Got 0x{result.calculated:04X} {status}")
				else:
					print(f"  {result.name}: 0x{result.calculated:X}")
			print()

		# Generic hashes
		print("File Hashes:")
		print(f"  MD5:    {calculate_md5(data)}")
		print(f"  SHA1:   {calculate_sha1(data)}")
		print(f"  SHA256: {calculate_sha256(data)}")
		print(f"  CRC32:  {calculate_crc32(data):08X}")

	elif args.command == 'verify':
		with open(args.file, 'rb') as f:
			data = f.read()

		# Auto-detect
		rom_type = args.type
		if rom_type == 'auto':
			if data[:4] == b'NES\x1a':
				rom_type = 'nes'
			elif len(data) >= 0x8000:
				rom_type = 'snes'

		if rom_type == 'nes':
			results = calculate_nes_checksum(data)
		elif rom_type == 'snes':
			results = calculate_snes_checksum(data)
		elif rom_type == 'gb':
			results = calculate_gb_checksum(data)
		else:
			print("Cannot verify generic files")
			sys.exit(1)

		all_valid = all(r.valid for r in results.values())
		print(f"Verification: {'PASSED' if all_valid else 'FAILED'}")

		for name, result in results.items():
			if result.expected is not None:
				status = "OK" if result.valid else "MISMATCH"
				print(f"  {result.name}: {status}")

	elif args.command == 'fix':
		with open(args.file, 'rb') as f:
			data = f.read()

		if args.type == 'snes':
			fixed = fix_snes_checksum(data)
		elif args.type == 'gb':
			fixed = fix_gb_checksum(data)
		else:
			print(f"Fix not implemented for: {args.type}")
			sys.exit(1)

		with open(args.output, 'wb') as f:
			f.write(fixed)

		print(f"Fixed checksum saved to: {args.output}")

	elif args.command == 'compare':
		with open(args.file1, 'rb') as f:
			data1 = f.read()
		with open(args.file2, 'rb') as f:
			data2 = f.read()

		print(f"File 1: {args.file1}")
		print(f"  Size: {len(data1):,} bytes")
		print(f"  MD5:  {calculate_md5(data1)}")
		print(f"  CRC32: {calculate_crc32(data1):08X}")
		print()
		print(f"File 2: {args.file2}")
		print(f"  Size: {len(data2):,} bytes")
		print(f"  MD5:  {calculate_md5(data2)}")
		print(f"  CRC32: {calculate_crc32(data2):08X}")
		print()

		if data1 == data2:
			print("Files are IDENTICAL")
		else:
			print("Files are DIFFERENT")
			# Show first difference
			min_len = min(len(data1), len(data2))
			for i in range(min_len):
				if data1[i] != data2[i]:
					print(f"First difference at offset 0x{i:06X}")
					print(f"  File 1: 0x{data1[i]:02X}")
					print(f"  File 2: 0x{data2[i]:02X}")
					break
			else:
				print(f"Size difference: {abs(len(data1) - len(data2)):,} bytes")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
