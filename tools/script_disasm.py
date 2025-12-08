#!/usr/bin/env python3
"""
Script Disassembler

Disassemble game scripting bytecode and event systems.
Supports custom command definitions and generates readable output.
"""

import argparse
import json
import struct
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Callable


class ScriptCommand:
	"""Represents a script command definition."""

	def __init__(
		self,
		opcode: int,
		name: str,
		size: int = 1,
		params: List[dict] = None,
		description: str = "",
		terminator: bool = False,
		branch: bool = False
	):
		self.opcode = opcode
		self.name = name
		self.size = size  # Total size including opcode
		self.params = params or []
		self.description = description
		self.terminator = terminator  # Ends script
		self.branch = branch  # May change execution flow

	def format_params(self, param_bytes: bytes) -> str:
		"""Format parameter bytes according to definition."""
		if not self.params:
			return ""

		parts = []
		offset = 0

		for param in self.params:
			param_type = param.get("type", "byte")
			param_name = param.get("name", f"param{len(parts)}")

			if param_type == "byte":
				if offset < len(param_bytes):
					value = param_bytes[offset]
					parts.append(f"{param_name}=${value:02X}")
				offset += 1

			elif param_type == "word":
				if offset + 1 < len(param_bytes):
					value = struct.unpack('<H', param_bytes[offset:offset + 2])[0]
					parts.append(f"{param_name}=${value:04X}")
				offset += 2

			elif param_type == "address":
				if offset + 1 < len(param_bytes):
					value = struct.unpack('<H', param_bytes[offset:offset + 2])[0]
					parts.append(f"{param_name}=@${value:04X}")
				offset += 2

			elif param_type == "signed_byte":
				if offset < len(param_bytes):
					value = param_bytes[offset]
					if value >= 0x80:
						value = value - 256
					parts.append(f"{param_name}={value:+d}")
				offset += 1

			elif param_type == "string_id":
				if offset + 1 < len(param_bytes):
					value = struct.unpack('<H', param_bytes[offset:offset + 2])[0]
					parts.append(f"{param_name}=STR_{value:04X}")
				offset += 2

		return ", ".join(parts)

	def to_dict(self) -> dict:
		return {
			"opcode": f"${self.opcode:02X}",
			"name": self.name,
			"size": self.size,
			"params": self.params,
			"description": self.description,
			"terminator": self.terminator,
			"branch": self.branch,
		}


class ScriptDefinition:
	"""Script language definition."""

	def __init__(self):
		self.commands: Dict[int, ScriptCommand] = {}
		self.name = "Unknown"
		self.description = ""
		self.base_address = 0
		self.endian = "little"

	def add_command(self, cmd: ScriptCommand):
		"""Add a command definition."""
		self.commands[cmd.opcode] = cmd

	def get_command(self, opcode: int) -> Optional[ScriptCommand]:
		"""Get command by opcode."""
		return self.commands.get(opcode)

	def load_from_json(self, path: str):
		"""Load script definition from JSON."""
		data = json.loads(Path(path).read_text(encoding='utf-8'))

		self.name = data.get("name", "Unknown")
		self.description = data.get("description", "")
		self.base_address = int(data.get("base_address", "0"), 16)
		self.endian = data.get("endian", "little")

		for cmd_data in data.get("commands", []):
			opcode = int(cmd_data["opcode"], 16) if isinstance(cmd_data["opcode"], str) else cmd_data["opcode"]
			cmd = ScriptCommand(
				opcode,
				cmd_data.get("name", f"CMD_{opcode:02X}"),
				cmd_data.get("size", 1),
				cmd_data.get("params", []),
				cmd_data.get("description", ""),
				cmd_data.get("terminator", False),
				cmd_data.get("branch", False)
			)
			self.add_command(cmd)

	def save_to_json(self, path: str):
		"""Save script definition to JSON."""
		data = {
			"name": self.name,
			"description": self.description,
			"base_address": f"${self.base_address:04X}",
			"endian": self.endian,
			"commands": [cmd.to_dict() for cmd in sorted(self.commands.values(), key=lambda c: c.opcode)]
		}
		Path(path).write_text(json.dumps(data, indent='\t'), encoding='utf-8')


