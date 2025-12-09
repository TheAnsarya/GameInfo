#!/usr/bin/env python3
"""
Data Migration Tool - Convert between various ROM hacking data formats.

Supports bidirectional conversion between:
- Binary ROM data ↔ JSON/YAML
- TBL files ↔ JSON
- Atlas scripts ↔ JSON
- Assembly includes ↔ JSON
- CSV ↔ Binary tables

Author: ROM Hacking Toolkit
"""

import argparse
import csv
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple, Union

try:
	import yaml
	HAS_YAML = True
except ImportError:
	HAS_YAML = False


class DataFormat(Enum):
	"""Supported data formats."""
	BINARY = auto()
	JSON = auto()
	YAML = auto()
	CSV = auto()
	TBL = auto()
	ATLAS = auto()
	ASM_6502 = auto()
	ASM_65816 = auto()
	ASM_Z80 = auto()
	WIKITEXT = auto()
	XML = auto()


@dataclass
class FieldDefinition:
	"""Definition of a data field."""
	name: str
	offset: int
	size: int
	format: str = "int"  # int, uint, string, bytes, flags, enum
	endian: str = "little"
	description: str = ""
	enum_values: Dict[int, str] = field(default_factory=dict)
	flag_names: Dict[int, str] = field(default_factory=dict)

	def to_dict(self) -> Dict:
		return {
			"name": self.name,
			"offset": self.offset,
			"size": self.size,
			"format": self.format,
			"endian": self.endian,
			"description": self.description,
			"enum_values": self.enum_values,
			"flag_names": self.flag_names,
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "FieldDefinition":
		return cls(
			name=data["name"],
			offset=data["offset"],
			size=data["size"],
			format=data.get("format", "int"),
			endian=data.get("endian", "little"),
			description=data.get("description", ""),
			enum_values=data.get("enum_values", {}),
			flag_names=data.get("flag_names", {}),
		)


@dataclass
class TableDefinition:
	"""Definition of a data table."""
	name: str
	base_address: int
	entry_size: int
	entry_count: int
	fields: List[FieldDefinition]
	description: str = ""

	def to_dict(self) -> Dict:
		return {
			"name": self.name,
			"base_address": f"${self.base_address:06x}",
			"entry_size": self.entry_size,
			"entry_count": self.entry_count,
			"fields": [f.to_dict() for f in self.fields],
			"description": self.description,
		}

	@classmethod
	def from_dict(cls, data: Dict) -> "TableDefinition":
		base = data["base_address"]
		if isinstance(base, str):
			base = int(base.replace("$", "").replace("0x", ""), 16)
		return cls(
			name=data["name"],
			base_address=base,
			entry_size=data["entry_size"],
			entry_count=data["entry_count"],
			fields=[FieldDefinition.from_dict(f) for f in data["fields"]],
			description=data.get("description", ""),
		)


class DataMigrator:
	"""Main data migration class."""

	def __init__(self):
		self.converters: Dict[Tuple[DataFormat, DataFormat], Callable] = {
			(DataFormat.BINARY, DataFormat.JSON): self._binary_to_json,
			(DataFormat.JSON, DataFormat.BINARY): self._json_to_binary,
			(DataFormat.TBL, DataFormat.JSON): self._tbl_to_json,
			(DataFormat.JSON, DataFormat.TBL): self._json_to_tbl,
			(DataFormat.CSV, DataFormat.JSON): self._csv_to_json,
			(DataFormat.JSON, DataFormat.CSV): self._json_to_csv,
			(DataFormat.ATLAS, DataFormat.JSON): self._atlas_to_json,
			(DataFormat.JSON, DataFormat.ATLAS): self._json_to_atlas,
			(DataFormat.JSON, DataFormat.ASM_6502): self._json_to_asm_6502,
			(DataFormat.JSON, DataFormat.ASM_65816): self._json_to_asm_65816,
			(DataFormat.JSON, DataFormat.WIKITEXT): self._json_to_wikitext,
		}

	def convert(
		self,
		source_format: DataFormat,
		target_format: DataFormat,
		input_data: Any,
		schema: Optional[TableDefinition] = None,
	) -> Any:
		"""Convert data from one format to another."""
		key = (source_format, target_format)
		if key not in self.converters:
			raise ValueError(
				f"Conversion from {source_format.name} to {target_format.name} "
				"not supported"
			)
		return self.converters[key](input_data, schema)

	def _binary_to_json(
		self,
		data: bytes,
		schema: Optional[TableDefinition],
	) -> Dict:
		"""Convert binary data to JSON using schema."""
		if schema is None:
			# Raw binary to hex dump
			return {
				"format": "raw",
				"size": len(data),
				"data": data.hex(),
			}

		entries = []
		for i in range(schema.entry_count):
			offset = i * schema.entry_size
			entry_data = data[offset:offset + schema.entry_size]
			entry = {"_index": i}

			for field in schema.fields:
				value = self._read_field(entry_data, field)
				entry[field.name] = value

			entries.append(entry)

		return {
			"table": schema.name,
			"description": schema.description,
			"entry_count": schema.entry_count,
			"entry_size": schema.entry_size,
			"entries": entries,
		}

	def _read_field(self, data: bytes, field: FieldDefinition) -> Any:
		"""Read a field from binary data."""
		raw = data[field.offset:field.offset + field.size]

		if field.format == "bytes":
			return raw.hex()
		elif field.format == "string":
			# Null-terminated string
			null_pos = raw.find(b'\x00')
			if null_pos >= 0:
				raw = raw[:null_pos]
			return raw.decode("ascii", errors="replace")
		elif field.format == "flags":
			value = int.from_bytes(
				raw, byteorder=field.endian, signed=False
			)
			flags = []
			for bit, name in field.flag_names.items():
				if value & (1 << bit):
					flags.append(name)
			return {"value": value, "flags": flags}
		elif field.format == "enum":
			value = int.from_bytes(
				raw, byteorder=field.endian, signed=False
			)
			name = field.enum_values.get(value, f"unknown_{value}")
			return {"value": value, "name": name}
		else:
			# Integer (signed or unsigned)
			signed = field.format == "int"
			return int.from_bytes(raw, byteorder=field.endian, signed=signed)

	def _json_to_binary(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> bytes:
		"""Convert JSON data to binary using schema."""
		if data.get("format") == "raw":
			return bytes.fromhex(data["data"])

		if schema is None:
			raise ValueError("Schema required for structured JSON to binary")

		result = bytearray(schema.entry_size * schema.entry_count)

		for entry in data.get("entries", []):
			idx = entry.get("_index", 0)
			offset = idx * schema.entry_size

			for field in schema.fields:
				if field.name in entry:
					self._write_field(
						result, offset + field.offset, entry[field.name], field
					)

		return bytes(result)

	def _write_field(
		self,
		data: bytearray,
		offset: int,
		value: Any,
		field: FieldDefinition,
	) -> None:
		"""Write a field to binary data."""
		if field.format == "bytes":
			raw = bytes.fromhex(value) if isinstance(value, str) else value
		elif field.format == "string":
			raw = value.encode("ascii")[:field.size].ljust(field.size, b'\x00')
		elif field.format in ("flags", "enum"):
			v = value.get("value", 0) if isinstance(value, dict) else value
			raw = v.to_bytes(field.size, byteorder=field.endian, signed=False)
		else:
			signed = field.format == "int"
			raw = value.to_bytes(
				field.size, byteorder=field.endian, signed=signed
			)

		data[offset:offset + field.size] = raw

	def _tbl_to_json(
		self,
		data: str,
		schema: Optional[TableDefinition],
	) -> Dict:
		"""Convert TBL file to JSON."""
		entries = {}
		dte = {}

		for line in data.splitlines():
			line = line.strip()
			if not line or line.startswith("#") or line.startswith(";"):
				continue

			if "=" in line:
				parts = line.split("=", 1)
				hex_part = parts[0].strip()
				char_part = parts[1] if len(parts) > 1 else ""

				# Parse hex value
				hex_val = hex_part.upper().replace("$", "").replace("0X", "")
				try:
					byte_val = int(hex_val, 16)
				except ValueError:
					continue

				# Categorize entry
				if len(char_part) > 1 and not char_part.startswith("["):
					dte[f"${byte_val:02x}"] = char_part
				else:
					entries[f"${byte_val:02x}"] = char_part

		return {
			"format": "tbl",
			"encoding": "custom",
			"characters": entries,
			"dte": dte,
		}

	def _json_to_tbl(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON to TBL file."""
		lines = [
			"# Text Table File",
			"# Generated by Data Migration Tool",
			"",
			"# Standard Characters",
		]

		# Sort characters by hex value
		chars = data.get("characters", {})
		sorted_chars = sorted(
			chars.items(),
			key=lambda x: int(x[0].replace("$", ""), 16)
		)

		for hex_val, char in sorted_chars:
			val = hex_val.replace("$", "").upper()
			lines.append(f"{val}={char}")

		# DTE entries
		dte = data.get("dte", {})
		if dte:
			lines.extend(["", "# DTE (Dual Tile Encoding)"])
			sorted_dte = sorted(
				dte.items(),
				key=lambda x: int(x[0].replace("$", ""), 16)
			)
			for hex_val, chars in sorted_dte:
				val = hex_val.replace("$", "").upper()
				lines.append(f"{val}={chars}")

		return "\n".join(lines)

	def _csv_to_json(
		self,
		data: str,
		schema: Optional[TableDefinition],
	) -> Dict:
		"""Convert CSV to JSON."""
		lines = data.strip().splitlines()
		if not lines:
			return {"entries": []}

		reader = csv.DictReader(lines)
		entries = []

		for i, row in enumerate(reader):
			entry = {"_index": i}
			for key, value in row.items():
				# Try to parse as number
				try:
					if "." in value:
						entry[key] = float(value)
					elif value.startswith("$") or value.startswith("0x"):
						entry[key] = int(value.replace("$", ""), 16)
					else:
						entry[key] = int(value)
				except ValueError:
					entry[key] = value
			entries.append(entry)

		return {"format": "csv", "entries": entries}

	def _json_to_csv(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON to CSV."""
		entries = data.get("entries", [])
		if not entries:
			return ""

		# Get all field names
		fieldnames = []
		for entry in entries:
			for key in entry.keys():
				if key not in fieldnames and key != "_index":
					fieldnames.append(key)

		lines = []
		lines.append(",".join(fieldnames))

		for entry in entries:
			row = []
			for field in fieldnames:
				value = entry.get(field, "")
				if isinstance(value, dict):
					value = value.get("value", "")
				row.append(str(value))
			lines.append(",".join(row))

		return "\n".join(lines)

	def _atlas_to_json(
		self,
		data: str,
		schema: Optional[TableDefinition],
	) -> Dict:
		"""Convert Atlas script to JSON."""
		strings = []
		current_pointer = None
		current_text = []

		for line in data.splitlines():
			line = line.strip()

			# Pointer directive
			if line.startswith("#JMP("):
				if current_pointer is not None and current_text:
					strings.append({
						"pointer": current_pointer,
						"text": "".join(current_text),
					})
				# Parse pointer
				match = re.search(r'\$([0-9A-Fa-f]+)', line)
				if match:
					current_pointer = f"${match.group(1).lower()}"
				current_text = []
			elif line.startswith("#") or not line:
				continue
			else:
				current_text.append(line + "\n")

		# Last entry
		if current_pointer is not None and current_text:
			strings.append({
				"pointer": current_pointer,
				"text": "".join(current_text).rstrip("\n"),
			})

		return {"format": "atlas", "strings": strings}

	def _json_to_atlas(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON to Atlas script."""
		lines = [
			"; Atlas Script",
			"; Generated by Data Migration Tool",
			"",
		]

		for entry in data.get("strings", []):
			pointer = entry.get("pointer", "$0000")
			text = entry.get("text", "")

			lines.append(f"#JMP({pointer})")
			for text_line in text.splitlines():
				lines.append(text_line)
			lines.append("")

		return "\n".join(lines)

	def _json_to_asm_6502(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON to 6502 assembly."""
		lines = [
			"; Data table - 6502 Assembly",
			"; Generated by Data Migration Tool",
			"",
		]

		entries = data.get("entries", [])
		if not entries:
			return "\n".join(lines)

		# Generate label
		name = data.get("table", "data_table")
		lines.append(f"{name}:")

		for entry in entries:
			idx = entry.get("_index", 0)
			lines.append(f"    ; Entry {idx}")

			byte_values = []
			word_values = []

			for key, value in entry.items():
				if key.startswith("_"):
					continue
				if isinstance(value, dict):
					value = value.get("value", 0)
				if isinstance(value, int):
					if value > 255:
						word_values.append(value)
					else:
						byte_values.append(value)

			if byte_values:
				hex_bytes = ", ".join(f"${v:02x}" for v in byte_values)
				lines.append(f"    .byte {hex_bytes}")
			if word_values:
				hex_words = ", ".join(f"${v:04x}" for v in word_values)
				lines.append(f"    .word {hex_words}")

		return "\n".join(lines)

	def _json_to_asm_65816(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON to 65816 assembly."""
		lines = [
			"; Data table - 65816 Assembly",
			"; Generated by Data Migration Tool",
			"",
		]

		entries = data.get("entries", [])
		if not entries:
			return "\n".join(lines)

		name = data.get("table", "data_table")
		lines.append(f"{name}:")

		for entry in entries:
			idx = entry.get("_index", 0)
			lines.append(f"    ; Entry {idx}")

			byte_values = []

			for key, value in entry.items():
				if key.startswith("_"):
					continue
				if isinstance(value, dict):
					value = value.get("value", 0)
				if isinstance(value, int):
					if value > 0xffff:
						lines.append(f"    dl ${value:06x}")
					elif value > 0xff:
						lines.append(f"    dw ${value:04x}")
					else:
						byte_values.append(value)

			if byte_values:
				hex_bytes = ", ".join(f"${v:02x}" for v in byte_values)
				lines.append(f"    db {hex_bytes}")

		return "\n".join(lines)

	def _json_to_wikitext(
		self,
		data: Dict,
		schema: Optional[TableDefinition],
	) -> str:
		"""Convert JSON data to Data Crystal wikitext table."""
		lines = [
			'{| class="wikitable sortable"',
		]

		entries = data.get("entries", [])
		if not entries:
			return '{| class="wikitable"\n|}'

		# Get headers from first entry
		headers = [k for k in entries[0].keys() if not k.startswith("_")]
		header_line = "! " + " !! ".join(headers)
		lines.append(header_line)

		for entry in entries:
			lines.append("|-")
			values = []
			for h in headers:
				v = entry.get(h, "")
				if isinstance(v, dict):
					v = v.get("name", v.get("value", ""))
				if isinstance(v, int):
					values.append(f"${v:02x}" if v < 256 else f"${v:04x}")
				else:
					values.append(str(v))
			lines.append("| " + " || ".join(values))

		lines.append("|}")
		return "\n".join(lines)


def load_schema(path: Path) -> TableDefinition:
	"""Load a table schema from JSON file."""
	with open(path, "r", encoding="utf-8") as f:
		data = json.load(f)
	return TableDefinition.from_dict(data)


def main():
	parser = argparse.ArgumentParser(
		description="Data Migration Tool - Convert between ROM hacking formats"
	)
	parser.add_argument(
		"input",
		type=Path,
		help="Input file path",
	)
	parser.add_argument(
		"-o", "--output",
		type=Path,
		help="Output file path",
	)
	parser.add_argument(
		"-f", "--from",
		dest="from_format",
		choices=[f.name.lower() for f in DataFormat],
		help="Source format (auto-detected if not specified)",
	)
	parser.add_argument(
		"-t", "--to",
		dest="to_format",
		required=True,
		choices=[f.name.lower() for f in DataFormat],
		help="Target format",
	)
	parser.add_argument(
		"-s", "--schema",
		type=Path,
		help="Schema file for binary conversion",
	)
	parser.add_argument(
		"--offset",
		type=lambda x: int(x, 0),
		default=0,
		help="Offset in binary file (for binary input)",
	)
	parser.add_argument(
		"--count",
		type=int,
		help="Number of entries to process",
	)

	args = parser.parse_args()

	# Detect source format
	source_format = None
	if args.from_format:
		source_format = DataFormat[args.from_format.upper()]
	else:
		ext = args.input.suffix.lower()
		format_map = {
			".json": DataFormat.JSON,
			".yaml": DataFormat.YAML,
			".yml": DataFormat.YAML,
			".csv": DataFormat.CSV,
			".tbl": DataFormat.TBL,
			".txt": DataFormat.ATLAS,
			".asm": DataFormat.ASM_6502,
			".s": DataFormat.ASM_6502,
			".bin": DataFormat.BINARY,
			".nes": DataFormat.BINARY,
			".sfc": DataFormat.BINARY,
			".smc": DataFormat.BINARY,
			".wikitext": DataFormat.WIKITEXT,
		}
		source_format = format_map.get(ext, DataFormat.BINARY)

	target_format = DataFormat[args.to_format.upper()]

	# Load schema if provided
	schema = None
	if args.schema:
		schema = load_schema(args.schema)
		if args.count:
			schema.entry_count = args.count

	# Read input
	if source_format == DataFormat.BINARY:
		with open(args.input, "rb") as f:
			f.seek(args.offset)
			if schema:
				input_data = f.read(schema.entry_size * schema.entry_count)
			else:
				input_data = f.read()
	else:
		with open(args.input, "r", encoding="utf-8") as f:
			if source_format == DataFormat.JSON:
				input_data = json.load(f)
			elif source_format == DataFormat.YAML and HAS_YAML:
				input_data = yaml.safe_load(f)
			else:
				input_data = f.read()

	# Convert
	migrator = DataMigrator()
	output_data = migrator.convert(source_format, target_format, input_data, schema)

	# Write output
	output_path = args.output or args.input.with_suffix(
		{
			DataFormat.JSON: ".json",
			DataFormat.YAML: ".yaml",
			DataFormat.CSV: ".csv",
			DataFormat.TBL: ".tbl",
			DataFormat.ATLAS: ".txt",
			DataFormat.ASM_6502: ".asm",
			DataFormat.ASM_65816: ".asm",
			DataFormat.BINARY: ".bin",
			DataFormat.WIKITEXT: ".wikitext",
		}.get(target_format, ".out")
	)

	if target_format == DataFormat.BINARY:
		with open(output_path, "wb") as f:
			f.write(output_data)
	elif target_format == DataFormat.JSON:
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(output_data, f, indent="\t")
	elif target_format == DataFormat.YAML and HAS_YAML:
		with open(output_path, "w", encoding="utf-8") as f:
			yaml.dump(output_data, f, default_flow_style=False)
	else:
		with open(output_path, "w", encoding="utf-8") as f:
			f.write(output_data)

	print(f"Converted {args.input} ({source_format.name}) -> {output_path} ({target_format.name})")


if __name__ == "__main__":
	main()
