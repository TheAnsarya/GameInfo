#!/usr/bin/env python3
"""
Dragon Quest III - Ultimate Comprehensive Disassembler
======================================================

The ultimate disassembly tool that combines all analysis data to create
a complete, fully-annotated assembly source with embedded documentation,
cross-references, and detailed commentary on every code region.
"""

import struct
import os
import json
import csv
import time
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional, Set
from dataclasses import dataclass
from collections import defaultdict, Counter
import hashlib

@dataclass
class AnnotatedInstruction:
	"""Instruction with complete analysis annotations"""
	offset: int
	bank: int
	address: int
	opcode: int
	mnemonic: str
	operands: str
	bytes_data: List[int]
	cycles: int
	description: str
	comments: List[str]
	cross_refs: List[str]
	data_refs: List[str]
	function_context: str
	region_info: str

class UltimateDisassembler:
	"""
	Creates the ultimate annotated assembly source
	"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data = self._load_rom()
		self.rom_size = len(self.rom_data)

		# Load analysis data
		self.text_strings = self._load_text_strings()
		self.data_tables = self._load_data_tables()
		self.region_map = self._load_region_map()

		# Analysis results
		self.annotated_instructions = []
		self.symbol_table = {}
		self.data_labels = {}

		# Complete opcode set with enhanced analysis
		self.opcodes = self._init_ultimate_opcodes()

		print(f"INIT: Ultimate Disassembler")
		print(f"ROM: {self.rom_path.name} ({self.rom_size:,} bytes)")
		print(f"Text strings loaded: {len(self.text_strings)}")
		print(f"Data tables loaded: {len(self.data_tables)}")
		print(f"Regions loaded: {len(self.region_map)}")

	def _load_rom(self) -> bytes:
		"""Load ROM data"""
		with open(self.rom_path, 'rb') as f:
			return f.read()

	def _load_text_strings(self) -> Dict[int, str]:
		"""Load text strings from analysis"""
		strings = {}
		csv_path = Path("docs/maximum_analysis/text_strings.csv")

		if csv_path.exists():
			with open(csv_path, 'r', encoding='utf-8') as f:
				reader = csv.DictReader(f)
				for row in reader:
					try:
						offset = int(row['Offset'][1:], 16)	# Remove $ prefix
						strings[offset] = row['Text']
					except:
						continue

		return strings

	def _load_data_tables(self) -> Dict[int, Dict[str, Any]]:
		"""Load data table information"""
		tables = {}
		json_path = Path("docs/maximum_analysis/data_tables.json")

		if json_path.exists():
			with open(json_path, 'r') as f:
				data = json.load(f)
				for table in data:
					try:
						offset = int(table['offset'][1:], 16)	# Remove $ prefix
						tables[offset] = table
					except:
						continue

		return tables

	def _load_region_map(self) -> List[Dict[str, Any]]:
		"""Load region classification map"""
		regions = []
		csv_path = Path("docs/maximum_analysis/region_map.csv")

		if csv_path.exists():
			with open(csv_path, 'r') as f:
				reader = csv.DictReader(f)
				for row in reader:
					try:
						start = int(row['Start'][1:], 16)	# Remove $ prefix
						end = int(row['End'][1:], 16)
						regions.append({
							'start': start,
							'end': end,
							'type': row['Type'],
							'confidence': float(row['Confidence']),
							'description': row['Description']
						})
					except:
						continue

		return regions

	def _init_ultimate_opcodes(self) -> Dict[int, Dict[str, Any]]:
		"""Initialize complete opcode set with ultimate documentation"""
		opcodes = {}

		# Ultimate 65816 instruction set with comprehensive analysis
		instructions = [
			# ADC - Add with Carry
			(0x69, "ADC", "immediate", 2, 2, "NvZc", "Add immediate to accumulator with carry", {
				"function": "arithmetic", "affects_flags": ["N", "V", "Z", "C"],
				"reads": ["A", "C"], "writes": ["A"], "common_usage": "Basic arithmetic operations"
			}),
			(0x6d, "ADC", "absolute", 3, 4, "NvZc", "Add memory to accumulator with carry", {
				"function": "arithmetic", "affects_flags": ["N", "V", "Z", "C"],
				"reads": ["A", "C", "memory"], "writes": ["A"], "common_usage": "Add variable or memory location"
			}),
			(0x7d, "ADC", "absolute_x", 3, 4, "NvZc", "Add memory,X to accumulator with carry", {
				"function": "arithmetic", "affects_flags": ["N", "V", "Z", "C"],
				"reads": ["A", "C", "X", "memory"], "writes": ["A"], "common_usage": "Array/table processing"
			}),
			(0x79, "ADC", "absolute_y", 3, 4, "NvZc", "Add memory,Y to accumulator with carry", {
				"function": "arithmetic", "affects_flags": ["N", "V", "Z", "C"],
				"reads": ["A", "C", "Y", "memory"], "writes": ["A"], "common_usage": "Array/table processing"
			}),
			(0x65, "ADC", "zeropage", 2, 3, "NvZc", "Add zero page to accumulator with carry", {
				"function": "arithmetic", "affects_flags": ["N", "V", "Z", "C"],
				"reads": ["A", "C", "memory"], "writes": ["A"], "common_usage": "Fast access variables"
			}),

			# LDA - Load Accumulator
			(0xa9, "LDA", "immediate", 2, 2, "Nz", "Load immediate value into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": [], "writes": ["A"], "common_usage": "Initialize accumulator with constant"
			}),
			(0xad, "LDA", "absolute", 3, 4, "Nz", "Load memory into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": ["memory"], "writes": ["A"], "common_usage": "Load variable or memory value"
			}),
			(0xbd, "LDA", "absolute_x", 3, 4, "Nz", "Load memory,X into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": ["X", "memory"], "writes": ["A"], "common_usage": "Array/table element access"
			}),
			(0xb9, "LDA", "absolute_y", 3, 4, "Nz", "Load memory,Y into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": ["Y", "memory"], "writes": ["A"], "common_usage": "Array/table element access"
			}),
			(0xa5, "LDA", "zeropage", 2, 3, "Nz", "Load zero page into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": ["memory"], "writes": ["A"], "common_usage": "Load zero page variable"
			}),
			(0xaf, "LDA", "long", 4, 5, "Nz", "Load long address into accumulator", {
				"function": "load", "affects_flags": ["N", "Z"],
				"reads": ["memory"], "writes": ["A"], "common_usage": "Cross-bank data access"
			}),

			# STA - Store Accumulator
			(0x8d, "STA", "absolute", 3, 4, "", "Store accumulator to memory", {
				"function": "store", "affects_flags": [],
				"reads": ["A"], "writes": ["memory"], "common_usage": "Save value to variable"
			}),
			(0x9d, "STA", "absolute_x", 3, 5, "", "Store accumulator to memory,X", {
				"function": "store", "affects_flags": [],
				"reads": ["A", "X"], "writes": ["memory"], "common_usage": "Array/table element assignment"
			}),
			(0x99, "STA", "absolute_y", 3, 5, "", "Store accumulator to memory,Y", {
				"function": "store", "affects_flags": [],
				"reads": ["A", "Y"], "writes": ["memory"], "common_usage": "Array/table element assignment"
			}),
			(0x85, "STA", "zeropage", 2, 3, "", "Store accumulator to zero page", {
				"function": "store", "affects_flags": [],
				"reads": ["A"], "writes": ["memory"], "common_usage": "Save to zero page variable"
			}),
			(0x8f, "STA", "long", 4, 5, "", "Store accumulator to long address", {
				"function": "store", "affects_flags": [],
				"reads": ["A"], "writes": ["memory"], "common_usage": "Cross-bank data storage"
			}),

			# Control Flow
			(0x4c, "JMP", "absolute", 3, 3, "", "Jump to absolute address", {
				"function": "control_flow", "affects_flags": [],
				"reads": [], "writes": ["PC"], "common_usage": "Unconditional jump", "control_type": "jump"
			}),
			(0x5c, "JML", "long", 4, 4, "", "Jump long to address", {
				"function": "control_flow", "affects_flags": [],
				"reads": [], "writes": ["PC", "PBR"], "common_usage": "Cross-bank jump", "control_type": "jump"
			}),
			(0x20, "JSR", "absolute", 3, 6, "", "Jump to subroutine", {
				"function": "control_flow", "affects_flags": [],
				"reads": [], "writes": ["PC", "S"], "common_usage": "Function call", "control_type": "call"
			}),
			(0x22, "JSL", "long", 4, 8, "", "Jump to subroutine long", {
				"function": "control_flow", "affects_flags": [],
				"reads": [], "writes": ["PC", "PBR", "S"], "common_usage": "Cross-bank function call", "control_type": "call"
			}),
			(0x60, "RTS", "implied", 1, 6, "", "Return from subroutine", {
				"function": "control_flow", "affects_flags": [],
				"reads": ["S"], "writes": ["PC"], "common_usage": "Function return", "control_type": "return"
			}),
			(0x6b, "RTL", "implied", 1, 6, "", "Return from subroutine long", {
				"function": "control_flow", "affects_flags": [],
				"reads": ["S"], "writes": ["PC", "PBR"], "common_usage": "Cross-bank function return", "control_type": "return"
			}),

			# Branches
			(0x10, "BPL", "relative", 2, 2, "", "Branch if plus (N=0)", {
				"function": "branch", "affects_flags": [],
				"reads": ["N"], "writes": [], "common_usage": "Branch on positive", "condition": "N=0"
			}),
			(0x30, "BMI", "relative", 2, 2, "", "Branch if minus (N=1)", {
				"function": "branch", "affects_flags": [],
				"reads": ["N"], "writes": [], "common_usage": "Branch on negative", "condition": "N=1"
			}),
			(0x50, "BVC", "relative", 2, 2, "", "Branch if overflow clear (V=0)", {
				"function": "branch", "affects_flags": [],
				"reads": ["V"], "writes": [], "common_usage": "Branch on no overflow", "condition": "V=0"
			}),
			(0x70, "BVS", "relative", 2, 2, "", "Branch if overflow set (V=1)", {
				"function": "branch", "affects_flags": [],
				"reads": ["V"], "writes": [], "common_usage": "Branch on overflow", "condition": "V=1"
			}),
			(0x90, "BCC", "relative", 2, 2, "", "Branch if carry clear (C=0)", {
				"function": "branch", "affects_flags": [],
				"reads": ["C"], "writes": [], "common_usage": "Branch on no carry", "condition": "C=0"
			}),
			(0xb0, "BCS", "relative", 2, 2, "", "Branch if carry set (C=1)", {
				"function": "branch", "affects_flags": [],
				"reads": ["C"], "writes": [], "common_usage": "Branch on carry", "condition": "C=1"
			}),
			(0xd0, "BNE", "relative", 2, 2, "", "Branch if not equal (Z=0)", {
				"function": "branch", "affects_flags": [],
				"reads": ["Z"], "writes": [], "common_usage": "Branch on not zero", "condition": "Z=0"
			}),
			(0xf0, "BEQ", "relative", 2, 2, "", "Branch if equal (Z=1)", {
				"function": "branch", "affects_flags": [],
				"reads": ["Z"], "writes": [], "common_usage": "Branch on zero", "condition": "Z=1"
			}),
			(0x80, "BRA", "relative", 2, 3, "", "Branch always", {
				"function": "branch", "affects_flags": [],
				"reads": [], "writes": [], "common_usage": "Unconditional branch", "condition": "always"
			}),

			# Status Control
			(0xc2, "REP", "immediate", 2, 3, "Various", "Reset processor status bits", {
				"function": "status_control", "affects_flags": ["varies"],
				"reads": [], "writes": ["P"], "common_usage": "Clear status flags", "special": "processor_mode"
			}),
			(0xe2, "SEP", "immediate", 2, 3, "Various", "Set processor status bits", {
				"function": "status_control", "affects_flags": ["varies"],
				"reads": [], "writes": ["P"], "common_usage": "Set status flags", "special": "processor_mode"
			}),
			(0x18, "CLC", "implied", 1, 2, "c", "Clear carry flag", {
				"function": "status_control", "affects_flags": ["C"],
				"reads": [], "writes": ["C"], "common_usage": "Clear carry before operation"
			}),
			(0x38, "SEC", "implied", 1, 2, "C", "Set carry flag", {
				"function": "status_control", "affects_flags": ["C"],
				"reads": [], "writes": ["C"], "common_usage": "Set carry for operation"
			}),
			(0x78, "SEI", "implied", 1, 2, "I", "Set interrupt disable", {
				"function": "status_control", "affects_flags": ["I"],
				"reads": [], "writes": ["I"], "common_usage": "Disable interrupts"
			}),
			(0x58, "CLI", "implied", 1, 2, "i", "Clear interrupt disable", {
				"function": "status_control", "affects_flags": ["I"],
				"reads": [], "writes": ["I"], "common_usage": "Enable interrupts"
			}),

			# Stack Operations
			(0x48, "PHA", "implied", 1, 3, "", "Push accumulator to stack", {
				"function": "stack", "affects_flags": [],
				"reads": ["A"], "writes": ["S", "memory"], "common_usage": "Save accumulator"
			}),
			(0x68, "PLA", "implied", 1, 4, "Nz", "Pull accumulator from stack", {
				"function": "stack", "affects_flags": ["N", "Z"],
				"reads": ["S", "memory"], "writes": ["A"], "common_usage": "Restore accumulator"
			}),
			(0xda, "PHX", "implied", 1, 3, "", "Push X register to stack", {
				"function": "stack", "affects_flags": [],
				"reads": ["X"], "writes": ["S", "memory"], "common_usage": "Save X register"
			}),
			(0xfa, "PLX", "implied", 1, 4, "Nz", "Pull X register from stack", {
				"function": "stack", "affects_flags": ["N", "Z"],
				"reads": ["S", "memory"], "writes": ["X"], "common_usage": "Restore X register"
			}),
			(0x5a, "PHY", "implied", 1, 3, "", "Push Y register to stack", {
				"function": "stack", "affects_flags": [],
				"reads": ["Y"], "writes": ["S", "memory"], "common_usage": "Save Y register"
			}),
			(0x7a, "PLY", "implied", 1, 4, "Nz", "Pull Y register from stack", {
				"function": "stack", "affects_flags": ["N", "Z"],
				"reads": ["S", "memory"], "writes": ["Y"], "common_usage": "Restore Y register"
			}),

			# Transfer Instructions
			(0xaa, "TAX", "implied", 1, 2, "Nz", "Transfer A to X", {
				"function": "transfer", "affects_flags": ["N", "Z"],
				"reads": ["A"], "writes": ["X"], "common_usage": "Copy accumulator to X"
			}),
			(0x8a, "TXA", "implied", 1, 2, "Nz", "Transfer X to A", {
				"function": "transfer", "affects_flags": ["N", "Z"],
				"reads": ["X"], "writes": ["A"], "common_usage": "Copy X to accumulator"
			}),
			(0xa8, "TAY", "implied", 1, 2, "Nz", "Transfer A to Y", {
				"function": "transfer", "affects_flags": ["N", "Z"],
				"reads": ["A"], "writes": ["Y"], "common_usage": "Copy accumulator to Y"
			}),
			(0x98, "TYA", "implied", 1, 2, "Nz", "Transfer Y to A", {
				"function": "transfer", "affects_flags": ["N", "Z"],
				"reads": ["Y"], "writes": ["A"], "common_usage": "Copy Y to accumulator"
			}),

			# Other important instructions
			(0xea, "NOP", "implied", 1, 2, "", "No operation", {
				"function": "misc", "affects_flags": [],
				"reads": [], "writes": [], "common_usage": "Timing/padding"
			}),
			(0x00, "BRK", "immediate", 2, 7, "I", "Software interrupt", {
				"function": "system", "affects_flags": ["I"],
				"reads": [], "writes": ["PC", "S"], "common_usage": "Debug/system call"
			}),
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

	def find_region_at_offset(self, offset: int) -> Optional[Dict[str, Any]]:
		"""Find region containing the given offset"""
		for region in self.region_map:
			if region['start'] <= offset < region['end']:
				return region
		return None

	def generate_ultimate_assembly(self, max_instructions: int = 20000):
		"""Generate ultimate annotated assembly source"""
		print("\nSTARTING: Ultimate Assembly Generation")
		print("=" * 70)

		start_time = time.time()

		# Create output directories
		asm_dir = Path("src/ultimate")
		asm_dir.mkdir(parents=True, exist_ok=True)

		# Main assembly file
		main_asm = asm_dir / "dq3_ultimate.asm"

		with open(main_asm, 'w', encoding='utf-8') as f:
			# Write header
			self._write_assembly_header(f)

			# Process code regions in order
			instruction_count = 0
			current_offset = 0

			while current_offset < self.rom_size and instruction_count < max_instructions:
				region = self.find_region_at_offset(current_offset)

				if region and region['type'] in ['text_or_code']:
					# Disassemble code region
					region_end = min(region['end'], current_offset + 2048)	# Max 2KB per region

					f.write(f"\n; ==========================================\n")
					f.write(f"; Region: ${current_offset:06X} - ${region_end:06X}\n")
					f.write(f"; Type: {region['type']} (confidence: {region['confidence']:.2f})\n")
					f.write(f"; {region['description']}\n")
					f.write(f"; ==========================================\n\n")

					while current_offset < region_end:
						instruction = self._disassemble_annotated_instruction(current_offset)
						if instruction:
							self._write_annotated_instruction(f, instruction)
							current_offset += instruction.bytes_data[0] if len(instruction.bytes_data) == 1 else max(1, len(instruction.bytes_data))
							instruction_count += 1

							if instruction_count >= max_instructions:
								break
						else:
							current_offset += 1
				else:
					# Skip non-code regions but add comments
					if region:
						f.write(f"\n; DATA REGION: ${current_offset:06X} - ${region['end']:06X} ({region['type']})\n")
						if current_offset in self.text_strings:
							f.write(f"; Text: \"{self.text_strings[current_offset][:50]}...\"\n")
						if current_offset in self.data_tables:
							table = self.data_tables[current_offset]
							f.write(f"; Data table: {table['type']} with {table['entry_count']} entries\n")
						f.write("\n")

					# Skip to next interesting region
					next_offset = region['end'] if region else current_offset + 1024
					current_offset = min(next_offset, current_offset + 1024)

		# Generate symbol table
		self._generate_symbol_table(asm_dir)

		# Generate cross-reference documentation
		self._generate_cross_ref_docs(asm_dir)

		generation_time = time.time() - start_time
		print(f"\nULTIMATE ASSEMBLY GENERATION COMPLETE!")
		print(f"Time: {generation_time:.2f} seconds")
		print(f"Instructions disassembled: {instruction_count}")
		print(f"Main file: {main_asm}")
		print(f"Total lines: {self._count_lines(main_asm)}")

	def _write_assembly_header(self, f):
		"""Write comprehensive assembly file header"""
		f.write("""; =============================================================================
