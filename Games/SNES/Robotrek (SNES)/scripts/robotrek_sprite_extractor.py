#!/usr/bin/env python3
"""
Robotrek Sprite Extractor

Extracts sprite graphics from Robotrek (SNES) ROM.

Usage:
    python robotrek_sprite_extractor.py <rom_path> --output <output_dir>
"""

import argparse
import struct
from pathlib import Path
from typing import Optional

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False
	print("Warning: PIL not installed. PNG export disabled.")


# SNES color format: 15-bit BGR
def snes_to_rgb(color: int) -> tuple[int, int, int]:
	"""Convert SNES 15-bit color to RGB."""
	r = (color & 0x1F) << 3
	g = ((color >> 5) & 0x1F) << 3
	b = ((color >> 10) & 0x1F) << 3
	return (r, g, b)


def decode_4bpp_tile(data: bytes) -> list[list[int]]:
	"""
	Decode an 8x8 SNES 4bpp tile.
	Returns 8x8 array of palette indices (0-15).
	"""
	if len(data) < 32:
		data = data + b'\x00' * (32 - len(data))

	tile = [[0] * 8 for _ in range(8)]

	for y in range(8):
		# Bitplanes 0-1
		bp0 = data[y * 2]
		bp1 = data[y * 2 + 1]
		# Bitplanes 2-3
		bp2 = data[16 + y * 2]
		bp3 = data[16 + y * 2 + 1]

		for x in range(8):
			bit = 7 - x
			pixel = ((bp0 >> bit) & 1) | \
					(((bp1 >> bit) & 1) << 1) | \
					(((bp2 >> bit) & 1) << 2) | \
					(((bp3 >> bit) & 1) << 3)
			tile[y][x] = pixel

	return tile


def decode_2bpp_tile(data: bytes) -> list[list[int]]:
	"""
	Decode an 8x8 SNES 2bpp tile.
	Returns 8x8 array of palette indices (0-3).
	"""
	if len(data) < 16:
		data = data + b'\x00' * (16 - len(data))

	tile = [[0] * 8 for _ in range(8)]

	for y in range(8):
		bp0 = data[y * 2]
		bp1 = data[y * 2 + 1]

		for x in range(8):
			bit = 7 - x
			pixel = ((bp0 >> bit) & 1) | (((bp1 >> bit) & 1) << 1)
			tile[y][x] = pixel

	return tile


# Default palettes
DEFAULT_4BPP_PALETTE = [
	(0, 0, 0), (32, 32, 32), (64, 64, 64), (96, 96, 96),
	(128, 128, 128), (160, 160, 160), (192, 192, 192), (224, 224, 224),
	(255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 0),
	(255, 0, 255), (0, 255, 255), (255, 128, 0), (255, 255, 255)
]

DEFAULT_2BPP_PALETTE = [
	(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)
]


