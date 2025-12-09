#!/usr/bin/env python3
"""
Sprite Sheet Tool - Extract and create sprite sheets from ROMs.

Tools for working with sprite graphics including extraction,
composition, and animation preview.

Usage:
	python sprite_sheet.py rom.nes --extract
	python sprite_sheet.py sprites.png --import
	python sprite_sheet.py --preview

Features:
	- Sprite extraction
	- Sheet composition
	- Animation frames
	- Multiple formats
	- Palette support
"""

import argparse
import json
import os
import struct
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union

try:
	from PIL import Image, ImageDraw
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class SpriteFormat(Enum):
	"""Sprite data formats."""
	NES_1BPP = auto()      # 1 bit per pixel
	NES_2BPP = auto()      # 2 bits per pixel (NES standard)
	SNES_4BPP = auto()     # 4 bits per pixel
	GB_2BPP = auto()       # Game Boy 2bpp
	LINEAR_4BPP = auto()   # Linear 4bpp
	LINEAR_8BPP = auto()   # Linear 8bpp


@dataclass
class SpriteInfo:
	"""Sprite information."""
	index: int
	x: int
	y: int
	width: int
	height: int
	tile_index: int = 0
	palette: int = 0
	flip_h: bool = False
	flip_v: bool = False
	priority: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"index": self.index,
			"x": self.x,
			"y": self.y,
			"width": self.width,
			"height": self.height,
			"tile_index": self.tile_index,
			"palette": self.palette,
			"flip_h": self.flip_h,
			"flip_v": self.flip_v,
			"priority": self.priority
		}


@dataclass
class AnimationFrame:
	"""Animation frame data."""
	frame_index: int
	sprites: List[SpriteInfo]
	duration: int = 1  # In game frames

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"frame_index": self.frame_index,
			"sprites": [s.to_dict() for s in self.sprites],
			"duration": self.duration
		}


@dataclass
class Animation:
	"""Complete animation."""
	name: str
	frames: List[AnimationFrame]
	loop: bool = True

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"frames": [f.to_dict() for f in self.frames],
			"loop": self.loop
		}


class TileDecoder:
	"""Decode tile graphics from various formats."""

	@staticmethod
	def decode_nes_2bpp(data: bytes, tile_index: int = 0) -> List[List[int]]:
		"""Decode NES 2bpp tile (8x8)."""
		pixels = [[0] * 8 for _ in range(8)]
		offset = tile_index * 16

		if offset + 16 > len(data):
			return pixels

		for y in range(8):
			low_byte = data[offset + y]
			high_byte = data[offset + y + 8]

			for x in range(8):
				bit = 7 - x
				pixel = ((low_byte >> bit) & 1) | (((high_byte >> bit) & 1) << 1)
				pixels[y][x] = pixel

		return pixels

	@staticmethod
	def decode_snes_4bpp(data: bytes, tile_index: int = 0) -> List[List[int]]:
		"""Decode SNES 4bpp tile (8x8)."""
		pixels = [[0] * 8 for _ in range(8)]
		offset = tile_index * 32

		if offset + 32 > len(data):
			return pixels

		for y in range(8):
			# First bitplane pair
			bp0 = data[offset + y * 2]
			bp1 = data[offset + y * 2 + 1]
			# Second bitplane pair
			bp2 = data[offset + 16 + y * 2]
			bp3 = data[offset + 16 + y * 2 + 1]

			for x in range(8):
				bit = 7 - x
				pixel = (
					((bp0 >> bit) & 1) |
					(((bp1 >> bit) & 1) << 1) |
					(((bp2 >> bit) & 1) << 2) |
					(((bp3 >> bit) & 1) << 3)
				)
				pixels[y][x] = pixel

		return pixels

	@staticmethod
	def decode_gb_2bpp(data: bytes, tile_index: int = 0) -> List[List[int]]:
		"""Decode Game Boy 2bpp tile (8x8)."""
		pixels = [[0] * 8 for _ in range(8)]
		offset = tile_index * 16

		if offset + 16 > len(data):
			return pixels

		for y in range(8):
			low_byte = data[offset + y * 2]
			high_byte = data[offset + y * 2 + 1]

			for x in range(8):
				bit = 7 - x
				pixel = ((low_byte >> bit) & 1) | (((high_byte >> bit) & 1) << 1)
				pixels[y][x] = pixel

		return pixels


