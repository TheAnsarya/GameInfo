#!/usr/bin/env python3
"""
Soul Blazer Deep ROM Analyzer - Comprehensive ROM structure analysis

This tool performs deep analysis of the Soul Blazer ROM to discover:
- Code patterns and subroutines
- Data tables and structures
- Cross-references between code and data
- Unused/unreferenced data
- Potential bugs and anomalies
"""

import struct
import json
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from collections import defaultdict
from enum import IntEnum


class OpcodeType(IntEnum):
	"""65816 opcode categories"""
	CONTROL = 0     # JMP, JSR, JSL, RTS, RTL, BRA, etc.
	LOAD = 1        # LDA, LDX, LDY
	STORE = 2       # STA, STX, STY, STZ
	TRANSFER = 3    # TAX, TXA, etc.
	STACK = 4       # PHA, PLA, PHX, PLX, etc.
	ARITHMETIC = 5  # ADC, SBC, INC, DEC
	LOGIC = 6       # AND, ORA, EOR
	COMPARE = 7     # CMP, CPX, CPY, BIT
	SHIFT = 8       # ASL, LSR, ROL, ROR
	FLAG = 9        # SEC, CLC, SEI, CLI, etc.
	OTHER = 10


@dataclass
class Instruction:
	"""Decoded instruction"""
	address: int
	opcode: int
	mnemonic: str
	operand_bytes: bytes
	size: int
	operand_value: int = 0
	target_address: int = 0
	opcode_type: OpcodeType = OpcodeType.OTHER


@dataclass
class CodeBlock:
	"""A contiguous block of code"""
	start_address: int
	end_address: int
	instructions: list[Instruction] = field(default_factory=list)
	entry_points: list[int] = field(default_factory=list)
	exit_points: list[int] = field(default_factory=list)
	calls: list[int] = field(default_factory=list)
	references: list[int] = field(default_factory=list)


@dataclass
class DataBlock:
	"""A contiguous block of data"""
	start_address: int
	end_address: int
	data_type: str = "unknown"
	references: list[int] = field(default_factory=list)
	description: str = ""


