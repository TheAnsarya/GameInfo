#!/usr/bin/env python3
"""
Diztinguish (.diz) File Parser for Dragon Quest III Disassembly
Parses DiztinGUIsh disassembly project files and extracts code/data labels
"""

import struct
import gzip
import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple
from dataclasses import dataclass, field
from enum import Enum


class DataType(Enum):
	"""Types of data that can be marked in DiztinGUIsh"""

	UNREACHED = 0
	OPCODE = 1
	OPERAND = 2
	DATA8 = 3
	GRAPHICS = 4
	MUSIC = 5
	EMPTY = 6
	DATA16 = 7
	POINTER16 = 8
	DATA24 = 9
	POINTER24 = 10
	DATA32 = 11
	POINTER32 = 12
	TEXT = 13
	LABEL = 14
	INSTRUCTION = 15


@dataclass
class DisassemblyLabel:
	"""Represents a labeled location in the ROM"""

	address: int
	name: str
	comment: str = ""
	data_type: DataType = DataType.UNREACHED
	size: int = 1
	bank: int = 0

	def to_snes_address(self) -> str:
		"""Convert to SNES $XX:XXXX format"""
		return f"${self.bank:02X}:{self.address & 0xffff:04X}"


@dataclass
class BankInfo:
	"""Information about a SNES memory bank"""

	bank_number: int
	start_address: int
	end_address: int
	bank_type: str = "unknown"	# "ROM", "RAM", "SRAM", "IO"
	description: str = ""
	labels: List[DisassemblyLabel] = field(default_factory=list)

	def add_label(self, label: DisassemblyLabel):
		"""Add a label to this bank"""
		label.bank = self.bank_number
		self.labels.append(label)
		self.labels.sort(key=lambda l: l.address)


@dataclass
class DisassemblyProgress:
	"""Tracks disassembly progress"""

	total_bytes: int
	disassembled_bytes: int = 0
	labeled_locations: int = 0
	functions_identified: int = 0
	data_structures: int = 0

	@property
	def completion_percentage(self) -> float:
		return (self.disassembled_bytes / self.total_bytes) * 100.0 if self.total_bytes > 0 else 0.0


