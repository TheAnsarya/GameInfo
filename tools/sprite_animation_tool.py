#!/usr/bin/env python3
"""
Sprite Animation Tool

Extracts, visualizes, and edits sprite animations from retro game ROMs.
Supports NES, SNES, Genesis, and Game Boy formats.

Author: GameInfo Project
License: MIT
"""

import struct
import json
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional, BinaryIO
from enum import Enum

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class Platform(Enum):
	"""Supported platforms"""
	NES = "nes"
	SNES = "snes"
	GENESIS = "genesis"
	GAME_BOY = "gb"
	GAME_BOY_COLOR = "gbc"
	GBA = "gba"


@dataclass
class SpriteFrame:
	"""A single frame of sprite animation"""
	tile_indices: list[int] = field(default_factory=list)
	x_offset: int = 0
	y_offset: int = 0
	flip_h: bool = False
	flip_v: bool = False
	palette: int = 0
	duration: int = 1  # In frames
	width: int = 8
	height: int = 8
	priority: int = 0


@dataclass
class Animation:
	"""A complete animation sequence"""
	name: str = ""
	frames: list[SpriteFrame] = field(default_factory=list)
	loop: bool = True
	loop_point: int = 0


@dataclass
class SpriteSheet:
	"""Collection of sprite tiles"""
	tiles: list[bytes] = field(default_factory=list)
	tile_width: int = 8
	tile_height: int = 8
	bpp: int = 2  # Bits per pixel


@dataclass
class Palette:
	"""Color palette"""
	colors: list[tuple[int, int, int]] = field(default_factory=list)
	name: str = ""


