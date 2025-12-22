#!/usr/bin/env python3
"""
Soul Blazer Symbol Generator
Analyzes disassembly and generates symbol labels for common routines.
"""

import os
import re
from pathlib import Path
from dataclasses import dataclass
from typing import Dict, List, Set, Tuple

@dataclass
class Symbol:
	"""Represents a symbol/label in the code."""
	bank: int
	address: int
	name: str
	category: str = ""
	comment: str = ""

	@property
	def cpu_address(self) -> str:
		return f"${self.bank:02x}:{self.address:04x}"

	@property
	def full_address(self) -> int:
		return (self.bank << 16) | self.address


class SymbolGenerator:
	"""Generates symbol labels by analyzing disassembly."""

	def __init__(self, disasm_dir: str):
		self.disasm_dir = Path(disasm_dir)
		self.symbols: Dict[int, Symbol] = {}  # full_address -> Symbol
		self.call_targets: Dict[int, int] = {}  # address -> call count
		self.jump_targets: Set[int] = set()

	def parse_address(self, addr_str: str) -> Tuple[int, int]:
		"""Parse address string like '$00:8000' into (bank, address)."""
		match = re.match(r'\$([0-9a-f]{2}):([0-9a-f]{4})', addr_str, re.I)
		if match:
			return int(match.group(1), 16), int(match.group(2), 16)
		return 0, 0

	def analyze_file(self, filepath: Path) -> None:
		"""Analyze a single disassembly file for patterns."""
		with open(filepath, 'r', encoding='utf-8') as f:
			lines = f.readlines()

		for line in lines:
			# Look for JSR/JSL/JMP instructions to find call targets
			# JSL $xxxxxx or JSR $xxxx
			match = re.search(r'jsl\s+\$([0-9a-f]{6})', line, re.I)
			if match:
				addr = int(match.group(1), 16)
				self.call_targets[addr] = self.call_targets.get(addr, 0) + 1

			match = re.search(r'jsr\s+\$([0-9a-f]{4})', line, re.I)
			if match:
				addr = int(match.group(1), 16)
				self.call_targets[addr] = self.call_targets.get(addr, 0) + 1

			# Look for jump targets
			match = re.search(r'jmp\s+\$([0-9a-f]{4,6})', line, re.I)
			if match:
				addr = int(match.group(1), 16)
				self.jump_targets.add(addr)

	def analyze_all_files(self) -> None:
		"""Analyze all disassembly files."""
		for asm_file in sorted(self.disasm_dir.glob('bank*.asm')):
			print(f"Analyzing {asm_file.name}...")
			self.analyze_file(asm_file)

	def add_known_symbols(self) -> None:
		"""Add known symbols based on SNES conventions and analysis."""
		# Reset and interrupt vectors (from ROM header analysis)
		self.symbols[0x008000] = Symbol(0, 0x8000, "Reset", "system", "Main reset entry point")
		self.symbols[0x008342] = Symbol(0, 0x8342, "NMI_Handler", "system", "Non-maskable interrupt handler (VBlank)")
		self.symbols[0x0085a5] = Symbol(0, 0x85a5, "IRQ_Handler", "system", "Interrupt request handler")

		# Common subroutine patterns identified from call frequency
		frequent_calls = sorted(self.call_targets.items(), key=lambda x: -x[1])[:100]
		
		# Known/identifiable routines from code analysis
		known_routines = {
			# Bank 00 - Core engine
			0x0085a6: ("ReadJoypad", "input", "Read controller input"),
			0x0085c4: ("ProcessInput", "input", "Process controller state"),
			0x0086ee: ("UpdateSprites", "graphics", "Update OAM sprite data"),
			0x008a34: ("UpdatePlayer", "player", "Update player state"),
			0x008df4: ("UpdateEntities", "entities", "Update entity/actor states"),
			0x00b005: ("UpdateCollision", "collision", "Collision detection"),

			# Bank 02 - Game logic
			0x028000: ("GameLoop_Main", "game", "Main game loop handler"),
			0x028069: ("GameLoop_Update", "game", "Game update routine"),
			0x02810b: ("GameLoop_Render", "game", "Render game state"),
			0x0289d6: ("LoadMap", "map", "Load map data"),
			0x0298fc: ("UpdateMap", "map", "Update map state"),
			0x02985e: ("ProcessEvents", "events", "Process game events"),
			0x029695: ("UpdateNPCs", "npc", "Update NPC states"),
			0x02a659: ("UpdateCamera", "camera", "Update camera/scroll"),
			0x02b1a2: ("WaitVBlank", "system", "Wait for VBlank"),
			0x02b1ae: ("EnableNMI", "system", "Enable NMI/VBlank"),
			0x02b1b7: ("DisableNMI", "system", "Disable NMI/VBlank"),
			0x02b140: ("DelayFrames", "system", "Delay for N frames"),
			0x02b9ac: ("InitHardware", "system", "Initialize SNES hardware"),
			0x02bada: ("InitRAM", "system", "Initialize RAM"),

			# Bank 04 - Additional routines
			0x04f223: ("UpdateAudio", "audio", "Update audio/music"),
			0x04f572: ("LoadGraphics", "graphics", "Load graphics data"),
			0x04f6ee: ("InitGraphics", "graphics", "Initialize graphics"),
			0x04f781: ("UpdatePalette", "graphics", "Update color palette"),
			0x04f912: ("InitSprites", "graphics", "Initialize sprite system"),
		}

		for addr, (name, category, comment) in known_routines.items():
			bank = (addr >> 16) & 0xff
			offset = addr & 0xffff
			self.symbols[addr] = Symbol(bank, offset, name, category, comment)

	def add_auto_labels(self) -> None:
		"""Add auto-generated labels for frequently called routines."""
		# Get addresses already labeled
		labeled = set(self.symbols.keys())

		# Add labels for frequently called but unlabeled addresses
		for addr, count in sorted(self.call_targets.items(), key=lambda x: -x[1]):
			if addr not in labeled and count >= 5:
				bank = (addr >> 16) & 0xff
				offset = addr & 0xffff
				name = f"Sub_{bank:02x}_{offset:04x}"
				self.symbols[addr] = Symbol(bank, offset, name, "auto", f"Called {count} times")

	def generate_symbol_file(self, output_path: Path) -> None:
		"""Generate the symbol file."""
		with open(output_path, 'w', encoding='utf-8') as f:
			f.write("; Soul Blazer Symbol File\n")
			f.write("; Generated by symbol_generator.py\n")
			f.write("; Format: address label  ; comment\n")
			f.write(";\n")
			f.write("; Categories:\n")
			f.write(";   system   - Hardware/system routines\n")
			f.write(";   game     - Main game loop\n")
			f.write(";   player   - Player handling\n")
			f.write(";   entities - Entity/actor system\n")
			f.write(";   graphics - Graphics/rendering\n")
			f.write(";   map      - Map/level handling\n")
			f.write(";   audio    - Sound/music\n")
			f.write(";   input    - Controller input\n")
			f.write(";   npc      - NPC handling\n")
			f.write(";   camera   - Camera/scrolling\n")
			f.write(";   events   - Event processing\n")
			f.write(";   collision - Collision detection\n")
			f.write(";   auto     - Auto-generated labels\n")
			f.write(";\n")
			f.write(";===========================================================\n\n")

			# Group by category
			categories = {}
			for sym in self.symbols.values():
				cat = sym.category or "other"
				if cat not in categories:
					categories[cat] = []
				categories[cat].append(sym)

			# Write each category
			for cat in ["system", "game", "player", "entities", "graphics", "map",
						"audio", "input", "npc", "camera", "events", "collision", "auto", "other"]:
				if cat not in categories:
					continue
				
				f.write(f"; === {cat.upper()} ===\n")
				for sym in sorted(categories[cat], key=lambda s: s.full_address):
					comment = f"  ; {sym.comment}" if sym.comment else ""
					f.write(f"{sym.cpu_address} {sym.name}{comment}\n")
				f.write("\n")

		print(f"Generated symbol file: {output_path}")
		print(f"Total symbols: {len(self.symbols)}")

	def generate_ram_map(self, output_path: Path) -> None:
		"""Generate a RAM map based on memory accesses in the code."""
		ram_addresses: Dict[int, List[str]] = {}

		# Scan for memory access patterns
		for asm_file in sorted(self.disasm_dir.glob('bank*.asm')):
			with open(asm_file, 'r', encoding='utf-8') as f:
				for line in f:
					# Look for direct page / RAM accesses
					# Patterns: lda $xxxx, sta $xxxx, ldx $xxxx, etc.
					match = re.search(r'(lda|sta|ldx|stx|ldy|sty|inc|dec|adc|sbc|and|ora|eor|bit|cmp|cpx|cpy)\s+\$([0-9a-f]{4})', line, re.I)
					if match:
						instr = match.group(1).lower()
						addr = int(match.group(2), 16)
						if 0x0000 <= addr < 0x2000 or 0x7e0000 <= addr <= 0x7fffff:
							if addr not in ram_addresses:
								ram_addresses[addr] = []
							ram_addresses[addr].append(instr)

		# Write RAM map
		with open(output_path, 'w', encoding='utf-8') as f:
			f.write("; Soul Blazer RAM Map\n")
			f.write("; Generated from disassembly analysis\n")
			f.write("; Format: address description (access_count)\n")
			f.write(";\n")

			# Known RAM locations
			known_ram = {
				0x0318: "game_state",
				0x0319: "sub_state",
				0x0323: "temp_flag",
				0x037c: "scroll_x",
				0x037e: "scroll_y",
				0x03a6: "frame_counter",
				0x03e3: "fade_value",
				0x03fb: "game_mode",
				0x03fc: "game_mode_high",
				0x03fd: "previous_state",
				0x03ff: "state_param",
				0x0401: "position_x",
				0x0403: "position_y",
				0x043b: "timer",
				0x0462: "pause_flag",
				0x1b8a: "player_hp",
				0x1c6a: "current_area",
			}

			f.write("; === KNOWN RAM ADDRESSES ===\n")
			for addr in sorted(known_ram.keys()):
				count = len(ram_addresses.get(addr, []))
				f.write(f"${addr:04x} {known_ram[addr]} ; accessed {count} times\n")
			f.write("\n")

			f.write("; === FREQUENTLY ACCESSED ===\n")
			frequent = [(addr, accesses) for addr, accesses in ram_addresses.items()
						if len(accesses) >= 10 and addr not in known_ram]
			for addr, accesses in sorted(frequent, key=lambda x: -len(x[1]))[:50]:
				f.write(f"${addr:04x} ram_{addr:04x} ; accessed {len(accesses)} times\n")

		print(f"Generated RAM map: {output_path}")


