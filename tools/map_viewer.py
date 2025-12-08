#!/usr/bin/env python3
"""
Map Viewer/Editor

View and edit game world maps from NES/SNES ROMs.
Supports various map formats and generates visual representations.
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Dict, List, Optional, Tuple

try:
	from PIL import Image, ImageDraw
	HAS_PIL = True
except ImportError:
	HAS_PIL = False


class MapTile:
	"""Represents a single map tile."""

	def __init__(
		self,
		tile_id: int = 0,
		attributes: int = 0,
		collision: int = 0,
		properties: Dict = None
	):
		self.tile_id = tile_id
		self.attributes = attributes
		self.collision = collision
		self.properties = properties or {}

	def to_dict(self) -> dict:
		return {
			"tile_id": self.tile_id,
			"attributes": self.attributes,
			"collision": self.collision,
			"properties": self.properties,
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'MapTile':
		return cls(
			data.get("tile_id", 0),
			data.get("attributes", 0),
			data.get("collision", 0),
			data.get("properties", {})
		)


class MapLayer:
	"""Represents a map layer."""

	def __init__(self, width: int, height: int, name: str = ""):
		self.width = width
		self.height = height
		self.name = name
		self.tiles: List[List[MapTile]] = [
			[MapTile() for _ in range(width)]
			for _ in range(height)
		]
		self.visible = True
		self.opacity = 1.0

	def get_tile(self, x: int, y: int) -> Optional[MapTile]:
		if 0 <= x < self.width and 0 <= y < self.height:
			return self.tiles[y][x]
		return None

	def set_tile(self, x: int, y: int, tile: MapTile):
		if 0 <= x < self.width and 0 <= y < self.height:
			self.tiles[y][x] = tile

	def to_dict(self) -> dict:
		return {
			"name": self.name,
			"width": self.width,
			"height": self.height,
			"visible": self.visible,
			"opacity": self.opacity,
			"tiles": [
				[tile.tile_id for tile in row]
				for row in self.tiles
			],
			"attributes": [
				[tile.attributes for tile in row]
				for row in self.tiles
			],
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'MapLayer':
		layer = cls(data["width"], data["height"], data.get("name", ""))
		layer.visible = data.get("visible", True)
		layer.opacity = data.get("opacity", 1.0)

		tiles = data.get("tiles", [])
		attrs = data.get("attributes", [])

		for y, row in enumerate(tiles):
			for x, tile_id in enumerate(row):
				if y < layer.height and x < layer.width:
					attr = attrs[y][x] if y < len(attrs) and x < len(attrs[y]) else 0
					layer.tiles[y][x] = MapTile(tile_id, attr)

		return layer


class MapEntity:
	"""Represents an entity/object on the map."""

	def __init__(
		self,
		entity_id: int,
		x: int,
		y: int,
		entity_type: str = "",
		properties: Dict = None
	):
		self.entity_id = entity_id
		self.x = x
		self.y = y
		self.entity_type = entity_type
		self.properties = properties or {}

	def to_dict(self) -> dict:
		return {
			"id": self.entity_id,
			"x": self.x,
			"y": self.y,
			"type": self.entity_type,
			"properties": self.properties,
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'MapEntity':
		return cls(
			data.get("id", 0),
			data.get("x", 0),
			data.get("y", 0),
			data.get("type", ""),
			data.get("properties", {})
		)


class GameMap:
	"""Represents a complete game map."""

	def __init__(self, name: str = ""):
		self.name = name
		self.width = 0
		self.height = 0
		self.tile_width = 16
		self.tile_height = 16
		self.layers: List[MapLayer] = []
		self.entities: List[MapEntity] = []
		self.properties: Dict = {}
		self.tileset_id = 0
		self.music_id = 0

	def add_layer(self, layer: MapLayer):
		self.layers.append(layer)
		self.width = max(self.width, layer.width)
		self.height = max(self.height, layer.height)

	def add_entity(self, entity: MapEntity):
		self.entities.append(entity)

	def get_layer(self, name: str) -> Optional[MapLayer]:
		for layer in self.layers:
			if layer.name == name:
				return layer
		return None

	def to_dict(self) -> dict:
		return {
			"name": self.name,
			"width": self.width,
			"height": self.height,
			"tile_width": self.tile_width,
			"tile_height": self.tile_height,
			"tileset_id": self.tileset_id,
			"music_id": self.music_id,
			"properties": self.properties,
			"layers": [layer.to_dict() for layer in self.layers],
			"entities": [entity.to_dict() for entity in self.entities],
		}

	@classmethod
	def from_dict(cls, data: dict) -> 'GameMap':
		game_map = cls(data.get("name", ""))
		game_map.width = data.get("width", 0)
		game_map.height = data.get("height", 0)
		game_map.tile_width = data.get("tile_width", 16)
		game_map.tile_height = data.get("tile_height", 16)
		game_map.tileset_id = data.get("tileset_id", 0)
		game_map.music_id = data.get("music_id", 0)
		game_map.properties = data.get("properties", {})

		for layer_data in data.get("layers", []):
			game_map.layers.append(MapLayer.from_dict(layer_data))

		for entity_data in data.get("entities", []):
			game_map.entities.append(MapEntity.from_dict(entity_data))

		return game_map

	def save_json(self, path: str):
		Path(path).write_text(
			json.dumps(self.to_dict(), indent='\t'),
			encoding='utf-8'
		)

	@classmethod
	def load_json(cls, path: str) -> 'GameMap':
		data = json.loads(Path(path).read_text(encoding='utf-8'))
		return cls.from_dict(data)


class MapFormat:
	"""Base class for map format parsers."""

	def load(self, data: bytes, offset: int = 0) -> GameMap:
		raise NotImplementedError

	def save(self, game_map: GameMap) -> bytes:
		raise NotImplementedError


class SimpleGridFormat(MapFormat):
	"""Simple grid-based map format."""

	def __init__(
		self,
		width: int,
		height: int,
		bytes_per_tile: int = 1,
		row_stride: int = None
	):
		self.width = width
		self.height = height
		self.bytes_per_tile = bytes_per_tile
		self.row_stride = row_stride or (width * bytes_per_tile)

	def load(self, data: bytes, offset: int = 0) -> GameMap:
		game_map = GameMap()
		layer = MapLayer(self.width, self.height, "main")

		for y in range(self.height):
			row_offset = offset + y * self.row_stride
			for x in range(self.width):
				tile_offset = row_offset + x * self.bytes_per_tile

				if tile_offset < len(data):
					tile_id = data[tile_offset]
					attr = data[tile_offset + 1] if self.bytes_per_tile > 1 else 0
					layer.set_tile(x, y, MapTile(tile_id, attr))

		game_map.add_layer(layer)
		return game_map

	def save(self, game_map: GameMap) -> bytes:
		result = bytearray()

		if not game_map.layers:
			return bytes(result)

		layer = game_map.layers[0]

		for y in range(self.height):
			for x in range(self.width):
				tile = layer.get_tile(x, y)
				if tile:
					result.append(tile.tile_id)
					if self.bytes_per_tile > 1:
						result.append(tile.attributes)
				else:
					result.extend([0] * self.bytes_per_tile)

		return bytes(result)


class RLEMapFormat(MapFormat):
	"""RLE-compressed map format."""

	def __init__(self, width: int, height: int, rle_marker: int = 0xFF):
		self.width = width
		self.height = height
		self.rle_marker = rle_marker

	def load(self, data: bytes, offset: int = 0) -> GameMap:
		game_map = GameMap()
		layer = MapLayer(self.width, self.height, "main")

		tiles = []
		i = offset

		while len(tiles) < self.width * self.height and i < len(data):
			byte = data[i]
			i += 1

			if byte == self.rle_marker and i + 1 < len(data):
				count = data[i]
				value = data[i + 1]
				i += 2
				tiles.extend([value] * count)
			else:
				tiles.append(byte)

		for idx, tile_id in enumerate(tiles[:self.width * self.height]):
			x = idx % self.width
			y = idx // self.width
			layer.set_tile(x, y, MapTile(tile_id))

		game_map.add_layer(layer)
		return game_map


class MapRenderer:
	"""Render maps to images."""

	def __init__(self):
		self.tile_images: Dict[int, 'Image.Image'] = {}
		self.tile_size = 16
		self.grid_color = (64, 64, 64)
		self.entity_color = (255, 0, 0)

	def load_tileset(self, tileset_image: 'Image.Image', tile_size: int = 16):
		"""Load tileset from image."""
		if not HAS_PIL:
			return

		self.tile_size = tile_size
		cols = tileset_image.width // tile_size
		rows = tileset_image.height // tile_size

		for y in range(rows):
			for x in range(cols):
				tile_id = y * cols + x
				box = (
					x * tile_size,
					y * tile_size,
					(x + 1) * tile_size,
					(y + 1) * tile_size
				)
				self.tile_images[tile_id] = tileset_image.crop(box)

	def render_layer(
		self,
		layer: MapLayer,
		scale: int = 1,
		show_grid: bool = False
	) -> Optional['Image.Image']:
		"""Render a single layer."""
		if not HAS_PIL:
			return None

		width = layer.width * self.tile_size * scale
		height = layer.height * self.tile_size * scale
		image = Image.new('RGBA', (width, height), (0, 0, 0, 0))

		for y in range(layer.height):
			for x in range(layer.width):
				tile = layer.get_tile(x, y)
				if tile and tile.tile_id in self.tile_images:
					tile_img = self.tile_images[tile.tile_id]
					if scale != 1:
						tile_img = tile_img.resize(
							(self.tile_size * scale, self.tile_size * scale),
							Image.Resampling.NEAREST
						)
					px = x * self.tile_size * scale
					py = y * self.tile_size * scale
					image.paste(tile_img, (px, py))

		if show_grid:
			draw = ImageDraw.Draw(image)
			for x in range(layer.width + 1):
				px = x * self.tile_size * scale
				draw.line([(px, 0), (px, height)], fill=self.grid_color)
			for y in range(layer.height + 1):
				py = y * self.tile_size * scale
				draw.line([(0, py), (width, py)], fill=self.grid_color)

		return image

	def render_map(
		self,
		game_map: GameMap,
		scale: int = 1,
		show_grid: bool = False,
		show_entities: bool = True
	) -> Optional['Image.Image']:
		"""Render full map."""
		if not HAS_PIL:
			return None

		width = game_map.width * self.tile_size * scale
		height = game_map.height * self.tile_size * scale
		result = Image.new('RGBA', (width, height), (0, 0, 0, 255))

		# Render layers
		for layer in game_map.layers:
			if layer.visible:
				layer_img = self.render_layer(layer, scale, False)
				if layer_img:
					result = Image.alpha_composite(result, layer_img)

		# Draw entities
		if show_entities and game_map.entities:
			draw = ImageDraw.Draw(result)
			for entity in game_map.entities:
				px = entity.x * self.tile_size * scale
				py = entity.y * self.tile_size * scale
				size = self.tile_size * scale // 2
				draw.ellipse(
					[px - size, py - size, px + size, py + size],
					fill=self.entity_color,
					outline=(255, 255, 255)
				)

		# Grid
		if show_grid:
			draw = ImageDraw.Draw(result)
			for x in range(game_map.width + 1):
				px = x * self.tile_size * scale
				draw.line([(px, 0), (px, height)], fill=self.grid_color)
			for y in range(game_map.height + 1):
				py = y * self.tile_size * scale
				draw.line([(0, py), (width, py)], fill=self.grid_color)

		return result

	def render_collision(
		self,
		layer: MapLayer,
		collision_map: Dict[int, int],
		scale: int = 1
	) -> Optional['Image.Image']:
		"""Render collision overlay."""
		if not HAS_PIL:
			return None

		width = layer.width * self.tile_size * scale
		height = layer.height * self.tile_size * scale
		image = Image.new('RGBA', (width, height), (0, 0, 0, 0))
		draw = ImageDraw.Draw(image)

		collision_colors = {
			0: (0, 255, 0, 64),    # Passable
			1: (255, 0, 0, 128),   # Solid
			2: (0, 0, 255, 128),   # Water
			3: (255, 255, 0, 128), # Damage
		}

		for y in range(layer.height):
			for x in range(layer.width):
				tile = layer.get_tile(x, y)
				if tile:
					collision = collision_map.get(tile.tile_id, 0)
					color = collision_colors.get(collision, (128, 128, 128, 64))

					px = x * self.tile_size * scale
					py = y * self.tile_size * scale
					draw.rectangle(
						[px, py, px + self.tile_size * scale, py + self.tile_size * scale],
						fill=color
					)

		return image


def create_placeholder_tileset(
	tile_count: int = 256,
	tile_size: int = 16
) -> 'Image.Image':
	"""Create placeholder tileset image."""
	if not HAS_PIL:
		return None

	cols = 16
	rows = (tile_count + cols - 1) // cols
	width = cols * tile_size
	height = rows * tile_size

	image = Image.new('RGB', (width, height), (0, 0, 0))
	draw = ImageDraw.Draw(image)

	for i in range(tile_count):
		x = (i % cols) * tile_size
		y = (i // cols) * tile_size

		# Color based on tile ID
		r = (i * 7) % 256
		g = (i * 11) % 256
		b = (i * 13) % 256

		draw.rectangle([x, y, x + tile_size - 1, y + tile_size - 1], fill=(r, g, b))

	return image


def main():
	parser = argparse.ArgumentParser(description="Map Viewer/Editor")
	subparsers = parser.add_subparsers(dest="command", help="Command")

	# View command
	view_parser = subparsers.add_parser("view", help="View map")
	view_parser.add_argument("input", help="Input map file")
	view_parser.add_argument("-o", "--output", help="Output image file")
	view_parser.add_argument("--tileset", help="Tileset image")
	view_parser.add_argument("--scale", type=int, default=2, help="Scale factor")
	view_parser.add_argument("--grid", action="store_true", help="Show grid")
	view_parser.add_argument("--entities", action="store_true",
		help="Show entities")

	# Extract command
	extract_parser = subparsers.add_parser("extract",
		help="Extract map from ROM")
	extract_parser.add_argument("input", help="Input ROM file")
	extract_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")
	extract_parser.add_argument("--offset", type=lambda x: int(x, 16),
		default=0, help="Map data offset (hex)")
	extract_parser.add_argument("--width", type=int, required=True,
		help="Map width in tiles")
	extract_parser.add_argument("--height", type=int, required=True,
		help="Map height in tiles")
	extract_parser.add_argument("--format",
		choices=["simple", "simple2", "rle"],
		default="simple",
		help="Map format")

	# Create command
	create_parser = subparsers.add_parser("create", help="Create empty map")
	create_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")
	create_parser.add_argument("--width", type=int, default=16,
		help="Map width")
	create_parser.add_argument("--height", type=int, default=16,
		help="Map height")
	create_parser.add_argument("--name", default="New Map", help="Map name")

	# Info command
	info_parser = subparsers.add_parser("info", help="Show map info")
	info_parser.add_argument("input", help="Input map JSON")

	args = parser.parse_args()

	if not HAS_PIL:
		print("Warning: PIL not installed. Image rendering disabled.")
		print("Install with: pip install Pillow")

	if args.command == "view":
		if args.input.endswith('.json'):
			game_map = GameMap.load_json(args.input)
		else:
			print("Unsupported format. Use JSON map files.")
			return

		if HAS_PIL:
			renderer = MapRenderer()

			# Load tileset
			if args.tileset:
				tileset = Image.open(args.tileset)
				renderer.load_tileset(tileset)
			else:
				# Create placeholder
				tileset = create_placeholder_tileset()
				renderer.load_tileset(tileset)

			image = renderer.render_map(
				game_map,
				args.scale,
				args.grid,
				args.entities
			)

			if image:
				output = args.output or "map_output.png"
				image.save(output)
				print(f"Saved map image to {output}")

	elif args.command == "extract":
		data = Path(args.input).read_bytes()

		if args.format == "simple":
			fmt = SimpleGridFormat(args.width, args.height, 1)
		elif args.format == "simple2":
			fmt = SimpleGridFormat(args.width, args.height, 2)
		elif args.format == "rle":
			fmt = RLEMapFormat(args.width, args.height)
		else:
			print(f"Unknown format: {args.format}")
			return

		game_map = fmt.load(data, args.offset)
		game_map.name = Path(args.input).stem
		game_map.save_json(args.output)
		print(f"Extracted map to {args.output}")

	elif args.command == "create":
		game_map = GameMap(args.name)
		layer = MapLayer(args.width, args.height, "main")
		game_map.add_layer(layer)
		game_map.save_json(args.output)
		print(f"Created empty map: {args.output}")

	elif args.command == "info":
		game_map = GameMap.load_json(args.input)
		print(f"Map: {game_map.name}")
		print(f"Size: {game_map.width}x{game_map.height} tiles")
		print(f"Tile size: {game_map.tile_width}x{game_map.tile_height} pixels")
		print(f"Layers: {len(game_map.layers)}")
		for i, layer in enumerate(game_map.layers):
			print(f"  {i}: {layer.name} ({layer.width}x{layer.height})")
		print(f"Entities: {len(game_map.entities)}")
		if game_map.entities:
			for entity in game_map.entities[:10]:
				print(f"  {entity.entity_type} at ({entity.x}, {entity.y})")

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
