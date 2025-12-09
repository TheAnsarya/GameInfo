#!/usr/bin/env python3
"""
Dialogue Editor - Edit game dialogue and text scripts.

Tools for editing, formatting, and managing game dialogue with
support for control codes, formatting, and multiple languages.

Usage:
	python dialogue_editor.py <script.json>
	python dialogue_editor.py --extract rom.nes
	python dialogue_editor.py --compile

Features:
	- Script editing
	- Control code handling
	- Speaker management
	- Branching dialogue
	- Import/export formats
"""

import argparse
import json
import os
import re
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ControlCode(Enum):
	"""Common dialogue control codes."""
	END = 0x00           # End of text
	NEWLINE = 0x01       # Line break
	NEWPAGE = 0x02       # New text box
	WAIT = 0x03          # Wait for input
	PAUSE = 0x04         # Timed pause
	INSTANT = 0x05       # Instant text
	NORMAL = 0x06        # Normal speed
	SLOW = 0x07          # Slow text
	FAST = 0x08          # Fast text
	NAME = 0x09          # Insert player name
	ITEM = 0x0A          # Insert item name
	NUMBER = 0x0B        # Insert number
	CHOICE = 0x0C        # Choice prompt
	JUMP = 0x0D          # Jump to label
	CALL = 0x0E          # Call subroutine
	RETURN = 0x0F        # Return from call
	COLOR = 0x10         # Change text color
	SOUND = 0x11         # Play sound
	MUSIC = 0x12         # Change music
	PORTRAIT = 0x13      # Show portrait
	ANIMATION = 0x14     # Play animation
	VARIABLE = 0x15      # Insert variable


@dataclass
class ControlSequence:
	"""A control code with parameters."""
	code: ControlCode
	params: List[int] = field(default_factory=list)
	
	def to_string(self) -> str:
		"""Convert to string representation."""
		if self.code == ControlCode.END:
			return "[END]"
		elif self.code == ControlCode.NEWLINE:
			return "[NL]"
		elif self.code == ControlCode.NEWPAGE:
			return "[PAGE]"
		elif self.code == ControlCode.WAIT:
			return "[WAIT]"
		elif self.code == ControlCode.PAUSE:
			return f"[PAUSE:{self.params[0]}]" if self.params else "[PAUSE]"
		elif self.code == ControlCode.NAME:
			return "[NAME]"
		elif self.code == ControlCode.ITEM:
			return f"[ITEM:{self.params[0]}]" if self.params else "[ITEM]"
		elif self.code == ControlCode.NUMBER:
			return f"[NUM:{self.params[0]}]" if self.params else "[NUM]"
		elif self.code == ControlCode.CHOICE:
			return "[CHOICE]"
		elif self.code == ControlCode.JUMP:
			return f"[JUMP:{self.params[0]:04X}]" if self.params else "[JUMP]"
		elif self.code == ControlCode.COLOR:
			return f"[COLOR:{self.params[0]}]" if self.params else "[COLOR]"
		elif self.code == ControlCode.SOUND:
			return f"[SFX:{self.params[0]:02X}]" if self.params else "[SFX]"
		elif self.code == ControlCode.PORTRAIT:
			return f"[PORTRAIT:{self.params[0]}]" if self.params else "[PORTRAIT]"
		else:
			if self.params:
				param_str = ",".join(f"{p:02X}" for p in self.params)
				return f"[{self.code.name}:{param_str}]"
			return f"[{self.code.name}]"
	
	@classmethod
	def from_string(cls, text: str) -> Optional["ControlSequence"]:
		"""Parse from string representation."""
		match = re.match(r'\[(\w+)(?::(.+))?\]', text)
		if not match:
			return None
		
		name = match.group(1).upper()
		param_str = match.group(2)
		
		# Special cases
		code_map = {
			"END": ControlCode.END,
			"NL": ControlCode.NEWLINE,
			"PAGE": ControlCode.NEWPAGE,
			"WAIT": ControlCode.WAIT,
			"PAUSE": ControlCode.PAUSE,
			"NAME": ControlCode.NAME,
			"ITEM": ControlCode.ITEM,
			"NUM": ControlCode.NUMBER,
			"CHOICE": ControlCode.CHOICE,
			"JUMP": ControlCode.JUMP,
			"COLOR": ControlCode.COLOR,
			"SFX": ControlCode.SOUND,
			"PORTRAIT": ControlCode.PORTRAIT
		}
		
		code = code_map.get(name)
		if code is None:
			try:
				code = ControlCode[name]
			except KeyError:
				return None
		
		params = []
		if param_str:
			for p in param_str.split(","):
				p = p.strip()
				if p.startswith("0x") or all(c in "0123456789ABCDEFabcdef" for c in p):
					params.append(int(p, 16))
				else:
					params.append(int(p))
		
		return cls(code=code, params=params)


