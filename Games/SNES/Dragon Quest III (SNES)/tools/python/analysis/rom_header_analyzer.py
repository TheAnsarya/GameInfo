#!/usr/bin/env python3
"""
Dragon Quest III - ROM Header Analysis Tool
===========================================

Comprehensive analysis of SNES ROM header, interrupt vectors,
and system initialization code for Dragon Quest III.
"""

import struct
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Any
from dataclasses import dataclass


@dataclass
class SNESHeader:
	"""SNES ROM header structure"""

	title: str
	rom_makeup: int
	rom_type: int
	rom_size: int
	sram_size: int
	country: int
	license: int
	version: int
	checksum_complement: int
	checksum: int
	vectors: Dict[str, int]


@dataclass
class InterruptVector:
	"""Interrupt vector information"""

	name: str
	address: int
	handler_code: bytes
	description: str


class DQ3ROMHeaderAnalyzer:
	"""Comprehensive ROM header and system analysis"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.header = None
		self.vectors = {}
		self.init_code_analysis = {}

		print(f"🔍 ROM Header Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes")

	def analyze_complete_header(self) -> SNESHeader:
		"""Perform complete ROM header analysis"""
		print("\n📋 Analyzing SNES ROM Header...")

		# SNES header is typically at 0x7fc0 for LoROM or 0xffc0 for HiROM
		# Try LoROM first (0x7fc0)
		header_offset = 0x7fc0

		try:
			# Extract header fields
			title_bytes = self.rom_data[header_offset : header_offset + 21]
			# Handle encoding issues with ROM title
			title = "".join(chr(b) if 32 <= b <= 126 else "?" for b in title_bytes).rstrip("\x00 ")

			rom_makeup = self.rom_data[header_offset + 21]
			rom_type = self.rom_data[header_offset + 22]
			rom_size = self.rom_data[header_offset + 23]
			sram_size = self.rom_data[header_offset + 24]
			country = self.rom_data[header_offset + 25]
			license = self.rom_data[header_offset + 26]
			version = self.rom_data[header_offset + 27]

			# Checksum (16-bit little endian)
			checksum_complement = struct.unpack("<H", self.rom_data[header_offset + 28 : header_offset + 30])[0]
			checksum = struct.unpack("<H", self.rom_data[header_offset + 30 : header_offset + 32])[0]

			# Interrupt vectors (16-bit little endian addresses)
			vectors = {}
			vector_offset = header_offset + 32
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

			for i, name in enumerate(vector_names):
				vector_addr = struct.unpack("<H", self.rom_data[vector_offset + i * 2 : vector_offset + i * 2 + 2])[0]
				vectors[name] = vector_addr

			self.header = SNESHeader(
				title=title,
				rom_makeup=rom_makeup,
				rom_type=rom_type,
				rom_size=rom_size,
				sram_size=sram_size,
				country=country,
				license=license,
				version=version,
				checksum_complement=checksum_complement,
				checksum=checksum,
				vectors=vectors,
			)

			return self.header

		except Exception as e:
			print(f"❌ Error reading header: {e}")
			return None

	def analyze_interrupt_vectors(self) -> Dict[str, InterruptVector]:
		"""Analyze all interrupt vectors and their handlers"""
		print("\n🔗 Analyzing Interrupt Vectors...")

		if not self.header:
			print("❌ Header must be analyzed first")
			return {}

		interrupt_info = {}

		for vector_name, address in self.header.vectors.items():
			if address != 0:	# Skip unused vectors
				# Convert SNES address to ROM offset
				rom_offset = self._snes_to_rom_address(address)

				if rom_offset < len(self.rom_data):
					# Read handler code (first 32 bytes for analysis)
					handler_code = self.rom_data[rom_offset : rom_offset + 32]

					# Analyze handler purpose
					description = self._analyze_interrupt_handler(vector_name, handler_code)

					interrupt_info[vector_name] = InterruptVector(
						name=vector_name, address=address, handler_code=handler_code, description=description
					)

		self.vectors = interrupt_info
		return interrupt_info

	def analyze_initialization_code(self) -> Dict[str, Any]:
		"""Analyze system initialization and reset sequence"""
		print("\n🚀 Analyzing System Initialization...")

		if not self.header or "reset" not in self.header.vectors:
			print("❌ Reset vector not found")
			return {}

		reset_address = self.header.vectors["reset"]
		reset_offset = self._snes_to_rom_address(reset_address)

		# Read initialization code (first 512 bytes)
		init_code = self.rom_data[reset_offset : reset_offset + 512]

		analysis = {
			"reset_address": reset_address,
			"rom_offset": reset_offset,
			"code_size": len(init_code),
			"operations": [],
			"register_usage": {},
			"memory_operations": [],
			"system_setup": [],
		}

		# Analyze initialization sequence
		self._analyze_init_sequence(init_code, analysis)

		self.init_code_analysis = analysis
		return analysis

	def _snes_to_rom_address(self, snes_addr: int) -> int:
		"""Convert SNES address to ROM file offset"""
		# For LoROM mapping
		bank = (snes_addr >> 16) & 0xff
		offset = snes_addr & 0xffff

		if bank < 0x80:
			# Banks 00-7F: direct mapping for ROM areas
			if offset >= 0x8000:
				return (bank * 0x8000) + (offset - 0x8000)
		else:
			# Banks 80-FF: mirror of 00-7F
			bank = bank - 0x80
			if offset >= 0x8000:
				return (bank * 0x8000) + (offset - 0x8000)

		return 0	# Invalid address

	def _analyze_interrupt_handler(self, vector_name: str, handler_code: bytes) -> str:
		"""Analyze interrupt handler code to determine purpose"""
		if len(handler_code) < 4:
			return "Handler too short for analysis"

		# Basic pattern recognition
		first_instruction = handler_code[0]

		descriptions = {
			"reset": "System initialization and startup sequence",
			"nmi_native": "VBlank interrupt handler for graphics updates",
			"irq_native": "Timer/controller interrupt handler",
			"nmi_emulation": "Emulation mode VBlank handler",
			"irq_emulation": "Emulation mode interrupt handler",
			"brk_native": "Break instruction handler (debugging)",
			"cop_native": "Coprocessor instruction handler",
			"abort_native": "Abort exception handler",
		}

		base_description = descriptions.get(vector_name, "Unknown interrupt handler")

		# Add specific analysis based on code
		if first_instruction == 0x78:	# SEI (Set Interrupt Disable)
			base_description += " - Disables interrupts immediately"
		elif first_instruction == 0x58:	# CLI (Clear Interrupt Disable)
			base_description += " - Enables interrupts immediately"
		elif first_instruction == 0x4c:	# JMP absolute
			jump_target = struct.unpack("<H", handler_code[1:3])[0]
			base_description += f" - Jumps to main handler at ${jump_target:04X}"
		elif first_instruction == 0x40:	# RTI (Return from Interrupt)
			base_description += " - Empty handler (immediate return)"

		return base_description

	def _analyze_init_sequence(self, code: bytes, analysis: Dict[str, Any]):
		"""Analyze initialization code sequence"""
		i = 0
		while i < len(code) - 1:
			opcode = code[i]

			# Basic 65816 instruction analysis
			if opcode == 0x78:	# SEI
				analysis["operations"].append({"offset": i, "instruction": "SEI", "description": "Disable interrupts"})
				analysis["system_setup"].append("Interrupts disabled for initialization")
				i += 1
			elif opcode == 0x18:	# CLC
				analysis["operations"].append({"offset": i, "instruction": "CLC", "description": "Clear carry flag"})
				i += 1
			elif opcode == 0xfb:	# XCE
				analysis["operations"].append(
					{"offset": i, "instruction": "XCE", "description": "Exchange carry and emulation flags"}
				)
				analysis["system_setup"].append("Switch to native 16-bit mode")
				i += 1
			elif opcode == 0xc2:	# REP
				if i + 1 < len(code):
					flags = code[i + 1]
					analysis["operations"].append(
						{"offset": i, "instruction": f"REP #${flags:02X}", "description": f"Reset processor flags"}
					)
					if flags & 0x30:
						analysis["system_setup"].append("Set accumulator/index to 16-bit mode")
					i += 2
				else:
					break
			elif opcode == 0xe2:	# SEP
				if i + 1 < len(code):
					flags = code[i + 1]
					analysis["operations"].append(
						{"offset": i, "instruction": f"SEP #${flags:02X}", "description": f"Set processor flags"}
					)
					i += 2
				else:
					break
			elif opcode == 0x9c:	# STZ absolute
				if i + 2 < len(code):
					addr = struct.unpack("<H", code[i + 1 : i + 3])[0]
					analysis["operations"].append(
						{"offset": i, "instruction": f"STZ ${addr:04X}", "description": f"Clear memory at ${addr:04X}"}
					)
					analysis["memory_operations"].append({"type": "clear", "address": addr})
					i += 3
				else:
					break
			elif opcode == 0xa9:	# LDA immediate
				if i + 1 < len(code):
					value = code[i + 1]
					analysis["operations"].append(
						{
							"offset": i,
							"instruction": f"LDA #${value:02X}",
							"description": f"Load accumulator with ${value:02X}",
						}
					)
					i += 2
				else:
					break
			elif opcode == 0x8d:	# STA absolute
				if i + 2 < len(code):
					addr = struct.unpack("<H", code[i + 1 : i + 3])[0]
					analysis["operations"].append(
						{
							"offset": i,
							"instruction": f"STA ${addr:04X}",
							"description": f"Store accumulator to ${addr:04X}",
						}
					)
					analysis["memory_operations"].append({"type": "store", "address": addr})
					i += 3
				else:
					break
			elif opcode == 0x4c:	# JMP absolute
				if i + 2 < len(code):
					addr = struct.unpack("<H", code[i + 1 : i + 3])[0]
					analysis["operations"].append(
						{"offset": i, "instruction": f"JMP ${addr:04X}", "description": f"Jump to ${addr:04X}"}
					)
					analysis["system_setup"].append(f"Main initialization continues at ${addr:04X}")
					break	# End of initial sequence
				else:
					break
			else:
				# Unknown instruction, advance by 1
				i += 1

	def generate_header_report(self, output_path: str):
		"""Generate comprehensive header analysis report"""
		report_path = Path(output_path) / "rom_header_analysis.md"

		report = f"""# Dragon Quest III - ROM Header Analysis

