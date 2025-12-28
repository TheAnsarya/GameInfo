#!/usr/bin/env python3
"""
SNES Asset Pipeline for DQ3R Project
Extracts graphics, audio, and data from Dragon Quest III ROM
Integrates with compression algorithms for asset processing
"""

import os
import sys
import struct
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Union
import json
from dataclasses import dataclass
import time

# Import our compression engine
try:
	sys.path.append(str(Path(__file__).parent.parent))
	from compression.compression_engine import get_compression_engine, CompressionEngine
except ImportError:
	# Fallback - create stub compression engine
	class StubCompressionEngine:
		def decompress(self, data, algorithm):
			return data

		def compress(self, data, algorithm):
			return data, None

	def get_compression_engine():
		return StubCompressionEngine()


@dataclass
class AssetInfo:
	"""Information about a ROM asset"""

	name: str
	offset: int
	size: int
	asset_type: str
	compression: Optional[str] = None
	metadata: Dict[str, Any] = None

	def __post_init__(self):
		if self.metadata is None:
			self.metadata = {}


@dataclass
class GraphicsAsset(AssetInfo):
	"""Graphics asset with SNES-specific properties"""

	width: Optional[int] = None
	height: Optional[int] = None
	bpp: Optional[int] = None	# Bits per pixel
	palette_offset: Optional[int] = None
	tile_format: str = "4bpp"	# Default SNES tile format


@dataclass
class AudioAsset(AssetInfo):
	"""Audio asset with SPC700 properties"""

	sample_rate: Optional[int] = None
	channels: Optional[int] = None
	format: str = "brr"	# SNES BRR format


@dataclass
class DialogAsset(AssetInfo):
	"""Dialog text asset"""

	encoding: str = "shift-jis"
	font_table_offset: Optional[int] = None
	text_blocks: List[Dict[str, Any]] = None

	def __post_init__(self):
		super().__post_init__()
		if self.text_blocks is None:
			self.text_blocks = []