@dataclass
class DialogueLine:
	"""A single line of dialogue."""
	text: str
	speaker: str = ""
	portrait: int = -1
	voice_id: int = -1
	conditions: List[str] = field(default_factory=list)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"text": self.text,
			"speaker": self.speaker,
			"portrait": self.portrait,
			"voice_id": self.voice_id,
			"conditions": self.conditions
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueLine":
		"""Create from dictionary."""
		return cls(
			text=data.get("text", ""),
			speaker=data.get("speaker", ""),
			portrait=data.get("portrait", -1),
			voice_id=data.get("voice_id", -1),
			conditions=data.get("conditions", [])
		)


@dataclass
class DialogueChoice:
	"""A dialogue choice option."""
	text: str
	target: str  # Label to jump to
	conditions: List[str] = field(default_factory=list)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"text": self.text,
			"target": self.target,
			"conditions": self.conditions
		}


@dataclass
class DialogueNode:
	"""A node in dialogue tree."""
	id: str
	lines: List[DialogueLine] = field(default_factory=list)
	choices: List[DialogueChoice] = field(default_factory=list)
	next_node: str = ""  # Auto-continue to this node
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"lines": [l.to_dict() for l in self.lines],
			"choices": [c.to_dict() for c in self.choices],
			"next_node": self.next_node
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueNode":
		"""Create from dictionary."""
		lines = [DialogueLine.from_dict(l) for l in data.get("lines", [])]
		choices = []
		for c in data.get("choices", []):
			choices.append(DialogueChoice(
				text=c.get("text", ""),
				target=c.get("target", ""),
				conditions=c.get("conditions", [])
			))
		return cls(
			id=data.get("id", ""),
			lines=lines,
			choices=choices,
			next_node=data.get("next_node", "")
		)


@dataclass
class DialogueScript:
	"""Complete dialogue script."""
	id: str
	name: str
	nodes: Dict[str, DialogueNode] = field(default_factory=dict)
	start_node: str = ""
	speakers: Dict[str, Dict[str, Any]] = field(default_factory=dict)
	
	def add_node(self, node: DialogueNode) -> None:
		"""Add dialogue node."""
		self.nodes[node.id] = node
	
	def get_node(self, node_id: str) -> Optional[DialogueNode]:
		"""Get node by ID."""
		return self.nodes.get(node_id)
	
	def validate(self) -> List[str]:
		"""Validate script and return errors."""
		errors = []
		
		# Check start node
		if self.start_node and self.start_node not in self.nodes:
			errors.append(f"Start node '{self.start_node}' not found")
		
		# Check all references
		for node_id, node in self.nodes.items():
			if node.next_node and node.next_node not in self.nodes:
				errors.append(f"Node '{node_id}' references missing node '{node.next_node}'")
			
			for choice in node.choices:
				if choice.target not in self.nodes:
					errors.append(f"Node '{node_id}' choice references missing node '{choice.target}'")
		
		return errors
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"nodes": {k: v.to_dict() for k, v in self.nodes.items()},
			"start_node": self.start_node,
			"speakers": self.speakers
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueScript":
		"""Create from dictionary."""
		script = cls(
			id=data.get("id", ""),
			name=data.get("name", ""),
			start_node=data.get("start_node", ""),
			speakers=data.get("speakers", {})
		)
		
		for node_id, node_data in data.get("nodes", {}).items():
			script.add_node(DialogueNode.from_dict(node_data))
		
		return script


