#!/usr/bin/env python3
"""
Soul Blazer (SNES) Graphics Extractor
Extracts 4BPP tile graphics from the ROM.
"""

import struct
from pathlib import Path
from typing import Optional

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False
	print("Warning: PIL/Pillow not installed. PNG export disabled.")


# SNES default palette (grayscale for extraction)
DEFAULT_PALETTE = [
	(0, 0, 0),       # 0 - Black
	(17, 17, 17),    # 1
	(34, 34, 34),    # 2
	(51, 51, 51),    # 3
	(68, 68, 68),    # 4
	(85, 85, 85),    # 5
	(102, 102, 102), # 6
	(119, 119, 119), # 7
	(136, 136, 136), # 8
	(153, 153, 153), # 9
	(170, 170, 170), # 10
	(187, 187, 187), # 11
	(204, 204, 204), # 12
	(221, 221, 221), # 13
	(238, 238, 238), # 14
	(255, 255, 255), # 15 - White
]


def snes_to_rgb(color: int) -> tuple[int, int, int]:
	"""Convert SNES 15-bit color to RGB."""
	r = (color & 0x1f) << 3
	g = ((color >> 5) & 0x1f) << 3
	b = ((color >> 10) & 0x1f) << 3
	return (r, g, b)


def rgb_to_snes(r: int, g: int, b: int) -> int:
	"""Convert RGB to SNES 15-bit color."""
	return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)


def decode_4bpp_tile(data: bytes) -> list[list[int]]:
	"""
	Decode a single 8x8 4BPP tile.
	SNES 4BPP format: 32 bytes per tile
	First 16 bytes: bitplanes 0,1 interleaved (2 bytes per row)
	Next 16 bytes: bitplanes 2,3 interleaved (2 bytes per row)
	"""
	if len(data) < 32:
		return [[0] * 8 for _ in range(8)]

	tile = [[0] * 8 for _ in range(8)]

	for y in range(8):
		# Bitplanes 0 and 1
		bp0 = data[y * 2]
		bp1 = data[y * 2 + 1]
		# Bitplanes 2 and 3
		bp2 = data[16 + y * 2]
		bp3 = data[16 + y * 2 + 1]

		for x in range(8):
			bit = 7 - x
			pixel = 0
			pixel |= ((bp0 >> bit) & 1) << 0
			pixel |= ((bp1 >> bit) & 1) << 1
			pixel |= ((bp2 >> bit) & 1) << 2
			pixel |= ((bp3 >> bit) & 1) << 3
			tile[y][x] = pixel

	return tile


def encode_4bpp_tile(tile: list[list[int]]) -> bytes:
	"""Encode an 8x8 tile to 4BPP format."""
	data = bytearray(32)

	for y in range(8):
		bp0 = 0
		bp1 = 0
		bp2 = 0
		bp3 = 0

		for x in range(8):
			bit = 7 - x
			pixel = tile[y][x] & 0x0f
			bp0 |= ((pixel >> 0) & 1) << bit
			bp1 |= ((pixel >> 1) & 1) << bit
			bp2 |= ((pixel >> 2) & 1) << bit
			bp3 |= ((pixel >> 3) & 1) << bit

		data[y * 2] = bp0
		data[y * 2 + 1] = bp1
		data[16 + y * 2] = bp2
		data[16 + y * 2 + 1] = bp3

	return bytes(data)


def decode_2bpp_tile(data: bytes) -> list[list[int]]:
	"""Decode a single 8x8 2BPP tile (16 bytes)."""
	if len(data) < 16:
		return [[0] * 8 for _ in range(8)]

	tile = [[0] * 8 for _ in range(8)]

	for y in range(8):
		bp0 = data[y * 2]
		bp1 = data[y * 2 + 1]

		for x in range(8):
			bit = 7 - x
			pixel = ((bp0 >> bit) & 1) | (((bp1 >> bit) & 1) << 1)
			tile[y][x] = pixel

	return tile


def extract_palette(rom: bytes, offset: int, num_colors: int = 16) -> list[tuple[int, int, int]]:
	"""Extract a palette from ROM."""
	palette = []
	for i in range(num_colors):
		color = struct.unpack('<H', rom[offset + i*2:offset + i*2 + 2])[0]
		palette.append(snes_to_rgb(color))
	return palette


def find_palettes(rom: bytes) -> list[dict]:
	"""Find potential palettes in ROM."""
	palettes = []

	# Look for sequences of 16 or 32 bytes that look like valid SNES colors
	for offset in range(0, len(rom) - 32, 2):
		# Check if this looks like a palette
		valid = True
		colors = []

		for i in range(16):
			color = struct.unpack('<H', rom[offset + i*2:offset + i*2 + 2])[0]
			# Valid SNES colors have bit 15 = 0
			if color & 0x8000:
				valid = False
				break
			colors.append(snes_to_rgb(color))

		if valid:
			# Additional check: first color often black or near-black
			r, g, b = colors[0]
			if r <= 32 and g <= 32 and b <= 32:
				bank = offset // 0x8000
				addr = 0x8000 + (offset % 0x8000)
				palettes.append({
					'file_offset': offset,
					'bank': bank,
					'address': addr,
					'colors': colors,
				})

	return palettes


