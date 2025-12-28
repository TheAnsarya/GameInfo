#!/usr/bin/env python3
"""
Soul Blazer (SNES) Map Extractor
Extracts map data, tilesets, and collision information.
"""

import json
import struct
from pathlib import Path
from typing import Optional


class MapExtractor:
	"""Extract map data from Soul Blazer ROM."""

	# Known map pointer table locations (estimates - need verification)
	MAP_POINTER_TABLE = 0x048000  # Bank 09 area
	TILESET_POINTER_TABLE = 0x050000  # Bank 0A area
	COLLISION_POINTER_TABLE = 0x058000  # Bank 0B area

	# Area names for reference
	AREA_NAMES = [
		"Grass Valley Underground",
		"Grass Valley Village",
		"Underground Castle (B1)",
		"Underground Castle (B2)",
		"Underground Castle (B3)",
		"Underground Castle (B4)",
		"GreenWood",
		"GreenWood Underground",
		"Water Shrine",
		"Fire Shrine",
		"Light Shrine",
		"Lost Marsh",
		"St. Elles Seabed",
		"St. Elles Underground",
		"Durean",
		"Ghost Ship",
		"Southerta",
		"Mermaid Queen's Palace",
		"Mountain of Souls",
		"Laynole",
		"Nome",
		"Lune",
		"Model Town 1",
		"Model Town 2",
		"Leo's Lab Basement",
		"Leo's Lab Attic",
		"Leo's Paintings",
		"Magridd Castle Town",
		"Magridd Castle",
		"Castle Basement",
		"World of Evil",
		"Deathtoll's Lair",
	]

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self.maps = []

	def lorom_to_file(self, bank: int, addr: int) -> int:
		"""Convert LoROM address to file offset."""
		return bank * 0x8000 + (addr - 0x8000)

	def file_to_lorom(self, offset: int) -> tuple[int, int]:
		"""Convert file offset to LoROM bank:address."""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return bank, addr

	def read_word(self, offset: int) -> int:
		"""Read 16-bit word at offset."""
		return struct.unpack('<H', self.rom[offset:offset+2])[0]

	def read_long(self, offset: int) -> int:
		"""Read 24-bit long at offset."""
		return struct.unpack('<I', self.rom[offset:offset+3] + b'\x00')[0]

	def scan_for_map_pointers(self) -> list[dict]:
		"""Scan ROM for potential map data pointer tables."""
		results = []

		# Look for patterns that might be map pointer tables
		# Map pointers typically point to sequential data in the same bank

		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			# Check for pointer tables (sequences of 16-bit addresses)
			for offset in range(start, end - 64, 2):
				potential_ptrs = []
				valid = True

				for i in range(16):  # Check 16 pointers
					ptr = self.read_word(offset + i * 2)

					# Valid LoROM addresses are $8000-$FFFF
					if ptr < 0x8000:
						valid = False
						break

					potential_ptrs.append(ptr)

				if valid and len(set(potential_ptrs)) > 8:  # At least 8 unique pointers
					# Check if pointers are in reasonable range
					ptr_range = max(potential_ptrs) - min(potential_ptrs)
					if 0x100 < ptr_range < 0x4000:
						results.append({
							'bank': bank,
							'offset': offset,
							'file_offset': offset,
							'pointer_count': 16,
							'first_ptr': potential_ptrs[0],
							'ptr_range': ptr_range,
						})

		return results

	def extract_tileset(self, offset: int, size: int = 0x1000) -> bytes:
		"""Extract tileset graphics at offset."""
		return self.rom[offset:offset + size]

	def extract_map_layout(self, offset: int, width: int = 64, height: int = 64) -> list[list[int]]:
		"""Extract map tile layout."""
		layout = []
		for y in range(height):
			row = []
			for x in range(width):
				tile_offset = offset + y * width + x
				if tile_offset < len(self.rom):
					row.append(self.rom[tile_offset])
				else:
					row.append(0)
			layout.append(row)
		return layout

	def find_map_headers(self) -> list[dict]:
		"""Find map header structures in ROM."""
		headers = []

		# Look for map header pattern:
		# [width:1] [height:1] [tileset_ptr:2] [data_ptr:2] ...
		for offset in range(0, len(self.rom) - 16, 2):
			# Typical map dimensions
			w = self.rom[offset]
			h = self.rom[offset + 1]

			if 16 <= w <= 128 and 16 <= h <= 128:
				# Check for valid pointers following
				ptr1 = self.read_word(offset + 2)
				ptr2 = self.read_word(offset + 4)

				if 0x8000 <= ptr1 < 0xFFFF and 0x8000 <= ptr2 < 0xFFFF:
					bank, addr = self.file_to_lorom(offset)
					headers.append({
						'offset': offset,
						'bank': bank,
						'address': addr,
						'width': w,
						'height': h,
						'ptr1': ptr1,
						'ptr2': ptr2,
					})

		return headers

	def extract_all(self, output_dir: str):
		"""Extract all map-related data."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		print("Scanning for map data...")

		# Find pointer tables
		ptr_tables = self.scan_for_map_pointers()
		print(f"Found {len(ptr_tables)} potential pointer tables")

		# Find map headers
		headers = self.find_map_headers()
		print(f"Found {len(headers)} potential map headers")

		# Save results
		results = {
			'pointer_tables': ptr_tables[:100],  # Limit for readability
			'map_headers': headers[:100],
			'area_names': self.AREA_NAMES,
		}

		with open(output / 'map_scan_results.json', 'w') as f:
			json.dump(results, f, indent='\t')

		# Extract sample tilesets from graphics areas
		print("\nExtracting sample map data...")

		# Bank $10-$14 typically contain graphics/map data
		for bank in [0x10, 0x11, 0x12, 0x13, 0x14]:
			start = bank * 0x8000
			tileset = self.extract_tileset(start, 0x2000)

			with open(output / f'tileset_bank{bank:02x}.bin', 'wb') as f:
				f.write(tileset)

		print(f"Map data extracted to: {output}")

		return results


def main():
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\maps"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	extractor = MapExtractor(rom_path)
	results = extractor.extract_all(output_dir)

	print(f"\nSample pointer tables:")
	for table in results['pointer_tables'][:5]:
		print(f"  Bank ${table['bank']:02x} offset ${table['file_offset']:06x}: "
			  f"{table['pointer_count']} ptrs, range ${table['ptr_range']:04x}")

	print(f"\nSample map headers:")
	for header in results['map_headers'][:5]:
		print(f"  ${header['bank']:02x}:{header['address']:04x}: "
			  f"{header['width']}x{header['height']}")


if __name__ == '__main__':
	main()
