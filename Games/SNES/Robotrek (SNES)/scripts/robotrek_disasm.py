#!/usr/bin/env python3
"""
Robotrek SNES Disassembler

Basic 65816 disassembler for analyzing Robotrek ROM code.

Usage:
	python robotrek_disasm.py <rom_path> [--start ADDR] [--length LEN] [--output FILE]
"""

import argparse
import struct
from pathlib import Path
from typing import Optional


# 65816 Opcode definitions
# Format: (mnemonic, addressing_mode, base_bytes)
# Addressing modes: impl, imm8, imm16, abs, absl, dp, dpx, dpy, dpix, dpiy,
#                   absix, absiy, abslx, rel8, rel16, sr, sry, ind, indl
OPCODES_65816 = {
	# ADC - Add with Carry
	0x69: ("ADC", "imm", 2),   # Immediate (2 or 3 bytes depending on M flag)
	0x6D: ("ADC", "abs", 3),   # Absolute
	0x6F: ("ADC", "absl", 4),  # Absolute Long
	0x65: ("ADC", "dp", 2),    # Direct Page
	0x72: ("ADC", "ind", 2),   # DP Indirect
	0x67: ("ADC", "indl", 2),  # DP Indirect Long
	0x7D: ("ADC", "absix", 3), # Absolute,X
	0x7F: ("ADC", "abslx", 4), # Absolute Long,X
	0x79: ("ADC", "absiy", 3), # Absolute,Y
	0x75: ("ADC", "dpx", 2),   # Direct Page,X
	0x61: ("ADC", "dpix", 2),  # DP Indexed Indirect,X
	0x71: ("ADC", "dpiy", 2),  # DP Indirect Indexed,Y
	0x77: ("ADC", "dpily", 2), # DP Indirect Long,Y
	0x63: ("ADC", "sr", 2),    # Stack Relative
	0x73: ("ADC", "sry", 2),   # SR Indirect Indexed,Y

	# AND - Logical AND
	0x29: ("AND", "imm", 2),
	0x2D: ("AND", "abs", 3),
	0x2F: ("AND", "absl", 4),
	0x25: ("AND", "dp", 2),
	0x32: ("AND", "ind", 2),
	0x27: ("AND", "indl", 2),
	0x3D: ("AND", "absix", 3),
	0x3F: ("AND", "abslx", 4),
	0x39: ("AND", "absiy", 3),
	0x35: ("AND", "dpx", 2),
	0x21: ("AND", "dpix", 2),
	0x31: ("AND", "dpiy", 2),
	0x37: ("AND", "dpily", 2),
	0x23: ("AND", "sr", 2),
	0x33: ("AND", "sry", 2),

	# ASL - Arithmetic Shift Left
	0x0A: ("ASL", "impl", 1),
	0x0E: ("ASL", "abs", 3),
	0x06: ("ASL", "dp", 2),
	0x1E: ("ASL", "absix", 3),
	0x16: ("ASL", "dpx", 2),

	# Branch instructions
	0x90: ("BCC", "rel8", 2),
	0xB0: ("BCS", "rel8", 2),
	0xF0: ("BEQ", "rel8", 2),
	0x30: ("BMI", "rel8", 2),
	0xD0: ("BNE", "rel8", 2),
	0x10: ("BPL", "rel8", 2),
	0x80: ("BRA", "rel8", 2),
	0x82: ("BRL", "rel16", 3),
	0x50: ("BVC", "rel8", 2),
	0x70: ("BVS", "rel8", 2),

	# BIT - Test Bits
	0x89: ("BIT", "imm", 2),
	0x2C: ("BIT", "abs", 3),
	0x24: ("BIT", "dp", 2),
	0x3C: ("BIT", "absix", 3),
	0x34: ("BIT", "dpx", 2),

	# BRK/COP
	0x00: ("BRK", "imm8", 2),
	0x02: ("COP", "imm8", 2),

	# Clear flags
	0x18: ("CLC", "impl", 1),
	0xD8: ("CLD", "impl", 1),
	0x58: ("CLI", "impl", 1),
	0xB8: ("CLV", "impl", 1),

	# Compare
	0xC9: ("CMP", "imm", 2),
	0xCD: ("CMP", "abs", 3),
	0xCF: ("CMP", "absl", 4),
	0xC5: ("CMP", "dp", 2),
	0xD2: ("CMP", "ind", 2),
	0xC7: ("CMP", "indl", 2),
	0xDD: ("CMP", "absix", 3),
	0xDF: ("CMP", "abslx", 4),
	0xD9: ("CMP", "absiy", 3),
	0xD5: ("CMP", "dpx", 2),
	0xC1: ("CMP", "dpix", 2),
	0xD1: ("CMP", "dpiy", 2),
	0xD7: ("CMP", "dpily", 2),
	0xC3: ("CMP", "sr", 2),
	0xD3: ("CMP", "sry", 2),

	0xE0: ("CPX", "imm", 2),
	0xEC: ("CPX", "abs", 3),
	0xE4: ("CPX", "dp", 2),

	0xC0: ("CPY", "imm", 2),
	0xCC: ("CPY", "abs", 3),
	0xC4: ("CPY", "dp", 2),

	# Decrement
	0x3A: ("DEC", "impl", 1),
	0xCE: ("DEC", "abs", 3),
	0xC6: ("DEC", "dp", 2),
	0xDE: ("DEC", "absix", 3),
	0xD6: ("DEC", "dpx", 2),
	0xCA: ("DEX", "impl", 1),
	0x88: ("DEY", "impl", 1),

	# EOR - Exclusive OR
	0x49: ("EOR", "imm", 2),
	0x4D: ("EOR", "abs", 3),
	0x4F: ("EOR", "absl", 4),
	0x45: ("EOR", "dp", 2),
	0x52: ("EOR", "ind", 2),
	0x47: ("EOR", "indl", 2),
	0x5D: ("EOR", "absix", 3),
	0x5F: ("EOR", "abslx", 4),
	0x59: ("EOR", "absiy", 3),
	0x55: ("EOR", "dpx", 2),
	0x41: ("EOR", "dpix", 2),
	0x51: ("EOR", "dpiy", 2),
	0x57: ("EOR", "dpily", 2),
	0x43: ("EOR", "sr", 2),
	0x53: ("EOR", "sry", 2),

	# Increment
	0x1A: ("INC", "impl", 1),
	0xEE: ("INC", "abs", 3),
	0xE6: ("INC", "dp", 2),
	0xFE: ("INC", "absix", 3),
	0xF6: ("INC", "dpx", 2),
	0xE8: ("INX", "impl", 1),
	0xC8: ("INY", "impl", 1),

	# Jump/Call
	0x4C: ("JMP", "abs", 3),
	0x6C: ("JMP", "ind16", 3),
	0x7C: ("JMP", "absix16", 3),
	0x5C: ("JML", "absl", 4),
	0xDC: ("JML", "indl16", 3),
	0x20: ("JSR", "abs", 3),
	0xFC: ("JSR", "absix16", 3),
	0x22: ("JSL", "absl", 4),

	# LDA - Load Accumulator
	0xA9: ("LDA", "imm", 2),
	0xAD: ("LDA", "abs", 3),
	0xAF: ("LDA", "absl", 4),
	0xA5: ("LDA", "dp", 2),
	0xB2: ("LDA", "ind", 2),
	0xA7: ("LDA", "indl", 2),
	0xBD: ("LDA", "absix", 3),
	0xBF: ("LDA", "abslx", 4),
	0xB9: ("LDA", "absiy", 3),
	0xB5: ("LDA", "dpx", 2),
	0xA1: ("LDA", "dpix", 2),
	0xB1: ("LDA", "dpiy", 2),
	0xB7: ("LDA", "dpily", 2),
	0xA3: ("LDA", "sr", 2),
	0xB3: ("LDA", "sry", 2),

	# LDX - Load X
	0xA2: ("LDX", "imm", 2),
	0xAE: ("LDX", "abs", 3),
	0xA6: ("LDX", "dp", 2),
	0xBE: ("LDX", "absiy", 3),
	0xB6: ("LDX", "dpy", 2),

	# LDY - Load Y
	0xA0: ("LDY", "imm", 2),
	0xAC: ("LDY", "abs", 3),
	0xA4: ("LDY", "dp", 2),
	0xBC: ("LDY", "absix", 3),
	0xB4: ("LDY", "dpx", 2),

	# LSR - Logical Shift Right
	0x4A: ("LSR", "impl", 1),
	0x4E: ("LSR", "abs", 3),
	0x46: ("LSR", "dp", 2),
	0x5E: ("LSR", "absix", 3),
	0x56: ("LSR", "dpx", 2),

	# Move
	0x54: ("MVN", "mvn", 3),
	0x44: ("MVP", "mvp", 3),

	# NOP
	0xEA: ("NOP", "impl", 1),

	# ORA - Logical OR
	0x09: ("ORA", "imm", 2),
	0x0D: ("ORA", "abs", 3),
	0x0F: ("ORA", "absl", 4),
	0x05: ("ORA", "dp", 2),
	0x12: ("ORA", "ind", 2),
	0x07: ("ORA", "indl", 2),
	0x1D: ("ORA", "absix", 3),
	0x1F: ("ORA", "abslx", 4),
	0x19: ("ORA", "absiy", 3),
	0x15: ("ORA", "dpx", 2),
	0x01: ("ORA", "dpix", 2),
	0x11: ("ORA", "dpiy", 2),
	0x17: ("ORA", "dpily", 2),
	0x03: ("ORA", "sr", 2),
	0x13: ("ORA", "sry", 2),

	# Push/Pull
	0xF4: ("PEA", "abs", 3),
	0xD4: ("PEI", "ind", 2),
	0x62: ("PER", "rel16", 3),
	0x48: ("PHA", "impl", 1),
	0x8B: ("PHB", "impl", 1),
	0x0B: ("PHD", "impl", 1),
	0x4B: ("PHK", "impl", 1),
	0x08: ("PHP", "impl", 1),
	0xDA: ("PHX", "impl", 1),
	0x5A: ("PHY", "impl", 1),
	0x68: ("PLA", "impl", 1),
	0xAB: ("PLB", "impl", 1),
	0x2B: ("PLD", "impl", 1),
	0x28: ("PLP", "impl", 1),
	0xFA: ("PLX", "impl", 1),
	0x7A: ("PLY", "impl", 1),

	# REP/SEP
	0xC2: ("REP", "imm8", 2),
	0xE2: ("SEP", "imm8", 2),

	# ROL/ROR
	0x2A: ("ROL", "impl", 1),
	0x2E: ("ROL", "abs", 3),
	0x26: ("ROL", "dp", 2),
	0x3E: ("ROL", "absix", 3),
	0x36: ("ROL", "dpx", 2),
	0x6A: ("ROR", "impl", 1),
	0x6E: ("ROR", "abs", 3),
	0x66: ("ROR", "dp", 2),
	0x7E: ("ROR", "absix", 3),
	0x76: ("ROR", "dpx", 2),

	# Return
	0x40: ("RTI", "impl", 1),
	0x6B: ("RTL", "impl", 1),
	0x60: ("RTS", "impl", 1),

	# SBC - Subtract with Borrow
	0xE9: ("SBC", "imm", 2),
	0xED: ("SBC", "abs", 3),
	0xEF: ("SBC", "absl", 4),
	0xE5: ("SBC", "dp", 2),
	0xF2: ("SBC", "ind", 2),
	0xE7: ("SBC", "indl", 2),
	0xFD: ("SBC", "absix", 3),
	0xFF: ("SBC", "abslx", 4),
	0xF9: ("SBC", "absiy", 3),
	0xF5: ("SBC", "dpx", 2),
	0xE1: ("SBC", "dpix", 2),
	0xF1: ("SBC", "dpiy", 2),
	0xF7: ("SBC", "dpily", 2),
	0xE3: ("SBC", "sr", 2),
	0xF3: ("SBC", "sry", 2),

	# Set flags
	0x38: ("SEC", "impl", 1),
	0xF8: ("SED", "impl", 1),
	0x78: ("SEI", "impl", 1),

	# STA - Store Accumulator
	0x8D: ("STA", "abs", 3),
	0x8F: ("STA", "absl", 4),
	0x85: ("STA", "dp", 2),
	0x92: ("STA", "ind", 2),
	0x87: ("STA", "indl", 2),
	0x9D: ("STA", "absix", 3),
	0x9F: ("STA", "abslx", 4),
	0x99: ("STA", "absiy", 3),
	0x95: ("STA", "dpx", 2),
	0x81: ("STA", "dpix", 2),
	0x91: ("STA", "dpiy", 2),
	0x97: ("STA", "dpily", 2),
	0x83: ("STA", "sr", 2),
	0x93: ("STA", "sry", 2),

	# STP/WAI
	0xDB: ("STP", "impl", 1),
	0xCB: ("WAI", "impl", 1),

	# STX - Store X
	0x8E: ("STX", "abs", 3),
	0x86: ("STX", "dp", 2),
	0x96: ("STX", "dpy", 2),

	# STY - Store Y
	0x8C: ("STY", "abs", 3),
	0x84: ("STY", "dp", 2),
	0x94: ("STY", "dpx", 2),

	# STZ - Store Zero
	0x9C: ("STZ", "abs", 3),
	0x64: ("STZ", "dp", 2),
	0x9E: ("STZ", "absix", 3),
	0x74: ("STZ", "dpx", 2),

	# Transfer
	0xAA: ("TAX", "impl", 1),
	0xA8: ("TAY", "impl", 1),
	0x5B: ("TCD", "impl", 1),
	0x1B: ("TCS", "impl", 1),
	0x7B: ("TDC", "impl", 1),
	0x3B: ("TSC", "impl", 1),
	0xBA: ("TSX", "impl", 1),
	0x8A: ("TXA", "impl", 1),
	0x9A: ("TXS", "impl", 1),
	0x9B: ("TXY", "impl", 1),
	0x98: ("TYA", "impl", 1),
	0xBB: ("TYX", "impl", 1),

	# TRB/TSB
	0x1C: ("TRB", "abs", 3),
	0x14: ("TRB", "dp", 2),
	0x0C: ("TSB", "abs", 3),
	0x04: ("TSB", "dp", 2),

	# WDM
	0x42: ("WDM", "imm8", 2),

	# XBA/XCE
	0xEB: ("XBA", "impl", 1),
	0xFB: ("XCE", "impl", 1),
}


