#!/usr/bin/env python3
"""
Event Script Decompiler

Decompiles game event scripts from binary format to readable code.
Supports multiple script engine formats common in RPGs.

Author: GameInfo Project
License: MIT
"""

import struct
import json
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional, Callable
from enum import Enum


class ScriptType(Enum):
	"""Common script engine types"""
	GENERIC = "generic"
	DQ_NES = "dq_nes"         # Dragon Quest NES
	DQ_SNES = "dq_snes"       # Dragon Quest SNES
	FF_NES = "ff_nes"         # Final Fantasy NES
	FF_SNES = "ff_snes"       # Final Fantasy SNES
	CT_SNES = "ct_snes"       # Chrono Trigger SNES
	EARTHBOUND = "earthbound"  # EarthBound/Mother 2


@dataclass
class ScriptCommand:
	"""A single script command"""
	offset: int
	opcode: int
	name: str
	params: list[int] = field(default_factory=list)
	param_names: list[str] = field(default_factory=list)
	size: int = 1
	comment: str = ""
	is_branch: bool = False
	branch_target: int = 0


@dataclass
class ScriptBlock:
	"""A block of script commands"""
	offset: int
	commands: list[ScriptCommand] = field(default_factory=list)
	name: str = ""
	labels: dict[int, str] = field(default_factory=dict)


@dataclass
class CommandDef:
	"""Definition of a script command"""
	opcode: int
	name: str
	param_sizes: list[int] = field(default_factory=list)  # Size of each param in bytes
	param_names: list[str] = field(default_factory=list)
	is_branch: bool = False
	is_conditional: bool = False
	is_end: bool = False
	formatter: Optional[Callable] = None


class ScriptEngine:
	"""Base class for script engine definitions"""

	def __init__(self):
		self.commands: dict[int, CommandDef] = {}
		self.text_table: dict[int, str] = {}
		self.item_table: dict[int, str] = {}
		self.monster_table: dict[int, str] = {}
		self.character_table: dict[int, str] = {}
		self.flag_table: dict[int, str] = {}

	def add_command(self, opcode: int, name: str, param_sizes: list[int] = None,
				   param_names: list[str] = None, **kwargs):
		"""Add a command definition"""
		self.commands[opcode] = CommandDef(
			opcode=opcode,
			name=name,
			param_sizes=param_sizes or [],
			param_names=param_names or [],
			**kwargs
		)

	def get_command(self, opcode: int) -> Optional[CommandDef]:
		"""Get command definition by opcode"""
		return self.commands.get(opcode)


class GenericScriptEngine(ScriptEngine):
	"""Generic script engine with common commands"""

	def __init__(self):
		super().__init__()

		# Common commands found in many games
		self.add_command(0x00, "NOP")
		self.add_command(0xff, "END", is_end=True)

		# Dialogue/text
		self.add_command(0x01, "TEXT", [1], ["text_id"])
		self.add_command(0x02, "CHOICE", [1], ["choice_id"])

		# Flow control
		self.add_command(0x10, "JUMP", [2], ["address"], is_branch=True)
		self.add_command(0x11, "CALL", [2], ["address"], is_branch=True)
		self.add_command(0x12, "RETURN", is_end=True)
		self.add_command(0x13, "JUMP_IF", [1, 2], ["flag", "address"], is_branch=True, is_conditional=True)
		self.add_command(0x14, "JUMP_IF_NOT", [1, 2], ["flag", "address"], is_branch=True, is_conditional=True)

		# Flags/variables
		self.add_command(0x20, "SET_FLAG", [1], ["flag_id"])
		self.add_command(0x21, "CLEAR_FLAG", [1], ["flag_id"])
		self.add_command(0x22, "CHECK_FLAG", [1], ["flag_id"])
		self.add_command(0x23, "SET_VAR", [1, 1], ["var_id", "value"])
		self.add_command(0x24, "ADD_VAR", [1, 1], ["var_id", "value"])

		# Party/character
		self.add_command(0x30, "ADD_PARTY", [1], ["char_id"])
		self.add_command(0x31, "REMOVE_PARTY", [1], ["char_id"])
		self.add_command(0x32, "HEAL_PARTY")

		# Items
		self.add_command(0x40, "GIVE_ITEM", [1], ["item_id"])
		self.add_command(0x41, "TAKE_ITEM", [1], ["item_id"])
		self.add_command(0x42, "CHECK_ITEM", [1], ["item_id"])
		self.add_command(0x43, "GIVE_GOLD", [2], ["amount"])
		self.add_command(0x44, "TAKE_GOLD", [2], ["amount"])

		# Screen/map
		self.add_command(0x50, "FADE_OUT")
		self.add_command(0x51, "FADE_IN")
		self.add_command(0x52, "WARP", [1, 1, 1], ["map_id", "x", "y"])
		self.add_command(0x53, "MOVE_PLAYER", [1, 1], ["x", "y"])

		# Battle
		self.add_command(0x60, "START_BATTLE", [1], ["battle_id"])
		self.add_command(0x61, "FORCE_ENCOUNTER", [1], ["monster_id"])

		# Sound
		self.add_command(0x70, "PLAY_MUSIC", [1], ["music_id"])
		self.add_command(0x71, "PLAY_SFX", [1], ["sfx_id"])
		self.add_command(0x72, "STOP_MUSIC")

		# Wait
		self.add_command(0x80, "WAIT", [1], ["frames"])
		self.add_command(0x81, "WAIT_INPUT")


