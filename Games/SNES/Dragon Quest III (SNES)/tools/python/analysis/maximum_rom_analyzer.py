#!/usr/bin/env python3
"""
Dragon Quest III - Maximum ROM Analysis Engine
==============================================

Ultra-deep analysis system that processes the entire ROM,
identifying all code regions, data structures, text, graphics,
and sound data with comprehensive documentation generation.
"""

import struct
import os
import json
import re
import hashlib
import time
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set, Union
from dataclasses import dataclass, field
from collections import defaultdict, Counter
import threading
from concurrent.futures import ThreadPoolExecutor
import csv

@dataclass
class ROMRegion:
	"""Represents a classified region of ROM data"""
	start_offset: int
	end_offset: int
	region_type: str	# "code", "graphics", "text", "audio", "data_table", "unknown"
	confidence: float	# 0.0 to 1.0
	description: str
	patterns_found: List[str]
	cross_refs: List[int]
	hash_id: str
	metadata: Dict[str, Any] = field(default_factory=dict)

@dataclass
class TextString:
	"""Represents extracted text string"""
	offset: int
	text: str
	encoding: str
	length: int
	references: List[int]
	context: str

@dataclass
class DataTable:
	"""Represents structured data table"""
	offset: int
	entry_count: int
	entry_size: int
	total_size: int
	table_type: str
	description: str
	entries: List[Dict[str, Any]]

