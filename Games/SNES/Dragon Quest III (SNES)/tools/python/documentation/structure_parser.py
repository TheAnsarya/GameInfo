#!/usr/bin/env python3
"""
Dragon Quest III Data Structure Parser & Documentation System
Parses existing manual analysis and creates comprehensive documentation
"""

import re
import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass, asdict, field
from enum import Enum


class DataStructureType(Enum):
	"""Types of game data structures"""

	CHARACTER = "character"
	PARTY = "party"
	ITEM = "item"
	SPELL = "spell"
	MONSTER = "monster"
	MAP = "map"
	SYSTEM = "system"
	GRAPHICS = "graphics"
	AUDIO = "audio"
	UI = "ui"


@dataclass
class MemoryField:
	"""Individual field within a data structure"""

	name: str
	offset: int
	size: int
	data_type: str
	description: str
	valid_range: Optional[str] = None
	notes: str = ""

	@property
	def end_offset(self) -> int:
		return self.offset + self.size - 1

	@property
	def address_range(self) -> str:
		if self.size == 1:
			return f"${self.offset:04X}"
		else:
			return f"${self.offset:04X}-${self.end_offset:04X}"


@dataclass
class DataStructure:
	"""Complete game data structure definition"""

	name: str
	base_address: int
	total_size: int
	structure_type: DataStructureType
	description: str
	fields: List[MemoryField] = field(default_factory=list)
	instances: List[int] = field(default_factory=list)	# For arrays/multiple copies
	dependencies: List[str] = field(default_factory=list)	# Related structures
	version_notes: str = ""
	completion_status: str = "partial"	# partial, complete, verified

	def add_field(self, field: MemoryField):
		"""Add field and maintain sorted order"""
		self.fields.append(field)
		self.fields.sort(key=lambda f: f.offset)

	@property
	def field_coverage(self) -> float:
		"""Calculate how much of the structure is documented"""
		if self.total_size == 0:
			return 0.0

		covered_bytes = sum(field.size for field in self.fields)
		return (covered_bytes / self.total_size) * 100.0

	def get_gaps(self) -> List[Tuple[int, int]]:
		"""Find undocumented gaps in the structure"""
		gaps = []
		current_pos = 0

		for field in sorted(self.fields, key=lambda f: f.offset):
			if field.offset > current_pos:
				gaps.append((current_pos, field.offset - 1))
			current_pos = max(current_pos, field.end_offset + 1)

		# Check for gap at end
		if current_pos < self.total_size:
			gaps.append((current_pos, self.total_size - 1))

		return gaps