@dataclass
class DeepAnalyzer:
	"""Deep ROM analyzer"""

	rom_path: Path
	output_dir: Path
	rom_data: bytes = field(default=b'', repr=False)

	# Analysis results
	code_blocks: dict = field(default_factory=dict)
	data_blocks: dict = field(default_factory=dict)
	subroutines: dict = field(default_factory=dict)
	xrefs: dict = field(default_factory=lambda: defaultdict(list))
	strings: list = field(default_factory=list)
	pointers: list = field(default_factory=list)
	anomalies: list = field(default_factory=list)

	# 65816 opcode table (simplified - common opcodes)
	OPCODES: dict = field(default_factory=lambda: {
		# BRK, ORA, COP, TSB, ASL, PHP, ORA, ASL, PHD
		0x00: ("BRK", 2, OpcodeType.CONTROL),
		0x01: ("ORA", 2, OpcodeType.LOGIC),
		0x02: ("COP", 2, OpcodeType.CONTROL),
		0x05: ("ORA", 2, OpcodeType.LOGIC),
		0x06: ("ASL", 2, OpcodeType.SHIFT),
		0x08: ("PHP", 1, OpcodeType.STACK),
		0x09: ("ORA", 2, OpcodeType.LOGIC),  # May be 3 in 16-bit mode
		0x0A: ("ASL", 1, OpcodeType.SHIFT),
		0x0B: ("PHD", 1, OpcodeType.STACK),
		0x0D: ("ORA", 3, OpcodeType.LOGIC),
		0x0E: ("ASL", 3, OpcodeType.SHIFT),

		# BPL, TRB, CLC
		0x10: ("BPL", 2, OpcodeType.CONTROL),
		0x18: ("CLC", 1, OpcodeType.FLAG),
		0x1A: ("INC", 1, OpcodeType.ARITHMETIC),
		0x1B: ("TCS", 1, OpcodeType.TRANSFER),

		# JSR, AND, BIT, ROL
		0x20: ("JSR", 3, OpcodeType.CONTROL),
		0x21: ("AND", 2, OpcodeType.LOGIC),
		0x22: ("JSL", 4, OpcodeType.CONTROL),
		0x24: ("BIT", 2, OpcodeType.COMPARE),
		0x25: ("AND", 2, OpcodeType.LOGIC),
		0x26: ("ROL", 2, OpcodeType.SHIFT),
		0x28: ("PLP", 1, OpcodeType.STACK),
		0x29: ("AND", 2, OpcodeType.LOGIC),
		0x2A: ("ROL", 1, OpcodeType.SHIFT),
		0x2B: ("PLD", 1, OpcodeType.STACK),
		0x2C: ("BIT", 3, OpcodeType.COMPARE),
		0x2D: ("AND", 3, OpcodeType.LOGIC),

		# BMI, SEC
		0x30: ("BMI", 2, OpcodeType.CONTROL),
		0x38: ("SEC", 1, OpcodeType.FLAG),
		0x3A: ("DEC", 1, OpcodeType.ARITHMETIC),
		0x3B: ("TSC", 1, OpcodeType.TRANSFER),

		# RTI, EOR, MVP
		0x40: ("RTI", 1, OpcodeType.CONTROL),
		0x41: ("EOR", 2, OpcodeType.LOGIC),
		0x44: ("MVP", 3, OpcodeType.OTHER),
		0x45: ("EOR", 2, OpcodeType.LOGIC),
		0x46: ("LSR", 2, OpcodeType.SHIFT),
		0x48: ("PHA", 1, OpcodeType.STACK),
		0x49: ("EOR", 2, OpcodeType.LOGIC),
		0x4A: ("LSR", 1, OpcodeType.SHIFT),
		0x4B: ("PHK", 1, OpcodeType.STACK),
		0x4C: ("JMP", 3, OpcodeType.CONTROL),
		0x4D: ("EOR", 3, OpcodeType.LOGIC),

		# BVC, MVN
		0x50: ("BVC", 2, OpcodeType.CONTROL),
		0x54: ("MVN", 3, OpcodeType.OTHER),
		0x58: ("CLI", 1, OpcodeType.FLAG),
		0x5A: ("PHY", 1, OpcodeType.STACK),
		0x5B: ("TCD", 1, OpcodeType.TRANSFER),
		0x5C: ("JML", 4, OpcodeType.CONTROL),

		# RTS, ADC, PER
		0x60: ("RTS", 1, OpcodeType.CONTROL),
		0x61: ("ADC", 2, OpcodeType.ARITHMETIC),
		0x62: ("PER", 3, OpcodeType.STACK),
		0x64: ("STZ", 2, OpcodeType.STORE),
		0x65: ("ADC", 2, OpcodeType.ARITHMETIC),
		0x66: ("ROR", 2, OpcodeType.SHIFT),
		0x68: ("PLA", 1, OpcodeType.STACK),
		0x69: ("ADC", 2, OpcodeType.ARITHMETIC),
		0x6A: ("ROR", 1, OpcodeType.SHIFT),
		0x6B: ("RTL", 1, OpcodeType.CONTROL),
		0x6C: ("JMP", 3, OpcodeType.CONTROL),
		0x6D: ("ADC", 3, OpcodeType.ARITHMETIC),

		# BVS, SEI
		0x70: ("BVS", 2, OpcodeType.CONTROL),
		0x78: ("SEI", 1, OpcodeType.FLAG),
		0x7A: ("PLY", 1, OpcodeType.STACK),
		0x7B: ("TDC", 1, OpcodeType.TRANSFER),
		0x7C: ("JMP", 3, OpcodeType.CONTROL),

		# BRA, STA, BRL, STY, STX
		0x80: ("BRA", 2, OpcodeType.CONTROL),
		0x81: ("STA", 2, OpcodeType.STORE),
		0x82: ("BRL", 3, OpcodeType.CONTROL),
		0x84: ("STY", 2, OpcodeType.STORE),
		0x85: ("STA", 2, OpcodeType.STORE),
		0x86: ("STX", 2, OpcodeType.STORE),
		0x88: ("DEY", 1, OpcodeType.ARITHMETIC),
		0x89: ("BIT", 2, OpcodeType.COMPARE),
		0x8A: ("TXA", 1, OpcodeType.TRANSFER),
		0x8B: ("PHB", 1, OpcodeType.STACK),
		0x8C: ("STY", 3, OpcodeType.STORE),
		0x8D: ("STA", 3, OpcodeType.STORE),
		0x8E: ("STX", 3, OpcodeType.STORE),
		0x8F: ("STA", 4, OpcodeType.STORE),

		# BCC, TYA
		0x90: ("BCC", 2, OpcodeType.CONTROL),
		0x95: ("STA", 2, OpcodeType.STORE),
		0x96: ("STX", 2, OpcodeType.STORE),
		0x98: ("TYA", 1, OpcodeType.TRANSFER),
		0x99: ("STA", 3, OpcodeType.STORE),
		0x9A: ("TXS", 1, OpcodeType.TRANSFER),
		0x9B: ("TXY", 1, OpcodeType.TRANSFER),
		0x9C: ("STZ", 3, OpcodeType.STORE),
		0x9D: ("STA", 3, OpcodeType.STORE),
		0x9E: ("STZ", 3, OpcodeType.STORE),
		0x9F: ("STA", 4, OpcodeType.STORE),

		# LDY, LDA, LDX
		0xA0: ("LDY", 2, OpcodeType.LOAD),
		0xA1: ("LDA", 2, OpcodeType.LOAD),
		0xA2: ("LDX", 2, OpcodeType.LOAD),
		0xA4: ("LDY", 2, OpcodeType.LOAD),
		0xA5: ("LDA", 2, OpcodeType.LOAD),
		0xA6: ("LDX", 2, OpcodeType.LOAD),
		0xA8: ("TAY", 1, OpcodeType.TRANSFER),
		0xA9: ("LDA", 2, OpcodeType.LOAD),
		0xAA: ("TAX", 1, OpcodeType.TRANSFER),
		0xAB: ("PLB", 1, OpcodeType.STACK),
		0xAC: ("LDY", 3, OpcodeType.LOAD),
		0xAD: ("LDA", 3, OpcodeType.LOAD),
		0xAE: ("LDX", 3, OpcodeType.LOAD),
		0xAF: ("LDA", 4, OpcodeType.LOAD),

		# BCS, CLV
		0xB0: ("BCS", 2, OpcodeType.CONTROL),
		0xB4: ("LDY", 2, OpcodeType.LOAD),
		0xB5: ("LDA", 2, OpcodeType.LOAD),
		0xB6: ("LDX", 2, OpcodeType.LOAD),
		0xB8: ("CLV", 1, OpcodeType.FLAG),
		0xB9: ("LDA", 3, OpcodeType.LOAD),
		0xBA: ("TSX", 1, OpcodeType.TRANSFER),
		0xBB: ("TYX", 1, OpcodeType.TRANSFER),
		0xBC: ("LDY", 3, OpcodeType.LOAD),
		0xBD: ("LDA", 3, OpcodeType.LOAD),
		0xBE: ("LDX", 3, OpcodeType.LOAD),
		0xBF: ("LDA", 4, OpcodeType.LOAD),

		# CPY, CMP, CPX
		0xC0: ("CPY", 2, OpcodeType.COMPARE),
		0xC1: ("CMP", 2, OpcodeType.COMPARE),
		0xC2: ("REP", 2, OpcodeType.FLAG),
		0xC4: ("CPY", 2, OpcodeType.COMPARE),
		0xC5: ("CMP", 2, OpcodeType.COMPARE),
		0xC6: ("DEC", 2, OpcodeType.ARITHMETIC),
		0xC8: ("INY", 1, OpcodeType.ARITHMETIC),
		0xC9: ("CMP", 2, OpcodeType.COMPARE),
		0xCA: ("DEX", 1, OpcodeType.ARITHMETIC),
		0xCB: ("WAI", 1, OpcodeType.OTHER),
		0xCC: ("CPY", 3, OpcodeType.COMPARE),
		0xCD: ("CMP", 3, OpcodeType.COMPARE),
		0xCE: ("DEC", 3, OpcodeType.ARITHMETIC),

		# BNE
		0xD0: ("BNE", 2, OpcodeType.CONTROL),
		0xD5: ("CMP", 2, OpcodeType.COMPARE),
		0xD6: ("DEC", 2, OpcodeType.ARITHMETIC),
		0xD8: ("CLD", 1, OpcodeType.FLAG),
		0xD9: ("CMP", 3, OpcodeType.COMPARE),
		0xDA: ("PHX", 1, OpcodeType.STACK),
		0xDB: ("STP", 1, OpcodeType.OTHER),
		0xDD: ("CMP", 3, OpcodeType.COMPARE),
		0xDE: ("DEC", 3, OpcodeType.ARITHMETIC),

		# CPX, SBC
		0xE0: ("CPX", 2, OpcodeType.COMPARE),
		0xE1: ("SBC", 2, OpcodeType.ARITHMETIC),
		0xE2: ("SEP", 2, OpcodeType.FLAG),
		0xE4: ("CPX", 2, OpcodeType.COMPARE),
		0xE5: ("SBC", 2, OpcodeType.ARITHMETIC),
		0xE6: ("INC", 2, OpcodeType.ARITHMETIC),
		0xE8: ("INX", 1, OpcodeType.ARITHMETIC),
		0xE9: ("SBC", 2, OpcodeType.ARITHMETIC),
		0xEA: ("NOP", 1, OpcodeType.OTHER),
		0xEB: ("XBA", 1, OpcodeType.TRANSFER),
		0xEC: ("CPX", 3, OpcodeType.COMPARE),
		0xED: ("SBC", 3, OpcodeType.ARITHMETIC),
		0xEE: ("INC", 3, OpcodeType.ARITHMETIC),

		# BEQ, SED
		0xF0: ("BEQ", 2, OpcodeType.CONTROL),
		0xF4: ("PEA", 3, OpcodeType.STACK),
		0xF5: ("SBC", 2, OpcodeType.ARITHMETIC),
		0xF6: ("INC", 2, OpcodeType.ARITHMETIC),
		0xF8: ("SED", 1, OpcodeType.FLAG),
		0xF9: ("SBC", 3, OpcodeType.ARITHMETIC),
		0xFA: ("PLX", 1, OpcodeType.STACK),
		0xFB: ("XCE", 1, OpcodeType.FLAG),
		0xFC: ("JSR", 3, OpcodeType.CONTROL),
		0xFD: ("SBC", 3, OpcodeType.ARITHMETIC),
		0xFE: ("INC", 3, OpcodeType.ARITHMETIC),
	})

	def __post_init__(self):
		if not self.rom_data:
			self.load_rom()
		self.output_dir.mkdir(parents=True, exist_ok=True)

	def load_rom(self):
		"""Load ROM data"""
		self.rom_data = self.rom_path.read_bytes()
		print(f"Loaded ROM: {len(self.rom_data):,} bytes")

	def file_to_lorom(self, offset: int) -> int:
		"""Convert file offset to LoROM address"""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return (bank << 16) | addr

	def lorom_to_file(self, addr: int) -> int:
		"""Convert LoROM address to file offset"""
		bank = (addr >> 16) & 0x7F
		offset = addr & 0xFFFF
		if offset >= 0x8000:
			return (bank * 0x8000) + (offset - 0x8000)
		return -1

	def decode_instruction(self, offset: int) -> Optional[Instruction]:
		"""Decode single instruction at offset"""
		if offset >= len(self.rom_data):
			return None

		opcode = self.rom_data[offset]

		if opcode not in self.OPCODES:
			# Unknown opcode - treat as 1-byte
			return Instruction(
				address=self.file_to_lorom(offset),
				opcode=opcode,
				mnemonic=f".db ${opcode:02X}",
				operand_bytes=b'',
				size=1,
				opcode_type=OpcodeType.OTHER
			)

		mnemonic, size, op_type = self.OPCODES[opcode]
		operand_bytes = self.rom_data[offset+1:offset+size] if size > 1 else b''

		# Calculate operand value
		operand_value = 0
		if len(operand_bytes) == 1:
			operand_value = operand_bytes[0]
		elif len(operand_bytes) == 2:
			operand_value = struct.unpack('<H', operand_bytes)[0]
		elif len(operand_bytes) == 3:
			operand_value = operand_bytes[0] | (operand_bytes[1] << 8) | (operand_bytes[2] << 16)

		# Calculate target address for control flow
		target_address = 0
		current_addr = self.file_to_lorom(offset)

		if mnemonic in ("JMP", "JSR") and size == 3:
			# Absolute within bank
			bank = (current_addr >> 16) & 0xFF
			target_address = (bank << 16) | operand_value
		elif mnemonic in ("JML", "JSL") and size == 4:
			# Long address
			target_address = operand_value
		elif mnemonic in ("BRA", "BEQ", "BNE", "BCC", "BCS", "BPL", "BMI", "BVC", "BVS"):
			# Relative branch
			rel = operand_bytes[0] if operand_bytes else 0
			if rel >= 0x80:
				rel -= 0x100
			target_address = current_addr + size + rel
		elif mnemonic == "BRL" and size == 3:
			# Long relative
			rel = struct.unpack('<h', operand_bytes)[0]
			target_address = current_addr + size + rel

		return Instruction(
			address=current_addr,
			opcode=opcode,
			mnemonic=mnemonic,
			operand_bytes=operand_bytes,
			size=size,
			operand_value=operand_value,
			target_address=target_address,
			opcode_type=op_type
		)

	def find_subroutines(self) -> dict:
		"""Find all subroutine entry points"""
		subroutines = {}

		print("Scanning for subroutine entry points...")

		# Scan for JSR/JSL targets
		offset = 0
		while offset < len(self.rom_data):
			inst = self.decode_instruction(offset)
			if inst is None:
				offset += 1
				continue

			if inst.mnemonic in ("JSR", "JSL") and inst.target_address:
				target_file = self.lorom_to_file(inst.target_address)
				if 0 <= target_file < len(self.rom_data):
					if inst.target_address not in subroutines:
						subroutines[inst.target_address] = {
							"file_offset": target_file,
							"callers": [],
							"size": 0
						}
					subroutines[inst.target_address]["callers"].append(inst.address)

					# Add cross-reference
					self.xrefs[inst.target_address].append(inst.address)

			offset += inst.size

		print(f"Found {len(subroutines)} subroutines")
		return subroutines

	def find_strings(self, min_length: int = 4) -> list:
		"""Find printable ASCII strings in ROM"""
		strings = []
		current_str = []
		current_start = 0

		# Define printable range (space to ~)
		for i, byte in enumerate(self.rom_data):
			if 0x20 <= byte <= 0x7E:
				if not current_str:
					current_start = i
				current_str.append(chr(byte))
			else:
				if len(current_str) >= min_length:
					strings.append({
						"offset": current_start,
						"address": self.file_to_lorom(current_start),
						"length": len(current_str),
						"text": ''.join(current_str)
					})
				current_str = []

		# Check final string
		if len(current_str) >= min_length:
			strings.append({
				"offset": current_start,
				"address": self.file_to_lorom(current_start),
				"length": len(current_str),
				"text": ''.join(current_str)
			})

		print(f"Found {len(strings)} strings (min length {min_length})")
		return strings

	def find_pointers(self) -> list:
		"""Find potential pointer tables"""
		pointers = []

		# Scan for sequences of valid pointers
		for offset in range(0, len(self.rom_data) - 8, 2):
			potential_ptrs = []

			for i in range(8):  # Check up to 8 consecutive words
				ptr_offset = offset + i * 2
				if ptr_offset + 2 > len(self.rom_data):
					break

				word = struct.unpack('<H', self.rom_data[ptr_offset:ptr_offset+2])[0]

				# Valid LoROM pointers are typically $8000-$FFFF
				if 0x8000 <= word <= 0xFFFF:
					potential_ptrs.append(word)
				else:
					break

			# Require at least 4 consecutive valid pointers
			if len(potential_ptrs) >= 4:
				pointers.append({
					"offset": offset,
					"address": self.file_to_lorom(offset),
					"count": len(potential_ptrs),
					"pointers": [f"${p:04X}" for p in potential_ptrs]
				})

		# Remove overlapping tables (keep longest)
		filtered = []
		for ptr in sorted(pointers, key=lambda x: -x["count"]):
			if not any(p["offset"] <= ptr["offset"] < p["offset"] + p["count"] * 2
					   for p in filtered):
				filtered.append(ptr)

		print(f"Found {len(filtered)} pointer tables")
		return filtered

	def find_anomalies(self) -> list:
		"""Find potential bugs or unusual patterns"""
		anomalies = []

		# Look for unreachable code (RTS/RTL followed by code not targeted by jumps)
		# Look for uninitialized variable access
		# Look for potential infinite loops

		offset = 0
		prev_was_return = False

		while offset < len(self.rom_data):
			inst = self.decode_instruction(offset)
			if inst is None:
				offset += 1
				continue

			# Check for code after unconditional return
			if prev_was_return and inst.opcode_type != OpcodeType.OTHER:
				if inst.address not in self.xrefs:
					# Potentially unreachable code
					anomalies.append({
						"type": "unreachable_code",
						"address": f"${inst.address:06X}",
						"offset": offset,
						"description": f"Code after return at ${inst.address:06X}"
					})

			# Check for infinite loop (BRA $FE = jump to self)
			if inst.mnemonic == "BRA" and inst.operand_value == 0xFE:
				anomalies.append({
					"type": "infinite_loop",
					"address": f"${inst.address:06X}",
					"offset": offset,
					"description": "BRA $FE - Infinite loop"
				})

			prev_was_return = inst.mnemonic in ("RTS", "RTL", "RTI")
			offset += inst.size

		print(f"Found {len(anomalies)} anomalies")
		return anomalies

	def analyze_bank(self, bank: int) -> dict:
		"""Analyze a single ROM bank"""
		base_offset = bank * 0x8000
		bank_data = self.rom_data[base_offset:base_offset + 0x8000]

		# Count opcodes
		opcode_counts = defaultdict(int)
		code_bytes = 0
		data_bytes = 0

		offset = 0
		while offset < len(bank_data):
			inst = self.decode_instruction(base_offset + offset)
			if inst and inst.opcode in self.OPCODES:
				opcode_counts[inst.mnemonic] += 1
				code_bytes += inst.size
				offset += inst.size
			else:
				data_bytes += 1
				offset += 1

		# Estimate code vs data ratio
		code_ratio = code_bytes / len(bank_data) if bank_data else 0

		return {
			"bank": bank,
			"base_address": f"${bank:02X}:8000",
			"file_offset": f"0x{base_offset:06X}",
			"size": len(bank_data),
			"code_bytes": code_bytes,
			"data_bytes": data_bytes,
			"code_ratio": round(code_ratio, 3),
			"top_opcodes": dict(sorted(opcode_counts.items(),
				key=lambda x: -x[1])[:10]),
			"likely_type": "code" if code_ratio > 0.4 else "data"
		}

	def analyze_all_banks(self) -> list:
		"""Analyze all ROM banks"""
		banks = []
		total_banks = len(self.rom_data) // 0x8000

		print(f"Analyzing {total_banks} banks...")

		for bank in range(total_banks):
			bank_info = self.analyze_bank(bank)
			banks.append(bank_info)
			print(f"  Bank ${bank:02X}: {bank_info['likely_type']} "
				  f"({bank_info['code_ratio']*100:.1f}% code)")

		return banks

	def generate_report(self) -> dict:
		"""Generate comprehensive analysis report"""
		print("\n" + "=" * 60)
		print("DEEP ROM ANALYSIS")
		print("=" * 60)

		report = {
			"rom_info": {
				"path": str(self.rom_path),
				"size": len(self.rom_data),
				"banks": len(self.rom_data) // 0x8000
			},
			"banks": self.analyze_all_banks(),
			"subroutines": self.find_subroutines(),
			"strings": self.find_strings(),
			"pointer_tables": self.find_pointers(),
			"anomalies": self.find_anomalies()
		}

		# Summary
		code_banks = sum(1 for b in report["banks"] if b["likely_type"] == "code")
		data_banks = len(report["banks"]) - code_banks

		report["summary"] = {
			"code_banks": code_banks,
			"data_banks": data_banks,
			"total_subroutines": len(report["subroutines"]),
			"total_strings": len(report["strings"]),
			"pointer_tables": len(report["pointer_tables"]),
			"anomalies": len(report["anomalies"])
		}

		print(f"\nSUMMARY:")
		print(f"  Code banks: {code_banks}")
		print(f"  Data banks: {data_banks}")
		print(f"  Subroutines: {len(report['subroutines'])}")
		print(f"  Strings: {len(report['strings'])}")
		print(f"  Pointer tables: {len(report['pointer_tables'])}")
		print(f"  Anomalies: {len(report['anomalies'])}")

		return report

	def export_report(self, report: dict) -> Path:
		"""Export report to JSON file"""
		output_path = self.output_dir / "deep_analysis.json"

		# Convert subroutines dict to serializable format
		if "subroutines" in report:
			subs = []
			for addr, data in report["subroutines"].items():
				subs.append({
					"address": f"${addr:06X}",
					"file_offset": f"0x{data['file_offset']:06X}",
					"callers": [f"${c:06X}" for c in data['callers']],
					"call_count": len(data['callers'])
				})
			report["subroutines"] = sorted(subs, key=lambda x: -x["call_count"])

		output_path.write_text(json.dumps(report, indent=2))
		print(f"\nReport saved: {output_path}")
		return output_path

	def export_symbols(self, report: dict) -> Path:
		"""Export discovered symbols to .sym file"""
		output_path = self.output_dir / "discovered_symbols.sym"

		lines = ["; Soul Blazer - Auto-discovered symbols", ";"]

		# Add subroutines
		lines.append("; Subroutines (sorted by call count)")
		for sub in report.get("subroutines", [])[:100]:  # Top 100
			addr_str = sub["address"][1:]  # Remove $
			bank = addr_str[:2]
			offset = addr_str[2:]
			lines.append(f"${bank}:{offset} sub_{addr_str}  ; called {sub['call_count']} times")

		lines.append("")
		lines.append("; Pointer tables")
		for i, ptr in enumerate(report.get("pointer_tables", [])[:50]):
			addr = ptr["address"]
			bank = (addr >> 16) & 0xFF
			offset = addr & 0xFFFF
			lines.append(f"${bank:02X}:{offset:04X} ptr_table_{i:02d}  ; {ptr['count']} entries")

		output_path.write_text('\n'.join(lines))
		print(f"Symbols saved: {output_path}")
		return output_path


