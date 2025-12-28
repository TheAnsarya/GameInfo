"""
Multi-ROM Comparison System for Dragon Quest III Analysis
Comprehensive comparison between ROM versions, translations, and patches

Features:
- Byte-level difference analysis between ROMs
- Intelligent data structure comparison
- Translation text extraction and comparison
- Graphics asset comparison between versions
- Code flow analysis and differences
- Automatic patch generation from differences
- Visual diff reports with detailed analysis
- Statistical analysis of changes
"""

import os
import sys
import json
import struct
import hashlib
import difflib
import logging
import math
from typing import Dict, List, Tuple, Optional, Any, Set
from dataclasses import dataclass, asdict
from pathlib import Path
from collections import defaultdict, Counter
from itertools import combinations
import zlib

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@dataclass
class ROMInfo:
	"""ROM file information and metadata"""
	path: Path
	size: int
	name: str
	version: str
	region: str
	language: str
	checksum: str
	header_type: str		# "SMC", "SFC", "None"
	header_size: int
	data: bytes

@dataclass
class DifferenceRegion:
	"""Region of differences between ROMs"""
	offset: int
	size: int
	rom1_data: bytes
	rom2_data: bytes
	difference_type: str	# "text", "graphics", "code", "data", "unknown"
	confidence: float
	description: str
	context: Dict[str, Any]

@dataclass
class TextDifference:
	"""Text/string differences between ROMs"""
	offset: int
	rom1_text: str
	rom2_text: str
	encoding: str
	context: str			# "dialogue", "menu", "item", "monster", etc.
	translation_quality: float

@dataclass
class GraphicsDifference:
	"""Graphics differences between ROMs"""
	offset: int
	format: str				# "2BPP", "4BPP", "8BPP"
	tile_count: int
	rom1_hash: str
	rom2_hash: str
	visual_similarity: float
	change_type: str		# "palette", "tiles", "arrangement"

@dataclass
class CodeDifference:
	"""Code differences between ROMs"""
	offset: int
	rom1_instructions: List[str]
	rom2_instructions: List[str]
	function_name: Optional[str]
	change_type: str		# "bugfix", "optimization", "feature", "unknown"
	impact_analysis: Dict[str, Any]

@dataclass
class ComparisonReport:
	"""Complete comparison report between two ROMs"""
	rom1: ROMInfo
	rom2: ROMInfo
	total_differences: int
	difference_percentage: float
	regions: List[DifferenceRegion]
	text_differences: List[TextDifference]
	graphics_differences: List[GraphicsDifference]
	code_differences: List[CodeDifference]
	statistics: Dict[str, Any]
	patch_data: Optional[bytes]

