#!/usr/bin/env python3
"""
Configuration Manager

Manage project configurations for ROM hacking and game analysis projects.
Supports JSON and YAML configurations with validation, merging, and templates.

Features:
- Create project configurations
- Validate configurations against schemas
- Merge multiple configs
- Environment variable substitution
- Template generation

Usage:
	python config_manager.py init <project_name> --type nes
	python config_manager.py validate <config.json>
	python config_manager.py merge <base.json> <override.json> --output merged.json
	python config_manager.py env <config.json> --output resolved.json
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Union


# Default project templates
PROJECT_TEMPLATES = {
	'nes': {
		'name': '',
		'type': 'nes',
		'rom': {
			'path': '',
			'format': 'ines',
			'prg_size': 0,
			'chr_size': 0,
			'mapper': 0,
		},
		'build': {
			'assembler': 'ca65',
			'output_dir': 'build',
			'source_dir': 'src',
		},
		'labels': {
			'mlb_file': '',
			'nl_dir': '',
			'auto_export': True,
		},
		'cdl': {
			'path': '',
			'format': 'mesen',
		},
		'tools': {
			'emulator': 'mesen',
			'debugger': 'mesen',
			'hex_editor': '',
			'tile_editor': '',
		},
	},
	'snes': {
		'name': '',
		'type': 'snes',
		'rom': {
			'path': '',
			'format': 'sfc',
			'hirom': False,
			'header': False,
		},
		'build': {
			'assembler': 'asar',
			'output_dir': 'build',
			'source_dir': 'src',
		},
		'labels': {
			'mlb_file': '',
			'sym_file': '',
		},
		'tools': {
			'emulator': 'bsnes',
			'debugger': 'bsnes',
		},
	},
	'gb': {
		'name': '',
		'type': 'gb',
		'rom': {
			'path': '',
			'format': 'gb',
			'cgb': False,
			'sgb': False,
		},
		'build': {
			'assembler': 'rgbds',
			'output_dir': 'build',
			'source_dir': 'src',
		},
		'labels': {
			'sym_file': '',
		},
		'tools': {
			'emulator': 'bgb',
			'debugger': 'bgb',
		},
	},
	'generic': {
		'name': '',
		'type': 'generic',
		'rom': {
			'path': '',
		},
		'build': {
			'output_dir': 'build',
			'source_dir': 'src',
		},
		'labels': {},
		'tools': {},
	},
}


# Configuration schema for validation
CONFIG_SCHEMA = {
	'type': 'object',
	'required': ['name', 'type'],
	'properties': {
		'name': {'type': 'string'},
		'type': {'type': 'string', 'enum': ['nes', 'snes', 'gb', 'gba', 'genesis', 'generic']},
		'rom': {
			'type': 'object',
			'properties': {
				'path': {'type': 'string'},
				'format': {'type': 'string'},
			},
		},
		'build': {
			'type': 'object',
			'properties': {
				'assembler': {'type': 'string'},
				'output_dir': {'type': 'string'},
				'source_dir': {'type': 'string'},
			},
		},
		'labels': {
			'type': 'object',
		},
		'cdl': {
			'type': 'object',
			'properties': {
				'path': {'type': 'string'},
				'format': {'type': 'string', 'enum': ['fceux', 'mesen', 'mesen2']},
			},
		},
		'tools': {
			'type': 'object',
		},
	},
}


@dataclass
class ValidationResult:
	"""Result of configuration validation"""
	valid: bool = True
	errors: List[str] = field(default_factory=list)
	warnings: List[str] = field(default_factory=list)


class ConfigValidator:
	"""Validate configuration files"""

	@staticmethod
	def validate(config: Dict, schema: Dict = None) -> ValidationResult:
		"""Validate configuration against schema"""
		result = ValidationResult()

		if schema is None:
			schema = CONFIG_SCHEMA

		# Check required fields
		for req_field in schema.get('required', []):
			if req_field not in config:
				result.valid = False
				result.errors.append(f"Missing required field: {req_field}")

		# Check field types
		properties = schema.get('properties', {})
		for field_name, field_schema in properties.items():
			if field_name not in config:
				continue

			value = config[field_name]
			expected_type = field_schema.get('type')

			if expected_type == 'string' and not isinstance(value, str):
				result.valid = False
				result.errors.append(f"Field '{field_name}' should be string")
			elif expected_type == 'number' and not isinstance(value, (int, float)):
				result.valid = False
				result.errors.append(f"Field '{field_name}' should be number")
			elif expected_type == 'object' and not isinstance(value, dict):
				result.valid = False
				result.errors.append(f"Field '{field_name}' should be object")
			elif expected_type == 'array' and not isinstance(value, list):
				result.valid = False
				result.errors.append(f"Field '{field_name}' should be array")

			# Check enum
			if 'enum' in field_schema and value not in field_schema['enum']:
				result.valid = False
				result.errors.append(f"Field '{field_name}' should be one of: {field_schema['enum']}")

		# Custom validations
		if 'rom' in config and 'path' in config['rom']:
			rom_path = config['rom']['path']
			if rom_path and not rom_path.startswith('${') and not os.path.exists(rom_path):
				result.warnings.append(f"ROM path does not exist: {rom_path}")

		return result


class ConfigMerger:
	"""Merge multiple configuration files"""

	@staticmethod
	def merge(base: Dict, override: Dict, deep: bool = True) -> Dict:
		"""Merge override into base configuration"""
		result = base.copy()

		for key, value in override.items():
			if deep and key in result and isinstance(result[key], dict) and isinstance(value, dict):
				result[key] = ConfigMerger.merge(result[key], value, deep=True)
			else:
				result[key] = value

		return result

	@staticmethod
	def merge_files(filepaths: List[str]) -> Dict:
		"""Merge multiple configuration files"""
		result = {}

		for filepath in filepaths:
			with open(filepath, 'r', encoding='utf-8') as f:
				config = json.load(f)
			result = ConfigMerger.merge(result, config)

		return result


class EnvironmentResolver:
	"""Resolve environment variables in configuration"""

	ENV_PATTERN = re.compile(r'\$\{([^}]+)\}')

	@classmethod
	def resolve(cls, config: Any, env: Dict[str, str] = None) -> Any:
		"""Resolve environment variables in configuration"""
		if env is None:
			env = dict(os.environ)

		if isinstance(config, str):
			return cls._resolve_string(config, env)
		elif isinstance(config, dict):
			return {k: cls.resolve(v, env) for k, v in config.items()}
		elif isinstance(config, list):
			return [cls.resolve(item, env) for item in config]
		else:
			return config

	@classmethod
	def _resolve_string(cls, value: str, env: Dict[str, str]) -> str:
		"""Resolve environment variables in string"""
		def replace(match):
			var_name = match.group(1)
			# Support default values: ${VAR:-default}
			if ':-' in var_name:
				var_name, default = var_name.split(':-', 1)
				return env.get(var_name, default)
			return env.get(var_name, match.group(0))

		return cls.ENV_PATTERN.sub(replace, value)


class ConfigManager:
	"""Main configuration manager"""

	@staticmethod
	def create_project(name: str, project_type: str, output_dir: str = '.') -> str:
		"""Create new project configuration"""
		template = PROJECT_TEMPLATES.get(project_type, PROJECT_TEMPLATES['generic']).copy()

		# Deep copy
		import copy
		config = copy.deepcopy(template)
		config['name'] = name

		# Create output path
		os.makedirs(output_dir, exist_ok=True)
		config_path = os.path.join(output_dir, 'project.json')

		# Write configuration
		with open(config_path, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(config, f, indent='\t')

		return config_path

	@staticmethod
	def load(filepath: str, resolve_env: bool = True) -> Dict:
		"""Load configuration from file"""
		with open(filepath, 'r', encoding='utf-8') as f:
			config = json.load(f)

		if resolve_env:
			config = EnvironmentResolver.resolve(config)

		return config

	@staticmethod
	def save(config: Dict, filepath: str) -> None:
		"""Save configuration to file"""
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(config, f, indent='\t')

	@staticmethod
	def generate_schema(project_type: str = None) -> Dict:
		"""Generate JSON schema for configuration"""
		schema = {
			'$schema': 'http://json-schema.org/draft-07/schema#',
			'title': 'Project Configuration',
			'type': 'object',
			'required': ['name', 'type'],
			'properties': {
				'name': {
					'type': 'string',
					'description': 'Project name',
				},
				'type': {
					'type': 'string',
					'description': 'Project type',
					'enum': list(PROJECT_TEMPLATES.keys()),
				},
				'rom': {
					'type': 'object',
					'description': 'ROM configuration',
					'properties': {
						'path': {'type': 'string', 'description': 'Path to ROM file'},
						'format': {'type': 'string', 'description': 'ROM format'},
					},
				},
				'build': {
					'type': 'object',
					'description': 'Build configuration',
					'properties': {
						'assembler': {'type': 'string', 'description': 'Assembler to use'},
						'output_dir': {'type': 'string', 'description': 'Output directory'},
						'source_dir': {'type': 'string', 'description': 'Source directory'},
					},
				},
				'labels': {
					'type': 'object',
					'description': 'Label file configuration',
				},
				'cdl': {
					'type': 'object',
					'description': 'CDL file configuration',
					'properties': {
						'path': {'type': 'string'},
						'format': {
							'type': 'string',
							'enum': ['fceux', 'mesen', 'mesen2'],
						},
					},
				},
				'tools': {
					'type': 'object',
					'description': 'Tool paths and preferences',
				},
			},
		}

		return schema


def main():
	parser = argparse.ArgumentParser(
		description='Configuration Manager',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Init command
	init_parser = subparsers.add_parser('init', help='Initialize new project')
	init_parser.add_argument('name', help='Project name')
	init_parser.add_argument('--type', '-t', default='generic',
							 choices=list(PROJECT_TEMPLATES.keys()),
							 help='Project type')
	init_parser.add_argument('--output', '-o', default='.', help='Output directory')

	# Validate command
	validate_parser = subparsers.add_parser('validate', help='Validate configuration')
	validate_parser.add_argument('config', help='Configuration file to validate')
	validate_parser.add_argument('--schema', '-s', help='Custom schema file')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Merge configurations')
	merge_parser.add_argument('configs', nargs='+', help='Configuration files to merge')
	merge_parser.add_argument('--output', '-o', required=True, help='Output file')

	# Env command
	env_parser = subparsers.add_parser('env', help='Resolve environment variables')
	env_parser.add_argument('config', help='Configuration file')
	env_parser.add_argument('--output', '-o', help='Output file (default: stdout)')

	# Schema command
	schema_parser = subparsers.add_parser('schema', help='Generate JSON schema')
	schema_parser.add_argument('--type', '-t', help='Project type')
	schema_parser.add_argument('--output', '-o', help='Output file')

	# Get command
	get_parser = subparsers.add_parser('get', help='Get configuration value')
	get_parser.add_argument('config', help='Configuration file')
	get_parser.add_argument('key', help='Key path (e.g., rom.path)')

	# Set command
	set_parser = subparsers.add_parser('set', help='Set configuration value')
	set_parser.add_argument('config', help='Configuration file')
	set_parser.add_argument('key', help='Key path (e.g., rom.path)')
	set_parser.add_argument('value', help='Value to set')

	args = parser.parse_args()

	if args.command == 'init':
		config_path = ConfigManager.create_project(args.name, args.type, args.output)
		print(f"Created project configuration: {config_path}")

		# Also create directory structure
		dirs = ['src', 'build', 'assets', 'docs']
		for d in dirs:
			dir_path = os.path.join(args.output, d)
			os.makedirs(dir_path, exist_ok=True)
			print(f"Created directory: {dir_path}")

	elif args.command == 'validate':
		config = ConfigManager.load(args.config, resolve_env=False)

		schema = None
		if args.schema:
			with open(args.schema, 'r', encoding='utf-8') as f:
				schema = json.load(f)

		result = ConfigValidator.validate(config, schema)

		if result.valid:
			print("Configuration is valid")
		else:
			print("Configuration is INVALID")

		if result.errors:
			print("\nErrors:")
			for error in result.errors:
				print(f"  - {error}")

		if result.warnings:
			print("\nWarnings:")
			for warning in result.warnings:
				print(f"  - {warning}")

		sys.exit(0 if result.valid else 1)

	elif args.command == 'merge':
		merged = ConfigMerger.merge_files(args.configs)
		ConfigManager.save(merged, args.output)
		print(f"Merged {len(args.configs)} configs to: {args.output}")

	elif args.command == 'env':
		config = ConfigManager.load(args.config, resolve_env=True)

		if args.output:
			ConfigManager.save(config, args.output)
			print(f"Resolved config saved to: {args.output}")
		else:
			print(json.dumps(config, indent='\t'))

	elif args.command == 'schema':
		schema = ConfigManager.generate_schema(args.type)

		if args.output:
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(schema, f, indent='\t')
			print(f"Schema saved to: {args.output}")
		else:
			print(json.dumps(schema, indent='\t'))

	elif args.command == 'get':
		config = ConfigManager.load(args.config)

		# Navigate to key
		value = config
		for key in args.key.split('.'):
			if isinstance(value, dict) and key in value:
				value = value[key]
			else:
				print(f"Key not found: {args.key}")
				sys.exit(1)

		if isinstance(value, (dict, list)):
			print(json.dumps(value, indent='\t'))
		else:
			print(value)

	elif args.command == 'set':
		config = ConfigManager.load(args.config, resolve_env=False)

		# Navigate to parent and set value
		keys = args.key.split('.')
		parent = config
		for key in keys[:-1]:
			if key not in parent:
				parent[key] = {}
			parent = parent[key]

		# Try to parse value as JSON
		try:
			value = json.loads(args.value)
		except json.JSONDecodeError:
			value = args.value

		parent[keys[-1]] = value
		ConfigManager.save(config, args.config)
		print(f"Set {args.key} = {value}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