class TileEncoder:
	"""Encode tile graphics to various formats."""

	@staticmethod
	def encode_nes_2bpp(pixels: List[List[int]]) -> bytes:
		"""Encode to NES 2bpp format."""
		output = bytearray(16)

		for y in range(8):
			low_byte = 0
			high_byte = 0

			for x in range(8):
				bit = 7 - x
				pixel = pixels[y][x] & 3
				low_byte |= (pixel & 1) << bit
				high_byte |= ((pixel >> 1) & 1) << bit

			output[y] = low_byte
			output[y + 8] = high_byte

		return bytes(output)

	@staticmethod
	def encode_snes_4bpp(pixels: List[List[int]]) -> bytes:
		"""Encode to SNES 4bpp format."""
		output = bytearray(32)

		for y in range(8):
			bp0 = bp1 = bp2 = bp3 = 0

			for x in range(8):
				bit = 7 - x
				pixel = pixels[y][x] & 0xF
				bp0 |= (pixel & 1) << bit
				bp1 |= ((pixel >> 1) & 1) << bit
				bp2 |= ((pixel >> 2) & 1) << bit
				bp3 |= ((pixel >> 3) & 1) << bit

			output[y * 2] = bp0
			output[y * 2 + 1] = bp1
			output[16 + y * 2] = bp2
			output[16 + y * 2 + 1] = bp3

		return bytes(output)