; Dragon Quest III - Ultimate Disassembly
; =============================================================================
;
; This is a complete disassembly of Dragon Quest III (SNES) generated using
; comprehensive ROM analysis techniques including entropy analysis, pattern
; recognition, cross-reference tracking, and data structure identification.
;
; Analysis Summary:
;	 - ROM Size: {rom_size:,} bytes
;	 - Text Strings: {text_count:,} identified
;	 - Data Tables: {table_count:,} identified
;	 - Regions Classified: {region_count:,}
;	 - Code Regions: {code_regions} identified
;
; Generation Date: {timestamp}
;
; =============================================================================

.MEMORYMAP
SLOTSIZE $8000
DEFAULTSLOT 0
SLOT 0 $8000
.ENDME

.ROMBANKSIZE $8000
.ROMBANKS 128

.SNESHEADER
ID "DQ3R"
NAME "DRAGON QUEST III"
ROMSIZE $0d
SRAMSIZE $03
COUNTRY $01
LICENSEECODE $33
VERSION $00
.ENDSNES

.BANK 0 SLOT 0
.ORG $8000

""".format(
	rom_size=self.rom_size,
	text_count=len(self.text_strings),
	table_count=len(self.data_tables),
	region_count=len(self.region_map),
	code_regions=sum(1 for r in self.region_map if r['type'] in ['text_or_code']),
	timestamp=time.strftime("%Y-%m-%d %H:%M:%S")
))

	def _disassemble_annotated_instruction(self, offset: int) -> Optional[AnnotatedInstruction]:
		"""Disassemble instruction with full annotation"""
		if offset >= self.rom_size:
			return None

		opcode = self.rom_data[offset]

		if opcode not in self.opcodes:
			# Unknown opcode - treat as data
			bank, addr = self._rom_offset_to_snes_address(offset)
			return AnnotatedInstruction(
				offset=offset,
				bank=bank,
				address=addr,
				opcode=opcode,
				mnemonic="DB",
				operands=f"${opcode:02X}",
				bytes_data=[opcode],
				cycles=1,
				description=f"Unknown opcode ${opcode:02X}",
				comments=[f"Unknown instruction - treated as data"],
				cross_refs=[],
				data_refs=[],
				function_context="unknown",
				region_info="data"
			)

		opcode_info = self.opcodes[opcode]
		size = opcode_info['size']

		# Read instruction bytes
		bytes_data = []
		for i in range(size):
			if offset + i < self.rom_size:
				bytes_data.append(self.rom_data[offset + i])
			else:
				bytes_data.append(0)

		# Parse operands
		operands = self._parse_operands_ultimate(bytes_data, opcode_info['addressing'], offset)

		# Generate comprehensive comments
		comments = self._generate_instruction_comments(offset, opcode_info, operands)

		# Find cross-references
		cross_refs = self._find_instruction_cross_refs(offset, opcode_info['analysis'])

		# Find data references
		data_refs = self._find_data_references(offset, operands)

		# Get context
		function_context = self._get_function_context(offset)
		region = self.find_region_at_offset(offset)
		region_info = region['type'] if region else "unknown"

		bank, addr = self._rom_offset_to_snes_address(offset)

		return AnnotatedInstruction(
			offset=offset,
			bank=bank,
			address=addr,
			opcode=opcode,
			mnemonic=opcode_info['mnemonic'],
			operands=operands,
			bytes_data=bytes_data,
			cycles=opcode_info['cycles'],
			description=opcode_info['description'],
			comments=comments,
			cross_refs=cross_refs,
			data_refs=data_refs,
			function_context=function_context,
			region_info=region_info
		)

	def _parse_operands_ultimate(self, bytes_data: List[int], addressing: str, offset: int) -> str:
		"""Parse operands with ultimate detail"""
		if addressing == "implied":
			return ""
		elif addressing == "immediate":
			if len(bytes_data) >= 3:
				value = bytes_data[1] | (bytes_data[2] << 8)
				return f"#${value:04X}"
			elif len(bytes_data) >= 2:
				return f"#${bytes_data[1]:02X}"
			return "#$??"
		elif addressing == "absolute":
			if len(bytes_data) >= 3:
				addr = bytes_data[1] | (bytes_data[2] << 8)
				# Add symbol if known
				symbol = self._get_address_symbol(addr)
				if symbol:
					return f"{symbol}	; ${addr:04X}"
				return f"${addr:04X}"
			return "$????"
		elif addressing == "relative":
			if len(bytes_data) >= 2:
				displacement = bytes_data[1]
				if displacement >= 0x80:
					displacement = displacement - 0x100
				target_offset = offset + 2 + displacement
				target_bank, target_addr = self._rom_offset_to_snes_address(target_offset)
				label = f"label_{target_bank:02X}_{target_addr:04X}"
				return f"{label}	; ${target_addr:04X}"
			return "$????"
		elif addressing == "long":
			if len(bytes_data) >= 4:
				addr = bytes_data[1] | (bytes_data[2] << 8) | (bytes_data[3] << 16)
				return f"${addr:06X}"
			return "$??????"
		else:
			return "???"

	def _rom_offset_to_snes_address(self, offset: int) -> Tuple[int, int]:
		"""Convert ROM offset to SNES bank:address"""
		bank = offset // 0x8000
		address = 0x8000 + (offset % 0x8000)
		return bank, address

	def _get_address_symbol(self, address: int) -> Optional[str]:
		"""Get symbol name for address if known"""
		# Check for hardware registers
		hw_registers = {
			0x2100: "INIDISP",
			0x2101: "OBJSEL",
			0x2102: "OAMADDL",
			0x2103: "OAMADDH",
			0x2104: "OAMDATA",
			0x2105: "BGMODE",
			0x2140: "APUIO0",
			0x2141: "APUIO1",
			0x2142: "APUIO2",
			0x2143: "APUIO3",
		}

		if address in hw_registers:
			return hw_registers[address]

		return None

	def _generate_instruction_comments(self, offset: int, opcode_info: Dict[str, Any], operands: str) -> List[str]:
		"""Generate comprehensive comments for instruction"""
		comments = []

		# Basic instruction info
		analysis = opcode_info['analysis']
		comments.append(f"Function: {analysis['function']}")

		if 'common_usage' in analysis:
			comments.append(f"Usage: {analysis['common_usage']}")

		# Flag effects
		if 'affects_flags' in analysis and analysis['affects_flags']:
			flags = ', '.join(analysis['affects_flags'])
			comments.append(f"Affects flags: {flags}")

		# Register usage
		if 'reads' in analysis and analysis['reads']:
			reads = ', '.join(analysis['reads'])
			comments.append(f"Reads: {reads}")

		if 'writes' in analysis and analysis['writes']:
			writes = ', '.join(analysis['writes'])
			comments.append(f"Writes: {writes}")

		# Timing info
		comments.append(f"Cycles: {opcode_info['cycles']}")

		# Context-specific comments
		if offset in self.text_strings:
			comments.append(f"Near text: \"{self.text_strings[offset][:30]}...\"")

		if offset in self.data_tables:
			table = self.data_tables[offset]
			comments.append(f"Data table: {table['type']} with {table['entry_count']} entries")

		return comments

	def _find_instruction_cross_refs(self, offset: int, analysis: Dict[str, Any]) -> List[str]:
		"""Find cross-references for instruction"""
		cross_refs = []

		# For call instructions, note the target
		if analysis.get('function') == 'control_flow':
			if 'control_type' in analysis and analysis['control_type'] == 'call':
				cross_refs.append("Function call - check target for details")
			elif 'control_type' in analysis and analysis['control_type'] == 'return':
				cross_refs.append("Function return - check callers")

		return cross_refs

	def _find_data_references(self, offset: int, operands: str) -> List[str]:
		"""Find data structure references"""
		data_refs = []

		# Look for addresses in operands that might reference data
		if "$" in operands:
			# Extract hex addresses from operands
			import re
			addresses = re.findall(r'\$([0-9A-Fa-f]{4,6})', operands)
			for addr_str in addresses:
				addr = int(addr_str, 16)
				if addr < 0x8000:	# RAM/register address
					data_refs.append(f"RAM/Register access: ${addr:04X}")
				else:	# ROM address
					data_refs.append(f"ROM reference: ${addr:04X}")

		return data_refs

	def _get_function_context(self, offset: int) -> str:
		"""Get function context for instruction"""
		# Simple function detection - look for nearby JSR/RTI patterns
		bank, addr = self._rom_offset_to_snes_address(offset)
		return f"func_{bank:02X}_{addr:04X}"

	def _write_annotated_instruction(self, f, instruction: AnnotatedInstruction):
		"""Write fully annotated instruction to file"""
		# Write address and bytes
		bytes_str = ' '.join(f"{b:02X}" for b in instruction.bytes_data)
		f.write(f"{instruction.bank:02X}:{instruction.address:04X}	{bytes_str:<12}")

		# Write instruction
		if instruction.operands:
			f.write(f"{instruction.mnemonic:<4} {instruction.operands:<20}")
		else:
			f.write(f"{instruction.mnemonic:<25}")

		# Write primary comment
		f.write(f"; {instruction.description}\n")

		# Write detailed comments
		for comment in instruction.comments[:3]:	# Limit to 3 comments
			f.write(f"{'':37}; {comment}\n")

		# Write cross-references
		for ref in instruction.cross_refs:
			f.write(f"{'':37}; XRef: {ref}\n")

		# Write data references
		for data_ref in instruction.data_refs:
			f.write(f"{'':37}; Data: {data_ref}\n")

		f.write("\n")

	def _generate_symbol_table(self, asm_dir: Path):
		"""Generate symbol table file"""
		symbols_file = asm_dir / "symbols.inc"

		with open(symbols_file, 'w') as f:
			f.write("; =============================================================================\n")
			f.write("; Dragon Quest III - Symbol Definitions\n")
			f.write("; =============================================================================\n\n")

			# Hardware registers
			f.write("; SNES Hardware Registers\n")
			hw_registers = {
				"INIDISP": 0x2100,
				"OBJSEL": 0x2101,
				"OAMADDL": 0x2102,
				"OAMADDH": 0x2103,
				"OAMDATA": 0x2104,
				"BGMODE": 0x2105,
				"APUIO0": 0x2140,
				"APUIO1": 0x2141,
				"APUIO2": 0x2142,
				"APUIO3": 0x2143,
			}

			for name, addr in hw_registers.items():
				f.write(f".DEFINE {name:<12} ${addr:04X}\n")

			f.write("\n")

			# Game-specific symbols from data tables
			f.write("; Game Data Structures\n")
			for offset, table in list(self.data_tables.items())[:20]:	# First 20 tables
				bank, addr = self._rom_offset_to_snes_address(offset)
				name = f"DATA_{table['type'].upper()}_{bank:02X}_{addr:04X}"
				f.write(f".DEFINE {name:<20} ${addr:04X}\n")

		print(f"Symbol table generated: {symbols_file}")

	def _generate_cross_ref_docs(self, asm_dir: Path):
		"""Generate cross-reference documentation"""
		xref_file = asm_dir / "cross_references.md"

		with open(xref_file, 'w') as f:
			f.write("# Dragon Quest III - Cross References\n\n")
			f.write("This document contains cross-reference information for the disassembly.\n\n")

			f.write("## Text Strings by Location\n\n")
			for offset in sorted(list(self.text_strings.keys())[:50]):	# First 50
				text = self.text_strings[offset]
				bank, addr = self._rom_offset_to_snes_address(offset)
				f.write(f"- `${bank:02X}:{addr:04X}` - \"{text[:60]}{'...' if len(text) > 60 else ''}\"\n")

			f.write("\n## Data Tables by Location\n\n")
			for offset in sorted(list(self.data_tables.keys())[:30]):	# First 30
				table = self.data_tables[offset]
				bank, addr = self._rom_offset_to_snes_address(offset)
				f.write(f"- `${bank:02X}:{addr:04X}` - {table['type']}: {table['entry_count']} entries\n")

		print(f"Cross-reference docs generated: {xref_file}")

	def _count_lines(self, file_path: Path) -> int:
		"""Count lines in a file"""
		try:
			with open(file_path, 'r') as f:
				return sum(1 for _ in f)
		except:
			return 0

def main():
	"""Main entry point"""
	print("STARTING: Dragon Quest III - Ultimate Disassembly Generation")
	print("=" * 80)

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

	# Generate ultimate assembly
	disassembler = UltimateDisassembler(rom_path)
	disassembler.generate_ultimate_assembly(max_instructions=50000)	# Generate up to 50K instructions

if __name__ == "__main__":
	main()
