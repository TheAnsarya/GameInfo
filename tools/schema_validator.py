#!/usr/bin/env python3
"""
Schema Validator

Validates JSON data files against schema definitions.
Used to ensure consistency of game data exports.

Author: GameInfo Project
License: MIT
"""

import json
import re
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Any, Union
from enum import Enum


class SchemaType(Enum):
	"""JSON Schema types"""
	STRING = "string"
	INTEGER = "integer"
	NUMBER = "number"
	BOOLEAN = "boolean"
	ARRAY = "array"
	OBJECT = "object"
	NULL = "null"


@dataclass
class ValidationError:
	"""A validation error"""
	path: str
	message: str
	value: Any = None
	expected: str = ""


@dataclass
class ValidationResult:
	"""Result of validation"""
	valid: bool
	errors: list[ValidationError] = field(default_factory=list)
	warnings: list[str] = field(default_factory=list)
	
	def add_error(self, path: str, message: str, value: Any = None, expected: str = ""):
		self.errors.append(ValidationError(path, message, value, expected))
		self.valid = False
	
	def add_warning(self, warning: str):
		self.warnings.append(warning)
	
	def __str__(self) -> str:
		if self.valid:
			return "Valid"
		
		lines = [f"Invalid: {len(self.errors)} error(s)"]
		for err in self.errors:
			lines.append(f"  - {err.path}: {err.message}")
			if err.value is not None:
				lines.append(f"    Got: {err.value!r}")
			if err.expected:
				lines.append(f"    Expected: {err.expected}")
		
		return '\n'.join(lines)


