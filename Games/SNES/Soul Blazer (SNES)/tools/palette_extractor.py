#!/usr/bin/env python3
"""
Soul Blazer (SNES) Palette Extractor
Extracts color palettes from the ROM for accurate graphics display.

SNES palettes use 15-bit BGR color (5 bits per channel).
Format: 0bbbbbgg gggrrrrr
"""

import json
import struct
from pathlib import Path
from typing import List, Tuple, Optional
from dataclasses import dataclass, asdict


@dataclass
class SnesPalette:
	"""Represents a 16-color SNES palette."""
	id: int
	name: str
	offset: int
	colors: List[Tuple[int, int, int]]  # RGB tuples


def snes_to_rgb(color16: int) -> Tuple[int, int, int]:
	"""
	Convert SNES 15-bit BGR to 24-bit RGB.
	SNES format: 0bbbbbgg gggrrrrr (little-endian)
	"""
	r = (color16 & 0x1f) << 3
	g = ((color16 >> 5) & 0x1f) << 3
	b = ((color16 >> 10) & 0x1f) << 3
	# Extend to full 8-bit range
	r |= r >> 5
	g |= g >> 5
	b |= b >> 5
	return (r, g, b)


def rgb_to_snes(r: int, g: int, b: int) -> int:
	"""Convert 24-bit RGB to SNES 15-bit BGR."""
	r5 = (r >> 3) & 0x1f
	g5 = (g >> 3) & 0x1f
	b5 = (b >> 3) & 0x1f
	return r5 | (g5 << 5) | (b5 << 10)


