#!/usr/bin/env python3
"""
Assembly Differ - Compare disassembled code between ROM versions

Compares assembly files or ROM disassemblies to find differences
between game versions (US/JP/EU, revisions, etc.)

Features:
- Side-by-side comparison of ASM files
- Instruction-level diff (ignores address differences)
- Label/symbol difference tracking
- Export diff reports in various formats
- Batch comparison of entire disassembly folders
"""

import argparse
import difflib
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class DiffType(Enum):
	"""Types of differences found"""
	ADDED = "added"
	REMOVED = "removed"
	MODIFIED = "modified"
	LABEL_CHANGED = "label_changed"
	ADDRESS_SHIFTED = "address_shifted"
	INSTRUCTION_CHANGED = "instruction_changed"
	DATA_CHANGED = "data_changed"


@dataclass
class AsmLine:
	"""Represents a parsed assembly line"""
	raw: str
	address: Optional[int] = None
	label: Optional[str] = None
	instruction: Optional[str] = None
	operand: Optional[str] = None
	comment: Optional[str] = None
	is_data: bool = False
	line_number: int = 0

	def normalized(self) -> str:
		"""Get normalized version for comparison (ignores addresses)"""
		parts = []
		if self.label:
			parts.append(f"{self.label}:")
		if self.instruction:
			if self.operand:
				parts.append(f"\t{self.instruction} {self.operand}")
			else:
				parts.append(f"\t{self.instruction}")
		if self.comment and not self.instruction:
			parts.append(self.comment)
		return " ".join(parts) if parts else self.raw.strip()


@dataclass
class DiffResult:
	"""Result of comparing two assembly sections"""
	diff_type: DiffType
	line_a: Optional[AsmLine] = None
	line_b: Optional[AsmLine] = None
	context: str = ""


@dataclass
class FileComparison:
	"""Complete comparison between two files"""
	file_a: str
	file_b: str
	diffs: list = field(default_factory=list)
	stats: dict = field(default_factory=dict)


class AssemblyParser:
	"""Parse assembly files into structured format"""

	# Common assembly patterns
	PATTERNS = {
		'6502': {
			'address': r'^\s*([0-9a-fA-F]{4,6}):\s*',
			'label': r'^([a-zA-Z_][a-zA-Z0-9_]*):',
			'instruction': r'^\s*([a-zA-Z]{2,4})\s*(.*)$',
			'data': r'^\s*\.(db|dw|byte|word|text|ascii)\s+(.*)$',
			'comment': r';(.*)$',
		},
		'65816': {
			'address': r'^\s*([0-9a-fA-F]{6}):\s*',
			'label': r'^([a-zA-Z_][a-zA-Z0-9_]*):',
			'instruction': r'^\s*([a-zA-Z]{2,4})\s*(.*)$',
			'data': r'^\s*\.(db|dw|dl|byte|word|long|text|ascii)\s+(.*)$',
			'comment': r';(.*)$',
		},
		'z80': {
			'address': r'^\s*([0-9a-fA-F]{4}):\s*',
			'label': r'^([a-zA-Z_][a-zA-Z0-9_]*):',
			'instruction': r'^\s*([a-zA-Z]{2,4})\s*(.*)$',
			'data': r'^\s*\.(db|dw|defb|defw)\s+(.*)$',
			'comment': r';(.*)$',
		}
	}

	def __init__(self, arch: str = '6502'):
		self.arch = arch
		self.patterns = self.PATTERNS.get(arch, self.PATTERNS['6502'])

	def parse_line(self, line: str, line_number: int = 0) -> AsmLine:
		"""Parse a single assembly line"""
		result = AsmLine(raw=line, line_number=line_number)

		# Strip and preserve original
		stripped = line.strip()
		if not stripped:
			return result

		# Extract comment
		comment_match = re.search(self.patterns['comment'], stripped)
		if comment_match:
			result.comment = comment_match.group(1).strip()
			stripped = stripped[:comment_match.start()].strip()

		# Check for address prefix
		addr_match = re.match(self.patterns['address'], stripped)
		if addr_match:
			result.address = int(addr_match.group(1), 16)
			stripped = stripped[addr_match.end():].strip()

		# Check for label
		label_match = re.match(self.patterns['label'], stripped)
		if label_match:
			result.label = label_match.group(1)
			stripped = stripped[label_match.end():].strip()

		# Check for data directive
		data_match = re.match(self.patterns['data'], stripped, re.IGNORECASE)
		if data_match:
			result.instruction = data_match.group(1).lower()
			result.operand = data_match.group(2).strip()
			result.is_data = True
			return result

		# Check for instruction
		if stripped:
			instr_match = re.match(self.patterns['instruction'], stripped)
			if instr_match:
				result.instruction = instr_match.group(1).upper()
				operand = instr_match.group(2).strip()
				# Remove trailing comment from operand
				if operand:
					result.operand = operand.split(';')[0].strip()

		return result

	def parse_file(self, filepath: str) -> list:
		"""Parse an entire assembly file"""
		lines = []
		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			for i, line in enumerate(f, 1):
				lines.append(self.parse_line(line, i))
		return lines


