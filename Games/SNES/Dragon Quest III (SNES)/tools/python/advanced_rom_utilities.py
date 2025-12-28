#!/usr/bin/env python3
"""
Advanced ROM Utilities Collection
Comprehensive ROM manipulation, analysis, and optimization tools
Integrates all developed systems for maximum functionality
"""

import struct
import sys
import time
from pathlib import Path
from typing import Dict, Any, List, Optional, Tuple, Union
import json
import hashlib
from dataclasses import dataclass, field

# Import our developed systems
sys.path.append(str(Path(__file__).parent))
try:
	from compression.compression_engine import get_compression_engine
	from asset_pipeline.snes_extractor import create_asset_pipeline
	from session.session_logger import SessionLogger
except ImportError as e:
	print(f"Warning: Some modules not available: {e}")


@dataclass
class ROMPatch:
	"""Represents a ROM patch with metadata"""

	name: str
	description: str
	offset: int
	original_data: bytes
	patched_data: bytes
	checksum_before: str
	checksum_after: str
	category: str = "general"
	risk_level: str = "low"	# low, medium, high
	reversible: bool = True
	dependencies: List[str] = field(default_factory=list)

	def validate(self) -> bool:
		"""Validate patch integrity"""
		return len(self.original_data) == len(self.patched_data) and len(self.original_data) > 0


@dataclass
class ROMOptimization:
	"""ROM optimization recommendation"""

	optimization_type: str
	location: int
	size: int
	description: str
	potential_savings: int
	implementation_difficulty: str	# easy, medium, hard
	side_effects: List[str] = field(default_factory=list)


