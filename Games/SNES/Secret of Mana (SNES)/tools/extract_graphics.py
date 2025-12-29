#!/usr/bin/env python3
"""
Secret of Mana Graphics Extractor
Extracts 4bpp SNES graphics tiles and palettes from the ROM.
"""

import os
import sys
import argparse
import struct
import json
from pathlib import Path

# SNES 4bpp tile format constants
TILE_WIDTH = 8
TILE_HEIGHT = 8
BYTES_PER_4BPP_TILE = 32  # 8x8 pixels, 4 bits per pixel

# Known graphics offsets (file offsets, not CPU addresses)
GRAPHICS_TABLES = {
	"font": {
		"offset": 0x0f8000,
		"count": 128,
		"description": "Main font characters"
	},
	"menu_icons": {
		"offset": 0x0f9000,
		"count": 64,
		"description": "Menu and item icons"
	},
	"status_icons": {
		"offset": 0x0fa000,
		"count": 32,
		"description": "Status effect icons"
	}
}

# Palette locations
PALETTE_OFFSETS = {
	"menu_palette": 0x0e0000,
	"font_palette": 0x0e0100,
}


def read_4bpp_tile(rom_data: bytes, offset: int) -> list:
	"""
	Read a single 4bpp SNES tile.
	Returns a list of 64 pixel values (8x8 grid).
	
	SNES 4bpp format: 32 bytes per tile
	- Bytes 0-15: Bitplanes 0 and 1 interleaved (row0_bp0, row0_bp1, row1_bp0, ...)
	- Bytes 16-31: Bitplanes 2 and 3 interleaved
	"""
	if offset + BYTES_PER_4BPP_TILE > len(rom_data):
		return [0] * 64
	
	tile_data = rom_data[offset:offset + BYTES_PER_4BPP_TILE]
	pixels = []
	
	for row in range(TILE_HEIGHT):
		# Bitplanes 0 and 1
		bp0 = tile_data[row * 2]
		bp1 = tile_data[row * 2 + 1]
		# Bitplanes 2 and 3
		bp2 = tile_data[16 + row * 2]
		bp3 = tile_data[16 + row * 2 + 1]
		
		for col in range(TILE_WIDTH):
			bit = 7 - col
			pixel = ((bp0 >> bit) & 1) | \
					(((bp1 >> bit) & 1) << 1) | \
					(((bp2 >> bit) & 1) << 2) | \
					(((bp3 >> bit) & 1) << 3)
			pixels.append(pixel)
	
	return pixels


def read_snes_palette(rom_data: bytes, offset: int, count: int = 16) -> list:
	"""
	Read SNES 15-bit BGR palette.
	Returns list of (R, G, B) tuples.
	"""
	palette = []
	for i in range(count):
		if offset + i * 2 + 2 > len(rom_data):
			palette.append((0, 0, 0))
			continue
		
		color_word = struct.unpack_from("<H", rom_data, offset + i * 2)[0]
		r = (color_word & 0x1f) << 3
		g = ((color_word >> 5) & 0x1f) << 3
		b = ((color_word >> 10) & 0x1f) << 3
		palette.append((r, g, b))
	
	return palette


def tile_to_indexed(pixels: list) -> list:
	"""Convert flat pixel list to 2D indexed array."""
	rows = []
	for y in range(TILE_HEIGHT):
		row = pixels[y * TILE_WIDTH:(y + 1) * TILE_WIDTH]
		rows.append(row)
	return rows


