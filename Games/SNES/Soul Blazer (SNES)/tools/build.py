#!/usr/bin/env python3
"""
Soul Blazer (SNES) Build Pipeline
Extract, convert, and rebuild the ROM.
"""

import argparse
import hashlib
import json
import shutil
import struct
import sys
from pathlib import Path


# Expected ROM hashes for verification
EXPECTED_HASHES = {
	'sha256': '8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2',
	'sha1': 'f2832eb02547c39cae3bdaab5c2a53e4f8b31810',
	'md5': '83cf41d53a1b94aeea1a645037a24004',
	'crc32': '31b965db',
}


def get_file_hash(path: str, algorithm: str = 'sha256') -> str:
	"""Calculate file hash."""
	h = hashlib.new(algorithm)
	with open(path, 'rb') as f:
		h.update(f.read())
	return h.hexdigest()


def verify_rom(rom_path: str) -> bool:
	"""Verify ROM against expected hashes."""
	sha256 = get_file_hash(rom_path, 'sha256')
	return sha256 == EXPECTED_HASHES['sha256']


def calculate_checksum(rom_data: bytes) -> tuple[int, int]:
	"""Calculate SNES checksum and complement."""
	# Make a mutable copy and zero out the checksum area
	data = bytearray(rom_data)
	data[0x7fdc:0x7fe0] = b'\x00\x00\x00\x00'

	# Calculate sum of all bytes
	checksum = sum(data) & 0xffff

	# Complement
	complement = checksum ^ 0xffff

	return checksum, complement


def fix_checksum(rom_path: str):
	"""Fix the ROM checksum."""
	with open(rom_path, 'rb') as f:
		rom = bytearray(f.read())

	checksum, complement = calculate_checksum(rom)

	# Write complement first (at $7fdc-$7fdd)
	rom[0x7fdc] = complement & 0xff
	rom[0x7fdd] = (complement >> 8) & 0xff

	# Write checksum (at $7fde-$7fdf)
	rom[0x7fde] = checksum & 0xff
	rom[0x7fdf] = (checksum >> 8) & 0xff

	with open(rom_path, 'wb') as f:
		f.write(rom)

	print(f"Checksum fixed: 0x{checksum:04x} (complement: 0x{complement:04x})")


def extract_assets(rom_path: str, output_dir: str):
	"""Extract all assets from ROM."""
	output = Path(output_dir)
	output.mkdir(parents=True, exist_ok=True)

	# Import extraction tools
	tools_dir = Path(__file__).parent
	sys.path.insert(0, str(tools_dir))

	from text_extractor import extract_all_text
	from graphics_extractor import extract_all_graphics

	print("Extracting text...")
	extract_all_text(rom_path, str(output / 'text'))

	print("\nExtracting graphics...")
	extract_all_graphics(rom_path, str(output / 'graphics'))

	# Extract raw data banks
	print("\nExtracting raw banks...")
	with open(rom_path, 'rb') as f:
		rom = f.read()

	banks_dir = output / 'banks'
	banks_dir.mkdir(exist_ok=True)

	num_banks = len(rom) // 0x8000
	for bank in range(num_banks):
		start = bank * 0x8000
		end = start + 0x8000
		bank_data = rom[start:end]

		with open(banks_dir / f'bank{bank:02x}.bin', 'wb') as f:
			f.write(bank_data)

	print(f"  Extracted {num_banks} banks")

	# Create manifest
	manifest = {
		'rom_name': 'Soul Blazer (U)',
		'rom_sha256': get_file_hash(rom_path, 'sha256'),
		'rom_size': len(rom),
		'num_banks': num_banks,
		'assets': {
			'text': str(output / 'text'),
			'graphics': str(output / 'graphics'),
			'banks': str(banks_dir),
		}
	}

	with open(output / 'manifest.json', 'w') as f:
		json.dump(manifest, f, indent='\t')

	print(f"\nAssets extracted to: {output}")


