#!/usr/bin/env python3
"""
Assembly Cross-Referencer - Find label references and call graphs

Analyzes assembly source files to find:
- All references to labels/symbols
- Call graphs (JSR/JMP dependencies)
- Unreferenced code
- Circular dependencies
"""

import argparse
import re
import sys
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


class Label:
	"""Represents a label/symbol in assembly code."""

	def __init__(
		self,
		name: str,
		file_path: Path,
		line_number: int,
		label_type: str = "unknown",
	):
		self.name = name
		self.file_path = file_path
		self.line_number = line_number
		self.label_type = label_type  # "code", "data", "constant", "unknown"
		self.references: List[Tuple[Path, int, str]] = []  # (file, line, context)
		self.calls: List[str] = []  # Labels this one calls
		self.called_by: List[str] = []  # Labels that call this one


class CrossReferencer:
	"""Analyzes assembly files for cross-references."""

	# Instruction patterns
	BRANCH_INSTRUCTIONS = {
		"BCC", "BCS", "BEQ", "BMI", "BNE", "BPL", "BVC", "BVS", "BRA", "BRL",
	}
	JUMP_INSTRUCTIONS = {"JMP", "JML", "JSR", "JSL"}
	CALL_INSTRUCTIONS = {"JSR", "JSL"}

	def __init__(self):
		self.labels: Dict[str, Label] = {}
		self.references: Dict[str, List[Tuple[Path, int, str]]] = defaultdict(list)
		self.files_processed: List[Path] = []

		# Patterns
		self.label_pattern = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*):?\s*(?:;.*)?$')
		self.local_label_pattern = re.compile(r'^([.@][A-Za-z_][A-Za-z0-9_]*):?\s*(?:;.*)?$')
		self.equ_pattern = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*)\s*[=:]\s*\$?[0-9A-Fa-f]+', re.IGNORECASE)
		self.instruction_pattern = re.compile(
			r'^\s*([A-Za-z]{2,4})\s+([^;]+)?',
			re.IGNORECASE,
		)

	def process_file(self, file_path: Path):
		"""Process a single assembly file."""
		try:
			content = file_path.read_text(encoding="utf-8", errors="replace")
		except Exception as e:
			print(f"Warning: Could not read {file_path}: {e}", file=sys.stderr)
			return

		self.files_processed.append(file_path)
		current_scope = None  # For local labels

		for line_num, line in enumerate(content.split("\n"), 1):
			original_line = line
			line = line.strip()

			# Skip empty lines and comments
			if not line or line.startswith(";") or line.startswith("//"):
				continue

			# Check for label definition
			label_match = self.label_pattern.match(line)
			if label_match:
				label_name = label_match.group(1)
				if label_name.upper() not in self._get_all_mnemonics():
					self._add_label(label_name, file_path, line_num, "code")
					current_scope = label_name
					continue

			# Check for local label
			local_match = self.local_label_pattern.match(line)
			if local_match:
				local_name = local_match.group(1)
				if current_scope:
					full_name = f"{current_scope}{local_name}"
				else:
					full_name = local_name
				self._add_label(full_name, file_path, line_num, "code")
				continue

			# Check for EQU/constant definition
			equ_match = self.equ_pattern.match(line)
			if equ_match:
				label_name = equ_match.group(1)
				self._add_label(label_name, file_path, line_num, "constant")
				continue

			# Check for instruction with operand (references)
			inst_match = self.instruction_pattern.match(line)
			if inst_match:
				mnemonic = inst_match.group(1).upper()
				operand = inst_match.group(2) or ""
				operand = operand.strip()

				# Remove comment from operand
				if ";" in operand:
					operand = operand.split(";")[0].strip()

				# Extract label references from operand
				refs = self._extract_references(operand)
				for ref_name in refs:
					# Handle local labels
					if ref_name.startswith(".") or ref_name.startswith("@"):
						if current_scope:
							ref_name = f"{current_scope}{ref_name}"

					context = f"{mnemonic} {operand}"
					self.references[ref_name].append((file_path, line_num, context))

					# Track call relationships
					if mnemonic in self.CALL_INSTRUCTIONS:
						if current_scope and current_scope in self.labels:
							self.labels[current_scope].calls.append(ref_name)

	def _add_label(self, name: str, file_path: Path, line_num: int, label_type: str):
		"""Add a label to the collection."""
		if name not in self.labels:
			self.labels[name] = Label(name, file_path, line_num, label_type)
		# Note: We keep the first definition if there are duplicates

	def _extract_references(self, operand: str) -> List[str]:
		"""Extract label references from an operand."""
		refs = []

		# Remove addressing mode indicators
		operand = operand.replace("#", "").replace("(", "").replace(")", "")
		operand = operand.replace("[", "").replace("]", "")
		operand = operand.replace("<", "").replace(">", "")

		# Split by common separators
		tokens = re.split(r'[,+\-*/\s]+', operand)

		for token in tokens:
			token = token.strip()
			# Skip numeric values
			if not token or token.startswith("$") or token.startswith("%"):
				continue
			if re.match(r'^[0-9]', token):
				continue
			# Skip registers
			if token.upper() in {"A", "X", "Y", "S", "P", "PC"}:
				continue
			# This looks like a label reference
			if re.match(r'^[.@A-Za-z_][A-Za-z0-9_]*$', token):
				refs.append(token)

		return refs

	def _get_all_mnemonics(self) -> Set[str]:
		"""Get all known instruction mnemonics."""
		mnemonics = {
			"ADC", "AND", "ASL", "BCC", "BCS", "BEQ", "BIT", "BMI", "BNE", "BPL",
			"BRK", "BVC", "BVS", "CLC", "CLD", "CLI", "CLV", "CMP", "CPX", "CPY",
			"DEC", "DEX", "DEY", "EOR", "INC", "INX", "INY", "JMP", "JSR", "LDA",
			"LDX", "LDY", "LSR", "NOP", "ORA", "PHA", "PHP", "PLA", "PLP", "ROL",
			"ROR", "RTI", "RTS", "SBC", "SEC", "SED", "SEI", "STA", "STX", "STY",
			"TAX", "TAY", "TSX", "TXA", "TXS", "TYA",
			# 65816
			"BRA", "BRL", "COP", "JML", "JSL", "MVN", "MVP", "PEA", "PEI", "PER",
			"PHB", "PHD", "PHK", "PHX", "PHY", "PLB", "PLD", "PLX", "PLY", "REP",
			"RTL", "SEP", "STP", "STZ", "TCD", "TCS", "TDC", "TRB", "TSB", "TSC",
			"TXY", "TYX", "WAI", "WDM", "XBA", "XCE",
		}
		return mnemonics

	def process_directory(self, dir_path: Path, pattern: str = "*.asm"):
		"""Process all matching files in a directory."""
		for file_path in dir_path.rglob(pattern):
			self.process_file(file_path)

	def link_references(self):
		"""Link references to their label definitions."""
		for label_name, refs in self.references.items():
			if label_name in self.labels:
				self.labels[label_name].references = refs

				# Update called_by relationships
				for ref_file, ref_line, ref_context in refs:
					if any(inst in ref_context.upper() for inst in self.CALL_INSTRUCTIONS):
						# Find the calling label
						for label in self.labels.values():
							if label.file_path == ref_file:
								# Check if this reference is within this label's scope
								if label.line_number < ref_line:
									label.called_by.append(label_name)
									break

	def find_unreferenced(self) -> List[Label]:
		"""Find labels that are never referenced."""
		unreferenced = []
		for label in self.labels.values():
			if not self.references.get(label.name):
				unreferenced.append(label)
		return unreferenced

	def find_undefined(self) -> Dict[str, List[Tuple[Path, int, str]]]:
		"""Find references to undefined labels."""
		undefined = {}
		for label_name, refs in self.references.items():
			if label_name not in self.labels:
				undefined[label_name] = refs
		return undefined

	def get_call_graph(self, label_name: str, depth: int = 5) -> Dict:
		"""Get call graph for a label."""
		if label_name not in self.labels:
			return {"error": f"Label not found: {label_name}"}

		def build_graph(name: str, current_depth: int, visited: Set[str]) -> Dict:
			if current_depth <= 0 or name in visited:
				return {"name": name, "truncated": True}

			visited.add(name)
			label = self.labels.get(name)
			if not label:
				return {"name": name, "undefined": True}

			children = []
			for called in label.calls:
				children.append(build_graph(called, current_depth - 1, visited.copy()))

			return {
				"name": name,
				"file": str(label.file_path.name),
				"line": label.line_number,
				"calls": children,
			}

		return build_graph(label_name, depth, set())

	def get_callers(self, label_name: str) -> List[Dict]:
		"""Get all callers of a label."""
		callers = []
		for other_label in self.labels.values():
			if label_name in other_label.calls:
				callers.append({
					"name": other_label.name,
					"file": str(other_label.file_path.name),
					"line": other_label.line_number,
				})
		return callers

	def generate_report(self) -> str:
		"""Generate a comprehensive cross-reference report."""
		lines = [
			"Assembly Cross-Reference Report",
			"=" * 60,
			"",
			f"Files processed: {len(self.files_processed)}",
			f"Labels defined: {len(self.labels)}",
			f"Total references: {sum(len(refs) for refs in self.references.values())}",
			"",
		]

		# Unreferenced labels
		unreferenced = self.find_unreferenced()
		if unreferenced:
			lines.append(f"Unreferenced Labels ({len(unreferenced)}):")
			lines.append("-" * 40)
			for label in sorted(unreferenced, key=lambda l: l.name):
				lines.append(f"  {label.name}")
				lines.append(f"    {label.file_path.name}:{label.line_number}")
			lines.append("")

		# Undefined references
		undefined = self.find_undefined()
		if undefined:
			lines.append(f"Undefined References ({len(undefined)}):")
			lines.append("-" * 40)
			for name, refs in sorted(undefined.items()):
				lines.append(f"  {name} ({len(refs)} references)")
				for ref_file, ref_line, _ in refs[:3]:
					lines.append(f"    {ref_file.name}:{ref_line}")
				if len(refs) > 3:
					lines.append(f"    ... and {len(refs) - 3} more")
			lines.append("")

		# Most referenced labels
		ref_counts = [(name, len(refs)) for name, refs in self.references.items() if name in self.labels]
		ref_counts.sort(key=lambda x: x[1], reverse=True)
		if ref_counts:
			lines.append("Most Referenced Labels:")
			lines.append("-" * 40)
			for name, count in ref_counts[:20]:
				lines.append(f"  {count:4d}  {name}")
			lines.append("")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Assembly Cross-Referencer - Find label references and call graphs",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Analyze single file
	python xref.py analyze source.asm

	# Analyze directory
	python xref.py analyze src/ --pattern "*.asm"

	# Find references to a label
	python xref.py refs main_loop

	# Show call graph
	python xref.py callgraph main_routine --depth 5

	# Find callers of a function
	python xref.py callers subroutine_name

	# Find unreferenced code
	python xref.py unreferenced src/

	# Generate full report
	python xref.py report src/ -o xref_report.txt
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze", help="Analyze files and show summary")
	analyze_parser.add_argument("path", help="File or directory to analyze")
	analyze_parser.add_argument("--pattern", default="*.asm", help="File pattern for directories")

	# Refs command
	refs_parser = subparsers.add_parser("refs", help="Find all references to a label")
	refs_parser.add_argument("label", help="Label name to search for")
	refs_parser.add_argument("path", nargs="?", default=".", help="File or directory")
	refs_parser.add_argument("--pattern", default="*.asm", help="File pattern")

	# Callgraph command
	callgraph_parser = subparsers.add_parser("callgraph", help="Show call graph for a label")
	callgraph_parser.add_argument("label", help="Label name")
	callgraph_parser.add_argument("path", nargs="?", default=".", help="File or directory")
	callgraph_parser.add_argument("--depth", type=int, default=5, help="Max depth")
	callgraph_parser.add_argument("--pattern", default="*.asm", help="File pattern")

	# Callers command
	callers_parser = subparsers.add_parser("callers", help="Find all callers of a label")
	callers_parser.add_argument("label", help="Label name")
	callers_parser.add_argument("path", nargs="?", default=".", help="File or directory")
	callers_parser.add_argument("--pattern", default="*.asm", help="File pattern")

	# Unreferenced command
	unref_parser = subparsers.add_parser("unreferenced", help="Find unreferenced labels")
	unref_parser.add_argument("path", help="File or directory")
	unref_parser.add_argument("--pattern", default="*.asm", help="File pattern")

	# Report command
	report_parser = subparsers.add_parser("report", help="Generate full report")
	report_parser.add_argument("path", help="File or directory")
	report_parser.add_argument("--pattern", default="*.asm", help="File pattern")
	report_parser.add_argument("-o", "--output", help="Output file")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	# Initialize cross-referencer
	xref = CrossReferencer()

	# Process files
	path = Path(args.path)
	if path.is_file():
		xref.process_file(path)
	elif path.is_dir():
		xref.process_directory(path, args.pattern)
	else:
		print(f"Error: Path not found: {path}", file=sys.stderr)
		return 1

	xref.link_references()

	if args.command == "analyze":
		print(f"\nAnalyzed {len(xref.files_processed)} files")
		print(f"Labels: {len(xref.labels)}")
		print(f"References: {sum(len(refs) for refs in xref.references.values())}")
		print(f"Unreferenced: {len(xref.find_unreferenced())}")
		print(f"Undefined: {len(xref.find_undefined())}")

	elif args.command == "refs":
		if args.label in xref.labels:
			label = xref.labels[args.label]
			refs = xref.references.get(args.label, [])
			print(f"\nLabel: {args.label}")
			print(f"Defined: {label.file_path.name}:{label.line_number}")
			print(f"References: {len(refs)}")
			print()
			for ref_file, ref_line, ref_context in refs:
				print(f"  {ref_file.name}:{ref_line}")
				print(f"    {ref_context}")
		else:
			# Check if it's an undefined reference
			if args.label in xref.references:
				refs = xref.references[args.label]
				print(f"\nUndefined label: {args.label}")
				print(f"Referenced {len(refs)} times:")
				for ref_file, ref_line, ref_context in refs:
					print(f"  {ref_file.name}:{ref_line}")
			else:
				print(f"Label not found: {args.label}")

	elif args.command == "callgraph":
		graph = xref.get_call_graph(args.label, args.depth)

		def print_graph(node: Dict, indent: int = 0):
			prefix = "  " * indent
			name = node.get("name", "?")
			if node.get("undefined"):
				print(f"{prefix}{name} (undefined)")
			elif node.get("truncated"):
				print(f"{prefix}{name} ...")
			else:
				file_info = node.get("file", "")
				line = node.get("line", "")
				print(f"{prefix}{name} ({file_info}:{line})")
				for child in node.get("calls", []):
					print_graph(child, indent + 1)

		print(f"\nCall graph for: {args.label}\n")
		print_graph(graph)

	elif args.command == "callers":
		callers = xref.get_callers(args.label)
		print(f"\nCallers of: {args.label}")
		print(f"Found: {len(callers)}")
		print()
		for caller in callers:
			print(f"  {caller['name']}")
			print(f"    {caller['file']}:{caller['line']}")

	elif args.command == "unreferenced":
		unreferenced = xref.find_unreferenced()
		print(f"\nUnreferenced labels: {len(unreferenced)}")
		print()
		for label in sorted(unreferenced, key=lambda l: (str(l.file_path), l.line_number)):
			print(f"  {label.name}")
			print(f"    {label.file_path.name}:{label.line_number}")

	elif args.command == "report":
		report = xref.generate_report()
		if args.output:
			Path(args.output).write_text(report, encoding="utf-8")
			print(f"Report saved: {args.output}")
		else:
			print(report)

	return 0


if __name__ == "__main__":
	sys.exit(main())
