#!/usr/bin/env python3
"""
String Table Manager

Manage game text string tables with support for custom encodings.
Export to editable formats and re-import for translation.

Features:
- Extract strings with custom TBL files
- Export to CSV/JSON for editing
- Import edited strings back
- Validate string lengths
- Generate translation reports

Usage:
	python string_table.py extract <rom_file> --tbl table.tbl --pointer-table 0x8000 --count 100 --output strings.json
	python string_table.py import <rom_file> --strings strings.json --output patched.nes
	python string_table.py validate <strings_file> --max-length 50
	python string_table.py report <original> <translated> --output report.html
"""

import argparse
import csv
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class StringEntry:
	"""A single string entry"""
	index: int
	pointer_offset: int
	data_offset: int
	raw_bytes: bytes
	text: str
	length: int


@dataclass
class TBLFile:
	"""Text table encoding"""
	encode_map: Dict[str, bytes] = field(default_factory=dict)  # text -> bytes
	decode_map: Dict[int, str] = field(default_factory=dict)    # byte -> text
	multi_byte: Dict[bytes, str] = field(default_factory=dict)  # multi-byte sequences
	end_markers: List[int] = field(default_factory=list)


def load_tbl(filepath: str) -> TBLFile:
	"""Load a TBL (text table) file"""
	tbl = TBLFile()
	tbl.end_markers = [0x00, 0xFF]  # Common defaults

	with open(filepath, 'r', encoding='utf-8') as f:
		for line in f:
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			if '=' in line:
				parts = line.split('=', 1)
				if len(parts) == 2:
					hex_part = parts[0].strip()
					text_part = parts[1]

					try:
						# Handle multi-byte
						if len(hex_part) > 2:
							byte_val = bytes.fromhex(hex_part)
							tbl.multi_byte[byte_val] = text_part
							tbl.encode_map[text_part] = byte_val
						else:
							byte_val = int(hex_part, 16)
							tbl.decode_map[byte_val] = text_part
							tbl.encode_map[text_part] = bytes([byte_val])

							# Check for end markers
							if text_part.upper() in ('[END]', '<END>', '{END}', '\\0'):
								tbl.end_markers.append(byte_val)
					except ValueError:
						pass

	return tbl


def decode_string(data: bytes, tbl: TBLFile) -> Tuple[str, int]:
	"""Decode bytes to string using TBL, return (string, length)"""
	result = []
	i = 0

	while i < len(data):
		# Check for end marker
		if data[i] in tbl.end_markers:
			result.append(tbl.decode_map.get(data[i], f'[{data[i]:02X}]'))
			i += 1
			break

		# Try multi-byte sequences first (longest match)
		found = False
		for length in range(4, 0, -1):
			if i + length <= len(data):
				seq = data[i:i + length]
				if seq in tbl.multi_byte:
					result.append(tbl.multi_byte[seq])
					i += length
					found = True
					break

		if not found:
			# Single byte
			byte = data[i]
			if byte in tbl.decode_map:
				result.append(tbl.decode_map[byte])
			else:
				result.append(f'[{byte:02X}]')
			i += 1

	return ''.join(result), i


def encode_string(text: str, tbl: TBLFile) -> bytes:
	"""Encode string to bytes using TBL"""
	result = bytearray()
	i = 0

	while i < len(text):
		# Try to find longest matching sequence
		found = False

		for length in range(min(10, len(text) - i), 0, -1):
			substr = text[i:i + length]
			if substr in tbl.encode_map:
				result.extend(tbl.encode_map[substr])
				i += length
				found = True
				break

		if not found:
			# Handle control codes like [XX]
			if text[i] == '[' and i + 3 < len(text) and text[i + 3] == ']':
				try:
					hex_val = int(text[i + 1:i + 3], 16)
					result.append(hex_val)
					i += 4
					continue
				except ValueError:
					pass

			# Unknown character - skip or use placeholder
			i += 1

	return bytes(result)


