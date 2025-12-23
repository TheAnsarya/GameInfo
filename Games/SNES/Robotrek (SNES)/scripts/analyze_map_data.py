#!/usr/bin/env python3
"""
Robotrek Map Data Analyzer

Analyzes map-related data structures in the ROM.
Maps are stored with compressed tilesets and metadata.
"""

import struct
import json
import os

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Known map-related regions from ROM_Map
MAP_TILESET_REGIONS = [
	(0x00000, 0x00622, "Map tileset 1"),
	(0x00623, 0x00c3e, "Map tileset 2"),
	(0x00c3f, 0x0124d, "Map tileset 3"),
	(0x0124e, 0x01844, "Map tileset 4"),
	(0x01845, 0x01e2e, "Map tileset 5"),
	(0x01e2f, 0x023e7, "Map tileset 6"),
	(0x023e8, 0x0296a, "Map arrangement 1"),
]

# Map metadata region
MAP_METADATA_START = 0xd8000
MAP_METADATA_END = 0xd930f


def analyze_map_metadata(rom: bytes) -> dict:
	"""Analyze the map metadata region at $d8000."""
	data = rom[MAP_METADATA_START:MAP_METADATA_END]
	
	print(f"Map metadata region: ${MAP_METADATA_START:06x}-${MAP_METADATA_END:06x}")
	print(f"Size: {len(data)} bytes (${len(data):04x})")
	print()
	
	# Look for patterns in the metadata
	# Try to identify pointer tables or index structures
	
	# Check if it looks like a pointer table
	pointers = []
	for i in range(0, min(256, len(data)), 2):
		ptr = struct.unpack('<H', data[i:i+2])[0]
		pointers.append(ptr)
	
	# Analyze pointer distribution
	analysis = {
		"region": f"${MAP_METADATA_START:06x}-${MAP_METADATA_END:06x}",
		"size": len(data),
		"sample_pointers": [f"${p:04x}" for p in pointers[:32]],
		"unique_pointers": len(set(pointers[:64])),
	}
	
	# Check for repeating patterns
	patterns = {}
	for i in range(0, len(data) - 4, 4):
		pattern = data[i:i+4]
		key = pattern.hex()
		patterns[key] = patterns.get(key, 0) + 1
	
	common_patterns = sorted(patterns.items(), key=lambda x: -x[1])[:10]
	analysis["common_4byte_patterns"] = dict(common_patterns)
	
	return analysis


def analyze_tileset_headers(rom: bytes) -> list:
	"""Analyze compressed tileset headers to find map count."""
	tilesets = []
	
	for start, end, desc in MAP_TILESET_REGIONS:
		data = rom[start:end]
		
		# LZSS compressed data typically has a size header
		# Check first few bytes
		header_bytes = data[:8]
		
		tileset_info = {
			"offset": f"${start:06x}",
			"end": f"${end:06x}",
			"size": end - start,
			"description": desc,
			"header_hex": ' '.join(f'{b:02x}' for b in header_bytes),
		}
		
		# Try to identify compression header
		# Quintet LZSS typically starts with decompressed size (16-bit or 24-bit)
		if len(data) >= 2:
			decomp_size_16 = struct.unpack('<H', data[0:2])[0]
			tileset_info["potential_decomp_size_16"] = decomp_size_16
		
		tilesets.append(tileset_info)
	
	return tilesets


def find_map_pointer_tables(rom: bytes) -> list:
	"""Search for potential map pointer tables."""
	tables = []
	
	# Look for tables where pointers cluster in expected regions
	# Maps often have pointers to tileset/arrangement data in banks $00-$03
	
	for bank in range(0, 0x18):  # Check first 24 banks
		bank_offset = bank * 0x10000
		
		for offset in range(0, 0x2000, 2):  # Check first 8KB of each bank
			addr = bank_offset + offset
			if addr + 64 > len(rom):
				continue
			
			# Check if this looks like a pointer table
			valid_count = 0
			for i in range(32):
				ptr_addr = addr + i * 2
				if ptr_addr + 2 > len(rom):
					break
				
				ptr = struct.unpack('<H', rom[ptr_addr:ptr_addr + 2])[0]
				
				# Valid pointers should be in reasonable range
				if 0x8000 <= ptr <= 0xffff or ptr < 0x2000:
					valid_count += 1
			
			# If most values look like valid pointers, record this
			if valid_count >= 28:
				tables.append({
					"offset": f"${addr:06x}",
					"bank": f"${bank:02x}",
					"valid_pointers": valid_count
				})
	
	return tables[:20]  # Limit results


def main():
	print("Robotrek Map Data Analyzer")
	print("=" * 60)
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Analyze map metadata
	print("Analyzing map metadata region...")
	metadata = analyze_map_metadata(rom)
	print(f"Sample pointers: {metadata['sample_pointers'][:8]}")
	print(f"Unique pointers (first 64): {metadata['unique_pointers']}")
	print(f"Common 4-byte patterns: {list(metadata['common_4byte_patterns'].items())[:5]}")
	print()
	
	# Analyze tileset headers
	print("Analyzing tileset regions...")
	tilesets = analyze_tileset_headers(rom)
	for ts in tilesets:
		print(f"  {ts['description']} at {ts['offset']}")
		print(f"    Size: {ts['size']} bytes, Header: {ts['header_hex']}")
		if 'potential_decomp_size_16' in ts:
			print(f"    Potential decomp size: {ts['potential_decomp_size_16']}")
	print()
	
	# Search for pointer tables
	print("Searching for map pointer tables...")
	tables = find_map_pointer_tables(rom)
	print(f"Found {len(tables)} potential pointer tables")
	for t in tables[:10]:
		print(f"  {t['offset']} in bank {t['bank']}: {t['valid_pointers']} valid pointers")
	
	# Save results
	output = {
		"map_metadata": metadata,
		"tileset_regions": tilesets,
		"potential_pointer_tables": tables
	}
	
	output_path = os.path.join(OUTPUT_DIR, "map_data_analysis.json")
	with open(output_path, 'w') as f:
		json.dump(output, f, indent='\t')
	
	print()
	print(f"Saved analysis to: {output_path}")


if __name__ == "__main__":
	main()