class AdvancedROMAnalyzer:
	"""Advanced ROM analysis with deep structural understanding"""

	def __init__(self, rom_path: Path):
		self.rom_path = rom_path
		self.rom_data = self._load_rom()
		self.compression_engine = get_compression_engine() if "get_compression_engine" in globals() else None
		self.session_logger = SessionLogger() if "SessionLogger" in globals() else None

		self.analysis_cache = {}
		self.patches_applied = []
		self.optimization_opportunities = []

		# DQ3-specific data structures from our research
		self.dq3_structures = {
			"character_classes": {
				"base_offset": 0xc4179e,
				"count": 9,
				"size_each": 90,
				"structure": {
					"stat_growth": {"offset": 0, "size": 16},
					"spell_list": {"offset": 16, "size": 32},
					"equipment": {"offset": 48, "size": 24},
					"abilities": {"offset": 72, "size": 18},
				},
			},
			"monster_data": {
				"base_offset": 0x180000,	# Estimated
				"count": 155,
				"terminator": 0xac,
				"structure": {
					"stats": {"size": 8},
					"ai_script": {"variable": True},
					"drops": {"size": 4},
					"experience": {"size": 2},
				},
			},
			"dialog_system": {
				"font_data": {"offset": 0x200000, "count": 50},
				"text_blocks": {"variable_location": True},
				"compression": "huffman_variant",
			},
			"graphics_data": {
				"character_sprites": {"offset": 0x100000, "format": "4bpp"},
				"monster_sprites": {"offset": 0x120000, "format": "4bpp"},
				"background_tiles": {"offset": 0x140000, "format": "2bpp_4bpp_mixed"},
				"palettes": {"offset": 0x160000, "format": "snes_15bit"},
			},
		}

		self.logs_dir = Path(__file__).parent.parent / "logs"
		self.logs_dir.mkdir(exist_ok=True)

	def _load_rom(self) -> bytes:
		"""Load and validate ROM data"""
		try:
			with open(self.rom_path, "rb") as f:
				data = f.read()

			# Remove header if present
			if len(data) % 1024 == 512:
				print(f"Removing 512-byte header from {self.rom_path.name}")
				data = data[512:]

			return data
		except Exception as e:
			raise RuntimeError(f"Failed to load ROM {self.rom_path}: {e}")

	def perform_deep_analysis(self) -> Dict[str, Any]:
		"""Perform comprehensive deep analysis of ROM structure"""
		analysis_start = time.time()

		deep_analysis = {
			"metadata": self._analyze_rom_metadata(),
			"data_structures": self._analyze_data_structures(),
			"compression_analysis": self._analyze_compression_usage(),
			"optimization_opportunities": self._find_optimization_opportunities(),
			"integrity_validation": self._validate_rom_integrity(),
			"modification_potential": self._analyze_modification_potential(),
			"performance_profile": self._create_performance_profile(),
		}

		deep_analysis["analysis_time"] = time.time() - analysis_start
		deep_analysis["timestamp"] = time.strftime("%Y-%m-%d %H:%M:%S")

		# Cache results
		self.analysis_cache["deep_analysis"] = deep_analysis

		# Log analysis if session logger available
		if self.session_logger:
			self.session_logger.log_prompt_activity(
				prompt_type="advanced_rom_analysis",
				description=f"Deep ROM analysis of {self.rom_path.name}",
				tools_used=[
					"advanced_rom_analyzer",
					"compression_engine",
					"data_structure_analysis",
				],
				outcomes=[
					f"analyzed_{len(deep_analysis['data_structures'])}structures",
					f"found_{len(deep_analysis['optimization_opportunities'])}_optimizations",
				],
			)

		return deep_analysis

	def _analyze_rom_metadata(self) -> Dict[str, Any]:
		"""Extract and analyze ROM metadata"""
		metadata = {
			"file_size": len(self.rom_data),
			"checksum": hashlib.md5(self.rom_data).hexdigest(),
			"rom_type": "Unknown",
			"mapping_mode": "Unknown",
			"region": "Unknown",
			"version": "Unknown",
		}

		# Detect ROM mapping
		if len(self.rom_data) >= 0x10000:
			# Check common header locations
			lorom_header = self._extract_snes_header(0x7fc0)
			hirom_header = self._extract_snes_header(0xffc0)

			lorom_score = self._score_header(lorom_header)
			hirom_score = self._score_header(hirom_header)

			if lorom_score > hirom_score:
				metadata["rom_type"] = "LoROM"
				metadata["mapping_mode"] = "Mode 20"
				header = lorom_header
			else:
				metadata["rom_type"] = "HiROM"
				metadata["mapping_mode"] = "Mode 21"
				header = hirom_header

			# Extract header information
			if header:
				metadata["game_title"] = header.get("title", "Unknown")
				metadata["region"] = header.get("region", "Unknown")
				metadata["rom_size"] = header.get("rom_size", "Unknown")
				metadata["ram_size"] = header.get("ram_size", "Unknown")

		return metadata

	def _extract_snes_header(self, offset: int) -> Optional[Dict[str, Any]]:
		"""Extract SNES internal header"""
		if offset + 0x40 > len(self.rom_data):
			return None

		try:
			header_data = self.rom_data[offset : offset + 0x40]

			header = {
				"title": header_data[0:21].decode("ascii", errors="ignore").strip("\x00"),
				"rom_makeup": header_data[0x25],
				"rom_type": header_data[0x26],
				"rom_size": header_data[0x27],
				"ram_size": header_data[0x28],
				"country": header_data[0x29],
				"version": header_data[0x2b],
			}

			# Calculate checksums
			checksum = struct.unpack("<H", header_data[0x2e:0x30])[0]
			checksum_comp = struct.unpack("<H", header_data[0x2c:0x2e])[0]

			header["checksum"] = checksum
			header["checksum_complement"] = checksum_comp
			header["checksum_valid"] = (checksum ^ checksum_comp) == 0xffff

			return header

		except Exception:
			return None

	def _score_header(self, header: Optional[Dict[str, Any]]) -> int:
		"""Score header validity"""
		if not header:
			return 0

		score = 0

		# Title should be mostly printable
		title = header.get("title", "")
		if title:
			printable_ratio = sum(1 for c in title if c.isprintable()) / len(title)
			score += int(printable_ratio * 20)

		# ROM makeup should be valid
		makeup = header.get("rom_makeup", 0)
		if makeup in [0x20, 0x21, 0x30, 0x31]:
			score += 15

		# ROM size should be reasonable
		rom_size = header.get("rom_size", 0)
		if 7 <= rom_size <= 15:
			score += 10

		# Checksum should be valid
		if header.get("checksum_valid", False):
			score += 25

		return score

	def _analyze_data_structures(self) -> Dict[str, Any]:
		"""Analyze known data structures in the ROM"""
		structures_analysis = {}

		for structure_name, structure_info in self.dq3_structures.items():
			analysis = {
				"found": False,
				"location": None,
				"size": 0,
				"integrity": "unknown",
				"sub_structures": {},
			}

			# Check if structure exists at expected location
			base_offset = structure_info.get("base_offset")
			if base_offset and base_offset < len(self.rom_data):
				analysis["found"] = True
				analysis["location"] = base_offset

				# Analyze sub-structures if defined
				if "structure" in structure_info:
					for sub_name, sub_info in structure_info["structure"].items():
						sub_offset = base_offset + sub_info["offset"]
						sub_size = sub_info["size"]

						if sub_offset + sub_size <= len(self.rom_data):
							sub_data = self.rom_data[sub_offset : sub_offset + sub_size]

							analysis["sub_structures"][sub_name] = {
								"offset": sub_offset,
								"size": sub_size,
								"data_preview": sub_data[:8].hex(),
								"entropy": self._calculate_entropy(sub_data),
							}

				# Calculate total size
				if "count" in structure_info and "size_each" in structure_info:
					analysis["size"] = structure_info["count"] * structure_info["size_each"]
				elif "count" in structure_info:
					# Variable size structure - estimate
					analysis["size"] = self._estimate_structure_size(base_offset, structure_info)

			structures_analysis[structure_name] = analysis

		return structures_analysis

	def _calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""
		if not data:
			return 0.0

		frequencies = {}
		for byte in data:
			frequencies[byte] = frequencies.get(byte, 0) + 1

		entropy = 0.0
		data_len = len(data)

		for count in frequencies.values():
			probability = count / data_len
			if probability > 0:
				entropy -= probability * (probability.bit_length() - 1)

		return min(entropy, 8.0)	# Cap at 8 bits

	def _estimate_structure_size(self, offset: int, structure_info: Dict[str, Any]) -> int:
		"""Estimate size of variable-length structure"""
		if "terminator" in structure_info:
			terminator = structure_info["terminator"]
			size = 0
			pos = offset

			while pos < len(self.rom_data) and size < 0x10000:	# Safety limit
				if self.rom_data[pos] == terminator:
					return size + 1
				size += 1
				pos += 1

		return 0

	def _analyze_compression_usage(self) -> Dict[str, Any]:
		"""Analyze compression usage throughout ROM"""
		compression_analysis = {
			"total_compressed_regions": 0,
			"compression_algorithms": {},
			"compression_ratio": 0.0,
			"regions": [],
		}

		if not self.compression_engine:
			compression_analysis["error"] = "Compression engine not available"
			return compression_analysis

		# Scan ROM in chunks looking for compressed data
		chunk_size = 0x1000	# 4KB chunks
		total_original = 0
		total_compressed = 0

		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size // 2):
			chunk = self.rom_data[offset : offset + chunk_size]

			# Test compression algorithms
			for algorithm in ["basic_ring400", "simple_tail_window"]:
				try:
					compressed, stats = self.compression_engine.compress(chunk, algorithm)

					if stats.compression_ratio < 0.8:	# Good compression
						compression_analysis["regions"].append(
							{
								"offset": offset,
								"size": chunk_size,
								"algorithm": algorithm,
								"ratio": stats.compression_ratio,
								"savings": len(chunk) - len(compressed),
							}
						)

						algorithm_stats = compression_analysis["compression_algorithms"].setdefault(
							algorithm,
							{"regions": 0, "total_savings": 0, "avg_ratio": 0.0},
						)

						algorithm_stats["regions"] += 1
						algorithm_stats["total_savings"] += len(chunk) - len(compressed)

						total_original += len(chunk)
						total_compressed += len(compressed)

						break	# Use first algorithm that compresses well

				except Exception:
					continue

		compression_analysis["total_compressed_regions"] = len(compression_analysis["regions"])

		if total_original > 0:
			compression_analysis["compression_ratio"] = total_compressed / total_original

		# Calculate average ratios for each algorithm
		for algorithm, stats in compression_analysis["compression_algorithms"].items():
			if stats["regions"] > 0:
				total_original_algo = sum(
					r["size"] for r in compression_analysis["regions"] if r["algorithm"] == algorithm
				)
				total_compressed_algo = sum(
					r["size"] * r["ratio"] for r in compression_analysis["regions"] if r["algorithm"] == algorithm
				)
				stats["avg_ratio"] = total_compressed_algo / total_original_algo if total_original_algo > 0 else 0.0

		return compression_analysis

	def _find_optimization_opportunities(self) -> List[ROMOptimization]:
		"""Find optimization opportunities in ROM"""
		optimizations = []

		# Look for duplicate data
		duplicate_regions = self._find_duplicate_regions()
		for region in duplicate_regions:
			optimizations.append(
				ROMOptimization(
					optimization_type="duplicate_removal",
					location=region["offset"],
					size=region["size"],
					description=f"Duplicate data block found at 0x{region['offset']:08X}",
					potential_savings=region["size"],
					implementation_difficulty="medium",
					side_effects=[
						"Requires pointer updates",
						"May affect compatibility",
					],
				)
			)

		# Look for inefficient compression
		if self.compression_engine:
			inefficient_regions = self._find_inefficient_compression()
			for region in inefficient_regions:
				optimizations.append(
					ROMOptimization(
						optimization_type="compression_improvement",
						location=region["offset"],
						size=region["size"],
						description=f"Poor compression efficiency at 0x{region['offset']:08X}",
						potential_savings=region["potential_savings"],
						implementation_difficulty="hard",
						side_effects=[
							"Requires decompression logic update",
							"May break existing tools",
						],
					)
				)

		# Look for unused space
		unused_regions = self._find_unused_space()
		for region in unused_regions:
			if region["size"] > 0x100:	# Only report significant unused space
				optimizations.append(
					ROMOptimization(
						optimization_type="space_reclamation",
						location=region["offset"],
						size=region["size"],
						description=f"Unused space block at 0x{region['offset']:08X}",
						potential_savings=0,	# No direct savings, but space for new features
						implementation_difficulty="easy",
						side_effects=[],
					)
				)

		self.optimization_opportunities = optimizations
		return optimizations

	def _find_duplicate_regions(self) -> List[Dict[str, Any]]:
		"""Find duplicate data regions in ROM"""
		duplicates = []
		block_size = 0x100	# 256 byte blocks
		seen_blocks = {}

		for offset in range(0, len(self.rom_data) - block_size, block_size):
			block = self.rom_data[offset : offset + block_size]
			block_hash = hashlib.md5(block).hexdigest()

			if block_hash in seen_blocks:
				# Found duplicate
				original_offset = seen_blocks[block_hash]
				duplicates.append(
					{
						"offset": offset,
						"size": block_size,
						"duplicate_of": original_offset,
						"hash": block_hash,
					}
				)
			else:
				seen_blocks[block_hash] = offset

		return duplicates

	def _find_inefficient_compression(self) -> List[Dict[str, Any]]:
		"""Find regions with poor compression efficiency"""
		inefficient = []

		if not self.compression_engine:
			return inefficient

		chunk_size = 0x800	# 2KB chunks

		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size):
			chunk = self.rom_data[offset : offset + chunk_size]

			# Test current compression vs alternatives
			best_ratio = 1.0
			best_algorithm = None

			for algorithm in ["basic_ring400", "simple_tail_window", "huffman_dialog"]:
				try:
					compressed, stats = self.compression_engine.compress(chunk, algorithm)
					if stats.compression_ratio < best_ratio:
						best_ratio = stats.compression_ratio
						best_algorithm = algorithm
				except Exception:
					continue

			# If we can achieve significant compression improvement
			if best_ratio < 0.7:	# 30% or better compression
				current_entropy = self._calculate_entropy(chunk)
				potential_savings = int(len(chunk) * (1 - best_ratio))

				inefficient.append(
					{
						"offset": offset,
						"size": chunk_size,
						"current_entropy": current_entropy,
						"best_algorithm": best_algorithm,
						"best_ratio": best_ratio,
						"potential_savings": potential_savings,
					}
				)

		return inefficient

	def _find_unused_space(self) -> List[Dict[str, Any]]:
		"""Find unused/empty space in ROM"""
		unused_regions = []
		current_region = None

		for i in range(len(self.rom_data)):
			byte = self.rom_data[i]

			# Common unused byte patterns
			is_unused = byte in [0x00, 0xff] or (byte == 0xea)	# NOP instruction

			if is_unused:
				if current_region is None:
					current_region = {"start": i, "pattern": byte}
				elif current_region["pattern"] == byte:
					continue	# Extend current region
				else:
					# End current region, start new one
					unused_regions.append(
						{
							"offset": current_region["start"],
							"size": i - current_region["start"],
							"pattern": current_region["pattern"],
						}
					)
					current_region = {"start": i, "pattern": byte}
			else:
				if current_region is not None:
					# End current unused region
					unused_regions.append(
						{
							"offset": current_region["start"],
							"size": i - current_region["start"],
							"pattern": current_region["pattern"],
						}
					)
					current_region = None

		# Handle region at end of ROM
		if current_region is not None:
			unused_regions.append(
				{
					"offset": current_region["start"],
					"size": len(self.rom_data) - current_region["start"],
					"pattern": current_region["pattern"],
				}
			)

		return unused_regions

	def _validate_rom_integrity(self) -> Dict[str, Any]:
		"""Validate ROM integrity and consistency"""
		integrity = {
			"checksum_valid": False,
			"header_consistent": False,
			"data_structures_valid": False,
			"compression_valid": False,
			"issues": [],
		}

		# Check internal checksum
		metadata = self.analysis_cache.get("metadata", self._analyze_rom_metadata())

		if "checksum_valid" in metadata:
			integrity["checksum_valid"] = metadata["checksum_valid"]
			if not integrity["checksum_valid"]:
				integrity["issues"].append("Internal ROM checksum validation failed")

		# Validate data structures
		structures = self.analysis_cache.get("data_structures", self._analyze_data_structures())
		valid_structures = sum(1 for s in structures.values() if s.get("found", False))
		total_structures = len(structures)

		integrity["data_structures_valid"] = valid_structures > (total_structures * 0.7)
		if not integrity["data_structures_valid"]:
			integrity["issues"].append(f"Only {valid_structures}/{total_structures} data structures found")

		# Check for corruption indicators
		corruption_indicators = self._detect_corruption_indicators()
		if corruption_indicators:
			integrity["issues"].extend(corruption_indicators)

		return integrity

	def _detect_corruption_indicators(self) -> List[str]:
		"""Detect potential corruption in ROM data"""
		indicators = []

		# Check for excessive runs of same byte
		max_run_length = 0
		current_run = 1
		prev_byte = None

		for byte in self.rom_data[:0x10000]:	# Check first 64KB
			if byte == prev_byte:
				current_run += 1
				max_run_length = max(max_run_length, current_run)
			else:
				current_run = 1
				prev_byte = byte

		if max_run_length > 0x1000:	# More than 4KB of same byte
			indicators.append(f"Excessive byte run detected: {max_run_length} bytes")

		# Check for invalid instruction sequences (simplified)
		invalid_instructions = 0
		for i in range(0, min(len(self.rom_data), 0x10000), 2):
			if i + 1 < len(self.rom_data):
				# Check for invalid 65816 opcodes (simplified)
				opcode = self.rom_data[i]
				if opcode in [0x02, 0x03, 0x0b, 0x0f]:	# Some undefined opcodes
					invalid_instructions += 1

		if invalid_instructions > 100:	# Threshold for concern
			indicators.append(f"High number of invalid instructions: {invalid_instructions}")

		return indicators

	def _analyze_modification_potential(self) -> Dict[str, Any]:
		"""Analyze potential for ROM modifications"""
		modification_analysis = {
			"expansion_possible": False,
			"expansion_space": 0,
			"safe_modification_zones": [],
			"risky_zones": [],
			"recommended_approaches": [],
		}

		# Check for expansion space
		unused_regions = self._find_unused_space()
		total_unused = sum(r["size"] for r in unused_regions if r["size"] > 0x100)

		modification_analysis["expansion_space"] = total_unused
		modification_analysis["expansion_possible"] = total_unused > 0x10000	# 64KB threshold

		# Identify safe modification zones
		for region in unused_regions:
			if region["size"] > 0x1000:	# 4KB or larger
				modification_analysis["safe_modification_zones"].append(
					{
						"offset": region["offset"],
						"size": region["size"],
						"reason": "Large unused space",
					}
				)

		# Identify risky zones (critical data structures)
		for name, structure in self.dq3_structures.items():
			if structure.get("base_offset"):
				modification_analysis["risky_zones"].append(
					{
						"offset": structure["base_offset"],
						"size": structure.get("count", 1) * structure.get("size_each", 0x100),
						"name": name,
						"reason": "Critical game data structure",
					}
				)

		# Generate recommendations
		if modification_analysis["expansion_possible"]:
			modification_analysis["recommended_approaches"].append(
				"Use unused space for expansions rather than overwriting existing data"
			)

		if self.compression_engine:
			modification_analysis["recommended_approaches"].append(
				"Implement compression for graphics and text to free up space"
			)

		modification_analysis["recommended_approaches"].append(
			"Create IPS patches for compatibility with existing tools"
		)

		return modification_analysis

	def _create_performance_profile(self) -> Dict[str, Any]:
		"""Create performance profile for ROM operations"""
		profile = {
			"data_access_patterns": {},
			"compression_performance": {},
			"optimization_impact": {},
			"bottlenecks": [],
		}

		# Analyze data access patterns
		high_entropy_regions = []
		low_entropy_regions = []

		chunk_size = 0x1000
		for offset in range(0, len(self.rom_data) - chunk_size, chunk_size):
			chunk = self.rom_data[offset : offset + chunk_size]
			entropy = self._calculate_entropy(chunk)

			if entropy > 7.0:
				high_entropy_regions.append({"offset": offset, "entropy": entropy})
			elif entropy < 2.0:
				low_entropy_regions.append({"offset": offset, "entropy": entropy})

		profile["data_access_patterns"] = {
			"high_entropy_regions": len(high_entropy_regions),
			"low_entropy_regions": len(low_entropy_regions),
			"entropy_distribution": {
				"high_entropy_sample": high_entropy_regions[:5],
				"low_entropy_sample": low_entropy_regions[:5],
			},
		}

		# Estimate compression performance impact
		if self.compression_engine:
			total_potential_savings = sum(opt.potential_savings for opt in self.optimization_opportunities)
			profile["compression_performance"] = {
				"potential_space_savings": total_potential_savings,
				"compression_overhead_estimate": "Low to medium",
				"decompression_speed_impact": "Minimal for SimpleTailWindow, Medium for Huffman",
			}

		return profile

	def generate_comprehensive_report(self) -> str:
		"""Generate human-readable comprehensive analysis report"""
		if "deep_analysis" not in self.analysis_cache:
			self.perform_deep_analysis()

		analysis = self.analysis_cache["deep_analysis"]

		report = f"""
# Advanced ROM Analysis Report
## File: {self.rom_path.name}
### Generated: {analysis['timestamp']}
### Analysis Time: {analysis['analysis_time']:.2f} seconds

## ROM Metadata
- **Size**: {analysis['metadata']['file_size']:,} bytes
- **Type**: {analysis['metadata']['rom_type']}
- **Mapping**: {analysis['metadata']['mapping_mode']}
- **Checksum**: {analysis['metadata']['checksum'][:8]}...

## Data Structures Analysis
"""

		structures = analysis["data_structures"]
		found_structures = [name for name, data in structures.items() if data["found"]]

		report += f"- **Structures Found**: {len(found_structures)}/{len(structures)}\n"
		for name in found_structures:
			data = structures[name]
			report += f"	- `{name}`: 0x{data['location']:08X} ({data['size']} bytes)\n"

		report += f"\n## Compression Analysis\n"
		compression = analysis["compression_analysis"]

		if "error" not in compression:
			report += f"- **Compressed Regions**: {compression['total_compressed_regions']}\n"
			report += f"- **Overall Compression Ratio**: {compression['compression_ratio']:.2f}\n"

			for algorithm, stats in compression["compression_algorithms"].items():
				report += f"	- `{algorithm}`: {stats['regions']} regions, {stats['total_savings']:,} bytes saved\n"
		else:
			report += f"- **Error**: {compression['error']}\n"

		report += f"\n## Optimization Opportunities\n"
		optimizations = analysis["optimization_opportunities"]

		if optimizations:
			report += f"- **Total Opportunities**: {len(optimizations)}\n"

			by_type = {}
			for opt in optimizations:
				opt_type = opt.optimization_type
				by_type[opt_type] = by_type.get(opt_type, 0) + 1

			for opt_type, count in by_type.items():
				total_savings = sum(opt.potential_savings for opt in optimizations if opt.optimization_type == opt_type)
				report += f"	- `{opt_type}`: {count} opportunities, {total_savings:,} bytes potential savings\n"
		else:
			report += "- **No significant optimization opportunities found**\n"

		report += f"\n## Integrity Validation\n"
		integrity = analysis["integrity_validation"]

		report += f"- **Checksum Valid**: {integrity['checksum_valid']}\n"
		report += f"- **Data Structures Valid**: {integrity['data_structures_valid']}\n"

		if integrity["issues"]:
			report += f"- **Issues Found**:\n"
			for issue in integrity["issues"]:
				report += f"	- {issue}\n"
		else:
			report += f"- **No integrity issues detected**\n"

		report += f"\n## Modification Potential\n"
		modification = analysis["modification_potential"]

		report += f"- **Expansion Possible**: {modification['expansion_possible']}\n"
		report += f"- **Available Space**: {modification['expansion_space']:,} bytes\n"
		report += f"- **Safe Zones**: {len(modification['safe_modification_zones'])}\n"
		report += f"- **Risky Zones**: {len(modification['risky_zones'])}\n"

		if modification["recommended_approaches"]:
			report += f"- **Recommendations**:\n"
			for rec in modification["recommended_approaches"]:
				report += f"	- {rec}\n"

		return report

	def save_analysis_results(self, output_dir: Path):
		"""Save detailed analysis results to files"""
		output_dir.mkdir(exist_ok=True)

		# Save comprehensive report
		report_file = output_dir / f"{self.rom_path.stem}_analysis_report.md"
		with open(report_file, "w", encoding="utf-8") as f:
			f.write(self.generate_comprehensive_report())

		# Save detailed JSON data
		json_file = output_dir / f"{self.rom_path.stem}_analysis_data.json"
		with open(json_file, "w", encoding="utf-8") as f:
			# Convert optimization objects to dicts for JSON serialization
			analysis_copy = dict(self.analysis_cache["deep_analysis"])
			analysis_copy["optimization_opportunities"] = [
				{
					"optimization_type": opt.optimization_type,
					"location": opt.location,
					"size": opt.size,
					"description": opt.description,
					"potential_savings": opt.potential_savings,
					"implementation_difficulty": opt.implementation_difficulty,
					"side_effects": opt.side_effects,
				}
				for opt in analysis_copy["optimization_opportunities"]
			]
			json.dump(analysis_copy, f, indent=2, ensure_ascii=False)

		print(f"Analysis results saved to: {output_dir}")
		print(f"	- Report: {report_file}")
		print(f"	- Data: {json_file}")


