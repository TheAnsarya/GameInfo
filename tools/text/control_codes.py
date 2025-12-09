#!/usr/bin/env python3
"""
Control Code Parser

Parse and document control codes in game text data.
Identifies patterns like [XX], {YY}, etc. and generates documentation.
"""

import argparse
import json
import re
from collections import Counter, defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class ControlCode:
	"""Represents a control code definition."""

	def __init__(
		self,
		code: int,
		name: str = "",
		description: str = "",
		param_count: int = 0,
		param_types: List[str] = None
	):
		self.code = code
		self.name = name or f"CODE_{code:02X}"
		self.description = description
		self.param_count = param_count
		self.param_types = param_types or []
		self.occurrences = 0
		self.examples = []

	def to_dict(self) -> dict:
		return {
			"code": f"${self.code:02X}",
			"name": self.name,
			"description": self.description,
			"param_count": self.param_count,
			"param_types": self.param_types,
			"occurrences": self.occurrences,
			"examples": self.examples[:5],  # First 5 examples
		}


class ControlCodeDatabase:
	"""Database of control codes."""

	def __init__(self):
		self.codes: Dict[int, ControlCode] = {}
		self.code_range_start = 0x00
		self.code_range_end = 0x20
		self.terminator = 0x00

	def add_code(self, code: ControlCode):
		"""Add a control code definition."""
		self.codes[code.code] = code

	def get_code(self, byte_val: int) -> Optional[ControlCode]:
		"""Get control code by value."""
		return self.codes.get(byte_val)

	def is_control_code(self, byte_val: int) -> bool:
		"""Check if byte is a control code."""
		if byte_val in self.codes:
			return True
		if self.code_range_start <= byte_val <= self.code_range_end:
			return True
		return False

	def load_from_json(self, path: str):
		"""Load control code definitions from JSON."""
		data = json.loads(Path(path).read_text(encoding='utf-8'))

		if "range_start" in data:
			self.code_range_start = int(data["range_start"], 16)
		if "range_end" in data:
			self.code_range_end = int(data["range_end"], 16)
		if "terminator" in data:
			self.terminator = int(data["terminator"], 16)

		for entry in data.get("codes", []):
			code_val = int(entry["code"], 16) if isinstance(entry["code"], str) else entry["code"]
			code = ControlCode(
				code_val,
				entry.get("name", ""),
				entry.get("description", ""),
				entry.get("param_count", 0),
				entry.get("param_types", [])
			)
			self.add_code(code)

	def save_to_json(self, path: str):
		"""Save control code definitions to JSON."""
		data = {
			"range_start": f"${self.code_range_start:02X}",
			"range_end": f"${self.code_range_end:02X}",
			"terminator": f"${self.terminator:02X}",
			"codes": [code.to_dict() for code in sorted(self.codes.values(), key=lambda c: c.code)]
		}
		Path(path).write_text(json.dumps(data, indent='\t'), encoding='utf-8')

	def generate_documentation(self) -> str:
		"""Generate markdown documentation."""
		lines = [
			"# Control Codes Documentation",
			"",
			f"Control code range: ${self.code_range_start:02X} - ${self.code_range_end:02X}",
			f"String terminator: ${self.terminator:02X}",
			"",
			"## Control Codes",
			"",
			"| Code | Name | Parameters | Description |",
			"|------|------|------------|-------------|",
		]

		for code in sorted(self.codes.values(), key=lambda c: c.code):
			params = ", ".join(code.param_types) if code.param_types else f"{code.param_count} bytes"
			if code.param_count == 0:
				params = "none"
			lines.append(f"| ${code.code:02X} | {code.name} | {params} | {code.description} |")

		return '\n'.join(lines)