def main():
	"""Main entry point"""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Deep ROM Analyzer")
	parser.add_argument("--rom", type=Path, help="ROM file path")
	parser.add_argument("--output", type=Path, default=Path("../analysis"),
		help="Output directory")
	parser.add_argument("--bank", type=int, help="Analyze specific bank only")
	parser.add_argument("--strings", action="store_true",
		help="Search for strings only")
	parser.add_argument("--pointers", action="store_true",
		help="Search for pointer tables only")
	parser.add_argument("--subroutines", action="store_true",
		help="Find subroutines only")
	parser.add_argument("--symbols", action="store_true",
		help="Export discovered symbols to .sym file")

	args = parser.parse_args()

	# Default ROM path
	rom_path = args.rom or Path(__file__).parent.parent.parent.parent.parent / \
		"~roms/SNES/GoodSNES/Soul Blazer (U) [!].sfc"

	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}")
		print("Please specify ROM path with --rom")
		return 1

	# Resolve output path
	output_dir = args.output
	if not output_dir.is_absolute():
		output_dir = Path(__file__).parent / output_dir

	analyzer = DeepAnalyzer(rom_path=rom_path, output_dir=output_dir)

	if args.bank is not None:
		# Analyze single bank
		info = analyzer.analyze_bank(args.bank)
		print(json.dumps(info, indent=2))
	elif args.strings:
		strings = analyzer.find_strings()
		for s in strings[:50]:  # Show first 50
			print(f"${s['address']:06X}: {s['text'][:60]}")
	elif args.pointers:
		pointers = analyzer.find_pointers()
		for p in pointers[:30]:
			print(f"${p['address']:06X}: {p['count']} pointers")
	elif args.subroutines:
		subs = analyzer.find_subroutines()
		# Sort by call count
		sorted_subs = sorted(subs.items(), key=lambda x: -len(x[1]['callers']))
		for addr, data in sorted_subs[:30]:
			print(f"${addr:06X}: {len(data['callers'])} callers")
	else:
		# Full analysis
		report = analyzer.generate_report()
		analyzer.export_report(report)

		if args.symbols:
			analyzer.export_symbols(report)

	return 0


if __name__ == "__main__":
	exit(main())
