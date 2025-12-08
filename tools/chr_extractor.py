#!/usr/bin/env python3
"""
CHR Extractor Tool

Extracts CHR graphics data from NES/SNES ROMs and converts to image formats.
Supports various graphics formats and palette applications.
"""

import argparse
import json
import struct
import sys
from pathlib import Path
from typing import Optional

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


# NES default palette (approximate RGB values)
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


class CHRExtractor:
	"""Extract CHR graphics from ROMs."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self.rom_path.read_bytes()
		self.header = None
		self.chr_data = None
		self.prg_size = 0
		self.chr_size = 0

		self._parse_header()

	def _parse_header(self):
		"""Parse ROM header to find CHR data."""
		if self.rom_data[:4] == b'NES\x1a':
			# iNES format
			self.header = {
				"format": "iNES",
				"prg_banks": self.rom_data[4],
				"chr_banks": self.rom_data[5],
				"flags6": self.rom_data[6],
				"flags7": self.rom_data[7],
			}
			self.prg_size = self.header["prg_banks"] * 16384
			self.chr_size = self.header["chr_banks"] * 8192

			# Check for trainer
			has_trainer = bool(self.header["flags6"] & 0x04)
			header_size = 16 + (512 if has_trainer else 0)

			# Extract CHR data
			chr_start = header_size + self.prg_size
			if self.chr_size > 0:
				self.chr_data = self.rom_data[chr_start:chr_start + self.chr_size]
			else:
				# CHR RAM - no CHR data in ROM
				self.chr_data = b''

		else:
			# Assume raw CHR data or headerless ROM
			self.header = {"format": "raw"}
			self.chr_data = self.rom_data

	def extract_tile_nes(self, offset: int) -> list:
		"""
		Extract a single 8x8 NES tile (2bpp planar).

		Returns 8x8 array of palette indices (0-3).
		"""
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

	def extract_tile_snes_4bpp(self, offset: int) -> list:
		"""
		Extract a single 8x8 SNES 4bpp tile.

		Returns 8x8 array of palette indices (0-15).
		"""
		if offset + 32 > len(self.chr_data):
			return [[0] * 8 for _ in range(8)]

		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
			# First two planes
			plane0 = self.chr_data[offset + row * 2]
			plane1 = self.chr_data[offset + row * 2 + 1]
			# Second two planes
			plane2 = self.chr_data[offset + 16 + row * 2]
			plane3 = self.chr_data[offset + 16 + row * 2 + 1]

			for col in range(8):
				shift = 7 - col
				bit0 = (plane0 >> shift) & 1
				bit1 = (plane1 >> shift) & 1
				bit2 = (plane2 >> shift) & 1
				bit3 = (plane3 >> shift) & 1
				tile[row][col] = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)

		return tile

	def extract_tiles(
		self,
		start_offset: int = 0,
		num_tiles: int = 256,
		bpp: int = 2
	) -> list:
		"""Extract multiple tiles."""
		tiles = []

		if bpp == 2:
			tile_size = 16  # NES 2bpp
			extract_func = self.extract_tile_nes
		elif bpp == 4:
			tile_size = 32  # SNES 4bpp
			extract_func = self.extract_tile_snes_4bpp
		else:
			raise ValueError(f"Unsupported BPP: {bpp}")

		for i in range(num_tiles):
			offset = start_offset + i * tile_size
			if offset + tile_size > len(self.chr_data):
				break
			tiles.append(extract_func(offset))

		return tiles

	def tiles_to_image(
		self,
		tiles: list,
		palette: list = None,
		tiles_per_row: int = 16
	) -> Optional['Image.Image']:
		"""Convert tiles to PIL Image."""
		if not HAS_PIL:
			return None

		if palette is None:
			# Default grayscale palette for 2bpp
			max_val = max(max(max(row) for row in tile) for tile in tiles) if tiles else 3
			if max_val <= 3:
				palette = [(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)]
			else:
				# Generate gradient for more colors
				palette = [(i * 255 // max_val,) * 3 for i in range(max_val + 1)]

		num_tiles = len(tiles)
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
		cols = min(num_tiles, tiles_per_row)

		width = cols * 8
		height = rows * 8

		image = Image.new('RGB', (width, height), (0, 0, 0))
		pixels = image.load()

		for tile_idx, tile in enumerate(tiles):
			tile_row = tile_idx // tiles_per_row
			tile_col = tile_idx % tiles_per_row

			for y, row in enumerate(tile):
				for x, pixel in enumerate(row):
					px = tile_col * 8 + x
					py = tile_row * 8 + y
					if pixel < len(palette):
						color = palette[pixel]
						if isinstance(color, (list, tuple)) and len(color) >= 3:
							pixels[px, py] = tuple(color[:3])
						else:
							pixels[px, py] = (pixel * 85, pixel * 85, pixel * 85)

		return image

	def apply_nes_palette(self, palette_indices: list) -> list:
		"""Convert NES palette indices to RGB colors."""
		return [NES_PALETTE[idx % len(NES_PALETTE)] for idx in palette_indices]

	def export_chr_bank(
		self,
		output_path: str,
		bank: int = 0,
		bpp: int = 2,
		palette: list = None,
		tiles_per_row: int = 16
	):
		"""Export a CHR bank to image file."""
		if not HAS_PIL:
			print("PIL not available - cannot export images")
			return

		if bpp == 2:
			bank_size = 4096  # 256 tiles * 16 bytes
			tiles_in_bank = 256
		elif bpp == 4:
			bank_size = 8192  # 256 tiles * 32 bytes
			tiles_in_bank = 256
		else:
			raise ValueError(f"Unsupported BPP: {bpp}")

		start_offset = bank * bank_size
		tiles = self.extract_tiles(start_offset, tiles_in_bank, bpp)

		image = self.tiles_to_image(tiles, palette, tiles_per_row)
		if image:
			image.save(output_path)
			print(f"Exported CHR bank {bank} to {output_path}")

	def export_all_chr(
		self,
		output_dir: str,
		bpp: int = 2,
		palette: list = None,
		tiles_per_row: int = 16
	):
		"""Export all CHR data to image files."""
		if not HAS_PIL:
			print("PIL not available - cannot export images")
			return

		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		if bpp == 2:
			bank_size = 4096
		elif bpp == 4:
			bank_size = 8192
		else:
			raise ValueError(f"Unsupported BPP: {bpp}")

		num_banks = len(self.chr_data) // bank_size

		for bank in range(num_banks):
			output_file = output_path / f"chr_bank_{bank:02d}.png"
			self.export_chr_bank(str(output_file), bank, bpp, palette, tiles_per_row)

		print(f"Exported {num_banks} CHR banks to {output_dir}")

	def export_raw_chr(self, output_path: str, start: int = 0, length: int = None):
		"""Export raw CHR data to file."""
		if length is None:
			length = len(self.chr_data) - start

		data = self.chr_data[start:start + length]
		Path(output_path).write_bytes(data)
		print(f"Exported {len(data)} bytes of CHR data to {output_path}")

	def get_info(self) -> dict:
		"""Get CHR extraction info."""
		if self.header["format"] == "iNES":
			return {
				"format": "iNES",
				"chr_size": self.chr_size,
				"chr_banks": self.header["chr_banks"],
				"tiles_2bpp": self.chr_size // 16,
				"tiles_4bpp": self.chr_size // 32,
				"has_chr_ram": self.chr_size == 0,
			}
		else:
			return {
				"format": "raw",
				"data_size": len(self.chr_data),
				"tiles_2bpp": len(self.chr_data) // 16,
				"tiles_4bpp": len(self.chr_data) // 32,
			}


def tiles_to_text(tiles: list) -> str:
	"""Convert tiles to text representation."""
	lines = []

	for tile_idx, tile in enumerate(tiles):
		lines.append(f"Tile {tile_idx:3d} (${tile_idx:02X}):")
		for row in tile:
			line = ''.join(str(p) if p < 10 else chr(ord('A') + p - 10) for p in row)
			lines.append(f"  {line}")
		lines.append("")

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(description="CHR Graphics Extractor")
	parser.add_argument("rom", help="ROM file to extract CHR from")
	parser.add_argument("-o", "--output", help="Output file/directory")
	parser.add_argument("-b", "--bank", type=int, help="Specific bank to extract")
	parser.add_argument("--bpp", type=int, default=2, choices=[2, 4],
		help="Bits per pixel (2=NES, 4=SNES)")
	parser.add_argument("--tiles-per-row", type=int, default=16,
		help="Tiles per row in output image")
	parser.add_argument("--palette", help="JSON file with palette colors")
	parser.add_argument("--nes-palette",
		help="NES palette indices (comma-separated, e.g., '0F,00,10,20')")
	parser.add_argument("--raw", action="store_true",
		help="Export raw CHR data instead of image")
	parser.add_argument("--info", action="store_true",
		help="Show CHR information only")
	parser.add_argument("--text", action="store_true",
		help="Output tiles as text")
	parser.add_argument("--start", type=int, default=0,
		help="Start offset for raw export")
	parser.add_argument("--length", type=int, help="Length for raw export")

	args = parser.parse_args()

	extractor = CHRExtractor(args.rom)

	if args.info:
		info = extractor.get_info()
		print(json.dumps(info, indent='\t'))
		return

	# Load palette if specified
	palette = None
	if args.palette:
		with open(args.palette, 'r', encoding='utf-8') as f:
			palette = json.load(f)
	elif args.nes_palette:
		indices = [int(x, 16) for x in args.nes_palette.split(',')]
		palette = extractor.apply_nes_palette(indices)

	if args.text:
		# Text output mode
		if args.bank is not None:
			bank_size = 4096 if args.bpp == 2 else 8192
			tiles = extractor.extract_tiles(args.bank * bank_size, 256, args.bpp)
		else:
			tiles = extractor.extract_tiles(0, 256, args.bpp)

		output = tiles_to_text(tiles)
		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
		else:
			print(output)

	elif args.raw:
		output_path = args.output or "chr_data.bin"
		extractor.export_raw_chr(output_path, args.start, args.length)

	elif args.bank is not None:
		output_path = args.output or f"chr_bank_{args.bank:02d}.png"
		extractor.export_chr_bank(output_path, args.bank, args.bpp, palette,
			args.tiles_per_row)

	else:
		output_dir = args.output or "chr_output"
		extractor.export_all_chr(output_dir, args.bpp, palette, args.tiles_per_row)


if __name__ == "__main__":
	main()
