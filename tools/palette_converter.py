#!/usr/bin/env python3
"""
Palette Converter

Convert color palettes between different retro console formats.
Supports NES, SNES, Genesis, Game Boy, and modern formats.

Author: GameInfo Project
License: MIT
"""

import struct
import json
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import Enum

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class PaletteFormat(Enum):
	"""Supported palette formats"""
	NES = "nes"           # NES PPU palette indices
	SNES = "snes"         # SNES 15-bit BGR
	GENESIS = "genesis"   # Genesis 9-bit BGR
	GB = "gb"             # Game Boy 2-bit grayscale
	GBC = "gbc"           # Game Boy Color 15-bit BGR
	GBA = "gba"           # GBA 15-bit BGR
	RGB24 = "rgb24"       # Standard 24-bit RGB
	RGBA32 = "rgba32"     # 32-bit RGBA
	GIMP_GPL = "gpl"      # GIMP palette format
	JASC = "jasc"         # JASC/Paint Shop Pro format
	ACT = "act"           # Adobe Color Table
	PAL = "pal"           # Microsoft PAL format
	HEX = "hex"           # Hex color list


@dataclass
class Color:
	"""RGB color"""
	r: int = 0
	g: int = 0
	b: int = 0
	a: int = 255
	
	def to_tuple(self) -> tuple[int, int, int]:
		return (self.r, self.g, self.b)
	
	def to_rgba(self) -> tuple[int, int, int, int]:
		return (self.r, self.g, self.b, self.a)
	
	def to_hex(self) -> str:
		return f"#{self.r:02x}{self.g:02x}{self.b:02x}"
	
	def to_snes(self) -> int:
		"""Convert to SNES 15-bit BGR format"""
		r5 = (self.r * 31) // 255
		g5 = (self.g * 31) // 255
		b5 = (self.b * 31) // 255
		return r5 | (g5 << 5) | (b5 << 10)
	
	def to_genesis(self) -> int:
		"""Convert to Genesis 9-bit BGR format"""
		r3 = (self.r * 7) // 255
		g3 = (self.g * 7) // 255
		b3 = (self.b * 7) // 255
		return (b3 << 9) | (g3 << 5) | (r3 << 1)
	
	@classmethod
	def from_snes(cls, value: int) -> 'Color':
		"""Create from SNES 15-bit BGR value"""
		r5 = value & 0x1f
		g5 = (value >> 5) & 0x1f
		b5 = (value >> 10) & 0x1f
		return cls(
			r=(r5 * 255) // 31,
			g=(g5 * 255) // 31,
			b=(b5 * 255) // 31
		)
	
	@classmethod
	def from_genesis(cls, value: int) -> 'Color':
		"""Create from Genesis 9-bit BGR value"""
		r3 = (value >> 1) & 0x07
		g3 = (value >> 5) & 0x07
		b3 = (value >> 9) & 0x07
		return cls(
			r=(r3 * 255) // 7,
			g=(g3 * 255) // 7,
			b=(b3 * 255) // 7
		)
	
	@classmethod
	def from_hex(cls, hex_str: str) -> 'Color':
		"""Create from hex string"""
		hex_str = hex_str.lstrip('#')
		if len(hex_str) == 6:
			return cls(
				r=int(hex_str[0:2], 16),
				g=int(hex_str[2:4], 16),
				b=int(hex_str[4:6], 16)
			)
		elif len(hex_str) == 8:
			return cls(
				r=int(hex_str[0:2], 16),
				g=int(hex_str[2:4], 16),
				b=int(hex_str[4:6], 16),
				a=int(hex_str[6:8], 16)
			)
		return cls()


@dataclass
class Palette:
	"""Color palette"""
	colors: list[Color] = field(default_factory=list)
	name: str = ""
	format: PaletteFormat = PaletteFormat.RGB24


