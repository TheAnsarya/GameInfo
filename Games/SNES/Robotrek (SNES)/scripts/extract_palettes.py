#!/usr/bin/env python3
"""
Robotrek Palette Extractor

Extracts and analyzes palette data from the ROM.
SNES palettes are 15-bit RGB (BBBBBGGGGGRRRRRb in little-endian).
"""

import struct
import json
import os
from PIL import Image

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Known palette locations from ROM analysis
KNOWN_PALETTES = [
	(0x018845, 0x018c05, "Palettes 1"),
	(0x05de10, 0x05e7ff, "Palettes 2 (Robot colors?)"),
	(0x08fe00, 0x08ffff, "Palettes 3"),
]


def snes_to_rgb(color_word: int) -> tuple:
	"""Convert SNES 15-bit color to RGB tuple."""
	r = (color_word & 0x1f) << 3
	g = ((color_word >> 5) & 0x1f) << 3
	b = ((color_word >> 10) & 0x1f) << 3
	return (r, g, b)


def extract_palette(rom: bytes, start: int, num_colors: int = 16) -> list:
	"""Extract a 16-color palette from ROM."""
	colors = []
	for i in range(num_colors):
		offset = start + i * 2
		if offset + 2 <= len(rom):
			word = struct.unpack('<H', rom[offset:offset + 2])[0]
			colors.append(snes_to_rgb(word))
	return colors


def create_palette_image(palette: list, cell_size: int = 16) -> Image.Image:
	"""Create a visual image of a palette."""
	num_colors = len(palette)
	cols = 16
	rows = (num_colors + cols - 1) // cols
	
	img = Image.new('RGB', (cols * cell_size, rows * cell_size), (0, 0, 0))
	
	for i, color in enumerate(palette):
		x = (i % cols) * cell_size
		y = (i // cols) * cell_size
		for py in range(cell_size):
			for px in range(cell_size):
				img.putpixel((x + px, y + py), color)
	
	return img


def analyze_palette_region(rom: bytes, start: int, end: int) -> dict:
	"""Analyze a region for palette data."""
	size = end - start
	num_palettes = size // 32  # 16 colors * 2 bytes each
	
	palettes = []
	for i in range(num_palettes):
		offset = start + i * 32
		palette = extract_palette(rom, offset)
		
		# Check if this looks like a real palette
		# Real palettes usually start with transparent (black) and have varied colors
		has_varied_colors = len(set(palette)) > 4
		starts_black = palette[0] == (0, 0, 0)
		
		palettes.append({
			"index": i,
			"offset": f"${offset:06x}",
			"colors": [f"#{r:02x}{g:02x}{b:02x}" for r, g, b in palette],
			"has_varied_colors": has_varied_colors,
			"starts_black": starts_black,
		})
	
	return {
		"region": f"${start:06x}-${end:06x}",
		"size": size,
		"num_palettes": num_palettes,
		"palettes": palettes
	}


def search_for_palettes(rom: bytes) -> list:
	"""Search ROM for regions that look like palette data."""
	candidates = []
	
	# Look for sequences of 32 bytes that look like palettes
	# Characteristics: starts with 0x0000 (black/transparent), varied 16-bit values
	
	for offset in range(0, len(rom) - 32, 32):
		data = rom[offset:offset + 32]
		
		# Check if first color is black (common for SNES palettes)
		first_word = struct.unpack('<H', data[0:2])[0]
		if first_word != 0:
			continue
		
		# Check for variety in colors
		words = [struct.unpack('<H', data[i:i+2])[0] for i in range(0, 32, 2)]
		unique_words = len(set(words))
		
		# Real palettes usually have at least 4 unique colors
		if unique_words >= 4:
			# Check that values are in valid SNES color range
			if all(w <= 0x7fff for w in words):
				candidates.append({
					"offset": f"${offset:06x}",
					"unique_colors": unique_words,
					"sample": [f"${w:04x}" for w in words[:4]]
				})
	
	return candidates[:100]  # Limit results


def main():
	print("Robotrek Palette Extractor")
	print("=" * 60)
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	all_palettes = []
	
	# Extract known palette regions
	for start, end, desc in KNOWN_PALETTES:
		print(f"Analyzing {desc} at ${start:06x}-${end:06x}...")
		analysis = analyze_palette_region(rom, start, end)
		
		# Count valid-looking palettes
		valid = sum(1 for p in analysis['palettes'] if p['has_varied_colors'] and p['starts_black'])
		print(f"  Found {analysis['num_palettes']} palettes, {valid} look valid")
		
		all_palettes.append({
			"description": desc,
			**analysis
		})
		
		# Create combined palette image
		img_rows = []
		for i, pal_info in enumerate(analysis['palettes'][:32]):  # Limit to first 32
			palette = extract_palette(rom, start + i * 32)
			img_rows.append(palette)
		
		if img_rows:
			# Create combined image
			num_rows = len(img_rows)
			img = Image.new('RGB', (16 * 16, num_rows * 16), (0, 0, 0))
			
			for row_idx, palette in enumerate(img_rows):
				for col_idx, color in enumerate(palette):
					x = col_idx * 16
					y = row_idx * 16
					for py in range(16):
						for px in range(16):
							img.putpixel((x + px, y + py), color)
			
			# Save image
			img_name = desc.lower().replace(' ', '_').replace('(', '').replace(')', '').replace('?', '')
			img_path = os.path.join(OUTPUT_DIR, f"palettes_{img_name}.png")
			img.save(img_path)
			print(f"  Saved palette image: {img_path}")
	
	print()
	
	# Search for more palettes
	print("Searching ROM for additional palette-like data...")
	candidates = search_for_palettes(rom)
	print(f"Found {len(candidates)} potential palette locations")
	
	# Group consecutive candidates (they're likely part of same palette set)
	groups = []
	current_group = []
	
	for i, cand in enumerate(candidates):
		offset = int(cand['offset'][1:], 16)
		
		if not current_group:
			current_group = [cand]
		else:
			prev_offset = int(current_group[-1]['offset'][1:], 16)
			if offset - prev_offset <= 32:
				current_group.append(cand)
			else:
				if len(current_group) >= 4:
					groups.append(current_group)
				current_group = [cand]
	
	if len(current_group) >= 4:
		groups.append(current_group)
	
	print(f"Found {len(groups)} palette groups (4+ consecutive palettes)")
	for i, group in enumerate(groups[:10]):
		start_offset = group[0]['offset']
		end_offset = group[-1]['offset']
		print(f"  Group {i + 1}: {start_offset} to {end_offset} ({len(group)} palettes)")
	
	# Save analysis
	output = {
		"known_palette_regions": all_palettes,
		"additional_candidates": candidates[:50],
		"palette_groups": [
			{
				"start": g[0]['offset'],
				"end": g[-1]['offset'],
				"count": len(g)
			}
			for g in groups
		]
	}
	
	output_path = os.path.join(OUTPUT_DIR, "palette_analysis.json")
	with open(output_path, 'w') as f:
		json.dump(output, f, indent='\t')
	
	print()
	print(f"Saved analysis to: {output_path}")


if __name__ == "__main__":
	main()
