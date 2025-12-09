#!/usr/bin/env python3
"""
Attribute Table Editor - Edit NES/SNES attribute tables.

Tools for editing tile attribute tables that control palette
assignments and other tile properties.

Usage:
	python attribute_editor.py rom.nes --extract
	python attribute_editor.py attr.bin --view
	python attribute_editor.py --import attr.json

Features:
	- NES attribute table format
	- SNES tilemap attributes
	- Visual editing
	- Palette preview
	- Grid overlay
"""

import argparse
import json
import os
import struct
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

try:
	from PIL import Image, ImageDraw
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class AttributeFormat(Enum):
	"""Attribute table formats."""
	NES_NAMETABLE = auto()   # NES nametable attributes (64 bytes)
	NES_SPRITE = auto()      # NES sprite attributes
	SNES_BG = auto()         # SNES background tilemap
	SNES_OAM = auto()        # SNES sprite OAM
	GB_ATTR = auto()         # Game Boy Color attributes


@dataclass
class TileAttribute:
	"""Attributes for a single tile or tile group."""
	x: int
	y: int
	palette: int
	flip_h: bool = False
	flip_v: bool = False
	priority: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"x": self.x,
			"y": self.y,
			"palette": self.palette,
			"flip_h": self.flip_h,
			"flip_v": self.flip_v,
			"priority": self.priority
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "TileAttribute":
		"""Create from dictionary."""
		return cls(
			x=data.get("x", 0),
			y=data.get("y", 0),
			palette=data.get("palette", 0),
			flip_h=data.get("flip_h", False),
			flip_v=data.get("flip_v", False),
			priority=data.get("priority", 0)
		)


