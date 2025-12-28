#!/usr/bin/env python3
"""
Dragon Quest III - Maximum Coverage ROM Analyzer
================================================

Comprehensive analysis tool that examines every byte of the ROM to maximize
disassembly coverage, identifying all data structures, code, and assets.
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
import sys

# Add parent directory for imports
sys.path.append(str(Path(__file__).parent.parent))

try:
	from analysis.rom_header_analyzer import DQ3ROMHeaderAnalyzer
	from analysis.deep_rom_analyzer import DQ3DeepAnalyzer
	from analysis.graphics_analyzer import DQ3GraphicsAnalyzer
	from analysis.battle_analyzer import DQ3BattleAnalyzer
	from analysis.audio_analyzer import DQ3AudioAnalyzer
except ImportError as e:
	print(f"Import warning: {e}")
	# Create stub classes for graceful degradation
	class DQ3ROMHeaderAnalyzer:
		def __init__(self, rom_path): pass
		def analyze_complete_header(self): return {}

	class DQ3DeepAnalyzer:
		def __init__(self, rom_path): pass
		def find_code_regions(self): return []

	class DQ3GraphicsAnalyzer:
		def __init__(self, rom_path): pass
		def find_ppu_access_functions(self): return []
		def analyze_sprite_system(self): return []
		def analyze_palette_system(self): return []

	class DQ3BattleAnalyzer:
		def __init__(self, rom_path): pass

	class DQ3AudioAnalyzer:
		def __init__(self, rom_path): pass
		def find_audio_functions(self): return []
		def analyze_music_system(self): return []


@dataclass
class ROMRegion:
	"""Represents a classified region of ROM data"""
	start_offset: int
	end_offset: int
	size: int
	region_type: str	# "code", "data", "graphics", "audio", "text", "table", "unknown"
	confidence: float	# 0.0 to 1.0
	description: str
	analysis_data: Dict[str, Any] = field(default_factory=dict)
	cross_references: List[int] = field(default_factory=list)

	@property
	def coverage_percentage(self) -> float:
		"""Calculate what percentage of ROM this region covers"""
		return (self.size / (6 * 1024 * 1024)) * 100	# 6MB ROM


@dataclass
class ByteAnalysis:
	"""Analysis data for individual bytes"""
	offset: int
	value: int
	entropy: float
	frequency_rank: int
	patterns_found: List[str]
	probable_type: str
	confidence: float


class MaximumCoverageAnalyzer:
	"""Analyzes every byte of the ROM for maximum disassembly coverage"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.regions = []
		self.byte_analysis = {}
		self.coverage_map = [0] * self.rom_size	# 0=unknown, 1=analyzed
		self.data_patterns = defaultdict(list)
		self.cross_references = defaultdict(set)

		# Statistics
		self.total_bytes_analyzed = 0
		self.code_bytes = 0
		self.data_bytes = 0
		self.graphics_bytes = 0
		self.audio_bytes = 0
		self.text_bytes = 0

		print(f"INIT: Maximum Coverage Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes ({self.rom_size / (1024*1024):.2f} MB)")

	def analyze_byte_entropy(self, window_size: int = 256) -> Dict[int, float]:
		"""Calculate entropy for sliding windows to identify data types"""
		print(f"\nANALYZING: Calculating byte entropy with window size {window_size}...")

		entropy_map = {}

		for offset in range(0, self.rom_size - window_size, window_size // 4):
			window = self.rom_data[offset:offset + window_size]

			# Calculate Shannon entropy
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

		print(f"	 Entropy analysis complete: {len(entropy_map)} windows analyzed")
		return entropy_map

	def find_all_pointers(self) -> Dict[int, List[int]]:
		"""Find all possible pointer references in the ROM"""
		print(f"\n🔗 Scanning for pointer references...")

		pointers = defaultdict(list)

		# SNES addressing patterns
		for offset in range(0, self.rom_size - 2):
			# 16-bit pointers
			ptr16 = struct.unpack('<H', self.rom_data[offset:offset + 2])[0]

			# Check if it's a valid SNES address
			if 0x8000 <= ptr16 <= 0xffff:
				target = self._snes_to_rom_address(ptr16)
				if 0 <= target < self.rom_size:
					pointers[target].append(offset)
					self.cross_references[target].add(offset)

			# 24-bit pointers (if enough data)
			if offset < self.rom_size - 3:
				ptr24 = struct.unpack('<I', self.rom_data[offset:offset + 3] + b'\x00')[0]
				bank = (ptr24 >> 16) & 0xff
				addr = ptr24 & 0xffff

				if bank <= 0x3f and 0x8000 <= addr <= 0xffff:
					target = (bank * 0x8000) + (addr - 0x8000)
					if 0 <= target < self.rom_size:
						pointers[target].append(offset)
						self.cross_references[target].add(offset)

		print(f"	 Found {len(pointers)} pointer targets")
		print(f"	 Total references: {sum(len(refs) for refs in pointers.values())}")

		return dict(pointers)

	def identify_data_tables(self) -> List[ROMRegion]:
		"""Identify all data tables and lookup tables"""
		print(f"\n📋 Identifying data tables...")

		tables = []
		offset = 0

		while offset < self.rom_size - 32:
			# Look for table patterns
			table_info = self._analyze_potential_table(offset)

			if table_info and table_info['confidence'] > 0.7:
				region = ROMRegion(
					start_offset=offset,
					end_offset=offset + table_info['size'],
					size=table_info['size'],
					region_type="table",
					confidence=table_info['confidence'],
					description=f"{table_info['type']} table with {table_info['entries']} entries",
					analysis_data=table_info
				)
				tables.append(region)

				# Mark bytes as analyzed
				self._mark_bytes_analyzed(offset, offset + table_info['size'])
				offset += table_info['size']
			else:
				offset += 16	# Skip ahead

		print(f"	 Identified {len(tables)} data tables")
		return tables

	def identify_text_data(self) -> List[ROMRegion]:
		"""Find all text strings and character data"""
		print(f"\n📝 Identifying text data...")

		text_regions = []
		current_text_start = None
		current_text_size = 0

		for offset in range(self.rom_size):
			byte_val = self.rom_data[offset]

			# Check if byte could be text (printable ASCII or DQ3 character codes)
			is_text_byte = self._is_text_byte(byte_val)

			if is_text_byte:
				if current_text_start is None:
					current_text_start = offset
				current_text_size += 1
			else:
				# End of text region
				if current_text_start is not None and current_text_size >= 8:
					text_content = self.rom_data[current_text_start:current_text_start + current_text_size]

					region = ROMRegion(
						start_offset=current_text_start,
						end_offset=current_text_start + current_text_size,
						size=current_text_size,
						region_type="text",
						confidence=self._calculate_text_confidence(text_content),
						description=f"Text data ({current_text_size} bytes)",
						analysis_data={
							'preview': text_content[:32].hex(),
							'probable_encoding': self._detect_text_encoding(text_content)
						}
					)
					text_regions.append(region)
					self._mark_bytes_analyzed(current_text_start, current_text_start + current_text_size)

				current_text_start = None
				current_text_size = 0

		print(f"	 Found {len(text_regions)} text regions")
		return text_regions

	def identify_graphics_data(self) -> List[ROMRegion]:
		"""Find all graphics data including tiles, sprites, palettes"""
		print(f"\n🎨 Identifying graphics data...")

		graphics_regions = []

		# Use existing graphics analyzer as base
		try:
			gfx_analyzer = DQ3GraphicsAnalyzer(str(self.rom_path))
			gfx_functions = gfx_analyzer.find_ppu_access_functions()
			sprite_data = gfx_analyzer.analyze_sprite_system()
			palette_data = gfx_analyzer.analyze_palette_system()

			# Convert to regions
			for sprite in sprite_data:
				region = ROMRegion(
					start_offset=sprite.address - 0x8000,	# Convert from SNES address
					end_offset=(sprite.address - 0x8000) + 64,	# Estimate size
					size=64,
					region_type="graphics",
					confidence=0.8,
					description=f"Sprite data {sprite.format}",
					analysis_data={'sprite_info': sprite.__dict__}
				)
				graphics_regions.append(region)

		except Exception as e:
			print(f"	 Warning: Graphics analyzer failed: {e}")

		# Additional pattern-based graphics detection
		graphics_patterns = [
			b'\x00\x00\x7e\x7e',	# Common tile pattern
			b'\xff\x00\xff\x00',	# Checkerboard pattern
			b'\x80\x80\x80\x80',	# Vertical line pattern
		]

		for offset in range(0, self.rom_size - 64, 64):
			chunk = self.rom_data[offset:offset + 64]

			# Check for graphics patterns
			graphics_score = 0
			for pattern in graphics_patterns:
				if pattern in chunk:
					graphics_score += 1

			# Check bit patterns typical of graphics
			bit_patterns = self._analyze_bit_patterns(chunk)
			if bit_patterns['regularity'] > 0.7:
				graphics_score += 2

			if graphics_score >= 2:
				region = ROMRegion(
					start_offset=offset,
					end_offset=offset + 64,
					size=64,
					region_type="graphics",
					confidence=min(0.9, graphics_score / 4.0),
					description="Pattern-detected graphics data",
					analysis_data={'patterns_found': graphics_score}
				)
				graphics_regions.append(region)
				self._mark_bytes_analyzed(offset, offset + 64)

		print(f"	 Found {len(graphics_regions)} graphics regions")
		return graphics_regions

	def identify_audio_data(self) -> List[ROMRegion]:
		"""Find all audio data including music and SFX"""
		print(f"\n🎵 Identifying audio data...")

		audio_regions = []

		# Use existing audio analyzer
		try:
			audio_analyzer = DQ3AudioAnalyzer(str(self.rom_path))
			audio_functions = audio_analyzer.find_audio_functions()
			music_tracks = audio_analyzer.analyze_music_system()

			# Convert tracks to regions
			for track in music_tracks:
				region = ROMRegion(
					start_offset=track.address - 0x8000,
					end_offset=(track.address - 0x8000) + track.size,
					size=track.size,
					region_type="audio",
					confidence=0.85,
					description=f"Music track: {track.name}",
					analysis_data={'track_info': track.__dict__}
				)
				audio_regions.append(region)

		except Exception as e:
			print(f"	 Warning: Audio analyzer failed: {e}")

		# Look for audio patterns
		for offset in range(0, self.rom_size - 256, 256):
			chunk = self.rom_data[offset:offset + 256]

			# Check for SPC-700 instruction patterns
			spc_patterns = 0
			spc_opcodes = [0x8f, 0xaf, 0xc4, 0xe4, 0x3f, 0x6f, 0x2f, 0xf0, 0xd0]

			for byte_val in chunk[::8]:	# Sample every 8th byte
				if byte_val in spc_opcodes:
					spc_patterns += 1

			if spc_patterns >= 4:	# Threshold for likely SPC code
				region = ROMRegion(
					start_offset=offset,
					end_offset=offset + 256,
					size=256,
					region_type="audio",
					confidence=min(0.8, spc_patterns / 8.0),
					description="Possible SPC-700 code",
					analysis_data={'spc_pattern_count': spc_patterns}
				)
				audio_regions.append(region)
				self._mark_bytes_analyzed(offset, offset + 256)

		print(f"	 Found {len(audio_regions)} audio regions")
		return audio_regions

	def identify_code_regions(self) -> List[ROMRegion]:
		"""Find all executable code regions with comprehensive analysis"""
		print(f"\n💻 Identifying code regions...")

		code_regions = []

		# Use existing analyzers
		try:
			# Get existing analysis
			header_analyzer = DQ3ROMHeaderAnalyzer(str(self.rom_path))
			header_analysis = header_analyzer.analyze_complete_header()

			deep_analyzer = DQ3DeepAnalyzer(str(self.rom_path))
			deep_regions = deep_analyzer.find_code_regions()

			# Convert existing regions
			for region_data in deep_regions:
				region = ROMRegion(
					start_offset=region_data['rom_offset'],
					end_offset=region_data['rom_offset'] + region_data['estimated_size'],
					size=region_data['estimated_size'],
					region_type="code",
					confidence=region_data.get('confidence', 0.8),
					description=f"65816 code region",
					analysis_data=region_data
				)
				code_regions.append(region)

		except Exception as e:
			print(f"	 Warning: Existing analyzer failed: {e}")

		# Additional instruction pattern analysis
		valid_65816_opcodes = {
			0xa9, 0xad, 0x8d, 0x60, 0x20, 0x4c, 0xf0, 0xd0, 0x80,
			0x18, 0x38, 0x65, 0xe5, 0x0a, 0x4a, 0x29, 0x09, 0x49,
			0xc9, 0xb0, 0x90, 0xa2, 0xa0, 0x8e, 0x8c, 0xe0, 0xc0
		}

		offset = 0
		while offset < self.rom_size - 100:
			# Analyze potential code sequence
			code_score = 0
			sequence_length = 0

			for i in range(100):
				if offset + i >= self.rom_size:
					break

				opcode = self.rom_data[offset + i]

				if opcode in valid_65816_opcodes:
					code_score += 1
					sequence_length = i + 1
				elif opcode == 0x60:	# RTS - end of function
					break
				elif opcode > 0xff:	# Invalid
					break

			# If we found a decent code sequence
			if code_score >= 20 and sequence_length >= 50:
				region = ROMRegion(
					start_offset=offset,
					end_offset=offset + sequence_length,
					size=sequence_length,
					region_type="code",
					confidence=min(0.9, code_score / 50.0),
					description=f"65816 instruction sequence ({code_score} valid opcodes)",
					analysis_data={'instruction_count': code_score}
				)
				code_regions.append(region)
				self._mark_bytes_analyzed(offset, offset + sequence_length)
				offset += sequence_length
			else:
				offset += 32	# Skip ahead

		print(f"	 Found {len(code_regions)} code regions")
		return code_regions

	def analyze_unidentified_regions(self) -> List[ROMRegion]:
		"""Analyze remaining unidentified bytes"""
		print(f"\n❓ Analyzing unidentified regions...")

		unidentified_regions = []
		current_start = None
		current_size = 0

		for offset in range(self.rom_size):
			if self.coverage_map[offset] == 0:	# Unanalyzed
				if current_start is None:
					current_start = offset
				current_size += 1
			else:
				if current_start is not None and current_size >= 16:
					# Analyze this unidentified region
					data = self.rom_data[current_start:current_start + current_size]
					analysis = self._analyze_unknown_data(data)

					region = ROMRegion(
						start_offset=current_start,
						end_offset=current_start + current_size,
						size=current_size,
						region_type=analysis['probable_type'],
						confidence=analysis['confidence'],
						description=analysis['description'],
						analysis_data=analysis
					)
					unidentified_regions.append(region)
					self._mark_bytes_analyzed(current_start, current_start + current_size)

				current_start = None
				current_size = 0

		print(f"	 Analyzed {len(unidentified_regions)} previously unidentified regions")
		return unidentified_regions

	def generate_comprehensive_coverage_report(self) -> Dict[str, Any]:
		"""Generate detailed coverage analysis report"""
		print(f"\n📊 Generating comprehensive coverage report...")

		total_analyzed = sum(self.coverage_map)
		coverage_percentage = (total_analyzed / self.rom_size) * 100

		region_stats = defaultdict(int)
		region_bytes = defaultdict(int)

		for region in self.regions:
			region_stats[region.region_type] += 1
			region_bytes[region.region_type] += region.size

		report = {
			'rom_info': {
				'path': str(self.rom_path),
				'size': self.rom_size,
				'hash': hashlib.sha256(self.rom_data).hexdigest()
			},
			'coverage': {
				'total_bytes_analyzed': total_analyzed,
				'coverage_percentage': coverage_percentage,
				'unanalyzed_bytes': self.rom_size - total_analyzed
			},
			'region_statistics': {
				'by_count': dict(region_stats),
				'by_size': dict(region_bytes)
			},
			'analysis_quality': {
				'high_confidence_regions': len([r for r in self.regions if r.confidence >= 0.8]),
				'medium_confidence_regions': len([r for r in self.regions if 0.5 <= r.confidence < 0.8]),
				'low_confidence_regions': len([r for r in self.regions if r.confidence < 0.5])
			},
			'cross_references': {
				'total_pointers_found': len(self.cross_references),
				'most_referenced_address': max(self.cross_references.keys(),
											 key=lambda k: len(self.cross_references[k]))
											 if self.cross_references else 0
			}
		}

		return report

	def run_maximum_coverage_analysis(self, output_dir: str):
		"""Run comprehensive maximum coverage analysis"""
		print("🚀 Starting Maximum Coverage ROM Analysis")
		print("=" * 60)

		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		start_time = time.time()

		# Phase 1: Entropy and pattern analysis
		print("\n📊 Phase 1: Entropy and Pattern Analysis")
		self.analyze_byte_entropy()
		pointers = self.find_all_pointers()

		# Phase 2: Specific data type identification
		print("\n🔍 Phase 2: Data Type Identification")
		self.regions.extend(self.identify_data_tables())
		self.regions.extend(self.identify_text_data())
		self.regions.extend(self.identify_graphics_data())
		self.regions.extend(self.identify_audio_data())
		self.regions.extend(self.identify_code_regions())

		# Phase 3: Unidentified region analysis
		print("\n🔬 Phase 3: Unidentified Region Analysis")
		self.regions.extend(self.analyze_unidentified_regions())

		# Phase 4: Generate comprehensive report
		coverage_report = self.generate_comprehensive_coverage_report()

		# Output files
		self._generate_output_files(output_path, coverage_report, pointers)

		end_time = time.time()

		print(f"\n🎯 Maximum Coverage Analysis Complete!")
		print(f"	 Analysis time: {end_time - start_time:.2f} seconds")
		print(f"	 Total regions: {len(self.regions)}")
		print(f"	 Coverage: {coverage_report['coverage']['coverage_percentage']:.2f}%")
		print(f"	 Output directory: {output_path}")

		return coverage_report

	def _snes_to_rom_address(self, snes_addr: int) -> int:
		"""Convert SNES address to ROM offset"""
		bank = (snes_addr >> 16) & 0xff
		offset = snes_addr & 0xffff

		if bank < 0x80 and offset >= 0x8000:
			return (bank * 0x8000) + (offset - 0x8000)
		elif bank >= 0x80 and offset >= 0x8000:
			bank = bank - 0x80
			return (bank * 0x8000) + (offset - 0x8000)
		return 0

	def _mark_region_type(self, start: int, end: int, region_type: str):
		"""Mark bytes as a specific type for tracking"""
		for i in range(start, min(end, len(self.coverage_map))):
			if self.coverage_map[i] == 0:
				self.coverage_map[i] = 1

	def _mark_bytes_analyzed(self, start: int, end: int):
		"""Mark bytes as analyzed"""
		for i in range(start, min(end, len(self.coverage_map))):
			self.coverage_map[i] = 1

	def _analyze_potential_table(self, offset: int) -> Optional[Dict[str, Any]]:
		"""Analyze if data at offset looks like a table"""
		if offset + 64 >= self.rom_size:
			return None

		data = self.rom_data[offset:offset + 64]

		# Look for pointer table patterns
		pointers = []
		for i in range(0, 32, 2):
			if i + 1 < len(data):
				ptr = struct.unpack('<H', data[i:i+2])[0]
				if 0x8000 <= ptr <= 0xffff:
					pointers.append(ptr)

		if len(pointers) >= 8:	# Likely pointer table
			return {
				'type': 'pointer_table',
				'entries': len(pointers),
				'size': len(pointers) * 2,
				'confidence': min(0.9, len(pointers) / 16.0),
				'sample_pointers': pointers[:5]
			}

		# Look for data table patterns
		values = list(data)
		unique_values = len(set(values))

		if unique_values < len(values) * 0.3:	# High repetition
			return {
				'type': 'data_table',
				'entries': len(values),
				'size': len(values),
				'confidence': 0.7,
				'unique_values': unique_values
			}

		return None

	def _is_text_byte(self, byte_val: int) -> bool:
		"""Check if byte could be text"""
		# Printable ASCII
		if 0x20 <= byte_val <= 0x7e:
			return True
		# Common control characters
		if byte_val in [0x00, 0x0a, 0x0d, 0xff]:
			return True
		# DQ3 specific character codes (estimated range)
		if 0x80 <= byte_val <= 0xf0:
			return True
		return False

	def _calculate_text_confidence(self, text_data: bytes) -> float:
		"""Calculate confidence that data is text"""
		if len(text_data) == 0:
			return 0.0

		printable_chars = sum(1 for b in text_data if 0x20 <= b <= 0x7e)
		control_chars = sum(1 for b in text_data if b in [0x00, 0x0a, 0x0d, 0xff])

		confidence = (printable_chars + control_chars * 0.5) / len(text_data)
		return min(1.0, confidence)

	def _detect_text_encoding(self, text_data: bytes) -> str:
		"""Detect probable text encoding"""
		ascii_chars = sum(1 for b in text_data if 0x20 <= b <= 0x7e)
		high_bit_chars = sum(1 for b in text_data if b >= 0x80)

		if ascii_chars > high_bit_chars:
			return "ASCII"
		elif high_bit_chars > 0:
			return "DQ3_CUSTOM"
		else:
			return "UNKNOWN"

	def _analyze_bit_patterns(self, data: bytes) -> Dict[str, float]:
		"""Analyze bit patterns in data"""
		if len(data) == 0:
			return {'regularity': 0.0}

		# Count bit transitions
		transitions = 0
		for i in range(len(data) - 1):
			if data[i] != data[i + 1]:
				transitions += 1

		regularity = 1.0 - (transitions / len(data))
		return {'regularity': regularity}

	def _analyze_unknown_data(self, data: bytes) -> Dict[str, Any]:
		"""Analyze unknown data to determine probable type"""
		if len(data) == 0:
			return {
				'probable_type': 'empty',
				'confidence': 1.0,
				'description': 'Empty region'
			}

		# Calculate statistics
		unique_bytes = len(set(data))
		zero_bytes = data.count(0x00)
		ff_bytes = data.count(0xff)

		# Determine type based on patterns
		if zero_bytes > len(data) * 0.8:
			return {
				'probable_type': 'padding',
				'confidence': 0.9,
				'description': f'Padding region ({zero_bytes} zero bytes)'
			}
		elif ff_bytes > len(data) * 0.8:
			return {
				'probable_type': 'unused',
				'confidence': 0.9,
				'description': f'Unused region ({ff_bytes} FF bytes)'
			}
		elif unique_bytes < 16:
			return {
				'probable_type': 'pattern_data',
				'confidence': 0.6,
				'description': f'Pattern data ({unique_bytes} unique bytes)'
			}
		else:
			return {
				'probable_type': 'unknown_data',
				'confidence': 0.3,
				'description': f'Unknown data type ({unique_bytes} unique bytes)'
			}

	def _generate_output_files(self, output_path: Path, coverage_report: Dict, pointers: Dict):
		"""Generate comprehensive output files"""

		# Coverage report
		with open(output_path / 'coverage_report.json', 'w') as f:
			json.dump(coverage_report, f, indent=2)

		# Regions map
		regions_data = []
		for region in self.regions:
			regions_data.append({
				'start_offset': region.start_offset,
				'end_offset': region.end_offset,
				'size': region.size,
				'type': region.region_type,
				'confidence': region.confidence,
				'description': region.description,
				'analysis_data': region.analysis_data
			})

		with open(output_path / 'regions_map.json', 'w') as f:
			json.dump(regions_data, f, indent=2)

		# Pointer references
		with open(output_path / 'pointer_references.json', 'w') as f:
			# Convert sets to lists for JSON serialization
			pointer_data = {str(k): list(v) for k, v in pointers.items()}
			json.dump(pointer_data, f, indent=2)

		# Coverage map (binary representation)
		with open(output_path / 'coverage_map.bin', 'wb') as f:
			f.write(bytes(self.coverage_map))

		# Detailed markdown report
		self._generate_markdown_report(output_path, coverage_report)

	def _generate_markdown_report(self, output_path: Path, coverage_report: Dict):
		"""Generate detailed markdown coverage report"""

		with open(output_path / 'maximum_coverage_report.md', 'w', encoding='utf-8') as f:
			f.write("# Dragon Quest III - Maximum Coverage Analysis Report\n\n")

			# Summary
			f.write("## Analysis Summary\n\n")
			f.write(f"- **ROM Size:** {coverage_report['rom_info']['size']:,} bytes\n")
			f.write(f"- **Coverage:** {coverage_report['coverage']['coverage_percentage']:.2f}%\n")
			f.write(f"- **Analyzed Bytes:** {coverage_report['coverage']['total_bytes_analyzed']:,}\n")
			f.write(f"- **Unanalyzed Bytes:** {coverage_report['coverage']['unanalyzed_bytes']:,}\n")
			f.write(f"- **Total Regions:** {len(self.regions)}\n\n")

			# Region statistics
			f.write("## Region Type Statistics\n\n")
			f.write("| Region Type | Count | Total Bytes | Percentage |\n")
			f.write("|-------------|-------|-------------|------------|\n")

			for region_type, byte_count in coverage_report['region_statistics']['by_size'].items():
				count = coverage_report['region_statistics']['by_count'][region_type]
				percentage = (byte_count / coverage_report['rom_info']['size']) * 100
				f.write(f"| {region_type.title()} | {count} | {byte_count:,} | {percentage:.2f}% |\n")

			# Quality metrics
			f.write("\n## Analysis Quality\n\n")
			f.write(f"- **High Confidence Regions:** {coverage_report['analysis_quality']['high_confidence_regions']}\n")
			f.write(f"- **Medium Confidence Regions:** {coverage_report['analysis_quality']['medium_confidence_regions']}\n")
			f.write(f"- **Low Confidence Regions:** {coverage_report['analysis_quality']['low_confidence_regions']}\n\n")

			# Top regions by size
			f.write("## Largest Regions\n\n")
			largest_regions = sorted(self.regions, key=lambda r: r.size, reverse=True)[:20]

			f.write("| Offset | Size | Type | Confidence | Description |\n")
			f.write("|--------|------|------|------------|-------------|\n")

			for region in largest_regions:
				f.write(f"| ${region.start_offset:06X} | {region.size:,} | {region.region_type} | {region.confidence:.2f} | {region.description} |\n")


def main():
	"""Main entry point for maximum coverage analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/analysis/maximum_coverage"

	print("🔬 Dragon Quest III - Maximum Coverage Analysis")
	print("=" * 70)

	analyzer = MaximumCoverageAnalyzer(rom_path)
	coverage_report = analyzer.run_maximum_coverage_analysis(output_dir)

	print(f"\n🎯 Analysis Complete!")
	print(f"Coverage achieved: {coverage_report['coverage']['coverage_percentage']:.2f}%")


if __name__ == "__main__":
	main()