def extract_strings(
	rom_path: str,
	tbl_path: str,
	pointer_table: int,
	count: int,
	bank: int = -1,
	header_size: int = 16
) -> List[StringEntry]:
	"""Extract strings using pointer table"""

	with open(rom_path, 'rb') as f:
		data = f.read()

	tbl = load_tbl(tbl_path)
	strings = []

	# Auto-detect bank from pointer table offset
	if bank == -1:
		bank = (pointer_table - header_size) // 0x4000

	for i in range(count):
		ptr_offset = pointer_table + (i * 2)

		if ptr_offset + 2 > len(data):
			break

		# Read pointer
		ptr_value = struct.unpack('<H', data[ptr_offset:ptr_offset + 2])[0]

		# Calculate file offset
		if 0x8000 <= ptr_value <= 0xFFFF:
			data_offset = header_size + (bank * 0x4000) + (ptr_value - 0x8000)
		else:
			data_offset = ptr_value

		if data_offset >= len(data):
			continue

		# Find string end
		string_data = data[data_offset:data_offset + 256]  # Max 256 bytes
		text, length = decode_string(string_data, tbl)

		entry = StringEntry(
			index=i,
			pointer_offset=ptr_offset,
			data_offset=data_offset,
			raw_bytes=string_data[:length],
			text=text,
			length=length,
		)
		strings.append(entry)

	return strings


def export_strings(strings: List[StringEntry], output_path: str, format: str = 'json'):
	"""Export strings to file"""

	if format == 'json':
		output = {
			'count': len(strings),
			'strings': [
				{
					'index': s.index,
					'pointer_offset': f"0x{s.pointer_offset:06X}",
					'data_offset': f"0x{s.data_offset:06X}",
					'raw_hex': s.raw_bytes.hex().upper(),
					'text': s.text,
					'length': s.length,
				}
				for s in strings
			]
		}

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(output, f, indent='\t', ensure_ascii=False)

	elif format == 'csv':
		with open(output_path, 'w', encoding='utf-8', newline='') as f:
			writer = csv.writer(f)
			writer.writerow(['Index', 'Pointer', 'Offset', 'Text', 'Length', 'Hex'])
			for s in strings:
				writer.writerow([
					s.index,
					f"0x{s.pointer_offset:06X}",
					f"0x{s.data_offset:06X}",
					s.text,
					s.length,
					s.raw_bytes.hex().upper(),
				])


def validate_strings(strings_path: str, max_length: int = 0, tbl_path: str = None) -> List[str]:
	"""Validate strings file"""
	errors = []

	with open(strings_path, 'r', encoding='utf-8') as f:
		data = json.load(f)

	strings = data.get('strings', [])

	for entry in strings:
		idx = entry.get('index', '?')
		text = entry.get('text', '')
		orig_length = entry.get('length', 0)

		# Check max length
		if max_length > 0 and len(text) > max_length:
			errors.append(f"String {idx}: Too long ({len(text)} > {max_length})")

		# Validate encoding if TBL provided
		if tbl_path:
			tbl = load_tbl(tbl_path)
			encoded = encode_string(text, tbl)
			if len(encoded) > orig_length:
				errors.append(f"String {idx}: Encoded size too large ({len(encoded)} > {orig_length})")

	return errors


