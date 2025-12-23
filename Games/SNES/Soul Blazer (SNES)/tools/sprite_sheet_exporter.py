#!/usr/bin/env python3
"""
Soul Blazer Sprite Sheet Exporter

Exports sprite graphics from Soul Blazer ROM as organized sprite sheets.
Supports various output formats and configurations.
"""

import os
import sys
import struct
import json
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple
from enum import Enum

try:
	from PIL import Image
	HAS_PIL = True
except ImportError:
	HAS_PIL = False
	print("Warning: PIL/Pillow not found. Image export disabled.")


class SpriteCategory(Enum):
	"""Categories of sprites in Soul Blazer."""
	PLAYER = "player"
	ENEMY = "enemy"
	NPC = "npc"
	BOSS = "boss"
	ITEM = "item"
	EFFECT = "effect"
	UI = "ui"


@dataclass
class SpriteDefinition:
	"""Definition of a sprite or animation set."""
	name: str
	category: SpriteCategory
	tile_offset: int          # Offset in tile data
	tile_count: int           # Number of 8x8 tiles
	width: int                # Width in tiles
	height: int               # Height in tiles
	palette_index: int        # Which palette to use
	frames: int = 1           # Number of animation frames
	frame_delay: int = 8      # Frames between animation updates
	bank: int = 0             # ROM bank containing graphics


@dataclass
class Palette:
	"""16-color palette."""
	colors: List[Tuple[int, int, int]] = field(default_factory=list)
	
	@classmethod
	def from_snes_data(cls, data: bytes) -> 'Palette':
		"""Parse SNES palette data."""
		pal = cls()
		for i in range(0, min(32, len(data)), 2):
			color = struct.unpack('<H', data[i:i+2])[0]
			r = ((color & 0x001F) << 3) | ((color & 0x001F) >> 2)
			g = (((color >> 5) & 0x1F) << 3) | (((color >> 5) & 0x1F) >> 2)
			b = (((color >> 10) & 0x1F) << 3) | (((color >> 10) & 0x1F) >> 2)
			pal.colors.append((r, g, b))
		return pal


