#!/usr/bin/env python3
"""
Animation Frame Viewer

View and export sprite animations from NES/SNES ROMs.
Supports frame sequences, timing data, and GIF export.
"""

import argparse
import json
import struct
import sys
from pathlib import Path
from typing import List, Optional, Tuple

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


# NES palette for default rendering
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


class AnimationFrame:
	"""Represents a single animation frame."""

	def __init__(self):
		self.sprites = []  # List of (tile_id, x, y, attributes)
		self.duration = 1  # Duration in game frames
		self.image = None

	def add_sprite(self, tile_id: int, x: int, y: int, attributes: int = 0):
		"""Add a sprite to the frame."""
		self.sprites.append({
			"tile_id": tile_id,
			"x": x,
			"y": y,
			"attributes": attributes,
			"flip_h": bool(attributes & 0x40),
			"flip_v": bool(attributes & 0x80),
			"palette": attributes & 0x03,
		})

	def get_bounds(self) -> Tuple[int, int, int, int]:
		"""Get bounding box of all sprites."""
		if not self.sprites:
			return (0, 0, 8, 8)

		min_x = min(s["x"] for s in self.sprites)
		min_y = min(s["y"] for s in self.sprites)
		max_x = max(s["x"] + 8 for s in self.sprites)
		max_y = max(s["y"] + 8 for s in self.sprites)

		return (min_x, min_y, max_x, max_y)


class Animation:
	"""Represents an animation sequence."""

	def __init__(self, name: str = ""):
		self.name = name
		self.frames: List[AnimationFrame] = []
		self.loop = True

	def add_frame(self, frame: AnimationFrame):
		"""Add a frame to the animation."""
		self.frames.append(frame)

	def get_total_duration(self) -> int:
		"""Get total duration in game frames."""
		return sum(f.duration for f in self.frames)

	def to_dict(self) -> dict:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"loop": self.loop,
			"frames": [
				{
					"duration": f.duration,
					"sprites": f.sprites,
				}
				for f in self.frames
			],
		}


