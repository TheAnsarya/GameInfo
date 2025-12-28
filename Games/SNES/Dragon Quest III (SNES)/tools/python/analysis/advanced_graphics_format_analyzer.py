"""
Advanced Graphics Format Analyzer for Dragon Quest III ROM
Comprehensive SNES graphics format detection and analysis

Features:
- Precise 2BPP/4BPP/8BPP format detection
- Tile pattern analysis and reconstruction
- Palette detection and color analysis
- Sprite sheet reconstruction
- Animation sequence detection
- Graphics compression detection
- Format-specific extraction tools
"""

import os
import sys
import math
import struct
import hashlib
import json
from typing import Dict, List, Tuple, Optional, Any, Set
from dataclasses import dataclass, asdict
from pathlib import Path
import logging
from collections import defaultdict, Counter
from itertools import combinations

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class GraphicsFormat:
	"""Graphics format specification"""
	name: str
	bpp: int				# Bits per pixel
	colors: int				# Number of colors
	tile_size: int			# Bytes per 8x8 tile
	planar: bool			# Planar format
	interleaved: bool		# Interleaved planes
	description: str

@dataclass
class TileData:
	"""Individual tile information"""
	offset: int
	format: GraphicsFormat
	width: int
	height: int
	palette_offset: Optional[int]
	pixel_data: bytes
	confidence: float
	patterns: Dict[str, Any]

@dataclass
class SpriteSheet:
	"""Collection of related tiles forming a sprite sheet"""
	offset: int
	tiles: List[TileData]
	width_tiles: int
	height_tiles: int
	total_tiles: int
	format: GraphicsFormat
	estimated_palette: Optional[int]
	confidence: float

@dataclass
class AnimationSequence:
	"""Detected animation sequence"""
	base_offset: int
	frames: List[TileData]
	frame_count: int
	estimated_delay: int
	loop_type: str		# "forward", "pingpong", "oneshot"
	confidence: float

@dataclass
class PaletteData:
	"""SNES palette information"""
	offset: int
	colors: List[Tuple[int, int, int]]	# RGB tuples
	color_count: int
	format: str			# "RGB555", "RGB333", etc.
	brightness: float
	unique_colors: int
	confidence: float

class SNESGraphicsFormats:
	"""SNES graphics format definitions"""

	FORMATS = {
		'2BPP': GraphicsFormat(
			name='2BPP',
			bpp=2,
			colors=4,
			tile_size=16,
			planar=True,
			interleaved=False,
			description='2 bits per pixel, 4 colors, planar format'
		),
		'4BPP': GraphicsFormat(
			name='4BPP',
			bpp=4,
			colors=16,
			tile_size=32,
			planar=True,
			interleaved=True,
			description='4 bits per pixel, 16 colors, interleaved planar format'
		),
		'8BPP': GraphicsFormat(
			name='8BPP',
			bpp=8,
			colors=256,
			tile_size=64,
			planar=False,
			interleaved=False,
			description='8 bits per pixel, 256 colors, linear format'
		),
		'Mode7': GraphicsFormat(
			name='Mode7',
			bpp=8,
			colors=256,
			tile_size=64,
			planar=False,
			interleaved=False,
			description='Mode 7 format, 8bpp linear'
		)
	}