# Standard NES palette (2C02 NTSC)
NES_PALETTE = [
	Color(84, 84, 84), Color(0, 30, 116), Color(8, 16, 144), Color(48, 0, 136),
	Color(68, 0, 100), Color(92, 0, 48), Color(84, 4, 0), Color(60, 24, 0),
	Color(32, 42, 0), Color(8, 58, 0), Color(0, 64, 0), Color(0, 60, 0),
	Color(0, 50, 60), Color(0, 0, 0), Color(0, 0, 0), Color(0, 0, 0),
	Color(152, 150, 152), Color(8, 76, 196), Color(48, 50, 236), Color(92, 30, 228),
	Color(136, 20, 176), Color(160, 20, 100), Color(152, 34, 32), Color(120, 60, 0),
	Color(84, 90, 0), Color(40, 114, 0), Color(8, 124, 0), Color(0, 118, 40),
	Color(0, 102, 120), Color(0, 0, 0), Color(0, 0, 0), Color(0, 0, 0),
	Color(236, 238, 236), Color(76, 154, 236), Color(120, 124, 236), Color(176, 98, 236),
	Color(228, 84, 236), Color(236, 88, 180), Color(236, 106, 100), Color(212, 136, 32),
	Color(160, 170, 0), Color(116, 196, 0), Color(76, 208, 32), Color(56, 204, 108),
	Color(56, 180, 204), Color(60, 60, 60), Color(0, 0, 0), Color(0, 0, 0),
	Color(236, 238, 236), Color(168, 204, 236), Color(188, 188, 236), Color(212, 178, 236),
	Color(236, 174, 236), Color(236, 174, 212), Color(236, 180, 176), Color(228, 196, 144),
	Color(204, 210, 120), Color(180, 222, 120), Color(168, 226, 144), Color(152, 226, 180),
	Color(160, 214, 228), Color(160, 162, 160), Color(0, 0, 0), Color(0, 0, 0),
]

# Game Boy palettes
GB_DMG_PALETTE = [
	Color(155, 188, 15),   # Lightest
	Color(139, 172, 15),
	Color(48, 98, 48),
	Color(15, 56, 15),     # Darkest
]

GB_POCKET_PALETTE = [
	Color(255, 255, 255),
	Color(170, 170, 170),
	Color(85, 85, 85),
	Color(0, 0, 0),
]


