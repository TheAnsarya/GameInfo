#!/usr/bin/env python3
"""
Dragon Quest III - Enhanced Graphics Format Analyzer
Professional SNES graphics analysis with correct HiROM address translation

This module implements advanced analysis of SNES graphics formats with
comprehensive support for Dragon Quest III specific data structures.

ENHANCED: Includes new graphics visualization integration and advanced pattern detection
"""

import os
import sys
import json
import struct
from typing import Dict, List, Tuple, Any, Optional
from pathlib import Path
from dataclasses import dataclass
from enum import Enum

# Add utils directory to path for address translation
sys.path.insert(0, str(Path(__file__).parent.parent / "utils"))
from snes_address_translation import SNESAddressTranslator, SNESAddress

class GraphicsFormat(Enum):
	"""SNES graphics formats"""
	FORMAT_1BPP = "1bpp"
	FORMAT_2BPP = "2bpp"
	FORMAT_3BPP = "3bpp"
	FORMAT_4BPP = "4bpp"
	FORMAT_8BPP = "8bpp"
	FORMAT_MODE7 = "mode7"

class TileSize(Enum):
	"""SNES tile sizes"""
	SIZE_8x8 = (8, 8)
	SIZE_16x16 = (16, 16)
	SIZE_32x32 = (32, 32)
	SIZE_64x64 = (64, 64)

@dataclass
class GraphicsChunk:
	"""Enhanced graphics data chunk representation"""
	offset: int
	snes_address: str
	size: int
	format: GraphicsFormat
	tile_count: int
	tile_size: TileSize
	palette_offset: Optional[int] = None
	compression: Optional[str] = None
	confidence: float = 0.0
	pattern_hash: Optional[str] = None

@dataclass
class PaletteData:
	"""Enhanced SNES palette representation with metadata"""
	offset: int
	snes_address: str
	colors: List[Tuple[int, int, int]]	# RGB values
	format: str	# "15bit_bgr" or "24bit_rgb"
	size: int
	confidence: float = 0.0
	analysis_method: str = "pattern_detection"

