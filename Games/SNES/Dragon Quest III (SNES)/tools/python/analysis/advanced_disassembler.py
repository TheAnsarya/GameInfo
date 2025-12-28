#!/usr/bin/env python3
"""
Dragon Quest III - Advanced Code Disassembler
=============================================

Comprehensive disassembler that extracts all code regions identified by
the maximum coverage analysis and converts them to documented assembly.
"""

import struct
import os
import json
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set
from dataclasses import dataclass
from collections import defaultdict
import time

@dataclass
class CodeRegion:
	"""Represents a region of code in the ROM"""
	start_offset: int
	end_offset: int
	bank: int
	snes_address: int
	instructions: List[Dict[str, Any]]
	labels: Set[str]
	comments: List[str]

	@property
	def size(self) -> int:
		return self.end_offset - self.start_offset

class SNESDisassembler:
	"""
	Comprehensive SNES 65816 disassembler for Dragon Quest III
	"""

	def __init__(self, rom_path: str, coverage_data_path: Optional[str] = None):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)

		# Load coverage analysis data
		if coverage_data_path and os.path.exists(coverage_data_path):
			with open(coverage_data_path, 'r') as f:
				self.coverage_data = json.load(f)
		else:
			self.coverage_data = None

		# 65816 instruction definitions
		self.opcodes = self._init_opcodes()

		# Analysis state
		self.code_regions = []
		self.labels = {}
		self.cross_references = defaultdict(list)
		self.function_names = {}
		self.data_sections = {}

		# Disassembly settings
		self.current_m_flag = True	# 8-bit accumulator
		self.current_x_flag = True	# 8-bit index

		print(f"INIT: Advanced SNES Disassembler")
		print(f"ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")

	def _load_rom(self) -> bytes:
		"""Load ROM data into memory"""
		with open(self.rom_path, 'rb') as f:
			return f.read()

	def _init_opcodes(self) -> Dict[int, Dict[str, Any]]:
		"""Initialize 65816 opcode definitions"""
		opcodes = {}

		# Define common 65816 opcodes with addressing modes and sizes
		opcode_defs = [
			# ADC instructions
			(0x69, "ADC", "immediate", 2, "Add with carry (immediate)"),
			(0x6d, "ADC", "absolute", 3, "Add with carry (absolute)"),
			(0x7d, "ADC", "absolute_x", 3, "Add with carry (absolute,X)"),
			(0x79, "ADC", "absolute_y", 3, "Add with carry (absolute,Y)"),
			(0x65, "ADC", "zeropage", 2, "Add with carry (zero page)"),
			(0x75, "ADC", "zeropage_x", 2, "Add with carry (zero page,X)"),
			(0x61, "ADC", "zeropage_x_indirect", 2, "Add with carry (zp,X)"),
			(0x71, "ADC", "zeropage_indirect_y", 2, "Add with carry (zp),Y"),
			(0x72, "ADC", "zeropage_indirect", 2, "Add with carry (zp)"),

			# STA instructions
			(0x8d, "STA", "absolute", 3, "Store accumulator (absolute)"),
			(0x9d, "STA", "absolute_x", 3, "Store accumulator (absolute,X)"),
			(0x99, "STA", "absolute_y", 3, "Store accumulator (absolute,Y)"),
			(0x85, "STA", "zeropage", 2, "Store accumulator (zero page)"),
			(0x95, "STA", "zeropage_x", 2, "Store accumulator (zero page,X)"),
			(0x81, "STA", "zeropage_x_indirect", 2, "Store accumulator (zp,X)"),
			(0x91, "STA", "zeropage_indirect_y", 2, "Store accumulator (zp),Y"),
			(0x92, "STA", "zeropage_indirect", 2, "Store accumulator (zp)"),

			# LDA instructions
			(0xa9, "LDA", "immediate", 2, "Load accumulator (immediate)"),
			(0xad, "LDA", "absolute", 3, "Load accumulator (absolute)"),
			(0xbd, "LDA", "absolute_x", 3, "Load accumulator (absolute,X)"),
			(0xb9, "LDA", "absolute_y", 3, "Load accumulator (absolute,Y)"),
			(0xa5, "LDA", "zeropage", 2, "Load accumulator (zero page)"),
			(0xb5, "LDA", "zeropage_x", 2, "Load accumulator (zero page,X)"),
			(0xa1, "LDA", "zeropage_x_indirect", 2, "Load accumulator (zp,X)"),
			(0xb1, "LDA", "zeropage_indirect_y", 2, "Load accumulator (zp),Y"),
			(0xb2, "LDA", "zeropage_indirect", 2, "Load accumulator (zp)"),

			# Branch instructions
			(0x10, "BPL", "relative", 2, "Branch if plus"),
			(0x30, "BMI", "relative", 2, "Branch if minus"),
			(0x50, "BVC", "relative", 2, "Branch if overflow clear"),
			(0x70, "BVS", "relative", 2, "Branch if overflow set"),
			(0x90, "BCC", "relative", 2, "Branch if carry clear"),
			(0xb0, "BCS", "relative", 2, "Branch if carry set"),
			(0xd0, "BNE", "relative", 2, "Branch if not equal"),
			(0xf0, "BEQ", "relative", 2, "Branch if equal"),
			(0x80, "BRA", "relative", 2, "Branch always"),

			# Jump/Call instructions
			(0x4c, "JMP", "absolute", 3, "Jump absolute"),
			(0x6c, "JMP", "absolute_indirect", 3, "Jump (absolute)"),
			(0x7c, "JMP", "absolute_x_indirect", 3, "Jump (absolute,X)"),
			(0x20, "JSR", "absolute", 3, "Jump to subroutine"),
			(0xfc, "JSR", "absolute_x_indirect", 3, "Jump to subroutine (absolute,X)"),
			(0x60, "RTS", "implied", 1, "Return from subroutine"),
			(0x6b, "RTL", "implied", 1, "Return from subroutine long"),
			(0x22, "JSL", "long", 4, "Jump to subroutine long"),
			(0x40, "RTI", "implied", 1, "Return from interrupt"),

			# Stack operations
			(0x48, "PHA", "implied", 1, "Push accumulator"),
			(0x68, "PLA", "implied", 1, "Pull accumulator"),
			(0x8b, "PHB", "implied", 1, "Push data bank"),
			(0xab, "PLB", "implied", 1, "Pull data bank"),
			(0x0b, "PHD", "implied", 1, "Push direct page"),
			(0x2b, "PLD", "implied", 1, "Pull direct page"),
			(0x4b, "PHK", "implied", 1, "Push program bank"),
			(0x08, "PHP", "implied", 1, "Push processor status"),
			(0x28, "PLP", "implied", 1, "Pull processor status"),
			(0xda, "PHX", "implied", 1, "Push X register"),
			(0xfa, "PLX", "implied", 1, "Pull X register"),
			(0x5a, "PHY", "implied", 1, "Push Y register"),
			(0x7a, "PLY", "implied", 1, "Pull Y register"),

			# Status flag operations
			(0x18, "CLC", "implied", 1, "Clear carry"),
			(0x38, "SEC", "implied", 1, "Set carry"),
			(0x58, "CLI", "implied", 1, "Clear interrupt"),
			(0x78, "SEI", "implied", 1, "Set interrupt"),
			(0xb8, "CLV", "implied", 1, "Clear overflow"),
			(0xd8, "CLD", "implied", 1, "Clear decimal"),
			(0xf8, "SED", "implied", 1, "Set decimal"),
			(0xc2, "REP", "immediate", 2, "Reset processor status"),
			(0xe2, "SEP", "immediate", 2, "Set processor status"),

			# Transfer instructions
			(0xaa, "TAX", "implied", 1, "Transfer A to X"),
			(0x8a, "TXA", "implied", 1, "Transfer X to A"),
			(0xa8, "TAY", "implied", 1, "Transfer A to Y"),
			(0x98, "TYA", "implied", 1, "Transfer Y to A"),
			(0x9a, "TXS", "implied", 1, "Transfer X to stack"),
			(0xba, "TSX", "implied", 1, "Transfer stack to X"),
			(0x5b, "TCD", "implied", 1, "Transfer 16-bit A to direct page"),
			(0x7b, "TDC", "implied", 1, "Transfer direct page to 16-bit A"),
			(0x1b, "TCS", "implied", 1, "Transfer 16-bit A to stack"),
			(0x3b, "TSC", "implied", 1, "Transfer stack to 16-bit A"),

			# Increment/Decrement
			(0xe8, "INX", "implied", 1, "Increment X"),
			(0xca, "DEX", "implied", 1, "Decrement X"),
			(0xc8, "INY", "implied", 1, "Increment Y"),
			(0x88, "DEY", "implied", 1, "Decrement Y"),
			(0x1a, "INC", "accumulator", 1, "Increment accumulator"),
			(0x3a, "DEC", "accumulator", 1, "Decrement accumulator"),
			(0xee, "INC", "absolute", 3, "Increment (absolute)"),
			(0xce, "DEC", "absolute", 3, "Decrement (absolute)"),
			(0xfe, "INC", "absolute_x", 3, "Increment (absolute,X)"),
			(0xde, "DEC", "absolute_x", 3, "Decrement (absolute,X)"),
			(0xe6, "INC", "zeropage", 2, "Increment (zero page)"),
			(0xc6, "DEC", "zeropage", 2, "Decrement (zero page)"),
			(0xf6, "INC", "zeropage_x", 2, "Increment (zero page,X)"),
			(0xd6, "DEC", "zeropage_x", 2, "Decrement (zero page,X)"),

			# Logic operations
			(0x29, "AND", "immediate", 2, "Logical AND (immediate)"),
			(0x2d, "AND", "absolute", 3, "Logical AND (absolute)"),
			(0x09, "ORA", "immediate", 2, "Logical OR (immediate)"),
			(0x0d, "ORA", "absolute", 3, "Logical OR (absolute)"),
			(0x49, "EOR", "immediate", 2, "Exclusive OR (immediate)"),
			(0x4d, "EOR", "absolute", 3, "Exclusive OR (absolute)"),

			# Compare instructions
			(0xc9, "CMP", "immediate", 2, "Compare accumulator (immediate)"),
			(0xcd, "CMP", "absolute", 3, "Compare accumulator (absolute)"),
			(0xe0, "CPX", "immediate", 2, "Compare X register (immediate)"),
			(0xec, "CPX", "absolute", 3, "Compare X register (absolute)"),
			(0xc0, "CPY", "immediate", 2, "Compare Y register (immediate)"),
			(0xcc, "CPY", "absolute", 3, "Compare Y register (absolute)"),

			# Bit operations
			(0x89, "BIT", "immediate", 2, "Bit test (immediate)"),
			(0x2c, "BIT", "absolute", 3, "Bit test (absolute)"),
			(0x24, "BIT", "zeropage", 2, "Bit test (zero page)"),
			(0x04, "TSB", "zeropage", 2, "Test and set bits (zero page)"),
			(0x0c, "TSB", "absolute", 3, "Test and set bits (absolute)"),
			(0x14, "TRB", "zeropage", 2, "Test and reset bits (zero page)"),
			(0x1c, "TRB", "absolute", 3, "Test and reset bits (absolute)"),

			# Shift/Rotate
			(0x0a, "ASL", "accumulator", 1, "Arithmetic shift left (accumulator)"),
			(0x0e, "ASL", "absolute", 3, "Arithmetic shift left (absolute)"),
			(0x4a, "LSR", "accumulator", 1, "Logical shift right (accumulator)"),
			(0x4e, "LSR", "absolute", 3, "Logical shift right (absolute)"),
			(0x2a, "ROL", "accumulator", 1, "Rotate left (accumulator)"),
			(0x2e, "ROL", "absolute", 3, "Rotate left (absolute)"),
			(0x6a, "ROR", "accumulator", 1, "Rotate right (accumulator)"),
			(0x6e, "ROR", "absolute", 3, "Rotate right (absolute)"),

			# Load X/Y
			(0xa2, "LDX", "immediate", 2, "Load X register (immediate)"),
			(0xae, "LDX", "absolute", 3, "Load X register (absolute)"),
			(0xa0, "LDY", "immediate", 2, "Load Y register (immediate)"),
			(0xac, "LDY", "absolute", 3, "Load Y register (absolute)"),

			# Store X/Y
			(0x8e, "STX", "absolute", 3, "Store X register (absolute)"),
			(0x86, "STX", "zeropage", 2, "Store X register (zero page)"),
			(0x96, "STX", "zeropage_y", 2, "Store X register (zero page,Y)"),
			(0x8c, "STY", "absolute", 3, "Store Y register (absolute)"),
			(0x84, "STY", "zeropage", 2, "Store Y register (zero page)"),
			(0x94, "STY", "zeropage_x", 2, "Store Y register (zero page,X)"),

			# Special 65816 instructions
			(0x5c, "JML", "long", 4, "Jump long"),
			(0xdc, "JML", "absolute_indirect_long", 3, "Jump [long]"),
			(0x54, "MVN", "block_move", 3, "Block move negative"),
			(0x44, "MVP", "block_move", 3, "Block move positive"),
			(0x42, "WDM", "immediate", 2, "Reserved for future use"),
			(0xdb, "STP", "implied", 1, "Stop processor"),
			(0xcb, "WAI", "implied", 1, "Wait for interrupt"),
			(0xeb, "XBA", "implied", 1, "Exchange B and A"),
			(0xfb, "XCE", "implied", 1, "Exchange carry and emulation"),

			# Misc
			(0xea, "NOP", "implied", 1, "No operation"),
			(0x00, "BRK", "immediate", 2, "Break"),
			(0x02, "COP", "immediate", 2, "Coprocessor"),

			# Undefined/Illegal opcodes (appear in some ROMs)
			(0x03, "???", "unknown", 1, "Unknown/illegal opcode"),
			(0x07, "???", "unknown", 1, "Unknown/illegal opcode"),
			(0x0f, "???", "unknown", 1, "Unknown/illegal opcode"),
		]

		# Build opcode dictionary
		for opcode_val, mnemonic, addressing, size, description in opcode_defs:
			opcodes[opcode_val] = {
				'mnemonic': mnemonic,
				'addressing': addressing,
				'size': size,
				'description': description
			}

		return opcodes

	def rom_offset_to_snes_address(self, offset: int) -> Tuple[int, int]:
		"""Convert ROM offset to SNES address (bank:address format)"""
		# LoROM mapping: each 32KB bank maps to $8000-$ffff in SNES memory
		bank = offset // 0x8000
		address = 0x8000 + (offset % 0x8000)
		return bank, address

	def snes_address_to_rom_offset(self, bank: int, address: int) -> int:
		"""Convert SNES address to ROM offset"""
		if 0x8000 <= address <= 0xffff:
			return bank * 0x8000 + (address - 0x8000)
		return -1	# Invalid address

	def disassemble_instruction(self, offset: int) -> Tuple[Optional[Dict[str, Any]], int]:
		"""
		Disassemble a single instruction at the given offset.
		Returns instruction info and next offset.
		"""
		if offset >= self.rom_size:
			return None, offset

		opcode = self.rom_data[offset]

		if opcode not in self.opcodes:
			# Unknown opcode
			bank, addr = self.rom_offset_to_snes_address(offset)
			return {
				'offset': offset,
				'bank': bank,
				'address': addr,
				'opcode': opcode,
				'mnemonic': 'DB',
				'operands': f"${opcode:02X}",
				'bytes': [opcode],
				'size': 1,
				'description': f"Unknown opcode ${opcode:02X}"
			}, offset + 1

		opcode_info = self.opcodes[opcode]
		size = opcode_info['size']

		# Adjust size based on processor flags for certain instructions
		if opcode_info['mnemonic'] in ['LDA', 'STA', 'ADC', 'SBC', 'CMP', 'AND', 'ORA', 'EOR'] and opcode_info['addressing'] == 'immediate':
			size = 2 if self.current_m_flag else 3
		elif opcode_info['mnemonic'] in ['LDX', 'STX', 'LDY', 'STY', 'CPX', 'CPY'] and opcode_info['addressing'] == 'immediate':
			size = 2 if self.current_x_flag else 3

		# Read instruction bytes
		bytes_data = []
		for i in range(size):
			if offset + i < self.rom_size:
				bytes_data.append(self.rom_data[offset + i])
			else:
				bytes_data.append(0)

		# Parse operands
		operands = self._parse_operands(bytes_data, opcode_info['addressing'], offset)

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
			'description': opcode_info['description']
		}

		return instruction, offset + size

	def _parse_operands(self, bytes_data: List[int], addressing: str, offset: int) -> str:
		"""Parse operands based on addressing mode"""
		if len(bytes_data) < 1:
			return ""

		if addressing == "implied":
			return ""
		elif addressing == "accumulator":
			return "A"
		elif addressing == "immediate":
			if len(bytes_data) >= 2:
				if len(bytes_data) >= 3:
					value = bytes_data[1] | (bytes_data[2] << 8)
					return f"#${value:04X}"
				else:
					return f"#${bytes_data[1]:02X}"
			return "#$??"
		elif addressing == "absolute":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"${addr:04X}"
			return "$????"
		elif addressing == "absolute_x":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"${addr:04X},X"
			return "$????,X"
		elif addressing == "absolute_y":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"${addr:04X},Y"
			return "$????,Y"
		elif addressing == "zeropage":
			if len(bytes_data) >= 2:
				return f"${bytes_data[1]:02X}"
			return "$??"
		elif addressing == "zeropage_x":
			if len(bytes_data) >= 2:
				return f"${bytes_data[1]:02X},X"
			return "$??,X"
		elif addressing == "zeropage_y":
			if len(bytes_data) >= 2:
				return f"${bytes_data[1]:02X},Y"
			return "$??,Y"
		elif addressing == "zeropage_x_indirect":
			if len(bytes_data) >= 2:
				return f"(${bytes_data[1]:02X},X)"
			return "($??,X)"
		elif addressing == "zeropage_indirect_y":
			if len(bytes_data) >= 2:
				return f"(${bytes_data[1]:02X}),Y"
			return "($??),Y"
		elif addressing == "zeropage_indirect":
			if len(bytes_data) >= 2:
				return f"(${bytes_data[1]:02X})"
			return "($??)"
		elif addressing == "absolute_indirect":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"(${addr:04X})"
			return "($????)"
		elif addressing == "absolute_x_indirect":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"(${addr:04X},X)"
			return "($????,X)"
		elif addressing == "absolute_indirect_long":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				return f"[${addr:04X}]"
			return "[$????]"
		elif addressing == "relative":
			if len(bytes_data) >= 2:
				# Calculate branch target
				displacement = bytes_data[1]
				if displacement >= 0x80:
					displacement = displacement - 0x100	# Convert to signed
				target_offset = offset + 2 + displacement	# +2 for instruction size
				target_bank, target_addr = self.rom_offset_to_snes_address(target_offset)
				return f"${target_addr:04X}"
			return "$????"
		elif addressing == "long":
			if len(bytes_data) >= 4:
				addr = bytes_data[1] | (bytes_data[2] << 8) | (bytes_data[3] << 16)
				return f"${addr:06X}"
			return "$??????"
		elif addressing == "block_move":
			if len(bytes_data) >= 3:
				return f"${bytes_data[2]:02X},${bytes_data[1]:02X}"
			return "$??,${??"
		else:
			return "???"

	def analyze_code_flow(self, start_offset: int, max_size: int = 1024) -> List[Dict[str, Any]]:
		"""
		Analyze code flow starting from an offset, following branches and calls.
		Returns list of disassembled instructions.
		"""
		instructions = []
		visited = set()
		to_analyze = [start_offset]

		while to_analyze and len(instructions) < max_size:
			current_offset = to_analyze.pop(0)

			if current_offset in visited or current_offset >= self.rom_size:
				continue

			instruction, next_offset = self.disassemble_instruction(current_offset)
			if instruction is None:
				continue

			visited.add(current_offset)
			instructions.append(instruction)

			# Handle control flow
			mnemonic = instruction['mnemonic']

			if mnemonic in ['BPL', 'BMI', 'BVC', 'BVS', 'BCC', 'BCS', 'BNE', 'BEQ', 'BRA']:
				# Branch instruction - add branch target and continue linearly
				if instruction['addressing'] == 'relative' and len(instruction['bytes']) >= 2:
					displacement = instruction['bytes'][1]
					if displacement >= 0x80:
						displacement = displacement - 0x100
					branch_target = current_offset + 2 + displacement
					if 0 <= branch_target < self.rom_size:
						to_analyze.append(branch_target)

				# Continue with next instruction (except for BRA)
				if mnemonic != 'BRA':
					to_analyze.append(next_offset)

			elif mnemonic in ['JMP', 'JML']:
				# Unconditional jump - don't continue linearly
				if instruction['addressing'] in ['absolute', 'long']:
					# Could add jump target analysis here
					pass
				break	# Stop linear analysis

			elif mnemonic in ['JSR', 'JSL']:
				# Subroutine call - continue with next instruction
				to_analyze.append(next_offset)

			elif mnemonic in ['RTS', 'RTL', 'RTI']:
				# Return instruction - stop linear analysis
				break

			elif mnemonic == 'BRK':
				# Break instruction - stop
				break

			else:
				# Normal instruction - continue linearly
				to_analyze.append(next_offset)

		return sorted(instructions, key=lambda x: x['offset'])

	def identify_functions(self, code_region: List[Dict[str, Any]]) -> Dict[int, str]:
		"""
		Identify function boundaries and generate names
		"""
		functions = {}

		for instruction in code_region:
			mnemonic = instruction['mnemonic']

			# JSR/JSL targets are functions
			if mnemonic in ['JSR', 'JSL']:
				if instruction['addressing'] in ['absolute', 'long']:
					# Extract target address
					bytes_data = instruction['bytes']
					if len(bytes_data) >= 3:
						if mnemonic == 'JSL' and len(bytes_data) >= 4:
							addr = bytes_data[1] | (bytes_data[2] << 8) | (bytes_data[3] << 16)
							bank = (addr >> 16) & 0xff
							target_offset = self.snes_address_to_rom_offset(bank, addr & 0xffff)
						else:
							addr = bytes_data[1] | (bytes_data[2] << 8)
							target_offset = self.snes_address_to_rom_offset(instruction['bank'], addr)

						if target_offset >= 0:
							func_name = f"function_{target_offset:06X}"
							functions[target_offset] = func_name

		return functions

	def disassemble_code_regions(self) -> List[CodeRegion]:
		"""
		Disassemble all identified code regions from the coverage analysis
		"""
		print("DISASM: Starting comprehensive code disassembly...")

		code_regions = []

		# Get code regions from coverage data
		if not self.coverage_data:
			print("WARNING: No coverage data found, using heuristic detection")
			# Fall back to heuristic code detection
			code_offsets = self._detect_code_heuristic()
		else:
			code_offsets = self._get_code_regions_from_coverage()

		print(f"Found {len(code_offsets)} code regions to disassemble")

		for i, (start_offset, end_offset) in enumerate(code_offsets[:50]):	# Limit for now
			print(f"Disassembling region {i+1}/{len(code_offsets[:50])}: ${start_offset:06X}-${end_offset:06X}")

			instructions = []
			current_offset = start_offset

			while current_offset < end_offset and current_offset < self.rom_size:
				instruction, next_offset = self.disassemble_instruction(current_offset)
				if instruction is None:
					current_offset += 1	# Skip invalid byte
					continue

				instructions.append(instruction)

				# Handle processor flag changes
				if instruction['mnemonic'] == 'REP' and len(instruction['bytes']) >= 2:
					flags = instruction['bytes'][1]
					if flags & 0x20:	# M flag
						self.current_m_flag = False	# 16-bit accumulator
					if flags & 0x10:	# X flag
						self.current_x_flag = False	# 16-bit index
				elif instruction['mnemonic'] == 'SEP' and len(instruction['bytes']) >= 2:
					flags = instruction['bytes'][1]
					if flags & 0x20:	# M flag
						self.current_m_flag = True	 # 8-bit accumulator
					if flags & 0x10:	# X flag
						self.current_x_flag = True	 # 8-bit index

				current_offset = next_offset

			if instructions:
				bank, snes_addr = self.rom_offset_to_snes_address(start_offset)

				# Identify functions in this region
				functions = self.identify_functions(instructions)

				region = CodeRegion(
					start_offset=start_offset,
					end_offset=end_offset,
					bank=bank,
					snes_address=snes_addr,
					instructions=instructions,
					labels=set(functions.values()),
					comments=[]
				)

				code_regions.append(region)

				# Add function labels to global mapping
				self.function_names.update(functions)

		self.code_regions = code_regions
		return code_regions

	def _get_code_regions_from_coverage(self) -> List[Tuple[int, int]]:
		"""Extract code regions from coverage analysis data"""
		# This would parse the coverage data to find code regions
		# For now, return some common code areas
		regions = [
			(0x8000, 0x8000 + 1024),	 # Reset vector area
			(0x10000, 0x10000 + 2048),	# Bank 1 code
			(0x18000, 0x18000 + 4096),	# Bank 2 code
			(0x20000, 0x20000 + 8192),	# Bank 3 code
		]

		return [(start, end) for start, end in regions if end <= self.rom_size]

	def _detect_code_heuristic(self) -> List[Tuple[int, int]]:
		"""Heuristic code detection when coverage data is not available"""
		code_regions = []

		# Check common SNES code entry points
		entry_points = [0x8000, 0x10000, 0x18000, 0x20000]

		for entry in entry_points:
			if entry < self.rom_size:
				# Analyze a reasonable chunk
				end_point = min(entry + 4096, self.rom_size)
				code_regions.append((entry, end_point))

		return code_regions

	def generate_assembly_output(self, output_dir: str = "src"):
		"""
		Generate complete assembly source files from disassembled code
		"""
		output_path = Path(output_dir)
		output_path.mkdir(exist_ok=True)

		print(f"GENERATING: Assembly source files in {output_path}")

		# Generate main assembly file
		main_file = output_path / "dq3_main.asm"
		self._generate_main_assembly(main_file)

		# Generate bank-specific files
		banks = defaultdict(list)
		for region in self.code_regions:
			banks[region.bank].append(region)

		for bank_num, regions in banks.items():
			bank_file = output_path / f"bank_{bank_num:02X}.asm"
			self._generate_bank_assembly(bank_file, bank_num, regions)

		# Generate include files
		self._generate_includes(output_path)

		print(f"Generated {len(banks)} bank files + includes")

	def _generate_main_assembly(self, filepath: Path):
		"""Generate main assembly file with includes and setup"""
		with open(filepath, 'w') as f:
			f.write("; Dragon Quest III - Main Assembly File\n")
			f.write("; Generated by Advanced SNES Disassembler\n")
			f.write(f"; Total ROM size: {self.rom_size:,} bytes\n")
			f.write(f"; Code regions: {len(self.code_regions)}\n\n")

			f.write(".MEMORYMAP\n")
			f.write("SLOTSIZE $8000\n")
			f.write("DEFAULTSLOT 0\n")
			f.write("SLOT 0 $8000\n")
			f.write(".ENDME\n\n")

			f.write(".ROMBANKSIZE $8000\n")
			f.write(".ROMBANKS 128\n\n")

			f.write(".LOROM\n\n")

			# Include all bank files
			banks = set(region.bank for region in self.code_regions)
			for bank in sorted(banks):
				f.write(f".INCLUDE \"bank_{bank:02X}.asm\"\n")

	def _generate_bank_assembly(self, filepath: Path, bank_num: int, regions: List[CodeRegion]):
		"""Generate assembly for a specific bank"""
		with open(filepath, 'w') as f:
			f.write(f"; Dragon Quest III - Bank ${bank_num:02X}\n")
			f.write(f"; Regions: {len(regions)}\n\n")

			f.write(f".BANK {bank_num}\n")
			f.write(f".ORG $0000\n\n")

			for region in regions:
				f.write(f"; Region ${region.start_offset:06X}-${region.end_offset:06X}\n")
				f.write(f"; SNES address: ${bank_num:02X}:${region.snes_address:04X}\n")
				f.write(f"region_{region.start_offset:06X}:\n")

				for instruction in region.instructions:
					# Check if this instruction is a function entry point
					if instruction['offset'] in self.function_names:
						func_name = self.function_names[instruction['offset']]
						f.write(f"\n{func_name}:\n")

					# Format instruction
					addr_comment = f"; ${instruction['offset']:06X} [{instruction['bank']:02X}:${instruction['address']:04X}]"
					bytes_str = ' '.join(f"{b:02X}" for b in instruction['bytes'])
					bytes_comment = f" ; {bytes_str}"

					if instruction['operands']:
						asm_line = f"	{instruction['mnemonic']} {instruction['operands']}"
					else:
						asm_line = f"	{instruction['mnemonic']}"

					f.write(f"{asm_line:<20}{bytes_comment:<15}{addr_comment}\n")

				f.write("\n")

	def _generate_includes(self, output_dir: Path):
		"""Generate include files for constants and labels"""

		# Generate constants file
		constants_file = output_dir / "constants.inc"
		with open(constants_file, 'w') as f:
			f.write("; Dragon Quest III - Constants\n\n")

			# SNES hardware registers
			f.write("; SNES Hardware Registers\n")
			f.write(".DEFINE INIDISP	$2100\n")
			f.write(".DEFINE OBJSEL	 $2101\n")
			f.write(".DEFINE OAMADDL	$2102\n")
			f.write(".DEFINE OAMADDH	$2103\n")
			f.write(".DEFINE OAMDATA	$2104\n")
			f.write(".DEFINE BGMODE	 $2105\n")
			f.write(".DEFINE MOSAIC	 $2106\n")
			f.write(".DEFINE BG1SC		$2107\n")
			f.write(".DEFINE BG2SC		$2108\n")
			f.write(".DEFINE BG3SC		$2109\n")
			f.write(".DEFINE BG4SC		$210a\n")
			f.write(".DEFINE BG12NBA	$210b\n")
			f.write(".DEFINE BG34NBA	$210c\n")
			f.write(".DEFINE BG1HOFS	$210d\n")
			f.write(".DEFINE BG1VOFS	$210e\n")
			f.write(".DEFINE BG2HOFS	$210f\n")
			f.write(".DEFINE BG2VOFS	$2110\n")
			f.write("\n")

			# Game-specific constants
			f.write("; Game Constants\n")
			f.write(".DEFINE MAX_PARTY_MEMBERS	4\n")
			f.write(".DEFINE MAX_INVENTORY	 102\n")
			f.write(".DEFINE SAVE_DATA_SIZE	 $1000\n")
			f.write("\n")

		# Generate labels file
		labels_file = output_dir / "labels.inc"
		with open(labels_file, 'w') as f:
			f.write("; Dragon Quest III - Labels\n\n")

			for offset, name in sorted(self.function_names.items()):
				bank, addr = self.rom_offset_to_snes_address(offset)
				f.write(f".DEFINE {name.upper():<30} ${addr:04X}	; Bank ${bank:02X}\n")

def main():
	"""Main entry point for code disassembly"""

	print("INIT: Dragon Quest III - Advanced Code Disassembler")
	print("=" * 60)

	# Find ROM file
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

	# Initialize disassembler
	coverage_data_path = 'reports/maximum_coverage_analysis.json'
	disassembler = SNESDisassembler(rom_path, coverage_data_path)

	# Disassemble code regions
	code_regions = disassembler.disassemble_code_regions()

	print(f"Disassembled {len(code_regions)} code regions")
	print(f"Total instructions: {sum(len(region.instructions) for region in code_regions)}")

	# Generate assembly output
	disassembler.generate_assembly_output()

	print("\nCODE DISASSEMBLY COMPLETE!")

if __name__ == "__main__":
	main()
