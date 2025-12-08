#!/usr/bin/env python3
"""
ASM Formatter

Format and clean up 6502/65816 assembly source files.
Applies consistent styling, alignment, and organization.

Features:
- Consistent instruction alignment
- Comment alignment
- Label formatting
- Blank line management
- Macro formatting
- Include statement organization

Usage:
	python asm_formatter.py format input.asm -o output.asm
	python asm_formatter.py check input.asm
	python asm_formatter.py batch src/
"""

import argparse
import os
import re
import sys
from pathlib import Path
from typing import List, Optional, Tuple


class ASMFormatter:
	"""Format 6502/65816 assembly code."""

	def __init__(self):
		# Configuration
		self.instruction_column = 8
		self.operand_column = 16
		self.comment_column = 40
		self.use_tabs = True
		self.tab_width = 4
		self.uppercase_mnemonics = True
		self.uppercase_hex = True
		self.max_blank_lines = 2

		# 6502/65816 mnemonics
		self.mnemonics = {
			# 6502 core
			'ADC', 'AND', 'ASL', 'BCC', 'BCS', 'BEQ', 'BIT', 'BMI',
			'BNE', 'BPL', 'BRK', 'BVC', 'BVS', 'CLC', 'CLD', 'CLI',
			'CLV', 'CMP', 'CPX', 'CPY', 'DEC', 'DEX', 'DEY', 'EOR',
			'INC', 'INX', 'INY', 'JMP', 'JSR', 'LDA', 'LDX', 'LDY',
			'LSR', 'NOP', 'ORA', 'PHA', 'PHP', 'PLA', 'PLP', 'ROL',
			'ROR', 'RTI', 'RTS', 'SBC', 'SEC', 'SED', 'SEI', 'STA',
			'STX', 'STY', 'TAX', 'TAY', 'TSX', 'TXA', 'TXS', 'TYA',
			# 65816 additions
			'BRA', 'BRL', 'COP', 'JML', 'JSL', 'MVN', 'MVP', 'PEA',
			'PEI', 'PER', 'PHB', 'PHD', 'PHK', 'PHX', 'PHY', 'PLB',
			'PLD', 'PLX', 'PLY', 'REP', 'RTL', 'SEP', 'STP', 'STZ',
			'TCD', 'TCS', 'TDC', 'TRB', 'TSB', 'TSC', 'TXY', 'TYX',
			'WAI', 'WDM', 'XBA', 'XCE',
		}

		# Assembler directives
		self.directives = {
			'.ORG', '.BYTE', '.WORD', '.DB', '.DW', '.DS', '.INCBIN',
			'.INCLUDE', '.IFDEF', '.IFNDEF', '.ELSE', '.ENDIF', '.IF',
			'.MACRO', '.ENDM', '.ENDMACRO', '.PROC', '.ENDPROC',
			'.SEGMENT', '.DEFINE', '.EQU', '.SET', '.BANK', '.BASE',
			'.TEXT', '.DATA', '.BSS', '.CODE', '.RODATA', '.ALIGN',
			'.RES', '.ASCIIZ', '.ASCII', '.DBYT', '.LOBYTES', '.HIBYTES',
		}

	def _make_indent(self, columns: int) -> str:
		"""Create indentation string."""
		if self.use_tabs:
			tabs = columns // self.tab_width
			spaces = columns % self.tab_width
			return '\t' * tabs + ' ' * spaces
		return ' ' * columns

	def _align_to_column(self, current_pos: int, target_col: int) -> str:
		"""Generate spacing to align to target column."""
		if current_pos >= target_col:
			return ' '  # At least one space
		return self._make_indent(target_col - current_pos)

	def _parse_line(self, line: str) -> dict:
		"""Parse a line of assembly into components."""
		original = line
		comment = ''
		label = ''
		mnemonic = ''
		operand = ''

		# Strip trailing whitespace
		line = line.rstrip()

		# Extract comment
		comment_match = re.search(r'(;.*)$', line)
		if comment_match:
			comment = comment_match.group(1)
			line = line[:comment_match.start()].rstrip()

		# Check for label
		label_match = re.match(r'^(\w+:?)\s*', line)
		if label_match:
			potential_label = label_match.group(1)
			# Check if it's not a mnemonic
			upper_label = potential_label.upper().rstrip(':')
			if upper_label not in self.mnemonics and upper_label not in self.directives:
				label = potential_label
				line = line[label_match.end():].strip()

		# Extract mnemonic and operand
		parts = line.split(None, 1)
		if parts:
			mnemonic = parts[0]
			if len(parts) > 1:
				operand = parts[1]

		return {
			'original': original,
			'label': label,
			'mnemonic': mnemonic,
			'operand': operand,
			'comment': comment,
		}

	def _format_mnemonic(self, mnemonic: str) -> str:
		"""Format mnemonic according to style."""
		if not mnemonic:
			return ''
		if self.uppercase_mnemonics:
			return mnemonic.upper()
		return mnemonic.lower()

	def _format_operand(self, operand: str) -> str:
		"""Format operand according to style."""
		if not operand:
			return ''

		if self.uppercase_hex:
			# Convert hex values to uppercase
			result = re.sub(
				r'\$([0-9a-fA-F]+)',
				lambda m: '$' + m.group(1).upper(),
				operand
			)
			return result
		return operand

	def _format_label(self, label: str) -> str:
		"""Format label."""
		if not label:
			return ''
		# Ensure colon if not present and not a special case
		if label and not label.endswith(':'):
			return label + ':'
		return label

	def format_line(self, line: str) -> str:
		"""Format a single line of assembly."""
		# Handle blank lines
		if not line.strip():
			return ''

		# Handle full-line comments
		stripped = line.strip()
		if stripped.startswith(';'):
			return stripped

		# Parse the line
		parsed = self._parse_line(line)

		# Build formatted line
		result = ''
		current_pos = 0

		# Add label
		if parsed['label']:
			formatted_label = self._format_label(parsed['label'])
			result += formatted_label
			current_pos = len(formatted_label)

		# Add mnemonic
		if parsed['mnemonic']:
			formatted_mnem = self._format_mnemonic(parsed['mnemonic'])

			if current_pos > 0:
				# After label, indent to instruction column
				result += self._align_to_column(current_pos, self.instruction_column)
				current_pos = self.instruction_column
			else:
				# No label, just indent
				result += self._make_indent(self.instruction_column)
				current_pos = self.instruction_column

			result += formatted_mnem
			current_pos += len(formatted_mnem)

			# Add operand
			if parsed['operand']:
				formatted_op = self._format_operand(parsed['operand'])
				result += self._align_to_column(current_pos, self.operand_column)
				current_pos = self.operand_column
				result += formatted_op
				current_pos += len(formatted_op)

		elif parsed['label']:
			# Label only line
			pass

		# Add comment
		if parsed['comment']:
			if result.strip():
				result += self._align_to_column(current_pos, self.comment_column)
			result += parsed['comment']

		return result

	def format_file(self, content: str) -> str:
		"""Format entire file content."""
		lines = content.splitlines()
		formatted_lines = []
		blank_count = 0

		for line in lines:
			formatted = self.format_line(line)

			# Manage blank lines
			if not formatted.strip():
				blank_count += 1
				if blank_count <= self.max_blank_lines:
					formatted_lines.append('')
			else:
				blank_count = 0
				formatted_lines.append(formatted)

		# Remove trailing blank lines
		while formatted_lines and not formatted_lines[-1].strip():
			formatted_lines.pop()

		return '\n'.join(formatted_lines) + '\n'

	def check_file(self, content: str) -> List[Tuple[int, str, str]]:
		"""Check file for formatting issues."""
		issues = []
		lines = content.splitlines()

		for i, line in enumerate(lines, 1):
			formatted = self.format_line(line)

			if line.rstrip() != formatted.rstrip():
				issues.append((i, line.rstrip(), formatted.rstrip()))

		return issues


