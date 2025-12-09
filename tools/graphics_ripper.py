#!/usr/bin/env python3
"""
Graphics Ripper - Extract and convert graphics from ROMs

Extracts graphics data in various formats:
- NES CHR tiles (8x8 2bpp)
- SNES tiles (8x8 4bpp, 8x8 2bpp)
- Genesis tiles (8x8 4bpp)
- Game Boy tiles (8x8 2bpp)
- Mode 7 tiles (8x8 8bpp)

Features:
- Batch extraction
- Palette application
- Tilemap reconstruction
- Animation frame extraction
- Export to PNG/GIF
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, Tuple

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class TileFormat(Enum):
	"""Tile graphics formats"""
	NES_2BPP = "nes_2bpp"  # 2bpp planar
	SNES_4BPP = "snes_4bpp"  # 4bpp planar
	SNES_2BPP = "snes_2bpp"  # 2bpp planar (same as NES)
	SNES_8BPP = "snes_8bpp"  # Mode 7
	GB_2BPP = "gb_2bpp"  # Game Boy
	GEN_4BPP = "gen_4bpp"  # Genesis/Mega Drive
	LINEAR_4BPP = "linear_4bpp"  # Linear 4bpp
	LINEAR_8BPP = "linear_8bpp"  # Linear 8bpp


@dataclass
class Tile:
	"""Single 8x8 tile"""
	pixels: list = field(default_factory=list)  # 8x8 array of palette indices
	tile_id: int = 0


@dataclass
class Palette:
	"""Color palette"""
	colors: list = field(default_factory=list)  # List of (R, G, B) tuples
	name: str = ""


@dataclass
class TileSheet:
	"""Collection of tiles"""
	tiles: list = field(default_factory=list)
	width: int = 16  # Tiles per row in sheet
	format_type: TileFormat = TileFormat.NES_2BPP


class TileDecoder:
	"""Decode tile graphics from various formats"""

	def decode_nes_2bpp(self, data: bytes, offset: int = 0) -> Tile:
		"""Decode NES/SNES 2bpp tile (16 bytes per tile)"""
		tile = Tile()
		tile.pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			byte0 = data[offset + y] if offset + y < len(data) else 0
			byte1 = data[offset + y + 8] if offset + y + 8 < len(data) else 0

			for x in range(8):
				bit0 = (byte0 >> (7 - x)) & 1
				bit1 = (byte1 >> (7 - x)) & 1
				tile.pixels[y][x] = bit0 | (bit1 << 1)

		return tile

	def decode_snes_4bpp(self, data: bytes, offset: int = 0) -> Tile:
		"""Decode SNES 4bpp tile (32 bytes per tile)"""
		tile = Tile()
		tile.pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			# First bitplane pair (bytes 0-15)
			byte0 = data[offset + y * 2] if offset + y * 2 < len(data) else 0
			byte1 = data[offset + y * 2 + 1] if offset + y * 2 + 1 < len(data) else 0
			# Second bitplane pair (bytes 16-31)
			byte2 = data[offset + 16 + y * 2] if offset + 16 + y * 2 < len(data) else 0
			byte3 = data[offset + 16 + y * 2 + 1] if offset + 16 + y * 2 + 1 < len(data) else 0

			for x in range(8):
				bit0 = (byte0 >> (7 - x)) & 1
				bit1 = (byte1 >> (7 - x)) & 1
				bit2 = (byte2 >> (7 - x)) & 1
				bit3 = (byte3 >> (7 - x)) & 1
				tile.pixels[y][x] = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)

		return tile

	def decode_snes_8bpp(self, data: bytes, offset: int = 0) -> Tile:
		"""Decode SNES 8bpp/Mode 7 tile (64 bytes per tile)"""
		tile = Tile()
		tile.pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			for x in range(8):
				idx = offset + y * 8 + x
				tile.pixels[y][x] = data[idx] if idx < len(data) else 0

		return tile

	def decode_genesis_4bpp(self, data: bytes, offset: int = 0) -> Tile:
		"""Decode Genesis 4bpp tile (32 bytes per tile)"""
		tile = Tile()
		tile.pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			for x in range(0, 8, 2):
				idx = offset + y * 4 + x // 2
				byte = data[idx] if idx < len(data) else 0
				tile.pixels[y][x] = (byte >> 4) & 0x0f
				tile.pixels[y][x + 1] = byte & 0x0f

		return tile

	def decode_gb_2bpp(self, data: bytes, offset: int = 0) -> Tile:
		"""Decode Game Boy 2bpp tile (16 bytes per tile)"""
		tile = Tile()
		tile.pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			byte0 = data[offset + y * 2] if offset + y * 2 < len(data) else 0
			byte1 = data[offset + y * 2 + 1] if offset + y * 2 + 1 < len(data) else 0

			for x in range(8):
				bit0 = (byte0 >> (7 - x)) & 1
				bit1 = (byte1 >> (7 - x)) & 1
				tile.pixels[y][x] = bit0 | (bit1 << 1)

		return tile

	def decode_tiles(self, data: bytes, format_type: TileFormat,
					start_offset: int = 0, num_tiles: int = None) -> list:
		"""Decode multiple tiles"""
		# Bytes per tile
		bytes_per_tile = {
			TileFormat.NES_2BPP: 16,
			TileFormat.SNES_2BPP: 16,
			TileFormat.SNES_4BPP: 32,
			TileFormat.SNES_8BPP: 64,
			TileFormat.GB_2BPP: 16,
			TileFormat.GEN_4BPP: 32,
			TileFormat.LINEAR_4BPP: 32,
			TileFormat.LINEAR_8BPP: 64,
		}

		bpt = bytes_per_tile.get(format_type, 16)

		# Decoder function
		decoders = {
			TileFormat.NES_2BPP: self.decode_nes_2bpp,
			TileFormat.SNES_2BPP: self.decode_nes_2bpp,
			TileFormat.SNES_4BPP: self.decode_snes_4bpp,
			TileFormat.SNES_8BPP: self.decode_snes_8bpp,
			TileFormat.GB_2BPP: self.decode_gb_2bpp,
			TileFormat.GEN_4BPP: self.decode_genesis_4bpp,
		}

		decode_func = decoders.get(format_type, self.decode_nes_2bpp)

		# Calculate number of tiles if not specified
		if num_tiles is None:
			num_tiles = (len(data) - start_offset) // bpt

		tiles = []
		for i in range(num_tiles):
			offset = start_offset + i * bpt
			if offset + bpt <= len(data):
				tile = decode_func(data, offset)
				tile.tile_id = i
				tiles.append(tile)

		return tiles


class PaletteManager:
	"""Manage and convert color palettes"""

	# Default palettes
	GRAYSCALE_2BPP = [(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)]
	GRAYSCALE_4BPP = [(i * 17, i * 17, i * 17) for i in range(16)]
	GRAYSCALE_8BPP = [(i, i, i) for i in range(256)]

	# NES palette (simplified)
	NES_PALETTE = [
		(0x7c, 0x7c, 0x7c), (0x00, 0x00, 0xfc), (0x00, 0x00, 0xbc), (0x44, 0x28, 0xbc),
		(0x94, 0x00, 0x84), (0xa8, 0x00, 0x20), (0xa8, 0x10, 0x00), (0x88, 0x14, 0x00),
		(0x50, 0x30, 0x00), (0x00, 0x78, 0x00), (0x00, 0x68, 0x00), (0x00, 0x58, 0x00),
		(0x00, 0x40, 0x58), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
		(0xbc, 0xbc, 0xbc), (0x00, 0x78, 0xf8), (0x00, 0x58, 0xf8), (0x68, 0x44, 0xfc),
		(0xd8, 0x00, 0xcc), (0xe4, 0x00, 0x58), (0xf8, 0x38, 0x00), (0xe4, 0x5c, 0x10),
		(0xac, 0x7c, 0x00), (0x00, 0xb8, 0x00), (0x00, 0xa8, 0x00), (0x00, 0xa8, 0x44),
		(0x00, 0x88, 0x88), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
		(0xf8, 0xf8, 0xf8), (0x3c, 0xbc, 0xfc), (0x68, 0x88, 0xfc), (0x98, 0x78, 0xf8),
		(0xf8, 0x78, 0xf8), (0xf8, 0x58, 0x98), (0xf8, 0x78, 0x58), (0xfc, 0xa0, 0x44),
		(0xf8, 0xb8, 0x00), (0xb8, 0xf8, 0x18), (0x58, 0xd8, 0x54), (0x58, 0xf8, 0x98),
		(0x00, 0xe8, 0xd8), (0x78, 0x78, 0x78), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
		(0xfc, 0xfc, 0xfc), (0xa4, 0xe4, 0xfc), (0xb8, 0xb8, 0xf8), (0xd8, 0xb8, 0xf8),
		(0xf8, 0xb8, 0xf8), (0xf8, 0xa4, 0xc0), (0xf0, 0xd0, 0xb0), (0xfc, 0xe0, 0xa8),
		(0xf8, 0xd8, 0x78), (0xd8, 0xf8, 0x78), (0xb8, 0xf8, 0xb8), (0xb8, 0xf8, 0xd8),
		(0x00, 0xfc, 0xfc), (0xf8, 0xd8, 0xf8), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
	]

	def get_default_palette(self, format_type: TileFormat) -> Palette:
		"""Get default palette for format"""
		if format_type in (TileFormat.NES_2BPP, TileFormat.SNES_2BPP, TileFormat.GB_2BPP):
			return Palette(colors=self.GRAYSCALE_2BPP[:], name="Grayscale 2bpp")
		elif format_type in (TileFormat.SNES_4BPP, TileFormat.GEN_4BPP, TileFormat.LINEAR_4BPP):
			return Palette(colors=self.GRAYSCALE_4BPP[:], name="Grayscale 4bpp")
		else:
			return Palette(colors=self.GRAYSCALE_8BPP[:], name="Grayscale 8bpp")

	def parse_nes_palette(self, data: bytes, offset: int = 0, count: int = 4) -> Palette:
		"""Parse NES palette from indices"""
		colors = []
		for i in range(count):
			idx = data[offset + i] if offset + i < len(data) else 0
			idx = idx & 0x3f  # Mask to valid range
			colors.append(self.NES_PALETTE[idx])
		return Palette(colors=colors, name="NES palette")

	def parse_snes_palette(self, data: bytes, offset: int = 0, count: int = 16) -> Palette:
		"""Parse SNES 15-bit RGB palette"""
		colors = []
		for i in range(count):
			idx = offset + i * 2
			if idx + 1 < len(data):
				color16 = data[idx] | (data[idx + 1] << 8)
				r = ((color16 >> 0) & 0x1f) * 8
				g = ((color16 >> 5) & 0x1f) * 8
				b = ((color16 >> 10) & 0x1f) * 8
				colors.append((r, g, b))
			else:
				colors.append((0, 0, 0))
		return Palette(colors=colors, name="SNES palette")

	def parse_genesis_palette(self, data: bytes, offset: int = 0, count: int = 16) -> Palette:
		"""Parse Genesis 9-bit RGB palette (BGR format)"""
		colors = []
		for i in range(count):
			idx = offset + i * 2
			if idx + 1 < len(data):
				color16 = (data[idx] << 8) | data[idx + 1]  # Big endian
				b = ((color16 >> 9) & 0x07) * 36
				g = ((color16 >> 5) & 0x07) * 36
				r = ((color16 >> 1) & 0x07) * 36
				colors.append((r, g, b))
			else:
				colors.append((0, 0, 0))
		return Palette(colors=colors, name="Genesis palette")

	def load_palette_json(self, json_path: str) -> Palette:
		"""Load palette from JSON file"""
		with open(json_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		colors = []
		for color in data.get('colors', []):
			if isinstance(color, list) and len(color) >= 3:
				colors.append(tuple(color[:3]))
			elif isinstance(color, str) and color.startswith('#'):
				# Parse hex color
				hex_val = color[1:]
				r = int(hex_val[0:2], 16)
				g = int(hex_val[2:4], 16)
				b = int(hex_val[4:6], 16)
				colors.append((r, g, b))

		return Palette(colors=colors, name=data.get('name', 'Custom'))


class TileRenderer:
	"""Render tiles to images"""

	def __init__(self):
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow is required for rendering")

	def render_tile(self, tile: Tile, palette: Palette, scale: int = 1) -> Image:
		"""Render a single tile to image"""
		img = Image.new('RGB', (8 * scale, 8 * scale))
		pixels = img.load()

		for y in range(8):
			for x in range(8):
				color_idx = tile.pixels[y][x]
				if color_idx < len(palette.colors):
					color = palette.colors[color_idx]
				else:
					color = (0, 0, 0)

				for sy in range(scale):
					for sx in range(scale):
						pixels[x * scale + sx, y * scale + sy] = color

		return img

	def render_sheet(self, tiles: list, palette: Palette,
					tiles_per_row: int = 16, scale: int = 1) -> Image:
		"""Render all tiles as a sheet"""
		if not tiles:
			return Image.new('RGB', (1, 1))

		num_rows = (len(tiles) + tiles_per_row - 1) // tiles_per_row
		width = tiles_per_row * 8 * scale
		height = num_rows * 8 * scale

		sheet = Image.new('RGB', (width, height), (0, 0, 0))

		for i, tile in enumerate(tiles):
			x = (i % tiles_per_row) * 8 * scale
			y = (i // tiles_per_row) * 8 * scale
			tile_img = self.render_tile(tile, palette, scale)
			sheet.paste(tile_img, (x, y))

		return sheet

	def render_tilemap(self, tilemap: list, tiles: list, palette: Palette,
					  width: int, height: int, scale: int = 1) -> Image:
		"""Render a tilemap using tile indices"""
		img_width = width * 8 * scale
		img_height = height * 8 * scale
		img = Image.new('RGB', (img_width, img_height), (0, 0, 0))

		for i, tile_idx in enumerate(tilemap):
			if i >= width * height:
				break

			x = (i % width) * 8 * scale
			y = (i // width) * 8 * scale

			if 0 <= tile_idx < len(tiles):
				tile_img = self.render_tile(tiles[tile_idx], palette, scale)
				img.paste(tile_img, (x, y))

		return img


def main():
	parser = argparse.ArgumentParser(
		description='Extract and convert graphics from ROMs'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract tiles from ROM')
	extract_parser.add_argument('rom', help='ROM file')
	extract_parser.add_argument('--format', choices=[f.value for f in TileFormat],
							   default='nes_2bpp', help='Tile format')
	extract_parser.add_argument('--offset', type=lambda x: int(x, 0), default=0,
							   help='Start offset (hex supported)')
	extract_parser.add_argument('--count', type=int, help='Number of tiles')
	extract_parser.add_argument('--width', type=int, default=16, help='Tiles per row')
	extract_parser.add_argument('--scale', type=int, default=1, help='Scale factor')
	extract_parser.add_argument('--palette', help='Palette file (JSON)')
	extract_parser.add_argument('-o', '--output', required=True, help='Output PNG file')

	# Palette command
	pal_parser = subparsers.add_parser('palette', help='Extract palette')
	pal_parser.add_argument('rom', help='ROM file')
	pal_parser.add_argument('--format', choices=['nes', 'snes', 'genesis'],
						   default='snes', help='Palette format')
	pal_parser.add_argument('--offset', type=lambda x: int(x, 0), default=0,
						   help='Palette offset')
	pal_parser.add_argument('--count', type=int, default=16, help='Number of colors')
	pal_parser.add_argument('-o', '--output', help='Output JSON file')

	# Info command
	info_parser = subparsers.add_parser('info', help='Show tile info')
	info_parser.add_argument('rom', help='ROM file')
	info_parser.add_argument('--format', choices=[f.value for f in TileFormat],
						   default='nes_2bpp', help='Tile format')
	info_parser.add_argument('--offset', type=lambda x: int(x, 0), default=0)

	# Scan command
	scan_parser = subparsers.add_parser('scan', help='Scan for graphics')
	scan_parser.add_argument('rom', help='ROM file')
	scan_parser.add_argument('--format', choices=[f.value for f in TileFormat],
						   default='nes_2bpp', help='Tile format')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	# Load ROM
	with open(args.rom, 'rb') as f:
		rom_data = f.read()

	decoder = TileDecoder()
	pal_manager = PaletteManager()

	if args.command == 'extract':
		if not HAS_PIL:
			print("Error: PIL/Pillow is required for extraction")
			print("Install with: pip install Pillow")
			return

		format_type = TileFormat(args.format)
		tiles = decoder.decode_tiles(rom_data, format_type, args.offset, args.count)

		# Load palette
		if args.palette:
			palette = pal_manager.load_palette_json(args.palette)
		else:
			palette = pal_manager.get_default_palette(format_type)

		# Render
		renderer = TileRenderer()
		sheet = renderer.render_sheet(tiles, palette, args.width, args.scale)
		sheet.save(args.output)

		print(f"Extracted {len(tiles)} tiles to {args.output}")

	elif args.command == 'palette':
		if args.format == 'nes':
			palette = pal_manager.parse_nes_palette(rom_data, args.offset, args.count)
		elif args.format == 'snes':
			palette = pal_manager.parse_snes_palette(rom_data, args.offset, args.count)
		else:
			palette = pal_manager.parse_genesis_palette(rom_data, args.offset, args.count)

		# Output
		data = {
			'name': palette.name,
			'colors': [list(c) for c in palette.colors]
		}

		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				json.dump(data, f, indent=2)
			print(f"Palette saved to {args.output}")
		else:
			print(json.dumps(data, indent=2))

	elif args.command == 'info':
		format_type = TileFormat(args.format)

		# Bytes per tile
		bytes_per_tile = {
			TileFormat.NES_2BPP: 16,
			TileFormat.SNES_2BPP: 16,
			TileFormat.SNES_4BPP: 32,
			TileFormat.SNES_8BPP: 64,
			TileFormat.GB_2BPP: 16,
			TileFormat.GEN_4BPP: 32,
		}

		bpt = bytes_per_tile.get(format_type, 16)
		available = len(rom_data) - args.offset
		max_tiles = available // bpt

		print(f"ROM: {args.rom}")
		print(f"ROM Size: {len(rom_data):,} bytes")
		print(f"Format: {format_type.value}")
		print(f"Bytes per tile: {bpt}")
		print(f"Offset: ${args.offset:06x}")
		print(f"Available data: {available:,} bytes")
		print(f"Max tiles from offset: {max_tiles:,}")

	elif args.command == 'scan':
		print(f"Scanning {args.rom} for graphics...")
		print("(This is a simple heuristic scan)")

		format_type = TileFormat(args.format)
		bytes_per_tile = 16 if '2bpp' in format_type.value else 32

		# Look for regions with tile-like patterns
		# This is a very basic heuristic
		potential_regions = []
		chunk_size = bytes_per_tile * 16  # 16 tiles at a time

		for offset in range(0, len(rom_data) - chunk_size, chunk_size):
			chunk = rom_data[offset:offset + chunk_size]

			# Check if data looks "tile-like" (not all same value, not random-looking)
			unique_bytes = len(set(chunk))
			if 2 < unique_bytes < 200:  # Some variety but not too random
				# Check for planar patterns (alternating bit patterns)
				score = 0
				for i in range(0, len(chunk), bytes_per_tile):
					tile_data = chunk[i:i + bytes_per_tile]
					# Simple heuristic: tiles often have related bytes
					if len(tile_data) >= 16:
						plane1 = tile_data[0:8]
						plane2 = tile_data[8:16]
						# Check if planes are related
						if any(a != 0 or b != 0 for a, b in zip(plane1, plane2)):
							score += 1

				if score > 8:  # Most tiles look valid
					potential_regions.append((offset, score))

		print(f"\nFound {len(potential_regions)} potential graphics regions:")
		for offset, score in sorted(potential_regions, key=lambda x: -x[1])[:20]:
			print(f"  ${offset:06x} (score: {score})")


if __name__ == '__main__':
	main()