class TextEncoder:
	"""Encode/decode game text."""
	
	def __init__(self, table_file: str = None):
		self.char_to_byte: Dict[str, int] = {}
		self.byte_to_char: Dict[int, str] = {}
		self.control_codes: Dict[int, ControlCode] = {}
		
		if table_file:
			self.load_table(table_file)
		else:
			self._default_table()
	
	def _default_table(self):
		"""Set up default ASCII table."""
		for i in range(32, 127):
			char = chr(i)
			self.char_to_byte[char] = i
			self.byte_to_char[i] = char
		
		# Space
		self.char_to_byte[" "] = 0x20
		self.byte_to_char[0x20] = " "
		
		# Default control codes
		self.control_codes[0x00] = ControlCode.END
		self.control_codes[0x01] = ControlCode.NEWLINE
		self.control_codes[0x02] = ControlCode.NEWPAGE
	
	def load_table(self, filepath: str):
		"""Load character table file."""
		with open(filepath, "r", encoding="utf-8") as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith("#"):
					continue
				
				# Format: XX=C or XX=<control>
				match = re.match(r'^([0-9A-Fa-f]+)=(.+)$', line)
				if match:
					byte_val = int(match.group(1), 16)
					char = match.group(2)
					
					if char.startswith("<") and char.endswith(">"):
						# Control code
						code_name = char[1:-1].upper()
						try:
							self.control_codes[byte_val] = ControlCode[code_name]
						except KeyError:
							pass
					else:
						self.char_to_byte[char] = byte_val
						self.byte_to_char[byte_val] = char
	
	def encode(self, text: str) -> bytes:
		"""Encode text to bytes."""
		result = bytearray()
		i = 0
		
		while i < len(text):
			# Check for control code
			if text[i] == "[":
				end = text.find("]", i)
				if end != -1:
					control_str = text[i:end + 1]
					ctrl = ControlSequence.from_string(control_str)
					if ctrl:
						# Find byte for this control code
						for byte_val, code in self.control_codes.items():
							if code == ctrl.code:
								result.append(byte_val)
								result.extend(ctrl.params)
								break
						i = end + 1
						continue
			
			# Regular character
			char = text[i]
			if char in self.char_to_byte:
				result.append(self.char_to_byte[char])
			else:
				# Unknown character - use placeholder
				result.append(0x3F)  # ?
			i += 1
		
		return bytes(result)
	
	def decode(self, data: bytes) -> str:
		"""Decode bytes to text."""
		result = []
		i = 0
		
		while i < len(data):
			byte_val = data[i]
			
			# Check for control code
			if byte_val in self.control_codes:
				code = self.control_codes[byte_val]
				ctrl = ControlSequence(code=code)
				
				# Read parameters if needed
				# (This would need game-specific logic)
				
				result.append(ctrl.to_string())
			elif byte_val in self.byte_to_char:
				result.append(self.byte_to_char[byte_val])
			else:
				result.append(f"[{byte_val:02X}]")
			
			i += 1
		
		return "".join(result)


class DialogueExtractor:
	"""Extract dialogue from ROM."""
	
	def __init__(self, rom_data: bytes, encoder: TextEncoder = None):
		self.data = rom_data
		self.encoder = encoder or TextEncoder()
	
	def find_text_blocks(self, min_length: int = 4) -> List[Tuple[int, str]]:
		"""Find potential text blocks in ROM."""
		blocks = []
		
		i = 0
		while i < len(self.data):
			# Look for strings of valid characters
			start = i
			text = []
			
			while i < len(self.data):
				byte_val = self.data[i]
				
				if byte_val in self.encoder.byte_to_char:
					text.append(self.encoder.byte_to_char[byte_val])
					i += 1
				elif byte_val in self.encoder.control_codes:
					code = self.encoder.control_codes[byte_val]
					if code == ControlCode.END:
						break
					text.append(f"[{code.name}]")
					i += 1
				else:
					break
			
			if len(text) >= min_length:
				blocks.append((start, "".join(text)))
			
			i += 1
		
		return blocks
	
	def extract_at_address(self, address: int, max_length: int = 256) -> str:
		"""Extract text at specific address."""
		data = self.data[address:address + max_length]
		return self.encoder.decode(data)