class MultiROMComparator:
	"""Advanced multi-ROM comparison system"""

	def __init__(self, project_root: str = "."):
		self.project_root = Path(project_root)
		self.static_dir = self.project_root / "static"
		self.roms: Dict[str, ROMInfo] = {}
		self.comparisons: Dict[Tuple[str, str], ComparisonReport] = {}

		# Text encoding detection patterns
		self.text_patterns = {
			'dialogue': [0x00, 0x01, 0x02, 0x03],	# Common dialogue markers
			'menu': [0x20, 0x21, 0x22, 0x23],		# Menu text markers
			'item': [0x40, 0x41, 0x42],			# Item name markers
			'monster': [0x50, 0x51, 0x52]			# Monster name markers
		}

		# Known graphics regions for DQ3
		self.known_graphics_regions = [
			(0x80000, 0x20000, "Character graphics"),
			(0xA0000, 0x20000, "Monster graphics"),
			(0xC0000, 0x20000, "Background tiles"),
			(0x100000, 0x40000, "Font and UI graphics"),
			(0x140000, 0x20000, "Effect graphics")
		]

		# Known code regions
		self.known_code_regions = [
			(0x8000, 0x8000, "Main game logic"),
			(0x10000, 0x8000, "Battle system"),
			(0x18000, 0x8000, "Menu system"),
			(0x20000, 0x8000, "Field logic")
		]

		logger.info("Multi-ROM Comparator initialized")

	def load_roms(self) -> Dict[str, ROMInfo]:
		"""Load all available ROM files for comparison"""
		rom_patterns = [
			("japanese_original", "Dragon Quest III - Soshite Densetsu he... (J).smc"),
			("english_translation", "Dragon Quest III - english.smc"),
			("english_patched", "Dragon Quest III - english (patched).smc")
		]

		for rom_id, filename in rom_patterns:
			rom_path = self.static_dir / filename
			if rom_path.exists():
				rom_info = self.analyze_rom_file(rom_path, rom_id)
				if rom_info:
					self.roms[rom_id] = rom_info
					logger.info(f"Loaded {rom_id}: {filename} ({rom_info.size:,} bytes)")

		logger.info(f"Loaded {len(self.roms)} ROM files for comparison")
		return self.roms

	def analyze_rom_file(self, rom_path: Path, rom_id: str) -> Optional[ROMInfo]:
		"""Analyze individual ROM file"""
		try:
			with open(rom_path, 'rb') as f:
				raw_data = f.read()

			# Detect header
			header_size = self.detect_header_size(raw_data)
			header_type = "SMC" if header_size == 512 else "SFC" if header_size == 0 else "Unknown"

			# Extract ROM data (without header)
			rom_data = raw_data[header_size:]

			# Calculate checksum
			checksum = hashlib.sha256(rom_data).hexdigest()[:16]

			# Determine version/region from filename and data
			version, region, language = self.identify_rom_variant(rom_path.name, rom_data)

			rom_info = ROMInfo(
				path=rom_path,
				size=len(rom_data),
				name=rom_path.name,
				version=version,
				region=region,
				language=language,
				checksum=checksum,
				header_type=header_type,
				header_size=header_size,
				data=rom_data
			)

			return rom_info

		except Exception as e:
			logger.error(f"Failed to analyze ROM {rom_path}: {e}")
			return None

	def detect_header_size(self, data: bytes) -> int:
		"""Detect SMC header size"""
		if len(data) % 1024 == 512:
			return 512	# SMC header
		elif len(data) % 1024 == 0:
			return 0	# No header
		else:
			return 0	# Unknown, assume no header

	def identify_rom_variant(self, filename: str, data: bytes) -> Tuple[str, str, str]:
		"""Identify ROM version, region, and language"""
		filename_lower = filename.lower()

		# Analyze filename
		if "(j)" in filename_lower or "soshite densetsu" in filename_lower:
			region = "Japan"
			language = "Japanese"
			version = "Original"
		elif "english" in filename_lower:
			region = "USA"
			language = "English"
			version = "Translation"
			if "patched" in filename_lower:
				version = "Translation (Patched)"
		else:
			region = "Unknown"
			language = "Unknown"
			version = "Unknown"

		# Verify with data analysis
		if len(data) >= 0x10000:
			# Check for Japanese text patterns
			japanese_chars = self.count_japanese_characters(data[:0x10000])
			english_chars = self.count_english_characters(data[:0x10000])

			if japanese_chars > english_chars * 2:
				language = "Japanese"
			elif english_chars > japanese_chars * 2:
				language = "English"

		return version, region, language

	def count_japanese_characters(self, data: bytes) -> int:
		"""Count likely Japanese character patterns"""
		# Look for Shift-JIS patterns and katakana/hiragana ranges
		japanese_count = 0
		i = 0
		while i < len(data) - 1:
			byte1 = data[i]
			byte2 = data[i + 1] if i + 1 < len(data) else 0

			# Shift-JIS first byte ranges
			if ((0x81 <= byte1 <= 0x9F) or (0xE0 <= byte1 <= 0xEF)) and \
				 ((0x40 <= byte2 <= 0x7E) or (0x80 <= byte2 <= 0xFC)):
				japanese_count += 1
				i += 2
			# Half-width katakana
			elif 0xA1 <= byte1 <= 0xDF:
				japanese_count += 1
				i += 1
			else:
				i += 1

		return japanese_count

	def count_english_characters(self, data: bytes) -> int:
		"""Count ASCII/English characters"""
		english_count = 0
		for byte in data:
			if 0x20 <= byte <= 0x7E:	# Printable ASCII
				english_count += 1

		return english_count

	def compare_roms(self, rom1_id: str, rom2_id: str) -> ComparisonReport:
		"""Compare two ROMs and generate detailed report"""
		if rom1_id not in self.roms or rom2_id not in self.roms:
			raise ValueError(f"ROM not loaded: {rom1_id} or {rom2_id}")

		rom1 = self.roms[rom1_id]
		rom2 = self.roms[rom2_id]

		logger.info(f"Comparing {rom1_id} vs {rom2_id}")

		# Basic difference analysis
		differences = self.find_byte_differences(rom1.data, rom2.data)
		difference_regions = self.group_differences_into_regions(differences)

		# Categorize differences
		text_diffs = self.analyze_text_differences(difference_regions, rom1, rom2)
		graphics_diffs = self.analyze_graphics_differences(difference_regions, rom1, rom2)
		code_diffs = self.analyze_code_differences(difference_regions, rom1, rom2)

		# Generate statistics
		stats = self.calculate_comparison_statistics(differences, difference_regions)

		# Create patch data
		patch_data = self.generate_patch_data(differences)

		report = ComparisonReport(
			rom1=rom1,
			rom2=rom2,
			total_differences=len(differences),
			difference_percentage=stats['difference_percentage'],
			regions=difference_regions,
			text_differences=text_diffs,
			graphics_differences=graphics_diffs,
			code_differences=code_diffs,
			statistics=stats,
			patch_data=patch_data
		)

		# Cache comparison
		self.comparisons[(rom1_id, rom2_id)] = report

		logger.info(f"Comparison complete: {len(differences):,} differences, "
					 f"{stats['difference_percentage']:.2f}% different")

		return report

	def find_byte_differences(self, data1: bytes, data2: bytes) -> List[Tuple[int, int, int]]:
		"""Find all byte-level differences between two ROM data sets"""
		differences = []
		min_size = min(len(data1), len(data2))

		for offset in range(min_size):
			if data1[offset] != data2[offset]:
				differences.append((offset, data1[offset], data2[offset]))

		# Handle size differences
		if len(data1) != len(data2):
			larger_data = data1 if len(data1) > len(data2) else data2
			for offset in range(min_size, len(larger_data)):
				differences.append((offset,
								 data1[offset] if offset < len(data1) else 0,
								 data2[offset] if offset < len(data2) else 0))

		return differences

	def group_differences_into_regions(self, differences: List[Tuple[int, int, int]]) -> List[DifferenceRegion]:
		"""Group individual byte differences into contiguous regions"""
		if not differences:
			return []

		regions = []
		current_start = differences[0][0]
		current_end = differences[0][0]
		current_data1 = [differences[0][1]]
		current_data2 = [differences[0][2]]

		for i in range(1, len(differences)):
			offset, byte1, byte2 = differences[i]

			# If this difference is adjacent to the current region
			if offset <= current_end + 16:	# Allow small gaps
				current_end = offset
				# Fill gaps with original data
				gap_size = offset - len(current_data1) - current_start
				if gap_size > 0:
					# Need to get original data for the gap
					current_data1.extend([0] * gap_size)	# Placeholder
					current_data2.extend([0] * gap_size)	# Placeholder

				current_data1.append(byte1)
				current_data2.append(byte2)
			else:
				# Create region for current group
				region = self.create_difference_region(
					current_start,
					current_end - current_start + 1,
					bytes(current_data1),
					bytes(current_data2)
				)
				regions.append(region)

				# Start new region
				current_start = offset
				current_end = offset
				current_data1 = [byte1]
				current_data2 = [byte2]

		# Add final region
		if current_data1:
			region = self.create_difference_region(
				current_start,
				current_end - current_start + 1,
				bytes(current_data1),
				bytes(current_data2)
			)
			regions.append(region)

		logger.info(f"Grouped {len(differences)} differences into {len(regions)} regions")
		return regions

	def create_difference_region(self, offset: int, size: int, data1: bytes, data2: bytes) -> DifferenceRegion:
		"""Create a difference region with type classification"""
		diff_type, confidence, description = self.classify_difference_type(offset, data1, data2)

		context = {
			'entropy_diff': abs(self.calculate_entropy(data1) - self.calculate_entropy(data2)),
			'size_ratio': len(data2) / max(len(data1), 1),
			'ascii_chars_1': sum(1 for b in data1 if 0x20 <= b <= 0x7E),
			'ascii_chars_2': sum(1 for b in data2 if 0x20 <= b <= 0x7E)
		}

		return DifferenceRegion(
			offset=offset,
			size=size,
			rom1_data=data1,
			rom2_data=data2,
			difference_type=diff_type,
			confidence=confidence,
			description=description,
			context=context
		)

	def classify_difference_type(self, offset: int, data1: bytes, data2: bytes) -> Tuple[str, float, str]:
		"""Classify the type of difference"""
		# Check if offset falls in known regions
		for start, size, name in self.known_graphics_regions:
			if start <= offset < start + size:
				return "graphics", 0.8, f"Graphics difference in {name}"

		for start, size, name in self.known_code_regions:
			if start <= offset < start + size:
				return "code", 0.7, f"Code difference in {name}"

		# Analyze data characteristics
		ascii1 = sum(1 for b in data1 if 0x20 <= b <= 0x7E)
		ascii2 = sum(1 for b in data2 if 0x20 <= b <= 0x7E)
		total_chars = len(data1) + len(data2)

		if total_chars > 0 and (ascii1 + ascii2) / total_chars > 0.7:
			return "text", 0.9, "Text/string difference"

		# Check for patterns suggesting graphics
		if self.has_graphics_patterns(data1) or self.has_graphics_patterns(data2):
			return "graphics", 0.6, "Potential graphics data"

		# Check for code patterns
		if self.has_code_patterns(data1) or self.has_code_patterns(data2):
			return "code", 0.5, "Potential code difference"

		return "data", 0.3, "Unknown data difference"

	def has_graphics_patterns(self, data: bytes) -> bool:
		"""Check if data has patterns typical of graphics"""
		if len(data) < 16:
			return False

		# Check for tile-aligned size (common in SNES graphics)
		if len(data) in [16, 32, 64]:	# 2BPP, 4BPP, 8BPP tile sizes
			return True

		# Check for repeating patterns (common in graphics)
		patterns = defaultdict(int)
		for i in range(len(data) - 1):
			pattern = (data[i], data[i+1])
			patterns[pattern] += 1

		# If many repeating patterns, likely graphics
		return len(patterns) < len(data) / 3

	def has_code_patterns(self, data: bytes) -> bool:
		"""Check if data has patterns typical of 65816 code"""
		if len(data) < 3:
			return False

		# Common 65816 opcodes
		common_opcodes = {
			0xA9,	# LDA immediate
			0x85,	# STA zero page
			0x8D,	# STA absolute
			0xAD,	# LDA absolute
			0x4C,	# JMP absolute
			0x20,	# JSR absolute
			0x60,	# RTS
			0x40,	# RTI
		}

		opcode_matches = sum(1 for byte in data if byte in common_opcodes)
		return opcode_matches / len(data) > 0.2

	def analyze_text_differences(self, regions: List[DifferenceRegion], rom1: ROMInfo, rom2: ROMInfo) -> List[TextDifference]:
		"""Analyze text differences between ROMs"""
		text_diffs = []

		for region in regions:
			if region.difference_type == "text":
				# Try to decode as text
				text1 = self.extract_text_from_data(region.rom1_data)
				text2 = self.extract_text_from_data(region.rom2_data)

				if text1 and text2:
					context = self.identify_text_context(region.offset)
					encoding = self.detect_text_encoding(region.rom1_data, region.rom2_data)
					quality = self.assess_translation_quality(text1, text2)

					text_diff = TextDifference(
						offset=region.offset,
						rom1_text=text1,
						rom2_text=text2,
						encoding=encoding,
						context=context,
						translation_quality=quality
					)
					text_diffs.append(text_diff)

		logger.info(f"Found {len(text_diffs)} text differences")
		return text_diffs

	def extract_text_from_data(self, data: bytes) -> Optional[str]:
		"""Extract readable text from byte data"""
		# Try different encodings
		encodings = ['ascii', 'shift_jis', 'utf-8', 'latin-1']

		for encoding in encodings:
			try:
				text = data.decode(encoding, errors='ignore')
				# Filter out non-printable characters
				clean_text = ''.join(c for c in text if c.isprintable() and c != '\x00')
				if len(clean_text) >= 3:	# Minimum meaningful text length
					return clean_text
			except:
				continue

		return None

	def identify_text_context(self, offset: int) -> str:
		"""Identify context of text based on offset"""
		# Known text regions for DQ3
		text_regions = {
			(0x200000, 0x210000): "dialogue",
			(0x210000, 0x220000): "menu",
			(0x220000, 0x230000): "items",
			(0x230000, 0x240000): "monsters",
			(0x240000, 0x250000): "spells"
		}

		for (start, end), context in text_regions.items():
			if start <= offset < end:
				return context

		return "unknown"

	def detect_text_encoding(self, data1: bytes, data2: bytes) -> str:
		"""Detect text encoding used"""
		# Simple heuristic based on byte patterns
		has_japanese_1 = self.count_japanese_characters(data1) > 0
		has_japanese_2 = self.count_japanese_characters(data2) > 0

		if has_japanese_1 or has_japanese_2:
			return "shift_jis"

		ascii_ratio = (sum(1 for b in data1 + data2 if 0x20 <= b <= 0x7E) /
						max(len(data1) + len(data2), 1))

		if ascii_ratio > 0.8:
			return "ascii"

		return "unknown"

	def assess_translation_quality(self, text1: str, text2: str) -> float:
		"""Assess quality of translation between texts"""
		if not text1 or not text2:
			return 0.0

		# Simple metrics for translation quality
		length_ratio = min(len(text2) / len(text1), len(text1) / len(text2))

		# Character diversity (good translations use varied vocabulary)
		unique_chars_1 = len(set(text1.lower()))
		unique_chars_2 = len(set(text2.lower()))
		diversity_ratio = min(unique_chars_2 / max(unique_chars_1, 1), 1.0)

		# Combined score
		quality = (length_ratio + diversity_ratio) / 2
		return min(quality, 1.0)

	def analyze_graphics_differences(self, regions: List[DifferenceRegion], rom1: ROMInfo, rom2: ROMInfo) -> List[GraphicsDifference]:
		"""Analyze graphics differences between ROMs"""
		graphics_diffs = []

		for region in regions:
			if region.difference_type == "graphics":
				format_type = self.detect_graphics_format(region.rom1_data, region.rom2_data)
				tile_count = self.estimate_tile_count(region.rom1_data, format_type)

				# Calculate hashes
				hash1 = hashlib.md5(region.rom1_data).hexdigest()
				hash2 = hashlib.md5(region.rom2_data).hexdigest()

				# Visual similarity (simplified)
				similarity = self.calculate_visual_similarity(region.rom1_data, region.rom2_data)
				change_type = self.classify_graphics_change(region.rom1_data, region.rom2_data)

				graphics_diff = GraphicsDifference(
					offset=region.offset,
					format=format_type,
					tile_count=tile_count,
					rom1_hash=hash1,
					rom2_hash=hash2,
					visual_similarity=similarity,
					change_type=change_type
				)
				graphics_diffs.append(graphics_diff)

		logger.info(f"Found {len(graphics_diffs)} graphics differences")
		return graphics_diffs

	def detect_graphics_format(self, data1: bytes, data2: bytes) -> str:
		"""Detect graphics format from data"""
		combined_size = len(data1) + len(data2)

		# Common SNES graphics tile sizes
		if combined_size == 32:	# 16 bytes each for 2BPP
			return "2BPP"
		elif combined_size == 64: # 32 bytes each for 4BPP
			return "4BPP"
		elif combined_size == 128: # 64 bytes each for 8BPP
			return "8BPP"

		# Guess based on entropy and patterns
		entropy1 = self.calculate_entropy(data1)
		entropy2 = self.calculate_entropy(data2)
		avg_entropy = (entropy1 + entropy2) / 2

		if avg_entropy < 4:
			return "2BPP"
		elif avg_entropy < 6:
			return "4BPP"
		else:
			return "8BPP"

	def estimate_tile_count(self, data: bytes, format_type: str) -> int:
		"""Estimate number of 8x8 tiles in graphics data"""
		bytes_per_tile = {"2BPP": 16, "4BPP": 32, "8BPP": 64}
		tile_size = bytes_per_tile.get(format_type, 32)
		return len(data) // tile_size

	def calculate_visual_similarity(self, data1: bytes, data2: bytes) -> float:
		"""Calculate visual similarity between graphics data"""
		if len(data1) != len(data2):
			return 0.0

		# Simple byte-wise similarity
		matching_bytes = sum(1 for a, b in zip(data1, data2) if a == b)
		similarity = matching_bytes / len(data1)

		return similarity

	def classify_graphics_change(self, data1: bytes, data2: bytes) -> str:
		"""Classify type of graphics change"""
		if len(data1) != len(data2):
			return "format"

		# Analyze differences
		differences = [a != b for a, b in zip(data1, data2)]
		diff_count = sum(differences)

		if diff_count < len(data1) * 0.1:
			return "palette"	# Small changes likely palette
		elif diff_count < len(data1) * 0.5:
			return "tiles"	# Medium changes likely tile data
		else:
			return "complete" # Large changes

	def analyze_code_differences(self, regions: List[DifferenceRegion], rom1: ROMInfo, rom2: ROMInfo) -> List[CodeDifference]:
		"""Analyze code differences between ROMs"""
		code_diffs = []

		for region in regions:
			if region.difference_type == "code":
				# Disassemble both code regions
				instructions1 = self.disassemble_region(region.rom1_data, region.offset)
				instructions2 = self.disassemble_region(region.rom2_data, region.offset)

				# Analyze change type
				change_type = self.classify_code_change(instructions1, instructions2)

				# Create impact analysis
				impact = self.analyze_code_impact(region.offset, instructions1, instructions2)

				code_diff = CodeDifference(
					offset=region.offset,
					rom1_instructions=instructions1,
					rom2_instructions=instructions2,
					function_name=self.identify_function_name(region.offset),
					change_type=change_type,
					impact_analysis=impact
				)
				code_diffs.append(code_diff)

		logger.info(f"Found {len(code_diffs)} code differences")
		return code_diffs

	def disassemble_region(self, data: bytes, base_offset: int) -> List[str]:
		"""Simple 65816 disassembly of code region"""
		# Simplified disassembly - in practice would use full disassembler
		instructions = []
		offset = 0

		while offset < len(data):
			if offset >= len(data):
				break

			opcode = data[offset]
			addr = base_offset + offset

			# Simple opcode to mnemonic mapping
			if opcode == 0xA9:
				if offset + 1 < len(data):
					instructions.append(f"${addr:06X}: LDA #${data[offset+1]:02X}")
					offset += 2
				else:
					break
			elif opcode == 0x85:
				if offset + 1 < len(data):
					instructions.append(f"${addr:06X}: STA ${data[offset+1]:02X}")
					offset += 2
				else:
					break
			elif opcode == 0x4C:
				if offset + 2 < len(data):
					target = data[offset+1] | (data[offset+2] << 8)
					instructions.append(f"${addr:06X}: JMP ${target:04X}")
					offset += 3
				else:
					break
			else:
				instructions.append(f"${addr:06X}: .byte ${opcode:02X}")
				offset += 1

		return instructions

	def classify_code_change(self, instructions1: List[str], instructions2: List[str]) -> str:
		"""Classify type of code change"""
		if len(instructions1) != len(instructions2):
			return "feature"	# Size change suggests feature addition/removal

		# Count different instructions
		differences = sum(1 for a, b in zip(instructions1, instructions2) if a != b)

		if differences <= 2:
			return "bugfix"
		elif differences <= len(instructions1) * 0.3:
			return "optimization"
		else:
			return "feature"

	def identify_function_name(self, offset: int) -> Optional[str]:
		"""Identify function name based on offset"""
		# Known function locations for DQ3
		functions = {
			0x8000: "main_loop",
			0x8100: "input_handler",
			0x8200: "battle_init",
			0x8300: "menu_handler",
			0x10000: "battle_logic",
			0x18000: "menu_system"
		}

		# Find closest function
		best_match = None
		best_distance = float('inf')

		for func_offset, func_name in functions.items():
			distance = abs(offset - func_offset)
			if distance < best_distance and distance < 0x1000:	# Within 4KB
				best_distance = distance
				best_match = func_name

		return best_match

	def analyze_code_impact(self, offset: int, instructions1: List[str], instructions2: List[str]) -> Dict[str, Any]:
		"""Analyze impact of code changes"""
		impact = {
			'instructions_changed': sum(1 for a, b in zip(instructions1, instructions2) if a != b),
			'size_change': len(instructions2) - len(instructions1),
			'critical_instructions': 0,
			'affected_systems': []
		}

		# Count critical instructions (jumps, calls, etc.)
		critical_opcodes = ['JMP', 'JSR', 'BRA', 'BRL']
		for instr in instructions1 + instructions2:
			if any(op in instr for op in critical_opcodes):
				impact['critical_instructions'] += 1

		# Identify affected systems based on offset
		if 0x8000 <= offset < 0x10000:
			impact['affected_systems'].append('main_game')
		elif 0x10000 <= offset < 0x18000:
			impact['affected_systems'].append('battle_system')
		elif 0x18000 <= offset < 0x20000:
			impact['affected_systems'].append('menu_system')

		return impact

	def calculate_comparison_statistics(self, differences: List[Tuple[int, int, int]],
										regions: List[DifferenceRegion]) -> Dict[str, Any]:
		"""Calculate comprehensive comparison statistics"""
		total_bytes = max(len(self.roms[rom_id].data) for rom_id in self.roms)
		diff_percentage = (len(differences) / total_bytes) * 100 if total_bytes > 0 else 0

		# Categorize differences by type
		type_counts = defaultdict(int)
		for region in regions:
			type_counts[region.difference_type] += 1

		# Calculate size statistics
		region_sizes = [region.size for region in regions]
		avg_region_size = sum(region_sizes) / max(len(region_sizes), 1)

		stats = {
			'total_bytes_compared': total_bytes,
			'different_bytes': len(differences),
			'difference_percentage': diff_percentage,
			'total_regions': len(regions),
			'average_region_size': avg_region_size,
			'differences_by_type': dict(type_counts),
			'largest_region': max(region_sizes) if region_sizes else 0,
			'smallest_region': min(region_sizes) if region_sizes else 0
		}

		return stats

	def generate_patch_data(self, differences: List[Tuple[int, int, int]]) -> Optional[bytes]:
		"""Generate patch data in IPS format"""
		if not differences or len(differences) > 10000:	# Skip if too many differences
			return None

		try:
			patch_data = b"PATCH"	# IPS header

			# Sort differences by offset
			differences.sort(key=lambda x: x[0])

			# Group consecutive differences
			current_offset = differences[0][0]
			current_data = [differences[0][2]]	# New byte values

			for i in range(1, len(differences)):
				offset, old_byte, new_byte = differences[i]

				if offset == current_offset + len(current_data):
					# Consecutive byte
					current_data.append(new_byte)
				else:
					# Write current group
					if len(current_data) <= 65535:	# IPS size limit
						patch_data += struct.pack('>I', current_offset)[1:]	# 24-bit offset
						patch_data += struct.pack('>H', len(current_data))	# 16-bit size
						patch_data += bytes(current_data)

					# Start new group
					current_offset = offset
					current_data = [new_byte]

			# Write final group
			if current_data and len(current_data) <= 65535:
				patch_data += struct.pack('>I', current_offset)[1:]
				patch_data += struct.pack('>H', len(current_data))
				patch_data += bytes(current_data)

			# IPS EOF marker
			patch_data += b"EOF"

			return patch_data

		except Exception as e:
			logger.error(f"Failed to generate patch: {e}")
			return None

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

	def generate_comparison_report(self, comparison_key: Tuple[str, str]) -> Dict[str, Any]:
		"""Generate comprehensive comparison report"""
		if comparison_key not in self.comparisons:
			raise ValueError(f"Comparison not found: {comparison_key}")

		report = self.comparisons[comparison_key]

		# Create detailed report structure
		detailed_report = {
			'comparison_info': {
				'rom1': asdict(report.rom1),
				'rom2': asdict(report.rom2),
				'timestamp': logger.name,	# Would use datetime in practice
				'total_differences': report.total_differences,
				'difference_percentage': report.difference_percentage
			},
			'statistics': report.statistics,
			'summary': {
				'text_changes': len(report.text_differences),
				'graphics_changes': len(report.graphics_differences),
				'code_changes': len(report.code_differences),
				'other_changes': len(report.regions) - len(report.text_differences) -
								len(report.graphics_differences) - len(report.code_differences)
			},
			'detailed_differences': {
				'text': [asdict(diff) for diff in report.text_differences[:20]],	# Limit for size
				'graphics': [asdict(diff) for diff in report.graphics_differences[:20]],
				'code': [asdict(diff) for diff in report.code_differences[:20]]
			},
			'patch_info': {
				'patch_available': report.patch_data is not None,
				'patch_size': len(report.patch_data) if report.patch_data else 0
			}
		}

		return detailed_report

	def export_comparison_html(self, comparison_key: Tuple[str, str], output_path: str):
		"""Export comparison as HTML report"""
		report_data = self.generate_comparison_report(comparison_key)

		# Extract data for template
		rom1_name = report_data['comparison_info']['rom1']['name']
		rom1_size = report_data['comparison_info']['rom1']['size']
		rom2_name = report_data['comparison_info']['rom2']['name']
		rom2_size = report_data['comparison_info']['rom2']['size']
		total_differences = report_data['comparison_info']['total_differences']
		difference_percentage = report_data['comparison_info']['difference_percentage']
		text_changes = report_data['summary']['text_changes']
		graphics_changes = report_data['summary']['graphics_changes']
		code_changes = report_data['summary']['code_changes']
		other_changes = report_data['summary']['other_changes']

		html_template = f"""
<!DOCTYPE html>
<html>
<head>
	<title>ROM Comparison Report</title>
	<style>
		body {{ font-family: Arial, sans-serif; margin: 20px; }}
		.header {{ background: #f0f0f0; padding: 10px; margin-bottom: 20px; }}
		.section {{ margin-bottom: 30px; border: 1px solid #ddd; padding: 15px; }}
		.diff-text {{ background: #ffffcc; }}
		.diff-graphics {{ background: #ccffcc; }}
		.diff-code {{ background: #ffcccc; }}
		table {{ border-collapse: collapse; width: 100%; }}
		th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
		th {{ background: #f2f2f2; }}
	</style>
</head>
<body>
	<div class="header">
		<h1>ROM Comparison Report</h1>
		<p><strong>ROM 1:</strong> {rom1_name} ({rom1_size:,} bytes)</p>
		<p><strong>ROM 2:</strong> {rom2_name} ({rom2_size:,} bytes)</p>
		<p><strong>Differences:</strong> {total_differences:,} bytes ({difference_percentage:.2f}%)</p>
	</div>

	<div class="section">
		<h2>Summary</h2>
		<ul>
			<li>Text Changes: {text_changes}</li>
			<li>Graphics Changes: {graphics_changes}</li>
			<li>Code Changes: {code_changes}</li>
			<li>Other Changes: {other_changes}</li>
		</ul>
	</div>

	<div class="section diff-text">
		<h2>Text Differences</h2>
		<p>Found {text_changes} text differences...</p>
	</div>

	<div class="section diff-graphics">
		<h2>Graphics Differences</h2>
		<p>Found {graphics_changes} graphics differences...</p>
	</div>

	<div class="section diff-code">
		<h2>Code Differences</h2>
		<p>Found {code_changes} code differences...</p>
	</div>
</body>
</html>
		"""

		with open(output_path, 'w', encoding='utf-8') as f:
			f.write(html_template)

		logger.info(f"HTML report exported to {output_path}")


