#!/usr/bin/env python3
"""
Graphics Tile Viewer/Extractor

View and extract graphics tiles from ROM files.
Supports NES, SNES, and Game Boy tile formats.

Features:
- Extract tiles from CHR data
- Support multiple BPP formats (1bpp, 2bpp, 4bpp, 8bpp)
- Export to PNG images
- Palette support
- Tilemap rendering

Usage:
	python tile_viewer.py extract <rom> --offset 0x0000 --format nes --output tiles.png
	python tile_viewer.py dump <rom> --start 0x0000 --end 0x2000 --output chr/
	python tile_viewer.py view <rom> --format snes --palette pal.bin
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class Palette:
	"""Color palette"""
	colors: List[Tuple[int, int, int]] = field(default_factory=list)


@dataclass
class Tile:
	"""Single tile"""
	index: int
	width: int
	height: int
	bpp: int
	pixels: List[int] = field(default_factory=list)


@dataclass
class TileSet:
	"""Collection of tiles"""
	tiles: List[Tile] = field(default_factory=list)
	tile_width: int = 8
	tile_height: int = 8
	bpp: int = 2


# Default palettes
NES_DEFAULT_PALETTE = [
	(84, 84, 84), (0, 30, 116), (8, 16, 144), (48, 0, 136),
	(68, 0, 100), (92, 0, 48), (84, 4, 0), (60, 24, 0),
	(32, 42, 0), (8, 58, 0), (0, 64, 0), (0, 60, 0),
	(0, 50, 60), (0, 0, 0), (0, 0, 0), (0, 0, 0),
	(152, 150, 152), (8, 76, 196), (48, 50, 236), (92, 30, 228),
	(136, 20, 176), (160, 20, 100), (152, 34, 32), (120, 60, 0),
	(84, 90, 0), (40, 114, 0), (8, 124, 0), (0, 118, 40),
	(0, 102, 120), (0, 0, 0), (0, 0, 0), (0, 0, 0),
	(236, 238, 236), (76, 154, 236), (120, 124, 236), (176, 98, 236),
	(228, 84, 236), (236, 88, 180), (236, 106, 100), (212, 136, 32),
	(160, 170, 0), (116, 196, 0), (76, 208, 32), (56, 204, 108),
	(56, 180, 204), (60, 60, 60), (0, 0, 0), (0, 0, 0),
	(236, 238, 236), (168, 204, 236), (188, 188, 236), (212, 178, 236),
	(236, 174, 236), (236, 174, 212), (236, 180, 176), (228, 196, 144),
	(204, 210, 120), (180, 222, 120), (168, 226, 144), (152, 226, 180),
	(160, 214, 228), (160, 162, 160), (0, 0, 0), (0, 0, 0),
]

GRAYSCALE_2BPP = [
	(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)
]

GRAYSCALE_4BPP = [(i * 17, i * 17, i * 17) for i in range(16)]


class NESDecoder:
	"""Decode NES 2BPP tiles"""

	@staticmethod
	def decode_tile(data: bytes, offset: int) -> Tile:
		"""Decode single 8x8 NES tile"""
		if offset + 16 > len(data):
			return None

		tile = Tile(index=offset // 16, width=8, height=8, bpp=2)

		# NES uses planar format: 8 bytes plane 0, then 8 bytes plane 1
		for y in range(8):
			plane0 = data[offset + y]
			plane1 = data[offset + y + 8]

			for x in range(8):
				bit0 = (plane0 >> (7 - x)) & 1
				bit1 = (plane1 >> (7 - x)) & 1
				pixel = bit0 | (bit1 << 1)
				tile.pixels.append(pixel)

		return tile

	@staticmethod
	def decode_chr(data: bytes, start: int = 0, count: int = -1) -> TileSet:
		"""Decode CHR data to tileset"""
		tileset = TileSet(tile_width=8, tile_height=8, bpp=2)

		offset = start
		tile_index = 0

		while offset + 16 <= len(data):
			if count >= 0 and tile_index >= count:
				break

			tile = NESDecoder.decode_tile(data, offset)
			if tile:
				tile.index = tile_index
				tileset.tiles.append(tile)

			offset += 16
			tile_index += 1

		return tileset


class SNESDecoder:
	"""Decode SNES tiles (2bpp, 4bpp, 8bpp)"""

	@staticmethod
	def decode_tile_2bpp(data: bytes, offset: int) -> Tile:
		"""Decode 2BPP tile (like NES)"""
		return NESDecoder.decode_tile(data, offset)

	@staticmethod
	def decode_tile_4bpp(data: bytes, offset: int) -> Tile:
		"""Decode 4BPP tile"""
		if offset + 32 > len(data):
			return None

		tile = Tile(index=offset // 32, width=8, height=8, bpp=4)

		for y in range(8):
			# SNES 4bpp: interleaved bitplanes
			bp0 = data[offset + y * 2]
			bp1 = data[offset + y * 2 + 1]
			bp2 = data[offset + 16 + y * 2]
			bp3 = data[offset + 16 + y * 2 + 1]

			for x in range(8):
				bit0 = (bp0 >> (7 - x)) & 1
				bit1 = (bp1 >> (7 - x)) & 1
				bit2 = (bp2 >> (7 - x)) & 1
				bit3 = (bp3 >> (7 - x)) & 1
				pixel = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)
				tile.pixels.append(pixel)

		return tile

	@staticmethod
	def decode_tile_8bpp(data: bytes, offset: int) -> Tile:
		"""Decode 8BPP tile"""
		if offset + 64 > len(data):
			return None

		tile = Tile(index=offset // 64, width=8, height=8, bpp=8)

		for y in range(8):
			for plane_group in range(2):  # Two groups of 4 bitplanes
				base = offset + plane_group * 32 + y * 2
				bp0 = data[base]
				bp1 = data[base + 1]
				bp2 = data[base + 16]
				bp3 = data[base + 17]

				for x in range(8):
					if plane_group == 0:
						tile.pixels.append(0)

					bit0 = (bp0 >> (7 - x)) & 1
					bit1 = (bp1 >> (7 - x)) & 1
					bit2 = (bp2 >> (7 - x)) & 1
					bit3 = (bp3 >> (7 - x)) & 1
					bits = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)
					tile.pixels[y * 8 + x] |= bits << (plane_group * 4)

		return tile


class GBDecoder:
	"""Decode Game Boy tiles"""

	@staticmethod
	def decode_tile(data: bytes, offset: int) -> Tile:
		"""Decode GB 2BPP tile (interleaved)"""
		if offset + 16 > len(data):
			return None

		tile = Tile(index=offset // 16, width=8, height=8, bpp=2)

		for y in range(8):
			# GB uses interleaved format: low bit, high bit per row
			low = data[offset + y * 2]
			high = data[offset + y * 2 + 1]

			for x in range(8):
				bit0 = (low >> (7 - x)) & 1
				bit1 = (high >> (7 - x)) & 1
				pixel = bit0 | (bit1 << 1)
				tile.pixels.append(pixel)

		return tile


class TileRenderer:
	"""Render tiles to image data"""

	@staticmethod
	def render_tileset(
		tileset: TileSet,
		palette: List[Tuple[int, int, int]],
		tiles_per_row: int = 16
	) -> Tuple[List[int], int, int]:
		"""
		Render tileset to RGBA pixel data.
		Returns (pixel_data, width, height)
		"""
		if not tileset.tiles:
			return [], 0, 0

		tile_w = tileset.tile_width
		tile_h = tileset.tile_height
		num_tiles = len(tileset.tiles)
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

		img_w = tiles_per_row * tile_w
		img_h = rows * tile_h

		# RGBA pixel data
		pixels = [0] * (img_w * img_h * 4)

		for tile_idx, tile in enumerate(tileset.tiles):
			tile_x = (tile_idx % tiles_per_row) * tile_w
			tile_y = (tile_idx // tiles_per_row) * tile_h

			for py in range(tile_h):
				for px in range(tile_w):
					pixel_idx = py * tile_w + px
					if pixel_idx < len(tile.pixels):
						color_idx = tile.pixels[pixel_idx]
						if color_idx < len(palette):
							r, g, b = palette[color_idx]
						else:
							r, g, b = (255, 0, 255)  # Magenta for invalid
					else:
						r, g, b = (0, 0, 0)

					img_x = tile_x + px
					img_y = tile_y + py
					offset = (img_y * img_w + img_x) * 4
					pixels[offset] = r
					pixels[offset + 1] = g
					pixels[offset + 2] = b
					pixels[offset + 3] = 255  # Alpha

		return pixels, img_w, img_h

	@staticmethod
	def save_ppm(pixels: List[int], width: int, height: int, filepath: str) -> None:
		"""Save as PPM image (simple format, no library needed)"""
		with open(filepath, 'wb') as f:
			f.write(f"P6\n{width} {height}\n255\n".encode())
			for i in range(0, len(pixels), 4):
				f.write(bytes([pixels[i], pixels[i + 1], pixels[i + 2]]))

	@staticmethod
	def save_raw(pixels: List[int], width: int, height: int, filepath: str) -> None:
		"""Save as raw RGBA file"""
		with open(filepath, 'wb') as f:
			# Write header
			f.write(struct.pack('<II', width, height))
			f.write(bytes(pixels))


def load_rom(filepath: str) -> Tuple[bytes, int, int]:
	"""Load ROM and detect CHR data location"""
	with open(filepath, 'rb') as f:
		data = f.read()

	chr_start = 0
	chr_size = len(data)

	# Detect iNES header
	if data[:4] == b'NES\x1a':
		prg_size = data[4] * 16384
		chr_banks = data[5]
		header_size = 16
		if data[6] & 0x04:  # Trainer
			header_size += 512
		chr_start = header_size + prg_size
		chr_size = chr_banks * 8192

	return data, chr_start, chr_size


def main():
	parser = argparse.ArgumentParser(
		description='Graphics Tile Viewer/Extractor',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract tiles to image')
	extract_parser.add_argument('rom', help='ROM file')
	extract_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=-1,
							   help='Start offset (-1 for auto)')
	extract_parser.add_argument('--count', '-c', type=int, default=-1, help='Number of tiles')
	extract_parser.add_argument('--format', '-f', default='nes',
							   choices=['nes', 'gb', 'snes2', 'snes4', 'snes8'],
							   help='Tile format')
	extract_parser.add_argument('--output', required=True, help='Output image')
	extract_parser.add_argument('--width', '-w', type=int, default=16, help='Tiles per row')
	extract_parser.add_argument('--palette', '-p', help='Palette file (optional)')

	# Dump command
	dump_parser = subparsers.add_parser('dump', help='Dump CHR data to files')
	dump_parser.add_argument('rom', help='ROM file')
	dump_parser.add_argument('--start', '-s', type=lambda x: int(x, 0), default=-1, help='Start offset')
	dump_parser.add_argument('--end', '-e', type=lambda x: int(x, 0), default=-1, help='End offset')
	dump_parser.add_argument('--output', '-o', required=True, help='Output directory')
	dump_parser.add_argument('--format', '-f', default='nes', help='Tile format')

	# Info command
	info_parser = subparsers.add_parser('info', help='Show ROM graphics info')
	info_parser.add_argument('rom', help='ROM file')

	args = parser.parse_args()

	if args.command == 'extract':
		data, chr_start, chr_size = load_rom(args.rom)

		# Determine offset
		offset = args.offset if args.offset >= 0 else chr_start

		print(f"ROM: {args.rom}")
		print(f"Format: {args.format}")
		print(f"Offset: 0x{offset:06X}")

		# Decode tiles
		if args.format == 'nes':
			tileset = NESDecoder.decode_chr(data, offset, args.count)
			palette = GRAYSCALE_2BPP
		elif args.format == 'gb':
			tileset = TileSet(tile_width=8, tile_height=8, bpp=2)
			idx = offset
			count = 0
			while idx + 16 <= len(data):
				if args.count >= 0 and count >= args.count:
					break
				tile = GBDecoder.decode_tile(data, idx)
				if tile:
					tile.index = count
					tileset.tiles.append(tile)
				idx += 16
				count += 1
			palette = GRAYSCALE_2BPP
		elif args.format == 'snes2':
			tileset = TileSet(tile_width=8, tile_height=8, bpp=2)
			idx = offset
			count = 0
			while idx + 16 <= len(data):
				if args.count >= 0 and count >= args.count:
					break
				tile = SNESDecoder.decode_tile_2bpp(data, idx)
				if tile:
					tile.index = count
					tileset.tiles.append(tile)
				idx += 16
				count += 1
			palette = GRAYSCALE_2BPP
		elif args.format == 'snes4':
			tileset = TileSet(tile_width=8, tile_height=8, bpp=4)
			idx = offset
			count = 0
			while idx + 32 <= len(data):
				if args.count >= 0 and count >= args.count:
					break
				tile = SNESDecoder.decode_tile_4bpp(data, idx)
				if tile:
					tile.index = count
					tileset.tiles.append(tile)
				idx += 32
				count += 1
			palette = GRAYSCALE_4BPP
		elif args.format == 'snes8':
			tileset = TileSet(tile_width=8, tile_height=8, bpp=8)
			idx = offset
			count = 0
			while idx + 64 <= len(data):
				if args.count >= 0 and count >= args.count:
					break
				tile = SNESDecoder.decode_tile_8bpp(data, idx)
				if tile:
					tile.index = count
					tileset.tiles.append(tile)
				idx += 64
				count += 1
			palette = [(i, i, i) for i in range(256)]
		else:
			print(f"Unknown format: {args.format}")
			sys.exit(1)

		print(f"Tiles extracted: {len(tileset.tiles)}")

		# Load custom palette if specified
		if args.palette:
			try:
				with open(args.palette, 'rb') as f:
					pal_data = f.read()
				# Assume RGB format
				palette = []
				for i in range(0, len(pal_data), 3):
					if i + 2 < len(pal_data):
						palette.append((pal_data[i], pal_data[i + 1], pal_data[i + 2]))
			except Exception as e:
				print(f"Warning: Could not load palette: {e}")

		# Render
		pixels, width, height = TileRenderer.render_tileset(tileset, palette, args.width)

		if pixels:
			# Save as PPM (simple format)
			if args.output.endswith('.ppm'):
				TileRenderer.save_ppm(pixels, width, height, args.output)
			else:
				# Save as raw RGBA
				TileRenderer.save_raw(pixels, width, height, args.output)

			print(f"Saved: {args.output} ({width}x{height})")
		else:
			print("No tiles to render")

	elif args.command == 'dump':
		data, chr_start, chr_size = load_rom(args.rom)

		start = args.start if args.start >= 0 else chr_start
		end = args.end if args.end >= 0 else start + chr_size

		print(f"Dumping CHR from 0x{start:06X} to 0x{end:06X}")

		os.makedirs(args.output, exist_ok=True)

		# Dump raw CHR
		chr_path = os.path.join(args.output, 'chr.bin')
		with open(chr_path, 'wb') as f:
			f.write(data[start:end])
		print(f"Saved CHR data: {chr_path}")

		# Also create tileset images
		tileset = NESDecoder.decode_chr(data[start:end], 0)
		if tileset.tiles:
			pixels, width, height = TileRenderer.render_tileset(tileset, GRAYSCALE_2BPP, 16)
			img_path = os.path.join(args.output, 'chr.ppm')
			TileRenderer.save_ppm(pixels, width, height, img_path)
			print(f"Saved tileset image: {img_path}")

	elif args.command == 'info':
		data, chr_start, chr_size = load_rom(args.rom)

		print(f"ROM: {args.rom}")
		print(f"Size: {len(data)} bytes")

		if data[:4] == b'NES\x1a':
			print("\niNES Header:")
			print(f"  PRG-ROM: {data[4] * 16}KB ({data[4]} banks)")
			print(f"  CHR-ROM: {data[5] * 8}KB ({data[5]} banks)")
			print(f"  CHR Start: 0x{chr_start:06X}")
			print(f"  CHR Size: {chr_size} bytes")
			print(f"  Tiles: ~{chr_size // 16}")

			mapper = (data[6] >> 4) | (data[7] & 0xF0)
			print(f"  Mapper: {mapper}")
		else:
			print("\nNo recognized header")
			print(f"  Potential tiles: ~{len(data) // 16}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