## ROM Information
- **File:** {self.rom_path.name}
- **Size:** {self.rom_size:,} bytes ({self.rom_size / (1024*1024):.1f} MB)
- **Analysis Date:** {Path(__file__).stat().st_mtime}

## SNES Header Analysis

"""

		if self.header:
			# ROM type analysis
			rom_types = {
				0x20: "LoROM",
				0x21: "HiROM",
				0x22: "LoROM + S-DD1",
				0x23: "LoROM + SA-1",
				0x30: "LoROM + FastROM",
				0x31: "HiROM + FastROM",
			}

			rom_sizes = {0x08: "256 KB", 0x09: "512 KB", 0x0a: "1 MB", 0x0b: "2 MB", 0x0c: "4 MB", 0x0d: "8 MB"}

			countries = {
				0x00: "Japan",
				0x01: "USA",
				0x02: "Europe",
				0x03: "Scandinavia",
				0x04: "Finland",
				0x05: "Denmark",
				0x06: "France",
				0x07: "Netherlands",
				0x08: "Spain",
				0x09: "Germany",
				0x0a: "Italy",
				0x0b: "China",
				0x0c: "Indonesia",
				0x0d: "South Korea",
			}

			report += f"""### Basic Information
- **Title:** `{self.header.title}`
- **ROM Type:** {rom_types.get(self.header.rom_type, f'Unknown (${self.header.rom_type:02X})')}
- **ROM Size:** {rom_sizes.get(self.header.rom_size, f'Unknown (${self.header.rom_size:02X})')}
- **Country:** {countries.get(self.header.country, f'Unknown (${self.header.country:02X})')}
- **Version:** {self.header.version}

