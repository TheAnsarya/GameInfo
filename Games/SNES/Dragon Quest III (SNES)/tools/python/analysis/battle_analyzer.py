#!/usr/bin/env python3
"""
Dragon Quest III - Battle System Analysis & Disassembly
=======================================================

Comprehensive analysis of battle initialization, combat calculations,
spell system, monster AI, status effects, and battle state management.
"""

import struct
import time
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
from dataclasses import dataclass
import json
import math


@dataclass
class BattleFunction:
	"""Represents a battle system function"""

	name: str
	address: int
	size: int
	purpose: str
	battle_phase: str	# "init", "calculation", "ai", "animation", "cleanup"
	complexity_score: int
	math_operations: List[str]
	instructions: List[Dict]


@dataclass
class SpellData:
	"""Represents spell/magic data structure"""

	spell_id: int
	name: str
	address: int
	mp_cost: int
	power: int
	target_type: str	# "single", "group", "all_enemies", "self"
	element: str
	effect_function: int


@dataclass
class MonsterAI:
	"""Represents monster AI behavior"""

	monster_id: int
	address: int
	behavior_patterns: List[str]
	spell_list: List[int]
	ai_complexity: int
	decision_tree_size: int


@dataclass
class CombatFormula:
	"""Represents a combat calculation formula"""

	name: str
	address: int
	formula_type: str	# "damage", "accuracy", "defense", "magic"
	variables_used: List[str]
	mathematical_operations: List[str]
	constants: List[int]