class DQNESScriptEngine(ScriptEngine):
	"""Dragon Quest NES script engine"""

	def __init__(self):
		super().__init__()

		# Dragon Quest NES specific commands
		self.add_command(0x00, "END", is_end=True)
		self.add_command(0x01, "TEXT", [1], ["text_id"])
		self.add_command(0x02, "CHOICE_YES_NO")
		self.add_command(0x03, "JUMP_IF_YES", [2], ["address"], is_branch=True, is_conditional=True)
		self.add_command(0x04, "JUMP_IF_NO", [2], ["address"], is_branch=True, is_conditional=True)
		self.add_command(0x05, "GIVE_ITEM", [1], ["item_id"])
		self.add_command(0x06, "TAKE_ITEM", [1], ["item_id"])
		self.add_command(0x07, "CHECK_ITEM", [1], ["item_id"])
		self.add_command(0x08, "GIVE_GOLD", [2], ["amount"])
		self.add_command(0x09, "HEAL_HP")
		self.add_command(0x0a, "HEAL_MP")
		self.add_command(0x0b, "CURE_STATUS")
		self.add_command(0x0c, "SET_FLAG", [1], ["flag_id"])
		self.add_command(0x0d, "CLEAR_FLAG", [1], ["flag_id"])
		self.add_command(0x0e, "CHECK_FLAG", [1], ["flag_id"])
		self.add_command(0x0f, "JUMP", [2], ["address"], is_branch=True)


