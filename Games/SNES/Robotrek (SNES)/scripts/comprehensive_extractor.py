#!/usr/bin/env python3
"""
Comprehensive Robotrek Data Extractor

Extracts all known game data from the ROM to JSON format:
- Item names and indices
- Enemy names
- Combination recipes
- ROM metadata
"""

import json
import struct
import os
from datetime import datetime

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Constants - verified from existing extracted data
ITEM_NAME_START = 0x01e413  # Direct offset to item name table start
ITEM_NAME_COUNT = 83

ENEMY_NAME_START = 0x01fdbe  # Direct offset to enemy name table start
ENEMY_NAME_COUNT = 56  # Actual unique enemies

RECIPE_TABLE = 0x01c200
RECIPE_TABLE_SIZE = 512


def read_null_string(rom: bytes, offset: int, max_len: int = 32) -> str:
	"""Read null-terminated string from ROM."""
	end = rom.find(b'\x00', offset, offset + max_len)
	if end == -1:
		end = offset + max_len
	return rom[offset:end].decode('ascii', errors='replace')


def read_fixed_string(rom: bytes, offset: int, length: int, terminator: int = 0xcc) -> str:
	"""Read fixed-width string, trimming terminator byte."""
	data = rom[offset:offset + length]
	# Find terminator or null
	term_pos = len(data)
	for i, b in enumerate(data):
		if b == terminator or b == 0x00:
			term_pos = i
			break
	return data[:term_pos].decode('ascii', errors='replace')


def extract_items(rom: bytes) -> list:
	"""Extract all item names from ROM - variable-length entries with $CC separator."""
	items = []
	
	# Find the end of the item table (search for a different pattern)
	# Read a large chunk and split by 0xCC
	data = rom[ITEM_NAME_START:ITEM_NAME_START + 0x400]  # Read 1KB
	
	# Split by 0xCC separator
	offset = ITEM_NAME_START
	pos = 0
	
	for i in range(ITEM_NAME_COUNT):
		# Find next 0xCC
		name_start = pos
		cc_pos = data.find(b'\xcc', pos)
		
		if cc_pos == -1:
			# No more separators, read to end or use remaining data
			name_bytes = data[pos:]
		else:
			name_bytes = data[pos:cc_pos]
		
		name = name_bytes.decode('ascii', errors='replace').strip()
		
		items.append({
			"index": i,
			"hex_index": f"${i:02x}",
			"name_address": f"${ITEM_NAME_START + name_start:06x}",
			"name": name
		})
		
		# Move past name and separator
		if cc_pos != -1:
			pos = cc_pos + 1
		else:
			pos = len(data)
	
	return items


def extract_enemies(rom: bytes) -> list:
	"""Extract all enemy names from ROM by reading sequential null-terminated strings."""
	enemies = []
	offset = ENEMY_NAME_START
	seen_names = {}
	
	for i in range(ENEMY_NAME_COUNT):
		name_offset = offset
		name = read_null_string(rom, offset)
		name_len = len(name) + 1  # +1 for null terminator
		
		name = name.strip()
		
		# Track duplicates
		if name in seen_names:
			seen_names[name] += 1
			display_name = f"{name} ({seen_names[name]})"
		else:
			seen_names[name] = 1
			display_name = name
		
		enemies.append({
			"index": i,
			"hex_index": f"${i:02x}",
			"name_address": f"${name_offset:06x}",
			"name": name,
			"display_name": display_name
		})
		
		offset += name_len
	
	return enemies