class ControlCodeAnalyzer:
	"""Analyze binary data for control codes."""

	def __init__(self, db: ControlCodeDatabase = None):
		self.db = db or ControlCodeDatabase()
		self.text_range = (0x20, 0x7F)  # Printable ASCII range

	def set_text_range(self, start: int, end: int):
		"""Set the range of bytes considered text."""
		self.text_range = (start, end)

	def analyze_data(self, data: bytes) -> Dict[int, List[dict]]:
		"""
		Analyze data for potential control codes.

		Returns dictionary of code -> list of contexts.
		"""
		results = defaultdict(list)
		i = 0

		while i < len(data):
			byte = data[i]

			if self.db.is_control_code(byte):
				# Found potential control code
				context = self._extract_context(data, i)

				code_def = self.db.get_code(byte)
				param_count = code_def.param_count if code_def else 0

				result = {
					"offset": i,
					"code": byte,
					"params": list(data[i + 1:i + 1 + param_count]) if param_count > 0 else [],
					"context_before": context["before"],
					"context_after": context["after"],
				}

				results[byte].append(result)

				if code_def:
					code_def.occurrences += 1
					if len(code_def.examples) < 10:
						code_def.examples.append(result)

				i += 1 + param_count
			else:
				i += 1

		return dict(results)

	def _extract_context(self, data: bytes, offset: int, context_size: int = 16) -> dict:
		"""Extract context around a control code."""
		start = max(0, offset - context_size)
		end = min(len(data), offset + context_size)

		before = data[start:offset]
		after = data[offset + 1:end]

		return {
			"before": self._bytes_to_display(before),
			"after": self._bytes_to_display(after),
		}

	def _bytes_to_display(self, data: bytes) -> str:
		"""Convert bytes to displayable string."""
		result = []
		for b in data:
			if self.text_range[0] <= b <= self.text_range[1]:
				result.append(chr(b))
			else:
				result.append(f"[{b:02X}]")
		return ''.join(result)

	def find_strings(self, data: bytes, min_length: int = 4) -> List[dict]:
		"""Find potential text strings in data."""
		strings = []
		current_string = bytearray()
		start_offset = 0

		for i, byte in enumerate(data):
			if self._is_text_byte(byte):
				if not current_string:
					start_offset = i
				current_string.append(byte)
			else:
				if len(current_string) >= min_length:
					strings.append({
						"offset": start_offset,
						"length": len(current_string),
						"text": self._bytes_to_display(current_string),
						"terminator": byte if i < len(data) else None,
					})
				current_string = bytearray()

		# Handle string at end of data
		if len(current_string) >= min_length:
			strings.append({
				"offset": start_offset,
				"length": len(current_string),
				"text": self._bytes_to_display(current_string),
				"terminator": None,
			})

		return strings

	def _is_text_byte(self, byte: int) -> bool:
		"""Check if byte is in text range."""
		return self.text_range[0] <= byte <= self.text_range[1]

	def detect_patterns(self, data: bytes) -> dict:
		"""Detect common control code patterns."""
		patterns = {
			"potential_terminators": Counter(),
			"common_sequences": Counter(),
			"byte_after_low": Counter(),  # Bytes that commonly follow low bytes
		}

		# Find potential string terminators
		in_text = False
		for i, byte in enumerate(data):
			if self._is_text_byte(byte):
				in_text = True
			elif in_text:
				patterns["potential_terminators"][byte] += 1
				in_text = False

		# Find common 2-byte sequences starting with non-text
		for i in range(len(data) - 1):
			if not self._is_text_byte(data[i]):
				seq = (data[i], data[i + 1])
				patterns["common_sequences"][seq] += 1

		# Bytes that follow low bytes
		for i in range(len(data) - 1):
			if data[i] < 0x20:
				patterns["byte_after_low"][data[i + 1]] += 1

		return {
			"terminators": [
				{"byte": f"${b:02X}", "count": c}
				for b, c in patterns["potential_terminators"].most_common(10)
			],
			"sequences": [
				{"sequence": f"${s[0]:02X} ${s[1]:02X}", "count": c}
				for s, c in patterns["common_sequences"].most_common(20)
			],
		}

	def suggest_codes(self, data: bytes) -> List[dict]:
		"""Suggest potential control codes based on analysis."""
		suggestions = []

		patterns = self.detect_patterns(data)

		# Suggest terminators
		for term in patterns["terminators"][:3]:
			byte_val = int(term["byte"][1:], 16)
			suggestions.append({
				"code": term["byte"],
				"suggested_name": "END" if byte_val == 0 else f"TERM_{byte_val:02X}",
				"reason": f"Appears {term['count']} times after text",
				"suggested_params": 0,
			})

		# Analyze common sequences for potential multi-byte codes
		for seq in patterns["sequences"][:10]:
			parts = seq["sequence"].split()
			byte1 = int(parts[0][1:], 16)
			byte2 = int(parts[1][1:], 16)

			if byte1 < 0x20 and byte2 < 0x100:
				suggestions.append({
					"code": f"${byte1:02X}",
					"suggested_name": f"CODE_{byte1:02X}",
					"reason": f"Sequence ${byte1:02X} ${byte2:02X} appears {seq['count']} times",
					"suggested_params": 1 if byte2 >= 0x20 else 0,
				})

		return suggestions