class ScriptDecompiler:
	"""Decompile binary scripts to readable code"""

	def __init__(self, engine: ScriptEngine):
		self.engine = engine
		self.blocks: list[ScriptBlock] = []
		self.labels: dict[int, str] = {}
		self.label_counter = 0

	def decompile(self, data: bytes, start_offset: int = 0,
				 base_address: int = 0) -> ScriptBlock:
		"""Decompile a script block"""
		block = ScriptBlock(offset=start_offset)
		pos = start_offset
		pending_branches = []

		while pos < len(data):
			opcode = data[pos]
			cmd_def = self.engine.get_command(opcode)

			if cmd_def:
				command = ScriptCommand(
					offset=pos,
					opcode=opcode,
					name=cmd_def.name,
					size=1 + sum(cmd_def.param_sizes),
					is_branch=cmd_def.is_branch
				)

				# Read parameters
				param_pos = pos + 1
				for i, size in enumerate(cmd_def.param_sizes):
					if param_pos + size <= len(data):
						if size == 1:
							value = data[param_pos]
						elif size == 2:
							value = struct.unpack_from('<H', data, param_pos)[0]
						else:
							value = int.from_bytes(data[param_pos:param_pos + size], 'little')

						command.params.append(value)

						if i < len(cmd_def.param_names):
							command.param_names.append(cmd_def.param_names[i])

						# Track branch target
						if cmd_def.is_branch and 'address' in cmd_def.param_names[i:i+1]:
							command.branch_target = value
							if value not in self.labels:
								self.labels[value] = f"label_{self.label_counter}"
								self.label_counter += 1
							pending_branches.append(value)

						param_pos += size

				block.commands.append(command)
				pos += command.size

				# Stop at END command
				if cmd_def.is_end:
					break

			else:
				# Unknown opcode
				command = ScriptCommand(
					offset=pos,
					opcode=opcode,
					name=f"UNKNOWN_{opcode:02x}",
					size=1,
					comment="Unknown command"
				)
				block.commands.append(command)
				pos += 1

		# Add labels to block
		block.labels = {k: v for k, v in self.labels.items()
					   if start_offset <= k < pos}

		self.blocks.append(block)
		return block

	def format_command(self, cmd: ScriptCommand, include_offset: bool = True) -> str:
		"""Format a command as readable text"""
		parts = []

		# Offset
		if include_offset:
			parts.append(f"{cmd.offset:04x}:")

		# Label
		if cmd.offset in self.labels:
			parts.append(f"\n{self.labels[cmd.offset]}:")

		# Indent
		parts.append("\t")

		# Command name
		parts.append(cmd.name)

		# Parameters
		if cmd.params:
			param_strs = []
			for i, (param, name) in enumerate(zip(cmd.params, cmd.param_names or [])):
				if 'address' in name:
					# Show as label reference
					if param in self.labels:
						param_strs.append(self.labels[param])
					else:
						param_strs.append(f"${param:04x}")
				elif 'id' in name:
					# Show as hex ID
					param_strs.append(f"${param:02x}")
				else:
					# Show as decimal
					param_strs.append(str(param))

			parts.append(" " + ", ".join(param_strs))

		# Comment
		if cmd.comment:
			parts.append(f"  ; {cmd.comment}")

		return "".join(parts)

	def format_block(self, block: ScriptBlock) -> str:
		"""Format a script block as readable text"""
		lines = []

		if block.name:
			lines.append(f"; Script: {block.name}")
		lines.append(f"; Offset: ${block.offset:04x}")
		lines.append("")

		for cmd in block.commands:
			# Check for label
			if cmd.offset in self.labels:
				lines.append(f"{self.labels[cmd.offset]}:")

			lines.append(self.format_command(cmd))

		return '\n'.join(lines)

	def to_json(self, block: ScriptBlock) -> dict:
		"""Export block to JSON format"""
		return {
			'offset': f"0x{block.offset:04x}",
			'name': block.name,
			'labels': {f"0x{k:04x}": v for k, v in block.labels.items()},
			'commands': [
				{
					'offset': f"0x{cmd.offset:04x}",
					'opcode': f"0x{cmd.opcode:02x}",
					'name': cmd.name,
					'params': cmd.params,
					'param_names': cmd.param_names,
					'size': cmd.size,
					'is_branch': cmd.is_branch,
					'branch_target': f"0x{cmd.branch_target:04x}" if cmd.branch_target else None
				}
				for cmd in block.commands
			]
		}


class ScriptCompiler:
	"""Compile readable script code back to binary"""

	def __init__(self, engine: ScriptEngine):
		self.engine = engine
		self.labels: dict[str, int] = {}

	def compile(self, source: str, base_address: int = 0) -> bytes:
		"""Compile script source to binary"""
		lines = source.split('\n')
		result = bytearray()
		pending_refs: list[tuple[int, str, int]] = []  # (offset, label, param_size)

		current_offset = base_address

		# First pass: collect labels
		for line in lines:
			line = line.split(';')[0].strip()  # Remove comments

			if not line:
				continue

			if line.endswith(':'):
				# Label definition
				label_name = line[:-1].strip()
				self.labels[label_name] = current_offset
			else:
				# Count command size
				parts = line.split(None, 1)
				if parts:
					cmd_name = parts[0].upper()
					# Find command by name
					for opcode, cmd_def in self.engine.commands.items():
						if cmd_def.name == cmd_name:
							current_offset += 1 + sum(cmd_def.param_sizes)
							break

		# Second pass: compile
		current_offset = base_address
		for line in lines:
			line = line.split(';')[0].strip()

			if not line or line.endswith(':'):
				continue

			parts = line.split(None, 1)
			if not parts:
				continue

			cmd_name = parts[0].upper()
			params_str = parts[1] if len(parts) > 1 else ""

			# Find command
			cmd_def = None
			for opcode, cd in self.engine.commands.items():
				if cd.name == cmd_name:
					cmd_def = cd
					break

			if not cmd_def:
				print(f"Warning: Unknown command '{cmd_name}'")
				continue

			# Write opcode
			result.append(cmd_def.opcode)

			# Parse and write parameters
			if params_str and cmd_def.param_sizes:
				param_values = [p.strip() for p in params_str.split(',')]

				for i, (size, value_str) in enumerate(zip(cmd_def.param_sizes, param_values)):
					if value_str.startswith('$'):
						# Hex value
						value = int(value_str[1:], 16)
					elif value_str.isdigit():
						# Decimal value
						value = int(value_str)
					elif value_str in self.labels:
						# Label reference
						value = self.labels[value_str]
					else:
						# Unknown - might be forward reference
						pending_refs.append((len(result), value_str, size))
						value = 0

					if size == 1:
						result.append(value & 0xff)
					elif size == 2:
						result.extend(struct.pack('<H', value & 0xffff))
					else:
						result.extend(value.to_bytes(size, 'little'))

			current_offset = base_address + len(result)

		# Resolve pending references
		for offset, label, size in pending_refs:
			if label in self.labels:
				value = self.labels[label]
				if size == 1:
					result[offset] = value & 0xff
				elif size == 2:
					struct.pack_into('<H', result, offset, value & 0xffff)
			else:
				print(f"Warning: Unresolved label '{label}'")

		return bytes(result)


