#!/usr/bin/env python3
"""
Sprite Editor

View, extract, and modify sprite data from ROMs.
Supports NES and SNES sprite formats.

Features:
- Extract sprites from CHR ROM data
- View sprite arrangements
- Export to PNG with transparency
- Import modified sprites
- Generate sprite sheets

Usage:
	python sprite_editor.py extract <rom_file> --offset 0x10010 --count 256 --output sprites/
	python sprite_editor.py view <rom_file> --offset 0x10010 --format nes
	python sprite_editor.py sheet <rom_file> --offset 0x10010 --count 128 --output sheet.png
	python sprite_editor.py import <rom_file> --sprite sprite.png --offset 0x10010 --output new_rom.nes
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple


try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


# Default NES palette (approximate RGB values)
NES_PALETTE = [
	(0x7C, 0x7C, 0x7C), (0x00, 0x00, 0xFC), (0x00, 0x00, 0xBC), (0x44, 0x28, 0xBC),
	(0x94, 0x00, 0x84), (0xA8, 0x00, 0x20), (0xA8, 0x10, 0x00), (0x88, 0x14, 0x00),
	(0x50, 0x30, 0x00), (0x00, 0x78, 0x00), (0x00, 0x68, 0x00), (0x00, 0x58, 0x00),
	(0x00, 0x40, 0x58), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xBC, 0xBC, 0xBC), (0x00, 0x78, 0xF8), (0x00, 0x58, 0xF8), (0x68, 0x44, 0xFC),
	(0xD8, 0x00, 0xCC), (0xE4, 0x00, 0x58), (0xF8, 0x38, 0x00), (0xE4, 0x5C, 0x10),
	(0xAC, 0x7C, 0x00), (0x00, 0xB8, 0x00), (0x00, 0xA8, 0x00), (0x00, 0xA8, 0x44),
	(0x00, 0x88, 0x88), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xF8, 0xF8, 0xF8), (0x3C, 0xBC, 0xFC), (0x68, 0x88, 0xFC), (0x98, 0x78, 0xF8),
	(0xF8, 0x78, 0xF8), (0xF8, 0x58, 0x98), (0xF8, 0x78, 0x58), (0xFC, 0xA0, 0x44),
	(0xF8, 0xB8, 0x00), (0xB8, 0xF8, 0x18), (0x58, 0xD8, 0x54), (0x58, 0xF8, 0x98),
	(0x00, 0xE8, 0xD8), (0x78, 0x78, 0x78), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	(0xFC, 0xFC, 0xFC), (0xA4, 0xE4, 0xFC), (0xB8, 0xB8, 0xF8), (0xD8, 0xB8, 0xF8),
	(0xF8, 0xB8, 0xF8), (0xF8, 0xA4, 0xC0), (0xF0, 0xD0, 0xB0), (0xFC, 0xE0, 0xA8),
	(0xF8, 0xD8, 0x78), (0xD8, 0xF8, 0x78), (0xB8, 0xF8, 0xB8), (0xB8, 0xF8, 0xD8),
	(0x00, 0xFC, 0xFC), (0xF8, 0xD8, 0xF8), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
]


@dataclass
class Tile:
	"""Represents a single 8x8 tile"""
	data: bytes  # Raw tile data
	pixels: List[List[int]]  # 2D array of palette indices (0-3 for NES)
	width: int = 8
	height: int = 8


def decode_nes_tile(data: bytes) -> Tile:
	"""
	Decode NES 2bpp planar tile (16 bytes = 8x8 pixels)
	Format: 8 bytes plane 0, then 8 bytes plane 1
	"""
	if len(data) < 16:
		data = data + bytes(16 - len(data))

	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		plane0 = data[y]
		plane1 = data[y + 8]

		for x in range(8):
			bit0 = (plane0 >> (7 - x)) & 1
			bit1 = (plane1 >> (7 - x)) & 1
			pixels[y][x] = bit0 | (bit1 << 1)

	return Tile(data=data[:16], pixels=pixels)


def encode_nes_tile(tile: Tile) -> bytes:
	"""Encode pixels back to NES 2bpp format"""
	data = bytearray(16)

	for y in range(8):
		plane0 = 0
		plane1 = 0

		for x in range(8):
			pixel = tile.pixels[y][x] & 3
			bit0 = pixel & 1
			bit1 = (pixel >> 1) & 1
			plane0 |= bit0 << (7 - x)
			plane1 |= bit1 << (7 - x)

		data[y] = plane0
		data[y + 8] = plane1

	return bytes(data)


def decode_snes_tile_4bpp(data: bytes) -> Tile:
	"""
	Decode SNES 4bpp planar tile (32 bytes = 8x8 pixels)
	Format: 8 rows, each row is 4 bytes (2 bitplanes per row pair)
	"""
	if len(data) < 32:
		data = data + bytes(32 - len(data))

	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		# Planes 0 and 1 are interleaved in first 16 bytes
		plane0 = data[y * 2]
		plane1 = data[y * 2 + 1]
		# Planes 2 and 3 are interleaved in next 16 bytes
		plane2 = data[16 + y * 2]
		plane3 = data[16 + y * 2 + 1]

		for x in range(8):
			bit0 = (plane0 >> (7 - x)) & 1
			bit1 = (plane1 >> (7 - x)) & 1
			bit2 = (plane2 >> (7 - x)) & 1
			bit3 = (plane3 >> (7 - x)) & 1
			pixels[y][x] = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)

	return Tile(data=data[:32], pixels=pixels)


def tile_to_image(tile: Tile, palette: List[Tuple[int, int, int]] = None, transparent_index: int = 0) -> 'Image':
	"""Convert tile to PIL Image"""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for image operations")

	if palette is None:
		# Default grayscale for 2bpp
		palette = [(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)]

	img = Image.new('RGBA', (tile.width, tile.height))
	pixels_out = img.load()

	for y in range(tile.height):
		for x in range(tile.width):
			idx = tile.pixels[y][x]
			if idx == transparent_index:
				pixels_out[x, y] = (0, 0, 0, 0)  # Transparent
			elif idx < len(palette):
				r, g, b = palette[idx]
				pixels_out[x, y] = (r, g, b, 255)
			else:
				pixels_out[x, y] = (255, 0, 255, 255)  # Magenta for invalid

	return img


def image_to_tile(img: 'Image', palette: List[Tuple[int, int, int]] = None) -> Tile:
	"""Convert PIL Image to tile"""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for image operations")

	if palette is None:
		palette = [(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)]

	# Resize if needed
	if img.size != (8, 8):
		img = img.resize((8, 8), Image.NEAREST)

	img = img.convert('RGBA')
	pixels = [[0] * 8 for _ in range(8)]

	for y in range(8):
		for x in range(8):
			r, g, b, a = img.getpixel((x, y))

			if a < 128:  # Transparent
				pixels[y][x] = 0
			else:
				# Find closest palette color
				best_idx = 0
				best_dist = float('inf')
				for i, (pr, pg, pb) in enumerate(palette):
					dist = (r - pr) ** 2 + (g - pg) ** 2 + (b - pb) ** 2
					if dist < best_dist:
						best_dist = dist
						best_idx = i
				pixels[y][x] = best_idx

	return Tile(data=b'', pixels=pixels)


def extract_tiles(data: bytes, offset: int, count: int, tile_format: str = 'nes') -> List[Tile]:
	"""Extract multiple tiles from ROM data"""
	tiles = []

	if tile_format == 'nes':
		tile_size = 16
		decode_func = decode_nes_tile
	elif tile_format == 'snes_4bpp':
		tile_size = 32
		decode_func = decode_snes_tile_4bpp
	else:
		tile_size = 16
		decode_func = decode_nes_tile

	for i in range(count):
		tile_offset = offset + (i * tile_size)
		if tile_offset + tile_size > len(data):
			break
		tile_data = data[tile_offset:tile_offset + tile_size]
		tiles.append(decode_func(tile_data))

	return tiles


def create_sprite_sheet(tiles: List[Tile], columns: int = 16, palette: List[Tuple[int, int, int]] = None) -> 'Image':
	"""Create sprite sheet from tiles"""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for image operations")

	if not tiles:
		return Image.new('RGBA', (128, 128), (0, 0, 0, 0))

	rows = (len(tiles) + columns - 1) // columns
	width = columns * 8
	height = rows * 8

	sheet = Image.new('RGBA', (width, height), (0, 0, 0, 0))

	for i, tile in enumerate(tiles):
		x = (i % columns) * 8
		y = (i // columns) * 8
		tile_img = tile_to_image(tile, palette)
		sheet.paste(tile_img, (x, y))

	return sheet


def main():
	parser = argparse.ArgumentParser(
		description='Sprite Editor',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract sprites to PNG')
	extract_parser.add_argument('file', help='ROM file')
	extract_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Start offset')
	extract_parser.add_argument('--count', '-c', type=int, default=256, help='Number of tiles')
	extract_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes_4bpp'], help='Tile format')
	extract_parser.add_argument('--output', required=True, help='Output directory')

	# View command (text-based)
	view_parser = subparsers.add_parser('view', help='View tiles as text')
	view_parser.add_argument('file', help='ROM file')
	view_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Start offset')
	view_parser.add_argument('--count', '-c', type=int, default=16, help='Number of tiles')
	view_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes_4bpp'], help='Tile format')

	# Sheet command
	sheet_parser = subparsers.add_parser('sheet', help='Create sprite sheet')
	sheet_parser.add_argument('file', help='ROM file')
	sheet_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Start offset')
	sheet_parser.add_argument('--count', '-c', type=int, default=256, help='Number of tiles')
	sheet_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes_4bpp'], help='Tile format')
	sheet_parser.add_argument('--columns', type=int, default=16, help='Columns in sheet')
	sheet_parser.add_argument('--output', required=True, help='Output PNG file')
	sheet_parser.add_argument('--scale', type=int, default=1, help='Scale factor')

	# Import command
	import_parser = subparsers.add_parser('import', help='Import sprite from PNG')
	import_parser.add_argument('file', help='ROM file')
	import_parser.add_argument('--sprite', '-s', required=True, help='Sprite PNG file')
	import_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), required=True, help='Target offset')
	import_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes_4bpp'], help='Tile format')
	import_parser.add_argument('--output', required=True, help='Output ROM file')

	args = parser.parse_args()

	if args.command == 'extract':
		if not HAS_PIL:
			print("Error: PIL/Pillow required for extraction. Install with: pip install Pillow")
			sys.exit(1)

		with open(args.file, 'rb') as f:
			data = f.read()

		tiles = extract_tiles(data, args.offset, args.count, args.format)
		output_dir = Path(args.output)
		output_dir.mkdir(parents=True, exist_ok=True)

		for i, tile in enumerate(tiles):
			img = tile_to_image(tile)
			filename = output_dir / f"tile_{i:04d}.png"
			img.save(filename)

		print(f"Extracted {len(tiles)} tiles to: {args.output}")

	elif args.command == 'view':
		with open(args.file, 'rb') as f:
			data = f.read()

		tiles = extract_tiles(data, args.offset, args.count, args.format)

		# ASCII art characters for 2bpp
		chars = [' ', '░', '▒', '█']

		for i, tile in enumerate(tiles):
			print(f"Tile {i} (offset 0x{args.offset + i * 16:06X}):")
			for row in tile.pixels:
				print('  ' + ''.join(chars[min(p, 3)] * 2 for p in row))
			print()

	elif args.command == 'sheet':
		if not HAS_PIL:
			print("Error: PIL/Pillow required for sprite sheets. Install with: pip install Pillow")
			sys.exit(1)

		with open(args.file, 'rb') as f:
			data = f.read()

		tiles = extract_tiles(data, args.offset, args.count, args.format)
		sheet = create_sprite_sheet(tiles, args.columns)

		if args.scale > 1:
			new_size = (sheet.width * args.scale, sheet.height * args.scale)
			sheet = sheet.resize(new_size, Image.NEAREST)

		sheet.save(args.output)
		print(f"Created sprite sheet: {args.output}")
		print(f"  {len(tiles)} tiles, {sheet.width}x{sheet.height} pixels")

	elif args.command == 'import':
		if not HAS_PIL:
			print("Error: PIL/Pillow required for import. Install with: pip install Pillow")
			sys.exit(1)

		with open(args.file, 'rb') as f:
			rom_data = bytearray(f.read())

		img = Image.open(args.sprite)

		# Calculate how many tiles
		tile_width = img.width // 8
		tile_height = img.height // 8
		tile_count = tile_width * tile_height

		if args.format == 'nes':
			tile_size = 16
		else:
			tile_size = 32

		print(f"Importing {tile_count} tiles from: {args.sprite}")

		for ty in range(tile_height):
			for tx in range(tile_width):
				i = ty * tile_width + tx
				tile_img = img.crop((tx * 8, ty * 8, (tx + 1) * 8, (ty + 1) * 8))
				tile = image_to_tile(tile_img)

				if args.format == 'nes':
					tile_data = encode_nes_tile(tile)
				else:
					print("Warning: SNES encoding not fully implemented")
					continue

				offset = args.offset + i * tile_size
				if offset + tile_size <= len(rom_data):
					rom_data[offset:offset + tile_size] = tile_data

		with open(args.output, 'wb') as f:
			f.write(rom_data)

		print(f"Saved modified ROM: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
