#!/usr/bin/env python3
"""
Event Editor - Visual editor for game event scripts and triggers.

Provides a GUI for editing game events, NPC scripts, cutscenes, and triggers
with visual flow representation and bytecode compilation.

Usage:
	python event_editor.py [event_file]
	python event_editor.py --project project.json

Features:
	- Visual event flow editor
	- NPC script editing
	- Trigger zone management
	- Cutscene sequencing
	- Condition/action builders
	- Export to game bytecode
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum
from pathlib import Path
from typing import Any, BinaryIO, Callable, Dict, List, Optional, Tuple, Union


class EventType(IntEnum):
	"""Common event types in RPGs."""
	NPC_TALK = 0x00
	NPC_MOVE = 0x01
	ITEM_GIVE = 0x02
	ITEM_TAKE = 0x03
	FLAG_SET = 0x04
	FLAG_CHECK = 0x05
	BATTLE_START = 0x06
	SHOP_OPEN = 0x07
	INN_OPEN = 0x08
	HEAL_PARTY = 0x09
	TELEPORT = 0x0A
	SCREEN_FADE = 0x0B
	WAIT = 0x0C
	SOUND_PLAY = 0x0D
	MUSIC_PLAY = 0x0E
	MESSAGE_SHOW = 0x0F
	CHOICE_PROMPT = 0x10
	CONDITION_IF = 0x11
	CONDITION_ELSE = 0x12
	CONDITION_END = 0x13
	JUMP = 0x14
	CALL = 0x15
	RETURN = 0x16
	LOOP_START = 0x17
	LOOP_END = 0x18
	VARIABLE_SET = 0x19
	VARIABLE_ADD = 0x1A
	PARTY_ADD = 0x1B
	PARTY_REMOVE = 0x1C
	ANIMATION_PLAY = 0x1D
	CAMERA_MOVE = 0x1E
	CUSTOM = 0xFF


class ConditionType(IntEnum):
	"""Condition types for event branching."""
	FLAG_TRUE = 0x00
	FLAG_FALSE = 0x01
	ITEM_HAVE = 0x02
	ITEM_NOT_HAVE = 0x03
	GOLD_GTE = 0x04
	GOLD_LT = 0x05
	PARTY_HAS = 0x06
	PARTY_NOT_HAS = 0x07
	VARIABLE_EQ = 0x08
	VARIABLE_NE = 0x09
	VARIABLE_GT = 0x0A
	VARIABLE_LT = 0x0B
	VARIABLE_GTE = 0x0C
	VARIABLE_LTE = 0x0D
	LEVEL_GTE = 0x0E
	LEVEL_LT = 0x0F
	RANDOM = 0x10


@dataclass
class EventCommand:
	"""Single event command."""
	type: EventType
	params: List[int] = field(default_factory=list)
	label: str = ""
	comment: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"type": self.type.name if isinstance(self.type, EventType) else self.type,
			"params": self.params,
			"label": self.label,
			"comment": self.comment
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EventCommand":
		"""Create from dictionary."""
		event_type = data.get("type", 0)
		if isinstance(event_type, str):
			try:
				event_type = EventType[event_type]
			except KeyError:
				event_type = EventType.CUSTOM
		return cls(
			type=event_type,
			params=data.get("params", []),
			label=data.get("label", ""),
			comment=data.get("comment", "")
		)


@dataclass
class EventScript:
	"""Complete event script."""
	id: int
	name: str
	commands: List[EventCommand] = field(default_factory=list)
	triggers: List[Dict[str, Any]] = field(default_factory=list)
	metadata: Dict[str, Any] = field(default_factory=dict)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"commands": [cmd.to_dict() for cmd in self.commands],
			"triggers": self.triggers,
			"metadata": self.metadata
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EventScript":
		"""Create from dictionary."""
		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			commands=[EventCommand.from_dict(cmd) for cmd in data.get("commands", [])],
			triggers=data.get("triggers", []),
			metadata=data.get("metadata", {})
		)


@dataclass
class Trigger:
	"""Event trigger definition."""
	id: int
	type: str  # "touch", "action", "auto", "parallel"
	x: int
	y: int
	width: int = 1
	height: int = 1
	event_id: int = 0
	conditions: List[Dict[str, Any]] = field(default_factory=list)
	enabled: bool = True

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"type": self.type,
			"x": self.x,
			"y": self.y,
			"width": self.width,
			"height": self.height,
			"event_id": self.event_id,
			"conditions": self.conditions,
			"enabled": self.enabled
		}


class EventCompiler:
	"""Compiles event scripts to game bytecode."""

	def __init__(self, game_type: str = "generic"):
		self.game_type = game_type
		self.labels: Dict[str, int] = {}
		self.pending_jumps: List[Tuple[int, str]] = []

		# Command bytecode mappings
		self.command_codes = {
			EventType.NPC_TALK: 0x00,
			EventType.NPC_MOVE: 0x01,
			EventType.ITEM_GIVE: 0x02,
			EventType.ITEM_TAKE: 0x03,
			EventType.FLAG_SET: 0x04,
			EventType.FLAG_CHECK: 0x05,
			EventType.BATTLE_START: 0x06,
			EventType.SHOP_OPEN: 0x07,
			EventType.INN_OPEN: 0x08,
			EventType.HEAL_PARTY: 0x09,
			EventType.TELEPORT: 0x0A,
			EventType.SCREEN_FADE: 0x0B,
			EventType.WAIT: 0x0C,
			EventType.SOUND_PLAY: 0x0D,
			EventType.MUSIC_PLAY: 0x0E,
			EventType.MESSAGE_SHOW: 0x0F,
			EventType.CHOICE_PROMPT: 0x10,
			EventType.CONDITION_IF: 0x11,
			EventType.CONDITION_ELSE: 0x12,
			EventType.CONDITION_END: 0x13,
			EventType.JUMP: 0x14,
			EventType.CALL: 0x15,
			EventType.RETURN: 0x16,
			EventType.LOOP_START: 0x17,
			EventType.LOOP_END: 0x18,
			EventType.VARIABLE_SET: 0x19,
			EventType.VARIABLE_ADD: 0x1A,
			EventType.PARTY_ADD: 0x1B,
			EventType.PARTY_REMOVE: 0x1C,
			EventType.ANIMATION_PLAY: 0x1D,
			EventType.CAMERA_MOVE: 0x1E,
		}

		# Parameter counts per command
		self.param_counts = {
			EventType.NPC_TALK: 1,  # NPC ID
			EventType.NPC_MOVE: 4,  # NPC ID, direction, steps, speed
			EventType.ITEM_GIVE: 2,  # Item ID, count
			EventType.ITEM_TAKE: 2,  # Item ID, count
			EventType.FLAG_SET: 2,  # Flag ID, value
			EventType.FLAG_CHECK: 3,  # Flag ID, value, jump offset
			EventType.BATTLE_START: 1,  # Enemy group ID
			EventType.SHOP_OPEN: 1,  # Shop ID
			EventType.INN_OPEN: 1,  # Price
			EventType.HEAL_PARTY: 0,
			EventType.TELEPORT: 3,  # Map ID, X, Y
			EventType.SCREEN_FADE: 2,  # Direction, frames
			EventType.WAIT: 1,  # Frames
			EventType.SOUND_PLAY: 1,  # Sound ID
			EventType.MUSIC_PLAY: 1,  # Music ID
			EventType.MESSAGE_SHOW: 1,  # Message ID
			EventType.CHOICE_PROMPT: 2,  # Choices count, default
			EventType.CONDITION_IF: 3,  # Type, param, jump offset
			EventType.CONDITION_ELSE: 1,  # Jump offset
			EventType.CONDITION_END: 0,
			EventType.JUMP: 2,  # Offset (16-bit)
			EventType.CALL: 2,  # Event ID (16-bit)
			EventType.RETURN: 0,
			EventType.LOOP_START: 1,  # Count
			EventType.LOOP_END: 0,
			EventType.VARIABLE_SET: 3,  # Var ID, value (16-bit)
			EventType.VARIABLE_ADD: 3,  # Var ID, value (16-bit)
			EventType.PARTY_ADD: 1,  # Character ID
			EventType.PARTY_REMOVE: 1,  # Character ID
			EventType.ANIMATION_PLAY: 2,  # Animation ID, target
			EventType.CAMERA_MOVE: 3,  # X, Y, speed
		}

	def compile(self, script: EventScript) -> bytes:
		"""Compile event script to bytecode."""
		self.labels.clear()
		self.pending_jumps.clear()
		bytecode = bytearray()

		# First pass: collect labels
		offset = 0
		for cmd in script.commands:
			if cmd.label:
				self.labels[cmd.label] = offset

			code = self.command_codes.get(cmd.type, 0xFF)
			bytecode.append(code)
			offset += 1

			# Add parameters
			param_count = self.param_counts.get(cmd.type, len(cmd.params))
			for i, param in enumerate(cmd.params[:param_count]):
				if isinstance(param, str) and param.startswith("@"):
					# Label reference - mark for resolution
					self.pending_jumps.append((len(bytecode), param[1:]))
					bytecode.extend([0x00, 0x00])  # Placeholder
					offset += 2
				elif param > 255:
					# 16-bit parameter
					bytecode.extend([param & 0xFF, (param >> 8) & 0xFF])
					offset += 2
				else:
					bytecode.append(param & 0xFF)
					offset += 1

		# Second pass: resolve labels
		for offset, label in self.pending_jumps:
			if label in self.labels:
				target = self.labels[label]
				bytecode[offset] = target & 0xFF
				bytecode[offset + 1] = (target >> 8) & 0xFF
			else:
				print(f"Warning: Unresolved label '{label}'")

		return bytes(bytecode)

	def decompile(self, data: bytes) -> EventScript:
		"""Decompile bytecode to event script."""
		commands = []
		offset = 0

		# Reverse lookup for command codes
		code_to_type = {v: k for k, v in self.command_codes.items()}

		while offset < len(data):
			code = data[offset]
			offset += 1

			event_type = code_to_type.get(code, EventType.CUSTOM)
			params = []

			# Read parameters
			param_count = self.param_counts.get(event_type, 0)
			for _ in range(param_count):
				if offset >= len(data):
					break
				params.append(data[offset])
				offset += 1

			commands.append(EventCommand(
				type=event_type,
				params=params
			))

		return EventScript(
			id=0,
			name="decompiled",
			commands=commands
		)


class EventProject:
	"""Manages multiple event scripts and triggers."""

	def __init__(self):
		self.scripts: Dict[int, EventScript] = {}
		self.triggers: Dict[int, List[Trigger]] = {}  # Map ID -> triggers
		self.metadata: Dict[str, Any] = {}

	def add_script(self, script: EventScript) -> None:
		"""Add or update a script."""
		self.scripts[script.id] = script

	def get_script(self, script_id: int) -> Optional[EventScript]:
		"""Get script by ID."""
		return self.scripts.get(script_id)

	def add_trigger(self, map_id: int, trigger: Trigger) -> None:
		"""Add trigger to a map."""
		if map_id not in self.triggers:
			self.triggers[map_id] = []
		self.triggers[map_id].append(trigger)

	def get_triggers(self, map_id: int) -> List[Trigger]:
		"""Get all triggers for a map."""
		return self.triggers.get(map_id, [])

	def save(self, filepath: str) -> None:
		"""Save project to JSON file."""
		data = {
			"scripts": {k: v.to_dict() for k, v in self.scripts.items()},
			"triggers": {k: [t.to_dict() for t in v] for k, v in self.triggers.items()},
			"metadata": self.metadata
		}

		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")

	def load(self, filepath: str) -> None:
		"""Load project from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)

		self.scripts = {
			int(k): EventScript.from_dict(v)
			for k, v in data.get("scripts", {}).items()
		}

		self.triggers = {}
		for map_id, trigger_list in data.get("triggers", {}).items():
			self.triggers[int(map_id)] = [
				Trigger(
					id=t.get("id", 0),
					type=t.get("type", "action"),
					x=t.get("x", 0),
					y=t.get("y", 0),
					width=t.get("width", 1),
					height=t.get("height", 1),
					event_id=t.get("event_id", 0),
					conditions=t.get("conditions", []),
					enabled=t.get("enabled", True)
				)
				for t in trigger_list
			]

		self.metadata = data.get("metadata", {})


