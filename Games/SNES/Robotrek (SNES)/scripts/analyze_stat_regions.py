#!/usr/bin/env python3
"""
Detailed analysis of potential stat tables found in Robotrek ROM.

Focus areas:
- $01c200 region (near recipe table)
- $01b100 region (has structured data)
- $018200 region (pointer table area)
"""

import struct
import os

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"

def hex_dump(data: bytes, offset: int, bytes_per_line: int = 16) -> str:
	"""Create a hex dump with ASCII."""
	lines = []
	for i in range(0, len(data), bytes_per_line):
		chunk = data[i:i + bytes_per_line]
		hex_part = ' '.join(f'{b:02x}' for b in chunk)
		ascii_part = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
		lines.append(f"${offset + i:06x}: {hex_part:<{bytes_per_line * 3}}  {ascii_part}")
	return '\n'.join(lines)


def analyze_region_01c200(rom: bytes):
	"""Analyze the $01c200 region in detail."""
	print("\n" + "="*70)
	print("Analysis of $01c200 region (near recipe table)")
	print("="*70)
	
	# Dump from $01c200 to $01c400
	start = 0x01c200
	end = 0x01c400
	
	print(f"\nHex dump ${start:06x}-${end:06x}:")
	print(hex_dump(rom[start:end], start))
	
	# Look for item IDs (5-54 are valid items based on item table)
	print("\n\nLooking for item ID patterns...")
	
	# The recipe table at $01c2c6 uses item IDs
	# Let's see if there's a mapping or stat table nearby
	
	# From $01c2c6, we know recipes use bytes like:
	# 05 = Sword 1, 06 = Sword 2, etc.
	
	# Let's examine what's between $01c200 and $01c2c6
	print(f"\n\nData from $01c200 to $01c2c6:")
	region = rom[0x01c200:0x01c2c6]
	
	# Try parsing as different record sizes
	for rec_size in [6, 8, 10, 12]:
		print(f"\n  As {rec_size}-byte records:")
		for i in range(min(10, len(region) // rec_size)):
			rec = region[i * rec_size:(i + 1) * rec_size]
			hex_str = ' '.join(f'{b:02x}' for b in rec)
			print(f"    [{i:2d}]: {hex_str}")


def analyze_region_01b100(rom: bytes):
	"""Analyze the $01b100 region."""
	print("\n" + "="*70)
	print("Analysis of $01b100 region")
	print("="*70)
	
	start = 0x01b000
	end = 0x01b200
	
	print(f"\nHex dump ${start:06x}-${end:06x}:")
	print(hex_dump(rom[start:end], start))
	
	# Parse as 16-byte records
	print("\n\nAs 16-byte records from $01b100:")
	region = rom[0x01b100:0x01b200]
	for i in range(min(16, len(region) // 16)):
		rec = region[i * 16:(i + 1) * 16]
		hex_str = ' '.join(f'{b:02x}' for b in rec)
		
		# Try interpreting fields
		# Bytes 0-1: First value
		# Bytes 2-3: Second value
		# etc.
		v0, v1 = rec[0], rec[1]
		v2, v3 = rec[2], rec[3]
		
		print(f"    [{i:2d}]: {hex_str}")


def analyze_pointer_region_018570(rom: bytes):
	"""Analyze the pointer table at $018570."""
	print("\n" + "="*70)
	print("Analysis of pointer tables at $018570-$0185e0")
	print("="*70)
	
	# This region had consistent 19-byte record pointers
	# Let's see what they point to
	
	start = 0x018570
	print(f"\nPointer table at ${start:06x}:")
	
	# Read first 20 pointers
	ptrs = []
	for i in range(20):
		ptr = struct.unpack('<H', rom[start + i*2:start + i*2 + 2])[0]
		ptrs.append(ptr)
		print(f"  [{i:2d}]: ${ptr:04x}")
	
	# These are probably bank-local pointers
	# For bank $01, add $01 to get file offset
	print("\n\nIf these are bank $01 local pointers:")
	for i, ptr in enumerate(ptrs[:10]):
		if ptr >= 0x8000:
			# LoROM: bank $01 starts at file $008000
			# But this is HiROM, so different mapping
			# HiROM bank $01 maps to file $010000
			file_addr = (ptr & 0x7FFF) + 0x018000  # Assuming bank $03
			print(f"  [{i:2d}]: ${ptr:04x} -> file ${file_addr:06x}")
			if file_addr < len(rom):
				chunk = rom[file_addr:file_addr + 20]
				hex_str = ' '.join(f'{b:02x}' for b in chunk)
				print(f"        Data: {hex_str}")


def find_enemy_name_pointers(rom: bytes):
	"""Analyze the enemy name pointer table at $01fcfc."""
	print("\n" + "="*70)
	print("Analysis of enemy name pointer table")
	print("="*70)
	
	# From earlier analysis, enemy name pointers are at $01fcf8
	# Let's verify and understand the structure
	
	ptr_table = 0x01fcf8
	name_area_start = 0x01fdb4
	
	print(f"\nPointer table at ${ptr_table:06x}:")
	print(f"Name strings start around ${name_area_start:06x}")
	
	# Dump the pointer table
	print("\n  Pointers (16-bit LE):")
	for i in range(60):
		ptr = struct.unpack('<H', rom[ptr_table + i*2:ptr_table + i*2 + 2])[0]
		# These might be bank-relative or absolute
		# Let's calculate what they'd point to
		
		# If they're $c3xxxx SNES addresses, the file offset would be different
		# For HiROM, SNES $c3fxxx maps to file $01fxxx
		file_offset = 0x010000 + (ptr & 0xFFFF) if ptr >= 0xF000 else ptr
		
		name = ""
		if 0 <= file_offset < len(rom):
			# Read null-terminated string
			end = rom.find(b'\x00', file_offset, file_offset + 20)
			if end != -1:
				name = rom[file_offset:end].decode('ascii', errors='replace')
		
		if i < 10 or name:
			print(f"    [{i:2d}]: ptr=${ptr:04x} -> file ${file_offset:06x} = '{name}'")


def search_for_battle_data(rom: bytes):
	"""Search for battle-related data tables."""
	print("\n" + "="*70)
	print("Searching for battle/encounter data")
	print("="*70)
	
	# In many RPGs, battle data is stored with:
	# - Enemy formation tables
	# - Encounter rate tables
	# - Battle background IDs
	
	# Let's look for patterns that could be enemy formations
	# (lists of enemy IDs, where each formation has 1-4 enemies)
	
	candidates = []
	
	# Search for sequences that look like enemy ID lists
	# Enemy IDs are 0-57 (58 enemies total)
	
	for offset in range(0x010000, 0x0c0000, 0x100):
		chunk = rom[offset:offset + 256]
		
		# Count how many bytes are in valid enemy ID range
		valid_count = sum(1 for b in chunk if b < 60)
		
		# If a region has many valid enemy IDs, it might be formation data
		if valid_count >= 200:  # 80% valid
			candidates.append({
				"offset": offset,
				"valid_count": valid_count
			})
	
	print(f"\nFound {len(candidates)} regions with high enemy ID density:")
	for c in candidates[:10]:
		offset = c["offset"]
		print(f"\n  ${offset:06x}:")
		chunk = rom[offset:offset + 64]
		hex_str = ' '.join(f'{b:02x}' for b in chunk)
		print(f"    {hex_str[:96]}...")


def examine_item_stat_area(rom: bytes):
	"""Look for item stats near the item name table."""
	print("\n" + "="*70)
	print("Searching for item stats before/after item name pointers")
	print("="*70)
	
	# Item name pointer table at $01F748
	# Let's look at data BEFORE this that could be item stats
	
	# From Weapons.wikitext, we know:
	# - Sword 1 has 5 ATK at level 1
	# - Sword 2 has 10 ATK at level 1
	# - Sword 3 has 20 ATK at level 1
	# - Sword 4 has 40 ATK at level 1
	
	# These are item IDs 5, 6, 7, 8 in the item table
	# Let's search for the sequence 5, 10, 20, 40 nearby
	
	search_region = rom[0x01f000:0x01f800]
	
	# Search for various representations
	patterns = [
		("5,10,20,40 as bytes", bytes([5, 10, 20, 40])),
		("5,10,20,40 with gaps", None),  # Will search manually
		("05,0a,14,28 hex", bytes([0x05, 0x0a, 0x14, 0x28])),
	]
	
	print("\nSearching for sword ATK pattern (5, 10, 20, 40):")
	
	# Direct byte search
	for name, pattern in patterns:
		if pattern:
			idx = search_region.find(pattern)
			if idx != -1:
				file_offset = 0x01f000 + idx
				print(f"  FOUND {name} at ${file_offset:06x}")
				chunk = rom[file_offset:file_offset + 32]
				print(f"    Context: {' '.join(f'{b:02x}' for b in chunk)}")
	
	# Search with stride (values might be in records)
	print("\nSearching with different strides:")
	for stride in [2, 4, 6, 8, 10, 12, 16]:
		for offset in range(len(search_region) - stride * 4):
			values = [search_region[offset + i * stride] for i in range(4)]
			if values == [5, 10, 20, 40]:
				file_offset = 0x01f000 + offset
				print(f"  FOUND with stride {stride} at ${file_offset:06x}")
				chunk = rom[file_offset:file_offset + stride * 8]
				print(f"    Context: {' '.join(f'{b:02x}' for b in chunk)}")


def main():
	print("Robotrek Detailed Region Analysis")
	print("="*70)
	print(f"ROM: {ROM_PATH}")
	print()
	
	# Load ROM
	if not os.path.exists(ROM_PATH):
		print(f"Error: ROM not found at {ROM_PATH}")
		return
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	
	# Run analyses
	analyze_region_01c200(rom)
	analyze_region_01b100(rom)
	# analyze_pointer_region_018570(rom)  # Skip for now
	find_enemy_name_pointers(rom)
	examine_item_stat_area(rom)
	search_for_battle_data(rom)
	
	print("\n" + "="*70)
	print("Analysis complete")
	print("="*70)


if __name__ == "__main__":
	main()