class DisassembledInstruction:
	"""A single disassembled instruction."""

	def __init__(
		self,
		address: int,
		opcode: int,
		params: bytes,
		command: Optional[ScriptCommand]
	):
		self.address = address
		self.opcode = opcode
		self.params = params
		self.command = command
		self.label = ""
		self.comment = ""

	def get_size(self) -> int:
		if self.command:
			return self.command.size
		return 1

	def format(self, show_bytes: bool = True) -> str:
		"""Format instruction for display."""
		parts = []

		# Label
		if self.label:
			parts.append(f"{self.label}:")

		# Address
		addr_str = f"${self.address:04X}:"

		# Raw bytes
		all_bytes = bytes([self.opcode]) + self.params
		bytes_str = ' '.join(f'{b:02X}' for b in all_bytes)

		# Mnemonic and params
		if self.command:
			mnemonic = self.command.name
			param_str = self.command.format_params(self.params)
			instr_str = f"{mnemonic} {param_str}".strip()
		else:
			instr_str = f".byte ${self.opcode:02X}"

		# Format line
		if show_bytes:
			line = f"  {addr_str:<8} {bytes_str:<16} {instr_str}"
		else:
			line = f"  {addr_str:<8} {instr_str}"

		if self.comment:
			line += f"  ; {self.comment}"

		if self.label:
			return f"\n{self.label}:\n{line}"
		return line


class ScriptDisassembler:
	"""Disassemble script bytecode."""

	def __init__(self, definition: ScriptDefinition):
		self.definition = definition
		self.instructions: List[DisassembledInstruction] = []
		self.labels: Dict[int, str] = {}
		self.branch_targets: set = set()

	def disassemble(
		self,
		data: bytes,
		start_offset: int = 0,
		base_address: int = None,
		max_instructions: int = None
	) -> List[DisassembledInstruction]:
		"""Disassemble script data."""
		if base_address is None:
			base_address = self.definition.base_address

		self.instructions = []
		self.branch_targets = set()

		offset = start_offset
		count = 0

		while offset < len(data):
			if max_instructions and count >= max_instructions:
				break

			address = base_address + offset

			opcode = data[offset]
			command = self.definition.get_command(opcode)

			if command:
				param_size = command.size - 1
				params = data[offset + 1:offset + 1 + param_size]

				instr = DisassembledInstruction(address, opcode, params, command)

				# Check for branch targets
				if command.branch:
					for param in command.params:
						if param.get("type") == "address":
							# Extract target address
							param_offset = sum(
								1 if p.get("type") == "byte" else 2
								for p in command.params[:command.params.index(param)]
							)
							if param_offset + 1 < len(params):
								target = struct.unpack('<H', params[param_offset:param_offset + 2])[0]
								self.branch_targets.add(target)

				self.instructions.append(instr)
				offset += command.size

				if command.terminator:
					# Add separator after terminator
					break
			else:
				# Unknown opcode
				instr = DisassembledInstruction(address, opcode, b'', None)
				instr.comment = "Unknown opcode"
				self.instructions.append(instr)
				offset += 1

			count += 1

		# Add labels for branch targets
		self._generate_labels()

		return self.instructions

	def _generate_labels(self):
		"""Generate labels for branch targets."""
		label_num = 0

		for instr in self.instructions:
			if instr.address in self.branch_targets:
				label_num += 1
				instr.label = f"label_{label_num:03d}"
				self.labels[instr.address] = instr.label

	def format_output(self, show_bytes: bool = True) -> str:
		"""Format disassembly for output."""
		lines = [
			f"; Script disassembly",
			f"; Definition: {self.definition.name}",
			f"; Base address: ${self.definition.base_address:04X}",
			"",
		]

		for instr in self.instructions:
			lines.append(instr.format(show_bytes))

		return '\n'.join(lines)