class EventTextParser:
	"""Parses human-readable event scripts."""

	def __init__(self):
		# Command aliases
		self.aliases = {
			"say": EventType.MESSAGE_SHOW,
			"talk": EventType.NPC_TALK,
			"move": EventType.NPC_MOVE,
			"give": EventType.ITEM_GIVE,
			"take": EventType.ITEM_TAKE,
			"setflag": EventType.FLAG_SET,
			"checkflag": EventType.FLAG_CHECK,
			"battle": EventType.BATTLE_START,
			"shop": EventType.SHOP_OPEN,
			"inn": EventType.INN_OPEN,
			"heal": EventType.HEAL_PARTY,
			"warp": EventType.TELEPORT,
			"fade": EventType.SCREEN_FADE,
			"wait": EventType.WAIT,
			"sound": EventType.SOUND_PLAY,
			"music": EventType.MUSIC_PLAY,
			"choice": EventType.CHOICE_PROMPT,
			"if": EventType.CONDITION_IF,
			"else": EventType.CONDITION_ELSE,
			"endif": EventType.CONDITION_END,
			"jump": EventType.JUMP,
			"call": EventType.CALL,
			"return": EventType.RETURN,
			"loop": EventType.LOOP_START,
			"endloop": EventType.LOOP_END,
			"setvar": EventType.VARIABLE_SET,
			"addvar": EventType.VARIABLE_ADD,
			"addparty": EventType.PARTY_ADD,
			"removeparty": EventType.PARTY_REMOVE,
			"animate": EventType.ANIMATION_PLAY,
			"camera": EventType.CAMERA_MOVE,
		}

	def parse(self, text: str) -> EventScript:
		"""Parse text format event script."""
		commands = []
		script_id = 0
		script_name = "parsed_script"

		lines = text.strip().split("\n")

		for line in lines:
			line = line.strip()

			# Skip empty lines and comments
			if not line or line.startswith("//") or line.startswith("#"):
				continue

			# Handle metadata
			if line.startswith("@script"):
				parts = line.split(maxsplit=2)
				if len(parts) >= 2:
					script_id = int(parts[1])
				if len(parts) >= 3:
					script_name = parts[2].strip('"')
				continue

			# Handle labels
			if line.endswith(":"):
				label = line[:-1]
				# Add a marker command or attach to next
				commands.append(EventCommand(
					type=EventType.CUSTOM,
					params=[],
					label=label,
					comment="Label"
				))
				continue

			# Parse command
			cmd = self._parse_command(line)
			if cmd:
				commands.append(cmd)

		return EventScript(
			id=script_id,
			name=script_name,
			commands=commands
		)

	def _parse_command(self, line: str) -> Optional[EventCommand]:
		"""Parse a single command line."""
		# Extract comment
		comment = ""
		if "//" in line:
			line, comment = line.split("//", 1)
			line = line.strip()
			comment = comment.strip()

		# Split command and arguments
		parts = line.split()
		if not parts:
			return None

		cmd_name = parts[0].lower()
		args = parts[1:]

		# Get event type
		if cmd_name in self.aliases:
			event_type = self.aliases[cmd_name]
		else:
			try:
				event_type = EventType[cmd_name.upper()]
			except KeyError:
				event_type = EventType.CUSTOM

		# Parse parameters
		params = []
		for arg in args:
			if arg.startswith("@"):
				# Label reference
				params.append(arg)
			elif arg.startswith("0x"):
				params.append(int(arg, 16))
			elif arg.isdigit() or (arg[0] == "-" and arg[1:].isdigit()):
				params.append(int(arg))
			else:
				# String or named reference - store as is for now
				params.append(arg)

		return EventCommand(
			type=event_type,
			params=params,
			comment=comment
		)

	def to_text(self, script: EventScript) -> str:
		"""Convert script to text format."""
		lines = []

		# Header
		lines.append(f'@script {script.id} "{script.name}"')
		lines.append("")

		# Commands
		for cmd in script.commands:
			# Label
			if cmd.label:
				lines.append(f"{cmd.label}:")

			# Get command name
			cmd_name = cmd.type.name.lower()
			for alias, etype in self.aliases.items():
				if etype == cmd.type:
					cmd_name = alias
					break

			# Format parameters
			params_str = " ".join(
				f"0x{p:02X}" if isinstance(p, int) and p > 9 else str(p)
				for p in cmd.params
			)

			line = f"\t{cmd_name}"
			if params_str:
				line += f" {params_str}"
			if cmd.comment:
				line += f"  // {cmd.comment}"

			lines.append(line)

		return "\n".join(lines)


