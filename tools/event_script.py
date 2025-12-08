#!/usr/bin/env python3
"""
Event Script Analyzer - Parse and analyze game event scripts.

Supports common JRPG event script formats and provides tools for:
- Script disassembly
- Control flow analysis
- Script editing and recompilation

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum, auto
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Set, Callable


class OpcodeType(IntEnum):
	"""Types of script opcodes."""
	CONTROL = auto()      # Flow control (jump, call, return)
	MESSAGE = auto()      # Text display
	MENU = auto()         # Menu/choice
	CHARACTER = auto()    # Character movement/animation
	MAP = auto()          # Map operations
	BATTLE = auto()       # Battle-related
	ITEM = auto()         # Item operations
	FLAG = auto()         # Flag/variable operations
	SOUND = auto()        # Sound/music
	GRAPHIC = auto()      # Visual effects
	SPECIAL = auto()      # Game-specific
	UNKNOWN = auto()


@dataclass
class Opcode:
	"""Represents a script opcode."""
	code: int
	name: str
	size: int  # Total size including operands
	operands: List[str] = field(default_factory=list)
	op_type: OpcodeType = OpcodeType.UNKNOWN
	description: str = ""


@dataclass
class Instruction:
	"""Represents a parsed instruction."""
	offset: int
	opcode: Opcode
	raw_bytes: bytes
	operand_values: List[int] = field(default_factory=list)
	comment: str = ""
	label: str = ""


@dataclass
class ScriptBlock:
	"""A block of script instructions."""
	offset: int
	size: int
	instructions: List[Instruction] = field(default_factory=list)
	entry_points: List[int] = field(default_factory=list)
	exit_points: List[int] = field(default_factory=list)


class OpcodeTable:
	"""Manages opcode definitions."""
	
	def __init__(self):
		"""Initialize opcode table."""
		self.opcodes: Dict[int, Opcode] = {}
	
	def add(self, code: int, name: str, size: int,
			operands: List[str] = None,
			op_type: OpcodeType = OpcodeType.UNKNOWN,
			description: str = "") -> None:
		"""Add an opcode definition."""
		self.opcodes[code] = Opcode(
			code=code,
			name=name,
			size=size,
			operands=operands or [],
			op_type=op_type,
			description=description
		)
	
	def get(self, code: int) -> Optional[Opcode]:
		"""Get opcode by code."""
		return self.opcodes.get(code)
	
	def load_from_json(self, path: str) -> None:
		"""Load opcode definitions from JSON file."""
		with open(path, 'r', encoding='utf-8') as f:
			data = json.load(f)
		
		for entry in data.get('opcodes', []):
			op_type = OpcodeType[entry.get('type', 'UNKNOWN').upper()]
			self.add(
				code=int(entry['code'], 16) if isinstance(entry['code'], str) else entry['code'],
				name=entry['name'],
				size=entry.get('size', 1),
				operands=entry.get('operands', []),
				op_type=op_type,
				description=entry.get('description', '')
			)
	
	def save_to_json(self, path: str) -> None:
		"""Save opcode definitions to JSON file."""
		data = {
			'opcodes': [
				{
					'code': f"0x{op.code:02X}",
					'name': op.name,
					'size': op.size,
					'operands': op.operands,
					'type': op.op_type.name.lower(),
					'description': op.description
				}
				for op in sorted(self.opcodes.values(), key=lambda x: x.code)
			]
		}
		with open(path, 'w', encoding='utf-8') as f:
			json.dump(data, f, indent='\t')
	
	@classmethod
	def create_generic_nes(cls) -> 'OpcodeTable':
		"""Create a generic NES RPG opcode table."""
		table = cls()
		
		# Common control flow
		table.add(0x00, "END", 1, op_type=OpcodeType.CONTROL, description="End script")
		table.add(0x01, "JUMP", 3, ["addr:w"], OpcodeType.CONTROL, "Jump to address")
		table.add(0x02, "CALL", 3, ["addr:w"], OpcodeType.CONTROL, "Call subroutine")
		table.add(0x03, "RET", 1, op_type=OpcodeType.CONTROL, description="Return from call")
		table.add(0x04, "CJUMP", 4, ["flag:b", "addr:w"], OpcodeType.CONTROL, "Conditional jump")
		
		# Messages
		table.add(0x10, "MSG", 3, ["text:w"], OpcodeType.MESSAGE, "Display message")
		table.add(0x11, "MSGWAIT", 1, op_type=OpcodeType.MESSAGE, description="Wait for button")
		table.add(0x12, "MSGCLEAR", 1, op_type=OpcodeType.MESSAGE, description="Clear message window")
		
		# Menus
		table.add(0x20, "MENU", 3, ["menu:w"], OpcodeType.MENU, "Show menu")
		table.add(0x21, "CHOICE", 2, ["count:b"], OpcodeType.MENU, "Yes/No choice")
		
		# Character
		table.add(0x30, "MOVE", 4, ["char:b", "x:b", "y:b"], OpcodeType.CHARACTER, "Move character")
		table.add(0x31, "FACE", 2, ["dir:b"], OpcodeType.CHARACTER, "Set facing direction")
		table.add(0x32, "ANIM", 2, ["anim:b"], OpcodeType.CHARACTER, "Play animation")
		
		# Flags
		table.add(0x40, "SETFLAG", 2, ["flag:b"], OpcodeType.FLAG, "Set flag")
		table.add(0x41, "CLRFLAG", 2, ["flag:b"], OpcodeType.FLAG, "Clear flag")
		table.add(0x42, "IFFLAG", 4, ["flag:b", "addr:w"], OpcodeType.FLAG, "Jump if flag set")
		
		# Sound
		table.add(0x50, "MUSIC", 2, ["track:b"], OpcodeType.SOUND, "Play music")
		table.add(0x51, "SFX", 2, ["sound:b"], OpcodeType.SOUND, "Play sound effect")
		
		# Map
		table.add(0x60, "WARP", 4, ["map:b", "x:b", "y:b"], OpcodeType.MAP, "Warp to location")
		table.add(0x61, "DOOR", 1, op_type=OpcodeType.MAP, description="Enter door")
		
		return table


class ScriptParser:
	"""Parse binary script data."""
	
	def __init__(self, opcode_table: OpcodeTable):
		"""Initialize with opcode table."""
		self.opcodes = opcode_table
		self.labels: Dict[int, str] = {}
		self.comments: Dict[int, str] = {}
	
	def parse(self, data: bytes, start_offset: int = 0) -> List[Instruction]:
		"""Parse script data into instructions."""
		instructions = []
		pos = 0
		
		while pos < len(data):
			offset = start_offset + pos
			code = data[pos]
			
			opcode = self.opcodes.get(code)
			if opcode is None:
				# Unknown opcode, treat as single byte
				opcode = Opcode(code, f"DB_{code:02X}", 1, op_type=OpcodeType.UNKNOWN)
			
			# Get raw bytes
			size = min(opcode.size, len(data) - pos)
			raw_bytes = data[pos:pos + size]
			
			# Parse operands
			operand_values = []
			op_pos = 1
			for operand in opcode.operands:
				if ':' in operand:
					_, op_type = operand.split(':')
					if op_type == 'b' and op_pos < len(raw_bytes):
						operand_values.append(raw_bytes[op_pos])
						op_pos += 1
					elif op_type == 'w' and op_pos + 1 < len(raw_bytes):
						val = raw_bytes[op_pos] | (raw_bytes[op_pos + 1] << 8)
						operand_values.append(val)
						op_pos += 2
			
			# Create instruction
			instr = Instruction(
				offset=offset,
				opcode=opcode,
				raw_bytes=raw_bytes,
				operand_values=operand_values,
				label=self.labels.get(offset, ""),
				comment=self.comments.get(offset, "")
			)
			instructions.append(instr)
			
			# Check for end of script
			if opcode.op_type == OpcodeType.CONTROL and opcode.name in ("END", "RET"):
				pos += size
				# Continue parsing in case there are more scripts
				continue
			
			pos += size
		
		return instructions
	
	def find_labels(self, instructions: List[Instruction]) -> None:
		"""Find and mark jump targets as labels."""
		label_num = 0
		targets: Set[int] = set()
		
		# First pass: collect all jump targets
		for instr in instructions:
			if instr.opcode.op_type == OpcodeType.CONTROL:
				if instr.opcode.name in ("JUMP", "CALL", "CJUMP", "IFFLAG"):
					for i, operand in enumerate(instr.opcode.operands):
						if operand.endswith(':w') and i < len(instr.operand_values):
							targets.add(instr.operand_values[i])
		
		# Second pass: assign labels
		for instr in instructions:
			if instr.offset in targets and not instr.label:
				instr.label = f"label_{label_num:03d}"
				self.labels[instr.offset] = instr.label
				label_num += 1
	
	def format_instruction(self, instr: Instruction) -> str:
		"""Format instruction as assembly-like text."""
		parts = []
		
		# Label
		if instr.label:
			parts.append(f"{instr.label}:")
		
		# Offset
		offset_str = f"  {instr.offset:04X}:"
		
		# Raw bytes
		hex_bytes = " ".join(f"{b:02X}" for b in instr.raw_bytes)
		hex_str = f"{hex_bytes:<12}"
		
		# Mnemonic and operands
		mnemonic = instr.opcode.name
		
		operand_strs = []
		for i, (operand, value) in enumerate(zip(instr.opcode.operands, instr.operand_values)):
			name = operand.split(':')[0] if ':' in operand else operand
			
			# Check if this is a label reference
			if operand.endswith(':w') and value in self.labels:
				operand_strs.append(f"{name}={self.labels[value]}")
			else:
				operand_strs.append(f"{name}=${value:X}")
		
		operands_str = ", ".join(operand_strs)
		
		if parts:
			result = "\n".join(parts) + "\n"
		else:
			result = ""
		
		result += f"{offset_str} {hex_str} {mnemonic}"
		if operands_str:
			result += f" {operands_str}"
		
		# Comment
		if instr.comment:
			result += f"  ; {instr.comment}"
		elif instr.opcode.description:
			result += f"  ; {instr.opcode.description}"
		
		return result


class ScriptAnalyzer:
	"""Analyze script structure and flow."""
	
	def __init__(self, instructions: List[Instruction]):
		"""Initialize with parsed instructions."""
		self.instructions = instructions
		self.blocks: List[ScriptBlock] = []
	
	def find_blocks(self) -> List[ScriptBlock]:
		"""Identify basic blocks in the script."""
		if not self.instructions:
			return []
		
		# Find block boundaries
		block_starts: Set[int] = {self.instructions[0].offset}
		
		for i, instr in enumerate(self.instructions):
			# Jump targets start new blocks
			if instr.opcode.op_type == OpcodeType.CONTROL:
				if instr.opcode.name in ("JUMP", "CJUMP", "IFFLAG"):
					for val in instr.operand_values:
						if 0 <= val < 0x10000:
							block_starts.add(val)
				
				# Instructions after jumps start new blocks
				if i + 1 < len(self.instructions):
					block_starts.add(self.instructions[i + 1].offset)
		
		# Create blocks
		block_starts = sorted(block_starts)
		blocks = []
		
		for i, start in enumerate(block_starts):
			end = block_starts[i + 1] if i + 1 < len(block_starts) else float('inf')
			
			block_instrs = [
				instr for instr in self.instructions
				if start <= instr.offset < end
			]
			
			if block_instrs:
				block = ScriptBlock(
					offset=start,
					size=sum(len(instr.raw_bytes) for instr in block_instrs),
					instructions=block_instrs
				)
				blocks.append(block)
		
		self.blocks = blocks
		return blocks
	
	def generate_flowchart(self) -> str:
		"""Generate Mermaid flowchart of script flow."""
		if not self.blocks:
			self.find_blocks()
		
		lines = ["flowchart TD"]
		
		for block in self.blocks:
			# Create node
			first_instr = block.instructions[0] if block.instructions else None
			last_instr = block.instructions[-1] if block.instructions else None
			
			label = f"{block.offset:04X}"
			if first_instr and first_instr.label:
				label = first_instr.label
			
			# Summarize block content
			summary = []
			for instr in block.instructions[:3]:
				summary.append(instr.opcode.name)
			if len(block.instructions) > 3:
				summary.append("...")
			
			node_text = f"{label}\\n{' '.join(summary)}"
			lines.append(f"    B{block.offset:04X}[\"{node_text}\"]")
			
			# Add edges
			if last_instr:
				if last_instr.opcode.name == "JUMP":
					for val in last_instr.operand_values:
						lines.append(f"    B{block.offset:04X} --> B{val:04X}")
				elif last_instr.opcode.name in ("CJUMP", "IFFLAG"):
					# Conditional: two edges
					for val in last_instr.operand_values:
						lines.append(f"    B{block.offset:04X} -->|true| B{val:04X}")
					# Fall through
					next_offset = block.offset + block.size
					lines.append(f"    B{block.offset:04X} -->|false| B{next_offset:04X}")
				elif last_instr.opcode.name not in ("END", "RET"):
					# Fall through
					next_offset = block.offset + block.size
					lines.append(f"    B{block.offset:04X} --> B{next_offset:04X}")
		
		return "\n".join(lines)
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get script statistics."""
		stats = {
			"total_instructions": len(self.instructions),
			"total_bytes": sum(len(i.raw_bytes) for i in self.instructions),
			"blocks": len(self.blocks) if self.blocks else 0,
			"opcodes_by_type": {},
			"most_common_opcodes": [],
		}
		
		# Count by type
		type_counts: Dict[str, int] = {}
		opcode_counts: Dict[str, int] = {}
		
		for instr in self.instructions:
			type_name = instr.opcode.op_type.name
			type_counts[type_name] = type_counts.get(type_name, 0) + 1
			
			opcode_counts[instr.opcode.name] = opcode_counts.get(instr.opcode.name, 0) + 1
		
		stats["opcodes_by_type"] = type_counts
		stats["most_common_opcodes"] = sorted(
			opcode_counts.items(),
			key=lambda x: x[1],
			reverse=True
		)[:10]
		
		return stats


