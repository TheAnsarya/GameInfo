#!/usr/bin/env python3
"""Analyze Robotrek enemy data and search for stat tables in ROM."""

import json
import struct

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
DATA_PATH = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted\robotrek_data.json"

def main():
	# Load GameFAQs enemy data
	with open(DATA_PATH) as f:
		data = json.load(f)
	
	enemies = data.get('enemies', [])
	print(f"Loaded {len(enemies)} enemies from GameFAQs data")
	print()
	
	# Show first 15 enemies with stats
	print("First 15 enemies with stats:")
	print("-" * 60)
	for i, enemy in enumerate(enemies[:15]):
		name = enemy.get('name', 'Unknown')
		hp = enemy.get('hp', '?')
		exp = enemy.get('exp', '?')
		gold = enemy.get('gold', '?')
		print(f"{i:3d}. {name:15s} HP={hp:6s} EXP={exp:6s} Gold={gold}")
	
	# Extract HP values to search for
	print()
	print("Searching ROM for enemy HP patterns...")
	print("-" * 60)
	
	# Get numerical HP values
	hp_values = []
	for enemy in enemies[:20]:
		hp_str = enemy.get('hp', '')
		if hp_str and hp_str.isdigit():
			hp_values.append((enemy['name'], int(hp_str)))
	
	print("HP values to search for:")
	for name, hp in hp_values[:10]:
		print(f"  {name}: {hp} (${hp:04x})")
	
	# Load ROM
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	# Search for sequences of consecutive enemy HPs
	if len(hp_values) >= 5:
		# Look for Mine HP, Turbo HP, Mushroom HP etc. as consecutive 16-bit LE values
		search_pattern = b''
		for name, hp in hp_values[:5]:
			search_pattern += struct.pack('<H', hp)
		
		print(f"\nSearching for pattern: {' '.join(f'{b:02x}' for b in search_pattern)}")
		
		pos = rom.find(search_pattern)
		if pos != -1:
			print(f"FOUND at file offset ${pos:06x}!")
		else:
			print("Pattern not found as 16-bit LE values")
			
			# Try 8-bit values
			search_pattern = bytes(hp for _, hp in hp_values[:5] if hp < 256)
			if search_pattern:
				print(f"\nTrying 8-bit pattern: {' '.join(f'{b:02x}' for b in search_pattern)}")
				pos = rom.find(search_pattern)
				if pos != -1:
					print(f"FOUND at file offset ${pos:06x}!")
				else:
					print("Pattern not found as 8-bit values")
	
	# Try searching for individual unique HP values
	print()
	print("Searching for individual HP values:")
	for name, hp in hp_values[:8]:
		if hp > 255:  # Only 16-bit values
			pattern = struct.pack('<H', hp)
			count = rom.count(pattern)
			print(f"  {name} HP={hp}: {count} occurrences")

if __name__ == "__main__":
	main()
