#!/usr/bin/env python3
"""
Dragon Quest III Comprehensive Code Analyzer
Integrates multiple analysis systems for complete ROM understanding
"""

import sys
import struct
import json
from pathlib import Path
from typing import Dict, List, Any, Optional, Set, Tuple
from dataclasses import dataclass, field, asdict
from enum import Enum
import gzip
import re

sys.path.append(str(Path(__file__).parent.parent / "disassembly"))
try:
	from diz_parser import DiztinguishParser
	from snes_disasm import SNES65816Disassembler, Function, Instruction
except ImportError:
	print("Warning: Could not import disassembly modules")
	DiztinguishParser = None
	SNES65816Disassembler = None


class AnalysisLevel(Enum):
	"""Analysis depth levels"""

	BASIC = "basic"
	INTERMEDIATE = "intermediate"
	COMPREHENSIVE = "comprehensive"
	EXHAUSTIVE = "exhaustive"


@dataclass
class GameSystem:
	"""Represents a game system/module"""

	name: str
	description: str
	start_address: int
	end_address: int
	banks: List[int]
	functions: List[str] = field(default_factory=list)
	data_structures: List[str] = field(default_factory=list)
	variables: Dict[str, int] = field(default_factory=dict)
	documentation: str = ""
	completion_percentage: float = 0.0


@dataclass
class MemoryMap:
	"""Memory layout documentation"""

	address: int
	size: int
	name: str
	description: str
	access_type: str	# "r", "w", "rw", "x"
	data_type: str	# "code", "data", "graphics", "audio", "text"
	bank: int = 0

	@property
	def end_address(self) -> int:
		return self.address + self.size - 1


@dataclass
class DataStructure:
	"""Documented data structure"""

	name: str
	address: int
	size: int
	fields: Dict[str, Dict[str, Any]] = field(default_factory=dict)
	description: str = ""
	instances: List[int] = field(default_factory=list)


@dataclass
class ProgressTracker:
	"""Track analysis progress across different areas"""

	total_bytes: int
	analyzed_bytes: int = 0
	functions_found: int = 0
	functions_analyzed: int = 0
	data_structures_found: int = 0
	data_structures_documented: int = 0
	graphics_extracted: int = 0
	audio_extracted: int = 0
	text_blocks_found: int = 0

	@property
	def completion_percentage(self) -> float:
		if self.total_bytes == 0:
			return 0.0
		return (self.analyzed_bytes / self.total_bytes) * 100.0

	def to_dict(self) -> Dict[str, Any]:
		return {
			"total_bytes": self.total_bytes,
			"analyzed_bytes": self.analyzed_bytes,
			"completion_percentage": self.completion_percentage,
			"functions": {
				"found": self.functions_found,
				"analyzed": self.functions_analyzed,
				"percentage": (self.functions_analyzed / max(self.functions_found, 1)) * 100,
			},
			"data_structures": {
				"found": self.data_structures_found,
				"documented": self.data_structures_documented,
				"percentage": (self.data_structures_documented / max(self.data_structures_found, 1)) * 100,
			},
			"assets": {
				"graphics_extracted": self.graphics_extracted,
				"audio_extracted": self.audio_extracted,
				"text_blocks_found": self.text_blocks_found,
			},
		}


