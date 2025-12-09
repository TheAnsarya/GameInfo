#!/usr/bin/env python3
"""
Collision Map Editor - Edit collision data for tile-based games

Features:
- Visual collision map editing
- Multiple collision types (solid, semi-solid, ladder, water, etc.)
- Import/export collision data
- Overlay collision on tileset images
- Batch editing support

Supports formats from:
- NES games (typically 16x16 metatile collision)
- SNES games (various formats)
- Game Boy games
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum
from pathlib import Path
from typing import Optional

try:
	from PIL import Image, ImageDraw
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class CollisionType(IntEnum):
	"""Standard collision types"""
	PASSABLE = 0x00
	SOLID = 0x01
	PLATFORM = 0x02  # Can pass through from below
	LADDER = 0x03
	WATER = 0x04
	DAMAGE = 0x05
	ICE = 0x06
	CONVEYOR_LEFT = 0x07
	CONVEYOR_RIGHT = 0x08
	SLOPE_LEFT = 0x09
	SLOPE_RIGHT = 0x0a
	WARP = 0x0b
	SAVE_POINT = 0x0c
	CHEST = 0x0d
	NPC = 0x0e
	COUNTER = 0x0f  # Talk across but can't walk through
	CUSTOM = 0xff


@dataclass
class CollisionTile:
	"""Single collision tile data"""
	tile_id: int
	collision_type: CollisionType = CollisionType.PASSABLE
	flags: int = 0
	custom_data: bytes = field(default_factory=bytes)

	def is_solid(self) -> bool:
		return self.collision_type in (CollisionType.SOLID, CollisionType.COUNTER)

	def is_passable(self) -> bool:
		return self.collision_type == CollisionType.PASSABLE


@dataclass
class CollisionMap:
	"""Complete collision map"""
	width: int  # In tiles
	height: int
	tile_size: int = 16
	tiles: list = field(default_factory=list)
	name: str = ""
	format_type: str = "generic"


class CollisionParser:
	"""Parse collision data from various formats"""

	def parse_binary(self, data: bytes, width: int, height: int,
					bits_per_tile: int = 8) -> CollisionMap:
		"""Parse raw binary collision data"""
		cmap = CollisionMap(width=width, height=height)

		if bits_per_tile == 8:
			# 1 byte per tile
			for y in range(height):
				for x in range(width):
					idx = y * width + x
					if idx < len(data):
						tile = CollisionTile(
							tile_id=idx,
							collision_type=CollisionType(data[idx] & 0x0f),
							flags=(data[idx] >> 4) & 0x0f
						)
					else:
						tile = CollisionTile(tile_id=idx)
					cmap.tiles.append(tile)

		elif bits_per_tile == 4:
			# 4 bits per tile (2 tiles per byte)
			tile_idx = 0
			for byte in data:
				if tile_idx >= width * height:
					break
				# Low nibble first
				cmap.tiles.append(CollisionTile(
					tile_id=tile_idx,
					collision_type=CollisionType(byte & 0x0f)
				))
				tile_idx += 1
				if tile_idx >= width * height:
					break
				# High nibble
				cmap.tiles.append(CollisionTile(
					tile_id=tile_idx,
					collision_type=CollisionType((byte >> 4) & 0x0f)
				))
				tile_idx += 1

		elif bits_per_tile == 1:
			# 1 bit per tile (8 tiles per byte)
			tile_idx = 0
			for byte in data:
				for bit in range(8):
					if tile_idx >= width * height:
						break
					is_solid = (byte >> bit) & 1
					cmap.tiles.append(CollisionTile(
						tile_id=tile_idx,
						collision_type=CollisionType.SOLID if is_solid else CollisionType.PASSABLE
					))
					tile_idx += 1

		return cmap

	def parse_metatile(self, data: bytes, num_metatiles: int,
					  tiles_per_meta: int = 4) -> list:
		"""Parse metatile collision data (e.g., NES 16x16 metatiles)"""
		metatiles = []
		bytes_per = 1  # Usually 1 byte per metatile

		for i in range(num_metatiles):
			if i < len(data):
				collision_byte = data[i]
				# Common format: lower 4 bits = collision type
				metatiles.append(CollisionTile(
					tile_id=i,
					collision_type=CollisionType(collision_byte & 0x0f),
					flags=(collision_byte >> 4) & 0x0f
				))
			else:
				metatiles.append(CollisionTile(tile_id=i))

		return metatiles

	def parse_json(self, json_path: str) -> CollisionMap:
		"""Parse collision map from JSON"""
		with open(json_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		cmap = CollisionMap(
			width=data.get('width', 0),
			height=data.get('height', 0),
			tile_size=data.get('tile_size', 16),
			name=data.get('name', ''),
			format_type=data.get('format', 'generic')
		)

		for tile_data in data.get('tiles', []):
			tile = CollisionTile(
				tile_id=tile_data.get('id', len(cmap.tiles)),
				collision_type=CollisionType(tile_data.get('type', 0)),
				flags=tile_data.get('flags', 0)
			)
			cmap.tiles.append(tile)

		return cmap


class CollisionExporter:
	"""Export collision data to various formats"""

	def to_binary(self, cmap: CollisionMap, bits_per_tile: int = 8) -> bytes:
		"""Export to raw binary"""
		if bits_per_tile == 8:
			return bytes([(t.collision_type & 0x0f) | ((t.flags & 0x0f) << 4)
						 for t in cmap.tiles])

		elif bits_per_tile == 4:
			data = []
			for i in range(0, len(cmap.tiles), 2):
				low = cmap.tiles[i].collision_type & 0x0f
				high = (cmap.tiles[i + 1].collision_type & 0x0f) if i + 1 < len(cmap.tiles) else 0
				data.append(low | (high << 4))
			return bytes(data)

		elif bits_per_tile == 1:
			data = []
			for i in range(0, len(cmap.tiles), 8):
				byte = 0
				for bit in range(8):
					if i + bit < len(cmap.tiles) and cmap.tiles[i + bit].is_solid():
						byte |= (1 << bit)
				data.append(byte)
			return bytes(data)

		return bytes()

	def to_json(self, cmap: CollisionMap) -> str:
		"""Export to JSON"""
		data = {
			'width': cmap.width,
			'height': cmap.height,
			'tile_size': cmap.tile_size,
			'name': cmap.name,
			'format': cmap.format_type,
			'tiles': []
		}

		for tile in cmap.tiles:
			data['tiles'].append({
				'id': tile.tile_id,
				'type': tile.collision_type.value,
				'type_name': tile.collision_type.name,
				'flags': tile.flags
			})

		return json.dumps(data, indent=2)

	def to_asm(self, cmap: CollisionMap, label: str = "CollisionData") -> str:
		"""Export to assembly include format"""
		lines = []
		lines.append(f"; Collision data: {cmap.name}")
		lines.append(f"; {cmap.width}x{cmap.height} tiles")
		lines.append("")
		lines.append(f"{label}:")

		# Output in rows
		for y in range(cmap.height):
			row_data = []
			for x in range(cmap.width):
				idx = y * cmap.width + x
				if idx < len(cmap.tiles):
					val = (cmap.tiles[idx].collision_type & 0x0f) | ((cmap.tiles[idx].flags & 0x0f) << 4)
					row_data.append(f"${val:02x}")

			lines.append(f"\t.db {', '.join(row_data)}")

		return "\n".join(lines)


class CollisionVisualizer:
	"""Visualize collision maps"""

	# Colors for collision types (RGBA)
	COLORS = {
		CollisionType.PASSABLE: (0, 0, 0, 0),  # Transparent
		CollisionType.SOLID: (255, 0, 0, 128),  # Red
		CollisionType.PLATFORM: (255, 255, 0, 128),  # Yellow
		CollisionType.LADDER: (0, 255, 0, 128),  # Green
		CollisionType.WATER: (0, 0, 255, 128),  # Blue
		CollisionType.DAMAGE: (255, 0, 255, 128),  # Magenta
		CollisionType.ICE: (0, 255, 255, 128),  # Cyan
		CollisionType.WARP: (255, 128, 0, 128),  # Orange
	}

	def create_overlay(self, cmap: CollisionMap, scale: int = 1) -> 'Image':
		"""Create collision overlay image"""
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow is required for visualization")

		width = cmap.width * cmap.tile_size * scale
		height = cmap.height * cmap.tile_size * scale

		img = Image.new('RGBA', (width, height), (0, 0, 0, 0))
		draw = ImageDraw.Draw(img)

		for i, tile in enumerate(cmap.tiles):
			x = (i % cmap.width) * cmap.tile_size * scale
			y = (i // cmap.width) * cmap.tile_size * scale

			color = self.COLORS.get(tile.collision_type, (128, 128, 128, 128))

			if color[3] > 0:  # Not transparent
				draw.rectangle(
					[x, y, x + cmap.tile_size * scale - 1, y + cmap.tile_size * scale - 1],
					fill=color
				)

		return img

	def overlay_on_tileset(self, cmap: CollisionMap, tileset_path: str,
						  output_path: str, scale: int = 1):
		"""Overlay collision on tileset image"""
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow is required for visualization")

		# Load tileset
		tileset = Image.open(tileset_path).convert('RGBA')

		# Create collision overlay
		overlay = self.create_overlay(cmap, scale)

		# Resize tileset if needed
		if scale != 1:
			tileset = tileset.resize(
				(tileset.width * scale, tileset.height * scale),
				Image.NEAREST
			)

		# Composite
		result = Image.alpha_composite(tileset, overlay)
		result.save(output_path)

	def create_legend(self, scale: int = 1) -> 'Image':
		"""Create a legend image for collision types"""
		if not HAS_PIL:
			raise RuntimeError("PIL/Pillow is required for visualization")

		tile_size = 16 * scale
		types = list(CollisionType)
		height = len(types) * tile_size
		width = 200 * scale

		img = Image.new('RGBA', (width, height), (255, 255, 255, 255))
		draw = ImageDraw.Draw(img)

		for i, ctype in enumerate(types):
			y = i * tile_size
			color = self.COLORS.get(ctype, (128, 128, 128, 128))

			# Color box
			draw.rectangle(
				[5, y + 2, 5 + tile_size - 4, y + tile_size - 2],
				fill=color if color[3] > 0 else (200, 200, 200, 255),
				outline=(0, 0, 0, 255)
			)

			# Label
			draw.text(
				(tile_size + 10, y + 2),
				f"${ctype.value:02x} - {ctype.name}",
				fill=(0, 0, 0, 255)
			)

		return img


class CollisionEditor:
	"""Edit collision maps"""

	def __init__(self, cmap: CollisionMap):
		self.cmap = cmap
		self.history = []  # For undo

	def set_tile(self, x: int, y: int, collision_type: CollisionType, flags: int = 0):
		"""Set collision for a single tile"""
		idx = y * self.cmap.width + x
		if 0 <= idx < len(self.cmap.tiles):
			# Save for undo
			old_tile = self.cmap.tiles[idx]
			self.history.append(('set', idx, old_tile.collision_type, old_tile.flags))

			self.cmap.tiles[idx].collision_type = collision_type
			self.cmap.tiles[idx].flags = flags

	def fill_rect(self, x1: int, y1: int, x2: int, y2: int,
				 collision_type: CollisionType, flags: int = 0):
		"""Fill rectangular region"""
		for y in range(min(y1, y2), max(y1, y2) + 1):
			for x in range(min(x1, x2), max(x1, x2) + 1):
				self.set_tile(x, y, collision_type, flags)

	def flood_fill(self, x: int, y: int, collision_type: CollisionType, flags: int = 0):
		"""Flood fill from a point"""
		idx = y * self.cmap.width + x
		if idx < 0 or idx >= len(self.cmap.tiles):
			return

		target_type = self.cmap.tiles[idx].collision_type
		if target_type == collision_type:
			return

		stack = [(x, y)]
		visited = set()

		while stack:
			cx, cy = stack.pop()
			if (cx, cy) in visited:
				continue
			if cx < 0 or cx >= self.cmap.width or cy < 0 or cy >= self.cmap.height:
				continue

			idx = cy * self.cmap.width + cx
			if self.cmap.tiles[idx].collision_type != target_type:
				continue

			visited.add((cx, cy))
			self.set_tile(cx, cy, collision_type, flags)

			stack.extend([(cx + 1, cy), (cx - 1, cy), (cx, cy + 1), (cx, cy - 1)])

	def undo(self):
		"""Undo last operation"""
		if self.history:
			op, idx, old_type, old_flags = self.history.pop()
			self.cmap.tiles[idx].collision_type = old_type
			self.cmap.tiles[idx].flags = old_flags

	def copy_row(self, src_row: int, dst_row: int):
		"""Copy one row to another"""
		for x in range(self.cmap.width):
			src_idx = src_row * self.cmap.width + x
			self.set_tile(x, dst_row, self.cmap.tiles[src_idx].collision_type,
						 self.cmap.tiles[src_idx].flags)


def main():
	parser = argparse.ArgumentParser(
		description='Edit and visualize collision maps'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Parse command
	parse_parser = subparsers.add_parser('parse', help='Parse collision data')
	parse_parser.add_argument('input', help='Input file (binary or JSON)')
	parse_parser.add_argument('--width', type=int, default=16, help='Map width in tiles')
	parse_parser.add_argument('--height', type=int, default=16, help='Map height in tiles')
	parse_parser.add_argument('--bits', type=int, default=8, choices=[1, 4, 8],
							help='Bits per tile')
	parse_parser.add_argument('--offset', type=int, default=0, help='Data offset')
	parse_parser.add_argument('-o', '--output', help='Output JSON file')

	# Export command
	export_parser = subparsers.add_parser('export', help='Export collision data')
	export_parser.add_argument('input', help='Input JSON file')
	export_parser.add_argument('--format', choices=['bin', 'asm', 'json'], default='bin')
	export_parser.add_argument('--bits', type=int, default=8, choices=[1, 4, 8])
	export_parser.add_argument('-o', '--output', required=True, help='Output file')

	# Visualize command
	viz_parser = subparsers.add_parser('visualize', help='Create collision overlay')
	viz_parser.add_argument('input', help='Input JSON collision data')
	viz_parser.add_argument('-o', '--output', required=True, help='Output PNG file')
	viz_parser.add_argument('--tileset', help='Tileset image to overlay on')
	viz_parser.add_argument('--scale', type=int, default=1, help='Scale factor')
	viz_parser.add_argument('--legend', action='store_true', help='Include legend')

	# Info command
	info_parser = subparsers.add_parser('info', help='Show collision map info')
	info_parser.add_argument('input', help='Input JSON file')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	parser_obj = CollisionParser()
	exporter = CollisionExporter()

	if args.command == 'parse':
		# Load binary data
		with open(args.input, 'rb') as f:
			f.seek(args.offset)
			data = f.read()

		cmap = parser_obj.parse_binary(data, args.width, args.height, args.bits)
		cmap.name = os.path.basename(args.input)

		# Output
		json_output = exporter.to_json(cmap)
		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(json_output)
			print(f"Written to {args.output}")
		else:
			print(json_output)

	elif args.command == 'export':
		cmap = parser_obj.parse_json(args.input)

		if args.format == 'bin':
			data = exporter.to_binary(cmap, args.bits)
			with open(args.output, 'wb') as f:
				f.write(data)
		elif args.format == 'asm':
			asm = exporter.to_asm(cmap)
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(asm)
		else:
			json_data = exporter.to_json(cmap)
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(json_data)

		print(f"Exported to {args.output}")

	elif args.command == 'visualize':
		if not HAS_PIL:
			print("Error: PIL/Pillow is required for visualization")
			print("Install with: pip install Pillow")
			return

		cmap = parser_obj.parse_json(args.input)
		viz = CollisionVisualizer()

		if args.tileset:
			viz.overlay_on_tileset(cmap, args.tileset, args.output, args.scale)
		else:
			img = viz.create_overlay(cmap, args.scale)
			img.save(args.output)

		print(f"Visualization saved to {args.output}")

		if args.legend:
			legend = viz.create_legend(args.scale)
			legend_path = args.output.replace('.png', '_legend.png')
			legend.save(legend_path)
			print(f"Legend saved to {legend_path}")

	elif args.command == 'info':
		cmap = parser_obj.parse_json(args.input)

		print(f"Collision Map: {cmap.name}")
		print(f"Dimensions: {cmap.width}x{cmap.height} ({cmap.width * cmap.height} tiles)")
		print(f"Tile size: {cmap.tile_size}px")
		print()

		# Count by type
		type_counts = {}
		for tile in cmap.tiles:
			name = tile.collision_type.name
			type_counts[name] = type_counts.get(name, 0) + 1

		print("Collision type distribution:")
		for name, count in sorted(type_counts.items(), key=lambda x: -x[1]):
			pct = (count / len(cmap.tiles)) * 100
			print(f"  {name}: {count} ({pct:.1f}%)")


if __name__ == '__main__':
	main()