# Command-line interface and testing
if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description='Multi-ROM Comparison System')
	parser.add_argument('--project-root', default='.',
						help='Project root directory')
	parser.add_argument('--compare', nargs=2, metavar=('ROM1', 'ROM2'),
						help='Compare two specific ROMs')
	parser.add_argument('--all-comparisons', action='store_true',
						help='Compare all available ROMs')
	parser.add_argument('--output-dir', default='comparisons',
						help='Output directory for comparison reports')
	parser.add_argument('--format', choices=['json', 'html', 'both'],
						default='both', help='Output format')

	args = parser.parse_args()

	try:
		comparator = MultiROMComparator(args.project_root)
		roms = comparator.load_roms()

		if len(roms) < 2:
			print("❌ Need at least 2 ROMs for comparison")
			print(f"Found ROMs: {list(roms.keys())}")
			sys.exit(1)

		# Create output directory
		output_dir = Path(args.output_dir)
		output_dir.mkdir(exist_ok=True)

		if args.compare:
			rom1_id, rom2_id = args.compare
			if rom1_id not in roms or rom2_id not in roms:
				print(f"❌ ROM not found: {rom1_id} or {rom2_id}")
				print(f"Available ROMs: {list(roms.keys())}")
				sys.exit(1)

			print(f"🔍 Comparing {rom1_id} vs {rom2_id}...")
			report = comparator.compare_roms(rom1_id, rom2_id)

			# Export results
			comparison_key = (rom1_id, rom2_id)
			if args.format in ['json', 'both']:
				report_data = comparator.generate_comparison_report(comparison_key)
				json_path = output_dir / f"comparison_{rom1_id}_vs_{rom2_id}.json"
				with open(json_path, 'w') as f:
					json.dump(report_data, f, indent=2, default=str)
				print(f"📄 JSON report: {json_path}")

			if args.format in ['html', 'both']:
				html_path = output_dir / f"comparison_{rom1_id}_vs_{rom2_id}.html"
				comparator.export_comparison_html(comparison_key, str(html_path))
				print(f"🌐 HTML report: {html_path}")

		elif args.all_comparisons:
			print("🔍 Comparing all ROM combinations...")
			rom_ids = list(roms.keys())

			for i, rom1_id in enumerate(rom_ids):
				for j, rom2_id in enumerate(rom_ids):
					if i < j:	# Avoid duplicate comparisons
						print(f"	Comparing {rom1_id} vs {rom2_id}...")
						report = comparator.compare_roms(rom1_id, rom2_id)

						# Export results
						comparison_key = (rom1_id, rom2_id)
						if args.format in ['json', 'both']:
							report_data = comparator.generate_comparison_report(comparison_key)
							json_path = output_dir / f"comparison_{rom1_id}_vs_{rom2_id}.json"
							with open(json_path, 'w') as f:
								json.dump(report_data, f, indent=2, default=str)

						if args.format in ['html', 'both']:
							html_path = output_dir / f"comparison_{rom1_id}_vs_{rom2_id}.html"
							comparator.export_comparison_html(comparison_key, str(html_path))

		else:
			print("📋 Available ROMs:")
			for rom_id, rom_info in roms.items():
				print(f"	{rom_id}: {rom_info.name} ({rom_info.size:,} bytes, {rom_info.language})")

			print("\nUse --compare ROM1 ROM2 or --all-comparisons to start analysis")

	except Exception as e:
		print(f"❌ Error: {e}")
		import traceback
		traceback.print_exc()
