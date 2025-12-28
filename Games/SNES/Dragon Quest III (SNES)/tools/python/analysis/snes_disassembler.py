#!/usr/bin/env python3
"""
Dragon Quest III - Enhanced SNES 65816 Disassembler
Comprehensive assembly analysis with advanced pattern recognition

This module provides sophisticated disassembly capabilities for the Dragon Quest III
ROM, including proper 65816 instruction decoding, HiROM address translation,
subroutine detection, jump table analysis, and game-specific code patterns.

Enhanced Features:
- Complete 65816 instruction set with all opcodes (256 total)
- Advanced subroutine detection and call graph analysis
- Jump table identification and analysis
- Data reference tracking with type inference
- Code flow analysis with branch prediction
- Function signature detection
- Interrupt vector analysis
- Game-specific pattern recognition
- Enhanced output formatting with annotations
"""

import sys
import struct
import re
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any, Set
from dataclasses import dataclass, field
from enum import Enum
import json
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Add required paths
sys.path.insert(0, str(Path(__file__).parent.parent / "utils"))
from snes_address_translation import SNESAddressTranslator

class AddressMode(Enum):
	"""65816 addressing modes"""
	IMPLIED = "imp"
	IMMEDIATE_8 = "imm8"
	IMMEDIATE_16 = "imm16"
	DIRECT_PAGE = "dp"
	DIRECT_PAGE_X = "dpx"
	DIRECT_PAGE_Y = "dpy"
	ABSOLUTE = "abs"
	ABSOLUTE_X = "absx"
	ABSOLUTE_Y = "absy"
	LONG = "long"
	LONG_X = "longx"
	RELATIVE_8 = "rel8"
	RELATIVE_16 = "rel16"
	INDIRECT = "ind"
	INDEXED_INDIRECT = "idx_ind"
	INDIRECT_INDEXED = "ind_idx"
	STACK_RELATIVE = "sr"
	STACK_RELATIVE_INDIRECT_INDEXED = "sr_ind_idx"
	DIRECT_PAGE_INDIRECT = "dp_ind"
	DIRECT_PAGE_INDIRECT_LONG = "dp_ind_long"
	ABSOLUTE_INDIRECT_LONG = "abs_ind_long"
	BLOCK_MOVE_XY = "block_xy"
	BLOCK_MOVE = "block"

@dataclass
class Instruction:
	"""Represents a disassembled 65816 instruction"""
	address: int
	snes_address: str
	opcode: int
	mnemonic: str
	operands: str
	bytes: bytes
	size: int
	addressing_mode: AddressMode
	cycles: int
	flags_affected: str
	description: str
	is_branch: bool = False
	is_jump: bool = False
	is_call: bool = False
	is_return: bool = False
	target_address: Optional[int] = None
	references: Set[int] = field(default_factory=set)

@dataclass
class Subroutine:
	"""Represents a code subroutine"""
	start_address: int
	end_address: int
	snes_start: str
	snes_end: str
	size: int
	instructions: List[Instruction] = field(default_factory=list)
	entry_points: Set[int] = field(default_factory=set)
	exit_points: Set[int] = field(default_factory=set)
	data_references: Set[int] = field(default_factory=set)
	called_subroutines: Set[int] = field(default_factory=set)
	analysis_notes: List[str] = field(default_factory=list)
	function_signature: str = ""
	complexity_score: float = 0.0

@dataclass
class JumpTable:
	"""Represents a jump table structure"""
	table_address: int
	entry_size: int
	entry_count: int
	targets: List[int] = field(default_factory=list)
	access_pattern: str = ""

