#!/usr/bin/env python3
"""
Code Flow Analyzer - Analyze code execution flow and generate control flow graphs.

Features:
- Analyze 6502/65816 code flow
- Detect subroutine calls and jumps
- Generate control flow graphs
- Export to various formats (DOT, JSON, text)
- Detect unreachable code

Author: ROM Hacking Toolkit
"""

import argparse
import json
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class FlowType(Enum):
	"""Types of control flow."""
	SEQUENTIAL = "sequential"
	BRANCH = "branch"
	JUMP = "jump"
	CALL = "call"
	RETURN = "return"
	INTERRUPT = "interrupt"


@dataclass
class BasicBlock:
	"""Basic block of code."""
	address: int
	end_address: int
	instructions: List[Tuple[int, str, str]] = field(default_factory=list)  # (addr, opcode, operand)
	successors: List[int] = field(default_factory=list)
	predecessors: List[int] = field(default_factory=list)
	flow_type: FlowType = FlowType.SEQUENTIAL
	label: str = ""
	is_entry: bool = False
	is_exit: bool = False


@dataclass
class Subroutine:
	"""Subroutine information."""
	address: int
	end_address: int
	name: str
	blocks: List[int] = field(default_factory=list)  # Block addresses
	callers: List[int] = field(default_factory=list)
	callees: List[int] = field(default_factory=list)


@dataclass
class FlowGraph:
	"""Control flow graph."""
	blocks: Dict[int, BasicBlock] = field(default_factory=dict)
	subroutines: Dict[int, Subroutine] = field(default_factory=dict)
	entry_points: List[int] = field(default_factory=list)


# 6502 instruction properties
BRANCH_INSTRUCTIONS = {
	'BCC', 'BCS', 'BEQ', 'BMI', 'BNE', 'BPL', 'BVC', 'BVS',
	'BRA',  # 65C02
}

JUMP_INSTRUCTIONS = {
	'JMP', 'JML',  # JML is 65816
}

CALL_INSTRUCTIONS = {
	'JSR', 'JSL',  # JSL is 65816
}

RETURN_INSTRUCTIONS = {
	'RTS', 'RTI', 'RTL',  # RTL is 65816
}

# 65816 additional branches
BRANCH_65816 = {
	'BRL',  # Branch long
}


def parse_address(addr_str: str) -> Optional[int]:
	"""Parse address from string."""
	addr_str = addr_str.strip().lstrip('$')
	try:
		return int(addr_str, 16)
	except ValueError:
		return None


def parse_asm_file(path: str) -> List[Tuple[int, str, str]]:
	"""Parse assembly file and extract instructions."""
	instructions = []

	with open(path, 'r', encoding='utf-8', errors='ignore') as f:
		for line in f:
			line = line.strip()

			# Skip empty lines and comments
			if not line or line.startswith(';') or line.startswith('//'):
				continue

			# Match instruction patterns
			# Pattern: $ADDR: OPCODE OPERAND ; comment
			# or: ADDR  OPCODE OPERAND

			# Pattern 1: $XXXX: OPCODE ...
			match = re.match(r'\$?([0-9A-Fa-f]{4,6})\s*:\s*(\w+)\s*(.*?)(?:;.*)?$', line)
			if match:
				addr = int(match.group(1), 16)
				opcode = match.group(2).upper()
				operand = match.group(3).strip()
				instructions.append((addr, opcode, operand))
				continue

			# Pattern 2: Label followed by instruction
			match = re.match(r'^(\w+):\s*$', line)
			if match:
				# Just a label, skip
				continue

			# Pattern 3: OPCODE OPERAND (no address)
			match = re.match(r'^\s*(\w{2,4})\s+(.*?)(?:;.*)?$', line)
			if match:
				opcode = match.group(1).upper()
				if opcode in BRANCH_INSTRUCTIONS | JUMP_INSTRUCTIONS | CALL_INSTRUCTIONS | RETURN_INSTRUCTIONS:
					operand = match.group(2).strip()
					# Can't determine address without context
					# instructions.append((0, opcode, operand))

	return instructions


def parse_mlb_labels(path: str) -> Dict[int, str]:
	"""Parse Mesen label file for labels."""
	labels = {}

	with open(path, 'r', encoding='utf-8', errors='ignore') as f:
		for line in f:
			line = line.strip()
			if not line or line.startswith('#'):
				continue

			parts = line.split(':')
			if len(parts) >= 3:
				try:
					# Format: TYPE:ADDR:NAME
					addr = int(parts[1], 16)
					name = parts[2]
					labels[addr] = name
				except (ValueError, IndexError):
					pass

	return labels