class ASMAnalyzer:
	"""Analyze assembly code for statistics and issues."""

	def __init__(self):
		self.formatter = ASMFormatter()

	def analyze_file(self, content: str) -> dict:
		"""Analyze file and return statistics."""
		lines = content.splitlines()

		stats = {
			'total_lines': len(lines),
			'blank_lines': 0,
			'comment_lines': 0,
			'label_count': 0,
			'instruction_count': 0,
			'directive_count': 0,
			'labels': [],
			'undefined_refs': [],
		}

		defined_labels = set()

		for line in lines:
			stripped = line.strip()

			if not stripped:
				stats['blank_lines'] += 1
				continue

			if stripped.startswith(';'):
				stats['comment_lines'] += 1
				continue

			parsed = self.formatter._parse_line(line)

			if parsed['label']:
				label_name = parsed['label'].rstrip(':')
				stats['label_count'] += 1
				stats['labels'].append(label_name)
				defined_labels.add(label_name)

			if parsed['mnemonic']:
				upper_mnem = parsed['mnemonic'].upper()
				if upper_mnem in self.formatter.mnemonics:
					stats['instruction_count'] += 1
				elif upper_mnem in self.formatter.directives:
					stats['directive_count'] += 1

		return stats


def main():
	parser = argparse.ArgumentParser(description='ASM Formatter')
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Format command
	format_parser = subparsers.add_parser('format', help='Format assembly file')
	format_parser.add_argument('input', help='Input ASM file')
	format_parser.add_argument('-o', '--output', help='Output file (default: overwrite)')
	format_parser.add_argument('--spaces', action='store_true',
		help='Use spaces instead of tabs')
	format_parser.add_argument('--lowercase', action='store_true',
		help='Use lowercase mnemonics')
	format_parser.add_argument('--instruction-col', type=int, default=8,
		help='Instruction column (default: 8)')
	format_parser.add_argument('--operand-col', type=int, default=16,
		help='Operand column (default: 16)')
	format_parser.add_argument('--comment-col', type=int, default=40,
		help='Comment column (default: 40)')

	# Check command
	check_parser = subparsers.add_parser('check', help='Check formatting')
	check_parser.add_argument('input', help='Input ASM file')
	check_parser.add_argument('--spaces', action='store_true',
		help='Check for space indentation')

	# Batch command
	batch_parser = subparsers.add_parser('batch', help='Format multiple files')
	batch_parser.add_argument('directory', help='Directory to process')
	batch_parser.add_argument('--pattern', default='*.asm',
		help='File pattern (default: *.asm)')
	batch_parser.add_argument('--dry-run', action='store_true',
		help='Show what would be changed')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze ASM file')
	analyze_parser.add_argument('input', help='Input ASM file')

	args = parser.parse_args()

	if args.command == 'format':
		formatter = ASMFormatter()

		if args.spaces:
			formatter.use_tabs = False
		if args.lowercase:
			formatter.uppercase_mnemonics = False
		formatter.instruction_column = args.instruction_col
		formatter.operand_column = args.operand_col
		formatter.comment_column = args.comment_col

		content = Path(args.input).read_text(encoding='utf-8')
		formatted = formatter.format_file(content)

		output_path = args.output or args.input
		Path(output_path).write_text(formatted, encoding='utf-8')
		print(f"Formatted: {output_path}")

	elif args.command == 'check':
		formatter = ASMFormatter()

		if args.spaces:
			formatter.use_tabs = False

		content = Path(args.input).read_text(encoding='utf-8')
		issues = formatter.check_file(content)

		if issues:
			print(f"Found {len(issues)} formatting issues in {args.input}:")
			for line_num, original, expected in issues[:20]:
				print(f"\nLine {line_num}:")
				print(f"  Current:  {repr(original)}")
				print(f"  Expected: {repr(expected)}")
			if len(issues) > 20:
				print(f"\n... and {len(issues) - 20} more issues")
			sys.exit(1)
		else:
			print(f"No formatting issues found in {args.input}")

	elif args.command == 'batch':
		formatter = ASMFormatter()
		directory = Path(args.directory)

		files = list(directory.rglob(args.pattern))
		print(f"Found {len(files)} files matching {args.pattern}")

		changed = 0
		for filepath in files:
			content = filepath.read_text(encoding='utf-8')
			formatted = formatter.format_file(content)

			if content != formatted:
				changed += 1
				if args.dry_run:
					print(f"Would format: {filepath}")
				else:
					filepath.write_text(formatted, encoding='utf-8')
					print(f"Formatted: {filepath}")

		print(f"\n{'Would change' if args.dry_run else 'Changed'}: {changed} files")

	elif args.command == 'analyze':
		analyzer = ASMAnalyzer()
		content = Path(args.input).read_text(encoding='utf-8')
		stats = analyzer.analyze_file(content)

		print(f"Analysis of {args.input}:")
		print(f"  Total lines: {stats['total_lines']}")
		print(f"  Blank lines: {stats['blank_lines']}")
		print(f"  Comment lines: {stats['comment_lines']}")
		print(f"  Labels: {stats['label_count']}")
		print(f"  Instructions: {stats['instruction_count']}")
		print(f"  Directives: {stats['directive_count']}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