def load_engine(script_type: ScriptType) -> ScriptEngine:
	"""Load script engine by type"""
	if script_type == ScriptType.DQ_NES:
		return DQNESScriptEngine()
	else:
		return GenericScriptEngine()


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Event Script Decompiler"
	)
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Decompile command
	decompile_parser = subparsers.add_parser('decompile', help='Decompile script')
	decompile_parser.add_argument('input', help='Input ROM or binary file')
	decompile_parser.add_argument('-o', '--output', help='Output file')
	decompile_parser.add_argument('--offset', type=lambda x: int(x, 0), default=0,
								 help='Start offset')
	decompile_parser.add_argument('--length', type=lambda x: int(x, 0), default=256,
								 help='Maximum length')
	decompile_parser.add_argument('--engine', choices=['generic', 'dq_nes', 'dq_snes'],
								 default='generic', help='Script engine type')
	decompile_parser.add_argument('--json', action='store_true', help='Output as JSON')

	# Compile command
	compile_parser = subparsers.add_parser('compile', help='Compile script')
	compile_parser.add_argument('input', help='Input script file')
	compile_parser.add_argument('-o', '--output', required=True, help='Output binary')
	compile_parser.add_argument('--engine', choices=['generic', 'dq_nes', 'dq_snes'],
							   default='generic', help='Script engine type')
	compile_parser.add_argument('--base', type=lambda x: int(x, 0), default=0,
							   help='Base address')

	# List command
	list_parser = subparsers.add_parser('list', help='List engine commands')
	list_parser.add_argument('--engine', choices=['generic', 'dq_nes', 'dq_snes'],
							default='generic', help='Script engine type')

	args = parser.parse_args()

	if args.command == 'decompile':
		# Load engine
		engine_map = {
			'generic': ScriptType.GENERIC,
			'dq_nes': ScriptType.DQ_NES,
			'dq_snes': ScriptType.DQ_SNES,
		}
		engine = load_engine(engine_map.get(args.engine, ScriptType.GENERIC))

		# Read data
		input_path = Path(args.input)
		data = input_path.read_bytes()

		# Decompile
		decompiler = ScriptDecompiler(engine)
		block = decompiler.decompile(data[args.offset:args.offset + args.length], args.offset)

		if args.json:
			output = json.dumps(decompiler.to_json(block), indent='\t')
		else:
			output = decompiler.format_block(block)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Wrote decompiled script to {args.output}")
		else:
			print(output)

	elif args.command == 'compile':
		engine_map = {
			'generic': ScriptType.GENERIC,
			'dq_nes': ScriptType.DQ_NES,
			'dq_snes': ScriptType.DQ_SNES,
		}
		engine = load_engine(engine_map.get(args.engine, ScriptType.GENERIC))

		# Read source
		source = Path(args.input).read_text(encoding='utf-8')

		# Compile
		compiler = ScriptCompiler(engine)
		binary = compiler.compile(source, args.base)

		# Write output
		Path(args.output).write_bytes(binary)
		print(f"Compiled {len(binary)} bytes to {args.output}")

	elif args.command == 'list':
		engine_map = {
			'generic': ScriptType.GENERIC,
			'dq_nes': ScriptType.DQ_NES,
			'dq_snes': ScriptType.DQ_SNES,
		}
		engine = load_engine(engine_map.get(args.engine, ScriptType.GENERIC))

		print(f"Commands for {args.engine} engine:")
		print("-" * 60)
		for opcode in sorted(engine.commands.keys()):
			cmd = engine.commands[opcode]
			params = ', '.join(cmd.param_names) if cmd.param_names else ''
			flags = []
			if cmd.is_branch:
				flags.append('branch')
			if cmd.is_conditional:
				flags.append('conditional')
			if cmd.is_end:
				flags.append('end')
			flags_str = f" [{', '.join(flags)}]" if flags else ''
			print(f"  ${opcode:02x}: {cmd.name}({params}){flags_str}")

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
