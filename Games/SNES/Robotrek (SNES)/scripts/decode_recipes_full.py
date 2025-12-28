#!/usr/bin/env python3
"""
Complete Robotrek combination recipe table decoder.

Based on analysis:
- Recipe table at $01c200 contains combination data
- Uses markers $68-$79 (possibly category indicators)
- $FF marks section boundaries
- Item indices are $00-$54 (0-84 decimal)
"""

import json
import os

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Item name mapping (corrected indices based on item pointer table)
ITEM_NAMES = {
	# Consumables (0-4)
	0x00: "Empty",
	0x01: "Smoke",
	0x02: "Cure", 
	0x03: "Clean",
	0x04: "Repair",
	
	# Swords (5-8)
	0x05: "Sword 1",
	0x06: "Sword 2",
	0x07: "Sword 3",
	0x08: "Sword 4",
	
	# Axes (9-11)
	0x09: "Axe 1",
	0x0a: "Axe 2",
	0x0b: "Axe 3",
	
	# Blades (12-15) - Note: $0c-$0f
	0x0c: "Blade 1",
	0x0d: "Blade 2",
	0x0e: "Blade 3",
	0x0f: "Blade 4",
	
	# Hammers (16-18) - Note: $10-$12
	0x10: "Hammer 1",
	0x11: "Hammer 2",
	0x12: "Hammer 3",
	
	# Celtis (19-21) - Note: $13-$15
	0x13: "Celtis 1",
	0x14: "Celtis 2",
	0x15: "Celtis 3",
	
	# Punches (22-24) - Note: $16-$18
	0x16: "Punch 1",
	0x17: "Punch 2",
	0x18: "Punch 3",
	
	# Blows (25-27) - Note: $19-$1b
	0x19: "Blow 1",
	0x1a: "Blow 2",
	0x1b: "Blow 3",
	
	# Shots (28-30) - Note: $1c-$1e
	0x1c: "Shot 1",
	0x1d: "Shot 2",
	0x1e: "Shot 3",
	
	# Lasers (31-33) - Note: $1f-$21
	0x1f: "Laser 1",
	0x20: "Laser 2",
	0x21: "Laser 3",
	
	# Bombs (34-37) - Note: $22-$25
	0x22: "Bomb 1",
	0x23: "Bomb 2",
	0x24: "Bomb 3",
	0x25: "Bomb 4",
	
	# Shields (38-42) - Note: $26-$2a
	0x26: "Shield 1",
	0x27: "Shield 2",
	0x28: "Shield 3",
	0x29: "Shield 4",
	0x2a: "Shield 5",
	
	# Packs (43-48) - Note: $2b-$30
	0x2b: "Pack 1",
	0x2c: "Pack 2",
	0x2d: "Pack 3",
	0x2e: "Pack 4",
	0x2f: "Pack 5",
	0x30: "Pack 6",
	
	# Boots (49-54) - Note: $31-$36
	0x31: "Boots 1",
	0x32: "Boots 2",
	0x33: "Boots 3",
	0x34: "Boots 4",
	0x35: "Boots 5",
	0x36: "Boots 6",
	
	# Big Bomb
	0x37: "Big Bomb",
	
	# Scraps
	0x38: "Scrap A",
	0x39: "Scrap B",
	0x3a: "Scrap 1",
	0x3b: "Scrap 2",
	0x3c: "Scrap 3",
	0x3d: "Scrap 4",
	0x3e: "Scrap 5",
	0x3f: "Scrap 6",
	0x40: "Scrap 7",
	0x41: "Scrap 8",
	0x42: "Scrap 9",
	0x43: "Scrap 10",
	
	# Key items
	0x4b: "Key",
	0x50: "Weather",
}

# Marker meanings (best guesses from pattern analysis)
MARKERS = {
	0x65: "Category separator",
	0x66: "Unknown marker",
	0x67: "Unknown marker",
	0x68: "Consumable category",
	0x69: "Axe/Punch related",
	0x6a: "Boot/Pack related",
	0x6b: "Blade related",
	0x6c: "Pack related",
	0x6d: "Multi-item recipe start",
	0x6e: "Shot related",
	0x6f: "Unknown marker",
	0x70: "Laser/Bomb related",
	0x71: "Shield related",
	0x74: "Unknown marker",
	0x75: "Weather/Key related",
	0x76: "Shot related",
	0x77: "Multiple items",
	0x78: "Scrap related",
	0x79: "Bomb related",
}


def get_item_name(idx: int) -> str:
	"""Get item name from index."""
	return ITEM_NAMES.get(idx, f"Unknown_${idx:02x}")