class SchemaValidator:
	"""Validate JSON data against schemas"""
	
	def __init__(self):
		self.schemas: dict[str, dict] = {}
		self.custom_formats: dict[str, callable] = {
			'hex': self._validate_hex,
			'hex-byte': self._validate_hex_byte,
			'hex-word': self._validate_hex_word,
			'hex-address': self._validate_hex_address,
			'rom-address': self._validate_rom_address,
			'cpu-address': self._validate_cpu_address,
		}
	
	def _validate_hex(self, value: str) -> bool:
		"""Validate hex string (with or without prefix)"""
		if isinstance(value, str):
			# Remove common prefixes
			clean = value.lower().replace('$', '').replace('0x', '')
			try:
				int(clean, 16)
				return True
			except ValueError:
				return False
		return False
	
	def _validate_hex_byte(self, value: str) -> bool:
		"""Validate hex byte (2 digits)"""
		if isinstance(value, str):
			clean = value.lower().replace('$', '').replace('0x', '')
			if len(clean) <= 2:
				try:
					val = int(clean, 16)
					return 0 <= val <= 0xff
				except ValueError:
					pass
		return False
	
	def _validate_hex_word(self, value: str) -> bool:
		"""Validate hex word (4 digits)"""
		if isinstance(value, str):
			clean = value.lower().replace('$', '').replace('0x', '')
			if len(clean) <= 4:
				try:
					val = int(clean, 16)
					return 0 <= val <= 0xffff
				except ValueError:
					pass
		return False
	
	def _validate_hex_address(self, value: str) -> bool:
		"""Validate hex address (up to 6 digits)"""
		if isinstance(value, str):
			clean = value.lower().replace('$', '').replace('0x', '')
			if len(clean) <= 6:
				try:
					int(clean, 16)
					return True
				except ValueError:
					pass
		return False
	
	def _validate_rom_address(self, value: str) -> bool:
		"""Validate ROM file address"""
		return self._validate_hex_address(value)
	
	def _validate_cpu_address(self, value: str) -> bool:
		"""Validate CPU address"""
		return self._validate_hex_address(value)
	
	def register_schema(self, name: str, schema: dict):
		"""Register a schema by name"""
		self.schemas[name] = schema
	
	def register_format(self, name: str, validator: callable):
		"""Register a custom format validator"""
		self.custom_formats[name] = validator
	
	def load_schema(self, path: Path) -> dict:
		"""Load schema from file"""
		with open(path, 'r', encoding='utf-8') as f:
			schema = json.load(f)
		
		# Extract schema name from $id or filename
		name = schema.get('$id', path.stem)
		self.schemas[name] = schema
		return schema
	
	def validate(self, data: Any, schema: dict, path: str = "$") -> ValidationResult:
		"""Validate data against schema"""
		result = ValidationResult(valid=True)
		self._validate_value(data, schema, path, result)
		return result
	
	def _validate_value(self, data: Any, schema: dict, path: str, result: ValidationResult):
		"""Recursively validate a value"""
		
		# Handle $ref
		if '$ref' in schema:
			ref_name = schema['$ref'].split('/')[-1]
			if ref_name in self.schemas:
				schema = self.schemas[ref_name]
			else:
				result.add_warning(f"Unknown schema reference: {schema['$ref']}")
		
		# Handle anyOf
		if 'anyOf' in schema:
			valid_for_any = False
			for sub_schema in schema['anyOf']:
				sub_result = ValidationResult(valid=True)
				self._validate_value(data, sub_schema, path, sub_result)
				if sub_result.valid:
					valid_for_any = True
					break
			if not valid_for_any:
				result.add_error(path, "Does not match any of the allowed schemas")
			return
		
		# Handle oneOf
		if 'oneOf' in schema:
			valid_count = 0
			for sub_schema in schema['oneOf']:
				sub_result = ValidationResult(valid=True)
				self._validate_value(data, sub_schema, path, sub_result)
				if sub_result.valid:
					valid_count += 1
			if valid_count != 1:
				result.add_error(path, f"Must match exactly one schema (matched {valid_count})")
			return
		
		# Handle allOf
		if 'allOf' in schema:
			for sub_schema in schema['allOf']:
				self._validate_value(data, sub_schema, path, result)
			return
		
		# Type validation
		schema_type = schema.get('type')
		if schema_type:
			if isinstance(schema_type, list):
				type_valid = any(self._check_type(data, t) for t in schema_type)
			else:
				type_valid = self._check_type(data, schema_type)
			
			if not type_valid:
				result.add_error(path, f"Invalid type", type(data).__name__, schema_type)
				return
		
		# Enum validation
		if 'enum' in schema:
			if data not in schema['enum']:
				result.add_error(path, "Value not in enum", data, str(schema['enum']))
		
		# Const validation
		if 'const' in schema:
			if data != schema['const']:
				result.add_error(path, "Value does not match const", data, schema['const'])
		
		# String validation
		if schema_type == 'string' and isinstance(data, str):
			self._validate_string(data, schema, path, result)
		
		# Number validation
		if schema_type in ('number', 'integer') and isinstance(data, (int, float)):
			self._validate_number(data, schema, path, result)
		
		# Array validation
		if schema_type == 'array' and isinstance(data, list):
			self._validate_array(data, schema, path, result)
		
		# Object validation
		if schema_type == 'object' and isinstance(data, dict):
			self._validate_object(data, schema, path, result)
	
	def _check_type(self, data: Any, schema_type: str) -> bool:
		"""Check if data matches schema type"""
		if schema_type == 'string':
			return isinstance(data, str)
		elif schema_type == 'integer':
			return isinstance(data, int) and not isinstance(data, bool)
		elif schema_type == 'number':
			return isinstance(data, (int, float)) and not isinstance(data, bool)
		elif schema_type == 'boolean':
			return isinstance(data, bool)
		elif schema_type == 'array':
			return isinstance(data, list)
		elif schema_type == 'object':
			return isinstance(data, dict)
		elif schema_type == 'null':
			return data is None
		return True
	
	def _validate_string(self, data: str, schema: dict, path: str, result: ValidationResult):
		"""Validate string constraints"""
		# Length constraints
		if 'minLength' in schema and len(data) < schema['minLength']:
			result.add_error(path, f"String too short", len(data), f">= {schema['minLength']}")
		
		if 'maxLength' in schema and len(data) > schema['maxLength']:
			result.add_error(path, f"String too long", len(data), f"<= {schema['maxLength']}")
		
		# Pattern
		if 'pattern' in schema:
			if not re.match(schema['pattern'], data):
				result.add_error(path, "Does not match pattern", data, schema['pattern'])
		
		# Format
		if 'format' in schema:
			fmt = schema['format']
			if fmt in self.custom_formats:
				if not self.custom_formats[fmt](data):
					result.add_error(path, f"Invalid format '{fmt}'", data)
	
	def _validate_number(self, data: Union[int, float], schema: dict, path: str, result: ValidationResult):
		"""Validate number constraints"""
		if 'minimum' in schema and data < schema['minimum']:
			result.add_error(path, "Below minimum", data, f">= {schema['minimum']}")
		
		if 'maximum' in schema and data > schema['maximum']:
			result.add_error(path, "Above maximum", data, f"<= {schema['maximum']}")
		
		if 'exclusiveMinimum' in schema and data <= schema['exclusiveMinimum']:
			result.add_error(path, "At or below exclusive minimum", data, f"> {schema['exclusiveMinimum']}")
		
		if 'exclusiveMaximum' in schema and data >= schema['exclusiveMaximum']:
			result.add_error(path, "At or above exclusive maximum", data, f"< {schema['exclusiveMaximum']}")
		
		if 'multipleOf' in schema and data % schema['multipleOf'] != 0:
			result.add_error(path, "Not a multiple of constraint", data, f"multiple of {schema['multipleOf']}")
	
	def _validate_array(self, data: list, schema: dict, path: str, result: ValidationResult):
		"""Validate array constraints"""
		# Length constraints
		if 'minItems' in schema and len(data) < schema['minItems']:
			result.add_error(path, "Array too short", len(data), f">= {schema['minItems']} items")
		
		if 'maxItems' in schema and len(data) > schema['maxItems']:
			result.add_error(path, "Array too long", len(data), f"<= {schema['maxItems']} items")
		
		# Unique items
		if schema.get('uniqueItems'):
			seen = []
			for item in data:
				if item in seen:
					result.add_error(path, "Duplicate items found", item)
					break
				seen.append(item)
		
		# Item validation
		if 'items' in schema:
			items_schema = schema['items']
			for i, item in enumerate(data):
				self._validate_value(item, items_schema, f"{path}[{i}]", result)
		
		# Tuple validation (prefixItems)
		if 'prefixItems' in schema:
			for i, item_schema in enumerate(schema['prefixItems']):
				if i < len(data):
					self._validate_value(data[i], item_schema, f"{path}[{i}]", result)
	
	def _validate_object(self, data: dict, schema: dict, path: str, result: ValidationResult):
		"""Validate object constraints"""
		# Required properties
		if 'required' in schema:
			for prop in schema['required']:
				if prop not in data:
					result.add_error(path, f"Missing required property '{prop}'")
		
		# Property validation
		if 'properties' in schema:
			for prop, prop_schema in schema['properties'].items():
				if prop in data:
					self._validate_value(data[prop], prop_schema, f"{path}.{prop}", result)
		
		# Additional properties
		if 'additionalProperties' in schema:
			allowed_props = set(schema.get('properties', {}).keys())
			for prop in data.keys():
				if prop not in allowed_props:
					if schema['additionalProperties'] is False:
						result.add_error(path, f"Additional property not allowed: '{prop}'")
					elif isinstance(schema['additionalProperties'], dict):
						self._validate_value(data[prop], schema['additionalProperties'], 
										   f"{path}.{prop}", result)
		
		# Pattern properties
		if 'patternProperties' in schema:
			for pattern, pattern_schema in schema['patternProperties'].items():
				for prop in data.keys():
					if re.match(pattern, prop):
						self._validate_value(data[prop], pattern_schema, f"{path}.{prop}", result)
		
		# Property count
		if 'minProperties' in schema and len(data) < schema['minProperties']:
			result.add_error(path, "Too few properties", len(data), f">= {schema['minProperties']}")
		
		if 'maxProperties' in schema and len(data) > schema['maxProperties']:
			result.add_error(path, "Too many properties", len(data), f"<= {schema['maxProperties']}")


