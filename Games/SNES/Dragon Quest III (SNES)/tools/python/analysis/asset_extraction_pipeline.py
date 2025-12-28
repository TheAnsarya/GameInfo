#!/usr/bin/env python3
"""
Dragon Quest III - Comprehensive Asset Extraction Pipeline
==========================================================

Extracts all graphics, audio, text, scripts, and data from ROM with format
specifications and metadata for complete reconstruction.
"""

import struct
import os
import json
import time
import hashlib
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set
from dataclasses import dataclass, field
from collections import defaultdict, Counter
import math

@dataclass
class ExtractedAsset:
	"""Represents an extracted asset from the ROM"""
	asset_type: str
	offset: int
	size: int
	format_info: Dict[str, Any]
	metadata: Dict[str, Any] = field(default_factory=dict)
	checksum: str = ""

	@property
	def end_offset(self) -> int:
		return self.offset + self.size - 1

class AssetExtractionPipeline:
	"""
	Comprehensive asset extraction pipeline for Dragon Quest III ROM.
	Extracts all assets with format specifications for reconstruction.
	"""

	def __init__(self, rom_path: str, output_dir: str = "extracted_assets"):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)
		self.output_dir = Path(output_dir)
		self.output_dir.mkdir(exist_ok=True)

		# Asset collections
		self.graphics_assets = []
		self.audio_assets = []
		self.text_assets = []
		self.data_assets = []
		self.code_assets = []

		# Metadata
		self.extraction_metadata = {
			'rom_info': {
				'filename': self.rom_path.name,
				'size': self.rom_size,
				'checksum': self._calculate_rom_checksum()
			},
			'extraction_time': None,
			'total_assets': 0,
			'asset_counts': {},
			'coverage_map': {}
		}

		print(f"INIT: Asset Extraction Pipeline")
		print(f"ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")
		print(f"Output: {self.output_dir}")

	def _load_rom(self) -> bytes:
		"""Load ROM data into memory"""
		with open(self.rom_path, 'rb') as f:
			return f.read()

	def _calculate_rom_checksum(self) -> str:
		"""Calculate ROM checksum for validation"""
		return hashlib.sha256(self.rom_data).hexdigest()

	def _create_asset_dir(self, asset_type: str) -> Path:
		"""Create directory for specific asset type"""
		asset_dir = self.output_dir / asset_type
		asset_dir.mkdir(exist_ok=True)
		return asset_dir

	def extract_graphics_assets(self) -> List[ExtractedAsset]:
		"""
		Extract all graphics data including tiles, sprites, palettes, and tilemaps.
		"""
		print("\nEXTRACTING: Graphics Assets...")

		graphics_dir = self._create_asset_dir("graphics")
		graphics_assets = []

		# Extract tile data (2bpp and 4bpp patterns)
		tile_assets = self._extract_tile_data()
		graphics_assets.extend(tile_assets)

		# Extract palette data
		palette_assets = self._extract_palette_data()
		graphics_assets.extend(palette_assets)

		# Extract sprite data
		sprite_assets = self._extract_sprite_data()
		graphics_assets.extend(sprite_assets)

		# Extract tilemap data
		tilemap_assets = self._extract_tilemap_data()
		graphics_assets.extend(tilemap_assets)

		# Save graphics assets
		for i, asset in enumerate(graphics_assets):
			asset_file = graphics_dir / f"gfx_{i:04d}_{asset.asset_type}.bin"
			asset_data = self.rom_data[asset.offset:asset.offset + asset.size]

			with open(asset_file, 'wb') as f:
				f.write(asset_data)

			asset.metadata['output_file'] = str(asset_file.relative_to(self.output_dir))
			asset.checksum = hashlib.sha256(asset_data).hexdigest()[:16]

		print(f"Extracted {len(graphics_assets)} graphics assets")
		self.graphics_assets = graphics_assets
		return graphics_assets

	def _extract_tile_data(self) -> List[ExtractedAsset]:
		"""Extract tile graphics data"""
		tile_assets = []

		# Common SNES tile sizes: 8x8 (32 bytes for 4bpp, 16 bytes for 2bpp)
		# Scan for potential tile data patterns

		for offset in range(0, self.rom_size - 64, 32):
			data = self.rom_data[offset:offset + 64]

			# Check for 4bpp tile pattern (moderate entropy, specific bit patterns)
			if self._is_likely_tile_data(data, bits_per_pixel=4):
				asset = ExtractedAsset(
					asset_type="tiles_4bpp",
					offset=offset,
					size=32,	# 8x8 4bpp tile
					format_info={
						'bits_per_pixel': 4,
						'tile_size': '8x8',
						'format': 'SNES_4BPP'
					}
				)
				tile_assets.append(asset)

			# Check for 2bpp tile pattern
			elif self._is_likely_tile_data(data[:16], bits_per_pixel=2):
				asset = ExtractedAsset(
					asset_type="tiles_2bpp",
					offset=offset,
					size=16,	# 8x8 2bpp tile
					format_info={
						'bits_per_pixel': 2,
						'tile_size': '8x8',
						'format': 'SNES_2BPP'
					}
				)
				tile_assets.append(asset)

		return tile_assets[:1000]	# Limit to prevent excessive results

	def _is_likely_tile_data(self, data: bytes, bits_per_pixel: int) -> bool:
		"""Check if data looks like SNES tile graphics"""
		if len(data) < 16:
			return False

		# Calculate bit patterns typical of graphics data
		bit_patterns = set()
		for byte in data:
			for i in range(8):
				bit_patterns.add((byte >> i) & 1)

		# Graphics data should have mixed bit patterns
		if len(bit_patterns) < 2:
			return False

		# Check for interleaved bitplane patterns (SNES format)
		if bits_per_pixel == 4:
			# 4bpp has specific interleaved pattern
			plane1 = data[0::2]	# Even bytes
			plane2 = data[1::2]	# Odd bytes
			return len(plane1) == len(plane2) and len(set(plane1 + plane2)) > 4
		elif bits_per_pixel == 2:
			# 2bpp has simpler pattern
			return len(set(data)) > 2 and len(set(data)) < len(data) * 0.8

		return False

	def _extract_palette_data(self) -> List[ExtractedAsset]:
		"""Extract palette data"""
		palette_assets = []

		# SNES palettes are typically 16 colors (32 bytes) or 256 colors (512 bytes)
		for offset in range(0, self.rom_size - 32, 16):
			data = self.rom_data[offset:offset + 32]

			if self._is_likely_palette_data(data):
				asset = ExtractedAsset(
					asset_type="palette",
					offset=offset,
					size=32,
					format_info={
						'colors': 16,
						'format': 'SNES_BGR555',
						'bytes_per_color': 2
					}
				)
				palette_assets.append(asset)

		return palette_assets[:500]	# Limit results

	def _is_likely_palette_data(self, data: bytes) -> bool:
		"""Check if data looks like SNES palette data"""
		if len(data) != 32:
			return False

		# Check 16-bit color values (BGR555 format)
		colors = []
		for i in range(0, len(data), 2):
			if i + 1 < len(data):
				color = struct.unpack('<H', data[i:i+2])[0]
				colors.append(color)

		# Valid BGR555 colors have specific bit patterns
		valid_colors = 0
		for color in colors:
			# Check if it's a valid BGR555 color
			blue = (color >> 10) & 0x1f
			green = (color >> 5) & 0x1f
			red = color & 0x1f

			# Colors should be reasonable values
			if blue <= 31 and green <= 31 and red <= 31:
				valid_colors += 1

		return valid_colors >= len(colors) * 0.8

	def _extract_sprite_data(self) -> List[ExtractedAsset]:
		"""Extract sprite data and OAM tables"""
		sprite_assets = []

		# Look for sprite attribute tables (OAM-like structures)
		for offset in range(0, self.rom_size - 16, 4):
			data = self.rom_data[offset:offset + 16]

			if self._is_likely_sprite_oam(data):
				asset = ExtractedAsset(
					asset_type="sprite_oam",
					offset=offset,
					size=16,
					format_info={
						'sprites': 4,
						'format': 'OAM_TABLE',
						'bytes_per_sprite': 4
					}
				)
				sprite_assets.append(asset)

		return sprite_assets[:200]	# Limit results

	def _is_likely_sprite_oam(self, data: bytes) -> bool:
		"""Check if data looks like sprite OAM data"""
		if len(data) != 16:
			return False

		# OAM entries have specific patterns: X, Y, Tile, Attributes
		for i in range(0, len(data), 4):
			if i + 3 < len(data):
				x = data[i]
				y = data[i + 1]
				tile = data[i + 2]
				attr = data[i + 3]

				# Basic validation: coordinates and tile numbers should be reasonable
				if x > 240 or y > 240:	# Outside screen bounds
					return False

		return True

	def _extract_tilemap_data(self) -> List[ExtractedAsset]:
		"""Extract tilemap data"""
		tilemap_assets = []

		# Tilemaps are arrays of 16-bit tile indices
		for offset in range(0, self.rom_size - 64, 32):
			data = self.rom_data[offset:offset + 64]

			if self._is_likely_tilemap_data(data):
				asset = ExtractedAsset(
					asset_type="tilemap",
					offset=offset,
					size=64,
					format_info={
						'tiles': 32,
						'format': 'SNES_TILEMAP',
						'bytes_per_tile': 2
					}
				)
				tilemap_assets.append(asset)

		return tilemap_assets[:300]	# Limit results

	def _is_likely_tilemap_data(self, data: bytes) -> bool:
		"""Check if data looks like tilemap data"""
		if len(data) < 32:
			return False

		# Tilemap entries are 16-bit values with tile index and attributes
		tiles = []
		for i in range(0, len(data), 2):
			if i + 1 < len(data):
				tile_entry = struct.unpack('<H', data[i:i+2])[0]
				tiles.append(tile_entry)

		# Check for reasonable tile indices (not too high)
		max_tile = max(tiles) if tiles else 0
		if max_tile > 0x400:	# Reasonable tile limit
			return False

		# Check for pattern variety
		unique_tiles = len(set(tiles))
		return unique_tiles > 1 and unique_tiles < len(tiles)

	def extract_audio_assets(self) -> List[ExtractedAsset]:
		"""
		Extract audio data including SPC700 samples, sequences, and sound effects.
		"""
		print("\nEXTRACTING: Audio Assets...")

		audio_dir = self._create_asset_dir("audio")
		audio_assets = []

		# Extract BRR samples (SNES audio format)
		brr_assets = self._extract_brr_samples()
		audio_assets.extend(brr_assets)

		# Extract music sequences
		music_assets = self._extract_music_sequences()
		audio_assets.extend(music_assets)

		# Save audio assets
		for i, asset in enumerate(audio_assets):
			asset_file = audio_dir / f"audio_{i:04d}_{asset.asset_type}.bin"
			asset_data = self.rom_data[asset.offset:asset.offset + asset.size]

			with open(asset_file, 'wb') as f:
				f.write(asset_data)

			asset.metadata['output_file'] = str(asset_file.relative_to(self.output_dir))
			asset.checksum = hashlib.sha256(asset_data).hexdigest()[:16]

		print(f"Extracted {len(audio_assets)} audio assets")
		self.audio_assets = audio_assets
		return audio_assets

	def _extract_brr_samples(self) -> List[ExtractedAsset]:
		"""Extract BRR (Bit Rate Reduction) audio samples"""
		brr_assets = []

		# BRR blocks are 9 bytes each, look for patterns
		for offset in range(0, self.rom_size - 72, 9):
			data = self.rom_data[offset:offset + 72]	# 8 BRR blocks

			if self._is_likely_brr_data(data):
				# Determine sample length (look for end marker)
				sample_size = self._find_brr_sample_size(offset)

				asset = ExtractedAsset(
					asset_type="brr_sample",
					offset=offset,
					size=sample_size,
					format_info={
						'format': 'BRR',
						'blocks': sample_size // 9,
						'sample_rate': 'variable'
					}
				)
				brr_assets.append(asset)

		return brr_assets[:100]	# Limit results

	def _is_likely_brr_data(self, data: bytes) -> bool:
		"""Check if data looks like BRR audio samples"""
		if len(data) < 9:
			return False

		# Check BRR block headers (every 9th byte)
		for i in range(0, len(data), 9):
			if i < len(data):
				header = data[i]

				# BRR header has specific bit patterns
				shift = (header >> 4) & 0x0f
				filter = (header >> 2) & 0x03
				end_flag = (header >> 1) & 0x01
				loop_flag = header & 0x01

				# Validate header values
				if shift > 12:	# Invalid shift value
					return False
				if filter > 3:	# Invalid filter
					return False

		return True

	def _find_brr_sample_size(self, offset: int) -> int:
		"""Find the size of a BRR sample by looking for end marker"""
		size = 9	# Minimum one block

		for i in range(offset + 9, min(offset + 1000, self.rom_size), 9):
			if i < self.rom_size:
				header = self.rom_data[i]
				end_flag = (header >> 1) & 0x01

				size = i - offset + 9

				if end_flag:	# End of sample
					break

		return size

	def _extract_music_sequences(self) -> List[ExtractedAsset]:
		"""Extract music sequence data"""
		music_assets = []

		# Look for music sequence patterns (command-based formats)
		for offset in range(0, self.rom_size - 32, 16):
			data = self.rom_data[offset:offset + 32]

			if self._is_likely_music_sequence(data):
				sequence_size = self._find_sequence_size(offset)

				asset = ExtractedAsset(
					asset_type="music_sequence",
					offset=offset,
					size=sequence_size,
					format_info={
						'format': 'SPC_SEQUENCE',
						'commands': 'variable'
					}
				)
				music_assets.append(asset)

		return music_assets[:50]	# Limit results

	def _is_likely_music_sequence(self, data: bytes) -> bool:
		"""Check if data looks like music sequence commands"""
		if len(data) < 8:
			return False

		# Look for common music command patterns
		command_patterns = [0x00, 0x01, 0x02, 0x10, 0x20, 0x40, 0x80, 0xff]

		command_count = 0
		for byte in data[:16]:
			if byte in command_patterns or (0x80 <= byte <= 0xff):
				command_count += 1

		return command_count >= 8	# At least half should be commands

	def _find_sequence_size(self, offset: int) -> int:
		"""Find size of music sequence"""
		# Look for end markers or pattern breaks
		size = 32

		for i in range(offset + 32, min(offset + 512, self.rom_size)):
			if i < self.rom_size:
				byte = self.rom_data[i]
				if byte == 0x00 and i + 1 < self.rom_size and self.rom_data[i + 1] == 0x00:
					size = i - offset + 2
					break

		return size

	def extract_text_assets(self) -> List[ExtractedAsset]:
		"""
		Extract all text data including dialogue, menus, and item names.
		"""
		print("\nEXTRACTING: Text Assets...")

		text_dir = self._create_asset_dir("text")
		text_assets = []

		# Extract ASCII text
		ascii_assets = self._extract_ascii_text()
		text_assets.extend(ascii_assets)

		# Extract compressed text
		compressed_text_assets = self._extract_compressed_text()
		text_assets.extend(compressed_text_assets)

		# Save text assets
		for i, asset in enumerate(text_assets):
			asset_file = text_dir / f"text_{i:04d}_{asset.asset_type}.txt"
			asset_data = self.rom_data[asset.offset:asset.offset + asset.size]

			# Try to decode as text for preview
			try:
				if asset.asset_type == "ascii_text":
					text_content = asset_data.decode('ascii', errors='ignore')
					with open(asset_file, 'w', encoding='utf-8') as f:
						f.write(text_content)
				else:
					# Binary text data
					with open(asset_file.with_suffix('.bin'), 'wb') as f:
						f.write(asset_data)
			except:
				# Fallback to binary
				with open(asset_file.with_suffix('.bin'), 'wb') as f:
					f.write(asset_data)

			asset.metadata['output_file'] = str(asset_file.relative_to(self.output_dir))
			asset.checksum = hashlib.sha256(asset_data).hexdigest()[:16]

		print(f"Extracted {len(text_assets)} text assets")
		self.text_assets = text_assets
		return text_assets

	def _extract_ascii_text(self) -> List[ExtractedAsset]:
		"""Extract ASCII text strings"""
		text_assets = []

		current_string = b""
		string_start = None

		for i in range(self.rom_size):
			byte = self.rom_data[i]

			# Check if byte is printable ASCII or text terminator
			if 32 <= byte <= 126 or byte in [0, 10, 13]:
				if string_start is None and byte != 0:
					string_start = i
					current_string = bytes([byte])
				elif string_start is not None:
					current_string += bytes([byte])
			else:
				# End of text string
				if string_start is not None and len(current_string) >= 8:
					asset = ExtractedAsset(
						asset_type="ascii_text",
						offset=string_start,
						size=len(current_string),
						format_info={
							'encoding': 'ASCII',
							'preview': current_string[:50].decode('ascii', errors='ignore')
						}
					)
					text_assets.append(asset)

				string_start = None
				current_string = b""

		return text_assets[:200]	# Limit results

	def _extract_compressed_text(self) -> List[ExtractedAsset]:
		"""Extract compressed or encoded text"""
		text_assets = []

		# Look for Japanese text patterns (Shift-JIS or custom encoding)
		for offset in range(0, self.rom_size - 32, 16):
			data = self.rom_data[offset:offset + 32]

			if self._is_likely_japanese_text(data):
				text_size = self._find_text_block_size(offset)

				asset = ExtractedAsset(
					asset_type="japanese_text",
					offset=offset,
					size=text_size,
					format_info={
						'encoding': 'CUSTOM_JP',
						'compressed': False
					}
				)
				text_assets.append(asset)

		return text_assets[:100]	# Limit results

	def _is_likely_japanese_text(self, data: bytes) -> bool:
		"""Check if data looks like Japanese text encoding"""
		# Look for patterns typical of Japanese text encodings
		high_bytes = sum(1 for byte in data if byte >= 0x80)
		return high_bytes > len(data) * 0.5 and high_bytes < len(data) * 0.9

	def _find_text_block_size(self, offset: int) -> int:
		"""Find size of text block"""
		size = 16

		# Look for text terminators
		for i in range(offset + 16, min(offset + 256, self.rom_size)):
			if i < self.rom_size:
				if self.rom_data[i] == 0x00:
					size = i - offset + 1
					break

		return size

	def extract_data_assets(self) -> List[ExtractedAsset]:
		"""
		Extract game data including stats, item tables, and configuration data.
		"""
		print("\nEXTRACTING: Data Assets...")

		data_dir = self._create_asset_dir("data")
		data_assets = []

		# Extract structured tables
		table_assets = self._extract_data_tables()
		data_assets.extend(table_assets)

		# Extract configuration data
		config_assets = self._extract_config_data()
		data_assets.extend(config_assets)

		# Save data assets
		for i, asset in enumerate(data_assets):
			asset_file = data_dir / f"data_{i:04d}_{asset.asset_type}.bin"
			asset_data = self.rom_data[asset.offset:asset.offset + asset.size]

			with open(asset_file, 'wb') as f:
				f.write(asset_data)

			asset.metadata['output_file'] = str(asset_file.relative_to(self.output_dir))
			asset.checksum = hashlib.sha256(asset_data).hexdigest()[:16]

		print(f"Extracted {len(data_assets)} data assets")
		self.data_assets = data_assets
		return data_assets

	def _extract_data_tables(self) -> List[ExtractedAsset]:
		"""Extract structured data tables"""
		table_assets = []

		# Look for repeating data structures
		for offset in range(0, self.rom_size - 128, 32):
			data = self.rom_data[offset:offset + 128]

			if self._is_structured_table(data):
				table_size = self._find_table_size(offset)

				asset = ExtractedAsset(
					asset_type="data_table",
					offset=offset,
					size=table_size,
					format_info={
						'format': 'STRUCTURED_TABLE',
						'entry_size': 'variable'
					}
				)
				table_assets.append(asset)

		return table_assets[:50]	# Limit results

	def _is_structured_table(self, data: bytes) -> bool:
		"""Check if data looks like a structured table"""
		if len(data) < 32:
			return False

		# Look for repeating patterns
		patterns = []
		for i in range(0, len(data), 8):
			if i + 8 <= len(data):
				pattern = data[i:i + 8]
				patterns.append(pattern)

		# Check for structure
		unique_patterns = len(set(patterns))
		return 2 <= unique_patterns <= len(patterns) * 0.8

	def _find_table_size(self, offset: int) -> int:
		"""Find size of data table"""
		return min(256, self.rom_size - offset)	# Default table size

	def _extract_config_data(self) -> List[ExtractedAsset]:
		"""Extract configuration and parameter data"""
		config_assets = []

		# Look for small parameter blocks
		for offset in range(0, self.rom_size - 16, 8):
			data = self.rom_data[offset:offset + 16]

			if self._is_config_data(data):
				asset = ExtractedAsset(
					asset_type="config_data",
					offset=offset,
					size=16,
					format_info={
						'format': 'PARAMETERS',
						'values': struct.unpack('<8H', data)
					}
				)
				config_assets.append(asset)

		return config_assets[:100]	# Limit results

	def _is_config_data(self, data: bytes) -> bool:
		"""Check if data looks like configuration parameters"""
		if len(data) != 16:
			return False

		# Check if values look like reasonable parameters
		try:
			values = struct.unpack('<8H', data)
			return all(0 <= val <= 10000 for val in values)
		except:
			return False

	def run_full_extraction(self) -> Dict[str, Any]:
		"""
		Run complete asset extraction pipeline.
		"""
		print("\nSTARTING: Complete Asset Extraction Pipeline")
		print("=" * 60)

		start_time = time.time()

		# Extract all asset types
		self.extract_graphics_assets()
		self.extract_audio_assets()
		self.extract_text_assets()
		self.extract_data_assets()

		# Generate extraction report
		extraction_time = time.time() - start_time
		self.extraction_metadata['extraction_time'] = extraction_time

		total_assets = (len(self.graphics_assets) + len(self.audio_assets) +
						 len(self.text_assets) + len(self.data_assets))

		self.extraction_metadata.update({
			'total_assets': total_assets,
			'asset_counts': {
				'graphics': len(self.graphics_assets),
				'audio': len(self.audio_assets),
				'text': len(self.text_assets),
				'data': len(self.data_assets)
			}
		})

		# Save extraction metadata
		metadata_file = self.output_dir / "extraction_metadata.json"
		with open(metadata_file, 'w') as f:
			json.dump(self.extraction_metadata, f, indent=2, default=str)

		print(f"\nCOMPLETE: Asset Extraction Complete!")
		print(f"Time: {extraction_time:.2f} seconds")
		print(f"Total Assets: {total_assets}")
		print(f"Metadata saved to: {metadata_file}")

		return self.extraction_metadata

def main():
	"""Main entry point for asset extraction"""

	print("INIT: Dragon Quest III - Asset Extraction Pipeline")
	print("=" * 60)

	# Find ROM file
	rom_files = [
		'static/Dragon Quest III - Soshite Densetsu he... (J).smc',	# Primary Japanese source
		'static/Dragon Quest III - english.smc',						 # Reference translation
		'static/Dragon Quest III - english (patched).smc'				# Backup option
	]

	rom_path = None
	for rom_file in rom_files:
		if os.path.exists(rom_file):
			rom_path = rom_file
			break

	if not rom_path:
		print("ERROR: No ROM file found!")
		return

	# Run extraction
	extractor = AssetExtractionPipeline(rom_path)
	report = extractor.run_full_extraction()

	print(f"\nCOMPLETE: Extraction Complete!")
	print(f"Assets extracted: {report['total_assets']}")

if __name__ == "__main__":
	main()