def is_marker(byte: int) -> bool:
	"""Check if byte is a control marker."""
	return byte >= 0x65 and byte <= 0x7f


def parse_recipe_table(rom: bytes) -> dict:
	"""Parse the full recipe table."""
	# Full recipe region from $01c200 to around $01c400
	TABLE_START = 0x01c200
	TABLE_END = 0x01c400
	
	data = rom[TABLE_START:TABLE_END]
	
	recipes = {
		"same_item": [],        # Item + Item = Next tier
		"cross_item": [],       # Item A + Item B = Item C
		"multi_item": [],       # Multiple items create something
		"unknown": []           # Unparsed patterns
	}
	
	print("Parsing recipe table...")
	print(f"Table range: ${TABLE_START:06x} - ${TABLE_END:06x}")
	print()
	
	# Debug: print the table with annotation
	print("Raw table with markers:")
	print("-" * 70)
	
	i = 0
	current_marker = None
	pending_items = []
	
	while i < len(data):
		byte = data[i]
		addr = TABLE_START + i
		
		if byte == 0xff:
			# Section separator
			if pending_items:
				# Process pending items if any
				process_pending_items(pending_items, recipes, current_marker)
				pending_items = []
			print(f"${addr:06x}: [FF] === Section break ===")
			i += 1
			continue
		
		if is_marker(byte):
			# Marker byte
			if pending_items:
				process_pending_items(pending_items, recipes, current_marker)
				pending_items = []
			current_marker = byte
			marker_name = MARKERS.get(byte, "Unknown")
			print(f"${addr:06x}: [${byte:02x}] Marker: {marker_name}")
			i += 1
			continue
		
		if byte == 0x00:
			# Null padding
			i += 1
			continue
		
		if byte < 0x60:  # Likely an item ID
			pending_items.append((addr, byte))
			i += 1
			continue
		
		# Unknown byte
		print(f"${addr:06x}: [${byte:02x}] Unknown control byte")
		i += 1
	
	# Final pending items
	if pending_items:
		process_pending_items(pending_items, recipes, current_marker)
	
	return recipes


def process_pending_items(items: list, recipes: dict, marker: int):
	"""Process a group of pending item IDs into recipes."""
	if len(items) < 2:
		return
	
	print(f"  Processing group: {[f'${b:02x}' for _, b in items]}")
	
	# Try to identify same-item pairs (A A B means A+A=B)
	# Look for consecutive pairs
	i = 0
	while i < len(items) - 1:
		addr1, item1 = items[i]
		addr2, item2 = items[i + 1]
		
		if item1 == item2 and i + 2 < len(items):
			# Same-item pair, next is result
			_, result = items[i + 2]
			recipe = {
				"address": f"${addr1:06x}",
				"item1": item1,
				"item1_name": get_item_name(item1),
				"item2": item2,
				"item2_name": get_item_name(item2),
				"result": result,
				"result_name": get_item_name(result),
				"marker": f"${marker:02x}" if marker else None
			}
			recipes["same_item"].append(recipe)
			print(f"    RECIPE: {get_item_name(item1)} + {get_item_name(item2)} = {get_item_name(result)}")
			i += 2  # Skip the pair, result becomes next potential pair start
		else:
			# Cross-item combination or single item
			# Could be A B C meaning A + B = C
			if i + 2 < len(items):
				_, item3 = items[i + 2]
				recipe = {
					"address": f"${addr1:06x}",
					"item1": item1,
					"item1_name": get_item_name(item1),
					"item2": item2,
					"item2_name": get_item_name(item2),
					"result": item3,
					"result_name": get_item_name(item3),
					"marker": f"${marker:02x}" if marker else None
				}
				recipes["cross_item"].append(recipe)
				print(f"    RECIPE?: {get_item_name(item1)} + {get_item_name(item2)} = {get_item_name(item3)}")
			i += 1