def main():
	parser = argparse.ArgumentParser(
		description='String Table Manager',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract strings')
	extract_parser.add_argument('file', help='ROM file')
	extract_parser.add_argument('--tbl', '-t', required=True, help='TBL file')
	extract_parser.add_argument('--pointer-table', '-p', type=lambda x: int(x, 0), required=True, help='Pointer table offset')
	extract_parser.add_argument('--count', '-c', type=int, required=True, help='Number of strings')
	extract_parser.add_argument('--bank', '-b', type=int, default=-1, help='Bank number')
	extract_parser.add_argument('--output', '-o', required=True, help='Output file')
	extract_parser.add_argument('--format', '-f', default='json', choices=['json', 'csv'], help='Output format')

	# Import command
	import_parser = subparsers.add_parser('import', help='Import strings to ROM')
	import_parser.add_argument('file', help='ROM file')
	import_parser.add_argument('--strings', '-s', required=True, help='Strings JSON file')
	import_parser.add_argument('--tbl', '-t', required=True, help='TBL file')
	import_parser.add_argument('--output', '-o', required=True, help='Output ROM')

	# Validate command
	validate_parser = subparsers.add_parser('validate', help='Validate strings')
	validate_parser.add_argument('file', help='Strings JSON file')
	validate_parser.add_argument('--max-length', type=int, default=0, help='Max string length')
	validate_parser.add_argument('--tbl', '-t', help='TBL file for encoding validation')

	# Report command
	report_parser = subparsers.add_parser('report', help='Generate translation report')
	report_parser.add_argument('original', help='Original strings JSON')
	report_parser.add_argument('translated', help='Translated strings JSON')
	report_parser.add_argument('--output', '-o', help='Output HTML file')

	args = parser.parse_args()

	if args.command == 'extract':
		strings = extract_strings(
			args.file,
			args.tbl,
			args.pointer_table,
			args.count,
			args.bank,
		)

		export_strings(strings, args.output, args.format)
		print(f"Extracted {len(strings)} strings to: {args.output}")

	elif args.command == 'import':
		with open(args.file, 'rb') as f:
			rom_data = bytearray(f.read())

		with open(args.strings, 'r', encoding='utf-8') as f:
			strings_data = json.load(f)

		tbl = load_tbl(args.tbl)
		modified = 0

		for entry in strings_data.get('strings', []):
			text = entry.get('text', '')
			offset_str = entry.get('data_offset', '')
			orig_length = entry.get('length', 0)

			if not offset_str:
				continue

			offset = int(offset_str, 16)
			encoded = encode_string(text, tbl)

			# Check if it fits
			if len(encoded) <= orig_length:
				# Pad with end marker if shorter
				padded = encoded + bytes([tbl.end_markers[0]] * (orig_length - len(encoded)))
				rom_data[offset:offset + orig_length] = padded[:orig_length]
				modified += 1
			else:
				print(f"Warning: String at {offset_str} too long, skipping")

		with open(args.output, 'wb') as f:
			f.write(rom_data)

		print(f"Modified {modified} strings")
		print(f"Saved to: {args.output}")

	elif args.command == 'validate':
		errors = validate_strings(args.file, args.max_length, args.tbl)

		if errors:
			print(f"Found {len(errors)} issues:")
			for error in errors:
				print(f"  - {error}")
			sys.exit(1)
		else:
			print("Validation passed!")

	elif args.command == 'report':
		with open(args.original, 'r', encoding='utf-8') as f:
			original = json.load(f)
		with open(args.translated, 'r', encoding='utf-8') as f:
			translated = json.load(f)

		orig_strings = {s['index']: s for s in original.get('strings', [])}
		trans_strings = {s['index']: s for s in translated.get('strings', [])}

		# Generate report
		total = len(orig_strings)
		translated_count = sum(1 for idx in orig_strings if idx in trans_strings and orig_strings[idx]['text'] != trans_strings[idx]['text'])

		print(f"Translation Report")
		print(f"==================")
		print(f"Total strings: {total}")
		print(f"Translated: {translated_count} ({translated_count / total * 100:.1f}%)")
		print(f"Remaining: {total - translated_count}")

		if args.output:
			# Generate HTML report
			html = f"""<!DOCTYPE html>
<html>
<head><title>Translation Report</title></head>
<body>
<h1>Translation Report</h1>
<p>Progress: {translated_count}/{total} ({translated_count / total * 100:.1f}%)</p>
<table border="1">
<tr><th>Index</th><th>Original</th><th>Translated</th></tr>
"""
			for idx in sorted(orig_strings.keys()):
				orig = orig_strings[idx]['text']
				trans = trans_strings.get(idx, {}).get('text', orig)
				changed = '✓' if orig != trans else ''
				html += f"<tr><td>{idx}</td><td>{orig}</td><td>{trans} {changed}</td></tr>\n"

			html += "</table></body></html>"

			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				f.write(html)
			print(f"Report saved to: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
