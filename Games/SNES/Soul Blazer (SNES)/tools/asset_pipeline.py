#!/usr/bin/env python3
"""
Soul Blazer Asset Pipeline - Bidirectional asset conversion tool

This tool provides a comprehensive pipeline for extracting assets from ROM
to editable formats (JSON, PNG) and converting them back to binary for
ROM injection.

Supports:
- Text/dialogue (JSON)
- Graphics/tiles (PNG)
- Enemy/item data (JSON)
- Palettes (JSON/PNG)
- Maps (JSON)
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional, Callable
from enum import Enum, auto

try:
	from PIL import Image
except ImportError:
	Image = None
	print("Warning: PIL/Pillow not available. Graphics conversion disabled.")


class AssetType(Enum):
	"""Types of assets that can be converted"""
	TEXT = auto()
	GRAPHICS = auto()
	PALETTE = auto()
	ENEMY_DATA = auto()
	ITEM_DATA = auto()
	MAP_DATA = auto()
	AUDIO_META = auto()


@dataclass
class AssetDefinition:
	"""Defines an extractable/injectable asset"""
	name: str
	asset_type: AssetType
	rom_offset: int
	size: int
	description: str = ""
	bank: int = 0
	count: int = 1  # Number of entries for tables
	entry_size: int = 0  # Size per entry for tables


@dataclass
class AssetPipeline:
	"""Main asset pipeline manager"""

	rom_path: Path
	assets_dir: Path
	rom_data: bytes = field(default=b'', repr=False)

	# Asset definitions discovered from Soul Blazer analysis
	ASSETS: list = field(default_factory=lambda: [
		# Text assets
		AssetDefinition("main_text", AssetType.TEXT, 0x010000, 0x8000,
			"Main dialogue text", bank=2),
		AssetDefinition("npc_text", AssetType.TEXT, 0x018000, 0x8000,
			"NPC dialogue text", bank=3),
		AssetDefinition("system_text", AssetType.TEXT, 0x020000, 0x4000,
			"System/menu text", bank=4),

		# Enemy data
		AssetDefinition("enemy_stats", AssetType.ENEMY_DATA, 0x030000, 0x600,
			"Enemy stat table", bank=6, count=96, entry_size=16),

		# Item data
		AssetDefinition("sword_data", AssetType.ITEM_DATA, 0x038000, 0x40,
			"Sword stats", bank=7, count=8, entry_size=8),
		AssetDefinition("armor_data", AssetType.ITEM_DATA, 0x038040, 0x40,
			"Armor stats", bank=7, count=8, entry_size=8),
		AssetDefinition("magic_data", AssetType.ITEM_DATA, 0x038080, 0x40,
			"Magic stats", bank=7, count=8, entry_size=8),

		# Graphics
		AssetDefinition("player_sprites", AssetType.GRAPHICS, 0x0A8000, 0x8000,
			"Player sprite tiles", bank=0x15),
		AssetDefinition("enemy_sprites_1", AssetType.GRAPHICS, 0x0B8000, 0x8000,
			"Enemy sprites bank 1", bank=0x17),
		AssetDefinition("enemy_sprites_2", AssetType.GRAPHICS, 0x0C0000, 0x8000,
			"Enemy sprites bank 2", bank=0x18),

		# Palettes
		AssetDefinition("palettes", AssetType.PALETTE, 0x0F8000, 0x2000,
			"Color palettes", bank=0x1F, count=256, entry_size=32),

		# Map data
		AssetDefinition("map_headers", AssetType.MAP_DATA, 0x040000, 0x800,
			"Map header data", bank=8, count=64, entry_size=16),
	])

	# Text encoding table (Soul Blazer specific)
	TEXT_DECODE: dict = field(default_factory=lambda: {
		0x00: '[END]', 0x01: '\n', 0x02: '[PAUSE]', 0x03: '[CLEAR]',
		0x04: '[HERO]', 0x05: '[ITEM]', 0x06: '[NUM]', 0x07: '[WAIT]',
		**{0x24 + i: chr(ord('A') + i) for i in range(26)},  # A-Z
		**{0x3E + i: chr(ord('a') + i) for i in range(26)},  # a-z
		**{0x0A + i: chr(ord('0') + i) for i in range(10)},  # 0-9
		0x14: ' ', 0x15: '.', 0x16: ',', 0x17: '!', 0x18: '?',
		0x19: "'", 0x1A: '"', 0x1B: '-', 0x1C: ':', 0x1D: ';',
	})

	TEXT_ENCODE: dict = field(default_factory=dict)

	def __post_init__(self):
		if not self.rom_data:
			self.load_rom()
		self.assets_dir.mkdir(parents=True, exist_ok=True)

		# Build reverse encoding table
		self.TEXT_ENCODE = {v: k for k, v in self.TEXT_DECODE.items() if isinstance(v, str)}

	def load_rom(self):
		"""Load ROM data"""
		self.rom_data = self.rom_path.read_bytes()
		print(f"Loaded ROM: {len(self.rom_data):,} bytes")

	def get_asset(self, name: str) -> Optional[AssetDefinition]:
		"""Get asset definition by name"""
		return next((a for a in self.ASSETS if a.name == name), None)

	# ========================================================================
	# TEXT CONVERSION
	# ========================================================================

	def decode_text(self, data: bytes) -> str:
		"""Decode Soul Blazer text to string"""
		result = []
		for byte in data:
			if byte in self.TEXT_DECODE:
				result.append(self.TEXT_DECODE[byte])
			elif byte == 0x00:
				break  # END
			else:
				result.append(f'[{byte:02X}]')
		return ''.join(result)

	def encode_text(self, text: str) -> bytes:
		"""Encode string to Soul Blazer text format"""
		result = []
		i = 0
		while i < len(text):
			# Check for control codes [XX] or [NAME]
			if text[i] == '[':
				end = text.find(']', i)
				if end != -1:
					code = text[i:end+1]
					if code in self.TEXT_ENCODE:
						result.append(self.TEXT_ENCODE[code])
					elif len(code) == 4:  # [XX] hex
						try:
							result.append(int(code[1:3], 16))
						except ValueError:
							result.append(0xFF)
					i = end + 1
					continue

			# Regular character
			char = text[i]
			if char in self.TEXT_ENCODE:
				result.append(self.TEXT_ENCODE[char])
			elif char == '\n':
				result.append(0x01)
			else:
				result.append(0x14)  # Space for unknown
			i += 1

		result.append(0x00)  # END
		return bytes(result)

	def extract_text_asset(self, asset: AssetDefinition) -> dict:
		"""Extract text asset to JSON structure"""
		data = self.rom_data[asset.rom_offset:asset.rom_offset + asset.size]

		# Find text blocks by scanning for END markers
		blocks = []
		current_start = 0

		for i, byte in enumerate(data):
			if byte == 0x00:  # END marker
				if i > current_start:
					text_bytes = data[current_start:i]
					decoded = self.decode_text(text_bytes)
					if decoded.strip():
						blocks.append({
							"offset": f"0x{asset.rom_offset + current_start:06X}",
							"size": i - current_start,
							"text": decoded
						})
				current_start = i + 1

		return {
			"asset": asset.name,
			"type": "text",
			"rom_offset": f"0x{asset.rom_offset:06X}",
			"total_size": asset.size,
			"block_count": len(blocks),
			"blocks": blocks
		}

	def inject_text_asset(self, asset: AssetDefinition, json_data: dict) -> bytes:
		"""Convert JSON text data back to binary"""
		output = bytearray(asset.size)

		for block in json_data.get("blocks", []):
			offset = int(block["offset"], 16) - asset.rom_offset
			encoded = self.encode_text(block["text"])

			# Ensure it fits in allocated space
			max_size = block.get("size", len(encoded)) + 1
			if len(encoded) > max_size:
				print(f"Warning: Text block at {block['offset']} exceeds original size")
				encoded = encoded[:max_size-1] + b'\x00'

			output[offset:offset + len(encoded)] = encoded

		return bytes(output)

	# ========================================================================
	# GRAPHICS CONVERSION
	# ========================================================================

	def decode_4bpp_tile(self, data: bytes) -> list[list[int]]:
		"""Decode 32-byte 4BPP tile to 8x8 pixel array"""
		pixels = [[0] * 8 for _ in range(8)]

		for y in range(8):
			# Bitplanes 0 & 1
			bp0 = data[y * 2]
			bp1 = data[y * 2 + 1]
			# Bitplanes 2 & 3
			bp2 = data[16 + y * 2]
			bp3 = data[16 + y * 2 + 1]

			for x in range(8):
				bit = 7 - x
				p0 = (bp0 >> bit) & 1
				p1 = (bp1 >> bit) & 1
				p2 = (bp2 >> bit) & 1
				p3 = (bp3 >> bit) & 1
				pixels[y][x] = p0 | (p1 << 1) | (p2 << 2) | (p3 << 3)

		return pixels

	def encode_4bpp_tile(self, pixels: list[list[int]]) -> bytes:
		"""Encode 8x8 pixel array to 32-byte 4BPP tile"""
		data = bytearray(32)

		for y in range(8):
			bp0 = bp1 = bp2 = bp3 = 0

			for x in range(8):
				p = pixels[y][x] & 0x0F
				bit = 7 - x
				if p & 1: bp0 |= (1 << bit)
				if p & 2: bp1 |= (1 << bit)
				if p & 4: bp2 |= (1 << bit)
				if p & 8: bp3 |= (1 << bit)

			data[y * 2] = bp0
			data[y * 2 + 1] = bp1
			data[16 + y * 2] = bp2
			data[16 + y * 2 + 1] = bp3

		return bytes(data)

	def extract_graphics_asset(self, asset: AssetDefinition) -> Path:
		"""Extract graphics to PNG file"""
		if Image is None:
			raise RuntimeError("PIL/Pillow required for graphics extraction")

		data = self.rom_data[asset.rom_offset:asset.rom_offset + asset.size]
		tile_count = asset.size // 32

		# Arrange tiles in a grid (16 tiles wide)
		tiles_per_row = 16
		rows = (tile_count + tiles_per_row - 1) // tiles_per_row

		img = Image.new('P', (tiles_per_row * 8, rows * 8))

		# Default grayscale palette for 4BPP
		palette = []
		for i in range(16):
			v = i * 17  # 0, 17, 34, ... 255
			palette.extend([v, v, v])
		palette.extend([0, 0, 0] * 240)  # Fill rest with black
		img.putpalette(palette)

		# Decode and place tiles
		for tile_idx in range(tile_count):
			tile_data = data[tile_idx * 32:(tile_idx + 1) * 32]
			if len(tile_data) < 32:
				break

			pixels = self.decode_4bpp_tile(tile_data)
			tx = (tile_idx % tiles_per_row) * 8
			ty = (tile_idx // tiles_per_row) * 8

			for y in range(8):
				for x in range(8):
					img.putpixel((tx + x, ty + y), pixels[y][x])

		# Save PNG
		output_path = self.assets_dir / "graphics" / f"{asset.name}.png"
		output_path.parent.mkdir(parents=True, exist_ok=True)
		img.save(output_path)

		# Also save metadata
		meta = {
			"asset": asset.name,
			"type": "graphics",
			"rom_offset": f"0x{asset.rom_offset:06X}",
			"size": asset.size,
			"tile_count": tile_count,
			"format": "4BPP",
			"png_file": output_path.name
		}
		meta_path = output_path.with_suffix('.json')
		meta_path.write_text(json.dumps(meta, indent=2))

		return output_path

	def inject_graphics_asset(self, asset: AssetDefinition, png_path: Path) -> bytes:
		"""Convert PNG back to 4BPP binary"""
		if Image is None:
			raise RuntimeError("PIL/Pillow required for graphics injection")

		img = Image.open(png_path).convert('P')
		tile_count = asset.size // 32
		tiles_per_row = 16

		output = bytearray()

		for tile_idx in range(tile_count):
			tx = (tile_idx % tiles_per_row) * 8
			ty = (tile_idx // tiles_per_row) * 8

			pixels = [[0] * 8 for _ in range(8)]
			for y in range(8):
				for x in range(8):
					if tx + x < img.width and ty + y < img.height:
						pixels[y][x] = img.getpixel((tx + x, ty + y)) & 0x0F

			output.extend(self.encode_4bpp_tile(pixels))

		return bytes(output)

	# ========================================================================
	# DATA TABLE CONVERSION
	# ========================================================================

	def extract_enemy_data(self, asset: AssetDefinition) -> dict:
		"""Extract enemy stat table to JSON"""
		data = self.rom_data[asset.rom_offset:asset.rom_offset + asset.size]
		enemies = []

		for i in range(asset.count):
			entry = data[i * asset.entry_size:(i + 1) * asset.entry_size]
			if len(entry) < asset.entry_size:
				break

			enemies.append({
				"id": i,
				"hp": struct.unpack('<H', entry[0:2])[0],
				"attack": entry[2],
				"defense": entry[3],
				"experience": struct.unpack('<H', entry[4:6])[0],
				"gems": struct.unpack('<H', entry[6:8])[0],
				"element": entry[8],
				"ai_type": entry[9],
				"movement": entry[10],
				"speed": entry[11],
				"sprite": struct.unpack('<H', entry[12:14])[0],
				"flags": entry[14],
				"drop_id": entry[15]
			})

		return {
			"asset": asset.name,
			"type": "enemy_data",
			"rom_offset": f"0x{asset.rom_offset:06X}",
			"entry_size": asset.entry_size,
			"count": len(enemies),
			"enemies": enemies
		}

	def inject_enemy_data(self, asset: AssetDefinition, json_data: dict) -> bytes:
		"""Convert enemy JSON back to binary"""
		output = bytearray(asset.size)

		for enemy in json_data.get("enemies", []):
			i = enemy["id"]
			offset = i * asset.entry_size

			struct.pack_into('<H', output, offset + 0, enemy["hp"])
			output[offset + 2] = enemy["attack"]
			output[offset + 3] = enemy["defense"]
			struct.pack_into('<H', output, offset + 4, enemy["experience"])
			struct.pack_into('<H', output, offset + 6, enemy["gems"])
			output[offset + 8] = enemy["element"]
			output[offset + 9] = enemy["ai_type"]
			output[offset + 10] = enemy["movement"]
			output[offset + 11] = enemy["speed"]
			struct.pack_into('<H', output, offset + 12, enemy["sprite"])
			output[offset + 14] = enemy["flags"]
			output[offset + 15] = enemy["drop_id"]

		return bytes(output)

	def extract_item_data(self, asset: AssetDefinition) -> dict:
		"""Extract item/equipment data to JSON"""
		data = self.rom_data[asset.rom_offset:asset.rom_offset + asset.size]
		items = []

		for i in range(asset.count):
			entry = data[i * asset.entry_size:(i + 1) * asset.entry_size]
			if len(entry) < asset.entry_size:
				break

			items.append({
				"id": i,
				"power": entry[0],
				"element": entry[1],
				"range": entry[2],
				"speed": entry[3],
				"effect": entry[4],
				"cost": entry[5],
				"price": struct.unpack('<H', entry[6:8])[0]
			})

		return {
			"asset": asset.name,
			"type": "item_data",
			"rom_offset": f"0x{asset.rom_offset:06X}",
			"entry_size": asset.entry_size,
			"count": len(items),
			"items": items
		}

	def inject_item_data(self, asset: AssetDefinition, json_data: dict) -> bytes:
		"""Convert item JSON back to binary"""
		output = bytearray(asset.size)

		for item in json_data.get("items", []):
			i = item["id"]
			offset = i * asset.entry_size

			output[offset + 0] = item["power"]
			output[offset + 1] = item["element"]
			output[offset + 2] = item["range"]
			output[offset + 3] = item["speed"]
			output[offset + 4] = item["effect"]
			output[offset + 5] = item["cost"]
			struct.pack_into('<H', output, offset + 6, item["price"])

		return bytes(output)

	# ========================================================================
	# PALETTE CONVERSION
	# ========================================================================

	def snes_to_rgb(self, color: int) -> tuple[int, int, int]:
		"""Convert SNES 15-bit color to RGB"""
		r = (color & 0x1F) << 3
		g = ((color >> 5) & 0x1F) << 3
		b = ((color >> 10) & 0x1F) << 3
		return (r, g, b)

	def rgb_to_snes(self, r: int, g: int, b: int) -> int:
		"""Convert RGB to SNES 15-bit color"""
		return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)

	def extract_palette_asset(self, asset: AssetDefinition) -> dict:
		"""Extract palettes to JSON"""
		data = self.rom_data[asset.rom_offset:asset.rom_offset + asset.size]
		palettes = []

		palette_size = 32  # 16 colors × 2 bytes
		palette_count = asset.size // palette_size

		for pal_idx in range(palette_count):
			pal_data = data[pal_idx * palette_size:(pal_idx + 1) * palette_size]
			colors = []

			for c in range(16):
				word = struct.unpack('<H', pal_data[c * 2:(c + 1) * 2])[0]
				rgb = self.snes_to_rgb(word)
				colors.append({
					"index": c,
					"snes": f"0x{word:04X}",
					"rgb": list(rgb),
					"hex": f"#{rgb[0]:02X}{rgb[1]:02X}{rgb[2]:02X}"
				})

			palettes.append({
				"id": pal_idx,
				"offset": f"0x{asset.rom_offset + pal_idx * palette_size:06X}",
				"colors": colors
			})

		return {
			"asset": asset.name,
			"type": "palette",
			"rom_offset": f"0x{asset.rom_offset:06X}",
			"palette_count": palette_count,
			"colors_per_palette": 16,
			"palettes": palettes
		}

	def inject_palette_asset(self, asset: AssetDefinition, json_data: dict) -> bytes:
		"""Convert palette JSON back to binary"""
		output = bytearray(asset.size)

		for palette in json_data.get("palettes", []):
			pal_idx = palette["id"]
			base = pal_idx * 32

			for color in palette["colors"]:
				c = color["index"]
				rgb = color["rgb"]
				snes_val = self.rgb_to_snes(rgb[0], rgb[1], rgb[2])
				struct.pack_into('<H', output, base + c * 2, snes_val)

		return bytes(output)

	# ========================================================================
	# MAIN EXTRACTION/INJECTION
	# ========================================================================

	def extract_asset(self, asset_name: str) -> Path:
		"""Extract single asset to editable format"""
		asset = self.get_asset(asset_name)
		if not asset:
			raise ValueError(f"Unknown asset: {asset_name}")

		print(f"Extracting {asset.name}...")

		if asset.asset_type == AssetType.TEXT:
			data = self.extract_text_asset(asset)
			output_path = self.assets_dir / "text" / f"{asset.name}.json"
			output_path.parent.mkdir(parents=True, exist_ok=True)
			output_path.write_text(json.dumps(data, indent=2, ensure_ascii=False))

		elif asset.asset_type == AssetType.GRAPHICS:
			output_path = self.extract_graphics_asset(asset)

		elif asset.asset_type == AssetType.ENEMY_DATA:
			data = self.extract_enemy_data(asset)
			output_path = self.assets_dir / "data" / f"{asset.name}.json"
			output_path.parent.mkdir(parents=True, exist_ok=True)
			output_path.write_text(json.dumps(data, indent=2))

		elif asset.asset_type == AssetType.ITEM_DATA:
			data = self.extract_item_data(asset)
			output_path = self.assets_dir / "data" / f"{asset.name}.json"
			output_path.parent.mkdir(parents=True, exist_ok=True)
			output_path.write_text(json.dumps(data, indent=2))

		elif asset.asset_type == AssetType.PALETTE:
			data = self.extract_palette_asset(asset)
			output_path = self.assets_dir / "palettes" / f"{asset.name}.json"
			output_path.parent.mkdir(parents=True, exist_ok=True)
			output_path.write_text(json.dumps(data, indent=2))

		else:
			raise ValueError(f"Unsupported asset type: {asset.asset_type}")

		print(f"  -> {output_path}")
		return output_path

	def extract_all(self) -> list[Path]:
		"""Extract all assets"""
		paths = []
		print(f"\nExtracting all assets to {self.assets_dir}")
		print("=" * 60)

		for asset in self.ASSETS:
			try:
				path = self.extract_asset(asset.name)
				paths.append(path)
			except Exception as e:
				print(f"  Error: {e}")

		print("=" * 60)
		print(f"Extracted {len(paths)}/{len(self.ASSETS)} assets")
		return paths

	def inject_asset(self, asset_name: str, input_path: Path) -> bytes:
		"""Convert editable file back to binary"""
		asset = self.get_asset(asset_name)
		if not asset:
			raise ValueError(f"Unknown asset: {asset_name}")

		print(f"Injecting {asset.name} from {input_path}...")

		if asset.asset_type == AssetType.TEXT:
			data = json.loads(input_path.read_text())
			return self.inject_text_asset(asset, data)

		elif asset.asset_type == AssetType.GRAPHICS:
			return self.inject_graphics_asset(asset, input_path)

		elif asset.asset_type == AssetType.ENEMY_DATA:
			data = json.loads(input_path.read_text())
			return self.inject_enemy_data(asset, data)

		elif asset.asset_type == AssetType.ITEM_DATA:
			data = json.loads(input_path.read_text())
			return self.inject_item_data(asset, data)

		elif asset.asset_type == AssetType.PALETTE:
			data = json.loads(input_path.read_text())
			return self.inject_palette_asset(asset, data)

		else:
			raise ValueError(f"Unsupported asset type: {asset.asset_type}")

	def list_assets(self):
		"""List all available assets"""
		print("\nAvailable Assets:")
		print("-" * 70)
		print(f"{'Name':<20} {'Type':<12} {'Offset':<10} {'Size':<8} Description")
		print("-" * 70)

		for asset in self.ASSETS:
			print(f"{asset.name:<20} {asset.asset_type.name:<12} "
				  f"0x{asset.rom_offset:06X}  {asset.size:<8} {asset.description}")


def main():
	"""Main entry point"""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Asset Pipeline")
	parser.add_argument("--rom", type=Path, help="ROM file path")
	parser.add_argument("--output", type=Path, default=Path("../assets/pipeline"),
		help="Output directory for extracted assets")
	parser.add_argument("--extract", type=str, help="Extract specific asset by name")
	parser.add_argument("--extract-all", action="store_true",
		help="Extract all assets")
	parser.add_argument("--inject", nargs=2, metavar=("ASSET", "FILE"),
		help="Inject asset from file")
	parser.add_argument("--list", action="store_true",
		help="List available assets")

	args = parser.parse_args()

	# Default ROM path
	rom_path = args.rom or Path(__file__).parent.parent.parent.parent.parent / \
		"~roms/SNES/GoodSNES/Soul Blazer (U) [!].sfc"

	if not rom_path.exists() and not args.list:
		print(f"Error: ROM file not found: {rom_path}")
		print("Please specify ROM path with --rom")
		return 1

	# Resolve output path
	output_dir = args.output
	if not output_dir.is_absolute():
		output_dir = Path(__file__).parent / output_dir

	# Create pipeline (may not need ROM for --list)
	if args.list:
		pipeline = AssetPipeline.__new__(AssetPipeline)
		pipeline.ASSETS = AssetPipeline.ASSETS.default
		pipeline.list_assets()
		return 0

	pipeline = AssetPipeline(rom_path=rom_path, assets_dir=output_dir)

	if args.list:
		pipeline.list_assets()
	elif args.extract_all:
		pipeline.extract_all()
	elif args.extract:
		pipeline.extract_asset(args.extract)
	elif args.inject:
		asset_name, file_path = args.inject
		binary = pipeline.inject_asset(asset_name, Path(file_path))
		print(f"Generated {len(binary)} bytes of binary data")
	else:
		pipeline.list_assets()
		print("\nUse --extract-all to extract all assets")

	return 0


if __name__ == "__main__":
	exit(main())
