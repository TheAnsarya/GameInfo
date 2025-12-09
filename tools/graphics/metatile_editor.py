#!/usr/bin/env python3
"""
Metatile / Tilemap Editor

Edit and view metatiles (groups of tiles) and tilemaps.
Supports NES nametable format and custom metatile definitions.
"""

import argparse
import json
import struct
from pathlib import Path
from typing import List, Optional, Tuple

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class Metatile:
	"""Represents a metatile (group of tiles)."""

	def __init__(self, tile_ids: List[int] = None, attributes: int = 0):
		self.tile_ids = tile_ids or [0, 0, 0, 0]  # Default 2x2 metatile
		self.attributes = attributes
		self.palette = attributes & 0x03
		self.collision = 0
		self.properties = {}

	def set_2x2(self, tl: int, tr: int, bl: int, br: int):
		"""Set tiles for 2x2 metatile (top-left, top-right, bottom-left, bottom-right)."""
		self.tile_ids = [tl, tr, bl, br]

	def get_2x2(self) -> Tuple[int, int, int, int]:
		"""Get tiles for 2x2 metatile."""
		return tuple(self.tile_ids[:4])

	def to_dict(self) -> dict:
		return {
			"tiles": self.tile_ids,
			"attributes": self.attributes,
			"palette": self.palette,
			"collision": self.collision,
			"properties": self.properties,
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'Metatile':
		mt = cls(data.get("tiles", [0, 0, 0, 0]), data.get("attributes", 0))
		mt.palette = data.get("palette", mt.palette)
		mt.collision = data.get("collision", 0)
		mt.properties = data.get("properties", {})
		return mt


class Tilemap:
	"""Represents a tilemap/nametable."""

	def __init__(self, width: int = 32, height: int = 30):
		self.width = width
		self.height = height
		self.tiles = [[0] * width for _ in range(height)]
		self.attributes = [[0] * (width // 2) for _ in range(height // 2)]
		self.name = ""

	def get_tile(self, x: int, y: int) -> int:
		if 0 <= x < self.width and 0 <= y < self.height:
			return self.tiles[y][x]
		return 0

	def set_tile(self, x: int, y: int, tile_id: int):
		if 0 <= x < self.width and 0 <= y < self.height:
			self.tiles[y][x] = tile_id

	def get_attribute(self, x: int, y: int) -> int:
		"""Get palette attribute for 2x2 tile region."""
		ax = x // 2
		ay = y // 2
		if 0 <= ax < len(self.attributes[0]) and 0 <= ay < len(self.attributes):
			return self.attributes[ay][ax]
		return 0

	def set_attribute(self, x: int, y: int, palette: int):
		"""Set palette attribute for 2x2 tile region."""
		ax = x // 2
		ay = y // 2
		if 0 <= ax < len(self.attributes[0]) and 0 <= ay < len(self.attributes):
			self.attributes[ay][ax] = palette & 0x03

	def load_nes_nametable(self, data: bytes, offset: int = 0):
		"""Load NES nametable data (960 tiles + 64 attribute bytes)."""
		# Load tiles
		for y in range(30):
			for x in range(32):
				idx = offset + y * 32 + x
				if idx < len(data):
					self.tiles[y][x] = data[idx]

		# Load attributes
		attr_offset = offset + 960
		for ay in range(8):
			for ax in range(8):
				idx = attr_offset + ay * 8 + ax
				if idx < len(data):
					attr_byte = data[idx]
					# Each byte contains 4 2-bit palette values for 4 2x2 tile regions
					# Bits 0-1: top-left, 2-3: top-right, 4-5: bottom-left, 6-7: bottom-right
					for qy in range(2):
						for qx in range(2):
							shift = (qy * 2 + qx) * 2
							palette = (attr_byte >> shift) & 0x03
							map_ay = ay * 2 + qy
							map_ax = ax * 2 + qx
							if map_ay < len(self.attributes) and map_ax < len(self.attributes[0]):
								self.attributes[map_ay][map_ax] = palette

	def save_nes_nametable(self) -> bytes:
		"""Save as NES nametable data."""
		data = bytearray(1024)

		# Save tiles
		for y in range(min(30, self.height)):
			for x in range(min(32, self.width)):
				data[y * 32 + x] = self.tiles[y][x]

		# Save attributes
		for ay in range(8):
			for ax in range(8):
				attr_byte = 0
				for qy in range(2):
					for qx in range(2):
						map_ay = ay * 2 + qy
						map_ax = ax * 2 + qx
						if map_ay < len(self.attributes) and map_ax < len(self.attributes[0]):
							palette = self.attributes[map_ay][map_ax]
							shift = (qy * 2 + qx) * 2
							attr_byte |= (palette & 0x03) << shift
				data[960 + ay * 8 + ax] = attr_byte

		return bytes(data)

	def to_dict(self) -> dict:
		return {
			"name": self.name,
			"width": self.width,
			"height": self.height,
			"tiles": self.tiles,
			"attributes": self.attributes,
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'Tilemap':
		tm = cls(data.get("width", 32), data.get("height", 30))
		tm.name = data.get("name", "")
		tm.tiles = data.get("tiles", tm.tiles)
		tm.attributes = data.get("attributes", tm.attributes)
		return tm


class MetatileSet:
	"""Collection of metatiles."""

	def __init__(self):
		self.metatiles: List[Metatile] = []
		self.name = ""

	def add_metatile(self, metatile: Metatile):
		self.metatiles.append(metatile)

	def get_metatile(self, index: int) -> Optional[Metatile]:
		if 0 <= index < len(self.metatiles):
			return self.metatiles[index]
		return None

	def load_from_data(self, data: bytes, count: int, format_type: str = "2x2"):
		"""
		Load metatiles from binary data.

		Formats:
		- 2x2: 4 bytes per metatile (TL, TR, BL, BR)
		- 2x2_attr: 5 bytes per metatile (TL, TR, BL, BR, attr)
		"""
		offset = 0
		for _ in range(count):
			if format_type == "2x2":
				if offset + 4 > len(data):
					break
				tiles = list(data[offset:offset + 4])
				mt = Metatile(tiles)
				offset += 4
			elif format_type == "2x2_attr":
				if offset + 5 > len(data):
					break
				tiles = list(data[offset:offset + 4])
				attr = data[offset + 4]
				mt = Metatile(tiles, attr)
				offset += 5
			else:
				break

			self.metatiles.append(mt)

	def save_to_data(self, format_type: str = "2x2") -> bytes:
		"""Save metatiles to binary data."""
		result = bytearray()

		for mt in self.metatiles:
			if format_type == "2x2":
				result.extend(mt.tile_ids[:4])
			elif format_type == "2x2_attr":
				result.extend(mt.tile_ids[:4])
				result.append(mt.attributes)

		return bytes(result)

	def to_dict(self) -> dict:
		return {
			"name": self.name,
			"metatiles": [mt.to_dict() for mt in self.metatiles],
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'MetatileSet':
		mts = cls()
		mts.name = data.get("name", "")
		for mt_data in data.get("metatiles", []):
			mts.metatiles.append(Metatile.from_dict(mt_data))
		return mts


class TilemapRenderer:
	"""Render tilemaps and metatiles to images."""

	def __init__(self, chr_data: bytes = None):
		self.chr_data = chr_data
		self.palettes = [
			[(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)],
			[(0, 0, 0), (0, 85, 170), (0, 170, 255), (85, 255, 255)],
			[(0, 0, 0), (170, 85, 0), (255, 170, 0), (255, 255, 85)],
			[(0, 0, 0), (170, 0, 0), (255, 85, 85), (255, 170, 170)],
		]

	def load_chr(self, path: str):
		"""Load CHR data from file."""
		data = Path(path).read_bytes()

		# Check for NES ROM header
		if data[:4] == b'NES\x1a':
			prg_size = data[4] * 16384
			has_trainer = bool(data[6] & 0x04)
			chr_start = 16 + (512 if has_trainer else 0) + prg_size
			chr_size = data[5] * 8192
			self.chr_data = data[chr_start:chr_start + chr_size]
		else:
			self.chr_data = data

	def extract_tile(self, tile_id: int) -> List[List[int]]:
		"""Extract a single 8x8 tile."""
		if not self.chr_data:
			return [[0] * 8 for _ in range(8)]

		offset = tile_id * 16
		if offset + 16 > len(self.chr_data):
			return [[0] * 8 for _ in range(8)]

		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
			plane0 = self.chr_data[offset + row]
			plane1 = self.chr_data[offset + row + 8]

			for col in range(8):
				bit0 = (plane0 >> (7 - col)) & 1
				bit1 = (plane1 >> (7 - col)) & 1
				tile[row][col] = bit0 | (bit1 << 1)

		return tile

	def render_tile(self, tile_id: int, palette_idx: int = 0) -> Optional['Image.Image']:
		"""Render a single tile."""
		if not HAS_PIL:
			return None

		tile = self.extract_tile(tile_id)
		palette = self.palettes[palette_idx % len(self.palettes)]

		image = Image.new('RGB', (8, 8), (0, 0, 0))
		pixels = image.load()

		for y in range(8):
			for x in range(8):
				color_idx = tile[y][x]
				if color_idx < len(palette):
					pixels[x, y] = palette[color_idx]

		return image

	def render_metatile(self, metatile: Metatile, scale: int = 1) -> Optional['Image.Image']:
		"""Render a metatile (2x2 tiles)."""
		if not HAS_PIL:
			return None

		image = Image.new('RGB', (16 * scale, 16 * scale), (0, 0, 0))

		tiles = metatile.tile_ids[:4]
		positions = [(0, 0), (8, 0), (0, 8), (8, 8)]

		for i, (tile_id, (tx, ty)) in enumerate(zip(tiles, positions)):
			tile_img = self.render_tile(tile_id, metatile.palette)
			if tile_img:
				if scale > 1:
					tile_img = tile_img.resize((8 * scale, 8 * scale), Image.Resampling.NEAREST)
				image.paste(tile_img, (tx * scale, ty * scale))

		return image

	def render_tilemap(
		self,
		tilemap: Tilemap,
		scale: int = 1
	) -> Optional['Image.Image']:
		"""Render a full tilemap."""
		if not HAS_PIL:
			return None

		width = tilemap.width * 8 * scale
		height = tilemap.height * 8 * scale
		image = Image.new('RGB', (width, height), (0, 0, 0))

		for y in range(tilemap.height):
			for x in range(tilemap.width):
				tile_id = tilemap.get_tile(x, y)
				palette = tilemap.get_attribute(x, y)
				tile_img = self.render_tile(tile_id, palette)

				if tile_img:
					if scale > 1:
						tile_img = tile_img.resize((8 * scale, 8 * scale), Image.Resampling.NEAREST)
					image.paste(tile_img, (x * 8 * scale, y * 8 * scale))

		return image

	def render_metatile_sheet(
		self,
		metatile_set: MetatileSet,
		cols: int = 16,
		scale: int = 1
	) -> Optional['Image.Image']:
		"""Render all metatiles as a sheet."""
		if not HAS_PIL:
			return None

		count = len(metatile_set.metatiles)
		rows = (count + cols - 1) // cols

		width = cols * 16 * scale
		height = rows * 16 * scale
		image = Image.new('RGB', (width, height), (0, 0, 0))

		for i, mt in enumerate(metatile_set.metatiles):
			row = i // cols
			col = i % cols
			mt_img = self.render_metatile(mt, scale)
			if mt_img:
				image.paste(mt_img, (col * 16 * scale, row * 16 * scale))

		return image


def main():
	parser = argparse.ArgumentParser(description="Metatile/Tilemap Editor")
	subparsers = parser.add_subparsers(dest="command", help="Command")

	# View tilemap
	view_parser = subparsers.add_parser("view", help="View tilemap")
	view_parser.add_argument("input", help="Input file (binary or JSON)")
	view_parser.add_argument("--chr", required=True, help="CHR file or ROM")
	view_parser.add_argument("-o", "--output", help="Output image file")
	view_parser.add_argument("--scale", type=int, default=2, help="Scale factor")
	view_parser.add_argument("--format",
		choices=['nametable', 'json', 'raw'],
		default='nametable',
		help="Input format")

	# View metatiles
	mt_parser = subparsers.add_parser("metatiles", help="View metatiles")
	mt_parser.add_argument("input", help="Input file")
	mt_parser.add_argument("--chr", required=True, help="CHR file or ROM")
	mt_parser.add_argument("-o", "--output", help="Output image file")
	mt_parser.add_argument("--scale", type=int, default=2, help="Scale factor")
	mt_parser.add_argument("--count", type=int, default=256, help="Number of metatiles")
	mt_parser.add_argument("--cols", type=int, default=16, help="Columns in sheet")
	mt_parser.add_argument("--format",
		choices=['2x2', '2x2_attr', 'json'],
		default='2x2',
		help="Metatile format")

	# Export tilemap
	export_parser = subparsers.add_parser("export", help="Export tilemap to JSON")
	export_parser.add_argument("input", help="Input nametable file")
	export_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")

	# Import tilemap
	import_parser = subparsers.add_parser("import", help="Import tilemap from JSON")
	import_parser.add_argument("input", help="Input JSON file")
	import_parser.add_argument("-o", "--output", required=True,
		help="Output nametable file")

	# Create empty tilemap
	create_parser = subparsers.add_parser("create", help="Create empty tilemap")
	create_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")
	create_parser.add_argument("--width", type=int, default=32)
	create_parser.add_argument("--height", type=int, default=30)
	create_parser.add_argument("--name", default="untitled")

	args = parser.parse_args()

	if not HAS_PIL:
		print("Warning: PIL not installed. Image rendering disabled.")
		print("Install with: pip install Pillow")

	if args.command == "view":
		renderer = TilemapRenderer()
		renderer.load_chr(args.chr)

		tilemap = Tilemap()

		if args.format == 'nametable':
			data = Path(args.input).read_bytes()
			tilemap.load_nes_nametable(data)
		elif args.format == 'json':
			data = json.loads(Path(args.input).read_text(encoding='utf-8'))
			tilemap = Tilemap.from_dict(data)
		else:
			data = Path(args.input).read_bytes()
			tilemap.load_nes_nametable(data)

		if HAS_PIL:
			image = renderer.render_tilemap(tilemap, args.scale)
			if image:
				output = args.output or "tilemap.png"
				image.save(output)
				print(f"Saved tilemap to {output}")

	elif args.command == "metatiles":
		renderer = TilemapRenderer()
		renderer.load_chr(args.chr)

		mts = MetatileSet()

		if args.format == 'json':
			data = json.loads(Path(args.input).read_text(encoding='utf-8'))
			mts = MetatileSet.from_dict(data)
		else:
			data = Path(args.input).read_bytes()
			mts.load_from_data(data, args.count, args.format)

		print(f"Loaded {len(mts.metatiles)} metatiles")

		if HAS_PIL:
			image = renderer.render_metatile_sheet(mts, args.cols, args.scale)
			if image:
				output = args.output or "metatiles.png"
				image.save(output)
				print(f"Saved metatile sheet to {output}")

	elif args.command == "export":
		tilemap = Tilemap()
		data = Path(args.input).read_bytes()
		tilemap.load_nes_nametable(data)

		output_data = json.dumps(tilemap.to_dict(), indent='\t')
		Path(args.output).write_text(output_data, encoding='utf-8')
		print(f"Exported tilemap to {args.output}")

	elif args.command == "import":
		data = json.loads(Path(args.input).read_text(encoding='utf-8'))
		tilemap = Tilemap.from_dict(data)

		output_data = tilemap.save_nes_nametable()
		Path(args.output).write_bytes(output_data)
		print(f"Imported tilemap to {args.output}")

	elif args.command == "create":
		tilemap = Tilemap(args.width, args.height)
		tilemap.name = args.name

		output_data = json.dumps(tilemap.to_dict(), indent='\t')
		Path(args.output).write_text(output_data, encoding='utf-8')
		print(f"Created empty tilemap: {args.output}")

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