def extract_tileset(rom: bytes, offset: int, num_tiles: int, bpp: int = 4) -> list[list[list[int]]]:
	"""Extract a tileset from ROM."""
	tiles = []
	bytes_per_tile = 32 if bpp == 4 else 16

	for i in range(num_tiles):
		tile_offset = offset + i * bytes_per_tile
		tile_data = rom[tile_offset:tile_offset + bytes_per_tile]

		if bpp == 4:
			tile = decode_4bpp_tile(tile_data)
		else:
			tile = decode_2bpp_tile(tile_data)

		tiles.append(tile)

	return tiles


def tileset_to_image(tiles: list, palette: list[tuple[int, int, int]], columns: int = 16) -> Optional['Image.Image']:
	"""Convert tileset to PIL Image."""
	if not HAS_PIL:
		return None

	num_tiles = len(tiles)
	rows = (num_tiles + columns - 1) // columns

	img = Image.new('RGB', (columns * 8, rows * 8))

	for i, tile in enumerate(tiles):
		tx = (i % columns) * 8
		ty = (i // columns) * 8

		for y in range(8):
			for x in range(8):
				pixel = tile[y][x]
				color = palette[pixel] if pixel < len(palette) else (0, 0, 0)
				img.putpixel((tx + x, ty + y), color)

	return img


def scan_for_graphics(rom: bytes) -> list[dict]:
	"""Scan ROM for potential graphics data."""
	graphics_regions = []

	# Look for regions that have graphics-like patterns
	window_size = 0x1000  # 4KB windows
	step = 0x800  # 2KB steps

	for offset in range(0, len(rom) - window_size, step):
		chunk = rom[offset:offset + window_size]

		# Check for tile-like data patterns
		# Graphics data typically has moderate entropy
		unique = len(set(chunk))

		# Also check for repeated patterns typical of tile data
		repetition_score = 0
		for i in range(0, len(chunk) - 32, 32):
			tile = chunk[i:i+32]
			# Check if tile has structure (not random, not all same)
			tile_unique = len(set(tile))
			if 4 <= tile_unique <= 24:
				repetition_score += 1

		if repetition_score > 50 and 30 <= unique <= 220:
			bank = offset // 0x8000
			addr = 0x8000 + (offset % 0x8000)
			graphics_regions.append({
				'file_offset': offset,
				'bank': bank,
				'address': addr,
				'size': window_size,
				'unique_bytes': unique,
				'tile_score': repetition_score,
			})

	return graphics_regions


def extract_all_graphics(rom_path: str, output_dir: str):
	"""Extract all graphics from ROM."""
	with open(rom_path, 'rb') as f:
		rom = f.read()

	output = Path(output_dir)
	output.mkdir(parents=True, exist_ok=True)

	print("=" * 60)
	print("Soul Blazer Graphics Extractor")
	print("=" * 60)

	# Scan for graphics regions
	print("\nScanning for graphics regions...")
	regions = scan_for_graphics(rom)
	print(f"  Found {len(regions)} potential graphics regions")

	# Find palettes
	print("\nScanning for palettes...")
	palettes = find_palettes(rom)
	print(f"  Found {len(palettes)} potential palettes")

	# Extract first few graphics regions as samples
	print("\nExtracting sample graphics...")
	for i, region in enumerate(regions[:10]):
		num_tiles = region['size'] // 32  # 4BPP tiles

		tiles = extract_tileset(rom, region['file_offset'], num_tiles, bpp=4)

		# Use grayscale palette for extraction
		palette = DEFAULT_PALETTE

		if HAS_PIL:
			img = tileset_to_image(tiles, palette)
			if img:
				img_path = output / f"graphics_{region['file_offset']:06x}.png"
				img.save(img_path)
				print(f"  Saved: {img_path.name} ({len(tiles)} tiles)")

	# Save palette data
	if palettes:
		print("\nExtracting palettes...")
		palette_file = output / "palettes.json"
		import json

		palette_data = []
		for p in palettes[:50]:  # First 50 palettes
			palette_data.append({
				'file_offset': f"0x{p['file_offset']:06x}",
				'bank': p['bank'],
				'address': f"0x{p['address']:04x}",
				'colors': [f"#{r:02x}{g:02x}{b:02x}" for r, g, b in p['colors']],
			})

		with open(palette_file, 'w') as f:
			json.dump(palette_data, f, indent='\t')
		print(f"  Saved: {palette_file.name}")

	print(f"\nOutput directory: {output}")


if __name__ == '__main__':
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\graphics"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	extract_all_graphics(rom_path, output_dir)