class DiztinguishParser:
	"""Parser for DiztinGUIsh project files (.diz)"""

	def __init__(self, diz_path: Path):
		self.diz_path = diz_path
		self.raw_data = self._load_diz_file()
		self.parsed_data = None
		self.labels: Dict[int, DisassemblyLabel] = {}
		self.banks: Dict[int, BankInfo] = {}
		self.progress = DisassemblyProgress(0)

		# SNES memory map for Dragon Quest III
		self._initialize_snes_memory_map()

	def _load_diz_file(self) -> bytes:
		"""Load and decompress .diz file"""
		try:
			with open(self.diz_path, "rb") as f:
				data = f.read()

			# Check if it's gzipped (common for .diz files)
			if data.startswith(b"\x1f\x8b"):
				print(f"Decompressing gzipped .diz file: {self.diz_path.name}")
				return gzip.decompress(data)
			else:
				return data

		except Exception as e:
			raise RuntimeError(f"Failed to load .diz file {self.diz_path}: {e}")

	def _initialize_snes_memory_map(self):
		"""Initialize SNES memory banking information for Dragon Quest III"""
		# LoROM memory map for Dragon Quest III
		# Bank $00-$7f: ROM banks (32KB each, mirrored)
		# Bank $80-$ff: ROM banks (32KB each)

		# ROM banks - typical DQ3 layout
		rom_banks = [
			# System and main code
			BankInfo(0x00, 0x8000, 0xffff, "ROM", "System vectors and main code"),
			BankInfo(0x01, 0x8000, 0xffff, "ROM", "Main game engine"),
			BankInfo(0x02, 0x8000, 0xffff, "ROM", "Menu and UI code"),
			BankInfo(0x03, 0x8000, 0xffff, "ROM", "Battle system"),
			BankInfo(0x04, 0x8000, 0xffff, "ROM", "Field/overworld code"),
			BankInfo(0x05, 0x8000, 0xffff, "ROM", "Character/party management"),
			BankInfo(0x06, 0x8000, 0xffff, "ROM", "Item/equipment system"),
			BankInfo(0x07, 0x8000, 0xffff, "ROM", "Magic/spell system"),
			# Data banks
			BankInfo(0x08, 0x8000, 0xffff, "ROM", "Character class data"),
			BankInfo(0x09, 0x8000, 0xffff, "ROM", "Monster data and AI"),
			BankInfo(0x0a, 0x8000, 0xffff, "ROM", "Item and equipment data"),
			BankInfo(0x0b, 0x8000, 0xffff, "ROM", "Spell and magic data"),
			BankInfo(0x0c, 0x8000, 0xffff, "ROM", "Map and location data"),
			BankInfo(0x0d, 0x8000, 0xffff, "ROM", "Dialog and text data"),
			BankInfo(0x0e, 0x8000, 0xffff, "ROM", "Graphics data (tiles)"),
			BankInfo(0x0f, 0x8000, 0xffff, "ROM", "Graphics data (sprites)"),
			# Additional banks for larger ROM
			BankInfo(0x10, 0x8000, 0xffff, "ROM", "Additional graphics"),
			BankInfo(0x11, 0x8000, 0xffff, "ROM", "Music and sound data"),
			BankInfo(0x12, 0x8000, 0xffff, "ROM", "Music sequences"),
			BankInfo(0x13, 0x8000, 0xffff, "ROM", "Sound effects"),
			BankInfo(0x14, 0x8000, 0xffff, "ROM", "Compressed data"),
			BankInfo(0x15, 0x8000, 0xffff, "ROM", "Additional dialog"),
		]

		# Add banks to our collection
		for bank in rom_banks:
			self.banks[bank.bank_number] = bank

		# RAM banks
		self.banks[0x7e] = BankInfo(0x7e, 0x0000, 0xffff, "RAM", "Main RAM bank")
		self.banks[0x7f] = BankInfo(0x7f, 0x0000, 0xffff, "RAM", "Extended RAM bank")

	def parse_diz_data(self) -> Dict[str, Any]:
		"""Parse the decompressed .diz data"""
		try:
			# Try to parse as JSON first (newer DiztinGUIsh format)
			try:
				self.parsed_data = json.loads(self.raw_data.decode("utf-8"))
				return self._parse_json_format()
			except (json.JSONDecodeError, UnicodeDecodeError):
				pass

			# Try binary format parsing
			return self._parse_binary_format()

		except Exception as e:
			print(f"Warning: Could not parse .diz data: {e}")
			return {"error": str(e), "labels": {}, "banks": {}}

	def _parse_json_format(self) -> Dict[str, Any]:
		"""Parse JSON format .diz file"""
		if not isinstance(self.parsed_data, dict):
			raise ValueError("Invalid JSON format")

		results = {"format": "json", "labels": {}, "banks": {}, "metadata": {}}

		# Extract metadata
		if "ProjectName" in self.parsed_data:
			results["metadata"]["project_name"] = self.parsed_data["ProjectName"]

		if "RomBytes" in self.parsed_data:
			rom_size = len(self.parsed_data["RomBytes"])
			self.progress.total_bytes = rom_size
			results["metadata"]["rom_size"] = rom_size

		# Extract labels
		if "Labels" in self.parsed_data:
			for addr_str, label_data in self.parsed_data["Labels"].items():
				try:
					address = int(addr_str)
					label = DisassemblyLabel(
						address=address,
						name=label_data.get("Name", f"label_{address:06X}"),
						comment=label_data.get("Comment", ""),
					)

					# Determine bank from address
					bank_num = self._address_to_bank(address)
					if bank_num in self.banks:
						self.banks[bank_num].add_label(label)

					self.labels[address] = label
					results["labels"][address] = {"name": label.name, "comment": label.comment, "bank": bank_num}

				except (ValueError, KeyError) as e:
					print(f"Warning: Could not parse label at {addr_str}: {e}")

		# Extract data types/marks
		if "Data" in self.parsed_data:
			marked_locations = 0
			for i, data_type in enumerate(self.parsed_data["Data"]):
				if data_type != DataType.UNREACHED.value:
					marked_locations += 1
					self.progress.disassembled_bytes += 1

			self.progress.labeled_locations = marked_locations

		results["progress"] = {
			"total_bytes": self.progress.total_bytes,
			"disassembled_bytes": self.progress.disassembled_bytes,
			"completion_percentage": self.progress.completion_percentage,
		}

		return results

	def _parse_binary_format(self) -> Dict[str, Any]:
		"""Parse binary format .diz file"""
		results = {"format": "binary", "labels": {}, "banks": {}, "metadata": {}}

		# Binary .diz files have a specific structure
		# This is a simplified parser - real implementation would need
		# detailed knowledge of DiztinGUIsh binary format

		data = self.raw_data
		if len(data) < 16:
			raise ValueError("Binary data too short")

		# Try to extract what we can
		self.progress.total_bytes = len(data)
		results["metadata"]["rom_size"] = len(data)
		results["metadata"]["format_note"] = "Binary format - limited parsing"

		# Look for patterns that might indicate labels or marked code
		potential_labels = self._extract_patterns_from_binary(data)

		for i, (address, pattern_type) in enumerate(potential_labels):
			label = DisassemblyLabel(
				address=address,
				name=f"auto_label_{i:04X}",
				comment=f"Detected {pattern_type}",
				data_type=DataType.LABEL,
			)

			bank_num = self._address_to_bank(address)
			if bank_num in self.banks:
				self.banks[bank_num].add_label(label)

			self.labels[address] = label
			results["labels"][address] = {
				"name": label.name,
				"comment": label.comment,
				"bank": bank_num,
				"pattern_type": pattern_type,
			}

		self.progress.labeled_locations = len(potential_labels)
		self.progress.disassembled_bytes = len(potential_labels) * 4	# Estimate

		results["progress"] = {
			"total_bytes": self.progress.total_bytes,
			"disassembled_bytes": self.progress.disassembled_bytes,
			"completion_percentage": self.progress.completion_percentage,
		}

		return results

	def _address_to_bank(self, address: int) -> int:
		"""Convert ROM address to SNES bank number"""
		# For LoROM mapping
		if address < 0x400000:
			# Banks $00-$3f or $80-$bf
			bank = (address >> 15) & 0x3f
			if address >= 0x200000:
				bank += 0x80
		else:
			# Banks $40-$7f or $c0-$ff
			bank = ((address - 0x400000) >> 15) & 0x3f
			bank += 0x40
			if address >= 0x600000:
				bank += 0x80

		return bank

	def _extract_patterns_from_binary(self, data: bytes) -> List[Tuple[int, str]]:
		"""Extract potential code/data patterns from binary data"""
		patterns = []

		# Look for common SNES instruction patterns
		for i in range(0, len(data) - 4, 2):
			# Check for JSR/JSL instructions (common function calls)
			if data[i] == 0x20:	# JSR absolute
				target = struct.unpack("<H", data[i + 1 : i + 3])[0]
				patterns.append((target, "JSR_target"))

			elif data[i] == 0x22:	# JSL long
				if i + 3 < len(data):
					target = struct.unpack("<I", data[i + 1 : i + 4] + b"\x00")[0]
					patterns.append((target, "JSL_target"))

			# Check for BRA/BRL branches
			elif data[i] == 0x80:	# BRA
				if i + 1 < len(data):
					offset = struct.unpack("<b", data[i + 1 : i + 2])[0]
					target = (i + 2 + offset) & 0xffff
					patterns.append((target, "BRA_target"))

			# Check for data tables (ascending word values)
			elif i + 6 < len(data):
				word1 = struct.unpack("<H", data[i : i + 2])[0]
				word2 = struct.unpack("<H", data[i + 2 : i + 4])[0]
				word3 = struct.unpack("<H", data[i + 4 : i + 6])[0]

				if 0x8000 <= word1 < word2 < word3 <= 0xffff:
					patterns.append((i, "data_table"))

		# Remove duplicates and sort
		patterns = list(set(patterns))
		patterns.sort()

		return patterns[:100]	# Limit to first 100 patterns

	def generate_assembly_output(self) -> str:
		"""Generate assembly source code with labels and comments"""
		output_lines = []

		# Header
		output_lines.extend(
			[
				f"; Dragon Quest III Disassembly",
				f"; Generated from: {self.diz_path.name}",
				f"; Total ROM size: {self.progress.total_bytes:,} bytes",
				f"; Disassembly progress: {self.progress.completion_percentage:.1f}%",
				f";",
				f"; SNES Memory Banking Information:",
				f"; Banks $00-$7f: LoROM mapping (32KB banks)",
				f"; Banks $80-$ff: Extended LoROM mapping",
				f"",
				f".LOROM",
				f".ASSUME dp:$0000, db:$8000",
				f"",
			]
		)

		# Generate bank-by-bank disassembly
		for bank_num in sorted(self.banks.keys()):
			bank = self.banks[bank_num]

			if not bank.labels:
				continue

			output_lines.extend(
				[
					f"",
					f"; ={'='*60}",
					f"; BANK ${bank_num:02X}: {bank.description}",
					f"; Address range: ${bank.start_address:04X}-${bank.end_address:04X}",
					f"; Labels found: {len(bank.labels)}",
					f"; ={'='*60}",
					f"",
					f".bank {bank_num}",
					f".org ${bank.start_address:04X}",
					f"",
				]
			)

			# Add labels for this bank
			for label in bank.labels:
				if label.comment:
					output_lines.append(f"\t; {label.comment}")
				output_lines.append(f"{label.name}:")

				# Add placeholder for actual disassembly
				output_lines.append(f"\t; TODO: Disassemble from ${label.address:06X}")
				output_lines.append("")

		return "\n".join(output_lines)

	def export_labels_json(self) -> Dict[str, Any]:
		"""Export labels in JSON format for other tools"""
		labels_data = {
			"metadata": {
				"source_file": str(self.diz_path),
				"total_labels": len(self.labels),
				"total_banks": len([b for b in self.banks.values() if b.labels]),
				"progress": {
					"total_bytes": self.progress.total_bytes,
					"disassembled_bytes": self.progress.disassembled_bytes,
					"completion_percentage": self.progress.completion_percentage,
				},
			},
			"banks": {},
			"labels": {},
		}

		# Export bank information
		for bank_num, bank in self.banks.items():
			if bank.labels:
				labels_data["banks"][bank_num] = {
					"description": bank.description,
					"type": bank.bank_type,
					"start_address": f"${bank.start_address:04X}",
					"end_address": f"${bank.end_address:04X}",
					"label_count": len(bank.labels),
				}

		# Export individual labels
		for address, label in self.labels.items():
			labels_data["labels"][f"${address:06X}"] = {
				"name": label.name,
				"comment": label.comment,
				"bank": f"${label.bank:02X}",
				"snes_address": label.to_snes_address(),
				"data_type": label.data_type.name,
			}

		return labels_data