def main():
	import sys

	# Default paths
	script_dir = Path(__file__).parent
	disasm_dir = script_dir.parent / "disasm"
	
	if len(sys.argv) > 1:
		disasm_dir = Path(sys.argv[1])

	if not disasm_dir.exists():
		print(f"Error: Disassembly directory not found: {disasm_dir}")
		sys.exit(1)

	generator = SymbolGenerator(str(disasm_dir))
	
	print("Analyzing disassembly files...")
	generator.analyze_all_files()
	
	print(f"\nFound {len(generator.call_targets)} unique call targets")
	print(f"Found {len(generator.jump_targets)} unique jump targets")
	
	print("\nAdding known symbols...")
	generator.add_known_symbols()
	
	print("Adding auto-generated labels...")
	generator.add_auto_labels()
	
	# Generate outputs
	generator.generate_symbol_file(disasm_dir / "soul_blazer.sym")
	generator.generate_ram_map(disasm_dir / "soul_blazer_ram.map")

	# Print top called routines
	print("\nTop 20 most called routines:")
	for addr, count in sorted(generator.call_targets.items(), key=lambda x: -x[1])[:20]:
		bank = (addr >> 16) & 0xff
		offset = addr & 0xffff
		sym = generator.symbols.get(addr)
		name = sym.name if sym else "unlabeled"
		print(f"  ${bank:02x}:{offset:04x} - {count:4d} calls - {name}")


if __name__ == "__main__":
	main()