def main():
	parser = argparse.ArgumentParser(description="Control Code Parser")
	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze",
		help="Analyze data for control codes")
	analyze_parser.add_argument("input", help="Input binary file")
	analyze_parser.add_argument("-o", "--output", help="Output JSON file")
	analyze_parser.add_argument("--codes", help="Control code definitions JSON")
	analyze_parser.add_argument("--suggest", action="store_true",
		help="Suggest control code definitions")

	# Parse command
	parse_parser = subparsers.add_parser("parse",
		help="Parse text with control codes")
	parse_parser.add_argument("input", help="Input binary file")
	parse_parser.add_argument("-o", "--output", help="Output text file")
	parse_parser.add_argument("--codes", required=True,
		help="Control code definitions JSON")
	parse_parser.add_argument("--tbl", help="Character table file")

	# Document command
	doc_parser = subparsers.add_parser("document",
		help="Generate control code documentation")
	doc_parser.add_argument("--codes", required=True,
		help="Control code definitions JSON")
	doc_parser.add_argument("-o", "--output", help="Output markdown file")

	# Create command
	create_parser = subparsers.add_parser("create",
		help="Create control code definition template")
	create_parser.add_argument("-o", "--output", required=True,
		help="Output JSON file")

	args = parser.parse_args()

	if args.command == "analyze":
		data = Path(args.input).read_bytes()

		db = ControlCodeDatabase()
		if args.codes:
			db.load_from_json(args.codes)

		analyzer = ControlCodeAnalyzer(db)

		if args.suggest:
			suggestions = analyzer.suggest_codes(data)
			print("Suggested Control Codes:")
			print("-" * 50)
			for s in suggestions:
				print(f"{s['code']} -> {s['suggested_name']}")
				print(f"  Reason: {s['reason']}")
				print(f"  Suggested params: {s['suggested_params']}")
				print()

			if args.output:
				output_data = {"suggestions": suggestions}
				Path(args.output).write_text(
					json.dumps(output_data, indent='\t'),
					encoding='utf-8'
				)
		else:
			results = analyzer.analyze_data(data)
			strings = analyzer.find_strings(data)

			output_data = {
				"file": args.input,
				"size": len(data),
				"strings_found": len(strings),
				"control_codes": {},
			}

			for code, occurrences in sorted(results.items()):
				code_def = db.get_code(code)
				output_data["control_codes"][f"${code:02X}"] = {
					"name": code_def.name if code_def else f"UNKNOWN_{code:02X}",
					"occurrences": len(occurrences),
					"examples": occurrences[:5],
				}

			print(f"Analysis of {args.input}:")
			print(f"  Size: {len(data)} bytes")
			print(f"  Strings found: {len(strings)}")
			print(f"  Control codes found: {len(results)}")
			print()

			for code, occs in sorted(results.items()):
				code_def = db.get_code(code)
				name = code_def.name if code_def else f"UNKNOWN"
				print(f"  ${code:02X} ({name}): {len(occs)} occurrences")

			if args.output:
				Path(args.output).write_text(
					json.dumps(output_data, indent='\t'),
					encoding='utf-8'
				)
				print(f"\nSaved analysis to {args.output}")

	elif args.command == "parse":
		data = Path(args.input).read_bytes()

		db = ControlCodeDatabase()
		db.load_from_json(args.codes)

		# Load character table if provided
		char_table = {}
		if args.tbl:
			tbl_content = Path(args.tbl).read_text(encoding='utf-8')
			for line in tbl_content.splitlines():
				if '=' in line:
					parts = line.split('=', 1)
					try:
						byte_val = int(parts[0].strip(), 16)
						char_table[byte_val] = parts[1]
					except ValueError:
						pass

		# Parse the data
		output_lines = []
		i = 0

		while i < len(data):
			byte = data[i]

			if byte == db.terminator:
				output_lines.append("[END]\n\n")
				i += 1
			elif db.is_control_code(byte):
				code_def = db.get_code(byte)
				if code_def:
					param_count = code_def.param_count
					params = list(data[i + 1:i + 1 + param_count])
					param_str = ','.join(f'${p:02X}' for p in params)
					if param_str:
						output_lines.append(f"[{code_def.name}:{param_str}]")
					else:
						output_lines.append(f"[{code_def.name}]")
					i += 1 + param_count
				else:
					output_lines.append(f"[${byte:02X}]")
					i += 1
			elif byte in char_table:
				output_lines.append(char_table[byte])
				i += 1
			elif 0x20 <= byte < 0x7F:
				output_lines.append(chr(byte))
				i += 1
			else:
				output_lines.append(f"[${byte:02X}]")
				i += 1

		output = ''.join(output_lines)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Saved parsed text to {args.output}")
		else:
			print(output)

	elif args.command == "document":
		db = ControlCodeDatabase()
		db.load_from_json(args.codes)

		doc = db.generate_documentation()

		if args.output:
			Path(args.output).write_text(doc, encoding='utf-8')
			print(f"Saved documentation to {args.output}")
		else:
			print(doc)

	elif args.command == "create":
		template = {
			"description": "Control code definitions",
			"range_start": "$00",
			"range_end": "$1F",
			"terminator": "$00",
			"codes": [
				{
					"code": "$00",
					"name": "END",
					"description": "End of string",
					"param_count": 0,
					"param_types": []
				},
				{
					"code": "$01",
					"name": "NEWLINE",
					"description": "Line break",
					"param_count": 0,
					"param_types": []
				},
				{
					"code": "$02",
					"name": "WAIT",
					"description": "Wait for button press",
					"param_count": 0,
					"param_types": []
				},
				{
					"code": "$03",
					"name": "SPEED",
					"description": "Set text speed",
					"param_count": 1,
					"param_types": ["speed"]
				},
				{
					"code": "$04",
					"name": "NAME",
					"description": "Insert character name",
					"param_count": 1,
					"param_types": ["character_id"]
				},
				{
					"code": "$05",
					"name": "NUMBER",
					"description": "Insert number variable",
					"param_count": 2,
					"param_types": ["var_low", "var_high"]
				},
			]
		}

		Path(args.output).write_text(
			json.dumps(template, indent='\t'),
			encoding='utf-8'
		)
		print(f"Created template: {args.output}")

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
