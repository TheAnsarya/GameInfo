#!/usr/bin/env python3
"""
Dragon Quest III - Complete Disassembly Automation System
=========================================================

Comprehensive automation for complete ROM disassembly with
GitHub workflow integration and continuous documentation.
"""

import os
import sys
import time
import json
from pathlib import Path
from typing import Dict, List, Tuple, Any
from dataclasses import dataclass

# Add tools to path
sys.path.append(str(Path(__file__).parent.parent))

from session.session_manager import DQ3SessionManager, GitHubIssue
from disassembly.snes_disasm import SNES65816Disassembler
from analysis.dq3_analyzer import DQ3Analyzer
from extraction.asset_extractor import DQ3AssetExtractor
from visualization.progress_tracker import DQ3ProgressTracker


@dataclass
class DisassemblyTarget:
	"""Represents a specific disassembly target"""

	name: str
	description: str
	start_address: int
	end_address: int
	bank: int
	priority: str	# "critical", "high", "medium", "low"
	target_type: str	# "code", "data", "graphics", "audio"
	dependencies: List[str] = None


class CompleteDisassemblyEngine:
	"""Master engine for complete ROM disassembly automation"""

	def __init__(self, repo_path: str, rom_path: str):
		self.repo_path = Path(repo_path)
		self.rom_path = Path(rom_path)

		# Initialize subsystems
		self.session_manager = DQ3SessionManager(str(self.repo_path))
		self.disassembler = SNES65816Disassembler(str(self.rom_path))
		self.analyzer = DQ3Analyzer(str(self.rom_path))
		self.asset_extractor = DQ3AssetExtractor(str(self.rom_path))
		self.progress_tracker = DQ3ProgressTracker()

		# Disassembly state
		self.completed_targets: List[str] = []
		self.current_progress = {
			"total_bytes_analyzed": 0,
			"functions_identified": 0,
			"data_structures_documented": 0,
			"assets_extracted": 0,
		}

		# Define comprehensive disassembly targets
		self.disassembly_targets = self._define_disassembly_targets()

		print("🚀 Complete Disassembly Engine Initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Repository: {self.repo_path}")
		print(f"	 Total targets: {len(self.disassembly_targets)}")

	def _define_disassembly_targets(self) -> List[DisassemblyTarget]:
		"""Define comprehensive disassembly targets for Dragon Quest III"""
		targets = [
			# Critical system components
			DisassemblyTarget(
				name="system_vectors",
				description="Interrupt vectors and system initialization",
				start_address=0x8000,
				end_address=0x8200,
				bank=0,
				priority="critical",
				target_type="code",
			),
			DisassemblyTarget(
				name="main_game_loop",
				description="Core game loop and frame processing",
				start_address=0x8200,
				end_address=0x8800,
				bank=0,
				priority="critical",
				target_type="code",
				dependencies=["system_vectors"],
			),
			DisassemblyTarget(
				name="vblank_handler",
				description="VBlank interrupt handler and timing",
				start_address=0x8800,
				end_address=0x8c00,
				bank=0,
				priority="critical",
				target_type="code",
				dependencies=["system_vectors"],
			),
			# Graphics system
			DisassemblyTarget(
				name="ppu_manager",
				description="PPU register management and graphics setup",
				start_address=0x20000,
				end_address=0x21000,
				bank=1,
				priority="high",
				target_type="code",
			),
			DisassemblyTarget(
				name="sprite_system",
				description="OAM management and sprite rendering",
				start_address=0x21000,
				end_address=0x22000,
				bank=1,
				priority="high",
				target_type="code",
				dependencies=["ppu_manager"],
			),
			DisassemblyTarget(
				name="tile_renderer",
				description="Background tile rendering system",
				start_address=0x22000,
				end_address=0x23000,
				bank=1,
				priority="high",
				target_type="code",
				dependencies=["ppu_manager"],
			),
			# Audio system
			DisassemblyTarget(
				name="spc_driver",
				description="SPC-700 audio driver communication",
				start_address=0x60000,
				end_address=0x61000,
				bank=3,
				priority="high",
				target_type="code",
			),
			DisassemblyTarget(
				name="music_engine",
				description="Music sequencing and playback",
				start_address=0x61000,
				end_address=0x63000,
				bank=3,
				priority="medium",
				target_type="code",
				dependencies=["spc_driver"],
			),
			# Battle system
			DisassemblyTarget(
				name="battle_init",
				description="Battle system initialization",
				start_address=0x40000,
				end_address=0x41000,
				bank=2,
				priority="high",
				target_type="code",
			),
			DisassemblyTarget(
				name="combat_engine",
				description="Combat calculations and damage formulas",
				start_address=0x41000,
				end_address=0x43000,
				bank=2,
				priority="high",
				target_type="code",
				dependencies=["battle_init"],
			),
			DisassemblyTarget(
				name="spell_system",
				description="Magic spell implementation",
				start_address=0x43000,
				end_address=0x44000,
				bank=2,
				priority="medium",
				target_type="code",
				dependencies=["combat_engine"],
			),
			DisassemblyTarget(
				name="monster_ai",
				description="Monster AI behavior system",
				start_address=0x44000,
				end_address=0x45000,
				bank=2,
				priority="medium",
				target_type="code",
				dependencies=["combat_engine"],
			),
			# Menu and UI system
			DisassemblyTarget(
				name="menu_renderer",
				description="Menu rendering and UI management",
				start_address=0x80000,
				end_address=0x81000,
				bank=4,
				priority="medium",
				target_type="code",
			),
			DisassemblyTarget(
				name="text_engine",
				description="Text rendering and dialog system",
				start_address=0x81000,
				end_address=0x82000,
				bank=4,
				priority="medium",
				target_type="code",
				dependencies=["menu_renderer"],
			),
			DisassemblyTarget(
				name="inventory_system",
				description="Inventory management and item handling",
				start_address=0x82000,
				end_address=0x83000,
				bank=4,
				priority="medium",
				target_type="code",
				dependencies=["menu_renderer"],
			),
			# Field system
			DisassemblyTarget(
				name="map_renderer",
				description="Overworld map rendering system",
				start_address=0xa0000,
				end_address=0xa1000,
				bank=5,
				priority="medium",
				target_type="code",
			),
			DisassemblyTarget(
				name="collision_system",
				description="Map collision detection",
				start_address=0xa1000,
				end_address=0xa2000,
				bank=5,
				priority="medium",
				target_type="code",
				dependencies=["map_renderer"],
			),
			DisassemblyTarget(
				name="npc_system",
				description="NPC behavior and interaction",
				start_address=0xa2000,
				end_address=0xa3000,
				bank=5,
				priority="low",
				target_type="code",
				dependencies=["map_renderer"],
			),
			# Data tables
			DisassemblyTarget(
				name="item_database",
				description="Item data tables and structures",
				start_address=0x500000,
				end_address=0x510000,
				bank=40,
				priority="high",
				target_type="data",
			),
			DisassemblyTarget(
				name="spell_database",
				description="Spell data and magic system tables",
				start_address=0x520000,
				end_address=0x530000,
				bank=41,
				priority="high",
				target_type="data",
			),
			DisassemblyTarget(
				name="monster_database",
				description="Monster statistics and behavior data",
				start_address=0x540000,
				end_address=0x550000,
				bank=42,
				priority="high",
				target_type="data",
			),
			DisassemblyTarget(
				name="class_database",
				description="Character class progression tables",
				start_address=0x560000,
				end_address=0x570000,
				bank=43,
				priority="medium",
				target_type="data",
			),
			# Graphics assets
			DisassemblyTarget(
				name="character_graphics",
				description="Player character sprite graphics",
				start_address=0x200000,
				end_address=0x210000,
				bank=16,
				priority="medium",
				target_type="graphics",
			),
			DisassemblyTarget(
				name="monster_graphics",
				description="Monster battle graphics",
				start_address=0x220000,
				end_address=0x240000,
				bank=17,
				priority="medium",
				target_type="graphics",
			),
			DisassemblyTarget(
				name="ui_graphics",
				description="Menu and UI graphics tiles",
				start_address=0x1a0000,
				end_address=0x1b0000,
				bank=13,
				priority="low",
				target_type="graphics",
			),
			# Audio assets
			DisassemblyTarget(
				name="music_data",
				description="Music track data and sequences",
				start_address=0x300000,
				end_address=0x320000,
				bank=24,
				priority="low",
				target_type="audio",
			),
			DisassemblyTarget(
				name="sound_samples",
				description="Audio samples and sound effects",
				start_address=0x320000,
				end_address=0x330000,
				bank=25,
				priority="low",
				target_type="audio",
			),
		]

		return targets

	def start_automated_disassembly(self):
		"""Begin the complete automated disassembly process"""
		print("\n🔥 STARTING COMPLETE DISASSEMBLY AUTOMATION")
		print("=" * 60)

		# Log session start
		self.session_manager.log_action(
			"disassembly_start", "Beginning complete Dragon Quest III disassembly automation"
		)

		# Create all GitHub issues
		self._create_all_issues()

		# Process targets by priority
		priority_order = ["critical", "high", "medium", "low"]

		for priority in priority_order:
			print(f"\n🎯 Processing {priority.upper()} priority targets...")

			priority_targets = [t for t in self.disassembly_targets if t.priority == priority]

			for target in priority_targets:
				self._process_disassembly_target(target)

		# Generate final analysis
		self._generate_final_analysis()

		print("\n✨ COMPLETE DISASSEMBLY AUTOMATION FINISHED")
		print("=" * 60)

	def _create_all_issues(self):
		"""Create GitHub issues for all disassembly targets"""
		print("\n📋 Creating GitHub issues for all targets...")

		# Create issues from session manager
		self.session_manager.create_disassembly_issues()

		# Save all issues
		for issue in self.session_manager.pending_issues:
			self.session_manager.save_issue_to_file(issue)

		# Commit issues to repository
		self.session_manager.commit_and_push("📋 Created comprehensive disassembly GitHub issues", ["logs/issues/"])

	def _process_disassembly_target(self, target: DisassemblyTarget):
		"""Process a single disassembly target with full automation"""
		print(f"\n🔍 Processing target: {target.name}")
		print(f"	 Type: {target.target_type} | Priority: {target.priority}")
		print(f"	 Range: ${target.start_address:06X} - ${target.end_address:06X}")

		# Check dependencies
		if target.dependencies:
			missing_deps = [dep for dep in target.dependencies if dep not in self.completed_targets]
			if missing_deps:
				print(f"⚠️	Skipping {target.name} - missing dependencies: {missing_deps}")
				return

		# Create branch for this target
		issue = GitHubIssue(
			title=f"🔧 Disassemble {target.name}",
			body=f"""## Target: {target.name}

**Description:** {target.description}
**Address Range:** ${target.start_address:06X} - ${target.end_address:06X}
**Bank:** {target.bank}
**Type:** {target.target_type}
**Priority:** {target.priority}

## Tasks
- [ ] Extract and disassemble target region
- [ ] Document functions and data structures
- [ ] Generate comprehensive analysis
- [ ] Create technical documentation

## Files to Create
- `disassembly/{target.name}.asm`
- `analysis/{target.name}_analysis.md`
- `documentation/{target.name}_spec.md`
""",
			labels=["disassembly", target.target_type, target.priority],
			project_column="In Progress",
		)

		branch_name = self.session_manager.create_branch_for_issue(issue)

		try:
			# Process based on target type
			if target.target_type == "code":
				self._disassemble_code_region(target)
			elif target.target_type == "data":
				self._analyze_data_region(target)
			elif target.target_type == "graphics":
				self._extract_graphics_assets(target)
			elif target.target_type == "audio":
				self._extract_audio_assets(target)

			# Format all files
			formatted_files = self.session_manager.format_all_files()

			# Commit changes
			commit_message = f"🔧 Complete analysis of {target.name} ({target.target_type})"
			self.session_manager.commit_and_push(commit_message)

			# Merge back to main
			self.session_manager.merge_and_cleanup_branch(branch_name, target.name)

			# Mark as completed
			self.completed_targets.append(target.name)

			print(f"✅ Completed target: {target.name}")

		except Exception as e:
			print(f"❌ Error processing {target.name}: {e}")
			# Switch back to main if error occurs
			import subprocess

			subprocess.run(["git", "checkout", "main"], cwd=self.repo_path)

	def _disassemble_code_region(self, target: DisassemblyTarget):
		"""Disassemble a code region with comprehensive analysis"""
		print(f"	 🔍 Disassembling code region...")

		# Extract region from ROM
		with open(self.rom_path, "rb") as f:
			f.seek(target.start_address)
			region_data = f.read(target.end_address - target.start_address)

		# Perform disassembly
		disasm_result = self.disassembler.disassemble_region(region_data, target.start_address, target.bank)

		# Create output directories
		disasm_dir = self.repo_path / "disassembly"
		analysis_dir = self.repo_path / "analysis"
		docs_dir = self.repo_path / "documentation"

		for dir_path in [disasm_dir, analysis_dir, docs_dir]:
			dir_path.mkdir(parents=True, exist_ok=True)

		# Generate assembly output
		asm_file = disasm_dir / f"{target.name}.asm"
		with open(asm_file, "w") as f:
			f.write(f"; Dragon Quest III - {target.description}\n")
			f.write(f"; Address Range: ${target.start_address:06X} - ${target.end_address:06X}\n")
			f.write(f"; Bank: {target.bank}\n")
			f.write(f"; Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
			f.write("\n")
			f.write(disasm_result["assembly"])

		# Generate analysis report
		analysis_file = analysis_dir / f"{target.name}_analysis.md"
		with open(analysis_file, "w") as f:
			f.write(self._generate_code_analysis_report(target, disasm_result))

		# Generate documentation
		doc_file = docs_dir / f"{target.name}_spec.md"
		with open(doc_file, "w") as f:
			f.write(self._generate_code_documentation(target, disasm_result))

		# Log progress
		self.session_manager.log_action(
			"disassembly_complete",
			f"Disassembled {target.name} - {len(disasm_result.get('functions', []))} functions found",
			[str(asm_file), str(analysis_file), str(doc_file)],
		)

		# Update progress tracking
		self.current_progress["functions_identified"] += len(disasm_result.get("functions", []))

	def _analyze_data_region(self, target: DisassemblyTarget):
		"""Analyze and document a data region"""
		print(f"	 📊 Analyzing data region...")

		# Extract and analyze data structures
		analysis_result = self.analyzer.analyze_data_region(target.start_address, target.end_address)

		# Create documentation
		docs_dir = self.repo_path / "documentation" / "data_structures"
		docs_dir.mkdir(parents=True, exist_ok=True)

		# Generate C header
		header_file = docs_dir / f"{target.name}.h"
		with open(header_file, "w") as f:
			f.write(self._generate_c_header(target, analysis_result))

		# Generate documentation
		doc_file = docs_dir / f"{target.name}.md"
		with open(doc_file, "w") as f:
			f.write(self._generate_data_documentation(target, analysis_result))

		self.session_manager.log_action(
			"data_analysis_complete", f"Analyzed data region {target.name}", [str(header_file), str(doc_file)]
		)

		self.current_progress["data_structures_documented"] += len(analysis_result.get("structures", []))

	def _extract_graphics_assets(self, target: DisassemblyTarget):
		"""Extract and document graphics assets"""
		print(f"	 🎨 Extracting graphics assets...")

		# Extract graphics using asset extractor
		assets_dir = self.repo_path / "assets" / "graphics" / target.name
		assets_dir.mkdir(parents=True, exist_ok=True)

		extracted_assets = self.asset_extractor.extract_graphics_region(
			target.start_address, target.end_address, str(assets_dir)
		)

		# Generate documentation
		doc_file = assets_dir / "README.md"
		with open(doc_file, "w") as f:
			f.write(self._generate_graphics_documentation(target, extracted_assets))

		self.session_manager.log_action(
			"graphics_extraction_complete",
			f"Extracted {len(extracted_assets)} graphics assets from {target.name}",
			[str(doc_file)],
		)

		self.current_progress["assets_extracted"] += len(extracted_assets)

	def _extract_audio_assets(self, target: DisassemblyTarget):
		"""Extract and document audio assets"""
		print(f"	 🎵 Extracting audio assets...")

		# Extract audio using asset extractor
		assets_dir = self.repo_path / "assets" / "audio" / target.name
		assets_dir.mkdir(parents=True, exist_ok=True)

		extracted_assets = self.asset_extractor.extract_audio_region(
			target.start_address, target.end_address, str(assets_dir)
		)

		# Generate documentation
		doc_file = assets_dir / "README.md"
		with open(doc_file, "w") as f:
			f.write(self._generate_audio_documentation(target, extracted_assets))

		self.session_manager.log_action(
			"audio_extraction_complete",
			f"Extracted {len(extracted_assets)} audio assets from {target.name}",
			[str(doc_file)],
		)

		self.current_progress["assets_extracted"] += len(extracted_assets)

	def _generate_code_analysis_report(self, target: DisassemblyTarget, disasm_result: Dict) -> str:
		"""Generate comprehensive code analysis report"""
		report = f"""# {target.name} - Code Analysis Report

## Overview
**Target:** {target.description}
**Address Range:** ${target.start_address:06X} - ${target.end_address:06X}
**Bank:** {target.bank}
**Size:** {target.end_address - target.start_address:,} bytes

## Analysis Results

### Functions Identified
"""

		functions = disasm_result.get("functions", [])
		if functions:
			report += f"Total functions found: {len(functions)}\n\n"
			report += "| Address | Size | Type | Description |\n"
			report += "|---------|------|------|-------------|\n"

			for func in functions:
				report += f"| ${func.get('address', 0):06X} | {func.get('size', 0)} bytes | {func.get('type', 'unknown')} | {func.get('description', 'Unknown function')} |\n"
		else:
			report += "No functions automatically identified.\n"

		report += f"""

### Code Statistics
- **Total instructions:** {disasm_result.get('instruction_count', 0)}
- **Jump targets:** {len(disasm_result.get('jump_targets', []))}
- **Subroutine calls:** {len(disasm_result.get('subroutines', []))}
- **Data references:** {len(disasm_result.get('data_refs', []))}

### Notable Patterns
"""

		patterns = disasm_result.get("patterns", [])
		for pattern in patterns:
			report += f"- {pattern}\n"

		if not patterns:
			report += "No notable patterns detected.\n"

		report += f"""

## Technical Notes
{disasm_result.get('notes', 'No additional technical notes.')}

---
*Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}*
"""

		return report

	def _generate_code_documentation(self, target: DisassemblyTarget, disasm_result: Dict) -> str:
		"""Generate code documentation"""
		doc = f"""# {target.name} - Technical Specification

## Purpose
{target.description}

## Memory Layout
- **Start Address:** ${target.start_address:06X}
- **End Address:** ${target.end_address:06X}
- **Bank:** {target.bank}
- **Size:** {target.end_address - target.start_address:,} bytes

## Function Reference

"""

		functions = disasm_result.get("functions", [])
		for func in functions:
			func_name = func.get("name", f"func_{func.get('address', 0):06X}")
			doc += f"### {func_name}\n"
			doc += f"**Address:** ${func.get('address', 0):06X}\n"
			doc += f"**Size:** {func.get('size', 0)} bytes\n"
			doc += f"**Purpose:** {func.get('description', 'Unknown')}\n\n"

		doc += """## Usage Notes
Add usage notes and calling conventions here.

## Related Systems
List related systems and dependencies here.
"""

		return doc

	def _generate_c_header(self, target: DisassemblyTarget, analysis_result: Dict) -> str:
		"""Generate C header for data structures"""
		header = f"""/*
 * Dragon Quest III - {target.description}
 * Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}
 */

#ifndef DQ3_{target.name.upper()}_H
#define DQ3_{target.name.upper()}_H

#include <stdint.h>

/* Address range: ${target.start_address:06X} - ${target.end_address:06X} */

"""

		structures = analysis_result.get("structures", [])
		for struct in structures:
			header += f"/* {struct.get('description', 'Data structure')} */\n"
			header += f"typedef struct {{\n"

			fields = struct.get("fields", [])
			for field in fields:
				header += f"\t{field.get('type', 'uint8_t')} {field.get('name', 'unknown')};"
				if field.get("comment"):
					header += f"\t/* {field.get('comment')} */"
				header += "\n"

			header += f"}} {struct.get('name', 'unknown_struct')}_t;\n\n"

		header += f"#endif /* DQ3_{target.name.upper()}_H */\n"
		return header

	def _generate_data_documentation(self, target: DisassemblyTarget, analysis_result: Dict) -> str:
		"""Generate data structure documentation"""
		doc = f"""# {target.name} - Data Structure Documentation

## Overview
{target.description}

**Address Range:** ${target.start_address:06X} - ${target.end_address:06X}
**Bank:** {target.bank}

## Data Structures

"""

		structures = analysis_result.get("structures", [])
		for struct in structures:
			doc += f"### {struct.get('name', 'Unknown Structure')}\n"
			doc += f"{struct.get('description', 'No description available.')}\n\n"

			doc += "| Offset | Type | Name | Description |\n"
			doc += "|--------|------|------|-------------|\n"

			fields = struct.get("fields", [])
			offset = 0
			for field in fields:
				doc += f"| +${offset:02X} | {field.get('type', 'uint8_t')} | {field.get('name', 'unknown')} | {field.get('comment', 'No description')} |\n"
				offset += field.get("size", 1)

			doc += f"\n**Total Size:** {offset} bytes\n\n"

		return doc

	def _generate_graphics_documentation(self, target: DisassemblyTarget, extracted_assets: List) -> str:
		"""Generate graphics asset documentation"""
		doc = f"""# {target.name} - Graphics Assets

## Overview
{target.description}

**Address Range:** ${target.start_address:06X} - ${target.end_address:06X}
**Assets Extracted:** {len(extracted_assets)}

## Asset List

| File | Format | Size | Description |
|------|--------|------|-------------|
"""

		for asset in extracted_assets:
			doc += f"| {asset.get('filename', 'unknown')} | {asset.get('format', 'unknown')} | {asset.get('size', 0)} bytes | {asset.get('description', 'No description')} |\n"

		doc += """
## Technical Notes
- Format specifications
- Palette information
- Usage guidelines
"""

		return doc

	def _generate_audio_documentation(self, target: DisassemblyTarget, extracted_assets: List) -> str:
		"""Generate audio asset documentation"""
		doc = f"""# {target.name} - Audio Assets

## Overview
{target.description}

**Address Range:** ${target.start_address:06X} - ${target.end_address:06X}
**Assets Extracted:** {len(extracted_assets)}

## Asset List

| File | Format | Size | Type |
|------|--------|------|------|
"""

		for asset in extracted_assets:
			doc += f"| {asset.get('filename', 'unknown')} | {asset.get('format', 'unknown')} | {asset.get('size', 0)} bytes | {asset.get('type', 'unknown')} |\n"

		doc += """
## Technical Notes
- Sample rates and formats
- SPC-700 driver information
- Usage in game
"""

		return doc

	def _generate_final_analysis(self):
		"""Generate comprehensive final analysis report"""
		print("\n📊 Generating final analysis...")

		# Create comprehensive summary
		final_report = f"""# Dragon Quest III - Complete Disassembly Summary

## Analysis Complete - {time.strftime('%Y-%m-%d %H:%M:%S')}

### Progress Summary
- **Total Targets Processed:** {len(self.completed_targets)} / {len(self.disassembly_targets)}
- **Functions Identified:** {self.current_progress['functions_identified']}
- **Data Structures Documented:** {self.current_progress['data_structures_documented']}
- **Assets Extracted:** {self.current_progress['assets_extracted']}

### Completed Targets
"""

		for target_name in self.completed_targets:
			target = next((t for t in self.disassembly_targets if t.name == target_name), None)
			if target:
				final_report += f"- ✅ **{target.name}** ({target.target_type}) - {target.description}\n"

		final_report += f"""

### Session Summary
{self.session_manager.generate_session_summary()}

### Next Steps
1. Review generated documentation
2. Validate disassembly accuracy
3. Enhance function analysis
4. Complete asset extraction
5. Generate interactive documentation

---
*Complete disassembly automation finished at {time.strftime('%Y-%m-%d %H:%M:%S')}*
"""

		# Save final report
		final_report_file = self.repo_path / "COMPLETE_DISASSEMBLY_SUMMARY.md"
		with open(final_report_file, "w") as f:
			f.write(final_report)

		# Commit final results
		self.session_manager.commit_and_push(
			"🎯 Complete disassembly automation finished - comprehensive analysis complete", [str(final_report_file)]
		)

		print(f"📋 Final analysis saved to: {final_report_file}")


def main():
	"""Main entry point for complete disassembly automation"""
	repo_path = "c:/Users/me/source/repos/dq3r-info"
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"

	print("🚀 Dragon Quest III - Complete Disassembly Automation")
	print("=" * 60)
	print(f"Repository: {repo_path}")
	print(f"ROM: {rom_path}")
	print()

	# Initialize and start automation
	engine = CompleteDisassemblyEngine(repo_path, rom_path)
	engine.start_automated_disassembly()

	print("\n✨ All automation complete!")


if __name__ == "__main__":
	main()