def build_flow_graph(
	instructions: List[Tuple[int, str, str]],
	labels: Dict[int, str] = None,
	entry_points: List[int] = None
) -> FlowGraph:
	"""Build control flow graph from instructions."""
	if labels is None:
		labels = {}

	graph = FlowGraph()

	if not instructions:
		return graph

	# Sort by address
	instructions.sort(key=lambda x: x[0])

	# Find all branch/jump targets
	targets = set()
	for addr, opcode, operand in instructions:
		if opcode in BRANCH_INSTRUCTIONS | JUMP_INSTRUCTIONS | CALL_INSTRUCTIONS | BRANCH_65816:
			target = parse_address(operand)
			if target is not None:
				targets.add(target)

	# Also add labeled addresses as potential block starts
	for addr in labels:
		targets.add(addr)

	# Build basic blocks
	current_block: Optional[BasicBlock] = None

	for i, (addr, opcode, operand) in enumerate(instructions):
		# Start new block if:
		# 1. No current block
		# 2. This address is a branch target
		# 3. Previous instruction was a branch/jump/return

		if current_block is None or addr in targets:
			if current_block is not None:
				# End previous block
				current_block.end_address = instructions[i - 1][0]
				graph.blocks[current_block.address] = current_block

				# Add fallthrough successor if applicable
				if current_block.flow_type == FlowType.SEQUENTIAL:
					current_block.successors.append(addr)

			# Start new block
			current_block = BasicBlock(
				address=addr,
				end_address=addr,
				label=labels.get(addr, "")
			)

		# Add instruction to block
		current_block.instructions.append((addr, opcode, operand))

		# Check if this ends the block
		if opcode in RETURN_INSTRUCTIONS:
			current_block.flow_type = FlowType.RETURN
			current_block.is_exit = True
			current_block.end_address = addr
			graph.blocks[current_block.address] = current_block
			current_block = None

		elif opcode in JUMP_INSTRUCTIONS:
			target = parse_address(operand)
			current_block.flow_type = FlowType.JUMP
			if target is not None:
				current_block.successors.append(target)
			current_block.end_address = addr
			graph.blocks[current_block.address] = current_block
			current_block = None

		elif opcode in BRANCH_INSTRUCTIONS | BRANCH_65816:
			target = parse_address(operand)
			current_block.flow_type = FlowType.BRANCH
			if target is not None:
				current_block.successors.append(target)
			# Also add fallthrough
			if i + 1 < len(instructions):
				current_block.successors.append(instructions[i + 1][0])
			current_block.end_address = addr
			graph.blocks[current_block.address] = current_block
			current_block = None

		elif opcode in CALL_INSTRUCTIONS:
			target = parse_address(operand)
			current_block.flow_type = FlowType.CALL
			if target is not None:
				current_block.successors.append(target)
			# Calls return, so add fallthrough
			if i + 1 < len(instructions):
				current_block.successors.append(instructions[i + 1][0])

	# Save last block
	if current_block is not None:
		current_block.end_address = instructions[-1][0]
		graph.blocks[current_block.address] = current_block

	# Build predecessor lists
	for addr, block in graph.blocks.items():
		for succ in block.successors:
			if succ in graph.blocks:
				graph.blocks[succ].predecessors.append(addr)

	# Mark entry points
	if entry_points:
		graph.entry_points = entry_points
		for ep in entry_points:
			if ep in graph.blocks:
				graph.blocks[ep].is_entry = True
	else:
		# Mark blocks with no predecessors as entry points
		for addr, block in graph.blocks.items():
			if not block.predecessors:
				block.is_entry = True
				graph.entry_points.append(addr)

	return graph


def detect_subroutines(graph: FlowGraph) -> None:
	"""Detect subroutines in the flow graph."""
	# Find all JSR/JSL targets
	call_targets = set()

	for block in graph.blocks.values():
		if block.flow_type == FlowType.CALL:
			for succ in block.successors:
				# The call target is the address of the JSR operand
				# Need to check the last instruction
				if block.instructions:
					last_addr, last_op, last_operand = block.instructions[-1]
					if last_op in CALL_INSTRUCTIONS:
						target = parse_address(last_operand)
						if target is not None:
							call_targets.add(target)

	# Create subroutine entries for call targets
	for target in call_targets:
		if target not in graph.subroutines:
			graph.subroutines[target] = Subroutine(
				address=target,
				end_address=target,
				name=f"sub_{target:04X}"
			)


