#!/usr/bin/env python3
"""
Dragon Quest III Asset Extraction Framework
Comprehensive asset extraction system for graphics, audio, text, and data
"""

import struct
import sys
import json
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple, Set
from dataclasses import dataclass, asdict, field
from enum import Enum
import hashlib


class AssetFormat(Enum):
	"""Supported asset formats for extraction"""

	# Graphics formats
	SNES_4BPP = "snes_4bpp"
	SNES_2BPP = "snes_2bpp"
	SNES_8BPP = "snes_8bpp"
	SPRITE_16X16 = "sprite_16x16"
	SPRITE_8X8 = "sprite_8x8"

	# Audio formats
	SPC_MUSIC = "spc_music"
	BRR_SAMPLE = "brr_sample"
	SEQUENCE_DATA = "sequence_data"

	# Text formats
	SHIFT_JIS = "shift_jis"
	ASCII = "ascii"
	COMPRESSED_TEXT = "compressed_text"

	# Data formats
	ITEM_TABLE = "item_table"
	MONSTER_TABLE = "monster_table"
	SPELL_TABLE = "spell_table"
	MAP_DATA = "map_data"


@dataclass
class ExtractedAsset:
	"""Represents an extracted game asset"""

	name: str
	asset_format: AssetFormat
	source_address: int
	source_bank: int
	raw_size: int
	processed_size: int
	data: bytes
	metadata: Dict[str, Any] = field(default_factory=dict)
	checksum: str = ""
	extraction_notes: str = ""

	def __post_init__(self):
		if not self.checksum:
			self.checksum = hashlib.sha256(self.data).hexdigest()[:16]

	def save_to_file(self, output_path: Path, format_override: Optional[str] = None):
		"""Save asset to file with appropriate format"""
		if format_override:
			filename = f"{self.name}.{format_override}"
		elif self.asset_format == AssetFormat.SNES_4BPP:
			filename = f"{self.name}.4bpp"
		elif self.asset_format == AssetFormat.BRR_SAMPLE:
			filename = f"{self.name}.brr"
		elif self.asset_format == AssetFormat.SHIFT_JIS:
			filename = f"{self.name}.txt"
		else:
			filename = f"{self.name}.bin"

		file_path = output_path / filename

		with open(file_path, "wb") as f:
			f.write(self.data)

		# Save metadata
		metadata_path = output_path / f"{self.name}.json"
		with open(metadata_path, "w") as f:
			json.dump(
				{
					"name": self.name,
					"format": self.asset_format.value,
					"source_address": f"${self.source_address:06X}",
					"source_bank": self.source_bank,
					"raw_size": self.raw_size,
					"processed_size": self.processed_size,
					"checksum": self.checksum,
					"metadata": self.metadata,
					"extraction_notes": self.extraction_notes,
				},
				f,
				indent="\t",
			)


