#!/usr/bin/env python3
"""
Palette Editor

View and edit color palettes from NES/SNES ROMs.
Export to various formats and generate preview images.

Features:
- Extract palettes from ROM data
- View NES/SNES color palettes
- Export to GPL (GIMP), PAL, PNG
- Generate color swatches
- Convert between formats

Usage:
	python palette.py view <rom_file> --offset 0x1000 --count 4
	python palette.py export <rom_file> --offset 0x1000 --format gpl --output palette.gpl
	python palette.py convert <input_pal> --from nes --to rgb --output colors.txt
	python palette.py swatch <rom_file> --offset 0x1000 --output swatch.png
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple


try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


# NES master palette (standard, many variants exist)
NES_MASTER_PALETTE = [
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


@dataclass
class Palette:
	"""A color palette"""
	colors: List[Tuple[int, int, int]]  # RGB tuples
	name: str = ""
	format: str = "rgb"


def nes_index_to_rgb(index: int) -> Tuple[int, int, int]:
	"""Convert NES palette index to RGB"""
	if 0 <= index < len(NES_MASTER_PALETTE):
		return NES_MASTER_PALETTE[index]
	return (0, 0, 0)


def snes_color_to_rgb(color: int) -> Tuple[int, int, int]:
	"""Convert SNES 15-bit color to RGB"""
	# SNES format: 0BBBBBGGGGGRRRRR (little-endian)
	r = (color & 0x1F) << 3
	g = ((color >> 5) & 0x1F) << 3
	b = ((color >> 10) & 0x1F) << 3

	# Expand to full 8-bit range
	r = r | (r >> 5)
	g = g | (g >> 5)
	b = b | (b >> 5)

	return (r, g, b)


def rgb_to_snes_color(r: int, g: int, b: int) -> int:
	"""Convert RGB to SNES 15-bit color"""
	r5 = (r >> 3) & 0x1F
	g5 = (g >> 3) & 0x1F
	b5 = (b >> 3) & 0x1F
	return r5 | (g5 << 5) | (b5 << 10)


def extract_nes_palette(data: bytes, offset: int, count: int = 4) -> Palette:
	"""Extract NES palette (4 colors per palette)"""
	colors = []

	for i in range(count * 4):
		if offset + i < len(data):
			index = data[offset + i]
			colors.append(nes_index_to_rgb(index))
		else:
			colors.append((0, 0, 0))

	return Palette(colors=colors, format='nes')


def extract_snes_palette(data: bytes, offset: int, count: int = 16) -> Palette:
	"""Extract SNES palette (16-bit colors)"""
	colors = []

	for i in range(count):
		pos = offset + (i * 2)
		if pos + 2 <= len(data):
			color = struct.unpack('<H', data[pos:pos + 2])[0]
			colors.append(snes_color_to_rgb(color))
		else:
			colors.append((0, 0, 0))

	return Palette(colors=colors, format='snes')


def export_gpl(palette: Palette, filepath: str, name: str = "Palette"):
	"""Export to GIMP palette format"""
	lines = [
		"GIMP Palette",
		f"Name: {name}",
		"#",
	]

	for i, (r, g, b) in enumerate(palette.colors):
		lines.append(f"{r:3} {g:3} {b:3}\tColor {i}")

	with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
		f.write('\n'.join(lines) + '\n')


def export_pal(palette: Palette, filepath: str):
	"""Export to PAL format (raw RGB bytes)"""
	data = bytearray()
	for r, g, b in palette.colors:
		data.extend([r, g, b])

	with open(filepath, 'wb') as f:
		f.write(data)


def export_png_swatch(palette: Palette, filepath: str, swatch_size: int = 32):
	"""Export palette as PNG color swatches"""
	if not HAS_PIL:
		raise ImportError("PIL/Pillow required for PNG export")

	colors_per_row = 16 if len(palette.colors) > 16 else len(palette.colors)
	rows = (len(palette.colors) + colors_per_row - 1) // colors_per_row

	width = colors_per_row * swatch_size
	height = rows * swatch_size

	img = Image.new('RGB', (width, height), (0, 0, 0))

	for i, (r, g, b) in enumerate(palette.colors):
		x = (i % colors_per_row) * swatch_size
		y = (i // colors_per_row) * swatch_size

		for py in range(swatch_size):
			for px in range(swatch_size):
				img.putpixel((x + px, y + py), (r, g, b))

	img.save(filepath)


def display_palette(palette: Palette):
	"""Display palette in terminal"""
	colors_per_row = 4 if palette.format == 'nes' else 16

	print(f"Palette ({len(palette.colors)} colors):")
	print("-" * 60)

	for i, (r, g, b) in enumerate(palette.colors):
		hex_color = f"#{r:02X}{g:02X}{b:02X}"

		# ANSI true color background
		bg = f"\033[48;2;{r};{g};{b}m"
		reset = "\033[0m"

		# Choose text color based on luminance
		lum = 0.299 * r + 0.587 * g + 0.114 * b
		fg = "\033[30m" if lum > 128 else "\033[97m"

		print(f"{bg}{fg} {i:02X} {hex_color} {reset}", end=" ")

		if (i + 1) % colors_per_row == 0:
			print()

	if len(palette.colors) % colors_per_row != 0:
		print()


def main():
	parser = argparse.ArgumentParser(
		description='Palette Editor',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# View command
	view_parser = subparsers.add_parser('view', help='View palette')
	view_parser.add_argument('file', help='ROM file')
	view_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Palette offset')
	view_parser.add_argument('--count', '-c', type=int, default=4, help='Number of palettes (NES: 4 colors each, SNES: 16 colors)')
	view_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes'], help='Palette format')

	# Export command
	export_parser = subparsers.add_parser('export', help='Export palette')
	export_parser.add_argument('file', help='ROM file')
	export_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Palette offset')
	export_parser.add_argument('--count', '-c', type=int, default=4, help='Number of palettes')
	export_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes'], help='ROM palette format')
	export_parser.add_argument('--output-format', default='gpl', choices=['gpl', 'pal', 'png'], help='Output format')
	export_parser.add_argument('--output', required=True, help='Output file')

	# Swatch command
	swatch_parser = subparsers.add_parser('swatch', help='Generate color swatch image')
	swatch_parser.add_argument('file', help='ROM file')
	swatch_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Palette offset')
	swatch_parser.add_argument('--count', '-c', type=int, default=4, help='Number of palettes')
	swatch_parser.add_argument('--format', '-f', default='nes', choices=['nes', 'snes'], help='Palette format')
	swatch_parser.add_argument('--size', '-s', type=int, default=32, help='Swatch size in pixels')
	swatch_parser.add_argument('--output', required=True, help='Output PNG file')

	# Master palette command
	master_parser = subparsers.add_parser('master', help='Show NES master palette')

	args = parser.parse_args()

	if args.command == 'view':
		with open(args.file, 'rb') as f:
			data = f.read()

		if args.format == 'nes':
			palette = extract_nes_palette(data, args.offset, args.count)
		else:
			palette = extract_snes_palette(data, args.offset, args.count * 16)

		print(f"File: {args.file}")
		print(f"Offset: 0x{args.offset:06X}")
		print(f"Format: {args.format.upper()}")
		print()
		display_palette(palette)

	elif args.command == 'export':
		with open(args.file, 'rb') as f:
			data = f.read()

		if args.format == 'nes':
			palette = extract_nes_palette(data, args.offset, args.count)
		else:
			palette = extract_snes_palette(data, args.offset, args.count * 16)

		if args.output_format == 'gpl':
			export_gpl(palette, args.output)
		elif args.output_format == 'pal':
			export_pal(palette, args.output)
		elif args.output_format == 'png':
			if not HAS_PIL:
				print("Error: PIL/Pillow required for PNG export")
				sys.exit(1)
			export_png_swatch(palette, args.output)

		print(f"Exported {len(palette.colors)} colors to: {args.output}")

	elif args.command == 'swatch':
		if not HAS_PIL:
			print("Error: PIL/Pillow required for swatch generation")
			sys.exit(1)

		with open(args.file, 'rb') as f:
			data = f.read()

		if args.format == 'nes':
			palette = extract_nes_palette(data, args.offset, args.count)
		else:
			palette = extract_snes_palette(data, args.offset, args.count * 16)

		export_png_swatch(palette, args.output, args.size)
		print(f"Generated swatch: {args.output}")

	elif args.command == 'master':
		print("NES Master Palette (64 colors):")
		print("-" * 60)

		palette = Palette(colors=NES_MASTER_PALETTE, format='nes')
		# Display in 16-color rows for the master palette
		colors_per_row = 16

		for i, (r, g, b) in enumerate(palette.colors):
			bg = f"\033[48;2;{r};{g};{b}m"
			reset = "\033[0m"
			lum = 0.299 * r + 0.587 * g + 0.114 * b
			fg = "\033[30m" if lum > 128 else "\033[97m"

			print(f"{bg}{fg}{i:02X}{reset}", end=" ")

			if (i + 1) % colors_per_row == 0:
				print()

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