def build_rom(assets_dir: str, output_path: str):
	"""Build ROM from extracted assets."""
	assets = Path(assets_dir)
	banks_dir = assets / 'banks'

	if not banks_dir.exists():
		print("Error: Banks directory not found")
		return False

	# Read manifest
	manifest_path = assets / 'manifest.json'
	if manifest_path.exists():
		with open(manifest_path) as f:
			manifest = json.load(f)
		num_banks = manifest.get('num_banks', 32)
	else:
		num_banks = 32

	# Assemble ROM from banks
	print(f"Building ROM from {num_banks} banks...")
	rom = bytearray()

	for bank in range(num_banks):
		bank_file = banks_dir / f'bank{bank:02x}.bin'
		if bank_file.exists():
			with open(bank_file, 'rb') as f:
				rom.extend(f.read())
		else:
			# Fill with zeros if bank is missing
			rom.extend(b'\x00' * 0x8000)
			print(f"  Warning: Bank {bank:02x} missing, filled with zeros")

	# TODO: Apply text changes from JSON
	# TODO: Apply graphics changes from PNG

	# Fix checksum
	checksum, complement = calculate_checksum(rom)
	rom[0x7fdc] = complement & 0xff
	rom[0x7fdd] = (complement >> 8) & 0xff
	rom[0x7fde] = checksum & 0xff
	rom[0x7fdf] = (checksum >> 8) & 0xff

	# Write output
	with open(output_path, 'wb') as f:
		f.write(rom)

	print(f"ROM built: {output_path}")
	print(f"Size: {len(rom):,} bytes")
	print(f"Checksum: 0x{checksum:04x}")

	return True


def compare_roms(rom1_path: str, rom2_path: str):
	"""Compare two ROMs and show differences."""
	with open(rom1_path, 'rb') as f:
		rom1 = f.read()
	with open(rom2_path, 'rb') as f:
		rom2 = f.read()

	if len(rom1) != len(rom2):
		print(f"Size difference: {len(rom1)} vs {len(rom2)} bytes")

	min_len = min(len(rom1), len(rom2))
	differences = []

	for i in range(min_len):
		if rom1[i] != rom2[i]:
			differences.append((i, rom1[i], rom2[i]))

	if differences:
		print(f"Found {len(differences)} byte differences:")
		for offset, b1, b2 in differences[:20]:
			bank = offset // 0x8000
			addr = 0x8000 + (offset % 0x8000)
			print(f"  ${offset:06x} (${bank:02x}:{addr:04x}): {b1:02x} -> {b2:02x}")
		if len(differences) > 20:
			print(f"  ... and {len(differences) - 20} more")
	else:
		print("ROMs are identical!")

	return len(differences) == 0


def main():
	parser = argparse.ArgumentParser(description='Soul Blazer Build Pipeline')
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract assets from ROM')
	extract_parser.add_argument('rom', help='Path to original ROM')
	extract_parser.add_argument('-o', '--output', default='assets', help='Output directory')

	# Build command
	build_parser = subparsers.add_parser('build', help='Build ROM from assets')
	build_parser.add_argument('assets', help='Path to assets directory')
	build_parser.add_argument('-o', '--output', default='build/soul_blazer.sfc', help='Output ROM path')

	# Verify command
	verify_parser = subparsers.add_parser('verify', help='Verify ROM hashes')
	verify_parser.add_argument('rom', help='Path to ROM')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare two ROMs')
	compare_parser.add_argument('rom1', help='First ROM')
	compare_parser.add_argument('rom2', help='Second ROM')

	# Checksum command
	checksum_parser = subparsers.add_parser('checksum', help='Fix ROM checksum')
	checksum_parser.add_argument('rom', help='Path to ROM')

	args = parser.parse_args()

	if args.command == 'extract':
		extract_assets(args.rom, args.output)

	elif args.command == 'build':
		build_rom(args.assets, args.output)

	elif args.command == 'verify':
		sha256 = get_file_hash(args.rom, 'sha256')
		print(f"SHA256: {sha256}")
		if sha256 == EXPECTED_HASHES['sha256']:
			print("✓ ROM verified - matches expected hash")
		else:
			print("✗ ROM does not match expected hash")
			print(f"Expected: {EXPECTED_HASHES['sha256']}")

	elif args.command == 'compare':
		compare_roms(args.rom1, args.rom2)

	elif args.command == 'checksum':
		fix_checksum(args.rom)

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
