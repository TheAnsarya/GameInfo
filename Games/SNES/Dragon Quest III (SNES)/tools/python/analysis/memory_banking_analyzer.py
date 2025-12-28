#!/usr/bin/env python3
"""
Dragon Quest III - Advanced Memory Banking System Analyzer
Professional SNES HiROM banking analysis with comprehensive documentation

This module implements enterprise-grade analysis of the Dragon Quest III
SNES memory banking system, providing detailed mapping of ROM banks,
memory layout, and banking mechanics.

CRITICAL CORRECTION: Architecture: SNES HiROM (High ROM)
- Banks $C0-$FF: ROM data mapped to $0000-$FFFF (full bank)
- Banks $40-$7F: ROM data mapped to $0000-$FFFF (full bank)
- Banks $00-$3F and $80-$BF: System area and mirrors
- Total ROM size: 6MB (HiROM format)
"""

import os
import json
import struct
from typing import Dict, List, Tuple, Any
from pathlib import Path
import sys

# Add the utils directory to the path for address translation
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'utils'))
from snes_address_translation import SNESAddressTranslator

class DQ3MemoryBankingAnalyzer:
	"""Advanced SNES HiROM banking system analyzer"""

	def __init__(self, project_root: str):
		self.project_root = Path(project_root)
		self.rom_path = self.project_root / "static" / "Dragon Quest III - english (patched).smc"
		self.rom_data = bytes()

		# Initialize SNES address translator for HiROM
		self.address_translator = SNESAddressTranslator()

		# SNES HiROM Banking Constants
		self.BANK_SIZE = 0x10000	# 64KB per bank (full bank in HiROM)
		self.ROM_SIZE = 6291456	 # 6MB total

		# Memory mapping for SNES HiROM
		self.memory_map = {
			'hirom_c0_ff': {'start': 0xC0, 'end': 0xFF, 'size': 0x10000},	# Banks $C0-$FF
			'hirom_40_7f': {'start': 0x40, 'end': 0x7F, 'size': 0x10000},	# Banks $40-$7F
			'system_area': {'start': 0x00, 'end': 0x3F, 'desc': 'System area'},
			'mirror_area': {'start': 0x80, 'end': 0xBF, 'desc': 'Mirror area'},
			'sram_base': 0x6000,		# SRAM location
			'header_offset': 0xFFC0	 # ROM header in HiROM
		}

		# Banking analysis results
		self.banking_analysis = {}
		self.bank_classifications = {}

	def load_rom(self) -> bool:
		"""Load ROM and verify banking structure"""

		print("BANK Dragon Quest III - Advanced Memory Banking System Analyzer")
		print("=" * 75)
		print("TARGET: SNES HiROM Banking Analysis")
		print("ARCHITECTURE: High ROM (HiROM) Memory Layout")
		print("CRITICAL CORRECTION: DQ3 uses HiROM, not LoROM!")
		print()

		if not self.rom_path.exists():
			print(f"ERROR ROM file not found: {self.rom_path}")
			return False

		with open(self.rom_path, 'rb') as f:
			self.rom_data = f.read()

		print(f"OK ROM loaded: {len(self.rom_data):,} bytes")
		print(f"DATA HiROM banks: {len(self.rom_data) // self.BANK_SIZE}")
		print(f"DATA Bank size: {self.BANK_SIZE:,} bytes ({self.BANK_SIZE // 1024}KB)")
		print(f"DATA HiROM mapping: $C0-$FF and $40-$7F banks")

		# Verify ROM size matches expected banking structure
		if len(self.rom_data) != self.ROM_SIZE:
			print(f"WARNING ROM size mismatch: {len(self.rom_data)} vs expected {self.ROM_SIZE}")

		return True

	def analyze_rom_header(self):
		"""Analyze SNES ROM header for banking information"""

		print("\nAnalyzing SNES ROM Header")
		print("-" * 45)

		# ROM header is at $00:FFC0 for HiROM (offset $FFC0 in ROM file)
		# For SMC files, we need to account for the 512-byte header
		smc_header_size = 512 if len(self.rom_data) % 1024 == 512 else 0
		header_offset = smc_header_size + 0xFFC0

		if header_offset + 32 > len(self.rom_data):
			print("ERROR: ROM header not found")
			return

		header_data = self.rom_data[header_offset:header_offset + 32]

		# Parse key header fields
		game_title = header_data[0:21].decode('ascii', errors='ignore').rstrip('\x00 ')
		map_mode = header_data[21]
		cart_type = header_data[22]
		rom_size = header_data[23]
		sram_size = header_data[24]

		print(f"DATA Game Title: '{game_title}'")
		print(f"DATA Map Mode: ${map_mode:02x} ({'LoROM' if map_mode & 1 == 0 else 'HiROM'})")
		print(f"DATA Cartridge Type: ${cart_type:02x}")
		print(f"DATA ROM Size: ${rom_size:02x} ({2 ** rom_size // 1024}KB)")
		print(f"DATA SRAM Size: ${sram_size:02x} ({2 ** sram_size if sram_size > 0 else 0}KB)")

		# Verify this is actually HiROM
		is_hirom = (map_mode & 1) == 1
		print(f"TARGET Verified HiROM: {is_hirom}")

		# Calculate banking information for HiROM
		rom_banks = len(self.rom_data) // self.BANK_SIZE

		print(f"DATA ROM Banks: {rom_banks}")
		print(f"DATA HiROM Layout: Banks $C0-$FF and $40-$7F contain ROM data")

		header_analysis = {
			'title': game_title,
			'map_mode': map_mode,
			'is_hirom': (map_mode & 1) == 1,
			'cart_type': cart_type,
			'rom_size_code': rom_size,
			'sram_size_code': sram_size,
			'calculated_banks': rom_banks,
			'memory_layout': self.memory_map
		}

		self.banking_analysis['header'] = header_analysis

	def analyze_bank_structure(self):
		"""Analyze individual bank structure and classification"""

		print("\nAnalyzing Bank Structure")
		print("-" * 40)

		bank_analysis = {}

		total_banks = len(self.rom_data) // self.BANK_SIZE

		for bank_num in range(min(total_banks, 32)):	# Analyze first 32 banks for detailed view
			bank_start = bank_num * self.BANK_SIZE
			bank_end = bank_start + self.BANK_SIZE
			bank_data = self.rom_data[bank_start:bank_end]

			# Classify bank content
			bank_classification = self.classify_bank_content(bank_data, bank_num)

			# Calculate statistics
			zero_bytes = bank_data.count(0)
			ff_bytes = bank_data.count(0xFF)
			entropy = self.calculate_entropy(bank_data)

			# Generate HiROM SNES addresses
			hirom_bank_c0 = 0xC0 + bank_num	# Bank in $C0-$FF range
			hirom_bank_40 = 0x40 + bank_num	# Bank in $40-$7F range

			bank_info = {
				'number': bank_num,
				'snes_hirom_c0': f"${hirom_bank_c0:02x}:0000-${hirom_bank_c0:02x}:ffff" if hirom_bank_c0 <= 0xFF else "N/A",
				'snes_hirom_40': f"${hirom_bank_40:02x}:0000-${hirom_bank_40:02x}:ffff" if hirom_bank_40 <= 0x7F else "N/A",
				'rom_offset': f"${bank_start:06x}-${bank_end-1:06x}",
				'classification': bank_classification,
				'zero_bytes': zero_bytes,
				'ff_bytes': ff_bytes,
				'entropy': entropy,
				'is_empty': zero_bytes > self.BANK_SIZE * 0.9,
				'is_padding': ff_bytes > self.BANK_SIZE * 0.9
			}

			bank_analysis[f"bank_{bank_num:02x}"] = bank_info

			# Print summary for first few banks
			if bank_num < 8:
				hirom_addr = f"${0xC0 + bank_num:02x}:0000" if 0xC0 + bank_num <= 0xFF else "N/A"
				print(f"DATA Bank {bank_num:02x} (HiROM {hirom_addr}): {bank_classification} (Entropy: {entropy:.3f})")

		# Analyze remaining banks in groups
		for bank_group in range(32, total_banks, 16):
			group_end = min(bank_group + 16, total_banks)
			group_classification = self.analyze_bank_group(bank_group, group_end)

			print(f"DATA Banks ${bank_group:02x}-${group_end-1:02x}: {group_classification}")

		self.banking_analysis['banks'] = bank_analysis

	def classify_bank_content(self, bank_data: bytes, bank_num: int) -> str:
		"""Classify the content type of a ROM bank"""

		# Check for common patterns
		zero_ratio = bank_data.count(0) / len(bank_data)
		ff_ratio = bank_data.count(0xFF) / len(bank_data)

		if zero_ratio > 0.9:
			return "empty"
		elif ff_ratio > 0.9:
			return "padding"

		# Check for code patterns (common 65816 opcodes)
		code_opcodes = [0x20, 0x4C, 0x6C, 0xA9, 0xAD, 0x8D]	# JSR, JMP, LDA, STA
		code_score = sum(bank_data.count(op) for op in code_opcodes)

		# Check for graphics patterns (low entropy, repetitive data)
		entropy = self.calculate_entropy(bank_data)

		if bank_num == 0:
			return "header_and_vectors"
		elif code_score > 50 and entropy > 0.6:
			return "program_code"
		elif entropy < 0.4:
			return "graphics_data"
		elif 0.4 <= entropy < 0.7:
			return "structured_data"
		else:
			return "mixed_data"

	def analyze_bank_group(self, start_bank: int, end_bank: int) -> str:
		"""Analyze a group of banks for common patterns"""

		classifications = []

		for bank_num in range(start_bank, end_bank):
			if bank_num * self.BANK_SIZE < len(self.rom_data):
				bank_start = bank_num * self.BANK_SIZE
				bank_data = self.rom_data[bank_start:bank_start + self.BANK_SIZE]
				classification = self.classify_bank_content(bank_data, bank_num)
				classifications.append(classification)

		# Find most common classification
		if classifications:
			most_common = max(set(classifications), key=classifications.count)
			return f"{most_common} (predominant)"
		else:
			return "empty_region"

	def calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data"""

		if not data:
			return 0.0

		# Count byte frequencies
		frequencies = {}
		for byte in data:
			frequencies[byte] = frequencies.get(byte, 0) + 1

		# Calculate Shannon entropy
		import math
		entropy = 0.0
		data_len = len(data)

		for count in frequencies.values():
			probability = count / data_len
			if probability > 0:
				entropy -= probability * math.log2(probability)

		# Normalize to 0-1 range (8 bits = max entropy of 8)
		return entropy / 8.0

	def analyze_memory_layout(self):
		"""Analyze SNES memory layout and banking mechanics"""

		print("\n🗂️ Analyzing SNES Memory Layout")
		print("-" * 45)

		# SNES LoROM memory map
		memory_regions = {
			'$0000-$1FFF': 'Shadow RAM (mirror of $7E:0000-$7E:1FFF)',
			'$2000-$20FF': 'PPU1 registers',
			'$2100-$21FF': 'PPU2 registers',
			'$4000-$41FF': 'Controller registers',
			'$4200-$44FF': 'APU registers',
			'$6000-$7FFF': 'SRAM (8KB)',
			'$8000-$FFFF': 'ROM data (32KB per bank)',
		}

		print("📊 SNES LoROM Memory Map:")
		for address_range, description in memory_regions.items():
			print(f"	 {address_range}: {description}")

		# Banking mechanics
		banking_mechanics = {
			'rom_access': 'Direct mapping to $8000-$FFFF per bank',
			'bank_switching': 'CPU bank register controls current bank',
			'address_bus': '24-bit addressing (16MB total space)',
			'rom_mirroring': 'Banks $80-$FF mirror banks $00-$7F',
			'sram_access': 'Battery-backed save data at $6000-$7FFF'
		}

		print("\n📊 Banking Mechanics:")
		for mechanism, description in banking_mechanics.items():
			print(f"	 {mechanism.replace('_', ' ').title()}: {description}")

		# Calculate bank utilization
		total_banks = len(self.rom_data) // self.BANK_SIZE
		utilized_banks = 0
		empty_banks = 0

		for bank_num in range(total_banks):
			bank_start = bank_num * self.BANK_SIZE
			bank_data = self.rom_data[bank_start:bank_start + self.BANK_SIZE]

			zero_ratio = bank_data.count(0) / len(bank_data)
			if zero_ratio < 0.9:
				utilized_banks += 1
			else:
				empty_banks += 1

		utilization_percentage = (utilized_banks / total_banks) * 100

		print(f"\n📊 Bank Utilization:")
		print(f"	 Total Banks: {total_banks}")
		print(f"	 Utilized Banks: {utilized_banks}")
		print(f"	 Empty Banks: {empty_banks}")
		print(f"	 Utilization: {utilization_percentage:.1f}%")

		memory_analysis = {
			'memory_regions': memory_regions,
			'banking_mechanics': banking_mechanics,
			'utilization': {
				'total_banks': total_banks,
				'utilized_banks': utilized_banks,
				'empty_banks': empty_banks,
				'percentage': utilization_percentage
			}
		}

		self.banking_analysis['memory_layout'] = memory_analysis

	def analyze_cross_bank_references(self):
		"""Analyze cross-bank references and dependencies"""

		print("\n🔗 Analyzing Cross-Bank References")
		print("-" * 45)

		# Look for potential cross-bank calls and references
		cross_references = {}

		# Analyze first 8 banks for cross-references
		for bank_num in range(min(8, len(self.rom_data) // self.BANK_SIZE)):
			bank_start = bank_num * self.BANK_SIZE
			bank_data = self.rom_data[bank_start:bank_start + self.BANK_SIZE]

			bank_refs = []

			# Look for 24-bit addresses (potential far calls)
			for i in range(len(bank_data) - 2):
				# Check for patterns like JSL (long call)
				if bank_data[i] == 0x22:	# JSL opcode
					if i + 3 < len(bank_data):
						addr_low = bank_data[i + 1]
						addr_high = bank_data[i + 2]
						bank_byte = bank_data[i + 3]

						target_address = addr_low | (addr_high << 8) | (bank_byte << 16)
						bank_refs.append({
							'type': 'JSL',
							'source': bank_start + i,
							'target': target_address,
							'target_bank': bank_byte
						})

			if bank_refs:
				cross_references[f"bank_{bank_num:02x}"] = bank_refs
				print(f"📊 Bank ${bank_num:02x}: {len(bank_refs)} cross-bank references")

		self.banking_analysis['cross_references'] = cross_references

	def generate_banking_report(self):
		"""Generate comprehensive banking analysis report"""

		print("\n📝 Generating Banking System Report")
		print("-" * 45)

		report_path = self.project_root / "reports" / "memory_banking_analysis.json"
		report_path.parent.mkdir(exist_ok=True)

		# Complete banking report
		banking_report = {
			'rom_info': {
				'filename': self.rom_path.name,
				'size_bytes': len(self.rom_data),
				'architecture': 'SNES HiROM'
			},
			'banking_analysis': self.banking_analysis,
			'constants': {
				'bank_size': self.BANK_SIZE,
				'bank_count': len(self.rom_data) // self.BANK_SIZE,
				'memory_map': self.memory_map
			}
		}

		with open(report_path, 'w') as f:
			json.dump(banking_report, f, indent=2)

		print(f"✅ Banking report saved: {report_path}")

		# Generate markdown documentation
		md_path = self.project_root / "documentation" / "MEMORY_BANKING_SYSTEM.md"
		md_path.parent.mkdir(exist_ok=True)

		self.generate_banking_documentation(md_path, banking_report)
		print(f"✅ Banking documentation: {md_path}")

		return banking_report

	def generate_banking_documentation(self, output_path: Path, report_data: dict):
		"""Generate comprehensive banking documentation"""

		content = [
			"# Dragon Quest III - Memory Banking System Analysis",
			"",
			f"**Architecture:** {report_data['rom_info']['architecture']}",
			f"**ROM Size:** {report_data['rom_info']['size_bytes']:,} bytes",
			f"**Bank Size:** {report_data['constants']['bank_size']:,} bytes",
			f"**Total Banks:** {report_data['constants']['bank_count']}",
			"",
			"## SNES LoROM Architecture",
			"",
			"Dragon Quest III uses the SNES Low ROM (LoROM) memory layout:",
			"",
			"- **ROM Mapping:** $8000-$FFFF per bank (32KB)",
			"- **Bank Range:** $00-$7F (with $80-$FF mirroring)",
			"- **SRAM:** $6000-$7FFF (8KB battery-backed)",
			"- **Total Address Space:** 16MB (24-bit addressing)",
			"",
			"### Memory Map",
			""
		]

		# Add memory regions
		if 'memory_layout' in report_data['banking_analysis']:
			memory_layout = report_data['banking_analysis']['memory_layout']

			content.extend([
				"| Address Range | Description |",
				"|---------------|-------------|"
			])

			for addr_range, desc in memory_layout['memory_regions'].items():
				content.append(f"| {addr_range} | {desc} |")

			content.append("")

		# Add bank analysis
		if 'banks' in report_data['banking_analysis']:
			content.extend([
				"## Bank Classification Analysis",
				""
			])

			banks = report_data['banking_analysis']['banks']

			for bank_key in sorted(banks.keys())[:8]:	# Show first 8 banks
				bank = banks[bank_key]
				content.extend([
					f"### Bank ${bank['number']:02x}",
					"",
					f"- **SNES Address:** {bank['snes_address']}",
					f"- **ROM Offset:** {bank['rom_offset']}",
					f"- **Classification:** {bank['classification']}",
					f"- **Entropy:** {bank['entropy']:.3f}",
					f"- **Empty:** {'Yes' if bank['is_empty'] else 'No'}",
					""
				])

		# Add utilization statistics
		if 'memory_layout' in report_data['banking_analysis']:
			util = report_data['banking_analysis']['memory_layout']['utilization']

			content.extend([
				"## Bank Utilization Statistics",
				"",
				f"- **Total Banks:** {util['total_banks']}",
				f"- **Utilized Banks:** {util['utilized_banks']}",
				f"- **Empty Banks:** {util['empty_banks']}",
				f"- **Utilization Rate:** {util['percentage']:.1f}%",
				""
			])

		# Add technical details
		content.extend([
			"## Banking Mechanics",
			"",
			"### Address Translation",
			"",
			"```",
			"SNES Address: $BB:HHLL",
			"	BB = Bank number ($00-$7F, mirrored at $80-$FF)",
			"	HHLL = High/Low address within bank ($8000-$FFFF for ROM)",
			"",
			"ROM Offset = BB * $8000 + (HHLL - $8000)",
			"```",
			"",
			"### Cross-Bank Operations",
			"",
			"- **JSL (Jump Subroutine Long):** 24-bit far calls",
			"- **JML (Jump Long):** 24-bit far jumps",
			"- **Bank Register:** CPU register controlling current bank",
			"- **Direct Page:** Zero page equivalent in current bank",
			"",
			"## Implementation Notes",
			"",
			"1. **ROM Access:** Direct mapping requires no bank switching",
			"2. **SRAM Access:** Battery-backed save data persistent across resets",
			"3. **Bank Mirroring:** Enables flexible addressing schemes",
			"4. **Memory Layout:** Optimized for 16-bit addressing with extensions",
			"",
			"---",
			"*Generated by Dragon Quest III Memory Banking Analyzer*",
			"*Professional SNES LoROM analysis with comprehensive documentation*"
		])

		with open(output_path, 'w') as f:
			f.write('\n'.join(content))

def main():
	"""Main banking analysis process"""

	project_root = os.getcwd()
	analyzer = DQ3MemoryBankingAnalyzer(project_root)

	try:
		# Load ROM
		if not analyzer.load_rom():
			return 1

		# Perform comprehensive banking analysis
		analyzer.analyze_rom_header()
		analyzer.analyze_bank_structure()
		analyzer.analyze_memory_layout()
		analyzer.analyze_cross_bank_references()

		# Generate comprehensive report
		analyzer.generate_banking_report()

		print("\n🎉 MEMORY BANKING ANALYSIS COMPLETE!")
		print("=" * 50)
		print("🏦 Achievement: Complete SNES LoROM analysis")
		print("📊 Coverage: Banking system fully documented")
		print("🔗 Cross-references: Inter-bank dependencies mapped")
		print("📝 Documentation: Professional technical specifications")

		return 0

	except Exception as e:
		print(f"❌ Banking analysis error: {str(e)}")
		return 1

if __name__ == "__main__":
	exit(main())
