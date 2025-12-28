#!/usr/bin/env python3
"""
Robotrek Enemy Stats Search

Uses known enemy stats from GameFAQs to locate stat tables in ROM.
Cross-references HP, EXP, Gold values for enemies.
"""

import struct

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"

# Known enemy stats from GameFAQs (approximate)
# Enemy: HP, EXP, Gold
KNOWN_ENEMIES = {
	"Mine": {"hp": 8, "exp": 1, "gold": 1},
	"Turbo": {"hp": 10, "exp": 2, "gold": 3},
	"Mushroom": {"hp": 15, "exp": 3, "gold": 5},
	"Poison": {"hp": 20, "exp": 4, "gold": 7},
	"Spider": {"hp": 25, "exp": 5, "gold": 10},
	"Gel": {"hp": 30, "exp": 6, "gold": 12},
	"Gelgel": {"hp": 50, "exp": 8, "gold": 15},
	"Bosstoad": {"hp": 100, "exp": 15, "gold": 30},
}

# Some early enemies should have small HP values
HP_TARGETS = [8, 10, 15, 20, 25, 30, 50, 100]
EXP_TARGETS = [1, 2, 3, 4, 5, 6, 8, 15]
GOLD_TARGETS = [1, 3, 5, 7, 10, 12, 15, 30]


def search_byte_sequence(rom: bytes, values: list, max_gap: int = 10) -> list:
	"""Search for a sequence of bytes that appear in order with max_gap between them."""
	matches = []
	
	for i in range(len(rom) - len(values) * max_gap):
		found_all = True
		positions = [i]
		current_pos = i
		
		for j, target in enumerate(values):
			if j == 0:
				if rom[i] != target:
					found_all = False
					break
				continue
			
			# Search for next value within max_gap
			found = False
			for offset in range(1, max_gap + 1):
				check_pos = current_pos + offset
				if check_pos >= len(rom):
					break
				if rom[check_pos] == target:
					positions.append(check_pos)
					current_pos = check_pos
					found = True
					break
			
			if not found:
				found_all = False
				break
		
		if found_all:
			matches.append({
				"start": i,
				"positions": positions,
				"stride": positions[1] - positions[0] if len(positions) > 1 else 0
			})
	
	return matches[:20]  # Limit results


def search_word_sequence(rom: bytes, values: list, max_entries: int = 50) -> list:
	"""Search for a sequence of 16-bit words."""
	matches = []
	
	for stride in [2, 4, 6, 8, 10, 12, 14, 16]:
		for i in range(len(rom) - len(values) * stride):
			found_all = True
			for j, target in enumerate(values):
				pos = i + j * stride
				if pos + 2 > len(rom):
					found_all = False
					break
				word = struct.unpack('<H', rom[pos:pos + 2])[0]
				if word != target:
					found_all = False
					break
			
			if found_all:
				matches.append({
					"offset": f"${i:06x}",
					"stride": stride,
					"values": values
				})
	
	return matches[:20]


def search_indexed_table(rom: bytes, values: list, entry_size: int) -> list:
	"""Search for values at fixed offsets within table entries."""
	matches = []
	
	# Try different field offsets within entries
	for field_offset in range(entry_size):
		for i in range(len(rom) - len(values) * entry_size):
			found_all = True
			for j, target in enumerate(values):
				pos = i + j * entry_size + field_offset
				if pos >= len(rom) or rom[pos] != target:
					found_all = False
					break
			
			if found_all:
				matches.append({
					"table_offset": f"${i:06x}",
					"entry_size": entry_size,
					"field_offset": field_offset,
					"values": values
				})
	
	return matches[:20]


def main():
	print("Robotrek Enemy Stats Search")
	print("=" * 60)
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Search for HP sequence (small values in order)
	print("Searching for HP sequence [8, 10, 15, 20, 25, 30, 50, 100]...")
	hp_matches = search_byte_sequence(rom, HP_TARGETS[:5], max_gap=20)
	print(f"  Found {len(hp_matches)} potential matches")
	for m in hp_matches[:5]:
		print(f"    ${m['start']:06x}: stride={m['stride']}")
	
	print()
	
	# Search for EXP sequence
	print("Searching for EXP sequence [1, 2, 3, 4, 5, 6, 8, 15]...")
	exp_matches = search_byte_sequence(rom, EXP_TARGETS[:5], max_gap=20)
	print(f"  Found {len(exp_matches)} potential matches")
	for m in exp_matches[:5]:
		print(f"    ${m['start']:06x}: stride={m['stride']}")
	
	print()
	
	# Search for Gold sequence as 16-bit words
	print("Searching for Gold as 16-bit words [1, 3, 5, 7, 10]...")
	gold_matches = search_word_sequence(rom, GOLD_TARGETS[:5])
	print(f"  Found {len(gold_matches)} potential matches")
	for m in gold_matches[:5]:
		print(f"    {m['offset']}: stride={m['stride']}")
	
	print()
	
	# Try to find indexed tables
	print("Searching for indexed stat tables...")
	for entry_size in [8, 10, 12, 14, 16, 18, 20, 22, 24]:
		matches = search_indexed_table(rom, HP_TARGETS[:4], entry_size)
		if matches:
			print(f"  Entry size {entry_size}: {len(matches)} matches")
			for m in matches[:3]:
				print(f"    {m['table_offset']}: field_offset={m['field_offset']}")
	
	print()
	
	# Special search: Look for sequence "08 ?? 0a ?? 0f ?? 14 ?? 19"
	# (HP values with unknown bytes between)
	print("Searching for alternating HP pattern...")
	pattern_matches = []
	for i in range(len(rom) - 20):
		if rom[i] == 8 and rom[i+2] == 10 and rom[i+4] == 15:
			pattern_matches.append({
				"offset": f"${i:06x}",
				"data": ' '.join(f'{rom[i+j]:02x}' for j in range(12))
			})
	
	print(f"  Found {len(pattern_matches)} potential matches")
	for m in pattern_matches[:10]:
		print(f"    {m['offset']}: {m['data']}")
	
	print()
	
	# Search around enemy names table ($01fdbe)
	print("Checking regions near enemy names table ($01fdbe)...")
	search_regions = [
		(0x01f000, 0x01f200, "Before enemy names ($01f000)"),
		(0x01ff70, 0x020000, "After enemy names ($01ff70)"),
		(0x020000, 0x020200, "Bank $02 start ($020000)"),
		(0x03c000, 0x03c200, "Near actor data ($03c000)"),
		(0x00c000, 0x00c200, "Early bank ($00c000)"),
	]
	
	for start, end, desc in search_regions:
		print(f"\n{desc}:")
		data = rom[start:end]
		
		# Look for small sequential values
		for i in range(min(len(data) - 10, 100)):
			# Check if we have ascending small values
			if all(data[i+j] < 100 for j in range(8)) and data[i] < data[i+4]:
				print(f"  ${start + i:06x}: " + ' '.join(f'{data[i+j]:02x}' for j in range(16)))
				break


if __name__ == "__main__":
	main()