class MaximumROMAnalyzer:
	"""
	Ultimate ROM analysis engine - processes every byte
	"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)

		# Classification results
		self.regions = []
		self.text_strings = []
		self.data_tables = []
		self.graphics_data = []
		self.audio_data = []

		# Analysis state
		self.analyzed_bytes = set()
		self.byte_classifications = [None] * self.rom_size
		self.entropy_cache = {}

		# Pattern definitions
		self.text_patterns = self._init_text_patterns()
		self.data_patterns = self._init_data_patterns()
		self.graphics_patterns = self._init_graphics_patterns()

		print(f"INIT: Maximum ROM Analyzer")
		print(f"ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")

	def _load_rom(self) -> bytes:
		"""Load and validate ROM file"""
		with open(self.rom_path, 'rb') as f:
			data = f.read()

		# Extract ROM info from header
		header_candidates = [0x7fc0, 0xffc0, 0x81c0]
		for header_offset in header_candidates:
			if header_offset + 32 < len(data):
				title = data[header_offset:header_offset+21]
				if any(keyword in title for keyword in [b'DRAGON', b'QUEST', b'DORAGON']):
					print(f"ROM Title: {title.decode('ascii', errors='ignore').strip()}")
					rom_type = data[header_offset + 21]
					rom_size = data[header_offset + 23]
					print(f"ROM Type: ${rom_type:02X}, Size: ${rom_size:02X}")
					break

		return data

	def _init_text_patterns(self) -> List[Dict[str, Any]]:
		"""Initialize text detection patterns"""
		return [
			{
				'name': 'ascii_text',
				'pattern': rb'[\x20-\x7e]{4,}',
				'min_length': 4,
				'encoding': 'ascii'
			},
			{
				'name': 'dq3_dialogue',
				'pattern': rb'[\x81-\x84][\x40-\x7e\x80-\xfc]{2,}',
				'min_length': 3,
				'encoding': 'dq3_jp'
			},
			{
				'name': 'item_names',
				'pattern': rb'[\x85-\x9f][\x40-\x7e]{2,15}\x00',
				'min_length': 3,
				'encoding': 'dq3_item'
			},
			{
				'name': 'menu_text',
				'pattern': rb'[\xa0-\xdf]{3,20}\xff',
				'min_length': 4,
				'encoding': 'dq3_menu'
			}
		]

	def _init_data_patterns(self) -> List[Dict[str, Any]]:
		"""Initialize data structure patterns"""
		return [
			{
				'name': 'pointer_table_16bit',
				'pattern': lambda data, offset: self._detect_pointer_table_16(data, offset),
				'min_entries': 3,
				'description': '16-bit pointer table'
			},
			{
				'name': 'pointer_table_24bit',
				'pattern': lambda data, offset: self._detect_pointer_table_24(data, offset),
				'min_entries': 3,
				'description': '24-bit pointer table'
			},
			{
				'name': 'stat_table',
				'pattern': lambda data, offset: self._detect_stat_table(data, offset),
				'min_entries': 5,
				'description': 'Character/monster stats'
			},
			{
				'name': 'lut_table',
				'pattern': lambda data, offset: self._detect_lut_table(data, offset),
				'min_entries': 8,
				'description': 'Lookup table'
			}
		]

	def _init_graphics_patterns(self) -> List[Dict[str, Any]]:
		"""Initialize graphics data patterns"""
		return [
			{
				'name': 'palette_data',
				'pattern': lambda data, offset: self._detect_palette(data, offset),
				'size_hint': 32,
				'description': 'Color palette (BGR555)'
			},
			{
				'name': 'tile_data_4bpp',
				'pattern': lambda data, offset: self._detect_4bpp_tiles(data, offset),
				'size_hint': 32,
				'description': '4bpp tile graphics'
			},
			{
				'name': 'tile_data_2bpp',
				'pattern': lambda data, offset: self._detect_2bpp_tiles(data, offset),
				'size_hint': 16,
				'description': '2bpp tile graphics'
			},
			{
				'name': 'tilemap_data',
				'pattern': lambda data, offset: self._detect_tilemap(data, offset),
				'size_hint': 64,
				'description': 'Tile arrangement data'
			}
		]

	def calculate_entropy(self, data: bytes, window_size: int = 256) -> float:
		"""Calculate Shannon entropy of data"""
		if len(data) == 0:
			return 0.0

		# Count byte frequencies
		freq_counts = Counter(data)
		total_bytes = len(data)

		# Calculate entropy
		entropy = 0.0
		for count in freq_counts.values():
			probability = count / total_bytes
			if probability > 0:
				import math
				entropy -= probability * math.log2(probability)

		return min(entropy, 8.0)	# Max entropy for 8-bit data

	def classify_region_by_entropy(self, offset: int, size: int) -> Tuple[str, float]:
		"""Classify region type based on entropy analysis"""
		if offset + size > self.rom_size:
			size = self.rom_size - offset

		data = self.rom_data[offset:offset+size]
		entropy = self.calculate_entropy(data)

		# Classification based on entropy
		if entropy < 1.0:
			return "repetitive_data", 0.8
		elif entropy < 2.5:
			return "structured_data", 0.7
		elif entropy < 4.0:
			return "text_or_code", 0.6
		elif entropy < 6.0:
			return "graphics_or_audio", 0.7
		else:
			return "compressed_or_random", 0.5

	def scan_for_text_strings(self) -> List[TextString]:
		"""Scan entire ROM for text strings"""
		print("Scanning for text strings...")
		found_strings = []

		for pattern_info in self.text_patterns:
			pattern = pattern_info['pattern']
			encoding = pattern_info['encoding']
			min_length = pattern_info['min_length']

			if isinstance(pattern, bytes):
				# Regex pattern search
				for match in re.finditer(pattern, self.rom_data):
					start, end = match.span()
					if end - start >= min_length:
						raw_text = self.rom_data[start:end]
						try:
							decoded = self._decode_text(raw_text, encoding)
							if decoded and len(decoded.strip()) >= 3:
								found_strings.append(TextString(
									offset=start,
									text=decoded,
									encoding=encoding,
									length=end-start,
									references=[],
									context=self._get_text_context(start)
								))
						except:
							pass

		# Sort by offset and deduplicate
		found_strings.sort(key=lambda x: x.offset)
		return found_strings

	def _decode_text(self, data: bytes, encoding: str) -> str:
		"""Decode text data using specified encoding"""
		if encoding == 'ascii':
			return data.decode('ascii', errors='ignore')
		elif encoding == 'dq3_jp':
			# Dragon Quest 3 Japanese text encoding
			return self._decode_dq3_japanese(data)
		elif encoding == 'dq3_item':
			return self._decode_dq3_items(data)
		elif encoding == 'dq3_menu':
			return self._decode_dq3_menu(data)
		else:
			return data.decode('latin1', errors='ignore')

	def _decode_dq3_japanese(self, data: bytes) -> str:
		"""Decode Dragon Quest 3 Japanese text"""
		# Simplified DQ3 text decoder
		result = ""
		for byte in data:
			if 0x20 <= byte <= 0x7e:
				result += chr(byte)
			elif 0x81 <= byte <= 0x84:
				result += "[CTRL]"
			elif byte == 0xff:
				result += "[END]"
			else:
				result += f"[${byte:02X}]"
		return result

	def _decode_dq3_items(self, data: bytes) -> str:
		"""Decode Dragon Quest 3 item names"""
		# Simplified item name decoder
		result = ""
		for byte in data:
			if byte == 0x00:
				break
			elif 0x20 <= byte <= 0x7e:
				result += chr(byte)
			else:
				result += f"[${byte:02X}]"
		return result

	def _decode_dq3_menu(self, data: bytes) -> str:
		"""Decode Dragon Quest 3 menu text"""
		result = ""
		for byte in data:
			if byte == 0xff:
				break
			elif 0x20 <= byte <= 0x7e:
				result += chr(byte)
			else:
				result += f"[${byte:02X}]"
		return result

	def _get_text_context(self, offset: int) -> str:
		"""Get context information for text location"""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return f"Bank ${bank:02X} at ${addr:04X}"

	def scan_for_data_tables(self) -> List[DataTable]:
		"""Scan for structured data tables"""
		print("Scanning for data tables...")
		found_tables = []

		for offset in range(0, self.rom_size - 64, 64):	# Check every 64 bytes
			for pattern_info in self.data_patterns:
				detector = pattern_info['pattern']
				result = detector(self.rom_data, offset)

				if result:
					table_data = result
					found_tables.append(DataTable(
						offset=offset,
						entry_count=table_data.get('count', 0),
						entry_size=table_data.get('entry_size', 0),
						total_size=table_data.get('total_size', 0),
						table_type=pattern_info['name'],
						description=pattern_info['description'],
						entries=table_data.get('entries', [])
					))

		return found_tables

	def _detect_pointer_table_16(self, data: bytes, offset: int) -> Optional[Dict[str, Any]]:
		"""Detect 16-bit pointer table"""
		if offset + 32 >= len(data):
			return None

		pointers = []
		for i in range(0, 32, 2):
			ptr = struct.unpack('<H', data[offset+i:offset+i+2])[0]
			if 0x8000 <= ptr <= 0xffff:
				pointers.append(ptr)
			else:
				break

		if len(pointers) >= 3:
			# Check if pointers are in ascending order (common pattern)
			sorted_pointers = sorted(pointers)
			if pointers == sorted_pointers:
				return {
					'count': len(pointers),
					'entry_size': 2,
					'total_size': len(pointers) * 2,
					'entries': [{'pointer': ptr, 'target': ptr} for ptr in pointers]
				}

		return None

	def _detect_pointer_table_24(self, data: bytes, offset: int) -> Optional[Dict[str, Any]]:
		"""Detect 24-bit pointer table"""
		if offset + 48 >= len(data):
			return None

		pointers = []
		for i in range(0, 48, 3):
			ptr = struct.unpack('<I', data[offset+i:offset+i+3] + b'\x00')[0]
			bank = (ptr >> 16) & 0xff
			addr = ptr & 0xffff
			if bank < 0x80 and 0x8000 <= addr <= 0xffff:
				pointers.append(ptr)
			else:
				break

		if len(pointers) >= 3:
			return {
				'count': len(pointers),
				'entry_size': 3,
				'total_size': len(pointers) * 3,
				'entries': [{'pointer': ptr, 'bank': ptr >> 16, 'addr': ptr & 0xffff} for ptr in pointers]
			}

		return None

	def _detect_stat_table(self, data: bytes, offset: int) -> Optional[Dict[str, Any]]:
		"""Detect character/monster stat table"""
		if offset + 80 >= len(data):
			return None

		# Look for stat-like data (reasonable ranges)
		entries = []
		for i in range(0, 80, 8):	# Assume 8-byte stat blocks
			stats = data[offset+i:offset+i+8]
			if all(0 <= stat <= 255 for stat in stats):
				# Check for reasonable stat patterns
				if max(stats) > 5 and min(stats) < max(stats):
					entries.append({
						'hp': struct.unpack('<H', stats[0:2])[0] if len(stats) >= 2 else stats[0],
						'mp': struct.unpack('<H', stats[2:4])[0] if len(stats) >= 4 else stats[1],
						'str': stats[4] if len(stats) > 4 else 0,
						'agi': stats[5] if len(stats) > 5 else 0,
						'int': stats[6] if len(stats) > 6 else 0,
						'def': stats[7] if len(stats) > 7 else 0
					})

		if len(entries) >= 5:
			return {
				'count': len(entries),
				'entry_size': 8,
				'total_size': len(entries) * 8,
				'entries': entries
			}

		return None

	def _detect_lut_table(self, data: bytes, offset: int) -> Optional[Dict[str, Any]]:
		"""Detect lookup table"""
		if offset + 64 >= len(data):
			return None

		# Look for sequences that could be lookup tables
		sequence = data[offset:offset+64]

		# Check for ascending sequences
		ascending_count = 0
		for i in range(1, len(sequence)):
			if sequence[i] >= sequence[i-1]:
				ascending_count += 1

		# Check for mathematical patterns
		if ascending_count > len(sequence) * 0.7:	# 70% ascending
			entries = [{'index': i, 'value': val} for i, val in enumerate(sequence)]
			return {
				'count': len(sequence),
				'entry_size': 1,
				'total_size': len(sequence),
				'entries': entries
			}

		return None

	def _detect_palette(self, data: bytes, offset: int) -> bool:
		"""Detect SNES BGR555 palette data"""
		if offset + 32 >= len(data):
			return False

		# Check 16 colors (32 bytes) for BGR555 format
		for i in range(0, 32, 2):
			color = struct.unpack('<H', data[offset+i:offset+i+2])[0]
			# BGR555 uses bits 0-14, bit 15 should be 0
			if color & 0x8000:
				return False

		return True

	def _detect_4bpp_tiles(self, data: bytes, offset: int) -> bool:
		"""Detect 4bpp tile graphics"""
		if offset + 32 >= len(data):
			return False

		# 4bpp tiles have specific bit patterns
		tile_data = data[offset:offset+32]

		# Check for non-zero data with reasonable distribution
		non_zero = sum(1 for b in tile_data if b != 0)
		return 8 <= non_zero <= 28	# Reasonable range for graphic data

	def _detect_2bpp_tiles(self, data: bytes, offset: int) -> bool:
		"""Detect 2bpp tile graphics"""
		if offset + 16 >= len(data):
			return False

		tile_data = data[offset:offset+16]
		non_zero = sum(1 for b in tile_data if b != 0)
		return 4 <= non_zero <= 14

	def _detect_tilemap(self, data: bytes, offset: int) -> bool:
		"""Detect tilemap/arrangement data"""
		if offset + 64 >= len(data):
			return False

		# Tilemaps often have tile indices in reasonable ranges
		tilemap_data = data[offset:offset+64]

		# Look for 16-bit tile indices
		for i in range(0, 64, 2):
			if i + 1 >= len(tilemap_data):
				break
			tile_index = struct.unpack('<H', tilemap_data[i:i+2])[0]
			# SNES tile indices are usually < 0x1000
			if tile_index > 0x1000:
				return False

		return True

	def perform_comprehensive_scan(self):
		"""Perform complete ROM analysis"""
		print("\nSTARTING: Maximum ROM Analysis")
		print("=" * 70)

		start_time = time.time()

		# Phase 1: Text extraction
		print("PHASE 1: Extracting text strings...")
		self.text_strings = self.scan_for_text_strings()
		print(f"Found {len(self.text_strings)} text strings")

		# Phase 2: Data table detection
		print("PHASE 2: Detecting data tables...")
		self.data_tables = self.scan_for_data_tables()
		print(f"Found {len(self.data_tables)} data tables")

		# Phase 3: Graphics scanning
		print("PHASE 3: Scanning graphics data...")
		self.graphics_data = self._scan_graphics_data()
		print(f"Found {len(self.graphics_data)} graphics regions")

		# Phase 4: Entropy-based classification
		print("PHASE 4: Entropy analysis...")
		self._classify_all_regions()
		print(f"Classified {len(self.regions)} regions")

		# Phase 5: Cross-reference building
		print("PHASE 5: Building cross-references...")
		self._build_comprehensive_cross_refs()

		# Phase 6: Generate reports
		print("PHASE 6: Generating comprehensive reports...")
		self._generate_maximum_documentation()

		total_time = time.time() - start_time
		print(f"\nMAXIMUM ANALYSIS COMPLETE!")
		print(f"Time: {total_time:.2f} seconds")
		print(f"Text strings: {len(self.text_strings)}")
		print(f"Data tables: {len(self.data_tables)}")
		print(f"Graphics regions: {len(self.graphics_data)}")
		print(f"Total regions: {len(self.regions)}")

		# Analysis summary
		region_types = Counter(r.region_type for r in self.regions)
		print(f"Region breakdown: {dict(region_types)}")

	def _scan_graphics_data(self) -> List[ROMRegion]:
		"""Scan for graphics data regions"""
		graphics_regions = []

		for offset in range(0, self.rom_size - 128, 128):
			region_data = self.rom_data[offset:offset+128]

			# Test for graphics patterns
			for pattern_info in self.graphics_patterns:
				detector = pattern_info['pattern']
				if detector(self.rom_data, offset):
					size = pattern_info['size_hint']
					graphics_regions.append(ROMRegion(
						start_offset=offset,
						end_offset=offset + size,
						region_type="graphics",
						confidence=0.7,
						description=pattern_info['description'],
						patterns_found=[pattern_info['name']],
						cross_refs=[],
						hash_id=hashlib.md5(region_data).hexdigest()[:8]
					))
					break

		return graphics_regions

	def _classify_all_regions(self):
		"""Classify entire ROM using entropy and pattern analysis"""
		region_size = 1024	# Analyze in 1KB chunks

		for offset in range(0, self.rom_size, region_size):
			end_offset = min(offset + region_size, self.rom_size)

			# Skip already classified regions
			if any(r.start_offset <= offset < r.end_offset for r in self.regions):
				continue

			region_type, confidence = self.classify_region_by_entropy(offset, end_offset - offset)
			region_data = self.rom_data[offset:end_offset]

			self.regions.append(ROMRegion(
				start_offset=offset,
				end_offset=end_offset,
				region_type=region_type,
				confidence=confidence,
				description=f"Entropy-classified {region_type}",
				patterns_found=[],
				cross_refs=[],
				hash_id=hashlib.md5(region_data).hexdigest()[:8]
			))

	def _build_comprehensive_cross_refs(self):
		"""Build comprehensive cross-reference database"""
		# Find references between regions
		for region in self.regions:
			region_data = self.rom_data[region.start_offset:region.end_offset]

			# Look for 16-bit and 24-bit addresses pointing to other regions
			for i in range(0, len(region_data) - 2, 2):
				# 16-bit address
				addr = struct.unpack('<H', region_data[i:i+2])[0]
				if 0x8000 <= addr <= 0xffff:
					target_offset = addr - 0x8000
					if target_offset < self.rom_size:
						region.cross_refs.append(target_offset)

				# 24-bit address (if we have 3 bytes)
				if i + 2 < len(region_data):
					addr24 = struct.unpack('<I', region_data[i:i+3] + b'\x00')[0]
					bank = (addr24 >> 16) & 0xff
					addr = addr24 & 0xffff
					if bank < 0x80 and 0x8000 <= addr <= 0xffff:
						target_offset = bank * 0x8000 + (addr - 0x8000)
						if target_offset < self.rom_size:
							region.cross_refs.append(target_offset)

	def _generate_maximum_documentation(self):
		"""Generate comprehensive documentation suite"""
		docs_dir = Path("docs/maximum_analysis")
		docs_dir.mkdir(parents=True, exist_ok=True)

		# Text strings report
		with open(docs_dir / "text_strings.csv", 'w', newline='', encoding='utf-8') as f:
			writer = csv.writer(f)
			writer.writerow(['Offset', 'Length', 'Encoding', 'Context', 'Text'])
			for text in self.text_strings:
				writer.writerow([
					f"${text.offset:06X}",
					text.length,
					text.encoding,
					text.context,
					text.text[:100]	# Truncate long text
				])

		# Data tables report
		with open(docs_dir / "data_tables.json", 'w') as f:
			tables_data = []
			for table in self.data_tables:
				tables_data.append({
					'offset': f"${table.offset:06X}",
					'type': table.table_type,
					'entry_count': table.entry_count,
					'entry_size': table.entry_size,
					'description': table.description,
					'sample_entries': table.entries[:5] if len(table.entries) > 5 else table.entries
				})
			json.dump(tables_data, f, indent=2)

		# Region classification map
		with open(docs_dir / "region_map.csv", 'w', newline='') as f:
			writer = csv.writer(f)
			writer.writerow(['Start', 'End', 'Size', 'Type', 'Confidence', 'Description', 'Hash'])
			for region in sorted(self.regions, key=lambda x: x.start_offset):
				writer.writerow([
					f"${region.start_offset:06X}",
					f"${region.end_offset:06X}",
					region.end_offset - region.start_offset,
					region.region_type,
					f"{region.confidence:.2f}",
					region.description,
					region.hash_id
				])

		# Cross-reference matrix
		with open(docs_dir / "cross_references.csv", 'w', newline='') as f:
			writer = csv.writer(f)
			writer.writerow(['Source_Offset', 'Target_Offset', 'Source_Type', 'Target_Type'])
			for region in self.regions:
				for ref_offset in region.cross_refs[:10]:	# Limit refs per region
					target_region = self._find_region_containing(ref_offset)
					target_type = target_region.region_type if target_region else "unknown"
					writer.writerow([
						f"${region.start_offset:06X}",
						f"${ref_offset:06X}",
						region.region_type,
						target_type
					])

		# Summary statistics
		with open(docs_dir / "analysis_summary.md", 'w') as f:
			f.write("# Dragon Quest III - Maximum ROM Analysis Summary\n\n")
			f.write(f"**ROM Size**: {self.rom_size:,} bytes\n")
			f.write(f"**Regions Analyzed**: {len(self.regions)}\n")
			f.write(f"**Text Strings Found**: {len(self.text_strings)}\n")
			f.write(f"**Data Tables Found**: {len(self.data_tables)}\n")
			f.write(f"**Graphics Regions**: {len(self.graphics_data)}\n\n")

			# Region type breakdown
			region_stats = Counter(r.region_type for r in self.regions)
			f.write("## Region Type Distribution\n\n")
			for region_type, count in region_stats.most_common():
				total_size = sum(r.end_offset - r.start_offset for r in self.regions if r.region_type == region_type)
				percentage = (total_size / self.rom_size) * 100
				f.write(f"- **{region_type}**: {count} regions, {total_size:,} bytes ({percentage:.1f}%)\n")

			# Text encoding breakdown
			f.write("\n## Text Encoding Distribution\n\n")
			text_stats = Counter(t.encoding for t in self.text_strings)
			for encoding, count in text_stats.most_common():
				f.write(f"- **{encoding}**: {count} strings\n")

			# Data table breakdown
			f.write("\n## Data Table Types\n\n")
			table_stats = Counter(t.table_type for t in self.data_tables)
			for table_type, count in table_stats.most_common():
				f.write(f"- **{table_type}**: {count} tables\n")

		print(f"Maximum analysis documentation saved to {docs_dir}/")

	def _find_region_containing(self, offset: int) -> Optional[ROMRegion]:
		"""Find region containing the specified offset"""
		for region in self.regions:
			if region.start_offset <= offset < region.end_offset:
				return region
		return None

def main():
	"""Main analysis entry point"""
	print("STARTING: Dragon Quest III - Maximum ROM Analysis Engine")
	print("=" * 80)

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
			print(f"Using ROM: {rom_file}")
			break

	if not rom_path:
		print("ERROR: No ROM file found!")
		return

	# Run maximum analysis
	analyzer = MaximumROMAnalyzer(rom_path)
	analyzer.perform_comprehensive_scan()

if __name__ == "__main__":
	main()
