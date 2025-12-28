#!/usr/bin/env python3
"""
Dragon Quest III - Main Game Loop Analysis & Disassembly
=======================================================

Comprehensive analysis of the core game loop, frame processing,
input handling, state management, and timing systems.
"""

import struct
import time
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
from dataclasses import dataclass
import json


@dataclass
class GameLoopFunction:
	"""Represents a function within the game loop system"""

	name: str
	address: int
	size: int
	purpose: str
	instructions: List[Dict]
	calls_made: List[int]
	calls_received: List[int]
	complexity_score: int
	execution_frequency: str	# "every_frame", "periodic", "event_driven"


@dataclass
class StateTransition:
	"""Represents a game state transition"""

	from_state: str
	to_state: str
	trigger_address: int
	condition: str
	description: str


class DQ3GameLoopAnalyzer:
	"""Advanced game loop and state management analyzer"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.game_functions = {}
		self.state_transitions = []
		self.frame_handlers = []
		self.input_handlers = []
		self.vblank_code = None

		# Enhanced 65816 instruction set for game loop analysis
		self.opcodes = {
			# Core instructions
			0x18: ("CLC", 1, "Clear carry flag"),
			0x38: ("SEC", 1, "Set carry flag"),
			0x58: ("CLI", 1, "Clear interrupt disable"),
			0x78: ("SEI", 1, "Set interrupt disable"),
			0xc2: ("REP", 2, "Reset processor status"),
			0xe2: ("SEP", 2, "Set processor status"),
			0xfb: ("XCE", 1, "Exchange carry and emulation"),
			# Load/Store operations
			0xa9: ("LDA", 2, "Load accumulator immediate"),
			0xad: ("LDA", 3, "Load accumulator absolute"),
			0xaf: ("LDA", 4, "Load accumulator absolute long"),
			0xb9: ("LDA", 3, "Load accumulator absolute Y"),
			0xbd: ("LDA", 3, "Load accumulator absolute X"),
			0xa5: ("LDA", 2, "Load accumulator direct"),
			0x8d: ("STA", 3, "Store accumulator absolute"),
			0x8f: ("STA", 4, "Store accumulator absolute long"),
			0x99: ("STA", 3, "Store accumulator absolute Y"),
			0x9d: ("STA", 3, "Store accumulator absolute X"),
			0x85: ("STA", 2, "Store accumulator direct"),
			0x9c: ("STZ", 3, "Store zero absolute"),
			0x64: ("STZ", 2, "Store zero direct"),
			# Index register operations
			0xa2: ("LDX", 2, "Load X immediate"),
			0xae: ("LDX", 3, "Load X absolute"),
			0xa0: ("LDY", 2, "Load Y immediate"),
			0xac: ("LDY", 3, "Load Y absolute"),
			0x8e: ("STX", 3, "Store X absolute"),
			0x8c: ("STY", 3, "Store Y absolute"),
			# Jump/Branch instructions
			0x4c: ("JMP", 3, "Jump absolute"),
			0x5c: ("JML", 4, "Jump long"),
			0x6c: ("JMP", 3, "Jump indirect"),
			0x20: ("JSR", 3, "Jump subroutine"),
			0x22: ("JSL", 4, "Jump subroutine long"),
			0x60: ("RTS", 1, "Return from subroutine"),
			0x6b: ("RTL", 1, "Return from subroutine long"),
			0x40: ("RTI", 1, "Return from interrupt"),
			# Branch instructions
			0x80: ("BRA", 2, "Branch always"),
			0x82: ("BRL", 3, "Branch long always"),
			0x10: ("BPL", 2, "Branch plus"),
			0x30: ("BMI", 2, "Branch minus"),
			0x50: ("BVC", 2, "Branch overflow clear"),
			0x70: ("BVS", 2, "Branch overflow set"),
			0x90: ("BCC", 2, "Branch carry clear"),
			0xb0: ("BCS", 2, "Branch carry set"),
			0xd0: ("BNE", 2, "Branch not equal"),
			0xf0: ("BEQ", 2, "Branch equal"),
			# Arithmetic operations
			0x69: ("ADC", 2, "Add with carry immediate"),
			0x6d: ("ADC", 3, "Add with carry absolute"),
			0xe9: ("SBC", 2, "Subtract with borrow immediate"),
			0xed: ("SBC", 3, "Subtract with borrow absolute"),
			0x1a: ("INC", 1, "Increment accumulator"),
			0xee: ("INC", 3, "Increment absolute"),
			0x3a: ("DEC", 1, "Decrement accumulator"),
			0xce: ("DEC", 3, "Decrement absolute"),
			# Logic operations
			0x29: ("AND", 2, "AND immediate"),
			0x2d: ("AND", 3, "AND absolute"),
			0x09: ("ORA", 2, "OR immediate"),
			0x0d: ("ORA", 3, "OR absolute"),
			0x49: ("EOR", 2, "XOR immediate"),
			0x4d: ("EOR", 3, "XOR absolute"),
			# Compare operations
			0xc9: ("CMP", 2, "Compare accumulator immediate"),
			0xcd: ("CMP", 3, "Compare accumulator absolute"),
			0xe0: ("CPX", 2, "Compare X immediate"),
			0xec: ("CPX", 3, "Compare X absolute"),
			0xc0: ("CPY", 2, "Compare Y immediate"),
			0xcc: ("CPY", 3, "Compare Y absolute"),
			# Bit operations
			0x24: ("BIT", 2, "Test bits direct"),
			0x2c: ("BIT", 3, "Test bits absolute"),
			0x89: ("BIT", 2, "Test bits immediate"),
			# Stack operations
			0x48: ("PHA", 1, "Push accumulator"),
			0x68: ("PLA", 1, "Pull accumulator"),
			0xda: ("PHX", 1, "Push X"),
			0xfa: ("PLX", 1, "Pull X"),
			0x5a: ("PHY", 1, "Push Y"),
			0x7a: ("PLY", 1, "Pull Y"),
			0x08: ("PHP", 1, "Push processor status"),
			0x28: ("PLP", 1, "Pull processor status"),
			# Miscellaneous
			0xea: ("NOP", 1, "No operation"),
			0x42: ("WDM", 2, "Reserved for future expansion"),
		}

		print(f"🎮 Game Loop Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes")

	def find_main_game_loop(self) -> Optional[GameLoopFunction]:
		"""Locate the main game loop through pattern analysis"""
		print("\n🔍 Searching for main game loop...")

		# Strategy 1: Look for infinite loop patterns
		infinite_loop_candidates = []

		for offset in range(0, min(0x200000, len(self.rom_data) - 10)):
			# Look for infinite loop pattern: code followed by JMP back to start
			if offset + 10 < len(self.rom_data):
				# Check for JMP absolute back to earlier address
				if self.rom_data[offset] == 0x4c:	# JMP absolute
					target_addr = struct.unpack("<H", self.rom_data[offset + 1 : offset + 3])[0]
					current_addr = 0x8000 + (offset % 0x8000)

					# If jumping backward and within reasonable range, might be main loop
					if target_addr < current_addr and (current_addr - target_addr) < 0x1000:
						infinite_loop_candidates.append(
							{
								"offset": offset,
								"jump_addr": target_addr,
								"loop_size": current_addr - target_addr,
								"current_addr": current_addr,
							}
						)

		print(f"	 Found {len(infinite_loop_candidates)} potential infinite loop patterns")

		# Analyze each candidate for game loop characteristics
		best_candidate = None
		best_score = 0

		for candidate in infinite_loop_candidates:
			score = self._analyze_loop_candidate(candidate)
			if score > best_score:
				best_score = score
				best_candidate = candidate

		if best_candidate:
			print(f"	 Best main loop candidate: ${best_candidate['current_addr']:04X} (score: {best_score})")
			return self._disassemble_game_loop(best_candidate)

		# Strategy 2: Look for VBlank handler and work backwards
		vblank_handler = self.find_vblank_handler()
		if vblank_handler:
			print(f"	 VBlank handler found, tracing back to main loop...")
			return self._trace_to_main_loop(vblank_handler)

		print("	 Could not identify main game loop")
		return None

	def _analyze_loop_candidate(self, candidate: Dict) -> int:
		"""Score a loop candidate for likelihood of being the main game loop"""
		score = 0
		offset = candidate["offset"]
		loop_size = candidate["loop_size"]

		# Check for game loop characteristics within the loop
		loop_start = offset - loop_size
		loop_data = self.rom_data[loop_start : offset + 3]

		# Look for JSR calls (subroutine calls indicate complex processing)
		jsr_count = 0
		i = 0
		while i < len(loop_data) - 3:
			if loop_data[i] == 0x20:	# JSR
				jsr_count += 1
				i += 3
			else:
				i += 1

		score += jsr_count * 10	# More subroutines = higher score

		# Look for input handling patterns
		input_patterns = [0xad, 0x4016]	# LDA $4016 (controller read)
		for i in range(len(loop_data) - 2):
			if loop_data[i] == 0xad and struct.unpack("<H", loop_data[i + 1 : i + 3])[0] == 0x4016:
				score += 20	# Input handling is strong indicator

		# Look for graphics/PPU operations
		ppu_patterns = [0x2100, 0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106, 0x2107]
		for ppu_reg in ppu_patterns:
			for i in range(len(loop_data) - 2):
				if loop_data[i] == 0x8d and struct.unpack("<H", loop_data[i + 1 : i + 3])[0] == ppu_reg:
					score += 15	# PPU operations indicate main loop

		# Prefer moderate-sized loops (not too small, not too large)
		if 100 <= loop_size <= 2000:
			score += 25
		elif 50 <= loop_size < 100 or 2000 < loop_size <= 4000:
			score += 10

		return score

	def find_vblank_handler(self) -> Optional[Dict]:
		"""Locate the VBlank interrupt handler"""
		print("\n📺 Searching for VBlank handler...")

		# Look for RTI (return from interrupt) instructions
		rti_locations = []
		for offset in range(0, len(self.rom_data)):
			if self.rom_data[offset] == 0x40:	# RTI
				rti_locations.append(offset)

		print(f"	 Found {len(rti_locations)} RTI instructions")

		# Analyze each RTI to find VBlank handler
		for rti_offset in rti_locations:
			# Look backwards for VBlank-specific patterns
			start_search = max(0, rti_offset - 500)
			handler_data = self.rom_data[start_search : rti_offset + 1]

			vblank_score = 0

			# Look for PPU operations common in VBlank
			ppu_ops = [0x2100, 0x2101, 0x2102, 0x2103, 0x2104, 0x2105, 0x2106, 0x2107, 0x210d, 0x210e]
			for ppu_reg in ppu_ops:
				if any(
					handler_data[i] == 0x8d
					and i + 2 < len(handler_data)
					and struct.unpack("<H", handler_data[i + 1 : i + 3])[0] == ppu_reg
					for i in range(len(handler_data) - 2)
				):
					vblank_score += 10

			# Look for sprite DMA (common in VBlank)
			for i in range(len(handler_data) - 2):
				if handler_data[i] == 0x8d and struct.unpack("<H", handler_data[i + 1 : i + 3])[0] == 0x4014:	# OAM DMA
					vblank_score += 25

			if vblank_score > 20:
				handler_addr = 0x8000 + (start_search % 0x8000)
				print(f"	 VBlank handler found at ${handler_addr:04X} (score: {vblank_score})")

				# Disassemble the handler
				handler_code = self.disassemble_region(start_search, rti_offset - start_search + 1)

				self.vblank_code = {
					"address": handler_addr,
					"offset": start_search,
					"size": rti_offset - start_search + 1,
					"score": vblank_score,
					"instructions": handler_code,
				}

				return self.vblank_code

		return None

	def find_input_handling_system(self) -> List[GameLoopFunction]:
		"""Locate input handling functions"""
		print("\n🕹️ Analyzing input handling system...")

		input_functions = []

		# Search for controller reading patterns
		controller_patterns = [
			(0x4016, "Controller 1 data"),
			(0x4017, "Controller 2 data"),
		]

		for address, description in controller_patterns:
			# Find all references to controller ports
			for offset in range(0, len(self.rom_data) - 2):
				if (
					self.rom_data[offset] == 0xad	# LDA absolute
					and struct.unpack("<H", self.rom_data[offset + 1 : offset + 3])[0] == address
				):

					print(f"	 Found controller read at ${offset:06X}")

					# Disassemble surrounding function
					func_start = self._find_function_start(offset)
					func_end = self._find_function_end(offset)

					if func_start and func_end and func_end > func_start:
						func_code = self.disassemble_region(func_start, func_end - func_start)

						input_func = GameLoopFunction(
							name=f"input_handler_{address:04X}",
							address=0x8000 + (func_start % 0x8000),
							size=func_end - func_start,
							purpose=f"Handle {description}",
							instructions=func_code,
							calls_made=[],
							calls_received=[],
							complexity_score=len(func_code),
							execution_frequency="every_frame",
						)

						input_functions.append(input_func)

		self.input_handlers = input_functions
		print(f"	 Found {len(input_functions)} input handling functions")
		return input_functions

	def analyze_state_management(self) -> List[StateTransition]:
		"""Analyze game state transitions and management"""
		print("\n🔄 Analyzing state management system...")

		transitions = []

		# Look for state variable patterns
		state_candidates = []

		# Search for common state management patterns
		for offset in range(0, len(self.rom_data) - 5):
			# Pattern: LDA state_var, CMP #value, BEQ/BNE target
			if (
				self.rom_data[offset] == 0xad	# LDA absolute
				and self.rom_data[offset + 3] == 0xc9	# CMP immediate
				and self.rom_data[offset + 5] in [0xf0, 0xd0]
			):	# BEQ/BNE

				state_addr = struct.unpack("<H", self.rom_data[offset + 1 : offset + 3])[0]
				state_value = self.rom_data[offset + 4]
				branch_offset = self.rom_data[offset + 6]

				# Calculate branch target
				current_addr = 0x8000 + (offset % 0x8000)
				if branch_offset & 0x80:	# Negative branch
					target_addr = current_addr + 7 - (256 - branch_offset)
				else:	# Positive branch
					target_addr = current_addr + 7 + branch_offset

				state_candidates.append(
					{
						"offset": offset,
						"state_addr": state_addr,
						"state_value": state_value,
						"target_addr": target_addr,
						"branch_type": "BEQ" if self.rom_data[offset + 5] == 0xf0 else "BNE",
					}
				)

		print(f"	 Found {len(state_candidates)} potential state transitions")

		# Group by state address to find state machines
		state_machines = {}
		for candidate in state_candidates:
			addr = candidate["state_addr"]
			if addr not in state_machines:
				state_machines[addr] = []
			state_machines[addr].append(candidate)

		# Analyze each state machine
		for state_addr, candidates in state_machines.items():
			if len(candidates) > 2:	# Must have multiple states
				print(f"	 State machine found at ${state_addr:04X} with {len(candidates)} states")

				for candidate in candidates:
					transition = StateTransition(
						from_state=f"state_{candidate['state_value']:02X}",
						to_state="unknown",
						trigger_address=candidate["target_addr"],
						condition=f"{candidate['branch_type']} ${candidate['state_value']:02X}",
						description=f"State transition based on ${state_addr:04X}",
					)
					transitions.append(transition)

		self.state_transitions = transitions
		print(f"	 Identified {len(transitions)} state transitions")
		return transitions

	def disassemble_region(self, start_offset: int, size: int) -> List[Dict]:
		"""Disassemble a region and return instruction list"""
		instructions = []
		offset = start_offset
		end_offset = min(start_offset + size, len(self.rom_data))

		while offset < end_offset:
			if offset >= len(self.rom_data):
				break

			opcode = self.rom_data[offset]

			if opcode in self.opcodes:
				name, length, desc = self.opcodes[opcode]

				# Extract operand
				operand_bytes = (
					self.rom_data[offset + 1 : offset + length] if offset + length <= len(self.rom_data) else b""
				)

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
						operand = 0
					operand_str = f" ${operand:04X}"
					full_instruction = f"{name} ${operand:04X}"
				elif length == 4:
					if len(operand_bytes) >= 3:
						operand = operand_bytes[0] | (operand_bytes[1] << 8) | (operand_bytes[2] << 16)
					else:
						operand = 0
					operand_str = f" ${operand:06X}"
					full_instruction = f"{name} ${operand:06X}"

				instruction = {
					"offset": offset,
					"opcode": opcode,
					"name": name,
					"operand": operand_str,
					"full": full_instruction,
					"description": desc,
					"length": length,
				}

				instructions.append(instruction)
				offset += length
			else:
				# Unknown opcode
				instruction = {
					"offset": offset,
					"opcode": opcode,
					"name": "DB",
					"operand": f" ${opcode:02X}",
					"full": f"DB ${opcode:02X}",
					"description": f"Unknown opcode",
					"length": 1,
				}
				instructions.append(instruction)
				offset += 1

		return instructions

	def _find_function_start(self, offset: int) -> Optional[int]:
		"""Find the start of a function containing the given offset"""
		# Look backwards for function entry patterns
		search_start = max(0, offset - 1000)

		for i in range(offset, search_start, -1):
			if i - 3 >= 0:
				# Look for JSR to this location
				if self.rom_data[i - 3] == 0x20 and struct.unpack("<H", self.rom_data[i - 2 : i])[0] == (	# JSR
					0x8000 + (i % 0x8000)
				):
					return i

				# Look for label-like patterns (common function starts)
				if self.rom_data[i] in [0x48, 0xda, 0x5a] and i + 10 < len(	# PHA, PHX, PHY (function prologue)
					self.rom_data
				):
					return i

		return search_start

	def _find_function_end(self, offset: int) -> Optional[int]:
		"""Find the end of a function containing the given offset"""
		# Look forward for function exit patterns
		search_end = min(len(self.rom_data), offset + 1000)

		for i in range(offset, search_end):
			if i < len(self.rom_data):
				# Look for return instructions
				if self.rom_data[i] in [0x60, 0x6b, 0x40]:	# RTS, RTL, RTI
					return i + 1

		return search_end

	def _disassemble_game_loop(self, candidate: Dict) -> GameLoopFunction:
		"""Disassemble the identified main game loop"""
		loop_start = candidate["offset"] - candidate["loop_size"]
		loop_end = candidate["offset"] + 3

		instructions = self.disassemble_region(loop_start, loop_end - loop_start)

		# Analyze the loop for complexity and function calls
		jsr_calls = []
		for inst in instructions:
			if inst["name"] == "JSR":
				target = int(inst["operand"].replace(" $", ""), 16)
				jsr_calls.append(target)

		game_loop = GameLoopFunction(
			name="main_game_loop",
			address=candidate["jump_addr"],
			size=candidate["loop_size"],
			purpose="Core game loop handling frame processing, input, and state updates",
			instructions=instructions,
			calls_made=jsr_calls,
			calls_received=[],
			complexity_score=len(instructions) + len(jsr_calls) * 5,
			execution_frequency="every_frame",
		)

		return game_loop

	def _trace_to_main_loop(self, vblank_handler: Dict) -> Optional[GameLoopFunction]:
		"""Trace from VBlank handler back to main loop"""
		# This is a placeholder - in a real implementation,
		# we would follow the execution flow backwards
		print("	 Tracing execution flow from VBlank handler...")
		return None

	def generate_game_loop_analysis(self, output_dir: str):
		"""Generate comprehensive game loop analysis documentation"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		# Generate assembly file
		asm_file = output_path / "game_loop.asm"
		doc_file = output_path / "game_loop_analysis.md"

		print(f"\n📝 Generating game loop analysis...")

		# Main assembly output
		with open(asm_file, "w") as f:
			f.write("; Dragon Quest III - Game Loop Analysis\n")
			f.write("; Generated by Game Loop Analyzer\n")
			f.write(f"; ROM: {self.rom_path.name}\n\n")

			# VBlank handler
			if self.vblank_code:
				f.write("; VBlank interrupt handler\n")
				f.write(f"vblank_handler:\t\t; ${self.vblank_code['address']:04X}\n")
				for inst in self.vblank_code["instructions"]:
					f.write(f"\t{inst['full'].lower():<20} ; {inst['description']}\n")
				f.write("\n")

			# Input handlers
			for i, handler in enumerate(self.input_handlers):
				f.write(f"; Input handler {i + 1}\n")
				f.write(f"{handler.name}:\t\t; ${handler.address:04X}\n")
				for inst in handler.instructions[:20]:	# First 20 instructions
					f.write(f"\t{inst['full'].lower():<20} ; {inst['description']}\n")
				if len(handler.instructions) > 20:
					f.write(f"\t; ... ({len(handler.instructions) - 20} more instructions)\n")
				f.write("\n")

		# Comprehensive documentation
		with open(doc_file, "w", encoding="utf-8") as f:
			f.write("# Dragon Quest III - Game Loop Analysis\n\n")

			f.write("## Analysis Summary\n")
			f.write(f"- **ROM:** {self.rom_path.name}\n")
			f.write(f"- **Analysis Date:** {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
			f.write(f"- **Input Handlers Found:** {len(self.input_handlers)}\n")
			f.write(f"- **State Transitions:** {len(self.state_transitions)}\n")
			f.write(f"- **VBlank Handler:** {'✅ Found' if self.vblank_code else '❌ Not found'}\n\n")

			# VBlank Analysis
			if self.vblank_code:
				f.write("## VBlank Interrupt Handler\n")
				f.write(f"- **Address:** ${self.vblank_code['address']:04X}\n")
				f.write(f"- **Size:** {self.vblank_code['size']} bytes\n")
				f.write(f"- **Confidence Score:** {self.vblank_code['score']}/100\n\n")

				f.write("### VBlank Operations\n")
				for inst in self.vblank_code["instructions"]:
					if "PPU" in inst["description"] or "DMA" in inst["description"]:
						f.write(f"- `{inst['full']}` - {inst['description']}\n")
				f.write("\n")

			# Input System Analysis
			f.write("## Input Handling System\n\n")
			for handler in self.input_handlers:
				f.write(f"### {handler.name}\n")
				f.write(f"- **Address:** ${handler.address:04X}\n")
				f.write(f"- **Purpose:** {handler.purpose}\n")
				f.write(f"- **Size:** {handler.size} bytes\n")
				f.write(f"- **Complexity:** {handler.complexity_score}\n\n")

			# State Management
			f.write("## State Management System\n\n")
			if self.state_transitions:
				f.write("### State Transitions\n")
				f.write("| From State | Condition | Target Address | Description |\n")
				f.write("|------------|-----------|----------------|-------------|\n")

				for transition in self.state_transitions[:20]:	# First 20
					f.write(
						f"| {transition.from_state} | {transition.condition} | ${transition.trigger_address:04X} | {transition.description} |\n"
					)

				if len(self.state_transitions) > 20:
					f.write(f"\n*...and {len(self.state_transitions) - 20} more transitions*\n")
			else:
				f.write("No clear state management patterns identified.\n")

			f.write("\n## Technical Notes\n")
			f.write("- Game loop analysis performed using pattern recognition\n")
			f.write("- VBlank handler identified through PPU operation analysis\n")
			f.write("- Input handlers located via controller port access patterns\n")
			f.write("- State transitions found through compare-and-branch analysis\n")

		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		return asm_file, doc_file

	def run_complete_analysis(self, output_dir: str):
		"""Run complete game loop analysis"""
		print("🔥 Starting Game Loop Analysis")
		print("=" * 50)

		# Find main components
		main_loop = self.find_main_game_loop()
		vblank = self.find_vblank_handler()
		input_handlers = self.find_input_handling_system()
		state_transitions = self.analyze_state_management()

		# Generate comprehensive documentation
		asm_file, doc_file = self.generate_game_loop_analysis(output_dir)

		print(f"\n🎯 Game Loop Analysis Complete!")
		print(f"	 Main loop: {'✅ Found' if main_loop else '❌ Not found'}")
		print(f"	 VBlank handler: {'✅ Found' if vblank else '❌ Not found'}")
		print(f"	 Input handlers: {len(input_handlers)} found")
		print(f"	 State transitions: {len(state_transitions)} found")
		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")


def main():
	"""Main entry point for game loop analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/analysis/game_loop"

	print("🕹️ Dragon Quest III - Game Loop Analysis")
	print("=" * 60)

	analyzer = DQ3GameLoopAnalyzer(rom_path)
	analyzer.run_complete_analysis(output_dir)


if __name__ == "__main__":
	main()