class ScriptCompiler:
	"""Compile text script back to binary."""
	
	def __init__(self, opcode_table: OpcodeTable):
		"""Initialize with opcode table."""
		self.opcodes = opcode_table
		self.labels: Dict[str, int] = {}
		self.pending_labels: List[Tuple[int, str, str]] = []  # (offset, label, size)
	
	def compile(self, script_text: str, base_offset: int = 0) -> bytes:
		"""Compile script text to binary."""
		output = bytearray()
		
		# Build opcode lookup by name
		opcode_by_name: Dict[str, Opcode] = {}
		for op in self.opcodes.opcodes.values():
			opcode_by_name[op.name.upper()] = op
		
		# First pass: collect labels
		current_offset = base_offset
		for line in script_text.split('\n'):
			line = line.strip()
			if not line or line.startswith(';'):
				continue
			
			# Check for label
			if line.endswith(':'):
				label = line[:-1].strip()
				self.labels[label] = current_offset
				continue
			
			# Parse instruction
			parts = line.split(';')[0].strip().split()
			if not parts:
				continue
			
			mnemonic = parts[0].upper()
			if mnemonic in opcode_by_name:
				current_offset += opcode_by_name[mnemonic].size
			else:
				# Try to parse as data
				if mnemonic == 'DB':
					current_offset += len(parts) - 1
				elif mnemonic == 'DW':
					current_offset += (len(parts) - 1) * 2
		
		# Second pass: compile
		current_offset = base_offset
		for line in script_text.split('\n'):
			line = line.strip()
			if not line or line.startswith(';'):
				continue
			
			# Skip labels
			if line.endswith(':'):
				continue
			
			# Parse instruction
			parts = line.split(';')[0].strip().split()
			if not parts:
				continue
			
			mnemonic = parts[0].upper()
			
			if mnemonic in opcode_by_name:
				op = opcode_by_name[mnemonic]
				output.append(op.code)
				
				# Parse operands
				operands = ' '.join(parts[1:]).split(',') if len(parts) > 1 else []
				op_idx = 0
				
				for operand_def in op.operands:
					if op_idx >= len(operands):
						break
					
					operand = operands[op_idx].strip()
					name, op_type = operand_def.split(':') if ':' in operand_def else (operand_def, 'b')
					
					# Extract value
					if '=' in operand:
						_, value_str = operand.split('=')
					else:
						value_str = operand
					
					value_str = value_str.strip()
					
					# Check if it's a label reference
					if value_str in self.labels:
						value = self.labels[value_str]
					elif value_str.startswith('$'):
						value = int(value_str[1:], 16)
					elif value_str.startswith('0x'):
						value = int(value_str, 16)
					else:
						try:
							value = int(value_str)
						except ValueError:
							# Unknown label, mark for later resolution
							if op_type == 'w':
								self.pending_labels.append((len(output), value_str, 'w'))
								value = 0
							else:
								value = 0
					
					# Write value
					if op_type == 'b':
						output.append(value & 0xFF)
					elif op_type == 'w':
						output.append(value & 0xFF)
						output.append((value >> 8) & 0xFF)
					
					op_idx += 1
				
				current_offset += op.size
			
			elif mnemonic == 'DB':
				# Raw bytes
				for val_str in parts[1:]:
					val_str = val_str.strip().rstrip(',')
					if val_str.startswith('$'):
						output.append(int(val_str[1:], 16))
					else:
						output.append(int(val_str))
					current_offset += 1
			
			elif mnemonic == 'DW':
				# Raw words
				for val_str in parts[1:]:
					val_str = val_str.strip().rstrip(',')
					if val_str.startswith('$'):
						val = int(val_str[1:], 16)
					else:
						val = int(val_str)
					output.append(val & 0xFF)
					output.append((val >> 8) & 0xFF)
					current_offset += 2
		
		return bytes(output)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Analyze and edit game event scripts",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s disasm script.bin --opcodes opcodes.json
  %(prog)s analyze script.bin --flow
  %(prog)s compile script.txt --output script.bin
  %(prog)s template --type generic_nes --output opcodes.json
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Disassemble command
	disasm_parser = subparsers.add_parser("disasm", help="Disassemble script binary")
	disasm_parser.add_argument("input", help="Input binary file")
	disasm_parser.add_argument("-o", "--opcodes", help="Opcode definition JSON")
	disasm_parser.add_argument("--offset", type=lambda x: int(x, 0), default=0,
		help="Base offset for addresses")
	disasm_parser.add_argument("--output", help="Output file")
	
	# Analyze command
	analyze_parser = subparsers.add_parser("analyze", help="Analyze script structure")
	analyze_parser.add_argument("input", help="Input binary file")
	analyze_parser.add_argument("-o", "--opcodes", help="Opcode definition JSON")
	analyze_parser.add_argument("--flow", action="store_true", help="Generate flow chart")
	analyze_parser.add_argument("--stats", action="store_true", help="Show statistics")
	
	# Compile command
	compile_parser = subparsers.add_parser("compile", help="Compile script text to binary")
	compile_parser.add_argument("input", help="Input text file")
	compile_parser.add_argument("-o", "--opcodes", help="Opcode definition JSON")
	compile_parser.add_argument("--output", required=True, help="Output binary file")
	compile_parser.add_argument("--offset", type=lambda x: int(x, 0), default=0,
		help="Base offset for addresses")
	
	# Template command
	template_parser = subparsers.add_parser("template", help="Generate opcode template")
	template_parser.add_argument("--type", choices=["generic_nes"], default="generic_nes",
		help="Template type")
	template_parser.add_argument("--output", required=True, help="Output JSON file")
	
	args = parser.parse_args()
	
	if not args.command:
		parser.print_help()
		return 1
	
	try:
		if args.command == "template":
			if args.type == "generic_nes":
				table = OpcodeTable.create_generic_nes()
			else:
				table = OpcodeTable()
			
			table.save_to_json(args.output)
			print(f"Saved template to: {args.output}")
		
		elif args.command == "disasm":
			# Load opcode table
			if args.opcodes:
				table = OpcodeTable()
				table.load_from_json(args.opcodes)
			else:
				table = OpcodeTable.create_generic_nes()
			
			# Parse script
			data = Path(args.input).read_bytes()
			parser_obj = ScriptParser(table)
			instructions = parser_obj.parse(data, args.offset)
			parser_obj.find_labels(instructions)
			
			# Output
			lines = []
			for instr in instructions:
				lines.append(parser_obj.format_instruction(instr))
			
			output_text = "\n".join(lines)
			
			if args.output:
				Path(args.output).write_text(output_text)
				print(f"Saved to: {args.output}")
			else:
				print(output_text)
		
		elif args.command == "analyze":
			# Load opcode table
			if args.opcodes:
				table = OpcodeTable()
				table.load_from_json(args.opcodes)
			else:
				table = OpcodeTable.create_generic_nes()
			
			# Parse script
			data = Path(args.input).read_bytes()
			parser_obj = ScriptParser(table)
			instructions = parser_obj.parse(data, 0)
			parser_obj.find_labels(instructions)
			
			# Analyze
			analyzer = ScriptAnalyzer(instructions)
			analyzer.find_blocks()
			
			if args.flow:
				print(analyzer.generate_flowchart())
			
			if args.stats:
				stats = analyzer.get_statistics()
				print(f"Total Instructions: {stats['total_instructions']}")
				print(f"Total Bytes: {stats['total_bytes']}")
				print(f"Basic Blocks: {stats['blocks']}")
				print("\nOpcodes by Type:")
				for type_name, count in stats['opcodes_by_type'].items():
					print(f"  {type_name}: {count}")
				print("\nMost Common Opcodes:")
				for name, count in stats['most_common_opcodes']:
					print(f"  {name}: {count}")
		
		elif args.command == "compile":
			# Load opcode table
			if args.opcodes:
				table = OpcodeTable()
				table.load_from_json(args.opcodes)
			else:
				table = OpcodeTable.create_generic_nes()
			
			# Compile
			script_text = Path(args.input).read_text()
			compiler = ScriptCompiler(table)
			binary = compiler.compile(script_text, args.offset)
			
			Path(args.output).write_bytes(binary)
			print(f"Compiled {len(binary)} bytes to: {args.output}")
	
	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