class DQ3BattleAnalyzer:
	"""Advanced battle system analyzer"""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)

		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

		self.rom_size = len(self.rom_data)
		self.battle_functions = []
		self.spell_data = []
		self.monster_ai = []
		self.combat_formulas = []
		self.damage_tables = []
		self.status_effects = []

		# Battle system patterns to look for
		self.battle_patterns = {
			"damage_calculation": [0xa5, 0x85, 0x18, 0x65],	# LDA, STA, CLC, ADC
			"multiplication": [0x8d, 0xea, 0xea, 0x4a],	# STA, NOP, NOP, LSR
			"rng_calls": [0x20, 0x00, 0x80],	# JSR $8000 (common RNG)
			"hp_manipulation": [0xa5, 0x38, 0xe5],	# LDA, SEC, SBC
			"status_checks": [0x29, 0x01, 0xf0],	# AND #$01, BEQ
		}

		# Dragon Quest III specific addresses (common patterns)
		self.dq3_addresses = {
			"player_stats": 0x7e0000,
			"monster_stats": 0x7e1000,
			"battle_vars": 0x7e2000,
			"spell_data_table": 0x8c0000,	# Estimated
			"monster_ai_table": 0x8d0000,	# Estimated
			"damage_table": 0x8e0000,	# Estimated
		}

		print(f"⚔️ Battle System Analyzer initialized")
		print(f"	 ROM: {self.rom_path}")
		print(f"	 Size: {self.rom_size:,} bytes")

	def find_battle_functions(self) -> List[BattleFunction]:
		"""Find all battle-related functions"""
		print("\n⚔️ Searching for battle functions...")

		battle_functions = []

		# Search for battle system patterns
		for offset in range(0, len(self.rom_data) - 100):
			# Look for damage calculation patterns
			if self._matches_pattern(
				offset, self.battle_patterns["damage_calculation"]
			):
				func_start = self._find_function_start(offset)
				func_end = self._find_function_end(offset)

				if func_start and func_end and func_end > func_start:
					func_addr = 0x8000 + (func_start % 0x8000)

					# Check if already found
					if not any(f.address == func_addr for f in battle_functions):
						# Disassemble and analyze
						func_code = self.disassemble_region(
							func_start, func_end - func_start
						)
						math_ops = self._find_math_operations(func_code)
						purpose = self._classify_battle_function(func_code, math_ops)

						battle_func = BattleFunction(
							name=f"battle_func_{func_addr:04X}",
							address=func_addr,
							size=func_end - func_start,
							purpose=purpose,
							battle_phase=self._determine_battle_phase(purpose),
							complexity_score=len(math_ops) * 5 + len(func_code),
							math_operations=math_ops,
							instructions=func_code,
						)

						battle_functions.append(battle_func)

		# Look for RNG-based functions (critical for battle calculations)
		rng_functions = self._find_rng_functions()
		battle_functions.extend(rng_functions)

		# Look for HP/MP manipulation functions
		hp_functions = self._find_hp_manipulation_functions()
		battle_functions.extend(hp_functions)

		print(f"	 Found {len(battle_functions)} battle functions")

		self.battle_functions = battle_functions
		return battle_functions

	def analyze_spell_system(self) -> List[SpellData]:
		"""Analyze the magic/spell system"""
		print("\n🔮 Analyzing spell system...")

		spell_data = []

		# Look for spell data tables
		spell_table_candidates = self._find_spell_data_tables()

		for table_addr in spell_table_candidates:
			rom_offset = self._snes_to_rom_address(table_addr)
			if rom_offset > 0 and rom_offset < len(self.rom_data) - 100:
				print(f"	 Analyzing spell table at ${table_addr:06X}")

				# Parse spell entries (estimated structure)
				for i in range(0, 64):	# Assume up to 64 spells
					spell_offset = rom_offset + (i * 8)	# 8 bytes per spell
					if spell_offset + 8 >= len(self.rom_data):
						break

					spell_bytes = self.rom_data[spell_offset : spell_offset + 8]

					# Parse spell data (reverse engineered structure)
					spell_info = SpellData(
						spell_id=i,
						name=f"Spell_{i:02X}",
						address=table_addr + (i * 8),
						mp_cost=spell_bytes[0] if spell_bytes[0] < 100 else 0,
						power=spell_bytes[1] if spell_bytes[1] < 255 else 0,
						target_type=self._decode_target_type(spell_bytes[2]),
						element=self._decode_element(spell_bytes[3]),
						effect_function=struct.unpack("<H", spell_bytes[4:6])[0],
					)

					# Only add if it looks like valid spell data
					if spell_info.mp_cost > 0 and spell_info.power > 0:
						spell_data.append(spell_info)

		print(f"	 Identified {len(spell_data)} spells")

		self.spell_data = spell_data
		return spell_data

	def analyze_monster_ai(self) -> List[MonsterAI]:
		"""Analyze monster AI behavior patterns"""
		print("\n🐉 Analyzing monster AI...")

		monster_ai = []

		# Find AI decision trees
		ai_functions = []
		for func in self.battle_functions:
			if "ai" in func.purpose.lower() or "decision" in func.purpose.lower():
				ai_functions.append(func)

		# Look for monster data tables
		monster_table_candidates = self._find_monster_data_tables()

		for table_addr in monster_table_candidates:
			rom_offset = self._snes_to_rom_address(table_addr)
			if rom_offset > 0 and rom_offset < len(self.rom_data) - 200:
				print(f"	 Analyzing monster table at ${table_addr:06X}")

				# Parse monster entries
				for i in range(0, 128):	# Assume up to 128 monsters
					monster_offset = rom_offset + (i * 16)	# 16 bytes per monster
					if monster_offset + 16 >= len(self.rom_data):
						break

					monster_bytes = self.rom_data[monster_offset : monster_offset + 16]

					# Look for AI pointer
					ai_ptr = struct.unpack("<H", monster_bytes[14:16])[0]
					if 0x8000 <= ai_ptr <= 0xffff:
						# Analyze AI behavior
						ai_rom_offset = self._snes_to_rom_address(ai_ptr)
						if ai_rom_offset > 0:
							ai_code = self.disassemble_region(ai_rom_offset, 200)
							behavior_patterns = self._analyze_ai_behavior(ai_code)

							ai_info = MonsterAI(
								monster_id=i,
								address=ai_ptr,
								behavior_patterns=behavior_patterns,
								spell_list=self._extract_spell_list(ai_code),
								ai_complexity=len(behavior_patterns) * 10,
								decision_tree_size=len(ai_code),
							)

							monster_ai.append(ai_info)

		print(f"	 Found {len(monster_ai)} monster AI patterns")

		self.monster_ai = monster_ai
		return monster_ai

	def analyze_combat_formulas(self) -> List[CombatFormula]:
		"""Analyze damage calculation and combat formulas"""
		print("\n🧮 Analyzing combat formulas...")

		combat_formulas = []

		# Look for mathematical operations in battle functions
		for func in self.battle_functions:
			if any(op in func.math_operations for op in ["MUL", "DIV", "ADD", "SUB"]):
				print(f"	 Analyzing formula in: {func.name}")

				# Analyze the mathematical structure
				variables = self._extract_variables_from_function(func)
				constants = self._extract_constants_from_function(func)

				formula = CombatFormula(
					name=func.name + "_formula",
					address=func.address,
					formula_type=self._classify_formula_type(func),
					variables_used=variables,
					mathematical_operations=func.math_operations,
					constants=constants,
				)

				combat_formulas.append(formula)

		# Look for specific damage calculation patterns
		damage_formulas = self._find_damage_calculation_formulas()
		combat_formulas.extend(damage_formulas)

		print(f"	 Identified {len(combat_formulas)} combat formulas")

		self.combat_formulas = combat_formulas
		return combat_formulas

	def analyze_status_effects(self) -> List[Dict]:
		"""Analyze status effect system"""
		print("\n✨ Analyzing status effects...")

		status_effects = []

		# Look for status effect bit manipulation
		for func in self.battle_functions:
			for inst in func.instructions:
				# Look for bit operations (status effects often use bit flags)
				if inst["name"] in ["AND", "ORA", "EOR"] and inst.get(
					"operand", ""
				).startswith(" #$"):
					try:
						bit_value = int(inst["operand"].replace(" #$", ""), 16)
						if bit_value in [
							0x01,
							0x02,
							0x04,
							0x08,
							0x10,
							0x20,
							0x40,
							0x80,
						]:
							status_effect = {
								"function": func.name,
								"address": func.address,
								"bit_flag": bit_value,
								"operation": inst["name"],
								"effect_type": self._classify_status_effect(
									bit_value, inst["name"]
								),
							}
							status_effects.append(status_effect)
					except:
						pass

		print(f"	 Found {len(status_effects)} status effect operations")

		self.status_effects = status_effects
		return status_effects

	def _matches_pattern(self, offset: int, pattern: List[int]) -> bool:
		"""Check if bytes at offset match a pattern"""
		if offset + len(pattern) >= len(self.rom_data):
			return False

		for i, byte_val in enumerate(pattern):
			if self.rom_data[offset + i] != byte_val:
				return False

		return True

	def _find_function_start(self, offset: int) -> Optional[int]:
		"""Find the start of a function containing the given offset"""
		search_start = max(0, offset - 1000)

		for i in range(offset, search_start, -1):
			# Look for function entry patterns
			if i >= 3 and self.rom_data[i - 3 : i] == b"\x20\x00\x80":	# JSR $8000
				return i
			if i >= 0 and self.rom_data[i] in [0x48, 0xda, 0x5a]:	# Function prologue
				return i

		return search_start

	def _find_function_end(self, offset: int) -> Optional[int]:
		"""Find the end of a function containing the given offset"""
		search_end = min(len(self.rom_data), offset + 1000)

		for i in range(offset, search_end):
			if i < len(self.rom_data) and self.rom_data[i] in [
				0x60,
				0x6b,
				0x40,
			]:	# RTS, RTL, RTI
				return i + 1

		return search_end

	def _find_math_operations(self, instructions: List[Dict]) -> List[str]:
		"""Find mathematical operations in instruction list"""
		math_ops = []

		for i, inst in enumerate(instructions):
			if inst["name"] in ["CLC", "SEC"]:
				# Look for following ADD/SUB
				if i + 1 < len(instructions):
					next_inst = instructions[i + 1]
					if next_inst["name"] in ["ADC", "SBC"]:
						math_ops.append("ADD" if inst["name"] == "CLC" else "SUB")

			elif inst["name"] in ["ASL", "LSR"]:
				math_ops.append("SHIFT")

			# Look for multiplication patterns (repeated addition)
			elif inst["name"] == "JSR":
				if "mult" in inst.get("operand", "").lower():
					math_ops.append("MUL")

		return list(set(math_ops))

	def _classify_battle_function(
		self, instructions: List[Dict], math_ops: List[str]
	) -> str:
		"""Classify the purpose of a battle function"""
		inst_names = [inst["name"] for inst in instructions]

		if "MUL" in math_ops or "SHIFT" in math_ops:
			return "Damage calculation"
		elif any(name in inst_names for name in ["CMP", "BCS", "BCC"]):
			return "Accuracy/hit calculation"
		elif "RNG" in str(instructions):
			return "Random number generation"
		elif any("HP" in str(inst) for inst in instructions):
			return "HP manipulation"
		elif any("MP" in str(inst) for inst in instructions):
			return "MP manipulation"
		else:
			return "General battle logic"

	def _determine_battle_phase(self, purpose: str) -> str:
		"""Determine which battle phase a function belongs to"""
		if "calculation" in purpose.lower():
			return "calculation"
		elif "init" in purpose.lower():
			return "init"
		elif "ai" in purpose.lower():
			return "ai"
		elif "animation" in purpose.lower():
			return "animation"
		else:
			return "general"

	def _find_rng_functions(self) -> List[BattleFunction]:
		"""Find random number generation functions"""
		rng_functions = []

		# Look for common RNG patterns
		for offset in range(0, len(self.rom_data) - 20):
			# Look for linear congruential generator pattern
			if (
				self.rom_data[offset] == 0xa5	# LDA
				and self.rom_data[offset + 2] == 0x0a	# ASL
				and self.rom_data[offset + 3] == 0x85
			):	# STA

				func_start = self._find_function_start(offset)
				func_end = self._find_function_end(offset)

				if func_start and func_end:
					func_addr = 0x8000 + (func_start % 0x8000)
					func_code = self.disassemble_region(
						func_start, func_end - func_start
					)

					rng_func = BattleFunction(
						name=f"rng_func_{func_addr:04X}",
						address=func_addr,
						size=func_end - func_start,
						purpose="Random number generation",
						battle_phase="calculation",
						complexity_score=50,
						math_operations=["SHIFT", "ADD"],
						instructions=func_code,
					)

					rng_functions.append(rng_func)

		return rng_functions

	def _find_hp_manipulation_functions(self) -> List[BattleFunction]:
		"""Find HP/MP manipulation functions"""
		hp_functions = []

		# Look for HP manipulation patterns
		for offset in range(0, len(self.rom_data) - 10):
			if self._matches_pattern(offset, self.battle_patterns["hp_manipulation"]):
				func_start = self._find_function_start(offset)
				func_end = self._find_function_end(offset)

				if func_start and func_end:
					func_addr = 0x8000 + (func_start % 0x8000)
					func_code = self.disassemble_region(
						func_start, func_end - func_start
					)

					hp_func = BattleFunction(
						name=f"hp_func_{func_addr:04X}",
						address=func_addr,
						size=func_end - func_start,
						purpose="HP/MP manipulation",
						battle_phase="calculation",
						complexity_score=30,
						math_operations=["SUB", "ADD"],
						instructions=func_code,
					)

					hp_functions.append(hp_func)

		return hp_functions

	def _find_spell_data_tables(self) -> List[int]:
		"""Find spell data table addresses"""
		candidates = []

		# Look for structured data that might be spell tables
		for offset in range(0x8000, len(self.rom_data) - 1000, 0x100):
			if self._looks_like_spell_table(offset):
				addr = 0x8000 + (offset % 0x8000)
				candidates.append(addr)

		return candidates

	def _looks_like_spell_table(self, offset: int) -> bool:
		"""Check if data looks like a spell table"""
		if offset + 64 >= len(self.rom_data):
			return False

		data = self.rom_data[offset : offset + 64]

		# Look for patterns consistent with spell data
		# MP costs should be reasonable (1-99)
		mp_costs = data[::8]	# Every 8th byte
		if all(1 <= cost <= 99 for cost in mp_costs[:8]):
			return True

		return False

	def _decode_target_type(self, byte_val: int) -> str:
		"""Decode spell target type from byte"""
		target_types = {
			0x00: "single",
			0x01: "group",
			0x02: "all_enemies",
			0x03: "self",
			0x04: "all_allies",
		}
		return target_types.get(byte_val, "unknown")

	def _decode_element(self, byte_val: int) -> str:
		"""Decode spell element from byte"""
		elements = {
			0x00: "neutral",
			0x01: "fire",
			0x02: "ice",
			0x03: "thunder",
			0x04: "earth",
			0x05: "wind",
			0x06: "holy",
			0x07: "dark",
		}
		return elements.get(byte_val, "unknown")

	def _find_monster_data_tables(self) -> List[int]:
		"""Find monster data table addresses"""
		candidates = []

		# Look for monster stats tables
		for offset in range(0x80000, len(self.rom_data) - 2000, 0x1000):
			if self._looks_like_monster_table(offset):
				addr = 0x8000 + (offset % 0x8000)
				candidates.append(addr)

		return candidates

	def _looks_like_monster_table(self, offset: int) -> bool:
		"""Check if data looks like a monster table"""
		if offset + 256 >= len(self.rom_data):
			return False

		data = self.rom_data[offset : offset + 256]

		# Monster stats should have reasonable HP values
		hp_values = [struct.unpack("<H", data[i : i + 2])[0] for i in range(0, 32, 16)]
		if all(10 <= hp <= 9999 for hp in hp_values if hp > 0):
			return True

		return False

	def _analyze_ai_behavior(self, instructions: List[Dict]) -> List[str]:
		"""Analyze AI behavior patterns from code"""
		patterns = []

		inst_names = [inst["name"] for inst in instructions]

		if "CMP" in inst_names and "BCS" in inst_names:
			patterns.append("Conditional decision making")

		if any("magic" in str(inst).lower() for inst in instructions):
			patterns.append("Magic casting")

		if any("attack" in str(inst).lower() for inst in instructions):
			patterns.append("Physical attacks")

		if "JSR" in inst_names:
			patterns.append("Complex behavior subroutines")

		return patterns

	def _extract_spell_list(self, instructions: List[Dict]) -> List[int]:
		"""Extract spell IDs from AI code"""
		spell_ids = []

		for inst in instructions:
			if inst["name"] == "LDA" and inst.get("operand", "").startswith(" #$"):
				try:
					value = int(inst["operand"].replace(" #$", ""), 16)
					if 0 <= value <= 63:	# Reasonable spell ID range
						spell_ids.append(value)
				except:
					pass

		return list(set(spell_ids))

	def _extract_variables_from_function(self, func: BattleFunction) -> List[str]:
		"""Extract variables used in a function"""
		variables = set()

		for inst in func.instructions:
			if inst["name"] in ["LDA", "STA"] and inst.get("operand", "").startswith(
				" $"
			):
				addr_str = inst["operand"].replace(" $", "")
				try:
					addr = int(addr_str, 16)
					if 0x7e0000 <= addr <= 0x7effff:	# RAM addresses
						variables.add(f"RAM_{addr:06X}")
				except:
					pass

		return list(variables)

	def _extract_constants_from_function(self, func: BattleFunction) -> List[int]:
		"""Extract constants used in a function"""
		constants = set()

		for inst in func.instructions:
			if inst["name"] in ["LDA", "CMP"] and inst.get("operand", "").startswith(
				" #$"
			):
				try:
					value = int(inst["operand"].replace(" #$", ""), 16)
					if value > 1:	# Ignore trivial constants
						constants.add(value)
				except:
					pass

		return list(constants)

	def _classify_formula_type(self, func: BattleFunction) -> str:
		"""Classify the type of formula in a function"""
		if "damage" in func.purpose.lower():
			return "damage"
		elif "accuracy" in func.purpose.lower():
			return "accuracy"
		elif "defense" in func.purpose.lower():
			return "defense"
		elif any(op in func.math_operations for op in ["MUL", "SHIFT"]):
			return "multiplication_based"
		else:
			return "general"

	def _find_damage_calculation_formulas(self) -> List[CombatFormula]:
		"""Find specific damage calculation formulas"""
		damage_formulas = []

		# Look for classic RPG damage formula patterns
		for offset in range(0, len(self.rom_data) - 50):
			# Look for Attack * 2 - Defense type calculations
			if (
				self.rom_data[offset] == 0x0a	# ASL (multiply by 2)
				and self.rom_data[offset + 1] == 0x38	# SEC
				and self.rom_data[offset + 2] == 0xe5
			):	# SBC (subtract)

				func_start = self._find_function_start(offset)
				if func_start:
					func_code = self.disassemble_region(func_start, 100)

					formula = CombatFormula(
						name=f"damage_formula_{func_start:04X}",
						address=0x8000 + (func_start % 0x8000),
						formula_type="damage",
						variables_used=["attack", "defense"],
						mathematical_operations=["MUL", "SUB"],
						constants=[2],
					)

					damage_formulas.append(formula)

		return damage_formulas

	def _classify_status_effect(self, bit_flag: int, operation: str) -> str:
		"""Classify status effect based on bit flag and operation"""
		status_map = {
			0x01: "poison",
			0x02: "paralysis",
			0x04: "sleep",
			0x08: "confusion",
			0x10: "charm",
			0x20: "silence",
			0x40: "curse",
			0x80: "death",
		}

		effect_name = status_map.get(bit_flag, "unknown")

		if operation == "ORA":
			return f"apply_{effect_name}"
		elif operation == "AND":
			return f"remove_{effect_name}"
		elif operation == "EOR":
			return f"toggle_{effect_name}"
		else:
			return f"check_{effect_name}"

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

	def disassemble_region(self, start_offset: int, size: int) -> List[Dict]:
		"""Disassemble a region of code"""
		instructions = []
		offset = start_offset
		end_offset = min(start_offset + size, len(self.rom_data))

		# Enhanced 65816 opcodes for battle analysis
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
			0x18: ("CLC", 1),
			0x38: ("SEC", 1),
			0x65: ("ADC", 2),
			0xe5: ("SBC", 2),
			0x0a: ("ASL", 1),
			0x4a: ("LSR", 1),
			0x29: ("AND", 2),
			0x09: ("ORA", 2),
			0x49: ("EOR", 2),
			0xc9: ("CMP", 2),
			0xb0: ("BCS", 2),
			0x90: ("BCC", 2),
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
					operand = ""
				elif length == 2:
					operand_val = operand_bytes[0] if operand_bytes else 0
					operand = f" #${operand_val:02X}"
					full_instruction = f"{name} #${operand_val:02X}"
				elif length == 3:
					if len(operand_bytes) >= 2:
						operand_val = struct.unpack("<H", operand_bytes[:2])[0]
					else:
						operand_val = 0
					operand = f" ${operand_val:04X}"
					full_instruction = f"{name} ${operand_val:04X}"
				else:
					operand = ""
					full_instruction = name

				instruction = {
					"offset": offset,
					"name": name,
					"operand": operand,
					"full": full_instruction,
				}

				instructions.append(instruction)
				offset += length

				if opcode == 0x60:	# RTS
					break
			else:
				offset += 1

		return instructions

	def generate_battle_analysis(self, output_dir: str):
		"""Generate comprehensive battle system documentation"""
		output_path = Path(output_dir)
		output_path.mkdir(parents=True, exist_ok=True)

		print(f"\n📝 Generating battle analysis...")

		# Assembly file
		asm_file = output_path / "battle_system.asm"
		doc_file = output_path / "battle_analysis.md"
		data_file = output_path / "battle_data.json"
		formulas_file = output_path / "combat_formulas.md"

		# Generate assembly
		with open(asm_file, "w") as f:
			f.write("; Dragon Quest III - Battle System Disassembly\n")
			f.write("; Generated by Battle System Analyzer\n\n")

			for func in self.battle_functions:
				f.write(f"; {func.purpose} ({func.battle_phase} phase)\n")
				f.write(f"{func.name}:\t\t; ${func.address:04X}\n")
				for inst in func.instructions[:20]:	# First 20 instructions
					f.write(f"\t{inst['full'].lower():<20}\n")
				if len(func.instructions) > 20:
					f.write(
						f"\t; ... ({len(func.instructions) - 20} more instructions)\n"
					)
				f.write("\n")

		# Generate documentation
		with open(doc_file, "w", encoding="utf-8") as f:
			f.write("# Dragon Quest III - Battle System Analysis\n\n")
			f.write(f"## Analysis Summary\n")
			f.write(f"- **ROM:** {self.rom_path.name}\n")
			f.write(f"- **Battle Functions:** {len(self.battle_functions)}\n")
			f.write(f"- **Spells Identified:** {len(self.spell_data)}\n")
			f.write(f"- **Monster AI Patterns:** {len(self.monster_ai)}\n")
			f.write(f"- **Combat Formulas:** {len(self.combat_formulas)}\n")
			f.write(f"- **Status Effects:** {len(self.status_effects)}\n\n")

			f.write("## Battle Functions\n\n")
			for func in self.battle_functions:
				f.write(f"### {func.name}\n")
				f.write(f"- **Address:** ${func.address:04X}\n")
				f.write(f"- **Purpose:** {func.purpose}\n")
				f.write(f"- **Battle Phase:** {func.battle_phase}\n")
				f.write(f"- **Complexity:** {func.complexity_score}\n")
				f.write(f"- **Math Operations:** {', '.join(func.math_operations)}\n\n")

			if self.spell_data:
				f.write("## Spell System\n\n")
				f.write("| ID | Name | MP Cost | Power | Target | Element |\n")
				f.write("|----|------|---------|-------|--------|----------|\n")
				for spell in self.spell_data[:20]:	# First 20 spells
					f.write(
						f"| {spell.spell_id:02X} | {spell.name} | {spell.mp_cost} | {spell.power} | {spell.target_type} | {spell.element} |\n"
					)

			if self.monster_ai:
				f.write("\n## Monster AI Patterns\n\n")
				for ai in self.monster_ai[:10]:	# First 10 monsters
					f.write(f"### Monster {ai.monster_id:02X}\n")
					f.write(f"- **AI Address:** ${ai.address:04X}\n")
					f.write(f"- **Behaviors:** {', '.join(ai.behavior_patterns)}\n")
					f.write(f"- **Spell List:** {ai.spell_list}\n")
					f.write(f"- **Complexity:** {ai.ai_complexity}\n\n")

		# Generate formulas documentation
		with open(formulas_file, "w", encoding="utf-8") as f:
			f.write("# Dragon Quest III - Combat Formulas\n\n")

			for formula in self.combat_formulas:
				f.write(f"## {formula.name}\n")
				f.write(f"- **Address:** ${formula.address:04X}\n")
				f.write(f"- **Type:** {formula.formula_type}\n")
				f.write(f"- **Variables:** {', '.join(formula.variables_used)}\n")
				f.write(
					f"- **Operations:** {', '.join(formula.mathematical_operations)}\n"
				)
				f.write(f"- **Constants:** {formula.constants}\n\n")

		# Generate JSON data
		analysis_data = {
			"battle_functions": [
				{
					"name": func.name,
					"address": func.address,
					"purpose": func.purpose,
					"battle_phase": func.battle_phase,
					"complexity": func.complexity_score,
					"math_operations": func.math_operations,
				}
				for func in self.battle_functions
			],
			"spells": [
				{
					"id": spell.spell_id,
					"name": spell.name,
					"mp_cost": spell.mp_cost,
					"power": spell.power,
					"target_type": spell.target_type,
					"element": spell.element,
				}
				for spell in self.spell_data
			],
			"monster_ai": [
				{
					"monster_id": ai.monster_id,
					"address": ai.address,
					"behaviors": ai.behavior_patterns,
					"spells": ai.spell_list,
				}
				for ai in self.monster_ai
			],
			"combat_formulas": [
				{
					"name": formula.name,
					"type": formula.formula_type,
					"variables": formula.variables_used,
					"operations": formula.mathematical_operations,
				}
				for formula in self.combat_formulas
			],
		}

		with open(data_file, "w") as f:
			json.dump(analysis_data, f, indent=2)

		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		print(f"	 Formulas: {formulas_file}")
		print(f"	 Data: {data_file}")

		return asm_file, doc_file, data_file

	def run_complete_analysis(self, output_dir: str):
		"""Run complete battle system analysis"""
		print("⚔️ Starting Battle System Analysis")
		print("=" * 50)

		# Run all analysis components
		battle_functions = self.find_battle_functions()
		spell_data = self.analyze_spell_system()
		monster_ai = self.analyze_monster_ai()
		combat_formulas = self.analyze_combat_formulas()
		status_effects = self.analyze_status_effects()

		# Generate comprehensive documentation
		asm_file, doc_file, data_file = self.generate_battle_analysis(output_dir)

		print(f"\n🎯 Battle System Analysis Complete!")
		print(f"	 Battle functions: {len(battle_functions)}")
		print(f"	 Spells identified: {len(spell_data)}")
		print(f"	 Monster AI patterns: {len(monster_ai)}")
		print(f"	 Combat formulas: {len(combat_formulas)}")
		print(f"	 Status effects: {len(status_effects)}")
		print(f"	 Assembly: {asm_file}")
		print(f"	 Documentation: {doc_file}")
		print(f"	 Analysis data: {data_file}")


def main():
	"""Main entry point for battle analysis"""
	rom_path = "c:/Users/me/source/repos/dq3r-info/static/Dragon Quest III - english (patched).smc"
	output_dir = "c:/Users/me/source/repos/dq3r-info/analysis/battle_system"

	print("⚔️ Dragon Quest III - Battle System Analysis")
	print("=" * 60)

	analyzer = DQ3BattleAnalyzer(rom_path)
	analyzer.run_complete_analysis(output_dir)


if __name__ == "__main__":
	main()
