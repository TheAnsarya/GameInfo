#!/usr/bin/env python3
"""
Soul Blazer (SNES) Palette Manager
Loads and applies extracted palettes to graphics rendering.
"""

import json
from pathlib import Path
from typing import Optional


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
PALETTES_FILE = ASSETS_DIR / "palettes" / "palettes.json"


class PaletteManager:
	"""Manages Soul Blazer color palettes."""

	# Area to palette mapping (known associations)
	AREA_PALETTES = {
		# Act 1 - Grass Valley
		"Grass Valley Underground": [0, 1, 2],
		"Grass Valley Village": [3, 4, 5],
		"Underground Castle B1": [6, 7, 8],
		"Underground Castle B2": [9, 10, 11],
		"Underground Castle B3": [12, 13, 14],
		"Underground Castle B4": [15, 16, 17],

		# Act 2 - GreenWood
		"GreenWood": [18, 19, 20],
		"Water Shrine": [21, 22, 23],
		"Fire Shrine": [24, 25, 26],
		"Light Shrine": [27, 28, 29],
		"Lost Marsh": [30, 31, 32],

		# Act 3 - St. Elles
		"St. Elles Seabed": [33, 34, 35],
		"Durean": [36, 37, 38],
		"Ghost Ship": [39, 40, 41],
		"Southerta": [42, 43, 44],
		"Mermaid Queen Palace": [45, 46, 47],

		# Act 4 - Mountain of Souls
		"Mountain of Souls": [48, 49, 50],
		"Laynole": [51, 52, 53],
		"Nome": [54, 55, 56],
		"Lune": [57, 58, 59],

		# Act 5 - Leo's Lab
		"Model Town 1": [60, 61, 62],
		"Model Town 2": [63, 64, 65],
		"Leo's Lab Basement": [66, 67, 68],
		"Leo's Lab Attic": [69, 70, 71],
		"Leo's Paintings": [72, 73, 74],

		# Act 6 - Magridd
		"Magridd Castle Town": [75, 76, 77],
		"Magridd Castle": [78, 79, 80],
		"Castle Basement": [81, 82, 83],
		"World of Evil": [84, 85, 86],
		"Deathtoll's Lair": [87, 88, 89],
	}

	# Palette categories
	CATEGORIES = {
		"background": list(range(0, 50)),      # BG palettes
		"sprites": list(range(50, 90)),        # Sprite palettes
		"ui": list(range(90, 110)),            # UI/menu palettes
		"effects": list(range(110, 130)),      # Special effects
		"unused": list(range(130, 170)),       # Potentially unused
	}

	def __init__(self, palettes_file: str = None):
		"""Initialize palette manager."""
		if palettes_file is None:
			palettes_file = str(PALETTES_FILE)

		self.palettes_file = Path(palettes_file)
		self.palettes = []
		self.palette_count = 0
		self._load_palettes()

	def _load_palettes(self) -> None:
		"""Load palettes from JSON file."""
		if not self.palettes_file.exists():
			print(f"Warning: Palettes file not found: {self.palettes_file}")
			return

		with open(self.palettes_file, 'r') as f:
			data = json.load(f)

		self.palette_count = data.get('palette_count', 0)
		self.palettes = data.get('palettes', [])

	def get_palette(self, index: int) -> list[tuple[int, int, int]]:
		"""Get palette by index as list of RGB tuples."""
		if index < 0 or index >= len(self.palettes):
			# Return default grayscale palette
			return [(i * 17, i * 17, i * 17) for i in range(16)]

		palette_data = self.palettes[index]
		colors = palette_data.get('colors_rgb', [])

		# Convert to tuples
		result = []
		for color in colors[:16]:
			if isinstance(color, list) and len(color) >= 3:
				result.append((color[0], color[1], color[2]))
			else:
				result.append((0, 0, 0))

		# Pad to 16 colors if needed
		while len(result) < 16:
			result.append((0, 0, 0))

		return result

	def get_palette_by_name(self, name: str) -> list[tuple[int, int, int]]:
		"""Get palette by name."""
		for i, pal in enumerate(self.palettes):
			if pal.get('name', '') == name:
				return self.get_palette(i)
		return self.get_palette(0)

	def get_palettes_for_area(self, area_name: str) -> list[list[tuple[int, int, int]]]:
		"""Get suggested palettes for a game area."""
		indices = self.AREA_PALETTES.get(area_name, [0])
		return [self.get_palette(i) for i in indices]

	def get_combined_palette(self, indices: list[int]) -> list[tuple[int, int, int]]:
		"""Combine multiple 16-color palettes into one 256-color palette."""
		result = []
		for i in indices[:16]:  # Max 16 palettes = 256 colors
			result.extend(self.get_palette(i))
		while len(result) < 256:
			result.append((0, 0, 0))
		return result[:256]

	def get_palette_info(self, index: int) -> dict:
		"""Get metadata about a palette."""
		if index < 0 or index >= len(self.palettes):
			return {}
		return self.palettes[index]

	def list_palettes(self, category: str = None) -> list[dict]:
		"""List available palettes, optionally filtered by category."""
		if category and category in self.CATEGORIES:
			indices = self.CATEGORIES[category]
			return [
				{'index': i, **self.palettes[i]}
				for i in indices if i < len(self.palettes)
			]
		return [{'index': i, **p} for i, p in enumerate(self.palettes)]

	def export_palette_preview(self, index: int, output_path: str, scale: int = 16) -> None:
		"""Export a palette preview image."""
		try:
			from PIL import Image
		except ImportError:
			print("PIL not available, cannot export preview")
			return

		palette = self.get_palette(index)
		img = Image.new('RGB', (16 * scale, scale))
		pixels = img.load()

		for i, color in enumerate(palette):
			for x in range(scale):
				for y in range(scale):
					pixels[i * scale + x, y] = color

		img.save(output_path)

	def to_snes_format(self, palette: list[tuple[int, int, int]]) -> bytes:
		"""Convert RGB palette back to SNES format (for ROM patching)."""
		result = bytearray()
		for r, g, b in palette[:16]:
			# SNES: 0bbbbbgggggrrrrr (15-bit BGR)
			r5 = (r >> 3) & 0x1f
			g5 = (g >> 3) & 0x1f
			b5 = (b >> 3) & 0x1f
			word = r5 | (g5 << 5) | (b5 << 10)
			result.append(word & 0xff)
			result.append((word >> 8) & 0xff)
		return bytes(result)