class ScriptAnalyzer:
	"""Analyze scripts for patterns and statistics."""

	def __init__(self, definition: ScriptDefinition):
		self.definition = definition

	def analyze(self, instructions: List[DisassembledInstruction]) -> dict:
		"""Analyze disassembled instructions."""
		stats = {
			"total_instructions": len(instructions),
			"total_bytes": sum(i.get_size() for i in instructions),
			"command_counts": {},
			"unknown_opcodes": [],
			"branch_count": 0,
			"terminator_count": 0,
		}

		for instr in instructions:
			opcode = instr.opcode
			opcode_str = f"${opcode:02X}"

			if instr.command:
				name = instr.command.name
				stats["command_counts"][name] = stats["command_counts"].get(name, 0) + 1

				if instr.command.branch:
					stats["branch_count"] += 1
				if instr.command.terminator:
					stats["terminator_count"] += 1
			else:
				stats["unknown_opcodes"].append(opcode_str)

		return stats


def create_sample_definition() -> dict:
	"""Create a sample script definition."""
	return {
		"name": "Sample RPG Script",
		"description": "Example script definition for RPG events",
		"base_address": "$C000",
		"endian": "little",
		"commands": [
			{
				"opcode": "$00",
				"name": "NOP",
				"size": 1,
				"params": [],
				"description": "No operation"
			},
			{
				"opcode": "$01",
				"name": "END",
				"size": 1,
				"params": [],
				"description": "End script",
				"terminator": True
			},
			{
				"opcode": "$02",
				"name": "JUMP",
				"size": 3,
				"params": [
					{"name": "target", "type": "address"}
				],
				"description": "Jump to address",
				"branch": True
			},
			{
				"opcode": "$03",
				"name": "CALL",
				"size": 3,
				"params": [
					{"name": "target", "type": "address"}
				],
				"description": "Call subroutine",
				"branch": True
			},
			{
				"opcode": "$04",
				"name": "RET",
				"size": 1,
				"params": [],
				"description": "Return from subroutine"
			},
			{
				"opcode": "$10",
				"name": "MSG",
				"size": 3,
				"params": [
					{"name": "text", "type": "string_id"}
				],
				"description": "Display message"
			},
			{
				"opcode": "$11",
				"name": "WAIT",
				"size": 2,
				"params": [
					{"name": "frames", "type": "byte"}
				],
				"description": "Wait for frames"
			},
			{
				"opcode": "$20",
				"name": "MOVE",
				"size": 4,
				"params": [
					{"name": "entity", "type": "byte"},
					{"name": "x", "type": "byte"},
					{"name": "y", "type": "byte"}
				],
				"description": "Move entity to position"
			},
			{
				"opcode": "$21",
				"name": "FACE",
				"size": 3,
				"params": [
					{"name": "entity", "type": "byte"},
					{"name": "dir", "type": "byte"}
				],
				"description": "Set entity facing direction"
			},
			{
				"opcode": "$30",
				"name": "IF_FLAG",
				"size": 4,
				"params": [
					{"name": "flag", "type": "word"},
					{"name": "target", "type": "address"}
				],
				"description": "Jump if flag is set",
				"branch": True
			},
			{
				"opcode": "$31",
				"name": "SET_FLAG",
				"size": 3,
				"params": [
					{"name": "flag", "type": "word"}
				],
				"description": "Set event flag"
			},
			{
				"opcode": "$32",
				"name": "CLR_FLAG",
				"size": 3,
				"params": [
					{"name": "flag", "type": "word"}
				],
				"description": "Clear event flag"
			},
		]
	}