class NESAttributeTable:
	"""NES nametable attribute table (64 bytes)."""

	WIDTH = 8   # 8 attribute bytes per row
	HEIGHT = 8  # 8 rows

	def __init__(self):
		self.data = bytearray(64)  # 64 bytes for 32x30 tiles

	def load(self, data: bytes, offset: int = 0) -> None:
		"""Load attribute data."""
		self.data = bytearray(data[offset:offset + 64])

	def get_palette(self, tile_x: int, tile_y: int) -> int:
		"""Get palette for a tile position (in 8x8 tiles)."""
		# Each attribute byte covers 4x4 tiles (32x32 pixels)
		# Layout: TL, TR, BL, BR (2 bits each)
		attr_x = tile_x // 4
		attr_y = tile_y // 4

		if attr_x >= 8 or attr_y >= 8:
			return 0

		attr_byte = self.data[attr_y * 8 + attr_x]

		# Position within 4x4 group
		sub_x = (tile_x // 2) % 2
		sub_y = (tile_y // 2) % 2

		shift = (sub_y * 2 + sub_x) * 2
		return (attr_byte >> shift) & 0x03

	def set_palette(self, tile_x: int, tile_y: int, palette: int) -> None:
		"""Set palette for a tile position."""
		attr_x = tile_x // 4
		attr_y = tile_y // 4

		if attr_x >= 8 or attr_y >= 8:
			return

		idx = attr_y * 8 + attr_x

		sub_x = (tile_x // 2) % 2
		sub_y = (tile_y // 2) % 2

		shift = (sub_y * 2 + sub_x) * 2
		mask = ~(0x03 << shift)

		self.data[idx] = (self.data[idx] & mask) | ((palette & 0x03) << shift)

	def get_all_attributes(self) -> List[TileAttribute]:
		"""Get all tile attributes."""
		attrs = []
		for y in range(30):  # NES visible area is 30 tiles tall
			for x in range(32):
				attrs.append(TileAttribute(
					x=x, y=y,
					palette=self.get_palette(x, y)
				))
		return attrs

	def to_bytes(self) -> bytes:
		"""Export as bytes."""
		return bytes(self.data)

	def to_json(self) -> Dict[str, Any]:
		"""Export as JSON."""
		# Group by 2x2 tile regions
		regions = []
		for ay in range(8):
			for ax in range(8):
				attr = self.data[ay * 8 + ax]
				regions.append({
					"x": ax * 4,
					"y": ay * 4,
					"tl": attr & 0x03,
					"tr": (attr >> 2) & 0x03,
					"bl": (attr >> 4) & 0x03,
					"br": (attr >> 6) & 0x03
				})

		return {
			"format": "NES_NAMETABLE",
			"regions": regions
		}

	def from_json(self, data: Dict[str, Any]) -> None:
		"""Import from JSON."""
		for region in data.get("regions", []):
			ax = region.get("x", 0) // 4
			ay = region.get("y", 0) // 4

			if ax < 8 and ay < 8:
				attr = (region.get("tl", 0) |
						(region.get("tr", 0) << 2) |
						(region.get("bl", 0) << 4) |
						(region.get("br", 0) << 6))
				self.data[ay * 8 + ax] = attr


class SNESTilemapAttribute:
	"""SNES tilemap word attributes."""

	def __init__(self, width: int = 32, height: int = 32):
		self.width = width
		self.height = height
		# Each entry is 2 bytes: tile number + attributes
		self.data = bytearray(width * height * 2)

	def load(self, data: bytes, offset: int = 0) -> None:
		"""Load tilemap data."""
		size = self.width * self.height * 2
		self.data = bytearray(data[offset:offset + size])

	def get_entry(self, x: int, y: int) -> Tuple[int, int, bool, bool, int]:
		"""Get tilemap entry: (tile, palette, hflip, vflip, priority)."""
		if x >= self.width or y >= self.height:
			return (0, 0, False, False, 0)

		idx = (y * self.width + x) * 2
		word = self.data[idx] | (self.data[idx + 1] << 8)

		tile = word & 0x03FF
		palette = (word >> 10) & 0x07
		priority = (word >> 13) & 0x01
		hflip = bool(word & 0x4000)
		vflip = bool(word & 0x8000)

		return (tile, palette, hflip, vflip, priority)

	def set_entry(self, x: int, y: int, tile: int, palette: int,
				  hflip: bool = False, vflip: bool = False,
				  priority: int = 0) -> None:
		"""Set tilemap entry."""
		if x >= self.width or y >= self.height:
			return

		word = (tile & 0x03FF) | ((palette & 0x07) << 10)
		word |= ((priority & 0x01) << 13)
		if hflip:
			word |= 0x4000
		if vflip:
			word |= 0x8000

		idx = (y * self.width + x) * 2
		self.data[idx] = word & 0xFF
		self.data[idx + 1] = (word >> 8) & 0xFF

	def get_all_attributes(self) -> List[TileAttribute]:
		"""Get all tile attributes."""
		attrs = []
		for y in range(self.height):
			for x in range(self.width):
				tile, pal, hf, vf, pri = self.get_entry(x, y)
				attrs.append(TileAttribute(
					x=x, y=y, palette=pal,
					flip_h=hf, flip_v=vf, priority=pri
				))
		return attrs

	def to_bytes(self) -> bytes:
		"""Export as bytes."""
		return bytes(self.data)

	def to_json(self) -> Dict[str, Any]:
		"""Export as JSON."""
		entries = []
		for y in range(self.height):
			for x in range(self.width):
				tile, pal, hf, vf, pri = self.get_entry(x, y)
				entries.append({
					"x": x, "y": y,
					"tile": tile, "palette": pal,
					"flip_h": hf, "flip_v": vf,
					"priority": pri
				})

		return {
			"format": "SNES_BG",
			"width": self.width,
			"height": self.height,
			"entries": entries
		}


class AttributeVisualizer:
	"""Visualize attribute tables."""

	# Palette colors for visualization
	PALETTE_COLORS = [
		(255, 100, 100),  # Red
		(100, 255, 100),  # Green
		(100, 100, 255),  # Blue
		(255, 255, 100),  # Yellow
		(255, 100, 255),  # Magenta
		(100, 255, 255),  # Cyan
		(255, 180, 100),  # Orange
		(180, 100, 255),  # Purple
	]

	def __init__(self):
		self.tile_size = 16  # Pixels per tile in output

	def visualize_nes_attributes(self, attr: NESAttributeTable,
								  width: int = 32, height: int = 30) -> Optional["Image.Image"]:
		"""Create NES attribute visualization."""
		if not HAS_PIL:
			return None

		img_w = width * self.tile_size
		img_h = height * self.tile_size

		img = Image.new("RGB", (img_w, img_h), (0, 0, 0))
		draw = ImageDraw.Draw(img)

		for y in range(height):
			for x in range(width):
				pal = attr.get_palette(x, y)
				color = self.PALETTE_COLORS[pal % len(self.PALETTE_COLORS)]

				px = x * self.tile_size
				py = y * self.tile_size

				draw.rectangle(
					[px, py, px + self.tile_size - 1, py + self.tile_size - 1],
					fill=color
				)

		# Draw grid for 2x2 tile groups
		grid_color = (128, 128, 128)
		for x in range(0, img_w, self.tile_size * 2):
			draw.line([(x, 0), (x, img_h - 1)], fill=grid_color)
		for y in range(0, img_h, self.tile_size * 2):
			draw.line([(0, y), (img_w - 1, y)], fill=grid_color)

		# Draw thicker grid for 4x4 attribute regions
		attr_grid_color = (255, 255, 255)
		for x in range(0, img_w, self.tile_size * 4):
			draw.line([(x, 0), (x, img_h - 1)], fill=attr_grid_color, width=2)
		for y in range(0, img_h, self.tile_size * 4):
			draw.line([(0, y), (img_w - 1, y)], fill=attr_grid_color, width=2)

		return img

	def visualize_snes_attributes(self, tilemap: SNESTilemapAttribute) -> Optional["Image.Image"]:
		"""Create SNES tilemap attribute visualization."""
		if not HAS_PIL:
			return None

		img_w = tilemap.width * self.tile_size
		img_h = tilemap.height * self.tile_size

		img = Image.new("RGB", (img_w, img_h), (0, 0, 0))
		draw = ImageDraw.Draw(img)

		for y in range(tilemap.height):
			for x in range(tilemap.width):
				tile, pal, hf, vf, pri = tilemap.get_entry(x, y)
				color = self.PALETTE_COLORS[pal % len(self.PALETTE_COLORS)]

				# Darken if priority is set
				if pri:
					color = tuple(c // 2 for c in color)

				px = x * self.tile_size
				py = y * self.tile_size

				draw.rectangle(
					[px, py, px + self.tile_size - 1, py + self.tile_size - 1],
					fill=color
				)

				# Draw flip indicators
				cx = px + self.tile_size // 2
				cy = py + self.tile_size // 2

				if hf:
					draw.line([(px + 2, cy), (px + self.tile_size - 3, cy)],
							  fill=(255, 255, 255))
				if vf:
					draw.line([(cx, py + 2), (cx, py + self.tile_size - 3)],
							  fill=(255, 255, 255))

		return img

	def create_legend(self) -> Optional["Image.Image"]:
		"""Create palette legend."""
		if not HAS_PIL:
			return None

		box_size = 24
		width = len(self.PALETTE_COLORS) * (box_size + 4) + 8
		height = box_size + 20

		img = Image.new("RGB", (width, height), (40, 40, 40))
		draw = ImageDraw.Draw(img)

		for i, color in enumerate(self.PALETTE_COLORS):
			x = 4 + i * (box_size + 4)
			draw.rectangle([x, 4, x + box_size, 4 + box_size], fill=color)
			draw.text((x + box_size // 2 - 3, 6 + box_size), str(i), fill=(255, 255, 255))

		return img


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Attribute Table Editor")
	parser.add_argument("input", nargs="?", help="Input file")
	parser.add_argument("--extract", "-e", action="store_true",
						help="Extract attributes from ROM")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Attribute table address")
	parser.add_argument("--format", "-f", choices=["nes", "snes"],
						default="nes", help="Attribute format")
	parser.add_argument("--view", "-v", action="store_true",
						help="View attribute table")
	parser.add_argument("--visualize", action="store_true",
						help="Create visualization image")
	parser.add_argument("--width", "-w", type=int, default=32,
						help="Tilemap width")
	parser.add_argument("--height", type=int, default=32,
						help="Tilemap height")
	parser.add_argument("--set", "-s", nargs=3, type=int,
						metavar=("X", "Y", "PAL"),
						help="Set tile palette")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--json", action="store_true",
						help="Output as JSON")

	args = parser.parse_args()

	# Extract from ROM
	if args.extract and args.input and args.address is not None:
		with open(args.input, "rb") as f:
			rom_data = f.read()

		if args.format == "nes":
			attr = NESAttributeTable()
			attr.load(rom_data, args.address)

			if args.json:
				out_file = args.output or "attributes.json"
				with open(out_file, "w") as f:
					json.dump(attr.to_json(), f, indent="\t")
				print(f"Exported to {out_file}")
			else:
				out_file = args.output or "attributes.bin"
				with open(out_file, "wb") as f:
					f.write(attr.to_bytes())
				print(f"Extracted 64 bytes to {out_file}")

		elif args.format == "snes":
			tilemap = SNESTilemapAttribute(args.width, args.height)
			tilemap.load(rom_data, args.address)

			if args.json:
				out_file = args.output or "tilemap.json"
				with open(out_file, "w") as f:
					json.dump(tilemap.to_json(), f, indent="\t")
				print(f"Exported to {out_file}")
			else:
				out_file = args.output or "tilemap.bin"
				with open(out_file, "wb") as f:
					f.write(tilemap.to_bytes())
				print(f"Extracted to {out_file}")
		return

	# View attribute table
	if args.view and args.input:
		if args.input.endswith(".json"):
			with open(args.input, "r") as f:
				data = json.load(f)

			fmt = data.get("format", "NES_NAMETABLE")

			if fmt == "NES_NAMETABLE":
				attr = NESAttributeTable()
				attr.from_json(data)

				print("NES Attribute Table (32x30 tiles):")
				for y in range(0, 30, 2):
					row = []
					for x in range(0, 32, 2):
						pal = attr.get_palette(x, y)
						row.append(str(pal))
					print("  " + " ".join(row))
		else:
			# Binary file
			with open(args.input, "rb") as f:
				data = f.read()

			if args.format == "nes":
				attr = NESAttributeTable()
				attr.load(data)

				print("NES Attribute Table:")
				for y in range(8):
					row = []
					for x in range(8):
						byte = attr.data[y * 8 + x]
						row.append(f"{byte:02X}")
					print("  " + " ".join(row))
		return

	# Visualize
	if args.visualize and args.input:
		vis = AttributeVisualizer()

		if args.input.endswith(".json"):
			with open(args.input, "r") as f:
				data = json.load(f)

			fmt = data.get("format", "NES_NAMETABLE")

			if fmt == "NES_NAMETABLE":
				attr = NESAttributeTable()
				attr.from_json(data)
				img = vis.visualize_nes_attributes(attr)
		else:
			with open(args.input, "rb") as f:
				bin_data = f.read()

			if args.format == "nes":
				attr = NESAttributeTable()
				attr.load(bin_data)
				img = vis.visualize_nes_attributes(attr)
			else:
				tilemap = SNESTilemapAttribute(args.width, args.height)
				tilemap.load(bin_data)
				img = vis.visualize_snes_attributes(tilemap)

		if img:
			out_file = args.output or "attributes_vis.png"
			img.save(out_file)
			print(f"Saved visualization to {out_file}")
		return

	# Set attribute
	if args.set and args.input:
		x, y, pal = args.set

		if args.input.endswith(".json"):
			with open(args.input, "r") as f:
				data = json.load(f)

			attr = NESAttributeTable()
			attr.from_json(data)
		else:
			with open(args.input, "rb") as f:
				bin_data = f.read()
			attr = NESAttributeTable()
			attr.load(bin_data)

		attr.set_palette(x, y, pal)
		print(f"Set tile ({x}, {y}) to palette {pal}")

		out_file = args.output or args.input
		if out_file.endswith(".json"):
			with open(out_file, "w") as f:
				json.dump(attr.to_json(), f, indent="\t")
		else:
			with open(out_file, "wb") as f:
				f.write(attr.to_bytes())
		return

	if not args.input:
		print("Attribute Table Editor")
		print()
		print("Usage: python attribute_editor.py <input> [options]")
		print()
		print("Options:")
		print("  --extract, -e       Extract from ROM")
		print("  --address, -a ADDR  Attribute table address")
		print("  --format, -f FMT    Format (nes/snes)")
		print("  --view, -v          View attribute table")
		print("  --visualize         Create visualization")
		print("  --set X Y PAL       Set tile palette")
		print("  --output, -o FILE   Output file")
		print("  --json              Output as JSON")
		print()
		print("Examples:")
		print("  Extract NES attributes:")
		print("    python attribute_editor.py game.nes -e -a 0x23C0")
		print()
		print("  Visualize attributes:")
		print("    python attribute_editor.py attr.bin --visualize")


if __name__ == "__main__":
	main()
