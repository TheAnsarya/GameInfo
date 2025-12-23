#!/usr/bin/env python3
"""
Robotrek Character Sprite Extractor

Extracts character/NPC sprite data from the ROM.
Uses the actor data format discovered earlier to find sprite graphics.
"""

import struct
import json
import os
from PIL import Image

ROM_PATH = r"C:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Robotrek (U) [!].sfc"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted"

# Actor pointer table from previous analysis
ACTOR_PTR_TABLE = 0x038000
ACTOR_DATA_START = 0x0381a4

# Default palette for preview (grayscale)
DEFAULT_PALETTE = [(i * 16, i * 16, i * 16) for i in range(16)]
DEFAULT_PALETTE[0] = (255, 0, 255)  # Magenta for transparent


def snes_to_rgb(color_word: int) -> tuple:
	"""Convert SNES 15-bit color to RGB tuple."""
	r = (color_word & 0x1f) << 3
	g = ((color_word >> 5) & 0x1f) << 3
	b = ((color_word >> 10) & 0x1f) << 3
	return (r, g, b)


def decode_4bpp_tile(data: bytes) -> list:
	"""Decode a 4BPP SNES tile (8x8, 32 bytes) to pixel indices."""
	if len(data) < 32:
		return [[0] * 8 for _ in range(8)]
	
	pixels = [[0] * 8 for _ in range(8)]
	
	for row in range(8):
		# 4BPP: 4 bytes per row, 2 bitplanes per 16-byte chunk
		bp0 = data[row * 2]
		bp1 = data[row * 2 + 1]
		bp2 = data[16 + row * 2]
		bp3 = data[16 + row * 2 + 1]
		
		for col in range(8):
			bit = 7 - col
			pixel = 0
			pixel |= ((bp0 >> bit) & 1) << 0
			pixel |= ((bp1 >> bit) & 1) << 1
			pixel |= ((bp2 >> bit) & 1) << 2
			pixel |= ((bp3 >> bit) & 1) << 3
			pixels[row][col] = pixel
	
	return pixels


def tile_to_image(pixels: list, palette: list) -> Image.Image:
	"""Convert pixel indices to an image."""
	img = Image.new('RGB', (8, 8))
	
	for y, row in enumerate(pixels):
		for x, pixel in enumerate(row):
			color = palette[pixel] if pixel < len(palette) else (0, 0, 0)
			img.putpixel((x, y), color)
	
	return img


def parse_actor_entry(rom: bytes, data_offset: int) -> dict:
	"""Parse a 22-byte actor entry."""
	data = rom[data_offset:data_offset + 22]
	
	if len(data) < 22:
		return None
	
	# Actor format: 3 frames of 7 bytes each + terminator
	# Each frame: fe [gfx_lo] [gfx_hi] 83 [anim_lo] [anim_hi] 83
	
	frames = []
	for i in range(3):
		frame_offset = i * 7
		frame_data = data[frame_offset:frame_offset + 7]
		
		if len(frame_data) < 7 or frame_data[0] != 0xfe:
			continue
		
		gfx_ptr = struct.unpack('<H', frame_data[1:3])[0]
		anim_ptr = struct.unpack('<H', frame_data[4:6])[0]
		
		frames.append({
			"graphics_ptr": f"${gfx_ptr:04x}",
			"animation_ptr": f"${anim_ptr:04x}",
		})
	
	return {
		"data_offset": f"${data_offset:06x}",
		"frames": frames,
		"terminator": data[21] if len(data) > 21 else 0
	}


def find_uncompressed_sprites(rom: bytes) -> list:
	"""Search for regions that look like uncompressed 4BPP sprite data."""
	sprites = []
	
	# Look for patterns typical of SNES sprite data
	# 4BPP tiles are 32 bytes, often have recognizable structure
	
	# Known graphics regions from ROM_Map
	graphics_regions = [
		(0x80000, 0x82000, "Font (2BPP)"),
		(0xd9310, 0xdb310, "Menu graphics (uncompressed)"),
	]
	
	for start, end, desc in graphics_regions:
		size = end - start
		num_tiles = size // 32  # 4BPP tile size
		
		sprites.append({
			"region": f"${start:06x}-${end:06x}",
			"size": size,
			"description": desc,
			"tiles_if_4bpp": num_tiles
		})
	
	return sprites


