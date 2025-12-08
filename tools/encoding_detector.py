#!/usr/bin/env python3
"""
Text Encoding Detector - Automatically detect and decode game text encodings.

Analyzes ROM data to detect character encodings, control codes, and text
tables, then generates TBL files for translation projects.

Usage:
	python encoding_detector.py <rom_file> --output encoding.tbl
	python encoding_detector.py <rom_file> --known-text "DRAGON WARRIOR"

Features:
	- Detect standard encodings (ASCII, SJIS, etc.)
	- Identify custom game encodings
	- Find control codes
	- Generate TBL files
	- Validate text tables
"""

import argparse
import json
import os
import re
import struct
import sys
from collections import Counter
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class EncodingType(Enum):
	"""Text encoding types."""
	ASCII = auto()
	ASCII_UPPER = auto()
	ASCII_LOWER = auto()
	SJIS = auto()
	EUC_JP = auto()
	CUSTOM = auto()
	DTE = auto()  # Dual Tile Encoding
	MTE = auto()  # Multiple Tile Encoding
	HUFFMAN = auto()
	UNKNOWN = auto()


@dataclass
class CharMapping:
	"""Single character mapping."""
	byte_value: int
	char: str
	frequency: int = 0
	confirmed: bool = False
	notes: str = ""
	
	def to_tbl_line(self) -> str:
		"""Convert to TBL file format."""
		if len(self.char) == 0:
			return ""
		
		# Handle special characters
		if self.char == "\n":
			return f"{self.byte_value:02X}=<LINE>"
		elif self.char == " ":
			return f"{self.byte_value:02X}= "
		elif ord(self.char[0]) < 32:
			return f"{self.byte_value:02X}=<CTRL{ord(self.char[0]):02X}>"
		else:
			return f"{self.byte_value:02X}={self.char}"


@dataclass
class ControlCode:
	"""Control code definition."""
	byte_sequence: bytes
	name: str
	description: str = ""
	param_count: int = 0
	
	def to_tbl_line(self) -> str:
		"""Convert to TBL file format."""
		hex_str = "".join(f"{b:02X}" for b in self.byte_sequence)
		if self.param_count > 0:
			return f"/{hex_str}=<{self.name}>"
		return f"{hex_str}=<{self.name}>"