class AssemblyDiffer:
	"""Compare assembly files and generate diff reports"""

	def __init__(self, arch: str = '6502'):
		self.parser = AssemblyParser(arch)

	def compare_files(self, file_a: str, file_b: str, ignore_addresses: bool = True) -> FileComparison:
		"""Compare two assembly files"""
		lines_a = self.parser.parse_file(file_a)
		lines_b = self.parser.parse_file(file_b)

		comparison = FileComparison(file_a=file_a, file_b=file_b)

		# Get normalized versions for comparison
		if ignore_addresses:
			norm_a = [line.normalized() for line in lines_a]
			norm_b = [line.normalized() for line in lines_b]
		else:
			norm_a = [line.raw.rstrip() for line in lines_a]
			norm_b = [line.raw.rstrip() for line in lines_b]

		# Use difflib for sequence matching
		matcher = difflib.SequenceMatcher(None, norm_a, norm_b)

		stats = {
			'total_lines_a': len(lines_a),
			'total_lines_b': len(lines_b),
			'added': 0,
			'removed': 0,
			'modified': 0,
			'unchanged': 0,
		}

		for tag, i1, i2, j1, j2 in matcher.get_opcodes():
			if tag == 'equal':
				stats['unchanged'] += (i2 - i1)
			elif tag == 'replace':
				for i, j in zip(range(i1, i2), range(j1, j2)):
					diff = self._classify_difference(lines_a[i], lines_b[j])
					comparison.diffs.append(diff)
					stats['modified'] += 1
				# Handle unequal lengths
				if i2 - i1 > j2 - j1:
					for i in range(i1 + (j2 - j1), i2):
						comparison.diffs.append(DiffResult(
							diff_type=DiffType.REMOVED,
							line_a=lines_a[i]
						))
						stats['removed'] += 1
				elif j2 - j1 > i2 - i1:
					for j in range(j1 + (i2 - i1), j2):
						comparison.diffs.append(DiffResult(
							diff_type=DiffType.ADDED,
							line_b=lines_b[j]
						))
						stats['added'] += 1
			elif tag == 'delete':
				for i in range(i1, i2):
					comparison.diffs.append(DiffResult(
						diff_type=DiffType.REMOVED,
						line_a=lines_a[i]
					))
					stats['removed'] += 1
			elif tag == 'insert':
				for j in range(j1, j2):
					comparison.diffs.append(DiffResult(
						diff_type=DiffType.ADDED,
						line_b=lines_b[j]
					))
					stats['added'] += 1

		comparison.stats = stats
		return comparison

	def _classify_difference(self, line_a: AsmLine, line_b: AsmLine) -> DiffResult:
		"""Classify the type of difference between two lines"""
		# Check for label change only
		if (line_a.instruction == line_b.instruction and
			line_a.operand == line_b.operand and
			line_a.label != line_b.label):
			return DiffResult(
				diff_type=DiffType.LABEL_CHANGED,
				line_a=line_a,
				line_b=line_b,
				context=f"Label: {line_a.label} -> {line_b.label}"
			)

		# Check for address shift (same instruction, different address reference)
		if (line_a.instruction == line_b.instruction and
			line_a.operand and line_b.operand):
			# Extract addresses from operands
			addr_a = re.search(r'\$([0-9a-fA-F]+)', line_a.operand or '')
			addr_b = re.search(r'\$([0-9a-fA-F]+)', line_b.operand or '')
			if addr_a and addr_b and addr_a.group(1) != addr_b.group(1):
				return DiffResult(
					diff_type=DiffType.ADDRESS_SHIFTED,
					line_a=line_a,
					line_b=line_b,
					context=f"Address: ${addr_a.group(1)} -> ${addr_b.group(1)}"
				)

		# Check for instruction change
		if line_a.instruction != line_b.instruction:
			return DiffResult(
				diff_type=DiffType.INSTRUCTION_CHANGED,
				line_a=line_a,
				line_b=line_b,
				context=f"Instruction: {line_a.instruction} -> {line_b.instruction}"
			)

		# Check for data change
		if line_a.is_data and line_b.is_data:
			return DiffResult(
				diff_type=DiffType.DATA_CHANGED,
				line_a=line_a,
				line_b=line_b
			)

		# Generic modification
		return DiffResult(
			diff_type=DiffType.MODIFIED,
			line_a=line_a,
			line_b=line_b
		)

	def compare_directories(self, dir_a: str, dir_b: str,
							pattern: str = "*.asm") -> list:
		"""Compare all matching files between two directories"""
		path_a = Path(dir_a)
		path_b = Path(dir_b)

		comparisons = []

		# Find all files in dir_a
		files_a = set(f.relative_to(path_a) for f in path_a.glob(pattern))
		files_b = set(f.relative_to(path_b) for f in path_b.glob(pattern))

		# Compare common files
		common = files_a & files_b
		for rel_path in sorted(common):
			file_a = str(path_a / rel_path)
			file_b = str(path_b / rel_path)
			comparison = self.compare_files(file_a, file_b)
			comparisons.append(comparison)

		# Note files only in one directory
		only_a = files_a - files_b
		only_b = files_b - files_a

		for rel_path in sorted(only_a):
			comparisons.append(FileComparison(
				file_a=str(path_a / rel_path),
				file_b="",
				stats={'only_in': 'a', 'note': 'File only in first directory'}
			))

		for rel_path in sorted(only_b):
			comparisons.append(FileComparison(
				file_a="",
				file_b=str(path_b / rel_path),
				stats={'only_in': 'b', 'note': 'File only in second directory'}
			))

		return comparisons


