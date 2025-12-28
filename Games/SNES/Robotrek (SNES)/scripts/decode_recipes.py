#!/usr/bin/env python3
"""Decode Robotrek combination recipe table."""

import json
import struct

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Item indices (from our extraction)
ITEM_NAMES = {
	0: "Empty", 1: "Smoke", 2: "Cure", 3: "Clean", 4: "Repair",
	5: "Sword 1", 6: "Sword 2", 7: "Sword 3", 8: "Sword 4",
	9: "Axe 1", 10: "Axe 2", 11: "Axe 3",
	12: "Blade 1", 13: "Blade 2", 14: "Blade 3", 15: "Blade 4",
	16: "Hammer 1", 17: "Hammer 2", 18: "Hammer 3",
	19: "Celtis 1", 20: "Celtis 2", 21: "Celtis 3",
	22: "Punch 1", 23: "Punch 2", 24: "Punch 3",
	25: "Blow 1", 26: "Blow 2", 27: "Blow 3",
	28: "Shot 1", 29: "Shot 2", 30: "Shot 3",
	31: "Laser 1", 32: "Laser 2", 33: "Laser 3",
	34: "Bomb 1", 35: "Bomb 2", 36: "Bomb 3", 37: "Bomb 4",
	38: "Shield 1", 39: "Shield 2", 40: "Shield 3", 41: "Shield 4", 42: "Shield 5",
	43: "Pack 1", 44: "Pack 2", 45: "Pack 3", 46: "Pack 4", 47: "Pack 5", 48: "Pack 6",
	49: "Boots 1", 50: "Boots 2", 51: "Boots 3", 52: "Boots 4", 53: "Boots 5", 54: "Boots 6",
}

# Recipe table location (found earlier)
RECIPE_TABLE_START = 0x01C2C6
RECIPE_TABLE_SIZE = 0x200  # Estimate

def get_item_name(idx):
	"""Get item name from index."""
	return ITEM_NAMES.get(idx, f"Item_{idx:02x}")

def main():
	with open(ROM_PATH, 'rb') as f:
		f.seek(RECIPE_TABLE_START)
		recipe_data = f.read(RECIPE_TABLE_SIZE)
	
	print("Robotrek Combination Recipe Table Analysis")
	print("=" * 70)
	print(f"Table location: ${RECIPE_TABLE_START:06x}")
	print()
	
	# Dump raw hex with interpretation
	print("Raw data analysis:")
	print("-" * 70)
	
	# Based on GameFAQs, the known recipes are:
	# Same weapon + Same weapon = Next tier weapon
	# E.g., Sword 1 + Sword 1 = Sword 2
	
	# The format appears to be:
	# [item] [item] [result] - when item + item → result
	# OR more compactly: [a] [a] [b] [b] [c] means a+a=b, b+b=c
	
	# Let's try: pairs followed by implied result
	# 01 01 02 → Smoke + Smoke = Cure
	# 05 05 06 06 07 → Sword1+Sword1=Sword2, Sword2+Sword2=Sword3
	
	recipes = []
	
	# Parse first section (consumables?)
	print("Decoding recipes...")
	print()
	
	i = 0
	while i < min(100, len(recipe_data)):
		# Print context
		context = ' '.join(f'{recipe_data[j]:02x}' for j in range(i, min(i+16, len(recipe_data))))
		
		byte = recipe_data[i]
		
		# Skip separators and markers
		if byte == 0xff:
			print(f"  ${RECIPE_TABLE_START+i:06x}: [FF] Section end")
			i += 1
			continue
			
		if byte >= 0x65:  # Marker range
			print(f"  ${RECIPE_TABLE_START+i:06x}: [${byte:02x}] Marker/control byte")
			i += 1
			continue
		
		# Try to decode as recipe
		# Format: [item1] [item1] [result] where item1+item1=result
		if i + 2 < len(recipe_data):
			item1 = byte
			item2 = recipe_data[i + 1]
			result = recipe_data[i + 2]
			
			# Check if this is a same-item combination
			if item1 == item2 and item1 < 0x60 and result < 0x60:
				recipe = f"{get_item_name(item1)} + {get_item_name(item2)} = {get_item_name(result)}"
				print(f"  ${RECIPE_TABLE_START+i:06x}: {recipe}")
				recipes.append({
					"address": f"${RECIPE_TABLE_START+i:06x}",
					"item1": item1,
					"item2": item2,
					"result": result,
					"description": recipe
				})
				i += 2  # Move to next pair (result becomes item1 of next pair if same)
				continue
		
		# Unknown byte, skip
		if byte < 0x60:
			print(f"  ${RECIPE_TABLE_START+i:06x}: [${byte:02x}] = {get_item_name(byte)} (unpaired)")
		i += 1
	
	print()
	print(f"Total recipes decoded: {len(recipes)}")
	print()
	
	# Print summary table
	print("Recipe Summary:")
	print("-" * 70)
	for r in recipes:
		print(f"  {r['description']}")
	
	# Save to JSON
	output_path = f"{OUTPUT_DIR}/recipes.json"
	with open(output_path, 'w') as f:
		json.dump({
			"table_address": f"${RECIPE_TABLE_START:06x}",
			"recipe_count": len(recipes),
			"format_notes": "Same-item combinations: Item + Item = Next tier item",
			"recipes": recipes
		}, f, indent='\t')
	print(f"\nSaved to: {output_path}")

if __name__ == "__main__":
	main()