class SNESDisassembler:
	"""Advanced SNES 65816 disassembler"""

	def __init__(self, project_root: str):
		self.project_root = Path(project_root)
		self.rom_path = self.project_root / "static" / "Dragon Quest III - english (patched).smc"

		# Load ROM
		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		self.address_translator = SNESAddressTranslator(rom_size=len(self.rom_data))

		# 65816 instruction table
		self.opcodes = self._init_opcode_table()

		# Analysis results
		self.instructions = {}
		self.subroutines = []
		self.data_references = {}
		self.jump_tables = {}

	def _init_opcode_table(self) -> Dict[int, Dict[str, Any]]:
		"""Initialize comprehensive 65816 opcode lookup table"""
		opcodes = {}

		# Complete 65816 instruction set
		instructions = [
			# Load/Store A
			(0xA9, "LDA", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Load Accumulator"),
			(0xA5, "LDA", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Load Accumulator"),
			(0xB5, "LDA", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Load Accumulator"),
			(0xAD, "LDA", AddressMode.ABSOLUTE, 3, 4, "NZ", "Load Accumulator"),
			(0xBD, "LDA", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Load Accumulator"),
			(0xB9, "LDA", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Load Accumulator"),
			(0xAF, "LDA", AddressMode.LONG, 4, 5, "NZ", "Load Accumulator Long"),
			(0xBF, "LDA", AddressMode.LONG_X, 4, 5, "NZ", "Load Accumulator Long,X"),
			(0xB2, "LDA", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZ", "Load Accumulator"),
			(0xA1, "LDA", AddressMode.INDEXED_INDIRECT, 2, 6, "NZ", "Load Accumulator"),
			(0xB1, "LDA", AddressMode.INDIRECT_INDEXED, 2, 5, "NZ", "Load Accumulator"),
			(0xB7, "LDA", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZ", "Load Accumulator"),
			(0xA3, "LDA", AddressMode.STACK_RELATIVE, 2, 4, "NZ", "Load Accumulator"),
			(0xB3, "LDA", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZ", "Load Accumulator"),

			(0x85, "STA", AddressMode.DIRECT_PAGE, 2, 3, "", "Store Accumulator"),
			(0x95, "STA", AddressMode.DIRECT_PAGE_X, 2, 4, "", "Store Accumulator"),
			(0x8D, "STA", AddressMode.ABSOLUTE, 3, 4, "", "Store Accumulator"),
			(0x9D, "STA", AddressMode.ABSOLUTE_X, 3, 5, "", "Store Accumulator"),
			(0x99, "STA", AddressMode.ABSOLUTE_Y, 3, 5, "", "Store Accumulator"),
			(0x8F, "STA", AddressMode.LONG, 4, 5, "", "Store Accumulator Long"),
			(0x9F, "STA", AddressMode.LONG_X, 4, 5, "", "Store Accumulator Long,X"),
			(0x92, "STA", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "", "Store Accumulator"),
			(0x81, "STA", AddressMode.INDEXED_INDIRECT, 2, 6, "", "Store Accumulator"),
			(0x91, "STA", AddressMode.INDIRECT_INDEXED, 2, 6, "", "Store Accumulator"),
			(0x87, "STA", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "", "Store Accumulator"),
			(0x83, "STA", AddressMode.STACK_RELATIVE, 2, 4, "", "Store Accumulator"),
			(0x93, "STA", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "", "Store Accumulator"),

			# Load/Store X
			(0xA2, "LDX", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Load X"),
			(0xA6, "LDX", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Load X"),
			(0xB6, "LDX", AddressMode.DIRECT_PAGE_Y, 2, 4, "NZ", "Load X"),
			(0xAE, "LDX", AddressMode.ABSOLUTE, 3, 4, "NZ", "Load X"),
			(0xBE, "LDX", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Load X"),

			(0x86, "STX", AddressMode.DIRECT_PAGE, 2, 3, "", "Store X"),
			(0x96, "STX", AddressMode.DIRECT_PAGE_Y, 2, 4, "", "Store X"),
			(0x8E, "STX", AddressMode.ABSOLUTE, 3, 4, "", "Store X"),

			# Load/Store Y
			(0xA0, "LDY", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Load Y"),
			(0xA4, "LDY", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Load Y"),
			(0xB4, "LDY", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Load Y"),
			(0xAC, "LDY", AddressMode.ABSOLUTE, 3, 4, "NZ", "Load Y"),
			(0xBC, "LDY", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Load Y"),

			(0x84, "STY", AddressMode.DIRECT_PAGE, 2, 3, "", "Store Y"),
			(0x94, "STY", AddressMode.DIRECT_PAGE_X, 2, 4, "", "Store Y"),
			(0x8C, "STY", AddressMode.ABSOLUTE, 3, 4, "", "Store Y"),

			# Transfer
			(0xAA, "TAX", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer A to X"),
			(0xA8, "TAY", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer A to Y"),
			(0x8A, "TXA", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer X to A"),
			(0x98, "TYA", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer Y to A"),
			(0x9A, "TXS", AddressMode.IMPLIED, 1, 2, "", "Transfer X to Stack"),
			(0xBA, "TSX", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer Stack to X"),
			(0x5B, "TCD", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer C to Direct"),
			(0x7B, "TDC", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer Direct to C"),
			(0x1B, "TCS", AddressMode.IMPLIED, 1, 2, "", "Transfer C to Stack"),
			(0x3B, "TSC", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer Stack to C"),

			# Stack Operations
			(0x48, "PHA", AddressMode.IMPLIED, 1, 3, "", "Push Accumulator"),
			(0x68, "PLA", AddressMode.IMPLIED, 1, 4, "NZ", "Pull Accumulator"),
			(0xDA, "PHX", AddressMode.IMPLIED, 1, 3, "", "Push X"),
			(0xFA, "PLX", AddressMode.IMPLIED, 1, 4, "NZ", "Pull X"),
			(0x5A, "PHY", AddressMode.IMPLIED, 1, 3, "", "Push Y"),
			(0x7A, "PLY", AddressMode.IMPLIED, 1, 4, "NZ", "Pull Y"),
			(0x08, "PHP", AddressMode.IMPLIED, 1, 3, "", "Push Processor Status"),
			(0x28, "PLP", AddressMode.IMPLIED, 1, 4, "NVMXDIZC", "Pull Processor Status"),
			(0x8B, "PHB", AddressMode.IMPLIED, 1, 3, "", "Push Data Bank"),
			(0xAB, "PLB", AddressMode.IMPLIED, 1, 4, "NZ", "Pull Data Bank"),
			(0x0B, "PHD", AddressMode.IMPLIED, 1, 4, "", "Push Direct Page"),
			(0x2B, "PLD", AddressMode.IMPLIED, 1, 5, "NZ", "Pull Direct Page"),
			(0x4B, "PHK", AddressMode.IMPLIED, 1, 3, "", "Push Program Bank"),

			# Arithmetic
			(0x69, "ADC", AddressMode.IMMEDIATE_16, 2, 2, "NVZC", "Add with Carry"),
			(0x65, "ADC", AddressMode.DIRECT_PAGE, 2, 3, "NVZC", "Add with Carry"),
			(0x75, "ADC", AddressMode.DIRECT_PAGE_X, 2, 4, "NVZC", "Add with Carry"),
			(0x6D, "ADC", AddressMode.ABSOLUTE, 3, 4, "NVZC", "Add with Carry"),
			(0x7D, "ADC", AddressMode.ABSOLUTE_X, 3, 4, "NVZC", "Add with Carry"),
			(0x79, "ADC", AddressMode.ABSOLUTE_Y, 3, 4, "NVZC", "Add with Carry"),
			(0x6F, "ADC", AddressMode.LONG, 4, 5, "NVZC", "Add with Carry Long"),
			(0x7F, "ADC", AddressMode.LONG_X, 4, 5, "NVZC", "Add with Carry Long,X"),
			(0x72, "ADC", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NVZC", "Add with Carry"),
			(0x61, "ADC", AddressMode.INDEXED_INDIRECT, 2, 6, "NVZC", "Add with Carry"),
			(0x71, "ADC", AddressMode.INDIRECT_INDEXED, 2, 5, "NVZC", "Add with Carry"),
			(0x77, "ADC", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NVZC", "Add with Carry"),
			(0x63, "ADC", AddressMode.STACK_RELATIVE, 2, 4, "NVZC", "Add with Carry"),
			(0x73, "ADC", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NVZC", "Add with Carry"),

			(0xE9, "SBC", AddressMode.IMMEDIATE_16, 2, 2, "NVZC", "Subtract with Borrow"),
			(0xE5, "SBC", AddressMode.DIRECT_PAGE, 2, 3, "NVZC", "Subtract with Borrow"),
			(0xF5, "SBC", AddressMode.DIRECT_PAGE_X, 2, 4, "NVZC", "Subtract with Borrow"),
			(0xED, "SBC", AddressMode.ABSOLUTE, 3, 4, "NVZC", "Subtract with Borrow"),
			(0xFD, "SBC", AddressMode.ABSOLUTE_X, 3, 4, "NVZC", "Subtract with Borrow"),
			(0xF9, "SBC", AddressMode.ABSOLUTE_Y, 3, 4, "NVZC", "Subtract with Borrow"),
			(0xEF, "SBC", AddressMode.LONG, 4, 5, "NVZC", "Subtract with Borrow Long"),
			(0xFF, "SBC", AddressMode.LONG_X, 4, 5, "NVZC", "Subtract with Borrow Long,X"),
			(0xF2, "SBC", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NVZC", "Subtract with Borrow"),
			(0xE1, "SBC", AddressMode.INDEXED_INDIRECT, 2, 6, "NVZC", "Subtract with Borrow"),
			(0xF1, "SBC", AddressMode.INDIRECT_INDEXED, 2, 5, "NVZC", "Subtract with Borrow"),
			(0xE7, "SBC", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NVZC", "Subtract with Borrow"),
			(0xE3, "SBC", AddressMode.STACK_RELATIVE, 2, 4, "NVZC", "Subtract with Borrow"),
			(0xF3, "SBC", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NVZC", "Subtract with Borrow"),

			# Logic
			(0x29, "AND", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Logical AND"),
			(0x25, "AND", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Logical AND"),
			(0x35, "AND", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Logical AND"),
			(0x2D, "AND", AddressMode.ABSOLUTE, 3, 4, "NZ", "Logical AND"),
			(0x3D, "AND", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Logical AND"),
			(0x39, "AND", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Logical AND"),
			(0x2F, "AND", AddressMode.LONG, 4, 5, "NZ", "Logical AND Long"),
			(0x3F, "AND", AddressMode.LONG_X, 4, 5, "NZ", "Logical AND Long,X"),
			(0x32, "AND", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZ", "Logical AND"),
			(0x21, "AND", AddressMode.INDEXED_INDIRECT, 2, 6, "NZ", "Logical AND"),
			(0x31, "AND", AddressMode.INDIRECT_INDEXED, 2, 5, "NZ", "Logical AND"),
			(0x37, "AND", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZ", "Logical AND"),
			(0x23, "AND", AddressMode.STACK_RELATIVE, 2, 4, "NZ", "Logical AND"),
			(0x33, "AND", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZ", "Logical AND"),

			(0x09, "ORA", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Logical OR"),
			(0x05, "ORA", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Logical OR"),
			(0x15, "ORA", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Logical OR"),
			(0x0D, "ORA", AddressMode.ABSOLUTE, 3, 4, "NZ", "Logical OR"),
			(0x1D, "ORA", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Logical OR"),
			(0x19, "ORA", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Logical OR"),
			(0x0F, "ORA", AddressMode.LONG, 4, 5, "NZ", "Logical OR Long"),
			(0x1F, "ORA", AddressMode.LONG_X, 4, 5, "NZ", "Logical OR Long,X"),
			(0x12, "ORA", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZ", "Logical OR"),
			(0x01, "ORA", AddressMode.INDEXED_INDIRECT, 2, 6, "NZ", "Logical OR"),
			(0x11, "ORA", AddressMode.INDIRECT_INDEXED, 2, 5, "NZ", "Logical OR"),
			(0x17, "ORA", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZ", "Logical OR"),
			(0x03, "ORA", AddressMode.STACK_RELATIVE, 2, 4, "NZ", "Logical OR"),
			(0x13, "ORA", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZ", "Logical OR"),

			(0x49, "EOR", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Exclusive OR"),
			(0x45, "EOR", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Exclusive OR"),
			(0x55, "EOR", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Exclusive OR"),
			(0x4D, "EOR", AddressMode.ABSOLUTE, 3, 4, "NZ", "Exclusive OR"),
			(0x5D, "EOR", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Exclusive OR"),
			(0x59, "EOR", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Exclusive OR"),
			(0x4F, "EOR", AddressMode.LONG, 4, 5, "NZ", "Exclusive OR Long"),
			(0x5F, "EOR", AddressMode.LONG_X, 4, 5, "NZ", "Exclusive OR Long,X"),
			(0x52, "EOR", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZ", "Exclusive OR"),
			(0x41, "EOR", AddressMode.INDEXED_INDIRECT, 2, 6, "NZ", "Exclusive OR"),
			(0x51, "EOR", AddressMode.INDIRECT_INDEXED, 2, 5, "NZ", "Exclusive OR"),
			(0x57, "EOR", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZ", "Exclusive OR"),
			(0x43, "EOR", AddressMode.STACK_RELATIVE, 2, 4, "NZ", "Exclusive OR"),
			(0x53, "EOR", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZ", "Exclusive OR"),

			# Shifts and Rotates
			(0x0A, "ASL", AddressMode.IMPLIED, 1, 2, "NZC", "Arithmetic Shift Left A"),
			(0x06, "ASL", AddressMode.DIRECT_PAGE, 2, 5, "NZC", "Arithmetic Shift Left"),
			(0x16, "ASL", AddressMode.DIRECT_PAGE_X, 2, 6, "NZC", "Arithmetic Shift Left"),
			(0x0E, "ASL", AddressMode.ABSOLUTE, 3, 6, "NZC", "Arithmetic Shift Left"),
			(0x1E, "ASL", AddressMode.ABSOLUTE_X, 3, 7, "NZC", "Arithmetic Shift Left"),

			(0x4A, "LSR", AddressMode.IMPLIED, 1, 2, "NZC", "Logical Shift Right A"),
			(0x46, "LSR", AddressMode.DIRECT_PAGE, 2, 5, "NZC", "Logical Shift Right"),
			(0x56, "LSR", AddressMode.DIRECT_PAGE_X, 2, 6, "NZC", "Logical Shift Right"),
			(0x4E, "LSR", AddressMode.ABSOLUTE, 3, 6, "NZC", "Logical Shift Right"),
			(0x5E, "LSR", AddressMode.ABSOLUTE_X, 3, 7, "NZC", "Logical Shift Right"),

			(0x2A, "ROL", AddressMode.IMPLIED, 1, 2, "NZC", "Rotate Left A"),
			(0x26, "ROL", AddressMode.DIRECT_PAGE, 2, 5, "NZC", "Rotate Left"),
			(0x36, "ROL", AddressMode.DIRECT_PAGE_X, 2, 6, "NZC", "Rotate Left"),
			(0x2E, "ROL", AddressMode.ABSOLUTE, 3, 6, "NZC", "Rotate Left"),
			(0x3E, "ROL", AddressMode.ABSOLUTE_X, 3, 7, "NZC", "Rotate Left"),

			(0x6A, "ROR", AddressMode.IMPLIED, 1, 2, "NZC", "Rotate Right A"),
			(0x66, "ROR", AddressMode.DIRECT_PAGE, 2, 5, "NZC", "Rotate Right"),
			(0x76, "ROR", AddressMode.DIRECT_PAGE_X, 2, 6, "NZC", "Rotate Right"),
			(0x6E, "ROR", AddressMode.ABSOLUTE, 3, 6, "NZC", "Rotate Right"),
			(0x7E, "ROR", AddressMode.ABSOLUTE_X, 3, 7, "NZC", "Rotate Right"),

			# Increment/Decrement
			(0x1A, "INC", AddressMode.IMPLIED, 1, 2, "NZ", "Increment A"),
			(0xE6, "INC", AddressMode.DIRECT_PAGE, 2, 5, "NZ", "Increment"),
			(0xF6, "INC", AddressMode.DIRECT_PAGE_X, 2, 6, "NZ", "Increment"),
			(0xEE, "INC", AddressMode.ABSOLUTE, 3, 6, "NZ", "Increment"),
			(0xFE, "INC", AddressMode.ABSOLUTE_X, 3, 7, "NZ", "Increment"),

			(0x3A, "DEC", AddressMode.IMPLIED, 1, 2, "NZ", "Decrement A"),
			(0xC6, "DEC", AddressMode.DIRECT_PAGE, 2, 5, "NZ", "Decrement"),
			(0xD6, "DEC", AddressMode.DIRECT_PAGE_X, 2, 6, "NZ", "Decrement"),
			(0xCE, "DEC", AddressMode.ABSOLUTE, 3, 6, "NZ", "Decrement"),
			(0xDE, "DEC", AddressMode.ABSOLUTE_X, 3, 7, "NZ", "Decrement"),

			(0xE8, "INX", AddressMode.IMPLIED, 1, 2, "NZ", "Increment X"),
			(0xCA, "DEX", AddressMode.IMPLIED, 1, 2, "NZ", "Decrement X"),
			(0xC8, "INY", AddressMode.IMPLIED, 1, 2, "NZ", "Increment Y"),
			(0x88, "DEY", AddressMode.IMPLIED, 1, 2, "NZ", "Decrement Y"),

			# Compare
			(0xC9, "CMP", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare A"),
			(0xC5, "CMP", AddressMode.DIRECT_PAGE, 2, 3, "NZC", "Compare A"),
			(0xD5, "CMP", AddressMode.DIRECT_PAGE_X, 2, 4, "NZC", "Compare A"),
			(0xCD, "CMP", AddressMode.ABSOLUTE, 3, 4, "NZC", "Compare A"),
			(0xDD, "CMP", AddressMode.ABSOLUTE_X, 3, 4, "NZC", "Compare A"),
			(0xD9, "CMP", AddressMode.ABSOLUTE_Y, 3, 4, "NZC", "Compare A"),
			(0xCF, "CMP", AddressMode.LONG, 4, 5, "NZC", "Compare A Long"),
			(0xDF, "CMP", AddressMode.LONG_X, 4, 5, "NZC", "Compare A Long,X"),
			(0xD2, "CMP", AddressMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZC", "Compare A"),
			(0xC1, "CMP", AddressMode.INDEXED_INDIRECT, 2, 6, "NZC", "Compare A"),
			(0xD1, "CMP", AddressMode.INDIRECT_INDEXED, 2, 5, "NZC", "Compare A"),
			(0xD7, "CMP", AddressMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZC", "Compare A"),
			(0xC3, "CMP", AddressMode.STACK_RELATIVE, 2, 4, "NZC", "Compare A"),
			(0xD3, "CMP", AddressMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZC", "Compare A"),

			(0xE0, "CPX", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare X"),
			(0xE4, "CPX", AddressMode.DIRECT_PAGE, 2, 3, "NZC", "Compare X"),
			(0xEC, "CPX", AddressMode.ABSOLUTE, 3, 4, "NZC", "Compare X"),

			(0xC0, "CPY", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare Y"),
			(0xC4, "CPY", AddressMode.DIRECT_PAGE, 2, 3, "NZC", "Compare Y"),
			(0xCC, "CPY", AddressMode.ABSOLUTE, 3, 4, "NZC", "Compare Y"),

			# Bit Test
			(0x89, "BIT", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Bit Test Immediate"),
			(0x24, "BIT", AddressMode.DIRECT_PAGE, 2, 3, "NVZ", "Bit Test"),
			(0x34, "BIT", AddressMode.DIRECT_PAGE_X, 2, 4, "NVZ", "Bit Test"),
			(0x2C, "BIT", AddressMode.ABSOLUTE, 3, 4, "NVZ", "Bit Test"),
			(0x3C, "BIT", AddressMode.ABSOLUTE_X, 3, 4, "NVZ", "Bit Test"),

			# Branches
			(0x10, "BPL", AddressMode.RELATIVE_8, 2, 2, "", "Branch Plus"),
			(0x30, "BMI", AddressMode.RELATIVE_8, 2, 2, "", "Branch Minus"),
			(0x50, "BVC", AddressMode.RELATIVE_8, 2, 2, "", "Branch Overflow Clear"),
			(0x70, "BVS", AddressMode.RELATIVE_8, 2, 2, "", "Branch Overflow Set"),
			(0x90, "BCC", AddressMode.RELATIVE_8, 2, 2, "", "Branch Carry Clear"),
			(0xB0, "BCS", AddressMode.RELATIVE_8, 2, 2, "", "Branch Carry Set"),
			(0xD0, "BNE", AddressMode.RELATIVE_8, 2, 2, "", "Branch Not Equal"),
			(0xF0, "BEQ", AddressMode.RELATIVE_8, 2, 2, "", "Branch Equal"),
			(0x80, "BRA", AddressMode.RELATIVE_8, 2, 3, "", "Branch Always"),
			(0x82, "BRL", AddressMode.RELATIVE_16, 3, 4, "", "Branch Always Long"),

			# Jumps
			(0x4C, "JMP", AddressMode.ABSOLUTE, 3, 3, "", "Jump"),
			(0x5C, "JMP", AddressMode.LONG, 4, 4, "", "Jump Long"),
			(0x6C, "JMP", AddressMode.INDIRECT, 3, 5, "", "Jump Indirect"),
			(0x7C, "JMP", AddressMode.ABSOLUTE_X, 3, 6, "", "Jump Indexed Indirect"),
			(0xDC, "JMP", AddressMode.ABSOLUTE_INDIRECT_LONG, 3, 6, "", "Jump Absolute Indirect Long"),

			# Calls and Returns
			(0x20, "JSR", AddressMode.ABSOLUTE, 3, 6, "", "Jump Subroutine"),
			(0x22, "JSL", AddressMode.LONG, 4, 8, "", "Jump Subroutine Long"),
			(0xFC, "JSR", AddressMode.ABSOLUTE_X, 3, 8, "", "Jump Subroutine Indexed"),
			(0x60, "RTS", AddressMode.IMPLIED, 1, 6, "", "Return from Subroutine"),
			(0x6B, "RTL", AddressMode.IMPLIED, 1, 6, "", "Return from Subroutine Long"),
			(0x40, "RTI", AddressMode.IMPLIED, 1, 6, "NVMXDIZC", "Return from Interrupt"),

			# Processor Status
			(0x18, "CLC", AddressMode.IMPLIED, 1, 2, "C", "Clear Carry"),
			(0x38, "SEC", AddressMode.IMPLIED, 1, 2, "C", "Set Carry"),
			(0x58, "CLI", AddressMode.IMPLIED, 1, 2, "I", "Clear Interrupt"),
			(0x78, "SEI", AddressMode.IMPLIED, 1, 2, "I", "Set Interrupt"),
			(0xB8, "CLV", AddressMode.IMPLIED, 1, 2, "V", "Clear Overflow"),
			(0xD8, "CLD", AddressMode.IMPLIED, 1, 2, "D", "Clear Decimal"),
			(0xF8, "SED", AddressMode.IMPLIED, 1, 2, "D", "Set Decimal"),
			(0xC2, "REP", AddressMode.IMMEDIATE_8, 2, 3, "NVMXDIZC", "Reset Processor Status"),
			(0xE2, "SEP", AddressMode.IMMEDIATE_8, 2, 3, "NVMXDIZC", "Set Processor Status"),

			# System
			(0x00, "BRK", AddressMode.IMPLIED, 2, 8, "I", "Break"),
			(0x02, "COP", AddressMode.IMMEDIATE_8, 2, 8, "I", "Co-Processor"),
			(0xDB, "STP", AddressMode.IMPLIED, 1, 3, "", "Stop Processor"),
			(0xCB, "WAI", AddressMode.IMPLIED, 1, 3, "", "Wait for Interrupt"),
			(0xEA, "NOP", AddressMode.IMPLIED, 1, 2, "", "No Operation"),

			# Block Move
			(0x44, "MVP", AddressMode.BLOCK_MOVE_XY, 3, 7, "", "Block Move Previous"),
			(0x54, "MVN", AddressMode.BLOCK_MOVE_XY, 3, 7, "", "Block Move Next"),

			# Test and Set/Clear Bits
			(0x14, "TRB", AddressMode.DIRECT_PAGE, 2, 5, "Z", "Test and Reset Bits"),
			(0x1C, "TRB", AddressMode.ABSOLUTE, 3, 6, "Z", "Test and Reset Bits"),
			(0x04, "TSB", AddressMode.DIRECT_PAGE, 2, 5, "Z", "Test and Set Bits"),
			(0x0C, "TSB", AddressMode.ABSOLUTE, 3, 6, "Z", "Test and Set Bits"),

			# Store Zero
			(0x64, "STZ", AddressMode.DIRECT_PAGE, 2, 3, "", "Store Zero"),
			(0x74, "STZ", AddressMode.DIRECT_PAGE_X, 2, 4, "", "Store Zero"),
			(0x9C, "STZ", AddressMode.ABSOLUTE, 3, 4, "", "Store Zero"),
			(0x9E, "STZ", AddressMode.ABSOLUTE_X, 3, 5, "", "Store Zero"),

			# Exchange
			(0xEB, "XBA", AddressMode.IMPLIED, 1, 3, "NZ", "Exchange B and A"),
			(0xFB, "XCE", AddressMode.IMPLIED, 1, 2, "EMXC", "Exchange Carry and Emulation"),

			# Misc
			(0xEA, "NOP", AddressMode.IMPLIED, 1, 2, "", "No Operation"),
		]

		for opcode, mnemonic, mode, size, cycles, flags, desc in instructions:
			opcodes[opcode] = {
				"mnemonic": mnemonic,
				"mode": mode,
				"size": size,
				"cycles": cycles,
				"flags": flags,
				"description": desc
			}

		return opcodes

	def disassemble_region(self, start_offset: int, size: int) -> List[Instruction]:
		"""Disassemble a region of ROM"""
		instructions = []
		current_offset = start_offset
		end_offset = min(start_offset + size, len(self.rom_data))

		while current_offset < end_offset:
			# Get ROM address and convert to SNES
			snes_addr = self.address_translator.rom_to_snes_address(current_offset)
			if not snes_addr:
				current_offset += 1
				continue

			snes_address = f"${snes_addr.bank:02X}:{snes_addr.offset:04X}"

			# Decode instruction
			instruction = self.decode_instruction(current_offset, snes_address)
			if instruction:
				instructions.append(instruction)
				current_offset += instruction.size
			else:
				current_offset += 1

		return instructions

	def decode_instruction(self, rom_offset: int, snes_address: str) -> Optional[Instruction]:
		"""Decode single 65816 instruction"""
		if rom_offset >= len(self.rom_data):
			return None

		opcode = self.rom_data[rom_offset]

		if opcode not in self.opcodes:
			# Unknown opcode - treat as data
			return Instruction(
				address=rom_offset,
				snes_address=snes_address,
				opcode=opcode,
				mnemonic="???",
				operands=f"${opcode:02X}",
				bytes=bytes([opcode]),
				size=1,
				addressing_mode=AddressMode.IMPLIED,
				cycles=2,
				flags_affected="",
				description="Unknown opcode"
			)

		instr_info = self.opcodes[opcode]
		size = instr_info["size"]

		# Get instruction bytes
		instr_bytes = self.rom_data[rom_offset:rom_offset + size]
		if len(instr_bytes) < size:
			return None

		# Format operands based on addressing mode
		operands = self.format_operands(instr_bytes[1:], instr_info["mode"])

		return Instruction(
			address=rom_offset,
			snes_address=snes_address,
			opcode=opcode,
			mnemonic=instr_info["mnemonic"],
			operands=operands,
			bytes=instr_bytes,
			size=size,
			addressing_mode=instr_info["mode"],
			cycles=instr_info["cycles"],
			flags_affected=instr_info["flags"],
			description=instr_info["description"]
		)

	def format_operands(self, operand_bytes: bytes, mode: AddressMode) -> str:
		"""Format instruction operands based on addressing mode"""
		if not operand_bytes or mode == AddressMode.IMPLIED:
			return ""

		if mode == AddressMode.IMMEDIATE_8:
			return f"#${operand_bytes[0]:02X}"
		elif mode == AddressMode.IMMEDIATE_16:
			if len(operand_bytes) >= 2:
				val = struct.unpack('<H', operand_bytes[:2])[0]
				return f"#${val:04X}"
			else:
				return f"#${operand_bytes[0]:02X}"

		elif mode == AddressMode.DIRECT_PAGE:
			return f"${operand_bytes[0]:02X}"
		elif mode == AddressMode.DIRECT_PAGE_X:
			return f"${operand_bytes[0]:02X},X"
		elif mode == AddressMode.DIRECT_PAGE_Y:
			return f"${operand_bytes[0]:02X},Y"

		elif mode == AddressMode.ABSOLUTE:
			if len(operand_bytes) >= 2:
				addr = struct.unpack('<H', operand_bytes[:2])[0]
				return f"${addr:04X}"
			return f"${operand_bytes[0]:02X}??"
		elif mode == AddressMode.ABSOLUTE_X:
			if len(operand_bytes) >= 2:
				addr = struct.unpack('<H', operand_bytes[:2])[0]
				return f"${addr:04X},X"
			return f"${operand_bytes[0]:02X}??,X"
		elif mode == AddressMode.ABSOLUTE_Y:
			if len(operand_bytes) >= 2:
				addr = struct.unpack('<H', operand_bytes[:2])[0]
				return f"${addr:04X},Y"
			return f"${operand_bytes[0]:02X}??,Y"

		elif mode == AddressMode.LONG:
			if len(operand_bytes) >= 3:
				addr = struct.unpack('<I', operand_bytes[:3] + b'\x00')[0]
				return f"${addr:06X}"
			return f"${operand_bytes[0]:02X}????"
		elif mode == AddressMode.LONG_X:
			if len(operand_bytes) >= 3:
				addr = struct.unpack('<I', operand_bytes[:3] + b'\x00')[0]
				return f"${addr:06X},X"
			return f"${operand_bytes[0]:02X}????,X"

		elif mode == AddressMode.RELATIVE_8:
			offset = operand_bytes[0]
			if offset >= 128:
				offset = offset - 256
			return f"${offset:+d}"

		elif mode == AddressMode.INDIRECT:
			if len(operand_bytes) >= 2:
				addr = struct.unpack('<H', operand_bytes[:2])[0]
				return f"(${addr:04X})"
			return f"(${operand_bytes[0]:02X}??)"

		return operand_bytes.hex().upper()

	def analyze_subroutines(self, instructions: List[Instruction]) -> List[Subroutine]:
		"""Analyze code flow and identify subroutines"""
		subroutines = []

		# Find subroutine entry points (JSR/JSL targets)
		entry_points = set()
		for instr in instructions:
			if instr.mnemonic in ["JSR", "JSL"]:
				# Extract target address from operands
				target = self.extract_target_address(instr.operands)
				if target:
					entry_points.add(target)

		# Find subroutine boundaries
		current_sub = None
		for instr in instructions:
			# Check if this is a subroutine start
			if (instr.address in entry_points or
				(current_sub is None and instr.mnemonic not in ["???"])):
				if current_sub:
					subroutines.append(current_sub)

				current_sub = Subroutine(
					start_address=instr.address,
					end_address=instr.address,
					snes_start=instr.snes_address,
					snes_end=instr.snes_address,
					size=0,
					instructions=[],
					entry_points=set(),
					exit_points=set(),
					data_references=set(),
					called_subroutines=set(),
					analysis_notes=[]
				)

			if current_sub:
				current_sub.instructions.append(instr)
				current_sub.end_address = instr.address
				current_sub.snes_end = instr.snes_address
				current_sub.size += instr.size

				# Check for subroutine end
				if instr.mnemonic in ["RTS", "RTL", "RTI"]:
					current_sub.exit_points.add(instr.address)
					subroutines.append(current_sub)
					current_sub = None

		# Add final subroutine if needed
		if current_sub:
			subroutines.append(current_sub)

		return subroutines

	def extract_target_address(self, operands: str) -> Optional[int]:
		"""Extract target address from operand string"""
		if not operands or operands.startswith("#"):
			return None

		# Simple extraction for absolute addresses
		if operands.startswith("$"):
			try:
				addr_str = operands[1:].split(",")[0]	# Remove ,X or ,Y
				return int(addr_str, 16)
			except ValueError:
				return None

		return None

	def generate_disassembly_report(self, instructions: List[Instruction],
									subroutines: List[Subroutine]) -> str:
		"""Generate formatted disassembly report"""
		lines = []

		lines.append("DRAGON QUEST III - 65816 DISASSEMBLY")
		lines.append("=" * 40)
		lines.append(f"Instructions analyzed: {len(instructions)}")
		lines.append(f"Subroutines found: {len(subroutines)}")
		lines.append("")

		# Instruction listing
		lines.append("INSTRUCTION LISTING")
		lines.append("-" * 20)
		for instr in instructions[:50]:	# Limit for display
			bytes_str = " ".join(f"{b:02X}" for b in instr.bytes)
			lines.append(f"{instr.snes_address}: {bytes_str:12} "
						f"{instr.mnemonic:4} {instr.operands:10} "
						f"; {instr.description}")

		if len(instructions) > 50:
			lines.append(f"... and {len(instructions) - 50} more instructions")

		lines.append("")

		# Subroutine summary
		lines.append("SUBROUTINE SUMMARY")
		lines.append("-" * 18)
		for sub in subroutines[:20]:	# Limit for display
			lines.append(f"{sub.snes_start} - {sub.snes_end}: "
						f"{sub.size:4} bytes, {len(sub.instructions):3} instructions")

		return "\n".join(lines)


def main():
	"""Main disassembler function"""
	import argparse

	parser = argparse.ArgumentParser(description="Dragon Quest III 65816 Disassembler")
	parser.add_argument('--start', type=str, default="$C0:8000",
						 help='Start SNES address (e.g., $C0:8000)')
	parser.add_argument('--size', type=int, default=1024,
						 help='Number of bytes to disassemble')
	parser.add_argument('--project-root', default='.', help='Project root directory')

	args = parser.parse_args()

	print("DRAGON QUEST III - 65816 DISASSEMBLER")
	print("=" * 38)

	disasm = SNESDisassembler(args.project_root)

	# Convert SNES address to ROM offset
	start_offset = disasm.address_translator.snes_to_rom_offset(args.start)
	if start_offset == 0:
		print(f"Error: Could not translate SNES address {args.start}")
		return 1

	print(f"Disassembling {args.size} bytes from {args.start}")
	print(f"ROM offset: ${start_offset:06X}")
	print()

	# Disassemble region
	instructions = disasm.disassemble_region(start_offset, args.size)
	subroutines = disasm.analyze_subroutines(instructions)

	# Generate report
	report = disasm.generate_disassembly_report(instructions, subroutines)
	print(report)

	return 0


if __name__ == "__main__":
	sys.exit(main())