class DiffReporter:
	"""Generate diff reports in various formats"""

	def __init__(self, comparison: FileComparison):
		self.comparison = comparison

	def to_text(self, context_lines: int = 3) -> str:
		"""Generate plain text diff report"""
		lines = []
		lines.append(f"Comparison: {self.comparison.file_a} vs {self.comparison.file_b}")
		lines.append("=" * 80)

		stats = self.comparison.stats
		lines.append(f"Statistics:")
		lines.append(f"  Lines in A: {stats.get('total_lines_a', 0)}")
		lines.append(f"  Lines in B: {stats.get('total_lines_b', 0)}")
		lines.append(f"  Added: {stats.get('added', 0)}")
		lines.append(f"  Removed: {stats.get('removed', 0)}")
		lines.append(f"  Modified: {stats.get('modified', 0)}")
		lines.append(f"  Unchanged: {stats.get('unchanged', 0)}")
		lines.append("")

		if self.comparison.diffs:
			lines.append("Differences:")
			lines.append("-" * 80)

			for diff in self.comparison.diffs:
				if diff.diff_type == DiffType.ADDED:
					lines.append(f"+ [{diff.line_b.line_number}] {diff.line_b.raw.rstrip()}")
				elif diff.diff_type == DiffType.REMOVED:
					lines.append(f"- [{diff.line_a.line_number}] {diff.line_a.raw.rstrip()}")
				else:
					lines.append(f"~ [{diff.line_a.line_number}] {diff.diff_type.value}: {diff.context}")
					lines.append(f"  A: {diff.line_a.raw.rstrip()}")
					lines.append(f"  B: {diff.line_b.raw.rstrip()}")
				lines.append("")

		return "\n".join(lines)

	def to_html(self) -> str:
		"""Generate HTML diff report"""
		html = ["""
<!DOCTYPE html>
<html>
<head>
	<title>Assembly Diff Report</title>
	<style>
		body { font-family: monospace; margin: 20px; }
		.header { background: #333; color: white; padding: 10px; }
		.stats { background: #f0f0f0; padding: 10px; margin: 10px 0; }
		.diff-table { border-collapse: collapse; width: 100%; }
		.diff-table td { border: 1px solid #ddd; padding: 5px; vertical-align: top; }
		.line-num { color: #888; width: 50px; text-align: right; }
		.added { background: #dfd; }
		.removed { background: #fdd; }
		.modified { background: #ffd; }
		.code { white-space: pre; }
	</style>
</head>
<body>
"""]

		html.append(f'<div class="header">')
		html.append(f'<h2>Assembly Diff Report</h2>')
		html.append(f'<p>File A: {self.comparison.file_a}</p>')
		html.append(f'<p>File B: {self.comparison.file_b}</p>')
		html.append('</div>')

		stats = self.comparison.stats
		html.append('<div class="stats">')
		html.append(f'<strong>Statistics:</strong> ')
		html.append(f'Added: {stats.get("added", 0)} | ')
		html.append(f'Removed: {stats.get("removed", 0)} | ')
		html.append(f'Modified: {stats.get("modified", 0)} | ')
		html.append(f'Unchanged: {stats.get("unchanged", 0)}')
		html.append('</div>')

		html.append('<table class="diff-table">')
		html.append('<tr><th>Line</th><th>Type</th><th>File A</th><th>File B</th></tr>')

		for diff in self.comparison.diffs:
			css_class = {
				DiffType.ADDED: 'added',
				DiffType.REMOVED: 'removed',
			}.get(diff.diff_type, 'modified')

			line_num = diff.line_a.line_number if diff.line_a else diff.line_b.line_number
			line_a_text = diff.line_a.raw.rstrip() if diff.line_a else ''
			line_b_text = diff.line_b.raw.rstrip() if diff.line_b else ''

			html.append(f'<tr class="{css_class}">')
			html.append(f'<td class="line-num">{line_num}</td>')
			html.append(f'<td>{diff.diff_type.value}</td>')
			html.append(f'<td class="code">{self._escape_html(line_a_text)}</td>')
			html.append(f'<td class="code">{self._escape_html(line_b_text)}</td>')
			html.append('</tr>')

		html.append('</table>')
		html.append('</body></html>')

		return "\n".join(html)

	def to_json(self) -> str:
		"""Generate JSON diff report"""
		data = {
			'file_a': self.comparison.file_a,
			'file_b': self.comparison.file_b,
			'stats': self.comparison.stats,
			'diffs': []
		}

		for diff in self.comparison.diffs:
			diff_data = {
				'type': diff.diff_type.value,
				'context': diff.context,
			}
			if diff.line_a:
				diff_data['line_a'] = {
					'number': diff.line_a.line_number,
					'raw': diff.line_a.raw.rstrip(),
					'instruction': diff.line_a.instruction,
					'operand': diff.line_a.operand,
				}
			if diff.line_b:
				diff_data['line_b'] = {
					'number': diff.line_b.line_number,
					'raw': diff.line_b.raw.rstrip(),
					'instruction': diff.line_b.instruction,
					'operand': diff.line_b.operand,
				}
			data['diffs'].append(diff_data)

		return json.dumps(data, indent=2)

	def _escape_html(self, text: str) -> str:
		"""Escape HTML special characters"""
		return (text
			.replace('&', '&amp;')
			.replace('<', '&lt;')
			.replace('>', '&gt;')
			.replace('"', '&quot;'))