def decode_known_recipes(rom: bytes) -> list:
	"""Manually decode the known recipes from GameFAQs for verification."""
	# From GameFAQs weapon guide, known recipes:
	known_recipes = [
		# Consumables
		("Smoke", "Smoke", "Cure"),
		
		# Swords
		("Sword 1", "Sword 1", "Sword 2"),
		("Sword 2", "Sword 2", "Sword 3"),
		("Sword 3", "Sword 3", "Sword 4"),
		
		# Axes
		("Axe 1", "Axe 1", "Axe 2"),
		("Axe 2", "Axe 2", "Axe 3"),
		
		# Blades
		("Blade 1", "Blade 1", "Blade 2"),
		("Blade 2", "Blade 2", "Blade 3"),
		("Blade 3", "Blade 3", "Blade 4"),
		
		# Hammers
		("Hammer 1", "Hammer 1", "Hammer 2"),
		("Hammer 2", "Hammer 2", "Hammer 3"),
		("Hammer 3", "Hammer 3", "Celtis 1"),  # Cross-type!
		
		# Celtis
		("Celtis 1", "Celtis 1", "Celtis 2"),
		("Celtis 2", "Celtis 2", "Celtis 3"),
		
		# Punches
		("Punch 1", "Punch 1", "Punch 2"),
		("Punch 2", "Punch 2", "Punch 3"),
		("Punch 3", "Punch 3", "Blow 1"),  # Cross-type!
		
		# Blows
		("Blow 1", "Blow 1", "Blow 2"),
		("Blow 2", "Blow 2", "Blow 3"),
		
		# Shots
		("Shot 1", "Shot 1", "Shot 2"),
		("Shot 2", "Shot 2", "Shot 3"),
		
		# Lasers
		("Laser 1", "Laser 1", "Laser 2"),
		("Laser 2", "Laser 2", "Laser 3"),
		
		# Bombs
		("Bomb 1", "Bomb 1", "Bomb 2"),
		("Bomb 2", "Bomb 2", "Bomb 3"),
		("Bomb 3", "Bomb 3", "Bomb 4"),
		
		# Shields
		("Shield 1", "Shield 1", "Shield 2"),
		("Shield 2", "Shield 2", "Shield 3"),
		("Shield 3", "Shield 3", "Shield 4"),
		("Shield 4", "Shield 4", "Shield 5"),
		
		# Packs
		("Pack 1", "Pack 1", "Pack 2"),
		("Pack 2", "Pack 2", "Pack 3"),
		("Pack 3", "Pack 3", "Pack 4"),
		("Pack 4", "Pack 4", "Pack 5"),
		("Pack 5", "Pack 5", "Pack 6"),
		
		# Boots
		("Boots 1", "Boots 1", "Boots 2"),
		("Boots 2", "Boots 2", "Boots 3"),
		("Boots 3", "Boots 3", "Boots 4"),
		("Boots 4", "Boots 4", "Boots 5"),
		("Boots 5", "Boots 5", "Boots 6"),
	]
	
	return known_recipes


def main():
	print("Robotrek Complete Recipe Table Decoder")
	print("=" * 70)
	
	if not os.path.exists(ROM_PATH):
		print(f"Error: ROM not found at {ROM_PATH}")
		return
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Parse the recipe table
	recipes = parse_recipe_table(rom)
	
	print()
	print("=" * 70)
	print("RECIPE SUMMARY")
	print("=" * 70)
	
	print(f"\nSame-item combinations found: {len(recipes['same_item'])}")
	for r in recipes['same_item']:
		print(f"  {r['item1_name']} + {r['item2_name']} = {r['result_name']}")
	
	print(f"\nCross-item combinations found: {len(recipes['cross_item'])}")
	for r in recipes['cross_item'][:20]:  # Limit to first 20
		print(f"  {r['item1_name']} + {r['item2_name']} = {r['result_name']}")
	if len(recipes['cross_item']) > 20:
		print(f"  ... and {len(recipes['cross_item']) - 20} more")
	
	# Compare with known recipes
	print()
	print("=" * 70)
	print("KNOWN RECIPES (from GameFAQs)")
	print("=" * 70)
	
	known = decode_known_recipes(rom)
	print(f"\nTotal known recipes: {len(known)}")
	for item1, item2, result in known[:15]:
		print(f"  {item1} + {item2} = {result}")
	print(f"  ... and {len(known) - 15} more")
	
	# Save results
	output_data = {
		"table_address": "$01c200",
		"table_size": 512,
		"known_recipes": [
			{"item1": a, "item2": b, "result": c} for a, b, c in known
		],
		"parsed_same_item": recipes["same_item"],
		"parsed_cross_item": recipes["cross_item"][:50],  # Limit
		"notes": [
			"Recipe table starts at $01c200",
			"Uses marker bytes $68-$79 for category indicators",
			"$FF marks section boundaries",
			"Format: Item + Item = Result (same-item pairs upgrade to next tier)",
			"Some cross-type combinations exist (e.g., Hammer 3 + Hammer 3 = Celtis 1)"
		]
	}
	
	output_path = os.path.join(OUTPUT_DIR, "recipes_full.json")
	with open(output_path, 'w') as f:
		json.dump(output_data, f, indent='\t')
	
	print(f"\nSaved to: {output_path}")


if __name__ == "__main__":
	main()
