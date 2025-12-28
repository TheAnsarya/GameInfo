#!/usr/bin/env python3
"""
Dragon Quest III - Graphics Engine Analysis & Disassembly
=========================================================

Comprehensive analysis of PPU management, sprite system, tile rendering,
palette management, and graphics compression systems.
"""

import struct
import time
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
from dataclasses import dataclass
import json


@dataclass
class GraphicsFunction:
	"""Represents a graphics-related function"""

	name: str
	address: int
	size: int
	purpose: str
	ppu_registers_used: List[str]
	complexity_score: int
	call_frequency: str
	instructions: List[Dict]


@dataclass
class SpriteData:
	"""Represents sprite data structure"""

	address: int
	width: int
	height: int
	format: str	# "4bpp", "2bpp", etc.
	palette_offset: int
	tiles_count: int
	compression: str


@dataclass
class PPURegisterAccess:
	"""PPU register access pattern"""

	register: int
	access_type: str	# "read", "write"
	function_address: int
	purpose: str
	value_written: Optional[int] = None


class DQ3GraphicsAnalyzer:
	"""Advanced graphics engine analyzer"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.graphics_functions = []
		self.ppu_accesses = []
		self.sprite_data = []
		self.palette_data = []
		self.tile_data = []

		# SNES PPU register map
		self.ppu_registers = {
			0x2100: ("INIDISP", "Display Control"),
			0x2101: ("OBSEL", "Object Size and Base"),
			0x2102: ("OAMADDL", "OAM Address Low"),
			0x2103: ("OAMADDH", "OAM Address High"),
			0x2104: ("OAMDATA", "OAM Data Write"),
			0x2105: ("BGMODE", "Background Mode"),
			0x2106: ("MOSAIC", "Mosaic Settings"),
			0x2107: ("BG1SC", "BG1 Screen Base and Size"),
			0x2108: ("BG2SC", "BG2 Screen Base and Size"),
			0x2109: ("BG3SC", "BG3 Screen Base and Size"),
			0x210a: ("BG4SC", "BG4 Screen Base and Size"),
			0x210b: ("BG12NBA", "BG1 and BG2 Name Base"),
			0x210c: ("BG34NBA", "BG3 and BG4 Name Base"),
			0x210d: ("BG1HOFS", "BG1 Horizontal Scroll"),
			0x210e: ("BG1VOFS", "BG1 Vertical Scroll"),
			0x210f: ("BG2HOFS", "BG2 Horizontal Scroll"),
			0x2110: ("BG2VOFS", "BG2 Vertical Scroll"),
			0x2111: ("BG3HOFS", "BG3 Horizontal Scroll"),
			0x2112: ("BG3VOFS", "BG3 Vertical Scroll"),
			0x2113: ("BG4HOFS", "BG4 Horizontal Scroll"),
			0x2114: ("BG4VOFS", "BG4 Vertical Scroll"),
			0x2115: ("VMAIN", "VRAM Address Increment"),
			0x2116: ("VMADD", "VRAM Address"),
			0x2118: ("VMDATA", "VRAM Data Write"),
			0x2119: ("VMDATAL", "VRAM Data Low"),
			0x211a: ("VMDATAH", "VRAM Data High"),
			0x211b: ("M7SEL", "Mode 7 Settings"),
			0x211c: ("M7A", "Mode 7 Matrix A"),
			0x211d: ("M7B", "Mode 7 Matrix B"),
			0x211e: ("M7C", "Mode 7 Matrix C"),
			0x211f: ("M7D", "Mode 7 Matrix D"),
			0x2120: ("M7X", "Mode 7 Center X"),
			0x2121: ("M7Y", "Mode 7 Center Y"),
			0x2122: ("CGADD", "Palette Address"),
			0x2123: ("CGDATA", "Palette Data"),
			0x2124: ("W12SEL", "Window BG1/BG2 Select"),
			0x2125: ("W34SEL", "Window BG3/BG4 Select"),
			0x2126: ("WOBJSEL", "Window Object Select"),
			0x2127: ("WH0", "Window 1 Left"),
			0x2128: ("WH1", "Window 1 Right"),
			0x2129: ("WH2", "Window 2 Left"),
			0x212a: ("WH3", "Window 2 Right"),
			0x212b: ("WBGLOG", "Window BG Logic"),
			0x212c: ("WOBJLOG", "Window Object Logic"),
			0x212d: ("TM", "Main Screen Designation"),
			0x212e: ("TS", "Sub Screen Designation"),
			0x212f: ("TMW", "Main Screen Window"),
			0x2130: ("TSW", "Sub Screen Window"),
			0x2131: ("CGWSEL", "Color Math Control"),
			0x2132: ("CGADSUB", "Color Math Sub Screen"),
			0x2133: ("COLDATA", "Color Math Data"),
			0x2134: ("SETINI", "Screen Display"),
		}

		# DMA registers for graphics transfers
		self.dma_registers = {
			0x4300: ("DMAPARAM", "DMA Transfer Parameter"),
			0x4301: ("BBAD", "DMA Destination"),
			0x4302: ("A1TL", "DMA Source Address Low"),
			0x4303: ("A1TH", "DMA Source Address High"),
			0x4304: ("A1B", "DMA Source Address Bank"),
			0x4305: ("DASL", "DMA Transfer Size Low"),
			0x4306: ("DASH", "DMA Transfer Size High"),
			0x420b: ("MDMAEN", "DMA Enable"),
			0x420c: ("HDMAEN", "HDMA Enable"),
		}

		print(f"🎨 Graphics Engine Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes")

	def find_ppu_access_functions(self) -> List[GraphicsFunction]:
		"""Find all functions that access PPU registers"""
		print("\n🖼️ Searching for PPU access functions...")

		graphics_functions = []
		ppu_accesses = []

		# Search for all PPU register accesses
		for offset in range(0, len(self.rom_data) - 2):
			# Look for STA absolute to PPU registers
			if self.rom_data[offset] == 0x8d:	# STA absolute
				target_addr = struct.unpack(
					"<H", self.rom_data[offset + 1 : offset + 3]
				)[0]

				if target_addr in self.ppu_registers:
					reg_name, reg_desc = self.ppu_registers[target_addr]

					# Find the function containing this access
					func_start = self._find_function_start(offset)
					func_end = self._find_function_end(offset)

					if func_start and func_end and func_end > func_start:
						func_addr = 0x8000 + (func_start % 0x8000)

						# Check if we already found this function
						existing_func = next(
							(f for f in graphics_functions if f.address == func_addr),
							None,
						)

						if not existing_func:
							# Disassemble the function
							func_code = self.disassemble_region(
								func_start, func_end - func_start
							)

							# Analyze PPU registers used in this function
							ppu_regs_used = self._find_ppu_registers_in_function(
								func_code
							)

							# Determine function purpose based on PPU usage
							purpose = self._classify_graphics_function(
								ppu_regs_used, func_code
							)

							graphics_func = GraphicsFunction(
								name=f"gfx_func_{func_addr:04X}",
								address=func_addr,
								size=func_end - func_start,
								purpose=purpose,
								ppu_registers_used=ppu_regs_used,
								complexity_score=len(ppu_regs_used) * 10
								+ len(func_code),
								call_frequency=self._estimate_call_frequency(func_code),
								instructions=func_code,
							)

							graphics_functions.append(graphics_func)

					# Record this PPU access
					ppu_access = PPURegisterAccess(
						register=target_addr,
						access_type="write",
						function_address=(
							0x8000 + (func_start % 0x8000) if func_start else 0
						),
						purpose=f"Write to {reg_name} - {reg_desc}",
					)

					ppu_accesses.append(ppu_access)

		print(f"	 Found {len(graphics_functions)} graphics functions")
		print(f"	 Found {len(ppu_accesses)} PPU register accesses")

		self.graphics_functions = graphics_functions
		self.ppu_accesses = ppu_accesses
		return graphics_functions

	def analyze_sprite_system(self) -> List[SpriteData]:
		"""Analyze the sprite/OAM management system"""
		print("\n👾 Analyzing sprite system...")

		sprite_data = []

		# Look for OAM-related operations
		oam_functions = []
		for func in self.graphics_functions:
			if any(
				reg in ["OAMADDL", "OAMADDH", "OAMDATA"]
				for reg in func.ppu_registers_used
			):
				oam_functions.append(func)

		print(f"	 Found {len(oam_functions)} OAM-related functions")

		# Look for DMA transfers to OAM (common for sprite updates)
		for offset in range(0, len(self.rom_data) - 5):
			# Look for DMA setup pattern: LDA #$00, STA $4301 (OAM destination)
			if (
				self.rom_data[offset] == 0xa9	# LDA immediate
				and self.rom_data[offset + 2] == 0x8d	# STA absolute
				and struct.unpack("<H", self.rom_data[offset + 3 : offset + 5])[0]
				== 0x4301
			):

				dma_value = self.rom_data[offset + 1]
				if dma_value == 0x00:	# DMA to $2104 (OAMDATA)
					print(f"	 Found OAM DMA setup at ${offset:06X}")

					# Look for source address setup
					source_addr = self._find_dma_source_address(offset)
					if source_addr:
						print(f"	 Source address: ${source_addr:06X}")

						# Analyze sprite data at source
						sprite_info = self._analyze_sprite_data_at_address(source_addr)
						if sprite_info:
							sprite_data.append(sprite_info)

		# Look for sprite graphics in VRAM transfers
		for func in self.graphics_functions:
			if "VRAM" in func.purpose or "VMDATA" in func.ppu_registers_used:
				print(f"	 Analyzing VRAM function: {func.name}")

				# Look for graphics data patterns
				for inst in func.instructions:
					if inst["name"] == "LDA" and inst["operand"].startswith(" $"):
						try:
							addr = int(inst["operand"].replace(" $", ""), 16)
							if 0x8000 <= addr <= 0xffff:
								rom_offset = self._snes_to_rom_address(addr)
								if rom_offset > 0:
									graphics_data = self._check_for_graphics_data(
										rom_offset
									)
									if graphics_data:
										sprite_data.append(graphics_data)
						except:
							pass

		self.sprite_data = sprite_data
		print(f"	 Identified {len(sprite_data)} sprite data structures")
		return sprite_data

	def analyze_background_system(self) -> Dict[str, Any]:
		"""Analyze background/tilemap system"""
		print("\n🗺️ Analyzing background system...")

		bg_analysis = {
			"bg_functions": [],
			"tilemap_data": [],
			"tile_data": [],
			"bg_mode_usage": {},
		}

		# Find background-related functions
		for func in self.graphics_functions:
			bg_regs = [
				"BGMODE",
				"BG1SC",
				"BG2SC",
				"BG3SC",
				"BG4SC",
				"BG12NBA",
				"BG34NBA",
			]
			if any(reg in func.ppu_registers_used for reg in bg_regs):
				bg_analysis["bg_functions"].append(func)

		print(f"	 Found {len(bg_analysis['bg_functions'])} background functions")

		# Analyze BG mode usage patterns
		for access in self.ppu_accesses:
			if access.register == 0x2105:	# BGMODE
				if access.value_written:
					mode = access.value_written & 0x07
					if mode not in bg_analysis["bg_mode_usage"]:
						bg_analysis["bg_mode_usage"][mode] = 0
					bg_analysis["bg_mode_usage"][mode] += 1

		# Look for tilemap data transfers
		for func in bg_analysis["bg_functions"]:
			if "VRAM" in func.purpose:
				# Analyze potential tilemap data
				tilemap_refs = self._find_tilemap_references(func)
				bg_analysis["tilemap_data"].extend(tilemap_refs)

		print(f"	 Background mode usage: {bg_analysis['bg_mode_usage']}")
		print(f"	 Tilemap references: {len(bg_analysis['tilemap_data'])}")

		return bg_analysis

	def analyze_palette_system(self) -> List[Dict]:
		"""Analyze palette/color management"""
		print("\n🎨 Analyzing palette system...")

		palette_data = []

		# Find palette-related functions
		palette_functions = []
		for func in self.graphics_functions:
			if any(reg in ["CGADD", "CGDATA"] for reg in func.ppu_registers_used):
				palette_functions.append(func)

		print(f"	 Found {len(palette_functions)} palette functions")

		# Analyze each palette function
		for func in palette_functions:
			print(f"	 Analyzing palette function: {func.name}")

			palette_refs = []
			for inst in func.instructions:
				# Look for palette data references
				if inst["name"] in ["LDA", "LDX", "LDY"] and inst["operand"].startswith(
					" $"
				):
					try:
						addr = int(inst["operand"].replace(" $", ""), 16)
						if 0x8000 <= addr <= 0xffff:
							rom_offset = self._snes_to_rom_address(addr)
							if rom_offset > 0 and rom_offset < len(self.rom_data) - 32:
								# Check if this looks like palette data
								if self._looks_like_palette_data(rom_offset):
									palette_info = {
										"address": addr,
										"rom_offset": rom_offset,
										"function": func.name,
										"size_estimated": 32,	# Standard SNES palette size
										"format": "15-bit RGB",
									}
									palette_refs.append(palette_info)
									print(f"	 Found palette data at ${addr:04X}")
					except:
						pass

			palette_data.extend(palette_refs)

		self.palette_data = palette_data
		print(f"	 Identified {len(palette_data)} palette data structures")
		return palette_data

	def find_graphics_compression(self) -> Dict[str, Any]:
		"""Analyze graphics compression and decompression routines"""
		print("\n📦 Analyzing graphics compression...")

		compression_analysis = {
			"decompression_functions": [],
			"compression_formats": [],
			"compressed_data_locations": [],
		}

		# Look for decompression patterns
		for func in self.graphics_functions:
			if self._looks_like_decompression(func):
				compression_analysis["decompression_functions"].append(func)
				print(f"	 Found potential decompression: {func.name}")

		# Look for compressed data patterns in ROM
		for offset in range(0, len(self.rom_data) - 100, 0x1000):
			if self._detect_compressed_graphics(offset):
				compression_analysis["compressed_data_locations"].append(
					{
						"offset": offset,
						"address": 0x8000 + (offset % 0x8000),
						"estimated_format": "unknown",
					}
				)

		print(
			f"	 Decompression functions: {len(compression_analysis['decompression_functions'])}"
		)
		print(
			f"	 Compressed data locations: {len(compression_analysis['compressed_data_locations'])}"
		)

		return compression_analysis

	def _find_function_start(self, offset: int) -> Optional[int]:
		"""Find the start of a function containing the given offset"""
		search_start = max(0, offset - 2000)

		for i in range(offset, search_start, -1):
			# Look for function entry patterns
			if i >= 3 and self.rom_data[i - 3 : i] == b"\x20\x00\x80":	# JSR $8000
				return i
			if i >= 0 and self.rom_data[i] in [0x48, 0xda, 0x5a]:	# Function prologue
				return i

		return search_start

	def _find_function_end(self, offset: int) -> Optional[int]:
		"""Find the end of a function containing the given offset"""
		search_end = min(len(self.rom_data), offset + 2000)

		for i in range(offset, search_end):
			if i < len(self.rom_data) and self.rom_data[i] in [
				0x60,
				0x6b,
				0x40,
			]:	# RTS, RTL, RTI
				return i + 1

		return search_end

	def _find_ppu_registers_in_function(self, instructions: List[Dict]) -> List[str]:
		"""Find all PPU registers accessed in a function"""
		registers = set()

		for inst in instructions:
			if inst["name"] == "STA" and inst["operand"].startswith(" $"):
				try:
					addr = int(inst["operand"].replace(" $", ""), 16)
					if addr in self.ppu_registers:
						reg_name, _ = self.ppu_registers[addr]
						registers.add(reg_name)
				except:
					pass

		return list(registers)

	def _classify_graphics_function(
		self, ppu_regs: List[str], instructions: List[Dict]
	) -> str:
		"""Classify the purpose of a graphics function"""
		if any(reg in ppu_regs for reg in ["OAMADDL", "OAMADDH", "OAMDATA"]):
			return "Sprite/OAM management"
		elif any(reg in ppu_regs for reg in ["VMAIN", "VMADD", "VMDATA"]):
			return "VRAM data transfer"
		elif any(reg in ppu_regs for reg in ["CGADD", "CGDATA"]):
			return "Palette management"
		elif any(
			reg in ppu_regs for reg in ["BGMODE", "BG1SC", "BG2SC", "BG3SC", "BG4SC"]
		):
			return "Background configuration"
		elif "INIDISP" in ppu_regs:
			return "Display control"
		elif any(
			reg in ppu_regs for reg in ["BG1HOFS", "BG1VOFS", "BG2HOFS", "BG2VOFS"]
		):
			return "Background scrolling"
		else:
			return "General graphics operation"

	def _estimate_call_frequency(self, instructions: List[Dict]) -> str:
		"""Estimate how frequently a function is called"""
		if len(instructions) < 10:
			return "frequent"
		elif len(instructions) < 50:
			return "moderate"
		else:
			return "infrequent"

	def _snes_to_rom_address(self, snes_addr: int) -> int:
		"""Convert SNES address to ROM file offset"""
		bank = (snes_addr >> 16) & 0xff
		offset = snes_addr & 0xffff

		if bank < 0x80 and offset >= 0x8000:
			return (bank * 0x8000) + (offset - 0x8000)
		elif bank >= 0x80 and offset >= 0x8000:
			bank = bank - 0x80
			return (bank * 0x8000) + (offset - 0x8000)

		return 0

	def _find_dma_source_address(self, offset: int) -> Optional[int]:
		"""Find DMA source address from DMA setup code"""
		# Look backwards and forwards for source address setup
		search_range = range(max(0, offset - 50), min(len(self.rom_data), offset + 50))

		for i in search_range:
			if (
				i + 4 < len(self.rom_data)
				and self.rom_data[i] == 0x8d	# STA absolute
				and struct.unpack("<H", self.rom_data[i + 1 : i + 3])[0] == 0x4302
			):	# A1TL

				# Look for preceding LDA
				if i >= 3 and self.rom_data[i - 3] == 0xa9:	# LDA immediate
					addr_low = self.rom_data[i - 2]

					# Look for high byte
					for j in range(i, min(len(self.rom_data), i + 20)):
						if (
							j + 4 < len(self.rom_data)
							and self.rom_data[j] == 0x8d
							and struct.unpack("<H", self.rom_data[j + 1 : j + 3])[0]
							== 0x4303
						):	# A1TH

							if j >= 3 and self.rom_data[j - 3] == 0xa9:
								addr_high = self.rom_data[j - 2]
								return (addr_high << 8) | addr_low

		return None

	def _analyze_sprite_data_at_address(self, address: int) -> Optional[SpriteData]:
		"""Analyze sprite data structure at given address"""
		if address + 64 > len(self.rom_data):
			return None

		data = self.rom_data[address : address + 64]

		# Basic sprite data analysis (simplified)
		sprite_info = SpriteData(
			address=address,
			width=16,	# Default SNES sprite size
			height=16,
			format="4bpp",	# Most common
			palette_offset=0,
			tiles_count=1,
			compression="none",
		)

		return sprite_info

	def _check_for_graphics_data(self, offset: int) -> Optional[SpriteData]:
		"""Check if data at offset looks like graphics data"""
		if offset + 128 > len(self.rom_data):
			return None

		data = self.rom_data[offset : offset + 128]

		# Simple heuristic: graphics data often has patterns
		unique_bytes = len(set(data))
		if unique_bytes > 16 and unique_bytes < 64:	# Graphics-like byte distribution
			return SpriteData(
				address=0x8000 + (offset % 0x8000),
				width=8,
				height=8,
				format="4bpp",
				palette_offset=0,
				tiles_count=1,
				compression="none",
			)

		return None

	def _find_tilemap_references(self, func: GraphicsFunction) -> List[Dict]:
		"""Find tilemap data references in a function"""
		tilemaps = []

		for inst in func.instructions:
			if inst["name"] in ["LDA", "LDX", "LDY"] and inst["operand"].startswith(
				" $"
			):
				try:
					addr = int(inst["operand"].replace(" $", ""), 16)
					if 0x8000 <= addr <= 0xffff:
						rom_offset = self._snes_to_rom_address(addr)
						if rom_offset > 0:
							tilemap_info = {
								"address": addr,
								"rom_offset": rom_offset,
								"function": func.name,
								"estimated_size": 1024,	# 32x32 tilemap
								"format": "16-bit tiles",
							}
							tilemaps.append(tilemap_info)
				except:
					pass

		return tilemaps

	def _looks_like_palette_data(self, offset: int) -> bool:
		"""Check if data looks like SNES palette data"""
		if offset + 32 > len(self.rom_data):
			return False

		data = self.rom_data[offset : offset + 32]

		# SNES palette: 16 colors, 2 bytes each, 15-bit RGB
		for i in range(0, 32, 2):
			if i + 1 < len(data):
				color = struct.unpack("<H", data[i : i + 2])[0]
				# Check if it's a valid 15-bit color (high bit should be 0)
				if color & 0x8000:
					return False

		return True

	def _looks_like_decompression(self, func: GraphicsFunction) -> bool:
		"""Check if function looks like a decompression routine"""
		# Look for decompression patterns
		has_loops = any(
			inst["name"] in ["BNE", "BEQ", "BRA"] for inst in func.instructions
		)
		has_bit_ops = any(
			inst["name"] in ["AND", "ORA", "EOR"] for inst in func.instructions
		)
		has_shifts = any(
			inst["name"] in ["ASL", "LSR", "ROL", "ROR"] for inst in func.instructions
		)

		return has_loops and (has_bit_ops or has_shifts) and len(func.instructions) > 50

	def _detect_compressed_graphics(self, offset: int) -> bool:
		"""Detect if data at offset might be compressed graphics"""
		if offset + 256 > len(self.rom_data):
			return False

		data = self.rom_data[offset : offset + 256]

		# Look for compression headers or patterns
		if (
			data[0] in [0x00, 0x01, 0x02] and data[1] == 0x00
		):	# Common compression headers
			return True

		# Check entropy (compressed data should have high entropy)
		unique_bytes = len(set(data))
		return unique_bytes > 128	# High entropy indicator

	def disassemble_region(self, start_offset: int, size: int) -> List[Dict]:
		"""Disassemble a region of code"""
		instructions = []
		offset = start_offset
		end_offset = min(start_offset + size, len(self.rom_data))

		# Basic 65816 opcodes for graphics analysis
		opcodes = {
			0x8d: ("STA", 3),
			0xad: ("LDA", 3),
			0xa9: ("LDA", 2),
			0x60: ("RTS", 1),
			0x20: ("JSR", 3),
			0x4c: ("JMP", 3),
			0xf0: ("BEQ", 2),
			0xd0: ("BNE", 2),
			0x80: ("BRA", 2),
		}

		while offset < end_offset:
			if offset >= len(self.rom_data):
				break

			opcode = self.rom_data[offset]

			if opcode in opcodes:
				name, length = opcodes[opcode]
				operand_bytes = (
					self.rom_data[offset + 1 : offset + length]
					if offset + length <= len(self.rom_data)
					else b""
				)

				if length == 1:
					full_instruction = name
				elif length == 2:
					operand = operand_bytes[0] if operand_bytes else 0
					full_instruction = f"{name} #${operand:02X}"
				elif length == 3:
					if len(operand_bytes) >= 2:
						operand = struct.unpack("<H", operand_bytes[:2])[0]
					else:
						operand = 0
					full_instruction = f"{name} ${operand:04X}"

				instruction = {
					"offset": offset,
					"name": name,
					"operand": f" ${operand:04X}" if length > 1 else "",
					"full": full_instruction,
				}

				instructions.append(instruction)
				offset += length

				if opcode == 0x60:	# RTS
					break
			else:
				offset += 1

		return instructions

	def generate_graphics_analysis(self, output_dir: str):
		"""Generate comprehensive graphics analysis documentation"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"\n📝 Generating graphics analysis...")

		# Assembly file
		asm_file = output_path / "graphics_engine.asm"
		doc_file = output_path / "graphics_analysis.md"
		data_file = output_path / "graphics_data.json"

		# Generate assembly
		with open(asm_file, "w") as f:
			f.write("; Dragon Quest III - Graphics Engine Disassembly\n")
			f.write("; Generated by Graphics Engine Analyzer\n\n")

			for func in self.graphics_functions:
				f.write(f"; {func.purpose}\n")
				f.write(f"{func.name}:\t\t; ${func.address:04X}\n")
				for inst in func.instructions[:30]:	# First 30 instructions
					f.write(f"\t{inst['full'].lower():<20}\n")
				if len(func.instructions) > 30:
					f.write(
						f"\t; ... ({len(func.instructions) - 30} more instructions)\n"
					)
				f.write("\n")

		# Generate documentation
		with open(doc_file, "w", encoding="utf-8") as f:
			f.write("# Dragon Quest III - Graphics Engine Analysis\n\n")
			f.write(f"## Analysis Summary\n")
			f.write(f"- **ROM:** {self.rom_path.name}\n")
			f.write(f"- **Graphics Functions:** {len(self.graphics_functions)}\n")
			f.write(f"- **PPU Accesses:** {len(self.ppu_accesses)}\n")
			f.write(f"- **Sprite Data Structures:** {len(self.sprite_data)}\n")
			f.write(f"- **Palette Data:** {len(self.palette_data)}\n\n")

			f.write("## Graphics Functions\n\n")
			for func in self.graphics_functions:
				f.write(f"### {func.name}\n")
				f.write(f"- **Address:** ${func.address:04X}\n")
				f.write(f"- **Purpose:** {func.purpose}\n")
				f.write(f"- **Size:** {func.size} bytes\n")
				f.write(f"- **PPU Registers:** {', '.join(func.ppu_registers_used)}\n")
				f.write(f"- **Complexity:** {func.complexity_score}\n\n")

			f.write("## PPU Register Usage\n\n")
			reg_usage = {}
			for access in self.ppu_accesses:
				reg_name = self.ppu_registers.get(access.register, ["Unknown"])[0]
				if reg_name not in reg_usage:
					reg_usage[reg_name] = 0
				reg_usage[reg_name] += 1

			f.write("| Register | Usage Count | Purpose |\n")
			f.write("|----------|-------------|----------|\n")
			for reg, count in sorted(
				reg_usage.items(), key=lambda x: x[1], reverse=True
			):
				purpose = self.ppu_registers.get(reg, ["Unknown", "Unknown purpose"])[1]
				f.write(f"| {reg} | {count} | {purpose} |\n")

		# Generate JSON data
		analysis_data = {
			"functions": [
				{
					"name": func.name,
					"address": func.address,
					"purpose": func.purpose,
					"ppu_registers": func.ppu_registers_used,
					"complexity": func.complexity_score,
				}
				for func in self.graphics_functions
			],
			"sprite_data": [
				{
					"address": sprite.address,
					"width": sprite.width,
					"height": sprite.height,
					"format": sprite.format,
				}
				for sprite in self.sprite_data
			],
			"palette_data": self.palette_data,
		}

		with open(data_file, "w") as f:
			json.dump(analysis_data, f, indent=2)

		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		print(f"	 Data: {data_file}")

		return asm_file, doc_file, data_file

	def run_complete_analysis(self, output_dir: str):
		"""Run complete graphics engine analysis"""
		print("🔥 Starting Graphics Engine Analysis")
		print("=" * 50)

		# Run all analysis components
		graphics_functions = self.find_ppu_access_functions()
		sprite_data = self.analyze_sprite_system()
		bg_analysis = self.analyze_background_system()
		palette_data = self.analyze_palette_system()
		compression_analysis = self.find_graphics_compression()

		# Generate comprehensive documentation
		asm_file, doc_file, data_file = self.generate_graphics_analysis(output_dir)

		print(f"\n🎯 Graphics Engine Analysis Complete!")
		print(f"	 Graphics functions: {len(graphics_functions)}")
		print(f"	 Sprite data structures: {len(sprite_data)}")
		print(f"	 Background functions: {len(bg_analysis['bg_functions'])}")
		print(f"	 Palette data: {len(palette_data)}")
		print(
			f"	 Compression functions: {len(compression_analysis['decompression_functions'])}"
		)
		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		print(f"	 Analysis data: {data_file}")


def main():
	"""Main entry point for graphics analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/analysis/graphics_engine"

	print("🎨 Dragon Quest III - Graphics Engine Analysis")
	print("=" * 60)

	analyzer = DQ3GraphicsAnalyzer(rom_path)
	analyzer.run_complete_analysis(output_dir)


if __name__ == "__main__":
	main()