class PaletteConverter:
	"""Convert between palette formats"""
	
	def __init__(self):
		self.nes_palette = NES_PALETTE
	
	def load_palette(self, data: bytes, format: PaletteFormat) -> Palette:
		"""Load palette from binary data"""
		palette = Palette(format=format)
		
		if format == PaletteFormat.NES:
			# NES PPU palette indices
			for byte in data:
				if byte < len(self.nes_palette):
					palette.colors.append(self.nes_palette[byte])
				else:
					palette.colors.append(Color(0, 0, 0))
		
		elif format == PaletteFormat.SNES:
			# SNES 15-bit BGR, little-endian
			for i in range(0, len(data) - 1, 2):
				value = struct.unpack_from('<H', data, i)[0]
				palette.colors.append(Color.from_snes(value))
		
		elif format == PaletteFormat.GENESIS:
			# Genesis 9-bit BGR, big-endian words
			for i in range(0, len(data) - 1, 2):
				value = struct.unpack_from('>H', data, i)[0]
				palette.colors.append(Color.from_genesis(value))
		
		elif format == PaletteFormat.GB:
			# Game Boy 2-bit values
			for byte in data:
				for shift in [0, 2, 4, 6]:
					idx = (byte >> shift) & 0x03
					if idx < len(GB_DMG_PALETTE):
						palette.colors.append(GB_DMG_PALETTE[idx])
		
		elif format == PaletteFormat.GBC:
			# Same as SNES format
			for i in range(0, len(data) - 1, 2):
				value = struct.unpack_from('<H', data, i)[0]
				palette.colors.append(Color.from_snes(value))
		
		elif format == PaletteFormat.RGB24:
			# Standard RGB triplets
			for i in range(0, len(data) - 2, 3):
				palette.colors.append(Color(data[i], data[i+1], data[i+2]))
		
		elif format == PaletteFormat.RGBA32:
			# RGBA quads
			for i in range(0, len(data) - 3, 4):
				palette.colors.append(Color(data[i], data[i+1], data[i+2], data[i+3]))
		
		elif format == PaletteFormat.ACT:
			# Adobe Color Table (256 RGB triplets)
			for i in range(0, min(len(data), 768), 3):
				palette.colors.append(Color(data[i], data[i+1], data[i+2]))
		
		return palette
	
	def save_palette(self, palette: Palette, format: PaletteFormat) -> bytes:
		"""Save palette to binary format"""
		result = bytearray()
		
		if format == PaletteFormat.SNES:
			for color in palette.colors:
				value = color.to_snes()
				result.extend(struct.pack('<H', value))
		
		elif format == PaletteFormat.GENESIS:
			for color in palette.colors:
				value = color.to_genesis()
				result.extend(struct.pack('>H', value))
		
		elif format == PaletteFormat.GBC:
			for color in palette.colors:
				value = color.to_snes()
				result.extend(struct.pack('<H', value))
		
		elif format == PaletteFormat.RGB24:
			for color in palette.colors:
				result.extend([color.r, color.g, color.b])
		
		elif format == PaletteFormat.RGBA32:
			for color in palette.colors:
				result.extend([color.r, color.g, color.b, color.a])
		
		elif format == PaletteFormat.ACT:
			# Adobe Color Table - must be exactly 768 bytes
			for color in palette.colors[:256]:
				result.extend([color.r, color.g, color.b])
			# Pad to 256 colors
			while len(result) < 768:
				result.extend([0, 0, 0])
		
		return bytes(result)
	
	def load_text_palette(self, text: str, format: PaletteFormat) -> Palette:
		"""Load palette from text format"""
		palette = Palette(format=format)
		lines = text.strip().split('\n')
		
		if format == PaletteFormat.GIMP_GPL:
			# GIMP palette format
			in_header = True
			for line in lines:
				line = line.strip()
				if not line or line.startswith('#'):
					continue
				if line.startswith('GIMP Palette'):
					continue
				if line.startswith('Name:'):
					palette.name = line[5:].strip()
					continue
				if line.startswith('Columns:'):
					continue
				
				# Color line: R G B [name]
				parts = line.split()
				if len(parts) >= 3:
					try:
						r, g, b = int(parts[0]), int(parts[1]), int(parts[2])
						palette.colors.append(Color(r, g, b))
					except ValueError:
						continue
		
		elif format == PaletteFormat.JASC:
			# JASC/Paint Shop Pro format
			for i, line in enumerate(lines):
				line = line.strip()
				if i < 3:  # Skip header
					continue
				parts = line.split()
				if len(parts) >= 3:
					try:
						r, g, b = int(parts[0]), int(parts[1]), int(parts[2])
						palette.colors.append(Color(r, g, b))
					except ValueError:
						continue
		
		elif format == PaletteFormat.HEX:
			# Simple hex list
			for line in lines:
				line = line.strip()
				if line and not line.startswith('#'):
					for word in line.split():
						if word.startswith('#') or len(word) in [6, 8]:
							palette.colors.append(Color.from_hex(word))
		
		return palette
	
	def save_text_palette(self, palette: Palette, format: PaletteFormat) -> str:
		"""Save palette to text format"""
		lines = []
		
		if format == PaletteFormat.GIMP_GPL:
			lines.append("GIMP Palette")
			lines.append(f"Name: {palette.name or 'Untitled'}")
			lines.append("Columns: 16")
			lines.append("#")
			for i, color in enumerate(palette.colors):
				lines.append(f"{color.r:3d} {color.g:3d} {color.b:3d}\tColor {i}")
		
		elif format == PaletteFormat.JASC:
			lines.append("JASC-PAL")
			lines.append("0100")
			lines.append(str(len(palette.colors)))
			for color in palette.colors:
				lines.append(f"{color.r} {color.g} {color.b}")
		
		elif format == PaletteFormat.HEX:
			for color in palette.colors:
				lines.append(color.to_hex())
		
		return '\n'.join(lines)
	
	def convert(self, palette: Palette, target_format: PaletteFormat) -> Palette:
		"""Convert palette to different format"""
		new_palette = Palette(
			name=palette.name,
			format=target_format,
			colors=list(palette.colors)  # Copy colors
		)
		return new_palette
	
	def render_swatch(self, palette: Palette, 
					 swatch_size: int = 16,
					 columns: int = 16) -> Optional['Image.Image']:
		"""Render palette as color swatch image"""
		if not HAS_PIL:
			return None
		
		num_colors = len(palette.colors)
		rows = (num_colors + columns - 1) // columns
		
		img = Image.new('RGB', (columns * swatch_size, rows * swatch_size))
		
		for i, color in enumerate(palette.colors):
			x = (i % columns) * swatch_size
			y = (i // columns) * swatch_size
			
			for dy in range(swatch_size):
				for dx in range(swatch_size):
					img.putpixel((x + dx, y + dy), color.to_tuple())
		
		return img


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Palette Converter - Convert between retro palette formats"
	)
	subparsers = parser.add_subparsers(dest='command', help='Commands')
	
	# Convert command
	convert_parser = subparsers.add_parser('convert', help='Convert palette format')
	convert_parser.add_argument('input', help='Input palette file')
	convert_parser.add_argument('-o', '--output', required=True, help='Output file')
	convert_parser.add_argument('--from', dest='from_format',
							   choices=['nes', 'snes', 'genesis', 'gb', 'gbc', 'gba',
									   'rgb24', 'rgba32', 'gpl', 'jasc', 'act', 'hex'],
							   required=True, help='Source format')
	convert_parser.add_argument('--to', dest='to_format',
							   choices=['snes', 'genesis', 'gbc', 'rgb24', 'rgba32',
									   'gpl', 'jasc', 'act', 'hex'],
							   required=True, help='Target format')
	
	# Render command
	render_parser = subparsers.add_parser('render', help='Render palette as image')
	render_parser.add_argument('input', help='Input palette file')
	render_parser.add_argument('-o', '--output', required=True, help='Output image')
	render_parser.add_argument('--format', choices=['nes', 'snes', 'genesis', 'gb', 'gbc',
												   'rgb24', 'gpl', 'jasc', 'hex'],
							  required=True, help='Input format')
	render_parser.add_argument('--size', type=int, default=16, help='Swatch size')
	render_parser.add_argument('--columns', type=int, default=16, help='Columns')
	
	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract palette from ROM')
	extract_parser.add_argument('rom', help='Input ROM file')
	extract_parser.add_argument('-o', '--output', required=True, help='Output file')
	extract_parser.add_argument('--offset', type=lambda x: int(x, 0), required=True,
							   help='Offset in ROM')
	extract_parser.add_argument('--count', type=int, default=16, help='Number of colors')
	extract_parser.add_argument('--format', choices=['snes', 'genesis', 'gbc', 'nes'],
							   required=True, help='Palette format in ROM')
	extract_parser.add_argument('--output-format', choices=['gpl', 'jasc', 'hex'],
							   default='gpl', help='Output format')
	
	args = parser.parse_args()
	converter = PaletteConverter()
	
	format_map = {
		'nes': PaletteFormat.NES,
		'snes': PaletteFormat.SNES,
		'genesis': PaletteFormat.GENESIS,
		'gb': PaletteFormat.GB,
		'gbc': PaletteFormat.GBC,
		'gba': PaletteFormat.GBA,
		'rgb24': PaletteFormat.RGB24,
		'rgba32': PaletteFormat.RGBA32,
		'gpl': PaletteFormat.GIMP_GPL,
		'jasc': PaletteFormat.JASC,
		'act': PaletteFormat.ACT,
		'hex': PaletteFormat.HEX,
	}
	
	if args.command == 'convert':
		input_path = Path(args.input)
		from_fmt = format_map[args.from_format]
		to_fmt = format_map[args.to_format]
		
		# Load
		if from_fmt in [PaletteFormat.GIMP_GPL, PaletteFormat.JASC, PaletteFormat.HEX]:
			text = input_path.read_text(encoding='utf-8')
			palette = converter.load_text_palette(text, from_fmt)
		else:
			data = input_path.read_bytes()
			palette = converter.load_palette(data, from_fmt)
		
		# Convert
		palette = converter.convert(palette, to_fmt)
		
		# Save
		output_path = Path(args.output)
		if to_fmt in [PaletteFormat.GIMP_GPL, PaletteFormat.JASC, PaletteFormat.HEX]:
			text = converter.save_text_palette(palette, to_fmt)
			output_path.write_text(text, encoding='utf-8')
		else:
			data = converter.save_palette(palette, to_fmt)
			output_path.write_bytes(data)
		
		print(f"Converted {len(palette.colors)} colors to {args.output}")
	
	elif args.command == 'render':
		if not HAS_PIL:
			print("PIL required for rendering")
			return
		
		input_path = Path(args.input)
		fmt = format_map[args.format]
		
		if fmt in [PaletteFormat.GIMP_GPL, PaletteFormat.JASC, PaletteFormat.HEX]:
			text = input_path.read_text(encoding='utf-8')
			palette = converter.load_text_palette(text, fmt)
		else:
			data = input_path.read_bytes()
			palette = converter.load_palette(data, fmt)
		
		img = converter.render_swatch(palette, args.size, args.columns)
		if img:
			img.save(args.output)
			print(f"Saved swatch to {args.output}")
	
	elif args.command == 'extract':
		rom_data = Path(args.rom).read_bytes()
		fmt = format_map[args.format]
		out_fmt = format_map[args.output_format]
		
		# Calculate data size
		if fmt == PaletteFormat.NES:
			size = args.count
		elif fmt in [PaletteFormat.SNES, PaletteFormat.GBC]:
			size = args.count * 2
		elif fmt == PaletteFormat.GENESIS:
			size = args.count * 2
		else:
			size = args.count * 3
		
		palette_data = rom_data[args.offset:args.offset + size]
		palette = converter.load_palette(palette_data, fmt)
		
		# Save
		output_path = Path(args.output)
		text = converter.save_text_palette(palette, out_fmt)
		output_path.write_text(text, encoding='utf-8')
		
		print(f"Extracted {len(palette.colors)} colors to {args.output}")
	
	else:
		parser.print_help()


if __name__ == "__main__":
	main()
