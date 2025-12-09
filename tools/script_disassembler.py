#!/usr/bin/env python3
"""
Script Disassembler
Disassemble game-specific scripting languages and event systems.

Supports:
- Generic bytecode formats
- RPG event scripting (common patterns)
- Dialogue/text script systems
- AI behavior scripts
- Map/cutscene scripting
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Optional


class OpcodeType(Enum):
	"""Types of script opcodes."""
	CONTROL = auto()      # Flow control (jump, call, return)
	TEXT = auto()         # Text/dialogue display
	WAIT = auto()         # Timing/delays
	FLAG = auto()         # Event flags
	ACTOR = auto()        # Character/NPC actions
	CAMERA = auto()       # Camera movement
	AUDIO = auto()        # Sound/music
	GRAPHICS = auto()     # Visual effects
	GAME = auto()         # Game mechanics
	DATA = auto()         # Raw data
	UNKNOWN = auto()      # Unrecognized


@dataclass
class Opcode:
	"""Definition of a script opcode."""
	code: int
	name: str
	size: int  # Total size including opcode
	param_format: str = ""  # struct format for parameters
	description: str = ""
	opcode_type: OpcodeType = OpcodeType.UNKNOWN


@dataclass
class Instruction:
	"""A disassembled instruction."""
	address: int
	opcode: Opcode
	raw_bytes: bytes
	params: list[Any] = field(default_factory=list)
	comment: str = ""
	label: str = ""

	def to_string(self, show_bytes: bool = True) -> str:
		"""Format instruction as string."""
		parts = []
		if self.label:
			parts.append(f"{self.label}:")
		addr = f"${self.address:06x}"
		if show_bytes:
			hex_bytes = " ".join(f"{b:02x}" for b in self.raw_bytes[:8])
			parts.append(f"{addr}:  {hex_bytes:24s}  {self.opcode.name}")
		else:
			parts.append(f"{addr}:  {self.opcode.name}")

		if self.params:
			param_str = ", ".join(self._format_param(p) for p in self.params)
			parts[-1] += f"  {param_str}"

		if self.comment:
			parts[-1] += f"  ; {self.comment}"

		return "\n".join(parts)

	def _format_param(self, param: Any) -> str:
		"""Format a parameter for display."""
		if isinstance(param, int):
			if param < 0:
				return f"-${abs(param):x}"
			elif param > 0xff:
				return f"${param:04x}"
			else:
				return f"${param:02x}"
		elif isinstance(param, str):
			return f'"{param}"'
		return str(param)


@dataclass
class ScriptBlock:
	"""A block of disassembled script."""
	start_address: int
	instructions: list[Instruction] = field(default_factory=list)
	name: str = ""
	description: str = ""

	def to_string(self, show_bytes: bool = True) -> str:
		"""Format entire block as string."""
		lines = []
		if self.name:
			lines.append(f"; === {self.name} ===")
		if self.description:
			lines.append(f"; {self.description}")
		lines.append("")
		for instr in self.instructions:
			lines.append(instr.to_string(show_bytes))
		return "\n".join(lines)


class ScriptLanguage:
	"""Base class for script language definitions."""

	def __init__(self, name: str = "Generic"):
		self.name = name
		self.opcodes: dict[int, Opcode] = {}
		self.text_encoding: dict[int, str] = {}

	def add_opcode(self, code: int, name: str, size: int, param_format: str = "",
	               description: str = "", opcode_type: OpcodeType = OpcodeType.UNKNOWN):
		"""Add an opcode definition."""
		self.opcodes[code] = Opcode(
			code=code,
			name=name,
			size=size,
			param_format=param_format,
			description=description,
			opcode_type=opcode_type
		)

	def get_opcode(self, code: int) -> Optional[Opcode]:
		"""Get opcode definition by code."""
		return self.opcodes.get(code)

	def decode_text(self, data: bytes) -> str:
		"""Decode text bytes using encoding table."""
		result = []
		for b in data:
			if b in self.text_encoding:
				result.append(self.text_encoding[b])
			elif 0x20 <= b <= 0x7e:
				result.append(chr(b))
			else:
				result.append(f"[{b:02x}]")
		return "".join(result)


class GenericRPGScript(ScriptLanguage):
	"""Common RPG event script patterns."""

	def __init__(self):
		super().__init__("Generic RPG")
		self._define_opcodes()

	def _define_opcodes(self):
		"""Define common RPG script opcodes."""
		# Control flow
		self.add_opcode(0x00, "END", 1, "", "End script", OpcodeType.CONTROL)
		self.add_opcode(0x01, "RETURN", 1, "", "Return from subroutine", OpcodeType.CONTROL)
		self.add_opcode(0x02, "JUMP", 3, "<H", "Jump to address", OpcodeType.CONTROL)
		self.add_opcode(0x03, "CALL", 3, "<H", "Call subroutine", OpcodeType.CONTROL)
		self.add_opcode(0x04, "JUMP_IF", 4, "<BH", "Conditional jump", OpcodeType.CONTROL)
		self.add_opcode(0x05, "JUMP_IFNOT", 4, "<BH", "Jump if not", OpcodeType.CONTROL)

		# Flags
		self.add_opcode(0x10, "SET_FLAG", 3, "<H", "Set event flag", OpcodeType.FLAG)
		self.add_opcode(0x11, "CLEAR_FLAG", 3, "<H", "Clear event flag", OpcodeType.FLAG)
		self.add_opcode(0x12, "CHECK_FLAG", 3, "<H", "Check flag value", OpcodeType.FLAG)

		# Text
		self.add_opcode(0x20, "MSG", 3, "<H", "Display message", OpcodeType.TEXT)
		self.add_opcode(0x21, "CHOICE", 2, "<B", "Show choices", OpcodeType.TEXT)
		self.add_opcode(0x22, "WAIT_INPUT", 1, "", "Wait for input", OpcodeType.TEXT)

		# Timing
		self.add_opcode(0x30, "WAIT", 2, "<B", "Wait frames", OpcodeType.WAIT)
		self.add_opcode(0x31, "WAIT_LONG", 3, "<H", "Wait many frames", OpcodeType.WAIT)

		# Actors
		self.add_opcode(0x40, "MOVE_NPC", 4, "<BBB", "Move NPC", OpcodeType.ACTOR)
		self.add_opcode(0x41, "FACE_DIR", 3, "<BB", "Face direction", OpcodeType.ACTOR)
		self.add_opcode(0x42, "SET_SPEED", 3, "<BB", "Set move speed", OpcodeType.ACTOR)
		self.add_opcode(0x43, "SHOW_NPC", 2, "<B", "Show NPC", OpcodeType.ACTOR)
		self.add_opcode(0x44, "HIDE_NPC", 2, "<B", "Hide NPC", OpcodeType.ACTOR)

		# Camera
		self.add_opcode(0x50, "PAN_CAM", 4, "<HB", "Pan camera", OpcodeType.CAMERA)
		self.add_opcode(0x51, "SHAKE", 2, "<B", "Screen shake", OpcodeType.CAMERA)
		self.add_opcode(0x52, "FADE_OUT", 2, "<B", "Fade to black", OpcodeType.CAMERA)
		self.add_opcode(0x53, "FADE_IN", 2, "<B", "Fade from black", OpcodeType.CAMERA)

		# Audio
		self.add_opcode(0x60, "PLAY_BGM", 2, "<B", "Play music", OpcodeType.AUDIO)
		self.add_opcode(0x61, "STOP_BGM", 1, "", "Stop music", OpcodeType.AUDIO)
		self.add_opcode(0x62, "PLAY_SFX", 2, "<B", "Play sound effect", OpcodeType.AUDIO)

		# Game
		self.add_opcode(0x70, "GIVE_ITEM", 3, "<BB", "Give item", OpcodeType.GAME)
		self.add_opcode(0x71, "TAKE_ITEM", 3, "<BB", "Remove item", OpcodeType.GAME)
		self.add_opcode(0x72, "GIVE_GOLD", 3, "<H", "Give money", OpcodeType.GAME)
		self.add_opcode(0x73, "ADD_MEMBER", 2, "<B", "Add party member", OpcodeType.GAME)
		self.add_opcode(0x74, "REMOVE_MEMBER", 2, "<B", "Remove party member", OpcodeType.GAME)
		self.add_opcode(0x75, "HEAL_PARTY", 1, "", "Heal all", OpcodeType.GAME)
		self.add_opcode(0x76, "WARP", 4, "<BBB", "Warp to location", OpcodeType.GAME)
		self.add_opcode(0x77, "BATTLE", 3, "<BB", "Start battle", OpcodeType.GAME)


class DragonQuestScript(ScriptLanguage):
	"""Dragon Quest series event script."""

	def __init__(self):
		super().__init__("Dragon Quest")
		self._define_opcodes()

	def _define_opcodes(self):
		"""Define DQ-style script opcodes."""
		self.add_opcode(0x00, "END", 1, "", "End event", OpcodeType.CONTROL)
		self.add_opcode(0x01, "TEXT", 2, "<B", "Show text ID", OpcodeType.TEXT)
		self.add_opcode(0x02, "NEWLINE", 1, "", "New line", OpcodeType.TEXT)
		self.add_opcode(0x03, "WAIT", 1, "", "Wait for input", OpcodeType.WAIT)
		self.add_opcode(0x04, "CLEAR", 1, "", "Clear text box", OpcodeType.TEXT)
		self.add_opcode(0x05, "HERO_NAME", 1, "", "Insert hero name", OpcodeType.TEXT)
		self.add_opcode(0x06, "ITEM_NAME", 2, "<B", "Insert item name", OpcodeType.TEXT)
		self.add_opcode(0x07, "NUMBER", 2, "<B", "Insert number", OpcodeType.TEXT)
		self.add_opcode(0x08, "CHOICE_YN", 1, "", "Yes/No choice", OpcodeType.TEXT)
		self.add_opcode(0x09, "JUMP", 3, "<H", "Jump to address", OpcodeType.CONTROL)
		self.add_opcode(0x0a, "JUMP_YES", 3, "<H", "Jump if Yes", OpcodeType.CONTROL)
		self.add_opcode(0x0b, "JUMP_NO", 3, "<H", "Jump if No", OpcodeType.CONTROL)


class FinalFantasyScript(ScriptLanguage):
	"""Final Fantasy series event script."""

	def __init__(self):
		super().__init__("Final Fantasy")
		self._define_opcodes()

	def _define_opcodes(self):
		"""Define FF-style script opcodes."""
		self.add_opcode(0x00, "RET", 1, "", "Return", OpcodeType.CONTROL)
		self.add_opcode(0x01, "RET_CLEAR", 1, "", "Return and clear", OpcodeType.CONTROL)
		self.add_opcode(0x10, "WAIT_VBLANK", 1, "", "Wait 1 frame", OpcodeType.WAIT)
		self.add_opcode(0x11, "WAIT_FRAMES", 2, "<B", "Wait N frames", OpcodeType.WAIT)
		self.add_opcode(0x20, "MOVE_CHAR", 4, "<BBB", "Move character", OpcodeType.ACTOR)
		self.add_opcode(0x21, "FACE_CHAR", 3, "<BB", "Turn character", OpcodeType.ACTOR)
		self.add_opcode(0x30, "DIALOG", 2, "<B", "Show dialog", OpcodeType.TEXT)
		self.add_opcode(0x40, "PLAY_MUSIC", 2, "<B", "Play BGM", OpcodeType.AUDIO)
		self.add_opcode(0x50, "FADE_OUT", 1, "", "Fade screen out", OpcodeType.CAMERA)
		self.add_opcode(0x51, "FADE_IN", 1, "", "Fade screen in", OpcodeType.CAMERA)
		self.add_opcode(0x60, "SET_FLAG", 2, "<B", "Set story flag", OpcodeType.FLAG)
		self.add_opcode(0x61, "CLR_FLAG", 2, "<B", "Clear story flag", OpcodeType.FLAG)
		self.add_opcode(0x70, "BRANCH", 4, "<BH", "Branch if flag", OpcodeType.CONTROL)
		self.add_opcode(0x80, "CALL", 3, "<H", "Call subroutine", OpcodeType.CONTROL)
		self.add_opcode(0x90, "GIVE_ITEM", 2, "<B", "Give item to party", OpcodeType.GAME)
		self.add_opcode(0xa0, "BATTLE", 2, "<B", "Start battle", OpcodeType.GAME)


class ScriptDisassembler:
	"""Disassemble game scripts."""

	def __init__(self, language: ScriptLanguage = None):
		self.language = language or GenericRPGScript()
		self.labels: dict[int, str] = {}
		self.verbose = False

	def disassemble(self, data: bytes, start_address: int = 0,
	                max_instructions: int = 1000) -> ScriptBlock:
		"""
		Disassemble script data.

		Args:
			data: Raw script bytes
			start_address: Base address for offsets
			max_instructions: Maximum instructions to decode

		Returns:
			Disassembled ScriptBlock
		"""
		block = ScriptBlock(start_address=start_address)
		offset = 0
		count = 0

		# First pass: find jump targets for labels
		self._find_labels(data, start_address)

		# Second pass: disassemble
		while offset < len(data) and count < max_instructions:
			address = start_address + offset
			opcode_byte = data[offset]

			opcode = self.language.get_opcode(opcode_byte)
			if opcode is None:
				# Unknown opcode - treat as single byte
				opcode = Opcode(
					code=opcode_byte,
					name=f"DB",
					size=1,
					description="Unknown byte"
				)

			# Get instruction bytes
			size = opcode.size
			if offset + size > len(data):
				size = len(data) - offset

			raw_bytes = data[offset:offset + size]

			# Parse parameters
			params = []
			if opcode.param_format and len(raw_bytes) > 1:
				try:
					params = list(struct.unpack(opcode.param_format, raw_bytes[1:1+struct.calcsize(opcode.param_format)]))
				except:
					params = list(raw_bytes[1:])

			# Create instruction
			instr = Instruction(
				address=address,
				opcode=opcode,
				raw_bytes=raw_bytes,
				params=params,
				label=self.labels.get(address, ""),
				comment=opcode.description if self.verbose else ""
			)

			block.instructions.append(instr)
			offset += size
			count += 1

			# Stop on END/RETURN
			if opcode.name in ("END", "RET", "RETURN") and opcode.opcode_type == OpcodeType.CONTROL:
				break

		return block

	def _find_labels(self, data: bytes, start_address: int):
		"""Find jump targets and generate labels."""
		self.labels.clear()
		offset = 0
		label_num = 0

		while offset < len(data) - 2:
			opcode_byte = data[offset]
			opcode = self.language.get_opcode(opcode_byte)

			if opcode and opcode.opcode_type == OpcodeType.CONTROL:
				# Check for jump targets
				if "H" in opcode.param_format and opcode.size >= 3:
					target = struct.unpack("<H", data[offset+1:offset+3])[0]
					if target not in self.labels:
						self.labels[target] = f"label_{label_num}"
						label_num += 1

			if opcode:
				offset += opcode.size
			else:
				offset += 1

	def disassemble_file(self, filepath: str | Path, start_address: int = 0) -> ScriptBlock:
		"""
		Disassemble script from file.

		Args:
			filepath: Path to script file
			start_address: Base address

		Returns:
			Disassembled ScriptBlock
		"""
		with open(filepath, "rb") as f:
			data = f.read()
		return self.disassemble(data, start_address)


def load_language_definition(filepath: str | Path) -> ScriptLanguage:
	"""
	Load script language definition from JSON file.

	Args:
		filepath: Path to JSON definition

	Returns:
		ScriptLanguage with defined opcodes
	"""
	with open(filepath, "r") as f:
		data = json.load(f)

	lang = ScriptLanguage(data.get("name", "Custom"))

	for op_data in data.get("opcodes", []):
		optype = OpcodeType[op_data.get("type", "UNKNOWN").upper()]
		lang.add_opcode(
			code=int(op_data["code"], 16) if isinstance(op_data["code"], str) else op_data["code"],
			name=op_data["name"],
			size=op_data["size"],
			param_format=op_data.get("params", ""),
			description=op_data.get("description", ""),
			opcode_type=optype
		)

	# Load text encoding if present
	for code, char in data.get("text_encoding", {}).items():
		lang.text_encoding[int(code, 16) if isinstance(code, str) else code] = char

	return lang


def main():
	parser = argparse.ArgumentParser(
		description="Disassemble game scripting bytecode",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Script Languages:
  generic   - Generic RPG event script
  dq        - Dragon Quest series
  ff        - Final Fantasy series

Examples:
  %(prog)s script.bin                    # Disassemble with generic language
  %(prog)s script.bin --lang dq          # Use Dragon Quest format
  %(prog)s script.bin --lang-file my.json  # Use custom definition
  %(prog)s script.bin -a 0x8000 -o script.asm  # Set base address
		"""
	)

	parser.add_argument("input", help="Input script file")
	parser.add_argument("-o", "--output", help="Output file (default: stdout)")
	parser.add_argument("-a", "--address", type=lambda x: int(x, 0), default=0,
	                    help="Base address for disassembly")
	parser.add_argument("--lang", choices=["generic", "dq", "ff"], default="generic",
	                    help="Script language")
	parser.add_argument("--lang-file", help="Custom language definition (JSON)")
	parser.add_argument("--no-bytes", action="store_true", help="Don't show raw bytes")
	parser.add_argument("-v", "--verbose", action="store_true", help="Show descriptions")
	parser.add_argument("--max", type=int, default=1000, help="Max instructions")

	args = parser.parse_args()

	# Select language
	if args.lang_file:
		language = load_language_definition(args.lang_file)
	elif args.lang == "dq":
		language = DragonQuestScript()
	elif args.lang == "ff":
		language = FinalFantasyScript()
	else:
		language = GenericRPGScript()

	# Disassemble
	disasm = ScriptDisassembler(language)
	disasm.verbose = args.verbose
	block = disasm.disassemble_file(args.input, args.address)

	# Output
	output = block.to_string(show_bytes=not args.no_bytes)

	if args.output:
		with open(args.output, "w") as f:
			f.write(f"; Disassembled with {language.name} script language\n")
			f.write(f"; Source: {args.input}\n\n")
			f.write(output)
		print(f"Output written to {args.output}")
	else:
		print(output)


if __name__ == "__main__":
	main()
