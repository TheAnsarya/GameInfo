#!/usr/bin/env python3
"""
Dragon Quest III - Simple Maximum Coverage ROM Analyzer
=======================================================

Simplified comprehensive analysis tool that examines every byte of the ROM
to maximize disassembly coverage without Unicode characters.
"""

import struct
import time
import hashlib
import math
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set
from dataclasses import dataclass, field
import json
from collections import defaultdict, Counter
import os

@dataclass
class CoverageRegion:
	"""Represents a region of ROM with coverage analysis"""
	start_offset: int
	end_offset: int
	region_type: str
	confidence: float
	entropy: float = 0.0
	patterns: List[str] = field(default_factory=list)
	metadata: Dict[str, Any] = field(default_factory=dict)

	@property
	def size(self) -> int:
		return self.end_offset - self.start_offset + 1

class SimpleCoverageAnalyzer:
	"""
	Maximum coverage analyzer for Dragon Quest III ROM that examines every byte
	to achieve complete disassembly coverage.
	"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)
		self.coverage_map = {}
		self.regions = []
		self.entropy_map = {}
		self.pointer_map = {}
		self.data_tables = []

		print(f"INIT: Simple Coverage Analyzer initialized")
		print(f"ROM: {self.rom_path.name}")
		print(f"Size: {self.rom_size:,} bytes ({self.rom_size / 1024 / 1024:.1f} MB)")

	def _load_rom(self) -> bytes:
		"""Load ROM data into memory"""
		with open(self.rom_path, 'rb') as f:
			return f.read()

	def calculate_entropy(self, window_size: int = 256) -> Dict[int, float]:
		"""
		Calculate sliding window entropy across entire ROM to identify data types.

		Args:
			window_size: Size of sliding window for entropy calculation

		Returns:
			Dictionary mapping offset to entropy value
		"""
		print(f"\nANALYZING: Calculating byte entropy with window size {window_size}...")

		entropy_map = {}

		for offset in range(0, self.rom_size - window_size + 1, window_size // 4):
			window = self.rom_data[offset:offset + window_size]

			# Count byte frequencies
			byte_counts = Counter(window)
			entropy = 0.0

			for count in byte_counts.values():
				probability = count / len(window)
				if probability > 0:
					entropy -= probability * math.log2(probability)

			entropy_map[offset] = entropy

			# Classify based on entropy
			if entropy > 7.5:
				self._mark_region_type(offset, offset + window_size, "compressed_data")
			elif entropy > 6.5:
				self._mark_region_type(offset, offset + window_size, "code")
			elif entropy < 3.0:
				self._mark_region_type(offset, offset + window_size, "repeated_data")
			elif 4.0 <= entropy <= 6.0:
				self._mark_region_type(offset, offset + window_size, "structured_data")

		print(f"Analyzed {len(entropy_map):,} entropy windows")
		self.entropy_map = entropy_map
		return entropy_map

	def _mark_region_type(self, start: int, end: int, region_type: str, confidence: float = 0.7):
		"""Mark a region with a specific type"""
		for offset in range(start, min(end, self.rom_size)):
			if offset not in self.coverage_map or self.coverage_map[offset][1] < confidence:
				self.coverage_map[offset] = (region_type, confidence)

	def detect_pointers(self) -> Dict[int, List[int]]:
		"""
		Detect potential pointers by finding 16-bit and 24-bit values that
		reference valid ROM addresses.
		"""
		print(f"\nANALYZING: Detecting pointers...")

		pointer_map = {}

		# Scan for 16-bit pointers (little-endian)
		for offset in range(0, self.rom_size - 2):
			if offset + 1 < self.rom_size:
				value = struct.unpack('<H', self.rom_data[offset:offset+2])[0]

				# Check if this could be a valid ROM address
				if 0x8000 <= value <= 0xffff:
					# Convert to ROM offset (assuming LoROM mapping)
					rom_offset = ((value - 0x8000) % 0x8000)
					if rom_offset < self.rom_size:
						if offset not in pointer_map:
							pointer_map[offset] = []
						pointer_map[offset].append(rom_offset)

		# Scan for 24-bit pointers
		for offset in range(0, self.rom_size - 4):
			if offset + 3 < self.rom_size:
				value = struct.unpack('<I', self.rom_data[offset:offset+4])[0] & 0xffffff

				# Check for valid SNES address format
				if (value & 0x8000) and (value < 0x400000):
					rom_offset = ((value & 0x3f0000) >> 1) + (value & 0x7fff)
					if rom_offset < self.rom_size:
						if offset not in pointer_map:
							pointer_map[offset] = []
						pointer_map[offset].append(rom_offset)

		print(f"Found {len(pointer_map):,} potential pointers")
		self.pointer_map = pointer_map
		return pointer_map

	def identify_data_tables(self) -> List[Dict[str, Any]]:
		"""
		Identify structured data tables by looking for patterns and repeated structures.
		"""
		print(f"\nANALYZING: Identifying data tables...")

		data_tables = []

		# Look for patterns of repeated structures
		for offset in range(0, self.rom_size - 64, 16):
			# Check for patterns in 16-byte chunks
			chunk = self.rom_data[offset:offset+64]

			# Look for repeated 2-byte, 4-byte, 8-byte patterns
			for pattern_size in [2, 4, 8, 16]:
				if len(chunk) >= pattern_size * 4:	# Need at least 4 repetitions
					patterns = []
					for i in range(0, len(chunk) - pattern_size + 1, pattern_size):
						pattern = chunk[i:i+pattern_size]
						patterns.append(pattern)

					# Check for consistent structure
					if len(set(patterns)) > 2 and len(set(patterns)) < len(patterns) * 0.8:
						data_tables.append({
							'offset': offset,
							'pattern_size': pattern_size,
							'count': len(patterns),
							'type': 'structured_table'
						})

						# Mark this region
						self._mark_region_type(offset, offset + len(chunk), "data_table", 0.6)

		print(f"Identified {len(data_tables):,} potential data tables")
		self.data_tables = data_tables
		return data_tables

	def analyze_unidentified_regions(self) -> List[CoverageRegion]:
		"""
		Analyze regions that haven't been identified by other methods.
		"""
		print(f"\nANALYZING: Examining unidentified regions...")

		unidentified_regions = []
		current_start = None

		for offset in range(self.rom_size):
			if offset not in self.coverage_map:
				if current_start is None:
					current_start = offset
			else:
				if current_start is not None:
					# End of unidentified region
					size = offset - current_start
					if size >= 16:	# Only consider regions >= 16 bytes
						region = self._analyze_unknown_region(current_start, offset)
						unidentified_regions.append(region)
					current_start = None

		# Handle final region if it extends to end of ROM
		if current_start is not None:
			region = self._analyze_unknown_region(current_start, self.rom_size)
			unidentified_regions.append(region)

		print(f"Analyzed {len(unidentified_regions):,} unidentified regions")
		return unidentified_regions

	def _analyze_unknown_region(self, start: int, end: int) -> CoverageRegion:
		"""Analyze an unknown region to determine its likely type"""
		size = end - start
		data = self.rom_data[start:end]

		# Calculate entropy for this region
		byte_counts = Counter(data)
		entropy = 0.0
		for count in byte_counts.values():
			probability = count / len(data)
			if probability > 0:
				entropy -= probability * math.log2(probability)

		# Analyze patterns
		patterns = []

		# Check for repeated bytes
		if len(set(data)) == 1:
			patterns.append("repeated_byte")
			region_type = "padding"
			confidence = 0.9
		# Check for alternating patterns
		elif len(set(data)) == 2 and len(data) > 4:
			if all(data[i] == data[i % 2] for i in range(len(data))):
				patterns.append("alternating_bytes")
				region_type = "pattern_data"
				confidence = 0.8
			else:
				region_type = "unknown_data"
				confidence = 0.3
		# Check for ASCII text
		elif all(32 <= byte <= 126 or byte in [0, 10, 13] for byte in data):
			patterns.append("ascii_text")
			region_type = "text_data"
			confidence = 0.8
		# Check for graphics data (moderate entropy with common graphics patterns)
		elif 4.0 <= entropy <= 6.5 and self._has_graphics_patterns(data):
			patterns.append("graphics_pattern")
			region_type = "graphics_data"
			confidence = 0.6
		# Default based on entropy
		elif entropy > 7.0:
			region_type = "compressed_data"
			confidence = 0.5
		elif entropy > 5.5:
			region_type = "code"
			confidence = 0.4
		else:
			region_type = "unknown_data"
			confidence = 0.3

		return CoverageRegion(
			start_offset=start,
			end_offset=end-1,
			region_type=region_type,
			confidence=confidence,
			entropy=entropy,
			patterns=patterns,
			metadata={'size': size}
		)

	def _has_graphics_patterns(self, data: bytes) -> bool:
		"""Check if data has patterns typical of graphics data"""
		if len(data) < 32:
			return False

		# Check for 2bpp/4bpp patterns (graphics often have these bit patterns)
		nibble_counts = Counter()
		for byte in data:
			nibble_counts[byte & 0x0f] += 1
			nibble_counts[(byte & 0xf0) >> 4] += 1

		# Graphics data often has specific nibble distributions
		most_common = nibble_counts.most_common(4)
		if len(most_common) >= 4 and most_common[0][1] > len(data) * 0.3:
			return True

		return False

	def generate_coverage_report(self) -> Dict[str, Any]:
		"""
		Generate comprehensive coverage report.
		"""
		print(f"\nREPORT: Generating comprehensive coverage report...")

		# Calculate coverage statistics
		total_bytes = self.rom_size
		covered_bytes = len(self.coverage_map)
		coverage_percentage = (covered_bytes / total_bytes) * 100

		# Group regions by type
		type_stats = defaultdict(lambda: {'count': 0, 'bytes': 0})

		for offset, (region_type, confidence) in self.coverage_map.items():
			type_stats[region_type]['count'] += 1
			type_stats[region_type]['bytes'] += 1

		# Calculate entropy statistics
		if self.entropy_map:
			entropy_values = list(self.entropy_map.values())
			avg_entropy = sum(entropy_values) / len(entropy_values)
			max_entropy = max(entropy_values)
			min_entropy = min(entropy_values)
		else:
			avg_entropy = max_entropy = min_entropy = 0.0

		report = {
			'rom_info': {
				'filename': self.rom_path.name,
				'size_bytes': total_bytes,
				'size_mb': round(total_bytes / 1024 / 1024, 2)
			},
			'coverage_stats': {
				'total_bytes': total_bytes,
				'covered_bytes': covered_bytes,
				'uncovered_bytes': total_bytes - covered_bytes,
				'coverage_percentage': round(coverage_percentage, 2)
			},
			'region_types': dict(type_stats),
			'entropy_analysis': {
				'windows_analyzed': len(self.entropy_map),
				'average_entropy': round(avg_entropy, 3),
				'max_entropy': round(max_entropy, 3),
				'min_entropy': round(min_entropy, 3)
			},
			'pointer_analysis': {
				'potential_pointers': len(self.pointer_map),
				'unique_targets': len(set(target for targets in self.pointer_map.values() for target in targets))
			},
			'data_structures': {
				'data_tables': len(self.data_tables),
				'total_table_bytes': sum(dt.get('count', 0) * dt.get('pattern_size', 0) for dt in self.data_tables)
			}
		}

		return report

	def run_full_analysis(self) -> Dict[str, Any]:
		"""
		Run complete maximum coverage analysis.
		"""
		print("\nSTARTING: Maximum Coverage Analysis for Dragon Quest III")
		print("=" * 60)

		start_time = time.time()

		print("\nPHASE 1: Entropy and Pattern Analysis")
		self.calculate_entropy()

		print("\nPHASE 2: Data Type Identification")
		self.detect_pointers()
		self.identify_data_tables()

		print("\nPHASE 3: Unidentified Region Analysis")
		unidentified = self.analyze_unidentified_regions()

		# Generate final report
		report = self.generate_coverage_report()

		analysis_time = time.time() - start_time
		report['analysis_time_seconds'] = round(analysis_time, 2)

		print(f"\nCOMPLETE: Maximum Coverage Analysis Complete!")
		print(f"Time: {analysis_time:.2f} seconds")
		print(f"Coverage: {report['coverage_stats']['coverage_percentage']:.1f}%")

		return report

def main():
	"""Main entry point for maximum coverage analysis"""

	print("INIT: Dragon Quest III - Simple Maximum Coverage Analysis")
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

	# Run analysis
	analyzer = SimpleCoverageAnalyzer(rom_path)
	report = analyzer.run_full_analysis()

	# Save report
	report_path = 'reports/maximum_coverage_analysis.json'
	os.makedirs(os.path.dirname(report_path), exist_ok=True)

	with open(report_path, 'w') as f:
		json.dump(report, f, indent=2)

	print(f"\nCOMPLETE: Analysis Complete!")
	print(f"Report saved to: {report_path}")

if __name__ == "__main__":
	main()