class DQ3StructureParser:
	"""Parser for Dragon Quest III data structures from .mlb files"""

	def __init__(self):
		self.structures: Dict[str, DataStructure] = {}
		self.raw_entries: List[Dict[str, Any]] = []

		# Patterns for parsing .mlb format
		self.mlb_pattern = re.compile(r"SnesWorkRam:([0-9A-Fa-f]{4})(?:-([0-9A-Fa-f]{4}))?:([^:]+):(.+)")

	def parse_mlb_file(self, file_path: str) -> Dict[str, DataStructure]:
		"""Parse Mesen-X .mlb file containing SNES work RAM labels"""
		print(f"📖 Parsing .mlb file: {file_path}")

		mlb_path = Path(file_path)
		if not mlb_path.exists():
			raise FileNotFoundError(f"MLB file not found: {file_path}")

		with open(mlb_path, "r", encoding="utf-8") as f:
			lines = f.readlines()

		# Parse each line
		for line_num, line in enumerate(lines, 1):
			line = line.strip()
			if not line or line.startswith("#") or line.startswith("//"):
				continue

			match = self.mlb_pattern.match(line)
			if not match:
				continue

			start_addr, end_addr, name, description = match.groups()
			start_addr = int(start_addr, 16)

			# Calculate size
			if end_addr:
				end_addr = int(end_addr, 16)
				size = end_addr - start_addr + 1
			else:
				size = 1

			# Store raw entry
			entry = {
				"line_num": line_num,
				"start_addr": start_addr,
				"end_addr": end_addr or start_addr,
				"size": size,
				"name": name,
				"description": description,
				"raw_line": line,
			}

			self.raw_entries.append(entry)

		print(f"	 📋 Parsed {len(self.raw_entries)} memory entries")

		# Analyze and group into structures
		self._analyze_structures()

		return self.structures

	def _analyze_structures(self):
		"""Analyze raw entries to identify data structures"""
		print("🔍 Analyzing data structures...")

		# Group entries by logical structures
		structure_groups = self._group_by_structures()

		for group_name, entries in structure_groups.items():
			structure = self._create_structure_from_entries(group_name, entries)
			if structure:
				self.structures[structure.name] = structure

		print(f"	 🏗️ Identified {len(self.structures)} data structures")

	def _group_by_structures(self) -> Dict[str, List[Dict[str, Any]]]:
		"""Group entries into logical data structures"""
		groups = {}

		for entry in self.raw_entries:
			# Determine structure type from name patterns
			name = entry["name"]

			# Character/Party member data
			if "Hero_" in name or "Party_" in name:
				if "Hero_" in name:
					group_key = "Hero"
				else:
					# Extract party member number
					party_match = re.search(r"Party_(\d+)_", name)
					if party_match:
						party_num = int(party_match.group(1))
						group_key = f"PartyMember_{party_num}"
					else:
						group_key = "Party_Generic"

			# Gold/Items
			elif "Gold" in name or "Bag_Items" in name:
				group_key = "Inventory"

			# System data
			else:
				group_key = "SystemData"

			if group_key not in groups:
				groups[group_key] = []

			groups[group_key].append(entry)

		return groups

	def _create_structure_from_entries(self, group_name: str, entries: List[Dict[str, Any]]) -> Optional[DataStructure]:
		"""Create DataStructure from grouped entries"""
		if not entries:
			return None

		# Sort entries by address
		entries.sort(key=lambda e: e["start_addr"])

		# Determine structure properties
		base_addr = entries[0]["start_addr"]
		max_end = max(entry["end_addr"] for entry in entries)
		total_size = max_end - base_addr + 1

		# Determine structure type
		if "Hero" in group_name or "Party" in group_name:
			struct_type = DataStructureType.CHARACTER
			description = f"Character data structure for {group_name}"
		elif "Inventory" in group_name:
			struct_type = DataStructureType.ITEM
			description = "Inventory and item management data"
		else:
			struct_type = DataStructureType.SYSTEM
			description = f"System data for {group_name}"

		# Create structure
		structure = DataStructure(
			name=group_name,
			base_address=base_addr,
			total_size=total_size,
			structure_type=struct_type,
			description=description,
			completion_status="documented" if len(entries) > 5 else "partial",
		)

		# Add fields
		for entry in entries:
			# Clean up field name
			field_name = entry["name"]
			if "_" in field_name:
				parts = field_name.split("_")
				if len(parts) > 2:
					field_name = "_".join(parts[1:])	# Remove prefix

			# Determine data type
			data_type = self._determine_data_type(entry)

			field = MemoryField(
				name=field_name,
				offset=entry["start_addr"] - base_addr,
				size=entry["size"],
				data_type=data_type,
				description=entry["description"],
				notes=f"Raw offset: ${entry['start_addr']:04X}",
			)

			structure.add_field(field)

		return structure

	def _determine_data_type(self, entry: Dict[str, Any]) -> str:
		"""Determine data type from field characteristics"""
		name = entry["name"].lower()
		size = entry["size"]
		description = entry["description"].lower()

		# Type determination logic
		if "level" in name or "level" in description:
			return "uint8"
		elif "hp" in name or "mp" in name:
			return "uint16" if size >= 2 else "uint8"
		elif "xp" in name or "experience" in description:
			return "uint24" if size >= 3 else "uint16"
		elif "name" in name:
			return "string"
		elif "stat" in description or any(
			stat in name for stat in ["strength", "agility", "stamina", "wisdom", "luck"]
		):
			return "uint8"
		elif "amount" in name or "number" in description:
			return "uint8" if size == 1 else "uint16"
		elif "item" in name and "bag" in name:
			return "item_id"
		elif "spell" in name:
			return "spell_flags"
		else:
			return f"byte[{size}]" if size > 1 else "uint8"

	def generate_documentation(self, output_dir: str):
		"""Generate comprehensive documentation files"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"📝 Generating documentation in {output_path}")

		# Generate master documentation
		self._generate_master_doc(output_path)

		# Generate individual structure docs
		self._generate_structure_docs(output_path)

		# Generate JSON export
		self._generate_json_export(output_path)

		# Generate C header files
		self._generate_c_headers(output_path)

		# Generate analysis report
		self._generate_analysis_report(output_path)

		print("✅ Documentation generation complete!")

	def _generate_master_doc(self, output_path: Path):
		"""Generate master documentation file"""
		lines = []

		# Header
		lines.extend(
			[
				"# 🐉 Dragon Quest III - Data Structure Documentation",
				"",
				"Complete documentation of game data structures extracted from manual analysis.",
				"",
				f"**Generated from:** {len(self.raw_entries)} memory entries",
				f"**Structures identified:** {len(self.structures)}",
				f"**Generation date:** {__import__('datetime').datetime.now().isoformat()}",
				"",
				"---",
				"",
			]
		)

		# Table of contents
		lines.extend(["## 📋 Table of Contents", ""])

		for name, structure in sorted(self.structures.items()):
			lines.append(f"- [{name}](#{name.lower().replace('_', '-')}) - {structure.description}")

		lines.extend(["", "---", ""])

		# Structure summaries
		for name, structure in sorted(self.structures.items()):
			lines.extend(
				[
					f"## {name}",
					"",
					f"**Base Address:** `${structure.base_address:04X}`	",
					f"**Total Size:** {structure.total_size} bytes	",
					f"**Type:** {structure.structure_type.value.title()}	",
					f"**Coverage:** {structure.field_coverage:.1f}% documented	",
					f"**Status:** {structure.completion_status}	",
					"",
					structure.description,
					"",
					"### Memory Layout",
					"",
					"| Offset | Size | Type | Field | Description |",
					"|--------|------|------|--------|-------------|",
				]
			)

			for field in structure.fields:
				lines.append(
					f"| `+{field.offset:02X}` | {field.size} | `{field.data_type}` | "
					f"`{field.name}` | {field.description} |"
				)

			# Show gaps if any
			gaps = structure.get_gaps()
			if gaps:
				lines.extend(["", "### Undocumented Gaps", ""])
				for start, end in gaps:
					size = end - start + 1
					lines.append(f"- `+{start:02X}` to `+{end:02X}` ({size} bytes)")

			lines.extend(["", "---", ""])

		# Write master documentation
		with open(output_path / "dq3_data_structures.md", "w", encoding="utf-8") as f:
			f.write("\n".join(lines))

	def _generate_structure_docs(self, output_path: Path):
		"""Generate individual structure documentation files"""
		struct_dir = output_path / "structures"
		struct_dir.mkdir(exist_ok=True)

		for name, structure in self.structures.items():
			filename = f"{name.lower()}.md"

			lines = [
				f"# {name} Data Structure",
				"",
				structure.description,
				"",
				f"**Base Address:** `${structure.base_address:04X}`	",
				f"**Total Size:** {structure.total_size} bytes	",
				f"**Type:** {structure.structure_type.value.title()}	",
				f"**Coverage:** {structure.field_coverage:.1f}% documented",
				"",
			]

			# Detailed field documentation
			lines.extend(["## Field Definitions", ""])

			for field in structure.fields:
				lines.extend(
					[
						f"### `{field.name}`",
						"",
						f"**Offset:** `+{field.offset:02X}` (`${structure.base_address + field.offset:04X}`)",
						f"**Size:** {field.size} byte{'s' if field.size > 1 else ''}",
						f"**Type:** `{field.data_type}`",
						"",
						field.description,
						"",
					]
				)

				if field.valid_range:
					lines.extend([f"**Valid Range:** {field.valid_range}", ""])

				if field.notes:
					lines.extend([f"**Notes:** {field.notes}", ""])

				lines.append("")

			with open(struct_dir / filename, "w", encoding="utf-8") as f:
				f.write("\n".join(lines))

	def _generate_json_export(self, output_path: Path):
		"""Generate JSON export for programmatic access"""
		export_data = {}

		for name, structure in self.structures.items():
			export_data[name] = {
				"name": structure.name,
				"base_address": f"${structure.base_address:04X}",
				"total_size": structure.total_size,
				"structure_type": structure.structure_type.value,
				"description": structure.description,
				"field_coverage": round(structure.field_coverage, 2),
				"completion_status": structure.completion_status,
				"fields": [],
			}

			for field in structure.fields:
				export_data[name]["fields"].append(
					{
						"name": field.name,
						"offset": field.offset,
						"absolute_address": f"${structure.base_address + field.offset:04X}",
						"size": field.size,
						"data_type": field.data_type,
						"description": field.description,
						"valid_range": field.valid_range,
						"notes": field.notes,
					}
				)

		with open(output_path / "dq3_structures.json", "w") as f:
			json.dump(export_data, f, indent="\t")

	def _generate_c_headers(self, output_path: Path):
		"""Generate C header files for structure definitions"""
		headers_dir = output_path / "headers"
		headers_dir.mkdir(exist_ok=True)

		# Type mapping for C headers
		type_map = {
			"uint8": "uint8_t",
			"uint16": "uint16_t",
			"uint24": "uint32_t",	# No native 24-bit type
			"string": "char",
			"item_id": "uint8_t",
			"spell_flags": "uint8_t",
		}

		for name, structure in self.structures.items():
			filename = f"{name.lower()}.h"

			lines = [
				f"/* {name} Data Structure */",
				f"/* Generated from Dragon Quest III analysis */",
				f"/* Base Address: ${structure.base_address:04X} */",
				f"/* Size: {structure.total_size} bytes */",
				"",
				"#ifndef DQ3_" + name.upper() + "_H",
				"#define DQ3_" + name.upper() + "_H",
				"",
				"#include <stdint.h>",
				"",
				f"#define {name.upper()}_BASE_ADDR 0x{structure.base_address:04X}",
				f"#define {name.upper()}_SIZE {structure.total_size}",
				"",
				f"typedef struct {{",
			]

			for field in structure.fields:
				c_type = type_map.get(field.data_type, "uint8_t")

				# Handle arrays
				if "[" in field.data_type:
					array_match = re.search(r"byte\[(\d+)\]", field.data_type)
					if array_match:
						array_size = array_match.group(1)
						lines.append(f"\t{c_type} {field.name}[{array_size}]; /* {field.description} */")
					else:
						lines.append(f"\t{c_type} {field.name}; /* {field.description} */")
				elif field.data_type == "string":
					lines.append(f"\t{c_type} {field.name}[{field.size}]; /* {field.description} */")
				else:
					lines.append(f"\t{c_type} {field.name}; /* {field.description} */")

			lines.extend([f"}} {name}_t;", "", "#endif /* DQ3_" + name.upper() + "_H */", ""])

			with open(headers_dir / filename, "w") as f:
				f.write("\n".join(lines))

	def _generate_analysis_report(self, output_path: Path):
		"""Generate analysis and statistics report"""
		lines = [
			"# 📊 Data Structure Analysis Report",
			"",
			"Statistical analysis of Dragon Quest III data structures.",
			"",
			"## Summary Statistics",
			"",
		]

		total_fields = sum(len(s.fields) for s in self.structures.values())
		total_size = sum(s.total_size for s in self.structures.values())
		avg_coverage = sum(s.field_coverage for s in self.structures.values()) / len(self.structures)

		lines.extend(
			[
				f"- **Total Structures:** {len(self.structures)}",
				f"- **Total Fields:** {total_fields}",
				f"- **Total Memory Mapped:** {total_size:,} bytes",
				f"- **Average Coverage:** {avg_coverage:.1f}%",
				f"- **Raw Entries Processed:** {len(self.raw_entries)}",
				"",
			]
		)

		# Structure breakdown by type
		type_counts = {}
		for structure in self.structures.values():
			struct_type = structure.structure_type.value
			type_counts[struct_type] = type_counts.get(struct_type, 0) + 1

		lines.extend(["## Structure Types", ""])

		for struct_type, count in sorted(type_counts.items()):
			lines.append(f"- **{struct_type.title()}:** {count} structures")

		lines.extend(["", "## Completion Status", ""])

		status_counts = {}
		for structure in self.structures.values():
			status = structure.completion_status
			status_counts[status] = status_counts.get(status, 0) + 1

		for status, count in sorted(status_counts.items()):
			lines.append(f"- **{status.title()}:** {count} structures")

		# Top structures by field count
		lines.extend(["", "## Most Complex Structures", ""])

		complex_structures = sorted(self.structures.values(), key=lambda s: len(s.fields), reverse=True)[:10]

		for structure in complex_structures:
			lines.append(
				f"- **{structure.name}:** {len(structure.fields)} fields, "
				f"{structure.total_size} bytes ({structure.field_coverage:.1f}% covered)"
			)

		with open(output_path / "dq3_analysis_report.md", "w", encoding="utf-8") as f:
			f.write("\n".join(lines))


def main():
	"""Main entry point for data structure documentation"""
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III Data Structure Parser & Documenter")
	parser.add_argument("mlb_file", help="Path to Mesen-X .mlb file")
	parser.add_argument("--output", "-o", default="documentation", help="Output directory")

	args = parser.parse_args()

	print("🐉 Dragon Quest III - Data Structure Documentation System")
	print("=" * 65)

	# Create parser and process file
	parser = DQ3StructureParser()
	structures = parser.parse_mlb_file(args.mlb_file)

	print(f"\n📋 Analysis Results:")
	print(f"	 Structures identified: {len(structures)}")

	total_fields = sum(len(s.fields) for s in structures.values())
	total_coverage = sum(s.field_coverage for s in structures.values()) / len(structures)

	print(f"	 Total fields: {total_fields}")
	print(f"	 Average coverage: {total_coverage:.1f}%")

	# Generate documentation
	parser.generate_documentation(args.output)

	print(f"\n🎯 Documentation generated in: {args.output}/")
	print("	 📄 dq3_data_structures.md - Master documentation")
	print("	 📂 structures/ - Individual structure docs")
	print("	 🔧 headers/ - C header files")
	print("	 📊 dq3_analysis_report.md - Statistical analysis")


if __name__ == "__main__":
	main()