class DQ3Analyzer:
	"""Master analyzer for Dragon Quest III"""

	def __init__(self, rom_path: str, diz_path: Optional[str] = None):
		self.rom_path = Path(rom_path)
		self.diz_path = Path(diz_path) if diz_path else None

		# Initialize core components
		self.disassembler = self._load_disassembler()
		self.diz_parser = self._load_diz_parser()

		# Analysis state
		self.game_systems: Dict[str, GameSystem] = {}
		self.memory_map: List[MemoryMap] = []
		self.data_structures: Dict[str, DataStructure] = {}
		self.progress = ProgressTracker(total_bytes=self.disassembler.rom_size)

		# Initialize game-specific systems
		self._initialize_dq3_systems()

	def _load_disassembler(self) -> SNES65816Disassembler:
		"""Load SNES disassembler"""
		print(f"🎮 Loading ROM: {self.rom_path.name}")

		with open(self.rom_path, "rb") as f:
			rom_data = f.read()

		# Remove header if present
		if len(rom_data) % 1024 == 512:
			print("	 📦 Removing 512-byte header")
			rom_data = rom_data[512:]

		return SNES65816Disassembler(rom_data)

	def _load_diz_parser(self) -> Optional[DiztinguishParser]:
		"""Load DiztinGUIsh parser if available"""
		if not self.diz_path or not self.diz_path.exists():
			return None

		print(f"📁 Loading .diz project: {self.diz_path.name}")

		try:
			parser = DiztinguishParser()
			parser.parse_file(str(self.diz_path))
			return parser
		except Exception as e:
			print(f"⚠️ Warning: Could not load .diz file: {e}")
			return None

	def _initialize_dq3_systems(self):
		"""Initialize Dragon Quest III specific game systems"""

		# Define major game systems based on Dragon Quest III architecture
		systems = [
			GameSystem(
				name="SystemCore",
				description="Core system initialization, interrupt handlers, and main loop",
				start_address=0x8000,
				end_address=0xffff,
				banks=[0],
				documentation="Handles system startup, IRQ/NMI processing, and main game loop",
			),
			GameSystem(
				name="BattleEngine",
				description="Combat system, AI, damage calculations, and battle UI",
				start_address=0x8000,
				end_address=0xffff,
				banks=[1, 2, 3],
				documentation="Complete battle system implementation including turn order, spells, and AI",
			),
			GameSystem(
				name="WorldEngine",
				description="Overworld navigation, collision detection, and map management",
				start_address=0x8000,
				end_address=0xffff,
				banks=[4, 5],
				documentation="Handles world map movement, transitions, and collision systems",
			),
			GameSystem(
				name="MenuSystem",
				description="UI management, inventory, character status, and save/load",
				start_address=0x8000,
				end_address=0xffff,
				banks=[6, 7],
				documentation="Complete menu interface including item management and character progression",
			),
			GameSystem(
				name="TextEngine",
				description="Dialog system, text rendering, and script processing",
				start_address=0x8000,
				end_address=0xffff,
				banks=[8, 9, 10],
				documentation="Text display engine with compression and variable-width font support",
			),
			GameSystem(
				name="AudioEngine",
				description="Music playback, sound effects, and audio streaming",
				start_address=0x8000,
				end_address=0xffff,
				banks=[11, 12],
				documentation="Audio system with instrument samples and music sequencing",
			),
			GameSystem(
				name="GraphicsEngine",
				description="Sprite rendering, background processing, and visual effects",
				start_address=0x8000,
				end_address=0xffff,
				banks=[13, 14, 15],
				documentation="Graphics rendering pipeline with sprite management and effects",
			),
			GameSystem(
				name="SaveSystem",
				description="Game state persistence, SRAM management, and data validation",
				start_address=0x8000,
				end_address=0xffff,
				banks=[16],
				documentation="Save/load system with checksum validation and state management",
			),
			GameSystem(
				name="GameData",
				description="Static game data including items, spells, monsters, and maps",
				start_address=0x8000,
				end_address=0xffff,
				banks=[17, 18, 19, 20, 21, 22],
				documentation="All game content data tables and configuration",
			),
		]

		for system in systems:
			self.game_systems[system.name] = system

	def analyze_interrupt_vectors(self) -> Dict[str, Any]:
		"""Analyze SNES interrupt vector table"""
		print("🔍 Analyzing interrupt vectors...")

		vectors = {
			"native_mode": {
				0xffe4: "COP",
				0xffe6: "BRK",
				0xffe8: "ABORT",
				0xffea: "NMI",
				0xffec: "UNUSED",
				0xffee: "IRQ",
			},
			"emulation_mode": {
				0xfff4: "COP",
				0xfff6: "UNUSED",
				0xfff8: "ABORT",
				0xfffa: "NMI",
				0xfffc: "RESET",
				0xfffe: "IRQ",
			},
		}

		vector_analysis = {}

		for mode, vector_map in vectors.items():
			vector_analysis[mode] = {}

			for vector_addr, vector_name in vector_map.items():
				rom_offset = self.disassembler.snes_to_rom_offset(vector_addr, 0)

				if rom_offset and rom_offset + 1 < self.disassembler.rom_size:
					target_addr = struct.unpack("<H", self.disassembler.rom_data[rom_offset : rom_offset + 2])[0]

					# Analyze the handler function
					handler_function = self.disassembler.analyze_function(target_addr, 0)

					vector_analysis[mode][vector_name] = {
						"vector_address": f"${vector_addr:04X}",
						"handler_address": f"${target_addr:04X}",
						"handler_function": handler_function.name if handler_function else None,
						"handler_type": handler_function.function_type if handler_function else "unknown",
						"handler_size": handler_function.size if handler_function else 0,
					}

		return vector_analysis

	def analyze_banking_system(self) -> Dict[str, Any]:
		"""Comprehensive banking system analysis"""
		print("🏦 Analyzing SNES banking system...")

		banking_info = {
			"rom_type": self.disassembler.bank_map[0]["type"],
			"total_banks": len(self.disassembler.bank_map),
			"rom_size": self.disassembler.rom_size,
			"banks": {},
		}

		for bank_num, bank_info in self.disassembler.bank_map.items():
			# Analyze bank content in more detail
			content_analysis = self._analyze_bank_content(bank_num, bank_info)

			banking_info["banks"][f"${bank_num:02X}"] = {
				"rom_offset": f"${bank_info['rom_offset']:06X}",
				"snes_range": f"${bank_info['snes_start']:04X}-${bank_info['snes_end']:04X}",
				"size": bank_info["size"],
				"description": bank_info["description"],
				"content_analysis": content_analysis,
			}

		return banking_info

	def _analyze_bank_content(self, bank_num: int, bank_info: Dict[str, Any]) -> Dict[str, Any]:
		"""Detailed analysis of bank content"""
		rom_offset = bank_info["rom_offset"]
		bank_size = min(bank_info["size"], self.disassembler.rom_size - rom_offset)

		if bank_size <= 0:
			return {"type": "empty", "confidence": 1.0}

		# Sample bank content for analysis
		sample_size = min(0x1000, bank_size)	# Analyze first 4KB
		sample_data = self.disassembler.rom_data[rom_offset : rom_offset + sample_size]

		analysis = {
			"code_density": 0.0,
			"graphics_probability": 0.0,
			"text_probability": 0.0,
			"audio_probability": 0.0,
			"patterns": [],
			"functions_detected": 0,
		}

		# Code density analysis
		valid_opcodes = 0
		for byte in sample_data:
			if byte in self.disassembler.instruction_table:
				valid_opcodes += 1

		analysis["code_density"] = valid_opcodes / len(sample_data)

		# Pattern detection
		analysis["graphics_probability"] = self.disassembler._detect_graphics_patterns(sample_data)
		analysis["text_probability"] = self.disassembler._detect_text_patterns(sample_data)
		analysis["audio_probability"] = 1.0 if self.disassembler._detect_audio_patterns(sample_data) else 0.0

		# Function detection in this bank
		if bank_num < 0x40:	# Only analyze reasonable bank numbers
			try:
				entry_points = self._find_bank_entry_points(bank_num)
				analysis["functions_detected"] = len(entry_points)

				for addr, name in entry_points:
					function = self.disassembler.analyze_function(addr, bank_num)
					if function:
						analysis["patterns"].append(f"Function: {function.name} ({function.function_type})")

			except Exception as e:
				analysis["patterns"].append(f"Analysis error: {str(e)}")

		return analysis

	def _find_bank_entry_points(self, bank_num: int) -> List[Tuple[int, str]]:
		"""Find potential function entry points in a specific bank"""
		entry_points = []

		bank_info = self.disassembler.bank_map.get(bank_num)
		if not bank_info:
			return entry_points

		# Search for JSR/JSL patterns that target this bank
		search_start = bank_info["snes_start"]
		search_end = min(bank_info["snes_end"], search_start + 0x1000)	# Limit search

		rom_offset = bank_info["rom_offset"]
		search_size = min(search_end - search_start, self.disassembler.rom_size - rom_offset)

		if search_size <= 0:
			return entry_points

		data = self.disassembler.rom_data[rom_offset : rom_offset + search_size]

		# Look for common function entry patterns
		for i in range(len(data) - 2):
			addr = search_start + i

			# Look for JSR targets (addresses referenced by JSR instructions)
			if data[i] == 0x20:	# JSR absolute
				if i + 2 < len(data):
					target = struct.unpack("<H", data[i + 1 : i + 3])[0]
					if search_start <= target <= search_end:
						entry_points.append((target, f"jsr_target_{target:04X}"))

			# Look for function prologues
			if data[i : i + 2] == b"\x8b\x48":	# PHB, PHA - common function start
				entry_points.append((addr, f"function_prologue_{addr:04X}"))

			elif data[i : i + 3] == b"\x08\xc2\x20":	# PHP, REP #$20 - 16-bit mode setup
				entry_points.append((addr, f"function_16bit_{addr:04X}"))

		return entry_points[:20]	# Limit to first 20 found

	def create_memory_map(self) -> List[MemoryMap]:
		"""Create comprehensive memory map documentation"""
		print("🗺️ Creating memory map...")

		memory_regions = []

		# System memory regions (RAM)
		system_regions = [
			MemoryMap(0x0000, 0x2000, "DirectPage", "Direct page and stack space", "rw", "data"),
			MemoryMap(0x2000, 0x6000, "SystemRAM", "System work RAM", "rw", "data"),
			MemoryMap(0x6000, 0x8000, "WorkRAM", "Game work RAM", "rw", "data"),
			MemoryMap(0x7e0000, 0x20000, "WRAM", "Additional work RAM", "rw", "data"),
			MemoryMap(0x2100, 0x100, "PPU", "Picture Processing Unit registers", "rw", "data"),
			MemoryMap(0x4000, 0x400, "Controllers", "Controller and system registers", "rw", "data"),
		]

		memory_regions.extend(system_regions)

		# ROM regions based on banking
		for bank_num, bank_info in self.disassembler.bank_map.items():
			if bank_num < 0x40:	# Focus on main ROM banks
				start_addr = (bank_num << 16) | bank_info["snes_start"]

				region = MemoryMap(
					address=start_addr,
					size=bank_info["size"],
					name=f"Bank${bank_num:02X}",
					description=bank_info["description"],
					access_type="rx",
					data_type=self._classify_memory_type(bank_info["description"]),
					bank=bank_num,
				)

				memory_regions.append(region)

		# Sort by address
		memory_regions.sort(key=lambda x: x.address)

		self.memory_map = memory_regions
		return memory_regions

	def _classify_memory_type(self, description: str) -> str:
		"""Classify memory region type from description"""
		description_lower = description.lower()

		if any(keyword in description_lower for keyword in ["code", "program", "system"]):
			return "code"
		elif any(keyword in description_lower for keyword in ["graphics", "sprite", "tile"]):
			return "graphics"
		elif any(keyword in description_lower for keyword in ["audio", "music", "sound"]):
			return "audio"
		elif any(keyword in description_lower for keyword in ["text", "dialog", "string"]):
			return "text"
		else:
			return "data"

	def generate_progress_report(self) -> Dict[str, Any]:
		"""Generate comprehensive progress report"""
		print("📊 Generating progress report...")

		# Update progress based on current analysis
		self._update_progress_metrics()

		report = {
			"overview": self.progress.to_dict(),
			"systems": {},
			"banking": {
				"total_banks": len(self.disassembler.bank_map),
				"analyzed_banks": sum(1 for system in self.game_systems.values() if system.functions),
				"completion": 0.0,
			},
			"functions": {"total": len(self.disassembler.functions), "by_type": {}, "by_bank": {}},
			"memory_map": {
				"total_regions": len(self.memory_map),
				"documented_regions": sum(1 for region in self.memory_map if region.description),
			},
		}

		# System progress
		for name, system in self.game_systems.items():
			report["systems"][name] = {
				"completion": system.completion_percentage,
				"functions": len(system.functions),
				"data_structures": len(system.data_structures),
				"banks": system.banks,
			}

		# Function analysis
		function_types = {}
		bank_functions = {}

		for function in self.disassembler.functions.values():
			# Count by type
			func_type = function.function_type
			function_types[func_type] = function_types.get(func_type, 0) + 1

			# Count by bank
			bank = function.bank
			bank_functions[bank] = bank_functions.get(bank, 0) + 1

		report["functions"]["by_type"] = function_types
		report["functions"]["by_bank"] = bank_functions

		return report

	def _update_progress_metrics(self):
		"""Update progress tracking metrics"""
		# Count analyzed bytes based on disassembled functions
		analyzed_bytes = 0
		for function in self.disassembler.functions.values():
			analyzed_bytes += function.size

		self.progress.analyzed_bytes = analyzed_bytes
		self.progress.functions_found = len(self.disassembler.functions)
		self.progress.functions_analyzed = len(
			[f for f in self.disassembler.functions.values() if f.function_type != "unknown"]
		)

	def export_analysis(self, output_dir: str, level: AnalysisLevel = AnalysisLevel.COMPREHENSIVE):
		"""Export complete analysis to files"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"💾 Exporting analysis to {output_path}")

		# Core analysis files
		analyses = {
			"vectors": self.analyze_interrupt_vectors(),
			"banking": self.analyze_banking_system(),
			"progress": self.generate_progress_report(),
		}

		for name, data in analyses.items():
			with open(output_path / f"dq3_{name}.json", "w") as f:
				json.dump(data, f, indent="\t", ensure_ascii=False)

		# Memory map
		memory_map_data = {"regions": [asdict(region) for region in self.memory_map]}

		with open(output_path / "dq3_memory_map.json", "w") as f:
			json.dump(memory_map_data, f, indent="\t")

		# Game systems documentation
		systems_data = {name: asdict(system) for name, system in self.game_systems.items()}

		with open(output_path / "dq3_systems.json", "w") as f:
			json.dump(systems_data, f, indent="\t")

		# Generate comprehensive report
		self._generate_analysis_report(output_path, analyses)

		print(f"✅ Analysis exported successfully")

	def _generate_analysis_report(self, output_path: Path, analyses: Dict[str, Any]):
		"""Generate human-readable analysis report"""
		report_lines = []

		# Header
		report_lines.extend(
			[
				"=" * 80,
				f"🐉 Dragon Quest III - Comprehensive Analysis Report",
				"=" * 80,
				f"ROM: {self.rom_path.name}",
				f"Size: {self.disassembler.rom_size:,} bytes",
				f"Banking: {analyses['banking']['rom_type']}",
				f"Analysis Date: {__import__('datetime').datetime.now().isoformat()}",
				"",
			]
		)

		# Progress overview
		progress = analyses["progress"]["overview"]
		report_lines.extend(
			[
				"📊 PROGRESS OVERVIEW",
				"-" * 40,
				f"Total Analysis: {progress['completion_percentage']:.1f}%",
				f"Bytes Analyzed: {progress['analyzed_bytes']:,} / {progress['total_bytes']:,}",
				f"Functions Found: {progress['functions']['found']} ({progress['functions']['percentage']:.1f}% analyzed)",
				f"Data Structures: {progress['data_structures']['found']} ({progress['data_structures']['percentage']:.1f}% documented)",
				"",
			]
		)

		# System breakdown
		report_lines.extend(["🎮 GAME SYSTEMS", "-" * 40])

		for name, system_info in analyses["progress"]["systems"].items():
			report_lines.append(
				f"{name:<20} {system_info['completion']:>6.1f}% "
				f"({system_info['functions']} functions, {len(system_info['banks'])} banks)"
			)

		report_lines.append("")

		# Banking analysis
		report_lines.extend(["🏦 BANKING SYSTEM", "-" * 40, f"Total Banks: {analyses['banking']['total_banks']}", ""])

		for bank_id, bank_info in list(analyses["banking"]["banks"].items())[:10]:
			report_lines.extend(
				[
					f"Bank {bank_id}:",
					f"	📍 SNES Range: {bank_info['snes_range']}",
					f"	💾 ROM Offset: {bank_info['rom_offset']}",
					f"	📝 Type: {bank_info['description']}",
					f"	🔍 Code Density: {bank_info['content_analysis']['code_density']:.2f}",
					"",
				]
			)

		# Interrupt vectors
		report_lines.extend(["⚡ INTERRUPT VECTORS", "-" * 40])

		for mode, vectors in analyses["vectors"].items():
			report_lines.append(f"{mode.upper()} Mode:")
			for vector_name, vector_info in vectors.items():
				report_lines.append(
					f"	{vector_name:<8} {vector_info['vector_address']} -> {vector_info['handler_address']} "
					f"({vector_info['handler_type']})"
				)
			report_lines.append("")

		# Write report
		with open(output_path / "dq3_analysis_report.txt", "w", encoding="utf-8") as f:
			f.write("\n".join(report_lines))


def main():
	"""Main analysis entry point"""
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III Comprehensive Analyzer")
	parser.add_argument("rom_file", help="Path to ROM file")
	parser.add_argument("--diz", help="Path to DiztinGUIsh project file")
	parser.add_argument("--output", "-o", default="analysis", help="Output directory")
	parser.add_argument(
		"--level",
		choices=["basic", "intermediate", "comprehensive", "exhaustive"],
		default="comprehensive",
		help="Analysis depth",
	)

	args = parser.parse_args()

	print("🐉 Dragon Quest III - Master Analyzer")
	print("=" * 50)

	# Create analyzer
	analyzer = DQ3Analyzer(args.rom_file, args.diz)

	# Create memory map
	analyzer.create_memory_map()

	# Run analysis and export
	analysis_level = AnalysisLevel(args.level)
	analyzer.export_analysis(args.output, analysis_level)

	print(f"\n🎯 Analysis complete! Check {args.output}/ for results")


if __name__ == "__main__":
	main()