class AnimationViewer:
	"""View and export sprite animations."""

	def __init__(self, chr_data: bytes = None):
		self.chr_data = chr_data
		self.animations: List[Animation] = []
		self.palettes = [
			[(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)],
		]

	def load_chr(self, path: str):
		"""Load CHR data from file."""
		data = Path(path).read_bytes()

		# Check for NES ROM header
		if data[:4] == b'NES\x1a':
			prg_size = data[4] * 16384
			has_trainer = bool(data[6] & 0x04)
			chr_start = 16 + (512 if has_trainer else 0) + prg_size
			chr_size = data[5] * 8192
			self.chr_data = data[chr_start:chr_start + chr_size]
		else:
			self.chr_data = data

	def load_animation_def(self, path: str):
		"""Load animation definition from JSON file."""
		data = json.loads(Path(path).read_text(encoding='utf-8'))

		for anim_data in data.get("animations", []):
			anim = Animation(anim_data.get("name", ""))
			anim.loop = anim_data.get("loop", True)

			for frame_data in anim_data.get("frames", []):
				frame = AnimationFrame()
				frame.duration = frame_data.get("duration", 1)

				for sprite_data in frame_data.get("sprites", []):
					frame.add_sprite(
						sprite_data.get("tile_id", 0),
						sprite_data.get("x", 0),
						sprite_data.get("y", 0),
						sprite_data.get("attributes", 0)
					)

				anim.add_frame(frame)

			self.animations.append(anim)

	def load_palette(self, palette_indices: List[int]):
		"""Load NES palette from indices."""
		colors = []
		for idx in palette_indices:
			if 0 <= idx < len(NES_PALETTE):
				colors.append(NES_PALETTE[idx])
			else:
				colors.append((0, 0, 0))
		self.palettes = [colors]

	def extract_tile(self, tile_id: int) -> List[List[int]]:
		"""Extract a single 8x8 tile (NES 2bpp format)."""
		if not self.chr_data:
			return [[0] * 8 for _ in range(8)]

		offset = tile_id * 16
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

	def render_tile(
		self,
		tile_id: int,
		palette_idx: int = 0,
		flip_h: bool = False,
		flip_v: bool = False
	) -> Optional['Image.Image']:
		"""Render a tile to an image."""
		if not HAS_PIL:
			return None

		tile = self.extract_tile(tile_id)
		palette = self.palettes[palette_idx % len(self.palettes)]

		image = Image.new('RGBA', (8, 8), (0, 0, 0, 0))
		pixels = image.load()

		for y in range(8):
			for x in range(8):
				src_y = (7 - y) if flip_v else y
				src_x = (7 - x) if flip_h else x
				color_idx = tile[src_y][src_x]

				if color_idx == 0:
					# Transparent
					pixels[x, y] = (0, 0, 0, 0)
				elif color_idx < len(palette):
					r, g, b = palette[color_idx]
					pixels[x, y] = (r, g, b, 255)

		return image

	def render_frame(
		self,
		frame: AnimationFrame,
		scale: int = 1,
		bg_color: Tuple[int, int, int, int] = (0, 0, 0, 0)
	) -> Optional['Image.Image']:
		"""Render an animation frame."""
		if not HAS_PIL:
			return None

		# Get bounds
		min_x, min_y, max_x, max_y = frame.get_bounds()
		width = max_x - min_x
		height = max_y - min_y

		# Create image
		image = Image.new('RGBA', (width * scale, height * scale), bg_color)

		# Render each sprite
		for sprite in frame.sprites:
			tile_img = self.render_tile(
				sprite["tile_id"],
				sprite["palette"],
				sprite["flip_h"],
				sprite["flip_v"]
			)

			if tile_img:
				x = (sprite["x"] - min_x) * scale
				y = (sprite["y"] - min_y) * scale

				if scale > 1:
					tile_img = tile_img.resize(
						(8 * scale, 8 * scale),
						Image.Resampling.NEAREST
					)

				image.paste(tile_img, (x, y), tile_img)

		return image

	def export_animation_gif(
		self,
		animation: Animation,
		output_path: str,
		scale: int = 2,
		frame_delay: int = 100,
		bg_color: Tuple[int, int, int, int] = (0, 0, 0, 0)
	):
		"""Export animation as GIF."""
		if not HAS_PIL:
			print("PIL not available - cannot export GIF")
			return

		frames = []
		durations = []

		for frame in animation.frames:
			img = self.render_frame(frame, scale, bg_color)
			if img:
				# Convert to RGB for GIF (no alpha)
				rgb_img = Image.new('RGB', img.size, (0, 0, 0))
				rgb_img.paste(img, mask=img.split()[3] if img.mode == 'RGBA' else None)
				frames.append(rgb_img)
				durations.append(frame.duration * frame_delay)

		if frames:
			frames[0].save(
				output_path,
				save_all=True,
				append_images=frames[1:],
				duration=durations,
				loop=0 if animation.loop else 1
			)
			print(f"Exported {len(frames)} frame animation to {output_path}")

	def export_animation_frames(
		self,
		animation: Animation,
		output_dir: str,
		scale: int = 2,
		bg_color: Tuple[int, int, int, int] = (0, 0, 0, 0)
	):
		"""Export animation as individual frame images."""
		if not HAS_PIL:
			print("PIL not available - cannot export frames")
			return

		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		for i, frame in enumerate(animation.frames):
			img = self.render_frame(frame, scale, bg_color)
			if img:
				frame_path = output_path / f"frame_{i:03d}.png"
				img.save(str(frame_path))

		print(f"Exported {len(animation.frames)} frames to {output_dir}")

	def export_spritesheet(
		self,
		animation: Animation,
		output_path: str,
		scale: int = 2,
		bg_color: Tuple[int, int, int, int] = (0, 0, 0, 0)
	):
		"""Export animation as horizontal spritesheet."""
		if not HAS_PIL:
			print("PIL not available - cannot export spritesheet")
			return

		# Render all frames
		frame_images = []
		for frame in animation.frames:
			img = self.render_frame(frame, scale, bg_color)
			if img:
				frame_images.append(img)

		if not frame_images:
			return

		# Get maximum frame size
		max_width = max(img.width for img in frame_images)
		max_height = max(img.height for img in frame_images)

		# Create spritesheet
		sheet = Image.new('RGBA', (max_width * len(frame_images), max_height), bg_color)

		for i, img in enumerate(frame_images):
			# Center each frame in its cell
			x = i * max_width + (max_width - img.width) // 2
			y = (max_height - img.height) // 2
			sheet.paste(img, (x, y), img)

		sheet.save(output_path)
		print(f"Exported spritesheet ({len(frame_images)} frames) to {output_path}")


