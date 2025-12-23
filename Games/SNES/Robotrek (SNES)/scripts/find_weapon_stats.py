#!/usr/bin/env python3
"""Search for weapon stat patterns in Robotrek ROM."""

import struct

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"

def search_pattern(rom, pattern, description):
	"""Search for a byte pattern in ROM."""
	print(f"\n{description}")
	print(f"Pattern: {' '.join(f'{b:02x}' for b in pattern)}")
	
	pos = 0
	count = 0
	while True:
		pos = rom.find(pattern, pos)
		if pos == -1:
			break
		print(f"  Found at file offset: ${pos:06x}")
		# Show context
		start = max(0, pos - 8)
		end = min(len(rom), pos + len(pattern) + 8)
		context = rom[start:end]
		print(f"    Context: {' '.join(f'{b:02x}' for b in context)}")
		count += 1
		pos += 1
	
	if count == 0:
		print("  Not found")
	return count

def main():
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	
	# Weapon base attack values from GameFAQs
	# Swords: 5, 10, 20, 40
	# Axes: 10, 20, 40
	# Hammers: 8, 10, 24
	# Punches: 12, 24, 48
	# Shots: 4, 10, 20
	# Lasers: 18, 16, 32
	# Bombs: 18, 15, 50, 110
	
	# Try Sword sequence
	search_pattern(rom, bytes([5, 10, 20, 40]), "Sword base ATK: 5, 10, 20, 40")
	
	# Try Axe sequence
	search_pattern(rom, bytes([10, 20, 40]), "Axe base ATK: 10, 20, 40")
	
	# Try Punch sequence
	search_pattern(rom, bytes([12, 24, 48]), "Punch base ATK: 12, 24, 48")
	
	# Try cost sequence (Sword costs: 200, 400, 1000, 2000 as 16-bit LE)
	cost_pattern = struct.pack('<HHHH', 200, 400, 1000, 2000)
	search_pattern(rom, cost_pattern, "Sword costs as 16-bit LE")
	
	# Try costs as single values
	cost_pattern = struct.pack('<H', 200)
	pos = rom.find(cost_pattern)
	print(f"\n200 GP (0x00c8) first occurrence: ${pos:06x}")
	
	# Try Shot base ATK: 4, 10, 20
	search_pattern(rom, bytes([4, 10, 20]), "Shot base ATK: 4, 10, 20")
	
	# Search for item names near stat data
	# Item pointer table is at $01f748
	# Let's check if there's stat data following the names
	print("\n" + "=" * 60)
	print("Checking region after item name table...")
	print("=" * 60)
	
	# Read region $01fb00 - $01fc00
	print("\nData at $01fb00:")
	for offset in range(0x01fb00, 0x01fc00, 32):
		data = rom[offset:offset+32]
		hex_str = ' '.join(f'{b:02x}' for b in data)
		ascii_str = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data)
		print(f"${offset:06x}: {ascii_str}")

if __name__ == "__main__":
	main()