def find_unreachable_code(graph: FlowGraph) -> List[int]:
	"""Find blocks that are not reachable from entry points."""
	reachable = set()

	# BFS from entry points
	queue = list(graph.entry_points)

	while queue:
		addr = queue.pop(0)
		if addr in reachable or addr not in graph.blocks:
			continue

		reachable.add(addr)
		block = graph.blocks[addr]

		for succ in block.successors:
			if succ not in reachable:
				queue.append(succ)

	# Find unreachable
	unreachable = []
	for addr in graph.blocks:
		if addr not in reachable:
			unreachable.append(addr)

	return sorted(unreachable)


def export_dot(graph: FlowGraph, path: str) -> None:
	"""Export flow graph to DOT format for Graphviz."""
	lines = [
		'digraph FlowGraph {',
		'    node [shape=box, fontname="Consolas"];',
		'    edge [fontname="Consolas"];',
		''
	]

	for addr, block in sorted(graph.blocks.items()):
		# Node label
		label_parts = []
		if block.label:
			label_parts.append(block.label)
		label_parts.append(f"${addr:04X}")

		# Add instructions
		for inst_addr, opcode, operand in block.instructions[:5]:  # First 5 instructions
			label_parts.append(f"{opcode} {operand}")

		if len(block.instructions) > 5:
			label_parts.append(f"... ({len(block.instructions) - 5} more)")

		label = '\\n'.join(label_parts)

		# Node style
		style = []
		if block.is_entry:
			style.append('filled')
			style.append('fillcolor="lightgreen"')
		elif block.is_exit:
			style.append('filled')
			style.append('fillcolor="lightcoral"')

		style_str = ', '.join(style) if style else ''

		lines.append(f'    node_{addr:04X} [label="{label}"' +
			(f', {style_str}' if style_str else '') + '];')

	lines.append('')

	# Edges
	for addr, block in graph.blocks.items():
		for succ in block.successors:
			edge_style = ''
			if block.flow_type == FlowType.BRANCH:
				# Different styles for taken/not-taken
				if succ == block.successors[0]:
					edge_style = ' [style=dashed, label="taken"]'
				else:
					edge_style = ' [label="fallthrough"]'
			elif block.flow_type == FlowType.CALL:
				edge_style = ' [color=blue, label="call"]'

			lines.append(f'    node_{addr:04X} -> node_{succ:04X}{edge_style};')

	lines.append('}')

	Path(path).write_text('\n'.join(lines))


def export_json(graph: FlowGraph, path: str) -> None:
	"""Export flow graph to JSON."""
	data = {
		'entry_points': [f'0x{addr:04X}' for addr in graph.entry_points],
		'blocks': {},
		'subroutines': {}
	}

	for addr, block in graph.blocks.items():
		data['blocks'][f'0x{addr:04X}'] = {
			'address': f'0x{addr:04X}',
			'end_address': f'0x{block.end_address:04X}',
			'label': block.label,
			'flow_type': block.flow_type.value,
			'is_entry': block.is_entry,
			'is_exit': block.is_exit,
			'instruction_count': len(block.instructions),
			'successors': [f'0x{s:04X}' for s in block.successors],
			'predecessors': [f'0x{p:04X}' for p in block.predecessors]
		}

	for addr, sub in graph.subroutines.items():
		data['subroutines'][f'0x{addr:04X}'] = {
			'address': f'0x{addr:04X}',
			'name': sub.name,
			'callers': [f'0x{c:04X}' for c in sub.callers],
			'callees': [f'0x{c:04X}' for c in sub.callees]
		}

	with open(path, 'w') as f:
		json.dump(data, f, indent=2)


