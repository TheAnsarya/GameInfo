#!/usr/bin/env python3
"""
Color Palette Editor - Edit and convert game color palettes.

Tools for working with color palettes in retro games.

Usage:
	python palette_editor.py --analyze rom.nes --offset 0x1000
	python palette_editor.py --convert pal.bin --format nes --to snes
	python palette_editor.py --edit palette.json

Features:
	- NES/SNES/GB/GBA palette formats
	- Color conversion
	- Palette preview
	- Gradient generation
	- Import/export
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class PaletteFormat(Enum):
	"""Palette format types."""
	NES = 0        # NES 64-color system palette
	SNES = 1       # SNES 15-bit BGR
	GB = 2         # Game Boy 2-bit grayscale
	GBC = 3        # Game Boy Color 15-bit BGR
	GBA = 4        # GBA 15-bit BGR
	GENESIS = 5    # Genesis 9-bit BGR
	RGB24 = 6      # 24-bit RGB


@dataclass
class Color:
	"""An RGB color."""
	r: int = 0
	g: int = 0
	b: int = 0

	def to_tuple(self) -> Tuple[int, int, int]:
		"""Get as RGB tuple."""
		return (self.r, self.g, self.b)

	def to_hex(self) -> str:
		"""Get hex string."""
		return f"#{self.r:02X}{self.g:02X}{self.b:02X}"

	def to_nes(self) -> int:
		"""Convert to NES palette index (approximate)."""
		# NES has a fixed 64-color palette, find closest
		return self._find_closest_nes()

	def to_snes(self) -> int:
		"""Convert to SNES 15-bit BGR."""
		r5 = self.r >> 3
		g5 = self.g >> 3
		b5 = self.b >> 3
		return (b5 << 10) | (g5 << 5) | r5

	def to_genesis(self) -> int:
		"""Convert to Genesis 9-bit BGR."""
		r3 = (self.r >> 5) & 0x07
		g3 = (self.g >> 5) & 0x07
		b3 = (self.b >> 5) & 0x07
		return (b3 << 6) | (g3 << 3) | r3

	def to_gb(self) -> int:
		"""Convert to Game Boy 2-bit grayscale."""
		# Average to grayscale, then quantize
		gray = (self.r + self.g + self.b) // 3
		return (3 - (gray >> 6)) & 0x03  # GB: 0=white, 3=black

	@classmethod
	def from_snes(cls, value: int) -> "Color":
		"""Create from SNES 15-bit BGR."""
		r = (value & 0x1F) << 3
		g = ((value >> 5) & 0x1F) << 3
		b = ((value >> 10) & 0x1F) << 3
		return cls(r, g, b)

	@classmethod
	def from_genesis(cls, value: int) -> "Color":
		"""Create from Genesis 9-bit BGR."""
		r = (value & 0x07) << 5
		g = ((value >> 3) & 0x07) << 5
		b = ((value >> 6) & 0x07) << 5
		return cls(r, g, b)

	@classmethod
	def from_gb(cls, value: int) -> "Color":
		"""Create from Game Boy 2-bit value."""
		# GB: 0=white, 3=black
		gray = (3 - (value & 0x03)) * 85
		return cls(gray, gray, gray)

	@classmethod
	def from_hex(cls, hex_str: str) -> "Color":
		"""Create from hex string."""
		hex_str = hex_str.lstrip("#")
		r = int(hex_str[0:2], 16)
		g = int(hex_str[2:4], 16)
		b = int(hex_str[4:6], 16)
		return cls(r, g, b)

	def _find_closest_nes(self) -> int:
		"""Find closest NES palette index."""
		# Standard NES palette (simplified)
		nes_palette = NES_PALETTE

		best_idx = 0
		best_dist = float("inf")

		for i, (pr, pg, pb) in enumerate(nes_palette):
			dist = (self.r - pr) ** 2 + (self.g - pg) ** 2 + (self.b - pb) ** 2
			if dist < best_dist:
				best_dist = dist
				best_idx = i

		return best_idx

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"r": self.r,
			"g": self.g,
			"b": self.b,
			"hex": self.to_hex()
		}


# Standard NES palette (64 colors)
NES_PALETTE = [
	(84, 84, 84), (0, 30, 116), (8, 16, 144), (48, 0, 136),
	(68, 0, 100), (92, 0, 48), (84, 4, 0), (60, 24, 0),
	(32, 42, 0), (8, 58, 0), (0, 64, 0), (0, 60, 0),
	(0, 50, 60), (0, 0, 0), (0, 0, 0), (0, 0, 0),
	(152, 150, 152), (8, 76, 196), (48, 50, 236), (92, 30, 228),
	(136, 20, 176), (160, 20, 100), (152, 34, 32), (120, 60, 0),
	(84, 90, 0), (40, 114, 0), (8, 124, 0), (0, 118, 40),
	(0, 102, 120), (0, 0, 0), (0, 0, 0), (0, 0, 0),
	(236, 238, 236), (76, 154, 236), (120, 124, 236), (176, 98, 236),
	(228, 84, 236), (236, 88, 180), (236, 106, 100), (212, 136, 32),
	(160, 170, 0), (116, 196, 0), (76, 208, 32), (56, 204, 108),
	(56, 180, 204), (60, 60, 60), (0, 0, 0), (0, 0, 0),
	(236, 238, 236), (168, 204, 236), (188, 188, 236), (212, 178, 236),
	(236, 174, 236), (236, 174, 212), (236, 180, 176), (228, 196, 144),
	(204, 210, 120), (180, 222, 120), (168, 226, 144), (152, 226, 180),
	(160, 214, 228), (160, 162, 160), (0, 0, 0), (0, 0, 0),
]


@dataclass
class Palette:
	"""A color palette."""
	name: str = ""
	format: PaletteFormat = PaletteFormat.RGB24
	colors: List[Color] = field(default_factory=list)

	def get_color(self, index: int) -> Optional[Color]:
		"""Get color by index."""
		if 0 <= index < len(self.colors):
			return self.colors[index]
		return None

	def set_color(self, index: int, color: Color):
		"""Set color at index."""
		while len(self.colors) <= index:
			self.colors.append(Color())
		self.colors[index] = color

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"format": self.format.name,
			"colors": [c.to_dict() for c in self.colors]
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Palette":
		"""Create from dictionary."""
		pal = cls(
			name=data.get("name", ""),
			format=PaletteFormat[data.get("format", "RGB24")]
		)

		for color_data in data.get("colors", []):
			if isinstance(color_data, dict):
				pal.colors.append(Color(
					color_data.get("r", 0),
					color_data.get("g", 0),
					color_data.get("b", 0)
				))
			elif isinstance(color_data, str):
				pal.colors.append(Color.from_hex(color_data))

		return pal


class PaletteEditor:
	"""Editor for color palettes."""

	def __init__(self):
		self.palettes: Dict[str, Palette] = {}

	def create_palette(self, name: str, size: int = 16,
					  format: PaletteFormat = PaletteFormat.RGB24) -> Palette:
		"""Create a new palette."""
		pal = Palette(name=name, format=format)
		for _ in range(size):
			pal.colors.append(Color())
		self.palettes[name] = pal
		return pal

	def load_nes_palette(self, data: bytes, offset: int = 0, count: int = 16) -> Palette:
		"""Load NES palette data (indices into system palette)."""
		pal = Palette(name="NES Palette", format=PaletteFormat.NES)

		for i in range(count):
			if offset + i < len(data):
				index = data[offset + i] & 0x3F
				r, g, b = NES_PALETTE[index]
				pal.colors.append(Color(r, g, b))

		return pal

	def load_snes_palette(self, data: bytes, offset: int = 0, count: int = 16) -> Palette:
		"""Load SNES palette data (15-bit BGR)."""
		pal = Palette(name="SNES Palette", format=PaletteFormat.SNES)

		for i in range(count):
			pos = offset + i * 2
			if pos + 2 <= len(data):
				value = struct.unpack("<H", data[pos:pos + 2])[0]
				pal.colors.append(Color.from_snes(value))

		return pal

	def load_genesis_palette(self, data: bytes, offset: int = 0, count: int = 16) -> Palette:
		"""Load Genesis palette data (9-bit BGR)."""
		pal = Palette(name="Genesis Palette", format=PaletteFormat.GENESIS)

		for i in range(count):
			pos = offset + i * 2
			if pos + 2 <= len(data):
				value = struct.unpack(">H", data[pos:pos + 2])[0]
				pal.colors.append(Color.from_genesis(value))

		return pal

	def load_gb_palette(self, data: bytes, offset: int = 0) -> Palette:
		"""Load Game Boy palette data."""
		pal = Palette(name="GB Palette", format=PaletteFormat.GB)

		if offset < len(data):
			value = data[offset]
			for i in range(4):
				shade = (value >> (i * 2)) & 0x03
				pal.colors.append(Color.from_gb(shade))

		return pal

	def save_nes_palette(self, pal: Palette) -> bytes:
		"""Save palette as NES data."""
		data = bytearray()
		for color in pal.colors:
			data.append(color.to_nes())
		return bytes(data)

	def save_snes_palette(self, pal: Palette) -> bytes:
		"""Save palette as SNES data."""
		data = bytearray()
		for color in pal.colors:
			data.extend(struct.pack("<H", color.to_snes()))
		return bytes(data)

	def save_genesis_palette(self, pal: Palette) -> bytes:
		"""Save palette as Genesis data."""
		data = bytearray()
		for color in pal.colors:
			data.extend(struct.pack(">H", color.to_genesis()))
		return bytes(data)

	def save_gb_palette(self, pal: Palette) -> bytes:
		"""Save palette as Game Boy data."""
		value = 0
		for i, color in enumerate(pal.colors[:4]):
			value |= (color.to_gb() & 0x03) << (i * 2)
		return bytes([value])

	def convert_palette(self, pal: Palette,
					   to_format: PaletteFormat) -> Palette:
		"""Convert palette to different format."""
		new_pal = Palette(
			name=f"{pal.name} ({to_format.name})",
			format=to_format
		)

		for color in pal.colors:
			new_pal.colors.append(Color(color.r, color.g, color.b))

		return new_pal

	def generate_gradient(self, start: Color, end: Color,
						 steps: int = 16) -> Palette:
		"""Generate gradient palette."""
		pal = Palette(name="Gradient")

		for i in range(steps):
			t = i / (steps - 1) if steps > 1 else 0
			r = int(start.r + (end.r - start.r) * t)
			g = int(start.g + (end.g - start.g) * t)
			b = int(start.b + (end.b - start.b) * t)
			pal.colors.append(Color(r, g, b))

		return pal

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for pal_data in data.get("palettes", []):
			pal = Palette.from_dict(pal_data)
			self.palettes[pal.name] = pal

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"palettes": [p.to_dict() for p in self.palettes.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def format_palette(self, pal: Palette, width: int = 8) -> str:
		"""Format palette for display."""
		lines = []
		lines.append(f"Palette: {pal.name}")
		lines.append(f"Format: {pal.format.name}")
		lines.append(f"Colors: {len(pal.colors)}")
		lines.append("=" * 50)

		# Color grid
		for i in range(0, len(pal.colors), width):
			row = []
			for j in range(width):
				idx = i + j
				if idx < len(pal.colors):
					color = pal.colors[idx]
					row.append(f"{idx:>2}:{color.to_hex()}")
			lines.append("  ".join(row))

		return "\n".join(lines)

	def format_ascii_preview(self, pal: Palette, width: int = 16) -> str:
		"""Format ASCII preview of palette."""
		lines = []

		# Use block characters with ANSI colors if terminal supports
		# Fallback to simple display
		for i in range(0, len(pal.colors), width):
			row_hex = []
			for j in range(width):
				idx = i + j
				if idx < len(pal.colors):
					color = pal.colors[idx]
					row_hex.append(color.to_hex())
				else:
					row_hex.append("       ")
			lines.append(" ".join(row_hex))

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Color Palette Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze palette in ROM")
	parser.add_argument("--offset", type=str, default="0",
						help="Offset in ROM (hex)")
	parser.add_argument("--count", "-c", type=int, default=16,
						help="Number of colors")
	parser.add_argument("--format", "-f", type=str,
						choices=["nes", "snes", "genesis", "gb", "gbc", "gba"],
						default="nes",
						help="Palette format")
	parser.add_argument("--convert", type=Path,
						help="Convert palette file")
	parser.add_argument("--to", type=str,
						choices=["nes", "snes", "genesis", "gb"],
						help="Target format for conversion")
	parser.add_argument("--gradient", nargs=2, type=str,
						metavar=("START", "END"),
						help="Generate gradient (#RRGGBB colors)")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--nes-system", action="store_true",
						help="Show NES system palette")

	args = parser.parse_args()
	editor = PaletteEditor()

	if args.nes_system:
		print("NES System Palette (64 colors)")
		print("=" * 50)
		for i in range(0, 64, 8):
			row = []
			for j in range(8):
				idx = i + j
				r, g, b = NES_PALETTE[idx]
				hex_str = f"#{r:02X}{g:02X}{b:02X}"
				row.append(f"${idx:02X}:{hex_str}")
			print("  ".join(row))
		return

	offset = int(args.offset, 16) if args.offset.startswith("0x") else int(args.offset)
	if args.offset.startswith("$"):
		offset = int(args.offset[1:], 16)

	if args.analyze:
		data = args.analyze.read_bytes()

		if args.format == "nes":
			pal = editor.load_nes_palette(data, offset, args.count)
		elif args.format in ("snes", "gbc", "gba"):
			pal = editor.load_snes_palette(data, offset, args.count)
		elif args.format == "genesis":
			pal = editor.load_genesis_palette(data, offset, args.count)
		elif args.format == "gb":
			pal = editor.load_gb_palette(data, offset)
		else:
			pal = editor.load_nes_palette(data, offset, args.count)

		print(editor.format_palette(pal))

		if args.output:
			editor.palettes[pal.name] = pal
			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	if args.gradient:
		start = Color.from_hex(args.gradient[0])
		end = Color.from_hex(args.gradient[1])
		pal = editor.generate_gradient(start, end, args.count)

		print(editor.format_palette(pal))

		if args.output:
			editor.palettes[pal.name] = pal
			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	if args.input:
		editor.load_json(args.input)

		for pal in editor.palettes.values():
			print(editor.format_palette(pal))
			print()
		return

	# Default: show help
	print("Color Palette Editor")
	print()
	print("Usage:")
	print("  --analyze FILE           Extract palette from ROM")
	print("  --gradient START END     Generate gradient")
	print("  --nes-system             Show NES system palette")
	print("  --input FILE             Load from JSON")
	print("  --output FILE            Save to JSON")
	print()
	print("Formats: nes, snes, genesis, gb, gbc, gba")


if __name__ == "__main__":
	main()
