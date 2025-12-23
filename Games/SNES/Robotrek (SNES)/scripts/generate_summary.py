#!/usr/bin/env python3
"""
Robotrek ROM Summary Generator

Generates a comprehensive summary of all discovered ROM data.
Useful for documentation and quick reference.
"""

import json
import os
from datetime import datetime

EXTRACTED_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"
OUTPUT_PATH = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted\ROM_SUMMARY.md"


def load_json(filename: str) -> dict:
	"""Load a JSON file from the extracted directory."""
	path = os.path.join(EXTRACTED_DIR, filename)
	if os.path.exists(path):
		with open(path, 'r') as f:
			return json.load(f)
	return None


def main():
	print("Robotrek ROM Summary Generator")
	print("=" * 60)
	
	# Load all extracted data
	complete_data = load_json("robotrek_complete_data.json")
	items = load_json("items_extracted.json")
	enemies = load_json("enemies_extracted.json")
	map_data = load_json("map_data_analysis.json")
	palette_data = load_json("palette_analysis.json")
	sprite_data = load_json("sprite_analysis.json")
	actor_data = load_json("actor_data_analysis.json")
	
	# Generate summary
	lines = []
	lines.append("# Robotrek (SNES) - ROM Data Summary")
	lines.append("")
	lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
	lines.append("")
	lines.append("## ROM Information")
	lines.append("")
	lines.append("| Property | Value |")
	lines.append("|----------|-------|")
	lines.append("| ROM Size | 1,572,864 bytes (1.5 MB) |")
	lines.append("| Mapper | HiROM + FastROM |")
	lines.append("| Internal Name | ROBOTREK 1 USA |")
	lines.append("| CRC32 | 7AD4AADC |")
	lines.append("| Compression | Quintet LZSS |")
	lines.append("")
	
	# Items
	if items:
		item_list = items.get('items', items) if isinstance(items, dict) else items
		lines.append("## Items")
		lines.append("")
		lines.append(f"**Total Items:** {len(item_list)}")
		lines.append("")
		lines.append("| Address | Name |")
		lines.append("|---------|------|")
		for item in item_list[:20]:
			addr = item.get('address', item.get('name_address', 'N/A'))
			lines.append(f"| {addr} | {item['name']} |")
		if len(item_list) > 20:
			lines.append(f"| ... | ({len(item_list) - 20} more) |")
		lines.append("")
	
	# Enemies
	if enemies:
		enemy_list = enemies.get('enemies', enemies) if isinstance(enemies, dict) else enemies
		lines.append("## Enemies")
		lines.append("")
		lines.append(f"**Total Enemies:** {len(enemy_list)}")
		lines.append("")
		lines.append("| Address | Name |")
		lines.append("|---------|------|")
		for enemy in enemy_list[:20]:
			addr = enemy.get('address', enemy.get('name_address', 'N/A'))
			lines.append(f"| {addr} | {enemy['name']} |")
		if len(enemy_list) > 20:
			lines.append(f"| ... | ({len(enemy_list) - 20} more) |")
		lines.append("")
	
	# Recipes
	if complete_data and 'recipes' in complete_data:
		recipes = complete_data['recipes']
		lines.append("## Recipes/Combinations")
		lines.append("")
		lines.append(f"**Total Recipes:** {len(recipes)}")
		lines.append("")
		lines.append("| Recipe |")
		lines.append("|--------|")
		for r in recipes[:15]:
			lines.append(f"| {r['ingredient1_name']} + {r['ingredient2_name']} = {r['result_name']} |")
		if len(recipes) > 15:
			lines.append(f"| ({len(recipes) - 15} more) |")
		lines.append("")
	
	# Map Data
	if map_data:
		lines.append("## Map Data")
		lines.append("")
		lines.append("### Tileset Regions")
		lines.append("")
		lines.append("| Offset | Size | Description | Decomp Size |")
		lines.append("|--------|------|-------------|-------------|")
		for ts in map_data.get('tileset_regions', []):
			decomp = ts.get('potential_decomp_size_16', 'N/A')
			lines.append(f"| {ts['offset']} | {ts['size']} | {ts['description']} | {decomp} |")
		lines.append("")
	
	# Palettes
	if palette_data:
		lines.append("## Palettes")
		lines.append("")
		lines.append("### Known Palette Regions")
		lines.append("")
		lines.append("| Region | Palettes | Description |")
		lines.append("|--------|----------|-------------|")
		for pal in palette_data.get('known_palette_regions', []):
			lines.append(f"| {pal['region']} | {pal['num_palettes']} | {pal['description']} |")
		lines.append("")
		
		# Discovered groups
		groups = palette_data.get('palette_groups', [])
		if groups:
			lines.append("### Discovered Palette Groups")
			lines.append("")
			lines.append("| Start | End | Count |")
			lines.append("|-------|-----|-------|")
			for g in groups:
				lines.append(f"| {g['start']} | {g['end']} | {g['count']} |")
			lines.append("")
	
	# Graphics
	if sprite_data:
		lines.append("## Graphics")
		lines.append("")
		lines.append("### Extracted Graphics")
		lines.append("")
		if 'font_info' in sprite_data:
			f = sprite_data['font_info']
			lines.append(f"- **Font:** {f['region']} - {f['num_tiles']} tiles ({f['format']})")
		if 'menu_info' in sprite_data:
			m = sprite_data['menu_info']
			lines.append(f"- **Menu:** {m['region']} - {m['num_tiles']} tiles ({m['format']})")
		lines.append("")
	
	# Actor Data
	if actor_data:
		lines.append("## Actor/Entity Data")
		lines.append("")
		lines.append(f"**Pointer Table:** $038000")
		lines.append("")
		lines.append("Actor format: 22-byte entries with 3 animation frames")
		lines.append("")
		
		# Count unique graphics
		gfx_ptrs = set()
		anim_ptrs = set()
		for actor in actor_data.get('actors', []):
			for frame in actor.get('frames', []):
				gfx_ptrs.add(frame.get('graphics_ptr'))
				anim_ptrs.add(frame.get('animation_ptr'))
		
		lines.append(f"- Unique graphics pointers: {len(gfx_ptrs)}")
		lines.append(f"- Unique animation pointers: {len(anim_ptrs)}")
		lines.append("")
	
	# Key Addresses
	lines.append("## Key Data Addresses")
	lines.append("")
	lines.append("| Address | Description |")
	lines.append("|---------|-------------|")
	lines.append("| $01c200 | Recipe/combination table |")
	lines.append("| $01e413 | Item names (CC-separated) |")
	lines.append("| $01f748 | Item name pointer table |")
	lines.append("| $01fd00 | Enemy name pointer table |")
	lines.append("| $01fdbe | Enemy names (null-terminated) |")
	lines.append("| $038000 | Actor/entity pointer table |")
	lines.append("| $080000 | Font graphics (2BPP) |")
	lines.append("| $0d8000 | Map metadata |")
	lines.append("| $0d9310 | Menu graphics (4BPP) |")
	lines.append("")
	
	# Extracted Files
	lines.append("## Extracted Files")
	lines.append("")
	
	# List all files in extracted directory
	if os.path.exists(EXTRACTED_DIR):
		files = sorted(os.listdir(EXTRACTED_DIR))
		for f in files:
			path = os.path.join(EXTRACTED_DIR, f)
			size = os.path.getsize(path)
			lines.append(f"- `{f}` ({size:,} bytes)")
	lines.append("")
	
	# Write output
	with open(OUTPUT_PATH, 'w') as f:
		f.write('\n'.join(lines))
	
	print(f"Generated summary: {OUTPUT_PATH}")
	print(f"Total lines: {len(lines)}")


if __name__ == "__main__":
	main()