class EventValidator:
	"""Validates event scripts for errors."""

	def __init__(self):
		self.errors: List[str] = []
		self.warnings: List[str] = []

	def validate(self, script: EventScript) -> bool:
		"""Validate a script, return True if valid."""
		self.errors.clear()
		self.warnings.clear()

		labels = set()
		label_refs = set()
		if_depth = 0
		loop_depth = 0

		for i, cmd in enumerate(script.commands):
			# Track labels
			if cmd.label:
				if cmd.label in labels:
					self.errors.append(f"Duplicate label '{cmd.label}' at command {i}")
				labels.add(cmd.label)

			# Track label references
			for param in cmd.params:
				if isinstance(param, str) and param.startswith("@"):
					label_refs.add(param[1:])

			# Validate control flow
			if cmd.type == EventType.CONDITION_IF:
				if_depth += 1
			elif cmd.type == EventType.CONDITION_END:
				if_depth -= 1
				if if_depth < 0:
					self.errors.append(f"Unmatched endif at command {i}")
			elif cmd.type == EventType.LOOP_START:
				loop_depth += 1
			elif cmd.type == EventType.LOOP_END:
				loop_depth -= 1
				if loop_depth < 0:
					self.errors.append(f"Unmatched endloop at command {i}")

		# Check final depths
		if if_depth > 0:
			self.errors.append(f"Missing {if_depth} endif(s)")
		if loop_depth > 0:
			self.errors.append(f"Missing {loop_depth} endloop(s)")

		# Check unresolved labels
		unresolved = label_refs - labels
		for label in unresolved:
			self.errors.append(f"Unresolved label reference '@{label}'")

		# Warnings for unused labels
		unused = labels - label_refs
		for label in unused:
			self.warnings.append(f"Unused label '{label}'")

		return len(self.errors) == 0


