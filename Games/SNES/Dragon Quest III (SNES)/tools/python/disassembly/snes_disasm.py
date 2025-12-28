#!/usr/bin/env python3
"""
Advanced SNES Disassembler for Dragon Quest III
Implements sophisticated 65816 disassembly with banking analysis
"""

import struct
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple, Set
from dataclasses import dataclass, field
from enum import Enum
import json


class AddressingMode(Enum):
	"""65816 Addressing modes"""

	IMPLIED = "imp"
	ACCUMULATOR = "A"
	IMMEDIATE = "imm"
	ABSOLUTE = "abs"
	ABSOLUTE_X = "abs,X"
	ABSOLUTE_Y = "abs,Y"
	ABSOLUTE_LONG = "long"
	ABSOLUTE_LONG_X = "long,X"
	DIRECT_PAGE = "dp"
	DIRECT_PAGE_X = "dp,X"
	DIRECT_PAGE_Y = "dp,Y"
	INDIRECT = "(abs)"
	INDIRECT_X = "(abs,X)"
	INDIRECT_LONG = "[abs]"
	DIRECT_PAGE_INDIRECT = "(dp)"
	DIRECT_PAGE_INDIRECT_X = "(dp,X)"
	DIRECT_PAGE_INDIRECT_Y = "(dp),Y"
	DIRECT_PAGE_INDIRECT_LONG = "[dp]"
	DIRECT_PAGE_INDIRECT_LONG_Y = "[dp],Y"
	STACK_RELATIVE = "sr,S"
	STACK_RELATIVE_INDIRECT_Y = "(sr,S),Y"
	RELATIVE = "rel"
	RELATIVE_LONG = "rell"
	BLOCK_MOVE = "block"


@dataclass
class Instruction:
	"""Represents a 65816 instruction"""

	address: int
	opcode: int
	mnemonic: str
	addressing_mode: AddressingMode
	operand_bytes: bytes
	size: int
	cycles: int
	description: str = ""

	@property
	def operand_value(self) -> Optional[int]:
		"""Get operand as integer value"""
		if not self.operand_bytes:
			return None
		elif len(self.operand_bytes) == 1:
			return self.operand_bytes[0]
		elif len(self.operand_bytes) == 2:
			return struct.unpack("<H", self.operand_bytes)[0]
		elif len(self.operand_bytes) == 3:
			return struct.unpack("<I", self.operand_bytes + b"\x00")[0] & 0xffffff
		return None

	def format_operand(self, bank: int = 0) -> str:
		"""Format operand for assembly output"""
		if not self.operand_bytes:
			return ""

		val = self.operand_value

		if self.addressing_mode == AddressingMode.IMMEDIATE:
			if len(self.operand_bytes) == 1:
				return f"#${val:02X}"
			else:
				return f"#${val:04X}"
		elif self.addressing_mode == AddressingMode.ABSOLUTE:
			return f"${val:04X}"
		elif self.addressing_mode == AddressingMode.ABSOLUTE_LONG:
			return f"${val:06X}"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE:
			return f"${val:02X}"
		elif self.addressing_mode == AddressingMode.RELATIVE:
			# Calculate target address for branches
			target = (self.address + self.size + struct.unpack("<b", self.operand_bytes)[0]) & 0xffff
			return f"${target:04X}"
		elif self.addressing_mode == AddressingMode.RELATIVE_LONG:
			target = (self.address + self.size + struct.unpack("<h", self.operand_bytes)[0]) & 0xffffff
			return f"${target:06X}"
		elif self.addressing_mode in [AddressingMode.ABSOLUTE_X, AddressingMode.ABSOLUTE_LONG_X]:
			return f"${val:04X},X"
		elif self.addressing_mode == AddressingMode.ABSOLUTE_Y:
			return f"${val:04X},Y"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE_X:
			return f"${val:02X},X"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE_Y:
			return f"${val:02X},Y"
		elif self.addressing_mode == AddressingMode.INDIRECT:
			return f"(${val:04X})"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE_INDIRECT:
			return f"(${val:02X})"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE_INDIRECT_Y:
			return f"(${val:02X}),Y"
		elif self.addressing_mode == AddressingMode.DIRECT_PAGE_INDIRECT_LONG:
			return f"[${val:02X}]"
		elif self.addressing_mode == AddressingMode.STACK_RELATIVE:
			return f"${val:02X},S"

		return f"${val:02X}"


