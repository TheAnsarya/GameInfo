#!/usr/bin/env python3
"""
Robotrek Text Extractor

Extracts and decodes text data from Robotrek (SNES) ROM.

Usage:
    python robotrek_text_extractor.py <rom_path> [--output <output_file>]
"""

import argparse
import json
from pathlib import Path
from typing import Optional


# Text encoding table (US version)
TEXT_TABLE = {
	0x00: '\n',  # End of string
	0x01: 'A', 0x02: 'B', 0x03: 'C', 0x04: 'D', 0x05: 'E',
	0x06: 'F', 0x07: 'G', 0x08: 'H', 0x09: 'I', 0x0A: 'J',
	0x0B: 'K', 0x0C: 'L', 0x0D: 'M', 0x0E: 'N', 0x0F: 'O',
	0x10: 'P', 0x11: 'Q', 0x12: 'R', 0x13: 'S', 0x14: 'T',
	0x15: 'U', 0x16: 'V', 0x17: 'W', 0x18: 'X', 0x19: 'Y',
	0x1A: 'Z',
	0x1B: 'a', 0x1C: 'b', 0x1D: 'c', 0x1E: 'd', 0x1F: 'e',
	0x20: 'f', 0x21: 'g', 0x22: 'h', 0x23: 'i', 0x24: 'j',
	0x25: 'k', 0x26: 'l', 0x27: 'm', 0x28: 'n', 0x29: 'o',
	0x2A: 'p', 0x2B: 'q', 0x2C: 'r', 0x2D: 's', 0x2E: 't',
	0x2F: 'u', 0x30: 'v', 0x31: 'w', 0x32: 'x', 0x33: 'y',
	0x34: 'z',
	0x35: '0', 0x36: '1', 0x37: '2', 0x38: '3', 0x39: '4',
	0x3A: '5', 0x3B: '6', 0x3C: '7', 0x3D: '8', 0x3E: '9',
	0x3F: ' ',
	0x40: '.', 0x41: ',', 0x42: '-', 0x43: '!', 0x44: '?',
	0x45: "'", 0x46: '"', 0x47: '…',
	0x48: '(', 0x49: ')', 0x4A: '[', 0x4B: ']',
	0x4C: '/', 0x4D: ':', 0x4E: ';', 0x4F: '+',
	0x50: '♥', 0x51: '★', 0x52: '→', 0x53: '←',
	0x54: '↑', 0x55: '↓', 0x56: '🤖', 0x57: '📦',
	0x58: '💰', 0x59: '❤', 0x5A: '⚡',
}

# Control codes
CONTROL_CODES = {
	0xF0: '[LINE]',
	0xF1: '[WAIT]',
	0xF2: '[CLEAR]',
	0xF3: '[PAUSE:%d]',  # 1 byte param
	0xF4: '[SPEED:%d]',  # 1 byte param
	0xF5: '[POS:%d,%d]',  # 2 byte params
	0xF6: '[COLOR:%d]',  # 1 byte param
	0xF7: '[NAME:%d]',   # 1 byte param
	0xF8: '[NUM:%04X]',  # 2 byte param (address)
	0xF9: '[ITEM:%d]',   # 1 byte param
	0xFA: '[SOUND:%d]',  # 1 byte param
	0xFB: '[FACE:%d]',   # 1 byte param
	0xFC: '[CHOICE:%d,%04X]',  # 2 byte params
	0xFD: '[JUMP:%04X]',  # 2 byte param
	0xFE: '[END]',
	0xFF: '[SCRIPT_END]',
}

# Dictionary compression (common words)
DICTIONARY = {
	0x80: 'the ', 0x81: 'you ', 0x82: 'and ', 0x83: 'for ',
	0x84: 'can ', 0x85: 'this ', 0x86: 'with ', 0x87: 'have ',
	0x88: 'will ', 0x89: 'from ', 0x8A: 'your ', 0x8B: 'that ',
	0x8C: 'what ', 0x8D: 'there ', 0x8E: 'here ', 0x8F: "it's ",
	0x90: 'Robot', 0x91: 'Invent', 0x92: 'Doctor', 0x93: 'Father',
	0x94: 'Hacker', 0x95: 'Rococo', 0x96: 'Battle', 0x97: 'Attack',
	0x98: 'Item', 0x99: 'weapon', 0x9A: 'armor', 0x9B: 'Program',
	0x9C: 'Friend', 0x9D: 'Enemy', 0x9E: 'World', 0x9F: 'Time',
}