def create_gui():
	"""Create the event editor GUI."""
	try:
		import tkinter as tk
		from tkinter import ttk, filedialog, messagebox, scrolledtext
	except ImportError:
		print("Error: tkinter is required for GUI mode")
		print("Install with: pip install tk")
		return None

	class EventEditorGUI:
		def __init__(self, root):
			self.root = root
			self.root.title("Event Editor")
			self.root.geometry("1200x800")

			self.project = EventProject()
			self.current_script: Optional[EventScript] = None
			self.parser = EventTextParser()
			self.compiler = EventCompiler()
			self.validator = EventValidator()

			self.setup_ui()

		def setup_ui(self):
			"""Set up the user interface."""
			# Menu bar
			menubar = tk.Menu(self.root)
			self.root.config(menu=menubar)

			# File menu
			file_menu = tk.Menu(menubar, tearoff=0)
			menubar.add_cascade(label="File", menu=file_menu)
			file_menu.add_command(label="New Project", command=self.new_project)
			file_menu.add_command(label="Open Project...", command=self.open_project)
			file_menu.add_command(label="Save Project", command=self.save_project)
			file_menu.add_command(label="Save Project As...", command=self.save_project_as)
			file_menu.add_separator()
			file_menu.add_command(label="Import Script...", command=self.import_script)
			file_menu.add_command(label="Export Script...", command=self.export_script)
			file_menu.add_separator()
			file_menu.add_command(label="Exit", command=self.root.quit)

			# Edit menu
			edit_menu = tk.Menu(menubar, tearoff=0)
			menubar.add_cascade(label="Edit", menu=edit_menu)
			edit_menu.add_command(label="New Script", command=self.new_script)
			edit_menu.add_command(label="Delete Script", command=self.delete_script)
			edit_menu.add_separator()
			edit_menu.add_command(label="Add Command", command=self.add_command)
			edit_menu.add_command(label="Delete Command", command=self.delete_command)

			# Tools menu
			tools_menu = tk.Menu(menubar, tearoff=0)
			menubar.add_cascade(label="Tools", menu=tools_menu)
			tools_menu.add_command(label="Validate Script", command=self.validate_script)
			tools_menu.add_command(label="Compile Script", command=self.compile_script)
			tools_menu.add_command(label="Decompile Binary...", command=self.decompile_binary)

			# Main paned window
			main_pane = ttk.PanedWindow(self.root, orient=tk.HORIZONTAL)
			main_pane.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

			# Left panel - script list
			left_frame = ttk.Frame(main_pane)
			main_pane.add(left_frame, weight=1)

			ttk.Label(left_frame, text="Scripts:").pack(anchor=tk.W)

			self.script_list = tk.Listbox(left_frame, width=30)
			self.script_list.pack(fill=tk.BOTH, expand=True)
			self.script_list.bind("<<ListboxSelect>>", self.on_script_select)

			# Script list buttons
			btn_frame = ttk.Frame(left_frame)
			btn_frame.pack(fill=tk.X)
			ttk.Button(btn_frame, text="+", width=3, command=self.new_script).pack(side=tk.LEFT)
			ttk.Button(btn_frame, text="-", width=3, command=self.delete_script).pack(side=tk.LEFT)

			# Right panel - editor
			right_frame = ttk.Frame(main_pane)
			main_pane.add(right_frame, weight=3)

			# Script info
			info_frame = ttk.LabelFrame(right_frame, text="Script Info")
			info_frame.pack(fill=tk.X, pady=(0, 5))

			ttk.Label(info_frame, text="ID:").grid(row=0, column=0, padx=5, pady=2)
			self.script_id_var = tk.StringVar()
			ttk.Entry(info_frame, textvariable=self.script_id_var, width=10).grid(row=0, column=1, padx=5, pady=2)

			ttk.Label(info_frame, text="Name:").grid(row=0, column=2, padx=5, pady=2)
			self.script_name_var = tk.StringVar()
			ttk.Entry(info_frame, textvariable=self.script_name_var, width=30).grid(row=0, column=3, padx=5, pady=2)

			# Notebook for different views
			self.notebook = ttk.Notebook(right_frame)
			self.notebook.pack(fill=tk.BOTH, expand=True)

			# Text view tab
			text_frame = ttk.Frame(self.notebook)
			self.notebook.add(text_frame, text="Text View")

			self.text_editor = scrolledtext.ScrolledText(text_frame, wrap=tk.NONE, font=("Consolas", 10))
			self.text_editor.pack(fill=tk.BOTH, expand=True)

			# Command list view tab
			cmd_frame = ttk.Frame(self.notebook)
			self.notebook.add(cmd_frame, text="Command View")

			# Command treeview
			columns = ("type", "params", "comment")
			self.cmd_tree = ttk.Treeview(cmd_frame, columns=columns, show="headings")
			self.cmd_tree.heading("type", text="Command")
			self.cmd_tree.heading("params", text="Parameters")
			self.cmd_tree.heading("comment", text="Comment")
			self.cmd_tree.column("type", width=150)
			self.cmd_tree.column("params", width=200)
			self.cmd_tree.column("comment", width=200)

			cmd_scroll = ttk.Scrollbar(cmd_frame, orient=tk.VERTICAL, command=self.cmd_tree.yview)
			self.cmd_tree.configure(yscrollcommand=cmd_scroll.set)
			self.cmd_tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
			cmd_scroll.pack(side=tk.RIGHT, fill=tk.Y)

			# Hex view tab
			hex_frame = ttk.Frame(self.notebook)
			self.notebook.add(hex_frame, text="Hex View")

			self.hex_view = scrolledtext.ScrolledText(hex_frame, wrap=tk.NONE, font=("Consolas", 10))
			self.hex_view.pack(fill=tk.BOTH, expand=True)

			# Status bar
			self.status_var = tk.StringVar(value="Ready")
			status_bar = ttk.Label(self.root, textvariable=self.status_var, relief=tk.SUNKEN)
			status_bar.pack(fill=tk.X, side=tk.BOTTOM)

		def new_project(self):
			"""Create a new project."""
			self.project = EventProject()
			self.current_script = None
			self.refresh_script_list()
			self.clear_editor()
			self.status_var.set("New project created")

		def open_project(self):
			"""Open a project file."""
			filepath = filedialog.askopenfilename(
				filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
			)
			if filepath:
				try:
					self.project.load(filepath)
					self.refresh_script_list()
					self.status_var.set(f"Opened: {filepath}")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to open project: {e}")

		def save_project(self):
			"""Save current project."""
			if hasattr(self, "project_path") and self.project_path:
				try:
					self.project.save(self.project_path)
					self.status_var.set(f"Saved: {self.project_path}")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to save project: {e}")
			else:
				self.save_project_as()

		def save_project_as(self):
			"""Save project with new name."""
			filepath = filedialog.asksaveasfilename(
				defaultextension=".json",
				filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
			)
			if filepath:
				try:
					self.project.save(filepath)
					self.project_path = filepath
					self.status_var.set(f"Saved: {filepath}")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to save project: {e}")

		def import_script(self):
			"""Import a script from text file."""
			filepath = filedialog.askopenfilename(
				filetypes=[("Text files", "*.txt"), ("Event files", "*.evt"), ("All files", "*.*")]
			)
			if filepath:
				try:
					with open(filepath, "r", encoding="utf-8") as f:
						text = f.read()
					script = self.parser.parse(text)
					self.project.add_script(script)
					self.refresh_script_list()
					self.status_var.set(f"Imported: {filepath}")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to import script: {e}")

		def export_script(self):
			"""Export current script to text file."""
			if not self.current_script:
				messagebox.showwarning("Warning", "No script selected")
				return

			filepath = filedialog.asksaveasfilename(
				defaultextension=".txt",
				filetypes=[("Text files", "*.txt"), ("Event files", "*.evt"), ("All files", "*.*")]
			)
			if filepath:
				try:
					text = self.parser.to_text(self.current_script)
					with open(filepath, "w", encoding="utf-8") as f:
						f.write(text)
					self.status_var.set(f"Exported: {filepath}")
				except Exception as e:
					messagebox.showerror("Error", f"Failed to export script: {e}")

		def new_script(self):
			"""Create a new script."""
			# Find next available ID
			used_ids = set(self.project.scripts.keys())
			new_id = 0
			while new_id in used_ids:
				new_id += 1

			script = EventScript(id=new_id, name=f"Script_{new_id}")
			self.project.add_script(script)
			self.refresh_script_list()

			# Select the new script
			for i, (sid, s) in enumerate(sorted(self.project.scripts.items())):
				if sid == new_id:
					self.script_list.selection_clear(0, tk.END)
					self.script_list.selection_set(i)
					self.on_script_select(None)
					break

		def delete_script(self):
			"""Delete selected script."""
			if not self.current_script:
				return

			if messagebox.askyesno("Confirm", "Delete this script?"):
				del self.project.scripts[self.current_script.id]
				self.current_script = None
				self.refresh_script_list()
				self.clear_editor()

		def add_command(self):
			"""Add a new command to current script."""
			if not self.current_script:
				messagebox.showwarning("Warning", "No script selected")
				return

			cmd = EventCommand(type=EventType.MESSAGE_SHOW, params=[0])
			self.current_script.commands.append(cmd)
			self.refresh_editor()

		def delete_command(self):
			"""Delete selected command."""
			if not self.current_script:
				return

			selection = self.cmd_tree.selection()
			if selection:
				idx = self.cmd_tree.index(selection[0])
				if 0 <= idx < len(self.current_script.commands):
					del self.current_script.commands[idx]
					self.refresh_editor()

		def validate_script(self):
			"""Validate current script."""
			if not self.current_script:
				messagebox.showwarning("Warning", "No script selected")
				return

			if self.validator.validate(self.current_script):
				msg = "Script is valid!"
				if self.validator.warnings:
					msg += "\n\nWarnings:\n" + "\n".join(self.validator.warnings)
				messagebox.showinfo("Validation", msg)
			else:
				msg = "Errors:\n" + "\n".join(self.validator.errors)
				if self.validator.warnings:
					msg += "\n\nWarnings:\n" + "\n".join(self.validator.warnings)
				messagebox.showerror("Validation Failed", msg)

		def compile_script(self):
			"""Compile current script to bytecode."""
			if not self.current_script:
				messagebox.showwarning("Warning", "No script selected")
				return

			try:
				bytecode = self.compiler.compile(self.current_script)

				# Update hex view
				hex_str = " ".join(f"{b:02X}" for b in bytecode)
				self.hex_view.delete("1.0", tk.END)
				self.hex_view.insert("1.0", hex_str)

				self.notebook.select(2)  # Switch to hex view
				self.status_var.set(f"Compiled: {len(bytecode)} bytes")
			except Exception as e:
				messagebox.showerror("Error", f"Compilation failed: {e}")

		def decompile_binary(self):
			"""Decompile binary file."""
			filepath = filedialog.askopenfilename(
				filetypes=[("Binary files", "*.bin"), ("All files", "*.*")]
			)
			if filepath:
				try:
					with open(filepath, "rb") as f:
						data = f.read()
					script = self.compiler.decompile(data)
					self.project.add_script(script)
					self.refresh_script_list()
					self.status_var.set(f"Decompiled: {filepath}")
				except Exception as e:
					messagebox.showerror("Error", f"Decompilation failed: {e}")

		def refresh_script_list(self):
			"""Refresh the script list."""
			self.script_list.delete(0, tk.END)
			for script_id, script in sorted(self.project.scripts.items()):
				self.script_list.insert(tk.END, f"{script_id}: {script.name}")

		def on_script_select(self, event):
			"""Handle script selection."""
			selection = self.script_list.curselection()
			if selection:
				idx = selection[0]
				script_ids = sorted(self.project.scripts.keys())
				if idx < len(script_ids):
					self.current_script = self.project.scripts[script_ids[idx]]
					self.refresh_editor()

		def refresh_editor(self):
			"""Refresh the editor with current script."""
			if not self.current_script:
				return

			# Update info fields
			self.script_id_var.set(str(self.current_script.id))
			self.script_name_var.set(self.current_script.name)

			# Update text view
			text = self.parser.to_text(self.current_script)
			self.text_editor.delete("1.0", tk.END)
			self.text_editor.insert("1.0", text)

			# Update command tree
			self.cmd_tree.delete(*self.cmd_tree.get_children())
			for cmd in self.current_script.commands:
				self.cmd_tree.insert("", tk.END, values=(
					cmd.type.name if isinstance(cmd.type, EventType) else f"0x{cmd.type:02X}",
					", ".join(str(p) for p in cmd.params),
					cmd.comment
				))

		def clear_editor(self):
			"""Clear the editor."""
			self.script_id_var.set("")
			self.script_name_var.set("")
			self.text_editor.delete("1.0", tk.END)
			self.cmd_tree.delete(*self.cmd_tree.get_children())
			self.hex_view.delete("1.0", tk.END)

		def run(self):
			"""Run the application."""
			self.root.mainloop()

	root = tk.Tk()
	return EventEditorGUI(root)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Event Editor")
	parser.add_argument("file", nargs="?", help="Event script or project file")
	parser.add_argument("--project", "-p", help="Open project file")
	parser.add_argument("--compile", "-c", help="Compile script to binary")
	parser.add_argument("--decompile", "-d", help="Decompile binary to script")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--no-gui", action="store_true", help="Run without GUI")

	args = parser.parse_args()

	if args.compile:
		# Command-line compilation
		text_parser = EventTextParser()
		compiler = EventCompiler()

		with open(args.compile, "r", encoding="utf-8") as f:
			text = f.read()

		script = text_parser.parse(text)
		bytecode = compiler.compile(script)

		output = args.output or args.compile.replace(".txt", ".bin").replace(".evt", ".bin")
		with open(output, "wb") as f:
			f.write(bytecode)

		print(f"Compiled to: {output} ({len(bytecode)} bytes)")
		return

	if args.decompile:
		# Command-line decompilation
		compiler = EventCompiler()
		text_parser = EventTextParser()

		with open(args.decompile, "rb") as f:
			data = f.read()

		script = compiler.decompile(data)
		text = text_parser.to_text(script)

		output = args.output or args.decompile.replace(".bin", ".txt")
		with open(output, "w", encoding="utf-8") as f:
			f.write(text)

		print(f"Decompiled to: {output}")
		return

	if args.no_gui:
		print("Event Editor - Command Line Mode")
		print("Use --compile or --decompile for batch processing")
		return

	# Launch GUI
	app = create_gui()
	if app:
		if args.project:
			app.project.load(args.project)
			app.refresh_script_list()
		elif args.file:
			if args.file.endswith(".json"):
				app.project.load(args.file)
				app.refresh_script_list()
			else:
				with open(args.file, "r", encoding="utf-8") as f:
					text = f.read()
				script = app.parser.parse(text)
				app.project.add_script(script)
				app.refresh_script_list()

		app.run()
	else:
		print("GUI not available. Use --no-gui for command-line mode.")


if __name__ == "__main__":
	main()
