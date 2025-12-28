#!/usr/bin/env python3
"""
Soul Blazer (SNES) Disassembler
Disassembles 65816 code from the ROM.
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional


class AddressMode(Enum):
	"""65816 addressing modes."""
	IMPLIED = "imp"
	ACCUMULATOR = "acc"
	IMMEDIATE_8 = "imm8"
	IMMEDIATE_16 = "imm16"
	IMMEDIATE_M = "immM"  # Depends on M flag
	IMMEDIATE_X = "immX"  # Depends on X flag
	DIRECT = "dp"
	DIRECT_X = "dp,x"
	DIRECT_Y = "dp,y"
	DIRECT_INDIRECT = "(dp)"
	DIRECT_INDIRECT_X = "(dp,x)"
	DIRECT_INDIRECT_Y = "(dp),y"
	DIRECT_INDIRECT_LONG = "[dp]"
	DIRECT_INDIRECT_LONG_Y = "[dp],y"
	ABSOLUTE = "abs"
	ABSOLUTE_X = "abs,x"
	ABSOLUTE_Y = "abs,y"
	ABSOLUTE_INDIRECT = "(abs)"
	ABSOLUTE_INDIRECT_X = "(abs,x)"
	ABSOLUTE_INDIRECT_LONG = "[abs]"
	ABSOLUTE_LONG = "long"
	ABSOLUTE_LONG_X = "long,x"
	STACK_S = "sr,s"
	STACK_S_INDIRECT_Y = "(sr,s),y"
	RELATIVE_8 = "rel8"
	RELATIVE_16 = "rel16"
	BLOCK_MOVE = "blk"


@dataclass
class Instruction:
	"""65816 instruction definition."""
	mnemonic: str
	mode: AddressMode
	cycles: int = 0


# 65816 opcode table
OPCODES = {
	0x00: Instruction("BRK", AddressMode.IMMEDIATE_8),
	0x01: Instruction("ORA", AddressMode.DIRECT_INDIRECT_X),
	0x02: Instruction("COP", AddressMode.IMMEDIATE_8),
	0x03: Instruction("ORA", AddressMode.STACK_S),
	0x04: Instruction("TSB", AddressMode.DIRECT),
	0x05: Instruction("ORA", AddressMode.DIRECT),
	0x06: Instruction("ASL", AddressMode.DIRECT),
	0x07: Instruction("ORA", AddressMode.DIRECT_INDIRECT_LONG),
	0x08: Instruction("PHP", AddressMode.IMPLIED),
	0x09: Instruction("ORA", AddressMode.IMMEDIATE_M),
	0x0a: Instruction("ASL", AddressMode.ACCUMULATOR),
	0x0b: Instruction("PHD", AddressMode.IMPLIED),
	0x0c: Instruction("TSB", AddressMode.ABSOLUTE),
	0x0d: Instruction("ORA", AddressMode.ABSOLUTE),
	0x0e: Instruction("ASL", AddressMode.ABSOLUTE),
	0x0f: Instruction("ORA", AddressMode.ABSOLUTE_LONG),

	0x10: Instruction("BPL", AddressMode.RELATIVE_8),
	0x11: Instruction("ORA", AddressMode.DIRECT_INDIRECT_Y),
	0x12: Instruction("ORA", AddressMode.DIRECT_INDIRECT),
	0x13: Instruction("ORA", AddressMode.STACK_S_INDIRECT_Y),
	0x14: Instruction("TRB", AddressMode.DIRECT),
	0x15: Instruction("ORA", AddressMode.DIRECT_X),
	0x16: Instruction("ASL", AddressMode.DIRECT_X),
	0x17: Instruction("ORA", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0x18: Instruction("CLC", AddressMode.IMPLIED),
	0x19: Instruction("ORA", AddressMode.ABSOLUTE_Y),
	0x1a: Instruction("INC", AddressMode.ACCUMULATOR),
	0x1b: Instruction("TCS", AddressMode.IMPLIED),
	0x1c: Instruction("TRB", AddressMode.ABSOLUTE),
	0x1d: Instruction("ORA", AddressMode.ABSOLUTE_X),
	0x1e: Instruction("ASL", AddressMode.ABSOLUTE_X),
	0x1f: Instruction("ORA", AddressMode.ABSOLUTE_LONG_X),

	0x20: Instruction("JSR", AddressMode.ABSOLUTE),
	0x21: Instruction("AND", AddressMode.DIRECT_INDIRECT_X),
	0x22: Instruction("JSL", AddressMode.ABSOLUTE_LONG),
	0x23: Instruction("AND", AddressMode.STACK_S),
	0x24: Instruction("BIT", AddressMode.DIRECT),
	0x25: Instruction("AND", AddressMode.DIRECT),
	0x26: Instruction("ROL", AddressMode.DIRECT),
	0x27: Instruction("AND", AddressMode.DIRECT_INDIRECT_LONG),
	0x28: Instruction("PLP", AddressMode.IMPLIED),
	0x29: Instruction("AND", AddressMode.IMMEDIATE_M),
	0x2a: Instruction("ROL", AddressMode.ACCUMULATOR),
	0x2b: Instruction("PLD", AddressMode.IMPLIED),
	0x2c: Instruction("BIT", AddressMode.ABSOLUTE),
	0x2d: Instruction("AND", AddressMode.ABSOLUTE),
	0x2e: Instruction("ROL", AddressMode.ABSOLUTE),
	0x2f: Instruction("AND", AddressMode.ABSOLUTE_LONG),

	0x30: Instruction("BMI", AddressMode.RELATIVE_8),
	0x31: Instruction("AND", AddressMode.DIRECT_INDIRECT_Y),
	0x32: Instruction("AND", AddressMode.DIRECT_INDIRECT),
	0x33: Instruction("AND", AddressMode.STACK_S_INDIRECT_Y),
	0x34: Instruction("BIT", AddressMode.DIRECT_X),
	0x35: Instruction("AND", AddressMode.DIRECT_X),
	0x36: Instruction("ROL", AddressMode.DIRECT_X),
	0x37: Instruction("AND", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0x38: Instruction("SEC", AddressMode.IMPLIED),
	0x39: Instruction("AND", AddressMode.ABSOLUTE_Y),
	0x3a: Instruction("DEC", AddressMode.ACCUMULATOR),
	0x3b: Instruction("TSC", AddressMode.IMPLIED),
	0x3c: Instruction("BIT", AddressMode.ABSOLUTE_X),
	0x3d: Instruction("AND", AddressMode.ABSOLUTE_X),
	0x3e: Instruction("ROL", AddressMode.ABSOLUTE_X),
	0x3f: Instruction("AND", AddressMode.ABSOLUTE_LONG_X),

	0x40: Instruction("RTI", AddressMode.IMPLIED),
	0x41: Instruction("EOR", AddressMode.DIRECT_INDIRECT_X),
	0x42: Instruction("WDM", AddressMode.IMMEDIATE_8),
	0x43: Instruction("EOR", AddressMode.STACK_S),
	0x44: Instruction("MVP", AddressMode.BLOCK_MOVE),
	0x45: Instruction("EOR", AddressMode.DIRECT),
	0x46: Instruction("LSR", AddressMode.DIRECT),
	0x47: Instruction("EOR", AddressMode.DIRECT_INDIRECT_LONG),
	0x48: Instruction("PHA", AddressMode.IMPLIED),
	0x49: Instruction("EOR", AddressMode.IMMEDIATE_M),
	0x4a: Instruction("LSR", AddressMode.ACCUMULATOR),
	0x4b: Instruction("PHK", AddressMode.IMPLIED),
	0x4c: Instruction("JMP", AddressMode.ABSOLUTE),
	0x4d: Instruction("EOR", AddressMode.ABSOLUTE),
	0x4e: Instruction("LSR", AddressMode.ABSOLUTE),
	0x4f: Instruction("EOR", AddressMode.ABSOLUTE_LONG),

	0x50: Instruction("BVC", AddressMode.RELATIVE_8),
	0x51: Instruction("EOR", AddressMode.DIRECT_INDIRECT_Y),
	0x52: Instruction("EOR", AddressMode.DIRECT_INDIRECT),
	0x53: Instruction("EOR", AddressMode.STACK_S_INDIRECT_Y),
	0x54: Instruction("MVN", AddressMode.BLOCK_MOVE),
	0x55: Instruction("EOR", AddressMode.DIRECT_X),
	0x56: Instruction("LSR", AddressMode.DIRECT_X),
	0x57: Instruction("EOR", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0x58: Instruction("CLI", AddressMode.IMPLIED),
	0x59: Instruction("EOR", AddressMode.ABSOLUTE_Y),
	0x5a: Instruction("PHY", AddressMode.IMPLIED),
	0x5b: Instruction("TCD", AddressMode.IMPLIED),
	0x5c: Instruction("JML", AddressMode.ABSOLUTE_LONG),
	0x5d: Instruction("EOR", AddressMode.ABSOLUTE_X),
	0x5e: Instruction("LSR", AddressMode.ABSOLUTE_X),
	0x5f: Instruction("EOR", AddressMode.ABSOLUTE_LONG_X),

	0x60: Instruction("RTS", AddressMode.IMPLIED),
	0x61: Instruction("ADC", AddressMode.DIRECT_INDIRECT_X),
	0x62: Instruction("PER", AddressMode.RELATIVE_16),
	0x63: Instruction("ADC", AddressMode.STACK_S),
	0x64: Instruction("STZ", AddressMode.DIRECT),
	0x65: Instruction("ADC", AddressMode.DIRECT),
	0x66: Instruction("ROR", AddressMode.DIRECT),
	0x67: Instruction("ADC", AddressMode.DIRECT_INDIRECT_LONG),
	0x68: Instruction("PLA", AddressMode.IMPLIED),
	0x69: Instruction("ADC", AddressMode.IMMEDIATE_M),
	0x6a: Instruction("ROR", AddressMode.ACCUMULATOR),
	0x6b: Instruction("RTL", AddressMode.IMPLIED),
	0x6c: Instruction("JMP", AddressMode.ABSOLUTE_INDIRECT),
	0x6d: Instruction("ADC", AddressMode.ABSOLUTE),
	0x6e: Instruction("ROR", AddressMode.ABSOLUTE),
	0x6f: Instruction("ADC", AddressMode.ABSOLUTE_LONG),

	0x70: Instruction("BVS", AddressMode.RELATIVE_8),
	0x71: Instruction("ADC", AddressMode.DIRECT_INDIRECT_Y),
	0x72: Instruction("ADC", AddressMode.DIRECT_INDIRECT),
	0x73: Instruction("ADC", AddressMode.STACK_S_INDIRECT_Y),
	0x74: Instruction("STZ", AddressMode.DIRECT_X),
	0x75: Instruction("ADC", AddressMode.DIRECT_X),
	0x76: Instruction("ROR", AddressMode.DIRECT_X),
	0x77: Instruction("ADC", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0x78: Instruction("SEI", AddressMode.IMPLIED),
	0x79: Instruction("ADC", AddressMode.ABSOLUTE_Y),
	0x7a: Instruction("PLY", AddressMode.IMPLIED),
	0x7b: Instruction("TDC", AddressMode.IMPLIED),
	0x7c: Instruction("JMP", AddressMode.ABSOLUTE_INDIRECT_X),
	0x7d: Instruction("ADC", AddressMode.ABSOLUTE_X),
	0x7e: Instruction("ROR", AddressMode.ABSOLUTE_X),
	0x7f: Instruction("ADC", AddressMode.ABSOLUTE_LONG_X),

	0x80: Instruction("BRA", AddressMode.RELATIVE_8),
	0x81: Instruction("STA", AddressMode.DIRECT_INDIRECT_X),
	0x82: Instruction("BRL", AddressMode.RELATIVE_16),
	0x83: Instruction("STA", AddressMode.STACK_S),
	0x84: Instruction("STY", AddressMode.DIRECT),
	0x85: Instruction("STA", AddressMode.DIRECT),
	0x86: Instruction("STX", AddressMode.DIRECT),
	0x87: Instruction("STA", AddressMode.DIRECT_INDIRECT_LONG),
	0x88: Instruction("DEY", AddressMode.IMPLIED),
	0x89: Instruction("BIT", AddressMode.IMMEDIATE_M),
	0x8a: Instruction("TXA", AddressMode.IMPLIED),
	0x8b: Instruction("PHB", AddressMode.IMPLIED),
	0x8c: Instruction("STY", AddressMode.ABSOLUTE),
	0x8d: Instruction("STA", AddressMode.ABSOLUTE),
	0x8e: Instruction("STX", AddressMode.ABSOLUTE),
	0x8f: Instruction("STA", AddressMode.ABSOLUTE_LONG),

	0x90: Instruction("BCC", AddressMode.RELATIVE_8),
	0x91: Instruction("STA", AddressMode.DIRECT_INDIRECT_Y),
	0x92: Instruction("STA", AddressMode.DIRECT_INDIRECT),
	0x93: Instruction("STA", AddressMode.STACK_S_INDIRECT_Y),
	0x94: Instruction("STY", AddressMode.DIRECT_X),
	0x95: Instruction("STA", AddressMode.DIRECT_X),
	0x96: Instruction("STX", AddressMode.DIRECT_Y),
	0x97: Instruction("STA", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0x98: Instruction("TYA", AddressMode.IMPLIED),
	0x99: Instruction("STA", AddressMode.ABSOLUTE_Y),
	0x9a: Instruction("TXS", AddressMode.IMPLIED),
	0x9b: Instruction("TXY", AddressMode.IMPLIED),
	0x9c: Instruction("STZ", AddressMode.ABSOLUTE),
	0x9d: Instruction("STA", AddressMode.ABSOLUTE_X),
	0x9e: Instruction("STZ", AddressMode.ABSOLUTE_X),
	0x9f: Instruction("STA", AddressMode.ABSOLUTE_LONG_X),

	0xa0: Instruction("LDY", AddressMode.IMMEDIATE_X),
	0xa1: Instruction("LDA", AddressMode.DIRECT_INDIRECT_X),
	0xa2: Instruction("LDX", AddressMode.IMMEDIATE_X),
	0xa3: Instruction("LDA", AddressMode.STACK_S),
	0xa4: Instruction("LDY", AddressMode.DIRECT),
	0xa5: Instruction("LDA", AddressMode.DIRECT),
	0xa6: Instruction("LDX", AddressMode.DIRECT),
	0xa7: Instruction("LDA", AddressMode.DIRECT_INDIRECT_LONG),
	0xa8: Instruction("TAY", AddressMode.IMPLIED),
	0xa9: Instruction("LDA", AddressMode.IMMEDIATE_M),
	0xaa: Instruction("TAX", AddressMode.IMPLIED),
	0xab: Instruction("PLB", AddressMode.IMPLIED),
	0xac: Instruction("LDY", AddressMode.ABSOLUTE),
	0xad: Instruction("LDA", AddressMode.ABSOLUTE),
	0xae: Instruction("LDX", AddressMode.ABSOLUTE),
	0xaf: Instruction("LDA", AddressMode.ABSOLUTE_LONG),

	0xb0: Instruction("BCS", AddressMode.RELATIVE_8),
	0xb1: Instruction("LDA", AddressMode.DIRECT_INDIRECT_Y),
	0xb2: Instruction("LDA", AddressMode.DIRECT_INDIRECT),
	0xb3: Instruction("LDA", AddressMode.STACK_S_INDIRECT_Y),
	0xb4: Instruction("LDY", AddressMode.DIRECT_X),
	0xb5: Instruction("LDA", AddressMode.DIRECT_X),
	0xb6: Instruction("LDX", AddressMode.DIRECT_Y),
	0xb7: Instruction("LDA", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0xb8: Instruction("CLV", AddressMode.IMPLIED),
	0xb9: Instruction("LDA", AddressMode.ABSOLUTE_Y),
	0xba: Instruction("TSX", AddressMode.IMPLIED),
	0xbb: Instruction("TYX", AddressMode.IMPLIED),
	0xbc: Instruction("LDY", AddressMode.ABSOLUTE_X),
	0xbd: Instruction("LDA", AddressMode.ABSOLUTE_X),
	0xbe: Instruction("LDX", AddressMode.ABSOLUTE_Y),
	0xbf: Instruction("LDA", AddressMode.ABSOLUTE_LONG_X),

	0xc0: Instruction("CPY", AddressMode.IMMEDIATE_X),
	0xc1: Instruction("CMP", AddressMode.DIRECT_INDIRECT_X),
	0xc2: Instruction("REP", AddressMode.IMMEDIATE_8),
	0xc3: Instruction("CMP", AddressMode.STACK_S),
	0xc4: Instruction("CPY", AddressMode.DIRECT),
	0xc5: Instruction("CMP", AddressMode.DIRECT),
	0xc6: Instruction("DEC", AddressMode.DIRECT),
	0xc7: Instruction("CMP", AddressMode.DIRECT_INDIRECT_LONG),
	0xc8: Instruction("INY", AddressMode.IMPLIED),
	0xc9: Instruction("CMP", AddressMode.IMMEDIATE_M),
	0xca: Instruction("DEX", AddressMode.IMPLIED),
	0xcb: Instruction("WAI", AddressMode.IMPLIED),
	0xcc: Instruction("CPY", AddressMode.ABSOLUTE),
	0xcd: Instruction("CMP", AddressMode.ABSOLUTE),
	0xce: Instruction("DEC", AddressMode.ABSOLUTE),
	0xcf: Instruction("CMP", AddressMode.ABSOLUTE_LONG),

	0xd0: Instruction("BNE", AddressMode.RELATIVE_8),
	0xd1: Instruction("CMP", AddressMode.DIRECT_INDIRECT_Y),
	0xd2: Instruction("CMP", AddressMode.DIRECT_INDIRECT),
	0xd3: Instruction("CMP", AddressMode.STACK_S_INDIRECT_Y),
	0xd4: Instruction("PEI", AddressMode.DIRECT_INDIRECT),
	0xd5: Instruction("CMP", AddressMode.DIRECT_X),
	0xd6: Instruction("DEC", AddressMode.DIRECT_X),
	0xd7: Instruction("CMP", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0xd8: Instruction("CLD", AddressMode.IMPLIED),
	0xd9: Instruction("CMP", AddressMode.ABSOLUTE_Y),
	0xda: Instruction("PHX", AddressMode.IMPLIED),
	0xdb: Instruction("STP", AddressMode.IMPLIED),
	0xdc: Instruction("JML", AddressMode.ABSOLUTE_INDIRECT_LONG),
	0xdd: Instruction("CMP", AddressMode.ABSOLUTE_X),
	0xde: Instruction("DEC", AddressMode.ABSOLUTE_X),
	0xdf: Instruction("CMP", AddressMode.ABSOLUTE_LONG_X),

	0xe0: Instruction("CPX", AddressMode.IMMEDIATE_X),
	0xe1: Instruction("SBC", AddressMode.DIRECT_INDIRECT_X),
	0xe2: Instruction("SEP", AddressMode.IMMEDIATE_8),
	0xe3: Instruction("SBC", AddressMode.STACK_S),
	0xe4: Instruction("CPX", AddressMode.DIRECT),
	0xe5: Instruction("SBC", AddressMode.DIRECT),
	0xe6: Instruction("INC", AddressMode.DIRECT),
	0xe7: Instruction("SBC", AddressMode.DIRECT_INDIRECT_LONG),
	0xe8: Instruction("INX", AddressMode.IMPLIED),
	0xe9: Instruction("SBC", AddressMode.IMMEDIATE_M),
	0xea: Instruction("NOP", AddressMode.IMPLIED),
	0xeb: Instruction("XBA", AddressMode.IMPLIED),
	0xec: Instruction("CPX", AddressMode.ABSOLUTE),
	0xed: Instruction("SBC", AddressMode.ABSOLUTE),
	0xee: Instruction("INC", AddressMode.ABSOLUTE),
	0xef: Instruction("SBC", AddressMode.ABSOLUTE_LONG),

	0xf0: Instruction("BEQ", AddressMode.RELATIVE_8),
	0xf1: Instruction("SBC", AddressMode.DIRECT_INDIRECT_Y),
	0xf2: Instruction("SBC", AddressMode.DIRECT_INDIRECT),
	0xf3: Instruction("SBC", AddressMode.STACK_S_INDIRECT_Y),
	0xf4: Instruction("PEA", AddressMode.ABSOLUTE),
	0xf5: Instruction("SBC", AddressMode.DIRECT_X),
	0xf6: Instruction("INC", AddressMode.DIRECT_X),
	0xf7: Instruction("SBC", AddressMode.DIRECT_INDIRECT_LONG_Y),
	0xf8: Instruction("SED", AddressMode.IMPLIED),
	0xf9: Instruction("SBC", AddressMode.ABSOLUTE_Y),
	0xfa: Instruction("PLX", AddressMode.IMPLIED),
	0xfb: Instruction("XCE", AddressMode.IMPLIED),
	0xfc: Instruction("JSR", AddressMode.ABSOLUTE_INDIRECT_X),
	0xfd: Instruction("SBC", AddressMode.ABSOLUTE_X),
	0xfe: Instruction("INC", AddressMode.ABSOLUTE_X),
	0xff: Instruction("SBC", AddressMode.ABSOLUTE_LONG_X),
}


@dataclass
class DisassemblyState:
	"""State for disassembly (processor flags)."""
	m_flag: bool = True   # 8-bit accumulator
	x_flag: bool = True   # 8-bit index
	emulation: bool = False


@dataclass
class DisassembledLine:
	"""A single disassembled instruction."""
	file_offset: int
	bank: int
	address: int
	opcode: int
	operand_bytes: bytes
	mnemonic: str
	operand_str: str
	comment: str = ""
	label: str = ""


class Disassembler:
	"""65816 disassembler for SNES ROMs."""

	def __init__(self, rom_data: bytes):
		self.rom = rom_data
		self.labels: dict[int, str] = {}
		self.comments: dict[int, str] = {}
		self.state = DisassemblyState()

	def lorom_to_file(self, bank: int, addr: int) -> int:
		"""Convert LoROM CPU address to file offset."""
		if bank >= 0x80:
			bank -= 0x80
		return bank * 0x8000 + (addr & 0x7fff)

	def file_to_lorom(self, offset: int) -> tuple[int, int]:
		"""Convert file offset to LoROM bank:address."""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return bank, addr

	def get_operand_size(self, mode: AddressMode) -> int:
		"""Get operand size in bytes for addressing mode."""
		sizes = {
			AddressMode.IMPLIED: 0,
			AddressMode.ACCUMULATOR: 0,
			AddressMode.IMMEDIATE_8: 1,
			AddressMode.IMMEDIATE_16: 2,
			AddressMode.IMMEDIATE_M: 2 if not self.state.m_flag else 1,
			AddressMode.IMMEDIATE_X: 2 if not self.state.x_flag else 1,
			AddressMode.DIRECT: 1,
			AddressMode.DIRECT_X: 1,
			AddressMode.DIRECT_Y: 1,
			AddressMode.DIRECT_INDIRECT: 1,
			AddressMode.DIRECT_INDIRECT_X: 1,
			AddressMode.DIRECT_INDIRECT_Y: 1,
			AddressMode.DIRECT_INDIRECT_LONG: 1,
			AddressMode.DIRECT_INDIRECT_LONG_Y: 1,
			AddressMode.ABSOLUTE: 2,
			AddressMode.ABSOLUTE_X: 2,
			AddressMode.ABSOLUTE_Y: 2,
			AddressMode.ABSOLUTE_INDIRECT: 2,
			AddressMode.ABSOLUTE_INDIRECT_X: 2,
			AddressMode.ABSOLUTE_INDIRECT_LONG: 2,
			AddressMode.ABSOLUTE_LONG: 3,
			AddressMode.ABSOLUTE_LONG_X: 3,
			AddressMode.STACK_S: 1,
			AddressMode.STACK_S_INDIRECT_Y: 1,
			AddressMode.RELATIVE_8: 1,
			AddressMode.RELATIVE_16: 2,
			AddressMode.BLOCK_MOVE: 2,
		}
		return sizes.get(mode, 0)

	def format_operand(self, mode: AddressMode, operand: bytes, pc: int) -> str:
		"""Format operand for display."""
		if mode == AddressMode.IMPLIED:
			return ""
		elif mode == AddressMode.ACCUMULATOR:
			return "a"
		elif mode in (AddressMode.IMMEDIATE_8, AddressMode.IMMEDIATE_M, AddressMode.IMMEDIATE_X):
			if len(operand) == 1:
				return f"#${operand[0]:02x}"
			else:
				val = operand[0] | (operand[1] << 8)
				return f"#${val:04x}"
		elif mode == AddressMode.IMMEDIATE_16:
			val = operand[0] | (operand[1] << 8)
			return f"#${val:04x}"
		elif mode == AddressMode.DIRECT:
			return f"${operand[0]:02x}"
		elif mode == AddressMode.DIRECT_X:
			return f"${operand[0]:02x},x"
		elif mode == AddressMode.DIRECT_Y:
			return f"${operand[0]:02x},y"
		elif mode == AddressMode.DIRECT_INDIRECT:
			return f"(${operand[0]:02x})"
		elif mode == AddressMode.DIRECT_INDIRECT_X:
			return f"(${operand[0]:02x},x)"
		elif mode == AddressMode.DIRECT_INDIRECT_Y:
			return f"(${operand[0]:02x}),y"
		elif mode == AddressMode.DIRECT_INDIRECT_LONG:
			return f"[${operand[0]:02x}]"
		elif mode == AddressMode.DIRECT_INDIRECT_LONG_Y:
			return f"[${operand[0]:02x}],y"
		elif mode == AddressMode.ABSOLUTE:
			val = operand[0] | (operand[1] << 8)
			return f"${val:04x}"
		elif mode == AddressMode.ABSOLUTE_X:
			val = operand[0] | (operand[1] << 8)
			return f"${val:04x},x"
		elif mode == AddressMode.ABSOLUTE_Y:
			val = operand[0] | (operand[1] << 8)
			return f"${val:04x},y"
		elif mode == AddressMode.ABSOLUTE_INDIRECT:
			val = operand[0] | (operand[1] << 8)
			return f"(${val:04x})"
		elif mode == AddressMode.ABSOLUTE_INDIRECT_X:
			val = operand[0] | (operand[1] << 8)
			return f"(${val:04x},x)"
		elif mode == AddressMode.ABSOLUTE_INDIRECT_LONG:
			val = operand[0] | (operand[1] << 8)
			return f"[${val:04x}]"
		elif mode == AddressMode.ABSOLUTE_LONG:
			val = operand[0] | (operand[1] << 8) | (operand[2] << 16)
			return f"${val:06x}"
		elif mode == AddressMode.ABSOLUTE_LONG_X:
			val = operand[0] | (operand[1] << 8) | (operand[2] << 16)
			return f"${val:06x},x"
		elif mode == AddressMode.STACK_S:
			return f"${operand[0]:02x},s"
		elif mode == AddressMode.STACK_S_INDIRECT_Y:
			return f"(${operand[0]:02x},s),y"
		elif mode == AddressMode.RELATIVE_8:
			# Calculate target address
			offset = operand[0]
			if offset >= 0x80:
				offset -= 0x100
			target = (pc + 2 + offset) & 0xffff
			return f"${target:04x}"
		elif mode == AddressMode.RELATIVE_16:
			offset = operand[0] | (operand[1] << 8)
			if offset >= 0x8000:
				offset -= 0x10000
			target = (pc + 3 + offset) & 0xffff
			return f"${target:04x}"
		elif mode == AddressMode.BLOCK_MOVE:
			return f"${operand[1]:02x},${operand[0]:02x}"
		return "???"

	def disassemble_instruction(self, offset: int) -> DisassembledLine:
		"""Disassemble a single instruction at offset."""
		bank, addr = self.file_to_lorom(offset)

		if offset >= len(self.rom):
			return DisassembledLine(
				file_offset=offset,
				bank=bank,
				address=addr,
				opcode=0x00,
				operand_bytes=b'',
				mnemonic=".db",
				operand_str="$00",
				comment="End of ROM"
			)

		opcode = self.rom[offset]
		instr = OPCODES.get(opcode)

		if instr is None:
			# Unknown opcode - treat as data byte
			return DisassembledLine(
				file_offset=offset,
				bank=bank,
				address=addr,
				opcode=opcode,
				operand_bytes=b'',
				mnemonic=".db",
				operand_str=f"${opcode:02x}",
				comment="Unknown opcode"
			)

		# Get operand
		op_size = self.get_operand_size(instr.mode)
		operand_end = min(offset + 1 + op_size, len(self.rom))
		operand = self.rom[offset+1:operand_end]

		# If we don't have enough bytes, treat as data
		if len(operand) < op_size:
			return DisassembledLine(
				file_offset=offset,
				bank=bank,
				address=addr,
				opcode=opcode,
				operand_bytes=b'',
				mnemonic=".db",
				operand_str=f"${opcode:02x}",
				comment="Incomplete instruction at ROM end"
			)

		# Update state for REP/SEP
		if instr.mnemonic == "REP" and len(operand) > 0:
			if operand[0] & 0x20:
				self.state.m_flag = False
			if operand[0] & 0x10:
				self.state.x_flag = False
		elif instr.mnemonic == "SEP" and len(operand) > 0:
			if operand[0] & 0x20:
				self.state.m_flag = True
			if operand[0] & 0x10:
				self.state.x_flag = True

		operand_str = self.format_operand(instr.mode, operand, addr)

		return DisassembledLine(
			file_offset=offset,
			bank=bank,
			address=addr,
			opcode=opcode,
			operand_bytes=operand,
			mnemonic=instr.mnemonic,
			operand_str=operand_str,
			label=self.labels.get(offset, ""),
			comment=self.comments.get(offset, "")
		)

	def disassemble_range(self, start: int, end: int) -> list[DisassembledLine]:
		"""Disassemble a range of ROM."""
		lines = []
		offset = start

		while offset < end and offset < len(self.rom):
			line = self.disassemble_instruction(offset)
			lines.append(line)

			# Move to next instruction
			instr = OPCODES.get(line.opcode)
			if instr:
				op_size = self.get_operand_size(instr.mode)
				offset += 1 + op_size
			else:
				offset += 1

		return lines

	def disassemble_bank(self, bank: int) -> list[DisassembledLine]:
		"""Disassemble an entire bank."""
		start = bank * 0x8000
		end = start + 0x8000
		return self.disassemble_range(start, min(end, len(self.rom)))

	def format_line(self, line: DisassembledLine) -> str:
		"""Format a disassembled line as text."""
		# Label
		label_str = f"{line.label}:" if line.label else ""

		# Address
		addr_str = f"${line.bank:02x}:{line.address:04x}"

		# Raw bytes
		raw_bytes = [line.opcode] + list(line.operand_bytes)
		raw_str = ' '.join(f"{b:02x}" for b in raw_bytes)

		# Instruction
		if line.operand_str:
			instr_str = f"{line.mnemonic.lower()} {line.operand_str}"
		else:
			instr_str = line.mnemonic.lower()

		# Comment
		comment_str = f"; {line.comment}" if line.comment else ""

		# Format with alignment
		if label_str:
			return f"{label_str}\n{addr_str}  {raw_str:12s}  {instr_str:24s} {comment_str}"
		return f"{addr_str}  {raw_str:12s}  {instr_str:24s} {comment_str}"

	def add_label(self, offset: int, name: str):
		"""Add a label at offset."""
		self.labels[offset] = name

	def add_comment(self, offset: int, comment: str):
		"""Add a comment at offset."""
		self.comments[offset] = comment


def disassemble_soul_blazer(rom_path: str, output_dir: str):
	"""Disassemble Soul Blazer ROM."""
	with open(rom_path, 'rb') as f:
		rom = f.read()

	output = Path(output_dir)
	output.mkdir(parents=True, exist_ok=True)

	disasm = Disassembler(rom)

	# Add known labels
	disasm.add_label(0x000000, "Reset")
	disasm.add_label(0x000342, "NMI_Handler")
	disasm.add_label(0x0005a5, "IRQ_Handler")

	# Add comments
	disasm.add_comment(0x000000, "Reset vector entry point")
	disasm.add_comment(0x000342, "Non-Maskable Interrupt handler")
	disasm.add_comment(0x0005a5, "Interrupt Request handler")

	print("=" * 60)
	print("Soul Blazer Disassembler")
	print("=" * 60)

	# Disassemble each bank
	num_banks = len(rom) // 0x8000
	total_instructions = 0

	for bank in range(num_banks):  # All banks
		print(f"Disassembling bank ${bank:02x}...")

		lines = disasm.disassemble_bank(bank)

		# Write to file
		bank_file = output / f"bank{bank:02x}.asm"
		with open(bank_file, 'w', encoding='utf-8') as f:
			f.write(f"; Soul Blazer (SNES) - Bank ${bank:02x}\n")
			f.write(f"; Disassembled from ROM\n")
			f.write(f"; File offset: ${bank * 0x8000:06x}-${(bank + 1) * 0x8000 - 1:06x}\n")
			f.write(f"; CPU address: ${bank:02x}:$8000-${bank:02x}:$ffff\n")
			f.write(";" + "=" * 59 + "\n\n")

			f.write(f".bank ${bank:02x}\n")
			f.write(f".org $8000\n\n")

			for line in lines:
				f.write(disasm.format_line(line).rstrip() + "\n")

		total_instructions += len(lines)
		print(f"  Wrote {len(lines)} instructions to {bank_file.name}")

	print(f"\nTotal: {total_instructions} instructions across {num_banks} banks")

	# Write symbol file
	sym_file = output / "soul_blazer.sym"
	with open(sym_file, 'w', encoding='utf-8') as f:
		f.write("; Soul Blazer Symbol File\n")
		f.write("; Format: bank:address label\n\n")
		for offset, label in sorted(disasm.labels.items()):
			bank, addr = disasm.file_to_lorom(offset)
			f.write(f"${bank:02x}:{addr:04x} {label}\n")

	print(f"\nWrote symbol file: {sym_file.name}")
	print(f"Output directory: {output}")


if __name__ == '__main__':
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\disasm"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	disassemble_soul_blazer(rom_path, output_dir)
