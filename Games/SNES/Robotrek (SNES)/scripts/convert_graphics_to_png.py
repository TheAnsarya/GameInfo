#!/usr/bin/env python3
"""
Convert Robotrek graphics data to PNG images.

Supports:
- 2BPP (GameBoy-style) graphics
- 4BPP (SNES standard) graphics
"""

import os
from PIL import Image

INPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted\graphics"
OUTPUT_DIR = r"C:\Users\me\source\repos\GameInfo\Games\SNES\Robotrek (SNES)\extracted\images"

# Default SNES grayscale palette for 4-color (2BPP)
PALETTE_2BPP = [
	(255, 255, 255),  # Color 0 - white
	(170, 170, 170),  # Color 1 - light gray
	(85, 85, 85),     # Color 2 - dark gray
	(0, 0, 0),        # Color 3 - black
]

# Default SNES grayscale palette for 16-color (4BPP)
PALETTE_4BPP = [
	(255, 255, 255),
	(238, 238, 238),
	(221, 221, 221),
	(204, 204, 204),
	(187, 187, 187),
	(170, 170, 170),
	(153, 153, 153),
	(136, 136, 136),
	(119, 119, 119),
	(102, 102, 102),
	(85, 85, 85),
	(68, 68, 68),
	(51, 51, 51),
	(34, 34, 34),
	(17, 17, 17),
	(0, 0, 0),
]


def decode_2bpp_tile(data: bytes, offset: int = 0) -> list:
	"""Decode a single 8x8 2BPP tile to pixel indices."""
	pixels = []
	for row in range(8):
		if offset + row * 2 + 1 >= len(data):
			pixels.extend([0] * 8)
			continue
		
		lo = data[offset + row * 2]
		hi = data[offset + row * 2 + 1]
		
		row_pixels = []
		for bit in range(7, -1, -1):
			pixel = ((lo >> bit) & 1) | (((hi >> bit) & 1) << 1)
			row_pixels.append(pixel)
		pixels.extend(row_pixels)
	
	return pixels


def decode_4bpp_tile(data: bytes, offset: int = 0) -> list:
	"""Decode a single 8x8 4BPP tile to pixel indices."""
	pixels = []
	for row in range(8):
		if offset + row * 2 + 17 >= len(data):
			pixels.extend([0] * 8)
			continue
		
		# First bitplane pair
		lo0 = data[offset + row * 2]
		hi0 = data[offset + row * 2 + 1]
		# Second bitplane pair
		lo1 = data[offset + 16 + row * 2]
		hi1 = data[offset + 16 + row * 2 + 1]
		
		row_pixels = []
		for bit in range(7, -1, -1):
			pixel = ((lo0 >> bit) & 1) | \
					(((hi0 >> bit) & 1) << 1) | \
					(((lo1 >> bit) & 1) << 2) | \
					(((hi1 >> bit) & 1) << 3)
			row_pixels.append(pixel)
		pixels.extend(row_pixels)
	
	return pixels


def tiles_to_image(data: bytes, bpp: int, tiles_per_row: int = 16) -> Image.Image:
	"""Convert tile data to an image."""
	tile_size = 16 if bpp == 2 else 32  # bytes per tile
	num_tiles = len(data) // tile_size
	
	if num_tiles == 0:
		return Image.new('RGB', (8, 8), (0, 0, 0))
	
	# Calculate image dimensions
	rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
	width = tiles_per_row * 8
	height = rows * 8
	
	# Create image
	img = Image.new('RGB', (width, height), (0, 0, 0))
	
	palette = PALETTE_2BPP if bpp == 2 else PALETTE_4BPP
	decode_tile = decode_2bpp_tile if bpp == 2 else decode_4bpp_tile
	
	for tile_idx in range(num_tiles):
		tile_x = (tile_idx % tiles_per_row) * 8
		tile_y = (tile_idx // tiles_per_row) * 8
		
		pixels = decode_tile(data, tile_idx * tile_size)
		
		for py in range(8):
			for px in range(8):
				pixel_idx = pixels[py * 8 + px]
				color = palette[pixel_idx % len(palette)]
				img.putpixel((tile_x + px, tile_y + py), color)
	
	return img


def main():
	print("Robotrek Graphics Converter")
	print("=" * 60)
	
	os.makedirs(OUTPUT_DIR, exist_ok=True)
	
	# Files to convert with their BPP settings
	conversions = [
		# (filename, bpp, tiles_per_row, description)
		("080000_font.bin", 2, 16, "Font graphics (uncompressed 2BPP)"),
		("0d9310_inventory.bin", 2, 16, "Inventory graphics (uncompressed)"),
		("082000_graphics_bank_1.bin", 4, 16, "Graphics bank 1"),
		("0835c5_graphics_bank_2.bin", 4, 16, "Graphics bank 2"),
		("084b5c_graphics_bank_3.bin", 4, 16, "Graphics bank 3"),
		("0860ef_graphics_bank_4.bin", 4, 16, "Graphics bank 4"),
		("087631_graphics_bank_5.bin", 4, 16, "Graphics bank 5"),
		("0db310_menu_graphics_1.bin", 4, 16, "Menu graphics 1"),
		("0dd170_menu_graphics_2.bin", 4, 16, "Menu graphics 2"),
		("0deb7f_menu_graphics_3.bin", 4, 16, "Menu graphics 3"),
		# Map tilesets are typically 4BPP
		("000000_map_tileset_1.bin", 4, 16, "Map tileset 1"),
		("000623_map_tileset_2.bin", 4, 16, "Map tileset 2"),
		("000c3f_map_tileset_3.bin", 4, 16, "Map tileset 3"),
		("00124e_map_tileset_4.bin", 4, 16, "Map tileset 4"),
		("001845_map_tileset_5.bin", 4, 16, "Map tileset 5"),
		("001e2f_map_tileset_6.bin", 4, 16, "Map tileset 6"),
		("00344b_map_tileset_7.bin", 4, 16, "Map tileset 7"),
	]
	
	for filename, bpp, tiles_per_row, description in conversions:
		input_path = os.path.join(INPUT_DIR, filename)
		
		if not os.path.exists(input_path):
			print(f"  SKIP: {filename} (not found)")
			continue
		
		with open(input_path, 'rb') as f:
			data = f.read()
		
		img = tiles_to_image(data, bpp, tiles_per_row)
		
		output_name = filename.replace('.bin', '.png')
		output_path = os.path.join(OUTPUT_DIR, output_name)
		img.save(output_path)
		
		print(f"  {description}: {img.width}x{img.height} -> {output_name}")
	
	print()
	print(f"Output directory: {OUTPUT_DIR}")
	print("Done!")


if __name__ == "__main__":
	main()