def main():
	parser = argparse.ArgumentParser(
		description='Compare assembly files between ROM versions'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Compare files
	file_parser = subparsers.add_parser('files', help='Compare two assembly files')
	file_parser.add_argument('file_a', help='First assembly file')
	file_parser.add_argument('file_b', help='Second assembly file')
	file_parser.add_argument('--arch', choices=['6502', '65816', 'z80'],
							default='6502', help='CPU architecture')
	file_parser.add_argument('--include-addresses', action='store_true',
							help='Include address differences')
	file_parser.add_argument('--format', choices=['text', 'html', 'json'],
							default='text', help='Output format')
	file_parser.add_argument('-o', '--output', help='Output file')

	# Compare directories
	dir_parser = subparsers.add_parser('dirs', help='Compare two disassembly directories')
	dir_parser.add_argument('dir_a', help='First directory')
	dir_parser.add_argument('dir_b', help='Second directory')
	dir_parser.add_argument('--pattern', default='*.asm', help='File pattern to match')
	dir_parser.add_argument('--arch', choices=['6502', '65816', 'z80'],
						   default='6502', help='CPU architecture')
	dir_parser.add_argument('--summary', action='store_true',
						   help='Show summary only')
	dir_parser.add_argument('-o', '--output', help='Output file')

	# Summary
	summary_parser = subparsers.add_parser('summary', help='Show diff summary')
	summary_parser.add_argument('file_a', help='First assembly file')
	summary_parser.add_argument('file_b', help='Second assembly file')
	summary_parser.add_argument('--arch', choices=['6502', '65816', 'z80'],
							   default='6502', help='CPU architecture')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	if args.command == 'files':
		differ = AssemblyDiffer(args.arch)
		comparison = differ.compare_files(
			args.file_a,
			args.file_b,
			ignore_addresses=not args.include_addresses
		)

		reporter = DiffReporter(comparison)

		if args.format == 'text':
			output = reporter.to_text()
		elif args.format == 'html':
			output = reporter.to_html()
		else:
			output = reporter.to_json()

		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(output)
			print(f"Report written to {args.output}")
		else:
			print(output)

	elif args.command == 'dirs':
		differ = AssemblyDiffer(args.arch)
		comparisons = differ.compare_directories(args.dir_a, args.dir_b, args.pattern)

		total_stats = {
			'files_compared': 0,
			'files_with_diffs': 0,
			'total_added': 0,
			'total_removed': 0,
			'total_modified': 0,
		}

		lines = [f"Directory Comparison: {args.dir_a} vs {args.dir_b}", "=" * 80, ""]

		for comp in comparisons:
			if 'only_in' in comp.stats:
				lines.append(f"[{comp.stats['only_in'].upper()} ONLY] {comp.file_a or comp.file_b}")
				continue

			total_stats['files_compared'] += 1
			has_diffs = len(comp.diffs) > 0
			if has_diffs:
				total_stats['files_with_diffs'] += 1
				total_stats['total_added'] += comp.stats.get('added', 0)
				total_stats['total_removed'] += comp.stats.get('removed', 0)
				total_stats['total_modified'] += comp.stats.get('modified', 0)

			file_a_name = os.path.basename(comp.file_a)
			status = "DIFFERENT" if has_diffs else "IDENTICAL"
			lines.append(f"[{status}] {file_a_name}")

			if has_diffs and not args.summary:
				lines.append(f"  Added: {comp.stats.get('added', 0)}, "
							f"Removed: {comp.stats.get('removed', 0)}, "
							f"Modified: {comp.stats.get('modified', 0)}")

		lines.append("")
		lines.append("=" * 80)
		lines.append("Summary:")
		lines.append(f"  Files compared: {total_stats['files_compared']}")
		lines.append(f"  Files with differences: {total_stats['files_with_diffs']}")
		lines.append(f"  Total lines added: {total_stats['total_added']}")
		lines.append(f"  Total lines removed: {total_stats['total_removed']}")
		lines.append(f"  Total lines modified: {total_stats['total_modified']}")

		output = "\n".join(lines)

		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(output)
			print(f"Report written to {args.output}")
		else:
			print(output)

	elif args.command == 'summary':
		differ = AssemblyDiffer(args.arch)
		comparison = differ.compare_files(args.file_a, args.file_b)

		stats = comparison.stats
		print(f"Comparison Summary: {os.path.basename(args.file_a)} vs {os.path.basename(args.file_b)}")
		print("-" * 60)
		print(f"Lines in file A:  {stats.get('total_lines_a', 0)}")
		print(f"Lines in file B:  {stats.get('total_lines_b', 0)}")
		print(f"Lines added:      {stats.get('added', 0)}")
		print(f"Lines removed:    {stats.get('removed', 0)}")
		print(f"Lines modified:   {stats.get('modified', 0)}")
		print(f"Lines unchanged:  {stats.get('unchanged', 0)}")

		if comparison.diffs:
			# Count by type
			type_counts = {}
			for diff in comparison.diffs:
				type_name = diff.diff_type.value
				type_counts[type_name] = type_counts.get(type_name, 0) + 1

			print("\nBy Difference Type:")
			for type_name, count in sorted(type_counts.items()):
				print(f"  {type_name}: {count}")


if __name__ == '__main__':
	main()
