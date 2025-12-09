#!/usr/bin/env python3
"""
Cutscene Script Editor - Create and edit game cutscenes.

Tools for scripting cutscene sequences including dialogue,
camera movements, animations, and timing.

Usage:
	python cutscene_editor.py <cutscene.json>
	python cutscene_editor.py --preview
	python cutscene_editor.py --export-script

Features:
	- Scene sequence editing
	- Dialogue management
	- Camera control scripting
	- Animation triggers
	- Timing and sync
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union


class CommandType(Enum):
	"""Cutscene command types."""
	DIALOGUE = auto()
	CAMERA = auto()
	ACTOR = auto()
	ANIMATION = auto()
	SOUND = auto()
	MUSIC = auto()
	WAIT = auto()
	FADE = auto()
	SCREEN_EFFECT = auto()
	BATTLE = auto()
	FLAG = auto()
	BRANCH = auto()
	CHOICE = auto()
	VARIABLE = auto()
	JUMP = auto()
	END = auto()


class ActorAction(Enum):
	"""Actor actions."""
	SPAWN = auto()
	DESPAWN = auto()
	MOVE = auto()
	TURN = auto()
	EMOTE = auto()
	POSE = auto()
	HIDE = auto()
	SHOW = auto()


class CameraAction(Enum):
	"""Camera actions."""
	PAN = auto()
	ZOOM = auto()
	FOCUS = auto()
	SHAKE = auto()
	RESET = auto()


class FadeType(Enum):
	"""Screen fade types."""
	FADE_IN = auto()
	FADE_OUT = auto()
	FADE_TO_BLACK = auto()
	FADE_TO_WHITE = auto()
	CROSSFADE = auto()


class Direction(Enum):
	"""Facing directions."""
	UP = auto()
	DOWN = auto()
	LEFT = auto()
	RIGHT = auto()


@dataclass
class DialogueCommand:
	"""Dialogue command data."""
	speaker: str
	text: str
	portrait: str = ""
	position: str = "bottom"  # bottom, top, middle
	auto_advance: bool = False
	advance_delay: float = 0.0
	voice_id: str = ""
	emotion: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"speaker": self.speaker,
			"text": self.text
		}
		if self.portrait:
			result["portrait"] = self.portrait
		if self.position != "bottom":
			result["position"] = self.position
		if self.auto_advance:
			result["auto"] = True
			result["delay"] = self.advance_delay
		if self.voice_id:
			result["voice"] = self.voice_id
		if self.emotion:
			result["emotion"] = self.emotion
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "DialogueCommand":
		"""Create from dictionary."""
		return cls(
			speaker=data.get("speaker", ""),
			text=data.get("text", ""),
			portrait=data.get("portrait", ""),
			position=data.get("position", "bottom"),
			auto_advance=data.get("auto", False),
			advance_delay=data.get("delay", 0.0),
			voice_id=data.get("voice", ""),
			emotion=data.get("emotion", "")
		)


@dataclass
class ActorCommand:
	"""Actor command data."""
	actor_id: str
	action: ActorAction
	target_x: int = 0
	target_y: int = 0
	direction: Optional[Direction] = None
	speed: float = 1.0
	animation: str = ""
	wait: bool = True
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"actor": self.actor_id,
			"action": self.action.name
		}
		if self.action in [ActorAction.MOVE, ActorAction.SPAWN]:
			result["x"] = self.target_x
			result["y"] = self.target_y
		if self.direction:
			result["direction"] = self.direction.name
		if self.speed != 1.0:
			result["speed"] = self.speed
		if self.animation:
			result["animation"] = self.animation
		if not self.wait:
			result["wait"] = False
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "ActorCommand":
		"""Create from dictionary."""
		return cls(
			actor_id=data["actor"],
			action=ActorAction[data["action"]],
			target_x=data.get("x", 0),
			target_y=data.get("y", 0),
			direction=Direction[data["direction"]] if "direction" in data else None,
			speed=data.get("speed", 1.0),
			animation=data.get("animation", ""),
			wait=data.get("wait", True)
		)


@dataclass
class CameraCommand:
	"""Camera command data."""
	action: CameraAction
	target_x: int = 0
	target_y: int = 0
	zoom: float = 1.0
	duration: float = 1.0
	actor_focus: str = ""  # Actor to focus on
	intensity: float = 1.0  # For shake
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"action": self.action.name}
		if self.action in [CameraAction.PAN, CameraAction.FOCUS]:
			if self.actor_focus:
				result["focus"] = self.actor_focus
			else:
				result["x"] = self.target_x
				result["y"] = self.target_y
		if self.action == CameraAction.ZOOM:
			result["zoom"] = self.zoom
		if self.action == CameraAction.SHAKE:
			result["intensity"] = self.intensity
		result["duration"] = self.duration
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "CameraCommand":
		"""Create from dictionary."""
		return cls(
			action=CameraAction[data["action"]],
			target_x=data.get("x", 0),
			target_y=data.get("y", 0),
			zoom=data.get("zoom", 1.0),
			duration=data.get("duration", 1.0),
			actor_focus=data.get("focus", ""),
			intensity=data.get("intensity", 1.0)
		)


@dataclass
class CutsceneCommand:
	"""A command in a cutscene."""
	command_type: CommandType
	label: str = ""  # Optional label for jumps
	data: Dict[str, Any] = field(default_factory=dict)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"type": self.command_type.name}
		if self.label:
			result["label"] = self.label
		result.update(self.data)
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "CutsceneCommand":
		"""Create from dictionary."""
		cmd_type = CommandType[data["type"]]
		label = data.get("label", "")
		cmd_data = {k: v for k, v in data.items() if k not in ["type", "label"]}
		
		return cls(
			command_type=cmd_type,
			label=label,
			data=cmd_data
		)
	
	def get_duration(self) -> float:
		"""Estimate command duration in seconds."""
		if self.command_type == CommandType.WAIT:
			return self.data.get("time", 0)
		elif self.command_type == CommandType.FADE:
			return self.data.get("duration", 1.0)
		elif self.command_type == CommandType.CAMERA:
			return self.data.get("duration", 1.0)
		elif self.command_type == CommandType.DIALOGUE:
			# Estimate based on text length
			text = self.data.get("text", "")
			words = len(text.split())
			return max(2.0, words * 0.3)  # ~3 words per second
		return 0
	
	def get_description(self) -> str:
		"""Get human-readable description."""
		if self.command_type == CommandType.DIALOGUE:
			speaker = self.data.get("speaker", "???")
			text = self.data.get("text", "")[:40]
			return f'{speaker}: "{text}..."'
		elif self.command_type == CommandType.ACTOR:
			actor = self.data.get("actor", "???")
			action = self.data.get("action", "???")
			return f"{actor}: {action}"
		elif self.command_type == CommandType.CAMERA:
			action = self.data.get("action", "???")
			return f"Camera: {action}"
		elif self.command_type == CommandType.WAIT:
			time = self.data.get("time", 0)
			return f"Wait {time}s"
		elif self.command_type == CommandType.FADE:
			fade_type = self.data.get("fade_type", "FADE_OUT")
			return f"Fade: {fade_type}"
		elif self.command_type == CommandType.MUSIC:
			track = self.data.get("track", "")
			return f"Music: {track}"
		elif self.command_type == CommandType.SOUND:
			sound = self.data.get("sound", "")
			return f"SFX: {sound}"
		return self.command_type.name


@dataclass
class Cutscene:
	"""A complete cutscene."""
	cutscene_id: str
	name: str
	description: str = ""
	commands: List[CutsceneCommand] = field(default_factory=list)
	
	# Scene setup
	location: str = ""
	background: str = ""
	starting_actors: List[str] = field(default_factory=list)
	bgm: str = ""
	
	# Metadata
	trigger: str = ""  # How cutscene is triggered
	skippable: bool = True
	flags_required: List[str] = field(default_factory=list)
	flags_set: List[str] = field(default_factory=list)
	
	def get_total_duration(self) -> float:
		"""Estimate total cutscene duration."""
		return sum(cmd.get_duration() for cmd in self.commands)
	
	def get_dialogue_count(self) -> int:
		"""Count dialogue lines."""
		return sum(1 for cmd in self.commands 
				   if cmd.command_type == CommandType.DIALOGUE)
	
	def get_actors(self) -> List[str]:
		"""Get all actors used."""
		actors = set(self.starting_actors)
		for cmd in self.commands:
			if cmd.command_type == CommandType.ACTOR:
				actors.add(cmd.data.get("actor", ""))
			elif cmd.command_type == CommandType.CAMERA:
				focus = cmd.data.get("focus", "")
				if focus:
					actors.add(focus)
		return list(actors)
	
	def get_speakers(self) -> List[str]:
		"""Get unique speakers."""
		speakers = set()
		for cmd in self.commands:
			if cmd.command_type == CommandType.DIALOGUE:
				speakers.add(cmd.data.get("speaker", ""))
		return list(speakers)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.cutscene_id,
			"name": self.name
		}
		
		if self.description:
			result["description"] = self.description
		if self.location:
			result["location"] = self.location
		if self.background:
			result["background"] = self.background
		if self.starting_actors:
			result["actors"] = self.starting_actors
		if self.bgm:
			result["bgm"] = self.bgm
		if self.trigger:
			result["trigger"] = self.trigger
		if not self.skippable:
			result["skippable"] = False
		if self.flags_required:
			result["requires"] = self.flags_required
		if self.flags_set:
			result["sets"] = self.flags_set
		
		result["commands"] = [cmd.to_dict() for cmd in self.commands]
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Cutscene":
		"""Create from dictionary."""
		commands = [CutsceneCommand.from_dict(c) for c in data.get("commands", [])]
		
		return cls(
			cutscene_id=data["id"],
			name=data["name"],
			description=data.get("description", ""),
			commands=commands,
			location=data.get("location", ""),
			background=data.get("background", ""),
			starting_actors=data.get("actors", []),
			bgm=data.get("bgm", ""),
			trigger=data.get("trigger", ""),
			skippable=data.get("skippable", True),
			flags_required=data.get("requires", []),
			flags_set=data.get("sets", [])
		)


class CutsceneManager:
	"""Manage cutscenes."""
	
	def __init__(self):
		self.cutscenes: Dict[str, Cutscene] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add(self, cutscene: Cutscene) -> None:
		"""Add cutscene."""
		self.cutscenes[cutscene.cutscene_id] = cutscene
	
	def get(self, cutscene_id: str) -> Optional[Cutscene]:
		"""Get cutscene by ID."""
		return self.cutscenes.get(cutscene_id)
	
	def get_by_location(self, location: str) -> List[Cutscene]:
		"""Get cutscenes at location."""
		return [c for c in self.cutscenes.values() if c.location == location]
	
	def get_by_trigger(self, trigger: str) -> List[Cutscene]:
		"""Get cutscenes with trigger type."""
		return [c for c in self.cutscenes.values() if c.trigger == trigger]
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get statistics."""
		total_duration = 0
		total_dialogue = 0
		speakers = set()
		
		for cutscene in self.cutscenes.values():
			total_duration += cutscene.get_total_duration()
			total_dialogue += cutscene.get_dialogue_count()
			speakers.update(cutscene.get_speakers())
		
		return {
			"total_cutscenes": len(self.cutscenes),
			"total_duration": total_duration,
			"total_dialogue": total_dialogue,
			"unique_speakers": len(speakers),
			"speakers": list(speakers)
		}
	
	def validate(self) -> List[str]:
		"""Validate cutscenes."""
		issues = []
		
		for cutscene in self.cutscenes.values():
			if not cutscene.commands:
				issues.append(f"Cutscene '{cutscene.name}': No commands")
			
			# Check for orphan labels
			labels = set()
			jump_targets = set()
			for cmd in cutscene.commands:
				if cmd.label:
					labels.add(cmd.label)
				if cmd.command_type == CommandType.JUMP:
					jump_targets.add(cmd.data.get("target", ""))
			
			for target in jump_targets:
				if target and target not in labels:
					issues.append(
						f"Cutscene '{cutscene.name}': Unknown jump target '{target}'"
					)
		
		return issues
	
	def export_script(self, cutscene_id: str) -> str:
		"""Export cutscene as readable script."""
		cutscene = self.get(cutscene_id)
		if not cutscene:
			return ""
		
		lines = []
		lines.append(f"# {cutscene.name}")
		lines.append(f"# {cutscene.description}")
		lines.append("")
		
		if cutscene.location:
			lines.append(f"[Location: {cutscene.location}]")
		if cutscene.bgm:
			lines.append(f"[BGM: {cutscene.bgm}]")
		lines.append("")
		
		for i, cmd in enumerate(cutscene.commands):
			if cmd.label:
				lines.append(f":{cmd.label}")
			
			if cmd.command_type == CommandType.DIALOGUE:
				speaker = cmd.data.get("speaker", "???")
				text = cmd.data.get("text", "")
				emotion = cmd.data.get("emotion", "")
				if emotion:
					lines.append(f"{speaker} ({emotion}):")
				else:
					lines.append(f"{speaker}:")
				lines.append(f'  "{text}"')
				lines.append("")
			
			elif cmd.command_type == CommandType.ACTOR:
				lines.append(f"  [{cmd.get_description()}]")
			
			elif cmd.command_type == CommandType.CAMERA:
				lines.append(f"  [{cmd.get_description()}]")
			
			elif cmd.command_type == CommandType.WAIT:
				time = cmd.data.get("time", 0)
				lines.append(f"  [Wait {time}s]")
			
			elif cmd.command_type == CommandType.FADE:
				lines.append(f"  [{cmd.get_description()}]")
			
			elif cmd.command_type == CommandType.MUSIC:
				lines.append(f"  [Music: {cmd.data.get('track', '?')}]")
			
			elif cmd.command_type == CommandType.SOUND:
				lines.append(f"  [SFX: {cmd.data.get('sound', '?')}]")
			
			elif cmd.command_type == CommandType.CHOICE:
				lines.append("  [CHOICE]")
				for choice in cmd.data.get("choices", []):
					lines.append(f"    - {choice.get('text', '?')} -> {choice.get('target', '?')}")
		
		lines.append("")
		lines.append("[END]")
		
		return "\n".join(lines)
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for cs_data in data.get("cutscenes", []):
			cutscene = Cutscene.from_dict(cs_data)
			self.add(cutscene)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"metadata": self.metadata,
			"cutscenes": [c.to_dict() for c in self.cutscenes.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_cutscenes() -> CutsceneManager:
	"""Create example cutscene data."""
	manager = CutsceneManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Opening cutscene
	opening = Cutscene(
		cutscene_id="opening",
		name="Opening",
		description="The game's opening cutscene.",
		location="castle_throne",
		background="throne_room",
		starting_actors=["king", "hero"],
		bgm="royal_fanfare",
		trigger="game_start",
		skippable=False,
		flags_set=["opening_complete"]
	)
	
	opening.commands = [
		CutsceneCommand(CommandType.FADE, data={
			"fade_type": "FADE_IN",
			"duration": 2.0
		}),
		CutsceneCommand(CommandType.WAIT, data={"time": 1.0}),
		CutsceneCommand(CommandType.CAMERA, data={
			"action": "PAN",
			"focus": "king",
			"duration": 1.5
		}),
		CutsceneCommand(CommandType.DIALOGUE, data={
			"speaker": "King",
			"text": "Hero, thank you for answering my summons.",
			"portrait": "king_normal",
			"emotion": "serious"
		}),
		CutsceneCommand(CommandType.ACTOR, data={
			"actor": "hero",
			"action": "TURN",
			"direction": "UP"
		}),
		CutsceneCommand(CommandType.DIALOGUE, data={
			"speaker": "Hero",
			"text": "I came as quickly as I could, Your Majesty. What troubles the kingdom?",
			"portrait": "hero_normal"
		}),
		CutsceneCommand(CommandType.CAMERA, data={
			"action": "SHAKE",
			"intensity": 0.5,
			"duration": 1.0
		}),
		CutsceneCommand(CommandType.SOUND, data={"sound": "rumble"}),
		CutsceneCommand(CommandType.DIALOGUE, data={
			"speaker": "King",
			"text": "The Dark Lord has awakened. Only you can stop him!",
			"portrait": "king_worried",
			"emotion": "worried"
		}),
		CutsceneCommand(CommandType.CHOICE, label="choice_accept", data={
			"choices": [
				{"text": "I accept this quest!", "target": "accept"},
				{"text": "Tell me more first.", "target": "more_info"}
			]
		}),
		CutsceneCommand(CommandType.DIALOGUE, label="accept", data={
			"speaker": "King",
			"text": "Brave hero! Take this sword and may the light guide you!",
			"portrait": "king_happy"
		}),
		CutsceneCommand(CommandType.JUMP, data={"target": "end_scene"}),
		CutsceneCommand(CommandType.DIALOGUE, label="more_info", data={
			"speaker": "King",
			"text": "The Dark Lord seeks the four elemental crystals...",
			"portrait": "king_normal"
		}),
		CutsceneCommand(CommandType.JUMP, data={"target": "choice_accept"}),
		CutsceneCommand(CommandType.FADE, label="end_scene", data={
			"fade_type": "FADE_OUT",
			"duration": 1.5
		}),
		CutsceneCommand(CommandType.END)
	]
	
	manager.add(opening)
	
	# Boss intro
	boss_intro = Cutscene(
		cutscene_id="boss_dark_lord",
		name="Dark Lord Appears",
		description="The Dark Lord reveals himself.",
		location="dark_tower_top",
		background="tower_summit",
		starting_actors=["hero", "dark_lord"],
		bgm="boss_theme",
		trigger="reach_tower_top",
		flags_required=["crystals_collected"]
	)
	
	boss_intro.commands = [
		CutsceneCommand(CommandType.MUSIC, data={"track": "silence"}),
		CutsceneCommand(CommandType.ACTOR, data={
			"actor": "dark_lord",
			"action": "SPAWN",
			"x": 160,
			"y": 80
		}),
		CutsceneCommand(CommandType.SOUND, data={"sound": "thunder"}),
		CutsceneCommand(CommandType.CAMERA, data={
			"action": "SHAKE",
			"intensity": 1.0,
			"duration": 2.0
		}),
		CutsceneCommand(CommandType.DIALOGUE, data={
			"speaker": "Dark Lord",
			"text": "So, you've finally arrived, little hero.",
			"portrait": "dark_lord",
			"emotion": "sinister"
		}),
		CutsceneCommand(CommandType.DIALOGUE, data={
			"speaker": "Hero",
			"text": "Your reign of terror ends here!",
			"portrait": "hero_angry"
		}),
		CutsceneCommand(CommandType.MUSIC, data={"track": "boss_theme"}),
		CutsceneCommand(CommandType.BATTLE, data={
			"enemy_formation": "dark_lord_final"
		}),
		CutsceneCommand(CommandType.END)
	]
	
	manager.add(boss_intro)
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Cutscene Script Editor")
	parser.add_argument("datafile", nargs="?", help="Cutscene JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all cutscenes")
	parser.add_argument("--show", "-s", help="Show cutscene details")
	parser.add_argument("--script", help="Export cutscene as script")
	parser.add_argument("--stats", action="store_true",
						help="Show statistics")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate cutscenes")
	parser.add_argument("--create-example", action="store_true",
						help="Create example data")
	parser.add_argument("--export", "-e", help="Export to file")
	
	args = parser.parse_args()
	
	manager = CutsceneManager()
	
	if args.create_example:
		manager = create_example_cutscenes()
		output = args.datafile or "cutscenes.json"
		manager.save(output)
		print(f"Created example data: {output}")
		return
	
	if args.datafile and os.path.exists(args.datafile):
		manager.load(args.datafile)
		print(f"Loaded: {args.datafile}")
	else:
		manager = create_example_cutscenes()
		print("Cutscene Editor - Demo Mode")
	
	print(f"Cutscenes: {len(manager.cutscenes)}")
	print()
	
	# List
	if args.list:
		print("All Cutscenes:")
		for cs in manager.cutscenes.values():
			duration = cs.get_total_duration()
			dialogue = cs.get_dialogue_count()
			print(f"  [{cs.cutscene_id}] {cs.name}")
			print(f"    Duration: ~{duration:.0f}s, Dialogue: {dialogue} lines")
			if cs.location:
				print(f"    Location: {cs.location}")
		print()
	
	# Show details
	if args.show:
		cs = manager.get(args.show)
		if cs:
			print(f"Cutscene: {cs.name}")
			print(f"  ID: {cs.cutscene_id}")
			print(f"  Location: {cs.location or 'N/A'}")
			print(f"  Trigger: {cs.trigger or 'N/A'}")
			print(f"  Skippable: {cs.skippable}")
			print(f"  Duration: ~{cs.get_total_duration():.0f}s")
			print(f"  Commands: {len(cs.commands)}")
			print(f"  Dialogue: {cs.get_dialogue_count()} lines")
			print(f"  Actors: {', '.join(cs.get_actors()) or 'None'}")
			print(f"  Speakers: {', '.join(cs.get_speakers()) or 'None'}")
			print("\nCommand Sequence:")
			for i, cmd in enumerate(cs.commands):
				label = f" :{cmd.label}" if cmd.label else ""
				print(f"  {i+1:3}. {cmd.get_description()}{label}")
		else:
			print(f"Cutscene not found: {args.show}")
		print()
	
	# Export script
	if args.script:
		script = manager.export_script(args.script)
		if script:
			print(script)
		else:
			print(f"Cutscene not found: {args.script}")
		print()
	
	# Statistics
	if args.stats:
		stats = manager.get_statistics()
		print("Statistics:")
		print(f"  Total cutscenes: {stats['total_cutscenes']}")
		print(f"  Total duration: ~{stats['total_duration']:.0f}s "
			  f"({stats['total_duration']/60:.1f} min)")
		print(f"  Total dialogue: {stats['total_dialogue']} lines")
		print(f"  Unique speakers: {stats['unique_speakers']}")
		if stats["speakers"]:
			print(f"    {', '.join(stats['speakers'])}")
		print()
	
	# Validate
	if args.validate:
		issues = manager.validate()
		if issues:
			print(f"Validation Issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("No validation issues found")
		print()
	
	# Export
	if args.export:
		manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