class SpriteSheet:
	"""Sprite sheet manager."""

	def __init__(self, width: int = 256, height: int = 256):
		self.width = width
		self.height = height
		self.tile_width = 8
		self.tile_height = 8
		self.sprites: List[SpriteInfo] = []
		self.tile_data: bytes = b""
		self.format = SpriteFormat.NES_2BPP
		self.palette: List[Tuple[int, int, int]] = []

	def set_default_palette(self) -> None:
		"""Set default grayscale palette."""
		self.palette = [
			(0, 0, 0),         # Transparent/black
			(85, 85, 85),      # Dark gray
			(170, 170, 170),   # Light gray
			(255, 255, 255),   # White
		]

	def load_tiles(self, data: bytes, fmt: SpriteFormat = SpriteFormat.NES_2BPP) -> None:
		"""Load tile data."""
		self.tile_data = data
		self.format = fmt

	def get_tile_pixels(self, tile_index: int) -> List[List[int]]:
		"""Get pixel data for a tile."""
		if self.format == SpriteFormat.NES_2BPP:
			return TileDecoder.decode_nes_2bpp(self.tile_data, tile_index)
		elif self.format == SpriteFormat.SNES_4BPP:
			return TileDecoder.decode_snes_4bpp(self.tile_data, tile_index)
		elif self.format == SpriteFormat.GB_2BPP:
			return TileDecoder.decode_gb_2bpp(self.tile_data, tile_index)
		else:
			return [[0] * 8 for _ in range(8)]

	def get_tile_count(self) -> int:
		"""Get number of tiles."""
		if self.format == SpriteFormat.NES_2BPP or self.format == SpriteFormat.GB_2BPP:
			return len(self.tile_data) // 16
		elif self.format == SpriteFormat.SNES_4BPP:
			return len(self.tile_data) // 32
		return 0

	def add_sprite(self, sprite: SpriteInfo) -> None:
		"""Add sprite to sheet."""
		self.sprites.append(sprite)

	def render_tile(self, tile_index: int, flip_h: bool = False,
					flip_v: bool = False) -> List[List[int]]:
		"""Render a single tile with flipping."""
		pixels = self.get_tile_pixels(tile_index)

		if flip_h:
			pixels = [row[::-1] for row in pixels]
		if flip_v:
			pixels = pixels[::-1]

		return pixels

	def create_sheet_image(self, cols: int = 16) -> Optional["Image.Image"]:
		"""Create sprite sheet image."""
		if not HAS_PIL:
			print("PIL/Pillow required for image creation")
			return None

		if not self.palette:
			self.set_default_palette()

		tile_count = self.get_tile_count()
		rows = (tile_count + cols - 1) // cols

		width = cols * self.tile_width
		height = rows * self.tile_height

		img = Image.new("RGBA", (width, height), (0, 0, 0, 0))

		for i in range(tile_count):
			x = (i % cols) * self.tile_width
			y = (i // cols) * self.tile_height

			pixels = self.get_tile_pixels(i)

			for py in range(8):
				for px in range(8):
					color_idx = pixels[py][px]
					if color_idx < len(self.palette):
						color = self.palette[color_idx]
						alpha = 0 if color_idx == 0 else 255
						img.putpixel((x + px, y + py), (*color, alpha))

		return img

	def save_sheet(self, filepath: str, cols: int = 16) -> bool:
		"""Save sprite sheet as image."""
		img = self.create_sheet_image(cols)
		if img:
			img.save(filepath)
			return True
		return False

	def save_config(self, filepath: str) -> None:
		"""Save sprite configuration."""
		data = {
			"width": self.width,
			"height": self.height,
			"tile_width": self.tile_width,
			"tile_height": self.tile_height,
			"format": self.format.name,
			"sprites": [s.to_dict() for s in self.sprites],
			"palette": [list(c) for c in self.palette]
		}

		with open(filepath, "w") as f:
			json.dump(data, f, indent="\t")


class AnimationManager:
	"""Manage sprite animations."""

	def __init__(self, sheet: SpriteSheet):
		self.sheet = sheet
		self.animations: Dict[str, Animation] = {}

	def add_animation(self, anim: Animation) -> None:
		"""Add animation."""
		self.animations[anim.name] = anim

	def get_animation(self, name: str) -> Optional[Animation]:
		"""Get animation by name."""
		return self.animations.get(name)

	def create_animation_gif(self, name: str, filepath: str,
							  scale: int = 4) -> bool:
		"""Create animated GIF."""
		if not HAS_PIL:
			return False

		anim = self.animations.get(name)
		if not anim:
			return False

		frames = []

		for frame in anim.frames:
			# Calculate bounds
			min_x = min(s.x for s in frame.sprites)
			min_y = min(s.y for s in frame.sprites)
			max_x = max(s.x + s.width for s in frame.sprites)
			max_y = max(s.y + s.height for s in frame.sprites)

			width = (max_x - min_x) * scale
			height = (max_y - min_y) * scale

			img = Image.new("RGBA", (width, height), (0, 0, 0, 0))

			# Render sprites
			for sprite in sorted(frame.sprites, key=lambda s: s.priority):
				pixels = self.sheet.render_tile(
					sprite.tile_index, sprite.flip_h, sprite.flip_v
				)

				for py in range(min(8, sprite.height)):
					for px in range(min(8, sprite.width)):
						color_idx = pixels[py][px]
						if color_idx > 0 and color_idx < len(self.sheet.palette):
							color = self.sheet.palette[color_idx]
							sx = (sprite.x - min_x + px) * scale
							sy = (sprite.y - min_y + py) * scale

							for dy in range(scale):
								for dx in range(scale):
									if 0 <= sx + dx < width and 0 <= sy + dy < height:
										img.putpixel((sx + dx, sy + dy), (*color, 255))

			frames.append(img)

		if frames:
			frames[0].save(
				filepath, save_all=True, append_images=frames[1:],
				duration=anim.frames[0].duration * 16,  # ~60fps to ms
				loop=0 if anim.loop else 1
			)
			return True

		return False

	def save_animations(self, filepath: str) -> None:
		"""Save animation definitions."""
		data = {
			"animations": [a.to_dict() for a in self.animations.values()]
		}

		with open(filepath, "w") as f:
			json.dump(data, f, indent="\t")

	def load_animations(self, filepath: str) -> None:
		"""Load animation definitions."""
		with open(filepath, "r") as f:
			data = json.load(f)

		for anim_data in data.get("animations", []):
			frames = []
			for frame_data in anim_data.get("frames", []):
				sprites = []
				for sprite_data in frame_data.get("sprites", []):
					sprites.append(SpriteInfo(
						index=sprite_data.get("index", 0),
						x=sprite_data.get("x", 0),
						y=sprite_data.get("y", 0),
						width=sprite_data.get("width", 8),
						height=sprite_data.get("height", 8),
						tile_index=sprite_data.get("tile_index", 0),
						palette=sprite_data.get("palette", 0),
						flip_h=sprite_data.get("flip_h", False),
						flip_v=sprite_data.get("flip_v", False),
						priority=sprite_data.get("priority", 0)
					))

				frames.append(AnimationFrame(
					frame_index=frame_data.get("frame_index", 0),
					sprites=sprites,
					duration=frame_data.get("duration", 1)
				))

			self.animations[anim_data["name"]] = Animation(
				name=anim_data["name"],
				frames=frames,
				loop=anim_data.get("loop", True)
			)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Sprite Sheet Tool")
	parser.add_argument("input", nargs="?", help="Input file")
	parser.add_argument("--extract", "-e", action="store_true",
						help="Extract sprites from ROM")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Start address in ROM")
	parser.add_argument("--count", "-c", type=int, default=256,
						help="Number of tiles to extract")
	parser.add_argument("--format", "-f",
						choices=["nes", "snes", "gb"],
						default="nes", help="Sprite format")
	parser.add_argument("--columns", type=int, default=16,
						help="Columns in sprite sheet")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--palette", "-p", help="Palette file (JSON)")
	parser.add_argument("--animation", help="Animation config file")
	parser.add_argument("--gif", action="store_true",
						help="Create animated GIF")
	parser.add_argument("--anim-name", help="Animation name for GIF")
	parser.add_argument("--scale", type=int, default=4,
						help="Scale for GIF output")

	args = parser.parse_args()

	sheet = SpriteSheet()

	# Set format
	fmt_map = {
		"nes": SpriteFormat.NES_2BPP,
		"snes": SpriteFormat.SNES_4BPP,
		"gb": SpriteFormat.GB_2BPP
	}
	sheet.format = fmt_map.get(args.format, SpriteFormat.NES_2BPP)

	# Load palette
	if args.palette and os.path.exists(args.palette):
		with open(args.palette, "r") as f:
			palette_data = json.load(f)
		sheet.palette = [tuple(c) for c in palette_data.get("colors", [])]
	else:
		sheet.set_default_palette()

	# Extract sprites
	if args.extract and args.input:
		with open(args.input, "rb") as f:
			rom_data = f.read()

		start = args.address or 0
		tile_size = 32 if args.format == "snes" else 16
		size = args.count * tile_size

		tile_data = rom_data[start:start + size]
		sheet.load_tiles(tile_data, sheet.format)

		out_file = args.output or "sprites.png"
		if sheet.save_sheet(out_file, args.columns):
			print(f"Extracted {args.count} tiles to {out_file}")

		# Save config
		config_file = Path(out_file).stem + "_config.json"
		sheet.save_config(config_file)
		print(f"Saved config to {config_file}")
		return

	# Create animation GIF
	if args.gif and args.animation and args.input:
		# Load tile data
		with open(args.input, "rb") as f:
			tile_data = f.read()
		sheet.load_tiles(tile_data, sheet.format)

		anim_mgr = AnimationManager(sheet)
		anim_mgr.load_animations(args.animation)

		anim_name = args.anim_name or list(anim_mgr.animations.keys())[0]
		out_file = args.output or f"{anim_name}.gif"

		if anim_mgr.create_animation_gif(anim_name, out_file, args.scale):
			print(f"Created animation: {out_file}")
		else:
			print("Failed to create animation")
		return

	if not args.input:
		print("Sprite Sheet Tool")
		print()
		print("Usage: python sprite_sheet.py <input> [options]")
		print()
		print("Options:")
		print("  --extract, -e       Extract sprites from ROM")
		print("  --address, -a ADDR  Start address in ROM")
		print("  --count, -c NUM     Number of tiles")
		print("  --format, -f FMT    Sprite format (nes/snes/gb)")
		print("  --columns NUM       Columns in output")
		print("  --output, -o FILE   Output file")
		print("  --palette, -p FILE  Palette file")
		print("  --animation FILE    Animation config")
		print("  --gif               Create animated GIF")
		print("  --scale NUM         GIF scale factor")
		print()
		print("Examples:")
		print("  Extract NES sprites:")
		print("    python sprite_sheet.py game.nes -e -a 0x8000 -c 256")
		print()
		print("  Extract SNES sprites:")
		print("    python sprite_sheet.py game.sfc -e -a 0x10000 -f snes")
		print()
		print("  Create animation GIF:")
		print("    python sprite_sheet.py tiles.bin --gif --animation walk.json")


if __name__ == "__main__":
	main()