class DialogueCompiler:
	"""Compile dialogue scripts."""
	
	def __init__(self, encoder: TextEncoder = None):
		self.encoder = encoder or TextEncoder()
	
	def compile_script(self, script: DialogueScript) -> bytes:
		"""Compile script to binary."""
		output = bytearray()
		
		# Simple linear compilation
		for node_id, node in script.nodes.items():
			for line in node.lines:
				text = line.text
				encoded = self.encoder.encode(text)
				output.extend(encoded)
				
				# Add end marker
				output.append(0x00)
		
		return bytes(output)
	
	def compile_to_asm(self, script: DialogueScript) -> str:
		"""Compile script to assembly."""
		lines = [f"; Dialogue Script: {script.name}", ""]
		
		for node_id, node in script.nodes.items():
			lines.append(f"{node_id}:")
			
			for i, line in enumerate(node.lines):
				lines.append(f"\t; {line.speaker}: " if line.speaker else "\t;")
				
				# Encode text
				encoded = self.encoder.encode(line.text)
				hex_str = ", ".join(f"${b:02X}" for b in encoded)
				lines.append(f"\t.db {hex_str}")
			
			lines.append("")
		
		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Dialogue Editor")
	parser.add_argument("file", nargs="?", help="Script or ROM file")
	parser.add_argument("--extract", "-e", action="store_true",
						help="Extract text from ROM")
	parser.add_argument("--compile", "-c", action="store_true",
						help="Compile script")
	parser.add_argument("--table", "-t", help="Character table file")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Extract at address")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate script")
	parser.add_argument("--list", "-l", action="store_true",
						help="List dialogue nodes")
	
	args = parser.parse_args()
	
	encoder = TextEncoder(args.table) if args.table else TextEncoder()
	
	if args.file and os.path.exists(args.file):
		if args.file.endswith(".json"):
			# Load script
			with open(args.file, "r") as f:
				data = json.load(f)
			script = DialogueScript.from_dict(data)
			print(f"Loaded script: {script.name}")
			print(f"Nodes: {len(script.nodes)}")
			
			if args.validate:
				errors = script.validate()
				if errors:
					print("\nValidation errors:")
					for error in errors:
						print(f"  - {error}")
				else:
					print("\nScript is valid!")
				return
			
			if args.list:
				print("\nDialogue nodes:")
				for node_id, node in script.nodes.items():
					line_count = len(node.lines)
					choice_count = len(node.choices)
					print(f"  {node_id}: {line_count} lines, {choice_count} choices")
					
					if node.lines:
						preview = node.lines[0].text[:50]
						if len(node.lines[0].text) > 50:
							preview += "..."
						print(f"    Preview: {preview}")
				return
			
			if args.compile:
				compiler = DialogueCompiler(encoder)
				
				if args.output and args.output.endswith(".asm"):
					asm = compiler.compile_to_asm(script)
					with open(args.output, "w") as f:
						f.write(asm)
					print(f"Compiled to: {args.output}")
				else:
					binary = compiler.compile_script(script)
					output = args.output or f"{script.id}.bin"
					with open(output, "wb") as f:
						f.write(binary)
					print(f"Compiled to: {output}")
				return
		
		else:
			# Load as ROM
			with open(args.file, "rb") as f:
				rom_data = f.read()
			
			extractor = DialogueExtractor(rom_data, encoder)
			
			if args.address is not None:
				text = extractor.extract_at_address(args.address)
				print(f"Text at ${args.address:06X}:")
				print(text)
				return
			
			if args.extract:
				blocks = extractor.find_text_blocks()
				print(f"Found {len(blocks)} text blocks:")
				
				for addr, text in blocks[:50]:
					preview = text[:60].replace("\n", " ")
					if len(text) > 60:
						preview += "..."
					print(f"  ${addr:06X}: {preview}")
				return
	
	# Create example script
	if not args.file:
		print("Dialogue Editor")
		print()
		print("Usage: python dialogue_editor.py <file> [options]")
		print()
		print("Options:")
		print("  --extract         Extract text from ROM")
		print("  --compile         Compile script")
		print("  --table FILE      Character table file")
		print("  --address ADDR    Extract at address")
		print("  --validate        Validate script")
		print("  --list            List dialogue nodes")
		print()
		
		# Show example script
		print("Example script structure:")
		example = DialogueScript(
			id="example",
			name="Example Script",
			start_node="start"
		)
		
		start = DialogueNode(id="start")
		start.lines.append(DialogueLine(
			text="Hello, traveler![WAIT]",
			speaker="NPC"
		))
		start.lines.append(DialogueLine(
			text="What brings you here?[WAIT]",
			speaker="NPC"
		))
		start.choices.append(DialogueChoice(
			text="I'm looking for treasure.",
			target="treasure_path"
		))
		start.choices.append(DialogueChoice(
			text="Just passing through.",
			target="leave_path"
		))
		example.add_node(start)
		
		print(json.dumps(example.to_dict(), indent=2))


if __name__ == "__main__":
	main()