@dataclass
class Function:
	"""Represents a discovered function"""

	start_address: int
	end_address: int
	name: str
	bank: int
	instructions: List[Instruction] = field(default_factory=list)
	calls_to: Set[int] = field(default_factory=set)
	called_from: Set[int] = field(default_factory=set)
	data_references: Set[int] = field(default_factory=set)
	description: str = ""
	function_type: str = "unknown"	# "main", "interrupt", "subroutine", "data"

	@property
	def size(self) -> int:
		return self.end_address - self.start_address + 1

	def add_instruction(self, instruction: Instruction):
		"""Add instruction to function"""
		self.instructions.append(instruction)

		# Analyze instruction for cross-references
		if instruction.mnemonic in ["JSR", "JSL"]:
			target = instruction.operand_value
			if target:
				self.calls_to.add(target)

		elif instruction.mnemonic in ["JMP", "JML"]:
			# Potential function end
			if instruction.addressing_mode in [AddressingMode.ABSOLUTE, AddressingMode.ABSOLUTE_LONG]:
				self.end_address = instruction.address


class SNES65816Disassembler:
	"""Advanced 65816 disassembler with banking support"""

	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.rom_size = len(rom_data)

		# Initialize instruction table
		self._build_instruction_table()

		# Disassembly state
		self.functions: Dict[int, Function] = {}
		self.instructions: Dict[int, Instruction] = {}
		self.data_blocks: Dict[int, Dict[str, Any]] = {}
		self.labels: Dict[int, str] = {}

		# Banking information
		self.bank_map = self._analyze_banking_system()

		# Analysis state
		self.analyzed_addresses: Set[int] = set()
		self.pending_analysis: Set[int] = set()

	def _build_instruction_table(self):
		"""Build 65816 instruction decode table"""
		# This is a comprehensive 65816 instruction table
		# Format: opcode -> (mnemonic, addressing_mode, size, cycles)
		self.instruction_table = {
			# ADC - Add with carry
			0x61: ("ADC", AddressingMode.DIRECT_PAGE_INDIRECT_X, 2, 6),
			0x63: ("ADC", AddressingMode.STACK_RELATIVE, 2, 4),
			0x65: ("ADC", AddressingMode.DIRECT_PAGE, 2, 3),
			0x67: ("ADC", AddressingMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6),
			0x69: ("ADC", AddressingMode.IMMEDIATE, 0, 2),	# Size varies with M flag
			0x6d: ("ADC", AddressingMode.ABSOLUTE, 3, 4),
			0x6f: ("ADC", AddressingMode.ABSOLUTE_LONG, 4, 5),
			0x71: ("ADC", AddressingMode.DIRECT_PAGE_INDIRECT_Y, 2, 5),
			0x72: ("ADC", AddressingMode.DIRECT_PAGE_INDIRECT, 2, 5),
			0x73: ("ADC", AddressingMode.STACK_RELATIVE_INDIRECT_Y, 2, 7),
			0x75: ("ADC", AddressingMode.DIRECT_PAGE_X, 2, 4),
			0x77: ("ADC", AddressingMode.DIRECT_PAGE_INDIRECT_LONG_Y, 2, 6),
			0x79: ("ADC", AddressingMode.ABSOLUTE_Y, 3, 4),
			0x7d: ("ADC", AddressingMode.ABSOLUTE_X, 3, 4),
			0x7f: ("ADC", AddressingMode.ABSOLUTE_LONG_X, 4, 5),
			# AND - Logical AND
			0x21: ("AND", AddressingMode.DIRECT_PAGE_INDIRECT_X, 2, 6),
			0x23: ("AND", AddressingMode.STACK_RELATIVE, 2, 4),
			0x25: ("AND", AddressingMode.DIRECT_PAGE, 2, 3),
			0x27: ("AND", AddressingMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6),
			0x29: ("AND", AddressingMode.IMMEDIATE, 0, 2),
			0x2d: ("AND", AddressingMode.ABSOLUTE, 3, 4),
			0x2f: ("AND", AddressingMode.ABSOLUTE_LONG, 4, 5),
			0x31: ("AND", AddressingMode.DIRECT_PAGE_INDIRECT_Y, 2, 5),
			0x32: ("AND", AddressingMode.DIRECT_PAGE_INDIRECT, 2, 5),
			0x33: ("AND", AddressingMode.STACK_RELATIVE_INDIRECT_Y, 2, 7),
			0x35: ("AND", AddressingMode.DIRECT_PAGE_X, 2, 4),
			0x37: ("AND", AddressingMode.DIRECT_PAGE_INDIRECT_LONG_Y, 2, 6),
			0x39: ("AND", AddressingMode.ABSOLUTE_Y, 3, 4),
			0x3d: ("AND", AddressingMode.ABSOLUTE_X, 3, 4),
			0x3f: ("AND", AddressingMode.ABSOLUTE_LONG_X, 4, 5),
			# BRA, BRL - Branch always
			0x80: ("BRA", AddressingMode.RELATIVE, 2, 3),
			0x82: ("BRL", AddressingMode.RELATIVE_LONG, 3, 4),
			# Branch instructions
			0x10: ("BPL", AddressingMode.RELATIVE, 2, 2),
			0x30: ("BMI", AddressingMode.RELATIVE, 2, 2),
			0x50: ("BVC", AddressingMode.RELATIVE, 2, 2),
			0x70: ("BVS", AddressingMode.RELATIVE, 2, 2),
			0x90: ("BCC", AddressingMode.RELATIVE, 2, 2),
			0xb0: ("BCS", AddressingMode.RELATIVE, 2, 2),
			0xd0: ("BNE", AddressingMode.RELATIVE, 2, 2),
			0xf0: ("BEQ", AddressingMode.RELATIVE, 2, 2),
			# JSR, JSL - Jump to subroutine
			0x20: ("JSR", AddressingMode.ABSOLUTE, 3, 6),
			0x22: ("JSL", AddressingMode.ABSOLUTE_LONG, 4, 8),
			0xfc: ("JSR", AddressingMode.INDIRECT_X, 3, 8),
			# JMP, JML - Jump
			0x4c: ("JMP", AddressingMode.ABSOLUTE, 3, 3),
			0x5c: ("JML", AddressingMode.ABSOLUTE_LONG, 4, 4),
			0x6c: ("JMP", AddressingMode.INDIRECT, 3, 5),
			0x7c: ("JMP", AddressingMode.INDIRECT_X, 3, 6),
			0xdc: ("JML", AddressingMode.INDIRECT_LONG, 3, 6),
			# RTS, RTL, RTI - Return
			0x40: ("RTI", AddressingMode.IMPLIED, 1, 6),
			0x60: ("RTS", AddressingMode.IMPLIED, 1, 6),
			0x6b: ("RTL", AddressingMode.IMPLIED, 1, 6),
			# Load/Store instructions
			0xa9: ("LDA", AddressingMode.IMMEDIATE, 0, 2),	# Size varies with M flag
			0xa2: ("LDX", AddressingMode.IMMEDIATE, 0, 2),	# Size varies with X flag
			0xa0: ("LDY", AddressingMode.IMMEDIATE, 0, 2),	# Size varies with X flag
			0xad: ("LDA", AddressingMode.ABSOLUTE, 3, 4),
			0xae: ("LDX", AddressingMode.ABSOLUTE, 3, 4),
			0xac: ("LDY", AddressingMode.ABSOLUTE, 3, 4),
			0x8d: ("STA", AddressingMode.ABSOLUTE, 3, 4),
			0x8e: ("STX", AddressingMode.ABSOLUTE, 3, 4),
			0x8c: ("STY", AddressingMode.ABSOLUTE, 3, 4),
			# Stack operations
			0x48: ("PHA", AddressingMode.IMPLIED, 1, 3),
			0x68: ("PLA", AddressingMode.IMPLIED, 1, 4),
			0x8b: ("PHB", AddressingMode.IMPLIED, 1, 3),
			0xab: ("PLB", AddressingMode.IMPLIED, 1, 4),
			0x0b: ("PHD", AddressingMode.IMPLIED, 1, 4),
			0x2b: ("PLD", AddressingMode.IMPLIED, 1, 5),
			0x4b: ("PHK", AddressingMode.IMPLIED, 1, 3),
			0x08: ("PHP", AddressingMode.IMPLIED, 1, 3),
			0x28: ("PLP", AddressingMode.IMPLIED, 1, 4),
			0xda: ("PHX", AddressingMode.IMPLIED, 1, 3),
			0xfa: ("PLX", AddressingMode.IMPLIED, 1, 4),
			0x5a: ("PHY", AddressingMode.IMPLIED, 1, 3),
			0x7a: ("PLY", AddressingMode.IMPLIED, 1, 4),
			# Processor status
			0x18: ("CLC", AddressingMode.IMPLIED, 1, 2),
			0x38: ("SEC", AddressingMode.IMPLIED, 1, 2),
			0x58: ("CLI", AddressingMode.IMPLIED, 1, 2),
			0x78: ("SEI", AddressingMode.IMPLIED, 1, 2),
			0xb8: ("CLV", AddressingMode.IMPLIED, 1, 2),
			0xd8: ("CLD", AddressingMode.IMPLIED, 1, 2),
			0xf8: ("SED", AddressingMode.IMPLIED, 1, 2),
			# Processor control
			0xc2: ("REP", AddressingMode.IMMEDIATE, 2, 3),
			0xe2: ("SEP", AddressingMode.IMMEDIATE, 2, 3),
			0xfb: ("XCE", AddressingMode.IMPLIED, 1, 2),
			# Transfers
			0xaa: ("TAX", AddressingMode.IMPLIED, 1, 2),
			0xa8: ("TAY", AddressingMode.IMPLIED, 1, 2),
			0xba: ("TSX", AddressingMode.IMPLIED, 1, 2),
			0x8a: ("TXA", AddressingMode.IMPLIED, 1, 2),
			0x9a: ("TXS", AddressingMode.IMPLIED, 1, 2),
			0x98: ("TYA", AddressingMode.IMPLIED, 1, 2),
			0x5b: ("TCD", AddressingMode.IMPLIED, 1, 2),
			0x7b: ("TDC", AddressingMode.IMPLIED, 1, 2),
			0x1b: ("TCS", AddressingMode.IMPLIED, 1, 2),
			0x3b: ("TSC", AddressingMode.IMPLIED, 1, 2),
			0x0a: ("ASL", AddressingMode.ACCUMULATOR, 1, 2),
			# Compare
			0xc9: ("CMP", AddressingMode.IMMEDIATE, 0, 2),
			0xe0: ("CPX", AddressingMode.IMMEDIATE, 0, 2),
			0xc0: ("CPY", AddressingMode.IMMEDIATE, 0, 2),
			# Increment/Decrement
			0xe8: ("INX", AddressingMode.IMPLIED, 1, 2),
			0xca: ("DEX", AddressingMode.IMPLIED, 1, 2),
			0xc8: ("INY", AddressingMode.IMPLIED, 1, 2),
			0x88: ("DEY", AddressingMode.IMPLIED, 1, 2),
			0x1a: ("INC", AddressingMode.ACCUMULATOR, 1, 2),
			0x3a: ("DEC", AddressingMode.ACCUMULATOR, 1, 2),
			# Misc
			0xea: ("NOP", AddressingMode.IMPLIED, 1, 2),
			0x00: ("BRK", AddressingMode.IMMEDIATE, 2, 8),
			0x02: ("COP", AddressingMode.IMMEDIATE, 2, 8),
			0xdb: ("STP", AddressingMode.IMPLIED, 1, 3),
			0xcb: ("WAI", AddressingMode.IMPLIED, 1, 3),
			# Block moves
			0x44: ("MVP", AddressingMode.BLOCK_MOVE, 3, 7),
			0x54: ("MVN", AddressingMode.BLOCK_MOVE, 3, 7),
		}

	def _analyze_banking_system(self) -> Dict[int, Dict[str, Any]]:
		"""Analyze SNES banking system for this ROM"""
		bank_map = {}

		# Determine if this is LoROM or HiROM
		rom_mapping = self._detect_rom_mapping()

		if rom_mapping == "LoROM":
			# LoROM: 32KB banks starting at $8000
			total_banks = (self.rom_size + 0x7fff) // 0x8000

			for bank in range(min(total_banks, 0x80)):
				rom_offset = bank * 0x8000
				bank_map[bank] = {
					"type": "LoROM",
					"rom_offset": rom_offset,
					"snes_start": 0x8000,
					"snes_end": 0xffff,
					"size": min(0x8000, self.rom_size - rom_offset),
					"description": self._classify_bank_content(bank, rom_offset),
				}

				# Mirror in upper half
				if bank < 0x40:
					bank_map[bank + 0x80] = dict(bank_map[bank])
					bank_map[bank + 0x80]["description"] += " (mirrored)"

		else:
			# HiROM: 64KB banks
			total_banks = (self.rom_size + 0xffff) // 0x10000

			for bank in range(min(total_banks, 0x40)):
				rom_offset = bank * 0x10000
				bank_map[bank] = {
					"type": "HiROM",
					"rom_offset": rom_offset,
					"snes_start": 0x0000,
					"snes_end": 0xffff,
					"size": min(0x10000, self.rom_size - rom_offset),
					"description": self._classify_bank_content(bank, rom_offset),
				}

		return bank_map

	def _detect_rom_mapping(self) -> str:
		"""Detect whether ROM uses LoROM or HiROM mapping"""
		# Check header locations
		lorom_score = 0
		hirom_score = 0

		# LoROM header at $7fc0 (file offset $7fc0)
		if self.rom_size > 0x7fc0 + 0x40:
			lorom_header = self.rom_data[0x7fc0 : 0x7fc0 + 0x40]
			lorom_score = self._score_snes_header(lorom_header)

		# HiROM header at $ffc0 (file offset $ffc0 if no header)
		if self.rom_size > 0xffc0 + 0x40:
			hirom_header = self.rom_data[0xffc0 : 0xffc0 + 0x40]
			hirom_score = self._score_snes_header(hirom_header)

		# Also check offset by 0x200 for headers
		if self.rom_size > 0x81c0 + 0x40:
			lorom_header_offset = self.rom_data[0x81c0 : 0x81c0 + 0x40]
			lorom_score = max(lorom_score, self._score_snes_header(lorom_header_offset))

		if self.rom_size > 0x101c0 + 0x40:
			hirom_header_offset = self.rom_data[0x101c0 : 0x101c0 + 0x40]
			hirom_score = max(hirom_score, self._score_snes_header(hirom_header_offset))

		return "LoROM" if lorom_score > hirom_score else "HiROM"

	def _score_snes_header(self, header_data: bytes) -> int:
		"""Score the validity of a SNES header"""
		if len(header_data) < 0x40:
			return 0

		score = 0

		# Check title area (should be mostly printable)
		title = header_data[:21]
		printable_count = sum(1 for b in title if 32 <= b <= 126)
		score += printable_count

		# Check ROM makeup byte
		makeup = header_data[0x25] if len(header_data) > 0x25 else 0
		if makeup in [0x20, 0x21, 0x30, 0x31]:	# Valid values
			score += 20

		# Check ROM size
		rom_size = header_data[0x27] if len(header_data) > 0x27 else 0
		if 7 <= rom_size <= 15:	# Reasonable size
			score += 15

		# Check checksums
		if len(header_data) >= 0x30:
			checksum = struct.unpack("<H", header_data[0x2e:0x30])[0]
			checksum_comp = struct.unpack("<H", header_data[0x2c:0x2e])[0]
			if (checksum ^ checksum_comp) == 0xffff:
				score += 30

		return score

	def _classify_bank_content(self, bank: int, rom_offset: int) -> str:
		"""Classify the content type of a ROM bank"""
		if rom_offset >= self.rom_size:
			return "Empty"

		# Sample first 1KB of bank to classify content
		sample_size = min(0x400, self.rom_size - rom_offset)
		sample_data = self.rom_data[rom_offset : rom_offset + sample_size]

		if not sample_data:
			return "Empty"

		# Check for code patterns
		code_instructions = 0
		for i in range(0, len(sample_data) - 1):
			if sample_data[i] in self.instruction_table:
				code_instructions += 1

		code_density = code_instructions / len(sample_data)

		# Check for graphics patterns (repetitive tile data)
		graphics_score = self._detect_graphics_patterns(sample_data)

		# Check for text/data patterns
		text_score = self._detect_text_patterns(sample_data)

		# Classification
		if bank == 0:
			return "System/Boot code"
		elif code_density > 0.3:
			return "Program code"
		elif graphics_score > 0.7:
			return "Graphics data"
		elif text_score > 0.6:
			return "Text/Dialog data"
		elif self._detect_audio_patterns(sample_data):
			return "Audio data"
		else:
			return "Data/Unknown"

	def _detect_graphics_patterns(self, data: bytes) -> float:
		"""Detect if data contains graphics patterns"""
		if len(data) < 32:
			return 0.0

		# Graphics often have many zero bytes and limited palette
		zero_count = data.count(0)
		unique_bytes = len(set(data))

		# 4bpp graphics should have at most 16 unique values per byte
		graphics_score = 0.0

		# High zero content suggests transparency in graphics
		if zero_count > len(data) * 0.2:
			graphics_score += 0.3

		# Limited palette suggests graphics
		if unique_bytes < 64:
			graphics_score += 0.4

		# Check for tile-like patterns (8x8 or 16x16)
		pattern_score = self._check_tile_patterns(data)
		graphics_score += pattern_score

		return min(graphics_score, 1.0)

	def _check_tile_patterns(self, data: bytes) -> float:
		"""Check for repeating tile patterns"""
		if len(data) < 64:
			return 0.0

		# Check for 8x8 4bpp tile patterns (32 bytes each)
		tile_size = 32
		pattern_matches = 0
		total_tiles = len(data) // tile_size

		if total_tiles < 2:
			return 0.0

		for i in range(total_tiles - 1):
			tile1 = data[i * tile_size : (i + 1) * tile_size]
			tile2 = data[(i + 1) * tile_size : (i + 2) * tile_size]

			# Check for similar patterns
			differences = sum(1 for a, b in zip(tile1, tile2) if a != b)
			similarity = 1.0 - (differences / tile_size)

			if similarity > 0.7:	# 70% similar
				pattern_matches += 1

		return min(pattern_matches / total_tiles, 0.3)

	def _detect_text_patterns(self, data: bytes) -> float:
		"""Detect if data contains text patterns"""
		if len(data) < 16:
			return 0.0

		# Check for Shift-JIS encoding patterns
		try:
			text = data.decode("shift-jis", errors="ignore")
			printable_chars = sum(1 for c in text if c.isprintable())
			return printable_chars / len(text)
		except:
			pass

		# Check for ASCII patterns
		ascii_chars = sum(1 for b in data if 32 <= b <= 126)
		return ascii_chars / len(data)

	def _detect_audio_patterns(self, data: bytes) -> bool:
		"""Detect if data contains audio patterns"""
		if len(data) < 16:
			return False

		# Look for BRR sample patterns (SNES audio format)
		brr_patterns = 0

		for i in range(0, len(data) - 9, 9):
			header = data[i]

			# BRR header format: EELLLRR
			filter_val = (header >> 2) & 0x03
			shift_val = header >> 4

			if filter_val <= 3 and shift_val <= 12:
				brr_patterns += 1

		return brr_patterns > 3

	def disassemble_range(self, start_addr: int, end_addr: int, bank: int = 0) -> List[Instruction]:
		"""Disassemble a range of addresses"""
		instructions = []

		# Convert SNES address to ROM offset
		rom_offset = self.snes_to_rom_offset(start_addr, bank)
		if rom_offset is None or rom_offset >= self.rom_size:
			return instructions

		current_addr = start_addr
		current_offset = rom_offset

		while current_addr <= end_addr and current_offset < self.rom_size:
			instruction = self.disassemble_instruction(current_offset, current_addr, bank)

			if instruction is None:
				# Skip invalid instruction
				current_addr += 1
				current_offset += 1
				continue

			instructions.append(instruction)
			self.instructions[current_addr] = instruction

			current_addr += instruction.size
			current_offset += instruction.size

		return instructions

	def disassemble_instruction(self, rom_offset: int, snes_addr: int, bank: int) -> Optional[Instruction]:
		"""Disassemble a single instruction"""
		if rom_offset >= self.rom_size:
			return None

		opcode = self.rom_data[rom_offset]

		if opcode not in self.instruction_table:
			# Unknown opcode - treat as data byte
			return Instruction(
				address=snes_addr,
				opcode=opcode,
				mnemonic="DB",
				addressing_mode=AddressingMode.IMPLIED,
				operand_bytes=b"",
				size=1,
				cycles=0,
				description=f"Unknown opcode ${opcode:02X}",
			)

		mnemonic, addressing_mode, base_size, cycles = self.instruction_table[opcode]

		# Handle variable-size instructions (immediate mode)
		instruction_size = base_size
		if base_size == 0:	# Variable size based on processor flags
			if mnemonic in ["LDA", "ADC", "SBC", "AND", "ORA", "EOR", "CMP"]:
				instruction_size = 3	# Assume 16-bit mode for now
			else:
				instruction_size = 2	# 8-bit index registers

		# Extract operand bytes
		operand_size = instruction_size - 1
		if rom_offset + instruction_size > self.rom_size:
			return None

		operand_bytes = self.rom_data[rom_offset + 1 : rom_offset + instruction_size]

		return Instruction(
			address=snes_addr,
			opcode=opcode,
			mnemonic=mnemonic,
			addressing_mode=addressing_mode,
			operand_bytes=operand_bytes,
			size=instruction_size,
			cycles=cycles,
		)

	def snes_to_rom_offset(self, snes_addr: int, bank: int) -> Optional[int]:
		"""Convert SNES address to ROM file offset"""
		if bank not in self.bank_map:
			return None

		bank_info = self.bank_map[bank]

		if bank_info["type"] == "LoROM":
			if 0x8000 <= snes_addr <= 0xffff:
				offset_in_bank = snes_addr - 0x8000
				return bank_info["rom_offset"] + offset_in_bank
		else:	# HiROM
			if 0x0000 <= snes_addr <= 0xffff:
				return bank_info["rom_offset"] + snes_addr

		return None

	def analyze_function(self, start_addr: int, bank: int = 0) -> Optional[Function]:
		"""Analyze a function starting at the given address"""
		if start_addr in self.functions:
			return self.functions[start_addr]

		function = Function(
			start_address=start_addr, end_address=start_addr, name=f"sub_{bank:02X}_{start_addr:04X}", bank=bank
		)

		# Disassemble until we find a return instruction or jump
		current_addr = start_addr
		max_size = 0x1000	# Safety limit

		for _ in range(max_size):
			rom_offset = self.snes_to_rom_offset(current_addr, bank)
			if rom_offset is None or rom_offset >= self.rom_size:
				break

			instruction = self.disassemble_instruction(rom_offset, current_addr, bank)
			if instruction is None:
				break

			function.add_instruction(instruction)

			# Check for function end conditions
			if instruction.mnemonic in ["RTS", "RTL", "RTI"]:
				function.end_address = current_addr
				break

			elif instruction.mnemonic in ["JMP", "JML"] and instruction.addressing_mode in [
				AddressingMode.ABSOLUTE,
				AddressingMode.ABSOLUTE_LONG,
			]:
				# Unconditional jump - likely end of function
				function.end_address = current_addr
				break

			elif instruction.mnemonic == "BRA":
				# Unconditional branch - follow it
				target = instruction.operand_value
				if target:
					branch_target = (
						current_addr + instruction.size + struct.unpack("<b", instruction.operand_bytes)[0]
					) & 0xffff
					# Continue from branch target
					current_addr = branch_target
					continue

			current_addr += instruction.size

		if not function.instructions:
			return None

		# Classify function type
		function.function_type = self._classify_function(function)

		self.functions[start_addr] = function
		return function

	def _classify_function(self, function: Function) -> str:
		"""Classify the type of function based on its instructions"""
		instruction_types = [inst.mnemonic for inst in function.instructions]

		# Check for interrupt handler patterns
		if "RTI" in instruction_types:
			return "interrupt"

		# Check for main loop patterns
		if len(function.instructions) > 50 and any(
			inst.mnemonic in ["BRA", "JMP"] for inst in function.instructions[-5:]
		):
			return "main_loop"

		# Check for data manipulation
		data_instructions = ["LDA", "STA", "LDX", "STX", "LDY", "STY"]
		data_count = sum(1 for inst in function.instructions if inst.mnemonic in data_instructions)

		if data_count > len(function.instructions) * 0.6:
			return "data_handler"

		# Check for arithmetic operations
		math_instructions = ["ADC", "SBC", "AND", "ORA", "EOR", "ASL", "LSR", "ROL", "ROR"]
		math_count = sum(1 for inst in function.instructions if inst.mnemonic in math_instructions)

		if math_count > len(function.instructions) * 0.4:
			return "calculation"

		return "subroutine"

	def find_entry_points(self) -> List[Tuple[int, int, str]]:
		"""Find potential function entry points"""
		entry_points = []

		# Check interrupt vectors in bank 0
		vector_locations = [
			(0xffe4, "COP"),
			(0xffe6, "BRK"),
			(0xffe8, "ABORT"),
			(0xffea, "NMI"),
			(0xffec, "UNUSED"),
			(0xffee, "IRQ"),
			(0xfff4, "COP_EMU"),
			(0xfff6, "UNUSED_EMU"),
			(0xfff8, "ABORT_EMU"),
			(0xfffa, "NMI_EMU"),
			(0xfffc, "RESET"),
			(0xfffe, "IRQ_EMU"),
		]

		for vector_addr, vector_name in vector_locations:
			rom_offset = self.snes_to_rom_offset(vector_addr, 0)
			if rom_offset and rom_offset + 1 < self.rom_size:
				target_addr = struct.unpack("<H", self.rom_data[rom_offset : rom_offset + 2])[0]
				entry_points.append((target_addr, 0, f"{vector_name}_handler"))

		# Look for JSR/JSL targets in already disassembled code
		for instruction in self.instructions.values():
			if instruction.mnemonic in ["JSR", "JSL"]:
				target = instruction.operand_value
				if target:
					target_bank = 0	# Assume same bank for JSR
					if instruction.mnemonic == "JSL":
						target_bank = (target >> 16) & 0xff
						target = target & 0xffff

					entry_points.append((target, target_bank, f"called_function"))

		return list(set(entry_points))	# Remove duplicates