class AdvancedGraphicsAnalyzer:
	"""Advanced graphics format analyzer with comprehensive detection"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		if not self.rom_path.exists():
			raise FileNotFoundError(f"ROM file not found: {rom_path}")

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		self.formats = SNESGraphicsFormats.FORMATS
		self.detected_graphics = []
		self.detected_palettes = []
		self.sprite_sheets = []
		self.animations = []

		logger.info(f"Advanced Graphics Analyzer initialized: {len(self.rom_data):,} bytes")

	def analyze_complete_rom(self) -> Dict[str, Any]:
		"""Perform comprehensive graphics analysis of entire ROM"""
		logger.info("Starting comprehensive graphics analysis...")

		results = {
			'total_size': len(self.rom_data),
			'formats_detected': {},
			'palette_analysis': {},
			'sprite_sheets': [],
			'animations': [],
			'compression_detected': False,
			'analysis_summary': {}
		}

		# Step 1: Scan for palettes first
		logger.info("Step 1: Scanning for palettes...")
		palettes = self.find_palettes()
		results['palette_analysis'] = {
			'total_palettes': len(palettes),
			'palettes': palettes[:20]	# Limit output
		}

		# Step 2: Scan for graphics in different formats
		logger.info("Step 2: Scanning for graphics formats...")
		for format_name, format_spec in self.formats.items():
			logger.info(f"	Scanning for {format_name} graphics...")
			graphics = self.find_graphics_by_format(format_spec)
			results['formats_detected'][format_name] = {
				'count': len(graphics),
				'total_tiles': sum(g.width * g.height for g in graphics),
				'confidence_avg': sum(g.confidence for g in graphics) / max(len(graphics), 1),
				'samples': [asdict(g) for g in graphics[:5]]	# First 5 samples
			}

		# Step 3: Reconstruct sprite sheets
		logger.info("Step 3: Reconstructing sprite sheets...")
		sprite_sheets = self.reconstruct_sprite_sheets()
		results['sprite_sheets'] = [asdict(sheet) for sheet in sprite_sheets[:10]]

		# Step 4: Detect animation sequences
		logger.info("Step 4: Detecting animations...")
		animations = self.detect_animations()
		results['animations'] = [asdict(anim) for anim in animations[:10]]

		# Step 5: Check for compression
		logger.info("Step 5: Checking for compression...")
		results['compression_detected'] = self.detect_compression()

		# Summary
		total_graphics = sum(len(self.detected_graphics) for _ in self.formats)
		results['analysis_summary'] = {
			'total_graphics_found': total_graphics,
			'total_palettes_found': len(palettes),
			'total_sprite_sheets': len(sprite_sheets),
			'total_animations': len(animations),
			'coverage_percentage': (total_graphics * 64) / len(self.rom_data) * 100	# Rough estimate
		}

		logger.info(f"Analysis complete: {total_graphics} graphics, {len(palettes)} palettes")
		return results

	def find_graphics_by_format(self, format_spec: GraphicsFormat) -> List[TileData]:
		"""Find graphics data matching specific format"""
		graphics = []
		tile_size = format_spec.tile_size

		# Scan ROM in tile-aligned chunks
		for offset in range(0, len(self.rom_data) - tile_size, 32):	# 32-byte alignment
			if offset + tile_size > len(self.rom_data):
				break

			tile_data = self.rom_data[offset:offset + tile_size]

			# Analyze this potential tile
			confidence = self.analyze_tile_format(tile_data, format_spec)

			if confidence > 0.6:	# Threshold for graphics detection
				patterns = self.analyze_tile_patterns(tile_data, format_spec)

				tile = TileData(
					offset=offset,
					format=format_spec,
					width=8,
					height=8,
					palette_offset=None,
					pixel_data=tile_data,
					confidence=confidence,
					patterns=patterns
				)

				graphics.append(tile)

		logger.info(f"Found {len(graphics)} {format_spec.name} tiles")
		return graphics

	def analyze_tile_format(self, tile_data: bytes, format_spec: GraphicsFormat) -> float:
		"""Analyze how likely data is to be in specified graphics format"""
		if len(tile_data) != format_spec.tile_size:
			return 0.0

		factors = []

		# Factor 1: Entropy analysis (graphics should have medium-high entropy)
		entropy = self.calculate_entropy(tile_data)
		if format_spec.bpp == 2:
			# 2BPP should have lower entropy
			entropy_score = max(0, 1.0 - abs(entropy - 3.5) / 4.0)
		elif format_spec.bpp == 4:
			# 4BPP should have medium entropy
			entropy_score = max(0, 1.0 - abs(entropy - 5.0) / 4.0)
		else:
			# 8BPP should have higher entropy
			entropy_score = max(0, 1.0 - abs(entropy - 6.5) / 2.0)

		factors.append(entropy_score)

		# Factor 2: Byte distribution analysis
		byte_counts = Counter(tile_data)
		unique_bytes = len(byte_counts)

		if format_spec.bpp == 2:
			# 2BPP: Should use limited byte range
			distribution_score = 1.0 if unique_bytes <= 16 else max(0, (32 - unique_bytes) / 16)
		elif format_spec.bpp == 4:
			# 4BPP: Should use moderate byte range
			distribution_score = 1.0 if 4 <= unique_bytes <= 64 else max(0, (64 - abs(unique_bytes - 32)) / 32)
		else:
			# 8BPP: Can use full byte range
			distribution_score = min(unique_bytes / 128, 1.0)

		factors.append(distribution_score)

		# Factor 3: Pattern detection specific to format
		if format_spec.planar:
			pattern_score = self.analyze_planar_patterns(tile_data, format_spec)
		else:
			pattern_score = self.analyze_linear_patterns(tile_data)

		factors.append(pattern_score)

		# Factor 4: Alignment and context
		# Graphics are often aligned to specific boundaries
		alignment_score = 0.8	# Base score

		factors.append(alignment_score)

		# Weighted average
		weights = [0.3, 0.25, 0.35, 0.1]
		confidence = sum(f * w for f, w in zip(factors, weights))

		return min(confidence, 1.0)

	def analyze_planar_patterns(self, tile_data: bytes, format_spec: GraphicsFormat) -> float:
		"""Analyze patterns specific to planar graphics formats"""
		if format_spec.bpp == 2:
			# 2BPP: 2 planes of 8 bytes each
			plane1 = tile_data[:8]
			plane2 = tile_data[8:16]

			# Planes should have some correlation but not be identical
			correlation = self.calculate_plane_correlation(plane1, plane2)
			return max(0, 1.0 - abs(correlation - 0.6))	# Optimal correlation ~0.6

		elif format_spec.bpp == 4:
			# 4BPP: Interleaved planes
			return self.analyze_4bpp_interleaving(tile_data)

		return 0.5

	def analyze_4bpp_interleaving(self, tile_data: bytes) -> float:
		"""Analyze 4BPP interleaved plane patterns"""
		if len(tile_data) != 32:
			return 0.0

		# 4BPP format: planes are interleaved in pairs
		# Row 0: plane 0, plane 1, plane 2, plane 3
		# Row 1: plane 0, plane 1, plane 2, plane 3
		# etc.

		planes = [[], [], [], []]
		for row in range(8):
			base = row * 4
			for plane in range(4):
				if base + plane < len(tile_data):
					planes[plane].append(tile_data[base + plane])

		# Check for reasonable plane patterns
		correlations = []
		for i in range(4):
			for j in range(i + 1, 4):
				if len(planes[i]) == len(planes[j]):
					corr = self.calculate_plane_correlation(bytes(planes[i]), bytes(planes[j]))
					correlations.append(corr)

		if correlations:
			avg_correlation = sum(correlations) / len(correlations)
			# Good 4BPP should have moderate inter-plane correlation
			return max(0, 1.0 - abs(avg_correlation - 0.4))

		return 0.3

	def analyze_linear_patterns(self, tile_data: bytes) -> float:
		"""Analyze patterns for linear (8BPP) formats"""
		# 8BPP: Each byte is a pixel value
		# Look for reasonable pixel value distribution
		values = list(tile_data)

		# Check for gradients (common in graphics)
		gradient_score = self.detect_gradients(values)

		# Check for pattern repetition
		repetition_score = self.detect_repetitions(values)

		# Combine scores
		return (gradient_score + repetition_score) / 2

	def calculate_plane_correlation(self, plane1: bytes, plane2: bytes) -> float:
		"""Calculate correlation between two data planes"""
		if len(plane1) != len(plane2) or len(plane1) == 0:
			return 0.0

		# Simple correlation based on bit patterns
		matching_bits = 0
		total_bits = len(plane1) * 8

		for b1, b2 in zip(plane1, plane2):
			# Count matching bits
			xor = b1 ^ b2
			matching_bits += 8 - bin(xor).count('1')

		return matching_bits / total_bits

	def detect_gradients(self, values: List[int]) -> float:
		"""Detect gradient patterns in pixel values"""
		if len(values) < 4:
			return 0.0

		# Look for increasing/decreasing sequences
		gradients = 0
		total_checks = 0

		for i in range(len(values) - 3):
			seq = values[i:i+4]

			# Check for monotonic sequences
			increasing = all(seq[j] <= seq[j+1] for j in range(3))
			decreasing = all(seq[j] >= seq[j+1] for j in range(3))

			if increasing or decreasing:
				gradients += 1

			total_checks += 1

		return gradients / max(total_checks, 1)

	def detect_repetitions(self, values: List[int]) -> float:
		"""Detect repetitive patterns in pixel values"""
		if len(values) < 8:
			return 0.0

		# Look for repeating subsequences
		pattern_counts = defaultdict(int)

		for length in [2, 3, 4]:
			for i in range(len(values) - length):
				pattern = tuple(values[i:i+length])
				pattern_counts[pattern] += 1

		# Score based on pattern repetition
		repeated_patterns = sum(1 for count in pattern_counts.values() if count > 1)
		total_patterns = len(pattern_counts)

		return repeated_patterns / max(total_patterns, 1)

	def analyze_tile_patterns(self, tile_data: bytes, format_spec: GraphicsFormat) -> Dict[str, Any]:
		"""Analyze detailed patterns within a tile"""
		patterns = {
			'entropy': self.calculate_entropy(tile_data),
			'unique_bytes': len(set(tile_data)),
			'zero_bytes': tile_data.count(0),
			'ff_bytes': tile_data.count(0xFF),
			'symmetry': self.detect_symmetry(tile_data, format_spec),
			'edges': self.detect_edges(tile_data, format_spec)
		}

		return patterns

	def detect_symmetry(self, tile_data: bytes, format_spec: GraphicsFormat) -> Dict[str, float]:
		"""Detect symmetrical patterns in tile data"""
		if format_spec.name == '2BPP' and len(tile_data) == 16:
			# Convert to 8x8 pixels for 2BPP
			pixels = self.convert_2bpp_to_pixels(tile_data)
		elif format_spec.name == '4BPP' and len(tile_data) == 32:
			# Convert to 8x8 pixels for 4BPP
			pixels = self.convert_4bpp_to_pixels(tile_data)
		else:
			# For other formats, work with raw bytes
			pixels = [list(tile_data[i:i+8]) for i in range(0, min(64, len(tile_data)), 8)]

		if len(pixels) != 8 or any(len(row) != 8 for row in pixels):
			return {'horizontal': 0.0, 'vertical': 0.0}

		# Check horizontal symmetry
		h_symmetry = 0
		for row in pixels:
			if row == row[::-1]:
				h_symmetry += 1
		h_symmetry /= 8

		# Check vertical symmetry
		v_symmetry = 0
		for col in range(8):
			column = [pixels[row][col] for row in range(8)]
			if column == column[::-1]:
				v_symmetry += 1
		v_symmetry /= 8

		return {'horizontal': h_symmetry, 'vertical': v_symmetry}

	def convert_2bpp_to_pixels(self, tile_data: bytes) -> List[List[int]]:
		"""Convert 2BPP tile data to 8x8 pixel array"""
		pixels = [[0 for _ in range(8)] for _ in range(8)]

		plane1 = tile_data[:8]
		plane2 = tile_data[8:16]

		for row in range(8):
			for col in range(8):
				bit_pos = 7 - col

				bit0 = (plane1[row] >> bit_pos) & 1
				bit1 = (plane2[row] >> bit_pos) & 1

				pixels[row][col] = (bit1 << 1) | bit0

		return pixels

	def convert_4bpp_to_pixels(self, tile_data: bytes) -> List[List[int]]:
		"""Convert 4BPP tile data to 8x8 pixel array"""
		pixels = [[0 for _ in range(8)] for _ in range(8)]

		# 4BPP interleaved format
		for row in range(8):
			for col in range(8):
				bit_pos = 7 - col
				base = row * 4

				if base + 3 < len(tile_data):
					bit0 = (tile_data[base + 0] >> bit_pos) & 1
					bit1 = (tile_data[base + 1] >> bit_pos) & 1
					bit2 = (tile_data[base + 2] >> bit_pos) & 1
					bit3 = (tile_data[base + 3] >> bit_pos) & 1

					pixels[row][col] = (bit3 << 3) | (bit2 << 2) | (bit1 << 1) | bit0

		return pixels

	def detect_edges(self, tile_data: bytes, format_spec: GraphicsFormat) -> float:
		"""Detect edge patterns in tile data (indicates detailed graphics)"""
		if format_spec.name == '2BPP':
			pixels = self.convert_2bpp_to_pixels(tile_data)
		elif format_spec.name == '4BPP':
			pixels = self.convert_4bpp_to_pixels(tile_data)
		else:
			# Simple edge detection for linear formats
			return self.simple_edge_detection(tile_data)

		# Sobel edge detection on 8x8 pixel grid
		edges = 0
		total = 0

		for row in range(1, 7):	# Avoid edges
			for col in range(1, 7):
				# Sobel X
				gx = (-1 * pixels[row-1][col-1] + 1 * pixels[row-1][col+1] +
						-2 * pixels[row][col-1] + 2 * pixels[row][col+1] +
						-1 * pixels[row+1][col-1] + 1 * pixels[row+1][col+1])

				# Sobel Y
				gy = (-1 * pixels[row-1][col-1] + -2 * pixels[row-1][col] + -1 * pixels[row-1][col+1] +
						 1 * pixels[row+1][col-1] +	2 * pixels[row+1][col] +	1 * pixels[row+1][col+1])

				magnitude = math.sqrt(gx*gx + gy*gy)
				if magnitude > 1.0:	# Threshold for edge detection
					edges += 1
				total += 1

		return edges / max(total, 1)

	def simple_edge_detection(self, tile_data: bytes) -> float:
		"""Simple edge detection for linear data"""
		edges = 0
		for i in range(len(tile_data) - 1):
			if abs(tile_data[i] - tile_data[i+1]) > 32:	# Significant change
				edges += 1

		return edges / max(len(tile_data) - 1, 1)

	def find_palettes(self) -> List[PaletteData]:
		"""Find SNES color palettes in ROM"""
		palettes = []

		# SNES palettes are typically 16-bit RGB555 format
		# Scan for palette-like data
		for offset in range(0, len(self.rom_data) - 32, 2):	# 16 colors minimum
			if offset + 512 > len(self.rom_data):	# Max 256 colors
				break

			# Try different palette sizes
			for color_count in [4, 16, 256]:
				palette_size = color_count * 2	# 2 bytes per color

				if offset + palette_size > len(self.rom_data):
					continue

				palette_data = self.rom_data[offset:offset + palette_size]
				confidence = self.analyze_palette_data(palette_data, color_count)

				if confidence > 0.7:
					colors = self.extract_rgb555_colors(palette_data)

					palette = PaletteData(
						offset=offset,
						colors=colors,
						color_count=color_count,
						format='RGB555',
						brightness=self.calculate_brightness(colors),
						unique_colors=len(set(colors)),
						confidence=confidence
					)

					palettes.append(palette)

		# Remove duplicates and sort by confidence
		palettes = self.deduplicate_palettes(palettes)
		palettes.sort(key=lambda p: p.confidence, reverse=True)

		logger.info(f"Found {len(palettes)} potential palettes")
		return palettes

	def analyze_palette_data(self, palette_data: bytes, color_count: int) -> float:
		"""Analyze how likely data is to be a color palette"""
		if len(palette_data) != color_count * 2:
			return 0.0

		factors = []

		# Factor 1: Valid RGB555 values
		valid_colors = 0
		for i in range(0, len(palette_data), 2):
			if i + 1 < len(palette_data):
				color_word = struct.unpack('<H', palette_data[i:i+2])[0]

				# Check if it's a valid RGB555 color
				if (color_word & 0x8000) == 0:	# Bit 15 should be 0
					valid_colors += 1

		factors.append(valid_colors / color_count)

		# Factor 2: Color distribution (should not be all same color)
		colors = self.extract_rgb555_colors(palette_data)
		unique_colors = len(set(colors))
		factors.append(min(unique_colors / color_count, 1.0))

		# Factor 3: Brightness distribution (should have range)
		brightness_values = [sum(color) for color in colors]
		if brightness_values:
			brightness_range = max(brightness_values) - min(brightness_values)
			factors.append(min(brightness_range / (255 * 3), 1.0))
		else:
			factors.append(0.0)

		# Factor 4: Common palette patterns
		black_present = (0, 0, 0) in colors
		white_present = any(sum(color) > 200 for color in colors)
		pattern_score = 0.5 + 0.25 * black_present + 0.25 * white_present
		factors.append(pattern_score)

		# Weighted average
		weights = [0.4, 0.3, 0.2, 0.1]
		confidence = sum(f * w for f, w in zip(factors, weights))

		return min(confidence, 1.0)

	def extract_rgb555_colors(self, palette_data: bytes) -> List[Tuple[int, int, int]]:
		"""Extract RGB colors from RGB555 palette data"""
		colors = []

		for i in range(0, len(palette_data), 2):
			if i + 1 < len(palette_data):
				color_word = struct.unpack('<H', palette_data[i:i+2])[0]

				# Extract RGB555 components
				r = (color_word & 0x1F) << 3		# 5 bits -> 8 bits
				g = ((color_word >> 5) & 0x1F) << 3	# 5 bits -> 8 bits
				b = ((color_word >> 10) & 0x1F) << 3	# 5 bits -> 8 bits

				colors.append((r, g, b))

		return colors

	def calculate_brightness(self, colors: List[Tuple[int, int, int]]) -> float:
		"""Calculate average brightness of color palette"""
		if not colors:
			return 0.0

		total_brightness = sum(sum(color) for color in colors)
		max_brightness = len(colors) * 255 * 3

		return total_brightness / max_brightness

	def deduplicate_palettes(self, palettes: List[PaletteData]) -> List[PaletteData]:
		"""Remove duplicate palettes"""
		unique_palettes = []
		seen_hashes = set()

		for palette in palettes:
			# Create hash of color data
			color_hash = hashlib.md5(str(palette.colors).encode()).hexdigest()

			if color_hash not in seen_hashes:
				seen_hashes.add(color_hash)
				unique_palettes.append(palette)

		return unique_palettes

	def reconstruct_sprite_sheets(self) -> List[SpriteSheet]:
		"""Reconstruct sprite sheets from individual tiles"""
		sprite_sheets = []

		# Group tiles by format and proximity
		for format_name in self.formats:
			format_tiles = [tile for tile in self.detected_graphics
							 if tile.format.name == format_name]

			if not format_tiles:
				continue

			# Sort tiles by offset
			format_tiles.sort(key=lambda t: t.offset)

			# Group consecutive tiles into sprite sheets
			current_sheet = []
			last_offset = -1

			for tile in format_tiles:
				if last_offset == -1 or tile.offset - last_offset <= tile.format.tile_size * 2:
					current_sheet.append(tile)
				else:
					# Process current sheet
					if len(current_sheet) >= 4:	# Minimum tiles for sprite sheet
						sheet = self.create_sprite_sheet(current_sheet, self.formats[format_name])
						if sheet:
							sprite_sheets.append(sheet)

					current_sheet = [tile]

				last_offset = tile.offset

			# Process final sheet
			if len(current_sheet) >= 4:
				sheet = self.create_sprite_sheet(current_sheet, self.formats[format_name])
				if sheet:
					sprite_sheets.append(sheet)

		logger.info(f"Reconstructed {len(sprite_sheets)} sprite sheets")
		return sprite_sheets

	def create_sprite_sheet(self, tiles: List[TileData], format_spec: GraphicsFormat) -> Optional[SpriteSheet]:
		"""Create sprite sheet from group of tiles"""
		if not tiles:
			return None

		# Estimate sprite sheet dimensions
		tile_count = len(tiles)

		# Common sprite sheet dimensions
		possible_dims = [(1, tile_count), (2, tile_count//2), (4, tile_count//4),
						(8, tile_count//8), (16, tile_count//16)]

		# Choose most square-like dimensions
		best_dims = min(possible_dims, key=lambda d: abs(d[0] - d[1]) if d[1] > 0 else float('inf'))

		width_tiles, height_tiles = best_dims
		if height_tiles == 0:
			width_tiles, height_tiles = tile_count, 1

		# Calculate confidence based on tile arrangement
		confidence = self.calculate_sheet_confidence(tiles)

		sheet = SpriteSheet(
			offset=tiles[0].offset,
			tiles=tiles,
			width_tiles=width_tiles,
			height_tiles=height_tiles,
			total_tiles=tile_count,
			format=format_spec,
			estimated_palette=None,
			confidence=confidence
		)

		return sheet

	def calculate_sheet_confidence(self, tiles: List[TileData]) -> float:
		"""Calculate confidence that tiles form a coherent sprite sheet"""
		if not tiles:
			return 0.0

		factors = []

		# Factor 1: Tile spacing consistency
		spacings = []
		for i in range(1, len(tiles)):
			spacing = tiles[i].offset - tiles[i-1].offset
			spacings.append(spacing)

		if spacings:
			avg_spacing = sum(spacings) / len(spacings)
			spacing_consistency = 1.0 - (sum(abs(s - avg_spacing) for s in spacings) /
										(len(spacings) * avg_spacing + 1))
			factors.append(max(0, spacing_consistency))

		# Factor 2: Confidence distribution
		avg_confidence = sum(tile.confidence for tile in tiles) / len(tiles)
		factors.append(avg_confidence)

		# Factor 3: Pattern similarity
		if len(tiles) > 1:
			similarity = self.calculate_tile_similarity(tiles)
			factors.append(similarity)

		# Weighted average
		weights = [0.4, 0.4, 0.2] if len(factors) == 3 else [0.6, 0.4]
		confidence = sum(f * w for f, w in zip(factors, weights[:len(factors)]))

		return min(confidence, 1.0)

	def calculate_tile_similarity(self, tiles: List[TileData]) -> float:
		"""Calculate similarity between tiles"""
		if len(tiles) < 2:
			return 1.0

		similarities = []

		# Compare entropy and pattern similarities
		for i in range(len(tiles)):
			for j in range(i + 1, min(len(tiles), i + 5)):	# Compare with next few tiles
				tile1, tile2 = tiles[i], tiles[j]

				# Entropy similarity
				entropy1 = tile1.patterns.get('entropy', 0)
				entropy2 = tile2.patterns.get('entropy', 0)
				entropy_sim = 1.0 - abs(entropy1 - entropy2) / 8.0

				# Byte distribution similarity
				unique1 = tile1.patterns.get('unique_bytes', 0)
				unique2 = tile2.patterns.get('unique_bytes', 0)
				dist_sim = 1.0 - abs(unique1 - unique2) / 256.0

				similarity = (entropy_sim + dist_sim) / 2
				similarities.append(max(0, similarity))

		return sum(similarities) / max(len(similarities), 1)

	def detect_animations(self) -> List[AnimationSequence]:
		"""Detect animation sequences in sprite sheets"""
		animations = []

		for sheet in self.sprite_sheets:
			if sheet.total_tiles >= 2:
				# Look for animation patterns
				anim = self.analyze_animation_patterns(sheet)
				if anim and anim.confidence > 0.6:
					animations.append(anim)

		logger.info(f"Detected {len(animations)} animation sequences")
		return animations

	def analyze_animation_patterns(self, sheet: SpriteSheet) -> Optional[AnimationSequence]:
		"""Analyze sprite sheet for animation patterns"""
		if sheet.total_tiles < 2:
			return None

		# Simple animation detection: similar tiles in sequence
		frames = []
		confidence_factors = []

		# Check for frame similarity patterns
		for i in range(sheet.total_tiles - 1):
			tile1 = sheet.tiles[i]
			tile2 = sheet.tiles[i + 1]

			# Calculate difference between adjacent tiles
			similarity = self.calculate_frame_similarity(tile1, tile2)

			if similarity > 0.3:	# Similar enough to be animation frames
				if not frames:
					frames.append(tile1)
				frames.append(tile2)
				confidence_factors.append(similarity)

		if len(frames) < 2:
			return None

		# Estimate animation properties
		frame_count = len(frames)
		estimated_delay = self.estimate_frame_delay(frames)
		loop_type = self.detect_loop_type(frames)
		confidence = sum(confidence_factors) / len(confidence_factors)

		animation = AnimationSequence(
			base_offset=frames[0].offset,
			frames=frames,
			frame_count=frame_count,
			estimated_delay=estimated_delay,
			loop_type=loop_type,
			confidence=confidence
		)

		return animation

	def calculate_frame_similarity(self, tile1: TileData, tile2: TileData) -> float:
		"""Calculate similarity between two animation frames"""
		# Compare pixel data
		data1 = tile1.pixel_data
		data2 = tile2.pixel_data

		if len(data1) != len(data2):
			return 0.0

		# Count differing bytes
		differences = sum(1 for a, b in zip(data1, data2) if a != b)
		similarity = 1.0 - (differences / len(data1))

		return max(0, similarity)

	def estimate_frame_delay(self, frames: List[TileData]) -> int:
		"""Estimate frame delay for animation"""
		# Simple estimation based on frame count
		if len(frames) <= 4:
			return 8	# Fast animation
		elif len(frames) <= 8:
			return 12	# Medium animation
		else:
			return 16	# Slow animation

	def detect_loop_type(self, frames: List[TileData]) -> str:
		"""Detect animation loop type"""
		if len(frames) < 3:
			return "oneshot"

		# Check if last frame is similar to first (forward loop)
		first_last_similarity = self.calculate_frame_similarity(frames[0], frames[-1])

		if first_last_similarity > 0.8:
			return "forward"

		# Check for ping-pong pattern (reverse sequence)
		mid_point = len(frames) // 2
		if len(frames) >= 4:
			pingpong_score = 0
			comparisons = 0

			for i in range(mid_point):
				reverse_idx = len(frames) - 1 - i
				if reverse_idx > mid_point:
					similarity = self.calculate_frame_similarity(frames[i], frames[reverse_idx])
					pingpong_score += similarity
					comparisons += 1

			if comparisons > 0 and pingpong_score / comparisons > 0.7:
				return "pingpong"

		return "forward"

	def detect_compression(self) -> bool:
		"""Detect if ROM contains compressed graphics"""
		# Look for high-entropy regions that might be compressed
		high_entropy_regions = 0
		total_regions = 0

		chunk_size = 1024
		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size):
			chunk = self.rom_data[offset:offset + chunk_size]
			entropy = self.calculate_entropy(chunk)

			if entropy > 7.5:	# Very high entropy indicates compression
				high_entropy_regions += 1

			total_regions += 1

		compression_ratio = high_entropy_regions / max(total_regions, 1)

		# If more than 20% of ROM has very high entropy, likely compressed
		return compression_ratio > 0.2

	def calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""
		if not data:
			return 0.0

		byte_counts = Counter(data)
		data_len = len(data)

		entropy = 0.0
		for count in byte_counts.values():
			if count > 0:
				probability = count / data_len
				entropy -= probability * math.log2(probability)

		return entropy

	def export_analysis_report(self, results: Dict[str, Any], output_path: str = "graphics_analysis_report.json"):
		"""Export analysis results to JSON report"""
		try:
			with open(output_path, 'w') as f:
				# Convert any dataclass objects to dicts
				json.dump(results, f, indent=2, default=str)

			logger.info(f"Analysis report exported to {output_path}")
		except Exception as e:
			logger.error(f"Failed to export report: {e}")


# Command-line interface and testing
if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description='Advanced Graphics Format Analyzer')
	parser.add_argument('--rom', default='static/Dragon Quest III - Soshite Densetsu he... (J).smc',
						help='Path to ROM file (Japanese source ROM)')
	parser.add_argument('--output', default='graphics_analysis.json',
						help='Output report file')
	parser.add_argument('--format', choices=['2BPP', '4BPP', '8BPP', 'all'],
						default='all', help='Specific format to analyze')
	parser.add_argument('--known-locations', action='store_true',
						help='Analyze known graphics locations')

	args = parser.parse_args()

	try:
		analyzer = AdvancedGraphicsAnalyzer(args.rom)

		if args.known_locations:
			# Test specific known locations
			known_graphics_offsets = [
				0x80000, 0x90000, 0xA0000, 0xB0000, 0xC0000,
				0x100000, 0x110000, 0x120000, 0x130000, 0x140000
			]

			print("Testing known graphics locations:")
			for offset in known_graphics_offsets:
				if offset < len(analyzer.rom_data) - 64:
					for format_name, format_spec in analyzer.formats.items():
						if args.format == 'all' or args.format == format_name:
							tile_data = analyzer.rom_data[offset:offset + format_spec.tile_size]
							confidence = analyzer.analyze_tile_format(tile_data, format_spec)

							if confidence > 0.5:
								print(f"0x{offset:06X}: {format_name} confidence {confidence:.3f}")
		else:
			# Full analysis
			print(f"Starting analysis of {args.rom}...")
			results = analyzer.analyze_complete_rom()

			# Print summary
			print(f"\n📊 Graphics Analysis Summary:")
			print(f"ROM Size: {results['total_size']:,} bytes")
			print(f"Total Palettes: {results['palette_analysis']['total_palettes']}")
			print(f"Total Sprite Sheets: {len(results['sprite_sheets'])}")
			print(f"Total Animations: {len(results['animations'])}")
			print(f"Compression Detected: {results['compression_detected']}")

			print(f"\n🎨 Format Detection Results:")
			for format_name, format_data in results['formats_detected'].items():
				print(f"	{format_name}: {format_data['count']} tiles, "
					 f"avg confidence: {format_data['confidence_avg']:.3f}")

			# Export report
			analyzer.export_analysis_report(results, args.output)
			print(f"\n📄 Report exported to {args.output}")

	except Exception as e:
		print(f"❌ Error: {e}")
		import traceback
		traceback.print_exc()
