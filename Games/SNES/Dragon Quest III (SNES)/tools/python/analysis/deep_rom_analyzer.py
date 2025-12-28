#!/usr/bin/env python3
"""
Dragon Quest III - Deep ROM Analysis and Code Disassembly
=========================================================

Advanced analysis for headerless ROMs and comprehensive code extraction.
"""

import struct
import os
from pathlib import Path
from typing import Dict, List, Tuple, Any
from dataclasses import dataclass


@dataclass
class CodeRegion:
	"""Represents a region of executable code"""

	start_address: int
	end_address: int
	size: int
	bank: int
	code_type: str	# "initialization", "main", "interrupt", "subroutine"
	instructions: List[Dict]


class DQ3DeepAnalyzer:
	"""Deep analysis for Dragon Quest III ROM"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.code_regions = []
		self.data_regions = []
		self.vectors = {}

		# 65816 instruction table (simplified)
		self.opcodes = {
			0x18: ("CLC", 1, "Clear carry flag"),
			0x38: ("SEC", 1, "Set carry flag"),
			0x58: ("CLI", 1, "Clear interrupt disable"),
			0x78: ("SEI", 1, "Set interrupt disable"),
			0xc2: ("REP", 2, "Reset processor status"),
			0xe2: ("SEP", 2, "Set processor status"),
			0xfb: ("XCE", 1, "Exchange carry and emulation"),
			0xa9: ("LDA", 2, "Load accumulator immediate"),
			0xad: ("LDA", 3, "Load accumulator absolute"),
			0x8d: ("STA", 3, "Store accumulator absolute"),
			0x9c: ("STZ", 3, "Store zero absolute"),
			0x4c: ("JMP", 3, "Jump absolute"),
			0x5c: ("JML", 4, "Jump long"),
			0x20: ("JSR", 3, "Jump subroutine"),
			0x22: ("JSL", 4, "Jump subroutine long"),
			0x60: ("RTS", 1, "Return from subroutine"),
			0x6b: ("RTL", 1, "Return from subroutine long"),
			0x40: ("RTI", 1, "Return from interrupt"),
			0x80: ("BRA", 2, "Branch always"),
			0x10: ("BPL", 2, "Branch plus"),
			0x30: ("BMI", 2, "Branch minus"),
			0x50: ("BVC", 2, "Branch overflow clear"),
			0x70: ("BVS", 2, "Branch overflow set"),
			0x90: ("BCC", 2, "Branch carry clear"),
			0xb0: ("BCS", 2, "Branch carry set"),
			0xd0: ("BNE", 2, "Branch not equal"),
			0xf0: ("BEQ", 2, "Branch equal"),
			0xea: ("NOP", 1, "No operation"),
		}

		print(f"🔍 Deep ROM Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes")

	def find_actual_vectors(self) -> Dict[str, int]:
		"""Search for actual interrupt vectors in the ROM"""
		print("\n🔎 Searching for interrupt vectors...")

		# Look for vector table patterns
		potential_vectors = {}

		# Search in last 64KB for vector tables (common location)
		search_start = max(0, self.rom_size - 0x10000)

		for offset in range(search_start, self.rom_size - 32, 2):
			# Read potential vector
			addr = struct.unpack("<H", self.rom_data[offset : offset + 2])[0]

			# Check if this looks like a valid SNES address (bank 00-3F, high byte)
			if 0x8000 <= addr <= 0xffff:
				# Check if there are multiple consecutive valid addresses
				consecutive_valid = 0
				for i in range(8):	# Check next 8 vectors
					if offset + (i * 2) + 2 <= len(self.rom_data):
						next_addr = struct.unpack("<H", self.rom_data[offset + (i * 2) : offset + (i * 2) + 2])[0]
						if 0x8000 <= next_addr <= 0xffff:
							consecutive_valid += 1

				if consecutive_valid >= 6:	# Likely a vector table
					vector_names = [
						"cop_native",
						"brk_native",
						"abort_native",
						"nmi_native",
						"unused_native",
						"irq_native",
						"unused1",
						"unused2",
						"cop_emulation",
						"unused3",
						"abort_emulation",
						"nmi_emulation",
						"reset",
						"irq_emulation",
					]

					print(f"	 Found potential vector table at ${offset:06X}")
					for i, name in enumerate(vector_names):
						if offset + (i * 2) + 2 <= len(self.rom_data):
							vec_addr = struct.unpack("<H", self.rom_data[offset + (i * 2) : offset + (i * 2) + 2])[0]
							potential_vectors[name] = vec_addr
							print(f"	 {name}: ${vec_addr:04X}")

					self.vectors = potential_vectors
					return potential_vectors

		print("	 No clear vector table found, using heuristics...")

		# Use heuristics to find reset vector
		# Look for common initialization patterns
		for offset in range(0, min(0x10000, len(self.rom_data) - 4)):
			# Look for SEI (78) followed by CLC (18) XCE (FB) - common reset sequence
			if (
				self.rom_data[offset] == 0x78
				and self.rom_data[offset + 1] == 0x18
				and self.rom_data[offset + 2] == 0xfb
			):

				reset_addr = 0x8000 + (offset % 0x8000)
				potential_vectors["reset"] = reset_addr
				print(f"	 Heuristic reset vector: ${reset_addr:04X}")
				break

		self.vectors = potential_vectors
		return potential_vectors

	def disassemble_region(self, start_offset: int, size: int, base_address: int = None) -> CodeRegion:
		"""Disassemble a region of code"""
		if base_address is None:
			base_address = 0x8000 + (start_offset % 0x8000)

		instructions = []
		offset = start_offset
		current_addr = base_address

		while offset < start_offset + size and offset < len(self.rom_data):
			opcode = self.rom_data[offset]

			if opcode in self.opcodes:
				name, length, desc = self.opcodes[opcode]

				# Extract operand if present
				operand_bytes = self.rom_data[offset + 1 : offset + length]

				if length == 1:
					operand_str = ""
					full_instruction = name
				elif length == 2:
					operand = operand_bytes[0] if operand_bytes else 0
					operand_str = f" #${operand:02X}"
					full_instruction = f"{name} #${operand:02X}"
				elif length == 3:
					if len(operand_bytes) >= 2:
						operand = struct.unpack("<H", operand_bytes[:2])[0]
					else:
						operand = operand_bytes[0] if operand_bytes else 0
					operand_str = f" ${operand:04X}"
					full_instruction = f"{name} ${operand:04X}"
				elif length == 4:
					if len(operand_bytes) >= 3:
						operand = (
							operand_bytes[0] | (operand_bytes[1] << 8) | (operand_bytes[2] << 16)
							if len(operand_bytes) >= 3
							else 0
						)
						operand_str = f" ${operand:06X}"
						full_instruction = f"{name} ${operand:06X}"
					else:
						operand_str = " ???"
						full_instruction = f"{name} ???"

				instruction = {
					"address": current_addr,
					"offset": offset,
					"opcode": opcode,
					"name": name,
					"operand": operand_str,
					"full": full_instruction,
					"description": desc,
					"bytes": self.rom_data[offset : offset + length].hex().upper(),
				}

				instructions.append(instruction)
				offset += length
				current_addr += length

				# Stop at return instructions for subroutines
				if opcode in [0x60, 0x6b, 0x40]:	# RTS, RTL, RTI
					break
			else:
				# Unknown opcode, advance by 1
				instruction = {
					"address": current_addr,
					"offset": offset,
					"opcode": opcode,
					"name": "DB",
					"operand": f" ${opcode:02X}",
					"full": f"DB ${opcode:02X}",
					"description": f"Unknown opcode ${opcode:02X}",
					"bytes": f"{opcode:02X}",
				}

				instructions.append(instruction)
				offset += 1
				current_addr += 1

		return CodeRegion(
			start_address=base_address,
			end_address=current_addr - 1,
			size=offset - start_offset,
			bank=(base_address >> 16),
			code_type="unknown",
			instructions=instructions,
		)

	def find_and_disassemble_code_regions(self) -> List[CodeRegion]:
		"""Find and disassemble all significant code regions"""
		print("\n🔍 Searching for code regions...")

		regions = []

		# Search for code patterns throughout ROM
		search_size = 0x1000	# 4KB chunks

		for offset in range(0, min(0x100000, len(self.rom_data)), search_size):
			# Check for executable code patterns
			if self._looks_like_code(offset, min(search_size, len(self.rom_data) - offset)):
				print(f"	 Found code region at ${offset:06X}")

				# Disassemble this region
				region = self.disassemble_region(offset, search_size, 0x8000 + (offset % 0x8000))
				region.code_type = self._classify_code_region(region)
				regions.append(region)

		self.code_regions = regions
		return regions

	def _looks_like_code(self, offset: int, size: int) -> bool:
		"""Heuristic to determine if a region contains executable code"""
		if offset + size > len(self.rom_data):
			return False

		# Count valid opcodes
		valid_opcodes = 0
		total_bytes = 0

		i = 0
		while i < size:
			if offset + i >= len(self.rom_data):
				break

			opcode = self.rom_data[offset + i]
			if opcode in self.opcodes:
				valid_opcodes += 1
				_, length, _ = self.opcodes[opcode]
				i += length
			else:
				i += 1
			total_bytes += 1

			if total_bytes > 100:	# Sample first 100 bytes
				break

		# If more than 30% are valid opcodes, consider it code
		return (valid_opcodes / max(total_bytes, 1)) > 0.3

	def _classify_code_region(self, region: CodeRegion) -> str:
		"""Classify what type of code this region contains"""
		instructions = region.instructions

		# Look for patterns
		has_sei = any(inst["name"] == "SEI" for inst in instructions)
		has_xce = any(inst["name"] == "XCE" for inst in instructions)
		has_rep_sep = any(inst["name"] in ["REP", "SEP"] for inst in instructions)
		has_interrupt_end = any(inst["name"] == "RTI" for inst in instructions)
		has_subroutine_end = any(inst["name"] in ["RTS", "RTL"] for inst in instructions)

		if has_sei and has_xce and has_rep_sep:
			return "initialization"
		elif has_interrupt_end:
			return "interrupt_handler"
		elif has_subroutine_end:
			return "subroutine"
		else:
			return "main_code"

	def generate_comprehensive_disassembly(self, output_dir: str):
		"""Generate comprehensive disassembly documentation"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		# Generate main disassembly file
		asm_file = output_path / "dq3_complete.asm"
		doc_file = output_path / "disassembly_analysis.md"

		print(f"\n📝 Generating comprehensive disassembly...")

		# Assembly output
		with open(asm_file, "w") as f:
			f.write("; Dragon Quest III - Complete Disassembly\n")
			f.write("; Generated by Deep ROM Analyzer\n")
			f.write(f"; ROM: {self.rom_path.name}\n")
			f.write(f"; Size: {self.rom_size:,} bytes\n\n")

			for i, region in enumerate(self.code_regions):
				f.write(
					f"\n; Region {i + 1}: {region.code_type} (${region.start_address:04X}-${region.end_address:04X})\n"
				)
				f.write(f"region_{i + 1}_{region.code_type}:\n")

				for inst in region.instructions:
					f.write(f"\t{inst['full'].lower():<20} ; {inst['description']}\n")

				f.write(f"\n")

		# Documentation output
		with open(doc_file, "w", encoding="utf-8") as f:
			f.write("# Dragon Quest III - Deep Disassembly Analysis\n\n")
			f.write(f"## ROM Information\n")
			f.write(f"- **File:** {self.rom_path.name}\n")
			f.write(f"- **Size:** {self.rom_size:,} bytes\n")
			f.write(f"- **Code Regions Found:** {len(self.code_regions)}\n\n")

			f.write("## Interrupt Vectors\n\n")
			if self.vectors:
				f.write("| Vector | Address |\n")
				f.write("|--------|---------|\n")
				for name, addr in self.vectors.items():
					f.write(f"| {name} | ${addr:04X} |\n")
			else:
				f.write("No interrupt vectors found.\n")

			f.write("\n## Code Regions\n\n")

			for i, region in enumerate(self.code_regions):
				f.write(f"### Region {i + 1}: {region.code_type.replace('_', ' ').title()}\n")
				f.write(f"- **Address Range:** ${region.start_address:04X} - ${region.end_address:04X}\n")
				f.write(f"- **Size:** {region.size} bytes\n")
				f.write(f"- **Bank:** {region.bank}\n")
				f.write(f"- **Instructions:** {len(region.instructions)}\n\n")

				# Show first few instructions
				f.write("**First Instructions:**\n")
				for inst in region.instructions[:10]:
					f.write(f"- `{inst['full']}` - {inst['description']}\n")

				if len(region.instructions) > 10:
					f.write(f"- ... ({len(region.instructions) - 10} more instructions)\n")

				f.write("\n")

		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		return asm_file, doc_file

	def run_deep_analysis(self, output_dir: str):
		"""Run complete deep analysis"""
		print("🔥 Starting Deep ROM Analysis")
		print("=" * 50)

		# Find vectors
		self.find_actual_vectors()

		# Find code regions
		regions = self.find_and_disassemble_code_regions()
		print(f"✅ Found {len(regions)} code regions")

		# Generate comprehensive documentation
		asm_file, doc_file = self.generate_comprehensive_disassembly(output_dir)

		print(f"\n🎯 Deep Analysis Complete!")
		print(f"	 Code regions: {len(regions)}")
		print(f"	 Total instructions: {sum(len(r.instructions) for r in regions)}")
		print(f"	 Assembly file: {asm_file}")
		print(f"	 Documentation: {doc_file}")


def main():
	"""Main entry point for deep analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/disassembly/deep_analysis"

	print("⚡ Dragon Quest III - Deep ROM Analysis")
	print("=" * 60)

	analyzer = DQ3DeepAnalyzer(rom_path)
	analyzer.run_deep_analysis(output_dir)


if __name__ == "__main__":
	main()
