#!/usr/bin/env python3
"""
Soul Blazer (SNES) Sprite Extractor
Extracts character and enemy sprites from the ROM.
"""

import json
import struct
from pathlib import Path
from PIL import Image


class SpriteExtractor:
	"""Extract sprites from Soul Blazer ROM."""

	# Default SNES palette (will be replaced with actual palettes)
	DEFAULT_PALETTE = [
		(0, 0, 0),        # 0 - Transparent
		(32, 32, 32),     # 1
		(64, 64, 64),     # 2
		(96, 96, 96),     # 3
		(128, 128, 128),  # 4
		(160, 160, 160),  # 5
		(192, 192, 192),  # 6
		(224, 224, 224),  # 7
		(255, 255, 255),  # 8
		(255, 0, 0),      # 9
		(0, 255, 0),      # 10
		(0, 0, 255),      # 11
		(255, 255, 0),    # 12
		(255, 0, 255),    # 13
		(0, 255, 255),    # 14
		(255, 128, 0),    # 15
	]

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self.palettes = []

	def snes_color_to_rgb(self, color: int) -> tuple[int, int, int]:
		"""Convert SNES 15-bit color to RGB."""
		r = (color & 0x1f) << 3
		g = ((color >> 5) & 0x1f) << 3
		b = ((color >> 10) & 0x1f) << 3
		return (r, g, b)

	def extract_palette(self, offset: int) -> list[tuple[int, int, int]]:
		"""Extract 16-color palette from offset."""
		palette = []
		for i in range(16):
			color = struct.unpack('<H', self.rom[offset + i * 2:offset + i * 2 + 2])[0]
			palette.append(self.snes_color_to_rgb(color))
		return palette

	def decode_4bpp_tile(self, offset: int) -> list[list[int]]:
		"""Decode 8x8 4BPP tile at offset."""
		tile = [[0] * 8 for _ in range(8)]

		for row in range(8):
			bp0 = self.rom[offset + row * 2] if offset + row * 2 < len(self.rom) else 0
			bp1 = self.rom[offset + row * 2 + 1] if offset + row * 2 + 1 < len(self.rom) else 0
			bp2 = self.rom[offset + 16 + row * 2] if offset + 16 + row * 2 < len(self.rom) else 0
			bp3 = self.rom[offset + 16 + row * 2 + 1] if offset + 16 + row * 2 + 1 < len(self.rom) else 0

			for col in range(8):
				bit = 7 - col
				pixel = ((bp0 >> bit) & 1)
				pixel |= ((bp1 >> bit) & 1) << 1
				pixel |= ((bp2 >> bit) & 1) << 2
				pixel |= ((bp3 >> bit) & 1) << 3
				tile[row][col] = pixel

		return tile

	def tile_to_image(self, tile: list[list[int]], palette: list = None, transparent: bool = True) -> Image.Image:
		"""Convert tile data to PIL Image."""
		if palette is None:
			palette = self.DEFAULT_PALETTE

		if transparent:
			img = Image.new('RGBA', (8, 8))
			pixels = img.load()
			for y in range(8):
				for x in range(8):
					idx = tile[y][x]
					if idx == 0:
						pixels[x, y] = (0, 0, 0, 0)
					else:
						r, g, b = palette[idx]
						pixels[x, y] = (r, g, b, 255)
		else:
			img = Image.new('RGB', (8, 8))
			pixels = img.load()
			for y in range(8):
				for x in range(8):
					pixels[x, y] = palette[tile[y][x]]

		return img

	def extract_sprite_16x16(self, offset: int, palette: list = None) -> Image.Image:
		"""Extract 16x16 sprite (4 tiles in 2x2 arrangement)."""
		# 16x16 sprites are typically 4 8x8 tiles
		# Arrangement: top-left, bottom-left, top-right, bottom-right
		img = Image.new('RGBA', (16, 16))

		tiles = []
		for i in range(4):
			tile = self.decode_4bpp_tile(offset + i * 32)
			tile_img = self.tile_to_image(tile, palette)
			tiles.append(tile_img)

		# Standard SNES OBJ arrangement
		img.paste(tiles[0], (0, 0))
		img.paste(tiles[1], (0, 8))
		img.paste(tiles[2], (8, 0))
		img.paste(tiles[3], (8, 8))

		return img

	def extract_sprite_32x32(self, offset: int, palette: list = None) -> Image.Image:
		"""Extract 32x32 sprite (16 tiles in 4x4 arrangement)."""
		img = Image.new('RGBA', (32, 32))

		for ty in range(4):
			for tx in range(4):
				tile_idx = ty * 4 + tx
				tile = self.decode_4bpp_tile(offset + tile_idx * 32)
				tile_img = self.tile_to_image(tile, palette)
				img.paste(tile_img, (tx * 8, ty * 8))

		return img

	def find_sprites(self) -> list[dict]:
		"""Scan ROM for potential sprite data."""
		sprites = []

		# Look for patterns typical of sprite data
		# Sprites often have consistent bitplane patterns

		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			# Sample check every 0x800 bytes
			for offset in range(start, end, 0x800):
				# Check for non-zero data with typical sprite patterns
				sample = self.rom[offset:offset + 128]
				if len(sample) < 128:
					continue

				# Check for varied pixel data (not all 00 or FF)
				unique_bytes = len(set(sample))
				if 10 < unique_bytes < 100:
					sprites.append({
						'bank': bank,
						'offset': offset,
						'unique_bytes': unique_bytes,
					})

		return sprites

	def extract_player_frames(self, output_dir: str):
		"""Extract player character animation frames."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		# Known/estimated player sprite locations
		# These need verification through gameplay/debugging
		player_sprite_banks = [0x06, 0x07, 0x08]

		frame_idx = 0
		for bank in player_sprite_banks:
			start = bank * 0x8000

			# Extract sprite-sized chunks
			for offset in range(start, start + 0x4000, 0x200):  # 16x16 sprite = 0x80 bytes × 4 frames
				sprite = self.extract_sprite_16x16(offset)

				# Check if sprite has content
				bbox = sprite.getbbox()
				if bbox:
					sprite_scaled = sprite.resize((32, 32), Image.NEAREST)
					sprite_scaled.save(output / f'player_{frame_idx:03d}.png')
					frame_idx += 1

		return frame_idx

	def extract_enemy_sprites(self, output_dir: str):
		"""Extract enemy sprite graphics."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		# Enemy sprites typically in banks $10-$18
		enemy_banks = range(0x10, 0x18)

		sprite_idx = 0
		for bank in enemy_banks:
			start = bank * 0x8000
			bank_dir = output / f'bank{bank:02x}'
			bank_dir.mkdir(exist_ok=True)

			# Extract 16x16 sprites
			for offset in range(start, start + 0x8000, 0x80):
				sprite = self.extract_sprite_16x16(offset)

				# Only save non-empty sprites
				bbox = sprite.getbbox()
				if bbox:
					sprite_scaled = sprite.resize((32, 32), Image.NEAREST)
					sprite_scaled.save(bank_dir / f'sprite_{sprite_idx:03d}.png')
					sprite_idx += 1

		return sprite_idx

	def create_sprite_sheet(self, sprites: list[Image.Image], columns: int = 8) -> Image.Image:
		"""Create sprite sheet from list of sprites."""
		if not sprites:
			return Image.new('RGBA', (1, 1))

		sprite_w = sprites[0].width
		sprite_h = sprites[0].height
		rows = (len(sprites) + columns - 1) // columns

		sheet = Image.new('RGBA', (columns * sprite_w, rows * sprite_h))

		for i, sprite in enumerate(sprites):
			x = (i % columns) * sprite_w
			y = (i // columns) * sprite_h
			sheet.paste(sprite, (x, y))

		return sheet

	def extract_all(self, output_dir: str):
		"""Extract all sprite data."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		print("Finding sprite locations...")
		sprite_locations = self.find_sprites()
		print(f"Found {len(sprite_locations)} potential sprite regions")

		# Save sprite location data
		with open(output / 'sprite_locations.json', 'w') as f:
			json.dump(sprite_locations, f, indent='\t')

		# Extract sample sprites from each region
		print("\nExtracting sample sprites...")

		all_sprites = []
		for loc in sprite_locations[:100]:  # Limit to first 100 regions
			try:
				sprite = self.extract_sprite_16x16(loc['offset'])
				if sprite.getbbox():  # Has content
					all_sprites.append(sprite)
			except Exception:
				pass

		if all_sprites:
			# Create combined sprite sheet
			sheet = self.create_sprite_sheet(all_sprites, 16)
			sheet.save(output / 'sprite_sheet.png')
			print(f"Created sprite sheet with {len(all_sprites)} sprites")

		# Extract by category
		print("\nExtracting player sprites...")
		player_count = self.extract_player_frames(output / 'player')
		print(f"Extracted {player_count} player frames")

		print("\nExtracting enemy sprites...")
		enemy_count = self.extract_enemy_sprites(output / 'enemies')
		print(f"Extracted {enemy_count} enemy sprites")

		print(f"\nSprites extracted to: {output}")


def main():
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\graphics\sprites"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	extractor = SpriteExtractor(rom_path)
	extractor.extract_all(output_dir)


if __name__ == '__main__':
	main()
