#!/usr/bin/env python3
"""
Analyze Robotrek ROM for enemy stat tables at addresses found by search script.
"""

import os

ROM_PATH = r'C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc'

# Known enemy names from extraction
enemy_names = [
	'Mine', 'Turbo', 'Mushroom', 'Poison', 'Spider', 'Spider', 'Gel', 'Gelgel',
	'Bosstoad', 'Rushbird', 'Quickbird', 'Mole', 'Powermole', 'Tackler', 'Plasmoke', 'Elesmoke',
	'Monk', 'Mummy', 'Franken', 'Ho Ho', 'Gator', 'Gunrobot', 'CannonX', 'Biolion',
	'Shell', 'Urchin', 'Luckstar', 'Angler', 'Octopus', 'Pumpy', 'Bumpy', 'Faceman',
	'Bigface', 'Redpixy', 'Whitepixy', 'Goldpixy', 'Knight', 'Master', 'Gagarian', 'Ninja',
	'Beeper', 'Cmdr.', 'Masker', 'Beret', 'Meta Crab', 'Smallcrab', 'Mamurana', 'Big Eye',
	'Blacktank', 'Gateau', 'Soldier', 'Gateau', 'De Rose', 'Papamecha', 'Bugbug', 'Cmdr.'
]

def main():
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()

	print('=== Analyzing ROM at potential stat table locations ===\n')

	# Try $030299 directly as file offset (found by search with stride 6)
	offset1 = 0x030299
	if offset1 + 400 < len(rom):
		print(f'File offset $030299 (stride 6):')
		data = rom[offset1:offset1+60]
		for i in range(0, 60, 6):
			vals = data[i:i+6]
			print(f'  Entry {i//6}: {[hex(b) for b in vals]} ({list(vals)})')
		print()

	# Also try near enemy names at $01fdbe
	# After 56 enemies, check what follows
	enemy_end = 0x01ff67  # After last name
	print(f'After enemy names (file ${enemy_end:05x}):')
	data = rom[enemy_end:enemy_end+120]
	for i in range(0, 120, 6):
		vals = data[i:i+6]
		print(f'  @${enemy_end+i:05x}: {[hex(b) for b in vals]} ({list(vals)})')

	print()

	# Try $08ea89 (stride 4) - also found in search
	offset2 = 0x08ea89
	if offset2 + 240 < len(rom):
		print(f'File offset $08ea89 (stride 4):')
		data = rom[offset2:offset2+60]
		for i in range(0, 60, 4):
			vals = data[i:i+4]
			hp = vals[0] | (vals[1] << 8) if len(vals) >= 2 else vals[0]
			print(f'  Entry {i//4}: HP={hp}, bytes={[hex(b) for b in vals]}')

	print()

	# Check around $125c59 (alternating HP pattern found)
	offset3 = 0x125c59
	if offset3 + 240 < len(rom):
		print(f'File offset $125c59 (alternating):')
		data = rom[offset3:offset3+80]
		for i in range(0, 80, 8):
			vals = data[i:i+8]
			print(f'  @${offset3+i:05x}: {[hex(b) for b in vals]}')

	print()

	# Search for 56-entry tables (number of enemies)
	# Look for pointer tables with 56 entries
	print('Searching for 56-entry pointer tables...')
	for base in range(0, len(rom) - 112, 2):
		# Check if this could be a 56 word pointer table
		ptrs = []
		valid = True
		for i in range(56):
			ptr = rom[base + i*2] | (rom[base + i*2 + 1] << 8)
			# Pointers should be reasonable addresses
			if ptr < 0x8000 or ptr > 0xFFFF:
				valid = False
				break
			ptrs.append(ptr)

		if valid and len(set(ptrs)) > 20:  # At least 20 unique values
			# Check if pointers are ascending (common for string tables)
			ascending = all(ptrs[i] <= ptrs[i+1] for i in range(len(ptrs)-1))
			if ascending and ptrs[0] > 0xc000:  # Reasonable SNES address
				print(f'  Potential pointer table at ${base:05x}: first={hex(ptrs[0])}, last={hex(ptrs[-1])}')

	print('\nDone.')

if __name__ == '__main__':
	main()