class SpriteSheetExporter:
	"""
	Export sprites from Soul Blazer ROM as sprite sheets.
	
	Features:
	- Export individual sprites or complete sheets
	- Multiple layout options (grid, strip, packed)
	- Animation frame support
	- Custom palette application
	- JSON metadata export
	"""
	
	# Known sprite locations in Soul Blazer
	SPRITE_DEFINITIONS = {
		# Player sprites
		"player_walk_down": SpriteDefinition(
			"Player Walk Down", SpriteCategory.PLAYER,
			0x0000, 16, 2, 2, 0, 4, 8, 0x15
		),
		"player_walk_up": SpriteDefinition(
			"Player Walk Up", SpriteCategory.PLAYER,
			0x0040, 16, 2, 2, 0, 4, 8, 0x15
		),
		"player_walk_side": SpriteDefinition(
			"Player Walk Side", SpriteCategory.PLAYER,
			0x0080, 16, 2, 2, 0, 4, 8, 0x15
		),
		"player_attack_down": SpriteDefinition(
			"Player Attack Down", SpriteCategory.PLAYER,
			0x0100, 24, 3, 2, 0, 3, 6, 0x15
		),
		"player_attack_up": SpriteDefinition(
			"Player Attack Up", SpriteCategory.PLAYER,
			0x0160, 24, 3, 2, 0, 3, 6, 0x15
		),
		"player_attack_side": SpriteDefinition(
			"Player Attack Side", SpriteCategory.PLAYER,
			0x01C0, 24, 3, 2, 0, 3, 6, 0x15
		),
		
		# Enemy sprites
		"slime": SpriteDefinition(
			"Slime", SpriteCategory.ENEMY,
			0x0000, 4, 2, 2, 1, 2, 12, 0x16
		),
		"bat": SpriteDefinition(
			"Bat", SpriteCategory.ENEMY,
			0x0020, 4, 2, 2, 1, 4, 8, 0x16
		),
		"skeleton": SpriteDefinition(
			"Skeleton", SpriteCategory.ENEMY,
			0x0060, 8, 2, 2, 1, 4, 10, 0x16
		),
		"ghost": SpriteDefinition(
			"Ghost", SpriteCategory.ENEMY,
			0x00E0, 4, 2, 2, 1, 2, 16, 0x16
		),
		"plant": SpriteDefinition(
			"Plant Enemy", SpriteCategory.ENEMY,
			0x0100, 8, 2, 2, 1, 2, 20, 0x16
		),
		
		# Bosses
		"metal_mantis": SpriteDefinition(
			"Metal Mantis", SpriteCategory.BOSS,
			0x0000, 64, 4, 4, 2, 4, 12, 0x17
		),
		"plantentacle": SpriteDefinition(
			"Plantentacle", SpriteCategory.BOSS,
			0x0200, 64, 4, 4, 2, 4, 12, 0x17
		),
		"poseidon": SpriteDefinition(
			"Poseidon", SpriteCategory.BOSS,
			0x0400, 96, 4, 6, 2, 3, 10, 0x17
		),
		"deathtoll": SpriteDefinition(
			"Deathtoll", SpriteCategory.BOSS,
			0x0800, 128, 8, 8, 2, 4, 8, 0x17
		),
		
		# NPCs
		"villager_male": SpriteDefinition(
			"Villager (Male)", SpriteCategory.NPC,
			0x0000, 4, 2, 2, 3, 2, 16, 0x18
		),
		"villager_female": SpriteDefinition(
			"Villager (Female)", SpriteCategory.NPC,
			0x0020, 4, 2, 2, 3, 2, 16, 0x18
		),
		"mermaid": SpriteDefinition(
			"Mermaid", SpriteCategory.NPC,
			0x0080, 6, 2, 3, 3, 2, 12, 0x18
		),
		
		# Items/Effects
		"gem": SpriteDefinition(
			"GEM", SpriteCategory.ITEM,
			0x0000, 1, 1, 1, 4, 4, 8, 0x19
		),
		"soul_orb": SpriteDefinition(
			"Soul Orb", SpriteCategory.EFFECT,
			0x0010, 4, 2, 2, 4, 8, 4, 0x19
		),
		"magic_flame": SpriteDefinition(
			"Flame Ball", SpriteCategory.EFFECT,
			0x0040, 4, 2, 2, 4, 4, 6, 0x19
		),
	}
	
	# Known palette locations
	PALETTE_LOCATIONS = {
		0: 0x048000,  # Player
		1: 0x048020,  # Enemy set 1
		2: 0x048040,  # Boss
		3: 0x048060,  # NPC
		4: 0x048080,  # Items/effects
	}
	
	# Graphics bank offsets (LoROM)
	GRAPHICS_BANKS = {
		0x15: 0x0A8000,  # Player
		0x16: 0x0B0000,  # Enemies
		0x17: 0x0B8000,  # Bosses
		0x18: 0x0C0000,  # NPCs
		0x19: 0x0C8000,  # Items/effects
	}
	
	def __init__(self, rom_path: str = None):
		"""Initialize the sprite sheet exporter."""
		self.rom_data = None
		self.palettes: Dict[int, Palette] = {}
		
		if rom_path and os.path.exists(rom_path):
			self.load_rom(rom_path)
	
	def load_rom(self, rom_path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(rom_path, 'rb') as f:
				self.rom_data = f.read()
			self._load_palettes()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False
	
	def _load_palettes(self):
		"""Load known palettes from ROM."""
		for idx, offset in self.PALETTE_LOCATIONS.items():
			if offset + 32 <= len(self.rom_data):
				self.palettes[idx] = Palette.from_snes_data(
					self.rom_data[offset:offset+32]
				)
	
	def _decode_4bpp_tile(self, data: bytes, palette: Palette) -> List[Tuple[int, int, int, int]]:
		"""
		Decode a single 8x8 4BPP tile.
		
		SNES 4BPP format: 32 bytes per tile
		- Bytes 0-15: Bitplanes 0 and 1
		- Bytes 16-31: Bitplanes 2 and 3
		"""
		pixels = []
		
		for y in range(8):
			bp0 = data[y * 2]
			bp1 = data[y * 2 + 1]
			bp2 = data[16 + y * 2]
			bp3 = data[16 + y * 2 + 1]
			
			for x in range(7, -1, -1):
				bit = 7 - x
				pixel = ((bp0 >> bit) & 1) | \
						(((bp1 >> bit) & 1) << 1) | \
						(((bp2 >> bit) & 1) << 2) | \
						(((bp3 >> bit) & 1) << 3)
				
				if pixel == 0:
					# Transparent
					pixels.append((0, 0, 0, 0))
				elif pixel < len(palette.colors):
					r, g, b = palette.colors[pixel]
					pixels.append((r, g, b, 255))
				else:
					pixels.append((255, 0, 255, 255))  # Magenta for missing
		
		return pixels
	
	def _get_tile_data(self, sprite_def: SpriteDefinition, frame: int = 0) -> bytes:
		"""Get raw tile data for a sprite frame."""
		if sprite_def.bank not in self.GRAPHICS_BANKS:
			return b''
		
		bank_offset = self.GRAPHICS_BANKS[sprite_def.bank]
		tile_size = 32  # 4BPP: 32 bytes per tile
		frame_size = sprite_def.tile_count * tile_size
		
		offset = bank_offset + sprite_def.tile_offset + (frame * frame_size)
		
		if offset + frame_size <= len(self.rom_data):
			return self.rom_data[offset:offset + frame_size]
		return b''
	
	def export_sprite(self, sprite_name: str, output_path: str,
					  frame: int = None, scale: int = 1) -> bool:
		"""Export a single sprite or animation to image."""
		if not HAS_PIL:
			print("PIL required for image export")
			return False
		
		if sprite_name not in self.SPRITE_DEFINITIONS:
			print(f"Unknown sprite: {sprite_name}")
			return False
		
		sprite_def = self.SPRITE_DEFINITIONS[sprite_name]
		palette = self.palettes.get(sprite_def.palette_index, Palette())
		
		# If no specific frame, export all frames as strip
		frames_to_export = [frame] if frame is not None else range(sprite_def.frames)
		
		sprite_width = sprite_def.width * 8
		sprite_height = sprite_def.height * 8
		
		if frame is not None:
			img_width = sprite_width * scale
			img_height = sprite_height * scale
		else:
			img_width = sprite_width * sprite_def.frames * scale
			img_height = sprite_height * scale
		
		img = Image.new('RGBA', (img_width, img_height), (0, 0, 0, 0))
		
		for f_idx, f in enumerate(frames_to_export):
			tile_data = self._get_tile_data(sprite_def, f)
			if not tile_data:
				continue
			
			# Decode tiles
			tile_size = 32
			for t in range(sprite_def.tile_count):
				if t * tile_size + tile_size > len(tile_data):
					break
				
				tile_bytes = tile_data[t * tile_size:(t + 1) * tile_size]
				pixels = self._decode_4bpp_tile(tile_bytes, palette)
				
				# Calculate tile position
				tile_x = (t % sprite_def.width) * 8
				tile_y = (t // sprite_def.width) * 8
				
				# Add frame offset
				frame_offset_x = f_idx * sprite_width
				
				# Place pixels
				for py in range(8):
					for px in range(8):
						pixel_idx = py * 8 + px
						if pixel_idx < len(pixels):
							color = pixels[pixel_idx]
							x = (frame_offset_x + tile_x + px) * scale
							y = (tile_y + py) * scale
							
							for sy in range(scale):
								for sx in range(scale):
									if x + sx < img_width and y + sy < img_height:
										img.putpixel((x + sx, y + sy), color)
		
		img.save(output_path)
		print(f"Exported {sprite_name} to {output_path}")
		return True
	
	def export_sprite_sheet(self, category: SpriteCategory = None,
							output_path: str = "sprite_sheet.png",
							columns: int = 8, scale: int = 2,
							include_labels: bool = False) -> bool:
		"""Export multiple sprites as a sprite sheet."""
		if not HAS_PIL:
			print("PIL required for image export")
			return False
		
		# Filter sprites by category
		sprites = []
		for name, sprite_def in self.SPRITE_DEFINITIONS.items():
			if category is None or sprite_def.category == category:
				sprites.append((name, sprite_def))
		
		if not sprites:
			print("No sprites to export")
			return False
		
		# Calculate sheet dimensions
		cell_width = 32 * scale  # Max sprite width
		cell_height = 32 * scale  # Max sprite height
		label_height = 16 if include_labels else 0
		
		rows = (len(sprites) + columns - 1) // columns
		
		sheet_width = cell_width * columns
		sheet_height = (cell_height + label_height) * rows
		
		img = Image.new('RGBA', (sheet_width, sheet_height), (64, 64, 64, 255))
		
		for idx, (name, sprite_def) in enumerate(sprites):
			col = idx % columns
			row = idx // columns
			
			x_offset = col * cell_width
			y_offset = row * (cell_height + label_height)
			
			# Get first frame
			palette = self.palettes.get(sprite_def.palette_index, Palette())
			tile_data = self._get_tile_data(sprite_def, 0)
			
			if not tile_data:
				continue
			
			# Decode and place sprite
			tile_size = 32
			for t in range(sprite_def.tile_count):
				if t * tile_size + tile_size > len(tile_data):
					break
				
				tile_bytes = tile_data[t * tile_size:(t + 1) * tile_size]
				pixels = self._decode_4bpp_tile(tile_bytes, palette)
				
				tile_x = (t % sprite_def.width) * 8
				tile_y = (t // sprite_def.width) * 8
				
				for py in range(8):
					for px in range(8):
						pixel_idx = py * 8 + px
						if pixel_idx < len(pixels):
							color = pixels[pixel_idx]
							if color[3] > 0:  # Not transparent
								x = x_offset + (tile_x + px) * scale
								y = y_offset + (tile_y + py) * scale
								
								for sy in range(scale):
									for sx in range(scale):
										if x + sx < sheet_width and y + sy < sheet_height:
											img.putpixel((x + sx, y + sy), color)
		
		img.save(output_path)
		print(f"Exported sprite sheet ({len(sprites)} sprites) to {output_path}")
		return True
	
	def export_metadata(self, output_path: str):
		"""Export sprite definitions as JSON metadata."""
		data = {
			"sprites": {},
			"palettes": {},
			"banks": {}
		}
		
		for name, sprite_def in self.SPRITE_DEFINITIONS.items():
			data["sprites"][name] = {
				"display_name": sprite_def.name,
				"category": sprite_def.category.value,
				"tile_offset": f"0x{sprite_def.tile_offset:04X}",
				"tile_count": sprite_def.tile_count,
				"dimensions": {
					"width_tiles": sprite_def.width,
					"height_tiles": sprite_def.height,
					"width_px": sprite_def.width * 8,
					"height_px": sprite_def.height * 8
				},
				"palette_index": sprite_def.palette_index,
				"animation": {
					"frames": sprite_def.frames,
					"frame_delay": sprite_def.frame_delay
				},
				"bank": f"0x{sprite_def.bank:02X}"
			}
		
		for idx, pal in self.palettes.items():
			data["palettes"][idx] = [
				{"r": r, "g": g, "b": b, "hex": f"#{r:02X}{g:02X}{b:02X}"}
				for r, g, b in pal.colors
			]
		
		for bank, offset in self.GRAPHICS_BANKS.items():
			data["banks"][f"0x{bank:02X}"] = f"0x{offset:06X}"
		
		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')
		
		print(f"Exported metadata to {output_path}")
	
	def list_sprites(self):
		"""List all available sprites."""
		print("\n=== Available Sprites ===\n")
		
		by_category: Dict[SpriteCategory, List[str]] = {}
		for name, sprite_def in self.SPRITE_DEFINITIONS.items():
			if sprite_def.category not in by_category:
				by_category[sprite_def.category] = []
			by_category[sprite_def.category].append(
				f"  {name}: {sprite_def.name} ({sprite_def.width*8}x{sprite_def.height*8}, "
				f"{sprite_def.frames} frames)"
			)
		
		for category in SpriteCategory:
			if category in by_category:
				print(f"{category.value.upper()}:")
				for line in by_category[category]:
					print(line)
				print()


def main():
	parser = argparse.ArgumentParser(description="Soul Blazer Sprite Sheet Exporter")
	parser.add_argument('rom', nargs='?', help='ROM file path')
	parser.add_argument('--list', '-l', action='store_true', help='List available sprites')
	parser.add_argument('--sprite', '-s', help='Export specific sprite by name')
	parser.add_argument('--category', '-c', choices=['player', 'enemy', 'npc', 'boss', 'item', 'effect', 'ui'],
						help='Export sprites by category')
	parser.add_argument('--sheet', action='store_true', help='Export as sprite sheet')
	parser.add_argument('--output', '-o', default='sprite_output.png', help='Output file path')
	parser.add_argument('--scale', type=int, default=2, help='Scale factor (default: 2)')
	parser.add_argument('--frame', '-f', type=int, help='Specific frame to export')
	parser.add_argument('--metadata', '-m', help='Export metadata to JSON file')
	parser.add_argument('--columns', type=int, default=8, help='Columns in sprite sheet')
	
	args = parser.parse_args()
	
	exporter = SpriteSheetExporter(args.rom)
	
	if args.list:
		exporter.list_sprites()
		return
	
	if not args.rom:
		parser.print_help()
		return
	
	if args.metadata:
		exporter.export_metadata(args.metadata)
	
	if args.sprite:
		exporter.export_sprite(args.sprite, args.output, args.frame, args.scale)
	elif args.sheet or args.category:
		category = SpriteCategory(args.category) if args.category else None
		exporter.export_sprite_sheet(
			category=category,
			output_path=args.output,
			columns=args.columns,
			scale=args.scale
		)
	else:
		exporter.list_sprites()


if __name__ == "__main__":
	main()
