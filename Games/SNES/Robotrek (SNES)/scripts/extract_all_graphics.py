#!/usr/bin/env python3
"""
Extract all compressed graphics from Robotrek ROM.

Uses the Quintet LZSS decompression to extract graphics data
from known compressed regions.
"""

import os
import struct
import sys

# Add tools directory to path
sys.path.insert(0, r"C:\Users\me\source\repos\GameInfo\tools\robotrek")
from quintet_lzss import decompress_quintet_lzss

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted\graphics"

# Known compressed graphics regions from ROM map
COMPRESSED_REGIONS = [
	# (file_offset, description)
	(0x00000, "Map tileset 1"),
	(0x00623, "Map tileset 2"),
	(0x00c3f, "Map tileset 3"),
	(0x0124e, "Map tileset 4"),
	(0x01845, "Map tileset 5"),
	(0x01e2f, "Map tileset 6"),
	(0x023e8, "Map arrangement 1"),
	(0x0344b, "Map tileset 7"),
	(0x10000, "Map arrangement 2"),
	(0x82000, "Graphics bank 1"),
	(0x835c5, "Graphics bank 2"),
	(0x84b5c, "Graphics bank 3"),
	(0x860ef, "Graphics bank 4"),
	(0x87631, "Graphics bank 5"),
	(0xdb310, "Menu graphics 1"),
	(0xdd170, "Menu graphics 2"),
	(0xdeb7f, "Menu graphics 3"),
]


def safe_decompress(rom: bytes, offset: int) -> tuple[bytes, bool]:
	"""Attempt to decompress data at offset, return (data, success)."""
	try:
		data = decompress_quintet_lzss(rom, offset)
		if len(data) > 0 and len(data) < 0x10000:  # Sanity check
			return data, True
		return b"", False
	except Exception as e:
		return b"", False


def main():
	print("Robotrek Compressed Graphics Extractor")
	print("=" * 60)
	
	# Create output directory
	os.makedirs(OUTPUT_DIR, exist_ok=True)
	
	# Load ROM
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print(f"Output directory: {OUTPUT_DIR}")
	print()
	
	extracted = []
	
	for offset, description in COMPRESSED_REGIONS:
		if offset >= len(rom):
			print(f"  [{description}] ${offset:06x}: SKIP (beyond ROM)")
			continue
		
		# Read header to get expected size
		if offset + 2 <= len(rom):
			expected_size = struct.unpack('<H', rom[offset:offset + 2])[0]
		else:
			expected_size = 0
		
		data, success = safe_decompress(rom, offset)
		
		if success:
			filename = f"{offset:06x}_{description.replace(' ', '_').lower()}.bin"
			filepath = os.path.join(OUTPUT_DIR, filename)
			
			with open(filepath, 'wb') as f:
				f.write(data)
			
			extracted.append({
				"offset": offset,
				"description": description,
				"compressed_size": "?",
				"decompressed_size": len(data),
				"file": filename
			})
			
			print(f"  [{description}] ${offset:06x}: {len(data):,} bytes -> {filename}")
		else:
			print(f"  [{description}] ${offset:06x}: FAILED (expected {expected_size} bytes)")
	
	print()
	print(f"Successfully extracted: {len(extracted)}/{len(COMPRESSED_REGIONS)} regions")
	
	# Also extract uncompressed graphics
	print()
	print("Extracting uncompressed graphics:")
	
	# Font at $80000
	font_data = rom[0x80000:0x82000]
	font_path = os.path.join(OUTPUT_DIR, "080000_font.bin")
	with open(font_path, 'wb') as f:
		f.write(font_data)
	print(f"  Font graphics: ${0x80000:06x} -> 080000_font.bin ({len(font_data):,} bytes)")
	
	# Inventory graphics at $d9310
	inv_data = rom[0xd9310:0xdb310]
	inv_path = os.path.join(OUTPUT_DIR, "0d9310_inventory.bin")
	with open(inv_path, 'wb') as f:
		f.write(inv_data)
	print(f"  Inventory graphics: ${0xd9310:06x} -> 0d9310_inventory.bin ({len(inv_data):,} bytes)")
	
	print()
	print("Done!")


if __name__ == "__main__":
	main()
