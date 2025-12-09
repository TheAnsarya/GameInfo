#!/usr/bin/env python3
"""
Tileset Ripper - Extract and organize tilesets from ROMs.

Extracts complete tilesets with proper organization, palettes, and
metadata for editing and reimporting.

Usage:
	python tileset_ripper.py <rom_file> --output tilesets/
	python tileset_ripper.py <rom_file> --preview --offset 0x10000

Features:
	- Extract NES/SNES/GB tilesets
	- Auto-detect tileset boundaries
	- Extract associated palettes
	- Generate tileset sheets
	- Export as PNG with metadata
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class TileFormat(IntEnum):
	"""Tile data formats."""
	NES_2BPP = 0  # NES CHR format (2bpp planar)
	SNES_4BPP = 1  # SNES 4bpp planar
	SNES_2BPP = 2  # SNES 2bpp planar
	GB_2BPP = 3  # Game Boy 2bpp
	GBA_4BPP = 4  # GBA 4bpp linear
	GBA_8BPP = 5  # GBA 8bpp linear
	GENESIS_4BPP = 6  # Genesis 4bpp planar


@dataclass
class Tile:
	"""Single tile data."""
	index: int
	data: bytes
	width: int = 8
	height: int = 8
	bpp: int = 2

	def to_pixels(self, format_type: TileFormat) -> List[List[int]]:
		"""Convert to pixel array."""
		pixels = [[0] * self.width for _ in range(self.height)]

		if format_type == TileFormat.NES_2BPP:
			# NES format: 8 bytes plane 0, then 8 bytes plane 1
			for y in range(8):
				plane0 = self.data[y] if y < len(self.data) else 0
				plane1 = self.data[y + 8] if y + 8 < len(self.data) else 0

				for x in range(8):
					bit = 7 - x
					pixel = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1)
					pixels[y][x] = pixel

		elif format_type == TileFormat.GB_2BPP:
			# GB format: interleaved planes
			for y in range(8):
				byte_offset = y * 2
				plane0 = self.data[byte_offset] if byte_offset < len(self.data) else 0
				plane1 = self.data[byte_offset + 1] if byte_offset + 1 < len(self.data) else 0

				for x in range(8):
					bit = 7 - x
					pixel = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1)
					pixels[y][x] = pixel

		elif format_type in (TileFormat.SNES_4BPP, TileFormat.SNES_2BPP):
			# SNES format: planar with bitplanes grouped
			bpp = 4 if format_type == TileFormat.SNES_4BPP else 2

			for y in range(8):
				pixel_row = [0] * 8

				for bp in range(bpp):
					byte_offset = y * 2 + (bp // 2) * 16 + (bp % 2)
					if byte_offset < len(self.data):
						plane = self.data[byte_offset]
						for x in range(8):
							bit = 7 - x
							pixel_row[x] |= ((plane >> bit) & 1) << bp

				pixels[y] = pixel_row

		elif format_type == TileFormat.GBA_4BPP:
			# GBA 4bpp: linear, 2 pixels per byte
			for y in range(8):
				for x in range(0, 8, 2):
					byte_offset = y * 4 + x // 2
					if byte_offset < len(self.data):
						byte = self.data[byte_offset]
						pixels[y][x] = byte & 0x0F
						pixels[y][x + 1] = (byte >> 4) & 0x0F

		elif format_type == TileFormat.GBA_8BPP:
			# GBA 8bpp: linear, 1 pixel per byte
			for y in range(8):
				for x in range(8):
					byte_offset = y * 8 + x
					if byte_offset < len(self.data):
						pixels[y][x] = self.data[byte_offset]

		return pixels


@dataclass
class Palette:
	"""Color palette."""
	colors: List[Tuple[int, int, int]]
	format_type: str = "rgb555"

	@classmethod
	def from_nes(cls, palette_data: bytes) -> "Palette":
		"""Create from NES palette indices."""
		# NES master palette (simplified)
		nes_colors = [
			(124, 124, 124), (0, 0, 252), (0, 0, 188), (68, 40, 188),
			(148, 0, 132), (168, 0, 32), (168, 16, 0), (136, 20, 0),
			(80, 48, 0), (0, 120, 0), (0, 104, 0), (0, 88, 0),
			(0, 64, 88), (0, 0, 0), (0, 0, 0), (0, 0, 0),
			(188, 188, 188), (0, 120, 248), (0, 88, 248), (104, 68, 252),
			(216, 0, 204), (228, 0, 88), (248, 56, 0), (228, 92, 16),
			(172, 124, 0), (0, 184, 0), (0, 168, 0), (0, 168, 68),
			(0, 136, 136), (0, 0, 0), (0, 0, 0), (0, 0, 0),
			(248, 248, 248), (60, 188, 252), (104, 136, 252), (152, 120, 248),
			(248, 120, 248), (248, 88, 152), (248, 120, 88), (252, 160, 68),
			(248, 184, 0), (184, 248, 24), (88, 216, 84), (88, 248, 152),
			(0, 232, 216), (120, 120, 120), (0, 0, 0), (0, 0, 0),
			(252, 252, 252), (164, 228, 252), (184, 184, 248), (216, 184, 248),
			(248, 184, 248), (248, 164, 192), (240, 208, 176), (252, 224, 168),
			(248, 216, 120), (216, 248, 120), (184, 248, 184), (184, 248, 216),
			(0, 252, 252), (248, 216, 248), (0, 0, 0), (0, 0, 0),
		]

		colors = []
		for idx in palette_data:
			if idx < len(nes_colors):
				colors.append(nes_colors[idx])
			else:
				colors.append((0, 0, 0))

		return cls(colors=colors, format_type="nes")

	@classmethod
	def from_rgb555(cls, data: bytes) -> "Palette":
		"""Create from RGB555 (SNES/GBA) format."""
		colors = []

		for i in range(0, len(data), 2):
			if i + 1 < len(data):
				color = struct.unpack_from("<H", data, i)[0]
				r = ((color >> 0) & 0x1F) << 3
				g = ((color >> 5) & 0x1F) << 3
				b = ((color >> 10) & 0x1F) << 3
				colors.append((r, g, b))

		return cls(colors=colors, format_type="rgb555")

	def to_rgb555_bytes(self) -> bytes:
		"""Convert to RGB555 format."""
		result = bytearray()

		for r, g, b in self.colors:
			r5 = (r >> 3) & 0x1F
			g5 = (g >> 3) & 0x1F
			b5 = (b >> 3) & 0x1F
			color = r5 | (g5 << 5) | (b5 << 10)
			result.extend(struct.pack("<H", color))

		return bytes(result)


@dataclass
class Tileset:
	"""Complete tileset."""
	name: str
	tiles: List[Tile]
	format_type: TileFormat
	palettes: List[Palette] = field(default_factory=list)
	offset: int = 0
	metadata: Dict[str, Any] = field(default_factory=dict)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"format": self.format_type.name,
			"tile_count": len(self.tiles),
			"offset": f"0x{self.offset:06X}",
			"palettes": len(self.palettes),
			"metadata": self.metadata
		}

	def get_tile_size_bytes(self) -> int:
		"""Get size of one tile in bytes."""
		sizes = {
			TileFormat.NES_2BPP: 16,
			TileFormat.SNES_4BPP: 32,
			TileFormat.SNES_2BPP: 16,
			TileFormat.GB_2BPP: 16,
			TileFormat.GBA_4BPP: 32,
			TileFormat.GBA_8BPP: 64,
			TileFormat.GENESIS_4BPP: 32,
		}
		return sizes.get(self.format_type, 16)


class TilesetRipper:
	"""Extract tilesets from ROM data."""

	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.detected_format: Optional[TileFormat] = None

	def detect_format(self) -> TileFormat:
		"""Auto-detect ROM format and tile format."""
		# Check for iNES header
		if self.rom_data[:4] == b"NES\x1A":
			self.detected_format = TileFormat.NES_2BPP
			return TileFormat.NES_2BPP

		# Check for SNES header
		for offset in [0x7FC0, 0xFFC0, 0x81C0, 0x101C0]:
			if offset + 32 <= len(self.rom_data):
				# Check checksum complement
				if offset + 0x1E + 2 <= len(self.rom_data):
					checksum = struct.unpack_from("<H", self.rom_data, offset + 0x1E)[0]
					complement = struct.unpack_from("<H", self.rom_data, offset + 0x1C)[0]
					if checksum ^ complement == 0xFFFF:
						self.detected_format = TileFormat.SNES_4BPP
						return TileFormat.SNES_4BPP

		# Check for Game Boy
		if len(self.rom_data) >= 0x150:
			if self.rom_data[0x104:0x108] == b"\xCE\xED\x66\x66":
				self.detected_format = TileFormat.GB_2BPP
				return TileFormat.GB_2BPP

		# Check for GBA
		if len(self.rom_data) >= 0xC0:
			# GBA ROM entry point
			if self.rom_data[0:4] == b"\x2E\x00\x00\xEA":
				self.detected_format = TileFormat.GBA_4BPP
				return TileFormat.GBA_4BPP

		# Default to NES
		self.detected_format = TileFormat.NES_2BPP
		return TileFormat.NES_2BPP

	def extract_tileset(self, offset: int, tile_count: int,
						format_type: Optional[TileFormat] = None) -> Tileset:
		"""Extract tileset from specific offset."""
		if format_type is None:
			format_type = self.detected_format or self.detect_format()

		tile_size = {
			TileFormat.NES_2BPP: 16,
			TileFormat.SNES_4BPP: 32,
			TileFormat.SNES_2BPP: 16,
			TileFormat.GB_2BPP: 16,
			TileFormat.GBA_4BPP: 32,
			TileFormat.GBA_8BPP: 64,
			TileFormat.GENESIS_4BPP: 32,
		}[format_type]

		tiles = []
		for i in range(tile_count):
			tile_offset = offset + i * tile_size
			if tile_offset + tile_size <= len(self.rom_data):
				tile_data = self.rom_data[tile_offset:tile_offset + tile_size]
				tiles.append(Tile(
					index=i,
					data=tile_data,
					bpp=4 if format_type in (TileFormat.SNES_4BPP, TileFormat.GBA_4BPP) else 2
				))

		return Tileset(
			name=f"tileset_{offset:06X}",
			tiles=tiles,
			format_type=format_type,
			offset=offset
		)

	def extract_nes_chr(self) -> List[Tileset]:
		"""Extract all CHR banks from NES ROM."""
		tilesets = []

		if self.rom_data[:4] != b"NES\x1A":
			return tilesets

		# Parse iNES header
		prg_banks = self.rom_data[4]
		chr_banks = self.rom_data[5]

		# Calculate offsets
		header_size = 16
		prg_size = prg_banks * 16384
		chr_start = header_size + prg_size
		chr_bank_size = 8192
		tiles_per_bank = chr_bank_size // 16

		for bank in range(chr_banks):
			bank_offset = chr_start + bank * chr_bank_size
			tileset = self.extract_tileset(
				bank_offset,
				tiles_per_bank,
				TileFormat.NES_2BPP
			)
			tileset.name = f"CHR_Bank_{bank:02d}"
			tileset.metadata["bank"] = bank
			tilesets.append(tileset)

		return tilesets

	def find_tilesets(self, min_tiles: int = 64) -> List[Tuple[int, int]]:
		"""Find potential tileset locations in ROM."""
		format_type = self.detected_format or self.detect_format()

		tile_size = {
			TileFormat.NES_2BPP: 16,
			TileFormat.SNES_4BPP: 32,
			TileFormat.SNES_2BPP: 16,
			TileFormat.GB_2BPP: 16,
			TileFormat.GBA_4BPP: 32,
			TileFormat.GBA_8BPP: 64,
		}.get(format_type, 16)

		candidates = []

		# Look for aligned tile data
		for offset in range(0, len(self.rom_data) - tile_size * min_tiles, tile_size):
			# Check if this looks like tile data
			score = self._score_tile_region(offset, min_tiles * tile_size, format_type)

			if score > 0.6:  # 60% confidence
				candidates.append((offset, score))

		# Merge adjacent regions
		merged = []
		for offset, score in sorted(candidates):
			if merged and offset - merged[-1][0] < tile_size * 32:
				# Extend previous region
				if score > merged[-1][1]:
					merged[-1] = (merged[-1][0], score)
			else:
				merged.append((offset, score))

		return merged

	def _score_tile_region(self, offset: int, length: int,
						   format_type: TileFormat) -> float:
		"""Score how likely a region contains tile data."""
		if offset + length > len(self.rom_data):
			return 0.0

		data = self.rom_data[offset:offset + length]

		# Tile data characteristics:
		# 1. Not all zeros or all ones
		# 2. Some variety in byte values
		# 3. Patterns that look like graphics

		# Check for variety
		unique_bytes = len(set(data))
		if unique_bytes < 4:
			return 0.0

		# Check for too much repetition
		zero_count = data.count(0)
		ff_count = data.count(0xFF)

		if zero_count / length > 0.95 or ff_count / length > 0.95:
			return 0.0

		# Score based on typical tile patterns
		score = 0.5

		# Bonus for reasonable variety
		if 10 < unique_bytes < 200:
			score += 0.2

		# Bonus for not being mostly zeros
		if 0.1 < zero_count / length < 0.7:
			score += 0.2

		# Penalty for looking like code (lots of common opcodes)
		code_bytes = sum(1 for b in data if b in [0x4C, 0x20, 0x60, 0xA9, 0x8D, 0xAD])
		if code_bytes / length > 0.1:
			score -= 0.3

		return max(0.0, min(1.0, score))

	def render_tileset_to_png(self, tileset: Tileset,
							  output_path: str,
							  tiles_per_row: int = 16,
							  palette: Optional[Palette] = None) -> bool:
		"""Render tileset to PNG image."""
		try:
			from PIL import Image
		except ImportError:
			print("PIL not available. Install with: pip install Pillow")
			return False

		tile_count = len(tileset.tiles)
		if tile_count == 0:
			return False

		rows = (tile_count + tiles_per_row - 1) // tiles_per_row

		# Create image
		img_width = tiles_per_row * 8
		img_height = rows * 8

		# Use palette if provided, otherwise grayscale
		if palette and palette.colors:
			img = Image.new("RGB", (img_width, img_height), (0, 0, 0))
			use_palette = True
		else:
			img = Image.new("L", (img_width, img_height), 0)
			use_palette = False

		pixels = img.load()

		for tile_idx, tile in enumerate(tileset.tiles):
			tile_x = (tile_idx % tiles_per_row) * 8
			tile_y = (tile_idx // tiles_per_row) * 8

			tile_pixels = tile.to_pixels(tileset.format_type)

			for y, row in enumerate(tile_pixels):
				for x, pixel in enumerate(row):
					px = tile_x + x
					py = tile_y + y

					if use_palette and pixel < len(palette.colors):
						pixels[px, py] = palette.colors[pixel]
					else:
						# Grayscale based on BPP
						max_val = (1 << tile.bpp) - 1
						gray = (pixel * 255) // max_val if max_val > 0 else 0
						if use_palette:
							pixels[px, py] = (gray, gray, gray)
						else:
							pixels[px, py] = gray

		img.save(output_path)
		return True

	def export_tileset(self, tileset: Tileset, output_dir: str) -> Dict[str, str]:
		"""Export tileset to files."""
		os.makedirs(output_dir, exist_ok=True)

		files = {}
		base_name = tileset.name

		# Export PNG
		png_path = os.path.join(output_dir, f"{base_name}.png")
		if tileset.palettes:
			self.render_tileset_to_png(tileset, png_path, palette=tileset.palettes[0])
		else:
			self.render_tileset_to_png(tileset, png_path)
		files["png"] = png_path

		# Export raw binary
		bin_path = os.path.join(output_dir, f"{base_name}.bin")
		with open(bin_path, "wb") as f:
			for tile in tileset.tiles:
				f.write(tile.data)
		files["binary"] = bin_path

		# Export metadata
		json_path = os.path.join(output_dir, f"{base_name}.json")
		metadata = tileset.to_dict()
		metadata["tile_size_bytes"] = tileset.get_tile_size_bytes()
		metadata["files"] = {k: os.path.basename(v) for k, v in files.items()}

		with open(json_path, "w", encoding="utf-8") as f:
			json.dump(metadata, f, indent="\t")
		files["metadata"] = json_path

		# Export palettes if present
		if tileset.palettes:
			for i, palette in enumerate(tileset.palettes):
				pal_path = os.path.join(output_dir, f"{base_name}_pal{i}.bin")
				with open(pal_path, "wb") as f:
					f.write(palette.to_rgb555_bytes())
				files[f"palette_{i}"] = pal_path

		return files


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Tileset Ripper")
	parser.add_argument("rom", help="ROM file to extract from")
	parser.add_argument("--output", "-o", help="Output directory")
	parser.add_argument("--offset", type=lambda x: int(x, 0),
						help="Specific offset to extract from")
	parser.add_argument("--count", "-c", type=int, default=256,
						help="Number of tiles to extract")
	parser.add_argument("--format", "-f", choices=[f.name for f in TileFormat],
						help="Tile format")
	parser.add_argument("--find", action="store_true",
						help="Find potential tilesets")
	parser.add_argument("--preview", action="store_true",
						help="Preview mode (no file output)")
	parser.add_argument("--all-chr", action="store_true",
						help="Extract all CHR banks (NES)")

	args = parser.parse_args()

	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)

	# Load ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()

	print(f"ROM: {args.rom}")
	print(f"Size: {len(rom_data):,} bytes")

	ripper = TilesetRipper(rom_data)
	detected_format = ripper.detect_format()
	print(f"Detected format: {detected_format.name}")
	print()

	if args.format:
		format_type = TileFormat[args.format]
	else:
		format_type = detected_format

	if args.find:
		print("Searching for tilesets...")
		candidates = ripper.find_tilesets()

		print(f"Found {len(candidates)} potential tileset locations:")
		for offset, score in candidates[:20]:
			print(f"  0x{offset:06X} (confidence: {score:.1%})")

		if len(candidates) > 20:
			print(f"  ... and {len(candidates) - 20} more")
		return

	if args.all_chr:
		tilesets = ripper.extract_nes_chr()
		print(f"Found {len(tilesets)} CHR banks")

		if args.output and not args.preview:
			for tileset in tilesets:
				tileset_dir = os.path.join(args.output, tileset.name)
				files = ripper.export_tileset(tileset, tileset_dir)
				print(f"Exported {tileset.name}: {len(tileset.tiles)} tiles")
		else:
			for tileset in tilesets:
				print(f"  {tileset.name}: {len(tileset.tiles)} tiles at 0x{tileset.offset:06X}")
		return

	if args.offset is not None:
		tileset = ripper.extract_tileset(args.offset, args.count, format_type)
		print(f"Extracted {len(tileset.tiles)} tiles from 0x{args.offset:06X}")

		if args.output and not args.preview:
			files = ripper.export_tileset(tileset, args.output)
			print(f"Exported to:")
			for name, path in files.items():
				print(f"  {name}: {path}")
	else:
		print("Use --offset to extract from specific location")
		print("Use --find to search for tilesets")
		print("Use --all-chr for NES CHR banks")


if __name__ == "__main__":
	main()