class SNESROMAnalyzer:
	"""Analyzes SNES ROM structure and identifies assets"""

	def __init__(self, rom_path: Path):
		self.rom_path = rom_path
		self.rom_data = self._load_rom()
		self.compression_engine = get_compression_engine()

		# DQ3 specific memory layout
		self.dq3_layout = {
			"character_classes": {
				"offset": 0xc4179e,	# From previous analysis
				"size": 9 * 90,	# 9 classes, 90 bytes each
				"format": "character_class_data",
			},
			"monster_data": {
				"offset": 0x180000,	# Estimated location
				"count": 155,	# From previous analysis
				"format": "monster_stats",
			},
			"dialog_font": {
				"offset": 0x200000,	# Estimated location
				"count": 50,	# From previous analysis
				"format": "font_data",
			},
			"graphics_tiles": {
				"offset": 0x100000,	# Common graphics location
				"format": "4bpp_tiles",
			},
			"palettes": {
				"offset": 0x140000,	# Common palette location
				"format": "snes_palette",
			},
		}

		self.asset_database = []
		self.logs_dir = Path(__file__).parent.parent / "logs"
		self.logs_dir.mkdir(exist_ok=True)

	def _load_rom(self) -> bytes:
		"""Load ROM data with validation"""
		try:
			with open(self.rom_path, "rb") as f:
				data = f.read()

			# Basic SNES ROM validation
			if len(data) < 0x200000:	# Minimum expected size for DQ3
				raise ValueError(f"ROM file too small: {len(data)} bytes")

			# Check for header (0x200 byte header sometimes present)
			if len(data) % 1024 == 512:
				print("ROM has 512-byte header, removing...")
				data = data[512:]

			return data

		except Exception as e:
			raise RuntimeError(f"Could not load ROM {self.rom_path}: {e}")

	def analyze_rom_structure(self) -> Dict[str, Any]:
		"""Analyze overall ROM structure and identify sections"""
		analysis = {
			"rom_size": len(self.rom_data),
			"rom_type": "Unknown",
			"mapping_mode": "Unknown",
			"regions": [],
			"compression_detected": [],
		}

		# Detect ROM mapping mode
		if len(self.rom_data) in [0x200000, 0x400000]:	# 2MB or 4MB
			analysis["rom_type"] = "LoROM"
			analysis["mapping_mode"] = "Mode 20/21"

		# Scan for compressed data patterns
		compressed_regions = self._detect_compressed_regions()
		analysis["compression_detected"] = compressed_regions

		# Identify major data sections
		regions = self._identify_data_regions()
		analysis["regions"] = regions

		return analysis

	def _detect_compressed_regions(self) -> List[Dict[str, Any]]:
		"""Detect regions that might contain compressed data"""
		compressed_regions = []

		# Look for patterns indicative of compression
		chunk_size = 0x1000	# 4KB chunks

		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size):
			chunk = self.rom_data[offset : offset + chunk_size]

			# Calculate entropy to detect compressed data
			entropy = self._calculate_entropy(chunk)

			# High entropy (> 7.0) often indicates compression
			if entropy > 7.0:
				# Try decompression with our algorithms
				for algorithm in ["basic_ring400", "simple_tail_window"]:
					try:
						decompressed = self.compression_engine.decompress(chunk, algorithm)
						if len(decompressed) > len(chunk):
							compressed_regions.append(
								{
									"offset": offset,
									"size": chunk_size,
									"algorithm": algorithm,
									"entropy": entropy,
									"decompressed_size": len(decompressed),
								}
							)
							break
					except:
						continue

		return compressed_regions

	def _calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""
		if not data:
			return 0.0

		# Count byte frequencies
		frequencies = {}
		for byte in data:
			frequencies[byte] = frequencies.get(byte, 0) + 1

		# Calculate entropy
		entropy = 0.0
		data_len = len(data)

		for count in frequencies.values():
			probability = count / data_len
			if probability > 0:
				entropy -= probability * (probability.bit_length() - 1)

		return entropy

	def _identify_data_regions(self) -> List[Dict[str, Any]]:
		"""Identify different types of data regions in ROM"""
		regions = []

		# Graphics region detection (look for tile patterns)
		graphics_regions = self._find_graphics_regions()
		regions.extend(graphics_regions)

		# Audio region detection (look for BRR samples)
		audio_regions = self._find_audio_regions()
		regions.extend(audio_regions)

		# Text region detection (look for ASCII/Shift-JIS)
		text_regions = self._find_text_regions()
		regions.extend(text_regions)

		return regions

	def _find_graphics_regions(self) -> List[Dict[str, Any]]:
		"""Find graphics data regions"""
		graphics_regions = []

		# Look for 4bpp tile patterns (common in SNES)
		for offset in range(0x100000, min(len(self.rom_data), 0x400000), 0x1000):
			chunk = self.rom_data[offset : offset + 0x1000]

			# Check for tile-like patterns
			if self._appears_to_be_graphics(chunk):
				graphics_regions.append(
					{
						"type": "graphics",
						"offset": offset,
						"size": 0x1000,
						"confidence": 0.8,
						"format": "4bpp_tiles",
					}
				)

		return graphics_regions

	def _appears_to_be_graphics(self, data: bytes) -> bool:
		"""Heuristic to detect graphics data"""
		if len(data) < 32:
			return False

		# Check for patterns common in 4bpp graphics
		zero_count = data.count(0)

		# Graphics often have many zero bytes (transparency)
		if zero_count > len(data) * 0.3:
			# Check for non-random distribution
			byte_variety = len(set(data))
			if byte_variety < 128:	# Not too random
				return True

		return False

	def _find_audio_regions(self) -> List[Dict[str, Any]]:
		"""Find audio data regions (BRR samples)"""
		audio_regions = []

		# BRR samples have specific header patterns
		for offset in range(0, len(self.rom_data) - 9, 0x100):
			chunk = self.rom_data[offset : offset + 9]

			# Check for BRR header pattern
			if self._appears_to_be_brr(chunk):
				# Estimate BRR sample size
				sample_size = self._estimate_brr_size(offset)
				audio_regions.append(
					{
						"type": "audio",
						"offset": offset,
						"size": sample_size,
						"confidence": 0.7,
						"format": "brr",
					}
				)

		return audio_regions

	def _appears_to_be_brr(self, data: bytes) -> bool:
		"""Check if data appears to be BRR audio"""
		if len(data) < 9:
			return False

		# BRR blocks are 9 bytes: 1 byte header + 8 bytes data
		header = data[0]

		# Valid BRR header patterns
		filter_val = (header >> 2) & 0x03
		shift_val = header >> 4

		return filter_val <= 3 and shift_val <= 12

	def _estimate_brr_size(self, offset: int) -> int:
		"""Estimate size of BRR sample"""
		size = 0
		pos = offset

		while pos + 9 <= len(self.rom_data):
			header = self.rom_data[pos]

			# Check end flag
			if header & 0x01:	# End flag set
				return size + 9

			size += 9
			pos += 9

			# Safety limit
			if size > 0x10000:	# 64KB max
				break

		return size

	def _find_text_regions(self) -> List[Dict[str, Any]]:
		"""Find text/dialog regions"""
		text_regions = []

		# Look for Shift-JIS or ASCII text
		for offset in range(0, len(self.rom_data) - 0x100, 0x100):
			chunk = self.rom_data[offset : offset + 0x100]

			if self._appears_to_be_text(chunk):
				text_size = self._estimate_text_size(offset)
				text_regions.append(
					{
						"type": "text",
						"offset": offset,
						"size": text_size,
						"confidence": 0.6,
						"encoding": "shift-jis",
					}
				)

		return text_regions

	def _appears_to_be_text(self, data: bytes) -> bool:
		"""Check if data appears to be text"""
		try:
			# Try to decode as Shift-JIS
			text = data.decode("shift-jis", errors="ignore")

			# Check for printable characters
			printable_count = sum(1 for c in text if c.isprintable())

			return printable_count > len(text) * 0.7

		except:
			return False

	def _estimate_text_size(self, offset: int) -> int:
		"""Estimate size of text block"""
		size = 0
		pos = offset

		while pos < len(self.rom_data):
			byte = self.rom_data[pos]

			# Common text terminators
			if byte in [0x00, 0xff]:
				return size

			# Check if still looks like text
			if byte < 0x20 and byte not in [0x0a, 0x0d]:	# Not printable/newline
				break

			size += 1
			pos += 1

			# Safety limit
			if size > 0x1000:
				break

		return size

	def extract_dq3_assets(self) -> List[AssetInfo]:
		"""Extract known DQ3 assets using layout information"""
		assets = []

		# Extract character class data
		char_classes = self._extract_character_classes()
		assets.extend(char_classes)

		# Extract monster data
		monsters = self._extract_monster_data()
		assets.extend(monsters)

		# Extract dialog/font data
		dialog_assets = self._extract_dialog_assets()
		assets.extend(dialog_assets)

		# Extract graphics assets
		graphics_assets = self._extract_graphics_assets()
		assets.extend(graphics_assets)

		return assets

	def _extract_character_classes(self) -> List[AssetInfo]:
		"""Extract character class data"""
		layout = self.dq3_layout["character_classes"]
		offset = layout["offset"]

		if offset >= len(self.rom_data):
			return []

		class_data = self.rom_data[offset : offset + layout["size"]]

		asset = AssetInfo(
			name="character_classes",
			offset=offset,
			size=len(class_data),
			asset_type="character_data",
			metadata={"class_count": 9, "class_size": 90, "format": "dq3_class_stats"},
		)

		return [asset]

	def _extract_monster_data(self) -> List[AssetInfo]:
		"""Extract monster stat data"""
		layout = self.dq3_layout["monster_data"]
		offset = layout["offset"]

		if offset >= len(self.rom_data):
			return []

		# Look for monster data patterns
		monsters = []
		current_offset = offset

		for i in range(layout["count"]):
			# Estimate monster data size (look for $ac terminator)
			monster_size = self._find_monster_data_size(current_offset)

			if monster_size > 0:
				monster_data = self.rom_data[current_offset : current_offset + monster_size]

				asset = AssetInfo(
					name=f"monster_{i:03d}",
					offset=current_offset,
					size=monster_size,
					asset_type="monster_data",
					metadata={"monster_index": i, "terminator": 0xac},
				)
				monsters.append(asset)
				current_offset += monster_size
			else:
				break

		return monsters

	def _find_monster_data_size(self, offset: int) -> int:
		"""Find size of monster data (look for $ac terminator)"""
		size = 0
		pos = offset

		while pos < len(self.rom_data) and size < 0x100:	# Max 256 bytes per monster
			if self.rom_data[pos] == 0xac:
				return size + 1	# Include terminator
			size += 1
			pos += 1

		return 0	# Not found

	def _extract_dialog_assets(self) -> List[DialogAsset]:
		"""Extract dialog and text assets"""
		dialog_assets = []

		# Look for dialog patterns in known text regions
		text_regions = self._find_text_regions()

		for i, region in enumerate(text_regions):
			offset = region["offset"]
			size = region["size"]

			text_data = self.rom_data[offset : offset + size]

			# Try to decompress if needed
			compressed_text = None
			for algorithm in ["huffman_dialog"]:
				try:
					decompressed = self.compression_engine.decompress(text_data, algorithm)
					if len(decompressed) > 0:
						compressed_text = algorithm
						text_data = decompressed
						break
				except:
					continue

			asset = DialogAsset(
				name=f"dialog_block_{i:03d}",
				offset=offset,
				size=size,
				asset_type="dialog",
				compression=compressed_text,
				encoding="shift-jis",
				metadata={"block_index": i, "estimated_size": len(text_data)},
			)

			dialog_assets.append(asset)

		return dialog_assets

	def _extract_graphics_assets(self) -> List[GraphicsAsset]:
		"""Extract graphics assets"""
		graphics_assets = []

		graphics_regions = self._find_graphics_regions()

		for i, region in enumerate(graphics_regions):
			offset = region["offset"]
			size = region["size"]

			graphics_data = self.rom_data[offset : offset + size]

			# Try decompression
			compressed_graphics = None
			for algorithm in ["basic_ring400", "simple_tail_window"]:
				try:
					decompressed = self.compression_engine.decompress(graphics_data, algorithm)
					if len(decompressed) > len(graphics_data):
						compressed_graphics = algorithm
						graphics_data = decompressed
						break
				except:
					continue

			asset = GraphicsAsset(
				name=f"graphics_tiles_{i:03d}",
				offset=offset,
				size=size,
				asset_type="graphics",
				compression=compressed_graphics,
				bpp=4,	# Most SNES graphics are 4bpp
				tile_format="4bpp",
				metadata={
					"tile_count": len(graphics_data) // 32,	# 32 bytes per 4bpp tile
					"estimated_dimensions": self._estimate_graphics_dimensions(graphics_data),
				},
			)

			graphics_assets.append(asset)

		return graphics_assets

	def _estimate_graphics_dimensions(self, graphics_data: bytes) -> Dict[str, int]:
		"""Estimate graphics dimensions from data size"""
		data_size = len(graphics_data)

		# Common SNES graphics sizes
		common_sizes = [
			(8, 8, 32),	# 8x8 4bpp tile
			(16, 16, 128),	# 16x16 4bpp tile
			(32, 32, 512),	# 32x32 4bpp tile
		]

		for width, height, expected_size in common_sizes:
			tile_count = data_size // expected_size
			if tile_count > 0:
				return {
					"tile_width": width,
					"tile_height": height,
					"tile_count": tile_count,
				}

		return {"estimated": True, "size": data_size}

	def export_assets(self, output_dir: Path, assets: List[AssetInfo]) -> Dict[str, Any]:
		"""Export extracted assets to files"""
		output_dir.mkdir(exist_ok=True)
		export_results = {"exported_count": 0, "failed_count": 0, "exports": []}

		for asset in assets:
			try:
				# Create asset-type subdirectory
				asset_dir = output_dir / asset.asset_type
				asset_dir.mkdir(exist_ok=True)

				# Extract raw data
				raw_data = self.rom_data[asset.offset : asset.offset + asset.size]

				# Export raw data
				raw_file = asset_dir / f"{asset.name}.bin"
				with open(raw_file, "wb") as f:
					f.write(raw_data)

				# Export metadata
				metadata_file = asset_dir / f"{asset.name}.json"
				metadata = {
					"name": asset.name,
					"offset": f"0x{asset.offset:08X}",
					"size": asset.size,
					"asset_type": asset.asset_type,
					"compression": asset.compression,
					"metadata": asset.metadata,
				}

				with open(metadata_file, "w") as f:
					json.dump(metadata, f, indent=2)

				export_results["exports"].append(
					{
						"asset": asset.name,
						"raw_file": str(raw_file),
						"metadata_file": str(metadata_file),
					}
				)
				export_results["exported_count"] += 1

			except Exception as e:
				export_results["failed_count"] += 1
				print(f"Failed to export {asset.name}: {e}")

		return export_results