# Text bank locations
TEXT_BANKS = {
	"menu": {"bank": 0xCF, "start": 0x8000, "end": 0xBFFF},
	"items": {"bank": 0xD0, "start": 0x8000, "end": 0x87FF},
	"enemies": {"bank": 0xD1, "start": 0x8000, "end": 0x83FF},
	"locations": {"bank": 0xD2, "start": 0x8000, "end": 0x81FF},
	"dialog1": {"bank": 0xE0, "start": 0x8000, "end": 0xFFFF},
	"dialog2": {"bank": 0xE1, "start": 0x8000, "end": 0xFFFF},
	"dialog3": {"bank": 0xE2, "start": 0x8000, "end": 0xFFFF},
	"dialog4": {"bank": 0xE3, "start": 0x8000, "end": 0xFFFF},
	"npc1": {"bank": 0xE4, "start": 0x8000, "end": 0xFFFF},
	"npc2": {"bank": 0xE5, "start": 0x8000, "end": 0xFFFF},
	"battle": {"bank": 0xE6, "start": 0x8000, "end": 0xBFFF},
	"system": {"bank": 0xE7, "start": 0x8000, "end": 0xBFFF},
}


class RobotrekTextExtractor:
	"""Extracts text from Robotrek ROM."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.has_header = self._detect_header()

	def _load_rom(self) -> bytes:
		"""Load ROM file."""
		with open(self.rom_path, "rb") as f:
			return f.read()

	def _detect_header(self) -> bool:
		"""Detect SMC header."""
		return (len(self.rom_data) % 0x8000) == 0x200

	def hirom_to_file(self, bank: int, addr: int) -> int:
		"""Convert HiROM address to file offset."""
		offset = 0x200 if self.has_header else 0
		if bank >= 0xC0:
			file_addr = ((bank - 0xC0) * 0x10000) + (addr - 0x8000 if addr >= 0x8000 else addr)
		else:
			file_addr = (bank * 0x10000) + addr
		return offset + file_addr

	def read_bytes(self, bank: int, addr: int, length: int) -> bytes:
		"""Read bytes from ROM."""
		file_offset = self.hirom_to_file(bank, addr)
		if file_offset + length > len(self.rom_data):
			length = len(self.rom_data) - file_offset
		return self.rom_data[file_offset:file_offset + length]

	def decode_text(self, data: bytes) -> tuple[str, int]:
		"""
		Decode text from raw bytes.
		Returns (decoded_string, bytes_consumed).
		"""
		result = []
		i = 0

		while i < len(data):
			byte = data[i]

			# End markers
			if byte == 0x00 or byte == 0xFE or byte == 0xFF:
				if byte == 0xFE:
					result.append('[END]')
				elif byte == 0xFF:
					result.append('[SCRIPT_END]')
				i += 1
				break

			# Control codes
			elif byte >= 0xF0:
				code = CONTROL_CODES.get(byte, f'[${byte:02X}]')
				if byte == 0xF3 or byte == 0xF4 or byte == 0xF6 or byte == 0xF7 or byte == 0xF9 or byte == 0xFA or byte == 0xFB:
					# 1 byte param
					if i + 1 < len(data):
						param = data[i + 1]
						result.append(code % param)
						i += 2
					else:
						result.append(code)
						i += 1
				elif byte == 0xF5:
					# 2 byte params (X, Y)
					if i + 2 < len(data):
						result.append(code % (data[i + 1], data[i + 2]))
						i += 3
					else:
						result.append(code)
						i += 1
				elif byte == 0xF8 or byte == 0xFD:
					# 2 byte param (address)
					if i + 2 < len(data):
						addr = data[i + 1] | (data[i + 2] << 8)
						result.append(code % addr)
						i += 3
					else:
						result.append(code)
						i += 1
				elif byte == 0xFC:
					# 2 byte params (count, offset)
					if i + 2 < len(data):
						count = data[i + 1]
						offset = data[i + 2] | (data[i + 3] << 8) if i + 3 < len(data) else 0
						result.append(code % (count, offset))
						i += 4
					else:
						result.append(code)
						i += 1
				else:
					result.append(code)
					i += 1

			# Dictionary words
			elif byte in DICTIONARY:
				result.append(DICTIONARY[byte])
				i += 1

			# Standard characters
			elif byte in TEXT_TABLE:
				result.append(TEXT_TABLE[byte])
				i += 1

			# Unknown byte
			else:
				result.append(f'[${byte:02X}]')
				i += 1

		return ''.join(result), i

	def extract_pointer_table(self, bank: int, start: int, count: int) -> list[int]:
		"""Extract pointer table."""
		pointers = []
		data = self.read_bytes(bank, start, count * 2)

		for i in range(count):
			if i * 2 + 1 < len(data):
				ptr = data[i * 2] | (data[i * 2 + 1] << 8)
				pointers.append(ptr)

		return pointers

	def extract_text_bank(self, bank_name: str, max_strings: int = 100) -> list[dict]:
		"""Extract text strings from a bank."""
		if bank_name not in TEXT_BANKS:
			return []

		bank_info = TEXT_BANKS[bank_name]
		bank = bank_info["bank"]
		start = bank_info["start"]
		end = bank_info["end"]

		# Read pointer table (assume at start of bank)
		ptr_data = self.read_bytes(bank, start, 512)

		strings = []
		seen_offsets = set()

		# Try to find strings by following pointers
		for i in range(0, min(256, len(ptr_data)), 2):
			ptr = ptr_data[i] | (ptr_data[i + 1] << 8)

			# Valid pointer range
			if start <= ptr <= end and ptr not in seen_offsets:
				seen_offsets.add(ptr)

				# Read and decode text
				text_data = self.read_bytes(bank, ptr, 256)
				decoded, length = self.decode_text(text_data)

				if decoded and len(decoded) > 1:
					strings.append({
						"id": len(strings),
						"pointer": f"${ptr:04X}",
						"bank": f"${bank:02X}",
						"text": decoded,
						"raw_length": length
					})

				if len(strings) >= max_strings:
					break

		return strings

	def extract_all_text(self) -> dict:
		"""Extract all text from ROM."""
		all_text = {}

		for bank_name in TEXT_BANKS:
			print(f"Extracting {bank_name}...")
			strings = self.extract_text_bank(bank_name)
			all_text[bank_name] = {
				"bank": TEXT_BANKS[bank_name]["bank"],
				"string_count": len(strings),
				"strings": strings
			}

		return all_text

	def export_tbl(self, output_path: Path) -> None:
		"""Export text encoding table."""
		with open(output_path, "w", encoding="utf-8") as f:
			f.write("# Robotrek Text Table (US)\n")
			f.write("# Format: hex=character\n\n")

			for code, char in sorted(TEXT_TABLE.items()):
				if char == '\n':
					f.write(f"{code:02X}=\\n\n")
				elif char == ' ':
					f.write(f"{code:02X}= \n")
				else:
					f.write(f"{code:02X}={char}\n")

			f.write("\n# Control codes\n")
			for code, text in sorted(CONTROL_CODES.items()):
				# Remove format specifiers for TBL
				clean = text.split(':')[0] + ']' if ':' in text else text
				f.write(f"{code:02X}={clean}\n")

		print(f"Exported: {output_path}")


def main():
	parser = argparse.ArgumentParser(description="Extract text from Robotrek ROM")
	parser.add_argument("rom", help="Path to Robotrek ROM file")
	parser.add_argument("--output", "-o", help="Output JSON file")
	parser.add_argument("--tbl", help="Export TBL file")
	parser.add_argument("--bank", help="Extract specific bank only")

	args = parser.parse_args()

	extractor = RobotrekTextExtractor(args.rom)

	if args.tbl:
		extractor.export_tbl(Path(args.tbl))
		return

	if args.bank:
		if args.bank in TEXT_BANKS:
			strings = extractor.extract_text_bank(args.bank)
			result = {args.bank: strings}
		else:
			print(f"Unknown bank: {args.bank}")
			print(f"Available: {', '.join(TEXT_BANKS.keys())}")
			return
	else:
		result = extractor.extract_all_text()

	if args.output:
		output_path = Path(args.output)
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(result, f, indent="\t", ensure_ascii=False)
		print(f"Exported: {output_path}")
	else:
		# Print summary
		for bank_name, data in result.items():
			print(f"\n{bank_name}:")
			if isinstance(data, dict) and "strings" in data:
				for s in data["strings"][:5]:
					text = s["text"][:60] + "..." if len(s["text"]) > 60 else s["text"]
					print(f"  [{s['id']:03d}] {text}")
				if len(data["strings"]) > 5:
					print(f"  ... and {len(data['strings']) - 5} more")


if __name__ == "__main__":
	main()