def create_game_data_schemas() -> dict[str, dict]:
	"""Create standard schemas for game data"""
	schemas = {}
	
	# Monster schema
	schemas['monster'] = {
		"$id": "monster",
		"type": "object",
		"properties": {
			"id": {"type": "integer", "minimum": 0},
			"name": {"type": "string", "minLength": 1},
			"hp": {"type": "integer", "minimum": 0},
			"mp": {"type": "integer", "minimum": 0},
			"attack": {"type": "integer", "minimum": 0},
			"defense": {"type": "integer", "minimum": 0},
			"agility": {"type": "integer", "minimum": 0},
			"exp": {"type": "integer", "minimum": 0},
			"gold": {"type": "integer", "minimum": 0},
			"rom_offset": {"type": "string", "format": "hex-address"},
		},
		"required": ["id", "name"]
	}
	
	# Item schema
	schemas['item'] = {
		"$id": "item",
		"type": "object",
		"properties": {
			"id": {"type": "integer", "minimum": 0},
			"name": {"type": "string", "minLength": 1},
			"type": {"type": "string", "enum": ["weapon", "armor", "shield", "helmet", "accessory", "consumable", "key"]},
			"price": {"type": "integer", "minimum": 0},
			"attack": {"type": "integer"},
			"defense": {"type": "integer"},
			"effect": {"type": "string"},
			"rom_offset": {"type": "string", "format": "hex-address"},
		},
		"required": ["id", "name"]
	}
	
	# Spell schema
	schemas['spell'] = {
		"$id": "spell",
		"type": "object",
		"properties": {
			"id": {"type": "integer", "minimum": 0},
			"name": {"type": "string", "minLength": 1},
			"mp_cost": {"type": "integer", "minimum": 0},
			"effect": {"type": "string"},
			"target": {"type": "string", "enum": ["self", "ally", "all_allies", "enemy", "all_enemies"]},
			"rom_offset": {"type": "string", "format": "hex-address"},
		},
		"required": ["id", "name", "mp_cost"]
	}
	
	# Map schema
	schemas['map'] = {
		"$id": "map",
		"type": "object",
		"properties": {
			"id": {"type": "integer", "minimum": 0},
			"name": {"type": "string"},
			"width": {"type": "integer", "minimum": 1},
			"height": {"type": "integer", "minimum": 1},
			"tileset": {"type": "integer", "minimum": 0},
			"music": {"type": "integer", "minimum": 0},
			"encounters": {"type": "boolean"},
			"rom_offset": {"type": "string", "format": "hex-address"},
			"tiles": {
				"type": "array",
				"items": {"type": "integer", "minimum": 0, "maximum": 255}
			}
		},
		"required": ["id", "width", "height"]
	}
	
	# ROM info schema
	schemas['rom_info'] = {
		"$id": "rom_info",
		"type": "object",
		"properties": {
			"title": {"type": "string"},
			"platform": {"type": "string", "enum": ["nes", "snes", "genesis", "gb", "gbc", "gba"]},
			"mapper": {"type": "integer", "minimum": 0},
			"prg_size": {"type": "integer", "minimum": 0},
			"chr_size": {"type": "integer", "minimum": 0},
			"checksum": {"type": "string", "format": "hex"},
			"crc32": {"type": "string", "format": "hex"},
		},
		"required": ["title", "platform"]
	}
	
	return schemas


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Schema Validator - Validate JSON game data"
	)
	parser.add_argument('data', help='JSON data file to validate')
	parser.add_argument('-s', '--schema', help='Schema file (JSON Schema format)')
	parser.add_argument('-t', '--type', 
					   choices=['monster', 'item', 'spell', 'map', 'rom_info'],
					   help='Use built-in schema type')
	parser.add_argument('--schema-dir', help='Directory containing schema files')
	parser.add_argument('-v', '--verbose', action='store_true',
					   help='Verbose output')
	
	args = parser.parse_args()
	
	validator = SchemaValidator()
	
	# Load built-in schemas
	built_in = create_game_data_schemas()
	for name, schema in built_in.items():
		validator.register_schema(name, schema)
	
	# Load schema directory
	if args.schema_dir:
		schema_dir = Path(args.schema_dir)
		for schema_file in schema_dir.glob('*.json'):
			try:
				validator.load_schema(schema_file)
				if args.verbose:
					print(f"Loaded schema: {schema_file.stem}")
			except Exception as e:
				print(f"Warning: Could not load {schema_file}: {e}")
	
	# Determine schema to use
	if args.schema:
		schema = validator.load_schema(Path(args.schema))
	elif args.type:
		schema = built_in[args.type]
	else:
		print("Error: Specify --schema or --type")
		return 1
	
	# Load data
	data_path = Path(args.data)
	with open(data_path, 'r', encoding='utf-8') as f:
		data = json.load(f)
	
	# Validate
	result = validator.validate(data, schema)
	
	print(f"Validating: {data_path}")
	print(result)
	
	if result.warnings:
		print("\nWarnings:")
		for warning in result.warnings:
			print(f"  - {warning}")
	
	return 0 if result.valid else 1


if __name__ == "__main__":
	exit(main())
