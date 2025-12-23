#!/usr/bin/env python3
"""Analyze item data structure in Robotrek ROM."""

import struct
import json

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
ITEM_PTR_TABLE = 0x01f748
ITEM_COUNT = 83

def main():
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	# Read item pointer table
	pointers = []
	for i in range(ITEM_COUNT):
		ptr = struct.unpack('<H', rom[ITEM_PTR_TABLE + i*2:ITEM_PTR_TABLE + i*2 + 2])[0]
		pointers.append(ptr)
	
	print("Item Pointer Analysis")
	print("=" * 70)
	print(f"Pointer table at: ${ITEM_PTR_TABLE:06x}")
	print(f"First pointer: ${pointers[0]:04x}")
	print(f"Last pointer: ${pointers[-1]:04x}")
	
	# Calculate pointer differences to find item record size
	diffs = []
	for i in range(len(pointers) - 1):
		diff = pointers[i+1] - pointers[i]
		diffs.append(diff)
	
	# Group by category
	print("\nPointer increments by item index:")
	print("-" * 70)
	
	# Item names from our extraction
	item_names = [
		"",  # 0
		"Smoke", "Cure", "Clean", "Repair", "Big Bomb",  # 1-5
		"",  # 6 Weather?
		"",  # 7
		"",  # 8
		"Sword 1", "Sword 2", "Sword 3", "Sword 4",  # 9-12 (indices might be off)
		"Axe 1", "Axe 2", "Axe 3",  # 13-15
	]
	
	for i in range(min(40, len(pointers))):
		ptr = pointers[i]
		diff = diffs[i] if i < len(diffs) else 0
		
		# Convert pointer to file offset (bank $03)
		file_offset = 0x010000 + (ptr & 0x7fff)
		
		# Read name at that location
		name_bytes = rom[file_offset:file_offset+12]
		name = ""
		for b in name_bytes:
			if b == 0:
				break
			if 32 <= b < 127:
				name += chr(b)
		
		print(f"[{i:3d}] ptr=${ptr:04x} file=${file_offset:06x} size={diff:3d}  {name}")
	
	print()
	print("=" * 70)
	print("Looking for stat data...")
	print("=" * 70)
	
	# Check if there's a separate stat table
	# Look for patterns at known locations
	
	# The item names appear to be in bank $03 ($01f748 = bank $03)
	# Let's see what's BEFORE the pointer table
	print("\nData before pointer table ($01f700-$01f748):")
	for offset in range(0x01f700, 0x01f748, 16):
		data = rom[offset:offset+16]
		hex_str = ' '.join(f'{b:02x}' for b in data)
		print(f"${offset:06x}: {hex_str}")
	
	# Check if the 83 items have stat data somewhere
	# Each item might have: ID, Type, ATK, DEF, Speed, Cost (2 bytes)
	# That would be 6-8 bytes per item = 500-600 bytes total
	
	# Search for a region with 83-entry table with small byte values
	print("\nSearching for potential stat tables...")
	
	# Look for patterns near item data
	# Check $01f000 region
	print("\nData at $01f000-$01f100:")
	for offset in range(0x01f000, 0x01f100, 16):
		data = rom[offset:offset+16]
		hex_str = ' '.join(f'{b:02x}' for b in data)
		print(f"${offset:06x}: {hex_str}")
	
	# Check $01f600 region
	print("\nData at $01f600-$01f700:")
	for offset in range(0x01f600, 0x01f700, 16):
		data = rom[offset:offset+16]
		hex_str = ' '.join(f'{b:02x}' for b in data)
		print(f"${offset:06x}: {hex_str}")

if __name__ == "__main__":
	main()