def create_disassembly_parser(diz_path: str) -> DiztinguishParser:
	"""Create and configure disassembly parser"""
	diz_file = Path(diz_path)

	if not diz_file.exists():
		raise FileNotFoundError(f"DiztinGUIsh file not found: {diz_path}")

	return DiztinguishParser(diz_file)


if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Parse DiztinGUIsh (.diz) disassembly files")
	parser.add_argument("diz_file", help="Path to .diz file")
	parser.add_argument("--output-asm", help="Output assembly file")
	parser.add_argument("--output-json", help="Output JSON labels file")
	parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

	args = parser.parse_args()

	try:
		# Create parser
		parser = create_disassembly_parser(args.diz_file)

		if args.verbose:
			print(f"Parsing DiztinGUIsh file: {args.diz_file}")

		# Parse the .diz data
		results = parser.parse_diz_data()

		print(f"✅ Parsed {results['format']} format .diz file")
		print(f"📊 Found {len(results['labels'])} labels")
		print(f"🏦 Active banks: {len([b for b in parser.banks.values() if b.labels])}")
		print(f"📈 Disassembly progress: {results['progress']['completion_percentage']:.1f}%")

		# Generate outputs
		if args.output_asm:
			asm_output = parser.generate_assembly_output()
			with open(args.output_asm, "w", encoding="utf-8") as f:
				f.write(asm_output)
			print(f"💾 Assembly output saved to: {args.output_asm}")

		if args.output_json:
			json_output = parser.export_labels_json()
			with open(args.output_json, "w", encoding="utf-8") as f:
				json.dump(json_output, f, indent="\t", ensure_ascii=False)
			print(f"💾 JSON labels saved to: {args.output_json}")

		if not args.output_asm and not args.output_json:
			# Print summary
			print(f"\n📋 Summary:")
			for bank_num, bank in parser.banks.items():
				if bank.labels:
					print(f"	 Bank ${bank_num:02X}: {len(bank.labels)} labels - {bank.description}")

	except Exception as e:
		print(f"❌ Error: {e}")
		sys.exit(1)