class RobotrekDisassembler:
	"""Disassembler for Robotrek SNES ROM."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.has_header = self._detect_header()
		self.labels: dict[int, str] = {}
		self.comments: dict[int, str] = {}

		# Assume 16-bit accumulator/index by default
		self.m_flag = False  # False = 16-bit A, True = 8-bit A
		self.x_flag = False  # False = 16-bit X/Y, True = 8-bit X/Y

	def _load_rom(self) -> bytes:
		"""Load ROM file into memory."""
		with open(self.rom_path, "rb") as f:
			return f.read()

	def _detect_header(self) -> bool:
		"""Detect if ROM has SMC header."""
		size = len(self.rom_data)
		return (size % 0x8000) == 0x200

	def hirom_to_file(self, addr: int) -> int:
		"""Convert HiROM address to file offset."""
		bank = (addr >> 16) & 0xFF
		offset = addr & 0xFFFF

		# For HiROM, bank $C0+ maps to file start
		if bank >= 0xC0:
			file_offset = ((bank - 0xC0) << 16) + (offset & 0xFFFF)
		else:
			file_offset = addr

		if self.has_header:
			file_offset += 0x200

		return file_offset

	def file_to_hirom(self, file_offset: int) -> int:
		"""Convert file offset to HiROM address."""
		if self.has_header:
			file_offset -= 0x200

		bank = 0xC0 + (file_offset >> 16)
		offset = file_offset & 0xFFFF

		# HiROM mirrors at $8000
		if offset < 0x8000:
			offset += 0x8000

		return (bank << 16) | offset

	def get_opcode_size(self, opcode: int) -> int:
		"""Get instruction size in bytes, accounting for M/X flags."""
		if opcode not in OPCODES_65816:
			return 1  # Unknown opcode

		mnemonic, mode, base_size = OPCODES_65816[opcode]

		# Adjust for 16-bit immediate modes
		if mode == "imm":
			# ADC, AND, CMP, EOR, LDA, ORA, SBC use M flag
			if mnemonic in ("ADC", "AND", "CMP", "EOR", "LDA", "ORA", "SBC"):
				if not self.m_flag:  # 16-bit accumulator
					return base_size + 1
			# CPX, CPY, LDX, LDY use X flag
			elif mnemonic in ("CPX", "CPY", "LDX", "LDY"):
				if not self.x_flag:  # 16-bit index
					return base_size + 1

		return base_size

	def format_operand(self, opcode: int, operand_bytes: bytes, pc: int) -> str:
		"""Format operand for display."""
		if opcode not in OPCODES_65816:
			return f"${opcode:02x}"

		mnemonic, mode, _ = OPCODES_65816[opcode]

		if mode == "impl":
			return ""
		elif mode == "imm8":
			return f"#${operand_bytes[0]:02x}"
		elif mode == "imm":
			if len(operand_bytes) >= 2:
				val = struct.unpack("<H", operand_bytes[:2])[0]
				return f"#${val:04x}"
			else:
				return f"#${operand_bytes[0]:02x}"
		elif mode == "dp":
			return f"${operand_bytes[0]:02x}"
		elif mode == "dpx":
			return f"${operand_bytes[0]:02x},X"
		elif mode == "dpy":
			return f"${operand_bytes[0]:02x},Y"
		elif mode == "dpix":
			return f"(${operand_bytes[0]:02x},X)"
		elif mode == "dpiy":
			return f"(${operand_bytes[0]:02x}),Y"
		elif mode == "dpily":
			return f"[${operand_bytes[0]:02x}],Y"
		elif mode == "ind":
			return f"(${operand_bytes[0]:02x})"
		elif mode == "indl":
			return f"[${operand_bytes[0]:02x}]"
		elif mode == "abs":
			val = struct.unpack("<H", operand_bytes[:2])[0]
			return f"${val:04x}"
		elif mode == "absix":
			val = struct.unpack("<H", operand_bytes[:2])[0]
			return f"${val:04x},X"
		elif mode == "absiy":
			val = struct.unpack("<H", operand_bytes[:2])[0]
			return f"${val:04x},Y"
		elif mode in ("ind16", "absix16"):
			val = struct.unpack("<H", operand_bytes[:2])[0]
			if mode == "ind16":
				return f"(${val:04x})"
			else:
				return f"(${val:04x},X)"
		elif mode == "indl16":
			val = struct.unpack("<H", operand_bytes[:2])[0]
			return f"[${val:04x}]"
		elif mode == "absl":
			val = struct.unpack("<I", operand_bytes[:3] + b'\x00')[0]
			return f"${val:06x}"
		elif mode == "abslx":
			val = struct.unpack("<I", operand_bytes[:3] + b'\x00')[0]
			return f"${val:06x},X"
		elif mode == "rel8":
			# Calculate branch target
			offset = struct.unpack("b", operand_bytes[:1])[0]
			target = pc + 2 + offset
			return f"${target:04x}"
		elif mode == "rel16":
			offset = struct.unpack("<h", operand_bytes[:2])[0]
			target = pc + 3 + offset
			return f"${target:04x}"
		elif mode == "sr":
			return f"${operand_bytes[0]:02x},S"
		elif mode == "sry":
			return f"(${operand_bytes[0]:02x},S),Y"
		elif mode in ("mvn", "mvp"):
			return f"${operand_bytes[0]:02x},${operand_bytes[1]:02x}"

		return ""

	def disassemble_instruction(self, file_offset: int) -> tuple[str, int]:
		"""Disassemble a single instruction. Returns (text, size)."""
		if file_offset >= len(self.rom_data):
			return ".db $00", 1

		opcode = self.rom_data[file_offset]

		if opcode not in OPCODES_65816:
			return f".db ${opcode:02x}", 1

		mnemonic, mode, _ = OPCODES_65816[opcode]
		size = self.get_opcode_size(opcode)

		# Get operand bytes
		operand_start = file_offset + 1
		operand_bytes = self.rom_data[operand_start:operand_start + size - 1]

		# Track processor state changes
		if opcode == 0xC2:  # REP
			flags = operand_bytes[0] if operand_bytes else 0
			if flags & 0x20:  # M flag
				self.m_flag = False
			if flags & 0x10:  # X flag
				self.x_flag = False
		elif opcode == 0xE2:  # SEP
			flags = operand_bytes[0] if operand_bytes else 0
			if flags & 0x20:  # M flag
				self.m_flag = True
			if flags & 0x10:  # X flag
				self.x_flag = True

		# Format the instruction
		pc = self.file_to_hirom(file_offset) & 0xFFFF
		operand = self.format_operand(opcode, operand_bytes, pc)

		if operand:
			return f"{mnemonic} {operand}", size
		else:
			return mnemonic, size

	def disassemble_range(self, start_addr: int, length: int) -> list[str]:
		"""Disassemble a range of code. Uses HiROM address."""
		result = []
		file_offset = self.hirom_to_file(start_addr)
		end_offset = file_offset + length
		current_addr = start_addr

		while file_offset < end_offset and file_offset < len(self.rom_data):
			# Check for label
			if current_addr in self.labels:
				result.append(f"\n{self.labels[current_addr]}:")

			# Disassemble instruction
			text, size = self.disassemble_instruction(file_offset)

			# Format output
			bytes_str = " ".join(f"{self.rom_data[file_offset + i]:02x}" for i in range(size))
			line = f"${current_addr:06X}:  {bytes_str:<12}  {text}"

			# Add comment if present
			if current_addr in self.comments:
				line += f"  ; {self.comments[current_addr]}"

			result.append(line)

			file_offset += size
			current_addr += size

		return result

	def add_label(self, addr: int, name: str):
		"""Add a label at the specified address."""
		self.labels[addr] = name

	def add_comment(self, addr: int, comment: str):
		"""Add a comment at the specified address."""
		self.comments[addr] = comment

	def find_vectors(self) -> dict[str, int]:
		"""Find interrupt vectors from ROM header."""
		# HiROM vectors are at $FFEA-$FFFF
		header_offset = 0xFFE0 if not self.has_header else 0xFFE0 + 0x200
		vectors = {}

		vector_names = [
			("COP_native", 0xFFE4),
			("BRK_native", 0xFFE6),
			("ABORT_native", 0xFFE8),
			("NMI_native", 0xFFEA),
			("IRQ_native", 0xFFEE),
			("COP_emu", 0xFFF4),
			("ABORT_emu", 0xFFF8),
			("NMI_emu", 0xFFFA),
			("RESET", 0xFFFC),
			("IRQ_emu", 0xFFFE),
		]

		for name, addr in vector_names:
			file_offset = self.hirom_to_file(0xC00000 | addr)
			if file_offset + 2 <= len(self.rom_data):
				vector = struct.unpack("<H", self.rom_data[file_offset:file_offset + 2])[0]
				vectors[name] = vector

		return vectors


def main():
	parser = argparse.ArgumentParser(description="Robotrek SNES Disassembler")
	parser.add_argument("rom_path", help="Path to ROM file")
	parser.add_argument("--start", type=lambda x: int(x, 16), default=0xC08000,
					   help="Start address (hex, default: C08000)")
	parser.add_argument("--length", type=lambda x: int(x, 16), default=0x100,
					   help="Length to disassemble (hex, default: 100)")
	parser.add_argument("--output", help="Output file (default: stdout)")
	parser.add_argument("--vectors", action="store_true", help="Show interrupt vectors")

	args = parser.parse_args()

	disasm = RobotrekDisassembler(args.rom_path)

	if args.vectors:
		print("=== Interrupt Vectors ===")
		vectors = disasm.find_vectors()
		for name, addr in vectors.items():
			print(f"{name}: ${addr:04X}")
		print()

	# Add known labels
	disasm.add_label(0xC08000, "Reset")
	disasm.add_comment(0xC08000, "Game entry point")

	# Disassemble
	lines = disasm.disassemble_range(args.start, args.length)

	output_text = f"; Robotrek Disassembly\n"
	output_text += f"; Start: ${args.start:06X}, Length: ${args.length:04X}\n"
	output_text += f"; ROM: {args.rom_path}\n\n"
	output_text += "\n".join(lines)

	if args.output:
		with open(args.output, "w") as f:
			f.write(output_text)
		print(f"Output written to {args.output}")
	else:
		print(output_text)


if __name__ == "__main__":
	main()
