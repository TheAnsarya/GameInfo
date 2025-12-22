#!/usr/bin/env python3
"""
Soul Blazer (SNES) ROM Assembler
Assembles disassembly back into a ROM file.
Uses a simple two-pass assembly approach.
"""

import re
import struct
from pathlib import Path
from dataclasses import dataclass
from typing import Optional


@dataclass
class Label:
	"""Assembly label."""
	name: str
	bank: int
	address: int
	file_offset: int


@dataclass
class Instruction:
	"""Assembled instruction."""
	offset: int
	bytes: bytes
	source: str


class SimpleAssembler:
	"""Simple 65816 assembler for Soul Blazer disassembly."""

	# Opcode lookup (mnemonic -> {mode: opcode})
	OPCODES = {
		'adc': {'imm': 0x69, 'dp': 0x65, 'dpx': 0x75, 'abs': 0x6d, 'abx': 0x7d, 'aby': 0x79, 'long': 0x6f},
		'and': {'imm': 0x29, 'dp': 0x25, 'dpx': 0x35, 'abs': 0x2d, 'abx': 0x3d, 'aby': 0x39, 'long': 0x2f},
		'asl': {'acc': 0x0a, 'dp': 0x06, 'dpx': 0x16, 'abs': 0x0e, 'abx': 0x1e},
		'bcc': {'rel': 0x90},
		'bcs': {'rel': 0xb0},
		'beq': {'rel': 0xf0},
		'bit': {'imm': 0x89, 'dp': 0x24, 'dpx': 0x34, 'abs': 0x2c, 'abx': 0x3c},
		'bmi': {'rel': 0x30},
		'bne': {'rel': 0xd0},
		'bpl': {'rel': 0x10},
		'bra': {'rel': 0x80},
		'brk': {'imp': 0x00},
		'brl': {'rel16': 0x82},
		'bvc': {'rel': 0x50},
		'bvs': {'rel': 0x70},
		'clc': {'imp': 0x18},
		'cld': {'imp': 0xd8},
		'cli': {'imp': 0x58},
		'clv': {'imp': 0xb8},
		'cmp': {'imm': 0xc9, 'dp': 0xc5, 'dpx': 0xd5, 'abs': 0xcd, 'abx': 0xdd, 'aby': 0xd9, 'long': 0xcf},
		'cop': {'imm': 0x02},
		'cpx': {'imm': 0xe0, 'dp': 0xe4, 'abs': 0xec},
		'cpy': {'imm': 0xc0, 'dp': 0xc4, 'abs': 0xcc},
		'dec': {'acc': 0x3a, 'dp': 0xc6, 'dpx': 0xd6, 'abs': 0xce, 'abx': 0xde},
		'dex': {'imp': 0xca},
		'dey': {'imp': 0x88},
		'eor': {'imm': 0x49, 'dp': 0x45, 'dpx': 0x55, 'abs': 0x4d, 'abx': 0x5d, 'aby': 0x59, 'long': 0x4f},
		'inc': {'acc': 0x1a, 'dp': 0xe6, 'dpx': 0xf6, 'abs': 0xee, 'abx': 0xfe},
		'inx': {'imp': 0xe8},
		'iny': {'imp': 0xc8},
		'jml': {'long': 0x5c, 'indl': 0xdc},
		'jmp': {'abs': 0x4c, 'ind': 0x6c, 'indx': 0x7c, 'long': 0x5c},
		'jsl': {'long': 0x22},
		'jsr': {'abs': 0x20, 'indx': 0xfc},
		'lda': {'imm': 0xa9, 'dp': 0xa5, 'dpx': 0xb5, 'abs': 0xad, 'abx': 0xbd, 'aby': 0xb9, 'long': 0xaf},
		'ldx': {'imm': 0xa2, 'dp': 0xa6, 'dpy': 0xb6, 'abs': 0xae, 'aby': 0xbe},
		'ldy': {'imm': 0xa0, 'dp': 0xa4, 'dpx': 0xb4, 'abs': 0xac, 'abx': 0xbc},
		'lsr': {'acc': 0x4a, 'dp': 0x46, 'dpx': 0x56, 'abs': 0x4e, 'abx': 0x5e},
		'mvn': {'blk': 0x54},
		'mvp': {'blk': 0x44},
		'nop': {'imp': 0xea},
		'ora': {'imm': 0x09, 'dp': 0x05, 'dpx': 0x15, 'abs': 0x0d, 'abx': 0x1d, 'aby': 0x19, 'long': 0x0f},
		'pea': {'abs': 0xf4},
		'pei': {'ind': 0xd4},
		'per': {'rel16': 0x62},
		'pha': {'imp': 0x48},
		'phb': {'imp': 0x8b},
		'phd': {'imp': 0x0b},
		'phk': {'imp': 0x4b},
		'php': {'imp': 0x08},
		'phx': {'imp': 0xda},
		'phy': {'imp': 0x5a},
		'pla': {'imp': 0x68},
		'plb': {'imp': 0xab},
		'pld': {'imp': 0x2b},
		'plp': {'imp': 0x28},
		'plx': {'imp': 0xfa},
		'ply': {'imp': 0x7a},
		'rep': {'imm': 0xc2},
		'rol': {'acc': 0x2a, 'dp': 0x26, 'dpx': 0x36, 'abs': 0x2e, 'abx': 0x3e},
		'ror': {'acc': 0x6a, 'dp': 0x66, 'dpx': 0x76, 'abs': 0x6e, 'abx': 0x7e},
		'rti': {'imp': 0x40},
		'rtl': {'imp': 0x6b},
		'rts': {'imp': 0x60},
		'sbc': {'imm': 0xe9, 'dp': 0xe5, 'dpx': 0xf5, 'abs': 0xed, 'abx': 0xfd, 'aby': 0xf9, 'long': 0xef},
		'sec': {'imp': 0x38},
		'sed': {'imp': 0xf8},
		'sei': {'imp': 0x78},
		'sep': {'imm': 0xe2},
		'sta': {'dp': 0x85, 'dpx': 0x95, 'abs': 0x8d, 'abx': 0x9d, 'aby': 0x99, 'long': 0x8f},
		'stp': {'imp': 0xdb},
		'stx': {'dp': 0x86, 'dpy': 0x96, 'abs': 0x8e},
		'sty': {'dp': 0x84, 'dpx': 0x94, 'abs': 0x8c},
		'stz': {'dp': 0x64, 'dpx': 0x74, 'abs': 0x9c, 'abx': 0x9e},
		'tax': {'imp': 0xaa},
		'tay': {'imp': 0xa8},
		'tcd': {'imp': 0x5b},
		'tcs': {'imp': 0x1b},
		'tdc': {'imp': 0x7b},
		'trb': {'dp': 0x14, 'abs': 0x1c},
		'tsb': {'dp': 0x04, 'abs': 0x0c},
		'tsc': {'imp': 0x3b},
		'tsx': {'imp': 0xba},
		'txa': {'imp': 0x8a},
		'txs': {'imp': 0x9a},
		'txy': {'imp': 0x9b},
		'tya': {'imp': 0x98},
		'tyx': {'imp': 0xbb},
		'wai': {'imp': 0xcb},
		'wdm': {'imm': 0x42},
		'xba': {'imp': 0xeb},
		'xce': {'imp': 0xfb},
	}

	def __init__(self):
		self.labels = {}
		self.instructions = []
		self.current_bank = 0
		self.current_addr = 0x8000
		self.rom_size = 0x100000  # 1MB default
		self.m_flag = True  # 8-bit accumulator
		self.x_flag = True  # 8-bit index

	def lorom_to_file(self, bank: int, addr: int) -> int:
		"""Convert LoROM address to file offset."""
		return bank * 0x8000 + (addr - 0x8000)

	def parse_value(self, s: str) -> Optional[int]:
		"""Parse a numeric value."""
		s = s.strip()
		if s.startswith('$'):
			return int(s[1:], 16)
		elif s.startswith('0x'):
			return int(s[2:], 16)
		elif s.startswith('%'):
			return int(s[1:], 2)
		elif s.isdigit():
			return int(s)
		return None

	def parse_operand(self, operand: str) -> tuple[str, int, int]:
		"""Parse operand and return (mode, value, size)."""
		operand = operand.strip().lower()

		if not operand:
			return ('imp', 0, 0)

		# Accumulator
		if operand == 'a':
			return ('acc', 0, 0)

		# Immediate
		if operand.startswith('#'):
			val_str = operand[1:]
			val = self.parse_value(val_str)
			if val is not None:
				if val > 0xff:
					return ('imm', val, 2)
				return ('imm', val, 1)

		# Long address $xx:xxxx or $xxxxxx
		if ':' in operand:
			parts = operand.replace('$', '').split(':')
			bank = int(parts[0], 16)
			addr = int(parts[1].rstrip(',xy'), 16)
			val = (bank << 16) | addr
			if operand.endswith(',x'):
				return ('longx', val, 3)
			return ('long', val, 3)

		# Parse for indexed modes
		if ',' in operand:
			base, index = operand.rsplit(',', 1)
			index = index.strip()
			val = self.parse_value(base.strip())

			if val is not None:
				if val > 0xffff:
					if index == 'x':
						return ('longx', val, 3)
					return ('long', val, 3)
				elif val > 0xff:
					if index == 'x':
						return ('abx', val, 2)
					elif index == 'y':
						return ('aby', val, 2)
					elif index == 's':
						return ('sr', val, 1)
				else:
					if index == 'x':
						return ('dpx', val, 1)
					elif index == 'y':
						return ('dpy', val, 1)
					elif index == 's':
						return ('sr', val, 1)

		# Indirect modes
		if operand.startswith('(') and operand.endswith(')'):
			inner = operand[1:-1]
			val = self.parse_value(inner.rstrip(',xy'))
			if val is not None:
				if val > 0xff:
					return ('ind', val, 2)
				return ('dpind', val, 1)

		if operand.startswith('[') and operand.endswith(']'):
			inner = operand[1:-1]
			val = self.parse_value(inner)
			if val is not None:
				return ('indl', val, 2 if val > 0xff else 1)

		# Plain value
		val = self.parse_value(operand.rstrip(',xy'))
		if val is not None:
			if val > 0xffff:
				return ('long', val, 3)
			elif val > 0xff:
				return ('abs', val, 2)
			else:
				return ('dp', val, 1)

		# Label reference
		return ('label', 0, 2)  # Assume 16-bit for labels

	def assemble_line(self, line: str) -> Optional[bytes]:
		"""Assemble a single line."""
		# Remove comments
		if ';' in line:
			line = line.split(';')[0]
		line = line.strip()

		if not line:
			return None

		# Handle directives
		if line.startswith('.'):
			return self.handle_directive(line)

		# Handle labels
		if ':' in line and not line.startswith('$'):
			label_end = line.index(':')
			label = line[:label_end].strip()
			self.labels[label] = Label(
				name=label,
				bank=self.current_bank,
				address=self.current_addr,
				file_offset=self.lorom_to_file(self.current_bank, self.current_addr)
			)
			line = line[label_end+1:].strip()
			if not line:
				return None

		# Skip address prefixes like "$00:8000"
		if line.startswith('$') and '  ' in line:
			parts = line.split('  ')
			if len(parts) >= 3:
				# Format: $bank:addr  raw_bytes  instruction
				line = '  '.join(parts[2:]).strip()

		# Parse instruction
		parts = line.split(None, 1)
		if not parts:
			return None

		mnemonic = parts[0].lower()
		operand = parts[1] if len(parts) > 1 else ''

		# Handle pseudo-ops
		if mnemonic == '.db':
			val = self.parse_value(operand)
			if val is not None:
				return bytes([val & 0xff])

		if mnemonic == '.dw':
			val = self.parse_value(operand)
			if val is not None:
				return struct.pack('<H', val & 0xffff)

		# Look up opcode
		if mnemonic not in self.OPCODES:
			return None

		mode, value, size = self.parse_operand(operand)
		opcodes = self.OPCODES[mnemonic]

		# Find matching opcode
		opcode = None
		if mode in opcodes:
			opcode = opcodes[mode]
		elif mode == 'imm' and 'imm' in opcodes:
			opcode = opcodes['imm']
		elif mode == 'abs' and 'abs' in opcodes:
			opcode = opcodes['abs']
		elif mode == 'dp' and 'dp' in opcodes:
			opcode = opcodes['dp']

		if opcode is None:
			# Try implied
			if 'imp' in opcodes:
				return bytes([opcodes['imp']])
			return None

		# Build instruction bytes
		if size == 0:
			return bytes([opcode])
		elif size == 1:
			return bytes([opcode, value & 0xff])
		elif size == 2:
			return bytes([opcode, value & 0xff, (value >> 8) & 0xff])
		elif size == 3:
			return bytes([opcode, value & 0xff, (value >> 8) & 0xff, (value >> 16) & 0xff])

		return None

	def handle_directive(self, line: str) -> Optional[bytes]:
		"""Handle assembler directives."""
		parts = line.split()
		directive = parts[0].lower()

		if directive == '.bank':
			val = self.parse_value(parts[1])
			if val is not None:
				self.current_bank = val
			return None

		if directive == '.org':
			val = self.parse_value(parts[1])
			if val is not None:
				self.current_addr = val
			return None

		return None

	def assemble_file(self, path: str) -> bytes:
		"""Assemble a single file."""
		output = bytearray()

		with open(path, 'r', encoding='utf-8') as f:
			for line in f:
				result = self.assemble_line(line)
				if result:
					output.extend(result)
					self.current_addr += len(result)

		return bytes(output)