class RobotrekSpriteExtractor:
	"""Extracts sprites from Robotrek ROM."""

	# Known sprite locations
	SPRITE_BANKS = {
		"player": {"bank": 0xC0, "start": 0x8000, "count": 64},
		"robot1": {"bank": 0xC1, "start": 0x8000, "count": 128},
		"robot2": {"bank": 0xC2, "start": 0x8000, "count": 128},
		"robot3": {"bank": 0xC3, "start": 0x8000, "count": 128},
		"enemies1": {"bank": 0xC4, "start": 0x8000, "count": 256},
		"enemies2": {"bank": 0xC5, "start": 0x8000, "count": 256},
		"npcs": {"bank": 0xC6, "start": 0x8000, "count": 128},
		"effects": {"bank": 0xC7, "start": 0x8000, "count": 64},
	}

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.has_header = self._detect_header()

	def _load_rom(self) -> bytes:
		"""Load ROM file."""
		with open(self.rom_path, "rb") as f:
			return f.read()

	def _detect_header(self) -> bool:
		"""Detect SMC header."""
		return (len(self.rom_data) % 0x8000) == 0x200

	def hirom_to_file(self, bank: int, addr: int) -> int:
		"""Convert HiROM address to file offset."""
		offset = 0x200 if self.has_header else 0
		if bank >= 0xC0:
			file_addr = ((bank - 0xC0) * 0x10000) + (addr - 0x8000 if addr >= 0x8000 else addr)
		else:
			file_addr = (bank * 0x10000) + addr
		return offset + file_addr

	def read_bytes(self, bank: int, addr: int, length: int) -> bytes:
		"""Read bytes from ROM."""
		file_offset = self.hirom_to_file(bank, addr)
		if file_offset + length > len(self.rom_data):
			length = len(self.rom_data) - file_offset
		return self.rom_data[file_offset:file_offset + length]

	def read_palette(self, bank: int, addr: int, colors: int = 16) -> list[tuple[int, int, int]]:
		"""Read SNES palette from ROM."""
		data = self.read_bytes(bank, addr, colors * 2)
		palette = []

		for i in range(colors):
			if i * 2 + 1 < len(data):
				color = data[i * 2] | (data[i * 2 + 1] << 8)
				palette.append(snes_to_rgb(color))
			else:
				palette.append((0, 0, 0))

		return palette

	def extract_tiles(self, bank: int, start: int, count: int,
					  bpp: int = 4) -> list[list[list[int]]]:
		"""Extract tiles from ROM."""
		tile_size = 32 if bpp == 4 else 16
		data = self.read_bytes(bank, start, count * tile_size)
		tiles = []

		decode_func = decode_4bpp_tile if bpp == 4 else decode_2bpp_tile

		for i in range(count):
			tile_data = data[i * tile_size:(i + 1) * tile_size]
			if len(tile_data) >= tile_size:
				tiles.append(decode_func(tile_data))

		return tiles

	def tiles_to_image(self, tiles: list[list[list[int]]],
					   palette: list[tuple[int, int, int]],
					   tiles_per_row: int = 16) -> Optional['Image.Image']:
		"""Convert tiles to PIL Image."""
		if not HAS_PIL:
			return None

		if not tiles:
			return None

		rows = (len(tiles) + tiles_per_row - 1) // tiles_per_row
		width = tiles_per_row * 8
		height = rows * 8

		img = Image.new('RGB', (width, height), (0, 0, 0))
		pixels = img.load()

		for idx, tile in enumerate(tiles):
			tile_x = (idx % tiles_per_row) * 8
			tile_y = (idx // tiles_per_row) * 8

			for y, row in enumerate(tile):
				for x, pixel in enumerate(row):
					if pixel < len(palette):
						color = palette[pixel]
					else:
						color = (255, 0, 255)  # Magenta for invalid
					pixels[tile_x + x, tile_y + y] = color

		return img

	def extract_sprite_sheet(self, sprite_name: str,
							 palette: Optional[list[tuple[int, int, int]]] = None) -> Optional['Image.Image']:
		"""Extract a sprite sheet by name."""
		if sprite_name not in self.SPRITE_BANKS:
			print(f"Unknown sprite: {sprite_name}")
			print(f"Available: {', '.join(self.SPRITE_BANKS.keys())}")
			return None

		info = self.SPRITE_BANKS[sprite_name]
		bank = info["bank"]
		start = info["start"]
		count = info["count"]

		print(f"Extracting {sprite_name}: {count} tiles from ${bank:02X}:{start:04X}")

		tiles = self.extract_tiles(bank, start, count)

		if palette is None:
			palette = DEFAULT_4BPP_PALETTE

		return self.tiles_to_image(tiles, palette)

	def extract_all(self, output_dir: Path,
					palette: Optional[list[tuple[int, int, int]]] = None) -> None:
		"""Extract all sprite sheets."""
		if not HAS_PIL:
			print("PIL required for image export. Install with: pip install pillow")
			return

		output_dir.mkdir(parents=True, exist_ok=True)

		for name in self.SPRITE_BANKS:
			img = self.extract_sprite_sheet(name, palette)
			if img:
				output_path = output_dir / f"{name}.png"
				img.save(output_path)
				print(f"Saved: {output_path}")

	def export_raw_tiles(self, sprite_name: str, output_path: Path) -> None:
		"""Export raw tile data."""
		if sprite_name not in self.SPRITE_BANKS:
			return

		info = self.SPRITE_BANKS[sprite_name]
		bank = info["bank"]
		start = info["start"]
		count = info["count"]
		tile_size = 32  # 4bpp

		data = self.read_bytes(bank, start, count * tile_size)

		with open(output_path, "wb") as f:
			f.write(data)

		print(f"Exported raw tiles: {output_path}")


def main():
	parser = argparse.ArgumentParser(description="Extract sprites from Robotrek ROM")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--output", "-o", required=True, help="Output directory")
	parser.add_argument("--sprite", "-s", help="Extract specific sprite only")
	parser.add_argument("--raw", action="store_true", help="Export raw tile data")
	parser.add_argument("--list", action="store_true", help="List available sprites")

	args = parser.parse_args()

	extractor = RobotrekSpriteExtractor(args.rom)

	if args.list:
		print("Available sprites:")
		for name, info in extractor.SPRITE_BANKS.items():
			print(f"  {name}: {info['count']} tiles at ${info['bank']:02X}:{info['start']:04X}")
		return

	output_dir = Path(args.output)

	if args.sprite:
		if args.raw:
			output_path = output_dir / f"{args.sprite}.bin"
			output_path.parent.mkdir(parents=True, exist_ok=True)
			extractor.export_raw_tiles(args.sprite, output_path)
		else:
			output_dir.mkdir(parents=True, exist_ok=True)
			img = extractor.extract_sprite_sheet(args.sprite)
			if img:
				output_path = output_dir / f"{args.sprite}.png"
				img.save(output_path)
				print(f"Saved: {output_path}")
	else:
		extractor.extract_all(output_dir)


if __name__ == "__main__":
	main()
