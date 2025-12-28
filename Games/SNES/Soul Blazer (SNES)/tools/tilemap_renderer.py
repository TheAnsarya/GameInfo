#!/usr/bin/env python3
"""
Soul Blazer (SNES) Tilemap Renderer
Renders full map images from tileset and tilemap data.
"""

import json
import struct
from pathlib import Path
from typing import Optional
from dataclasses import dataclass

try:
	from PIL import Image
except ImportError:
	print("PIL (Pillow) required: pip install Pillow")
	raise


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
MAPS_DIR = ASSETS_DIR / "maps"
PALETTES_FILE = ASSETS_DIR / "palettes" / "palettes.json"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


@dataclass
class TilemapEntry:
	"""Represents a single tilemap entry."""
	tile_num: int		# 0-1023
	palette: int		# 0-7
	priority: bool		# BG priority
	flip_x: bool		# Horizontal flip
	flip_y: bool		# Vertical flip

	@classmethod
	def from_word(cls, word: int) -> 'TilemapEntry':
		"""Parse SNES tilemap word."""
		return cls(
			tile_num=word & 0x3ff,
			palette=(word >> 10) & 0x7,
			priority=bool(word & 0x2000),
			flip_x=bool(word & 0x4000),
			flip_y=bool(word & 0x8000)
		)