### Checksums
- **Checksum:** ${self.header.checksum:04X}
- **Complement:** ${self.header.checksum_complement:04X}
- **Valid:** {'✅' if (self.header.checksum ^ self.header.checksum_complement) == 0xffff else '❌'}

### Memory Configuration
- **SRAM Size:** {2**(self.header.sram_size - 1) if self.header.sram_size > 0 else 0} KB
- **License Code:** ${self.header.license:02X}
- **ROM Makeup:** ${self.header.rom_makeup:02X}

## Interrupt Vector Table

| Vector | Address | Handler | Description |
|--------|---------|---------|-------------|
"""

			for vector_name, address in self.header.vectors.items():
				if vector_name in self.vectors:
					vector_info = self.vectors[vector_name]
					report += f"| {vector_name} | ${address:04X} | Active | {vector_info.description} |\n"
				else:
					status = "Unused" if address == 0 else "Unknown"
					report += f"| {vector_name} | ${address:04X} | {status} | - |\n"

		if self.init_code_analysis:
			report += f"""

## System Initialization Analysis

### Reset Handler
- **Address:** ${self.init_code_analysis['reset_address']:04X}
- **ROM Offset:** ${self.init_code_analysis['rom_offset']:06X}
- **Code Size:** {self.init_code_analysis['code_size']} bytes

### Initialization Sequence
"""

			for op in self.init_code_analysis["operations"][:20]:	# First 20 operations
				report += f"- `{op['instruction']}` - {op['description']}\n"

			if len(self.init_code_analysis["operations"]) > 20:
				report += f"- ... ({len(self.init_code_analysis['operations']) - 20} more operations)\n"

			report += """