def format_text_report(graph: FlowGraph) -> str:
	"""Generate text report of flow graph."""
	lines = [
		"=" * 60,
		"Code Flow Analysis Report",
		"=" * 60,
		"",
		f"Total blocks: {len(graph.blocks)}",
		f"Entry points: {len(graph.entry_points)}",
		f"Subroutines: {len(graph.subroutines)}",
		""
	]

	# Entry points
	lines.append("Entry Points:")
	for ep in graph.entry_points:
		label = graph.blocks[ep].label if ep in graph.blocks else ""
		lines.append(f"  ${ep:04X} {label}")
	lines.append("")

	# Blocks by flow type
	by_type = {}
	for block in graph.blocks.values():
		ft = block.flow_type.value
		by_type[ft] = by_type.get(ft, 0) + 1

	lines.append("Blocks by type:")
	for ft, count in sorted(by_type.items()):
		lines.append(f"  {ft}: {count}")
	lines.append("")

	# Unreachable code
	unreachable = find_unreachable_code(graph)
	if unreachable:
		lines.append(f"Unreachable blocks ({len(unreachable)}):")
		for addr in unreachable[:20]:
			lines.append(f"  ${addr:04X}")
		if len(unreachable) > 20:
			lines.append(f"  ... and {len(unreachable) - 20} more")
	else:
		lines.append("No unreachable blocks detected.")
	lines.append("")

	# Call statistics
	if graph.subroutines:
		lines.append("Subroutines:")
		for addr, sub in sorted(graph.subroutines.items()):
			lines.append(f"  ${addr:04X}: {sub.name} ({len(sub.callers)} callers)")

	return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Analyze code flow and generate control flow graphs",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s analyze code.asm                   # Analyze assembly file
  %(prog)s dot code.asm -o flow.dot           # Export to DOT format
  %(prog)s unreachable code.asm               # Find unreachable code
  %(prog)s report code.asm -l labels.mlb      # Report with labels
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze", help="Analyze code flow")
	analyze_parser.add_argument("input", help="Assembly file")
	analyze_parser.add_argument("-l", "--labels", help="Label file (.mlb)")
	analyze_parser.add_argument("-e", "--entry", help="Entry point (hex)")

	# DOT export command
	dot_parser = subparsers.add_parser("dot", help="Export to DOT format")
	dot_parser.add_argument("input", help="Assembly file")
	dot_parser.add_argument("-o", "--output", required=True, help="Output .dot file")
	dot_parser.add_argument("-l", "--labels", help="Label file")

	# JSON export command
	json_parser = subparsers.add_parser("json", help="Export to JSON")
	json_parser.add_argument("input", help="Assembly file")
	json_parser.add_argument("-o", "--output", required=True, help="Output .json file")
	json_parser.add_argument("-l", "--labels", help="Label file")

	# Unreachable command
	unreachable_parser = subparsers.add_parser("unreachable", help="Find unreachable code")
	unreachable_parser.add_argument("input", help="Assembly file")
	unreachable_parser.add_argument("-l", "--labels", help="Label file")
	unreachable_parser.add_argument("-e", "--entry", help="Entry point (hex)")

	# Report command
	report_parser = subparsers.add_parser("report", help="Generate analysis report")
	report_parser.add_argument("input", help="Assembly file")
	report_parser.add_argument("-l", "--labels", help="Label file")
	report_parser.add_argument("-o", "--output", help="Output file")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		# Parse instructions
		instructions = parse_asm_file(args.input)

		if not instructions:
			print("No instructions found in file")
			return 1

		# Parse labels if provided
		labels = {}
		if hasattr(args, 'labels') and args.labels:
			labels = parse_mlb_labels(args.labels)

		# Parse entry point if provided
		entry_points = None
		if hasattr(args, 'entry') and args.entry:
			ep = parse_address(args.entry)
			if ep is not None:
				entry_points = [ep]

		# Build graph
		graph = build_flow_graph(instructions, labels, entry_points)
		detect_subroutines(graph)

		if args.command == "analyze":
			print(f"Parsed {len(instructions)} instructions")
			print(f"Found {len(graph.blocks)} basic blocks")
			print(f"Entry points: {len(graph.entry_points)}")
			print(f"Subroutines: {len(graph.subroutines)}")

		elif args.command == "dot":
			export_dot(graph, args.output)
			print(f"Exported DOT graph to: {args.output}")
			print("Use 'dot -Tpng output.dot -o output.png' to render")

		elif args.command == "json":
			export_json(graph, args.output)
			print(f"Exported JSON to: {args.output}")

		elif args.command == "unreachable":
			unreachable = find_unreachable_code(graph)

			if unreachable:
				print(f"Found {len(unreachable)} unreachable blocks:")
				for addr in unreachable:
					label = graph.blocks[addr].label if addr in graph.blocks else ""
					print(f"  ${addr:04X} {label}")
			else:
				print("No unreachable code found")

		elif args.command == "report":
			report = format_text_report(graph)

			if args.output:
				Path(args.output).write_text(report)
				print(f"Report saved to: {args.output}")
			else:
				print(report)

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