# Default themed palettes for common uses
DEFAULT_PALETTES = {
	"grayscale": [(i * 17, i * 17, i * 17) for i in range(16)],
	"grassland": [
		(0, 0, 0),        # 0 - transparent/black
		(40, 80, 40),     # 1 - dark grass
		(60, 120, 60),    # 2 - medium grass
		(100, 160, 80),   # 3 - light grass
		(140, 100, 60),   # 4 - dark dirt
		(180, 140, 100),  # 5 - light dirt
		(100, 100, 120),  # 6 - dark stone
		(160, 160, 180),  # 7 - light stone
		(60, 80, 140),    # 8 - dark water
		(100, 140, 200),  # 9 - light water
		(200, 160, 100),  # 10 - wood
		(240, 200, 160),  # 11 - light wood
		(255, 255, 200),  # 12 - highlight
		(180, 80, 80),    # 13 - red accent
		(80, 80, 180),    # 14 - blue accent
		(255, 255, 255),  # 15 - white
	],
	"dungeon": [
		(0, 0, 0),        # 0 - black
		(40, 40, 50),     # 1 - dark stone
		(70, 70, 80),     # 2 - medium stone
		(100, 100, 110),  # 3 - light stone
		(50, 40, 30),     # 4 - dark brown
		(80, 60, 40),     # 5 - medium brown
		(110, 90, 70),    # 6 - light brown
		(140, 120, 100),  # 7 - tan
		(60, 30, 30),     # 8 - dark red
		(100, 50, 50),    # 9 - medium red
		(40, 40, 60),     # 10 - dark blue
		(60, 60, 90),     # 11 - medium blue
		(200, 180, 160),  # 12 - highlight
		(180, 80, 40),    # 13 - torch orange
		(120, 100, 60),   # 14 - gold
		(220, 220, 200),  # 15 - white
	],
	"underwater": [
		(0, 20, 40),      # 0 - deep blue
		(20, 50, 80),     # 1 - dark water
		(40, 80, 120),    # 2 - medium water
		(70, 120, 160),   # 3 - light water
		(100, 160, 200),  # 4 - surface water
		(60, 100, 80),    # 5 - seaweed dark
		(80, 140, 100),   # 6 - seaweed light
		(180, 160, 140),  # 7 - sand
		(200, 180, 160),  # 8 - light sand
		(140, 100, 80),   # 9 - coral dark
		(180, 120, 100),  # 10 - coral light
		(100, 80, 120),   # 11 - purple coral
		(200, 200, 220),  # 12 - bubbles
		(255, 200, 150),  # 13 - fish orange
		(150, 200, 255),  # 14 - fish blue
		(255, 255, 255),  # 15 - highlight
	],
}


def main():
	"""Test palette manager."""
	import sys

	pm = PaletteManager()

	print("=" * 60)
	print("Soul Blazer Palette Manager")
	print("=" * 60)
	print(f"Loaded {pm.palette_count} palettes")
	print()

	# Show first few palettes
	print("Sample palettes:")
	for i in range(min(5, pm.palette_count)):
		info = pm.get_palette_info(i)
		palette = pm.get_palette(i)
		print(f"  [{i}] {info.get('name', 'Unknown')}")
		print(f"      Offset: {info.get('offset', '?')}")
		print(f"      First color: RGB{palette[0]}")

	print()

	# Show area mappings
	print("Area palette mappings:")
	for area, indices in list(pm.AREA_PALETTES.items())[:5]:
		print(f"  {area}: palettes {indices}")

	print()
	print(f"Total areas mapped: {len(pm.AREA_PALETTES)}")


if __name__ == '__main__':
	main()
