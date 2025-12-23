#!/usr/bin/env python3
"""
Soul Blazer - Text Encoder/Decoder
Encodes and decodes text using Soul Blazer's character encoding.
"""

import argparse
import json
import os
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple
from enum import IntEnum


class TextControlCode(IntEnum):
	"""Special text control codes."""
	END = 0x00          # End of string
	NEWLINE = 0x01      # Line break
	WAIT = 0x02         # Wait for input
	PAUSE = 0x03        # Brief pause
	CLEAR = 0x04        # Clear text box
	HERO_NAME = 0x05    # Insert hero name
	ITEM_NAME = 0x06    # Insert item name
	NUMBER = 0x07       # Insert number
	CHOICE = 0x08       # Show choice prompt
	SET_COLOR = 0x09    # Change text color
	SET_SPEED = 0x0A    # Change text speed
	SOUND = 0x0B        # Play sound effect


@dataclass
class TextEntry:
	"""A single text entry from the ROM."""
	address: int
	raw_bytes: bytes
	decoded_text: str
	pointer_address: Optional[int] = None
	context: str = ""


class SoulBlazerText:
	"""Soul Blazer text encoding/decoding."""

	# Character encoding table (ROM byte -> character)
	CHAR_TABLE: Dict[int, str] = {
		# Control codes (0x00-0x0F)
		0x00: "[END]",
		0x01: "[LF]",
		0x02: "[WAIT]",
		0x03: "[PAUSE]",
		0x04: "[CLEAR]",
		0x05: "[HERO]",
		0x06: "[ITEM]",
		0x07: "[NUM]",
		0x08: "[CHOICE]",
		0x09: "[COLOR:",
		0x0A: "[SPEED:",
		0x0B: "[SFX:",

		# Uppercase letters (0x10-0x29)
		0x10: "A", 0x11: "B", 0x12: "C", 0x13: "D",
		0x14: "E", 0x15: "F", 0x16: "G", 0x17: "H",
		0x18: "I", 0x19: "J", 0x1A: "K", 0x1B: "L",
		0x1C: "M", 0x1D: "N", 0x1E: "O", 0x1F: "P",
		0x20: "Q", 0x21: "R", 0x22: "S", 0x23: "T",
		0x24: "U", 0x25: "V", 0x26: "W", 0x27: "X",
		0x28: "Y", 0x29: "Z",

		# Lowercase letters (0x30-0x49)
		0x30: "a", 0x31: "b", 0x32: "c", 0x33: "d",
		0x34: "e", 0x35: "f", 0x36: "g", 0x37: "h",
		0x38: "i", 0x39: "j", 0x3A: "k", 0x3B: "l",
		0x3C: "m", 0x3D: "n", 0x3E: "o", 0x3F: "p",
		0x40: "q", 0x41: "r", 0x42: "s", 0x43: "t",
		0x44: "u", 0x45: "v", 0x46: "w", 0x47: "x",
		0x48: "y", 0x49: "z",

		# Numbers (0x50-0x59)
		0x50: "0", 0x51: "1", 0x52: "2", 0x53: "3",
		0x54: "4", 0x55: "5", 0x56: "6", 0x57: "7",
		0x58: "8", 0x59: "9",

		# Punctuation and symbols (0x60-0x7F)
		0x60: " ",      # Space
		0x61: ".",      # Period
		0x62: ",",      # Comma
		0x63: "!",      # Exclamation
		0x64: "?",      # Question
		0x65: "'",      # Apostrophe
		0x66: '"',      # Quote
		0x67: "-",      # Dash
		0x68: ":",      # Colon
		0x69: ";",      # Semicolon
		0x6A: "(",      # Left paren
		0x6B: ")",      # Right paren
		0x6C: "/",      # Slash
		0x6D: "&",      # Ampersand
		0x6E: "%",      # Percent
		0x6F: "#",      # Hash
		0x70: "*",      # Asterisk
		0x71: "+",      # Plus
		0x72: "=",      # Equals
		0x73: "...",    # Ellipsis
		0x74: "~",      # Tilde
		0x75: "_",      # Underscore
		0x76: "<",      # Less than
		0x77: ">",      # Greater than
		0x78: "[",      # Left bracket
		0x79: "]",      # Right bracket
		0x7A: "♥",      # Heart
		0x7B: "★",      # Star
		0x7C: "→",      # Right arrow
		0x7D: "←",      # Left arrow
		0x7E: "↑",      # Up arrow
		0x7F: "↓",      # Down arrow

		# Special characters (0x80-0x9F)
		0x80: "©",      # Copyright
		0x81: "®",      # Registered
		0x82: "™",      # Trademark
		0x83: "°",      # Degree
		0x84: "×",      # Multiply
		0x85: "÷",      # Divide
	}

	# Reverse mapping (character -> ROM byte)
	REVERSE_TABLE: Dict[str, int] = {}

	# Text pointer tables
	POINTER_TABLES = [
		{"name": "Dialogue", "address": 0x058000, "count": 256, "bank": 0x0B},
		{"name": "Items", "address": 0x020000, "count": 64, "bank": 0x04},
		{"name": "Enemies", "address": 0x028000, "count": 128, "bank": 0x05},
		{"name": "Areas", "address": 0x048000, "count": 32, "bank": 0x09},
		{"name": "Menu", "address": 0x010000, "count": 128, "bank": 0x02},
	]

	def __init__(self):
		"""Initialize text handler."""
		# Build reverse lookup table
		for byte_val, char in self.CHAR_TABLE.items():
			if not char.startswith("["):
				self.REVERSE_TABLE[char] = byte_val

		self.rom_data: Optional[bytes] = None
		self.entries: List[TextEntry] = []

	def load_rom(self, rom_path: str) -> bool:
		"""Load ROM file."""
		if not os.path.exists(rom_path):
			print(f"Error: File not found: {rom_path}")
			return False

		with open(rom_path, "rb") as f:
			self.rom_data = f.read()

		# Handle copier header
		if len(self.rom_data) % 1024 == 512:
			self.rom_data = self.rom_data[512:]

		print(f"Loaded: {rom_path}")
		print(f"ROM size: {len(self.rom_data):,} bytes")
		return True

	def decode_byte(self, byte_val: int) -> str:
		"""Decode a single byte to text."""
		if byte_val in self.CHAR_TABLE:
			return self.CHAR_TABLE[byte_val]
		return f"[{byte_val:02X}]"

	def decode_string(self, data: bytes, max_length: int = 1000) -> Tuple[str, int]:
		"""
		Decode a byte string to text.

		Args:
			data: Raw bytes to decode
			max_length: Maximum length to decode

		Returns:
			(decoded_text, bytes_consumed)
		"""
		result = []
		i = 0

		while i < len(data) and i < max_length:
			byte_val = data[i]

			# End of string
			if byte_val == 0x00:
				result.append("[END]")
				i += 1
				break

			# Control codes with parameters
			if byte_val == 0x09:  # Color
				if i + 1 < len(data):
					param = data[i + 1]
					result.append(f"[COLOR:{param:02X}]")
					i += 2
					continue
			elif byte_val == 0x0A:  # Speed
				if i + 1 < len(data):
					param = data[i + 1]
					result.append(f"[SPEED:{param:02X}]")
					i += 2
					continue
			elif byte_val == 0x0B:  # Sound
				if i + 1 < len(data):
					param = data[i + 1]
					result.append(f"[SFX:{param:02X}]")
					i += 2
					continue

			# Normal character
			result.append(self.decode_byte(byte_val))
			i += 1

		return "".join(result), i

	def encode_string(self, text: str) -> bytes:
		"""
		Encode a text string to ROM bytes.

		Args:
			text: Text to encode

		Returns:
			Encoded bytes
		"""
		result = []
		i = 0

		while i < len(text):
			# Check for control codes in brackets
			if text[i] == "[":
				# Find closing bracket
				end = text.find("]", i)
				if end == -1:
					# No closing bracket, encode as-is
					if text[i] in self.REVERSE_TABLE:
						result.append(self.REVERSE_TABLE[text[i]])
					i += 1
					continue

				code = text[i + 1:end].upper()

				# Handle control codes
				if code == "END":
					result.append(0x00)
				elif code == "LF":
					result.append(0x01)
				elif code == "WAIT":
					result.append(0x02)
				elif code == "PAUSE":
					result.append(0x03)
				elif code == "CLEAR":
					result.append(0x04)
				elif code == "HERO":
					result.append(0x05)
				elif code == "ITEM":
					result.append(0x06)
				elif code == "NUM":
					result.append(0x07)
				elif code == "CHOICE":
					result.append(0x08)
				elif code.startswith("COLOR:"):
					result.append(0x09)
					try:
						param = int(code[6:], 16)
						result.append(param)
					except ValueError:
						result.append(0x00)
				elif code.startswith("SPEED:"):
					result.append(0x0A)
					try:
						param = int(code[6:], 16)
						result.append(param)
					except ValueError:
						result.append(0x00)
				elif code.startswith("SFX:"):
					result.append(0x0B)
					try:
						param = int(code[4:], 16)
						result.append(param)
					except ValueError:
						result.append(0x00)
				else:
					# Try to parse as hex byte
					try:
						byte_val = int(code, 16)
						result.append(byte_val)
					except ValueError:
						pass

				i = end + 1
				continue

			# Check for multi-char sequences
			if text[i:i + 3] == "...":
				result.append(0x73)
				i += 3
				continue

			# Normal character lookup
			char = text[i]
			if char in self.REVERSE_TABLE:
				result.append(self.REVERSE_TABLE[char])
			else:
				# Unknown character - encode as space
				result.append(0x60)

			i += 1

		return bytes(result)

	def read_pointer(self, address: int, bank: int = 0) -> int:
		"""
		Read a 16-bit pointer from ROM.

		Args:
			address: ROM address
			bank: Bank number for full address

		Returns:
			Full address
		"""
		if not self.rom_data or address + 2 > len(self.rom_data):
			return 0

		low = self.rom_data[address]
		high = self.rom_data[address + 1]
		pointer = (high << 8) | low

		# Convert to file address using LoROM mapping
		file_addr = (bank * 0x8000) + (pointer & 0x7FFF)
		return file_addr

	def extract_text_at(self, address: int, max_length: int = 500) -> Optional[TextEntry]:
		"""
		Extract text at a specific address.

		Args:
			address: ROM address
			max_length: Maximum string length

		Returns:
			TextEntry or None
		"""
		if not self.rom_data or address >= len(self.rom_data):
			return None

		data = self.rom_data[address:address + max_length]
		decoded, length = self.decode_string(data)

		return TextEntry(
			address=address,
			raw_bytes=data[:length],
			decoded_text=decoded
		)

	def extract_pointer_table(self, table_addr: int, count: int, bank: int) -> List[TextEntry]:
		"""
		Extract text from a pointer table.

		Args:
			table_addr: Address of pointer table
			count: Number of entries
			bank: Bank for pointers

		Returns:
			List of TextEntry objects
		"""
		entries = []

		for i in range(count):
			pointer_addr = table_addr + (i * 2)
			text_addr = self.read_pointer(pointer_addr, bank)

			if text_addr > 0 and text_addr < len(self.rom_data):
				entry = self.extract_text_at(text_addr)
				if entry:
					entry.pointer_address = pointer_addr
					entry.context = f"Entry {i}"
					entries.append(entry)

		return entries

	def extract_all_text(self) -> Dict[str, List[TextEntry]]:
		"""
		Extract all text from known tables.

		Returns:
			Dictionary of table name -> entries
		"""
		all_text = {}

		for table in self.POINTER_TABLES:
			print(f"Extracting {table['name']}...")
			entries = self.extract_pointer_table(
				table["address"],
				table["count"],
				table["bank"]
			)
			all_text[table["name"]] = entries
			print(f"  Found {len(entries)} entries")

		return all_text

	def export_to_json(self, filepath: str, text_data: Dict[str, List[TextEntry]]):
		"""Export text to JSON file."""
		data = {}

		for table_name, entries in text_data.items():
			data[table_name] = []
			for entry in entries:
				data[table_name].append({
					"address": f"0x{entry.address:06X}",
					"pointer": f"0x{entry.pointer_address:06X}" if entry.pointer_address else None,
					"text": entry.decoded_text,
					"raw_hex": entry.raw_bytes.hex(),
					"context": entry.context,
				})

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)

		print(f"Exported to: {filepath}")

	def export_to_text(self, filepath: str, text_data: Dict[str, List[TextEntry]]):
		"""Export text to readable text file."""
		with open(filepath, "w", encoding="utf-8") as f:
			for table_name, entries in text_data.items():
				f.write(f"{'=' * 60}\n")
				f.write(f"{table_name}\n")
				f.write(f"{'=' * 60}\n\n")

				for entry in entries:
					f.write(f"[0x{entry.address:06X}] {entry.context}\n")
					# Clean up for display
					display_text = entry.decoded_text.replace("[LF]", "\n")
					display_text = display_text.replace("[END]", "")
					f.write(f"{display_text}\n\n")

		print(f"Exported to: {filepath}")

	def import_from_json(self, filepath: str) -> Dict[str, List[Dict]]:
		"""Import text from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		return data

	def print_encoding_table(self):
		"""Print the character encoding table."""
		print("\nSoul Blazer Character Encoding Table")
		print("=" * 60)
		print("\nControl Codes (0x00-0x0F):")
		for i in range(0x10):
			if i in self.CHAR_TABLE:
				print(f"  0x{i:02X} = {self.CHAR_TABLE[i]}")

		print("\nUppercase Letters (0x10-0x29):")
		for i in range(0x10, 0x2A):
			if i in self.CHAR_TABLE:
				print(f"  0x{i:02X} = '{self.CHAR_TABLE[i]}'", end="  ")
				if (i - 0x10) % 5 == 4:
					print()

		print("\n\nLowercase Letters (0x30-0x49):")
		for i in range(0x30, 0x4A):
			if i in self.CHAR_TABLE:
				print(f"  0x{i:02X} = '{self.CHAR_TABLE[i]}'", end="  ")
				if (i - 0x30) % 5 == 4:
					print()

		print("\n\nNumbers (0x50-0x59):")
		for i in range(0x50, 0x5A):
			if i in self.CHAR_TABLE:
				print(f"  0x{i:02X} = '{self.CHAR_TABLE[i]}'", end="  ")
		print()

		print("\nPunctuation (0x60-0x7F):")
		for i in range(0x60, 0x80):
			if i in self.CHAR_TABLE:
				print(f"  0x{i:02X} = '{self.CHAR_TABLE[i]}'")


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer Text Encoder/Decoder"
	)

	parser.add_argument("rom", nargs="?", help="ROM file to process")
	parser.add_argument("--decode", "-d", type=str, metavar="ADDR",
						help="Decode text at address (hex)")
	parser.add_argument("--encode", "-e", type=str, metavar="TEXT",
						help="Encode text string to bytes")
	parser.add_argument("--extract", action="store_true",
						help="Extract all text from ROM")
	parser.add_argument("--export-json", type=str, metavar="FILE",
						help="Export extracted text to JSON")
	parser.add_argument("--export-text", type=str, metavar="FILE",
						help="Export extracted text to TXT")
	parser.add_argument("--table", action="store_true",
						help="Show character encoding table")
	parser.add_argument("--length", "-l", type=int, default=200,
						help="Max string length for decode (default: 200)")

	args = parser.parse_args()

	text_handler = SoulBlazerText()

	if args.table:
		text_handler.print_encoding_table()
		return

	if args.encode:
		# Encode text to bytes
		encoded = text_handler.encode_string(args.encode)
		print(f"Input:  {args.encode}")
		print(f"Output: {encoded.hex()}")
		print(f"Bytes:  {' '.join(f'{b:02X}' for b in encoded)}")
		return

	if not args.rom:
		parser.print_help()
		print("\nExamples:")
		print("  python text_encoder.py game.sfc --decode 0x58000")
		print("  python text_encoder.py --encode 'Hello World[END]'")
		print("  python text_encoder.py game.sfc --extract --export-json text.json")
		print("  python text_encoder.py --table")
		return

	# Load ROM
	if not text_handler.load_rom(args.rom):
		return

	if args.decode:
		# Decode at specific address
		try:
			addr = int(args.decode, 16)
		except ValueError:
			print(f"Error: Invalid address: {args.decode}")
			return

		entry = text_handler.extract_text_at(addr, args.length)
		if entry:
			print(f"\nText at 0x{addr:06X}:")
			print(f"Raw:     {entry.raw_bytes.hex()}")
			print(f"Decoded: {entry.decoded_text}")
		else:
			print(f"Error: Could not read text at 0x{addr:06X}")
		return

	if args.extract:
		text_data = text_handler.extract_all_text()

		if args.export_json:
			text_handler.export_to_json(args.export_json, text_data)

		if args.export_text:
			text_handler.export_to_text(args.export_text, text_data)

		if not args.export_json and not args.export_text:
			# Print summary
			print("\nExtracted Text Summary:")
			for name, entries in text_data.items():
				print(f"  {name}: {len(entries)} entries")


if __name__ == "__main__":
	main()
