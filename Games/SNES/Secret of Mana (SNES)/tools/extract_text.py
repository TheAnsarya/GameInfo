#!/usr/bin/env python3
"""
Secret of Mana Text Extractor
Extracts dialogue, item names, enemy names, and other text from the ROM.
"""

import os
import sys
import argparse
import struct
import json
from pathlib import Path

# Text encoding table (byte value -> character)
TEXT_TABLE = {
	# Uppercase A-Z
	0x80: 'A', 0x81: 'B', 0x82: 'C', 0x83: 'D', 0x84: 'E', 0x85: 'F',
	0x86: 'G', 0x87: 'H', 0x88: 'I', 0x89: 'J', 0x8a: 'K', 0x8b: 'L',
	0x8c: 'M', 0x8d: 'N', 0x8e: 'O', 0x8f: 'P', 0x90: 'Q', 0x91: 'R',
	0x92: 'S', 0x93: 'T', 0x94: 'U', 0x95: 'V', 0x96: 'W', 0x97: 'X',
	0x98: 'Y', 0x99: 'Z',
	
	# Lowercase a-z
	0x9a: 'a', 0x9b: 'b', 0x9c: 'c', 0x9d: 'd', 0x9e: 'e', 0x9f: 'f',
	0xa0: 'g', 0xa1: 'h', 0xa2: 'i', 0xa3: 'j', 0xa4: 'k', 0xa5: 'l',
	0xa6: 'm', 0xa7: 'n', 0xa8: 'o', 0xa9: 'p', 0xaa: 'q', 0xab: 'r',
	0xac: 's', 0xad: 't', 0xae: 'u', 0xaf: 'v', 0xb0: 'w', 0xb1: 'x',
	0xb2: 'y', 0xb3: 'z',
	
	# Numbers 0-9
	0xb4: '0', 0xb5: '1', 0xb6: '2', 0xb7: '3', 0xb8: '4',
	0xb9: '5', 0xba: '6', 0xbb: '7', 0xbc: '8', 0xbd: '9',
	
	# Punctuation
	0xbe: '!', 0xbf: '?', 0xc0: '.', 0xc1: ',', 0xc2: "'", 0xc3: '-',
	0xc4: ':', 0xc5: ';', 0xc6: '"', 0xc7: '/', 0xc8: '(', 0xc9: ')',
	
	# Space
	0xfe: ' ',
}

# Control codes
CONTROL_CODES = {
	0x00: '[END]',
	0x01: '[NEWLINE]',
	0x02: '[NEWBOX]',
	0x03: '[WAIT]',
	0x04: '[DELAY]',  # + 1 byte parameter
	0x05: '[CLEAR]',
	0x10: '[HERO]',
	0x11: '[GIRL]',
	0x12: '[SPRITE]',
	0x13: '[GOLD]',
	0x14: '[ITEM]',
	0x15: '[ENEMY]',
	0x16: '[NUMBER]',
	0x20: '[NORMAL]',
	0x21: '[FAST]',
	0x22: '[SLOW]',
	0x23: '[INSTANT]',
}

# Known text pointer tables (file offsets)
TEXT_TABLES = {
	"dialogue": {
		"pointer_offset": 0x100000,  # Placeholder - needs research
		"description": "Main dialogue text"
	},
	"item_names": {
		"pointer_offset": 0x0c8000,  # Placeholder
		"description": "Item names"
	},
	"enemy_names": {
		"pointer_offset": 0x0ca000,  # Placeholder  
		"description": "Enemy names"
	},
	"spell_names": {
		"pointer_offset": 0x0cc000,  # Placeholder
		"description": "Spell names"
	},
}


def decode_text(rom_data: bytes, offset: int, max_length: int = 256) -> tuple:
	"""
	Decode text starting at offset.
	Returns (decoded_string, bytes_consumed).
	"""
	result = []
	pos = 0
	
	while pos < max_length:
		if offset + pos >= len(rom_data):
			break
		
		byte = rom_data[offset + pos]
		
		# End of string
		if byte == 0x00 or byte == 0xff:
			pos += 1
			break
		
		# Control code
		if byte in CONTROL_CODES:
			result.append(CONTROL_CODES[byte])
			pos += 1
			# Handle multi-byte control codes
			if byte == 0x04:  # DELAY has parameter
				if offset + pos < len(rom_data):
					param = rom_data[offset + pos]
					result[-1] = f'[DELAY:{param}]'
					pos += 1
		# Regular character
		elif byte in TEXT_TABLE:
			result.append(TEXT_TABLE[byte])
			pos += 1
		else:
			result.append(f'[{byte:02x}]')
			pos += 1
	
	return ''.join(result), pos


def scan_for_text(rom_data: bytes, start: int, end: int, min_length: int = 4) -> list:
	"""
	Scan ROM region for valid text strings.
	Returns list of (offset, text) tuples.
	"""
	results = []
	offset = start
	
	while offset < end:
		text, length = decode_text(rom_data, offset, 256)
		
		# Filter for meaningful text
		alpha_count = sum(1 for c in text if c.isalpha())
		if alpha_count >= min_length and length >= min_length:
			# Check if it ends properly
			if '[END]' in text or '[NEWLINE]' in text:
				results.append({
					"offset": offset,
					"offset_hex": f"0x{offset:06x}",
					"text": text,
					"length": length
				})
				offset += length
				continue
		
		offset += 1
	
	return results


