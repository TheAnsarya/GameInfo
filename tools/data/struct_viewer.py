#!/usr/bin/env python3
"""
Binary Structure Viewer - View and edit binary data structures.

Tools for interpreting binary data as structured records.

Usage:
	python struct_viewer.py --analyze file.bin --struct item.json
	python struct_viewer.py --define struct.json
	python struct_viewer.py --dump file.bin --offset 0x100

Features:
	- Structure definition files
	- Auto-detection of patterns
	- Array/table support
	- Nested structures
	- Field editing
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union


class FieldType(Enum):
	"""Field data types."""
	U8 = "u8"
	I8 = "i8"
	U16 = "u16"
	I16 = "i16"
	U24 = "u24"
	U32 = "u32"
	I32 = "i32"
	F32 = "f32"
	STRING = "string"
	BYTES = "bytes"
	ARRAY = "array"
	STRUCT = "struct"
	BITFIELD = "bitfield"
	POINTER = "pointer"


@dataclass
class FieldDef:
	"""A field definition."""
	name: str
	type: FieldType
	offset: int = 0      # Relative offset within struct
	size: int = 0        # Size in bytes (for string/bytes)
	count: int = 1       # Array count
	endian: str = "little"

	# For nested/referenced types
	struct_name: str = ""

	# For bitfields
	bit_offset: int = 0
	bit_size: int = 0

	# Display
	format: str = ""     # "hex", "decimal", "binary"
	enum_name: str = ""  # Reference to enum
	description: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"name": self.name,
			"type": self.type.value,
			"offset": self.offset
		}
		if self.size:
			result["size"] = self.size
		if self.count > 1:
			result["count"] = self.count
		if self.endian != "little":
			result["endian"] = self.endian
		if self.struct_name:
			result["struct_name"] = self.struct_name
		if self.bit_offset or self.bit_size:
			result["bit_offset"] = self.bit_offset
			result["bit_size"] = self.bit_size
		if self.format:
			result["format"] = self.format
		if self.enum_name:
			result["enum"] = self.enum_name
		if self.description:
			result["description"] = self.description
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "FieldDef":
		"""Create from dictionary."""
		return cls(
			name=data.get("name", ""),
			type=FieldType(data.get("type", "u8")),
			offset=data.get("offset", 0),
			size=data.get("size", 0),
			count=data.get("count", 1),
			endian=data.get("endian", "little"),
			struct_name=data.get("struct_name", ""),
			bit_offset=data.get("bit_offset", 0),
			bit_size=data.get("bit_size", 0),
			format=data.get("format", ""),
			enum_name=data.get("enum", ""),
			description=data.get("description", "")
		)


@dataclass
class StructDef:
	"""A structure definition."""
	name: str
	size: int = 0        # Total size, 0 = auto-calculate
	fields: List[FieldDef] = field(default_factory=list)
	description: str = ""

	def get_size(self) -> int:
		"""Get calculated size."""
		if self.size > 0:
			return self.size

		max_end = 0
		for f in self.fields:
			field_size = self._get_field_size(f)
			end = f.offset + field_size * f.count
			max_end = max(max_end, end)

		return max_end

	def _get_field_size(self, f: FieldDef) -> int:
		"""Get size of a field."""
		sizes = {
			FieldType.U8: 1, FieldType.I8: 1,
			FieldType.U16: 2, FieldType.I16: 2,
			FieldType.U24: 3,
			FieldType.U32: 4, FieldType.I32: 4,
			FieldType.F32: 4,
		}
		if f.type in sizes:
			return sizes[f.type]
		return f.size or 1

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"size": self.size,
			"fields": [f.to_dict() for f in self.fields],
			"description": self.description
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StructDef":
		"""Create from dictionary."""
		struct_def = cls(
			name=data.get("name", ""),
			size=data.get("size", 0),
			description=data.get("description", "")
		)
		for field_data in data.get("fields", []):
			struct_def.fields.append(FieldDef.from_dict(field_data))
		return struct_def


class StructViewer:
	"""Viewer for binary structures."""

	def __init__(self):
		self.structs: Dict[str, StructDef] = {}
		self.enums: Dict[str, Dict[int, str]] = {}

	def define_struct(self, struct_def: StructDef):
		"""Add structure definition."""
		self.structs[struct_def.name] = struct_def

	def define_enum(self, name: str, values: Dict[int, str]):
		"""Add enum definition."""
		self.enums[name] = values

	def read_field(self, data: bytes, field: FieldDef, offset: int = 0) -> Any:
		"""Read a single field from data."""
		pos = offset + field.offset
		endian = "<" if field.endian == "little" else ">"

		if field.type == FieldType.U8:
			return data[pos] if pos < len(data) else 0

		elif field.type == FieldType.I8:
			return struct.unpack("b", bytes([data[pos]]))[0] if pos < len(data) else 0

		elif field.type == FieldType.U16:
			if pos + 2 <= len(data):
				return struct.unpack(f"{endian}H", data[pos:pos + 2])[0]
			return 0

		elif field.type == FieldType.I16:
			if pos + 2 <= len(data):
				return struct.unpack(f"{endian}h", data[pos:pos + 2])[0]
			return 0

		elif field.type == FieldType.U24:
			if pos + 3 <= len(data):
				if field.endian == "little":
					return data[pos] | (data[pos + 1] << 8) | (data[pos + 2] << 16)
				else:
					return (data[pos] << 16) | (data[pos + 1] << 8) | data[pos + 2]
			return 0

		elif field.type == FieldType.U32:
			if pos + 4 <= len(data):
				return struct.unpack(f"{endian}I", data[pos:pos + 4])[0]
			return 0

		elif field.type == FieldType.I32:
			if pos + 4 <= len(data):
				return struct.unpack(f"{endian}i", data[pos:pos + 4])[0]
			return 0

		elif field.type == FieldType.F32:
			if pos + 4 <= len(data):
				return struct.unpack(f"{endian}f", data[pos:pos + 4])[0]
			return 0.0

		elif field.type == FieldType.STRING:
			size = field.size or 16
			if pos + size <= len(data):
				raw = data[pos:pos + size]
				# Find null terminator
				end = raw.find(0)
				if end >= 0:
					raw = raw[:end]
				return raw.decode("ascii", errors="replace")
			return ""

		elif field.type == FieldType.BYTES:
			size = field.size or 1
			if pos + size <= len(data):
				return data[pos:pos + size]
			return b""

		elif field.type == FieldType.BITFIELD:
			# Read containing byte(s)
			byte_size = (field.bit_offset + field.bit_size + 7) // 8
			if pos + byte_size <= len(data):
				value = int.from_bytes(data[pos:pos + byte_size], field.endian)
				mask = (1 << field.bit_size) - 1
				return (value >> field.bit_offset) & mask
			return 0

		return None

	def read_struct(self, data: bytes, struct_name: str,
				   offset: int = 0) -> Dict[str, Any]:
		"""Read a complete structure."""
		struct_def = self.structs.get(struct_name)
		if not struct_def:
			return {}

		result = {"_offset": offset, "_struct": struct_name}

		for field in struct_def.fields:
			if field.count > 1:
				# Array
				values = []
				field_size = self._get_field_size(field)
				for i in range(field.count):
					field_copy = FieldDef(
						name=field.name,
						type=field.type,
						offset=field.offset + i * field_size,
						size=field.size,
						endian=field.endian
					)
					values.append(self.read_field(data, field_copy, offset))
				result[field.name] = values
			else:
				result[field.name] = self.read_field(data, field, offset)

		return result

	def read_array(self, data: bytes, struct_name: str, offset: int = 0,
				  count: int = 1) -> List[Dict[str, Any]]:
		"""Read array of structures."""
		struct_def = self.structs.get(struct_name)
		if not struct_def:
			return []

		struct_size = struct_def.get_size()
		results = []

		for i in range(count):
			entry_offset = offset + i * struct_size
			if entry_offset + struct_size <= len(data):
				result = self.read_struct(data, struct_name, entry_offset)
				result["_index"] = i
				results.append(result)

		return results

	def _get_field_size(self, field: FieldDef) -> int:
		"""Get size of field."""
		sizes = {
			FieldType.U8: 1, FieldType.I8: 1,
			FieldType.U16: 2, FieldType.I16: 2,
			FieldType.U24: 3,
			FieldType.U32: 4, FieldType.I32: 4,
			FieldType.F32: 4,
		}
		return sizes.get(field.type, field.size or 1)

	def format_value(self, value: Any, field: FieldDef) -> str:
		"""Format value for display."""
		if field.enum_name and field.enum_name in self.enums:
			enum_def = self.enums[field.enum_name]
			if value in enum_def:
				return f"{value} ({enum_def[value]})"

		if isinstance(value, int):
			if field.format == "hex":
				return f"0x{value:X}"
			elif field.format == "binary":
				return f"0b{value:b}"
			return str(value)

		elif isinstance(value, bytes):
			return value.hex().upper()

		return str(value)

	def format_struct(self, data: Dict[str, Any], struct_name: str,
					 indent: int = 0) -> str:
		"""Format structure for display."""
		struct_def = self.structs.get(struct_name)
		if not struct_def:
			return json.dumps(data, indent=2)

		lines = []
		prefix = "  " * indent

		offset = data.get("_offset", 0)
		index = data.get("_index", -1)

		header = f"{prefix}{struct_name}"
		if index >= 0:
			header += f" [{index}]"
		header += f" @ 0x{offset:X}"
		lines.append(header)
		lines.append(f"{prefix}" + "-" * 40)

		for field in struct_def.fields:
			if field.name.startswith("_"):
				continue

			value = data.get(field.name)
			value_str = self.format_value(value, field)

			line = f"{prefix}  {field.name}: {value_str}"
			if field.description:
				line += f"  ; {field.description}"
			lines.append(line)

		return "\n".join(lines)

	def load_definitions(self, path: Path):
		"""Load struct definitions from JSON."""
		with open(path) as f:
			data = json.load(f)

		for struct_data in data.get("structs", []):
			struct_def = StructDef.from_dict(struct_data)
			self.structs[struct_def.name] = struct_def

		for name, values in data.get("enums", {}).items():
			self.enums[name] = {int(k): v for k, v in values.items()}

	def save_definitions(self, path: Path):
		"""Save struct definitions to JSON."""
		data = {
			"structs": [s.to_dict() for s in self.structs.values()],
			"enums": {name: {str(k): v for k, v in vals.items()}
					 for name, vals in self.enums.items()}
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")


def create_sample_definitions() -> Dict[str, Any]:
	"""Create sample struct definitions."""
	return {
		"structs": [
			{
				"name": "Item",
				"size": 8,
				"description": "Game item definition",
				"fields": [
					{"name": "id", "type": "u8", "offset": 0, "format": "hex"},
					{"name": "type", "type": "u8", "offset": 1, "enum": "ItemType"},
					{"name": "power", "type": "u8", "offset": 2},
					{"name": "price", "type": "u16", "offset": 3},
					{"name": "flags", "type": "u8", "offset": 5, "format": "binary"},
					{"name": "name_ptr", "type": "u16", "offset": 6, "format": "hex"}
				]
			},
			{
				"name": "Monster",
				"size": 16,
				"description": "Monster stats",
				"fields": [
					{"name": "id", "type": "u8", "offset": 0},
					{"name": "hp", "type": "u16", "offset": 1},
					{"name": "mp", "type": "u16", "offset": 3},
					{"name": "attack", "type": "u8", "offset": 5},
					{"name": "defense", "type": "u8", "offset": 6},
					{"name": "agility", "type": "u8", "offset": 7},
					{"name": "exp", "type": "u16", "offset": 8},
					{"name": "gold", "type": "u16", "offset": 10},
					{"name": "drop_id", "type": "u8", "offset": 12},
					{"name": "drop_rate", "type": "u8", "offset": 13}
				]
			}
		],
		"enums": {
			"ItemType": {
				"0": "Weapon",
				"1": "Armor",
				"2": "Shield",
				"3": "Helmet",
				"4": "Accessory",
				"5": "Consumable",
				"6": "Key Item"
			}
		}
	}


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Binary Structure Viewer")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Binary file to analyze")
	parser.add_argument("--struct", "-s", type=str,
						help="Structure name to use")
	parser.add_argument("--defs", "-d", type=Path,
						help="Structure definitions file")
	parser.add_argument("--offset", type=str, default="0",
						help="Offset in file (hex)")
	parser.add_argument("--count", "-c", type=int, default=1,
						help="Number of entries to read")
	parser.add_argument("--dump", type=Path,
						help="Hex dump file")
	parser.add_argument("--width", "-w", type=int, default=16,
						help="Dump width")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--sample", action="store_true",
						help="Create sample definitions")

	args = parser.parse_args()
	viewer = StructViewer()

	if args.sample:
		sample = create_sample_definitions()

		if args.output:
			with open(args.output, "w") as f:
				json.dump(sample, f, indent="\t")
			print(f"Sample definitions saved to: {args.output}")
		else:
			print(json.dumps(sample, indent=2))
		return

	if args.defs:
		viewer.load_definitions(args.defs)

	offset = int(args.offset, 16) if args.offset.startswith("0x") else int(args.offset)
	if args.offset.startswith("$"):
		offset = int(args.offset[1:], 16)

	if args.dump:
		data = args.dump.read_bytes()
		lines = []

		for i in range(offset, min(offset + args.count * args.width, len(data)), args.width):
			chunk = data[i:i + args.width]
			hex_str = " ".join(f"{b:02X}" for b in chunk)
			ascii_str = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
			lines.append(f"{i:06X}  {hex_str:<{args.width * 3}}  |{ascii_str}|")

		print("\n".join(lines))
		return

	if args.analyze:
		data = args.analyze.read_bytes()

		if args.struct and args.struct in viewer.structs:
			entries = viewer.read_array(data, args.struct, offset, args.count)

			for entry in entries:
				print(viewer.format_struct(entry, args.struct))
				print()
		else:
			# Show available structs
			if viewer.structs:
				print("Available structures:")
				for name, struct_def in viewer.structs.items():
					print(f"  {name} ({struct_def.get_size()} bytes)")
					if struct_def.description:
						print(f"    {struct_def.description}")
			else:
				print("No structure definitions loaded.")
				print("Use --defs to load definitions or --sample to create sample.")
		return

	# Default: show help
	print("Binary Structure Viewer")
	print()
	print("Usage:")
	print("  --analyze FILE           Analyze binary file")
	print("  --struct NAME            Structure to apply")
	print("  --defs FILE              Load definitions")
	print("  --offset ADDR            Start offset")
	print("  --count N                Number of entries")
	print("  --dump FILE              Hex dump")
	print("  --sample                 Create sample definitions")


if __name__ == "__main__":
	main()