class PaletteExtractor:
	"""Extract palettes from Soul Blazer ROM."""

	# Known palette locations (file offsets)
	KNOWN_PALETTES = {
		# Player palettes
		0x00: {'name': 'Player Normal', 'offset': 0x0},
		0x01: {'name': 'Player Damaged', 'offset': 0x0},

		# Area palettes (approximate locations)
		0x10: {'name': 'Grass Valley', 'offset': 0x0},
		0x11: {'name': 'Underground Castle', 'offset': 0x0},
		0x12: {'name': 'GreenWood', 'offset': 0x0},
		0x13: {'name': 'St. Elles', 'offset': 0x0},
		0x14: {'name': 'Seabed', 'offset': 0x0},
		0x15: {'name': 'Mountain of Souls', 'offset': 0x0},
		0x16: {'name': "Leo's Lab", 'offset': 0x0},
		0x17: {'name': 'Magridd Castle', 'offset': 0x0},
		0x18: {'name': 'World of Evil', 'offset': 0x0},
	}

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data: bytes = b''
		self.palettes: List[SnesPalette] = []

	def load_rom(self) -> bool:
		"""Load the ROM file."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def read_palette(self, offset: int, num_colors: int = 16) -> List[Tuple[int, int, int]]:
		"""Read a palette from ROM offset."""
		colors = []
		for i in range(num_colors):
			if offset + i * 2 + 2 <= len(self.rom_data):
				color16 = struct.unpack('<H', self.rom_data[offset + i * 2:offset + i * 2 + 2])[0]
				colors.append(snes_to_rgb(color16))
			else:
				colors.append((0, 0, 0))
		return colors

	def scan_for_palettes(self) -> List[Tuple[int, List[Tuple[int, int, int]]]]:
		"""
		Scan ROM for potential palette data.
		Palettes are identified by:
		- First color often black (0x0000)
		- Valid SNES color range
		- Reasonable color variation
		"""
		potential_palettes = []

		for offset in range(0, len(self.rom_data) - 32, 2):
			# Check if this could be a palette
			first_color = struct.unpack('<H', self.rom_data[offset:offset + 2])[0]

			# First color is often black or near-black
			if first_color > 0x0400:
				continue

			# Read 16 colors
			colors = []
			valid = True
			unique_colors = set()

			for i in range(16):
				color16 = struct.unpack('<H', self.rom_data[offset + i * 2:offset + i * 2 + 2])[0]

				# Check for valid SNES color (only 15 bits used)
				if color16 & 0x8000:
					valid = False
					break

				rgb = snes_to_rgb(color16)
				colors.append(rgb)
				unique_colors.add(color16)

			if not valid:
				continue

			# Need at least 4 unique colors to be interesting
			if len(unique_colors) < 4:
				continue

			potential_palettes.append((offset, colors))

		return potential_palettes

	def extract_known_palettes(self) -> List[SnesPalette]:
		"""Extract palettes from known locations."""
		palettes = []

		# Scan specific areas known to contain palette data
		# Bank $0D and $0E typically contain graphics/palette data
		palette_regions = [
			(0x068000, 0x070000),  # Bank $0D
			(0x070000, 0x078000),  # Bank $0E
		]

		palette_id = 0
		for start, end in palette_regions:
			for offset in range(start, min(end, len(self.rom_data)) - 32, 32):
				# Check first color (usually black for backgrounds)
				first = struct.unpack('<H', self.rom_data[offset:offset + 2])[0]
				if first <= 0x0400:  # Near black
					colors = self.read_palette(offset)
					# Check for reasonable palette
					if len(set(colors)) >= 4:
						palettes.append(SnesPalette(
							id=palette_id,
							name=f"Palette_{palette_id:02X}",
							offset=offset,
							colors=colors
						))
						palette_id += 1

		return palettes

	def extract_sprite_palettes(self) -> List[SnesPalette]:
		"""Extract sprite palettes (typically stored differently)."""
		palettes = []

		# Sprite palettes are often in graphics banks
		# Look for patterns typical of sprite palettes
		for bank in range(0x10, 0x18):
			bank_start = bank * 0x8000
			bank_end = bank_start + 0x8000

			if bank_end > len(self.rom_data):
				continue

			# Scan for palette-like data at bank boundaries
			for offset in [bank_start, bank_start + 0x4000]:
				if offset + 32 <= len(self.rom_data):
					colors = self.read_palette(offset)
					if len(set(colors)) >= 3:
						palettes.append(SnesPalette(
							id=bank,
							name=f"Bank{bank:02X}_Palette",
							offset=offset,
							colors=colors
						))

		return palettes

	def generate_palette_image(self, palette: SnesPalette, scale: int = 32) -> 'Image':
		"""Generate a visual representation of a palette."""
		from PIL import Image

		# Create a 16x1 image (or 4x4 grid)
		img = Image.new('RGB', (4 * scale, 4 * scale))

		for i, color in enumerate(palette.colors[:16]):
			x = (i % 4) * scale
			y = (i // 4) * scale
			for dy in range(scale):
				for dx in range(scale):
					img.putpixel((x + dx, y + dy), color)

		return img

	def export_palettes(self, output_dir: Path):
		"""Export all extracted palettes."""
		output_dir.mkdir(parents=True, exist_ok=True)

		# Export as JSON
		palette_data = {
			'rom': str(self.rom_path.name),
			'palette_count': len(self.palettes),
			'palettes': []
		}

		for pal in self.palettes:
			palette_data['palettes'].append({
				'id': pal.id,
				'name': pal.name,
				'offset': f"${pal.offset:06X}",
				'colors_rgb': [list(c) for c in pal.colors],
				'colors_hex': [f"#{c[0]:02X}{c[1]:02X}{c[2]:02X}" for c in pal.colors]
			})

		json_path = output_dir / 'palettes.json'
		with open(json_path, 'w') as f:
			json.dump(palette_data, f, indent='\t')
		print(f"Saved: {json_path}")

		# Export palette images
		try:
			from PIL import Image
			for pal in self.palettes[:50]:  # Limit to first 50
				img = self.generate_palette_image(pal)
				img_path = output_dir / f"palette_{pal.id:02X}.png"
				img.save(img_path)
			print(f"Saved palette images to {output_dir}")
		except ImportError:
			print("PIL not available, skipping image export")

	def extract_all(self) -> List[SnesPalette]:
		"""Perform full palette extraction."""
		if not self.rom_data:
			if not self.load_rom():
				raise RuntimeError("Failed to load ROM")

		print("Extracting known palettes...")
		self.palettes = self.extract_known_palettes()
		print(f"Found {len(self.palettes)} potential palettes")

		print("\nExtracting sprite palettes...")
		sprite_palettes = self.extract_sprite_palettes()
		print(f"Found {len(sprite_palettes)} sprite palettes")

		# Combine and deduplicate
		seen_offsets = {p.offset for p in self.palettes}
		for sp in sprite_palettes:
			if sp.offset not in seen_offsets:
				self.palettes.append(sp)
				seen_offsets.add(sp.offset)

		return self.palettes


def main():
	import sys

	# Default paths
	script_dir = Path(__file__).parent
	rom_path = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")
	output_dir = script_dir.parent / "assets" / "palettes"

	if len(sys.argv) > 1:
		rom_path = Path(sys.argv[1])

	if not rom_path.exists():
		print(f"ROM not found: {rom_path}")
		sys.exit(1)

	print(f"Soul Blazer Palette Extractor")
	print(f"ROM: {rom_path}")
	print(f"Output: {output_dir}")
	print()

	extractor = PaletteExtractor(str(rom_path))
	palettes = extractor.extract_all()

	print(f"\nTotal palettes found: {len(palettes)}")

	# Export results
	extractor.export_palettes(output_dir)

	# Print sample palettes
	print("\n=== Sample Palettes ===")
	for pal in palettes[:5]:
		print(f"\n{pal.name} (${pal.offset:06X}):")
		for i, color in enumerate(pal.colors[:8]):
			print(f"  {i}: #{color[0]:02X}{color[1]:02X}{color[2]:02X}")


if __name__ == '__main__':
	main()
