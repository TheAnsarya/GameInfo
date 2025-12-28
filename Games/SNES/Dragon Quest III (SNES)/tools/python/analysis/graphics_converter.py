#!/usr/bin/env python3
"""
Dragon Quest III - Graphics Converter
=====================================

Converts extracted graphics assets (tiles, palettes) to PNG images
using the SNES graphics formats and proper palette mapping.
"""

import struct
import os
import json
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
import time

try:
	from PIL import Image
	PIL_AVAILABLE = True
except ImportError:
	PIL_AVAILABLE = False
	print("WARNING: PIL (Pillow) not available. Installing...")

class SNESGraphicsConverter:
	"""
	Converts SNES graphics data to modern image formats
	"""

	def __init__(self, assets_dir: str = "extracted_assets", output_dir: str = "converted_graphics"):
		self.assets_dir = Path(assets_dir)
		self.output_dir = Path(output_dir)
		self.output_dir.mkdir(exist_ok=True)

		# Graphics directories
		self.graphics_dir = self.assets_dir / "graphics"
		self.palette_output = self.output_dir / "palettes"
		self.tiles_output = self.output_dir / "tiles"
		self.sprites_output = self.output_dir / "sprites"

		# Create output subdirectories
		self.palette_output.mkdir(exist_ok=True)
		self.tiles_output.mkdir(exist_ok=True)
		self.sprites_output.mkdir(exist_ok=True)

		# Load metadata
		metadata_file = self.assets_dir / "extraction_metadata.json"
		if metadata_file.exists():
			with open(metadata_file, 'r') as f:
				self.metadata = json.load(f)
		else:
			self.metadata = {}

		print(f"INIT: Graphics Converter")
		print(f"Input: {self.assets_dir}")
		print(f"Output: {self.output_dir}")

	def install_pillow(self):
		"""Install Pillow if not available"""
		if not PIL_AVAILABLE:
			import subprocess
			import sys
			try:
				subprocess.check_call([sys.executable, "-m", "pip", "install", "Pillow"])
				print("Successfully installed Pillow!")
				# Restart required for import
				print("Please restart the script to use PIL functionality")
				return False
			except subprocess.CalledProcessError:
				print("Failed to install Pillow. Please install manually: pip install Pillow")
				return False
		return True

	def bgr555_to_rgb(self, color_value: int) -> Tuple[int, int, int]:
		"""Convert SNES BGR555 color to RGB tuple"""
		# BGR555 format: 0bbbbbgggggrrrrr
		blue = (color_value >> 10) & 0x1f
		green = (color_value >> 5) & 0x1f
		red = color_value & 0x1f

		# Scale 5-bit values to 8-bit
		red = (red * 255) // 31
		green = (green * 255) // 31
		blue = (blue * 255) // 31

		return (red, green, blue)

	def load_palette(self, palette_file: Path) -> List[Tuple[int, int, int]]:
		"""Load SNES palette from binary file"""
		if not palette_file.exists():
			return [(0, 0, 0) for _ in range(16)]	# Default black palette

		with open(palette_file, 'rb') as f:
			palette_data = f.read()

		colors = []
		for i in range(0, len(palette_data), 2):
			if i + 1 < len(palette_data):
				color_word = struct.unpack('<H', palette_data[i:i+2])[0]
				colors.append(self.bgr555_to_rgb(color_word))

		# Ensure we have at least 16 colors (pad with black if necessary)
		while len(colors) < 16:
			colors.append((0, 0, 0))

		return colors[:16]	# Take first 16 colors for 4bpp

	def decode_4bpp_tile(self, tile_data: bytes) -> List[int]:
		"""
		Decode SNES 4bpp tile data (32 bytes) to pixel indices
		Returns 8x8 array as flat list
		"""
		if len(tile_data) != 32:
			return [0] * 64	# Default empty tile

		pixels = [0] * 64	# 8x8 pixels

		# SNES 4bpp format: interleaved bitplanes
		# Bytes 0-1: bitplane 0 row 0-1
		# Bytes 2-3: bitplane 1 row 0-1
		# etc.

		for row in range(8):
			bp0_offset = row * 2
			bp1_offset = bp0_offset + 16

			if bp0_offset + 1 < len(tile_data) and bp1_offset + 1 < len(tile_data):
				# Get bitplane data for this row
				bp0_low = tile_data[bp0_offset]
				bp0_high = tile_data[bp0_offset + 1]
				bp1_low = tile_data[bp1_offset]
				bp1_high = tile_data[bp1_offset + 1]

				for col in range(8):
					bit_mask = 1 << (7 - col)

					# Extract bits from each bitplane
					bit0 = 1 if (bp0_low & bit_mask) else 0
					bit1 = 1 if (bp0_high & bit_mask) else 0
					bit2 = 1 if (bp1_low & bit_mask) else 0
					bit3 = 1 if (bp1_high & bit_mask) else 0

					# Combine into 4-bit color index
					color_index = bit0 | (bit1 << 1) | (bit2 << 2) | (bit3 << 3)
					pixels[row * 8 + col] = color_index

		return pixels

	def decode_2bpp_tile(self, tile_data: bytes) -> List[int]:
		"""
		Decode SNES 2bpp tile data (16 bytes) to pixel indices
		"""
		if len(tile_data) != 16:
			return [0] * 64

		pixels = [0] * 64	# 8x8 pixels

		for row in range(8):
			bp0_offset = row * 2
			bp1_offset = bp0_offset + 1

			if bp1_offset < len(tile_data):
				bp0 = tile_data[bp0_offset]
				bp1 = tile_data[bp1_offset]

				for col in range(8):
					bit_mask = 1 << (7 - col)

					bit0 = 1 if (bp0 & bit_mask) else 0
					bit1 = 1 if (bp1 & bit_mask) else 0

					color_index = bit0 | (bit1 << 1)
					pixels[row * 8 + col] = color_index

		return pixels

	def create_tile_image(self, pixels: List[int], palette: List[Tuple[int, int, int]]) -> 'Image.Image':
		"""Create PIL Image from pixel indices and palette"""
		if not PIL_AVAILABLE:
			return None

		# Create 8x8 RGB image
		img = Image.new('RGB', (8, 8))

		for y in range(8):
			for x in range(8):
				pixel_index = pixels[y * 8 + x]
				if pixel_index < len(palette):
					color = palette[pixel_index]
				else:
					color = (255, 0, 255)	# Magenta for invalid colors
				img.putpixel((x, y), color)

		return img

	def convert_palettes(self):
		"""Convert palette files to PNG format"""
		print("\nCONVERTING: Palettes...")

		if not PIL_AVAILABLE:
			if not self.install_pillow():
				return

		palette_files = list(self.graphics_dir.glob("*_palette.bin"))
		print(f"Found {len(palette_files)} palette files")

		converted = 0
		for palette_file in palette_files[:50]:	# Limit for now
			try:
				colors = self.load_palette(palette_file)

				# Create 16x1 palette image
				palette_img = Image.new('RGB', (16, 1))

				for i, color in enumerate(colors[:16]):
					palette_img.putpixel((i, 0), color)

				# Scale up for visibility
				palette_img = palette_img.resize((160, 10), Image.NEAREST)

				# Save as PNG
				output_name = palette_file.stem + '.png'
				output_path = self.palette_output / output_name
				palette_img.save(output_path)

				converted += 1

			except Exception as e:
				print(f"Error converting palette {palette_file.name}: {e}")

		print(f"Converted {converted} palettes to PNG")

	def convert_tiles(self):
		"""Convert tile files to PNG format using available palettes"""
		print("\nCONVERTING: Tiles...")

		if not PIL_AVAILABLE:
			print("PIL not available - skipping tile conversion")
			return

		tile_files = list(self.graphics_dir.glob("*_tiles_*.bin"))
		palette_files = list(self.graphics_dir.glob("*_palette.bin"))

		print(f"Found {len(tile_files)} tile files")
		print(f"Found {len(palette_files)} palette files")

		# Load first few palettes for testing
		palettes = []
		for palette_file in palette_files[:10]:
			try:
				palette = self.load_palette(palette_file)
				palettes.append((palette_file.stem, palette))
			except:
				continue

		if not palettes:
			print("No valid palettes found - creating default palette")
			# Create a default greyscale palette
			default_palette = [(i * 16, i * 16, i * 16) for i in range(16)]
			palettes = [("default", default_palette)]

		converted = 0
		for tile_file in tile_files[:100]:	# Limit for performance
			try:
				with open(tile_file, 'rb') as f:
					tile_data = f.read()

				# Determine tile format
				if "4bpp" in tile_file.name:
					if len(tile_data) >= 32:
						pixels = self.decode_4bpp_tile(tile_data[:32])
						tile_type = "4bpp"
					else:
						continue
				elif "2bpp" in tile_file.name:
					if len(tile_data) >= 16:
						pixels = self.decode_2bpp_tile(tile_data[:16])
						tile_type = "2bpp"
					else:
						continue
				else:
					# Try to guess format by file size
					if len(tile_data) >= 32:
						pixels = self.decode_4bpp_tile(tile_data[:32])
						tile_type = "4bpp"
					elif len(tile_data) >= 16:
						pixels = self.decode_2bpp_tile(tile_data[:16])
						tile_type = "2bpp"
					else:
						continue

				# Convert with each available palette
				for palette_name, palette in palettes[:3]:	# Limit palettes per tile
					try:
						tile_img = self.create_tile_image(pixels, palette)
						if tile_img:
							# Scale up for visibility
							tile_img = tile_img.resize((64, 64), Image.NEAREST)

							# Save with descriptive name
							output_name = f"{tile_file.stem}_{palette_name}_{tile_type}.png"
							output_path = self.tiles_output / output_name
							tile_img.save(output_path)

							converted += 1
					except Exception as e:
						print(f"Error creating tile image: {e}")

			except Exception as e:
				print(f"Error processing tile {tile_file.name}: {e}")

		print(f"Converted {converted} tiles to PNG")

	def create_tileset_images(self):
		"""Create larger tileset images by combining multiple tiles"""
		print("\nCREATING: Tileset images...")

		if not PIL_AVAILABLE:
			return

		tile_files = list(self.graphics_dir.glob("*_tiles_*.bin"))
		palette_files = list(self.graphics_dir.glob("*_palette.bin"))

		if not tile_files or not palette_files:
			print("Not enough tiles or palettes for tilesets")
			return

		# Load a good palette
		palette = self.load_palette(palette_files[0])

		# Process tiles in groups to create tilesets
		tiles_per_row = 16
		tiles_per_column = 16
		tiles_per_set = tiles_per_row * tiles_per_column

		for set_index in range(0, min(len(tile_files), 512), tiles_per_set):
			try:
				# Create tileset image
				tileset_width = tiles_per_row * 8
				tileset_height = tiles_per_column * 8
				tileset_img = Image.new('RGB', (tileset_width, tileset_height), (128, 128, 128))

				tiles_in_set = 0

				for i in range(tiles_per_set):
					tile_index = set_index + i
					if tile_index >= len(tile_files):
						break

					tile_file = tile_files[tile_index]

					try:
						with open(tile_file, 'rb') as f:
							tile_data = f.read()

						# Decode tile
						if len(tile_data) >= 32:
							pixels = self.decode_4bpp_tile(tile_data[:32])
						elif len(tile_data) >= 16:
							pixels = self.decode_2bpp_tile(tile_data[:16])
						else:
							continue

						# Create tile image
						tile_img = self.create_tile_image(pixels, palette)

						# Calculate position in tileset
						tile_x = (i % tiles_per_row) * 8
						tile_y = (i // tiles_per_row) * 8

						# Paste tile into tileset
						tileset_img.paste(tile_img, (tile_x, tile_y))
						tiles_in_set += 1

					except Exception as e:
						continue

				if tiles_in_set > 0:
					# Scale up for visibility
					display_img = tileset_img.resize((tileset_width * 4, tileset_height * 4), Image.NEAREST)

					# Save tileset
					output_name = f"tileset_{set_index:04d}_{tiles_in_set}tiles.png"
					output_path = self.output_dir / output_name
					display_img.save(output_path)

					print(f"Created tileset {set_index//tiles_per_set + 1}: {tiles_in_set} tiles")

			except Exception as e:
				print(f"Error creating tileset {set_index}: {e}")

	def analyze_graphics_usage(self):
		"""Analyze graphics patterns and create usage report"""
		print("\nANALYZING: Graphics usage patterns...")

		tile_files = list(self.graphics_dir.glob("*_tiles_*.bin"))
		palette_files = list(self.graphics_dir.glob("*_palette.bin"))

		analysis = {
			'tiles': {
				'total_files': len(tile_files),
				'formats': {},
				'sizes': {},
				'patterns': []
			},
			'palettes': {
				'total_files': len(palette_files),
				'unique_colors': set(),
				'common_colors': [],
				'color_distribution': {}
			}
		}

		# Analyze tile formats
		for tile_file in tile_files:
			try:
				with open(tile_file, 'rb') as f:
					size = len(f.read())

				if size == 32:
					format_type = "4bpp"
				elif size == 16:
					format_type = "2bpp"
				else:
					format_type = f"unknown_{size}b"

				analysis['tiles']['formats'][format_type] = analysis['tiles']['formats'].get(format_type, 0) + 1
				analysis['tiles']['sizes'][size] = analysis['tiles']['sizes'].get(size, 0) + 1

			except:
				continue

		# Analyze palettes
		color_counts = {}
		for palette_file in palette_files[:20]:	# Limit for performance
			try:
				colors = self.load_palette(palette_file)
				for color in colors:
					color_key = f"{color[0]:02X}{color[1]:02X}{color[2]:02X}"
					analysis['palettes']['unique_colors'].add(color_key)
					color_counts[color_key] = color_counts.get(color_key, 0) + 1
			except:
				continue

		# Find most common colors
		analysis['palettes']['common_colors'] = sorted(color_counts.items(),
														key=lambda x: x[1], reverse=True)[:10]
		analysis['palettes']['color_distribution'] = color_counts

		# Convert set to list for JSON serialization
		analysis['palettes']['unique_colors'] = len(analysis['palettes']['unique_colors'])

		# Save analysis report
		analysis_file = self.output_dir / "graphics_analysis.json"
		with open(analysis_file, 'w') as f:
			json.dump(analysis, f, indent=2)

		print(f"Graphics analysis saved to {analysis_file}")
		print(f"Tile formats: {analysis['tiles']['formats']}")
		print(f"Unique colors found: {analysis['palettes']['unique_colors']}")

	def run_full_conversion(self):
		"""Run complete graphics conversion pipeline"""
		print("STARTING: Complete Graphics Conversion")
		print("=" * 50)

		start_time = time.time()

		# Check if graphics directory exists
		if not self.graphics_dir.exists():
			print(f"ERROR: Graphics directory not found: {self.graphics_dir}")
			return

		# Install PIL if needed
		if not PIL_AVAILABLE:
			if not self.install_pillow():
				print("Cannot proceed without PIL - please install Pillow manually")
				return

		# Run conversions
		self.convert_palettes()
		self.convert_tiles()
		self.create_tileset_images()
		self.analyze_graphics_usage()

		conversion_time = time.time() - start_time

		print(f"\nCONVERSION COMPLETE!")
		print(f"Time: {conversion_time:.2f} seconds")
		print(f"Output directory: {self.output_dir}")

def main():
	"""Main entry point for graphics conversion"""

	print("INIT: Dragon Quest III - Graphics Converter")
	print("=" * 50)

	# Check if extracted assets exist
	assets_dir = "extracted_assets"
	if not os.path.exists(assets_dir):
		print(f"ERROR: Assets directory not found: {assets_dir}")
		print("Please run asset extraction first")
		return

	# Initialize converter
	converter = SNESGraphicsConverter()

	# Run conversion
	converter.run_full_conversion()

if __name__ == "__main__":
	main()