class TilemapRenderer:
	"""Renders SNES tilemaps to images."""

	def __init__(self, rom_path: str = None):
		"""Initialize renderer with optional ROM path."""
		self.rom_data: Optional[bytes] = None
		self.palettes: list = []
		self.tilesets: dict[int, bytes] = {}

		if rom_path:
			self.load_rom(rom_path)

		self._load_palettes()

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def _load_palettes(self) -> None:
		"""Load extracted palettes."""
		if not PALETTES_FILE.exists():
			# Use default grayscale
			self.palettes = [[(i * 17, i * 17, i * 17) for i in range(16)]] * 8
			return

		with open(PALETTES_FILE, 'r') as f:
			data = json.load(f)

		for pal_data in data.get('palettes', []):
			colors = pal_data.get('colors_rgb', [])
			palette = []
			for color in colors[:16]:
				if isinstance(color, list) and len(color) >= 3:
					palette.append((color[0], color[1], color[2]))
				else:
					palette.append((0, 0, 0))
			while len(palette) < 16:
				palette.append((0, 0, 0))
			self.palettes.append(palette)

	def get_palette(self, index: int) -> list[tuple[int, int, int]]:
		"""Get palette by index."""
		if 0 <= index < len(self.palettes):
			return self.palettes[index]
		return [(i * 17, i * 17, i * 17) for i in range(16)]

	def decode_4bpp_tile(self, data: bytes, offset: int = 0) -> list[list[int]]:
		"""Decode 8x8 4BPP tile."""
		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
			bp0 = data[offset + row * 2] if offset + row * 2 < len(data) else 0
			bp1 = data[offset + row * 2 + 1] if offset + row * 2 + 1 < len(data) else 0
			bp2 = data[offset + 16 + row * 2] if offset + 16 + row * 2 < len(data) else 0
			bp3 = data[offset + 16 + row * 2 + 1] if offset + 16 + row * 2 + 1 < len(data) else 0

			for col in range(8):
				bit = 7 - col
				pixel = ((bp0 >> bit) & 1)
				pixel |= ((bp1 >> bit) & 1) << 1
				pixel |= ((bp2 >> bit) & 1) << 2
				pixel |= ((bp3 >> bit) & 1) << 3
				tile[row][col] = pixel

		return tile

	def render_tile(
		self,
		tileset_data: bytes,
		tile_num: int,
		palette: list[tuple[int, int, int]],
		flip_x: bool = False,
		flip_y: bool = False
	) -> Image.Image:
		"""Render a single tile to image."""
		offset = tile_num * 32
		tile_data = self.decode_4bpp_tile(tileset_data, offset)

		img = Image.new('RGBA', (8, 8))
		pixels = img.load()

		for y in range(8):
			for x in range(8):
				src_y = 7 - y if flip_y else y
				src_x = 7 - x if flip_x else x
				color_idx = tile_data[src_y][src_x]

				# Color 0 is transparent
				if color_idx == 0:
					pixels[x, y] = (0, 0, 0, 0)
				else:
					r, g, b = palette[color_idx]
					pixels[x, y] = (r, g, b, 255)

		return img

	def render_tilemap(
		self,
		tileset_data: bytes,
		tilemap_data: bytes,
		width_tiles: int,
		height_tiles: int,
		bg_palettes: list[list[tuple[int, int, int]]] = None
	) -> Image.Image:
		"""Render full tilemap to image."""
		if bg_palettes is None:
			bg_palettes = [self.get_palette(i) for i in range(8)]

		# Create output image
		img_width = width_tiles * 8
		img_height = height_tiles * 8
		img = Image.new('RGBA', (img_width, img_height), (0, 0, 0, 255))

		# Parse and render each tilemap entry
		for ty in range(height_tiles):
			for tx in range(width_tiles):
				offset = (ty * width_tiles + tx) * 2
				if offset + 1 >= len(tilemap_data):
					continue

				word = tilemap_data[offset] | (tilemap_data[offset + 1] << 8)
				entry = TilemapEntry.from_word(word)

				# Get palette for this tile
				palette = bg_palettes[entry.palette % len(bg_palettes)]

				# Render tile
				tile_img = self.render_tile(
					tileset_data,
					entry.tile_num,
					palette,
					entry.flip_x,
					entry.flip_y
				)

				# Paste to output
				img.paste(tile_img, (tx * 8, ty * 8), tile_img)

		return img

	def extract_tileset_from_rom(self, bank: int, offset: int = 0, size: int = 0x4000) -> bytes:
		"""Extract tileset data from ROM bank."""
		if not self.rom_data:
			return b''

		# LoROM bank addressing
		rom_offset = bank * 0x8000 + offset
		return self.rom_data[rom_offset:rom_offset + size]

	def extract_tilemap_from_rom(self, bank: int, offset: int, size: int) -> bytes:
		"""Extract tilemap data from ROM."""
		if not self.rom_data:
			return b''

		rom_offset = bank * 0x8000 + offset
		return self.rom_data[rom_offset:rom_offset + size]

	def render_map_from_rom(
		self,
		tileset_bank: int,
		tilemap_bank: int,
		tilemap_offset: int,
		width_tiles: int,
		height_tiles: int,
		palette_indices: list[int] = None
	) -> Image.Image:
		"""Render a map directly from ROM data."""
		tileset_data = self.extract_tileset_from_rom(tileset_bank)
		tilemap_size = width_tiles * height_tiles * 2
		tilemap_data = self.extract_tilemap_from_rom(tilemap_bank, tilemap_offset, tilemap_size)

		if palette_indices:
			bg_palettes = [self.get_palette(i) for i in palette_indices]
		else:
			bg_palettes = None

		return self.render_tilemap(tileset_data, tilemap_data, width_tiles, height_tiles, bg_palettes)