### System Setup Steps
"""

			for setup_step in self.init_code_analysis["system_setup"]:
				report += f"1. {setup_step}\n"

			report += """

### Memory Operations
"""

			memory_ops = self.init_code_analysis["memory_operations"]
			if memory_ops:
				report += "| Type | Address | Purpose |\n"
				report += "|------|---------|----------|\n"

				for op in memory_ops:
					purpose = self._get_memory_purpose(op["address"])
					report += f"| {op['type'].title()} | ${op['address']:04X} | {purpose} |\n"
			else:
				report += "No direct memory operations detected in initialization.\n"

		report += """

## Technical Notes

### ROM Layout (LoROM)
- **Banks 00-7F:** System RAM and ROM areas
- **Banks 80-FF:** ROM mirror space
- **Header Location:** $7fc0-$7fff
- **Vector Table:** $7fe0-$7fff

### Banking Analysis
The ROM uses standard SNES LoROM mapping:
- Each bank contains 32KB of addressable space ($8000-$ffff)
- Banks 00-7F contain the primary ROM image
- Banks 80-FF mirror banks 00-7F respectively

---
*Generated by DQ3 ROM Header Analyzer*
"""

		with open(report_path, "w", encoding="utf-8") as f:
			f.write(report)

		print(f"📄 Header analysis report saved to: {report_path}")
		return report_path

	def _get_memory_purpose(self, address: int) -> str:
		"""Determine the purpose of a memory address"""
		# SNES memory map analysis
		if address < 0x2000:
			return "Direct Page / Zero Page"
		elif address < 0x4000:
			return "System RAM"
		elif address < 0x4100:
			return "PPU Registers"
		elif address < 0x4200:
			return "APU I/O"
		elif address < 0x4300:
			return "System Registers"
		elif address < 0x4380:
			return "DMA Registers"
		elif address < 0x6000:
			return "Expansion"
		elif address < 0x8000:
			return "SRAM/Cart RAM"
		else:
			return "ROM Space"

	def generate_initialization_disassembly(self, output_path: str):
		"""Generate assembly disassembly of initialization code"""
		asm_path = Path(output_path) / "system_init.asm"

		if not self.init_code_analysis:
			print("❌ Initialization analysis must be performed first")
			return

		asm_code = f"""; Dragon Quest III - System Initialization
; Generated from ROM analysis
; Reset vector: ${self.init_code_analysis['reset_address']:04X}

.include "snes_header.inc"

.segment "RESET"

; Reset handler entry point
reset_handler:
"""

		# Add disassembled operations
		for op in self.init_code_analysis["operations"]:
			asm_code += f"\t{op['instruction'].lower()}\t\t; {op['description']}\n"

		asm_code += """
; Continue to main initialization
\tjmp\tmain_init

.segment "VECTORS"
; SNES interrupt vector table
"""

		if self.header:
			for vector_name, address in self.header.vectors.items():
				asm_code += f"\t.word\t{vector_name}_handler\t; ${address:04X}\n"

		with open(asm_path, "w") as f:
			f.write(asm_code)

		print(f"📄 Initialization disassembly saved to: {asm_path}")
		return asm_path

	def run_complete_analysis(self, output_dir: str):
		"""Run complete header and initialization analysis"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print("🔥 Starting Complete ROM Header Analysis")
		print("=" * 50)

		# Analyze header
		header_result = self.analyze_complete_header()
		if not header_result:
			print("❌ Failed to analyze ROM header")
			return

		print(f"✅ ROM Header: '{header_result.title}' ({header_result.rom_size} size code)")

		# Analyze vectors
		vector_result = self.analyze_interrupt_vectors()
		print(f"✅ Interrupt Vectors: {len(vector_result)} active vectors found")

		# Analyze initialization
		init_result = self.analyze_initialization_code()
		print(f"✅ Initialization: {len(init_result['operations'])} operations analyzed")

		# Generate reports
		report_path = self.generate_header_report(str(output_path))
		asm_path = self.generate_initialization_disassembly(str(output_path))

		print(f"\n📊 Analysis Complete!")
		print(f"	 Report: {report_path}")
		print(f"	 Assembly: {asm_path}")
		print(f"	 Functions analyzed: {len(init_result['operations'])}")
		print(f"	 Memory operations: {len(init_result['memory_operations'])}")


def main():
	"""Main entry point for ROM header analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/analysis/rom_header"

	print("🎮 Dragon Quest III - ROM Header Analysis Tool")
	print("=" * 60)

	analyzer = DQ3ROMHeaderAnalyzer(rom_path)
	analyzer.run_complete_analysis(output_dir)


if __name__ == "__main__":
	main()
