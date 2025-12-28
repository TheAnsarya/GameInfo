#!/usr/bin/env python3
"""
Graphics Visualization Tool - Generate viewable images from Dragon Quest III graphics data

This tool takes the extracted graphics data from Dragon Quest III ROM analysis
and converts it to viewable PNG images using the SNES graphics decoder.

Created: 2025-11-09
Purpose: Visualize extracted graphics from Dragon Quest III SNES ROM
Dependencies: snes_graphics_decoder, analysis results
"""

import sys
from pathlib import Path
import json
import argparse
from typing import List, Dict, Any, Optional

# Add tools directory to path for imports
sys.path.append(str(Path(__file__).parent.parent))

from graphics.snes_graphics_decoder import SNESGraphicsDecoder
from utils.snes_address_translation import SNESAddressTranslator

class GraphicsVisualizer:
	"""
	Converts extracted Dragon Quest III graphics data to viewable images.

	Uses the analysis results from ROM inspection tools and applies
	SNES graphics decoding to create PNG images for easy viewing.
	"""

	def __init__(self, rom_path: str):
		"""
		Initialize the graphics visualizer.

		Args:
			rom_path: Path to the Dragon Quest III ROM file
		"""
		self.rom_path = Path(rom_path)
		self.decoder = SNESGraphicsDecoder()
		self.translator = SNESAddressTranslator()

		# Load ROM data
		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		print(f"Loaded ROM: {self.rom_path.name} ({len(self.rom_data):,} bytes)")

	def load_analysis_results(self, analysis_file: str) -> Dict[str, Any]:
		"""
		Load graphics analysis results from JSON file.

		Args:
			analysis_file: Path to analysis results JSON

		Returns:
			Dictionary containing analysis data
		"""
		with open(analysis_file, 'r') as f:
			data = json.load(f)

		print(f"Loaded analysis: {len(data.get('palette_candidates', []))} palettes, "
				f"{len(data.get('tiles', []))} tiles")

		return data

	def extract_graphics_chunk(self, snes_address: int, size: int) -> bytes:
		"""
		Extract graphics data from ROM using SNES address.

		Args:
			snes_address: SNES format address
			size: Number of bytes to extract

		Returns:
			Raw graphics data
		"""
		pc_address = self.translator.snes_to_rom_offset(snes_address)

		if pc_address + size > len(self.rom_data):
			raise ValueError(f"Address {snes_address:06X} + {size} exceeds ROM size")

		return self.rom_data[pc_address:pc_address + size]

	def visualize_palette_candidates(self, analysis_data: Dict[str, Any],
									 output_dir: str, max_palettes: int = 50) -> None:
		"""
		Create images showing palette candidates.

		Args:
			analysis_data: Graphics analysis results
			output_dir: Directory to save palette images
			max_palettes: Maximum number of palettes to visualize
		"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		palette_candidates = analysis_data.get('palette_candidates', [])[:max_palettes]

		print(f"\nGenerating palette visualizations...")
		print(f"Processing {len(palette_candidates)} palette candidates")

		for i, candidate in enumerate(palette_candidates):
			snes_addr = candidate['snes_address']
			size = candidate.get('size', 32)	# Default 16 colors * 2 bytes

			try:
				# Extract palette data
				palette_data = self.extract_graphics_chunk(snes_addr, size)

				# Convert to RGB
				colors = self.decoder.snes_palette_to_rgb(palette_data)

				# Create palette swatch image
				swatch = self.create_palette_swatch(colors, swatch_size=32)

				# Save palette image
				filename = f"palette_{i:03d}_addr_{snes_addr:06X}.png"
				swatch.save(output_path / filename)

				if (i + 1) % 10 == 0:
					print(f"	Processed {i + 1}/{len(palette_candidates)} palettes")

			except Exception as e:
				print(f"	Error processing palette {i} at ${snes_addr:06X}: {e}")

		print(f"Palette visualizations saved to: {output_path}")

	def create_palette_swatch(self, colors: List[tuple], swatch_size: int = 32):
		"""
		Create a palette swatch showing all colors.

		Args:
			colors: List of RGB tuples
			swatch_size: Size of each color square

		Returns:
			PIL Image showing the palette
		"""
		from PIL import Image, ImageDraw

		# Arrange colors in a grid
		cols_per_row = 8
		num_rows = (len(colors) + cols_per_row - 1) // cols_per_row

		img_width = cols_per_row * swatch_size
		img_height = num_rows * swatch_size

		image = Image.new('RGB', (img_width, img_height), (128, 128, 128))
		draw = ImageDraw.Draw(image)

		for i, color in enumerate(colors):
			col = i % cols_per_row
			row = i // cols_per_row

			x1 = col * swatch_size
			y1 = row * swatch_size
			x2 = x1 + swatch_size
			y2 = y1 + swatch_size

			draw.rectangle([x1, y1, x2, y2], fill=color, outline=(0, 0, 0))

		return image

	def visualize_tile_chunks(self, analysis_data: Dict[str, Any],
							 output_dir: str, max_chunks: int = 20) -> None:
		"""
		Create images showing tile data chunks.

		Args:
			analysis_data: Graphics analysis results
			output_dir: Directory to save tile images
			max_chunks: Maximum number of chunks to visualize
		"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		chunks = analysis_data.get('graphics_chunks', [])[:max_chunks]

		print(f"\nGenerating tile visualizations...")
		print(f"Processing {len(chunks)} graphics chunks")

		# Create a default palette for tiles
		default_palette = self.decoder.create_test_palette(16)

		for i, chunk in enumerate(chunks):
			snes_addr = chunk['snes_address']
			size = chunk['size']

			try:
				# Extract tile data
				tile_data = self.extract_graphics_chunk(snes_addr, size)

				# Try 4bpp decoding (most common for SNES)
				tiles = self.decoder.decode_tiles(tile_data, bpp=4)

				if tiles:
					# Create tile sheet
					image = self.decoder.tiles_to_image(
						tiles, default_palette, tiles_per_row=16, scale=2
					)

					# Save tile image
					filename = f"tiles_{i:03d}_addr_{snes_addr:06X}_{len(tiles)}tiles.png"
					image.save(output_path / filename)

				if (i + 1) % 5 == 0:
					print(f"	Processed {i + 1}/{len(chunks)} chunks")

			except Exception as e:
				print(f"	Error processing chunk {i} at ${snes_addr:06X}: {e}")

		print(f"Tile visualizations saved to: {output_path}")

	def create_combined_visualization(self, analysis_data: Dict[str, Any],
									output_file: str) -> None:
		"""
		Create a combined visualization showing palette and tile analysis.

		Args:
			analysis_data: Graphics analysis results
			output_file: Path for combined visualization
		"""
		from PIL import Image, ImageDraw, ImageFont

		# Create summary image
		img_width = 1200
		img_height = 800
		image = Image.new('RGB', (img_width, img_height), (255, 255, 255))
		draw = ImageDraw.Draw(image)

		# Try to use a font (fallback to default if not available)
		try:
			font = ImageFont.truetype("arial.ttf", 16)
			title_font = ImageFont.truetype("arial.ttf", 24)
		except:
			font = ImageFont.load_default()
			title_font = ImageFont.load_default()

		# Title
		draw.text((10, 10), "Dragon Quest III - Graphics Analysis Summary",
				 fill=(0, 0, 0), font=title_font)

		# Statistics
		num_palettes = len(analysis_data.get('palette_candidates', []))
		num_tiles = len(analysis_data.get('tiles', []))
		num_chunks = len(analysis_data.get('graphics_chunks', []))

		y_pos = 50
		stats = [
			f"Palette Candidates Found: {num_palettes:,}",
			f"Tiles Extracted: {num_tiles:,}",
			f"Graphics Chunks: {num_chunks:,}",
			f"ROM Size: {len(self.rom_data):,} bytes",
			f"Analysis Date: 2025-11-09"
		]

		for stat in stats:
			draw.text((10, y_pos), stat, fill=(0, 0, 0), font=font)
			y_pos += 25

		# Show first few palette samples
		if analysis_data.get('palette_candidates'):
			y_pos += 20
			draw.text((10, y_pos), "Sample Palettes:", fill=(0, 0, 0), font=font)
			y_pos += 30

			for i, candidate in enumerate(analysis_data['palette_candidates'][:10]):
				try:
					snes_addr = candidate['snes_address']
					palette_data = self.extract_graphics_chunk(snes_addr, 32)
					colors = self.decoder.snes_palette_to_rgb(palette_data)

					# Draw mini palette
					x_start = 50 + (i % 5) * 200
					y_start = y_pos + (i // 5) * 40

					for j, color in enumerate(colors[:8]):	# Show first 8 colors
						draw.rectangle([x_start + j * 20, y_start,
										x_start + j * 20 + 18, y_start + 18],
									 fill=color, outline=(0, 0, 0))

					# Address label
					draw.text((x_start, y_start + 22), f"${snes_addr:06X}",
							 fill=(0, 0, 0), font=font)

				except:
					continue

		# Save combined visualization
		image.save(output_file)
		print(f"Combined visualization saved to: {output_file}")


def main():
	"""Main function for graphics visualization tool."""
	parser = argparse.ArgumentParser(description="Visualize Dragon Quest III graphics data")
	parser.add_argument('rom_path', help='Path to Dragon Quest III ROM file')
	parser.add_argument('analysis_file', help='Path to graphics analysis JSON file')
	parser.add_argument('--output-dir', '-o', default='output/graphics_visualization',
						 help='Output directory for visualizations')
	parser.add_argument('--max-palettes', type=int, default=50,
						 help='Maximum number of palettes to visualize')
	parser.add_argument('--max-chunks', type=int, default=20,
						 help='Maximum number of tile chunks to visualize')
	parser.add_argument('--skip-palettes', action='store_true',
						 help='Skip palette visualization')
	parser.add_argument('--skip-tiles', action='store_true',
						 help='Skip tile visualization')

	args = parser.parse_args()

	print("Dragon Quest III Graphics Visualizer")
	print("====================================")
	print(f"ROM: {args.rom_path}")
	print(f"Analysis: {args.analysis_file}")
	print(f"Output: {args.output_dir}")

	try:
		# Initialize visualizer
		visualizer = GraphicsVisualizer(args.rom_path)

		# Load analysis results
		analysis_data = visualizer.load_analysis_results(args.analysis_file)

		# Create output directory
		output_path = Path(args.output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		# Generate visualizations
		if not args.skip_palettes:
			visualizer.visualize_palette_candidates(
				analysis_data,
				str(output_path / 'palettes'),
				max_palettes=args.max_palettes
			)

		if not args.skip_tiles:
			visualizer.visualize_tile_chunks(
				analysis_data,
				str(output_path / 'tiles'),
				max_chunks=args.max_chunks
			)

		# Create combined summary
		visualizer.create_combined_visualization(
			analysis_data,
			str(output_path / 'summary.png')
		)

		print(f"\n✅ Graphics visualization complete!")
		print(f"📁 Results saved to: {output_path}")

	except Exception as e:
		print(f"❌ Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