class MapDatabase:
	"""Database of known Soul Blazer maps."""

	# Known map locations (approximations based on analysis)
	MAPS = {
		"Grass Valley Shrine": {
			"tileset_bank": 0x10,
			"tilemap_bank": 0x18,
			"tilemap_offset": 0x0000,
			"width": 32,
			"height": 32,
			"palettes": [0, 1, 2, 3, 4, 5, 6, 7]
		},
		"Underground Castle B1": {
			"tileset_bank": 0x10,
			"tilemap_bank": 0x18,
			"tilemap_offset": 0x0800,
			"width": 64,
			"height": 32,
			"palettes": [6, 7, 8, 9, 10, 11, 12, 13]
		},
		"GreenWood": {
			"tileset_bank": 0x11,
			"tilemap_bank": 0x18,
			"tilemap_offset": 0x1800,
			"width": 64,
			"height": 64,
			"palettes": [18, 19, 20, 21, 22, 23, 24, 25]
		},
		"St. Elles Seabed": {
			"tileset_bank": 0x12,
			"tilemap_bank": 0x19,
			"tilemap_offset": 0x0000,
			"width": 64,
			"height": 64,
			"palettes": [33, 34, 35, 36, 37, 38, 39, 40]
		},
		"Mountain of Souls": {
			"tileset_bank": 0x13,
			"tilemap_bank": 0x19,
			"tilemap_offset": 0x2000,
			"width": 64,
			"height": 48,
			"palettes": [48, 49, 50, 51, 52, 53, 54, 55]
		},
		"Leo's Lab": {
			"tileset_bank": 0x14,
			"tilemap_bank": 0x1A,
			"tilemap_offset": 0x0000,
			"width": 32,
			"height": 32,
			"palettes": [60, 61, 62, 63, 64, 65, 66, 67]
		},
		"Magridd Castle": {
			"tileset_bank": 0x14,
			"tilemap_bank": 0x1A,
			"tilemap_offset": 0x1000,
			"width": 64,
			"height": 64,
			"palettes": [75, 76, 77, 78, 79, 80, 81, 82]
		},
	}

	@classmethod
	def get_map_info(cls, name: str) -> dict:
		"""Get map information by name."""
		return cls.MAPS.get(name, {})

	@classmethod
	def list_maps(cls) -> list[str]:
		"""List all known map names."""
		return list(cls.MAPS.keys())


def render_all_known_maps(output_dir: Path, rom_path: str = None):
	"""Render all known maps to PNG files."""
	if rom_path is None:
		rom_path = str(DEFAULT_ROM)

	renderer = TilemapRenderer(rom_path)
	output_dir = Path(output_dir)
	output_dir.mkdir(parents=True, exist_ok=True)

	for map_name in MapDatabase.list_maps():
		info = MapDatabase.get_map_info(map_name)
		if not info:
			continue

		print(f"Rendering {map_name}...")

		try:
			img = renderer.render_map_from_rom(
				tileset_bank=info["tileset_bank"],
				tilemap_bank=info["tilemap_bank"],
				tilemap_offset=info["tilemap_offset"],
				width_tiles=info["width"],
				height_tiles=info["height"],
				palette_indices=info.get("palettes")
			)

			# Sanitize filename
			filename = map_name.replace(" ", "_").replace("'", "").replace(":", "") + ".png"
			img.save(output_dir / filename)
			print(f"  Saved: {filename} ({img.width}x{img.height})")

		except Exception as e:
			print(f"  Error: {e}")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Tilemap Renderer")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(ASSETS_DIR / "map_renders"))
	parser.add_argument("--map", "-m", help="Specific map name to render")
	parser.add_argument("--list", "-l", action="store_true", help="List known maps")
	parser.add_argument("--all", "-a", action="store_true", help="Render all known maps")

	args = parser.parse_args()

	if args.list:
		print("Known maps:")
		for name in MapDatabase.list_maps():
			info = MapDatabase.get_map_info(name)
			print(f"  {name}: {info['width']}x{info['height']} tiles")
		return

	if args.all:
		render_all_known_maps(Path(args.output), args.rom)
		return

	if args.map:
		info = MapDatabase.get_map_info(args.map)
		if not info:
			print(f"Unknown map: {args.map}")
			print("Use --list to see available maps")
			return

		renderer = TilemapRenderer(args.rom)
		img = renderer.render_map_from_rom(
			tileset_bank=info["tileset_bank"],
			tilemap_bank=info["tilemap_bank"],
			tilemap_offset=info["tilemap_offset"],
			width_tiles=info["width"],
			height_tiles=info["height"],
			palette_indices=info.get("palettes")
		)

		output_dir = Path(args.output)
		output_dir.mkdir(parents=True, exist_ok=True)
		filename = args.map.replace(" ", "_").replace("'", "") + ".png"
		img.save(output_dir / filename)
		print(f"Saved: {output_dir / filename}")

	else:
		# Default: show help and stats
		parser.print_help()
		print(f"\nROM: {args.rom}")
		print(f"Known maps: {len(MapDatabase.list_maps())}")


if __name__ == "__main__":
	main()