def assemble_soul_blazer(disasm_dir: str, output_path: str):
	"""Assemble Soul Blazer ROM from disassembly."""
	disasm = Path(disasm_dir)
	output = Path(output_path)
	output.parent.mkdir(parents=True, exist_ok=True)

	# Initialize ROM
	rom = bytearray(0x100000)  # 1MB

	assembler = SimpleAssembler()

	print("Assembling Soul Blazer ROM...")

	# Assemble each bank
	for bank in range(32):
		bank_file = disasm / f'bank{bank:02x}.asm'
		if not bank_file.exists():
			print(f"  Warning: Bank ${bank:02x} file not found")
			continue

		assembler.current_bank = bank
		assembler.current_addr = 0x8000

		data = assembler.assemble_file(str(bank_file))

		# Write to ROM
		start = bank * 0x8000
		rom[start:start + len(data)] = data

		print(f"  Bank ${bank:02x}: {len(data)} bytes")

	# Fix checksum
	checksum = sum(rom) & 0xffff
	complement = checksum ^ 0xffff
	rom[0x7fdc] = complement & 0xff
	rom[0x7fdd] = (complement >> 8) & 0xff
	rom[0x7fde] = checksum & 0xff
	rom[0x7fdf] = (checksum >> 8) & 0xff

	# Write ROM
	with open(output_path, 'wb') as f:
		f.write(rom)

	print(f"\nROM assembled: {output_path}")
	print(f"Size: {len(rom):,} bytes")
	print(f"Checksum: ${checksum:04x}")


if __name__ == '__main__':
	import sys

	disasm_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\disasm"
	output_path = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\build\soul_blazer_rebuilt.sfc"

	if len(sys.argv) > 1:
		disasm_dir = sys.argv[1]
	if len(sys.argv) > 2:
		output_path = sys.argv[2]

	assemble_soul_blazer(disasm_dir, output_path)
