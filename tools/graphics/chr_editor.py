#!/usr/bin/env python3
"""
CHR Editor - NES Character/Tile Graphics Editor

Edit CHR ROM data with support for:
- 2bpp NES tiles
- Palette preview
- Tile arrangement
- Import/export formats

C# equivalent: GameInfoTools.Graphics.ChrEditor
"""

import argparse
import json
import struct
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Try to import tkinter for GUI mode
try:
	import tkinter as tk
	from tkinter import ttk, filedialog, messagebox, colorchooser
	HAS_TK = True
except ImportError:
	HAS_TK = False

# Try to import PIL for image export
try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class NESPalette:
	"""NES color palette."""

	# Standard NES palette (RGB values)
	NES_COLORS = [
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

	def __init__(self, colors: Optional[List[int]] = None):
		"""Initialize with 4 palette indices."""
		self.indices = colors if colors else [0x0F, 0x00, 0x10, 0x30]

	def get_colors(self) -> List[Tuple[int, int, int]]:
		"""Get RGB colors for palette."""
		return [self.NES_COLORS[i & 0x3F] for i in self.indices]

	def set_color(self, index: int, color_index: int):
		"""Set a palette entry."""
		if 0 <= index < 4:
			self.indices[index] = color_index & 0x3F


class Tile:
	"""8x8 NES tile."""

	def __init__(self, data: Optional[bytes] = None):
		"""Initialize tile from 16 bytes of CHR data."""
		self.pixels = [[0] * 8 for _ in range(8)]

		if data and len(data) >= 16:
			# Decode 2bpp planar format
			for y in range(8):
				plane0 = data[y]
				plane1 = data[y + 8]
				for x in range(8):
					bit0 = (plane0 >> (7 - x)) & 1
					bit1 = (plane1 >> (7 - x)) & 1
					self.pixels[y][x] = bit0 | (bit1 << 1)

	def to_bytes(self) -> bytes:
		"""Convert tile back to 16 bytes."""
		result = bytearray(16)

		for y in range(8):
			plane0 = 0
			plane1 = 0
			for x in range(8):
				pixel = self.pixels[y][x]
				if pixel & 1:
					plane0 |= (1 << (7 - x))
				if pixel & 2:
					plane1 |= (1 << (7 - x))
			result[y] = plane0
			result[y + 8] = plane1

		return bytes(result)

	def get_pixel(self, x: int, y: int) -> int:
		"""Get pixel value (0-3)."""
		return self.pixels[y][x]

	def set_pixel(self, x: int, y: int, value: int):
		"""Set pixel value (0-3)."""
		self.pixels[y][x] = value & 3

	def flip_horizontal(self):
		"""Flip tile horizontally."""
		for y in range(8):
			self.pixels[y] = self.pixels[y][::-1]

	def flip_vertical(self):
		"""Flip tile vertically."""
		self.pixels = self.pixels[::-1]

	def rotate_90(self):
		"""Rotate tile 90 degrees clockwise."""
		new_pixels = [[0] * 8 for _ in range(8)]
		for y in range(8):
			for x in range(8):
				new_pixels[x][7 - y] = self.pixels[y][x]
		self.pixels = new_pixels

	def to_ascii(self, chars: str = " .#@") -> str:
		"""Convert to ASCII art."""
		lines = []
		for y in range(8):
			line = ""
			for x in range(8):
				line += chars[self.pixels[y][x]]
			lines.append(line)
		return "\n".join(lines)


class CHRData:
	"""CHR ROM data manager."""

	def __init__(self, data: Optional[bytes] = None):
		self.tiles: List[Tile] = []

		if data:
			self.load_from_bytes(data)

	def load_from_bytes(self, data: bytes):
		"""Load tiles from raw CHR data."""
		self.tiles = []
		num_tiles = len(data) // 16

		for i in range(num_tiles):
			tile_data = data[i * 16:(i + 1) * 16]
			self.tiles.append(Tile(tile_data))

	def to_bytes(self) -> bytes:
		"""Convert all tiles to bytes."""
		result = bytearray()
		for tile in self.tiles:
			result.extend(tile.to_bytes())
		return bytes(result)

	def get_tile(self, index: int) -> Optional[Tile]:
		"""Get tile by index."""
		if 0 <= index < len(self.tiles):
			return self.tiles[index]
		return None

	def set_tile(self, index: int, tile: Tile):
		"""Set tile at index."""
		if 0 <= index < len(self.tiles):
			self.tiles[index] = tile

	def add_tile(self, tile: Optional[Tile] = None):
		"""Add a new tile."""
		self.tiles.append(tile if tile else Tile())

	def copy_tile(self, from_index: int, to_index: int):
		"""Copy tile from one index to another."""
		if 0 <= from_index < len(self.tiles) and 0 <= to_index < len(self.tiles):
			source = self.tiles[from_index]
			new_tile = Tile(source.to_bytes())
			self.tiles[to_index] = new_tile

	def swap_tiles(self, index1: int, index2: int):
		"""Swap two tiles."""
		if 0 <= index1 < len(self.tiles) and 0 <= index2 < len(self.tiles):
			self.tiles[index1], self.tiles[index2] = self.tiles[index2], self.tiles[index1]


class CHRFile:
	"""CHR file handler."""

	@staticmethod
	def load(file_path: Path) -> CHRData:
		"""Load CHR data from file."""
		data = file_path.read_bytes()

		# Check for NES ROM (extract CHR)
		if data[:4] == b'NES\x1a':
			prg_size = data[4] * 0x4000
			chr_start = 16 + prg_size
			chr_size = data[5] * 0x2000
			if chr_size > 0:
				data = data[chr_start:chr_start + chr_size]
			else:
				raise ValueError("ROM has no CHR ROM (uses CHR RAM)")

		return CHRData(data)

	@staticmethod
	def save(chr_data: CHRData, file_path: Path):
		"""Save CHR data to file."""
		file_path.write_bytes(chr_data.to_bytes())

	@staticmethod
	def export_image(
		chr_data: CHRData,
		output_path: Path,
		palette: NESPalette,
		tiles_per_row: int = 16,
		scale: int = 1,
	):
		"""Export CHR data as image."""
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow required for image export")

		num_tiles = len(chr_data.tiles)
		if num_tiles == 0:
			raise ValueError("No tiles to export")

		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
		width = tiles_per_row * 8 * scale
		height = rows * 8 * scale

		colors = palette.get_colors()
		image = Image.new("RGB", (width, height), colors[0])
		pixels = image.load()

		for tile_idx, tile in enumerate(chr_data.tiles):
			tile_x = (tile_idx % tiles_per_row) * 8 * scale
			tile_y = (tile_idx // tiles_per_row) * 8 * scale

			for y in range(8):
				for x in range(8):
					color = colors[tile.get_pixel(x, y)]
					for sy in range(scale):
						for sx in range(scale):
							px = tile_x + x * scale + sx
							py = tile_y + y * scale + sy
							if px < width and py < height:
								pixels[px, py] = color

		image.save(output_path)

	@staticmethod
	def import_image(
		image_path: Path,
		palette: NESPalette,
		tolerance: int = 32,
	) -> CHRData:
		"""Import CHR data from image."""
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow required for image import")

		image = Image.open(image_path).convert("RGB")
		width, height = image.size
		pixels = image.load()

		# Get palette colors
		colors = palette.get_colors()

		def find_closest_color(rgb: Tuple[int, int, int]) -> int:
			"""Find closest palette color."""
			best_idx = 0
			best_dist = float('inf')

			for i, color in enumerate(colors):
				dist = sum((a - b) ** 2 for a, b in zip(rgb, color))
				if dist < best_dist:
					best_dist = dist
					best_idx = i

			return best_idx

		# Convert image to tiles
		chr_data = CHRData()
		tiles_x = width // 8
		tiles_y = height // 8

		for ty in range(tiles_y):
			for tx in range(tiles_x):
				tile = Tile()
				for y in range(8):
					for x in range(8):
						px = tx * 8 + x
						py = ty * 8 + y
						if px < width and py < height:
							rgb = pixels[px, py]
							tile.set_pixel(x, y, find_closest_color(rgb))
				chr_data.tiles.append(tile)

		return chr_data


def show_chr_info(chr_data: CHRData) -> str:
	"""Show CHR data information."""
	lines = [
		"CHR Data Information",
		"=" * 40,
		f"Total tiles: {len(chr_data.tiles)}",
		f"Size: {len(chr_data.tiles) * 16} bytes ({len(chr_data.tiles) * 16 / 1024:.1f} KB)",
		f"Equivalent to: {len(chr_data.tiles) / 256:.1f} pattern tables",
	]

	# Count unique tiles
	unique = set()
	for tile in chr_data.tiles:
		unique.add(tile.to_bytes())
	lines.append(f"Unique tiles: {len(unique)}")

	# Count empty tiles
	empty_tile = bytes(16)
	empty_count = sum(1 for tile in chr_data.tiles if tile.to_bytes() == empty_tile)
	lines.append(f"Empty tiles: {empty_count}")

	return "\n".join(lines)


def show_tile(tile: Tile, palette: NESPalette) -> str:
	"""Show tile as ASCII art with palette info."""
	lines = []

	# ASCII representation
	lines.append(tile.to_ascii())
	lines.append("")

	# Hex dump
	data = tile.to_bytes()
	lines.append("Hex data:")
	lines.append(f"  Plane 0: {data[:8].hex(' ').upper()}")
	lines.append(f"  Plane 1: {data[8:].hex(' ').upper()}")

	return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="CHR Editor - NES Character/Tile Graphics Editor",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Show CHR info
	python chr_editor.py info game.chr

	# Extract CHR from NES ROM
	python chr_editor.py extract game.nes -o chr_data.chr

	# Show specific tile
	python chr_editor.py tile game.chr 0x10

	# Export as PNG
	python chr_editor.py export game.chr -o tiles.png --scale 2

	# Import from PNG
	python chr_editor.py import tiles.png -o new.chr

	# Copy tiles
	python chr_editor.py copy game.chr --from 0 --to 16 --count 16 -o modified.chr

	# Launch GUI (if available)
	python chr_editor.py gui game.chr
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Info command
	info_parser = subparsers.add_parser("info", help="Show CHR info")
	info_parser.add_argument("input", help="Input CHR or NES file")

	# Extract command
	extract_parser = subparsers.add_parser("extract", help="Extract CHR from NES ROM")
	extract_parser.add_argument("input", help="Input NES ROM")
	extract_parser.add_argument("-o", "--output", required=True, help="Output CHR file")

	# Tile command
	tile_parser = subparsers.add_parser("tile", help="Show specific tile")
	tile_parser.add_argument("input", help="Input CHR file")
	tile_parser.add_argument("index", help="Tile index (hex or decimal)")

	# Export command
	export_parser = subparsers.add_parser("export", help="Export as image")
	export_parser.add_argument("input", help="Input CHR file")
	export_parser.add_argument("-o", "--output", required=True, help="Output image file")
	export_parser.add_argument("--palette", default="0F,00,10,30", help="Palette colors (4 hex values)")
	export_parser.add_argument("--scale", type=int, default=1, help="Scale factor")
	export_parser.add_argument("--columns", type=int, default=16, help="Tiles per row")

	# Import command
	import_parser = subparsers.add_parser("import", help="Import from image")
	import_parser.add_argument("input", help="Input image file")
	import_parser.add_argument("-o", "--output", required=True, help="Output CHR file")
	import_parser.add_argument("--palette", default="0F,00,10,30", help="Palette colors")

	# Copy command
	copy_parser = subparsers.add_parser("copy", help="Copy tiles within CHR")
	copy_parser.add_argument("input", help="Input CHR file")
	copy_parser.add_argument("--from", dest="from_idx", required=True, help="Source index")
	copy_parser.add_argument("--to", dest="to_idx", required=True, help="Destination index")
	copy_parser.add_argument("--count", type=int, default=1, help="Number of tiles")
	copy_parser.add_argument("-o", "--output", required=True, help="Output CHR file")

	# GUI command
	gui_parser = subparsers.add_parser("gui", help="Launch GUI editor")
	gui_parser.add_argument("input", nargs="?", help="Input CHR file")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	def parse_palette(palette_str: str) -> NESPalette:
		"""Parse palette string."""
		colors = [int(c.strip(), 16) for c in palette_str.split(",")]
		return NESPalette(colors)

	try:
		if args.command == "info":
			chr_data = CHRFile.load(Path(args.input))
			print(show_chr_info(chr_data))

		elif args.command == "extract":
			input_path = Path(args.input)
			data = input_path.read_bytes()

			if data[:4] != b'NES\x1a':
				print("Error: Not an NES ROM file", file=sys.stderr)
				return 1

			prg_size = data[4] * 0x4000
			chr_size = data[5] * 0x2000

			if chr_size == 0:
				print("Error: ROM has no CHR ROM", file=sys.stderr)
				return 1

			chr_start = 16 + prg_size
			chr_data = data[chr_start:chr_start + chr_size]

			output_path = Path(args.output)
			output_path.write_bytes(chr_data)
			print(f"Extracted {chr_size} bytes ({chr_size // 16} tiles)")
			print(f"Saved: {output_path}")

		elif args.command == "tile":
			chr_data = CHRFile.load(Path(args.input))
			index = int(args.index, 16) if args.index.startswith("0x") else int(args.index)

			tile = chr_data.get_tile(index)
			if not tile:
				print(f"Error: Tile index {index} out of range (0-{len(chr_data.tiles) - 1})")
				return 1

			palette = NESPalette()
			print(f"\nTile ${index:02X} ({index}):\n")
			print(show_tile(tile, palette))

		elif args.command == "export":
			if not HAS_PIL:
				print("Error: PIL/Pillow required for image export", file=sys.stderr)
				print("Install with: pip install Pillow", file=sys.stderr)
				return 1

			chr_data = CHRFile.load(Path(args.input))
			palette = parse_palette(args.palette)

			output_path = Path(args.output)
			CHRFile.export_image(chr_data, output_path, palette, args.columns, args.scale)
			print(f"Exported {len(chr_data.tiles)} tiles to {output_path}")

		elif args.command == "import":
			if not HAS_PIL:
				print("Error: PIL/Pillow required for image import", file=sys.stderr)
				return 1

			palette = parse_palette(args.palette)
			chr_data = CHRFile.import_image(Path(args.input), palette)

			output_path = Path(args.output)
			CHRFile.save(chr_data, output_path)
			print(f"Imported {len(chr_data.tiles)} tiles to {output_path}")

		elif args.command == "copy":
			chr_data = CHRFile.load(Path(args.input))

			from_idx = int(args.from_idx, 16) if args.from_idx.startswith("0x") else int(args.from_idx)
			to_idx = int(args.to_idx, 16) if args.to_idx.startswith("0x") else int(args.to_idx)

			for i in range(args.count):
				chr_data.copy_tile(from_idx + i, to_idx + i)

			output_path = Path(args.output)
			CHRFile.save(chr_data, output_path)
			print(f"Copied {args.count} tiles from {from_idx} to {to_idx}")
			print(f"Saved: {output_path}")

		elif args.command == "gui":
			if not HAS_TK:
				print("Error: tkinter required for GUI mode", file=sys.stderr)
				return 1

			print("GUI mode not fully implemented in this version")
			print("Use command-line options instead")
			return 1

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