def create_asset_pipeline(rom_path: str) -> SNESROMAnalyzer:
	"""Create and configure asset extraction pipeline"""
	rom_file = Path(rom_path)

	if not rom_file.exists():
		raise FileNotFoundError(f"ROM file not found: {rom_path}")

	return SNESROMAnalyzer(rom_file)


if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Extract assets from Dragon Quest III ROM")
	parser.add_argument("rom_path", help="Path to DQ3 ROM file")
	parser.add_argument("--output", "-o", default="./extracted_assets", help="Output directory")
	parser.add_argument("--analyze-only", action="store_true", help="Only analyze, don't extract")

	args = parser.parse_args()

	# Create pipeline
	pipeline = create_asset_pipeline(args.rom_path)

	print(f"Analyzing ROM: {args.rom_path}")

	# Analyze ROM structure
	analysis = pipeline.analyze_rom_structure()
	print(f"ROM Size: {analysis['rom_size']:,} bytes")
	print(f"ROM Type: {analysis['rom_type']}")
	print(f"Compressed regions found: {len(analysis['compression_detected'])}")

	if not args.analyze_only:
		# Extract assets
		print("\nExtracting DQ3 assets...")
		assets = pipeline.extract_dq3_assets()
		print(f"Found {len(assets)} assets")

		# Export assets
		output_dir = Path(args.output)
		export_results = pipeline.export_assets(output_dir, assets)
		print(f"Exported {export_results['exported_count']} assets")
		print(f"Failed to export {export_results['failed_count']} assets")
		print(f"Assets exported to: {output_dir.absolute()}")
