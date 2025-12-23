#!/usr/bin/env python3
"""
Soul Blazer - Event Script Decoder
Decodes and analyzes event scripts from the ROM.
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from typing import List, Optional, Dict, Tuple
from enum import IntEnum


class EventOpcode(IntEnum):
	"""Event script opcodes."""
	END = 0x00
	NOP = 0x01
	WAIT = 0x02
	WAIT_BUTTON = 0x03
	JUMP = 0x04
	JUMP_IF = 0x05
	CALL = 0x06
	RETURN = 0x07
	SET_FLAG = 0x08
	CLEAR_FLAG = 0x09
	CHECK_FLAG = 0x0A
	SET_VAR = 0x0B
	ADD_VAR = 0x0C
	SUB_VAR = 0x0D
	COMPARE_VAR = 0x0E
	TEXT_BOX = 0x10
	SHOW_TEXT = 0x11
	CLEAR_TEXT = 0x12
	CHOICE = 0x13
	NPC_SPAWN = 0x20
	NPC_MOVE = 0x21
	NPC_FACE = 0x22
	NPC_ANIM = 0x23
	NPC_HIDE = 0x24
	NPC_SHOW = 0x25
	PLAYER_MOVE = 0x30
	PLAYER_FACE = 0x31
	PLAYER_FREEZE = 0x32
	PLAYER_UNFREEZE = 0x33
	PLAYER_HEAL = 0x34
	PLAYER_DAMAGE = 0x35
	GIVE_ITEM = 0x40
	TAKE_ITEM = 0x41
	CHECK_ITEM = 0x42
	GIVE_GOLD = 0x43
	TAKE_GOLD = 0x44
	GIVE_EXP = 0x45
	SOUL_RELEASE = 0x50
	LAIR_CLEAR = 0x51
	BOSS_START = 0x52
	BOSS_END = 0x53
	WARP = 0x60
	FADE_OUT = 0x61
	FADE_IN = 0x62
	SCREEN_SHAKE = 0x63
	PLAY_MUSIC = 0x70
	PLAY_SFX = 0x71
	STOP_MUSIC = 0x72
	CAMERA_LOCK = 0x80
	CAMERA_UNLOCK = 0x81
	CAMERA_PAN = 0x82
	CAMERA_FOCUS = 0x83
	SAVE_GAME = 0xF0
	LOAD_GAME = 0xF1
	CREDITS = 0xFE
	UNKNOWN = 0xFF


@dataclass
class EventInstruction:
	"""A single event script instruction."""
	offset: int
	opcode: int
	opcode_name: str
	params: List[int]
	size: int
	description: str


@dataclass
class EventScript:
	"""A complete event script."""
	id: int
	name: str
	offset: int
	size: int
	instructions: List[EventInstruction]
	flags_used: List[int] = field(default_factory=list)
	targets: List[int] = field(default_factory=list)


@dataclass
class KnownScript:
	"""Known script location."""
	id: int
	name: str
	offset: int
	area: str
	description: str


class EventScriptDecoder:
	"""Decodes Soul Blazer event scripts."""

	# Opcode parameter counts
	OPCODE_PARAMS = {
		EventOpcode.END: 0,
		EventOpcode.NOP: 0,
		EventOpcode.WAIT: 1,         # frames
		EventOpcode.WAIT_BUTTON: 0,
		EventOpcode.JUMP: 2,         # address (16-bit)
		EventOpcode.JUMP_IF: 3,      # flag, address
		EventOpcode.CALL: 2,         # address
		EventOpcode.RETURN: 0,
		EventOpcode.SET_FLAG: 1,     # flag id
		EventOpcode.CLEAR_FLAG: 1,   # flag id
		EventOpcode.CHECK_FLAG: 3,   # flag, jump address
		EventOpcode.SET_VAR: 2,      # var, value
		EventOpcode.ADD_VAR: 2,      # var, value
		EventOpcode.SUB_VAR: 2,      # var, value
		EventOpcode.COMPARE_VAR: 4,  # var, value, jump address
		EventOpcode.TEXT_BOX: 1,     # box type
		EventOpcode.SHOW_TEXT: 2,    # text id
		EventOpcode.CLEAR_TEXT: 0,
		EventOpcode.CHOICE: 3,       # num choices, addresses
		EventOpcode.NPC_SPAWN: 3,    # id, x, y
		EventOpcode.NPC_MOVE: 3,     # id, x, y
		EventOpcode.NPC_FACE: 2,     # id, direction
		EventOpcode.NPC_ANIM: 2,     # id, anim
		EventOpcode.NPC_HIDE: 1,     # id
		EventOpcode.NPC_SHOW: 1,     # id
		EventOpcode.PLAYER_MOVE: 2,  # x, y
		EventOpcode.PLAYER_FACE: 1,  # direction
		EventOpcode.PLAYER_FREEZE: 0,
		EventOpcode.PLAYER_UNFREEZE: 0,
		EventOpcode.PLAYER_HEAL: 1,  # amount
		EventOpcode.PLAYER_DAMAGE: 1,# amount
		EventOpcode.GIVE_ITEM: 1,    # item id
		EventOpcode.TAKE_ITEM: 1,    # item id
		EventOpcode.CHECK_ITEM: 3,   # item id, jump address
		EventOpcode.GIVE_GOLD: 2,    # amount (16-bit)
		EventOpcode.TAKE_GOLD: 2,    # amount
		EventOpcode.GIVE_EXP: 2,     # amount
		EventOpcode.SOUL_RELEASE: 1, # soul id
		EventOpcode.LAIR_CLEAR: 1,   # lair id
		EventOpcode.BOSS_START: 1,   # boss id
		EventOpcode.BOSS_END: 0,
		EventOpcode.WARP: 3,         # map, x, y
		EventOpcode.FADE_OUT: 1,     # speed
		EventOpcode.FADE_IN: 1,      # speed
		EventOpcode.SCREEN_SHAKE: 1, # intensity
		EventOpcode.PLAY_MUSIC: 1,   # track id
		EventOpcode.PLAY_SFX: 1,     # sfx id
		EventOpcode.STOP_MUSIC: 0,
		EventOpcode.CAMERA_LOCK: 0,
		EventOpcode.CAMERA_UNLOCK: 0,
		EventOpcode.CAMERA_PAN: 2,   # x, y
		EventOpcode.CAMERA_FOCUS: 1, # entity id
		EventOpcode.SAVE_GAME: 0,
		EventOpcode.LOAD_GAME: 0,
		EventOpcode.CREDITS: 0,
	}

	# Direction names
	DIRECTIONS = ["North", "NorthEast", "East", "SouthEast",
				  "South", "SouthWest", "West", "NorthWest"]

	# Known script locations
	KNOWN_SCRIPTS: List[KnownScript] = [
		KnownScript(0x01, "Game Start", 0x020000, "Intro", "Opening sequence"),
		KnownScript(0x02, "Master Shrine", 0x020100, "Shrine", "Master dialog"),
		KnownScript(0x03, "Grass Valley Entry", 0x020200, "GrassValley", "Enter town"),
		KnownScript(0x04, "Tool Shop", 0x020300, "GrassValley", "Shop NPC"),
		KnownScript(0x05, "Tulip Talk", 0x020400, "GrassValley", "Tulip NPC dialog"),
		KnownScript(0x10, "Underground Entry", 0x021000, "Underground", "Dungeon start"),
		KnownScript(0x11, "First Lair", 0x021100, "Underground", "Tutorial lair"),
		KnownScript(0x12, "Metal Mantis", 0x021200, "Underground", "Boss fight"),
		KnownScript(0x20, "GreenWood Entry", 0x022000, "GreenWood", "Enter forest"),
		KnownScript(0x21, "Turbo Talk", 0x022100, "GreenWood", "Dog NPC"),
		KnownScript(0x22, "Plantentacle", 0x022200, "GreenWood", "Boss fight"),
		KnownScript(0x30, "St. Elles Entry", 0x023000, "StElles", "Enter beach"),
		KnownScript(0x31, "Mermaid Talk", 0x023100, "StElles", "Mermaid NPC"),
		KnownScript(0x32, "Dolphin Talk", 0x023200, "StElles", "Dolphin NPC"),
		KnownScript(0x33, "Poseidon", 0x023300, "Seabed", "Boss fight"),
		KnownScript(0x40, "Mountain Entry", 0x024000, "Mountain", "Enter village"),
		KnownScript(0x41, "Nome Talk", 0x024100, "Mountain", "Dwarf NPCs"),
		KnownScript(0x42, "Stone Guardian", 0x024200, "Mountain", "Boss fight"),
		KnownScript(0x50, "Leo's Lab Entry", 0x025000, "LeosLab", "Enter lab"),
		KnownScript(0x51, "Dr. Leo Talk", 0x025100, "LeosLab", "Leo dialog"),
		KnownScript(0x52, "Tin Doll", 0x025200, "ModelTown", "Boss fight"),
		KnownScript(0x53, "Painting World", 0x025300, "Painting", "Lisa's painting"),
		KnownScript(0x60, "Magridd Entry", 0x026000, "Magridd", "Enter castle"),
		KnownScript(0x61, "King Magridd", 0x026100, "Magridd", "King dialog"),
		KnownScript(0x62, "Queen Magridd", 0x026200, "Magridd", "Queen dialog"),
		KnownScript(0x63, "Demon Bird", 0x026300, "Magridd", "Boss fight"),
		KnownScript(0x70, "World of Evil", 0x027000, "WorldOfEvil", "Final dungeon"),
		KnownScript(0x71, "Deathtoll 1", 0x027100, "WorldOfEvil", "Boss phase 1"),
		KnownScript(0x72, "Deathtoll 2", 0x027200, "WorldOfEvil", "Boss phase 2"),
		KnownScript(0x73, "Deathtoll 3", 0x027300, "WorldOfEvil", "Boss phase 3"),
		KnownScript(0x80, "Ending", 0x028000, "Ending", "Credits sequence"),
	]

	# Item names
	ITEM_NAMES = {
		0x00: "Sword of Life", 0x01: "Psycho Sword", 0x02: "Critical Sword",
		0x03: "Lucky Blade", 0x04: "Zantetsu Sword", 0x05: "Spirit Sword",
		0x06: "Recovery Sword", 0x07: "Soul Blade",
		0x10: "Iron Armor", 0x11: "Ice Armor", 0x12: "Bubble Armor",
		0x13: "Magic Armor", 0x14: "Mystic Armor", 0x15: "Light Armor",
		0x16: "Elemental Armor", 0x17: "Soul Armor",
		0x20: "Medical Herb", 0x21: "Strange Bottle", 0x22: "Goat's Food",
		0x23: "Harp String", 0x24: "Door Key", 0x25: "Platinum Card",
		0x26: "VIP Card", 0x27: "Emblem A", 0x28: "Emblem B",
		0x29: "Emblem C", 0x2A: "Emblem D", 0x2B: "Emblem E",
		0x2C: "Emblem F", 0x2D: "Brown Stone", 0x2E: "Green Stone",
		0x2F: "Blue Stone", 0x30: "Silver Stone", 0x31: "Purple Stone",
		0x32: "Black Stone",
	}

	def __init__(self, rom_path: Optional[str] = None):
		"""Initialize decoder with optional ROM file."""
		self.rom_data: Optional[bytes] = None
		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, rom_path: str):
		"""Load ROM file into memory."""
		with open(rom_path, "rb") as f:
			self.rom_data = f.read()
		print(f"Loaded ROM: {rom_path} ({len(self.rom_data):,} bytes)")

	def get_opcode_name(self, opcode: int) -> str:
		"""Get opcode name from value."""
		try:
			return EventOpcode(opcode).name
		except ValueError:
			return f"UNKNOWN_{opcode:02X}"

	def get_param_count(self, opcode: int) -> int:
		"""Get number of parameters for an opcode."""
		try:
			op = EventOpcode(opcode)
			return self.OPCODE_PARAMS.get(op, 0)
		except ValueError:
			return 0

	def format_params(self, opcode: int, params: List[int]) -> str:
		"""Format parameters for display."""
		try:
			op = EventOpcode(opcode)
		except ValueError:
			return ", ".join(f"0x{p:02X}" for p in params)

		if op == EventOpcode.WAIT:
			return f"{params[0]} frames"
		elif op in (EventOpcode.JUMP, EventOpcode.CALL):
			addr = params[0] | (params[1] << 8)
			return f"0x{addr:04X}"
		elif op == EventOpcode.JUMP_IF:
			addr = params[1] | (params[2] << 8)
			return f"flag {params[0]}, 0x{addr:04X}"
		elif op == EventOpcode.CHECK_FLAG:
			addr = params[1] | (params[2] << 8)
			return f"flag {params[0]} → 0x{addr:04X}"
		elif op in (EventOpcode.SET_FLAG, EventOpcode.CLEAR_FLAG):
			return f"flag {params[0]}"
		elif op in (EventOpcode.SET_VAR, EventOpcode.ADD_VAR, EventOpcode.SUB_VAR):
			return f"var[{params[0]}] = {params[1]}"
		elif op == EventOpcode.SHOW_TEXT:
			text_id = params[0] | (params[1] << 8)
			return f"text 0x{text_id:04X}"
		elif op == EventOpcode.NPC_MOVE:
			return f"NPC {params[0]} → ({params[1]}, {params[2]})"
		elif op == EventOpcode.NPC_FACE:
			direction = self.DIRECTIONS[params[1] % 8]
			return f"NPC {params[0]} face {direction}"
		elif op == EventOpcode.PLAYER_FACE:
			direction = self.DIRECTIONS[params[0] % 8]
			return f"face {direction}"
		elif op == EventOpcode.PLAYER_MOVE:
			return f"→ ({params[0]}, {params[1]})"
		elif op in (EventOpcode.GIVE_ITEM, EventOpcode.TAKE_ITEM):
			item_name = self.ITEM_NAMES.get(params[0], f"Item 0x{params[0]:02X}")
			return item_name
		elif op == EventOpcode.CHECK_ITEM:
			item_name = self.ITEM_NAMES.get(params[0], f"Item 0x{params[0]:02X}")
			addr = params[1] | (params[2] << 8)
			return f"{item_name} → 0x{addr:04X}"
		elif op in (EventOpcode.GIVE_GOLD, EventOpcode.TAKE_GOLD, EventOpcode.GIVE_EXP):
			amount = params[0] | (params[1] << 8)
			return f"{amount}"
		elif op == EventOpcode.SOUL_RELEASE:
			return f"soul {params[0]}"
		elif op == EventOpcode.LAIR_CLEAR:
			return f"lair {params[0]}"
		elif op == EventOpcode.BOSS_START:
			return f"boss {params[0]}"
		elif op == EventOpcode.WARP:
			return f"map {params[0]}, ({params[1]}, {params[2]})"
		elif op in (EventOpcode.FADE_OUT, EventOpcode.FADE_IN):
			return f"speed {params[0]}"
		elif op == EventOpcode.PLAY_MUSIC:
			return f"track {params[0]}"
		elif op == EventOpcode.PLAY_SFX:
			return f"sfx {params[0]}"
		elif op == EventOpcode.CAMERA_PAN:
			return f"→ ({params[0]}, {params[1]})"
		elif op == EventOpcode.CAMERA_FOCUS:
			return f"entity {params[0]}"
		else:
			if params:
				return ", ".join(f"0x{p:02X}" for p in params)
			return ""

	def decode_instruction(self, data: bytes, offset: int) -> Tuple[EventInstruction, int]:
		"""
		Decode a single instruction.

		Returns:
			Tuple of (instruction, bytes_consumed)
		"""
		opcode = data[0]
		opcode_name = self.get_opcode_name(opcode)
		param_count = self.get_param_count(opcode)

		params = list(data[1:1 + param_count])
		size = 1 + param_count

		description = self.format_params(opcode, params)

		instruction = EventInstruction(
			offset=offset,
			opcode=opcode,
			opcode_name=opcode_name,
			params=params,
			size=size,
			description=description
		)

		return instruction, size

	def decode_script(self, data: bytes, script_id: int = 0,
					  name: str = "script", offset: int = 0,
					  max_instructions: int = 500) -> EventScript:
		"""
		Decode a complete event script.

		Args:
			data: Raw script data
			script_id: Script identifier
			name: Script name
			offset: File offset
			max_instructions: Safety limit

		Returns:
			EventScript with decoded instructions
		"""
		instructions = []
		flags_used = []
		targets = []
		pos = 0

		while pos < len(data) and len(instructions) < max_instructions:
			remaining = data[pos:]
			if len(remaining) < 1:
				break

			instruction, consumed = self.decode_instruction(remaining, offset + pos)
			instructions.append(instruction)

			# Track flags used
			if instruction.opcode in (EventOpcode.SET_FLAG, EventOpcode.CLEAR_FLAG,
									  EventOpcode.CHECK_FLAG):
				if instruction.params:
					flags_used.append(instruction.params[0])

			# Track jump targets
			if instruction.opcode in (EventOpcode.JUMP, EventOpcode.CALL,
									  EventOpcode.JUMP_IF, EventOpcode.CHECK_FLAG):
				if len(instruction.params) >= 2:
					addr = instruction.params[-2] | (instruction.params[-1] << 8)
					targets.append(addr)

			pos += consumed

			# Stop at END opcode
			if instruction.opcode == EventOpcode.END:
				break

		return EventScript(
			id=script_id,
			name=name,
			offset=offset,
			size=pos,
			instructions=instructions,
			flags_used=sorted(set(flags_used)),
			targets=sorted(set(targets))
		)

	def decode_from_rom(self, offset: int, script_id: int = 0,
						name: str = "script", max_size: int = 0x1000) -> Optional[EventScript]:
		"""
		Decode a script from the loaded ROM.

		Args:
			offset: File offset in ROM
			script_id: Script identifier
			name: Script name
			max_size: Maximum bytes to read

		Returns:
			EventScript or None
		"""
		if not self.rom_data:
			print("Error: No ROM loaded")
			return None

		if offset >= len(self.rom_data):
			print(f"Error: Offset 0x{offset:06X} beyond ROM size")
			return None

		end = min(offset + max_size, len(self.rom_data))
		data = self.rom_data[offset:end]

		return self.decode_script(data, script_id, name, offset)

	def decode_all_known(self) -> List[EventScript]:
		"""Decode all known scripts from ROM."""
		scripts = []

		for known in self.KNOWN_SCRIPTS:
			script = self.decode_from_rom(known.offset, known.id, known.name)
			if script:
				scripts.append(script)
				print(f"  Decoded: {known.name} - {len(script.instructions)} instructions")

		return scripts

	def print_script(self, script: EventScript, show_hex: bool = False):
		"""Print script in readable format."""
		print(f"\nScript: {script.name} (ID: 0x{script.id:02X})")
		print(f"Offset: 0x{script.offset:06X}, Size: {script.size} bytes")
		print("=" * 60)

		for inst in script.instructions:
			hex_str = ""
			if show_hex:
				hex_str = f"[{inst.opcode:02X}] "

			if inst.description:
				print(f"  {hex_str}{inst.opcode_name:<20} {inst.description}")
			else:
				print(f"  {hex_str}{inst.opcode_name}")

		if script.flags_used:
			print(f"\nFlags used: {', '.join(str(f) for f in script.flags_used)}")
		if script.targets:
			print(f"Jump targets: {', '.join(f'0x{t:04X}' for t in script.targets)}")

	def export_script(self, script: EventScript) -> dict:
		"""Export script to dictionary for JSON."""
		return {
			"id": script.id,
			"name": script.name,
			"offset": f"0x{script.offset:06X}",
			"size": script.size,
			"instructions": [
				{
					"offset": f"0x{inst.offset:06X}",
					"opcode": f"0x{inst.opcode:02X}",
					"name": inst.opcode_name,
					"params": inst.params,
					"description": inst.description,
				}
				for inst in script.instructions
			],
			"flags_used": script.flags_used,
			"jump_targets": [f"0x{t:04X}" for t in script.targets],
		}

	def export_all(self, output_dir: str):
		"""Export all known scripts to JSON files."""
		os.makedirs(output_dir, exist_ok=True)

		scripts = self.decode_all_known()
		all_data = {"scripts": []}

		for script in scripts:
			data = self.export_script(script)
			all_data["scripts"].append(data)

			# Individual file
			safe_name = script.name.replace(" ", "_").replace("'", "")
			filepath = os.path.join(output_dir, f"{safe_name}.json")
			with open(filepath, "w", encoding="utf-8") as f:
				json.dump(data, f, indent="\t")

		# Combined file
		combined_path = os.path.join(output_dir, "all_scripts.json")
		with open(combined_path, "w", encoding="utf-8") as f:
			json.dump(all_data, f, indent="\t")

		print(f"\nExported {len(scripts)} scripts to {output_dir}")

	def list_scripts(self):
		"""Print list of known scripts."""
		print("\nKnown Soul Blazer Event Scripts")
		print("=" * 70)
		print(f"{'ID':>4} {'Name':<25} {'Offset':>10} {'Area':<15}")
		print("-" * 70)

		for script in self.KNOWN_SCRIPTS:
			print(f"0x{script.id:02X} {script.name:<25} 0x{script.offset:06X} "
				  f"{script.area:<15}")

	def scan_for_scripts(self, start: int = 0x020000, end: int = 0x030000,
						 min_instructions: int = 3) -> List[Tuple[int, int]]:
		"""
		Scan ROM for potential event scripts.

		Args:
			start: Start offset
			end: End offset
			min_instructions: Minimum instructions to consider valid

		Returns:
			List of (offset, instruction_count) tuples
		"""
		if not self.rom_data:
			return []

		candidates = []
		pos = start

		while pos < end and pos < len(self.rom_data):
			# Try to decode a script here
			try:
				data = self.rom_data[pos:pos + 0x100]
				if len(data) < 2:
					break

				# Quick check for valid opcode
				opcode = data[0]
				if opcode > 0x90 and opcode != EventOpcode.CREDITS:
					pos += 1
					continue

				script = self.decode_script(data, 0, "scan", pos, max_instructions=50)

				if len(script.instructions) >= min_instructions:
					# Check if it ends properly
					last = script.instructions[-1]
					if last.opcode in (EventOpcode.END, EventOpcode.RETURN,
									   EventOpcode.CREDITS, EventOpcode.WARP):
						candidates.append((pos, len(script.instructions)))
						pos += script.size
						continue

			except Exception:
				pass

			pos += 1

		return candidates


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer Event Script Decoder"
	)

	parser.add_argument("rom", nargs="?", help="ROM file to process")
	parser.add_argument("--list", action="store_true",
						help="List known scripts")
	parser.add_argument("--decode", type=str, metavar="ID",
						help="Decode specific script (hex ID or name)")
	parser.add_argument("--decode-all", action="store_true",
						help="Decode all known scripts")
	parser.add_argument("--offset", type=str,
						help="Decode from specific ROM offset (hex)")
	parser.add_argument("--output", "-o", type=str, default=".",
						help="Output directory for exports")
	parser.add_argument("--hex", action="store_true",
						help="Show hex opcodes in output")
	parser.add_argument("--scan", action="store_true",
						help="Scan ROM for event scripts")
	parser.add_argument("--scan-start", type=str, default="0x020000",
						help="Scan start offset (hex)")
	parser.add_argument("--scan-end", type=str, default="0x030000",
						help="Scan end offset (hex)")
	parser.add_argument("--export", action="store_true",
						help="Export scripts to JSON")

	args = parser.parse_args()
	decoder = EventScriptDecoder()

	if args.list:
		decoder.list_scripts()
		return

	if not args.rom:
		parser.print_help()
		print("\nExamples:")
		print("  python event_decoder.py --list")
		print("  python event_decoder.py game.sfc --decode-all")
		print("  python event_decoder.py game.sfc --decode 0x12")
		print("  python event_decoder.py game.sfc --offset 0x021200")
		print("  python event_decoder.py game.sfc --scan")
		print("  python event_decoder.py game.sfc --export -o scripts/")
		return

	decoder.load_rom(args.rom)

	if args.scan:
		start = int(args.scan_start, 16)
		end = int(args.scan_end, 16)

		print(f"\nScanning for event scripts: 0x{start:06X} - 0x{end:06X}")
		print("=" * 50)

		candidates = decoder.scan_for_scripts(start, end)

		print(f"Found {len(candidates)} potential scripts:")
		for offset, count in candidates[:30]:
			print(f"  0x{offset:06X} - {count} instructions")

		if len(candidates) > 30:
			print(f"  ... and {len(candidates) - 30} more")

	elif args.export:
		print("\nExporting all known scripts...")
		decoder.export_all(args.output)

	elif args.decode_all:
		print("\nDecoding all known scripts...")
		scripts = decoder.decode_all_known()
		for script in scripts:
			decoder.print_script(script, args.hex)

	elif args.decode:
		# Find script by ID or name
		script_id = args.decode.lower()
		known = None

		for k in decoder.KNOWN_SCRIPTS:
			if script_id == f"0x{k.id:02x}" or script_id == str(k.id) or \
			   script_id == k.name.lower():
				known = k
				break

		if not known:
			print(f"Script not found: {args.decode}")
			print("Use --list to see available scripts")
			return

		script = decoder.decode_from_rom(known.offset, known.id, known.name)
		if script:
			decoder.print_script(script, args.hex)

	elif args.offset:
		offset = int(args.offset, 16)
		script = decoder.decode_from_rom(offset, 0, f"script_{offset:06X}")

		if script:
			decoder.print_script(script, args.hex)

	else:
		# Default: list known scripts
		decoder.list_scripts()


if __name__ == "__main__":
	main()