def create_sample_animation():
	"""Create a sample animation definition."""
	return {
		"description": "Sample animation definition file",
		"palettes": [
			{
				"name": "default",
				"colors": ["0F", "00", "10", "30"],  # NES palette indices
			}
		],
		"animations": [
			{
				"name": "walk",
				"loop": True,
				"frames": [
					{
						"duration": 8,
						"sprites": [
							{"tile_id": 0, "x": 0, "y": 0, "attributes": 0},
							{"tile_id": 1, "x": 8, "y": 0, "attributes": 0},
							{"tile_id": 2, "x": 0, "y": 8, "attributes": 0},
							{"tile_id": 3, "x": 8, "y": 8, "attributes": 0},
						]
					},
					{
						"duration": 8,
						"sprites": [
							{"tile_id": 4, "x": 0, "y": 0, "attributes": 0},
							{"tile_id": 5, "x": 8, "y": 0, "attributes": 0},
							{"tile_id": 6, "x": 0, "y": 8, "attributes": 0},
							{"tile_id": 7, "x": 8, "y": 8, "attributes": 0},
						]
					}
				]
			}
		]
	}


def main():
	parser = argparse.ArgumentParser(description="Animation Frame Viewer")
	parser.add_argument("--chr", help="CHR data file or NES ROM")
	parser.add_argument("--def", dest="anim_def", help="Animation definition JSON")
	parser.add_argument("-o", "--output", help="Output file/directory")
	parser.add_argument("--gif", action="store_true", help="Export as GIF")
	parser.add_argument("--sheet", action="store_true", help="Export as spritesheet")
	parser.add_argument("--frames", action="store_true",
		help="Export as individual frames")
	parser.add_argument("--scale", type=int, default=2, help="Scale factor")
	parser.add_argument("--delay", type=int, default=100,
		help="Frame delay in ms for GIF")
	parser.add_argument("--palette",
		help="NES palette indices (comma-separated, e.g., '0F,00,10,30')")
	parser.add_argument("--animation", help="Specific animation name to export")
	parser.add_argument("--sample", action="store_true",
		help="Generate sample animation definition")
	parser.add_argument("--list", action="store_true", help="List animations in file")

	args = parser.parse_args()

	if args.sample:
		sample = create_sample_animation()
		output = args.output or "animation_def.json"
		Path(output).write_text(
			json.dumps(sample, indent='\t'),
			encoding='utf-8'
		)
		print(f"Created sample animation definition: {output}")
		return

	if not HAS_PIL:
		print("Warning: PIL not installed. Image export disabled.")
		print("Install with: pip install Pillow")

	viewer = AnimationViewer()

	if args.chr:
		viewer.load_chr(args.chr)

	if args.palette:
		indices = [int(x, 16) for x in args.palette.split(',')]
		viewer.load_palette(indices)

	if args.anim_def:
		viewer.load_animation_def(args.anim_def)

		if args.list:
			print("Animations:")
			for anim in viewer.animations:
				frames = len(anim.frames)
				duration = anim.get_total_duration()
				loop = "loop" if anim.loop else "once"
				print(f"  {anim.name}: {frames} frames, {duration} ticks ({loop})")
			return

		# Select animation to export
		if args.animation:
			animations = [a for a in viewer.animations if a.name == args.animation]
			if not animations:
				print(f"Animation '{args.animation}' not found")
				return
		else:
			animations = viewer.animations

		# Export
		for anim in animations:
			name = anim.name or "animation"

			if args.gif:
				output = args.output or f"{name}.gif"
				viewer.export_animation_gif(anim, output, args.scale, args.delay)

			elif args.sheet:
				output = args.output or f"{name}_sheet.png"
				viewer.export_spritesheet(anim, output, args.scale)

			elif args.frames:
				output_dir = args.output or f"{name}_frames"
				viewer.export_animation_frames(anim, output_dir, args.scale)

			else:
				# Default: export GIF
				output = args.output or f"{name}.gif"
				viewer.export_animation_gif(anim, output, args.scale, args.delay)

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