def main():
	parser = argparse.ArgumentParser(description="Script Disassembler")
	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Disassemble command
	disasm_parser = subparsers.add_parser("disasm",
		help="Disassemble script data")
	disasm_parser.add_argument("input", help="Input binary file")
	disasm_parser.add_argument("-d", "--definition", required=True,
		help="Script definition JSON")
	disasm_parser.add_argument("-o", "--output", help="Output file")
	disasm_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0,
		help="Start offset (hex)")
	disasm_parser.add_argument("--base", type=lambda x: int(x, 16),
		help="Base address override (hex)")
	disasm_parser.add_argument("--max", type=int,
		help="Maximum instructions to disassemble")
	disasm_parser.add_argument("--no-bytes", action="store_true",
		help="Don't show raw bytes")
	disasm_parser.add_argument("--json", action="store_true",
		help="Output as JSON")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze",
		help="Analyze script statistics")
	analyze_parser.add_argument("input", help="Input binary file")
	analyze_parser.add_argument("-d", "--definition", required=True,
		help="Script definition JSON")
	analyze_parser.add_argument("-o", "--output", help="Output JSON file")
	analyze_parser.add_argument("--offset", type=lambda x: int(x, 16), default=0,
		help="Start offset (hex)")

	# Create command
	create_parser = subparsers.add_parser("create",
		help="Create script definition template")
	create_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")

	# Document command
	doc_parser = subparsers.add_parser("document",
		help="Generate script documentation")
	doc_parser.add_argument("-d", "--definition", required=True,
		help="Script definition JSON")
	doc_parser.add_argument("-o", "--output", help="Output markdown file")

	args = parser.parse_args()

	if args.command == "disasm":
		data = Path(args.input).read_bytes()

		definition = ScriptDefinition()
		definition.load_from_json(args.definition)

		disasm = ScriptDisassembler(definition)
		instructions = disasm.disassemble(
			data,
			args.offset,
			args.base,
			args.max
		)

		if args.json:
			output_data = {
				"definition": definition.name,
				"instructions": [
					{
						"address": f"${i.address:04X}",
						"opcode": f"${i.opcode:02X}",
						"command": i.command.name if i.command else None,
						"params": i.command.format_params(i.params) if i.command else None,
						"label": i.label or None,
					}
					for i in instructions
				]
			}
			output = json.dumps(output_data, indent='\t')
		else:
			output = disasm.format_output(not args.no_bytes)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved disassembly to {args.output}")
		else:
			print(output)

	elif args.command == "analyze":
		data = Path(args.input).read_bytes()

		definition = ScriptDefinition()
		definition.load_from_json(args.definition)

		disasm = ScriptDisassembler(definition)
		instructions = disasm.disassemble(data, args.offset)

		analyzer = ScriptAnalyzer(definition)
		stats = analyzer.analyze(instructions)

		print(f"Script Analysis:")
		print(f"  Total instructions: {stats['total_instructions']}")
		print(f"  Total bytes: {stats['total_bytes']}")
		print(f"  Branch instructions: {stats['branch_count']}")
		print(f"  Terminators: {stats['terminator_count']}")
		print(f"  Unknown opcodes: {len(stats['unknown_opcodes'])}")

		if stats['command_counts']:
			print(f"\nCommand usage:")
			for name, count in sorted(stats['command_counts'].items(), key=lambda x: -x[1]):
				print(f"  {name}: {count}")

		if args.output:
			Path(args.output).write_text(
				json.dumps(stats, indent='\t'),
				encoding='utf-8'
			)
			print(f"\nSaved analysis to {args.output}")

	elif args.command == "create":
		template = create_sample_definition()
		Path(args.output).write_text(
			json.dumps(template, indent='\t'),
			encoding='utf-8'
		)
		print(f"Created template: {args.output}")

	elif args.command == "document":
		definition = ScriptDefinition()
		definition.load_from_json(args.definition)

		lines = [
			f"# {definition.name} Script Documentation",
			"",
			definition.description,
			"",
			f"Base Address: ${definition.base_address:04X}",
			f"Endian: {definition.endian}",
			"",
			"## Commands",
			"",
			"| Opcode | Name | Size | Parameters | Description |",
			"|--------|------|------|------------|-------------|",
		]

		for cmd in sorted(definition.commands.values(), key=lambda c: c.opcode):
			params = ", ".join(f"{p['name']}:{p['type']}" for p in cmd.params) or "none"
			flags = []
			if cmd.terminator:
				flags.append("T")
			if cmd.branch:
				flags.append("B")
			flag_str = f" [{','.join(flags)}]" if flags else ""

			lines.append(
				f"| ${cmd.opcode:02X} | {cmd.name} | {cmd.size} | {params} | {cmd.description}{flag_str} |"
			)

		lines.extend([
			"",
			"Flags: T=Terminator, B=Branch",
		])

		output = '\n'.join(lines)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved documentation to {args.output}")
		else:
			print(output)

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