@dataclass
class TextTable:
	"""Complete text encoding table."""
	name: str = ""
	encoding_type: EncodingType = EncodingType.CUSTOM
	mappings: Dict[int, CharMapping] = field(default_factory=dict)
	control_codes: List[ControlCode] = field(default_factory=list)
	dte_entries: Dict[int, str] = field(default_factory=dict)
	notes: List[str] = field(default_factory=list)
	
	def to_tbl(self) -> str:
		"""Generate TBL file content."""
		lines = []
		
		# Header comments
		lines.append(f"; Text Table: {self.name}")
		lines.append(f"; Encoding Type: {self.encoding_type.name}")
		if self.notes:
			for note in self.notes:
				lines.append(f"; {note}")
		lines.append("")
		
		# Control codes first
		if self.control_codes:
			lines.append("; Control Codes")
			for code in self.control_codes:
				line = code.to_tbl_line()
				if code.description:
					line += f"  ; {code.description}"
				lines.append(line)
			lines.append("")
		
		# DTE entries
		if self.dte_entries:
			lines.append("; DTE (Dual Tile Encoding)")
			for byte_val, text in sorted(self.dte_entries.items()):
				lines.append(f"{byte_val:02X}={text}")
			lines.append("")
		
		# Regular character mappings
		lines.append("; Character Mappings")
		
		# Group by character type
		letters = []
		numbers = []
		punctuation = []
		other = []
		
		for byte_val, mapping in sorted(self.mappings.items()):
			if mapping.char:
				if mapping.char.isalpha():
					letters.append(mapping)
				elif mapping.char.isdigit():
					numbers.append(mapping)
				elif mapping.char in ".,!?'-:;\"()":
					punctuation.append(mapping)
				else:
					other.append(mapping)
		
		for category_name, category in [
			("Letters", letters),
			("Numbers", numbers),
			("Punctuation", punctuation),
			("Other", other)
		]:
			if category:
				lines.append(f"; {category_name}")
				for mapping in category:
					line = mapping.to_tbl_line()
					if mapping.notes:
						line += f"  ; {mapping.notes}"
					lines.append(line)
		
		return "\n".join(lines)
	
	def save(self, filepath: str) -> None:
		"""Save as TBL file."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write(self.to_tbl())
	
	def load(self, filepath: str) -> None:
		"""Load from TBL file."""
		with open(filepath, "r", encoding="utf-8") as f:
			content = f.read()
		
		self.mappings.clear()
		self.control_codes.clear()
		self.dte_entries.clear()
		
		for line in content.split("\n"):
			line = line.strip()
			
			# Skip comments and empty lines
			if not line or line.startswith(";"):
				continue
			
			# Parse mapping
			if "=" in line:
				# Remove inline comments
				if ";" in line:
					line = line.split(";")[0].strip()
				
				hex_part, char_part = line.split("=", 1)
				
				# Handle control codes (start with /)
				if hex_part.startswith("/"):
					hex_part = hex_part[1:]
					# This is a parameterized control code
				
				try:
					byte_val = int(hex_part, 16)
					
					# Handle special characters
					if char_part.startswith("<") and char_part.endswith(">"):
						name = char_part[1:-1]
						self.control_codes.append(ControlCode(
							byte_sequence=bytes([byte_val]),
							name=name
						))
					elif len(char_part) > 1 and byte_val >= 0x80:
						# Likely DTE
						self.dte_entries[byte_val] = char_part
					else:
						self.mappings[byte_val] = CharMapping(
							byte_value=byte_val,
							char=char_part,
							confirmed=True
						)
				except ValueError:
					pass


class EncodingDetector:
	"""Detect and analyze text encodings in ROM data."""
	
	# Common control codes
	COMMON_CONTROLS = {
		0x00: ("END", "End of string"),
		0x01: ("NEWLINE", "New line"),
		0x02: ("WAIT", "Wait for input"),
		0x03: ("CLEAR", "Clear text box"),
		0x04: ("PAUSE", "Short pause"),
		0x05: ("NAME", "Player name"),
	}
	
	# Standard character positions
	ASCII_OFFSET_UPPER = ord('A')
	ASCII_OFFSET_LOWER = ord('a')
	ASCII_OFFSET_DIGIT = ord('0')
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.byte_frequency = Counter(rom_data)
		self.detected_table = TextTable()
		
		# Analysis results
		self.likely_text_regions: List[Tuple[int, int]] = []
		self.control_candidates: List[int] = []
		self.space_candidates: List[int] = []
	
	def detect(self) -> TextTable:
		"""Run full detection process."""
		# Analyze byte frequency
		self._analyze_frequency()
		
		# Find potential text regions
		self._find_text_regions()
		
		# Detect encoding type
		self._detect_encoding_type()
		
		# Build character mappings
		self._build_mappings()
		
		# Detect control codes
		self._detect_control_codes()
		
		return self.detected_table
	
	def detect_with_known_text(self, known_text: str, 
							   search_range: Tuple[int, int] = None) -> TextTable:
		"""Detect encoding using known text as reference."""
		if search_range:
			search_data = self.rom_data[search_range[0]:search_range[1]]
			search_offset = search_range[0]
		else:
			search_data = self.rom_data
			search_offset = 0
		
		# Try to find the known text with various offsets
		known_upper = known_text.upper()
		known_lower = known_text.lower()
		
		# Calculate expected pattern
		for base_offset in range(256):
			# Try uppercase A at this offset
			expected_bytes = bytes(
				(base_offset + ord(c) - ord('A')) & 0xFF 
				if c.isupper() 
				else ((base_offset + ord(c) - ord('a')) & 0xFF if c.islower()
					  else ((base_offset + ord(c) - ord('0') + 26) & 0xFF if c.isdigit()
							else 0xFF))
				for c in known_upper
			)
			
			# Search for this pattern
			idx = 0
			while True:
				idx = search_data.find(expected_bytes, idx)
				if idx == -1:
					break
				
				# Found potential match
				print(f"Potential match at offset 0x{search_offset + idx:06X} with base 0x{base_offset:02X}")
				
				# Build table from this
				for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
					byte_val = (base_offset + i) & 0xFF
					self.detected_table.mappings[byte_val] = CharMapping(
						byte_value=byte_val,
						char=c,
						confirmed=True,
						notes="detected from known text"
					)
				
				for i, c in enumerate("abcdefghijklmnopqrstuvwxyz"):
					byte_val = (base_offset + i) & 0xFF
					if byte_val not in self.detected_table.mappings:
						self.detected_table.mappings[byte_val] = CharMapping(
							byte_value=byte_val,
							char=c,
							notes="inferred (lowercase)"
						)
				
				for i, c in enumerate("0123456789"):
					byte_val = (base_offset + 26 + i) & 0xFF
					self.detected_table.mappings[byte_val] = CharMapping(
						byte_value=byte_val,
						char=c,
						notes="inferred (digits)"
					)
				
				idx += 1
		
		# Also detect control codes and space
		self._detect_control_codes()
		
		return self.detected_table
	
	def _analyze_frequency(self) -> None:
		"""Analyze byte frequency distribution."""
		total = len(self.rom_data)
		
		# Find most common bytes (likely space or common letters)
		most_common = self.byte_frequency.most_common(50)
		
		# Space is usually one of the most common
		for byte_val, count in most_common[:10]:
			freq = count / total
			if 0.05 < freq < 0.20:  # Space is typically 5-20% of text
				self.space_candidates.append(byte_val)
		
		# Bytes with very low frequency might be control codes
		for byte_val in range(256):
			count = self.byte_frequency.get(byte_val, 0)
			freq = count / total
			if freq < 0.001 and count > 0:
				self.control_candidates.append(byte_val)
	
	def _find_text_regions(self) -> None:
		"""Find regions that look like text."""
		# Text regions typically have:
		# - High frequency of certain byte ranges
		# - Regular spacing (space characters)
		# - Occasional control codes (00, 01, etc.)
		
		window_size = 256
		threshold = 0.6  # 60% of bytes in a "text-like" range
		
		for i in range(0, len(self.rom_data) - window_size, window_size // 2):
			window = self.rom_data[i:i + window_size]
			
			# Count bytes that could be text
			text_like = sum(
				1 for b in window 
				if 0x20 <= b <= 0x7E or b in (0x00, 0x01, 0x0A, 0x0D)
			)
			
			if text_like / window_size >= threshold:
				# Merge with previous region if adjacent
				if self.likely_text_regions and self.likely_text_regions[-1][1] >= i:
					self.likely_text_regions[-1] = (
						self.likely_text_regions[-1][0],
						i + window_size
					)
				else:
					self.likely_text_regions.append((i, i + window_size))
	
	def _detect_encoding_type(self) -> None:
		"""Detect the type of encoding used."""
		# Check for standard ASCII
		ascii_count = sum(
			self.byte_frequency.get(b, 0) 
			for b in range(0x20, 0x7F)
		)
		total = len(self.rom_data)
		
		if ascii_count / total > 0.3:
			self.detected_table.encoding_type = EncodingType.ASCII
			return
		
		# Check for Shift-JIS patterns
		sjis_count = 0
		for i in range(len(self.rom_data) - 1):
			b1 = self.rom_data[i]
			b2 = self.rom_data[i + 1]
			
			# SJIS first byte ranges
			if (0x81 <= b1 <= 0x9F or 0xE0 <= b1 <= 0xEF):
				# SJIS second byte ranges
				if (0x40 <= b2 <= 0x7E or 0x80 <= b2 <= 0xFC):
					sjis_count += 1
		
		if sjis_count / total > 0.1:
			self.detected_table.encoding_type = EncodingType.SJIS
			return
		
		# Check for custom encoding patterns
		# Look for sequential byte usage suggesting custom alphabet
		sequential_ranges = self._find_sequential_ranges()
		
		if len(sequential_ranges) >= 1 and any(r[1] - r[0] >= 26 for r in sequential_ranges):
			self.detected_table.encoding_type = EncodingType.CUSTOM
			return
		
		self.detected_table.encoding_type = EncodingType.UNKNOWN
	
	def _find_sequential_ranges(self) -> List[Tuple[int, int]]:
		"""Find ranges of sequential bytes that are frequently used."""
		ranges = []
		in_range = False
		range_start = 0
		
		# Get bytes sorted by frequency
		sorted_bytes = sorted(
			range(256),
			key=lambda b: self.byte_frequency.get(b, 0),
			reverse=True
		)[:128]  # Top 128 bytes
		
		byte_set = set(sorted_bytes)
		
		for b in range(256):
			if b in byte_set:
				if not in_range:
					in_range = True
					range_start = b
			else:
				if in_range:
					in_range = False
					if b - range_start >= 5:  # Minimum range of 5
						ranges.append((range_start, b))
		
		if in_range and 256 - range_start >= 5:
			ranges.append((range_start, 256))
		
		return ranges
	
	def _build_mappings(self) -> None:
		"""Build character mappings based on detected encoding."""
		if self.detected_table.encoding_type == EncodingType.ASCII:
			# Standard ASCII mapping
			for b in range(0x20, 0x7F):
				self.detected_table.mappings[b] = CharMapping(
					byte_value=b,
					char=chr(b),
					frequency=self.byte_frequency.get(b, 0),
					confirmed=True
				)
		
		elif self.detected_table.encoding_type == EncodingType.CUSTOM:
			# Try to detect custom mapping
			self._detect_custom_mapping()
	
	def _detect_custom_mapping(self) -> None:
		"""Attempt to detect custom character mapping."""
		# Use frequency analysis
		# E, T, A, O, I, N are most common in English
		
		english_freq = "ETAOINSHRDLCUMWFGYPBVKJXQZ"
		
		# Get most frequent bytes in likely text regions
		text_bytes = bytearray()
		for start, end in self.likely_text_regions:
			text_bytes.extend(self.rom_data[start:end])
		
		if not text_bytes:
			return
		
		byte_freq = Counter(text_bytes)
		
		# Remove likely control codes (very low or very high values)
		candidates = [
			(b, c) for b, c in byte_freq.most_common()
			if 0x10 <= b <= 0xF0 and c > 10
		]
		
		# Space is usually most common - skip it
		if candidates:
			space_byte = candidates[0][0]
			self.detected_table.mappings[space_byte] = CharMapping(
				byte_value=space_byte,
				char=" ",
				frequency=candidates[0][1],
				notes="detected as space (most frequent)"
			)
			candidates = candidates[1:]
		
		# Map remaining to letters by frequency
		for i, (byte_val, freq) in enumerate(candidates[:26]):
			if i < len(english_freq):
				self.detected_table.mappings[byte_val] = CharMapping(
					byte_value=byte_val,
					char=english_freq[i],
					frequency=freq,
					notes="frequency analysis (unconfirmed)"
				)
	
	def _detect_control_codes(self) -> None:
		"""Detect control codes."""
		# Common control codes
		for byte_val, (name, desc) in self.COMMON_CONTROLS.items():
			freq = self.byte_frequency.get(byte_val, 0)
			if freq > 0:
				self.detected_table.control_codes.append(ControlCode(
					byte_sequence=bytes([byte_val]),
					name=name,
					description=desc
				))
		
		# Look for string terminators
		# Usually 0x00 or 0xFF appearing after text-like sequences
		for terminator in [0x00, 0xFF]:
			count = 0
			for i in range(len(self.rom_data) - 1):
				# Text-like byte followed by terminator
				if (0x20 <= self.rom_data[i] <= 0x7E or 
					self.rom_data[i] in self.detected_table.mappings):
					if self.rom_data[i + 1] == terminator:
						count += 1
			
			if count > 50:  # Significant number of occurrences
				existing = [c for c in self.detected_table.control_codes 
							if c.byte_sequence == bytes([terminator])]
				if not existing:
					self.detected_table.control_codes.append(ControlCode(
						byte_sequence=bytes([terminator]),
						name="END",
						description=f"String terminator (found {count} occurrences)"
					))
	
	def validate_table(self, table: TextTable, 
					   sample_offsets: List[int]) -> Dict[str, Any]:
		"""Validate a text table against sample data."""
		results = {
			"valid_samples": 0,
			"invalid_samples": 0,
			"decoded_samples": [],
			"issues": []
		}
		
		for offset in sample_offsets:
			try:
				decoded = self._decode_string(offset, table)
				
				# Check if decoded text looks valid
				if decoded and all(c.isprintable() or c in "\n " for c in decoded):
					results["valid_samples"] += 1
					results["decoded_samples"].append({
						"offset": f"0x{offset:06X}",
						"text": decoded[:100]
					})
				else:
					results["invalid_samples"] += 1
					results["issues"].append(f"Non-printable output at 0x{offset:06X}")
					
			except Exception as e:
				results["invalid_samples"] += 1
				results["issues"].append(f"Error at 0x{offset:06X}: {e}")
		
		return results
	
	def _decode_string(self, offset: int, table: TextTable, 
					   max_length: int = 256) -> str:
		"""Decode a string using the text table."""
		result = []
		i = offset
		
		while i < len(self.rom_data) and len(result) < max_length:
			byte_val = self.rom_data[i]
			
			# Check for control code
			is_control = False
			for code in table.control_codes:
				if len(code.byte_sequence) == 1 and code.byte_sequence[0] == byte_val:
					if code.name == "END":
						return "".join(result)
					elif code.name == "NEWLINE":
						result.append("\n")
					is_control = True
					break
			
			if not is_control:
				# Check for DTE
				if byte_val in table.dte_entries:
					result.append(table.dte_entries[byte_val])
				# Check for regular mapping
				elif byte_val in table.mappings:
					result.append(table.mappings[byte_val].char)
				else:
					result.append(f"[{byte_val:02X}]")
			
			i += 1
		
		return "".join(result)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Text Encoding Detector")
	parser.add_argument("rom", help="ROM file to analyze")
	parser.add_argument("--output", "-o", help="Output TBL file")
	parser.add_argument("--known-text", "-k", help="Known text string to search for")
	parser.add_argument("--validate", "-v", help="Existing TBL file to validate")
	parser.add_argument("--sample-offsets", "-s", help="Comma-separated hex offsets to test")
	parser.add_argument("--verbose", action="store_true", help="Verbose output")
	
	args = parser.parse_args()
	
	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)
	
	# Load ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"Analyzing: {args.rom}")
	print(f"ROM size: {len(rom_data):,} bytes")
	print()
	
	detector = EncodingDetector(rom_data)
	
	if args.known_text:
		print(f"Searching for known text: {args.known_text}")
		table = detector.detect_with_known_text(args.known_text)
	else:
		table = detector.detect()
	
	# Show results
	print(f"Detected encoding type: {table.encoding_type.name}")
	print(f"Character mappings found: {len(table.mappings)}")
	print(f"Control codes found: {len(table.control_codes)}")
	print()
	
	if args.verbose:
		print("Sample mappings:")
		for byte_val, mapping in list(table.mappings.items())[:20]:
			print(f"  0x{byte_val:02X} -> '{mapping.char}'")
		
		print("\nControl codes:")
		for code in table.control_codes:
			hex_str = " ".join(f"{b:02X}" for b in code.byte_sequence)
			print(f"  {hex_str} -> <{code.name}> ({code.description})")
	
	# Validate if requested
	if args.validate:
		if os.path.exists(args.validate):
			validate_table = TextTable()
			validate_table.load(args.validate)
			
			offsets = []
			if args.sample_offsets:
				offsets = [int(x, 16) for x in args.sample_offsets.split(",")]
			else:
				# Use detected text regions
				for start, end in detector.likely_text_regions[:10]:
					offsets.append(start)
			
			print(f"\nValidating {args.validate} at {len(offsets)} offsets...")
			results = detector.validate_table(validate_table, offsets)
			
			print(f"Valid samples: {results['valid_samples']}")
			print(f"Invalid samples: {results['invalid_samples']}")
			
			if results["decoded_samples"]:
				print("\nSample decoded text:")
				for sample in results["decoded_samples"][:5]:
					print(f"  {sample['offset']}: {sample['text'][:50]}...")
	
	# Save output
	if args.output:
		table.name = Path(args.rom).stem
		table.save(args.output)
		print(f"\nSaved TBL file: {args.output}")


if __name__ == "__main__":
	main()