def extract_menu_graphics(rom: bytes) -> dict:
	"""Extract the uncompressed menu/inventory graphics."""
	start = 0xd9310
	end = 0xdb310
	
	data = rom[start:end]
	size = end - start
	
	# Menu graphics are likely 4BPP, 8KB = 256 tiles
	num_tiles = size // 32
	
	# Create a tile sheet (16 tiles wide)
	tiles_per_row = 16
	rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
	
	img_width = tiles_per_row * 8
	img_height = rows * 8
	
	img = Image.new('RGB', (img_width, img_height), DEFAULT_PALETTE[0])
	
	for tile_idx in range(num_tiles):
		tile_data = data[tile_idx * 32:(tile_idx + 1) * 32]
		pixels = decode_4bpp_tile(tile_data)
		tile_img = tile_to_image(pixels, DEFAULT_PALETTE)
		
		x = (tile_idx % tiles_per_row) * 8
		y = (tile_idx // tiles_per_row) * 8
		img.paste(tile_img, (x, y))
	
	return {
		"region": f"${start:06x}-${end:06x}",
		"size": size,
		"num_tiles": num_tiles,
		"image": img
	}


def extract_font_graphics(rom: bytes) -> dict:
	"""Extract the font graphics (2BPP)."""
	start = 0x80000
	end = 0x82000
	
	data = rom[start:end]
	size = end - start
	
	# Font is 2BPP, 16 bytes per tile
	tile_size = 16
	num_tiles = size // tile_size
	
	# Create palette for 2BPP (4 colors)
	palette_2bpp = [
		(255, 0, 255),  # Transparent
		(85, 85, 85),
		(170, 170, 170),
		(255, 255, 255)
	]
	
	# Decode 2BPP tiles
	tiles_per_row = 16
	rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
	
	img_width = tiles_per_row * 8
	img_height = rows * 8
	
	img = Image.new('RGB', (img_width, img_height), palette_2bpp[0])
	
	for tile_idx in range(num_tiles):
		tile_data = data[tile_idx * tile_size:(tile_idx + 1) * tile_size]
		
		# Decode 2BPP
		for row in range(8):
			if row * 2 + 1 >= len(tile_data):
				break
			bp0 = tile_data[row * 2]
			bp1 = tile_data[row * 2 + 1]
			
			for col in range(8):
				bit = 7 - col
				pixel = ((bp0 >> bit) & 1) | (((bp1 >> bit) & 1) << 1)
				
				x = (tile_idx % tiles_per_row) * 8 + col
				y = (tile_idx // tiles_per_row) * 8 + row
				
				if x < img_width and y < img_height:
					img.putpixel((x, y), palette_2bpp[pixel])
	
	return {
		"region": f"${start:06x}-${end:06x}",
		"size": size,
		"num_tiles": num_tiles,
		"image": img
	}


def main():
	print("Robotrek Character Sprite Extractor")
	print("=" * 60)
	
	with open(ROM_PATH, 'rb') as f:
		rom = f.read()
	
	print(f"ROM size: {len(rom):,} bytes")
	print()
	
	# Find sprite regions
	print("Known graphics regions:")
	sprites = find_uncompressed_sprites(rom)
	for s in sprites:
		print(f"  {s['description']}: {s['region']} ({s['size']} bytes)")
	print()
	
	# Extract font
	print("Extracting font graphics (2BPP)...")
	font = extract_font_graphics(rom)
	font_path = os.path.join(OUTPUT_DIR, "font_2bpp.png")
	font['image'].save(font_path)
	print(f"  Saved {font['num_tiles']} tiles to: {font_path}")
	
	# Extract menu graphics
	print("Extracting menu graphics (4BPP)...")
	menu = extract_menu_graphics(rom)
	menu_path = os.path.join(OUTPUT_DIR, "menu_graphics_4bpp.png")
	menu['image'].save(menu_path)
	print(f"  Saved {menu['num_tiles']} tiles to: {menu_path}")
	
	# Parse some actor entries for documentation
	print()
	print("Parsing actor data...")
	actors = []
	
	# Read pointer table
	for i in range(32):  # First 32 actors
		ptr_addr = ACTOR_PTR_TABLE + i * 2
		ptr = struct.unpack('<H', rom[ptr_addr:ptr_addr + 2])[0]
		
		# Convert pointer to file offset (bank $03)
		data_offset = 0x030000 + (ptr & 0x7fff)
		
		actor = parse_actor_entry(rom, data_offset)
		if actor:
			actor['index'] = i
			actor['pointer'] = f"${ptr:04x}"
			actors.append(actor)
	
	print(f"Parsed {len(actors)} actor entries")
	
	# Show some examples
	print()
	print("Sample actors:")
	for a in actors[:5]:
		print(f"  Actor {a['index']}: ptr={a['pointer']}, {len(a['frames'])} frames")
		for j, f in enumerate(a['frames']):
			print(f"    Frame {j}: gfx={f['graphics_ptr']}, anim={f['animation_ptr']}")
	
	# Save results
	output = {
		"graphics_regions": sprites,
		"font_info": {
			"region": font['region'],
			"size": font['size'],
			"num_tiles": font['num_tiles'],
			"format": "2BPP"
		},
		"menu_info": {
			"region": menu['region'],
			"size": menu['size'],
			"num_tiles": menu['num_tiles'],
			"format": "4BPP"
		},
		"actors": actors[:32]
	}
	
	output_path = os.path.join(OUTPUT_DIR, "sprite_analysis.json")
	with open(output_path, 'w') as f:
		json.dump(output, f, indent='\t')
	
	print()
	print(f"Saved analysis to: {output_path}")


if __name__ == "__main__":
	main()