class DQ3AssetExtractor:
	"""Comprehensive asset extraction for Dragon Quest III"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		# Remove header if present
		if len(self.rom_data) % 1024 == 512:
			print("📦 Removing 512-byte header")
			self.rom_data = self.rom_data[512:]

		self.rom_size = len(self.rom_data)

		# Asset tracking
		self.extracted_assets: List[ExtractedAsset] = []
		self.extraction_stats = {"graphics": 0, "audio": 0, "text": 0, "data": 0, "total_bytes": 0}

		# Initialize extraction patterns
		self._initialize_extraction_patterns()

	def _initialize_extraction_patterns(self):
		"""Initialize patterns for asset detection"""

		# Graphics patterns - SNES tile data signatures
		self.graphics_patterns = [
			# 4BPP tile patterns (common in SNES games)
			{
				"name": "character_tiles",
				"format": AssetFormat.SNES_4BPP,
				"start_pattern": b"\x00\x00\x00\x00\x00\x00\x00\x00",	# Empty tiles often start sets
				"size_estimate": 0x8000,	# 32KB blocks
				"alignment": 0x1000,
			},
			{
				"name": "sprite_data",
				"format": AssetFormat.SPRITE_16X16,
				"start_pattern": b"\xff\x00\xff\x00",	# Common sprite pattern
				"size_estimate": 0x4000,
				"alignment": 0x800,
			},
		]

		# Audio patterns - SPC and BRR data
		self.audio_patterns = [
			{
				"name": "brr_samples",
				"format": AssetFormat.BRR_SAMPLE,
				"start_pattern": b"\x00\x00\x00\x00\x00\x00\x00\x00\x03",	# BRR end marker
				"size_estimate": 0x1000,
				"alignment": 0x10,
			},
			{
				"name": "music_data",
				"format": AssetFormat.SPC_MUSIC,
				"start_pattern": b"\x8f\x6c\x02",	# Common SPC sequence start
				"size_estimate": 0x2000,
				"alignment": 0x100,
			},
		]

		# Text patterns - Dialog and menu text
		self.text_patterns = [
			{
				"name": "dialog_text",
				"format": AssetFormat.SHIFT_JIS,
				"start_pattern": b"\x82",	# Shift-JIS hiragana range start
				"size_estimate": 0x8000,
				"alignment": 0x100,
			},
			{
				"name": "menu_text",
				"format": AssetFormat.ASCII,
				"start_pattern": b"Item",	# Common menu strings
				"size_estimate": 0x1000,
				"alignment": 0x10,
			},
		]

		# Data patterns - Game tables and structures
		self.data_patterns = [
			{
				"name": "item_table",
				"format": AssetFormat.ITEM_TABLE,
				"start_pattern": b"\x01\x00",	# Item ID 1, common first item
				"size_estimate": 0x800,
				"alignment": 0x10,
			},
			{
				"name": "monster_table",
				"format": AssetFormat.MONSTER_TABLE,
				"start_pattern": b"\x01\x01",	# Monster ID pattern
				"size_estimate": 0x1000,
				"alignment": 0x20,
			},
		]

	def extract_all_assets(self, output_dir: str) -> Dict[str, Any]:
		"""Extract all detectable assets from the ROM"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"🎨 Starting comprehensive asset extraction...")
		print(f"	 ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")
		print(f"	 Output: {output_path}")

		# Create category directories
		categories = ["graphics", "audio", "text", "data"]
		for category in categories:
			(output_path / category).mkdir(exist_ok=True)

		# Extract by category
		results = {}

		print(f"\n🖼️ Extracting graphics assets...")
		results["graphics"] = self._extract_graphics_assets(output_path / "graphics")

		print(f"\n🎵 Extracting audio assets...")
		results["audio"] = self._extract_audio_assets(output_path / "audio")

		print(f"\n📝 Extracting text assets...")
		results["text"] = self._extract_text_assets(output_path / "text")

		print(f"\n📊 Extracting data tables...")
		results["data"] = self._extract_data_assets(output_path / "data")

		# Generate extraction report
		self._generate_extraction_report(output_path, results)

		print(f"\n✅ Asset extraction complete!")
		print(f"	 Graphics: {self.extraction_stats['graphics']} assets")
		print(f"	 Audio: {self.extraction_stats['audio']} assets")
		print(f"	 Text: {self.extraction_stats['text']} assets")
		print(f"	 Data: {self.extraction_stats['data']} assets")
		print(f"	 Total: {len(self.extracted_assets)} assets ({self.extraction_stats['total_bytes']:,} bytes)")

		return results

	def _extract_graphics_assets(self, output_path: Path) -> List[ExtractedAsset]:
		"""Extract graphics assets"""
		graphics_assets = []

		# Known graphics locations for Dragon Quest III
		graphics_locations = [
			{"name": "character_sprites", "start": 0x200000, "size": 0x10000, "format": AssetFormat.SNES_4BPP},
			{"name": "monster_graphics", "start": 0x220000, "size": 0x20000, "format": AssetFormat.SNES_4BPP},
			{"name": "world_tiles", "start": 0x180000, "size": 0x8000, "format": AssetFormat.SNES_2BPP},
			{"name": "ui_graphics", "start": 0x1a0000, "size": 0x4000, "format": AssetFormat.SNES_2BPP},
			{"name": "font_data", "start": 0x1b0000, "size": 0x2000, "format": AssetFormat.SNES_2BPP},
		]

		for location in graphics_locations:
			if location["start"] < self.rom_size:
				actual_size = min(location["size"], self.rom_size - location["start"])
				data = self.rom_data[location["start"] : location["start"] + actual_size]

				if data and not self._is_empty_data(data):
					asset = ExtractedAsset(
						name=location["name"],
						asset_format=location["format"],
						source_address=location["start"],
						source_bank=location["start"] // 0x10000,
						raw_size=actual_size,
						processed_size=actual_size,
						data=data,
						metadata={
							"tile_count": (
								actual_size // 32 if location["format"] == AssetFormat.SNES_4BPP else actual_size // 16
							),
							"estimated_tiles": f"{actual_size // 32 if location['format'] == AssetFormat.SNES_4BPP else actual_size // 16} tiles",
						},
						extraction_notes=f"Extracted from known location at ${location['start']:06X}",
					)

					asset.save_to_file(output_path)
					graphics_assets.append(asset)
					self.extracted_assets.append(asset)
					self.extraction_stats["graphics"] += 1
					self.extraction_stats["total_bytes"] += actual_size

		# Pattern-based extraction for unknown graphics
		pattern_assets = self._extract_by_patterns(self.graphics_patterns, output_path, "graphics")
		graphics_assets.extend(pattern_assets)

		return graphics_assets

	def _extract_audio_assets(self, output_path: Path) -> List[ExtractedAsset]:
		"""Extract audio assets"""
		audio_assets = []

		# Known audio locations
		audio_locations = [
			{"name": "music_bank_1", "start": 0x300000, "size": 0x8000, "format": AssetFormat.SPC_MUSIC},
			{"name": "music_bank_2", "start": 0x308000, "size": 0x8000, "format": AssetFormat.SPC_MUSIC},
			{"name": "sound_effects", "start": 0x310000, "size": 0x4000, "format": AssetFormat.BRR_SAMPLE},
			{"name": "instrument_samples", "start": 0x320000, "size": 0x8000, "format": AssetFormat.BRR_SAMPLE},
		]

		for location in audio_locations:
			if location["start"] < self.rom_size:
				actual_size = min(location["size"], self.rom_size - location["start"])
				data = self.rom_data[location["start"] : location["start"] + actual_size]

				if data and not self._is_empty_data(data):
					asset = ExtractedAsset(
						name=location["name"],
						asset_format=location["format"],
						source_address=location["start"],
						source_bank=location["start"] // 0x10000,
						raw_size=actual_size,
						processed_size=actual_size,
						data=data,
						metadata=self._analyze_audio_data(data, location["format"]),
						extraction_notes=f"Extracted from known audio location",
					)

					asset.save_to_file(output_path)
					audio_assets.append(asset)
					self.extracted_assets.append(asset)
					self.extraction_stats["audio"] += 1
					self.extraction_stats["total_bytes"] += actual_size

		return audio_assets

	def _extract_text_assets(self, output_path: Path) -> List[ExtractedAsset]:
		"""Extract text assets"""
		text_assets = []

		# Known text locations
		text_locations = [
			{"name": "main_dialog", "start": 0x400000, "size": 0x20000, "format": AssetFormat.SHIFT_JIS},
			{"name": "npc_dialog", "start": 0x420000, "size": 0x15000, "format": AssetFormat.SHIFT_JIS},
			{"name": "item_names", "start": 0x440000, "size": 0x4000, "format": AssetFormat.SHIFT_JIS},
			{"name": "menu_text", "start": 0x444000, "size": 0x2000, "format": AssetFormat.SHIFT_JIS},
			{"name": "system_messages", "start": 0x446000, "size": 0x2000, "format": AssetFormat.SHIFT_JIS},
		]

		for location in text_locations:
			if location["start"] < self.rom_size:
				actual_size = min(location["size"], self.rom_size - location["start"])
				data = self.rom_data[location["start"] : location["start"] + actual_size]

				if data and not self._is_empty_data(data):
					# Process text data
					processed_data, text_info = self._process_text_data(data, location["format"])

					asset = ExtractedAsset(
						name=location["name"],
						asset_format=location["format"],
						source_address=location["start"],
						source_bank=location["start"] // 0x10000,
						raw_size=actual_size,
						processed_size=len(processed_data),
						data=processed_data,
						metadata=text_info,
						extraction_notes=f"Processed text data with {text_info['encoding']}",
					)

					# Save as both raw and processed
					asset.save_to_file(output_path, "bin")	# Raw data

					# Save processed text
					text_file = output_path / f"{location['name']}.txt"
					with open(text_file, "w", encoding="utf-8") as f:
						f.write(text_info.get("decoded_text", "[Binary data]"))

					text_assets.append(asset)
					self.extracted_assets.append(asset)
					self.extraction_stats["text"] += 1
					self.extraction_stats["total_bytes"] += actual_size

		return text_assets

	def _extract_data_assets(self, output_path: Path) -> List[ExtractedAsset]:
		"""Extract game data tables"""
		data_assets = []

		# Known data table locations
		data_locations = [
			{"name": "item_data", "start": 0x500000, "size": 0x2000, "format": AssetFormat.ITEM_TABLE},
			{"name": "weapon_data", "start": 0x502000, "size": 0x800, "format": AssetFormat.ITEM_TABLE},
			{"name": "armor_data", "start": 0x502800, "size": 0x800, "format": AssetFormat.ITEM_TABLE},
			{"name": "monster_stats", "start": 0x510000, "size": 0x3000, "format": AssetFormat.MONSTER_TABLE},
			{"name": "monster_ai", "start": 0x513000, "size": 0x2000, "format": AssetFormat.MONSTER_TABLE},
			{"name": "spell_data", "start": 0x520000, "size": 0x1000, "format": AssetFormat.SPELL_TABLE},
			{"name": "class_data", "start": 0x521000, "size": 0x800, "format": AssetFormat.ITEM_TABLE},
			{"name": "exp_tables", "start": 0x522000, "size": 0x1000, "format": AssetFormat.ITEM_TABLE},
		]

		for location in data_locations:
			if location["start"] < self.rom_size:
				actual_size = min(location["size"], self.rom_size - location["start"])
				data = self.rom_data[location["start"] : location["start"] + actual_size]

				if data and not self._is_empty_data(data):
					# Analyze data structure
					analysis = self._analyze_data_table(data, location["format"])

					asset = ExtractedAsset(
						name=location["name"],
						asset_format=location["format"],
						source_address=location["start"],
						source_bank=location["start"] // 0x10000,
						raw_size=actual_size,
						processed_size=actual_size,
						data=data,
						metadata=analysis,
						extraction_notes=f"Data table with {analysis.get('estimated_entries', 'unknown')} entries",
					)

					asset.save_to_file(output_path)

					# Generate human-readable analysis
					analysis_file = output_path / f"{location['name']}_analysis.txt"
					with open(analysis_file, "w") as f:
						f.write(f"Data Analysis: {location['name']}\n")
						f.write("=" * 40 + "\n\n")
						for key, value in analysis.items():
							f.write(f"{key}: {value}\n")

					data_assets.append(asset)
					self.extracted_assets.append(asset)
					self.extraction_stats["data"] += 1
					self.extraction_stats["total_bytes"] += actual_size

		return data_assets

	def _extract_by_patterns(self, patterns: List[Dict], output_path: Path, category: str) -> List[ExtractedAsset]:
		"""Extract assets using pattern matching"""
		pattern_assets = []

		for pattern in patterns:
			matches = self._find_pattern_matches(pattern)

			for i, match in enumerate(matches[:5]):	# Limit to 5 matches per pattern
				start, estimated_size = match

				if start + estimated_size > self.rom_size:
					estimated_size = self.rom_size - start

				data = self.rom_data[start : start + estimated_size]

				if not self._is_empty_data(data):
					asset = ExtractedAsset(
						name=f"{pattern['name']}_{i+1:02d}",
						asset_format=pattern["format"],
						source_address=start,
						source_bank=start // 0x10000,
						raw_size=estimated_size,
						processed_size=estimated_size,
						data=data,
						metadata={"detection_method": "pattern_matching"},
						extraction_notes=f"Found via pattern matching at ${start:06X}",
					)

					asset.save_to_file(output_path)
					pattern_assets.append(asset)
					self.extracted_assets.append(asset)
					self.extraction_stats[category] += 1
					self.extraction_stats["total_bytes"] += estimated_size

		return pattern_assets

	def _find_pattern_matches(self, pattern: Dict) -> List[Tuple[int, int]]:
		"""Find all matches for a given pattern"""
		matches = []
		start_pattern = pattern["start_pattern"]
		size_estimate = pattern["size_estimate"]
		alignment = pattern.get("alignment", 1)

		for i in range(0, self.rom_size - len(start_pattern), alignment):
			if self.rom_data[i : i + len(start_pattern)] == start_pattern:
				matches.append((i, size_estimate))

		return matches[:10]	# Limit matches

	def _analyze_audio_data(self, data: bytes, format_type: AssetFormat) -> Dict[str, Any]:
		"""Analyze audio data for metadata"""
		analysis = {}

		if format_type == AssetFormat.BRR_SAMPLE:
			# Analyze BRR sample structure
			analysis["type"] = "BRR Sample"
			analysis["estimated_length"] = f"{len(data) // 9} blocks"
			analysis["sample_rate"] = "Unknown (BRR format)"

		elif format_type == AssetFormat.SPC_MUSIC:
			analysis["type"] = "SPC Music Data"
			analysis["estimated_tracks"] = self._count_music_tracks(data)
			analysis["format_notes"] = "SNES SPC sequence data"

		return analysis

	def _count_music_tracks(self, data: bytes) -> int:
		"""Estimate number of music tracks in SPC data"""
		# Look for common SPC command patterns
		track_indicators = [b"\x8f", b"\x9f", b"\xaf"]	# Common SPC commands
		tracks = 0

		for indicator in track_indicators:
			tracks += data.count(indicator)

		return max(1, tracks // 10)	# Rough estimate

	def _process_text_data(self, data: bytes, format_type: AssetFormat) -> Tuple[bytes, Dict[str, Any]]:
		"""Process and analyze text data"""
		analysis = {
			"encoding": format_type.value,
			"size_bytes": len(data),
			"estimated_strings": 0,
			"decoded_text": "[Unable to decode]",
		}

		try:
			if format_type == AssetFormat.SHIFT_JIS:
				# Attempt Shift-JIS decoding
				decoded = data.decode("shift-jis", errors="replace")
				analysis["decoded_text"] = decoded[:1000]	# First 1000 chars
				analysis["estimated_strings"] = decoded.count("\x00")	# Null-terminated strings

			elif format_type == AssetFormat.ASCII:
				decoded = data.decode("ascii", errors="replace")
				analysis["decoded_text"] = decoded[:1000]
				analysis["estimated_strings"] = decoded.count("\x00")

		except Exception:
			analysis["decoded_text"] = "[Decoding failed]"

		return data, analysis

	def _analyze_data_table(self, data: bytes, format_type: AssetFormat) -> Dict[str, Any]:
		"""Analyze data table structure"""
		analysis = {}

		if format_type == AssetFormat.ITEM_TABLE:
			analysis["type"] = "Item Data Table"
			analysis["entry_size_estimate"] = 16	# Common item entry size
			analysis["estimated_entries"] = len(data) // 16
			analysis["table_format"] = "Fixed-size records"

		elif format_type == AssetFormat.MONSTER_TABLE:
			analysis["type"] = "Monster Data Table"
			analysis["entry_size_estimate"] = 32	# Common monster entry size
			analysis["estimated_entries"] = len(data) // 32
			analysis["table_format"] = "Fixed-size records"

		elif format_type == AssetFormat.SPELL_TABLE:
			analysis["type"] = "Spell Data Table"
			analysis["entry_size_estimate"] = 12	# Common spell entry size
			analysis["estimated_entries"] = len(data) // 12
			analysis["table_format"] = "Fixed-size records"

		# Add hex preview
		analysis["hex_preview"] = " ".join(f"{b:02X}" for b in data[:32])

		return analysis

	def _is_empty_data(self, data: bytes, threshold: float = 0.9) -> bool:
		"""Check if data is mostly empty (same byte repeated)"""
		if not data:
			return True

		# Check for excessive repetition
		most_common = max(set(data), key=data.count)
		repetition_ratio = data.count(most_common) / len(data)

		return repetition_ratio > threshold

	def _generate_extraction_report(self, output_path: Path, results: Dict[str, Any]):
		"""Generate comprehensive extraction report"""
		report_lines = []

		report_lines.extend(
			[
				"# 🎨 Dragon Quest III - Asset Extraction Report",
				"",
				f"**ROM:** {self.rom_path.name}",
				f"**ROM Size:** {self.rom_size:,} bytes",
				f"**Total Assets Extracted:** {len(self.extracted_assets)}",
				f"**Total Data Extracted:** {self.extraction_stats['total_bytes']:,} bytes",
				f"**Extraction Coverage:** {(self.extraction_stats['total_bytes'] / self.rom_size) * 100:.1f}%",
				"",
				"---",
				"",
			]
		)

		# Category summaries
		for category in ["graphics", "audio", "text", "data"]:
			count = self.extraction_stats[category]
			category_assets = [a for a in self.extracted_assets if category in a.name.lower()]

			report_lines.extend([f"## {category.title()} Assets ({count} items)", ""])

			if category_assets:
				report_lines.extend(
					[
						"| Asset Name | Size | Format | Source Address |",
						"|------------|------|--------|----------------|",
					]
				)

				for asset in category_assets:
					report_lines.append(
						f"| `{asset.name}` | {asset.raw_size:,} bytes | "
						f"{asset.asset_format.value} | `${asset.source_address:06X}` |"
					)
			else:
				report_lines.append("*No assets extracted for this category*")

			report_lines.extend(["", ""])

		# Asset index
		report_lines.extend(
			[
				"## Complete Asset Index",
				"",
				"| # | Name | Category | Size | Format | Checksum |",
				"|---|------|----------|------|--------|----------|",
			]
		)

		for i, asset in enumerate(self.extracted_assets, 1):
			category = (
				"graphics"
				if "sprite" in asset.name or "tile" in asset.name
				else (
					"audio"
					if "music" in asset.name or "sound" in asset.name
					else "text" if "dialog" in asset.name or "menu" in asset.name else "data"
				)
			)

			report_lines.append(
				f"| {i} | `{asset.name}` | {category} | {asset.raw_size:,} | "
				f"{asset.asset_format.value} | `{asset.checksum}` |"
			)

		# Write report
		with open(output_path / "extraction_report.md", "w", encoding="utf-8") as f:
			f.write("\n".join(report_lines))

		# Write JSON summary
		def asset_to_dict(asset: ExtractedAsset) -> Dict[str, Any]:
			asset_dict = asdict(asset)
			asset_dict["asset_format"] = asset.asset_format.value	# Convert enum to string
			# Remove binary data from JSON output - it's saved as separate files
			if "data" in asset_dict:
				del asset_dict["data"]
			return asset_dict

		summary_data = {
			"extraction_stats": self.extraction_stats,
			"total_assets": len(self.extracted_assets),
			"assets": [asset_to_dict(asset) for asset in self.extracted_assets],
		}

		with open(output_path / "extraction_summary.json", "w") as f:
			json.dump(summary_data, f, indent="\t")


def main():
	"""Main entry point for asset extraction"""
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III Asset Extraction Framework")
	parser.add_argument("rom_file", help="Path to ROM file")
	parser.add_argument("--output", "-o", default="assets", help="Output directory")
	parser.add_argument(
		"--category",
		choices=["graphics", "audio", "text", "data", "all"],
		default="all",
		help="Asset category to extract",
	)

	args = parser.parse_args()

	print("🎨 Dragon Quest III - Asset Extraction Framework")
	print("=" * 60)

	# Create extractor
	extractor = DQ3AssetExtractor(args.rom_file)

	# Extract assets
	if args.category == "all":
		results = extractor.extract_all_assets(args.output)
	else:
		# TODO: Implement category-specific extraction
		results = extractor.extract_all_assets(args.output)

	print(f"\n🎯 Asset extraction complete!")
	print(f"	 Check {args.output}/ for extracted assets")
	print(f"	 See extraction_report.md for detailed analysis")


if __name__ == "__main__":
	main()