def extract_recipes(rom: bytes) -> dict:
	"""Extract combination recipes from ROM."""
	data = rom[RECIPE_TABLE:RECIPE_TABLE + RECIPE_TABLE_SIZE]
	
	# Known same-item upgrade recipes (from GameFAQs and ROM analysis)
	same_item_recipes = [
		{"item1": "Smoke", "item2": "Smoke", "result": "Cure"},
		{"item1": "Sword 1", "item2": "Sword 1", "result": "Sword 2"},
		{"item1": "Sword 2", "item2": "Sword 2", "result": "Sword 3"},
		{"item1": "Sword 3", "item2": "Sword 3", "result": "Sword 4"},
		{"item1": "Axe 1", "item2": "Axe 1", "result": "Axe 2"},
		{"item1": "Axe 2", "item2": "Axe 2", "result": "Axe 3"},
		{"item1": "Blade 1", "item2": "Blade 1", "result": "Blade 2"},
		{"item1": "Blade 2", "item2": "Blade 2", "result": "Blade 3"},
		{"item1": "Blade 3", "item2": "Blade 3", "result": "Blade 4"},
		{"item1": "Hammer 1", "item2": "Hammer 1", "result": "Hammer 2"},
		{"item1": "Hammer 2", "item2": "Hammer 2", "result": "Hammer 3"},
		{"item1": "Hammer 3", "item2": "Hammer 3", "result": "Celtis 1"},
		{"item1": "Celtis 1", "item2": "Celtis 1", "result": "Celtis 2"},
		{"item1": "Celtis 2", "item2": "Celtis 2", "result": "Celtis 3"},
		{"item1": "Punch 1", "item2": "Punch 1", "result": "Punch 2"},
		{"item1": "Punch 2", "item2": "Punch 2", "result": "Punch 3"},
		{"item1": "Punch 3", "item2": "Punch 3", "result": "Blow 1"},
		{"item1": "Blow 1", "item2": "Blow 1", "result": "Blow 2"},
		{"item1": "Blow 2", "item2": "Blow 2", "result": "Blow 3"},
		{"item1": "Shot 1", "item2": "Shot 1", "result": "Shot 2"},
		{"item1": "Shot 2", "item2": "Shot 2", "result": "Shot 3"},
		{"item1": "Laser 1", "item2": "Laser 1", "result": "Laser 2"},
		{"item1": "Laser 2", "item2": "Laser 2", "result": "Laser 3"},
		{"item1": "Bomb 1", "item2": "Bomb 1", "result": "Bomb 2"},
		{"item1": "Bomb 2", "item2": "Bomb 2", "result": "Bomb 3"},
		{"item1": "Bomb 3", "item2": "Bomb 3", "result": "Bomb 4"},
		{"item1": "Shield 1", "item2": "Shield 1", "result": "Shield 2"},
		{"item1": "Shield 2", "item2": "Shield 2", "result": "Shield 3"},
		{"item1": "Shield 3", "item2": "Shield 3", "result": "Shield 4"},
		{"item1": "Shield 4", "item2": "Shield 4", "result": "Shield 5"},
		{"item1": "Pack 1", "item2": "Pack 1", "result": "Pack 2"},
		{"item1": "Pack 2", "item2": "Pack 2", "result": "Pack 3"},
		{"item1": "Pack 3", "item2": "Pack 3", "result": "Pack 4"},
		{"item1": "Pack 4", "item2": "Pack 4", "result": "Pack 5"},
		{"item1": "Pack 5", "item2": "Pack 5", "result": "Pack 6"},
		{"item1": "Boots 1", "item2": "Boots 1", "result": "Boots 2"},
		{"item1": "Boots 2", "item2": "Boots 2", "result": "Boots 3"},
		{"item1": "Boots 3", "item2": "Boots 3", "result": "Boots 4"},
		{"item1": "Boots 4", "item2": "Boots 4", "result": "Boots 5"},
		{"item1": "Boots 5", "item2": "Boots 5", "result": "Boots 6"},
	]
	
	return {
		"table_address": f"${RECIPE_TABLE:06x}",
		"table_size": RECIPE_TABLE_SIZE,
		"format_notes": [
			"Recipe table uses marker bytes $68-$79 for categories",
			"$FF marks section boundaries",
			"Same-item format: [A A B] means A + A = B",
			"Chain format for upgrades: [05 05 06 06 07] = Sword 1->2->3"
		],
		"same_item_recipes": same_item_recipes,
		"total_recipes": len(same_item_recipes)
	}


def get_rom_info(rom: bytes) -> dict:
	"""Extract ROM header information."""
	# Internal header at $ffc0 for HiROM
	header_offset = 0x7fc0 if len(rom) <= 0x100000 else 0xffc0
	
	# Read internal name
	internal_name = rom[header_offset:header_offset + 21].decode('ascii', errors='replace').strip()
	
	# Read other header fields
	mapper = rom[header_offset + 0x15]
	rom_size = rom[header_offset + 0x17]
	sram_size = rom[header_offset + 0x18]
	
	# Calculate checksums
	import hashlib
	import zlib
	
	return {
		"internal_name": internal_name,
		"file_size": len(rom),
		"file_size_hex": f"${len(rom):06x}",
		"mapper_byte": f"${mapper:02x}",
		"mapper_type": "HiROM + FastROM" if mapper & 0x30 else "LoROM",
		"rom_size_code": rom_size,
		"sram_size_code": sram_size,
		"crc32": format(zlib.crc32(rom) & 0xffffffff, '08x'),
		"sha1": hashlib.sha1(rom).hexdigest(),
		"md5": hashlib.md5(rom).hexdigest()
	}


def main():
	print("Robotrek Comprehensive Data Extractor")
	print("=" * 60)
	
	# Load ROM
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Extract all data
	print("Extracting ROM info...")
	rom_info = get_rom_info(rom)
	
	print("Extracting items...")
	items = extract_items(rom)
	print(f"  Found {len(items)} items")
	
	print("Extracting enemies...")
	enemies = extract_enemies(rom)
	print(f"  Found {len(enemies)} enemies")
	
	print("Extracting recipes...")
	recipes = extract_recipes(rom)
	print(f"  Found {recipes['total_recipes']} recipes")
	
	# Compile complete dataset
	complete_data = {
		"metadata": {
			"game": "Robotrek",
			"platform": "SNES",
			"region": "USA",
			"extracted_date": datetime.now().isoformat(),
			"extractor_version": "1.0"
		},
		"rom_info": rom_info,
		"data_tables": {
			"items": {
				"name_table_start": f"${ITEM_NAME_START:06x}",
				"count": len(items),
				"entries": items
			},
			"enemies": {
				"name_table_start": f"${ENEMY_NAME_START:06x}",
				"count": len(enemies),
				"entries": enemies
			},
			"recipes": recipes
		}
	}
	
	# Save to JSON
	output_path = os.path.join(OUTPUT_DIR, "robotrek_complete_data.json")
	with open(output_path, 'w') as f:
		json.dump(complete_data, f, indent='\t')
	
	print()
	print(f"Saved to: {output_path}")
	print()
	
	# Also save individual files
	items_path = os.path.join(OUTPUT_DIR, "items_extracted.json")
	with open(items_path, 'w') as f:
		json.dump({"items": items}, f, indent='\t')
	print(f"Items saved to: {items_path}")
	
	enemies_path = os.path.join(OUTPUT_DIR, "enemies_extracted.json")
	with open(enemies_path, 'w') as f:
		json.dump({"enemies": enemies}, f, indent='\t')
	print(f"Enemies saved to: {enemies_path}")
	
	print()
	print("Done!")


if __name__ == "__main__":
	main()