def export_tileset_to_png(rom_data: bytes, offset: int, tile_count: int, 
						  palette: list, output_path: str, tiles_per_row: int = 16):
	"""
	Export a tileset as a PNG image.
	Requires PIL/Pillow.
	"""
	try:
		from PIL import Image
	except ImportError:
		print("Warning: PIL/Pillow not installed. Exporting as raw data instead.")
		return export_tileset_to_raw(rom_data, offset, tile_count, output_path)
	
	rows = (tile_count + tiles_per_row - 1) // tiles_per_row
	img_width = tiles_per_row * TILE_WIDTH
	img_height = rows * TILE_HEIGHT
	
	img = Image.new("RGB", (img_width, img_height), (0, 0, 0))
	
	for tile_idx in range(tile_count):
		tile_offset = offset + tile_idx * BYTES_PER_4BPP_TILE
		pixels = read_4bpp_tile(rom_data, tile_offset)
		
		tile_x = (tile_idx % tiles_per_row) * TILE_WIDTH
		tile_y = (tile_idx // tiles_per_row) * TILE_HEIGHT
		
		for y in range(TILE_HEIGHT):
			for x in range(TILE_WIDTH):
				pixel_idx = y * TILE_WIDTH + x
				color_idx = pixels[pixel_idx]
				if color_idx < len(palette):
					color = palette[color_idx]
				else:
					color = (255, 0, 255)  # Magenta for out-of-bounds
				img.putpixel((tile_x + x, tile_y + y), color)
	
	img.save(output_path)
	return True


def export_tileset_to_raw(rom_data: bytes, offset: int, tile_count: int, output_path: str):
	"""Export raw tile data."""
	raw_data = rom_data[offset:offset + tile_count * BYTES_PER_4BPP_TILE]
	with open(output_path, "wb") as f:
		f.write(raw_data)
	return True


def export_palette_to_json(palette: list, output_path: str):
	"""Export palette to JSON format."""
	palette_data = []
	for i, (r, g, b) in enumerate(palette):
		palette_data.append({
			"index": i,
			"r": r,
			"g": g,
			"b": b,
			"hex": f"#{r:02x}{g:02x}{b:02x}"
		})
	
	with open(output_path, "w") as f:
		json.dump(palette_data, f, indent="\t")
	
	return palette_data


def scan_for_tiles(rom_data: bytes, start_offset: int, end_offset: int) -> list:
	"""
	Scan ROM for potential 4bpp tile data.
	Returns list of candidate offsets.
	"""
	candidates = []
	
	for offset in range(start_offset, end_offset, 0x1000):
		# Check if this looks like tile data
		# Tile data typically has patterns in the bitplane structure
		if offset + 32 > len(rom_data):
			continue
		
		sample = rom_data[offset:offset + 32]
		# Check for non-zero data that's not all 0xff
		if sum(sample) > 0 and sum(sample) < 32 * 255:
			# Check for reasonable bitplane patterns
			unique_values = len(set(sample))
			if 4 <= unique_values <= 20:
				candidates.append(offset)
	
	return candidates


def main():
	parser = argparse.ArgumentParser(description="Secret of Mana Graphics Extractor")
	parser.add_argument("--rom", required=True, help="Path to ROM file")
	parser.add_argument("--output", required=True, help="Output directory")
	parser.add_argument("--table", help="Specific graphics table to extract")
	parser.add_argument("--offset", type=lambda x: int(x, 0), help="Custom offset")
	parser.add_argument("--count", type=int, default=64, help="Number of tiles")
	parser.add_argument("--scan", action="store_true", help="Scan for graphics data")
	
	args = parser.parse_args()
	
	# Read ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"Loaded ROM: {len(rom_data)} bytes")
	
	# Create output directory
	output_path = Path(args.output)
	output_path.mkdir(parents=True, exist_ok=True)
	
	# Default grayscale palette
	default_palette = [(i * 17, i * 17, i * 17) for i in range(16)]
	
	if args.scan:
		print("\nScanning for graphics data...")
		candidates = scan_for_tiles(rom_data, 0x080000, 0x180000)
		print(f"Found {len(candidates)} candidate offsets:")
		for offset in candidates[:20]:
			print(f"  0x{offset:06x}")
		return
	
	if args.offset:
		# Extract from specific offset
		print(f"\nExtracting {args.count} tiles from 0x{args.offset:06x}...")
		out_file = output_path / f"tiles_{args.offset:06x}.png"
		if export_tileset_to_png(rom_data, args.offset, args.count, default_palette, str(out_file)):
			print(f"  Saved: {out_file}")
	elif args.table:
		# Extract specific table
		if args.table in GRAPHICS_TABLES:
			table = GRAPHICS_TABLES[args.table]
			print(f"\nExtracting {table['description']}...")
			out_file = output_path / f"{args.table}.png"
			if export_tileset_to_png(rom_data, table["offset"], table["count"], 
								   default_palette, str(out_file)):
				print(f"  Saved: {out_file}")
		else:
			print(f"Unknown table: {args.table}")
			print(f"Available: {', '.join(GRAPHICS_TABLES.keys())}")
	else:
		# Extract all known tables
		print("\nExtracting all known graphics tables...")
		for name, table in GRAPHICS_TABLES.items():
			print(f"  {name}: {table['description']}")
			out_file = output_path / f"{name}.png"
			export_tileset_to_png(rom_data, table["offset"], table["count"],
								default_palette, str(out_file))
			print(f"    Saved: {out_file}")
		
		# Export palettes
		print("\nExporting palettes...")
		for name, offset in PALETTE_OFFSETS.items():
			palette = read_snes_palette(rom_data, offset)
			out_file = output_path / f"{name}.json"
			export_palette_to_json(palette, str(out_file))
			print(f"  {name}: {out_file}")
	
	print("\nDone!")


if __name__ == "__main__":
	main()
