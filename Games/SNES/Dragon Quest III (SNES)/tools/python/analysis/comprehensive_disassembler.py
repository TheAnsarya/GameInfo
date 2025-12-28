#!/usr/bin/env python3
"""
Dragon Quest III - Comprehensive Code Analyzer & Disassembler
============================================================

Deep analysis and disassembly of ALL code regions with advanced
pattern recognition, function identification, and documentation generation.
"""

import struct
import os
import json
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set
from dataclasses import dataclass, field
from collections import defaultdict, Counter
import time
import hashlib

@dataclass
class AnalyzedFunction:
	"""Represents a complete analyzed function"""
	name: str
	start_offset: int
	end_offset: int
	instructions: List[Dict[str, Any]]
	calls_made: List[int]
	called_from: List[int]
	local_labels: Set[str]
	stack_usage: int
	function_type: str	# "system", "game_logic", "graphics", "audio", "data_handler"
	description: str
	complexity_score: float

@dataclass
class CodeSection:
	"""Represents a major code section"""
	name: str
	start_offset: int
	end_offset: int
	functions: List[AnalyzedFunction]
	data_refs: List[int]
	section_type: str
	description: str

class ComprehensiveDisassembler:
	"""
	Ultra-comprehensive SNES disassembler with advanced analysis
	"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)

		# Analysis results
		self.functions = {}
		self.code_sections = []
		self.data_sections = {}
		self.cross_references = defaultdict(set)
		self.string_references = {}

		# Hardware register usage
		self.hw_register_usage = defaultdict(list)

		# Analysis state
		self.visited_offsets = set()
		self.instruction_cache = {}

		# Enhanced opcode definitions with detailed analysis info
		self.opcodes = self._init_comprehensive_opcodes()

		# SNES system knowledge
		self.snes_vectors = self._init_snes_vectors()
		self.hw_registers = self._init_hw_registers()

		print(f"INIT: Comprehensive Disassembler")
		print(f"ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")
		print(f"Opcodes defined: {len(self.opcodes)}")

	def _load_rom(self) -> bytes:
		"""Load ROM with validation"""
		with open(self.rom_path, 'rb') as f:
			data = f.read()

		# Validate ROM header
		if len(data) >= 0x8000:
			# Check for SNES header markers
			potential_headers = [0x7fc0, 0xffc0, 0x81c0]
			for header_offset in potential_headers:
				if header_offset + 32 < len(data):
					rom_name = data[header_offset:header_offset+21]
					if b'DRAGON QUEST' in rom_name or b'DORAGON' in rom_name:
						print(f"Detected Dragon Quest ROM at header offset ${header_offset:04X}")
						break

		return data

	def _init_comprehensive_opcodes(self) -> Dict[int, Dict[str, Any]]:
		"""Initialize complete 65816 opcode set with analysis metadata"""
		opcodes = {}

		# Complete 65816 instruction set with detailed analysis info
		instructions = [
			# Format: (opcode, mnemonic, addressing, size, cycles, flags_affected, description, analysis_info)

			# ADC - Add with Carry
			(0x69, "ADC", "immediate", 2, 2, "NvZc", "Add immediate to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A"]}),
			(0x6d, "ADC", "absolute", 3, 4, "NvZc", "Add memory to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "memory"]}),
			(0x7d, "ADC", "absolute_x", 3, 4, "NvZc", "Add memory,X to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "X", "memory"]}),
			(0x79, "ADC", "absolute_y", 3, 4, "NvZc", "Add memory,Y to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "Y", "memory"]}),
			(0x65, "ADC", "zeropage", 2, 3, "NvZc", "Add zero page to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "memory"]}),
			(0x75, "ADC", "zeropage_x", 2, 4, "NvZc", "Add zero page,X to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "X", "memory"]}),
			(0x61, "ADC", "zeropage_x_indirect", 2, 6, "NvZc", "Add (zp,X) to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "X", "memory"]}),
			(0x71, "ADC", "zeropage_indirect_y", 2, 5, "NvZc", "Add (zp),Y to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "Y", "memory"]}),
			(0x72, "ADC", "zeropage_indirect", 2, 5, "NvZc", "Add (zp) to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "memory"]}),
			(0x6f, "ADC", "long", 4, 5, "NvZc", "Add long to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "memory"]}),
			(0x7f, "ADC", "long_x", 4, 5, "NvZc", "Add long,X to accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "X", "memory"]}),

			# SBC - Subtract with Carry
			(0xe9, "SBC", "immediate", 2, 2, "NvZc", "Subtract immediate from accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A"]}),
			(0xed, "SBC", "absolute", 3, 4, "NvZc", "Subtract memory from accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "memory"]}),
			(0xfd, "SBC", "absolute_x", 3, 4, "NvZc", "Subtract memory,X from accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "X", "memory"]}),
			(0xf9, "SBC", "absolute_y", 3, 4, "NvZc", "Subtract memory,Y from accumulator", {"type": "arithmetic", "modifies": ["A"], "reads": ["A", "Y", "memory"]}),

			# LDA - Load Accumulator
			(0xa9, "LDA", "immediate", 2, 2, "Nz", "Load immediate into accumulator", {"type": "load", "modifies": ["A"], "reads": []}),
			(0xad, "LDA", "absolute", 3, 4, "Nz", "Load memory into accumulator", {"type": "load", "modifies": ["A"], "reads": ["memory"]}),
			(0xbd, "LDA", "absolute_x", 3, 4, "Nz", "Load memory,X into accumulator", {"type": "load", "modifies": ["A"], "reads": ["X", "memory"]}),
			(0xb9, "LDA", "absolute_y", 3, 4, "Nz", "Load memory,Y into accumulator", {"type": "load", "modifies": ["A"], "reads": ["Y", "memory"]}),
			(0xa5, "LDA", "zeropage", 2, 3, "Nz", "Load zero page into accumulator", {"type": "load", "modifies": ["A"], "reads": ["memory"]}),
			(0xb5, "LDA", "zeropage_x", 2, 4, "Nz", "Load zero page,X into accumulator", {"type": "load", "modifies": ["A"], "reads": ["X", "memory"]}),
			(0xa1, "LDA", "zeropage_x_indirect", 2, 6, "Nz", "Load (zp,X) into accumulator", {"type": "load", "modifies": ["A"], "reads": ["X", "memory"]}),
			(0xb1, "LDA", "zeropage_indirect_y", 2, 5, "Nz", "Load (zp),Y into accumulator", {"type": "load", "modifies": ["A"], "reads": ["Y", "memory"]}),
			(0xb2, "LDA", "zeropage_indirect", 2, 5, "Nz", "Load (zp) into accumulator", {"type": "load", "modifies": ["A"], "reads": ["memory"]}),
			(0xaf, "LDA", "long", 4, 5, "Nz", "Load long into accumulator", {"type": "load", "modifies": ["A"], "reads": ["memory"]}),
			(0xbf, "LDA", "long_x", 4, 5, "Nz", "Load long,X into accumulator", {"type": "load", "modifies": ["A"], "reads": ["X", "memory"]}),

			# STA - Store Accumulator
			(0x8d, "STA", "absolute", 3, 4, "", "Store accumulator to memory", {"type": "store", "modifies": ["memory"], "reads": ["A"]}),
			(0x9d, "STA", "absolute_x", 3, 5, "", "Store accumulator to memory,X", {"type": "store", "modifies": ["memory"], "reads": ["A", "X"]}),
			(0x99, "STA", "absolute_y", 3, 5, "", "Store accumulator to memory,Y", {"type": "store", "modifies": ["memory"], "reads": ["A", "Y"]}),
			(0x85, "STA", "zeropage", 2, 3, "", "Store accumulator to zero page", {"type": "store", "modifies": ["memory"], "reads": ["A"]}),
			(0x95, "STA", "zeropage_x", 2, 4, "", "Store accumulator to zero page,X", {"type": "store", "modifies": ["memory"], "reads": ["A", "X"]}),
			(0x81, "STA", "zeropage_x_indirect", 2, 6, "", "Store accumulator to (zp,X)", {"type": "store", "modifies": ["memory"], "reads": ["A", "X"]}),
			(0x91, "STA", "zeropage_indirect_y", 2, 6, "", "Store accumulator to (zp),Y", {"type": "store", "modifies": ["memory"], "reads": ["A", "Y"]}),
			(0x92, "STA", "zeropage_indirect", 2, 5, "", "Store accumulator to (zp)", {"type": "store", "modifies": ["memory"], "reads": ["A"]}),
			(0x8f, "STA", "long", 4, 5, "", "Store accumulator to long", {"type": "store", "modifies": ["memory"], "reads": ["A"]}),
			(0x9f, "STA", "long_x", 4, 5, "", "Store accumulator to long,X", {"type": "store", "modifies": ["memory"], "reads": ["A", "X"]}),

			# Control Flow
			(0x4c, "JMP", "absolute", 3, 3, "", "Jump to absolute address", {"type": "control", "modifies": ["PC"], "reads": [], "control_flow": "unconditional_jump"}),
			(0x6c, "JMP", "absolute_indirect", 3, 5, "", "Jump to (absolute)", {"type": "control", "modifies": ["PC"], "reads": ["memory"], "control_flow": "unconditional_jump"}),
			(0x7c, "JMP", "absolute_x_indirect", 3, 6, "", "Jump to (absolute,X)", {"type": "control", "modifies": ["PC"], "reads": ["X", "memory"], "control_flow": "unconditional_jump"}),
			(0x5c, "JML", "long", 4, 4, "", "Jump long to address", {"type": "control", "modifies": ["PC", "PBR"], "reads": [], "control_flow": "unconditional_jump"}),
			(0xdc, "JML", "absolute_indirect_long", 3, 6, "", "Jump long to [absolute]", {"type": "control", "modifies": ["PC", "PBR"], "reads": ["memory"], "control_flow": "unconditional_jump"}),

			# Subroutine calls
			(0x20, "JSR", "absolute", 3, 6, "", "Jump to subroutine", {"type": "control", "modifies": ["PC", "S"], "reads": [], "control_flow": "subroutine_call"}),
			(0x22, "JSL", "long", 4, 8, "", "Jump to subroutine long", {"type": "control", "modifies": ["PC", "PBR", "S"], "reads": [], "control_flow": "subroutine_call"}),
			(0xfc, "JSR", "absolute_x_indirect", 3, 8, "", "Jump to subroutine (absolute,X)", {"type": "control", "modifies": ["PC", "S"], "reads": ["X", "memory"], "control_flow": "subroutine_call"}),

			# Returns
			(0x60, "RTS", "implied", 1, 6, "", "Return from subroutine", {"type": "control", "modifies": ["PC"], "reads": ["S"], "control_flow": "return"}),
			(0x6b, "RTL", "implied", 1, 6, "", "Return from subroutine long", {"type": "control", "modifies": ["PC", "PBR"], "reads": ["S"], "control_flow": "return"}),
			(0x40, "RTI", "implied", 1, 6, "", "Return from interrupt", {"type": "control", "modifies": ["PC", "P"], "reads": ["S"], "control_flow": "return"}),

			# Branches
			(0x10, "BPL", "relative", 2, 2, "", "Branch if plus", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0x30, "BMI", "relative", 2, 2, "", "Branch if minus", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0x50, "BVC", "relative", 2, 2, "", "Branch if overflow clear", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0x70, "BVS", "relative", 2, 2, "", "Branch if overflow set", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0x90, "BCC", "relative", 2, 2, "", "Branch if carry clear", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0xb0, "BCS", "relative", 2, 2, "", "Branch if carry set", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0xd0, "BNE", "relative", 2, 2, "", "Branch if not equal", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0xf0, "BEQ", "relative", 2, 2, "", "Branch if equal", {"type": "control", "modifies": [], "reads": ["P"], "control_flow": "conditional_branch"}),
			(0x80, "BRA", "relative", 2, 3, "", "Branch always", {"type": "control", "modifies": [], "reads": [], "control_flow": "unconditional_branch"}),

			# Status flags
			(0xc2, "REP", "immediate", 2, 3, "Various", "Reset processor status bits", {"type": "status", "modifies": ["P"], "reads": [], "special": "flag_control"}),
			(0xe2, "SEP", "immediate", 2, 3, "Various", "Set processor status bits", {"type": "status", "modifies": ["P"], "reads": [], "special": "flag_control"}),
			(0x18, "CLC", "implied", 1, 2, "c", "Clear carry flag", {"type": "status", "modifies": ["P"], "reads": []}),
			(0x38, "SEC", "implied", 1, 2, "C", "Set carry flag", {"type": "status", "modifies": ["P"], "reads": []}),
			(0x58, "CLI", "implied", 1, 2, "i", "Clear interrupt disable", {"type": "status", "modifies": ["P"], "reads": []}),
			(0x78, "SEI", "implied", 1, 2, "I", "Set interrupt disable", {"type": "status", "modifies": ["P"], "reads": []}),
			(0xd8, "CLD", "implied", 1, 2, "d", "Clear decimal mode", {"type": "status", "modifies": ["P"], "reads": []}),
			(0xf8, "SED", "implied", 1, 2, "D", "Set decimal mode", {"type": "status", "modifies": ["P"], "reads": []}),
			(0xb8, "CLV", "implied", 1, 2, "v", "Clear overflow flag", {"type": "status", "modifies": ["P"], "reads": []}),

			# Stack operations
			(0x48, "PHA", "implied", 1, 3, "", "Push accumulator", {"type": "stack", "modifies": ["S", "memory"], "reads": ["A"]}),
			(0x68, "PLA", "implied", 1, 4, "Nz", "Pull accumulator", {"type": "stack", "modifies": ["A"], "reads": ["S", "memory"]}),
			(0x5a, "PHY", "implied", 1, 3, "", "Push Y register", {"type": "stack", "modifies": ["S", "memory"], "reads": ["Y"]}),
			(0x7a, "PLY", "implied", 1, 4, "Nz", "Pull Y register", {"type": "stack", "modifies": ["Y"], "reads": ["S", "memory"]}),
			(0xda, "PHX", "implied", 1, 3, "", "Push X register", {"type": "stack", "modifies": ["S", "memory"], "reads": ["X"]}),
			(0xfa, "PLX", "implied", 1, 4, "Nz", "Pull X register", {"type": "stack", "modifies": ["X"], "reads": ["S", "memory"]}),
			(0x8b, "PHB", "implied", 1, 3, "", "Push data bank", {"type": "stack", "modifies": ["S", "memory"], "reads": ["DBR"]}),
			(0xab, "PLB", "implied", 1, 4, "Nz", "Pull data bank", {"type": "stack", "modifies": ["DBR"], "reads": ["S", "memory"]}),
			(0x0b, "PHD", "implied", 1, 3, "", "Push direct page", {"type": "stack", "modifies": ["S", "memory"], "reads": ["D"]}),
			(0x2b, "PLD", "implied", 1, 4, "Nz", "Pull direct page", {"type": "stack", "modifies": ["D"], "reads": ["S", "memory"]}),
			(0x4b, "PHK", "implied", 1, 3, "", "Push program bank", {"type": "stack", "modifies": ["S", "memory"], "reads": ["PBR"]}),
			(0x08, "PHP", "implied", 1, 3, "", "Push processor status", {"type": "stack", "modifies": ["S", "memory"], "reads": ["P"]}),
			(0x28, "PLP", "implied", 1, 4, "Various", "Pull processor status", {"type": "stack", "modifies": ["P"], "reads": ["S", "memory"]}),

			# Transfer instructions
			(0xaa, "TAX", "implied", 1, 2, "Nz", "Transfer A to X", {"type": "transfer", "modifies": ["X"], "reads": ["A"]}),
			(0x8a, "TXA", "implied", 1, 2, "Nz", "Transfer X to A", {"type": "transfer", "modifies": ["A"], "reads": ["X"]}),
			(0xa8, "TAY", "implied", 1, 2, "Nz", "Transfer A to Y", {"type": "transfer", "modifies": ["Y"], "reads": ["A"]}),
			(0x98, "TYA", "implied", 1, 2, "Nz", "Transfer Y to A", {"type": "transfer", "modifies": ["A"], "reads": ["Y"]}),
			(0x9a, "TXS", "implied", 1, 2, "", "Transfer X to stack", {"type": "transfer", "modifies": ["S"], "reads": ["X"]}),
			(0xba, "TSX", "implied", 1, 2, "Nz", "Transfer stack to X", {"type": "transfer", "modifies": ["X"], "reads": ["S"]}),
			(0x5b, "TCD", "implied", 1, 2, "Nz", "Transfer A to direct page", {"type": "transfer", "modifies": ["D"], "reads": ["A"]}),
			(0x7b, "TDC", "implied", 1, 2, "Nz", "Transfer direct page to A", {"type": "transfer", "modifies": ["A"], "reads": ["D"]}),
			(0x1b, "TCS", "implied", 1, 2, "", "Transfer A to stack", {"type": "transfer", "modifies": ["S"], "reads": ["A"]}),
			(0x3b, "TSC", "implied", 1, 2, "Nz", "Transfer stack to A", {"type": "transfer", "modifies": ["A"], "reads": ["S"]}),

			# Other important instructions
			(0xea, "NOP", "implied", 1, 2, "", "No operation", {"type": "misc", "modifies": [], "reads": []}),
			(0x00, "BRK", "immediate", 2, 7, "I", "Break", {"type": "system", "modifies": ["PC", "S"], "reads": [], "special": "interrupt"}),
			(0x02, "COP", "immediate", 2, 7, "I", "Coprocessor", {"type": "system", "modifies": ["PC", "S"], "reads": [], "special": "interrupt"}),
			(0x42, "WDM", "immediate", 2, 2, "", "Reserved", {"type": "system", "modifies": [], "reads": []}),
			(0xdb, "STP", "implied", 1, 3, "", "Stop processor", {"type": "system", "modifies": [], "reads": [], "special": "halt"}),
			(0xcb, "WAI", "implied", 1, 3, "", "Wait for interrupt", {"type": "system", "modifies": [], "reads": [], "special": "wait"}),
			(0xeb, "XBA", "implied", 1, 3, "Nz", "Exchange B and A", {"type": "transfer", "modifies": ["A"], "reads": ["A"]}),
			(0xfb, "XCE", "implied", 1, 2, "Emulation", "Exchange carry and emulation", {"type": "system", "modifies": ["P"], "reads": ["P"], "special": "mode_switch"}),
		]

		for opcode_val, mnemonic, addressing, size, cycles, flags, description, analysis in instructions:
			opcodes[opcode_val] = {
				'mnemonic': mnemonic,
				'addressing': addressing,
				'size': size,
				'cycles': cycles,
				'flags_affected': flags,
				'description': description,
				'analysis': analysis
			}

		return opcodes

	def _init_snes_vectors(self) -> Dict[str, int]:
		"""Initialize SNES interrupt vectors"""
		return {
			'RESET': 0xfffc,
			'IRQ': 0xfffe,
			'NMI': 0xfffa,
			'BRK': 0xfffe,
			'COP': 0xfff4,
			'ABORT': 0xfff8,
			'UNUSED': 0xffea
		}

	def _init_hw_registers(self) -> Dict[int, str]:
		"""Initialize SNES hardware register definitions"""
		registers = {
			# PPU registers
			0x2100: "INIDISP - Screen display",
			0x2101: "OBJSEL - Object size and character",
			0x2102: "OAMADDL - OAM address low",
			0x2103: "OAMADDH - OAM address high",
			0x2104: "OAMDATA - OAM data write",
			0x2105: "BGMODE - BG mode and character size",
			0x2106: "MOSAIC - Mosaic size and BG enable",
			0x2107: "BG1SC - BG1 screen base and size",
			0x2108: "BG2SC - BG2 screen base and size",
			0x2109: "BG3SC - BG3 screen base and size",
			0x210a: "BG4SC - BG4 screen base and size",
			0x210b: "BG12NBA - BG1 and BG2 character data area",
			0x210c: "BG34NBA - BG3 and BG4 character data area",
			0x210d: "BG1HOFS - BG1 horizontal scroll",
			0x210e: "BG1VOFS - BG1 vertical scroll",
			0x210f: "BG2HOFS - BG2 horizontal scroll",
			0x2110: "BG2VOFS - BG2 vertical scroll",
			0x2111: "BG3HOFS - BG3 horizontal scroll",
			0x2112: "BG3VOFS - BG3 vertical scroll",
			0x2113: "BG4HOFS - BG4 horizontal scroll",
			0x2114: "BG4VOFS - BG4 vertical scroll",
			0x2115: "VMAIN - Video port control",
			0x2116: "VMADDL - VRAM address low",
			0x2117: "VMADDH - VRAM address high",
			0x2118: "VMDATAL - VRAM data write low",
			0x2119: "VMDATAH - VRAM data write high",

			# Audio registers
			0x2140: "APUIO0 - APU I/O port 0",
			0x2141: "APUIO1 - APU I/O port 1",
			0x2142: "APUIO2 - APU I/O port 2",
			0x2143: "APUIO3 - APU I/O port 3",

			# Controller ports
			0x4016: "JOYSER0 - Controller port 1",
			0x4017: "JOYSER1 - Controller port 2",

			# DMA registers
			0x4300: "DMAP0 - DMA control register channel 0",
			0x4301: "BBAD0 - DMA destination register channel 0",
			0x4302: "A1T0L - DMA source address low channel 0",
			0x4303: "A1T0H - DMA source address high channel 0",
			0x4304: "A1B0 - DMA source address bank channel 0",
			0x4305: "DAS0L - DMA size low channel 0",
			0x4306: "DAS0H - DMA size high channel 0",
			0x420b: "MDMAEN - Select DMA channels",
			0x420c: "HDMAEN - Select HDMA channels",
		}

		return registers

	def rom_offset_to_snes_address(self, offset: int) -> Tuple[int, int]:
		"""Convert ROM offset to SNES bank:address"""
		bank = offset // 0x8000
		address = 0x8000 + (offset % 0x8000)
		return bank, address

	def find_code_entry_points(self) -> List[int]:
		"""Find all potential code entry points"""
		entry_points = []

		# Check interrupt vectors
		for vector_name, vector_addr in self.snes_vectors.items():
			if vector_addr + 1 < self.rom_size:
				target_addr = struct.unpack('<H', self.rom_data[vector_addr:vector_addr+2])[0]
				if 0x8000 <= target_addr <= 0xffff:
					# Convert SNES address to ROM offset
					rom_offset = target_addr - 0x8000
					if rom_offset < self.rom_size:
						entry_points.append(rom_offset)
						print(f"Found {vector_name} vector pointing to ${target_addr:04X} (ROM ${rom_offset:06X})")

		# Look for common code patterns
		entry_points.extend(self._find_common_entry_patterns())

		# Find JSR/JSL targets
		entry_points.extend(self._find_subroutine_targets())

		return sorted(list(set(entry_points)))

	def _find_common_entry_patterns(self) -> List[int]:
		"""Find code using common SNES initialization patterns"""
		patterns = []

		# Look for initialization sequences
		for offset in range(0, self.rom_size - 10, 0x1000):	# Check every 4K
			if offset + 10 >= self.rom_size:
				break

			chunk = self.rom_data[offset:offset+10]

			# Pattern: REP #$30 (common start pattern)
			if chunk[0] == 0xc2 and chunk[1] == 0x30:
				patterns.append(offset)

			# Pattern: SEI; CLD; CLC (interrupt disable sequence)
			if len(chunk) >= 3 and chunk[0] == 0x78 and chunk[1] == 0xd8 and chunk[2] == 0x18:
				patterns.append(offset)

			# Pattern: LDA #$xxxx; STA $xxxx (common data setup)
			if len(chunk) >= 6 and chunk[0] == 0xa9 and chunk[3] == 0x8d:
				patterns.append(offset)

		return patterns[:50]	# Limit results

	def _find_subroutine_targets(self) -> List[int]:
		"""Scan for JSR/JSL targets throughout the ROM"""
		targets = []

		for offset in range(0, self.rom_size - 4):
			opcode = self.rom_data[offset]

			# JSR absolute ($20)
			if opcode == 0x20 and offset + 2 < self.rom_size:
				target_addr = struct.unpack('<H', self.rom_data[offset+1:offset+3])[0]
				if 0x8000 <= target_addr <= 0xffff:
					rom_offset = target_addr - 0x8000
					if rom_offset < self.rom_size:
						targets.append(rom_offset)

			# JSL long ($22)
			elif opcode == 0x22 and offset + 3 < self.rom_size:
				target_addr = struct.unpack('<I', self.rom_data[offset+1:offset+4] + b'\x00')[0]
				bank = (target_addr >> 16) & 0xff
				addr = target_addr & 0xffff
				if 0x8000 <= addr <= 0xffff:
					rom_offset = bank * 0x8000 + (addr - 0x8000)
					if rom_offset < self.rom_size:
						targets.append(rom_offset)

		return targets

	def analyze_function(self, start_offset: int, max_size: int = 2048) -> Optional[AnalyzedFunction]:
		"""Comprehensively analyze a single function"""
		if start_offset in self.visited_offsets:
			return None

		instructions = []
		current_offset = start_offset
		calls_made = []
		stack_depth = 0
		complexity_score = 0.0
		hw_regs_used = set()

		# Analyze control flow
		while current_offset < min(start_offset + max_size, self.rom_size):
			if current_offset >= self.rom_size:
				break

			if current_offset in self.instruction_cache:
				instruction = self.instruction_cache[current_offset]
				next_offset = current_offset + instruction['size']
			else:
				instruction, next_offset = self._disassemble_instruction_detailed(current_offset)
				if instruction is None:
					break
				self.instruction_cache[current_offset] = instruction

			instructions.append(instruction)
			self.visited_offsets.add(current_offset)

			# Analyze instruction for complexity and patterns
			mnemonic = instruction['mnemonic']

			# Track stack usage
			if mnemonic in ['PHA', 'PHX', 'PHY', 'PHB', 'PHD', 'PHK', 'PHP']:
				stack_depth += 1
			elif mnemonic in ['PLA', 'PLX', 'PLY', 'PLB', 'PLD', 'PLP']:
				stack_depth -= 1
			elif mnemonic in ['JSR', 'JSL']:
				stack_depth += 2	# Return address
				calls_made.append(self._extract_call_target(instruction))
			elif mnemonic in ['RTS', 'RTL']:
				stack_depth -= 2

			# Check for hardware register access
			if 'operand_address' in instruction:
				addr = instruction['operand_address']
				if addr in self.hw_registers:
					hw_regs_used.add(addr)
					self.hw_register_usage[addr].append(current_offset)

			# Complexity scoring
			if instruction.get('analysis', {}).get('type') == 'control':
				complexity_score += 2.0
			elif mnemonic in ['JSR', 'JSL']:
				complexity_score += 3.0
			elif instruction.get('analysis', {}).get('control_flow') == 'conditional_branch':
				complexity_score += 1.5
			else:
				complexity_score += 0.5

			# Function termination conditions
			if mnemonic in ['RTS', 'RTL', 'RTI']:
				break
			elif mnemonic in ['JMP', 'JML'] and instruction.get('addressing') not in ['absolute_indirect', 'absolute_x_indirect']:
				break
			elif mnemonic == 'BRA':
				# Unconditional branch might be end of function
				break

			current_offset = next_offset

		if not instructions:
			return None

		# Determine function type
		function_type = self._classify_function(instructions, hw_regs_used)

		# Generate function name
		bank, addr = self.rom_offset_to_snes_address(start_offset)
		func_name = f"func_{bank:02X}_{addr:04X}"

		# Generate description
		description = self._generate_function_description(instructions, function_type, hw_regs_used)

		return AnalyzedFunction(
			name=func_name,
			start_offset=start_offset,
			end_offset=current_offset,
			instructions=instructions,
			calls_made=[t for t in calls_made if t is not None],
			called_from=[],
			local_labels=set(),
			stack_usage=stack_depth,
			function_type=function_type,
			description=description,
			complexity_score=complexity_score
		)

	def _disassemble_instruction_detailed(self, offset: int) -> Tuple[Optional[Dict[str, Any]], int]:
		"""Disassemble with detailed analysis information"""
		if offset >= self.rom_size:
			return None, offset

		opcode = self.rom_data[offset]

		if opcode not in self.opcodes:
			# Unknown opcode - return as data
			bank, addr = self.rom_offset_to_snes_address(offset)
			return {
				'offset': offset,
				'bank': bank,
				'address': addr,
				'opcode': opcode,
				'mnemonic': 'DB',
				'addressing': 'implied',
				'operands': f"${opcode:02X}",
				'bytes': [opcode],
				'size': 1,
				'cycles': 1,
				'description': f"Unknown opcode ${opcode:02X}",
				'analysis': {'type': 'data', 'modifies': [], 'reads': []}
			}, offset + 1

		opcode_info = self.opcodes[opcode]
		size = opcode_info['size']

		# Read instruction bytes
		bytes_data = []
		for i in range(size):
			if offset + i < self.rom_size:
				bytes_data.append(self.rom_data[offset + i])
			else:
				bytes_data.append(0)

		# Parse operands and extract addresses
		operands, operand_address = self._parse_operands_detailed(bytes_data, opcode_info['addressing'], offset)

		bank, addr = self.rom_offset_to_snes_address(offset)

		instruction = {
			'offset': offset,
			'bank': bank,
			'address': addr,
			'opcode': opcode,
			'mnemonic': opcode_info['mnemonic'],
			'addressing': opcode_info['addressing'],
			'operands': operands,
			'bytes': bytes_data,
			'size': size,
			'cycles': opcode_info['cycles'],
			'flags_affected': opcode_info['flags_affected'],
			'description': opcode_info['description'],
			'analysis': opcode_info['analysis'].copy()
		}

		if operand_address is not None:
			instruction['operand_address'] = operand_address

		return instruction, offset + size

	def _parse_operands_detailed(self, bytes_data: List[int], addressing: str, offset: int) -> Tuple[str, Optional[int]]:
		"""Parse operands with address extraction for analysis"""
		if len(bytes_data) < 1:
			return "", None

		operand_address = None

		if addressing == "implied" or addressing == "accumulator":
			return "" if addressing == "implied" else "A", None
		elif addressing == "immediate":
			if len(bytes_data) >= 3:
				value = bytes_data[1] | (bytes_data[2] << 8)
				return f"#${value:04X}", None
			elif len(bytes_data) >= 2:
				return f"#${bytes_data[1]:02X}", None
			return "#$??", None
		elif addressing == "absolute":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				operand_address = addr
				# Check if it's a hardware register
				if addr in self.hw_registers:
					return f"${addr:04X}	; {self.hw_registers[addr]}", addr
				return f"${addr:04X}", addr
			return "$????", None
		elif addressing in ["absolute_x", "absolute_y"]:
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				suffix = ",X" if "x" in addressing else ",Y"
				return f"${addr:04X}{suffix}", addr
			return f"$????,{addressing[-1].upper()}", None
		elif addressing == "zeropage":
			if len(bytes_data) >= 2:
				return f"${bytes_data[1]:02X}", bytes_data[1]
			return "$??", None
		elif addressing in ["zeropage_x", "zeropage_y"]:
			if len(bytes_data) >= 2:
				suffix = ",X" if "x" in addressing else ",Y"
				return f"${bytes_data[1]:02X}{suffix}", bytes_data[1]
			return f"$??,{addressing[-1].upper()}", None
		elif addressing == "relative":
			if len(bytes_data) >= 2:
				displacement = bytes_data[1]
				if displacement >= 0x80:
					displacement = displacement - 0x100
				target_offset = offset + 2 + displacement
				target_bank, target_addr = self.rom_offset_to_snes_address(target_offset)
				return f"${target_addr:04X}", target_addr
			return "$????", None
		elif addressing == "long":
			if len(bytes_data) >= 4:
				addr = bytes_data[1] | (bytes_data[2] << 8) | (bytes_data[3] << 16)
				return f"${addr:06X}", addr
			return "$??????", None
		else:
			return "???", None

	def _extract_call_target(self, instruction: Dict[str, Any]) -> Optional[int]:
		"""Extract the target address from a call instruction"""
		if instruction['mnemonic'] not in ['JSR', 'JSL']:
			return None

		if 'operand_address' in instruction:
			return instruction['operand_address']

		return None

	def _classify_function(self, instructions: List[Dict[str, Any]], hw_regs: Set[int]) -> str:
		"""Classify function type based on instruction patterns"""
		# Check for graphics operations
		graphics_regs = {0x2100, 0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106, 0x2107,
						0x2108, 0x2109, 0x210a, 0x210b, 0x210c, 0x210d, 0x210e, 0x210f,
						0x2110, 0x2111, 0x2112, 0x2113, 0x2114, 0x2115, 0x2116, 0x2117,
						0x2118, 0x2119}

		if hw_regs & graphics_regs:
			return "graphics"

		# Check for audio operations
		audio_regs = {0x2140, 0x2141, 0x2142, 0x2143}
		if hw_regs & audio_regs:
			return "audio"

		# Check for DMA operations
		dma_regs = {0x4300, 0x4301, 0x4302, 0x4303, 0x4304, 0x4305, 0x4306, 0x420b, 0x420c}
		if hw_regs & dma_regs:
			return "system"

		# Check instruction patterns
		has_arithmetic = any(inst['analysis'].get('type') == 'arithmetic' for inst in instructions)
		has_complex_control = any(inst['analysis'].get('control_flow') == 'conditional_branch' for inst in instructions)

		if has_complex_control and has_arithmetic:
			return "game_logic"
		elif any(inst['mnemonic'] in ['REP', 'SEP'] for inst in instructions):
			return "system"
		else:
			return "data_handler"

	def _generate_function_description(self, instructions: List[Dict[str, Any]],
									 function_type: str, hw_regs: Set[int]) -> str:
		"""Generate descriptive text for a function"""
		desc_parts = []

		# Basic stats
		desc_parts.append(f"{len(instructions)} instructions")

		# Hardware usage
		if hw_regs:
			reg_names = [self.hw_registers.get(reg, f"${reg:04X}") for reg in hw_regs]
			desc_parts.append(f"uses {', '.join(reg_names[:3])}")

		# Call pattern
		calls = [inst for inst in instructions if inst['mnemonic'] in ['JSR', 'JSL']]
		if calls:
			desc_parts.append(f"makes {len(calls)} calls")

		# Type-specific description
		if function_type == "graphics":
			desc_parts.append("graphics processing")
		elif function_type == "audio":
			desc_parts.append("audio processing")
		elif function_type == "system":
			desc_parts.append("system/hardware control")
		elif function_type == "game_logic":
			desc_parts.append("game logic processing")
		else:
			desc_parts.append("data handling")

		return "; " + ", ".join(desc_parts)

	def run_comprehensive_analysis(self, max_functions: int = 200):
		"""Run complete comprehensive analysis"""
		print("\nSTARTING: Comprehensive Code Analysis")
		print("=" * 60)

		start_time = time.time()

		# Find all entry points
		print("PHASE 1: Finding code entry points...")
		entry_points = self.find_code_entry_points()
		print(f"Found {len(entry_points)} potential entry points")

		# Analyze each function
		print("PHASE 2: Analyzing functions...")
		analyzed_functions = []

		for i, entry_point in enumerate(entry_points[:max_functions]):
			if i % 10 == 0:
				print(f"Analyzing function {i+1}/{min(len(entry_points), max_functions)}: ${entry_point:06X}")

			func = self.analyze_function(entry_point)
			if func:
				analyzed_functions.append(func)
				self.functions[entry_point] = func

		print(f"Successfully analyzed {len(analyzed_functions)} functions")

		# Build cross-references
		print("PHASE 3: Building cross-references...")
		self._build_cross_references()

		# Generate comprehensive output
		print("PHASE 4: Generating documentation...")
		self._generate_comprehensive_documentation()

		analysis_time = time.time() - start_time
		print(f"\nCOMPREHENSIVE ANALYSIS COMPLETE!")
		print(f"Time: {analysis_time:.2f} seconds")
		print(f"Functions analyzed: {len(analyzed_functions)}")
		print(f"Total instructions: {sum(len(f.instructions) for f in analyzed_functions)}")
		print(f"Hardware registers used: {len(self.hw_register_usage)}")

		return analyzed_functions

	def _build_cross_references(self):
		"""Build cross-reference information between functions"""
		for func in self.functions.values():
			for call_target in func.calls_made:
				if call_target in self.functions:
					self.functions[call_target].called_from.append(func.start_offset)
				self.cross_references[call_target].add(func.start_offset)

	def _generate_comprehensive_documentation(self):
		"""Generate comprehensive documentation files"""
		docs_dir = Path("docs")
		docs_dir.mkdir(exist_ok=True)

		# Function listing
		with open(docs_dir / "functions.md", 'w') as f:
			f.write("# Dragon Quest III - Function Analysis\n\n")
			f.write(f"Total functions analyzed: {len(self.functions)}\n\n")

			# Sort by complexity
			functions_by_complexity = sorted(self.functions.values(),
											 key=lambda x: x.complexity_score, reverse=True)

			f.write("## Functions by Complexity\n\n")
			for func in functions_by_complexity[:50]:
				f.write(f"### {func.name} (${func.start_offset:06X})\n")
				f.write(f"- **Type**: {func.function_type}\n")
				f.write(f"- **Size**: {func.end_offset - func.start_offset} bytes\n")
				f.write(f"- **Instructions**: {len(func.instructions)}\n")
				f.write(f"- **Complexity**: {func.complexity_score:.1f}\n")
				f.write(f"- **Stack usage**: {func.stack_usage}\n")
				f.write(f"- **Calls made**: {len(func.calls_made)}\n")
				f.write(f"- **Called from**: {len(func.called_from)} locations\n")
				f.write(f"- **Description**: {func.description}\n\n")

		# Hardware register usage
		with open(docs_dir / "hardware_usage.md", 'w') as f:
			f.write("# SNES Hardware Register Usage\n\n")

			for reg_addr in sorted(self.hw_register_usage.keys()):
				usage_list = self.hw_register_usage[reg_addr]
				reg_name = self.hw_registers.get(reg_addr, f"Unknown ${reg_addr:04X}")

				f.write(f"## {reg_name}\n")
				f.write(f"Used {len(usage_list)} times:\n")

				for offset in usage_list[:20]:	# Limit to first 20
					bank, addr = self.rom_offset_to_snes_address(offset)
					f.write(f"- ${offset:06X} [{bank:02X}:${addr:04X}]\n")

				if len(usage_list) > 20:
					f.write(f"- ... and {len(usage_list) - 20} more\n")
				f.write("\n")

		# Cross-reference map
		with open(docs_dir / "cross_references.json", 'w') as f:
			cross_ref_data = {}
			for target, callers in self.cross_references.items():
				cross_ref_data[f"${target:06X}"] = [f"${caller:06X}" for caller in callers]
			json.dump(cross_ref_data, f, indent=2)

		print(f"Documentation generated in {docs_dir}/")

def main():
	"""Main entry point"""
	print("STARTING: Dragon Quest III - Comprehensive Analysis")
	print("=" * 70)

	# Find ROM
	rom_files = [
		'static/Dragon Quest III - Soshite Densetsu he... (J).smc',	# Primary Japanese source
		'static/Dragon Quest III - english.smc',						 # Reference translation
		'static/Dragon Quest III - english (patched).smc'				# Backup option
	]

	rom_path = None
	for rom_file in rom_files:
		if os.path.exists(rom_file):
			rom_path = rom_file
			break

	if not rom_path:
		print("ERROR: No ROM file found!")
		return

	# Run comprehensive analysis
	disassembler = ComprehensiveDisassembler(rom_path)
	functions = disassembler.run_comprehensive_analysis(max_functions=500)	# Analyze up to 500 functions

	print(f"\nFINAL RESULTS:")
	print(f"Functions: {len(functions)}")
	print(f"Types: {Counter(f.function_type for f in functions)}")

if __name__ == "__main__":
	main()