def create_advanced_rom_analyzer(rom_path: str) -> AdvancedROMAnalyzer:
	"""Create and configure advanced ROM analyzer"""
	rom_file = Path(rom_path)

	if not rom_file.exists():
		raise FileNotFoundError(f"ROM file not found: {rom_path}")

	return AdvancedROMAnalyzer(rom_file)


if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Advanced ROM Analysis and Utilities")
	parser.add_argument("rom_path", help="Path to ROM file")
	parser.add_argument("--output", "-o", help="Output directory for results")
	parser.add_argument("--deep-analysis", action="store_true", help="Perform deep structural analysis")
	parser.add_argument(
		"--find-optimizations",
		action="store_true",
		help="Find optimization opportunities",
	)
	parser.add_argument("--generate-report", action="store_true", help="Generate comprehensive report")

	args = parser.parse_args()

	# Create analyzer
	analyzer = create_advanced_rom_analyzer(args.rom_path)

	print(f"Advanced ROM analysis of: {args.rom_path}")
	print("=" * 60)

	if args.deep_analysis or not any([args.find_optimizations, args.generate_report]):
		print("Performing deep analysis...")
		analysis_results = analyzer.perform_deep_analysis()

		print(f"✅ Analysis complete in {analysis_results['analysis_time']:.2f} seconds")
		print(f"📊 Found {len(analysis_results['data_structures'])} data structures")
		print(f"🗜️	Found {len(analysis_results['optimization_opportunities'])} optimization opportunities")

	if args.find_optimizations:
		print("\nFinding optimization opportunities...")
		optimizations = analyzer._find_optimization_opportunities()

		for opt in optimizations[:5]:	# Show top 5
			print(f"	- {opt.optimization_type} at 0x{opt.location:08X}: {opt.description}")

	if args.generate_report:
		print("\nGenerating comprehensive report...")
		report = analyzer.generate_comprehensive_report()

		if args.output:
			output_dir = Path(args.output)
			analyzer.save_analysis_results(output_dir)
		else:
			print(report)

	print("\n✅ Advanced ROM analysis complete!")