def create_snes_disassembler(rom_path: str) -> SNES65816Disassembler:
	"""Create SNES disassembler from ROM file"""
	rom_file = Path(rom_path)

	if not rom_file.exists():
		raise FileNotFoundError(f"ROM file not found: {rom_path}")

	with open(rom_file, "rb") as f:
		rom_data = f.read()

	# Remove header if present
	if len(rom_data) % 1024 == 512:
		print(f"Removing 512-byte header from ROM")
		rom_data = rom_data[512:]

	return SNES65816Disassembler(rom_data)


if __name__ == "__main__":
	import argparse

	parser = argparse.ArgumentParser(description="Advanced SNES 65816 Disassembler")
	parser.add_argument("rom_file", help="Path to ROM file")
	parser.add_argument("--start", type=lambda x: int(x, 16), default=0x8000, help="Start address (hex)")
	parser.add_argument("--end", type=lambda x: int(x, 16), default=0x8100, help="End address (hex)")
	parser.add_argument("--bank", type=int, default=0, help="Bank number")
	parser.add_argument("--analyze-functions", action="store_true", help="Analyze functions")
	parser.add_argument("--output", "-o", help="Output file")

	args = parser.parse_args()

	# Create disassembler
	disasm = create_snes_disassembler(args.rom_file)

	print(f"🎮 SNES Disassembler - {args.rom_file}")
	print(f"📊 ROM size: {disasm.rom_size:,} bytes")
	print(f"🏦 Banking: {list(disasm.bank_map.values())[0]['type']}")
	print(f"📍 Disassembling ${args.start:04X}-${args.end:04X} in bank ${args.bank:02X}")

	# Disassemble range
	instructions = disasm.disassemble_range(args.start, args.end, args.bank)

	output_lines = []
	output_lines.append(f"; SNES 65816 Disassembly")
	output_lines.append(f"; Bank ${args.bank:02X}: {disasm.bank_map.get(args.bank, {}).get('description', 'Unknown')}")
	output_lines.append(f"; Address range: ${args.start:04X}-${args.end:04X}")
	output_lines.append("")

	for instruction in instructions:
		operand_str = instruction.format_operand(args.bank)

		if operand_str:
			asm_line = f"\t{instruction.mnemonic.lower()}\t{operand_str}"
		else:
			asm_line = f"\t{instruction.mnemonic.lower()}"

		# Add address and hex bytes as comment
		hex_bytes = " ".join(f"{b:02X}" for b in [instruction.opcode] + list(instruction.operand_bytes))
		output_lines.append(f"${instruction.address:04X}:\t{hex_bytes:<12} {asm_line}")

	# Function analysis
	if args.analyze_functions:
		print(f"\n🔍 Analyzing functions...")
		entry_points = disasm.find_entry_points()

		print(f"📌 Found {len(entry_points)} entry points:")
		for addr, bank, name in entry_points[:10]:	# Show first 10
			print(f"	 ${bank:02X}:{addr:04X} - {name}")

		# Analyze first few functions
		for addr, bank, name in entry_points[:3]:
			function = disasm.analyze_function(addr, bank)
			if function:
				print(f"\n📋 Function: {function.name}")
				print(f"	 Type: {function.function_type}")
				print(f"	 Size: {function.size} bytes")
				print(f"	 Instructions: {len(function.instructions)}")

	# Output
	result = "\n".join(output_lines)

	if args.output:
		with open(args.output, "w") as f:
			f.write(result)
		print(f"💾 Disassembly saved to: {args.output}")
	else:
		print(f"\n{result}")

	print(f"✅ Disassembled {len(instructions)} instructions")
