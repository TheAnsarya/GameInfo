#!/usr/bin/env python3
"""
Robotrek Data Extractor

Extracts enemy names, item names, and other game data from the ROM.
"""

import json
from pathlib import Path


def extract_enemy_names(rom: bytes) -> list[dict]:
	"""Extract enemy names from the ROM."""
	# Enemy names are directly at $01FDBE (null-terminated strings)
	# There are 58 enemies in the game
	names_offset = 0x1FDBE
	
	enemies = []
	
	print(f"Reading enemy names from ${names_offset:06X}...")
	
	current = []
	idx = 0
	i = names_offset
	start_pos = i
	
	while idx < 58 and i < names_offset + 0x400:
		b = rom[i]
		if b == 0:
			if current:
				name = bytes(current).decode('ascii', errors='replace')
				# Skip if name contains control characters (end of valid data)
				if all(32 <= c < 127 for c in current):
					enemies.append({
						"index": idx,
						"offset": f"${start_pos:06X}",
						"name": name,
						"raw": current.copy()
					})
					idx += 1
				else:
					break
				current = []
			start_pos = i + 1
		else:
			current.append(b)
		i += 1
	
	print(f"Found {len(enemies)} enemies")
	return enemies


def extract_item_names_script(rom: bytes) -> list[dict]:
	"""Extract item names from script format ($01E413)."""
	# Item names (script format) at $01E413
	# CC-separated strings
	offset = 0x1E413
	items = []
	
	print(f"Reading item names from ${offset:06X} (script format)...")
	
	current_name = []
	item_idx = 0
	start_offset = offset
	
	i = offset
	while i < len(rom) and item_idx < 100:
		b = rom[i]
		if b == 0xCC:  # Separator
			if current_name:
				name = ''.join(chr(c) if 32 <= c < 127 else f'[{c:02x}]' for c in current_name)
				items.append({
					"index": item_idx,
					"offset": f"${start_offset:06X}",
					"name": name,
					"raw": current_name.copy()
				})
				item_idx += 1
			current_name = []
			start_offset = i + 1
		elif b == 0x00:
			# End of table
			break
		else:
			current_name.append(b)
		i += 1
	
	return items


def main():
	rom_path = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc")
	output_dir = Path(r"c:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted")
	
	print(f"Loading ROM: {rom_path.name}")
	with open(rom_path, "rb") as f:
		rom = f.read()
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Extract enemies
	print("=" * 60)
	print("ENEMY DATA")
	print("=" * 60)
	enemies = extract_enemy_names(rom)
	print(f"\nExtracted {len(enemies)} enemies:")
	for e in enemies[:20]:
		print(f"  {e['index']:02d}: {e['name']}")
	if len(enemies) > 20:
		print(f"  ... and {len(enemies) - 20} more")
	
	# Save to JSON
	output_dir.mkdir(parents=True, exist_ok=True)
	with open(output_dir / "enemies.json", "w") as f:
		json.dump(enemies, f, indent="\t")
	print(f"\nSaved to {output_dir / 'enemies.json'}")
	
	# Extract items
	print()
	print("=" * 60)
	print("ITEM DATA")
	print("=" * 60)
	items = extract_item_names_script(rom)
	print(f"\nExtracted {len(items)} items:")
	for item in items[:20]:
		print(f"  {item['index']:02d}: {item['name']}")
	if len(items) > 20:
		print(f"  ... and {len(items) - 20} more")
	
	with open(output_dir / "items.json", "w") as f:
		json.dump(items, f, indent="\t")
	print(f"\nSaved to {output_dir / 'items.json'}")


if __name__ == "__main__":
	main()
