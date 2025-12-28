#!/usr/bin/env python3
"""
Robotrek Graphics Extractor

Extracts and converts graphics from the Robotrek ROM.
Supports 2BPP (GameBoy-style) and 4BPP SNES formats.

Usage:
	python extract_graphics.py <rom_path> <offset> --format 2bpp --tiles 256 --output font.png
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
	print("Install with: pip install Pillow")


# Palettes for different formats
PALETTE_2BPP_GRAYSCALE = [
	(255, 255, 255),  # 0 - White
	(170, 170, 170),  # 1 - Light gray
	(85, 85, 85),     # 2 - Dark gray
	(0, 0, 0),        # 3 - Black
]

PALETTE_4BPP_GRAYSCALE = [
	(255, 255, 255), (238, 238, 238), (221, 221, 221), (204, 204, 204),
	(187, 187, 187), (170, 170, 170), (153, 153, 153), (136, 136, 136),
	(119, 119, 119), (102, 102, 102), (85, 85, 85), (68, 68, 68),
	(51, 51, 51), (34, 34, 34), (17, 17, 17), (0, 0, 0),
]


def decode_2bpp_tile(data: bytes, offset: int = 0) -> list[list[int]]:
	"""
	Decode an 8x8 2BPP tile (GameBoy format).

	Each tile is 16 bytes: 2 bytes per row.
	Byte 0: low bits, Byte 1: high bits for row 0, etc.

	Args:
		data: Raw tile data
		offset: Starting offset

	Returns:
		8x8 array of pixel values (0-3)
	"""
	tile = [[0] * 8 for _ in range(8)]

	for row in range(8):
		byte_offset = offset + row * 2
		if byte_offset + 1 >= len(data):
			break

		low_byte = data[byte_offset]
		high_byte = data[byte_offset + 1]

		for col in range(8):
			bit = 7 - col
			low_bit = (low_byte >> bit) & 1
			high_bit = (high_byte >> bit) & 1
			tile[row][col] = low_bit | (high_bit << 1)

	return tile


def decode_4bpp_tile(data: bytes, offset: int = 0) -> list[list[int]]:
	"""
	Decode an 8x8 4BPP SNES tile.

	Each tile is 32 bytes: 4 bytes per row (bitplane interleaved).
	Planes 0-1 first (16 bytes), then planes 2-3 (16 bytes).

	Args:
		data: Raw tile data
		offset: Starting offset

	Returns:
		8x8 array of pixel values (0-15)
	"""
	tile = [[0] * 8 for _ in range(8)]

	for row in range(8):
		# Planes 0 and 1 (first 16 bytes)
		bp0_offset = offset + row * 2
		bp1_offset = offset + row * 2 + 1
		# Planes 2 and 3 (next 16 bytes)
		bp2_offset = offset + 16 + row * 2
		bp3_offset = offset + 16 + row * 2 + 1

		if bp3_offset >= len(data):
			break

		bp0 = data[bp0_offset]
		bp1 = data[bp1_offset]
		bp2 = data[bp2_offset]
		bp3 = data[bp3_offset]

		for col in range(8):
			bit = 7 - col
			pixel = ((bp0 >> bit) & 1) | \
			        (((bp1 >> bit) & 1) << 1) | \
			        (((bp2 >> bit) & 1) << 2) | \
			        (((bp3 >> bit) & 1) << 3)
			tile[row][col] = pixel

	return tile


def extract_tiles(data: bytes, offset: int, num_tiles: int,
                  format: str = "2bpp") -> list[list[list[int]]]:
	"""
	Extract multiple tiles from ROM data.

	Args:
		data: Raw ROM data
		offset: Starting offset
		num_tiles: Number of tiles to extract
		format: "2bpp" or "4bpp"

	Returns:
		List of 8x8 tile arrays
	"""
	tiles = []
	tile_size = 16 if format == "2bpp" else 32
	decode_func = decode_2bpp_tile if format == "2bpp" else decode_4bpp_tile

	for i in range(num_tiles):
		tile_offset = offset + i * tile_size
		if tile_offset + tile_size > len(data):
			break
		tile = decode_func(data, tile_offset)
		tiles.append(tile)

	return tiles


def tiles_to_image(tiles: list[list[list[int]]],
                   tiles_per_row: int = 16,
                   palette: list[tuple[int, int, int]] = None,
                   format: str = "2bpp") -> 'Image.Image':
	"""
	Convert tiles to a PIL Image.

	Args:
		tiles: List of decoded tiles
		tiles_per_row: Number of tiles per row in output
		palette: Color palette (RGB tuples)
		format: "2bpp" or "4bpp"

	Returns:
		PIL Image
	"""
	if not HAS_PIL:
		raise RuntimeError("PIL not available")

	if palette is None:
		palette = PALETTE_2BPP_GRAYSCALE if format == "2bpp" else PALETTE_4BPP_GRAYSCALE

	num_tiles = len(tiles)
	rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

	width = tiles_per_row * 8
	height = rows * 8

	image = Image.new("RGB", (width, height), palette[0])
	pixels = image.load()

	for tile_idx, tile in enumerate(tiles):
		tile_x = (tile_idx % tiles_per_row) * 8
		tile_y = (tile_idx // tiles_per_row) * 8

		for row in range(8):
			for col in range(8):
				pixel_value = tile[row][col]
				color = palette[pixel_value % len(palette)]
				pixels[tile_x + col, tile_y + row] = color

	return image


def extract_raw_graphics(rom_path: Path, offset: int, size: int,
                         output_path: Path) -> None:
	"""
	Extract raw graphics bytes without decompression.

	Args:
		rom_path: Path to ROM file
		offset: Starting offset
		size: Number of bytes to extract
		output_path: Output file path
	"""
	with open(rom_path, "rb") as f:
		f.seek(offset)
		data = f.read(size)

	output_path.parent.mkdir(parents=True, exist_ok=True)
	with open(output_path, "wb") as f:
		f.write(data)

	print(f"Extracted {len(data)} bytes from ${offset:06x}")
	print(f"Saved to {output_path}")


def main():
	parser = argparse.ArgumentParser(description="Robotrek Graphics Extractor")
	parser.add_argument("rom_path", type=Path, help="Path to ROM file")
	parser.add_argument("offset", type=str, help="Offset in ROM (hex)")
	parser.add_argument("--format", "-f", choices=["2bpp", "4bpp"],
	                    default="2bpp", help="Tile format")
	parser.add_argument("--tiles", "-t", type=int, default=256,
	                    help="Number of tiles to extract")
	parser.add_argument("--width", "-w", type=int, default=16,
	                    help="Tiles per row in output")
	parser.add_argument("--output", "-o", type=Path,
	                    help="Output file (PNG or BIN)")
	parser.add_argument("--raw", action="store_true",
	                    help="Extract raw bytes without decoding")
	parser.add_argument("--size", "-s", type=int,
	                    help="Size in bytes for raw extraction")

	args = parser.parse_args()

	# Parse hex offset
	offset = int(args.offset, 16) if args.offset.startswith("0x") else int(args.offset, 16)

	# Load ROM
	with open(args.rom_path, "rb") as f:
		rom_data = f.read()

	print(f"ROM: {args.rom_path.name}")
	print(f"Size: {len(rom_data):,} bytes (${len(rom_data):06x})")
	print(f"Offset: ${offset:06x}")

	if args.raw:
		# Raw extraction
		size = args.size or 4096
		output = args.output or Path(f"raw_{offset:06x}.bin")
		extract_raw_graphics(args.rom_path, offset, size, output)
		return

	# Extract and decode tiles
	print(f"Format: {args.format}")
	print(f"Extracting {args.tiles} tiles...")

	tiles = extract_tiles(rom_data, offset, args.tiles, args.format)
	print(f"Decoded {len(tiles)} tiles")

	if args.output:
		output_path = args.output
	else:
		output_path = Path(f"tiles_{offset:06x}.png")

	if output_path.suffix.lower() == ".png":
		if not HAS_PIL:
			print("ERROR: PIL not installed. Cannot export PNG.")
			print("Install with: pip install Pillow")
			return

		image = tiles_to_image(tiles, args.width, format=args.format)
		image.save(output_path)
		print(f"Saved to {output_path}")
		print(f"Image size: {image.width}x{image.height} pixels")
	else:
		# Save as raw binary
		tile_size = 16 if args.format == "2bpp" else 32
		raw_size = len(tiles) * tile_size
		with open(args.rom_path, "rb") as f:
			f.seek(offset)
			raw_data = f.read(raw_size)
		with open(output_path, "wb") as f:
			f.write(raw_data)
		print(f"Saved raw tiles to {output_path}")


if __name__ == "__main__":
	main()