class NESPaletteColors:
	"""Standard NES palette"""
	COLORS = [
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


class SpriteAnimationExtractor:
	"""Extract sprite animations from ROM data"""
	
	def __init__(self, platform: Platform = Platform.NES):
		self.platform = platform
		self.sprite_sheets: list[SpriteSheet] = []
		self.animations: list[Animation] = []
		self.palettes: list[Palette] = []
	
	def load_chr_data(self, data: bytes, bpp: int = 2) -> SpriteSheet:
		"""Load CHR/tile data into sprite sheet"""
		sheet = SpriteSheet(bpp=bpp)
		
		if self.platform == Platform.NES:
			# NES: 2bpp planar, 16 bytes per 8x8 tile
			tile_size = 16
			for i in range(0, len(data), tile_size):
				if i + tile_size <= len(data):
					sheet.tiles.append(data[i:i + tile_size])
		
		elif self.platform == Platform.SNES:
			# SNES: 4bpp planar, 32 bytes per 8x8 tile
			if bpp == 4:
				tile_size = 32
			elif bpp == 2:
				tile_size = 16
			elif bpp == 8:
				tile_size = 64
			else:
				tile_size = 16
			
			for i in range(0, len(data), tile_size):
				if i + tile_size <= len(data):
					sheet.tiles.append(data[i:i + tile_size])
		
		elif self.platform == Platform.GENESIS:
			# Genesis: 4bpp linear/packed, 32 bytes per 8x8 tile
			tile_size = 32
			for i in range(0, len(data), tile_size):
				if i + tile_size <= len(data):
					sheet.tiles.append(data[i:i + tile_size])
		
		elif self.platform in (Platform.GAME_BOY, Platform.GAME_BOY_COLOR):
			# Game Boy: 2bpp interleaved, 16 bytes per 8x8 tile
			tile_size = 16
			for i in range(0, len(data), tile_size):
				if i + tile_size <= len(data):
					sheet.tiles.append(data[i:i + tile_size])
		
		self.sprite_sheets.append(sheet)
		return sheet
	
	def decode_nes_tile(self, tile_data: bytes) -> list[list[int]]:
		"""Decode NES 2bpp planar tile to pixel data"""
		pixels = [[0] * 8 for _ in range(8)]
		
		for y in range(8):
			low_byte = tile_data[y]
			high_byte = tile_data[y + 8]
			
			for x in range(8):
				bit_pos = 7 - x
				pixel = ((low_byte >> bit_pos) & 1) | (((high_byte >> bit_pos) & 1) << 1)
				pixels[y][x] = pixel
		
		return pixels
	
	def decode_snes_tile_4bpp(self, tile_data: bytes) -> list[list[int]]:
		"""Decode SNES 4bpp planar tile to pixel data"""
		pixels = [[0] * 8 for _ in range(8)]
		
		for y in range(8):
			# Bitplanes are interleaved in pairs
			bp0 = tile_data[y * 2]
			bp1 = tile_data[y * 2 + 1]
			bp2 = tile_data[16 + y * 2]
			bp3 = tile_data[16 + y * 2 + 1]
			
			for x in range(8):
				bit_pos = 7 - x
				pixel = ((bp0 >> bit_pos) & 1) | \
						(((bp1 >> bit_pos) & 1) << 1) | \
						(((bp2 >> bit_pos) & 1) << 2) | \
						(((bp3 >> bit_pos) & 1) << 3)
				pixels[y][x] = pixel
		
		return pixels
	
	def decode_genesis_tile(self, tile_data: bytes) -> list[list[int]]:
		"""Decode Genesis 4bpp packed tile to pixel data"""
		pixels = [[0] * 8 for _ in range(8)]
		
		for y in range(8):
			for x in range(4):
				byte_idx = y * 4 + x
				byte_val = tile_data[byte_idx]
				pixels[y][x * 2] = (byte_val >> 4) & 0x0f
				pixels[y][x * 2 + 1] = byte_val & 0x0f
		
		return pixels
	
	def decode_gb_tile(self, tile_data: bytes) -> list[list[int]]:
		"""Decode Game Boy 2bpp interleaved tile to pixel data"""
		pixels = [[0] * 8 for _ in range(8)]
		
		for y in range(8):
			low_byte = tile_data[y * 2]
			high_byte = tile_data[y * 2 + 1]
			
			for x in range(8):
				bit_pos = 7 - x
				pixel = ((low_byte >> bit_pos) & 1) | (((high_byte >> bit_pos) & 1) << 1)
				pixels[y][x] = pixel
		
		return pixels
	
	def decode_tile(self, tile_data: bytes, bpp: int = 2) -> list[list[int]]:
		"""Decode tile based on platform"""
		if self.platform == Platform.NES:
			return self.decode_nes_tile(tile_data)
		elif self.platform == Platform.SNES:
			if bpp == 4:
				return self.decode_snes_tile_4bpp(tile_data)
			else:
				return self.decode_nes_tile(tile_data)  # 2bpp same as NES
		elif self.platform == Platform.GENESIS:
			return self.decode_genesis_tile(tile_data)
		elif self.platform in (Platform.GAME_BOY, Platform.GAME_BOY_COLOR):
			return self.decode_gb_tile(tile_data)
		else:
			return self.decode_nes_tile(tile_data)
	
	def render_tile(self, tile_data: bytes, palette: Palette,
					bpp: int = 2) -> Optional['Image.Image']:
		"""Render a single tile to an image"""
		if not HAS_PIL:
			return None
		
		pixels = self.decode_tile(tile_data, bpp)
		img = Image.new('RGBA', (8, 8))
		
		for y in range(8):
			for x in range(8):
				color_idx = pixels[y][x]
				if color_idx == 0:
					# Transparent
					img.putpixel((x, y), (0, 0, 0, 0))
				elif color_idx < len(palette.colors):
					r, g, b = palette.colors[color_idx]
					img.putpixel((x, y), (r, g, b, 255))
				else:
					img.putpixel((x, y), (255, 0, 255, 255))  # Magenta for invalid
		
		return img
	
	def render_sprite_frame(self, frame: SpriteFrame, sheet: SpriteSheet,
						   palette: Palette) -> Optional['Image.Image']:
		"""Render a sprite frame to an image"""
		if not HAS_PIL:
			return None
		
		# Calculate frame dimensions
		width = frame.width
		height = frame.height
		
		img = Image.new('RGBA', (width, height))
		
		# Render each tile
		tiles_per_row = width // sheet.tile_width
		for i, tile_idx in enumerate(frame.tile_indices):
			if tile_idx >= len(sheet.tiles):
				continue
			
			tile_x = (i % tiles_per_row) * sheet.tile_width
			tile_y = (i // tiles_per_row) * sheet.tile_height
			
			tile_img = self.render_tile(sheet.tiles[tile_idx], palette, sheet.bpp)
			if tile_img:
				if frame.flip_h:
					tile_img = tile_img.transpose(Image.FLIP_LEFT_RIGHT)
				if frame.flip_v:
					tile_img = tile_img.transpose(Image.FLIP_TOP_BOTTOM)
				
				img.paste(tile_img, (tile_x, tile_y), tile_img)
		
		return img
	
	def export_animation_gif(self, animation: Animation, sheet: SpriteSheet,
							palette: Palette, output_path: Path,
							scale: int = 4):
		"""Export animation as animated GIF"""
		if not HAS_PIL:
			print("PIL not available - cannot export GIF")
			return
		
		frames = []
		durations = []
		
		for frame in animation.frames:
			img = self.render_sprite_frame(frame, sheet, palette)
			if img:
				# Scale up for visibility
				scaled = img.resize((img.width * scale, img.height * scale),
								   Image.NEAREST)
				frames.append(scaled)
				# Duration in milliseconds (assume 60fps base)
				durations.append(int(frame.duration * (1000 / 60)))
		
		if frames:
			frames[0].save(
				output_path,
				save_all=True,
				append_images=frames[1:],
				duration=durations,
				loop=0 if animation.loop else 1,
				disposal=2
			)
			print(f"Exported animation to {output_path}")
	
	def export_sprite_sheet_image(self, sheet: SpriteSheet, palette: Palette,
								 output_path: Path, tiles_per_row: int = 16,
								 scale: int = 2):
		"""Export sprite sheet as PNG image"""
		if not HAS_PIL:
			print("PIL not available - cannot export image")
			return
		
		num_tiles = len(sheet.tiles)
		if num_tiles == 0:
			print("No tiles to export")
			return
		
		rows = (num_tiles + tiles_per_row - 1) // tiles_per_row
		width = tiles_per_row * sheet.tile_width
		height = rows * sheet.tile_height
		
		img = Image.new('RGBA', (width, height))
		
		for i, tile_data in enumerate(sheet.tiles):
			x = (i % tiles_per_row) * sheet.tile_width
			y = (i // tiles_per_row) * sheet.tile_height
			
			tile_img = self.render_tile(tile_data, palette, sheet.bpp)
			if tile_img:
				img.paste(tile_img, (x, y), tile_img)
		
		# Scale up
		scaled = img.resize((width * scale, height * scale), Image.NEAREST)
		scaled.save(output_path)
		print(f"Exported sprite sheet to {output_path}")


class AnimationParser:
	"""Parse animation data from various game formats"""
	
	def __init__(self):
		self.animations: list[Animation] = []
	
	def parse_simple_format(self, data: bytes, frame_size: int = 4) -> list[Animation]:
		"""Parse simple sequential animation format
		
		Common format:
		- 1 byte: tile index
		- 1 byte: attributes (flip, palette)
		- 1 byte: x offset
		- 1 byte: y offset
		"""
		animations = []
		animation = Animation(name="animation_0")
		
		for i in range(0, len(data), frame_size):
			if i + frame_size > len(data):
				break
			
			tile_idx = data[i]
			attrs = data[i + 1]
			x_offset = struct.unpack('b', bytes([data[i + 2]]))[0]
			y_offset = struct.unpack('b', bytes([data[i + 3]]))[0]
			
			# Check for animation terminator
			if tile_idx == 0xff:
				if animation.frames:
					animations.append(animation)
				animation = Animation(name=f"animation_{len(animations)}")
				continue
			
			frame = SpriteFrame(
				tile_indices=[tile_idx],
				x_offset=x_offset,
				y_offset=y_offset,
				flip_h=bool(attrs & 0x40),
				flip_v=bool(attrs & 0x80),
				palette=(attrs & 0x03),
				priority=(attrs >> 4) & 0x03,
			)
			animation.frames.append(frame)
		
		if animation.frames:
			animations.append(animation)
		
		self.animations = animations
		return animations
	
	def parse_nes_oam_format(self, data: bytes) -> list[SpriteFrame]:
		"""Parse NES OAM-style sprite data
		
		4 bytes per sprite:
		- Y position
		- Tile index
		- Attributes
		- X position
		"""
		sprites = []
		
		for i in range(0, min(len(data), 256), 4):
			y_pos = data[i]
			tile_idx = data[i + 1]
			attrs = data[i + 2]
			x_pos = data[i + 3]
			
			# Skip hidden sprites
			if y_pos >= 0xef:
				continue
			
			sprite = SpriteFrame(
				tile_indices=[tile_idx],
				x_offset=x_pos,
				y_offset=y_pos,
				flip_h=bool(attrs & 0x40),
				flip_v=bool(attrs & 0x80),
				palette=(attrs & 0x03),
				priority=(attrs >> 5) & 0x01,
			)
			sprites.append(sprite)
		
		return sprites
	
	def parse_snes_oam_format(self, data: bytes, high_table: bytes = None) -> list[SpriteFrame]:
		"""Parse SNES OAM-style sprite data
		
		4 bytes per sprite (low table):
		- X position (low 8 bits)
		- Y position
		- Tile index (low 8 bits)
		- Attributes
		
		Plus 1 bit pairs in high table for X sign and size
		"""
		sprites = []
		num_sprites = min(len(data) // 4, 128)
		
		for i in range(num_sprites):
			base = i * 4
			x_pos = data[base]
			y_pos = data[base + 1]
			tile_idx = data[base + 2]
			attrs = data[base + 3]
			
			# High table data
			x_sign = False
			large = False
			if high_table:
				high_idx = i // 4
				bit_pos = (i % 4) * 2
				if high_idx < len(high_table):
					high_byte = high_table[high_idx]
					x_sign = bool(high_byte & (1 << bit_pos))
					large = bool(high_byte & (1 << (bit_pos + 1)))
			
			# Adjust x position
			if x_sign:
				x_pos = x_pos - 256
			
			sprite = SpriteFrame(
				tile_indices=[tile_idx + ((attrs & 0x01) << 8)],
				x_offset=x_pos,
				y_offset=y_pos,
				flip_h=bool(attrs & 0x40),
				flip_v=bool(attrs & 0x80),
				palette=(attrs >> 1) & 0x07,
				priority=(attrs >> 4) & 0x03,
				width=16 if large else 8,
				height=16 if large else 8,
			)
			sprites.append(sprite)
		
		return sprites
	
	def to_json(self) -> dict:
		"""Export animations to JSON format"""
		return {
			'animations': [
				{
					'name': anim.name,
					'loop': anim.loop,
					'loop_point': anim.loop_point,
					'frames': [
						{
							'tiles': frame.tile_indices,
							'x': frame.x_offset,
							'y': frame.y_offset,
							'flip_h': frame.flip_h,
							'flip_v': frame.flip_v,
							'palette': frame.palette,
							'duration': frame.duration,
							'width': frame.width,
							'height': frame.height,
						}
						for frame in anim.frames
					]
				}
				for anim in self.animations
			]
		}
	
	def from_json(self, data: dict):
		"""Import animations from JSON format"""
		self.animations = []
		
		for anim_data in data.get('animations', []):
			anim = Animation(
				name=anim_data.get('name', ''),
				loop=anim_data.get('loop', True),
				loop_point=anim_data.get('loop_point', 0),
			)
			
			for frame_data in anim_data.get('frames', []):
				frame = SpriteFrame(
					tile_indices=frame_data.get('tiles', []),
					x_offset=frame_data.get('x', 0),
					y_offset=frame_data.get('y', 0),
					flip_h=frame_data.get('flip_h', False),
					flip_v=frame_data.get('flip_v', False),
					palette=frame_data.get('palette', 0),
					duration=frame_data.get('duration', 1),
					width=frame_data.get('width', 8),
					height=frame_data.get('height', 8),
				)
				anim.frames.append(frame)
			
			self.animations.append(anim)


def create_default_palette(platform: Platform) -> Palette:
	"""Create default palette for platform"""
	if platform == Platform.NES:
		# Default NES grayscale-ish palette
		return Palette(
			name="default_nes",
			colors=[
				(0, 0, 0),        # Background (transparent)
				(84, 84, 84),     # Dark gray
				(168, 168, 168),  # Light gray
				(252, 252, 252),  # White
			]
		)
	elif platform == Platform.GAME_BOY:
		# Classic GB green palette
		return Palette(
			name="default_gb",
			colors=[
				(155, 188, 15),   # Lightest
				(139, 172, 15),
				(48, 98, 48),
				(15, 56, 15),     # Darkest
			]
		)
	elif platform == Platform.SNES:
		# 16-color grayscale
		colors = [(i * 17, i * 17, i * 17) for i in range(16)]
		return Palette(name="default_snes", colors=colors)
	elif platform == Platform.GENESIS:
		# 16-color grayscale
		colors = [(i * 17, i * 17, i * 17) for i in range(16)]
		return Palette(name="default_genesis", colors=colors)
	else:
		return Palette(name="default", colors=[(0, 0, 0), (85, 85, 85), (170, 170, 170), (255, 255, 255)])


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Sprite Animation Tool - Extract and visualize sprite animations"
	)
	parser.add_argument("input", help="Input ROM or CHR file")
	parser.add_argument("-o", "--output", help="Output directory", default="sprites")
	parser.add_argument("--platform", choices=['nes', 'snes', 'genesis', 'gb', 'gbc', 'gba'],
						default='nes', help="Target platform")
	parser.add_argument("--chr-offset", type=lambda x: int(x, 0), default=0,
						help="Offset to CHR/tile data in file")
	parser.add_argument("--chr-size", type=lambda x: int(x, 0), default=0x2000,
						help="Size of CHR data to extract")
	parser.add_argument("--bpp", type=int, choices=[2, 4, 8], default=2,
						help="Bits per pixel")
	parser.add_argument("--palette", help="Palette file (JSON)")
	parser.add_argument("--scale", type=int, default=4, help="Output scale factor")
	parser.add_argument("--export-sheet", action="store_true",
						help="Export sprite sheet as PNG")
	parser.add_argument("--tiles-per-row", type=int, default=16,
						help="Tiles per row in sprite sheet export")
	
	args = parser.parse_args()
	
	# Map platform strings
	platform_map = {
		'nes': Platform.NES,
		'snes': Platform.SNES,
		'genesis': Platform.GENESIS,
		'gb': Platform.GAME_BOY,
		'gbc': Platform.GAME_BOY_COLOR,
		'gba': Platform.GBA,
	}
	platform = platform_map.get(args.platform, Platform.NES)
	
	# Create output directory
	output_dir = Path(args.output)
	output_dir.mkdir(parents=True, exist_ok=True)
	
	# Read input file
	input_path = Path(args.input)
	with open(input_path, 'rb') as f:
		f.seek(args.chr_offset)
		chr_data = f.read(args.chr_size)
	
	print(f"Read {len(chr_data)} bytes of CHR data from offset ${args.chr_offset:x}")
	
	# Create extractor
	extractor = SpriteAnimationExtractor(platform)
	
	# Load palette
	if args.palette:
		palette_path = Path(args.palette)
		with open(palette_path, 'r') as f:
			palette_data = json.load(f)
		palette = Palette(
			name=palette_data.get('name', 'custom'),
			colors=[tuple(c) for c in palette_data.get('colors', [])]
		)
	else:
		palette = create_default_palette(platform)
	
	# Load CHR data
	sheet = extractor.load_chr_data(chr_data, args.bpp)
	print(f"Loaded {len(sheet.tiles)} tiles")
	
	# Export sprite sheet
	if args.export_sheet:
		sheet_path = output_dir / "spritesheet.png"
		extractor.export_sprite_sheet_image(
			sheet, palette, sheet_path,
			tiles_per_row=args.tiles_per_row,
			scale=args.scale
		)
	
	# Export info
	info = {
		'source': str(input_path),
		'platform': platform.value,
		'chr_offset': f"0x{args.chr_offset:x}",
		'chr_size': f"0x{args.chr_size:x}",
		'bpp': args.bpp,
		'num_tiles': len(sheet.tiles),
		'palette': {
			'name': palette.name,
			'colors': [list(c) for c in palette.colors]
		}
	}
	
	info_path = output_dir / "sprite_info.json"
	with open(info_path, 'w') as f:
		json.dump(info, f, indent='\t')
	print(f"Wrote sprite info to {info_path}")


if __name__ == "__main__":
	main()
