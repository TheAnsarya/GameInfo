#!/usr/bin/env python3
"""
SNES Graphics Decoder - Convert SNES tile data to viewable images

This module provides functionality to decode SNES graphics formats and convert
them to standard image formats using PIL/Pillow. Supports various bit depths
and color formats commonly used in SNES games.

Created: 2025-11-09
Purpose: Graphics visualization for Dragon Quest III ROM analysis
Dependencies: PIL/Pillow for image generation
"""

from PIL import Image
import numpy as np
from typing import List, Tuple, Optional, Union
import struct
from pathlib import Path

class SNESGraphicsDecoder:
	"""
	Decoder for SNES graphics data supporting multiple bit depths and formats.

	Supports:
	- 2bpp (4 colors)
	- 4bpp (16 colors) - most common for SNES
	- 8bpp (256 colors)
	- Various tile arrangements and sizes
	"""

	def __init__(self):
		"""Initialize the SNES graphics decoder."""
		# Standard SNES tile size
		self.tile_width = 8
		self.tile_height = 8

		# Color depth configurations
		self.bpp_configs = {
			2: {'colors': 4, 'bytes_per_tile': 16},
			4: {'colors': 16, 'bytes_per_tile': 32},
			8: {'colors': 256, 'bytes_per_tile': 64}
		}

	def decode_2bpp_tile(self, tile_data: bytes) -> np.ndarray:
		"""
		Decode a single 2bpp tile (4 colors).

		Args:
			tile_data: 16 bytes of tile data

		Returns:
			8x8 numpy array with color indices (0-3)
		"""
		if len(tile_data) != 16:
			raise ValueError(f"2bpp tile must be 16 bytes, got {len(tile_data)}")

		tile = np.zeros((8, 8), dtype=np.uint8)

		for row in range(8):
			# Each row uses 2 bytes (bitplane 0 and bitplane 1)
			bp0 = tile_data[row]
			bp1 = tile_data[row + 8]

			for col in range(8):
				# Extract bits from both bitplanes
				bit0 = (bp0 >> (7 - col)) & 1
				bit1 = (bp1 >> (7 - col)) & 1

				# Combine to get color index
				color_index = bit0 + (bit1 << 1)
				tile[row, col] = color_index

		return tile

	def decode_4bpp_tile(self, tile_data: bytes) -> np.ndarray:
		"""
		Decode a single 4bpp tile (16 colors) - most common SNES format.

		Args:
			tile_data: 32 bytes of tile data

		Returns:
			8x8 numpy array with color indices (0-15)
		"""
		if len(tile_data) != 32:
			raise ValueError(f"4bpp tile must be 32 bytes, got {len(tile_data)}")

		tile = np.zeros((8, 8), dtype=np.uint8)

		for row in range(8):
			# Each row uses 4 bytes (4 bitplanes)
			bp0 = tile_data[row]
			bp1 = tile_data[row + 8]
			bp2 = tile_data[row + 16]
			bp3 = tile_data[row + 24]

			for col in range(8):
				# Extract bits from all bitplanes
				bit0 = (bp0 >> (7 - col)) & 1
				bit1 = (bp1 >> (7 - col)) & 1
				bit2 = (bp2 >> (7 - col)) & 1
				bit3 = (bp3 >> (7 - col)) & 1

				# Combine to get color index
				color_index = bit0 + (bit1 << 1) + (bit2 << 2) + (bit3 << 3)
				tile[row, col] = color_index

		return tile

	def decode_8bpp_tile(self, tile_data: bytes) -> np.ndarray:
		"""
		Decode a single 8bpp tile (256 colors).

		Args:
			tile_data: 64 bytes of tile data

		Returns:
			8x8 numpy array with color indices (0-255)
		"""
		if len(tile_data) != 64:
			raise ValueError(f"8bpp tile must be 64 bytes, got {len(tile_data)}")

		tile = np.zeros((8, 8), dtype=np.uint8)

		for row in range(8):
			# Each row uses 8 bytes (8 bitplanes)
			bitplanes = [tile_data[row + (i * 8)] for i in range(8)]

			for col in range(8):
				color_index = 0
				for plane in range(8):
					bit = (bitplanes[plane] >> (7 - col)) & 1
					color_index += bit << plane

				tile[row, col] = color_index

		return tile

	def decode_tiles(self, data: bytes, bpp: int, num_tiles: Optional[int] = None) -> List[np.ndarray]:
		"""
		Decode multiple tiles from graphics data.

		Args:
			data: Raw graphics data
			bpp: Bits per pixel (2, 4, or 8)
			num_tiles: Number of tiles to decode (None = all possible)

		Returns:
			List of decoded tiles as numpy arrays
		"""
		if bpp not in self.bpp_configs:
			raise ValueError(f"Unsupported bpp: {bpp}. Supported: {list(self.bpp_configs.keys())}")

		config = self.bpp_configs[bpp]
		bytes_per_tile = config['bytes_per_tile']

		if num_tiles is None:
			num_tiles = len(data) // bytes_per_tile

		# Determine decode function
		decode_func = {
			2: self.decode_2bpp_tile,
			4: self.decode_4bpp_tile,
			8: self.decode_8bpp_tile
		}[bpp]

		tiles = []
		for i in range(num_tiles):
			start = i * bytes_per_tile
			end = start + bytes_per_tile

			if end > len(data):
				break

			tile_data = data[start:end]
			tile = decode_func(tile_data)
			tiles.append(tile)

		return tiles

	def snes_palette_to_rgb(self, palette_data: bytes) -> List[Tuple[int, int, int]]:
		"""
		Convert SNES 15-bit BGR palette data to RGB tuples.

		SNES palette format: 2 bytes per color, 15-bit BGR (0BBBBBGGGGGRRRRR)

		Args:
			palette_data: Raw palette data (2 bytes per color)

		Returns:
			List of RGB tuples
		"""
		colors = []

		for i in range(0, len(palette_data), 2):
			if i + 1 >= len(palette_data):
				break

			# Read 16-bit little-endian value
			color_word = struct.unpack('<H', palette_data[i:i+2])[0]

			# Extract 5-bit components (ignore top bit)
			red = (color_word & 0x1F)
			green = (color_word >> 5) & 0x1F
			blue = (color_word >> 10) & 0x1F

			# Scale 5-bit values to 8-bit (multiply by 8.225, round)
			red_8bit = min(255, round(red * 8.225))
			green_8bit = min(255, round(green * 8.225))
			blue_8bit = min(255, round(blue * 8.225))

			colors.append((red_8bit, green_8bit, blue_8bit))

		return colors

	def tiles_to_image(self, tiles: List[np.ndarray], palette: List[Tuple[int, int, int]],
						tiles_per_row: int = 16, scale: int = 1) -> Image.Image:
		"""
		Convert decoded tiles to a PIL Image using the provided palette.

		Args:
			tiles: List of decoded tile arrays
			palette: RGB palette as list of tuples
			tiles_per_row: Number of tiles per row in output image
			scale: Scaling factor for output image

		Returns:
			PIL Image object
		"""
		if not tiles:
			raise ValueError("No tiles provided")

		num_tiles = len(tiles)
		num_rows = (num_tiles + tiles_per_row - 1) // tiles_per_row

		# Calculate image dimensions
		img_width = tiles_per_row * self.tile_width * scale
		img_height = num_rows * self.tile_height * scale

		# Create RGB image
		image = Image.new('RGB', (img_width, img_height), (0, 0, 0))

		for tile_idx, tile in enumerate(tiles):
			# Calculate tile position
			tile_col = tile_idx % tiles_per_row
			tile_row = tile_idx // tiles_per_row

			base_x = tile_col * self.tile_width * scale
			base_y = tile_row * self.tile_height * scale

			# Draw tile pixels
			for y in range(self.tile_height):
				for x in range(self.tile_width):
					color_idx = tile[y, x]

					# Get color from palette (default to black if out of range)
					if color_idx < len(palette):
						color = palette[color_idx]
					else:
						color = (0, 0, 0)

					# Apply scaling
					for sy in range(scale):
						for sx in range(scale):
							px = base_x + x * scale + sx
							py = base_y + y * scale + sy

							if px < img_width and py < img_height:
								image.putpixel((px, py), color)

		return image

	def create_test_palette(self, num_colors: int) -> List[Tuple[int, int, int]]:
		"""
		Create a test palette for visualization when real palette is unknown.

		Args:
			num_colors: Number of colors needed

		Returns:
			List of RGB tuples
		"""
		palette = [(0, 0, 0)]	# First color is always transparent/black

		for i in range(1, num_colors):
			# Generate rainbow colors
			hue = (i - 1) / (num_colors - 1) * 360

			# Simple HSV to RGB conversion
			c = 255
			x = int(c * (1 - abs((hue / 60) % 2 - 1)))

			if 0 <= hue < 60:
				rgb = (c, x, 0)
			elif 60 <= hue < 120:
				rgb = (x, c, 0)
			elif 120 <= hue < 180:
				rgb = (0, c, x)
			elif 180 <= hue < 240:
				rgb = (0, x, c)
			elif 240 <= hue < 300:
				rgb = (x, 0, c)
			else:
				rgb = (c, 0, x)

			palette.append(rgb)

		return palette


def main():
	"""Example usage of the SNES graphics decoder."""
	print("SNES Graphics Decoder - Example Usage")
	print("=====================================")

	decoder = SNESGraphicsDecoder()

	# Example: Create a simple test pattern
	print("\nCreating test pattern...")

	# Create a simple 4bpp tile with a checkerboard pattern
	test_tile_data = bytearray(32)

	# Fill with alternating pattern
	for i in range(8):
		test_tile_data[i] = 0xAA if i % 2 == 0 else 0x55	# Bitplane 0
		test_tile_data[i + 8] = 0x55 if i % 2 == 0 else 0xAA	# Bitplane 1
		test_tile_data[i + 16] = 0xFF	# Bitplane 2
		test_tile_data[i + 24] = 0x00	# Bitplane 3

	# Decode the test tile
	tiles = decoder.decode_tiles(bytes(test_tile_data), bpp=4, num_tiles=1)

	# Create a test palette
	palette = decoder.create_test_palette(16)

	# Convert to image
	image = decoder.tiles_to_image(tiles, palette, tiles_per_row=1, scale=8)

	print(f"Created test image: {image.size}")
	print("Decoder ready for ROM graphics analysis!")


if __name__ == "__main__":
	main()