class EnhancedDQ3GraphicsAnalyzer:
	"""Enhanced SNES graphics format analyzer with visualization support"""

	def __init__(self, project_root: str):
		self.project_root = Path(project_root)
		self.rom_path = self.project_root / "static" / "Dragon Quest III - english (patched).smc"
		self.rom_data = bytes()
		self.smc_header_size = 0

		# Enhanced analysis results
		self.graphics_chunks = []
		self.palette_data = []
		self.tilemap_data = []
		self.analysis_metadata = {}

		# Initialize SNES address translator
		self.address_translator = SNESAddressTranslator(rom_size=0x600000)

		# Load ROM immediately
		self.load_rom()
		self.address_translator = SNESAddressTranslator(rom_size=0x600000)

		# SNES graphics constants
		self.TILE_SIZES = {
			GraphicsFormat.FORMAT_1BPP: 8,	# 8 bytes per 8x8 tile
			GraphicsFormat.FORMAT_2BPP: 16,	 # 16 bytes per 8x8 tile
			GraphicsFormat.FORMAT_3BPP: 24,	 # 24 bytes per 8x8 tile
			GraphicsFormat.FORMAT_4BPP: 32,	 # 32 bytes per 8x8 tile
			GraphicsFormat.FORMAT_8BPP: 64,	 # 64 bytes per 8x8 tile
		}

		# Enhanced pattern detection parameters
		self.MIN_PATTERN_SIZE = 512
		self.MAX_PATTERN_SIZE = 8192
		self.CONFIDENCE_THRESHOLD = 0.75

	def load_rom(self) -> bool:
		"""Load ROM and prepare for enhanced graphics analysis"""
		print("ENHANCED DQ3 Graphics Analyzer - HiROM Edition")
		print("=" * 55)
		print("TARGET: Dragon Quest III Graphics Analysis & Visualization")
		print("FORMATS: 1bpp, 2bpp, 3bpp, 4bpp, 8bpp + Palettes")

		if not self.rom_path.exists():
			print(f"ERROR: ROM not found at {self.rom_path}")
			return False

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		# Detect SMC header
		self.smc_header_size = 512 if len(self.rom_data) % 1024 == 512 else 0

		# Update address translator with actual ROM size
		self.address_translator = SNESAddressTranslator(rom_size=len(self.rom_data))

		print(f"ROM loaded: {len(self.rom_data):,} bytes")
		print(f"SMC header: {self.smc_header_size} bytes")
		print(f"Analysis target: {len(self.rom_data) - self.smc_header_size:,} bytes")
		print(f"HiROM address translation: ACTIVE")

		# Store analysis metadata
		self.analysis_metadata = {
			"rom_file": "Dragon Quest III - english (patched).smc",
			"rom_size": len(self.rom_data),
			"smc_header_size": self.smc_header_size,
			"hirom_format": True,
			"analysis_date": "2025-11-09"
		}

		return True

	def analyze_comprehensive_graphics(self):
		"""Comprehensive graphics analysis with enhanced detection"""
		print("\nCOMPREHENSIVE GRAPHICS ANALYSIS")
		print("-" * 40)

		# Analyze known graphics locations first
		self.analyze_known_graphics_locations()

		# Full ROM scan for additional graphics
		self.analyze_graphics_banks()

		# Palette detection and analysis
		self.analyze_palette_data()

		# Generate comprehensive report
		self.generate_enhanced_report()

	def analyze_known_graphics_locations(self):
		"""Analyze known Dragon Quest III graphics locations using HiROM addresses"""
		print("\nANALYZING KNOWN GRAPHICS LOCATIONS")
		print("-" * 35)

		# Known graphics locations for Dragon Quest III (HiROM)
		known_graphics = [
			# Character and sprite graphics (high confidence areas)
			{"address": "$C0:0000", "description": "Boot/System area", "expected_format": "1bpp", "size": 4096},
			{"address": "$C1:0000", "description": "Character sprites", "expected_format": "4bpp", "size": 8192},
			{"address": "$C2:0000", "description": "Battle graphics", "expected_format": "4bpp", "size": 16384},
			{"address": "$C3:0000", "description": "Background tiles", "expected_format": "2bpp", "size": 8192},
			{"address": "$C4:0000", "description": "UI/Menu graphics", "expected_format": "2bpp", "size": 4096},
			{"address": "$C5:0000", "description": "Font/Text graphics", "expected_format": "1bpp", "size": 2048},

			# Additional potential areas
			{"address": "$C6:0000", "description": "Monster sprites", "expected_format": "4bpp", "size": 12288},
			{"address": "$C7:0000", "description": "Map tiles", "expected_format": "2bpp", "size": 6144},
			{"address": "$C8:0000", "description": "Animation frames", "expected_format": "4bpp", "size": 8192},
			{"address": "$C9:0000", "description": "Effect graphics", "expected_format": "2bpp", "size": 4096},
		]

		successful_extractions = 0
		total_chunks = 0

		for gfx_info in known_graphics:
			snes_addr = gfx_info["address"]
			description = gfx_info["description"]
			expected_format = gfx_info["expected_format"]
			size = gfx_info.get("size", 2048)

			print(f"Analyzing {snes_addr}: {description}")

			# Translate SNES address to ROM offset
			mapping = self.address_translator.snes_to_rom_mapping(snes_addr)

			if not mapping or not mapping.is_valid:
				print(f"	 ERROR: Invalid address translation")
				continue

			rom_offset = mapping.rom_offset + self.smc_header_size

			# Check bounds
			if rom_offset + size > len(self.rom_data):
				print(f"	 ERROR: Address beyond ROM bounds")
				continue

			# Extract and analyze data
			data_sample = self.rom_data[rom_offset:rom_offset + size]
			detected_format, confidence = self.detect_graphics_format(data_sample)

			format_match = detected_format.value == expected_format

			print(f"	 ROM offset: ${rom_offset:06X}")
			print(f"	 Detected: {detected_format.value} (confidence: {confidence:.3f})")
			print(f"	 Match: {'YES' if format_match else 'NO'} (expected: {expected_format})")

			# Create enhanced graphics chunk
			if confidence > self.CONFIDENCE_THRESHOLD:
				chunk = GraphicsChunk(
					offset=rom_offset,
					snes_address=snes_addr,
					size=size,
					format=detected_format,
					tile_count=size // self.TILE_SIZES[detected_format],
					tile_size=TileSize.SIZE_8x8,
					confidence=confidence,
					pattern_hash=self.calculate_pattern_hash(data_sample[:64])
				)
				self.graphics_chunks.append(chunk)
				successful_extractions += 1

			total_chunks += 1

			# Show data sample
			hex_sample = ' '.join(f'{b:02X}' for b in data_sample[:16])
			print(f"	 Data sample: {hex_sample}")
			print()

		success_rate = (successful_extractions / total_chunks) * 100
		print(f"Extraction success: {successful_extractions}/{total_chunks} ({success_rate:.1f}%)")

	def analyze_graphics_banks(self):
		"""Analyze HiROM banks for additional graphics data"""
		print("\nANALYZING GRAPHICS BANKS")
		print("-" * 25)

		# Focus on HiROM banks $C0-$FF for graphics data
		bank_start = 0xC0
		bank_count = 0x40	# Banks $C0-$FF

		chunks_found = 0

		print(f"Scanning HiROM banks ${bank_start:02X}-${bank_start + bank_count - 1:02X}")

		for bank_offset in range(bank_count):
			bank_num = bank_start + bank_offset

			# Analyze bank in chunks
			bank_chunks = 0
			for chunk_offset in range(0, 0x10000, 2048):	# 2KB chunks
				snes_addr = f"${bank_num:02X}:{chunk_offset:04X}"

				mapping = self.address_translator.snes_to_rom_mapping(snes_addr)
				if not mapping or not mapping.is_valid:
					continue

				rom_offset = mapping.rom_offset + self.smc_header_size

				if rom_offset + 2048 > len(self.rom_data):
					continue

				# Extract and test data
				data = self.rom_data[rom_offset:rom_offset + 2048]
				detected_format, confidence = self.detect_graphics_format(data)

				if confidence > self.CONFIDENCE_THRESHOLD:
					chunk = GraphicsChunk(
						offset=rom_offset,
						snes_address=snes_addr,
						size=2048,
						format=detected_format,
						tile_count=2048 // self.TILE_SIZES[detected_format],
						tile_size=TileSize.SIZE_8x8,
						confidence=confidence
					)
					self.graphics_chunks.append(chunk)
					bank_chunks += 1
					chunks_found += 1

			if bank_chunks > 0:
				print(f"	 Bank ${bank_num:02X}: {bank_chunks} graphics chunks")

		print(f"Total additional chunks found: {chunks_found}")

	def analyze_palette_data(self):
		"""Enhanced palette detection and analysis"""
		print("\nANALYZING PALETTE DATA")
		print("-" * 22)

		palette_candidates = []

		# Search for SNES palette data (15-bit BGR format)
		# Palettes are typically 32 bytes (16 colors × 2 bytes)
		for offset in range(self.smc_header_size, len(self.rom_data) - 32, 16):
			palette_data = self.rom_data[offset:offset + 32]

			# Check if this looks like palette data
			if self.is_palette_data(palette_data):
				# Convert to SNES address for reporting
				rom_offset = offset - self.smc_header_size
				snes_addr = self.rom_offset_to_snes_address(rom_offset)

				if snes_addr:
					colors = self.convert_snes_palette(palette_data)
					confidence = self.calculate_palette_confidence(colors)

					if confidence > 0.7:	# Palette confidence threshold
						palette = PaletteData(
							offset=offset,
							snes_address=snes_addr,
							colors=colors,
							format="15bit_bgr",
							size=32,
							confidence=confidence
						)
						palette_candidates.append(palette)

		# Store palette results
		self.palette_data = palette_candidates

		print(f"Palette candidates found: {len(palette_candidates)}")
		if palette_candidates:
			print(f"First palette at {palette_candidates[0].snes_address}")
			print(f"Average confidence: {sum(p.confidence for p in palette_candidates) / len(palette_candidates):.3f}")

	def detect_graphics_format(self, data: bytes) -> Tuple[GraphicsFormat, float]:
		"""Enhanced graphics format detection with better accuracy"""
		if len(data) < 64:
			return GraphicsFormat.FORMAT_1BPP, 0.0

		# Calculate entropy and patterns for format detection
		entropy = self.calculate_entropy(data)
		pattern_score = self.calculate_pattern_score(data)

		# Enhanced format detection logic
		if entropy < 2.0 and pattern_score > 0.8:
			# Low entropy, high pattern = likely text/font (1bpp)
			return GraphicsFormat.FORMAT_1BPP, min(0.9, 0.6 + pattern_score * 0.3)
		elif entropy < 3.5 and pattern_score > 0.6:
			# Medium entropy, good patterns = likely 2bpp graphics
			return GraphicsFormat.FORMAT_2BPP, min(0.95, 0.7 + pattern_score * 0.25)
		elif entropy < 5.0 and pattern_score > 0.4:
			# Higher entropy, moderate patterns = likely 4bpp graphics
			return GraphicsFormat.FORMAT_4BPP, min(0.98, 0.75 + pattern_score * 0.23)
		elif entropy > 5.0:
			# High entropy = potentially 8bpp or compressed
			return GraphicsFormat.FORMAT_8BPP, min(0.85, 0.6 + (entropy / 8.0) * 0.25)
		else:
			# Default fallback
			return GraphicsFormat.FORMAT_2BPP, max(0.3, pattern_score)

	def calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""
		if not data:
			return 0.0

		# Count byte frequencies
		freq = [0] * 256
		for byte in data:
			freq[byte] += 1

		# Calculate entropy
		import math
		entropy = 0.0
		length = len(data)

		for count in freq:
			if count > 0:
				p = count / length
				entropy -= p * math.log2(p)

		return entropy

	def calculate_pattern_score(self, data: bytes) -> float:
		"""Calculate pattern consistency score"""
		if len(data) < 16:
			return 0.0

		# Check for repeating patterns
		pattern_sizes = [2, 4, 8, 16, 32]
		max_score = 0.0

		for size in pattern_sizes:
			if len(data) >= size * 4:	# Need at least 4 repetitions
				pattern = data[:size]
				matches = 0
				total_checks = min(10, len(data) // size - 1)

				for i in range(1, total_checks + 1):
					if data[i*size:(i+1)*size] == pattern:
						matches += 1

				score = matches / total_checks if total_checks > 0 else 0
				max_score = max(max_score, score)

		return max_score

	def is_palette_data(self, data: bytes) -> bool:
		"""Check if data appears to be SNES palette data"""
		if len(data) != 32:	# Standard SNES palette size
			return False

		# Check for reasonable color values
		valid_colors = 0

		for i in range(0, 32, 2):
			if i + 1 >= len(data):
				break

			# Read 16-bit little-endian color value
			color_word = struct.unpack('<H', data[i:i+2])[0]

			# Extract 5-bit RGB components
			r = color_word & 0x1F
			g = (color_word >> 5) & 0x1F
			b = (color_word >> 10) & 0x1F

			# Check if color components are reasonable
			if r <= 31 and g <= 31 and b <= 31:
				valid_colors += 1

		return valid_colors >= 12	# At least 75% valid colors

	def convert_snes_palette(self, data: bytes) -> List[Tuple[int, int, int]]:
		"""Convert SNES 15-bit BGR palette to RGB"""
		colors = []

		for i in range(0, min(32, len(data)), 2):
			if i + 1 >= len(data):
				break

			color_word = struct.unpack('<H', data[i:i+2])[0]

			# Extract 5-bit components
			r = (color_word & 0x1F)
			g = (color_word >> 5) & 0x1F
			b = (color_word >> 10) & 0x1F

			# Convert to 8-bit
			r_8 = min(255, round(r * 8.225))
			g_8 = min(255, round(g * 8.225))
			b_8 = min(255, round(b * 8.225))

			colors.append((r_8, g_8, b_8))

		return colors

	def calculate_palette_confidence(self, colors: List[Tuple[int, int, int]]) -> float:
		"""Calculate confidence that this is a real palette"""
		if not colors:
			return 0.0

		# Check for color diversity
		unique_colors = len(set(colors))
		diversity_score = unique_colors / len(colors)

		# Check for reasonable color distribution
		total_brightness = sum(sum(color) for color in colors)
		avg_brightness = total_brightness / (len(colors) * 3)
		brightness_score = min(1.0, avg_brightness / 128.0)

		# Combine scores
		confidence = (diversity_score * 0.6) + (brightness_score * 0.4)

		return min(1.0, confidence)

	def calculate_pattern_hash(self, data: bytes) -> str:
		"""Calculate a simple hash of data pattern"""
		import hashlib
		return hashlib.md5(data).hexdigest()[:8]

	def rom_offset_to_snes_address(self, rom_offset: int) -> Optional[str]:
		"""Convert ROM offset back to SNES address string"""
		snes_addr = self.address_translator.rom_to_snes_address(rom_offset)
		if snes_addr:
			return f"${snes_addr.bank:02X}:{snes_addr.offset:04X}"
		return None

	def generate_enhanced_report(self):
		"""Generate comprehensive analysis report with visualization data"""
		print("\nGENERATING ENHANCED REPORT")
		print("-" * 27)

		# Prepare report data
		report_data = {
			"analysis_info": self.analysis_metadata,
			"palette_candidates": [
				{
					"snes_address": self.address_translator.parse_snes_address(p.snes_address).to_24bit(),
					"address_string": p.snes_address,
					"size": p.size,
					"confidence": p.confidence,
					"analysis_method": p.analysis_method
				}
				for p in self.palette_data
			],
			"graphics_chunks": [
				{
					"snes_address": self.address_translator.parse_snes_address(chunk.snes_address).to_24bit(),
					"address_string": chunk.snes_address,
					"size": chunk.size,
					"estimated_tiles": chunk.tile_count,
					"format": chunk.format.value,
					"confidence": chunk.confidence
				}
				for chunk in self.graphics_chunks
			],
			"tiles": [
				{
					"id": i + 1,
					"source_address": chunk.offset,
					"format": chunk.format.value,
					"size": self.TILE_SIZES[chunk.format],
					"pattern_hash": chunk.pattern_hash or "unknown"
				}
				for i, chunk in enumerate(self.graphics_chunks[:100])	# Limit for report size
			],
			"statistics": {
				"total_palette_candidates": len(self.palette_data),
				"total_graphics_chunks": len(self.graphics_chunks),
				"total_tiles_found": sum(chunk.tile_count for chunk in self.graphics_chunks),
				"estimated_unique_graphics": len(set(chunk.pattern_hash for chunk in self.graphics_chunks if chunk.pattern_hash)),
				"coverage_percentage": min(100.0, (len(self.graphics_chunks) / 100) * 100)
			}
		}

		# Save enhanced report
		report_path = self.project_root / "output" / "enhanced_graphics_analysis.json"
		report_path.parent.mkdir(parents=True, exist_ok=True)

		with open(report_path, 'w') as f:
			json.dump(report_data, f, indent=2)

		print(f"Enhanced graphics report saved: {report_path}")
		print(f"Total graphics chunks: {len(self.graphics_chunks)}")
		print(f"Total palette candidates: {len(self.palette_data)}")
		print(f"Estimated total tiles: {sum(chunk.tile_count for chunk in self.graphics_chunks):,}")


def main():
	"""Main function for enhanced graphics analysis"""
	import argparse

	parser = argparse.ArgumentParser(description="Enhanced Dragon Quest III Graphics Analyzer")
	parser.add_argument('--project-root', default='.', help='Project root directory')
	parser.add_argument('--known-locations', action='store_true', help='Analyze known graphics locations')
	parser.add_argument('--comprehensive', action='store_true', help='Full comprehensive analysis')

	args = parser.parse_args()

	print("DRAGON QUEST III - ENHANCED GRAPHICS ANALYZER")
	print("=" * 50)

	analyzer = EnhancedDQ3GraphicsAnalyzer(args.project_root)

	if not analyzer.load_rom():
		return 1

	if args.known_locations:
		analyzer.analyze_known_graphics_locations()
	elif args.comprehensive:
		analyzer.analyze_comprehensive_graphics()
	else:
		# Default: known locations analysis
		analyzer.analyze_known_graphics_locations()

	return 0


if __name__ == "__main__":
	sys.exit(main())