def read_pointer_table(rom_data: bytes, table_offset: int, count: int, 
					   bank_base: int = 0) -> list:
	"""
	Read a table of 16-bit pointers and return text at each address.
	"""
	results = []
	
	for i in range(count):
		ptr_offset = table_offset + i * 2
		if ptr_offset + 2 > len(rom_data):
			break
		
		ptr = struct.unpack_from("<H", rom_data, ptr_offset)[0]
		text_offset = bank_base + ptr
		
		if text_offset < len(rom_data):
			text, length = decode_text(rom_data, text_offset)
			results.append({
				"index": i,
				"pointer": f"0x{ptr:04x}",
				"file_offset": f"0x{text_offset:06x}",
				"text": text
			})
	
	return results


def extract_fixed_strings(rom_data: bytes, offset: int, count: int, 
						  string_length: int) -> list:
	"""
	Extract fixed-length strings (like item names).
	"""
	results = []
	
	for i in range(count):
		str_offset = offset + i * string_length
		if str_offset + string_length > len(rom_data):
			break
		
		text, _ = decode_text(rom_data, str_offset, string_length)
		text = text.replace('[END]', '').strip()
		
		results.append({
			"index": i,
			"offset": f"0x{str_offset:06x}",
			"text": text
		})
	
	return results


def export_text_table(output_path: str):
	"""Export the text encoding table for reference."""
	table_data = {
		"encoding": {f"0x{k:02x}": v for k, v in TEXT_TABLE.items()},
		"control_codes": {f"0x{k:02x}": v for k, v in CONTROL_CODES.items()}
	}
	
	with open(output_path, "w") as f:
		json.dump(table_data, f, indent="\t")


def generate_tbl_file(output_path: str):
	"""Generate .tbl file for use with hex editors."""
	with open(output_path, "w") as f:
		# Standard characters
		for byte, char in sorted(TEXT_TABLE.items()):
			if char == '\\':
				f.write(f"{byte:02X}=\\\n")
			else:
				f.write(f"{byte:02X}={char}\n")
		
		# Control codes as special markers
		f.write("\n# Control codes\n")
		for byte, name in sorted(CONTROL_CODES.items()):
			f.write(f"{byte:02X}={name}\n")


def main():
	parser = argparse.ArgumentParser(description="Secret of Mana Text Extractor")
	parser.add_argument("--rom", required=True, help="Path to ROM file")
	parser.add_argument("--output", required=True, help="Output directory")
	parser.add_argument("--scan", action="store_true", help="Scan for text strings")
	parser.add_argument("--scan-start", type=lambda x: int(x, 0), default=0x080000)
	parser.add_argument("--scan-end", type=lambda x: int(x, 0), default=0x180000)
	parser.add_argument("--export-table", action="store_true", help="Export encoding table")
	
	args = parser.parse_args()
	
	# Read ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"Loaded ROM: {len(rom_data)} bytes")
	
	# Create output directory
	output_path = Path(args.output)
	output_path.mkdir(parents=True, exist_ok=True)
	
	if args.export_table:
		# Export text table
		print("\nExporting text encoding table...")
		table_file = output_path / "text_table.json"
		export_text_table(str(table_file))
		print(f"  Saved: {table_file}")
		
		tbl_file = output_path / "secret_of_mana.tbl"
		generate_tbl_file(str(tbl_file))
		print(f"  Saved: {tbl_file}")
	
	if args.scan:
		# Scan for text strings
		print(f"\nScanning for text from 0x{args.scan_start:06x} to 0x{args.scan_end:06x}...")
		strings = scan_for_text(rom_data, args.scan_start, args.scan_end)
		print(f"Found {len(strings)} strings")
		
		# Save results
		out_file = output_path / "scanned_text.json"
		with open(out_file, "w") as f:
			json.dump(strings, f, indent="\t", ensure_ascii=False)
		print(f"  Saved: {out_file}")
		
		# Show sample
		print("\nSample strings found:")
		for s in strings[:10]:
			print(f"  {s['offset_hex']}: {s['text'][:60]}...")
	
	if not args.scan and not args.export_table:
		# Default: export known tables
		print("\nExtracting known text tables...")
		
		# Export text table first
		table_file = output_path / "text_table.json"
		export_text_table(str(table_file))
		print(f"  Text table: {table_file}")
		
		# Also do a quick scan
		print("\n  Scanning for dialogue text...")
		strings = scan_for_text(rom_data, 0x100000, 0x180000, min_length=6)
		if strings:
			out_file = output_path / "dialogue_scan.json"
			with open(out_file, "w") as f:
				json.dump(strings[:500], f, indent="\t", ensure_ascii=False)
			print(f"    Found {len(strings)} strings, saved first 500 to: {out_file}")
	
	print("\nDone!")


if __name__ == "__main__":
	main()
